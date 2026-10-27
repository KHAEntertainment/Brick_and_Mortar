#!/usr/bin/env python3
"""
Brick & Mortar CURL-based Processor

Python wrapper that calls the API via CURL for slicer integration.
This allows slicers to use the brick & mortar processing without local Python setup.

Usage: python3 curl_processor.py input.gcode output.gcode [--api-url URL]
"""

import sys
import os
import argparse
import subprocess
import json
import tempfile
from pathlib import Path

def parse_arguments():
    """Parse command line arguments"""
    parser = argparse.ArgumentParser(
        description="Brick & Mortar CURL-based Processor",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
This script calls the Brick & Mortar API via CURL, allowing slicer integration
without requiring local Python setup of the core processing logic.

Examples:
  %(prog)s input.gcode output.gcode
  %(prog)s input.gcode output.gcode --api-url http://localhost:9000
  %(prog)s input.gcode output.gcode --preset PLA_PETG --z-offset 0.15
        """
    )
    
    # Required arguments
    parser.add_argument("input_file", help="Input G-code file")
    parser.add_argument("output_file", help="Output G-code file")
    
    # API configuration
    parser.add_argument("--api-url", default="http://localhost:9000",
                       help="API base URL (default: http://localhost:9000)")
    parser.add_argument("--timeout", type=int, default=60,
                       help="Request timeout in seconds (default: 60)")
    
    # Processing parameters
    parser.add_argument("--preset", default="PETG_TPU",
                       choices=["PETG_TPU", "PLA_PETG", "ABS_TPU"],
                       help="Material preset (default: PETG_TPU)")
    parser.add_argument("--z-offset", type=float, default=0.1,
                       help="Z offset for mortar layers in mm (default: 0.1)")
    parser.add_argument("--xy-shift", type=float, default=0.2,
                       help="X/Y shift for brick pattern in mm (default: 0.2)")
    parser.add_argument("--mortar-temp", type=int, default=225,
                       help="Mortar (T1) temperature in °C (default: 225)")
    parser.add_argument("--mortar-speed", type=int, default=100,
                       help="Mortar speed percentage (default: 100)")
    parser.add_argument("--extrusion-multiplier", type=float, default=1.05,
                       help="Mortar extrusion multiplier (default: 1.05)")
    
    # Options
    parser.add_argument("--no-preview", action="store_true",
                       help="Skip preview data generation")
    parser.add_argument("--validate-only", action="store_true",
                       help="Only validate G-code, don't process")
    parser.add_argument("--quiet", action="store_true",
                       help="Minimal output")
    
    return parser.parse_args()

def check_api_health(api_url, timeout):
    """Check if API is accessible"""
    try:
        cmd = [
            "curl", "-s", "-m", str(timeout),
            f"{api_url}/api/health"
        ]
        
        result = subprocess.run(cmd, capture_output=True, text=True)
        
        if result.returncode == 0:
            try:
                health_data = json.loads(result.stdout)
                if health_data.get("status") == "healthy":
                    return True, health_data
            except json.JSONDecodeError:
                pass
        
        return False, result.stderr or "API not responding"
        
    except Exception as e:
        return False, str(e)

def validate_gcode_via_api(input_file, api_url, timeout):
    """Validate G-code via API"""
    try:
        cmd = [
            "curl", "-s", "-m", str(timeout),
            "-X", "POST",
            "-F", f"file=@{input_file}",
            f"{api_url}/api/validate"
        ]
        
        result = subprocess.run(cmd, capture_output=True, text=True)
        
        if result.returncode == 0:
            return json.loads(result.stdout)
        else:
            raise Exception(f"CURL failed: {result.stderr}")
            
    except Exception as e:
        raise Exception(f"Validation failed: {e}")

def process_gcode_via_api(input_file, args):
    """Process G-code via API"""
    try:
        # Build CURL command
        cmd = [
            "curl", "-s", "-m", str(args.timeout),
            "-X", "POST",
            "-F", f"file=@{input_file}",
            "-F", f"material_preset={args.preset}",
            "-F", f"z_offset={args.z_offset}",
            "-F", f"xy_shift={args.xy_shift}",
            "-F", f"mortar_temp={args.mortar_temp}",
            "-F", f"mortar_speed={args.mortar_speed}",
            "-F", f"extrusion_multiplier={args.extrusion_multiplier}",
            "-F", f"enable_preview={'false' if args.no_preview else 'true'}",
            f"{args.api_url}/api/process"
        ]
        
        result = subprocess.run(cmd, capture_output=True, text=True)
        
        if result.returncode == 0:
            return json.loads(result.stdout)
        else:
            raise Exception(f"CURL failed: {result.stderr}")
            
    except Exception as e:
        raise Exception(f"Processing failed: {e}")

def save_processed_gcode(response_data, output_file):
    """Save processed G-code from API response"""
    try:
        if not response_data.get("success"):
            raise Exception(response_data.get("error", "Unknown processing error"))
        
        processed_gcode = response_data.get("processed_gcode")
        if not processed_gcode:
            raise Exception("No processed G-code in response")
        
        # Create output directory if needed
        output_path = Path(output_file)
        output_path.parent.mkdir(parents=True, exist_ok=True)
        
        with open(output_file, 'w', encoding='utf-8') as f:
            f.write(processed_gcode)
        
        return response_data.get("processing_stats", {})
        
    except Exception as e:
        raise Exception(f"Cannot save output file: {e}")

def main():
    """Main processing function"""
    args = parse_arguments()
    
    if not args.quiet:
        print("🧱 Brick & Mortar CURL Processor v2.0")
        print("=" * 50)
    
    # Check if input file exists
    if not os.path.exists(args.input_file):
        print(f"ERROR: Input file not found: {args.input_file}")
        sys.exit(1)
    
    # Check API health
    if not args.quiet:
        print(f"🔍 Checking API health: {args.api_url}")
    
    is_healthy, health_info = check_api_health(args.api_url, args.timeout)
    if not is_healthy:
        print(f"ERROR: API not accessible: {health_info}")
        print(f"Make sure the API is running at: {args.api_url}")
        sys.exit(1)
    
    if not args.quiet:
        if isinstance(health_info, dict):
            version = health_info.get("version", "unknown")
            print(f"✅ API healthy (version: {version})")
        else:
            print("✅ API healthy")
    
    # Validate G-code
    if not args.quiet:
        print(f"📁 Validating: {args.input_file}")
    
    try:
        validation_result = validate_gcode_via_api(args.input_file, args.api_url, args.timeout)
        
        if not validation_result.get("valid"):
            print("❌ G-code validation failed:")
            for error in validation_result.get("errors", ["Unknown validation error"]):
                print(f"   - {error}")
            sys.exit(1)
        
        if not args.quiet:
            print(f"✅ Valid G-code:")
            print(f"   - Slicer: {validation_result.get('slicer_format', 'unknown')}")
            print(f"   - Layers: {validation_result.get('estimated_layers', 'unknown')}")
            print(f"   - Compatible: {validation_result.get('compatible', False)}")
        
    except Exception as e:
        print(f"ERROR: Validation failed: {e}")
        sys.exit(1)
    
    if args.validate_only:
        if not args.quiet:
            print("✅ Validation complete. Exiting (--validate-only specified).")
        return
    
    # Process G-code
    if not args.quiet:
        print("🔄 Processing G-code via API...")
        print(f"   - Preset: {args.preset}")
        print(f"   - Z offset: {args.z_offset}mm")
        print(f"   - XY shift: {args.xy_shift}mm")
    
    try:
        response_data = process_gcode_via_api(args.input_file, args)
        stats = save_processed_gcode(response_data, args.output_file)
        
        if not args.quiet:
            print(f"✅ Processing complete:")
            if stats:
                print(f"   - Mortar layers added: {stats.get('mortar_layers_added', 0)}")
                print(f"   - Total tool changes: {stats.get('total_tool_changes', 0)}")
                print(f"   - Processing time: {stats.get('processing_time_ms', 0):.1f}ms")
            print(f"💾 Saved to: {args.output_file}")
        else:
            # Quiet mode - just print success with basic stats
            mortar_layers = stats.get('mortar_layers_added', 0) if stats else 0
            print(f"SUCCESS: Added {mortar_layers} mortar layers")
        
    except Exception as e:
        print(f"ERROR: {e}")
        sys.exit(1)

if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        print("\n❌ Processing interrupted by user")
        sys.exit(1)