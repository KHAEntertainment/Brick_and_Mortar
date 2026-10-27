"""
Image Processing Models

Data models for image processing API endpoints.
"""

from typing import Optional, List, Dict, Any
from pydantic import BaseModel
from enum import Enum

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