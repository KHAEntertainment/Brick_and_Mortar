# Printer Test Recommendation

**Date**: 2025-07-10  
**Status**: Ready for Testing  

## 🎯 **RECOMMENDATION: Use the NEW v2.0 Output**

### ❌ **Don't Use**: `examples/NEW-Cube_PROPERLY_PROCESSED.gcode`
- **File Date**: June 22, 2025 (outdated)
- **Processing**: Pre-v2.0 system 
- **Status**: Legacy output, not current

### ✅ **DO Use**: `CURRENT_v2_test_output.gcode`
- **Generated**: Today with v2.0 system
- **Processing**: Latest algorithms and validation
- **Status**: Current, verified output

## 📊 **Comparison: Old vs New Output**

| Feature | June File (Legacy) | Today's v2.0 File |
|---------|-------------------|-------------------|
| **Mortar Layers** | 74 layers | 62 layers |
| **Tool Changes** | 148 total | 124 total |  
| **Processing System** | Pre-v2.0 | Current v2.0 |
| **Validation** | Old logic | Enhanced validation |
| **Comments** | "TPU mortar" | "mortar material" |
| **Error Handling** | Basic | Comprehensive |
| **Layer Markers** | Standard | Numbered (better) |

## 🔍 **Key Differences in v2.0 Output**

### **Enhanced Tool Change Format**
```gcode
;LAYER_CHANGE_MORTAR
;BRICK_MORTAR_LAYER 1 at Z=0.300  ← Numbered layers
G1 Z0.300 F600
T1 ;TOOL_CHANGE:1 ; Switch to mortar material  ← Updated comment
M104 T1 S225
M106 S128
[mortar moves with XY offset and extrusion multiplier]
T0 ;TOOL_CHANGE:0 ; Revert to base tool
```

### **Improved Processing**
- **Better Layer Detection**: More accurate BambuStudio parsing
- **Enhanced Validation**: Comprehensive G-code syntax checking  
- **Precise Z-Heights**: Calculated from actual layer analysis
- **Optimized Offsets**: XY shifts applied consistently
- **Error Recovery**: Robust handling of edge cases

## 🎯 **Print Test Plan**

### **Recommended Test File**
```bash
# Use this file for your printer test:
CURRENT_v2_test_output.gcode
```

### **What to Verify During Print**
1. **Tool Changes Work**: Printer switches between T0 and T1
2. **Temperature Control**: T1 heats to 225°C for mortar layers
3. **Z-Offset Accuracy**: Mortar layers positioned correctly (+0.1mm)
4. **XY Shift Pattern**: Mortar offset by +0.2mm for brick pattern
5. **Layer Adhesion**: Mortar layers bond with structural layers
6. **Overall Quality**: No missing layers or tool change failures

### **Expected Behavior**
- **62 mortar layers** inserted between structural layers
- **124 tool changes** total (T0→T1→T0 per mortar layer)
- **Brick pattern offset** visible in mortar layers
- **Consistent layer heights** throughout print

## ⚠️ **Important Notes**

### **Material Setup Required**
- **T0**: PETG/ABS structural material
- **T1**: TPU mortar material at 225°C
- **Both extruders** properly calibrated and loaded

### **Printer Configuration**
- **Multi-material setup** (dual extruder or AMS)
- **Tool change sequence** configured in firmware
- **Temperature control** for both materials

### **What This Test Validates**
- ✅ **v2.0 Core Logic**: Latest processing algorithms
- ✅ **Tool Change Commands**: Proper T0/T1 switching  
- ✅ **Parameter Application**: Z-offset, XY-shift, temperatures
- ✅ **Layer Integration**: Mortar bonds with structural layers
- ✅ **Overall System**: End-to-end brick & mortar printing

## 🎉 **Expected Result**

A successful print should show:
- **Strong interlocking structure** from brick pattern offsets
- **Visible mortar layers** bonding structural elements
- **Consistent layer adhesion** throughout the print
- **No tool change artifacts** or missing sections

---

## 📋 **Summary**

**Use `CURRENT_v2_test_output.gcode` for your printer test** - it represents the latest v2.0 processing with all improvements and validations. The June file, while functional, uses outdated processing logic.

The v2.0 output has been generated with our latest modular system and includes all the enhancements from the recent restructure.

**Ready for testing!** 🚀