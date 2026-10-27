#!/usr/bin/env python3
"""Test script for the Brick & Mortar API"""

import sys
import os
sys.path.append(os.path.dirname(__file__))

from main import GCodeProcessor, ProcessingParams

def test_processor():
    """Test the G-code processor with sample data"""
    processor = GCodeProcessor()
    
    # Sample G-code lines (simplified)
    sample_gcode = [
        "; BambuStudio 02.01.00.59",
        "G28 ; home",
        "M991 S0 P1 ;notify layer change",
        "G1 Z0.2 F600",
        "G1 X100 Y100 E1.0 F1200",
        "G1 X110 Y100 E1.1 F1200", 
        "M991 S0 P2 ;notify layer change",
        "G1 Z0.4 F600",
        "G1 X100 Y110 E2.0 F1200",
        "G1 X110 Y110 E2.1 F1200"
    ]
    
    print("Testing G-code processor...")
    
    # Test slicer detection
    slicer_format = processor.detect_slicer_format(sample_gcode)
    print(f"Detected slicer format: {slicer_format}")
    
    # Test preview generation
    preview_data = processor.parse_gcode_for_preview(sample_gcode)
    print(f"Preview data generated: {len(preview_data['layers'])} layers, {len(preview_data['tool_changes'])} tool changes")
    
    # Test processing
    params = ProcessingParams(
        z_offset=0.1,
        xy_shift=0.2,
        mortar_temp=225
    )
    
    processed_lines, preview_data, stats = processor.process_gcode(sample_gcode, params)
    
    print(f"Processing complete:")
    print(f"  Original lines: {stats['original_lines']}")
    print(f"  Processed lines: {stats['processed_lines']}")
    print(f"  Mortar layers added: {stats['mortar_layers_added']}")
    print(f"  Slicer format: {stats['slicer_format']}")
    
    # Check for mortar layer markers
    mortar_layers = [line for line in processed_lines if "BRICK_MORTAR_LAYER" in line]
    print(f"  Mortar layer markers found: {len(mortar_layers)}")
    
    return True

if __name__ == "__main__":
    try:
        success = test_processor()
        if success:
            print("\n✅ API processor test passed!")
        else:
            print("\n❌ API processor test failed!")
            sys.exit(1)
    except Exception as e:
        print(f"\n❌ Test failed with error: {e}")
        sys.exit(1)