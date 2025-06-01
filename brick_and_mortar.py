# alternate_tool_infill.py
# Version 0.4 - Brick-Twist Hybrid Mode + Overextrusion Support
# Adds mid-layer TPU "mortar" between PETG structural layers using Z-offset and X/Y stagger

import re

# === CONFIGURATION ===
base_tool = "T0"                # Base material (PETG, ABS, ASA)
alt_tool = "T1"                 # Secondary material (TPU)
layer_height = 0.2              # mm, base slicer layer height
mortar_offset_z = layer_height / 2  # Mid-layer TPU offset (e.g., 0.1mm)
brick_offset_xy = 0.25          # X/Y shift for TPU interlock

enable_tool_settings = True
enable_top_bottom_tool_layers = False  # Toggle for future expansion

# New: Overextrusion for mortar layers
overextrude_mortar = True
mortar_extrusion_factor = 1.05  # 5% more extrusion

tool_settings = {
    "T1": {
        "nozzle_temp": 225,
        "fan_speed": 128
    }
}

# === SCRIPT LOGIC ===
def process_gcode(lines):
    processed_lines = []
    current_layer = 0
    current_tool = base_tool
    z_height = 0.0
    infill_block = []
    capture_infill = False

    for i, line in enumerate(lines):
        stripped = line.strip()

        # Detect and track base layer
        if stripped.startswith(";LAYER:"):
            current_layer = int(stripped.split(":")[1])
            processed_lines.append(line)
            continue

        if stripped.startswith("G1 Z"):
            z_match = re.search(r"Z([\d\.]+)", stripped)
            if z_match:
                z_height = float(z_match.group(1))
            processed_lines.append(line)
            continue

        # Capture infill blocks to reuse at Z+offset
        if stripped.startswith(";TYPE:INFILL") and current_layer > 0:
            capture_infill = True
            infill_block = [line]
            processed_lines.append(line)
            continue

        if capture_infill:
            if stripped.startswith(";TYPE:") or stripped.startswith(";LAYER:"):
                capture_infill = False
                # Insert synthetic TPU layer after this one
                z_mortar = z_height + mortar_offset_z
                processed_lines.extend(insert_mortar_layer(infill_block, z_mortar))
                infill_block = []
            else:
                infill_block.append(line)

        processed_lines.append(line)

    return processed_lines


def insert_mortar_layer(infill_lines, z_mortar):
    lines = []
    lines.append(f";BRICK_MORTAR_LAYER at Z={z_mortar:.3f}")
    lines.append(f"G1 Z{z_mortar:.3f} F600")
    lines.append(f"{alt_tool} ; Switch to TPU mortar")

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

    lines.append(f"{base_tool} ; Revert to base tool")
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
    import sys

    if len(sys.argv) != 3:
        print("Usage: python alternate_tool_infill.py input.gcode output.gcode")
        sys.exit(1)

    input_file = sys.argv[1]
    output_file = sys.argv[2]

    with open(input_file, 'r') as f:
        lines = f.readlines()

    new_lines = process_gcode(lines)

    with open(output_file, 'w') as f:
        f.writelines(new_lines)

    print(f"Processed file saved to {output_file}")
