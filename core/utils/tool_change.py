"""
Tool Change Utilities

Reuses the printer's own tool-change sequence from the sliced G-code, so mortar
layers switch tools the way the slicer does. On a Bambu H2D that is the expanded
change_filament_gcode (M620 S<n>A ... T<n> ... M621 S<n>A), which handles the
nozzle swap, flush and filament settings that a bare "T1" skips.
"""

import re
from typing import Dict, List, Optional, Tuple
from .gcode_parser import GCodeParser
from .slicer_detection import SlicerDetector, SlicerFormat

class ToolChangeLibrary:
    """Tool-change sequences and heater mapping found in one sliced G-code file"""
    
    # How far around M620 to look for the boundaries of the slicer's sequence
    SEARCH_WINDOW = 40
    
    def __init__(self, templates: Dict[str, Tuple[List[str], float]], heater_map: Dict[str, int],
                 nozzle_temps: Optional[Dict[str, int]] = None):
        # templates: target tool ("T1") -> (sequence lines, layer Z it was sliced at)
        self.templates = templates
        self.heater_map = heater_map
        self.nozzle_temps = nozzle_temps or {}
    
    @staticmethod
    def _command(line: str) -> str:
        """Command part of a line, without line number or comment"""
        command = line.split(';')[0].strip()
        return re.sub(r'^N\d+\s+', '', command)
    
    @classmethod
    def from_gcode(cls, lines: List[str], slicer_format: SlicerFormat) -> "ToolChangeLibrary":
        """Find the first expanded tool change into each tool, plus the heater mapping"""
        templates: Dict[str, Tuple[List[str], float]] = {}
        layer_z = 0.0
        layer_z_from_comment = False
        
        for i, line in enumerate(lines):
            command = cls._command(line)
            
            # Track the current layer's print height, so the sequence's lift can be re-based later.
            # Prefer the slicer's comment ("; Z_HEIGHT: 0.2" Bambu/Orca, ";Z:0.2" Prusa): a layer
            # can start with a Z-hop above its print height.
            height = re.match(r'^(?:N\d+\s+)?;\s*(?:Z_HEIGHT|Z):\s*([\d\.]+)', line.strip())
            if height:
                layer_z = float(height.group(1))
                layer_z_from_comment = True
            elif SlicerDetector.detect_layer_change(line, slicer_format):
                if not layer_z_from_comment:
                    layer_z = float('inf')
            elif not layer_z_from_comment:
                z_match = re.match(r'G[01]\s+Z(-?[\d\.]+)', command)
                if z_match:
                    layer_z = min(layer_z, float(z_match.group(1)))
            
            change = re.match(r'M620 S(\d+)A$', command)
            if not change:
                continue
            tool = f"T{change.group(1)}"
            if tool in templates:
                continue
            
            # A real filament change follows "; filament end gcode"; start G-code doesn't
            start = None
            for j in range(i - 1, max(-1, i - cls.SEARCH_WINDOW), -1):
                if 'filament end gcode' in lines[j]:
                    start = j + 1
                    break
            if start is None:
                continue
            
            # End at M621 S<n>A, extended to the closing "gcode_claim_action : 0" if present
            end = None
            for j in range(i + 1, min(len(lines), i + 3 * cls.SEARCH_WINDOW)):
                if cls._command(lines[j]) == f"M621 S{change.group(1)}A":
                    end = j
                    break
            if end is None:
                continue
            for j in range(end + 1, min(len(lines), end + cls.SEARCH_WINDOW)):
                if 'gcode_claim_action : 0' in lines[j]:
                    end = j
                    break
            
            sequence = []
            for raw in lines[start:end + 1]:
                cleaned = re.sub(r'^N\d+\s*', '', raw.strip())
                # Drop blank lines and progress updates (M73), which belong to the original spot
                if not cleaned or cls._command(cleaned).startswith('M73'):
                    continue
                sequence.append(cleaned)
            templates[tool] = (sequence, layer_z)
        
        return cls(templates, cls._parse_heater_map(lines), cls._parse_nozzle_temps(lines))
    
    @staticmethod
    def _parse_nozzle_temps(lines: List[str]) -> Dict[str, int]:
        """Per-filament print temperature from the slicer config ("; nozzle_temperature = 255,240")"""
        for line in lines[:2000]:
            match = re.search(r';\s*nozzle_temperature\s*=\s*([\d,\s]+)$', line)
            if match:
                values = [v.strip() for v in match.group(1).split(',') if v.strip()]
                return {f"T{i}": int(v) for i, v in enumerate(values)}
        return {}
    
    @staticmethod
    def _parse_heater_map(lines: List[str]) -> Dict[str, int]:
        """Map filament tools to the heater index M104/M109 expect
        
        On a Bambu H2D, "M104 T<n>" addresses the physical nozzle, not the filament:
        filament_map gives each filament's (1-based) extruder, and
        physical_extruder_map turns that extruder into the physical nozzle.
        """
        filament_map = physical_map = None
        for line in lines[:2000]:
            match = re.search(r';\s*(filament_map|physical_extruder_map)\s*=\s*([\d,\s]+)$', line)
            if match:
                values = [int(v) for v in match.group(2).split(',') if v.strip()]
                if match.group(1) == 'filament_map':
                    filament_map = values
                else:
                    physical_map = values
        
        heater_map = {}
        if filament_map:
            for filament, extruder in enumerate(filament_map):
                logical = extruder - 1
                physical = physical_map[logical] if physical_map and logical < len(physical_map) else logical
                heater_map[f"T{filament}"] = physical
        return heater_map
    
    def has(self, tool: str) -> bool:
        """Whether the file contains a slicer tool-change sequence into this tool"""
        return tool in self.templates
    
    def heater_index(self, tool: str) -> int:
        """Heater index for M104 T<n>; defaults to the tool number"""
        return self.heater_map.get(tool, int(tool.lstrip('T')))
    
    def nozzle_temp(self, tool: str) -> Optional[int]:
        """Slicer's print temperature for this tool, if the config lists it"""
        return self.nozzle_temps.get(tool)
    
    def render(self, tool: str, z: float) -> List[str]:
        """Tool-change sequence into `tool`, with its Z moves re-based from the sliced layer to `z`"""
        sequence, source_z = self.templates[tool]
        return [
            GCodeParser.apply_coordinate_offset(line, 0, 0, z - source_z)
            if GCodeParser.is_motion_line(line) and 'Z' in GCodeParser.extract_coordinates(line)
            else line
            for line in sequence
        ]
