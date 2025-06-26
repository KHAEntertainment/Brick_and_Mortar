# Brick & Mortar G-Code Processor API

FastAPI service for processing G-code files with brick & mortar multi-material printing techniques.

## Features

- Multi-slicer support (BambuStudio, OrcaSlicer, PrusaSlicer)
- Real-time G-code processing with layer insertion
- 3D preview data generation
- Tool change detection and visualization
- Docker containerized for easy deployment

## Quick Start

### Development
```bash
# Install dependencies
pip install -r requirements.txt

# Run the API
python main.py
```

### Docker
```bash
# Build and run with Docker Compose
docker-compose up --build
```

### Testing
```bash
# Test the health endpoint
curl http://localhost:8000/api/health

# Validate a G-code file
curl -X POST "http://localhost:8000/api/validate" \
  -H "Content-Type: multipart/form-data" \
  -F "file=@your_file.gcode"
```

## API Endpoints

### `GET /api/health`
Health check endpoint

### `POST /api/validate`
Validate G-code format and compatibility
- **Input**: G-code file upload
- **Output**: Validation status and file info

### `POST /api/process`
Process G-code with brick & mortar modifications
- **Input**: G-code file + processing parameters
- **Output**: Processed G-code + preview data + statistics

### `POST /api/preview`
Generate preview data without processing
- **Input**: G-code file
- **Output**: 3D visualization data

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

## Integration with Lovable

This API is designed to integrate with the Lovable-based 3D printing portal. The frontend components consume these endpoints to provide a seamless user experience.

CORS is configured to allow requests from your Lovable application domain.

## Architecture

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Lovable UI    │───▶│   FastAPI       │───▶│   G-Code        │
│   (React/TS)    │    │   (Python)      │    │   Processor     │
└─────────────────┘    └─────────────────┘    └─────────────────┘
        │                        │                        │
        ▼                        ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   3D Preview    │    │   File Upload   │    │   Preview Data  │
│   (Three.js)    │    │   Processing    │    │   Generation    │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```