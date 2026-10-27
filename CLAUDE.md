# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Context

This is the **Brick & Mortar** subdirectory of the larger **Khaent 3D Printing App** project located at `/Users/bbrenner/Documents/Scripting Projects/Material Testing DB/khaent-3dprinting-app`. The Brick & Mortar system is a G-code processing feature that has been fully integrated into the main web application.

**Version**: 2.0.0 (Modular Architecture)  
**Status**: Production Ready  
**Last Updated**: 2025-07-10

## Relationship to Main Project

- **Main App**: React/TypeScript materials portal with Supabase backend
- **This Directory**: Modular G-code processing system with multiple distribution methods
- **Integration**: Components in main app communicate with API service in this directory

## Architecture Overview

The system uses a **modular architecture** with unified core processing logic:

```
/Brick and Mortar/
├── brick_and_mortar.py          # Main standalone script
├── brick_and_mortar_debug.py    # Debug version
├── brick_and_mortar_simple.py   # Minimal output version
├── core/                        # Shared processing logic
│   ├── processors/              # G-code processing
│   ├── models/                  # Data models
│   └── utils/                   # Utilities
├── api/                         # Web service
├── distribution/                # Additional access methods
├── tests/                       # Testing framework
├── docker/                      # Deployment
└── examples/                    # Test data
```

## Development Commands

### Standalone Script Usage
```bash
# Basic processing
python3 brick_and_mortar.py input.gcode output.gcode

# With custom parameters
python3 brick_and_mortar.py input.gcode output.gcode \
  --preset PLA_PETG \
  --z-offset 0.15 \
  --xy-shift 0.3 \
  --mortar-temp 235

# Debug mode with verbose output
python3 brick_and_mortar_debug.py input.gcode output.gcode

# Minimal output for automation
python3 brick_and_mortar_simple.py input.gcode output.gcode

# Validation only (no processing)
python3 brick_and_mortar.py input.gcode output.gcode --validate-only
```

### API Service Development
```bash
# Navigate to API directory
cd api

# Install Python dependencies
pip install -r requirements.txt

# Run development server (default port 9000)
python3 main_modular.py
# API available at: http://localhost:9000

# Configure custom port if 9000 is in use
export BRICK_MORTAR_PORT=8080
python3 main_modular.py
# API available at: http://localhost:8080

# Alternative: use generic PORT variable
export PORT=3000
python3 main_modular.py

# Test API functionality
python3 test_api.py

# Health check (adjust port as needed)
curl http://localhost:9000/api/health
```

### Port Configuration
```bash
# Check what's using port 9000
lsof -i :9000

# Common alternative ports
export BRICK_MORTAR_PORT=8080  # Alternative web port
export BRICK_MORTAR_PORT=3000  # Node.js default
export BRICK_MORTAR_PORT=8888  # Common development port
export BRICK_MORTAR_PORT=9001  # Next sequential port

# For permanent configuration, create .env file
cp .env.example .env
# Edit .env and set: BRICK_MORTAR_PORT=8080
```

### Docker Deployment
```bash
# Use project-level Docker configuration
cd docker

# Build and run with Docker Compose (default port 9000)
docker-compose up --build

# Use custom port for Docker deployment
export BRICK_MORTAR_PORT=8080
docker-compose up --build
# Container will use port 8080 for both internal and external access

# Production deployment
docker-compose -f docker-compose.production.yml up -d

# Check logs
docker-compose logs -f

# Verify port configuration
docker-compose ps
```

### Testing
```bash
# Run comprehensive test suite
python3 tests/comprehensive_test_suite.py

# Test core processor only
python3 tests/test_core_processor.py

# Test output compatibility
python3 tests/test_output_compatibility.py

# Test standalone scripts
python3 tests/test_standalone_scripts.py
```

## Core Processing System

The system implements "Brick & Mortar" multi-material 3D printing by:
- **Unified Core Logic**: Single processing algorithm used by all distribution methods
- **Slicer Detection**: Identifies BambuStudio, OrcaSlicer, or PrusaSlicer format
- **Layer Insertion**: Adds mortar layers (T1) between structural layers (T0)
- **Z-Offset**: Positions mortar at mid-layer height (typically +0.1mm)
- **Brick Pattern**: X/Y offset for interlocking (typically +0.2mm)
- **Extrusion Control**: Enhanced flow for mortar layers (typically 1.05x)

### Processing Flow
```
Input G-code → Slicer Detection → Layer Analysis → Mortar Insertion → Output G-code
```

### Key Parameters
- `base_tool`: T0 (structural material - PETG/ABS)
- `alt_tool`: T1 (mortar material - TPU)
- `z_offset`: Z-height offset for mortar layers
- `xy_shift`: X/Y shift for brick pattern
- `extrusion_multiplier`: Overextrusion factor for mortar
- `mortar_temp`: T1 nozzle temperature
- `mortar_speed`: T1 print speed percentage

## Distribution Methods

### 1. Standalone Scripts (Root Level)
- **brick_and_mortar.py** - Full-featured script with all options
- **brick_and_mortar_debug.py** - Debug version with verbose output
- **brick_and_mortar_simple.py** - Minimal output for automation

### 2. API Endpoints (api/)
- **Modular Architecture**: Clean separation of concerns
- **All Original Endpoints**: Preserved for backward compatibility
- **Enhanced Features**: Better error handling and validation

### 3. CURL Integration (distribution/curl/)
- **Python Wrapper**: `curl_processor.py` for HTTP API access
- **Bash Script**: `curl_simple.sh` for pure shell integration

## Material Presets

### PETG_TPU (Default)
- Mortar temp: 225°C, Z offset: 0.1mm, XY shift: 0.2mm, Extrusion: 1.05x

### PLA_PETG
- Mortar temp: 240°C, Z offset: 0.08mm, XY shift: 0.15mm, Extrusion: 1.02x

### ABS_TPU
- Mortar temp: 230°C, Z offset: 0.12mm, XY shift: 0.25mm, Extrusion: 1.08x

## API Endpoints

**Base URL**: `http://localhost:{PORT}`  
**Default Port**: 9000 (configurable via `BRICK_MORTAR_PORT` environment variable)

### Health Check
- `GET /api/health` - Service status, version info, and port configuration

### G-code Processing
- `POST /api/validate` - Validate G-code format and compatibility
- `POST /api/process` - Process G-code with brick & mortar modifications
- `POST /api/preview` - Generate 3D preview data

### Image Processing
- `POST /api/image-processing/bulk-process` - Bulk image processing
- `GET /api/image-processing/status/{job_id}` - Job status
- `POST /api/image-processing/control/{job_id}` - Job control
- `WS /ws/{job_id}` - WebSocket for real-time updates

## Slicer Integration

### BambuStudio/OrcaSlicer Post-Processing
```bash
# Add to post-processing scripts:
python3 "/path/to/brick_and_mortar.py" "[output_file_path]" "[output_file_path].bm"
mv "[output_file_path].bm" "[output_file_path]"
```

### PrusaSlicer Post-Processing
```bash
# Add to Print Settings > Output options > Post-processing scripts:
python3 "/path/to/brick_and_mortar.py" "[input_file_path]" "[output_file_path]"
```

### CURL-based Integration (No Python Setup Required)
```bash
# Using Python CURL wrapper:
python3 "/path/to/distribution/curl/curl_processor.py" "[output_file_path]" "[output_file_path].bm" --quiet
mv "[output_file_path].bm" "[output_file_path]"

# Using pure bash (requires curl and jq):
"/path/to/distribution/curl/curl_simple.sh" "[output_file_path]" "[output_file_path].bm"
mv "[output_file_path].bm" "[output_file_path]"
```

## Slicer Compatibility

### BambuStudio/OrcaSlicer ✅
- Layer detection: `M991 S0 P` + "notify layer change"
- Fully supported with optimized parsing

### PrusaSlicer ✅
- Layer detection: `;LAYER:` and `;LAYER_CHANGE`
- Standard G-code parsing

### Output Format
- Preserves original G-code structure
- Inserts `BRICK_MORTAR_LAYER` markers
- Adds tool change commands with temperature settings
- Applies X/Y offsets and extrusion multipliers

## Testing and Validation

### Test Data Locations
- `examples/` - Sample G-code files from various slicers
- `test-gcode/` - Additional test files
- `debug/` - Debug output files

### Validation Commands
```bash
# Test standalone script
python3 brick_and_mortar.py examples/Cube_PETG_48m53s.gcode test_output.gcode

# Verify output contains mortar layers
grep "BRICK_MORTAR_LAYER" test_output.gcode

# Run comprehensive tests
python3 tests/comprehensive_test_suite.py

# Test API endpoints
cd api && python3 test_api.py
```

## Development Notes

### Code Style
- Python scripts follow PEP 8 conventions
- Modular architecture with clear separation of concerns
- Comprehensive error handling and validation
- Type hints and Pydantic models for data validation

### Configuration
- Parameters configurable via command line arguments
- API service uses environment variables
- Docker configuration for deployment
- CORS enabled for web integration

### Safety and Rollback
- All original files archived in `archive/` directory
- Complete backups in `backups/` directory
- Instant rollback procedures documented
- Comprehensive testing ensures compatibility

## Integration with Main App

### React Components (in main app)
- `src/components/brick-mortar/BrickMortarProcessor.tsx` - Main UI
- `src/components/brick-mortar/FileUpload.tsx` - File upload
- `src/components/brick-mortar/ParameterPanel.tsx` - Settings controls
- `src/components/brick-mortar/GCodePreview3D.tsx` - 3D visualization
- `src/pages/BrickMortar.tsx` - Route component

### API Integration
- `src/hooks/useBrickMortar.ts` - Custom hook for API calls
- `src/types/gcode.ts` - TypeScript definitions
- Configuration managed via main app's config system

### Dependencies (in main app)
- `three` - 3D graphics library
- `@react-three/fiber` - React Three.js renderer
- `@react-three/drei` - Three.js helpers

## Future Enhancements

### Planned Features
- Advanced material profiles with database integration
- Batch processing capabilities for multiple files
- Plugin architecture for custom processing steps
- Cloud-based processing and storage options

### Architecture Benefits
- **Maintainability**: Single core logic, easy to update
- **Scalability**: Modular components, ready for growth
- **Flexibility**: Multiple access methods for different use cases
- **Testing**: Comprehensive validation framework
- **Documentation**: Complete guides for all use cases

## Related Documentation

See the main project documentation:
- `/Users/bbrenner/Documents/Scripting Projects/Material Testing DB/khaent-3dprinting-app/CLAUDE.md`
- `/Users/bbrenner/Documents/Scripting Projects/Material Testing DB/khaent-3dprinting-app/BRICK_MORTAR_INTEGRATION.md`
- `/Users/bbrenner/Documents/Scripting Projects/Material Testing DB/khaent-3dprinting-app/docs/BRICK_MORTAR_IMPLEMENTATION.md`

## Emergency Procedures

### Rollback to Original Version
```bash
# Use archived original scripts if needed
python3 archive/brick_and_mortar_v1.py input.gcode output.gcode

# Or restore from comprehensive backups
cp backups/original-versions/brick_and_mortar.py ./brick_and_mortar_rollback.py
```

### API Rollback
```bash
cd api
# Use monolithic backup if modular version has issues
cp backups/api-versions/main.py ./main_rollback.py
python3 main_rollback.py
```

---

**Version**: 2.0.0 Modular Architecture  
**Last Updated**: 2025-07-10  
**Status**: Production Ready with Full Backward Compatibility