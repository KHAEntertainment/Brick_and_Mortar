# Brick & Mortar API - G-Code Processing & Image Management

FastAPI service providing G-code processing and bulk image processing for 3D printing materials management.

## Features

### G-Code Processing:
- Multi-slicer support (BambuStudio, OrcaSlicer, PrusaSlicer)
- Real-time G-code processing with brick & mortar layer insertion
- 3D preview data generation with tool change visualization
- Advanced processing parameters and material presets

### Image Processing:
- **Bulk image processing** with concurrent execution
- **Real-time progress tracking** via WebSocket connections
- **Job management** with pause/resume/stop controls
- **Automatic retry logic** with exponential backoff
- **Supabase integration** for storage and database updates

### Infrastructure:
- **Production-ready Docker deployment** with Traefik integration
- **Environment-based configuration** for development/production
- **Internet exposure** with SSL and basic authentication
- **Health monitoring** and auto-restart capabilities
- **CORS security** with environment-specific origin controls
- **Comprehensive logging** and error handling
- **RESTful API** with OpenAPI documentation

## Quick Start

### Development
```bash
# Create virtual environment
python3 -m venv venv
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Run the API (default: port 9000)
python main.py
```

### Docker

#### Development:
```bash
# Build and run with Docker Compose
docker-compose -f docker/docker-compose.yml up --build
```

#### Production (Docker Server):
```bash
# Deploy to Docker Swarm (builds automatically)
docker stack deploy -c docker/docker-compose.production.yml bm-api
```

### Testing
```bash
# Test the health endpoint
curl http://localhost:9000/api/health

# Run comprehensive tests
python test_image_api.py

# Test G-code processing
curl -X POST "http://localhost:9000/api/validate" \
  -H "Content-Type: multipart/form-data" \
  -F "file=@your_file.gcode"
```

## API Endpoints

### G-Code Processing Endpoints

#### `GET /api/health`
Health check endpoint
- **Output**: `{"status": "healthy", "service": "brick-mortar-api"}`

#### `POST /api/validate`
Validate G-code format and compatibility
- **Input**: G-code file upload
- **Output**: Validation status, slicer format, layer count, compatibility info

#### `POST /api/process`
Process G-code with brick & mortar modifications
- **Input**: G-code file + processing parameters
- **Output**: Processed G-code + preview data + processing statistics

#### `POST /api/preview`
Generate preview data without processing
- **Input**: G-code file
- **Output**: 3D visualization data with layer and tool change information

### Image Processing Endpoints

#### `POST /api/image-processing/bulk-process`
Start bulk image processing job
- **Input**: Materials list + processing options + Supabase config
- **Output**: Job ID + WebSocket URL for real-time updates

#### `GET /api/image-processing/status/{job_id}`
Get detailed job status and progress
- **Output**: Job status, progress metrics, results, logs

#### `POST /api/image-processing/control/{job_id}`
Control job execution (pause/resume/stop)
- **Input**: `{"action": "pause|resume|stop"}`
- **Output**: Job control confirmation

#### `POST /api/image-processing/single-process`
Process single material image
- **Input**: Material info + Supabase config
- **Output**: Processing result with local image URL

#### `WS /ws/{job_id}`
WebSocket endpoint for real-time progress updates
- **Messages**: Progress updates, material completion, job status changes

## Processing Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `material_preset` | string | "PETG_TPU" | Material combination preset |
| `z_offset` | float | 0.1 | Mid-layer Z offset for mortar layers |
| `xy_shift` | float | 0.2 | Brick pattern X/Y offset |
| `mortar_temp` | int | 225 | T1 nozzle temperature |
| `mortar_speed` | int | 100 | T1 speed percentage |
| `extrusion_multiplier` | float | 1.05 | Mortar overextrusion factor |
| `enable_preview` | bool | true | Generate preview data |

## Frontend Integration

### 3D Printing Portal Integration
This API is designed to integrate with the khaent-3dprinting-app frontend. Key integration points:

- **BulkImageProcessor Component**: Migrates from edge functions to Python API for 10x performance improvement
- **Brick & Mortar Settings**: Configuration management via admin panel
- **Real-time Updates**: WebSocket integration for live progress tracking
- **Job Control**: User interface for pause/resume/stop functionality

### Configuration Management
The API integrates with the existing `config_files` table pattern:
```json
{
  "currentEnvironment": "development",
  "development": {"baseUrl": "http://localhost:9000"},
  "production": {"baseUrl": "https://api.yourdomain.com"}
}
```

### CORS Configuration
- **Development**: Allows all origins (`*`)
- **Production**: Configure specific domains for security

## Architecture

```
┌─────────────────────┐    ┌─────────────────────┐    ┌─────────────────────┐
│  Frontend Portal    │───▶│    FastAPI Server   │───▶│   Supabase Storage  │
│   (React/Next.js)   │    │     (Python)        │    │   & Database        │
└─────────────────────┘    └─────────────────────┘    └─────────────────────┘
          │                          │                          │
          ▼                          ▼                          ▼
┌─────────────────────┐    ┌─────────────────────┐    ┌─────────────────────┐
│   WebSocket Client  │◄───│   WebSocket Server  │    │   Image Processing  │
│   (Real-time UI)    │    │   (Progress Updates)│    │   & Upload System   │
└─────────────────────┘    └─────────────────────┘    └─────────────────────┘
          │                          │                          │
          ▼                          ▼                          ▼
┌─────────────────────┐    ┌─────────────────────┐    ┌─────────────────────┐
│   Job Control UI    │    │   Job Management    │    │   G-Code Processor  │
│ (Pause/Resume/Stop) │    │     System          │    │   & Preview Data    │
└─────────────────────┘    └─────────────────────┘    └─────────────────────┘
```

## Project Structure

```
brick-mortar-api/
├── main.py                           # FastAPI application with all endpoints
├── requirements.txt                  # Python dependencies
├── test_image_api.py                # Comprehensive API tests
├── test_api.py                      # G-code processing tests
├── .env.example                     # Environment variable documentation
├── .dockerignore                    # Docker build exclusions
├── docker/                          # Docker configuration files
│   ├── Dockerfile                   # Container build configuration
│   ├── docker-compose.yml          # Development deployment
│   └── docker-compose.production.yml # Production deployment
├── DEPLOYMENT.md                    # Deployment guide
├── API_STATUS.md                    # Current implementation status
├── INTEGRATION_POINTS.md            # Frontend integration examples
├── CLAUDE_TO_LOVABLE_UPDATES.md     # Updates for frontend team
└── README.md                        # This file
```

## Performance Features

### Concurrent Processing
- **Configurable concurrency**: 1-10 simultaneous image processing jobs
- **Semaphore-based control**: Prevents system overload
- **Resource management**: Automatic session cleanup

### Real-time Updates
- **WebSocket connections**: Instant progress updates
- **No polling required**: Eliminates unnecessary API calls
- **Live job control**: Pause/resume/stop without page refresh

### Error Handling & Retry
- **Exponential backoff**: Smart retry timing (2^attempt seconds)
- **Detailed error messages**: Specific failure reasons
- **Graceful degradation**: Continues processing other items on failure

## Documentation

- **API_STATUS.md**: Current implementation status and deployment info
- **INTEGRATION_POINTS.md**: Detailed frontend integration examples
- **DEPLOYMENT.md**: Complete deployment guide for development and production
- **CLAUDE_TO_LOVABLE_UPDATES.md**: Change notifications for frontend developers

## Support

For integration support and questions:
1. Check `INTEGRATION_POINTS.md` for code examples
2. Review `API_STATUS.md` for current capabilities
3. Use the issue tracking system for bugs and feature requests