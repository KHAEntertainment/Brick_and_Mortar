#!/usr/bin/env python3
"""
Comprehensive Test Suite

Complete validation of the modular Brick & Mortar system.
Tests core logic, API endpoints, and distribution methods.
"""

import sys
import os
import subprocess
import tempfile
import json
from pathlib import Path

# Add project root to path
sys.path.insert(0, os.path.dirname(os.path.dirname(__file__)))

def create_test_gcode():
    """Create standard test G-code"""
    return [
        "; BambuStudio 1.9.0",
        "; Test G-code for validation",
        "G28 ; home all axes", 
        "G1 Z0.2 F600",
        ";LAYER_CHANGE",
        "M991 S0 P1 ; notify layer change 1",
        "G1 X10 Y10 E0.1 F1800",
        "G1 X20 Y10 E0.2 F1800",
        "G1 X20 Y20 E0.3 F1800",
        "G1 Z0.4 F600",
        "M991 S0 P2 ; notify layer change 2", 
        "G1 X10 Y20 E0.4 F1800",
        "G1 X10 Y10 E0.5 F1800",
        "G1 Z0.6 F600",
        "M991 S0 P3 ; notify layer change 3",
        "G1 X30 Y30 E0.6 F1800",
        "G1 X40 Y30 E0.7 F1800"
    ]

def test_core_processor():
    """Test core processor functionality"""
    print("🧪 Testing Core Processor")
    print("-" * 30)
    
    try:
        from core.processors.gcode_processor import GCodeProcessor
        from core.models.processing_params import ProcessingParams
        
        processor = GCodeProcessor()
        params = ProcessingParams.from_preset("PETG_TPU")
        test_gcode = create_test_gcode()
        
        # Test processing
        response = processor.process(test_gcode, params)
        
        if not response.success:
            print(f"❌ Core processing failed: {response.error}")
            return False
        
        # Validate output
        expected_checks = {
            "mortar_layers_added": response.processing_stats.mortar_layers_added > 0,
            "tool_changes": response.processing_stats.total_tool_changes > 0,
            "processed_lines": len(response.processed_gcode) > len(test_gcode),
            "preview_data": response.preview_data is not None,
            "processing_time": response.processing_stats.processing_time_ms is not None
        }
        
        all_passed = True
        for check, passed in expected_checks.items():
            status = "✅" if passed else "❌"
            print(f"   {status} {check}")
            if not passed:
                all_passed = False
        
        if all_passed:
            print(f"✅ Core processor: {response.processing_stats.mortar_layers_added} mortar layers added")
        
        return all_passed
        
    except Exception as e:
        print(f"❌ Core processor test failed: {e}")
        return False

def test_standalone_scripts():
    """Test standalone distribution scripts"""
    print("\n🧪 Testing Standalone Scripts")
    print("-" * 30)
    
    # Create test input file
    test_gcode = "\n".join(create_test_gcode())
    
    with tempfile.NamedTemporaryFile(mode='w', suffix='.gcode', delete=False) as f:
        f.write(test_gcode)
        input_file = f.name
    
    try:
        scripts_to_test = [
            ("brick_and_mortar.py", ["--validate-only"]),
            ("brick_and_mortar.py", []),
            ("brick_and_mortar_simple.py", [])
        ]
        
        all_passed = True
        
        for script_name, extra_args in scripts_to_test:
            script_path = script_name  # Scripts are now at project root
            
            with tempfile.NamedTemporaryFile(suffix='.gcode', delete=False) as f:
                output_file = f.name
            
            try:
                cmd = ["python3", script_path, input_file, output_file] + extra_args
                result = subprocess.run(cmd, capture_output=True, text=True, timeout=30)
                
                if result.returncode == 0:
                    print(f"   ✅ {script_name} successful")
                    
                    # For non-validation scripts, check output
                    if "--validate-only" not in extra_args:
                        if os.path.exists(output_file) and os.path.getsize(output_file) > 0:
                            with open(output_file, 'r') as f:
                                output_content = f.read()
                            if "BRICK_MORTAR_LAYER" in output_content:
                                print(f"      ✅ Output contains mortar layers")
                            else:
                                print(f"      ❌ Output missing mortar layers")
                                all_passed = False
                        else:
                            print(f"      ❌ No output file generated")
                            all_passed = False
                else:
                    print(f"   ❌ {script_name} failed: {result.stderr}")
                    all_passed = False
                
            except subprocess.TimeoutExpired:
                print(f"   ❌ {script_name} timed out")
                all_passed = False
            except Exception as e:
                print(f"   ❌ {script_name} error: {e}")
                all_passed = False
            finally:
                if os.path.exists(output_file):
                    os.unlink(output_file)
        
        return all_passed
        
    finally:
        os.unlink(input_file)

def test_parameter_presets():
    """Test parameter presets and validation"""
    print("\n🧪 Testing Parameter Presets")
    print("-" * 30)
    
    try:
        from core.models.processing_params import ProcessingParams
        
        presets = ["PETG_TPU", "PLA_PETG", "ABS_TPU"]
        all_passed = True
        
        for preset in presets:
            try:
                params = ProcessingParams.from_preset(preset)
                
                # Validate parameters are reasonable
                checks = {
                    "z_offset_positive": params.z_offset > 0,
                    "xy_shift_positive": params.xy_shift >= 0,
                    "temp_reasonable": 150 <= params.mortar_temp <= 300,
                    "multiplier_reasonable": 0.5 <= params.extrusion_multiplier <= 2.0,
                    "speed_reasonable": 50 <= params.mortar_speed <= 200
                }
                
                preset_passed = all(checks.values())
                status = "✅" if preset_passed else "❌"
                print(f"   {status} {preset}: temp={params.mortar_temp}°C, z_offset={params.z_offset}mm")
                
                if not preset_passed:
                    for check, passed in checks.items():
                        if not passed:
                            print(f"      ❌ {check} failed")
                    all_passed = False
                    
            except Exception as e:
                print(f"   ❌ {preset} preset failed: {e}")
                all_passed = False
        
        # Test invalid parameters
        try:
            ProcessingParams(z_offset=-0.1)
            print("   ❌ Should reject negative z_offset")
            all_passed = False
        except ValueError:
            print("   ✅ Correctly rejects invalid parameters")
        
        return all_passed
        
    except Exception as e:
        print(f"❌ Parameter preset test failed: {e}")
        return False

def test_slicer_detection():
    """Test slicer format detection"""
    print("\n🧪 Testing Slicer Detection")
    print("-" * 30)
    
    try:
        from core.processors.gcode_processor import GCodeProcessor
        
        processor = GCodeProcessor()
        
        test_cases = [
            (["; BambuStudio 1.9.0", "G28"], "bambu"),
            (["; OrcaSlicer 2.0", "G28"], "orca"),
            (["; PrusaSlicer 2.5", "G28"], "prusa"),
            (["G28", "G1 X0"], "unknown")
        ]
        
        all_passed = True
        
        for lines, expected in test_cases:
            info = processor.get_file_info(lines)
            detected = info["slicer_format"]
            
            if detected == expected:
                print(f"   ✅ {expected} detection working")
            else:
                print(f"   ❌ {expected} detection failed: got {detected}")
                all_passed = False
        
        return all_passed
        
    except Exception as e:
        print(f"❌ Slicer detection test failed: {e}")
        return False

def test_output_consistency():
    """Test output consistency across methods"""
    print("\n🧪 Testing Output Consistency")
    print("-" * 30)
    
    try:
        from core.processors.gcode_processor import GCodeProcessor
        from core.models.processing_params import ProcessingParams
        
        processor = GCodeProcessor()
        test_gcode = create_test_gcode()
        
        # Test multiple runs with same parameters
        params = ProcessingParams.from_preset("PETG_TPU")
        results = []
        
        for i in range(3):
            response = processor.process(test_gcode, params)
            if response.success:
                results.append({
                    "mortar_layers": response.processing_stats.mortar_layers_added,
                    "tool_changes": response.processing_stats.total_tool_changes,
                    "output_lines": len(response.processed_gcode)
                })
            else:
                print(f"   ❌ Run {i+1} failed: {response.error}")
                return False
        
        # Check consistency
        if len(set(r["mortar_layers"] for r in results)) == 1:
            print("   ✅ Consistent mortar layer count")
        else:
            print("   ❌ Inconsistent mortar layer count")
            return False
        
        if len(set(r["tool_changes"] for r in results)) == 1:
            print("   ✅ Consistent tool change count")
        else:
            print("   ❌ Inconsistent tool change count")
            return False
        
        if len(set(r["output_lines"] for r in results)) == 1:
            print("   ✅ Consistent output line count")
        else:
            print("   ❌ Inconsistent output line count")
            return False
        
        print(f"   📊 Results: {results[0]['mortar_layers']} mortar layers, {results[0]['tool_changes']} tool changes")
        return True
        
    except Exception as e:
        print(f"❌ Consistency test failed: {e}")
        return False

def test_error_handling():
    """Test error handling"""
    print("\n🧪 Testing Error Handling")
    print("-" * 30)
    
    try:
        from core.processors.gcode_processor import GCodeProcessor
        from core.models.processing_params import ProcessingParams
        
        processor = GCodeProcessor()
        params = ProcessingParams.from_preset("PETG_TPU")
        
        test_cases = [
            ([], "empty input"),
            (["INVALID_COMMAND"], "invalid G-code"),
            (["G1 X999999 Y999999"], "extreme coordinates")
        ]
        
        all_passed = True
        
        for test_input, description in test_cases:
            response = processor.process(test_input, params)
            
            if test_input == []:  # Empty input should fail
                if not response.success:
                    print(f"   ✅ Correctly handles {description}")
                else:
                    print(f"   ❌ Should reject {description}")
                    all_passed = False
            else:  # Other cases may succeed or fail gracefully
                status = "✅" if response.success else "⚠️ "
                print(f"   {status} Handles {description} (success: {response.success})")
        
        return all_passed
        
    except Exception as e:
        print(f"❌ Error handling test failed: {e}")
        return False

def generate_test_report(results):
    """Generate test report"""
    print("\n📊 Test Report")
    print("=" * 50)
    
    total_tests = len(results)
    passed_tests = sum(1 for passed in results.values() if passed)
    
    for test_name, passed in results.items():
        status = "✅ PASS" if passed else "❌ FAIL"
        print(f"{status} {test_name}")
    
    print(f"\nResults: {passed_tests}/{total_tests} tests passed")
    
    if passed_tests == total_tests:
        print("🎉 All tests passed! The modular system is working correctly.")
        return True
    else:
        print("❌ Some tests failed. Review the issues above.")
        return False

def main():
    """Run comprehensive test suite"""
    print("🧪 Comprehensive Test Suite - Brick & Mortar v2.0")
    print("=" * 60)
    
    tests = {
        "Core Processor": test_core_processor,
        "Standalone Scripts": test_standalone_scripts,
        "Parameter Presets": test_parameter_presets,
        "Slicer Detection": test_slicer_detection,
        "Output Consistency": test_output_consistency,
        "Error Handling": test_error_handling
    }
    
    results = {}
    
    for test_name, test_func in tests.items():
        try:
            results[test_name] = test_func()
        except Exception as e:
            print(f"\n❌ {test_name} crashed: {e}")
            import traceback
            traceback.print_exc()
            results[test_name] = False
    
    return generate_test_report(results)

if __name__ == "__main__":
    success = main()
    sys.exit(0 if success else 1)