# Archive - Original Brick & Mortar Files

**Created**: 2025-07-10  
**Purpose**: Preserve original working files before project reorganization

## Contents

### Original Standalone Scripts (v1.0)
- `brick_and_mortar_v1.py` - Original main processing script
- `brick_and_mortar-debug_v1.py` - Original debug version
- `brick_and_mortar-non-verbose_v1.py` - Original clean output version

### Status
These files represent the original working versions before the v2.0 modular restructure. They are preserved for:
- Historical reference
- Emergency rollback if needed
- Comparison with new implementations

### Usage
These files can still be used if needed:
```bash
python3 archive/brick_and_mortar_v1.py input.gcode output.gcode
```

However, the new versions in the project root are recommended for ongoing use as they:
- Use the unified core processing logic
- Have better error handling and validation
- Support more command-line options
- Are actively maintained

### Backup Note
Additional backups of these files also exist in `brick-mortar-api/backups/original-versions/` created during the restructure process.