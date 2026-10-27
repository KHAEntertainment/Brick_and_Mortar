"""
Unified G-code Processor

Core brick & mortar G-code processing logic extracted and unified from 
standalone scripts and API implementations.

Version: 2.0.0
"""

import re
import time
from typing import List, Optional, Dict, Any, Tuple
from ..models.processing_params import ProcessingParams
from ..models.processing_response import (
    ProcessingResponse, ProcessingStats, PreviewData, 
    LayerData, LayerMove, ToolChange
)
from ..utils.slicer_detection import SlicerDetector, SlicerFormat
from ..utils.gcode_parser import GCodeParser

class GCodeProcessor:
    """Unified G-code processor for brick & mortar modifications"""
    
    def __init__(self):
        self.slicer_detector = SlicerDetector()
        self.parser = GCodeParser()
    
    def process(self, lines: List[str], params: ProcessingParams, job_id: Optional[str] = None) -> ProcessingResponse:
        """
        Main processing method - unified entry point for all distribution methods
        
        Args:
            lines: Input G-code lines
            params: Processing parameters
            job_id: Optional job ID for tracking
            
        Returns:
            ProcessingResponse with processed G-code and metadata
        """
        start_time = time.time()
        
        try:
            # Validate input
            if not lines:
                return ProcessingResponse.create_error("Empty G-code input", job_id)
            
            # Detect slicer format
            slicer_format = self.slicer_detector.detect_format(lines)
            
            if params.debug_mode:
                print(f"Detected slicer format: {slicer_format.value}")
            
            # Process the G-code
            processed_lines, stats = self._process_gcode_lines(lines, params, slicer_format)
            
            # Generate preview data if requested
            preview_data = None
            if params.enable_preview:
                preview_data = self._generate_preview_data(processed_lines, slicer_format)
            
            # Calculate processing time
            processing_time = (time.time() - start_time) * 1000
            stats.processing_time_ms = processing_time
            
            if params.debug_mode:
                print(f"Processing completed in {processing_time:.2f}ms")
                print(f"Added {stats.mortar_layers_added} mortar layers")
            
            return ProcessingResponse(
                processed_gcode=processed_lines,
                preview_data=preview_data,
                processing_stats=stats,
                job_id=job_id,
                success=True
            )
            
        except Exception as e:
            error_msg = f"Processing failed: {str(e)}"
            if params.debug_mode:
                print(f"ERROR: {error_msg}")
            return ProcessingResponse.create_error(error_msg, job_id)
    
    def _process_gcode_lines(self, lines: List[str], params: ProcessingParams, slicer_format: SlicerFormat) -> Tuple[List[str], ProcessingStats]:
        """Core G-code processing logic"""
        processed_lines = []
        z_height = 0.0
        prev_z = 0.0
        infill_block = []
        current_layer_lines = []
        layers_processed = 0
        mortar_layers_added = 0
        
        # Auto-detect layer height if not provided
        if params.layer_height is None:
            detected_height = self.slicer_detector.estimate_layer_height(lines)
            layer_height = detected_height or (params.z_offset * 2)
        else:
            layer_height = params.layer_height
        
        if params.debug_mode:
            print(f"Using layer height: {layer_height}mm")
            print(f"Mortar Z offset: {params.z_offset}mm")
            print(f"Brick XY offset: {params.xy_shift}mm")
        
        for i, line in enumerate(lines):
            stripped = line.strip()
            
            # Handle Z moves - critical for layer detection
            if self.parser.is_z_move(stripped):
                coords = self.parser.extract_coordinates(stripped)
                if 'Z' in coords:
                    z_height = coords['Z']
                    
                    # Insert mortar after previous layer if we have infill
                    if prev_z > 0 and infill_block:
                        mortar_z = prev_z + params.z_offset
                        mortar_lines = self._create_mortar_layer(
                            infill_block, mortar_z, params, mortar_layers_added + 1
                        )
                        processed_lines.extend(mortar_lines)
                        mortar_layers_added += 1
                        
                        if params.debug_mode:
                            print(f"  Inserted mortar layer {mortar_layers_added} at Z={mortar_z:.3f}")
                        
                        infill_block = []
                    
                    prev_z = z_height
                
                processed_lines.append(line)
                continue
            
            # Accumulate current layer extrusion moves
            if self.parser.is_extrusion_move(stripped):
                current_layer_lines.append(line)
            
            # Detect layer changes based on slicer format
            if self.slicer_detector.detect_layer_change(stripped, slicer_format):
                if current_layer_lines:
                    infill_block = current_layer_lines.copy()
                    current_layer_lines = []
                    layers_processed += 1
                    
                    if params.debug_mode:
                        print(f"Layer {layers_processed} processed, {len(infill_block)} moves captured")
            
            processed_lines.append(line)
        
        # Handle final layer if needed
        if prev_z > 0 and infill_block:
            mortar_z = prev_z + params.z_offset
            mortar_lines = self._create_mortar_layer(
                infill_block, mortar_z, params, mortar_layers_added + 1
            )
            processed_lines.extend(mortar_lines)
            mortar_layers_added += 1
        
        # Create processing statistics
        stats = ProcessingStats(
            original_layers=layers_processed,
            mortar_layers_added=mortar_layers_added,
            total_tool_changes=mortar_layers_added * 2,  # T1 + T0 per mortar layer
            slicer_format=slicer_format.value,
            original_lines=len(lines),
            processed_lines=len(processed_lines)
        )
        
        return processed_lines, stats
    
    def _create_mortar_layer(self, infill_lines: List[str], z_mortar: float, params: ProcessingParams, layer_number: int) -> List[str]:
        """Create mortar layer with TPU material"""
        lines = []
        
        # Layer header
        lines.extend(self.parser.create_mortar_layer_header(z_mortar, layer_number))
        
        # Tool change to mortar material
        if params.enable_tool_settings:
            tool_change_lines = self.parser.create_tool_change_sequence(
                params.alt_tool, 
                params.mortar_temp, 
                params.mortar_fan_speed,
                "TOOL_CHANGE:1 ; Switch to mortar material"
            )
            lines.extend(tool_change_lines)
        else:
            lines.append(f"{params.alt_tool} ;TOOL_CHANGE:1 ; Switch to mortar material")
        
        # Process infill moves with brick offset and extrusion multiplier
        for line in infill_lines:
            if self.parser.is_movement_command(line) and ('X' in line or 'Y' in line):
                # Apply brick pattern offset
                modified_line = self.parser.apply_coordinate_offset(
                    line, params.xy_shift, params.xy_shift, 0
                )
                
                # Apply extrusion multiplier if this is an extrusion move
                if 'E' in modified_line:
                    modified_line = self.parser.apply_extrusion_multiplier(
                        modified_line, params.extrusion_multiplier
                    )
                
                lines.append(modified_line)
            else:
                lines.append(line)
        
        # Tool change back to base material
        if params.enable_tool_settings:
            lines.append(f"{params.base_tool} ;TOOL_CHANGE:0 ; Revert to base tool")
        else:
            lines.append(f"{params.base_tool} ;TOOL_CHANGE:0 ; Revert to base tool")
        
        return lines
    
    def _generate_preview_data(self, lines: List[str], slicer_format: SlicerFormat) -> PreviewData:
        """Generate preview data for 3D visualization"""
        layers = []
        tool_changes = []
        current_layer = 0
        current_z = 0.0
        
        for i, line in enumerate(lines):
            stripped = line.strip()
            
            # Track layer changes
            if self.slicer_detector.detect_layer_change(stripped, slicer_format):
                current_layer += 1
            
            # Track Z moves
            if self.parser.is_z_move(stripped):
                coords = self.parser.extract_coordinates(stripped)
                if 'Z' in coords:
                    current_z = coords['Z']
            
            # Track tool changes
            if self.parser.is_tool_change(stripped):
                tool_changes.append(ToolChange(
                    line=i,
                    layer=current_layer,
                    z=current_z,
                    tool=stripped[:2]
                ))
            
            # Track G1 moves for path data
            if self.parser.is_movement_command(stripped) and 'X' in stripped and 'Y' in stripped:
                coords = self.parser.extract_coordinates(stripped)
                
                if 'X' in coords and 'Y' in coords:
                    move = LayerMove(
                        x=coords['X'],
                        y=coords['Y'],
                        z=current_z,
                        layer=current_layer,
                        line=i
                    )
                    
                    # Ensure we have enough layers
                    while len(layers) <= current_layer:
                        layers.append(LayerData(moves=[], z=current_z))
                    
                    layers[current_layer].moves.append(move)
                    layers[current_layer].z = current_z
        
        return PreviewData(
            layers=layers,
            tool_changes=tool_changes,
            total_layers=len(layers),
            slicer_format=slicer_format.value
        )
    
    def validate_gcode(self, lines: List[str]) -> Tuple[bool, List[str]]:
        """Validate G-code for basic syntax and compatibility"""
        errors = []
        
        if not lines:
            errors.append("Empty G-code file")
            return False, errors
        
        # Detect slicer format
        slicer_format = self.slicer_detector.detect_format(lines)
        compatibility = self.slicer_detector.get_compatibility_info(slicer_format)
        
        if not compatibility["compatible"]:
            errors.append(f"Unsupported slicer format: {slicer_format.value}")
        
        # Validate individual lines (sample check)
        for i, line in enumerate(lines[:100]):  # Check first 100 lines
            is_valid, error = self.parser.validate_gcode_line(line)
            if not is_valid:
                errors.append(f"Line {i+1}: {error}")
        
        # Check for required elements
        has_movements = any(self.parser.is_movement_command(line) for line in lines[:500])
        if not has_movements:
            errors.append("No movement commands found in G-code")
        
        # Check for layer changes
        layer_changes = sum(1 for line in lines[:500] 
                           if self.slicer_detector.detect_layer_change(line, slicer_format))
        if layer_changes == 0:
            errors.append("No layer changes detected - may not be a valid sliced file")
        
        return len(errors) == 0, errors
    
    def get_file_info(self, lines: List[str]) -> Dict[str, Any]:
        """Get information about G-code file"""
        slicer_format = self.slicer_detector.detect_format(lines)
        compatibility = self.slicer_detector.get_compatibility_info(slicer_format)
        estimated_height = self.slicer_detector.estimate_layer_height(lines)
        
        # Count different types of commands
        movement_lines = sum(1 for line in lines if self.parser.is_movement_command(line))
        extrusion_lines = sum(1 for line in lines if self.parser.is_extrusion_move(line))
        tool_changes = sum(1 for line in lines if self.parser.is_tool_change(line))
        
        # Estimate layers
        layer_changes = sum(1 for line in lines 
                           if self.slicer_detector.detect_layer_change(line, slicer_format))
        
        return {
            "total_lines": len(lines),
            "slicer_format": slicer_format.value,
            "estimated_layers": layer_changes,
            "estimated_layer_height": estimated_height,
            "movement_commands": movement_lines,
            "extrusion_commands": extrusion_lines,
            "existing_tool_changes": tool_changes,
            "compatibility": compatibility
        }