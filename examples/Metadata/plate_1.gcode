; HEADER_BLOCK_START
; BambuStudio 02.01.00.59
; model printing time: 49m 52s; total estimated time: 59m 40s
; total layer number: 75
; total filament length [mm] : 5862.00,127.52
; total filament volume [cm^3] : 14099.76,306.73
; total filament weight [g] : 18.19,0.38
; model label id: 58,95
; filament_density: 1.29,1.24
; filament_diameter: 1.75,1.75
; max_z_height: 15.00
; filament: 1,2
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0,0
; additional_cooling_fan_speed = 0,100
; apply_scarf_seam_on_circles = 1
; auxiliary_fan = 1
; bed_custom_model = 
; bed_custom_texture = 
; bed_exclude_area = 
; bed_temperature_formula = by_highest_temp
; before_layer_change_gcode = 
; best_object_pos = 0.3,0.5
; bottom_color_penetration_layers = 3
; bottom_shell_layers = 3
; bottom_shell_thickness = 0
; bottom_surface_pattern = monotonic
; bridge_angle = 0
; bridge_flow = 1
; bridge_no_support = 0
; bridge_speed = 50,50
; brim_object_gap = 0.1
; brim_type = auto_brim
; brim_width = 5
; chamber_temperatures = 0,0
; change_filament_gcode = ;======== H2D ========\n;===== 20250604 =====\nM993 A2 B2 C2 ; nozzle cam detection allow status save.\nM993 A0 B0 C0 ; nozzle cam detection not allowed.\n\n{if (filament_type[next_extruder] == "PLA") ||  (filament_type[next_extruder] == "PETG")\n ||  (filament_type[next_extruder] == "PLA-CF")  ||  (filament_type[next_extruder] == "PETG-CF")}\nM1015.4 S1 K0 ;disable E air printing detect\n{else}\nM1015.4 S0 ; disable E air printing detect\n{endif}\n\nM620 S[next_extruder]A\nM1002 gcode_claim_action : 4\nM204 S9000\n\nG1 Z{max_layer_z + 3.0} F1200\n\nM400\nM106 P1 S0\nM106 P2 S0\n\n{if toolchange_count == 2}\n; get travel path for change filament\n;M620.1 X[travel_point_1_x] Y[travel_point_1_y] F21000 P0\n;M620.1 X[travel_point_2_x] Y[travel_point_2_y] F21000 P1\n;M620.1 X[travel_point_3_x] Y[travel_point_3_y] F21000 P2\n{endif}\n\n{if ((filament_type[current_extruder] == "PLA") || (filament_type[current_extruder] == "PLA-CF") || (filament_type[current_extruder] == "PETG")) && (nozzle_diameter[current_extruder] == 0.2)}\nM620.10 A0 F74.8347 L[flush_length] H{nozzle_diameter[current_extruder]} T{nozzle_temperature_range_high[current_extruder]} P{nozzle_temperature[current_extruder]} S1\n{else}\nM620.10 A0 F{filament_max_volumetric_speed[current_extruder]/2.4053*60} L[flush_length] H{nozzle_diameter[current_extruder]} T{nozzle_temperature_range_high[current_extruder]} P{nozzle_temperature[current_extruder]} S1\n{endif}\n\n{if ((filament_type[next_extruder] == "PLA") || (filament_type[next_extruder] == "PLA-CF") || (filament_type[next_extruder] == "PETG")) && (nozzle_diameter[next_extruder] == 0.2)}\nM620.10 A1 F74.8347 L[flush_length] H{nozzle_diameter[next_extruder]} T{nozzle_temperature_range_high[next_extruder]} P{nozzle_temperature[next_extruder]} S1\n{else}\nM620.10 A1 F{filament_max_volumetric_speed[next_extruder]/2.4053*60} L[flush_length] H{nozzle_diameter[next_extruder]} T{nozzle_temperature_range_high[next_extruder]} P{nozzle_temperature[next_extruder]} S1\n{endif}\n\n{if long_retraction_when_cut}\nM620.11 P1 I[current_extruder] E-{retraction_distance_when_cut} F{max((filament_max_volumetric_speed[current_extruder]/2.4053*60), 200)}\n{else}\nM620.11 P0 I[current_extruder] E0\n{endif}\n\n{if long_retraction_when_ec}\nM620.11 K1 I[current_extruder] R{retraction_distance_when_ec} F{max((filament_max_volumetric_speed[current_extruder]/2.4053*60), 200)}\n{else}\nM620.11 K0 I[current_extruder] R0\n{endif}\n\nM628 S1\n{if filament_type[current_extruder] == "TPU"}\nM620.11 S0 L0 I[current_extruder] E-{retraction_distances_when_cut[current_extruder]} F{max((filament_max_volumetric_speed[current_extruder]/2.4053*60), 200)}\n{else}\n{if (filament_type[current_extruder] == "PA") || (filament_type[current_extruder] == "PA-GF")}\nM620.11 S1 L0 I[current_extruder] R4 D2 E-{retraction_distances_when_cut[current_extruder]} F{max((filament_max_volumetric_speed[current_extruder]/2.4053*60), 200)}\n{else}\nM620.11 S1 L0 I[current_extruder] R10 D8 E-{retraction_distances_when_cut[current_extruder]} F{max((filament_max_volumetric_speed[current_extruder]/2.4053*60), 200)}\n{endif}\n{endif}\nM629\n\n{if filament_type[current_extruder] == "TPU" || filament_type[next_extruder] == "TPU"}\nM620.11 H2 C331\n{else}\nM620.11 H0\n{endif}\n\nT[next_extruder]\n\n;deretract\n{if filament_type[next_extruder] == "TPU"}\n{else}\n{if (filament_type[next_extruder] == "PA") || (filament_type[next_extruder] == "PA-GF")}\n;VG1 E1 F{max(new_filament_e_feedrate, 200)}\n;VG1 E1 F{max(new_filament_e_feedrate/2, 100)}\n{else}\n;VG1 E4 F{max(new_filament_e_feedrate, 200)}\n;VG1 E4 F{max(new_filament_e_feedrate/2, 100)}\n{endif}\n{endif}\n\n; VFLUSH_START\n\n{if flush_length>41.5}\n;VG1 E41.5 F{min(old_filament_e_feedrate,new_filament_e_feedrate)}\n;VG1 E{flush_length-41.5} F{new_filament_e_feedrate}\n{else}\n;VG1 E{flush_length} F{min(old_filament_e_feedrate,new_filament_e_feedrate)}\n{endif}\n\nSYNC T{ceil(flush_length / 125) * 5}\n\n; VFLUSH_END\n\nM1002 set_filament_type:{filament_type[next_extruder]}\n\nM400\nM83\n{if next_extruder < 255}\n\n\nM628 S0\n;VM109 S[new_filament_temp]\nM629\nM400\n\nM983.3 F{filament_max_volumetric_speed[next_extruder]/2.4} A0.4\n\n\nM400\n{if wipe_avoid_perimeter}\nG1 Y320 F30000\nG1 X{wipe_avoid_pos_x} F30000\n{endif}\nG1 Y295 F30000\nG1 Y265 F18000\nG1 Z{max_layer_z + 3.0} F3000\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\nM621 S[next_extruder]A\n\nM993 A3 B3 C3 ; nozzle cam detection allow status restore.\n\n{if (filament_type[next_extruder]  == "TPU")}\nM1015.3 S1;enable tpu clog detect\n{else}\nM1015.3 S0;disable tpu clog detect\n{endif}\n\n{if (filament_type[next_extruder] == "PLA") ||  (filament_type[next_extruder] == "PETG")\n ||  (filament_type[next_extruder] == "PLA-CF")  ||  (filament_type[next_extruder] == "PETG-CF")}\nM1015.4 S1 K1 H[nozzle_diameter] ;enable E air printing detect\n{else}\nM1015.4 S0 ; disable E air printing detect\n{endif}\n\nM620.6 I[next_extruder] W1 ;enable ams air printing detect\nM1002 gcode_claim_action : 0\n
; circle_compensation_manual_offset = 0
; circle_compensation_speed = 200,200
; close_fan_the_first_x_layers = 3,1
; complete_print_exhaust_fan_speed = 70,70
; cool_plate_temp = 0,30
; cool_plate_temp_initial_layer = 0,30
; counter_coef_1 = 0,0
; counter_coef_2 = 0.008,0.008
; counter_coef_3 = -0.041,-0.041
; counter_limit_max = 0.033,0.033
; counter_limit_min = -0.035,-0.035
; curr_bed_type = Textured PEI Plate
; default_acceleration = 8000,8000
; default_filament_colour = ;
; default_filament_profile = "Bambu PLA Basic @BBL H2D"
; default_jerk = 0
; default_nozzle_volume_type = Standard,Standard
; default_print_profile = 0.20mm Standard @BBL H2D
; deretraction_speed = 30,30
; detect_floating_vertical_shell = 1
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; diameter_limit = 50,50
; different_settings_to_system = enable_arc_fitting;gcode_add_line_number;post_process;process_notes;reduce_crossing_wall;skirt_loops;sparse_infill_pattern;wall_loops;;;
; draft_shield = disabled
; during_print_exhaust_fan_speed = 70,70
; elefant_foot_compensation = 0.15
; enable_arc_fitting = 0
; enable_circle_compensation = 0
; enable_long_retraction_when_cut = 2
; enable_overhang_bridge_fan = 1,1
; enable_overhang_speed = 1,1
; enable_pre_heating = 1
; enable_pressure_advance = 0,0
; enable_prime_tower = 1
; enable_support = 0
; enforce_support_layers = 0
; eng_plate_temp = 70,30
; eng_plate_temp_initial_layer = 70,30
; ensure_vertical_shell_thickness = enabled
; exclude_object = 1
; extruder_ams_count = 1#0|4#0;1#0|4#0
; extruder_clearance_dist_to_rod = 50
; extruder_clearance_height_to_lid = 201
; extruder_clearance_height_to_rod = 47.4
; extruder_clearance_max_radius = 96
; extruder_colour = #018001;#018001
; extruder_offset = 0x0,0x0
; extruder_printable_area = 0x0,325x0,325x320,0x320#25x0,350x0,350x320,25x320
; extruder_printable_height = 320,325
; extruder_type = Direct Drive,Direct Drive
; extruder_variant_list = "Direct Drive Standard,Direct Drive High Flow";"Direct Drive Standard,Direct Drive High Flow"
; fan_cooling_layer_time = 30,100
; fan_max_speed = 40,100
; fan_min_speed = 10,100
; filament_adhesiveness_category = 0,600
; filament_change_length = 10,10
; filament_colour = #0D6284;#898989
; filament_cost = 28.99,20
; filament_density = 1.29,1.24
; filament_diameter = 1.75,1.75
; filament_end_gcode = "; filament end gcode \n";"; filament end gcode \n"
; filament_extruder_variant = "Direct Drive Standard";"Direct Drive Standard"
; filament_flow_ratio = 0.95,1
; filament_flush_temp = 0,0
; filament_flush_volumetric_speed = 0,0
; filament_ids = GFG97;GFU99
; filament_is_support = 0,0
; filament_map = 1,2
; filament_map_mode = Auto For Flush
; filament_max_volumetric_speed = 6,3.2
; filament_minimal_purge_on_wipe_tower = 15,15
; filament_notes = 
; filament_pre_cooling_temperature = 0,210
; filament_prime_volume = 45,45
; filament_printable = 3,2
; filament_ramming_travel_time = 0,20
; filament_ramming_volumetric_speed = -1,0.8
; filament_scarf_gap = 0%,0%
; filament_scarf_height = 10%,10%
; filament_scarf_length = 10,10
; filament_scarf_seam_type = none,none
; filament_self_index = 1,1,2,2
; filament_settings_id = "Generic PCTG @BBL H2D";"Generic TPU @BBL H2D"
; filament_shrink = 100%,100%
; filament_soluble = 0,0
; filament_start_gcode = "; filament start gcode\n";"; filament start gcode\n"
; filament_type = PCTG;TPU
; filament_vendor = Generic;Generic
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; filter_out_gap_fill = 0
; first_layer_print_sequence = 0
; flush_into_infill = 0
; flush_into_objects = 0
; flush_into_support = 1
; flush_multiplier = 1,1
; flush_volumes_matrix = 0,405,248,0,0,420,263,0
; flush_volumes_vector = 140,140,140,140
; full_fan_speed_layer = 0,0
; fuzzy_skin = none
; fuzzy_skin_point_distance = 0.8
; fuzzy_skin_thickness = 0.3
; gap_infill_speed = 250,250
; gcode_add_line_number = 1
; gcode_flavor = marlin
; grab_length = 0,0
; has_scarf_joint_seam = 1
; head_wrap_detect_zone = 
; hole_coef_1 = 0,0
; hole_coef_2 = -0.008,-0.008
; hole_coef_3 = 0.23415,0.23415
; hole_limit_max = 0.22,0.22
; hole_limit_min = 0.088,0.088
; host_type = octoprint
; hot_plate_temp = 70,35
; hot_plate_temp_initial_layer = 70,35
; hotend_cooling_rate = 2,2
; hotend_heating_rate = 3.6,3.6
; impact_strength_z = 10,10
; independent_support_layer_height = 0
; infill_combination = 0
; infill_direction = 45
; infill_jerk = 9
; infill_lock_depth = 1
; infill_rotate_step = 0
; infill_shift_step = 0.4
; infill_wall_overlap = 15%
; inherits_group = "0.20mm Standard @BBL H2D";;;
; initial_layer_acceleration = 500,500
; initial_layer_flow_ratio = 1
; initial_layer_infill_speed = 105,105
; initial_layer_jerk = 9
; initial_layer_line_width = 0.5
; initial_layer_print_height = 0.2
; initial_layer_speed = 50,50
; initial_layer_travel_acceleration = 6000,6000
; inner_wall_acceleration = 0,0
; inner_wall_jerk = 9
; inner_wall_line_width = 0.45
; inner_wall_speed = 300,300
; interface_shells = 0
; interlocking_beam = 0
; interlocking_beam_layer_count = 2
; interlocking_beam_width = 0.8
; interlocking_boundary_avoidance = 2
; interlocking_depth = 2
; interlocking_orientation = 22.5
; internal_bridge_support_thickness = 0.8
; internal_solid_infill_line_width = 0.42
; internal_solid_infill_pattern = zig-zag
; internal_solid_infill_speed = 250,250
; ironing_direction = 45
; ironing_flow = 10%
; ironing_inset = 0.21
; ironing_pattern = zig-zag
; ironing_spacing = 0.15
; ironing_speed = 30
; ironing_type = no ironing
; is_infill_first = 0
; layer_change_gcode = ;======== H2D 20250521========\n; layer num/total_layer_count: {layer_num+1}/[total_layer_count]\n; update layer progress\nM73 L{layer_num+1}\nM991 S0 P{layer_num} ;notify layer change\n\n
; layer_height = 0.2
; line_width = 0.42
; long_retractions_when_cut = 0,0
; long_retractions_when_ec = 1,1
; machine_end_gcode = ;===== date: 2025/05/16 =====================\n;===== H2D =====================\nG392 S0 ;turn off nozzle clog detect\nM993 A0 B0 C0 ; nozzle cam detection not allowed.\n\nM400 ; wait for buffer to clear\nG92 E0 ; zero the extruder\nG1 E-0.8 F1800 ; retract\nG1 Z{max_layer_z + 0.5} F900 ; lower z a little\n\nG90\nM141 S0 ; turn off chamber heating\nM140 S0 ; turn off bed\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off remote part cooling fan\nM106 P3 S0 ; turn off chamber cooling fan\n\n; pull back filament to AMS\nM620 S65535\nT65535\nG150.2\nM621 S65535\n\nM620 S65279\nT65279\nG150.2\nM621 S65279\n\nG150.3\n\nM1002 judge_flag timelapse_record_flag\nM622 J1\n    M400 ; wait all motion done\n    M991 S0 P-1 ;end smooth timelapse at safe pos\n    M400 S5 ;wait for last picture to be taken\nM623  ;end of "timelapse_record_flag"\n\nM104 S0 T0; turn off hotend\nM104 S0 T1; turn off hotend\n\nM400 ; wait all motion done\nM17 S\nM17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom\n{if (max_layer_z + 100.0) < 320}\n    G1 Z{max_layer_z + 100.0} F600\n    G1 Z{max_layer_z +98.0}\n{else}\n    G1 Z320 F600\n    G1 Z320\n{endif}\nM400 P100\nM17 R ; restore z current\n\nM220 S100  ; Reset feedrate magnitude\nM201.2 K1.0 ; Reset acc magnitude\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 0\n\nM1015.4 S0 K0 ;disable air printing detect\n;=====printer finish  sound=========\nM17\nM400 S1\nM1006 S1\nM1006 A53 B10 L99 C53 D10 M99 E53 F10 N99 \nM1006 A57 B10 L99 C57 D10 M99 E57 F10 N99 \nM1006 A0 B15 L0 C0 D15 M0 E0 F15 N0 \nM1006 A53 B10 L99 C53 D10 M99 E53 F10 N99 \nM1006 A57 B10 L99 C57 D10 M99 E57 F10 N99 \nM1006 A0 B15 L0 C0 D15 M0 E0 F15 N0 \nM1006 A48 B10 L99 C48 D10 M99 E48 F10 N99 \nM1006 A0 B15 L0 C0 D15 M0 E0 F15 N0 \nM1006 A60 B10 L99 C60 D10 M99 E60 F10 N99 \nM1006 W\n;=====printer finish  sound=========\nM400\nM18\n\n
; machine_load_filament_time = 30
; machine_max_acceleration_e = 5000,5000,5000,5000
; machine_max_acceleration_extruding = 20000,20000,20000,20000
; machine_max_acceleration_retracting = 5000,5000,5000,5000
; machine_max_acceleration_travel = 9000,9000,9000,9000
; machine_max_acceleration_x = 16000,16000,16000,16000
; machine_max_acceleration_y = 16000,16000,16000,16000
; machine_max_acceleration_z = 500,500,500,500
; machine_max_jerk_e = 2.5,2.5,2.5,2.5
; machine_max_jerk_x = 9,9,9,9
; machine_max_jerk_y = 9,9,9,9
; machine_max_jerk_z = 3,3,3,3
; machine_max_speed_e = 50,50,50,50
; machine_max_speed_x = 1000,1000,1000,1000
; machine_max_speed_y = 1000,1000,1000,1000
; machine_max_speed_z = 30,30,30,30
; machine_min_extruding_rate = 0,0
; machine_min_travel_rate = 0,0
; machine_pause_gcode = M400 U1
; machine_start_gcode = ;===== machine: H2D =========================\n;===== date: 20250604 =====================\n\n;M1002 set_flag extrude_cali_flag=1\n;M1002 set_flag g29_before_print_flag=1\n;M1002 set_flag auto_cali_toolhead_offset_flag=1\n;M1002 set_flag build_plate_detect_flag=1\n\nM993 A0 B0 C0 ; nozzle cam detection not allowed.\n\nM400\n;M73 P99\n\n;=====printer start sound ===================\nM17\nM400 S1\nM1006 S1\nM1006 A53 B9 L99 C53 D9 M99 E53 F9 N99 \nM1006 A56 B9 L99 C56 D9 M99 E56 F9 N99 \nM1006 A61 B9 L99 C61 D9 M99 E61 F9 N99 \nM1006 A53 B9 L99 C53 D9 M99 E53 F9 N99 \nM1006 A56 B9 L99 C56 D9 M99 E56 F9 N99 \nM1006 A61 B18 L99 C61 D18 M99 E61 F18 N99 \nM1006 W\n;=====printer start sound ===================\n\n;===== reset machine status =================\nM204 S10000\nM630 S0 P0\n\nG90\nM17 D ; reset motor current to default\nM960 S5 P1 ; turn on logo lamp\nG90\nM220 S100 ;Reset Feedrate\nM221 S100 ;Reset Flowrate\nM73.2   R1.0 ;Reset left time magnitude\nG29.1 Z{+0.0} ; clear z-trim value first\nM983.1 M1 \nM901 D4\nM481 S0 ; turn off cutter pos comp\n;===== reset machine status =================\n\nM620 M ;enable remap\n\n;===== avoid end stop =================\nG91\nG380 S2 Z22 F1200\nG380 S2 Z-12 F1200\nG90\n;===== avoid end stop =================\n\n;==== set airduct mode ==== \n\n{if (overall_chamber_temperature >= 40)}\n\n    M145 P1 ; set airduct mode to heating mode for heating\n    M106 P2 S0 ; turn off auxiliary fan\n    M106 P3 S0 ; turn off chamber fan\n\n{else}\n    M145 P0 ; set airduct mode to cooling mode for cooling\n    M106 P2 S178 ; turn on auxiliary fan for cooling\n    M106 P3 S127 ; turn on chamber fan for cooling\n    M140 S0 ; stop heatbed from heating\n\n    M1002 gcode_claim_action : 29\n    M191 S0 ; wait for chamber temp\n    M106 P2 S0 ; turn off auxiliary fan\n    {if (min_vitrification_temperature <= 50)}\n        {if (nozzle_diameter == 0.2)}\n            M142 P1 R30 S35 T40 U0.3 V0.5 W0.8 O40 ; set PLA/TPU ND0.2 chamber autocooling\n        {else}\n            M142 P1 R30 S40 T45 U0.3 V0.5 W0.8 O45; set PLA/TPU ND0.4 chamber autocooling\n        {endif}\n    {else}\n        {if (!is_all_bbl_filament)}\n            M142 P1 R35 S40 T45 U0.3 V0.5 W0.8 O45 L1 ; set third-party PETG chamber autocooling\n        {else}\n            {if (nozzle_diameter == 0.2)}\n                M142 P1 R35 S45 T50 U0.3 V0.5 W0.8 O50 L1 ; set PETG ND0.2 chamber autocooling\n            {else}\n                M142 P1 R35 S50 T55 U0.3 V0.5 W0.8 O55 L1 ; set PETG ND0.4 chamber autocooling\n            {endif}\n        {endif}\n    {endif}\n{endif}\n;==== set airduct mode ==== \n\n;===== start to heat heatbed & hotend==========\n\n    M1002 set_filament_type:{filament_type[initial_no_support_extruder]}\n\n    M104 S140 A\n    M140 S[bed_temperature_initial_layer_single]\n\n    ;===== set chamber temperature ==========\n    {if (overall_chamber_temperature >= 40)}\n        M145 P1 ; set airduct mode to heating mode\n        M141 S[overall_chamber_temperature] ; Let Chamber begin to heat\n    {endif}\n    ;===== set chamber temperature ==========\n\n;===== start to heat heatbead & hotend==========\n\n;====== cog noise reduction=================\nM982.2 S1 ; turn on cog noise reduction\n\n;===== first homing start =====\nM1002 gcode_claim_action : 13\n\nG28 X T300\n\nG150.1 F18000 ; wipe mouth to avoid filament stick to heatbed\nG150.3 F18000\nM400 P200\nM972 S24 P0 T2000\n{if curr_bed_type=="Textured PEI Plate"}\nM972 S26 P0 C0\n{elsif curr_bed_type=="High Temp Plate"}\nM972 S36 P0 C0 X1\n{endif}\nM972 S35 P0 C0\n\nG90\nG1 X175 Y160 F30000\n\nG28 Z P0 T250\n\n;===== first homing end =====\n\nM400\n;M73 P99\n\n;===== detection start =====\n\n    T1001\n    G383.4 ; left-extruder load status detection\n    \n    M104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]-80} A ; rise temp in advance\n\nM1002 judge_flag build_plate_detect_flag\nM622 S1\n    M972 S19 P0 C0    ; heatbed presence detection\nM623\n\n    M972 S14 P0 ; nozzle type detection\n\n;===== detection end =====\n\nM400\n;M73 P99\n\n;===== prepare print temperature and material ==========\nM400\nM211 X0 Y0 Z0 ;turn off soft endstop\nM975 S1 ; turn on input shaping\n\nG29.2 S0 ; avoid invalid abl data\n\n{if ((filament_type[initial_no_support_extruder] == "PLA") || (filament_type[initial_no_support_extruder] == "PLA-CF") || (filament_type[initial_no_support_extruder] == "PETG")) && (nozzle_diameter[initial_no_support_extruder] == 0.2)}\nM620.10 A0 F74.8347 H{nozzle_diameter[initial_no_support_extruder]} T{nozzle_temperature_range_high[initial_no_support_extruder]} P{nozzle_temperature_initial_layer[initial_no_support_extruder]} S1\nM620.10 A1 F74.8347 H{nozzle_diameter[initial_no_support_extruder]} T{nozzle_temperature_range_high[initial_no_support_extruder]} P{nozzle_temperature_initial_layer[initial_no_support_extruder]} S1\n{else}\nM620.10 A0 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60} H{nozzle_diameter[initial_no_support_extruder]} T{nozzle_temperature_range_high[initial_no_support_extruder]} P{nozzle_temperature_initial_layer[initial_no_support_extruder]} S1\nM620.10 A1 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60} H{nozzle_diameter[initial_no_support_extruder]} T{nozzle_temperature_range_high[initial_no_support_extruder]} P{nozzle_temperature_initial_layer[initial_no_support_extruder]} S1\n{endif}\n\nM620.11 P0 I[initial_no_support_extruder] E0\n\n{if long_retraction_when_ec }\nM620.11 K1 I[initial_no_support_extruder] R{retraction_distance_when_ec} F{max((filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60), 200)}\n{else}\nM620.11 K0 I[initial_no_support_extruder] R0\n{endif}\n\nM628 S1\n{if filament_type[initial_no_support_extruder] == "TPU"}\n    M620.11 S0 L0 I[initial_no_support_extruder] E-{retraction_distances_when_cut[initial_no_support_extruder]} F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60}\n{else}\n{if (filament_type[initial_no_support_extruder] == "PA") ||  (filament_type[initial_no_support_extruder] == "PA-GF")}\n    M620.11 S1 L0 I[initial_no_support_extruder] R4 D2 E-{retraction_distances_when_cut[initial_no_support_extruder]} F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60}\n{else}\n    M620.11 S1 L0 I[initial_no_support_extruder] R10 D8 E-{retraction_distances_when_cut[initial_no_support_extruder]} F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60}\n{endif}\n{endif}\nM629\n\nM620 S[initial_no_support_extruder]A   ; switch material if AMS exist\nM1002 gcode_claim_action : 4\nM1002 set_filament_type:UNKNOWN\nM400\nT[initial_no_support_extruder]\nM400\nM628 S0\nM629\nM400\nM1002 set_filament_type:{filament_type[initial_no_support_extruder]}\nM621 S[initial_no_support_extruder]A\n\nM104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]}\nM400\nM106 P1 S0\n\nG29.2 S1\n;===== prepare print temperature and material ==========\n\nM400\n;M73 P99\n\n;===== auto extrude cali start =========================\nM975 S1\nM1002 judge_flag extrude_cali_flag\n\nM622 J0\n    M983.3 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4} A0.4 ; cali dynamic extrusion compensation\nM623\n\nM622 J1\n    M1002 set_filament_type:{filament_type[initial_no_support_extruder]}\n    M1002 gcode_claim_action : 8\n\n    M109 S{nozzle_temperature[initial_no_support_extruder]}\n\n    G90\n    M83\n    M983.3 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4} A0.4 ; cali dynamic extrusion compensation\n\n    M400\n    M106 P1 S255\n    M400 S5\n    M106 P1 S0\n    G150.3\nM623\n\nM622 J2\n    M1002 set_filament_type:{filament_type[initial_no_support_extruder]}\n    M1002 gcode_claim_action : 8\n\n    M109 S{nozzle_temperature[initial_no_support_extruder]}\n\n    G90\n    M83\n    M983.3 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4} A0.4 ; cali dynamic extrusion compensation\n\n    M400\n    M106 P1 S255\n    M400 S5\n    M106 P1 S0\n    G150.3\nM623\n\n;===== auto extrude cali end =========================\n\n{if filament_type[initial_no_support_extruder] == "TPU"}\n    G150.2\n    G150.1\n    G150.2\n    G150.1\n    G150.2\n    G150.1\n{else}\n    M106 P1 S0\n    M400 S2\n    M83\n    G1 E45 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60}\n    G1 E-3 F1800\n    M400 P500\n    G150.2\n    G150.1\n{endif}\n\nG91\nG1 Y-16 F12000 ; move away from the trash bin\nG90\n\nM400\n;M73 P99\n\n;===== wipe right nozzle start =====\n\nM1002 gcode_claim_action : 14\n    G150 T{nozzle_temperature_initial_layer[initial_no_support_extruder]}\n    {if (overall_chamber_temperature >= 40)}\n        G150 T{nozzle_temperature_initial_layer[initial_no_support_extruder] - 80}\n    {endif}\nM106 S255 ; turn on fan to cool the nozzle\n\n;===== wipe left nozzle end =====\n\nM400\n;M73 P99\n\n{if (overall_chamber_temperature >= 40)}\n    M1002 gcode_claim_action : 49\n    M191 S[overall_chamber_temperature] ; wait for chamber temp\n{endif}\n\nM400\n;M73 P99\n\n;===== bed leveling ==================================\n\nM1002 judge_flag g29_before_print_flag\n\nM190 S[bed_temperature_initial_layer_single]; ensure bed temp\nM109 S140 A\nM106 S0 ; turn off fan , too noisy\n\nG91\nG1 Z5 F1200\nG90\nG1 X275 Y300 F30000\n\nM622 J1\n    M1002 gcode_claim_action : 1\n    G29.20 A3\n    G29 A1 O X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    M400\n    M500 ; save cali data\nM623\n    \nM622 J2\n    M1002 gcode_claim_action : 1\n    {if has_tpu_in_first_layer}\n        G29.20 A3\n        G29 A1 O X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    {else}\n        G29.20 A4\n        G29 A2 O X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    {endif}\n    M400\n    M500 ; save cali data\nM623\n\nM622 J0\n    G28\nM623\n\n;===== bed leveling end ================================\n\nG39.1 ; cali nozzle wrapped detection pos\nM500\n\n;===== z ofst cali start =====\n\n    M190 S[bed_temperature_initial_layer_single]; ensure bed temp\n\n    G383 O0 M2 T140\n    M500\n\n;===== z ofst cali end =====\n\nM400\n;M73 P99\n\nM141 S[overall_chamber_temperature]\nM104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]} A\n\n;===== mech mode sweep start =====\n    M1002 gcode_claim_action : 3\n\n    G90\n    G1 Z5 F1200\n    G1 X187 Y160 F20000\n    T1000\n    M400 P200\n\n    M970.3 Q1 A5 K0 O1\n    M974 Q1 S2 P0\n\n    M970.3 Q0 A5 K0 O1\n    M974 Q0 S2 P0\n\n    M970.2 Q2 K0 W38 Z0.01\n    M974 Q2 S2 P0\n    M500\n\n    M975 S1\n;===== mech mode sweep end =====\n\nM400\n;M73 P99\n\nG150.3 ; move to garbage can to wait for temp\nM1026\n\n;===== xy ofst cali start =====\n\nM1002 judge_flag auto_cali_toolhead_offset_flag\n\nM622 J0\n    M1012.5 N1 R1\nM623\n\nM622 J1\n    M1002 gcode_claim_action : 39\n    M141 S0\n    M620.17 T0 S{nozzle_temperature_initial_layer[(first_non_support_filaments[0] != -1 ? first_non_support_filaments[0] : first_filaments[0])]} L{(first_non_support_filaments[0] != -1 ? first_non_support_filaments[0] : first_filaments[0])}\n    M620.17 T1 S{nozzle_temperature_initial_layer[(first_non_support_filaments[1] != -1 ? first_non_support_filaments[1] : first_filaments[1])]} L{(first_non_support_filaments[1] != -1 ? first_non_support_filaments[1] : first_filaments[1])}\n    G383 O1 T{nozzle_temperature_initial_layer[initial_no_support_extruder]} L{initial_no_support_extruder}\n    M500\n    M141 S[overall_chamber_temperature]\nM623\n\nM622 J2\n    M1002 gcode_claim_action : 39\n    M141 S0\n    M620.17 T0 S{nozzle_temperature_initial_layer[(first_non_support_filaments[0] != -1 ? first_non_support_filaments[0] : first_filaments[0])]} L{(first_non_support_filaments[0] != -1 ? first_non_support_filaments[0] : first_filaments[0])}\n    M620.17 T1 S{nozzle_temperature_initial_layer[(first_non_support_filaments[1] != -1 ? first_non_support_filaments[1] : first_filaments[1])]} L{(first_non_support_filaments[1] != -1 ? first_non_support_filaments[1] : first_filaments[1])}\n    G383.3 T{nozzle_temperature_initial_layer[initial_no_support_extruder]} L{initial_no_support_extruder}\n    M500\n    M141 S[overall_chamber_temperature]\nM623\n;===== xy ofst cali end =====\n\nM400\n;M73 P99\n\nM1002 gcode_claim_action : 0\nM400\n\n;============switch again==================\n\nM211 X0 Y0 Z0 ;turn off soft endstop\nG91\nG1 Z6 F1200\nG90\nM1002 set_filament_type:{filament_type[initial_no_support_extruder]}\nM620 S[initial_no_support_extruder]A\nM400\nT[initial_no_support_extruder]\nM400\nM628 S0\nM629\nM400\nM621 S[initial_no_support_extruder]A\n\n;============switch again==================\n\nM400\n;M73 P99\n\n;===== wait temperature reaching the reference value =======\n\nM104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]} ; rise to print tmpr\n\nM140 S[bed_temperature_initial_layer_single] \nM190 S[bed_temperature_initial_layer_single] \n\n    ;========turn off light and fans =============\n    M960 S1 P0 ; turn off laser\n    M960 S2 P0 ; turn off laser\n    M106 S0 ; turn off fan\n    M106 P2 S0 ; turn off big fan\n\n    ;============set motor current==================\n    M400 S1\n\n;===== wait temperature reaching the reference value =======\n\nM400\n;M73 P99\n\n;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==\n    {if curr_bed_type=="Textured PEI Plate"}\n        G29.1 Z{-0.02} ; for Textured PEI Plate\n    {endif}\n    \nG150.1\n\nM975 S1 ; turn on mech mode supression\nM983.4 S1 ; turn on deformation compensation \nG29.2 S1 ; turn on pos comp\nG29.7 S1\n\nG90\nG1 Z5 F1200\nG1 Y295 F30000\nG1 Y265 F18000\n\n;===== nozzle load line ===============================\nG29.2 S1 ; ensure z comp turn on\nG90\nM83\nM109 S{nozzle_temperature_initial_layer[initial_no_support_extruder]}\n{if filament_type[initial_no_support_extruder] == "TPU"}\n    ;G130 O0 F{filament_max_volumetric_speed[initial_no_support_extruder]/2/2.4053} L80 E5 D12 A{first_layer_print_min[0]} B{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    G130 O0 X250 Y-0.5 Z0.8 F{filament_max_volumetric_speed[initial_no_support_extruder]/2/2.4053} L40 E20 D5\n{else}\n    ;G130 O0 F{filament_max_volumetric_speed[initial_no_support_extruder]/2/2.4053} L80 E5 D12 A{first_layer_print_min[0]} B{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    G130 O0 X250 Y-0.5 Z0.8 F{filament_max_volumetric_speed[initial_no_support_extruder]/2/2.4053} L40 E20 D5\n{endif}\nG90\nM83\nG1 Z0.2\n\n;===== noozle load line end ===========================\n\nM400\n;M73 P99\n\nM993 A1 B1 C1 ; nozzle cam detection allowed.\n\n{if (filament_type[initial_no_support_extruder] == "TPU")}\nM1015.3 S1;enable tpu clog detect\n{else}\nM1015.3 S0;disable tpu clog detect\n{endif}\n\n{if (filament_type[initial_no_support_extruder] == "PLA") ||  (filament_type[initial_no_support_extruder] == "PETG")\n ||  (filament_type[initial_no_support_extruder] == "PLA-CF")  ||  (filament_type[initial_no_support_extruder] == "PETG-CF")}\nM1015.4 S1 K1 H[nozzle_diameter] ;enable E air printing detect\n{else}\nM1015.4 S0 K0 H[nozzle_diameter] ;disable E air printing detect\n{endif}\n\nM620.6 I[initial_no_support_extruder] W1 ;enable ams air printing detect\n\nM211 Z1\nG29.99\n\n\n
; machine_switch_extruder_time = 5.6
; machine_unload_filament_time = 30
; master_extruder_id = 2
; max_bridge_length = 0
; max_layer_height = 0.28,0.28
; max_travel_detour_distance = 0
; min_bead_width = 85%
; min_feature_size = 25%
; min_layer_height = 0.08,0.08
; minimum_sparse_infill_area = 15
; mmu_segmented_region_interlocking_depth = 0
; mmu_segmented_region_max_width = 0
; nozzle_diameter = 0.4,0.4
; nozzle_height = 4
; nozzle_temperature = 255,240
; nozzle_temperature_initial_layer = 255,240
; nozzle_temperature_range_high = 270,250
; nozzle_temperature_range_low = 240,200
; nozzle_type = hardened_steel,hardened_steel
; nozzle_volume = 130,145
; nozzle_volume_type = Standard,Standard
; only_one_wall_first_layer = 0
; ooze_prevention = 0
; other_layers_print_sequence = 0
; other_layers_print_sequence_nums = 0
; outer_wall_acceleration = 5000,5000
; outer_wall_jerk = 9
; outer_wall_line_width = 0.42
; outer_wall_speed = 200,200
; overhang_1_4_speed = 0,0
; overhang_2_4_speed = 50,50
; overhang_3_4_speed = 30,30
; overhang_4_4_speed = 10,10
; overhang_fan_speed = 90,100
; overhang_fan_threshold = 10%,95%
; overhang_threshold_participating_cooling = 95%,95%
; overhang_totally_speed = 10,10
; physical_extruder_map = 1,0
; post_process = "/opt/homebrew/bin/python3 \"/Users/bbrenner/Documents/Scripting Projects/Brick and Mortar/brick_and_mortar-non-verbose.py\" {input_file} {output_file}"
; pre_start_fan_time = 0,0
; precise_outer_wall = 0
; precise_z_height = 0
; pressure_advance = 0.02,0.02
; prime_tower_brim_width = -1
; prime_tower_enable_framework = 0
; prime_tower_extra_rib_length = 0
; prime_tower_fillet_wall = 1
; prime_tower_flat_ironing = 1
; prime_tower_infill_gap = 150%
; prime_tower_lift_height = -1
; prime_tower_lift_speed = 90
; prime_tower_max_speed = 90
; prime_tower_rib_wall = 1
; prime_tower_rib_width = 8
; prime_tower_skip_points = 1
; prime_tower_width = 60
; print_compatible_printers = "Bambu Lab H2D 0.4 nozzle"
; print_extruder_id = 1,2
; print_extruder_variant = "Direct Drive Standard";"Direct Drive Standard"
; print_flow_ratio = 1
; print_sequence = by layer
; print_settings_id = 0.20mm Brick and Mortar Test
; printable_area = 0x0,350x0,350x320,0x320
; printable_height = 325
; printer_extruder_id = 1,2
; printer_extruder_variant = "Direct Drive Standard";"Direct Drive Standard"
; printer_model = Bambu Lab H2D
; printer_notes = 
; printer_settings_id = Bambu Lab H2D 0.4 nozzle
; printer_structure = corexy
; printer_technology = FFF
; printer_variant = 0.4
; printhost_authorization_type = key
; printhost_ssl_ignore_revoke = 0
; printing_by_object_gcode = 
; process_notes = --base-tool T0                     # Tool for base material (default: T0)\n--alt-tool T1                      # Tool for mortar material (default: T1)\n\n--layer-height 0.2                # Layer height in mm (default: 0.2)\n--mortar-offset-z 0.1             # Z offset for mortar layer (default: half of layer height)\n--brick-offset-xy 0.25            # XY stagger for mortar paths (default: 0.25mm)\n\n--over-extrude 1.05               # Extrusion multiplier for mortar layer (default: 1.05 = 5% over)\n--enable-over-extrude             # Explicit toggle for applying over-extrusion (optional)\n\n--enable-tool-settings            # Use hardcoded temp/fan settings (default: off)\n--no-tool-settings                # Disable hardcoded temp/fan settings even if defined\n\n--no-modify-infill                # Skip infill entirely (default: true – script focuses on walls)\n--include-top-bottom              # Enable modification of top/bottom shells (experimental)\n\n--debug                           # Print debug information while running\n
; raft_contact_distance = 0.1
; raft_expansion = 1.5
; raft_first_layer_density = 90%
; raft_first_layer_expansion = 2
; raft_layers = 0
; reduce_crossing_wall = 1
; reduce_fan_stop_start_freq = 1,1
; reduce_infill_retraction = 1
; required_nozzle_HRC = 3,3
; resolution = 0.012
; retract_before_wipe = 0%,0%
; retract_length_toolchange = 2,2
; retract_lift_above = 0,0
; retract_lift_below = 319,319
; retract_restart_extra = 0,0
; retract_restart_extra_toolchange = 0,0
; retract_when_changing_layer = 1,1
; retraction_distances_when_cut = 10,10
; retraction_distances_when_ec = 10,0
; retraction_length = 0.8,0.8
; retraction_minimum_travel = 1,1
; retraction_speed = 30,30
; role_base_wipe_speed = 1
; scan_first_layer = 0
; scarf_angle_threshold = 155
; seam_gap = 15%
; seam_position = aligned
; seam_slope_conditional = 1
; seam_slope_entire_loop = 0
; seam_slope_inner_walls = 1
; seam_slope_steps = 10
; silent_mode = 0
; single_extruder_multi_material = 1
; skeleton_infill_density = 15%
; skeleton_infill_line_width = 0.45
; skin_infill_density = 15%
; skin_infill_depth = 2
; skin_infill_line_width = 0.45
; skirt_distance = 2
; skirt_height = 1
; skirt_loops = 1
; slice_closing_radius = 0.049
; slicing_mode = regular
; slow_down_for_layer_cooling = 1,1
; slow_down_layer_time = 12,8
; slow_down_min_speed = 10,10
; small_perimeter_speed = 50%,50%
; small_perimeter_threshold = 0,0
; smooth_coefficient = 4
; smooth_speed_discontinuity_area = 1
; solid_infill_filament = 1
; sparse_infill_acceleration = 100%,100%
; sparse_infill_anchor = 400%
; sparse_infill_anchor_max = 20
; sparse_infill_density = 15%
; sparse_infill_filament = 1
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = cubic
; sparse_infill_speed = 350,350
; spiral_mode = 0
; spiral_mode_max_xy_smoothing = 200%
; spiral_mode_smooth = 0
; standby_temperature_delta = -5
; start_end_points = 30x-3,54x245
; supertack_plate_temp = 0,0
; supertack_plate_temp_initial_layer = 0,0
; support_air_filtration = 0
; support_angle = 0
; support_base_pattern = default
; support_base_pattern_spacing = 2.5
; support_bottom_interface_spacing = 0.5
; support_bottom_z_distance = 0.2
; support_chamber_temp_control = 1
; support_critical_regions_only = 0
; support_expansion = 0
; support_filament = 0
; support_interface_bottom_layers = 2
; support_interface_filament = 0
; support_interface_loop_pattern = 0
; support_interface_not_for_body = 1
; support_interface_pattern = auto
; support_interface_spacing = 0.5
; support_interface_speed = 80,80
; support_interface_top_layers = 2
; support_line_width = 0.42
; support_object_first_layer_gap = 0.2
; support_object_xy_distance = 0.35
; support_on_build_plate_only = 0
; support_remove_small_overhang = 1
; support_speed = 150,150
; support_style = default
; support_threshold_angle = 30
; support_top_z_distance = 0.2
; support_type = tree(auto)
; symmetric_infill_y_axis = 0
; temperature_vitrification = 90,30
; template_custom_gcode = 
; textured_plate_temp = 70,35
; textured_plate_temp_initial_layer = 70,35
; thick_bridges = 0
; thumbnail_size = 50x50
; time_lapse_gcode = ;======== H2D 20250527========\n; SKIPPABLE_START\n; SKIPTYPE: timelapse\nM622.1 S1 ; for prev firware, default turned on\n\nM1002 judge_flag timelapse_record_flag\n\nM622 J1\nM993 A2 B2 C2\nM993 A0 B0 C0\n\n{if !spiral_mode && !(has_timelapse_safe_pos && timelapse_type == 0 && print_sequence != "by object") }\n    {if most_used_physical_extruder_id!= curr_physical_extruder_id || timelapse_type == 1}\n        M83\n        G1 Z{max_layer_z + 0.4} F1200\n        M400\n    {endif}\n{endif}\n\n{if has_timelapse_safe_pos && timelapse_type == 0 && print_sequence != "by object"}\n    M9711 M{timelapse_type} E{most_used_physical_extruder_id} X{timelapse_pos_x} Y{timelapse_pos_y} Z{layer_z + 0.4} S11 C10 O0 T3000\n{else}\n    M9711 M{timelapse_type} E{most_used_physical_extruder_id} Z{layer_z + 0.4} S11 C10 O0 T3000\n{endif}\n\n{if !spiral_mode && !(has_timelapse_safe_pos && timelapse_type == 0 && print_sequence != "by object") }\n    {if most_used_physical_extruder_id!= curr_physical_extruder_id || timelapse_type == 1}\n        G90\n        G1 Z{max_layer_z + 3.0} F1200\n        G1 Y295 F30000\n        G1 Y265 F18000\n        M83\n    {endif}\n{endif}\nM993 A3 B3 C3\n\nM623\n; SKIPPABLE_END\n
; timelapse_type = 0
; top_area_threshold = 200%
; top_color_penetration_layers = 5
; top_one_wall_type = all top
; top_shell_layers = 5
; top_shell_thickness = 1
; top_solid_infill_flow_ratio = 1
; top_surface_acceleration = 2000,2000
; top_surface_jerk = 9
; top_surface_line_width = 0.42
; top_surface_pattern = monotonicline
; top_surface_speed = 200,200
; travel_acceleration = 10000,10000
; travel_jerk = 9
; travel_speed = 1000,1000
; travel_speed_z = 0,0
; tree_support_branch_angle = 45
; tree_support_branch_diameter = 2
; tree_support_branch_diameter_angle = 5
; tree_support_branch_distance = 5
; tree_support_wall_count = 0
; upward_compatible_machine = 
; use_firmware_retraction = 0
; use_relative_e_distances = 1
; vertical_shell_speed = 80%,80%
; wall_distribution_count = 1
; wall_filament = 1
; wall_generator = classic
; wall_loops = 3
; wall_sequence = inner wall/outer wall
; wall_transition_angle = 10
; wall_transition_filter_deviation = 25%
; wall_transition_length = 100%
; wipe = 1,1
; wipe_distance = 2,2
; wipe_speed = 80%
; wipe_tower_no_sparse_layers = 0
; wipe_tower_rotation_angle = 0
; wipe_tower_x = 158.345
; wipe_tower_y = 249.894
; xy_contour_compensation = 0
; xy_hole_compensation = 0
; z_direction_outwall_speed_continuous = 1
; z_hop = 0.4,0.4
; z_hop_types = Auto Lift,Auto Lift
; CONFIG_BLOCK_END

; EXECUTABLE_BLOCK_START
M73 P0 R59
M201 X16000 Y16000 Z500 E5000
M203 X1000 Y1000 Z30 E50
M204 P20000 R5000 T20000
M205 X9.00 Y9.00 Z3.00 E2.50
M106 S0
M106 P2 S0
; FEATURE: Custom
;===== machine: H2D =========================
;===== date: 20250604 =====================

;M1002 set_flag extrude_cali_flag=1
;M1002 set_flag g29_before_print_flag=1
;M1002 set_flag auto_cali_toolhead_offset_flag=1
;M1002 set_flag build_plate_detect_flag=1

M993 A0 B0 C0 ; nozzle cam detection not allowed.

M400
;M73 P99

;=====printer start sound ===================
M17
M400 S1
M1006 S1
M1006 A53 B9 L99 C53 D9 M99 E53 F9 N99 
M1006 A56 B9 L99 C56 D9 M99 E56 F9 N99 
M1006 A61 B9 L99 C61 D9 M99 E61 F9 N99 
M1006 A53 B9 L99 C53 D9 M99 E53 F9 N99 
M1006 A56 B9 L99 C56 D9 M99 E56 F9 N99 
M1006 A61 B18 L99 C61 D18 M99 E61 F18 N99 
M1006 W
;=====printer start sound ===================

;===== reset machine status =================
M204 S10000
M630 S0 P0

G90
M17 D ; reset motor current to default
M960 S5 P1 ; turn on logo lamp
G90
M220 S100 ;Reset Feedrate
M221 S100 ;Reset Flowrate
M73.2   R1.0 ;Reset left time magnitude
G29.1 Z0 ; clear z-trim value first
M983.1 M1 
M901 D4
M481 S0 ; turn off cutter pos comp
;===== reset machine status =================

M620 M ;enable remap

;===== avoid end stop =================
G91
G380 S2 Z22 F1200
G380 S2 Z-12 F1200
G90
;===== avoid end stop =================

;==== set airduct mode ==== 


    M145 P0 ; set airduct mode to cooling mode for cooling
    M106 P2 S178 ; turn on auxiliary fan for cooling
    M106 P3 S127 ; turn on chamber fan for cooling
    M140 S0 ; stop heatbed from heating

    M1002 gcode_claim_action : 29
    M191 S0 ; wait for chamber temp
    M106 P2 S0 ; turn off auxiliary fan
    
        
            M142 P1 R30 S40 T45 U0.3 V0.5 W0.8 O45; set PLA/TPU ND0.4 chamber autocooling
        
    

;==== set airduct mode ==== 

;===== start to heat heatbed & hotend==========

    M1002 set_filament_type:PCTG

    M104 S140 A
    M140 S70

    ;===== set chamber temperature ==========
    
    ;===== set chamber temperature ==========

;===== start to heat heatbead & hotend==========

;====== cog noise reduction=================
M982.2 S1 ; turn on cog noise reduction

;===== first homing start =====
M1002 gcode_claim_action : 13

G28 X T300

G150.1 F18000 ; wipe mouth to avoid filament stick to heatbed
G150.3 F18000
M400 P200
M972 S24 P0 T2000

M972 S26 P0 C0

M972 S35 P0 C0

G90
G1 X175 Y160 F30000

G28 Z P0 T250

;===== first homing end =====

M400
;M73 P99

;===== detection start =====

    T1001
    G383.4 ; left-extruder load status detection
    
    M104 S175 A ; rise temp in advance

M1002 judge_flag build_plate_detect_flag
M622 S1
    M972 S19 P0 C0    ; heatbed presence detection
M623

    M972 S14 P0 ; nozzle type detection

;===== detection end =====

M400
;M73 P99

;===== prepare print temperature and material ==========
M400
M211 X0 Y0 Z0 ;turn off soft endstop
M975 S1 ; turn on input shaping

G29.2 S0 ; avoid invalid abl data


M620.10 A0 F149.669 H0.4 T270 P255 S1
M620.10 A1 F149.669 H0.4 T270 P255 S1


M620.11 P0 I0 E0


M620.11 K1 I0 R10 F200


M628 S1


    M620.11 S1 L0 I0 R10 D8 E-10 F149.669


M629

M620 S0A   ; switch material if AMS exist
M1002 gcode_claim_action : 4
M1002 set_filament_type:UNKNOWN
M400
T0
M400
M628 S0
M629
M400
M1002 set_filament_type:PCTG
M621 S0A

M104 S255
M400
M106 P1 S0

G29.2 S1
;===== prepare print temperature and material ==========

M400
;M73 P99

;===== auto extrude cali start =========================
M975 S1
M1002 judge_flag extrude_cali_flag

M622 J0
    M983.3 F2.5 A0.4 ; cali dynamic extrusion compensation
M623

M622 J1
    M1002 set_filament_type:PCTG
    M1002 gcode_claim_action : 8

    M109 S255

    G90
    M83
    M983.3 F2.5 A0.4 ; cali dynamic extrusion compensation

    M400
    M106 P1 S255
    M400 S5
    M106 P1 S0
    G150.3
M623

M622 J2
    M1002 set_filament_type:PCTG
    M1002 gcode_claim_action : 8

    M109 S255

    G90
    M83
    M983.3 F2.5 A0.4 ; cali dynamic extrusion compensation

    M400
    M106 P1 S255
    M400 S5
    M106 P1 S0
    G150.3
M623

;===== auto extrude cali end =========================


    M106 P1 S0
    M400 S2
    M83
    G1 E45 F149.669
    G1 E-3 F1800
    M400 P500
    G150.2
    G150.1


G91
G1 Y-16 F12000 ; move away from the trash bin
G90

M400
;M73 P99

;===== wipe right nozzle start =====

M1002 gcode_claim_action : 14
    G150 T255
    
M106 S255 ; turn on fan to cool the nozzle

;===== wipe left nozzle end =====

M400
;M73 P99



M400
;M73 P99

;===== bed leveling ==================================

M1002 judge_flag g29_before_print_flag

M190 S70; ensure bed temp
M109 S140 A
M106 S0 ; turn off fan , too noisy

G91
M73 P1 R58
G1 Z5 F1200
G90
G1 X275 Y300 F30000

M622 J1
    M1002 gcode_claim_action : 1
    G29.20 A3
    G29 A1 O X154.814 Y104.228 I41.0896 J179.989
    M400
    M500 ; save cali data
M623
    
M622 J2
    M1002 gcode_claim_action : 1
    
        G29.20 A3
        G29 A1 O X154.814 Y104.228 I41.0896 J179.989
    
    M400
    M500 ; save cali data
M623

M622 J0
    G28
M623

;===== bed leveling end ================================

G39.1 ; cali nozzle wrapped detection pos
M500

;===== z ofst cali start =====

    M190 S70; ensure bed temp

    G383 O0 M2 T140
    M500

;===== z ofst cali end =====

M400
;M73 P99

M141 S0
M104 S255 A

;===== mech mode sweep start =====
    M1002 gcode_claim_action : 3

    G90
M73 P9 R54
    G1 Z5 F1200
    G1 X187 Y160 F20000
    T1000
    M400 P200

    M970.3 Q1 A5 K0 O1
    M974 Q1 S2 P0

    M970.3 Q0 A5 K0 O1
    M974 Q0 S2 P0

    M970.2 Q2 K0 W38 Z0.01
    M974 Q2 S2 P0
    M500

    M975 S1
;===== mech mode sweep end =====

M400
;M73 P99

G150.3 ; move to garbage can to wait for temp
M1026

;===== xy ofst cali start =====

M1002 judge_flag auto_cali_toolhead_offset_flag

M622 J0
    M1012.5 N1 R1
M623

M622 J1
    M1002 gcode_claim_action : 39
    M141 S0
    M620.17 T0 S240 L1
    M620.17 T1 S255 L0
    G383 O1 T255 L0
    M500
    M141 S0
M623

M622 J2
    M1002 gcode_claim_action : 39
    M141 S0
    M620.17 T0 S240 L1
    M620.17 T1 S255 L0
    G383.3 T255 L0
    M500
    M141 S0
M623
;===== xy ofst cali end =====

M400
;M73 P99

M1002 gcode_claim_action : 0
M400

;============switch again==================

M211 X0 Y0 Z0 ;turn off soft endstop
G91
G1 Z6 F1200
G90
M1002 set_filament_type:PCTG
M620 S0A
M400
T0
M400
M628 S0
M629
M400
M621 S0A

;============switch again==================

M400
;M73 P99

;===== wait temperature reaching the reference value =======

M104 S255 ; rise to print tmpr

M140 S70 
M190 S70 

    ;========turn off light and fans =============
    M960 S1 P0 ; turn off laser
    M960 S2 P0 ; turn off laser
    M106 S0 ; turn off fan
    M106 P2 S0 ; turn off big fan

    ;============set motor current==================
    M400 S1

;===== wait temperature reaching the reference value =======

M400
;M73 P99

;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==
    
        G29.1 Z-0.02 ; for Textured PEI Plate
    
    
G150.1

M975 S1 ; turn on mech mode supression
M983.4 S1 ; turn on deformation compensation 
G29.2 S1 ; turn on pos comp
G29.7 S1

G90
M73 P16 R49
G1 Z5 F1200
G1 Y295 F30000
G1 Y265 F18000

;===== nozzle load line ===============================
G29.2 S1 ; ensure z comp turn on
G90
M83
M109 S255

    ;G130 O0 F1.24725 L80 E5 D12 A154.814 B104.228 I41.0896 J179.989
    G130 O0 X250 Y-0.5 Z0.8 F1.24725 L40 E20 D5

G90
M83
G1 Z0.2

;===== noozle load line end ===========================

M400
;M73 P99

M993 A1 B1 C1 ; nozzle cam detection allowed.


M1015.3 S0;disable tpu clog detect



M1015.4 S0 K0 H0.4 ;disable E air printing detect


M620.6 I0 W1 ;enable ams air printing detect

M211 Z1
G29.99


; MACHINE_START_GCODE_END
M104 T0 S0 N0 ;Multi extruder pre cooling
; filament start gcode
;VT0
G90
G21
M83 ; use relative distances for extrusion
M981 S1 P20000 ;open spaghetti detector
M204 S10000
G1 Z.2 F60000
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 1/75
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change


M106 S0
M106 P2 S0
G1 E-.8 F1800
G1 X156.248 Y105.446 F60000
M204 S6000
G1 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Skirt
; LINE_WIDTH: 0.5
; LAYER_HEIGHT: 0.2
G1 F3000
M204 S500
G1 X157.358 Y104.612 E.0501
G1 X158.218 Y104.457 E.03158
G1 X193.218 Y104.457 E1.26371
G1 X194.55 Y104.849 E.0501
G1 X195.456 Y105.899 E.0501
G1 X195.675 Y106.914 E.03748
G1 X195.675 Y107.932 E.03678
G1 X194.957 Y202.519 E3.41523
G1 X193.801 Y281.568 E2.85446
G1 X193.39 Y282.893 E.0501
G1 X192.326 Y283.784 E.0501
G1 X191.344 Y283.989 E.03621
G1 X158.335 Y283.989 E1.19182
G1 X157.004 Y283.597 E.0501
G1 X156.097 Y282.547 E.0501
G1 X155.878 Y281.558 E.03656
G1 X155.043 Y202.5 E2.85463
G1 X155.043 Y117.5 E3.06901
G1 X155.767 Y106.747 E.38911
G1 X156.227 Y105.502 E.04794
; OBJECT_ID: 58
; WIPE_START
G1 X157.358 Y104.612 E-.54663
G1 X157.91 Y104.513 E-.21338
; WIPE_END
G1 E-.04 F1800
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
M204 S6000
G1 X160.394 Y111.729 Z.6 F60000
G1 X191.186 Y201.186 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X158.814 Y201.186 E1.16881
G1 X158.814 Y118.814 E2.97411
G1 X191.186 Y118.814 E1.16881
G1 X191.186 Y201.126 E2.97195
M204 S6000
G1 X191.643 Y201.643 F60000
G1 F3000
M204 S500
G1 X158.357 Y201.643 E1.20182
G1 X158.357 Y118.357 E3.00712
G1 X191.643 Y118.357 E1.20182
G1 X191.643 Y201.583 E3.00495
M204 S6000
G1 X192.1 Y202.1 F60000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X157.9 Y202.1 E1.23483
G1 X157.9 Y117.9 E3.04013
G1 X192.1 Y117.9 E1.23483
G1 X192.1 Y202.04 E3.03796
G1 E-.8 F1800
M204 S6000
M73 P17 R49
G1 X191.914 Y194.41 Z.6 F60000
G1 X190.076 Y118.997 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50134
G1 F3926.53
M204 S500
G1 X190.797 Y119.718 E.03693
G1 X190.797 Y120.366 E.02348
G1 X189.634 Y119.203 E.0596
G1 X188.985 Y119.203 E.02348
G1 X190.797 Y121.015 E.0928
G1 X190.797 Y121.663 E.02348
G1 X188.337 Y119.203 E.126
G1 X187.689 Y119.203 E.02348
G1 X190.797 Y122.311 E.1592
G1 X190.797 Y122.96 E.02348
G1 X187.04 Y119.203 E.1924
G1 X186.392 Y119.203 E.02348
G1 X190.797 Y123.608 E.2256
G1 X190.797 Y124.256 E.02348
G1 X185.744 Y119.203 E.2588
G1 X185.095 Y119.203 E.02348
G1 X190.797 Y124.905 E.292
G1 X190.797 Y125.553 E.02348
G1 X184.447 Y119.203 E.3252
G1 X183.799 Y119.203 E.02348
G1 X190.797 Y126.201 E.3584
G1 X190.797 Y126.849 E.02348
G1 X183.151 Y119.203 E.3916
G1 X182.502 Y119.203 E.02348
G1 X190.797 Y127.498 E.4248
G1 X190.797 Y128.146 E.02348
G1 X181.854 Y119.203 E.458
G1 X181.206 Y119.203 E.02348
G1 X190.797 Y128.794 E.4912
G1 X190.797 Y129.443 E.02348
G1 X180.557 Y119.203 E.5244
G1 X179.909 Y119.203 E.02348
G1 X190.797 Y130.091 E.55761
G1 X190.797 Y130.739 E.02348
G1 X179.261 Y119.203 E.59081
G1 X178.612 Y119.203 E.02348
G1 X190.797 Y131.388 E.62401
G1 X190.797 Y132.036 E.02348
G1 X177.964 Y119.203 E.65721
G1 X177.316 Y119.203 E.02348
G1 X190.797 Y132.684 E.69041
G1 X190.797 Y133.332 E.02348
G1 X176.668 Y119.203 E.72361
G1 X176.019 Y119.203 E.02348
G1 X190.797 Y133.981 E.75681
G1 X190.797 Y134.629 E.02348
G1 X175.371 Y119.203 E.79001
G1 X174.723 Y119.203 E.02348
G1 X190.797 Y135.277 E.82321
G1 X190.797 Y135.926 E.02348
G1 X174.074 Y119.203 E.85641
G1 X173.426 Y119.203 E.02348
G1 X190.797 Y136.574 E.88961
G1 X190.797 Y137.222 E.02348
G1 X172.778 Y119.203 E.92281
G1 X172.129 Y119.203 E.02348
G1 X190.797 Y137.871 E.95601
G1 X190.797 Y138.519 E.02348
G1 X171.481 Y119.203 E.98921
G1 X170.833 Y119.203 E.02348
G1 X190.797 Y139.167 E1.02241
G1 X190.797 Y139.816 E.02348
G1 X170.184 Y119.203 E1.05561
G1 X169.536 Y119.203 E.02348
G1 X190.797 Y140.464 E1.08881
G1 X190.797 Y141.112 E.02348
G1 X168.888 Y119.203 E1.12201
G1 X168.24 Y119.203 E.02348
G1 X190.797 Y141.76 E1.15521
G1 X190.797 Y142.409 E.02348
G1 X167.591 Y119.203 E1.18841
G1 X166.943 Y119.203 E.02348
G1 X190.797 Y143.057 E1.22162
G1 X190.797 Y143.705 E.02348
G1 X166.295 Y119.203 E1.25482
G1 X165.646 Y119.203 E.02348
G1 X190.797 Y144.354 E1.28802
G1 X190.797 Y145.002 E.02348
G1 X164.998 Y119.203 E1.32122
G1 X164.35 Y119.203 E.02348
G1 X190.797 Y145.65 E1.35442
G1 X190.797 Y146.299 E.02348
G1 X163.701 Y119.203 E1.38762
G1 X163.053 Y119.203 E.02348
G1 X190.797 Y146.947 E1.42082
G1 X190.797 Y147.595 E.02348
G1 X162.405 Y119.203 E1.45402
G1 X161.757 Y119.203 E.02348
G1 X190.797 Y148.243 E1.48722
G1 X190.797 Y148.892 E.02348
G1 X161.108 Y119.203 E1.52042
G1 X160.46 Y119.203 E.02348
G1 X190.797 Y149.54 E1.55362
G1 X190.797 Y150.188 E.02348
G1 X159.812 Y119.203 E1.58682
G1 X159.203 Y119.203 E.02205
G1 X159.203 Y119.242 E.00142
G1 X190.797 Y150.837 E1.61801
G1 X190.797 Y151.485 E.02348
G1 X159.203 Y119.89 E1.61801
G1 X159.203 Y120.539 E.02348
G1 X190.797 Y152.133 E1.61801
G1 X190.797 Y152.782 E.02348
G1 X159.203 Y121.187 E1.61801
G1 X159.203 Y121.835 E.02348
G1 X190.797 Y153.43 E1.61801
G1 X190.797 Y154.078 E.02348
G1 X159.203 Y122.483 E1.61801
G1 X159.203 Y123.132 E.02348
G1 X190.797 Y154.726 E1.61801
G1 X190.797 Y155.375 E.02348
G1 X159.203 Y123.78 E1.61801
G1 X159.203 Y124.428 E.02348
G1 X190.797 Y156.023 E1.61801
G1 X190.797 Y156.671 E.02348
M73 P17 R48
G1 X159.203 Y125.077 E1.61801
G1 X159.203 Y125.725 E.02348
G1 X190.797 Y157.32 E1.61801
G1 X190.797 Y157.968 E.02348
G1 X159.203 Y126.373 E1.61801
G1 X159.203 Y127.022 E.02348
G1 X190.797 Y158.616 E1.61801
G1 X190.797 Y159.265 E.02348
M73 P18 R48
G1 X159.203 Y127.67 E1.61801
G1 X159.203 Y128.318 E.02348
G1 X190.797 Y159.913 E1.61801
G1 X190.797 Y160.561 E.02348
G1 X159.203 Y128.967 E1.61801
G1 X159.203 Y129.615 E.02348
G1 X190.797 Y161.21 E1.61801
G1 X190.797 Y161.858 E.02348
G1 X159.203 Y130.263 E1.61801
G1 X159.203 Y130.911 E.02348
G1 X190.797 Y162.506 E1.61801
G1 X190.797 Y163.154 E.02348
G1 X159.203 Y131.56 E1.61801
G1 X159.203 Y132.208 E.02348
G1 X190.797 Y163.803 E1.61801
G1 X190.797 Y164.451 E.02348
G1 X159.203 Y132.856 E1.61801
G1 X159.203 Y133.505 E.02348
G1 X190.797 Y165.099 E1.61801
G1 X190.797 Y165.748 E.02348
G1 X159.203 Y134.153 E1.61801
G1 X159.203 Y134.801 E.02348
G1 X190.797 Y166.396 E1.61801
G1 X190.797 Y167.044 E.02348
G1 X159.203 Y135.45 E1.61801
G1 X159.203 Y136.098 E.02348
G1 X190.797 Y167.693 E1.61801
G1 X190.797 Y168.341 E.02348
G1 X159.203 Y136.746 E1.61801
G1 X159.203 Y137.394 E.02348
G1 X190.797 Y168.989 E1.61801
G1 X190.797 Y169.637 E.02348
G1 X159.203 Y138.043 E1.61801
G1 X159.203 Y138.691 E.02348
G1 X190.797 Y170.286 E1.61801
G1 X190.797 Y170.934 E.02348
G1 X159.203 Y139.339 E1.61801
G1 X159.203 Y139.988 E.02348
G1 X190.797 Y171.582 E1.61801
G1 X190.797 Y172.231 E.02348
G1 X159.203 Y140.636 E1.61801
G1 X159.203 Y141.284 E.02348
G1 X190.797 Y172.879 E1.61801
G1 X190.797 Y173.527 E.02348
G1 X159.203 Y141.933 E1.61801
G1 X159.203 Y142.581 E.02348
G1 X190.797 Y174.176 E1.61801
G1 X190.797 Y174.824 E.02348
G1 X159.203 Y143.229 E1.61801
G1 X159.203 Y143.878 E.02348
G1 X190.797 Y175.472 E1.61801
G1 X190.797 Y176.121 E.02348
G1 X159.203 Y144.526 E1.61801
G1 X159.203 Y145.174 E.02348
G1 X190.797 Y176.769 E1.61801
G1 X190.797 Y177.417 E.02348
G1 X159.203 Y145.822 E1.61801
G1 X159.203 Y146.471 E.02348
G1 X190.797 Y178.065 E1.61801
G1 X190.797 Y178.714 E.02348
G1 X159.203 Y147.119 E1.61801
G1 X159.203 Y147.767 E.02348
G1 X190.797 Y179.362 E1.61801
G1 X190.797 Y180.01 E.02348
G1 X159.203 Y148.416 E1.61801
G1 X159.203 Y149.064 E.02348
G1 X190.797 Y180.659 E1.61801
G1 X190.797 Y181.307 E.02348
G1 X159.203 Y149.712 E1.61801
G1 X159.203 Y150.361 E.02348
G1 X190.797 Y181.955 E1.61801
G1 X190.797 Y182.604 E.02348
M104 T0 S240 N0 ;Multi extruder pre heating
G1 X159.203 Y151.009 E1.61801
G1 X159.203 Y151.657 E.02348
G1 X190.797 Y183.252 E1.61801
G1 X190.797 Y183.9 E.02348
G1 X159.203 Y152.305 E1.61801
G1 X159.203 Y152.954 E.02348
G1 X190.797 Y184.548 E1.61801
G1 X190.797 Y185.197 E.02348
G1 X159.203 Y153.602 E1.61801
G1 X159.203 Y154.25 E.02348
G1 X190.797 Y185.845 E1.61801
G1 X190.797 Y186.493 E.02348
G1 X159.203 Y154.899 E1.61801
G1 X159.203 Y155.547 E.02348
G1 X190.797 Y187.142 E1.61801
G1 X190.797 Y187.79 E.02348
M73 P19 R48
G1 X159.203 Y156.195 E1.61801
G1 X159.203 Y156.844 E.02348
G1 X190.797 Y188.438 E1.61801
G1 X190.797 Y189.087 E.02348
G1 X159.203 Y157.492 E1.61801
G1 X159.203 Y158.14 E.02348
G1 X190.797 Y189.735 E1.61801
G1 X190.797 Y190.383 E.02348
G1 X159.203 Y158.789 E1.61801
G1 X159.203 Y159.437 E.02348
G1 X190.797 Y191.032 E1.61801
G1 X190.797 Y191.68 E.02348
G1 X159.203 Y160.085 E1.61801
G1 X159.203 Y160.733 E.02348
G1 X190.797 Y192.328 E1.61801
G1 X190.797 Y192.976 E.02348
G1 X159.203 Y161.382 E1.61801
G1 X159.203 Y162.03 E.02348
G1 X190.797 Y193.625 E1.61801
G1 X190.797 Y194.273 E.02348
G1 X159.203 Y162.678 E1.61801
G1 X159.203 Y163.327 E.02348
G1 X190.797 Y194.921 E1.61801
G1 X190.797 Y195.57 E.02348
G1 X159.203 Y163.975 E1.61801
G1 X159.203 Y164.623 E.02348
G1 X190.797 Y196.218 E1.61801
G1 X190.797 Y196.866 E.02348
G1 X159.203 Y165.272 E1.61801
G1 X159.203 Y165.92 E.02348
G1 X190.797 Y197.515 E1.61801
G1 X190.797 Y198.163 E.02348
G1 X159.203 Y166.568 E1.61801
G1 X159.203 Y167.216 E.02348
G1 X190.797 Y198.811 E1.61801
G1 X190.797 Y199.459 E.02348
G1 X159.203 Y167.865 E1.61801
G1 X159.203 Y168.513 E.02348
G1 X190.797 Y200.108 E1.61801
G1 X190.797 Y200.756 E.02348
G1 X159.203 Y169.161 E1.61801
G1 X159.203 Y169.81 E.02348
G1 X190.19 Y200.797 E1.58692
G1 X189.542 Y200.797 E.02348
G1 X159.203 Y170.458 E1.55372
G1 X159.203 Y171.106 E.02348
G1 X188.894 Y200.797 E1.52052
G1 X188.245 Y200.797 E.02348
G1 X159.203 Y171.755 E1.48732
G1 X159.203 Y172.403 E.02348
M73 P19 R47
G1 X187.597 Y200.797 E1.45412
G1 X186.949 Y200.797 E.02348
G1 X159.203 Y173.051 E1.42092
G1 X159.203 Y173.699 E.02348
G1 X186.301 Y200.797 E1.38772
G1 X185.652 Y200.797 E.02348
G1 X159.203 Y174.348 E1.35452
G1 X159.203 Y174.996 E.02348
G1 X185.004 Y200.797 E1.32132
G1 X184.356 Y200.797 E.02348
G1 X159.203 Y175.644 E1.28812
G1 X159.203 Y176.293 E.02348
G1 X183.707 Y200.797 E1.25492
G1 X183.059 Y200.797 E.02348
G1 X159.203 Y176.941 E1.22172
G1 X159.203 Y177.589 E.02348
G1 X182.411 Y200.797 E1.18851
G1 X181.762 Y200.797 E.02348
G1 X159.203 Y178.238 E1.15531
G1 X159.203 Y178.886 E.02348
G1 X181.114 Y200.797 E1.12211
G1 X180.466 Y200.797 E.02348
G1 X159.203 Y179.534 E1.08891
G1 X159.203 Y180.183 E.02348
G1 X179.817 Y200.797 E1.05571
G1 X179.169 Y200.797 E.02348
G1 X159.203 Y180.831 E1.02251
G1 X159.203 Y181.479 E.02348
G1 X178.521 Y200.797 E.98931
G1 X177.873 Y200.797 E.02348
G1 X159.203 Y182.127 E.95611
G1 X159.203 Y182.776 E.02348
G1 X177.224 Y200.797 E.92291
G1 X176.576 Y200.797 E.02348
G1 X159.203 Y183.424 E.88971
G1 X159.203 Y184.072 E.02348
G1 X175.928 Y200.797 E.85651
G1 X175.279 Y200.797 E.02348
G1 X159.203 Y184.721 E.82331
G1 X159.203 Y185.369 E.02348
G1 X174.631 Y200.797 E.79011
G1 X173.983 Y200.797 E.02348
G1 X159.203 Y186.017 E.75691
G1 X159.203 Y186.666 E.02348
G1 X173.334 Y200.797 E.72371
G1 X172.686 Y200.797 E.02348
G1 X159.203 Y187.314 E.69051
G1 X159.203 Y187.962 E.02348
G1 X172.038 Y200.797 E.65731
G1 X171.39 Y200.797 E.02348
G1 X159.203 Y188.61 E.62411
G1 X159.203 Y189.259 E.02348
M73 P20 R47
G1 X170.741 Y200.797 E.59091
G1 X170.093 Y200.797 E.02348
G1 X159.203 Y189.907 E.5577
G1 X159.203 Y190.555 E.02348
G1 X169.445 Y200.797 E.5245
G1 X168.796 Y200.797 E.02348
G1 X159.203 Y191.204 E.4913
G1 X159.203 Y191.852 E.02348
G1 X168.148 Y200.797 E.4581
G1 X167.5 Y200.797 E.02348
G1 X159.203 Y192.5 E.4249
G1 X159.203 Y193.149 E.02348
G1 X166.851 Y200.797 E.3917
G1 X166.203 Y200.797 E.02348
G1 X159.203 Y193.797 E.3585
G1 X159.203 Y194.445 E.02348
G1 X165.555 Y200.797 E.3253
G1 X164.906 Y200.797 E.02348
G1 X159.203 Y195.094 E.2921
G1 X159.203 Y195.742 E.02348
G1 X164.258 Y200.797 E.2589
G1 X163.61 Y200.797 E.02348
G1 X159.203 Y196.39 E.2257
G1 X159.203 Y197.038 E.02348
G1 X162.962 Y200.797 E.1925
G1 X162.313 Y200.797 E.02348
G1 X159.203 Y197.687 E.1593
G1 X159.203 Y198.335 E.02348
G1 X161.665 Y200.797 E.1261
G1 X161.017 Y200.797 E.02348
G1 X159.203 Y198.983 E.0929
G1 X159.203 Y199.632 E.02348
G1 X160.368 Y200.797 E.0597
G1 X159.72 Y200.797 E.02348
G1 X158.997 Y200.074 E.03703
; WIPE_START
G1 X159.72 Y200.797 E-.38859
G1 X160.368 Y200.797 E-.24636
G1 X160.136 Y200.565 E-.12506
; WIPE_END
G1 E-.04 F1800
M204 S6000
G17
G3 Z.6 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 1 start: 58,95
M624 AwAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z0.6 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer1 end: 58,95
M625
G1 X188.84 Y278.958
G1 Z.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X189.340 Y279.458  
M204 S500
G3  X186.878 Y281.499   I-4.373 J-2.768 E0.1236 F3000
G3  X184.230 Y280.249   I0.012 J-3.454 E0.1149
G2  X181.527 Y279.458   I-2.709 J4.247 E0.1085
G2  X167.963 Y279.462   I-6.687 J357.435 E0.5155
G2  X164.028 Y281.339   I0.499 J6.110 E0.1694
G3  X161.716 Y280.909   I-0.854 J-1.838 E0.0953
G1  X160.340 Y279.458   E0.0760
G3  X158.409 Y277.136   I3.871 J-5.183 E0.1159
G3  X159.585 Y274.543   I2.902 J-0.247 E0.1130
G2  X160.340 Y272.139   I-3.465 J-2.409 E0.0972
G2  X160.337 Y259.106   I-321.195 J-6.431 E0.4954
G2  X158.491 Y255.528   I-6.663 J1.171 E0.1554
G3  X159.006 Y253.365   I1.721 J-0.733 E0.0905
G1 E-0.8000 F1800
M204 S6000
G1  X160.726 Y251.551   F600
G1 E0.8000 F1800
M204 S500
G3  X163.583 Y249.927   I2.765 J1.539 E0.1313 F3000
G3  X166.120 Y251.527   I-12.405 J22.473 E0.1141
G2  X168.153 Y251.958   I2.042 J-4.626 E0.0796
G2  X181.717 Y251.954   I6.687 J-357.435 E0.5155
G2  X185.652 Y250.077   I-0.499 J-6.110 E0.1694
G3  X187.964 Y250.507   I0.854 J1.838 E0.0953
G1  X189.340 Y251.958   E0.0760
G1 E0.0000
G3  X191.271 Y254.280   I-3.871 J5.182 E0.1159
G3  X190.095 Y256.873   I-2.902 J0.247 E0.1130
G2  X189.340 Y259.276   I3.464 J2.409 E0.0972
G2  X189.343 Y272.310   I321.212 J6.432 E0.4954
G2  X191.189 Y275.888   I6.663 J-1.171 E0.1554
G3  X190.849 Y277.866   I-1.658 J0.734 E0.0808
G1  X189.340 Y279.458   E0.0834
; WIPE_TOWER_END
G1  X188.840 Y251.958  
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S500
G1  X160.840  E1.0642
G1  Y272.208  E0.2565
G1  X188.840  E1.0642
G1  Y278.958  E0.2565
M204 S6000
G1  X161.840 Y272.208  
;--------------------
; CP EMPTY GRID START
; layer #2
M204 S500
G1  Y272.708  E0.0190
G1  X188.340  E1.0072
G1  Y273.231  E0.0199
G1  X161.340  E1.0262
G1  Y273.753  E0.0199
G1  X188.340  E1.0262
G1  Y274.276  E0.0199
G1  X161.340  E1.0262
G1  Y274.799  E0.0199
G1  X188.340  E1.0262
G1  Y275.322  E0.0199
G1  X161.340  E1.0262
G1  Y275.844  E0.0199
G1  X188.340  E1.0262
G1  Y276.367  E0.0199
G1  X161.340  E1.0262
G1  Y276.890  E0.0199
G1  X188.340  E1.0262
G1  Y277.413  E0.0199
G1  X161.340  E1.0262
G1  Y277.935  E0.0199
G1  X188.340  E1.0262
G1  Y278.458  E0.0199
G1  X161.340  E1.0262
G1  Y278.958  E0.0190
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #1
; material : TPU -> TPU
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-.8 F1800
G17
G3 Z.6 I1.217 J0 P1  F60000
G1 X161.09 Y266.208 Z.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF0 NF1
M204 S500
G1  X188.590 Y266.208  E2.1885 F1881
G1  Y267.208  E0.0796
G1  X161.090  E2.1885
G1  Y268.208  E0.0796
G1  X188.590  E2.1885
G1  Y269.208  E0.0796
G1  X161.090  E2.1885
G1  Y270.208  E0.0796
G1  X188.590  E2.1885
G1  Y271.208  E0.0796
G1  X161.090  E2.1885
; NOZZLE_CHANGE_END OF0 NF1
M104 T1 S83 N0 ;Multi extruder pre cooling

; WIPE_START
G1 F5400
M204 S500
G1 X163.09 Y271.208 E-1.9
; WIPE_END
G1 E-.1 F1800
M204 S6000
G17
G3 Z.6 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20250604 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S0 ; disable E air printing detect


M620 S1A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z3.2 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F149.669 L0 H0.4 T270 P255 S1



M620.10 A1 F79.8237 L0 H0.4 T250 P240 S1



M620.11 P0 I0 E0



M620.11 K1 I0 R10 F200


M628 S1


M620.11 S1 L0 I0 R10 D8 E-10 F200


M629


M620.11 H2 C331


T1
M73 E5

;deretract



; VFLUSH_START


;VG1 E0 F79


SYNC T0

; VFLUSH_END

M1002 set_filament_type:TPU

M400
M83



M628 S0
;VM109 S240
M629
M400

M983.3 F1.33333 A0.4


M400

G1 Y320 F30000
G1 X194.344

M73 P21 R46
G1 Y295
G1 Y265 F18000
G1 Z3.2 F3000

M204 S500


M621 S1A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S1;enable tpu clog detect



M1015.4 S0 ; disable E air printing detect


M620.6 I1 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S0
M106 P2 S0
G1 X193.344 Y264.67 F60000
G1 Z.2
G1 X193.344 Y257.038 Z.6
G1 X193.344 Y247.883 Z.6
G1 X156.335 Y247.883
G1 X156.335 Y252.458
G1 X160.84 Y252.458

; filament start gcode
G1 Z.2

G4 S0
; CP TOOLCHANGE WIPE
; LINE_WIDTH: 0.500000
; LINE_WIDTH: 0.575000
M204 S500
G1  X163.840 Y252.458  E0.1311 F990
G1 E-0.8000 F1800
M204 S6000
G1  X159.340  F600
G1  X160.840  F240
G1  X161.340  F600
G1  Y252.958 
G1  X160.340 
G1  Y251.958 
G1  X161.840 
G1  Y253.458 
G1  X159.840 
G1  Y251.458 
G1  X163.840 Y252.458   F990
G1 E0.8000 F1800
M204 S500
G1  X188.840  E1.0927 F990
G1  Y252.958  E0.0219
G1  X160.840  E1.2238 F1125
G1  Y253.458  E0.0219
G1  X188.840  E1.2238 F1374
G1  Y253.958  E0.0219
G1  X160.840  E1.2238 F1826
G1  Y254.458  E0.0219
G1  X188.840  E1.2238
G1  Y254.958  E0.0219
M73 P22 R46
G1  X160.840  E1.2238
G1  Y255.458  E0.0219
G1  X188.840  E1.2238
G1  Y255.958  E0.0219
G1  X160.840  E1.2238
G1  Y256.458  E0.0219
G1  X188.840  E1.2238
G1  Y256.958  E0.0219
G1  X160.840  E1.2238
G1  Y257.458  E0.0219
G1  X188.840  E1.2238
G1  Y257.958  E0.0219
G1  X160.840  E1.2238
G1  Y258.458  E0.0219
G1  X188.840  E1.2238
G1  Y258.958  E0.0219
G1  X160.840  E1.2238
G1  Y259.458  E0.0219
G1  X188.840  E1.2238
G1  Y259.958  E0.0219
G1  X160.840  E1.2238
G1  Y260.458  E0.0219
G1  X188.840  E1.2238
G1  Y260.958  E0.0219
G1  X160.840  E1.2238
G1  Y261.458  E0.0219
G1  X188.840  E1.2238
G1  Y261.958  E0.0219
G1  X160.840  E1.2238
G1  Y262.458  E0.0219
G1  X188.840  E1.2238
G1  Y262.958  E0.0219
G1  X160.840  E1.2238
G1  Y263.458  E0.0219
G1  X188.840  E1.2238
G1  Y263.958  E0.0219
G1  X160.840  E1.2238
G1  Y264.458  E0.0219
G1  X188.840  E1.2238
G1  Y264.958  E0.0219
G1  X160.840  E1.2238
G1  Y265.458  E0.0219
G1  X188.840  E1.2238
; LINE_WIDTH: 0.500000
; WIPE_TOWER_END
M220 R
G1 F60000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F5400
M204 S500
G1 X186.84 Y265.458 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G17
G3 Z.6 I1.217 J0 P1  F60000
; OBJECT_ID: 95
; start printing object, unique label id: 95
M624 AgAAAAAAAAA=
G1 X192.968 Y107.664 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
; LAYER_HEIGHT: 0.2
G1 F2100.29
M204 S500
G1 X158.468 Y107.664 E1.31122
G1 X158.468 Y107.164 E.019
G1 X192.968 Y107.164 E1.31122
G1 X192.968 Y107.604 E.01672
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F2100.29
G1 X190.968 Y107.607 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 95
M625
;======== H2D 20250521========
; layer num/total_layer_count: 2/75
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change


M106 S255
M106 P2 S255
; open powerlost recovery
M1003 S1
; OBJECT_ID: 95
; start printing object, unique label id: 95
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z.6 I-.058 J1.216 P1  F60000
G1 X193.008 Y107.704 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F2545.881
M204 S5000
G1 X158.428 Y107.704 E1.08423
G1 X158.428 Y107.124 E.01819
G1 X193.008 Y107.124 E1.08423
G1 X193.008 Y107.644 E.0163
M204 S10000
G1 X192.812 Y107.414 F60000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F5107.47
M204 S8000
G1 X158.624 Y107.414 E.53432
; WIPE_START
G1 X160.624 Y107.414 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 95
M625
M204 S10000
G17
G3 Z.8 I-1.198 J.214 P1  F60000
G1 X188.84 Y265.458 Z.8
G1 Z.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S8000
G1  X160.840 Y265.458  E1.0642 F2100
G1  Y259.958  E0.2090
G1  X188.840  E1.0642
G1  Y265.458  E0.2090
M204 S10000
G1  X161.840 Y259.958  
;--------------------
; CP EMPTY GRID START
; layer #3
M204 S8000
G1  Y265.458  E0.2090
M204 S10000
G1  X170.507 
M204 S8000
G1  Y259.958  E0.2090
M204 S10000
G1  X179.173 
M204 S8000
G1  Y265.458  E0.2090
M204 S10000
G1  X187.840 
M204 S8000
G1  Y259.958  E0.2090
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #2
; material : PCTG -> PCTG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-.8 F1800
G17
G3 Z.8 I1.217 J0 P1  F60000
G1 X161.09 Y252.708
G1 Z.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF1 NF0
M104 T0 S210 N0 ;Multi extruder pre cooling in post extrusion
M204 S8000
G1  X188.590 Y252.708  E2.1885 F251
G1  Y254.208  E0.1194
M104 T1 S255 N0 ;Multi extruder pre heating
G1  X161.090  E2.1885
G1  Y255.708  E0.1194
M73 P23 R45
G1  X188.590  E2.1885
G1  Y257.208  E0.1194
G1  X161.090  E2.1885
G1  Y258.708  E0.1194
G1  X188.590  E2.1885
M204 S10000
G1  Y259.708 
G1  X161.590  F398
G1  Y258.208 
G1  X188.090 
G1  Y256.708 
M73 P24 R45
G1  X161.590 
G1  Y255.208 
G1  X188.090 
G1  Y253.708 
G1  X161.590 
; NOZZLE_CHANGE_END OF1 NF0
M104 T0 S0 N0 ;Multi extruder pre cooling

G1 E-2 F1800
G17
G3 Z.8 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20250604 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S0 ; disable E air printing detect


M620 S0A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z3.4 F1200

M400
M106 P1 S0
M106 P2 S0


; get travel path for change filament
;M620.1 X54 Y0 F21000 P0
;M620.1 X54 Y0 F21000 P1
;M620.1 X54 Y245 F21000 P2



M620.10 A0 F79.8237 L0 H0.4 T250 P240 S1



M620.10 A1 F149.669 L0 H0.4 T270 P255 S1



M620.11 P0 I1 E0



M620.11 K1 I1 R0 F200


M628 S1

M620.11 S0 L0 I1 E-10 F200

M629


M620.11 H2 C331


T0
M73 E4

;deretract


;VG1 E4 F200
;VG1 E4 F100



; VFLUSH_START


;VG1 E0 F79


SYNC T0

; VFLUSH_END

M1002 set_filament_type:PCTG

M400
M83



M628 S0
;VM109 S255
M629
M400

M983.3 F2.5 A0.4


M400

M73 P24 R44
G1 Y320 F30000
G1 X194.344

G1 Y295
G1 Y265 F18000
G1 Z3.4 F3000

M204 S8000


M621 S0A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S0;disable tpu clog detect



M1015.4 S0 ; disable E air printing detect


M620.6 I0 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S0
M106 P2 S0
G1 X193.344 Y278.708 F60000
G1 Z.4
G1 X188.84 Y278.708 Z.8

; filament start gcode
G1 Z.4
G1 E2 F1800

G4 S0
; CP TOOLCHANGE WIPE
; LINE_WIDTH: 0.500000
M204 S8000
G1  X185.840 Y278.708  E0.1140 F1782
G1 E-0.8000 F1800
M204 S10000
G1  X190.340  F600
G1  X188.840  F240
G1  X189.340  F600
G1  Y279.208 
G1  X188.340 
G1  Y278.208 
G1  X189.840 
G1  Y279.708 
G1  X187.840 
G1  Y277.708 
G1  X185.840 Y278.708   F1782
G1 E0.8000 F1800
M204 S8000
G1  X160.840  E0.9502 F1782
G1  Y277.958  E0.0285
G1  X188.840  E1.0642 F2025
G1  Y277.208  E0.0285
G1  X160.840  E1.0642 F2473
G1  Y276.458  E0.0285
G1  X188.840  E1.0642 F3938
G1  Y275.708  E0.0285
G1  X160.840  E1.0642
G1  Y274.958  E0.0285
G1  X188.840  E1.0642
G1  Y274.208  E0.0285
G1  X160.840  E1.0642
G1  Y273.458  E0.0285
G1  X188.840  E1.0642
G1  Y272.708  E0.0285
G1  X160.840  E1.0642
G1  Y271.958  E0.0285
G1  X188.840  E1.0642
G1  Y271.208  E0.0285
G1  X160.840  E1.0642
G1  Y270.458  E0.0285
G1  X188.840  E1.0642
G1  Y269.708  E0.0285
G1  X160.840  E1.0642
G1  Y268.958  E0.0285
M73 P25 R44
G1  X188.840  E1.0642
G1  Y268.208  E0.0285
G1  X160.840  E1.0642
G1  Y267.458  E0.0285
G1  X188.840  E1.0642
G1  Y266.708  E0.0285
G1  X160.840  E1.0642
G1  Y265.958  E0.0285
G1  X188.840  E1.0642
; WIPE_TOWER_END
M220 R
G1 F60000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y251.958  
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X189.191 Y279.615  
M204 S8000
G3  X186.409 Y281.530   I-3.469 J-2.060 E0.1325 F3938
G3  X184.068 Y280.149   I1.448 J-5.129 E0.1045
G2  X181.527 Y279.458   I-2.568 J4.426 E0.1012
G2  X167.963 Y279.462   I-6.687 J357.435 E0.5155
G2  X164.028 Y281.339   I0.499 J6.110 E0.1694
G3  X161.716 Y280.909   I-0.854 J-1.838 E0.0953
G1  X160.340 Y279.458   E0.0760
G3  X158.409 Y277.136   I3.871 J-5.183 E0.1159
G3  X159.585 Y274.543   I2.902 J-0.247 E0.1130
G2  X160.340 Y272.139   I-3.465 J-2.409 E0.0972
G2  X160.337 Y259.106   I-321.195 J-6.431 E0.4954
G2  X158.491 Y255.528   I-6.663 J1.171 E0.1554
G3  X158.830 Y253.550   I1.658 J-0.734 E0.0808
G1  X161.716 Y250.507   E0.1594
G3  X165.138 Y250.950   I1.525 J1.652 E0.1495
G2  X168.153 Y251.958   I3.021 J-4.025 E0.1229
G2  X181.717 Y251.954   I6.687 J-357.435 E0.5155
G2  X185.652 Y250.077   I-0.499 J-6.110 E0.1694
G3  X187.964 Y250.507   I0.854 J1.838 E0.0953
G1  X189.340 Y251.958   E0.0760
G3  X191.271 Y254.280   I-3.871 J5.182 E0.1159
G3  X190.095 Y256.873   I-2.902 J0.247 E0.1130
G2  X189.340 Y259.276   I3.464 J2.409 E0.0972
G2  X189.343 Y272.310   I321.212 J6.432 E0.4954
G2  X191.189 Y275.888   I6.663 J-1.171 E0.1554
G3  X190.909 Y277.799   I-1.654 J0.733 E0.0774
; WIPE_TOWER_END

; WIPE_START
G1 F5107.47
M204 S8000
G1 X190.943 Y277.759 E-.01975
G1 X191.027 Y277.646 E-.0539
G1 X191.103 Y277.526 E-.05389
G1 X191.169 Y277.4 E-.0539
G1 X191.225 Y277.27 E-.0539
G1 X191.271 Y277.135 E-.05389
G1 X191.305 Y276.998 E-.0539
G1 X191.329 Y276.858 E-.05389
G1 X191.342 Y276.717 E-.05389
G1 X191.344 Y276.575 E-.0539
G1 X191.335 Y276.434 E-.05389
G1 X191.314 Y276.293 E-.05389
G1 X191.283 Y276.155 E-.0539
G1 X191.241 Y276.019 E-.05389
G1 X191.202 Y275.923 E-.03963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.8 I1.217 J0 P1  F60000
; OBJECT_ID: 58
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X190.564 Y201.327 Z.8 F60000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42064
G1 F4765.435
M204 S8000
G1 X191.158 Y200.733 E.02506
G1 X191.158 Y200.199 E.01594
G1 X190.199 Y201.158 E.04044
G1 X189.665 Y201.158 E.01594
G1 X191.158 Y199.665 E.06298
G1 X191.158 Y199.131 E.01594
G1 X189.131 Y201.158 E.08552
G1 X188.597 Y201.158 E.01594
G1 X191.158 Y198.597 E.10806
G1 X191.158 Y198.062 E.01594
G1 X188.062 Y201.158 E.1306
G1 X187.528 Y201.158 E.01594
G1 X191.158 Y197.528 E.15314
G1 X191.158 Y196.994 E.01594
G1 X186.994 Y201.158 E.17568
G1 X186.46 Y201.158 E.01594
G1 X191.158 Y196.46 E.19822
G1 X191.158 Y195.926 E.01594
G1 X185.926 Y201.158 E.22076
G1 X185.392 Y201.158 E.01594
G1 X191.158 Y195.392 E.2433
G1 X191.158 Y194.857 E.01594
G1 X184.857 Y201.158 E.26585
G1 X184.323 Y201.158 E.01594
G1 X191.158 Y194.323 E.28839
G1 X191.158 Y193.789 E.01594
G1 X183.789 Y201.158 E.31093
G1 X183.255 Y201.158 E.01594
G1 X191.158 Y193.255 E.33347
G1 X191.158 Y192.721 E.01594
G1 X182.721 Y201.158 E.35601
G1 X182.187 Y201.158 E.01594
G1 X191.158 Y192.187 E.37855
G1 X191.158 Y191.652 E.01594
G1 X181.652 Y201.158 E.40109
G1 X181.118 Y201.158 E.01594
G1 X191.158 Y191.118 E.42363
G1 X191.158 Y190.584 E.01594
G1 X180.584 Y201.158 E.44617
G1 X180.05 Y201.158 E.01594
G1 X191.158 Y190.05 E.46871
G1 X191.158 Y189.516 E.01594
G1 X179.516 Y201.158 E.49125
G1 X178.981 Y201.158 E.01594
G1 X191.158 Y188.981 E.51379
G1 X191.158 Y188.447 E.01594
G1 X178.447 Y201.158 E.53633
G1 X177.913 Y201.158 E.01594
G1 X191.158 Y187.913 E.55887
G1 X191.158 Y187.379 E.01594
G1 X177.379 Y201.158 E.58141
G1 X176.845 Y201.158 E.01594
G1 X191.158 Y186.845 E.60395
G1 X191.158 Y186.311 E.01594
G1 X176.311 Y201.158 E.62649
G1 X175.776 Y201.158 E.01594
G1 X191.158 Y185.776 E.64903
G1 X191.158 Y185.242 E.01594
G1 X175.242 Y201.158 E.67157
G1 X174.708 Y201.158 E.01594
G1 X191.158 Y184.708 E.69411
G1 X191.158 Y184.174 E.01594
G1 X174.174 Y201.158 E.71665
G1 X173.64 Y201.158 E.01594
G1 X191.158 Y183.64 E.73919
G1 X191.158 Y183.106 E.01594
G1 X173.106 Y201.158 E.76173
G1 X172.571 Y201.158 E.01594
G1 X191.158 Y182.571 E.78427
G1 X191.158 Y182.037 E.01594
G1 X172.037 Y201.158 E.80681
G1 X171.503 Y201.158 E.01594
G1 X191.158 Y181.503 E.82935
G1 X191.158 Y180.969 E.01594
G1 X170.969 Y201.158 E.85189
G1 X170.435 Y201.158 E.01594
G1 X191.158 Y180.435 E.87443
G1 X191.158 Y179.9 E.01594
G1 X169.9 Y201.158 E.89697
G1 X169.366 Y201.158 E.01594
G1 X191.158 Y179.366 E.91951
G1 X191.158 Y178.832 E.01594
G1 X168.832 Y201.158 E.94205
G1 X168.298 Y201.158 E.01594
G1 X191.158 Y178.298 E.96459
G1 X191.158 Y177.764 E.01594
G1 X167.764 Y201.158 E.98713
G1 X167.23 Y201.158 E.01594
G1 X191.158 Y177.23 E1.00967
G1 X191.158 Y176.695 E.01594
G1 X166.695 Y201.158 E1.03221
G1 X166.161 Y201.158 E.01594
G1 X191.158 Y176.161 E1.05475
G1 X191.158 Y175.627 E.01594
G1 X165.627 Y201.158 E1.07729
G1 X165.093 Y201.158 E.01594
G1 X191.158 Y175.093 E1.09983
G1 X191.158 Y174.559 E.01594
G1 X164.559 Y201.158 E1.12237
G1 X164.024 Y201.158 E.01594
G1 X191.158 Y174.024 E1.14491
G1 X191.158 Y173.49 E.01594
G1 X163.49 Y201.158 E1.16745
G1 X162.956 Y201.158 E.01594
G1 X191.158 Y172.956 E1.18999
G1 X191.158 Y172.422 E.01594
G1 X162.422 Y201.158 E1.21253
G1 X161.888 Y201.158 E.01594
G1 X191.158 Y171.888 E1.23507
G1 X191.158 Y171.354 E.01594
G1 X161.354 Y201.158 E1.25761
G1 X160.819 Y201.158 E.01594
G1 X191.158 Y170.819 E1.28015
G1 X191.158 Y170.285 E.01594
G1 X160.285 Y201.158 E1.30269
G1 X159.751 Y201.158 E.01594
G1 X191.158 Y169.751 E1.32523
G1 X191.158 Y169.217 E.01594
G1 X159.217 Y201.158 E1.34777
G1 X158.842 Y201.158 E.01117
G1 X158.842 Y200.998 E.00476
G1 X191.158 Y168.683 E1.36358
G1 X191.158 Y168.149 E.01594
G1 X158.842 Y200.464 E1.36358
G1 X158.842 Y199.93 E.01594
G1 X191.158 Y167.614 E1.36358
G1 X191.158 Y167.08 E.01594
G1 X158.842 Y199.395 E1.36358
G1 X158.842 Y198.861 E.01594
G1 X191.158 Y166.546 E1.36358
G1 X191.158 Y166.012 E.01594
M73 P26 R44
G1 X158.842 Y198.327 E1.36358
G1 X158.842 Y197.793 E.01594
G1 X191.158 Y165.478 E1.36358
G1 X191.158 Y164.943 E.01594
G1 X158.842 Y197.259 E1.36358
G1 X158.842 Y196.725 E.01594
G1 X191.158 Y164.409 E1.36358
G1 X191.158 Y163.875 E.01594
G1 X158.842 Y196.19 E1.36358
G1 X158.842 Y195.656 E.01594
G1 X191.158 Y163.341 E1.36358
G1 X191.158 Y162.807 E.01594
G1 X158.842 Y195.122 E1.36358
G1 X158.842 Y194.588 E.01594
G1 X191.158 Y162.273 E1.36358
G1 X191.158 Y161.738 E.01594
G1 X158.842 Y194.054 E1.36358
G1 X158.842 Y193.519 E.01594
G1 X191.158 Y161.204 E1.36358
G1 X191.158 Y160.67 E.01594
G1 X158.842 Y192.985 E1.36358
G1 X158.842 Y192.451 E.01594
G1 X191.158 Y160.136 E1.36358
G1 X191.158 Y159.602 E.01594
G1 X158.842 Y191.917 E1.36358
G1 X158.842 Y191.383 E.01594
G1 X191.158 Y159.068 E1.36358
G1 X191.158 Y158.533 E.01594
G1 X158.842 Y190.849 E1.36358
G1 X158.842 Y190.314 E.01594
G1 X191.158 Y157.999 E1.36358
G1 X191.158 Y157.465 E.01594
G1 X158.842 Y189.78 E1.36358
G1 X158.842 Y189.246 E.01594
M73 P26 R43
G1 X191.158 Y156.931 E1.36358
G1 X191.158 Y156.397 E.01594
G1 X158.842 Y188.712 E1.36358
G1 X158.842 Y188.178 E.01594
G1 X191.158 Y155.862 E1.36358
G1 X191.158 Y155.328 E.01594
G1 X158.842 Y187.644 E1.36358
G1 X158.842 Y187.109 E.01594
G1 X191.158 Y154.794 E1.36358
G1 X191.158 Y154.26 E.01594
G1 X158.842 Y186.575 E1.36358
G1 X158.842 Y186.041 E.01594
G1 X191.158 Y153.726 E1.36358
G1 X191.158 Y153.192 E.01594
G1 X158.842 Y185.507 E1.36358
G1 X158.842 Y184.973 E.01594
G1 X191.158 Y152.657 E1.36358
G1 X191.158 Y152.123 E.01594
G1 X158.842 Y184.438 E1.36358
G1 X158.842 Y183.904 E.01594
G1 X191.158 Y151.589 E1.36358
G1 X191.158 Y151.055 E.01594
G1 X158.842 Y183.37 E1.36358
G1 X158.842 Y182.836 E.01594
G1 X191.158 Y150.521 E1.36358
G1 X191.158 Y149.987 E.01594
G1 X158.842 Y182.302 E1.36358
G1 X158.842 Y181.768 E.01594
G1 X191.158 Y149.452 E1.36358
G1 X191.158 Y148.918 E.01594
G1 X158.842 Y181.233 E1.36358
G1 X158.842 Y180.699 E.01594
G1 X191.158 Y148.384 E1.36358
G1 X191.158 Y147.85 E.01594
G1 X158.842 Y180.165 E1.36358
G1 X158.842 Y179.631 E.01594
G1 X191.158 Y147.316 E1.36358
G1 X191.158 Y146.781 E.01594
G1 X158.842 Y179.097 E1.36358
G1 X158.842 Y178.563 E.01594
G1 X191.158 Y146.247 E1.36358
G1 X191.158 Y145.713 E.01594
G1 X158.842 Y178.028 E1.36358
G1 X158.842 Y177.494 E.01594
G1 X191.158 Y145.179 E1.36358
G1 X191.158 Y144.645 E.01594
G1 X158.842 Y176.96 E1.36358
G1 X158.842 Y176.426 E.01594
G1 X191.158 Y144.111 E1.36358
G1 X191.158 Y143.576 E.01594
G1 X158.842 Y175.892 E1.36358
G1 X158.842 Y175.357 E.01594
G1 X191.158 Y143.042 E1.36358
G1 X191.158 Y142.508 E.01594
G1 X158.842 Y174.823 E1.36358
G1 X158.842 Y174.289 E.01594
G1 X191.158 Y141.974 E1.36358
G1 X191.158 Y141.44 E.01594
G1 X158.842 Y173.755 E1.36358
G1 X158.842 Y173.221 E.01594
G1 X191.158 Y140.906 E1.36358
G1 X191.158 Y140.371 E.01594
G1 X158.842 Y172.687 E1.36358
G1 X158.842 Y172.152 E.01594
G1 X191.158 Y139.837 E1.36358
G1 X191.158 Y139.303 E.01594
G1 X158.842 Y171.618 E1.36358
G1 X158.842 Y171.084 E.01594
G1 X191.158 Y138.769 E1.36358
G1 X191.158 Y138.235 E.01594
G1 X158.842 Y170.55 E1.36358
G1 X158.842 Y170.016 E.01594
G1 X191.158 Y137.7 E1.36358
G1 X191.158 Y137.166 E.01594
G1 X158.842 Y169.482 E1.36358
G1 X158.842 Y168.947 E.01594
G1 X191.158 Y136.632 E1.36358
G1 X191.158 Y136.098 E.01594
G1 X158.842 Y168.413 E1.36358
G1 X158.842 Y167.879 E.01594
G1 X191.158 Y135.564 E1.36358
G1 X191.158 Y135.03 E.01594
G1 X158.842 Y167.345 E1.36358
G1 X158.842 Y166.811 E.01594
G1 X191.158 Y134.495 E1.36358
G1 X191.158 Y133.961 E.01594
M73 P27 R43
G1 X158.842 Y166.276 E1.36358
G1 X158.842 Y165.742 E.01594
G1 X191.158 Y133.427 E1.36358
G1 X191.158 Y132.893 E.01594
G1 X158.842 Y165.208 E1.36358
G1 X158.842 Y164.674 E.01594
G1 X191.158 Y132.359 E1.36358
G1 X191.158 Y131.825 E.01594
G1 X158.842 Y164.14 E1.36358
G1 X158.842 Y163.606 E.01594
G1 X191.158 Y131.29 E1.36358
G1 X191.158 Y130.756 E.01594
G1 X158.842 Y163.071 E1.36358
G1 X158.842 Y162.537 E.01594
G1 X191.158 Y130.222 E1.36358
G1 X191.158 Y129.688 E.01594
G1 X158.842 Y162.003 E1.36358
G1 X158.842 Y161.469 E.01594
G1 X191.158 Y129.154 E1.36358
G1 X191.158 Y128.619 E.01594
G1 X158.842 Y160.935 E1.36358
G1 X158.842 Y160.401 E.01594
G1 X191.158 Y128.085 E1.36358
G1 X191.158 Y127.551 E.01594
G1 X158.842 Y159.866 E1.36358
G1 X158.842 Y159.332 E.01594
G1 X191.158 Y127.017 E1.36358
G1 X191.158 Y126.483 E.01594
G1 X158.842 Y158.798 E1.36358
G1 X158.842 Y158.264 E.01594
G1 X191.158 Y125.949 E1.36358
G1 X191.158 Y125.414 E.01594
G1 X158.842 Y157.73 E1.36358
G1 X158.842 Y157.195 E.01594
G1 X191.158 Y124.88 E1.36358
G1 X191.158 Y124.346 E.01594
G1 X158.842 Y156.661 E1.36358
G1 X158.842 Y156.127 E.01594
G1 X191.158 Y123.812 E1.36358
G1 X191.158 Y123.278 E.01594
G1 X158.842 Y155.593 E1.36358
G1 X158.842 Y155.059 E.01594
G1 X191.158 Y122.744 E1.36358
G1 X191.158 Y122.209 E.01594
G1 X158.842 Y154.525 E1.36358
G1 X158.842 Y153.99 E.01594
G1 X191.158 Y121.675 E1.36358
G1 X191.158 Y121.141 E.01594
G1 X158.842 Y153.456 E1.36358
G1 X158.842 Y152.922 E.01594
G1 X191.158 Y120.607 E1.36358
G1 X191.158 Y120.073 E.01594
G1 X158.842 Y152.388 E1.36358
G1 X158.842 Y151.854 E.01594
G1 X191.158 Y119.538 E1.36358
G1 X191.158 Y119.004 E.01594
G1 X158.842 Y151.32 E1.36358
G1 X158.842 Y150.785 E.01594
G1 X190.785 Y118.842 E1.34787
G1 X190.251 Y118.842 E.01594
G1 X158.842 Y150.251 E1.32533
G1 X158.842 Y149.717 E.01594
G1 X189.717 Y118.842 E1.30279
G1 X189.183 Y118.842 E.01594
G1 X158.842 Y149.183 E1.28025
G1 X158.842 Y148.649 E.01594
G1 X188.649 Y118.842 E1.25771
G1 X188.114 Y118.842 E.01594
G1 X158.842 Y148.114 E1.23517
G1 X158.842 Y147.58 E.01594
G1 X187.58 Y118.842 E1.21263
G1 X187.046 Y118.842 E.01594
G1 X158.842 Y147.046 E1.19009
G1 X158.842 Y146.512 E.01594
G1 X186.512 Y118.842 E1.16755
G1 X185.978 Y118.842 E.01594
G1 X158.842 Y145.978 E1.14501
G1 X158.842 Y145.444 E.01594
G1 X185.444 Y118.842 E1.12247
G1 X184.909 Y118.842 E.01594
G1 X158.842 Y144.909 E1.09993
G1 X158.842 Y144.375 E.01594
G1 X184.375 Y118.842 E1.07739
G1 X183.841 Y118.842 E.01594
G1 X158.842 Y143.841 E1.05485
G1 X158.842 Y143.307 E.01594
G1 X183.307 Y118.842 E1.03231
G1 X182.773 Y118.842 E.01594
G1 X158.842 Y142.773 E1.00977
G1 X158.842 Y142.239 E.01594
G1 X182.239 Y118.842 E.98723
G1 X181.704 Y118.842 E.01594
G1 X158.842 Y141.704 E.96469
G1 X158.842 Y141.17 E.01594
G1 X181.17 Y118.842 E.94215
G1 X180.636 Y118.842 E.01594
G1 X158.842 Y140.636 E.91961
G1 X158.842 Y140.102 E.01594
G1 X180.102 Y118.842 E.89707
G1 X179.568 Y118.842 E.01594
G1 X158.842 Y139.568 E.87453
G1 X158.842 Y139.033 E.01594
G1 X179.033 Y118.842 E.85199
G1 X178.499 Y118.842 E.01594
G1 X158.842 Y138.499 E.82945
G1 X158.842 Y137.965 E.01594
G1 X177.965 Y118.842 E.80691
G1 X177.431 Y118.842 E.01594
G1 X158.842 Y137.431 E.78436
G1 X158.842 Y136.897 E.01594
G1 X176.897 Y118.842 E.76182
G1 X176.363 Y118.842 E.01594
G1 X158.842 Y136.363 E.73928
G1 X158.842 Y135.828 E.01594
G1 X175.828 Y118.842 E.71674
G1 X175.294 Y118.842 E.01594
G1 X158.842 Y135.294 E.6942
G1 X158.842 Y134.76 E.01594
G1 X174.76 Y118.842 E.67166
G1 X174.226 Y118.842 E.01594
G1 X158.842 Y134.226 E.64912
G1 X158.842 Y133.692 E.01594
G1 X173.692 Y118.842 E.62658
G1 X173.158 Y118.842 E.01594
G1 X158.842 Y133.158 E.60404
G1 X158.842 Y132.623 E.01594
G1 X172.623 Y118.842 E.5815
G1 X172.089 Y118.842 E.01594
G1 X158.842 Y132.089 E.55896
G1 X158.842 Y131.555 E.01594
G1 X171.555 Y118.842 E.53642
G1 X171.021 Y118.842 E.01594
G1 X158.842 Y131.021 E.51388
G1 X158.842 Y130.487 E.01594
G1 X170.487 Y118.842 E.49134
G1 X169.952 Y118.842 E.01594
G1 X158.842 Y129.952 E.4688
G1 X158.842 Y129.418 E.01594
G1 X169.418 Y118.842 E.44626
G1 X168.884 Y118.842 E.01594
G1 X158.842 Y128.884 E.42372
G1 X158.842 Y128.35 E.01594
M73 P27 R42
G1 X168.35 Y118.842 E.40118
G1 X167.816 Y118.842 E.01594
G1 X158.842 Y127.816 E.37864
G1 X158.842 Y127.282 E.01594
G1 X167.282 Y118.842 E.3561
G1 X166.747 Y118.842 E.01594
G1 X158.842 Y126.747 E.33356
G1 X158.842 Y126.213 E.01594
G1 X166.213 Y118.842 E.31102
G1 X165.679 Y118.842 E.01594
G1 X158.842 Y125.679 E.28848
G1 X158.842 Y125.145 E.01594
G1 X165.145 Y118.842 E.26594
G1 X164.611 Y118.842 E.01594
G1 X158.842 Y124.611 E.2434
G1 X158.842 Y124.077 E.01594
M73 P28 R42
G1 X164.077 Y118.842 E.22086
G1 X163.542 Y118.842 E.01594
G1 X158.842 Y123.542 E.19832
G1 X158.842 Y123.008 E.01594
G1 X163.008 Y118.842 E.17578
G1 X162.474 Y118.842 E.01594
G1 X158.842 Y122.474 E.15324
G1 X158.842 Y121.94 E.01594
G1 X161.94 Y118.842 E.1307
G1 X161.406 Y118.842 E.01594
G1 X158.842 Y121.406 E.10816
G1 X158.842 Y120.871 E.01594
G1 X160.871 Y118.842 E.08562
G1 X160.337 Y118.842 E.01594
G1 X158.842 Y120.337 E.06308
G1 X158.842 Y119.803 E.01594
G1 X159.803 Y118.842 E.04054
G1 X159.269 Y118.842 E.01594
G1 X158.673 Y119.439 E.02516
; WIPE_START
G1 X159.269 Y118.842 E-.32041
G1 X159.803 Y118.842 E-.20299
G1 X159.363 Y119.283 E-.2366
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.8 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 2 start: 58,95
M624 AwAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z0.8 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer2 end: 58,95
M625
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 3/75
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X184.66 Y202.02 Z1 F60000
G1 X159.439 Y201.327 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42064
G1 F4765.435
M204 S8000
G1 X158.842 Y200.731 E.02516
G1 X158.842 Y200.197 E.01594
G1 X159.803 Y201.158 E.04054
G1 X160.337 Y201.158 E.01594
G1 X158.842 Y199.663 E.06308
G1 X158.842 Y199.129 E.01594
G1 X160.871 Y201.158 E.08562
G1 X161.406 Y201.158 E.01594
G1 X158.842 Y198.594 E.10816
G1 X158.842 Y198.06 E.01594
G1 X161.94 Y201.158 E.1307
G1 X162.474 Y201.158 E.01594
G1 X158.842 Y197.526 E.15324
G1 X158.842 Y196.992 E.01594
G1 X163.008 Y201.158 E.17578
G1 X163.542 Y201.158 E.01594
G1 X158.842 Y196.458 E.19832
G1 X158.842 Y195.924 E.01594
G1 X164.076 Y201.158 E.22086
G1 X164.611 Y201.158 E.01594
G1 X158.842 Y195.389 E.2434
G1 X158.842 Y194.855 E.01594
G1 X165.145 Y201.158 E.26594
G1 X165.679 Y201.158 E.01594
G1 X158.842 Y194.321 E.28848
G1 X158.842 Y193.787 E.01594
G1 X166.213 Y201.158 E.31102
G1 X166.747 Y201.158 E.01594
G1 X158.842 Y193.253 E.33356
G1 X158.842 Y192.718 E.01594
G1 X167.282 Y201.158 E.3561
G1 X167.816 Y201.158 E.01594
G1 X158.842 Y192.184 E.37864
G1 X158.842 Y191.65 E.01594
G1 X168.35 Y201.158 E.40118
G1 X168.884 Y201.158 E.01594
G1 X158.842 Y191.116 E.42372
G1 X158.842 Y190.582 E.01594
G1 X169.418 Y201.158 E.44626
G1 X169.952 Y201.158 E.01594
G1 X158.842 Y190.048 E.4688
G1 X158.842 Y189.513 E.01594
G1 X170.487 Y201.158 E.49134
G1 X171.021 Y201.158 E.01594
G1 X158.842 Y188.979 E.51388
G1 X158.842 Y188.445 E.01594
G1 X171.555 Y201.158 E.53642
G1 X172.089 Y201.158 E.01594
G1 X158.842 Y187.911 E.55896
G1 X158.842 Y187.377 E.01594
G1 X172.623 Y201.158 E.5815
G1 X173.158 Y201.158 E.01594
G1 X158.842 Y186.842 E.60404
G1 X158.842 Y186.308 E.01594
G1 X173.692 Y201.158 E.62658
G1 X174.226 Y201.158 E.01594
G1 X158.842 Y185.774 E.64912
G1 X158.842 Y185.24 E.01594
G1 X174.76 Y201.158 E.67166
G1 X175.294 Y201.158 E.01594
G1 X158.842 Y184.706 E.6942
G1 X158.842 Y184.172 E.01594
G1 X175.828 Y201.158 E.71674
G1 X176.363 Y201.158 E.01594
G1 X158.842 Y183.637 E.73928
G1 X158.842 Y183.103 E.01594
G1 X176.897 Y201.158 E.76182
G1 X177.431 Y201.158 E.01594
G1 X158.842 Y182.569 E.78436
G1 X158.842 Y182.035 E.01594
G1 X177.965 Y201.158 E.8069
G1 X178.499 Y201.158 E.01594
G1 X158.842 Y181.501 E.82944
G1 X158.842 Y180.967 E.01594
G1 X179.033 Y201.158 E.85198
G1 X179.568 Y201.158 E.01594
G1 X158.842 Y180.432 E.87452
G1 X158.842 Y179.898 E.01594
G1 X180.102 Y201.158 E.89706
G1 X180.636 Y201.158 E.01594
G1 X158.842 Y179.364 E.9196
G1 X158.842 Y178.83 E.01594
G1 X181.17 Y201.158 E.94215
G1 X181.704 Y201.158 E.01594
G1 X158.842 Y178.296 E.96469
G1 X158.842 Y177.761 E.01594
G1 X182.239 Y201.158 E.98723
G1 X182.773 Y201.158 E.01594
G1 X158.842 Y177.227 E1.00977
G1 X158.842 Y176.693 E.01594
G1 X183.307 Y201.158 E1.03231
G1 X183.841 Y201.158 E.01594
G1 X158.842 Y176.159 E1.05485
G1 X158.842 Y175.625 E.01594
G1 X184.375 Y201.158 E1.07739
G1 X184.909 Y201.158 E.01594
G1 X158.842 Y175.091 E1.09993
G1 X158.842 Y174.556 E.01594
G1 X185.444 Y201.158 E1.12247
G1 X185.978 Y201.158 E.01594
G1 X158.842 Y174.022 E1.14501
G1 X158.842 Y173.488 E.01594
G1 X186.512 Y201.158 E1.16755
G1 X187.046 Y201.158 E.01594
G1 X158.842 Y172.954 E1.19009
G1 X158.842 Y172.42 E.01594
G1 X187.58 Y201.158 E1.21263
G1 X188.114 Y201.158 E.01594
G1 X158.842 Y171.886 E1.23517
G1 X158.842 Y171.351 E.01594
G1 X188.649 Y201.158 E1.25771
G1 X189.183 Y201.158 E.01594
G1 X158.842 Y170.817 E1.28025
G1 X158.842 Y170.283 E.01594
G1 X189.717 Y201.158 E1.30279
G1 X190.251 Y201.158 E.01594
G1 X158.842 Y169.749 E1.32533
G1 X158.842 Y169.215 E.01594
G1 X190.785 Y201.158 E1.34787
G1 X191.158 Y201.158 E.01111
G1 X191.158 Y200.996 E.00483
G1 X158.842 Y168.68 E1.36358
G1 X158.842 Y168.146 E.01594
G1 X191.158 Y200.462 E1.36358
G1 X191.158 Y199.927 E.01594
G1 X158.842 Y167.612 E1.36358
G1 X158.842 Y167.078 E.01594
G1 X191.158 Y199.393 E1.36358
G1 X191.158 Y198.859 E.01594
G1 X158.842 Y166.544 E1.36358
G1 X158.842 Y166.01 E.01594
G1 X191.158 Y198.325 E1.36358
G1 X191.158 Y197.791 E.01594
G1 X158.842 Y165.475 E1.36358
G1 X158.842 Y164.941 E.01594
G1 X191.158 Y197.256 E1.36358
G1 X191.158 Y196.722 E.01594
G1 X158.842 Y164.407 E1.36358
G1 X158.842 Y163.873 E.01594
G1 X191.158 Y196.188 E1.36358
G1 X191.158 Y195.654 E.01594
G1 X158.842 Y163.339 E1.36358
G1 X158.842 Y162.805 E.01594
G1 X191.158 Y195.12 E1.36358
G1 X191.158 Y194.586 E.01594
M73 P29 R42
G1 X158.842 Y162.27 E1.36358
G1 X158.842 Y161.736 E.01594
G1 X191.158 Y194.051 E1.36358
G1 X191.158 Y193.517 E.01594
G1 X158.842 Y161.202 E1.36358
G1 X158.842 Y160.668 E.01594
G1 X191.158 Y192.983 E1.36358
G1 X191.158 Y192.449 E.01594
G1 X158.842 Y160.134 E1.36358
G1 X158.842 Y159.599 E.01594
G1 X191.158 Y191.915 E1.36358
G1 X191.158 Y191.381 E.01594
G1 X158.842 Y159.065 E1.36358
G1 X158.842 Y158.531 E.01594
G1 X191.158 Y190.846 E1.36358
G1 X191.158 Y190.312 E.01594
G1 X158.842 Y157.997 E1.36358
G1 X158.842 Y157.463 E.01594
G1 X191.158 Y189.778 E1.36358
G1 X191.158 Y189.244 E.01594
G1 X158.842 Y156.929 E1.36358
G1 X158.842 Y156.394 E.01594
G1 X191.158 Y188.71 E1.36358
G1 X191.158 Y188.175 E.01594
G1 X158.842 Y155.86 E1.36358
G1 X158.842 Y155.326 E.01594
G1 X191.158 Y187.641 E1.36358
G1 X191.158 Y187.107 E.01594
G1 X158.842 Y154.792 E1.36358
G1 X158.842 Y154.258 E.01594
G1 X191.158 Y186.573 E1.36358
G1 X191.158 Y186.039 E.01594
G1 X158.842 Y153.724 E1.36358
G1 X158.842 Y153.189 E.01594
G1 X191.158 Y185.505 E1.36358
G1 X191.158 Y184.97 E.01594
G1 X158.842 Y152.655 E1.36358
G1 X158.842 Y152.121 E.01594
M104 T0 S240 N0 ;Multi extruder pre heating
G1 X191.158 Y184.436 E1.36358
G1 X191.158 Y183.902 E.01594
G1 X158.842 Y151.587 E1.36358
G1 X158.842 Y151.053 E.01594
G1 X191.158 Y183.368 E1.36358
G1 X191.158 Y182.834 E.01594
G1 X158.842 Y150.518 E1.36358
G1 X158.842 Y149.984 E.01594
G1 X191.158 Y182.3 E1.36358
G1 X191.158 Y181.765 E.01594
G1 X158.842 Y149.45 E1.36358
G1 X158.842 Y148.916 E.01594
G1 X191.158 Y181.231 E1.36358
G1 X191.158 Y180.697 E.01594
G1 X158.842 Y148.382 E1.36358
G1 X158.842 Y147.848 E.01594
G1 X191.158 Y180.163 E1.36358
G1 X191.158 Y179.629 E.01594
G1 X158.842 Y147.313 E1.36358
G1 X158.842 Y146.779 E.01594
G1 X191.158 Y179.094 E1.36358
G1 X191.158 Y178.56 E.01594
G1 X158.842 Y146.245 E1.36358
G1 X158.842 Y145.711 E.01594
G1 X191.158 Y178.026 E1.36358
G1 X191.158 Y177.492 E.01594
G1 X158.842 Y145.177 E1.36358
G1 X158.842 Y144.643 E.01594
G1 X191.158 Y176.958 E1.36358
G1 X191.158 Y176.424 E.01594
G1 X158.842 Y144.108 E1.36358
G1 X158.842 Y143.574 E.01594
G1 X191.158 Y175.889 E1.36358
G1 X191.158 Y175.355 E.01594
G1 X158.842 Y143.04 E1.36358
G1 X158.842 Y142.506 E.01594
G1 X191.158 Y174.821 E1.36358
G1 X191.158 Y174.287 E.01594
M73 P29 R41
G1 X158.842 Y141.972 E1.36358
G1 X158.842 Y141.437 E.01594
G1 X191.158 Y173.753 E1.36358
G1 X191.158 Y173.219 E.01594
G1 X158.842 Y140.903 E1.36358
G1 X158.842 Y140.369 E.01594
G1 X191.158 Y172.684 E1.36358
G1 X191.158 Y172.15 E.01594
G1 X158.842 Y139.835 E1.36358
G1 X158.842 Y139.301 E.01594
G1 X191.158 Y171.616 E1.36358
G1 X191.158 Y171.082 E.01594
G1 X158.842 Y138.767 E1.36358
G1 X158.842 Y138.232 E.01594
G1 X191.158 Y170.548 E1.36358
G1 X191.158 Y170.013 E.01594
G1 X158.842 Y137.698 E1.36358
G1 X158.842 Y137.164 E.01594
G1 X191.158 Y169.479 E1.36358
G1 X191.158 Y168.945 E.01594
G1 X158.842 Y136.63 E1.36358
G1 X158.842 Y136.096 E.01594
G1 X191.158 Y168.411 E1.36358
G1 X191.158 Y167.877 E.01594
G1 X158.842 Y135.562 E1.36358
G1 X158.842 Y135.027 E.01594
G1 X191.158 Y167.343 E1.36358
G1 X191.158 Y166.808 E.01594
G1 X158.842 Y134.493 E1.36358
G1 X158.842 Y133.959 E.01594
G1 X191.158 Y166.274 E1.36358
G1 X191.158 Y165.74 E.01594
G1 X158.842 Y133.425 E1.36358
G1 X158.842 Y132.891 E.01594
G1 X191.158 Y165.206 E1.36358
G1 X191.158 Y164.672 E.01594
G1 X158.842 Y132.356 E1.36358
G1 X158.842 Y131.822 E.01594
G1 X191.158 Y164.138 E1.36358
G1 X191.158 Y163.603 E.01594
G1 X158.842 Y131.288 E1.36358
G1 X158.842 Y130.754 E.01594
G1 X191.158 Y163.069 E1.36358
G1 X191.158 Y162.535 E.01594
M73 P30 R41
G1 X158.842 Y130.22 E1.36358
G1 X158.842 Y129.686 E.01594
G1 X191.158 Y162.001 E1.36358
G1 X191.158 Y161.467 E.01594
G1 X158.842 Y129.151 E1.36358
G1 X158.842 Y128.617 E.01594
G1 X191.158 Y160.932 E1.36358
G1 X191.158 Y160.398 E.01594
G1 X158.842 Y128.083 E1.36358
G1 X158.842 Y127.549 E.01594
G1 X191.158 Y159.864 E1.36358
G1 X191.158 Y159.33 E.01594
G1 X158.842 Y127.015 E1.36358
G1 X158.842 Y126.481 E.01594
G1 X191.158 Y158.796 E1.36358
G1 X191.158 Y158.262 E.01594
G1 X158.842 Y125.946 E1.36358
G1 X158.842 Y125.412 E.01594
G1 X191.158 Y157.727 E1.36358
G1 X191.158 Y157.193 E.01594
G1 X158.842 Y124.878 E1.36358
G1 X158.842 Y124.344 E.01594
G1 X191.158 Y156.659 E1.36358
G1 X191.158 Y156.125 E.01594
G1 X158.842 Y123.81 E1.36358
G1 X158.842 Y123.275 E.01594
G1 X191.158 Y155.591 E1.36358
G1 X191.158 Y155.057 E.01594
G1 X158.842 Y122.741 E1.36358
G1 X158.842 Y122.207 E.01594
G1 X191.158 Y154.522 E1.36358
G1 X191.158 Y153.988 E.01594
G1 X158.842 Y121.673 E1.36358
G1 X158.842 Y121.139 E.01594
G1 X191.158 Y153.454 E1.36358
G1 X191.158 Y152.92 E.01594
G1 X158.842 Y120.605 E1.36358
G1 X158.842 Y120.07 E.01594
G1 X191.158 Y152.386 E1.36358
G1 X191.158 Y151.851 E.01594
G1 X158.842 Y119.536 E1.36358
G1 X158.842 Y119.002 E.01594
G1 X191.158 Y151.317 E1.36358
G1 X191.158 Y150.783 E.01594
G1 X159.217 Y118.842 E1.34777
G1 X159.751 Y118.842 E.01594
G1 X191.158 Y150.249 E1.32523
G1 X191.158 Y149.715 E.01594
G1 X160.285 Y118.842 E1.30269
G1 X160.819 Y118.842 E.01594
G1 X191.158 Y149.181 E1.28015
G1 X191.158 Y148.646 E.01594
G1 X161.354 Y118.842 E1.25761
G1 X161.888 Y118.842 E.01594
G1 X191.158 Y148.112 E1.23507
G1 X191.158 Y147.578 E.01594
G1 X162.422 Y118.842 E1.21253
G1 X162.956 Y118.842 E.01594
G1 X191.158 Y147.044 E1.18999
G1 X191.158 Y146.51 E.01594
G1 X163.49 Y118.842 E1.16745
G1 X164.024 Y118.842 E.01594
G1 X191.158 Y145.976 E1.14491
G1 X191.158 Y145.441 E.01594
G1 X164.559 Y118.842 E1.12237
G1 X165.093 Y118.842 E.01594
G1 X191.158 Y144.907 E1.09983
G1 X191.158 Y144.373 E.01594
G1 X165.627 Y118.842 E1.07729
G1 X166.161 Y118.842 E.01594
G1 X191.158 Y143.839 E1.05475
G1 X191.158 Y143.305 E.01594
G1 X166.695 Y118.842 E1.03221
G1 X167.23 Y118.842 E.01594
G1 X191.158 Y142.77 E1.00967
G1 X191.158 Y142.236 E.01594
G1 X167.764 Y118.842 E.98713
G1 X168.298 Y118.842 E.01594
G1 X191.158 Y141.702 E.96459
G1 X191.158 Y141.168 E.01594
G1 X168.832 Y118.842 E.94205
G1 X169.366 Y118.842 E.01594
G1 X191.158 Y140.634 E.91951
G1 X191.158 Y140.1 E.01594
G1 X169.9 Y118.842 E.89697
G1 X170.435 Y118.842 E.01594
G1 X191.158 Y139.565 E.87443
G1 X191.158 Y139.031 E.01594
G1 X170.969 Y118.842 E.85189
G1 X171.503 Y118.842 E.01594
G1 X191.158 Y138.497 E.82935
G1 X191.158 Y137.963 E.01594
G1 X172.037 Y118.842 E.80681
G1 X172.571 Y118.842 E.01594
G1 X191.158 Y137.429 E.78427
G1 X191.158 Y136.894 E.01594
G1 X173.106 Y118.842 E.76173
G1 X173.64 Y118.842 E.01594
G1 X191.158 Y136.36 E.73919
G1 X191.158 Y135.826 E.01594
G1 X174.174 Y118.842 E.71665
G1 X174.708 Y118.842 E.01594
G1 X191.158 Y135.292 E.69411
G1 X191.158 Y134.758 E.01594
G1 X175.242 Y118.842 E.67157
G1 X175.776 Y118.842 E.01594
G1 X191.158 Y134.224 E.64903
G1 X191.158 Y133.689 E.01594
G1 X176.311 Y118.842 E.62649
G1 X176.845 Y118.842 E.01594
G1 X191.158 Y133.155 E.60395
G1 X191.158 Y132.621 E.01594
G1 X177.379 Y118.842 E.58141
G1 X177.913 Y118.842 E.01594
G1 X191.158 Y132.087 E.55887
G1 X191.158 Y131.553 E.01594
G1 X178.447 Y118.842 E.53633
G1 X178.981 Y118.842 E.01594
G1 X191.158 Y131.019 E.51379
G1 X191.158 Y130.484 E.01594
G1 X179.516 Y118.842 E.49125
G1 X180.05 Y118.842 E.01594
G1 X191.158 Y129.95 E.46871
G1 X191.158 Y129.416 E.01594
G1 X180.584 Y118.842 E.44617
G1 X181.118 Y118.842 E.01594
G1 X191.158 Y128.882 E.42363
G1 X191.158 Y128.348 E.01594
G1 X181.652 Y118.842 E.40109
G1 X182.187 Y118.842 E.01594
G1 X191.158 Y127.813 E.37855
G1 X191.158 Y127.279 E.01594
G1 X182.721 Y118.842 E.35601
G1 X183.255 Y118.842 E.01594
G1 X191.158 Y126.745 E.33347
G1 X191.158 Y126.211 E.01594
G1 X183.789 Y118.842 E.31093
G1 X184.323 Y118.842 E.01594
G1 X191.158 Y125.677 E.28839
G1 X191.158 Y125.143 E.01594
G1 X184.857 Y118.842 E.26584
G1 X185.392 Y118.842 E.01594
G1 X191.158 Y124.608 E.2433
G1 X191.158 Y124.074 E.01594
G1 X185.926 Y118.842 E.22076
G1 X186.46 Y118.842 E.01594
G1 X191.158 Y123.54 E.19822
G1 X191.158 Y123.006 E.01594
G1 X186.994 Y118.842 E.17568
G1 X187.528 Y118.842 E.01594
G1 X191.158 Y122.472 E.15314
G1 X191.158 Y121.938 E.01594
G1 X188.062 Y118.842 E.1306
G1 X188.597 Y118.842 E.01594
G1 X191.158 Y121.403 E.10806
G1 X191.158 Y120.869 E.01594
G1 X189.131 Y118.842 E.08552
G1 X189.665 Y118.842 E.01594
G1 X191.158 Y120.335 E.06298
G1 X191.158 Y119.801 E.01594
G1 X190.199 Y118.842 E.04044
G1 X190.733 Y118.842 E.01594
G1 X191.327 Y119.436 E.02506
; WIPE_START
G1 X190.733 Y118.842 E-.31919
G1 X190.199 Y118.842 E-.20299
G1 X190.642 Y119.285 E-.23782
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 3 start: 58,95
M624 AwAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z1 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer3 end: 58,95
M625
G1 X188.84 Y278.958
G1 Z.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X189.340 Y279.458  
M204 S8000
G3  X186.878 Y281.499   I-4.373 J-2.768 E0.1236 F3938
G3  X184.230 Y280.249   I0.012 J-3.454 E0.1149
G2  X181.527 Y279.458   I-2.709 J4.247 E0.1085
G2  X167.963 Y279.462   I-6.687 J357.435 E0.5155
G2  X164.028 Y281.339   I0.499 J6.110 E0.1694
G3  X161.716 Y280.909   I-0.854 J-1.838 E0.0953
G1  X160.340 Y279.458   E0.0760
G3  X158.409 Y277.136   I3.871 J-5.183 E0.1159
G3  X159.585 Y274.543   I2.902 J-0.247 E0.1130
G2  X160.340 Y272.139   I-3.465 J-2.409 E0.0972
G2  X160.337 Y259.106   I-321.195 J-6.431 E0.4954
G2  X158.491 Y255.528   I-6.663 J1.171 E0.1554
G3  X158.830 Y253.550   I1.658 J-0.734 E0.0808
G1  X161.716 Y250.507   E0.1594
G3  X165.138 Y250.950   I1.525 J1.652 E0.1495
G2  X168.153 Y251.958   I3.021 J-4.025 E0.1229
G2  X181.717 Y251.954   I6.687 J-357.435 E0.5155
G2  X185.652 Y250.077   I-0.499 J-6.110 E0.1694
G3  X187.964 Y250.507   I0.854 J1.838 E0.0953
G1  X188.954 Y251.551   E0.0547
G1 E-0.8000 F1800
M204 S10000
G1  X190.674 Y253.365   F600
G1 E0.8000 F1800
M204 S8000
G3  X190.302 Y256.601   I-1.339 J1.486 E0.1447 F3938
G2  X189.340 Y259.276   I3.254 J2.680 E0.1102
G2  X189.343 Y272.310   I321.212 J6.432 E0.4954
G2  X191.189 Y275.888   I6.663 J-1.171 E0.1554
G3  X190.849 Y277.866   I-1.658 J0.734 E0.0808
G1  X189.340 Y279.458   E0.0834
; WIPE_TOWER_END
G1  X188.840 Y251.958  
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S8000
G1  X160.840  E1.0642
G1  Y272.208  E0.2565
G1  X188.840  E1.0642
G1  Y278.958  E0.2565
M204 S10000
M73 P31 R41
G1  X161.840 Y272.208  
;--------------------
; CP EMPTY GRID START
; layer #4
M204 S8000
G1  Y278.958  E0.2565
M204 S10000
G1  X170.507 
M204 S8000
G1  Y272.208  E0.2565
M204 S10000
G1  X179.173 
M204 S8000
G1  Y278.958  E0.2565
M204 S10000
G1  X187.840 
M204 S8000
G1  Y272.208  E0.2565
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #3
; material : TPU -> TPU
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-.8 F1800
G17
G3 Z1 I1.217 J0 P1  F60000
G1 X161.09 Y266.208
G1 Z.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF0 NF1
M204 S8000
G1  X188.590 Y266.208  E2.1885 F1881
G1  Y267.458  E0.0995
G1  X161.090  E2.1885
G1  Y268.708  E0.0995
G1  X188.590  E2.1885
G1  Y269.958  E0.0995
G1  X161.090  E2.1885
G1  Y271.208  E0.0995
G1  X188.590  E2.1885
; NOZZLE_CHANGE_END OF0 NF1
M104 T1 S147 N0 ;Multi extruder pre cooling

; WIPE_START
G1 F5400
M204 S8000
G1 X186.59 Y271.208 E-1.9
; WIPE_END
G1 E-.1 F1800
M204 S10000
G17
G3 Z1 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20250604 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S0 ; disable E air printing detect


M620 S1A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z3.6 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F149.669 L0 H0.4 T270 P255 S1



M620.10 A1 F79.8237 L0 H0.4 T250 P240 S1



M620.11 P0 I0 E0



M620.11 K1 I0 R10 F200


M628 S1


M620.11 S1 L0 I0 R10 D8 E-10 F200


M629


M620.11 H2 C331


T1
M73 E3

;deretract



; VFLUSH_START


;VG1 E0 F79


SYNC T0

; VFLUSH_END

M1002 set_filament_type:TPU

M400
M83



M628 S0
;VM109 S240
M629
M400

M983.3 F1.33333 A0.4


M400

G1 Y320 F30000
G1 X194.344

M73 P31 R40
G1 Y295
G1 Y265 F18000
G1 Z3.6 F3000

M204 S8000


M621 S1A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S1;enable tpu clog detect



M1015.4 S0 ; disable E air printing detect


M620.6 I1 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S255
M106 P2 S255
G1 X193.344 Y252.458 F60000
G1 Z.6
G1 X188.84 Y252.458 Z1

; filament start gcode
G1 Z.6
G1 E2 F1800

G4 S0
; CP TOOLCHANGE WIPE
; LINE_WIDTH: 0.500000
M204 S8000
G1  X185.840 Y252.458  E0.1140 F1782
G1 E-0.8000 F1800
M204 S10000
G1  X190.340  F600
G1  X188.840  F240
G1  X189.340  F600
G1  Y252.958 
G1  X188.340 
G1  Y251.958 
G1  X189.840 
G1  Y253.458 
G1  X187.840 
G1  Y251.458 
G1  X185.840 Y252.458   F1782
G1 E0.8000 F1800
M204 S8000
G1  X160.840  E0.9502 F1782
G1  Y253.208  E0.0285
G1  X188.840  E1.0642 F2025
G1  Y253.958  E0.0285
G1  X160.840  E1.0642 F2100
G1  Y254.708  E0.0285
G1  X188.840  E1.0642
G1  Y255.458  E0.0285
G1  X160.840  E1.0642
G1  Y256.208  E0.0285
G1  X188.840  E1.0642
G1  Y256.958  E0.0285
G1  X160.840  E1.0642
G1  Y257.708  E0.0285
G1  X188.840  E1.0642
G1  Y258.458  E0.0285
G1  X160.840  E1.0642
G1  Y259.208  E0.0285
G1  X188.840  E1.0642
G1  Y259.958  E0.0285
G1  X160.840  E1.0642
G1  Y260.708  E0.0285
G1  X188.840  E1.0642
G1  Y261.458  E0.0285
G1  X160.840  E1.0642
G1  Y262.208  E0.0285
G1  X188.840  E1.0642
G1  Y262.958  E0.0285
G1  X160.840  E1.0642
G1  Y263.708  E0.0285
G1  X188.840  E1.0642
G1  Y264.458  E0.0285
G1  X160.840  E1.0642
G1  Y265.208  E0.0285
G1  X188.840  E1.0642
; WIPE_TOWER_END
M220 R
G1 F60000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F5400
M204 S8000
G1 X186.84 Y265.208 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1 I1.217 J0 P1  F60000
; OBJECT_ID: 95
; COOLING_NODE: 0
; start printing object, unique label id: 95
M624 AgAAAAAAAAA=
G1 X193.008 Y107.704
G1 Z.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F2545.881
M204 S5000
G1 X158.428 Y107.704 E1.08423
G1 X158.428 Y107.124 E.01819
G1 X193.008 Y107.124 E1.08423
G1 X193.008 Y107.644 E.0163
M204 S10000
G1 X192.812 Y107.414 F60000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F5107.47
M204 S8000
G1 X158.624 Y107.414 E.53432
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5107.47
G1 X160.624 Y107.414 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 95
M625
;======== H2D 20250521========
; layer num/total_layer_count: 4/75
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change


; OBJECT_ID: 95
; COOLING_NODE: 0
; start printing object, unique label id: 95
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1 I-.011 J1.217 P1  F60000
G1 X193.008 Y107.704 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F2545.881
M204 S5000
G1 X158.428 Y107.704 E1.08423
G1 X158.428 Y107.124 E.01819
G1 X193.008 Y107.124 E1.08423
G1 X193.008 Y107.644 E.0163
M204 S10000
G1 X192.812 Y107.414 F60000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F5107.47
M204 S8000
G1 X158.624 Y107.414 E.53432
; WIPE_START
G1 X160.624 Y107.414 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 95
M625
M204 S10000
G17
G3 Z1.2 I-1.217 J.002 P1  F60000
M73 P32 R40
G1 X160.84 Y265.458 Z1.2
G1 Z.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S8000
G1  X160.840 Y259.958  E0.2090 F2100
G1  X188.840  E1.0642
G1  Y265.458  E0.2090
G1  X160.840  E1.0642
M204 S10000
G1  X161.840 Y259.958  
;--------------------
; CP EMPTY GRID START
; layer #5
M204 S8000
G1  Y265.458  E0.2090
M204 S10000
G1  X170.507 
M204 S8000
G1  Y259.958  E0.2090
M204 S10000
G1  X179.173 
M204 S8000
G1  Y265.458  E0.2090
M204 S10000
G1  X187.840 
M204 S8000
G1  Y259.958  E0.2090
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #4
; material : PCTG -> PCTG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-.8 F1800
G17
G3 Z1.2 I1.217 J0 P1  F60000
G1 X161.09 Y252.708 Z.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF1 NF0
M104 T0 S210 N0 ;Multi extruder pre cooling in post extrusion
M204 S8000
G1  X188.590 Y252.708  E2.1885 F251
G1  Y254.208  E0.1194
G1  X161.090  E2.1885
G1  Y255.708  E0.1194
G1  X188.590  E2.1885
G1  Y257.208  E0.1194
M104 T1 S255 N0 ;Multi extruder pre heating
G1  X161.090  E2.1885
G1  Y258.708  E0.1194
G1  X188.590  E2.1885
M204 S10000
G1  Y259.708 
G1  X161.590  F398
G1  Y258.208 
M73 P33 R39
G1  X188.090 
G1  Y256.708 
G1  X161.590 
G1  Y255.208 
G1  X188.090 
G1  Y253.708 
G1  X161.590 
; NOZZLE_CHANGE_END OF1 NF0
M104 T0 S114 N0 ;Multi extruder pre cooling

G1 E-2 F1800
G17
G3 Z1.2 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20250604 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S0 ; disable E air printing detect


M620 S0A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z3.8 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F79.8237 L0 H0.4 T250 P240 S1



M620.10 A1 F149.669 L0 H0.4 T270 P255 S1



M620.11 P0 I1 E0



M620.11 K1 I1 R0 F200


M628 S1

M620.11 S0 L0 I1 E-10 F200

M629


M620.11 H2 C331


T0
M73 E2

;deretract


;VG1 E4 F200
;VG1 E4 F100



; VFLUSH_START


;VG1 E0 F79


SYNC T0

; VFLUSH_END

M1002 set_filament_type:PCTG

M400
M83



M628 S0
;VM109 S255
M629
M400

M983.3 F2.5 A0.4


M400

G1 Y320 F30000
G1 X194.344

G1 Y295
G1 Y265 F18000
G1 Z3.8 F3000

M204 S8000


M621 S0A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S0;disable tpu clog detect



M1015.4 S0 ; disable E air printing detect


M620.6 I0 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S25.5
M106 P2 S0
G1 X193.344 Y265.361 F60000
G1 Z.8
G1 X193.344 Y272.993 Z1.2
G1 X193.344 Y283.532 Z1.2
G1 X156.335 Y283.532
G1 X156.335 Y278.708
G1 X160.84 Y278.708

; filament start gcode
G1 Z.8
G1 E2 F1800

G4 S0
; CP TOOLCHANGE WIPE
; LINE_WIDTH: 0.500000
M204 S8000
G1  X163.840 Y278.708  E0.1140 F1782
G1 E-0.8000 F1800
M204 S10000
G1  X159.340  F600
G1  X160.840  F240
G1  X161.340  F600
G1  Y279.208 
G1  X160.340 
G1  Y278.208 
G1  X161.840 
M73 P34 R39
G1  Y279.708 
G1  X159.840 
G1  Y277.708 
G1  X163.840 Y278.708   F1782
G1 E0.8000 F1800
M204 S8000
G1  X188.840  E0.9502 F1782
G1  Y277.958  E0.0285
G1  X160.840  E1.0642 F2025
G1  Y277.208  E0.0285
G1  X188.840  E1.0642 F2473
G1  Y276.458  E0.0285
G1  X160.840  E1.0642 F3938
G1  Y275.708  E0.0285
G1  X188.840  E1.0642
G1  Y274.958  E0.0285
G1  X160.840  E1.0642
G1  Y274.208  E0.0285
G1  X188.840  E1.0642
G1  Y273.458  E0.0285
G1  X160.840  E1.0642
G1  Y272.708  E0.0285
G1  X188.840  E1.0642
G1  Y271.958  E0.0285
G1  X160.840  E1.0642
G1  Y271.208  E0.0285
G1  X188.840  E1.0642
G1  Y270.458  E0.0285
G1  X160.840  E1.0642
G1  Y269.708  E0.0285
G1  X188.840  E1.0642
G1  Y268.958  E0.0285
G1  X160.840  E1.0642
G1  Y268.208  E0.0285
G1  X188.840  E1.0642
G1  Y267.458  E0.0285
G1  X160.840  E1.0642
G1  Y266.708  E0.0285
G1  X188.840  E1.0642
G1  Y265.958  E0.0285
G1  X160.840  E1.0642
; WIPE_TOWER_END
M220 R
G1 F60000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y251.958  
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X161.716 Y280.909  
M204 S8000
G1  X160.489 Y279.615   E0.0678 F3938
G1 E-0.8000 F1800
M204 S10000
G1  X158.771 Y277.799   F600
G1 E0.8000 F1800
M204 S8000
G3  X159.378 Y274.814   I1.593 J-1.230 E0.1313 F3938
G2  X160.340 Y272.139   I-3.254 J-2.680 E0.1102
G2  X160.337 Y259.106   I-321.195 J-6.431 E0.4954
G2  X158.491 Y255.528   I-6.663 J1.171 E0.1554
G3  X158.830 Y253.550   I1.658 J-0.734 E0.0808
G3  X161.949 Y250.297   I19.398 J15.476 E0.1715
G3  X165.138 Y250.950   I1.276 J1.879 E0.1379
G2  X168.153 Y251.958   I3.021 J-4.025 E0.1229
G2  X181.717 Y251.954   I6.687 J-357.435 E0.5155
G2  X185.652 Y250.077   I-0.499 J-6.110 E0.1694
G3  X187.964 Y250.507   I0.854 J1.838 E0.0953
G1  X189.340 Y251.958   E0.0760
G1 E0.0000
G3  X191.271 Y254.280   I-3.871 J5.182 E0.1159
G3  X190.095 Y256.873   I-2.902 J0.247 E0.1130
G2  X189.340 Y259.276   I3.464 J2.409 E0.0972
G2  X189.343 Y272.310   I321.212 J6.432 E0.4954
G2  X191.189 Y275.888   I6.663 J-1.171 E0.1554
G3  X190.849 Y277.866   I-1.658 J0.734 E0.0808
G1  X189.340 Y279.458   E0.0834
G3  X186.878 Y281.499   I-4.373 J-2.768 E0.1236
G3  X184.230 Y280.249   I0.012 J-3.454 E0.1149
G2  X181.527 Y279.458   I-2.709 J4.247 E0.1085
G2  X167.963 Y279.462   I-6.687 J357.435 E0.5155
G2  X164.028 Y281.339   I0.499 J6.110 E0.1694
G3  X161.716 Y280.909   I-0.854 J-1.838 E0.0953
; WIPE_TOWER_END

; WIPE_START
G1 F5107.47
M204 S8000
G1 X161.828 Y281.019 E-.05968
G1 X161.949 Y281.119 E-.05967
G1 X162.077 Y281.21 E-.05968
G1 X162.212 Y281.29 E-.05968
G1 X162.353 Y281.36 E-.05967
G1 X162.499 Y281.418 E-.05967
G1 X162.649 Y281.464 E-.05967
G1 X162.802 Y281.499 E-.05968
G1 X162.957 Y281.522 E-.05967
G1 X163.114 Y281.532 E-.05968
G1 X163.271 Y281.53 E-.05968
G1 X163.427 Y281.516 E-.05967
G1 X163.541 Y281.496 E-.04391
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.2 I1.217 J0 P1  F60000
; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X185.25 Y199.282 Z1.2 F60000
G1 X158.857 Y188.231 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X158.857 Y186.603 E.05236
G1 X177.01 Y118.857 E2.25529
G1 X173.448 Y118.857 E.11452
G1 X158.857 Y122.767 E.48575
M204 S10000
G1 X158.857 Y125.318 F60000
G1 F4421.739
M204 S8000
M73 P34 R38
G1 X158.857 Y123.689 E.05236
G1 X160.152 Y118.857 E.16086
G1 X158.857 Y118.857 E.04163
G1 X158.857 Y120.029 E.03769
G1 X191.143 Y152.315 E1.4682
G1 X191.143 Y156.26 E.12687
G1 X158.857 Y164.911 E1.0748
G1 X158.857 Y166.085 E.03776
G1 X191.143 Y198.371 E1.4682
G1 X191.143 Y198.404 E.00108
G1 X180.923 Y201.143 E.34023
G1 X180.248 Y201.143 E.0217
G1 X191.143 Y160.483 E1.3536
G1 X191.143 Y158.854 E.05236
M204 S10000
G1 X191.143 Y146.203 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y147.831 E.05236
G1 X158.857 Y156.482 E1.0748
G1 X158.857 Y155.146 E.04297
G1 X168.581 Y118.857 E1.20808
G1 X169.199 Y118.857 E.01988
G1 X191.143 Y140.801 E.9979
G1 X191.143 Y139.403 E.04496
G1 X158.857 Y148.053 E1.0748
G1 X158.857 Y149.682 E.05236
M204 S10000
G1 X158.857 Y154.571 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y186.857 E1.4682
G1 X191.143 Y181.547 E.17075
G1 X158.857 Y190.197 E1.0748
G1 X158.857 Y189.113 E.03487
G1 X170.887 Y201.143 E.54705
G1 X171.819 Y201.143 E.02998
G1 X191.143 Y129.026 E2.40081
G1 X191.143 Y129.287 E.00839
G1 X180.713 Y118.857 E.47429
G1 X185.439 Y118.857 E.15195
G1 X163.39 Y201.143 E2.73933
G1 X159.373 Y201.143 E.12918
G1 X158.857 Y200.627 E.02344
G1 X158.857 Y198.626 E.06434
G1 X191.143 Y189.975 E1.0748
G1 X191.143 Y191.939 E.06315
G1 X188.677 Y201.143 E.30638
G1 X182.401 Y201.143 E.20181
G1 X158.857 Y177.599 E1.07066
G1 X158.857 Y181.769 E.13407
G1 X191.143 Y173.118 E1.0748
G1 X191.143 Y175.343 E.07154
G1 X158.857 Y143.057 E1.4682
G1 X158.857 Y139.625 E.11038
G1 X191.143 Y130.974 E1.0748
G1 X191.143 Y132.602 E.05236
M204 S10000
G1 X191.143 Y120.917 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y122.545 E.05236
G1 X158.857 Y131.196 E1.0748
M73 P35 R38
G1 X158.857 Y131.543 E.01118
M104 T0 S240 N0 ;Multi extruder pre heating
G1 X191.143 Y163.829 E1.4682
G1 X191.143 Y164.689 E.02767
G1 X158.857 Y173.34 E1.0748
G1 X158.857 Y171.712 E.05236
; WIPE_START
G1 X158.857 Y173.34 E-.61876
G1 X159.216 Y173.244 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.2 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 4 start: 58,95
M624 AwAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z1.2 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer4 end: 58,95
M625
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 5/75
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X186.902 Y201.143 Z1.4 F60000
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X188.53 Y201.143 E.05236
G1 X191.143 Y191.393 E.32457
G1 X191.143 Y190.122 E.04088
G1 X158.857 Y198.773 E1.0748
G1 X158.857 Y200.427 E.0532
G1 X159.573 Y201.143 E.03254
G1 X163.244 Y201.143 E.11804
G1 X185.292 Y118.857 E2.73933
G1 X180.913 Y118.857 E.14081
G1 X191.143 Y129.087 E.46519
M204 S10000
G1 X191.143 Y132.749 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y131.12 E.05236
G1 X158.857 Y139.771 E1.0748
G1 X158.857 Y142.857 E.09925
G1 X191.143 Y175.143 E1.4682
G1 X191.143 Y173.264 E.0604
G1 X158.857 Y181.915 E1.0748
G1 X158.857 Y180.287 E.05236
M204 S10000
G1 X158.857 Y187.685 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y186.056 E.05236
G1 X176.863 Y118.857 E2.2371
G1 X173.995 Y118.857 E.09224
G1 X158.857 Y122.913 E.50394
G1 X158.857 Y123.143 E.00738
G1 X160.006 Y118.857 E.14267
G1 X158.857 Y118.857 E.03693
G1 X158.857 Y119.829 E.03126
G1 X191.143 Y152.115 E1.4682
G1 X191.143 Y147.978 E.13303
G1 X158.857 Y156.629 E1.0748
G1 X158.857 Y158.257 E.05236
M204 S10000
G1 X158.857 Y146.572 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y148.2 E.05236
G1 X191.143 Y139.549 E1.0748
G1 X191.143 Y140.601 E.03382
G1 X169.399 Y118.857 E.9888
G1 X168.435 Y118.857 E.03102
G1 X158.857 Y154.6 E1.18989
G1 X158.857 Y154.371 E.00734
G1 X191.143 Y186.657 E1.4682
G1 X191.143 Y181.693 E.15961
G1 X158.857 Y190.344 E1.0748
G1 X158.857 Y188.913 E.046
G1 X171.087 Y201.143 E.55614
G1 X171.673 Y201.143 E.01884
G1 X191.143 Y128.48 E2.419
G1 X191.143 Y122.691 E.18613
G1 X158.857 Y131.342 E1.0748
G1 X191.143 Y163.629 E1.46823
G1 X191.143 Y164.835 E.03881
G1 X158.857 Y173.486 E1.0748
G1 X158.857 Y177.399 E.12583
G1 X182.601 Y201.143 E1.07975
M204 S10000
G1 X191.143 Y158.308 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y159.936 E.05236
G1 X180.101 Y201.143 E1.37179
G1 X181.469 Y201.143 E.04398
G1 X191.143 Y198.551 E.32204
G1 X191.143 Y198.171 E.01222
G1 X158.857 Y165.885 E1.4682
G1 X158.857 Y165.057 E.02662
G1 X191.143 Y156.407 E1.0748
G1 X191.143 Y154.778 E.05236
; WIPE_START
G1 X191.143 Y156.407 E-.61876
G1 X190.784 Y156.503 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.4 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 5 start: 58,95
M624 AwAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z1.4 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer5 end: 58,95
M625
G1 X160.84 Y278.958
G1 Z1
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X160.340 Y279.458  
M204 S8000
G3  X158.409 Y277.136   I3.871 J-5.183 E0.1159 F3938
G3  X159.585 Y274.543   I2.902 J-0.247 E0.1130
G2  X160.340 Y272.139   I-3.465 J-2.409 E0.0972
G2  X160.337 Y259.106   I-321.195 J-6.431 E0.4954
G2  X158.491 Y255.528   I-6.663 J1.171 E0.1554
G3  X159.006 Y253.365   I1.721 J-0.733 E0.0905
G1 E-0.8000 F1800
M204 S10000
G1  X160.726 Y251.551   F600
G1 E0.8000 F1800
M204 S8000
G3  X163.583 Y249.927   I2.765 J1.539 E0.1313 F3938
G3  X166.120 Y251.527   I-12.405 J22.473 E0.1141
G2  X168.153 Y251.958   I2.042 J-4.626 E0.0796
G2  X181.717 Y251.954   I6.687 J-357.435 E0.5155
G2  X185.652 Y250.077   I-0.499 J-6.110 E0.1694
G3  X187.964 Y250.507   I0.854 J1.838 E0.0953
G1  X189.340 Y251.958   E0.0760
G1 E0.0000
G3  X191.271 Y254.280   I-3.871 J5.182 E0.1159
G3  X190.095 Y256.873   I-2.902 J0.247 E0.1130
G2  X189.340 Y259.276   I3.464 J2.409 E0.0972
G2  X189.343 Y272.310   I321.212 J6.432 E0.4954
G2  X191.189 Y275.888   I6.663 J-1.171 E0.1554
G3  X190.849 Y277.866   I-1.658 J0.734 E0.0808
G1  X189.340 Y279.458   E0.0834
G3  X186.878 Y281.499   I-4.373 J-2.768 E0.1236
G3  X184.230 Y280.249   I0.012 J-3.454 E0.1149
G2  X181.527 Y279.458   I-2.709 J4.247 E0.1085
G2  X167.963 Y279.462   I-6.687 J357.435 E0.5155
G2  X164.028 Y281.339   I0.499 J6.110 E0.1694
G3  X161.716 Y280.909   I-0.854 J-1.838 E0.0953
G1  X160.340 Y279.458   E0.0760
; WIPE_TOWER_END
G1  X160.840 Y251.958  
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S8000
G1  Y272.208  E0.2565
G1  X188.840  E1.0642
G1  Y278.958  E0.2565
G1  X160.840  E1.0642
M204 S10000
G1  X161.840 Y272.208  
;--------------------
; CP EMPTY GRID START
; layer #6
M204 S8000
G1  Y278.958  E0.2565
M204 S10000
G1  X170.507 
M204 S8000
G1  Y272.208  E0.2565
M204 S10000
G1  X179.173 
M204 S8000
G1  Y278.958  E0.2565
M204 S10000
G1  X187.840 
M204 S8000
G1  Y272.208  E0.2565
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #5
; material : TPU -> TPU
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-.8 F1800
G17
G3 Z1.4 I1.217 J0 P1  F60000
G1 X161.09 Y266.208
G1 Z1
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF0 NF1
M204 S8000
G1  X188.590 Y266.208  E2.1885 F1881
G1  Y267.458  E0.0995
G1  X161.090  E2.1885
G1  Y268.708  E0.0995
G1  X188.590  E2.1885
G1  Y269.958  E0.0995
G1  X161.090  E2.1885
G1  Y271.208  E0.0995
G1  X188.590  E2.1885
; NOZZLE_CHANGE_END OF0 NF1
M104 T1 S159 N0 ;Multi extruder pre cooling

; WIPE_START
G1 F5400
M204 S8000
G1 X186.59 Y271.208 E-1.9
; WIPE_END
G1 E-.1 F1800
M204 S10000
G17
M73 P36 R38
G3 Z1.4 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20250604 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S0 ; disable E air printing detect


M620 S1A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z4 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F149.669 L0 H0.4 T270 P255 S1



M620.10 A1 F79.8237 L0 H0.4 T250 P240 S1



M620.11 P0 I0 E0



M620.11 K1 I0 R10 F200


M628 S1


M620.11 S1 L0 I0 R10 D8 E-10 F200


M629


M620.11 H2 C331


T1
M73 E1

;deretract



; VFLUSH_START


;VG1 E0 F79


SYNC T0

; VFLUSH_END

M1002 set_filament_type:TPU

M400
M83



M628 S0
;VM109 S240
M629
M400

M983.3 F1.33333 A0.4


M400

G1 Y320 F30000
G1 X194.344

G1 Y295
G1 Y265 F18000
G1 Z4 F3000

M204 S8000


M621 S1A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S1;enable tpu clog detect



M1015.4 S0 ; disable E air printing detect


M620.6 I1 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S255
M106 P2 S255
G1 X193.344 Y264.67 F60000
G1 Z1
G1 X193.344 Y257.038 Z1.4
G1 X193.344 Y247.883 Z1.4
G1 X156.335 Y247.883
G1 X156.335 Y252.458
G1 X160.84 Y252.458

; filament start gcode
G1 Z1
G1 E2 F1800

G4 S0
; CP TOOLCHANGE WIPE
; LINE_WIDTH: 0.500000
M204 S8000
G1  X163.840 Y252.458  E0.1140 F1782
G1 E-0.8000 F1800
M204 S10000
G1  X159.340  F600
G1  X160.840  F240
G1  X161.340  F600
G1  Y252.958 
G1  X160.340 
G1  Y251.958 
G1  X161.840 
G1  Y253.458 
G1  X159.840 
G1  Y251.458 
G1  X163.840 Y252.458   F1782
G1 E0.8000 F1800
M204 S8000
G1  X188.840  E0.9502 F1782
G1  Y253.208  E0.0285
G1  X160.840  E1.0642 F2025
G1  Y253.958  E0.0285
G1  X188.840  E1.0642 F2100
G1  Y254.708  E0.0285
G1  X160.840  E1.0642
G1  Y255.458  E0.0285
M73 P36 R37
G1  X188.840  E1.0642
G1  Y256.208  E0.0285
G1  X160.840  E1.0642
G1  Y256.958  E0.0285
G1  X188.840  E1.0642
G1  Y257.708  E0.0285
G1  X160.840  E1.0642
G1  Y258.458  E0.0285
G1  X188.840  E1.0642
G1  Y259.208  E0.0285
G1  X160.840  E1.0642
G1  Y259.958  E0.0285
G1  X188.840  E1.0642
G1  Y260.708  E0.0285
G1  X160.840  E1.0642
G1  Y261.458  E0.0285
G1  X188.840  E1.0642
G1  Y262.208  E0.0285
G1  X160.840  E1.0642
G1  Y262.958  E0.0285
G1  X188.840  E1.0642
G1  Y263.708  E0.0285
G1  X160.840  E1.0642
G1  Y264.458  E0.0285
G1  X188.840  E1.0642
G1  Y265.208  E0.0285
G1  X160.840  E1.0642
; WIPE_TOWER_END
M220 R
G1 F60000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F5400
M204 S8000
G1 X162.84 Y265.208 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.4 I1.217 J0 P1  F60000
; OBJECT_ID: 95
; COOLING_NODE: 0
; start printing object, unique label id: 95
M624 AgAAAAAAAAA=
G1 X193.008 Y107.704
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F2545.881
M204 S5000
G1 X158.428 Y107.704 E1.08423
G1 X158.428 Y107.124 E.01819
G1 X193.008 Y107.124 E1.08423
G1 X193.008 Y107.644 E.0163
M204 S10000
G1 X192.812 Y107.414 F60000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23088
G1 F5107.47
M204 S8000
G1 X158.624 Y107.414 E.53432
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5107.47
G1 X160.624 Y107.414 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 95
M625
;======== H2D 20250521========
; layer num/total_layer_count: 6/75
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change


; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #6
; material : PCTG -> PCTG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
M204 S10000
G17
G3 Z1.4 I1.217 J0 P1  F60000
G1 X160.758 Y149.303
G1 X161.09 Y252.708
G1 Z1.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF1 NF0
M104 T0 S210 N0 ;Multi extruder pre cooling in post extrusion
M204 S8000
G1  X188.590 Y252.708  E2.1885 F251
G1  Y254.208  E0.1194
G1  X161.090  E2.1885
G1  Y255.708  E0.1194
G1  X188.590  E2.1885
G1  Y257.208  E0.1194
M104 T1 S255 N0 ;Multi extruder pre heating
M73 P37 R37
G1  X161.090  E2.1885
G1  Y258.708  E0.1194
G1  X188.590  E2.1885
M204 S10000
G1  Y259.708 
G1  X161.590  F398
G1  Y258.208 
G1  X188.090 
G1  Y256.708 
G1  X161.590 
G1  Y255.208 
G1  X188.090 
G1  Y253.708 
M73 P38 R36
G1  X161.590 
; NOZZLE_CHANGE_END OF1 NF0
M104 T0 S0 N0 ;Multi extruder pre cooling

G1 E-2 F1800
G17
G3 Z1.6 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20250604 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S0 ; disable E air printing detect


M620 S0A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z4.2 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F79.8237 L0 H0.4 T250 P240 S1



M620.10 A1 F149.669 L0 H0.4 T270 P255 S1



M620.11 P0 I1 E0



M620.11 K1 I1 R0 F200


M628 S1

M620.11 S0 L0 I1 E-10 F200

M629


M620.11 H2 C331


T0
M73 E0

;deretract


;VG1 E4 F200
;VG1 E4 F100



; VFLUSH_START


;VG1 E0 F79


SYNC T0

; VFLUSH_END

M1002 set_filament_type:PCTG

M400
M83



M628 S0
;VM109 S255
M629
M400

M983.3 F2.5 A0.4


M400

G1 Y320 F30000
G1 X194.344

G1 Y295
G1 Y265 F18000
G1 Z4.2 F3000

M204 S8000


M621 S0A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S0;disable tpu clog detect



M1015.4 S0 ; disable E air printing detect


M620.6 I0 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S25.5
M106 P2 S0
G1 X193.344 Y278.708 F60000
G1 Z1.2
G1 X188.84 Y278.708 Z1.6

; filament start gcode
G1 Z1.2
G1 E2 F1800

G4 S0
; CP TOOLCHANGE WIPE
; LINE_WIDTH: 0.500000
M204 S8000
G1  X185.840 Y278.708  E0.1140 F1782
G1 E-0.8000 F1800
M204 S10000
G1  X190.340  F600
G1  X188.840  F240
G1  X189.340  F600
G1  Y279.208 
G1  X188.340 
G1  Y278.208 
G1  X189.840 
G1  Y279.708 
G1  X187.840 
G1  Y277.708 
G1  X185.840 Y278.708   F1782
G1 E0.8000 F1800
M204 S8000
G1  X160.840  E0.9502 F1782
G1  Y277.958  E0.0285
G1  X188.840  E1.0642 F2025
G1  Y277.208  E0.0285
G1  X160.840  E1.0642 F2473
G1  Y276.458  E0.0285
G1  X188.840  E1.0642 F3938
G1  Y275.708  E0.0285
G1  X160.840  E1.0642
G1  Y274.958  E0.0285
G1  X188.840  E1.0642
G1  Y274.208  E0.0285
G1  X160.840  E1.0642
G1  Y273.458  E0.0285
G1  X188.840  E1.0642
G1  Y272.708  E0.0285
G1  X160.840  E1.0642
G1  Y271.958  E0.0285
G1  X188.840  E1.0642
G1  Y271.208  E0.0285
G1  X160.840  E1.0642
G1  Y270.458  E0.0285
G1  X188.840  E1.0642
G1  Y269.708  E0.0285
G1  X160.840  E1.0642
G1  Y268.958  E0.0285
G1  X188.840  E1.0642
G1  Y268.208  E0.0285
G1  X160.840  E1.0642
G1  Y267.458  E0.0285
G1  X188.840  E1.0642
G1  Y266.708  E0.0285
G1  X160.840  E1.0642
G1  Y265.958  E0.0285
G1  X188.840  E1.0642
; WIPE_TOWER_END
M220 R
G1 F60000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y251.958  
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X189.191 Y279.615  
M204 S8000
G3  X186.409 Y281.530   I-3.469 J-2.060 E0.1325 F3938
G3  X184.068 Y280.149   I1.448 J-5.129 E0.1045
G2  X181.527 Y279.458   I-2.568 J4.426 E0.1012
G2  X167.963 Y279.462   I-6.687 J357.435 E0.5155
G2  X164.028 Y281.339   I0.499 J6.110 E0.1694
G3  X161.716 Y280.909   I-0.854 J-1.838 E0.0953
G1  X160.340 Y279.458   E0.0760
G3  X158.409 Y277.136   I3.871 J-5.183 E0.1159
G3  X159.585 Y274.543   I2.902 J-0.247 E0.1130
G2  X160.340 Y272.139   I-3.465 J-2.409 E0.0972
G2  X160.337 Y259.106   I-321.195 J-6.431 E0.4954
G2  X158.491 Y255.528   I-6.663 J1.171 E0.1554
G3  X158.830 Y253.550   I1.658 J-0.734 E0.0808
G1  X161.716 Y250.507   E0.1594
G3  X165.138 Y250.950   I1.525 J1.652 E0.1495
G2  X168.153 Y251.958   I3.021 J-4.025 E0.1229
G2  X181.717 Y251.954   I6.687 J-357.435 E0.5155
G2  X185.652 Y250.077   I-0.499 J-6.110 E0.1694
G3  X187.964 Y250.507   I0.854 J1.838 E0.0953
G1  X189.340 Y251.958   E0.0760
G3  X191.271 Y254.280   I-3.871 J5.182 E0.1159
G3  X190.095 Y256.873   I-2.902 J0.247 E0.1130
G2  X189.340 Y259.276   I3.464 J2.409 E0.0972
G2  X189.343 Y272.310   I321.212 J6.432 E0.4954
G2  X191.189 Y275.888   I6.663 J-1.171 E0.1554
G3  X190.909 Y277.799   I-1.654 J0.733 E0.0774
; WIPE_TOWER_END

; WIPE_START
G1 F5107.47
M204 S8000
G1 X190.943 Y277.759 E-.01975
G1 X191.027 Y277.646 E-.0539
G1 X191.103 Y277.526 E-.05389
G1 X191.169 Y277.4 E-.0539
G1 X191.225 Y277.27 E-.0539
G1 X191.271 Y277.135 E-.05389
G1 X191.305 Y276.998 E-.0539
G1 X191.329 Y276.858 E-.05389
G1 X191.342 Y276.717 E-.05389
G1 X191.344 Y276.575 E-.0539
G1 X191.335 Y276.434 E-.05389
G1 X191.314 Y276.293 E-.05389
G1 X191.283 Y276.155 E-.0539
G1 X191.241 Y276.019 E-.05389
G1 X191.202 Y275.923 E-.03963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.6 I1.217 J0 P1  F60000
; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
M73 P39 R36
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X190.012 Y201.143 Z1.6 F60000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X188.384 Y201.143 E.05236
G1 X191.143 Y190.847 E.34276
G1 X191.143 Y190.268 E.0186
G1 X158.857 Y198.919 E1.0748
G1 X158.857 Y200.227 E.04206
G1 X159.773 Y201.143 E.04163
G1 X163.097 Y201.143 E.10691
G1 X185.146 Y118.857 E2.73933
G1 X181.113 Y118.857 E.12967
G1 X191.143 Y128.887 E.4561
M204 S10000
G1 X191.143 Y132.895 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y131.267 E.05236
G1 X158.857 Y139.917 E1.0748
G1 X158.857 Y142.657 E.08811
G1 X191.143 Y174.943 E1.4682
G1 X191.143 Y173.411 E.04926
G1 X158.857 Y182.061 E1.0748
G1 X158.857 Y180.433 E.05236
M204 S10000
G1 X158.857 Y187.138 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y185.51 E.05236
G1 X176.717 Y118.857 E2.21891
G1 X174.541 Y118.857 E.06996
G1 X158.857 Y123.06 E.52213
G1 X158.857 Y122.597 E.0149
G1 X159.859 Y118.857 E.12448
G1 X158.857 Y118.857 E.03222
G1 X158.857 Y119.63 E.02483
G1 X191.143 Y151.915 E1.4682
G1 X191.143 Y148.124 E.12189
G1 X158.857 Y156.775 E1.0748
G1 X158.857 Y158.403 E.05236
M204 S10000
G1 X158.857 Y146.718 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y148.346 E.05236
G1 X191.143 Y139.695 E1.0748
G1 X191.143 Y140.401 E.02268
G1 X169.599 Y118.857 E.97971
G1 X168.288 Y118.857 E.04216
G1 X158.857 Y154.053 E1.1717
G1 X158.857 Y154.171 E.0038
G1 X191.143 Y186.457 E1.4682
G1 X191.143 Y181.839 E.14847
G1 X158.857 Y190.49 E1.0748
G1 X158.857 Y188.713 E.05714
G1 X171.287 Y201.143 E.56524
G1 X171.526 Y201.143 E.0077
G1 X191.143 Y127.933 E2.43719
G1 X191.143 Y122.838 E.16385
G1 X158.857 Y131.489 E1.0748
G1 X158.857 Y131.143 E.0111
G1 X191.143 Y163.429 E1.4682
G1 X191.143 Y164.982 E.04994
G1 X158.857 Y173.633 E1.0748
G1 X158.857 Y177.199 E.11469
G1 X182.801 Y201.143 E1.08885
M204 S10000
G1 X191.143 Y157.762 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y159.39 E.05236
G1 X179.955 Y201.143 E1.38998
G1 X182.016 Y201.143 E.06626
G1 X191.143 Y198.697 E.30385
G1 X191.143 Y197.971 E.02336
G1 X158.857 Y165.685 E1.4682
G1 X158.857 Y165.204 E.01548
G1 X191.143 Y156.553 E1.0748
G1 X191.143 Y154.925 E.05236
; WIPE_START
G1 X191.143 Y156.553 E-.61876
G1 X190.784 Y156.649 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.6 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 6 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z1.6 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer6 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 7/75
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change


M106 S51
; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
M73 P39 R35
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X189.866 Y201.143 Z1.8 F60000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X188.237 Y201.143 E.05236
G1 X191.143 Y190.3 E.36095
G1 X191.143 Y190.415 E.00368
G1 X158.857 Y199.065 E1.0748
G1 X158.857 Y200.027 E.03092
G1 X159.973 Y201.143 E.05073
G1 X162.951 Y201.143 E.09577
G1 X184.999 Y118.857 E2.73933
G1 X181.313 Y118.857 E.11853
G1 X191.143 Y128.687 E.447
G1 X191.143 Y131.413 E.08767
M73 P40 R35
G1 X158.857 Y140.064 E1.0748
G1 X158.857 Y142.457 E.07697
G1 X191.143 Y174.743 E1.4682
G1 X191.143 Y173.557 E.03812
G1 X158.857 Y182.208 E1.0748
G1 X158.857 Y180.58 E.05236
M204 S10000
G1 X158.857 Y186.592 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y184.964 E.05236
G1 X176.57 Y118.857 E2.20072
G1 X175.088 Y118.857 E.04768
G1 X158.857 Y123.206 E.54032
G1 X158.857 Y122.05 E.03718
G1 X159.713 Y118.857 E.10629
G1 X158.857 Y118.857 E.02751
G1 X158.857 Y119.43 E.0184
G1 X191.143 Y151.715 E1.4682
G1 X191.143 Y148.271 E.11075
G1 X158.857 Y156.921 E1.0748
G1 X158.857 Y158.55 E.05236
M204 S10000
G1 X158.857 Y146.864 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y148.493 E.05236
G1 X191.143 Y139.842 E1.0748
G1 X191.143 Y140.201 E.01154
G1 X169.799 Y118.857 E.97061
G1 X168.142 Y118.857 E.0533
G1 X158.857 Y153.507 E1.1535
G1 X158.857 Y153.971 E.01494
G1 X191.143 Y186.257 E1.4682
G1 X191.143 Y181.986 E.13733
G1 X158.857 Y190.637 E1.0748
G1 X158.857 Y188.513 E.06828
G1 X171.487 Y201.143 E.57434
G1 X171.38 Y201.143 E.00344
G1 X191.143 Y127.387 E2.45538
G1 X191.143 Y122.984 E.14157
G1 X158.857 Y131.635 E1.0748
G1 X158.857 Y130.943 E.02224
G1 X191.143 Y163.229 E1.4682
G1 X191.143 Y165.128 E.06108
G1 X158.857 Y173.779 E1.0748
G1 X158.857 Y176.999 E.10355
G1 X183.001 Y201.143 E1.09794
M204 S10000
G1 X180.934 Y201.143 F60000
G1 F4421.739
M204 S8000
G1 X182.562 Y201.143 E.05236
G1 X191.143 Y198.843 E.28566
G1 X191.143 Y197.771 E.0345
G1 X158.857 Y165.485 E1.4682
G1 X158.857 Y165.35 E.00434
G1 X191.143 Y156.699 E1.0748
G1 X191.143 Y158.843 E.06894
G1 X179.809 Y201.143 E1.40817
G1 X178.18 Y201.143 E.05236
; WIPE_START
G1 X179.809 Y201.143 E-.61876
G1 X179.905 Y200.784 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.8 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 7 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z1.8 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer7 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 8/75
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X189.719 Y201.143 Z2 F60000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X188.091 Y201.143 E.05236
G1 X191.143 Y189.754 E.37914
G1 X191.143 Y186.057 E.11889
G1 X158.857 Y153.771 E1.4682
G1 X158.857 Y152.96 E.02608
G1 X167.995 Y118.857 E1.13531
G1 X169.999 Y118.857 E.06444
G1 X191.143 Y140.001 E.96152
G1 X191.143 Y139.988 E.0004
G1 X158.857 Y148.639 E1.0748
G1 X158.857 Y147.011 E.05236
M204 S10000
G1 X158.857 Y158.696 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y157.068 E.05236
G1 X191.143 Y148.417 E1.0748
G1 X191.143 Y151.515 E.09961
G1 X158.857 Y119.229 E1.4682
G1 X158.857 Y118.857 E.01197
G1 X159.566 Y118.857 E.0228
G1 X158.857 Y121.504 E.0881
G1 X158.857 Y123.353 E.05946
G1 X175.634 Y118.857 E.55851
G1 X176.424 Y118.857 E.0254
G1 X158.857 Y184.417 E2.18253
G1 X158.857 Y186.045 E.05236
M204 S10000
G1 X158.857 Y180.726 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y182.354 E.05236
G1 X191.143 Y173.703 E1.0748
G1 X191.143 Y174.543 E.02698
G1 X158.857 Y142.257 E1.4682
G1 X158.857 Y140.21 E.06583
G1 X191.143 Y131.559 E1.0748
G1 X191.143 Y128.487 E.09881
G1 X181.513 Y118.857 E.43791
G1 X184.853 Y118.857 E.10739
G1 X162.805 Y201.143 E2.73933
G1 X160.173 Y201.143 E.08463
G1 X158.857 Y199.827 E.05982
G1 X158.857 Y199.212 E.01978
G1 X191.143 Y190.561 E1.0748
M204 S10000
G1 X191.143 Y180.504 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y182.132 E.05236
G1 X158.857 Y190.783 E1.0748
G1 X158.857 Y188.313 E.07942
G1 X171.687 Y201.143 E.58343
G1 X171.233 Y201.143 E.01458
G1 X191.143 Y126.84 E2.47358
G1 X191.143 Y123.131 E.11929
G1 X158.857 Y131.781 E1.0748
G1 X158.857 Y130.743 E.03338
G1 X191.143 Y163.029 E1.4682
G1 X191.143 Y165.275 E.07222
G1 X158.857 Y173.925 E1.0748
G1 X158.857 Y176.799 E.09241
G1 X183.201 Y201.143 E1.10704
G1 X183.108 Y201.143 E.00297
G1 X191.143 Y198.99 E.26746
G1 X191.143 Y197.571 E.04564
G1 X158.857 Y165.285 E1.4682
G1 X158.857 Y165.497 E.0068
G1 X191.143 Y156.846 E1.0748
G1 X191.143 Y158.297 E.04666
M73 P41 R35
G1 X179.662 Y201.143 E1.42636
G1 X178.034 Y201.143 E.05236
; WIPE_START
G1 X179.662 Y201.143 E-.61876
G1 X179.758 Y200.784 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 8 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z2 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer8 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 9/75
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X189.573 Y201.143 Z2.2 F60000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X187.945 Y201.143 E.05236
G1 X191.143 Y189.207 E.39733
G1 X191.143 Y185.857 E.10775
G1 X158.857 Y153.571 E1.4682
G1 X158.857 Y152.414 E.03722
G1 X167.849 Y118.857 E1.11712
G1 X170.199 Y118.857 E.07558
G1 X191.143 Y139.801 E.95242
G1 X191.143 Y140.135 E.01074
G1 X158.857 Y148.785 E1.0748
G1 X158.857 Y147.157 E.05236
M204 S10000
M73 P41 R34
G1 X158.857 Y158.843 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y157.214 E.05236
G1 X191.143 Y148.563 E1.0748
G1 X191.143 Y151.315 E.08847
G1 X158.857 Y119.029 E1.4682
G1 X158.857 Y118.857 E.00553
G1 X159.42 Y118.857 E.01809
G1 X158.857 Y120.957 E.06991
G1 X158.857 Y123.499 E.08174
G1 X176.181 Y118.857 E.5767
G1 X176.278 Y118.857 E.00312
G1 X158.857 Y183.871 E2.16434
G1 X158.857 Y185.499 E.05236
M204 S10000
G1 X158.857 Y180.872 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y182.501 E.05236
G1 X191.143 Y173.85 E1.0748
G1 X191.143 Y174.343 E.01584
G1 X158.857 Y142.057 E1.4682
G1 X158.857 Y140.357 E.05469
G1 X191.143 Y131.706 E1.0748
G1 X191.143 Y128.287 E.10995
G1 X181.713 Y118.857 E.42881
G1 X184.706 Y118.857 E.09625
G1 X162.658 Y201.143 E2.73933
G1 X160.373 Y201.143 E.07349
G1 X158.857 Y199.627 E.06892
G1 X158.857 Y199.358 E.00865
G1 X191.143 Y190.707 E1.0748
G1 X191.143 Y192.336 E.05236
M204 S10000
G1 X191.143 Y180.65 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y182.279 E.05236
G1 X158.857 Y190.929 E1.0748
G1 X158.857 Y188.113 E.09056
G1 X171.887 Y201.143 E.59253
G1 X171.087 Y201.143 E.02572
G1 X191.143 Y126.294 E2.49177
G1 X191.143 Y123.277 E.09701
G1 X158.857 Y131.928 E1.0748
G1 X158.857 Y130.543 E.04452
G1 X191.143 Y162.829 E1.4682
G1 X191.143 Y165.421 E.08336
G1 X158.857 Y174.072 E1.0748
G1 X158.857 Y176.599 E.08127
G1 X183.401 Y201.143 E1.11613
G1 X183.655 Y201.143 E.00817
G1 X191.143 Y199.136 E.24927
G1 X191.143 Y197.371 E.05678
G1 X158.857 Y165.085 E1.4682
G1 X158.857 Y165.643 E.01794
G1 X191.143 Y156.992 E1.0748
G1 X191.143 Y157.751 E.02439
G1 X179.516 Y201.143 E1.44455
G1 X177.887 Y201.143 E.05236
; WIPE_START
G1 X179.516 Y201.143 E-.61876
G1 X179.612 Y200.784 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.2 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 9 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z2.2 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer9 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 10/75
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X189.426 Y201.143 Z2.4 F60000
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X187.798 Y201.143 E.05236
G1 X191.143 Y188.661 E.41552
G1 X191.143 Y185.657 E.09661
G1 X158.857 Y153.371 E1.4682
G1 X158.857 Y151.868 E.04836
M73 P42 R34
G1 X167.702 Y118.857 E1.09893
G1 X170.399 Y118.857 E.08672
G1 X191.143 Y139.601 E.94333
G1 X191.143 Y140.281 E.02188
G1 X158.857 Y148.932 E1.0748
G1 X158.857 Y147.304 E.05236
M204 S10000
G1 X158.857 Y158.989 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y157.361 E.05236
G1 X191.143 Y148.71 E1.0748
G1 X191.143 Y151.115 E.07733
G1 X158.885 Y118.857 E1.46693
G1 X159.274 Y118.857 E.01249
G1 X158.857 Y120.411 E.05172
G1 X158.857 Y123.646 E.10401
G1 X176.727 Y118.857 E.59489
G1 X178.355 Y118.857 E.05236
M204 S10000
G1 X176.131 Y118.857 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y183.324 E2.14615
G1 X158.857 Y184.953 E.05236
M204 S10000
G1 X158.857 Y182.647 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y173.996 E1.0748
G1 X191.143 Y174.143 E.00471
G1 X158.857 Y141.857 E1.4682
G1 X158.857 Y140.503 E.04355
G1 X191.143 Y131.852 E1.0748
G1 X191.143 Y128.087 E.12108
G1 X181.913 Y118.857 E.41972
G1 X184.56 Y118.857 E.08511
G1 X162.512 Y201.143 E2.73933
G1 X160.573 Y201.143 E.06235
G1 X158.857 Y199.427 E.07801
G1 X158.857 Y199.505 E.00249
G1 X191.143 Y190.854 E1.0748
G1 X191.143 Y192.482 E.05236
M204 S10000
G1 X191.143 Y180.797 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y182.425 E.05236
G1 X158.857 Y191.076 E1.0748
G1 X158.857 Y187.913 E.1017
G1 X172.087 Y201.143 E.60162
G1 X170.941 Y201.143 E.03686
G1 X191.143 Y125.748 E2.50996
G1 X191.143 Y123.424 E.07473
G1 X158.857 Y132.074 E1.0748
G1 X158.857 Y130.343 E.05566
G1 X191.143 Y162.629 E1.4682
G1 X191.143 Y165.567 E.0945
G1 X158.857 Y174.218 E1.0748
G1 X158.857 Y176.399 E.07013
G1 X183.601 Y201.143 E1.12523
G1 X184.201 Y201.143 E.01931
G1 X191.143 Y199.283 E.23108
G1 X191.143 Y197.171 E.06792
G1 X158.857 Y164.885 E1.4682
G1 X158.857 Y165.789 E.02908
G1 X191.143 Y157.139 E1.0748
G1 X191.143 Y157.204 E.00211
G1 X179.369 Y201.143 E1.46274
G1 X177.741 Y201.143 E.05236
; WIPE_START
G1 X179.369 Y201.143 E-.61876
G1 X179.466 Y200.784 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.4 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 10 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z2.4 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer10 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 11/75
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X189.28 Y201.143 Z2.6 F60000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X187.652 Y201.143 E.05236
G1 X191.143 Y188.115 E.43371
G1 X191.143 Y185.457 E.08547
G1 X158.857 Y153.171 E1.4682
G1 X158.857 Y151.321 E.05949
G1 X167.556 Y118.857 E1.08074
G1 X170.599 Y118.857 E.09786
G1 X191.143 Y139.401 E.93423
G1 X191.143 Y140.428 E.03302
G1 X158.857 Y149.078 E1.0748
G1 X158.857 Y147.45 E.05236
M204 S10000
G1 X158.857 Y159.135 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y157.507 E.05236
G1 X191.143 Y148.856 E1.0748
G1 X191.143 Y150.915 E.06619
G1 X159.085 Y118.857 E1.45784
G1 X159.127 Y118.857 E.00135
G1 X158.857 Y119.865 E.03353
G1 X158.857 Y123.792 E.12629
G1 X177.273 Y118.857 E.61308
G1 X178.902 Y118.857 E.05236
M204 S10000
G1 X174.357 Y118.857 F60000
G1 F4421.739
M204 S8000
G1 X175.985 Y118.857 E.05236
G1 X158.857 Y182.793 E2.12844
G1 X191.143 Y174.143 E1.0748
G1 X191.143 Y173.943 E.00643
G1 X158.857 Y141.657 E1.4682
G1 X158.857 Y140.65 E.03241
G1 X191.143 Y131.999 E1.0748
G1 X191.143 Y127.887 E.13222
G1 X182.113 Y118.857 E.41062
G1 X184.414 Y118.857 E.07397
G1 X162.365 Y201.143 E2.73933
G1 X160.773 Y201.143 E.05121
G1 X158.857 Y199.227 E.08711
G1 X158.857 Y199.651 E.01363
G1 X191.143 Y191 E1.0748
G1 X191.143 Y192.629 E.05236
M204 S10000
G1 X191.143 Y180.943 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y182.571 E.05236
G1 X158.857 Y191.222 E1.0748
G1 X158.857 Y187.713 E.11284
G1 X172.287 Y201.143 E.61072
G1 X170.794 Y201.143 E.048
G1 X191.143 Y125.201 E2.52815
G1 X191.143 Y123.57 E.05245
G1 X158.857 Y132.221 E1.0748
G1 X158.857 Y130.143 E.0668
G1 X191.143 Y162.429 E1.4682
G1 X191.143 Y165.714 E.10564
G1 X158.857 Y174.365 E1.0748
G1 X158.857 Y176.199 E.05899
M73 P43 R34
G1 X183.801 Y201.143 E1.13432
G1 X184.748 Y201.143 E.03045
G1 X191.143 Y199.429 E.21289
G1 X191.143 Y196.971 E.07906
G1 X158.857 Y164.685 E1.4682
G1 X158.857 Y165.936 E.04022
G1 X191.143 Y157.285 E1.0748
M204 S10000
G1 X191.143 Y155.03 F60000
M73 P43 R33
G1 F4421.739
M204 S8000
G1 X191.143 Y156.658 E.05236
G1 X179.223 Y201.143 E1.48093
G1 X177.595 Y201.143 E.05236
; WIPE_START
G1 X179.223 Y201.143 E-.61876
G1 X179.319 Y200.784 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 11 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z2.6 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer11 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 12/75
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X189.134 Y201.143 Z2.8 F60000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X187.505 Y201.143 E.05236
G1 X191.143 Y187.568 E.4519
G1 X191.143 Y185.257 E.07433
G1 X158.857 Y152.971 E1.4682
G1 X158.857 Y150.775 E.07063
G1 X167.41 Y118.857 E1.06255
G1 X170.799 Y118.857 E.109
G1 X191.143 Y139.201 E.92514
G1 X191.143 Y140.574 E.04416
G1 X158.857 Y149.225 E1.0748
G1 X158.857 Y147.596 E.05236
M204 S10000
G1 X158.857 Y159.282 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y157.654 E.05236
G1 X191.143 Y149.003 E1.0748
G1 X191.143 Y150.715 E.05505
G1 X159.285 Y118.857 E1.44874
G1 X158.857 Y118.857 E.01376
G1 X158.857 Y123.938 E.16339
G1 X177.82 Y118.857 E.63127
G1 X179.448 Y118.857 E.05236
M204 S10000
G1 X174.21 Y118.857 F60000
G1 F4421.739
M204 S8000
G1 X175.838 Y118.857 E.05236
G1 X158.857 Y182.231 E2.10977
G1 X158.857 Y182.94 E.02278
G1 X191.143 Y174.289 E1.0748
G1 X191.143 Y173.743 E.01757
G1 X158.857 Y141.457 E1.4682
G1 X158.857 Y140.796 E.02127
G1 X191.143 Y132.145 E1.0748
G1 X191.143 Y127.687 E.14336
G1 X182.313 Y118.857 E.40153
G1 X184.267 Y118.857 E.06283
G1 X162.219 Y201.143 E2.73933
G1 X160.973 Y201.143 E.04007
G1 X158.857 Y199.027 E.0962
G1 X158.857 Y199.797 E.02477
G1 X191.143 Y191.147 E1.0748
G1 X191.143 Y192.775 E.05236
M204 S10000
G1 X191.143 Y181.09 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y182.718 E.05236
G1 X158.857 Y191.369 E1.0748
G1 X158.857 Y187.513 E.12398
G1 X172.487 Y201.143 E.61981
G1 X170.648 Y201.143 E.05914
G1 X191.143 Y124.655 E2.54634
G1 X191.143 Y123.716 E.03018
G1 X158.857 Y132.367 E1.0748
G1 X158.857 Y129.943 E.07794
G1 X191.143 Y162.229 E1.4682
G1 X191.143 Y165.86 E.11678
G1 X158.857 Y174.511 E1.0748
G1 X158.857 Y175.999 E.04785
G1 X184.001 Y201.143 E1.14342
G1 X185.294 Y201.143 E.04159
G1 X191.143 Y199.575 E.1947
G1 X191.143 Y196.771 E.0902
G1 X158.857 Y164.485 E1.4682
G1 X158.857 Y166.082 E.05135
G1 X191.143 Y157.432 E1.0748
G1 X191.143 Y159.06 E.05236
M204 S10000
G1 X191.143 Y154.483 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y156.111 E.05236
G1 X179.077 Y201.143 E1.49912
G1 X177.448 Y201.143 E.05236
; WIPE_START
G1 X179.077 Y201.143 E-.61876
G1 X179.173 Y200.784 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 12 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z2.8 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer12 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 13/75
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
M73 P44 R33
G1 X188.987 Y201.143 Z3 F60000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X187.359 Y201.143 E.05236
G1 X191.143 Y187.022 E.47009
G1 X191.143 Y185.057 E.06319
G1 X158.857 Y152.771 E1.4682
G1 X158.857 Y150.228 E.08177
G1 X167.263 Y118.857 E1.04436
G1 X170.999 Y118.857 E.12014
G1 X191.143 Y139.001 E.91604
G1 X191.143 Y140.72 E.05529
G1 X158.857 Y149.371 E1.0748
M204 S10000
G1 X158.857 Y159.428 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y157.8 E.05236
G1 X191.143 Y149.149 E1.0748
G1 X191.143 Y150.515 E.04391
G1 X159.485 Y118.857 E1.43965
G1 X158.857 Y118.857 E.02019
G1 X158.857 Y124.085 E.16809
G1 X178.366 Y118.857 E.64946
G1 X179.994 Y118.857 E.05236
M204 S10000
G1 X174.064 Y118.857 F60000
G1 F4421.739
M204 S8000
G1 X175.692 Y118.857 E.05236
G1 X158.857 Y181.685 E2.09158
G1 X158.857 Y183.086 E.04506
G1 X191.143 Y174.436 E1.0748
G1 X191.143 Y173.543 E.02871
G1 X158.857 Y141.257 E1.4682
G1 X158.857 Y140.942 E.01013
G1 X191.143 Y132.292 E1.0748
G1 X191.143 Y127.487 E.1545
G1 X182.513 Y118.857 E.39243
G1 X184.121 Y118.857 E.0517
G1 X162.073 Y201.143 E2.73933
G1 X161.173 Y201.143 E.02893
G1 X158.857 Y198.827 E.1053
G1 X158.857 Y199.944 E.03591
G1 X191.143 Y191.293 E1.0748
G1 X191.143 Y192.921 E.05236
M204 S10000
G1 X191.143 Y181.236 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y182.864 E.05236
G1 X158.857 Y191.515 E1.0748
G1 X158.857 Y187.313 E.13512
G1 X172.687 Y201.143 E.62891
G1 X170.501 Y201.143 E.07028
G1 X191.143 Y124.108 E2.56453
G1 X191.143 Y123.863 E.0079
G1 X158.857 Y132.514 E1.0748
G1 X158.857 Y129.743 E.08908
G1 X191.143 Y162.029 E1.4682
G1 X191.143 Y166.007 E.12792
G1 X158.857 Y174.658 E1.0748
G1 X158.857 Y175.799 E.03671
G1 X184.201 Y201.143 E1.15251
G1 X185.84 Y201.143 E.05273
G1 X191.143 Y199.722 E.17651
G1 X191.143 Y196.571 E.10134
G1 X158.857 Y164.285 E1.4682
G1 X158.857 Y166.229 E.06249
G1 X191.143 Y157.578 E1.0748
G1 X191.143 Y159.206 E.05236
M204 S10000
G1 X191.143 Y153.937 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y155.565 E.05236
G1 X178.93 Y201.143 E1.51731
G1 X177.302 Y201.143 E.05236
; WIPE_START
G1 X178.93 Y201.143 E-.61876
G1 X179.026 Y200.784 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 13 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z3 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer13 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 14/75
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X187.213 Y201.143 Z3.2 F60000
G1 Z2.8
M73 P44 R32
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X191.143 Y186.475 E.48829
G1 X191.143 Y184.857 E.05205
G1 X158.857 Y152.571 E1.4682
G1 X158.857 Y157.946 E.17284
G1 X191.143 Y149.296 E1.0748
G1 X191.143 Y150.315 E.03277
G1 X159.685 Y118.857 E1.43055
G1 X158.857 Y118.857 E.02662
G1 X158.857 Y124.231 E.1728
G1 X178.913 Y118.857 E.66765
G1 X180.541 Y118.857 E.05236
M204 S10000
G1 X165.489 Y118.857 F60000
G1 F4421.739
M204 S8000
G1 X167.117 Y118.857 E.05236
G1 X158.857 Y149.682 E1.02617
G1 X158.857 Y149.518 E.00529
G1 X191.143 Y140.867 E1.0748
G1 X191.143 Y138.801 E.06643
G1 X171.199 Y118.857 E.90695
G1 X175.546 Y118.857 E.13976
G1 X158.857 Y181.139 E2.07339
G1 X158.857 Y183.233 E.06734
G1 X191.143 Y174.582 E1.0748
G1 X191.143 Y173.343 E.03985
G1 X158.857 Y141.057 E1.4682
G1 X158.857 Y141.089 E.00101
G1 X191.143 Y132.438 E1.0748
G1 X191.143 Y127.287 E.16564
G1 X182.713 Y118.857 E.38334
G1 X183.974 Y118.857 E.04056
G1 X161.926 Y201.143 E2.73933
G1 X161.373 Y201.143 E.01779
G1 X158.857 Y198.627 E.11439
G1 X158.857 Y200.09 E.04705
G1 X191.143 Y191.44 E1.0748
G1 X191.143 Y193.068 E.05236
M204 S10000
G1 X191.143 Y181.382 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y183.011 E.05236
G1 X158.857 Y191.662 E1.0748
G1 X158.857 Y187.113 E.14626
G1 X172.887 Y201.143 E.638
G1 X170.355 Y201.143 E.08142
G1 X191.143 Y123.562 E2.58272
G1 X191.143 Y121.934 E.05236
M204 S10000
M73 P45 R32
G1 X191.143 Y124.009 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y132.66 E1.0748
G1 X158.857 Y129.543 E.10022
G1 X191.143 Y161.829 E1.4682
G1 X191.143 Y157.724 E.13198
G1 X158.857 Y166.375 E1.0748
G1 X158.857 Y164.085 E.07363
G1 X191.143 Y196.371 E1.4682
G1 X191.143 Y199.868 E.11248
G1 X186.387 Y201.143 E.15832
G1 X184.401 Y201.143 E.06387
G1 X158.857 Y175.599 E1.16161
G1 X158.857 Y174.804 E.02557
G1 X191.143 Y166.153 E1.0748
G1 X191.143 Y167.781 E.05236
M204 S10000
G1 X191.143 Y153.39 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y155.019 E.05236
G1 X178.784 Y201.143 E1.5355
G1 X177.155 Y201.143 E.05236
; WIPE_START
G1 X178.784 Y201.143 E-.61876
G1 X178.88 Y200.784 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.2 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 14 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z3.2 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer14 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 15/75
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X191.326 Y194.659 Z3.4 F60000
G1 X191.143 Y193.214 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X191.143 Y191.586 E.05236
G1 X158.857 Y200.237 E1.0748
G1 X158.857 Y198.427 E.05819
G1 X161.573 Y201.143 E.12349
G1 X161.78 Y201.143 E.00665
G1 X183.828 Y118.857 E2.73933
G1 X182.913 Y118.857 E.02942
G1 X191.143 Y127.087 E.37424
G1 X191.143 Y132.584 E.17678
G1 X158.857 Y141.235 E1.0748
G1 X158.857 Y140.857 E.01215
G1 X191.143 Y173.143 E1.4682
G1 X191.143 Y174.728 E.05099
G1 X158.857 Y183.379 E1.0748
G1 X158.857 Y180.592 E.08962
G1 X175.399 Y118.857 E2.0552
G1 X171.399 Y118.857 E.12862
G1 X191.143 Y138.601 E.89785
G1 X191.143 Y141.013 E.07757
G1 X158.857 Y149.664 E1.0748
G1 X158.857 Y149.136 E.01699
G1 X166.97 Y118.857 E1.00798
G1 X165.342 Y118.857 E.05236
M204 S10000
G1 X181.087 Y118.857 F60000
G1 F4421.739
M204 S8000
G1 X179.459 Y118.857 E.05236
G1 X158.857 Y124.378 E.68584
G1 X158.857 Y118.857 E.17751
G1 X159.885 Y118.857 E.03305
G1 X191.143 Y150.115 E1.42146
G1 X191.143 Y149.442 E.02163
G1 X158.857 Y158.093 E1.0748
G1 X158.857 Y152.371 E.18398
G1 X191.143 Y184.657 E1.4682
G1 X191.143 Y185.929 E.04091
G1 X187.066 Y201.143 E.50648
G1 X186.933 Y201.143 E.00427
G1 X191.143 Y200.015 E.14013
G1 X191.143 Y196.171 E.12362
G1 X158.857 Y163.885 E1.4682
G1 X158.857 Y166.522 E.08477
G1 X191.143 Y157.871 E1.0748
G1 X191.143 Y161.629 E.12084
G1 X158.857 Y129.343 E1.4682
G1 X158.857 Y132.806 E.11136
G1 X191.143 Y124.156 E1.0748
M204 S10000
G1 X191.143 Y121.387 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y123.016 E.05236
G1 X170.209 Y201.143 E2.60091
G1 X173.087 Y201.143 E.09256
G1 X158.857 Y186.913 E.6471
G1 X158.857 Y191.808 E.1574
G1 X191.143 Y183.157 E1.0748
G1 X191.143 Y181.529 E.05236
M204 S10000
G1 X191.143 Y167.928 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y166.3 E.05236
G1 X158.857 Y174.95 E1.0748
G1 X158.857 Y175.399 E.01443
G1 X184.601 Y201.143 E1.17071
G1 X178.637 Y201.143 E.19176
G1 X191.143 Y154.472 E1.55369
G1 X191.143 Y152.844 E.05236
; WIPE_START
G1 X191.143 Y154.472 E-.61876
G1 X191.046 Y154.831 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.4 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 15 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z3.4 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer15 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 16/75
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
M73 P46 R32
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X191.571 Y194.631 Z3.6 F60000
G1 X191.143 Y190.104 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X191.143 Y191.732 E.05236
G1 X158.857 Y200.383 E1.0748
G1 X158.857 Y198.227 E.06933
G1 X161.773 Y201.143 E.13258
G1 X161.633 Y201.143 E.00449
G1 X183.682 Y118.857 E2.73933
G1 X183.113 Y118.857 E.01828
G1 X191.143 Y126.887 E.36515
G1 X191.143 Y124.302 E.08312
G1 X158.857 Y132.953 E1.0748
G1 X158.857 Y129.143 E.12249
G1 X191.143 Y161.429 E1.4682
G1 X191.143 Y158.017 E.1097
G1 X158.857 Y166.668 E1.0748
G1 X158.857 Y163.685 E.09591
G1 X191.143 Y195.971 E1.4682
G1 X191.143 Y200.161 E.13476
G1 X187.48 Y201.143 E.12194
G1 X186.92 Y201.143 E.01801
G1 X191.143 Y185.382 E.52467
G1 X191.143 Y184.457 E.02977
G1 X158.857 Y152.171 E1.4682
G1 X158.857 Y158.239 E.19512
G1 X191.143 Y149.588 E1.0748
G1 X191.143 Y149.915 E.01049
G1 X160.085 Y118.857 E1.41236
G1 X166.824 Y118.857 E.21669
G1 X158.857 Y148.589 E.98979
G1 X158.857 Y149.81 E.03927
G1 X191.143 Y141.16 E1.0748
G1 X191.143 Y138.401 E.08871
G1 X171.599 Y118.857 E.88875
G1 X175.253 Y118.857 E.11748
G1 X158.857 Y180.046 E2.03701
G1 X158.857 Y181.674 E.05236
M204 S10000
G1 X158.857 Y193.583 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y191.954 E.05236
G1 X191.143 Y183.304 E1.0748
G1 X191.143 Y181.675 E.05236
M204 S10000
G1 X191.143 Y168.074 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y166.446 E.05236
G1 X158.857 Y175.097 E1.0748
G1 X158.857 Y175.199 E.0033
G1 X184.801 Y201.143 E1.1798
G1 X178.491 Y201.143 E.2029
M73 P46 R31
G1 X191.143 Y153.926 E1.57188
G1 X191.143 Y152.297 E.05236
M204 S10000
G1 X191.143 Y131.102 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y132.731 E.05236
G1 X158.857 Y141.382 E1.0748
G1 X158.857 Y140.657 E.02329
G1 X191.143 Y172.943 E1.4682
G1 X191.143 Y174.875 E.06213
G1 X158.857 Y183.526 E1.0748
G1 X158.857 Y186.713 E.1025
G1 X173.287 Y201.143 E.65619
G1 X170.062 Y201.143 E.1037
G1 X191.143 Y122.469 E2.6191
G1 X191.143 Y120.841 E.05236
M204 S10000
G1 X181.634 Y118.857 F60000
G1 F4421.739
M204 S8000
G1 X180.005 Y118.857 E.05236
G1 X158.857 Y124.524 E.70403
G1 X158.857 Y122.896 E.05236
; WIPE_START
G1 X158.857 Y124.524 E-.61876
G1 X159.216 Y124.428 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.6 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 16 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z3.6 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer16 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 17/75
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change


M106 S48.45
; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X191.143 Y198.679 Z3.8 F60000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X191.143 Y200.308 E.05236
G1 X188.026 Y201.143 E.10375
G1 X186.773 Y201.143 E.04029
G1 X191.143 Y184.836 E.54286
G1 X191.143 Y184.257 E.01863
G1 X158.857 Y151.971 E1.4682
G1 X158.857 Y158.386 E.20626
G1 X191.143 Y149.735 E1.0748
G1 X191.143 Y149.715 E.00065
G1 X160.285 Y118.857 E1.40327
G1 X166.678 Y118.857 E.20555
G1 X158.857 Y148.043 E.9716
G1 X158.857 Y149.957 E.06155
G1 X191.143 Y141.306 E1.0748
G1 X191.143 Y138.201 E.09985
G1 X171.799 Y118.857 E.87966
G1 X175.106 Y118.857 E.10635
G1 X158.857 Y179.499 E2.01882
G1 X158.857 Y181.128 E.05236
M204 S10000
G1 X158.857 Y193.729 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y192.101 E.05236
G1 X191.143 Y183.45 E1.0748
G1 X191.143 Y181.822 E.05236
M204 S10000
G1 X191.143 Y168.221 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y166.592 E.05236
G1 X158.857 Y175.243 E1.0748
G1 X158.857 Y174.999 E.00784
G1 X185.001 Y201.143 E1.1889
G1 X178.344 Y201.143 E.21404
G1 X191.143 Y153.379 E1.59007
G1 X191.143 Y151.751 E.05236
M204 S10000
G1 X191.143 Y131.249 F60000
G1 F4421.739
M204 S8000
M73 P47 R31
G1 X191.143 Y132.877 E.05236
G1 X158.857 Y141.528 E1.0748
G1 X158.857 Y140.457 E.03443
G1 X191.143 Y172.743 E1.4682
G1 X191.143 Y175.021 E.07327
G1 X158.857 Y183.672 E1.0748
G1 X158.857 Y186.513 E.09136
G1 X173.487 Y201.143 E.66529
G1 X169.916 Y201.143 E.11483
G1 X191.143 Y121.923 E2.63729
G1 X191.143 Y120.294 E.05236
M204 S10000
G1 X182.18 Y118.857 F60000
G1 F4421.739
M204 S8000
G1 X180.552 Y118.857 E.05236
G1 X158.857 Y124.67 E.72222
G1 X158.857 Y128.943 E.13741
G1 X191.143 Y161.229 E1.4682
G1 X191.143 Y158.164 E.09856
G1 X158.857 Y166.814 E1.0748
G1 X158.857 Y163.485 E.10705
G1 X191.143 Y195.771 E1.4682
G1 X191.143 Y191.879 E.12514
G1 X158.857 Y200.53 E1.0748
G1 X158.857 Y198.027 E.08047
G1 X161.973 Y201.143 E.14168
G1 X161.487 Y201.143 E.01563
G1 X183.535 Y118.857 E2.73933
G1 X183.313 Y118.857 E.00714
G1 X191.143 Y126.687 E.35605
G1 X191.143 Y124.448 E.07198
G1 X158.857 Y133.099 E1.0748
G1 X158.857 Y134.728 E.05236
; WIPE_START
G1 X158.857 Y133.099 E-.61876
G1 X159.216 Y133.003 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.8 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 17 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z3.8 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer17 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 18/75
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change


M106 S51
; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X191.143 Y198.826 Z4 F60000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X191.143 Y200.454 E.05236
G1 X188.573 Y201.143 E.08556
G1 X186.944 Y201.143 E.05236
M204 S10000
G1 X179.826 Y201.143 F60000
G1 F4421.739
M204 S8000
G1 X178.198 Y201.143 E.05236
G1 X191.143 Y152.833 E1.60826
G1 X191.143 Y151.205 E.05236
M204 S10000
G1 X191.143 Y168.367 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y166.739 E.05236
G1 X158.857 Y175.39 E1.0748
G1 X158.857 Y174.799 E.01898
G1 X185.201 Y201.143 E1.19799
G1 X186.627 Y201.143 E.04586
G1 X191.143 Y184.29 E.56105
G1 X191.143 Y184.057 E.0075
G1 X158.857 Y151.771 E1.4682
G1 X158.857 Y150.103 E.05364
G1 X191.143 Y141.452 E1.0748
G1 X191.143 Y138.001 E.11099
G1 X171.999 Y118.857 E.87056
G1 X174.96 Y118.857 E.09521
G1 X158.857 Y178.953 E2.00063
G1 X158.857 Y180.581 E.05236
M204 S10000
G1 X158.857 Y190.619 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y192.247 E.05236
G1 X191.143 Y183.596 E1.0748
G1 X191.143 Y181.968 E.05236
M204 S10000
G1 X158.857 Y156.904 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y158.532 E.05236
G1 X191.143 Y149.881 E1.0748
G1 X191.143 Y149.515 E.01178
G1 X160.485 Y118.857 E1.39417
G1 X166.531 Y118.857 E.19441
G1 X158.857 Y147.496 E.95341
G1 X158.857 Y149.125 E.05236
M204 S10000
G1 X158.857 Y134.874 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y133.246 E.05236
G1 X191.143 Y124.595 E1.0748
G1 X191.143 Y126.487 E.06084
G1 X183.513 Y118.857 E.34696
G1 X183.389 Y118.857 E.004
G1 X161.34 Y201.143 E2.73933
G1 X162.173 Y201.143 E.02677
G1 X158.857 Y197.827 E.15077
G1 X158.857 Y200.676 E.09161
G1 X191.143 Y192.025 E1.0748
G1 X191.143 Y195.571 E.11401
G1 X158.857 Y163.285 E1.4682
G1 X158.857 Y166.961 E.11819
G1 X191.143 Y158.31 E1.0748
G1 X191.143 Y161.029 E.08742
G1 X158.857 Y128.743 E1.4682
G1 X158.857 Y124.817 E.12627
G1 X181.098 Y118.857 E.74041
G1 X182.727 Y118.857 E.05236
M204 S10000
G1 X191.143 Y119.748 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y121.376 E.05236
G1 X169.769 Y201.143 E2.65548
G1 X173.687 Y201.143 E.12597
G1 X158.857 Y186.313 E.67438
G1 X158.857 Y183.818 E.08022
G1 X191.143 Y175.168 E1.0748
G1 X191.143 Y172.543 E.08441
G1 X158.857 Y140.257 E1.4682
G1 X158.857 Y141.674 E.04557
G1 X191.143 Y133.024 E1.0748
G1 X191.143 Y131.395 E.05236
; WIPE_START
G1 X191.143 Y133.024 E-.61876
G1 X190.784 Y133.12 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 18 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z4 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer18 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 19/75
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
M73 P48 R31
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P48 R30
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X191.143 Y198.972 Z4.2 F60000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X191.143 Y200.6 E.05236
G1 X189.119 Y201.143 E.06737
G1 X187.491 Y201.143 E.05236
M204 S10000
G1 X191.143 Y184.14 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y183.857 E.0091
G1 X158.857 Y151.571 E1.4682
G1 X158.857 Y150.25 E.0425
G1 X191.143 Y141.599 E1.0748
G1 X191.143 Y137.801 E.12213
G1 X172.199 Y118.857 E.86147
G1 X174.814 Y118.857 E.08407
G1 X158.857 Y178.407 E1.98244
G1 X158.857 Y180.035 E.05236
M204 S10000
G1 X158.857 Y190.765 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y192.394 E.05236
G1 X191.143 Y183.743 E1.0748
G1 X186.48 Y201.143 E.57925
G1 X185.401 Y201.143 E.03472
G1 X158.857 Y174.599 E1.20709
G1 X158.857 Y175.536 E.03012
G1 X191.143 Y166.885 E1.0748
G1 X191.143 Y165.257 E.05236
M204 S10000
G1 X191.143 Y150.658 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y152.287 E.05236
G1 X178.052 Y201.143 E1.62645
G1 X173.887 Y201.143 E.13393
G1 X158.857 Y186.113 E.68348
G1 X158.857 Y183.965 E.06909
G1 X191.143 Y175.314 E1.0748
G1 X191.143 Y172.343 E.09555
G1 X158.857 Y140.057 E1.4682
G1 X158.857 Y141.821 E.0567
G1 X191.143 Y133.17 E1.0748
G1 X191.143 Y131.542 E.05236
M204 S10000
G1 X158.857 Y157.05 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y158.678 E.05236
G1 X191.143 Y150.028 E1.0748
G1 X191.143 Y149.315 E.02292
G1 X160.685 Y118.857 E1.38508
G1 X166.385 Y118.857 E.18327
G1 X158.857 Y146.95 E.93522
G1 X158.857 Y148.578 E.05236
M204 S10000
G1 X158.857 Y135.02 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y133.392 E.05236
G1 X191.143 Y124.741 E1.0748
G1 X191.143 Y126.287 E.0497
G1 X183.713 Y118.857 E.33786
G1 X183.242 Y118.857 E.01514
G1 X161.194 Y201.143 E2.73933
G1 X162.373 Y201.143 E.03791
G1 X158.857 Y197.627 E.15987
G1 X158.857 Y200.822 E.10275
G1 X191.143 Y192.172 E1.0748
G1 X191.143 Y195.371 E.10287
G1 X158.857 Y163.085 E1.4682
G1 X158.857 Y167.107 E.12933
G1 X191.143 Y158.456 E1.0748
G1 X191.143 Y160.829 E.07628
G1 X158.857 Y128.543 E1.4682
G1 X158.857 Y124.963 E.11513
G1 X181.645 Y118.857 E.7586
G1 X183.039 Y118.857 E.04483
M204 S10000
G1 X191.143 Y119.202 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y120.83 E.05236
G1 X169.623 Y201.143 E2.67367
G1 X167.995 Y201.143 E.05236
; WIPE_START
G1 X169.623 Y201.143 E-.61876
G1 X169.719 Y200.784 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.2 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 19 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z4.2 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer19 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 20/75
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X191.143 Y199.118 Z4.4 F60000
G1 Z4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X191.143 Y200.747 E.05236
G1 X189.665 Y201.143 E.04918
G1 X188.037 Y201.143 E.05236
M204 S10000
G1 X191.143 Y181.569 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y183.197 E.05236
G1 X186.334 Y201.143 E.59743
G1 X185.601 Y201.143 E.02358
G1 X158.857 Y174.399 E1.21618
G1 X158.857 Y175.682 E.04126
G1 X191.143 Y167.032 E1.0748
G1 X191.143 Y165.403 E.05236
M204 S10000
G1 X191.143 Y150.378 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y151.74 E.04382
G1 X177.905 Y201.143 E1.64464
G1 X174.087 Y201.143 E.12279
G1 X158.857 Y185.913 E.69257
G1 X158.857 Y184.111 E.05795
G1 X191.143 Y175.46 E1.0748
G1 X191.143 Y172.143 E.10669
G1 X158.857 Y139.857 E1.4682
G1 X158.857 Y141.967 E.06784
M73 P49 R30
G1 X191.143 Y133.316 E1.0748
G1 X191.143 Y131.688 E.05236
M204 S10000
G1 X158.857 Y135.167 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y133.538 E.05236
G1 X191.143 Y124.888 E1.0748
G1 X191.143 Y126.087 E.03856
G1 X183.913 Y118.857 E.32877
G1 X183.096 Y118.857 E.02628
G1 X161.048 Y201.143 E2.73933
G1 X162.573 Y201.143 E.04904
G1 X158.857 Y197.427 E.16897
G1 X158.857 Y200.969 E.11389
G1 X191.143 Y192.318 E1.0748
G1 X191.143 Y195.171 E.09173
G1 X158.857 Y162.885 E1.4682
G1 X158.857 Y158.825 E.13057
G1 X191.143 Y150.174 E1.0748
G1 X191.143 Y149.115 E.03406
G1 X160.885 Y118.857 E1.37598
G1 X166.238 Y118.857 E.17214
G1 X158.857 Y146.403 E.91703
G1 X158.857 Y148.032 E.05236
M204 S10000
G1 X158.857 Y190.912 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y192.54 E.05236
G1 X191.143 Y183.889 E1.0748
M204 S10000
G1 X191.143 Y183.657 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y151.371 E1.4682
G1 X158.857 Y150.396 E.03136
G1 X191.143 Y141.745 E1.0748
G1 X191.143 Y137.601 E.13327
G1 X172.399 Y118.857 E.85237
G1 X174.667 Y118.857 E.07293
G1 X158.857 Y177.86 E1.96425
G1 X158.857 Y179.488 E.05236
M204 S10000
G1 X158.857 Y168.882 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y167.254 E.05236
G1 X191.143 Y158.603 E1.0748
G1 X191.143 Y160.629 E.06514
G1 X158.857 Y128.343 E1.4682
G1 X158.857 Y125.11 E.10399
G1 X182.191 Y118.857 E.77679
G1 X182.892 Y118.857 E.02255
M204 S10000
G1 X190.94 Y118.857 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y118.857 E.0065
G1 X191.143 Y120.283 E.04586
G1 X169.476 Y201.143 E2.69186
G1 X167.848 Y201.143 E.05236
; WIPE_START
G1 X169.476 Y201.143 E-.61876
G1 X169.573 Y200.784 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.4 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 20 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z4.4 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer20 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 21/75
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change


M106 S48.45
; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X191.143 Y199.265 Z4.6 F60000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X191.143 Y200.893 E.05236
G1 X190.212 Y201.143 E.03099
G1 X188.583 Y201.143 E.05236
M204 S10000
G1 X191.143 Y181.022 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y182.65 E.05236
G1 X186.188 Y201.143 E.61562
G1 X185.801 Y201.143 E.01244
G1 X158.857 Y174.199 E1.22528
G1 X158.857 Y175.829 E.0524
G1 X191.143 Y167.178 E1.0748
G1 X191.143 Y165.55 E.05236
M204 S10000
G1 X158.857 Y169.028 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y167.4 E.05236
G1 X191.143 Y158.749 E1.0748
G1 X191.143 Y160.429 E.05401
G1 X158.857 Y128.143 E1.4682
G1 X158.857 Y125.256 E.09285
G1 X182.737 Y118.857 E.79498
G1 X182.95 Y118.857 E.00682
G1 X160.901 Y201.143 E2.73933
G1 X162.773 Y201.143 E.06018
G1 X158.857 Y197.227 E.17806
G1 X158.857 Y201.115 E.12503
G1 X191.143 Y192.464 E1.0748
G1 X191.143 Y194.971 E.08059
G1 X158.857 Y162.685 E1.4682
G1 X158.857 Y158.971 E.11943
M73 P49 R29
G1 X191.143 Y150.32 E1.0748
G1 X191.143 Y151.194 E.02808
G1 X177.759 Y201.143 E1.66283
G1 X174.287 Y201.143 E.11165
G1 X158.857 Y185.713 E.70167
G1 X158.857 Y184.258 E.04681
G1 X191.143 Y175.607 E1.0748
G1 X191.143 Y171.943 E.11783
G1 X158.857 Y139.657 E1.4682
G1 X158.857 Y142.114 E.07898
G1 X191.143 Y133.463 E1.0748
G1 X191.143 Y137.401 E.12663
G1 X172.599 Y118.857 E.84328
G1 X174.521 Y118.857 E.06179
G1 X158.857 Y177.314 E1.94605
G1 X158.857 Y178.942 E.05236
M204 S10000
G1 X158.857 Y191.058 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y192.686 E.05236
G1 X191.143 Y184.036 E1.0748
G1 X191.143 Y185.664 E.05236
M204 S10000
G1 X191.143 Y183.457 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y151.171 E1.4682
G1 X158.857 Y150.542 E.02022
G1 X191.143 Y141.892 E1.0748
G1 X191.143 Y148.915 E.22584
G1 X161.085 Y118.857 E1.36689
G1 X166.092 Y118.857 E.161
G1 X158.857 Y145.857 E.89884
G1 X158.857 Y147.485 E.05236
M204 S10000
G1 X158.857 Y135.313 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y133.685 E.05236
G1 X191.143 Y125.034 E1.0748
G1 X191.143 Y125.887 E.02742
G1 X184.113 Y118.857 E.31967
G1 X191.143 Y118.857 E.22604
G1 X191.143 Y119.737 E.02829
G1 X169.33 Y201.143 E2.71005
M73 P50 R29
G1 X167.702 Y201.143 E.05236
; WIPE_START
G1 X169.33 Y201.143 E-.61876
G1 X169.426 Y200.784 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.6 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 21 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z4.6 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer21 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 22/75
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change


M106 S51
; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X191.758 Y194.616 Z4.8 F60000
G1 X191.143 Y185.81 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X191.143 Y184.182 E.05236
G1 X158.857 Y192.833 E1.0748
G1 X158.857 Y197.027 E.13488
G1 X162.973 Y201.143 E.18716
G1 X160.755 Y201.143 E.07132
G1 X182.803 Y118.857 E2.73933
M204 S10000
G1 X189.848 Y118.857 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y118.857 E.04164
G1 X191.143 Y119.191 E.01072
G1 X169.184 Y201.143 E2.72824
G1 X167.555 Y201.143 E.05236
M204 S10000
G1 X158.857 Y199.958 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y201.143 E.03808
G1 X159.301 Y201.143 E.01428
G1 X191.143 Y192.611 E1.06002
G1 X191.143 Y194.771 E.06945
G1 X158.857 Y162.485 E1.4682
G1 X158.857 Y159.118 E.10829
G1 X191.143 Y150.467 E1.0748
G1 X191.143 Y150.647 E.00581
G1 X177.612 Y201.143 E1.68102
G1 X174.487 Y201.143 E.10051
G1 X158.857 Y185.513 E.71076
G1 X158.857 Y184.404 E.03567
G1 X191.143 Y175.753 E1.0748
G1 X191.143 Y171.743 E.12897
G1 X158.857 Y139.457 E1.4682
G1 X158.857 Y142.26 E.09012
G1 X191.143 Y133.609 E1.0748
G1 X191.143 Y137.201 E.11549
G1 X172.799 Y118.857 E.83418
G1 X174.374 Y118.857 E.05065
G1 X158.857 Y176.767 E1.92786
G1 X158.857 Y178.396 E.05236
M204 S10000
G1 X158.857 Y175.975 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y167.324 E1.0748
G1 X191.143 Y165.696 E.05236
M204 S10000
G1 X158.857 Y146.939 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y145.311 E.05236
G1 X165.946 Y118.857 E.88065
G1 X161.285 Y118.857 E.14986
G1 X191.143 Y148.715 E1.35779
G1 X191.143 Y142.038 E.2147
G1 X158.857 Y150.689 E1.0748
G1 X158.857 Y150.971 E.00909
G1 X191.143 Y183.257 E1.4682
M204 S10000
G1 X191.143 Y180.476 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y182.104 E.05236
G1 X186.041 Y201.143 E.63381
G1 X186.001 Y201.143 E.0013
G1 X158.857 Y173.999 E1.23437
G1 X158.857 Y167.546 E.2075
G1 X191.143 Y158.896 E1.0748
G1 X191.143 Y160.229 E.04287
G1 X158.857 Y127.943 E1.4682
G1 X158.857 Y125.402 E.08171
G1 X183.284 Y118.857 E.81318
G1 X184.313 Y118.857 E.0331
G1 X191.143 Y125.687 E.31058
G1 X191.143 Y125.18 E.01628
G1 X158.857 Y133.831 E1.0748
G1 X158.857 Y132.203 E.05236
; WIPE_START
G1 X158.857 Y133.831 E-.61876
G1 X159.216 Y133.735 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.8 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 22 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z4.8 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer22 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 23/75
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X191.898 Y194.608 Z5 F60000
G1 X191.143 Y179.929 Z5
M73 P51 R29
G1 Z4.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X191.143 Y181.558 E.05236
G1 X185.895 Y201.143 E.652
G1 X186.201 Y201.143 E.00984
G1 X158.857 Y173.799 E1.24347
G1 X158.857 Y167.693 E.19636
G1 X191.143 Y159.042 E1.0748
G1 X191.143 Y160.029 E.03173
G1 X158.857 Y127.743 E1.4682
G1 X158.857 Y125.549 E.07057
G1 X183.83 Y118.857 E.83137
G1 X184.513 Y118.857 E.02196
G1 X191.143 Y125.487 E.30148
G1 X191.143 Y125.327 E.00514
G1 X158.857 Y133.978 E1.0748
G1 X158.857 Y132.349 E.05236
M204 S10000
G1 X158.857 Y146.393 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y144.764 E.05236
G1 X165.799 Y118.857 E.86246
G1 X161.485 Y118.857 E.13872
G1 X191.143 Y148.515 E1.3487
G1 X191.143 Y150.101 E.05101
G1 X177.466 Y201.143 E1.69922
G1 X174.687 Y201.143 E.08937
G1 X158.857 Y185.313 E.71986
G1 X158.857 Y184.55 E.02453
G1 X191.143 Y175.9 E1.0748
G1 X191.143 Y171.543 E.14011
G1 X158.857 Y139.257 E1.4682
G1 X158.857 Y142.406 E.10126
G1 X191.143 Y133.756 E1.0748
G1 X191.143 Y137.001 E.10435
G1 X172.999 Y118.857 E.82509
G1 X174.228 Y118.857 E.03951
G1 X158.857 Y176.221 E1.90967
G1 X158.857 Y176.122 E.00319
G1 X191.143 Y167.471 E1.0748
G1 X191.143 Y165.843 E.05236
M204 S10000
G1 X189.457 Y118.857 F60000
G1 F4421.739
M204 S8000
G1 X191.085 Y118.857 E.05236
G1 X169.037 Y201.143 E2.73933
G1 X163.173 Y201.143 E.18858
G1 X158.857 Y196.827 E.19625
G1 X158.857 Y192.979 E.12374
G1 X191.143 Y184.328 E1.0748
G1 X191.143 Y183.057 E.0409
G1 X158.857 Y150.771 E1.4682
G1 X158.857 Y150.835 E.00205
G1 X191.143 Y142.184 E1.0748
G1 X191.143 Y143.813 E.05236
M204 S10000
G1 X191.143 Y150.613 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y159.264 E1.0748
G1 X158.857 Y162.285 E.09715
G1 X191.143 Y194.571 E1.4682
G1 X191.143 Y192.757 E.05831
G1 X159.848 Y201.143 E1.04183
G1 X158.857 Y201.143 E.03185
G1 X158.857 Y200.505 E.02051
M204 S10000
G1 X160.608 Y201.143 F60000
G1 F4421.739
M204 S8000
G1 X182.657 Y118.857 E2.73933
; WIPE_START
G1 X182.139 Y120.789 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 23 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z5 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer23 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 24/75
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
M73 P51 R28
G1 X191.491 Y201.491 F60000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X191.907 Y194.607 Z5.2 F60000
G1 X191.143 Y179.383 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X191.143 Y181.011 E.05236
G1 X185.748 Y201.143 E.67019
G1 X186.401 Y201.143 E.02098
G1 X158.857 Y173.599 E1.25256
G1 X158.857 Y167.839 E.18522
G1 X191.143 Y159.188 E1.0748
G1 X191.143 Y159.829 E.02059
G1 X158.857 Y127.543 E1.4682
G1 X158.857 Y125.695 E.05943
G1 X184.377 Y118.857 E.84956
G1 X184.713 Y118.857 E.01082
G1 X191.143 Y125.287 E.29239
G1 X191.143 Y125.473 E.006
G1 X158.857 Y134.124 E1.0748
G1 X158.857 Y132.496 E.05236
M204 S10000
G1 X158.857 Y145.846 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y144.218 E.05236
G1 X165.653 Y118.857 E.84427
G1 X161.685 Y118.857 E.12758
G1 X191.143 Y148.315 E1.3396
G1 X191.143 Y149.554 E.03987
G1 X177.32 Y201.143 E1.71741
G1 X174.887 Y201.143 E.07823
G1 X158.857 Y185.113 E.72895
G1 X158.857 Y184.697 E.01339
G1 X191.143 Y176.046 E1.0748
G1 X191.143 Y171.343 E.15124
G1 X158.857 Y139.057 E1.4682
G1 X158.857 Y142.553 E.1124
G1 X191.143 Y133.902 E1.0748
G1 X191.143 Y136.801 E.09321
G1 X173.199 Y118.857 E.81599
G1 X174.081 Y118.857 E.02837
G1 X158.857 Y175.675 E1.89148
G1 X158.857 Y176.268 E.01909
G1 X191.143 Y167.617 E1.0748
G1 X191.143 Y165.989 E.05236
M204 S10000
G1 X191.143 Y120.282 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y118.857 E.04582
G1 X190.939 Y118.857 E.00654
G1 X168.891 Y201.143 E2.73933
G1 X163.373 Y201.143 E.17744
G1 X158.857 Y196.627 E.20535
G1 X158.857 Y193.126 E.1126
G1 X191.143 Y184.475 E1.0748
G1 X191.143 Y182.857 E.05204
G1 X158.857 Y150.571 E1.4682
G1 X158.857 Y150.982 E.01319
M73 P52 R28
G1 X191.143 Y142.331 E1.0748
G1 X191.143 Y143.959 E.05236
M204 S10000
G1 X191.143 Y150.76 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y159.41 E1.0748
G1 X158.857 Y162.085 E.08601
G1 X191.143 Y194.371 E1.4682
G1 X191.143 Y192.904 E.04717
G1 X160.394 Y201.143 E1.02364
G1 X160.462 Y201.143 E.00218
G1 X182.51 Y118.857 E2.73933
G1 X180.882 Y118.857 E.05236
; WIPE_START
G1 X182.51 Y118.857 E-.61876
G1 X182.414 Y119.216 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.2 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 24 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z5.2 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer24 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 25/75
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X192.114 Y194.6 Z5.4 F60000
G1 X191.143 Y152.534 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X191.143 Y150.906 E.05236
G1 X158.857 Y159.557 E1.0748
G1 X158.857 Y161.885 E.07487
G1 X191.143 Y194.171 E1.4682
G1 X191.143 Y193.05 E.03603
G1 X160.941 Y201.143 E1.00544
G1 X160.316 Y201.143 E.0201
G1 X182.364 Y118.857 E2.73933
G1 X180.736 Y118.857 E.05236
M204 S10000
G1 X191.143 Y120.136 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y118.857 E.04111
G1 X190.793 Y118.857 E.01125
G1 X168.744 Y201.143 E2.73933
G1 X163.573 Y201.143 E.1663
G1 X158.857 Y196.427 E.21444
G1 X158.857 Y193.272 E.10146
G1 X191.143 Y184.621 E1.0748
G1 X191.143 Y182.657 E.06318
G1 X158.857 Y150.371 E1.4682
G1 X158.857 Y151.128 E.02433
G1 X191.143 Y142.477 E1.0748
G1 X191.143 Y140.849 E.05236
M204 S10000
G1 X158.857 Y142.699 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y134.048 E1.0748
G1 X191.143 Y136.601 E.08207
G1 X173.399 Y118.857 E.8069
G1 X173.935 Y118.857 E.01723
G1 X158.857 Y175.128 E1.87329
G1 X158.857 Y176.414 E.04136
G1 X191.143 Y167.764 E1.0748
G1 X191.143 Y171.143 E.10866
G1 X158.857 Y138.857 E1.4682
G1 X158.857 Y134.27 E.1475
G1 X191.143 Y125.62 E1.0748
G1 X191.143 Y125.087 E.01713
G1 X184.913 Y118.857 E.28329
G1 X158.857 Y125.842 E.86744
G1 X158.857 Y127.343 E.04829
G1 X191.143 Y159.629 E1.4682
G1 X191.143 Y159.335 E.00945
G1 X158.857 Y167.986 E1.0748
G1 X158.857 Y173.399 E.17408
G1 X186.601 Y201.143 E1.26166
G1 X185.602 Y201.143 E.03212
G1 X191.143 Y180.465 E.68838
G1 X191.143 Y176.192 E.13738
G1 X158.857 Y184.843 E1.0748
G1 X158.857 Y184.913 E.00225
G1 X175.087 Y201.143 E.73805
G1 X177.173 Y201.143 E.06709
G1 X191.143 Y149.008 E1.7356
G1 X191.143 Y148.115 E.02873
G1 X161.885 Y118.857 E1.33051
G1 X165.506 Y118.857 E.11644
G1 X158.857 Y143.671 E.82608
G1 X158.857 Y145.3 E.05236
; WIPE_START
G1 X158.857 Y143.671 E-.61876
G1 X158.954 Y143.312 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.4 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 25 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z5.4 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer25 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 26/75
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
M73 P53 R28
G1 E-.8 F1800
M204 S10000
G1 X186.665 Y197.071 Z5.6 F60000
G1 X158.857 Y171.571 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X158.857 Y173.199 E.05236
G1 X186.801 Y201.143 E1.27075
G1 X185.456 Y201.143 E.04326
G1 X191.143 Y179.918 E.70657
G1 X191.143 Y176.339 E.1151
M73 P53 R27
G1 X158.857 Y184.99 E1.0748
G1 X158.857 Y184.713 E.00889
G1 X175.287 Y201.143 E.74714
G1 X177.027 Y201.143 E.05595
G1 X191.143 Y148.462 E1.75379
G1 X191.143 Y147.915 E.01759
G1 X162.085 Y118.857 E1.32141
G1 X165.36 Y118.857 E.1053
G1 X158.857 Y143.125 E.80789
G1 X158.857 Y142.846 E.00898
G1 X191.143 Y134.195 E1.0748
G1 X191.143 Y136.401 E.07093
G1 X173.599 Y118.857 E.7978
G1 X173.789 Y118.857 E.00609
G1 X158.857 Y174.582 E1.8551
G1 X158.857 Y176.561 E.06364
G1 X191.143 Y167.91 E1.0748
G1 X191.143 Y170.943 E.09752
G1 X158.857 Y138.657 E1.4682
G1 X158.857 Y134.417 E.13636
G1 X191.143 Y125.766 E1.0748
G1 X191.143 Y124.887 E.02827
G1 X185.113 Y118.857 E.27419
G1 X185.47 Y118.857 E.01146
G1 X158.857 Y125.988 E.88594
G1 X158.857 Y127.143 E.03715
G1 X191.143 Y159.429 E1.4682
G1 X191.143 Y159.481 E.00169
G1 X158.857 Y168.132 E1.0748
G1 X158.857 Y166.504 E.05236
M204 S10000
G1 X191.143 Y152.681 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y151.052 E.05236
G1 X158.857 Y159.703 E1.0748
G1 X158.857 Y161.685 E.06373
G1 X191.143 Y193.971 E1.4682
G1 X191.143 Y193.196 E.02489
G1 X161.487 Y201.143 E.98725
G1 X160.169 Y201.143 E.04238
G1 X182.217 Y118.857 E2.73933
G1 X180.589 Y118.857 E.05236
M204 S10000
G1 X191.143 Y119.989 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y118.857 E.0364
G1 X190.646 Y118.857 E.01596
G1 X168.598 Y201.143 E2.73933
G1 X163.773 Y201.143 E.15516
G1 X158.857 Y196.227 E.22354
G1 X158.857 Y193.418 E.09032
G1 X191.143 Y184.768 E1.0748
G1 X191.143 Y182.457 E.07432
G1 X158.857 Y150.171 E1.4682
G1 X158.857 Y151.274 E.03547
G1 X191.143 Y142.624 E1.0748
G1 X191.143 Y140.995 E.05236
; WIPE_START
G1 X191.143 Y142.624 E-.61876
G1 X190.784 Y142.72 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.6 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 26 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z5.6 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer26 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 27/75
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X186.544 Y197.206 Z5.8 F60000
G1 X158.857 Y172.999 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X187.001 Y201.143 E1.27985
G1 X185.309 Y201.143 E.05439
G1 X191.143 Y179.372 E.72476
G1 X191.143 Y176.485 E.09283
G1 X158.857 Y185.136 E1.0748
G1 X158.857 Y184.513 E.02003
G1 X175.487 Y201.143 E.75624
G1 X176.88 Y201.143 E.04481
G1 X191.143 Y147.915 E1.77198
G1 X191.143 Y147.715 E.00645
G1 X162.285 Y118.857 E1.31232
G1 X165.213 Y118.857 E.09416
G1 X158.857 Y142.579 E.7897
G1 X158.857 Y142.992 E.0133
G1 X191.143 Y134.341 E1.0748
G1 X191.143 Y136.201 E.05979
G1 X173.799 Y118.857 E.78871
G1 X173.642 Y118.857 E.00505
G1 X158.857 Y174.035 E1.83691
G1 X158.857 Y176.707 E.08592
G1 X191.143 Y168.056 E1.0748
G1 X191.143 Y170.743 E.08638
G1 X158.857 Y138.457 E1.4682
G1 X158.857 Y134.563 E.12522
G1 X191.143 Y125.912 E1.0748
G1 X191.143 Y124.687 E.03941
G1 X185.313 Y118.857 E.2651
M204 S10000
G1 X180.443 Y118.857 F60000
G1 F4421.739
M204 S8000
G1 X182.071 Y118.857 E.05236
G1 X160.023 Y201.143 E2.73933
G1 X162.033 Y201.143 E.06466
G1 X191.143 Y193.343 E.96906
G1 X191.143 Y193.771 E.01375
M73 P54 R27
G1 X158.857 Y161.485 E1.4682
G1 X158.857 Y159.85 E.0526
G1 X191.143 Y151.199 E1.0748
G1 X191.143 Y152.827 E.05236
M204 S10000
G1 X191.143 Y141.142 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y142.77 E.05236
G1 X158.857 Y151.421 E1.0748
G1 X158.857 Y149.971 E.04661
G1 X191.143 Y182.257 E1.4682
G1 X191.143 Y184.914 E.08545
G1 X158.857 Y193.565 E1.0748
G1 X158.857 Y196.027 E.07918
G1 X163.973 Y201.143 E.23263
G1 X168.452 Y201.143 E.14402
G1 X190.5 Y118.857 E2.73933
G1 X186.016 Y118.857 E.14419
G1 X158.857 Y126.134 E.90413
G1 X158.857 Y126.943 E.02601
G1 X191.143 Y159.229 E1.4682
G1 X191.143 Y159.628 E.01283
G1 X158.857 Y168.278 E1.0748
G1 X158.857 Y166.65 E.05236
; WIPE_START
G1 X158.857 Y168.278 E-.61876
G1 X159.216 Y168.182 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.8 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 27 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z5.8 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer27 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 28/75
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X186.561 Y197.187 Z6 F60000
G1 X158.857 Y172.799 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X187.201 Y201.143 E1.28894
G1 X185.163 Y201.143 E.06553
G1 X191.143 Y178.826 E.74295
G1 X191.143 Y176.632 E.07055
G1 X158.857 Y185.282 E1.0748
G1 X158.857 Y184.313 E.03117
G1 X175.687 Y201.143 E.76533
G1 X176.734 Y201.143 E.03367
G1 X191.143 Y147.369 E1.79017
G1 X191.143 Y147.515 E.00469
G1 X162.485 Y118.857 E1.30322
G1 X165.067 Y118.857 E.08302
G1 X158.857 Y142.032 E.77151
G1 X158.857 Y143.138 E.03557
G1 X191.143 Y134.488 E1.0748
G1 X191.143 Y136.001 E.04866
G1 X173.999 Y118.857 E.77961
G1 X173.496 Y118.857 E.01619
G1 X158.857 Y173.489 E1.81872
G1 X158.857 Y176.854 E.1082
G1 X191.143 Y168.203 E1.0748
G1 X191.143 Y170.543 E.07524
G1 X158.857 Y138.257 E1.4682
G1 X158.857 Y134.71 E.11408
G1 X191.143 Y126.059 E1.0748
G1 X191.143 Y124.487 E.05055
G1 X185.513 Y118.857 E.256
M204 S10000
G1 X180.296 Y118.857 F60000
G1 F4421.739
M204 S8000
G1 X181.925 Y118.857 E.05236
G1 X159.876 Y201.143 E2.73933
G1 X162.58 Y201.143 E.08693
G1 X191.143 Y193.489 E.95087
G1 X191.143 Y193.571 E.00261
G1 X158.857 Y161.285 E1.4682
G1 X158.857 Y159.996 E.04146
G1 X191.143 Y151.345 E1.0748
G1 X191.143 Y152.974 E.05236
M204 S10000
G1 X191.143 Y141.288 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y142.916 E.05236
G1 X158.857 Y151.567 E1.0748
G1 X158.857 Y149.771 E.05775
G1 X191.143 Y182.057 E1.4682
G1 X191.143 Y185.06 E.09659
G1 X158.857 Y193.711 E1.0748
G1 X158.857 Y195.827 E.06804
G1 X164.173 Y201.143 E.24173
G1 X168.305 Y201.143 E.13288
M73 P54 R26
G1 X190.353 Y118.857 E2.73933
G1 X186.562 Y118.857 E.12191
G1 X158.857 Y126.281 E.92232
G1 X158.857 Y126.743 E.01487
G1 X191.143 Y159.029 E1.4682
G1 X191.143 Y159.774 E.02397
G1 X158.857 Y168.425 E1.0748
G1 X158.857 Y166.797 E.05236
; WIPE_START
G1 X158.857 Y168.425 E-.61876
G1 X159.216 Y168.329 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 28 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z6 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer28 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 29/75
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P55 R26
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X184.666 Y201.862 Z6.2 F60000
G1 X169.787 Y201.143 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X168.159 Y201.143 E.05236
G1 X190.207 Y118.857 E2.73933
G1 X187.109 Y118.857 E.09963
G1 X158.857 Y126.427 E.94051
G1 X158.857 Y126.543 E.00373
G1 X191.143 Y158.829 E1.4682
G1 X191.143 Y159.92 E.03511
G1 X158.857 Y168.571 E1.0748
G1 X158.857 Y166.943 E.05236
M204 S10000
G1 X158.857 Y178.628 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y177 E.05236
G1 X191.143 Y168.349 E1.0748
G1 X191.143 Y170.343 E.0641
G1 X158.857 Y138.057 E1.4682
G1 X158.857 Y134.856 E.10294
G1 X191.143 Y126.205 E1.0748
G1 X191.143 Y124.287 E.06169
G1 X185.713 Y118.857 E.24691
G1 X181.778 Y118.857 E.12653
G1 X159.73 Y201.143 E2.73933
G1 X163.126 Y201.143 E.10921
G1 X191.143 Y193.636 E.93268
G1 X191.143 Y193.371 E.00853
G1 X158.857 Y161.085 E1.4682
G1 X158.857 Y160.142 E.03032
G1 X191.143 Y151.492 E1.0748
G1 X191.143 Y153.12 E.05236
M204 S10000
G1 X191.143 Y147.315 F60000
G1 F4421.739
M204 S8000
G1 X162.685 Y118.857 E1.29413
G1 X164.921 Y118.857 E.07188
G1 X158.857 Y141.486 E.75332
G1 X158.857 Y143.285 E.05785
G1 X191.143 Y134.634 E1.0748
G1 X191.143 Y135.801 E.03752
G1 X174.199 Y118.857 E.77052
G1 X173.349 Y118.857 E.02733
G1 X158.857 Y172.942 E1.80053
G1 X158.857 Y172.599 E.01104
G1 X187.401 Y201.143 E1.29804
G1 X185.016 Y201.143 E.07667
G1 X191.143 Y178.279 E.76114
G1 X191.143 Y176.778 E.04827
G1 X158.857 Y185.429 E1.0748
G1 X158.857 Y184.113 E.04231
G1 X175.887 Y201.143 E.77443
G1 X176.588 Y201.143 E.02253
G1 X191.143 Y146.822 E1.80836
G1 X191.143 Y143.063 E.12089
G1 X158.857 Y151.714 E1.0748
G1 X158.857 Y149.571 E.06889
G1 X191.143 Y181.857 E1.4682
G1 X191.143 Y185.207 E.10773
G1 X158.857 Y193.858 E1.0748
G1 X158.857 Y195.627 E.0569
G1 X164.373 Y201.143 E.25082
; WIPE_START
G1 X162.959 Y199.728 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.2 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 29 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z6.2 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer29 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 30/75
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X184.666 Y201.864 Z6.4 F60000
G1 X169.641 Y201.143 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X168.012 Y201.143 E.05236
G1 X190.061 Y118.857 E2.73933
G1 X187.655 Y118.857 E.07735
G1 X158.857 Y126.574 E.9587
G1 X158.857 Y126.343 E.00741
G1 X191.143 Y158.629 E1.4682
G1 X191.143 Y160.067 E.04625
G1 X158.857 Y168.718 E1.0748
G1 X158.857 Y167.089 E.05236
M204 S10000
G1 X158.857 Y178.775 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y177.146 E.05236
G1 X191.143 Y168.496 E1.0748
G1 X191.143 Y170.143 E.05296
G1 X158.857 Y137.857 E1.4682
G1 X158.857 Y135.003 E.0918
G1 X191.143 Y126.352 E1.0748
G1 X191.143 Y124.087 E.07283
G1 X185.913 Y118.857 E.23781
G1 X181.632 Y118.857 E.13767
G1 X159.584 Y201.143 E2.73933
G1 X163.673 Y201.143 E.13149
G1 X191.143 Y193.782 E.91449
G1 X191.143 Y193.171 E.01967
G1 X158.857 Y160.885 E1.4682
G1 X158.857 Y160.289 E.01918
M73 P56 R26
G1 X191.143 Y151.638 E1.0748
G1 X191.143 Y153.266 E.05236
M204 S10000
G1 X191.143 Y147.115 F60000
G1 F4421.739
M204 S8000
G1 X162.885 Y118.857 E1.28503
G1 X164.774 Y118.857 E.06074
G1 X158.857 Y140.939 E.73513
G1 X158.857 Y143.431 E.08013
G1 X191.143 Y134.781 E1.0748
G1 X191.143 Y135.601 E.02638
G1 X174.399 Y118.857 E.76142
G1 X173.203 Y118.857 E.03847
G1 X158.857 Y172.396 E1.78234
G1 X187.601 Y201.143 E1.30721
G1 X184.87 Y201.143 E.08781
G1 X191.143 Y177.733 E.77933
G1 X191.143 Y176.924 E.02599
G1 X158.857 Y185.575 E1.0748
G1 X158.857 Y183.913 E.05345
G1 X176.087 Y201.143 E.78353
G1 X176.441 Y201.143 E.01139
G1 X191.143 Y146.276 E1.82655
G1 X191.143 Y143.209 E.09861
G1 X158.857 Y151.86 E1.0748
G1 X158.857 Y149.371 E.08003
G1 X191.143 Y181.657 E1.4682
G1 X191.143 Y185.353 E.11887
G1 X158.857 Y194.004 E1.0748
G1 X158.857 Y195.427 E.04576
G1 X164.573 Y201.143 E.25992
; WIPE_START
G1 X163.159 Y199.728 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.4 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 30 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z6.4 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer30 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 31/75
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
M73 P56 R25
G1 X184.666 Y201.866 Z6.6 F60000
G1 X169.494 Y201.143 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X167.866 Y201.143 E.05236
G1 X189.914 Y118.857 E2.73933
G1 X188.202 Y118.857 E.05507
G1 X158.857 Y126.72 E.97689
G1 X158.857 Y126.143 E.01854
G1 X191.143 Y158.429 E1.4682
G1 X191.143 Y160.213 E.05739
G1 X158.857 Y168.864 E1.0748
G1 X158.857 Y167.236 E.05236
M204 S10000
G1 X158.857 Y178.921 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y177.293 E.05236
G1 X191.143 Y168.642 E1.0748
G1 X191.143 Y169.943 E.04182
G1 X158.857 Y137.657 E1.4682
G1 X158.857 Y135.149 E.08066
G1 X191.143 Y126.498 E1.0748
G1 X191.143 Y123.887 E.08397
G1 X186.113 Y118.857 E.22872
G1 X181.485 Y118.857 E.14881
G1 X159.437 Y201.143 E2.73933
G1 X164.219 Y201.143 E.15377
G1 X191.143 Y193.928 E.8963
G1 X191.143 Y192.971 E.03081
G1 X158.857 Y160.685 E1.4682
G1 X158.857 Y160.435 E.00804
G1 X191.143 Y151.785 E1.0748
G1 X191.143 Y153.413 E.05236
M204 S10000
G1 X191.143 Y146.915 F60000
G1 F4421.739
M204 S8000
G1 X163.085 Y118.857 E1.27593
G1 X164.628 Y118.857 E.0496
G1 X158.857 Y140.393 E.71694
G1 X158.857 Y143.578 E.10241
G1 X191.143 Y134.927 E1.0748
G1 X191.143 Y135.401 E.01524
G1 X174.599 Y118.857 E.75233
G1 X173.057 Y118.857 E.0496
G1 X158.857 Y171.85 E1.76415
G1 X158.857 Y172.199 E.01124
G1 X187.801 Y201.143 E1.31623
G1 X184.724 Y201.143 E.09895
G1 X191.143 Y177.186 E.79752
G1 X191.143 Y177.071 E.00371
G1 X158.857 Y185.722 E1.0748
G1 X158.857 Y183.713 E.06459
G1 X176.295 Y201.143 E.7928
G1 X191.143 Y145.73 E1.84474
G1 X191.143 Y143.356 E.07634
G1 X158.857 Y152.007 E1.0748
G1 X158.857 Y149.171 E.09117
G1 X191.143 Y181.457 E1.4682
G1 X191.143 Y185.5 E.13001
G1 X158.857 Y194.15 E1.0748
G1 X158.857 Y195.227 E.03462
G1 X164.773 Y201.143 E.26901
; WIPE_START
G1 X163.359 Y199.728 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.6 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 31 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z6.6 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer31 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 32/75
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
M73 P57 R25
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X184.666 Y201.869 Z6.8 F60000
G1 X169.348 Y201.143 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X167.72 Y201.143 E.05236
G1 X189.768 Y118.857 E2.73933
G1 X188.748 Y118.857 E.03279
G1 X158.857 Y126.867 E.99508
G1 X158.857 Y125.943 E.02968
G1 X191.143 Y158.229 E1.4682
G1 X191.143 Y160.36 E.06853
G1 X158.857 Y169.011 E1.0748
G1 X158.857 Y167.382 E.05236
M204 S10000
G1 X158.857 Y179.068 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y177.439 E.05236
G1 X191.143 Y168.789 E1.0748
G1 X191.143 Y169.743 E.03068
G1 X158.857 Y137.457 E1.4682
G1 X158.857 Y135.295 E.06952
G1 X191.143 Y126.645 E1.0748
G1 X191.143 Y123.687 E.09511
G1 X186.313 Y118.857 E.21962
G1 X181.339 Y118.857 E.15995
G1 X159.291 Y201.143 E2.73933
G1 X158.857 Y201.143 E.01394
G1 X158.857 Y199.948 E.03843
M204 S10000
G1 X191.143 Y177.217 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y185.868 E1.0748
G1 X158.857 Y183.513 E.07573
G1 X176.487 Y201.143 E.80172
G1 X176.148 Y201.143 E.01088
G1 X191.143 Y145.183 E1.86293
G1 X191.143 Y143.502 E.05406
G1 X158.857 Y152.153 E1.0748
G1 X158.857 Y148.971 E.10231
G1 X191.143 Y181.257 E1.4682
G1 X191.143 Y185.646 E.14115
G1 X158.857 Y194.297 E1.0748
G1 X158.857 Y195.027 E.02348
G1 X164.973 Y201.143 E.27811
G1 X164.766 Y201.143 E.00667
G1 X191.143 Y194.075 E.87811
G1 X191.143 Y192.771 E.04194
G1 X158.857 Y160.485 E1.4682
G1 X158.857 Y160.582 E.0031
G1 X191.143 Y151.931 E1.0748
G1 X191.143 Y146.715 E.16773
G1 X163.285 Y118.857 E1.26684
G1 X164.481 Y118.857 E.03846
G1 X158.857 Y139.847 E.69874
G1 X158.857 Y143.724 E.12469
G1 X191.143 Y135.073 E1.0748
G1 X191.143 Y135.201 E.0041
G1 X174.799 Y118.857 E.74323
G1 X172.91 Y118.857 E.06074
G1 X158.857 Y171.303 E1.74596
G1 X158.857 Y171.999 E.02238
G1 X188.001 Y201.143 E1.32532
G1 X184.577 Y201.143 E.11009
G1 X191.143 Y176.64 E.81571
G1 X191.143 Y175.012 E.05236
; WIPE_START
G1 X191.143 Y176.64 E-.61876
G1 X191.046 Y176.999 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.8 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 32 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z6.8 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer32 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 33/75
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X184.666 Y201.871 Z7 F60000
G1 X169.201 Y201.143 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X167.573 Y201.143 E.05236
G1 X189.621 Y118.857 E2.73933
G1 X189.294 Y118.857 E.01051
G1 X158.857 Y127.013 E1.01327
G1 X158.857 Y125.743 E.04082
G1 X191.143 Y158.029 E1.4682
G1 X191.143 Y160.506 E.07967
G1 X158.857 Y169.157 E1.0748
G1 X158.857 Y167.529 E.05236
M204 S10000
G1 X158.857 Y175.957 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y177.586 E.05236
G1 X191.143 Y168.935 E1.0748
G1 X191.143 Y169.543 E.01954
G1 X158.857 Y137.257 E1.4682
G1 X158.857 Y135.442 E.05838
G1 X191.143 Y126.791 E1.0748
G1 X191.143 Y123.487 E.10625
G1 X186.513 Y118.857 E.21053
G1 X181.193 Y118.857 E.17109
M73 P58 R25
G1 X159.144 Y201.143 E2.73933
G1 X158.857 Y201.143 E.00923
G1 X158.857 Y199.801 E.04313
M204 S10000
G1 X191.143 Y178.992 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y177.364 E.05236
G1 X158.857 Y186.015 E1.0748
G1 X158.857 Y183.313 E.08687
G1 X176.687 Y201.143 E.81081
G1 X176.002 Y201.143 E.02202
G1 X191.143 Y144.637 E1.88112
G1 X191.143 Y143.649 E.03178
G1 X158.857 Y152.299 E1.0748
G1 X158.857 Y148.771 E.11345
G1 X191.143 Y181.057 E1.4682
G1 X191.143 Y185.793 E.15229
G1 X158.857 Y194.443 E1.0748
G1 X158.857 Y194.827 E.01234
M73 P58 R24
G1 X165.173 Y201.143 E.2872
G1 X165.312 Y201.143 E.00447
G1 X191.143 Y194.221 E.85992
G1 X191.143 Y192.571 E.05308
G1 X158.857 Y160.285 E1.4682
G1 X158.857 Y160.728 E.01424
G1 X191.143 Y152.077 E1.0748
G1 X191.143 Y146.515 E.17887
G1 X163.485 Y118.857 E1.25774
G1 X164.335 Y118.857 E.02732
G1 X158.857 Y139.3 E.68055
G1 X158.857 Y143.871 E.14697
G1 X191.143 Y135.22 E1.0748
G1 X191.143 Y135.001 E.00704
G1 X174.999 Y118.857 E.73414
G1 X172.764 Y118.857 E.07188
G1 X158.857 Y170.757 E1.72777
G1 X158.857 Y171.799 E.03352
G1 X188.201 Y201.143 E1.33442
G1 X184.431 Y201.143 E.12123
G1 X191.143 Y176.093 E.8339
G1 X191.143 Y174.465 E.05236
; WIPE_START
G1 X191.143 Y176.093 E-.61876
G1 X191.046 Y176.453 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 33 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z7 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer33 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 34/75
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X191.695 Y194.621 Z7.2 F60000
G1 X191.143 Y187.567 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X191.143 Y185.939 E.05236
G1 X158.857 Y194.59 E1.0748
G1 X158.857 Y194.627 E.0012
G1 X165.373 Y201.143 E.2963
G1 X165.858 Y201.143 E.01561
G1 X191.143 Y194.368 E.84173
G1 X191.143 Y192.371 E.06422
G1 X158.857 Y160.085 E1.4682
G1 X158.857 Y160.875 E.02538
G1 X191.143 Y152.224 E1.0748
G1 X191.143 Y146.315 E.19001
G1 X163.685 Y118.857 E1.24865
G1 X164.189 Y118.857 E.01619
G1 X158.857 Y138.754 E.66236
G1 X158.857 Y140.382 E.05236
M204 S10000
G1 X158.857 Y154.074 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y152.446 E.05236
G1 X191.143 Y143.795 E1.0748
G1 X191.143 Y144.09 E.0095
G1 X175.856 Y201.143 E1.89931
G1 X176.887 Y201.143 E.03316
G1 X158.857 Y183.113 E.81991
G1 X158.857 Y186.161 E.098
G1 X191.143 Y177.51 E1.0748
G1 X191.143 Y180.857 E.10761
G1 X158.857 Y148.571 E1.4682
G1 X158.857 Y144.017 E.14645
G1 X191.143 Y135.366 E1.0748
G1 X191.143 Y134.801 E.01818
G1 X175.199 Y118.857 E.72504
G1 X172.617 Y118.857 E.08302
G1 X158.857 Y170.21 E1.70958
G1 X158.857 Y171.599 E.04466
G1 X188.401 Y201.143 E1.34351
G1 X184.284 Y201.143 E.13237
G1 X191.143 Y175.547 E.85209
G1 X191.143 Y173.919 E.05236
M204 S10000
G1 X169.055 Y201.143 F60000
G1 F4421.739
M204 S8000
G1 X167.427 Y201.143 E.05236
G1 X189.475 Y118.857 E2.73933
G1 X189.841 Y118.857 E.01176
G1 X158.857 Y127.159 E1.03146
G1 X158.857 Y125.543 E.05196
G1 X191.143 Y157.829 E1.4682
G1 X191.143 Y160.653 E.09081
G1 X158.857 Y169.303 E1.0748
M204 S10000
G1 X158.857 Y176.104 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y177.732 E.05236
G1 X191.143 Y169.081 E1.0748
G1 X191.143 Y169.343 E.0084
G1 X158.857 Y137.057 E1.4682
G1 X158.857 Y135.588 E.04725
G1 X191.143 Y126.937 E1.0748
G1 X191.143 Y123.287 E.11739
G1 X186.713 Y118.857 E.20143
G1 X181.046 Y118.857 E.18223
G1 X158.998 Y201.143 E2.73933
G1 X160.626 Y201.143 E.05236
; WIPE_START
G1 X158.998 Y201.143 E-.61876
G1 X159.094 Y200.784 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.2 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 34 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z7.2 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer34 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 35/75
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
M73 P59 R24
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X191.689 Y194.621 Z7.4 F60000
G1 X191.143 Y187.714 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X191.143 Y186.085 E.05236
G1 X158.857 Y194.736 E1.0748
G1 X158.857 Y194.427 E.00994
G1 X165.573 Y201.143 E.30539
G1 X166.405 Y201.143 E.02675
G1 X191.143 Y194.514 E.82354
G1 X191.143 Y192.171 E.07536
G1 X158.857 Y159.885 E1.4682
G1 X158.857 Y161.021 E.03652
G1 X191.143 Y152.37 E1.0748
G1 X191.143 Y146.115 E.20115
G1 X163.885 Y118.857 E1.23955
G1 X164.042 Y118.857 E.00505
G1 X158.857 Y138.207 E.64417
G1 X158.857 Y139.836 E.05236
M204 S10000
G1 X158.857 Y154.22 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y152.592 E.05236
G1 X191.143 Y143.941 E1.0748
M204 S10000
G1 X191.143 Y141.916 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y143.544 E.05236
G1 X175.709 Y201.143 E1.9175
G1 X177.087 Y201.143 E.0443
G1 X158.857 Y182.913 E.829
G1 X158.857 Y186.307 E.10914
G1 X191.143 Y177.657 E1.0748
G1 X191.143 Y180.657 E.09647
G1 X158.857 Y148.371 E1.4682
G1 X158.857 Y144.163 E.13531
G1 X191.143 Y135.513 E1.0748
G1 X191.143 Y134.601 E.02932
G1 X175.399 Y118.857 E.71595
G1 X172.471 Y118.857 E.09416
G1 X158.857 Y169.664 E1.69139
G1 X158.857 Y169.45 E.00689
G1 X191.143 Y160.799 E1.0748
G1 X191.143 Y157.629 E.10194
G1 X158.857 Y125.343 E1.4682
G1 X158.857 Y127.306 E.0631
G1 X190.387 Y118.857 E1.04965
G1 X191.143 Y118.857 E.02429
G1 X191.143 Y119.73 E.02807
M204 S10000
G1 X189.329 Y118.857 F60000
G1 F4421.739
M204 S8000
G1 X167.28 Y201.143 E2.73933
M204 S10000
G1 X160.464 Y201.143 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y201.143 E.05166
G1 X158.857 Y201.121 E.0007
G1 X180.9 Y118.857 E2.7386
G1 X186.913 Y118.857 E.19337
G1 X191.143 Y123.087 E.19234
G1 X191.143 Y127.084 E.12853
G1 X158.857 Y135.735 E1.0748
G1 X158.857 Y136.857 E.03611
G1 X191.143 Y169.143 E1.4682
G1 X191.143 Y169.228 E.00274
G1 X158.857 Y177.879 E1.0748
G1 X158.857 Y171.399 E.20835
G1 X188.601 Y201.143 E1.35261
G1 X184.138 Y201.143 E.14351
G1 X191.143 Y175.001 E.87028
G1 X191.143 Y173.372 E.05236
; WIPE_START
G1 X191.143 Y175.001 E-.61876
G1 X191.046 Y175.36 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.4 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 35 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z7.4 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer35 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 36/75
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change


M106 S48.45
; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P59 R23
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X191.794 Y194.614 Z7.6 F60000
G1 X191.143 Y184.603 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X191.143 Y186.232 E.05236
G1 X158.857 Y194.883 E1.0748
G1 X158.857 Y194.227 E.02108
G1 X165.773 Y201.143 E.31449
G1 X158.857 Y201.143 E.22238
G1 X158.857 Y200.574 E.01828
G1 X180.753 Y118.857 E2.72041
G1 X182.382 Y118.857 E.05236
M204 S10000
G1 X191.143 Y128.858 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y127.23 E.05236
M73 P60 R23
G1 X158.857 Y135.881 E1.0748
G1 X158.857 Y134.253 E.05236
M204 S10000
G1 X158.857 Y136.657 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y168.943 E1.4682
G1 X191.143 Y169.374 E.01388
G1 X158.857 Y178.025 E1.0748
G1 X158.857 Y171.199 E.21949
G1 X188.801 Y201.143 E1.3617
G1 X183.992 Y201.143 E.15465
G1 X191.143 Y174.454 E.88847
G1 X191.143 Y172.826 E.05236
M204 S10000
G1 X158.857 Y154.367 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y152.739 E.05236
G1 X191.143 Y144.088 E1.0748
M204 S10000
G1 X191.143 Y141.369 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y142.998 E.05236
G1 X175.563 Y201.143 E1.93569
G1 X177.287 Y201.143 E.05544
G1 X158.857 Y182.713 E.8381
G1 X158.857 Y186.454 E.12028
G1 X191.143 Y177.803 E1.0748
G1 X191.143 Y180.457 E.08533
G1 X158.857 Y148.171 E1.4682
G1 X158.857 Y144.31 E.12417
G1 X191.143 Y135.659 E1.0748
G1 X191.143 Y134.401 E.04046
G1 X175.599 Y118.857 E.70685
G1 X172.325 Y118.857 E.1053
G1 X158.857 Y169.118 E1.6732
G1 X158.857 Y169.596 E.01539
G1 X191.143 Y160.945 E1.0748
G1 X191.143 Y157.429 E.11308
G1 X158.857 Y125.143 E1.4682
G1 X158.857 Y127.452 E.07424
G1 X190.934 Y118.857 E1.06784
G1 X191.143 Y118.857 E.00672
G1 X191.143 Y122.887 E.12957
G1 X187.113 Y118.857 E.18324
G1 X189.182 Y118.857 E.06653
G1 X167.134 Y201.143 E2.73933
G1 X166.951 Y201.143 E.00588
G1 X191.143 Y194.661 E.80535
G1 X191.143 Y191.971 E.0865
G1 X158.857 Y159.685 E1.4682
G1 X158.857 Y161.167 E.04766
G1 X191.143 Y152.517 E1.0748
G1 X191.143 Y145.915 E.21229
G1 X164.085 Y118.857 E1.23046
G1 X163.896 Y118.857 E.00609
G1 X158.857 Y137.661 E.62598
G1 X158.857 Y139.289 E.05236
M204 S10000
G1 X158.857 Y120.652 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y119.023 E.05236
G1 X159.477 Y118.857 E.02062
G1 X161.105 Y118.857 E.05236
; WIPE_START
G1 X159.477 Y118.857 E-.61876
G1 X159.118 Y118.954 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.6 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 36 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z7.6 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer36 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 37/75
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X191.79 Y194.614 Z7.8 F60000
G1 X191.143 Y184.75 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X191.143 Y186.378 E.05236
G1 X158.857 Y195.029 E1.0748
G1 X158.857 Y194.027 E.03222
G1 X165.973 Y201.143 E.32358
G1 X158.857 Y201.143 E.22881
G1 X158.857 Y200.028 E.03585
G1 X180.607 Y118.857 E2.70222
G1 X182.235 Y118.857 E.05236
M204 S10000
G1 X161.652 Y118.857 F60000
G1 F4421.739
M204 S8000
G1 X160.023 Y118.857 E.05236
G1 X158.857 Y119.17 E.03882
G1 X158.857 Y120.798 E.05236
M204 S10000
G1 X158.857 Y138.743 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y137.114 E.05236
G1 X163.749 Y118.857 E.60779
G1 X164.285 Y118.857 E.01723
G1 X191.143 Y145.715 E1.22136
G1 X191.143 Y144.234 E.04761
G1 X158.857 Y152.885 E1.0748
G1 X158.857 Y154.513 E.05236
M204 S10000
G1 X191.143 Y151.035 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y152.663 E.05236
G1 X158.857 Y161.314 E1.0748
G1 X158.857 Y159.485 E.0588
G1 X191.143 Y191.771 E1.4682
G1 X191.143 Y194.807 E.09764
G1 X167.498 Y201.143 E.78716
G1 X166.987 Y201.143 E.0164
G1 X189.036 Y118.857 E2.73933
G1 X187.313 Y118.857 E.05539
G1 X191.143 Y122.687 E.17415
G1 X191.143 Y118.948 E.12023
G1 X158.857 Y127.599 E1.0748
G1 X158.857 Y124.943 E.08538
G1 X191.143 Y157.229 E1.4682
G1 X191.143 Y161.092 E.12422
G1 X158.857 Y169.743 E1.0748
G1 X158.857 Y168.571 E.03767
G1 X172.178 Y118.857 E1.65501
G1 X175.799 Y118.857 E.11644
G1 X191.143 Y134.201 E.69776
G1 X191.143 Y135.805 E.0516
G1 X158.857 Y144.456 E1.0748
G1 X158.857 Y147.971 E.11303
G1 X191.143 Y180.257 E1.4682
G1 X191.143 Y177.949 E.07419
G1 X158.857 Y186.6 E1.0748
G1 X158.857 Y182.513 E.13142
G1 X177.487 Y201.143 E.84719
G1 X175.416 Y201.143 E.06658
G1 X191.143 Y142.451 E1.95388
G1 X191.143 Y140.823 E.05236
M204 S10000
G1 X191.143 Y129.005 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y127.377 E.05236
G1 X158.857 Y136.027 E1.0748
M204 S10000
G1 X158.857 Y136.457 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y168.743 E1.4682
M73 P61 R23
G1 X191.143 Y169.521 E.02502
G1 X158.857 Y178.171 E1.0748
G1 X158.857 Y170.999 E.23063
G1 X189.001 Y201.143 E1.3708
G1 X183.845 Y201.143 E.16579
G1 X191.143 Y173.908 E.90667
G1 X191.143 Y172.28 E.05236
; WIPE_START
G1 X191.143 Y173.908 E-.61876
G1 X191.046 Y174.267 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.8 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 37 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z7.8 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer37 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 38/75
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change


M106 S51
; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X191.786 Y194.614 Z8 F60000
G1 X191.143 Y184.896 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X191.143 Y186.525 E.05236
G1 X158.857 Y195.175 E1.0748
G1 X158.857 Y193.827 E.04335
G1 X166.173 Y201.143 E.33268
G1 X166.841 Y201.143 E.02149
G1 X188.889 Y118.857 E2.73933
G1 X187.513 Y118.857 E.04425
G1 X191.143 Y122.487 E.16505
G1 X191.143 Y119.094 E.10909
G1 X158.857 Y127.745 E1.0748
G1 X158.857 Y124.743 E.09652
G1 X191.143 Y157.029 E1.4682
G1 X191.143 Y161.238 E.13536
G1 X158.857 Y169.889 E1.0748
G1 X158.857 Y170.799 E.02927
G1 X189.201 Y201.143 E1.37989
G1 X183.699 Y201.143 E.17693
G1 X191.143 Y173.361 E.92485
G1 X191.143 Y171.733 E.05236
M204 S10000
G1 X158.857 Y188.375 F60000
G1 F4421.739
M204 S8000
M73 P61 R22
G1 X158.857 Y186.747 E.05236
G1 X191.143 Y178.096 E1.0748
G1 X191.143 Y180.057 E.06305
G1 X158.857 Y147.771 E1.4682
G1 X158.857 Y144.603 E.1019
G1 X191.143 Y135.952 E1.0748
G1 X191.143 Y134.001 E.06274
G1 X175.999 Y118.857 E.68866
G1 X172.032 Y118.857 E.12758
G1 X158.857 Y168.025 E1.63682
G1 X158.857 Y169.653 E.05236
M204 S10000
G1 X158.857 Y154.66 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y153.031 E.05236
G1 X191.143 Y144.381 E1.0748
G1 X191.143 Y145.515 E.03647
G1 X164.485 Y118.857 E1.21227
G1 X163.603 Y118.857 E.02837
G1 X158.857 Y136.568 E.5896
G1 X158.857 Y138.196 E.05236
M204 S10000
G1 X158.857 Y120.945 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y119.316 E.05236
G1 X160.57 Y118.857 E.05701
G1 X162.198 Y118.857 E.05236
M204 S10000
G1 X182.089 Y118.857 F60000
G1 F4421.739
M204 S8000
G1 X180.461 Y118.857 E.05236
G1 X158.857 Y199.481 E2.68403
G1 X158.857 Y201.11 E.05236
M204 S10000
G1 X167.045 Y201.143 F60000
G1 F4421.739
M204 S8000
G1 X168.044 Y201.143 E.03214
G1 X191.143 Y194.953 E.76897
G1 X191.143 Y191.571 E.10878
G1 X158.857 Y159.285 E1.4682
G1 X158.857 Y161.46 E.06994
G1 X191.143 Y152.809 E1.0748
G1 X191.143 Y151.181 E.05236
M204 S10000
G1 X191.143 Y140.276 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y141.905 E.05236
G1 X175.27 Y201.143 E1.97207
G1 X177.687 Y201.143 E.07772
G1 X158.857 Y182.313 E.85629
G1 X158.857 Y178.318 E.12848
G1 X191.143 Y169.667 E1.0748
G1 X191.143 Y168.543 E.03616
G1 X158.857 Y136.257 E1.4682
G1 X158.857 Y136.174 E.00269
G1 X191.143 Y127.523 E1.0748
G1 X191.143 Y129.151 E.05236
; WIPE_START
G1 X191.143 Y127.523 E-.61876
G1 X190.784 Y127.619 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 38 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z8 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer38 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 39/75
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change


M106 S48.45
; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
M73 P62 R22
G1 X191.782 Y194.614 Z8.2 F60000
G1 X191.143 Y185.043 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X191.143 Y186.671 E.05236
G1 X158.857 Y195.322 E1.0748
G1 X158.857 Y193.627 E.05449
G1 X166.373 Y201.143 E.34177
G1 X166.695 Y201.143 E.01035
G1 X188.743 Y118.857 E2.73933
G1 X187.713 Y118.857 E.03311
G1 X191.143 Y122.287 E.15596
G1 X191.143 Y119.241 E.09795
G1 X158.857 Y127.891 E1.0748
G1 X158.857 Y124.543 E.10766
G1 X191.143 Y156.829 E1.4682
G1 X191.143 Y152.956 E.12454
G1 X158.857 Y161.607 E1.0748
G1 X158.857 Y159.085 E.08108
G1 X191.143 Y191.371 E1.4682
G1 X191.143 Y195.1 E.11992
G1 X168.59 Y201.143 E.75078
G1 X166.962 Y201.143 E.05236
M204 S10000
G1 X158.857 Y200.563 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y198.935 E.05236
G1 X180.314 Y118.857 E2.66584
G1 X176.199 Y118.857 E.13232
G1 X191.143 Y133.801 E.67956
G1 X191.143 Y136.098 E.07388
G1 X158.857 Y144.749 E1.0748
G1 X158.857 Y147.571 E.09076
G1 X191.143 Y179.857 E1.4682
G1 X191.143 Y178.242 E.05191
G1 X158.857 Y186.893 E1.0748
G1 X158.857 Y188.521 E.05236
M204 S10000
G1 X191.143 Y171.187 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y172.815 E.05236
G1 X183.552 Y201.143 E.94305
G1 X189.401 Y201.143 E.18807
G1 X158.857 Y170.599 E1.38899
G1 X158.857 Y170.035 E.01813
G1 X191.143 Y161.385 E1.0748
G1 X191.143 Y163.013 E.05236
M204 S10000
G1 X158.857 Y137.949 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y136.32 E.05236
G1 X191.143 Y127.669 E1.0748
G1 X191.143 Y129.298 E.05236
M204 S10000
G1 X191.143 Y139.73 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y141.358 E.05236
G1 X175.123 Y201.143 E1.99026
G1 X177.887 Y201.143 E.08886
G1 X158.857 Y182.113 E.86538
G1 X158.857 Y178.464 E.11734
G1 X191.143 Y169.813 E1.0748
G1 X191.143 Y168.343 E.04729
G1 X158.857 Y136.057 E1.4682
G1 X163.457 Y118.857 E.57252
G1 X164.685 Y118.857 E.03951
G1 X191.143 Y145.315 E1.20317
G1 X191.143 Y144.527 E.02533
G1 X158.857 Y153.178 E1.0748
G1 X158.857 Y154.806 E.05236
M204 S10000
G1 X158.857 Y169.107 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y167.478 E.05236
G1 X171.885 Y118.857 E1.61863
G1 X170.257 Y118.857 E.05236
M204 S10000
G1 X162.744 Y118.857 F60000
G1 F4421.739
M204 S8000
G1 X161.116 Y118.857 E.05236
G1 X158.857 Y119.463 E.0752
G1 X158.857 Y121.091 E.05236
; WIPE_START
G1 X158.857 Y119.463 E-.61876
G1 X159.216 Y119.366 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.2 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 39 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z8.2 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer39 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 40/75
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change


M106 S51
; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X191.777 Y194.615 Z8.4 F60000
G1 X191.143 Y185.189 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X191.143 Y186.817 E.05236
G1 X158.857 Y195.468 E1.0748
G1 X158.857 Y193.427 E.06563
G1 X166.573 Y201.143 E.35087
G1 X166.548 Y201.143 E.00079
G1 X188.597 Y118.857 E2.73933
G1 X187.913 Y118.857 E.02197
G1 X191.143 Y122.087 E.14686
G1 X191.143 Y119.387 E.08682
G1 X158.857 Y128.038 E1.0748
G1 X158.857 Y124.343 E.1188
G1 X191.143 Y156.629 E1.4682
G1 X191.143 Y153.102 E.1134
G1 X158.857 Y161.753 E1.0748
G1 X158.857 Y158.885 E.09222
G1 X191.143 Y191.171 E1.4682
G1 X191.143 Y195.246 E.13106
G1 X169.137 Y201.143 E.73259
G1 X167.509 Y201.143 E.05236
M204 S10000
G1 X158.857 Y200.017 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y198.389 E.05236
G1 X180.168 Y118.857 E2.64765
G1 X176.399 Y118.857 E.12118
G1 X191.143 Y133.601 E.67047
G1 X191.143 Y136.245 E.08502
G1 X158.857 Y144.895 E1.0748
G1 X158.857 Y147.371 E.07962
G1 X191.143 Y179.657 E1.4682
G1 X191.143 Y178.389 E.04077
G1 X158.857 Y187.039 E1.0748
G1 X158.857 Y188.668 E.05236
M204 S10000
G1 X158.857 Y168.56 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y166.932 E.05236
G1 X171.739 Y118.857 E1.60044
G1 X170.111 Y118.857 E.05236
M204 S10000
G1 X163.107 Y118.857 F60000
G1 F4421.739
M204 S8000
G1 X161.663 Y118.857 E.04644
G1 X158.857 Y119.609 E.09339
M73 P63 R22
G1 X158.857 Y121.237 E.05236
M204 S10000
G1 X158.857 Y138.095 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y136.467 E.05236
G1 X191.143 Y127.816 E1.0748
G1 X191.143 Y129.444 E.05236
M204 S10000
G1 X191.143 Y139.184 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y140.812 E.05236
G1 X174.977 Y201.143 E2.00845
G1 X178.087 Y201.143 E.1
G1 X158.857 Y181.913 E.87448
G1 X158.857 Y178.611 E.1062
G1 X191.143 Y169.96 E1.0748
G1 X191.143 Y168.143 E.05843
G1 X158.857 Y135.857 E1.4682
G1 X158.857 Y135.475 E.01229
G1 X163.31 Y118.857 E.55322
G1 X164.885 Y118.857 E.05065
G1 X191.143 Y145.115 E1.19408
G1 X191.143 Y144.673 E.01419
G1 X158.857 Y153.324 E1.0748
G1 X158.857 Y151.696 E.05236
M204 S10000
G1 X191.143 Y163.159 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y161.531 E.05236
G1 X158.857 Y170.182 E1.0748
G1 X158.857 Y170.399 E.00699
G1 X189.601 Y201.143 E1.39808
G1 X183.406 Y201.143 E.19921
G1 X191.143 Y172.269 E.96124
G1 X191.143 Y170.64 E.05236
; WIPE_START
M73 P63 R21
G1 X191.143 Y172.269 E-.61876
G1 X191.046 Y172.628 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.4 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 40 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z8.4 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer40 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 41/75
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X191.143 Y197.021 Z8.6 F60000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X191.143 Y195.393 E.05236
G1 X169.683 Y201.143 E.7144
G1 X168.055 Y201.143 E.05236
M204 S10000
G1 X158.857 Y199.471 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y197.842 E.05236
G1 X180.021 Y118.857 E2.62946
G1 X176.599 Y118.857 E.11004
G1 X191.143 Y133.401 E.66137
G1 X191.143 Y136.391 E.09616
G1 X158.857 Y145.042 E1.0748
G1 X158.857 Y147.171 E.06848
G1 X191.143 Y179.457 E1.4682
G1 X191.143 Y178.535 E.02963
G1 X158.857 Y187.186 E1.0748
G1 X158.857 Y188.814 E.05236
M204 S10000
G1 X158.857 Y168.014 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y166.386 E.05236
G1 X171.593 Y118.857 E1.58225
G1 X165.085 Y118.857 E.20925
G1 X191.143 Y144.915 E1.18498
G1 X191.143 Y144.82 E.00305
G1 X158.857 Y153.471 E1.0748
G1 X158.857 Y151.842 E.05236
M204 S10000
G1 X191.143 Y138.637 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y140.266 E.05236
G1 X174.831 Y201.143 E2.02664
G1 X178.287 Y201.143 E.11114
G1 X158.857 Y181.713 E.88357
G1 X158.857 Y178.757 E.09506
G1 X191.143 Y170.106 E1.0748
G1 X191.143 Y171.722 E.05197
G1 X183.259 Y201.143 E.97943
G1 X189.801 Y201.143 E.21035
G1 X158.857 Y170.199 E1.40718
G1 X158.857 Y170.328 E.00415
G1 X191.143 Y161.677 E1.0748
G1 X191.143 Y167.943 E.20147
G1 X158.857 Y135.657 E1.4682
G1 X158.857 Y134.929 E.02343
G1 X163.164 Y118.857 E.53503
G1 X162.209 Y118.857 E.0307
G1 X158.857 Y119.755 E.11158
G1 X158.857 Y124.143 E.1411
G1 X191.143 Y156.429 E1.4682
G1 X191.143 Y153.249 E.10226
G1 X158.857 Y161.899 E1.0748
G1 X158.857 Y158.685 E.10335
G1 X191.143 Y190.971 E1.4682
G1 X191.143 Y186.964 E.12884
G1 X158.857 Y195.615 E1.0748
G1 X158.857 Y193.227 E.07677
G1 X166.773 Y201.143 E.35996
G1 X166.402 Y201.143 E.01193
G1 X188.45 Y118.857 E2.73933
G1 X188.113 Y118.857 E.01083
G1 X191.143 Y121.887 E.13777
G1 X191.143 Y119.533 E.07568
G1 X158.857 Y128.184 E1.0748
G1 X158.857 Y129.813 E.05236
M204 S10000
G1 X158.857 Y138.241 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y136.613 E.05236
G1 X191.143 Y127.962 E1.0748
G1 X191.143 Y126.334 E.05236
; WIPE_START
G1 X191.143 Y127.962 E-.61876
G1 X190.784 Y128.058 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.6 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 41 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z8.6 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer41 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 42/75
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P64 R21
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X184.741 Y201.143 Z8.8 F60000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X183.113 Y201.143 E.05236
G1 X191.143 Y171.176 E.99762
G1 X191.143 Y170.253 E.02969
G1 X158.857 Y178.903 E1.0748
G1 X158.857 Y181.513 E.08392
G1 X178.487 Y201.143 E.89267
G1 X174.684 Y201.143 E.12228
G1 X191.143 Y139.719 E2.04483
G1 X191.143 Y136.537 E.10231
G1 X158.857 Y145.188 E1.0748
G1 X158.857 Y146.971 E.05734
G1 X191.143 Y179.257 E1.4682
G1 X191.143 Y178.681 E.0185
G1 X158.857 Y187.332 E1.0748
G1 X158.857 Y185.704 E.05236
M204 S10000
G1 X158.857 Y198.924 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y197.296 E.05236
G1 X179.875 Y118.857 E2.61127
G1 X176.799 Y118.857 E.0989
G1 X191.143 Y133.201 E.65228
G1 X191.143 Y128.109 E.16374
G1 X158.857 Y136.759 E1.0748
G1 X158.857 Y138.388 E.05236
M204 S10000
G1 X158.857 Y129.959 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y128.331 E.05236
G1 X191.143 Y119.68 E1.0748
G1 X191.143 Y121.687 E.06454
G1 X188.304 Y118.857 E.12889
G1 X166.255 Y201.143 E2.73933
G1 X166.973 Y201.143 E.02307
G1 X158.857 Y193.027 E.36906
G1 X158.857 Y195.761 E.08791
G1 X191.143 Y187.11 E1.0748
G1 X191.143 Y190.771 E.1177
G1 X158.857 Y158.485 E1.4682
G1 X158.857 Y162.046 E.11449
G1 X191.143 Y153.395 E1.0748
G1 X191.143 Y156.229 E.09112
G1 X158.857 Y123.943 E1.4682
G1 X158.857 Y119.902 E.12996
G1 X162.755 Y118.857 E.12977
G1 X163.017 Y118.857 E.00842
G1 X158.857 Y134.382 E.51684
G1 X158.857 Y135.457 E.03457
G1 X191.143 Y167.743 E1.4682
G1 X191.143 Y161.824 E.19033
G1 X158.857 Y170.475 E1.0748
G1 X158.857 Y169.999 E.01529
G1 X190.001 Y201.143 E1.41628
G1 X191.143 Y201.143 E.03672
G1 X191.143 Y195.539 E.18019
G1 X170.23 Y201.143 E.69621
G1 X168.601 Y201.143 E.05236
M204 S10000
G1 X158.857 Y167.467 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y165.839 E.05236
G1 X171.446 Y118.857 E1.56406
G1 X165.285 Y118.857 E.19811
G1 X191.143 Y144.715 E1.17589
G1 X191.143 Y144.966 E.00809
G1 X158.857 Y153.617 E1.0748
G1 X158.857 Y151.989 E.05236
; WIPE_START
G1 X158.857 Y153.617 E-.61876
G1 X159.216 Y153.521 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.8 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 42 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z8.8 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer42 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
;======== H2D 20250521========
; layer num/total_layer_count: 43/75
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X184.733 Y201.162 Z9 F60000
G1 X184.595 Y201.143 Z9
M73 P64 R20
G1 Z8.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X182.967 Y201.143 E.05236
G1 X191.143 Y170.629 E1.01581
G1 X191.143 Y170.399 E.00741
G1 X158.857 Y179.05 E1.0748
G1 X158.857 Y181.313 E.07278
G1 X178.687 Y201.143 E.90176
G1 X174.538 Y201.143 E.13342
G1 X191.143 Y139.173 E2.06302
G1 X191.143 Y136.684 E.08003
G1 X158.857 Y145.335 E1.0748
G1 X158.857 Y146.771 E.0462
G1 X191.143 Y179.057 E1.4682
G1 X191.143 Y178.828 E.00736
G1 X158.857 Y187.479 E1.0748
G1 X158.857 Y192.827 E.17199
G1 X167.173 Y201.143 E.37815
G1 X166.109 Y201.143 E.03421
G1 X188.157 Y118.857 E2.73933
G1 X188.513 Y118.857 E.01144
G1 X191.143 Y121.487 E.11958
G1 X191.143 Y119.826 E.0534
G1 X158.857 Y128.477 E1.0748
G1 X158.857 Y126.849 E.05236
M204 S10000
G1 X158.857 Y138.534 F60000
G1 F4421.739
M204 S8000
M73 P65 R20
G1 X158.857 Y136.906 E.05236
G1 X191.143 Y128.255 E1.0748
G1 X191.143 Y133.001 E.15261
G1 X176.999 Y118.857 E.64318
G1 X179.729 Y118.857 E.08776
G1 X158.857 Y196.749 E2.59308
G1 X158.857 Y198.378 E.05236
M204 S10000
G1 X158.857 Y195.907 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y187.257 E1.0748
G1 X191.143 Y190.571 E.10656
G1 X158.857 Y158.285 E1.4682
G1 X158.857 Y162.192 E.12563
G1 X191.143 Y153.541 E1.0748
G1 X191.143 Y156.029 E.07998
G1 X158.857 Y123.743 E1.4682
G1 X158.857 Y120.048 E.11882
G1 X163.302 Y118.857 E.14796
G1 X165.485 Y118.857 E.07021
G1 X191.143 Y144.515 E1.16679
G1 X191.143 Y145.113 E.01923
G1 X158.857 Y153.763 E1.0748
G1 X158.857 Y152.135 E.05236
M204 S10000
G1 X158.857 Y166.921 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y165.293 E.05236
G1 X171.3 Y118.857 E1.54587
G1 X169.671 Y118.857 E.05236
M204 S10000
G1 X162.871 Y118.857 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y133.836 E.49865
G1 X158.857 Y135.257 E.0457
G1 X191.143 Y167.543 E1.4682
G1 X191.143 Y161.97 E.17919
G1 X158.857 Y170.621 E1.0748
G1 X158.857 Y169.799 E.02643
G1 X190.201 Y201.143 E1.42537
G1 X191.143 Y201.143 E.03029
G1 X191.143 Y195.685 E.17548
G1 X170.776 Y201.143 E.67802
G1 X169.148 Y201.143 E.05236
; WIPE_START
G1 X170.776 Y201.143 E-.61876
G1 X171.135 Y201.046 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 43 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z9 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer43 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 44/75
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X184.675 Y201.721 Z9.2 F60000
G1 X176.02 Y201.143 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X174.391 Y201.143 E.05236
G1 X191.143 Y138.626 E2.08121
G1 X191.143 Y136.83 E.05776
G1 X158.857 Y145.481 E1.0748
G1 X158.857 Y146.571 E.03506
G1 X191.143 Y178.857 E1.4682
G1 X191.143 Y178.974 E.00378
G1 X158.857 Y187.625 E1.0748
G1 X158.857 Y192.627 E.16085
G1 X167.373 Y201.143 E.38725
G1 X165.963 Y201.143 E.04535
G1 X188.011 Y118.857 E2.73933
G1 X188.713 Y118.857 E.02258
G1 X191.143 Y121.287 E.11048
G1 X191.143 Y119.973 E.04226
G1 X158.857 Y128.623 E1.0748
G1 X158.857 Y126.995 E.05236
M204 S10000
G1 X162.725 Y118.857 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y133.29 E.48046
G1 X158.857 Y135.057 E.05684
G1 X191.143 Y167.343 E1.4682
G1 X191.143 Y170.083 E.08812
G1 X182.82 Y201.143 E1.034
G1 X178.887 Y201.143 E.12648
G1 X158.857 Y181.113 E.91086
G1 X158.857 Y179.196 E.06164
G1 X191.143 Y170.545 E1.0748
M204 S10000
G1 X191.143 Y160.488 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y162.117 E.05236
G1 X158.857 Y170.767 E1.0748
G1 X158.857 Y169.599 E.03756
G1 X190.401 Y201.143 E1.43447
G1 X191.143 Y201.143 E.02386
G1 X191.143 Y195.832 E.17078
G1 X171.322 Y201.143 E.65983
G1 X169.694 Y201.143 E.05236
M204 S10000
G1 X158.857 Y138.681 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y137.052 E.05236
G1 X191.143 Y128.401 E1.0748
G1 X191.143 Y132.801 E.14147
G1 X177.199 Y118.857 E.63409
G1 X179.582 Y118.857 E.07662
G1 X158.857 Y196.203 E2.57489
G1 X158.857 Y196.054 E.0048
G1 X191.143 Y187.403 E1.0748
G1 X191.143 Y190.371 E.09542
G1 X158.857 Y158.085 E1.4682
G1 X158.857 Y153.91 E.13427
G1 X191.143 Y145.259 E1.0748
G1 X191.143 Y144.315 E.03037
G1 X165.685 Y118.857 E1.1577
G1 X163.848 Y118.857 E.05907
G1 X158.857 Y120.195 E.16615
G1 X158.857 Y123.543 E.10768
G1 X191.143 Y155.829 E1.4682
G1 X191.143 Y153.688 E.06884
G1 X158.857 Y162.339 E1.0748
G1 X158.857 Y160.71 E.05236
M204 S10000
G1 X158.857 Y166.375 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y164.746 E.05236
G1 X171.153 Y118.857 E1.52768
G1 X172.782 Y118.857 E.05236
; WIPE_START
G1 X171.153 Y118.857 E-.61876
G1 X171.057 Y119.216 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.2 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 44 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z9.2 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer44 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 45/75
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
M73 P66 R20
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X184.674 Y201.726 Z9.4 F60000
G1 X175.873 Y201.143 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X174.245 Y201.143 E.05236
G1 X191.143 Y138.08 E2.0994
G1 X191.143 Y136.977 E.03548
G1 X158.857 Y145.627 E1.0748
G1 X158.857 Y146.371 E.02392
G1 X191.143 Y178.657 E1.4682
G1 X191.143 Y179.121 E.01492
G1 X158.857 Y187.771 E1.0748
G1 X158.857 Y192.427 E.14971
G1 X167.573 Y201.143 E.39635
G1 X165.816 Y201.143 E.05649
G1 X187.864 Y118.857 E2.73933
G1 X188.913 Y118.857 E.03372
G1 X191.143 Y121.087 E.10139
G1 X191.143 Y120.119 E.03112
G1 X158.857 Y128.77 E1.0748
G1 X158.857 Y127.142 E.05236
M204 S10000
G1 X160.95 Y118.857 F60000
G1 F4421.739
M204 S8000
G1 X162.578 Y118.857 E.05236
G1 X158.857 Y132.743 E.46227
G1 X158.857 Y134.857 E.06798
G1 X191.143 Y167.143 E1.4682
G1 X191.143 Y169.537 E.07698
G1 X182.674 Y201.143 E1.05219
G1 X179.087 Y201.143 E.11534
G1 X158.857 Y180.913 E.91995
G1 X158.857 Y179.343 E.0505
G1 X191.143 Y170.692 E1.0748
M204 S10000
G1 X191.143 Y160.635 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y162.263 E.05236
G1 X158.857 Y170.914 E1.0748
G1 X158.857 Y169.399 E.04871
G1 X190.601 Y201.143 E1.44356
G1 X191.143 Y201.143 E.01742
G1 X191.143 Y195.978 E.16607
G1 X171.869 Y201.143 E.64164
G1 X170.241 Y201.143 E.05236
M204 S10000
G1 X158.857 Y138.827 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y137.199 E.05236
G1 X191.143 Y128.548 E1.0748
G1 X191.143 Y132.601 E.13033
G1 X177.399 Y118.857 E.62499
G1 X179.436 Y118.857 E.06548
G1 X158.857 Y195.657 E2.5567
G1 X158.857 Y196.2 E.01748
G1 X191.143 Y187.549 E1.0748
G1 X191.143 Y190.171 E.08428
M73 P66 R19
G1 X158.857 Y157.885 E1.4682
G1 X158.857 Y154.056 E.12313
G1 X191.143 Y145.405 E1.0748
G1 X191.143 Y144.115 E.04151
G1 X165.885 Y118.857 E1.1486
G1 X164.395 Y118.857 E.04793
G1 X158.857 Y120.341 E.18434
G1 X158.857 Y123.343 E.09654
G1 X191.143 Y155.629 E1.4682
G1 X191.143 Y153.834 E.0577
G1 X158.857 Y162.485 E1.0748
G1 X158.857 Y160.857 E.05236
M204 S10000
G1 X158.857 Y165.828 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y164.2 E.05236
G1 X171.007 Y118.857 E1.50948
G1 X172.635 Y118.857 E.05236
; WIPE_START
G1 X171.007 Y118.857 E-.61876
G1 X170.911 Y119.216 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.4 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 45 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z9.4 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer45 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 46/75
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X184.674 Y201.73 Z9.6 F60000
G1 X175.727 Y201.143 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X174.099 Y201.143 E.05236
G1 X191.143 Y137.533 E2.11759
G1 X191.143 Y137.123 E.0132
G1 X158.857 Y145.774 E1.0748
G1 X158.857 Y146.171 E.01278
G1 X191.143 Y178.457 E1.4682
G1 X191.143 Y179.267 E.02606
G1 X158.857 Y187.918 E1.0748
G1 X158.857 Y192.227 E.13857
G1 X167.773 Y201.143 E.40544
G1 X165.67 Y201.143 E.06763
G1 X187.718 Y118.857 E2.73933
G1 X189.113 Y118.857 E.04486
M73 P67 R19
G1 X191.143 Y120.887 E.09229
G1 X191.143 Y120.265 E.01998
G1 X158.857 Y128.916 E1.0748
G1 X158.857 Y127.288 E.05236
M204 S10000
G1 X160.803 Y118.857 F60000
G1 F4421.739
M204 S8000
G1 X162.432 Y118.857 E.05236
G1 X158.857 Y132.197 E.44408
G1 X158.857 Y134.657 E.07912
G1 X191.143 Y166.943 E1.4682
G1 X191.143 Y168.99 E.06584
G1 X182.527 Y201.143 E1.07038
G1 X179.287 Y201.143 E.1042
G1 X158.857 Y180.713 E.92905
G1 X158.857 Y179.489 E.03936
G1 X191.143 Y170.838 E1.0748
G1 X191.143 Y172.467 E.05236
M204 S10000
G1 X191.143 Y160.781 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y162.409 E.05236
G1 X158.857 Y171.06 E1.0748
G1 X158.857 Y169.199 E.05984
G1 X190.801 Y201.143 E1.45266
G1 X190.956 Y201.143 E.005
G1 X191.143 Y200.447 E.02316
G1 X191.143 Y196.125 E.13899
G1 X172.415 Y201.143 E.62345
G1 X170.787 Y201.143 E.05236
M204 S10000
G1 X158.857 Y138.973 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y137.345 E.05236
G1 X191.143 Y128.694 E1.0748
G1 X191.143 Y132.401 E.11919
G1 X177.599 Y118.857 E.6159
G1 X179.289 Y118.857 E.05435
G1 X158.857 Y195.11 E2.53851
G1 X158.857 Y196.347 E.03976
G1 X191.143 Y187.696 E1.0748
G1 X191.143 Y189.971 E.07314
G1 X158.857 Y157.685 E1.4682
G1 X158.857 Y154.203 E.11199
G1 X191.143 Y145.552 E1.0748
G1 X191.143 Y143.915 E.05265
G1 X166.085 Y118.857 E1.13951
G1 X164.941 Y118.857 E.03679
G1 X158.857 Y120.487 E.20253
G1 X158.857 Y123.143 E.08541
G1 X191.143 Y155.429 E1.4682
G1 X191.143 Y153.981 E.04656
G1 X158.857 Y162.631 E1.0748
M204 S10000
G1 X158.857 Y165.282 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y163.653 E.05236
G1 X170.86 Y118.857 E1.49129
G1 X172.489 Y118.857 E.05236
; WIPE_START
G1 X170.86 Y118.857 E-.61876
G1 X170.764 Y119.216 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.6 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 46 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z9.6 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer46 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 47/75
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X184.671 Y201.778 Z9.8 F60000
G1 X173.952 Y201.143 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X191.143 Y136.987 E2.13578
G1 X191.143 Y137.269 E.00908
G1 X158.857 Y145.92 E1.0748
G1 X158.857 Y145.971 E.00164
G1 X191.143 Y178.257 E1.4682
G1 X191.143 Y179.413 E.0372
G1 X158.857 Y188.064 E1.0748
G1 X158.857 Y192.027 E.12743
G1 X167.973 Y201.143 E.41454
G1 X165.523 Y201.143 E.07877
G1 X187.572 Y118.857 E2.73933
G1 X189.313 Y118.857 E.056
G1 X191.143 Y120.687 E.0832
G1 X191.143 Y120.412 E.00884
G1 X158.857 Y129.063 E1.0748
G1 X158.857 Y127.434 E.05236
M204 S10000
G1 X160.657 Y118.857 F60000
G1 F4421.739
M204 S8000
G1 X162.285 Y118.857 E.05236
G1 X158.857 Y131.65 E.42589
G1 X158.857 Y134.457 E.09026
G1 X191.143 Y166.743 E1.4682
G1 X191.143 Y168.444 E.0547
G1 X182.381 Y201.143 E1.08857
G1 X179.487 Y201.143 E.09307
G1 X158.857 Y180.513 E.93814
G1 X158.857 Y179.635 E.02822
G1 X191.143 Y170.985 E1.0748
G1 X191.143 Y172.613 E.05236
M204 S10000
G1 X191.143 Y160.928 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y162.556 E.05236
G1 X158.857 Y171.207 E1.0748
G1 X158.857 Y168.999 E.07098
G1 X191.001 Y201.143 E1.46175
G1 X190.81 Y201.143 E.00614
G1 X191.143 Y199.9 E.04135
G1 X191.143 Y196.271 E.11671
G1 X172.962 Y201.143 E.60526
G1 X171.333 Y201.143 E.05236
M204 S10000
G1 X158.857 Y139.12 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y137.491 E.05236
G1 X191.143 Y128.841 E1.0748
G1 X191.143 Y132.201 E.10805
G1 X177.799 Y118.857 E.6068
G1 X179.143 Y118.857 E.04321
G1 X158.857 Y194.564 E2.52032
G1 X158.857 Y196.493 E.06204
G1 X191.143 Y187.842 E1.0748
G1 X191.143 Y189.771 E.06201
G1 X158.857 Y157.485 E1.4682
G1 X158.857 Y154.349 E.10085
G1 X191.143 Y145.698 E1.0748
G1 X191.143 Y143.715 E.06378
G1 X166.285 Y118.857 E1.13041
G1 X165.487 Y118.857 E.02566
G1 X158.857 Y120.634 E.22072
G1 X158.857 Y122.943 E.07427
G1 X191.143 Y155.229 E1.4682
G1 X191.143 Y154.127 E.03542
G1 X158.857 Y162.778 E1.0748
G1 X158.857 Y163.107 E.01059
G1 X170.714 Y118.857 E1.4731
G1 X172.342 Y118.857 E.05236
; WIPE_START
M73 P68 R19
G1 X170.714 Y118.857 E-.61876
G1 X170.618 Y119.216 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.8 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 47 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z9.8 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer47 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.200001
;======== H2D 20250521========
; layer num/total_layer_count: 48/75
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
M73 P68 R18
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X191.993 Y194.603 Z10 F60000
G1 X191.143 Y172.759 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X191.143 Y171.131 E.05236
G1 X158.857 Y179.782 E1.0748
G1 X158.857 Y180.313 E.01709
G1 X179.687 Y201.143 E.94724
G1 X182.235 Y201.143 E.08193
G1 X191.143 Y167.897 E1.10676
G1 X191.143 Y166.543 E.04356
G1 X158.857 Y134.257 E1.4682
G1 X158.857 Y131.104 E.1014
G1 X162.139 Y118.857 E.4077
G1 X160.511 Y118.857 E.05236
M204 S10000
G1 X158.857 Y127.581 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y129.209 E.05236
G1 X191.143 Y120.558 E1.0748
G1 X191.143 Y120.487 E.0023
G1 X189.513 Y118.857 E.0741
G1 X187.425 Y118.857 E.06714
G1 X165.377 Y201.143 E2.73933
G1 X168.173 Y201.143 E.08991
G1 X158.857 Y191.827 E.42363
G1 X158.857 Y188.211 E.11629
G1 X191.143 Y179.56 E1.0748
G1 X191.143 Y178.057 E.04834
G1 X158.857 Y145.771 E1.4682
G1 X158.857 Y146.067 E.0095
G1 X191.143 Y137.416 E1.0748
M204 S10000
G1 X191.143 Y134.812 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y136.441 E.05236
G1 X173.806 Y201.143 E2.15397
G1 X173.508 Y201.143 E.00957
G1 X191.143 Y196.417 E.58707
G1 X191.143 Y199.354 E.09443
G1 X190.663 Y201.143 E.05954
G1 X191.143 Y201.143 E.01541
G1 X191.143 Y201.084 E.00187
G1 X158.857 Y168.799 E1.4682
G1 X158.857 Y171.353 E.08212
G1 X191.143 Y162.702 E1.0748
G1 X191.143 Y161.074 E.05236
M204 S10000
G1 X158.857 Y139.266 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y137.638 E.05236
G1 X191.143 Y128.987 E1.0748
G1 X191.143 Y132.001 E.09691
G1 X177.999 Y118.857 E.59771
G1 X178.996 Y118.857 E.03207
G1 X158.857 Y194.017 E2.50213
G1 X158.857 Y196.639 E.08432
G1 X191.143 Y187.989 E1.0748
G1 X191.143 Y189.571 E.05087
G1 X158.857 Y157.285 E1.4682
G1 X158.857 Y154.495 E.08971
G1 X191.143 Y145.845 E1.0748
G1 X191.143 Y143.515 E.07492
G1 X166.485 Y118.857 E1.12132
G1 X166.034 Y118.857 E.01452
G1 X158.857 Y120.78 E.23891
G1 X158.857 Y122.743 E.06313
G1 X191.143 Y155.029 E1.4682
G1 X191.143 Y154.273 E.02428
G1 X158.857 Y162.924 E1.0748
G1 X158.857 Y162.561 E.01169
G1 X170.568 Y118.857 E1.45491
G1 X172.196 Y118.857 E.05236
; WIPE_START
G1 X170.568 Y118.857 E-.61876
G1 X170.471 Y119.216 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 48 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z10 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer48 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 49/75
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X191.992 Y194.603 Z10.2 F60000
G1 X191.143 Y172.906 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X191.143 Y171.277 E.05236
G1 X158.857 Y179.928 E1.0748
G1 X158.857 Y180.113 E.00595
G1 X179.887 Y201.143 E.95633
G1 X182.088 Y201.143 E.07079
M73 P69 R18
G1 X191.143 Y167.351 E1.12495
G1 X191.143 Y166.343 E.03242
G1 X158.857 Y134.057 E1.4682
G1 X158.857 Y130.558 E.11254
G1 X161.992 Y118.857 E.38951
G1 X160.364 Y118.857 E.05236
M204 S10000
G1 X172.05 Y118.857 F60000
G1 F4421.739
M204 S8000
G1 X170.421 Y118.857 E.05236
G1 X158.857 Y162.014 E1.43672
G1 X158.857 Y163.071 E.03397
G1 X191.143 Y154.42 E1.0748
G1 X191.143 Y154.829 E.01314
G1 X158.857 Y122.543 E1.4682
G1 X158.857 Y120.927 E.05199
G1 X166.58 Y118.857 E.2571
G1 X166.685 Y118.857 E.00338
G1 X191.143 Y143.315 E1.11222
G1 X191.143 Y145.991 E.08606
G1 X158.857 Y154.642 E1.0748
G1 X158.857 Y157.085 E.07857
G1 X191.143 Y189.371 E1.4682
G1 X191.143 Y188.135 E.03973
G1 X158.857 Y196.786 E1.0748
G1 X158.857 Y193.471 E.1066
G1 X178.85 Y118.857 E2.48394
G1 X178.199 Y118.857 E.02093
G1 X191.143 Y131.801 E.58861
G1 X191.143 Y129.134 E.08577
G1 X158.857 Y137.784 E1.0748
G1 X158.857 Y139.413 E.05236
M204 S10000
G1 X158.857 Y129.356 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y120.705 E1.0748
G1 X191.143 Y120.287 E.01344
G1 X189.713 Y118.857 E.06501
G1 X187.279 Y118.857 E.07828
G1 X165.231 Y201.143 E2.73933
G1 X168.373 Y201.143 E.10104
G1 X158.857 Y191.627 E.43273
G1 X158.857 Y188.357 E.10515
G1 X191.143 Y179.706 E1.0748
G1 X191.143 Y177.857 E.05948
G1 X158.857 Y145.571 E1.4682
G1 X158.857 Y146.213 E.02064
G1 X191.143 Y137.562 E1.0748
G1 X191.143 Y139.191 E.05236
M204 S10000
G1 X191.143 Y134.266 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y135.894 E.05236
G1 X173.659 Y201.143 E2.17216
G1 X174.055 Y201.143 E.01271
G1 X191.143 Y196.564 E.56888
G1 X191.143 Y198.808 E.07215
G1 X190.517 Y201.143 E.07773
G1 X191.143 Y201.143 E.02012
G1 X191.143 Y200.884 E.0083
G1 X158.857 Y168.599 E1.4682
G1 X158.857 Y171.499 E.09326
G1 X191.143 Y162.849 E1.0748
G1 X191.143 Y161.22 E.05236
; WIPE_START
G1 X191.143 Y162.849 E-.61876
G1 X190.784 Y162.945 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.2 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 49 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z10.2 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer49 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 10
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 50/75
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X191.99 Y194.603 Z10.4 F60000
G1 X191.143 Y173.052 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X191.143 Y171.424 E.05236
G1 X158.857 Y180.075 E1.0748
G1 X158.857 Y179.913 E.00519
G1 X180.087 Y201.143 E.96543
G1 X181.942 Y201.143 E.05965
G1 X191.143 Y166.805 E1.14314
G1 X191.143 Y166.143 E.02128
G1 X158.857 Y133.857 E1.4682
G1 X158.857 Y130.011 E.12368
G1 X161.846 Y118.857 E.37132
G1 X160.218 Y118.857 E.05236
M204 S10000
G1 X171.903 Y118.857 F60000
G1 F4421.739
M204 S8000
G1 X170.275 Y118.857 E.05236
G1 X158.857 Y161.468 E1.41853
G1 X158.857 Y163.217 E.05625
G1 X191.143 Y154.566 E1.0748
G1 X191.143 Y154.629 E.00201
G1 X158.857 Y122.343 E1.4682
G1 X158.857 Y121.073 E.04085
G1 X167.127 Y118.857 E.27529
G1 X166.885 Y118.857 E.00776
G1 X191.143 Y143.115 E1.10313
G1 X191.143 Y146.138 E.0972
G1 X158.857 Y154.788 E1.0748
G1 X158.857 Y156.885 E.06743
G1 X191.143 Y189.171 E1.4682
G1 X191.143 Y188.281 E.02859
G1 X158.857 Y196.932 E1.0748
G1 X158.857 Y192.925 E.12887
G1 X178.704 Y118.857 E2.46575
G1 X178.399 Y118.857 E.00979
M73 P69 R17
G1 X191.143 Y131.601 E.57952
G1 X191.143 Y129.28 E.07463
G1 X158.857 Y137.931 E1.0748
G1 X158.857 Y139.559 E.05236
M204 S10000
G1 X158.857 Y129.502 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y120.851 E1.0748
G1 X191.143 Y120.087 E.02458
G1 X189.913 Y118.857 E.05591
G1 X187.132 Y118.857 E.08942
G1 X165.084 Y201.143 E2.73933
G1 X168.573 Y201.143 E.11218
G1 X158.857 Y191.427 E.44182
G1 X158.857 Y188.503 E.09401
G1 X191.143 Y179.853 E1.0748
G1 X191.143 Y177.657 E.07062
G1 X158.857 Y145.371 E1.4682
G1 X158.857 Y146.36 E.03178
G1 X191.143 Y137.709 E1.0748
G1 X191.143 Y139.337 E.05236
M204 S10000
M73 P70 R17
G1 X191.143 Y133.72 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y135.348 E.05236
G1 X173.513 Y201.143 E2.19035
G1 X174.601 Y201.143 E.03498
G1 X191.143 Y196.71 E.55068
G1 X191.143 Y198.261 E.04987
G1 X190.371 Y201.143 E.09592
G1 X191.143 Y201.143 E.02483
G1 X191.143 Y200.684 E.01473
G1 X158.857 Y168.399 E1.4682
G1 X158.857 Y171.646 E.1044
G1 X191.143 Y162.995 E1.0748
G1 X191.143 Y161.367 E.05236
; WIPE_START
G1 X191.143 Y162.995 E-.61876
G1 X190.784 Y163.091 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.4 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 50 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z10.4 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer50 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 10.2
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 51/75
; update layer progress
M73 L51
M991 S0 P50 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X191.989 Y194.603 Z10.6 F60000
G1 X191.143 Y173.199 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X191.143 Y171.57 E.05236
G1 X158.857 Y180.221 E1.0748
G1 X158.857 Y179.713 E.01633
G1 X180.287 Y201.143 E.97452
G1 X181.795 Y201.143 E.04851
G1 X191.143 Y166.258 E1.16133
G1 X191.143 Y165.943 E.01015
G1 X158.857 Y133.657 E1.4682
G1 X158.857 Y138.077 E.14212
G1 X191.143 Y129.426 E1.0748
G1 X191.143 Y131.401 E.06349
G1 X178.599 Y118.857 E.57042
G1 X178.557 Y118.857 E.00135
G1 X158.857 Y192.378 E2.44756
G1 X158.857 Y197.079 E.15115
G1 X191.143 Y188.428 E1.0748
G1 X191.143 Y188.971 E.01745
G1 X158.857 Y156.685 E1.4682
G1 X158.857 Y154.935 E.05629
G1 X191.143 Y146.284 E1.0748
G1 X191.143 Y142.915 E.10834
G1 X167.085 Y118.857 E1.09403
M204 S10000
G1 X169.301 Y118.857 F60000
G1 F4421.739
M204 S8000
G1 X167.673 Y118.857 E.05236
G1 X158.857 Y121.22 E.29348
G1 X158.857 Y122.143 E.02971
G1 X191.143 Y154.429 E1.4682
G1 X191.143 Y154.713 E.00913
G1 X158.857 Y163.364 E1.0748
G1 X158.857 Y160.921 E.07853
G1 X170.128 Y118.857 E1.40034
G1 X171.757 Y118.857 E.05236
M204 S10000
G1 X160.071 Y118.857 F60000
G1 F4421.739
M204 S8000
G1 X161.7 Y118.857 E.05236
G1 X158.857 Y129.465 E.35313
G1 X158.857 Y129.648 E.0059
G1 X191.143 Y120.998 E1.0748
G1 X191.143 Y119.887 E.03572
G1 X190.113 Y118.857 E.04682
G1 X186.986 Y118.857 E.10056
G1 X164.938 Y201.143 E2.73933
G1 X168.773 Y201.143 E.12332
G1 X158.857 Y191.227 E.45092
M204 S10000
G1 X158.857 Y187.022 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y188.65 E.05236
G1 X191.143 Y179.999 E1.0748
G1 X191.143 Y177.457 E.08176
G1 X158.857 Y145.171 E1.4682
G1 X158.857 Y146.506 E.04291
G1 X191.143 Y137.855 E1.0748
G1 X191.143 Y139.483 E.05236
M204 S10000
G1 X191.143 Y133.173 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y134.801 E.05236
G1 X173.367 Y201.143 E2.20854
G1 X175.147 Y201.143 E.05726
G1 X191.143 Y196.857 E.53249
G1 X191.143 Y197.715 E.02759
G1 X190.224 Y201.143 E.11411
G1 X191.143 Y201.143 E.02953
G1 X191.143 Y200.484 E.02116
G1 X158.857 Y168.199 E1.4682
G1 X158.857 Y171.792 E.11554
G1 X191.143 Y163.142 E1.0748
G1 X191.143 Y161.513 E.05236
; WIPE_START
G1 X191.143 Y163.142 E-.61876
G1 X190.784 Y163.238 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.6 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 51 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z10.6 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer51 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 10.4
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 52/75
; update layer progress
M73 L52
M991 S0 P51 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
M73 P71 R17
G1 X191.987 Y194.604 Z10.8 F60000
G1 X191.143 Y173.345 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X191.143 Y171.717 E.05236
G1 X158.857 Y180.368 E1.0748
G1 X158.857 Y179.513 E.02747
G1 X180.487 Y201.143 E.98362
G1 X181.649 Y201.143 E.03737
G1 X191.143 Y165.712 E1.17952
G1 X191.143 Y165.743 E.00099
G1 X158.857 Y133.457 E1.4682
G1 X158.857 Y138.224 E.15326
G1 X191.143 Y129.573 E1.0748
G1 X191.143 Y131.201 E.05235
G1 X178.799 Y118.857 E.56133
G1 X178.411 Y118.857 E.01249
G1 X158.857 Y191.832 E2.42937
G1 X158.857 Y197.225 E.17343
G1 X191.143 Y188.574 E1.0748
G1 X191.143 Y188.771 E.00631
G1 X158.857 Y156.485 E1.4682
G1 X158.857 Y155.081 E.04515
G1 X191.143 Y146.43 E1.0748
G1 X191.143 Y142.715 E.11948
G1 X167.285 Y118.857 E1.08494
M204 S10000
G1 X163.182 Y118.857 F60000
G1 F4421.739
M204 S8000
G1 X161.553 Y118.857 E.05236
G1 X158.857 Y128.918 E.33494
G1 X158.857 Y129.795 E.02818
G1 X191.143 Y121.144 E1.0748
G1 X191.143 Y119.687 E.04686
G1 X190.313 Y118.857 E.03772
G1 X186.84 Y118.857 E.1117
G1 X164.791 Y201.143 E2.73933
G1 X168.973 Y201.143 E.13446
G1 X158.857 Y191.027 E.46001
M204 S10000
G1 X158.857 Y187.168 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y188.796 E.05236
G1 X191.143 Y180.146 E1.0748
G1 X191.143 Y177.257 E.0929
G1 X158.857 Y144.971 E1.4682
G1 X158.857 Y146.652 E.05405
G1 X191.143 Y138.002 E1.0748
G1 X191.143 Y139.63 E.05236
M204 S10000
G1 X191.143 Y132.627 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y134.255 E.05236
G1 X173.22 Y201.143 E2.22674
G1 X175.694 Y201.143 E.07954
G1 X191.143 Y197.003 E.5143
G1 X191.143 Y197.168 E.00531
G1 X190.078 Y201.143 E.13231
G1 X191.143 Y201.143 E.03424
G1 X191.143 Y200.284 E.0276
G1 X158.857 Y167.999 E1.4682
G1 X158.857 Y171.939 E.12668
G1 X191.143 Y163.288 E1.0748
G1 X191.143 Y161.66 E.05236
M204 S10000
G1 X158.857 Y162.003 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y160.375 E.05236
G1 X169.982 Y118.857 E1.38215
G1 X168.22 Y118.857 E.05668
G1 X158.857 Y121.366 E.31167
G1 X158.857 Y121.943 E.01857
G1 X191.143 Y154.229 E1.4682
G1 X191.143 Y154.859 E.02027
G1 X158.857 Y163.51 E1.0748
G1 X158.857 Y165.138 E.05236
; WIPE_START
G1 X158.857 Y163.51 E-.61876
G1 X159.216 Y163.414 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.8 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 52 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z10.8 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer52 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 10.6
; LAYER_HEIGHT: 0.200001
;======== H2D 20250521========
; layer num/total_layer_count: 53/75
; update layer progress
M73 L53
M991 S0 P52 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
M73 P71 R16
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X191.143 Y197.15 Z11 F60000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X176.24 Y201.143 E.49611
G1 X173.074 Y201.143 E.10182
G1 X191.143 Y133.709 E2.24493
G1 X191.143 Y132.08 E.05236
M204 S10000
G1 X191.143 Y139.776 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y138.148 E.05236
G1 X158.857 Y146.799 E1.0748
G1 X158.857 Y144.771 E.06519
G1 X191.143 Y177.057 E1.4682
G1 X191.143 Y180.292 E.10404
G1 X158.857 Y188.943 E1.0748
G1 X158.857 Y187.314 E.05236
M204 S10000
G1 X158.857 Y190.827 F60000
G1 F4421.739
M204 S8000
G1 X169.173 Y201.143 E.46911
G1 X164.645 Y201.143 E.1456
G1 X186.693 Y118.857 E2.73933
G1 X190.513 Y118.857 E.12284
G1 X191.143 Y119.487 E.02862
G1 X191.143 Y121.29 E.058
G1 X158.857 Y129.941 E1.0748
G1 X158.857 Y128.372 E.05046
G1 X161.407 Y118.857 E.31675
G1 X167.485 Y118.857 E.19546
G1 X191.143 Y142.515 E1.07584
G1 X191.143 Y146.577 E.13062
G1 X158.857 Y155.228 E1.0748
G1 X158.857 Y156.285 E.03401
G1 X191.143 Y188.571 E1.4682
G1 X191.143 Y188.721 E.00483
G1 X158.857 Y197.372 E1.0748
G1 X158.857 Y191.285 E.19571
G1 X178.264 Y118.857 E2.41118
G1 X178.999 Y118.857 E.02363
G1 X191.143 Y131.001 E.55223
G1 X191.143 Y129.719 E.04121
G1 X158.857 Y138.37 E1.0748
G1 X158.857 Y133.257 E.1644
G1 X191.143 Y165.543 E1.4682
G1 X191.143 Y165.165 E.01213
M73 P72 R16
G1 X181.503 Y201.143 E1.19771
G1 X180.687 Y201.143 E.02623
G1 X158.857 Y179.313 E.99271
G1 X158.857 Y180.514 E.03861
G1 X191.143 Y171.863 E1.0748
G1 X191.143 Y170.235 E.05236
M204 S10000
G1 X191.143 Y161.806 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y163.434 E.05236
G1 X158.857 Y172.085 E1.0748
G1 X158.857 Y173.713 E.05236
M204 S10000
G1 X158.857 Y161.457 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y159.829 E.05236
G1 X169.836 Y118.857 E1.36396
G1 X168.766 Y118.857 E.0344
G1 X158.857 Y121.512 E.32986
G1 X158.857 Y121.743 E.00743
G1 X191.143 Y154.029 E1.4682
G1 X191.143 Y155.006 E.03141
G1 X158.857 Y163.656 E1.0748
G1 X158.857 Y167.799 E.13322
G1 X191.143 Y200.084 E1.4682
G1 X191.143 Y201.143 E.03403
G1 X189.931 Y201.143 E.03895
G1 X191.143 Y196.622 E.1505
G1 X191.143 Y194.994 E.05236
; WIPE_START
G1 X191.143 Y196.622 E-.61876
G1 X191.046 Y196.981 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 53 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z11 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer53 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 10.8
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 54/75
; update layer progress
M73 L54
M991 S0 P53 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X191.143 Y197.296 Z11.2 F60000
G1 Z10.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X176.787 Y201.143 E.47792
G1 X175.158 Y201.143 E.05236
M204 S10000
G1 X191.143 Y194.447 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y196.076 E.05236
G1 X189.785 Y201.143 E.16869
G1 X191.143 Y201.143 E.04366
G1 X191.143 Y199.884 E.04046
G1 X158.857 Y167.599 E1.4682
G1 X158.857 Y163.803 E.12208
G1 X191.143 Y155.152 E1.0748
G1 X191.143 Y153.829 E.04255
G1 X158.857 Y121.543 E1.4682
G1 X158.857 Y121.659 E.00371
G1 X169.312 Y118.857 E.34805
G1 X169.689 Y118.857 E.01212
G1 X158.857 Y159.282 E1.34577
G1 X158.857 Y160.911 E.05236
M204 S10000
G1 X158.857 Y173.86 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y172.232 E.05236
G1 X191.143 Y163.581 E1.0748
G1 X191.143 Y164.619 E.03338
G1 X181.356 Y201.143 E1.2159
G1 X180.887 Y201.143 E.01509
G1 X158.857 Y179.113 E1.00181
G1 X158.857 Y180.66 E.04975
G1 X191.143 Y172.01 E1.0748
G1 X191.143 Y170.381 E.05236
M204 S10000
G1 X191.143 Y165.343 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y133.057 E1.4682
G1 X158.857 Y138.516 E.17554
G1 X191.143 Y129.866 E1.0748
G1 X191.143 Y130.801 E.03007
G1 X179.199 Y118.857 E.54314
G1 X178.118 Y118.857 E.03477
G1 X158.857 Y190.739 E2.39299
G1 X158.857 Y190.627 E.00359
G1 X169.373 Y201.143 E.4782
G1 X172.927 Y201.143 E.1143
G1 X191.143 Y133.162 E2.26312
G1 X191.143 Y131.534 E.05236
M204 S10000
G1 X191.143 Y148.351 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y146.723 E.05236
G1 X158.857 Y155.374 E1.0748
G1 X158.857 Y156.085 E.02287
G1 X191.143 Y188.371 E1.4682
G1 X191.143 Y188.867 E.01597
G1 X158.857 Y197.518 E1.0748
G1 X158.857 Y201.143 E.11656
G1 X164.499 Y201.143 E.1814
G1 X186.547 Y118.857 E2.73933
G1 X190.713 Y118.857 E.13398
G1 X191.143 Y119.287 E.01953
G1 X191.143 Y121.437 E.06913
G1 X158.857 Y130.088 E1.0748
G1 X158.857 Y127.826 E.07274
G1 X161.26 Y118.857 E.29856
G1 X167.685 Y118.857 E.2066
G1 X191.143 Y142.315 E1.06674
G1 X191.143 Y138.294 E.12928
G1 X158.857 Y146.945 E1.0748
G1 X158.857 Y144.571 E.07633
G1 X191.143 Y176.857 E1.4682
G1 X191.143 Y180.438 E.11518
G1 X158.857 Y189.089 E1.0748
G1 X158.857 Y187.461 E.05236
; WIPE_START
G1 X158.857 Y189.089 E-.61876
G1 X159.216 Y188.993 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.2 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 54 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z11.2 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer54 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 11
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 55/75
; update layer progress
M73 L55
M991 S0 P54 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
M73 P73 R16
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X188.01 Y201.143 Z11.4 F60000
G1 Z11
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X189.638 Y201.143 E.05236
G1 X191.143 Y195.529 E.18688
G1 X191.143 Y193.901 E.05236
M204 S10000
G1 X175.705 Y201.143 F60000
G1 F4421.739
M204 S8000
G1 X177.333 Y201.143 E.05236
G1 X191.143 Y197.442 E.45973
G1 X191.143 Y199.684 E.0721
G1 X158.857 Y167.399 E1.4682
G1 X158.857 Y163.949 E.11094
G1 X191.143 Y155.298 E1.0748
G1 X191.143 Y153.629 E.05369
G1 X158.857 Y121.343 E1.4682
G1 X158.857 Y121.805 E.01485
G1 X169.859 Y118.857 E.36624
G1 X169.543 Y118.857 E.01016
G1 X158.857 Y158.736 E1.32758
G1 X158.857 Y160.364 E.05236
M204 S10000
G1 X158.857 Y174.006 F60000
G1 F4421.739
M204 S8000
M73 P73 R15
G1 X158.857 Y172.378 E.05236
G1 X191.143 Y163.727 E1.0748
G1 X191.143 Y164.072 E.0111
G1 X181.21 Y201.143 E1.23409
G1 X181.087 Y201.143 E.00395
G1 X158.857 Y178.913 E1.0109
G1 X158.857 Y180.807 E.06089
G1 X191.143 Y172.156 E1.0748
G1 X191.143 Y170.528 E.05236
M204 S10000
G1 X191.143 Y165.143 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y132.857 E1.4682
G1 X158.857 Y130.234 E.08436
G1 X191.143 Y121.583 E1.0748
G1 X191.143 Y119.087 E.08027
G1 X190.913 Y118.857 E.01043
G1 X186.4 Y118.857 E.14512
G1 X164.352 Y201.143 E2.73933
G1 X158.857 Y201.143 E.17669
G1 X158.857 Y197.664 E.11185
G1 X191.143 Y189.014 E1.0748
G1 X191.143 Y188.171 E.02711
G1 X158.857 Y155.885 E1.4682
G1 X158.857 Y155.52 E.01173
G1 X191.143 Y146.87 E1.0748
G1 X191.143 Y148.498 E.05236
M204 S10000
G1 X191.143 Y130.987 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y132.616 E.05236
G1 X172.781 Y201.143 E2.28131
G1 X169.573 Y201.143 E.10316
G1 X158.857 Y190.427 E.4873
G1 X158.857 Y190.192 E.00755
G1 X177.972 Y118.857 E2.3748
G1 X179.399 Y118.857 E.04591
G1 X191.143 Y130.601 E.53404
G1 X191.143 Y130.012 E.01893
G1 X158.857 Y138.663 E1.0748
G1 X158.857 Y137.034 E.05236
M204 S10000
G1 X158.857 Y128.907 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y127.279 E.05236
G1 X161.114 Y118.857 E.28037
G1 X167.885 Y118.857 E.21774
G1 X191.143 Y142.115 E1.05765
G1 X191.143 Y138.441 E.11814
G1 X158.857 Y147.092 E1.0748
G1 X158.857 Y144.371 E.08747
G1 X191.143 Y176.657 E1.4682
G1 X191.143 Y180.585 E.12632
G1 X158.857 Y189.236 E1.0748
; WIPE_START
G1 X160.789 Y188.718 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.4 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 55 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z11.4 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer55 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 11.2
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 56/75
; update layer progress
M73 L56
M991 S0 P55 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X187.864 Y201.143 Z11.6 F60000
G1 Z11.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X189.492 Y201.143 E.05236
G1 X191.143 Y194.983 E.20507
G1 X191.143 Y193.354 E.05236
M204 S10000
G1 X191.143 Y182.359 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y180.731 E.05236
G1 X158.857 Y189.382 E1.0748
G1 X158.857 Y189.646 E.00849
G1 X177.825 Y118.857 E2.35661
G1 X179.599 Y118.857 E.05705
G1 X191.143 Y130.401 E.52495
G1 X191.143 Y130.158 E.00779
G1 X158.857 Y138.809 E1.0748
G1 X158.857 Y137.181 E.05236
M204 S10000
G1 X158.857 Y128.361 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y126.733 E.05236
G1 X160.968 Y118.857 E.26218
G1 X168.085 Y118.857 E.22888
G1 X191.143 Y141.915 E1.04855
G1 X191.143 Y138.587 E.107
G1 X158.857 Y147.238 E1.0748
G1 X158.857 Y144.171 E.09861
G1 X191.143 Y176.457 E1.4682
G1 X191.143 Y172.302 E.13358
G1 X158.857 Y180.953 E1.0748
G1 X158.857 Y178.713 E.07203
G1 X181.287 Y201.143 E1.02
G1 X181.063 Y201.143 E.00719
G1 X191.143 Y163.526 E1.25228
G1 X191.143 Y163.874 E.01117
G1 X158.857 Y172.524 E1.0748
G1 X158.857 Y174.153 E.05236
M204 S10000
G1 X158.857 Y159.818 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y158.189 E.05236
G1 X169.396 Y118.857 E1.30939
M204 S10000
G1 X172.033 Y118.857 F60000
G1 F4421.739
M204 S8000
M73 P74 R15
G1 X170.405 Y118.857 E.05236
G1 X158.857 Y121.952 E.38443
G1 X158.857 Y121.143 E.02599
G1 X191.143 Y153.429 E1.4682
G1 X191.143 Y155.445 E.06483
G1 X158.857 Y164.096 E1.0748
G1 X158.857 Y167.199 E.0998
G1 X191.143 Y199.484 E1.4682
G1 X191.143 Y197.589 E.06096
G1 X177.879 Y201.143 E.44154
G1 X176.251 Y201.143 E.05236
M204 S10000
G1 X162.577 Y201.143 F60000
G1 F4421.739
M204 S8000
G1 X164.206 Y201.143 E.05236
G1 X186.254 Y118.857 E2.73933
G1 X191.143 Y118.857 E.1572
G1 X191.143 Y121.73 E.09236
G1 X158.857 Y130.38 E1.0748
G1 X158.857 Y132.657 E.07322
G1 X191.143 Y164.943 E1.4682
G1 X191.143 Y166.571 E.05236
M204 S10000
G1 X191.143 Y148.644 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y147.016 E.05236
G1 X158.857 Y155.667 E1.0748
G1 X158.857 Y155.685 E.0006
G1 X191.143 Y187.971 E1.4682
G1 X191.143 Y189.16 E.03825
G1 X158.857 Y197.811 E1.0748
G1 X158.857 Y190.227 E.24386
G1 X169.773 Y201.143 E.49639
G1 X172.635 Y201.143 E.09202
G1 X191.143 Y132.069 E2.2995
G1 X191.143 Y130.604 E.04711
; WIPE_START
G1 X191.143 Y132.069 E-.55673
G1 X191.004 Y132.586 E-.20327
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.6 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 56 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z11.6 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer56 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 11.4
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 57/75
; update layer progress
M73 L57
M991 S0 P56 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X187.717 Y201.143 Z11.8 F60000
G1 Z11.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X189.346 Y201.143 E.05236
G1 X191.143 Y194.436 E.22326
G1 X191.143 Y192.808 E.05236
M204 S10000
G1 X191.143 Y182.506 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y180.878 E.05236
G1 X158.857 Y189.528 E1.0748
G1 X158.857 Y189.1 E.01378
G1 X177.679 Y118.857 E2.33842
G1 X179.799 Y118.857 E.06819
G1 X191.143 Y130.201 E.51585
G1 X191.143 Y130.305 E.00334
G1 X158.857 Y138.956 E1.0748
G1 X158.857 Y137.327 E.05236
M204 S10000
G1 X158.857 Y127.815 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y126.186 E.05236
G1 X160.821 Y118.857 E.24399
G1 X162.449 Y118.857 E.05236
M204 S10000
G1 X172.58 Y118.857 F60000
G1 F4421.739
M204 S8000
G1 X170.952 Y118.857 E.05236
G1 X158.857 Y122.098 E.40262
G1 X158.857 Y120.943 E.03713
G1 X191.143 Y153.229 E1.4682
G1 X191.143 Y155.591 E.07597
G1 X158.857 Y164.242 E1.0748
G1 X158.857 Y166.999 E.08866
G1 X191.143 Y199.284 E1.4682
G1 X191.143 Y197.735 E.04982
G1 X178.426 Y201.143 E.42335
G1 X176.797 Y201.143 E.05236
M204 S10000
G1 X162.431 Y201.143 F60000
G1 F4421.739
M204 S8000
G1 X164.059 Y201.143 E.05236
G1 X186.108 Y118.857 E2.73933
G1 X191.143 Y118.857 E.16191
G1 X191.143 Y121.876 E.09707
G1 X158.857 Y130.527 E1.0748
G1 X158.857 Y132.457 E.06208
G1 X191.143 Y164.743 E1.4682
G1 X191.143 Y166.371 E.05236
M204 S10000
G1 X191.143 Y164.02 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y172.671 E1.0748
G1 X158.857 Y174.299 E.05236
M204 S10000
G1 X158.857 Y159.271 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y157.643 E.05236
G1 X169.25 Y118.857 E1.2912
G1 X168.285 Y118.857 E.03102
G1 X191.143 Y141.715 E1.03946
G1 X191.143 Y138.734 E.09586
G1 X158.857 Y147.384 E1.0748
G1 X158.857 Y143.971 E.10975
G1 X191.143 Y176.257 E1.4682
G1 X191.143 Y172.449 E.12245
G1 X158.857 Y181.1 E1.0748
G1 X158.857 Y178.513 E.08317
G1 X181.487 Y201.143 E1.02909
G1 X180.917 Y201.143 E.01833
G1 X191.143 Y162.98 E1.27047
G1 X191.143 Y161.351 E.05236
M204 S10000
G1 X191.143 Y148.791 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y147.162 E.05236
G1 X158.857 Y155.813 E1.0748
G1 X158.857 Y155.485 E.01054
G1 X191.143 Y187.771 E1.4682
G1 X191.143 Y189.306 E.04939
G1 X158.857 Y197.957 E1.0748
G1 X158.857 Y190.027 E.255
M73 P74 R14
G1 X169.973 Y201.143 E.50549
G1 X172.488 Y201.143 E.08088
G1 X191.143 Y131.523 E2.31769
G1 X191.143 Y130.508 E.03263
; WIPE_START
G1 X191.143 Y131.523 E-.38557
G1 X190.888 Y132.475 E-.37444
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.8 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 57 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z11.8 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer57 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 11.6
; LAYER_HEIGHT: 0.200001
;======== H2D 20250521========
; layer num/total_layer_count: 58/75
; update layer progress
M73 L58
M991 S0 P57 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
M73 P75 R14
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X187.571 Y201.143 Z12 F60000
G1 Z11.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X189.199 Y201.143 E.05236
G1 X191.143 Y193.89 E.24145
G1 X191.143 Y192.262 E.05236
M204 S10000
G1 X191.143 Y182.652 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y181.024 E.05236
G1 X158.857 Y189.675 E1.0748
G1 X158.857 Y189.827 E.0049
G1 X170.173 Y201.143 E.51458
G1 X172.342 Y201.143 E.06974
G1 X191.143 Y130.977 E2.33588
G1 X191.143 Y130.655 E.01035
M204 S10000
G1 X191.143 Y145.68 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y147.309 E.05236
G1 X158.857 Y155.96 E1.0748
M204 S10000
G1 X158.857 Y153.657 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y155.285 E.05236
G1 X191.143 Y187.571 E1.4682
G1 X191.143 Y189.453 E.06053
G1 X158.857 Y198.104 E1.0748
G1 X158.857 Y201.143 E.09772
G1 X163.913 Y201.143 E.16257
G1 X185.961 Y118.857 E2.73933
G1 X191.143 Y118.857 E.16662
G1 X191.143 Y122.022 E.10178
G1 X158.857 Y130.673 E1.0748
G1 X158.857 Y132.257 E.05094
G1 X191.143 Y164.543 E1.4682
G1 X191.143 Y164.166 E.0121
G1 X158.857 Y172.817 E1.0748
G1 X158.857 Y171.189 E.05236
M204 S10000
G1 X158.857 Y158.725 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y157.097 E.05236
G1 X169.104 Y118.857 E1.27301
G1 X168.485 Y118.857 E.01988
G1 X191.143 Y141.515 E1.03036
G1 X191.143 Y138.88 E.08472
G1 X158.857 Y147.531 E1.0748
G1 X158.857 Y143.771 E.12089
G1 X191.143 Y176.057 E1.4682
G1 X191.143 Y172.595 E.11131
G1 X158.857 Y181.246 E1.0748
G1 X158.857 Y178.313 E.09431
G1 X181.687 Y201.143 E1.03819
G1 X180.77 Y201.143 E.02947
G1 X191.143 Y162.433 E1.28866
G1 X191.143 Y160.805 E.05236
M204 S10000
G1 X177.344 Y201.143 F60000
G1 F4421.739
M204 S8000
G1 X178.972 Y201.143 E.05236
G1 X191.143 Y197.882 E.40516
G1 X191.143 Y199.084 E.03868
G1 X158.857 Y166.799 E1.4682
G1 X158.857 Y164.388 E.07752
G1 X191.143 Y155.738 E1.0748
G1 X191.143 Y153.029 E.08711
G1 X158.857 Y120.743 E1.4682
G1 X158.857 Y122.244 E.04827
G1 X171.498 Y118.857 E.42081
G1 X173.126 Y118.857 E.05236
M204 S10000
G1 X162.303 Y118.857 F60000
G1 F4421.739
M204 S8000
G1 X160.675 Y118.857 E.05236
G1 X158.857 Y125.64 E.2258
G1 X158.857 Y127.268 E.05236
M204 S10000
G1 X158.857 Y137.474 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y139.102 E.05236
G1 X191.143 Y130.451 E1.0748
G1 X191.143 Y130.001 E.01448
G1 X179.999 Y118.857 E.50676
G1 X177.532 Y118.857 E.07933
G1 X158.857 Y188.553 E2.32023
G1 X158.857 Y189.471 E.02952
; WIPE_START
G1 X158.857 Y188.553 E-.34882
G1 X159.137 Y187.508 E-.41118
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 58 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z12 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer58 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 11.8
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 59/75
; update layer progress
M73 L59
M991 S0 P58 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X191.462 Y194.643 Z12.2 F60000
G1 X191.143 Y191.715 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X191.143 Y193.344 E.05236
G1 X189.053 Y201.143 E.25964
G1 X181.887 Y201.143 E.23043
G1 X158.857 Y178.113 E1.04729
G1 X158.857 Y181.392 E.10545
G1 X191.143 Y172.742 E1.0748
G1 X191.143 Y175.857 E.10017
G1 X158.857 Y143.571 E1.4682
G1 X158.857 Y147.677 E.13203
G1 X191.143 Y139.026 E1.0748
G1 X191.143 Y141.315 E.07358
G1 X168.685 Y118.857 E1.02127
G1 X168.957 Y118.857 E.00874
G1 X158.857 Y156.55 E1.25482
G1 X158.857 Y158.179 E.05236
M204 S10000
G1 X158.857 Y156.106 F60000
G1 F4421.739
M204 S8000
M73 P76 R14
G1 X191.143 Y147.455 E1.0748
G1 X191.143 Y145.827 E.05236
M204 S10000
G1 X191.143 Y160.259 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y161.887 E.05236
G1 X180.624 Y201.143 E1.30685
M204 S10000
G1 X177.89 Y201.143 F60000
G1 F4421.739
M204 S8000
G1 X179.519 Y201.143 E.05236
G1 X191.143 Y198.028 E.38697
G1 X191.143 Y198.884 E.02754
G1 X158.857 Y166.599 E1.4682
G1 X158.857 Y164.535 E.06639
G1 X191.143 Y155.884 E1.0748
G1 X191.143 Y152.829 E.09825
G1 X158.857 Y120.543 E1.4682
G1 X158.857 Y122.391 E.0594
G1 X172.044 Y118.857 E.439
G1 X173.673 Y118.857 E.05236
M204 S10000
G1 X162.157 Y118.857 F60000
G1 F4421.739
M204 S8000
G1 X160.528 Y118.857 E.05236
G1 X158.857 Y125.094 E.20761
G1 X158.857 Y126.722 E.05236
M204 S10000
G1 X158.857 Y137.62 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y139.248 E.05236
G1 X191.143 Y130.598 E1.0748
G1 X191.143 Y130.43 E.00538
G1 X172.195 Y201.143 E2.35407
G1 X170.373 Y201.143 E.0586
G1 X158.857 Y189.627 E.52368
G1 X158.857 Y189.821 E.00624
G1 X191.143 Y181.17 E1.0748
G1 X191.143 Y182.799 E.05236
M204 S10000
G1 X158.857 Y189.424 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y188.007 E.04556
G1 X177.386 Y118.857 E2.30204
G1 X180.199 Y118.857 E.09046
G1 X191.143 Y129.801 E.49766
G1 X191.143 Y122.169 E.24542
G1 X158.857 Y130.82 E1.0748
G1 X158.857 Y132.057 E.0398
G1 X191.143 Y164.343 E1.4682
G1 X191.143 Y164.313 E.00096
G1 X158.857 Y172.964 E1.0748
G1 X158.857 Y171.335 E.05236
M204 S10000
G1 X158.857 Y153.457 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y155.085 E.05236
G1 X191.143 Y187.371 E1.4682
G1 X191.143 Y189.599 E.07167
G1 X158.857 Y198.25 E1.0748
G1 X158.857 Y201.143 E.09302
G1 X163.766 Y201.143 E.15786
G1 X185.815 Y118.857 E2.73933
G1 X187.443 Y118.857 E.05236
; WIPE_START
G1 X185.815 Y118.857 E-.61876
G1 X185.719 Y119.216 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.2 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 59 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z12.2 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer59 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 12
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 60/75
; update layer progress
M73 L60
M991 S0 P59 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
M73 P76 R13
G1 X191.503 Y194.638 Z12.4 F60000
G1 X191.143 Y191.169 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X191.143 Y192.797 E.05236
G1 X188.906 Y201.143 E.27783
G1 X182.087 Y201.143 E.21929
G1 X158.857 Y177.913 E1.05638
G1 X158.857 Y181.539 E.11659
G1 X191.143 Y172.888 E1.0748
G1 X191.143 Y175.657 E.08903
G1 X158.857 Y143.371 E1.4682
G1 X158.857 Y139.395 E.12787
G1 X191.143 Y130.744 E1.0748
M204 S10000
G1 X158.857 Y126.175 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y124.547 E.05236
G1 X160.382 Y118.857 E.18941
G1 X162.01 Y118.857 E.05236
M204 S10000
G1 X174.219 Y118.857 F60000
G1 F4421.739
M204 S8000
G1 X172.591 Y118.857 E.05236
G1 X158.857 Y122.537 E.45719
G1 X158.857 Y120.343 E.07054
G1 X191.143 Y152.629 E1.4682
G1 X191.143 Y156.03 E.10939
G1 X158.857 Y164.681 E1.0748
G1 X158.857 Y166.399 E.05525
G1 X191.143 Y198.684 E1.4682
G1 X191.143 Y198.174 E.0164
G1 X180.065 Y201.143 E.36878
G1 X178.437 Y201.143 E.05236
M204 S10000
G1 X180.478 Y201.143 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y161.34 E1.32504
G1 X191.143 Y159.712 E.05236
M204 S10000
G1 X191.143 Y145.973 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y147.602 E.05236
G1 X158.857 Y156.252 E1.0748
G1 X158.857 Y156.004 E.008
G1 X168.811 Y118.857 E1.23663
G1 X168.885 Y118.857 E.0024
G1 X191.143 Y141.115 E1.01217
G1 X191.143 Y139.173 E.06244
G1 X158.857 Y147.824 E1.0748
G1 X158.857 Y149.452 E.05236
M204 S10000
G1 X158.857 Y154.885 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y187.171 E1.4682
G1 X191.143 Y189.746 E.08281
G1 X158.857 Y198.396 E1.0748
G1 X158.857 Y200.941 E.08183
G1 X159.059 Y201.143 E.00917
G1 X163.62 Y201.143 E.14667
G1 X185.668 Y118.857 E2.73933
G1 X191.143 Y118.857 E.17603
G1 X191.143 Y122.315 E.11119
G1 X158.857 Y130.966 E1.0748
G1 X158.857 Y131.857 E.02866
G1 X191.143 Y164.143 E1.4682
G1 X191.143 Y164.459 E.01018
G1 X158.857 Y173.11 E1.0748
G1 X158.857 Y171.482 E.05236
M204 S10000
G1 X158.857 Y189.089 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y187.46 E.05236
G1 X177.24 Y118.857 E2.28384
G1 X180.399 Y118.857 E.1016
G1 X191.143 Y129.601 E.48857
G1 X191.143 Y129.884 E.0091
G1 X172.049 Y201.143 E2.37226
G1 X170.573 Y201.143 E.04746
G1 X158.857 Y189.427 E.53277
G1 X158.857 Y189.968 E.01738
M73 P77 R13
G1 X191.143 Y181.317 E1.0748
G1 X191.143 Y182.945 E.05236
; WIPE_START
G1 X191.143 Y181.317 E-.61876
G1 X190.784 Y181.413 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.4 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 60 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z12.4 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer60 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 12.2
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 61/75
; update layer progress
M73 L61
M991 S0 P60 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X185.227 Y199.338 Z12.6 F60000
G1 X158.857 Y188.542 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X158.857 Y186.914 E.05236
G1 X177.093 Y118.857 E2.26565
G1 X180.599 Y118.857 E.11274
G1 X191.143 Y129.401 E.47947
G1 X191.143 Y129.337 E.00204
G1 X171.902 Y201.143 E2.39045
G1 X170.773 Y201.143 E.03632
G1 X158.857 Y189.227 E.54187
G1 X158.857 Y190.114 E.02852
G1 X191.143 Y181.463 E1.0748
G1 X191.143 Y186.971 E.17709
G1 X158.857 Y154.685 E1.4682
M204 S10000
G1 X158.857 Y149.598 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y147.97 E.05236
G1 X191.143 Y139.319 E1.0748
G1 X191.143 Y140.915 E.0513
G1 X169.085 Y118.857 E1.00308
G1 X168.664 Y118.857 E.01354
G1 X158.857 Y155.457 E1.21844
G1 X158.857 Y156.399 E.03027
G1 X191.143 Y147.748 E1.0748
G1 X191.143 Y146.12 E.05236
M204 S10000
G1 X191.143 Y159.166 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y160.794 E.05236
G1 X180.331 Y201.143 E1.34323
G1 X180.611 Y201.143 E.00901
G1 X191.143 Y198.321 E.35059
G1 X191.143 Y198.484 E.00526
G1 X158.857 Y166.199 E1.4682
G1 X158.857 Y164.828 E.04411
G1 X191.143 Y156.177 E1.0748
G1 X191.143 Y152.429 E.12053
G1 X158.857 Y120.143 E1.4682
G1 X158.857 Y122.684 E.08168
G1 X173.137 Y118.857 E.47539
G1 X174.766 Y118.857 E.05236
M204 S10000
G1 X161.864 Y118.857 F60000
G1 F4421.739
M204 S8000
G1 X160.236 Y118.857 E.05236
G1 X158.857 Y124.001 E.17122
G1 X158.857 Y125.629 E.05236
M204 S10000
G1 X191.143 Y132.519 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y130.89 E.05236
G1 X158.857 Y139.541 E1.0748
G1 X158.857 Y143.171 E.11673
G1 X191.143 Y175.457 E1.4682
G1 X191.143 Y173.034 E.07789
G1 X158.857 Y181.685 E1.0748
G1 X158.857 Y177.713 E.12773
G1 X182.287 Y201.143 E1.06548
G1 X188.76 Y201.143 E.20815
G1 X191.143 Y192.251 E.29602
G1 X191.143 Y189.892 E.07585
G1 X158.857 Y198.543 E1.0748
G1 X158.857 Y200.741 E.07069
G1 X159.259 Y201.143 E.01826
G1 X163.474 Y201.143 E.13553
G1 X185.522 Y118.857 E2.73933
G1 X191.143 Y118.857 E.18074
G1 X191.143 Y122.462 E.1159
G1 X158.857 Y131.112 E1.0748
G1 X158.857 Y131.657 E.01752
G1 X191.143 Y163.943 E1.4682
G1 X191.143 Y164.606 E.02132
G1 X158.857 Y173.256 E1.0748
G1 X158.857 Y171.628 E.05236
; WIPE_START
G1 X158.857 Y173.256 E-.61876
G1 X159.216 Y173.16 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.6 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 61 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z12.6 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer61 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 12.4
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 62/75
; update layer progress
M73 L62
M991 S0 P61 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X185.268 Y199.24 Z12.8 F60000
G1 X158.857 Y187.996 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
M73 P78 R13
G1 X158.857 Y186.368 E.05236
G1 X176.947 Y118.857 E2.24746
G1 X173.684 Y118.857 E.10493
G1 X158.857 Y122.83 E.49358
M204 S10000
G1 X158.857 Y125.083 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y123.454 E.05236
G1 X160.089 Y118.857 E.15303
G1 X158.857 Y118.857 E.03961
G1 X158.857 Y119.943 E.03492
G1 X191.143 Y152.229 E1.4682
G1 X191.143 Y156.323 E.13167
G1 X158.857 Y164.974 E1.0748
G1 X158.857 Y165.999 E.03297
G1 X191.143 Y198.284 E1.4682
G1 X191.143 Y198.467 E.00588
G1 X181.158 Y201.143 E.3324
G1 X180.185 Y201.143 E.03129
G1 X191.143 Y160.248 E1.36142
G1 X191.143 Y158.619 E.05236
M204 S10000
G1 X191.143 Y146.266 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y147.894 E.05236
G1 X158.857 Y156.545 E1.0748
G1 X158.857 Y154.911 E.05255
G1 X168.518 Y118.857 E1.20025
G1 X169.285 Y118.857 E.02468
G1 X191.143 Y140.715 E.99398
G1 X191.143 Y139.466 E.04017
G1 X158.857 Y148.116 E1.0748
G1 X158.857 Y149.745 E.05236
M204 S10000
G1 X158.857 Y154.485 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y186.771 E1.4682
G1 X191.143 Y181.61 E.16596
G1 X158.857 Y190.26 E1.0748
G1 X158.857 Y189.027 E.03966
G1 X170.973 Y201.143 E.55096
G1 X171.756 Y201.143 E.02518
G1 X191.143 Y128.791 E2.40864
G1 X191.143 Y122.608 E.19882
G1 X158.857 Y131.259 E1.0748
G1 X158.857 Y131.457 E.00638
M73 P78 R12
G1 X191.143 Y163.743 E1.4682
G1 X191.143 Y164.752 E.03246
G1 X158.857 Y173.403 E1.0748
G1 X158.857 Y177.513 E.13217
G1 X182.487 Y201.143 E1.07457
G1 X188.614 Y201.143 E.19702
G1 X191.143 Y191.704 E.31421
G1 X191.143 Y190.038 E.05357
G1 X158.857 Y198.689 E1.0748
G1 X158.857 Y200.541 E.05955
G1 X159.459 Y201.143 E.02736
G1 X163.327 Y201.143 E.12439
G1 X185.376 Y118.857 E2.73933
G1 X180.799 Y118.857 E.14716
G1 X191.143 Y129.201 E.47038
M204 S10000
G1 X191.143 Y132.665 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y131.037 E.05236
G1 X158.857 Y139.688 E1.0748
G1 X158.857 Y142.971 E.10559
G1 X191.143 Y175.257 E1.4682
G1 X191.143 Y173.181 E.06675
G1 X158.857 Y181.832 E1.0748
G1 X158.857 Y180.203 E.05236
; WIPE_START
G1 X158.857 Y181.832 E-.61876
G1 X159.216 Y181.735 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.8 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 62 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z12.8 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer62 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 12.6
; LAYER_HEIGHT: 0.200001
;======== H2D 20250521========
; layer num/total_layer_count: 63/75
; update layer progress
M73 L63
M991 S0 P62 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X186.839 Y201.143 Z13 F60000
G1 Z12.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X188.467 Y201.143 E.05236
G1 X191.143 Y191.158 E.3324
G1 X191.143 Y190.185 E.03129
G1 X158.857 Y198.836 E1.0748
G1 X158.857 Y200.341 E.04841
G1 X159.659 Y201.143 E.03645
G1 X163.181 Y201.143 E.11325
G1 X185.229 Y118.857 E2.73933
G1 X180.999 Y118.857 E.13602
G1 X191.143 Y129.001 E.46128
M204 S10000
G1 X191.143 Y132.812 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y131.183 E.05236
G1 X158.857 Y139.834 E1.0748
G1 X158.857 Y142.771 E.09445
G1 X191.143 Y175.057 E1.4682
G1 X191.143 Y173.327 E.05561
G1 X158.857 Y181.978 E1.0748
G1 X158.857 Y180.35 E.05236
M204 S10000
G1 X158.857 Y187.45 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y185.821 E.05236
G1 X176.8 Y118.857 E2.22927
G1 X174.23 Y118.857 E.08265
G1 X158.857 Y122.976 E.51177
G1 X158.857 Y122.908 E.00221
G1 X159.943 Y118.857 E.13484
G1 X158.857 Y118.857 E.0349
G1 X158.857 Y119.743 E.02849
G1 X191.143 Y152.029 E1.4682
G1 X191.143 Y148.041 E.12823
G1 X158.857 Y156.692 E1.0748
G1 X158.857 Y158.32 E.05236
M204 S10000
G1 X158.857 Y146.635 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y148.263 E.05236
G1 X191.143 Y139.612 E1.0748
G1 X191.143 Y140.515 E.02903
G1 X169.485 Y118.857 E.98489
G1 X168.372 Y118.857 E.03581
G1 X158.857 Y154.365 E1.18206
G1 X158.857 Y154.285 E.00255
G1 X191.143 Y186.571 E1.4682
G1 X191.143 Y181.756 E.15482
G1 X158.857 Y190.407 E1.0748
G1 X158.857 Y188.827 E.0508
G1 X171.173 Y201.143 E.56006
G1 X171.61 Y201.143 E.01404
G1 X191.143 Y128.245 E2.42683
G1 X191.143 Y122.754 E.17654
G1 X158.857 Y131.405 E1.0748
G1 X158.857 Y131.257 E.00475
G1 X191.143 Y163.543 E1.4682
G1 X191.143 Y164.898 E.0436
M73 P79 R12
G1 X158.857 Y173.549 E1.0748
G1 X158.857 Y177.313 E.12103
G1 X182.687 Y201.143 E1.08367
M204 S10000
G1 X191.143 Y158.073 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y159.701 E.05236
G1 X180.038 Y201.143 E1.37961
G1 X181.704 Y201.143 E.05357
G1 X191.143 Y198.614 E.31421
G1 X191.143 Y198.084 E.01702
G1 X158.857 Y165.799 E1.4682
G1 X158.857 Y165.12 E.02183
G1 X191.143 Y156.47 E1.0748
G1 X191.143 Y154.841 E.05236
; WIPE_START
G1 X191.143 Y156.47 E-.61876
G1 X190.784 Y156.566 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 63 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z13 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer63 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 12.8
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 64/75
; update layer progress
M73 L64
M991 S0 P63 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X189.949 Y201.143 Z13.2 F60000
G1 Z12.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X188.321 Y201.143 E.05236
G1 X191.143 Y190.611 E.35059
G1 X191.143 Y190.331 E.00901
G1 X158.857 Y198.982 E1.0748
G1 X158.857 Y200.141 E.03727
G1 X159.859 Y201.143 E.04555
G1 X163.034 Y201.143 E.10211
G1 X185.083 Y118.857 E2.73933
G1 X181.199 Y118.857 E.12488
G1 X191.143 Y128.801 E.45219
M204 S10000
G1 X191.143 Y132.958 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y131.33 E.05236
G1 X158.857 Y139.98 E1.0748
G1 X158.857 Y142.571 E.08331
G1 X191.143 Y174.857 E1.4682
G1 X191.143 Y173.474 E.04447
G1 X158.857 Y182.124 E1.0748
G1 X158.857 Y180.496 E.05236
M204 S10000
G1 X158.857 Y186.903 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y185.275 E.05236
G1 X176.654 Y118.857 E2.21108
G1 X174.776 Y118.857 E.06037
G1 X158.857 Y123.123 E.52996
G1 X158.857 Y122.361 E.02448
G1 X159.796 Y118.857 E.11665
G1 X158.857 Y118.857 E.03019
G1 X158.857 Y119.543 E.02206
G1 X191.143 Y151.829 E1.4682
G1 X191.143 Y148.187 E.11709
G1 X158.857 Y156.838 E1.0748
G1 X158.857 Y158.466 E.05236
M204 S10000
G1 X158.857 Y146.781 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y148.409 E.05236
G1 X191.143 Y139.758 E1.0748
G1 X191.143 Y140.315 E.01789
G1 X169.685 Y118.857 E.97579
G1 X168.225 Y118.857 E.04695
G1 X158.857 Y153.818 E1.16387
G1 X158.857 Y154.085 E.00859
G1 X191.143 Y186.371 E1.4682
G1 X191.143 Y181.902 E.14368
G1 X158.857 Y190.553 E1.0748
G1 X158.857 Y188.627 E.06194
G1 X171.373 Y201.143 E.56915
G1 X171.463 Y201.143 E.00291
G1 X191.143 Y127.698 E2.44502
G1 X191.143 Y122.901 E.15426
G1 X158.857 Y131.552 E1.0748
G1 X158.857 Y131.057 E.01589
G1 X191.143 Y163.343 E1.4682
G1 X191.143 Y165.045 E.05474
G1 X158.857 Y173.696 E1.0748
G1 X158.857 Y177.113 E.1099
G1 X182.887 Y201.143 E1.09276
M204 S10000
G1 X191.143 Y157.526 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y159.155 E.05236
G1 X179.892 Y201.143 E1.3978
G1 X182.251 Y201.143 E.07585
G1 X191.143 Y198.76 E.29602
G1 X191.143 Y197.884 E.02815
G1 X158.857 Y165.599 E1.4682
G1 X158.857 Y165.267 E.01069
G1 X191.143 Y156.616 E1.0748
G1 X191.143 Y154.988 E.05236
; WIPE_START
G1 X191.143 Y156.616 E-.61876
G1 X190.784 Y156.712 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.2 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 64 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z13.2 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer64 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 13
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 65/75
; update layer progress
M73 L65
M991 S0 P64 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P79 R11
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
M73 P80 R11
G1 X189.803 Y201.143 Z13.4 F60000
G1 Z13
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X188.174 Y201.143 E.05236
G1 X191.143 Y190.065 E.36878
G1 X191.143 Y186.171 E.12523
G1 X158.857 Y153.885 E1.4682
G1 X158.857 Y153.272 E.01973
G1 X168.079 Y118.857 E1.14568
G1 X169.885 Y118.857 E.05809
G1 X191.143 Y140.115 E.9667
G1 X191.143 Y139.905 E.00675
G1 X158.857 Y148.556 E1.0748
G1 X158.857 Y146.927 E.05236
M204 S10000
G1 X158.857 Y158.613 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y156.984 E.05236
G1 X191.143 Y148.334 E1.0748
G1 X191.143 Y151.629 E.10596
G1 X158.857 Y119.343 E1.4682
G1 X158.857 Y118.857 E.01563
G1 X159.65 Y118.857 E.02548
G1 X158.857 Y121.815 E.09846
G1 X158.857 Y123.269 E.04676
G1 X175.323 Y118.857 E.54815
G1 X176.507 Y118.857 E.03809
G1 X158.857 Y184.728 E2.19289
G1 X158.857 Y186.357 E.05236
M204 S10000
G1 X158.857 Y180.643 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y182.271 E.05236
G1 X191.143 Y173.62 E1.0748
G1 X191.143 Y174.657 E.03333
G1 X158.857 Y142.371 E1.4682
G1 X158.857 Y140.127 E.07217
G1 X191.143 Y131.476 E1.0748
G1 X191.143 Y128.601 E.09246
G1 X181.399 Y118.857 E.44309
G1 X184.936 Y118.857 E.11374
G1 X162.888 Y201.143 E2.73933
G1 X160.059 Y201.143 E.09097
G1 X158.857 Y199.941 E.05464
G1 X158.857 Y199.128 E.02613
G1 X191.143 Y190.478 E1.0748
M204 S10000
G1 X191.143 Y180.421 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y182.049 E.05236
G1 X158.857 Y190.7 E1.0748
G1 X158.857 Y188.427 E.07308
G1 X171.573 Y201.143 E.57825
G1 X171.317 Y201.143 E.00823
G1 X191.143 Y127.152 E2.46321
G1 X191.143 Y123.047 E.13198
G1 X158.857 Y131.698 E1.0748
G1 X158.857 Y130.857 E.02703
G1 X191.143 Y163.143 E1.4682
G1 X191.143 Y165.191 E.06588
G1 X158.857 Y173.842 E1.0748
G1 X158.857 Y176.913 E.09876
G1 X183.087 Y201.143 E1.10186
G1 X182.797 Y201.143 E.00932
G1 X191.143 Y198.906 E.27783
G1 X191.143 Y197.684 E.03929
G1 X158.857 Y165.399 E1.4682
G1 X158.857 Y165.413 E.00045
G1 X191.143 Y156.762 E1.0748
G1 X191.143 Y158.608 E.05936
G1 X179.746 Y201.143 E1.41599
G1 X178.117 Y201.143 E.05236
; WIPE_START
G1 X179.746 Y201.143 E-.61876
G1 X179.842 Y200.784 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.4 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 65 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z13.4 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer65 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 13.2
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 66/75
; update layer progress
M73 L66
M991 S0 P65 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X189.656 Y201.143 Z13.6 F60000
G1 Z13.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X188.028 Y201.143 E.05236
G1 X191.143 Y189.519 E.38697
G1 X191.143 Y185.971 E.1141
G1 X158.857 Y153.685 E1.4682
G1 X158.857 Y152.725 E.03087
G1 X167.932 Y118.857 E1.12749
G1 X170.085 Y118.857 E.06923
G1 X191.143 Y139.915 E.9576
G1 X191.143 Y140.051 E.00439
G1 X158.857 Y148.702 E1.0748
G1 X158.857 Y147.074 E.05236
M204 S10000
G1 X158.857 Y158.759 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y157.131 E.05236
G1 X191.143 Y148.48 E1.0748
G1 X191.143 Y151.429 E.09482
G1 X158.857 Y119.143 E1.4682
G1 X158.857 Y118.857 E.0092
G1 X159.503 Y118.857 E.02078
G1 X158.857 Y121.269 E.08027
G1 X158.857 Y123.416 E.06904
G1 X175.869 Y118.857 E.56634
G1 X176.361 Y118.857 E.01582
G1 X158.857 Y184.182 E2.1747
G1 X158.857 Y185.81 E.05236
M204 S10000
G1 X158.857 Y180.789 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y182.417 E.05236
G1 X191.143 Y173.766 E1.0748
G1 X191.143 Y174.457 E.02219
G1 X158.857 Y142.171 E1.4682
G1 X158.857 Y140.273 E.06104
G1 X191.143 Y131.622 E1.0748
G1 X191.143 Y128.401 E.1036
G1 X181.599 Y118.857 E.43399
G1 X184.79 Y118.857 E.1026
G1 X162.742 Y201.143 E2.73933
G1 X160.259 Y201.143 E.07983
G1 X158.857 Y199.741 E.06374
G1 X158.857 Y199.275 E.01499
G1 X191.143 Y190.624 E1.0748
M204 S10000
G1 X191.143 Y180.567 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y182.195 E.05236
G1 X158.857 Y190.846 E1.0748
G1 X158.857 Y188.227 E.08421
G1 X171.773 Y201.143 E.58734
G1 X171.17 Y201.143 E.01937
M73 P81 R11
G1 X191.143 Y126.605 E2.4814
G1 X191.143 Y123.194 E.10971
G1 X158.857 Y131.844 E1.0748
G1 X158.857 Y130.657 E.03817
G1 X191.143 Y162.943 E1.4682
G1 X191.143 Y165.338 E.07702
G1 X158.857 Y173.988 E1.0748
G1 X158.857 Y176.713 E.08762
G1 X183.287 Y201.143 E1.11095
G1 X183.343 Y201.143 E.00182
G1 X191.143 Y199.053 E.25964
G1 X191.143 Y197.484 E.05043
G1 X158.857 Y165.199 E1.4682
G1 X158.857 Y165.56 E.01159
G1 X191.143 Y156.909 E1.0748
G1 X191.143 Y158.062 E.03708
G1 X179.599 Y201.143 E1.43419
G1 X177.971 Y201.143 E.05236
; WIPE_START
G1 X179.599 Y201.143 E-.61876
G1 X179.695 Y200.784 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.6 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 66 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z13.6 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer66 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 13.4
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 67/75
; update layer progress
M73 L67
M991 S0 P66 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X189.51 Y201.143 Z13.8 F60000
G1 Z13.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X187.882 Y201.143 E.05236
G1 X191.143 Y188.972 E.40516
G1 X191.143 Y185.771 E.10296
G1 X158.857 Y153.485 E1.4682
G1 X158.857 Y152.179 E.04201
G1 X167.786 Y118.857 E1.1093
G1 X170.285 Y118.857 E.08037
G1 X191.143 Y139.715 E.94851
G1 X191.143 Y140.198 E.01553
G1 X158.857 Y148.848 E1.0748
G1 X158.857 Y147.22 E.05236
M204 S10000
G1 X158.857 Y158.906 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y157.277 E.05236
G1 X191.143 Y148.626 E1.0748
G1 X191.143 Y151.229 E.08368
G1 X158.857 Y118.943 E1.4682
G1 X158.857 Y118.857 E.00277
G1 X159.357 Y118.857 E.01607
G1 X158.857 Y120.722 E.06208
G1 X158.857 Y123.562 E.09132
G1 X176.416 Y118.857 E.58453
G1 X176.215 Y118.857 E.00646
G1 X158.857 Y183.636 E2.15651
G1 X158.857 Y185.264 E.05236
M204 S10000
G1 X158.857 Y182.564 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y173.913 E1.0748
G1 X191.143 Y174.257 E.01105
G1 X158.857 Y141.971 E1.4682
G1 X158.857 Y140.42 E.0499
M73 P81 R10
G1 X191.143 Y131.769 E1.0748
G1 X191.143 Y128.201 E.11474
G1 X181.799 Y118.857 E.4249
G1 X184.643 Y118.857 E.09146
G1 X162.595 Y201.143 E2.73933
G1 X160.459 Y201.143 E.06869
G1 X158.857 Y199.541 E.07283
G1 X158.857 Y199.421 E.00385
G1 X191.143 Y190.77 E1.0748
G1 X191.143 Y192.399 E.05236
M204 S10000
G1 X191.143 Y180.713 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y182.342 E.05236
G1 X158.857 Y190.992 E1.0748
G1 X158.857 Y188.027 E.09535
G1 X171.973 Y201.143 E.59644
G1 X171.024 Y201.143 E.03051
G1 X191.143 Y126.059 E2.49959
G1 X191.143 Y123.34 E.08743
G1 X158.857 Y131.991 E1.0748
G1 X158.857 Y130.457 E.04931
G1 X191.143 Y162.743 E1.4682
G1 X191.143 Y165.484 E.08816
G1 X158.857 Y174.135 E1.0748
G1 X158.857 Y176.513 E.07648
G1 X183.487 Y201.143 E1.12005
G1 X183.89 Y201.143 E.01296
G1 X191.143 Y199.199 E.24145
G1 X191.143 Y197.284 E.06157
G1 X158.857 Y164.999 E1.4682
G1 X158.857 Y165.706 E.02273
G1 X191.143 Y157.055 E1.0748
G1 X191.143 Y157.516 E.0148
G1 X179.453 Y201.143 E1.45238
G1 X177.824 Y201.143 E.05236
; WIPE_START
G1 X179.453 Y201.143 E-.61876
G1 X179.549 Y200.784 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.8 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 67 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z13.8 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer67 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 13.6
; LAYER_HEIGHT: 0.200001
;======== H2D 20250521========
; layer num/total_layer_count: 68/75
; update layer progress
M73 L68
M991 S0 P67 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
M73 P82 R10
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X189.363 Y201.143 Z14 F60000
G1 Z13.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X187.735 Y201.143 E.05236
G1 X191.143 Y188.426 E.42335
G1 X191.143 Y185.571 E.09182
G1 X158.857 Y153.285 E1.4682
G1 X158.857 Y151.632 E.05315
G1 X167.639 Y118.857 E1.09111
G1 X170.485 Y118.857 E.09151
G1 X191.143 Y139.515 E.93941
G1 X191.143 Y140.344 E.02667
G1 X158.857 Y148.995 E1.0748
G1 X158.857 Y147.367 E.05236
M204 S10000
G1 X158.857 Y159.052 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y157.424 E.05236
G1 X191.143 Y148.773 E1.0748
G1 X191.143 Y151.029 E.07254
G1 X158.971 Y118.857 E1.46302
G1 X159.211 Y118.857 E.0077
G1 X158.857 Y120.176 E.04389
G1 X158.857 Y123.709 E.1136
G1 X176.962 Y118.857 E.60272
G1 X178.59 Y118.857 E.05236
M204 S10000
G1 X176.068 Y118.857 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y183.089 E2.13832
G1 X158.857 Y182.71 E.01219
G1 X191.143 Y174.059 E1.0748
G1 X158.857 Y141.771 E1.46826
G1 X158.857 Y140.566 E.03876
G1 X191.143 Y131.915 E1.0748
G1 X191.143 Y128.001 E.12588
G1 X181.999 Y118.857 E.4158
G1 X184.497 Y118.857 E.08032
G1 X162.449 Y201.143 E2.73933
G1 X160.659 Y201.143 E.05756
G1 X158.857 Y199.341 E.08193
G1 X158.857 Y199.568 E.00729
G1 X191.143 Y190.917 E1.0748
G1 X191.143 Y192.545 E.05236
M204 S10000
G1 X191.143 Y180.86 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y182.488 E.05236
G1 X158.857 Y191.139 E1.0748
G1 X158.857 Y187.827 E.10649
G1 X172.173 Y201.143 E.60553
G1 X170.878 Y201.143 E.04165
G1 X191.143 Y125.512 E2.51778
G1 X191.143 Y123.487 E.06515
G1 X158.857 Y132.137 E1.0748
G1 X158.857 Y130.257 E.06045
G1 X191.143 Y162.543 E1.4682
G1 X191.143 Y165.63 E.0993
G1 X158.857 Y174.281 E1.0748
G1 X158.857 Y176.313 E.06534
G1 X183.687 Y201.143 E1.12914
G1 X184.436 Y201.143 E.0241
G1 X191.143 Y199.346 E.22326
G1 X191.143 Y197.084 E.07271
G1 X158.857 Y164.799 E1.4682
G1 X158.857 Y165.852 E.03387
G1 X191.143 Y157.202 E1.0748
G1 X191.143 Y156.969 E.00748
G1 X179.306 Y201.143 E1.47057
G1 X177.678 Y201.143 E.05236
; WIPE_START
G1 X179.306 Y201.143 E-.61876
G1 X179.403 Y200.784 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 68 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z14 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer68 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 13.8
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 69/75
; update layer progress
M73 L69
M991 S0 P68 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X189.217 Y201.143 Z14.2 F60000
G1 Z13.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X187.589 Y201.143 E.05236
G1 X191.143 Y187.879 E.44154
G1 X191.143 Y185.371 E.08068
G1 X158.857 Y153.085 E1.4682
G1 X158.857 Y151.086 E.06429
G1 X167.493 Y118.857 E1.07292
G1 X170.685 Y118.857 E.10265
G1 X191.143 Y139.315 E.93032
G1 X191.143 Y140.491 E.03781
G1 X158.857 Y149.141 E1.0748
G1 X158.857 Y147.513 E.05236
M204 S10000
G1 X158.857 Y159.198 F60000
G1 F4421.739
M204 S8000
G1 X158.857 Y157.57 E.05236
G1 X191.143 Y148.919 E1.0748
G1 X191.143 Y150.829 E.0614
G1 X159.171 Y118.857 E1.45393
G1 X159.064 Y118.857 E.00344
G1 X158.857 Y119.629 E.0257
G1 X158.857 Y123.855 E.13588
G1 X177.508 Y118.857 E.62091
G1 X179.137 Y118.857 E.05236
M204 S10000
G1 X174.294 Y118.857 F60000
G1 F4421.739
M204 S8000
G1 X175.922 Y118.857 E.05236
G1 X158.857 Y182.543 E2.12013
G1 X158.857 Y182.856 E.01009
G1 X191.143 Y174.206 E1.0748
G1 X191.143 Y173.857 E.01123
G1 X158.857 Y141.571 E1.4682
G1 X158.857 Y140.713 E.02762
G1 X191.143 Y132.062 E1.0748
G1 X191.143 Y127.801 E.13702
G1 X182.199 Y118.857 E.40671
G1 X184.351 Y118.857 E.06918
G1 X162.302 Y201.143 E2.73933
G1 X160.859 Y201.143 E.04642
G1 X158.857 Y199.141 E.09102
G1 X158.857 Y199.714 E.01843
M73 P83 R10
G1 X191.143 Y191.063 E1.0748
G1 X191.143 Y192.692 E.05236
M204 S10000
G1 X191.143 Y181.006 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y182.634 E.05236
G1 X158.857 Y191.285 E1.0748
G1 X158.857 Y187.627 E.11763
G1 X172.373 Y201.143 E.61463
G1 X170.731 Y201.143 E.05279
G1 X191.143 Y124.966 E2.53597
G1 X191.143 Y123.633 E.04287
G1 X158.857 Y132.284 E1.0748
G1 X158.857 Y130.057 E.07159
G1 X191.143 Y162.343 E1.4682
G1 X191.143 Y165.777 E.11043
G1 X158.857 Y174.428 E1.0748
G1 X158.857 Y176.113 E.0542
G1 X183.887 Y201.143 E1.13824
G1 X184.983 Y201.143 E.03524
G1 X191.143 Y199.492 E.20507
G1 X191.143 Y196.884 E.08385
G1 X158.857 Y164.599 E1.4682
G1 X158.857 Y165.999 E.04501
G1 X191.143 Y157.348 E1.0748
M204 S10000
G1 X191.143 Y154.794 F60000
G1 F4421.739
M204 S8000
G1 X191.143 Y156.423 E.05236
G1 X179.16 Y201.143 E1.48876
G1 X177.532 Y201.143 E.05236
; WIPE_START
G1 X179.16 Y201.143 E-.61876
G1 X179.256 Y200.784 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.2 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 69 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z14.2 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer69 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 14
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 70/75
; update layer progress
M73 L70
M991 S0 P69 ;notify layer change


M106 S40.8
; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
M73 P83 R9
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X187.543 Y200.765 Z14.4 F60000
G1 Z14
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4421.739
M204 S8000
G1 X190.765 Y188.741 E.40031
G1 X190.765 Y187.112 E.05236
M204 S10000
G1 X190.765 Y192.939 F60000
G1 F4421.739
M204 S8000
G1 X190.765 Y191.311 E.05236
G1 X159.235 Y199.759 E1.04969
G1 X159.235 Y199.318 E.01419
G1 X160.682 Y200.765 E.06581
G1 X162.257 Y200.765 E.05065
G1 X184.103 Y119.235 E2.71422
G1 X182.776 Y119.235 E.04266
G1 X190.765 Y127.224 E.36331
G1 X190.765 Y132.309 E.16353
G1 X159.235 Y140.758 E1.04969
G1 X159.235 Y141.749 E.03186
G1 X190.765 Y173.279 E1.4339
G1 X190.765 Y174.453 E.03774
G1 X159.235 Y182.902 E1.04969
G1 X159.235 Y180.589 E.07438
G1 X175.674 Y119.235 E2.04252
M204 S10000
G1 X178.276 Y119.235 F60000
G1 F4421.739
M204 S8000
G1 X176.647 Y119.235 E.05236
G1 X159.235 Y123.9 E.57968
G1 X159.235 Y119.235 E.15003
G1 X159.749 Y119.235 E.01653
G1 X190.765 Y150.251 E1.41053
G1 X190.765 Y149.167 E.03488
G1 X159.235 Y157.615 E1.04969
G1 X159.235 Y153.262 E.13998
G1 X190.765 Y184.793 E1.4339
G1 X190.765 Y182.882 E.06146
G1 X159.235 Y191.331 E1.04969
G1 X159.235 Y187.804 E.11339
G1 X172.196 Y200.765 E.58942
G1 X170.686 Y200.765 E.04855
G1 X190.765 Y125.827 E2.49475
G1 X190.765 Y123.88 E.0626
G1 X159.235 Y132.329 E1.04969
G1 X159.235 Y130.235 E.06735
G1 X190.765 Y161.765 E1.4339
G1 X190.765 Y166.024 E.13695
G1 X159.235 Y174.473 E1.04969
G1 X159.235 Y176.29 E.05844
G1 X183.71 Y200.765 E1.11303
G1 X186.937 Y200.765 E.10377
G1 X190.765 Y199.74 E.12746
G1 X190.765 Y196.307 E.11037
G1 X159.235 Y164.776 E1.4339
G1 X159.235 Y166.044 E.04077
G1 X190.765 Y157.596 E1.04969
G1 X190.765 Y157.284 E.01002
G1 X179.115 Y200.765 E1.44753
G1 X177.486 Y200.765 E.05236
M204 S10000
G1 X172.891 Y119.235 F60000
G1 F4421.739
M204 S8000
G1 X171.262 Y119.235 E.05236
G1 X190.765 Y138.738 E.88692
G1 X190.765 Y140.738 E.06433
G1 X159.235 Y149.187 E1.04969
G1 X159.235 Y149.132 E.00176
G1 X167.246 Y119.235 E.99531
G1 X165.617 Y119.235 E.05236
M204 S10000
G1 X159.031 Y118.872 F60000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.382998
G1 F5292.908
M204 S8000
G1 X158.899 Y118.899 E.00362
G1 X158.872 Y119.031 E.00362
G1 X158.872 Y200.969 E2.20116
G1 X158.899 Y201.101 E.00362
G1 X159.031 Y201.128 E.00362
G1 X190.969 Y201.128 E.85797
G1 X191.101 Y201.101 E.00362
G1 X191.128 Y200.969 E.00362
G1 X191.128 Y119.031 E2.20116
G1 X191.101 Y118.899 E.00362
G1 X190.969 Y118.872 E.00362
G1 X159.091 Y118.872 E.85636
; WIPE_START
G1 X161.091 Y118.872 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.4 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 70 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z14.4 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer70 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 14.2
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 71/75
; update layer progress
M73 L71
M991 S0 P70 ;notify layer change


M106 S25.5
; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
M73 P84 R9
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X184.697 Y201.456 Z14.6 F60000
G1 X158.676 Y198.806 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40282
; LAYER_HEIGHT: 0.4
M106 S229.5
G1 F2824.819
M204 S8000
G1 X159.297 Y201.121 E.12067
G1 X159.766 Y201.121 E.0236
G1 X158.879 Y197.812 E.17246
G1 X158.879 Y196.062 E.08806
G1 X160.234 Y201.121 E.26363
G1 X160.703 Y201.121 E.0236
G1 X158.879 Y194.313 E.3548
G1 X158.879 Y192.563 E.08806
G1 X161.172 Y201.121 E.44597
G1 X161.641 Y201.121 E.0236
G1 X158.879 Y190.813 E.53714
G1 X158.879 Y189.064 E.08806
G1 X162.11 Y201.121 E.62831
G1 X162.578 Y201.121 E.0236
G1 X158.879 Y187.314 E.71948
G1 X158.879 Y185.565 E.08806
G1 X163.047 Y201.121 E.81065
G1 X163.516 Y201.121 E.0236
G1 X158.879 Y183.815 E.90182
G1 X158.879 Y182.066 E.08806
G1 X163.985 Y201.121 E.99299
G1 X164.454 Y201.121 E.0236
G1 X158.879 Y180.316 E1.08416
G1 X158.879 Y178.567 E.08806
G1 X164.922 Y201.121 E1.17533
G1 X165.391 Y201.121 E.0236
G1 X158.879 Y176.817 E1.2665
G1 X158.879 Y175.067 E.08806
G1 X165.86 Y201.121 E1.35767
G1 X166.329 Y201.121 E.0236
G1 X158.879 Y173.318 E1.44884
G1 X158.879 Y171.568 E.08806
G1 X166.798 Y201.121 E1.54001
G1 X167.266 Y201.121 E.0236
G1 X158.879 Y169.819 E1.63118
G1 X158.879 Y168.069 E.08806
G1 X167.735 Y201.121 E1.72235
G1 X168.204 Y201.121 E.0236
G1 X158.879 Y166.32 E1.81353
G1 X158.879 Y164.57 E.08806
G1 X168.673 Y201.121 E1.9047
G1 X169.141 Y201.121 E.0236
G1 X158.879 Y162.821 E1.99587
G1 X158.879 Y161.071 E.08806
G1 X169.61 Y201.121 E2.08704
G1 X170.079 Y201.121 E.0236
G1 X158.879 Y159.321 E2.17821
G1 X158.879 Y157.572 E.08806
G1 X170.548 Y201.121 E2.26938
G1 X171.017 Y201.121 E.0236
G1 X158.879 Y155.822 E2.36055
G1 X158.879 Y154.073 E.08806
G1 X171.485 Y201.121 E2.45172
G1 X171.954 Y201.121 E.0236
G1 X158.879 Y152.323 E2.54289
G1 X158.879 Y150.574 E.08806
G1 X172.423 Y201.121 E2.63406
G1 X172.892 Y201.121 E.0236
G1 X158.879 Y148.824 E2.72523
G1 X158.879 Y147.074 E.08806
G1 X173.361 Y201.121 E2.8164
G1 X173.829 Y201.121 E.0236
G1 X158.879 Y145.325 E2.90757
G1 X158.879 Y143.575 E.08806
G1 X174.298 Y201.121 E2.99874
G1 X174.767 Y201.121 E.0236
G1 X158.879 Y141.826 E3.08991
G1 X158.879 Y140.076 E.08806
G1 X175.236 Y201.121 E3.18108
G1 X175.705 Y201.121 E.0236
G1 X158.879 Y138.327 E3.27225
G1 X158.879 Y136.577 E.08806
M73 P84 R8
G1 X176.173 Y201.121 E3.36342
G1 X176.642 Y201.121 E.0236
G1 X158.879 Y134.828 E3.45459
G1 X158.879 Y133.078 E.08806
M73 P85 R8
G1 X177.111 Y201.121 E3.54577
G1 X177.58 Y201.121 E.0236
G1 X158.879 Y131.328 E3.63694
G1 X158.879 Y129.579 E.08806
G1 X178.049 Y201.121 E3.72811
G1 X178.517 Y201.121 E.0236
G1 X158.879 Y127.829 E3.81928
G1 X158.879 Y126.08 E.08806
G1 X178.986 Y201.121 E3.91045
G1 X179.455 Y201.121 E.0236
G1 X158.879 Y124.33 E4.00162
G1 X158.879 Y122.581 E.08806
G1 X179.924 Y201.121 E4.09279
G1 X180.393 Y201.121 E.0236
G1 X158.879 Y120.831 E4.18396
G1 X158.879 Y119.082 E.08806
G1 X180.861 Y201.121 E4.27513
G1 X181.33 Y201.121 E.0236
G1 X159.293 Y118.879 E4.28569
G1 X159.762 Y118.879 E.0236
G1 X181.799 Y201.121 E4.28569
G1 X182.268 Y201.121 E.0236
G1 X160.231 Y118.879 E4.28569
G1 X160.7 Y118.879 E.0236
G1 X182.737 Y201.121 E4.28569
G1 X183.205 Y201.121 E.0236
G1 X161.169 Y118.879 E4.28569
G1 X161.637 Y118.879 E.0236
G1 X183.674 Y201.121 E4.28569
G1 X184.143 Y201.121 E.0236
G1 X162.106 Y118.879 E4.28569
G1 X162.575 Y118.879 E.0236
G1 X184.612 Y201.121 E4.28569
G1 X185.08 Y201.121 E.0236
G1 X163.044 Y118.879 E4.28569
G1 X163.512 Y118.879 E.0236
G1 X185.549 Y201.121 E4.28569
G1 X186.018 Y201.121 E.0236
G1 X163.981 Y118.879 E4.28569
G1 X164.45 Y118.879 E.0236
G1 X186.487 Y201.121 E4.28569
G1 X186.956 Y201.121 E.0236
M73 P86 R8
G1 X164.919 Y118.879 E4.28569
G1 X165.388 Y118.879 E.0236
G1 X187.424 Y201.121 E4.28569
G1 X187.893 Y201.121 E.0236
G1 X165.856 Y118.879 E4.28569
G1 X166.325 Y118.879 E.0236
G1 X188.362 Y201.121 E4.28569
G1 X188.831 Y201.121 E.0236
G1 X166.794 Y118.879 E4.28569
G1 X167.263 Y118.879 E.0236
G1 X189.3 Y201.121 E4.28569
G1 X189.768 Y201.121 E.0236
G1 X167.732 Y118.879 E4.28569
G1 X168.2 Y118.879 E.0236
G1 X190.237 Y201.121 E4.28569
G1 X190.706 Y201.121 E.0236
G1 X168.669 Y118.879 E4.28569
G1 X169.138 Y118.879 E.0236
G1 X191.121 Y200.921 E4.27526
G1 X191.121 Y199.171 E.08806
G1 X169.607 Y118.879 E4.18409
G1 X170.076 Y118.879 E.0236
G1 X191.121 Y197.422 E4.09292
G1 X191.121 Y195.672 E.08806
M73 P86 R7
G1 X170.544 Y118.879 E4.00175
G1 X171.013 Y118.879 E.0236
G1 X191.121 Y193.923 E3.91058
G1 X191.121 Y192.173 E.08806
G1 X171.482 Y118.879 E3.81941
G1 X171.951 Y118.879 E.0236
G1 X191.121 Y190.424 E3.72824
G1 X191.121 Y188.674 E.08806
G1 X172.42 Y118.879 E3.63707
G1 X172.888 Y118.879 E.0236
G1 X191.121 Y186.924 E3.5459
G1 X191.121 Y185.175 E.08806
G1 X173.357 Y118.879 E3.45472
G1 X173.826 Y118.879 E.0236
G1 X191.121 Y183.425 E3.36355
G1 X191.121 Y181.676 E.08806
M73 P87 R7
G1 X174.295 Y118.879 E3.27238
G1 X174.764 Y118.879 E.0236
G1 X191.121 Y179.926 E3.18121
G1 X191.121 Y178.177 E.08806
G1 X175.232 Y118.879 E3.09004
G1 X175.701 Y118.879 E.0236
G1 X191.121 Y176.427 E2.99887
G1 X191.121 Y174.678 E.08806
G1 X176.17 Y118.879 E2.9077
G1 X176.639 Y118.879 E.0236
G1 X191.121 Y172.928 E2.81653
G1 X191.121 Y171.178 E.08806
G1 X177.108 Y118.879 E2.72536
G1 X177.576 Y118.879 E.0236
G1 X191.121 Y169.429 E2.63419
G1 X191.121 Y167.679 E.08806
G1 X178.045 Y118.879 E2.54302
G1 X178.514 Y118.879 E.0236
G1 X191.121 Y165.93 E2.45185
G1 X191.121 Y164.18 E.08806
G1 X178.983 Y118.879 E2.36068
G1 X179.451 Y118.879 E.0236
G1 X191.121 Y162.431 E2.26951
G1 X191.121 Y160.681 E.08806
G1 X179.92 Y118.879 E2.17834
G1 X180.389 Y118.879 E.0236
G1 X191.121 Y158.931 E2.08717
G1 X191.121 Y157.182 E.08806
G1 X180.858 Y118.879 E1.996
G1 X181.327 Y118.879 E.0236
G1 X191.121 Y155.432 E1.90483
G1 X191.121 Y153.683 E.08806
G1 X181.795 Y118.879 E1.81365
G1 X182.264 Y118.879 E.0236
G1 X191.121 Y151.933 E1.72248
G1 X191.121 Y150.184 E.08806
G1 X182.733 Y118.879 E1.63131
G1 X183.202 Y118.879 E.0236
G1 X191.121 Y148.434 E1.54014
G1 X191.121 Y146.685 E.08806
G1 X183.671 Y118.879 E1.44897
G1 X184.139 Y118.879 E.0236
G1 X191.121 Y144.935 E1.3578
G1 X191.121 Y143.185 E.08806
G1 X184.608 Y118.879 E1.26663
G1 X185.077 Y118.879 E.0236
G1 X191.121 Y141.436 E1.17546
G1 X191.121 Y139.686 E.08806
G1 X185.546 Y118.879 E1.08429
G1 X186.015 Y118.879 E.0236
G1 X191.121 Y137.937 E.99312
G1 X191.121 Y136.187 E.08806
G1 X186.483 Y118.879 E.90195
G1 X186.952 Y118.879 E.0236
G1 X191.121 Y134.438 E.81078
G1 X191.121 Y132.688 E.08806
G1 X187.421 Y118.879 E.71961
G1 X187.89 Y118.879 E.0236
G1 X191.121 Y130.939 E.62844
G1 X191.121 Y129.189 E.08806
G1 X188.359 Y118.879 E.53727
G1 X188.827 Y118.879 E.0236
G1 X191.121 Y127.439 E.4461
G1 X191.121 Y125.69 E.08806
G1 X189.296 Y118.879 E.35493
G1 X189.765 Y118.879 E.0236
G1 X191.121 Y123.94 E.26375
G1 X191.121 Y122.191 E.08806
G1 X190.234 Y118.879 E.17258
G1 X190.703 Y118.879 E.0236
G1 X191.324 Y121.197 E.1208
M106 S25.5
; WIPE_START
G1 X190.806 Y119.265 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.6 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 71 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z14.6 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer71 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 14.4
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 72/75
; update layer progress
M73 L72
M991 S0 P71 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
M73 P88 R7
G1 E-.8 F1800
M204 S10000
G1 X190.564 Y201.327 Z14.8 F60000
G1 Z14.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42064
G1 F4765.435
M204 S8000
G1 X191.158 Y200.733 E.02506
G1 X191.158 Y200.199 E.01594
G1 X190.199 Y201.158 E.04044
G1 X189.665 Y201.158 E.01594
G1 X191.158 Y199.665 E.06298
G1 X191.158 Y199.131 E.01594
G1 X189.131 Y201.158 E.08552
G1 X188.597 Y201.158 E.01594
G1 X191.158 Y198.597 E.10806
G1 X191.158 Y198.062 E.01594
G1 X188.062 Y201.158 E.1306
G1 X187.528 Y201.158 E.01594
G1 X191.158 Y197.528 E.15314
G1 X191.158 Y196.994 E.01594
G1 X186.994 Y201.158 E.17568
G1 X186.46 Y201.158 E.01594
G1 X191.158 Y196.46 E.19822
G1 X191.158 Y195.926 E.01594
G1 X185.926 Y201.158 E.22076
G1 X185.392 Y201.158 E.01594
G1 X191.158 Y195.392 E.2433
G1 X191.158 Y194.857 E.01594
G1 X184.857 Y201.158 E.26585
G1 X184.323 Y201.158 E.01594
G1 X191.158 Y194.323 E.28839
G1 X191.158 Y193.789 E.01594
G1 X183.789 Y201.158 E.31093
G1 X183.255 Y201.158 E.01594
G1 X191.158 Y193.255 E.33347
G1 X191.158 Y192.721 E.01594
G1 X182.721 Y201.158 E.35601
G1 X182.187 Y201.158 E.01594
G1 X191.158 Y192.187 E.37855
G1 X191.158 Y191.652 E.01594
G1 X181.652 Y201.158 E.40109
G1 X181.118 Y201.158 E.01594
G1 X191.158 Y191.118 E.42363
G1 X191.158 Y190.584 E.01594
G1 X180.584 Y201.158 E.44617
G1 X180.05 Y201.158 E.01594
G1 X191.158 Y190.05 E.46871
G1 X191.158 Y189.516 E.01594
G1 X179.516 Y201.158 E.49125
G1 X178.981 Y201.158 E.01594
G1 X191.158 Y188.981 E.51379
G1 X191.158 Y188.447 E.01594
G1 X178.447 Y201.158 E.53633
G1 X177.913 Y201.158 E.01594
G1 X191.158 Y187.913 E.55887
G1 X191.158 Y187.379 E.01594
G1 X177.379 Y201.158 E.58141
G1 X176.845 Y201.158 E.01594
G1 X191.158 Y186.845 E.60395
G1 X191.158 Y186.311 E.01594
G1 X176.311 Y201.158 E.62649
G1 X175.776 Y201.158 E.01594
G1 X191.158 Y185.776 E.64903
G1 X191.158 Y185.242 E.01594
G1 X175.242 Y201.158 E.67157
G1 X174.708 Y201.158 E.01594
G1 X191.158 Y184.708 E.69411
G1 X191.158 Y184.174 E.01594
G1 X174.174 Y201.158 E.71665
G1 X173.64 Y201.158 E.01594
G1 X191.158 Y183.64 E.73919
G1 X191.158 Y183.106 E.01594
G1 X173.106 Y201.158 E.76173
G1 X172.571 Y201.158 E.01594
G1 X191.158 Y182.571 E.78427
G1 X191.158 Y182.037 E.01594
G1 X172.037 Y201.158 E.80681
G1 X171.503 Y201.158 E.01594
G1 X191.158 Y181.503 E.82935
G1 X191.158 Y180.969 E.01594
G1 X170.969 Y201.158 E.85189
G1 X170.435 Y201.158 E.01594
M73 P88 R6
G1 X191.158 Y180.435 E.87443
G1 X191.158 Y179.9 E.01594
G1 X169.9 Y201.158 E.89697
G1 X169.366 Y201.158 E.01594
G1 X191.158 Y179.366 E.91951
G1 X191.158 Y178.832 E.01594
G1 X168.832 Y201.158 E.94205
G1 X168.298 Y201.158 E.01594
G1 X191.158 Y178.298 E.96459
G1 X191.158 Y177.764 E.01594
G1 X167.764 Y201.158 E.98713
G1 X167.23 Y201.158 E.01594
G1 X191.158 Y177.23 E1.00967
G1 X191.158 Y176.695 E.01594
G1 X166.695 Y201.158 E1.03221
G1 X166.161 Y201.158 E.01594
G1 X191.158 Y176.161 E1.05475
G1 X191.158 Y175.627 E.01594
G1 X165.627 Y201.158 E1.07729
G1 X165.093 Y201.158 E.01594
G1 X191.158 Y175.093 E1.09983
G1 X191.158 Y174.559 E.01594
G1 X164.559 Y201.158 E1.12237
G1 X164.024 Y201.158 E.01594
G1 X191.158 Y174.024 E1.14491
G1 X191.158 Y173.49 E.01594
G1 X163.49 Y201.158 E1.16745
G1 X162.956 Y201.158 E.01594
G1 X191.158 Y172.956 E1.18999
G1 X191.158 Y172.422 E.01594
G1 X162.422 Y201.158 E1.21253
G1 X161.888 Y201.158 E.01594
G1 X191.158 Y171.888 E1.23507
G1 X191.158 Y171.354 E.01594
G1 X161.354 Y201.158 E1.25761
G1 X160.819 Y201.158 E.01594
G1 X191.158 Y170.819 E1.28015
G1 X191.158 Y170.285 E.01594
G1 X160.285 Y201.158 E1.30269
G1 X159.751 Y201.158 E.01594
G1 X191.158 Y169.751 E1.32523
G1 X191.158 Y169.217 E.01594
G1 X159.217 Y201.158 E1.34777
G1 X158.842 Y201.158 E.01117
G1 X158.842 Y200.998 E.00476
G1 X191.158 Y168.683 E1.36358
G1 X191.158 Y168.149 E.01594
G1 X158.842 Y200.464 E1.36358
G1 X158.842 Y199.93 E.01594
G1 X191.158 Y167.614 E1.36358
G1 X191.158 Y167.08 E.01594
G1 X158.842 Y199.395 E1.36358
G1 X158.842 Y198.861 E.01594
G1 X191.158 Y166.546 E1.36358
G1 X191.158 Y166.012 E.01594
G1 X158.842 Y198.327 E1.36358
G1 X158.842 Y197.793 E.01594
G1 X191.158 Y165.478 E1.36358
G1 X191.158 Y164.943 E.01594
G1 X158.842 Y197.259 E1.36358
G1 X158.842 Y196.725 E.01594
G1 X191.158 Y164.409 E1.36358
G1 X191.158 Y163.875 E.01594
G1 X158.842 Y196.19 E1.36358
G1 X158.842 Y195.656 E.01594
G1 X191.158 Y163.341 E1.36358
G1 X191.158 Y162.807 E.01594
G1 X158.842 Y195.122 E1.36358
G1 X158.842 Y194.588 E.01594
G1 X191.158 Y162.273 E1.36358
G1 X191.158 Y161.738 E.01594
G1 X158.842 Y194.054 E1.36358
G1 X158.842 Y193.519 E.01594
G1 X191.158 Y161.204 E1.36358
G1 X191.158 Y160.67 E.01594
G1 X158.842 Y192.985 E1.36358
G1 X158.842 Y192.451 E.01594
G1 X191.158 Y160.136 E1.36358
G1 X191.158 Y159.602 E.01594
G1 X158.842 Y191.917 E1.36358
G1 X158.842 Y191.383 E.01594
G1 X191.158 Y159.068 E1.36358
G1 X191.158 Y158.533 E.01594
G1 X158.842 Y190.849 E1.36358
G1 X158.842 Y190.314 E.01594
G1 X191.158 Y157.999 E1.36358
G1 X191.158 Y157.465 E.01594
G1 X158.842 Y189.78 E1.36358
G1 X158.842 Y189.246 E.01594
G1 X191.158 Y156.931 E1.36358
G1 X191.158 Y156.397 E.01594
G1 X158.842 Y188.712 E1.36358
G1 X158.842 Y188.178 E.01594
G1 X191.158 Y155.862 E1.36358
G1 X191.158 Y155.328 E.01594
G1 X158.842 Y187.644 E1.36358
G1 X158.842 Y187.109 E.01594
M73 P89 R6
G1 X191.158 Y154.794 E1.36358
G1 X191.158 Y154.26 E.01594
G1 X158.842 Y186.575 E1.36358
G1 X158.842 Y186.041 E.01594
G1 X191.158 Y153.726 E1.36358
G1 X191.158 Y153.192 E.01594
G1 X158.842 Y185.507 E1.36358
G1 X158.842 Y184.973 E.01594
G1 X191.158 Y152.657 E1.36358
G1 X191.158 Y152.123 E.01594
G1 X158.842 Y184.438 E1.36358
G1 X158.842 Y183.904 E.01594
G1 X191.158 Y151.589 E1.36358
G1 X191.158 Y151.055 E.01594
G1 X158.842 Y183.37 E1.36358
G1 X158.842 Y182.836 E.01594
G1 X191.158 Y150.521 E1.36358
G1 X191.158 Y149.987 E.01594
G1 X158.842 Y182.302 E1.36358
G1 X158.842 Y181.768 E.01594
G1 X191.158 Y149.452 E1.36358
G1 X191.158 Y148.918 E.01594
G1 X158.842 Y181.233 E1.36358
G1 X158.842 Y180.699 E.01594
G1 X191.158 Y148.384 E1.36358
G1 X191.158 Y147.85 E.01594
G1 X158.842 Y180.165 E1.36358
G1 X158.842 Y179.631 E.01594
G1 X191.158 Y147.316 E1.36358
G1 X191.158 Y146.781 E.01594
G1 X158.842 Y179.097 E1.36358
G1 X158.842 Y178.563 E.01594
G1 X191.158 Y146.247 E1.36358
G1 X191.158 Y145.713 E.01594
G1 X158.842 Y178.028 E1.36358
G1 X158.842 Y177.494 E.01594
G1 X191.158 Y145.179 E1.36358
G1 X191.158 Y144.645 E.01594
G1 X158.842 Y176.96 E1.36358
G1 X158.842 Y176.426 E.01594
G1 X191.158 Y144.111 E1.36358
G1 X191.158 Y143.576 E.01594
G1 X158.842 Y175.892 E1.36358
G1 X158.842 Y175.357 E.01594
G1 X191.158 Y143.042 E1.36358
G1 X191.158 Y142.508 E.01594
G1 X158.842 Y174.823 E1.36358
G1 X158.842 Y174.289 E.01594
G1 X191.158 Y141.974 E1.36358
G1 X191.158 Y141.44 E.01594
G1 X158.842 Y173.755 E1.36358
G1 X158.842 Y173.221 E.01594
G1 X191.158 Y140.906 E1.36358
G1 X191.158 Y140.371 E.01594
G1 X158.842 Y172.687 E1.36358
G1 X158.842 Y172.152 E.01594
G1 X191.158 Y139.837 E1.36358
G1 X191.158 Y139.303 E.01594
G1 X158.842 Y171.618 E1.36358
G1 X158.842 Y171.084 E.01594
G1 X191.158 Y138.769 E1.36358
G1 X191.158 Y138.235 E.01594
G1 X158.842 Y170.55 E1.36358
G1 X158.842 Y170.016 E.01594
G1 X191.158 Y137.7 E1.36358
G1 X191.158 Y137.166 E.01594
G1 X158.842 Y169.482 E1.36358
G1 X158.842 Y168.947 E.01594
G1 X191.158 Y136.632 E1.36358
G1 X191.158 Y136.098 E.01594
G1 X158.842 Y168.413 E1.36358
G1 X158.842 Y167.879 E.01594
G1 X191.158 Y135.564 E1.36358
G1 X191.158 Y135.03 E.01594
G1 X158.842 Y167.345 E1.36358
G1 X158.842 Y166.811 E.01594
G1 X191.158 Y134.495 E1.36358
G1 X191.158 Y133.961 E.01594
G1 X158.842 Y166.276 E1.36358
G1 X158.842 Y165.742 E.01594
G1 X191.158 Y133.427 E1.36358
G1 X191.158 Y132.893 E.01594
G1 X158.842 Y165.208 E1.36358
G1 X158.842 Y164.674 E.01594
G1 X191.158 Y132.359 E1.36358
G1 X191.158 Y131.825 E.01594
G1 X158.842 Y164.14 E1.36358
G1 X158.842 Y163.606 E.01594
G1 X191.158 Y131.29 E1.36358
G1 X191.158 Y130.756 E.01594
G1 X158.842 Y163.071 E1.36358
G1 X158.842 Y162.537 E.01594
G1 X191.158 Y130.222 E1.36358
G1 X191.158 Y129.688 E.01594
G1 X158.842 Y162.003 E1.36358
G1 X158.842 Y161.469 E.01594
G1 X191.158 Y129.154 E1.36358
G1 X191.158 Y128.619 E.01594
G1 X158.842 Y160.935 E1.36358
G1 X158.842 Y160.401 E.01594
G1 X191.158 Y128.085 E1.36358
G1 X191.158 Y127.551 E.01594
G1 X158.842 Y159.866 E1.36358
G1 X158.842 Y159.332 E.01594
G1 X191.158 Y127.017 E1.36358
G1 X191.158 Y126.483 E.01594
G1 X158.842 Y158.798 E1.36358
G1 X158.842 Y158.264 E.01594
G1 X191.158 Y125.949 E1.36358
G1 X191.158 Y125.414 E.01594
G1 X158.842 Y157.73 E1.36358
G1 X158.842 Y157.195 E.01594
G1 X191.158 Y124.88 E1.36358
G1 X191.158 Y124.346 E.01594
M73 P89 R5
G1 X158.842 Y156.661 E1.36358
G1 X158.842 Y156.127 E.01594
G1 X191.158 Y123.812 E1.36358
G1 X191.158 Y123.278 E.01594
G1 X158.842 Y155.593 E1.36358
G1 X158.842 Y155.059 E.01594
M73 P90 R5
G1 X191.158 Y122.744 E1.36358
G1 X191.158 Y122.209 E.01594
G1 X158.842 Y154.525 E1.36358
G1 X158.842 Y153.99 E.01594
G1 X191.158 Y121.675 E1.36358
G1 X191.158 Y121.141 E.01594
G1 X158.842 Y153.456 E1.36358
G1 X158.842 Y152.922 E.01594
G1 X191.158 Y120.607 E1.36358
G1 X191.158 Y120.073 E.01594
G1 X158.842 Y152.388 E1.36358
G1 X158.842 Y151.854 E.01594
G1 X191.158 Y119.538 E1.36358
G1 X191.158 Y119.004 E.01594
G1 X158.842 Y151.32 E1.36358
G1 X158.842 Y150.785 E.01594
G1 X190.785 Y118.842 E1.34787
G1 X190.251 Y118.842 E.01594
G1 X158.842 Y150.251 E1.32533
G1 X158.842 Y149.717 E.01594
G1 X189.717 Y118.842 E1.30279
G1 X189.183 Y118.842 E.01594
G1 X158.842 Y149.183 E1.28025
G1 X158.842 Y148.649 E.01594
G1 X188.649 Y118.842 E1.25771
G1 X188.114 Y118.842 E.01594
G1 X158.842 Y148.114 E1.23517
G1 X158.842 Y147.58 E.01594
G1 X187.58 Y118.842 E1.21263
G1 X187.046 Y118.842 E.01594
G1 X158.842 Y147.046 E1.19009
G1 X158.842 Y146.512 E.01594
G1 X186.512 Y118.842 E1.16755
G1 X185.978 Y118.842 E.01594
G1 X158.842 Y145.978 E1.14501
G1 X158.842 Y145.444 E.01594
G1 X185.444 Y118.842 E1.12247
G1 X184.909 Y118.842 E.01594
G1 X158.842 Y144.909 E1.09993
G1 X158.842 Y144.375 E.01594
G1 X184.375 Y118.842 E1.07739
G1 X183.841 Y118.842 E.01594
G1 X158.842 Y143.841 E1.05485
G1 X158.842 Y143.307 E.01594
G1 X183.307 Y118.842 E1.03231
G1 X182.773 Y118.842 E.01594
G1 X158.842 Y142.773 E1.00977
G1 X158.842 Y142.239 E.01594
G1 X182.239 Y118.842 E.98723
G1 X181.704 Y118.842 E.01594
G1 X158.842 Y141.704 E.96469
G1 X158.842 Y141.17 E.01594
G1 X181.17 Y118.842 E.94215
G1 X180.636 Y118.842 E.01594
G1 X158.842 Y140.636 E.91961
G1 X158.842 Y140.102 E.01594
G1 X180.102 Y118.842 E.89707
G1 X179.568 Y118.842 E.01594
G1 X158.842 Y139.568 E.87453
G1 X158.842 Y139.033 E.01594
G1 X179.033 Y118.842 E.85199
G1 X178.499 Y118.842 E.01594
G1 X158.842 Y138.499 E.82945
G1 X158.842 Y137.965 E.01594
G1 X177.965 Y118.842 E.80691
G1 X177.431 Y118.842 E.01594
G1 X158.842 Y137.431 E.78436
G1 X158.842 Y136.897 E.01594
G1 X176.897 Y118.842 E.76182
G1 X176.363 Y118.842 E.01594
G1 X158.842 Y136.363 E.73928
G1 X158.842 Y135.828 E.01594
G1 X175.828 Y118.842 E.71674
G1 X175.294 Y118.842 E.01594
G1 X158.842 Y135.294 E.6942
G1 X158.842 Y134.76 E.01594
G1 X174.76 Y118.842 E.67166
G1 X174.226 Y118.842 E.01594
G1 X158.842 Y134.226 E.64912
G1 X158.842 Y133.692 E.01594
G1 X173.692 Y118.842 E.62658
G1 X173.158 Y118.842 E.01594
G1 X158.842 Y133.158 E.60404
G1 X158.842 Y132.623 E.01594
G1 X172.623 Y118.842 E.5815
G1 X172.089 Y118.842 E.01594
G1 X158.842 Y132.089 E.55896
G1 X158.842 Y131.555 E.01594
G1 X171.555 Y118.842 E.53642
G1 X171.021 Y118.842 E.01594
G1 X158.842 Y131.021 E.51388
G1 X158.842 Y130.487 E.01594
G1 X170.487 Y118.842 E.49134
G1 X169.952 Y118.842 E.01594
G1 X158.842 Y129.952 E.4688
G1 X158.842 Y129.418 E.01594
G1 X169.418 Y118.842 E.44626
G1 X168.884 Y118.842 E.01594
G1 X158.842 Y128.884 E.42372
G1 X158.842 Y128.35 E.01594
G1 X168.35 Y118.842 E.40118
G1 X167.816 Y118.842 E.01594
G1 X158.842 Y127.816 E.37864
G1 X158.842 Y127.282 E.01594
G1 X167.282 Y118.842 E.3561
G1 X166.747 Y118.842 E.01594
G1 X158.842 Y126.747 E.33356
G1 X158.842 Y126.213 E.01594
G1 X166.213 Y118.842 E.31102
G1 X165.679 Y118.842 E.01594
G1 X158.842 Y125.679 E.28848
G1 X158.842 Y125.145 E.01594
G1 X165.145 Y118.842 E.26594
G1 X164.611 Y118.842 E.01594
G1 X158.842 Y124.611 E.2434
G1 X158.842 Y124.077 E.01594
G1 X164.077 Y118.842 E.22086
G1 X163.542 Y118.842 E.01594
G1 X158.842 Y123.542 E.19832
G1 X158.842 Y123.008 E.01594
G1 X163.008 Y118.842 E.17578
G1 X162.474 Y118.842 E.01594
G1 X158.842 Y122.474 E.15324
G1 X158.842 Y121.94 E.01594
G1 X161.94 Y118.842 E.1307
G1 X161.406 Y118.842 E.01594
G1 X158.842 Y121.406 E.10816
G1 X158.842 Y120.871 E.01594
G1 X160.871 Y118.842 E.08562
G1 X160.337 Y118.842 E.01594
G1 X158.842 Y120.337 E.06308
G1 X158.842 Y119.803 E.01594
G1 X159.803 Y118.842 E.04054
G1 X159.269 Y118.842 E.01594
G1 X158.673 Y119.439 E.02516
; WIPE_START
G1 X159.269 Y118.842 E-.32041
G1 X159.803 Y118.842 E-.20299
G1 X159.363 Y119.283 E-.2366
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.8 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 72 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z14.8 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer72 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 14.6
; LAYER_HEIGHT: 0.200001
;======== H2D 20250521========
; layer num/total_layer_count: 73/75
; update layer progress
M73 L73
M991 S0 P72 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X184.66 Y202.02 Z15 F60000
G1 X159.439 Y201.327 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42064
G1 F4765.435
M204 S8000
G1 X158.842 Y200.731 E.02516
G1 X158.842 Y200.197 E.01594
G1 X159.803 Y201.158 E.04054
G1 X160.337 Y201.158 E.01594
G1 X158.842 Y199.663 E.06308
G1 X158.842 Y199.129 E.01594
G1 X160.871 Y201.158 E.08562
G1 X161.406 Y201.158 E.01594
G1 X158.842 Y198.594 E.10816
G1 X158.842 Y198.06 E.01594
G1 X161.94 Y201.158 E.1307
G1 X162.474 Y201.158 E.01594
G1 X158.842 Y197.526 E.15324
G1 X158.842 Y196.992 E.01594
G1 X163.008 Y201.158 E.17578
G1 X163.542 Y201.158 E.01594
G1 X158.842 Y196.458 E.19832
G1 X158.842 Y195.924 E.01594
G1 X164.076 Y201.158 E.22086
G1 X164.611 Y201.158 E.01594
G1 X158.842 Y195.389 E.2434
G1 X158.842 Y194.855 E.01594
G1 X165.145 Y201.158 E.26594
G1 X165.679 Y201.158 E.01594
G1 X158.842 Y194.321 E.28848
G1 X158.842 Y193.787 E.01594
G1 X166.213 Y201.158 E.31102
G1 X166.747 Y201.158 E.01594
G1 X158.842 Y193.253 E.33356
G1 X158.842 Y192.718 E.01594
M73 P91 R5
G1 X167.282 Y201.158 E.3561
G1 X167.816 Y201.158 E.01594
G1 X158.842 Y192.184 E.37864
G1 X158.842 Y191.65 E.01594
G1 X168.35 Y201.158 E.40118
G1 X168.884 Y201.158 E.01594
G1 X158.842 Y191.116 E.42372
G1 X158.842 Y190.582 E.01594
G1 X169.418 Y201.158 E.44626
G1 X169.952 Y201.158 E.01594
G1 X158.842 Y190.048 E.4688
G1 X158.842 Y189.513 E.01594
G1 X170.487 Y201.158 E.49134
G1 X171.021 Y201.158 E.01594
G1 X158.842 Y188.979 E.51388
G1 X158.842 Y188.445 E.01594
G1 X171.555 Y201.158 E.53642
G1 X172.089 Y201.158 E.01594
G1 X158.842 Y187.911 E.55896
G1 X158.842 Y187.377 E.01594
G1 X172.623 Y201.158 E.5815
G1 X173.158 Y201.158 E.01594
G1 X158.842 Y186.842 E.60404
G1 X158.842 Y186.308 E.01594
G1 X173.692 Y201.158 E.62658
G1 X174.226 Y201.158 E.01594
G1 X158.842 Y185.774 E.64912
G1 X158.842 Y185.24 E.01594
G1 X174.76 Y201.158 E.67166
G1 X175.294 Y201.158 E.01594
G1 X158.842 Y184.706 E.6942
G1 X158.842 Y184.172 E.01594
G1 X175.828 Y201.158 E.71674
G1 X176.363 Y201.158 E.01594
G1 X158.842 Y183.637 E.73928
G1 X158.842 Y183.103 E.01594
G1 X176.897 Y201.158 E.76182
G1 X177.431 Y201.158 E.01594
G1 X158.842 Y182.569 E.78436
G1 X158.842 Y182.035 E.01594
G1 X177.965 Y201.158 E.8069
G1 X178.499 Y201.158 E.01594
G1 X158.842 Y181.501 E.82944
G1 X158.842 Y180.967 E.01594
G1 X179.033 Y201.158 E.85198
G1 X179.568 Y201.158 E.01594
G1 X158.842 Y180.432 E.87452
G1 X158.842 Y179.898 E.01594
G1 X180.102 Y201.158 E.89706
G1 X180.636 Y201.158 E.01594
G1 X158.842 Y179.364 E.9196
G1 X158.842 Y178.83 E.01594
G1 X181.17 Y201.158 E.94215
G1 X181.704 Y201.158 E.01594
G1 X158.842 Y178.296 E.96469
G1 X158.842 Y177.761 E.01594
G1 X182.239 Y201.158 E.98723
G1 X182.773 Y201.158 E.01594
G1 X158.842 Y177.227 E1.00977
G1 X158.842 Y176.693 E.01594
G1 X183.307 Y201.158 E1.03231
G1 X183.841 Y201.158 E.01594
G1 X158.842 Y176.159 E1.05485
G1 X158.842 Y175.625 E.01594
G1 X184.375 Y201.158 E1.07739
G1 X184.909 Y201.158 E.01594
G1 X158.842 Y175.091 E1.09993
G1 X158.842 Y174.556 E.01594
G1 X185.444 Y201.158 E1.12247
G1 X185.978 Y201.158 E.01594
G1 X158.842 Y174.022 E1.14501
G1 X158.842 Y173.488 E.01594
G1 X186.512 Y201.158 E1.16755
G1 X187.046 Y201.158 E.01594
G1 X158.842 Y172.954 E1.19009
G1 X158.842 Y172.42 E.01594
G1 X187.58 Y201.158 E1.21263
G1 X188.114 Y201.158 E.01594
G1 X158.842 Y171.886 E1.23517
G1 X158.842 Y171.351 E.01594
G1 X188.649 Y201.158 E1.25771
G1 X189.183 Y201.158 E.01594
G1 X158.842 Y170.817 E1.28025
G1 X158.842 Y170.283 E.01594
G1 X189.717 Y201.158 E1.30279
G1 X190.251 Y201.158 E.01594
G1 X158.842 Y169.749 E1.32533
G1 X158.842 Y169.215 E.01594
G1 X190.785 Y201.158 E1.34787
G1 X191.158 Y201.158 E.01111
G1 X191.158 Y200.996 E.00483
G1 X158.842 Y168.68 E1.36358
G1 X158.842 Y168.146 E.01594
G1 X191.158 Y200.462 E1.36358
G1 X191.158 Y199.927 E.01594
G1 X158.842 Y167.612 E1.36358
G1 X158.842 Y167.078 E.01594
G1 X191.158 Y199.393 E1.36358
G1 X191.158 Y198.859 E.01594
G1 X158.842 Y166.544 E1.36358
G1 X158.842 Y166.01 E.01594
G1 X191.158 Y198.325 E1.36358
G1 X191.158 Y197.791 E.01594
G1 X158.842 Y165.475 E1.36358
G1 X158.842 Y164.941 E.01594
G1 X191.158 Y197.256 E1.36358
G1 X191.158 Y196.722 E.01594
G1 X158.842 Y164.407 E1.36358
G1 X158.842 Y163.873 E.01594
G1 X191.158 Y196.188 E1.36358
G1 X191.158 Y195.654 E.01594
G1 X158.842 Y163.339 E1.36358
G1 X158.842 Y162.805 E.01594
M73 P91 R4
G1 X191.158 Y195.12 E1.36358
G1 X191.158 Y194.586 E.01594
G1 X158.842 Y162.27 E1.36358
G1 X158.842 Y161.736 E.01594
G1 X191.158 Y194.051 E1.36358
G1 X191.158 Y193.517 E.01594
G1 X158.842 Y161.202 E1.36358
G1 X158.842 Y160.668 E.01594
G1 X191.158 Y192.983 E1.36358
G1 X191.158 Y192.449 E.01594
G1 X158.842 Y160.134 E1.36358
G1 X158.842 Y159.599 E.01594
G1 X191.158 Y191.915 E1.36358
G1 X191.158 Y191.381 E.01594
G1 X158.842 Y159.065 E1.36358
G1 X158.842 Y158.531 E.01594
G1 X191.158 Y190.846 E1.36358
G1 X191.158 Y190.312 E.01594
G1 X158.842 Y157.997 E1.36358
G1 X158.842 Y157.463 E.01594
G1 X191.158 Y189.778 E1.36358
G1 X191.158 Y189.244 E.01594
G1 X158.842 Y156.929 E1.36358
G1 X158.842 Y156.394 E.01594
G1 X191.158 Y188.71 E1.36358
G1 X191.158 Y188.175 E.01594
G1 X158.842 Y155.86 E1.36358
G1 X158.842 Y155.326 E.01594
G1 X191.158 Y187.641 E1.36358
G1 X191.158 Y187.107 E.01594
G1 X158.842 Y154.792 E1.36358
G1 X158.842 Y154.258 E.01594
G1 X191.158 Y186.573 E1.36358
G1 X191.158 Y186.039 E.01594
G1 X158.842 Y153.724 E1.36358
G1 X158.842 Y153.189 E.01594
G1 X191.158 Y185.505 E1.36358
G1 X191.158 Y184.97 E.01594
G1 X158.842 Y152.655 E1.36358
G1 X158.842 Y152.121 E.01594
G1 X191.158 Y184.436 E1.36358
G1 X191.158 Y183.902 E.01594
M73 P92 R4
G1 X158.842 Y151.587 E1.36358
G1 X158.842 Y151.053 E.01594
G1 X191.158 Y183.368 E1.36358
G1 X191.158 Y182.834 E.01594
G1 X158.842 Y150.518 E1.36358
G1 X158.842 Y149.984 E.01594
G1 X191.158 Y182.3 E1.36358
G1 X191.158 Y181.765 E.01594
G1 X158.842 Y149.45 E1.36358
G1 X158.842 Y148.916 E.01594
G1 X191.158 Y181.231 E1.36358
G1 X191.158 Y180.697 E.01594
G1 X158.842 Y148.382 E1.36358
G1 X158.842 Y147.848 E.01594
G1 X191.158 Y180.163 E1.36358
G1 X191.158 Y179.629 E.01594
G1 X158.842 Y147.313 E1.36358
G1 X158.842 Y146.779 E.01594
G1 X191.158 Y179.094 E1.36358
G1 X191.158 Y178.56 E.01594
G1 X158.842 Y146.245 E1.36358
G1 X158.842 Y145.711 E.01594
G1 X191.158 Y178.026 E1.36358
G1 X191.158 Y177.492 E.01594
G1 X158.842 Y145.177 E1.36358
G1 X158.842 Y144.643 E.01594
G1 X191.158 Y176.958 E1.36358
G1 X191.158 Y176.424 E.01594
G1 X158.842 Y144.108 E1.36358
G1 X158.842 Y143.574 E.01594
G1 X191.158 Y175.889 E1.36358
G1 X191.158 Y175.355 E.01594
G1 X158.842 Y143.04 E1.36358
G1 X158.842 Y142.506 E.01594
G1 X191.158 Y174.821 E1.36358
G1 X191.158 Y174.287 E.01594
G1 X158.842 Y141.972 E1.36358
G1 X158.842 Y141.437 E.01594
G1 X191.158 Y173.753 E1.36358
G1 X191.158 Y173.219 E.01594
G1 X158.842 Y140.903 E1.36358
G1 X158.842 Y140.369 E.01594
G1 X191.158 Y172.684 E1.36358
G1 X191.158 Y172.15 E.01594
G1 X158.842 Y139.835 E1.36358
G1 X158.842 Y139.301 E.01594
G1 X191.158 Y171.616 E1.36358
G1 X191.158 Y171.082 E.01594
G1 X158.842 Y138.767 E1.36358
G1 X158.842 Y138.232 E.01594
G1 X191.158 Y170.548 E1.36358
G1 X191.158 Y170.013 E.01594
G1 X158.842 Y137.698 E1.36358
G1 X158.842 Y137.164 E.01594
G1 X191.158 Y169.479 E1.36358
G1 X191.158 Y168.945 E.01594
G1 X158.842 Y136.63 E1.36358
G1 X158.842 Y136.096 E.01594
G1 X191.158 Y168.411 E1.36358
G1 X191.158 Y167.877 E.01594
G1 X158.842 Y135.562 E1.36358
G1 X158.842 Y135.027 E.01594
G1 X191.158 Y167.343 E1.36358
G1 X191.158 Y166.808 E.01594
G1 X158.842 Y134.493 E1.36358
G1 X158.842 Y133.959 E.01594
G1 X191.158 Y166.274 E1.36358
G1 X191.158 Y165.74 E.01594
G1 X158.842 Y133.425 E1.36358
G1 X158.842 Y132.891 E.01594
G1 X191.158 Y165.206 E1.36358
G1 X191.158 Y164.672 E.01594
G1 X158.842 Y132.356 E1.36358
G1 X158.842 Y131.822 E.01594
G1 X191.158 Y164.138 E1.36358
G1 X191.158 Y163.603 E.01594
G1 X158.842 Y131.288 E1.36358
G1 X158.842 Y130.754 E.01594
G1 X191.158 Y163.069 E1.36358
G1 X191.158 Y162.535 E.01594
G1 X158.842 Y130.22 E1.36358
G1 X158.842 Y129.686 E.01594
G1 X191.158 Y162.001 E1.36358
G1 X191.158 Y161.467 E.01594
G1 X158.842 Y129.151 E1.36358
G1 X158.842 Y128.617 E.01594
G1 X191.158 Y160.932 E1.36358
G1 X191.158 Y160.398 E.01594
G1 X158.842 Y128.083 E1.36358
G1 X158.842 Y127.549 E.01594
G1 X191.158 Y159.864 E1.36358
G1 X191.158 Y159.33 E.01594
G1 X158.842 Y127.015 E1.36358
G1 X158.842 Y126.481 E.01594
G1 X191.158 Y158.796 E1.36358
G1 X191.158 Y158.262 E.01594
G1 X158.842 Y125.946 E1.36358
G1 X158.842 Y125.412 E.01594
G1 X191.158 Y157.727 E1.36358
G1 X191.158 Y157.193 E.01594
G1 X158.842 Y124.878 E1.36358
G1 X158.842 Y124.344 E.01594
G1 X191.158 Y156.659 E1.36358
G1 X191.158 Y156.125 E.01594
G1 X158.842 Y123.81 E1.36358
G1 X158.842 Y123.275 E.01594
G1 X191.158 Y155.591 E1.36358
G1 X191.158 Y155.057 E.01594
G1 X158.842 Y122.741 E1.36358
G1 X158.842 Y122.207 E.01594
G1 X191.158 Y154.522 E1.36358
G1 X191.158 Y153.988 E.01594
G1 X158.842 Y121.673 E1.36358
G1 X158.842 Y121.139 E.01594
G1 X191.158 Y153.454 E1.36358
G1 X191.158 Y152.92 E.01594
G1 X158.842 Y120.605 E1.36358
G1 X158.842 Y120.07 E.01594
G1 X191.158 Y152.386 E1.36358
G1 X191.158 Y151.851 E.01594
M73 P93 R4
G1 X158.842 Y119.536 E1.36358
G1 X158.842 Y119.002 E.01594
G1 X191.158 Y151.317 E1.36358
G1 X191.158 Y150.783 E.01594
G1 X159.217 Y118.842 E1.34777
G1 X159.751 Y118.842 E.01594
G1 X191.158 Y150.249 E1.32523
G1 X191.158 Y149.715 E.01594
G1 X160.285 Y118.842 E1.30269
G1 X160.819 Y118.842 E.01594
G1 X191.158 Y149.181 E1.28015
G1 X191.158 Y148.646 E.01594
G1 X161.354 Y118.842 E1.25761
G1 X161.888 Y118.842 E.01594
G1 X191.158 Y148.112 E1.23507
G1 X191.158 Y147.578 E.01594
G1 X162.422 Y118.842 E1.21253
G1 X162.956 Y118.842 E.01594
G1 X191.158 Y147.044 E1.18999
G1 X191.158 Y146.51 E.01594
G1 X163.49 Y118.842 E1.16745
G1 X164.024 Y118.842 E.01594
G1 X191.158 Y145.976 E1.14491
G1 X191.158 Y145.441 E.01594
G1 X164.559 Y118.842 E1.12237
G1 X165.093 Y118.842 E.01594
G1 X191.158 Y144.907 E1.09983
G1 X191.158 Y144.373 E.01594
G1 X165.627 Y118.842 E1.07729
G1 X166.161 Y118.842 E.01594
G1 X191.158 Y143.839 E1.05475
G1 X191.158 Y143.305 E.01594
G1 X166.695 Y118.842 E1.03221
G1 X167.23 Y118.842 E.01594
G1 X191.158 Y142.77 E1.00967
G1 X191.158 Y142.236 E.01594
G1 X167.764 Y118.842 E.98713
G1 X168.298 Y118.842 E.01594
G1 X191.158 Y141.702 E.96459
G1 X191.158 Y141.168 E.01594
G1 X168.832 Y118.842 E.94205
G1 X169.366 Y118.842 E.01594
G1 X191.158 Y140.634 E.91951
G1 X191.158 Y140.1 E.01594
M73 P93 R3
G1 X169.9 Y118.842 E.89697
G1 X170.435 Y118.842 E.01594
G1 X191.158 Y139.565 E.87443
G1 X191.158 Y139.031 E.01594
G1 X170.969 Y118.842 E.85189
G1 X171.503 Y118.842 E.01594
G1 X191.158 Y138.497 E.82935
G1 X191.158 Y137.963 E.01594
G1 X172.037 Y118.842 E.80681
G1 X172.571 Y118.842 E.01594
G1 X191.158 Y137.429 E.78427
G1 X191.158 Y136.894 E.01594
G1 X173.106 Y118.842 E.76173
G1 X173.64 Y118.842 E.01594
G1 X191.158 Y136.36 E.73919
G1 X191.158 Y135.826 E.01594
G1 X174.174 Y118.842 E.71665
G1 X174.708 Y118.842 E.01594
G1 X191.158 Y135.292 E.69411
G1 X191.158 Y134.758 E.01594
G1 X175.242 Y118.842 E.67157
G1 X175.776 Y118.842 E.01594
G1 X191.158 Y134.224 E.64903
G1 X191.158 Y133.689 E.01594
G1 X176.311 Y118.842 E.62649
G1 X176.845 Y118.842 E.01594
G1 X191.158 Y133.155 E.60395
G1 X191.158 Y132.621 E.01594
G1 X177.379 Y118.842 E.58141
G1 X177.913 Y118.842 E.01594
G1 X191.158 Y132.087 E.55887
G1 X191.158 Y131.553 E.01594
G1 X178.447 Y118.842 E.53633
G1 X178.981 Y118.842 E.01594
G1 X191.158 Y131.019 E.51379
G1 X191.158 Y130.484 E.01594
G1 X179.516 Y118.842 E.49125
G1 X180.05 Y118.842 E.01594
G1 X191.158 Y129.95 E.46871
G1 X191.158 Y129.416 E.01594
G1 X180.584 Y118.842 E.44617
G1 X181.118 Y118.842 E.01594
G1 X191.158 Y128.882 E.42363
G1 X191.158 Y128.348 E.01594
G1 X181.652 Y118.842 E.40109
G1 X182.187 Y118.842 E.01594
G1 X191.158 Y127.813 E.37855
G1 X191.158 Y127.279 E.01594
G1 X182.721 Y118.842 E.35601
G1 X183.255 Y118.842 E.01594
G1 X191.158 Y126.745 E.33347
G1 X191.158 Y126.211 E.01594
G1 X183.789 Y118.842 E.31093
G1 X184.323 Y118.842 E.01594
G1 X191.158 Y125.677 E.28839
G1 X191.158 Y125.143 E.01594
G1 X184.857 Y118.842 E.26584
G1 X185.392 Y118.842 E.01594
G1 X191.158 Y124.608 E.2433
G1 X191.158 Y124.074 E.01594
G1 X185.926 Y118.842 E.22076
G1 X186.46 Y118.842 E.01594
G1 X191.158 Y123.54 E.19822
G1 X191.158 Y123.006 E.01594
G1 X186.994 Y118.842 E.17568
G1 X187.528 Y118.842 E.01594
G1 X191.158 Y122.472 E.15314
G1 X191.158 Y121.938 E.01594
G1 X188.062 Y118.842 E.1306
G1 X188.597 Y118.842 E.01594
G1 X191.158 Y121.403 E.10806
G1 X191.158 Y120.869 E.01594
G1 X189.131 Y118.842 E.08552
G1 X189.665 Y118.842 E.01594
G1 X191.158 Y120.335 E.06298
G1 X191.158 Y119.801 E.01594
G1 X190.199 Y118.842 E.04044
G1 X190.733 Y118.842 E.01594
G1 X191.327 Y119.436 E.02506
; WIPE_START
G1 X190.733 Y118.842 E-.31919
G1 X190.199 Y118.842 E-.20299
G1 X190.642 Y119.285 E-.23782
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z15 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 73 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z15 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer73 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 14.8
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 74/75
; update layer progress
M73 L74
M991 S0 P73 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X191.491 Y201.491 F60000
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4421.739
M204 S8000
G1 X158.509 Y201.491 E1.06057
G1 X158.509 Y118.509 E2.66839
G1 X191.491 Y118.509 E1.06057
G1 X191.491 Y201.431 E2.66646
; COOLING_NODE: 0
M204 S10000
G1 X191.898 Y201.898 F60000
G1 F4421.739
M204 S8000
G1 X158.102 Y201.898 E1.08675
G1 X158.102 Y118.102 E2.69457
G1 X191.898 Y118.102 E1.08675
G1 X191.898 Y201.838 E2.69264
; COOLING_NODE: 0
M204 S10000
G1 X192.29 Y202.29 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X190.564 Y201.327 Z15.2 F60000
G1 Z14.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42064
G1 F4765.435
M204 S8000
G1 X191.158 Y200.733 E.02506
G1 X191.158 Y200.199 E.01594
G1 X190.199 Y201.158 E.04044
G1 X189.665 Y201.158 E.01594
G1 X191.158 Y199.665 E.06298
G1 X191.158 Y199.131 E.01594
G1 X189.131 Y201.158 E.08552
G1 X188.597 Y201.158 E.01594
G1 X191.158 Y198.597 E.10806
G1 X191.158 Y198.062 E.01594
G1 X188.062 Y201.158 E.1306
G1 X187.528 Y201.158 E.01594
G1 X191.158 Y197.528 E.15314
G1 X191.158 Y196.994 E.01594
G1 X186.994 Y201.158 E.17568
G1 X186.46 Y201.158 E.01594
G1 X191.158 Y196.46 E.19822
G1 X191.158 Y195.926 E.01594
G1 X185.926 Y201.158 E.22076
G1 X185.392 Y201.158 E.01594
G1 X191.158 Y195.392 E.2433
G1 X191.158 Y194.857 E.01594
G1 X184.857 Y201.158 E.26585
G1 X184.323 Y201.158 E.01594
G1 X191.158 Y194.323 E.28839
G1 X191.158 Y193.789 E.01594
G1 X183.789 Y201.158 E.31093
G1 X183.255 Y201.158 E.01594
G1 X191.158 Y193.255 E.33347
G1 X191.158 Y192.721 E.01594
G1 X182.721 Y201.158 E.35601
G1 X182.187 Y201.158 E.01594
G1 X191.158 Y192.187 E.37855
G1 X191.158 Y191.652 E.01594
G1 X181.652 Y201.158 E.40109
G1 X181.118 Y201.158 E.01594
G1 X191.158 Y191.118 E.42363
G1 X191.158 Y190.584 E.01594
G1 X180.584 Y201.158 E.44617
G1 X180.05 Y201.158 E.01594
G1 X191.158 Y190.05 E.46871
G1 X191.158 Y189.516 E.01594
G1 X179.516 Y201.158 E.49125
G1 X178.981 Y201.158 E.01594
G1 X191.158 Y188.981 E.51379
G1 X191.158 Y188.447 E.01594
G1 X178.447 Y201.158 E.53633
G1 X177.913 Y201.158 E.01594
G1 X191.158 Y187.913 E.55887
G1 X191.158 Y187.379 E.01594
G1 X177.379 Y201.158 E.58141
G1 X176.845 Y201.158 E.01594
G1 X191.158 Y186.845 E.60395
G1 X191.158 Y186.311 E.01594
G1 X176.311 Y201.158 E.62649
G1 X175.776 Y201.158 E.01594
G1 X191.158 Y185.776 E.64903
G1 X191.158 Y185.242 E.01594
G1 X175.242 Y201.158 E.67157
G1 X174.708 Y201.158 E.01594
G1 X191.158 Y184.708 E.69411
G1 X191.158 Y184.174 E.01594
G1 X174.174 Y201.158 E.71665
G1 X173.64 Y201.158 E.01594
G1 X191.158 Y183.64 E.73919
G1 X191.158 Y183.106 E.01594
M73 P94 R3
G1 X173.106 Y201.158 E.76173
G1 X172.571 Y201.158 E.01594
G1 X191.158 Y182.571 E.78427
G1 X191.158 Y182.037 E.01594
G1 X172.037 Y201.158 E.80681
G1 X171.503 Y201.158 E.01594
G1 X191.158 Y181.503 E.82935
G1 X191.158 Y180.969 E.01594
G1 X170.969 Y201.158 E.85189
G1 X170.435 Y201.158 E.01594
G1 X191.158 Y180.435 E.87443
G1 X191.158 Y179.9 E.01594
G1 X169.9 Y201.158 E.89697
G1 X169.366 Y201.158 E.01594
G1 X191.158 Y179.366 E.91951
G1 X191.158 Y178.832 E.01594
G1 X168.832 Y201.158 E.94205
G1 X168.298 Y201.158 E.01594
G1 X191.158 Y178.298 E.96459
G1 X191.158 Y177.764 E.01594
G1 X167.764 Y201.158 E.98713
G1 X167.23 Y201.158 E.01594
G1 X191.158 Y177.23 E1.00967
G1 X191.158 Y176.695 E.01594
G1 X166.695 Y201.158 E1.03221
G1 X166.161 Y201.158 E.01594
G1 X191.158 Y176.161 E1.05475
G1 X191.158 Y175.627 E.01594
G1 X165.627 Y201.158 E1.07729
G1 X165.093 Y201.158 E.01594
G1 X191.158 Y175.093 E1.09983
G1 X191.158 Y174.559 E.01594
G1 X164.559 Y201.158 E1.12237
G1 X164.024 Y201.158 E.01594
G1 X191.158 Y174.024 E1.14491
G1 X191.158 Y173.49 E.01594
G1 X163.49 Y201.158 E1.16745
G1 X162.956 Y201.158 E.01594
G1 X191.158 Y172.956 E1.18999
G1 X191.158 Y172.422 E.01594
G1 X162.422 Y201.158 E1.21253
G1 X161.888 Y201.158 E.01594
G1 X191.158 Y171.888 E1.23507
G1 X191.158 Y171.354 E.01594
G1 X161.354 Y201.158 E1.25761
G1 X160.819 Y201.158 E.01594
G1 X191.158 Y170.819 E1.28015
G1 X191.158 Y170.285 E.01594
G1 X160.285 Y201.158 E1.30269
G1 X159.751 Y201.158 E.01594
G1 X191.158 Y169.751 E1.32523
G1 X191.158 Y169.217 E.01594
G1 X159.217 Y201.158 E1.34777
G1 X158.842 Y201.158 E.01117
G1 X158.842 Y200.998 E.00476
G1 X191.158 Y168.683 E1.36358
G1 X191.158 Y168.149 E.01594
G1 X158.842 Y200.464 E1.36358
G1 X158.842 Y199.93 E.01594
G1 X191.158 Y167.614 E1.36358
G1 X191.158 Y167.08 E.01594
G1 X158.842 Y199.395 E1.36358
G1 X158.842 Y198.861 E.01594
G1 X191.158 Y166.546 E1.36358
G1 X191.158 Y166.012 E.01594
G1 X158.842 Y198.327 E1.36358
G1 X158.842 Y197.793 E.01594
G1 X191.158 Y165.478 E1.36358
G1 X191.158 Y164.943 E.01594
G1 X158.842 Y197.259 E1.36358
G1 X158.842 Y196.725 E.01594
G1 X191.158 Y164.409 E1.36358
G1 X191.158 Y163.875 E.01594
G1 X158.842 Y196.19 E1.36358
G1 X158.842 Y195.656 E.01594
G1 X191.158 Y163.341 E1.36358
G1 X191.158 Y162.807 E.01594
G1 X158.842 Y195.122 E1.36358
G1 X158.842 Y194.588 E.01594
G1 X191.158 Y162.273 E1.36358
G1 X191.158 Y161.738 E.01594
G1 X158.842 Y194.054 E1.36358
G1 X158.842 Y193.519 E.01594
G1 X191.158 Y161.204 E1.36358
G1 X191.158 Y160.67 E.01594
G1 X158.842 Y192.985 E1.36358
G1 X158.842 Y192.451 E.01594
G1 X191.158 Y160.136 E1.36358
G1 X191.158 Y159.602 E.01594
G1 X158.842 Y191.917 E1.36358
G1 X158.842 Y191.383 E.01594
G1 X191.158 Y159.068 E1.36358
G1 X191.158 Y158.533 E.01594
G1 X158.842 Y190.849 E1.36358
G1 X158.842 Y190.314 E.01594
G1 X191.158 Y157.999 E1.36358
G1 X191.158 Y157.465 E.01594
G1 X158.842 Y189.78 E1.36358
G1 X158.842 Y189.246 E.01594
G1 X191.158 Y156.931 E1.36358
G1 X191.158 Y156.397 E.01594
G1 X158.842 Y188.712 E1.36358
G1 X158.842 Y188.178 E.01594
G1 X191.158 Y155.862 E1.36358
G1 X191.158 Y155.328 E.01594
G1 X158.842 Y187.644 E1.36358
G1 X158.842 Y187.109 E.01594
G1 X191.158 Y154.794 E1.36358
G1 X191.158 Y154.26 E.01594
G1 X158.842 Y186.575 E1.36358
G1 X158.842 Y186.041 E.01594
G1 X191.158 Y153.726 E1.36358
G1 X191.158 Y153.192 E.01594
G1 X158.842 Y185.507 E1.36358
G1 X158.842 Y184.973 E.01594
G1 X191.158 Y152.657 E1.36358
G1 X191.158 Y152.123 E.01594
G1 X158.842 Y184.438 E1.36358
G1 X158.842 Y183.904 E.01594
G1 X191.158 Y151.589 E1.36358
G1 X191.158 Y151.055 E.01594
G1 X158.842 Y183.37 E1.36358
G1 X158.842 Y182.836 E.01594
G1 X191.158 Y150.521 E1.36358
G1 X191.158 Y149.987 E.01594
G1 X158.842 Y182.302 E1.36358
G1 X158.842 Y181.768 E.01594
G1 X191.158 Y149.452 E1.36358
G1 X191.158 Y148.918 E.01594
G1 X158.842 Y181.233 E1.36358
G1 X158.842 Y180.699 E.01594
G1 X191.158 Y148.384 E1.36358
G1 X191.158 Y147.85 E.01594
M73 P95 R2
G1 X158.842 Y180.165 E1.36358
G1 X158.842 Y179.631 E.01594
G1 X191.158 Y147.316 E1.36358
G1 X191.158 Y146.781 E.01594
G1 X158.842 Y179.097 E1.36358
G1 X158.842 Y178.563 E.01594
G1 X191.158 Y146.247 E1.36358
G1 X191.158 Y145.713 E.01594
G1 X158.842 Y178.028 E1.36358
G1 X158.842 Y177.494 E.01594
G1 X191.158 Y145.179 E1.36358
G1 X191.158 Y144.645 E.01594
G1 X158.842 Y176.96 E1.36358
G1 X158.842 Y176.426 E.01594
G1 X191.158 Y144.111 E1.36358
G1 X191.158 Y143.576 E.01594
G1 X158.842 Y175.892 E1.36358
G1 X158.842 Y175.357 E.01594
G1 X191.158 Y143.042 E1.36358
G1 X191.158 Y142.508 E.01594
G1 X158.842 Y174.823 E1.36358
G1 X158.842 Y174.289 E.01594
G1 X191.158 Y141.974 E1.36358
G1 X191.158 Y141.44 E.01594
G1 X158.842 Y173.755 E1.36358
G1 X158.842 Y173.221 E.01594
G1 X191.158 Y140.906 E1.36358
G1 X191.158 Y140.371 E.01594
G1 X158.842 Y172.687 E1.36358
G1 X158.842 Y172.152 E.01594
G1 X191.158 Y139.837 E1.36358
G1 X191.158 Y139.303 E.01594
G1 X158.842 Y171.618 E1.36358
G1 X158.842 Y171.084 E.01594
G1 X191.158 Y138.769 E1.36358
G1 X191.158 Y138.235 E.01594
G1 X158.842 Y170.55 E1.36358
G1 X158.842 Y170.016 E.01594
G1 X191.158 Y137.7 E1.36358
G1 X191.158 Y137.166 E.01594
G1 X158.842 Y169.482 E1.36358
G1 X158.842 Y168.947 E.01594
G1 X191.158 Y136.632 E1.36358
G1 X191.158 Y136.098 E.01594
G1 X158.842 Y168.413 E1.36358
G1 X158.842 Y167.879 E.01594
G1 X191.158 Y135.564 E1.36358
G1 X191.158 Y135.03 E.01594
G1 X158.842 Y167.345 E1.36358
G1 X158.842 Y166.811 E.01594
G1 X191.158 Y134.495 E1.36358
G1 X191.158 Y133.961 E.01594
G1 X158.842 Y166.276 E1.36358
G1 X158.842 Y165.742 E.01594
G1 X191.158 Y133.427 E1.36358
G1 X191.158 Y132.893 E.01594
G1 X158.842 Y165.208 E1.36358
G1 X158.842 Y164.674 E.01594
G1 X191.158 Y132.359 E1.36358
G1 X191.158 Y131.825 E.01594
G1 X158.842 Y164.14 E1.36358
G1 X158.842 Y163.606 E.01594
G1 X191.158 Y131.29 E1.36358
G1 X191.158 Y130.756 E.01594
G1 X158.842 Y163.071 E1.36358
G1 X158.842 Y162.537 E.01594
G1 X191.158 Y130.222 E1.36358
G1 X191.158 Y129.688 E.01594
G1 X158.842 Y162.003 E1.36358
G1 X158.842 Y161.469 E.01594
G1 X191.158 Y129.154 E1.36358
G1 X191.158 Y128.619 E.01594
G1 X158.842 Y160.935 E1.36358
G1 X158.842 Y160.401 E.01594
G1 X191.158 Y128.085 E1.36358
G1 X191.158 Y127.551 E.01594
G1 X158.842 Y159.866 E1.36358
G1 X158.842 Y159.332 E.01594
G1 X191.158 Y127.017 E1.36358
G1 X191.158 Y126.483 E.01594
G1 X158.842 Y158.798 E1.36358
G1 X158.842 Y158.264 E.01594
G1 X191.158 Y125.949 E1.36358
G1 X191.158 Y125.414 E.01594
G1 X158.842 Y157.73 E1.36358
G1 X158.842 Y157.195 E.01594
G1 X191.158 Y124.88 E1.36358
G1 X191.158 Y124.346 E.01594
G1 X158.842 Y156.661 E1.36358
G1 X158.842 Y156.127 E.01594
G1 X191.158 Y123.812 E1.36358
G1 X191.158 Y123.278 E.01594
G1 X158.842 Y155.593 E1.36358
G1 X158.842 Y155.059 E.01594
G1 X191.158 Y122.744 E1.36358
G1 X191.158 Y122.209 E.01594
G1 X158.842 Y154.525 E1.36358
G1 X158.842 Y153.99 E.01594
G1 X191.158 Y121.675 E1.36358
G1 X191.158 Y121.141 E.01594
G1 X158.842 Y153.456 E1.36358
G1 X158.842 Y152.922 E.01594
G1 X191.158 Y120.607 E1.36358
G1 X191.158 Y120.073 E.01594
G1 X158.842 Y152.388 E1.36358
G1 X158.842 Y151.854 E.01594
G1 X191.158 Y119.538 E1.36358
G1 X191.158 Y119.004 E.01594
G1 X158.842 Y151.32 E1.36358
G1 X158.842 Y150.785 E.01594
G1 X190.785 Y118.842 E1.34787
G1 X190.251 Y118.842 E.01594
G1 X158.842 Y150.251 E1.32533
G1 X158.842 Y149.717 E.01594
G1 X189.717 Y118.842 E1.30279
G1 X189.183 Y118.842 E.01594
G1 X158.842 Y149.183 E1.28025
G1 X158.842 Y148.649 E.01594
G1 X188.649 Y118.842 E1.25771
G1 X188.114 Y118.842 E.01594
G1 X158.842 Y148.114 E1.23517
G1 X158.842 Y147.58 E.01594
M73 P96 R2
G1 X187.58 Y118.842 E1.21263
G1 X187.046 Y118.842 E.01594
G1 X158.842 Y147.046 E1.19009
G1 X158.842 Y146.512 E.01594
G1 X186.512 Y118.842 E1.16755
G1 X185.978 Y118.842 E.01594
G1 X158.842 Y145.978 E1.14501
G1 X158.842 Y145.444 E.01594
G1 X185.444 Y118.842 E1.12247
G1 X184.909 Y118.842 E.01594
G1 X158.842 Y144.909 E1.09993
G1 X158.842 Y144.375 E.01594
G1 X184.375 Y118.842 E1.07739
G1 X183.841 Y118.842 E.01594
G1 X158.842 Y143.841 E1.05485
G1 X158.842 Y143.307 E.01594
G1 X183.307 Y118.842 E1.03231
G1 X182.773 Y118.842 E.01594
G1 X158.842 Y142.773 E1.00977
G1 X158.842 Y142.239 E.01594
G1 X182.239 Y118.842 E.98723
G1 X181.704 Y118.842 E.01594
G1 X158.842 Y141.704 E.96469
G1 X158.842 Y141.17 E.01594
G1 X181.17 Y118.842 E.94215
G1 X180.636 Y118.842 E.01594
G1 X158.842 Y140.636 E.91961
G1 X158.842 Y140.102 E.01594
G1 X180.102 Y118.842 E.89707
G1 X179.568 Y118.842 E.01594
G1 X158.842 Y139.568 E.87453
G1 X158.842 Y139.033 E.01594
G1 X179.033 Y118.842 E.85199
G1 X178.499 Y118.842 E.01594
G1 X158.842 Y138.499 E.82945
G1 X158.842 Y137.965 E.01594
G1 X177.965 Y118.842 E.80691
G1 X177.431 Y118.842 E.01594
G1 X158.842 Y137.431 E.78436
G1 X158.842 Y136.897 E.01594
G1 X176.897 Y118.842 E.76182
G1 X176.363 Y118.842 E.01594
G1 X158.842 Y136.363 E.73928
G1 X158.842 Y135.828 E.01594
G1 X175.828 Y118.842 E.71674
G1 X175.294 Y118.842 E.01594
G1 X158.842 Y135.294 E.6942
G1 X158.842 Y134.76 E.01594
G1 X174.76 Y118.842 E.67166
G1 X174.226 Y118.842 E.01594
G1 X158.842 Y134.226 E.64912
G1 X158.842 Y133.692 E.01594
G1 X173.692 Y118.842 E.62658
G1 X173.158 Y118.842 E.01594
G1 X158.842 Y133.158 E.60404
G1 X158.842 Y132.623 E.01594
G1 X172.623 Y118.842 E.5815
G1 X172.089 Y118.842 E.01594
G1 X158.842 Y132.089 E.55896
G1 X158.842 Y131.555 E.01594
G1 X171.555 Y118.842 E.53642
G1 X171.021 Y118.842 E.01594
G1 X158.842 Y131.021 E.51388
G1 X158.842 Y130.487 E.01594
G1 X170.487 Y118.842 E.49134
G1 X169.952 Y118.842 E.01594
G1 X158.842 Y129.952 E.4688
G1 X158.842 Y129.418 E.01594
G1 X169.418 Y118.842 E.44626
G1 X168.884 Y118.842 E.01594
G1 X158.842 Y128.884 E.42372
G1 X158.842 Y128.35 E.01594
G1 X168.35 Y118.842 E.40118
G1 X167.816 Y118.842 E.01594
G1 X158.842 Y127.816 E.37864
G1 X158.842 Y127.282 E.01594
G1 X167.282 Y118.842 E.3561
G1 X166.747 Y118.842 E.01594
G1 X158.842 Y126.747 E.33356
G1 X158.842 Y126.213 E.01594
G1 X166.213 Y118.842 E.31102
G1 X165.679 Y118.842 E.01594
G1 X158.842 Y125.679 E.28848
G1 X158.842 Y125.145 E.01594
G1 X165.145 Y118.842 E.26594
G1 X164.611 Y118.842 E.01594
G1 X158.842 Y124.611 E.2434
G1 X158.842 Y124.077 E.01594
G1 X164.077 Y118.842 E.22086
G1 X163.542 Y118.842 E.01594
G1 X158.842 Y123.542 E.19832
G1 X158.842 Y123.008 E.01594
G1 X163.008 Y118.842 E.17578
G1 X162.474 Y118.842 E.01594
G1 X158.842 Y122.474 E.15324
G1 X158.842 Y121.94 E.01594
G1 X161.94 Y118.842 E.1307
G1 X161.406 Y118.842 E.01594
G1 X158.842 Y121.406 E.10816
G1 X158.842 Y120.871 E.01594
G1 X160.871 Y118.842 E.08562
G1 X160.337 Y118.842 E.01594
G1 X158.842 Y120.337 E.06308
G1 X158.842 Y119.803 E.01594
G1 X159.803 Y118.842 E.04054
G1 X159.269 Y118.842 E.01594
G1 X158.673 Y119.439 E.02516
; WIPE_START
G1 X159.269 Y118.842 E-.32041
G1 X159.803 Y118.842 E-.20299
G1 X159.363 Y119.283 E-.2366
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z15.2 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 74 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z15.2 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer74 end: 58
M625
; CHANGE_LAYER
; Z_HEIGHT: 15
; LAYER_HEIGHT: 0.2
;======== H2D 20250521========
; layer num/total_layer_count: 75/75
; update layer progress
M73 L75
M991 S0 P74 ;notify layer change


; OBJECT_ID: 58
; COOLING_NODE: 0
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X192.29 Y202.29 F60000
G1 Z15
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4773.528
M204 S5000
G1 X157.71 Y202.29 E1.03002
G1 X157.71 Y117.71 E2.51935
G1 X192.29 Y117.71 E1.03002
G1 X192.29 Y202.23 E2.51756
G1 E-.8 F1800
M204 S10000
G1 X192.271 Y194.598 Z15.4 F60000
G1 X192.083 Y118.691 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Top surface
G1 F4773.528
M204 S2000
G1 X191.309 Y117.917 E.03259
G1 X190.776 Y117.917 E.01588
G1 X192.083 Y119.224 E.05505
G1 X192.083 Y119.758 E.01588
G1 X190.242 Y117.917 E.07752
G1 X189.709 Y117.917 E.01588
G1 X192.083 Y120.291 E.09998
G1 X192.083 Y120.824 E.01588
G1 X189.176 Y117.917 E.12244
G1 X188.643 Y117.917 E.01588
G1 X192.083 Y121.357 E.1449
G1 X192.083 Y121.891 E.01588
G1 X188.109 Y117.917 E.16737
G1 X187.576 Y117.917 E.01588
G1 X192.083 Y122.424 E.18983
G1 X192.083 Y122.957 E.01588
G1 X187.043 Y117.917 E.21229
G1 X186.51 Y117.917 E.01588
G1 X192.083 Y123.49 E.23476
G1 X192.083 Y124.024 E.01588
G1 X185.976 Y117.917 E.25722
G1 X185.443 Y117.917 E.01588
G1 X192.083 Y124.557 E.27968
G1 X192.083 Y125.09 E.01588
G1 X184.91 Y117.917 E.30215
G1 X184.377 Y117.917 E.01588
G1 X192.083 Y125.623 E.32461
G1 X192.083 Y126.157 E.01588
G1 X183.843 Y117.917 E.34707
G1 X183.31 Y117.917 E.01588
G1 X192.083 Y126.69 E.36954
G1 X192.083 Y127.223 E.01588
G1 X182.777 Y117.917 E.392
G1 X182.244 Y117.917 E.01588
G1 X192.083 Y127.756 E.41446
G1 X192.083 Y128.29 E.01588
G1 X181.71 Y117.917 E.43693
G1 X181.177 Y117.917 E.01588
G1 X192.083 Y128.823 E.45939
G1 X192.083 Y129.356 E.01588
G1 X180.644 Y117.917 E.48185
G1 X180.111 Y117.917 E.01588
G1 X192.083 Y129.889 E.50432
G1 X192.083 Y130.423 E.01588
G1 X179.577 Y117.917 E.52678
G1 X179.044 Y117.917 E.01588
G1 X192.083 Y130.956 E.54924
G1 X192.083 Y131.489 E.01588
M73 P96 R1
G1 X178.511 Y117.917 E.57171
G1 X177.978 Y117.917 E.01588
G1 X192.083 Y132.022 E.59417
G1 X192.083 Y132.556 E.01588
G1 X177.444 Y117.917 E.61663
G1 X176.911 Y117.917 E.01588
G1 X192.083 Y133.089 E.6391
G1 X192.083 Y133.622 E.01588
G1 X176.378 Y117.917 E.66156
G1 X175.845 Y117.917 E.01588
G1 X192.083 Y134.155 E.68402
G1 X192.083 Y134.689 E.01588
G1 X175.311 Y117.917 E.70649
G1 X174.778 Y117.917 E.01588
G1 X192.083 Y135.222 E.72895
G1 X192.083 Y135.755 E.01588
G1 X174.245 Y117.917 E.75141
G1 X173.712 Y117.917 E.01588
G1 X192.083 Y136.288 E.77388
G1 X192.083 Y136.822 E.01588
G1 X173.178 Y117.917 E.79634
G1 X172.645 Y117.917 E.01588
G1 X192.083 Y137.355 E.8188
G1 X192.083 Y137.888 E.01588
G1 X172.112 Y117.917 E.84127
G1 X171.578 Y117.917 E.01588
G1 X192.083 Y138.422 E.86373
G1 X192.083 Y138.955 E.01588
G1 X171.045 Y117.917 E.88619
G1 X170.512 Y117.917 E.01588
G1 X192.083 Y139.488 E.90866
G1 X192.083 Y140.021 E.01588
G1 X169.979 Y117.917 E.93112
G1 X169.445 Y117.917 E.01588
G1 X192.083 Y140.555 E.95358
G1 X192.083 Y141.088 E.01588
G1 X168.912 Y117.917 E.97605
G1 X168.379 Y117.917 E.01588
G1 X192.083 Y141.621 E.99851
G1 X192.083 Y142.154 E.01588
G1 X167.846 Y117.917 E1.02097
G1 X167.312 Y117.917 E.01588
G1 X192.083 Y142.688 E1.04343
G1 X192.083 Y143.221 E.01588
G1 X166.779 Y117.917 E1.0659
G1 X166.246 Y117.917 E.01588
G1 X192.083 Y143.754 E1.08836
G1 X192.083 Y144.287 E.01588
G1 X165.713 Y117.917 E1.11082
G1 X165.179 Y117.917 E.01588
G1 X192.083 Y144.821 E1.13329
G1 X192.083 Y145.354 E.01588
G1 X164.646 Y117.917 E1.15575
G1 X164.113 Y117.917 E.01588
G1 X192.083 Y145.887 E1.17821
G1 X192.083 Y146.42 E.01588
G1 X163.58 Y117.917 E1.20068
G1 X163.046 Y117.917 E.01588
M73 P97 R1
G1 X192.083 Y146.954 E1.22314
G1 X192.083 Y147.487 E.01588
G1 X162.513 Y117.917 E1.2456
G1 X161.98 Y117.917 E.01588
G1 X192.083 Y148.02 E1.26807
G1 X192.083 Y148.553 E.01588
G1 X161.447 Y117.917 E1.29053
G1 X160.913 Y117.917 E.01588
G1 X192.083 Y149.087 E1.31299
G1 X192.083 Y149.62 E.01588
G1 X160.38 Y117.917 E1.33546
G1 X159.847 Y117.917 E.01588
G1 X192.083 Y150.153 E1.35792
G1 X192.083 Y150.686 E.01588
G1 X159.314 Y117.917 E1.38038
G1 X158.78 Y117.917 E.01588
G1 X192.083 Y151.22 E1.40285
G1 X192.083 Y151.753 E.01588
G1 X158.247 Y117.917 E1.42531
G1 X157.917 Y118.121 E.01154
G1 X192.083 Y152.286 E1.4392
G1 X192.083 Y152.819 E.01588
G1 X157.917 Y118.654 E1.4392
G1 X157.917 Y119.187 E.01588
G1 X192.083 Y153.353 E1.4392
G1 X192.083 Y153.886 E.01588
G1 X157.917 Y119.721 E1.4392
G1 X157.917 Y120.254 E.01588
G1 X192.083 Y154.419 E1.4392
G1 X192.083 Y154.952 E.01588
G1 X157.917 Y120.787 E1.4392
G1 X157.917 Y121.321 E.01588
G1 X192.083 Y155.486 E1.4392
G1 X192.083 Y156.019 E.01588
G1 X157.917 Y121.854 E1.4392
G1 X157.917 Y122.387 E.01588
G1 X192.083 Y156.552 E1.4392
G1 X192.083 Y157.086 E.01588
G1 X157.917 Y122.92 E1.4392
G1 X157.917 Y123.454 E.01588
G1 X192.083 Y157.619 E1.4392
G1 X192.083 Y158.152 E.01588
G1 X157.917 Y123.987 E1.4392
G1 X157.917 Y124.52 E.01588
G1 X192.083 Y158.685 E1.4392
G1 X192.083 Y159.219 E.01588
G1 X157.917 Y125.053 E1.4392
G1 X157.917 Y125.587 E.01588
G1 X192.083 Y159.752 E1.4392
G1 X192.083 Y160.285 E.01588
G1 X157.917 Y126.12 E1.4392
G1 X157.917 Y126.653 E.01588
G1 X192.083 Y160.818 E1.4392
G1 X192.083 Y161.352 E.01588
G1 X157.917 Y127.186 E1.4392
G1 X157.917 Y127.72 E.01588
G1 X192.083 Y161.885 E1.4392
G1 X192.083 Y162.418 E.01588
G1 X157.917 Y128.253 E1.4392
G1 X157.917 Y128.786 E.01588
G1 X192.083 Y162.951 E1.4392
G1 X192.083 Y163.485 E.01588
G1 X157.917 Y129.319 E1.4392
G1 X157.917 Y129.853 E.01588
G1 X192.083 Y164.018 E1.4392
G1 X192.083 Y164.551 E.01588
G1 X157.917 Y130.386 E1.4392
G1 X157.917 Y130.919 E.01588
G1 X192.083 Y165.084 E1.4392
G1 X192.083 Y165.618 E.01588
G1 X157.917 Y131.452 E1.4392
G1 X157.917 Y131.986 E.01588
G1 X192.083 Y166.151 E1.4392
G1 X192.083 Y166.684 E.01588
G1 X157.917 Y132.519 E1.4392
G1 X157.917 Y133.052 E.01588
G1 X192.083 Y167.217 E1.4392
G1 X192.083 Y167.751 E.01588
G1 X157.917 Y133.585 E1.4392
G1 X157.917 Y134.119 E.01588
G1 X192.083 Y168.284 E1.4392
G1 X192.083 Y168.817 E.01588
G1 X157.917 Y134.652 E1.4392
G1 X157.917 Y135.185 E.01588
G1 X192.083 Y169.35 E1.4392
G1 X192.083 Y169.884 E.01588
G1 X157.917 Y135.718 E1.4392
G1 X157.917 Y136.252 E.01588
G1 X192.083 Y170.417 E1.4392
G1 X192.083 Y170.95 E.01588
G1 X157.917 Y136.785 E1.4392
G1 X157.917 Y137.318 E.01588
G1 X192.083 Y171.483 E1.4392
G1 X192.083 Y172.017 E.01588
G1 X157.917 Y137.851 E1.4392
G1 X157.917 Y138.385 E.01588
G1 X192.083 Y172.55 E1.4392
G1 X192.083 Y173.083 E.01588
G1 X157.917 Y138.918 E1.4392
G1 X157.917 Y139.451 E.01588
G1 X192.083 Y173.617 E1.4392
G1 X192.083 Y174.15 E.01588
G1 X157.917 Y139.985 E1.4392
G1 X157.917 Y140.518 E.01588
G1 X192.083 Y174.683 E1.4392
G1 X192.083 Y175.216 E.01588
G1 X157.917 Y141.051 E1.4392
G1 X157.917 Y141.584 E.01588
G1 X192.083 Y175.75 E1.4392
G1 X192.083 Y176.283 E.01588
M73 P98 R1
G1 X157.917 Y142.118 E1.4392
G1 X157.917 Y142.651 E.01588
G1 X192.083 Y176.816 E1.4392
G1 X192.083 Y177.349 E.01588
G1 X157.917 Y143.184 E1.4392
G1 X157.917 Y143.717 E.01588
G1 X192.083 Y177.883 E1.4392
G1 X192.083 Y178.416 E.01588
G1 X157.917 Y144.251 E1.4392
G1 X157.917 Y144.784 E.01588
G1 X192.083 Y178.949 E1.4392
G1 X192.083 Y179.482 E.01588
G1 X157.917 Y145.317 E1.4392
G1 X157.917 Y145.85 E.01588
G1 X192.083 Y180.016 E1.4392
G1 X192.083 Y180.549 E.01588
G1 X157.917 Y146.384 E1.4392
G1 X157.917 Y146.917 E.01588
G1 X192.083 Y181.082 E1.4392
G1 X192.083 Y181.615 E.01588
G1 X157.917 Y147.45 E1.4392
G1 X157.917 Y147.983 E.01588
G1 X192.083 Y182.149 E1.4392
G1 X192.083 Y182.682 E.01588
G1 X157.917 Y148.517 E1.4392
G1 X157.917 Y149.05 E.01588
G1 X192.083 Y183.215 E1.4392
G1 X192.083 Y183.748 E.01588
G1 X157.917 Y149.583 E1.4392
G1 X157.917 Y150.116 E.01588
G1 X192.083 Y184.282 E1.4392
G1 X192.083 Y184.815 E.01588
G1 X157.917 Y150.65 E1.4392
G1 X157.917 Y151.183 E.01588
G1 X192.083 Y185.348 E1.4392
G1 X192.083 Y185.881 E.01588
G1 X157.917 Y151.716 E1.4392
G1 X157.917 Y152.249 E.01588
M73 P98 R0
G1 X192.083 Y186.415 E1.4392
G1 X192.083 Y186.948 E.01588
G1 X157.917 Y152.783 E1.4392
G1 X157.917 Y153.316 E.01588
G1 X192.083 Y187.481 E1.4392
G1 X192.083 Y188.014 E.01588
G1 X157.917 Y153.849 E1.4392
G1 X157.917 Y154.382 E.01588
G1 X192.083 Y188.548 E1.4392
G1 X192.083 Y189.081 E.01588
G1 X157.917 Y154.916 E1.4392
G1 X157.917 Y155.449 E.01588
G1 X192.083 Y189.614 E1.4392
G1 X192.083 Y190.147 E.01588
G1 X157.917 Y155.982 E1.4392
G1 X157.917 Y156.515 E.01588
G1 X192.083 Y190.681 E1.4392
G1 X192.083 Y191.214 E.01588
G1 X157.917 Y157.049 E1.4392
G1 X157.917 Y157.582 E.01588
G1 X192.083 Y191.747 E1.4392
G1 X192.083 Y192.281 E.01588
G1 X157.917 Y158.115 E1.4392
G1 X157.917 Y158.649 E.01588
G1 X192.083 Y192.814 E1.4392
G1 X192.083 Y193.347 E.01588
G1 X157.917 Y159.182 E1.4392
G1 X157.917 Y159.715 E.01588
G1 X192.083 Y193.88 E1.4392
G1 X192.083 Y194.414 E.01588
G1 X157.917 Y160.248 E1.4392
G1 X157.917 Y160.782 E.01588
G1 X192.083 Y194.947 E1.4392
G1 X192.083 Y195.48 E.01588
G1 X157.917 Y161.315 E1.4392
G1 X157.917 Y161.848 E.01588
G1 X192.083 Y196.013 E1.4392
G1 X192.083 Y196.547 E.01588
G1 X157.917 Y162.381 E1.4392
G1 X157.917 Y162.915 E.01588
G1 X192.083 Y197.08 E1.4392
G1 X192.083 Y197.613 E.01588
G1 X157.917 Y163.448 E1.4392
G1 X157.917 Y163.981 E.01588
G1 X192.083 Y198.146 E1.4392
G1 X192.083 Y198.68 E.01588
G1 X157.917 Y164.514 E1.4392
G1 X157.917 Y165.048 E.01588
G1 X192.083 Y199.213 E1.4392
G1 X192.083 Y199.746 E.01588
G1 X157.917 Y165.581 E1.4392
G1 X157.917 Y166.114 E.01588
G1 X192.083 Y200.279 E1.4392
G1 X192.083 Y200.813 E.01588
G1 X157.917 Y166.647 E1.4392
G1 X157.917 Y167.181 E.01588
G1 X192.083 Y201.346 E1.4392
G1 X192.083 Y201.879 E.01588
G1 X157.917 Y167.714 E1.4392
M73 P99 R0
G1 X157.917 Y168.247 E.01588
G1 X191.753 Y202.083 E1.4253
G1 X191.22 Y202.083 E.01588
G1 X157.917 Y168.78 E1.40284
G1 X157.917 Y169.314 E.01588
G1 X190.686 Y202.083 E1.38038
G1 X190.153 Y202.083 E.01588
G1 X157.917 Y169.847 E1.35792
G1 X157.917 Y170.38 E.01588
G1 X189.62 Y202.083 E1.33545
G1 X189.087 Y202.083 E.01588
G1 X157.917 Y170.913 E1.31299
G1 X157.917 Y171.447 E.01588
G1 X188.553 Y202.083 E1.29053
G1 X188.02 Y202.083 E.01588
G1 X157.917 Y171.98 E1.26806
G1 X157.917 Y172.513 E.01588
G1 X187.487 Y202.083 E1.2456
G1 X186.954 Y202.083 E.01588
G1 X157.917 Y173.046 E1.22314
G1 X157.917 Y173.58 E.01588
G1 X186.42 Y202.083 E1.20067
G1 X185.887 Y202.083 E.01588
G1 X157.917 Y174.113 E1.17821
G1 X157.917 Y174.646 E.01588
G1 X185.354 Y202.083 E1.15575
G1 X184.82 Y202.083 E.01588
G1 X157.917 Y175.18 E1.13328
G1 X157.917 Y175.713 E.01588
G1 X184.287 Y202.083 E1.11082
G1 X183.754 Y202.083 E.01588
G1 X157.917 Y176.246 E1.08836
G1 X157.917 Y176.779 E.01588
G1 X183.221 Y202.083 E1.06589
G1 X182.687 Y202.083 E.01588
G1 X157.917 Y177.313 E1.04343
G1 X157.917 Y177.846 E.01588
G1 X182.154 Y202.083 E1.02097
G1 X181.621 Y202.083 E.01588
G1 X157.917 Y178.379 E.9985
G1 X157.917 Y178.912 E.01588
G1 X181.088 Y202.083 E.97604
G1 X180.554 Y202.083 E.01588
G1 X157.917 Y179.446 E.95358
G1 X157.917 Y179.979 E.01588
G1 X180.021 Y202.083 E.93111
G1 X179.488 Y202.083 E.01588
G1 X157.917 Y180.512 E.90865
G1 X157.917 Y181.045 E.01588
G1 X178.955 Y202.083 E.88619
G1 X178.421 Y202.083 E.01588
G1 X157.917 Y181.579 E.86372
G1 X157.917 Y182.112 E.01588
G1 X177.888 Y202.083 E.84126
G1 X177.355 Y202.083 E.01588
G1 X157.917 Y182.645 E.8188
G1 X157.917 Y183.178 E.01588
G1 X176.822 Y202.083 E.79633
G1 X176.288 Y202.083 E.01588
G1 X157.917 Y183.712 E.77387
G1 X157.917 Y184.245 E.01588
G1 X175.755 Y202.083 E.75141
G1 X175.222 Y202.083 E.01588
G1 X157.917 Y184.778 E.72894
G1 X157.917 Y185.311 E.01588
G1 X174.689 Y202.083 E.70648
G1 X174.155 Y202.083 E.01588
G1 X157.917 Y185.845 E.68402
G1 X157.917 Y186.378 E.01588
G1 X173.622 Y202.083 E.66155
G1 X173.089 Y202.083 E.01588
G1 X157.917 Y186.911 E.63909
G1 X157.917 Y187.444 E.01588
G1 X172.556 Y202.083 E.61663
G1 X172.022 Y202.083 E.01588
G1 X157.917 Y187.978 E.59416
G1 X157.917 Y188.511 E.01588
G1 X171.489 Y202.083 E.5717
G1 X170.956 Y202.083 E.01588
G1 X157.917 Y189.044 E.54924
G1 X157.917 Y189.577 E.01588
G1 X170.423 Y202.083 E.52677
G1 X169.889 Y202.083 E.01588
G1 X157.917 Y190.111 E.50431
G1 X157.917 Y190.644 E.01588
G1 X169.356 Y202.083 E.48185
G1 X168.823 Y202.083 E.01588
G1 X157.917 Y191.177 E.45939
G1 X157.917 Y191.71 E.01588
G1 X168.29 Y202.083 E.43692
G1 X167.756 Y202.083 E.01588
G1 X157.917 Y192.244 E.41446
G1 X157.917 Y192.777 E.01588
G1 X167.223 Y202.083 E.392
G1 X166.69 Y202.083 E.01588
G1 X157.917 Y193.31 E.36953
G1 X157.917 Y193.844 E.01588
G1 X166.156 Y202.083 E.34707
G1 X165.623 Y202.083 E.01588
G1 X157.917 Y194.377 E.32461
G1 X157.917 Y194.91 E.01588
G1 X165.09 Y202.083 E.30214
G1 X164.557 Y202.083 E.01588
G1 X157.917 Y195.443 E.27968
G1 X157.917 Y195.977 E.01588
G1 X164.023 Y202.083 E.25722
G1 X163.49 Y202.083 E.01588
G1 X157.917 Y196.51 E.23475
G1 X157.917 Y197.043 E.01588
G1 X162.957 Y202.083 E.21229
G1 X162.424 Y202.083 E.01588
G1 X157.917 Y197.576 E.18983
G1 X157.917 Y198.11 E.01588
G1 X161.89 Y202.083 E.16736
G1 X161.357 Y202.083 E.01588
G1 X157.917 Y198.643 E.1449
G1 X157.917 Y199.176 E.01588
G1 X160.824 Y202.083 E.12244
G1 X160.291 Y202.083 E.01588
G1 X157.917 Y199.709 E.09997
G1 X157.917 Y200.243 E.01588
G1 X159.757 Y202.083 E.07751
G1 X159.224 Y202.083 E.01588
G1 X157.917 Y200.776 E.05505
G1 X157.917 Y201.309 E.01588
G1 X158.691 Y202.083 E.03258
G1 E-.8 F1800
M204 S10000
G1 X166.323 Y202.075 Z15.4 F60000
G1 X192.101 Y202.049 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.150796
G1 F15000
M204 S8000
G1 X191.912 Y202.049 E.00161
G1 X191.823 Y202.012 E.00082
; WIPE_START
G1 X191.912 Y202.049 E-.25712
G1 X192.101 Y202.049 E-.50288
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z15.4 I1.217 J0 P1  F60000
; stop printing object, unique label id: 58
M625
; object ids of layer 75 start: 58
M624 AQAAAAAAAAA=
;======== H2D 20250527========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on

M1002 judge_flag timelapse_record_flag

M622 J1
M993 A2 B2 C2
M993 A0 B0 C0




    M9711 M0 E1 X261 Y134 Z15.4 S11 C10 O0 T3000



M993 A3 B3 C3

M623
; SKIPPABLE_END

; object ids of this layer75 end: 58
M625
; close powerlost recovery
M1003 S0
M106 S0
M106 P2 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; MACHINE_END_GCODE_START
; filament end gcode 
;===== date: 2025/05/16 =====================
;===== H2D =====================
G392 S0 ;turn off nozzle clog detect
M993 A0 B0 C0 ; nozzle cam detection not allowed.

M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G1 E-0.8 F1800 ; retract
G1 Z15.5 F900 ; lower z a little

G90
M141 S0 ; turn off chamber heating
M140 S0 ; turn off bed
M106 S0 ; turn off fan
M106 P2 S0 ; turn off remote part cooling fan
M106 P3 S0 ; turn off chamber cooling fan

; pull back filament to AMS
M620 S65535
T65535
G150.2
M621 S65535

M620 S65279
T65279
G150.2
M621 S65279

G150.3

M1002 judge_flag timelapse_record_flag
M622 J1
    M400 ; wait all motion done
    M991 S0 P-1 ;end smooth timelapse at safe pos
    M400 S5 ;wait for last picture to be taken
M623  ;end of "timelapse_record_flag"

M104 S0 T0; turn off hotend
M104 S0 T1; turn off hotend

M400 ; wait all motion done
M17 S
M17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom

    G1 Z115 F600
    G1 Z113

M400 P100
M17 R ; restore z current

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

M1015.4 S0 K0 ;disable air printing detect
;=====printer finish  sound=========
M17
M400 S1
M1006 S1
M1006 A53 B10 L99 C53 D10 M99 E53 F10 N99 
M1006 A57 B10 L99 C57 D10 M99 E57 F10 N99 
M1006 A0 B15 L0 C0 D15 M0 E0 F15 N0 
M1006 A53 B10 L99 C53 D10 M99 E53 F10 N99 
M1006 A57 B10 L99 C57 D10 M99 E57 F10 N99 
M1006 A0 B15 L0 C0 D15 M0 E0 F15 N0 
M1006 A48 B10 L99 C48 D10 M99 E48 F10 N99 
M1006 A0 B15 L0 C0 D15 M0 E0 F15 N0 
M1006 A60 B10 L99 C60 D10 M99 E60 F10 N99 
M1006 W
;=====printer finish  sound=========
M400
M18

M73 P100 R0
; EXECUTABLE_BLOCK_END

