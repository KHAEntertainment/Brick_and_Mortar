# Brick & Mortar API Architecture v2.0

**Status**: Development  
**Created**: 2025-07-10  
**Version**: 2.0.0

## Overview

This document describes the new modular architecture for the Brick & Mortar API, designed to separate core G-code processing logic from distribution methods while maintaining backward compatibility.

## Architecture Principles

### 1. Single Source of Truth
- Core G-code processing logic unified across all distribution methods
- No duplication between standalone scripts and API endpoints
- Consistent behavior regardless of access method

### 2. Modular Design
- Clear separation between core logic, distribution, and API layers
- Independent testing and deployment of components
- Easy to add new distribution methods

### 3. Backward Compatibility
- All existing API endpoints preserved
- Standalone script functionality maintained
- Configuration formats unchanged

## Directory Structure

```
brick-mortar-api/
├── core/                           # Core processing logic
│   ├── processors/                 # G-code processing classes
│   │   └── gcode_processor.py     # Unified core processor
│   ├── models/                     # Data models
│   │   ├── processing_params.py   # Parameter definitions
│   │   └── processing_response.py # Response formats
│   └── utils/                      # Shared utilities
│       ├── slicer_detection.py    # Slicer format detection
│       └── gcode_parser.py        # G-code parsing utilities
├── distribution/                   # Distribution methods
│   ├── standalone/                 # Direct script distribution
│   │   ├── brick_and_mortar.py   # Main standalone script
│   │   ├── debug_version.py      # Debug script
│   │   └── non_verbose.py        # Clean output script
│   └── curl/                      # CURL-based integration
│       ├── curl_processor.py     # CURL wrapper script
│       └── examples/              # Integration examples
├── api/                           # API components
│   ├── endpoints/                 # API route handlers
│   │   ├── gcode_endpoints.py    # G-code processing routes
│   │   └── image_endpoints.py    # Image processing routes
│   ├── middleware/                # API middleware
│   │   ├── cors_config.py        # CORS configuration
│   │   └── error_handlers.py     # Error handling
│   └── websocket/                 # WebSocket handlers
│       └── progress_handler.py   # Real-time updates
├── tests/                         # Testing framework
│   ├── unit/                     # Unit tests
│   ├── integration/              # Integration tests
│   └── fixtures/                 # Test data
├── backups/                      # Safety backups
│   ├── original-versions/        # Original scripts
│   └── api-versions/            # Current API backup
├── docker/                       # Container configuration
└── main.py                       # API entry point (modular)
```

## Core Components

### GCodeProcessor (core/processors/gcode_processor.py)
- **Purpose**: Unified G-code processing logic
- **Features**: Slicer detection, layer insertion, tool changes
- **Usage**: Used by both standalone scripts and API endpoints
- **Input**: G-code lines + processing parameters
- **Output**: Processed G-code + preview data + statistics

### ProcessingParams (core/models/processing_params.py)
- **Purpose**: Standardized parameter format
- **Features**: Validation, defaults, type checking
- **Usage**: Shared across all distribution methods

### SlicerDetector (core/utils/slicer_detection.py)
- **Purpose**: Detect BambuStudio, OrcaSlicer, PrusaSlicer formats
- **Features**: Pattern matching, compatibility checks
- **Usage**: Used by core processor for format-specific handling

## Distribution Methods

### 1. Standalone Scripts (distribution/standalone/)
- **Target**: Direct slicer post-processing integration
- **Usage**: `python brick_and_mortar.py input.gcode output.gcode`
- **Features**: Command-line interface, file-based processing
- **Implementation**: Thin wrapper around core processor

### 2. CURL Integration (distribution/curl/)
- **Target**: HTTP-based slicer integration
- **Usage**: CURL commands from slicer post-processing
- **Features**: HTTP API calls, file upload/download
- **Implementation**: CURL scripts that call API endpoints

### 3. API Endpoints (api/endpoints/)
- **Target**: Web application integration
- **Usage**: FastAPI REST endpoints + WebSocket
- **Features**: JSON responses, real-time progress, job management
- **Implementation**: FastAPI routes using core processor

## Data Flow

### Standalone Processing
```
Input G-code → Core Processor → Output G-code
```

### API Processing
```
HTTP Request → API Endpoint → Core Processor → JSON Response
```

### CURL Processing
```
CURL Script → HTTP Request → API Endpoint → Core Processor → File Download
```

## Configuration Management

### Environment-Based Configuration
- **Development**: Local file processing, verbose logging
- **Production**: HTTP endpoints, error logging only
- **Testing**: Mock data, comprehensive logging

### Parameter Standardization
- **Material Presets**: PETG_TPU, PLA_PETG, Custom
- **Processing Options**: Z-offset, XY-shift, temperatures, speeds
- **Output Options**: Preview generation, statistics collection

## Testing Strategy

### Unit Tests (tests/unit/)
- Core processor functionality
- Parameter validation
- Utility functions
- Data model validation

### Integration Tests (tests/integration/)
- End-to-end standalone script processing
- API endpoint functionality
- CURL script integration
- Cross-format compatibility

### Performance Tests
- Large file processing
- Concurrent API requests
- Memory usage validation
- Response time benchmarks

## Safety Measures

### Version Control
- **Stable Branch**: Production-ready core logic
- **Development Branch**: New features and improvements
- **Backup System**: Automatic rollback capability

### Validation
- **Output Comparison**: New vs. original processing results
- **Regression Testing**: Automated validation of core functionality
- **Manual Testing**: Human verification of complex scenarios

### Rollback Procedures
- **Instant Rollback**: Restore backed up working versions
- **Partial Rollback**: Revert specific components only
- **Emergency Mode**: Bypass new system, use original logic

## Migration Plan

### Phase 1: Core Extraction ✅
- Extract core logic from API and standalone scripts
- Create unified processor class
- Maintain identical output behavior

### Phase 2: API Modularization
- Split monolithic API into focused modules
- Implement new API structure using core processor
- Validate endpoint behavior unchanged

### Phase 3: Distribution Creation
- Create new standalone scripts using core processor
- Implement CURL-based integration scripts
- Validate cross-platform compatibility

### Phase 4: Testing & Validation
- Comprehensive testing across all distribution methods
- Performance validation and optimization
- Documentation and deployment guides

## Future Enhancements

### Planned Features
- **Advanced Material Profiles**: Database-driven material settings
- **Batch Processing**: Multiple file processing in standalone mode
- **Plugin Architecture**: Custom processing steps
- **Cloud Integration**: Remote processing capabilities

### Scalability Considerations
- **Horizontal Scaling**: Multiple API instances
- **Caching Layer**: Redis-based response caching
- **Load Balancing**: Distributed request handling
- **Monitoring**: Comprehensive health and performance metrics

---

**Next Steps**: Proceed with core logic extraction while maintaining full backward compatibility and safety measures.