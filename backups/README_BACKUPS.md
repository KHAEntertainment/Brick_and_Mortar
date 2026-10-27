# Backup Documentation - Brick & Mortar Original Versions

**Backup Created**: 2025-07-07T14:00:00Z  
**Purpose**: Safety backup before project restructure to modular architecture

## What's Backed Up

### Original Slicer Scripts (`original-versions/`)

#### `brick_and_mortar.py` (v0.4)
- **Purpose**: Main production slicer post-processing script
- **Status**: ✅ Tested and working with BambuStudio H2D
- **Usage**: `python brick_and_mortar.py input.gcode output.gcode`
- **Features**: Brick & mortar layer insertion, tool changes, Z-offset, X/Y shift
- **Last Tested**: BambuStudio with H2D printer

#### `brick_and_mortar-debug.py`
- **Purpose**: Debug version with verbose output
- **Status**: ✅ Working
- **Usage**: Same as main script but with detailed logging
- **Features**: All main features + detailed processing information

#### `brick_and_mortar-non-verbose.py`
- **Purpose**: Clean processing without debug output
- **Status**: ✅ Working
- **Usage**: Same as main script but minimal console output

#### Test Files (`test_examples/` and `test_gcode/`)
- **Purpose**: Known working G-code files for testing
- **Includes**: Various BambuStudio outputs, processed examples
- **Status**: ✅ Verified working test cases

### Current API Implementation (`api-versions/`)

#### `main.py` (895 lines)
- **Purpose**: Current monolithic FastAPI application
- **Status**: ✅ Production ready with both G-code and image processing
- **Features**:
  - G-code processing via embedded `GCodeProcessor` class
  - Bulk image processing with WebSocket support
  - Job management and real-time progress tracking
  - Health monitoring and comprehensive error handling

#### `requirements.txt`
- **Purpose**: Current API dependencies
- **Status**: ✅ All dependencies tested and working

## Emergency Rollback Procedure

If the new modular system has issues, use this procedure to restore working versions:

### Restore Standalone Scripts:
```bash
cd "/Users/bbrenner/Documents/Scripting Projects/Brick and Mortar"
cp brick-mortar-api/backups/original-versions/brick_and_mortar.py ./
cp brick-mortar-api/backups/original-versions/brick_and_mortar-debug.py ./
cp brick-mortar-api/backups/original-versions/brick_and_mortar-non-verbose.py ./
```

### Restore API:
```bash
cd "/Users/bbrenner/Documents/Scripting Projects/Brick and Mortar/brick-mortar-api"
cp backups/api-versions/main.py ./
cp backups/api-versions/requirements.txt ./
# Restart API service
```

### Verification Tests:
```bash
# Test standalone script
python brick_and_mortar.py backups/original-versions/test_examples/Cube_PETG_48m53s.gcode test_output.gcode

# Test API
curl http://localhost:9000/api/health
```

## Original Configuration Details

### Standalone Script Parameters:
- **base_tool**: T0 (PETG/ABS structural material)
- **alt_tool**: T1 (TPU mortar material)
- **layer_height**: 0.2mm
- **mortar_offset_z**: 0.1mm (mid-layer offset)
- **brick_offset_xy**: 0.25mm (interlocking offset)
- **mortar_extrusion_factor**: 1.05 (5% overextrusion)
- **mortar_temp**: 225°C (T1 temperature)

### API Endpoints (Current):
- `GET /api/health` - Service health check
- `POST /api/validate` - G-code validation
- `POST /api/preview` - Preview generation
- `POST /api/process` - G-code processing
- `POST /api/image-processing/bulk-process` - Bulk image processing
- `GET /api/image-processing/status/{job_id}` - Job status
- `POST /api/image-processing/control/{job_id}` - Job control
- `WS /ws/{job_id}` - WebSocket progress updates

## Compatibility Notes

### Known Working Configurations:
- **BambuStudio 1.9.x** + **Bambu H2D** = ✅ Fully tested and working
- **Layer Detection**: M991 S0 P + "notify layer change" pattern
- **Slicer Format**: "bambu" detection working correctly

### Test Results:
- ✅ G-code validation working
- ✅ Layer insertion accurate
- ✅ Tool changes properly inserted
- ✅ Preview generation functional
- ✅ API endpoints responding correctly
- ✅ WebSocket updates working
- ✅ Job control (pause/resume/stop) working

## Important Notes

1. **Do not delete these backups** until new modular system is proven stable
2. **Test rollback procedure** before deploying new system to production
3. **Keep this documentation updated** if backups are refreshed
4. **Version compatibility**: These backups work with current Docker deployment
5. **Dependencies**: API backup requires same Python environment as current system

---

**Next Steps**: Use these backups as the baseline for extracting core logic into the new modular system. All new implementations should produce identical output to these proven working versions.