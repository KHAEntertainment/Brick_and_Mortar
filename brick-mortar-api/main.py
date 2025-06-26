from fastapi import FastAPI, UploadFile, File, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import Response
from typing import Optional, List, Dict, Any
try:
    from pydantic import BaseModel
except ImportError:
    # Fallback for basic functionality without pydantic
    class BaseModel:
        def __init__(self, **kwargs):
            for key, value in kwargs.items():
                setattr(self, key, value)
import tempfile
import os
import re
import uuid

app = FastAPI(title="Brick & Mortar G-Code Processor", version="1.0.0")

# CORS middleware for Lovable integration
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Configure for your domain in production
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

class ProcessingParams(BaseModel):
    material_preset: str = "PETG_TPU"
    z_offset: float = 0.1
    xy_shift: float = 0.2
    mortar_temp: int = 225
    mortar_speed: int = 100
    extrusion_multiplier: float = 1.05
    enable_preview: bool = True

class ProcessingResponse(BaseModel):
    processed_gcode: str
    preview_data: Dict[str, Any]
    processing_stats: Dict[str, Any]
    job_id: str

class GCodeProcessor:
    def __init__(self):
        self.base_tool = "T0"
        self.alt_tool = "T1"
        
    def detect_slicer_format(self, lines: List[str]) -> str:
        """Detect if G-code is from BambuStudio, OrcaSlicer, or other"""
        for line in lines[:100]:  # Check first 100 lines
            if "BambuStudio" in line:
                return "bambu"
            elif "OrcaSlicer" in line:
                return "orca"
            elif "PrusaSlicer" in line:
                return "prusa"
        return "unknown"
    
    def parse_gcode_for_preview(self, lines: List[str]) -> Dict[str, Any]:
        """Extract preview data from G-code"""
        layers = []
        tool_changes = []
        current_layer = 0
        current_z = 0.0
        
        for i, line in enumerate(lines):
            stripped = line.strip()
            
            # Track layer changes
            if ("LAYER_CHANGE" in stripped or 
                "M991 S0 P" in stripped and "notify layer change" in stripped):
                current_layer += 1
                
            # Track Z moves
            if "G1 Z" in stripped:
                z_match = re.search(r"Z([\d\.]+)", stripped)
                if z_match:
                    current_z = float(z_match.group(1))
                    
            # Track tool changes
            if stripped.startswith(("T0", "T1")):
                tool_changes.append({
                    "line": i,
                    "layer": current_layer,
                    "z": current_z,
                    "tool": stripped[:2]
                })
                
            # Track G1 moves for path data
            if ("G1" in stripped and "X" in stripped and "Y" in stripped):
                # Extract coordinates for preview
                x_match = re.search(r"X([\d\.-]+)", stripped)
                y_match = re.search(r"Y([\d\.-]+)", stripped)
                
                if x_match and y_match:
                    move_data = {
                        "x": float(x_match.group(1)),
                        "y": float(y_match.group(1)),
                        "z": current_z,
                        "layer": current_layer,
                        "line": i
                    }
                    
                    # Add to current layer
                    if len(layers) <= current_layer:
                        layers.extend([{"moves": [], "z": current_z}] * (current_layer - len(layers) + 1))
                    
                    if current_layer < len(layers):
                        layers[current_layer]["moves"].append(move_data)
        
        return {
            "layers": layers,
            "tool_changes": tool_changes,
            "total_layers": len(layers),
            "slicer_format": self.detect_slicer_format(lines)
        }
    
    def process_gcode(self, lines: List[str], params: ProcessingParams) -> tuple:
        """Process G-code with brick & mortar modifications"""
        processed_lines = []
        z_height = 0.0
        prev_z = 0.0
        infill_block = []
        current_layer_lines = []
        layers_processed = 0
        mortar_layers_added = 0
        
        slicer_format = self.detect_slicer_format(lines)
        layer_height = params.z_offset * 2  # Estimate layer height
        mortar_offset_z = params.z_offset
        
        for i, line in enumerate(lines):
            stripped = line.strip()
            
            # Handle Z moves
            if "G1 Z" in stripped:
                z_match = re.search(r"Z([\d\.]+)", stripped)
                if z_match:
                    z_height = float(z_match.group(1))
                    # Insert mortar after previous layer
                    if prev_z > 0 and infill_block:
                        mortar_z = prev_z + mortar_offset_z
                        mortar_lines = self.insert_mortar_layer(
                            infill_block, mortar_z, params
                        )
                        processed_lines.extend(mortar_lines)
                        mortar_layers_added += 1
                        infill_block = []
                prev_z = z_height
                processed_lines.append(line)
                continue
            
            # Accumulate current layer G1 moves
            if ((stripped.startswith("G1") or (" G1 " in stripped)) and 
                "E" in stripped and ("X" in stripped or "Y" in stripped)):
                current_layer_lines.append(line)
            
            # Layer change detection based on slicer format
            layer_change_detected = False
            if slicer_format == "bambu":
                layer_change_detected = "M991 S0 P" in stripped and "notify layer change" in stripped
            else:
                layer_change_detected = "LAYER_CHANGE" in stripped or ";LAYER:" in stripped
                
            if layer_change_detected and current_layer_lines:
                infill_block = current_layer_lines.copy()
                current_layer_lines = []
                layers_processed += 1
            
            processed_lines.append(line)
        
        # Generate preview data
        preview_data = self.parse_gcode_for_preview(processed_lines)
        
        processing_stats = {
            "original_layers": layers_processed,
            "mortar_layers_added": mortar_layers_added,
            "total_tool_changes": len(preview_data["tool_changes"]),
            "slicer_format": slicer_format,
            "original_lines": len(lines),
            "processed_lines": len(processed_lines)
        }
        
        return processed_lines, preview_data, processing_stats
    
    def insert_mortar_layer(self, infill_lines: List[str], z_mortar: float, params: ProcessingParams) -> List[str]:
        """Insert mortar layer with specified parameters"""
        lines = []
        lines.append(f";LAYER_CHANGE_MORTAR")
        lines.append(f";BRICK_MORTAR_LAYER at Z={z_mortar:.3f}")
        lines.append(f"G1 Z{z_mortar:.3f} F600")
        lines.append(f"{self.alt_tool} ;TOOL_CHANGE:1 ; Switch to mortar material")
        
        # Tool settings
        lines.append(f"M104 {self.alt_tool} S{params.mortar_temp}")
        lines.append(f"M106 S{int(params.mortar_speed * 2.55)}")  # Convert percentage to 0-255
        
        # Process infill moves with brick offset and extrusion multiplier
        for line in infill_lines:
            if "G1" in line and ("X" in line or "Y" in line):
                line = self.apply_brick_offset(line, params.xy_shift)
                if "E" in line:
                    line = self.apply_extrusion_multiplier(line, params.extrusion_multiplier)
            lines.append(line)
        
        lines.append(f"{self.base_tool} ;TOOL_CHANGE:0 ; Revert to base tool")
        return lines
    
    def apply_brick_offset(self, line: str, offset: float) -> str:
        """Apply X/Y offset for brick pattern"""
        x_match = re.search(r"X([\d\.-]+)", line)
        y_match = re.search(r"Y([\d\.-]+)", line)
        
        if x_match:
            x_val = float(x_match.group(1)) + offset
            line = re.sub(r"X[\d\.-]+", f"X{x_val:.3f}", line)
        if y_match:
            y_val = float(y_match.group(1)) + offset
            line = re.sub(r"Y[\d\.-]+", f"Y{y_val:.3f}", line)
        
        return line
    
    def apply_extrusion_multiplier(self, line: str, factor: float) -> str:
        """Apply extrusion multiplier to E values"""
        e_match = re.search(r"E([\d\.-]+)", line)
        if e_match:
            original_e = float(e_match.group(1))
            new_e = original_e * factor
            line = re.sub(r"E[\d\.-]+", f"E{new_e:.5f}", line)
        return line

processor = GCodeProcessor()

@app.get("/api/health")
async def health_check():
    return {"status": "healthy", "service": "brick-mortar-api"}

@app.post("/api/validate")
async def validate_gcode(file: UploadFile = File(...)):
    """Validate G-code format and return compatibility info"""
    try:
        content = await file.read()
        lines = content.decode('utf-8').splitlines()
        
        slicer_format = processor.detect_slicer_format(lines)
        preview_data = processor.parse_gcode_for_preview(lines[:1000])  # Sample for validation
        
        return {
            "valid": True,
            "slicer_format": slicer_format,
            "total_lines": len(lines),
            "estimated_layers": preview_data["total_layers"],
            "compatible": slicer_format in ["bambu", "orca", "prusa"]
        }
    except Exception as e:
        raise HTTPException(status_code=400, detail=f"Invalid G-code file: {str(e)}")

@app.post("/api/process", response_model=ProcessingResponse)
async def process_gcode(
    file: UploadFile = File(...),
    material_preset: str = "PETG_TPU",
    z_offset: float = 0.1,
    xy_shift: float = 0.2,
    mortar_temp: int = 225,
    mortar_speed: int = 100,
    extrusion_multiplier: float = 1.05,
    enable_preview: bool = True
):
    """Process G-code file with brick & mortar modifications"""
    try:
        # Read and parse G-code
        content = await file.read()
        lines = content.decode('utf-8').splitlines()
        
        # Create processing parameters
        params = ProcessingParams(
            material_preset=material_preset,
            z_offset=z_offset,
            xy_shift=xy_shift,
            mortar_temp=mortar_temp,
            mortar_speed=mortar_speed,
            extrusion_multiplier=extrusion_multiplier,
            enable_preview=enable_preview
        )
        
        # Process the G-code
        processed_lines, preview_data, processing_stats = processor.process_gcode(lines, params)
        
        # Generate job ID for tracking
        job_id = str(uuid.uuid4())
        
        return ProcessingResponse(
            processed_gcode="\n".join(processed_lines),
            preview_data=preview_data,
            processing_stats=processing_stats,
            job_id=job_id
        )
        
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Processing failed: {str(e)}")

@app.post("/api/preview")
async def generate_preview(file: UploadFile = File(...)):
    """Generate preview data without processing the file"""
    try:
        content = await file.read()
        lines = content.decode('utf-8').splitlines()
        
        preview_data = processor.parse_gcode_for_preview(lines)
        
        return {
            "preview_data": preview_data,
            "file_info": {
                "total_lines": len(lines),
                "slicer_format": preview_data["slicer_format"]
            }
        }
        
    except Exception as e:
        raise HTTPException(status_code=400, detail=f"Preview generation failed: {str(e)}")

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)