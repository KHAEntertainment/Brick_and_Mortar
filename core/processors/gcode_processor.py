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
from ..utils.tool_change import ToolChangeLibrary

class GCodeProcessor:
    """Unified G-code processor for brick & mortar modifications"""
    
    # Features never copied into mortar layers (Bambu/Orca "Prime tower", Prusa "Wipe tower")
    EXCLUDED_FEATURES = {"prime tower", "wipe tower"}
    
    def __init__(self):
        self.slicer_detector = SlicerDetector()
        self.parser = GCodeParser()
    
    def _should_capture(self, line: str, in_prime_tower: bool) -> bool:
        """Decide whether a line belongs in the layer's mortar copy"""
        if not self.parser.is_motion_line(line):
            return False
        if not in_prime_tower:
            return True
        # Inside the prime tower keep only travels, so the path to the next feature stays correct
        coords = self.parser.extract_coordinates(line)
        return 'E' not in coords and any(axis in coords for axis in ('X', 'Y', 'Z'))
    
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
            
            # Normalize line endings: readlines() keeps "\n" but generated lines don't,
            # and every writer joins with "\n"
            lines = [line.rstrip('\r\n') for line in lines]
            
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
        seen_first_layer = False  # Don't capture start G-code moves
        in_prime_tower = False    # Prime/wipe tower isn't part of the brick
        in_tool_change = False    # Slicer's own tool-change section isn't either
        active_tool = params.base_tool  # Tool the original print is on
        last_x = last_y = None    # Where the original print's nozzle is
        self._mortar_retracted = 0.0  # Mortar tool's retraction, carried across mortar layers
        self.tool_changes = ToolChangeLibrary.from_gcode(lines, slicer_format)
        
        if params.debug_mode:
            found = sorted(self.tool_changes.templates) or "none"
            print(f"Slicer tool-change sequences found for: {found}")
        
        # Auto-detect layer height if not provided
        if params.layer_height is None:
            detected_height = self.slicer_detector.estimate_layer_height(lines, slicer_format)
            layer_height = detected_height or (params.z_offset * 2)
        else:
            layer_height = params.layer_height
        
        if params.debug_mode:
            print(f"Using layer height: {layer_height}mm")
            print(f"Mortar Z offset: {params.z_offset}mm")
            print(f"Brick XY offset: {params.xy_shift}mm")
        
        for i, line in enumerate(lines):
            stripped = line.strip()
            
            feature = self.parser.get_feature(stripped)
            if feature is not None:
                in_prime_tower = feature.lower() in self.EXCLUDED_FEATURES
            if 'CP TOOLCHANGE START' in stripped:
                in_tool_change = True
            elif 'CP TOOLCHANGE END' in stripped:
                in_tool_change = False
            
            tool = self.parser.get_tool_change(stripped)
            if tool is not None:
                active_tool = tool
            
            # Handle Z moves - critical for layer detection
            if self.parser.is_z_move(stripped):
                coords = self.parser.extract_coordinates(stripped)
                if 'Z' in coords:
                    z_height = coords['Z']
                    
                    # Insert mortar after previous layer if we have infill
                    if prev_z > 0 and infill_block:
                        mortar_z = prev_z + params.z_offset
                        mortar_lines = self._create_mortar_layer(
                            infill_block, mortar_z, params, mortar_layers_added + 1,
                            active_tool, (last_x, last_y)
                        )
                        processed_lines.extend(mortar_lines)
                        mortar_layers_added += 1
                        
                        if params.debug_mode:
                            print(f"  Inserted mortar layer {mortar_layers_added} at Z={mortar_z:.3f}")
                        
                        infill_block = []
                    
                    prev_z = z_height
                
                # Keep Z moves (layer Z, Z-hop travels) so the mortar copy can replay them
                if seen_first_layer and not in_tool_change and self._should_capture(stripped, in_prime_tower):
                    current_layer_lines.append(line)
                
                last_x, last_y = self._track_xy(stripped, last_x, last_y)
                processed_lines.append(line)
                continue
            
            # Accumulate every motion line in the layer: travels, feedrate changes,
            # retracts and deretracts, not just extrusions
            if seen_first_layer and not in_tool_change and self._should_capture(stripped, in_prime_tower):
                current_layer_lines.append(line)
            last_x, last_y = self._track_xy(stripped, last_x, last_y)
            
            # Detect layer changes based on slicer format
            if self.slicer_detector.detect_layer_change(stripped, slicer_format):
                seen_first_layer = True
                if any(self.parser.is_extrusion_move(l) for l in current_layer_lines):
                    infill_block = current_layer_lines.copy()
                    layers_processed += 1
                    
                    if params.debug_mode:
                        print(f"Layer {layers_processed} processed, {len(infill_block)} moves captured")
                current_layer_lines = []
            
            processed_lines.append(line)
        
        # Handle final layer if needed
        if prev_z > 0 and infill_block:
            mortar_z = prev_z + params.z_offset
            mortar_lines = self._create_mortar_layer(
                infill_block, mortar_z, params, mortar_layers_added + 1,
                active_tool, (last_x, last_y)
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
    
    def _track_xy(self, line: str, last_x: Optional[float], last_y: Optional[float]) -> Tuple[Optional[float], Optional[float]]:
        """Follow the original print's nozzle position"""
        if self.parser.is_motion_line(line):
            coords = self.parser.extract_coordinates(line)
            last_x = coords.get('X', last_x)
            last_y = coords.get('Y', last_y)
        return last_x, last_y
    
    def _tool_change_lines(self, tool: str, z: float, params: ProcessingParams, label: str) -> List[str]:
        """Switch to `tool`, using the slicer's own sequence (e.g. H2D M620/M621) when the file has one"""
        lines = []
        if params.enable_tool_settings and tool == params.alt_tool:
            # Preheat during the swap; the idle nozzle may have been cooled or turned off by the slicer
            heater = self.tool_changes.heater_index(tool)
            lines.append(f"M104 T{heater} S{params.mortar_temp} ; preheat mortar nozzle")
        
        if self.tool_changes.has(tool):
            lines.append(f";TOOL_CHANGE_START {tool} ; {label} (slicer sequence)")
            lines.extend(self.tool_changes.render(tool, z))
            lines.append(f";TOOL_CHANGE_END {tool}")
        else:
            lines.append(f"{tool} ;TOOL_CHANGE ; {label} (no slicer tool-change sequence in file)")
        return lines
    
    def _create_mortar_layer(self, infill_lines: List[str], z_mortar: float, params: ProcessingParams, layer_number: int,
                             active_tool: Optional[str] = None,
                             resume_xy: Tuple[Optional[float], Optional[float]] = (None, None)) -> List[str]:
        """Create mortar layer with TPU material
        
        `active_tool` is the tool the original print is on when the mortar layer is inserted;
        the print is switched back to it afterwards and returned to `resume_xy`.
        """
        lines = []
        active_tool = active_tool or params.base_tool
        switch_tools = active_tool != params.alt_tool
        
        # Layer header
        lines.extend(self.parser.create_mortar_layer_header(z_mortar, layer_number))
        
        # Tool change to mortar material
        if switch_tools:
            lines.extend(self._tool_change_lines(params.alt_tool, z_mortar, params, "Switch to mortar material"))
        if params.enable_tool_settings:
            lines.append(f"M109 S{params.mortar_temp} ; wait for mortar nozzle temperature")
            lines.append(f"M106 S{params.mortar_fan_speed}")
        
        # Replay the layer's moves with brick offset and extrusion multiplier.
        # Travels, retracts and deretracts are kept so the path and E balance match the source.
        for line in infill_lines:
            if not self.parser.is_motion_line(line):
                lines.append(line)
                continue
            
            coords = self.parser.extract_coordinates(line)
            has_xy = 'X' in coords or 'Y' in coords
            e_value = coords.get('E')
            
            # Keep the mortar tool's retraction balanced. Skipped prime-tower moves and
            # mortar layer boundaries can split a retract from its deretract.
            if e_value is not None and e_value < 0:
                self._mortar_retracted += -e_value
            elif e_value is not None and e_value > 0 and not has_xy:
                # Deretract: restore at most what's actually retracted
                restore = min(e_value, self._mortar_retracted)
                self._mortar_retracted -= restore
                if restore <= 1e-6:
                    continue
                line = re.sub(r'E[\d\.-]+', f'E{restore:.5f}', line)
            elif e_value is not None and e_value > 0 and self._mortar_retracted > 1e-6:
                # Extrusion while retracted: deretract first
                lines.append(f"G1 E{self._mortar_retracted:.5f} F1800 ; mortar deretract")
                self._mortar_retracted = 0.0
            
            # Apply brick pattern offset; lift layer Z and Z-hops to the mortar height
            modified_line = self.parser.apply_coordinate_offset(
                line,
                params.xy_shift if has_xy else 0,
                params.xy_shift if has_xy else 0,
                params.z_offset if 'Z' in coords else 0
            )
            
            # Multiply only real extrusion; retracts and wipes (negative E) stay as-is
            if has_xy and e_value is not None and e_value > 0:
                modified_line = self.parser.apply_extrusion_multiplier(
                    modified_line, params.extrusion_multiplier
                )
            
            lines.append(modified_line)
        
        # Tool change back to whatever the original print was on
        if switch_tools:
            lines.extend(self._tool_change_lines(active_tool, z_mortar, params, "Revert to base tool"))
            if not self.tool_changes.has(active_tool):
                lines.append(f"G1 Z{z_mortar + 0.4:.3f} F600 ; lift before returning")
        elif params.enable_tool_settings:
            # Mortar tool was already printing: give it back the slicer's temperature
            slicer_temp = self.tool_changes.nozzle_temp(params.alt_tool)
            if slicer_temp is not None:
                lines.append(f"M109 S{slicer_temp} ; restore slicer temperature")
        
        # Return to where the original print left off before it continues
        resume_x, resume_y = resume_xy
        if switch_tools and resume_x is not None and resume_y is not None:
            lines.append(f"G1 X{resume_x:.3f} Y{resume_y:.3f} F30000 ; return to base layer path")
        
        lines.append(f";BRICK_MORTAR_LAYER_END {layer_number}")
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
        
        # Check for layer changes (whole file: Bambu start G-code runs ~900+ lines before layer 1)
        has_layer_change = any(self.slicer_detector.detect_layer_change(line, slicer_format)
                               for line in lines)
        if not has_layer_change:
            errors.append("No layer changes detected - may not be a valid sliced file")
        
        return len(errors) == 0, errors
    
    def get_file_info(self, lines: List[str]) -> Dict[str, Any]:
        """Get information about G-code file"""
        slicer_format = self.slicer_detector.detect_format(lines)
        compatibility = self.slicer_detector.get_compatibility_info(slicer_format)
        estimated_height = self.slicer_detector.estimate_layer_height(lines, slicer_format)
        
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