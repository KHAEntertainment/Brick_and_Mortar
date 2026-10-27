# alternate_tool_infill.py
# Version 0.6 - Debug version with error handling and logging

import re
import sys
import traceback
import os

# === CONFIGURATION ===
base_tool = "T0"                # Base material (PETG, ABS, ASA)
alt_tool = "T1"                 # Secondary material (TPU)
layer_height = 0.2              # mm, base slicer layer height
mortar_offset_z = layer_height / 2  # Mid-layer TPU offset (e.g., 0.1mm)
brick_offset_xy = 0.2           # DEBUG: Increased X/Y shift for visibility

enable_tool_settings = True
enable_top_bottom_tool_layers = False  # Toggle for future expansion

# Overextrusion for mortar layers
overextrude_mortar = True
mortar_extrusion_factor = 1.05  # 5% more extrusion

tool_settings = {
    "T1": {
        "nozzle_temp": 225,
        "fan_speed": 128
    }
}

def log_debug(message):
    """Write debug messages to a log file"""
    try:
        log_path = os.path.join(os.path.dirname(__file__), "debug", "script_debug.log")
        os.makedirs(os.path.dirname(log_path), exist_ok=True)
        with open(log_path, "a") as f:
            f.write(f"{message}\n")
    except:
        pass  # Don't let logging errors crash the script

# === SCRIPT LOGIC ===
def process_gcode(lines):
    processed_lines = []
    z_height = 0.0
    prev_z = 0.0
    infill_block = []
    current_layer_lines = []
    in_infill_capture = False
    layers_processed = 0
    mortar_layers_added = 0

    log_debug(f"Starting processing of {len(lines)} lines")

    for i, line in enumerate(lines):
        stripped = line.strip()

        # Handle Z moves (with or without line numbers)
        if "G1 Z" in stripped:
            z_match = re.search(r"Z([\d\.]+)", stripped)
            if z_match:
                z_height = float(z_match.group(1))
                # Insert mortar after previous layer
                if prev_z > 0 and infill_block:
                    mortar_z = prev_z + mortar_offset_z
                    mortar_lines = insert_mortar_layer(infill_block, mortar_z)
                    processed_lines.extend(mortar_lines)
                    mortar_layers_added += 1
                    log_debug(f"Inserted mortar layer {mortar_layers_added} at Z={mortar_z:.3f}, added {len(mortar_lines)} lines")
                    infill_block = []
            prev_z = z_height
            processed_lines.append(line)
            continue

        # Accumulate current layer G1 infill-like lines (handle line numbers)
        # BambuStudio format: "N123 G1 X... Y... E..."
        if ((stripped.startswith("G1") or (" G1 " in stripped)) and 
            "E" in stripped and ("X" in stripped or "Y" in stripped)):
            current_layer_lines.append(line)

        # BambuStudio layer change detection
        if "M991 S0 P" in stripped and "notify layer change" in stripped and current_layer_lines:
            infill_block = current_layer_lines.copy()
            current_layer_lines = []
            layers_processed += 1
            log_debug(f"Layer change {layers_processed} detected, captured {len(infill_block)} moves")

        processed_lines.append(line)

    log_debug(f"Processing complete: {layers_processed} layers, {mortar_layers_added} mortar layers added")
    return processed_lines


def insert_mortar_layer(infill_lines, z_mortar):
    lines = []
    lines.append(f";LAYER_CHANGE_MORTAR")
    lines.append(f";BRICK_MORTAR_LAYER at Z={z_mortar:.3f}")
    lines.append(f"G1 Z{z_mortar:.3f} F600")
    lines.append(f"{alt_tool} ;TOOL_CHANGE:1 ; Switch to TPU mortar")

    if enable_tool_settings and alt_tool in tool_settings:
        settings = tool_settings[alt_tool]
        lines.append(f"M104 {alt_tool} S{settings['nozzle_temp']}")
        lines.append(f"M106 S{settings['fan_speed']}")

    for line in infill_lines:
        if line.startswith("G1") and ("X" in line or "Y" in line):
            line = apply_brick_offset(line, brick_offset_xy)
            if overextrude_mortar and "E" in line:
                line = apply_extrusion_multiplier(line, mortar_extrusion_factor)
        lines.append(line)

    lines.append(f"{base_tool} ;TOOL_CHANGE:0 ; Revert to base tool")
    return lines


def apply_brick_offset(line, offset):
    x_match = re.search(r"X([\d\.]+)", line)
    y_match = re.search(r"Y([\d\.]+)", line)

    if x_match:
        x_val = float(x_match.group(1)) + offset
        line = re.sub(r"X[\d\.]+", f"X{x_val:.3f}", line)
    if y_match:
        y_val = float(y_match.group(1)) + offset
        line = re.sub(r"Y[\d\.]+", f"Y{y_val:.3f}", line)

    return line


def apply_extrusion_multiplier(line, factor):
    e_match = re.search(r"E([\d\.]+)", line)
    if e_match:
        original_e = float(e_match.group(1))
        new_e = original_e * factor
        line = re.sub(r"E[\d\.]+", f"E{new_e:.5f}", line)
    return line


# === ENTRY POINT ===
if __name__ == "__main__":
    try:
        log_debug(f"Script started with args: {sys.argv}")
        
        # Handle BambuStudio's argument passing behavior
        if len(sys.argv) == 4 and sys.argv[1] == '{input_file}' and sys.argv[2] == '{output_file}':
            # BambuStudio passes literal {input_file} {output_file} then the actual file
            input_file = sys.argv[3]
            # Generate output filename
            base_name = os.path.splitext(input_file)[0]
            output_file = f"{base_name}_processed.gcode"
            log_debug(f"BambuStudio mode: using {input_file} -> {output_file}")
        elif len(sys.argv) == 3:
            # Normal command line usage
            input_file = sys.argv[1]
            output_file = sys.argv[2]
            log_debug(f"Command line mode: {input_file} -> {output_file}")
        else:
            error_msg = f"Usage: python alternate_tool_infill.py input.gcode output.gcode. Got {len(sys.argv)} args: {sys.argv}"
            log_debug(f"ERROR: {error_msg}")
            print(error_msg)
            sys.exit(1)
        
        log_debug(f"Input file: {input_file}")
        log_debug(f"Output file: {output_file}")

        if not os.path.exists(input_file):
            error_msg = f"ERROR: Input file does not exist: {input_file}"
            log_debug(error_msg)
            print(error_msg)
            sys.exit(1)

        with open(input_file, 'r') as f:
            lines = f.readlines()

        log_debug(f"Read {len(lines)} lines from input file")

        new_lines = process_gcode(lines)

        with open(output_file, 'w') as f:
            f.writelines(new_lines)

        success_msg = f"Processed file saved to {output_file}. Original: {len(lines)} lines, New: {len(new_lines)} lines"
        log_debug(success_msg)
        print(success_msg)
        
    except Exception as e:
        error_msg = f"FATAL ERROR: {str(e)}\n{traceback.format_exc()}"
        log_debug(error_msg)
        print(error_msg)
        sys.exit(1)