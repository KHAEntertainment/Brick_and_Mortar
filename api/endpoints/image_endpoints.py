"""
Image Processing API Endpoints

Modular API endpoints for bulk image processing with WebSocket support.
"""

from fastapi import APIRouter, HTTPException
from typing import Dict
import uuid
import asyncio

from ...core.models.processing_response import ProcessingResponse
from ..models.image_models import (
    BulkProcessRequest, BulkProcessResponse, JobControlRequest,
    SingleProcessRequest, SingleProcessResponse, JobStatusResponse
)
from ..services.image_processor import ImageProcessor
from ..services.job_manager import JobManager

router = APIRouter(prefix="/api/image-processing", tags=["image-processing"])

# Initialize services
image_processor = ImageProcessor()
job_manager = JobManager()

@router.post("/bulk-process", response_model=BulkProcessResponse)
async def start_bulk_image_processing(request: BulkProcessRequest):
    """Initiate bulk processing of material images with real-time progress tracking"""
    try:
        # Generate unique job ID
        job_id = str(uuid.uuid4())
        
        # Create processing job
        job = job_manager.create_job(job_id, request.materials, request.options, request.supabaseConfig)
        
        # Start background processing
        asyncio.create_task(image_processor.process_materials_background(job))
        
        # Return job info
        websocket_url = f"ws://localhost:9000/ws/{job_id}"  # TODO: Make this configurable
        
        return BulkProcessResponse(
            jobId=job_id,
            status="started",
            totalMaterials=len(request.materials),
            websocketUrl=websocket_url,
            estimatedDuration=len(request.materials) * 5  # Rough estimate: 5 seconds per material
        )
        
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Failed to start bulk processing: {str(e)}")

@router.get("/status/{job_id}", response_model=JobStatusResponse)
async def get_job_status(job_id: str):
    """Get current status and detailed progress information for a job"""
    job = job_manager.get_job(job_id)
    if not job:
        raise HTTPException(status_code=404, detail="Job not found")
    
    return JobStatusResponse(
        jobId=job_id,
        status=job.status,
        progress=job.progress,
        results=job.results,
        metrics=job.get_metrics(),
        logs=job.logs[-100:]  # Return last 100 logs
    )

@router.post("/control/{job_id}")
async def control_job(job_id: str, request: JobControlRequest):
    """Control job execution (pause, resume, stop)"""
    job = job_manager.get_job(job_id)
    if not job:
        raise HTTPException(status_code=404, detail="Job not found")
    
    success, message = job_manager.control_job(job_id, request.action)
    
    if not success:
        raise HTTPException(status_code=400, detail=message)
    
    return {
        "jobId": job_id,
        "action": request.action,
        "status": job.status,
        "message": message
    }

@router.post("/single-process", response_model=SingleProcessResponse)
async def process_single_material(request: SingleProcessRequest):
    """Process a single material for testing purposes"""
    try:
        result = await image_processor.process_single_material_request(request)
        return result
        
    except Exception as e:
        return SingleProcessResponse(
            success=False,
            materialId=request.materialId,
            originalUrl=request.imageUrl,
            error=str(e)
        )