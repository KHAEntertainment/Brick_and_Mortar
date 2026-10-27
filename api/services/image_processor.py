"""
Image Processing Service

Extracted image processing logic from monolithic API.
"""

import aiohttp
import asyncio
from datetime import datetime
from typing import Dict, Any, Optional

from ..models.image_models import (
    MaterialItem, SupabaseConfig, MaterialResult, MaterialStatus,
    SingleProcessRequest, SingleProcessResponse
)
from .job_manager import ProcessingJob

class ImageProcessor:
    """Image processing service"""
    
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
    
    async def process_single_material_request(self, request: SingleProcessRequest) -> SingleProcessResponse:
        """Process single material request and return response"""
        material = MaterialItem(
            id=request.materialId,
            name=request.materialName,
            imageUrl=request.imageUrl
        )
        
        result = await self.process_single_material(
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
    
    async def process_materials_background(self, job: ProcessingJob):
        """Background task to process materials with concurrent processing"""
        from ..websocket.websocket_manager import manager
        
        try:
            job.add_log("info", f"Starting bulk processing of {len(job.materials)} materials")
            
            # Create semaphore for concurrency control
            semaphore = asyncio.Semaphore(job.options.concurrency)
            
            # Process materials concurrently
            tasks = [
                self._process_material_with_updates(job, material, semaphore)
                for material in job.materials
            ]
            
            # Wait for all tasks to complete
            await asyncio.gather(*tasks)
            
            # Mark job as completed
            job.mark_completed()
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
            job.mark_failed(str(e))
            job.add_log("error", f"Bulk processing failed: {str(e)}")
    
    async def _process_material_with_updates(self, job: ProcessingJob, material: MaterialItem, semaphore: asyncio.Semaphore):
        """Process a single material with WebSocket updates"""
        from ..websocket.websocket_manager import manager
        
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
            result = await self.process_single_material(
                material, 
                job.supabase_config, 
                job.options.retryAttempts
            )
            
            # Update job progress
            job.update_material_result(result)
            
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