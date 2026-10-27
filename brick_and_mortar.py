#!/usr/bin/env python3
"""
Brick & Mortar Standalone Script v2.0

Unified standalone script using the core processing logic.
For direct slicer post-processing integration.

Usage: python3 brick_and_mortar.py input.gcode output.gcode [options]
"""

import sys
import os
import argparse
from pathlib import Path

# Add current directory to path for core module access
script_dir = Path(__file__).parent
sys.path.insert(0, str(script_dir))

try:
    from core.processors.gcode_processor import GCodeProcessor
    from core.models.processing_params import ProcessingParams
except ImportError as e:
    print(f"ERROR: Cannot import core modules. Please ensure you're running from the correct directory.")
    print(f"Import error: {e}")
    sys.exit(1)

def parse_arguments():
    """Parse command line arguments"""
    parser = argparse.ArgumentParser(
        description="Brick & Mortar G-code Processor v2.0",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  %(prog)s input.gcode output.gcode
  %(prog)s input.gcode output.gcode --preset PLA_PETG
  %(prog)s input.gcode output.gcode --z-offset 0.15 --xy-shift 0.3
  %(prog)s input.gcode output.gcode --mortar-temp 235 --debug
        """
    )
    
    # Required arguments
    parser.add_argument("input_file", help="Input G-code file")
    parser.add_argument("output_file", help="Output G-code file")
    
    # Material preset
    parser.add_argument("--preset", default="PETG_TPU",
                       choices=["PETG_TPU", "PLA_PETG", "ABS_TPU"],
                       help="Material preset (default: PETG_TPU)")
    
    # Processing parameters
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
    parser.add_argument("--debug", action="store_true",
                       help="Enable debug output")
    parser.add_argument("--validate-only", action="store_true",
                       help="Only validate G-code, don't process")
    
    return parser.parse_args()

def load_gcode_file(filepath):
    """Load G-code file"""
    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            return f.readlines()
    except FileNotFoundError:
        print(f"ERROR: Input file not found: {filepath}")
        sys.exit(1)
    except UnicodeDecodeError:
        print(f"ERROR: Invalid text encoding in file: {filepath}")
        sys.exit(1)
    except Exception as e:
        print(f"ERROR: Cannot read input file: {e}")
        sys.exit(1)

def save_gcode_file(filepath, lines):
    """Save processed G-code file"""
    try:
        # Create output directory if it doesn't exist
        output_path = Path(filepath)
        output_path.parent.mkdir(parents=True, exist_ok=True)
        
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write('\n'.join(lines))
        
        print(f"✅ Processed G-code saved to: {filepath}")
    except Exception as e:
        print(f"ERROR: Cannot save output file: {e}")
        sys.exit(1)

def main():
    """Main processing function"""
    args = parse_arguments()
    
    print("🧱 Brick & Mortar G-code Processor v2.0")
    print("=" * 50)
    
    # Load input file
    print(f"📁 Loading: {args.input_file}")
    lines = load_gcode_file(args.input_file)
    print(f"   Read {len(lines)} lines")
    
    # Initialize processor
    processor = GCodeProcessor()
    
    # Validate G-code
    print("🔍 Validating G-code...")
    is_valid, errors = processor.validate_gcode(lines)
    
    if not is_valid:
        print("❌ G-code validation failed:")
        for error in errors:
            print(f"   - {error}")
        sys.exit(1)
    
    # Get file info
    info = processor.get_file_info(lines)
    print(f"✅ Valid G-code detected:")
    print(f"   - Slicer: {info['slicer_format']}")
    print(f"   - Estimated layers: {info['estimated_layers']}")
    print(f"   - Layer height: {info['estimated_layer_height']}mm")
    print(f"   - Compatibility: {info['compatibility']['confidence']}")
    
    if args.validate_only:
        print("✅ Validation complete. Exiting (--validate-only specified).")
        return
    
    # Create processing parameters
    if args.preset != "PETG_TPU":
        params = ProcessingParams.from_preset(args.preset)
        print(f"📋 Using preset: {args.preset}")
    else:
        params = ProcessingParams()
    
    # Override with command line arguments
    params.z_offset = args.z_offset
    params.xy_shift = args.xy_shift
    params.mortar_temp = args.mortar_temp
    params.mortar_speed = args.mortar_speed
    params.extrusion_multiplier = args.extrusion_multiplier
    params.enable_preview = not args.no_preview
    params.debug_mode = args.debug
    
    print(f"⚙️  Processing parameters:")
    print(f"   - Z offset: {params.z_offset}mm")
    print(f"   - XY shift: {params.xy_shift}mm") 
    print(f"   - Mortar temp: {params.mortar_temp}°C")
    print(f"   - Extrusion multiplier: {params.extrusion_multiplier}x")
    
    # Process G-code
    print("🔄 Processing G-code...")
    response = processor.process(lines, params)
    
    if not response.success:
        print(f"❌ Processing failed: {response.error}")
        sys.exit(1)
    
    # Print results
    stats = response.processing_stats
    print(f"✅ Processing complete:")
    print(f"   - Original layers: {stats.original_layers}")
    print(f"   - Mortar layers added: {stats.mortar_layers_added}")
    print(f"   - Total tool changes: {stats.total_tool_changes}")
    print(f"   - Processing time: {stats.processing_time_ms:.1f}ms")
    print(f"   - Lines: {stats.original_lines} → {stats.processed_lines} (+{stats.processed_lines - stats.original_lines})")
    
    # Save output
    print(f"💾 Saving to: {args.output_file}")
    save_gcode_file(args.output_file, response.processed_gcode)
    
    print("\n🎉 Brick & Mortar processing complete!")
    print(f"   Your multi-material G-code is ready: {args.output_file}")

if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        print("\n❌ Processing interrupted by user")
        sys.exit(1)
    except Exception as e:
        print(f"\n❌ Unexpected error: {e}")
        import traceback
        traceback.print_exc()
        sys.exit(1)