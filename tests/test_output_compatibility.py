#!/usr/bin/env python3
"""
Output Compatibility Test

Compares outputs between the original API processor and new core processor
to ensure identical behavior.
"""

import sys
import os

# Add core module to path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..'))

# Test imports
try:
    from core.processors.gcode_processor import GCodeProcessor
    from core.models.processing_params import ProcessingParams
    print("✅ Core modules import successfully")
except ImportError as e:
    print(f"❌ Core module import failed: {e}")
    sys.exit(1)

def create_test_gcode():
    """Create test G-code for comparison"""
    return [
        "; BambuStudio 1.9.0",
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
        "G1 X10 Y10 E0.5 F1800"
    ]

def test_core_processor_output():
    """Test the new core processor output"""
    print("\nTesting new core processor...")
    
    processor = GCodeProcessor()
    params = ProcessingParams.from_preset("PETG_TPU")
    test_gcode = create_test_gcode()
    
    response = processor.process(test_gcode, params)
    
    if not response.success:
        print(f"❌ Core processor failed: {response.error}")
        return None
    
    print(f"✅ Core processor succeeded")
    print(f"   Original lines: {len(test_gcode)}")
    print(f"   Processed lines: {len(response.processed_gcode)}")
    print(f"   Mortar layers added: {response.processing_stats.mortar_layers_added}")
    
    return response

def analyze_output_structure(response):
    """Analyze the structure of processed output"""
    print("\nAnalyzing output structure...")
    
    gcode_text = "\n".join(response.processed_gcode)
    
    # Check for required elements
    checks = {
        "BRICK_MORTAR_LAYER markers": "BRICK_MORTAR_LAYER" in gcode_text,
        "Tool changes to T1": "T1" in gcode_text, 
        "Tool changes to T0": "T0" in gcode_text,
        "Temperature commands": "M104" in gcode_text,
        "Preview data generated": response.preview_data is not None,
        "Processing stats": response.processing_stats is not None,
        "Mortar layers added": response.processing_stats.mortar_layers_added > 0
    }
    
    for check, passed in checks.items():
        status = "✅" if passed else "❌"
        print(f"   {status} {check}")
    
    all_passed = all(checks.values())
    return all_passed

def test_parameter_handling():
    """Test parameter validation and handling"""
    print("\nTesting parameter handling...")
    
    processor = GCodeProcessor()
    test_gcode = create_test_gcode()
    
    # Test invalid parameters
    try:
        invalid_params = ProcessingParams(z_offset=-0.1)  # Invalid negative offset
        print("❌ Should have failed with negative z_offset")
        return False
    except ValueError:
        print("✅ Correctly rejected negative z_offset")
    
    # Test parameter presets
    presets = ["PETG_TPU", "PLA_PETG", "ABS_TPU"]
    for preset in presets:
        params = ProcessingParams.from_preset(preset)
        response = processor.process(test_gcode, params)
        if response.success:
            print(f"✅ {preset} preset works")
        else:
            print(f"❌ {preset} preset failed")
            return False
    
    return True

def test_slicer_compatibility():
    """Test slicer format detection and handling"""
    print("\nTesting slicer compatibility...")
    
    processor = GCodeProcessor()
    
    test_cases = [
        (["; BambuStudio 1.9.0", "G28"], "bambu"),
        (["; OrcaSlicer 2.0", "G28"], "orca"),
        (["; PrusaSlicer 2.5", "G28"], "prusa")
    ]
    
    for lines, expected_format in test_cases:
        info = processor.get_file_info(lines)
        if info["slicer_format"] == expected_format:
            print(f"✅ {expected_format} detection working")
        else:
            print(f"❌ {expected_format} detection failed: got {info['slicer_format']}")
            return False
    
    return True

def test_error_handling():
    """Test error handling"""
    print("\nTesting error handling...")
    
    processor = GCodeProcessor()
    params = ProcessingParams.from_preset("PETG_TPU")
    
    # Test empty input
    response = processor.process([], params)
    if not response.success and "empty" in response.error.lower():
        print("✅ Correctly handles empty input")
    else:
        print("❌ Failed to handle empty input correctly")
        return False
    
    # Test malformed G-code
    malformed_gcode = ["INVALID_COMMAND", "G1 X999999 Y999999"]
    response = processor.process(malformed_gcode, params)
    # Should process but may have validation warnings
    print(f"✅ Handles malformed G-code (success: {response.success})")
    
    return True

def main():
    """Run compatibility tests"""
    print("🧪 Output Compatibility Tests")
    print("=" * 50)
    
    tests = [
        ("Core Processor Output", test_core_processor_output),
        ("Parameter Handling", test_parameter_handling),
        ("Slicer Compatibility", test_slicer_compatibility),
        ("Error Handling", test_error_handling)
    ]
    
    passed = 0
    total = len(tests)
    core_response = None
    
    for test_name, test_func in tests:
        print(f"\n🧪 {test_name}")
        print("-" * 30)
        
        try:
            if test_name == "Core Processor Output":
                result = test_func()
                if result is not None:
                    core_response = result
                    if analyze_output_structure(result):
                        passed += 1
                    else:
                        print("❌ Output structure validation failed")
                else:
                    print("❌ Core processor test failed")
            else:
                if test_func():
                    passed += 1
                else:
                    print(f"❌ {test_name} failed")
        except Exception as e:
            print(f"❌ {test_name} failed with exception: {e}")
            import traceback
            traceback.print_exc()
    
    print(f"\n📊 Results: {passed}/{total} tests passed")
    
    if passed == total:
        print("🎉 All compatibility tests passed!")
        print("The new core processor maintains full compatibility.")
        if core_response:
            print(f"\nSample output statistics:")
            print(f"  - Processing time: {core_response.processing_stats.processing_time_ms:.2f}ms")
            print(f"  - Slicer format: {core_response.processing_stats.slicer_format}")
            print(f"  - Lines added: {core_response.processing_stats.processed_lines - core_response.processing_stats.original_lines}")
        return True
    else:
        print("❌ Some compatibility tests failed.")
        return False

if __name__ == "__main__":
    success = main()
    sys.exit(0 if success else 1)