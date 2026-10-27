#!/usr/bin/env python3
"""
Brick & Mortar Debug Script v2.0

Debug version with verbose output for troubleshooting.

Usage: python3 brick_and_mortar_debug.py input.gcode output.gcode
"""

import sys
from pathlib import Path

# Add current directory to path for module access
script_dir = Path(__file__).parent
sys.path.insert(0, str(script_dir))

# Import the main function from the primary script
try:
    from brick_and_mortar import main as base_main
except ImportError as e:
    print(f"ERROR: Cannot import main script: {e}")
    sys.exit(1)

def main():
    """Debug main with forced debug mode"""
    # Override sys.argv to force debug mode
    if "--debug" not in sys.argv:
        sys.argv.append("--debug")
    
    print("🐛 Brick & Mortar DEBUG MODE")
    print("=" * 50)
    print("This version provides verbose output for troubleshooting.")
    print("")
    
    base_main()

if __name__ == "__main__":
    main()