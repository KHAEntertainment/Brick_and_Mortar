from fastapi import FastAPI, UploadFile, File, HTTPException, WebSocket, WebSocketDisconnect
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import Response
from typing import Optional, List, Dict, Any, Union
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
import asyncio
import aiohttp
import requests
import json
from datetime import datetime
from enum import Enum

# Environment configuration
ENVIRONMENT = os.getenv("ENVIRONMENT", "development")
PORT = int(os.getenv("PORT", "9000"))

# CORS configuration based on environment
def get_cors_origins():
    """Get CORS origins based on environment configuration"""
    cors_origins = os.getenv("CORS_ORIGINS", "")
    
    if cors_origins:
        # Production: use specified origins
        return [origin.strip() for origin in cors_origins.split(",") if origin.strip()]
    elif ENVIRONMENT == "production":
        # Production fallback: secure defaults
        return [
            "https://bm-api.khaent.com",
            "https://app.khaent.com",
            "http://bm-api.nas1"
        ]
    else:
        # Development: allow all origins
        return ["*"]

app = FastAPI(
    title="Brick & Mortar API", 
    version="1.0.0",
    description="G-Code Processing & Image Management API"
)

# Environment-based CORS middleware
cors_origins = get_cors_origins()
app.add_middleware(
    CORSMiddleware,
    allow_origins=cors_origins,
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

# Image Processing Models
class JobStatus(str, Enum):
    RUNNING = "running"
    COMPLETED = "completed"
    FAILED = "failed"
    PAUSED = "paused"
    STOPPED = "stopped"

class MaterialStatus(str, Enum):
    PENDING = "pending"
    PROCESSING = "processing"
    SUCCESS = "success"
    FAILED = "failed"

class MaterialItem(BaseModel):
    id: str
    name: str
    imageUrl: str

class ProcessingOptions(BaseModel):
    concurrency: Optional[int] = 3
    retryAttempts: Optional[int] = 3
    retryDelay: Optional[int] = 2000
    timeout: Optional[int] = 30000

class SupabaseConfig(BaseModel):
    url: str
    serviceRoleKey: str
    bucket: str

class BulkProcessRequest(BaseModel):
    materials: List[MaterialItem]
    options: Optional[ProcessingOptions] = ProcessingOptions()
    supabaseConfig: SupabaseConfig

class MaterialResult(BaseModel):
    materialId: str
    materialName: str
    status: MaterialStatus
    localImageUrl: Optional[str] = None
    originalUrl: Optional[str] = None
    error: Optional[str] = None
    attempts: int = 0
    processingTime: Optional[float] = None

class ProcessingProgress(BaseModel):
    total: int
    completed: int
    failed: int
    success: int
    currentMaterial: Optional[str] = None
    currentMaterialId: Optional[str] = None

class ProcessingMetrics(BaseModel):
    processingSpeed: float
    estimatedTimeRemaining: Optional[int] = None
    startTime: str
    endTime: Optional[str] = None
    totalProcessingTime: Optional[float] = None
    averageImageSize: Optional[int] = None
    totalDataTransferred: Optional[int] = None

class ProcessingLog(BaseModel):
    timestamp: str
    level: str
    message: str
    materialId: Optional[str] = None

class JobStatusResponse(BaseModel):
    jobId: str
    status: JobStatus
    progress: ProcessingProgress
    results: List[MaterialResult]
    metrics: ProcessingMetrics
    logs: List[ProcessingLog]

class BulkProcessResponse(BaseModel):
    jobId: str
    status: str
    totalMaterials: int
    websocketUrl: str
    estimatedDuration: Optional[int] = None

class JobControlRequest(BaseModel):
    action: str  # 'pause', 'resume', 'stop'

class SingleProcessRequest(BaseModel):
    materialId: str
    materialName: str
    imageUrl: str
    supabaseConfig: SupabaseConfig

class SingleProcessResponse(BaseModel):
    success: bool
    materialId: str
    localImageUrl: Optional[str] = None
    originalUrl: str
    processingTime: Optional[float] = None
    fileSize: Optional[int] = None
    contentType: Optional[str] = None
    error: Optional[str] = None

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

# Job Management System
class ProcessingJob:
    def __init__(self, job_id: str, materials: List[MaterialItem], options: ProcessingOptions, supabase_config: SupabaseConfig):
        self.job_id = job_id
        self.materials = materials
        self.options = options
        self.supabase_config = supabase_config
        self.status = JobStatus.RUNNING
        self.progress = ProcessingProgress(total=len(materials), completed=0, failed=0, success=0)
        self.results: List[MaterialResult] = []
        self.logs: List[ProcessingLog] = []
        self.start_time = datetime.utcnow()
        self.end_time = None
        self.paused = False
        self.stopped = False
        self.websocket_connections: List[WebSocket] = []
        
        # Initialize results
        for material in materials:
            self.results.append(MaterialResult(
                materialId=material.id,
                materialName=material.name,
                status=MaterialStatus.PENDING,
                originalUrl=material.imageUrl
            ))
    
    def add_log(self, level: str, message: str, material_id: str = None):
        log = ProcessingLog(
            timestamp=datetime.utcnow().isoformat(),
            level=level,
            message=message,
            materialId=material_id
        )
        self.logs.append(log)
        
    def update_material_status(self, material_id: str, status: MaterialStatus, **kwargs):
        for result in self.results:
            if result.materialId == material_id:
                result.status = status
                for key, value in kwargs.items():
                    if hasattr(result, key):
                        setattr(result, key, value)
                break
                
    def get_metrics(self) -> ProcessingMetrics:
        elapsed = (datetime.utcnow() - self.start_time).total_seconds()
        speed = self.progress.completed / (elapsed / 60) if elapsed > 0 else 0
        remaining_items = self.progress.total - self.progress.completed
        estimated_remaining = (remaining_items / speed * 60) if speed > 0 else None
        
        return ProcessingMetrics(
            processingSpeed=speed,
            estimatedTimeRemaining=int(estimated_remaining) if estimated_remaining else None,
            startTime=self.start_time.isoformat(),
            endTime=self.end_time.isoformat() if self.end_time else None,
            totalProcessingTime=elapsed
        )

# Global job storage
active_jobs: Dict[str, ProcessingJob] = {}

# WebSocket connection manager
class ConnectionManager:
    def __init__(self):
        self.active_connections: Dict[str, List[WebSocket]] = {}

    async def connect(self, websocket: WebSocket, job_id: str):
        await websocket.accept()
        if job_id not in self.active_connections:
            self.active_connections[job_id] = []
        self.active_connections[job_id].append(websocket)

    def disconnect(self, websocket: WebSocket, job_id: str):
        if job_id in self.active_connections:
            self.active_connections[job_id].remove(websocket)

    async def send_update(self, job_id: str, message: dict):
        if job_id in self.active_connections:
            for connection in self.active_connections[job_id]:
                try:
                    await connection.send_text(json.dumps(message))
                except:
                    pass  # Connection closed

manager = ConnectionManager()

# Image Processing System
class ImageProcessor:
    def __init__(self):
        self.session = None
    
    async def get_session(self):
        if self.session is None:
            self.session = aiohttp.ClientSession()
        return self.session
    
    async def close_session(self):
        if self.session:
            await self.session.close()
            self.session = None
    
    async def download_image(self, url: str, timeout: int = 30) -> tuple[bytes, str]:
        """Download image from URL and return bytes and content type"""
        headers = {
            'User-Agent': 'Mozilla/5.0 (compatible; MaterialsProcessorBot/1.0)',
            'Accept': 'image/*',
            'Accept-Encoding': 'gzip, deflate'
        }
        
        session = await self.get_session()
        async with session.get(url, headers=headers, timeout=timeout) as response:
            if response.status != 200:
                raise Exception(f"HTTP {response.status}: {response.reason}")
            
            content_type = response.headers.get('content-type', 'image/jpeg')
            if not content_type.startswith('image/'):
                raise Exception(f"URL did not return an image. Content-Type: {content_type}")
            
            image_data = await response.read()
            if not image_data:
                raise Exception("Image data is empty")
                
            return image_data, content_type
    
    def get_file_extension(self, url: str, content_type: str) -> str:
        """Get file extension from URL or content type"""
        # Try to get extension from URL
        url_parts = url.split('.')
        extension = url_parts[-1].split('?')[0] if len(url_parts) > 1 else None
        
        # Fallback to content type if extension not clear
        if not extension or len(extension) > 4:
            if 'jpeg' in content_type or 'jpg' in content_type:
                extension = 'jpg'
            elif 'png' in content_type:
                extension = 'png'
            elif 'gif' in content_type:
                extension = 'gif'
            elif 'webp' in content_type:
                extension = 'webp'
            else:
                extension = 'jpg'  # Default fallback
                
        return extension
    
    async def upload_to_supabase(self, image_data: bytes, filename: str, content_type: str, supabase_config: SupabaseConfig) -> str:
        """Upload image to Supabase storage and return public URL"""
        url = f"{supabase_config.url}/storage/v1/object/materials/{filename}"
        headers = {
            'Authorization': f'Bearer {supabase_config.serviceRoleKey}',
            'Content-Type': content_type,
            'x-upsert': 'true'  # Replace if exists
        }
        
        session = await self.get_session()
        async with session.post(url, headers=headers, data=image_data) as response:
            if response.status not in [200, 201]:
                error_text = await response.text()
                raise Exception(f"Storage upload failed: {response.status} - {error_text}")
        
        # Return public URL
        return f"{supabase_config.url}/storage/v1/object/public/materials/{filename}"
    
    async def update_material_record(self, material_id: str, image_url: str, supabase_config: SupabaseConfig):
        """Update material record with new image URL"""
        url = f"{supabase_config.url}/rest/v1/materials"
        headers = {
            'apikey': supabase_config.serviceRoleKey,
            'Authorization': f'Bearer {supabase_config.serviceRoleKey}',
            'Content-Type': 'application/json',
            'Prefer': 'return=minimal'
        }
        data = {'imageurl': image_url}
        params = {'id': f'eq.{material_id}'}
        
        session = await self.get_session()
        async with session.patch(url, headers=headers, json=data, params=params) as response:
            if response.status != 204:
                error_text = await response.text()
                raise Exception(f"Database update failed: {response.status} - {error_text}")
    
    async def process_single_material(self, material: MaterialItem, supabase_config: SupabaseConfig, retry_attempts: int = 3) -> MaterialResult:
        """Process a single material image with retry logic"""
        result = MaterialResult(
            materialId=material.id,
            materialName=material.name,
            status=MaterialStatus.PROCESSING,
            originalUrl=material.imageUrl
        )
        
        start_time = datetime.utcnow()
        
        for attempt in range(retry_attempts):
            try:
                result.attempts = attempt + 1
                
                # Download image
                image_data, content_type = await self.download_image(material.imageUrl)
                
                # Generate filename
                extension = self.get_file_extension(material.imageUrl, content_type)
                filename = f"{material.id}.{extension}"
                
                # Upload to storage
                local_url = await self.upload_to_supabase(image_data, filename, content_type, supabase_config)
                
                # Update database
                await self.update_material_record(material.id, local_url, supabase_config)
                
                # Success
                result.status = MaterialStatus.SUCCESS
                result.localImageUrl = local_url
                result.processingTime = (datetime.utcnow() - start_time).total_seconds()
                return result
                
            except Exception as e:
                result.error = str(e)
                if attempt < retry_attempts - 1:
                    await asyncio.sleep(2 ** attempt)  # Exponential backoff
                    continue
                else:
                    result.status = MaterialStatus.FAILED
                    result.processingTime = (datetime.utcnow() - start_time).total_seconds()
                    return result
        
        return result

image_processor = ImageProcessor()
processor = GCodeProcessor()

@app.get("/api/health")
async def health_check():
    return {
        "status": "healthy", 
        "service": "brick-mortar-api",
        "version": "1.0.0",
        "environment": ENVIRONMENT,
        "port": PORT,
        "cors_origins": cors_origins if ENVIRONMENT == "development" else "configured"
    }

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

# Image Processing Endpoints

@app.post("/api/image-processing/bulk-process", response_model=BulkProcessResponse)
async def start_bulk_image_processing(request: BulkProcessRequest):
    """Initiate bulk processing of material images with real-time progress tracking"""
    try:
        # Generate unique job ID
        job_id = str(uuid.uuid4())
        
        # Create processing job
        job = ProcessingJob(job_id, request.materials, request.options, request.supabaseConfig)
        active_jobs[job_id] = job
        
        # Start background processing
        asyncio.create_task(process_materials_background(job))
        
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

@app.get("/api/image-processing/status/{job_id}", response_model=JobStatusResponse)
async def get_job_status(job_id: str):
    """Get current status and detailed progress information for a job"""
    if job_id not in active_jobs:
        raise HTTPException(status_code=404, detail="Job not found")
    
    job = active_jobs[job_id]
    
    return JobStatusResponse(
        jobId=job_id,
        status=job.status,
        progress=job.progress,
        results=job.results,
        metrics=job.get_metrics(),
        logs=job.logs[-100:]  # Return last 100 logs
    )

@app.post("/api/image-processing/control/{job_id}")
async def control_job(job_id: str, request: JobControlRequest):
    """Control job execution (pause, resume, stop)"""
    if job_id not in active_jobs:
        raise HTTPException(status_code=404, detail="Job not found")
    
    job = active_jobs[job_id]
    
    if request.action == "pause":
        job.paused = True
        job.add_log("info", "Job paused by user")
        message = "Job paused successfully"
    elif request.action == "resume":
        job.paused = False
        job.add_log("info", "Job resumed by user")
        message = "Job resumed successfully"
    elif request.action == "stop":
        job.stopped = True
        job.status = JobStatus.STOPPED
        job.end_time = datetime.utcnow()
        job.add_log("info", "Job stopped by user")
        message = "Job stopped successfully"
    else:
        raise HTTPException(status_code=400, detail="Invalid action. Use 'pause', 'resume', or 'stop'")
    
    # Send WebSocket update
    await manager.send_update(job_id, {
        "type": "job_control",
        "jobId": job_id,
        "action": request.action,
        "status": job.status
    })
    
    return {
        "jobId": job_id,
        "action": request.action,
        "status": job.status,
        "message": message
    }

@app.post("/api/image-processing/single-process", response_model=SingleProcessResponse)
async def process_single_material(request: SingleProcessRequest):
    """Process a single material for testing purposes"""
    try:
        material = MaterialItem(
            id=request.materialId,
            name=request.materialName,
            imageUrl=request.imageUrl
        )
        
        result = await image_processor.process_single_material(
            material, 
            request.supabaseConfig, 
            retry_attempts=3
        )
        
        return SingleProcessResponse(
            success=result.status == MaterialStatus.SUCCESS,
            materialId=result.materialId,
            localImageUrl=result.localImageUrl,
            originalUrl=result.originalUrl,
            processingTime=result.processingTime,
            error=result.error
        )
        
    except Exception as e:
        return SingleProcessResponse(
            success=False,
            materialId=request.materialId,
            originalUrl=request.imageUrl,
            error=str(e)
        )

@app.websocket("/ws/{job_id}")
async def websocket_endpoint(websocket: WebSocket, job_id: str):
    """WebSocket endpoint for real-time progress updates"""
    await manager.connect(websocket, job_id)
    try:
        while True:
            # Keep connection alive
            await websocket.receive_text()
    except WebSocketDisconnect:
        manager.disconnect(websocket, job_id)

# Background processing function
async def process_materials_background(job: ProcessingJob):
    """Background task to process materials with concurrent processing"""
    try:
        job.add_log("info", f"Starting bulk processing of {len(job.materials)} materials")
        
        # Create semaphore for concurrency control
        semaphore = asyncio.Semaphore(job.options.concurrency)
        
        # Process materials concurrently
        tasks = [
            process_material_with_updates(job, material, semaphore)
            for material in job.materials
        ]
        
        # Wait for all tasks to complete
        await asyncio.gather(*tasks)
        
        # Mark job as completed
        job.status = JobStatus.COMPLETED
        job.end_time = datetime.utcnow()
        job.add_log("info", f"Bulk processing completed: {job.progress.success} successful, {job.progress.failed} failed")
        
        # Send final WebSocket update
        await manager.send_update(job.job_id, {
            "type": "job_complete",
            "jobId": job.job_id,
            "data": {
                "totalProcessed": job.progress.total,
                "successful": job.progress.success,
                "failed": job.progress.failed,
                "totalTime": job.get_metrics().totalProcessingTime,
                "averageSpeed": job.get_metrics().processingSpeed
            }
        })
        
    except Exception as e:
        job.status = JobStatus.FAILED
        job.end_time = datetime.utcnow()
        job.add_log("error", f"Bulk processing failed: {str(e)}")

async def process_material_with_updates(job: ProcessingJob, material: MaterialItem, semaphore: asyncio.Semaphore):
    """Process a single material with WebSocket updates"""
    async with semaphore:
        # Check if job is paused or stopped
        while job.paused and not job.stopped:
            await asyncio.sleep(1)
        
        if job.stopped:
            return
        
        # Update current material
        job.progress.currentMaterial = material.name
        job.progress.currentMaterialId = material.id
        
        # Send WebSocket update
        await manager.send_update(job.job_id, {
            "type": "progress",
            "jobId": job.job_id,
            "data": job.progress.__dict__
        })
        
        # Process the material
        result = await image_processor.process_single_material(
            material, 
            job.supabase_config, 
            job.options.retryAttempts
        )
        
        # Update job progress
        job.update_material_status(material.id, result.status, 
                                 localImageUrl=result.localImageUrl,
                                 error=result.error,
                                 attempts=result.attempts,
                                 processingTime=result.processingTime)
        
        job.progress.completed += 1
        if result.status == MaterialStatus.SUCCESS:
            job.progress.success += 1
        else:
            job.progress.failed += 1
        
        # Add log
        if result.status == MaterialStatus.SUCCESS:
            job.add_log("info", f"Successfully processed: {result.localImageUrl}", material.id)
        else:
            job.add_log("error", f"Failed to process: {result.error}", material.id)
        
        # Send material completion update
        await manager.send_update(job.job_id, {
            "type": "material_complete" if result.status == MaterialStatus.SUCCESS else "material_failed",
            "jobId": job.job_id,
            "data": {
                "materialId": material.id,
                "materialName": material.name,
                "status": result.status,
                "localImageUrl": result.localImageUrl,
                "error": result.error,
                "processingTime": result.processingTime,
                "attempts": result.attempts
            }
        })

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=PORT)