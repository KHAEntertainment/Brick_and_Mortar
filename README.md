# Brick & Mortar Multi-Material 3D Printing

**Version**: 2.0.0 (Modular Architecture)  
**Status**: Production Ready  
**License**: MIT

A modular G-code processing system that enables "Brick & Mortar" multi-material 3D printing by inserting TPU mortar layers between structural material layers with intelligent X/Y offsetting for interlocking strength.

## 🚀 Quick Start

### Standalone Script (Recommended for Slicer Integration)
```bash
# Basic usage
python3 brick_and_mortar.py input.gcode output.gcode

# With custom parameters
python3 brick_and_mortar.py input.gcode output.gcode \
  --preset PLA_PETG \
  --z-offset 0.15 \
  --xy-shift 0.3 \
  --mortar-temp 235
```

### API Service
```bash
cd api
pip install -r requirements.txt
python3 main_modular.py
# Access at http://localhost:9000
```

### Docker Deployment
```bash
cd docker
docker-compose up --build
```

## 📁 Project Structure

```
/Brick and Mortar/
├── brick_and_mortar.py          # 🎯 Main standalone script
├── brick_and_mortar_debug.py    # 🐛 Debug version
├── brick_and_mortar_simple.py   # ⚡ Minimal output version
├── core/                        # 🧠 Shared processing logic
│   ├── processors/              #    G-code processing algorithms
│   ├── models/                  #    Data models and validation
│   └── utils/                   #    Slicer detection & parsing
├── api/                         # 🌐 Web service (FastAPI)
│   ├── endpoints/               #    REST API routes
│   ├── services/                #    Business logic services
│   ├── middleware/              #    CORS, auth, etc.
│   └── websocket/               #    Real-time communication
├── distribution/                # 📦 Additional access methods
│   └── curl/                    #    CURL-based integration
├── tests/                       # 🧪 Comprehensive testing
├── docker/                      # 🐳 Deployment configuration
├── examples/                    # 📄 Sample G-code files
├── backups/                     # 💾 Safety backups
└── archive/                     # 📚 Original legacy files
```

## 🎯 Features

### Multi-Material Processing
- **Automatic Layer Detection**: Supports BambuStudio, OrcaSlicer, PrusaSlicer
- **Intelligent Mortar Insertion**: TPU layers between structural layers
- **Brick Pattern Offsetting**: X/Y shifts for interlocking strength
- **Temperature Management**: Automatic tool change with heating
- **Extrusion Control**: Enhanced flow for mortar layers

### Multiple Access Methods
1. **Standalone Scripts**: Direct slicer post-processing integration
2. **REST API**: Full-featured web service with job management
3. **CURL Integration**: HTTP API access without Python setup
4. **WebSocket Support**: Real-time progress updates

### Production Ready
- **Docker Deployment**: Container-based deployment with Traefik
- **Comprehensive Testing**: 100% compatibility validation
- **Error Handling**: Robust validation and recovery
- **Safety Backups**: Instant rollback capabilities

## 🛠️ Material Presets

| Preset | Base Material | Mortar Material | Temp | Z Offset | XY Shift | Extrusion |
|--------|---------------|-----------------|------|----------|----------|-----------|
| **PETG_TPU** | PETG | TPU | 225°C | 0.1mm | 0.2mm | 1.05x |
| **PLA_PETG** | PLA | PETG | 240°C | 0.08mm | 0.15mm | 1.02x |
| **ABS_TPU** | ABS | TPU | 230°C | 0.12mm | 0.25mm | 1.08x |

## 🔌 Slicer Integration

### BambuStudio/OrcaSlicer
Add to **Machine** → **Post-processing scripts**:
```bash
python3 "/path/to/brick_and_mortar.py" "[output_file_path]" "[output_file_path].bm"
mv "[output_file_path].bm" "[output_file_path]"
```

### PrusaSlicer
Add to **Print Settings** → **Output options** → **Post-processing scripts**:
```bash
python3 "/path/to/brick_and_mortar.py" "[input_file_path]" "[output_file_path]"
```

### No Python Setup Required (CURL-based)
```bash
# Using Python CURL wrapper
python3 "/path/to/distribution/curl/curl_processor.py" "[output_file_path]" "[output_file_path].bm" --quiet
mv "[output_file_path].bm" "[output_file_path]"

# Using pure bash script (requires curl and jq)
"/path/to/distribution/curl/curl_simple.sh" "[output_file_path]" "[output_file_path].bm"
mv "[output_file_path].bm" "[output_file_path]"
```

## 🧪 Testing & Validation

```bash
# Comprehensive test suite
python3 tests/comprehensive_test_suite.py

# Test standalone scripts
python3 brick_and_mortar.py examples/Cube_PETG_48m53s.gcode test_output.gcode

# Verify mortar layers were added
grep "BRICK_MORTAR_LAYER" test_output.gcode

# API health check
curl http://localhost:9000/api/health
```

## 📚 Documentation

- **[CLAUDE.md](CLAUDE.md)** - Complete development guide
- **[API Documentation](api/)** - REST API reference
- **[Testing Guide](tests/)** - Testing framework and validation
- **[Docker Guide](docker/)** - Deployment and container setup
- **[Distribution Methods](distribution/)** - Alternative access methods

## 🔄 Architecture

### Unified Core Logic
All distribution methods use the same core processing algorithm, ensuring consistent results whether using standalone scripts, API endpoints, or CURL integration.

### Modular Design
- **Core**: Shared processing logic
- **API**: Web service components
- **Distribution**: Alternative access methods
- **Tests**: Validation framework

### Safety First
- Complete backups of all working versions
- Instant rollback procedures
- Comprehensive testing before any changes
- Preservation of all original functionality

## 🚀 Getting Started

### Prerequisites
- Python 3.7+ (for standalone scripts and API)
- Docker (optional, for containerized deployment)
- curl (optional, for CURL-based integration)

### Installation
```bash
# Clone or download the project
cd "/path/to/Brick and Mortar"

# For API development
cd api
pip install -r requirements.txt

# Test installation
python3 brick_and_mortar.py --help
```

### First Processing
```bash
# Use sample G-code file
python3 brick_and_mortar.py examples/Cube_PETG_48m53s.gcode my_first_output.gcode

# Check results
grep -c "BRICK_MORTAR_LAYER" my_first_output.gcode
# Should show number of mortar layers added
```

## 🤝 Integration with Khaent 3D Printing App

This system is part of the larger [Khaent 3D Printing App](../../../Material%20Testing%20DB/khaent-3dprinting-app/) project:

- **Main App**: React/TypeScript materials portal with Supabase backend
- **This System**: G-code processing feature with web integration
- **Communication**: API endpoints called from React components

## 📄 License

MIT License - Feel free to use, modify, and distribute.

## 🆘 Support & Troubleshooting

### Common Issues
1. **Import Errors**: Ensure you're running from the project root directory
2. **API Not Starting**: Check port 9000 is available, install requirements
3. **Processing Failures**: Use debug mode (`--debug`) for verbose output
4. **Slicer Integration**: Verify file paths in post-processing scripts

### Emergency Rollback
```bash
# Use original legacy versions if needed
python3 archive/brick_and_mortar_v1.py input.gcode output.gcode

# Or restore from backups
cp backups/original-versions/brick_and_mortar.py ./brick_and_mortar_emergency.py
```

### Get Help
- Check the comprehensive [CLAUDE.md](CLAUDE.md) guide
- Review test output: `python3 tests/comprehensive_test_suite.py`
- Examine example files in `examples/` directory

---

**Brick & Mortar v2.0** - Modular, tested, production-ready multi-material 3D printing G-code processing.