# Integration Points - Frontend Requirements & Examples

**Last Updated**: 2025-07-07T00:00:00Z

---

## Frontend Integration Overview

This document provides concrete examples and requirements for integrating the Brick & Mortar Python API with the frontend application.

---

## API Endpoint Configuration

### Environment-Specific URLs

#### Development:
```typescript
const API_BASE_URL = 'http://localhost:9000';
```

#### Production (when deployed):
```typescript
const API_BASE_URL = 'https://api.yourdomain.com';
// OR with custom port:
const API_BASE_URL = 'https://yourdomain.com:8000';
```

### Configuration via Admin Panel:
The frontend should continue using the `config_files` table pattern:

```json
{
  "name": "Brick & Mortar API Configuration",
  "content": {
    "currentEnvironment": "development",
    "development": {
      "baseUrl": "http://localhost:9000",
      "timeout": 30000,
      "retries": 3
    },
    "production": {
      "baseUrl": "https://api.yourdomain.com",
      "timeout": 30000,
      "retries": 3
    },
    "features": {
      "enablePreview": true,
      "enableValidation": true,
      "enableDownload": true
    },
    "processing": {
      "maxFileSize": 10485760,
      "allowedFormats": [".gcode", ".gcode.3mf"]
    }
  }
}
```

---

## Image Processing Integration

### Migration from Edge Functions to Python API

#### Current Edge Function Pattern:
```typescript
// OLD: Edge function approach
const processImages = async (materials: Material[]) => {
  for (const material of materials) {
    // Sequential processing with delays
    await processImage(material);
    await delay(3000); // Rate limiting
  }
};
```

#### New Python API Pattern:
```typescript
// NEW: Python API approach
const processImages = async (materials: Material[]) => {
  // Start bulk processing
  const response = await fetch(`${API_BASE_URL}/api/image-processing/bulk-process`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({
      materials: materials.map(m => ({
        id: m.id,
        name: m.name,
        imageUrl: m.imageUrl
      })),
      options: {
        concurrency: 3,
        retryAttempts: 3,
        retryDelay: 2000
      },
      supabaseConfig: {
        url: process.env.VITE_SUPABASE_URL,
        serviceRoleKey: process.env.VITE_SUPABASE_SERVICE_ROLE_KEY,
        bucket: 'materials'
      }
    })
  });
  
  const { jobId, websocketUrl } = await response.json();
  
  // Connect to WebSocket for real-time updates
  const ws = new WebSocket(websocketUrl);
  ws.onmessage = (event) => {
    const update = JSON.parse(event.data);
    handleProgressUpdate(update);
  };
  
  return jobId;
};
```

### Complete Integration Example:

```typescript
import { useState, useEffect } from 'react';

interface Material {
  id: string;
  name: string;
  imageUrl: string;
}

interface JobProgress {
  total: number;
  completed: number;
  failed: number;
  success: number;
  currentMaterial?: string;
}

const useBulkImageProcessor = () => {
  const [jobId, setJobId] = useState<string | null>(null);
  const [progress, setProgress] = useState<JobProgress>({ total: 0, completed: 0, failed: 0, success: 0 });
  const [status, setStatus] = useState<'idle' | 'processing' | 'completed' | 'failed'>('idle');
  const [websocket, setWebsocket] = useState<WebSocket | null>(null);

  const startProcessing = async (materials: Material[]) => {
    try {
      const response = await fetch(`${API_BASE_URL}/api/image-processing/bulk-process`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          materials,
          options: {
            concurrency: 3,
            retryAttempts: 3,
            retryDelay: 2000
          },
          supabaseConfig: {
            url: process.env.VITE_SUPABASE_URL!,
            serviceRoleKey: process.env.VITE_SUPABASE_SERVICE_ROLE_KEY!,
            bucket: 'materials'
          }
        })
      });

      if (!response.ok) {
        throw new Error(`API Error: ${response.status}`);
      }

      const { jobId: newJobId, websocketUrl } = await response.json();
      setJobId(newJobId);
      setStatus('processing');

      // Connect WebSocket
      const ws = new WebSocket(websocketUrl);
      setWebsocket(ws);

      ws.onmessage = (event) => {
        const update = JSON.parse(event.data);
        
        switch (update.type) {
          case 'progress':
            setProgress(update.data);
            break;
          case 'job_complete':
            setStatus('completed');
            setProgress(prev => ({ ...prev, ...update.data }));
            ws.close();
            break;
          case 'material_complete':
            // Handle individual material completion
            console.log(`Material completed: ${update.data.materialName}`);
            break;
          case 'material_failed':
            // Handle individual material failure
            console.error(`Material failed: ${update.data.materialName}`, update.data.error);
            break;
        }
      };

      ws.onerror = (error) => {
        console.error('WebSocket error:', error);
        setStatus('failed');
      };

      return newJobId;
    } catch (error) {
      console.error('Failed to start processing:', error);
      setStatus('failed');
      throw error;
    }
  };

  const controlJob = async (action: 'pause' | 'resume' | 'stop') => {
    if (!jobId) return;

    try {
      await fetch(`${API_BASE_URL}/api/image-processing/control/${jobId}`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ action })
      });
    } catch (error) {
      console.error(`Failed to ${action} job:`, error);
    }
  };

  const getJobStatus = async () => {
    if (!jobId) return null;

    try {
      const response = await fetch(`${API_BASE_URL}/api/image-processing/status/${jobId}`);
      return await response.json();
    } catch (error) {
      console.error('Failed to get job status:', error);
      return null;
    }
  };

  useEffect(() => {
    return () => {
      if (websocket) {
        websocket.close();
      }
    };
  }, [websocket]);

  return {
    startProcessing,
    controlJob,
    getJobStatus,
    progress,
    status,
    jobId
  };
};

export default useBulkImageProcessor;
```

---

## G-code Processing Integration

### Existing Integration Pattern:
The G-code processing is already integrated via the `useBrickMortar` hook. No changes needed.

### Configuration Management:
Continue using the existing pattern with the `config_files` table and admin panel configuration.

---

## Error Handling Updates

### New API Error Format:
```typescript
interface APIError {
  error: string;
  details?: any;
  timestamp?: string;
  jobId?: string;
}
```

### Error Handling Example:
```typescript
const handleAPIError = (error: APIError) => {
  switch (error.error) {
    case 'Cannot connect to host':
      // Supabase connection issue
      showError('Database connection failed. Please check configuration.');
      break;
    case 'Storage upload failed':
      // Supabase storage issue
      showError('File upload failed. Please try again.');
      break;
    case 'Database update failed':
      // Database update issue
      showError('Failed to update material record.');
      break;
    default:
      showError(`Processing failed: ${error.error}`);
  }
};
```

---

## WebSocket Integration Details

### Message Types:
```typescript
interface WebSocketMessage {
  type: 'progress' | 'material_complete' | 'material_failed' | 'job_complete' | 'job_control';
  jobId: string;
  data: any;
}
```

### Message Handling:
```typescript
const handleWebSocketMessage = (event: MessageEvent) => {
  const message: WebSocketMessage = JSON.parse(event.data);
  
  switch (message.type) {
    case 'progress':
      updateProgressBar(message.data);
      break;
    case 'material_complete':
      markMaterialAsComplete(message.data.materialId);
      break;
    case 'material_failed':
      markMaterialAsFailed(message.data.materialId, message.data.error);
      break;
    case 'job_complete':
      finalizeProcessing(message.data);
      break;
    case 'job_control':
      updateJobControlStatus(message.data.action, message.data.status);
      break;
  }
};
```

---

## Environment Variables Required

### Development (.env.development):
```env
VITE_BRICK_MORTAR_API_URL=http://localhost:9000
VITE_SUPABASE_URL=your_supabase_url
VITE_SUPABASE_SERVICE_ROLE_KEY=your_service_role_key
```

### Production (.env.production):
```env
VITE_BRICK_MORTAR_API_URL=https://api.yourdomain.com
VITE_SUPABASE_URL=your_supabase_url
VITE_SUPABASE_SERVICE_ROLE_KEY=your_service_role_key
```

---

## CORS Configuration

### Development:
The API is currently configured to allow all origins (`*`) for development.

### Production:
Update the API's CORS configuration to include your specific domains:

```python
# In main.py
app.add_middleware(
    CORSMiddleware,
    allow_origins=[
        "https://yourdomain.com",
        "https://app.yourdomain.com"
    ],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)
```

---

## Testing Integration

### Development Testing:
```typescript
// Test API connectivity
const testAPIConnection = async () => {
  try {
    const response = await fetch(`${API_BASE_URL}/api/health`);
    const data = await response.json();
    console.log('API Status:', data.status); // Should be "healthy"
  } catch (error) {
    console.error('API connection failed:', error);
  }
};

// Test image processing with mock data
const testImageProcessing = async () => {
  const mockMaterials = [
    {
      id: 'test-1',
      name: 'Test Material 1',
      imageUrl: 'https://picsum.photos/200/200.jpg'
    }
  ];
  
  // This will fail at upload but test the API logic
  const jobId = await startProcessing(mockMaterials);
  console.log('Test job started:', jobId);
};
```

---

## Performance Considerations

### Recommended Configuration:
```typescript
const processingOptions = {
  concurrency: 3,        // Optimal for most servers
  retryAttempts: 3,      // Good balance of reliability vs speed
  retryDelay: 2000,      // 2 second delay between retries
  timeout: 30000         // 30 second timeout per request
};
```

### Monitoring Performance:
```typescript
const startTime = Date.now();

// After job completion
const endTime = Date.now();
const totalTime = endTime - startTime;
const averageTimePerImage = totalTime / materials.length;

console.log(`Processing completed in ${totalTime}ms`);
console.log(`Average time per image: ${averageTimePerImage}ms`);
```

---

## Migration Checklist

### Pre-Migration:
- [ ] API deployed and accessible
- [ ] Environment variables configured  
- [ ] CORS settings updated for production
- [ ] Supabase credentials tested

### During Migration:
- [ ] Update API endpoints in frontend code
- [ ] Replace polling with WebSocket connections
- [ ] Update error handling for new format
- [ ] Test job control functionality

### Post-Migration:
- [ ] Remove old edge function code
- [ ] Update documentation
- [ ] Monitor performance improvements
- [ ] Gather user feedback

---

*This document provides practical examples for frontend developers integrating with the Brick & Mortar Python API.*