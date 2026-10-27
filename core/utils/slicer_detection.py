"""
Slicer Detection Utilities

Detects slicer format and provides format-specific parsing logic.
"""

import re
from typing import List, Tuple, Optional
from enum import Enum

class SlicerFormat(Enum):
    """Supported slicer formats"""
    BAMBU = "bambu"
    ORCA = "orca" 
    PRUSA = "prusa"
    UNKNOWN = "unknown"

class SlicerDetector:
    """Detects slicer format from G-code"""
    
    @staticmethod
    def detect_format(lines: List[str]) -> SlicerFormat:
        """Detect slicer format from G-code lines"""
        # Check first 100 lines for slicer signatures
        for line in lines[:100]:
            line_upper = line.upper()
            if "BAMBUSTUDIO" in line_upper:
                return SlicerFormat.BAMBU
            elif "ORCASLICER" in line_upper:
                return SlicerFormat.ORCA
            elif "PRUSASLICER" in line_upper:
                return SlicerFormat.PRUSA
        
        return SlicerFormat.UNKNOWN
    
    @staticmethod
    def get_layer_change_pattern(slicer_format: SlicerFormat) -> Tuple[str, bool]:
        """Get layer change detection pattern for slicer format
        
        Returns:
            Tuple of (pattern, is_regex) where is_regex indicates if pattern is regex
        """
        patterns = {
            SlicerFormat.BAMBU: ("M991 S0 P", False),  # Contains check + "notify layer change"
            SlicerFormat.ORCA: ("M991 S0 P", False),   # Same as Bambu
            SlicerFormat.PRUSA: (r";LAYER(?:_CHANGE)?:", True),  # Regex for both variants
            SlicerFormat.UNKNOWN: (r";LAYER(?:_CHANGE)?:", True)  # Default to Prusa pattern
        }
        return patterns.get(slicer_format, patterns[SlicerFormat.UNKNOWN])
    
    @staticmethod
    def detect_layer_change(line: str, slicer_format: SlicerFormat) -> bool:
        """Detect if line indicates layer change"""
        pattern, is_regex = SlicerDetector.get_layer_change_pattern(slicer_format)
        
        if slicer_format in [SlicerFormat.BAMBU, SlicerFormat.ORCA]:
            # Special handling for Bambu/Orca: needs both pattern and "notify layer change".
            # The pattern must be in the command, not a comment: the config dump at the top
            # of the file has a "; layer_change_gcode = ... M991 S0 P..." comment line.
            return pattern in line.split(';')[0] and "notify layer change" in line
        elif is_regex:
            return bool(re.search(pattern, line))
        else:
            return pattern in line
    
    @staticmethod
    def estimate_layer_height(lines: List[str]) -> Optional[float]:
        """Estimate layer height from G-code"""
        z_values = []
        
        for line in lines[:500]:  # Check first 500 lines
            if "G1 Z" in line:
                z_match = re.search(r"Z([\d\.]+)", line)
                if z_match:
                    z_val = float(z_match.group(1))
                    if z_val > 0:  # Ignore Z0
                        z_values.append(z_val)
        
        if len(z_values) >= 2:
            # Look for consistent differences
            differences = []
            for i in range(1, min(len(z_values), 10)):
                diff = z_values[i] - z_values[i-1]
                if 0.05 <= diff <= 0.5:  # Reasonable layer height range
                    differences.append(diff)
            
            if differences:
                # Return most common difference
                return round(sum(differences) / len(differences), 2)
        
        return None  # Could not determine
    
    @staticmethod
    def get_compatibility_info(slicer_format: SlicerFormat) -> dict:
        """Get compatibility information for slicer format"""
        compatibility = {
            SlicerFormat.BAMBU: {
                "compatible": True,
                "confidence": "high",
                "features": ["layer_detection", "tool_changes", "preview_generation"],
                "notes": "Fully tested with BambuStudio 1.9.x"
            },
            SlicerFormat.ORCA: {
                "compatible": True, 
                "confidence": "high",
                "features": ["layer_detection", "tool_changes", "preview_generation"],
                "notes": "Compatible via BambuStudio format support"
            },
            SlicerFormat.PRUSA: {
                "compatible": True,
                "confidence": "medium", 
                "features": ["layer_detection", "tool_changes"],
                "notes": "Standard G-code format, limited testing"
            },
            SlicerFormat.UNKNOWN: {
                "compatible": False,
                "confidence": "low",
                "features": [],
                "notes": "Unknown format, may not work correctly"
            }
        }
        
        return compatibility.get(slicer_format, compatibility[SlicerFormat.UNKNOWN])