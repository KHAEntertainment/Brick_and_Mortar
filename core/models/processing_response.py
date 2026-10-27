"""
Processing Response Model

Unified response model for all distribution methods.
"""

from typing import Dict, Any, List, Optional
from dataclasses import dataclass

@dataclass
class ProcessingStats:
    """Statistics from G-code processing"""
    original_layers: int
    mortar_layers_added: int
    total_tool_changes: int
    slicer_format: str
    original_lines: int
    processed_lines: int
    processing_time_ms: Optional[float] = None
    
    def to_dict(self) -> Dict[str, Any]:
        return {
            "original_layers": self.original_layers,
            "mortar_layers_added": self.mortar_layers_added,
            "total_tool_changes": self.total_tool_changes,
            "slicer_format": self.slicer_format,
            "original_lines": self.original_lines,
            "processed_lines": self.processed_lines,
            "processing_time_ms": self.processing_time_ms
        }

@dataclass 
class ToolChange:
    """Tool change information for preview"""
    line: int
    layer: int
    z: float
    tool: str

@dataclass
class LayerMove:
    """Individual move in a layer for preview"""
    x: float
    y: float
    z: float
    layer: int
    line: int

@dataclass
class LayerData:
    """Layer information for preview"""
    moves: List[LayerMove]
    z: float

@dataclass
class PreviewData:
    """Preview data for visualization"""
    layers: List[LayerData] 
    tool_changes: List[ToolChange]
    total_layers: int
    slicer_format: str
    
    def to_dict(self) -> Dict[str, Any]:
        return {
            "layers": [
                {
                    "moves": [
                        {"x": move.x, "y": move.y, "z": move.z, "layer": move.layer, "line": move.line}
                        for move in layer.moves
                    ],
                    "z": layer.z
                }
                for layer in self.layers
            ],
            "tool_changes": [
                {"line": tc.line, "layer": tc.layer, "z": tc.z, "tool": tc.tool}
                for tc in self.tool_changes
            ],
            "total_layers": self.total_layers,
            "slicer_format": self.slicer_format
        }

@dataclass
class ProcessingResponse:
    """Complete response from G-code processing"""
    processed_gcode: List[str]
    preview_data: Optional[PreviewData] = None
    processing_stats: Optional[ProcessingStats] = None
    job_id: Optional[str] = None
    success: bool = True
    error: Optional[str] = None
    
    def get_gcode_string(self) -> str:
        """Get processed G-code as string"""
        return "\n".join(self.processed_gcode)
    
    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary for JSON serialization"""
        result = {
            "success": self.success,
            "job_id": self.job_id,
            "error": self.error
        }
        
        if self.success:
            result["processed_gcode"] = self.get_gcode_string()
            if self.preview_data:
                result["preview_data"] = self.preview_data.to_dict()
            if self.processing_stats:
                result["processing_stats"] = self.processing_stats.to_dict()
        
        return result
    
    @classmethod
    def create_error(cls, error_message: str, job_id: Optional[str] = None) -> "ProcessingResponse":
        """Create error response"""
        return cls(
            processed_gcode=[],
            success=False,
            error=error_message,
            job_id=job_id
        )