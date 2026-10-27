"""
G-code Parsing Utilities

Utilities for parsing and modifying G-code lines.
"""

import re
from typing import List, Optional, Dict, Any, Tuple

class GCodeParser:
    """Utilities for parsing G-code"""
    
    @staticmethod
    def extract_coordinates(line: str) -> Dict[str, float]:
        """Extract X, Y, Z, E coordinates from G-code line"""
        coords = {}
        
        # Extract coordinates using regex
        patterns = {
            'X': r'X([\d\.-]+)',
            'Y': r'Y([\d\.-]+)', 
            'Z': r'Z([\d\.-]+)',
            'E': r'E([\d\.-]+)',
            'F': r'F([\d\.-]+)'  # Feed rate
        }
        
        for axis, pattern in patterns.items():
            match = re.search(pattern, line)
            if match:
                coords[axis] = float(match.group(1))
        
        return coords
    
    @staticmethod
    def is_movement_command(line: str) -> bool:
        """Check if line is a G1 movement command"""
        stripped = line.strip()
        return (stripped.startswith("G1") or " G1 " in stripped) and any(
            axis in stripped for axis in ["X", "Y", "Z", "E"]
        )
    
    @staticmethod
    def is_motion_line(line: str) -> bool:
        """Check if line is any G0-G3 command (travel, extrusion, arc, retract or feedrate-only)"""
        command = line.split(';')[0].strip()
        command = re.sub(r'^N\d+\s+', '', command)  # Strip line number (BambuStudio)
        return re.match(r'G[0-3](\s|$)', command) is not None
    
    @staticmethod
    def get_tool_change(line: str) -> Optional[str]:
        """Return "T<n>" for a filament tool change; ignores Bambu's T1000/T65535 utility commands"""
        command = line.split(';')[0].strip()
        command = re.sub(r'^N\d+\s+', '', command)
        match = re.match(r'^T(\d{1,2})$', command)
        return f"T{match.group(1)}" if match else None
    
    @staticmethod
    def get_feature(line: str) -> Optional[str]:
        """Return the feature name from a '; FEATURE: x' (Bambu/Orca) or ';TYPE:x' (Prusa) comment"""
        match = re.match(r'^(?:N\d+\s+)?;\s*(?:FEATURE|TYPE):\s*(.+)$', line.strip())
        return match.group(1).strip() if match else None
    
    @staticmethod
    def is_extrusion_move(line: str) -> bool:
        """Check if line is an extrusion move (G1 with E and X/Y)"""
        if not GCodeParser.is_movement_command(line):
            return False
        
        coords = GCodeParser.extract_coordinates(line)
        return 'E' in coords and ('X' in coords or 'Y' in coords)
    
    @staticmethod
    def is_z_move(line: str) -> bool:
        """Check if line is a Z movement"""
        return GCodeParser.is_movement_command(line) and 'Z' in line
    
    @staticmethod
    def is_tool_change(line: str) -> bool:
        """Check if line is a tool change command"""
        stripped = line.strip()
        return stripped.startswith(("T0", "T1", "T2", "T3", "T4"))
    
    @staticmethod
    def apply_coordinate_offset(line: str, x_offset: float = 0, y_offset: float = 0, z_offset: float = 0) -> str:
        """Apply coordinate offsets to G-code line"""
        if not GCodeParser.is_motion_line(line):
            return line
        
        result = line
        
        # Apply X offset
        if x_offset != 0:
            x_match = re.search(r'X([\d\.-]+)', result)
            if x_match:
                original_x = float(x_match.group(1))
                new_x = original_x + x_offset
                result = re.sub(r'X[\d\.-]+', f'X{new_x:.3f}', result)
        
        # Apply Y offset  
        if y_offset != 0:
            y_match = re.search(r'Y([\d\.-]+)', result)
            if y_match:
                original_y = float(y_match.group(1))
                new_y = original_y + y_offset
                result = re.sub(r'Y[\d\.-]+', f'Y{new_y:.3f}', result)
        
        # Apply Z offset
        if z_offset != 0:
            z_match = re.search(r'Z([\d\.-]+)', result)
            if z_match:
                original_z = float(z_match.group(1))
                new_z = original_z + z_offset
                result = re.sub(r'Z[\d\.-]+', f'Z{new_z:.3f}', result)
        
        return result
    
    @staticmethod
    def apply_extrusion_multiplier(line: str, multiplier: float) -> str:
        """Apply extrusion multiplier to E values"""
        if not GCodeParser.is_motion_line(line) or multiplier == 1.0:
            return line
        
        e_match = re.search(r'E([\d\.-]+)', line)
        if e_match:
            original_e = float(e_match.group(1))
            new_e = original_e * multiplier
            return re.sub(r'E[\d\.-]+', f'E{new_e:.5f}', line)
        
        return line
    
    @staticmethod
    def create_tool_change_sequence(tool: str, temp: int, fan_speed: int, comment: str = "") -> List[str]:
        """Create tool change command sequence"""
        lines = []
        
        # Tool change
        comment_suffix = f" ;{comment}" if comment else ""
        lines.append(f"{tool}{comment_suffix}")
        
        # Temperature setting
        lines.append(f"M104 {tool} S{temp}")
        
        # Fan speed setting (convert percentage to 0-255 range if needed)
        if fan_speed > 255:
            fan_speed = int(fan_speed * 2.55)  # Convert percentage to 0-255
        lines.append(f"M106 S{fan_speed}")
        
        return lines
    
    @staticmethod
    def create_mortar_layer_header(z_height: float, layer_number: Optional[int] = None) -> List[str]:
        """Create header for mortar layer"""
        lines = []
        lines.append(";LAYER_CHANGE_MORTAR")
        
        if layer_number is not None:
            lines.append(f";BRICK_MORTAR_LAYER {layer_number} at Z={z_height:.3f}")
        else:
            lines.append(f";BRICK_MORTAR_LAYER at Z={z_height:.3f}")
        
        lines.append(f"G1 Z{z_height:.3f} F600")
        
        return lines
    
    @staticmethod
    def extract_layer_moves(lines: List[str]) -> List[str]:
        """Extract movement commands from a layer"""
        moves = []
        for line in lines:
            if GCodeParser.is_extrusion_move(line):
                moves.append(line)
        return moves
    
    @staticmethod
    def validate_gcode_line(line: str) -> Tuple[bool, Optional[str]]:
        """Validate a G-code line for basic syntax"""
        stripped = line.strip()
        
        # Allow comments and empty lines
        if not stripped or stripped.startswith(';'):
            return True, None
        
        # Check for valid G-code commands (including line numbers)
        valid_prefixes = ['G', 'M', 'T', 'S', 'F', 'X', 'Y', 'Z', 'E', 'I', 'J', 'K', 'P', 'R', 'N']
        
        # Extract command part (before any comment)
        command_part = stripped.split(';')[0].strip()
        
        if not command_part:
            return True, None  # Comment-only line
        
        # Check if starts with valid command
        if not any(command_part.startswith(prefix) for prefix in valid_prefixes):
            return False, f"Invalid G-code command: {command_part}"
        
        # Basic coordinate validation for movement commands
        if command_part.startswith('G1'):
            coords = GCodeParser.extract_coordinates(command_part)
            for axis, value in coords.items():
                if axis in ['X', 'Y', 'Z', 'E'] and abs(value) > 10000:
                    return False, f"Coordinate value too large: {axis}{value}"
        
        return True, None