"""
G-code Processing API Endpoints

Modular API endpoints for G-code validation, processing, and preview generation.
"""

from fastapi import APIRouter, UploadFile, File, HTTPException
from typing import Optional
import uuid
import sys
from pathlib import Path

# Add project root to Python path for core module access
project_root = Path(__file__).parent.parent.parent
sys.path.insert(0, str(project_root))

from core.processors.gcode_processor import GCodeProcessor
from core.models.processing_params import ProcessingParams
from core.models.processing_response import ProcessingResponse

router = APIRouter(prefix="/api", tags=["gcode"])

# Initialize processor
processor = GCodeProcessor()

@router.post("/validate")
async def validate_gcode(file: UploadFile = File(...)):
    """Validate G-code format and return compatibility info"""
    try:
        content = await file.read()
        lines = content.decode('utf-8').splitlines()
        
        # Validate G-code
        is_valid, errors = processor.validate_gcode(lines)
        
        if not is_valid:
            return {
                "valid": False,
                "errors": errors,
                "compatible": False
            }
        
        # Get file information
        info = processor.get_file_info(lines)
        
        return {
            "valid": True,
            "slicer_format": info["slicer_format"],
            "total_lines": info["total_lines"],
            "estimated_layers": info["estimated_layers"],
            "estimated_layer_height": info["estimated_layer_height"],
            "compatible": info["compatibility"]["compatible"],
            "compatibility_info": info["compatibility"]
        }
        
    except Exception as e:
        raise HTTPException(status_code=400, detail=f"Invalid G-code file: {str(e)}")

@router.post("/process")
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
        
        # Generate job ID for tracking
        job_id = str(uuid.uuid4())
        
        # Process the G-code using core processor
        response = processor.process(lines, params, job_id)
        
        if not response.success:
            raise HTTPException(status_code=500, detail=response.error)
        
        return response.to_dict()
        
    except ValueError as e:
        raise HTTPException(status_code=400, detail=f"Invalid parameters: {str(e)}")
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Processing failed: {str(e)}")

@router.post("/preview")
async def generate_preview(file: UploadFile = File(...)):
    """Generate preview data without processing the file"""
    try:
        content = await file.read()
        lines = content.decode('utf-8').splitlines()
        
        # Get file info and basic preview
        info = processor.get_file_info(lines)
        
        # Generate preview using core processor
        params = ProcessingParams(enable_preview=True)
        preview_response = processor.process(lines[:1000], params)  # Sample for preview
        
        return {
            "preview_data": preview_response.preview_data.to_dict() if preview_response.preview_data else None,
            "file_info": {
                "total_lines": info["total_lines"],
                "slicer_format": info["slicer_format"],
                "estimated_layers": info["estimated_layers"],
                "estimated_layer_height": info["estimated_layer_height"]
            }
        }
        
    except Exception as e:
        raise HTTPException(status_code=400, detail=f"Preview generation failed: {str(e)}")