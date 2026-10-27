#!/usr/bin/env python3
"""
Brick & Mortar Simple Script v2.0

Clean, minimal output version for production use.

Usage: python3 brick_and_mortar_simple.py input.gcode output.gcode
"""

import sys
import os
from pathlib import Path

# Add current directory to path for core module access
script_dir = Path(__file__).parent
sys.path.insert(0, str(script_dir))

try:
    from core.processors.gcode_processor import GCodeProcessor
    from core.models.processing_params import ProcessingParams
except ImportError as e:
    print(f"ERROR: Cannot import core modules: {e}")
    sys.exit(1)

def main():
    """Simple main with minimal output"""
    if len(sys.argv) != 3:
        print("Usage: python3 brick_and_mortar_simple.py input.gcode output.gcode")
        sys.exit(1)
    
    input_file = sys.argv[1]
    output_file = sys.argv[2]
    
    # Load input
    try:
        with open(input_file, 'r') as f:
            lines = f.readlines()
    except Exception as e:
        print(f"ERROR: Cannot read input file: {e}")
        sys.exit(1)
    
    # Process
    processor = GCodeProcessor()
    params = ProcessingParams.from_preset("PETG_TPU")
    params.enable_preview = False  # Skip preview for speed
    
    response = processor.process(lines, params)
    
    if not response.success:
        print(f"ERROR: {response.error}")
        sys.exit(1)
    
    # Save output
    try:
        with open(output_file, 'w') as f:
            f.write('\n'.join(response.processed_gcode))
        print(f"SUCCESS: Added {response.processing_stats.mortar_layers_added} mortar layers")
    except Exception as e:
        print(f"ERROR: Cannot save output file: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()