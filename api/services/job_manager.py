"""
Job Management Service

Manages processing jobs and their lifecycle.
"""

from typing import Dict, Optional, List, Tuple
from datetime import datetime

from ..models.image_models import (
    MaterialItem, ProcessingOptions, SupabaseConfig, JobStatus,
    MaterialStatus, MaterialResult, ProcessingProgress, ProcessingMetrics,
    ProcessingLog
)

class ProcessingJob:
    """Processing job with lifecycle management"""
    
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
        
        # Initialize results
        for material in materials:
            self.results.append(MaterialResult(
                materialId=material.id,
                materialName=material.name,
                status=MaterialStatus.PENDING,
                originalUrl=material.imageUrl
            ))
    
    def add_log(self, level: str, message: str, material_id: str = None):
        """Add log entry"""
        log = ProcessingLog(
            timestamp=datetime.utcnow().isoformat(),
            level=level,
            message=message,
            materialId=material_id
        )
        self.logs.append(log)
    
    def update_material_result(self, result: MaterialResult):
        """Update material result and progress"""
        for i, existing_result in enumerate(self.results):
            if existing_result.materialId == result.materialId:
                self.results[i] = result
                break
        
        self.progress.completed += 1
        if result.status == MaterialStatus.SUCCESS:
            self.progress.success += 1
        else:
            self.progress.failed += 1
    
    def mark_completed(self):
        """Mark job as completed"""
        self.status = JobStatus.COMPLETED
        self.end_time = datetime.utcnow()
    
    def mark_failed(self, error: str):
        """Mark job as failed"""
        self.status = JobStatus.FAILED
        self.end_time = datetime.utcnow()
        self.add_log("error", f"Job failed: {error}")
    
    def pause(self):
        """Pause the job"""
        self.paused = True
        self.add_log("info", "Job paused by user")
    
    def resume(self):
        """Resume the job"""
        self.paused = False
        self.add_log("info", "Job resumed by user")
    
    def stop(self):
        """Stop the job"""
        self.stopped = True
        self.status = JobStatus.STOPPED
        self.end_time = datetime.utcnow()
        self.add_log("info", "Job stopped by user")
    
    def get_metrics(self) -> ProcessingMetrics:
        """Get processing metrics"""
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

class JobManager:
    """Manager for processing jobs"""
    
    def __init__(self):
        self.active_jobs: Dict[str, ProcessingJob] = {}
    
    def create_job(self, job_id: str, materials: List[MaterialItem], options: ProcessingOptions, supabase_config: SupabaseConfig) -> ProcessingJob:
        """Create a new processing job"""
        job = ProcessingJob(job_id, materials, options, supabase_config)
        self.active_jobs[job_id] = job
        return job
    
    def get_job(self, job_id: str) -> Optional[ProcessingJob]:
        """Get job by ID"""
        return self.active_jobs.get(job_id)
    
    def control_job(self, job_id: str, action: str) -> Tuple[bool, str]:
        """Control job execution"""
        job = self.get_job(job_id)
        if not job:
            return False, "Job not found"
        
        if action == "pause":
            job.pause()
            return True, "Job paused successfully"
        elif action == "resume":
            job.resume()
            return True, "Job resumed successfully"
        elif action == "stop":
            job.stop()
            return True, "Job stopped successfully"
        else:
            return False, "Invalid action. Use 'pause', 'resume', or 'stop'"
    
    def cleanup_completed_jobs(self, max_age_hours: int = 24):
        """Clean up old completed jobs"""
        cutoff_time = datetime.utcnow().timestamp() - (max_age_hours * 3600)
        
        jobs_to_remove = []
        for job_id, job in self.active_jobs.items():
            if (job.status in [JobStatus.COMPLETED, JobStatus.FAILED, JobStatus.STOPPED] and 
                job.end_time and job.end_time.timestamp() < cutoff_time):
                jobs_to_remove.append(job_id)
        
        for job_id in jobs_to_remove:
            del self.active_jobs[job_id]
        
        return len(jobs_to_remove)