#!/usr/bin/env python3
"""
Core Processor Validation Test

Tests the unified core processor against known working examples.
"""

import sys
import os

# Add core module to path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..'))

from core.processors.gcode_processor import GCodeProcessor
from core.models.processing_params import ProcessingParams

def test_basic_processing():
    """Test basic G-code processing functionality"""
    print("Testing basic G-code processing...")
    
    # Sample G-code with layer changes
    sample_gcode = [
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
    
    processor = GCodeProcessor()
    params = ProcessingParams.from_preset("PETG_TPU")
    params.debug_mode = True
    
    response = processor.process(sample_gcode, params)
    
    assert response.success, f"Processing failed: {response.error}"
    assert response.processing_stats is not None
    assert response.processing_stats.mortar_layers_added > 0
    assert len(response.processed_gcode) > len(sample_gcode)
    
    # Check for mortar layer markers
    gcode_text = "\n".join(response.processed_gcode)
    assert "BRICK_MORTAR_LAYER" in gcode_text
    assert "T1" in gcode_text  # Tool change to mortar
    assert "T0" in gcode_text  # Tool change back
    
    print(f"✅ Basic processing test passed")
    print(f"   Original lines: {len(sample_gcode)}")
    print(f"   Processed lines: {len(response.processed_gcode)}")
    print(f"   Mortar layers added: {response.processing_stats.mortar_layers_added}")
    
def test_slicer_detection():
    """Test slicer format detection"""
    print("\nTesting slicer detection...")
    
    test_cases = [
        (["; BambuStudio 1.9.0", "G28"], "bambu"),
        (["; OrcaSlicer 2.0", "G28"], "orca"), 
        (["; PrusaSlicer 2.5", "G28"], "prusa"),
        (["G28", "G1 X0"], "unknown")
    ]
    
    processor = GCodeProcessor()
    
    for lines, expected in test_cases:
        info = processor.get_file_info(lines)
        assert info["slicer_format"] == expected, f"Expected {expected}, got {info['slicer_format']}"
        print(f"   ✅ {expected} detection working")

def test_parameter_presets():
    """Test parameter presets"""
    print("\nTesting parameter presets...")
    
    presets = ["PETG_TPU", "PLA_PETG", "ABS_TPU"]
    
    for preset_name in presets:
        params = ProcessingParams.from_preset(preset_name)
        assert params.material_preset == preset_name
        assert params.z_offset > 0
        assert params.extrusion_multiplier > 0
        print(f"   ✅ {preset_name} preset valid")

def test_validation():
    """Test G-code validation"""
    print("\nTesting G-code validation...")
    
    processor = GCodeProcessor()
    
    # Valid G-code
    valid_gcode = [
        "; BambuStudio test",
        "G28",
        "G1 X10 Y10 Z0.2 E0.1",
        "M991 S0 P1 ; notify layer change"
    ]
    
    is_valid, errors = processor.validate_gcode(valid_gcode)
    assert is_valid, f"Valid G-code rejected: {errors}"
    print("   ✅ Valid G-code accepted")
    
    # Invalid G-code  
    invalid_gcode = []  # Empty
    is_valid, errors = processor.validate_gcode(invalid_gcode)
    assert not is_valid, "Empty G-code should be invalid"
    print("   ✅ Invalid G-code rejected")

def test_with_real_file():
    """Test with a real G-code file if available"""
    print("\nTesting with real G-code file...")
    
    test_file = "backups/original-versions/test_examples/Cube_PETG_48m53s.gcode"
    
    if os.path.exists(test_file):
        print(f"   Using test file: {test_file}")
        
        with open(test_file, 'r') as f:
            lines = f.readlines()
        
        processor = GCodeProcessor()
        params = ProcessingParams.from_preset("PETG_TPU")
        
        # Test validation
        is_valid, errors = processor.validate_gcode(lines)
        print(f"   File validation: {'✅ Valid' if is_valid else '❌ Invalid'}")
        if errors:
            print(f"   Validation errors: {errors[:3]}")  # Show first 3 errors
        
        # Test file info
        info = processor.get_file_info(lines)
        print(f"   Slicer format: {info['slicer_format']}")
        print(f"   Estimated layers: {info['estimated_layers']}")
        print(f"   Layer height: {info['estimated_layer_height']}mm")
        
        # Test processing (just validation, not full processing due to size)
        if len(lines) < 10000:  # Only process smaller files fully
            response = processor.process(lines, params)
            if response.success:
                print(f"   ✅ Processing successful")
                print(f"   Mortar layers added: {response.processing_stats.mortar_layers_added}")
            else:
                print(f"   ❌ Processing failed: {response.error}")
    else:
        print(f"   Test file not found: {test_file}")
        print("   ⚠️  Skipping real file test")

def main():
    """Run all tests"""
    print("🧪 Core Processor Validation Tests")
    print("=" * 50)
    
    try:
        test_basic_processing()
        test_slicer_detection()  
        test_parameter_presets()
        test_validation()
        test_with_real_file()
        
        print("\n🎉 All tests passed!")
        print("Core processor is working correctly.")
        return True
        
    except Exception as e:
        print(f"\n❌ Test failed: {e}")
        import traceback
        traceback.print_exc()
        return False

if __name__ == "__main__":
    success = main()
    sys.exit(0 if success else 1)