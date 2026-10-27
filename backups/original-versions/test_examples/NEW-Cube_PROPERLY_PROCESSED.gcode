N1 ; HEADER_BLOCK_START
N2 ; BambuStudio 02.01.00.59
N3 ; model printing time: 52m 50s; total estimated time: 1h 2m 38s
N4 ; total layer number: 75
N5 ; total filament length [mm] : 6274.58,127.52
N6 ; total filament volume [cm^3] : 15092.14,306.73
N7 ; total filament weight [g] : 19.47,0.38
N8 ; model label id: 372,407
N9 ; filament_density: 1.29,1.24
N10 ; filament_diameter: 1.75,1.75
N11 ; max_z_height: 15.00
N12 ; filament: 1,2
N13 ; HEADER_BLOCK_END
N14 
N15 ; CONFIG_BLOCK_START
N16 ; accel_to_decel_enable = 0
N17 ; accel_to_decel_factor = 50%
N18 ; activate_air_filtration = 0,0
N19 ; additional_cooling_fan_speed = 0,100
N20 ; apply_scarf_seam_on_circles = 1
N21 ; auxiliary_fan = 1
N22 ; bed_custom_model = 
N23 ; bed_custom_texture = 
N24 ; bed_exclude_area = 
N25 ; bed_temperature_formula = by_highest_temp
N26 ; before_layer_change_gcode = 
N27 ; best_object_pos = 0.3,0.5
N28 ; bottom_color_penetration_layers = 3
N29 ; bottom_shell_layers = 3
N30 ; bottom_shell_thickness = 0
N31 ; bottom_surface_pattern = monotonic
N32 ; bridge_angle = 0
N33 ; bridge_flow = 1
N34 ; bridge_no_support = 0
N35 ; bridge_speed = 50,50
N36 ; brim_object_gap = 0.1
N37 ; brim_type = auto_brim
N38 ; brim_width = 5
N39 ; chamber_temperatures = 0,0
N40 ; change_filament_gcode = ;======== H2D ========\n;===== 20250604 =====\nM993 A2 B2 C2 ; nozzle cam detection allow status save.\nM993 A0 B0 C0 ; nozzle cam detection not allowed.\n\n{if (filament_type[next_extruder] == "PLA") ||  (filament_type[next_extruder] == "PETG")\n ||  (filament_type[next_extruder] == "PLA-CF")  ||  (filament_type[next_extruder] == "PETG-CF")}\nM1015.4 S1 K0 ;disable E air printing detect\n{else}\nM1015.4 S0 ; disable E air printing detect\n{endif}\n\nM620 S[next_extruder]A\nM1002 gcode_claim_action : 4\nM204 S9000\n\nG1 Z{max_layer_z + 3.0} F1200\n\nM400\nM106 P1 S0\nM106 P2 S0\n\n{if toolchange_count == 2}\n; get travel path for change filament\n;M620.1 X[travel_point_1_x] Y[travel_point_1_y] F21000 P0\n;M620.1 X[travel_point_2_x] Y[travel_point_2_y] F21000 P1\n;M620.1 X[travel_point_3_x] Y[travel_point_3_y] F21000 P2\n{endif}\n\n{if ((filament_type[current_extruder] == "PLA") || (filament_type[current_extruder] == "PLA-CF") || (filament_type[current_extruder] == "PETG")) && (nozzle_diameter[current_extruder] == 0.2)}\nM620.10 A0 F74.8347 L[flush_length] H{nozzle_diameter[current_extruder]} T{nozzle_temperature_range_high[current_extruder]} P{nozzle_temperature[current_extruder]} S1\n{else}\nM620.10 A0 F{filament_max_volumetric_speed[current_extruder]/2.4053*60} L[flush_length] H{nozzle_diameter[current_extruder]} T{nozzle_temperature_range_high[current_extruder]} P{nozzle_temperature[current_extruder]} S1\n{endif}\n\n{if ((filament_type[next_extruder] == "PLA") || (filament_type[next_extruder] == "PLA-CF") || (filament_type[next_extruder] == "PETG")) && (nozzle_diameter[next_extruder] == 0.2)}\nM620.10 A1 F74.8347 L[flush_length] H{nozzle_diameter[next_extruder]} T{nozzle_temperature_range_high[next_extruder]} P{nozzle_temperature[next_extruder]} S1\n{else}\nM620.10 A1 F{filament_max_volumetric_speed[next_extruder]/2.4053*60} L[flush_length] H{nozzle_diameter[next_extruder]} T{nozzle_temperature_range_high[next_extruder]} P{nozzle_temperature[next_extruder]} S1\n{endif}\n\n{if long_retraction_when_cut}\nM620.11 P1 I[current_extruder] E-{retraction_distance_when_cut} F{max((filament_max_volumetric_speed[current_extruder]/2.4053*60), 200)}\n{else}\nM620.11 P0 I[current_extruder] E0\n{endif}\n\n{if long_retraction_when_ec}\nM620.11 K1 I[current_extruder] R{retraction_distance_when_ec} F{max((filament_max_volumetric_speed[current_extruder]/2.4053*60), 200)}\n{else}\nM620.11 K0 I[current_extruder] R0\n{endif}\n\nM628 S1\n{if filament_type[current_extruder] == "TPU"}\nM620.11 S0 L0 I[current_extruder] E-{retraction_distances_when_cut[current_extruder]} F{max((filament_max_volumetric_speed[current_extruder]/2.4053*60), 200)}\n{else}\n{if (filament_type[current_extruder] == "PA") || (filament_type[current_extruder] == "PA-GF")}\nM620.11 S1 L0 I[current_extruder] R4 D2 E-{retraction_distances_when_cut[current_extruder]} F{max((filament_max_volumetric_speed[current_extruder]/2.4053*60), 200)}\n{else}\nM620.11 S1 L0 I[current_extruder] R10 D8 E-{retraction_distances_when_cut[current_extruder]} F{max((filament_max_volumetric_speed[current_extruder]/2.4053*60), 200)}\n{endif}\n{endif}\nM629\n\n{if filament_type[current_extruder] == "TPU" || filament_type[next_extruder] == "TPU"}\nM620.11 H2 C331\n{else}\nM620.11 H0\n{endif}\n\nT[next_extruder]\n\n;deretract\n{if filament_type[next_extruder] == "TPU"}\n{else}\n{if (filament_type[next_extruder] == "PA") || (filament_type[next_extruder] == "PA-GF")}\n;VG1 E1 F{max(new_filament_e_feedrate, 200)}\n;VG1 E1 F{max(new_filament_e_feedrate/2, 100)}\n{else}\n;VG1 E4 F{max(new_filament_e_feedrate, 200)}\n;VG1 E4 F{max(new_filament_e_feedrate/2, 100)}\n{endif}\n{endif}\n\n; VFLUSH_START\n\n{if flush_length>41.5}\n;VG1 E41.5 F{min(old_filament_e_feedrate,new_filament_e_feedrate)}\n;VG1 E{flush_length-41.5} F{new_filament_e_feedrate}\n{else}\n;VG1 E{flush_length} F{min(old_filament_e_feedrate,new_filament_e_feedrate)}\n{endif}\n\nSYNC T{ceil(flush_length / 125) * 5}\n\n; VFLUSH_END\n\nM1002 set_filament_type:{filament_type[next_extruder]}\n\nM400\nM83\n{if next_extruder < 255}\n\n\nM628 S0\n;VM109 S[new_filament_temp]\nM629\nM400\n\nM983.3 F{filament_max_volumetric_speed[next_extruder]/2.4} A0.4\n\n\nM400\n{if wipe_avoid_perimeter}\nG1 Y320 F30000\nG1 X{wipe_avoid_pos_x} F30000\n{endif}\nG1 Y295 F30000\nG1 Y265 F18000\nG1 Z{max_layer_z + 3.0} F3000\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\nM621 S[next_extruder]A\n\nM993 A3 B3 C3 ; nozzle cam detection allow status restore.\n\n{if (filament_type[next_extruder]  == "TPU")}\nM1015.3 S1;enable tpu clog detect\n{else}\nM1015.3 S0;disable tpu clog detect\n{endif}\n\n{if (filament_type[next_extruder] == "PLA") ||  (filament_type[next_extruder] == "PETG")\n ||  (filament_type[next_extruder] == "PLA-CF")  ||  (filament_type[next_extruder] == "PETG-CF")}\nM1015.4 S1 K1 H[nozzle_diameter] ;enable E air printing detect\n{else}\nM1015.4 S0 ; disable E air printing detect\n{endif}\n\nM620.6 I[next_extruder] W1 ;enable ams air printing detect\nM1002 gcode_claim_action : 0\n
N41 ; circle_compensation_manual_offset = 0
N42 ; circle_compensation_speed = 200,200
N43 ; close_fan_the_first_x_layers = 3,1
N44 ; complete_print_exhaust_fan_speed = 70,70
N45 ; cool_plate_temp = 0,30
N46 ; cool_plate_temp_initial_layer = 0,30
N47 ; counter_coef_1 = 0,0
N48 ; counter_coef_2 = 0.008,0.008
N49 ; counter_coef_3 = -0.041,-0.041
N50 ; counter_limit_max = 0.033,0.033
N51 ; counter_limit_min = -0.035,-0.035
N52 ; curr_bed_type = Textured PEI Plate
N53 ; default_acceleration = 8000,8000
N54 ; default_filament_colour = ;
N55 ; default_filament_profile = "Bambu PLA Basic @BBL H2D"
N56 ; default_jerk = 0
N57 ; default_nozzle_volume_type = Standard,Standard
N58 ; default_print_profile = 0.20mm Standard @BBL H2D
N59 ; deretraction_speed = 30,30
N60 ; detect_floating_vertical_shell = 1
N61 ; detect_narrow_internal_solid_infill = 1
N62 ; detect_overhang_wall = 1
N63 ; detect_thin_wall = 0
N64 ; diameter_limit = 50,50
N65 ; different_settings_to_system = enable_arc_fitting;gcode_add_line_number;post_process;process_notes;reduce_crossing_wall;skirt_loops;sparse_infill_pattern;wall_loops;;;
N66 ; draft_shield = disabled
N67 ; during_print_exhaust_fan_speed = 70,70
N68 ; elefant_foot_compensation = 0.15
N69 ; enable_arc_fitting = 0
N70 ; enable_circle_compensation = 0
N71 ; enable_long_retraction_when_cut = 2
N72 ; enable_overhang_bridge_fan = 1,1
N73 ; enable_overhang_speed = 1,1
N74 ; enable_pre_heating = 1
N75 ; enable_pressure_advance = 0,0
N76 ; enable_prime_tower = 1
N77 ; enable_support = 0
N78 ; enforce_support_layers = 0
N79 ; eng_plate_temp = 70,30
N80 ; eng_plate_temp_initial_layer = 70,30
N81 ; ensure_vertical_shell_thickness = enabled
N82 ; exclude_object = 1
N83 ; extruder_ams_count = 1#0|4#0;1#0|4#1
N84 ; extruder_clearance_dist_to_rod = 50
N85 ; extruder_clearance_height_to_lid = 201
N86 ; extruder_clearance_height_to_rod = 47.4
N87 ; extruder_clearance_max_radius = 96
N88 ; extruder_colour = #018001;#018001
N89 ; extruder_offset = 0x0,0x0
N90 ; extruder_printable_area = 0x0,325x0,325x320,0x320#25x0,350x0,350x320,25x320
N91 ; extruder_printable_height = 320,325
N92 ; extruder_type = Direct Drive,Direct Drive
N93 ; extruder_variant_list = "Direct Drive Standard,Direct Drive High Flow";"Direct Drive Standard,Direct Drive High Flow"
N94 ; fan_cooling_layer_time = 30,100
N95 ; fan_max_speed = 40,100
N96 ; fan_min_speed = 10,100
N97 ; filament_adhesiveness_category = 0,600
N98 ; filament_change_length = 10,10
N99 ; filament_colour = #0D6284;#898989
N100 ; filament_cost = 28.99,20
N101 ; filament_density = 1.29,1.24
N102 ; filament_diameter = 1.75,1.75
N103 ; filament_end_gcode = "; filament end gcode \n";"; filament end gcode \n"
N104 ; filament_extruder_variant = "Direct Drive Standard";"Direct Drive Standard"
N105 ; filament_flow_ratio = 0.95,1
N106 ; filament_flush_temp = 0,0
N107 ; filament_flush_volumetric_speed = 0,0
N108 ; filament_ids = GFG97;GFU99
N109 ; filament_is_support = 0,0
N110 ; filament_map = 1,2
N111 ; filament_map_mode = Auto For Flush
N112 ; filament_max_volumetric_speed = 6,3.2
N113 ; filament_minimal_purge_on_wipe_tower = 15,15
N114 ; filament_notes = 
N115 ; filament_pre_cooling_temperature = 0,210
N116 ; filament_prime_volume = 45,45
N117 ; filament_printable = 3,2
N118 ; filament_ramming_travel_time = 0,20
N119 ; filament_ramming_volumetric_speed = -1,0.8
N120 ; filament_scarf_gap = 0%,0%
N121 ; filament_scarf_height = 10%,10%
N122 ; filament_scarf_length = 10,10
N123 ; filament_scarf_seam_type = none,none
N124 ; filament_self_index = 1,1,2,2
N125 ; filament_settings_id = "Generic PCTG @BBL H2D";"Generic TPU @BBL H2D"
N126 ; filament_shrink = 100%,100%
N127 ; filament_soluble = 0,0
N128 ; filament_start_gcode = "; filament start gcode\n";"; filament start gcode\n"
N129 ; filament_type = PCTG;TPU
N130 ; filament_vendor = Generic;Generic
N131 ; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
N132 ; filter_out_gap_fill = 0
N133 ; first_layer_print_sequence = 0
N134 ; flush_into_infill = 0
N135 ; flush_into_objects = 0
N136 ; flush_into_support = 1
N137 ; flush_multiplier = 1,1
N138 ; flush_volumes_matrix = 0,405,248,0,0,420,263,0
N139 ; flush_volumes_vector = 140,140,140,140
N140 ; full_fan_speed_layer = 0,0
N141 ; fuzzy_skin = none
N142 ; fuzzy_skin_point_distance = 0.8
N143 ; fuzzy_skin_thickness = 0.3
N144 ; gap_infill_speed = 250,250
N145 ; gcode_add_line_number = 1
N146 ; gcode_flavor = marlin
N147 ; grab_length = 0,0
N148 ; has_scarf_joint_seam = 1
N149 ; head_wrap_detect_zone = 
N150 ; hole_coef_1 = 0,0
N151 ; hole_coef_2 = -0.008,-0.008
N152 ; hole_coef_3 = 0.23415,0.23415
N153 ; hole_limit_max = 0.22,0.22
N154 ; hole_limit_min = 0.088,0.088
N155 ; host_type = octoprint
N156 ; hot_plate_temp = 70,35
N157 ; hot_plate_temp_initial_layer = 70,35
N158 ; hotend_cooling_rate = 2,2
N159 ; hotend_heating_rate = 3.6,3.6
N160 ; impact_strength_z = 10,10
N161 ; independent_support_layer_height = 0
N162 ; infill_combination = 0
N163 ; infill_direction = 45
N164 ; infill_jerk = 9
N165 ; infill_lock_depth = 1
N166 ; infill_rotate_step = 0
N167 ; infill_shift_step = 0.4
N168 ; infill_wall_overlap = 15%
N169 ; inherits_group = "0.20mm Standard @BBL H2D";;;
N170 ; initial_layer_acceleration = 500,500
N171 ; initial_layer_flow_ratio = 1
N172 ; initial_layer_infill_speed = 105,105
N173 ; initial_layer_jerk = 9
N174 ; initial_layer_line_width = 0.5
N175 ; initial_layer_print_height = 0.2
N176 ; initial_layer_speed = 50,50
N177 ; initial_layer_travel_acceleration = 6000,6000
N178 ; inner_wall_acceleration = 0,0
N179 ; inner_wall_jerk = 9
N180 ; inner_wall_line_width = 0.45
N181 ; inner_wall_speed = 300,300
N182 ; interface_shells = 0
N183 ; interlocking_beam = 0
N184 ; interlocking_beam_layer_count = 2
N185 ; interlocking_beam_width = 0.8
N186 ; interlocking_boundary_avoidance = 2
N187 ; interlocking_depth = 2
N188 ; interlocking_orientation = 22.5
N189 ; internal_bridge_support_thickness = 0.8
N190 ; internal_solid_infill_line_width = 0.42
N191 ; internal_solid_infill_pattern = zig-zag
N192 ; internal_solid_infill_speed = 250,250
N193 ; ironing_direction = 45
N194 ; ironing_flow = 10%
N195 ; ironing_inset = 0.21
N196 ; ironing_pattern = zig-zag
N197 ; ironing_spacing = 0.15
N198 ; ironing_speed = 30
N199 ; ironing_type = no ironing
N200 ; is_infill_first = 0
N201 ; layer_change_gcode = ;======== H2D 20250521========\n; layer num/total_layer_count: {layer_num+1}/[total_layer_count]\n; update layer progress\nM73 L{layer_num+1}\nM991 S0 P{layer_num} ;notify layer change\n\n
N202 ; layer_height = 0.2
N203 ; line_width = 0.42
N204 ; long_retractions_when_cut = 0,0
N205 ; long_retractions_when_ec = 1,1
N206 ; machine_end_gcode = ;===== date: 2025/05/16 =====================\n;===== H2D =====================\nG392 S0 ;turn off nozzle clog detect\nM993 A0 B0 C0 ; nozzle cam detection not allowed.\n\nM400 ; wait for buffer to clear\nG92 E0 ; zero the extruder\nG1 E-0.8 F1800 ; retract\nG1 Z{max_layer_z + 0.5} F900 ; lower z a little\n\nG90\nM141 S0 ; turn off chamber heating\nM140 S0 ; turn off bed\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off remote part cooling fan\nM106 P3 S0 ; turn off chamber cooling fan\n\n; pull back filament to AMS\nM620 S65535\nT65535\nG150.2\nM621 S65535\n\nM620 S65279\nT65279\nG150.2\nM621 S65279\n\nG150.3\n\nM1002 judge_flag timelapse_record_flag\nM622 J1\n    M400 ; wait all motion done\n    M991 S0 P-1 ;end smooth timelapse at safe pos\n    M400 S5 ;wait for last picture to be taken\nM623  ;end of "timelapse_record_flag"\n\nM104 S0 T0; turn off hotend\nM104 S0 T1; turn off hotend\n\nM400 ; wait all motion done\nM17 S\nM17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom\n{if (max_layer_z + 100.0) < 320}\n    G1 Z{max_layer_z + 100.0} F600\n    G1 Z{max_layer_z +98.0}\n{else}\n    G1 Z320 F600\n    G1 Z320\n{endif}\nM400 P100\nM17 R ; restore z current\n\nM220 S100  ; Reset feedrate magnitude\nM201.2 K1.0 ; Reset acc magnitude\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 0\n\nM1015.4 S0 K0 ;disable air printing detect\n;=====printer finish  sound=========\nM17\nM400 S1\nM1006 S1\nM1006 A53 B10 L99 C53 D10 M99 E53 F10 N99 \nM1006 A57 B10 L99 C57 D10 M99 E57 F10 N99 \nM1006 A0 B15 L0 C0 D15 M0 E0 F15 N0 \nM1006 A53 B10 L99 C53 D10 M99 E53 F10 N99 \nM1006 A57 B10 L99 C57 D10 M99 E57 F10 N99 \nM1006 A0 B15 L0 C0 D15 M0 E0 F15 N0 \nM1006 A48 B10 L99 C48 D10 M99 E48 F10 N99 \nM1006 A0 B15 L0 C0 D15 M0 E0 F15 N0 \nM1006 A60 B10 L99 C60 D10 M99 E60 F10 N99 \nM1006 W\n;=====printer finish  sound=========\nM400\nM18\n\n
N207 ; machine_load_filament_time = 30
N208 ; machine_max_acceleration_e = 5000,5000,5000,5000
N209 ; machine_max_acceleration_extruding = 20000,20000,20000,20000
N210 ; machine_max_acceleration_retracting = 5000,5000,5000,5000
N211 ; machine_max_acceleration_travel = 9000,9000,9000,9000
N212 ; machine_max_acceleration_x = 16000,16000,16000,16000
N213 ; machine_max_acceleration_y = 16000,16000,16000,16000
N214 ; machine_max_acceleration_z = 500,500,500,500
N215 ; machine_max_jerk_e = 2.5,2.5,2.5,2.5
N216 ; machine_max_jerk_x = 9,9,9,9
N217 ; machine_max_jerk_y = 9,9,9,9
N218 ; machine_max_jerk_z = 3,3,3,3
N219 ; machine_max_speed_e = 50,50,50,50
N220 ; machine_max_speed_x = 1000,1000,1000,1000
N221 ; machine_max_speed_y = 1000,1000,1000,1000
N222 ; machine_max_speed_z = 30,30,30,30
N223 ; machine_min_extruding_rate = 0,0
N224 ; machine_min_travel_rate = 0,0
N225 ; machine_pause_gcode = M400 U1
N226 ; machine_start_gcode = ;===== machine: H2D =========================\n;===== date: 20250604 =====================\n\n;M1002 set_flag extrude_cali_flag=1\n;M1002 set_flag g29_before_print_flag=1\n;M1002 set_flag auto_cali_toolhead_offset_flag=1\n;M1002 set_flag build_plate_detect_flag=1\n\nM993 A0 B0 C0 ; nozzle cam detection not allowed.\n\nM400\n;M73 P99\n\n;=====printer start sound ===================\nM17\nM400 S1\nM1006 S1\nM1006 A53 B9 L99 C53 D9 M99 E53 F9 N99 \nM1006 A56 B9 L99 C56 D9 M99 E56 F9 N99 \nM1006 A61 B9 L99 C61 D9 M99 E61 F9 N99 \nM1006 A53 B9 L99 C53 D9 M99 E53 F9 N99 \nM1006 A56 B9 L99 C56 D9 M99 E56 F9 N99 \nM1006 A61 B18 L99 C61 D18 M99 E61 F18 N99 \nM1006 W\n;=====printer start sound ===================\n\n;===== reset machine status =================\nM204 S10000\nM630 S0 P0\n\nG90\nM17 D ; reset motor current to default\nM960 S5 P1 ; turn on logo lamp\nG90\nM220 S100 ;Reset Feedrate\nM221 S100 ;Reset Flowrate\nM73.2   R1.0 ;Reset left time magnitude\nG29.1 Z{+0.0} ; clear z-trim value first\nM983.1 M1 \nM901 D4\nM481 S0 ; turn off cutter pos comp\n;===== reset machine status =================\n\nM620 M ;enable remap\n\n;===== avoid end stop =================\nG91\nG380 S2 Z22 F1200\nG380 S2 Z-12 F1200\nG90\n;===== avoid end stop =================\n\n;==== set airduct mode ==== \n\n{if (overall_chamber_temperature >= 40)}\n\n    M145 P1 ; set airduct mode to heating mode for heating\n    M106 P2 S0 ; turn off auxiliary fan\n    M106 P3 S0 ; turn off chamber fan\n\n{else}\n    M145 P0 ; set airduct mode to cooling mode for cooling\n    M106 P2 S178 ; turn on auxiliary fan for cooling\n    M106 P3 S127 ; turn on chamber fan for cooling\n    M140 S0 ; stop heatbed from heating\n\n    M1002 gcode_claim_action : 29\n    M191 S0 ; wait for chamber temp\n    M106 P2 S0 ; turn off auxiliary fan\n    {if (min_vitrification_temperature <= 50)}\n        {if (nozzle_diameter == 0.2)}\n            M142 P1 R30 S35 T40 U0.3 V0.5 W0.8 O40 ; set PLA/TPU ND0.2 chamber autocooling\n        {else}\n            M142 P1 R30 S40 T45 U0.3 V0.5 W0.8 O45; set PLA/TPU ND0.4 chamber autocooling\n        {endif}\n    {else}\n        {if (!is_all_bbl_filament)}\n            M142 P1 R35 S40 T45 U0.3 V0.5 W0.8 O45 L1 ; set third-party PETG chamber autocooling\n        {else}\n            {if (nozzle_diameter == 0.2)}\n                M142 P1 R35 S45 T50 U0.3 V0.5 W0.8 O50 L1 ; set PETG ND0.2 chamber autocooling\n            {else}\n                M142 P1 R35 S50 T55 U0.3 V0.5 W0.8 O55 L1 ; set PETG ND0.4 chamber autocooling\n            {endif}\n        {endif}\n    {endif}\n{endif}\n;==== set airduct mode ==== \n\n;===== start to heat heatbed & hotend==========\n\n    M1002 set_filament_type:{filament_type[initial_no_support_extruder]}\n\n    M104 S140 A\n    M140 S[bed_temperature_initial_layer_single]\n\n    ;===== set chamber temperature ==========\n    {if (overall_chamber_temperature >= 40)}\n        M145 P1 ; set airduct mode to heating mode\n        M141 S[overall_chamber_temperature] ; Let Chamber begin to heat\n    {endif}\n    ;===== set chamber temperature ==========\n\n;===== start to heat heatbead & hotend==========\n\n;====== cog noise reduction=================\nM982.2 S1 ; turn on cog noise reduction\n\n;===== first homing start =====\nM1002 gcode_claim_action : 13\n\nG28 X T300\n\nG150.1 F18000 ; wipe mouth to avoid filament stick to heatbed\nG150.3 F18000\nM400 P200\nM972 S24 P0 T2000\n{if curr_bed_type=="Textured PEI Plate"}\nM972 S26 P0 C0\n{elsif curr_bed_type=="High Temp Plate"}\nM972 S36 P0 C0 X1\n{endif}\nM972 S35 P0 C0\n\nG90\nG1 X175 Y160 F30000\n\nG28 Z P0 T250\n\n;===== first homing end =====\n\nM400\n;M73 P99\n\n;===== detection start =====\n\n    T1001\n    G383.4 ; left-extruder load status detection\n    \n    M104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]-80} A ; rise temp in advance\n\nM1002 judge_flag build_plate_detect_flag\nM622 S1\n    M972 S19 P0 C0    ; heatbed presence detection\nM623\n\n    M972 S14 P0 ; nozzle type detection\n\n;===== detection end =====\n\nM400\n;M73 P99\n\n;===== prepare print temperature and material ==========\nM400\nM211 X0 Y0 Z0 ;turn off soft endstop\nM975 S1 ; turn on input shaping\n\nG29.2 S0 ; avoid invalid abl data\n\n{if ((filament_type[initial_no_support_extruder] == "PLA") || (filament_type[initial_no_support_extruder] == "PLA-CF") || (filament_type[initial_no_support_extruder] == "PETG")) && (nozzle_diameter[initial_no_support_extruder] == 0.2)}\nM620.10 A0 F74.8347 H{nozzle_diameter[initial_no_support_extruder]} T{nozzle_temperature_range_high[initial_no_support_extruder]} P{nozzle_temperature_initial_layer[initial_no_support_extruder]} S1\nM620.10 A1 F74.8347 H{nozzle_diameter[initial_no_support_extruder]} T{nozzle_temperature_range_high[initial_no_support_extruder]} P{nozzle_temperature_initial_layer[initial_no_support_extruder]} S1\n{else}\nM620.10 A0 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60} H{nozzle_diameter[initial_no_support_extruder]} T{nozzle_temperature_range_high[initial_no_support_extruder]} P{nozzle_temperature_initial_layer[initial_no_support_extruder]} S1\nM620.10 A1 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60} H{nozzle_diameter[initial_no_support_extruder]} T{nozzle_temperature_range_high[initial_no_support_extruder]} P{nozzle_temperature_initial_layer[initial_no_support_extruder]} S1\n{endif}\n\nM620.11 P0 I[initial_no_support_extruder] E0\n\n{if long_retraction_when_ec }\nM620.11 K1 I[initial_no_support_extruder] R{retraction_distance_when_ec} F{max((filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60), 200)}\n{else}\nM620.11 K0 I[initial_no_support_extruder] R0\n{endif}\n\nM628 S1\n{if filament_type[initial_no_support_extruder] == "TPU"}\n    M620.11 S0 L0 I[initial_no_support_extruder] E-{retraction_distances_when_cut[initial_no_support_extruder]} F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60}\n{else}\n{if (filament_type[initial_no_support_extruder] == "PA") ||  (filament_type[initial_no_support_extruder] == "PA-GF")}\n    M620.11 S1 L0 I[initial_no_support_extruder] R4 D2 E-{retraction_distances_when_cut[initial_no_support_extruder]} F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60}\n{else}\n    M620.11 S1 L0 I[initial_no_support_extruder] R10 D8 E-{retraction_distances_when_cut[initial_no_support_extruder]} F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60}\n{endif}\n{endif}\nM629\n\nM620 S[initial_no_support_extruder]A   ; switch material if AMS exist\nM1002 gcode_claim_action : 4\nM1002 set_filament_type:UNKNOWN\nM400\nT[initial_no_support_extruder]\nM400\nM628 S0\nM629\nM400\nM1002 set_filament_type:{filament_type[initial_no_support_extruder]}\nM621 S[initial_no_support_extruder]A\n\nM104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]}\nM400\nM106 P1 S0\n\nG29.2 S1\n;===== prepare print temperature and material ==========\n\nM400\n;M73 P99\n\n;===== auto extrude cali start =========================\nM975 S1\nM1002 judge_flag extrude_cali_flag\n\nM622 J0\n    M983.3 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4} A0.4 ; cali dynamic extrusion compensation\nM623\n\nM622 J1\n    M1002 set_filament_type:{filament_type[initial_no_support_extruder]}\n    M1002 gcode_claim_action : 8\n\n    M109 S{nozzle_temperature[initial_no_support_extruder]}\n\n    G90\n    M83\n    M983.3 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4} A0.4 ; cali dynamic extrusion compensation\n\n    M400\n    M106 P1 S255\n    M400 S5\n    M106 P1 S0\n    G150.3\nM623\n\nM622 J2\n    M1002 set_filament_type:{filament_type[initial_no_support_extruder]}\n    M1002 gcode_claim_action : 8\n\n    M109 S{nozzle_temperature[initial_no_support_extruder]}\n\n    G90\n    M83\n    M983.3 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4} A0.4 ; cali dynamic extrusion compensation\n\n    M400\n    M106 P1 S255\n    M400 S5\n    M106 P1 S0\n    G150.3\nM623\n\n;===== auto extrude cali end =========================\n\n{if filament_type[initial_no_support_extruder] == "TPU"}\n    G150.2\n    G150.1\n    G150.2\n    G150.1\n    G150.2\n    G150.1\n{else}\n    M106 P1 S0\n    M400 S2\n    M83\n    G1 E45 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60}\n    G1 E-3 F1800\n    M400 P500\n    G150.2\n    G150.1\n{endif}\n\nG91\nG1 Y-16 F12000 ; move away from the trash bin\nG90\n\nM400\n;M73 P99\n\n;===== wipe right nozzle start =====\n\nM1002 gcode_claim_action : 14\n    G150 T{nozzle_temperature_initial_layer[initial_no_support_extruder]}\n    {if (overall_chamber_temperature >= 40)}\n        G150 T{nozzle_temperature_initial_layer[initial_no_support_extruder] - 80}\n    {endif}\nM106 S255 ; turn on fan to cool the nozzle\n\n;===== wipe left nozzle end =====\n\nM400\n;M73 P99\n\n{if (overall_chamber_temperature >= 40)}\n    M1002 gcode_claim_action : 49\n    M191 S[overall_chamber_temperature] ; wait for chamber temp\n{endif}\n\nM400\n;M73 P99\n\n;===== bed leveling ==================================\n\nM1002 judge_flag g29_before_print_flag\n\nM190 S[bed_temperature_initial_layer_single]; ensure bed temp\nM109 S140 A\nM106 S0 ; turn off fan , too noisy\n\nG91\nG1 Z5 F1200\nG90\nG1 X275 Y300 F30000\n\nM622 J1\n    M1002 gcode_claim_action : 1\n    G29.20 A3\n    G29 A1 O X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    M400\n    M500 ; save cali data\nM623\n    \nM622 J2\n    M1002 gcode_claim_action : 1\n    {if has_tpu_in_first_layer}\n        G29.20 A3\n        G29 A1 O X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    {else}\n        G29.20 A4\n        G29 A2 O X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    {endif}\n    M400\n    M500 ; save cali data\nM623\n\nM622 J0\n    G28\nM623\n\n;===== bed leveling end ================================\n\nG39.1 ; cali nozzle wrapped detection pos\nM500\n\n;===== z ofst cali start =====\n\n    M190 S[bed_temperature_initial_layer_single]; ensure bed temp\n\n    G383 O0 M2 T140\n    M500\n\n;===== z ofst cali end =====\n\nM400\n;M73 P99\n\nM141 S[overall_chamber_temperature]\nM104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]} A\n\n;===== mech mode sweep start =====\n    M1002 gcode_claim_action : 3\n\n    G90\n    G1 Z5 F1200\n    G1 X187 Y160 F20000\n    T1000\n    M400 P200\n\n    M970.3 Q1 A5 K0 O1\n    M974 Q1 S2 P0\n\n    M970.3 Q0 A5 K0 O1\n    M974 Q0 S2 P0\n\n    M970.2 Q2 K0 W38 Z0.01\n    M974 Q2 S2 P0\n    M500\n\n    M975 S1\n;===== mech mode sweep end =====\n\nM400\n;M73 P99\n\nG150.3 ; move to garbage can to wait for temp\nM1026\n\n;===== xy ofst cali start =====\n\nM1002 judge_flag auto_cali_toolhead_offset_flag\n\nM622 J0\n    M1012.5 N1 R1\nM623\n\nM622 J1\n    M1002 gcode_claim_action : 39\n    M141 S0\n    M620.17 T0 S{nozzle_temperature_initial_layer[(first_non_support_filaments[0] != -1 ? first_non_support_filaments[0] : first_filaments[0])]} L{(first_non_support_filaments[0] != -1 ? first_non_support_filaments[0] : first_filaments[0])}\n    M620.17 T1 S{nozzle_temperature_initial_layer[(first_non_support_filaments[1] != -1 ? first_non_support_filaments[1] : first_filaments[1])]} L{(first_non_support_filaments[1] != -1 ? first_non_support_filaments[1] : first_filaments[1])}\n    G383 O1 T{nozzle_temperature_initial_layer[initial_no_support_extruder]} L{initial_no_support_extruder}\n    M500\n    M141 S[overall_chamber_temperature]\nM623\n\nM622 J2\n    M1002 gcode_claim_action : 39\n    M141 S0\n    M620.17 T0 S{nozzle_temperature_initial_layer[(first_non_support_filaments[0] != -1 ? first_non_support_filaments[0] : first_filaments[0])]} L{(first_non_support_filaments[0] != -1 ? first_non_support_filaments[0] : first_filaments[0])}\n    M620.17 T1 S{nozzle_temperature_initial_layer[(first_non_support_filaments[1] != -1 ? first_non_support_filaments[1] : first_filaments[1])]} L{(first_non_support_filaments[1] != -1 ? first_non_support_filaments[1] : first_filaments[1])}\n    G383.3 T{nozzle_temperature_initial_layer[initial_no_support_extruder]} L{initial_no_support_extruder}\n    M500\n    M141 S[overall_chamber_temperature]\nM623\n;===== xy ofst cali end =====\n\nM400\n;M73 P99\n\nM1002 gcode_claim_action : 0\nM400\n\n;============switch again==================\n\nM211 X0 Y0 Z0 ;turn off soft endstop\nG91\nG1 Z6 F1200\nG90\nM1002 set_filament_type:{filament_type[initial_no_support_extruder]}\nM620 S[initial_no_support_extruder]A\nM400\nT[initial_no_support_extruder]\nM400\nM628 S0\nM629\nM400\nM621 S[initial_no_support_extruder]A\n\n;============switch again==================\n\nM400\n;M73 P99\n\n;===== wait temperature reaching the reference value =======\n\nM104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]} ; rise to print tmpr\n\nM140 S[bed_temperature_initial_layer_single] \nM190 S[bed_temperature_initial_layer_single] \n\n    ;========turn off light and fans =============\n    M960 S1 P0 ; turn off laser\n    M960 S2 P0 ; turn off laser\n    M106 S0 ; turn off fan\n    M106 P2 S0 ; turn off big fan\n\n    ;============set motor current==================\n    M400 S1\n\n;===== wait temperature reaching the reference value =======\n\nM400\n;M73 P99\n\n;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==\n    {if curr_bed_type=="Textured PEI Plate"}\n        G29.1 Z{-0.02} ; for Textured PEI Plate\n    {endif}\n    \nG150.1\n\nM975 S1 ; turn on mech mode supression\nM983.4 S1 ; turn on deformation compensation \nG29.2 S1 ; turn on pos comp\nG29.7 S1\n\nG90\nG1 Z5 F1200\nG1 Y295 F30000\nG1 Y265 F18000\n\n;===== nozzle load line ===============================\nG29.2 S1 ; ensure z comp turn on\nG90\nM83\nM109 S{nozzle_temperature_initial_layer[initial_no_support_extruder]}\n{if filament_type[initial_no_support_extruder] == "TPU"}\n    ;G130 O0 F{filament_max_volumetric_speed[initial_no_support_extruder]/2/2.4053} L80 E5 D12 A{first_layer_print_min[0]} B{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    G130 O0 X250 Y-0.5 Z0.8 F{filament_max_volumetric_speed[initial_no_support_extruder]/2/2.4053} L40 E20 D5\n{else}\n    ;G130 O0 F{filament_max_volumetric_speed[initial_no_support_extruder]/2/2.4053} L80 E5 D12 A{first_layer_print_min[0]} B{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    G130 O0 X250 Y-0.5 Z0.8 F{filament_max_volumetric_speed[initial_no_support_extruder]/2/2.4053} L40 E20 D5\n{endif}\nG90\nM83\nG1 Z0.2\n\n;===== noozle load line end ===========================\n\nM400\n;M73 P99\n\nM993 A1 B1 C1 ; nozzle cam detection allowed.\n\n{if (filament_type[initial_no_support_extruder] == "TPU")}\nM1015.3 S1;enable tpu clog detect\n{else}\nM1015.3 S0;disable tpu clog detect\n{endif}\n\n{if (filament_type[initial_no_support_extruder] == "PLA") ||  (filament_type[initial_no_support_extruder] == "PETG")\n ||  (filament_type[initial_no_support_extruder] == "PLA-CF")  ||  (filament_type[initial_no_support_extruder] == "PETG-CF")}\nM1015.4 S1 K1 H[nozzle_diameter] ;enable E air printing detect\n{else}\nM1015.4 S0 K0 H[nozzle_diameter] ;disable E air printing detect\n{endif}\n\nM620.6 I[initial_no_support_extruder] W1 ;enable ams air printing detect\n\nM211 Z1\nG29.99\n\n\n
N227 ; machine_switch_extruder_time = 5.6
N228 ; machine_unload_filament_time = 30
N229 ; master_extruder_id = 2
N230 ; max_bridge_length = 0
N231 ; max_layer_height = 0.28,0.28
N232 ; max_travel_detour_distance = 0
N233 ; min_bead_width = 85%
N234 ; min_feature_size = 25%
N235 ; min_layer_height = 0.08,0.08
N236 ; minimum_sparse_infill_area = 15
N237 ; mmu_segmented_region_interlocking_depth = 0
N238 ; mmu_segmented_region_max_width = 0
N239 ; nozzle_diameter = 0.4,0.4
N240 ; nozzle_height = 4
N241 ; nozzle_temperature = 255,240
N242 ; nozzle_temperature_initial_layer = 255,240
N243 ; nozzle_temperature_range_high = 270,250
N244 ; nozzle_temperature_range_low = 240,200
N245 ; nozzle_type = hardened_steel,hardened_steel
N246 ; nozzle_volume = 130,145
N247 ; nozzle_volume_type = Standard,Standard
N248 ; only_one_wall_first_layer = 0
N249 ; ooze_prevention = 0
N250 ; other_layers_print_sequence = 0
N251 ; other_layers_print_sequence_nums = 0
N252 ; outer_wall_acceleration = 5000,5000
N253 ; outer_wall_jerk = 9
N254 ; outer_wall_line_width = 0.42
N255 ; outer_wall_speed = 200,200
N256 ; overhang_1_4_speed = 0,0
N257 ; overhang_2_4_speed = 50,50
N258 ; overhang_3_4_speed = 30,30
N259 ; overhang_4_4_speed = 10,10
N260 ; overhang_fan_speed = 90,100
N261 ; overhang_fan_threshold = 10%,95%
N262 ; overhang_threshold_participating_cooling = 95%,95%
N263 ; overhang_totally_speed = 10,10
N264 ; physical_extruder_map = 1,0
N265 ; post_process = "/opt/homebrew/bin/python3 \"/Users/bbrenner/Documents/Scripting Projects/Brick and Mortar/brick_and_mortar-debug.py\" {input_file} {output_file}"
N266 ; pre_start_fan_time = 0,0
N267 ; precise_outer_wall = 0
N268 ; precise_z_height = 0
N269 ; pressure_advance = 0.02,0.02
N270 ; prime_tower_brim_width = -1
N271 ; prime_tower_enable_framework = 0
N272 ; prime_tower_extra_rib_length = 0
N273 ; prime_tower_fillet_wall = 1
N274 ; prime_tower_flat_ironing = 1
N275 ; prime_tower_infill_gap = 150%
N276 ; prime_tower_lift_height = -1
N277 ; prime_tower_lift_speed = 90
N278 ; prime_tower_max_speed = 90
N279 ; prime_tower_rib_wall = 1
N280 ; prime_tower_rib_width = 8
N281 ; prime_tower_skip_points = 1
N282 ; prime_tower_width = 60
N283 ; print_compatible_printers = "Bambu Lab H2D 0.4 nozzle"
N284 ; print_extruder_id = 1,2
N285 ; print_extruder_variant = "Direct Drive Standard";"Direct Drive Standard"
N286 ; print_flow_ratio = 1
N287 ; print_sequence = by layer
N288 ; print_settings_id = 0.20mm Brick and Mortar Test
N289 ; printable_area = 0x0,350x0,350x320,0x320
N290 ; printable_height = 325
N291 ; printer_extruder_id = 1,2
N292 ; printer_extruder_variant = "Direct Drive Standard";"Direct Drive Standard"
N293 ; printer_model = Bambu Lab H2D
N294 ; printer_notes = 
N295 ; printer_settings_id = Bambu Lab H2D 0.4 nozzle
N296 ; printer_structure = corexy
N297 ; printer_technology = FFF
N298 ; printer_variant = 0.4
N299 ; printhost_authorization_type = key
N300 ; printhost_ssl_ignore_revoke = 0
N301 ; printing_by_object_gcode = 
N302 ; process_notes = --base-tool T0                     # Tool for base material (default: T0)\n--alt-tool T1                      # Tool for mortar material (default: T1)\n\n--layer-height 0.2                # Layer height in mm (default: 0.2)\n--mortar-offset-z 0.1             # Z offset for mortar layer (default: half of layer height)\n--brick-offset-xy 0.25            # XY stagger for mortar paths (default: 0.25mm)\n\n--over-extrude 1.05               # Extrusion multiplier for mortar layer (default: 1.05 = 5% over)\n--enable-over-extrude             # Explicit toggle for applying over-extrusion (optional)\n\n--enable-tool-settings            # Use hardcoded temp/fan settings (default: off)\n--no-tool-settings                # Disable hardcoded temp/fan settings even if defined\n\n--no-modify-infill                # Skip infill entirely (default: true – script focuses on walls)\n--include-top-bottom              # Enable modification of top/bottom shells (experimental)\n\n--debug                           # Print debug information while running\n
N303 ; raft_contact_distance = 0.1
N304 ; raft_expansion = 1.5
N305 ; raft_first_layer_density = 90%
N306 ; raft_first_layer_expansion = 2
N307 ; raft_layers = 0
N308 ; reduce_crossing_wall = 1
N309 ; reduce_fan_stop_start_freq = 1,1
N310 ; reduce_infill_retraction = 1
N311 ; required_nozzle_HRC = 3,3
N312 ; resolution = 0.012
N313 ; retract_before_wipe = 0%,0%
N314 ; retract_length_toolchange = 2,2
N315 ; retract_lift_above = 0,0
N316 ; retract_lift_below = 319,319
N317 ; retract_restart_extra = 0,0
N318 ; retract_restart_extra_toolchange = 0,0
N319 ; retract_when_changing_layer = 1,1
N320 ; retraction_distances_when_cut = 10,10
N321 ; retraction_distances_when_ec = 10,0
N322 ; retraction_length = 0.8,0.8
N323 ; retraction_minimum_travel = 1,1
N324 ; retraction_speed = 30,30
N325 ; role_base_wipe_speed = 1
N326 ; scan_first_layer = 0
N327 ; scarf_angle_threshold = 155
N328 ; seam_gap = 15%
N329 ; seam_position = aligned
N330 ; seam_slope_conditional = 1
N331 ; seam_slope_entire_loop = 0
N332 ; seam_slope_inner_walls = 1
N333 ; seam_slope_steps = 10
N334 ; silent_mode = 0
N335 ; single_extruder_multi_material = 1
N336 ; skeleton_infill_density = 15%
N337 ; skeleton_infill_line_width = 0.45
N338 ; skin_infill_density = 15%
N339 ; skin_infill_depth = 2
N340 ; skin_infill_line_width = 0.45
N341 ; skirt_distance = 2
N342 ; skirt_height = 1
N343 ; skirt_loops = 1
N344 ; slice_closing_radius = 0.049
N345 ; slicing_mode = regular
N346 ; slow_down_for_layer_cooling = 1,1
N347 ; slow_down_layer_time = 12,8
N348 ; slow_down_min_speed = 10,10
N349 ; small_perimeter_speed = 50%,50%
N350 ; small_perimeter_threshold = 0,0
N351 ; smooth_coefficient = 4
N352 ; smooth_speed_discontinuity_area = 1
N353 ; solid_infill_filament = 1
N354 ; sparse_infill_acceleration = 100%,100%
N355 ; sparse_infill_anchor = 400%
N356 ; sparse_infill_anchor_max = 20
N357 ; sparse_infill_density = 15%
N358 ; sparse_infill_filament = 1
N359 ; sparse_infill_line_width = 0.45
N360 ; sparse_infill_pattern = cubic
N361 ; sparse_infill_speed = 350,350
N362 ; spiral_mode = 0
N363 ; spiral_mode_max_xy_smoothing = 200%
N364 ; spiral_mode_smooth = 0
N365 ; standby_temperature_delta = -5
N366 ; start_end_points = 30x-3,54x245
N367 ; supertack_plate_temp = 0,0
N368 ; supertack_plate_temp_initial_layer = 0,0
N369 ; support_air_filtration = 0
N370 ; support_angle = 0
N371 ; support_base_pattern = default
N372 ; support_base_pattern_spacing = 2.5
N373 ; support_bottom_interface_spacing = 0.5
N374 ; support_bottom_z_distance = 0.2
N375 ; support_chamber_temp_control = 1
N376 ; support_critical_regions_only = 0
N377 ; support_expansion = 0
N378 ; support_filament = 0
N379 ; support_interface_bottom_layers = 2
N380 ; support_interface_filament = 0
N381 ; support_interface_loop_pattern = 0
N382 ; support_interface_not_for_body = 1
N383 ; support_interface_pattern = auto
N384 ; support_interface_spacing = 0.5
N385 ; support_interface_speed = 80,80
N386 ; support_interface_top_layers = 2
N387 ; support_line_width = 0.42
N388 ; support_object_first_layer_gap = 0.2
N389 ; support_object_xy_distance = 0.35
N390 ; support_on_build_plate_only = 0
N391 ; support_remove_small_overhang = 1
N392 ; support_speed = 150,150
N393 ; support_style = default
N394 ; support_threshold_angle = 30
N395 ; support_top_z_distance = 0.2
N396 ; support_type = tree(auto)
N397 ; symmetric_infill_y_axis = 0
N398 ; temperature_vitrification = 90,30
N399 ; template_custom_gcode = 
N400 ; textured_plate_temp = 70,35
N401 ; textured_plate_temp_initial_layer = 70,35
N402 ; thick_bridges = 0
N403 ; thumbnail_size = 50x50
N404 ; time_lapse_gcode = ;======== H2D 20250527========\n; SKIPPABLE_START\n; SKIPTYPE: timelapse\nM622.1 S1 ; for prev firware, default turned on\n\nM1002 judge_flag timelapse_record_flag\n\nM622 J1\nM993 A2 B2 C2\nM993 A0 B0 C0\n\n{if !spiral_mode && !(has_timelapse_safe_pos && timelapse_type == 0 && print_sequence != "by object") }\n    {if most_used_physical_extruder_id!= curr_physical_extruder_id || timelapse_type == 1}\n        M83\n        G1 Z{max_layer_z + 0.4} F1200\n        M400\n    {endif}\n{endif}\n\n{if has_timelapse_safe_pos && timelapse_type == 0 && print_sequence != "by object"}\n    M9711 M{timelapse_type} E{most_used_physical_extruder_id} X{timelapse_pos_x} Y{timelapse_pos_y} Z{layer_z + 0.4} S11 C10 O0 T3000\n{else}\n    M9711 M{timelapse_type} E{most_used_physical_extruder_id} Z{layer_z + 0.4} S11 C10 O0 T3000\n{endif}\n\n{if !spiral_mode && !(has_timelapse_safe_pos && timelapse_type == 0 && print_sequence != "by object") }\n    {if most_used_physical_extruder_id!= curr_physical_extruder_id || timelapse_type == 1}\n        G90\n        G1 Z{max_layer_z + 3.0} F1200\n        G1 Y295 F30000\n        G1 Y265 F18000\n        M83\n    {endif}\n{endif}\nM993 A3 B3 C3\n\nM623\n; SKIPPABLE_END\n
N405 ; timelapse_type = 0
N406 ; top_area_threshold = 200%
N407 ; top_color_penetration_layers = 5
N408 ; top_one_wall_type = all top
N409 ; top_shell_layers = 5
N410 ; top_shell_thickness = 1
N411 ; top_solid_infill_flow_ratio = 1
N412 ; top_surface_acceleration = 2000,2000
N413 ; top_surface_jerk = 9
N414 ; top_surface_line_width = 0.42
N415 ; top_surface_pattern = monotonicline
N416 ; top_surface_speed = 200,200
N417 ; travel_acceleration = 10000,10000
N418 ; travel_jerk = 9
N419 ; travel_speed = 1000,1000
N420 ; travel_speed_z = 0,0
N421 ; tree_support_branch_angle = 45
N422 ; tree_support_branch_diameter = 2
N423 ; tree_support_branch_diameter_angle = 5
N424 ; tree_support_branch_distance = 5
N425 ; tree_support_wall_count = 0
N426 ; upward_compatible_machine = 
N427 ; use_firmware_retraction = 0
N428 ; use_relative_e_distances = 1
N429 ; vertical_shell_speed = 80%,80%
N430 ; wall_distribution_count = 1
N431 ; wall_filament = 1
N432 ; wall_generator = classic
N433 ; wall_loops = 4
N434 ; wall_sequence = inner wall/outer wall
N435 ; wall_transition_angle = 10
N436 ; wall_transition_filter_deviation = 25%
N437 ; wall_transition_length = 100%
N438 ; wipe = 1,1
N439 ; wipe_distance = 2,2
N440 ; wipe_speed = 80%
N441 ; wipe_tower_no_sparse_layers = 0
N442 ; wipe_tower_rotation_angle = 0
N443 ; wipe_tower_x = 165
N444 ; wipe_tower_y = 250
N445 ; xy_contour_compensation = 0
N446 ; xy_hole_compensation = 0
N447 ; z_direction_outwall_speed_continuous = 1
N448 ; z_hop = 0.4,0.4
N449 ; z_hop_types = Auto Lift,Auto Lift
N450 ; CONFIG_BLOCK_END
N451 
N452 ; EXECUTABLE_BLOCK_START
N453 M73 P0 R62
N454 M201 X16000 Y16000 Z500 E5000
N455 M203 X1000 Y1000 Z30 E50
N456 M204 P20000 R5000 T20000
N457 M205 X9.00 Y9.00 Z3.00 E2.50
N458 M106 S0
N459 M106 P2 S0
N460 ; FEATURE: Custom
N461 ;===== machine: H2D =========================
N462 ;===== date: 20250604 =====================
N463 
N464 ;M1002 set_flag extrude_cali_flag=1
N465 ;M1002 set_flag g29_before_print_flag=1
N466 ;M1002 set_flag auto_cali_toolhead_offset_flag=1
N467 ;M1002 set_flag build_plate_detect_flag=1
N468 
N469 M993 A0 B0 C0 ; nozzle cam detection not allowed.
N470 
N471 M400
N472 ;M73 P99
N473 
N474 ;=====printer start sound ===================
N475 M17
N476 M400 S1
N477 M1006 S1
N478 M1006 A53 B9 L99 C53 D9 M99 E53 F9 N99 
N479 M1006 A56 B9 L99 C56 D9 M99 E56 F9 N99 
N480 M1006 A61 B9 L99 C61 D9 M99 E61 F9 N99 
N481 M1006 A53 B9 L99 C53 D9 M99 E53 F9 N99 
N482 M1006 A56 B9 L99 C56 D9 M99 E56 F9 N99 
N483 M1006 A61 B18 L99 C61 D18 M99 E61 F18 N99 
N484 M1006 W
N485 ;=====printer start sound ===================
N486 
N487 ;===== reset machine status =================
N488 M204 S10000
N489 M630 S0 P0
N490 
N491 G90
N492 M17 D ; reset motor current to default
N493 M960 S5 P1 ; turn on logo lamp
N494 G90
N495 M220 S100 ;Reset Feedrate
N496 M221 S100 ;Reset Flowrate
N497 M73.2   R1.0 ;Reset left time magnitude
N498 G29.1 Z0 ; clear z-trim value first
N499 M983.1 M1 
N500 M901 D4
N501 M481 S0 ; turn off cutter pos comp
N502 ;===== reset machine status =================
N503 
N504 M620 M ;enable remap
N505 
N506 ;===== avoid end stop =================
N507 G91
N508 G380 S2 Z22 F1200
N509 G380 S2 Z-12 F1200
N510 G90
N511 ;===== avoid end stop =================
N512 
N513 ;==== set airduct mode ==== 
N514 
N515 
N516     M145 P0 ; set airduct mode to cooling mode for cooling
N517     M106 P2 S178 ; turn on auxiliary fan for cooling
N518     M106 P3 S127 ; turn on chamber fan for cooling
N519     M140 S0 ; stop heatbed from heating
N520 
N521     M1002 gcode_claim_action : 29
N522     M191 S0 ; wait for chamber temp
N523     M106 P2 S0 ; turn off auxiliary fan
N524     
N525         
N526             M142 P1 R30 S40 T45 U0.3 V0.5 W0.8 O45; set PLA/TPU ND0.4 chamber autocooling
N527         
N528     
N529 
N530 ;==== set airduct mode ==== 
N531 
N532 ;===== start to heat heatbed & hotend==========
N533 
N534     M1002 set_filament_type:PCTG
N535 
N536     M104 S140 A
N537     M140 S70
N538 
N539     ;===== set chamber temperature ==========
N540     
N541     ;===== set chamber temperature ==========
N542 
N543 ;===== start to heat heatbead & hotend==========
N544 
N545 ;====== cog noise reduction=================
N546 M982.2 S1 ; turn on cog noise reduction
N547 
N548 ;===== first homing start =====
N549 M1002 gcode_claim_action : 13
N550 
N551 G28 X T300
N552 
N553 G150.1 F18000 ; wipe mouth to avoid filament stick to heatbed
N554 G150.3 F18000
N555 M400 P200
N556 M972 S24 P0 T2000
N557 
N558 M972 S26 P0 C0
N559 
N560 M972 S35 P0 C0
N561 
N562 G90
N563 G1 X175 Y160 F30000
N564 
N565 G28 Z P0 T250
N566 
N567 ;===== first homing end =====
N568 
N569 M400
N570 ;M73 P99
N571 
N572 ;===== detection start =====
N573 
N574     T1001
N575     G383.4 ; left-extruder load status detection
N576     
N577     M104 S175 A ; rise temp in advance
N578 
N579 M1002 judge_flag build_plate_detect_flag
N580 M622 S1
N581     M972 S19 P0 C0    ; heatbed presence detection
N582 M623
N583 
N584     M972 S14 P0 ; nozzle type detection
N585 
N586 ;===== detection end =====
N587 
N588 M400
N589 ;M73 P99
N590 
N591 ;===== prepare print temperature and material ==========
N592 M400
N593 M211 X0 Y0 Z0 ;turn off soft endstop
N594 M975 S1 ; turn on input shaping
N595 
N596 G29.2 S0 ; avoid invalid abl data
N597 
N598 
N599 M620.10 A0 F149.669 H0.4 T270 P255 S1
N600 M620.10 A1 F149.669 H0.4 T270 P255 S1
N601 
N602 
N603 M620.11 P0 I0 E0
N604 
N605 
N606 M620.11 K1 I0 R10 F200
N607 
N608 
N609 M628 S1
N610 
N611 
N612     M620.11 S1 L0 I0 R10 D8 E-10 F149.669
N613 
N614 
N615 M629
N616 
N617 M620 S0A   ; switch material if AMS exist
N618 M1002 gcode_claim_action : 4
N619 M1002 set_filament_type:UNKNOWN
N620 M400
N621 T0
N622 M400
N623 M628 S0
N624 M629
N625 M400
N626 M1002 set_filament_type:PCTG
N627 M621 S0A
N628 
N629 M104 S255
N630 M400
N631 M106 P1 S0
N632 
N633 G29.2 S1
N634 ;===== prepare print temperature and material ==========
N635 
N636 M400
N637 ;M73 P99
N638 
N639 ;===== auto extrude cali start =========================
N640 M975 S1
N641 M1002 judge_flag extrude_cali_flag
N642 
N643 M622 J0
N644     M983.3 F2.5 A0.4 ; cali dynamic extrusion compensation
N645 M623
N646 
N647 M622 J1
N648     M1002 set_filament_type:PCTG
N649     M1002 gcode_claim_action : 8
N650 
N651     M109 S255
N652 
N653     G90
N654     M83
N655     M983.3 F2.5 A0.4 ; cali dynamic extrusion compensation
N656 
N657     M400
N658     M106 P1 S255
N659     M400 S5
N660     M106 P1 S0
N661     G150.3
N662 M623
N663 
N664 M622 J2
N665     M1002 set_filament_type:PCTG
N666     M1002 gcode_claim_action : 8
N667 
N668     M109 S255
N669 
N670     G90
N671     M83
N672     M983.3 F2.5 A0.4 ; cali dynamic extrusion compensation
N673 
N674     M400
N675     M106 P1 S255
N676     M400 S5
N677     M106 P1 S0
N678     G150.3
N679 M623
N680 
N681 ;===== auto extrude cali end =========================
N682 
N683 
N684     M106 P1 S0
N685     M400 S2
N686     M83
N687     G1 E45 F149.669
N688     G1 E-3 F1800
N689     M400 P500
N690     G150.2
N691     G150.1
N692 
N693 
N694 G91
N695 G1 Y-16 F12000 ; move away from the trash bin
N696 G90
N697 
N698 M400
N699 ;M73 P99
N700 
N701 ;===== wipe right nozzle start =====
N702 
N703 M1002 gcode_claim_action : 14
N704     G150 T255
N705     
N706 M106 S255 ; turn on fan to cool the nozzle
N707 
N708 ;===== wipe left nozzle end =====
N709 
N710 M400
N711 ;M73 P99
N712 
N713 
N714 
N715 M400
N716 ;M73 P99
N717 
N718 ;===== bed leveling ==================================
N719 
N720 M1002 judge_flag g29_before_print_flag
N721 
N722 M190 S70; ensure bed temp
N723 M109 S140 A
N724 M106 S0 ; turn off fan , too noisy
N725 
N726 G91
N727 M73 P1 R61
N728 G1 Z5 F1200
N729 G90
N730 G1 X275 Y300 F30000
N731 
N732 M622 J1
N733     M1002 gcode_claim_action : 1
N734     G29.20 A3
N735     G29 A1 O X154.814 Y100.196 I45.8708 J184.128
N736     M400
N737     M500 ; save cali data
N738 M623
N739     
N740 M622 J2
N741     M1002 gcode_claim_action : 1
N742     
N743         G29.20 A3
N744         G29 A1 O X154.814 Y100.196 I45.8708 J184.128
N745     
N746     M400
N747     M500 ; save cali data
N748 M623
N749 
N750 M622 J0
N751     G28
N752 M623
N753 
N754 ;===== bed leveling end ================================
N755 
N756 G39.1 ; cali nozzle wrapped detection pos
N757 M500
N758 
N759 ;===== z ofst cali start =====
N760 
N761     M190 S70; ensure bed temp
N762 
N763     G383 O0 M2 T140
N764     M500
N765 
N766 ;===== z ofst cali end =====
N767 
N768 M400
N769 ;M73 P99
N770 
N771 M141 S0
N772 M104 S255 A
N773 
N774 ;===== mech mode sweep start =====
N775     M1002 gcode_claim_action : 3
N776 
N777     G90
N778 M73 P8 R57
N779     G1 Z5 F1200
N780     G1 X187 Y160 F20000
N781     T1000
N782     M400 P200
N783 
N784     M970.3 Q1 A5 K0 O1
N785     M974 Q1 S2 P0
N786 
N787     M970.3 Q0 A5 K0 O1
N788     M974 Q0 S2 P0
N789 
N790     M970.2 Q2 K0 W38 Z0.01
N791     M974 Q2 S2 P0
N792     M500
N793 
N794     M975 S1
N795 ;===== mech mode sweep end =====
N796 
N797 M400
N798 ;M73 P99
N799 
N800 G150.3 ; move to garbage can to wait for temp
N801 M1026
N802 
N803 ;===== xy ofst cali start =====
N804 
N805 M1002 judge_flag auto_cali_toolhead_offset_flag
N806 
N807 M622 J0
N808     M1012.5 N1 R1
N809 M623
N810 
N811 M622 J1
N812     M1002 gcode_claim_action : 39
N813     M141 S0
N814     M620.17 T0 S240 L1
N815     M620.17 T1 S255 L0
N816     G383 O1 T255 L0
N817     M500
N818     M141 S0
N819 M623
N820 
N821 M622 J2
N822     M1002 gcode_claim_action : 39
N823     M141 S0
N824     M620.17 T0 S240 L1
N825     M620.17 T1 S255 L0
N826     G383.3 T255 L0
N827     M500
N828     M141 S0
N829 M623
N830 ;===== xy ofst cali end =====
N831 
N832 M400
N833 ;M73 P99
N834 
N835 M1002 gcode_claim_action : 0
N836 M400
N837 
N838 ;============switch again==================
N839 
N840 M211 X0 Y0 Z0 ;turn off soft endstop
N841 G91
N842 G1 Z6 F1200
N843 G90
N844 M1002 set_filament_type:PCTG
N845 M620 S0A
N846 M400
N847 T0
N848 M400
N849 M628 S0
N850 M629
N851 M400
N852 M621 S0A
N853 
N854 ;============switch again==================
N855 
N856 M400
N857 ;M73 P99
N858 
N859 ;===== wait temperature reaching the reference value =======
N860 
N861 M104 S255 ; rise to print tmpr
N862 
N863 M140 S70 
N864 M190 S70 
N865 
N866     ;========turn off light and fans =============
N867     M960 S1 P0 ; turn off laser
N868     M960 S2 P0 ; turn off laser
N869     M106 S0 ; turn off fan
N870     M106 P2 S0 ; turn off big fan
N871 
N872     ;============set motor current==================
N873     M400 S1
N874 
N875 ;===== wait temperature reaching the reference value =======
N876 
N877 M400
N878 ;M73 P99
N879 
N880 ;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==
N881     
N882         G29.1 Z-0.02 ; for Textured PEI Plate
N883     
N884     
N885 G150.1
N886 
N887 M975 S1 ; turn on mech mode supression
N888 M983.4 S1 ; turn on deformation compensation 
N889 G29.2 S1 ; turn on pos comp
N890 G29.7 S1
N891 
N892 G90
N893 M73 P15 R52
N894 G1 Z5 F1200
N895 G1 Y295 F30000
N896 G1 Y265 F18000
N897 
N898 ;===== nozzle load line ===============================
N899 G29.2 S1 ; ensure z comp turn on
N900 G90
N901 M83
N902 M109 S255
N903 
N904     ;G130 O0 F1.24725 L80 E5 D12 A154.814 B100.196 I45.8708 J184.128
N905     G130 O0 X250 Y-0.5 Z0.8 F1.24725 L40 E20 D5
N906 
N907 G90
N908 M83
N909 G1 Z0.2
N910 
N911 ;===== noozle load line end ===========================
N912 
N913 M400
N914 ;M73 P99
N915 
N916 M993 A1 B1 C1 ; nozzle cam detection allowed.
N917 
N918 
N919 M1015.3 S0;disable tpu clog detect
N920 
N921 
N922 
N923 M1015.4 S0 K0 H0.4 ;disable E air printing detect
N924 
N925 
N926 M620.6 I0 W1 ;enable ams air printing detect
N927 
N928 M211 Z1
N929 G29.99
N930 
N931 
N932 ; MACHINE_START_GCODE_END
N933 M104 T0 S0 N0 ;Multi extruder pre cooling
N934 ; filament start gcode
N935 ;VT0
N936 G90
N937 G21
N938 M83 ; use relative distances for extrusion
N939 M981 S1 P20000 ;open spaghetti detector
N940 M204 S10000
N941 G1 Z.2 F60000
N942 ; CHANGE_LAYER
N943 ; Z_HEIGHT: 0.2
N944 ; LAYER_HEIGHT: 0.2
N945 ;======== H2D 20250521========
N946 ; layer num/total_layer_count: 1/75
N947 ; update layer progress
N948 M73 L1
N949 M991 S0 P0 ;notify layer change
N950 
N951 
N952 M106 S0
N953 M106 P2 S0
N954 G1 E-.8 F1800
N955 G1 X156.074 Y101.469 F60000
N956 M204 S6000
N957 G1 Z.6
N958 G1 Z.2
N959 G1 E.8 F1800
N960 ; FEATURE: Skirt
N961 ; LINE_WIDTH: 0.5
N962 ; LAYER_HEIGHT: 0.2
N963 G1 F3000
N964 M204 S500
N965 G1 X157.16 Y100.605 E.0501
N966 G1 X158.085 Y100.424 E.03401
N967 G1 X193.085 Y100.424 E1.26371
N968 G1 X194.416 Y100.816 E.0501
N969 G1 X195.322 Y101.867 E.0501
N970 G1 X195.54 Y102.799 E.03458
N971 G1 X200.455 Y249.908 E5.31446
N972 G1 X200.457 Y281.638 E1.14567
N973 G1 X200.065 Y282.97 E.0501
N974 G1 X199.014 Y283.876 E.0501
N975 G1 X198 Y284.095 E.03748
N976 G1 X164.991 Y284.095 E1.19182
N977 G1 X163.659 Y283.704 E.0501
N978 G1 X162.753 Y282.653 E.0501
N979 G1 X162.545 Y281.87 E.02926
N980 G1 X155.054 Y202.732 E2.87014
N981 G1 X155.043 Y117.5 E3.07737
N982 G1 X155.63 Y102.783 E.53179
N983 G1 X156.055 Y101.526 E.04794
N984 ; OBJECT_ID: 372
N985 ; WIPE_START
N986 G1 X157.16 Y100.605 E-.54662
N987 G1 X157.711 Y100.497 E-.21338
N988 ; WIPE_END
N989 G1 E-.04 F1800
N990 ; start printing object, unique label id: 372
N991 M624 AQAAAAAAAAA=
N992 M204 S6000
N993 G1 X160.099 Y107.746 Z.6 F60000
N994 G1 X190.729 Y200.729 Z.6
N995 G1 Z.2
N996 G1 E.8 F1800
N997 ; FEATURE: Inner wall
N998 G1 F3000
N999 M204 S500
N1000 G1 X159.271 Y200.729 E1.13581
N1001 G1 X159.271 Y119.271 E2.94111
N1002 G1 X190.729 Y119.271 E1.13581
N1003 G1 X190.729 Y200.669 E2.93894
N1004 M204 S6000
N1005 G1 X191.186 Y201.186 F60000
N1006 G1 F3000
N1007 M204 S500
N1008 G1 X158.814 Y201.186 E1.16881
N1009 M73 P16 R52
N1010 G1 X158.814 Y118.814 E2.97411
N1011 G1 X191.186 Y118.814 E1.16881
N1012 G1 X191.186 Y201.126 E2.97195
N1013 M204 S6000
N1014 G1 X191.643 Y201.643 F60000
N1015 G1 F3000
N1016 M204 S500
N1017 G1 X158.357 Y201.643 E1.20182
N1018 G1 X158.357 Y118.357 E3.00712
N1019 G1 X191.643 Y118.357 E1.20182
N1020 G1 X191.643 Y201.583 E3.00495
N1021 M204 S6000
N1022 G1 X192.1 Y202.1 F60000
N1023 ; FEATURE: Outer wall
N1024 G1 F3000
N1025 M204 S500
N1026 G1 X157.9 Y202.1 E1.23483
N1027 G1 X157.9 Y117.9 E3.04013
N1028 G1 X192.1 Y117.9 E1.23483
N1029 G1 X192.1 Y202.04 E3.03796
N1030 G1 E-.8 F1800
N1031 M204 S6000
N1032 G1 X191.871 Y194.411 Z.6 F60000
N1033 G1 X189.618 Y119.454 Z.6
N1034 G1 Z.2
N1035 G1 E.8 F1800
N1036 ; FEATURE: Bottom surface
N1037 ; LINE_WIDTH: 0.50182
N1038 G1 F3922.424
N1039 M204 S500
N1040 G1 X190.34 Y120.176 E.03702
N1041 G1 X190.34 Y120.825 E.02353
N1042 G1 X189.175 Y119.66 E.05975
N1043 G1 X188.526 Y119.66 E.02353
N1044 G1 X190.34 Y121.474 E.09302
N1045 G1 X190.34 Y122.123 E.02353
N1046 G1 X187.877 Y119.66 E.12629
N1047 G1 X187.228 Y119.66 E.02353
N1048 G1 X190.34 Y122.772 E.15956
N1049 G1 X190.34 Y123.421 E.02353
N1050 G1 X186.579 Y119.66 E.19283
N1051 G1 X185.93 Y119.66 E.02353
N1052 G1 X190.34 Y124.07 E.2261
N1053 G1 X190.34 Y124.719 E.02353
N1054 G1 X185.281 Y119.66 E.25937
N1055 G1 X184.632 Y119.66 E.02353
N1056 G1 X190.34 Y125.368 E.29264
N1057 G1 X190.34 Y126.017 E.02353
N1058 G1 X183.983 Y119.66 E.32591
N1059 G1 X183.334 Y119.66 E.02353
N1060 G1 X190.34 Y126.666 E.35918
N1061 G1 X190.34 Y127.315 E.02353
N1062 G1 X182.685 Y119.66 E.39245
N1063 G1 X182.036 Y119.66 E.02353
N1064 G1 X190.34 Y127.964 E.42572
N1065 G1 X190.34 Y128.613 E.02353
N1066 G1 X181.387 Y119.66 E.45899
N1067 G1 X180.738 Y119.66 E.02353
N1068 G1 X190.34 Y129.262 E.49226
N1069 G1 X190.34 Y129.911 E.02353
N1070 G1 X180.089 Y119.66 E.52553
N1071 G1 X179.44 Y119.66 E.02353
N1072 G1 X190.34 Y130.56 E.5588
N1073 G1 X190.34 Y131.209 E.02353
N1074 G1 X178.791 Y119.66 E.59207
N1075 G1 X178.142 Y119.66 E.02353
N1076 G1 X190.34 Y131.858 E.62534
N1077 G1 X190.34 Y132.507 E.02353
N1078 G1 X177.493 Y119.66 E.65861
N1079 G1 X176.844 Y119.66 E.02353
N1080 G1 X190.34 Y133.156 E.69188
N1081 G1 X190.34 Y133.805 E.02353
N1082 G1 X176.195 Y119.66 E.72515
N1083 G1 X175.546 Y119.66 E.02353
N1084 G1 X190.34 Y134.454 E.75842
N1085 G1 X190.34 Y135.103 E.02353
N1086 G1 X174.897 Y119.66 E.79169
N1087 G1 X174.248 Y119.66 E.02353
N1088 G1 X190.34 Y135.752 E.82496
N1089 G1 X190.34 Y136.401 E.02353
N1090 G1 X173.599 Y119.66 E.85823
N1091 G1 X172.95 Y119.66 E.02353
N1092 G1 X190.34 Y137.05 E.8915
N1093 G1 X190.34 Y137.699 E.02353
N1094 G1 X172.301 Y119.66 E.92477
N1095 G1 X171.652 Y119.66 E.02353
N1096 G1 X190.34 Y138.348 E.95804
N1097 G1 X190.34 Y138.997 E.02353
N1098 G1 X171.003 Y119.66 E.99131
N1099 G1 X170.354 Y119.66 E.02353
N1100 G1 X190.34 Y139.646 E1.02458
N1101 G1 X190.34 Y140.295 E.02353
N1102 G1 X169.705 Y119.66 E1.05785
N1103 G1 X169.056 Y119.66 E.02353
N1104 G1 X190.34 Y140.944 E1.09112
N1105 G1 X190.34 Y141.593 E.02353
N1106 G1 X168.407 Y119.66 E1.12439
N1107 G1 X167.758 Y119.66 E.02353
N1108 G1 X190.34 Y142.242 E1.15766
N1109 G1 X190.34 Y142.891 E.02353
N1110 G1 X167.109 Y119.66 E1.19093
N1111 G1 X166.46 Y119.66 E.02353
N1112 G1 X190.34 Y143.54 E1.2242
N1113 G1 X190.34 Y144.189 E.02353
N1114 G1 X165.811 Y119.66 E1.25747
N1115 G1 X165.162 Y119.66 E.02353
N1116 G1 X190.34 Y144.838 E1.29074
N1117 G1 X190.34 Y145.487 E.02353
N1118 G1 X164.513 Y119.66 E1.32401
N1119 G1 X163.865 Y119.66 E.02353
N1120 G1 X190.34 Y146.135 E1.35728
N1121 G1 X190.34 Y146.784 E.02353
N1122 G1 X163.216 Y119.66 E1.39055
N1123 G1 X162.567 Y119.66 E.02353
N1124 G1 X190.34 Y147.433 E1.42382
N1125 G1 X190.34 Y148.082 E.02353
N1126 G1 X161.918 Y119.66 E1.45709
N1127 G1 X161.269 Y119.66 E.02353
N1128 G1 X190.34 Y148.731 E1.49036
N1129 G1 X190.34 Y149.38 E.02353
N1130 G1 X160.62 Y119.66 E1.52363
N1131 G1 X159.971 Y119.66 E.02353
N1132 G1 X190.34 Y150.029 E1.5569
N1133 G1 X190.34 Y150.678 E.02353
N1134 G1 X159.66 Y119.998 E1.57284
N1135 G1 X159.66 Y120.647 E.02353
N1136 M73 P17 R51
N1137 G1 X190.34 Y151.327 E1.57284
N1138 G1 X190.34 Y151.976 E.02353
N1139 G1 X159.66 Y121.296 E1.57284
N1140 G1 X159.66 Y121.945 E.02353
N1141 G1 X190.34 Y152.625 E1.57284
N1142 G1 X190.34 Y153.274 E.02353
N1143 G1 X159.66 Y122.594 E1.57284
N1144 G1 X159.66 Y123.243 E.02353
N1145 G1 X190.34 Y153.923 E1.57284
N1146 G1 X190.34 Y154.572 E.02353
N1147 G1 X159.66 Y123.892 E1.57284
N1148 G1 X159.66 Y124.541 E.02353
N1149 G1 X190.34 Y155.221 E1.57284
N1150 G1 X190.34 Y155.87 E.02353
N1151 G1 X159.66 Y125.19 E1.57284
N1152 G1 X159.66 Y125.839 E.02353
N1153 G1 X190.34 Y156.519 E1.57284
N1154 G1 X190.34 Y157.168 E.02353
N1155 G1 X159.66 Y126.488 E1.57284
N1156 G1 X159.66 Y127.137 E.02353
N1157 G1 X190.34 Y157.817 E1.57284
N1158 G1 X190.34 Y158.466 E.02353
N1159 G1 X159.66 Y127.786 E1.57284
N1160 G1 X159.66 Y128.435 E.02353
N1161 G1 X190.34 Y159.115 E1.57284
N1162 G1 X190.34 Y159.764 E.02353
N1163 G1 X159.66 Y129.084 E1.57284
N1164 G1 X159.66 Y129.733 E.02353
N1165 G1 X190.34 Y160.413 E1.57284
N1166 G1 X190.34 Y161.062 E.02353
N1167 G1 X159.66 Y130.382 E1.57284
N1168 G1 X159.66 Y131.03 E.02353
N1169 G1 X190.34 Y161.711 E1.57284
N1170 G1 X190.34 Y162.36 E.02353
N1171 G1 X159.66 Y131.679 E1.57284
N1172 G1 X159.66 Y132.328 E.02353
N1173 G1 X190.34 Y163.009 E1.57284
N1174 G1 X190.34 Y163.658 E.02353
N1175 G1 X159.66 Y132.977 E1.57284
N1176 G1 X159.66 Y133.626 E.02353
N1177 G1 X190.34 Y164.307 E1.57284
N1178 G1 X190.34 Y164.956 E.02353
N1179 G1 X159.66 Y134.275 E1.57284
N1180 G1 X159.66 Y134.924 E.02353
N1181 G1 X190.34 Y165.605 E1.57284
N1182 G1 X190.34 Y166.254 E.02353
N1183 G1 X159.66 Y135.573 E1.57284
N1184 G1 X159.66 Y136.222 E.02353
N1185 G1 X190.34 Y166.903 E1.57284
N1186 G1 X190.34 Y167.552 E.02353
N1187 G1 X159.66 Y136.871 E1.57284
N1188 G1 X159.66 Y137.52 E.02353
N1189 G1 X190.34 Y168.201 E1.57284
N1190 G1 X190.34 Y168.85 E.02353
N1191 G1 X159.66 Y138.169 E1.57284
N1192 G1 X159.66 Y138.818 E.02353
N1193 G1 X190.34 Y169.499 E1.57284
N1194 G1 X190.34 Y170.148 E.02353
N1195 G1 X159.66 Y139.467 E1.57284
N1196 G1 X159.66 Y140.116 E.02353
N1197 G1 X190.34 Y170.797 E1.57284
N1198 G1 X190.34 Y171.446 E.02353
N1199 G1 X159.66 Y140.765 E1.57284
N1200 G1 X159.66 Y141.414 E.02353
N1201 G1 X190.34 Y172.095 E1.57284
N1202 G1 X190.34 Y172.744 E.02353
N1203 G1 X159.66 Y142.063 E1.57284
N1204 G1 X159.66 Y142.712 E.02353
N1205 G1 X190.34 Y173.393 E1.57284
N1206 G1 X190.34 Y174.042 E.02353
N1207 G1 X159.66 Y143.361 E1.57284
N1208 G1 X159.66 Y144.01 E.02353
N1209 G1 X190.34 Y174.691 E1.57284
N1210 G1 X190.34 Y175.34 E.02353
N1211 G1 X159.66 Y144.659 E1.57284
N1212 G1 X159.66 Y145.308 E.02353
N1213 G1 X190.34 Y175.989 E1.57284
N1214 G1 X190.34 Y176.638 E.02353
N1215 G1 X159.66 Y145.957 E1.57284
N1216 G1 X159.66 Y146.606 E.02353
N1217 G1 X190.34 Y177.287 E1.57284
N1218 G1 X190.34 Y177.936 E.02353
N1219 G1 X159.66 Y147.255 E1.57284
N1220 G1 X159.66 Y147.904 E.02353
N1221 G1 X190.34 Y178.585 E1.57284
N1222 G1 X190.34 Y179.234 E.02353
N1223 G1 X159.66 Y148.553 E1.57284
N1224 G1 X159.66 Y149.202 E.02353
N1225 G1 X190.34 Y179.883 E1.57284
N1226 G1 X190.34 Y180.532 E.02353
N1227 G1 X159.66 Y149.851 E1.57284
N1228 G1 X159.66 Y150.5 E.02353
N1229 M104 T0 S240 N0 ;Multi extruder pre heating
N1230 G1 X190.34 Y181.181 E1.57284
N1231 G1 X190.34 Y181.83 E.02353
N1232 M73 P18 R51
N1233 G1 X159.66 Y151.149 E1.57284
N1234 G1 X159.66 Y151.798 E.02353
N1235 G1 X190.34 Y182.479 E1.57284
N1236 G1 X190.34 Y183.127 E.02353
N1237 G1 X159.66 Y152.447 E1.57284
N1238 G1 X159.66 Y153.096 E.02353
N1239 G1 X190.34 Y183.776 E1.57284
N1240 G1 X190.34 Y184.425 E.02353
N1241 G1 X159.66 Y153.745 E1.57284
N1242 G1 X159.66 Y154.394 E.02353
N1243 G1 X190.34 Y185.074 E1.57284
N1244 G1 X190.34 Y185.723 E.02353
N1245 G1 X159.66 Y155.043 E1.57284
N1246 G1 X159.66 Y155.692 E.02353
N1247 G1 X190.34 Y186.372 E1.57284
N1248 G1 X190.34 Y187.021 E.02353
N1249 G1 X159.66 Y156.341 E1.57284
N1250 G1 X159.66 Y156.99 E.02353
N1251 G1 X190.34 Y187.67 E1.57284
N1252 G1 X190.34 Y188.319 E.02353
N1253 G1 X159.66 Y157.639 E1.57284
N1254 G1 X159.66 Y158.288 E.02353
N1255 G1 X190.34 Y188.968 E1.57284
N1256 G1 X190.34 Y189.617 E.02353
N1257 G1 X159.66 Y158.937 E1.57284
N1258 G1 X159.66 Y159.586 E.02353
N1259 G1 X190.34 Y190.266 E1.57284
N1260 G1 X190.34 Y190.915 E.02353
N1261 G1 X159.66 Y160.235 E1.57284
N1262 G1 X159.66 Y160.884 E.02353
N1263 G1 X190.34 Y191.564 E1.57284
N1264 G1 X190.34 Y192.213 E.02353
N1265 G1 X159.66 Y161.533 E1.57284
N1266 G1 X159.66 Y162.182 E.02353
N1267 G1 X190.34 Y192.862 E1.57284
N1268 G1 X190.34 Y193.511 E.02353
N1269 G1 X159.66 Y162.831 E1.57284
N1270 G1 X159.66 Y163.48 E.02353
N1271 G1 X190.34 Y194.16 E1.57284
N1272 G1 X190.34 Y194.809 E.02353
N1273 G1 X159.66 Y164.129 E1.57284
N1274 G1 X159.66 Y164.778 E.02353
N1275 G1 X190.34 Y195.458 E1.57284
N1276 G1 X190.34 Y196.107 E.02353
N1277 G1 X159.66 Y165.427 E1.57284
N1278 G1 X159.66 Y166.076 E.02353
N1279 G1 X190.34 Y196.756 E1.57284
N1280 G1 X190.34 Y197.405 E.02353
N1281 G1 X159.66 Y166.725 E1.57284
N1282 G1 X159.66 Y167.374 E.02353
N1283 G1 X190.34 Y198.054 E1.57284
N1284 G1 X190.34 Y198.703 E.02353
N1285 G1 X159.66 Y168.023 E1.57284
N1286 G1 X159.66 Y168.671 E.02353
N1287 G1 X190.34 Y199.352 E1.57284
N1288 G1 X190.34 Y200.001 E.02353
N1289 M73 P18 R50
N1290 G1 X159.66 Y169.32 E1.57284
N1291 G1 X159.66 Y169.969 E.02353
N1292 G1 X190.031 Y200.34 E1.55696
N1293 G1 X189.382 Y200.34 E.02353
N1294 G1 X159.66 Y170.618 E1.52369
N1295 G1 X159.66 Y171.267 E.02353
N1296 G1 X188.733 Y200.34 E1.49042
N1297 G1 X188.084 Y200.34 E.02353
N1298 G1 X159.66 Y171.916 E1.45715
N1299 G1 X159.66 Y172.565 E.02353
N1300 G1 X187.435 Y200.34 E1.42388
N1301 G1 X186.786 Y200.34 E.02353
N1302 G1 X159.66 Y173.214 E1.39061
N1303 G1 X159.66 Y173.863 E.02353
N1304 G1 X186.137 Y200.34 E1.35734
N1305 G1 X185.488 Y200.34 E.02353
N1306 G1 X159.66 Y174.512 E1.32407
N1307 G1 X159.66 Y175.161 E.02353
N1308 G1 X184.839 Y200.34 E1.2908
N1309 G1 X184.19 Y200.34 E.02353
N1310 G1 X159.66 Y175.81 E1.25753
N1311 G1 X159.66 Y176.459 E.02353
N1312 G1 X183.541 Y200.34 E1.22426
N1313 G1 X182.892 Y200.34 E.02353
N1314 G1 X159.66 Y177.108 E1.19099
N1315 G1 X159.66 Y177.757 E.02353
N1316 G1 X182.243 Y200.34 E1.15772
N1317 G1 X181.594 Y200.34 E.02353
N1318 G1 X159.66 Y178.406 E1.12445
N1319 G1 X159.66 Y179.055 E.02353
N1320 G1 X180.945 Y200.34 E1.09118
N1321 G1 X180.296 Y200.34 E.02353
N1322 G1 X159.66 Y179.704 E1.05791
N1323 G1 X159.66 Y180.353 E.02353
N1324 G1 X179.647 Y200.34 E1.02464
N1325 G1 X178.998 Y200.34 E.02353
N1326 G1 X159.66 Y181.002 E.99137
N1327 G1 X159.66 Y181.651 E.02353
N1328 G1 X178.349 Y200.34 E.9581
N1329 G1 X177.7 Y200.34 E.02353
N1330 G1 X159.66 Y182.3 E.92483
N1331 G1 X159.66 Y182.949 E.02353
N1332 G1 X177.051 Y200.34 E.89156
N1333 G1 X176.402 Y200.34 E.02353
N1334 G1 X159.66 Y183.598 E.85829
N1335 G1 X159.66 Y184.247 E.02353
N1336 M73 P19 R50
N1337 G1 X175.753 Y200.34 E.82502
N1338 G1 X175.104 Y200.34 E.02353
N1339 G1 X159.66 Y184.896 E.79175
N1340 G1 X159.66 Y185.545 E.02353
N1341 G1 X174.455 Y200.34 E.75848
N1342 G1 X173.806 Y200.34 E.02353
N1343 G1 X159.66 Y186.194 E.72521
N1344 G1 X159.66 Y186.843 E.02353
N1345 G1 X173.157 Y200.34 E.69194
N1346 G1 X172.508 Y200.34 E.02353
N1347 G1 X159.66 Y187.492 E.65867
N1348 G1 X159.66 Y188.141 E.02353
N1349 G1 X171.859 Y200.34 E.6254
N1350 G1 X171.21 Y200.34 E.02353
N1351 G1 X159.66 Y188.79 E.59213
N1352 G1 X159.66 Y189.439 E.02353
N1353 G1 X170.561 Y200.34 E.55886
N1354 G1 X169.912 Y200.34 E.02353
N1355 G1 X159.66 Y190.088 E.52559
N1356 G1 X159.66 Y190.737 E.02353
N1357 G1 X169.263 Y200.34 E.49232
N1358 G1 X168.614 Y200.34 E.02353
N1359 G1 X159.66 Y191.386 E.45905
N1360 G1 X159.66 Y192.035 E.02353
N1361 G1 X167.965 Y200.34 E.42578
N1362 G1 X167.316 Y200.34 E.02353
N1363 G1 X159.66 Y192.684 E.39251
N1364 G1 X159.66 Y193.333 E.02353
N1365 G1 X166.667 Y200.34 E.35924
N1366 G1 X166.018 Y200.34 E.02353
N1367 G1 X159.66 Y193.982 E.32597
N1368 G1 X159.66 Y194.631 E.02353
N1369 G1 X165.369 Y200.34 E.2927
N1370 G1 X164.72 Y200.34 E.02353
N1371 G1 X159.66 Y195.28 E.25943
N1372 G1 X159.66 Y195.929 E.02353
N1373 G1 X164.071 Y200.34 E.22616
N1374 G1 X163.422 Y200.34 E.02353
N1375 G1 X159.66 Y196.578 E.19289
N1376 G1 X159.66 Y197.227 E.02353
N1377 G1 X162.773 Y200.34 E.15962
N1378 G1 X162.124 Y200.34 E.02353
N1379 G1 X159.66 Y197.876 E.12635
N1380 G1 X159.66 Y198.525 E.02353
N1381 G1 X161.475 Y200.34 E.09308
N1382 G1 X160.826 Y200.34 E.02353
N1383 G1 X159.66 Y199.174 E.05981
N1384 G1 X159.66 Y199.823 E.02353
N1385 G1 X160.383 Y200.546 E.03708
N1386 ; WIPE_START
N1387 G1 X159.66 Y199.823 E-.38871
N1388 G1 X159.66 Y199.174 E-.24662
N1389 G1 X159.892 Y199.406 E-.12467
N1390 ; WIPE_END
N1391 G1 E-.04 F1800
N1392 M204 S6000
N1393 G17
N1394 G3 Z.6 I1.217 J0 P1  F60000
N1395 ; stop printing object, unique label id: 372
N1396 M625
N1397 ; object ids of layer 1 start: 372,407
N1398 M624 AwAAAAAAAAA=
N1399 ;======== H2D 20250527========
N1400 ; SKIPPABLE_START
N1401 ; SKIPTYPE: timelapse
N1402 M622.1 S1 ; for prev firware, default turned on
N1403 
N1404 M1002 judge_flag timelapse_record_flag
N1405 
N1406 M622 J1
N1407 M993 A2 B2 C2
N1408 M993 A0 B0 C0
N1409 
N1410 
N1411 
N1412 
N1413     M9711 M0 E1 X261 Y132 Z0.6 S11 C10 O0 T3000
N1414 
N1415 
N1416 
N1417 M993 A3 B3 C3
N1418 
N1419 M623
N1420 ; SKIPPABLE_END
N1421 
N1422 ; object ids of this layer1 end: 372,407
N1423 M625
N1424 G1 X195.495 Y279.064
N1425 G1 Z.2
N1426 G1 E.8 F1800
N1427 ; LAYER_HEIGHT: 0.200000
N1428 ; FEATURE: Prime tower
N1429 ; LINE_WIDTH: 0.500000
N1430 ; WIPE_TOWER_START
N1431 M204 S6000
N1432 G1  X195.995 Y279.564  
N1433 M204 S500
N1434 G3  X193.533 Y281.605   I-4.373 J-2.768 E0.1236 F3000
N1435 G3  X190.885 Y280.355   I0.012 J-3.454 E0.1149
N1436 G2  X188.182 Y279.564   I-2.709 J4.247 E0.1085
N1437 G2  X174.618 Y279.568   I-6.687 J357.435 E0.5155
N1438 G2  X170.683 Y281.445   I0.499 J6.110 E0.1694
N1439 G3  X168.371 Y281.015   I-0.854 J-1.838 E0.0953
N1440 G1  X166.995 Y279.564   E0.0760
N1441 G3  X165.064 Y277.242   I3.871 J-5.183 E0.1159
N1442 G3  X166.240 Y274.649   I2.902 J-0.247 E0.1130
N1443 G2  X166.995 Y272.245   I-3.465 J-2.409 E0.0972
N1444 G2  X166.992 Y259.212   I-321.195 J-6.431 E0.4954
N1445 G2  X165.146 Y255.634   I-6.663 J1.171 E0.1554
N1446 G3  X165.661 Y253.471   I1.721 J-0.733 E0.0905
N1447 G1 E-0.8000 F1800
N1448 M204 S6000
N1449 G1  X167.381 Y251.657   F600
N1450 G1 E0.8000 F1800
N1451 M204 S500
N1452 G3  X170.238 Y250.033   I2.765 J1.539 E0.1313 F3000
N1453 G3  X172.775 Y251.633   I-12.405 J22.473 E0.1141
N1454 G2  X174.808 Y252.064   I2.042 J-4.626 E0.0796
N1455 G2  X188.372 Y252.060   I6.687 J-357.435 E0.5155
N1456 G2  X192.307 Y250.183   I-0.499 J-6.110 E0.1694
N1457 G3  X194.619 Y250.613   I0.854 J1.838 E0.0953
N1458 G1  X195.995 Y252.064   E0.0760
N1459 G1 E0.0000
N1460 G3  X197.926 Y254.386   I-3.871 J5.182 E0.1159
N1461 G3  X196.750 Y256.979   I-2.902 J0.247 E0.1130
N1462 G2  X195.995 Y259.382   I3.464 J2.409 E0.0972
N1463 G2  X195.998 Y272.416   I321.212 J6.432 E0.4954
N1464 G2  X197.844 Y275.994   I6.663 J-1.171 E0.1554
N1465 G3  X197.504 Y277.972   I-1.658 J0.734 E0.0808
N1466 G1  X195.995 Y279.564   E0.0834
N1467 ; WIPE_TOWER_END
N1468 G1  X195.495 Y252.064  
N1469 ; LAYER_HEIGHT: 0.200000
N1470 ; FEATURE: Prime tower
N1471 ; LINE_WIDTH: 0.500000
N1472 ; WIPE_TOWER_START
N1473 M204 S500
N1474 G1  X167.495  E1.0642
N1475 G1  Y272.314  E0.2565
N1476 G1  X195.495  E1.0642
N1477 G1  Y279.064  E0.2565
N1478 M204 S6000
N1479 G1  X168.495 Y272.314  
N1480 ;--------------------
N1481 ; CP EMPTY GRID START
N1482 ; layer #2
N1483 M204 S500
N1484 G1  Y272.814  E0.0190
N1485 G1  X194.995  E1.0072
N1486 G1  Y273.337  E0.0199
N1487 G1  X167.995  E1.0262
N1488 G1  Y273.859  E0.0199
N1489 G1  X194.995  E1.0262
N1490 G1  Y274.382  E0.0199
N1491 G1  X167.995  E1.0262
N1492 G1  Y274.905  E0.0199
N1493 G1  X194.995  E1.0262
N1494 G1  Y275.428  E0.0199
N1495 G1  X167.995  E1.0262
N1496 G1  Y275.950  E0.0199
N1497 G1  X194.995  E1.0262
N1498 G1  Y276.473  E0.0199
N1499 G1  X167.995  E1.0262
N1500 G1  Y276.996  E0.0199
N1501 G1  X194.995  E1.0262
N1502 G1  Y277.519  E0.0199
N1503 G1  X167.995  E1.0262
N1504 G1  Y278.041  E0.0199
N1505 G1  X194.995  E1.0262
N1506 G1  Y278.564  E0.0199
N1507 G1  X167.995  E1.0262
N1508 G1  Y279.064  E0.0190
N1509 ; CP EMPTY GRID END
N1510 ;------------------
N1511 
N1512 
N1513 
N1514 
N1515 
N1516 
N1517 ; WIPE_TOWER_END
N1518 ; LAYER_HEIGHT: 0.200000
N1519 ; FEATURE: Prime tower
N1520 ; LINE_WIDTH: 0.500000
N1521 ;--------------------
N1522 ; CP TOOLCHANGE START
N1523 ; toolchange #1
N1524 ; material : TPU -> TPU
N1525 ;--------------------
N1526 M220 B
N1527 M220 S100
N1528 ; WIPE_TOWER_START
N1529 G1 E-.8 F1800
N1530 G17
N1531 G3 Z.6 I1.217 J0 P1  F60000
N1532 G1 X167.745 Y266.314 Z.2
N1533 G1 E.8 F1800
N1534 ; LAYER_HEIGHT: 0.200000
N1535 ; FEATURE: Prime tower
N1536 ; LINE_WIDTH: 1.000000
N1537 ; NOZZLE_CHANGE_START OF0 NF1
N1538 M204 S500
N1539 G1  X195.245 Y266.314  E2.1885 F1881
N1540 G1  Y267.314  E0.0796
N1541 G1  X167.745  E2.1885
N1542 G1  Y268.314  E0.0796
N1543 G1  X195.245  E2.1885
N1544 G1  Y269.314  E0.0796
N1545 G1  X167.745  E2.1885
N1546 G1  Y270.314  E0.0796
N1547 G1  X195.245  E2.1885
N1548 G1  Y271.314  E0.0796
N1549 G1  X167.745  E2.1885
N1550 ; NOZZLE_CHANGE_END OF0 NF1
N1551 M104 T1 S85 N0 ;Multi extruder pre cooling
N1552 
N1553 ; WIPE_START
N1554 G1 F5400
N1555 M204 S500
N1556 G1 X169.745 Y271.314 E-1.9
N1557 ; WIPE_END
N1558 G1 E-.1 F1800
N1559 M204 S6000
N1560 G17
N1561 G3 Z.6 I1.217 J0 P1  F5400
N1562 ; filament end gcode 
N1563 
N1564 ;======== H2D ========
N1565 ;===== 20250604 =====
N1566 M993 A2 B2 C2 ; nozzle cam detection allow status save.
N1567 M993 A0 B0 C0 ; nozzle cam detection not allowed.
N1568 
N1569 
N1570 M1015.4 S0 ; disable E air printing detect
N1571 
N1572 
N1573 M620 S1A
N1574 M1002 gcode_claim_action : 4
N1575 M204 S9000
N1576 
N1577 G1 Z3.2 F1200
N1578 
N1579 M400
N1580 M106 P1 S0
N1581 M106 P2 S0
N1582 
N1583 
N1584 
N1585 
N1586 M620.10 A0 F149.669 L0 H0.4 T270 P255 S1
N1587 
N1588 
N1589 
N1590 M620.10 A1 F79.8237 L0 H0.4 T250 P240 S1
N1591 
N1592 
N1593 
N1594 M620.11 P0 I0 E0
N1595 
N1596 
N1597 
N1598 M620.11 K1 I0 R10 F200
N1599 
N1600 
N1601 M628 S1
N1602 
N1603 
N1604 M620.11 S1 L0 I0 R10 D8 E-10 F200
N1605 
N1606 
N1607 M629
N1608 
N1609 
N1610 M620.11 H2 C331
N1611 
N1612 
N1613 T1
N1614 M73 E5
N1615 
N1616 ;deretract
N1617 
N1618 
N1619 
N1620 ; VFLUSH_START
N1621 
N1622 
N1623 ;VG1 E0 F79
N1624 
N1625 
N1626 SYNC T0
N1627 
N1628 ; VFLUSH_END
N1629 
N1630 M1002 set_filament_type:TPU
N1631 
N1632 M400
N1633 M83
N1634 
N1635 
N1636 
N1637 M628 S0
N1638 ;VM109 S240
N1639 M629
N1640 M400
N1641 
N1642 M983.3 F1.33333 A0.4
N1643 
N1644 
N1645 M400
N1646 
N1647 G1 Y320 F30000
N1648 G1 X201
N1649 
N1650 M73 P20 R49
N1651 G1 Y295
N1652 G1 Y265 F18000
N1653 G1 Z3.2 F3000
N1654 
N1655 M204 S500
N1656 
N1657 
N1658 M621 S1A
N1659 
N1660 M993 A3 B3 C3 ; nozzle cam detection allow status restore.
N1661 
N1662 
N1663 M1015.3 S1;enable tpu clog detect
N1664 
N1665 
N1666 
N1667 M1015.4 S0 ; disable E air printing detect
N1668 
N1669 
N1670 M620.6 I1 W1 ;enable ams air printing detect
N1671 M1002 gcode_claim_action : 0
N1672 M106 S0
N1673 M106 P2 S0
N1674 G1 X200 Y264.673 F60000
N1675 G1 Z.2
N1676 G1 X200 Y257.04 Z.6
N1677 G1 X200 Y247.99 Z.6
N1678 G1 X162.991 Y247.99
N1679 G1 X162.991 Y252.564
N1680 G1 X167.495 Y252.564
N1681 
N1682 ; filament start gcode
N1683 G1 Z.2
N1684 
N1685 G4 S0
N1686 ; CP TOOLCHANGE WIPE
N1687 ; LINE_WIDTH: 0.500000
N1688 ; LINE_WIDTH: 0.575000
N1689 M204 S500
N1690 G1  X170.495 Y252.564  E0.1311 F990
N1691 G1 E-0.8000 F1800
N1692 M204 S6000
N1693 G1  X165.995  F600
N1694 G1  X167.495  F240
N1695 G1  X167.995  F600
N1696 G1  Y253.064 
N1697 G1  X166.995 
N1698 G1  Y252.064 
N1699 G1  X168.495 
N1700 G1  Y253.564 
N1701 G1  X166.495 
N1702 G1  Y251.564 
N1703 G1  X170.495 Y252.564   F990
N1704 G1 E0.8000 F1800
N1705 M204 S500
N1706 G1  X195.495  E1.0927 F990
N1707 G1  Y253.064  E0.0219
N1708 G1  X167.495  E1.2238 F1125
N1709 G1  Y253.564  E0.0219
N1710 G1  X195.495  E1.2238 F1374
N1711 G1  Y254.064  E0.0219
N1712 G1  X167.495  E1.2238 F1826
N1713 G1  Y254.564  E0.0219
N1714 G1  X195.495  E1.2238
N1715 G1  Y255.064  E0.0219
N1716 M73 P21 R49
N1717 G1  X167.495  E1.2238
N1718 G1  Y255.564  E0.0219
N1719 G1  X195.495  E1.2238
N1720 G1  Y256.064  E0.0219
N1721 G1  X167.495  E1.2238
N1722 G1  Y256.564  E0.0219
N1723 G1  X195.495  E1.2238
N1724 G1  Y257.064  E0.0219
N1725 G1  X167.495  E1.2238
N1726 G1  Y257.564  E0.0219
N1727 G1  X195.495  E1.2238
N1728 G1  Y258.064  E0.0219
N1729 G1  X167.495  E1.2238
N1730 G1  Y258.564  E0.0219
N1731 G1  X195.495  E1.2238
N1732 G1  Y259.064  E0.0219
N1733 G1  X167.495  E1.2238
N1734 G1  Y259.564  E0.0219
N1735 G1  X195.495  E1.2238
N1736 G1  Y260.064  E0.0219
N1737 G1  X167.495  E1.2238
N1738 G1  Y260.564  E0.0219
N1739 G1  X195.495  E1.2238
N1740 G1  Y261.064  E0.0219
N1741 G1  X167.495  E1.2238
N1742 G1  Y261.564  E0.0219
N1743 G1  X195.495  E1.2238
N1744 G1  Y262.064  E0.0219
N1745 G1  X167.495  E1.2238
N1746 G1  Y262.564  E0.0219
N1747 G1  X195.495  E1.2238
N1748 G1  Y263.064  E0.0219
N1749 G1  X167.495  E1.2238
N1750 G1  Y263.564  E0.0219
N1751 G1  X195.495  E1.2238
N1752 G1  Y264.064  E0.0219
N1753 G1  X167.495  E1.2238
N1754 G1  Y264.564  E0.0219
N1755 G1  X195.495  E1.2238
N1756 G1  Y265.064  E0.0219
N1757 G1  X167.495  E1.2238
N1758 G1  Y265.564  E0.0219
N1759 G1  X195.495  E1.2238
N1760 ; LINE_WIDTH: 0.500000
N1761 ; WIPE_TOWER_END
N1762 M220 R
N1763 G1 F60000
N1764 G4 S0
N1765 G92 E0
N1766 ; CP TOOLCHANGE END
N1767 ;------------------
N1768 
N1769 
N1770 
N1771 ; WIPE_START
N1772 G1 F5400
N1773 M204 S500
N1774 G1 X193.495 Y265.564 E-.76
N1775 ; WIPE_END
N1776 G1 E-.04 F1800
N1777 M204 S6000
N1778 G17
N1779 G3 Z.6 I1.217 J0 P1  F60000
N1780 ; OBJECT_ID: 407
N1781 ; start printing object, unique label id: 407
N1782 M624 AgAAAAAAAAA=
N1783 G1 X192.835 Y103.631 Z.2
N1784 G1 E.8 F1800
N1785 ; FEATURE: Outer wall
N1786 ; LINE_WIDTH: 0.5
N1787 ; LAYER_HEIGHT: 0.2
N1788 G1 F2100.29
N1789 M204 S500
N1790 G1 X158.335 Y103.631 E1.31122
N1791 G1 X158.335 Y103.131 E.019
N1792 G1 X192.835 Y103.131 E1.31122
N1793 G1 X192.835 Y103.571 E.01672
N1794 ; CHANGE_LAYER
N1795 ; Z_HEIGHT: 0.4
N1796 ; LAYER_HEIGHT: 0.2
N1797 ; WIPE_START
N1798 G1 F2100.29
N1799 G1 X190.835 Y103.575 E-.76
N1800 ; WIPE_END
N1801 G1 E-.04 F1800
N1802 ; stop printing object, unique label id: 407
N1803 M625
N1804 ;======== H2D 20250521========
N1805 ; layer num/total_layer_count: 2/75
N1806 ; update layer progress
N1807 M73 L2
N1808 M991 S0 P1 ;notify layer change
N1809 
N1810 
N1811 M106 S255
N1812 M106 P2 S255
N1813 ; open powerlost recovery
N1814 M1003 S1
N1815 ; OBJECT_ID: 407
N1816 ; start printing object, unique label id: 407
N1817 M624 AgAAAAAAAAA=
N1818 M204 S10000
N1819 G17
N1820 G3 Z.6 I-.058 J1.216 P1  F60000
N1821 G1 X192.875 Y103.671 Z.6
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=0.300G1 Z0.300 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N965 G1 X157.16 Y100.605 E.0501
N966 G1 X158.085 Y100.424 E.03401
N967 G1 X193.085 Y100.424 E1.26371
N968 G1 X194.416 Y100.816 E.0501
N969 G1 X195.322 Y101.867 E.0501
N970 G1 X195.54 Y102.799 E.03458
N971 G1 X200.455 Y249.908 E5.31446
N972 G1 X200.457 Y281.638 E1.14567
N973 G1 X200.065 Y282.97 E.0501
N974 G1 X199.014 Y283.876 E.0501
N975 G1 X198 Y284.095 E.03748
N976 G1 X164.991 Y284.095 E1.19182
N977 G1 X163.659 Y283.704 E.0501
N978 G1 X162.753 Y282.653 E.0501
N979 G1 X162.545 Y281.87 E.02926
N980 G1 X155.054 Y202.732 E2.87014
N981 G1 X155.043 Y117.5 E3.07737
N982 G1 X155.63 Y102.783 E.53179
N983 G1 X156.055 Y101.526 E.04794
N986 G1 X157.16 Y100.605 E-.54662
N987 G1 X157.711 Y100.497 E-.21338
N1000 G1 X159.271 Y200.729 E1.13581
N1001 G1 X159.271 Y119.271 E2.94111
N1002 G1 X190.729 Y119.271 E1.13581
N1003 G1 X190.729 Y200.669 E2.93894
N1008 G1 X158.814 Y201.186 E1.16881
N1010 G1 X158.814 Y118.814 E2.97411
N1011 G1 X191.186 Y118.814 E1.16881
N1012 G1 X191.186 Y201.126 E2.97195
N1017 G1 X158.357 Y201.643 E1.20182
N1018 G1 X158.357 Y118.357 E3.00712
N1019 G1 X191.643 Y118.357 E1.20182
N1020 G1 X191.643 Y201.583 E3.00495
N1026 G1 X157.9 Y202.1 E1.23483
N1027 G1 X157.9 Y117.9 E3.04013
N1028 G1 X192.1 Y117.9 E1.23483
N1029 G1 X192.1 Y202.04 E3.03796
N1040 G1 X190.34 Y120.176 E.03702
N1041 G1 X190.34 Y120.825 E.02353
N1042 G1 X189.175 Y119.66 E.05975
N1043 G1 X188.526 Y119.66 E.02353
N1044 G1 X190.34 Y121.474 E.09302
N1045 G1 X190.34 Y122.123 E.02353
N1046 G1 X187.877 Y119.66 E.12629
N1047 G1 X187.228 Y119.66 E.02353
N1048 G1 X190.34 Y122.772 E.15956
N1049 G1 X190.34 Y123.421 E.02353
N1050 G1 X186.579 Y119.66 E.19283
N1051 G1 X185.93 Y119.66 E.02353
N1052 G1 X190.34 Y124.07 E.2261
N1053 G1 X190.34 Y124.719 E.02353
N1054 G1 X185.281 Y119.66 E.25937
N1055 G1 X184.632 Y119.66 E.02353
N1056 G1 X190.34 Y125.368 E.29264
N1057 G1 X190.34 Y126.017 E.02353
N1058 G1 X183.983 Y119.66 E.32591
N1059 G1 X183.334 Y119.66 E.02353
N1060 G1 X190.34 Y126.666 E.35918
N1061 G1 X190.34 Y127.315 E.02353
N1062 G1 X182.685 Y119.66 E.39245
N1063 G1 X182.036 Y119.66 E.02353
N1064 G1 X190.34 Y127.964 E.42572
N1065 G1 X190.34 Y128.613 E.02353
N1066 G1 X181.387 Y119.66 E.45899
N1067 G1 X180.738 Y119.66 E.02353
N1068 G1 X190.34 Y129.262 E.49226
N1069 G1 X190.34 Y129.911 E.02353
N1070 G1 X180.089 Y119.66 E.52553
N1071 G1 X179.44 Y119.66 E.02353
N1072 G1 X190.34 Y130.56 E.5588
N1073 G1 X190.34 Y131.209 E.02353
N1074 G1 X178.791 Y119.66 E.59207
N1075 G1 X178.142 Y119.66 E.02353
N1076 G1 X190.34 Y131.858 E.62534
N1077 G1 X190.34 Y132.507 E.02353
N1078 G1 X177.493 Y119.66 E.65861
N1079 G1 X176.844 Y119.66 E.02353
N1080 G1 X190.34 Y133.156 E.69188
N1081 G1 X190.34 Y133.805 E.02353
N1082 G1 X176.195 Y119.66 E.72515
N1083 G1 X175.546 Y119.66 E.02353
N1084 G1 X190.34 Y134.454 E.75842
N1085 G1 X190.34 Y135.103 E.02353
N1086 G1 X174.897 Y119.66 E.79169
N1087 G1 X174.248 Y119.66 E.02353
N1088 G1 X190.34 Y135.752 E.82496
N1089 G1 X190.34 Y136.401 E.02353
N1090 G1 X173.599 Y119.66 E.85823
N1091 G1 X172.95 Y119.66 E.02353
N1092 G1 X190.34 Y137.05 E.8915
N1093 G1 X190.34 Y137.699 E.02353
N1094 G1 X172.301 Y119.66 E.92477
N1095 G1 X171.652 Y119.66 E.02353
N1096 G1 X190.34 Y138.348 E.95804
N1097 G1 X190.34 Y138.997 E.02353
N1098 G1 X171.003 Y119.66 E.99131
N1099 G1 X170.354 Y119.66 E.02353
N1100 G1 X190.34 Y139.646 E1.02458
N1101 G1 X190.34 Y140.295 E.02353
N1102 G1 X169.705 Y119.66 E1.05785
N1103 G1 X169.056 Y119.66 E.02353
N1104 G1 X190.34 Y140.944 E1.09112
N1105 G1 X190.34 Y141.593 E.02353
N1106 G1 X168.407 Y119.66 E1.12439
N1107 G1 X167.758 Y119.66 E.02353
N1108 G1 X190.34 Y142.242 E1.15766
N1109 G1 X190.34 Y142.891 E.02353
N1110 G1 X167.109 Y119.66 E1.19093
N1111 G1 X166.46 Y119.66 E.02353
N1112 G1 X190.34 Y143.54 E1.2242
N1113 G1 X190.34 Y144.189 E.02353
N1114 G1 X165.811 Y119.66 E1.25747
N1115 G1 X165.162 Y119.66 E.02353
N1116 G1 X190.34 Y144.838 E1.29074
N1117 G1 X190.34 Y145.487 E.02353
N1118 G1 X164.513 Y119.66 E1.32401
N1119 G1 X163.865 Y119.66 E.02353
N1120 G1 X190.34 Y146.135 E1.35728
N1121 G1 X190.34 Y146.784 E.02353
N1122 G1 X163.216 Y119.66 E1.39055
N1123 G1 X162.567 Y119.66 E.02353
N1124 G1 X190.34 Y147.433 E1.42382
N1125 G1 X190.34 Y148.082 E.02353
N1126 G1 X161.918 Y119.66 E1.45709
N1127 G1 X161.269 Y119.66 E.02353
N1128 G1 X190.34 Y148.731 E1.49036
N1129 G1 X190.34 Y149.38 E.02353
N1130 G1 X160.62 Y119.66 E1.52363
N1131 G1 X159.971 Y119.66 E.02353
N1132 G1 X190.34 Y150.029 E1.5569
N1133 G1 X190.34 Y150.678 E.02353
N1134 G1 X159.66 Y119.998 E1.57284
N1135 G1 X159.66 Y120.647 E.02353
N1137 G1 X190.34 Y151.327 E1.57284
N1138 G1 X190.34 Y151.976 E.02353
N1139 G1 X159.66 Y121.296 E1.57284
N1140 G1 X159.66 Y121.945 E.02353
N1141 G1 X190.34 Y152.625 E1.57284
N1142 G1 X190.34 Y153.274 E.02353
N1143 G1 X159.66 Y122.594 E1.57284
N1144 G1 X159.66 Y123.243 E.02353
N1145 G1 X190.34 Y153.923 E1.57284
N1146 G1 X190.34 Y154.572 E.02353
N1147 G1 X159.66 Y123.892 E1.57284
N1148 G1 X159.66 Y124.541 E.02353
N1149 G1 X190.34 Y155.221 E1.57284
N1150 G1 X190.34 Y155.87 E.02353
N1151 G1 X159.66 Y125.19 E1.57284
N1152 G1 X159.66 Y125.839 E.02353
N1153 G1 X190.34 Y156.519 E1.57284
N1154 G1 X190.34 Y157.168 E.02353
N1155 G1 X159.66 Y126.488 E1.57284
N1156 G1 X159.66 Y127.137 E.02353
N1157 G1 X190.34 Y157.817 E1.57284
N1158 G1 X190.34 Y158.466 E.02353
N1159 G1 X159.66 Y127.786 E1.57284
N1160 G1 X159.66 Y128.435 E.02353
N1161 G1 X190.34 Y159.115 E1.57284
N1162 G1 X190.34 Y159.764 E.02353
N1163 G1 X159.66 Y129.084 E1.57284
N1164 G1 X159.66 Y129.733 E.02353
N1165 G1 X190.34 Y160.413 E1.57284
N1166 G1 X190.34 Y161.062 E.02353
N1167 G1 X159.66 Y130.382 E1.57284
N1168 G1 X159.66 Y131.03 E.02353
N1169 G1 X190.34 Y161.711 E1.57284
N1170 G1 X190.34 Y162.36 E.02353
N1171 G1 X159.66 Y131.679 E1.57284
N1172 G1 X159.66 Y132.328 E.02353
N1173 G1 X190.34 Y163.009 E1.57284
N1174 G1 X190.34 Y163.658 E.02353
N1175 G1 X159.66 Y132.977 E1.57284
N1176 G1 X159.66 Y133.626 E.02353
N1177 G1 X190.34 Y164.307 E1.57284
N1178 G1 X190.34 Y164.956 E.02353
N1179 G1 X159.66 Y134.275 E1.57284
N1180 G1 X159.66 Y134.924 E.02353
N1181 G1 X190.34 Y165.605 E1.57284
N1182 G1 X190.34 Y166.254 E.02353
N1183 G1 X159.66 Y135.573 E1.57284
N1184 G1 X159.66 Y136.222 E.02353
N1185 G1 X190.34 Y166.903 E1.57284
N1186 G1 X190.34 Y167.552 E.02353
N1187 G1 X159.66 Y136.871 E1.57284
N1188 G1 X159.66 Y137.52 E.02353
N1189 G1 X190.34 Y168.201 E1.57284
N1190 G1 X190.34 Y168.85 E.02353
N1191 G1 X159.66 Y138.169 E1.57284
N1192 G1 X159.66 Y138.818 E.02353
N1193 G1 X190.34 Y169.499 E1.57284
N1194 G1 X190.34 Y170.148 E.02353
N1195 G1 X159.66 Y139.467 E1.57284
N1196 G1 X159.66 Y140.116 E.02353
N1197 G1 X190.34 Y170.797 E1.57284
N1198 G1 X190.34 Y171.446 E.02353
N1199 G1 X159.66 Y140.765 E1.57284
N1200 G1 X159.66 Y141.414 E.02353
N1201 G1 X190.34 Y172.095 E1.57284
N1202 G1 X190.34 Y172.744 E.02353
N1203 G1 X159.66 Y142.063 E1.57284
N1204 G1 X159.66 Y142.712 E.02353
N1205 G1 X190.34 Y173.393 E1.57284
N1206 G1 X190.34 Y174.042 E.02353
N1207 G1 X159.66 Y143.361 E1.57284
N1208 G1 X159.66 Y144.01 E.02353
N1209 G1 X190.34 Y174.691 E1.57284
N1210 G1 X190.34 Y175.34 E.02353
N1211 G1 X159.66 Y144.659 E1.57284
N1212 G1 X159.66 Y145.308 E.02353
N1213 G1 X190.34 Y175.989 E1.57284
N1214 G1 X190.34 Y176.638 E.02353
N1215 G1 X159.66 Y145.957 E1.57284
N1216 G1 X159.66 Y146.606 E.02353
N1217 G1 X190.34 Y177.287 E1.57284
N1218 G1 X190.34 Y177.936 E.02353
N1219 G1 X159.66 Y147.255 E1.57284
N1220 G1 X159.66 Y147.904 E.02353
N1221 G1 X190.34 Y178.585 E1.57284
N1222 G1 X190.34 Y179.234 E.02353
N1223 G1 X159.66 Y148.553 E1.57284
N1224 G1 X159.66 Y149.202 E.02353
N1225 G1 X190.34 Y179.883 E1.57284
N1226 G1 X190.34 Y180.532 E.02353
N1227 G1 X159.66 Y149.851 E1.57284
N1228 G1 X159.66 Y150.5 E.02353
N1230 G1 X190.34 Y181.181 E1.57284
N1231 G1 X190.34 Y181.83 E.02353
N1233 G1 X159.66 Y151.149 E1.57284
N1234 G1 X159.66 Y151.798 E.02353
N1235 G1 X190.34 Y182.479 E1.57284
N1236 G1 X190.34 Y183.127 E.02353
N1237 G1 X159.66 Y152.447 E1.57284
N1238 G1 X159.66 Y153.096 E.02353
N1239 G1 X190.34 Y183.776 E1.57284
N1240 G1 X190.34 Y184.425 E.02353
N1241 G1 X159.66 Y153.745 E1.57284
N1242 G1 X159.66 Y154.394 E.02353
N1243 G1 X190.34 Y185.074 E1.57284
N1244 G1 X190.34 Y185.723 E.02353
N1245 G1 X159.66 Y155.043 E1.57284
N1246 G1 X159.66 Y155.692 E.02353
N1247 G1 X190.34 Y186.372 E1.57284
N1248 G1 X190.34 Y187.021 E.02353
N1249 G1 X159.66 Y156.341 E1.57284
N1250 G1 X159.66 Y156.99 E.02353
N1251 G1 X190.34 Y187.67 E1.57284
N1252 G1 X190.34 Y188.319 E.02353
N1253 G1 X159.66 Y157.639 E1.57284
N1254 G1 X159.66 Y158.288 E.02353
N1255 G1 X190.34 Y188.968 E1.57284
N1256 G1 X190.34 Y189.617 E.02353
N1257 G1 X159.66 Y158.937 E1.57284
N1258 G1 X159.66 Y159.586 E.02353
N1259 G1 X190.34 Y190.266 E1.57284
N1260 G1 X190.34 Y190.915 E.02353
N1261 G1 X159.66 Y160.235 E1.57284
N1262 G1 X159.66 Y160.884 E.02353
N1263 G1 X190.34 Y191.564 E1.57284
N1264 G1 X190.34 Y192.213 E.02353
N1265 G1 X159.66 Y161.533 E1.57284
N1266 G1 X159.66 Y162.182 E.02353
N1267 G1 X190.34 Y192.862 E1.57284
N1268 G1 X190.34 Y193.511 E.02353
N1269 G1 X159.66 Y162.831 E1.57284
N1270 G1 X159.66 Y163.48 E.02353
N1271 G1 X190.34 Y194.16 E1.57284
N1272 G1 X190.34 Y194.809 E.02353
N1273 G1 X159.66 Y164.129 E1.57284
N1274 G1 X159.66 Y164.778 E.02353
N1275 G1 X190.34 Y195.458 E1.57284
N1276 G1 X190.34 Y196.107 E.02353
N1277 G1 X159.66 Y165.427 E1.57284
N1278 G1 X159.66 Y166.076 E.02353
N1279 G1 X190.34 Y196.756 E1.57284
N1280 G1 X190.34 Y197.405 E.02353
N1281 G1 X159.66 Y166.725 E1.57284
N1282 G1 X159.66 Y167.374 E.02353
N1283 G1 X190.34 Y198.054 E1.57284
N1284 G1 X190.34 Y198.703 E.02353
N1285 G1 X159.66 Y168.023 E1.57284
N1286 G1 X159.66 Y168.671 E.02353
N1287 G1 X190.34 Y199.352 E1.57284
N1288 G1 X190.34 Y200.001 E.02353
N1290 G1 X159.66 Y169.32 E1.57284
N1291 G1 X159.66 Y169.969 E.02353
N1292 G1 X190.031 Y200.34 E1.55696
N1293 G1 X189.382 Y200.34 E.02353
N1294 G1 X159.66 Y170.618 E1.52369
N1295 G1 X159.66 Y171.267 E.02353
N1296 G1 X188.733 Y200.34 E1.49042
N1297 G1 X188.084 Y200.34 E.02353
N1298 G1 X159.66 Y171.916 E1.45715
N1299 G1 X159.66 Y172.565 E.02353
N1300 G1 X187.435 Y200.34 E1.42388
N1301 G1 X186.786 Y200.34 E.02353
N1302 G1 X159.66 Y173.214 E1.39061
N1303 G1 X159.66 Y173.863 E.02353
N1304 G1 X186.137 Y200.34 E1.35734
N1305 G1 X185.488 Y200.34 E.02353
N1306 G1 X159.66 Y174.512 E1.32407
N1307 G1 X159.66 Y175.161 E.02353
N1308 G1 X184.839 Y200.34 E1.2908
N1309 G1 X184.19 Y200.34 E.02353
N1310 G1 X159.66 Y175.81 E1.25753
N1311 G1 X159.66 Y176.459 E.02353
N1312 G1 X183.541 Y200.34 E1.22426
N1313 G1 X182.892 Y200.34 E.02353
N1314 G1 X159.66 Y177.108 E1.19099
N1315 G1 X159.66 Y177.757 E.02353
N1316 G1 X182.243 Y200.34 E1.15772
N1317 G1 X181.594 Y200.34 E.02353
N1318 G1 X159.66 Y178.406 E1.12445
N1319 G1 X159.66 Y179.055 E.02353
N1320 G1 X180.945 Y200.34 E1.09118
N1321 G1 X180.296 Y200.34 E.02353
N1322 G1 X159.66 Y179.704 E1.05791
N1323 G1 X159.66 Y180.353 E.02353
N1324 G1 X179.647 Y200.34 E1.02464
N1325 G1 X178.998 Y200.34 E.02353
N1326 G1 X159.66 Y181.002 E.99137
N1327 G1 X159.66 Y181.651 E.02353
N1328 G1 X178.349 Y200.34 E.9581
N1329 G1 X177.7 Y200.34 E.02353
N1330 G1 X159.66 Y182.3 E.92483
N1331 G1 X159.66 Y182.949 E.02353
N1332 G1 X177.051 Y200.34 E.89156
N1333 G1 X176.402 Y200.34 E.02353
N1334 G1 X159.66 Y183.598 E.85829
N1335 G1 X159.66 Y184.247 E.02353
N1337 G1 X175.753 Y200.34 E.82502
N1338 G1 X175.104 Y200.34 E.02353
N1339 G1 X159.66 Y184.896 E.79175
N1340 G1 X159.66 Y185.545 E.02353
N1341 G1 X174.455 Y200.34 E.75848
N1342 G1 X173.806 Y200.34 E.02353
N1343 G1 X159.66 Y186.194 E.72521
N1344 G1 X159.66 Y186.843 E.02353
N1345 G1 X173.157 Y200.34 E.69194
N1346 G1 X172.508 Y200.34 E.02353
N1347 G1 X159.66 Y187.492 E.65867
N1348 G1 X159.66 Y188.141 E.02353
N1349 G1 X171.859 Y200.34 E.6254
N1350 G1 X171.21 Y200.34 E.02353
N1351 G1 X159.66 Y188.79 E.59213
N1352 G1 X159.66 Y189.439 E.02353
N1353 G1 X170.561 Y200.34 E.55886
N1354 G1 X169.912 Y200.34 E.02353
N1355 G1 X159.66 Y190.088 E.52559
N1356 G1 X159.66 Y190.737 E.02353
N1357 G1 X169.263 Y200.34 E.49232
N1358 G1 X168.614 Y200.34 E.02353
N1359 G1 X159.66 Y191.386 E.45905
N1360 G1 X159.66 Y192.035 E.02353
N1361 G1 X167.965 Y200.34 E.42578
N1362 G1 X167.316 Y200.34 E.02353
N1363 G1 X159.66 Y192.684 E.39251
N1364 G1 X159.66 Y193.333 E.02353
N1365 G1 X166.667 Y200.34 E.35924
N1366 G1 X166.018 Y200.34 E.02353
N1367 G1 X159.66 Y193.982 E.32597
N1368 G1 X159.66 Y194.631 E.02353
N1369 G1 X165.369 Y200.34 E.2927
N1370 G1 X164.72 Y200.34 E.02353
N1371 G1 X159.66 Y195.28 E.25943
N1372 G1 X159.66 Y195.929 E.02353
N1373 G1 X164.071 Y200.34 E.22616
N1374 G1 X163.422 Y200.34 E.02353
N1375 G1 X159.66 Y196.578 E.19289
N1376 G1 X159.66 Y197.227 E.02353
N1377 G1 X162.773 Y200.34 E.15962
N1378 G1 X162.124 Y200.34 E.02353
N1379 G1 X159.66 Y197.876 E.12635
N1380 G1 X159.66 Y198.525 E.02353
N1381 G1 X161.475 Y200.34 E.09308
N1382 G1 X160.826 Y200.34 E.02353
N1383 G1 X159.66 Y199.174 E.05981
N1384 G1 X159.66 Y199.823 E.02353
N1385 G1 X160.383 Y200.546 E.03708
N1387 G1 X159.66 Y199.823 E-.38871
N1388 G1 X159.66 Y199.174 E-.24662
N1389 G1 X159.892 Y199.406 E-.12467
N1440 G1  X166.995 Y279.564   E0.0760
N1458 G1  X195.995 Y252.064   E0.0760
N1466 G1  X195.995 Y279.564   E0.0834
N1474 G1  X167.495  E1.0642
N1475 G1  Y272.314  E0.2565
N1476 G1  X195.495  E1.0642
N1477 G1  Y279.064  E0.2565
N1484 G1  Y272.814  E0.0190
N1485 G1  X194.995  E1.0072
N1486 G1  Y273.337  E0.0199
N1487 G1  X167.995  E1.0262
N1488 G1  Y273.859  E0.0199
N1489 G1  X194.995  E1.0262
N1490 G1  Y274.382  E0.0199
N1491 G1  X167.995  E1.0262
N1492 G1  Y274.905  E0.0199
N1493 G1  X194.995  E1.0262
N1494 G1  Y275.428  E0.0199
N1495 G1  X167.995  E1.0262
N1496 G1  Y275.950  E0.0199
N1497 G1  X194.995  E1.0262
N1498 G1  Y276.473  E0.0199
N1499 G1  X167.995  E1.0262
N1500 G1  Y276.996  E0.0199
N1501 G1  X194.995  E1.0262
N1502 G1  Y277.519  E0.0199
N1503 G1  X167.995  E1.0262
N1504 G1  Y278.041  E0.0199
N1505 G1  X194.995  E1.0262
N1506 G1  Y278.564  E0.0199
N1507 G1  X167.995  E1.0262
N1508 G1  Y279.064  E0.0190
N1539 G1  X195.245 Y266.314  E2.1885 F1881
N1540 G1  Y267.314  E0.0796
N1541 G1  X167.745  E2.1885
N1542 G1  Y268.314  E0.0796
N1543 G1  X195.245  E2.1885
N1544 G1  Y269.314  E0.0796
N1545 G1  X167.745  E2.1885
N1546 G1  Y270.314  E0.0796
N1547 G1  X195.245  E2.1885
N1548 G1  Y271.314  E0.0796
N1549 G1  X167.745  E2.1885
N1556 G1 X169.745 Y271.314 E-1.9
N1690 G1  X170.495 Y252.564  E0.1311 F990
N1706 G1  X195.495  E1.0927 F990
N1707 G1  Y253.064  E0.0219
N1708 G1  X167.495  E1.2238 F1125
N1709 G1  Y253.564  E0.0219
N1710 G1  X195.495  E1.2238 F1374
N1711 G1  Y254.064  E0.0219
N1712 G1  X167.495  E1.2238 F1826
N1713 G1  Y254.564  E0.0219
N1714 G1  X195.495  E1.2238
N1715 G1  Y255.064  E0.0219
N1717 G1  X167.495  E1.2238
N1718 G1  Y255.564  E0.0219
N1719 G1  X195.495  E1.2238
N1720 G1  Y256.064  E0.0219
N1721 G1  X167.495  E1.2238
N1722 G1  Y256.564  E0.0219
N1723 G1  X195.495  E1.2238
N1724 G1  Y257.064  E0.0219
N1725 G1  X167.495  E1.2238
N1726 G1  Y257.564  E0.0219
N1727 G1  X195.495  E1.2238
N1728 G1  Y258.064  E0.0219
N1729 G1  X167.495  E1.2238
N1730 G1  Y258.564  E0.0219
N1731 G1  X195.495  E1.2238
N1732 G1  Y259.064  E0.0219
N1733 G1  X167.495  E1.2238
N1734 G1  Y259.564  E0.0219
N1735 G1  X195.495  E1.2238
N1736 G1  Y260.064  E0.0219
N1737 G1  X167.495  E1.2238
N1738 G1  Y260.564  E0.0219
N1739 G1  X195.495  E1.2238
N1740 G1  Y261.064  E0.0219
N1741 G1  X167.495  E1.2238
N1742 G1  Y261.564  E0.0219
N1743 G1  X195.495  E1.2238
N1744 G1  Y262.064  E0.0219
N1745 G1  X167.495  E1.2238
N1746 G1  Y262.564  E0.0219
N1747 G1  X195.495  E1.2238
N1748 G1  Y263.064  E0.0219
N1749 G1  X167.495  E1.2238
N1750 G1  Y263.564  E0.0219
N1751 G1  X195.495  E1.2238
N1752 G1  Y264.064  E0.0219
N1753 G1  X167.495  E1.2238
N1754 G1  Y264.564  E0.0219
N1755 G1  X195.495  E1.2238
N1756 G1  Y265.064  E0.0219
N1757 G1  X167.495  E1.2238
N1758 G1  Y265.564  E0.0219
N1759 G1  X195.495  E1.2238
N1774 G1 X193.495 Y265.564 E-.76
N1790 G1 X158.335 Y103.631 E1.31122
N1791 G1 X158.335 Y103.131 E.019
N1792 G1 X192.835 Y103.131 E1.31122
N1793 G1 X192.835 Y103.571 E.01672
N1799 G1 X190.835 Y103.575 E-.76
T0 ;TOOL_CHANGE:0 ; Revert to base toolN1822 G1 Z.4
N1823 G1 E.8 F1800
N1824 ; FEATURE: Outer wall
N1825 ; LINE_WIDTH: 0.42
N1826 ; LAYER_HEIGHT: 0.2
N1827 G1 F2545.881
N1828 M204 S5000
N1829 G1 X158.295 Y103.671 E1.08423
N1830 G1 X158.295 Y103.091 E.01819
N1831 G1 X192.875 Y103.091 E1.08423
N1832 G1 X192.875 Y103.611 E.0163
N1833 M204 S10000
N1834 G1 X192.679 Y103.381 F60000
N1835 ; FEATURE: Gap infill
N1836 ; LINE_WIDTH: 0.23088
N1837 G1 F5107.47
N1838 M204 S8000
N1839 G1 X158.491 Y103.381 E.53432
N1840 ; WIPE_START
N1841 G1 X160.491 Y103.381 E-.76
N1842 ; WIPE_END
N1843 G1 E-.04 F1800
N1844 ; stop printing object, unique label id: 407
N1845 M625
N1846 M204 S10000
N1847 G17
N1848 G3 Z.8 I-1.19 J.257 P1  F60000
N1849 G1 X195.495 Y265.564 Z.8
N1850 G1 Z.4
N1851 G1 E.8 F1800
N1852 ; LAYER_HEIGHT: 0.200000
N1853 ; FEATURE: Prime tower
N1854 ; LINE_WIDTH: 0.500000
N1855 ; WIPE_TOWER_START
N1856 M204 S8000
N1857 G1  X167.495 Y265.564  E1.0642 F2100
N1858 G1  Y260.064  E0.2090
N1859 G1  X195.495  E1.0642
N1860 G1  Y265.564  E0.2090
N1861 M204 S10000
N1862 G1  X168.495 Y260.064  
N1863 ;--------------------
N1864 ; CP EMPTY GRID START
N1865 ; layer #3
N1866 M204 S8000
N1867 G1  Y265.564  E0.2090
N1868 M204 S10000
N1869 M73 P21 R48
N1870 G1  X177.162 
N1871 M204 S8000
N1872 G1  Y260.064  E0.2090
N1873 M204 S10000
N1874 G1  X185.828 
N1875 M204 S8000
N1876 G1  Y265.564  E0.2090
N1877 M204 S10000
N1878 G1  X194.495 
N1879 M204 S8000
N1880 G1  Y260.064  E0.2090
N1881 ; CP EMPTY GRID END
N1882 ;------------------
N1883 
N1884 
N1885 
N1886 
N1887 
N1888 
N1889 ; WIPE_TOWER_END
N1890 ; LAYER_HEIGHT: 0.200000
N1891 ; FEATURE: Prime tower
N1892 ; LINE_WIDTH: 0.500000
N1893 ;--------------------
N1894 ; CP TOOLCHANGE START
N1895 ; toolchange #2
N1896 ; material : PCTG -> PCTG
N1897 ;--------------------
N1898 M220 B
N1899 M220 S100
N1900 ; WIPE_TOWER_START
N1901 G1 E-.8 F1800
N1902 G17
N1903 G3 Z.8 I1.217 J0 P1  F60000
N1904 G1 X167.745 Y252.814
N1905 G1 Z.4
N1906 G1 E.8 F1800
N1907 ; LAYER_HEIGHT: 0.200000
N1908 ; FEATURE: Prime tower
N1909 ; LINE_WIDTH: 1.000000
N1910 ; NOZZLE_CHANGE_START OF1 NF0
N1911 M104 T0 S210 N0 ;Multi extruder pre cooling in post extrusion
N1912 M204 S8000
N1913 G1  X195.245 Y252.814  E2.1885 F251
N1914 G1  Y254.314  E0.1194
N1915 M104 T1 S255 N0 ;Multi extruder pre heating
N1916 G1  X167.745  E2.1885
N1917 G1  Y255.814  E0.1194
N1918 M73 P22 R48
N1919 G1  X195.245  E2.1885
N1920 G1  Y257.314  E0.1194
N1921 G1  X167.745  E2.1885
N1922 G1  Y258.814  E0.1194
N1923 G1  X195.245  E2.1885
N1924 M204 S10000
N1925 G1  Y259.814 
N1926 G1  X168.245  F398
N1927 G1  Y258.314 
N1928 G1  X194.745 
N1929 G1  Y256.814 
N1930 G1  X168.245 
N1931 G1  Y255.314 
N1932 M73 P23 R48
N1933 G1  X194.745 
N1934 G1  Y253.814 
N1935 G1  X168.245 
N1936 ; NOZZLE_CHANGE_END OF1 NF0
N1937 M104 T0 S0 N0 ;Multi extruder pre cooling
N1938 
N1939 G1 E-2 F1800
N1940 G17
N1941 G3 Z.8 I1.217 J0 P1  F5400
N1942 ; filament end gcode 
N1943 
N1944 ;======== H2D ========
N1945 ;===== 20250604 =====
N1946 M993 A2 B2 C2 ; nozzle cam detection allow status save.
N1947 M993 A0 B0 C0 ; nozzle cam detection not allowed.
N1948 
N1949 
N1950 M1015.4 S0 ; disable E air printing detect
N1951 
N1952 
N1953 M620 S0A
N1954 M1002 gcode_claim_action : 4
N1955 M204 S9000
N1956 
N1957 G1 Z3.4 F1200
N1958 
N1959 M400
N1960 M106 P1 S0
N1961 M106 P2 S0
N1962 
N1963 
N1964 ; get travel path for change filament
N1965 ;M620.1 X54 Y0 F21000 P0
N1966 ;M620.1 X54 Y0 F21000 P1
N1967 ;M620.1 X54 Y245 F21000 P2
N1968 
N1969 
N1970 
N1971 M620.10 A0 F79.8237 L0 H0.4 T250 P240 S1
N1972 
N1973 
N1974 
N1975 M620.10 A1 F149.669 L0 H0.4 T270 P255 S1
N1976 
N1977 
N1978 
N1979 M620.11 P0 I1 E0
N1980 
N1981 
N1982 
N1983 M620.11 K1 I1 R0 F200
N1984 
N1985 
N1986 M628 S1
N1987 
N1988 M620.11 S0 L0 I1 E-10 F200
N1989 
N1990 M629
N1991 
N1992 
N1993 M620.11 H2 C331
N1994 
N1995 
N1996 T0
N1997 M73 E4
N1998 
N1999 ;deretract
N2000 
N2001 
N2002 ;VG1 E4 F200
N2003 ;VG1 E4 F100
N2004 
N2005 
N2006 
N2007 ; VFLUSH_START
N2008 
N2009 
N2010 ;VG1 E0 F79
N2011 
N2012 
N2013 SYNC T0
N2014 
N2015 ; VFLUSH_END
N2016 
N2017 M1002 set_filament_type:PCTG
N2018 
N2019 M400
N2020 M83
N2021 
N2022 
N2023 
N2024 M628 S0
N2025 ;VM109 S255
N2026 M629
N2027 M400
N2028 
N2029 M983.3 F2.5 A0.4
N2030 
N2031 
N2032 M400
N2033 
N2034 M73 P23 R47
N2035 G1 Y320 F30000
N2036 G1 X201
N2037 
N2038 G1 Y295
N2039 G1 Y265 F18000
N2040 G1 Z3.4 F3000
N2041 
N2042 M204 S8000
N2043 
N2044 
N2045 M621 S0A
N2046 
N2047 M993 A3 B3 C3 ; nozzle cam detection allow status restore.
N2048 
N2049 
N2050 M1015.3 S0;disable tpu clog detect
N2051 
N2052 
N2053 
N2054 M1015.4 S0 ; disable E air printing detect
N2055 
N2056 
N2057 M620.6 I0 W1 ;enable ams air printing detect
N2058 M1002 gcode_claim_action : 0
N2059 M106 S0
N2060 M106 P2 S0
N2061 G1 X200 Y278.814 F60000
N2062 G1 Z.4
N2063 G1 X195.495 Y278.814 Z.8
N2064 
N2065 ; filament start gcode
N2066 G1 Z.4
N2067 G1 E2 F1800
N2068 
N2069 G4 S0
N2070 ; CP TOOLCHANGE WIPE
N2071 ; LINE_WIDTH: 0.500000
N2072 M204 S8000
N2073 G1  X192.495 Y278.814  E0.1140 F1782
N2074 G1 E-0.8000 F1800
N2075 M204 S10000
N2076 G1  X196.995  F600
N2077 G1  X195.495  F240
N2078 G1  X195.995  F600
N2079 G1  Y279.314 
N2080 G1  X194.995 
N2081 G1  Y278.314 
N2082 G1  X196.495 
N2083 G1  Y279.814 
N2084 G1  X194.495 
N2085 G1  Y277.814 
N2086 G1  X192.495 Y278.814   F1782
N2087 G1 E0.8000 F1800
N2088 M204 S8000
N2089 G1  X167.495  E0.9502 F1782
N2090 G1  Y278.064  E0.0285
N2091 G1  X195.495  E1.0642 F2025
N2092 G1  Y277.314  E0.0285
N2093 G1  X167.495  E1.0642 F2473
N2094 G1  Y276.564  E0.0285
N2095 G1  X195.495  E1.0642 F3938
N2096 G1  Y275.814  E0.0285
N2097 G1  X167.495  E1.0642
N2098 G1  Y275.064  E0.0285
N2099 G1  X195.495  E1.0642
N2100 G1  Y274.314  E0.0285
N2101 G1  X167.495  E1.0642
N2102 G1  Y273.564  E0.0285
N2103 G1  X195.495  E1.0642
N2104 G1  Y272.814  E0.0285
N2105 G1  X167.495  E1.0642
N2106 G1  Y272.064  E0.0285
N2107 G1  X195.495  E1.0642
N2108 G1  Y271.314  E0.0285
N2109 G1  X167.495  E1.0642
N2110 G1  Y270.564  E0.0285
N2111 G1  X195.495  E1.0642
N2112 G1  Y269.814  E0.0285
N2113 G1  X167.495  E1.0642
N2114 G1  Y269.064  E0.0285
N2115 G1  X195.495  E1.0642
N2116 G1  Y268.314  E0.0285
N2117 G1  X167.495  E1.0642
N2118 G1  Y267.564  E0.0285
N2119 G1  X195.495  E1.0642
N2120 G1  Y266.814  E0.0285
N2121 G1  X167.495  E1.0642
N2122 G1  Y266.064  E0.0285
N2123 G1  X195.495  E1.0642
N2124 ; WIPE_TOWER_END
N2125 M220 R
N2126 G1 F60000
N2127 G4 S0
N2128 G92 E0
N2129 ; CP TOOLCHANGE END
N2130 ;------------------
N2131 
N2132 
N2133 G1  Y252.064  
N2134 ; LAYER_HEIGHT: 0.200000
N2135 ; FEATURE: Prime tower
N2136 ; LINE_WIDTH: 0.500000
N2137 ; WIPE_TOWER_START
N2138 M204 S10000
N2139 G1  X195.846 Y279.721  
N2140 M204 S8000
N2141 G3  X193.064 Y281.636   I-3.469 J-2.060 E0.1325 F3938
N2142 G3  X190.723 Y280.255   I1.448 J-5.129 E0.1045
N2143 G2  X188.182 Y279.564   I-2.568 J4.426 E0.1012
N2144 G2  X174.618 Y279.568   I-6.687 J357.435 E0.5155
N2145 G2  X170.683 Y281.445   I0.499 J6.110 E0.1694
N2146 G3  X168.371 Y281.015   I-0.854 J-1.838 E0.0953
N2147 G1  X166.995 Y279.564   E0.0760
N2148 G3  X165.064 Y277.242   I3.871 J-5.183 E0.1159
N2149 G3  X166.240 Y274.649   I2.902 J-0.247 E0.1130
N2150 G2  X166.995 Y272.245   I-3.465 J-2.409 E0.0972
N2151 G2  X166.992 Y259.212   I-321.195 J-6.431 E0.4954
N2152 G2  X165.146 Y255.634   I-6.663 J1.171 E0.1554
N2153 G3  X165.485 Y253.656   I1.658 J-0.734 E0.0808
N2154 G1  X168.371 Y250.613   E0.1594
N2155 G3  X171.793 Y251.056   I1.525 J1.652 E0.1495
N2156 G2  X174.808 Y252.064   I3.021 J-4.025 E0.1229
N2157 G2  X188.372 Y252.060   I6.687 J-357.435 E0.5155
N2158 G2  X192.307 Y250.183   I-0.499 J-6.110 E0.1694
N2159 G3  X194.619 Y250.613   I0.854 J1.838 E0.0953
N2160 G1  X195.995 Y252.064   E0.0760
N2161 G3  X197.926 Y254.386   I-3.871 J5.182 E0.1159
N2162 G3  X196.750 Y256.979   I-2.902 J0.247 E0.1130
N2163 G2  X195.995 Y259.382   I3.464 J2.409 E0.0972
N2164 G2  X195.998 Y272.416   I321.212 J6.432 E0.4954
N2165 G2  X197.844 Y275.994   I6.663 J-1.171 E0.1554
N2166 G3  X197.564 Y277.905   I-1.654 J0.733 E0.0774
N2167 ; WIPE_TOWER_END
N2168 
N2169 ; WIPE_START
N2170 G1 F5107.47
N2171 M204 S8000
N2172 G1 X197.598 Y277.866 E-.01975
N2173 G1 X197.683 Y277.752 E-.0539
N2174 G1 X197.759 Y277.632 E-.05389
N2175 G1 X197.825 Y277.506 E-.05389
N2176 G1 X197.88 Y277.376 E-.0539
N2177 G1 X197.926 Y277.242 E-.05389
N2178 G1 X197.961 Y277.104 E-.0539
N2179 G1 X197.985 Y276.964 E-.05389
N2180 G1 X197.998 Y276.823 E-.05391
N2181 G1 X198 Y276.681 E-.05388
N2182 G1 X197.99 Y276.54 E-.0539
N2183 G1 X197.97 Y276.4 E-.05389
N2184 G1 X197.939 Y276.261 E-.05389
N2185 G1 X197.896 Y276.126 E-.0539
N2186 G1 X197.858 Y276.029 E-.03963
N2187 ; WIPE_END
N2188 G1 E-.04 F1800
N2189 M204 S10000
N2190 G17
N2191 G3 Z.8 I1.217 J0 P1  F60000
N2192 ; OBJECT_ID: 372
N2193 ; start printing object, unique label id: 372
N2194 M624 AQAAAAAAAAA=
N2195 G1 X191.084 Y201.084
N2196 G1 Z.4
N2197 G1 E.8 F1800
N2198 ; FEATURE: Inner wall
N2199 ; LINE_WIDTH: 0.45
N2200 ; LAYER_HEIGHT: 0.2
N2201 G1 F4421.739
N2202 M204 S8000
N2203 G1 X158.916 Y201.084 E1.03439
N2204 G1 X158.916 Y118.916 E2.64221
N2205 G1 X191.084 Y118.916 E1.03439
N2206 G1 X191.084 Y201.024 E2.64028
N2207 M204 S10000
N2208 M73 P24 R47
N2209 G1 X191.491 Y201.491 F60000
N2210 G1 F4421.739
N2211 M204 S8000
N2212 G1 X158.509 Y201.491 E1.06057
N2213 G1 X158.509 Y118.509 E2.66839
N2214 G1 X191.491 Y118.509 E1.06057
N2215 G1 X191.491 Y201.431 E2.66646
N2216 M204 S10000
N2217 G1 X191.898 Y201.898 F60000
N2218 G1 F4421.739
N2219 M204 S8000
N2220 G1 X158.102 Y201.898 E1.08675
N2221 G1 X158.102 Y118.102 E2.69457
N2222 G1 X191.898 Y118.102 E1.08675
N2223 G1 X191.898 Y201.838 E2.69264
N2224 M204 S10000
N2225 G1 X192.29 Y202.29 F60000
N2226 ; FEATURE: Outer wall
N2227 ; LINE_WIDTH: 0.42
N2228 G1 F4773.528
N2229 M204 S5000
N2230 G1 X157.71 Y202.29 E1.03002
N2231 G1 X157.71 Y117.71 E2.51935
N2232 G1 X192.29 Y117.71 E1.03002
N2233 G1 X192.29 Y202.23 E2.51756
N2234 G1 E-.8 F1800
N2235 M204 S10000
N2236 G1 X190.157 Y200.92 Z.8 F60000
N2237 G1 Z.4
N2238 G1 E.8 F1800
N2239 ; FEATURE: Internal solid infill
N2240 ; LINE_WIDTH: 0.42056
N2241 G1 F4766.444
N2242 M204 S8000
N2243 G1 X190.751 Y200.326 E.02505
N2244 G1 X190.751 Y199.792 E.01593
N2245 G1 X189.792 Y200.751 E.04042
N2246 G1 X189.258 Y200.751 E.01593
N2247 G1 X190.751 Y199.258 E.06295
N2248 G1 X190.751 Y198.724 E.01593
N2249 G1 X188.724 Y200.751 E.08548
N2250 G1 X188.19 Y200.751 E.01593
N2251 G1 X190.751 Y198.19 E.10801
N2252 G1 X190.751 Y197.656 E.01593
N2253 G1 X187.656 Y200.751 E.13055
N2254 G1 X187.122 Y200.751 E.01593
N2255 G1 X190.751 Y197.122 E.15308
N2256 G1 X190.751 Y196.588 E.01593
N2257 G1 X186.588 Y200.751 E.17561
N2258 G1 X186.054 Y200.751 E.01593
N2259 G1 X190.751 Y196.054 E.19814
N2260 G1 X190.751 Y195.52 E.01593
N2261 G1 X185.52 Y200.751 E.22067
N2262 G1 X184.986 Y200.751 E.01593
N2263 G1 X190.751 Y194.986 E.2432
N2264 G1 X190.751 Y194.452 E.01593
N2265 G1 X184.452 Y200.751 E.26573
N2266 G1 X183.918 Y200.751 E.01593
N2267 G1 X190.751 Y193.918 E.28826
N2268 G1 X190.751 Y193.384 E.01593
N2269 G1 X183.384 Y200.751 E.31079
N2270 G1 X182.85 Y200.751 E.01593
N2271 G1 X190.751 Y192.85 E.33332
N2272 G1 X190.751 Y192.315 E.01593
N2273 G1 X182.315 Y200.751 E.35585
N2274 G1 X181.781 Y200.751 E.01593
N2275 G1 X190.751 Y191.781 E.37838
N2276 G1 X190.751 Y191.247 E.01593
N2277 G1 X181.247 Y200.751 E.40091
N2278 G1 X180.713 Y200.751 E.01593
N2279 G1 X190.751 Y190.713 E.42344
N2280 G1 X190.751 Y190.179 E.01593
N2281 G1 X180.179 Y200.751 E.44597
N2282 G1 X179.645 Y200.751 E.01593
N2283 G1 X190.751 Y189.645 E.46851
N2284 G1 X190.751 Y189.111 E.01593
N2285 G1 X179.111 Y200.751 E.49104
N2286 G1 X178.577 Y200.751 E.01593
N2287 G1 X190.751 Y188.577 E.51357
N2288 G1 X190.751 Y188.043 E.01593
N2289 G1 X178.043 Y200.751 E.5361
N2290 G1 X177.509 Y200.751 E.01593
N2291 G1 X190.751 Y187.509 E.55863
N2292 G1 X190.751 Y186.975 E.01593
N2293 G1 X176.975 Y200.751 E.58116
N2294 G1 X176.441 Y200.751 E.01593
N2295 G1 X190.751 Y186.441 E.60369
N2296 G1 X190.751 Y185.907 E.01593
N2297 G1 X175.907 Y200.751 E.62622
N2298 G1 X175.373 Y200.751 E.01593
N2299 G1 X190.751 Y185.373 E.64875
N2300 G1 X190.751 Y184.839 E.01593
N2301 G1 X174.839 Y200.751 E.67128
N2302 G1 X174.305 Y200.751 E.01593
N2303 G1 X190.751 Y184.305 E.69381
N2304 G1 X190.751 Y183.77 E.01593
N2305 G1 X173.77 Y200.751 E.71634
N2306 G1 X173.236 Y200.751 E.01593
N2307 G1 X190.751 Y183.236 E.73887
N2308 G1 X190.751 Y182.702 E.01593
N2309 G1 X172.702 Y200.751 E.7614
N2310 G1 X172.168 Y200.751 E.01593
N2311 G1 X190.751 Y182.168 E.78393
N2312 G1 X190.751 Y181.634 E.01593
N2313 G1 X171.634 Y200.751 E.80646
N2314 G1 X171.1 Y200.751 E.01593
N2315 G1 X190.751 Y181.1 E.829
N2316 G1 X190.751 Y180.566 E.01593
N2317 G1 X170.566 Y200.751 E.85153
N2318 G1 X170.032 Y200.751 E.01593
N2319 G1 X190.751 Y180.032 E.87406
N2320 G1 X190.751 Y179.498 E.01593
N2321 G1 X169.498 Y200.751 E.89659
N2322 G1 X168.964 Y200.751 E.01593
N2323 G1 X190.751 Y178.964 E.91912
N2324 G1 X190.751 Y178.43 E.01593
N2325 G1 X168.43 Y200.751 E.94165
N2326 G1 X167.896 Y200.751 E.01593
N2327 G1 X190.751 Y177.896 E.96418
N2328 G1 X190.751 Y177.362 E.01593
N2329 G1 X167.362 Y200.751 E.98671
N2330 G1 X166.828 Y200.751 E.01593
N2331 G1 X190.751 Y176.828 E1.00924
N2332 G1 X190.751 Y176.294 E.01593
N2333 G1 X166.294 Y200.751 E1.03177
N2334 G1 X165.759 Y200.751 E.01593
N2335 G1 X190.751 Y175.76 E1.0543
N2336 G1 X190.751 Y175.225 E.01593
N2337 G1 X165.225 Y200.751 E1.07683
N2338 G1 X164.691 Y200.751 E.01593
N2339 G1 X190.751 Y174.691 E1.09936
N2340 G1 X190.751 Y174.157 E.01593
N2341 G1 X164.157 Y200.751 E1.12189
N2342 G1 X163.623 Y200.751 E.01593
N2343 G1 X190.751 Y173.623 E1.14442
N2344 G1 X190.751 Y173.089 E.01593
N2345 G1 X163.089 Y200.751 E1.16696
N2346 G1 X162.555 Y200.751 E.01593
N2347 G1 X190.751 Y172.555 E1.18949
N2348 G1 X190.751 Y172.021 E.01593
N2349 G1 X162.021 Y200.751 E1.21202
N2350 G1 X161.487 Y200.751 E.01593
N2351 G1 X190.751 Y171.487 E1.23455
N2352 G1 X190.751 Y170.953 E.01593
N2353 G1 X160.953 Y200.751 E1.25708
N2354 G1 X160.419 Y200.751 E.01593
N2355 G1 X190.751 Y170.419 E1.27961
N2356 G1 X190.751 Y169.885 E.01593
N2357 G1 X159.885 Y200.751 E1.30214
N2358 G1 X159.351 Y200.751 E.01593
N2359 G1 X190.751 Y169.351 E1.32467
N2360 G1 X190.751 Y168.817 E.01593
N2361 G1 X159.249 Y200.318 E1.32894
N2362 G1 X159.249 Y199.784 E.01593
N2363 G1 X190.751 Y168.283 E1.32894
N2364 G1 X190.751 Y167.749 E.01593
N2365 G1 X159.249 Y199.25 E1.32894
N2366 G1 X159.249 Y198.716 E.01593
N2367 G1 X190.751 Y167.214 E1.32894
N2368 G1 X190.751 Y166.68 E.01593
N2369 G1 X159.249 Y198.181 E1.32894
N2370 G1 X159.249 Y197.647 E.01593
N2371 G1 X190.751 Y166.146 E1.32894
N2372 G1 X190.751 Y165.612 E.01593
N2373 G1 X159.249 Y197.113 E1.32894
N2374 G1 X159.249 Y196.579 E.01593
N2375 G1 X190.751 Y165.078 E1.32894
N2376 G1 X190.751 Y164.544 E.01593
N2377 G1 X159.249 Y196.045 E1.32894
N2378 G1 X159.249 Y195.511 E.01593
N2379 G1 X190.751 Y164.01 E1.32894
N2380 G1 X190.751 Y163.476 E.01593
N2381 G1 X159.249 Y194.977 E1.32894
N2382 G1 X159.249 Y194.443 E.01593
N2383 G1 X190.751 Y162.942 E1.32894
N2384 G1 X190.751 Y162.408 E.01593
N2385 G1 X159.249 Y193.909 E1.32894
N2386 G1 X159.249 Y193.375 E.01593
N2387 M73 P24 R46
N2388 G1 X190.751 Y161.874 E1.32894
N2389 G1 X190.751 Y161.34 E.01593
N2390 M73 P25 R46
N2391 G1 X159.249 Y192.841 E1.32894
N2392 G1 X159.249 Y192.307 E.01593
N2393 G1 X190.751 Y160.806 E1.32894
N2394 G1 X190.751 Y160.272 E.01593
N2395 G1 X159.249 Y191.773 E1.32894
N2396 G1 X159.249 Y191.239 E.01593
N2397 G1 X190.751 Y159.738 E1.32894
N2398 G1 X190.751 Y159.204 E.01593
N2399 G1 X159.249 Y190.705 E1.32894
N2400 G1 X159.249 Y190.171 E.01593
N2401 G1 X190.751 Y158.669 E1.32894
N2402 G1 X190.751 Y158.135 E.01593
N2403 G1 X159.249 Y189.636 E1.32894
N2404 G1 X159.249 Y189.102 E.01593
N2405 G1 X190.751 Y157.601 E1.32894
N2406 G1 X190.751 Y157.067 E.01593
N2407 G1 X159.249 Y188.568 E1.32894
N2408 G1 X159.249 Y188.034 E.01593
N2409 G1 X190.751 Y156.533 E1.32894
N2410 G1 X190.751 Y155.999 E.01593
N2411 G1 X159.249 Y187.5 E1.32894
N2412 G1 X159.249 Y186.966 E.01593
N2413 G1 X190.751 Y155.465 E1.32894
N2414 G1 X190.751 Y154.931 E.01593
N2415 G1 X159.249 Y186.432 E1.32894
N2416 G1 X159.249 Y185.898 E.01593
N2417 G1 X190.751 Y154.397 E1.32894
N2418 G1 X190.751 Y153.863 E.01593
N2419 G1 X159.249 Y185.364 E1.32894
N2420 G1 X159.249 Y184.83 E.01593
N2421 G1 X190.751 Y153.329 E1.32894
N2422 G1 X190.751 Y152.795 E.01593
N2423 G1 X159.249 Y184.296 E1.32894
N2424 G1 X159.249 Y183.762 E.01593
N2425 G1 X190.751 Y152.261 E1.32894
N2426 G1 X190.751 Y151.727 E.01593
N2427 G1 X159.249 Y183.228 E1.32894
N2428 G1 X159.249 Y182.694 E.01593
N2429 G1 X190.751 Y151.193 E1.32894
N2430 G1 X190.751 Y150.659 E.01593
N2431 G1 X159.249 Y182.16 E1.32894
N2432 G1 X159.249 Y181.626 E.01593
N2433 G1 X190.751 Y150.124 E1.32894
N2434 G1 X190.751 Y149.59 E.01593
N2435 G1 X159.249 Y181.091 E1.32894
N2436 G1 X159.249 Y180.557 E.01593
N2437 G1 X190.751 Y149.056 E1.32894
N2438 G1 X190.751 Y148.522 E.01593
N2439 G1 X159.249 Y180.023 E1.32894
N2440 G1 X159.249 Y179.489 E.01593
N2441 G1 X190.751 Y147.988 E1.32894
N2442 G1 X190.751 Y147.454 E.01593
N2443 G1 X159.249 Y178.955 E1.32894
N2444 G1 X159.249 Y178.421 E.01593
N2445 G1 X190.751 Y146.92 E1.32894
N2446 G1 X190.751 Y146.386 E.01593
N2447 G1 X159.249 Y177.887 E1.32894
N2448 G1 X159.249 Y177.353 E.01593
N2449 G1 X190.751 Y145.852 E1.32894
N2450 G1 X190.751 Y145.318 E.01593
N2451 G1 X159.249 Y176.819 E1.32894
N2452 G1 X159.249 Y176.285 E.01593
N2453 G1 X190.751 Y144.784 E1.32894
N2454 G1 X190.751 Y144.25 E.01593
N2455 G1 X159.249 Y175.751 E1.32894
N2456 G1 X159.249 Y175.217 E.01593
N2457 G1 X190.751 Y143.716 E1.32894
N2458 G1 X190.751 Y143.182 E.01593
N2459 G1 X159.249 Y174.683 E1.32894
N2460 G1 X159.249 Y174.149 E.01593
N2461 G1 X190.751 Y142.648 E1.32894
N2462 G1 X190.751 Y142.113 E.01593
N2463 G1 X159.249 Y173.615 E1.32894
N2464 G1 X159.249 Y173.081 E.01593
N2465 G1 X190.751 Y141.579 E1.32894
N2466 G1 X190.751 Y141.045 E.01593
N2467 G1 X159.249 Y172.546 E1.32894
N2468 G1 X159.249 Y172.012 E.01593
N2469 G1 X190.751 Y140.511 E1.32894
N2470 G1 X190.751 Y139.977 E.01593
N2471 G1 X159.249 Y171.478 E1.32894
N2472 G1 X159.249 Y170.944 E.01593
N2473 G1 X190.751 Y139.443 E1.32894
N2474 G1 X190.751 Y138.909 E.01593
N2475 G1 X159.249 Y170.41 E1.32894
N2476 G1 X159.249 Y169.876 E.01593
N2477 G1 X190.751 Y138.375 E1.32894
N2478 G1 X190.751 Y137.841 E.01593
N2479 G1 X159.249 Y169.342 E1.32894
N2480 G1 X159.249 Y168.808 E.01593
N2481 G1 X190.751 Y137.307 E1.32894
N2482 G1 X190.751 Y136.773 E.01593
N2483 G1 X159.249 Y168.274 E1.32894
N2484 G1 X159.249 Y167.74 E.01593
N2485 G1 X190.751 Y136.239 E1.32894
N2486 G1 X190.751 Y135.705 E.01593
N2487 G1 X159.249 Y167.206 E1.32894
N2488 G1 X159.249 Y166.672 E.01593
N2489 G1 X190.751 Y135.171 E1.32894
N2490 G1 X190.751 Y134.637 E.01593
N2491 G1 X159.249 Y166.138 E1.32894
N2492 G1 X159.249 Y165.604 E.01593
N2493 G1 X190.751 Y134.103 E1.32894
N2494 G1 X190.751 Y133.568 E.01593
N2495 G1 X159.249 Y165.07 E1.32894
N2496 G1 X159.249 Y164.535 E.01593
N2497 G1 X190.751 Y133.034 E1.32894
N2498 G1 X190.751 Y132.5 E.01593
N2499 G1 X159.249 Y164.001 E1.32894
N2500 G1 X159.249 Y163.467 E.01593
N2501 G1 X190.751 Y131.966 E1.32894
N2502 G1 X190.751 Y131.432 E.01593
N2503 G1 X159.249 Y162.933 E1.32894
N2504 G1 X159.249 Y162.399 E.01593
N2505 G1 X190.751 Y130.898 E1.32894
N2506 G1 X190.751 Y130.364 E.01593
N2507 G1 X159.249 Y161.865 E1.32894
N2508 G1 X159.249 Y161.331 E.01593
N2509 G1 X190.751 Y129.83 E1.32894
N2510 G1 X190.751 Y129.296 E.01593
N2511 G1 X159.249 Y160.797 E1.32894
N2512 G1 X159.249 Y160.263 E.01593
N2513 G1 X190.751 Y128.762 E1.32894
N2514 G1 X190.751 Y128.228 E.01593
N2515 G1 X159.249 Y159.729 E1.32894
N2516 G1 X159.249 Y159.195 E.01593
N2517 G1 X190.751 Y127.694 E1.32894
N2518 G1 X190.751 Y127.16 E.01593
N2519 M73 P26 R46
N2520 G1 X159.249 Y158.661 E1.32894
N2521 G1 X159.249 Y158.127 E.01593
N2522 G1 X190.751 Y126.626 E1.32894
N2523 G1 X190.751 Y126.092 E.01593
N2524 G1 X159.249 Y157.593 E1.32894
N2525 G1 X159.249 Y157.059 E.01593
N2526 G1 X190.751 Y125.558 E1.32894
N2527 G1 X190.751 Y125.023 E.01593
N2528 G1 X159.249 Y156.525 E1.32894
N2529 G1 X159.249 Y155.99 E.01593
N2530 G1 X190.751 Y124.489 E1.32894
N2531 G1 X190.751 Y123.955 E.01593
N2532 G1 X159.249 Y155.456 E1.32894
N2533 G1 X159.249 Y154.922 E.01593
N2534 G1 X190.751 Y123.421 E1.32894
N2535 G1 X190.751 Y122.887 E.01593
N2536 G1 X159.249 Y154.388 E1.32894
N2537 G1 X159.249 Y153.854 E.01593
N2538 G1 X190.751 Y122.353 E1.32894
N2539 G1 X190.751 Y121.819 E.01593
N2540 G1 X159.249 Y153.32 E1.32894
N2541 G1 X159.249 Y152.786 E.01593
N2542 G1 X190.751 Y121.285 E1.32894
N2543 G1 X190.751 Y120.751 E.01593
N2544 G1 X159.249 Y152.252 E1.32894
N2545 G1 X159.249 Y151.718 E.01593
N2546 G1 X190.751 Y120.217 E1.32894
N2547 G1 X190.751 Y119.683 E.01593
N2548 G1 X159.249 Y151.184 E1.32894
N2549 G1 X159.249 Y150.65 E.01593
N2550 G1 X190.65 Y119.249 E1.32469
N2551 G1 X190.116 Y119.249 E.01593
N2552 G1 X159.249 Y150.116 E1.30216
N2553 G1 X159.249 Y149.582 E.01593
N2554 G1 X189.582 Y119.249 E1.27963
N2555 G1 X189.048 Y119.249 E.01593
N2556 G1 X159.249 Y149.048 E1.2571
N2557 G1 X159.249 Y148.514 E.01593
N2558 G1 X188.514 Y119.249 E1.23457
N2559 G1 X187.98 Y119.249 E.01593
N2560 G1 X159.249 Y147.98 E1.21204
N2561 G1 X159.249 Y147.445 E.01593
N2562 G1 X187.445 Y119.249 E1.18951
N2563 G1 X186.911 Y119.249 E.01593
N2564 G1 X159.249 Y146.911 E1.16698
N2565 G1 X159.249 Y146.377 E.01593
N2566 G1 X186.377 Y119.249 E1.14445
N2567 G1 X185.843 Y119.249 E.01593
N2568 G1 X159.249 Y145.843 E1.12192
N2569 G1 X159.249 Y145.309 E.01593
N2570 G1 X185.309 Y119.249 E1.09939
N2571 G1 X184.775 Y119.249 E.01593
N2572 G1 X159.249 Y144.775 E1.07686
N2573 G1 X159.249 Y144.241 E.01593
N2574 G1 X184.241 Y119.249 E1.05433
N2575 G1 X183.707 Y119.249 E.01593
N2576 G1 X159.249 Y143.707 E1.0318
N2577 G1 X159.249 Y143.173 E.01593
N2578 G1 X183.173 Y119.249 E1.00927
N2579 G1 X182.639 Y119.249 E.01593
N2580 G1 X159.249 Y142.639 E.98673
N2581 G1 X159.249 Y142.105 E.01593
N2582 G1 X182.105 Y119.249 E.9642
N2583 G1 X181.571 Y119.249 E.01593
N2584 G1 X159.249 Y141.571 E.94167
N2585 G1 X159.249 Y141.037 E.01593
N2586 G1 X181.037 Y119.249 E.91914
N2587 G1 X180.503 Y119.249 E.01593
N2588 G1 X159.249 Y140.503 E.89661
N2589 G1 X159.249 Y139.969 E.01593
N2590 G1 X179.969 Y119.249 E.87408
N2591 G1 X179.435 Y119.249 E.01593
N2592 G1 X159.249 Y139.435 E.85155
N2593 G1 X159.249 Y138.9 E.01593
N2594 G1 X178.9 Y119.249 E.82902
N2595 G1 X178.366 Y119.249 E.01593
N2596 G1 X159.249 Y138.366 E.80649
N2597 G1 X159.249 Y137.832 E.01593
N2598 G1 X177.832 Y119.249 E.78396
N2599 G1 X177.298 Y119.249 E.01593
N2600 G1 X159.249 Y137.298 E.76143
N2601 G1 X159.249 Y136.764 E.01593
N2602 G1 X176.764 Y119.249 E.7389
N2603 G1 X176.23 Y119.249 E.01593
N2604 G1 X159.249 Y136.23 E.71637
N2605 G1 X159.249 Y135.696 E.01593
N2606 G1 X175.696 Y119.249 E.69384
N2607 G1 X175.162 Y119.249 E.01593
N2608 M73 P26 R45
N2609 G1 X159.249 Y135.162 E.67131
N2610 G1 X159.249 Y134.628 E.01593
N2611 G1 X174.628 Y119.249 E.64878
N2612 G1 X174.094 Y119.249 E.01593
N2613 G1 X159.249 Y134.094 E.62624
N2614 G1 X159.249 Y133.56 E.01593
N2615 G1 X173.56 Y119.249 E.60371
N2616 G1 X173.026 Y119.249 E.01593
N2617 G1 X159.249 Y133.026 E.58118
N2618 G1 X159.249 Y132.492 E.01593
N2619 G1 X172.492 Y119.249 E.55865
N2620 G1 X171.958 Y119.249 E.01593
N2621 G1 X159.249 Y131.958 E.53612
N2622 G1 X159.249 Y131.424 E.01593
N2623 G1 X171.424 Y119.249 E.51359
N2624 G1 X170.89 Y119.249 E.01593
N2625 G1 X159.249 Y130.889 E.49106
N2626 G1 X159.249 Y130.355 E.01593
N2627 G1 X170.355 Y119.249 E.46853
N2628 G1 X169.821 Y119.249 E.01593
N2629 G1 X159.249 Y129.821 E.446
N2630 G1 X159.249 Y129.287 E.01593
N2631 G1 X169.287 Y119.249 E.42347
N2632 G1 X168.753 Y119.249 E.01593
N2633 G1 X159.249 Y128.753 E.40094
N2634 G1 X159.249 Y128.219 E.01593
N2635 G1 X168.219 Y119.249 E.37841
N2636 G1 X167.685 Y119.249 E.01593
N2637 G1 X159.249 Y127.685 E.35588
N2638 G1 X159.249 Y127.151 E.01593
N2639 G1 X167.151 Y119.249 E.33335
N2640 G1 X166.617 Y119.249 E.01593
N2641 G1 X159.249 Y126.617 E.31082
N2642 G1 X159.249 Y126.083 E.01593
N2643 G1 X166.083 Y119.249 E.28828
N2644 G1 X165.549 Y119.249 E.01593
N2645 G1 X159.249 Y125.549 E.26575
N2646 G1 X159.249 Y125.015 E.01593
N2647 G1 X165.015 Y119.249 E.24322
N2648 G1 X164.481 Y119.249 E.01593
N2649 G1 X159.249 Y124.481 E.22069
N2650 G1 X159.249 Y123.947 E.01593
N2651 G1 X163.947 Y119.249 E.19816
N2652 G1 X163.413 Y119.249 E.01593
N2653 G1 X159.249 Y123.413 E.17563
N2654 G1 X159.249 Y122.879 E.01593
N2655 G1 X162.879 Y119.249 E.1531
N2656 G1 X162.344 Y119.249 E.01593
N2657 G1 X159.249 Y122.344 E.13057
N2658 G1 X159.249 Y121.81 E.01593
N2659 G1 X161.81 Y119.249 E.10804
N2660 G1 X161.276 Y119.249 E.01593
N2661 G1 X159.249 Y121.276 E.08551
N2662 G1 X159.249 Y120.742 E.01593
N2663 G1 X160.742 Y119.249 E.06298
N2664 G1 X160.208 Y119.249 E.01593
N2665 G1 X159.249 Y120.208 E.04045
N2666 G1 X159.249 Y119.674 E.01593
N2667 G1 X159.844 Y119.08 E.02508
N2668 ; WIPE_START
N2669 G1 X159.249 Y119.674 E-.31942
N2670 G1 X159.249 Y120.208 E-.20295
N2671 G1 X159.692 Y119.766 E-.23763
N2672 ; WIPE_END
N2673 G1 E-.04 F1800
N2674 M204 S10000
N2675 G17
N2676 G3 Z.8 I1.217 J0 P1  F60000
N2677 ; stop printing object, unique label id: 372
N2678 M625
N2679 ; object ids of layer 2 start: 372,407
N2680 M624 AwAAAAAAAAA=
N2681 ;======== H2D 20250527========
N2682 ; SKIPPABLE_START
N2683 ; SKIPTYPE: timelapse
N2684 M622.1 S1 ; for prev firware, default turned on
N2685 
N2686 M1002 judge_flag timelapse_record_flag
N2687 
N2688 M622 J1
N2689 M993 A2 B2 C2
N2690 M993 A0 B0 C0
N2691 
N2692 
N2693 
N2694 
N2695     M9711 M0 E1 X261 Y132 Z0.8 S11 C10 O0 T3000
N2696 
N2697 
N2698 
N2699 M993 A3 B3 C3
N2700 
N2701 M623
N2702 ; SKIPPABLE_END
N2703 
N2704 ; object ids of this layer2 end: 372,407
N2705 M625
N2706 ; CHANGE_LAYER
N2707 ; Z_HEIGHT: 0.6
N2708 ; LAYER_HEIGHT: 0.2
N2709 ;======== H2D 20250521========
N2710 ; layer num/total_layer_count: 3/75
N2711 ; update layer progress
N2712 M73 L3
N2713 M991 S0 P2 ;notify layer change
N2714 
N2715 
N2716 ; OBJECT_ID: 372
N2717 ; COOLING_NODE: 0
N2718 ; start printing object, unique label id: 372
N2719 M624 AQAAAAAAAAA=
N2720 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=0.500G1 Z0.500 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N1829 G1 X158.295 Y103.671 E1.08423
N1830 G1 X158.295 Y103.091 E.01819
N1831 G1 X192.875 Y103.091 E1.08423
N1832 G1 X192.875 Y103.611 E.0163
N1839 G1 X158.491 Y103.381 E.53432
N1841 G1 X160.491 Y103.381 E-.76
N1857 G1  X167.495 Y265.564  E1.0642 F2100
N1858 G1  Y260.064  E0.2090
N1859 G1  X195.495  E1.0642
N1860 G1  Y265.564  E0.2090
N1867 G1  Y265.564  E0.2090
N1872 G1  Y260.064  E0.2090
N1876 G1  Y265.564  E0.2090
N1880 G1  Y260.064  E0.2090
N1913 G1  X195.245 Y252.814  E2.1885 F251
N1914 G1  Y254.314  E0.1194
N1916 G1  X167.745  E2.1885
N1917 G1  Y255.814  E0.1194
N1919 G1  X195.245  E2.1885
N1920 G1  Y257.314  E0.1194
N1921 G1  X167.745  E2.1885
N1922 G1  Y258.814  E0.1194
N1923 G1  X195.245  E2.1885
N2073 G1  X192.495 Y278.814  E0.1140 F1782
N2089 G1  X167.495  E0.9502 F1782
N2090 G1  Y278.064  E0.0285
N2091 G1  X195.495  E1.0642 F2025
N2092 G1  Y277.314  E0.0285
N2093 G1  X167.495  E1.0642 F2473
N2094 G1  Y276.564  E0.0285
N2095 G1  X195.495  E1.0642 F3938
N2096 G1  Y275.814  E0.0285
N2097 G1  X167.495  E1.0642
N2098 G1  Y275.064  E0.0285
N2099 G1  X195.495  E1.0642
N2100 G1  Y274.314  E0.0285
N2101 G1  X167.495  E1.0642
N2102 G1  Y273.564  E0.0285
N2103 G1  X195.495  E1.0642
N2104 G1  Y272.814  E0.0285
N2105 G1  X167.495  E1.0642
N2106 G1  Y272.064  E0.0285
N2107 G1  X195.495  E1.0642
N2108 G1  Y271.314  E0.0285
N2109 G1  X167.495  E1.0642
N2110 G1  Y270.564  E0.0285
N2111 G1  X195.495  E1.0642
N2112 G1  Y269.814  E0.0285
N2113 G1  X167.495  E1.0642
N2114 G1  Y269.064  E0.0285
N2115 G1  X195.495  E1.0642
N2116 G1  Y268.314  E0.0285
N2117 G1  X167.495  E1.0642
N2118 G1  Y267.564  E0.0285
N2119 G1  X195.495  E1.0642
N2120 G1  Y266.814  E0.0285
N2121 G1  X167.495  E1.0642
N2122 G1  Y266.064  E0.0285
N2123 G1  X195.495  E1.0642
N2147 G1  X166.995 Y279.564   E0.0760
N2154 G1  X168.371 Y250.613   E0.1594
N2160 G1  X195.995 Y252.064   E0.0760
N2172 G1 X197.598 Y277.866 E-.01975
N2173 G1 X197.683 Y277.752 E-.0539
N2174 G1 X197.759 Y277.632 E-.05389
N2175 G1 X197.825 Y277.506 E-.05389
N2176 G1 X197.88 Y277.376 E-.0539
N2177 G1 X197.926 Y277.242 E-.05389
N2178 G1 X197.961 Y277.104 E-.0539
N2179 G1 X197.985 Y276.964 E-.05389
N2180 G1 X197.998 Y276.823 E-.05391
N2181 G1 X198 Y276.681 E-.05388
N2182 G1 X197.99 Y276.54 E-.0539
N2183 G1 X197.97 Y276.4 E-.05389
N2184 G1 X197.939 Y276.261 E-.05389
N2185 G1 X197.896 Y276.126 E-.0539
N2186 G1 X197.858 Y276.029 E-.03963
N2203 G1 X158.916 Y201.084 E1.03439
N2204 G1 X158.916 Y118.916 E2.64221
N2205 G1 X191.084 Y118.916 E1.03439
N2206 G1 X191.084 Y201.024 E2.64028
N2212 G1 X158.509 Y201.491 E1.06057
N2213 G1 X158.509 Y118.509 E2.66839
N2214 G1 X191.491 Y118.509 E1.06057
N2215 G1 X191.491 Y201.431 E2.66646
N2220 G1 X158.102 Y201.898 E1.08675
N2221 G1 X158.102 Y118.102 E2.69457
N2222 G1 X191.898 Y118.102 E1.08675
N2223 G1 X191.898 Y201.838 E2.69264
N2230 G1 X157.71 Y202.29 E1.03002
N2231 G1 X157.71 Y117.71 E2.51935
N2232 G1 X192.29 Y117.71 E1.03002
N2233 G1 X192.29 Y202.23 E2.51756
N2243 G1 X190.751 Y200.326 E.02505
N2244 G1 X190.751 Y199.792 E.01593
N2245 G1 X189.792 Y200.751 E.04042
N2246 G1 X189.258 Y200.751 E.01593
N2247 G1 X190.751 Y199.258 E.06295
N2248 G1 X190.751 Y198.724 E.01593
N2249 G1 X188.724 Y200.751 E.08548
N2250 G1 X188.19 Y200.751 E.01593
N2251 G1 X190.751 Y198.19 E.10801
N2252 G1 X190.751 Y197.656 E.01593
N2253 G1 X187.656 Y200.751 E.13055
N2254 G1 X187.122 Y200.751 E.01593
N2255 G1 X190.751 Y197.122 E.15308
N2256 G1 X190.751 Y196.588 E.01593
N2257 G1 X186.588 Y200.751 E.17561
N2258 G1 X186.054 Y200.751 E.01593
N2259 G1 X190.751 Y196.054 E.19814
N2260 G1 X190.751 Y195.52 E.01593
N2261 G1 X185.52 Y200.751 E.22067
N2262 G1 X184.986 Y200.751 E.01593
N2263 G1 X190.751 Y194.986 E.2432
N2264 G1 X190.751 Y194.452 E.01593
N2265 G1 X184.452 Y200.751 E.26573
N2266 G1 X183.918 Y200.751 E.01593
N2267 G1 X190.751 Y193.918 E.28826
N2268 G1 X190.751 Y193.384 E.01593
N2269 G1 X183.384 Y200.751 E.31079
N2270 G1 X182.85 Y200.751 E.01593
N2271 G1 X190.751 Y192.85 E.33332
N2272 G1 X190.751 Y192.315 E.01593
N2273 G1 X182.315 Y200.751 E.35585
N2274 G1 X181.781 Y200.751 E.01593
N2275 G1 X190.751 Y191.781 E.37838
N2276 G1 X190.751 Y191.247 E.01593
N2277 G1 X181.247 Y200.751 E.40091
N2278 G1 X180.713 Y200.751 E.01593
N2279 G1 X190.751 Y190.713 E.42344
N2280 G1 X190.751 Y190.179 E.01593
N2281 G1 X180.179 Y200.751 E.44597
N2282 G1 X179.645 Y200.751 E.01593
N2283 G1 X190.751 Y189.645 E.46851
N2284 G1 X190.751 Y189.111 E.01593
N2285 G1 X179.111 Y200.751 E.49104
N2286 G1 X178.577 Y200.751 E.01593
N2287 G1 X190.751 Y188.577 E.51357
N2288 G1 X190.751 Y188.043 E.01593
N2289 G1 X178.043 Y200.751 E.5361
N2290 G1 X177.509 Y200.751 E.01593
N2291 G1 X190.751 Y187.509 E.55863
N2292 G1 X190.751 Y186.975 E.01593
N2293 G1 X176.975 Y200.751 E.58116
N2294 G1 X176.441 Y200.751 E.01593
N2295 G1 X190.751 Y186.441 E.60369
N2296 G1 X190.751 Y185.907 E.01593
N2297 G1 X175.907 Y200.751 E.62622
N2298 G1 X175.373 Y200.751 E.01593
N2299 G1 X190.751 Y185.373 E.64875
N2300 G1 X190.751 Y184.839 E.01593
N2301 G1 X174.839 Y200.751 E.67128
N2302 G1 X174.305 Y200.751 E.01593
N2303 G1 X190.751 Y184.305 E.69381
N2304 G1 X190.751 Y183.77 E.01593
N2305 G1 X173.77 Y200.751 E.71634
N2306 G1 X173.236 Y200.751 E.01593
N2307 G1 X190.751 Y183.236 E.73887
N2308 G1 X190.751 Y182.702 E.01593
N2309 G1 X172.702 Y200.751 E.7614
N2310 G1 X172.168 Y200.751 E.01593
N2311 G1 X190.751 Y182.168 E.78393
N2312 G1 X190.751 Y181.634 E.01593
N2313 G1 X171.634 Y200.751 E.80646
N2314 G1 X171.1 Y200.751 E.01593
N2315 G1 X190.751 Y181.1 E.829
N2316 G1 X190.751 Y180.566 E.01593
N2317 G1 X170.566 Y200.751 E.85153
N2318 G1 X170.032 Y200.751 E.01593
N2319 G1 X190.751 Y180.032 E.87406
N2320 G1 X190.751 Y179.498 E.01593
N2321 G1 X169.498 Y200.751 E.89659
N2322 G1 X168.964 Y200.751 E.01593
N2323 G1 X190.751 Y178.964 E.91912
N2324 G1 X190.751 Y178.43 E.01593
N2325 G1 X168.43 Y200.751 E.94165
N2326 G1 X167.896 Y200.751 E.01593
N2327 G1 X190.751 Y177.896 E.96418
N2328 G1 X190.751 Y177.362 E.01593
N2329 G1 X167.362 Y200.751 E.98671
N2330 G1 X166.828 Y200.751 E.01593
N2331 G1 X190.751 Y176.828 E1.00924
N2332 G1 X190.751 Y176.294 E.01593
N2333 G1 X166.294 Y200.751 E1.03177
N2334 G1 X165.759 Y200.751 E.01593
N2335 G1 X190.751 Y175.76 E1.0543
N2336 G1 X190.751 Y175.225 E.01593
N2337 G1 X165.225 Y200.751 E1.07683
N2338 G1 X164.691 Y200.751 E.01593
N2339 G1 X190.751 Y174.691 E1.09936
N2340 G1 X190.751 Y174.157 E.01593
N2341 G1 X164.157 Y200.751 E1.12189
N2342 G1 X163.623 Y200.751 E.01593
N2343 G1 X190.751 Y173.623 E1.14442
N2344 G1 X190.751 Y173.089 E.01593
N2345 G1 X163.089 Y200.751 E1.16696
N2346 G1 X162.555 Y200.751 E.01593
N2347 G1 X190.751 Y172.555 E1.18949
N2348 G1 X190.751 Y172.021 E.01593
N2349 G1 X162.021 Y200.751 E1.21202
N2350 G1 X161.487 Y200.751 E.01593
N2351 G1 X190.751 Y171.487 E1.23455
N2352 G1 X190.751 Y170.953 E.01593
N2353 G1 X160.953 Y200.751 E1.25708
N2354 G1 X160.419 Y200.751 E.01593
N2355 G1 X190.751 Y170.419 E1.27961
N2356 G1 X190.751 Y169.885 E.01593
N2357 G1 X159.885 Y200.751 E1.30214
N2358 G1 X159.351 Y200.751 E.01593
N2359 G1 X190.751 Y169.351 E1.32467
N2360 G1 X190.751 Y168.817 E.01593
N2361 G1 X159.249 Y200.318 E1.32894
N2362 G1 X159.249 Y199.784 E.01593
N2363 G1 X190.751 Y168.283 E1.32894
N2364 G1 X190.751 Y167.749 E.01593
N2365 G1 X159.249 Y199.25 E1.32894
N2366 G1 X159.249 Y198.716 E.01593
N2367 G1 X190.751 Y167.214 E1.32894
N2368 G1 X190.751 Y166.68 E.01593
N2369 G1 X159.249 Y198.181 E1.32894
N2370 G1 X159.249 Y197.647 E.01593
N2371 G1 X190.751 Y166.146 E1.32894
N2372 G1 X190.751 Y165.612 E.01593
N2373 G1 X159.249 Y197.113 E1.32894
N2374 G1 X159.249 Y196.579 E.01593
N2375 G1 X190.751 Y165.078 E1.32894
N2376 G1 X190.751 Y164.544 E.01593
N2377 G1 X159.249 Y196.045 E1.32894
N2378 G1 X159.249 Y195.511 E.01593
N2379 G1 X190.751 Y164.01 E1.32894
N2380 G1 X190.751 Y163.476 E.01593
N2381 G1 X159.249 Y194.977 E1.32894
N2382 G1 X159.249 Y194.443 E.01593
N2383 G1 X190.751 Y162.942 E1.32894
N2384 G1 X190.751 Y162.408 E.01593
N2385 G1 X159.249 Y193.909 E1.32894
N2386 G1 X159.249 Y193.375 E.01593
N2388 G1 X190.751 Y161.874 E1.32894
N2389 G1 X190.751 Y161.34 E.01593
N2391 G1 X159.249 Y192.841 E1.32894
N2392 G1 X159.249 Y192.307 E.01593
N2393 G1 X190.751 Y160.806 E1.32894
N2394 G1 X190.751 Y160.272 E.01593
N2395 G1 X159.249 Y191.773 E1.32894
N2396 G1 X159.249 Y191.239 E.01593
N2397 G1 X190.751 Y159.738 E1.32894
N2398 G1 X190.751 Y159.204 E.01593
N2399 G1 X159.249 Y190.705 E1.32894
N2400 G1 X159.249 Y190.171 E.01593
N2401 G1 X190.751 Y158.669 E1.32894
N2402 G1 X190.751 Y158.135 E.01593
N2403 G1 X159.249 Y189.636 E1.32894
N2404 G1 X159.249 Y189.102 E.01593
N2405 G1 X190.751 Y157.601 E1.32894
N2406 G1 X190.751 Y157.067 E.01593
N2407 G1 X159.249 Y188.568 E1.32894
N2408 G1 X159.249 Y188.034 E.01593
N2409 G1 X190.751 Y156.533 E1.32894
N2410 G1 X190.751 Y155.999 E.01593
N2411 G1 X159.249 Y187.5 E1.32894
N2412 G1 X159.249 Y186.966 E.01593
N2413 G1 X190.751 Y155.465 E1.32894
N2414 G1 X190.751 Y154.931 E.01593
N2415 G1 X159.249 Y186.432 E1.32894
N2416 G1 X159.249 Y185.898 E.01593
N2417 G1 X190.751 Y154.397 E1.32894
N2418 G1 X190.751 Y153.863 E.01593
N2419 G1 X159.249 Y185.364 E1.32894
N2420 G1 X159.249 Y184.83 E.01593
N2421 G1 X190.751 Y153.329 E1.32894
N2422 G1 X190.751 Y152.795 E.01593
N2423 G1 X159.249 Y184.296 E1.32894
N2424 G1 X159.249 Y183.762 E.01593
N2425 G1 X190.751 Y152.261 E1.32894
N2426 G1 X190.751 Y151.727 E.01593
N2427 G1 X159.249 Y183.228 E1.32894
N2428 G1 X159.249 Y182.694 E.01593
N2429 G1 X190.751 Y151.193 E1.32894
N2430 G1 X190.751 Y150.659 E.01593
N2431 G1 X159.249 Y182.16 E1.32894
N2432 G1 X159.249 Y181.626 E.01593
N2433 G1 X190.751 Y150.124 E1.32894
N2434 G1 X190.751 Y149.59 E.01593
N2435 G1 X159.249 Y181.091 E1.32894
N2436 G1 X159.249 Y180.557 E.01593
N2437 G1 X190.751 Y149.056 E1.32894
N2438 G1 X190.751 Y148.522 E.01593
N2439 G1 X159.249 Y180.023 E1.32894
N2440 G1 X159.249 Y179.489 E.01593
N2441 G1 X190.751 Y147.988 E1.32894
N2442 G1 X190.751 Y147.454 E.01593
N2443 G1 X159.249 Y178.955 E1.32894
N2444 G1 X159.249 Y178.421 E.01593
N2445 G1 X190.751 Y146.92 E1.32894
N2446 G1 X190.751 Y146.386 E.01593
N2447 G1 X159.249 Y177.887 E1.32894
N2448 G1 X159.249 Y177.353 E.01593
N2449 G1 X190.751 Y145.852 E1.32894
N2450 G1 X190.751 Y145.318 E.01593
N2451 G1 X159.249 Y176.819 E1.32894
N2452 G1 X159.249 Y176.285 E.01593
N2453 G1 X190.751 Y144.784 E1.32894
N2454 G1 X190.751 Y144.25 E.01593
N2455 G1 X159.249 Y175.751 E1.32894
N2456 G1 X159.249 Y175.217 E.01593
N2457 G1 X190.751 Y143.716 E1.32894
N2458 G1 X190.751 Y143.182 E.01593
N2459 G1 X159.249 Y174.683 E1.32894
N2460 G1 X159.249 Y174.149 E.01593
N2461 G1 X190.751 Y142.648 E1.32894
N2462 G1 X190.751 Y142.113 E.01593
N2463 G1 X159.249 Y173.615 E1.32894
N2464 G1 X159.249 Y173.081 E.01593
N2465 G1 X190.751 Y141.579 E1.32894
N2466 G1 X190.751 Y141.045 E.01593
N2467 G1 X159.249 Y172.546 E1.32894
N2468 G1 X159.249 Y172.012 E.01593
N2469 G1 X190.751 Y140.511 E1.32894
N2470 G1 X190.751 Y139.977 E.01593
N2471 G1 X159.249 Y171.478 E1.32894
N2472 G1 X159.249 Y170.944 E.01593
N2473 G1 X190.751 Y139.443 E1.32894
N2474 G1 X190.751 Y138.909 E.01593
N2475 G1 X159.249 Y170.41 E1.32894
N2476 G1 X159.249 Y169.876 E.01593
N2477 G1 X190.751 Y138.375 E1.32894
N2478 G1 X190.751 Y137.841 E.01593
N2479 G1 X159.249 Y169.342 E1.32894
N2480 G1 X159.249 Y168.808 E.01593
N2481 G1 X190.751 Y137.307 E1.32894
N2482 G1 X190.751 Y136.773 E.01593
N2483 G1 X159.249 Y168.274 E1.32894
N2484 G1 X159.249 Y167.74 E.01593
N2485 G1 X190.751 Y136.239 E1.32894
N2486 G1 X190.751 Y135.705 E.01593
N2487 G1 X159.249 Y167.206 E1.32894
N2488 G1 X159.249 Y166.672 E.01593
N2489 G1 X190.751 Y135.171 E1.32894
N2490 G1 X190.751 Y134.637 E.01593
N2491 G1 X159.249 Y166.138 E1.32894
N2492 G1 X159.249 Y165.604 E.01593
N2493 G1 X190.751 Y134.103 E1.32894
N2494 G1 X190.751 Y133.568 E.01593
N2495 G1 X159.249 Y165.07 E1.32894
N2496 G1 X159.249 Y164.535 E.01593
N2497 G1 X190.751 Y133.034 E1.32894
N2498 G1 X190.751 Y132.5 E.01593
N2499 G1 X159.249 Y164.001 E1.32894
N2500 G1 X159.249 Y163.467 E.01593
N2501 G1 X190.751 Y131.966 E1.32894
N2502 G1 X190.751 Y131.432 E.01593
N2503 G1 X159.249 Y162.933 E1.32894
N2504 G1 X159.249 Y162.399 E.01593
N2505 G1 X190.751 Y130.898 E1.32894
N2506 G1 X190.751 Y130.364 E.01593
N2507 G1 X159.249 Y161.865 E1.32894
N2508 G1 X159.249 Y161.331 E.01593
N2509 G1 X190.751 Y129.83 E1.32894
N2510 G1 X190.751 Y129.296 E.01593
N2511 G1 X159.249 Y160.797 E1.32894
N2512 G1 X159.249 Y160.263 E.01593
N2513 G1 X190.751 Y128.762 E1.32894
N2514 G1 X190.751 Y128.228 E.01593
N2515 G1 X159.249 Y159.729 E1.32894
N2516 G1 X159.249 Y159.195 E.01593
N2517 G1 X190.751 Y127.694 E1.32894
N2518 G1 X190.751 Y127.16 E.01593
N2520 G1 X159.249 Y158.661 E1.32894
N2521 G1 X159.249 Y158.127 E.01593
N2522 G1 X190.751 Y126.626 E1.32894
N2523 G1 X190.751 Y126.092 E.01593
N2524 G1 X159.249 Y157.593 E1.32894
N2525 G1 X159.249 Y157.059 E.01593
N2526 G1 X190.751 Y125.558 E1.32894
N2527 G1 X190.751 Y125.023 E.01593
N2528 G1 X159.249 Y156.525 E1.32894
N2529 G1 X159.249 Y155.99 E.01593
N2530 G1 X190.751 Y124.489 E1.32894
N2531 G1 X190.751 Y123.955 E.01593
N2532 G1 X159.249 Y155.456 E1.32894
N2533 G1 X159.249 Y154.922 E.01593
N2534 G1 X190.751 Y123.421 E1.32894
N2535 G1 X190.751 Y122.887 E.01593
N2536 G1 X159.249 Y154.388 E1.32894
N2537 G1 X159.249 Y153.854 E.01593
N2538 G1 X190.751 Y122.353 E1.32894
N2539 G1 X190.751 Y121.819 E.01593
N2540 G1 X159.249 Y153.32 E1.32894
N2541 G1 X159.249 Y152.786 E.01593
N2542 G1 X190.751 Y121.285 E1.32894
N2543 G1 X190.751 Y120.751 E.01593
N2544 G1 X159.249 Y152.252 E1.32894
N2545 G1 X159.249 Y151.718 E.01593
N2546 G1 X190.751 Y120.217 E1.32894
N2547 G1 X190.751 Y119.683 E.01593
N2548 G1 X159.249 Y151.184 E1.32894
N2549 G1 X159.249 Y150.65 E.01593
N2550 G1 X190.65 Y119.249 E1.32469
N2551 G1 X190.116 Y119.249 E.01593
N2552 G1 X159.249 Y150.116 E1.30216
N2553 G1 X159.249 Y149.582 E.01593
N2554 G1 X189.582 Y119.249 E1.27963
N2555 G1 X189.048 Y119.249 E.01593
N2556 G1 X159.249 Y149.048 E1.2571
N2557 G1 X159.249 Y148.514 E.01593
N2558 G1 X188.514 Y119.249 E1.23457
N2559 G1 X187.98 Y119.249 E.01593
N2560 G1 X159.249 Y147.98 E1.21204
N2561 G1 X159.249 Y147.445 E.01593
N2562 G1 X187.445 Y119.249 E1.18951
N2563 G1 X186.911 Y119.249 E.01593
N2564 G1 X159.249 Y146.911 E1.16698
N2565 G1 X159.249 Y146.377 E.01593
N2566 G1 X186.377 Y119.249 E1.14445
N2567 G1 X185.843 Y119.249 E.01593
N2568 G1 X159.249 Y145.843 E1.12192
N2569 G1 X159.249 Y145.309 E.01593
N2570 G1 X185.309 Y119.249 E1.09939
N2571 G1 X184.775 Y119.249 E.01593
N2572 G1 X159.249 Y144.775 E1.07686
N2573 G1 X159.249 Y144.241 E.01593
N2574 G1 X184.241 Y119.249 E1.05433
N2575 G1 X183.707 Y119.249 E.01593
N2576 G1 X159.249 Y143.707 E1.0318
N2577 G1 X159.249 Y143.173 E.01593
N2578 G1 X183.173 Y119.249 E1.00927
N2579 G1 X182.639 Y119.249 E.01593
N2580 G1 X159.249 Y142.639 E.98673
N2581 G1 X159.249 Y142.105 E.01593
N2582 G1 X182.105 Y119.249 E.9642
N2583 G1 X181.571 Y119.249 E.01593
N2584 G1 X159.249 Y141.571 E.94167
N2585 G1 X159.249 Y141.037 E.01593
N2586 G1 X181.037 Y119.249 E.91914
N2587 G1 X180.503 Y119.249 E.01593
N2588 G1 X159.249 Y140.503 E.89661
N2589 G1 X159.249 Y139.969 E.01593
N2590 G1 X179.969 Y119.249 E.87408
N2591 G1 X179.435 Y119.249 E.01593
N2592 G1 X159.249 Y139.435 E.85155
N2593 G1 X159.249 Y138.9 E.01593
N2594 G1 X178.9 Y119.249 E.82902
N2595 G1 X178.366 Y119.249 E.01593
N2596 G1 X159.249 Y138.366 E.80649
N2597 G1 X159.249 Y137.832 E.01593
N2598 G1 X177.832 Y119.249 E.78396
N2599 G1 X177.298 Y119.249 E.01593
N2600 G1 X159.249 Y137.298 E.76143
N2601 G1 X159.249 Y136.764 E.01593
N2602 G1 X176.764 Y119.249 E.7389
N2603 G1 X176.23 Y119.249 E.01593
N2604 G1 X159.249 Y136.23 E.71637
N2605 G1 X159.249 Y135.696 E.01593
N2606 G1 X175.696 Y119.249 E.69384
N2607 G1 X175.162 Y119.249 E.01593
N2609 G1 X159.249 Y135.162 E.67131
N2610 G1 X159.249 Y134.628 E.01593
N2611 G1 X174.628 Y119.249 E.64878
N2612 G1 X174.094 Y119.249 E.01593
N2613 G1 X159.249 Y134.094 E.62624
N2614 G1 X159.249 Y133.56 E.01593
N2615 G1 X173.56 Y119.249 E.60371
N2616 G1 X173.026 Y119.249 E.01593
N2617 G1 X159.249 Y133.026 E.58118
N2618 G1 X159.249 Y132.492 E.01593
N2619 G1 X172.492 Y119.249 E.55865
N2620 G1 X171.958 Y119.249 E.01593
N2621 G1 X159.249 Y131.958 E.53612
N2622 G1 X159.249 Y131.424 E.01593
N2623 G1 X171.424 Y119.249 E.51359
N2624 G1 X170.89 Y119.249 E.01593
N2625 G1 X159.249 Y130.889 E.49106
N2626 G1 X159.249 Y130.355 E.01593
N2627 G1 X170.355 Y119.249 E.46853
N2628 G1 X169.821 Y119.249 E.01593
N2629 G1 X159.249 Y129.821 E.446
N2630 G1 X159.249 Y129.287 E.01593
N2631 G1 X169.287 Y119.249 E.42347
N2632 G1 X168.753 Y119.249 E.01593
N2633 G1 X159.249 Y128.753 E.40094
N2634 G1 X159.249 Y128.219 E.01593
N2635 G1 X168.219 Y119.249 E.37841
N2636 G1 X167.685 Y119.249 E.01593
N2637 G1 X159.249 Y127.685 E.35588
N2638 G1 X159.249 Y127.151 E.01593
N2639 G1 X167.151 Y119.249 E.33335
N2640 G1 X166.617 Y119.249 E.01593
N2641 G1 X159.249 Y126.617 E.31082
N2642 G1 X159.249 Y126.083 E.01593
N2643 G1 X166.083 Y119.249 E.28828
N2644 G1 X165.549 Y119.249 E.01593
N2645 G1 X159.249 Y125.549 E.26575
N2646 G1 X159.249 Y125.015 E.01593
N2647 G1 X165.015 Y119.249 E.24322
N2648 G1 X164.481 Y119.249 E.01593
N2649 G1 X159.249 Y124.481 E.22069
N2650 G1 X159.249 Y123.947 E.01593
N2651 G1 X163.947 Y119.249 E.19816
N2652 G1 X163.413 Y119.249 E.01593
N2653 G1 X159.249 Y123.413 E.17563
N2654 G1 X159.249 Y122.879 E.01593
N2655 G1 X162.879 Y119.249 E.1531
N2656 G1 X162.344 Y119.249 E.01593
N2657 G1 X159.249 Y122.344 E.13057
N2658 G1 X159.249 Y121.81 E.01593
N2659 G1 X161.81 Y119.249 E.10804
N2660 G1 X161.276 Y119.249 E.01593
N2661 G1 X159.249 Y121.276 E.08551
N2662 G1 X159.249 Y120.742 E.01593
N2663 G1 X160.742 Y119.249 E.06298
N2664 G1 X160.208 Y119.249 E.01593
N2665 G1 X159.249 Y120.208 E.04045
N2666 G1 X159.249 Y119.674 E.01593
N2667 G1 X159.844 Y119.08 E.02508
N2669 G1 X159.249 Y119.674 E-.31942
N2670 G1 X159.249 Y120.208 E-.20295
N2671 G1 X159.692 Y119.766 E-.23763
T0 ;TOOL_CHANGE:0 ; Revert to base toolN2721 G1 Z.6
N2722 G1 E.8 F1800
N2723 ; FEATURE: Inner wall
N2724 ; LINE_WIDTH: 0.45
N2725 ; LAYER_HEIGHT: 0.2
N2726 G1 F4421.739
N2727 M204 S8000
N2728 G1 X158.916 Y201.084 E1.03439
N2729 G1 X158.916 Y118.916 E2.64221
N2730 G1 X191.084 Y118.916 E1.03439
N2731 G1 X191.084 Y201.024 E2.64028
N2732 ; COOLING_NODE: 0
N2733 M204 S10000
N2734 G1 X191.491 Y201.491 F60000
N2735 G1 F4421.739
N2736 M204 S8000
N2737 G1 X158.509 Y201.491 E1.06057
N2738 G1 X158.509 Y118.509 E2.66839
N2739 G1 X191.491 Y118.509 E1.06057
N2740 G1 X191.491 Y201.431 E2.66646
N2741 ; COOLING_NODE: 0
N2742 M204 S10000
N2743 G1 X191.898 Y201.898 F60000
N2744 G1 F4421.739
N2745 M204 S8000
N2746 G1 X158.102 Y201.898 E1.08675
N2747 G1 X158.102 Y118.102 E2.69457
N2748 G1 X191.898 Y118.102 E1.08675
N2749 G1 X191.898 Y201.838 E2.69264
N2750 ; COOLING_NODE: 0
N2751 M204 S10000
N2752 G1 X192.29 Y202.29 F60000
N2753 ; FEATURE: Outer wall
N2754 ; LINE_WIDTH: 0.42
N2755 G1 F4773.528
N2756 M204 S5000
N2757 G1 X157.71 Y202.29 E1.03002
N2758 G1 X157.71 Y117.71 E2.51935
N2759 G1 X192.29 Y117.71 E1.03002
N2760 G1 X192.29 Y202.23 E2.51756
N2761 M73 P27 R45
N2762 G1 E-.8 F1800
N2763 M204 S10000
N2764 G1 X184.672 Y201.754 Z1 F60000
N2765 G1 X159.08 Y200.156 Z1
N2766 G1 Z.6
N2767 G1 E.8 F1800
N2768 ; FEATURE: Internal solid infill
N2769 ; LINE_WIDTH: 0.42056
N2770 G1 F4766.444
N2771 M204 S8000
N2772 G1 X159.674 Y200.751 E.02508
N2773 G1 X160.208 Y200.751 E.01593
N2774 G1 X159.249 Y199.792 E.04045
N2775 G1 X159.249 Y199.258 E.01593
N2776 G1 X160.742 Y200.751 E.06298
N2777 G1 X161.276 Y200.751 E.01593
N2778 G1 X159.249 Y198.724 E.08551
N2779 G1 X159.249 Y198.19 E.01593
N2780 G1 X161.81 Y200.751 E.10804
N2781 G1 X162.344 Y200.751 E.01593
N2782 G1 X159.249 Y197.656 E.13057
N2783 G1 X159.249 Y197.121 E.01593
N2784 G1 X162.879 Y200.751 E.1531
N2785 G1 X163.413 Y200.751 E.01593
N2786 G1 X159.249 Y196.587 E.17563
N2787 G1 X159.249 Y196.053 E.01593
N2788 G1 X163.947 Y200.751 E.19816
N2789 G1 X164.481 Y200.751 E.01593
N2790 G1 X159.249 Y195.519 E.22069
N2791 G1 X159.249 Y194.985 E.01593
N2792 G1 X165.015 Y200.751 E.24322
N2793 G1 X165.549 Y200.751 E.01593
N2794 G1 X159.249 Y194.451 E.26575
N2795 G1 X159.249 Y193.917 E.01593
N2796 G1 X166.083 Y200.751 E.28828
N2797 G1 X166.617 Y200.751 E.01593
N2798 G1 X159.249 Y193.383 E.31082
N2799 G1 X159.249 Y192.849 E.01593
N2800 G1 X167.151 Y200.751 E.33335
N2801 G1 X167.685 Y200.751 E.01593
N2802 G1 X159.249 Y192.315 E.35588
N2803 G1 X159.249 Y191.781 E.01593
N2804 G1 X168.219 Y200.751 E.37841
N2805 G1 X168.753 Y200.751 E.01593
N2806 G1 X159.249 Y191.247 E.40094
N2807 G1 X159.249 Y190.713 E.01593
N2808 G1 X169.287 Y200.751 E.42347
N2809 G1 X169.821 Y200.751 E.01593
N2810 G1 X159.249 Y190.179 E.446
N2811 G1 X159.249 Y189.645 E.01593
N2812 G1 X170.355 Y200.751 E.46853
N2813 G1 X170.89 Y200.751 E.01593
N2814 G1 X159.249 Y189.11 E.49106
N2815 G1 X159.249 Y188.576 E.01593
N2816 G1 X171.424 Y200.751 E.51359
N2817 G1 X171.958 Y200.751 E.01593
N2818 G1 X159.249 Y188.042 E.53612
N2819 G1 X159.249 Y187.508 E.01593
N2820 G1 X172.492 Y200.751 E.55865
N2821 G1 X173.026 Y200.751 E.01593
N2822 G1 X159.249 Y186.974 E.58118
N2823 G1 X159.249 Y186.44 E.01593
N2824 G1 X173.56 Y200.751 E.60371
N2825 G1 X174.094 Y200.751 E.01593
N2826 G1 X159.249 Y185.906 E.62624
N2827 G1 X159.249 Y185.372 E.01593
N2828 G1 X174.628 Y200.751 E.64877
N2829 G1 X175.162 Y200.751 E.01593
N2830 G1 X159.249 Y184.838 E.67131
N2831 G1 X159.249 Y184.304 E.01593
N2832 G1 X175.696 Y200.751 E.69384
N2833 G1 X176.23 Y200.751 E.01593
N2834 G1 X159.249 Y183.77 E.71637
N2835 G1 X159.249 Y183.236 E.01593
N2836 G1 X176.764 Y200.751 E.7389
N2837 G1 X177.298 Y200.751 E.01593
N2838 G1 X159.249 Y182.702 E.76143
N2839 G1 X159.249 Y182.168 E.01593
N2840 G1 X177.832 Y200.751 E.78396
N2841 G1 X178.366 Y200.751 E.01593
N2842 G1 X159.249 Y181.634 E.80649
N2843 G1 X159.249 Y181.1 E.01593
N2844 G1 X178.9 Y200.751 E.82902
N2845 G1 X179.435 Y200.751 E.01593
N2846 G1 X159.249 Y180.565 E.85155
N2847 G1 X159.249 Y180.031 E.01593
N2848 G1 X179.969 Y200.751 E.87408
N2849 G1 X180.503 Y200.751 E.01593
N2850 G1 X159.249 Y179.497 E.89661
N2851 G1 X159.249 Y178.963 E.01593
N2852 G1 X181.037 Y200.751 E.91914
N2853 G1 X181.571 Y200.751 E.01593
N2854 G1 X159.249 Y178.429 E.94167
N2855 G1 X159.249 Y177.895 E.01593
N2856 G1 X182.105 Y200.751 E.9642
N2857 G1 X182.639 Y200.751 E.01593
N2858 G1 X159.249 Y177.361 E.98673
N2859 G1 X159.249 Y176.827 E.01593
N2860 G1 X183.173 Y200.751 E1.00927
N2861 G1 X183.707 Y200.751 E.01593
N2862 G1 X159.249 Y176.293 E1.0318
N2863 G1 X159.249 Y175.759 E.01593
N2864 G1 X184.241 Y200.751 E1.05433
N2865 G1 X184.775 Y200.751 E.01593
N2866 G1 X159.249 Y175.225 E1.07686
N2867 G1 X159.249 Y174.691 E.01593
N2868 G1 X185.309 Y200.751 E1.09939
N2869 G1 X185.843 Y200.751 E.01593
N2870 G1 X159.249 Y174.157 E1.12192
N2871 G1 X159.249 Y173.623 E.01593
N2872 G1 X186.377 Y200.751 E1.14445
N2873 G1 X186.911 Y200.751 E.01593
N2874 G1 X159.249 Y173.089 E1.16698
N2875 G1 X159.249 Y172.555 E.01593
N2876 G1 X187.445 Y200.751 E1.18951
N2877 G1 X187.98 Y200.751 E.01593
N2878 G1 X159.249 Y172.02 E1.21204
N2879 G1 X159.249 Y171.486 E.01593
N2880 G1 X188.514 Y200.751 E1.23457
N2881 G1 X189.048 Y200.751 E.01593
N2882 G1 X159.249 Y170.952 E1.2571
N2883 G1 X159.249 Y170.418 E.01593
N2884 G1 X189.582 Y200.751 E1.27963
N2885 G1 X190.116 Y200.751 E.01593
N2886 G1 X159.249 Y169.884 E1.30216
N2887 G1 X159.249 Y169.35 E.01593
N2888 G1 X190.65 Y200.751 E1.32469
N2889 G1 X190.751 Y200.751 E.003
N2890 G1 X190.751 Y200.317 E.01293
N2891 G1 X159.249 Y168.816 E1.32894
N2892 G1 X159.249 Y168.282 E.01593
N2893 G1 X190.751 Y199.783 E1.32894
N2894 G1 X190.751 Y199.249 E.01593
N2895 G1 X159.249 Y167.748 E1.32894
N2896 G1 X159.249 Y167.214 E.01593
N2897 G1 X190.751 Y198.715 E1.32894
N2898 G1 X190.751 Y198.181 E.01593
N2899 G1 X159.249 Y166.68 E1.32894
N2900 G1 X159.249 Y166.146 E.01593
N2901 G1 X190.751 Y197.647 E1.32894
N2902 G1 X190.751 Y197.113 E.01593
N2903 G1 X159.249 Y165.612 E1.32894
N2904 G1 X159.249 Y165.078 E.01593
N2905 G1 X190.751 Y196.579 E1.32894
N2906 G1 X190.751 Y196.045 E.01593
N2907 G1 X159.249 Y164.544 E1.32894
N2908 G1 X159.249 Y164.01 E.01593
N2909 G1 X190.751 Y195.511 E1.32894
N2910 G1 X190.751 Y194.977 E.01593
N2911 G1 X159.249 Y163.475 E1.32894
N2912 G1 X159.249 Y162.941 E.01593
N2913 G1 X190.751 Y194.442 E1.32894
N2914 G1 X190.751 Y193.908 E.01593
N2915 G1 X159.249 Y162.407 E1.32894
N2916 G1 X159.249 Y161.873 E.01593
N2917 G1 X190.751 Y193.374 E1.32894
N2918 G1 X190.751 Y192.84 E.01593
N2919 G1 X159.249 Y161.339 E1.32894
N2920 G1 X159.249 Y160.805 E.01593
N2921 G1 X190.751 Y192.306 E1.32894
N2922 G1 X190.751 Y191.772 E.01593
N2923 G1 X159.249 Y160.271 E1.32894
N2924 G1 X159.249 Y159.737 E.01593
N2925 G1 X190.751 Y191.238 E1.32894
N2926 G1 X190.751 Y190.704 E.01593
N2927 G1 X159.249 Y159.203 E1.32894
N2928 G1 X159.249 Y158.669 E.01593
N2929 G1 X190.751 Y190.17 E1.32894
N2930 G1 X190.751 Y189.636 E.01593
N2931 G1 X159.249 Y158.135 E1.32894
N2932 G1 X159.249 Y157.601 E.01593
N2933 G1 X190.751 Y189.102 E1.32894
N2934 G1 X190.751 Y188.568 E.01593
N2935 G1 X159.249 Y157.067 E1.32894
N2936 G1 X159.249 Y156.533 E.01593
N2937 G1 X190.751 Y188.034 E1.32894
N2938 G1 X190.751 Y187.5 E.01593
N2939 G1 X159.249 Y155.999 E1.32894
N2940 G1 X159.249 Y155.464 E.01593
N2941 G1 X190.751 Y186.966 E1.32894
N2942 G1 X190.751 Y186.432 E.01593
N2943 G1 X159.249 Y154.93 E1.32894
N2944 G1 X159.249 Y154.396 E.01593
N2945 M104 T0 S240 N0 ;Multi extruder pre heating
N2946 G1 X190.751 Y185.897 E1.32894
N2947 G1 X190.751 Y185.363 E.01593
N2948 G1 X159.249 Y153.862 E1.32894
N2949 G1 X159.249 Y153.328 E.01593
N2950 G1 X190.751 Y184.829 E1.32894
N2951 G1 X190.751 Y184.295 E.01593
N2952 M73 P28 R45
N2953 G1 X159.249 Y152.794 E1.32894
N2954 G1 X159.249 Y152.26 E.01593
N2955 G1 X190.751 Y183.761 E1.32894
N2956 G1 X190.751 Y183.227 E.01593
N2957 G1 X159.249 Y151.726 E1.32894
N2958 G1 X159.249 Y151.192 E.01593
N2959 G1 X190.751 Y182.693 E1.32894
N2960 G1 X190.751 Y182.159 E.01593
N2961 G1 X159.249 Y150.658 E1.32894
N2962 G1 X159.249 Y150.124 E.01593
N2963 G1 X190.751 Y181.625 E1.32894
N2964 G1 X190.751 Y181.091 E.01593
N2965 G1 X159.249 Y149.59 E1.32894
N2966 G1 X159.249 Y149.056 E.01593
N2967 G1 X190.751 Y180.557 E1.32894
N2968 G1 X190.751 Y180.023 E.01593
N2969 G1 X159.249 Y148.522 E1.32894
N2970 G1 X159.249 Y147.988 E.01593
N2971 G1 X190.751 Y179.489 E1.32894
N2972 G1 X190.751 Y178.955 E.01593
N2973 G1 X159.249 Y147.454 E1.32894
N2974 G1 X159.249 Y146.919 E.01593
N2975 M73 P28 R44
N2976 G1 X190.751 Y178.421 E1.32894
N2977 G1 X190.751 Y177.886 E.01593
N2978 G1 X159.249 Y146.385 E1.32894
N2979 G1 X159.249 Y145.851 E.01593
N2980 G1 X190.751 Y177.352 E1.32894
N2981 G1 X190.751 Y176.818 E.01593
N2982 G1 X159.249 Y145.317 E1.32894
N2983 G1 X159.249 Y144.783 E.01593
N2984 G1 X190.751 Y176.284 E1.32894
N2985 G1 X190.751 Y175.75 E.01593
N2986 G1 X159.249 Y144.249 E1.32894
N2987 G1 X159.249 Y143.715 E.01593
N2988 G1 X190.751 Y175.216 E1.32894
N2989 G1 X190.751 Y174.682 E.01593
N2990 G1 X159.249 Y143.181 E1.32894
N2991 G1 X159.249 Y142.647 E.01593
N2992 G1 X190.751 Y174.148 E1.32894
N2993 G1 X190.751 Y173.614 E.01593
N2994 G1 X159.249 Y142.113 E1.32894
N2995 G1 X159.249 Y141.579 E.01593
N2996 G1 X190.751 Y173.08 E1.32894
N2997 G1 X190.751 Y172.546 E.01593
N2998 G1 X159.249 Y141.045 E1.32894
N2999 G1 X159.249 Y140.511 E.01593
N3000 G1 X190.751 Y172.012 E1.32894
N3001 G1 X190.751 Y171.478 E.01593
N3002 G1 X159.249 Y139.977 E1.32894
N3003 G1 X159.249 Y139.443 E.01593
N3004 G1 X190.751 Y170.944 E1.32894
N3005 G1 X190.751 Y170.41 E.01593
N3006 G1 X159.249 Y138.909 E1.32894
N3007 G1 X159.249 Y138.374 E.01593
N3008 G1 X190.751 Y169.876 E1.32894
N3009 G1 X190.751 Y169.341 E.01593
N3010 G1 X159.249 Y137.84 E1.32894
N3011 G1 X159.249 Y137.306 E.01593
N3012 G1 X190.751 Y168.807 E1.32894
N3013 G1 X190.751 Y168.273 E.01593
N3014 G1 X159.249 Y136.772 E1.32894
N3015 G1 X159.249 Y136.238 E.01593
N3016 G1 X190.751 Y167.739 E1.32894
N3017 G1 X190.751 Y167.205 E.01593
N3018 G1 X159.249 Y135.704 E1.32894
N3019 G1 X159.249 Y135.17 E.01593
N3020 G1 X190.751 Y166.671 E1.32894
N3021 G1 X190.751 Y166.137 E.01593
N3022 G1 X159.249 Y134.636 E1.32894
N3023 G1 X159.249 Y134.102 E.01593
N3024 G1 X190.751 Y165.603 E1.32894
N3025 G1 X190.751 Y165.069 E.01593
N3026 G1 X159.249 Y133.568 E1.32894
N3027 G1 X159.249 Y133.034 E.01593
N3028 G1 X190.751 Y164.535 E1.32894
N3029 G1 X190.751 Y164.001 E.01593
N3030 G1 X159.249 Y132.5 E1.32894
N3031 G1 X159.249 Y131.966 E.01593
N3032 G1 X190.751 Y163.467 E1.32894
N3033 G1 X190.751 Y162.933 E.01593
N3034 G1 X159.249 Y131.432 E1.32894
N3035 G1 X159.249 Y130.898 E.01593
N3036 G1 X190.751 Y162.399 E1.32894
N3037 G1 X190.751 Y161.865 E.01593
N3038 G1 X159.249 Y130.364 E1.32894
N3039 G1 X159.249 Y129.829 E.01593
N3040 G1 X190.751 Y161.331 E1.32894
N3041 G1 X190.751 Y160.796 E.01593
N3042 G1 X159.249 Y129.295 E1.32894
N3043 G1 X159.249 Y128.761 E.01593
N3044 G1 X190.751 Y160.262 E1.32894
N3045 G1 X190.751 Y159.728 E.01593
N3046 G1 X159.249 Y128.227 E1.32894
N3047 G1 X159.249 Y127.693 E.01593
N3048 G1 X190.751 Y159.194 E1.32894
N3049 G1 X190.751 Y158.66 E.01593
N3050 G1 X159.249 Y127.159 E1.32894
N3051 G1 X159.249 Y126.625 E.01593
N3052 G1 X190.751 Y158.126 E1.32894
N3053 G1 X190.751 Y157.592 E.01593
N3054 G1 X159.249 Y126.091 E1.32894
N3055 G1 X159.249 Y125.557 E.01593
N3056 G1 X190.751 Y157.058 E1.32894
N3057 G1 X190.751 Y156.524 E.01593
N3058 G1 X159.249 Y125.023 E1.32894
N3059 G1 X159.249 Y124.489 E.01593
N3060 G1 X190.751 Y155.99 E1.32894
N3061 G1 X190.751 Y155.456 E.01593
N3062 G1 X159.249 Y123.955 E1.32894
N3063 G1 X159.249 Y123.421 E.01593
N3064 G1 X190.751 Y154.922 E1.32894
N3065 G1 X190.751 Y154.388 E.01593
N3066 G1 X159.249 Y122.887 E1.32894
N3067 G1 X159.249 Y122.353 E.01593
N3068 G1 X190.751 Y153.854 E1.32894
N3069 G1 X190.751 Y153.32 E.01593
N3070 G1 X159.249 Y121.818 E1.32894
N3071 G1 X159.249 Y121.284 E.01593
N3072 G1 X190.751 Y152.786 E1.32894
N3073 G1 X190.751 Y152.251 E.01593
N3074 G1 X159.249 Y120.75 E1.32894
N3075 G1 X159.249 Y120.216 E.01593
N3076 G1 X190.751 Y151.717 E1.32894
N3077 G1 X190.751 Y151.183 E.01593
N3078 G1 X159.249 Y119.682 E1.32894
N3079 G1 X159.249 Y119.249 E.01291
N3080 G1 X159.351 Y119.249 E.00302
N3081 G1 X190.751 Y150.649 E1.32467
N3082 M73 P29 R44
N3083 G1 X190.751 Y150.115 E.01593
N3084 G1 X159.885 Y119.249 E1.30214
N3085 G1 X160.419 Y119.249 E.01593
N3086 G1 X190.751 Y149.581 E1.27961
N3087 G1 X190.751 Y149.047 E.01593
N3088 G1 X160.953 Y119.249 E1.25708
N3089 G1 X161.487 Y119.249 E.01593
N3090 G1 X190.751 Y148.513 E1.23455
N3091 G1 X190.751 Y147.979 E.01593
N3092 G1 X162.021 Y119.249 E1.21202
N3093 G1 X162.555 Y119.249 E.01593
N3094 G1 X190.751 Y147.445 E1.18949
N3095 G1 X190.751 Y146.911 E.01593
N3096 G1 X163.089 Y119.249 E1.16695
N3097 G1 X163.623 Y119.249 E.01593
N3098 G1 X190.751 Y146.377 E1.14442
N3099 G1 X190.751 Y145.843 E.01593
N3100 G1 X164.157 Y119.249 E1.12189
N3101 G1 X164.691 Y119.249 E.01593
N3102 G1 X190.751 Y145.309 E1.09936
N3103 G1 X190.751 Y144.775 E.01593
N3104 G1 X165.225 Y119.249 E1.07683
N3105 G1 X165.76 Y119.249 E.01593
N3106 G1 X190.751 Y144.24 E1.0543
N3107 G1 X190.751 Y143.706 E.01593
N3108 G1 X166.294 Y119.249 E1.03177
N3109 G1 X166.828 Y119.249 E.01593
N3110 G1 X190.751 Y143.172 E1.00924
N3111 G1 X190.751 Y142.638 E.01593
N3112 G1 X167.362 Y119.249 E.98671
N3113 G1 X167.896 Y119.249 E.01593
N3114 G1 X190.751 Y142.104 E.96418
N3115 G1 X190.751 Y141.57 E.01593
N3116 G1 X168.43 Y119.249 E.94165
N3117 G1 X168.964 Y119.249 E.01593
N3118 G1 X190.751 Y141.036 E.91912
N3119 G1 X190.751 Y140.502 E.01593
N3120 G1 X169.498 Y119.249 E.89659
N3121 G1 X170.032 Y119.249 E.01593
N3122 G1 X190.751 Y139.968 E.87406
N3123 G1 X190.751 Y139.434 E.01593
N3124 G1 X170.566 Y119.249 E.85153
N3125 G1 X171.1 Y119.249 E.01593
N3126 G1 X190.751 Y138.9 E.829
N3127 G1 X190.751 Y138.366 E.01593
N3128 G1 X171.634 Y119.249 E.80646
N3129 G1 X172.168 Y119.249 E.01593
N3130 G1 X190.751 Y137.832 E.78393
N3131 G1 X190.751 Y137.298 E.01593
N3132 G1 X172.702 Y119.249 E.7614
N3133 G1 X173.236 Y119.249 E.01593
N3134 G1 X190.751 Y136.764 E.73887
N3135 G1 X190.751 Y136.23 E.01593
N3136 G1 X173.77 Y119.249 E.71634
N3137 G1 X174.305 Y119.249 E.01593
N3138 G1 X190.751 Y135.695 E.69381
N3139 G1 X190.751 Y135.161 E.01593
N3140 G1 X174.839 Y119.249 E.67128
N3141 G1 X175.373 Y119.249 E.01593
N3142 G1 X190.751 Y134.627 E.64875
N3143 G1 X190.751 Y134.093 E.01593
N3144 G1 X175.907 Y119.249 E.62622
N3145 G1 X176.441 Y119.249 E.01593
N3146 G1 X190.751 Y133.559 E.60369
N3147 G1 X190.751 Y133.025 E.01593
N3148 G1 X176.975 Y119.249 E.58116
N3149 G1 X177.509 Y119.249 E.01593
N3150 G1 X190.751 Y132.491 E.55863
N3151 G1 X190.751 Y131.957 E.01593
N3152 G1 X178.043 Y119.249 E.5361
N3153 G1 X178.577 Y119.249 E.01593
N3154 G1 X190.751 Y131.423 E.51357
N3155 G1 X190.751 Y130.889 E.01593
N3156 G1 X179.111 Y119.249 E.49104
N3157 G1 X179.645 Y119.249 E.01593
N3158 G1 X190.751 Y130.355 E.4685
N3159 G1 X190.751 Y129.821 E.01593
N3160 G1 X180.179 Y119.249 E.44597
N3161 G1 X180.713 Y119.249 E.01593
N3162 G1 X190.751 Y129.287 E.42344
N3163 G1 X190.751 Y128.753 E.01593
N3164 G1 X181.247 Y119.249 E.40091
N3165 G1 X181.781 Y119.249 E.01593
N3166 G1 X190.751 Y128.219 E.37838
N3167 G1 X190.751 Y127.685 E.01593
N3168 G1 X182.315 Y119.249 E.35585
N3169 G1 X182.85 Y119.249 E.01593
N3170 G1 X190.751 Y127.15 E.33332
N3171 G1 X190.751 Y126.616 E.01593
N3172 G1 X183.384 Y119.249 E.31079
N3173 G1 X183.918 Y119.249 E.01593
N3174 G1 X190.751 Y126.082 E.28826
N3175 G1 X190.751 Y125.548 E.01593
N3176 G1 X184.452 Y119.249 E.26573
N3177 G1 X184.986 Y119.249 E.01593
N3178 G1 X190.751 Y125.014 E.2432
N3179 G1 X190.751 Y124.48 E.01593
N3180 G1 X185.52 Y119.249 E.22067
N3181 G1 X186.054 Y119.249 E.01593
N3182 G1 X190.751 Y123.946 E.19814
N3183 G1 X190.751 Y123.412 E.01593
N3184 G1 X186.588 Y119.249 E.17561
N3185 G1 X187.122 Y119.249 E.01593
N3186 G1 X190.751 Y122.878 E.15308
N3187 G1 X190.751 Y122.344 E.01593
N3188 G1 X187.656 Y119.249 E.13054
N3189 G1 X188.19 Y119.249 E.01593
N3190 G1 X190.751 Y121.81 E.10801
N3191 G1 X190.751 Y121.276 E.01593
N3192 G1 X188.724 Y119.249 E.08548
N3193 G1 X189.258 Y119.249 E.01593
N3194 G1 X190.751 Y120.742 E.06295
N3195 G1 X190.751 Y120.208 E.01593
N3196 G1 X189.792 Y119.249 E.04042
N3197 G1 X190.326 Y119.249 E.01593
N3198 G1 X190.92 Y119.843 E.02505
N3199 ; WIPE_START
N3200 G1 X190.326 Y119.249 E-.3191
N3201 G1 X189.792 Y119.249 E-.20294
N3202 G1 X190.235 Y119.692 E-.23796
N3203 ; WIPE_END
N3204 G1 E-.04 F1800
N3205 M204 S10000
N3206 G17
N3207 G3 Z1 I1.217 J0 P1  F60000
N3208 ; stop printing object, unique label id: 372
N3209 M625
N3210 ; object ids of layer 3 start: 372,407
N3211 M624 AwAAAAAAAAA=
N3212 ;======== H2D 20250527========
N3213 ; SKIPPABLE_START
N3214 ; SKIPTYPE: timelapse
N3215 M622.1 S1 ; for prev firware, default turned on
N3216 
N3217 M1002 judge_flag timelapse_record_flag
N3218 
N3219 M622 J1
N3220 M993 A2 B2 C2
N3221 M993 A0 B0 C0
N3222 
N3223 
N3224 
N3225 
N3226     M9711 M0 E1 X261 Y132 Z1 S11 C10 O0 T3000
N3227 
N3228 
N3229 
N3230 M993 A3 B3 C3
N3231 
N3232 M623
N3233 ; SKIPPABLE_END
N3234 
N3235 ; object ids of this layer3 end: 372,407
N3236 M625
N3237 G1 X195.495 Y279.064
N3238 G1 Z.6
N3239 G1 E.8 F1800
N3240 ; LAYER_HEIGHT: 0.200000
N3241 ; FEATURE: Prime tower
N3242 ; LINE_WIDTH: 0.500000
N3243 ; WIPE_TOWER_START
N3244 M204 S10000
N3245 G1  X195.995 Y279.564  
N3246 M204 S8000
N3247 G3  X193.533 Y281.605   I-4.373 J-2.768 E0.1236 F3938
N3248 G3  X190.885 Y280.355   I0.012 J-3.454 E0.1149
N3249 G2  X188.182 Y279.564   I-2.709 J4.247 E0.1085
N3250 G2  X174.618 Y279.568   I-6.687 J357.435 E0.5155
N3251 G2  X170.683 Y281.445   I0.499 J6.110 E0.1694
N3252 G3  X168.371 Y281.015   I-0.854 J-1.838 E0.0953
N3253 G1  X166.995 Y279.564   E0.0760
N3254 G3  X165.064 Y277.242   I3.871 J-5.183 E0.1159
N3255 G3  X166.240 Y274.649   I2.902 J-0.247 E0.1130
N3256 G2  X166.995 Y272.245   I-3.465 J-2.409 E0.0972
N3257 G2  X166.992 Y259.212   I-321.195 J-6.431 E0.4954
N3258 G2  X165.146 Y255.634   I-6.663 J1.171 E0.1554
N3259 G3  X165.485 Y253.656   I1.658 J-0.734 E0.0808
N3260 G1  X168.371 Y250.613   E0.1594
N3261 G3  X171.793 Y251.056   I1.525 J1.652 E0.1495
N3262 G2  X174.808 Y252.064   I3.021 J-4.025 E0.1229
N3263 G2  X188.372 Y252.060   I6.687 J-357.435 E0.5155
N3264 G2  X192.307 Y250.183   I-0.499 J-6.110 E0.1694
N3265 G3  X194.619 Y250.613   I0.854 J1.838 E0.0953
N3266 G1  X195.609 Y251.657   E0.0547
N3267 G1 E-0.8000 F1800
N3268 M204 S10000
N3269 G1  X197.329 Y253.471   F600
N3270 G1 E0.8000 F1800
N3271 M204 S8000
N3272 G3  X196.957 Y256.707   I-1.339 J1.486 E0.1447 F3938
N3273 G2  X195.995 Y259.382   I3.254 J2.680 E0.1102
N3274 G2  X195.998 Y272.416   I321.212 J6.432 E0.4954
N3275 G2  X197.844 Y275.994   I6.663 J-1.171 E0.1554
N3276 G3  X197.504 Y277.972   I-1.658 J0.734 E0.0808
N3277 G1  X195.995 Y279.564   E0.0834
N3278 ; WIPE_TOWER_END
N3279 G1  X195.495 Y252.064  
N3280 ; LAYER_HEIGHT: 0.200000
N3281 ; FEATURE: Prime tower
N3282 ; LINE_WIDTH: 0.500000
N3283 ; WIPE_TOWER_START
N3284 M204 S8000
N3285 G1  X167.495  E1.0642
N3286 G1  Y272.314  E0.2565
N3287 G1  X195.495  E1.0642
N3288 G1  Y279.064  E0.2565
N3289 M204 S10000
N3290 G1  X168.495 Y272.314  
N3291 ;--------------------
N3292 ; CP EMPTY GRID START
N3293 ; layer #4
N3294 M204 S8000
N3295 G1  Y279.064  E0.2565
N3296 M204 S10000
N3297 G1  X177.162 
N3298 M204 S8000
N3299 G1  Y272.314  E0.2565
N3300 M204 S10000
N3301 G1  X185.828 
N3302 M204 S8000
N3303 G1  Y279.064  E0.2565
N3304 M204 S10000
N3305 G1  X194.495 
N3306 M204 S8000
N3307 G1  Y272.314  E0.2565
N3308 ; CP EMPTY GRID END
N3309 ;------------------
N3310 
N3311 
N3312 
N3313 
N3314 
N3315 
N3316 ; WIPE_TOWER_END
N3317 ; LAYER_HEIGHT: 0.200000
N3318 ; FEATURE: Prime tower
N3319 ; LINE_WIDTH: 0.500000
N3320 ;--------------------
N3321 ; CP TOOLCHANGE START
N3322 ; toolchange #3
N3323 ; material : TPU -> TPU
N3324 ;--------------------
N3325 M220 B
N3326 M220 S100
N3327 ; WIPE_TOWER_START
N3328 G1 E-.8 F1800
N3329 G17
N3330 G3 Z1 I1.217 J0 P1  F60000
N3331 G1 X167.745 Y266.314
N3332 G1 Z.6
N3333 G1 E.8 F1800
N3334 ; LAYER_HEIGHT: 0.200000
N3335 ; FEATURE: Prime tower
N3336 ; LINE_WIDTH: 1.000000
N3337 ; NOZZLE_CHANGE_START OF0 NF1
N3338 M204 S8000
N3339 G1  X195.245 Y266.314  E2.1885 F1881
N3340 G1  Y267.564  E0.0995
N3341 G1  X167.745  E2.1885
N3342 G1  Y268.814  E0.0995
N3343 G1  X195.245  E2.1885
N3344 G1  Y270.064  E0.0995
N3345 G1  X167.745  E2.1885
N3346 G1  Y271.314  E0.0995
N3347 G1  X195.245  E2.1885
N3348 ; NOZZLE_CHANGE_END OF0 NF1
N3349 M104 T1 S147 N0 ;Multi extruder pre cooling
N3350 
N3351 ; WIPE_START
N3352 G1 F5400
N3353 M204 S8000
N3354 G1 X193.245 Y271.314 E-1.9
N3355 ; WIPE_END
N3356 G1 E-.1 F1800
N3357 M204 S10000
N3358 G17
N3359 G3 Z1 I1.217 J0 P1  F5400
N3360 ; filament end gcode 
N3361 
N3362 ;======== H2D ========
N3363 ;===== 20250604 =====
N3364 M993 A2 B2 C2 ; nozzle cam detection allow status save.
N3365 M993 A0 B0 C0 ; nozzle cam detection not allowed.
N3366 
N3367 
N3368 M1015.4 S0 ; disable E air printing detect
N3369 
N3370 
N3371 M620 S1A
N3372 M1002 gcode_claim_action : 4
N3373 M204 S9000
N3374 
N3375 G1 Z3.6 F1200
N3376 
N3377 M400
N3378 M106 P1 S0
N3379 M106 P2 S0
N3380 
N3381 
N3382 
N3383 
N3384 M620.10 A0 F149.669 L0 H0.4 T270 P255 S1
N3385 
N3386 
N3387 
N3388 M620.10 A1 F79.8237 L0 H0.4 T250 P240 S1
N3389 
N3390 
N3391 
N3392 M620.11 P0 I0 E0
N3393 
N3394 
N3395 
N3396 M620.11 K1 I0 R10 F200
N3397 
N3398 
N3399 M628 S1
N3400 
N3401 
N3402 M620.11 S1 L0 I0 R10 D8 E-10 F200
N3403 
N3404 
N3405 M629
N3406 
N3407 
N3408 M620.11 H2 C331
N3409 
N3410 
N3411 T1
N3412 M73 E3
N3413 
N3414 ;deretract
N3415 
N3416 
N3417 
N3418 ; VFLUSH_START
N3419 
N3420 
N3421 ;VG1 E0 F79
N3422 
N3423 
N3424 SYNC T0
N3425 
N3426 ; VFLUSH_END
N3427 
N3428 M1002 set_filament_type:TPU
N3429 
N3430 M400
N3431 M83
N3432 
N3433 
N3434 
N3435 M628 S0
N3436 ;VM109 S240
N3437 M629
N3438 M400
N3439 
N3440 M983.3 F1.33333 A0.4
N3441 
N3442 
N3443 M400
N3444 
N3445 G1 Y320 F30000
N3446 G1 X201
N3447 
N3448 M73 P29 R43
N3449 G1 Y295
N3450 G1 Y265 F18000
N3451 G1 Z3.6 F3000
N3452 
N3453 M204 S8000
N3454 
N3455 
N3456 M621 S1A
N3457 
N3458 M993 A3 B3 C3 ; nozzle cam detection allow status restore.
N3459 
N3460 
N3461 M1015.3 S1;enable tpu clog detect
N3462 
N3463 
N3464 
N3465 M1015.4 S0 ; disable E air printing detect
N3466 
N3467 
N3468 M620.6 I1 W1 ;enable ams air printing detect
N3469 M1002 gcode_claim_action : 0
N3470 M106 S255
N3471 M106 P2 S255
N3472 G1 X200 Y252.564 F60000
N3473 G1 Z.6
N3474 G1 X195.495 Y252.564 Z1
N3475 
N3476 ; filament start gcode
N3477 G1 Z.6
N3478 G1 E2 F1800
N3479 
N3480 G4 S0
N3481 ; CP TOOLCHANGE WIPE
N3482 ; LINE_WIDTH: 0.500000
N3483 M204 S8000
N3484 G1  X192.495 Y252.564  E0.1140 F1782
N3485 G1 E-0.8000 F1800
N3486 M204 S10000
N3487 G1  X196.995  F600
N3488 G1  X195.495  F240
N3489 G1  X195.995  F600
N3490 G1  Y253.064 
N3491 G1  X194.995 
N3492 G1  Y252.064 
N3493 G1  X196.495 
N3494 G1  Y253.564 
N3495 G1  X194.495 
N3496 G1  Y251.564 
N3497 G1  X192.495 Y252.564   F1782
N3498 G1 E0.8000 F1800
N3499 M204 S8000
N3500 G1  X167.495  E0.9502 F1782
N3501 G1  Y253.314  E0.0285
N3502 G1  X195.495  E1.0642 F2025
N3503 G1  Y254.064  E0.0285
N3504 M73 P30 R43
N3505 G1  X167.495  E1.0642 F2100
N3506 G1  Y254.814  E0.0285
N3507 G1  X195.495  E1.0642
N3508 G1  Y255.564  E0.0285
N3509 G1  X167.495  E1.0642
N3510 G1  Y256.314  E0.0285
N3511 G1  X195.495  E1.0642
N3512 G1  Y257.064  E0.0285
N3513 G1  X167.495  E1.0642
N3514 G1  Y257.814  E0.0285
N3515 G1  X195.495  E1.0642
N3516 G1  Y258.564  E0.0285
N3517 G1  X167.495  E1.0642
N3518 G1  Y259.314  E0.0285
N3519 G1  X195.495  E1.0642
N3520 G1  Y260.064  E0.0285
N3521 G1  X167.495  E1.0642
N3522 G1  Y260.814  E0.0285
N3523 G1  X195.495  E1.0642
N3524 G1  Y261.564  E0.0285
N3525 G1  X167.495  E1.0642
N3526 G1  Y262.314  E0.0285
N3527 G1  X195.495  E1.0642
N3528 G1  Y263.064  E0.0285
N3529 G1  X167.495  E1.0642
N3530 G1  Y263.814  E0.0285
N3531 G1  X195.495  E1.0642
N3532 G1  Y264.564  E0.0285
N3533 G1  X167.495  E1.0642
N3534 G1  Y265.314  E0.0285
N3535 G1  X195.495  E1.0642
N3536 ; WIPE_TOWER_END
N3537 M220 R
N3538 G1 F60000
N3539 G4 S0
N3540 G92 E0
N3541 ; CP TOOLCHANGE END
N3542 ;------------------
N3543 
N3544 
N3545 
N3546 ; WIPE_START
N3547 G1 F5400
N3548 M204 S8000
N3549 G1 X193.495 Y265.314 E-.76
N3550 ; WIPE_END
N3551 G1 E-.04 F1800
N3552 M204 S10000
N3553 G17
N3554 G3 Z1 I1.217 J0 P1  F60000
N3555 ; OBJECT_ID: 407
N3556 ; COOLING_NODE: 0
N3557 ; start printing object, unique label id: 407
N3558 M624 AgAAAAAAAAA=
N3559 G1 X192.875 Y103.671
N3560 G1 Z.6
N3561 G1 E.8 F1800
N3562 ; FEATURE: Outer wall
N3563 ; LINE_WIDTH: 0.42
N3564 ; LAYER_HEIGHT: 0.2
N3565 G1 F2545.881
N3566 M204 S5000
N3567 G1 X158.295 Y103.671 E1.08423
N3568 G1 X158.295 Y103.091 E.01819
N3569 G1 X192.875 Y103.091 E1.08423
N3570 G1 X192.875 Y103.611 E.0163
N3571 M204 S10000
N3572 G1 X192.679 Y103.381 F60000
N3573 ; FEATURE: Gap infill
N3574 ; LINE_WIDTH: 0.23088
N3575 G1 F5107.47
N3576 M204 S8000
N3577 G1 X158.491 Y103.381 E.53432
N3578 ; CHANGE_LAYER
N3579 ; Z_HEIGHT: 0.8
N3580 ; LAYER_HEIGHT: 0.2
N3581 ; WIPE_START
N3582 G1 F5107.47
N3583 G1 X160.491 Y103.381 E-.76
N3584 ; WIPE_END
N3585 G1 E-.04 F1800
N3586 ; stop printing object, unique label id: 407
N3587 M625
N3588 ;======== H2D 20250521========
N3589 ; layer num/total_layer_count: 4/75
N3590 ; update layer progress
N3591 M73 L4
N3592 M991 S0 P3 ;notify layer change
N3593 
N3594 
N3595 ; OBJECT_ID: 407
N3596 ; COOLING_NODE: 0
N3597 ; start printing object, unique label id: 407
N3598 M624 AgAAAAAAAAA=
N3599 M204 S10000
N3600 G17
N3601 G3 Z1 I-.011 J1.217 P1  F60000
N3602 G1 X192.875 Y103.671 Z1
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=0.700G1 Z0.700 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N2728 G1 X158.916 Y201.084 E1.03439
N2729 G1 X158.916 Y118.916 E2.64221
N2730 G1 X191.084 Y118.916 E1.03439
N2731 G1 X191.084 Y201.024 E2.64028
N2737 G1 X158.509 Y201.491 E1.06057
N2738 G1 X158.509 Y118.509 E2.66839
N2739 G1 X191.491 Y118.509 E1.06057
N2740 G1 X191.491 Y201.431 E2.66646
N2746 G1 X158.102 Y201.898 E1.08675
N2747 G1 X158.102 Y118.102 E2.69457
N2748 G1 X191.898 Y118.102 E1.08675
N2749 G1 X191.898 Y201.838 E2.69264
N2757 G1 X157.71 Y202.29 E1.03002
N2758 G1 X157.71 Y117.71 E2.51935
N2759 G1 X192.29 Y117.71 E1.03002
N2760 G1 X192.29 Y202.23 E2.51756
N2772 G1 X159.674 Y200.751 E.02508
N2773 G1 X160.208 Y200.751 E.01593
N2774 G1 X159.249 Y199.792 E.04045
N2775 G1 X159.249 Y199.258 E.01593
N2776 G1 X160.742 Y200.751 E.06298
N2777 G1 X161.276 Y200.751 E.01593
N2778 G1 X159.249 Y198.724 E.08551
N2779 G1 X159.249 Y198.19 E.01593
N2780 G1 X161.81 Y200.751 E.10804
N2781 G1 X162.344 Y200.751 E.01593
N2782 G1 X159.249 Y197.656 E.13057
N2783 G1 X159.249 Y197.121 E.01593
N2784 G1 X162.879 Y200.751 E.1531
N2785 G1 X163.413 Y200.751 E.01593
N2786 G1 X159.249 Y196.587 E.17563
N2787 G1 X159.249 Y196.053 E.01593
N2788 G1 X163.947 Y200.751 E.19816
N2789 G1 X164.481 Y200.751 E.01593
N2790 G1 X159.249 Y195.519 E.22069
N2791 G1 X159.249 Y194.985 E.01593
N2792 G1 X165.015 Y200.751 E.24322
N2793 G1 X165.549 Y200.751 E.01593
N2794 G1 X159.249 Y194.451 E.26575
N2795 G1 X159.249 Y193.917 E.01593
N2796 G1 X166.083 Y200.751 E.28828
N2797 G1 X166.617 Y200.751 E.01593
N2798 G1 X159.249 Y193.383 E.31082
N2799 G1 X159.249 Y192.849 E.01593
N2800 G1 X167.151 Y200.751 E.33335
N2801 G1 X167.685 Y200.751 E.01593
N2802 G1 X159.249 Y192.315 E.35588
N2803 G1 X159.249 Y191.781 E.01593
N2804 G1 X168.219 Y200.751 E.37841
N2805 G1 X168.753 Y200.751 E.01593
N2806 G1 X159.249 Y191.247 E.40094
N2807 G1 X159.249 Y190.713 E.01593
N2808 G1 X169.287 Y200.751 E.42347
N2809 G1 X169.821 Y200.751 E.01593
N2810 G1 X159.249 Y190.179 E.446
N2811 G1 X159.249 Y189.645 E.01593
N2812 G1 X170.355 Y200.751 E.46853
N2813 G1 X170.89 Y200.751 E.01593
N2814 G1 X159.249 Y189.11 E.49106
N2815 G1 X159.249 Y188.576 E.01593
N2816 G1 X171.424 Y200.751 E.51359
N2817 G1 X171.958 Y200.751 E.01593
N2818 G1 X159.249 Y188.042 E.53612
N2819 G1 X159.249 Y187.508 E.01593
N2820 G1 X172.492 Y200.751 E.55865
N2821 G1 X173.026 Y200.751 E.01593
N2822 G1 X159.249 Y186.974 E.58118
N2823 G1 X159.249 Y186.44 E.01593
N2824 G1 X173.56 Y200.751 E.60371
N2825 G1 X174.094 Y200.751 E.01593
N2826 G1 X159.249 Y185.906 E.62624
N2827 G1 X159.249 Y185.372 E.01593
N2828 G1 X174.628 Y200.751 E.64877
N2829 G1 X175.162 Y200.751 E.01593
N2830 G1 X159.249 Y184.838 E.67131
N2831 G1 X159.249 Y184.304 E.01593
N2832 G1 X175.696 Y200.751 E.69384
N2833 G1 X176.23 Y200.751 E.01593
N2834 G1 X159.249 Y183.77 E.71637
N2835 G1 X159.249 Y183.236 E.01593
N2836 G1 X176.764 Y200.751 E.7389
N2837 G1 X177.298 Y200.751 E.01593
N2838 G1 X159.249 Y182.702 E.76143
N2839 G1 X159.249 Y182.168 E.01593
N2840 G1 X177.832 Y200.751 E.78396
N2841 G1 X178.366 Y200.751 E.01593
N2842 G1 X159.249 Y181.634 E.80649
N2843 G1 X159.249 Y181.1 E.01593
N2844 G1 X178.9 Y200.751 E.82902
N2845 G1 X179.435 Y200.751 E.01593
N2846 G1 X159.249 Y180.565 E.85155
N2847 G1 X159.249 Y180.031 E.01593
N2848 G1 X179.969 Y200.751 E.87408
N2849 G1 X180.503 Y200.751 E.01593
N2850 G1 X159.249 Y179.497 E.89661
N2851 G1 X159.249 Y178.963 E.01593
N2852 G1 X181.037 Y200.751 E.91914
N2853 G1 X181.571 Y200.751 E.01593
N2854 G1 X159.249 Y178.429 E.94167
N2855 G1 X159.249 Y177.895 E.01593
N2856 G1 X182.105 Y200.751 E.9642
N2857 G1 X182.639 Y200.751 E.01593
N2858 G1 X159.249 Y177.361 E.98673
N2859 G1 X159.249 Y176.827 E.01593
N2860 G1 X183.173 Y200.751 E1.00927
N2861 G1 X183.707 Y200.751 E.01593
N2862 G1 X159.249 Y176.293 E1.0318
N2863 G1 X159.249 Y175.759 E.01593
N2864 G1 X184.241 Y200.751 E1.05433
N2865 G1 X184.775 Y200.751 E.01593
N2866 G1 X159.249 Y175.225 E1.07686
N2867 G1 X159.249 Y174.691 E.01593
N2868 G1 X185.309 Y200.751 E1.09939
N2869 G1 X185.843 Y200.751 E.01593
N2870 G1 X159.249 Y174.157 E1.12192
N2871 G1 X159.249 Y173.623 E.01593
N2872 G1 X186.377 Y200.751 E1.14445
N2873 G1 X186.911 Y200.751 E.01593
N2874 G1 X159.249 Y173.089 E1.16698
N2875 G1 X159.249 Y172.555 E.01593
N2876 G1 X187.445 Y200.751 E1.18951
N2877 G1 X187.98 Y200.751 E.01593
N2878 G1 X159.249 Y172.02 E1.21204
N2879 G1 X159.249 Y171.486 E.01593
N2880 G1 X188.514 Y200.751 E1.23457
N2881 G1 X189.048 Y200.751 E.01593
N2882 G1 X159.249 Y170.952 E1.2571
N2883 G1 X159.249 Y170.418 E.01593
N2884 G1 X189.582 Y200.751 E1.27963
N2885 G1 X190.116 Y200.751 E.01593
N2886 G1 X159.249 Y169.884 E1.30216
N2887 G1 X159.249 Y169.35 E.01593
N2888 G1 X190.65 Y200.751 E1.32469
N2889 G1 X190.751 Y200.751 E.003
N2890 G1 X190.751 Y200.317 E.01293
N2891 G1 X159.249 Y168.816 E1.32894
N2892 G1 X159.249 Y168.282 E.01593
N2893 G1 X190.751 Y199.783 E1.32894
N2894 G1 X190.751 Y199.249 E.01593
N2895 G1 X159.249 Y167.748 E1.32894
N2896 G1 X159.249 Y167.214 E.01593
N2897 G1 X190.751 Y198.715 E1.32894
N2898 G1 X190.751 Y198.181 E.01593
N2899 G1 X159.249 Y166.68 E1.32894
N2900 G1 X159.249 Y166.146 E.01593
N2901 G1 X190.751 Y197.647 E1.32894
N2902 G1 X190.751 Y197.113 E.01593
N2903 G1 X159.249 Y165.612 E1.32894
N2904 G1 X159.249 Y165.078 E.01593
N2905 G1 X190.751 Y196.579 E1.32894
N2906 G1 X190.751 Y196.045 E.01593
N2907 G1 X159.249 Y164.544 E1.32894
N2908 G1 X159.249 Y164.01 E.01593
N2909 G1 X190.751 Y195.511 E1.32894
N2910 G1 X190.751 Y194.977 E.01593
N2911 G1 X159.249 Y163.475 E1.32894
N2912 G1 X159.249 Y162.941 E.01593
N2913 G1 X190.751 Y194.442 E1.32894
N2914 G1 X190.751 Y193.908 E.01593
N2915 G1 X159.249 Y162.407 E1.32894
N2916 G1 X159.249 Y161.873 E.01593
N2917 G1 X190.751 Y193.374 E1.32894
N2918 G1 X190.751 Y192.84 E.01593
N2919 G1 X159.249 Y161.339 E1.32894
N2920 G1 X159.249 Y160.805 E.01593
N2921 G1 X190.751 Y192.306 E1.32894
N2922 G1 X190.751 Y191.772 E.01593
N2923 G1 X159.249 Y160.271 E1.32894
N2924 G1 X159.249 Y159.737 E.01593
N2925 G1 X190.751 Y191.238 E1.32894
N2926 G1 X190.751 Y190.704 E.01593
N2927 G1 X159.249 Y159.203 E1.32894
N2928 G1 X159.249 Y158.669 E.01593
N2929 G1 X190.751 Y190.17 E1.32894
N2930 G1 X190.751 Y189.636 E.01593
N2931 G1 X159.249 Y158.135 E1.32894
N2932 G1 X159.249 Y157.601 E.01593
N2933 G1 X190.751 Y189.102 E1.32894
N2934 G1 X190.751 Y188.568 E.01593
N2935 G1 X159.249 Y157.067 E1.32894
N2936 G1 X159.249 Y156.533 E.01593
N2937 G1 X190.751 Y188.034 E1.32894
N2938 G1 X190.751 Y187.5 E.01593
N2939 G1 X159.249 Y155.999 E1.32894
N2940 G1 X159.249 Y155.464 E.01593
N2941 G1 X190.751 Y186.966 E1.32894
N2942 G1 X190.751 Y186.432 E.01593
N2943 G1 X159.249 Y154.93 E1.32894
N2944 G1 X159.249 Y154.396 E.01593
N2946 G1 X190.751 Y185.897 E1.32894
N2947 G1 X190.751 Y185.363 E.01593
N2948 G1 X159.249 Y153.862 E1.32894
N2949 G1 X159.249 Y153.328 E.01593
N2950 G1 X190.751 Y184.829 E1.32894
N2951 G1 X190.751 Y184.295 E.01593
N2953 G1 X159.249 Y152.794 E1.32894
N2954 G1 X159.249 Y152.26 E.01593
N2955 G1 X190.751 Y183.761 E1.32894
N2956 G1 X190.751 Y183.227 E.01593
N2957 G1 X159.249 Y151.726 E1.32894
N2958 G1 X159.249 Y151.192 E.01593
N2959 G1 X190.751 Y182.693 E1.32894
N2960 G1 X190.751 Y182.159 E.01593
N2961 G1 X159.249 Y150.658 E1.32894
N2962 G1 X159.249 Y150.124 E.01593
N2963 G1 X190.751 Y181.625 E1.32894
N2964 G1 X190.751 Y181.091 E.01593
N2965 G1 X159.249 Y149.59 E1.32894
N2966 G1 X159.249 Y149.056 E.01593
N2967 G1 X190.751 Y180.557 E1.32894
N2968 G1 X190.751 Y180.023 E.01593
N2969 G1 X159.249 Y148.522 E1.32894
N2970 G1 X159.249 Y147.988 E.01593
N2971 G1 X190.751 Y179.489 E1.32894
N2972 G1 X190.751 Y178.955 E.01593
N2973 G1 X159.249 Y147.454 E1.32894
N2974 G1 X159.249 Y146.919 E.01593
N2976 G1 X190.751 Y178.421 E1.32894
N2977 G1 X190.751 Y177.886 E.01593
N2978 G1 X159.249 Y146.385 E1.32894
N2979 G1 X159.249 Y145.851 E.01593
N2980 G1 X190.751 Y177.352 E1.32894
N2981 G1 X190.751 Y176.818 E.01593
N2982 G1 X159.249 Y145.317 E1.32894
N2983 G1 X159.249 Y144.783 E.01593
N2984 G1 X190.751 Y176.284 E1.32894
N2985 G1 X190.751 Y175.75 E.01593
N2986 G1 X159.249 Y144.249 E1.32894
N2987 G1 X159.249 Y143.715 E.01593
N2988 G1 X190.751 Y175.216 E1.32894
N2989 G1 X190.751 Y174.682 E.01593
N2990 G1 X159.249 Y143.181 E1.32894
N2991 G1 X159.249 Y142.647 E.01593
N2992 G1 X190.751 Y174.148 E1.32894
N2993 G1 X190.751 Y173.614 E.01593
N2994 G1 X159.249 Y142.113 E1.32894
N2995 G1 X159.249 Y141.579 E.01593
N2996 G1 X190.751 Y173.08 E1.32894
N2997 G1 X190.751 Y172.546 E.01593
N2998 G1 X159.249 Y141.045 E1.32894
N2999 G1 X159.249 Y140.511 E.01593
N3000 G1 X190.751 Y172.012 E1.32894
N3001 G1 X190.751 Y171.478 E.01593
N3002 G1 X159.249 Y139.977 E1.32894
N3003 G1 X159.249 Y139.443 E.01593
N3004 G1 X190.751 Y170.944 E1.32894
N3005 G1 X190.751 Y170.41 E.01593
N3006 G1 X159.249 Y138.909 E1.32894
N3007 G1 X159.249 Y138.374 E.01593
N3008 G1 X190.751 Y169.876 E1.32894
N3009 G1 X190.751 Y169.341 E.01593
N3010 G1 X159.249 Y137.84 E1.32894
N3011 G1 X159.249 Y137.306 E.01593
N3012 G1 X190.751 Y168.807 E1.32894
N3013 G1 X190.751 Y168.273 E.01593
N3014 G1 X159.249 Y136.772 E1.32894
N3015 G1 X159.249 Y136.238 E.01593
N3016 G1 X190.751 Y167.739 E1.32894
N3017 G1 X190.751 Y167.205 E.01593
N3018 G1 X159.249 Y135.704 E1.32894
N3019 G1 X159.249 Y135.17 E.01593
N3020 G1 X190.751 Y166.671 E1.32894
N3021 G1 X190.751 Y166.137 E.01593
N3022 G1 X159.249 Y134.636 E1.32894
N3023 G1 X159.249 Y134.102 E.01593
N3024 G1 X190.751 Y165.603 E1.32894
N3025 G1 X190.751 Y165.069 E.01593
N3026 G1 X159.249 Y133.568 E1.32894
N3027 G1 X159.249 Y133.034 E.01593
N3028 G1 X190.751 Y164.535 E1.32894
N3029 G1 X190.751 Y164.001 E.01593
N3030 G1 X159.249 Y132.5 E1.32894
N3031 G1 X159.249 Y131.966 E.01593
N3032 G1 X190.751 Y163.467 E1.32894
N3033 G1 X190.751 Y162.933 E.01593
N3034 G1 X159.249 Y131.432 E1.32894
N3035 G1 X159.249 Y130.898 E.01593
N3036 G1 X190.751 Y162.399 E1.32894
N3037 G1 X190.751 Y161.865 E.01593
N3038 G1 X159.249 Y130.364 E1.32894
N3039 G1 X159.249 Y129.829 E.01593
N3040 G1 X190.751 Y161.331 E1.32894
N3041 G1 X190.751 Y160.796 E.01593
N3042 G1 X159.249 Y129.295 E1.32894
N3043 G1 X159.249 Y128.761 E.01593
N3044 G1 X190.751 Y160.262 E1.32894
N3045 G1 X190.751 Y159.728 E.01593
N3046 G1 X159.249 Y128.227 E1.32894
N3047 G1 X159.249 Y127.693 E.01593
N3048 G1 X190.751 Y159.194 E1.32894
N3049 G1 X190.751 Y158.66 E.01593
N3050 G1 X159.249 Y127.159 E1.32894
N3051 G1 X159.249 Y126.625 E.01593
N3052 G1 X190.751 Y158.126 E1.32894
N3053 G1 X190.751 Y157.592 E.01593
N3054 G1 X159.249 Y126.091 E1.32894
N3055 G1 X159.249 Y125.557 E.01593
N3056 G1 X190.751 Y157.058 E1.32894
N3057 G1 X190.751 Y156.524 E.01593
N3058 G1 X159.249 Y125.023 E1.32894
N3059 G1 X159.249 Y124.489 E.01593
N3060 G1 X190.751 Y155.99 E1.32894
N3061 G1 X190.751 Y155.456 E.01593
N3062 G1 X159.249 Y123.955 E1.32894
N3063 G1 X159.249 Y123.421 E.01593
N3064 G1 X190.751 Y154.922 E1.32894
N3065 G1 X190.751 Y154.388 E.01593
N3066 G1 X159.249 Y122.887 E1.32894
N3067 G1 X159.249 Y122.353 E.01593
N3068 G1 X190.751 Y153.854 E1.32894
N3069 G1 X190.751 Y153.32 E.01593
N3070 G1 X159.249 Y121.818 E1.32894
N3071 G1 X159.249 Y121.284 E.01593
N3072 G1 X190.751 Y152.786 E1.32894
N3073 G1 X190.751 Y152.251 E.01593
N3074 G1 X159.249 Y120.75 E1.32894
N3075 G1 X159.249 Y120.216 E.01593
N3076 G1 X190.751 Y151.717 E1.32894
N3077 G1 X190.751 Y151.183 E.01593
N3078 G1 X159.249 Y119.682 E1.32894
N3079 G1 X159.249 Y119.249 E.01291
N3080 G1 X159.351 Y119.249 E.00302
N3081 G1 X190.751 Y150.649 E1.32467
N3083 G1 X190.751 Y150.115 E.01593
N3084 G1 X159.885 Y119.249 E1.30214
N3085 G1 X160.419 Y119.249 E.01593
N3086 G1 X190.751 Y149.581 E1.27961
N3087 G1 X190.751 Y149.047 E.01593
N3088 G1 X160.953 Y119.249 E1.25708
N3089 G1 X161.487 Y119.249 E.01593
N3090 G1 X190.751 Y148.513 E1.23455
N3091 G1 X190.751 Y147.979 E.01593
N3092 G1 X162.021 Y119.249 E1.21202
N3093 G1 X162.555 Y119.249 E.01593
N3094 G1 X190.751 Y147.445 E1.18949
N3095 G1 X190.751 Y146.911 E.01593
N3096 G1 X163.089 Y119.249 E1.16695
N3097 G1 X163.623 Y119.249 E.01593
N3098 G1 X190.751 Y146.377 E1.14442
N3099 G1 X190.751 Y145.843 E.01593
N3100 G1 X164.157 Y119.249 E1.12189
N3101 G1 X164.691 Y119.249 E.01593
N3102 G1 X190.751 Y145.309 E1.09936
N3103 G1 X190.751 Y144.775 E.01593
N3104 G1 X165.225 Y119.249 E1.07683
N3105 G1 X165.76 Y119.249 E.01593
N3106 G1 X190.751 Y144.24 E1.0543
N3107 G1 X190.751 Y143.706 E.01593
N3108 G1 X166.294 Y119.249 E1.03177
N3109 G1 X166.828 Y119.249 E.01593
N3110 G1 X190.751 Y143.172 E1.00924
N3111 G1 X190.751 Y142.638 E.01593
N3112 G1 X167.362 Y119.249 E.98671
N3113 G1 X167.896 Y119.249 E.01593
N3114 G1 X190.751 Y142.104 E.96418
N3115 G1 X190.751 Y141.57 E.01593
N3116 G1 X168.43 Y119.249 E.94165
N3117 G1 X168.964 Y119.249 E.01593
N3118 G1 X190.751 Y141.036 E.91912
N3119 G1 X190.751 Y140.502 E.01593
N3120 G1 X169.498 Y119.249 E.89659
N3121 G1 X170.032 Y119.249 E.01593
N3122 G1 X190.751 Y139.968 E.87406
N3123 G1 X190.751 Y139.434 E.01593
N3124 G1 X170.566 Y119.249 E.85153
N3125 G1 X171.1 Y119.249 E.01593
N3126 G1 X190.751 Y138.9 E.829
N3127 G1 X190.751 Y138.366 E.01593
N3128 G1 X171.634 Y119.249 E.80646
N3129 G1 X172.168 Y119.249 E.01593
N3130 G1 X190.751 Y137.832 E.78393
N3131 G1 X190.751 Y137.298 E.01593
N3132 G1 X172.702 Y119.249 E.7614
N3133 G1 X173.236 Y119.249 E.01593
N3134 G1 X190.751 Y136.764 E.73887
N3135 G1 X190.751 Y136.23 E.01593
N3136 G1 X173.77 Y119.249 E.71634
N3137 G1 X174.305 Y119.249 E.01593
N3138 G1 X190.751 Y135.695 E.69381
N3139 G1 X190.751 Y135.161 E.01593
N3140 G1 X174.839 Y119.249 E.67128
N3141 G1 X175.373 Y119.249 E.01593
N3142 G1 X190.751 Y134.627 E.64875
N3143 G1 X190.751 Y134.093 E.01593
N3144 G1 X175.907 Y119.249 E.62622
N3145 G1 X176.441 Y119.249 E.01593
N3146 G1 X190.751 Y133.559 E.60369
N3147 G1 X190.751 Y133.025 E.01593
N3148 G1 X176.975 Y119.249 E.58116
N3149 G1 X177.509 Y119.249 E.01593
N3150 G1 X190.751 Y132.491 E.55863
N3151 G1 X190.751 Y131.957 E.01593
N3152 G1 X178.043 Y119.249 E.5361
N3153 G1 X178.577 Y119.249 E.01593
N3154 G1 X190.751 Y131.423 E.51357
N3155 G1 X190.751 Y130.889 E.01593
N3156 G1 X179.111 Y119.249 E.49104
N3157 G1 X179.645 Y119.249 E.01593
N3158 G1 X190.751 Y130.355 E.4685
N3159 G1 X190.751 Y129.821 E.01593
N3160 G1 X180.179 Y119.249 E.44597
N3161 G1 X180.713 Y119.249 E.01593
N3162 G1 X190.751 Y129.287 E.42344
N3163 G1 X190.751 Y128.753 E.01593
N3164 G1 X181.247 Y119.249 E.40091
N3165 G1 X181.781 Y119.249 E.01593
N3166 G1 X190.751 Y128.219 E.37838
N3167 G1 X190.751 Y127.685 E.01593
N3168 G1 X182.315 Y119.249 E.35585
N3169 G1 X182.85 Y119.249 E.01593
N3170 G1 X190.751 Y127.15 E.33332
N3171 G1 X190.751 Y126.616 E.01593
N3172 G1 X183.384 Y119.249 E.31079
N3173 G1 X183.918 Y119.249 E.01593
N3174 G1 X190.751 Y126.082 E.28826
N3175 G1 X190.751 Y125.548 E.01593
N3176 G1 X184.452 Y119.249 E.26573
N3177 G1 X184.986 Y119.249 E.01593
N3178 G1 X190.751 Y125.014 E.2432
N3179 G1 X190.751 Y124.48 E.01593
N3180 G1 X185.52 Y119.249 E.22067
N3181 G1 X186.054 Y119.249 E.01593
N3182 G1 X190.751 Y123.946 E.19814
N3183 G1 X190.751 Y123.412 E.01593
N3184 G1 X186.588 Y119.249 E.17561
N3185 G1 X187.122 Y119.249 E.01593
N3186 G1 X190.751 Y122.878 E.15308
N3187 G1 X190.751 Y122.344 E.01593
N3188 G1 X187.656 Y119.249 E.13054
N3189 G1 X188.19 Y119.249 E.01593
N3190 G1 X190.751 Y121.81 E.10801
N3191 G1 X190.751 Y121.276 E.01593
N3192 G1 X188.724 Y119.249 E.08548
N3193 G1 X189.258 Y119.249 E.01593
N3194 G1 X190.751 Y120.742 E.06295
N3195 G1 X190.751 Y120.208 E.01593
N3196 G1 X189.792 Y119.249 E.04042
N3197 G1 X190.326 Y119.249 E.01593
N3198 G1 X190.92 Y119.843 E.02505
N3200 G1 X190.326 Y119.249 E-.3191
N3201 G1 X189.792 Y119.249 E-.20294
N3202 G1 X190.235 Y119.692 E-.23796
N3253 G1  X166.995 Y279.564   E0.0760
N3260 G1  X168.371 Y250.613   E0.1594
N3266 G1  X195.609 Y251.657   E0.0547
N3277 G1  X195.995 Y279.564   E0.0834
N3285 G1  X167.495  E1.0642
N3286 G1  Y272.314  E0.2565
N3287 G1  X195.495  E1.0642
N3288 G1  Y279.064  E0.2565
N3295 G1  Y279.064  E0.2565
N3299 G1  Y272.314  E0.2565
N3303 G1  Y279.064  E0.2565
N3307 G1  Y272.314  E0.2565
N3339 G1  X195.245 Y266.314  E2.1885 F1881
N3340 G1  Y267.564  E0.0995
N3341 G1  X167.745  E2.1885
N3342 G1  Y268.814  E0.0995
N3343 G1  X195.245  E2.1885
N3344 G1  Y270.064  E0.0995
N3345 G1  X167.745  E2.1885
N3346 G1  Y271.314  E0.0995
N3347 G1  X195.245  E2.1885
N3354 G1 X193.245 Y271.314 E-1.9
N3484 G1  X192.495 Y252.564  E0.1140 F1782
N3500 G1  X167.495  E0.9502 F1782
N3501 G1  Y253.314  E0.0285
N3502 G1  X195.495  E1.0642 F2025
N3503 G1  Y254.064  E0.0285
N3505 G1  X167.495  E1.0642 F2100
N3506 G1  Y254.814  E0.0285
N3507 G1  X195.495  E1.0642
N3508 G1  Y255.564  E0.0285
N3509 G1  X167.495  E1.0642
N3510 G1  Y256.314  E0.0285
N3511 G1  X195.495  E1.0642
N3512 G1  Y257.064  E0.0285
N3513 G1  X167.495  E1.0642
N3514 G1  Y257.814  E0.0285
N3515 G1  X195.495  E1.0642
N3516 G1  Y258.564  E0.0285
N3517 G1  X167.495  E1.0642
N3518 G1  Y259.314  E0.0285
N3519 G1  X195.495  E1.0642
N3520 G1  Y260.064  E0.0285
N3521 G1  X167.495  E1.0642
N3522 G1  Y260.814  E0.0285
N3523 G1  X195.495  E1.0642
N3524 G1  Y261.564  E0.0285
N3525 G1  X167.495  E1.0642
N3526 G1  Y262.314  E0.0285
N3527 G1  X195.495  E1.0642
N3528 G1  Y263.064  E0.0285
N3529 G1  X167.495  E1.0642
N3530 G1  Y263.814  E0.0285
N3531 G1  X195.495  E1.0642
N3532 G1  Y264.564  E0.0285
N3533 G1  X167.495  E1.0642
N3534 G1  Y265.314  E0.0285
N3535 G1  X195.495  E1.0642
N3549 G1 X193.495 Y265.314 E-.76
N3567 G1 X158.295 Y103.671 E1.08423
N3568 G1 X158.295 Y103.091 E.01819
N3569 G1 X192.875 Y103.091 E1.08423
N3570 G1 X192.875 Y103.611 E.0163
N3577 G1 X158.491 Y103.381 E.53432
N3583 G1 X160.491 Y103.381 E-.76
T0 ;TOOL_CHANGE:0 ; Revert to base toolN3603 G1 Z.8
N3604 G1 E.8 F1800
N3605 ; FEATURE: Outer wall
N3606 ; LINE_WIDTH: 0.42
N3607 ; LAYER_HEIGHT: 0.2
N3608 G1 F2545.881
N3609 M204 S5000
N3610 G1 X158.295 Y103.671 E1.08423
N3611 G1 X158.295 Y103.091 E.01819
N3612 G1 X192.875 Y103.091 E1.08423
N3613 G1 X192.875 Y103.611 E.0163
N3614 M204 S10000
N3615 G1 X192.679 Y103.381 F60000
N3616 ; FEATURE: Gap infill
N3617 ; LINE_WIDTH: 0.23088
N3618 G1 F5107.47
N3619 M204 S8000
N3620 G1 X158.491 Y103.381 E.53432
N3621 ; WIPE_START
N3622 G1 X160.491 Y103.381 E-.76
N3623 ; WIPE_END
N3624 G1 E-.04 F1800
N3625 ; stop printing object, unique label id: 407
N3626 M625
N3627 M204 S10000
N3628 G17
N3629 G3 Z1.2 I-1.216 J.053 P1  F60000
N3630 G1 X167.495 Y265.564 Z1.2
N3631 G1 Z.8
N3632 G1 E.8 F1800
N3633 ; LAYER_HEIGHT: 0.200000
N3634 ; FEATURE: Prime tower
N3635 ; LINE_WIDTH: 0.500000
N3636 ; WIPE_TOWER_START
N3637 M204 S8000
N3638 G1  X167.495 Y260.064  E0.2090 F2100
N3639 G1  X195.495  E1.0642
N3640 G1  Y265.564  E0.2090
N3641 G1  X167.495  E1.0642
N3642 M204 S10000
N3643 G1  X168.495 Y260.064  
N3644 ;--------------------
N3645 ; CP EMPTY GRID START
N3646 ; layer #5
N3647 M204 S8000
N3648 G1  Y265.564  E0.2090
N3649 M204 S10000
N3650 G1  X177.162 
N3651 M204 S8000
N3652 G1  Y260.064  E0.2090
N3653 M204 S10000
N3654 G1  X185.828 
N3655 M204 S8000
N3656 G1  Y265.564  E0.2090
N3657 M204 S10000
N3658 G1  X194.495 
N3659 M204 S8000
N3660 G1  Y260.064  E0.2090
N3661 ; CP EMPTY GRID END
N3662 ;------------------
N3663 
N3664 
N3665 
N3666 
N3667 
N3668 
N3669 ; WIPE_TOWER_END
N3670 ; LAYER_HEIGHT: 0.200000
N3671 ; FEATURE: Prime tower
N3672 ; LINE_WIDTH: 0.500000
N3673 ;--------------------
N3674 ; CP TOOLCHANGE START
N3675 ; toolchange #4
N3676 ; material : PCTG -> PCTG
N3677 ;--------------------
N3678 M220 B
N3679 M220 S100
N3680 ; WIPE_TOWER_START
N3681 G1 E-.8 F1800
N3682 G17
N3683 G3 Z1.2 I1.217 J0 P1  F60000
N3684 G1 X167.745 Y252.814 Z.8
N3685 G1 E.8 F1800
N3686 ; LAYER_HEIGHT: 0.200000
N3687 ; FEATURE: Prime tower
N3688 ; LINE_WIDTH: 1.000000
N3689 ; NOZZLE_CHANGE_START OF1 NF0
N3690 M104 T0 S210 N0 ;Multi extruder pre cooling in post extrusion
N3691 M204 S8000
N3692 G1  X195.245 Y252.814  E2.1885 F251
N3693 G1  Y254.314  E0.1194
N3694 G1  X167.745  E2.1885
N3695 G1  Y255.814  E0.1194
N3696 G1  X195.245  E2.1885
N3697 G1  Y257.314  E0.1194
N3698 M104 T1 S255 N0 ;Multi extruder pre heating
N3699 G1  X167.745  E2.1885
N3700 M73 P31 R43
N3701 G1  Y258.814  E0.1194
N3702 G1  X195.245  E2.1885
N3703 M204 S10000
N3704 G1  Y259.814 
N3705 G1  X168.245  F398
N3706 M73 P31 R42
N3707 G1  Y258.314 
N3708 G1  X194.745 
N3709 G1  Y256.814 
N3710 G1  X168.245 
N3711 G1  Y255.314 
N3712 G1  X194.745 
N3713 G1  Y253.814 
N3714 G1  X168.245 
N3715 ; NOZZLE_CHANGE_END OF1 NF0
N3716 M104 T0 S106 N0 ;Multi extruder pre cooling
N3717 
N3718 G1 E-2 F1800
N3719 G17
N3720 G3 Z1.2 I1.217 J0 P1  F5400
N3721 ; filament end gcode 
N3722 
N3723 ;======== H2D ========
N3724 ;===== 20250604 =====
N3725 M993 A2 B2 C2 ; nozzle cam detection allow status save.
N3726 M993 A0 B0 C0 ; nozzle cam detection not allowed.
N3727 
N3728 
N3729 M1015.4 S0 ; disable E air printing detect
N3730 
N3731 
N3732 M620 S0A
N3733 M1002 gcode_claim_action : 4
N3734 M204 S9000
N3735 
N3736 M73 P32 R42
N3737 G1 Z3.8 F1200
N3738 
N3739 M400
N3740 M106 P1 S0
N3741 M106 P2 S0
N3742 
N3743 
N3744 
N3745 
N3746 M620.10 A0 F79.8237 L0 H0.4 T250 P240 S1
N3747 
N3748 
N3749 
N3750 M620.10 A1 F149.669 L0 H0.4 T270 P255 S1
N3751 
N3752 
N3753 
N3754 M620.11 P0 I1 E0
N3755 
N3756 
N3757 
N3758 M620.11 K1 I1 R0 F200
N3759 
N3760 
N3761 M628 S1
N3762 
N3763 M620.11 S0 L0 I1 E-10 F200
N3764 
N3765 M629
N3766 
N3767 
N3768 M620.11 H2 C331
N3769 
N3770 
N3771 T0
N3772 M73 E2
N3773 
N3774 ;deretract
N3775 
N3776 
N3777 ;VG1 E4 F200
N3778 ;VG1 E4 F100
N3779 
N3780 
N3781 
N3782 ; VFLUSH_START
N3783 
N3784 
N3785 ;VG1 E0 F79
N3786 
N3787 
N3788 SYNC T0
N3789 
N3790 ; VFLUSH_END
N3791 
N3792 M1002 set_filament_type:PCTG
N3793 
N3794 M400
N3795 M83
N3796 
N3797 
N3798 
N3799 M628 S0
N3800 ;VM109 S255
N3801 M629
N3802 M400
N3803 
N3804 M983.3 F2.5 A0.4
N3805 
N3806 
N3807 M400
N3808 
N3809 G1 Y320 F30000
N3810 G1 X201
N3811 
N3812 G1 Y295
N3813 G1 Y265 F18000
N3814 G1 Z3.8 F3000
N3815 
N3816 M204 S8000
N3817 
N3818 
N3819 M621 S0A
N3820 
N3821 M993 A3 B3 C3 ; nozzle cam detection allow status restore.
N3822 
N3823 
N3824 M1015.3 S0;disable tpu clog detect
N3825 
N3826 
N3827 
N3828 M1015.4 S0 ; disable E air printing detect
N3829 
N3830 
N3831 M620.6 I0 W1 ;enable ams air printing detect
N3832 M1002 gcode_claim_action : 0
N3833 M106 S25.5
N3834 M106 P2 S0
N3835 G1 X200 Y265.364 F60000
N3836 G1 Z.8
N3837 G1 X200 Y272.996 Z1.2
N3838 G1 X200 Y283.638 Z1.2
N3839 G1 X162.991 Y283.638
N3840 G1 X162.991 Y278.814
N3841 G1 X167.495 Y278.814
N3842 
N3843 ; filament start gcode
N3844 G1 Z.8
N3845 G1 E2 F1800
N3846 
N3847 G4 S0
N3848 ; CP TOOLCHANGE WIPE
N3849 ; LINE_WIDTH: 0.500000
N3850 M204 S8000
N3851 G1  X170.495 Y278.814  E0.1140 F1782
N3852 G1 E-0.8000 F1800
N3853 M204 S10000
N3854 G1  X165.995  F600
N3855 G1  X167.495  F240
N3856 G1  X167.995  F600
N3857 G1  Y279.314 
N3858 G1  X166.995 
N3859 G1  Y278.314 
N3860 G1  X168.495 
N3861 G1  Y279.814 
N3862 G1  X166.495 
N3863 G1  Y277.814 
N3864 G1  X170.495 Y278.814   F1782
N3865 G1 E0.8000 F1800
N3866 M204 S8000
N3867 G1  X195.495  E0.9502 F1782
N3868 G1  Y278.064  E0.0285
N3869 G1  X167.495  E1.0642 F2025
N3870 G1  Y277.314  E0.0285
N3871 G1  X195.495  E1.0642 F2473
N3872 G1  Y276.564  E0.0285
N3873 G1  X167.495  E1.0642 F3938
N3874 G1  Y275.814  E0.0285
N3875 G1  X195.495  E1.0642
N3876 G1  Y275.064  E0.0285
N3877 G1  X167.495  E1.0642
N3878 G1  Y274.314  E0.0285
N3879 G1  X195.495  E1.0642
N3880 G1  Y273.564  E0.0285
N3881 G1  X167.495  E1.0642
N3882 G1  Y272.814  E0.0285
N3883 G1  X195.495  E1.0642
N3884 G1  Y272.064  E0.0285
N3885 G1  X167.495  E1.0642
N3886 G1  Y271.314  E0.0285
N3887 G1  X195.495  E1.0642
N3888 G1  Y270.564  E0.0285
N3889 G1  X167.495  E1.0642
N3890 G1  Y269.814  E0.0285
N3891 G1  X195.495  E1.0642
N3892 G1  Y269.064  E0.0285
N3893 G1  X167.495  E1.0642
N3894 G1  Y268.314  E0.0285
N3895 G1  X195.495  E1.0642
N3896 G1  Y267.564  E0.0285
N3897 G1  X167.495  E1.0642
N3898 G1  Y266.814  E0.0285
N3899 G1  X195.495  E1.0642
N3900 G1  Y266.064  E0.0285
N3901 G1  X167.495  E1.0642
N3902 ; WIPE_TOWER_END
N3903 M220 R
N3904 G1 F60000
N3905 G4 S0
N3906 G92 E0
N3907 ; CP TOOLCHANGE END
N3908 ;------------------
N3909 
N3910 
N3911 G1  Y252.064  
N3912 ; LAYER_HEIGHT: 0.200000
N3913 ; FEATURE: Prime tower
N3914 ; LINE_WIDTH: 0.500000
N3915 ; WIPE_TOWER_START
N3916 M204 S10000
N3917 G1  X168.371 Y281.015  
N3918 M204 S8000
N3919 G1  X167.144 Y279.721   E0.0678 F3938
N3920 G1 E-0.8000 F1800
N3921 M204 S10000
N3922 G1  X165.426 Y277.905   F600
N3923 G1 E0.8000 F1800
N3924 M204 S8000
N3925 G3  X166.033 Y274.920   I1.593 J-1.230 E0.1313 F3938
N3926 G2  X166.995 Y272.245   I-3.254 J-2.680 E0.1102
N3927 G2  X166.992 Y259.212   I-321.195 J-6.431 E0.4954
N3928 G2  X165.146 Y255.634   I-6.663 J1.171 E0.1554
N3929 G3  X165.485 Y253.656   I1.658 J-0.734 E0.0808
N3930 G3  X168.604 Y250.403   I19.398 J15.476 E0.1715
N3931 G3  X171.793 Y251.056   I1.276 J1.879 E0.1379
N3932 G2  X174.808 Y252.064   I3.021 J-4.025 E0.1229
N3933 G2  X188.372 Y252.060   I6.687 J-357.435 E0.5155
N3934 G2  X192.307 Y250.183   I-0.499 J-6.110 E0.1694
N3935 G3  X194.619 Y250.613   I0.854 J1.838 E0.0953
N3936 G1  X195.995 Y252.064   E0.0760
N3937 G1 E0.0000
N3938 G3  X197.926 Y254.386   I-3.871 J5.182 E0.1159
N3939 G3  X196.750 Y256.979   I-2.902 J0.247 E0.1130
N3940 G2  X195.995 Y259.382   I3.464 J2.409 E0.0972
N3941 G2  X195.998 Y272.416   I321.212 J6.432 E0.4954
N3942 G2  X197.844 Y275.994   I6.663 J-1.171 E0.1554
N3943 G3  X197.504 Y277.972   I-1.658 J0.734 E0.0808
N3944 G1  X195.995 Y279.564   E0.0834
N3945 G3  X193.533 Y281.605   I-4.373 J-2.768 E0.1236
N3946 G3  X190.885 Y280.355   I0.012 J-3.454 E0.1149
N3947 G2  X188.182 Y279.564   I-2.709 J4.247 E0.1085
N3948 G2  X174.618 Y279.568   I-6.687 J357.435 E0.5155
N3949 G2  X170.683 Y281.445   I0.499 J6.110 E0.1694
N3950 G3  X168.371 Y281.015   I-0.854 J-1.838 E0.0953
N3951 ; WIPE_TOWER_END
N3952 
N3953 ; WIPE_START
N3954 G1 F5107.47
N3955 M204 S8000
N3956 G1 X168.484 Y281.125 E-.05968
N3957 G1 X168.604 Y281.225 E-.05967
N3958 G1 X168.733 Y281.316 E-.05968
N3959 G1 X168.868 Y281.396 E-.05967
N3960 G1 X169.008 Y281.466 E-.05968
N3961 G1 X169.154 Y281.524 E-.05967
N3962 G1 X169.304 Y281.571 E-.05968
N3963 G1 X169.457 Y281.605 E-.05967
N3964 G1 X169.613 Y281.628 E-.05967
N3965 G1 X169.769 Y281.638 E-.05968
N3966 G1 X169.927 Y281.636 E-.05967
N3967 G1 X170.083 Y281.622 E-.05967
N3968 G1 X170.197 Y281.603 E-.0439
N3969 ; WIPE_END
N3970 G1 E-.04 F1800
N3971 M204 S10000
N3972 G17
N3973 G3 Z1.2 I1.217 J0 P1  F60000
N3974 ; OBJECT_ID: 372
N3975 ; COOLING_NODE: 0
N3976 ; start printing object, unique label id: 372
N3977 M624 AQAAAAAAAAA=
N3978 G1 X191.084 Y201.084 Z.8
N3979 G1 E.8 F1800
N3980 ; FEATURE: Inner wall
N3981 ; LINE_WIDTH: 0.45
N3982 ; LAYER_HEIGHT: 0.2
N3983 G1 F4421.739
N3984 M204 S8000
N3985 G1 X158.916 Y201.084 E1.03439
N3986 G1 X158.916 Y118.916 E2.64221
N3987 G1 X191.084 Y118.916 E1.03439
N3988 G1 X191.084 Y201.024 E2.64028
N3989 ; COOLING_NODE: 0
N3990 M204 S10000
N3991 G1 X191.491 Y201.491 F60000
N3992 G1 F4421.739
N3993 M204 S8000
N3994 G1 X158.509 Y201.491 E1.06057
N3995 G1 X158.509 Y118.509 E2.66839
N3996 G1 X191.491 Y118.509 E1.06057
N3997 G1 X191.491 Y201.431 E2.66646
N3998 ; COOLING_NODE: 0
N3999 M204 S10000
N4000 G1 X191.898 Y201.898 F60000
N4001 G1 F4421.739
N4002 M204 S8000
N4003 G1 X158.102 Y201.898 E1.08675
N4004 G1 X158.102 Y118.102 E2.69457
N4005 G1 X191.898 Y118.102 E1.08675
N4006 G1 X191.898 Y201.838 E2.69264
N4007 ; COOLING_NODE: 0
N4008 M204 S10000
N4009 G1 X192.29 Y202.29 F60000
N4010 ; FEATURE: Outer wall
N4011 ; LINE_WIDTH: 0.42
N4012 M73 P32 R41
N4013 G1 F4773.528
N4014 M204 S5000
N4015 G1 X157.71 Y202.29 E1.03002
N4016 M73 P33 R41
N4017 G1 X157.71 Y117.71 E2.51935
N4018 G1 X192.29 Y117.71 E1.03002
N4019 G1 X192.29 Y202.23 E2.51756
N4020 G1 E-.8 F1800
N4021 M204 S10000
N4022 G1 X187.157 Y200.736 Z1.2 F60000
N4023 G1 Z.8
N4024 G1 E.8 F1800
N4025 ; FEATURE: Sparse infill
N4026 ; LINE_WIDTH: 0.45
N4027 G1 F4421.739
N4028 M204 S8000
N4029 G1 X188.786 Y200.736 E.05236
N4030 G1 X190.736 Y193.459 E.24225
N4031 G1 X190.736 Y190.084 E.1085
N4032 G1 X159.264 Y198.517 E1.0477
N4033 G1 X159.264 Y200.736 E.07134
N4034 G1 X163.499 Y200.736 E.13618
N4035 G1 X185.329 Y119.264 E2.71223
N4036 G1 X181.12 Y119.264 E.13535
N4037 G1 X190.736 Y128.88 E.43727
N4038 G1 X190.736 Y130.545 E.05356
N4039 G1 X171.928 Y200.736 E2.33669
N4040 G1 X170.48 Y200.736 E.04657
N4041 G1 X159.264 Y189.52 E.51003
N4042 G1 X159.264 Y190.088 E.01827
N4043 G1 X190.736 Y181.656 E1.0477
N4044 G1 X190.736 Y186.449 E.15415
N4045 G1 X159.264 Y154.978 E1.43118
N4046 G1 X159.264 Y153.627 E.04346
N4047 G1 X168.472 Y119.264 E1.14395
N4048 G1 X169.606 Y119.264 E.03648
N4049 G1 X190.736 Y140.394 E.96087
N4050 G1 X190.736 Y139.512 E.02836
N4051 G1 X159.264 Y147.944 E1.0477
N4052 G1 X159.264 Y146.316 E.05236
N4053 M204 S10000
N4054 G1 X159.264 Y158.001 F60000
N4055 G1 F4421.739
N4056 M204 S8000
N4057 G1 X159.264 Y156.373 E.05236
N4058 G1 X190.736 Y147.941 E1.04769
N4059 G1 X190.736 Y151.908 E.12757
N4060 G1 X159.264 Y120.437 E1.43118
N4061 G1 X159.264 Y119.264 E.03769
N4062 G1 X160.043 Y119.264 E.02504
N4063 G1 X159.264 Y122.17 E.09673
N4064 G1 X159.264 Y122.658 E.01569
N4065 G1 X171.929 Y119.264 E.42162
N4066 G1 X176.901 Y119.264 E.15986
N4067 G1 X159.264 Y185.084 E2.19116
N4068 G1 X159.264 Y186.712 E.05236
N4069 M204 S10000
N4070 G1 X159.264 Y171.602 F60000
N4071 G1 F4421.739
N4072 M204 S8000
N4073 G1 X159.264 Y173.231 E.05236
N4074 G1 X190.736 Y164.798 E1.04769
N4075 G1 X190.736 Y163.422 E.04426
N4076 G1 X159.264 Y131.951 E1.43118
N4077 G1 X159.264 Y131.087 E.02777
N4078 G1 X190.736 Y122.654 E1.0477
N4079 G1 X190.736 Y121.026 E.05236
N4080 M204 S10000
N4081 G1 X190.736 Y131.083 F60000
N4082 G1 F4421.739
N4083 M204 S8000
N4084 G1 X159.264 Y139.516 E1.0477
N4085 G1 X159.264 Y143.464 E.12698
N4086 G1 X190.736 Y174.936 E1.43118
N4087 G1 X190.736 Y173.227 E.05494
N4088 G1 X159.264 Y181.66 E1.0477
N4089 G1 X159.264 Y178.006 E.11747
N4090 G1 X181.994 Y200.736 E1.03363
N4091 G1 X182.442 Y200.736 E.01441
N4092 G1 X190.736 Y198.513 E.2761
N4093 G1 X190.736 Y197.963 E.01768
N4094 G1 X159.264 Y166.492 E1.43118
N4095 G1 X159.264 Y164.802 E.05436
N4096 G1 X190.736 Y156.369 E1.0477
N4097 G1 X190.736 Y162.002 E.18112
N4098 G1 X180.357 Y200.736 E1.28947
N4099 G1 X178.729 Y200.736 E.05236
N4100 ; WIPE_START
N4101 G1 X180.357 Y200.736 E-.61876
N4102 G1 X180.453 Y200.377 E-.14124
N4103 ; WIPE_END
N4104 G1 E-.04 F1800
N4105 M204 S10000
N4106 G17
N4107 G3 Z1.2 I1.217 J0 P1  F60000
N4108 ; stop printing object, unique label id: 372
N4109 M625
N4110 ; object ids of layer 4 start: 372,407
N4111 M624 AwAAAAAAAAA=
N4112 ;======== H2D 20250527========
N4113 ; SKIPPABLE_START
N4114 ; SKIPTYPE: timelapse
N4115 M622.1 S1 ; for prev firware, default turned on
N4116 
N4117 M1002 judge_flag timelapse_record_flag
N4118 
N4119 M622 J1
N4120 M993 A2 B2 C2
N4121 M993 A0 B0 C0
N4122 
N4123 
N4124 
N4125 
N4126     M9711 M0 E1 X261 Y132 Z1.2 S11 C10 O0 T3000
N4127 
N4128 
N4129 
N4130 M993 A3 B3 C3
N4131 
N4132 M623
N4133 ; SKIPPABLE_END
N4134 
N4135 ; object ids of this layer4 end: 372,407
N4136 M625
N4137 ; CHANGE_LAYER
N4138 ; Z_HEIGHT: 1
N4139 ; LAYER_HEIGHT: 0.2
N4140 ;======== H2D 20250521========
N4141 ; layer num/total_layer_count: 5/75
N4142 ; update layer progress
N4143 M73 L5
N4144 M991 S0 P4 ;notify layer change
N4145 
N4146 
N4147 ; OBJECT_ID: 372
N4148 ; COOLING_NODE: 0
N4149 ; start printing object, unique label id: 372
N4150 M624 AQAAAAAAAAA=
N4151 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=0.900G1 Z0.900 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N3610 G1 X158.295 Y103.671 E1.08423
N3611 G1 X158.295 Y103.091 E.01819
N3612 G1 X192.875 Y103.091 E1.08423
N3613 G1 X192.875 Y103.611 E.0163
N3620 G1 X158.491 Y103.381 E.53432
N3622 G1 X160.491 Y103.381 E-.76
N3638 G1  X167.495 Y260.064  E0.2090 F2100
N3639 G1  X195.495  E1.0642
N3640 G1  Y265.564  E0.2090
N3641 G1  X167.495  E1.0642
N3648 G1  Y265.564  E0.2090
N3652 G1  Y260.064  E0.2090
N3656 G1  Y265.564  E0.2090
N3660 G1  Y260.064  E0.2090
N3692 G1  X195.245 Y252.814  E2.1885 F251
N3693 G1  Y254.314  E0.1194
N3694 G1  X167.745  E2.1885
N3695 G1  Y255.814  E0.1194
N3696 G1  X195.245  E2.1885
N3697 G1  Y257.314  E0.1194
N3699 G1  X167.745  E2.1885
N3701 G1  Y258.814  E0.1194
N3702 G1  X195.245  E2.1885
N3851 G1  X170.495 Y278.814  E0.1140 F1782
N3867 G1  X195.495  E0.9502 F1782
N3868 G1  Y278.064  E0.0285
N3869 G1  X167.495  E1.0642 F2025
N3870 G1  Y277.314  E0.0285
N3871 G1  X195.495  E1.0642 F2473
N3872 G1  Y276.564  E0.0285
N3873 G1  X167.495  E1.0642 F3938
N3874 G1  Y275.814  E0.0285
N3875 G1  X195.495  E1.0642
N3876 G1  Y275.064  E0.0285
N3877 G1  X167.495  E1.0642
N3878 G1  Y274.314  E0.0285
N3879 G1  X195.495  E1.0642
N3880 G1  Y273.564  E0.0285
N3881 G1  X167.495  E1.0642
N3882 G1  Y272.814  E0.0285
N3883 G1  X195.495  E1.0642
N3884 G1  Y272.064  E0.0285
N3885 G1  X167.495  E1.0642
N3886 G1  Y271.314  E0.0285
N3887 G1  X195.495  E1.0642
N3888 G1  Y270.564  E0.0285
N3889 G1  X167.495  E1.0642
N3890 G1  Y269.814  E0.0285
N3891 G1  X195.495  E1.0642
N3892 G1  Y269.064  E0.0285
N3893 G1  X167.495  E1.0642
N3894 G1  Y268.314  E0.0285
N3895 G1  X195.495  E1.0642
N3896 G1  Y267.564  E0.0285
N3897 G1  X167.495  E1.0642
N3898 G1  Y266.814  E0.0285
N3899 G1  X195.495  E1.0642
N3900 G1  Y266.064  E0.0285
N3901 G1  X167.495  E1.0642
N3919 G1  X167.144 Y279.721   E0.0678 F3938
N3936 G1  X195.995 Y252.064   E0.0760
N3944 G1  X195.995 Y279.564   E0.0834
N3956 G1 X168.484 Y281.125 E-.05968
N3957 G1 X168.604 Y281.225 E-.05967
N3958 G1 X168.733 Y281.316 E-.05968
N3959 G1 X168.868 Y281.396 E-.05967
N3960 G1 X169.008 Y281.466 E-.05968
N3961 G1 X169.154 Y281.524 E-.05967
N3962 G1 X169.304 Y281.571 E-.05968
N3963 G1 X169.457 Y281.605 E-.05967
N3964 G1 X169.613 Y281.628 E-.05967
N3965 G1 X169.769 Y281.638 E-.05968
N3966 G1 X169.927 Y281.636 E-.05967
N3967 G1 X170.083 Y281.622 E-.05967
N3968 G1 X170.197 Y281.603 E-.0439
N3985 G1 X158.916 Y201.084 E1.03439
N3986 G1 X158.916 Y118.916 E2.64221
N3987 G1 X191.084 Y118.916 E1.03439
N3988 G1 X191.084 Y201.024 E2.64028
N3994 G1 X158.509 Y201.491 E1.06057
N3995 G1 X158.509 Y118.509 E2.66839
N3996 G1 X191.491 Y118.509 E1.06057
N3997 G1 X191.491 Y201.431 E2.66646
N4003 G1 X158.102 Y201.898 E1.08675
N4004 G1 X158.102 Y118.102 E2.69457
N4005 G1 X191.898 Y118.102 E1.08675
N4006 G1 X191.898 Y201.838 E2.69264
N4015 G1 X157.71 Y202.29 E1.03002
N4017 G1 X157.71 Y117.71 E2.51935
N4018 G1 X192.29 Y117.71 E1.03002
N4019 G1 X192.29 Y202.23 E2.51756
N4029 G1 X188.786 Y200.736 E.05236
N4030 G1 X190.736 Y193.459 E.24225
N4031 G1 X190.736 Y190.084 E.1085
N4032 G1 X159.264 Y198.517 E1.0477
N4033 G1 X159.264 Y200.736 E.07134
N4034 G1 X163.499 Y200.736 E.13618
N4035 G1 X185.329 Y119.264 E2.71223
N4036 G1 X181.12 Y119.264 E.13535
N4037 G1 X190.736 Y128.88 E.43727
N4038 G1 X190.736 Y130.545 E.05356
N4039 G1 X171.928 Y200.736 E2.33669
N4040 G1 X170.48 Y200.736 E.04657
N4041 G1 X159.264 Y189.52 E.51003
N4042 G1 X159.264 Y190.088 E.01827
N4043 G1 X190.736 Y181.656 E1.0477
N4044 G1 X190.736 Y186.449 E.15415
N4045 G1 X159.264 Y154.978 E1.43118
N4046 G1 X159.264 Y153.627 E.04346
N4047 G1 X168.472 Y119.264 E1.14395
N4048 G1 X169.606 Y119.264 E.03648
N4049 G1 X190.736 Y140.394 E.96087
N4050 G1 X190.736 Y139.512 E.02836
N4051 G1 X159.264 Y147.944 E1.0477
N4052 G1 X159.264 Y146.316 E.05236
N4057 G1 X159.264 Y156.373 E.05236
N4058 G1 X190.736 Y147.941 E1.04769
N4059 G1 X190.736 Y151.908 E.12757
N4060 G1 X159.264 Y120.437 E1.43118
N4061 G1 X159.264 Y119.264 E.03769
N4062 G1 X160.043 Y119.264 E.02504
N4063 G1 X159.264 Y122.17 E.09673
N4064 G1 X159.264 Y122.658 E.01569
N4065 G1 X171.929 Y119.264 E.42162
N4066 G1 X176.901 Y119.264 E.15986
N4067 G1 X159.264 Y185.084 E2.19116
N4068 G1 X159.264 Y186.712 E.05236
N4073 G1 X159.264 Y173.231 E.05236
N4074 G1 X190.736 Y164.798 E1.04769
N4075 G1 X190.736 Y163.422 E.04426
N4076 G1 X159.264 Y131.951 E1.43118
N4077 G1 X159.264 Y131.087 E.02777
N4078 G1 X190.736 Y122.654 E1.0477
N4079 G1 X190.736 Y121.026 E.05236
N4084 G1 X159.264 Y139.516 E1.0477
N4085 G1 X159.264 Y143.464 E.12698
N4086 G1 X190.736 Y174.936 E1.43118
N4087 G1 X190.736 Y173.227 E.05494
N4088 G1 X159.264 Y181.66 E1.0477
N4089 G1 X159.264 Y178.006 E.11747
N4090 G1 X181.994 Y200.736 E1.03363
N4091 G1 X182.442 Y200.736 E.01441
N4092 G1 X190.736 Y198.513 E.2761
N4093 G1 X190.736 Y197.963 E.01768
N4094 G1 X159.264 Y166.492 E1.43118
N4095 G1 X159.264 Y164.802 E.05436
N4096 G1 X190.736 Y156.369 E1.0477
N4097 G1 X190.736 Y162.002 E.18112
N4098 G1 X180.357 Y200.736 E1.28947
N4099 G1 X178.729 Y200.736 E.05236
N4101 G1 X180.357 Y200.736 E-.61876
N4102 G1 X180.453 Y200.377 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN4152 G1 Z1
N4153 G1 E.8 F1800
N4154 M104 T0 S240 N0 ;Multi extruder pre heating
N4155 ; FEATURE: Inner wall
N4156 ; LINE_WIDTH: 0.45
N4157 ; LAYER_HEIGHT: 0.2
N4158 G1 F4421.739
N4159 M204 S8000
N4160 G1 X158.916 Y201.084 E1.03439
N4161 G1 X158.916 Y118.916 E2.64221
N4162 G1 X191.084 Y118.916 E1.03439
N4163 G1 X191.084 Y201.024 E2.64028
N4164 ; COOLING_NODE: 0
N4165 M204 S10000
N4166 G1 X191.491 Y201.491 F60000
N4167 G1 F4421.739
N4168 M204 S8000
N4169 G1 X158.509 Y201.491 E1.06057
N4170 G1 X158.509 Y118.509 E2.66839
N4171 G1 X191.491 Y118.509 E1.06057
N4172 G1 X191.491 Y201.431 E2.66646
N4173 ; COOLING_NODE: 0
N4174 M204 S10000
N4175 G1 X191.898 Y201.898 F60000
N4176 G1 F4421.739
N4177 M204 S8000
N4178 G1 X158.102 Y201.898 E1.08675
N4179 G1 X158.102 Y118.102 E2.69457
N4180 G1 X191.898 Y118.102 E1.08675
N4181 G1 X191.898 Y201.838 E2.69264
N4182 ; COOLING_NODE: 0
N4183 M204 S10000
N4184 G1 X192.29 Y202.29 F60000
N4185 ; FEATURE: Outer wall
N4186 ; LINE_WIDTH: 0.42
N4187 G1 F4773.528
N4188 M204 S5000
N4189 G1 X157.71 Y202.29 E1.03002
N4190 G1 X157.71 Y117.71 E2.51935
N4191 G1 X192.29 Y117.71 E1.03002
N4192 G1 X192.29 Y202.23 E2.51756
N4193 G1 E-.8 F1800
N4194 M204 S10000
N4195 G1 X187.011 Y200.736 Z1.4 F60000
N4196 G1 Z1
N4197 G1 E.8 F1800
N4198 ; FEATURE: Sparse infill
N4199 ; LINE_WIDTH: 0.45
N4200 G1 F4421.739
N4201 M204 S8000
N4202 G1 X188.639 Y200.736 E.05236
N4203 G1 X190.736 Y192.912 E.26044
N4204 G1 X190.736 Y190.231 E.08622
N4205 G1 X159.264 Y198.664 E1.0477
N4206 G1 X159.264 Y200.736 E.06663
N4207 G1 X163.353 Y200.736 E.13147
N4208 G1 X185.183 Y119.264 E2.71223
N4209 G1 X181.32 Y119.264 E.12421
N4210 G1 X190.736 Y128.68 E.42817
N4211 G1 X190.736 Y129.999 E.04242
N4212 G1 X171.782 Y200.736 E2.35488
N4213 G1 X170.68 Y200.736 E.03543
N4214 G1 X159.264 Y189.32 E.51912
N4215 G1 X159.264 Y190.235 E.02941
N4216 G1 X190.736 Y181.802 E1.0477
N4217 G1 X190.736 Y186.249 E.14301
N4218 G1 X159.264 Y154.778 E1.43118
N4219 G1 X159.264 Y153.08 E.0546
N4220 G1 X168.325 Y119.264 E1.12576
N4221 G1 X169.806 Y119.264 E.04762
N4222 G1 X190.736 Y140.194 E.95178
N4223 G1 X190.736 Y139.658 E.01722
N4224 G1 X159.264 Y148.091 E1.0477
N4225 G1 X159.264 Y146.462 E.05236
N4226 M204 S10000
N4227 G1 X159.264 Y158.148 F60000
N4228 G1 F4421.739
N4229 M204 S8000
N4230 G1 X159.264 Y156.52 E.05236
N4231 G1 X190.736 Y148.087 E1.0477
N4232 G1 X190.736 Y151.708 E.11643
N4233 G1 X159.264 Y120.237 E1.43118
N4234 G1 X159.264 Y119.264 E.03126
N4235 M73 P34 R41
N4236 G1 X159.897 Y119.264 E.02033
N4237 G1 X159.264 Y121.624 E.07854
N4238 G1 X159.264 Y122.804 E.03797
N4239 G1 X172.476 Y119.264 E.43981
N4240 G1 X176.754 Y119.264 E.13758
N4241 G1 X159.264 Y184.537 E2.17297
N4242 G1 X159.264 Y186.165 E.05236
N4243 M204 S10000
N4244 G1 X159.264 Y171.749 F60000
N4245 G1 F4421.739
N4246 M204 S8000
N4247 G1 X159.264 Y173.377 E.05236
N4248 G1 X190.736 Y164.945 E1.0477
N4249 G1 X190.736 Y163.222 E.0554
N4250 G1 X159.264 Y131.751 E1.43118
N4251 G1 X159.264 Y131.233 E.01664
N4252 G1 X190.736 Y122.801 E1.0477
N4253 G1 X190.736 Y121.172 E.05236
N4254 M204 S10000
N4255 G1 X190.736 Y131.229 F60000
N4256 G1 F4421.739
N4257 M204 S8000
N4258 G1 X159.264 Y139.662 E1.0477
N4259 G1 X159.264 Y143.264 E.11584
N4260 G1 X190.736 Y174.736 E1.43118
N4261 G1 X190.736 Y173.373 E.0438
N4262 G1 X159.264 Y181.806 E1.0477
N4263 G1 X159.264 Y177.806 E.12861
N4264 G1 X182.194 Y200.736 E1.04273
N4265 G1 X182.988 Y200.736 E.02555
N4266 G1 X190.736 Y198.66 E.25791
N4267 G1 X190.736 Y197.763 E.02882
N4268 G1 X159.264 Y166.292 E1.43118
N4269 G1 X159.264 Y164.948 E.04322
N4270 G1 X190.736 Y156.516 E1.0477
N4271 G1 X190.736 Y161.456 E.15885
N4272 G1 X180.21 Y200.736 E1.30766
N4273 G1 X178.582 Y200.736 E.05236
N4274 ; WIPE_START
N4275 G1 X180.21 Y200.736 E-.61876
N4276 G1 X180.307 Y200.377 E-.14124
N4277 ; WIPE_END
N4278 G1 E-.04 F1800
N4279 M204 S10000
N4280 G17
N4281 G3 Z1.4 I1.217 J0 P1  F60000
N4282 ; stop printing object, unique label id: 372
N4283 M625
N4284 ; object ids of layer 5 start: 372,407
N4285 M624 AwAAAAAAAAA=
N4286 ;======== H2D 20250527========
N4287 ; SKIPPABLE_START
N4288 ; SKIPTYPE: timelapse
N4289 M622.1 S1 ; for prev firware, default turned on
N4290 
N4291 M1002 judge_flag timelapse_record_flag
N4292 
N4293 M622 J1
N4294 M993 A2 B2 C2
N4295 M993 A0 B0 C0
N4296 
N4297 
N4298 
N4299 
N4300     M9711 M0 E1 X261 Y132 Z1.4 S11 C10 O0 T3000
N4301 
N4302 
N4303 
N4304 M993 A3 B3 C3
N4305 
N4306 M623
N4307 ; SKIPPABLE_END
N4308 
N4309 ; object ids of this layer5 end: 372,407
N4310 M625
N4311 G1 X167.495 Y279.064
N4312 G1 Z1
N4313 G1 E.8 F1800
N4314 ; LAYER_HEIGHT: 0.200000
N4315 ; FEATURE: Prime tower
N4316 ; LINE_WIDTH: 0.500000
N4317 ; WIPE_TOWER_START
N4318 M204 S10000
N4319 G1  X166.995 Y279.564  
N4320 M204 S8000
N4321 G3  X165.064 Y277.242   I3.871 J-5.183 E0.1159 F3938
N4322 G3  X166.240 Y274.649   I2.902 J-0.247 E0.1130
N4323 G2  X166.995 Y272.245   I-3.465 J-2.409 E0.0972
N4324 G2  X166.992 Y259.212   I-321.195 J-6.431 E0.4954
N4325 G2  X165.146 Y255.634   I-6.663 J1.171 E0.1554
N4326 G3  X165.661 Y253.471   I1.721 J-0.733 E0.0905
N4327 G1 E-0.8000 F1800
N4328 M204 S10000
N4329 G1  X167.381 Y251.657   F600
N4330 G1 E0.8000 F1800
N4331 M204 S8000
N4332 G3  X170.238 Y250.033   I2.765 J1.539 E0.1313 F3938
N4333 G3  X172.775 Y251.633   I-12.405 J22.473 E0.1141
N4334 G2  X174.808 Y252.064   I2.042 J-4.626 E0.0796
N4335 G2  X188.372 Y252.060   I6.687 J-357.435 E0.5155
N4336 G2  X192.307 Y250.183   I-0.499 J-6.110 E0.1694
N4337 G3  X194.619 Y250.613   I0.854 J1.838 E0.0953
N4338 G1  X195.995 Y252.064   E0.0760
N4339 G1 E0.0000
N4340 G3  X197.926 Y254.386   I-3.871 J5.182 E0.1159
N4341 G3  X196.750 Y256.979   I-2.902 J0.247 E0.1130
N4342 G2  X195.995 Y259.382   I3.464 J2.409 E0.0972
N4343 G2  X195.998 Y272.416   I321.212 J6.432 E0.4954
N4344 G2  X197.844 Y275.994   I6.663 J-1.171 E0.1554
N4345 G3  X197.504 Y277.972   I-1.658 J0.734 E0.0808
N4346 G1  X195.995 Y279.564   E0.0834
N4347 G3  X193.533 Y281.605   I-4.373 J-2.768 E0.1236
N4348 G3  X190.885 Y280.355   I0.012 J-3.454 E0.1149
N4349 G2  X188.182 Y279.564   I-2.709 J4.247 E0.1085
N4350 G2  X174.618 Y279.568   I-6.687 J357.435 E0.5155
N4351 G2  X170.683 Y281.445   I0.499 J6.110 E0.1694
N4352 G3  X168.371 Y281.015   I-0.854 J-1.838 E0.0953
N4353 G1  X166.995 Y279.564   E0.0760
N4354 ; WIPE_TOWER_END
N4355 G1  X167.495 Y252.064  
N4356 ; LAYER_HEIGHT: 0.200000
N4357 ; FEATURE: Prime tower
N4358 ; LINE_WIDTH: 0.500000
N4359 ; WIPE_TOWER_START
N4360 M204 S8000
N4361 G1  Y272.314  E0.2565
N4362 G1  X195.495  E1.0642
N4363 G1  Y279.064  E0.2565
N4364 G1  X167.495  E1.0642
N4365 M204 S10000
N4366 G1  X168.495 Y272.314  
N4367 ;--------------------
N4368 ; CP EMPTY GRID START
N4369 ; layer #6
N4370 M204 S8000
N4371 G1  Y279.064  E0.2565
N4372 M204 S10000
N4373 G1  X177.162 
N4374 M204 S8000
N4375 G1  Y272.314  E0.2565
N4376 M204 S10000
N4377 G1  X185.828 
N4378 M204 S8000
N4379 G1  Y279.064  E0.2565
N4380 M204 S10000
N4381 G1  X194.495 
N4382 M204 S8000
N4383 G1  Y272.314  E0.2565
N4384 ; CP EMPTY GRID END
N4385 ;------------------
N4386 
N4387 
N4388 
N4389 
N4390 
N4391 
N4392 ; WIPE_TOWER_END
N4393 ; LAYER_HEIGHT: 0.200000
N4394 ; FEATURE: Prime tower
N4395 ; LINE_WIDTH: 0.500000
N4396 ;--------------------
N4397 ; CP TOOLCHANGE START
N4398 ; toolchange #5
N4399 ; material : TPU -> TPU
N4400 ;--------------------
N4401 M220 B
N4402 M220 S100
N4403 ; WIPE_TOWER_START
N4404 G1 E-.8 F1800
N4405 G17
N4406 G3 Z1.4 I1.217 J0 P1  F60000
N4407 G1 X167.745 Y266.314
N4408 G1 Z1
N4409 G1 E.8 F1800
N4410 ; LAYER_HEIGHT: 0.200000
N4411 ; FEATURE: Prime tower
N4412 ; LINE_WIDTH: 1.000000
N4413 ; NOZZLE_CHANGE_START OF0 NF1
N4414 M204 S8000
N4415 G1  X195.245 Y266.314  E2.1885 F1881
N4416 G1  Y267.564  E0.0995
N4417 G1  X167.745  E2.1885
N4418 G1  Y268.814  E0.0995
N4419 G1  X195.245  E2.1885
N4420 G1  Y270.064  E0.0995
N4421 G1  X167.745  E2.1885
N4422 G1  Y271.314  E0.0995
N4423 G1  X195.245  E2.1885
N4424 ; NOZZLE_CHANGE_END OF0 NF1
N4425 M104 T1 S161 N0 ;Multi extruder pre cooling
N4426 
N4427 ; WIPE_START
N4428 G1 F5400
N4429 M204 S8000
N4430 G1 X193.245 Y271.314 E-1.9
N4431 ; WIPE_END
N4432 G1 E-.1 F1800
N4433 M204 S10000
N4434 G17
N4435 G3 Z1.4 I1.217 J0 P1  F5400
N4436 ; filament end gcode 
N4437 
N4438 ;======== H2D ========
N4439 ;===== 20250604 =====
N4440 M993 A2 B2 C2 ; nozzle cam detection allow status save.
N4441 M993 A0 B0 C0 ; nozzle cam detection not allowed.
N4442 
N4443 
N4444 M1015.4 S0 ; disable E air printing detect
N4445 
N4446 
N4447 M620 S1A
N4448 M1002 gcode_claim_action : 4
N4449 M204 S9000
N4450 
N4451 G1 Z4 F1200
N4452 
N4453 M400
N4454 M106 P1 S0
N4455 M106 P2 S0
N4456 
N4457 
N4458 
N4459 
N4460 M620.10 A0 F149.669 L0 H0.4 T270 P255 S1
N4461 
N4462 
N4463 
N4464 M620.10 A1 F79.8237 L0 H0.4 T250 P240 S1
N4465 
N4466 
N4467 
N4468 M620.11 P0 I0 E0
N4469 
N4470 
N4471 
N4472 M620.11 K1 I0 R10 F200
N4473 
N4474 
N4475 M628 S1
N4476 
N4477 
N4478 M620.11 S1 L0 I0 R10 D8 E-10 F200
N4479 
N4480 
N4481 M629
N4482 
N4483 
N4484 M620.11 H2 C331
N4485 
N4486 
N4487 T1
N4488 M73 E1
N4489 
N4490 ;deretract
N4491 
N4492 
N4493 
N4494 ; VFLUSH_START
N4495 
N4496 
N4497 ;VG1 E0 F79
N4498 
N4499 
N4500 SYNC T0
N4501 
N4502 ; VFLUSH_END
N4503 
N4504 M1002 set_filament_type:TPU
N4505 
N4506 M400
N4507 M83
N4508 
N4509 
N4510 
N4511 M628 S0
N4512 ;VM109 S240
N4513 M629
N4514 M400
N4515 
N4516 M983.3 F1.33333 A0.4
N4517 
N4518 
N4519 M400
N4520 
N4521 G1 Y320 F30000
N4522 G1 X201
N4523 
N4524 M73 P34 R40
N4525 G1 Y295
N4526 G1 Y265 F18000
N4527 G1 Z4 F3000
N4528 
N4529 M204 S8000
N4530 
N4531 
N4532 M621 S1A
N4533 
N4534 M993 A3 B3 C3 ; nozzle cam detection allow status restore.
N4535 
N4536 
N4537 M1015.3 S1;enable tpu clog detect
N4538 
N4539 
N4540 
N4541 M1015.4 S0 ; disable E air printing detect
N4542 
N4543 
N4544 M620.6 I1 W1 ;enable ams air printing detect
N4545 M1002 gcode_claim_action : 0
N4546 M106 S255
N4547 M106 P2 S255
N4548 G1 X200 Y264.673 F60000
N4549 G1 Z1
N4550 G1 X200 Y257.04 Z1.4
N4551 G1 X200 Y247.99 Z1.4
N4552 G1 X162.991 Y247.99
N4553 G1 X162.991 Y252.564
N4554 G1 X167.495 Y252.564
N4555 
N4556 ; filament start gcode
N4557 G1 Z1
N4558 G1 E2 F1800
N4559 
N4560 G4 S0
N4561 ; CP TOOLCHANGE WIPE
N4562 ; LINE_WIDTH: 0.500000
N4563 M204 S8000
N4564 G1  X170.495 Y252.564  E0.1140 F1782
N4565 G1 E-0.8000 F1800
N4566 M204 S10000
N4567 G1  X165.995  F600
N4568 G1  X167.495  F240
N4569 G1  X167.995  F600
N4570 G1  Y253.064 
N4571 G1  X166.995 
N4572 G1  Y252.064 
N4573 G1  X168.495 
N4574 G1  Y253.564 
N4575 G1  X166.495 
N4576 G1  Y251.564 
N4577 G1  X170.495 Y252.564   F1782
N4578 G1 E0.8000 F1800
N4579 M204 S8000
N4580 G1  X195.495  E0.9502 F1782
N4581 G1  Y253.314  E0.0285
N4582 G1  X167.495  E1.0642 F2025
N4583 G1  Y254.064  E0.0285
N4584 G1  X195.495  E1.0642 F2100
N4585 G1  Y254.814  E0.0285
N4586 G1  X167.495  E1.0642
N4587 G1  Y255.564  E0.0285
N4588 G1  X195.495  E1.0642
N4589 G1  Y256.314  E0.0285
N4590 G1  X167.495  E1.0642
N4591 G1  Y257.064  E0.0285
N4592 G1  X195.495  E1.0642
N4593 G1  Y257.814  E0.0285
N4594 G1  X167.495  E1.0642
N4595 G1  Y258.564  E0.0285
N4596 G1  X195.495  E1.0642
N4597 G1  Y259.314  E0.0285
N4598 G1  X167.495  E1.0642
N4599 G1  Y260.064  E0.0285
N4600 G1  X195.495  E1.0642
N4601 G1  Y260.814  E0.0285
N4602 G1  X167.495  E1.0642
N4603 G1  Y261.564  E0.0285
N4604 G1  X195.495  E1.0642
N4605 G1  Y262.314  E0.0285
N4606 G1  X167.495  E1.0642
N4607 G1  Y263.064  E0.0285
N4608 M73 P35 R40
N4609 G1  X195.495  E1.0642
N4610 G1  Y263.814  E0.0285
N4611 G1  X167.495  E1.0642
N4612 G1  Y264.564  E0.0285
N4613 G1  X195.495  E1.0642
N4614 G1  Y265.314  E0.0285
N4615 G1  X167.495  E1.0642
N4616 ; WIPE_TOWER_END
N4617 M220 R
N4618 G1 F60000
N4619 G4 S0
N4620 G92 E0
N4621 ; CP TOOLCHANGE END
N4622 ;------------------
N4623 
N4624 
N4625 
N4626 ; WIPE_START
N4627 G1 F5400
N4628 M204 S8000
N4629 G1 X169.495 Y265.314 E-.76
N4630 ; WIPE_END
N4631 G1 E-.04 F1800
N4632 M204 S10000
N4633 G17
N4634 G3 Z1.4 I1.217 J0 P1  F60000
N4635 ; OBJECT_ID: 407
N4636 ; COOLING_NODE: 0
N4637 ; start printing object, unique label id: 407
N4638 M624 AgAAAAAAAAA=
N4639 G1 X192.875 Y103.671
N4640 G1 Z1
N4641 G1 E.8 F1800
N4642 ; FEATURE: Outer wall
N4643 ; LINE_WIDTH: 0.42
N4644 ; LAYER_HEIGHT: 0.2
N4645 G1 F2545.881
N4646 M204 S5000
N4647 G1 X158.295 Y103.671 E1.08423
N4648 G1 X158.295 Y103.091 E.01819
N4649 G1 X192.875 Y103.091 E1.08423
N4650 G1 X192.875 Y103.611 E.0163
N4651 M204 S10000
N4652 G1 X192.679 Y103.381 F60000
N4653 ; FEATURE: Gap infill
N4654 ; LINE_WIDTH: 0.23088
N4655 G1 F5107.47
N4656 M204 S8000
N4657 G1 X158.491 Y103.381 E.53432
N4658 ; CHANGE_LAYER
N4659 ; Z_HEIGHT: 1.2
N4660 ; LAYER_HEIGHT: 0.2
N4661 ; WIPE_START
N4662 G1 F5107.47
N4663 G1 X160.491 Y103.381 E-.76
N4664 ; WIPE_END
N4665 G1 E-.04 F1800
N4666 ; stop printing object, unique label id: 407
N4667 M625
N4668 ;======== H2D 20250521========
N4669 ; layer num/total_layer_count: 6/75
N4670 ; update layer progress
N4671 M73 L6
N4672 M991 S0 P5 ;notify layer change
N4673 
N4674 
N4675 ; LAYER_HEIGHT: 0.200000
N4676 ; FEATURE: Prime tower
N4677 ; LINE_WIDTH: 0.500000
N4678 ;--------------------
N4679 ; CP TOOLCHANGE START
N4680 ; toolchange #6
N4681 ; material : PCTG -> PCTG
N4682 ;--------------------
N4683 M220 B
N4684 M220 S100
N4685 ; WIPE_TOWER_START
N4686 M204 S10000
N4687 G17
N4688 G3 Z1.4 I1.217 J0 P1  F60000
N4689 G1 X162.524 Y145.271
N4690 G1 X167.745 Y252.814
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=1.100G1 Z1.100 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N4160 G1 X158.916 Y201.084 E1.03439
N4161 G1 X158.916 Y118.916 E2.64221
N4162 G1 X191.084 Y118.916 E1.03439
N4163 G1 X191.084 Y201.024 E2.64028
N4169 G1 X158.509 Y201.491 E1.06057
N4170 G1 X158.509 Y118.509 E2.66839
N4171 G1 X191.491 Y118.509 E1.06057
N4172 G1 X191.491 Y201.431 E2.66646
N4178 G1 X158.102 Y201.898 E1.08675
N4179 G1 X158.102 Y118.102 E2.69457
N4180 G1 X191.898 Y118.102 E1.08675
N4181 G1 X191.898 Y201.838 E2.69264
N4189 G1 X157.71 Y202.29 E1.03002
N4190 G1 X157.71 Y117.71 E2.51935
N4191 G1 X192.29 Y117.71 E1.03002
N4192 G1 X192.29 Y202.23 E2.51756
N4202 G1 X188.639 Y200.736 E.05236
N4203 G1 X190.736 Y192.912 E.26044
N4204 G1 X190.736 Y190.231 E.08622
N4205 G1 X159.264 Y198.664 E1.0477
N4206 G1 X159.264 Y200.736 E.06663
N4207 G1 X163.353 Y200.736 E.13147
N4208 G1 X185.183 Y119.264 E2.71223
N4209 G1 X181.32 Y119.264 E.12421
N4210 G1 X190.736 Y128.68 E.42817
N4211 G1 X190.736 Y129.999 E.04242
N4212 G1 X171.782 Y200.736 E2.35488
N4213 G1 X170.68 Y200.736 E.03543
N4214 G1 X159.264 Y189.32 E.51912
N4215 G1 X159.264 Y190.235 E.02941
N4216 G1 X190.736 Y181.802 E1.0477
N4217 G1 X190.736 Y186.249 E.14301
N4218 G1 X159.264 Y154.778 E1.43118
N4219 G1 X159.264 Y153.08 E.0546
N4220 G1 X168.325 Y119.264 E1.12576
N4221 G1 X169.806 Y119.264 E.04762
N4222 G1 X190.736 Y140.194 E.95178
N4223 G1 X190.736 Y139.658 E.01722
N4224 G1 X159.264 Y148.091 E1.0477
N4225 G1 X159.264 Y146.462 E.05236
N4230 G1 X159.264 Y156.52 E.05236
N4231 G1 X190.736 Y148.087 E1.0477
N4232 G1 X190.736 Y151.708 E.11643
N4233 G1 X159.264 Y120.237 E1.43118
N4234 G1 X159.264 Y119.264 E.03126
N4236 G1 X159.897 Y119.264 E.02033
N4237 G1 X159.264 Y121.624 E.07854
N4238 G1 X159.264 Y122.804 E.03797
N4239 G1 X172.476 Y119.264 E.43981
N4240 G1 X176.754 Y119.264 E.13758
N4241 G1 X159.264 Y184.537 E2.17297
N4242 G1 X159.264 Y186.165 E.05236
N4247 G1 X159.264 Y173.377 E.05236
N4248 G1 X190.736 Y164.945 E1.0477
N4249 G1 X190.736 Y163.222 E.0554
N4250 G1 X159.264 Y131.751 E1.43118
N4251 G1 X159.264 Y131.233 E.01664
N4252 G1 X190.736 Y122.801 E1.0477
N4253 G1 X190.736 Y121.172 E.05236
N4258 G1 X159.264 Y139.662 E1.0477
N4259 G1 X159.264 Y143.264 E.11584
N4260 G1 X190.736 Y174.736 E1.43118
N4261 G1 X190.736 Y173.373 E.0438
N4262 G1 X159.264 Y181.806 E1.0477
N4263 G1 X159.264 Y177.806 E.12861
N4264 G1 X182.194 Y200.736 E1.04273
N4265 G1 X182.988 Y200.736 E.02555
N4266 G1 X190.736 Y198.66 E.25791
N4267 G1 X190.736 Y197.763 E.02882
N4268 G1 X159.264 Y166.292 E1.43118
N4269 G1 X159.264 Y164.948 E.04322
N4270 G1 X190.736 Y156.516 E1.0477
N4271 G1 X190.736 Y161.456 E.15885
N4272 G1 X180.21 Y200.736 E1.30766
N4273 G1 X178.582 Y200.736 E.05236
N4275 G1 X180.21 Y200.736 E-.61876
N4276 G1 X180.307 Y200.377 E-.14124
N4338 G1  X195.995 Y252.064   E0.0760
N4346 G1  X195.995 Y279.564   E0.0834
N4353 G1  X166.995 Y279.564   E0.0760
N4361 G1  Y272.314  E0.2565
N4362 G1  X195.495  E1.0642
N4363 G1  Y279.064  E0.2565
N4364 G1  X167.495  E1.0642
N4371 G1  Y279.064  E0.2565
N4375 G1  Y272.314  E0.2565
N4379 G1  Y279.064  E0.2565
N4383 G1  Y272.314  E0.2565
N4415 G1  X195.245 Y266.314  E2.1885 F1881
N4416 G1  Y267.564  E0.0995
N4417 G1  X167.745  E2.1885
N4418 G1  Y268.814  E0.0995
N4419 G1  X195.245  E2.1885
N4420 G1  Y270.064  E0.0995
N4421 G1  X167.745  E2.1885
N4422 G1  Y271.314  E0.0995
N4423 G1  X195.245  E2.1885
N4430 G1 X193.245 Y271.314 E-1.9
N4564 G1  X170.495 Y252.564  E0.1140 F1782
N4580 G1  X195.495  E0.9502 F1782
N4581 G1  Y253.314  E0.0285
N4582 G1  X167.495  E1.0642 F2025
N4583 G1  Y254.064  E0.0285
N4584 G1  X195.495  E1.0642 F2100
N4585 G1  Y254.814  E0.0285
N4586 G1  X167.495  E1.0642
N4587 G1  Y255.564  E0.0285
N4588 G1  X195.495  E1.0642
N4589 G1  Y256.314  E0.0285
N4590 G1  X167.495  E1.0642
N4591 G1  Y257.064  E0.0285
N4592 G1  X195.495  E1.0642
N4593 G1  Y257.814  E0.0285
N4594 G1  X167.495  E1.0642
N4595 G1  Y258.564  E0.0285
N4596 G1  X195.495  E1.0642
N4597 G1  Y259.314  E0.0285
N4598 G1  X167.495  E1.0642
N4599 G1  Y260.064  E0.0285
N4600 G1  X195.495  E1.0642
N4601 G1  Y260.814  E0.0285
N4602 G1  X167.495  E1.0642
N4603 G1  Y261.564  E0.0285
N4604 G1  X195.495  E1.0642
N4605 G1  Y262.314  E0.0285
N4606 G1  X167.495  E1.0642
N4607 G1  Y263.064  E0.0285
N4609 G1  X195.495  E1.0642
N4610 G1  Y263.814  E0.0285
N4611 G1  X167.495  E1.0642
N4612 G1  Y264.564  E0.0285
N4613 G1  X195.495  E1.0642
N4614 G1  Y265.314  E0.0285
N4615 G1  X167.495  E1.0642
N4629 G1 X169.495 Y265.314 E-.76
N4647 G1 X158.295 Y103.671 E1.08423
N4648 G1 X158.295 Y103.091 E.01819
N4649 G1 X192.875 Y103.091 E1.08423
N4650 G1 X192.875 Y103.611 E.0163
N4657 G1 X158.491 Y103.381 E.53432
N4663 G1 X160.491 Y103.381 E-.76
T0 ;TOOL_CHANGE:0 ; Revert to base toolN4691 G1 Z1.2
N4692 G1 E.8 F1800
N4693 ; LAYER_HEIGHT: 0.200000
N4694 ; FEATURE: Prime tower
N4695 ; LINE_WIDTH: 1.000000
N4696 ; NOZZLE_CHANGE_START OF1 NF0
N4697 M104 T0 S210 N0 ;Multi extruder pre cooling in post extrusion
N4698 M204 S8000
N4699 G1  X195.245 Y252.814  E2.1885 F251
N4700 G1  Y254.314  E0.1194
N4701 G1  X167.745  E2.1885
N4702 G1  Y255.814  E0.1194
N4703 G1  X195.245  E2.1885
N4704 G1  Y257.314  E0.1194
N4705 M104 T1 S255 N0 ;Multi extruder pre heating
N4706 G1  X167.745  E2.1885
N4707 G1  Y258.814  E0.1194
N4708 G1  X195.245  E2.1885
N4709 M204 S10000
N4710 G1  Y259.814 
N4711 G1  X168.245  F398
N4712 G1  Y258.314 
N4713 M73 P36 R40
N4714 G1  X194.745 
N4715 G1  Y256.814 
N4716 M73 P36 R39
N4717 G1  X168.245 
N4718 G1  Y255.314 
N4719 G1  X194.745 
N4720 G1  Y253.814 
N4721 G1  X168.245 
N4722 ; NOZZLE_CHANGE_END OF1 NF0
N4723 M104 T0 S0 N0 ;Multi extruder pre cooling
N4724 
N4725 G1 E-2 F1800
N4726 G17
N4727 G3 Z1.6 I1.217 J0 P1  F5400
N4728 ; filament end gcode 
N4729 
N4730 ;======== H2D ========
N4731 ;===== 20250604 =====
N4732 M993 A2 B2 C2 ; nozzle cam detection allow status save.
N4733 M993 A0 B0 C0 ; nozzle cam detection not allowed.
N4734 
N4735 
N4736 M1015.4 S0 ; disable E air printing detect
N4737 
N4738 
N4739 M620 S0A
N4740 M1002 gcode_claim_action : 4
N4741 M204 S9000
N4742 
N4743 G1 Z4.2 F1200
N4744 
N4745 M400
N4746 M106 P1 S0
N4747 M106 P2 S0
N4748 
N4749 
N4750 
N4751 
N4752 M620.10 A0 F79.8237 L0 H0.4 T250 P240 S1
N4753 
N4754 
N4755 
N4756 M620.10 A1 F149.669 L0 H0.4 T270 P255 S1
N4757 
N4758 
N4759 
N4760 M620.11 P0 I1 E0
N4761 
N4762 
N4763 
N4764 M620.11 K1 I1 R0 F200
N4765 
N4766 
N4767 M628 S1
N4768 
N4769 M620.11 S0 L0 I1 E-10 F200
N4770 
N4771 M629
N4772 
N4773 
N4774 M620.11 H2 C331
N4775 
N4776 
N4777 T0
N4778 M73 E0
N4779 
N4780 ;deretract
N4781 
N4782 
N4783 ;VG1 E4 F200
N4784 ;VG1 E4 F100
N4785 
N4786 
N4787 
N4788 ; VFLUSH_START
N4789 
N4790 
N4791 ;VG1 E0 F79
N4792 
N4793 
N4794 SYNC T0
N4795 
N4796 ; VFLUSH_END
N4797 
N4798 M1002 set_filament_type:PCTG
N4799 
N4800 M400
N4801 M83
N4802 
N4803 
N4804 
N4805 M628 S0
N4806 ;VM109 S255
N4807 M629
N4808 M400
N4809 
N4810 M983.3 F2.5 A0.4
N4811 
N4812 
N4813 M400
N4814 
N4815 G1 Y320 F30000
N4816 G1 X201
N4817 
N4818 G1 Y295
N4819 G1 Y265 F18000
N4820 G1 Z4.2 F3000
N4821 
N4822 M204 S8000
N4823 
N4824 
N4825 M621 S0A
N4826 
N4827 M993 A3 B3 C3 ; nozzle cam detection allow status restore.
N4828 
N4829 
N4830 M1015.3 S0;disable tpu clog detect
N4831 
N4832 
N4833 
N4834 M1015.4 S0 ; disable E air printing detect
N4835 
N4836 
N4837 M620.6 I0 W1 ;enable ams air printing detect
N4838 M1002 gcode_claim_action : 0
N4839 M106 S25.5
N4840 M106 P2 S0
N4841 G1 X200 Y278.814 F60000
N4842 G1 Z1.2
N4843 G1 X195.495 Y278.814 Z1.6
N4844 
N4845 ; filament start gcode
N4846 G1 Z1.2
N4847 G1 E2 F1800
N4848 
N4849 G4 S0
N4850 ; CP TOOLCHANGE WIPE
N4851 ; LINE_WIDTH: 0.500000
N4852 M204 S8000
N4853 G1  X192.495 Y278.814  E0.1140 F1782
N4854 G1 E-0.8000 F1800
N4855 M204 S10000
N4856 G1  X196.995  F600
N4857 G1  X195.495  F240
N4858 G1  X195.995  F600
N4859 G1  Y279.314 
N4860 G1  X194.995 
N4861 G1  Y278.314 
N4862 G1  X196.495 
N4863 G1  Y279.814 
N4864 G1  X194.495 
N4865 G1  Y277.814 
N4866 G1  X192.495 Y278.814   F1782
N4867 G1 E0.8000 F1800
N4868 M204 S8000
N4869 M73 P37 R39
N4870 G1  X167.495  E0.9502 F1782
N4871 G1  Y278.064  E0.0285
N4872 G1  X195.495  E1.0642 F2025
N4873 G1  Y277.314  E0.0285
N4874 G1  X167.495  E1.0642 F2473
N4875 G1  Y276.564  E0.0285
N4876 G1  X195.495  E1.0642 F3938
N4877 G1  Y275.814  E0.0285
N4878 G1  X167.495  E1.0642
N4879 G1  Y275.064  E0.0285
N4880 G1  X195.495  E1.0642
N4881 G1  Y274.314  E0.0285
N4882 G1  X167.495  E1.0642
N4883 G1  Y273.564  E0.0285
N4884 G1  X195.495  E1.0642
N4885 G1  Y272.814  E0.0285
N4886 G1  X167.495  E1.0642
N4887 G1  Y272.064  E0.0285
N4888 G1  X195.495  E1.0642
N4889 G1  Y271.314  E0.0285
N4890 G1  X167.495  E1.0642
N4891 G1  Y270.564  E0.0285
N4892 G1  X195.495  E1.0642
N4893 G1  Y269.814  E0.0285
N4894 G1  X167.495  E1.0642
N4895 G1  Y269.064  E0.0285
N4896 G1  X195.495  E1.0642
N4897 G1  Y268.314  E0.0285
N4898 G1  X167.495  E1.0642
N4899 G1  Y267.564  E0.0285
N4900 G1  X195.495  E1.0642
N4901 G1  Y266.814  E0.0285
N4902 G1  X167.495  E1.0642
N4903 G1  Y266.064  E0.0285
N4904 G1  X195.495  E1.0642
N4905 ; WIPE_TOWER_END
N4906 M220 R
N4907 G1 F60000
N4908 G4 S0
N4909 G92 E0
N4910 ; CP TOOLCHANGE END
N4911 ;------------------
N4912 
N4913 
N4914 G1  Y252.064  
N4915 ; LAYER_HEIGHT: 0.200000
N4916 ; FEATURE: Prime tower
N4917 ; LINE_WIDTH: 0.500000
N4918 ; WIPE_TOWER_START
N4919 M204 S10000
N4920 G1  X195.846 Y279.721  
N4921 M204 S8000
N4922 G3  X193.064 Y281.636   I-3.469 J-2.060 E0.1325 F3938
N4923 G3  X190.723 Y280.255   I1.448 J-5.129 E0.1045
N4924 G2  X188.182 Y279.564   I-2.568 J4.426 E0.1012
N4925 G2  X174.618 Y279.568   I-6.687 J357.435 E0.5155
N4926 G2  X170.683 Y281.445   I0.499 J6.110 E0.1694
N4927 G3  X168.371 Y281.015   I-0.854 J-1.838 E0.0953
N4928 G1  X166.995 Y279.564   E0.0760
N4929 G3  X165.064 Y277.242   I3.871 J-5.183 E0.1159
N4930 G3  X166.240 Y274.649   I2.902 J-0.247 E0.1130
N4931 G2  X166.995 Y272.245   I-3.465 J-2.409 E0.0972
N4932 G2  X166.992 Y259.212   I-321.195 J-6.431 E0.4954
N4933 G2  X165.146 Y255.634   I-6.663 J1.171 E0.1554
N4934 G3  X165.485 Y253.656   I1.658 J-0.734 E0.0808
N4935 G1  X168.371 Y250.613   E0.1594
N4936 G3  X171.793 Y251.056   I1.525 J1.652 E0.1495
N4937 G2  X174.808 Y252.064   I3.021 J-4.025 E0.1229
N4938 G2  X188.372 Y252.060   I6.687 J-357.435 E0.5155
N4939 G2  X192.307 Y250.183   I-0.499 J-6.110 E0.1694
N4940 G3  X194.619 Y250.613   I0.854 J1.838 E0.0953
N4941 G1  X195.995 Y252.064   E0.0760
N4942 G3  X197.926 Y254.386   I-3.871 J5.182 E0.1159
N4943 G3  X196.750 Y256.979   I-2.902 J0.247 E0.1130
N4944 G2  X195.995 Y259.382   I3.464 J2.409 E0.0972
N4945 G2  X195.998 Y272.416   I321.212 J6.432 E0.4954
N4946 G2  X197.844 Y275.994   I6.663 J-1.171 E0.1554
N4947 G3  X197.564 Y277.905   I-1.654 J0.733 E0.0774
N4948 ; WIPE_TOWER_END
N4949 
N4950 ; WIPE_START
N4951 G1 F5107.47
N4952 M204 S8000
N4953 G1 X197.598 Y277.866 E-.01975
N4954 G1 X197.683 Y277.752 E-.0539
N4955 G1 X197.759 Y277.632 E-.05389
N4956 G1 X197.825 Y277.506 E-.05389
N4957 G1 X197.88 Y277.376 E-.0539
N4958 G1 X197.926 Y277.242 E-.05389
N4959 G1 X197.961 Y277.104 E-.0539
N4960 G1 X197.985 Y276.964 E-.05389
N4961 G1 X197.998 Y276.823 E-.05391
N4962 G1 X198 Y276.681 E-.05388
N4963 G1 X197.99 Y276.54 E-.0539
N4964 G1 X197.97 Y276.4 E-.05389
N4965 G1 X197.939 Y276.261 E-.05389
N4966 G1 X197.896 Y276.126 E-.0539
N4967 G1 X197.858 Y276.029 E-.03963
N4968 ; WIPE_END
N4969 G1 E-.04 F1800
N4970 M204 S10000
N4971 G17
N4972 G3 Z1.6 I1.217 J0 P1  F60000
N4973 ; OBJECT_ID: 372
N4974 ; COOLING_NODE: 0
N4975 ; start printing object, unique label id: 372
N4976 M624 AQAAAAAAAAA=
N4977 G1 X191.084 Y201.084 Z1.2
N4978 G1 E.8 F1800
N4979 ; FEATURE: Inner wall
N4980 ; LINE_WIDTH: 0.45
N4981 ; LAYER_HEIGHT: 0.2
N4982 G1 F4421.739
N4983 M204 S8000
N4984 G1 X158.916 Y201.084 E1.03439
N4985 G1 X158.916 Y118.916 E2.64221
N4986 G1 X191.084 Y118.916 E1.03439
N4987 G1 X191.084 Y201.024 E2.64028
N4988 ; COOLING_NODE: 0
N4989 M204 S10000
N4990 G1 X191.491 Y201.491 F60000
N4991 G1 F4421.739
N4992 M204 S8000
N4993 G1 X158.509 Y201.491 E1.06057
N4994 G1 X158.509 Y118.509 E2.66839
N4995 G1 X191.491 Y118.509 E1.06057
N4996 G1 X191.491 Y201.431 E2.66646
N4997 ; COOLING_NODE: 0
N4998 M204 S10000
N4999 G1 X191.898 Y201.898 F60000
N5000 G1 F4421.739
N5001 M204 S8000
N5002 G1 X158.102 Y201.898 E1.08675
N5003 G1 X158.102 Y118.102 E2.69457
N5004 G1 X191.898 Y118.102 E1.08675
N5005 G1 X191.898 Y201.838 E2.69264
N5006 ; COOLING_NODE: 0
N5007 M204 S10000
N5008 G1 X192.29 Y202.29 F60000
N5009 ; FEATURE: Outer wall
N5010 ; LINE_WIDTH: 0.42
N5011 G1 F4773.528
N5012 M204 S5000
N5013 G1 X157.71 Y202.29 E1.03002
N5014 G1 X157.71 Y117.71 E2.51935
N5015 G1 X192.29 Y117.71 E1.03002
N5016 G1 X192.29 Y202.23 E2.51756
N5017 G1 E-.8 F1800
N5018 M204 S10000
N5019 G1 X190.121 Y200.736 Z1.6 F60000
N5020 G1 Z1.2
N5021 G1 E.8 F1800
N5022 ; FEATURE: Sparse infill
N5023 ; LINE_WIDTH: 0.45
N5024 G1 F4421.739
N5025 M204 S8000
N5026 G1 X188.493 Y200.736 E.05236
N5027 G1 X190.736 Y192.366 E.27863
N5028 G1 X190.736 Y190.377 E.06394
N5029 G1 X159.264 Y198.81 E1.04769
N5030 G1 X159.264 Y200.736 E.06192
N5031 G1 X163.206 Y200.736 E.12676
N5032 G1 X185.037 Y119.264 E2.71223
N5033 G1 X181.52 Y119.264 E.11307
N5034 G1 X190.736 Y128.48 E.41907
N5035 G1 X190.736 Y129.452 E.03128
N5036 G1 X171.635 Y200.736 E2.37307
N5037 G1 X170.88 Y200.736 E.0243
N5038 G1 X159.264 Y189.12 E.52822
N5039 G1 X159.264 Y190.381 E.04055
N5040 G1 X190.736 Y181.949 E1.0477
N5041 G1 X190.736 Y186.049 E.13187
N5042 G1 X159.264 Y154.578 E1.43118
N5043 G1 X159.264 Y152.534 E.06574
N5044 M73 P37 R38
N5045 G1 X168.179 Y119.264 E1.10757
N5046 G1 X170.006 Y119.264 E.05876
N5047 G1 X190.736 Y139.994 E.94268
N5048 G1 X190.736 Y139.805 E.00608
N5049 G1 X159.264 Y148.237 E1.0477
N5050 G1 X159.264 Y146.609 E.05236
N5051 M204 S10000
N5052 G1 X159.264 Y158.294 F60000
N5053 G1 F4421.739
N5054 M204 S8000
N5055 G1 X159.264 Y156.666 E.05236
N5056 G1 X190.736 Y148.233 E1.0477
N5057 G1 X190.736 Y151.508 E.10529
N5058 G1 X159.264 Y120.037 E1.43118
N5059 M204 S10000
N5060 G1 X161.379 Y119.264 F60000
N5061 G1 F4421.739
N5062 M204 S8000
N5063 G1 X159.75 Y119.264 E.05236
N5064 G1 X159.264 Y121.077 E.06035
N5065 G1 X159.264 Y122.951 E.06024
N5066 G1 X173.022 Y119.264 E.458
N5067 G1 X176.608 Y119.264 E.1153
N5068 G1 X159.264 Y183.991 E2.15478
N5069 G1 X159.264 Y185.619 E.05236
N5070 M204 S10000
N5071 G1 X159.264 Y180.324 F60000
N5072 G1 F4421.739
N5073 M204 S8000
N5074 G1 X159.264 Y181.952 E.05236
N5075 G1 X190.736 Y173.52 E1.0477
N5076 G1 X190.736 Y174.536 E.03267
N5077 G1 X159.264 Y143.064 E1.43118
N5078 G1 X159.264 Y139.808 E.1047
N5079 G1 X190.736 Y131.376 E1.0477
N5080 G1 X190.736 Y133.004 E.05236
N5081 M204 S10000
N5082 G1 X190.736 Y121.319 F60000
N5083 G1 F4421.739
N5084 M204 S8000
N5085 G1 X190.736 Y122.947 E.05236
N5086 G1 X159.264 Y131.38 E1.0477
N5087 G1 X159.264 Y131.551 E.0055
N5088 G1 X190.736 Y163.022 E1.43118
N5089 G1 X190.736 Y165.091 E.06654
N5090 G1 X159.264 Y173.524 E1.0477
N5091 G1 X159.264 Y177.606 E.13129
N5092 G1 X182.394 Y200.736 E1.05182
N5093 G1 X183.535 Y200.736 E.03669
N5094 G1 X190.736 Y198.806 E.23972
N5095 G1 X190.736 Y197.563 E.03996
N5096 G1 X159.264 Y166.092 E1.43118
N5097 G1 X159.264 Y165.095 E.03208
N5098 G1 X190.736 Y156.662 E1.0477
N5099 G1 X190.736 Y160.909 E.13657
N5100 M73 P38 R38
N5101 G1 X180.064 Y200.736 E1.32585
N5102 G1 X178.436 Y200.736 E.05236
N5103 ; WIPE_START
N5104 G1 X180.064 Y200.736 E-.61876
N5105 G1 X180.16 Y200.377 E-.14124
N5106 ; WIPE_END
N5107 G1 E-.04 F1800
N5108 M204 S10000
N5109 G17
N5110 G3 Z1.6 I1.217 J0 P1  F60000
N5111 ; stop printing object, unique label id: 372
N5112 M625
N5113 ; object ids of layer 6 start: 372
N5114 M624 AQAAAAAAAAA=
N5115 ;======== H2D 20250527========
N5116 ; SKIPPABLE_START
N5117 ; SKIPTYPE: timelapse
N5118 M622.1 S1 ; for prev firware, default turned on
N5119 
N5120 M1002 judge_flag timelapse_record_flag
N5121 
N5122 M622 J1
N5123 M993 A2 B2 C2
N5124 M993 A0 B0 C0
N5125 
N5126 
N5127 
N5128 
N5129     M9711 M0 E1 X261 Y132 Z1.6 S11 C10 O0 T3000
N5130 
N5131 
N5132 
N5133 M993 A3 B3 C3
N5134 
N5135 M623
N5136 ; SKIPPABLE_END
N5137 
N5138 ; object ids of this layer6 end: 372
N5139 M625
N5140 ; CHANGE_LAYER
N5141 ; Z_HEIGHT: 1.4
N5142 ; LAYER_HEIGHT: 0.2
N5143 ;======== H2D 20250521========
N5144 ; layer num/total_layer_count: 7/75
N5145 ; update layer progress
N5146 M73 L7
N5147 M991 S0 P6 ;notify layer change
N5148 
N5149 
N5150 M106 S40.8
N5151 ; OBJECT_ID: 372
N5152 ; COOLING_NODE: 0
N5153 ; start printing object, unique label id: 372
N5154 M624 AQAAAAAAAAA=
N5155 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=1.300G1 Z1.300 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N4699 G1  X195.245 Y252.814  E2.1885 F251
N4700 G1  Y254.314  E0.1194
N4701 G1  X167.745  E2.1885
N4702 G1  Y255.814  E0.1194
N4703 G1  X195.245  E2.1885
N4704 G1  Y257.314  E0.1194
N4706 G1  X167.745  E2.1885
N4707 G1  Y258.814  E0.1194
N4708 G1  X195.245  E2.1885
N4853 G1  X192.495 Y278.814  E0.1140 F1782
N4870 G1  X167.495  E0.9502 F1782
N4871 G1  Y278.064  E0.0285
N4872 G1  X195.495  E1.0642 F2025
N4873 G1  Y277.314  E0.0285
N4874 G1  X167.495  E1.0642 F2473
N4875 G1  Y276.564  E0.0285
N4876 G1  X195.495  E1.0642 F3938
N4877 G1  Y275.814  E0.0285
N4878 G1  X167.495  E1.0642
N4879 G1  Y275.064  E0.0285
N4880 G1  X195.495  E1.0642
N4881 G1  Y274.314  E0.0285
N4882 G1  X167.495  E1.0642
N4883 G1  Y273.564  E0.0285
N4884 G1  X195.495  E1.0642
N4885 G1  Y272.814  E0.0285
N4886 G1  X167.495  E1.0642
N4887 G1  Y272.064  E0.0285
N4888 G1  X195.495  E1.0642
N4889 G1  Y271.314  E0.0285
N4890 G1  X167.495  E1.0642
N4891 G1  Y270.564  E0.0285
N4892 G1  X195.495  E1.0642
N4893 G1  Y269.814  E0.0285
N4894 G1  X167.495  E1.0642
N4895 G1  Y269.064  E0.0285
N4896 G1  X195.495  E1.0642
N4897 G1  Y268.314  E0.0285
N4898 G1  X167.495  E1.0642
N4899 G1  Y267.564  E0.0285
N4900 G1  X195.495  E1.0642
N4901 G1  Y266.814  E0.0285
N4902 G1  X167.495  E1.0642
N4903 G1  Y266.064  E0.0285
N4904 G1  X195.495  E1.0642
N4928 G1  X166.995 Y279.564   E0.0760
N4935 G1  X168.371 Y250.613   E0.1594
N4941 G1  X195.995 Y252.064   E0.0760
N4953 G1 X197.598 Y277.866 E-.01975
N4954 G1 X197.683 Y277.752 E-.0539
N4955 G1 X197.759 Y277.632 E-.05389
N4956 G1 X197.825 Y277.506 E-.05389
N4957 G1 X197.88 Y277.376 E-.0539
N4958 G1 X197.926 Y277.242 E-.05389
N4959 G1 X197.961 Y277.104 E-.0539
N4960 G1 X197.985 Y276.964 E-.05389
N4961 G1 X197.998 Y276.823 E-.05391
N4962 G1 X198 Y276.681 E-.05388
N4963 G1 X197.99 Y276.54 E-.0539
N4964 G1 X197.97 Y276.4 E-.05389
N4965 G1 X197.939 Y276.261 E-.05389
N4966 G1 X197.896 Y276.126 E-.0539
N4967 G1 X197.858 Y276.029 E-.03963
N4984 G1 X158.916 Y201.084 E1.03439
N4985 G1 X158.916 Y118.916 E2.64221
N4986 G1 X191.084 Y118.916 E1.03439
N4987 G1 X191.084 Y201.024 E2.64028
N4993 G1 X158.509 Y201.491 E1.06057
N4994 G1 X158.509 Y118.509 E2.66839
N4995 G1 X191.491 Y118.509 E1.06057
N4996 G1 X191.491 Y201.431 E2.66646
N5002 G1 X158.102 Y201.898 E1.08675
N5003 G1 X158.102 Y118.102 E2.69457
N5004 G1 X191.898 Y118.102 E1.08675
N5005 G1 X191.898 Y201.838 E2.69264
N5013 G1 X157.71 Y202.29 E1.03002
N5014 G1 X157.71 Y117.71 E2.51935
N5015 G1 X192.29 Y117.71 E1.03002
N5016 G1 X192.29 Y202.23 E2.51756
N5026 G1 X188.493 Y200.736 E.05236
N5027 G1 X190.736 Y192.366 E.27863
N5028 G1 X190.736 Y190.377 E.06394
N5029 G1 X159.264 Y198.81 E1.04769
N5030 G1 X159.264 Y200.736 E.06192
N5031 G1 X163.206 Y200.736 E.12676
N5032 G1 X185.037 Y119.264 E2.71223
N5033 G1 X181.52 Y119.264 E.11307
N5034 G1 X190.736 Y128.48 E.41907
N5035 G1 X190.736 Y129.452 E.03128
N5036 G1 X171.635 Y200.736 E2.37307
N5037 G1 X170.88 Y200.736 E.0243
N5038 G1 X159.264 Y189.12 E.52822
N5039 G1 X159.264 Y190.381 E.04055
N5040 G1 X190.736 Y181.949 E1.0477
N5041 G1 X190.736 Y186.049 E.13187
N5042 G1 X159.264 Y154.578 E1.43118
N5043 G1 X159.264 Y152.534 E.06574
N5045 G1 X168.179 Y119.264 E1.10757
N5046 G1 X170.006 Y119.264 E.05876
N5047 G1 X190.736 Y139.994 E.94268
N5048 G1 X190.736 Y139.805 E.00608
N5049 G1 X159.264 Y148.237 E1.0477
N5050 G1 X159.264 Y146.609 E.05236
N5055 G1 X159.264 Y156.666 E.05236
N5056 G1 X190.736 Y148.233 E1.0477
N5057 G1 X190.736 Y151.508 E.10529
N5058 G1 X159.264 Y120.037 E1.43118
N5063 G1 X159.75 Y119.264 E.05236
N5064 G1 X159.264 Y121.077 E.06035
N5065 G1 X159.264 Y122.951 E.06024
N5066 G1 X173.022 Y119.264 E.458
N5067 G1 X176.608 Y119.264 E.1153
N5068 G1 X159.264 Y183.991 E2.15478
N5069 G1 X159.264 Y185.619 E.05236
N5074 G1 X159.264 Y181.952 E.05236
N5075 G1 X190.736 Y173.52 E1.0477
N5076 G1 X190.736 Y174.536 E.03267
N5077 G1 X159.264 Y143.064 E1.43118
N5078 G1 X159.264 Y139.808 E.1047
N5079 G1 X190.736 Y131.376 E1.0477
N5080 G1 X190.736 Y133.004 E.05236
N5085 G1 X190.736 Y122.947 E.05236
N5086 G1 X159.264 Y131.38 E1.0477
N5087 G1 X159.264 Y131.551 E.0055
N5088 G1 X190.736 Y163.022 E1.43118
N5089 G1 X190.736 Y165.091 E.06654
N5090 G1 X159.264 Y173.524 E1.0477
N5091 G1 X159.264 Y177.606 E.13129
N5092 G1 X182.394 Y200.736 E1.05182
N5093 G1 X183.535 Y200.736 E.03669
N5094 G1 X190.736 Y198.806 E.23972
N5095 G1 X190.736 Y197.563 E.03996
N5096 G1 X159.264 Y166.092 E1.43118
N5097 G1 X159.264 Y165.095 E.03208
N5098 G1 X190.736 Y156.662 E1.0477
N5099 G1 X190.736 Y160.909 E.13657
N5101 G1 X180.064 Y200.736 E1.32585
N5102 G1 X178.436 Y200.736 E.05236
N5104 G1 X180.064 Y200.736 E-.61876
N5105 G1 X180.16 Y200.377 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN5156 G1 Z1.4
N5157 G1 E.8 F1800
N5158 ; FEATURE: Inner wall
N5159 ; LINE_WIDTH: 0.45
N5160 ; LAYER_HEIGHT: 0.2
N5161 G1 F4421.739
N5162 M204 S8000
N5163 G1 X158.916 Y201.084 E1.03439
N5164 G1 X158.916 Y118.916 E2.64221
N5165 G1 X191.084 Y118.916 E1.03439
N5166 G1 X191.084 Y201.024 E2.64028
N5167 ; COOLING_NODE: 0
N5168 M204 S10000
N5169 G1 X191.491 Y201.491 F60000
N5170 G1 F4421.739
N5171 M204 S8000
N5172 G1 X158.509 Y201.491 E1.06057
N5173 G1 X158.509 Y118.509 E2.66839
N5174 G1 X191.491 Y118.509 E1.06057
N5175 G1 X191.491 Y201.431 E2.66646
N5176 ; COOLING_NODE: 0
N5177 M204 S10000
N5178 G1 X191.898 Y201.898 F60000
N5179 G1 F4421.739
N5180 M204 S8000
N5181 G1 X158.102 Y201.898 E1.08675
N5182 G1 X158.102 Y118.102 E2.69457
N5183 G1 X191.898 Y118.102 E1.08675
N5184 G1 X191.898 Y201.838 E2.69264
N5185 ; COOLING_NODE: 0
N5186 M204 S10000
N5187 G1 X192.29 Y202.29 F60000
N5188 ; FEATURE: Outer wall
N5189 ; LINE_WIDTH: 0.42
N5190 G1 F4773.528
N5191 M204 S5000
N5192 G1 X157.71 Y202.29 E1.03002
N5193 G1 X157.71 Y117.71 E2.51935
N5194 G1 X192.29 Y117.71 E1.03002
N5195 G1 X192.29 Y202.23 E2.51756
N5196 G1 E-.8 F1800
N5197 M204 S10000
N5198 G1 X189.975 Y200.736 Z1.8 F60000
N5199 G1 Z1.4
N5200 G1 E.8 F1800
N5201 ; FEATURE: Sparse infill
N5202 ; LINE_WIDTH: 0.45
N5203 G1 F4421.739
N5204 M204 S8000
N5205 G1 X188.346 Y200.736 E.05236
N5206 G1 X190.736 Y191.819 E.29683
N5207 G1 X190.736 Y190.524 E.04166
N5208 G1 X159.264 Y198.956 E1.0477
N5209 G1 X159.264 Y200.434 E.04752
N5210 G1 X159.566 Y200.736 E.0137
N5211 G1 X163.06 Y200.736 E.11236
N5212 G1 X184.89 Y119.264 E2.71223
N5213 G1 X181.72 Y119.264 E.10193
N5214 G1 X190.736 Y128.28 E.40998
N5215 G1 X190.736 Y128.906 E.02014
N5216 G1 X171.489 Y200.736 E2.39126
N5217 G1 X171.08 Y200.736 E.01316
N5218 G1 X159.264 Y188.92 E.53731
N5219 G1 X159.264 Y190.528 E.05169
N5220 G1 X190.736 Y182.095 E1.0477
N5221 G1 X190.736 Y185.849 E.12073
N5222 G1 X159.264 Y154.378 E1.43118
N5223 G1 X159.264 Y151.988 E.07688
N5224 G1 X168.033 Y119.264 E1.08938
N5225 G1 X170.206 Y119.264 E.0699
N5226 G1 X190.736 Y139.794 E.93359
N5227 G1 X190.736 Y139.951 E.00506
N5228 G1 X159.264 Y148.384 E1.0477
N5229 G1 X159.264 Y146.755 E.05236
N5230 M204 S10000
N5231 G1 X159.264 Y158.441 F60000
N5232 G1 F4421.739
N5233 M204 S8000
N5234 G1 X159.264 Y156.812 E.05236
N5235 G1 X190.736 Y148.38 E1.0477
N5236 G1 X190.736 Y151.308 E.09415
N5237 G1 X159.264 Y119.837 E1.43118
N5238 G1 X159.264 Y120.531 E.02233
N5239 G1 X159.604 Y119.264 E.04216
N5240 G1 X161.232 Y119.264 E.05236
N5241 M204 S10000
N5242 G1 X159.264 Y124.726 F60000
N5243 G1 F4421.739
N5244 M204 S8000
N5245 G1 X159.264 Y123.097 E.05236
N5246 G1 X173.569 Y119.264 E.47619
N5247 G1 X176.461 Y119.264 E.09303
N5248 G1 X159.264 Y183.444 E2.13659
N5249 G1 X159.264 Y185.073 E.05236
N5250 M204 S10000
N5251 G1 X159.264 Y180.47 F60000
N5252 G1 F4421.739
N5253 M204 S8000
N5254 G1 X159.264 Y182.099 E.05236
N5255 G1 X190.736 Y173.666 E1.04769
N5256 G1 X190.736 Y174.336 E.02153
N5257 G1 X159.264 Y142.864 E1.43118
N5258 G1 X159.264 Y139.955 E.09356
N5259 G1 X190.736 Y131.522 E1.0477
N5260 G1 X190.736 Y133.15 E.05236
N5261 M204 S10000
N5262 G1 X190.736 Y121.465 F60000
N5263 G1 F4421.739
N5264 M204 S8000
N5265 G1 X190.736 Y123.093 E.05236
N5266 G1 X159.264 Y131.526 E1.0477
N5267 G1 X159.264 Y131.351 E.00564
N5268 G1 X190.736 Y162.822 E1.43118
N5269 G1 X190.736 Y165.237 E.07768
N5270 G1 X159.264 Y173.67 E1.0477
N5271 G1 X159.264 Y177.406 E.12015
N5272 G1 X182.594 Y200.736 E1.06092
N5273 G1 X184.081 Y200.736 E.04783
N5274 G1 X190.736 Y198.953 E.22153
N5275 G1 X190.736 Y197.363 E.0511
N5276 G1 X159.264 Y165.892 E1.43118
N5277 G1 X159.264 Y165.241 E.02094
N5278 G1 X190.736 Y156.809 E1.04769
N5279 G1 X190.736 Y160.363 E.11429
N5280 G1 X179.918 Y200.736 E1.34404
N5281 G1 X178.289 Y200.736 E.05236
N5282 ; WIPE_START
N5283 G1 X179.918 Y200.736 E-.61876
N5284 G1 X180.014 Y200.377 E-.14124
N5285 ; WIPE_END
N5286 G1 E-.04 F1800
N5287 M204 S10000
N5288 G17
N5289 G3 Z1.8 I1.217 J0 P1  F60000
N5290 ; stop printing object, unique label id: 372
N5291 M625
N5292 ; object ids of layer 7 start: 372
N5293 M624 AQAAAAAAAAA=
N5294 ;======== H2D 20250527========
N5295 ; SKIPPABLE_START
N5296 ; SKIPTYPE: timelapse
N5297 M622.1 S1 ; for prev firware, default turned on
N5298 
N5299 M1002 judge_flag timelapse_record_flag
N5300 
N5301 M622 J1
N5302 M993 A2 B2 C2
N5303 M993 A0 B0 C0
N5304 
N5305 
N5306 
N5307 
N5308     M9711 M0 E1 X261 Y132 Z1.8 S11 C10 O0 T3000
N5309 
N5310 
N5311 
N5312 M993 A3 B3 C3
N5313 
N5314 M623
N5315 ; SKIPPABLE_END
N5316 
N5317 ; object ids of this layer7 end: 372
N5318 M625
N5319 ; CHANGE_LAYER
N5320 ; Z_HEIGHT: 1.6
N5321 ; LAYER_HEIGHT: 0.2
N5322 ;======== H2D 20250521========
N5323 ; layer num/total_layer_count: 8/75
N5324 ; update layer progress
N5325 M73 L8
N5326 M991 S0 P7 ;notify layer change
N5327 
N5328 
N5329 ; OBJECT_ID: 372
N5330 ; COOLING_NODE: 0
N5331 ; start printing object, unique label id: 372
N5332 M624 AQAAAAAAAAA=
N5333 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=1.500G1 Z1.500 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N5163 G1 X158.916 Y201.084 E1.03439
N5164 G1 X158.916 Y118.916 E2.64221
N5165 G1 X191.084 Y118.916 E1.03439
N5166 G1 X191.084 Y201.024 E2.64028
N5172 G1 X158.509 Y201.491 E1.06057
N5173 G1 X158.509 Y118.509 E2.66839
N5174 G1 X191.491 Y118.509 E1.06057
N5175 G1 X191.491 Y201.431 E2.66646
N5181 G1 X158.102 Y201.898 E1.08675
N5182 G1 X158.102 Y118.102 E2.69457
N5183 G1 X191.898 Y118.102 E1.08675
N5184 G1 X191.898 Y201.838 E2.69264
N5192 G1 X157.71 Y202.29 E1.03002
N5193 G1 X157.71 Y117.71 E2.51935
N5194 G1 X192.29 Y117.71 E1.03002
N5195 G1 X192.29 Y202.23 E2.51756
N5205 G1 X188.346 Y200.736 E.05236
N5206 G1 X190.736 Y191.819 E.29683
N5207 G1 X190.736 Y190.524 E.04166
N5208 G1 X159.264 Y198.956 E1.0477
N5209 G1 X159.264 Y200.434 E.04752
N5210 G1 X159.566 Y200.736 E.0137
N5211 G1 X163.06 Y200.736 E.11236
N5212 G1 X184.89 Y119.264 E2.71223
N5213 G1 X181.72 Y119.264 E.10193
N5214 G1 X190.736 Y128.28 E.40998
N5215 G1 X190.736 Y128.906 E.02014
N5216 G1 X171.489 Y200.736 E2.39126
N5217 G1 X171.08 Y200.736 E.01316
N5218 G1 X159.264 Y188.92 E.53731
N5219 G1 X159.264 Y190.528 E.05169
N5220 G1 X190.736 Y182.095 E1.0477
N5221 G1 X190.736 Y185.849 E.12073
N5222 G1 X159.264 Y154.378 E1.43118
N5223 G1 X159.264 Y151.988 E.07688
N5224 G1 X168.033 Y119.264 E1.08938
N5225 G1 X170.206 Y119.264 E.0699
N5226 G1 X190.736 Y139.794 E.93359
N5227 G1 X190.736 Y139.951 E.00506
N5228 G1 X159.264 Y148.384 E1.0477
N5229 G1 X159.264 Y146.755 E.05236
N5234 G1 X159.264 Y156.812 E.05236
N5235 G1 X190.736 Y148.38 E1.0477
N5236 G1 X190.736 Y151.308 E.09415
N5237 G1 X159.264 Y119.837 E1.43118
N5238 G1 X159.264 Y120.531 E.02233
N5239 G1 X159.604 Y119.264 E.04216
N5240 G1 X161.232 Y119.264 E.05236
N5245 G1 X159.264 Y123.097 E.05236
N5246 G1 X173.569 Y119.264 E.47619
N5247 G1 X176.461 Y119.264 E.09303
N5248 G1 X159.264 Y183.444 E2.13659
N5249 G1 X159.264 Y185.073 E.05236
N5254 G1 X159.264 Y182.099 E.05236
N5255 G1 X190.736 Y173.666 E1.04769
N5256 G1 X190.736 Y174.336 E.02153
N5257 G1 X159.264 Y142.864 E1.43118
N5258 G1 X159.264 Y139.955 E.09356
N5259 G1 X190.736 Y131.522 E1.0477
N5260 G1 X190.736 Y133.15 E.05236
N5265 G1 X190.736 Y123.093 E.05236
N5266 G1 X159.264 Y131.526 E1.0477
N5267 G1 X159.264 Y131.351 E.00564
N5268 G1 X190.736 Y162.822 E1.43118
N5269 G1 X190.736 Y165.237 E.07768
N5270 G1 X159.264 Y173.67 E1.0477
N5271 G1 X159.264 Y177.406 E.12015
N5272 G1 X182.594 Y200.736 E1.06092
N5273 G1 X184.081 Y200.736 E.04783
N5274 G1 X190.736 Y198.953 E.22153
N5275 G1 X190.736 Y197.363 E.0511
N5276 G1 X159.264 Y165.892 E1.43118
N5277 G1 X159.264 Y165.241 E.02094
N5278 G1 X190.736 Y156.809 E1.04769
N5279 G1 X190.736 Y160.363 E.11429
N5280 G1 X179.918 Y200.736 E1.34404
N5281 G1 X178.289 Y200.736 E.05236
N5283 G1 X179.918 Y200.736 E-.61876
N5284 G1 X180.014 Y200.377 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN5334 G1 Z1.6
N5335 G1 E.8 F1800
N5336 ; FEATURE: Inner wall
N5337 ; LINE_WIDTH: 0.45
N5338 ; LAYER_HEIGHT: 0.2
N5339 G1 F4421.739
N5340 M204 S8000
N5341 G1 X158.916 Y201.084 E1.03439
N5342 G1 X158.916 Y118.916 E2.64221
N5343 G1 X191.084 Y118.916 E1.03439
N5344 G1 X191.084 Y201.024 E2.64028
N5345 ; COOLING_NODE: 0
N5346 M204 S10000
N5347 G1 X191.491 Y201.491 F60000
N5348 G1 F4421.739
N5349 M204 S8000
N5350 G1 X158.509 Y201.491 E1.06057
N5351 G1 X158.509 Y118.509 E2.66839
N5352 G1 X191.491 Y118.509 E1.06057
N5353 G1 X191.491 Y201.431 E2.66646
N5354 ; COOLING_NODE: 0
N5355 M204 S10000
N5356 G1 X191.898 Y201.898 F60000
N5357 G1 F4421.739
N5358 M204 S8000
N5359 G1 X158.102 Y201.898 E1.08675
N5360 G1 X158.102 Y118.102 E2.69457
N5361 G1 X191.898 Y118.102 E1.08675
N5362 G1 X191.898 Y201.838 E2.69264
N5363 ; COOLING_NODE: 0
N5364 M204 S10000
N5365 G1 X192.29 Y202.29 F60000
N5366 ; FEATURE: Outer wall
N5367 ; LINE_WIDTH: 0.42
N5368 G1 F4773.528
N5369 M204 S5000
N5370 G1 X157.71 Y202.29 E1.03002
N5371 M73 P39 R38
N5372 G1 X157.71 Y117.71 E2.51935
N5373 G1 X192.29 Y117.71 E1.03002
N5374 G1 X192.29 Y202.23 E2.51756
N5375 G1 E-.8 F1800
N5376 M204 S10000
N5377 G1 X189.828 Y200.736 Z2 F60000
N5378 G1 Z1.6
N5379 G1 E.8 F1800
N5380 ; FEATURE: Sparse infill
N5381 ; LINE_WIDTH: 0.45
N5382 G1 F4421.739
N5383 M204 S8000
N5384 G1 X188.2 Y200.736 E.05236
N5385 G1 X190.736 Y191.273 E.31502
N5386 G1 X190.736 Y190.67 E.01938
N5387 G1 X159.264 Y199.103 E1.0477
N5388 G1 X159.264 Y200.234 E.03638
N5389 G1 X159.766 Y200.736 E.0228
N5390 G1 X162.914 Y200.736 E.10122
N5391 G1 X184.744 Y119.264 E2.71223
N5392 G1 X181.92 Y119.264 E.09079
N5393 G1 X190.736 Y128.08 E.40088
N5394 G1 X190.736 Y128.36 E.009
N5395 G1 X171.342 Y200.736 E2.40945
N5396 G1 X171.28 Y200.736 E.00202
N5397 G1 X159.264 Y188.72 E.54641
N5398 G1 X159.264 Y190.674 E.06283
N5399 G1 X190.736 Y182.241 E1.0477
N5400 G1 X190.736 Y185.649 E.10959
N5401 G1 X159.264 Y154.178 E1.43118
N5402 G1 X159.264 Y151.441 E.08802
N5403 G1 X167.886 Y119.264 E1.07119
N5404 G1 X170.406 Y119.264 E.08104
N5405 G1 X190.736 Y139.594 E.92449
N5406 G1 X190.736 Y140.097 E.0162
N5407 G1 X159.264 Y148.53 E1.0477
N5408 G1 X159.264 Y146.902 E.05236
N5409 M204 S10000
N5410 G1 X159.264 Y158.587 F60000
N5411 G1 F4421.739
N5412 M204 S8000
N5413 G1 X159.264 Y156.959 E.05236
N5414 G1 X190.736 Y148.526 E1.0477
N5415 G1 X190.736 Y151.108 E.08301
N5416 G1 X159.264 Y119.637 E1.43118
N5417 G1 X159.264 Y119.984 E.01119
N5418 G1 X159.457 Y119.264 E.02397
N5419 G1 X161.086 Y119.264 E.05236
N5420 M204 S10000
N5421 G1 X159.264 Y124.872 F60000
N5422 G1 F4421.739
N5423 M204 S8000
N5424 G1 X159.264 Y123.244 E.05236
N5425 G1 X174.115 Y119.264 E.49438
N5426 G1 X176.315 Y119.264 E.07075
N5427 G1 X159.264 Y182.898 E2.1184
N5428 G1 X159.264 Y184.526 E.05236
N5429 M204 S10000
N5430 G1 X159.264 Y182.245 F60000
N5431 G1 F4421.739
N5432 M204 S8000
N5433 G1 X190.736 Y173.813 E1.0477
N5434 G1 X190.736 Y174.136 E.01039
N5435 G1 X159.264 Y142.664 E1.43118
N5436 G1 X159.264 Y140.101 E.08242
N5437 G1 X190.736 Y131.669 E1.0477
N5438 G1 X190.736 Y133.297 E.05236
N5439 M204 S10000
N5440 M73 P39 R37
N5441 G1 X190.736 Y121.611 F60000
N5442 G1 F4421.739
N5443 M204 S8000
N5444 G1 X190.736 Y123.24 E.05236
N5445 G1 X159.264 Y131.672 E1.0477
N5446 G1 X159.264 Y131.151 E.01678
N5447 G1 X190.736 Y162.622 E1.43118
N5448 G1 X190.736 Y165.384 E.08882
N5449 G1 X159.264 Y173.816 E1.0477
N5450 G1 X159.264 Y177.206 E.10901
N5451 G1 X182.794 Y200.736 E1.07002
N5452 G1 X184.628 Y200.736 E.05897
N5453 G1 X190.736 Y199.099 E.20334
N5454 G1 X190.736 Y197.163 E.06224
N5455 G1 X159.264 Y165.692 E1.43118
N5456 G1 X159.264 Y165.388 E.0098
N5457 G1 X190.736 Y156.955 E1.04769
N5458 G1 X190.736 Y159.816 E.09201
N5459 G1 X179.771 Y200.736 E1.36223
N5460 G1 X178.143 Y200.736 E.05236
N5461 ; WIPE_START
N5462 G1 X179.771 Y200.736 E-.61876
N5463 G1 X179.867 Y200.377 E-.14124
N5464 ; WIPE_END
N5465 G1 E-.04 F1800
N5466 M204 S10000
N5467 G17
N5468 G3 Z2 I1.217 J0 P1  F60000
N5469 ; stop printing object, unique label id: 372
N5470 M625
N5471 ; object ids of layer 8 start: 372
N5472 M624 AQAAAAAAAAA=
N5473 ;======== H2D 20250527========
N5474 ; SKIPPABLE_START
N5475 ; SKIPTYPE: timelapse
N5476 M622.1 S1 ; for prev firware, default turned on
N5477 
N5478 M1002 judge_flag timelapse_record_flag
N5479 
N5480 M622 J1
N5481 M993 A2 B2 C2
N5482 M993 A0 B0 C0
N5483 
N5484 
N5485 
N5486 
N5487     M9711 M0 E1 X261 Y132 Z2 S11 C10 O0 T3000
N5488 
N5489 
N5490 
N5491 M993 A3 B3 C3
N5492 
N5493 M623
N5494 ; SKIPPABLE_END
N5495 
N5496 ; object ids of this layer8 end: 372
N5497 M625
N5498 ; CHANGE_LAYER
N5499 ; Z_HEIGHT: 1.8
N5500 ; LAYER_HEIGHT: 0.2
N5501 ;======== H2D 20250521========
N5502 ; layer num/total_layer_count: 9/75
N5503 ; update layer progress
N5504 M73 L9
N5505 M991 S0 P8 ;notify layer change
N5506 
N5507 
N5508 ; OBJECT_ID: 372
N5509 ; COOLING_NODE: 0
N5510 ; start printing object, unique label id: 372
N5511 M624 AQAAAAAAAAA=
N5512 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=1.700G1 Z1.700 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N5341 G1 X158.916 Y201.084 E1.03439
N5342 G1 X158.916 Y118.916 E2.64221
N5343 G1 X191.084 Y118.916 E1.03439
N5344 G1 X191.084 Y201.024 E2.64028
N5350 G1 X158.509 Y201.491 E1.06057
N5351 G1 X158.509 Y118.509 E2.66839
N5352 G1 X191.491 Y118.509 E1.06057
N5353 G1 X191.491 Y201.431 E2.66646
N5359 G1 X158.102 Y201.898 E1.08675
N5360 G1 X158.102 Y118.102 E2.69457
N5361 G1 X191.898 Y118.102 E1.08675
N5362 G1 X191.898 Y201.838 E2.69264
N5370 G1 X157.71 Y202.29 E1.03002
N5372 G1 X157.71 Y117.71 E2.51935
N5373 G1 X192.29 Y117.71 E1.03002
N5374 G1 X192.29 Y202.23 E2.51756
N5384 G1 X188.2 Y200.736 E.05236
N5385 G1 X190.736 Y191.273 E.31502
N5386 G1 X190.736 Y190.67 E.01938
N5387 G1 X159.264 Y199.103 E1.0477
N5388 G1 X159.264 Y200.234 E.03638
N5389 G1 X159.766 Y200.736 E.0228
N5390 G1 X162.914 Y200.736 E.10122
N5391 G1 X184.744 Y119.264 E2.71223
N5392 G1 X181.92 Y119.264 E.09079
N5393 G1 X190.736 Y128.08 E.40088
N5394 G1 X190.736 Y128.36 E.009
N5395 G1 X171.342 Y200.736 E2.40945
N5396 G1 X171.28 Y200.736 E.00202
N5397 G1 X159.264 Y188.72 E.54641
N5398 G1 X159.264 Y190.674 E.06283
N5399 G1 X190.736 Y182.241 E1.0477
N5400 G1 X190.736 Y185.649 E.10959
N5401 G1 X159.264 Y154.178 E1.43118
N5402 G1 X159.264 Y151.441 E.08802
N5403 G1 X167.886 Y119.264 E1.07119
N5404 G1 X170.406 Y119.264 E.08104
N5405 G1 X190.736 Y139.594 E.92449
N5406 G1 X190.736 Y140.097 E.0162
N5407 G1 X159.264 Y148.53 E1.0477
N5408 G1 X159.264 Y146.902 E.05236
N5413 G1 X159.264 Y156.959 E.05236
N5414 G1 X190.736 Y148.526 E1.0477
N5415 G1 X190.736 Y151.108 E.08301
N5416 G1 X159.264 Y119.637 E1.43118
N5417 G1 X159.264 Y119.984 E.01119
N5418 G1 X159.457 Y119.264 E.02397
N5419 G1 X161.086 Y119.264 E.05236
N5424 G1 X159.264 Y123.244 E.05236
N5425 G1 X174.115 Y119.264 E.49438
N5426 G1 X176.315 Y119.264 E.07075
N5427 G1 X159.264 Y182.898 E2.1184
N5428 G1 X159.264 Y184.526 E.05236
N5433 G1 X190.736 Y173.813 E1.0477
N5434 G1 X190.736 Y174.136 E.01039
N5435 G1 X159.264 Y142.664 E1.43118
N5436 G1 X159.264 Y140.101 E.08242
N5437 G1 X190.736 Y131.669 E1.0477
N5438 G1 X190.736 Y133.297 E.05236
N5444 G1 X190.736 Y123.24 E.05236
N5445 G1 X159.264 Y131.672 E1.0477
N5446 G1 X159.264 Y131.151 E.01678
N5447 G1 X190.736 Y162.622 E1.43118
N5448 G1 X190.736 Y165.384 E.08882
N5449 G1 X159.264 Y173.816 E1.0477
N5450 G1 X159.264 Y177.206 E.10901
N5451 G1 X182.794 Y200.736 E1.07002
N5452 G1 X184.628 Y200.736 E.05897
N5453 G1 X190.736 Y199.099 E.20334
N5454 G1 X190.736 Y197.163 E.06224
N5455 G1 X159.264 Y165.692 E1.43118
N5456 G1 X159.264 Y165.388 E.0098
N5457 G1 X190.736 Y156.955 E1.04769
N5458 G1 X190.736 Y159.816 E.09201
N5459 G1 X179.771 Y200.736 E1.36223
N5460 G1 X178.143 Y200.736 E.05236
N5462 G1 X179.771 Y200.736 E-.61876
N5463 G1 X179.867 Y200.377 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN5513 G1 Z1.8
N5514 G1 E.8 F1800
N5515 ; FEATURE: Inner wall
N5516 ; LINE_WIDTH: 0.45
N5517 ; LAYER_HEIGHT: 0.2
N5518 G1 F4421.739
N5519 M204 S8000
N5520 G1 X158.916 Y201.084 E1.03439
N5521 G1 X158.916 Y118.916 E2.64221
N5522 G1 X191.084 Y118.916 E1.03439
N5523 G1 X191.084 Y201.024 E2.64028
N5524 ; COOLING_NODE: 0
N5525 M204 S10000
N5526 G1 X191.491 Y201.491 F60000
N5527 G1 F4421.739
N5528 M204 S8000
N5529 G1 X158.509 Y201.491 E1.06057
N5530 G1 X158.509 Y118.509 E2.66839
N5531 G1 X191.491 Y118.509 E1.06057
N5532 G1 X191.491 Y201.431 E2.66646
N5533 ; COOLING_NODE: 0
N5534 M204 S10000
N5535 G1 X191.898 Y201.898 F60000
N5536 G1 F4421.739
N5537 M204 S8000
N5538 G1 X158.102 Y201.898 E1.08675
N5539 G1 X158.102 Y118.102 E2.69457
N5540 G1 X191.898 Y118.102 E1.08675
N5541 G1 X191.898 Y201.838 E2.69264
N5542 ; COOLING_NODE: 0
N5543 M204 S10000
N5544 G1 X192.29 Y202.29 F60000
N5545 ; FEATURE: Outer wall
N5546 ; LINE_WIDTH: 0.42
N5547 G1 F4773.528
N5548 M204 S5000
N5549 G1 X157.71 Y202.29 E1.03002
N5550 G1 X157.71 Y117.71 E2.51935
N5551 G1 X192.29 Y117.71 E1.03002
N5552 G1 X192.29 Y202.23 E2.51756
N5553 G1 E-.8 F1800
N5554 M204 S10000
N5555 G1 X189.682 Y200.736 Z2.2 F60000
N5556 G1 Z1.8
N5557 G1 E.8 F1800
N5558 ; FEATURE: Sparse infill
N5559 ; LINE_WIDTH: 0.45
N5560 G1 F4421.739
N5561 M204 S8000
N5562 G1 X188.054 Y200.736 E.05236
N5563 G1 X190.736 Y190.727 E.33321
N5564 G1 X190.736 Y190.817 E.00289
N5565 G1 X159.264 Y199.249 E1.0477
N5566 G1 X159.264 Y200.034 E.02524
N5567 G1 X159.966 Y200.736 E.03189
N5568 G1 X162.767 Y200.736 E.09008
N5569 G1 X184.597 Y119.264 E2.71223
N5570 G1 X182.12 Y119.264 E.07966
N5571 G1 X190.736 Y127.88 E.39179
N5572 G1 X190.736 Y127.813 E.00214
N5573 G1 X171.196 Y200.736 E2.42764
N5574 G1 X171.48 Y200.736 E.00912
N5575 G1 X159.264 Y188.52 E.5555
N5576 G1 X159.264 Y190.82 E.07396
N5577 G1 X190.736 Y182.388 E1.0477
N5578 G1 X190.736 Y185.449 E.09845
N5579 G1 X159.264 Y153.978 E1.43118
N5580 G1 X159.264 Y150.895 E.09916
N5581 G1 X167.74 Y119.264 E1.053
N5582 G1 X170.606 Y119.264 E.09218
N5583 G1 X190.736 Y139.394 E.9154
N5584 G1 X190.736 Y140.244 E.02734
N5585 G1 X159.264 Y148.676 E1.0477
N5586 G1 X159.264 Y147.048 E.05236
N5587 M204 S10000
N5588 G1 X159.264 Y158.734 F60000
N5589 G1 F4421.739
N5590 M204 S8000
N5591 G1 X159.264 Y157.105 E.05236
N5592 G1 X190.736 Y148.673 E1.0477
N5593 G1 X190.736 Y150.908 E.07187
N5594 G1 X159.264 Y119.437 E1.43118
N5595 G1 X159.264 Y123.39 E.12713
N5596 M73 P40 R37
N5597 G1 X174.661 Y119.264 E.51257
N5598 G1 X176.169 Y119.264 E.04847
N5599 G1 X159.264 Y182.392 E2.10146
N5600 G1 X190.736 Y173.959 E1.0477
N5601 G1 X190.736 Y173.936 E.00075
N5602 G1 X159.264 Y142.464 E1.43118
N5603 G1 X159.264 Y140.248 E.07129
N5604 G1 X190.736 Y131.815 E1.0477
N5605 G1 X190.736 Y133.443 E.05236
N5606 M204 S10000
N5607 G1 X190.736 Y121.758 F60000
N5608 G1 F4421.739
N5609 M204 S8000
N5610 G1 X190.736 Y123.386 E.05236
N5611 G1 X159.264 Y131.819 E1.0477
N5612 G1 X159.264 Y130.951 E.02792
N5613 G1 X190.736 Y162.422 E1.43118
N5614 G1 X190.736 Y165.53 E.09996
N5615 G1 X159.264 Y173.963 E1.0477
N5616 G1 X159.264 Y177.006 E.09787
N5617 G1 X182.994 Y200.736 E1.07911
N5618 G1 X185.174 Y200.736 E.07011
N5619 G1 X190.736 Y199.245 E.18515
N5620 G1 X190.736 Y196.963 E.07338
N5621 G1 X159.264 Y165.492 E1.43118
N5622 G1 X159.264 Y165.534 E.00134
N5623 G1 X190.736 Y157.101 E1.0477
N5624 G1 X190.736 Y159.27 E.06973
N5625 G1 X179.625 Y200.736 E1.38042
N5626 G1 X177.997 Y200.736 E.05236
N5627 ; WIPE_START
N5628 G1 X179.625 Y200.736 E-.61876
N5629 G1 X179.721 Y200.377 E-.14124
N5630 ; WIPE_END
N5631 G1 E-.04 F1800
N5632 M204 S10000
N5633 G17
N5634 G3 Z2.2 I1.217 J0 P1  F60000
N5635 ; stop printing object, unique label id: 372
N5636 M625
N5637 ; object ids of layer 9 start: 372
N5638 M624 AQAAAAAAAAA=
N5639 ;======== H2D 20250527========
N5640 ; SKIPPABLE_START
N5641 ; SKIPTYPE: timelapse
N5642 M622.1 S1 ; for prev firware, default turned on
N5643 
N5644 M1002 judge_flag timelapse_record_flag
N5645 
N5646 M622 J1
N5647 M993 A2 B2 C2
N5648 M993 A0 B0 C0
N5649 
N5650 
N5651 
N5652 
N5653     M9711 M0 E1 X261 Y132 Z2.2 S11 C10 O0 T3000
N5654 
N5655 
N5656 
N5657 M993 A3 B3 C3
N5658 
N5659 M623
N5660 ; SKIPPABLE_END
N5661 
N5662 ; object ids of this layer9 end: 372
N5663 M625
N5664 ; CHANGE_LAYER
N5665 ; Z_HEIGHT: 2
N5666 ; LAYER_HEIGHT: 0.2
N5667 ;======== H2D 20250521========
N5668 ; layer num/total_layer_count: 10/75
N5669 ; update layer progress
N5670 M73 L10
N5671 M991 S0 P9 ;notify layer change
N5672 
N5673 
N5674 ; OBJECT_ID: 372
N5675 ; COOLING_NODE: 0
N5676 ; start printing object, unique label id: 372
N5677 M624 AQAAAAAAAAA=
N5678 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=1.900G1 Z1.900 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N5520 G1 X158.916 Y201.084 E1.03439
N5521 G1 X158.916 Y118.916 E2.64221
N5522 G1 X191.084 Y118.916 E1.03439
N5523 G1 X191.084 Y201.024 E2.64028
N5529 G1 X158.509 Y201.491 E1.06057
N5530 G1 X158.509 Y118.509 E2.66839
N5531 G1 X191.491 Y118.509 E1.06057
N5532 G1 X191.491 Y201.431 E2.66646
N5538 G1 X158.102 Y201.898 E1.08675
N5539 G1 X158.102 Y118.102 E2.69457
N5540 G1 X191.898 Y118.102 E1.08675
N5541 G1 X191.898 Y201.838 E2.69264
N5549 G1 X157.71 Y202.29 E1.03002
N5550 G1 X157.71 Y117.71 E2.51935
N5551 G1 X192.29 Y117.71 E1.03002
N5552 G1 X192.29 Y202.23 E2.51756
N5562 G1 X188.054 Y200.736 E.05236
N5563 G1 X190.736 Y190.727 E.33321
N5564 G1 X190.736 Y190.817 E.00289
N5565 G1 X159.264 Y199.249 E1.0477
N5566 G1 X159.264 Y200.034 E.02524
N5567 G1 X159.966 Y200.736 E.03189
N5568 G1 X162.767 Y200.736 E.09008
N5569 G1 X184.597 Y119.264 E2.71223
N5570 G1 X182.12 Y119.264 E.07966
N5571 G1 X190.736 Y127.88 E.39179
N5572 G1 X190.736 Y127.813 E.00214
N5573 G1 X171.196 Y200.736 E2.42764
N5574 G1 X171.48 Y200.736 E.00912
N5575 G1 X159.264 Y188.52 E.5555
N5576 G1 X159.264 Y190.82 E.07396
N5577 G1 X190.736 Y182.388 E1.0477
N5578 G1 X190.736 Y185.449 E.09845
N5579 G1 X159.264 Y153.978 E1.43118
N5580 G1 X159.264 Y150.895 E.09916
N5581 G1 X167.74 Y119.264 E1.053
N5582 G1 X170.606 Y119.264 E.09218
N5583 G1 X190.736 Y139.394 E.9154
N5584 G1 X190.736 Y140.244 E.02734
N5585 G1 X159.264 Y148.676 E1.0477
N5586 G1 X159.264 Y147.048 E.05236
N5591 G1 X159.264 Y157.105 E.05236
N5592 G1 X190.736 Y148.673 E1.0477
N5593 G1 X190.736 Y150.908 E.07187
N5594 G1 X159.264 Y119.437 E1.43118
N5595 G1 X159.264 Y123.39 E.12713
N5597 G1 X174.661 Y119.264 E.51257
N5598 G1 X176.169 Y119.264 E.04847
N5599 G1 X159.264 Y182.392 E2.10146
N5600 G1 X190.736 Y173.959 E1.0477
N5601 G1 X190.736 Y173.936 E.00075
N5602 G1 X159.264 Y142.464 E1.43118
N5603 G1 X159.264 Y140.248 E.07129
N5604 G1 X190.736 Y131.815 E1.0477
N5605 G1 X190.736 Y133.443 E.05236
N5610 G1 X190.736 Y123.386 E.05236
N5611 G1 X159.264 Y131.819 E1.0477
N5612 G1 X159.264 Y130.951 E.02792
N5613 G1 X190.736 Y162.422 E1.43118
N5614 G1 X190.736 Y165.53 E.09996
N5615 G1 X159.264 Y173.963 E1.0477
N5616 G1 X159.264 Y177.006 E.09787
N5617 G1 X182.994 Y200.736 E1.07911
N5618 G1 X185.174 Y200.736 E.07011
N5619 G1 X190.736 Y199.245 E.18515
N5620 G1 X190.736 Y196.963 E.07338
N5621 G1 X159.264 Y165.492 E1.43118
N5622 G1 X159.264 Y165.534 E.00134
N5623 G1 X190.736 Y157.101 E1.0477
N5624 G1 X190.736 Y159.27 E.06973
N5625 G1 X179.625 Y200.736 E1.38042
N5626 G1 X177.997 Y200.736 E.05236
N5628 G1 X179.625 Y200.736 E-.61876
N5629 G1 X179.721 Y200.377 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN5679 G1 Z2
N5680 G1 E.8 F1800
N5681 ; FEATURE: Inner wall
N5682 ; LINE_WIDTH: 0.45
N5683 ; LAYER_HEIGHT: 0.2
N5684 G1 F4421.739
N5685 M204 S8000
N5686 G1 X158.916 Y201.084 E1.03439
N5687 G1 X158.916 Y118.916 E2.64221
N5688 G1 X191.084 Y118.916 E1.03439
N5689 G1 X191.084 Y201.024 E2.64028
N5690 ; COOLING_NODE: 0
N5691 M204 S10000
N5692 G1 X191.491 Y201.491 F60000
N5693 G1 F4421.739
N5694 M204 S8000
N5695 G1 X158.509 Y201.491 E1.06057
N5696 G1 X158.509 Y118.509 E2.66839
N5697 G1 X191.491 Y118.509 E1.06057
N5698 G1 X191.491 Y201.431 E2.66646
N5699 ; COOLING_NODE: 0
N5700 M204 S10000
N5701 G1 X191.898 Y201.898 F60000
N5702 G1 F4421.739
N5703 M204 S8000
N5704 G1 X158.102 Y201.898 E1.08675
N5705 G1 X158.102 Y118.102 E2.69457
N5706 G1 X191.898 Y118.102 E1.08675
N5707 G1 X191.898 Y201.838 E2.69264
N5708 ; COOLING_NODE: 0
N5709 M204 S10000
N5710 G1 X192.29 Y202.29 F60000
N5711 ; FEATURE: Outer wall
N5712 ; LINE_WIDTH: 0.42
N5713 G1 F4773.528
N5714 M204 S5000
N5715 G1 X157.71 Y202.29 E1.03002
N5716 G1 X157.71 Y117.71 E2.51935
N5717 G1 X192.29 Y117.71 E1.03002
N5718 G1 X192.29 Y202.23 E2.51756
N5719 G1 E-.8 F1800
N5720 M204 S10000
N5721 G1 X189.536 Y200.736 Z2.4 F60000
N5722 G1 Z2
N5723 G1 E.8 F1800
N5724 ; FEATURE: Sparse infill
N5725 ; LINE_WIDTH: 0.45
N5726 G1 F4421.739
N5727 M204 S8000
N5728 G1 X187.907 Y200.736 E.05236
N5729 G1 X190.736 Y190.18 E.3514
N5730 G1 X190.736 Y188.552 E.05236
N5731 M204 S10000
N5732 G1 X190.736 Y190.963 F60000
N5733 G1 F4421.739
N5734 M204 S8000
N5735 G1 X159.264 Y199.396 E1.0477
N5736 G1 X159.264 Y199.834 E.0141
N5737 G1 X160.166 Y200.736 E.04099
N5738 G1 X162.621 Y200.736 E.07895
N5739 G1 X184.451 Y119.264 E2.71223
N5740 G1 X182.32 Y119.264 E.06852
N5741 G1 X190.736 Y127.68 E.38269
N5742 M204 S10000
N5743 G1 X190.736 Y133.59 F60000
N5744 G1 F4421.739
N5745 M204 S8000
N5746 G1 X190.736 Y131.961 E.05236
N5747 G1 X159.264 Y140.394 E1.0477
N5748 G1 X159.264 Y142.264 E.06015
N5749 G1 X190.736 Y173.736 E1.43118
N5750 G1 X190.736 Y174.105 E.01189
N5751 G1 X159.264 Y182.538 E1.0477
N5752 G1 X159.264 Y181.805 E.02357
N5753 G1 X176.022 Y119.264 E2.08202
N5754 G1 X175.208 Y119.264 E.02619
N5755 G1 X159.264 Y123.536 E.53076
N5756 G1 X159.264 Y119.264 E.13737
N5757 G1 X159.292 Y119.264 E.0009
N5758 G1 X190.736 Y150.708 E1.42991
N5759 G1 X190.736 Y148.819 E.06073
N5760 G1 X159.264 Y157.252 E1.0477
N5761 G1 X159.264 Y158.88 E.05236
N5762 M204 S10000
N5763 G1 X159.264 Y147.195 F60000
N5764 G1 F4421.739
N5765 M204 S8000
N5766 G1 X159.264 Y148.823 E.05236
N5767 G1 X190.736 Y140.39 E1.0477
N5768 G1 X190.736 Y139.194 E.03847
N5769 G1 X170.806 Y119.264 E.9063
N5770 G1 X167.593 Y119.264 E.10332
N5771 G1 X159.264 Y150.348 E1.03481
N5772 G1 X159.264 Y153.778 E.1103
N5773 G1 X190.736 Y185.249 E1.43118
N5774 G1 X190.736 Y182.534 E.08732
N5775 G1 X159.264 Y190.967 E1.0477
N5776 G1 X159.264 Y188.32 E.0851
N5777 G1 X171.68 Y200.736 E.5646
N5778 G1 X171.05 Y200.736 E.02026
N5779 G1 X190.736 Y127.267 E2.44583
N5780 G1 X190.736 Y123.533 E.12008
N5781 G1 X159.264 Y131.965 E1.0477
N5782 G1 X159.264 Y130.751 E.03906
N5783 G1 X190.736 Y162.222 E1.43118
N5784 G1 X190.736 Y165.677 E.1111
N5785 G1 X159.264 Y174.109 E1.0477
N5786 G1 X159.264 Y176.806 E.08673
N5787 G1 X183.194 Y200.736 E1.08821
N5788 G1 X185.72 Y200.736 E.08125
N5789 G1 X190.736 Y199.392 E.16696
N5790 G1 X190.736 Y196.763 E.08452
N5791 G1 X159.264 Y165.292 E1.43118
N5792 G1 X159.264 Y165.68 E.01248
N5793 G1 X190.736 Y157.248 E1.0477
N5794 G1 X190.736 Y158.723 E.04745
N5795 G1 X179.478 Y200.736 E1.39861
N5796 G1 X177.85 Y200.736 E.05236
N5797 ; WIPE_START
N5798 G1 X179.478 Y200.736 E-.61876
N5799 G1 X179.575 Y200.377 E-.14124
N5800 ; WIPE_END
N5801 G1 E-.04 F1800
N5802 M204 S10000
N5803 G17
N5804 G3 Z2.4 I1.217 J0 P1  F60000
N5805 ; stop printing object, unique label id: 372
N5806 M625
N5807 ; object ids of layer 10 start: 372
N5808 M624 AQAAAAAAAAA=
N5809 ;======== H2D 20250527========
N5810 ; SKIPPABLE_START
N5811 ; SKIPTYPE: timelapse
N5812 M622.1 S1 ; for prev firware, default turned on
N5813 
N5814 M1002 judge_flag timelapse_record_flag
N5815 
N5816 M622 J1
N5817 M993 A2 B2 C2
N5818 M993 A0 B0 C0
N5819 
N5820 
N5821 
N5822 
N5823     M9711 M0 E1 X261 Y132 Z2.4 S11 C10 O0 T3000
N5824 
N5825 
N5826 
N5827 M993 A3 B3 C3
N5828 
N5829 M623
N5830 ; SKIPPABLE_END
N5831 
N5832 ; object ids of this layer10 end: 372
N5833 M625
N5834 ; CHANGE_LAYER
N5835 ; Z_HEIGHT: 2.2
N5836 ; LAYER_HEIGHT: 0.2
N5837 ;======== H2D 20250521========
N5838 ; layer num/total_layer_count: 11/75
N5839 ; update layer progress
N5840 M73 L11
N5841 M991 S0 P10 ;notify layer change
N5842 
N5843 
N5844 ; OBJECT_ID: 372
N5845 ; COOLING_NODE: 0
N5846 ; start printing object, unique label id: 372
N5847 M624 AQAAAAAAAAA=
N5848 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=2.100G1 Z2.100 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N5686 G1 X158.916 Y201.084 E1.03439
N5687 G1 X158.916 Y118.916 E2.64221
N5688 G1 X191.084 Y118.916 E1.03439
N5689 G1 X191.084 Y201.024 E2.64028
N5695 G1 X158.509 Y201.491 E1.06057
N5696 G1 X158.509 Y118.509 E2.66839
N5697 G1 X191.491 Y118.509 E1.06057
N5698 G1 X191.491 Y201.431 E2.66646
N5704 G1 X158.102 Y201.898 E1.08675
N5705 G1 X158.102 Y118.102 E2.69457
N5706 G1 X191.898 Y118.102 E1.08675
N5707 G1 X191.898 Y201.838 E2.69264
N5715 G1 X157.71 Y202.29 E1.03002
N5716 G1 X157.71 Y117.71 E2.51935
N5717 G1 X192.29 Y117.71 E1.03002
N5718 G1 X192.29 Y202.23 E2.51756
N5728 G1 X187.907 Y200.736 E.05236
N5729 G1 X190.736 Y190.18 E.3514
N5730 G1 X190.736 Y188.552 E.05236
N5735 G1 X159.264 Y199.396 E1.0477
N5736 G1 X159.264 Y199.834 E.0141
N5737 G1 X160.166 Y200.736 E.04099
N5738 G1 X162.621 Y200.736 E.07895
N5739 G1 X184.451 Y119.264 E2.71223
N5740 G1 X182.32 Y119.264 E.06852
N5741 G1 X190.736 Y127.68 E.38269
N5746 G1 X190.736 Y131.961 E.05236
N5747 G1 X159.264 Y140.394 E1.0477
N5748 G1 X159.264 Y142.264 E.06015
N5749 G1 X190.736 Y173.736 E1.43118
N5750 G1 X190.736 Y174.105 E.01189
N5751 G1 X159.264 Y182.538 E1.0477
N5752 G1 X159.264 Y181.805 E.02357
N5753 G1 X176.022 Y119.264 E2.08202
N5754 G1 X175.208 Y119.264 E.02619
N5755 G1 X159.264 Y123.536 E.53076
N5756 G1 X159.264 Y119.264 E.13737
N5757 G1 X159.292 Y119.264 E.0009
N5758 G1 X190.736 Y150.708 E1.42991
N5759 G1 X190.736 Y148.819 E.06073
N5760 G1 X159.264 Y157.252 E1.0477
N5761 G1 X159.264 Y158.88 E.05236
N5766 G1 X159.264 Y148.823 E.05236
N5767 G1 X190.736 Y140.39 E1.0477
N5768 G1 X190.736 Y139.194 E.03847
N5769 G1 X170.806 Y119.264 E.9063
N5770 G1 X167.593 Y119.264 E.10332
N5771 G1 X159.264 Y150.348 E1.03481
N5772 G1 X159.264 Y153.778 E.1103
N5773 G1 X190.736 Y185.249 E1.43118
N5774 G1 X190.736 Y182.534 E.08732
N5775 G1 X159.264 Y190.967 E1.0477
N5776 G1 X159.264 Y188.32 E.0851
N5777 G1 X171.68 Y200.736 E.5646
N5778 G1 X171.05 Y200.736 E.02026
N5779 G1 X190.736 Y127.267 E2.44583
N5780 G1 X190.736 Y123.533 E.12008
N5781 G1 X159.264 Y131.965 E1.0477
N5782 G1 X159.264 Y130.751 E.03906
N5783 G1 X190.736 Y162.222 E1.43118
N5784 G1 X190.736 Y165.677 E.1111
N5785 G1 X159.264 Y174.109 E1.0477
N5786 G1 X159.264 Y176.806 E.08673
N5787 G1 X183.194 Y200.736 E1.08821
N5788 G1 X185.72 Y200.736 E.08125
N5789 G1 X190.736 Y199.392 E.16696
N5790 G1 X190.736 Y196.763 E.08452
N5791 G1 X159.264 Y165.292 E1.43118
N5792 G1 X159.264 Y165.68 E.01248
N5793 G1 X190.736 Y157.248 E1.0477
N5794 G1 X190.736 Y158.723 E.04745
N5795 G1 X179.478 Y200.736 E1.39861
N5796 G1 X177.85 Y200.736 E.05236
N5798 G1 X179.478 Y200.736 E-.61876
N5799 G1 X179.575 Y200.377 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN5849 G1 Z2.2
N5850 G1 E.8 F1800
N5851 ; FEATURE: Inner wall
N5852 ; LINE_WIDTH: 0.45
N5853 ; LAYER_HEIGHT: 0.2
N5854 G1 F4421.739
N5855 M204 S8000
N5856 G1 X158.916 Y201.084 E1.03439
N5857 G1 X158.916 Y118.916 E2.64221
N5858 G1 X191.084 Y118.916 E1.03439
N5859 G1 X191.084 Y201.024 E2.64028
N5860 ; COOLING_NODE: 0
N5861 M204 S10000
N5862 G1 X191.491 Y201.491 F60000
N5863 M73 P40 R36
N5864 G1 F4421.739
N5865 M204 S8000
N5866 G1 X158.509 Y201.491 E1.06057
N5867 M73 P41 R36
N5868 G1 X158.509 Y118.509 E2.66839
N5869 G1 X191.491 Y118.509 E1.06057
N5870 G1 X191.491 Y201.431 E2.66646
N5871 ; COOLING_NODE: 0
N5872 M204 S10000
N5873 G1 X191.898 Y201.898 F60000
N5874 G1 F4421.739
N5875 M204 S8000
N5876 G1 X158.102 Y201.898 E1.08675
N5877 G1 X158.102 Y118.102 E2.69457
N5878 G1 X191.898 Y118.102 E1.08675
N5879 G1 X191.898 Y201.838 E2.69264
N5880 ; COOLING_NODE: 0
N5881 M204 S10000
N5882 G1 X192.29 Y202.29 F60000
N5883 ; FEATURE: Outer wall
N5884 ; LINE_WIDTH: 0.42
N5885 G1 F4773.528
N5886 M204 S5000
N5887 G1 X157.71 Y202.29 E1.03002
N5888 G1 X157.71 Y117.71 E2.51935
N5889 G1 X192.29 Y117.71 E1.03002
N5890 G1 X192.29 Y202.23 E2.51756
N5891 G1 E-.8 F1800
N5892 M204 S10000
N5893 G1 X189.389 Y200.736 Z2.6 F60000
N5894 G1 Z2.2
N5895 G1 E.8 F1800
N5896 ; FEATURE: Sparse infill
N5897 ; LINE_WIDTH: 0.45
N5898 G1 F4421.739
N5899 M204 S8000
N5900 G1 X187.761 Y200.736 E.05236
N5901 G1 X190.736 Y189.634 E.36959
N5902 G1 X190.736 Y188.005 E.05236
N5903 M204 S10000
N5904 G1 X190.736 Y192.738 F60000
N5905 G1 F4421.739
N5906 M204 S8000
N5907 G1 X190.736 Y191.109 E.05236
N5908 G1 X159.264 Y199.542 E1.0477
N5909 G1 X159.264 Y199.634 E.00296
N5910 G1 X160.366 Y200.736 E.05008
N5911 G1 X162.474 Y200.736 E.06781
N5912 G1 X184.305 Y119.264 E2.71223
N5913 G1 X182.52 Y119.264 E.05738
N5914 G1 X190.736 Y127.48 E.3736
N5915 M204 S10000
N5916 G1 X190.736 Y133.736 F60000
N5917 G1 F4421.739
N5918 M204 S8000
N5919 G1 X190.736 Y132.108 E.05236
N5920 G1 X159.264 Y140.54 E1.0477
N5921 G1 X159.264 Y142.064 E.04901
N5922 G1 X190.736 Y173.536 E1.43118
N5923 G1 X190.736 Y174.252 E.02303
N5924 G1 X159.264 Y182.684 E1.0477
N5925 G1 X159.264 Y181.259 E.04585
N5926 G1 X175.876 Y119.264 E2.06383
N5927 G1 X175.754 Y119.264 E.00391
N5928 G1 X159.264 Y123.683 E.54895
N5929 G1 X159.264 Y119.264 E.14208
N5930 G1 X159.492 Y119.264 E.00733
N5931 G1 X190.736 Y150.508 E1.42081
N5932 G1 X190.736 Y148.965 E.04959
N5933 G1 X159.264 Y157.398 E1.0477
N5934 G1 X159.264 Y159.026 E.05236
N5935 M204 S10000
N5936 G1 X159.264 Y148.969 F60000
N5937 G1 F4421.739
N5938 M204 S8000
N5939 G1 X190.736 Y140.537 E1.0477
N5940 G1 X190.736 Y138.994 E.04961
N5941 G1 X171.006 Y119.264 E.89721
N5942 G1 X167.447 Y119.264 E.11446
N5943 G1 X159.264 Y149.802 E1.01662
N5944 G1 X159.264 Y153.578 E.12144
N5945 G1 X190.736 Y185.049 E1.43118
N5946 G1 X190.736 Y182.681 E.07618
N5947 G1 X159.264 Y191.113 E1.04769
N5948 G1 X159.264 Y188.12 E.09624
N5949 G1 X171.88 Y200.736 E.57369
N5950 G1 X170.903 Y200.736 E.0314
N5951 G1 X190.736 Y126.72 E2.46402
N5952 G1 X190.736 Y123.679 E.0978
N5953 G1 X159.264 Y132.112 E1.04769
N5954 G1 X159.264 Y130.551 E.0502
N5955 G1 X190.736 Y162.022 E1.43118
N5956 G1 X190.736 Y165.823 E.12224
N5957 G1 X159.264 Y174.256 E1.04769
N5958 G1 X159.264 Y176.606 E.07559
N5959 G1 X183.394 Y200.736 E1.0973
N5960 G1 X186.267 Y200.736 E.09239
N5961 G1 X190.736 Y199.538 E.14877
N5962 G1 X190.736 Y196.563 E.09566
N5963 G1 X159.264 Y165.092 E1.43118
N5964 G1 X159.264 Y165.827 E.02362
N5965 G1 X190.736 Y157.394 E1.0477
N5966 G1 X190.736 Y158.177 E.02517
N5967 G1 X179.332 Y200.736 E1.4168
N5968 G1 X177.704 Y200.736 E.05236
N5969 ; WIPE_START
N5970 G1 X179.332 Y200.736 E-.61876
N5971 G1 X179.428 Y200.377 E-.14124
N5972 ; WIPE_END
N5973 G1 E-.04 F1800
N5974 M204 S10000
N5975 G17
N5976 G3 Z2.6 I1.217 J0 P1  F60000
N5977 ; stop printing object, unique label id: 372
N5978 M625
N5979 ; object ids of layer 11 start: 372
N5980 M624 AQAAAAAAAAA=
N5981 ;======== H2D 20250527========
N5982 ; SKIPPABLE_START
N5983 ; SKIPTYPE: timelapse
N5984 M622.1 S1 ; for prev firware, default turned on
N5985 
N5986 M1002 judge_flag timelapse_record_flag
N5987 
N5988 M622 J1
N5989 M993 A2 B2 C2
N5990 M993 A0 B0 C0
N5991 
N5992 
N5993 
N5994 
N5995     M9711 M0 E1 X261 Y132 Z2.6 S11 C10 O0 T3000
N5996 
N5997 
N5998 
N5999 M993 A3 B3 C3
N6000 
N6001 M623
N6002 ; SKIPPABLE_END
N6003 
N6004 ; object ids of this layer11 end: 372
N6005 M625
N6006 ; CHANGE_LAYER
N6007 ; Z_HEIGHT: 2.4
N6008 ; LAYER_HEIGHT: 0.2
N6009 ;======== H2D 20250521========
N6010 ; layer num/total_layer_count: 12/75
N6011 ; update layer progress
N6012 M73 L12
N6013 M991 S0 P11 ;notify layer change
N6014 
N6015 
N6016 ; OBJECT_ID: 372
N6017 ; COOLING_NODE: 0
N6018 ; start printing object, unique label id: 372
N6019 M624 AQAAAAAAAAA=
N6020 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=2.300G1 Z2.300 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N5856 G1 X158.916 Y201.084 E1.03439
N5857 G1 X158.916 Y118.916 E2.64221
N5858 G1 X191.084 Y118.916 E1.03439
N5859 G1 X191.084 Y201.024 E2.64028
N5866 G1 X158.509 Y201.491 E1.06057
N5868 G1 X158.509 Y118.509 E2.66839
N5869 G1 X191.491 Y118.509 E1.06057
N5870 G1 X191.491 Y201.431 E2.66646
N5876 G1 X158.102 Y201.898 E1.08675
N5877 G1 X158.102 Y118.102 E2.69457
N5878 G1 X191.898 Y118.102 E1.08675
N5879 G1 X191.898 Y201.838 E2.69264
N5887 G1 X157.71 Y202.29 E1.03002
N5888 G1 X157.71 Y117.71 E2.51935
N5889 G1 X192.29 Y117.71 E1.03002
N5890 G1 X192.29 Y202.23 E2.51756
N5900 G1 X187.761 Y200.736 E.05236
N5901 G1 X190.736 Y189.634 E.36959
N5902 G1 X190.736 Y188.005 E.05236
N5907 G1 X190.736 Y191.109 E.05236
N5908 G1 X159.264 Y199.542 E1.0477
N5909 G1 X159.264 Y199.634 E.00296
N5910 G1 X160.366 Y200.736 E.05008
N5911 G1 X162.474 Y200.736 E.06781
N5912 G1 X184.305 Y119.264 E2.71223
N5913 G1 X182.52 Y119.264 E.05738
N5914 G1 X190.736 Y127.48 E.3736
N5919 G1 X190.736 Y132.108 E.05236
N5920 G1 X159.264 Y140.54 E1.0477
N5921 G1 X159.264 Y142.064 E.04901
N5922 G1 X190.736 Y173.536 E1.43118
N5923 G1 X190.736 Y174.252 E.02303
N5924 G1 X159.264 Y182.684 E1.0477
N5925 G1 X159.264 Y181.259 E.04585
N5926 G1 X175.876 Y119.264 E2.06383
N5927 G1 X175.754 Y119.264 E.00391
N5928 G1 X159.264 Y123.683 E.54895
N5929 G1 X159.264 Y119.264 E.14208
N5930 G1 X159.492 Y119.264 E.00733
N5931 G1 X190.736 Y150.508 E1.42081
N5932 G1 X190.736 Y148.965 E.04959
N5933 G1 X159.264 Y157.398 E1.0477
N5934 G1 X159.264 Y159.026 E.05236
N5939 G1 X190.736 Y140.537 E1.0477
N5940 G1 X190.736 Y138.994 E.04961
N5941 G1 X171.006 Y119.264 E.89721
N5942 G1 X167.447 Y119.264 E.11446
N5943 G1 X159.264 Y149.802 E1.01662
N5944 G1 X159.264 Y153.578 E.12144
N5945 G1 X190.736 Y185.049 E1.43118
N5946 G1 X190.736 Y182.681 E.07618
N5947 G1 X159.264 Y191.113 E1.04769
N5948 G1 X159.264 Y188.12 E.09624
N5949 G1 X171.88 Y200.736 E.57369
N5950 G1 X170.903 Y200.736 E.0314
N5951 G1 X190.736 Y126.72 E2.46402
N5952 G1 X190.736 Y123.679 E.0978
N5953 G1 X159.264 Y132.112 E1.04769
N5954 G1 X159.264 Y130.551 E.0502
N5955 G1 X190.736 Y162.022 E1.43118
N5956 G1 X190.736 Y165.823 E.12224
N5957 G1 X159.264 Y174.256 E1.04769
N5958 G1 X159.264 Y176.606 E.07559
N5959 G1 X183.394 Y200.736 E1.0973
N5960 G1 X186.267 Y200.736 E.09239
N5961 G1 X190.736 Y199.538 E.14877
N5962 G1 X190.736 Y196.563 E.09566
N5963 G1 X159.264 Y165.092 E1.43118
N5964 G1 X159.264 Y165.827 E.02362
N5965 G1 X190.736 Y157.394 E1.0477
N5966 G1 X190.736 Y158.177 E.02517
N5967 G1 X179.332 Y200.736 E1.4168
N5968 G1 X177.704 Y200.736 E.05236
N5970 G1 X179.332 Y200.736 E-.61876
N5971 G1 X179.428 Y200.377 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN6021 G1 Z2.4
N6022 G1 E.8 F1800
N6023 ; FEATURE: Inner wall
N6024 ; LINE_WIDTH: 0.45
N6025 ; LAYER_HEIGHT: 0.2
N6026 G1 F4421.739
N6027 M204 S8000
N6028 G1 X158.916 Y201.084 E1.03439
N6029 G1 X158.916 Y118.916 E2.64221
N6030 G1 X191.084 Y118.916 E1.03439
N6031 G1 X191.084 Y201.024 E2.64028
N6032 ; COOLING_NODE: 0
N6033 M204 S10000
N6034 G1 X191.491 Y201.491 F60000
N6035 G1 F4421.739
N6036 M204 S8000
N6037 G1 X158.509 Y201.491 E1.06057
N6038 G1 X158.509 Y118.509 E2.66839
N6039 G1 X191.491 Y118.509 E1.06057
N6040 G1 X191.491 Y201.431 E2.66646
N6041 ; COOLING_NODE: 0
N6042 M204 S10000
N6043 G1 X191.898 Y201.898 F60000
N6044 G1 F4421.739
N6045 M204 S8000
N6046 G1 X158.102 Y201.898 E1.08675
N6047 G1 X158.102 Y118.102 E2.69457
N6048 G1 X191.898 Y118.102 E1.08675
N6049 G1 X191.898 Y201.838 E2.69264
N6050 ; COOLING_NODE: 0
N6051 M204 S10000
N6052 G1 X192.29 Y202.29 F60000
N6053 ; FEATURE: Outer wall
N6054 ; LINE_WIDTH: 0.42
N6055 G1 F4773.528
N6056 M204 S5000
N6057 G1 X157.71 Y202.29 E1.03002
N6058 G1 X157.71 Y117.71 E2.51935
N6059 G1 X192.29 Y117.71 E1.03002
N6060 G1 X192.29 Y202.23 E2.51756
N6061 G1 E-.8 F1800
N6062 M204 S10000
N6063 G1 X187.614 Y200.736 Z2.8 F60000
N6064 G1 Z2.4
N6065 G1 E.8 F1800
N6066 ; FEATURE: Sparse infill
N6067 ; LINE_WIDTH: 0.45
N6068 G1 F4421.739
N6069 M204 S8000
N6070 G1 X190.736 Y189.087 E.38778
N6071 G1 X190.736 Y187.459 E.05236
N6072 M204 S10000
N6073 G1 X190.736 Y192.884 F60000
N6074 G1 F4421.739
N6075 M204 S8000
N6076 G1 X190.736 Y191.256 E.05236
N6077 G1 X159.264 Y199.688 E1.0477
N6078 G1 X159.264 Y199.434 E.00817
N6079 G1 X160.566 Y200.736 E.05918
N6080 G1 X162.328 Y200.736 E.05667
N6081 M73 P42 R36
N6082 G1 X184.158 Y119.264 E2.71223
N6083 G1 X182.72 Y119.264 E.04624
N6084 G1 X190.736 Y127.28 E.3645
N6085 M204 S10000
N6086 G1 X190.736 Y133.883 F60000
N6087 G1 F4421.739
N6088 M204 S8000
N6089 G1 X190.736 Y132.254 E.05236
N6090 G1 X159.264 Y140.687 E1.0477
N6091 G1 X159.264 Y141.864 E.03787
N6092 G1 X190.736 Y173.336 E1.43118
N6093 G1 X190.736 Y174.398 E.03417
N6094 G1 X159.264 Y182.831 E1.0477
N6095 G1 X159.264 Y180.712 E.06813
N6096 G1 X175.729 Y119.264 E2.04564
N6097 M204 S10000
N6098 G1 X177.929 Y119.264 F60000
N6099 G1 F4421.739
N6100 M204 S8000
N6101 G1 X176.301 Y119.264 E.05236
N6102 G1 X159.264 Y123.829 E.56714
N6103 G1 X159.264 Y119.264 E.14679
N6104 G1 X159.692 Y119.264 E.01376
N6105 G1 X190.736 Y150.308 E1.41172
N6106 G1 X190.736 Y149.112 E.03845
N6107 G1 X159.264 Y157.544 E1.0477
N6108 G1 X159.264 Y153.378 E.13396
N6109 G1 X190.736 Y184.849 E1.43118
N6110 G1 X190.736 Y182.827 E.06504
N6111 G1 X159.264 Y191.26 E1.0477
N6112 G1 X159.264 Y187.92 E.10738
N6113 G1 X172.08 Y200.736 E.58279
N6114 G1 X170.757 Y200.736 E.04254
N6115 G1 X190.736 Y126.174 E2.48221
N6116 G1 X190.736 Y123.825 E.07552
N6117 G1 X159.264 Y132.258 E1.0477
N6118 G1 X159.264 Y130.351 E.06134
N6119 G1 X190.736 Y161.822 E1.43118
N6120 G1 X190.736 Y165.969 E.13338
N6121 G1 X159.264 Y174.402 E1.0477
N6122 G1 X159.264 Y176.406 E.06445
N6123 G1 X183.594 Y200.736 E1.1064
N6124 G1 X186.813 Y200.736 E.10353
N6125 G1 X190.736 Y199.685 E.13058
N6126 G1 X190.736 Y196.363 E.1068
N6127 G1 X159.264 Y164.892 E1.43118
N6128 G1 X159.264 Y165.973 E.03476
N6129 G1 X190.736 Y157.541 E1.0477
N6130 G1 X190.736 Y157.631 E.0029
N6131 G1 X179.186 Y200.736 E1.43499
N6132 G1 X177.557 Y200.736 E.05236
N6133 M204 S10000
N6134 G1 X169.578 Y119.264 F60000
N6135 G1 F4421.739
N6136 M204 S8000
N6137 G1 X171.206 Y119.264 E.05236
N6138 G1 X190.736 Y138.794 E.88811
N6139 G1 X190.736 Y140.683 E.06075
N6140 G1 X159.264 Y149.116 E1.0477
N6141 G1 X159.264 Y149.256 E.0045
N6142 G1 X167.301 Y119.264 E.99843
N6143 G1 X165.672 Y119.264 E.05236
N6144 ; WIPE_START
N6145 G1 X167.301 Y119.264 E-.61876
N6146 G1 X167.204 Y119.623 E-.14124
N6147 ; WIPE_END
N6148 G1 E-.04 F1800
N6149 M204 S10000
N6150 G17
N6151 G3 Z2.8 I1.217 J0 P1  F60000
N6152 ; stop printing object, unique label id: 372
N6153 M625
N6154 ; object ids of layer 12 start: 372
N6155 M624 AQAAAAAAAAA=
N6156 ;======== H2D 20250527========
N6157 ; SKIPPABLE_START
N6158 ; SKIPTYPE: timelapse
N6159 M622.1 S1 ; for prev firware, default turned on
N6160 
N6161 M1002 judge_flag timelapse_record_flag
N6162 
N6163 M622 J1
N6164 M993 A2 B2 C2
N6165 M993 A0 B0 C0
N6166 
N6167 
N6168 
N6169 
N6170     M9711 M0 E1 X261 Y132 Z2.8 S11 C10 O0 T3000
N6171 
N6172 
N6173 
N6174 M993 A3 B3 C3
N6175 
N6176 M623
N6177 ; SKIPPABLE_END
N6178 
N6179 ; object ids of this layer12 end: 372
N6180 M625
N6181 ; CHANGE_LAYER
N6182 ; Z_HEIGHT: 2.6
N6183 ; LAYER_HEIGHT: 0.2
N6184 ;======== H2D 20250521========
N6185 ; layer num/total_layer_count: 13/75
N6186 ; update layer progress
N6187 M73 L13
N6188 M991 S0 P12 ;notify layer change
N6189 
N6190 
N6191 M106 S38.25
N6192 ; OBJECT_ID: 372
N6193 ; COOLING_NODE: 0
N6194 ; start printing object, unique label id: 372
N6195 M624 AQAAAAAAAAA=
N6196 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=2.500G1 Z2.500 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N6028 G1 X158.916 Y201.084 E1.03439
N6029 G1 X158.916 Y118.916 E2.64221
N6030 G1 X191.084 Y118.916 E1.03439
N6031 G1 X191.084 Y201.024 E2.64028
N6037 G1 X158.509 Y201.491 E1.06057
N6038 G1 X158.509 Y118.509 E2.66839
N6039 G1 X191.491 Y118.509 E1.06057
N6040 G1 X191.491 Y201.431 E2.66646
N6046 G1 X158.102 Y201.898 E1.08675
N6047 G1 X158.102 Y118.102 E2.69457
N6048 G1 X191.898 Y118.102 E1.08675
N6049 G1 X191.898 Y201.838 E2.69264
N6057 G1 X157.71 Y202.29 E1.03002
N6058 G1 X157.71 Y117.71 E2.51935
N6059 G1 X192.29 Y117.71 E1.03002
N6060 G1 X192.29 Y202.23 E2.51756
N6070 G1 X190.736 Y189.087 E.38778
N6071 G1 X190.736 Y187.459 E.05236
N6076 G1 X190.736 Y191.256 E.05236
N6077 G1 X159.264 Y199.688 E1.0477
N6078 G1 X159.264 Y199.434 E.00817
N6079 G1 X160.566 Y200.736 E.05918
N6080 G1 X162.328 Y200.736 E.05667
N6082 G1 X184.158 Y119.264 E2.71223
N6083 G1 X182.72 Y119.264 E.04624
N6084 G1 X190.736 Y127.28 E.3645
N6089 G1 X190.736 Y132.254 E.05236
N6090 G1 X159.264 Y140.687 E1.0477
N6091 G1 X159.264 Y141.864 E.03787
N6092 G1 X190.736 Y173.336 E1.43118
N6093 G1 X190.736 Y174.398 E.03417
N6094 G1 X159.264 Y182.831 E1.0477
N6095 G1 X159.264 Y180.712 E.06813
N6096 G1 X175.729 Y119.264 E2.04564
N6101 G1 X176.301 Y119.264 E.05236
N6102 G1 X159.264 Y123.829 E.56714
N6103 G1 X159.264 Y119.264 E.14679
N6104 G1 X159.692 Y119.264 E.01376
N6105 G1 X190.736 Y150.308 E1.41172
N6106 G1 X190.736 Y149.112 E.03845
N6107 G1 X159.264 Y157.544 E1.0477
N6108 G1 X159.264 Y153.378 E.13396
N6109 G1 X190.736 Y184.849 E1.43118
N6110 G1 X190.736 Y182.827 E.06504
N6111 G1 X159.264 Y191.26 E1.0477
N6112 G1 X159.264 Y187.92 E.10738
N6113 G1 X172.08 Y200.736 E.58279
N6114 G1 X170.757 Y200.736 E.04254
N6115 G1 X190.736 Y126.174 E2.48221
N6116 G1 X190.736 Y123.825 E.07552
N6117 G1 X159.264 Y132.258 E1.0477
N6118 G1 X159.264 Y130.351 E.06134
N6119 G1 X190.736 Y161.822 E1.43118
N6120 G1 X190.736 Y165.969 E.13338
N6121 G1 X159.264 Y174.402 E1.0477
N6122 G1 X159.264 Y176.406 E.06445
N6123 G1 X183.594 Y200.736 E1.1064
N6124 G1 X186.813 Y200.736 E.10353
N6125 G1 X190.736 Y199.685 E.13058
N6126 G1 X190.736 Y196.363 E.1068
N6127 G1 X159.264 Y164.892 E1.43118
N6128 G1 X159.264 Y165.973 E.03476
N6129 G1 X190.736 Y157.541 E1.0477
N6130 G1 X190.736 Y157.631 E.0029
N6131 G1 X179.186 Y200.736 E1.43499
N6132 G1 X177.557 Y200.736 E.05236
N6137 G1 X171.206 Y119.264 E.05236
N6138 G1 X190.736 Y138.794 E.88811
N6139 G1 X190.736 Y140.683 E.06075
N6140 G1 X159.264 Y149.116 E1.0477
N6141 G1 X159.264 Y149.256 E.0045
N6142 G1 X167.301 Y119.264 E.99843
N6143 G1 X165.672 Y119.264 E.05236
N6145 G1 X167.301 Y119.264 E-.61876
N6146 G1 X167.204 Y119.623 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN6197 G1 Z2.6
N6198 G1 E.8 F1800
N6199 ; FEATURE: Inner wall
N6200 ; LINE_WIDTH: 0.45
N6201 ; LAYER_HEIGHT: 0.2
N6202 G1 F4421.739
N6203 M204 S8000
N6204 G1 X158.916 Y201.084 E1.03439
N6205 G1 X158.916 Y118.916 E2.64221
N6206 G1 X191.084 Y118.916 E1.03439
N6207 G1 X191.084 Y201.024 E2.64028
N6208 ; COOLING_NODE: 0
N6209 M204 S10000
N6210 G1 X191.491 Y201.491 F60000
N6211 G1 F4421.739
N6212 M204 S8000
N6213 G1 X158.509 Y201.491 E1.06057
N6214 G1 X158.509 Y118.509 E2.66839
N6215 G1 X191.491 Y118.509 E1.06057
N6216 G1 X191.491 Y201.431 E2.66646
N6217 ; COOLING_NODE: 0
N6218 M204 S10000
N6219 G1 X191.898 Y201.898 F60000
N6220 G1 F4421.739
N6221 M204 S8000
N6222 G1 X158.102 Y201.898 E1.08675
N6223 G1 X158.102 Y118.102 E2.69457
N6224 G1 X191.898 Y118.102 E1.08675
N6225 G1 X191.898 Y201.838 E2.69264
N6226 ; COOLING_NODE: 0
N6227 M204 S10000
N6228 M73 P42 R35
N6229 G1 X192.29 Y202.29 F60000
N6230 ; FEATURE: Outer wall
N6231 ; LINE_WIDTH: 0.42
N6232 G1 F4773.528
N6233 M204 S5000
N6234 G1 X157.71 Y202.29 E1.03002
N6235 G1 X157.71 Y117.71 E2.51935
N6236 G1 X192.29 Y117.71 E1.03002
N6237 G1 X192.29 Y202.23 E2.51756
N6238 G1 E-.8 F1800
N6239 M204 S10000
N6240 G1 X191.018 Y194.704 Z3 F60000
N6241 G1 X190.736 Y193.03 Z3
N6242 G1 Z2.6
N6243 G1 E.8 F1800
N6244 ; FEATURE: Sparse infill
N6245 ; LINE_WIDTH: 0.45
N6246 G1 F4421.739
N6247 M204 S8000
N6248 G1 X190.736 Y191.402 E.05236
N6249 G1 X159.264 Y199.835 E1.0477
N6250 G1 X159.264 Y199.234 E.01931
N6251 G1 X160.766 Y200.736 E.06827
N6252 G1 X162.182 Y200.736 E.04553
N6253 G1 X184.012 Y119.264 E2.71223
N6254 G1 X182.92 Y119.264 E.0351
N6255 G1 X190.736 Y127.08 E.35541
N6256 G1 X190.736 Y132.401 E.1711
N6257 G1 X159.264 Y140.833 E1.0477
N6258 G1 X159.264 Y141.664 E.02673
N6259 G1 X190.736 Y173.136 E1.43118
N6260 G1 X190.736 Y174.545 E.04531
N6261 G1 X159.264 Y182.977 E1.0477
N6262 G1 X159.264 Y180.166 E.0904
N6263 G1 X175.583 Y119.264 E2.02745
N6264 G1 X171.406 Y119.264 E.13431
N6265 G1 X190.736 Y138.594 E.87902
N6266 G1 X190.736 Y140.829 E.07189
N6267 G1 X159.264 Y149.262 E1.0477
N6268 G1 X159.264 Y148.709 E.01778
N6269 G1 X167.154 Y119.264 E.98024
N6270 G1 X165.526 Y119.264 E.05236
N6271 M204 S10000
N6272 G1 X178.475 Y119.264 F60000
N6273 G1 F4421.739
N6274 M204 S8000
N6275 G1 X176.847 Y119.264 E.05236
N6276 G1 X159.264 Y123.976 E.58533
N6277 G1 X159.264 Y119.264 E.1515
N6278 G1 X159.892 Y119.264 E.02019
N6279 G1 X190.736 Y150.108 E1.40262
N6280 G1 X190.736 Y149.258 E.02732
N6281 G1 X159.264 Y157.691 E1.0477
N6282 G1 X159.264 Y153.178 E.1451
N6283 G1 X190.736 Y184.649 E1.43118
N6284 G1 X190.736 Y182.973 E.0539
N6285 G1 X159.264 Y191.406 E1.0477
N6286 G1 X159.264 Y187.72 E.11852
N6287 G1 X172.28 Y200.736 E.59188
N6288 G1 X170.61 Y200.736 E.05368
N6289 G1 X190.736 Y125.628 E2.5004
N6290 G1 X190.736 Y123.972 E.05324
N6291 G1 X159.264 Y132.404 E1.0477
N6292 G1 X159.264 Y130.151 E.07248
N6293 G1 X190.736 Y161.622 E1.43118
N6294 G1 X190.736 Y166.116 E.14452
N6295 G1 X159.264 Y174.548 E1.0477
N6296 G1 X159.264 Y176.206 E.05331
N6297 M73 P43 R35
N6298 G1 X183.794 Y200.736 E1.11549
N6299 G1 X179.039 Y200.736 E.15289
N6300 G1 X190.736 Y157.084 E1.45318
N6301 G1 X190.736 Y155.456 E.05236
N6302 M204 S10000
N6303 G1 X190.736 Y157.687 F60000
N6304 G1 F4421.739
N6305 M204 S8000
N6306 G1 X159.264 Y166.12 E1.0477
N6307 G1 X159.264 Y164.692 E.0459
N6308 G1 X190.736 Y196.163 E1.43118
N6309 G1 X190.736 Y199.831 E.11793
N6310 G1 X187.36 Y200.736 E.11239
N6311 G1 X187.468 Y200.736 E.00348
N6312 G1 X190.736 Y188.541 E.40597
N6313 G1 X190.736 Y186.913 E.05236
N6314 ; WIPE_START
N6315 G1 X190.736 Y188.541 E-.61876
N6316 G1 X190.639 Y188.9 E-.14124
N6317 ; WIPE_END
N6318 G1 E-.04 F1800
N6319 M204 S10000
N6320 G17
N6321 G3 Z3 I1.217 J0 P1  F60000
N6322 ; stop printing object, unique label id: 372
N6323 M625
N6324 ; object ids of layer 13 start: 372
N6325 M624 AQAAAAAAAAA=
N6326 ;======== H2D 20250527========
N6327 ; SKIPPABLE_START
N6328 ; SKIPTYPE: timelapse
N6329 M622.1 S1 ; for prev firware, default turned on
N6330 
N6331 M1002 judge_flag timelapse_record_flag
N6332 
N6333 M622 J1
N6334 M993 A2 B2 C2
N6335 M993 A0 B0 C0
N6336 
N6337 
N6338 
N6339 
N6340     M9711 M0 E1 X261 Y132 Z3 S11 C10 O0 T3000
N6341 
N6342 
N6343 
N6344 M993 A3 B3 C3
N6345 
N6346 M623
N6347 ; SKIPPABLE_END
N6348 
N6349 ; object ids of this layer13 end: 372
N6350 M625
N6351 ; CHANGE_LAYER
N6352 ; Z_HEIGHT: 2.8
N6353 ; LAYER_HEIGHT: 0.2
N6354 ;======== H2D 20250521========
N6355 ; layer num/total_layer_count: 14/75
N6356 ; update layer progress
N6357 M73 L14
N6358 M991 S0 P13 ;notify layer change
N6359 
N6360 
N6361 ; OBJECT_ID: 372
N6362 ; COOLING_NODE: 0
N6363 ; start printing object, unique label id: 372
N6364 M624 AQAAAAAAAAA=
N6365 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=2.700G1 Z2.700 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N6204 G1 X158.916 Y201.084 E1.03439
N6205 G1 X158.916 Y118.916 E2.64221
N6206 G1 X191.084 Y118.916 E1.03439
N6207 G1 X191.084 Y201.024 E2.64028
N6213 G1 X158.509 Y201.491 E1.06057
N6214 G1 X158.509 Y118.509 E2.66839
N6215 G1 X191.491 Y118.509 E1.06057
N6216 G1 X191.491 Y201.431 E2.66646
N6222 G1 X158.102 Y201.898 E1.08675
N6223 G1 X158.102 Y118.102 E2.69457
N6224 G1 X191.898 Y118.102 E1.08675
N6225 G1 X191.898 Y201.838 E2.69264
N6234 G1 X157.71 Y202.29 E1.03002
N6235 G1 X157.71 Y117.71 E2.51935
N6236 G1 X192.29 Y117.71 E1.03002
N6237 G1 X192.29 Y202.23 E2.51756
N6248 G1 X190.736 Y191.402 E.05236
N6249 G1 X159.264 Y199.835 E1.0477
N6250 G1 X159.264 Y199.234 E.01931
N6251 G1 X160.766 Y200.736 E.06827
N6252 G1 X162.182 Y200.736 E.04553
N6253 G1 X184.012 Y119.264 E2.71223
N6254 G1 X182.92 Y119.264 E.0351
N6255 G1 X190.736 Y127.08 E.35541
N6256 G1 X190.736 Y132.401 E.1711
N6257 G1 X159.264 Y140.833 E1.0477
N6258 G1 X159.264 Y141.664 E.02673
N6259 G1 X190.736 Y173.136 E1.43118
N6260 G1 X190.736 Y174.545 E.04531
N6261 G1 X159.264 Y182.977 E1.0477
N6262 G1 X159.264 Y180.166 E.0904
N6263 G1 X175.583 Y119.264 E2.02745
N6264 G1 X171.406 Y119.264 E.13431
N6265 G1 X190.736 Y138.594 E.87902
N6266 G1 X190.736 Y140.829 E.07189
N6267 G1 X159.264 Y149.262 E1.0477
N6268 G1 X159.264 Y148.709 E.01778
N6269 G1 X167.154 Y119.264 E.98024
N6270 G1 X165.526 Y119.264 E.05236
N6275 G1 X176.847 Y119.264 E.05236
N6276 G1 X159.264 Y123.976 E.58533
N6277 G1 X159.264 Y119.264 E.1515
N6278 G1 X159.892 Y119.264 E.02019
N6279 G1 X190.736 Y150.108 E1.40262
N6280 G1 X190.736 Y149.258 E.02732
N6281 G1 X159.264 Y157.691 E1.0477
N6282 G1 X159.264 Y153.178 E.1451
N6283 G1 X190.736 Y184.649 E1.43118
N6284 G1 X190.736 Y182.973 E.0539
N6285 G1 X159.264 Y191.406 E1.0477
N6286 G1 X159.264 Y187.72 E.11852
N6287 G1 X172.28 Y200.736 E.59188
N6288 G1 X170.61 Y200.736 E.05368
N6289 G1 X190.736 Y125.628 E2.5004
N6290 G1 X190.736 Y123.972 E.05324
N6291 G1 X159.264 Y132.404 E1.0477
N6292 G1 X159.264 Y130.151 E.07248
N6293 G1 X190.736 Y161.622 E1.43118
N6294 G1 X190.736 Y166.116 E.14452
N6295 G1 X159.264 Y174.548 E1.0477
N6296 G1 X159.264 Y176.206 E.05331
N6298 G1 X183.794 Y200.736 E1.11549
N6299 G1 X179.039 Y200.736 E.15289
N6300 G1 X190.736 Y157.084 E1.45318
N6301 G1 X190.736 Y155.456 E.05236
N6306 G1 X159.264 Y166.12 E1.0477
N6307 G1 X159.264 Y164.692 E.0459
N6308 G1 X190.736 Y196.163 E1.43118
N6309 G1 X190.736 Y199.831 E.11793
N6310 G1 X187.36 Y200.736 E.11239
N6311 G1 X187.468 Y200.736 E.00348
N6312 G1 X190.736 Y188.541 E.40597
N6313 G1 X190.736 Y186.913 E.05236
N6315 G1 X190.736 Y188.541 E-.61876
N6316 G1 X190.639 Y188.9 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN6366 G1 Z2.8
N6367 G1 E.8 F1800
N6368 ; FEATURE: Inner wall
N6369 ; LINE_WIDTH: 0.45
N6370 ; LAYER_HEIGHT: 0.2
N6371 G1 F4421.739
N6372 M204 S8000
N6373 G1 X158.916 Y201.084 E1.03439
N6374 G1 X158.916 Y118.916 E2.64221
N6375 G1 X191.084 Y118.916 E1.03439
N6376 G1 X191.084 Y201.024 E2.64028
N6377 ; COOLING_NODE: 0
N6378 M204 S10000
N6379 G1 X191.491 Y201.491 F60000
N6380 G1 F4421.739
N6381 M204 S8000
N6382 G1 X158.509 Y201.491 E1.06057
N6383 G1 X158.509 Y118.509 E2.66839
N6384 G1 X191.491 Y118.509 E1.06057
N6385 G1 X191.491 Y201.431 E2.66646
N6386 ; COOLING_NODE: 0
N6387 M204 S10000
N6388 G1 X191.898 Y201.898 F60000
N6389 G1 F4421.739
N6390 M204 S8000
N6391 G1 X158.102 Y201.898 E1.08675
N6392 G1 X158.102 Y118.102 E2.69457
N6393 G1 X191.898 Y118.102 E1.08675
N6394 G1 X191.898 Y201.838 E2.69264
N6395 ; COOLING_NODE: 0
N6396 M204 S10000
N6397 G1 X192.29 Y202.29 F60000
N6398 ; FEATURE: Outer wall
N6399 ; LINE_WIDTH: 0.42
N6400 G1 F4773.528
N6401 M204 S5000
N6402 G1 X157.71 Y202.29 E1.03002
N6403 G1 X157.71 Y117.71 E2.51935
N6404 G1 X192.29 Y117.71 E1.03002
N6405 G1 X192.29 Y202.23 E2.51756
N6406 G1 E-.8 F1800
N6407 M204 S10000
N6408 G1 X190.998 Y194.708 Z3.2 F60000
N6409 G1 X190.736 Y193.177 Z3.2
N6410 G1 Z2.8
N6411 G1 E.8 F1800
N6412 ; FEATURE: Sparse infill
N6413 ; LINE_WIDTH: 0.45
N6414 G1 F4421.739
N6415 M204 S8000
N6416 G1 X190.736 Y191.549 E.05236
N6417 G1 X159.264 Y199.981 E1.04769
N6418 G1 X159.264 Y199.034 E.03045
N6419 G1 X160.966 Y200.736 E.07737
N6420 G1 X162.035 Y200.736 E.03439
N6421 G1 X183.865 Y119.264 E2.71223
N6422 G1 X183.12 Y119.264 E.02396
N6423 G1 X190.736 Y126.88 E.34631
N6424 G1 X190.736 Y132.547 E.18224
N6425 G1 X159.264 Y140.98 E1.04769
N6426 G1 X159.264 Y141.464 E.01559
N6427 G1 X190.736 Y172.936 E1.43118
N6428 G1 X190.736 Y174.691 E.05645
N6429 G1 X159.264 Y183.124 E1.0477
N6430 G1 X159.264 Y179.619 E.11268
N6431 G1 X175.437 Y119.264 E2.00926
N6432 G1 X171.606 Y119.264 E.12317
N6433 G1 X190.736 Y138.394 E.86992
N6434 G1 X190.736 Y140.976 E.08303
N6435 G1 X159.264 Y149.408 E1.0477
N6436 G1 X159.264 Y148.163 E.04006
N6437 G1 X167.008 Y119.264 E.96205
N6438 G1 X165.379 Y119.264 E.05236
N6439 M204 S10000
N6440 G1 X179.022 Y119.264 F60000
N6441 G1 F4421.739
N6442 M204 S8000
N6443 G1 X177.393 Y119.264 E.05236
N6444 G1 X159.264 Y124.122 E.60352
N6445 G1 X159.264 Y119.264 E.1562
N6446 G1 X160.092 Y119.264 E.02662
N6447 G1 X190.736 Y149.908 E1.39353
N6448 G1 X190.736 Y149.405 E.01618
N6449 G1 X159.264 Y157.837 E1.04769
N6450 G1 X159.264 Y152.978 E.15624
N6451 G1 X190.736 Y184.449 E1.43118
N6452 G1 X190.736 Y183.12 E.04276
N6453 G1 X159.264 Y191.552 E1.0477
N6454 G1 X159.264 Y187.52 E.12966
N6455 G1 X172.48 Y200.736 E.60098
N6456 G1 X170.464 Y200.736 E.06482
N6457 G1 X190.736 Y125.081 E2.51859
N6458 G1 X190.736 Y124.118 E.03096
N6459 G1 X159.264 Y132.551 E1.0477
N6460 G1 X159.264 Y129.951 E.08362
N6461 G1 X190.736 Y161.422 E1.43118
N6462 G1 X190.736 Y157.833 E.11538
N6463 G1 X159.264 Y166.266 E1.0477
N6464 G1 X159.264 Y164.492 E.05704
N6465 G1 X190.736 Y195.963 E1.43118
N6466 G1 X190.736 Y199.977 E.12907
N6467 G1 X187.906 Y200.736 E.0942
N6468 G1 X187.322 Y200.736 E.01879
N6469 G1 X190.736 Y187.995 E.42416
N6470 G1 X190.736 Y186.366 E.05236
N6471 M204 S10000
N6472 G1 X190.736 Y167.891 F60000
N6473 G1 F4421.739
N6474 M204 S8000
N6475 G1 X190.736 Y166.262 E.05236
N6476 G1 X159.264 Y174.695 E1.0477
N6477 G1 X159.264 Y176.006 E.04217
N6478 G1 X183.994 Y200.736 E1.12459
N6479 G1 X178.893 Y200.736 E.16403
N6480 G1 X190.736 Y156.538 E1.47137
N6481 G1 X190.736 Y154.91 E.05236
N6482 ; WIPE_START
N6483 G1 X190.736 Y156.538 E-.61876
N6484 G1 X190.639 Y156.897 E-.14124
N6485 ; WIPE_END
N6486 G1 E-.04 F1800
N6487 M204 S10000
N6488 G17
N6489 G3 Z3.2 I1.217 J0 P1  F60000
N6490 ; stop printing object, unique label id: 372
N6491 M625
N6492 ; object ids of layer 14 start: 372
N6493 M624 AQAAAAAAAAA=
N6494 ;======== H2D 20250527========
N6495 ; SKIPPABLE_START
N6496 ; SKIPTYPE: timelapse
N6497 M622.1 S1 ; for prev firware, default turned on
N6498 
N6499 M1002 judge_flag timelapse_record_flag
N6500 
N6501 M622 J1
N6502 M993 A2 B2 C2
N6503 M993 A0 B0 C0
N6504 
N6505 
N6506 
N6507 
N6508     M9711 M0 E1 X261 Y132 Z3.2 S11 C10 O0 T3000
N6509 
N6510 
N6511 
N6512 M993 A3 B3 C3
N6513 
N6514 M623
N6515 ; SKIPPABLE_END
N6516 
N6517 ; object ids of this layer14 end: 372
N6518 M625
N6519 ; CHANGE_LAYER
N6520 ; Z_HEIGHT: 3
N6521 ; LAYER_HEIGHT: 0.2
N6522 ;======== H2D 20250521========
N6523 ; layer num/total_layer_count: 15/75
N6524 ; update layer progress
N6525 M73 L15
N6526 M991 S0 P14 ;notify layer change
N6527 
N6528 
N6529 ; OBJECT_ID: 372
N6530 ; COOLING_NODE: 0
N6531 ; start printing object, unique label id: 372
N6532 M624 AQAAAAAAAAA=
N6533 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=2.900G1 Z2.900 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N6373 G1 X158.916 Y201.084 E1.03439
N6374 G1 X158.916 Y118.916 E2.64221
N6375 G1 X191.084 Y118.916 E1.03439
N6376 G1 X191.084 Y201.024 E2.64028
N6382 G1 X158.509 Y201.491 E1.06057
N6383 G1 X158.509 Y118.509 E2.66839
N6384 G1 X191.491 Y118.509 E1.06057
N6385 G1 X191.491 Y201.431 E2.66646
N6391 G1 X158.102 Y201.898 E1.08675
N6392 G1 X158.102 Y118.102 E2.69457
N6393 G1 X191.898 Y118.102 E1.08675
N6394 G1 X191.898 Y201.838 E2.69264
N6402 G1 X157.71 Y202.29 E1.03002
N6403 G1 X157.71 Y117.71 E2.51935
N6404 G1 X192.29 Y117.71 E1.03002
N6405 G1 X192.29 Y202.23 E2.51756
N6416 G1 X190.736 Y191.549 E.05236
N6417 G1 X159.264 Y199.981 E1.04769
N6418 G1 X159.264 Y199.034 E.03045
N6419 G1 X160.966 Y200.736 E.07737
N6420 G1 X162.035 Y200.736 E.03439
N6421 G1 X183.865 Y119.264 E2.71223
N6422 G1 X183.12 Y119.264 E.02396
N6423 G1 X190.736 Y126.88 E.34631
N6424 G1 X190.736 Y132.547 E.18224
N6425 G1 X159.264 Y140.98 E1.04769
N6426 G1 X159.264 Y141.464 E.01559
N6427 G1 X190.736 Y172.936 E1.43118
N6428 G1 X190.736 Y174.691 E.05645
N6429 G1 X159.264 Y183.124 E1.0477
N6430 G1 X159.264 Y179.619 E.11268
N6431 G1 X175.437 Y119.264 E2.00926
N6432 G1 X171.606 Y119.264 E.12317
N6433 G1 X190.736 Y138.394 E.86992
N6434 G1 X190.736 Y140.976 E.08303
N6435 G1 X159.264 Y149.408 E1.0477
N6436 G1 X159.264 Y148.163 E.04006
N6437 G1 X167.008 Y119.264 E.96205
N6438 G1 X165.379 Y119.264 E.05236
N6443 G1 X177.393 Y119.264 E.05236
N6444 G1 X159.264 Y124.122 E.60352
N6445 G1 X159.264 Y119.264 E.1562
N6446 G1 X160.092 Y119.264 E.02662
N6447 G1 X190.736 Y149.908 E1.39353
N6448 G1 X190.736 Y149.405 E.01618
N6449 G1 X159.264 Y157.837 E1.04769
N6450 G1 X159.264 Y152.978 E.15624
N6451 G1 X190.736 Y184.449 E1.43118
N6452 G1 X190.736 Y183.12 E.04276
N6453 G1 X159.264 Y191.552 E1.0477
N6454 G1 X159.264 Y187.52 E.12966
N6455 G1 X172.48 Y200.736 E.60098
N6456 G1 X170.464 Y200.736 E.06482
N6457 G1 X190.736 Y125.081 E2.51859
N6458 G1 X190.736 Y124.118 E.03096
N6459 G1 X159.264 Y132.551 E1.0477
N6460 G1 X159.264 Y129.951 E.08362
N6461 G1 X190.736 Y161.422 E1.43118
N6462 G1 X190.736 Y157.833 E.11538
N6463 G1 X159.264 Y166.266 E1.0477
N6464 G1 X159.264 Y164.492 E.05704
N6465 G1 X190.736 Y195.963 E1.43118
N6466 G1 X190.736 Y199.977 E.12907
N6467 G1 X187.906 Y200.736 E.0942
N6468 G1 X187.322 Y200.736 E.01879
N6469 G1 X190.736 Y187.995 E.42416
N6470 G1 X190.736 Y186.366 E.05236
N6475 G1 X190.736 Y166.262 E.05236
N6476 G1 X159.264 Y174.695 E1.0477
N6477 G1 X159.264 Y176.006 E.04217
N6478 G1 X183.994 Y200.736 E1.12459
N6479 G1 X178.893 Y200.736 E.16403
N6480 G1 X190.736 Y156.538 E1.47137
N6481 G1 X190.736 Y154.91 E.05236
N6483 G1 X190.736 Y156.538 E-.61876
N6484 G1 X190.639 Y156.897 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN6534 G1 Z3
N6535 G1 E.8 F1800
N6536 ; FEATURE: Inner wall
N6537 ; LINE_WIDTH: 0.45
N6538 ; LAYER_HEIGHT: 0.2
N6539 G1 F4421.739
N6540 M204 S8000
N6541 G1 X158.916 Y201.084 E1.03439
N6542 G1 X158.916 Y118.916 E2.64221
N6543 G1 X191.084 Y118.916 E1.03439
N6544 G1 X191.084 Y201.024 E2.64028
N6545 ; COOLING_NODE: 0
N6546 M204 S10000
N6547 G1 X191.491 Y201.491 F60000
N6548 G1 F4421.739
N6549 M204 S8000
N6550 G1 X158.509 Y201.491 E1.06057
N6551 G1 X158.509 Y118.509 E2.66839
N6552 G1 X191.491 Y118.509 E1.06057
N6553 G1 X191.491 Y201.431 E2.66646
N6554 ; COOLING_NODE: 0
N6555 M204 S10000
N6556 G1 X191.898 Y201.898 F60000
N6557 G1 F4421.739
N6558 M204 S8000
N6559 G1 X158.102 Y201.898 E1.08675
N6560 G1 X158.102 Y118.102 E2.69457
N6561 G1 X191.898 Y118.102 E1.08675
N6562 G1 X191.898 Y201.838 E2.69264
N6563 ; COOLING_NODE: 0
N6564 M204 S10000
N6565 M73 P44 R35
N6566 G1 X192.29 Y202.29 F60000
N6567 ; FEATURE: Outer wall
N6568 ; LINE_WIDTH: 0.42
N6569 G1 F4773.528
N6570 M204 S5000
N6571 G1 X157.71 Y202.29 E1.03002
N6572 G1 X157.71 Y117.71 E2.51935
N6573 G1 X192.29 Y117.71 E1.03002
N6574 G1 X192.29 Y202.23 E2.51756
N6575 G1 E-.8 F1800
N6576 M204 S10000
N6577 G1 X190.736 Y198.495 Z3.4 F60000
N6578 G1 Z3
N6579 M73 P44 R34
N6580 G1 E.8 F1800
N6581 ; FEATURE: Sparse infill
N6582 ; LINE_WIDTH: 0.45
N6583 G1 F4421.739
N6584 M204 S8000
N6585 G1 X190.736 Y200.124 E.05236
N6586 G1 X188.452 Y200.736 E.076
N6587 G1 X187.175 Y200.736 E.04107
N6588 G1 X190.736 Y187.448 E.44235
N6589 G1 X190.736 Y185.82 E.05236
N6590 M204 S10000
N6591 G1 X190.736 Y168.037 F60000
N6592 G1 F4421.739
N6593 M204 S8000
N6594 G1 X190.736 Y166.409 E.05236
N6595 G1 X159.264 Y174.841 E1.0477
N6596 G1 X159.264 Y175.806 E.03103
N6597 G1 X184.194 Y200.736 E1.13368
N6598 G1 X178.746 Y200.736 E.17517
N6599 G1 X190.736 Y155.991 E1.48957
N6600 G1 X190.736 Y154.363 E.05236
N6601 M204 S10000
N6602 G1 X190.736 Y134.322 F60000
N6603 G1 F4421.739
N6604 M204 S8000
N6605 G1 X190.736 Y132.693 E.05236
N6606 G1 X159.264 Y141.126 E1.04769
N6607 G1 X159.264 Y141.264 E.00445
N6608 G1 X190.736 Y172.736 E1.43118
N6609 G1 X190.736 Y174.837 E.06759
N6610 G1 X159.264 Y183.27 E1.04769
N6611 G1 X159.264 Y187.32 E.13024
N6612 G1 X172.68 Y200.736 E.61007
N6613 G1 X170.318 Y200.736 E.07596
N6614 G1 X190.736 Y124.535 E2.53678
N6615 G1 X190.736 Y124.265 E.00868
N6616 G1 X159.264 Y132.697 E1.0477
N6617 G1 X159.264 Y129.751 E.09476
N6618 G1 X190.736 Y161.222 E1.43118
N6619 G1 X190.736 Y157.98 E.10424
N6620 G1 X159.264 Y166.412 E1.0477
N6621 G1 X159.264 Y164.292 E.06818
N6622 G1 X190.736 Y195.763 E1.43118
N6623 G1 X190.736 Y191.695 E.13083
N6624 G1 X159.264 Y200.128 E1.04769
N6625 G1 X159.264 Y198.834 E.04159
N6626 G1 X161.166 Y200.736 E.08647
N6627 G1 X161.889 Y200.736 E.02325
N6628 G1 X183.719 Y119.264 E2.71223
N6629 G1 X183.32 Y119.264 E.01282
N6630 G1 X190.736 Y126.68 E.33722
N6631 G1 X190.736 Y128.308 E.05236
N6632 M204 S10000
N6633 G1 X179.568 Y119.264 F60000
N6634 G1 F4421.739
N6635 M204 S8000
N6636 G1 X177.94 Y119.264 E.05236
N6637 G1 X159.264 Y124.268 E.62172
N6638 G1 X159.264 Y119.264 E.16091
N6639 G1 X160.292 Y119.264 E.03305
N6640 G1 X190.736 Y149.708 E1.38443
N6641 G1 X190.736 Y149.551 E.00504
N6642 G1 X159.264 Y157.984 E1.0477
N6643 G1 X159.264 Y152.778 E.16738
N6644 G1 X190.736 Y184.249 E1.43118
N6645 G1 X190.736 Y183.266 E.03162
N6646 G1 X159.264 Y191.699 E1.0477
N6647 G1 X159.264 Y193.327 E.05236
N6648 M204 S10000
N6649 G1 X159.264 Y180.701 F60000
N6650 G1 F4421.739
N6651 M204 S8000
N6652 G1 X159.264 Y179.073 E.05236
N6653 G1 X175.29 Y119.264 E1.99107
N6654 G1 X171.806 Y119.264 E.11203
N6655 G1 X190.736 Y138.194 E.86083
N6656 G1 X190.736 Y141.122 E.09417
N6657 G1 X159.264 Y149.555 E1.0477
N6658 G1 X159.264 Y147.616 E.06234
N6659 G1 X166.861 Y119.264 E.94385
N6660 G1 X165.233 Y119.264 E.05236
N6661 ; WIPE_START
N6662 G1 X166.861 Y119.264 E-.61876
N6663 G1 X166.765 Y119.623 E-.14124
N6664 ; WIPE_END
N6665 G1 E-.04 F1800
N6666 M204 S10000
N6667 G17
N6668 G3 Z3.4 I1.217 J0 P1  F60000
N6669 ; stop printing object, unique label id: 372
N6670 M625
N6671 ; object ids of layer 15 start: 372
N6672 M624 AQAAAAAAAAA=
N6673 ;======== H2D 20250527========
N6674 ; SKIPPABLE_START
N6675 ; SKIPTYPE: timelapse
N6676 M622.1 S1 ; for prev firware, default turned on
N6677 
N6678 M1002 judge_flag timelapse_record_flag
N6679 
N6680 M622 J1
N6681 M993 A2 B2 C2
N6682 M993 A0 B0 C0
N6683 
N6684 
N6685 
N6686 
N6687     M9711 M0 E1 X261 Y132 Z3.4 S11 C10 O0 T3000
N6688 
N6689 
N6690 
N6691 M993 A3 B3 C3
N6692 
N6693 M623
N6694 ; SKIPPABLE_END
N6695 
N6696 ; object ids of this layer15 end: 372
N6697 M625
N6698 ; CHANGE_LAYER
N6699 ; Z_HEIGHT: 3.2
N6700 ; LAYER_HEIGHT: 0.2
N6701 ;======== H2D 20250521========
N6702 ; layer num/total_layer_count: 16/75
N6703 ; update layer progress
N6704 M73 L16
N6705 M991 S0 P15 ;notify layer change
N6706 
N6707 
N6708 ; OBJECT_ID: 372
N6709 ; COOLING_NODE: 0
N6710 ; start printing object, unique label id: 372
N6711 M624 AQAAAAAAAAA=
N6712 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=3.100G1 Z3.100 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N6541 G1 X158.916 Y201.084 E1.03439
N6542 G1 X158.916 Y118.916 E2.64221
N6543 G1 X191.084 Y118.916 E1.03439
N6544 G1 X191.084 Y201.024 E2.64028
N6550 G1 X158.509 Y201.491 E1.06057
N6551 G1 X158.509 Y118.509 E2.66839
N6552 G1 X191.491 Y118.509 E1.06057
N6553 G1 X191.491 Y201.431 E2.66646
N6559 G1 X158.102 Y201.898 E1.08675
N6560 G1 X158.102 Y118.102 E2.69457
N6561 G1 X191.898 Y118.102 E1.08675
N6562 G1 X191.898 Y201.838 E2.69264
N6571 G1 X157.71 Y202.29 E1.03002
N6572 G1 X157.71 Y117.71 E2.51935
N6573 G1 X192.29 Y117.71 E1.03002
N6574 G1 X192.29 Y202.23 E2.51756
N6585 G1 X190.736 Y200.124 E.05236
N6586 G1 X188.452 Y200.736 E.076
N6587 G1 X187.175 Y200.736 E.04107
N6588 G1 X190.736 Y187.448 E.44235
N6589 G1 X190.736 Y185.82 E.05236
N6594 G1 X190.736 Y166.409 E.05236
N6595 G1 X159.264 Y174.841 E1.0477
N6596 G1 X159.264 Y175.806 E.03103
N6597 G1 X184.194 Y200.736 E1.13368
N6598 G1 X178.746 Y200.736 E.17517
N6599 G1 X190.736 Y155.991 E1.48957
N6600 G1 X190.736 Y154.363 E.05236
N6605 G1 X190.736 Y132.693 E.05236
N6606 G1 X159.264 Y141.126 E1.04769
N6607 G1 X159.264 Y141.264 E.00445
N6608 G1 X190.736 Y172.736 E1.43118
N6609 G1 X190.736 Y174.837 E.06759
N6610 G1 X159.264 Y183.27 E1.04769
N6611 G1 X159.264 Y187.32 E.13024
N6612 G1 X172.68 Y200.736 E.61007
N6613 G1 X170.318 Y200.736 E.07596
N6614 G1 X190.736 Y124.535 E2.53678
N6615 G1 X190.736 Y124.265 E.00868
N6616 G1 X159.264 Y132.697 E1.0477
N6617 G1 X159.264 Y129.751 E.09476
N6618 G1 X190.736 Y161.222 E1.43118
N6619 G1 X190.736 Y157.98 E.10424
N6620 G1 X159.264 Y166.412 E1.0477
N6621 G1 X159.264 Y164.292 E.06818
N6622 G1 X190.736 Y195.763 E1.43118
N6623 G1 X190.736 Y191.695 E.13083
N6624 G1 X159.264 Y200.128 E1.04769
N6625 G1 X159.264 Y198.834 E.04159
N6626 G1 X161.166 Y200.736 E.08647
N6627 G1 X161.889 Y200.736 E.02325
N6628 G1 X183.719 Y119.264 E2.71223
N6629 G1 X183.32 Y119.264 E.01282
N6630 G1 X190.736 Y126.68 E.33722
N6631 G1 X190.736 Y128.308 E.05236
N6636 G1 X177.94 Y119.264 E.05236
N6637 G1 X159.264 Y124.268 E.62172
N6638 G1 X159.264 Y119.264 E.16091
N6639 G1 X160.292 Y119.264 E.03305
N6640 G1 X190.736 Y149.708 E1.38443
N6641 G1 X190.736 Y149.551 E.00504
N6642 G1 X159.264 Y157.984 E1.0477
N6643 G1 X159.264 Y152.778 E.16738
N6644 G1 X190.736 Y184.249 E1.43118
N6645 G1 X190.736 Y183.266 E.03162
N6646 G1 X159.264 Y191.699 E1.0477
N6647 G1 X159.264 Y193.327 E.05236
N6652 G1 X159.264 Y179.073 E.05236
N6653 G1 X175.29 Y119.264 E1.99107
N6654 G1 X171.806 Y119.264 E.11203
N6655 G1 X190.736 Y138.194 E.86083
N6656 G1 X190.736 Y141.122 E.09417
N6657 G1 X159.264 Y149.555 E1.0477
N6658 G1 X159.264 Y147.616 E.06234
N6659 G1 X166.861 Y119.264 E.94385
N6660 G1 X165.233 Y119.264 E.05236
N6662 G1 X166.861 Y119.264 E-.61876
N6663 G1 X166.765 Y119.623 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN6713 G1 Z3.2
N6714 G1 E.8 F1800
N6715 ; FEATURE: Inner wall
N6716 ; LINE_WIDTH: 0.45
N6717 ; LAYER_HEIGHT: 0.2
N6718 G1 F4421.739
N6719 M204 S8000
N6720 G1 X158.916 Y201.084 E1.03439
N6721 G1 X158.916 Y118.916 E2.64221
N6722 G1 X191.084 Y118.916 E1.03439
N6723 G1 X191.084 Y201.024 E2.64028
N6724 ; COOLING_NODE: 0
N6725 M204 S10000
N6726 G1 X191.491 Y201.491 F60000
N6727 G1 F4421.739
N6728 M204 S8000
N6729 G1 X158.509 Y201.491 E1.06057
N6730 G1 X158.509 Y118.509 E2.66839
N6731 G1 X191.491 Y118.509 E1.06057
N6732 G1 X191.491 Y201.431 E2.66646
N6733 ; COOLING_NODE: 0
N6734 M204 S10000
N6735 G1 X191.898 Y201.898 F60000
N6736 G1 F4421.739
N6737 M204 S8000
N6738 G1 X158.102 Y201.898 E1.08675
N6739 G1 X158.102 Y118.102 E2.69457
N6740 G1 X191.898 Y118.102 E1.08675
N6741 G1 X191.898 Y201.838 E2.69264
N6742 ; COOLING_NODE: 0
N6743 M204 S10000
N6744 G1 X192.29 Y202.29 F60000
N6745 ; FEATURE: Outer wall
N6746 ; LINE_WIDTH: 0.42
N6747 G1 F4773.528
N6748 M204 S5000
N6749 G1 X157.71 Y202.29 E1.03002
N6750 G1 X157.71 Y117.71 E2.51935
N6751 G1 X192.29 Y117.71 E1.03002
N6752 G1 X192.29 Y202.23 E2.51756
N6753 G1 E-.8 F1800
N6754 M204 S10000
N6755 G1 X190.736 Y198.642 Z3.6 F60000
N6756 G1 Z3.2
N6757 G1 E.8 F1800
N6758 ; FEATURE: Sparse infill
N6759 ; LINE_WIDTH: 0.45
N6760 G1 F4421.739
N6761 M204 S8000
N6762 G1 X190.736 Y200.27 E.05236
N6763 G1 X188.999 Y200.736 E.05781
N6764 G1 X187.029 Y200.736 E.06335
N6765 G1 X190.736 Y186.902 E.46054
N6766 G1 X190.736 Y185.273 E.05236
N6767 M204 S10000
N6768 G1 X190.736 Y168.183 F60000
N6769 G1 F4421.739
N6770 M204 S8000
N6771 G1 X190.736 Y166.555 E.05236
N6772 G1 X159.264 Y174.988 E1.0477
N6773 G1 X159.264 Y175.606 E.01989
N6774 G1 X184.394 Y200.736 E1.14278
N6775 G1 X178.6 Y200.736 E.18631
N6776 G1 X190.736 Y155.445 E1.50776
N6777 G1 X190.736 Y153.817 E.05236
N6778 M204 S10000
N6779 G1 X190.736 Y124.411 F60000
N6780 G1 F4421.739
N6781 M204 S8000
N6782 G1 X159.264 Y132.844 E1.0477
N6783 G1 X159.264 Y129.551 E.1059
N6784 G1 X190.736 Y161.022 E1.43118
N6785 G1 X190.736 Y158.126 E.0931
N6786 G1 X159.264 Y166.559 E1.0477
N6787 G1 X159.264 Y164.092 E.07931
N6788 G1 X190.736 Y195.563 E1.43118
N6789 G1 X190.736 Y191.841 E.11969
N6790 M73 P45 R34
N6791 G1 X159.264 Y200.274 E1.0477
N6792 G1 X159.264 Y198.634 E.05273
N6793 G1 X161.366 Y200.736 E.09556
N6794 G1 X161.742 Y200.736 E.01211
N6795 G1 X183.573 Y119.264 E2.71223
N6796 G1 X183.52 Y119.264 E.00168
N6797 G1 X190.736 Y126.48 E.32812
N6798 G1 X190.736 Y132.84 E.20452
N6799 G1 X159.264 Y141.272 E1.0477
N6800 G1 X159.264 Y141.064 E.00669
N6801 G1 X190.736 Y172.536 E1.43118
N6802 G1 X190.736 Y174.984 E.07873
N6803 G1 X159.264 Y183.416 E1.0477
N6804 G1 X159.264 Y187.12 E.1191
N6805 G1 X172.88 Y200.736 E.61917
N6806 G1 X170.171 Y200.736 E.0871
N6807 G1 X190.736 Y123.988 E2.55497
N6808 G1 X190.736 Y122.36 E.05236
N6809 M204 S10000
N6810 G1 X180.115 Y119.264 F60000
N6811 G1 F4421.739
N6812 M204 S8000
N6813 G1 X178.486 Y119.264 E.05236
N6814 G1 X159.264 Y124.415 E.63991
N6815 G1 X159.264 Y122.787 E.05236
N6816 M204 S10000
N6817 G1 X159.264 Y180.155 F60000
N6818 G1 F4421.739
N6819 M204 S8000
N6820 G1 X159.264 Y178.527 E.05236
N6821 G1 X175.144 Y119.264 E1.97288
N6822 G1 X172.006 Y119.264 E.10089
N6823 G1 X190.736 Y137.994 E.85173
N6824 G1 X190.736 Y141.269 E.10531
N6825 G1 X159.264 Y149.701 E1.0477
N6826 G1 X159.264 Y147.07 E.08462
N6827 G1 X166.715 Y119.264 E.92566
N6828 G1 X160.492 Y119.264 E.20009
N6829 G1 X190.736 Y149.508 E1.37534
N6830 G1 X190.736 Y149.697 E.0061
N6831 G1 X159.264 Y158.13 E1.0477
N6832 G1 X159.264 Y152.578 E.17852
N6833 G1 X190.736 Y184.049 E1.43118
N6834 G1 X190.736 Y183.413 E.02048
N6835 G1 X159.264 Y191.845 E1.0477
N6836 G1 X159.264 Y193.474 E.05236
N6837 ; WIPE_START
N6838 G1 X159.264 Y191.845 E-.61876
N6839 G1 X159.623 Y191.749 E-.14124
N6840 ; WIPE_END
N6841 G1 E-.04 F1800
N6842 M204 S10000
N6843 G17
N6844 G3 Z3.6 I1.217 J0 P1  F60000
N6845 ; stop printing object, unique label id: 372
N6846 M625
N6847 ; object ids of layer 16 start: 372
N6848 M624 AQAAAAAAAAA=
N6849 ;======== H2D 20250527========
N6850 ; SKIPPABLE_START
N6851 ; SKIPTYPE: timelapse
N6852 M622.1 S1 ; for prev firware, default turned on
N6853 
N6854 M1002 judge_flag timelapse_record_flag
N6855 
N6856 M622 J1
N6857 M993 A2 B2 C2
N6858 M993 A0 B0 C0
N6859 
N6860 
N6861 
N6862 
N6863     M9711 M0 E1 X261 Y132 Z3.6 S11 C10 O0 T3000
N6864 
N6865 
N6866 
N6867 M993 A3 B3 C3
N6868 
N6869 M623
N6870 ; SKIPPABLE_END
N6871 
N6872 ; object ids of this layer16 end: 372
N6873 M625
N6874 ; CHANGE_LAYER
N6875 ; Z_HEIGHT: 3.4
N6876 ; LAYER_HEIGHT: 0.2
N6877 ;======== H2D 20250521========
N6878 ; layer num/total_layer_count: 17/75
N6879 ; update layer progress
N6880 M73 L17
N6881 M991 S0 P16 ;notify layer change
N6882 
N6883 
N6884 ; OBJECT_ID: 372
N6885 ; COOLING_NODE: 0
N6886 ; start printing object, unique label id: 372
N6887 M624 AQAAAAAAAAA=
N6888 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=3.300G1 Z3.300 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N6720 G1 X158.916 Y201.084 E1.03439
N6721 G1 X158.916 Y118.916 E2.64221
N6722 G1 X191.084 Y118.916 E1.03439
N6723 G1 X191.084 Y201.024 E2.64028
N6729 G1 X158.509 Y201.491 E1.06057
N6730 G1 X158.509 Y118.509 E2.66839
N6731 G1 X191.491 Y118.509 E1.06057
N6732 G1 X191.491 Y201.431 E2.66646
N6738 G1 X158.102 Y201.898 E1.08675
N6739 G1 X158.102 Y118.102 E2.69457
N6740 G1 X191.898 Y118.102 E1.08675
N6741 G1 X191.898 Y201.838 E2.69264
N6749 G1 X157.71 Y202.29 E1.03002
N6750 G1 X157.71 Y117.71 E2.51935
N6751 G1 X192.29 Y117.71 E1.03002
N6752 G1 X192.29 Y202.23 E2.51756
N6762 G1 X190.736 Y200.27 E.05236
N6763 G1 X188.999 Y200.736 E.05781
N6764 G1 X187.029 Y200.736 E.06335
N6765 G1 X190.736 Y186.902 E.46054
N6766 G1 X190.736 Y185.273 E.05236
N6771 G1 X190.736 Y166.555 E.05236
N6772 G1 X159.264 Y174.988 E1.0477
N6773 G1 X159.264 Y175.606 E.01989
N6774 G1 X184.394 Y200.736 E1.14278
N6775 G1 X178.6 Y200.736 E.18631
N6776 G1 X190.736 Y155.445 E1.50776
N6777 G1 X190.736 Y153.817 E.05236
N6782 G1 X159.264 Y132.844 E1.0477
N6783 G1 X159.264 Y129.551 E.1059
N6784 G1 X190.736 Y161.022 E1.43118
N6785 G1 X190.736 Y158.126 E.0931
N6786 G1 X159.264 Y166.559 E1.0477
N6787 G1 X159.264 Y164.092 E.07931
N6788 G1 X190.736 Y195.563 E1.43118
N6789 G1 X190.736 Y191.841 E.11969
N6791 G1 X159.264 Y200.274 E1.0477
N6792 G1 X159.264 Y198.634 E.05273
N6793 G1 X161.366 Y200.736 E.09556
N6794 G1 X161.742 Y200.736 E.01211
N6795 G1 X183.573 Y119.264 E2.71223
N6796 G1 X183.52 Y119.264 E.00168
N6797 G1 X190.736 Y126.48 E.32812
N6798 G1 X190.736 Y132.84 E.20452
N6799 G1 X159.264 Y141.272 E1.0477
N6800 G1 X159.264 Y141.064 E.00669
N6801 G1 X190.736 Y172.536 E1.43118
N6802 G1 X190.736 Y174.984 E.07873
N6803 G1 X159.264 Y183.416 E1.0477
N6804 G1 X159.264 Y187.12 E.1191
N6805 G1 X172.88 Y200.736 E.61917
N6806 G1 X170.171 Y200.736 E.0871
N6807 G1 X190.736 Y123.988 E2.55497
N6808 G1 X190.736 Y122.36 E.05236
N6813 G1 X178.486 Y119.264 E.05236
N6814 G1 X159.264 Y124.415 E.63991
N6815 G1 X159.264 Y122.787 E.05236
N6820 G1 X159.264 Y178.527 E.05236
N6821 G1 X175.144 Y119.264 E1.97288
N6822 G1 X172.006 Y119.264 E.10089
N6823 G1 X190.736 Y137.994 E.85173
N6824 G1 X190.736 Y141.269 E.10531
N6825 G1 X159.264 Y149.701 E1.0477
N6826 G1 X159.264 Y147.07 E.08462
N6827 G1 X166.715 Y119.264 E.92566
N6828 G1 X160.492 Y119.264 E.20009
N6829 G1 X190.736 Y149.508 E1.37534
N6830 G1 X190.736 Y149.697 E.0061
N6831 G1 X159.264 Y158.13 E1.0477
N6832 G1 X159.264 Y152.578 E.17852
N6833 G1 X190.736 Y184.049 E1.43118
N6834 G1 X190.736 Y183.413 E.02048
N6835 G1 X159.264 Y191.845 E1.0477
N6836 G1 X159.264 Y193.474 E.05236
N6838 G1 X159.264 Y191.845 E-.61876
N6839 G1 X159.623 Y191.749 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN6889 G1 Z3.4
N6890 G1 E.8 F1800
N6891 ; FEATURE: Inner wall
N6892 ; LINE_WIDTH: 0.45
N6893 ; LAYER_HEIGHT: 0.2
N6894 G1 F4421.739
N6895 M204 S8000
N6896 G1 X158.916 Y201.084 E1.03439
N6897 G1 X158.916 Y118.916 E2.64221
N6898 G1 X191.084 Y118.916 E1.03439
N6899 G1 X191.084 Y201.024 E2.64028
N6900 ; COOLING_NODE: 0
N6901 M204 S10000
N6902 G1 X191.491 Y201.491 F60000
N6903 G1 F4421.739
N6904 M204 S8000
N6905 G1 X158.509 Y201.491 E1.06057
N6906 G1 X158.509 Y118.509 E2.66839
N6907 G1 X191.491 Y118.509 E1.06057
N6908 G1 X191.491 Y201.431 E2.66646
N6909 ; COOLING_NODE: 0
N6910 M204 S10000
N6911 G1 X191.898 Y201.898 F60000
N6912 G1 F4421.739
N6913 M204 S8000
N6914 G1 X158.102 Y201.898 E1.08675
N6915 G1 X158.102 Y118.102 E2.69457
N6916 G1 X191.898 Y118.102 E1.08675
N6917 G1 X191.898 Y201.838 E2.69264
N6918 ; COOLING_NODE: 0
N6919 M204 S10000
N6920 G1 X192.29 Y202.29 F60000
N6921 ; FEATURE: Outer wall
N6922 ; LINE_WIDTH: 0.42
N6923 G1 F4773.528
N6924 M204 S5000
N6925 G1 X157.71 Y202.29 E1.03002
N6926 G1 X157.71 Y117.71 E2.51935
N6927 G1 X192.29 Y117.71 E1.03002
N6928 G1 X192.29 Y202.23 E2.51756
N6929 G1 E-.8 F1800
N6930 M204 S10000
N6931 G1 X190.736 Y198.788 Z3.8 F60000
N6932 G1 Z3.4
N6933 G1 E.8 F1800
N6934 ; FEATURE: Sparse infill
N6935 ; LINE_WIDTH: 0.45
N6936 G1 F4421.739
N6937 M204 S8000
N6938 G1 X190.736 Y200.417 E.05236
N6939 G1 X189.545 Y200.736 E.03962
N6940 G1 X187.917 Y200.736 E.05236
N6941 M204 S10000
N6942 G1 X180.082 Y200.736 F60000
N6943 G1 F4421.739
N6944 M204 S8000
N6945 G1 X178.454 Y200.736 E.05236
N6946 G1 X190.736 Y154.899 E1.52595
N6947 G1 X190.736 Y153.27 E.05236
N6948 M204 S10000
N6949 G1 X190.736 Y165.073 F60000
N6950 G1 F4421.739
N6951 M204 S8000
N6952 G1 X190.736 Y166.701 E.05236
N6953 G1 X159.264 Y175.134 E1.0477
N6954 G1 X159.264 Y175.406 E.00875
N6955 G1 X184.594 Y200.736 E1.15187
N6956 G1 X186.882 Y200.736 E.0736
N6957 G1 X190.736 Y186.355 E.47873
N6958 G1 X190.736 Y184.727 E.05236
N6959 M204 S10000
N6960 G1 X159.264 Y193.62 F60000
N6961 G1 F4421.739
N6962 M204 S8000
N6963 G1 X159.264 Y191.992 E.05236
N6964 G1 X190.736 Y183.559 E1.0477
N6965 G1 X190.736 Y183.849 E.00934
N6966 G1 X159.264 Y152.378 E1.43118
N6967 G1 X159.264 Y149.848 E.08138
N6968 G1 X190.736 Y141.415 E1.0477
N6969 G1 X190.736 Y137.794 E.11645
N6970 G1 X172.206 Y119.264 E.84264
N6971 G1 X174.997 Y119.264 E.08975
N6972 M73 P45 R33
N6973 G1 X159.264 Y177.98 E1.95469
N6974 G1 X159.264 Y179.608 E.05236
N6975 M204 S10000
N6976 G1 X159.264 Y156.648 F60000
N6977 G1 F4421.739
N6978 M204 S8000
N6979 G1 X159.264 Y158.276 E.05236
N6980 G1 X190.736 Y149.844 E1.0477
N6981 G1 X190.736 Y149.308 E.01724
N6982 G1 X160.692 Y119.264 E1.36624
N6983 G1 X166.569 Y119.264 E.18896
N6984 G1 X159.264 Y146.523 E.90747
N6985 G1 X159.264 Y148.152 E.05236
N6986 M204 S10000
N6987 G1 X159.264 Y122.933 F60000
N6988 G1 F4421.739
N6989 M204 S8000
N6990 G1 X159.264 Y124.561 E.05236
N6991 G1 X179.033 Y119.264 E.6581
N6992 G1 X180.661 Y119.264 E.05236
N6993 M204 S10000
N6994 G1 X190.736 Y121.814 F60000
N6995 G1 F4421.739
N6996 M204 S8000
N6997 G1 X190.736 Y123.442 E.05236
N6998 G1 X170.025 Y200.736 E2.57316
N6999 G1 X173.08 Y200.736 E.09824
N7000 G1 X159.264 Y186.92 E.62826
N7001 G1 X159.264 Y183.563 E.10796
N7002 G1 X190.736 Y175.13 E1.0477
N7003 G1 X190.736 Y172.336 E.08987
N7004 G1 X159.264 Y140.864 E1.43118
N7005 G1 X159.264 Y141.419 E.01783
N7006 G1 X190.736 Y132.986 E1.0477
N7007 G1 X190.736 Y126.28 E.21566
N7008 G1 X183.72 Y119.264 E.31903
N7009 G1 X183.426 Y119.264 E.00946
N7010 G1 X161.596 Y200.736 E2.71223
N7011 G1 X161.566 Y200.736 E.00097
N7012 G1 X159.264 Y198.434 E.10466
N7013 G1 X159.264 Y200.42 E.06387
N7014 G1 X190.736 Y191.988 E1.0477
N7015 G1 X190.736 Y195.363 E.10855
N7016 G1 X159.264 Y163.892 E1.43118
N7017 G1 X159.264 Y166.705 E.09045
N7018 G1 X190.736 Y158.273 E1.0477
N7019 G1 X190.736 Y160.822 E.08196
N7020 G1 X159.264 Y129.351 E1.43118
N7021 G1 X159.264 Y132.99 E.11704
N7022 G1 X190.736 Y124.557 E1.0477
N7023 ; WIPE_START
N7024 G1 X188.804 Y125.075 E-.76
N7025 ; WIPE_END
N7026 M73 P46 R33
N7027 G1 E-.04 F1800
N7028 M204 S10000
N7029 G17
N7030 G3 Z3.8 I1.217 J0 P1  F60000
N7031 ; stop printing object, unique label id: 372
N7032 M625
N7033 ; object ids of layer 17 start: 372
N7034 M624 AQAAAAAAAAA=
N7035 ;======== H2D 20250527========
N7036 ; SKIPPABLE_START
N7037 ; SKIPTYPE: timelapse
N7038 M622.1 S1 ; for prev firware, default turned on
N7039 
N7040 M1002 judge_flag timelapse_record_flag
N7041 
N7042 M622 J1
N7043 M993 A2 B2 C2
N7044 M993 A0 B0 C0
N7045 
N7046 
N7047 
N7048 
N7049     M9711 M0 E1 X261 Y132 Z3.8 S11 C10 O0 T3000
N7050 
N7051 
N7052 
N7053 M993 A3 B3 C3
N7054 
N7055 M623
N7056 ; SKIPPABLE_END
N7057 
N7058 ; object ids of this layer17 end: 372
N7059 M625
N7060 ; CHANGE_LAYER
N7061 ; Z_HEIGHT: 3.6
N7062 ; LAYER_HEIGHT: 0.2
N7063 ;======== H2D 20250521========
N7064 ; layer num/total_layer_count: 18/75
N7065 ; update layer progress
N7066 M73 L18
N7067 M991 S0 P17 ;notify layer change
N7068 
N7069 
N7070 ; OBJECT_ID: 372
N7071 ; COOLING_NODE: 0
N7072 ; start printing object, unique label id: 372
N7073 M624 AQAAAAAAAAA=
N7074 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=3.500G1 Z3.500 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N6896 G1 X158.916 Y201.084 E1.03439
N6897 G1 X158.916 Y118.916 E2.64221
N6898 G1 X191.084 Y118.916 E1.03439
N6899 G1 X191.084 Y201.024 E2.64028
N6905 G1 X158.509 Y201.491 E1.06057
N6906 G1 X158.509 Y118.509 E2.66839
N6907 G1 X191.491 Y118.509 E1.06057
N6908 G1 X191.491 Y201.431 E2.66646
N6914 G1 X158.102 Y201.898 E1.08675
N6915 G1 X158.102 Y118.102 E2.69457
N6916 G1 X191.898 Y118.102 E1.08675
N6917 G1 X191.898 Y201.838 E2.69264
N6925 G1 X157.71 Y202.29 E1.03002
N6926 G1 X157.71 Y117.71 E2.51935
N6927 G1 X192.29 Y117.71 E1.03002
N6928 G1 X192.29 Y202.23 E2.51756
N6938 G1 X190.736 Y200.417 E.05236
N6939 G1 X189.545 Y200.736 E.03962
N6940 G1 X187.917 Y200.736 E.05236
N6945 G1 X178.454 Y200.736 E.05236
N6946 G1 X190.736 Y154.899 E1.52595
N6947 G1 X190.736 Y153.27 E.05236
N6952 G1 X190.736 Y166.701 E.05236
N6953 G1 X159.264 Y175.134 E1.0477
N6954 G1 X159.264 Y175.406 E.00875
N6955 G1 X184.594 Y200.736 E1.15187
N6956 G1 X186.882 Y200.736 E.0736
N6957 G1 X190.736 Y186.355 E.47873
N6958 G1 X190.736 Y184.727 E.05236
N6963 G1 X159.264 Y191.992 E.05236
N6964 G1 X190.736 Y183.559 E1.0477
N6965 G1 X190.736 Y183.849 E.00934
N6966 G1 X159.264 Y152.378 E1.43118
N6967 G1 X159.264 Y149.848 E.08138
N6968 G1 X190.736 Y141.415 E1.0477
N6969 G1 X190.736 Y137.794 E.11645
N6970 G1 X172.206 Y119.264 E.84264
N6971 G1 X174.997 Y119.264 E.08975
N6973 G1 X159.264 Y177.98 E1.95469
N6974 G1 X159.264 Y179.608 E.05236
N6979 G1 X159.264 Y158.276 E.05236
N6980 G1 X190.736 Y149.844 E1.0477
N6981 G1 X190.736 Y149.308 E.01724
N6982 G1 X160.692 Y119.264 E1.36624
N6983 G1 X166.569 Y119.264 E.18896
N6984 G1 X159.264 Y146.523 E.90747
N6985 G1 X159.264 Y148.152 E.05236
N6990 G1 X159.264 Y124.561 E.05236
N6991 G1 X179.033 Y119.264 E.6581
N6992 G1 X180.661 Y119.264 E.05236
N6997 G1 X190.736 Y123.442 E.05236
N6998 G1 X170.025 Y200.736 E2.57316
N6999 G1 X173.08 Y200.736 E.09824
N7000 G1 X159.264 Y186.92 E.62826
N7001 G1 X159.264 Y183.563 E.10796
N7002 G1 X190.736 Y175.13 E1.0477
N7003 G1 X190.736 Y172.336 E.08987
N7004 G1 X159.264 Y140.864 E1.43118
N7005 G1 X159.264 Y141.419 E.01783
N7006 G1 X190.736 Y132.986 E1.0477
N7007 G1 X190.736 Y126.28 E.21566
N7008 G1 X183.72 Y119.264 E.31903
N7009 G1 X183.426 Y119.264 E.00946
N7010 G1 X161.596 Y200.736 E2.71223
N7011 G1 X161.566 Y200.736 E.00097
N7012 G1 X159.264 Y198.434 E.10466
N7013 G1 X159.264 Y200.42 E.06387
N7014 G1 X190.736 Y191.988 E1.0477
N7015 G1 X190.736 Y195.363 E.10855
N7016 G1 X159.264 Y163.892 E1.43118
N7017 G1 X159.264 Y166.705 E.09045
N7018 G1 X190.736 Y158.273 E1.0477
N7019 G1 X190.736 Y160.822 E.08196
N7020 G1 X159.264 Y129.351 E1.43118
N7021 G1 X159.264 Y132.99 E.11704
N7022 G1 X190.736 Y124.557 E1.0477
N7024 G1 X188.804 Y125.075 E-.76
T0 ;TOOL_CHANGE:0 ; Revert to base toolN7075 G1 Z3.6
N7076 G1 E.8 F1800
N7077 ; FEATURE: Inner wall
N7078 ; LINE_WIDTH: 0.45
N7079 ; LAYER_HEIGHT: 0.2
N7080 G1 F4421.739
N7081 M204 S8000
N7082 G1 X158.916 Y201.084 E1.03439
N7083 G1 X158.916 Y118.916 E2.64221
N7084 G1 X191.084 Y118.916 E1.03439
N7085 G1 X191.084 Y201.024 E2.64028
N7086 ; COOLING_NODE: 0
N7087 M204 S10000
N7088 G1 X191.491 Y201.491 F60000
N7089 G1 F4421.739
N7090 M204 S8000
N7091 G1 X158.509 Y201.491 E1.06057
N7092 G1 X158.509 Y118.509 E2.66839
N7093 G1 X191.491 Y118.509 E1.06057
N7094 G1 X191.491 Y201.431 E2.66646
N7095 ; COOLING_NODE: 0
N7096 M204 S10000
N7097 G1 X191.898 Y201.898 F60000
N7098 G1 F4421.739
N7099 M204 S8000
N7100 G1 X158.102 Y201.898 E1.08675
N7101 G1 X158.102 Y118.102 E2.69457
N7102 G1 X191.898 Y118.102 E1.08675
N7103 G1 X191.898 Y201.838 E2.69264
N7104 ; COOLING_NODE: 0
N7105 M204 S10000
N7106 G1 X192.29 Y202.29 F60000
N7107 ; FEATURE: Outer wall
N7108 ; LINE_WIDTH: 0.42
N7109 G1 F4773.528
N7110 M204 S5000
N7111 G1 X157.71 Y202.29 E1.03002
N7112 G1 X157.71 Y117.71 E2.51935
N7113 G1 X192.29 Y117.71 E1.03002
N7114 G1 X192.29 Y202.23 E2.51756
N7115 G1 E-.8 F1800
N7116 M204 S10000
N7117 G1 X190.736 Y198.935 Z4 F60000
N7118 G1 Z3.6
N7119 G1 E.8 F1800
N7120 ; FEATURE: Sparse infill
N7121 ; LINE_WIDTH: 0.45
N7122 G1 F4421.739
N7123 M204 S8000
N7124 G1 X190.736 Y200.563 E.05236
N7125 G1 X190.092 Y200.736 E.02143
N7126 G1 X188.463 Y200.736 E.05236
N7127 M204 S10000
N7128 G1 X179.935 Y200.736 F60000
N7129 G1 F4421.739
N7130 M204 S8000
N7131 G1 X178.307 Y200.736 E.05236
N7132 G1 X190.736 Y154.352 E1.54414
N7133 G1 X190.736 Y152.724 E.05236
N7134 M204 S10000
N7135 G1 X190.736 Y165.22 F60000
N7136 G1 F4421.739
N7137 M204 S8000
N7138 G1 X190.736 Y166.848 E.05236
N7139 G1 X159.264 Y175.28 E1.0477
N7140 G1 X159.264 Y175.206 E.00239
N7141 G1 X184.794 Y200.736 E1.16097
N7142 G1 X186.736 Y200.736 E.06246
N7143 G1 X190.736 Y185.809 E.49692
N7144 G1 X190.736 Y184.181 E.05236
N7145 M204 S10000
N7146 G1 X159.264 Y193.766 F60000
N7147 G1 F4421.739
N7148 M204 S8000
N7149 G1 X159.264 Y192.138 E.05236
N7150 G1 X190.736 Y183.705 E1.0477
N7151 G1 X190.736 Y183.649 E.0018
N7152 G1 X159.264 Y152.178 E1.43118
N7153 G1 X159.264 Y149.994 E.07024
N7154 G1 X190.736 Y141.561 E1.04769
N7155 G1 X190.736 Y137.594 E.12759
N7156 G1 X172.406 Y119.264 E.83354
N7157 G1 X174.851 Y119.264 E.07861
N7158 G1 X159.264 Y177.434 E1.9365
N7159 G1 X159.264 Y179.062 E.05236
N7160 M204 S10000
N7161 G1 X159.264 Y156.795 F60000
N7162 G1 F4421.739
N7163 M204 S8000
N7164 G1 X159.264 Y158.423 E.05236
N7165 G1 X190.736 Y149.99 E1.0477
N7166 G1 X190.736 Y149.108 E.02838
N7167 G1 X160.892 Y119.264 E1.35715
N7168 G1 X166.422 Y119.264 E.17782
N7169 G1 X159.264 Y145.977 E.88928
N7170 G1 X159.264 Y147.605 E.05236
N7171 M204 S10000
N7172 G1 X159.264 Y134.765 F60000
N7173 G1 F4421.739
N7174 M204 S8000
N7175 G1 X159.264 Y133.137 E.05236
N7176 G1 X190.736 Y124.704 E1.0477
N7177 G1 X190.736 Y126.08 E.04424
N7178 G1 X183.92 Y119.264 E.30993
N7179 G1 X183.28 Y119.264 E.0206
N7180 G1 X161.45 Y200.736 E2.71223
N7181 G1 X161.766 Y200.736 E.01017
N7182 G1 X159.264 Y198.234 E.11375
N7183 G1 X159.264 Y200.567 E.07501
N7184 G1 X190.736 Y192.134 E1.0477
N7185 G1 X190.736 Y195.163 E.09741
N7186 G1 X159.264 Y163.692 E1.43118
N7187 G1 X159.264 Y166.852 E.10159
N7188 G1 X190.736 Y158.419 E1.04769
N7189 G1 X190.736 Y160.622 E.07083
N7190 G1 X159.264 Y129.151 E1.43118
N7191 G1 X159.264 Y124.708 E.14286
N7192 G1 X179.579 Y119.264 E.67629
N7193 G1 X181.207 Y119.264 E.05236
N7194 M204 S10000
N7195 G1 X190.736 Y121.267 F60000
N7196 G1 F4421.739
N7197 M204 S8000
N7198 G1 X190.736 Y122.895 E.05236
N7199 G1 X169.878 Y200.736 E2.59135
N7200 G1 X173.28 Y200.736 E.10938
N7201 G1 X159.264 Y186.72 E.63736
N7202 G1 X159.264 Y183.709 E.09682
N7203 G1 X190.736 Y175.277 E1.0477
N7204 G1 X190.736 Y172.136 E.10101
N7205 G1 X159.264 Y140.664 E1.43118
N7206 G1 X159.264 Y141.565 E.02897
N7207 G1 X190.736 Y133.133 E1.0477
N7208 G1 X190.736 Y131.504 E.05236
N7209 ; WIPE_START
N7210 G1 X190.736 Y133.133 E-.61876
N7211 G1 X190.377 Y133.229 E-.14124
N7212 ; WIPE_END
N7213 G1 E-.04 F1800
N7214 M204 S10000
N7215 G17
N7216 G3 Z4 I1.217 J0 P1  F60000
N7217 ; stop printing object, unique label id: 372
N7218 M625
N7219 ; object ids of layer 18 start: 372
N7220 M624 AQAAAAAAAAA=
N7221 ;======== H2D 20250527========
N7222 ; SKIPPABLE_START
N7223 ; SKIPTYPE: timelapse
N7224 M622.1 S1 ; for prev firware, default turned on
N7225 
N7226 M1002 judge_flag timelapse_record_flag
N7227 
N7228 M622 J1
N7229 M993 A2 B2 C2
N7230 M993 A0 B0 C0
N7231 
N7232 
N7233 
N7234 
N7235     M9711 M0 E1 X261 Y132 Z4 S11 C10 O0 T3000
N7236 
N7237 
N7238 
N7239 M993 A3 B3 C3
N7240 
N7241 M623
N7242 ; SKIPPABLE_END
N7243 
N7244 ; object ids of this layer18 end: 372
N7245 M625
N7246 ; CHANGE_LAYER
N7247 ; Z_HEIGHT: 3.8
N7248 ; LAYER_HEIGHT: 0.2
N7249 ;======== H2D 20250521========
N7250 ; layer num/total_layer_count: 19/75
N7251 ; update layer progress
N7252 M73 L19
N7253 M991 S0 P18 ;notify layer change
N7254 
N7255 
N7256 ; OBJECT_ID: 372
N7257 ; COOLING_NODE: 0
N7258 ; start printing object, unique label id: 372
N7259 M624 AQAAAAAAAAA=
N7260 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=3.700G1 Z3.700 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N7082 G1 X158.916 Y201.084 E1.03439
N7083 G1 X158.916 Y118.916 E2.64221
N7084 G1 X191.084 Y118.916 E1.03439
N7085 G1 X191.084 Y201.024 E2.64028
N7091 G1 X158.509 Y201.491 E1.06057
N7092 G1 X158.509 Y118.509 E2.66839
N7093 G1 X191.491 Y118.509 E1.06057
N7094 G1 X191.491 Y201.431 E2.66646
N7100 G1 X158.102 Y201.898 E1.08675
N7101 G1 X158.102 Y118.102 E2.69457
N7102 G1 X191.898 Y118.102 E1.08675
N7103 G1 X191.898 Y201.838 E2.69264
N7111 G1 X157.71 Y202.29 E1.03002
N7112 G1 X157.71 Y117.71 E2.51935
N7113 G1 X192.29 Y117.71 E1.03002
N7114 G1 X192.29 Y202.23 E2.51756
N7124 G1 X190.736 Y200.563 E.05236
N7125 G1 X190.092 Y200.736 E.02143
N7126 G1 X188.463 Y200.736 E.05236
N7131 G1 X178.307 Y200.736 E.05236
N7132 G1 X190.736 Y154.352 E1.54414
N7133 G1 X190.736 Y152.724 E.05236
N7138 G1 X190.736 Y166.848 E.05236
N7139 G1 X159.264 Y175.28 E1.0477
N7140 G1 X159.264 Y175.206 E.00239
N7141 G1 X184.794 Y200.736 E1.16097
N7142 G1 X186.736 Y200.736 E.06246
N7143 G1 X190.736 Y185.809 E.49692
N7144 G1 X190.736 Y184.181 E.05236
N7149 G1 X159.264 Y192.138 E.05236
N7150 G1 X190.736 Y183.705 E1.0477
N7151 G1 X190.736 Y183.649 E.0018
N7152 G1 X159.264 Y152.178 E1.43118
N7153 G1 X159.264 Y149.994 E.07024
N7154 G1 X190.736 Y141.561 E1.04769
N7155 G1 X190.736 Y137.594 E.12759
N7156 G1 X172.406 Y119.264 E.83354
N7157 G1 X174.851 Y119.264 E.07861
N7158 G1 X159.264 Y177.434 E1.9365
N7159 G1 X159.264 Y179.062 E.05236
N7164 G1 X159.264 Y158.423 E.05236
N7165 G1 X190.736 Y149.99 E1.0477
N7166 G1 X190.736 Y149.108 E.02838
N7167 G1 X160.892 Y119.264 E1.35715
N7168 G1 X166.422 Y119.264 E.17782
N7169 G1 X159.264 Y145.977 E.88928
N7170 G1 X159.264 Y147.605 E.05236
N7175 G1 X159.264 Y133.137 E.05236
N7176 G1 X190.736 Y124.704 E1.0477
N7177 G1 X190.736 Y126.08 E.04424
N7178 G1 X183.92 Y119.264 E.30993
N7179 G1 X183.28 Y119.264 E.0206
N7180 G1 X161.45 Y200.736 E2.71223
N7181 G1 X161.766 Y200.736 E.01017
N7182 G1 X159.264 Y198.234 E.11375
N7183 G1 X159.264 Y200.567 E.07501
N7184 G1 X190.736 Y192.134 E1.0477
N7185 G1 X190.736 Y195.163 E.09741
N7186 G1 X159.264 Y163.692 E1.43118
N7187 G1 X159.264 Y166.852 E.10159
N7188 G1 X190.736 Y158.419 E1.04769
N7189 G1 X190.736 Y160.622 E.07083
N7190 G1 X159.264 Y129.151 E1.43118
N7191 G1 X159.264 Y124.708 E.14286
N7192 G1 X179.579 Y119.264 E.67629
N7193 G1 X181.207 Y119.264 E.05236
N7198 G1 X190.736 Y122.895 E.05236
N7199 G1 X169.878 Y200.736 E2.59135
N7200 G1 X173.28 Y200.736 E.10938
N7201 G1 X159.264 Y186.72 E.63736
N7202 G1 X159.264 Y183.709 E.09682
N7203 G1 X190.736 Y175.277 E1.0477
N7204 G1 X190.736 Y172.136 E.10101
N7205 G1 X159.264 Y140.664 E1.43118
N7206 G1 X159.264 Y141.565 E.02897
N7207 G1 X190.736 Y133.133 E1.0477
N7208 G1 X190.736 Y131.504 E.05236
N7210 G1 X190.736 Y133.133 E-.61876
N7211 G1 X190.377 Y133.229 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN7261 G1 Z3.8
N7262 G1 E.8 F1800
N7263 ; FEATURE: Inner wall
N7264 ; LINE_WIDTH: 0.45
N7265 ; LAYER_HEIGHT: 0.2
N7266 G1 F4421.739
N7267 M204 S8000
N7268 G1 X158.916 Y201.084 E1.03439
N7269 G1 X158.916 Y118.916 E2.64221
N7270 G1 X191.084 Y118.916 E1.03439
N7271 G1 X191.084 Y201.024 E2.64028
N7272 ; COOLING_NODE: 0
N7273 M204 S10000
N7274 G1 X191.491 Y201.491 F60000
N7275 G1 F4421.739
N7276 M204 S8000
N7277 G1 X158.509 Y201.491 E1.06057
N7278 G1 X158.509 Y118.509 E2.66839
N7279 G1 X191.491 Y118.509 E1.06057
N7280 G1 X191.491 Y201.431 E2.66646
N7281 ; COOLING_NODE: 0
N7282 M204 S10000
N7283 G1 X191.898 Y201.898 F60000
N7284 G1 F4421.739
N7285 M204 S8000
N7286 G1 X158.102 Y201.898 E1.08675
N7287 G1 X158.102 Y118.102 E2.69457
N7288 G1 X191.898 Y118.102 E1.08675
N7289 G1 X191.898 Y201.838 E2.69264
N7290 ; COOLING_NODE: 0
N7291 M204 S10000
N7292 G1 X192.29 Y202.29 F60000
N7293 ; FEATURE: Outer wall
N7294 ; LINE_WIDTH: 0.42
N7295 G1 F4773.528
N7296 M204 S5000
N7297 G1 X157.71 Y202.29 E1.03002
N7298 M73 P47 R33
N7299 G1 X157.71 Y117.71 E2.51935
N7300 G1 X192.29 Y117.71 E1.03002
N7301 G1 X192.29 Y202.23 E2.51756
N7302 G1 E-.8 F1800
N7303 M204 S10000
N7304 G1 X184.712 Y201.324 Z4.2 F60000
N7305 G1 X179.789 Y200.736 Z4.2
N7306 G1 Z3.8
N7307 G1 E.8 F1800
N7308 ; FEATURE: Sparse infill
N7309 ; LINE_WIDTH: 0.45
N7310 G1 F4421.739
N7311 M204 S8000
N7312 G1 X178.161 Y200.736 E.05236
N7313 G1 X190.736 Y153.806 E1.56233
N7314 G1 X190.736 Y152.177 E.05236
N7315 M204 S10000
N7316 G1 X190.736 Y143.336 F60000
N7317 G1 F4421.739
N7318 M204 S8000
N7319 G1 X190.736 Y141.708 E.05236
N7320 G1 X159.264 Y150.141 E1.0477
N7321 G1 X159.264 Y151.978 E.0591
N7322 G1 X190.736 Y183.449 E1.43118
N7323 G1 X190.736 Y183.852 E.01294
N7324 G1 X159.264 Y192.284 E1.0477
N7325 G1 X159.264 Y190.656 E.05236
N7326 M204 S10000
N7327 G1 X159.264 Y178.516 F60000
N7328 G1 F4421.739
N7329 M204 S8000
N7330 G1 X159.264 Y176.887 E.05236
N7331 G1 X174.704 Y119.264 E1.91831
N7332 G1 X172.606 Y119.264 E.06747
N7333 G1 X190.736 Y137.394 E.82444
N7334 G1 X190.736 Y133.279 E.13231
N7335 G1 X159.264 Y141.712 E1.0477
N7336 G1 X159.264 Y140.464 E.04011
N7337 G1 X190.736 Y171.936 E1.43118
N7338 G1 X190.736 Y175.423 E.11215
N7339 G1 X159.264 Y183.856 E1.0477
N7340 G1 X159.264 Y186.52 E.08568
N7341 G1 X173.48 Y200.736 E.64645
N7342 G1 X169.732 Y200.736 E.12052
N7343 G1 X190.736 Y122.349 E2.60954
N7344 G1 X190.736 Y120.721 E.05236
N7345 M204 S10000
N7346 G1 X181.754 Y119.264 F60000
N7347 G1 F4421.739
N7348 M204 S8000
N7349 G1 X180.125 Y119.264 E.05236
N7350 G1 X159.264 Y124.854 E.69448
N7351 G1 X159.264 Y128.951 E.13172
N7352 G1 X190.736 Y160.422 E1.43118
N7353 G1 X190.736 Y158.565 E.05969
N7354 G1 X159.264 Y166.998 E1.0477
N7355 G1 X159.264 Y163.492 E.11273
N7356 G1 X190.736 Y194.963 E1.43118
N7357 G1 X190.736 Y192.281 E.08627
N7358 M73 P47 R32
N7359 G1 X159.264 Y200.713 E1.0477
N7360 G1 X159.264 Y198.034 E.08615
N7361 G1 X161.966 Y200.736 E.12285
N7362 G1 X161.303 Y200.736 E.02131
N7363 G1 X183.133 Y119.264 E2.71223
N7364 G1 X184.12 Y119.264 E.03174
N7365 G1 X190.736 Y125.88 E.30084
N7366 G1 X190.736 Y124.85 E.0331
N7367 G1 X159.264 Y133.283 E1.04769
N7368 G1 X159.264 Y134.911 E.05236
N7369 M204 S10000
N7370 G1 X159.264 Y147.059 F60000
N7371 G1 F4421.739
N7372 M204 S8000
N7373 G1 X159.264 Y145.431 E.05236
N7374 G1 X166.276 Y119.264 E.87109
N7375 G1 X161.092 Y119.264 E.16668
N7376 G1 X190.736 Y148.908 E1.34805
N7377 G1 X190.736 Y150.137 E.03952
N7378 G1 X159.264 Y158.569 E1.0477
N7379 G1 X159.264 Y156.941 E.05236
N7380 M204 S10000
N7381 G1 X190.736 Y165.366 F60000
N7382 G1 F4421.739
N7383 M204 S8000
N7384 G1 X190.736 Y166.994 E.05236
N7385 G1 X159.264 Y175.427 E1.0477
N7386 G1 X159.264 Y175.006 E.01352
N7387 G1 X184.994 Y200.736 E1.17006
N7388 G1 X186.59 Y200.736 E.05132
N7389 G1 X190.736 Y185.262 E.51511
N7390 G1 X190.736 Y184.055 E.03882
N7391 ; WIPE_START
N7392 G1 X190.736 Y185.262 E-.45869
N7393 G1 X190.53 Y186.028 E-.30131
N7394 ; WIPE_END
N7395 G1 E-.04 F1800
N7396 M204 S10000
N7397 G17
N7398 G3 Z4.2 I1.217 J0 P1  F60000
N7399 ; stop printing object, unique label id: 372
N7400 M625
N7401 ; object ids of layer 19 start: 372
N7402 M624 AQAAAAAAAAA=
N7403 ;======== H2D 20250527========
N7404 ; SKIPPABLE_START
N7405 ; SKIPTYPE: timelapse
N7406 M622.1 S1 ; for prev firware, default turned on
N7407 
N7408 M1002 judge_flag timelapse_record_flag
N7409 
N7410 M622 J1
N7411 M993 A2 B2 C2
N7412 M993 A0 B0 C0
N7413 
N7414 
N7415 
N7416 
N7417     M9711 M0 E1 X261 Y132 Z4.2 S11 C10 O0 T3000
N7418 
N7419 
N7420 
N7421 M993 A3 B3 C3
N7422 
N7423 M623
N7424 ; SKIPPABLE_END
N7425 
N7426 ; object ids of this layer19 end: 372
N7427 M625
N7428 ; CHANGE_LAYER
N7429 ; Z_HEIGHT: 4
N7430 ; LAYER_HEIGHT: 0.2
N7431 ;======== H2D 20250521========
N7432 ; layer num/total_layer_count: 20/75
N7433 ; update layer progress
N7434 M73 L20
N7435 M991 S0 P19 ;notify layer change
N7436 
N7437 
N7438 ; OBJECT_ID: 372
N7439 ; COOLING_NODE: 0
N7440 ; start printing object, unique label id: 372
N7441 M624 AQAAAAAAAAA=
N7442 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=3.900G1 Z3.900 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N7268 G1 X158.916 Y201.084 E1.03439
N7269 G1 X158.916 Y118.916 E2.64221
N7270 G1 X191.084 Y118.916 E1.03439
N7271 G1 X191.084 Y201.024 E2.64028
N7277 G1 X158.509 Y201.491 E1.06057
N7278 G1 X158.509 Y118.509 E2.66839
N7279 G1 X191.491 Y118.509 E1.06057
N7280 G1 X191.491 Y201.431 E2.66646
N7286 G1 X158.102 Y201.898 E1.08675
N7287 G1 X158.102 Y118.102 E2.69457
N7288 G1 X191.898 Y118.102 E1.08675
N7289 G1 X191.898 Y201.838 E2.69264
N7297 G1 X157.71 Y202.29 E1.03002
N7299 G1 X157.71 Y117.71 E2.51935
N7300 G1 X192.29 Y117.71 E1.03002
N7301 G1 X192.29 Y202.23 E2.51756
N7312 G1 X178.161 Y200.736 E.05236
N7313 G1 X190.736 Y153.806 E1.56233
N7314 G1 X190.736 Y152.177 E.05236
N7319 G1 X190.736 Y141.708 E.05236
N7320 G1 X159.264 Y150.141 E1.0477
N7321 G1 X159.264 Y151.978 E.0591
N7322 G1 X190.736 Y183.449 E1.43118
N7323 G1 X190.736 Y183.852 E.01294
N7324 G1 X159.264 Y192.284 E1.0477
N7325 G1 X159.264 Y190.656 E.05236
N7330 G1 X159.264 Y176.887 E.05236
N7331 G1 X174.704 Y119.264 E1.91831
N7332 G1 X172.606 Y119.264 E.06747
N7333 G1 X190.736 Y137.394 E.82444
N7334 G1 X190.736 Y133.279 E.13231
N7335 G1 X159.264 Y141.712 E1.0477
N7336 G1 X159.264 Y140.464 E.04011
N7337 G1 X190.736 Y171.936 E1.43118
N7338 G1 X190.736 Y175.423 E.11215
N7339 G1 X159.264 Y183.856 E1.0477
N7340 G1 X159.264 Y186.52 E.08568
N7341 G1 X173.48 Y200.736 E.64645
N7342 G1 X169.732 Y200.736 E.12052
N7343 G1 X190.736 Y122.349 E2.60954
N7344 G1 X190.736 Y120.721 E.05236
N7349 G1 X180.125 Y119.264 E.05236
N7350 G1 X159.264 Y124.854 E.69448
N7351 G1 X159.264 Y128.951 E.13172
N7352 G1 X190.736 Y160.422 E1.43118
N7353 G1 X190.736 Y158.565 E.05969
N7354 G1 X159.264 Y166.998 E1.0477
N7355 G1 X159.264 Y163.492 E.11273
N7356 G1 X190.736 Y194.963 E1.43118
N7357 G1 X190.736 Y192.281 E.08627
N7359 G1 X159.264 Y200.713 E1.0477
N7360 G1 X159.264 Y198.034 E.08615
N7361 G1 X161.966 Y200.736 E.12285
N7362 G1 X161.303 Y200.736 E.02131
N7363 G1 X183.133 Y119.264 E2.71223
N7364 G1 X184.12 Y119.264 E.03174
N7365 G1 X190.736 Y125.88 E.30084
N7366 G1 X190.736 Y124.85 E.0331
N7367 G1 X159.264 Y133.283 E1.04769
N7368 G1 X159.264 Y134.911 E.05236
N7373 G1 X159.264 Y145.431 E.05236
N7374 G1 X166.276 Y119.264 E.87109
N7375 G1 X161.092 Y119.264 E.16668
N7376 G1 X190.736 Y148.908 E1.34805
N7377 G1 X190.736 Y150.137 E.03952
N7378 G1 X159.264 Y158.569 E1.0477
N7379 G1 X159.264 Y156.941 E.05236
N7384 G1 X190.736 Y166.994 E.05236
N7385 G1 X159.264 Y175.427 E1.0477
N7386 G1 X159.264 Y175.006 E.01352
N7387 G1 X184.994 Y200.736 E1.17006
N7388 G1 X186.59 Y200.736 E.05132
N7389 G1 X190.736 Y185.262 E.51511
N7390 G1 X190.736 Y184.055 E.03882
N7392 G1 X190.736 Y185.262 E-.45869
N7393 G1 X190.53 Y186.028 E-.30131
T0 ;TOOL_CHANGE:0 ; Revert to base toolN7443 G1 Z4
N7444 G1 E.8 F1800
N7445 ; FEATURE: Inner wall
N7446 ; LINE_WIDTH: 0.45
N7447 ; LAYER_HEIGHT: 0.2
N7448 G1 F4421.739
N7449 M204 S8000
N7450 G1 X158.916 Y201.084 E1.03439
N7451 G1 X158.916 Y118.916 E2.64221
N7452 G1 X191.084 Y118.916 E1.03439
N7453 G1 X191.084 Y201.024 E2.64028
N7454 ; COOLING_NODE: 0
N7455 M204 S10000
N7456 G1 X191.491 Y201.491 F60000
N7457 G1 F4421.739
N7458 M204 S8000
N7459 G1 X158.509 Y201.491 E1.06057
N7460 G1 X158.509 Y118.509 E2.66839
N7461 G1 X191.491 Y118.509 E1.06057
N7462 G1 X191.491 Y201.431 E2.66646
N7463 ; COOLING_NODE: 0
N7464 M204 S10000
N7465 G1 X191.898 Y201.898 F60000
N7466 G1 F4421.739
N7467 M204 S8000
N7468 G1 X158.102 Y201.898 E1.08675
N7469 G1 X158.102 Y118.102 E2.69457
N7470 G1 X191.898 Y118.102 E1.08675
N7471 G1 X191.898 Y201.838 E2.69264
N7472 ; COOLING_NODE: 0
N7473 M204 S10000
N7474 G1 X192.29 Y202.29 F60000
N7475 ; FEATURE: Outer wall
N7476 ; LINE_WIDTH: 0.42
N7477 G1 F4773.528
N7478 M204 S5000
N7479 G1 X157.71 Y202.29 E1.03002
N7480 G1 X157.71 Y117.71 E2.51935
N7481 G1 X192.29 Y117.71 E1.03002
N7482 G1 X192.29 Y202.23 E2.51756
N7483 G1 E-.8 F1800
N7484 M204 S10000
N7485 G1 X184.71 Y201.334 Z4.4 F60000
N7486 G1 X179.643 Y200.736 Z4.4
N7487 G1 Z4
N7488 G1 E.8 F1800
N7489 ; FEATURE: Sparse infill
N7490 ; LINE_WIDTH: 0.45
N7491 G1 F4421.739
N7492 M204 S8000
N7493 G1 X178.014 Y200.736 E.05236
N7494 G1 X190.736 Y153.259 E1.58052
N7495 G1 X190.736 Y151.631 E.05236
N7496 M204 S10000
N7497 G1 X190.736 Y143.483 F60000
N7498 G1 F4421.739
N7499 M204 S8000
N7500 G1 X190.736 Y141.854 E.05236
N7501 G1 X159.264 Y150.287 E1.0477
N7502 G1 X159.264 Y151.778 E.04796
N7503 G1 X190.736 Y183.249 E1.43118
N7504 G1 X190.736 Y181.621 E.05236
N7505 M204 S10000
N7506 G1 X190.736 Y165.512 F60000
N7507 G1 F4421.739
N7508 M204 S8000
N7509 G1 X190.736 Y167.141 E.05236
N7510 G1 X159.264 Y175.573 E1.0477
N7511 M204 S10000
N7512 G1 X159.264 Y173.178 F60000
N7513 G1 F4421.739
N7514 M204 S8000
N7515 G1 X159.264 Y174.806 E.05236
N7516 G1 X185.194 Y200.736 E1.17916
N7517 G1 X186.443 Y200.736 E.04018
N7518 G1 X190.736 Y184.716 E.5333
N7519 G1 X190.736 Y183.998 E.02308
N7520 G1 X159.264 Y192.431 E1.0477
N7521 G1 X159.264 Y190.803 E.05236
N7522 M204 S10000
N7523 G1 X159.264 Y177.969 F60000
N7524 G1 F4421.739
N7525 M204 S8000
N7526 G1 X159.264 Y176.341 E.05236
N7527 G1 X174.558 Y119.264 E1.90012
N7528 G1 X172.806 Y119.264 E.05633
N7529 G1 X190.736 Y137.194 E.81535
N7530 G1 X190.736 Y133.425 E.12117
N7531 G1 X159.264 Y141.858 E1.0477
N7532 G1 X159.264 Y140.264 E.05125
N7533 G1 X190.736 Y171.736 E1.43118
N7534 G1 X190.736 Y175.569 E.12328
N7535 G1 X159.264 Y184.002 E1.0477
N7536 G1 X159.264 Y186.32 E.07454
N7537 M73 P48 R32
N7538 G1 X173.68 Y200.736 E.65555
N7539 G1 X169.586 Y200.736 E.13165
N7540 G1 X190.736 Y121.803 E2.62773
N7541 G1 X190.736 Y120.174 E.05236
N7542 M204 S10000
N7543 G1 X182.3 Y119.264 F60000
N7544 G1 F4421.739
N7545 M204 S8000
N7546 G1 X180.672 Y119.264 E.05236
N7547 G1 X159.264 Y125.001 E.71267
N7548 G1 X159.264 Y128.751 E.12059
N7549 G1 X190.736 Y160.222 E1.43118
N7550 G1 X190.736 Y158.712 E.04855
N7551 G1 X159.264 Y167.145 E1.0477
N7552 G1 X159.264 Y163.292 E.12387
N7553 G1 X190.736 Y194.763 E1.43118
N7554 G1 X190.736 Y192.427 E.07513
N7555 G1 X159.728 Y200.736 E1.03227
N7556 G1 X159.264 Y200.736 E.0149
N7557 G1 X159.264 Y197.834 E.0933
N7558 G1 X162.166 Y200.736 E.13194
N7559 G1 X161.157 Y200.736 E.03245
N7560 G1 X182.987 Y119.264 E2.71223
N7561 G1 X184.32 Y119.264 E.04288
N7562 G1 X190.736 Y125.68 E.29174
N7563 G1 X190.736 Y124.997 E.02197
N7564 G1 X159.264 Y133.429 E1.0477
N7565 G1 X159.264 Y135.058 E.05236
N7566 M204 S10000
N7567 G1 X159.264 Y146.513 F60000
N7568 G1 F4421.739
N7569 M204 S8000
N7570 G1 X159.264 Y144.884 E.05236
N7571 G1 X166.129 Y119.264 E.8529
N7572 G1 X161.292 Y119.264 E.15554
N7573 G1 X190.736 Y148.708 E1.33896
N7574 G1 X190.736 Y150.283 E.05066
N7575 G1 X159.264 Y158.716 E1.0477
N7576 G1 X159.264 Y157.087 E.05236
N7577 ; WIPE_START
N7578 G1 X159.264 Y158.716 E-.61876
N7579 G1 X159.623 Y158.62 E-.14124
N7580 ; WIPE_END
N7581 G1 E-.04 F1800
N7582 M204 S10000
N7583 G17
N7584 G3 Z4.4 I1.217 J0 P1  F60000
N7585 ; stop printing object, unique label id: 372
N7586 M625
N7587 ; object ids of layer 20 start: 372
N7588 M624 AQAAAAAAAAA=
N7589 ;======== H2D 20250527========
N7590 ; SKIPPABLE_START
N7591 ; SKIPTYPE: timelapse
N7592 M622.1 S1 ; for prev firware, default turned on
N7593 
N7594 M1002 judge_flag timelapse_record_flag
N7595 
N7596 M622 J1
N7597 M993 A2 B2 C2
N7598 M993 A0 B0 C0
N7599 
N7600 
N7601 
N7602 
N7603     M9711 M0 E1 X261 Y132 Z4.4 S11 C10 O0 T3000
N7604 
N7605 
N7606 
N7607 M993 A3 B3 C3
N7608 
N7609 M623
N7610 ; SKIPPABLE_END
N7611 
N7612 ; object ids of this layer20 end: 372
N7613 M625
N7614 ; CHANGE_LAYER
N7615 ; Z_HEIGHT: 4.2
N7616 ; LAYER_HEIGHT: 0.2
N7617 ;======== H2D 20250521========
N7618 ; layer num/total_layer_count: 21/75
N7619 ; update layer progress
N7620 M73 L21
N7621 M991 S0 P20 ;notify layer change
N7622 
N7623 
N7624 ; OBJECT_ID: 372
N7625 ; COOLING_NODE: 0
N7626 ; start printing object, unique label id: 372
N7627 M624 AQAAAAAAAAA=
N7628 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=4.100G1 Z4.100 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N7450 G1 X158.916 Y201.084 E1.03439
N7451 G1 X158.916 Y118.916 E2.64221
N7452 G1 X191.084 Y118.916 E1.03439
N7453 G1 X191.084 Y201.024 E2.64028
N7459 G1 X158.509 Y201.491 E1.06057
N7460 G1 X158.509 Y118.509 E2.66839
N7461 G1 X191.491 Y118.509 E1.06057
N7462 G1 X191.491 Y201.431 E2.66646
N7468 G1 X158.102 Y201.898 E1.08675
N7469 G1 X158.102 Y118.102 E2.69457
N7470 G1 X191.898 Y118.102 E1.08675
N7471 G1 X191.898 Y201.838 E2.69264
N7479 G1 X157.71 Y202.29 E1.03002
N7480 G1 X157.71 Y117.71 E2.51935
N7481 G1 X192.29 Y117.71 E1.03002
N7482 G1 X192.29 Y202.23 E2.51756
N7493 G1 X178.014 Y200.736 E.05236
N7494 G1 X190.736 Y153.259 E1.58052
N7495 G1 X190.736 Y151.631 E.05236
N7500 G1 X190.736 Y141.854 E.05236
N7501 G1 X159.264 Y150.287 E1.0477
N7502 G1 X159.264 Y151.778 E.04796
N7503 G1 X190.736 Y183.249 E1.43118
N7504 G1 X190.736 Y181.621 E.05236
N7509 G1 X190.736 Y167.141 E.05236
N7510 G1 X159.264 Y175.573 E1.0477
N7515 G1 X159.264 Y174.806 E.05236
N7516 G1 X185.194 Y200.736 E1.17916
N7517 G1 X186.443 Y200.736 E.04018
N7518 G1 X190.736 Y184.716 E.5333
N7519 G1 X190.736 Y183.998 E.02308
N7520 G1 X159.264 Y192.431 E1.0477
N7521 G1 X159.264 Y190.803 E.05236
N7526 G1 X159.264 Y176.341 E.05236
N7527 G1 X174.558 Y119.264 E1.90012
N7528 G1 X172.806 Y119.264 E.05633
N7529 G1 X190.736 Y137.194 E.81535
N7530 G1 X190.736 Y133.425 E.12117
N7531 G1 X159.264 Y141.858 E1.0477
N7532 G1 X159.264 Y140.264 E.05125
N7533 G1 X190.736 Y171.736 E1.43118
N7534 G1 X190.736 Y175.569 E.12328
N7535 G1 X159.264 Y184.002 E1.0477
N7536 G1 X159.264 Y186.32 E.07454
N7538 G1 X173.68 Y200.736 E.65555
N7539 G1 X169.586 Y200.736 E.13165
N7540 G1 X190.736 Y121.803 E2.62773
N7541 G1 X190.736 Y120.174 E.05236
N7546 G1 X180.672 Y119.264 E.05236
N7547 G1 X159.264 Y125.001 E.71267
N7548 G1 X159.264 Y128.751 E.12059
N7549 G1 X190.736 Y160.222 E1.43118
N7550 G1 X190.736 Y158.712 E.04855
N7551 G1 X159.264 Y167.145 E1.0477
N7552 G1 X159.264 Y163.292 E.12387
N7553 G1 X190.736 Y194.763 E1.43118
N7554 G1 X190.736 Y192.427 E.07513
N7555 G1 X159.728 Y200.736 E1.03227
N7556 G1 X159.264 Y200.736 E.0149
N7557 G1 X159.264 Y197.834 E.0933
N7558 G1 X162.166 Y200.736 E.13194
N7559 G1 X161.157 Y200.736 E.03245
N7560 G1 X182.987 Y119.264 E2.71223
N7561 G1 X184.32 Y119.264 E.04288
N7562 G1 X190.736 Y125.68 E.29174
N7563 G1 X190.736 Y124.997 E.02197
N7564 G1 X159.264 Y133.429 E1.0477
N7565 G1 X159.264 Y135.058 E.05236
N7570 G1 X159.264 Y144.884 E.05236
N7571 G1 X166.129 Y119.264 E.8529
N7572 G1 X161.292 Y119.264 E.15554
N7573 G1 X190.736 Y148.708 E1.33896
N7574 G1 X190.736 Y150.283 E.05066
N7575 G1 X159.264 Y158.716 E1.0477
N7576 G1 X159.264 Y157.087 E.05236
N7578 G1 X159.264 Y158.716 E-.61876
N7579 G1 X159.623 Y158.62 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN7629 G1 Z4.2
N7630 G1 E.8 F1800
N7631 ; FEATURE: Inner wall
N7632 ; LINE_WIDTH: 0.45
N7633 ; LAYER_HEIGHT: 0.2
N7634 G1 F4421.739
N7635 M204 S8000
N7636 G1 X158.916 Y201.084 E1.03439
N7637 G1 X158.916 Y118.916 E2.64221
N7638 G1 X191.084 Y118.916 E1.03439
N7639 G1 X191.084 Y201.024 E2.64028
N7640 ; COOLING_NODE: 0
N7641 M204 S10000
N7642 G1 X191.491 Y201.491 F60000
N7643 G1 F4421.739
N7644 M204 S8000
N7645 G1 X158.509 Y201.491 E1.06057
N7646 G1 X158.509 Y118.509 E2.66839
N7647 G1 X191.491 Y118.509 E1.06057
N7648 G1 X191.491 Y201.431 E2.66646
N7649 ; COOLING_NODE: 0
N7650 M204 S10000
N7651 G1 X191.898 Y201.898 F60000
N7652 G1 F4421.739
N7653 M204 S8000
N7654 G1 X158.102 Y201.898 E1.08675
N7655 G1 X158.102 Y118.102 E2.69457
N7656 G1 X191.898 Y118.102 E1.08675
N7657 G1 X191.898 Y201.838 E2.69264
N7658 ; COOLING_NODE: 0
N7659 M204 S10000
N7660 G1 X192.29 Y202.29 F60000
N7661 ; FEATURE: Outer wall
N7662 ; LINE_WIDTH: 0.42
N7663 G1 F4773.528
N7664 M204 S5000
N7665 G1 X157.71 Y202.29 E1.03002
N7666 G1 X157.71 Y117.71 E2.51935
N7667 G1 X192.29 Y117.71 E1.03002
N7668 G1 X192.29 Y202.23 E2.51756
N7669 G1 E-.8 F1800
N7670 M204 S10000
N7671 G1 X191.721 Y194.619 Z4.6 F60000
N7672 G1 X190.736 Y181.421 Z4.6
N7673 G1 Z4.2
N7674 G1 E.8 F1800
N7675 ; FEATURE: Sparse infill
N7676 ; LINE_WIDTH: 0.45
N7677 G1 F4421.739
N7678 M204 S8000
N7679 G1 X190.736 Y183.049 E.05236
N7680 G1 X159.264 Y151.578 E1.43118
N7681 G1 X159.264 Y150.433 E.03682
N7682 G1 X190.736 Y142.001 E1.0477
N7683 G1 X190.736 Y143.629 E.05236
N7684 M204 S10000
N7685 G1 X190.736 Y151.085 F60000
N7686 G1 F4421.739
N7687 M204 S8000
N7688 G1 X190.736 Y152.713 E.05236
N7689 G1 X177.868 Y200.736 E1.59871
N7690 G1 X173.88 Y200.736 E.12825
N7691 G1 X159.264 Y186.12 E.66464
N7692 G1 X159.264 Y184.149 E.0634
N7693 G1 X190.736 Y175.716 E1.0477
N7694 G1 X190.736 Y171.536 E.13442
N7695 G1 X159.264 Y140.064 E1.43118
N7696 G1 X159.264 Y142.005 E.06239
N7697 G1 X190.736 Y133.572 E1.0477
N7698 G1 X190.736 Y136.994 E.11003
N7699 G1 X173.006 Y119.264 E.80625
N7700 G1 X174.412 Y119.264 E.04519
N7701 G1 X159.264 Y175.795 E1.88193
N7702 G1 X159.264 Y175.72 E.00241
N7703 G1 X190.736 Y167.287 E1.0477
N7704 G1 X190.736 Y165.659 E.05236
N7705 M204 S10000
N7706 G1 X159.264 Y157.234 F60000
N7707 G1 F4421.739
N7708 M204 S8000
N7709 G1 X159.264 Y158.862 E.05236
N7710 G1 X190.736 Y150.429 E1.04769
N7711 G1 X190.736 Y148.508 E.0618
N7712 G1 X161.492 Y119.264 E1.32986
N7713 G1 X165.983 Y119.264 E.1444
N7714 G1 X159.264 Y144.338 E.83471
N7715 G1 X159.264 Y145.966 E.05236
N7716 M204 S10000
N7717 G1 X159.264 Y135.204 F60000
N7718 G1 F4421.739
N7719 M204 S8000
N7720 G1 X159.264 Y133.576 E.05236
N7721 G1 X190.736 Y125.143 E1.0477
N7722 G1 X190.736 Y125.48 E.01083
N7723 G1 X184.52 Y119.264 E.28265
N7724 G1 X190.736 Y119.264 E.19986
N7725 G1 X190.736 Y121.256 E.06405
N7726 G1 X169.439 Y200.736 E2.64592
N7727 G1 X162.366 Y200.736 E.22745
N7728 G1 X159.264 Y197.634 E.14104
N7729 G1 X159.264 Y200.736 E.09973
N7730 G1 X160.274 Y200.736 E.03247
N7731 G1 X190.736 Y192.573 E1.01408
N7732 G1 X190.736 Y194.563 E.06399
N7733 G1 X159.264 Y163.092 E1.43118
N7734 G1 X159.264 Y167.291 E.13501
N7735 G1 X190.736 Y158.858 E1.0477
N7736 G1 X190.736 Y160.022 E.03741
N7737 G1 X159.264 Y128.551 E1.43118
N7738 G1 X159.264 Y125.147 E.10945
N7739 G1 X181.218 Y119.264 E.73086
N7740 G1 X182.84 Y119.264 E.05216
N7741 G1 X161.01 Y200.736 E2.71223
N7742 M204 S10000
N7743 G1 X159.264 Y190.949 F60000
N7744 G1 F4421.739
N7745 M204 S8000
N7746 G1 X159.264 Y192.577 E.05236
N7747 M73 P48 R31
N7748 G1 X190.736 Y184.145 E1.0477
N7749 G1 X186.297 Y200.736 E.55227
N7750 G1 X185.394 Y200.736 E.02904
N7751 G1 X159.264 Y174.606 E1.18825
N7752 ; WIPE_START
N7753 G1 X160.679 Y176.021 E-.76
N7754 ; WIPE_END
N7755 G1 E-.04 F1800
N7756 M204 S10000
N7757 G17
N7758 G3 Z4.6 I1.217 J0 P1  F60000
N7759 ; stop printing object, unique label id: 372
N7760 M625
N7761 ; object ids of layer 21 start: 372
N7762 M624 AQAAAAAAAAA=
N7763 ;======== H2D 20250527========
N7764 ; SKIPPABLE_START
N7765 ; SKIPTYPE: timelapse
N7766 M622.1 S1 ; for prev firware, default turned on
N7767 
N7768 M1002 judge_flag timelapse_record_flag
N7769 
N7770 M622 J1
N7771 M993 A2 B2 C2
N7772 M993 A0 B0 C0
N7773 
N7774 
N7775 
N7776 
N7777     M9711 M0 E1 X261 Y132 Z4.6 S11 C10 O0 T3000
N7778 
N7779 
N7780 
N7781 M993 A3 B3 C3
N7782 
N7783 M623
N7784 ; SKIPPABLE_END
N7785 
N7786 ; object ids of this layer21 end: 372
N7787 M625
N7788 ; CHANGE_LAYER
N7789 ; Z_HEIGHT: 4.4
N7790 ; LAYER_HEIGHT: 0.2
N7791 ;======== H2D 20250521========
N7792 ; layer num/total_layer_count: 22/75
N7793 ; update layer progress
N7794 M73 L22
N7795 M991 S0 P21 ;notify layer change
N7796 
N7797 
N7798 ; OBJECT_ID: 372
N7799 ; COOLING_NODE: 0
N7800 ; start printing object, unique label id: 372
N7801 M624 AQAAAAAAAAA=
N7802 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=4.300G1 Z4.300 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N7636 G1 X158.916 Y201.084 E1.03439
N7637 G1 X158.916 Y118.916 E2.64221
N7638 G1 X191.084 Y118.916 E1.03439
N7639 G1 X191.084 Y201.024 E2.64028
N7645 G1 X158.509 Y201.491 E1.06057
N7646 G1 X158.509 Y118.509 E2.66839
N7647 G1 X191.491 Y118.509 E1.06057
N7648 G1 X191.491 Y201.431 E2.66646
N7654 G1 X158.102 Y201.898 E1.08675
N7655 G1 X158.102 Y118.102 E2.69457
N7656 G1 X191.898 Y118.102 E1.08675
N7657 G1 X191.898 Y201.838 E2.69264
N7665 G1 X157.71 Y202.29 E1.03002
N7666 G1 X157.71 Y117.71 E2.51935
N7667 G1 X192.29 Y117.71 E1.03002
N7668 G1 X192.29 Y202.23 E2.51756
N7679 G1 X190.736 Y183.049 E.05236
N7680 G1 X159.264 Y151.578 E1.43118
N7681 G1 X159.264 Y150.433 E.03682
N7682 G1 X190.736 Y142.001 E1.0477
N7683 G1 X190.736 Y143.629 E.05236
N7688 G1 X190.736 Y152.713 E.05236
N7689 G1 X177.868 Y200.736 E1.59871
N7690 G1 X173.88 Y200.736 E.12825
N7691 G1 X159.264 Y186.12 E.66464
N7692 G1 X159.264 Y184.149 E.0634
N7693 G1 X190.736 Y175.716 E1.0477
N7694 G1 X190.736 Y171.536 E.13442
N7695 G1 X159.264 Y140.064 E1.43118
N7696 G1 X159.264 Y142.005 E.06239
N7697 G1 X190.736 Y133.572 E1.0477
N7698 G1 X190.736 Y136.994 E.11003
N7699 G1 X173.006 Y119.264 E.80625
N7700 G1 X174.412 Y119.264 E.04519
N7701 G1 X159.264 Y175.795 E1.88193
N7702 G1 X159.264 Y175.72 E.00241
N7703 G1 X190.736 Y167.287 E1.0477
N7704 G1 X190.736 Y165.659 E.05236
N7709 G1 X159.264 Y158.862 E.05236
N7710 G1 X190.736 Y150.429 E1.04769
N7711 G1 X190.736 Y148.508 E.0618
N7712 G1 X161.492 Y119.264 E1.32986
N7713 G1 X165.983 Y119.264 E.1444
N7714 G1 X159.264 Y144.338 E.83471
N7715 G1 X159.264 Y145.966 E.05236
N7720 G1 X159.264 Y133.576 E.05236
N7721 G1 X190.736 Y125.143 E1.0477
N7722 G1 X190.736 Y125.48 E.01083
N7723 G1 X184.52 Y119.264 E.28265
N7724 G1 X190.736 Y119.264 E.19986
N7725 G1 X190.736 Y121.256 E.06405
N7726 G1 X169.439 Y200.736 E2.64592
N7727 G1 X162.366 Y200.736 E.22745
N7728 G1 X159.264 Y197.634 E.14104
N7729 G1 X159.264 Y200.736 E.09973
N7730 G1 X160.274 Y200.736 E.03247
N7731 G1 X190.736 Y192.573 E1.01408
N7732 G1 X190.736 Y194.563 E.06399
N7733 G1 X159.264 Y163.092 E1.43118
N7734 G1 X159.264 Y167.291 E.13501
N7735 G1 X190.736 Y158.858 E1.0477
N7736 G1 X190.736 Y160.022 E.03741
N7737 G1 X159.264 Y128.551 E1.43118
N7738 G1 X159.264 Y125.147 E.10945
N7739 G1 X181.218 Y119.264 E.73086
N7740 G1 X182.84 Y119.264 E.05216
N7741 G1 X161.01 Y200.736 E2.71223
N7746 G1 X159.264 Y192.577 E.05236
N7748 G1 X190.736 Y184.145 E1.0477
N7749 G1 X186.297 Y200.736 E.55227
N7750 G1 X185.394 Y200.736 E.02904
N7751 G1 X159.264 Y174.606 E1.18825
N7753 G1 X160.679 Y176.021 E-.76
T0 ;TOOL_CHANGE:0 ; Revert to base toolN7803 G1 Z4.4
N7804 G1 E.8 F1800
N7805 ; FEATURE: Inner wall
N7806 ; LINE_WIDTH: 0.45
N7807 ; LAYER_HEIGHT: 0.2
N7808 G1 F4421.739
N7809 M204 S8000
N7810 G1 X158.916 Y201.084 E1.03439
N7811 G1 X158.916 Y118.916 E2.64221
N7812 G1 X191.084 Y118.916 E1.03439
N7813 G1 X191.084 Y201.024 E2.64028
N7814 ; COOLING_NODE: 0
N7815 M204 S10000
N7816 G1 X191.491 Y201.491 F60000
N7817 M73 P49 R31
N7818 G1 F4421.739
N7819 M204 S8000
N7820 G1 X158.509 Y201.491 E1.06057
N7821 G1 X158.509 Y118.509 E2.66839
N7822 G1 X191.491 Y118.509 E1.06057
N7823 G1 X191.491 Y201.431 E2.66646
N7824 ; COOLING_NODE: 0
N7825 M204 S10000
N7826 G1 X191.898 Y201.898 F60000
N7827 G1 F4421.739
N7828 M204 S8000
N7829 G1 X158.102 Y201.898 E1.08675
N7830 G1 X158.102 Y118.102 E2.69457
N7831 G1 X191.898 Y118.102 E1.08675
N7832 G1 X191.898 Y201.838 E2.69264
N7833 ; COOLING_NODE: 0
N7834 M204 S10000
N7835 G1 X192.29 Y202.29 F60000
N7836 ; FEATURE: Outer wall
N7837 ; LINE_WIDTH: 0.42
N7838 G1 F4773.528
N7839 M204 S5000
N7840 G1 X157.71 Y202.29 E1.03002
N7841 G1 X157.71 Y117.71 E2.51935
N7842 G1 X192.29 Y117.71 E1.03002
N7843 G1 X192.29 Y202.23 E2.51756
N7844 G1 E-.8 F1800
N7845 M204 S10000
N7846 G1 X191.631 Y194.626 Z4.8 F60000
N7847 G1 X190.736 Y184.291 Z4.8
N7848 G1 Z4.4
N7849 G1 E.8 F1800
N7850 ; FEATURE: Sparse infill
N7851 ; LINE_WIDTH: 0.45
N7852 G1 F4421.739
N7853 M204 S8000
N7854 G1 X159.264 Y192.724 E1.0477
N7855 G1 X159.264 Y197.434 E.15147
N7856 G1 X162.566 Y200.736 E.15013
N7857 G1 X169.293 Y200.736 E.21631
N7858 G1 X190.736 Y120.71 E2.66411
N7859 G1 X190.736 Y119.264 E.04648
N7860 G1 X184.72 Y119.264 E.19343
N7861 G1 X190.736 Y125.29 E.27377
N7862 G1 X159.264 Y133.722 E1.0477
N7863 G1 X159.264 Y135.35 E.05236
N7864 M204 S10000
N7865 G1 X159.264 Y145.42 F60000
N7866 G1 F4421.739
N7867 M204 S8000
N7868 G1 X159.264 Y143.791 E.05236
N7869 G1 X165.836 Y119.264 E.81652
N7870 G1 X161.692 Y119.264 E.13326
N7871 G1 X190.736 Y148.308 E1.32077
N7872 G1 X190.736 Y142.147 E.1981
N7873 G1 X159.264 Y150.58 E1.0477
N7874 G1 X159.264 Y151.378 E.02568
N7875 G1 X190.736 Y182.849 E1.43118
N7876 G1 X190.736 Y183.623 E.02488
N7877 G1 X186.15 Y200.736 E.56968
N7878 G1 X185.594 Y200.736 E.0179
N7879 G1 X159.264 Y174.406 E1.19735
N7880 M204 S10000
N7881 G1 X159.264 Y169.066 F60000
N7882 G1 F4421.739
N7883 M204 S8000
N7884 G1 X159.264 Y167.437 E.05236
N7885 G1 X190.736 Y159.005 E1.0477
N7886 G1 X190.736 Y159.822 E.02627
N7887 G1 X159.264 Y128.351 E1.43118
N7888 G1 X159.264 Y125.293 E.09831
N7889 G1 X181.765 Y119.264 E.74905
N7890 G1 X182.694 Y119.264 E.02989
N7891 G1 X160.864 Y200.736 E2.71223
N7892 G1 X160.821 Y200.736 E.00139
N7893 G1 X190.736 Y192.72 E.99589
N7894 G1 X190.736 Y194.363 E.05285
N7895 G1 X159.264 Y162.892 E1.43118
N7896 G1 X159.264 Y159.009 E.12489
N7897 G1 X190.736 Y150.576 E1.04769
N7898 G1 X190.736 Y152.167 E.05115
N7899 G1 X177.722 Y200.736 E1.6169
N7900 G1 X174.08 Y200.736 E.11711
N7901 G1 X159.264 Y185.92 E.67374
N7902 G1 X159.264 Y184.295 E.05226
N7903 G1 X190.736 Y175.862 E1.0477
N7904 G1 X190.736 Y171.336 E.14556
N7905 G1 X159.264 Y139.864 E1.43118
N7906 G1 X159.264 Y142.151 E.07352
N7907 G1 X190.736 Y133.718 E1.04769
N7908 G1 X190.736 Y136.794 E.09889
N7909 G1 X173.206 Y119.264 E.79716
N7910 G1 X174.265 Y119.264 E.03405
N7911 G1 X159.264 Y175.248 E1.86374
N7912 G1 X159.264 Y175.866 E.01987
N7913 G1 X190.736 Y167.433 E1.0477
N7914 G1 X190.736 Y165.805 E.05236
N7915 ; WIPE_START
N7916 G1 X190.736 Y167.433 E-.61876
N7917 G1 X190.377 Y167.53 E-.14124
N7918 ; WIPE_END
N7919 G1 E-.04 F1800
N7920 M204 S10000
N7921 G17
N7922 G3 Z4.8 I1.217 J0 P1  F60000
N7923 ; stop printing object, unique label id: 372
N7924 M625
N7925 ; object ids of layer 22 start: 372
N7926 M624 AQAAAAAAAAA=
N7927 ;======== H2D 20250527========
N7928 ; SKIPPABLE_START
N7929 ; SKIPTYPE: timelapse
N7930 M622.1 S1 ; for prev firware, default turned on
N7931 
N7932 M1002 judge_flag timelapse_record_flag
N7933 
N7934 M622 J1
N7935 M993 A2 B2 C2
N7936 M993 A0 B0 C0
N7937 
N7938 
N7939 
N7940 
N7941     M9711 M0 E1 X261 Y132 Z4.8 S11 C10 O0 T3000
N7942 
N7943 
N7944 
N7945 M993 A3 B3 C3
N7946 
N7947 M623
N7948 ; SKIPPABLE_END
N7949 
N7950 ; object ids of this layer22 end: 372
N7951 M625
N7952 ; CHANGE_LAYER
N7953 ; Z_HEIGHT: 4.6
N7954 ; LAYER_HEIGHT: 0.2
N7955 ;======== H2D 20250521========
N7956 ; layer num/total_layer_count: 23/75
N7957 ; update layer progress
N7958 M73 L23
N7959 M991 S0 P22 ;notify layer change
N7960 
N7961 
N7962 ; OBJECT_ID: 372
N7963 ; COOLING_NODE: 0
N7964 ; start printing object, unique label id: 372
N7965 M624 AQAAAAAAAAA=
N7966 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=4.500G1 Z4.500 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N7810 G1 X158.916 Y201.084 E1.03439
N7811 G1 X158.916 Y118.916 E2.64221
N7812 G1 X191.084 Y118.916 E1.03439
N7813 G1 X191.084 Y201.024 E2.64028
N7820 G1 X158.509 Y201.491 E1.06057
N7821 G1 X158.509 Y118.509 E2.66839
N7822 G1 X191.491 Y118.509 E1.06057
N7823 G1 X191.491 Y201.431 E2.66646
N7829 G1 X158.102 Y201.898 E1.08675
N7830 G1 X158.102 Y118.102 E2.69457
N7831 G1 X191.898 Y118.102 E1.08675
N7832 G1 X191.898 Y201.838 E2.69264
N7840 G1 X157.71 Y202.29 E1.03002
N7841 G1 X157.71 Y117.71 E2.51935
N7842 G1 X192.29 Y117.71 E1.03002
N7843 G1 X192.29 Y202.23 E2.51756
N7854 G1 X159.264 Y192.724 E1.0477
N7855 G1 X159.264 Y197.434 E.15147
N7856 G1 X162.566 Y200.736 E.15013
N7857 G1 X169.293 Y200.736 E.21631
N7858 G1 X190.736 Y120.71 E2.66411
N7859 G1 X190.736 Y119.264 E.04648
N7860 G1 X184.72 Y119.264 E.19343
N7861 G1 X190.736 Y125.29 E.27377
N7862 G1 X159.264 Y133.722 E1.0477
N7863 G1 X159.264 Y135.35 E.05236
N7868 G1 X159.264 Y143.791 E.05236
N7869 G1 X165.836 Y119.264 E.81652
N7870 G1 X161.692 Y119.264 E.13326
N7871 G1 X190.736 Y148.308 E1.32077
N7872 G1 X190.736 Y142.147 E.1981
N7873 G1 X159.264 Y150.58 E1.0477
N7874 G1 X159.264 Y151.378 E.02568
N7875 G1 X190.736 Y182.849 E1.43118
N7876 G1 X190.736 Y183.623 E.02488
N7877 G1 X186.15 Y200.736 E.56968
N7878 G1 X185.594 Y200.736 E.0179
N7879 G1 X159.264 Y174.406 E1.19735
N7884 G1 X159.264 Y167.437 E.05236
N7885 G1 X190.736 Y159.005 E1.0477
N7886 G1 X190.736 Y159.822 E.02627
N7887 G1 X159.264 Y128.351 E1.43118
N7888 G1 X159.264 Y125.293 E.09831
N7889 G1 X181.765 Y119.264 E.74905
N7890 G1 X182.694 Y119.264 E.02989
N7891 G1 X160.864 Y200.736 E2.71223
N7892 G1 X160.821 Y200.736 E.00139
N7893 G1 X190.736 Y192.72 E.99589
N7894 G1 X190.736 Y194.363 E.05285
N7895 G1 X159.264 Y162.892 E1.43118
N7896 G1 X159.264 Y159.009 E.12489
N7897 G1 X190.736 Y150.576 E1.04769
N7898 G1 X190.736 Y152.167 E.05115
N7899 G1 X177.722 Y200.736 E1.6169
N7900 G1 X174.08 Y200.736 E.11711
N7901 G1 X159.264 Y185.92 E.67374
N7902 G1 X159.264 Y184.295 E.05226
N7903 G1 X190.736 Y175.862 E1.0477
N7904 G1 X190.736 Y171.336 E.14556
N7905 G1 X159.264 Y139.864 E1.43118
N7906 G1 X159.264 Y142.151 E.07352
N7907 G1 X190.736 Y133.718 E1.04769
N7908 G1 X190.736 Y136.794 E.09889
N7909 G1 X173.206 Y119.264 E.79716
N7910 G1 X174.265 Y119.264 E.03405
N7911 G1 X159.264 Y175.248 E1.86374
N7912 G1 X159.264 Y175.866 E.01987
N7913 G1 X190.736 Y167.433 E1.0477
N7914 G1 X190.736 Y165.805 E.05236
N7916 G1 X190.736 Y167.433 E-.61876
N7917 G1 X190.377 Y167.53 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN7967 G1 Z4.6
N7968 G1 E.8 F1800
N7969 ; FEATURE: Inner wall
N7970 ; LINE_WIDTH: 0.45
N7971 ; LAYER_HEIGHT: 0.2
N7972 G1 F4421.739
N7973 M204 S8000
N7974 G1 X158.916 Y201.084 E1.03439
N7975 G1 X158.916 Y118.916 E2.64221
N7976 G1 X191.084 Y118.916 E1.03439
N7977 G1 X191.084 Y201.024 E2.64028
N7978 ; COOLING_NODE: 0
N7979 M204 S10000
N7980 G1 X191.491 Y201.491 F60000
N7981 G1 F4421.739
N7982 M204 S8000
N7983 G1 X158.509 Y201.491 E1.06057
N7984 G1 X158.509 Y118.509 E2.66839
N7985 G1 X191.491 Y118.509 E1.06057
N7986 G1 X191.491 Y201.431 E2.66646
N7987 ; COOLING_NODE: 0
N7988 M204 S10000
N7989 G1 X191.898 Y201.898 F60000
N7990 G1 F4421.739
N7991 M204 S8000
N7992 G1 X158.102 Y201.898 E1.08675
N7993 G1 X158.102 Y118.102 E2.69457
N7994 G1 X191.898 Y118.102 E1.08675
N7995 G1 X191.898 Y201.838 E2.69264
N7996 ; COOLING_NODE: 0
N7997 M204 S10000
N7998 G1 X192.29 Y202.29 F60000
N7999 ; FEATURE: Outer wall
N8000 ; LINE_WIDTH: 0.42
N8001 G1 F4773.528
N8002 M204 S5000
N8003 G1 X157.71 Y202.29 E1.03002
N8004 G1 X157.71 Y117.71 E2.51935
N8005 G1 X192.29 Y117.71 E1.03002
N8006 G1 X192.29 Y202.23 E2.51756
N8007 G1 E-.8 F1800
N8008 M204 S10000
N8009 M73 P50 R31
N8010 G1 X191.559 Y194.633 Z5 F60000
N8011 G1 X190.736 Y186.066 Z5
N8012 G1 Z4.6
N8013 G1 E.8 F1800
N8014 ; FEATURE: Sparse infill
N8015 ; LINE_WIDTH: 0.45
N8016 G1 F4421.739
N8017 M204 S8000
N8018 G1 X190.736 Y184.437 E.05236
N8019 G1 X159.264 Y192.87 E1.0477
N8020 G1 X159.264 Y197.234 E.14033
N8021 G1 X162.766 Y200.736 E.15923
N8022 G1 X169.146 Y200.736 E.20517
N8023 G1 X190.736 Y120.163 E2.6823
N8024 G1 X190.736 Y119.264 E.02891
N8025 G1 X184.92 Y119.264 E.187
N8026 G1 X190.736 Y125.08 E.26446
N8027 G1 X190.736 Y125.436 E.01145
N8028 G1 X159.264 Y133.869 E1.0477
N8029 G1 X159.264 Y139.664 E.18637
N8030 G1 X190.736 Y171.136 E1.43118
N8031 G1 X190.736 Y167.58 E.11434
N8032 G1 X159.264 Y176.013 E1.0477
N8033 G1 X159.264 Y174.702 E.04215
N8034 G1 X174.119 Y119.264 E1.84555
N8035 G1 X173.406 Y119.264 E.02291
N8036 G1 X190.736 Y136.594 E.78806
N8037 G1 X190.736 Y133.865 E.08775
N8038 G1 X159.264 Y142.297 E1.04769
N8039 M204 S10000
N8040 G1 X159.264 Y144.873 F60000
N8041 G1 F4421.739
N8042 M204 S8000
N8043 G1 X159.264 Y143.245 E.05236
N8044 G1 X165.69 Y119.264 E.79833
N8045 G1 X161.892 Y119.264 E.12212
N8046 G1 X190.736 Y148.108 E1.31167
N8047 G1 X190.736 Y142.294 E.18696
N8048 G1 X159.264 Y150.726 E1.0477
N8049 G1 X159.264 Y151.178 E.01454
N8050 G1 X190.736 Y182.649 E1.43118
N8051 G1 X190.736 Y183.077 E.01374
N8052 G1 X186.004 Y200.736 E.58787
N8053 G1 X185.794 Y200.736 E.00676
N8054 G1 X159.264 Y174.206 E1.20644
N8055 M204 S10000
N8056 G1 X159.264 Y169.212 F60000
N8057 G1 F4421.739
N8058 M204 S8000
N8059 G1 X159.264 Y167.584 E.05236
N8060 G1 X190.736 Y159.151 E1.0477
N8061 G1 X190.736 Y159.622 E.01513
N8062 G1 X159.264 Y128.151 E1.43118
N8063 G1 X159.264 Y125.44 E.08717
N8064 G1 X182.311 Y119.264 E.76724
N8065 G1 X182.548 Y119.264 E.00761
N8066 G1 X160.718 Y200.736 E2.71223
N8067 G1 X161.367 Y200.736 E.02089
N8068 G1 X190.736 Y192.866 E.9777
N8069 G1 X190.736 Y194.163 E.04171
N8070 G1 X159.264 Y162.692 E1.43118
N8071 G1 X159.264 Y159.155 E.11375
N8072 G1 X190.736 Y150.722 E1.0477
N8073 G1 X190.736 Y151.62 E.02887
N8074 G1 X177.575 Y200.736 E1.63509
N8075 G1 X174.28 Y200.736 E.10597
N8076 G1 X159.264 Y185.72 E.68283
N8077 G1 X159.264 Y184.441 E.04112
N8078 G1 X190.736 Y176.009 E1.0477
N8079 G1 X190.736 Y177.637 E.05236
N8080 ; WIPE_START
N8081 G1 X190.736 Y176.009 E-.61876
N8082 G1 X190.377 Y176.105 E-.14124
N8083 ; WIPE_END
N8084 G1 E-.04 F1800
N8085 M204 S10000
N8086 G17
N8087 G3 Z5 I1.217 J0 P1  F60000
N8088 ; stop printing object, unique label id: 372
N8089 M625
N8090 ; object ids of layer 23 start: 372
N8091 M624 AQAAAAAAAAA=
N8092 ;======== H2D 20250527========
N8093 ; SKIPPABLE_START
N8094 ; SKIPTYPE: timelapse
N8095 M622.1 S1 ; for prev firware, default turned on
N8096 
N8097 M1002 judge_flag timelapse_record_flag
N8098 
N8099 M622 J1
N8100 M993 A2 B2 C2
N8101 M993 A0 B0 C0
N8102 
N8103 
N8104 
N8105 
N8106     M9711 M0 E1 X261 Y132 Z5 S11 C10 O0 T3000
N8107 
N8108 
N8109 
N8110 M993 A3 B3 C3
N8111 
N8112 M623
N8113 ; SKIPPABLE_END
N8114 
N8115 ; object ids of this layer23 end: 372
N8116 M625
N8117 ; CHANGE_LAYER
N8118 ; Z_HEIGHT: 4.8
N8119 ; LAYER_HEIGHT: 0.2
N8120 ;======== H2D 20250521========
N8121 ; layer num/total_layer_count: 24/75
N8122 ; update layer progress
N8123 M73 L24
N8124 M991 S0 P23 ;notify layer change
N8125 
N8126 
N8127 M106 S40.8
N8128 ; OBJECT_ID: 372
N8129 ; COOLING_NODE: 0
N8130 ; start printing object, unique label id: 372
N8131 M624 AQAAAAAAAAA=
N8132 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=4.700G1 Z4.700 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N7974 G1 X158.916 Y201.084 E1.03439
N7975 G1 X158.916 Y118.916 E2.64221
N7976 G1 X191.084 Y118.916 E1.03439
N7977 G1 X191.084 Y201.024 E2.64028
N7983 G1 X158.509 Y201.491 E1.06057
N7984 G1 X158.509 Y118.509 E2.66839
N7985 G1 X191.491 Y118.509 E1.06057
N7986 G1 X191.491 Y201.431 E2.66646
N7992 G1 X158.102 Y201.898 E1.08675
N7993 G1 X158.102 Y118.102 E2.69457
N7994 G1 X191.898 Y118.102 E1.08675
N7995 G1 X191.898 Y201.838 E2.69264
N8003 G1 X157.71 Y202.29 E1.03002
N8004 G1 X157.71 Y117.71 E2.51935
N8005 G1 X192.29 Y117.71 E1.03002
N8006 G1 X192.29 Y202.23 E2.51756
N8018 G1 X190.736 Y184.437 E.05236
N8019 G1 X159.264 Y192.87 E1.0477
N8020 G1 X159.264 Y197.234 E.14033
N8021 G1 X162.766 Y200.736 E.15923
N8022 G1 X169.146 Y200.736 E.20517
N8023 G1 X190.736 Y120.163 E2.6823
N8024 G1 X190.736 Y119.264 E.02891
N8025 G1 X184.92 Y119.264 E.187
N8026 G1 X190.736 Y125.08 E.26446
N8027 G1 X190.736 Y125.436 E.01145
N8028 G1 X159.264 Y133.869 E1.0477
N8029 G1 X159.264 Y139.664 E.18637
N8030 G1 X190.736 Y171.136 E1.43118
N8031 G1 X190.736 Y167.58 E.11434
N8032 G1 X159.264 Y176.013 E1.0477
N8033 G1 X159.264 Y174.702 E.04215
N8034 G1 X174.119 Y119.264 E1.84555
N8035 G1 X173.406 Y119.264 E.02291
N8036 G1 X190.736 Y136.594 E.78806
N8037 G1 X190.736 Y133.865 E.08775
N8038 G1 X159.264 Y142.297 E1.04769
N8043 G1 X159.264 Y143.245 E.05236
N8044 G1 X165.69 Y119.264 E.79833
N8045 G1 X161.892 Y119.264 E.12212
N8046 G1 X190.736 Y148.108 E1.31167
N8047 G1 X190.736 Y142.294 E.18696
N8048 G1 X159.264 Y150.726 E1.0477
N8049 G1 X159.264 Y151.178 E.01454
N8050 G1 X190.736 Y182.649 E1.43118
N8051 G1 X190.736 Y183.077 E.01374
N8052 G1 X186.004 Y200.736 E.58787
N8053 G1 X185.794 Y200.736 E.00676
N8054 G1 X159.264 Y174.206 E1.20644
N8059 G1 X159.264 Y167.584 E.05236
N8060 G1 X190.736 Y159.151 E1.0477
N8061 G1 X190.736 Y159.622 E.01513
N8062 G1 X159.264 Y128.151 E1.43118
N8063 G1 X159.264 Y125.44 E.08717
N8064 G1 X182.311 Y119.264 E.76724
N8065 G1 X182.548 Y119.264 E.00761
N8066 G1 X160.718 Y200.736 E2.71223
N8067 G1 X161.367 Y200.736 E.02089
N8068 G1 X190.736 Y192.866 E.9777
N8069 G1 X190.736 Y194.163 E.04171
N8070 G1 X159.264 Y162.692 E1.43118
N8071 G1 X159.264 Y159.155 E.11375
N8072 G1 X190.736 Y150.722 E1.0477
N8073 G1 X190.736 Y151.62 E.02887
N8074 G1 X177.575 Y200.736 E1.63509
N8075 G1 X174.28 Y200.736 E.10597
N8076 G1 X159.264 Y185.72 E.68283
N8077 G1 X159.264 Y184.441 E.04112
N8078 G1 X190.736 Y176.009 E1.0477
N8079 G1 X190.736 Y177.637 E.05236
N8081 G1 X190.736 Y176.009 E-.61876
N8082 G1 X190.377 Y176.105 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN8133 G1 Z4.8
N8134 G1 E.8 F1800
N8135 ; FEATURE: Inner wall
N8136 ; LINE_WIDTH: 0.45
N8137 ; LAYER_HEIGHT: 0.2
N8138 G1 F4421.739
N8139 M204 S8000
N8140 G1 X158.916 Y201.084 E1.03439
N8141 G1 X158.916 Y118.916 E2.64221
N8142 G1 X191.084 Y118.916 E1.03439
N8143 G1 X191.084 Y201.024 E2.64028
N8144 ; COOLING_NODE: 0
N8145 M204 S10000
N8146 G1 X191.491 Y201.491 F60000
N8147 G1 F4421.739
N8148 M204 S8000
N8149 G1 X158.509 Y201.491 E1.06057
N8150 G1 X158.509 Y118.509 E2.66839
N8151 G1 X191.491 Y118.509 E1.06057
N8152 G1 X191.491 Y201.431 E2.66646
N8153 ; COOLING_NODE: 0
N8154 M204 S10000
N8155 G1 X191.898 Y201.898 F60000
N8156 M73 P50 R30
N8157 G1 F4421.739
N8158 M204 S8000
N8159 G1 X158.102 Y201.898 E1.08675
N8160 G1 X158.102 Y118.102 E2.69457
N8161 G1 X191.898 Y118.102 E1.08675
N8162 G1 X191.898 Y201.838 E2.69264
N8163 ; COOLING_NODE: 0
N8164 M204 S10000
N8165 G1 X192.29 Y202.29 F60000
N8166 ; FEATURE: Outer wall
N8167 ; LINE_WIDTH: 0.42
N8168 G1 F4773.528
N8169 M204 S5000
N8170 G1 X157.71 Y202.29 E1.03002
N8171 G1 X157.71 Y117.71 E2.51935
N8172 G1 X192.29 Y117.71 E1.03002
N8173 G1 X192.29 Y202.23 E2.51756
N8174 G1 E-.8 F1800
N8175 M204 S10000
N8176 G1 X191.553 Y194.633 Z5.2 F60000
N8177 G1 X190.736 Y186.212 Z5.2
N8178 G1 Z4.8
N8179 G1 E.8 F1800
N8180 ; FEATURE: Sparse infill
N8181 ; LINE_WIDTH: 0.45
N8182 G1 F4421.739
N8183 M204 S8000
N8184 G1 X190.736 Y184.584 E.05236
N8185 G1 X159.264 Y193.017 E1.0477
N8186 G1 X159.264 Y197.034 E.12919
N8187 G1 X162.966 Y200.736 E.16832
N8188 M204 S10000
N8189 G1 X167.372 Y200.736 F60000
N8190 G1 F4421.739
N8191 M204 S8000
N8192 G1 X169 Y200.736 E.05236
N8193 G1 X190.736 Y119.617 E2.70049
N8194 G1 X190.736 Y119.264 E.01134
N8195 G1 X189.46 Y119.264 E.04102
N8196 M204 S10000
N8197 G1 X182.401 Y119.264 F60000
N8198 G1 F4421.739
N8199 M204 S8000
N8200 G1 X160.571 Y200.736 E2.71223
N8201 G1 X161.913 Y200.736 E.04317
N8202 G1 X190.736 Y193.013 E.95951
N8203 G1 X190.736 Y193.963 E.03057
N8204 G1 X159.264 Y162.492 E1.43118
N8205 G1 X159.264 Y159.301 E.10261
N8206 G1 X190.736 Y150.869 E1.0477
N8207 G1 X190.736 Y151.074 E.00659
N8208 G1 X177.429 Y200.736 E1.65328
N8209 G1 X174.48 Y200.736 E.09483
N8210 G1 X159.264 Y185.52 E.69193
N8211 G1 X159.264 Y184.588 E.02999
N8212 G1 X190.736 Y176.155 E1.0477
N8213 G1 X190.736 Y177.783 E.05236
N8214 M204 S10000
N8215 G1 X159.264 Y177.787 F60000
N8216 G1 F4421.739
N8217 M204 S8000
N8218 G1 X159.264 Y176.159 E.05236
N8219 G1 X190.736 Y167.726 E1.0477
N8220 G1 X190.736 Y170.936 E.1032
N8221 G1 X159.264 Y139.464 E1.43118
N8222 G1 X159.264 Y134.015 E.17524
N8223 G1 X190.736 Y125.582 E1.0477
N8224 G1 X190.736 Y124.88 E.02259
N8225 G1 X185.12 Y119.264 E.25536
N8226 G1 X182.858 Y119.264 E.07276
N8227 G1 X159.264 Y125.586 E.78543
N8228 G1 X159.264 Y127.951 E.07603
N8229 G1 X190.736 Y159.422 E1.43118
N8230 G1 X190.736 Y159.298 E.00399
N8231 G1 X159.264 Y167.73 E1.0477
N8232 G1 X159.264 Y166.102 E.05236
N8233 M204 S10000
N8234 M73 P51 R30
N8235 G1 X190.736 Y146.279 F60000
N8236 G1 F4421.739
N8237 M204 S8000
N8238 G1 X190.736 Y147.908 E.05236
N8239 G1 X162.092 Y119.264 E1.30258
N8240 G1 X165.544 Y119.264 E.11098
N8241 G1 X159.264 Y142.699 E.78014
N8242 G1 X159.264 Y142.444 E.0082
N8243 G1 X190.736 Y134.011 E1.0477
N8244 G1 X190.736 Y136.394 E.07661
N8245 G1 X173.606 Y119.264 E.77897
N8246 G1 X173.972 Y119.264 E.01177
N8247 G1 X159.264 Y174.155 E1.82736
N8248 G1 X159.264 Y174.006 E.00479
N8249 G1 X185.994 Y200.736 E1.21554
N8250 G1 X185.857 Y200.736 E.00438
N8251 G1 X190.736 Y182.53 E.60606
N8252 G1 X190.736 Y182.449 E.0026
N8253 G1 X159.264 Y150.978 E1.43118
N8254 G1 X159.264 Y150.873 E.0034
N8255 G1 X190.736 Y142.44 E1.0477
N8256 G1 X190.736 Y140.812 E.05236
N8257 ; WIPE_START
N8258 G1 X190.736 Y142.44 E-.61876
N8259 G1 X190.377 Y142.536 E-.14124
N8260 ; WIPE_END
N8261 G1 E-.04 F1800
N8262 M204 S10000
N8263 G17
N8264 G3 Z5.2 I1.217 J0 P1  F60000
N8265 ; stop printing object, unique label id: 372
N8266 M625
N8267 ; object ids of layer 24 start: 372
N8268 M624 AQAAAAAAAAA=
N8269 ;======== H2D 20250527========
N8270 ; SKIPPABLE_START
N8271 ; SKIPTYPE: timelapse
N8272 M622.1 S1 ; for prev firware, default turned on
N8273 
N8274 M1002 judge_flag timelapse_record_flag
N8275 
N8276 M622 J1
N8277 M993 A2 B2 C2
N8278 M993 A0 B0 C0
N8279 
N8280 
N8281 
N8282 
N8283     M9711 M0 E1 X261 Y132 Z5.2 S11 C10 O0 T3000
N8284 
N8285 
N8286 
N8287 M993 A3 B3 C3
N8288 
N8289 M623
N8290 ; SKIPPABLE_END
N8291 
N8292 ; object ids of this layer24 end: 372
N8293 M625
N8294 ; CHANGE_LAYER
N8295 ; Z_HEIGHT: 5
N8296 ; LAYER_HEIGHT: 0.2
N8297 ;======== H2D 20250521========
N8298 ; layer num/total_layer_count: 25/75
N8299 ; update layer progress
N8300 M73 L25
N8301 M991 S0 P24 ;notify layer change
N8302 
N8303 
N8304 ; OBJECT_ID: 372
N8305 ; COOLING_NODE: 0
N8306 ; start printing object, unique label id: 372
N8307 M624 AQAAAAAAAAA=
N8308 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=4.900G1 Z4.900 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N8140 G1 X158.916 Y201.084 E1.03439
N8141 G1 X158.916 Y118.916 E2.64221
N8142 G1 X191.084 Y118.916 E1.03439
N8143 G1 X191.084 Y201.024 E2.64028
N8149 G1 X158.509 Y201.491 E1.06057
N8150 G1 X158.509 Y118.509 E2.66839
N8151 G1 X191.491 Y118.509 E1.06057
N8152 G1 X191.491 Y201.431 E2.66646
N8159 G1 X158.102 Y201.898 E1.08675
N8160 G1 X158.102 Y118.102 E2.69457
N8161 G1 X191.898 Y118.102 E1.08675
N8162 G1 X191.898 Y201.838 E2.69264
N8170 G1 X157.71 Y202.29 E1.03002
N8171 G1 X157.71 Y117.71 E2.51935
N8172 G1 X192.29 Y117.71 E1.03002
N8173 G1 X192.29 Y202.23 E2.51756
N8184 G1 X190.736 Y184.584 E.05236
N8185 G1 X159.264 Y193.017 E1.0477
N8186 G1 X159.264 Y197.034 E.12919
N8187 G1 X162.966 Y200.736 E.16832
N8192 G1 X169 Y200.736 E.05236
N8193 G1 X190.736 Y119.617 E2.70049
N8194 G1 X190.736 Y119.264 E.01134
N8195 G1 X189.46 Y119.264 E.04102
N8200 G1 X160.571 Y200.736 E2.71223
N8201 G1 X161.913 Y200.736 E.04317
N8202 G1 X190.736 Y193.013 E.95951
N8203 G1 X190.736 Y193.963 E.03057
N8204 G1 X159.264 Y162.492 E1.43118
N8205 G1 X159.264 Y159.301 E.10261
N8206 G1 X190.736 Y150.869 E1.0477
N8207 G1 X190.736 Y151.074 E.00659
N8208 G1 X177.429 Y200.736 E1.65328
N8209 G1 X174.48 Y200.736 E.09483
N8210 G1 X159.264 Y185.52 E.69193
N8211 G1 X159.264 Y184.588 E.02999
N8212 G1 X190.736 Y176.155 E1.0477
N8213 G1 X190.736 Y177.783 E.05236
N8218 G1 X159.264 Y176.159 E.05236
N8219 G1 X190.736 Y167.726 E1.0477
N8220 G1 X190.736 Y170.936 E.1032
N8221 G1 X159.264 Y139.464 E1.43118
N8222 G1 X159.264 Y134.015 E.17524
N8223 G1 X190.736 Y125.582 E1.0477
N8224 G1 X190.736 Y124.88 E.02259
N8225 G1 X185.12 Y119.264 E.25536
N8226 G1 X182.858 Y119.264 E.07276
N8227 G1 X159.264 Y125.586 E.78543
N8228 G1 X159.264 Y127.951 E.07603
N8229 G1 X190.736 Y159.422 E1.43118
N8230 G1 X190.736 Y159.298 E.00399
N8231 G1 X159.264 Y167.73 E1.0477
N8232 G1 X159.264 Y166.102 E.05236
N8238 G1 X190.736 Y147.908 E.05236
N8239 G1 X162.092 Y119.264 E1.30258
N8240 G1 X165.544 Y119.264 E.11098
N8241 G1 X159.264 Y142.699 E.78014
N8242 G1 X159.264 Y142.444 E.0082
N8243 G1 X190.736 Y134.011 E1.0477
N8244 G1 X190.736 Y136.394 E.07661
N8245 G1 X173.606 Y119.264 E.77897
N8246 G1 X173.972 Y119.264 E.01177
N8247 G1 X159.264 Y174.155 E1.82736
N8248 G1 X159.264 Y174.006 E.00479
N8249 G1 X185.994 Y200.736 E1.21554
N8250 G1 X185.857 Y200.736 E.00438
N8251 G1 X190.736 Y182.53 E.60606
N8252 G1 X190.736 Y182.449 E.0026
N8253 G1 X159.264 Y150.978 E1.43118
N8254 G1 X159.264 Y150.873 E.0034
N8255 G1 X190.736 Y142.44 E1.0477
N8256 G1 X190.736 Y140.812 E.05236
N8258 G1 X190.736 Y142.44 E-.61876
N8259 G1 X190.377 Y142.536 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN8309 G1 Z5
N8310 G1 E.8 F1800
N8311 ; FEATURE: Inner wall
N8312 ; LINE_WIDTH: 0.45
N8313 ; LAYER_HEIGHT: 0.2
N8314 G1 F4421.739
N8315 M204 S8000
N8316 G1 X158.916 Y201.084 E1.03439
N8317 G1 X158.916 Y118.916 E2.64221
N8318 G1 X191.084 Y118.916 E1.03439
N8319 G1 X191.084 Y201.024 E2.64028
N8320 ; COOLING_NODE: 0
N8321 M204 S10000
N8322 G1 X191.491 Y201.491 F60000
N8323 G1 F4421.739
N8324 M204 S8000
N8325 G1 X158.509 Y201.491 E1.06057
N8326 G1 X158.509 Y118.509 E2.66839
N8327 G1 X191.491 Y118.509 E1.06057
N8328 G1 X191.491 Y201.431 E2.66646
N8329 ; COOLING_NODE: 0
N8330 M204 S10000
N8331 G1 X191.898 Y201.898 F60000
N8332 G1 F4421.739
N8333 M204 S8000
N8334 G1 X158.102 Y201.898 E1.08675
N8335 G1 X158.102 Y118.102 E2.69457
N8336 G1 X191.898 Y118.102 E1.08675
N8337 G1 X191.898 Y201.838 E2.69264
N8338 ; COOLING_NODE: 0
N8339 M204 S10000
N8340 G1 X192.29 Y202.29 F60000
N8341 ; FEATURE: Outer wall
N8342 ; LINE_WIDTH: 0.42
N8343 G1 F4773.528
N8344 M204 S5000
N8345 G1 X157.71 Y202.29 E1.03002
N8346 G1 X157.71 Y117.71 E2.51935
N8347 G1 X192.29 Y117.71 E1.03002
N8348 G1 X192.29 Y202.23 E2.51756
N8349 G1 E-.8 F1800
N8350 M204 S10000
N8351 G1 X191.546 Y194.634 Z5.4 F60000
N8352 G1 X190.736 Y186.359 Z5.4
N8353 G1 Z5
N8354 G1 E.8 F1800
N8355 ; FEATURE: Sparse infill
N8356 ; LINE_WIDTH: 0.45
N8357 G1 F4421.739
N8358 M204 S8000
N8359 G1 X190.736 Y184.73 E.05236
N8360 G1 X159.264 Y193.163 E1.0477
N8361 G1 X159.264 Y196.834 E.11805
N8362 G1 X163.166 Y200.736 E.17742
N8363 M204 S10000
N8364 G1 X170.482 Y200.736 F60000
N8365 G1 F4421.739
N8366 M204 S8000
N8367 G1 X168.853 Y200.736 E.05236
N8368 G1 X190.684 Y119.264 E2.71223
N8369 G1 X189.055 Y119.264 E.05236
N8370 M204 S10000
N8371 G1 X182.255 Y119.264 F60000
N8372 G1 F4421.739
N8373 M204 S8000
N8374 G1 X160.425 Y200.736 E2.71223
N8375 G1 X162.46 Y200.736 E.06544
N8376 G1 X190.736 Y193.159 E.94132
N8377 G1 X190.736 Y193.763 E.01943
N8378 G1 X159.264 Y162.292 E1.43118
N8379 G1 X159.264 Y159.448 E.09147
N8380 G1 X190.736 Y151.015 E1.0477
N8381 M204 S10000
N8382 G1 X190.736 Y140.958 F60000
N8383 G1 F4421.739
N8384 M204 S8000
N8385 G1 X190.736 Y142.586 E.05236
N8386 G1 X159.264 Y151.019 E1.0477
N8387 G1 X159.264 Y150.778 E.00774
N8388 G1 X190.736 Y182.249 E1.43118
N8389 G1 X190.736 Y181.984 E.00854
N8390 G1 X185.711 Y200.736 E.62425
N8391 G1 X186.194 Y200.736 E.01552
N8392 G1 X159.264 Y173.806 E1.22463
N8393 G1 X159.264 Y173.609 E.00635
N8394 G1 X173.826 Y119.264 E1.80917
N8395 G1 X173.806 Y119.264 E.00063
N8396 G1 X190.736 Y136.194 E.76987
N8397 G1 X190.736 Y134.158 E.06548
N8398 G1 X159.264 Y142.59 E1.0477
N8399 G1 X159.264 Y142.152 E.01408
N8400 G1 X165.397 Y119.264 E.76195
N8401 G1 X162.292 Y119.264 E.09984
N8402 G1 X190.736 Y147.708 E1.29348
N8403 G1 X190.736 Y150.527 E.09067
N8404 G1 X177.282 Y200.736 E1.67147
N8405 G1 X174.68 Y200.736 E.08369
N8406 G1 X159.264 Y185.32 E.70102
N8407 G1 X159.264 Y184.734 E.01885
N8408 G1 X190.736 Y176.302 E1.0477
N8409 G1 X190.736 Y177.93 E.05236
N8410 M204 S10000
N8411 G1 X159.264 Y177.934 F60000
N8412 G1 F4421.739
N8413 M204 S8000
N8414 G1 X159.264 Y176.305 E.05236
N8415 G1 X190.736 Y167.873 E1.0477
N8416 G1 X190.736 Y170.736 E.09206
N8417 G1 X159.264 Y139.264 E1.43118
N8418 G1 X159.264 Y134.161 E.1641
N8419 G1 X190.736 Y125.729 E1.0477
N8420 G1 X190.736 Y124.68 E.03373
N8421 G1 X185.32 Y119.264 E.24627
N8422 G1 X183.404 Y119.264 E.06162
N8423 G1 X159.264 Y125.733 E.80362
N8424 G1 X159.264 Y127.751 E.06489
N8425 G1 X190.736 Y159.222 E1.43118
N8426 G1 X190.736 Y159.444 E.00715
N8427 G1 X159.264 Y167.877 E1.04769
N8428 G1 X159.264 Y166.248 E.05236
N8429 ; WIPE_START
N8430 G1 X159.264 Y167.877 E-.61876
N8431 G1 X159.623 Y167.78 E-.14124
N8432 ; WIPE_END
N8433 G1 E-.04 F1800
N8434 M204 S10000
N8435 G17
N8436 G3 Z5.4 I1.217 J0 P1  F60000
N8437 ; stop printing object, unique label id: 372
N8438 M625
N8439 ; object ids of layer 25 start: 372
N8440 M624 AQAAAAAAAAA=
N8441 ;======== H2D 20250527========
N8442 ; SKIPPABLE_START
N8443 ; SKIPTYPE: timelapse
N8444 M622.1 S1 ; for prev firware, default turned on
N8445 
N8446 M1002 judge_flag timelapse_record_flag
N8447 
N8448 M622 J1
N8449 M993 A2 B2 C2
N8450 M993 A0 B0 C0
N8451 
N8452 
N8453 
N8454 
N8455     M9711 M0 E1 X261 Y132 Z5.4 S11 C10 O0 T3000
N8456 
N8457 
N8458 
N8459 M993 A3 B3 C3
N8460 
N8461 M623
N8462 ; SKIPPABLE_END
N8463 
N8464 ; object ids of this layer25 end: 372
N8465 M625
N8466 ; CHANGE_LAYER
N8467 ; Z_HEIGHT: 5.2
N8468 ; LAYER_HEIGHT: 0.2
N8469 ;======== H2D 20250521========
N8470 ; layer num/total_layer_count: 26/75
N8471 ; update layer progress
N8472 M73 L26
N8473 M991 S0 P25 ;notify layer change
N8474 
N8475 
N8476 M106 S38.25
N8477 ; OBJECT_ID: 372
N8478 ; COOLING_NODE: 0
N8479 ; start printing object, unique label id: 372
N8480 M624 AQAAAAAAAAA=
N8481 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=5.100G1 Z5.100 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N8316 G1 X158.916 Y201.084 E1.03439
N8317 G1 X158.916 Y118.916 E2.64221
N8318 G1 X191.084 Y118.916 E1.03439
N8319 G1 X191.084 Y201.024 E2.64028
N8325 G1 X158.509 Y201.491 E1.06057
N8326 G1 X158.509 Y118.509 E2.66839
N8327 G1 X191.491 Y118.509 E1.06057
N8328 G1 X191.491 Y201.431 E2.66646
N8334 G1 X158.102 Y201.898 E1.08675
N8335 G1 X158.102 Y118.102 E2.69457
N8336 G1 X191.898 Y118.102 E1.08675
N8337 G1 X191.898 Y201.838 E2.69264
N8345 G1 X157.71 Y202.29 E1.03002
N8346 G1 X157.71 Y117.71 E2.51935
N8347 G1 X192.29 Y117.71 E1.03002
N8348 G1 X192.29 Y202.23 E2.51756
N8359 G1 X190.736 Y184.73 E.05236
N8360 G1 X159.264 Y193.163 E1.0477
N8361 G1 X159.264 Y196.834 E.11805
N8362 G1 X163.166 Y200.736 E.17742
N8367 G1 X168.853 Y200.736 E.05236
N8368 G1 X190.684 Y119.264 E2.71223
N8369 G1 X189.055 Y119.264 E.05236
N8374 G1 X160.425 Y200.736 E2.71223
N8375 G1 X162.46 Y200.736 E.06544
N8376 G1 X190.736 Y193.159 E.94132
N8377 G1 X190.736 Y193.763 E.01943
N8378 G1 X159.264 Y162.292 E1.43118
N8379 G1 X159.264 Y159.448 E.09147
N8380 G1 X190.736 Y151.015 E1.0477
N8385 G1 X190.736 Y142.586 E.05236
N8386 G1 X159.264 Y151.019 E1.0477
N8387 G1 X159.264 Y150.778 E.00774
N8388 G1 X190.736 Y182.249 E1.43118
N8389 G1 X190.736 Y181.984 E.00854
N8390 G1 X185.711 Y200.736 E.62425
N8391 G1 X186.194 Y200.736 E.01552
N8392 G1 X159.264 Y173.806 E1.22463
N8393 G1 X159.264 Y173.609 E.00635
N8394 G1 X173.826 Y119.264 E1.80917
N8395 G1 X173.806 Y119.264 E.00063
N8396 G1 X190.736 Y136.194 E.76987
N8397 G1 X190.736 Y134.158 E.06548
N8398 G1 X159.264 Y142.59 E1.0477
N8399 G1 X159.264 Y142.152 E.01408
N8400 G1 X165.397 Y119.264 E.76195
N8401 G1 X162.292 Y119.264 E.09984
N8402 G1 X190.736 Y147.708 E1.29348
N8403 G1 X190.736 Y150.527 E.09067
N8404 G1 X177.282 Y200.736 E1.67147
N8405 G1 X174.68 Y200.736 E.08369
N8406 G1 X159.264 Y185.32 E.70102
N8407 G1 X159.264 Y184.734 E.01885
N8408 G1 X190.736 Y176.302 E1.0477
N8409 G1 X190.736 Y177.93 E.05236
N8414 G1 X159.264 Y176.305 E.05236
N8415 G1 X190.736 Y167.873 E1.0477
N8416 G1 X190.736 Y170.736 E.09206
N8417 G1 X159.264 Y139.264 E1.43118
N8418 G1 X159.264 Y134.161 E.1641
N8419 G1 X190.736 Y125.729 E1.0477
N8420 G1 X190.736 Y124.68 E.03373
N8421 G1 X185.32 Y119.264 E.24627
N8422 G1 X183.404 Y119.264 E.06162
N8423 G1 X159.264 Y125.733 E.80362
N8424 G1 X159.264 Y127.751 E.06489
N8425 G1 X190.736 Y159.222 E1.43118
N8426 G1 X190.736 Y159.444 E.00715
N8427 G1 X159.264 Y167.877 E1.04769
N8428 G1 X159.264 Y166.248 E.05236
N8430 G1 X159.264 Y167.877 E-.61876
N8431 G1 X159.623 Y167.78 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN8482 G1 Z5.2
N8483 G1 E.8 F1800
N8484 ; FEATURE: Inner wall
N8485 ; LINE_WIDTH: 0.45
N8486 ; LAYER_HEIGHT: 0.2
N8487 G1 F4421.739
N8488 M204 S8000
N8489 G1 X158.916 Y201.084 E1.03439
N8490 G1 X158.916 Y118.916 E2.64221
N8491 G1 X191.084 Y118.916 E1.03439
N8492 G1 X191.084 Y201.024 E2.64028
N8493 ; COOLING_NODE: 0
N8494 M204 S10000
N8495 G1 X191.491 Y201.491 F60000
N8496 G1 F4421.739
N8497 M204 S8000
N8498 G1 X158.509 Y201.491 E1.06057
N8499 G1 X158.509 Y118.509 E2.66839
N8500 G1 X191.491 Y118.509 E1.06057
N8501 G1 X191.491 Y201.431 E2.66646
N8502 ; COOLING_NODE: 0
N8503 M204 S10000
N8504 G1 X191.898 Y201.898 F60000
N8505 M73 P52 R30
N8506 G1 F4421.739
N8507 M204 S8000
N8508 G1 X158.102 Y201.898 E1.08675
N8509 G1 X158.102 Y118.102 E2.69457
N8510 G1 X191.898 Y118.102 E1.08675
N8511 G1 X191.898 Y201.838 E2.69264
N8512 ; COOLING_NODE: 0
N8513 M204 S10000
N8514 G1 X192.29 Y202.29 F60000
N8515 ; FEATURE: Outer wall
N8516 ; LINE_WIDTH: 0.42
N8517 G1 F4773.528
N8518 M204 S5000
N8519 G1 X157.71 Y202.29 E1.03002
N8520 M73 P52 R29
N8521 G1 X157.71 Y117.71 E2.51935
N8522 G1 X192.29 Y117.71 E1.03002
N8523 G1 X192.29 Y202.23 E2.51756
N8524 G1 E-.8 F1800
N8525 M204 S10000
N8526 G1 X191.539 Y194.635 Z5.6 F60000
N8527 G1 X190.736 Y186.505 Z5.6
N8528 G1 Z5.2
N8529 G1 E.8 F1800
N8530 ; FEATURE: Sparse infill
N8531 ; LINE_WIDTH: 0.45
N8532 G1 F4421.739
N8533 M204 S8000
N8534 G1 X190.736 Y184.877 E.05236
N8535 G1 X159.264 Y193.309 E1.0477
N8536 G1 X159.264 Y196.634 E.10691
N8537 G1 X163.366 Y200.736 E.18651
N8538 G1 X163.006 Y200.736 E.01156
N8539 G1 X190.736 Y193.306 E.92313
N8540 G1 X190.736 Y193.563 E.00829
N8541 G1 X159.264 Y162.092 E1.43118
N8542 G1 X159.264 Y159.594 E.08033
N8543 G1 X190.736 Y151.162 E1.0477
N8544 M204 S10000
N8545 G1 X190.736 Y141.104 F60000
N8546 G1 F4421.739
N8547 M204 S8000
N8548 G1 X190.736 Y142.733 E.05236
N8549 G1 X159.264 Y151.165 E1.04769
N8550 G1 X159.264 Y150.578 E.01887
N8551 G1 X190.736 Y182.049 E1.43118
N8552 M204 S10000
N8553 G1 X190.736 Y179.809 F60000
N8554 G1 F4421.739
N8555 M204 S8000
N8556 G1 X190.736 Y181.438 E.05236
N8557 G1 X185.565 Y200.736 E.64244
N8558 G1 X186.394 Y200.736 E.02666
N8559 G1 X159.264 Y173.606 E1.23373
N8560 G1 X159.264 Y173.063 E.01749
N8561 G1 X173.68 Y119.264 E1.79098
N8562 G1 X174.006 Y119.264 E.01051
N8563 G1 X190.736 Y135.994 E.76078
N8564 G1 X190.736 Y134.304 E.05434
N8565 G1 X159.264 Y142.737 E1.0477
N8566 G1 X159.264 Y141.606 E.03636
N8567 G1 X165.251 Y119.264 E.74376
N8568 G1 X162.492 Y119.264 E.0887
N8569 G1 X190.736 Y147.508 E1.28439
N8570 G1 X190.736 Y149.981 E.07953
N8571 G1 X177.136 Y200.736 E1.68966
N8572 G1 X174.88 Y200.736 E.07255
N8573 G1 X159.264 Y185.12 E.71012
N8574 G1 X159.264 Y184.881 E.00771
N8575 G1 X190.736 Y176.448 E1.0477
N8576 G1 X190.736 Y174.82 E.05236
N8577 M204 S10000
N8578 G1 X159.264 Y166.395 F60000
N8579 G1 F4421.739
N8580 M204 S8000
N8581 G1 X159.264 Y168.023 E.05236
N8582 G1 X190.736 Y159.59 E1.0477
N8583 G1 X190.736 Y159.022 E.01829
N8584 G1 X159.264 Y127.551 E1.43118
N8585 G1 X159.264 Y125.879 E.05375
N8586 G1 X183.95 Y119.264 E.82181
N8587 G1 X185.52 Y119.264 E.05048
N8588 G1 X190.736 Y124.48 E.23717
N8589 G1 X190.736 Y125.875 E.04487
N8590 G1 X159.264 Y134.308 E1.0477
N8591 G1 X159.264 Y139.064 E.15296
N8592 G1 X190.736 Y170.536 E1.43118
N8593 G1 X190.736 Y168.019 E.08092
N8594 G1 X159.264 Y176.452 E1.0477
N8595 G1 X159.264 Y178.08 E.05236
N8596 M204 S10000
N8597 G1 X159.264 Y200.121 F60000
N8598 G1 F4421.739
N8599 M204 S8000
N8600 G1 X159.264 Y200.736 E.01976
N8601 G1 X160.278 Y200.736 E.0326
N8602 G1 X182.108 Y119.264 E2.71223
N8603 G1 X180.48 Y119.264 E.05236
N8604 M204 S10000
N8605 G1 X190.736 Y120.694 F60000
N8606 G1 F4421.739
N8607 M204 S8000
N8608 G1 X190.736 Y119.264 E.04598
N8609 G1 X190.537 Y119.264 E.00638
N8610 G1 X168.707 Y200.736 E2.71223
N8611 G1 X170.335 Y200.736 E.05236
N8612 ; WIPE_START
N8613 G1 X168.707 Y200.736 E-.61876
N8614 G1 X168.803 Y200.377 E-.14124
N8615 ; WIPE_END
N8616 G1 E-.04 F1800
N8617 M204 S10000
N8618 G17
N8619 G3 Z5.6 I1.217 J0 P1  F60000
N8620 ; stop printing object, unique label id: 372
N8621 M625
N8622 ; object ids of layer 26 start: 372
N8623 M624 AQAAAAAAAAA=
N8624 ;======== H2D 20250527========
N8625 ; SKIPPABLE_START
N8626 ; SKIPTYPE: timelapse
N8627 M622.1 S1 ; for prev firware, default turned on
N8628 
N8629 M1002 judge_flag timelapse_record_flag
N8630 
N8631 M622 J1
N8632 M993 A2 B2 C2
N8633 M993 A0 B0 C0
N8634 
N8635 
N8636 
N8637 
N8638     M9711 M0 E1 X261 Y132 Z5.6 S11 C10 O0 T3000
N8639 
N8640 
N8641 
N8642 M993 A3 B3 C3
N8643 
N8644 M623
N8645 ; SKIPPABLE_END
N8646 
N8647 ; object ids of this layer26 end: 372
N8648 M625
N8649 ; CHANGE_LAYER
N8650 ; Z_HEIGHT: 5.4
N8651 ; LAYER_HEIGHT: 0.2
N8652 ;======== H2D 20250521========
N8653 ; layer num/total_layer_count: 27/75
N8654 ; update layer progress
N8655 M73 L27
N8656 M991 S0 P26 ;notify layer change
N8657 
N8658 
N8659 M106 S40.8
N8660 ; OBJECT_ID: 372
N8661 ; COOLING_NODE: 0
N8662 ; start printing object, unique label id: 372
N8663 M624 AQAAAAAAAAA=
N8664 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=5.300G1 Z5.300 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N8489 G1 X158.916 Y201.084 E1.03439
N8490 G1 X158.916 Y118.916 E2.64221
N8491 G1 X191.084 Y118.916 E1.03439
N8492 G1 X191.084 Y201.024 E2.64028
N8498 G1 X158.509 Y201.491 E1.06057
N8499 G1 X158.509 Y118.509 E2.66839
N8500 G1 X191.491 Y118.509 E1.06057
N8501 G1 X191.491 Y201.431 E2.66646
N8508 G1 X158.102 Y201.898 E1.08675
N8509 G1 X158.102 Y118.102 E2.69457
N8510 G1 X191.898 Y118.102 E1.08675
N8511 G1 X191.898 Y201.838 E2.69264
N8519 G1 X157.71 Y202.29 E1.03002
N8521 G1 X157.71 Y117.71 E2.51935
N8522 G1 X192.29 Y117.71 E1.03002
N8523 G1 X192.29 Y202.23 E2.51756
N8534 G1 X190.736 Y184.877 E.05236
N8535 G1 X159.264 Y193.309 E1.0477
N8536 G1 X159.264 Y196.634 E.10691
N8537 G1 X163.366 Y200.736 E.18651
N8538 G1 X163.006 Y200.736 E.01156
N8539 G1 X190.736 Y193.306 E.92313
N8540 G1 X190.736 Y193.563 E.00829
N8541 G1 X159.264 Y162.092 E1.43118
N8542 G1 X159.264 Y159.594 E.08033
N8543 G1 X190.736 Y151.162 E1.0477
N8548 G1 X190.736 Y142.733 E.05236
N8549 G1 X159.264 Y151.165 E1.04769
N8550 G1 X159.264 Y150.578 E.01887
N8551 G1 X190.736 Y182.049 E1.43118
N8556 G1 X190.736 Y181.438 E.05236
N8557 G1 X185.565 Y200.736 E.64244
N8558 G1 X186.394 Y200.736 E.02666
N8559 G1 X159.264 Y173.606 E1.23373
N8560 G1 X159.264 Y173.063 E.01749
N8561 G1 X173.68 Y119.264 E1.79098
N8562 G1 X174.006 Y119.264 E.01051
N8563 G1 X190.736 Y135.994 E.76078
N8564 G1 X190.736 Y134.304 E.05434
N8565 G1 X159.264 Y142.737 E1.0477
N8566 G1 X159.264 Y141.606 E.03636
N8567 G1 X165.251 Y119.264 E.74376
N8568 G1 X162.492 Y119.264 E.0887
N8569 G1 X190.736 Y147.508 E1.28439
N8570 G1 X190.736 Y149.981 E.07953
N8571 G1 X177.136 Y200.736 E1.68966
N8572 G1 X174.88 Y200.736 E.07255
N8573 G1 X159.264 Y185.12 E.71012
N8574 G1 X159.264 Y184.881 E.00771
N8575 G1 X190.736 Y176.448 E1.0477
N8576 G1 X190.736 Y174.82 E.05236
N8581 G1 X159.264 Y168.023 E.05236
N8582 G1 X190.736 Y159.59 E1.0477
N8583 G1 X190.736 Y159.022 E.01829
N8584 G1 X159.264 Y127.551 E1.43118
N8585 G1 X159.264 Y125.879 E.05375
N8586 G1 X183.95 Y119.264 E.82181
N8587 G1 X185.52 Y119.264 E.05048
N8588 G1 X190.736 Y124.48 E.23717
N8589 G1 X190.736 Y125.875 E.04487
N8590 G1 X159.264 Y134.308 E1.0477
N8591 G1 X159.264 Y139.064 E.15296
N8592 G1 X190.736 Y170.536 E1.43118
N8593 G1 X190.736 Y168.019 E.08092
N8594 G1 X159.264 Y176.452 E1.0477
N8595 G1 X159.264 Y178.08 E.05236
N8600 G1 X159.264 Y200.736 E.01976
N8601 G1 X160.278 Y200.736 E.0326
N8602 G1 X182.108 Y119.264 E2.71223
N8603 G1 X180.48 Y119.264 E.05236
N8608 G1 X190.736 Y119.264 E.04598
N8609 G1 X190.537 Y119.264 E.00638
N8610 G1 X168.707 Y200.736 E2.71223
N8611 G1 X170.335 Y200.736 E.05236
N8613 G1 X168.707 Y200.736 E-.61876
N8614 G1 X168.803 Y200.377 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN8665 G1 Z5.4
N8666 G1 E.8 F1800
N8667 ; FEATURE: Inner wall
N8668 ; LINE_WIDTH: 0.45
N8669 ; LAYER_HEIGHT: 0.2
N8670 G1 F4421.739
N8671 M204 S8000
N8672 G1 X158.916 Y201.084 E1.03439
N8673 G1 X158.916 Y118.916 E2.64221
N8674 G1 X191.084 Y118.916 E1.03439
N8675 G1 X191.084 Y201.024 E2.64028
N8676 ; COOLING_NODE: 0
N8677 M204 S10000
N8678 G1 X191.491 Y201.491 F60000
N8679 G1 F4421.739
N8680 M204 S8000
N8681 G1 X158.509 Y201.491 E1.06057
N8682 G1 X158.509 Y118.509 E2.66839
N8683 G1 X191.491 Y118.509 E1.06057
N8684 G1 X191.491 Y201.431 E2.66646
N8685 ; COOLING_NODE: 0
N8686 M204 S10000
N8687 G1 X191.898 Y201.898 F60000
N8688 G1 F4421.739
N8689 M204 S8000
N8690 G1 X158.102 Y201.898 E1.08675
N8691 G1 X158.102 Y118.102 E2.69457
N8692 G1 X191.898 Y118.102 E1.08675
N8693 G1 X191.898 Y201.838 E2.69264
N8694 ; COOLING_NODE: 0
N8695 M204 S10000
N8696 G1 X192.29 Y202.29 F60000
N8697 ; FEATURE: Outer wall
N8698 ; LINE_WIDTH: 0.42
N8699 G1 F4773.528
N8700 M204 S5000
N8701 G1 X157.71 Y202.29 E1.03002
N8702 G1 X157.71 Y117.71 E2.51935
N8703 G1 X192.29 Y117.71 E1.03002
N8704 G1 X192.29 Y202.23 E2.51756
N8705 G1 E-.8 F1800
N8706 M204 S10000
N8707 G1 X191.532 Y194.635 Z5.8 F60000
N8708 G1 X190.736 Y186.651 Z5.8
N8709 G1 Z5.4
N8710 G1 E.8 F1800
N8711 ; FEATURE: Sparse infill
N8712 ; LINE_WIDTH: 0.45
N8713 G1 F4421.739
N8714 M204 S8000
N8715 G1 X190.736 Y185.023 E.05236
N8716 G1 X159.264 Y193.456 E1.0477
N8717 G1 X159.264 Y196.434 E.09578
N8718 G1 X163.566 Y200.736 E.19561
N8719 G1 X163.553 Y200.736 E.00042
N8720 G1 X190.736 Y193.452 E.90494
N8721 G1 X190.736 Y193.363 E.00285
N8722 G1 X159.264 Y161.892 E1.43118
N8723 G1 X159.264 Y159.741 E.06919
N8724 G1 X190.736 Y151.308 E1.0477
N8725 G1 X190.736 Y152.936 E.05236
N8726 M204 S10000
N8727 G1 X190.736 Y141.251 F60000
N8728 G1 F4421.739
N8729 M204 S8000
N8730 M73 P53 R29
N8731 G1 X190.736 Y142.879 E.05236
N8732 G1 X159.264 Y151.312 E1.0477
N8733 G1 X159.264 Y150.378 E.03001
N8734 G1 X190.736 Y181.849 E1.43118
N8735 M204 S10000
N8736 G1 X190.736 Y179.263 F60000
N8737 G1 F4421.739
N8738 M204 S8000
N8739 G1 X190.736 Y180.891 E.05236
N8740 G1 X185.418 Y200.736 E.66063
N8741 G1 X186.594 Y200.736 E.0378
N8742 G1 X159.264 Y173.406 E1.24282
N8743 G1 X159.264 Y172.516 E.02863
N8744 G1 X173.533 Y119.264 E1.77279
N8745 G1 X174.206 Y119.264 E.02164
N8746 G1 X190.736 Y135.794 E.75168
N8747 G1 X190.736 Y134.45 E.0432
N8748 G1 X159.264 Y142.883 E1.0477
N8749 G1 X159.264 Y141.059 E.05864
N8750 G1 X165.104 Y119.264 E.72557
N8751 G1 X162.692 Y119.264 E.07756
N8752 G1 X190.736 Y147.308 E1.27529
N8753 G1 X190.736 Y149.434 E.06839
N8754 G1 X176.989 Y200.736 E1.70785
N8755 G1 X175.08 Y200.736 E.06141
N8756 G1 X159.264 Y184.92 E.71922
N8757 G1 X159.264 Y185.027 E.00343
N8758 G1 X190.736 Y176.594 E1.0477
N8759 G1 X190.736 Y174.966 E.05236
N8760 M204 S10000
N8761 G1 X159.264 Y166.541 F60000
N8762 G1 F4421.739
N8763 M204 S8000
N8764 G1 X159.264 Y168.169 E.05236
N8765 G1 X190.736 Y159.737 E1.0477
N8766 G1 X190.736 Y158.822 E.02943
N8767 G1 X159.264 Y127.351 E1.43118
N8768 G1 X159.264 Y126.025 E.04261
N8769 G1 X184.497 Y119.264 E.84
N8770 G1 X185.72 Y119.264 E.03934
N8771 G1 X190.736 Y124.28 E.22808
N8772 G1 X190.736 Y126.022 E.05601
N8773 G1 X159.264 Y134.454 E1.0477
N8774 G1 X159.264 Y138.864 E.14182
N8775 G1 X190.736 Y170.336 E1.43118
N8776 G1 X190.736 Y168.166 E.06978
N8777 G1 X159.264 Y176.598 E1.0477
N8778 G1 X159.264 Y178.226 E.05236
N8779 M204 S10000
N8780 G1 X159.264 Y199.975 F60000
N8781 G1 F4421.739
N8782 M204 S8000
N8783 G1 X159.264 Y200.736 E.02447
N8784 G1 X160.132 Y200.736 E.02789
N8785 G1 X181.962 Y119.264 E2.71223
N8786 G1 X180.334 Y119.264 E.05236
N8787 M204 S10000
N8788 G1 X190.736 Y120.548 F60000
N8789 G1 F4421.739
N8790 M204 S8000
N8791 G1 X190.736 Y119.264 E.04127
N8792 G1 X190.391 Y119.264 E.01109
N8793 G1 X168.561 Y200.736 E2.71223
N8794 G1 X170.189 Y200.736 E.05236
N8795 ; WIPE_START
N8796 G1 X168.561 Y200.736 E-.61876
N8797 G1 X168.657 Y200.377 E-.14124
N8798 ; WIPE_END
N8799 G1 E-.04 F1800
N8800 M204 S10000
N8801 G17
N8802 G3 Z5.8 I1.217 J0 P1  F60000
N8803 ; stop printing object, unique label id: 372
N8804 M625
N8805 ; object ids of layer 27 start: 372
N8806 M624 AQAAAAAAAAA=
N8807 ;======== H2D 20250527========
N8808 ; SKIPPABLE_START
N8809 ; SKIPTYPE: timelapse
N8810 M622.1 S1 ; for prev firware, default turned on
N8811 
N8812 M1002 judge_flag timelapse_record_flag
N8813 
N8814 M622 J1
N8815 M993 A2 B2 C2
N8816 M993 A0 B0 C0
N8817 
N8818 
N8819 
N8820 
N8821     M9711 M0 E1 X261 Y132 Z5.8 S11 C10 O0 T3000
N8822 
N8823 
N8824 
N8825 M993 A3 B3 C3
N8826 
N8827 M623
N8828 ; SKIPPABLE_END
N8829 
N8830 ; object ids of this layer27 end: 372
N8831 M625
N8832 ; CHANGE_LAYER
N8833 ; Z_HEIGHT: 5.6
N8834 ; LAYER_HEIGHT: 0.2
N8835 ;======== H2D 20250521========
N8836 ; layer num/total_layer_count: 28/75
N8837 ; update layer progress
N8838 M73 L28
N8839 M991 S0 P27 ;notify layer change
N8840 
N8841 
N8842 ; OBJECT_ID: 372
N8843 ; COOLING_NODE: 0
N8844 ; start printing object, unique label id: 372
N8845 M624 AQAAAAAAAAA=
N8846 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=5.500G1 Z5.500 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N8672 G1 X158.916 Y201.084 E1.03439
N8673 G1 X158.916 Y118.916 E2.64221
N8674 G1 X191.084 Y118.916 E1.03439
N8675 G1 X191.084 Y201.024 E2.64028
N8681 G1 X158.509 Y201.491 E1.06057
N8682 G1 X158.509 Y118.509 E2.66839
N8683 G1 X191.491 Y118.509 E1.06057
N8684 G1 X191.491 Y201.431 E2.66646
N8690 G1 X158.102 Y201.898 E1.08675
N8691 G1 X158.102 Y118.102 E2.69457
N8692 G1 X191.898 Y118.102 E1.08675
N8693 G1 X191.898 Y201.838 E2.69264
N8701 G1 X157.71 Y202.29 E1.03002
N8702 G1 X157.71 Y117.71 E2.51935
N8703 G1 X192.29 Y117.71 E1.03002
N8704 G1 X192.29 Y202.23 E2.51756
N8715 G1 X190.736 Y185.023 E.05236
N8716 G1 X159.264 Y193.456 E1.0477
N8717 G1 X159.264 Y196.434 E.09578
N8718 G1 X163.566 Y200.736 E.19561
N8719 G1 X163.553 Y200.736 E.00042
N8720 G1 X190.736 Y193.452 E.90494
N8721 G1 X190.736 Y193.363 E.00285
N8722 G1 X159.264 Y161.892 E1.43118
N8723 G1 X159.264 Y159.741 E.06919
N8724 G1 X190.736 Y151.308 E1.0477
N8725 G1 X190.736 Y152.936 E.05236
N8731 G1 X190.736 Y142.879 E.05236
N8732 G1 X159.264 Y151.312 E1.0477
N8733 G1 X159.264 Y150.378 E.03001
N8734 G1 X190.736 Y181.849 E1.43118
N8739 G1 X190.736 Y180.891 E.05236
N8740 G1 X185.418 Y200.736 E.66063
N8741 G1 X186.594 Y200.736 E.0378
N8742 G1 X159.264 Y173.406 E1.24282
N8743 G1 X159.264 Y172.516 E.02863
N8744 G1 X173.533 Y119.264 E1.77279
N8745 G1 X174.206 Y119.264 E.02164
N8746 G1 X190.736 Y135.794 E.75168
N8747 G1 X190.736 Y134.45 E.0432
N8748 G1 X159.264 Y142.883 E1.0477
N8749 G1 X159.264 Y141.059 E.05864
N8750 G1 X165.104 Y119.264 E.72557
N8751 G1 X162.692 Y119.264 E.07756
N8752 G1 X190.736 Y147.308 E1.27529
N8753 G1 X190.736 Y149.434 E.06839
N8754 G1 X176.989 Y200.736 E1.70785
N8755 G1 X175.08 Y200.736 E.06141
N8756 G1 X159.264 Y184.92 E.71922
N8757 G1 X159.264 Y185.027 E.00343
N8758 G1 X190.736 Y176.594 E1.0477
N8759 G1 X190.736 Y174.966 E.05236
N8764 G1 X159.264 Y168.169 E.05236
N8765 G1 X190.736 Y159.737 E1.0477
N8766 G1 X190.736 Y158.822 E.02943
N8767 G1 X159.264 Y127.351 E1.43118
N8768 G1 X159.264 Y126.025 E.04261
N8769 G1 X184.497 Y119.264 E.84
N8770 G1 X185.72 Y119.264 E.03934
N8771 G1 X190.736 Y124.28 E.22808
N8772 G1 X190.736 Y126.022 E.05601
N8773 G1 X159.264 Y134.454 E1.0477
N8774 G1 X159.264 Y138.864 E.14182
N8775 G1 X190.736 Y170.336 E1.43118
N8776 G1 X190.736 Y168.166 E.06978
N8777 G1 X159.264 Y176.598 E1.0477
N8778 G1 X159.264 Y178.226 E.05236
N8783 G1 X159.264 Y200.736 E.02447
N8784 G1 X160.132 Y200.736 E.02789
N8785 G1 X181.962 Y119.264 E2.71223
N8786 G1 X180.334 Y119.264 E.05236
N8791 G1 X190.736 Y119.264 E.04127
N8792 G1 X190.391 Y119.264 E.01109
N8793 G1 X168.561 Y200.736 E2.71223
N8794 G1 X170.189 Y200.736 E.05236
N8796 G1 X168.561 Y200.736 E-.61876
N8797 G1 X168.657 Y200.377 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN8847 G1 Z5.6
N8848 G1 E.8 F1800
N8849 ; FEATURE: Inner wall
N8850 ; LINE_WIDTH: 0.45
N8851 ; LAYER_HEIGHT: 0.2
N8852 G1 F4421.739
N8853 M204 S8000
N8854 G1 X158.916 Y201.084 E1.03439
N8855 G1 X158.916 Y118.916 E2.64221
N8856 G1 X191.084 Y118.916 E1.03439
N8857 G1 X191.084 Y201.024 E2.64028
N8858 ; COOLING_NODE: 0
N8859 M204 S10000
N8860 G1 X191.491 Y201.491 F60000
N8861 G1 F4421.739
N8862 M204 S8000
N8863 G1 X158.509 Y201.491 E1.06057
N8864 G1 X158.509 Y118.509 E2.66839
N8865 G1 X191.491 Y118.509 E1.06057
N8866 G1 X191.491 Y201.431 E2.66646
N8867 ; COOLING_NODE: 0
N8868 M204 S10000
N8869 G1 X191.898 Y201.898 F60000
N8870 G1 F4421.739
N8871 M204 S8000
N8872 G1 X158.102 Y201.898 E1.08675
N8873 G1 X158.102 Y118.102 E2.69457
N8874 G1 X191.898 Y118.102 E1.08675
N8875 G1 X191.898 Y201.838 E2.69264
N8876 ; COOLING_NODE: 0
N8877 M204 S10000
N8878 G1 X192.29 Y202.29 F60000
N8879 ; FEATURE: Outer wall
N8880 ; LINE_WIDTH: 0.42
N8881 G1 F4773.528
N8882 M204 S5000
N8883 G1 X157.71 Y202.29 E1.03002
N8884 G1 X157.71 Y117.71 E2.51935
N8885 G1 X192.29 Y117.71 E1.03002
N8886 G1 X192.29 Y202.23 E2.51756
N8887 G1 E-.8 F1800
N8888 M204 S10000
N8889 G1 X184.675 Y201.718 Z6 F60000
N8890 G1 X170.043 Y200.736 Z6
N8891 G1 Z5.6
N8892 G1 E.8 F1800
N8893 ; FEATURE: Sparse infill
N8894 ; LINE_WIDTH: 0.45
N8895 G1 F4421.739
N8896 M204 S8000
N8897 G1 X168.414 Y200.736 E.05236
N8898 G1 X190.244 Y119.264 E2.71223
N8899 G1 X190.736 Y119.264 E.01579
N8900 G1 X190.736 Y120.402 E.03657
N8901 M204 S10000
N8902 G1 X180.187 Y119.264 F60000
N8903 G1 F4421.739
N8904 M204 S8000
N8905 G1 X181.816 Y119.264 E.05236
N8906 G1 X159.985 Y200.736 E2.71223
N8907 G1 X159.264 Y200.736 E.02319
N8908 G1 X159.264 Y199.828 E.02918
N8909 M204 S10000
N8910 G1 X159.264 Y178.373 F60000
N8911 M73 P53 R28
N8912 G1 F4421.739
N8913 M204 S8000
N8914 G1 X159.264 Y176.745 E.05236
N8915 G1 X190.736 Y168.312 E1.0477
N8916 G1 X190.736 Y170.136 E.05864
N8917 G1 X159.264 Y138.664 E1.43118
N8918 G1 X159.264 Y134.601 E.13068
N8919 G1 X190.736 Y126.168 E1.0477
N8920 G1 X190.736 Y124.08 E.06715
N8921 G1 X185.92 Y119.264 E.21898
N8922 G1 X185.043 Y119.264 E.0282
N8923 G1 X159.264 Y126.172 E.85819
N8924 G1 X159.264 Y127.151 E.03147
N8925 G1 X190.736 Y158.622 E1.43118
N8926 G1 X190.736 Y159.883 E.04057
N8927 G1 X159.264 Y168.316 E1.0477
N8928 G1 X159.264 Y166.687 E.05236
N8929 M204 S10000
N8930 G1 X190.736 Y178.716 F60000
N8931 G1 F4421.739
N8932 M204 S8000
N8933 G1 X190.736 Y180.345 E.05236
N8934 G1 X185.272 Y200.736 E.67882
N8935 G1 X186.794 Y200.736 E.04894
N8936 G1 X159.264 Y173.206 E1.25192
N8937 G1 X159.264 Y171.97 E.03977
N8938 G1 X173.387 Y119.264 E1.7546
N8939 G1 X174.406 Y119.264 E.03278
N8940 G1 X190.736 Y135.594 E.74259
N8941 G1 X190.736 Y134.597 E.03206
N8942 G1 X159.264 Y143.029 E1.0477
N8943 G1 X159.264 Y140.513 E.08092
N8944 G1 X164.958 Y119.264 E.70738
N8945 G1 X162.892 Y119.264 E.06642
N8946 G1 X190.736 Y147.108 E1.2662
N8947 G1 X190.736 Y148.888 E.05725
N8948 G1 X176.843 Y200.736 E1.72604
N8949 G1 X175.28 Y200.736 E.05027
N8950 G1 X159.264 Y184.72 E.72831
N8951 G1 X159.264 Y185.173 E.01457
N8952 G1 X190.736 Y176.741 E1.0477
N8953 G1 X190.736 Y175.112 E.05236
N8954 M204 S10000
N8955 G1 X190.736 Y153.083 F60000
N8956 G1 F4421.739
N8957 M204 S8000
N8958 G1 X190.736 Y151.454 E.05236
N8959 G1 X159.264 Y159.887 E1.0477
N8960 G1 X159.264 Y161.692 E.05805
N8961 G1 X190.736 Y193.163 E1.43118
N8962 G1 X190.736 Y193.598 E.01398
N8963 G1 X164.099 Y200.736 E.88675
N8964 G1 X163.766 Y200.736 E.01072
N8965 M73 P54 R28
N8966 G1 X159.264 Y196.234 E.2047
N8967 G1 X159.264 Y193.602 E.08464
N8968 G1 X190.736 Y185.17 E1.0477
N8969 G1 X190.736 Y181.649 E.11319
N8970 G1 X159.264 Y150.178 E1.43118
N8971 G1 X159.264 Y151.458 E.04115
N8972 G1 X190.736 Y143.026 E1.0477
N8973 G1 X190.736 Y141.397 E.05236
N8974 ; WIPE_START
N8975 G1 X190.736 Y143.026 E-.61876
N8976 G1 X190.377 Y143.122 E-.14124
N8977 ; WIPE_END
N8978 G1 E-.04 F1800
N8979 M204 S10000
N8980 G17
N8981 G3 Z6 I1.217 J0 P1  F60000
N8982 ; stop printing object, unique label id: 372
N8983 M625
N8984 ; object ids of layer 28 start: 372
N8985 M624 AQAAAAAAAAA=
N8986 ;======== H2D 20250527========
N8987 ; SKIPPABLE_START
N8988 ; SKIPTYPE: timelapse
N8989 M622.1 S1 ; for prev firware, default turned on
N8990 
N8991 M1002 judge_flag timelapse_record_flag
N8992 
N8993 M622 J1
N8994 M993 A2 B2 C2
N8995 M993 A0 B0 C0
N8996 
N8997 
N8998 
N8999 
N9000     M9711 M0 E1 X261 Y132 Z6 S11 C10 O0 T3000
N9001 
N9002 
N9003 
N9004 M993 A3 B3 C3
N9005 
N9006 M623
N9007 ; SKIPPABLE_END
N9008 
N9009 ; object ids of this layer28 end: 372
N9010 M625
N9011 ; CHANGE_LAYER
N9012 ; Z_HEIGHT: 5.8
N9013 ; LAYER_HEIGHT: 0.2
N9014 ;======== H2D 20250521========
N9015 ; layer num/total_layer_count: 29/75
N9016 ; update layer progress
N9017 M73 L29
N9018 M991 S0 P28 ;notify layer change
N9019 
N9020 
N9021 M106 S38.25
N9022 ; OBJECT_ID: 372
N9023 ; COOLING_NODE: 0
N9024 ; start printing object, unique label id: 372
N9025 M624 AQAAAAAAAAA=
N9026 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=5.700G1 Z5.700 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N8854 G1 X158.916 Y201.084 E1.03439
N8855 G1 X158.916 Y118.916 E2.64221
N8856 G1 X191.084 Y118.916 E1.03439
N8857 G1 X191.084 Y201.024 E2.64028
N8863 G1 X158.509 Y201.491 E1.06057
N8864 G1 X158.509 Y118.509 E2.66839
N8865 G1 X191.491 Y118.509 E1.06057
N8866 G1 X191.491 Y201.431 E2.66646
N8872 G1 X158.102 Y201.898 E1.08675
N8873 G1 X158.102 Y118.102 E2.69457
N8874 G1 X191.898 Y118.102 E1.08675
N8875 G1 X191.898 Y201.838 E2.69264
N8883 G1 X157.71 Y202.29 E1.03002
N8884 G1 X157.71 Y117.71 E2.51935
N8885 G1 X192.29 Y117.71 E1.03002
N8886 G1 X192.29 Y202.23 E2.51756
N8897 G1 X168.414 Y200.736 E.05236
N8898 G1 X190.244 Y119.264 E2.71223
N8899 G1 X190.736 Y119.264 E.01579
N8900 G1 X190.736 Y120.402 E.03657
N8905 G1 X181.816 Y119.264 E.05236
N8906 G1 X159.985 Y200.736 E2.71223
N8907 G1 X159.264 Y200.736 E.02319
N8908 G1 X159.264 Y199.828 E.02918
N8914 G1 X159.264 Y176.745 E.05236
N8915 G1 X190.736 Y168.312 E1.0477
N8916 G1 X190.736 Y170.136 E.05864
N8917 G1 X159.264 Y138.664 E1.43118
N8918 G1 X159.264 Y134.601 E.13068
N8919 G1 X190.736 Y126.168 E1.0477
N8920 G1 X190.736 Y124.08 E.06715
N8921 G1 X185.92 Y119.264 E.21898
N8922 G1 X185.043 Y119.264 E.0282
N8923 G1 X159.264 Y126.172 E.85819
N8924 G1 X159.264 Y127.151 E.03147
N8925 G1 X190.736 Y158.622 E1.43118
N8926 G1 X190.736 Y159.883 E.04057
N8927 G1 X159.264 Y168.316 E1.0477
N8928 G1 X159.264 Y166.687 E.05236
N8933 G1 X190.736 Y180.345 E.05236
N8934 G1 X185.272 Y200.736 E.67882
N8935 G1 X186.794 Y200.736 E.04894
N8936 G1 X159.264 Y173.206 E1.25192
N8937 G1 X159.264 Y171.97 E.03977
N8938 G1 X173.387 Y119.264 E1.7546
N8939 G1 X174.406 Y119.264 E.03278
N8940 G1 X190.736 Y135.594 E.74259
N8941 G1 X190.736 Y134.597 E.03206
N8942 G1 X159.264 Y143.029 E1.0477
N8943 G1 X159.264 Y140.513 E.08092
N8944 G1 X164.958 Y119.264 E.70738
N8945 G1 X162.892 Y119.264 E.06642
N8946 G1 X190.736 Y147.108 E1.2662
N8947 G1 X190.736 Y148.888 E.05725
N8948 G1 X176.843 Y200.736 E1.72604
N8949 G1 X175.28 Y200.736 E.05027
N8950 G1 X159.264 Y184.72 E.72831
N8951 G1 X159.264 Y185.173 E.01457
N8952 G1 X190.736 Y176.741 E1.0477
N8953 G1 X190.736 Y175.112 E.05236
N8958 G1 X190.736 Y151.454 E.05236
N8959 G1 X159.264 Y159.887 E1.0477
N8960 G1 X159.264 Y161.692 E.05805
N8961 G1 X190.736 Y193.163 E1.43118
N8962 G1 X190.736 Y193.598 E.01398
N8963 G1 X164.099 Y200.736 E.88675
N8964 G1 X163.766 Y200.736 E.01072
N8966 G1 X159.264 Y196.234 E.2047
N8967 G1 X159.264 Y193.602 E.08464
N8968 G1 X190.736 Y185.17 E1.0477
N8969 G1 X190.736 Y181.649 E.11319
N8970 G1 X159.264 Y150.178 E1.43118
N8971 G1 X159.264 Y151.458 E.04115
N8972 G1 X190.736 Y143.026 E1.0477
N8973 G1 X190.736 Y141.397 E.05236
N8975 G1 X190.736 Y143.026 E-.61876
N8976 G1 X190.377 Y143.122 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN9027 G1 Z5.8
N9028 G1 E.8 F1800
N9029 ; FEATURE: Inner wall
N9030 ; LINE_WIDTH: 0.45
N9031 ; LAYER_HEIGHT: 0.2
N9032 G1 F4421.739
N9033 M204 S8000
N9034 G1 X158.916 Y201.084 E1.03439
N9035 G1 X158.916 Y118.916 E2.64221
N9036 G1 X191.084 Y118.916 E1.03439
N9037 G1 X191.084 Y201.024 E2.64028
N9038 ; COOLING_NODE: 0
N9039 M204 S10000
N9040 G1 X191.491 Y201.491 F60000
N9041 G1 F4421.739
N9042 M204 S8000
N9043 G1 X158.509 Y201.491 E1.06057
N9044 G1 X158.509 Y118.509 E2.66839
N9045 G1 X191.491 Y118.509 E1.06057
N9046 G1 X191.491 Y201.431 E2.66646
N9047 ; COOLING_NODE: 0
N9048 M204 S10000
N9049 G1 X191.898 Y201.898 F60000
N9050 G1 F4421.739
N9051 M204 S8000
N9052 G1 X158.102 Y201.898 E1.08675
N9053 G1 X158.102 Y118.102 E2.69457
N9054 G1 X191.898 Y118.102 E1.08675
N9055 G1 X191.898 Y201.838 E2.69264
N9056 ; COOLING_NODE: 0
N9057 M204 S10000
N9058 G1 X192.29 Y202.29 F60000
N9059 ; FEATURE: Outer wall
N9060 ; LINE_WIDTH: 0.42
N9061 G1 F4773.528
N9062 M204 S5000
N9063 G1 X157.71 Y202.29 E1.03002
N9064 G1 X157.71 Y117.71 E2.51935
N9065 G1 X192.29 Y117.71 E1.03002
N9066 G1 X192.29 Y202.23 E2.51756
N9067 G1 E-.8 F1800
N9068 M204 S10000
N9069 G1 X184.674 Y201.722 Z6.2 F60000
N9070 G1 X169.896 Y200.736 Z6.2
N9071 G1 Z5.8
N9072 G1 E.8 F1800
N9073 ; FEATURE: Sparse infill
N9074 ; LINE_WIDTH: 0.45
N9075 G1 F4421.739
N9076 M204 S8000
N9077 G1 X168.268 Y200.736 E.05236
N9078 G1 X190.098 Y119.264 E2.71223
N9079 G1 X190.736 Y119.264 E.0205
N9080 G1 X190.736 Y120.255 E.03186
N9081 M204 S10000
N9082 G1 X180.041 Y119.264 F60000
N9083 G1 F4421.739
N9084 M204 S8000
N9085 G1 X181.669 Y119.264 E.05236
N9086 G1 X159.839 Y200.736 E2.71223
N9087 G1 X159.264 Y200.736 E.01848
N9088 G1 X159.264 Y199.682 E.03388
N9089 M204 S10000
N9090 G1 X159.264 Y178.519 F60000
N9091 G1 F4421.739
N9092 M204 S8000
N9093 G1 X159.264 Y176.891 E.05236
N9094 G1 X190.736 Y168.458 E1.04769
N9095 G1 X190.736 Y169.936 E.0475
N9096 G1 X159.264 Y138.464 E1.43118
N9097 G1 X159.264 Y134.747 E.11954
N9098 G1 X190.736 Y126.314 E1.0477
N9099 G1 X190.736 Y123.88 E.07829
N9100 G1 X186.12 Y119.264 E.20989
N9101 G1 X185.59 Y119.264 E.01707
N9102 G1 X159.264 Y126.318 E.87638
N9103 G1 X159.264 Y126.951 E.02033
N9104 G1 X190.736 Y158.422 E1.43118
N9105 G1 X190.736 Y160.03 E.05171
N9106 G1 X159.264 Y168.462 E1.0477
N9107 G1 X159.264 Y166.834 E.05236
N9108 M204 S10000
N9109 G1 X159.264 Y144.804 F60000
N9110 G1 F4421.739
N9111 M204 S8000
N9112 G1 X159.264 Y143.176 E.05236
N9113 G1 X190.736 Y134.743 E1.0477
N9114 G1 X190.736 Y135.394 E.02092
N9115 G1 X174.606 Y119.264 E.73349
N9116 G1 X173.24 Y119.264 E.04392
N9117 G1 X159.264 Y171.423 E1.73641
N9118 G1 X159.264 Y173.006 E.0509
N9119 G1 X186.994 Y200.736 E1.26101
N9120 G1 X185.125 Y200.736 E.06008
N9121 G1 X190.736 Y179.798 E.69701
N9122 G1 X190.736 Y176.887 E.09361
N9123 G1 X159.264 Y185.32 E1.0477
N9124 G1 X159.264 Y184.52 E.02571
N9125 G1 X175.48 Y200.736 E.73741
N9126 G1 X176.697 Y200.736 E.03913
N9127 G1 X190.736 Y148.342 E1.74423
N9128 G1 X190.736 Y146.908 E.04611
N9129 G1 X163.092 Y119.264 E1.2571
N9130 G1 X164.812 Y119.264 E.05528
N9131 G1 X159.264 Y139.967 E.68919
N9132 G1 X159.264 Y141.595 E.05236
N9133 M204 S10000
N9134 G1 X190.736 Y141.544 F60000
N9135 G1 F4421.739
N9136 M204 S8000
N9137 G1 X190.736 Y143.172 E.05236
N9138 G1 X159.264 Y151.605 E1.0477
N9139 G1 X159.264 Y149.978 E.05229
N9140 G1 X190.736 Y181.449 E1.43118
N9141 G1 X190.736 Y185.316 E.12433
N9142 G1 X159.264 Y193.749 E1.0477
N9143 G1 X159.264 Y196.034 E.0735
N9144 G1 X163.966 Y200.736 E.2138
N9145 G1 X164.646 Y200.736 E.02186
N9146 G1 X190.736 Y193.745 E.86856
N9147 G1 X190.736 Y192.963 E.02512
N9148 G1 X159.264 Y161.492 E1.43118
N9149 G1 X159.264 Y160.033 E.04691
N9150 G1 X190.736 Y151.601 E1.04769
N9151 G1 X190.736 Y153.229 E.05236
N9152 ; WIPE_START
N9153 G1 X190.736 Y151.601 E-.61876
N9154 G1 X190.377 Y151.697 E-.14124
N9155 ; WIPE_END
N9156 G1 E-.04 F1800
N9157 M204 S10000
N9158 G17
N9159 G3 Z6.2 I1.217 J0 P1  F60000
N9160 ; stop printing object, unique label id: 372
N9161 M625
N9162 ; object ids of layer 29 start: 372
N9163 M624 AQAAAAAAAAA=
N9164 ;======== H2D 20250527========
N9165 ; SKIPPABLE_START
N9166 ; SKIPTYPE: timelapse
N9167 M622.1 S1 ; for prev firware, default turned on
N9168 
N9169 M1002 judge_flag timelapse_record_flag
N9170 
N9171 M622 J1
N9172 M993 A2 B2 C2
N9173 M993 A0 B0 C0
N9174 
N9175 
N9176 
N9177 
N9178     M9711 M0 E1 X261 Y132 Z6.2 S11 C10 O0 T3000
N9179 
N9180 
N9181 
N9182 M993 A3 B3 C3
N9183 
N9184 M623
N9185 ; SKIPPABLE_END
N9186 
N9187 ; object ids of this layer29 end: 372
N9188 M625
N9189 ; CHANGE_LAYER
N9190 ; Z_HEIGHT: 6
N9191 ; LAYER_HEIGHT: 0.2
N9192 ;======== H2D 20250521========
N9193 ; layer num/total_layer_count: 30/75
N9194 ; update layer progress
N9195 M73 L30
N9196 M991 S0 P29 ;notify layer change
N9197 
N9198 
N9199 ; OBJECT_ID: 372
N9200 ; COOLING_NODE: 0
N9201 ; start printing object, unique label id: 372
N9202 M624 AQAAAAAAAAA=
N9203 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=5.900G1 Z5.900 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N9034 G1 X158.916 Y201.084 E1.03439
N9035 G1 X158.916 Y118.916 E2.64221
N9036 G1 X191.084 Y118.916 E1.03439
N9037 G1 X191.084 Y201.024 E2.64028
N9043 G1 X158.509 Y201.491 E1.06057
N9044 G1 X158.509 Y118.509 E2.66839
N9045 G1 X191.491 Y118.509 E1.06057
N9046 G1 X191.491 Y201.431 E2.66646
N9052 G1 X158.102 Y201.898 E1.08675
N9053 G1 X158.102 Y118.102 E2.69457
N9054 G1 X191.898 Y118.102 E1.08675
N9055 G1 X191.898 Y201.838 E2.69264
N9063 G1 X157.71 Y202.29 E1.03002
N9064 G1 X157.71 Y117.71 E2.51935
N9065 G1 X192.29 Y117.71 E1.03002
N9066 G1 X192.29 Y202.23 E2.51756
N9077 G1 X168.268 Y200.736 E.05236
N9078 G1 X190.098 Y119.264 E2.71223
N9079 G1 X190.736 Y119.264 E.0205
N9080 G1 X190.736 Y120.255 E.03186
N9085 G1 X181.669 Y119.264 E.05236
N9086 G1 X159.839 Y200.736 E2.71223
N9087 G1 X159.264 Y200.736 E.01848
N9088 G1 X159.264 Y199.682 E.03388
N9093 G1 X159.264 Y176.891 E.05236
N9094 G1 X190.736 Y168.458 E1.04769
N9095 G1 X190.736 Y169.936 E.0475
N9096 G1 X159.264 Y138.464 E1.43118
N9097 G1 X159.264 Y134.747 E.11954
N9098 G1 X190.736 Y126.314 E1.0477
N9099 G1 X190.736 Y123.88 E.07829
N9100 G1 X186.12 Y119.264 E.20989
N9101 G1 X185.59 Y119.264 E.01707
N9102 G1 X159.264 Y126.318 E.87638
N9103 G1 X159.264 Y126.951 E.02033
N9104 G1 X190.736 Y158.422 E1.43118
N9105 G1 X190.736 Y160.03 E.05171
N9106 G1 X159.264 Y168.462 E1.0477
N9107 G1 X159.264 Y166.834 E.05236
N9112 G1 X159.264 Y143.176 E.05236
N9113 G1 X190.736 Y134.743 E1.0477
N9114 G1 X190.736 Y135.394 E.02092
N9115 G1 X174.606 Y119.264 E.73349
N9116 G1 X173.24 Y119.264 E.04392
N9117 G1 X159.264 Y171.423 E1.73641
N9118 G1 X159.264 Y173.006 E.0509
N9119 G1 X186.994 Y200.736 E1.26101
N9120 G1 X185.125 Y200.736 E.06008
N9121 G1 X190.736 Y179.798 E.69701
N9122 G1 X190.736 Y176.887 E.09361
N9123 G1 X159.264 Y185.32 E1.0477
N9124 G1 X159.264 Y184.52 E.02571
N9125 G1 X175.48 Y200.736 E.73741
N9126 G1 X176.697 Y200.736 E.03913
N9127 G1 X190.736 Y148.342 E1.74423
N9128 G1 X190.736 Y146.908 E.04611
N9129 G1 X163.092 Y119.264 E1.2571
N9130 G1 X164.812 Y119.264 E.05528
N9131 G1 X159.264 Y139.967 E.68919
N9132 G1 X159.264 Y141.595 E.05236
N9137 G1 X190.736 Y143.172 E.05236
N9138 G1 X159.264 Y151.605 E1.0477
N9139 G1 X159.264 Y149.978 E.05229
N9140 G1 X190.736 Y181.449 E1.43118
N9141 G1 X190.736 Y185.316 E.12433
N9142 G1 X159.264 Y193.749 E1.0477
N9143 G1 X159.264 Y196.034 E.0735
N9144 G1 X163.966 Y200.736 E.2138
N9145 G1 X164.646 Y200.736 E.02186
N9146 G1 X190.736 Y193.745 E.86856
N9147 G1 X190.736 Y192.963 E.02512
N9148 G1 X159.264 Y161.492 E1.43118
N9149 G1 X159.264 Y160.033 E.04691
N9150 G1 X190.736 Y151.601 E1.04769
N9151 G1 X190.736 Y153.229 E.05236
N9153 G1 X190.736 Y151.601 E-.61876
N9154 G1 X190.377 Y151.697 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN9204 G1 Z6
N9205 G1 E.8 F1800
N9206 ; FEATURE: Inner wall
N9207 ; LINE_WIDTH: 0.45
N9208 ; LAYER_HEIGHT: 0.2
N9209 G1 F4421.739
N9210 M204 S8000
N9211 G1 X158.916 Y201.084 E1.03439
N9212 G1 X158.916 Y118.916 E2.64221
N9213 G1 X191.084 Y118.916 E1.03439
N9214 G1 X191.084 Y201.024 E2.64028
N9215 ; COOLING_NODE: 0
N9216 M204 S10000
N9217 G1 X191.491 Y201.491 F60000
N9218 G1 F4421.739
N9219 M204 S8000
N9220 G1 X158.509 Y201.491 E1.06057
N9221 G1 X158.509 Y118.509 E2.66839
N9222 G1 X191.491 Y118.509 E1.06057
N9223 G1 X191.491 Y201.431 E2.66646
N9224 ; COOLING_NODE: 0
N9225 M204 S10000
N9226 G1 X191.898 Y201.898 F60000
N9227 G1 F4421.739
N9228 M204 S8000
N9229 G1 X158.102 Y201.898 E1.08675
N9230 G1 X158.102 Y118.102 E2.69457
N9231 G1 X191.898 Y118.102 E1.08675
N9232 G1 X191.898 Y201.838 E2.69264
N9233 ; COOLING_NODE: 0
N9234 M204 S10000
N9235 G1 X192.29 Y202.29 F60000
N9236 ; FEATURE: Outer wall
N9237 ; LINE_WIDTH: 0.42
N9238 M73 P55 R28
N9239 G1 F4773.528
N9240 M204 S5000
N9241 G1 X157.71 Y202.29 E1.03002
N9242 G1 X157.71 Y117.71 E2.51935
N9243 G1 X192.29 Y117.71 E1.03002
N9244 G1 X192.29 Y202.23 E2.51756
N9245 G1 E-.8 F1800
N9246 M204 S10000
N9247 G1 X184.674 Y201.725 Z6.4 F60000
N9248 G1 X169.75 Y200.736 Z6.4
N9249 G1 Z6
N9250 G1 E.8 F1800
N9251 ; FEATURE: Sparse infill
N9252 ; LINE_WIDTH: 0.45
N9253 G1 F4421.739
N9254 M204 S8000
N9255 G1 X168.121 Y200.736 E.05236
N9256 G1 X189.952 Y119.264 E2.71223
N9257 G1 X190.736 Y119.264 E.02521
N9258 G1 X190.736 Y120.109 E.02715
N9259 M204 S10000
N9260 G1 X179.894 Y119.264 F60000
N9261 G1 F4421.739
N9262 M204 S8000
N9263 G1 X181.523 Y119.264 E.05236
N9264 G1 X159.693 Y200.736 E2.71223
N9265 G1 X159.264 Y200.736 E.01377
N9266 G1 X159.264 Y199.535 E.03859
N9267 M204 S10000
N9268 G1 X190.736 Y153.376 F60000
N9269 G1 F4421.739
N9270 M204 S8000
N9271 G1 X190.736 Y151.747 E.05236
N9272 G1 X159.264 Y160.18 E1.04769
N9273 G1 X159.264 Y161.292 E.03577
N9274 G1 X190.736 Y192.763 E1.43118
N9275 G1 X190.736 Y193.891 E.03626
N9276 G1 X165.192 Y200.736 E.85036
N9277 G1 X164.166 Y200.736 E.033
N9278 G1 X159.264 Y195.834 E.22289
N9279 G1 X159.264 Y193.895 E.06236
N9280 G1 X190.736 Y185.462 E1.0477
N9281 G1 X190.736 Y181.249 E.13547
N9282 G1 X159.264 Y149.778 E1.43118
N9283 G1 X159.264 Y151.751 E.06343
N9284 G1 X190.736 Y143.318 E1.0477
N9285 G1 X190.736 Y141.69 E.05236
N9286 M204 S10000
N9287 G1 X159.264 Y144.951 F60000
N9288 G1 F4421.739
N9289 M204 S8000
N9290 G1 X159.264 Y143.322 E.05236
N9291 G1 X190.736 Y134.89 E1.04769
N9292 G1 X190.736 Y135.194 E.00978
N9293 G1 X174.806 Y119.264 E.7244
N9294 G1 X173.094 Y119.264 E.05506
N9295 M73 P55 R27
N9296 G1 X159.264 Y170.877 E1.71821
N9297 G1 X159.264 Y172.806 E.06204
N9298 G1 X187.194 Y200.736 E1.27011
N9299 G1 X184.979 Y200.736 E.07122
N9300 G1 X190.736 Y179.252 E.71521
N9301 G1 X190.736 Y177.034 E.07133
N9302 G1 X159.264 Y185.466 E1.0477
N9303 G1 X159.264 Y184.32 E.03685
N9304 G1 X175.68 Y200.736 E.7465
N9305 G1 X176.55 Y200.736 E.02799
N9306 G1 X190.736 Y147.795 E1.76242
N9307 G1 X190.736 Y146.708 E.03497
N9308 G1 X163.292 Y119.264 E1.24801
N9309 G1 X164.665 Y119.264 E.04414
N9310 G1 X159.264 Y139.42 E.671
N9311 G1 X159.264 Y141.048 E.05236
N9312 M204 S10000
N9313 G1 X159.264 Y138.264 F60000
N9314 G1 F4421.739
N9315 M204 S8000
N9316 G1 X190.736 Y169.736 E1.43118
N9317 G1 X190.736 Y168.605 E.03636
N9318 G1 X159.264 Y177.037 E1.0477
N9319 G1 X159.264 Y178.666 E.05236
N9320 M204 S10000
N9321 G1 X159.264 Y166.98 F60000
N9322 G1 F4421.739
N9323 M204 S8000
N9324 G1 X159.264 Y168.609 E.05236
N9325 G1 X190.736 Y160.176 E1.0477
N9326 G1 X190.736 Y158.222 E.06285
N9327 G1 X159.264 Y126.751 E1.43118
N9328 G1 X159.264 Y126.465 E.00919
N9329 G1 X186.136 Y119.264 E.89457
N9330 G1 X186.32 Y119.264 E.00593
N9331 G1 X190.736 Y123.68 E.20079
N9332 G1 X190.736 Y126.461 E.08943
N9333 G1 X159.264 Y134.893 E1.0477
N9334 G1 X159.264 Y133.265 E.05236
N9335 ; WIPE_START
N9336 G1 X159.264 Y134.893 E-.61876
N9337 G1 X159.623 Y134.797 E-.14124
N9338 ; WIPE_END
N9339 G1 E-.04 F1800
N9340 M204 S10000
N9341 G17
N9342 G3 Z6.4 I1.217 J0 P1  F60000
N9343 ; stop printing object, unique label id: 372
N9344 M625
N9345 ; object ids of layer 30 start: 372
N9346 M624 AQAAAAAAAAA=
N9347 ;======== H2D 20250527========
N9348 ; SKIPPABLE_START
N9349 ; SKIPTYPE: timelapse
N9350 M622.1 S1 ; for prev firware, default turned on
N9351 
N9352 M1002 judge_flag timelapse_record_flag
N9353 
N9354 M622 J1
N9355 M993 A2 B2 C2
N9356 M993 A0 B0 C0
N9357 
N9358 
N9359 
N9360 
N9361     M9711 M0 E1 X261 Y132 Z6.4 S11 C10 O0 T3000
N9362 
N9363 
N9364 
N9365 M993 A3 B3 C3
N9366 
N9367 M623
N9368 ; SKIPPABLE_END
N9369 
N9370 ; object ids of this layer30 end: 372
N9371 M625
N9372 ; CHANGE_LAYER
N9373 ; Z_HEIGHT: 6.2
N9374 ; LAYER_HEIGHT: 0.2
N9375 ;======== H2D 20250521========
N9376 ; layer num/total_layer_count: 31/75
N9377 ; update layer progress
N9378 M73 L31
N9379 M991 S0 P30 ;notify layer change
N9380 
N9381 
N9382 ; OBJECT_ID: 372
N9383 ; COOLING_NODE: 0
N9384 ; start printing object, unique label id: 372
N9385 M624 AQAAAAAAAAA=
N9386 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=6.100G1 Z6.100 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N9211 G1 X158.916 Y201.084 E1.03439
N9212 G1 X158.916 Y118.916 E2.64221
N9213 G1 X191.084 Y118.916 E1.03439
N9214 G1 X191.084 Y201.024 E2.64028
N9220 G1 X158.509 Y201.491 E1.06057
N9221 G1 X158.509 Y118.509 E2.66839
N9222 G1 X191.491 Y118.509 E1.06057
N9223 G1 X191.491 Y201.431 E2.66646
N9229 G1 X158.102 Y201.898 E1.08675
N9230 G1 X158.102 Y118.102 E2.69457
N9231 G1 X191.898 Y118.102 E1.08675
N9232 G1 X191.898 Y201.838 E2.69264
N9241 G1 X157.71 Y202.29 E1.03002
N9242 G1 X157.71 Y117.71 E2.51935
N9243 G1 X192.29 Y117.71 E1.03002
N9244 G1 X192.29 Y202.23 E2.51756
N9255 G1 X168.121 Y200.736 E.05236
N9256 G1 X189.952 Y119.264 E2.71223
N9257 G1 X190.736 Y119.264 E.02521
N9258 G1 X190.736 Y120.109 E.02715
N9263 G1 X181.523 Y119.264 E.05236
N9264 G1 X159.693 Y200.736 E2.71223
N9265 G1 X159.264 Y200.736 E.01377
N9266 G1 X159.264 Y199.535 E.03859
N9271 G1 X190.736 Y151.747 E.05236
N9272 G1 X159.264 Y160.18 E1.04769
N9273 G1 X159.264 Y161.292 E.03577
N9274 G1 X190.736 Y192.763 E1.43118
N9275 G1 X190.736 Y193.891 E.03626
N9276 G1 X165.192 Y200.736 E.85036
N9277 G1 X164.166 Y200.736 E.033
N9278 G1 X159.264 Y195.834 E.22289
N9279 G1 X159.264 Y193.895 E.06236
N9280 G1 X190.736 Y185.462 E1.0477
N9281 G1 X190.736 Y181.249 E.13547
N9282 G1 X159.264 Y149.778 E1.43118
N9283 G1 X159.264 Y151.751 E.06343
N9284 G1 X190.736 Y143.318 E1.0477
N9285 G1 X190.736 Y141.69 E.05236
N9290 G1 X159.264 Y143.322 E.05236
N9291 G1 X190.736 Y134.89 E1.04769
N9292 G1 X190.736 Y135.194 E.00978
N9293 G1 X174.806 Y119.264 E.7244
N9294 G1 X173.094 Y119.264 E.05506
N9296 G1 X159.264 Y170.877 E1.71821
N9297 G1 X159.264 Y172.806 E.06204
N9298 G1 X187.194 Y200.736 E1.27011
N9299 G1 X184.979 Y200.736 E.07122
N9300 G1 X190.736 Y179.252 E.71521
N9301 G1 X190.736 Y177.034 E.07133
N9302 G1 X159.264 Y185.466 E1.0477
N9303 G1 X159.264 Y184.32 E.03685
N9304 G1 X175.68 Y200.736 E.7465
N9305 G1 X176.55 Y200.736 E.02799
N9306 G1 X190.736 Y147.795 E1.76242
N9307 G1 X190.736 Y146.708 E.03497
N9308 G1 X163.292 Y119.264 E1.24801
N9309 G1 X164.665 Y119.264 E.04414
N9310 G1 X159.264 Y139.42 E.671
N9311 G1 X159.264 Y141.048 E.05236
N9316 G1 X190.736 Y169.736 E1.43118
N9317 G1 X190.736 Y168.605 E.03636
N9318 G1 X159.264 Y177.037 E1.0477
N9319 G1 X159.264 Y178.666 E.05236
N9324 G1 X159.264 Y168.609 E.05236
N9325 G1 X190.736 Y160.176 E1.0477
N9326 G1 X190.736 Y158.222 E.06285
N9327 G1 X159.264 Y126.751 E1.43118
N9328 G1 X159.264 Y126.465 E.00919
N9329 G1 X186.136 Y119.264 E.89457
N9330 G1 X186.32 Y119.264 E.00593
N9331 G1 X190.736 Y123.68 E.20079
N9332 G1 X190.736 Y126.461 E.08943
N9333 G1 X159.264 Y134.893 E1.0477
N9334 G1 X159.264 Y133.265 E.05236
N9336 G1 X159.264 Y134.893 E-.61876
N9337 G1 X159.623 Y134.797 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN9387 G1 Z6.2
N9388 G1 E.8 F1800
N9389 ; FEATURE: Inner wall
N9390 ; LINE_WIDTH: 0.45
N9391 ; LAYER_HEIGHT: 0.2
N9392 G1 F4421.739
N9393 M204 S8000
N9394 G1 X158.916 Y201.084 E1.03439
N9395 G1 X158.916 Y118.916 E2.64221
N9396 G1 X191.084 Y118.916 E1.03439
N9397 G1 X191.084 Y201.024 E2.64028
N9398 ; COOLING_NODE: 0
N9399 M204 S10000
N9400 G1 X191.491 Y201.491 F60000
N9401 G1 F4421.739
N9402 M204 S8000
N9403 G1 X158.509 Y201.491 E1.06057
N9404 G1 X158.509 Y118.509 E2.66839
N9405 G1 X191.491 Y118.509 E1.06057
N9406 G1 X191.491 Y201.431 E2.66646
N9407 ; COOLING_NODE: 0
N9408 M204 S10000
N9409 G1 X191.898 Y201.898 F60000
N9410 G1 F4421.739
N9411 M204 S8000
N9412 G1 X158.102 Y201.898 E1.08675
N9413 G1 X158.102 Y118.102 E2.69457
N9414 G1 X191.898 Y118.102 E1.08675
N9415 G1 X191.898 Y201.838 E2.69264
N9416 ; COOLING_NODE: 0
N9417 M204 S10000
N9418 G1 X192.29 Y202.29 F60000
N9419 ; FEATURE: Outer wall
N9420 ; LINE_WIDTH: 0.42
N9421 G1 F4773.528
N9422 M204 S5000
N9423 G1 X157.71 Y202.29 E1.03002
N9424 G1 X157.71 Y117.71 E2.51935
N9425 G1 X192.29 Y117.71 E1.03002
N9426 G1 X192.29 Y202.23 E2.51756
N9427 G1 E-.8 F1800
N9428 M204 S10000
N9429 G1 X184.674 Y201.728 Z6.6 F60000
N9430 G1 X169.603 Y200.736 Z6.6
N9431 G1 Z6.2
N9432 G1 E.8 F1800
N9433 ; FEATURE: Sparse infill
N9434 ; LINE_WIDTH: 0.45
N9435 G1 F4421.739
N9436 M204 S8000
N9437 G1 X167.975 Y200.736 E.05236
N9438 G1 X189.805 Y119.264 E2.71223
N9439 G1 X190.736 Y119.264 E.02992
N9440 G1 X190.736 Y119.962 E.02244
N9441 M204 S10000
N9442 G1 X179.748 Y119.264 F60000
N9443 G1 F4421.739
N9444 M204 S8000
N9445 G1 X181.376 Y119.264 E.05236
N9446 G1 X159.546 Y200.736 E2.71223
N9447 G1 X159.264 Y200.736 E.00906
N9448 G1 X159.264 Y199.389 E.0433
N9449 M204 S10000
N9450 G1 X190.736 Y153.522 F60000
N9451 G1 F4421.739
N9452 M204 S8000
N9453 G1 X190.736 Y151.894 E.05236
N9454 G1 X159.264 Y160.326 E1.0477
N9455 G1 X159.264 Y161.092 E.02464
N9456 G1 X190.736 Y192.563 E1.43118
N9457 G1 X190.736 Y194.038 E.0474
N9458 G1 X165.738 Y200.736 E.83217
N9459 G1 X164.366 Y200.736 E.04414
N9460 G1 X159.264 Y195.634 E.23199
N9461 G1 X159.264 Y194.041 E.05122
N9462 G1 X190.736 Y185.609 E1.0477
N9463 G1 X190.736 Y181.049 E.14661
N9464 G1 X159.264 Y149.578 E1.43118
N9465 G1 X159.264 Y151.897 E.07457
N9466 M73 P56 R27
N9467 G1 X190.736 Y143.465 E1.0477
N9468 G1 X190.736 Y141.836 E.05236
N9469 M204 S10000
N9470 G1 X159.264 Y145.097 F60000
N9471 G1 F4421.739
N9472 M204 S8000
N9473 G1 X159.264 Y143.469 E.05236
N9474 G1 X190.736 Y135.036 E1.0477
N9475 G1 X190.736 Y134.994 E.00136
N9476 G1 X175.006 Y119.264 E.7153
N9477 G1 X172.948 Y119.264 E.0662
N9478 G1 X159.264 Y170.33 E1.70002
N9479 G1 X159.264 Y172.606 E.07318
N9480 G1 X187.394 Y200.736 E1.2792
N9481 G1 X184.833 Y200.736 E.08236
N9482 G1 X190.736 Y178.706 E.7334
N9483 G1 X190.736 Y177.18 E.04906
N9484 G1 X159.264 Y185.613 E1.0477
N9485 G1 X159.264 Y184.12 E.04799
N9486 G1 X175.88 Y200.736 E.7556
N9487 G1 X176.404 Y200.736 E.01685
N9488 G1 X190.736 Y147.249 E1.78061
N9489 G1 X190.736 Y146.508 E.02383
N9490 G1 X163.492 Y119.264 E1.23891
N9491 G1 X164.519 Y119.264 E.03301
N9492 G1 X159.264 Y138.874 E.65281
N9493 G1 X159.264 Y140.502 E.05236
N9494 M204 S10000
N9495 G1 X159.264 Y138.064 F60000
N9496 G1 F4421.739
N9497 M204 S8000
N9498 G1 X190.736 Y169.536 E1.43118
N9499 G1 X190.736 Y168.751 E.02522
N9500 G1 X159.264 Y177.184 E1.0477
N9501 G1 X159.264 Y178.812 E.05236
N9502 M204 S10000
N9503 G1 X159.264 Y167.127 F60000
N9504 G1 F4421.739
N9505 M204 S8000
N9506 G1 X159.264 Y168.755 E.05236
N9507 G1 X190.736 Y160.322 E1.0477
N9508 G1 X190.736 Y158.022 E.07399
N9509 G1 X159.264 Y126.551 E1.43118
N9510 G1 X159.264 Y126.611 E.00195
N9511 G1 X186.682 Y119.264 E.91276
N9512 G1 X186.52 Y119.264 E.00521
N9513 G1 X190.736 Y123.48 E.19169
N9514 G1 X190.736 Y126.607 E.10057
N9515 G1 X159.264 Y135.04 E1.0477
N9516 G1 X159.264 Y133.412 E.05236
N9517 ; WIPE_START
N9518 G1 X159.264 Y135.04 E-.61876
N9519 G1 X159.623 Y134.944 E-.14124
N9520 ; WIPE_END
N9521 G1 E-.04 F1800
N9522 M204 S10000
N9523 G17
N9524 G3 Z6.6 I1.217 J0 P1  F60000
N9525 ; stop printing object, unique label id: 372
N9526 M625
N9527 ; object ids of layer 31 start: 372
N9528 M624 AQAAAAAAAAA=
N9529 ;======== H2D 20250527========
N9530 ; SKIPPABLE_START
N9531 ; SKIPTYPE: timelapse
N9532 M622.1 S1 ; for prev firware, default turned on
N9533 
N9534 M1002 judge_flag timelapse_record_flag
N9535 
N9536 M622 J1
N9537 M993 A2 B2 C2
N9538 M993 A0 B0 C0
N9539 
N9540 
N9541 
N9542 
N9543     M9711 M0 E1 X261 Y132 Z6.6 S11 C10 O0 T3000
N9544 
N9545 
N9546 
N9547 M993 A3 B3 C3
N9548 
N9549 M623
N9550 ; SKIPPABLE_END
N9551 
N9552 ; object ids of this layer31 end: 372
N9553 M625
N9554 ; CHANGE_LAYER
N9555 ; Z_HEIGHT: 6.4
N9556 ; LAYER_HEIGHT: 0.2
N9557 ;======== H2D 20250521========
N9558 ; layer num/total_layer_count: 32/75
N9559 ; update layer progress
N9560 M73 L32
N9561 M991 S0 P31 ;notify layer change
N9562 
N9563 
N9564 ; OBJECT_ID: 372
N9565 ; COOLING_NODE: 0
N9566 ; start printing object, unique label id: 372
N9567 M624 AQAAAAAAAAA=
N9568 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=6.300G1 Z6.300 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N9394 G1 X158.916 Y201.084 E1.03439
N9395 G1 X158.916 Y118.916 E2.64221
N9396 G1 X191.084 Y118.916 E1.03439
N9397 G1 X191.084 Y201.024 E2.64028
N9403 G1 X158.509 Y201.491 E1.06057
N9404 G1 X158.509 Y118.509 E2.66839
N9405 G1 X191.491 Y118.509 E1.06057
N9406 G1 X191.491 Y201.431 E2.66646
N9412 G1 X158.102 Y201.898 E1.08675
N9413 G1 X158.102 Y118.102 E2.69457
N9414 G1 X191.898 Y118.102 E1.08675
N9415 G1 X191.898 Y201.838 E2.69264
N9423 G1 X157.71 Y202.29 E1.03002
N9424 G1 X157.71 Y117.71 E2.51935
N9425 G1 X192.29 Y117.71 E1.03002
N9426 G1 X192.29 Y202.23 E2.51756
N9437 G1 X167.975 Y200.736 E.05236
N9438 G1 X189.805 Y119.264 E2.71223
N9439 G1 X190.736 Y119.264 E.02992
N9440 G1 X190.736 Y119.962 E.02244
N9445 G1 X181.376 Y119.264 E.05236
N9446 G1 X159.546 Y200.736 E2.71223
N9447 G1 X159.264 Y200.736 E.00906
N9448 G1 X159.264 Y199.389 E.0433
N9453 G1 X190.736 Y151.894 E.05236
N9454 G1 X159.264 Y160.326 E1.0477
N9455 G1 X159.264 Y161.092 E.02464
N9456 G1 X190.736 Y192.563 E1.43118
N9457 G1 X190.736 Y194.038 E.0474
N9458 G1 X165.738 Y200.736 E.83217
N9459 G1 X164.366 Y200.736 E.04414
N9460 G1 X159.264 Y195.634 E.23199
N9461 G1 X159.264 Y194.041 E.05122
N9462 G1 X190.736 Y185.609 E1.0477
N9463 G1 X190.736 Y181.049 E.14661
N9464 G1 X159.264 Y149.578 E1.43118
N9465 G1 X159.264 Y151.897 E.07457
N9467 G1 X190.736 Y143.465 E1.0477
N9468 G1 X190.736 Y141.836 E.05236
N9473 G1 X159.264 Y143.469 E.05236
N9474 G1 X190.736 Y135.036 E1.0477
N9475 G1 X190.736 Y134.994 E.00136
N9476 G1 X175.006 Y119.264 E.7153
N9477 G1 X172.948 Y119.264 E.0662
N9478 G1 X159.264 Y170.33 E1.70002
N9479 G1 X159.264 Y172.606 E.07318
N9480 G1 X187.394 Y200.736 E1.2792
N9481 G1 X184.833 Y200.736 E.08236
N9482 G1 X190.736 Y178.706 E.7334
N9483 G1 X190.736 Y177.18 E.04906
N9484 G1 X159.264 Y185.613 E1.0477
N9485 G1 X159.264 Y184.12 E.04799
N9486 G1 X175.88 Y200.736 E.7556
N9487 G1 X176.404 Y200.736 E.01685
N9488 G1 X190.736 Y147.249 E1.78061
N9489 G1 X190.736 Y146.508 E.02383
N9490 G1 X163.492 Y119.264 E1.23891
N9491 G1 X164.519 Y119.264 E.03301
N9492 G1 X159.264 Y138.874 E.65281
N9493 G1 X159.264 Y140.502 E.05236
N9498 G1 X190.736 Y169.536 E1.43118
N9499 G1 X190.736 Y168.751 E.02522
N9500 G1 X159.264 Y177.184 E1.0477
N9501 G1 X159.264 Y178.812 E.05236
N9506 G1 X159.264 Y168.755 E.05236
N9507 G1 X190.736 Y160.322 E1.0477
N9508 G1 X190.736 Y158.022 E.07399
N9509 G1 X159.264 Y126.551 E1.43118
N9510 G1 X159.264 Y126.611 E.00195
N9511 G1 X186.682 Y119.264 E.91276
N9512 G1 X186.52 Y119.264 E.00521
N9513 G1 X190.736 Y123.48 E.19169
N9514 G1 X190.736 Y126.607 E.10057
N9515 G1 X159.264 Y135.04 E1.0477
N9516 G1 X159.264 Y133.412 E.05236
N9518 G1 X159.264 Y135.04 E-.61876
N9519 G1 X159.623 Y134.944 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN9569 G1 Z6.4
N9570 G1 E.8 F1800
N9571 ; FEATURE: Inner wall
N9572 ; LINE_WIDTH: 0.45
N9573 ; LAYER_HEIGHT: 0.2
N9574 G1 F4421.739
N9575 M204 S8000
N9576 G1 X158.916 Y201.084 E1.03439
N9577 G1 X158.916 Y118.916 E2.64221
N9578 G1 X191.084 Y118.916 E1.03439
N9579 G1 X191.084 Y201.024 E2.64028
N9580 ; COOLING_NODE: 0
N9581 M204 S10000
N9582 G1 X191.491 Y201.491 F60000
N9583 G1 F4421.739
N9584 M204 S8000
N9585 G1 X158.509 Y201.491 E1.06057
N9586 G1 X158.509 Y118.509 E2.66839
N9587 G1 X191.491 Y118.509 E1.06057
N9588 G1 X191.491 Y201.431 E2.66646
N9589 ; COOLING_NODE: 0
N9590 M204 S10000
N9591 G1 X191.898 Y201.898 F60000
N9592 G1 F4421.739
N9593 M204 S8000
N9594 G1 X158.102 Y201.898 E1.08675
N9595 G1 X158.102 Y118.102 E2.69457
N9596 G1 X191.898 Y118.102 E1.08675
N9597 G1 X191.898 Y201.838 E2.69264
N9598 ; COOLING_NODE: 0
N9599 M204 S10000
N9600 G1 X192.29 Y202.29 F60000
N9601 ; FEATURE: Outer wall
N9602 ; LINE_WIDTH: 0.42
N9603 G1 F4773.528
N9604 M204 S5000
N9605 G1 X157.71 Y202.29 E1.03002
N9606 G1 X157.71 Y117.71 E2.51935
N9607 G1 X192.29 Y117.71 E1.03002
N9608 G1 X192.29 Y202.23 E2.51756
N9609 G1 E-.8 F1800
N9610 M204 S10000
N9611 G1 X184.674 Y201.732 Z6.8 F60000
N9612 G1 X169.457 Y200.736 Z6.8
N9613 G1 Z6.4
N9614 G1 E.8 F1800
N9615 ; FEATURE: Sparse infill
N9616 ; LINE_WIDTH: 0.45
N9617 G1 F4421.739
N9618 M204 S8000
N9619 G1 X167.829 Y200.736 E.05236
N9620 G1 X189.659 Y119.264 E2.71223
N9621 G1 X187.229 Y119.264 E.07814
N9622 G1 X159.264 Y126.757 E.93095
N9623 G1 X159.264 Y126.351 E.01309
N9624 G1 X190.736 Y157.822 E1.43118
N9625 G1 X190.736 Y160.469 E.08512
N9626 G1 X159.264 Y168.901 E1.0477
N9627 M204 S10000
N9628 G1 X159.264 Y178.959 F60000
N9629 G1 F4421.739
N9630 M204 S8000
N9631 G1 X159.264 Y177.33 E.05236
N9632 G1 X190.736 Y168.898 E1.0477
N9633 G1 X190.736 Y169.336 E.01408
N9634 G1 X159.264 Y137.864 E1.43118
N9635 M204 S10000
N9636 G1 X159.264 Y139.956 F60000
N9637 G1 F4421.739
N9638 M204 S8000
N9639 G1 X159.264 Y138.327 E.05236
N9640 G1 X164.372 Y119.264 E.63462
N9641 G1 X163.692 Y119.264 E.02187
N9642 G1 X190.736 Y146.308 E1.22982
N9643 G1 X190.736 Y146.702 E.01269
N9644 G1 X176.257 Y200.736 E1.7988
N9645 G1 X176.08 Y200.736 E.00571
N9646 G1 X159.264 Y183.92 E.76469
N9647 G1 X159.264 Y185.759 E.05913
N9648 G1 X190.736 Y177.326 E1.0477
N9649 G1 X190.736 Y178.159 E.02678
N9650 G1 X184.686 Y200.736 E.75159
N9651 G1 X187.594 Y200.736 E.09349
N9652 G1 X159.264 Y172.406 E1.2883
N9653 G1 X159.264 Y169.784 E.08432
N9654 G1 X172.801 Y119.264 E1.68183
N9655 G1 X175.206 Y119.264 E.07734
N9656 G1 X190.736 Y134.794 E.70621
N9657 G1 X190.736 Y135.182 E.0125
N9658 G1 X159.264 Y143.615 E1.0477
N9659 G1 X159.264 Y145.243 E.05236
N9660 M204 S10000
N9661 G1 X159.264 Y133.558 F60000
N9662 G1 F4421.739
N9663 M204 S8000
N9664 G1 X159.264 Y135.186 E.05236
N9665 G1 X190.736 Y126.754 E1.0477
N9666 G1 X190.736 Y123.28 E.11171
N9667 G1 X186.72 Y119.264 E.1826
N9668 M204 S10000
N9669 G1 X179.602 Y119.264 F60000
N9670 G1 F4421.739
N9671 M204 S8000
N9672 G1 X181.23 Y119.264 E.05236
N9673 G1 X159.4 Y200.736 E2.71223
N9674 G1 X161.028 Y200.736 E.05236
N9675 M204 S10000
N9676 G1 X190.736 Y153.668 F60000
N9677 G1 F4421.739
N9678 M204 S8000
N9679 G1 X190.736 Y152.04 E.05236
N9680 G1 X159.264 Y160.473 E1.0477
N9681 G1 X159.264 Y160.892 E.0135
N9682 G1 X190.736 Y192.363 E1.43118
N9683 G1 X190.736 Y194.184 E.05854
N9684 M73 P56 R26
N9685 G1 X166.285 Y200.736 E.81398
N9686 G1 X164.566 Y200.736 E.05528
N9687 G1 X159.264 Y195.434 E.24108
N9688 G1 X159.264 Y194.188 E.04008
N9689 G1 X190.736 Y185.755 E1.0477
N9690 G1 X190.736 Y180.849 E.15775
N9691 G1 X159.264 Y149.378 E1.43118
N9692 G1 X159.264 Y152.044 E.08571
N9693 G1 X190.736 Y143.611 E1.0477
N9694 G1 X190.736 Y141.983 E.05236
N9695 ; WIPE_START
N9696 G1 X190.736 Y143.611 E-.61876
N9697 G1 X190.377 Y143.707 E-.14124
N9698 ; WIPE_END
N9699 G1 E-.04 F1800
N9700 M204 S10000
N9701 G17
N9702 G3 Z6.8 I1.217 J0 P1  F60000
N9703 ; stop printing object, unique label id: 372
N9704 M625
N9705 ; object ids of layer 32 start: 372
N9706 M624 AQAAAAAAAAA=
N9707 ;======== H2D 20250527========
N9708 ; SKIPPABLE_START
N9709 ; SKIPTYPE: timelapse
N9710 M622.1 S1 ; for prev firware, default turned on
N9711 
N9712 M1002 judge_flag timelapse_record_flag
N9713 
N9714 M622 J1
N9715 M993 A2 B2 C2
N9716 M993 A0 B0 C0
N9717 
N9718 
N9719 
N9720 
N9721     M9711 M0 E1 X261 Y132 Z6.8 S11 C10 O0 T3000
N9722 
N9723 
N9724 
N9725 M993 A3 B3 C3
N9726 
N9727 M623
N9728 ; SKIPPABLE_END
N9729 
N9730 ; object ids of this layer32 end: 372
N9731 M625
N9732 ; CHANGE_LAYER
N9733 ; Z_HEIGHT: 6.6
N9734 ; LAYER_HEIGHT: 0.2
N9735 ;======== H2D 20250521========
N9736 ; layer num/total_layer_count: 33/75
N9737 ; update layer progress
N9738 M73 L33
N9739 M991 S0 P32 ;notify layer change
N9740 
N9741 
N9742 M106 S40.8
N9743 ; OBJECT_ID: 372
N9744 ; COOLING_NODE: 0
N9745 ; start printing object, unique label id: 372
N9746 M624 AQAAAAAAAAA=
N9747 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=6.500G1 Z6.500 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N9576 G1 X158.916 Y201.084 E1.03439
N9577 G1 X158.916 Y118.916 E2.64221
N9578 G1 X191.084 Y118.916 E1.03439
N9579 G1 X191.084 Y201.024 E2.64028
N9585 G1 X158.509 Y201.491 E1.06057
N9586 G1 X158.509 Y118.509 E2.66839
N9587 G1 X191.491 Y118.509 E1.06057
N9588 G1 X191.491 Y201.431 E2.66646
N9594 G1 X158.102 Y201.898 E1.08675
N9595 G1 X158.102 Y118.102 E2.69457
N9596 G1 X191.898 Y118.102 E1.08675
N9597 G1 X191.898 Y201.838 E2.69264
N9605 G1 X157.71 Y202.29 E1.03002
N9606 G1 X157.71 Y117.71 E2.51935
N9607 G1 X192.29 Y117.71 E1.03002
N9608 G1 X192.29 Y202.23 E2.51756
N9619 G1 X167.829 Y200.736 E.05236
N9620 G1 X189.659 Y119.264 E2.71223
N9621 G1 X187.229 Y119.264 E.07814
N9622 G1 X159.264 Y126.757 E.93095
N9623 G1 X159.264 Y126.351 E.01309
N9624 G1 X190.736 Y157.822 E1.43118
N9625 G1 X190.736 Y160.469 E.08512
N9626 G1 X159.264 Y168.901 E1.0477
N9631 G1 X159.264 Y177.33 E.05236
N9632 G1 X190.736 Y168.898 E1.0477
N9633 G1 X190.736 Y169.336 E.01408
N9634 G1 X159.264 Y137.864 E1.43118
N9639 G1 X159.264 Y138.327 E.05236
N9640 G1 X164.372 Y119.264 E.63462
N9641 G1 X163.692 Y119.264 E.02187
N9642 G1 X190.736 Y146.308 E1.22982
N9643 G1 X190.736 Y146.702 E.01269
N9644 G1 X176.257 Y200.736 E1.7988
N9645 G1 X176.08 Y200.736 E.00571
N9646 G1 X159.264 Y183.92 E.76469
N9647 G1 X159.264 Y185.759 E.05913
N9648 G1 X190.736 Y177.326 E1.0477
N9649 G1 X190.736 Y178.159 E.02678
N9650 G1 X184.686 Y200.736 E.75159
N9651 G1 X187.594 Y200.736 E.09349
N9652 G1 X159.264 Y172.406 E1.2883
N9653 G1 X159.264 Y169.784 E.08432
N9654 G1 X172.801 Y119.264 E1.68183
N9655 G1 X175.206 Y119.264 E.07734
N9656 G1 X190.736 Y134.794 E.70621
N9657 G1 X190.736 Y135.182 E.0125
N9658 G1 X159.264 Y143.615 E1.0477
N9659 G1 X159.264 Y145.243 E.05236
N9664 G1 X159.264 Y135.186 E.05236
N9665 G1 X190.736 Y126.754 E1.0477
N9666 G1 X190.736 Y123.28 E.11171
N9667 G1 X186.72 Y119.264 E.1826
N9672 G1 X181.23 Y119.264 E.05236
N9673 G1 X159.4 Y200.736 E2.71223
N9674 G1 X161.028 Y200.736 E.05236
N9679 G1 X190.736 Y152.04 E.05236
N9680 G1 X159.264 Y160.473 E1.0477
N9681 G1 X159.264 Y160.892 E.0135
N9682 G1 X190.736 Y192.363 E1.43118
N9683 G1 X190.736 Y194.184 E.05854
N9685 G1 X166.285 Y200.736 E.81398
N9686 G1 X164.566 Y200.736 E.05528
N9687 G1 X159.264 Y195.434 E.24108
N9688 G1 X159.264 Y194.188 E.04008
N9689 G1 X190.736 Y185.755 E1.0477
N9690 G1 X190.736 Y180.849 E.15775
N9691 G1 X159.264 Y149.378 E1.43118
N9692 G1 X159.264 Y152.044 E.08571
N9693 G1 X190.736 Y143.611 E1.0477
N9694 G1 X190.736 Y141.983 E.05236
N9696 G1 X190.736 Y143.611 E-.61876
N9697 G1 X190.377 Y143.707 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN9748 G1 Z6.6
N9749 G1 E.8 F1800
N9750 ; FEATURE: Inner wall
N9751 ; LINE_WIDTH: 0.45
N9752 ; LAYER_HEIGHT: 0.2
N9753 G1 F4421.739
N9754 M204 S8000
N9755 M73 P57 R26
N9756 G1 X158.916 Y201.084 E1.03439
N9757 G1 X158.916 Y118.916 E2.64221
N9758 G1 X191.084 Y118.916 E1.03439
N9759 G1 X191.084 Y201.024 E2.64028
N9760 ; COOLING_NODE: 0
N9761 M204 S10000
N9762 G1 X191.491 Y201.491 F60000
N9763 G1 F4421.739
N9764 M204 S8000
N9765 G1 X158.509 Y201.491 E1.06057
N9766 G1 X158.509 Y118.509 E2.66839
N9767 G1 X191.491 Y118.509 E1.06057
N9768 G1 X191.491 Y201.431 E2.66646
N9769 ; COOLING_NODE: 0
N9770 M204 S10000
N9771 G1 X191.898 Y201.898 F60000
N9772 G1 F4421.739
N9773 M204 S8000
N9774 G1 X158.102 Y201.898 E1.08675
N9775 G1 X158.102 Y118.102 E2.69457
N9776 G1 X191.898 Y118.102 E1.08675
N9777 G1 X191.898 Y201.838 E2.69264
N9778 ; COOLING_NODE: 0
N9779 M204 S10000
N9780 G1 X192.29 Y202.29 F60000
N9781 ; FEATURE: Outer wall
N9782 ; LINE_WIDTH: 0.42
N9783 G1 F4773.528
N9784 M204 S5000
N9785 G1 X157.71 Y202.29 E1.03002
N9786 G1 X157.71 Y117.71 E2.51935
N9787 G1 X192.29 Y117.71 E1.03002
N9788 G1 X192.29 Y202.23 E2.51756
N9789 G1 E-.8 F1800
N9790 M204 S10000
N9791 G1 X184.672 Y201.767 Z7 F60000
N9792 G1 X167.682 Y200.736 Z7
N9793 G1 Z6.6
N9794 G1 E.8 F1800
N9795 ; FEATURE: Sparse infill
N9796 ; LINE_WIDTH: 0.45
N9797 G1 F4421.739
N9798 M204 S8000
N9799 G1 X189.512 Y119.264 E2.71223
N9800 G1 X187.775 Y119.264 E.05586
N9801 G1 X159.264 Y126.904 E.94914
N9802 G1 X159.264 Y126.151 E.02423
N9803 G1 X190.736 Y157.622 E1.43118
N9804 G1 X190.736 Y160.615 E.09626
N9805 G1 X159.264 Y169.048 E1.04769
N9806 G1 X159.264 Y169.238 E.0061
N9807 G1 X172.655 Y119.264 E1.66364
N9808 G1 X175.406 Y119.264 E.08848
N9809 G1 X190.736 Y134.594 E.69711
N9810 G1 X190.736 Y135.329 E.02364
N9811 G1 X159.264 Y143.761 E1.0477
N9812 G1 X159.264 Y142.133 E.05236
N9813 M204 S10000
N9814 G1 X159.264 Y133.704 F60000
N9815 G1 F4421.739
N9816 M204 S8000
N9817 G1 X159.264 Y135.333 E.05236
N9818 G1 X190.736 Y126.9 E1.0477
N9819 G1 X190.736 Y123.08 E.12285
N9820 G1 X186.92 Y119.264 E.1735
N9821 M204 S10000
N9822 G1 X179.455 Y119.264 F60000
N9823 G1 F4421.739
N9824 M204 S8000
N9825 G1 X181.084 Y119.264 E.05236
N9826 G1 X159.264 Y200.694 E2.71086
N9827 G1 X159.264 Y200.736 E.00133
N9828 G1 X160.852 Y200.736 E.05104
N9829 M204 S10000
N9830 G1 X159.264 Y179.105 F60000
N9831 G1 F4421.739
N9832 M204 S8000
N9833 G1 X159.264 Y177.477 E.05236
N9834 G1 X190.736 Y169.044 E1.0477
N9835 G1 X190.736 Y169.136 E.00294
N9836 G1 X159.264 Y137.664 E1.43118
N9837 G1 X159.264 Y137.781 E.00375
N9838 G1 X164.226 Y119.264 E.61643
N9839 G1 X163.892 Y119.264 E.01073
N9840 G1 X190.736 Y146.108 E1.22072
N9841 G1 X190.736 Y146.156 E.00156
N9842 G1 X176.111 Y200.736 E1.81699
N9843 G1 X176.28 Y200.736 E.00543
N9844 G1 X159.264 Y183.72 E.77379
N9845 G1 X159.264 Y185.905 E.07027
N9846 G1 X190.736 Y177.473 E1.04769
N9847 G1 X190.736 Y177.613 E.0045
N9848 G1 X184.54 Y200.736 E.76978
N9849 G1 X187.794 Y200.736 E.10463
N9850 G1 X159.264 Y172.206 E1.29739
N9851 G1 X159.264 Y173.835 E.05236
N9852 M204 S10000
N9853 G1 X190.736 Y153.815 F60000
N9854 G1 F4421.739
N9855 M204 S8000
N9856 G1 X190.736 Y152.186 E.05236
N9857 G1 X159.264 Y160.619 E1.0477
N9858 G1 X159.264 Y160.692 E.00236
N9859 G1 X190.736 Y192.163 E1.43118
N9860 G1 X190.736 Y194.33 E.06968
N9861 G1 X166.831 Y200.736 E.79579
N9862 G1 X164.766 Y200.736 E.06641
N9863 G1 X159.264 Y195.234 E.25018
N9864 G1 X159.264 Y194.334 E.02894
N9865 G1 X190.736 Y185.902 E1.0477
N9866 G1 X190.736 Y180.649 E.16889
N9867 G1 X159.264 Y149.178 E1.43118
N9868 G1 X159.264 Y152.19 E.09685
N9869 G1 X190.736 Y143.758 E1.0477
N9870 G1 X190.736 Y142.129 E.05236
N9871 ; WIPE_START
N9872 G1 X190.736 Y143.758 E-.61876
N9873 G1 X190.377 Y143.854 E-.14124
N9874 ; WIPE_END
N9875 G1 E-.04 F1800
N9876 M204 S10000
N9877 G17
N9878 G3 Z7 I1.217 J0 P1  F60000
N9879 ; stop printing object, unique label id: 372
N9880 M625
N9881 ; object ids of layer 33 start: 372
N9882 M624 AQAAAAAAAAA=
N9883 ;======== H2D 20250527========
N9884 ; SKIPPABLE_START
N9885 ; SKIPTYPE: timelapse
N9886 M622.1 S1 ; for prev firware, default turned on
N9887 
N9888 M1002 judge_flag timelapse_record_flag
N9889 
N9890 M622 J1
N9891 M993 A2 B2 C2
N9892 M993 A0 B0 C0
N9893 
N9894 
N9895 
N9896 
N9897     M9711 M0 E1 X261 Y132 Z7 S11 C10 O0 T3000
N9898 
N9899 
N9900 
N9901 M993 A3 B3 C3
N9902 
N9903 M623
N9904 ; SKIPPABLE_END
N9905 
N9906 ; object ids of this layer33 end: 372
N9907 M625
N9908 ; CHANGE_LAYER
N9909 ; Z_HEIGHT: 6.8
N9910 ; LAYER_HEIGHT: 0.2
N9911 ;======== H2D 20250521========
N9912 ; layer num/total_layer_count: 34/75
N9913 ; update layer progress
N9914 M73 L34
N9915 M991 S0 P33 ;notify layer change
N9916 
N9917 
N9918 M106 S38.25
N9919 ; OBJECT_ID: 372
N9920 ; COOLING_NODE: 0
N9921 ; start printing object, unique label id: 372
N9922 M624 AQAAAAAAAAA=
N9923 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=6.700G1 Z6.700 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N9756 G1 X158.916 Y201.084 E1.03439
N9757 G1 X158.916 Y118.916 E2.64221
N9758 G1 X191.084 Y118.916 E1.03439
N9759 G1 X191.084 Y201.024 E2.64028
N9765 G1 X158.509 Y201.491 E1.06057
N9766 G1 X158.509 Y118.509 E2.66839
N9767 G1 X191.491 Y118.509 E1.06057
N9768 G1 X191.491 Y201.431 E2.66646
N9774 G1 X158.102 Y201.898 E1.08675
N9775 G1 X158.102 Y118.102 E2.69457
N9776 G1 X191.898 Y118.102 E1.08675
N9777 G1 X191.898 Y201.838 E2.69264
N9785 G1 X157.71 Y202.29 E1.03002
N9786 G1 X157.71 Y117.71 E2.51935
N9787 G1 X192.29 Y117.71 E1.03002
N9788 G1 X192.29 Y202.23 E2.51756
N9799 G1 X189.512 Y119.264 E2.71223
N9800 G1 X187.775 Y119.264 E.05586
N9801 G1 X159.264 Y126.904 E.94914
N9802 G1 X159.264 Y126.151 E.02423
N9803 G1 X190.736 Y157.622 E1.43118
N9804 G1 X190.736 Y160.615 E.09626
N9805 G1 X159.264 Y169.048 E1.04769
N9806 G1 X159.264 Y169.238 E.0061
N9807 G1 X172.655 Y119.264 E1.66364
N9808 G1 X175.406 Y119.264 E.08848
N9809 G1 X190.736 Y134.594 E.69711
N9810 G1 X190.736 Y135.329 E.02364
N9811 G1 X159.264 Y143.761 E1.0477
N9812 G1 X159.264 Y142.133 E.05236
N9817 G1 X159.264 Y135.333 E.05236
N9818 G1 X190.736 Y126.9 E1.0477
N9819 G1 X190.736 Y123.08 E.12285
N9820 G1 X186.92 Y119.264 E.1735
N9825 G1 X181.084 Y119.264 E.05236
N9826 G1 X159.264 Y200.694 E2.71086
N9827 G1 X159.264 Y200.736 E.00133
N9828 G1 X160.852 Y200.736 E.05104
N9833 G1 X159.264 Y177.477 E.05236
N9834 G1 X190.736 Y169.044 E1.0477
N9835 G1 X190.736 Y169.136 E.00294
N9836 G1 X159.264 Y137.664 E1.43118
N9837 G1 X159.264 Y137.781 E.00375
N9838 G1 X164.226 Y119.264 E.61643
N9839 G1 X163.892 Y119.264 E.01073
N9840 G1 X190.736 Y146.108 E1.22072
N9841 G1 X190.736 Y146.156 E.00156
N9842 G1 X176.111 Y200.736 E1.81699
N9843 G1 X176.28 Y200.736 E.00543
N9844 G1 X159.264 Y183.72 E.77379
N9845 G1 X159.264 Y185.905 E.07027
N9846 G1 X190.736 Y177.473 E1.04769
N9847 G1 X190.736 Y177.613 E.0045
N9848 G1 X184.54 Y200.736 E.76978
N9849 G1 X187.794 Y200.736 E.10463
N9850 G1 X159.264 Y172.206 E1.29739
N9851 G1 X159.264 Y173.835 E.05236
N9856 G1 X190.736 Y152.186 E.05236
N9857 G1 X159.264 Y160.619 E1.0477
N9858 G1 X159.264 Y160.692 E.00236
N9859 G1 X190.736 Y192.163 E1.43118
N9860 G1 X190.736 Y194.33 E.06968
N9861 G1 X166.831 Y200.736 E.79579
N9862 G1 X164.766 Y200.736 E.06641
N9863 G1 X159.264 Y195.234 E.25018
N9864 G1 X159.264 Y194.334 E.02894
N9865 G1 X190.736 Y185.902 E1.0477
N9866 G1 X190.736 Y180.649 E.16889
N9867 G1 X159.264 Y149.178 E1.43118
N9868 G1 X159.264 Y152.19 E.09685
N9869 G1 X190.736 Y143.758 E1.0477
N9870 G1 X190.736 Y142.129 E.05236
N9872 G1 X190.736 Y143.758 E-.61876
N9873 G1 X190.377 Y143.854 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN9924 G1 Z6.8
N9925 G1 E.8 F1800
N9926 ; FEATURE: Inner wall
N9927 ; LINE_WIDTH: 0.45
N9928 ; LAYER_HEIGHT: 0.2
N9929 G1 F4421.739
N9930 M204 S8000
N9931 G1 X158.916 Y201.084 E1.03439
N9932 G1 X158.916 Y118.916 E2.64221
N9933 G1 X191.084 Y118.916 E1.03439
N9934 G1 X191.084 Y201.024 E2.64028
N9935 ; COOLING_NODE: 0
N9936 M204 S10000
N9937 G1 X191.491 Y201.491 F60000
N9938 G1 F4421.739
N9939 M204 S8000
N9940 G1 X158.509 Y201.491 E1.06057
N9941 G1 X158.509 Y118.509 E2.66839
N9942 G1 X191.491 Y118.509 E1.06057
N9943 G1 X191.491 Y201.431 E2.66646
N9944 ; COOLING_NODE: 0
N9945 M204 S10000
N9946 G1 X191.898 Y201.898 F60000
N9947 G1 F4421.739
N9948 M204 S8000
N9949 G1 X158.102 Y201.898 E1.08675
N9950 G1 X158.102 Y118.102 E2.69457
N9951 G1 X191.898 Y118.102 E1.08675
N9952 G1 X191.898 Y201.838 E2.69264
N9953 ; COOLING_NODE: 0
N9954 M204 S10000
N9955 G1 X192.29 Y202.29 F60000
N9956 ; FEATURE: Outer wall
N9957 ; LINE_WIDTH: 0.42
N9958 G1 F4773.528
N9959 M204 S5000
N9960 G1 X157.71 Y202.29 E1.03002
N9961 G1 X157.71 Y117.71 E2.51935
N9962 G1 X192.29 Y117.71 E1.03002
N9963 G1 X192.29 Y202.23 E2.51756
N9964 G1 E-.8 F1800
N9965 M204 S10000
N9966 M73 P58 R26
N9967 G1 X191.809 Y194.613 Z7.2 F60000
N9968 G1 X190.736 Y177.619 Z7.2
N9969 G1 Z6.8
N9970 G1 E.8 F1800
N9971 ; FEATURE: Sparse infill
N9972 ; LINE_WIDTH: 0.45
N9973 G1 F4421.739
N9974 M204 S8000
N9975 G1 X159.264 Y186.052 E1.0477
N9976 G1 X159.264 Y183.52 E.08141
N9977 G1 X176.48 Y200.736 E.78288
N9978 G1 X175.965 Y200.736 E.01657
N9979 G1 X190.736 Y145.61 E1.83518
N9980 G1 X190.736 Y145.908 E.00958
N9981 G1 X164.08 Y119.264 E1.21192
N9982 G1 X159.264 Y137.235 E.59824
N9983 G1 X159.264 Y137.464 E.00739
N9984 G1 X190.736 Y168.936 E1.43118
N9985 G1 X190.736 Y169.19 E.0082
N9986 G1 X159.264 Y177.623 E1.0477
N9987 G1 X159.264 Y172.006 E.18061
N9988 G1 X187.994 Y200.736 E1.30649
N9989 G1 X184.393 Y200.736 E.11577
N9990 G1 X190.736 Y177.066 E.78797
N9991 G1 X190.736 Y175.438 E.05236
N9992 M204 S10000
N9993 G1 X159.264 Y142.28 F60000
N9994 G1 F4421.739
N9995 M204 S8000
N9996 G1 X159.264 Y143.908 E.05236
N9997 G1 X190.736 Y135.475 E1.0477
N9998 G1 X190.736 Y134.394 E.03478
N9999 G1 X175.606 Y119.264 E.68802
N10000 G1 X172.508 Y119.264 E.09962
N10001 G1 X159.264 Y168.691 E1.64545
N10002 G1 X159.264 Y169.194 E.01618
N10003 G1 X190.736 Y160.762 E1.0477
N10004 G1 X190.736 Y157.422 E.1074
N10005 G1 X159.264 Y125.951 E1.43118
N10006 G1 X159.264 Y127.05 E.03536
N10007 G1 X188.322 Y119.264 E.96733
N10008 G1 X189.366 Y119.264 E.03358
N10009 G1 X167.536 Y200.736 E2.71223
N10010 G1 X167.378 Y200.736 E.00509
N10011 G1 X190.736 Y194.477 E.7776
N10012 G1 X190.736 Y191.963 E.08082
N10013 G1 X159.264 Y160.492 E1.43118
N10014 G1 X159.264 Y160.765 E.00878
N10015 G1 X190.736 Y152.333 E1.0477
N10016 G1 X190.736 Y150.705 E.05236
N10017 M204 S10000
N10018 G1 X190.736 Y142.276 F60000
N10019 G1 F4421.739
N10020 M204 S8000
N10021 G1 X190.736 Y143.904 E.05236
N10022 G1 X159.264 Y152.337 E1.04769
N10023 G1 X159.264 Y148.978 E.10799
N10024 G1 X190.736 Y180.449 E1.43118
N10025 G1 X190.736 Y186.048 E.18003
N10026 G1 X159.264 Y194.481 E1.0477
N10027 G1 X159.264 Y195.034 E.0178
N10028 G1 X164.966 Y200.736 E.25927
N10029 G1 X159.264 Y200.736 E.18333
N10030 G1 X159.264 Y200.148 E.0189
N10031 G1 X180.937 Y119.264 E2.69267
N10032 G1 X182.565 Y119.264 E.05236
N10033 M204 S10000
N10034 G1 X187.12 Y119.264 F60000
N10035 G1 F4421.739
N10036 M204 S8000
N10037 G1 X190.736 Y122.88 E.16441
N10038 G1 X190.736 Y127.046 E.13399
N10039 G1 X159.264 Y135.479 E1.0477
N10040 G1 X159.264 Y133.851 E.05236
N10041 ; WIPE_START
N10042 G1 X159.264 Y135.479 E-.61876
N10043 G1 X159.623 Y135.383 E-.14124
N10044 ; WIPE_END
N10045 G1 E-.04 F1800
N10046 M204 S10000
N10047 G17
N10048 G3 Z7.2 I1.217 J0 P1  F60000
N10049 ; stop printing object, unique label id: 372
N10050 M625
N10051 ; object ids of layer 34 start: 372
N10052 M624 AQAAAAAAAAA=
N10053 ;======== H2D 20250527========
N10054 ; SKIPPABLE_START
N10055 ; SKIPTYPE: timelapse
N10056 M622.1 S1 ; for prev firware, default turned on
N10057 
N10058 M1002 judge_flag timelapse_record_flag
N10059 
N10060 M622 J1
N10061 M993 A2 B2 C2
N10062 M993 A0 B0 C0
N10063 
N10064 
N10065 
N10066 
N10067     M9711 M0 E1 X261 Y132 Z7.2 S11 C10 O0 T3000
N10068 
N10069 
N10070 
N10071 M993 A3 B3 C3
N10072 
N10073 M623
N10074 ; SKIPPABLE_END
N10075 
N10076 ; object ids of this layer34 end: 372
N10077 M625
N10078 ; CHANGE_LAYER
N10079 ; Z_HEIGHT: 7
N10080 ; LAYER_HEIGHT: 0.2
N10081 ;======== H2D 20250521========
N10082 ; layer num/total_layer_count: 35/75
N10083 ; update layer progress
N10084 M73 L35
N10085 M991 S0 P34 ;notify layer change
N10086 
N10087 
N10088 ; OBJECT_ID: 372
N10089 ; COOLING_NODE: 0
N10090 ; start printing object, unique label id: 372
N10091 M624 AQAAAAAAAAA=
N10092 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=6.900G1 Z6.900 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N9931 G1 X158.916 Y201.084 E1.03439
N9932 G1 X158.916 Y118.916 E2.64221
N9933 G1 X191.084 Y118.916 E1.03439
N9934 G1 X191.084 Y201.024 E2.64028
N9940 G1 X158.509 Y201.491 E1.06057
N9941 G1 X158.509 Y118.509 E2.66839
N9942 G1 X191.491 Y118.509 E1.06057
N9943 G1 X191.491 Y201.431 E2.66646
N9949 G1 X158.102 Y201.898 E1.08675
N9950 G1 X158.102 Y118.102 E2.69457
N9951 G1 X191.898 Y118.102 E1.08675
N9952 G1 X191.898 Y201.838 E2.69264
N9960 G1 X157.71 Y202.29 E1.03002
N9961 G1 X157.71 Y117.71 E2.51935
N9962 G1 X192.29 Y117.71 E1.03002
N9963 G1 X192.29 Y202.23 E2.51756
N9975 G1 X159.264 Y186.052 E1.0477
N9976 G1 X159.264 Y183.52 E.08141
N9977 G1 X176.48 Y200.736 E.78288
N9978 G1 X175.965 Y200.736 E.01657
N9979 G1 X190.736 Y145.61 E1.83518
N9980 G1 X190.736 Y145.908 E.00958
N9981 G1 X164.08 Y119.264 E1.21192
N9982 G1 X159.264 Y137.235 E.59824
N9983 G1 X159.264 Y137.464 E.00739
N9984 G1 X190.736 Y168.936 E1.43118
N9985 G1 X190.736 Y169.19 E.0082
N9986 G1 X159.264 Y177.623 E1.0477
N9987 G1 X159.264 Y172.006 E.18061
N9988 G1 X187.994 Y200.736 E1.30649
N9989 G1 X184.393 Y200.736 E.11577
N9990 G1 X190.736 Y177.066 E.78797
N9991 G1 X190.736 Y175.438 E.05236
N9996 G1 X159.264 Y143.908 E.05236
N9997 G1 X190.736 Y135.475 E1.0477
N9998 G1 X190.736 Y134.394 E.03478
N9999 G1 X175.606 Y119.264 E.68802
N10000 G1 X172.508 Y119.264 E.09962
N10001 G1 X159.264 Y168.691 E1.64545
N10002 G1 X159.264 Y169.194 E.01618
N10003 G1 X190.736 Y160.762 E1.0477
N10004 G1 X190.736 Y157.422 E.1074
N10005 G1 X159.264 Y125.951 E1.43118
N10006 G1 X159.264 Y127.05 E.03536
N10007 G1 X188.322 Y119.264 E.96733
N10008 G1 X189.366 Y119.264 E.03358
N10009 G1 X167.536 Y200.736 E2.71223
N10010 G1 X167.378 Y200.736 E.00509
N10011 G1 X190.736 Y194.477 E.7776
N10012 G1 X190.736 Y191.963 E.08082
N10013 G1 X159.264 Y160.492 E1.43118
N10014 G1 X159.264 Y160.765 E.00878
N10015 G1 X190.736 Y152.333 E1.0477
N10016 G1 X190.736 Y150.705 E.05236
N10021 G1 X190.736 Y143.904 E.05236
N10022 G1 X159.264 Y152.337 E1.04769
N10023 G1 X159.264 Y148.978 E.10799
N10024 G1 X190.736 Y180.449 E1.43118
N10025 G1 X190.736 Y186.048 E.18003
N10026 G1 X159.264 Y194.481 E1.0477
N10027 G1 X159.264 Y195.034 E.0178
N10028 G1 X164.966 Y200.736 E.25927
N10029 G1 X159.264 Y200.736 E.18333
N10030 G1 X159.264 Y200.148 E.0189
N10031 G1 X180.937 Y119.264 E2.69267
N10032 G1 X182.565 Y119.264 E.05236
N10037 G1 X190.736 Y122.88 E.16441
N10038 G1 X190.736 Y127.046 E.13399
N10039 G1 X159.264 Y135.479 E1.0477
N10040 G1 X159.264 Y133.851 E.05236
N10042 G1 X159.264 Y135.479 E-.61876
N10043 G1 X159.623 Y135.383 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN10093 G1 Z7
N10094 G1 E.8 F1800
N10095 ; FEATURE: Inner wall
N10096 ; LINE_WIDTH: 0.45
N10097 ; LAYER_HEIGHT: 0.2
N10098 G1 F4421.739
N10099 M204 S8000
N10100 G1 X158.916 Y201.084 E1.03439
N10101 G1 X158.916 Y118.916 E2.64221
N10102 G1 X191.084 Y118.916 E1.03439
N10103 G1 X191.084 Y201.024 E2.64028
N10104 ; COOLING_NODE: 0
N10105 M204 S10000
N10106 G1 X191.491 Y201.491 F60000
N10107 G1 F4421.739
N10108 M204 S8000
N10109 M73 P58 R25
N10110 G1 X158.509 Y201.491 E1.06057
N10111 G1 X158.509 Y118.509 E2.66839
N10112 G1 X191.491 Y118.509 E1.06057
N10113 G1 X191.491 Y201.431 E2.66646
N10114 ; COOLING_NODE: 0
N10115 M204 S10000
N10116 G1 X191.898 Y201.898 F60000
N10117 G1 F4421.739
N10118 M204 S8000
N10119 G1 X158.102 Y201.898 E1.08675
N10120 G1 X158.102 Y118.102 E2.69457
N10121 G1 X191.898 Y118.102 E1.08675
N10122 G1 X191.898 Y201.838 E2.69264
N10123 ; COOLING_NODE: 0
N10124 M204 S10000
N10125 G1 X192.29 Y202.29 F60000
N10126 ; FEATURE: Outer wall
N10127 ; LINE_WIDTH: 0.42
N10128 G1 F4773.528
N10129 M204 S5000
N10130 G1 X157.71 Y202.29 E1.03002
N10131 G1 X157.71 Y117.71 E2.51935
N10132 G1 X192.29 Y117.71 E1.03002
N10133 G1 X192.29 Y202.23 E2.51756
N10134 G1 E-.8 F1800
N10135 M204 S10000
N10136 G1 X191.806 Y194.613 Z7.4 F60000
N10137 G1 X190.736 Y177.766 Z7.4
N10138 G1 Z7
N10139 G1 E.8 F1800
N10140 ; FEATURE: Sparse infill
N10141 ; LINE_WIDTH: 0.45
N10142 G1 F4421.739
N10143 M204 S8000
N10144 G1 X159.264 Y186.198 E1.0477
N10145 G1 X159.264 Y183.32 E.09255
N10146 G1 X176.68 Y200.736 E.79198
N10147 G1 X175.818 Y200.736 E.0277
N10148 G1 X190.736 Y145.063 E1.85337
N10149 G1 X190.736 Y144.05 E.03257
N10150 G1 X159.264 Y152.483 E1.0477
N10151 G1 X159.264 Y148.778 E.11913
N10152 G1 X190.736 Y180.249 E1.43118
N10153 G1 X190.736 Y186.194 E.19117
N10154 G1 X159.264 Y194.627 E1.0477
N10155 G1 X159.264 Y194.834 E.00666
N10156 G1 X165.166 Y200.736 E.26837
N10157 G1 X159.264 Y200.736 E.18977
N10158 G1 X159.264 Y199.602 E.03647
N10159 G1 X180.791 Y119.264 E2.67448
N10160 G1 X187.32 Y119.264 E.20997
N10161 G1 X190.736 Y122.68 E.15531
N10162 G1 X190.736 Y127.193 E.14512
N10163 G1 X159.264 Y135.625 E1.0477
N10164 M204 S10000
N10165 G1 X159.264 Y142.426 F60000
N10166 G1 F4421.739
N10167 M204 S8000
N10168 G1 X159.264 Y144.054 E.05236
N10169 G1 X190.736 Y135.622 E1.0477
N10170 G1 X190.736 Y134.194 E.04592
N10171 G1 X175.806 Y119.264 E.67892
N10172 G1 X172.362 Y119.264 E.11076
N10173 G1 X159.264 Y168.145 E1.62726
N10174 G1 X159.264 Y169.341 E.03845
N10175 G1 X190.736 Y160.908 E1.0477
N10176 G1 X190.736 Y157.222 E.11854
N10177 G1 X159.264 Y125.751 E1.43118
N10178 G1 X159.264 Y127.197 E.0465
N10179 G1 X188.868 Y119.264 E.98552
N10180 M73 P59 R25
N10181 G1 X189.22 Y119.264 E.0113
N10182 G1 X167.389 Y200.736 E2.71223
N10183 G1 X167.924 Y200.736 E.01719
N10184 G1 X190.736 Y194.623 E.75941
N10185 G1 X190.736 Y191.763 E.09196
N10186 G1 X159.264 Y160.292 E1.43118
N10187 G1 X159.264 Y160.912 E.01992
N10188 G1 X190.736 Y152.479 E1.0477
N10189 G1 X190.736 Y150.851 E.05236
N10190 M204 S10000
N10191 G1 X190.736 Y145.708 F60000
N10192 G1 F4421.739
N10193 M204 S8000
N10194 G1 X164.292 Y119.264 E1.20253
N10195 G1 X163.933 Y119.264 E.01155
N10196 G1 X159.264 Y136.688 E.58005
N10197 G1 X159.264 Y137.264 E.01853
N10198 G1 X190.736 Y168.736 E1.43118
N10199 G1 X190.736 Y169.337 E.01933
N10200 G1 X159.264 Y177.769 E1.0477
N10201 G1 X159.264 Y171.806 E.19175
N10202 G1 X188.194 Y200.736 E1.31558
N10203 G1 X184.247 Y200.736 E.12691
N10204 G1 X190.736 Y176.52 E.80616
N10205 G1 X190.736 Y174.892 E.05236
N10206 ; WIPE_START
N10207 G1 X190.736 Y176.52 E-.61876
N10208 G1 X190.639 Y176.879 E-.14124
N10209 ; WIPE_END
N10210 G1 E-.04 F1800
N10211 M204 S10000
N10212 G17
N10213 G3 Z7.4 I1.217 J0 P1  F60000
N10214 ; stop printing object, unique label id: 372
N10215 M625
N10216 ; object ids of layer 35 start: 372
N10217 M624 AQAAAAAAAAA=
N10218 ;======== H2D 20250527========
N10219 ; SKIPPABLE_START
N10220 ; SKIPTYPE: timelapse
N10221 M622.1 S1 ; for prev firware, default turned on
N10222 
N10223 M1002 judge_flag timelapse_record_flag
N10224 
N10225 M622 J1
N10226 M993 A2 B2 C2
N10227 M993 A0 B0 C0
N10228 
N10229 
N10230 
N10231 
N10232     M9711 M0 E1 X261 Y132 Z7.4 S11 C10 O0 T3000
N10233 
N10234 
N10235 
N10236 M993 A3 B3 C3
N10237 
N10238 M623
N10239 ; SKIPPABLE_END
N10240 
N10241 ; object ids of this layer35 end: 372
N10242 M625
N10243 ; CHANGE_LAYER
N10244 ; Z_HEIGHT: 7.2
N10245 ; LAYER_HEIGHT: 0.2
N10246 ;======== H2D 20250521========
N10247 ; layer num/total_layer_count: 36/75
N10248 ; update layer progress
N10249 M73 L36
N10250 M991 S0 P35 ;notify layer change
N10251 
N10252 
N10253 ; OBJECT_ID: 372
N10254 ; COOLING_NODE: 0
N10255 ; start printing object, unique label id: 372
N10256 M624 AQAAAAAAAAA=
N10257 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=7.100G1 Z7.100 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N10100 G1 X158.916 Y201.084 E1.03439
N10101 G1 X158.916 Y118.916 E2.64221
N10102 G1 X191.084 Y118.916 E1.03439
N10103 G1 X191.084 Y201.024 E2.64028
N10110 G1 X158.509 Y201.491 E1.06057
N10111 G1 X158.509 Y118.509 E2.66839
N10112 G1 X191.491 Y118.509 E1.06057
N10113 G1 X191.491 Y201.431 E2.66646
N10119 G1 X158.102 Y201.898 E1.08675
N10120 G1 X158.102 Y118.102 E2.69457
N10121 G1 X191.898 Y118.102 E1.08675
N10122 G1 X191.898 Y201.838 E2.69264
N10130 G1 X157.71 Y202.29 E1.03002
N10131 G1 X157.71 Y117.71 E2.51935
N10132 G1 X192.29 Y117.71 E1.03002
N10133 G1 X192.29 Y202.23 E2.51756
N10144 G1 X159.264 Y186.198 E1.0477
N10145 G1 X159.264 Y183.32 E.09255
N10146 G1 X176.68 Y200.736 E.79198
N10147 G1 X175.818 Y200.736 E.0277
N10148 G1 X190.736 Y145.063 E1.85337
N10149 G1 X190.736 Y144.05 E.03257
N10150 G1 X159.264 Y152.483 E1.0477
N10151 G1 X159.264 Y148.778 E.11913
N10152 G1 X190.736 Y180.249 E1.43118
N10153 G1 X190.736 Y186.194 E.19117
N10154 G1 X159.264 Y194.627 E1.0477
N10155 G1 X159.264 Y194.834 E.00666
N10156 G1 X165.166 Y200.736 E.26837
N10157 G1 X159.264 Y200.736 E.18977
N10158 G1 X159.264 Y199.602 E.03647
N10159 G1 X180.791 Y119.264 E2.67448
N10160 G1 X187.32 Y119.264 E.20997
N10161 G1 X190.736 Y122.68 E.15531
N10162 G1 X190.736 Y127.193 E.14512
N10163 G1 X159.264 Y135.625 E1.0477
N10168 G1 X159.264 Y144.054 E.05236
N10169 G1 X190.736 Y135.622 E1.0477
N10170 G1 X190.736 Y134.194 E.04592
N10171 G1 X175.806 Y119.264 E.67892
N10172 G1 X172.362 Y119.264 E.11076
N10173 G1 X159.264 Y168.145 E1.62726
N10174 G1 X159.264 Y169.341 E.03845
N10175 G1 X190.736 Y160.908 E1.0477
N10176 G1 X190.736 Y157.222 E.11854
N10177 G1 X159.264 Y125.751 E1.43118
N10178 G1 X159.264 Y127.197 E.0465
N10179 G1 X188.868 Y119.264 E.98552
N10181 G1 X189.22 Y119.264 E.0113
N10182 G1 X167.389 Y200.736 E2.71223
N10183 G1 X167.924 Y200.736 E.01719
N10184 G1 X190.736 Y194.623 E.75941
N10185 G1 X190.736 Y191.763 E.09196
N10186 G1 X159.264 Y160.292 E1.43118
N10187 G1 X159.264 Y160.912 E.01992
N10188 G1 X190.736 Y152.479 E1.0477
N10189 G1 X190.736 Y150.851 E.05236
N10194 G1 X164.292 Y119.264 E1.20253
N10195 G1 X163.933 Y119.264 E.01155
N10196 G1 X159.264 Y136.688 E.58005
N10197 G1 X159.264 Y137.264 E.01853
N10198 G1 X190.736 Y168.736 E1.43118
N10199 G1 X190.736 Y169.337 E.01933
N10200 G1 X159.264 Y177.769 E1.0477
N10201 G1 X159.264 Y171.806 E.19175
N10202 G1 X188.194 Y200.736 E1.31558
N10203 G1 X184.247 Y200.736 E.12691
N10204 G1 X190.736 Y176.52 E.80616
N10205 G1 X190.736 Y174.892 E.05236
N10207 G1 X190.736 Y176.52 E-.61876
N10208 G1 X190.639 Y176.879 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN10258 G1 Z7.2
N10259 G1 E.8 F1800
N10260 ; FEATURE: Inner wall
N10261 ; LINE_WIDTH: 0.45
N10262 ; LAYER_HEIGHT: 0.2
N10263 G1 F4421.739
N10264 M204 S8000
N10265 G1 X158.916 Y201.084 E1.03439
N10266 G1 X158.916 Y118.916 E2.64221
N10267 G1 X191.084 Y118.916 E1.03439
N10268 G1 X191.084 Y201.024 E2.64028
N10269 ; COOLING_NODE: 0
N10270 M204 S10000
N10271 G1 X191.491 Y201.491 F60000
N10272 G1 F4421.739
N10273 M204 S8000
N10274 G1 X158.509 Y201.491 E1.06057
N10275 G1 X158.509 Y118.509 E2.66839
N10276 G1 X191.491 Y118.509 E1.06057
N10277 G1 X191.491 Y201.431 E2.66646
N10278 ; COOLING_NODE: 0
N10279 M204 S10000
N10280 G1 X191.898 Y201.898 F60000
N10281 G1 F4421.739
N10282 M204 S8000
N10283 G1 X158.102 Y201.898 E1.08675
N10284 G1 X158.102 Y118.102 E2.69457
N10285 G1 X191.898 Y118.102 E1.08675
N10286 G1 X191.898 Y201.838 E2.69264
N10287 ; COOLING_NODE: 0
N10288 M204 S10000
N10289 G1 X192.29 Y202.29 F60000
N10290 ; FEATURE: Outer wall
N10291 ; LINE_WIDTH: 0.42
N10292 G1 F4773.528
N10293 M204 S5000
N10294 G1 X157.71 Y202.29 E1.03002
N10295 G1 X157.71 Y117.71 E2.51935
N10296 G1 X192.29 Y117.71 E1.03002
N10297 G1 X192.29 Y202.23 E2.51756
N10298 G1 E-.8 F1800
N10299 M204 S10000
N10300 G1 X191.615 Y194.627 Z7.6 F60000
N10301 G1 X190.736 Y184.712 Z7.6
N10302 G1 Z7.2
N10303 G1 E.8 F1800
N10304 ; FEATURE: Sparse infill
N10305 ; LINE_WIDTH: 0.45
N10306 G1 F4421.739
N10307 M204 S8000
N10308 G1 X190.736 Y186.341 E.05236
N10309 G1 X159.264 Y194.773 E1.04769
N10310 G1 X159.264 Y194.634 E.00448
N10311 G1 X165.366 Y200.736 E.27746
N10312 G1 X159.264 Y200.736 E.1962
N10313 G1 X159.264 Y199.055 E.05404
N10314 G1 X180.644 Y119.264 E2.65629
N10315 G1 X187.52 Y119.264 E.22111
N10316 G1 X190.736 Y122.48 E.14622
N10317 G1 X190.736 Y127.339 E.15626
N10318 G1 X159.264 Y135.772 E1.0477
N10319 G1 X159.264 Y136.142 E.01189
N10320 G1 X163.787 Y119.264 E.56186
N10321 G1 X164.492 Y119.264 E.02269
N10322 G1 X190.736 Y145.508 E1.19344
N10323 M204 S10000
N10324 G1 X190.736 Y150.997 F60000
N10325 G1 F4421.739
N10326 M204 S8000
N10327 G1 X190.736 Y152.626 E.05236
N10328 G1 X159.264 Y161.058 E1.0477
N10329 G1 X159.264 Y160.092 E.03106
N10330 G1 X190.736 Y191.563 E1.43118
N10331 G1 X190.736 Y194.77 E.1031
N10332 G1 X168.47 Y200.736 E.74122
N10333 G1 X167.243 Y200.736 E.03947
N10334 G1 X189.073 Y119.264 E2.71223
N10335 G1 X189.414 Y119.264 E.01097
N10336 G1 X159.264 Y127.343 E1.00371
N10337 G1 X159.264 Y125.551 E.05764
N10338 G1 X190.736 Y157.022 E1.43118
N10339 G1 X190.736 Y161.054 E.12968
N10340 G1 X159.264 Y169.487 E1.0477
N10341 G1 X159.264 Y167.598 E.06073
N10342 G1 X172.216 Y119.264 E1.60907
N10343 G1 X176.006 Y119.264 E.1219
N10344 G1 X190.736 Y133.994 E.66983
N10345 G1 X190.736 Y135.768 E.05706
N10346 G1 X159.264 Y144.201 E1.0477
N10347 G1 X159.264 Y148.578 E.14077
N10348 G1 X190.736 Y180.049 E1.43118
N10349 G1 X190.736 Y177.912 E.06873
N10350 G1 X159.264 Y186.345 E1.0477
N10351 G1 X159.264 Y183.12 E.10369
N10352 G1 X176.88 Y200.736 E.80107
N10353 G1 X175.672 Y200.736 E.03884
N10354 G1 X190.736 Y144.517 E1.87156
N10355 G1 X190.736 Y144.197 E.01029
N10356 G1 X159.264 Y152.629 E1.0477
N10357 G1 X159.264 Y154.258 E.05236
N10358 M204 S10000
N10359 G1 X159.264 Y138.693 F60000
N10360 G1 F4421.739
N10361 M204 S8000
N10362 G1 X159.264 Y137.064 E.05236
N10363 G1 X190.736 Y168.536 E1.43118
N10364 G1 X190.736 Y169.483 E.03047
N10365 G1 X159.264 Y177.916 E1.0477
N10366 G1 X159.264 Y171.606 E.20289
N10367 G1 X188.394 Y200.736 E1.32468
N10368 G1 X184.101 Y200.736 E.13805
N10369 G1 X190.736 Y175.973 E.82435
N10370 G1 X190.736 Y174.345 E.05236
N10371 ; WIPE_START
N10372 G1 X190.736 Y175.973 E-.61876
N10373 G1 X190.639 Y176.332 E-.14124
N10374 ; WIPE_END
N10375 G1 E-.04 F1800
N10376 M204 S10000
N10377 G17
N10378 G3 Z7.6 I1.217 J0 P1  F60000
N10379 ; stop printing object, unique label id: 372
N10380 M625
N10381 ; object ids of layer 36 start: 372
N10382 M624 AQAAAAAAAAA=
N10383 ;======== H2D 20250527========
N10384 ; SKIPPABLE_START
N10385 ; SKIPTYPE: timelapse
N10386 M622.1 S1 ; for prev firware, default turned on
N10387 
N10388 M1002 judge_flag timelapse_record_flag
N10389 
N10390 M622 J1
N10391 M993 A2 B2 C2
N10392 M993 A0 B0 C0
N10393 
N10394 
N10395 
N10396 
N10397     M9711 M0 E1 X261 Y132 Z7.6 S11 C10 O0 T3000
N10398 
N10399 
N10400 
N10401 M993 A3 B3 C3
N10402 
N10403 M623
N10404 ; SKIPPABLE_END
N10405 
N10406 ; object ids of this layer36 end: 372
N10407 M625
N10408 ; CHANGE_LAYER
N10409 ; Z_HEIGHT: 7.4
N10410 ; LAYER_HEIGHT: 0.2
N10411 ;======== H2D 20250521========
N10412 ; layer num/total_layer_count: 37/75
N10413 ; update layer progress
N10414 M73 L37
N10415 M991 S0 P36 ;notify layer change
N10416 
N10417 
N10418 ; OBJECT_ID: 372
N10419 ; COOLING_NODE: 0
N10420 ; start printing object, unique label id: 372
N10421 M624 AQAAAAAAAAA=
N10422 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=7.300G1 Z7.300 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N10265 G1 X158.916 Y201.084 E1.03439
N10266 G1 X158.916 Y118.916 E2.64221
N10267 G1 X191.084 Y118.916 E1.03439
N10268 G1 X191.084 Y201.024 E2.64028
N10274 G1 X158.509 Y201.491 E1.06057
N10275 G1 X158.509 Y118.509 E2.66839
N10276 G1 X191.491 Y118.509 E1.06057
N10277 G1 X191.491 Y201.431 E2.66646
N10283 G1 X158.102 Y201.898 E1.08675
N10284 G1 X158.102 Y118.102 E2.69457
N10285 G1 X191.898 Y118.102 E1.08675
N10286 G1 X191.898 Y201.838 E2.69264
N10294 G1 X157.71 Y202.29 E1.03002
N10295 G1 X157.71 Y117.71 E2.51935
N10296 G1 X192.29 Y117.71 E1.03002
N10297 G1 X192.29 Y202.23 E2.51756
N10308 G1 X190.736 Y186.341 E.05236
N10309 G1 X159.264 Y194.773 E1.04769
N10310 G1 X159.264 Y194.634 E.00448
N10311 G1 X165.366 Y200.736 E.27746
N10312 G1 X159.264 Y200.736 E.1962
N10313 G1 X159.264 Y199.055 E.05404
N10314 G1 X180.644 Y119.264 E2.65629
N10315 G1 X187.52 Y119.264 E.22111
N10316 G1 X190.736 Y122.48 E.14622
N10317 G1 X190.736 Y127.339 E.15626
N10318 G1 X159.264 Y135.772 E1.0477
N10319 G1 X159.264 Y136.142 E.01189
N10320 G1 X163.787 Y119.264 E.56186
N10321 G1 X164.492 Y119.264 E.02269
N10322 G1 X190.736 Y145.508 E1.19344
N10327 G1 X190.736 Y152.626 E.05236
N10328 G1 X159.264 Y161.058 E1.0477
N10329 G1 X159.264 Y160.092 E.03106
N10330 G1 X190.736 Y191.563 E1.43118
N10331 G1 X190.736 Y194.77 E.1031
N10332 G1 X168.47 Y200.736 E.74122
N10333 G1 X167.243 Y200.736 E.03947
N10334 G1 X189.073 Y119.264 E2.71223
N10335 G1 X189.414 Y119.264 E.01097
N10336 G1 X159.264 Y127.343 E1.00371
N10337 G1 X159.264 Y125.551 E.05764
N10338 G1 X190.736 Y157.022 E1.43118
N10339 G1 X190.736 Y161.054 E.12968
N10340 G1 X159.264 Y169.487 E1.0477
N10341 G1 X159.264 Y167.598 E.06073
N10342 G1 X172.216 Y119.264 E1.60907
N10343 G1 X176.006 Y119.264 E.1219
N10344 G1 X190.736 Y133.994 E.66983
N10345 G1 X190.736 Y135.768 E.05706
N10346 G1 X159.264 Y144.201 E1.0477
N10347 G1 X159.264 Y148.578 E.14077
N10348 G1 X190.736 Y180.049 E1.43118
N10349 G1 X190.736 Y177.912 E.06873
N10350 G1 X159.264 Y186.345 E1.0477
N10351 G1 X159.264 Y183.12 E.10369
N10352 G1 X176.88 Y200.736 E.80107
N10353 G1 X175.672 Y200.736 E.03884
N10354 G1 X190.736 Y144.517 E1.87156
N10355 G1 X190.736 Y144.197 E.01029
N10356 G1 X159.264 Y152.629 E1.0477
N10357 G1 X159.264 Y154.258 E.05236
N10362 G1 X159.264 Y137.064 E.05236
N10363 G1 X190.736 Y168.536 E1.43118
N10364 G1 X190.736 Y169.483 E.03047
N10365 G1 X159.264 Y177.916 E1.0477
N10366 G1 X159.264 Y171.606 E.20289
N10367 G1 X188.394 Y200.736 E1.32468
N10368 G1 X184.101 Y200.736 E.13805
N10369 G1 X190.736 Y175.973 E.82435
N10370 G1 X190.736 Y174.345 E.05236
N10372 G1 X190.736 Y175.973 E-.61876
N10373 G1 X190.639 Y176.332 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN10423 G1 Z7.4
N10424 G1 E.8 F1800
N10425 ; FEATURE: Inner wall
N10426 ; LINE_WIDTH: 0.45
N10427 ; LAYER_HEIGHT: 0.2
N10428 G1 F4421.739
N10429 M204 S8000
N10430 G1 X158.916 Y201.084 E1.03439
N10431 G1 X158.916 Y118.916 E2.64221
N10432 G1 X191.084 Y118.916 E1.03439
N10433 G1 X191.084 Y201.024 E2.64028
N10434 ; COOLING_NODE: 0
N10435 M204 S10000
N10436 G1 X191.491 Y201.491 F60000
N10437 G1 F4421.739
N10438 M204 S8000
N10439 G1 X158.509 Y201.491 E1.06057
N10440 G1 X158.509 Y118.509 E2.66839
N10441 G1 X191.491 Y118.509 E1.06057
N10442 G1 X191.491 Y201.431 E2.66646
N10443 ; COOLING_NODE: 0
N10444 M204 S10000
N10445 M73 P60 R25
N10446 G1 X191.898 Y201.898 F60000
N10447 G1 F4421.739
N10448 M204 S8000
N10449 G1 X158.102 Y201.898 E1.08675
N10450 G1 X158.102 Y118.102 E2.69457
N10451 G1 X191.898 Y118.102 E1.08675
N10452 G1 X191.898 Y201.838 E2.69264
N10453 ; COOLING_NODE: 0
N10454 M204 S10000
N10455 G1 X192.29 Y202.29 F60000
N10456 ; FEATURE: Outer wall
N10457 ; LINE_WIDTH: 0.42
N10458 M73 P60 R24
N10459 G1 F4773.528
N10460 M204 S5000
N10461 G1 X157.71 Y202.29 E1.03002
N10462 G1 X157.71 Y117.71 E2.51935
N10463 G1 X192.29 Y117.71 E1.03002
N10464 G1 X192.29 Y202.23 E2.51756
N10465 G1 E-.8 F1800
N10466 M204 S10000
N10467 G1 X191.61 Y194.628 Z7.8 F60000
N10468 G1 X190.736 Y184.859 Z7.8
N10469 G1 Z7.4
N10470 G1 E.8 F1800
N10471 ; FEATURE: Sparse infill
N10472 ; LINE_WIDTH: 0.45
N10473 G1 F4421.739
N10474 M204 S8000
N10475 G1 X190.736 Y186.487 E.05236
N10476 G1 X159.264 Y194.92 E1.04769
N10477 G1 X159.264 Y194.434 E.01562
N10478 G1 X165.566 Y200.736 E.28656
N10479 G1 X167.097 Y200.736 E.04922
N10480 G1 X188.927 Y119.264 E2.71223
N10481 M204 S10000
N10482 G1 X190.736 Y129.114 F60000
N10483 G1 F4421.739
N10484 M204 S8000
N10485 G1 X190.736 Y127.486 E.05236
N10486 G1 X159.264 Y135.918 E1.04769
N10487 G1 X159.264 Y135.595 E.01039
N10488 G1 X163.64 Y119.264 E.54367
N10489 G1 X164.692 Y119.264 E.03383
N10490 G1 X190.736 Y145.308 E1.18434
N10491 G1 X190.736 Y146.936 E.05236
N10492 M204 S10000
N10493 G1 X190.736 Y162.829 F60000
N10494 G1 F4421.739
N10495 M204 S8000
N10496 G1 X190.736 Y161.201 E.05236
N10497 G1 X159.264 Y169.633 E1.0477
N10498 G1 X159.264 Y171.406 E.05701
N10499 G1 X188.594 Y200.736 E1.33378
N10500 G1 X183.954 Y200.736 E.14919
N10501 G1 X190.736 Y175.427 E.84254
N10502 G1 X190.736 Y173.799 E.05236
N10503 M204 S10000
N10504 G1 X167.389 Y200.736 F60000
N10505 G1 F4421.739
N10506 M204 S8000
N10507 G1 X169.017 Y200.736 E.05236
N10508 G1 X190.736 Y194.916 E.72303
N10509 G1 X190.736 Y191.363 E.11424
N10510 G1 X159.264 Y159.892 E1.43118
N10511 G1 X159.264 Y161.205 E.0422
N10512 G1 X190.736 Y152.772 E1.0477
N10513 G1 X190.736 Y156.822 E.13022
N10514 G1 X159.264 Y125.351 E1.43118
N10515 G1 X159.264 Y127.49 E.06878
N10516 G1 X189.961 Y119.264 E1.0219
N10517 G1 X190.736 Y119.264 E.02491
N10518 G1 X190.736 Y122.28 E.09696
N10519 G1 X187.72 Y119.264 E.13712
N10520 G1 X180.498 Y119.264 E.23225
N10521 G1 X159.264 Y198.509 E2.6381
N10522 G1 X159.264 Y200.137 E.05236
N10523 M204 S10000
N10524 G1 X159.264 Y154.404 F60000
N10525 G1 F4421.739
N10526 M204 S8000
N10527 G1 X159.264 Y152.776 E.05236
N10528 G1 X190.736 Y144.343 E1.0477
N10529 G1 X190.736 Y143.97 E.01199
N10530 G1 X175.525 Y200.736 E1.88975
N10531 G1 X177.08 Y200.736 E.04998
N10532 G1 X159.264 Y182.92 E.81017
N10533 G1 X159.264 Y186.491 E.11483
N10534 G1 X190.736 Y178.058 E1.0477
N10535 G1 X190.736 Y179.849 E.05759
N10536 G1 X159.264 Y148.378 E1.43118
N10537 G1 X159.264 Y144.347 E.12963
N10538 G1 X190.736 Y135.914 E1.0477
N10539 G1 X190.736 Y133.794 E.0682
N10540 G1 X176.206 Y119.264 E.66073
N10541 G1 X172.069 Y119.264 E.13304
N10542 G1 X159.264 Y167.052 E1.59088
N10543 G1 X159.264 Y168.68 E.05236
N10544 M204 S10000
N10545 G1 X159.264 Y176.434 F60000
N10546 G1 F4421.739
N10547 M204 S8000
N10548 G1 X159.264 Y178.062 E.05236
N10549 G1 X190.736 Y169.63 E1.04769
N10550 G1 X190.736 Y168.336 E.04161
N10551 G1 X159.264 Y136.864 E1.43118
N10552 G1 X159.264 Y138.493 E.05236
N10553 ; WIPE_START
N10554 G1 X159.264 Y136.864 E-.61876
N10555 G1 X159.527 Y137.127 E-.14124
N10556 ; WIPE_END
N10557 G1 E-.04 F1800
N10558 M204 S10000
N10559 G17
N10560 G3 Z7.8 I1.217 J0 P1  F60000
N10561 ; stop printing object, unique label id: 372
N10562 M625
N10563 ; object ids of layer 37 start: 372
N10564 M624 AQAAAAAAAAA=
N10565 ;======== H2D 20250527========
N10566 ; SKIPPABLE_START
N10567 ; SKIPTYPE: timelapse
N10568 M622.1 S1 ; for prev firware, default turned on
N10569 
N10570 M1002 judge_flag timelapse_record_flag
N10571 
N10572 M622 J1
N10573 M993 A2 B2 C2
N10574 M993 A0 B0 C0
N10575 
N10576 
N10577 
N10578 
N10579     M9711 M0 E1 X261 Y132 Z7.8 S11 C10 O0 T3000
N10580 
N10581 
N10582 
N10583 M993 A3 B3 C3
N10584 
N10585 M623
N10586 ; SKIPPABLE_END
N10587 
N10588 ; object ids of this layer37 end: 372
N10589 M625
N10590 ; CHANGE_LAYER
N10591 ; Z_HEIGHT: 7.6
N10592 ; LAYER_HEIGHT: 0.2
N10593 ;======== H2D 20250521========
N10594 ; layer num/total_layer_count: 38/75
N10595 ; update layer progress
N10596 M73 L38
N10597 M991 S0 P37 ;notify layer change
N10598 
N10599 
N10600 ; OBJECT_ID: 372
N10601 ; COOLING_NODE: 0
N10602 ; start printing object, unique label id: 372
N10603 M624 AQAAAAAAAAA=
N10604 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=7.500G1 Z7.500 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N10430 G1 X158.916 Y201.084 E1.03439
N10431 G1 X158.916 Y118.916 E2.64221
N10432 G1 X191.084 Y118.916 E1.03439
N10433 G1 X191.084 Y201.024 E2.64028
N10439 G1 X158.509 Y201.491 E1.06057
N10440 G1 X158.509 Y118.509 E2.66839
N10441 G1 X191.491 Y118.509 E1.06057
N10442 G1 X191.491 Y201.431 E2.66646
N10449 G1 X158.102 Y201.898 E1.08675
N10450 G1 X158.102 Y118.102 E2.69457
N10451 G1 X191.898 Y118.102 E1.08675
N10452 G1 X191.898 Y201.838 E2.69264
N10461 G1 X157.71 Y202.29 E1.03002
N10462 G1 X157.71 Y117.71 E2.51935
N10463 G1 X192.29 Y117.71 E1.03002
N10464 G1 X192.29 Y202.23 E2.51756
N10475 G1 X190.736 Y186.487 E.05236
N10476 G1 X159.264 Y194.92 E1.04769
N10477 G1 X159.264 Y194.434 E.01562
N10478 G1 X165.566 Y200.736 E.28656
N10479 G1 X167.097 Y200.736 E.04922
N10480 G1 X188.927 Y119.264 E2.71223
N10485 G1 X190.736 Y127.486 E.05236
N10486 G1 X159.264 Y135.918 E1.04769
N10487 G1 X159.264 Y135.595 E.01039
N10488 G1 X163.64 Y119.264 E.54367
N10489 G1 X164.692 Y119.264 E.03383
N10490 G1 X190.736 Y145.308 E1.18434
N10491 G1 X190.736 Y146.936 E.05236
N10496 G1 X190.736 Y161.201 E.05236
N10497 G1 X159.264 Y169.633 E1.0477
N10498 G1 X159.264 Y171.406 E.05701
N10499 G1 X188.594 Y200.736 E1.33378
N10500 G1 X183.954 Y200.736 E.14919
N10501 G1 X190.736 Y175.427 E.84254
N10502 G1 X190.736 Y173.799 E.05236
N10507 G1 X169.017 Y200.736 E.05236
N10508 G1 X190.736 Y194.916 E.72303
N10509 G1 X190.736 Y191.363 E.11424
N10510 G1 X159.264 Y159.892 E1.43118
N10511 G1 X159.264 Y161.205 E.0422
N10512 G1 X190.736 Y152.772 E1.0477
N10513 G1 X190.736 Y156.822 E.13022
N10514 G1 X159.264 Y125.351 E1.43118
N10515 G1 X159.264 Y127.49 E.06878
N10516 G1 X189.961 Y119.264 E1.0219
N10517 G1 X190.736 Y119.264 E.02491
N10518 G1 X190.736 Y122.28 E.09696
N10519 G1 X187.72 Y119.264 E.13712
N10520 G1 X180.498 Y119.264 E.23225
N10521 G1 X159.264 Y198.509 E2.6381
N10522 G1 X159.264 Y200.137 E.05236
N10527 G1 X159.264 Y152.776 E.05236
N10528 G1 X190.736 Y144.343 E1.0477
N10529 G1 X190.736 Y143.97 E.01199
N10530 G1 X175.525 Y200.736 E1.88975
N10531 G1 X177.08 Y200.736 E.04998
N10532 G1 X159.264 Y182.92 E.81017
N10533 G1 X159.264 Y186.491 E.11483
N10534 G1 X190.736 Y178.058 E1.0477
N10535 G1 X190.736 Y179.849 E.05759
N10536 G1 X159.264 Y148.378 E1.43118
N10537 G1 X159.264 Y144.347 E.12963
N10538 G1 X190.736 Y135.914 E1.0477
N10539 G1 X190.736 Y133.794 E.0682
N10540 G1 X176.206 Y119.264 E.66073
N10541 G1 X172.069 Y119.264 E.13304
N10542 G1 X159.264 Y167.052 E1.59088
N10543 G1 X159.264 Y168.68 E.05236
N10548 G1 X159.264 Y178.062 E.05236
N10549 G1 X190.736 Y169.63 E1.04769
N10550 G1 X190.736 Y168.336 E.04161
N10551 G1 X159.264 Y136.864 E1.43118
N10552 G1 X159.264 Y138.493 E.05236
N10554 G1 X159.264 Y136.864 E-.61876
N10555 G1 X159.527 Y137.127 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN10605 G1 Z7.6
N10606 G1 E.8 F1800
N10607 ; FEATURE: Inner wall
N10608 ; LINE_WIDTH: 0.45
N10609 ; LAYER_HEIGHT: 0.2
N10610 G1 F4421.739
N10611 M204 S8000
N10612 G1 X158.916 Y201.084 E1.03439
N10613 G1 X158.916 Y118.916 E2.64221
N10614 G1 X191.084 Y118.916 E1.03439
N10615 G1 X191.084 Y201.024 E2.64028
N10616 ; COOLING_NODE: 0
N10617 M204 S10000
N10618 G1 X191.491 Y201.491 F60000
N10619 G1 F4421.739
N10620 M204 S8000
N10621 G1 X158.509 Y201.491 E1.06057
N10622 G1 X158.509 Y118.509 E2.66839
N10623 G1 X191.491 Y118.509 E1.06057
N10624 G1 X191.491 Y201.431 E2.66646
N10625 ; COOLING_NODE: 0
N10626 M204 S10000
N10627 G1 X191.898 Y201.898 F60000
N10628 G1 F4421.739
N10629 M204 S8000
N10630 G1 X158.102 Y201.898 E1.08675
N10631 G1 X158.102 Y118.102 E2.69457
N10632 G1 X191.898 Y118.102 E1.08675
N10633 G1 X191.898 Y201.838 E2.69264
N10634 ; COOLING_NODE: 0
N10635 M204 S10000
N10636 G1 X192.29 Y202.29 F60000
N10637 ; FEATURE: Outer wall
N10638 ; LINE_WIDTH: 0.42
N10639 G1 F4773.528
N10640 M204 S5000
N10641 G1 X157.71 Y202.29 E1.03002
N10642 G1 X157.71 Y117.71 E2.51935
N10643 G1 X192.29 Y117.71 E1.03002
N10644 G1 X192.29 Y202.23 E2.51756
N10645 G1 E-.8 F1800
N10646 M204 S10000
N10647 G1 X191.604 Y194.628 Z8 F60000
N10648 G1 X190.736 Y185.005 Z8
N10649 G1 Z7.6
N10650 G1 E.8 F1800
N10651 ; FEATURE: Sparse infill
N10652 ; LINE_WIDTH: 0.45
N10653 G1 F4421.739
N10654 M204 S8000
N10655 G1 X190.736 Y186.634 E.05236
N10656 G1 X159.264 Y195.066 E1.0477
N10657 G1 X159.264 Y194.234 E.02676
N10658 G1 X165.766 Y200.736 E.29565
N10659 G1 X166.95 Y200.736 E.03808
N10660 M73 P61 R24
N10661 G1 X188.78 Y119.264 E2.71223
N10662 G1 X187.92 Y119.264 E.02766
N10663 G1 X190.736 Y122.08 E.12803
N10664 G1 X190.736 Y119.264 E.09053
N10665 G1 X190.507 Y119.264 E.00734
N10666 G1 X159.264 Y127.636 E1.04009
N10667 G1 X159.264 Y125.151 E.07992
N10668 G1 X190.736 Y156.622 E1.43118
N10669 G1 X190.736 Y152.918 E.11908
N10670 G1 X159.264 Y161.351 E1.04769
N10671 G1 X159.264 Y159.692 E.05334
N10672 G1 X190.736 Y191.163 E1.43118
N10673 G1 X190.736 Y195.062 E.12538
N10674 G1 X169.563 Y200.736 E.70484
N10675 G1 X167.935 Y200.736 E.05236
N10676 M204 S10000
N10677 G1 X159.264 Y199.591 F60000
N10678 G1 F4421.739
N10679 M204 S8000
N10680 G1 X159.264 Y197.962 E.05236
N10681 G1 X180.351 Y119.264 E2.61991
N10682 G1 X176.406 Y119.264 E.12686
N10683 G1 X190.736 Y133.594 E.65164
N10684 G1 X190.736 Y136.061 E.07934
N10685 G1 X159.264 Y144.494 E1.0477
N10686 G1 X159.264 Y148.178 E.11849
N10687 G1 X190.736 Y179.649 E1.43118
N10688 G1 X190.736 Y178.205 E.04645
N10689 G1 X159.264 Y186.637 E1.0477
N10690 G1 X159.264 Y182.72 E.12596
N10691 G1 X177.28 Y200.736 E.81926
N10692 G1 X175.379 Y200.736 E.06112
N10693 G1 X190.736 Y143.424 E1.90794
N10694 G1 X190.736 Y141.796 E.05236
N10695 M204 S10000
N10696 G1 X190.736 Y129.26 F60000
N10697 G1 F4421.739
N10698 M204 S8000
N10699 G1 X190.736 Y127.632 E.05236
N10700 G1 X159.264 Y136.065 E1.0477
N10701 G1 X159.264 Y136.664 E.01929
N10702 G1 X190.736 Y168.136 E1.43118
N10703 G1 X190.736 Y169.776 E.05275
N10704 G1 X159.264 Y178.209 E1.0477
N10705 G1 X159.264 Y176.58 E.05236
N10706 M204 S10000
N10707 G1 X159.264 Y168.134 F60000
N10708 G1 F4421.739
N10709 M204 S8000
N10710 G1 X159.264 Y166.506 E.05236
N10711 G1 X171.923 Y119.264 E1.57269
N10712 G1 X170.294 Y119.264 E.05236
N10713 M204 S10000
N10714 G1 X159.264 Y135.861 F60000
N10715 G1 F4421.739
N10716 M204 S8000
N10717 G1 X159.264 Y135.049 E.02612
N10718 G1 X163.494 Y119.264 E.52547
N10719 G1 X164.892 Y119.264 E.04497
N10720 G1 X190.736 Y145.108 E1.17524
N10721 G1 X190.736 Y146.736 E.05236
N10722 M204 S10000
N10723 G1 X190.736 Y144.49 F60000
N10724 G1 F4421.739
N10725 M204 S8000
N10726 G1 X159.264 Y152.922 E1.0477
N10727 G1 X159.264 Y154.551 E.05236
N10728 M204 S10000
N10729 G1 X190.736 Y162.976 F60000
N10730 G1 F4421.739
N10731 M204 S8000
N10732 G1 X190.736 Y161.347 E.05236
N10733 G1 X159.264 Y169.78 E1.0477
N10734 G1 X159.264 Y171.206 E.04587
N10735 G1 X188.794 Y200.736 E1.34287
N10736 G1 X183.808 Y200.736 E.16033
N10737 G1 X190.736 Y174.881 E.86073
N10738 G1 X190.736 Y173.252 E.05236
N10739 ; WIPE_START
N10740 G1 X190.736 Y174.881 E-.61876
N10741 G1 X190.639 Y175.24 E-.14124
N10742 ; WIPE_END
N10743 G1 E-.04 F1800
N10744 M204 S10000
N10745 G17
N10746 G3 Z8 I1.217 J0 P1  F60000
N10747 ; stop printing object, unique label id: 372
N10748 M625
N10749 ; object ids of layer 38 start: 372
N10750 M624 AQAAAAAAAAA=
N10751 ;======== H2D 20250527========
N10752 ; SKIPPABLE_START
N10753 ; SKIPTYPE: timelapse
N10754 M622.1 S1 ; for prev firware, default turned on
N10755 
N10756 M1002 judge_flag timelapse_record_flag
N10757 
N10758 M622 J1
N10759 M993 A2 B2 C2
N10760 M993 A0 B0 C0
N10761 
N10762 
N10763 
N10764 
N10765     M9711 M0 E1 X261 Y132 Z8 S11 C10 O0 T3000
N10766 
N10767 
N10768 
N10769 M993 A3 B3 C3
N10770 
N10771 M623
N10772 ; SKIPPABLE_END
N10773 
N10774 ; object ids of this layer38 end: 372
N10775 M625
N10776 ; CHANGE_LAYER
N10777 ; Z_HEIGHT: 7.8
N10778 ; LAYER_HEIGHT: 0.2
N10779 ;======== H2D 20250521========
N10780 ; layer num/total_layer_count: 39/75
N10781 ; update layer progress
N10782 M73 L39
N10783 M991 S0 P38 ;notify layer change
N10784 
N10785 
N10786 ; OBJECT_ID: 372
N10787 ; COOLING_NODE: 0
N10788 ; start printing object, unique label id: 372
N10789 M624 AQAAAAAAAAA=
N10790 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=7.700G1 Z7.700 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N10612 G1 X158.916 Y201.084 E1.03439
N10613 G1 X158.916 Y118.916 E2.64221
N10614 G1 X191.084 Y118.916 E1.03439
N10615 G1 X191.084 Y201.024 E2.64028
N10621 G1 X158.509 Y201.491 E1.06057
N10622 G1 X158.509 Y118.509 E2.66839
N10623 G1 X191.491 Y118.509 E1.06057
N10624 G1 X191.491 Y201.431 E2.66646
N10630 G1 X158.102 Y201.898 E1.08675
N10631 G1 X158.102 Y118.102 E2.69457
N10632 G1 X191.898 Y118.102 E1.08675
N10633 G1 X191.898 Y201.838 E2.69264
N10641 G1 X157.71 Y202.29 E1.03002
N10642 G1 X157.71 Y117.71 E2.51935
N10643 G1 X192.29 Y117.71 E1.03002
N10644 G1 X192.29 Y202.23 E2.51756
N10655 G1 X190.736 Y186.634 E.05236
N10656 G1 X159.264 Y195.066 E1.0477
N10657 G1 X159.264 Y194.234 E.02676
N10658 G1 X165.766 Y200.736 E.29565
N10659 G1 X166.95 Y200.736 E.03808
N10661 G1 X188.78 Y119.264 E2.71223
N10662 G1 X187.92 Y119.264 E.02766
N10663 G1 X190.736 Y122.08 E.12803
N10664 G1 X190.736 Y119.264 E.09053
N10665 G1 X190.507 Y119.264 E.00734
N10666 G1 X159.264 Y127.636 E1.04009
N10667 G1 X159.264 Y125.151 E.07992
N10668 G1 X190.736 Y156.622 E1.43118
N10669 G1 X190.736 Y152.918 E.11908
N10670 G1 X159.264 Y161.351 E1.04769
N10671 G1 X159.264 Y159.692 E.05334
N10672 G1 X190.736 Y191.163 E1.43118
N10673 G1 X190.736 Y195.062 E.12538
N10674 G1 X169.563 Y200.736 E.70484
N10675 G1 X167.935 Y200.736 E.05236
N10680 G1 X159.264 Y197.962 E.05236
N10681 G1 X180.351 Y119.264 E2.61991
N10682 G1 X176.406 Y119.264 E.12686
N10683 G1 X190.736 Y133.594 E.65164
N10684 G1 X190.736 Y136.061 E.07934
N10685 G1 X159.264 Y144.494 E1.0477
N10686 G1 X159.264 Y148.178 E.11849
N10687 G1 X190.736 Y179.649 E1.43118
N10688 G1 X190.736 Y178.205 E.04645
N10689 G1 X159.264 Y186.637 E1.0477
N10690 G1 X159.264 Y182.72 E.12596
N10691 G1 X177.28 Y200.736 E.81926
N10692 G1 X175.379 Y200.736 E.06112
N10693 G1 X190.736 Y143.424 E1.90794
N10694 G1 X190.736 Y141.796 E.05236
N10699 G1 X190.736 Y127.632 E.05236
N10700 G1 X159.264 Y136.065 E1.0477
N10701 G1 X159.264 Y136.664 E.01929
N10702 G1 X190.736 Y168.136 E1.43118
N10703 G1 X190.736 Y169.776 E.05275
N10704 G1 X159.264 Y178.209 E1.0477
N10705 G1 X159.264 Y176.58 E.05236
N10710 G1 X159.264 Y166.506 E.05236
N10711 G1 X171.923 Y119.264 E1.57269
N10712 G1 X170.294 Y119.264 E.05236
N10717 G1 X159.264 Y135.049 E.02612
N10718 G1 X163.494 Y119.264 E.52547
N10719 G1 X164.892 Y119.264 E.04497
N10720 G1 X190.736 Y145.108 E1.17524
N10721 G1 X190.736 Y146.736 E.05236
N10726 G1 X159.264 Y152.922 E1.0477
N10727 G1 X159.264 Y154.551 E.05236
N10732 G1 X190.736 Y161.347 E.05236
N10733 G1 X159.264 Y169.78 E1.0477
N10734 G1 X159.264 Y171.206 E.04587
N10735 G1 X188.794 Y200.736 E1.34287
N10736 G1 X183.808 Y200.736 E.16033
N10737 G1 X190.736 Y174.881 E.86073
N10738 G1 X190.736 Y173.252 E.05236
N10740 G1 X190.736 Y174.881 E-.61876
N10741 G1 X190.639 Y175.24 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN10791 G1 Z7.8
N10792 G1 E.8 F1800
N10793 ; FEATURE: Inner wall
N10794 ; LINE_WIDTH: 0.45
N10795 ; LAYER_HEIGHT: 0.2
N10796 G1 F4421.739
N10797 M204 S8000
N10798 G1 X158.916 Y201.084 E1.03439
N10799 G1 X158.916 Y118.916 E2.64221
N10800 G1 X191.084 Y118.916 E1.03439
N10801 G1 X191.084 Y201.024 E2.64028
N10802 ; COOLING_NODE: 0
N10803 M204 S10000
N10804 G1 X191.491 Y201.491 F60000
N10805 G1 F4421.739
N10806 M204 S8000
N10807 G1 X158.509 Y201.491 E1.06057
N10808 G1 X158.509 Y118.509 E2.66839
N10809 G1 X191.491 Y118.509 E1.06057
N10810 G1 X191.491 Y201.431 E2.66646
N10811 ; COOLING_NODE: 0
N10812 M204 S10000
N10813 G1 X191.898 Y201.898 F60000
N10814 G1 F4421.739
N10815 M204 S8000
N10816 G1 X158.102 Y201.898 E1.08675
N10817 G1 X158.102 Y118.102 E2.69457
N10818 G1 X191.898 Y118.102 E1.08675
N10819 G1 X191.898 Y201.838 E2.69264
N10820 ; COOLING_NODE: 0
N10821 M204 S10000
N10822 G1 X192.29 Y202.29 F60000
N10823 ; FEATURE: Outer wall
N10824 ; LINE_WIDTH: 0.42
N10825 G1 F4773.528
N10826 M204 S5000
N10827 G1 X157.71 Y202.29 E1.03002
N10828 G1 X157.71 Y117.71 E2.51935
N10829 G1 X192.29 Y117.71 E1.03002
N10830 G1 X192.29 Y202.23 E2.51756
N10831 G1 E-.8 F1800
N10832 M204 S10000
N10833 G1 X191.598 Y194.629 Z8.2 F60000
N10834 G1 X190.736 Y185.152 Z8.2
N10835 M73 P61 R23
N10836 G1 Z7.8
N10837 G1 E.8 F1800
N10838 ; FEATURE: Sparse infill
N10839 ; LINE_WIDTH: 0.45
N10840 G1 F4421.739
N10841 M204 S8000
N10842 G1 X190.736 Y186.78 E.05236
N10843 G1 X159.264 Y195.213 E1.0477
N10844 G1 X159.264 Y194.034 E.0379
N10845 G1 X165.966 Y200.736 E.30475
N10846 G1 X166.804 Y200.736 E.02695
N10847 G1 X188.634 Y119.264 E2.71223
N10848 G1 X188.12 Y119.264 E.01652
N10849 G1 X190.736 Y121.88 E.11893
N10850 G1 X190.736 Y119.35 E.08136
N10851 G1 X159.264 Y127.782 E1.0477
N10852 G1 X159.264 Y124.951 E.09106
N10853 G1 X190.736 Y156.422 E1.43118
N10854 G1 X190.736 Y153.065 E.10794
N10855 G1 X159.264 Y161.498 E1.0477
N10856 G1 X159.264 Y159.492 E.06448
N10857 G1 X190.736 Y190.963 E1.43118
N10858 G1 X190.736 Y195.209 E.13652
N10859 G1 X170.11 Y200.736 E.68665
N10860 G1 X168.481 Y200.736 E.05236
N10861 M204 S10000
N10862 G1 X159.264 Y199.044 F60000
N10863 G1 F4421.739
N10864 M204 S8000
N10865 G1 X159.264 Y197.416 E.05236
N10866 G1 X180.205 Y119.264 E2.60172
N10867 G1 X176.606 Y119.264 E.11572
N10868 G1 X190.736 Y133.394 E.64254
N10869 G1 X190.736 Y136.207 E.09047
N10870 G1 X159.264 Y144.64 E1.0477
N10871 G1 X159.264 Y147.978 E.10735
N10872 G1 X190.736 Y179.449 E1.43118
N10873 G1 X190.736 Y178.351 E.03532
N10874 G1 X159.264 Y186.784 E1.0477
N10875 G1 X159.264 Y188.412 E.05236
N10876 M204 S10000
N10877 G1 X190.736 Y172.706 F60000
N10878 G1 F4421.739
N10879 M204 S8000
N10880 G1 X190.736 Y174.334 E.05236
N10881 G1 X183.661 Y200.736 E.87892
N10882 G1 X188.994 Y200.736 E.17147
N10883 G1 X159.264 Y171.006 E1.35197
N10884 G1 X159.264 Y169.926 E.03473
N10885 G1 X190.736 Y161.494 E1.0477
N10886 G1 X190.736 Y163.122 E.05236
N10887 M204 S10000
N10888 G1 X190.736 Y141.249 F60000
N10889 G1 F4421.739
N10890 M204 S8000
N10891 G1 X190.736 Y142.878 E.05236
N10892 G1 X175.233 Y200.736 E1.92613
N10893 G1 X177.48 Y200.736 E.07226
N10894 G1 X159.264 Y182.52 E.82836
N10895 G1 X159.264 Y178.355 E.13394
N10896 M73 P62 R23
N10897 G1 X190.736 Y169.922 E1.0477
N10898 G1 X190.736 Y167.936 E.06389
N10899 G1 X159.264 Y136.464 E1.43118
N10900 G1 X159.264 Y136.211 E.00815
N10901 G1 X190.736 Y127.778 E1.0477
N10902 G1 X190.736 Y126.15 E.05236
N10903 M204 S10000
N10904 G1 X170.148 Y119.264 F60000
N10905 G1 F4421.739
N10906 M204 S8000
N10907 G1 X171.776 Y119.264 E.05236
N10908 G1 X159.264 Y165.959 E1.5545
N10909 G1 X159.264 Y167.587 E.05236
N10910 M204 S10000
N10911 G1 X159.264 Y154.697 F60000
N10912 G1 F4421.739
N10913 M204 S8000
N10914 G1 X159.264 Y153.069 E.05236
N10915 G1 X190.736 Y144.636 E1.0477
N10916 G1 X190.736 Y144.908 E.00873
N10917 G1 X165.092 Y119.264 E1.16615
N10918 G1 X163.347 Y119.264 E.05611
N10919 G1 X159.264 Y134.502 E.50728
N10920 G1 X159.264 Y136.008 E.0484
N10921 ; WIPE_START
N10922 G1 X159.264 Y134.502 E-.57195
N10923 G1 X159.393 Y134.024 E-.18805
N10924 ; WIPE_END
N10925 G1 E-.04 F1800
N10926 M204 S10000
N10927 G17
N10928 G3 Z8.2 I1.217 J0 P1  F60000
N10929 ; stop printing object, unique label id: 372
N10930 M625
N10931 ; object ids of layer 39 start: 372
N10932 M624 AQAAAAAAAAA=
N10933 ;======== H2D 20250527========
N10934 ; SKIPPABLE_START
N10935 ; SKIPTYPE: timelapse
N10936 M622.1 S1 ; for prev firware, default turned on
N10937 
N10938 M1002 judge_flag timelapse_record_flag
N10939 
N10940 M622 J1
N10941 M993 A2 B2 C2
N10942 M993 A0 B0 C0
N10943 
N10944 
N10945 
N10946 
N10947     M9711 M0 E1 X261 Y132 Z8.2 S11 C10 O0 T3000
N10948 
N10949 
N10950 
N10951 M993 A3 B3 C3
N10952 
N10953 M623
N10954 ; SKIPPABLE_END
N10955 
N10956 ; object ids of this layer39 end: 372
N10957 M625
N10958 ; CHANGE_LAYER
N10959 ; Z_HEIGHT: 8
N10960 ; LAYER_HEIGHT: 0.2
N10961 ;======== H2D 20250521========
N10962 ; layer num/total_layer_count: 40/75
N10963 ; update layer progress
N10964 M73 L40
N10965 M991 S0 P39 ;notify layer change
N10966 
N10967 
N10968 ; OBJECT_ID: 372
N10969 ; COOLING_NODE: 0
N10970 ; start printing object, unique label id: 372
N10971 M624 AQAAAAAAAAA=
N10972 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=7.900G1 Z7.900 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N10798 G1 X158.916 Y201.084 E1.03439
N10799 G1 X158.916 Y118.916 E2.64221
N10800 G1 X191.084 Y118.916 E1.03439
N10801 G1 X191.084 Y201.024 E2.64028
N10807 G1 X158.509 Y201.491 E1.06057
N10808 G1 X158.509 Y118.509 E2.66839
N10809 G1 X191.491 Y118.509 E1.06057
N10810 G1 X191.491 Y201.431 E2.66646
N10816 G1 X158.102 Y201.898 E1.08675
N10817 G1 X158.102 Y118.102 E2.69457
N10818 G1 X191.898 Y118.102 E1.08675
N10819 G1 X191.898 Y201.838 E2.69264
N10827 G1 X157.71 Y202.29 E1.03002
N10828 G1 X157.71 Y117.71 E2.51935
N10829 G1 X192.29 Y117.71 E1.03002
N10830 G1 X192.29 Y202.23 E2.51756
N10842 G1 X190.736 Y186.78 E.05236
N10843 G1 X159.264 Y195.213 E1.0477
N10844 G1 X159.264 Y194.034 E.0379
N10845 G1 X165.966 Y200.736 E.30475
N10846 G1 X166.804 Y200.736 E.02695
N10847 G1 X188.634 Y119.264 E2.71223
N10848 G1 X188.12 Y119.264 E.01652
N10849 G1 X190.736 Y121.88 E.11893
N10850 G1 X190.736 Y119.35 E.08136
N10851 G1 X159.264 Y127.782 E1.0477
N10852 G1 X159.264 Y124.951 E.09106
N10853 G1 X190.736 Y156.422 E1.43118
N10854 G1 X190.736 Y153.065 E.10794
N10855 G1 X159.264 Y161.498 E1.0477
N10856 G1 X159.264 Y159.492 E.06448
N10857 G1 X190.736 Y190.963 E1.43118
N10858 G1 X190.736 Y195.209 E.13652
N10859 G1 X170.11 Y200.736 E.68665
N10860 G1 X168.481 Y200.736 E.05236
N10865 G1 X159.264 Y197.416 E.05236
N10866 G1 X180.205 Y119.264 E2.60172
N10867 G1 X176.606 Y119.264 E.11572
N10868 G1 X190.736 Y133.394 E.64254
N10869 G1 X190.736 Y136.207 E.09047
N10870 G1 X159.264 Y144.64 E1.0477
N10871 G1 X159.264 Y147.978 E.10735
N10872 G1 X190.736 Y179.449 E1.43118
N10873 G1 X190.736 Y178.351 E.03532
N10874 G1 X159.264 Y186.784 E1.0477
N10875 G1 X159.264 Y188.412 E.05236
N10880 G1 X190.736 Y174.334 E.05236
N10881 G1 X183.661 Y200.736 E.87892
N10882 G1 X188.994 Y200.736 E.17147
N10883 G1 X159.264 Y171.006 E1.35197
N10884 G1 X159.264 Y169.926 E.03473
N10885 G1 X190.736 Y161.494 E1.0477
N10886 G1 X190.736 Y163.122 E.05236
N10891 G1 X190.736 Y142.878 E.05236
N10892 G1 X175.233 Y200.736 E1.92613
N10893 G1 X177.48 Y200.736 E.07226
N10894 G1 X159.264 Y182.52 E.82836
N10895 G1 X159.264 Y178.355 E.13394
N10897 G1 X190.736 Y169.922 E1.0477
N10898 G1 X190.736 Y167.936 E.06389
N10899 G1 X159.264 Y136.464 E1.43118
N10900 G1 X159.264 Y136.211 E.00815
N10901 G1 X190.736 Y127.778 E1.0477
N10902 G1 X190.736 Y126.15 E.05236
N10907 G1 X171.776 Y119.264 E.05236
N10908 G1 X159.264 Y165.959 E1.5545
N10909 G1 X159.264 Y167.587 E.05236
N10914 G1 X159.264 Y153.069 E.05236
N10915 G1 X190.736 Y144.636 E1.0477
N10916 G1 X190.736 Y144.908 E.00873
N10917 G1 X165.092 Y119.264 E1.16615
N10918 G1 X163.347 Y119.264 E.05611
N10919 G1 X159.264 Y134.502 E.50728
N10920 G1 X159.264 Y136.008 E.0484
N10922 G1 X159.264 Y134.502 E-.57195
N10923 G1 X159.393 Y134.024 E-.18805
T0 ;TOOL_CHANGE:0 ; Revert to base toolN10973 G1 Z8
N10974 G1 E.8 F1800
N10975 ; FEATURE: Inner wall
N10976 ; LINE_WIDTH: 0.45
N10977 ; LAYER_HEIGHT: 0.2
N10978 G1 F4421.739
N10979 M204 S8000
N10980 G1 X158.916 Y201.084 E1.03439
N10981 G1 X158.916 Y118.916 E2.64221
N10982 G1 X191.084 Y118.916 E1.03439
N10983 G1 X191.084 Y201.024 E2.64028
N10984 ; COOLING_NODE: 0
N10985 M204 S10000
N10986 G1 X191.491 Y201.491 F60000
N10987 G1 F4421.739
N10988 M204 S8000
N10989 G1 X158.509 Y201.491 E1.06057
N10990 G1 X158.509 Y118.509 E2.66839
N10991 G1 X191.491 Y118.509 E1.06057
N10992 G1 X191.491 Y201.431 E2.66646
N10993 ; COOLING_NODE: 0
N10994 M204 S10000
N10995 G1 X191.898 Y201.898 F60000
N10996 G1 F4421.739
N10997 M204 S8000
N10998 G1 X158.102 Y201.898 E1.08675
N10999 G1 X158.102 Y118.102 E2.69457
N11000 G1 X191.898 Y118.102 E1.08675
N11001 G1 X191.898 Y201.838 E2.69264
N11002 ; COOLING_NODE: 0
N11003 M204 S10000
N11004 G1 X192.29 Y202.29 F60000
N11005 ; FEATURE: Outer wall
N11006 ; LINE_WIDTH: 0.42
N11007 G1 F4773.528
N11008 M204 S5000
N11009 G1 X157.71 Y202.29 E1.03002
N11010 G1 X157.71 Y117.71 E2.51935
N11011 G1 X192.29 Y117.71 E1.03002
N11012 G1 X192.29 Y202.23 E2.51756
N11013 G1 E-.8 F1800
N11014 M204 S10000
N11015 G1 X191.592 Y194.63 Z8.4 F60000
N11016 G1 X190.736 Y185.298 Z8.4
N11017 G1 Z8
N11018 G1 E.8 F1800
N11019 ; FEATURE: Sparse infill
N11020 ; LINE_WIDTH: 0.45
N11021 G1 F4421.739
N11022 M204 S8000
N11023 G1 X190.736 Y186.926 E.05236
N11024 G1 X159.264 Y195.359 E1.0477
N11025 G1 X159.264 Y193.834 E.04904
N11026 G1 X166.166 Y200.736 E.31385
N11027 G1 X166.657 Y200.736 E.01581
N11028 G1 X188.487 Y119.264 E2.71223
N11029 G1 X188.32 Y119.264 E.00538
N11030 G1 X190.736 Y121.68 E.10984
N11031 G1 X190.736 Y119.496 E.07022
N11032 G1 X159.264 Y127.929 E1.0477
N11033 G1 X159.264 Y124.751 E.1022
N11034 G1 X190.736 Y156.222 E1.43118
N11035 G1 X190.736 Y153.211 E.0968
N11036 G1 X159.264 Y161.644 E1.0477
N11037 G1 X159.264 Y159.292 E.07562
N11038 G1 X190.736 Y190.763 E1.43118
N11039 G1 X190.736 Y195.355 E.14766
N11040 G1 X170.656 Y200.736 E.66846
N11041 G1 X169.028 Y200.736 E.05236
N11042 M204 S10000
N11043 G1 X159.264 Y198.498 F60000
N11044 G1 F4421.739
N11045 M204 S8000
N11046 G1 X159.264 Y196.869 E.05236
N11047 G1 X180.059 Y119.264 E2.58353
N11048 G1 X176.806 Y119.264 E.10458
N11049 G1 X190.736 Y133.194 E.63345
N11050 G1 X190.736 Y136.354 E.10161
N11051 G1 X159.264 Y144.786 E1.0477
N11052 G1 X159.264 Y147.778 E.09621
N11053 G1 X190.736 Y179.249 E1.43118
N11054 G1 X190.736 Y178.498 E.02418
N11055 G1 X159.264 Y186.93 E1.0477
N11056 G1 X159.264 Y188.559 E.05236
N11057 M204 S10000
N11058 G1 X190.736 Y172.16 F60000
N11059 G1 F4421.739
N11060 M204 S8000
N11061 G1 X190.736 Y173.788 E.05236
N11062 G1 X183.515 Y200.736 E.89711
N11063 G1 X189.194 Y200.736 E.18261
N11064 G1 X159.264 Y170.806 E1.36106
N11065 G1 X159.264 Y170.073 E.02359
N11066 G1 X190.736 Y161.64 E1.0477
N11067 G1 X190.736 Y163.268 E.05236
N11068 M204 S10000
N11069 G1 X190.736 Y140.703 F60000
N11070 G1 F4421.739
N11071 M204 S8000
N11072 G1 X190.736 Y142.331 E.05236
N11073 G1 X175.086 Y200.736 E1.94432
N11074 G1 X177.68 Y200.736 E.0834
N11075 G1 X159.264 Y182.32 E.83745
N11076 G1 X159.264 Y178.502 E.1228
N11077 G1 X190.736 Y170.069 E1.0477
N11078 G1 X190.736 Y167.736 E.07503
N11079 G1 X159.264 Y136.264 E1.43118
N11080 G1 X159.264 Y136.358 E.00299
N11081 G1 X190.736 Y127.925 E1.0477
N11082 G1 X190.736 Y126.297 E.05236
N11083 M204 S10000
N11084 G1 X159.264 Y121.128 F60000
N11085 G1 F4421.739
N11086 M204 S8000
N11087 G1 X159.264 Y119.5 E.05236
N11088 G1 X160.143 Y119.264 E.02926
N11089 G1 X161.772 Y119.264 E.05236
N11090 M204 S10000
N11091 G1 X170.002 Y119.264 F60000
N11092 G1 F4421.739
N11093 M204 S8000
N11094 G1 X171.63 Y119.264 E.05236
N11095 G1 X159.264 Y165.413 E1.53631
N11096 G1 X159.264 Y167.041 E.05236
N11097 M204 S10000
N11098 G1 X159.264 Y154.843 F60000
N11099 G1 F4421.739
N11100 M204 S8000
N11101 G1 X159.264 Y153.215 E.05236
N11102 G1 X190.736 Y144.782 E1.0477
N11103 G1 X190.736 Y144.708 E.00241
N11104 G1 X165.292 Y119.264 E1.15705
N11105 G1 X163.201 Y119.264 E.06725
N11106 G1 X159.264 Y133.956 E.48909
N11107 G1 X159.264 Y135.584 E.05236
N11108 ; WIPE_START
N11109 G1 X159.264 Y133.956 E-.61876
N11110 G1 X159.361 Y133.597 E-.14124
N11111 ; WIPE_END
N11112 G1 E-.04 F1800
N11113 M204 S10000
N11114 G17
N11115 G3 Z8.4 I1.217 J0 P1  F60000
N11116 ; stop printing object, unique label id: 372
N11117 M625
N11118 ; object ids of layer 40 start: 372
N11119 M624 AQAAAAAAAAA=
N11120 ;======== H2D 20250527========
N11121 ; SKIPPABLE_START
N11122 ; SKIPTYPE: timelapse
N11123 M622.1 S1 ; for prev firware, default turned on
N11124 
N11125 M1002 judge_flag timelapse_record_flag
N11126 
N11127 M622 J1
N11128 M993 A2 B2 C2
N11129 M993 A0 B0 C0
N11130 
N11131 
N11132 
N11133 
N11134     M9711 M0 E1 X261 Y132 Z8.4 S11 C10 O0 T3000
N11135 
N11136 
N11137 
N11138 M993 A3 B3 C3
N11139 
N11140 M623
N11141 ; SKIPPABLE_END
N11142 
N11143 ; object ids of this layer40 end: 372
N11144 M625
N11145 ; CHANGE_LAYER
N11146 ; Z_HEIGHT: 8.2
N11147 ; LAYER_HEIGHT: 0.2
N11148 ;======== H2D 20250521========
N11149 ; layer num/total_layer_count: 41/75
N11150 ; update layer progress
N11151 M73 L41
N11152 M991 S0 P40 ;notify layer change
N11153 
N11154 
N11155 ; OBJECT_ID: 372
N11156 ; COOLING_NODE: 0
N11157 ; start printing object, unique label id: 372
N11158 M624 AQAAAAAAAAA=
N11159 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=8.100G1 Z8.100 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N10980 G1 X158.916 Y201.084 E1.03439
N10981 G1 X158.916 Y118.916 E2.64221
N10982 G1 X191.084 Y118.916 E1.03439
N10983 G1 X191.084 Y201.024 E2.64028
N10989 G1 X158.509 Y201.491 E1.06057
N10990 G1 X158.509 Y118.509 E2.66839
N10991 G1 X191.491 Y118.509 E1.06057
N10992 G1 X191.491 Y201.431 E2.66646
N10998 G1 X158.102 Y201.898 E1.08675
N10999 G1 X158.102 Y118.102 E2.69457
N11000 G1 X191.898 Y118.102 E1.08675
N11001 G1 X191.898 Y201.838 E2.69264
N11009 G1 X157.71 Y202.29 E1.03002
N11010 G1 X157.71 Y117.71 E2.51935
N11011 G1 X192.29 Y117.71 E1.03002
N11012 G1 X192.29 Y202.23 E2.51756
N11023 G1 X190.736 Y186.926 E.05236
N11024 G1 X159.264 Y195.359 E1.0477
N11025 G1 X159.264 Y193.834 E.04904
N11026 G1 X166.166 Y200.736 E.31385
N11027 G1 X166.657 Y200.736 E.01581
N11028 G1 X188.487 Y119.264 E2.71223
N11029 G1 X188.32 Y119.264 E.00538
N11030 G1 X190.736 Y121.68 E.10984
N11031 G1 X190.736 Y119.496 E.07022
N11032 G1 X159.264 Y127.929 E1.0477
N11033 G1 X159.264 Y124.751 E.1022
N11034 G1 X190.736 Y156.222 E1.43118
N11035 G1 X190.736 Y153.211 E.0968
N11036 G1 X159.264 Y161.644 E1.0477
N11037 G1 X159.264 Y159.292 E.07562
N11038 G1 X190.736 Y190.763 E1.43118
N11039 G1 X190.736 Y195.355 E.14766
N11040 G1 X170.656 Y200.736 E.66846
N11041 G1 X169.028 Y200.736 E.05236
N11046 G1 X159.264 Y196.869 E.05236
N11047 G1 X180.059 Y119.264 E2.58353
N11048 G1 X176.806 Y119.264 E.10458
N11049 G1 X190.736 Y133.194 E.63345
N11050 G1 X190.736 Y136.354 E.10161
N11051 G1 X159.264 Y144.786 E1.0477
N11052 G1 X159.264 Y147.778 E.09621
N11053 G1 X190.736 Y179.249 E1.43118
N11054 G1 X190.736 Y178.498 E.02418
N11055 G1 X159.264 Y186.93 E1.0477
N11056 G1 X159.264 Y188.559 E.05236
N11061 G1 X190.736 Y173.788 E.05236
N11062 G1 X183.515 Y200.736 E.89711
N11063 G1 X189.194 Y200.736 E.18261
N11064 G1 X159.264 Y170.806 E1.36106
N11065 G1 X159.264 Y170.073 E.02359
N11066 G1 X190.736 Y161.64 E1.0477
N11067 G1 X190.736 Y163.268 E.05236
N11072 G1 X190.736 Y142.331 E.05236
N11073 G1 X175.086 Y200.736 E1.94432
N11074 G1 X177.68 Y200.736 E.0834
N11075 G1 X159.264 Y182.32 E.83745
N11076 G1 X159.264 Y178.502 E.1228
N11077 G1 X190.736 Y170.069 E1.0477
N11078 G1 X190.736 Y167.736 E.07503
N11079 G1 X159.264 Y136.264 E1.43118
N11080 G1 X159.264 Y136.358 E.00299
N11081 G1 X190.736 Y127.925 E1.0477
N11082 G1 X190.736 Y126.297 E.05236
N11087 G1 X159.264 Y119.5 E.05236
N11088 G1 X160.143 Y119.264 E.02926
N11089 G1 X161.772 Y119.264 E.05236
N11094 G1 X171.63 Y119.264 E.05236
N11095 G1 X159.264 Y165.413 E1.53631
N11096 G1 X159.264 Y167.041 E.05236
N11101 G1 X159.264 Y153.215 E.05236
N11102 G1 X190.736 Y144.782 E1.0477
N11103 G1 X190.736 Y144.708 E.00241
N11104 G1 X165.292 Y119.264 E1.15705
N11105 G1 X163.201 Y119.264 E.06725
N11106 G1 X159.264 Y133.956 E.48909
N11107 G1 X159.264 Y135.584 E.05236
N11109 G1 X159.264 Y133.956 E-.61876
N11110 G1 X159.361 Y133.597 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN11160 G1 Z8.2
N11161 G1 E.8 F1800
N11162 ; FEATURE: Inner wall
N11163 ; LINE_WIDTH: 0.45
N11164 ; LAYER_HEIGHT: 0.2
N11165 G1 F4421.739
N11166 M204 S8000
N11167 G1 X158.916 Y201.084 E1.03439
N11168 G1 X158.916 Y118.916 E2.64221
N11169 G1 X191.084 Y118.916 E1.03439
N11170 G1 X191.084 Y201.024 E2.64028
N11171 ; COOLING_NODE: 0
N11172 M204 S10000
N11173 G1 X191.491 Y201.491 F60000
N11174 G1 F4421.739
N11175 M204 S8000
N11176 G1 X158.509 Y201.491 E1.06057
N11177 G1 X158.509 Y118.509 E2.66839
N11178 G1 X191.491 Y118.509 E1.06057
N11179 G1 X191.491 Y201.431 E2.66646
N11180 ; COOLING_NODE: 0
N11181 M204 S10000
N11182 G1 X191.898 Y201.898 F60000
N11183 G1 F4421.739
N11184 M204 S8000
N11185 M73 P63 R23
N11186 G1 X158.102 Y201.898 E1.08675
N11187 G1 X158.102 Y118.102 E2.69457
N11188 G1 X191.898 Y118.102 E1.08675
N11189 G1 X191.898 Y201.838 E2.69264
N11190 ; COOLING_NODE: 0
N11191 M204 S10000
N11192 G1 X192.29 Y202.29 F60000
N11193 ; FEATURE: Outer wall
N11194 ; LINE_WIDTH: 0.42
N11195 G1 F4773.528
N11196 M204 S5000
N11197 G1 X157.71 Y202.29 E1.03002
N11198 G1 X157.71 Y117.71 E2.51935
N11199 G1 X192.29 Y117.71 E1.03002
N11200 G1 X192.29 Y202.23 E2.51756
N11201 G1 E-.8 F1800
N11202 M204 S10000
N11203 G1 X190.736 Y197.13 Z8.6 F60000
N11204 G1 Z8.2
N11205 G1 E.8 F1800
N11206 ; FEATURE: Sparse infill
N11207 ; LINE_WIDTH: 0.45
N11208 G1 F4421.739
N11209 M204 S8000
N11210 G1 X190.736 Y195.502 E.05236
N11211 G1 X171.202 Y200.736 E.65027
N11212 G1 X169.574 Y200.736 E.05236
N11213 M204 S10000
N11214 G1 X159.264 Y197.951 F60000
N11215 G1 F4421.739
N11216 M204 S8000
N11217 G1 X159.264 Y196.323 E.05236
N11218 G1 X179.912 Y119.264 E2.56534
N11219 G1 X177.006 Y119.264 E.09344
N11220 G1 X190.736 Y132.994 E.62435
N11221 G1 X190.736 Y136.5 E.11275
N11222 G1 X159.264 Y144.933 E1.0477
N11223 G1 X159.264 Y147.578 E.08508
N11224 G1 X190.736 Y179.049 E1.43118
N11225 G1 X190.736 Y178.644 E.01304
N11226 G1 X159.264 Y187.077 E1.0477
N11227 G1 X159.264 Y193.634 E.21087
N11228 G1 X166.366 Y200.736 E.32294
N11229 G1 X166.511 Y200.736 E.00467
N11230 M73 P63 R22
N11231 G1 X188.341 Y119.264 E2.71223
N11232 G1 X188.52 Y119.264 E.00576
N11233 G1 X190.736 Y121.48 E.10074
N11234 G1 X190.736 Y119.643 E.05908
N11235 G1 X159.264 Y128.075 E1.04769
N11236 G1 X159.264 Y124.551 E.11334
N11237 G1 X190.736 Y156.022 E1.43118
N11238 G1 X190.736 Y153.358 E.08566
N11239 G1 X159.264 Y161.79 E1.0477
N11240 G1 X159.264 Y159.092 E.08676
N11241 G1 X190.736 Y190.563 E1.43118
N11242 G1 X190.736 Y187.073 E.11224
N11243 G1 X159.264 Y195.506 E1.0477
N11244 M204 S10000
N11245 G1 X159.264 Y166.495 F60000
N11246 G1 F4421.739
N11247 M204 S8000
N11248 G1 X159.264 Y164.866 E.05236
N11249 G1 X171.483 Y119.264 E1.51812
N11250 G1 X165.492 Y119.264 E.19265
N11251 G1 X190.736 Y144.508 E1.14796
N11252 G1 X190.736 Y144.929 E.01355
N11253 G1 X159.264 Y153.362 E1.0477
N11254 G1 X159.264 Y151.733 E.05236
N11255 M204 S10000
N11256 G1 X159.264 Y135.038 F60000
N11257 G1 F4421.739
N11258 M204 S8000
N11259 G1 X159.264 Y133.41 E.05236
N11260 G1 X163.055 Y119.264 E.4709
N11261 G1 X160.69 Y119.264 E.07605
N11262 G1 X159.264 Y119.646 E.04745
N11263 G1 X159.264 Y121.275 E.05236
N11264 M204 S10000
N11265 G1 X190.736 Y126.443 F60000
N11266 G1 F4421.739
N11267 M204 S8000
N11268 G1 X190.736 Y128.071 E.05236
N11269 G1 X159.264 Y136.504 E1.0477
N11270 G1 X159.264 Y136.064 E.01413
N11271 G1 X190.736 Y167.536 E1.43118
N11272 G1 X190.736 Y170.215 E.08617
N11273 G1 X159.264 Y178.648 E1.0477
N11274 G1 X159.264 Y182.12 E.11166
N11275 G1 X177.88 Y200.736 E.84655
N11276 G1 X174.94 Y200.736 E.09454
N11277 G1 X190.736 Y141.785 E1.96251
N11278 G1 X190.736 Y140.156 E.05236
N11279 M204 S10000
N11280 G1 X190.736 Y160.158 F60000
N11281 G1 F4421.739
N11282 M204 S8000
N11283 G1 X190.736 Y161.786 E.05236
N11284 G1 X159.264 Y170.219 E1.04769
N11285 G1 X159.264 Y170.606 E.01245
N11286 G1 X189.394 Y200.736 E1.37016
N11287 G1 X183.369 Y200.736 E.19375
N11288 G1 X190.736 Y173.241 E.9153
N11289 G1 X190.736 Y171.613 E.05236
N11290 ; WIPE_START
N11291 G1 X190.736 Y173.241 E-.61876
N11292 G1 X190.639 Y173.6 E-.14124
N11293 ; WIPE_END
N11294 G1 E-.04 F1800
N11295 M204 S10000
N11296 G17
N11297 G3 Z8.6 I1.217 J0 P1  F60000
N11298 ; stop printing object, unique label id: 372
N11299 M625
N11300 ; object ids of layer 41 start: 372
N11301 M624 AQAAAAAAAAA=
N11302 ;======== H2D 20250527========
N11303 ; SKIPPABLE_START
N11304 ; SKIPTYPE: timelapse
N11305 M622.1 S1 ; for prev firware, default turned on
N11306 
N11307 M1002 judge_flag timelapse_record_flag
N11308 
N11309 M622 J1
N11310 M993 A2 B2 C2
N11311 M993 A0 B0 C0
N11312 
N11313 
N11314 
N11315 
N11316     M9711 M0 E1 X261 Y132 Z8.6 S11 C10 O0 T3000
N11317 
N11318 
N11319 
N11320 M993 A3 B3 C3
N11321 
N11322 M623
N11323 ; SKIPPABLE_END
N11324 
N11325 ; object ids of this layer41 end: 372
N11326 M625
N11327 ; CHANGE_LAYER
N11328 ; Z_HEIGHT: 8.4
N11329 ; LAYER_HEIGHT: 0.2
N11330 ;======== H2D 20250521========
N11331 ; layer num/total_layer_count: 42/75
N11332 ; update layer progress
N11333 M73 L42
N11334 M991 S0 P41 ;notify layer change
N11335 
N11336 
N11337 ; OBJECT_ID: 372
N11338 ; COOLING_NODE: 0
N11339 ; start printing object, unique label id: 372
N11340 M624 AQAAAAAAAAA=
N11341 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=8.300G1 Z8.300 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N11167 G1 X158.916 Y201.084 E1.03439
N11168 G1 X158.916 Y118.916 E2.64221
N11169 G1 X191.084 Y118.916 E1.03439
N11170 G1 X191.084 Y201.024 E2.64028
N11176 G1 X158.509 Y201.491 E1.06057
N11177 G1 X158.509 Y118.509 E2.66839
N11178 G1 X191.491 Y118.509 E1.06057
N11179 G1 X191.491 Y201.431 E2.66646
N11186 G1 X158.102 Y201.898 E1.08675
N11187 G1 X158.102 Y118.102 E2.69457
N11188 G1 X191.898 Y118.102 E1.08675
N11189 G1 X191.898 Y201.838 E2.69264
N11197 G1 X157.71 Y202.29 E1.03002
N11198 G1 X157.71 Y117.71 E2.51935
N11199 G1 X192.29 Y117.71 E1.03002
N11200 G1 X192.29 Y202.23 E2.51756
N11210 G1 X190.736 Y195.502 E.05236
N11211 G1 X171.202 Y200.736 E.65027
N11212 G1 X169.574 Y200.736 E.05236
N11217 G1 X159.264 Y196.323 E.05236
N11218 G1 X179.912 Y119.264 E2.56534
N11219 G1 X177.006 Y119.264 E.09344
N11220 G1 X190.736 Y132.994 E.62435
N11221 G1 X190.736 Y136.5 E.11275
N11222 G1 X159.264 Y144.933 E1.0477
N11223 G1 X159.264 Y147.578 E.08508
N11224 G1 X190.736 Y179.049 E1.43118
N11225 G1 X190.736 Y178.644 E.01304
N11226 G1 X159.264 Y187.077 E1.0477
N11227 G1 X159.264 Y193.634 E.21087
N11228 G1 X166.366 Y200.736 E.32294
N11229 G1 X166.511 Y200.736 E.00467
N11231 G1 X188.341 Y119.264 E2.71223
N11232 G1 X188.52 Y119.264 E.00576
N11233 G1 X190.736 Y121.48 E.10074
N11234 G1 X190.736 Y119.643 E.05908
N11235 G1 X159.264 Y128.075 E1.04769
N11236 G1 X159.264 Y124.551 E.11334
N11237 G1 X190.736 Y156.022 E1.43118
N11238 G1 X190.736 Y153.358 E.08566
N11239 G1 X159.264 Y161.79 E1.0477
N11240 G1 X159.264 Y159.092 E.08676
N11241 G1 X190.736 Y190.563 E1.43118
N11242 G1 X190.736 Y187.073 E.11224
N11243 G1 X159.264 Y195.506 E1.0477
N11248 G1 X159.264 Y164.866 E.05236
N11249 G1 X171.483 Y119.264 E1.51812
N11250 G1 X165.492 Y119.264 E.19265
N11251 G1 X190.736 Y144.508 E1.14796
N11252 G1 X190.736 Y144.929 E.01355
N11253 G1 X159.264 Y153.362 E1.0477
N11254 G1 X159.264 Y151.733 E.05236
N11259 G1 X159.264 Y133.41 E.05236
N11260 G1 X163.055 Y119.264 E.4709
N11261 G1 X160.69 Y119.264 E.07605
N11262 G1 X159.264 Y119.646 E.04745
N11263 G1 X159.264 Y121.275 E.05236
N11268 G1 X190.736 Y128.071 E.05236
N11269 G1 X159.264 Y136.504 E1.0477
N11270 G1 X159.264 Y136.064 E.01413
N11271 G1 X190.736 Y167.536 E1.43118
N11272 G1 X190.736 Y170.215 E.08617
N11273 G1 X159.264 Y178.648 E1.0477
N11274 G1 X159.264 Y182.12 E.11166
N11275 G1 X177.88 Y200.736 E.84655
N11276 G1 X174.94 Y200.736 E.09454
N11277 G1 X190.736 Y141.785 E1.96251
N11278 G1 X190.736 Y140.156 E.05236
N11283 G1 X190.736 Y161.786 E.05236
N11284 G1 X159.264 Y170.219 E1.04769
N11285 G1 X159.264 Y170.606 E.01245
N11286 G1 X189.394 Y200.736 E1.37016
N11287 G1 X183.369 Y200.736 E.19375
N11288 G1 X190.736 Y173.241 E.9153
N11289 G1 X190.736 Y171.613 E.05236
N11291 G1 X190.736 Y173.241 E-.61876
N11292 G1 X190.639 Y173.6 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN11342 G1 Z8.4
N11343 G1 E.8 F1800
N11344 ; FEATURE: Inner wall
N11345 ; LINE_WIDTH: 0.45
N11346 ; LAYER_HEIGHT: 0.2
N11347 G1 F4421.739
N11348 M204 S8000
N11349 G1 X158.916 Y201.084 E1.03439
N11350 G1 X158.916 Y118.916 E2.64221
N11351 G1 X191.084 Y118.916 E1.03439
N11352 G1 X191.084 Y201.024 E2.64028
N11353 ; COOLING_NODE: 0
N11354 M204 S10000
N11355 G1 X191.491 Y201.491 F60000
N11356 G1 F4421.739
N11357 M204 S8000
N11358 G1 X158.509 Y201.491 E1.06057
N11359 G1 X158.509 Y118.509 E2.66839
N11360 G1 X191.491 Y118.509 E1.06057
N11361 G1 X191.491 Y201.431 E2.66646
N11362 ; COOLING_NODE: 0
N11363 M204 S10000
N11364 G1 X191.898 Y201.898 F60000
N11365 G1 F4421.739
N11366 M204 S8000
N11367 G1 X158.102 Y201.898 E1.08675
N11368 G1 X158.102 Y118.102 E2.69457
N11369 G1 X191.898 Y118.102 E1.08675
N11370 G1 X191.898 Y201.838 E2.69264
N11371 ; COOLING_NODE: 0
N11372 M204 S10000
N11373 G1 X192.29 Y202.29 F60000
N11374 ; FEATURE: Outer wall
N11375 ; LINE_WIDTH: 0.42
N11376 G1 F4773.528
N11377 M204 S5000
N11378 G1 X157.71 Y202.29 E1.03002
N11379 G1 X157.71 Y117.71 E2.51935
N11380 G1 X192.29 Y117.71 E1.03002
N11381 G1 X192.29 Y202.23 E2.51756
N11382 G1 E-.8 F1800
N11383 M204 S10000
N11384 G1 X184.85 Y200.736 Z8.8 F60000
N11385 G1 Z8.4
N11386 G1 E.8 F1800
N11387 ; FEATURE: Sparse infill
N11388 ; LINE_WIDTH: 0.45
N11389 G1 F4421.739
N11390 M204 S8000
N11391 G1 X183.222 Y200.736 E.05236
N11392 G1 X190.736 Y172.695 E.93349
N11393 G1 X190.736 Y170.362 E.07503
N11394 G1 X159.264 Y178.794 E1.0477
N11395 G1 X159.264 Y181.92 E.10052
N11396 G1 X178.08 Y200.736 E.85564
N11397 G1 X174.793 Y200.736 E.10568
N11398 G1 X190.736 Y141.238 E1.9807
N11399 G1 X190.736 Y139.61 E.05236
N11400 M204 S10000
N11401 G1 X190.736 Y126.589 F60000
N11402 G1 F4421.739
N11403 M204 S8000
N11404 M73 P64 R22
N11405 G1 X190.736 Y128.218 E.05236
N11406 G1 X159.264 Y136.65 E1.0477
N11407 G1 X159.264 Y135.864 E.02527
N11408 G1 X190.736 Y167.336 E1.43118
N11409 G1 X190.736 Y161.933 E.17373
N11410 G1 X159.264 Y170.366 E1.0477
N11411 G1 X159.264 Y170.406 E.00131
N11412 G1 X189.594 Y200.736 E1.37925
N11413 G1 X190.736 Y200.736 E.03672
N11414 G1 X190.736 Y195.648 E.16359
N11415 G1 X171.749 Y200.736 E.63208
N11416 G1 X170.121 Y200.736 E.05236
N11417 M204 S10000
N11418 G1 X159.264 Y191.806 F60000
N11419 G1 F4421.739
N11420 M204 S8000
N11421 G1 X159.264 Y193.434 E.05236
N11422 G1 X166.566 Y200.736 E.33204
N11423 G1 X166.365 Y200.736 E.00647
N11424 G1 X188.195 Y119.264 E2.71223
N11425 G1 X188.72 Y119.264 E.0169
N11426 G1 X190.736 Y121.28 E.09165
N11427 G1 X190.736 Y119.789 E.04794
N11428 G1 X159.264 Y128.222 E1.0477
N11429 G1 X159.264 Y124.351 E.12448
N11430 G1 X190.736 Y155.822 E1.43118
N11431 G1 X190.736 Y153.504 E.07452
N11432 G1 X159.264 Y161.937 E1.0477
N11433 G1 X159.264 Y158.892 E.0979
N11434 G1 X190.736 Y190.363 E1.43118
N11435 G1 X190.736 Y187.219 E.1011
N11436 G1 X159.264 Y195.652 E1.0477
N11437 G1 X159.264 Y195.777 E.00401
N11438 G1 X179.766 Y119.264 E2.54715
N11439 G1 X177.206 Y119.264 E.08231
N11440 G1 X190.736 Y132.794 E.61526
N11441 G1 X190.736 Y136.647 E.12389
N11442 G1 X159.264 Y145.079 E1.0477
N11443 G1 X159.264 Y147.378 E.07394
N11444 G1 X190.736 Y178.849 E1.43118
N11445 G1 X190.736 Y178.79 E.0019
N11446 G1 X159.264 Y187.223 E1.0477
N11447 G1 X159.264 Y185.595 E.05236
N11448 M204 S10000
N11449 G1 X159.264 Y165.948 F60000
N11450 G1 F4421.739
N11451 M204 S8000
N11452 G1 X159.264 Y164.32 E.05236
N11453 G1 X171.337 Y119.264 E1.49993
N11454 G1 X165.692 Y119.264 E.18151
N11455 G1 X190.736 Y144.308 E1.13886
N11456 G1 X190.736 Y145.075 E.02469
N11457 G1 X159.264 Y153.508 E1.0477
N11458 G1 X159.264 Y151.88 E.05236
N11459 M204 S10000
N11460 G1 X159.264 Y134.492 F60000
N11461 G1 F4421.739
N11462 M204 S8000
N11463 G1 X159.264 Y132.863 E.05236
N11464 G1 X162.908 Y119.264 E.45271
N11465 G1 X161.236 Y119.264 E.05377
N11466 G1 X159.264 Y119.793 E.06564
N11467 G1 X159.264 Y121.421 E.05236
N11468 ; WIPE_START
N11469 G1 X159.264 Y119.793 E-.61876
N11470 G1 X159.623 Y119.697 E-.14124
N11471 ; WIPE_END
N11472 G1 E-.04 F1800
N11473 M204 S10000
N11474 G17
N11475 G3 Z8.8 I1.217 J0 P1  F60000
N11476 ; stop printing object, unique label id: 372
N11477 M625
N11478 ; object ids of layer 42 start: 372
N11479 M624 AQAAAAAAAAA=
N11480 ;======== H2D 20250527========
N11481 ; SKIPPABLE_START
N11482 ; SKIPTYPE: timelapse
N11483 M622.1 S1 ; for prev firware, default turned on
N11484 
N11485 M1002 judge_flag timelapse_record_flag
N11486 
N11487 M622 J1
N11488 M993 A2 B2 C2
N11489 M993 A0 B0 C0
N11490 
N11491 
N11492 
N11493 
N11494     M9711 M0 E1 X261 Y132 Z8.8 S11 C10 O0 T3000
N11495 
N11496 
N11497 
N11498 M993 A3 B3 C3
N11499 
N11500 M623
N11501 ; SKIPPABLE_END
N11502 
N11503 ; object ids of this layer42 end: 372
N11504 M625
N11505 ; CHANGE_LAYER
N11506 ; Z_HEIGHT: 8.6
N11507 ; LAYER_HEIGHT: 0.200001
N11508 ;======== H2D 20250521========
N11509 ; layer num/total_layer_count: 43/75
N11510 ; update layer progress
N11511 M73 L43
N11512 M991 S0 P42 ;notify layer change
N11513 
N11514 
N11515 ; OBJECT_ID: 372
N11516 ; COOLING_NODE: 0
N11517 ; start printing object, unique label id: 372
N11518 M624 AQAAAAAAAAA=
N11519 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=8.500G1 Z8.500 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N11349 G1 X158.916 Y201.084 E1.03439
N11350 G1 X158.916 Y118.916 E2.64221
N11351 G1 X191.084 Y118.916 E1.03439
N11352 G1 X191.084 Y201.024 E2.64028
N11358 G1 X158.509 Y201.491 E1.06057
N11359 G1 X158.509 Y118.509 E2.66839
N11360 G1 X191.491 Y118.509 E1.06057
N11361 G1 X191.491 Y201.431 E2.66646
N11367 G1 X158.102 Y201.898 E1.08675
N11368 G1 X158.102 Y118.102 E2.69457
N11369 G1 X191.898 Y118.102 E1.08675
N11370 G1 X191.898 Y201.838 E2.69264
N11378 G1 X157.71 Y202.29 E1.03002
N11379 G1 X157.71 Y117.71 E2.51935
N11380 G1 X192.29 Y117.71 E1.03002
N11381 G1 X192.29 Y202.23 E2.51756
N11391 G1 X183.222 Y200.736 E.05236
N11392 G1 X190.736 Y172.695 E.93349
N11393 G1 X190.736 Y170.362 E.07503
N11394 G1 X159.264 Y178.794 E1.0477
N11395 G1 X159.264 Y181.92 E.10052
N11396 G1 X178.08 Y200.736 E.85564
N11397 G1 X174.793 Y200.736 E.10568
N11398 G1 X190.736 Y141.238 E1.9807
N11399 G1 X190.736 Y139.61 E.05236
N11405 G1 X190.736 Y128.218 E.05236
N11406 G1 X159.264 Y136.65 E1.0477
N11407 G1 X159.264 Y135.864 E.02527
N11408 G1 X190.736 Y167.336 E1.43118
N11409 G1 X190.736 Y161.933 E.17373
N11410 G1 X159.264 Y170.366 E1.0477
N11411 G1 X159.264 Y170.406 E.00131
N11412 G1 X189.594 Y200.736 E1.37925
N11413 G1 X190.736 Y200.736 E.03672
N11414 G1 X190.736 Y195.648 E.16359
N11415 G1 X171.749 Y200.736 E.63208
N11416 G1 X170.121 Y200.736 E.05236
N11421 G1 X159.264 Y193.434 E.05236
N11422 G1 X166.566 Y200.736 E.33204
N11423 G1 X166.365 Y200.736 E.00647
N11424 G1 X188.195 Y119.264 E2.71223
N11425 G1 X188.72 Y119.264 E.0169
N11426 G1 X190.736 Y121.28 E.09165
N11427 G1 X190.736 Y119.789 E.04794
N11428 G1 X159.264 Y128.222 E1.0477
N11429 G1 X159.264 Y124.351 E.12448
N11430 G1 X190.736 Y155.822 E1.43118
N11431 G1 X190.736 Y153.504 E.07452
N11432 G1 X159.264 Y161.937 E1.0477
N11433 G1 X159.264 Y158.892 E.0979
N11434 G1 X190.736 Y190.363 E1.43118
N11435 G1 X190.736 Y187.219 E.1011
N11436 G1 X159.264 Y195.652 E1.0477
N11437 G1 X159.264 Y195.777 E.00401
N11438 G1 X179.766 Y119.264 E2.54715
N11439 G1 X177.206 Y119.264 E.08231
N11440 G1 X190.736 Y132.794 E.61526
N11441 G1 X190.736 Y136.647 E.12389
N11442 G1 X159.264 Y145.079 E1.0477
N11443 G1 X159.264 Y147.378 E.07394
N11444 G1 X190.736 Y178.849 E1.43118
N11445 G1 X190.736 Y178.79 E.0019
N11446 G1 X159.264 Y187.223 E1.0477
N11447 G1 X159.264 Y185.595 E.05236
N11452 G1 X159.264 Y164.32 E.05236
N11453 G1 X171.337 Y119.264 E1.49993
N11454 G1 X165.692 Y119.264 E.18151
N11455 G1 X190.736 Y144.308 E1.13886
N11456 G1 X190.736 Y145.075 E.02469
N11457 G1 X159.264 Y153.508 E1.0477
N11458 G1 X159.264 Y151.88 E.05236
N11463 G1 X159.264 Y132.863 E.05236
N11464 G1 X162.908 Y119.264 E.45271
N11465 G1 X161.236 Y119.264 E.05377
N11466 G1 X159.264 Y119.793 E.06564
N11467 G1 X159.264 Y121.421 E.05236
N11469 G1 X159.264 Y119.793 E-.61876
N11470 G1 X159.623 Y119.697 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN11520 G1 Z8.6
N11521 G1 E.8 F1800
N11522 ; FEATURE: Inner wall
N11523 ; LINE_WIDTH: 0.45
N11524 ; LAYER_HEIGHT: 0.2
N11525 G1 F4421.739
N11526 M204 S8000
N11527 G1 X158.916 Y201.084 E1.03439
N11528 G1 X158.916 Y118.916 E2.64221
N11529 G1 X191.084 Y118.916 E1.03439
N11530 G1 X191.084 Y201.024 E2.64028
N11531 ; COOLING_NODE: 0
N11532 M204 S10000
N11533 G1 X191.491 Y201.491 F60000
N11534 G1 F4421.739
N11535 M204 S8000
N11536 G1 X158.509 Y201.491 E1.06057
N11537 G1 X158.509 Y118.509 E2.66839
N11538 G1 X191.491 Y118.509 E1.06057
N11539 G1 X191.491 Y201.431 E2.66646
N11540 ; COOLING_NODE: 0
N11541 M204 S10000
N11542 G1 X191.898 Y201.898 F60000
N11543 G1 F4421.739
N11544 M204 S8000
N11545 G1 X158.102 Y201.898 E1.08675
N11546 G1 X158.102 Y118.102 E2.69457
N11547 G1 X191.898 Y118.102 E1.08675
N11548 G1 X191.898 Y201.838 E2.69264
N11549 ; COOLING_NODE: 0
N11550 M204 S10000
N11551 G1 X192.29 Y202.29 F60000
N11552 ; FEATURE: Outer wall
N11553 ; LINE_WIDTH: 0.42
N11554 G1 F4773.528
N11555 M204 S5000
N11556 G1 X157.71 Y202.29 E1.03002
N11557 G1 X157.71 Y117.71 E2.51935
N11558 G1 X192.29 Y117.71 E1.03002
N11559 G1 X192.29 Y202.23 E2.51756
N11560 G1 E-.8 F1800
N11561 M204 S10000
N11562 G1 X184.801 Y200.755 Z9 F60000
N11563 G1 X184.704 Y200.736 Z9
N11564 G1 Z8.6
N11565 G1 E.8 F1800
N11566 ; FEATURE: Sparse infill
N11567 ; LINE_WIDTH: 0.45
N11568 G1 F4421.739
N11569 M204 S8000
N11570 G1 X183.076 Y200.736 E.05236
N11571 G1 X190.736 Y172.149 E.95168
N11572 G1 X190.736 Y170.508 E.05275
N11573 G1 X159.264 Y178.941 E1.0477
N11574 G1 X159.264 Y181.72 E.08938
N11575 G1 X178.28 Y200.736 E.86474
N11576 G1 X174.647 Y200.736 E.11682
N11577 G1 X190.736 Y140.692 E1.9989
N11578 G1 X190.736 Y136.793 E.12538
N11579 G1 X159.264 Y145.226 E1.0477
N11580 G1 X159.264 Y147.178 E.0628
N11581 G1 X190.736 Y178.649 E1.43118
N11582 G1 X190.736 Y178.937 E.00924
N11583 G1 X159.264 Y187.37 E1.0477
N11584 G1 X159.264 Y193.234 E.18859
N11585 G1 X166.766 Y200.736 E.34113
N11586 G1 X166.218 Y200.736 E.01761
N11587 G1 X188.048 Y119.264 E2.71223
N11588 G1 X188.92 Y119.264 E.02804
N11589 G1 X190.736 Y121.08 E.08255
N11590 G1 X190.736 Y119.935 E.0368
N11591 G1 X159.264 Y128.368 E1.0477
N11592 G1 X159.264 Y126.74 E.05236
N11593 M204 S10000
N11594 G1 X159.264 Y133.945 F60000
N11595 G1 F4421.739
N11596 M204 S8000
N11597 G1 X159.264 Y132.317 E.05236
N11598 G1 X162.762 Y119.264 E.43452
N11599 G1 X161.783 Y119.264 E.03149
N11600 G1 X159.264 Y119.939 E.08383
N11601 G1 X159.264 Y124.151 E.13542
N11602 G1 X190.736 Y155.622 E1.43118
N11603 G1 X190.736 Y153.651 E.06338
N11604 G1 X159.264 Y162.083 E1.0477
N11605 G1 X159.264 Y158.692 E.10904
N11606 G1 X190.736 Y190.163 E1.43118
N11607 G1 X190.736 Y187.366 E.08997
N11608 G1 X159.264 Y195.798 E1.0477
N11609 G1 X159.264 Y195.23 E.01827
N11610 G1 X179.619 Y119.264 E2.52896
N11611 G1 X177.406 Y119.264 E.07117
N11612 M73 P64 R21
N11613 G1 X190.736 Y132.594 E.60616
N11614 G1 X190.736 Y128.364 E.13601
N11615 G1 X159.264 Y136.797 E1.0477
N11616 G1 X159.264 Y135.664 E.03641
N11617 G1 X190.736 Y167.136 E1.43118
N11618 G1 X190.736 Y162.079 E.16259
N11619 G1 X159.264 Y170.512 E1.0477
N11620 G1 X159.264 Y170.206 E.00983
N11621 G1 X189.794 Y200.736 E1.38835
N11622 G1 X190.736 Y200.736 E.03029
N11623 G1 X190.736 Y195.794 E.15889
N11624 G1 X172.295 Y200.736 E.61389
N11625 M73 P65 R21
N11626 G1 X170.667 Y200.736 E.05236
N11627 M204 S10000
N11628 G1 X159.264 Y165.402 F60000
N11629 G1 F4421.739
N11630 M204 S8000
N11631 G1 X159.264 Y163.774 E.05236
N11632 G1 X171.191 Y119.264 E1.48174
N11633 G1 X165.892 Y119.264 E.17037
N11634 G1 X190.736 Y144.108 E1.12977
N11635 G1 X190.736 Y145.222 E.03582
N11636 G1 X159.264 Y153.654 E1.0477
N11637 G1 X159.264 Y152.026 E.05236
N11638 ; WIPE_START
N11639 G1 X159.264 Y153.654 E-.61876
N11640 G1 X159.623 Y153.558 E-.14124
N11641 ; WIPE_END
N11642 G1 E-.04 F1800
N11643 M204 S10000
N11644 G17
N11645 G3 Z9 I1.217 J0 P1  F60000
N11646 ; stop printing object, unique label id: 372
N11647 M625
N11648 ; object ids of layer 43 start: 372
N11649 M624 AQAAAAAAAAA=
N11650 ;======== H2D 20250527========
N11651 ; SKIPPABLE_START
N11652 ; SKIPTYPE: timelapse
N11653 M622.1 S1 ; for prev firware, default turned on
N11654 
N11655 M1002 judge_flag timelapse_record_flag
N11656 
N11657 M622 J1
N11658 M993 A2 B2 C2
N11659 M993 A0 B0 C0
N11660 
N11661 
N11662 
N11663 
N11664     M9711 M0 E1 X261 Y132 Z9 S11 C10 O0 T3000
N11665 
N11666 
N11667 
N11668 M993 A3 B3 C3
N11669 
N11670 M623
N11671 ; SKIPPABLE_END
N11672 
N11673 ; object ids of this layer43 end: 372
N11674 M625
N11675 ; CHANGE_LAYER
N11676 ; Z_HEIGHT: 8.8
N11677 ; LAYER_HEIGHT: 0.2
N11678 ;======== H2D 20250521========
N11679 ; layer num/total_layer_count: 44/75
N11680 ; update layer progress
N11681 M73 L44
N11682 M991 S0 P43 ;notify layer change
N11683 
N11684 
N11685 ; OBJECT_ID: 372
N11686 ; COOLING_NODE: 0
N11687 ; start printing object, unique label id: 372
N11688 M624 AQAAAAAAAAA=
N11689 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=8.700G1 Z8.700 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N11527 G1 X158.916 Y201.084 E1.03439
N11528 G1 X158.916 Y118.916 E2.64221
N11529 G1 X191.084 Y118.916 E1.03439
N11530 G1 X191.084 Y201.024 E2.64028
N11536 G1 X158.509 Y201.491 E1.06057
N11537 G1 X158.509 Y118.509 E2.66839
N11538 G1 X191.491 Y118.509 E1.06057
N11539 G1 X191.491 Y201.431 E2.66646
N11545 G1 X158.102 Y201.898 E1.08675
N11546 G1 X158.102 Y118.102 E2.69457
N11547 G1 X191.898 Y118.102 E1.08675
N11548 G1 X191.898 Y201.838 E2.69264
N11556 G1 X157.71 Y202.29 E1.03002
N11557 G1 X157.71 Y117.71 E2.51935
N11558 G1 X192.29 Y117.71 E1.03002
N11559 G1 X192.29 Y202.23 E2.51756
N11570 G1 X183.076 Y200.736 E.05236
N11571 G1 X190.736 Y172.149 E.95168
N11572 G1 X190.736 Y170.508 E.05275
N11573 G1 X159.264 Y178.941 E1.0477
N11574 G1 X159.264 Y181.72 E.08938
N11575 G1 X178.28 Y200.736 E.86474
N11576 G1 X174.647 Y200.736 E.11682
N11577 G1 X190.736 Y140.692 E1.9989
N11578 G1 X190.736 Y136.793 E.12538
N11579 G1 X159.264 Y145.226 E1.0477
N11580 G1 X159.264 Y147.178 E.0628
N11581 G1 X190.736 Y178.649 E1.43118
N11582 G1 X190.736 Y178.937 E.00924
N11583 G1 X159.264 Y187.37 E1.0477
N11584 G1 X159.264 Y193.234 E.18859
N11585 G1 X166.766 Y200.736 E.34113
N11586 G1 X166.218 Y200.736 E.01761
N11587 G1 X188.048 Y119.264 E2.71223
N11588 G1 X188.92 Y119.264 E.02804
N11589 G1 X190.736 Y121.08 E.08255
N11590 G1 X190.736 Y119.935 E.0368
N11591 G1 X159.264 Y128.368 E1.0477
N11592 G1 X159.264 Y126.74 E.05236
N11597 G1 X159.264 Y132.317 E.05236
N11598 G1 X162.762 Y119.264 E.43452
N11599 G1 X161.783 Y119.264 E.03149
N11600 G1 X159.264 Y119.939 E.08383
N11601 G1 X159.264 Y124.151 E.13542
N11602 G1 X190.736 Y155.622 E1.43118
N11603 G1 X190.736 Y153.651 E.06338
N11604 G1 X159.264 Y162.083 E1.0477
N11605 G1 X159.264 Y158.692 E.10904
N11606 G1 X190.736 Y190.163 E1.43118
N11607 G1 X190.736 Y187.366 E.08997
N11608 G1 X159.264 Y195.798 E1.0477
N11609 G1 X159.264 Y195.23 E.01827
N11610 G1 X179.619 Y119.264 E2.52896
N11611 G1 X177.406 Y119.264 E.07117
N11613 G1 X190.736 Y132.594 E.60616
N11614 G1 X190.736 Y128.364 E.13601
N11615 G1 X159.264 Y136.797 E1.0477
N11616 G1 X159.264 Y135.664 E.03641
N11617 G1 X190.736 Y167.136 E1.43118
N11618 G1 X190.736 Y162.079 E.16259
N11619 G1 X159.264 Y170.512 E1.0477
N11620 G1 X159.264 Y170.206 E.00983
N11621 G1 X189.794 Y200.736 E1.38835
N11622 G1 X190.736 Y200.736 E.03029
N11623 G1 X190.736 Y195.794 E.15889
N11624 G1 X172.295 Y200.736 E.61389
N11626 G1 X170.667 Y200.736 E.05236
N11631 G1 X159.264 Y163.774 E.05236
N11632 G1 X171.191 Y119.264 E1.48174
N11633 G1 X165.892 Y119.264 E.17037
N11634 G1 X190.736 Y144.108 E1.12977
N11635 G1 X190.736 Y145.222 E.03582
N11636 G1 X159.264 Y153.654 E1.0477
N11637 G1 X159.264 Y152.026 E.05236
N11639 G1 X159.264 Y153.654 E-.61876
N11640 G1 X159.623 Y153.558 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN11690 G1 Z8.8
N11691 G1 E.8 F1800
N11692 ; FEATURE: Inner wall
N11693 ; LINE_WIDTH: 0.45
N11694 ; LAYER_HEIGHT: 0.2
N11695 G1 F4421.739
N11696 M204 S8000
N11697 G1 X158.916 Y201.084 E1.03439
N11698 G1 X158.916 Y118.916 E2.64221
N11699 G1 X191.084 Y118.916 E1.03439
N11700 G1 X191.084 Y201.024 E2.64028
N11701 ; COOLING_NODE: 0
N11702 M204 S10000
N11703 G1 X191.491 Y201.491 F60000
N11704 G1 F4421.739
N11705 M204 S8000
N11706 G1 X158.509 Y201.491 E1.06057
N11707 G1 X158.509 Y118.509 E2.66839
N11708 G1 X191.491 Y118.509 E1.06057
N11709 G1 X191.491 Y201.431 E2.66646
N11710 ; COOLING_NODE: 0
N11711 M204 S10000
N11712 G1 X191.898 Y201.898 F60000
N11713 G1 F4421.739
N11714 M204 S8000
N11715 G1 X158.102 Y201.898 E1.08675
N11716 G1 X158.102 Y118.102 E2.69457
N11717 G1 X191.898 Y118.102 E1.08675
N11718 G1 X191.898 Y201.838 E2.69264
N11719 ; COOLING_NODE: 0
N11720 M204 S10000
N11721 G1 X192.29 Y202.29 F60000
N11722 ; FEATURE: Outer wall
N11723 ; LINE_WIDTH: 0.42
N11724 G1 F4773.528
N11725 M204 S5000
N11726 G1 X157.71 Y202.29 E1.03002
N11727 G1 X157.71 Y117.71 E2.51935
N11728 G1 X192.29 Y117.71 E1.03002
N11729 G1 X192.29 Y202.23 E2.51756
N11730 G1 E-.8 F1800
N11731 M204 S10000
N11732 G1 X184.796 Y200.782 Z9.2 F60000
N11733 G1 X184.558 Y200.736 Z9.2
N11734 G1 Z8.8
N11735 G1 E.8 F1800
N11736 ; FEATURE: Sparse infill
N11737 ; LINE_WIDTH: 0.45
N11738 G1 F4421.739
N11739 M204 S8000
N11740 G1 X182.929 Y200.736 E.05236
N11741 G1 X190.736 Y171.602 E.96987
N11742 G1 X190.736 Y170.655 E.03047
N11743 G1 X159.264 Y179.087 E1.0477
N11744 G1 X159.264 Y181.52 E.07824
N11745 G1 X178.48 Y200.736 E.87383
N11746 G1 X174.501 Y200.736 E.12796
N11747 G1 X190.736 Y140.146 E2.01709
N11748 G1 X190.736 Y136.939 E.1031
N11749 G1 X159.264 Y145.372 E1.0477
N11750 G1 X159.264 Y146.978 E.05166
N11751 G1 X190.736 Y178.449 E1.43118
N11752 G1 X190.736 Y179.083 E.02038
N11753 G1 X159.264 Y187.516 E1.0477
N11754 G1 X159.264 Y193.034 E.17745
N11755 G1 X166.966 Y200.736 E.35023
N11756 G1 X166.072 Y200.736 E.02875
N11757 G1 X187.902 Y119.264 E2.71223
N11758 G1 X189.12 Y119.264 E.03918
N11759 G1 X190.736 Y120.88 E.07346
N11760 G1 X190.736 Y120.082 E.02566
N11761 G1 X159.264 Y128.514 E1.0477
N11762 G1 X159.264 Y126.886 E.05236
N11763 M204 S10000
N11764 G1 X159.264 Y133.399 F60000
N11765 G1 F4421.739
N11766 M204 S8000
N11767 G1 X159.264 Y131.77 E.05236
N11768 G1 X162.615 Y119.264 E.41633
N11769 G1 X162.329 Y119.264 E.00921
N11770 G1 X159.264 Y120.086 E.10202
N11771 G1 X159.264 Y123.951 E.12428
N11772 G1 X190.736 Y155.422 E1.43118
N11773 G1 X190.736 Y153.797 E.05224
N11774 G1 X159.264 Y162.23 E1.0477
N11775 M204 S10000
N11776 G1 X159.264 Y164.855 F60000
N11777 G1 F4421.739
N11778 M204 S8000
N11779 G1 X159.264 Y163.227 E.05236
N11780 G1 X171.044 Y119.264 E1.46355
N11781 G1 X166.092 Y119.264 E.15923
N11782 G1 X190.736 Y143.908 E1.12067
N11783 G1 X190.736 Y145.368 E.04696
N11784 G1 X159.264 Y153.801 E1.04769
N11785 G1 X159.264 Y158.492 E.15086
N11786 G1 X190.736 Y189.963 E1.43118
N11787 G1 X190.736 Y187.512 E.07883
N11788 G1 X159.264 Y195.945 E1.04769
N11789 G1 X159.264 Y194.684 E.04055
N11790 G1 X179.473 Y119.264 E2.51077
N11791 G1 X177.606 Y119.264 E.06003
N11792 G1 X190.736 Y132.394 E.59707
N11793 G1 X190.736 Y128.511 E.12487
N11794 G1 X159.264 Y136.943 E1.04769
N11795 G1 X159.264 Y135.464 E.04755
N11796 G1 X190.736 Y166.936 E1.43118
N11797 G1 X190.736 Y162.226 E.15145
N11798 G1 X159.264 Y170.658 E1.0477
N11799 G1 X159.264 Y170.006 E.02097
N11800 G1 X189.994 Y200.736 E1.39744
N11801 G1 X190.736 Y200.736 E.02386
N11802 G1 X190.736 Y195.941 E.15418
N11803 G1 X172.842 Y200.736 E.5957
N11804 G1 X171.213 Y200.736 E.05236
N11805 ; WIPE_START
N11806 G1 X172.842 Y200.736 E-.61876
N11807 G1 X173.201 Y200.639 E-.14124
N11808 ; WIPE_END
N11809 G1 E-.04 F1800
N11810 M204 S10000
N11811 G17
N11812 G3 Z9.2 I1.217 J0 P1  F60000
N11813 ; stop printing object, unique label id: 372
N11814 M625
N11815 ; object ids of layer 44 start: 372
N11816 M624 AQAAAAAAAAA=
N11817 ;======== H2D 20250527========
N11818 ; SKIPPABLE_START
N11819 ; SKIPTYPE: timelapse
N11820 M622.1 S1 ; for prev firware, default turned on
N11821 
N11822 M1002 judge_flag timelapse_record_flag
N11823 
N11824 M622 J1
N11825 M993 A2 B2 C2
N11826 M993 A0 B0 C0
N11827 
N11828 
N11829 
N11830 
N11831     M9711 M0 E1 X261 Y132 Z9.2 S11 C10 O0 T3000
N11832 
N11833 
N11834 
N11835 M993 A3 B3 C3
N11836 
N11837 M623
N11838 ; SKIPPABLE_END
N11839 
N11840 ; object ids of this layer44 end: 372
N11841 M625
N11842 ; CHANGE_LAYER
N11843 ; Z_HEIGHT: 9
N11844 ; LAYER_HEIGHT: 0.2
N11845 ;======== H2D 20250521========
N11846 ; layer num/total_layer_count: 45/75
N11847 ; update layer progress
N11848 M73 L45
N11849 M991 S0 P44 ;notify layer change
N11850 
N11851 
N11852 ; OBJECT_ID: 372
N11853 ; COOLING_NODE: 0
N11854 ; start printing object, unique label id: 372
N11855 M624 AQAAAAAAAAA=
N11856 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=8.900G1 Z8.900 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N11697 G1 X158.916 Y201.084 E1.03439
N11698 G1 X158.916 Y118.916 E2.64221
N11699 G1 X191.084 Y118.916 E1.03439
N11700 G1 X191.084 Y201.024 E2.64028
N11706 G1 X158.509 Y201.491 E1.06057
N11707 G1 X158.509 Y118.509 E2.66839
N11708 G1 X191.491 Y118.509 E1.06057
N11709 G1 X191.491 Y201.431 E2.66646
N11715 G1 X158.102 Y201.898 E1.08675
N11716 G1 X158.102 Y118.102 E2.69457
N11717 G1 X191.898 Y118.102 E1.08675
N11718 G1 X191.898 Y201.838 E2.69264
N11726 G1 X157.71 Y202.29 E1.03002
N11727 G1 X157.71 Y117.71 E2.51935
N11728 G1 X192.29 Y117.71 E1.03002
N11729 G1 X192.29 Y202.23 E2.51756
N11740 G1 X182.929 Y200.736 E.05236
N11741 G1 X190.736 Y171.602 E.96987
N11742 G1 X190.736 Y170.655 E.03047
N11743 G1 X159.264 Y179.087 E1.0477
N11744 G1 X159.264 Y181.52 E.07824
N11745 G1 X178.48 Y200.736 E.87383
N11746 G1 X174.501 Y200.736 E.12796
N11747 G1 X190.736 Y140.146 E2.01709
N11748 G1 X190.736 Y136.939 E.1031
N11749 G1 X159.264 Y145.372 E1.0477
N11750 G1 X159.264 Y146.978 E.05166
N11751 G1 X190.736 Y178.449 E1.43118
N11752 G1 X190.736 Y179.083 E.02038
N11753 G1 X159.264 Y187.516 E1.0477
N11754 G1 X159.264 Y193.034 E.17745
N11755 G1 X166.966 Y200.736 E.35023
N11756 G1 X166.072 Y200.736 E.02875
N11757 G1 X187.902 Y119.264 E2.71223
N11758 G1 X189.12 Y119.264 E.03918
N11759 G1 X190.736 Y120.88 E.07346
N11760 G1 X190.736 Y120.082 E.02566
N11761 G1 X159.264 Y128.514 E1.0477
N11762 G1 X159.264 Y126.886 E.05236
N11767 G1 X159.264 Y131.77 E.05236
N11768 G1 X162.615 Y119.264 E.41633
N11769 G1 X162.329 Y119.264 E.00921
N11770 G1 X159.264 Y120.086 E.10202
N11771 G1 X159.264 Y123.951 E.12428
N11772 G1 X190.736 Y155.422 E1.43118
N11773 G1 X190.736 Y153.797 E.05224
N11774 G1 X159.264 Y162.23 E1.0477
N11779 G1 X159.264 Y163.227 E.05236
N11780 G1 X171.044 Y119.264 E1.46355
N11781 G1 X166.092 Y119.264 E.15923
N11782 G1 X190.736 Y143.908 E1.12067
N11783 G1 X190.736 Y145.368 E.04696
N11784 G1 X159.264 Y153.801 E1.04769
N11785 G1 X159.264 Y158.492 E.15086
N11786 G1 X190.736 Y189.963 E1.43118
N11787 G1 X190.736 Y187.512 E.07883
N11788 G1 X159.264 Y195.945 E1.04769
N11789 G1 X159.264 Y194.684 E.04055
N11790 G1 X179.473 Y119.264 E2.51077
N11791 G1 X177.606 Y119.264 E.06003
N11792 G1 X190.736 Y132.394 E.59707
N11793 G1 X190.736 Y128.511 E.12487
N11794 G1 X159.264 Y136.943 E1.04769
N11795 G1 X159.264 Y135.464 E.04755
N11796 G1 X190.736 Y166.936 E1.43118
N11797 G1 X190.736 Y162.226 E.15145
N11798 G1 X159.264 Y170.658 E1.0477
N11799 G1 X159.264 Y170.006 E.02097
N11800 G1 X189.994 Y200.736 E1.39744
N11801 G1 X190.736 Y200.736 E.02386
N11802 G1 X190.736 Y195.941 E.15418
N11803 G1 X172.842 Y200.736 E.5957
N11804 G1 X171.213 Y200.736 E.05236
N11806 G1 X172.842 Y200.736 E-.61876
N11807 G1 X173.201 Y200.639 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN11857 G1 Z9
N11858 G1 E.8 F1800
N11859 ; FEATURE: Inner wall
N11860 ; LINE_WIDTH: 0.45
N11861 ; LAYER_HEIGHT: 0.2
N11862 G1 F4421.739
N11863 M204 S8000
N11864 G1 X158.916 Y201.084 E1.03439
N11865 G1 X158.916 Y118.916 E2.64221
N11866 G1 X191.084 Y118.916 E1.03439
N11867 G1 X191.084 Y201.024 E2.64028
N11868 ; COOLING_NODE: 0
N11869 M204 S10000
N11870 G1 X191.491 Y201.491 F60000
N11871 G1 F4421.739
N11872 M204 S8000
N11873 G1 X158.509 Y201.491 E1.06057
N11874 G1 X158.509 Y118.509 E2.66839
N11875 G1 X191.491 Y118.509 E1.06057
N11876 G1 X191.491 Y201.431 E2.66646
N11877 ; COOLING_NODE: 0
N11878 M204 S10000
N11879 G1 X191.898 Y201.898 F60000
N11880 G1 F4421.739
N11881 M204 S8000
N11882 G1 X158.102 Y201.898 E1.08675
N11883 G1 X158.102 Y118.102 E2.69457
N11884 G1 X191.898 Y118.102 E1.08675
N11885 G1 X191.898 Y201.838 E2.69264
N11886 ; COOLING_NODE: 0
N11887 M204 S10000
N11888 G1 X192.29 Y202.29 F60000
N11889 ; FEATURE: Outer wall
N11890 ; LINE_WIDTH: 0.42
N11891 M73 P66 R21
N11892 G1 F4773.528
N11893 M204 S5000
N11894 G1 X157.71 Y202.29 E1.03002
N11895 G1 X157.71 Y117.71 E2.51935
N11896 G1 X192.29 Y117.71 E1.03002
N11897 G1 X192.29 Y202.23 E2.51756
N11898 G1 E-.8 F1800
N11899 M204 S10000
N11900 G1 X184.791 Y200.808 Z9.4 F60000
N11901 G1 X184.411 Y200.736 Z9.4
N11902 G1 Z9
N11903 G1 E.8 F1800
N11904 ; FEATURE: Sparse infill
N11905 ; LINE_WIDTH: 0.45
N11906 G1 F4421.739
N11907 M204 S8000
N11908 G1 X182.783 Y200.736 E.05236
N11909 G1 X190.736 Y171.056 E.98806
N11910 G1 X190.736 Y170.801 E.00819
N11911 G1 X159.264 Y179.234 E1.04769
N11912 G1 X159.264 Y181.32 E.0671
N11913 G1 X178.68 Y200.736 E.88293
N11914 G1 X180.308 Y200.736 E.05236
N11915 M204 S10000
N11916 G1 X172.526 Y119.264 F60000
N11917 G1 F4421.739
N11918 M204 S8000
N11919 G1 X170.898 Y119.264 E.05236
N11920 G1 X159.264 Y162.681 E1.44536
N11921 G1 X159.264 Y162.376 E.0098
N11922 G1 X190.736 Y153.943 E1.0477
N11923 G1 X190.736 Y155.222 E.0411
N11924 G1 X159.264 Y123.751 E1.43118
N11925 G1 X159.264 Y120.232 E.11314
N11926 G1 X162.875 Y119.264 E.12021
N11927 G1 X166.292 Y119.264 E.10988
N11928 G1 X190.736 Y143.708 E1.11158
N11929 G1 X190.736 Y145.515 E.0581
N11930 G1 X159.264 Y153.947 E1.0477
N11931 G1 X159.264 Y158.292 E.13972
N11932 G1 X190.736 Y189.763 E1.43118
N11933 G1 X190.736 Y187.659 E.06769
N11934 G1 X159.264 Y196.091 E1.04769
N11935 G1 X159.264 Y194.137 E.06283
N11936 G1 X179.327 Y119.264 E2.49257
N11937 G1 X177.806 Y119.264 E.04889
N11938 G1 X190.736 Y132.194 E.58797
N11939 G1 X190.736 Y128.657 E.11373
N11940 G1 X159.264 Y137.09 E1.04769
N11941 G1 X159.264 Y135.264 E.05869
N11942 G1 X190.736 Y166.736 E1.43118
N11943 G1 X190.736 Y162.372 E.14031
N11944 G1 X159.264 Y170.805 E1.0477
N11945 G1 X159.264 Y169.806 E.03211
N11946 G1 X190.194 Y200.736 E1.40654
N11947 G1 X190.736 Y200.736 E.01742
N11948 G1 X190.736 Y196.087 E.14947
N11949 G1 X173.388 Y200.736 E.57751
N11950 G1 X171.76 Y200.736 E.05236
N11951 M204 S10000
N11952 G1 X174.354 Y200.736 F60000
N11953 G1 F4421.739
N11954 M204 S8000
N11955 G1 X190.736 Y139.599 E2.03528
N11956 G1 X190.736 Y137.086 E.08082
N11957 G1 X159.264 Y145.518 E1.0477
N11958 G1 X159.264 Y146.778 E.04052
N11959 G1 X190.736 Y178.249 E1.43118
N11960 G1 X190.736 Y179.23 E.03152
N11961 G1 X159.264 Y187.662 E1.0477
N11962 G1 X159.264 Y192.834 E.16631
N11963 G1 X167.166 Y200.736 E.35932
N11964 G1 X165.925 Y200.736 E.03989
N11965 G1 X187.755 Y119.264 E2.71223
N11966 G1 X189.32 Y119.264 E.05032
N11967 G1 X190.736 Y120.68 E.06436
N11968 G1 X190.736 Y120.228 E.01452
N11969 M73 P66 R20
N11970 G1 X159.264 Y128.661 E1.0477
N11971 G1 X159.264 Y127.032 E.05236
N11972 M204 S10000
N11973 G1 X159.264 Y132.852 F60000
N11974 G1 F4421.739
N11975 M204 S8000
N11976 G1 X159.264 Y131.224 E.05236
N11977 G1 X162.469 Y119.264 E.39814
N11978 ; WIPE_START
N11979 G1 X161.951 Y121.196 E-.76
N11980 ; WIPE_END
N11981 G1 E-.04 F1800
N11982 M204 S10000
N11983 G17
N11984 G3 Z9.4 I1.217 J0 P1  F60000
N11985 ; stop printing object, unique label id: 372
N11986 M625
N11987 ; object ids of layer 45 start: 372
N11988 M624 AQAAAAAAAAA=
N11989 ;======== H2D 20250527========
N11990 ; SKIPPABLE_START
N11991 ; SKIPTYPE: timelapse
N11992 M622.1 S1 ; for prev firware, default turned on
N11993 
N11994 M1002 judge_flag timelapse_record_flag
N11995 
N11996 M622 J1
N11997 M993 A2 B2 C2
N11998 M993 A0 B0 C0
N11999 
N12000 
N12001 
N12002 
N12003     M9711 M0 E1 X261 Y132 Z9.4 S11 C10 O0 T3000
N12004 
N12005 
N12006 
N12007 M993 A3 B3 C3
N12008 
N12009 M623
N12010 ; SKIPPABLE_END
N12011 
N12012 ; object ids of this layer45 end: 372
N12013 M625
N12014 ; CHANGE_LAYER
N12015 ; Z_HEIGHT: 9.2
N12016 ; LAYER_HEIGHT: 0.2
N12017 ;======== H2D 20250521========
N12018 ; layer num/total_layer_count: 46/75
N12019 ; update layer progress
N12020 M73 L46
N12021 M991 S0 P45 ;notify layer change
N12022 
N12023 
N12024 M106 S40.8
N12025 ; OBJECT_ID: 372
N12026 ; COOLING_NODE: 0
N12027 ; start printing object, unique label id: 372
N12028 M624 AQAAAAAAAAA=
N12029 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=9.100G1 Z9.100 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N11864 G1 X158.916 Y201.084 E1.03439
N11865 G1 X158.916 Y118.916 E2.64221
N11866 G1 X191.084 Y118.916 E1.03439
N11867 G1 X191.084 Y201.024 E2.64028
N11873 G1 X158.509 Y201.491 E1.06057
N11874 G1 X158.509 Y118.509 E2.66839
N11875 G1 X191.491 Y118.509 E1.06057
N11876 G1 X191.491 Y201.431 E2.66646
N11882 G1 X158.102 Y201.898 E1.08675
N11883 G1 X158.102 Y118.102 E2.69457
N11884 G1 X191.898 Y118.102 E1.08675
N11885 G1 X191.898 Y201.838 E2.69264
N11894 G1 X157.71 Y202.29 E1.03002
N11895 G1 X157.71 Y117.71 E2.51935
N11896 G1 X192.29 Y117.71 E1.03002
N11897 G1 X192.29 Y202.23 E2.51756
N11908 G1 X182.783 Y200.736 E.05236
N11909 G1 X190.736 Y171.056 E.98806
N11910 G1 X190.736 Y170.801 E.00819
N11911 G1 X159.264 Y179.234 E1.04769
N11912 G1 X159.264 Y181.32 E.0671
N11913 G1 X178.68 Y200.736 E.88293
N11914 G1 X180.308 Y200.736 E.05236
N11919 G1 X170.898 Y119.264 E.05236
N11920 G1 X159.264 Y162.681 E1.44536
N11921 G1 X159.264 Y162.376 E.0098
N11922 G1 X190.736 Y153.943 E1.0477
N11923 G1 X190.736 Y155.222 E.0411
N11924 G1 X159.264 Y123.751 E1.43118
N11925 G1 X159.264 Y120.232 E.11314
N11926 G1 X162.875 Y119.264 E.12021
N11927 G1 X166.292 Y119.264 E.10988
N11928 G1 X190.736 Y143.708 E1.11158
N11929 G1 X190.736 Y145.515 E.0581
N11930 G1 X159.264 Y153.947 E1.0477
N11931 G1 X159.264 Y158.292 E.13972
N11932 G1 X190.736 Y189.763 E1.43118
N11933 G1 X190.736 Y187.659 E.06769
N11934 G1 X159.264 Y196.091 E1.04769
N11935 G1 X159.264 Y194.137 E.06283
N11936 G1 X179.327 Y119.264 E2.49257
N11937 G1 X177.806 Y119.264 E.04889
N11938 G1 X190.736 Y132.194 E.58797
N11939 G1 X190.736 Y128.657 E.11373
N11940 G1 X159.264 Y137.09 E1.04769
N11941 G1 X159.264 Y135.264 E.05869
N11942 G1 X190.736 Y166.736 E1.43118
N11943 G1 X190.736 Y162.372 E.14031
N11944 G1 X159.264 Y170.805 E1.0477
N11945 G1 X159.264 Y169.806 E.03211
N11946 G1 X190.194 Y200.736 E1.40654
N11947 G1 X190.736 Y200.736 E.01742
N11948 G1 X190.736 Y196.087 E.14947
N11949 G1 X173.388 Y200.736 E.57751
N11950 G1 X171.76 Y200.736 E.05236
N11955 G1 X190.736 Y139.599 E2.03528
N11956 G1 X190.736 Y137.086 E.08082
N11957 G1 X159.264 Y145.518 E1.0477
N11958 G1 X159.264 Y146.778 E.04052
N11959 G1 X190.736 Y178.249 E1.43118
N11960 G1 X190.736 Y179.23 E.03152
N11961 G1 X159.264 Y187.662 E1.0477
N11962 G1 X159.264 Y192.834 E.16631
N11963 G1 X167.166 Y200.736 E.35932
N11964 G1 X165.925 Y200.736 E.03989
N11965 G1 X187.755 Y119.264 E2.71223
N11966 G1 X189.32 Y119.264 E.05032
N11967 G1 X190.736 Y120.68 E.06436
N11968 G1 X190.736 Y120.228 E.01452
N11970 G1 X159.264 Y128.661 E1.0477
N11971 G1 X159.264 Y127.032 E.05236
N11976 G1 X159.264 Y131.224 E.05236
N11977 G1 X162.469 Y119.264 E.39814
N11979 G1 X161.951 Y121.196 E-.76
T0 ;TOOL_CHANGE:0 ; Revert to base toolN12030 G1 Z9.2
N12031 G1 E.8 F1800
N12032 ; FEATURE: Inner wall
N12033 ; LINE_WIDTH: 0.45
N12034 ; LAYER_HEIGHT: 0.2
N12035 G1 F4421.739
N12036 M204 S8000
N12037 G1 X158.916 Y201.084 E1.03439
N12038 G1 X158.916 Y118.916 E2.64221
N12039 G1 X191.084 Y118.916 E1.03439
N12040 G1 X191.084 Y201.024 E2.64028
N12041 ; COOLING_NODE: 0
N12042 M204 S10000
N12043 G1 X191.491 Y201.491 F60000
N12044 G1 F4421.739
N12045 M204 S8000
N12046 G1 X158.509 Y201.491 E1.06057
N12047 G1 X158.509 Y118.509 E2.66839
N12048 G1 X191.491 Y118.509 E1.06057
N12049 G1 X191.491 Y201.431 E2.66646
N12050 ; COOLING_NODE: 0
N12051 M204 S10000
N12052 G1 X191.898 Y201.898 F60000
N12053 G1 F4421.739
N12054 M204 S8000
N12055 G1 X158.102 Y201.898 E1.08675
N12056 G1 X158.102 Y118.102 E2.69457
N12057 G1 X191.898 Y118.102 E1.08675
N12058 G1 X191.898 Y201.838 E2.69264
N12059 ; COOLING_NODE: 0
N12060 M204 S10000
N12061 G1 X192.29 Y202.29 F60000
N12062 ; FEATURE: Outer wall
N12063 ; LINE_WIDTH: 0.42
N12064 G1 F4773.528
N12065 M204 S5000
N12066 G1 X157.71 Y202.29 E1.03002
N12067 G1 X157.71 Y117.71 E2.51935
N12068 G1 X192.29 Y117.71 E1.03002
N12069 G1 X192.29 Y202.23 E2.51756
N12070 G1 E-.8 F1800
N12071 M204 S10000
N12072 G1 X191.911 Y194.607 Z9.6 F60000
N12073 G1 X190.736 Y170.947 Z9.6
N12074 G1 Z9.2
N12075 G1 E.8 F1800
N12076 ; FEATURE: Sparse infill
N12077 ; LINE_WIDTH: 0.45
N12078 G1 F4421.739
N12079 M204 S8000
N12080 G1 X159.264 Y179.38 E1.0477
N12081 G1 X159.264 Y181.12 E.05596
N12082 G1 X178.88 Y200.736 E.89202
N12083 G1 X182.636 Y200.736 E.1208
N12084 G1 X190.736 Y170.509 E1.00625
N12085 G1 X190.736 Y166.536 E.12778
N12086 G1 X159.264 Y135.064 E1.43118
N12087 G1 X159.264 Y137.236 E.06983
N12088 G1 X190.736 Y128.803 E1.0477
N12089 G1 X190.736 Y131.994 E.10259
N12090 G1 X178.006 Y119.264 E.57887
N12091 G1 X179.18 Y119.264 E.03775
N12092 G1 X159.264 Y193.591 E2.47438
N12093 G1 X159.264 Y196.238 E.0851
N12094 G1 X190.736 Y187.805 E1.0477
N12095 G1 X190.736 Y189.563 E.05655
N12096 G1 X159.264 Y158.092 E1.43118
N12097 G1 X159.264 Y154.094 E.12859
N12098 G1 X190.736 Y145.661 E1.0477
N12099 G1 X190.736 Y143.508 E.06924
N12100 G1 X166.492 Y119.264 E1.10248
N12101 M73 P67 R20
N12102 G1 X163.422 Y119.264 E.09874
N12103 G1 X159.264 Y120.378 E.1384
N12104 G1 X159.264 Y123.551 E.102
N12105 G1 X190.736 Y155.022 E1.43118
N12106 G1 X190.736 Y154.09 E.02996
N12107 G1 X159.264 Y162.522 E1.0477
N12108 G1 X159.264 Y162.134 E.01248
N12109 G1 X170.751 Y119.264 E1.42717
N12110 G1 X172.38 Y119.264 E.05236
N12111 M204 S10000
N12112 G1 X162.323 Y119.264 F60000
N12113 G1 F4421.739
N12114 M204 S8000
N12115 G1 X159.264 Y130.678 E.37995
N12116 G1 X159.264 Y132.306 E.05236
N12117 M204 S10000
N12118 G1 X159.264 Y127.179 F60000
N12119 G1 F4421.739
N12120 M204 S8000
N12121 G1 X159.264 Y128.807 E.05236
N12122 G1 X190.736 Y120.375 E1.0477
N12123 G1 X190.736 Y120.48 E.00338
N12124 G1 X189.52 Y119.264 E.05527
N12125 G1 X187.609 Y119.264 E.06146
N12126 G1 X165.779 Y200.736 E2.71223
N12127 G1 X167.366 Y200.736 E.05103
N12128 G1 X159.264 Y192.634 E.36842
N12129 M204 S10000
N12130 G1 X159.264 Y186.18 F60000
N12131 G1 F4421.739
N12132 M204 S8000
N12133 G1 X159.264 Y187.809 E.05236
N12134 G1 X190.736 Y179.376 E1.0477
N12135 G1 X190.736 Y178.049 E.04266
N12136 G1 X159.264 Y146.578 E1.43118
N12137 G1 X159.264 Y145.665 E.02938
N12138 G1 X190.736 Y137.232 E1.0477
N12139 G1 X190.736 Y139.053 E.05854
N12140 G1 X174.208 Y200.736 E2.05347
N12141 G1 X173.935 Y200.736 E.00878
N12142 G1 X190.736 Y196.234 E.55932
N12143 G1 X190.736 Y200.736 E.14476
N12144 G1 X190.394 Y200.736 E.01099
N12145 G1 X159.264 Y169.606 E1.41563
N12146 G1 X159.264 Y170.951 E.04325
N12147 G1 X190.736 Y162.519 E1.0477
N12148 G1 X190.736 Y160.89 E.05236
N12149 ; WIPE_START
N12150 G1 X190.736 Y162.519 E-.61876
N12151 G1 X190.377 Y162.615 E-.14124
N12152 ; WIPE_END
N12153 G1 E-.04 F1800
N12154 M204 S10000
N12155 G17
N12156 G3 Z9.6 I1.217 J0 P1  F60000
N12157 ; stop printing object, unique label id: 372
N12158 M625
N12159 ; object ids of layer 46 start: 372
N12160 M624 AQAAAAAAAAA=
N12161 ;======== H2D 20250527========
N12162 ; SKIPPABLE_START
N12163 ; SKIPTYPE: timelapse
N12164 M622.1 S1 ; for prev firware, default turned on
N12165 
N12166 M1002 judge_flag timelapse_record_flag
N12167 
N12168 M622 J1
N12169 M993 A2 B2 C2
N12170 M993 A0 B0 C0
N12171 
N12172 
N12173 
N12174 
N12175     M9711 M0 E1 X261 Y132 Z9.6 S11 C10 O0 T3000
N12176 
N12177 
N12178 
N12179 M993 A3 B3 C3
N12180 
N12181 M623
N12182 ; SKIPPABLE_END
N12183 
N12184 ; object ids of this layer46 end: 372
N12185 M625
N12186 ; CHANGE_LAYER
N12187 ; Z_HEIGHT: 9.4
N12188 ; LAYER_HEIGHT: 0.2
N12189 ;======== H2D 20250521========
N12190 ; layer num/total_layer_count: 47/75
N12191 ; update layer progress
N12192 M73 L47
N12193 M991 S0 P46 ;notify layer change
N12194 
N12195 
N12196 ; OBJECT_ID: 372
N12197 ; COOLING_NODE: 0
N12198 ; start printing object, unique label id: 372
N12199 M624 AQAAAAAAAAA=
N12200 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=9.300G1 Z9.300 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N12037 G1 X158.916 Y201.084 E1.03439
N12038 G1 X158.916 Y118.916 E2.64221
N12039 G1 X191.084 Y118.916 E1.03439
N12040 G1 X191.084 Y201.024 E2.64028
N12046 G1 X158.509 Y201.491 E1.06057
N12047 G1 X158.509 Y118.509 E2.66839
N12048 G1 X191.491 Y118.509 E1.06057
N12049 G1 X191.491 Y201.431 E2.66646
N12055 G1 X158.102 Y201.898 E1.08675
N12056 G1 X158.102 Y118.102 E2.69457
N12057 G1 X191.898 Y118.102 E1.08675
N12058 G1 X191.898 Y201.838 E2.69264
N12066 G1 X157.71 Y202.29 E1.03002
N12067 G1 X157.71 Y117.71 E2.51935
N12068 G1 X192.29 Y117.71 E1.03002
N12069 G1 X192.29 Y202.23 E2.51756
N12080 G1 X159.264 Y179.38 E1.0477
N12081 G1 X159.264 Y181.12 E.05596
N12082 G1 X178.88 Y200.736 E.89202
N12083 G1 X182.636 Y200.736 E.1208
N12084 G1 X190.736 Y170.509 E1.00625
N12085 G1 X190.736 Y166.536 E.12778
N12086 G1 X159.264 Y135.064 E1.43118
N12087 G1 X159.264 Y137.236 E.06983
N12088 G1 X190.736 Y128.803 E1.0477
N12089 G1 X190.736 Y131.994 E.10259
N12090 G1 X178.006 Y119.264 E.57887
N12091 G1 X179.18 Y119.264 E.03775
N12092 G1 X159.264 Y193.591 E2.47438
N12093 G1 X159.264 Y196.238 E.0851
N12094 G1 X190.736 Y187.805 E1.0477
N12095 G1 X190.736 Y189.563 E.05655
N12096 G1 X159.264 Y158.092 E1.43118
N12097 G1 X159.264 Y154.094 E.12859
N12098 G1 X190.736 Y145.661 E1.0477
N12099 G1 X190.736 Y143.508 E.06924
N12100 G1 X166.492 Y119.264 E1.10248
N12102 G1 X163.422 Y119.264 E.09874
N12103 G1 X159.264 Y120.378 E.1384
N12104 G1 X159.264 Y123.551 E.102
N12105 G1 X190.736 Y155.022 E1.43118
N12106 G1 X190.736 Y154.09 E.02996
N12107 G1 X159.264 Y162.522 E1.0477
N12108 G1 X159.264 Y162.134 E.01248
N12109 G1 X170.751 Y119.264 E1.42717
N12110 G1 X172.38 Y119.264 E.05236
N12115 G1 X159.264 Y130.678 E.37995
N12116 G1 X159.264 Y132.306 E.05236
N12121 G1 X159.264 Y128.807 E.05236
N12122 G1 X190.736 Y120.375 E1.0477
N12123 G1 X190.736 Y120.48 E.00338
N12124 G1 X189.52 Y119.264 E.05527
N12125 G1 X187.609 Y119.264 E.06146
N12126 G1 X165.779 Y200.736 E2.71223
N12127 G1 X167.366 Y200.736 E.05103
N12128 G1 X159.264 Y192.634 E.36842
N12133 G1 X159.264 Y187.809 E.05236
N12134 G1 X190.736 Y179.376 E1.0477
N12135 G1 X190.736 Y178.049 E.04266
N12136 G1 X159.264 Y146.578 E1.43118
N12137 G1 X159.264 Y145.665 E.02938
N12138 G1 X190.736 Y137.232 E1.0477
N12139 G1 X190.736 Y139.053 E.05854
N12140 G1 X174.208 Y200.736 E2.05347
N12141 G1 X173.935 Y200.736 E.00878
N12142 G1 X190.736 Y196.234 E.55932
N12143 G1 X190.736 Y200.736 E.14476
N12144 G1 X190.394 Y200.736 E.01099
N12145 G1 X159.264 Y169.606 E1.41563
N12146 G1 X159.264 Y170.951 E.04325
N12147 G1 X190.736 Y162.519 E1.0477
N12148 G1 X190.736 Y160.89 E.05236
N12150 G1 X190.736 Y162.519 E-.61876
N12151 G1 X190.377 Y162.615 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN12201 G1 Z9.4
N12202 G1 E.8 F1800
N12203 ; FEATURE: Inner wall
N12204 ; LINE_WIDTH: 0.45
N12205 ; LAYER_HEIGHT: 0.2
N12206 G1 F4421.739
N12207 M204 S8000
N12208 G1 X158.916 Y201.084 E1.03439
N12209 G1 X158.916 Y118.916 E2.64221
N12210 G1 X191.084 Y118.916 E1.03439
N12211 G1 X191.084 Y201.024 E2.64028
N12212 ; COOLING_NODE: 0
N12213 M204 S10000
N12214 G1 X191.491 Y201.491 F60000
N12215 G1 F4421.739
N12216 M204 S8000
N12217 G1 X158.509 Y201.491 E1.06057
N12218 G1 X158.509 Y118.509 E2.66839
N12219 G1 X191.491 Y118.509 E1.06057
N12220 G1 X191.491 Y201.431 E2.66646
N12221 ; COOLING_NODE: 0
N12222 M204 S10000
N12223 G1 X191.898 Y201.898 F60000
N12224 G1 F4421.739
N12225 M204 S8000
N12226 G1 X158.102 Y201.898 E1.08675
N12227 G1 X158.102 Y118.102 E2.69457
N12228 G1 X191.898 Y118.102 E1.08675
N12229 G1 X191.898 Y201.838 E2.69264
N12230 ; COOLING_NODE: 0
N12231 M204 S10000
N12232 G1 X192.29 Y202.29 F60000
N12233 ; FEATURE: Outer wall
N12234 ; LINE_WIDTH: 0.42
N12235 G1 F4773.528
N12236 M204 S5000
N12237 G1 X157.71 Y202.29 E1.03002
N12238 G1 X157.71 Y117.71 E2.51935
N12239 G1 X192.29 Y117.71 E1.03002
N12240 G1 X192.29 Y202.23 E2.51756
N12241 G1 E-.8 F1800
N12242 M204 S10000
N12243 G1 X191.909 Y194.607 Z9.8 F60000
N12244 G1 X190.736 Y171.094 Z9.8
N12245 G1 Z9.4
N12246 G1 E.8 F1800
N12247 ; FEATURE: Sparse infill
N12248 ; LINE_WIDTH: 0.45
N12249 G1 F4421.739
N12250 M204 S8000
N12251 G1 X159.264 Y179.526 E1.0477
N12252 G1 X159.264 Y180.92 E.04482
N12253 G1 X179.08 Y200.736 E.90112
N12254 G1 X182.49 Y200.736 E.10966
N12255 G1 X190.736 Y169.963 E1.02444
N12256 G1 X190.736 Y166.336 E.11664
N12257 G1 X159.264 Y134.864 E1.43118
N12258 G1 X159.264 Y137.382 E.08097
N12259 G1 X190.736 Y128.95 E1.0477
N12260 G1 X190.736 Y131.794 E.09145
N12261 G1 X178.206 Y119.264 E.56978
N12262 G1 X179.034 Y119.264 E.02661
N12263 G1 X159.264 Y193.045 E2.45619
N12264 G1 X159.264 Y196.384 E.10738
N12265 G1 X190.736 Y187.951 E1.0477
N12266 G1 X190.736 Y189.363 E.04541
N12267 G1 X159.264 Y157.892 E1.43118
N12268 G1 X159.264 Y154.24 E.11745
N12269 G1 X190.736 Y145.807 E1.0477
N12270 G1 X190.736 Y143.308 E.08038
N12271 G1 X166.692 Y119.264 E1.09339
N12272 G1 X163.968 Y119.264 E.0876
N12273 G1 X159.264 Y120.525 E.15659
N12274 G1 X159.264 Y123.351 E.09086
N12275 G1 X190.736 Y154.822 E1.43118
N12276 G1 X190.736 Y154.236 E.01883
N12277 G1 X159.264 Y162.669 E1.0477
N12278 G1 X159.264 Y161.588 E.03476
N12279 G1 X170.605 Y119.264 E1.40898
N12280 G1 X172.233 Y119.264 E.05236
N12281 M204 S10000
N12282 G1 X160.548 Y119.264 F60000
N12283 G1 F4421.739
N12284 M204 S8000
N12285 G1 X162.176 Y119.264 E.05236
N12286 G1 X159.264 Y130.131 E.36176
N12287 G1 X159.264 Y131.76 E.05236
N12288 M204 S10000
N12289 G1 X159.264 Y128.954 F60000
N12290 G1 F4421.739
N12291 M204 S8000
N12292 G1 X190.736 Y120.521 E1.0477
N12293 G1 X190.736 Y120.28 E.00776
N12294 G1 X189.72 Y119.264 E.04617
N12295 G1 X187.463 Y119.264 E.0726
N12296 G1 X165.632 Y200.736 E2.71223
N12297 G1 X167.566 Y200.736 E.06217
N12298 G1 X159.264 Y192.434 E.37751
N12299 M204 S10000
N12300 G1 X159.264 Y186.327 F60000
N12301 G1 F4421.739
N12302 M204 S8000
N12303 G1 X159.264 Y187.955 E.05236
N12304 G1 X190.736 Y179.523 E1.0477
N12305 G1 X190.736 Y177.849 E.0538
N12306 G1 X159.264 Y146.378 E1.43118
N12307 G1 X159.264 Y145.811 E.01824
N12308 G1 X190.736 Y137.379 E1.0477
N12309 G1 X190.736 Y138.506 E.03626
N12310 G1 X174.061 Y200.736 E2.07166
N12311 G1 X174.481 Y200.736 E.01349
N12312 G1 X190.736 Y196.38 E.54113
N12313 G1 X190.736 Y200.736 E.14005
N12314 G1 X190.594 Y200.736 E.00456
N12315 G1 X159.264 Y169.406 E1.42473
N12316 G1 X159.264 Y171.098 E.05439
N12317 G1 X190.736 Y162.665 E1.0477
N12318 G1 X190.736 Y161.037 E.05236
N12319 ; WIPE_START
N12320 G1 X190.736 Y162.665 E-.61876
N12321 G1 X190.377 Y162.761 E-.14124
N12322 ; WIPE_END
N12323 G1 E-.04 F1800
N12324 M204 S10000
N12325 G17
N12326 G3 Z9.8 I1.217 J0 P1  F60000
N12327 ; stop printing object, unique label id: 372
N12328 M625
N12329 ; object ids of layer 47 start: 372
N12330 M624 AQAAAAAAAAA=
N12331 ;======== H2D 20250527========
N12332 ; SKIPPABLE_START
N12333 ; SKIPTYPE: timelapse
N12334 M622.1 S1 ; for prev firware, default turned on
N12335 
N12336 M1002 judge_flag timelapse_record_flag
N12337 
N12338 M622 J1
N12339 M993 A2 B2 C2
N12340 M993 A0 B0 C0
N12341 
N12342 
N12343 
N12344 
N12345     M9711 M0 E1 X261 Y132 Z9.8 S11 C10 O0 T3000
N12346 
N12347 
N12348 
N12349 M993 A3 B3 C3
N12350 
N12351 M623
N12352 ; SKIPPABLE_END
N12353 
N12354 ; object ids of this layer47 end: 372
N12355 M625
N12356 ; CHANGE_LAYER
N12357 ; Z_HEIGHT: 9.6
N12358 ; LAYER_HEIGHT: 0.200001
N12359 ;======== H2D 20250521========
N12360 ; layer num/total_layer_count: 48/75
N12361 ; update layer progress
N12362 M73 L48
N12363 M991 S0 P47 ;notify layer change
N12364 
N12365 
N12366 ; OBJECT_ID: 372
N12367 ; COOLING_NODE: 0
N12368 ; start printing object, unique label id: 372
N12369 M624 AQAAAAAAAAA=
N12370 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=9.500G1 Z9.500 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N12208 G1 X158.916 Y201.084 E1.03439
N12209 G1 X158.916 Y118.916 E2.64221
N12210 G1 X191.084 Y118.916 E1.03439
N12211 G1 X191.084 Y201.024 E2.64028
N12217 G1 X158.509 Y201.491 E1.06057
N12218 G1 X158.509 Y118.509 E2.66839
N12219 G1 X191.491 Y118.509 E1.06057
N12220 G1 X191.491 Y201.431 E2.66646
N12226 G1 X158.102 Y201.898 E1.08675
N12227 G1 X158.102 Y118.102 E2.69457
N12228 G1 X191.898 Y118.102 E1.08675
N12229 G1 X191.898 Y201.838 E2.69264
N12237 G1 X157.71 Y202.29 E1.03002
N12238 G1 X157.71 Y117.71 E2.51935
N12239 G1 X192.29 Y117.71 E1.03002
N12240 G1 X192.29 Y202.23 E2.51756
N12251 G1 X159.264 Y179.526 E1.0477
N12252 G1 X159.264 Y180.92 E.04482
N12253 G1 X179.08 Y200.736 E.90112
N12254 G1 X182.49 Y200.736 E.10966
N12255 G1 X190.736 Y169.963 E1.02444
N12256 G1 X190.736 Y166.336 E.11664
N12257 G1 X159.264 Y134.864 E1.43118
N12258 G1 X159.264 Y137.382 E.08097
N12259 G1 X190.736 Y128.95 E1.0477
N12260 G1 X190.736 Y131.794 E.09145
N12261 G1 X178.206 Y119.264 E.56978
N12262 G1 X179.034 Y119.264 E.02661
N12263 G1 X159.264 Y193.045 E2.45619
N12264 G1 X159.264 Y196.384 E.10738
N12265 G1 X190.736 Y187.951 E1.0477
N12266 G1 X190.736 Y189.363 E.04541
N12267 G1 X159.264 Y157.892 E1.43118
N12268 G1 X159.264 Y154.24 E.11745
N12269 G1 X190.736 Y145.807 E1.0477
N12270 G1 X190.736 Y143.308 E.08038
N12271 G1 X166.692 Y119.264 E1.09339
N12272 G1 X163.968 Y119.264 E.0876
N12273 G1 X159.264 Y120.525 E.15659
N12274 G1 X159.264 Y123.351 E.09086
N12275 G1 X190.736 Y154.822 E1.43118
N12276 G1 X190.736 Y154.236 E.01883
N12277 G1 X159.264 Y162.669 E1.0477
N12278 G1 X159.264 Y161.588 E.03476
N12279 G1 X170.605 Y119.264 E1.40898
N12280 G1 X172.233 Y119.264 E.05236
N12285 G1 X162.176 Y119.264 E.05236
N12286 G1 X159.264 Y130.131 E.36176
N12287 G1 X159.264 Y131.76 E.05236
N12292 G1 X190.736 Y120.521 E1.0477
N12293 G1 X190.736 Y120.28 E.00776
N12294 G1 X189.72 Y119.264 E.04617
N12295 G1 X187.463 Y119.264 E.0726
N12296 G1 X165.632 Y200.736 E2.71223
N12297 G1 X167.566 Y200.736 E.06217
N12298 G1 X159.264 Y192.434 E.37751
N12303 G1 X159.264 Y187.955 E.05236
N12304 G1 X190.736 Y179.523 E1.0477
N12305 G1 X190.736 Y177.849 E.0538
N12306 G1 X159.264 Y146.378 E1.43118
N12307 G1 X159.264 Y145.811 E.01824
N12308 G1 X190.736 Y137.379 E1.0477
N12309 G1 X190.736 Y138.506 E.03626
N12310 G1 X174.061 Y200.736 E2.07166
N12311 G1 X174.481 Y200.736 E.01349
N12312 G1 X190.736 Y196.38 E.54113
N12313 G1 X190.736 Y200.736 E.14005
N12314 G1 X190.594 Y200.736 E.00456
N12315 G1 X159.264 Y169.406 E1.42473
N12316 G1 X159.264 Y171.098 E.05439
N12317 G1 X190.736 Y162.665 E1.0477
N12318 G1 X190.736 Y161.037 E.05236
N12320 G1 X190.736 Y162.665 E-.61876
N12321 G1 X190.377 Y162.761 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN12371 G1 Z9.6
N12372 G1 E.8 F1800
N12373 ; FEATURE: Inner wall
N12374 ; LINE_WIDTH: 0.45
N12375 ; LAYER_HEIGHT: 0.2
N12376 G1 F4421.739
N12377 M204 S8000
N12378 G1 X158.916 Y201.084 E1.03439
N12379 G1 X158.916 Y118.916 E2.64221
N12380 G1 X191.084 Y118.916 E1.03439
N12381 G1 X191.084 Y201.024 E2.64028
N12382 ; COOLING_NODE: 0
N12383 M204 S10000
N12384 G1 X191.491 Y201.491 F60000
N12385 M73 P68 R20
N12386 G1 F4421.739
N12387 M204 S8000
N12388 G1 X158.509 Y201.491 E1.06057
N12389 G1 X158.509 Y118.509 E2.66839
N12390 G1 X191.491 Y118.509 E1.06057
N12391 G1 X191.491 Y201.431 E2.66646
N12392 ; COOLING_NODE: 0
N12393 M204 S10000
N12394 G1 X191.898 Y201.898 F60000
N12395 M73 P68 R19
N12396 G1 F4421.739
N12397 M204 S8000
N12398 G1 X158.102 Y201.898 E1.08675
N12399 G1 X158.102 Y118.102 E2.69457
N12400 G1 X191.898 Y118.102 E1.08675
N12401 G1 X191.898 Y201.838 E2.69264
N12402 ; COOLING_NODE: 0
N12403 M204 S10000
N12404 G1 X192.29 Y202.29 F60000
N12405 ; FEATURE: Outer wall
N12406 ; LINE_WIDTH: 0.42
N12407 G1 F4773.528
N12408 M204 S5000
N12409 G1 X157.71 Y202.29 E1.03002
N12410 G1 X157.71 Y117.71 E2.51935
N12411 G1 X192.29 Y117.71 E1.03002
N12412 G1 X192.29 Y202.23 E2.51756
N12413 G1 E-.8 F1800
N12414 M204 S10000
N12415 G1 X191.886 Y194.608 Z10 F60000
N12416 G1 X190.736 Y172.868 Z10
N12417 G1 Z9.6
N12418 G1 E.8 F1800
N12419 ; FEATURE: Sparse infill
N12420 ; LINE_WIDTH: 0.45
N12421 G1 F4421.739
N12422 M204 S8000
N12423 G1 X190.736 Y171.24 E.05236
N12424 G1 X159.264 Y179.673 E1.0477
N12425 G1 X159.264 Y180.72 E.03368
N12426 G1 X179.28 Y200.736 E.91021
N12427 G1 X182.344 Y200.736 E.09852
N12428 G1 X190.736 Y169.417 E1.04263
N12429 G1 X190.736 Y166.136 E.10551
N12430 G1 X159.264 Y134.664 E1.43118
N12431 G1 X159.264 Y137.529 E.09211
N12432 G1 X190.736 Y129.096 E1.0477
N12433 G1 X190.736 Y131.594 E.08031
N12434 G1 X178.406 Y119.264 E.56068
N12435 G1 X178.887 Y119.264 E.01547
N12436 G1 X159.264 Y192.498 E2.438
N12437 G1 X159.264 Y192.234 E.00849
N12438 G1 X167.766 Y200.736 E.38661
N12439 G1 X165.486 Y200.736 E.07331
N12440 G1 X187.316 Y119.264 E2.71223
N12441 G1 X189.92 Y119.264 E.08374
N12442 G1 X190.736 Y120.08 E.03708
N12443 G1 X190.736 Y120.667 E.0189
N12444 G1 X159.264 Y129.1 E1.0477
N12445 M204 S10000
N12446 G1 X159.264 Y131.213 F60000
N12447 G1 F4421.739
N12448 M204 S8000
N12449 G1 X159.264 Y129.585 E.05236
N12450 G1 X162.03 Y119.264 E.34357
N12451 G1 X160.401 Y119.264 E.05236
N12452 M204 S10000
N12453 G1 X172.087 Y119.264 F60000
N12454 G1 F4421.739
N12455 M204 S8000
N12456 G1 X170.459 Y119.264 E.05236
N12457 G1 X159.264 Y161.041 E1.39079
N12458 G1 X159.264 Y162.815 E.05704
N12459 G1 X190.736 Y154.383 E1.0477
N12460 G1 X190.736 Y154.622 E.00769
N12461 G1 X159.264 Y123.151 E1.43118
N12462 G1 X159.264 Y120.671 E.07972
N12463 G1 X164.515 Y119.264 E.17478
N12464 G1 X166.892 Y119.264 E.07646
N12465 G1 X190.736 Y143.108 E1.08429
N12466 G1 X190.736 Y145.954 E.09152
N12467 G1 X159.264 Y154.386 E1.0477
N12468 G1 X159.264 Y157.692 E.10631
N12469 G1 X190.736 Y189.163 E1.43118
N12470 G1 X190.736 Y188.098 E.03427
N12471 G1 X159.264 Y196.53 E1.0477
N12472 G1 X159.264 Y198.159 E.05236
N12473 M204 S10000
N12474 G1 X159.264 Y186.473 F60000
N12475 G1 F4421.739
N12476 M204 S8000
N12477 G1 X159.264 Y188.102 E.05236
N12478 G1 X190.736 Y179.669 E1.04769
N12479 G1 X190.736 Y177.649 E.06494
N12480 G1 X159.264 Y146.178 E1.43118
N12481 G1 X159.264 Y145.958 E.0071
N12482 G1 X190.736 Y137.525 E1.04769
N12483 G1 X190.736 Y137.96 E.01398
N12484 G1 X173.915 Y200.736 E2.08985
N12485 G1 X175.027 Y200.736 E.03577
N12486 G1 X190.736 Y196.527 E.52294
N12487 G1 X190.736 Y200.677 E.13348
N12488 G1 X159.264 Y169.206 E1.43118
N12489 G1 X159.264 Y171.244 E.06553
N12490 G1 X190.736 Y162.811 E1.0477
N12491 G1 X190.736 Y161.183 E.05236
N12492 ; WIPE_START
N12493 G1 X190.736 Y162.811 E-.61876
N12494 G1 X190.377 Y162.908 E-.14124
N12495 ; WIPE_END
N12496 G1 E-.04 F1800
N12497 M204 S10000
N12498 G17
N12499 G3 Z10 I1.217 J0 P1  F60000
N12500 ; stop printing object, unique label id: 372
N12501 M625
N12502 ; object ids of layer 48 start: 372
N12503 M624 AQAAAAAAAAA=
N12504 ;======== H2D 20250527========
N12505 ; SKIPPABLE_START
N12506 ; SKIPTYPE: timelapse
N12507 M622.1 S1 ; for prev firware, default turned on
N12508 
N12509 M1002 judge_flag timelapse_record_flag
N12510 
N12511 M622 J1
N12512 M993 A2 B2 C2
N12513 M993 A0 B0 C0
N12514 
N12515 
N12516 
N12517 
N12518     M9711 M0 E1 X261 Y132 Z10 S11 C10 O0 T3000
N12519 
N12520 
N12521 
N12522 M993 A3 B3 C3
N12523 
N12524 M623
N12525 ; SKIPPABLE_END
N12526 
N12527 ; object ids of this layer48 end: 372
N12528 M625
N12529 ; CHANGE_LAYER
N12530 ; Z_HEIGHT: 9.8
N12531 ; LAYER_HEIGHT: 0.2
N12532 ;======== H2D 20250521========
N12533 ; layer num/total_layer_count: 49/75
N12534 ; update layer progress
N12535 M73 L49
N12536 M991 S0 P48 ;notify layer change
N12537 
N12538 
N12539 ; OBJECT_ID: 372
N12540 ; COOLING_NODE: 0
N12541 ; start printing object, unique label id: 372
N12542 M624 AQAAAAAAAAA=
N12543 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=9.700G1 Z9.700 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N12378 G1 X158.916 Y201.084 E1.03439
N12379 G1 X158.916 Y118.916 E2.64221
N12380 G1 X191.084 Y118.916 E1.03439
N12381 G1 X191.084 Y201.024 E2.64028
N12388 G1 X158.509 Y201.491 E1.06057
N12389 G1 X158.509 Y118.509 E2.66839
N12390 G1 X191.491 Y118.509 E1.06057
N12391 G1 X191.491 Y201.431 E2.66646
N12398 G1 X158.102 Y201.898 E1.08675
N12399 G1 X158.102 Y118.102 E2.69457
N12400 G1 X191.898 Y118.102 E1.08675
N12401 G1 X191.898 Y201.838 E2.69264
N12409 G1 X157.71 Y202.29 E1.03002
N12410 G1 X157.71 Y117.71 E2.51935
N12411 G1 X192.29 Y117.71 E1.03002
N12412 G1 X192.29 Y202.23 E2.51756
N12423 G1 X190.736 Y171.24 E.05236
N12424 G1 X159.264 Y179.673 E1.0477
N12425 G1 X159.264 Y180.72 E.03368
N12426 G1 X179.28 Y200.736 E.91021
N12427 G1 X182.344 Y200.736 E.09852
N12428 G1 X190.736 Y169.417 E1.04263
N12429 G1 X190.736 Y166.136 E.10551
N12430 G1 X159.264 Y134.664 E1.43118
N12431 G1 X159.264 Y137.529 E.09211
N12432 G1 X190.736 Y129.096 E1.0477
N12433 G1 X190.736 Y131.594 E.08031
N12434 G1 X178.406 Y119.264 E.56068
N12435 G1 X178.887 Y119.264 E.01547
N12436 G1 X159.264 Y192.498 E2.438
N12437 G1 X159.264 Y192.234 E.00849
N12438 G1 X167.766 Y200.736 E.38661
N12439 G1 X165.486 Y200.736 E.07331
N12440 G1 X187.316 Y119.264 E2.71223
N12441 G1 X189.92 Y119.264 E.08374
N12442 G1 X190.736 Y120.08 E.03708
N12443 G1 X190.736 Y120.667 E.0189
N12444 G1 X159.264 Y129.1 E1.0477
N12449 G1 X159.264 Y129.585 E.05236
N12450 G1 X162.03 Y119.264 E.34357
N12451 G1 X160.401 Y119.264 E.05236
N12456 G1 X170.459 Y119.264 E.05236
N12457 G1 X159.264 Y161.041 E1.39079
N12458 G1 X159.264 Y162.815 E.05704
N12459 G1 X190.736 Y154.383 E1.0477
N12460 G1 X190.736 Y154.622 E.00769
N12461 G1 X159.264 Y123.151 E1.43118
N12462 G1 X159.264 Y120.671 E.07972
N12463 G1 X164.515 Y119.264 E.17478
N12464 G1 X166.892 Y119.264 E.07646
N12465 G1 X190.736 Y143.108 E1.08429
N12466 G1 X190.736 Y145.954 E.09152
N12467 G1 X159.264 Y154.386 E1.0477
N12468 G1 X159.264 Y157.692 E.10631
N12469 G1 X190.736 Y189.163 E1.43118
N12470 G1 X190.736 Y188.098 E.03427
N12471 G1 X159.264 Y196.53 E1.0477
N12472 G1 X159.264 Y198.159 E.05236
N12477 G1 X159.264 Y188.102 E.05236
N12478 G1 X190.736 Y179.669 E1.04769
N12479 G1 X190.736 Y177.649 E.06494
N12480 G1 X159.264 Y146.178 E1.43118
N12481 G1 X159.264 Y145.958 E.0071
N12482 G1 X190.736 Y137.525 E1.04769
N12483 G1 X190.736 Y137.96 E.01398
N12484 G1 X173.915 Y200.736 E2.08985
N12485 G1 X175.027 Y200.736 E.03577
N12486 G1 X190.736 Y196.527 E.52294
N12487 G1 X190.736 Y200.677 E.13348
N12488 G1 X159.264 Y169.206 E1.43118
N12489 G1 X159.264 Y171.244 E.06553
N12490 G1 X190.736 Y162.811 E1.0477
N12491 G1 X190.736 Y161.183 E.05236
N12493 G1 X190.736 Y162.811 E-.61876
N12494 G1 X190.377 Y162.908 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN12544 G1 Z9.8
N12545 G1 E.8 F1800
N12546 ; FEATURE: Inner wall
N12547 ; LINE_WIDTH: 0.45
N12548 ; LAYER_HEIGHT: 0.2
N12549 G1 F4421.739
N12550 M204 S8000
N12551 G1 X158.916 Y201.084 E1.03439
N12552 G1 X158.916 Y118.916 E2.64221
N12553 G1 X191.084 Y118.916 E1.03439
N12554 G1 X191.084 Y201.024 E2.64028
N12555 ; COOLING_NODE: 0
N12556 M204 S10000
N12557 G1 X191.491 Y201.491 F60000
N12558 G1 F4421.739
N12559 M204 S8000
N12560 G1 X158.509 Y201.491 E1.06057
N12561 G1 X158.509 Y118.509 E2.66839
N12562 G1 X191.491 Y118.509 E1.06057
N12563 G1 X191.491 Y201.431 E2.66646
N12564 ; COOLING_NODE: 0
N12565 M204 S10000
N12566 G1 X191.898 Y201.898 F60000
N12567 G1 F4421.739
N12568 M204 S8000
N12569 G1 X158.102 Y201.898 E1.08675
N12570 G1 X158.102 Y118.102 E2.69457
N12571 G1 X191.898 Y118.102 E1.08675
N12572 G1 X191.898 Y201.838 E2.69264
N12573 ; COOLING_NODE: 0
N12574 M204 S10000
N12575 G1 X192.29 Y202.29 F60000
N12576 ; FEATURE: Outer wall
N12577 ; LINE_WIDTH: 0.42
N12578 G1 F4773.528
N12579 M204 S5000
N12580 G1 X157.71 Y202.29 E1.03002
N12581 G1 X157.71 Y117.71 E2.51935
N12582 G1 X192.29 Y117.71 E1.03002
N12583 G1 X192.29 Y202.23 E2.51756
N12584 G1 E-.8 F1800
N12585 M204 S10000
N12586 G1 X191.884 Y194.608 Z10.2 F60000
N12587 M73 P69 R19
N12588 G1 X190.736 Y173.015 Z10.2
N12589 G1 Z9.8
N12590 G1 E.8 F1800
N12591 ; FEATURE: Sparse infill
N12592 ; LINE_WIDTH: 0.45
N12593 G1 F4421.739
N12594 M204 S8000
N12595 G1 X190.736 Y171.387 E.05236
N12596 G1 X159.264 Y179.819 E1.0477
N12597 G1 X159.264 Y180.52 E.02254
N12598 G1 X179.48 Y200.736 E.91931
N12599 G1 X182.197 Y200.736 E.08738
N12600 G1 X190.736 Y168.87 E1.06082
N12601 G1 X190.736 Y165.936 E.09437
N12602 G1 X159.264 Y134.464 E1.43118
N12603 G1 X159.264 Y137.675 E.10325
N12604 G1 X190.736 Y129.243 E1.0477
N12605 G1 X190.736 Y131.394 E.06917
N12606 G1 X178.606 Y119.264 E.55159
N12607 G1 X178.741 Y119.264 E.00433
N12608 G1 X159.264 Y191.952 E2.41981
N12609 G1 X159.264 Y192.034 E.00265
N12610 G1 X167.966 Y200.736 E.3957
N12611 G1 X165.34 Y200.736 E.08445
N12612 G1 X187.17 Y119.264 E2.71223
N12613 G1 X190.12 Y119.264 E.09488
N12614 G1 X190.736 Y119.88 E.02798
N12615 G1 X190.736 Y120.814 E.03004
N12616 G1 X159.264 Y129.246 E1.04769
N12617 G1 X159.264 Y129.038 E.00669
N12618 G1 X161.883 Y119.264 E.32538
N12619 G1 X160.255 Y119.264 E.05236
N12620 M204 S10000
N12621 G1 X171.94 Y119.264 F60000
N12622 G1 F4421.739
N12623 M204 S8000
N12624 G1 X170.312 Y119.264 E.05236
N12625 G1 X159.264 Y160.495 E1.3726
N12626 G1 X159.264 Y162.962 E.07931
N12627 G1 X190.736 Y154.529 E1.0477
N12628 G1 X190.736 Y154.422 E.00345
N12629 G1 X159.264 Y122.951 E1.43118
N12630 G1 X159.264 Y120.818 E.06859
N12631 G1 X165.061 Y119.264 E.19297
N12632 G1 X167.092 Y119.264 E.06532
N12633 G1 X190.736 Y142.908 E1.0752
N12634 G1 X190.736 Y146.1 E.10266
N12635 G1 X159.264 Y154.533 E1.0477
N12636 G1 X159.264 Y157.492 E.09517
N12637 G1 X190.736 Y188.963 E1.43118
N12638 G1 X190.736 Y188.244 E.02313
N12639 G1 X159.264 Y196.677 E1.0477
N12640 G1 X159.264 Y198.305 E.05236
N12641 M204 S10000
N12642 G1 X159.264 Y186.62 F60000
N12643 G1 F4421.739
N12644 M204 S8000
N12645 G1 X159.264 Y188.248 E.05236
N12646 G1 X190.736 Y179.815 E1.0477
N12647 G1 X190.736 Y177.449 E.07608
N12648 G1 X159.264 Y145.978 E1.43118
N12649 G1 X159.264 Y146.104 E.00404
N12650 G1 X190.736 Y137.671 E1.0477
N12651 G1 X190.736 Y137.413 E.00829
N12652 G1 X173.768 Y200.736 E2.10804
N12653 G1 X175.574 Y200.736 E.05805
N12654 G1 X190.736 Y196.673 E.50475
N12655 G1 X190.736 Y200.477 E.12234
N12656 G1 X159.264 Y169.006 E1.43118
N12657 G1 X159.264 Y171.39 E.07666
N12658 G1 X190.736 Y162.958 E1.0477
N12659 G1 X190.736 Y161.329 E.05236
N12660 ; WIPE_START
N12661 G1 X190.736 Y162.958 E-.61876
N12662 G1 X190.377 Y163.054 E-.14124
N12663 ; WIPE_END
N12664 G1 E-.04 F1800
N12665 M204 S10000
N12666 G17
N12667 G3 Z10.2 I1.217 J0 P1  F60000
N12668 ; stop printing object, unique label id: 372
N12669 M625
N12670 ; object ids of layer 49 start: 372
N12671 M624 AQAAAAAAAAA=
N12672 ;======== H2D 20250527========
N12673 ; SKIPPABLE_START
N12674 ; SKIPTYPE: timelapse
N12675 M622.1 S1 ; for prev firware, default turned on
N12676 
N12677 M1002 judge_flag timelapse_record_flag
N12678 
N12679 M622 J1
N12680 M993 A2 B2 C2
N12681 M993 A0 B0 C0
N12682 
N12683 
N12684 
N12685 
N12686     M9711 M0 E1 X261 Y132 Z10.2 S11 C10 O0 T3000
N12687 
N12688 
N12689 
N12690 M993 A3 B3 C3
N12691 
N12692 M623
N12693 ; SKIPPABLE_END
N12694 
N12695 ; object ids of this layer49 end: 372
N12696 M625
N12697 ; CHANGE_LAYER
N12698 ; Z_HEIGHT: 10
N12699 ; LAYER_HEIGHT: 0.2
N12700 ;======== H2D 20250521========
N12701 ; layer num/total_layer_count: 50/75
N12702 ; update layer progress
N12703 M73 L50
N12704 M991 S0 P49 ;notify layer change
N12705 
N12706 
N12707 ; OBJECT_ID: 372
N12708 ; COOLING_NODE: 0
N12709 ; start printing object, unique label id: 372
N12710 M624 AQAAAAAAAAA=
N12711 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=9.900G1 Z9.900 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N12551 G1 X158.916 Y201.084 E1.03439
N12552 G1 X158.916 Y118.916 E2.64221
N12553 G1 X191.084 Y118.916 E1.03439
N12554 G1 X191.084 Y201.024 E2.64028
N12560 G1 X158.509 Y201.491 E1.06057
N12561 G1 X158.509 Y118.509 E2.66839
N12562 G1 X191.491 Y118.509 E1.06057
N12563 G1 X191.491 Y201.431 E2.66646
N12569 G1 X158.102 Y201.898 E1.08675
N12570 G1 X158.102 Y118.102 E2.69457
N12571 G1 X191.898 Y118.102 E1.08675
N12572 G1 X191.898 Y201.838 E2.69264
N12580 G1 X157.71 Y202.29 E1.03002
N12581 G1 X157.71 Y117.71 E2.51935
N12582 G1 X192.29 Y117.71 E1.03002
N12583 G1 X192.29 Y202.23 E2.51756
N12595 G1 X190.736 Y171.387 E.05236
N12596 G1 X159.264 Y179.819 E1.0477
N12597 G1 X159.264 Y180.52 E.02254
N12598 G1 X179.48 Y200.736 E.91931
N12599 G1 X182.197 Y200.736 E.08738
N12600 G1 X190.736 Y168.87 E1.06082
N12601 G1 X190.736 Y165.936 E.09437
N12602 G1 X159.264 Y134.464 E1.43118
N12603 G1 X159.264 Y137.675 E.10325
N12604 G1 X190.736 Y129.243 E1.0477
N12605 G1 X190.736 Y131.394 E.06917
N12606 G1 X178.606 Y119.264 E.55159
N12607 G1 X178.741 Y119.264 E.00433
N12608 G1 X159.264 Y191.952 E2.41981
N12609 G1 X159.264 Y192.034 E.00265
N12610 G1 X167.966 Y200.736 E.3957
N12611 G1 X165.34 Y200.736 E.08445
N12612 G1 X187.17 Y119.264 E2.71223
N12613 G1 X190.12 Y119.264 E.09488
N12614 G1 X190.736 Y119.88 E.02798
N12615 G1 X190.736 Y120.814 E.03004
N12616 G1 X159.264 Y129.246 E1.04769
N12617 G1 X159.264 Y129.038 E.00669
N12618 G1 X161.883 Y119.264 E.32538
N12619 G1 X160.255 Y119.264 E.05236
N12624 G1 X170.312 Y119.264 E.05236
N12625 G1 X159.264 Y160.495 E1.3726
N12626 G1 X159.264 Y162.962 E.07931
N12627 G1 X190.736 Y154.529 E1.0477
N12628 G1 X190.736 Y154.422 E.00345
N12629 G1 X159.264 Y122.951 E1.43118
N12630 G1 X159.264 Y120.818 E.06859
N12631 G1 X165.061 Y119.264 E.19297
N12632 G1 X167.092 Y119.264 E.06532
N12633 G1 X190.736 Y142.908 E1.0752
N12634 G1 X190.736 Y146.1 E.10266
N12635 G1 X159.264 Y154.533 E1.0477
N12636 G1 X159.264 Y157.492 E.09517
N12637 G1 X190.736 Y188.963 E1.43118
N12638 G1 X190.736 Y188.244 E.02313
N12639 G1 X159.264 Y196.677 E1.0477
N12640 G1 X159.264 Y198.305 E.05236
N12645 G1 X159.264 Y188.248 E.05236
N12646 G1 X190.736 Y179.815 E1.0477
N12647 G1 X190.736 Y177.449 E.07608
N12648 G1 X159.264 Y145.978 E1.43118
N12649 G1 X159.264 Y146.104 E.00404
N12650 G1 X190.736 Y137.671 E1.0477
N12651 G1 X190.736 Y137.413 E.00829
N12652 G1 X173.768 Y200.736 E2.10804
N12653 G1 X175.574 Y200.736 E.05805
N12654 G1 X190.736 Y196.673 E.50475
N12655 G1 X190.736 Y200.477 E.12234
N12656 G1 X159.264 Y169.006 E1.43118
N12657 G1 X159.264 Y171.39 E.07666
N12658 G1 X190.736 Y162.958 E1.0477
N12659 G1 X190.736 Y161.329 E.05236
N12661 G1 X190.736 Y162.958 E-.61876
N12662 G1 X190.377 Y163.054 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN12712 G1 Z10
N12713 G1 E.8 F1800
N12714 ; FEATURE: Inner wall
N12715 ; LINE_WIDTH: 0.45
N12716 ; LAYER_HEIGHT: 0.2
N12717 G1 F4421.739
N12718 M204 S8000
N12719 G1 X158.916 Y201.084 E1.03439
N12720 G1 X158.916 Y118.916 E2.64221
N12721 G1 X191.084 Y118.916 E1.03439
N12722 G1 X191.084 Y201.024 E2.64028
N12723 ; COOLING_NODE: 0
N12724 M204 S10000
N12725 G1 X191.491 Y201.491 F60000
N12726 G1 F4421.739
N12727 M204 S8000
N12728 G1 X158.509 Y201.491 E1.06057
N12729 G1 X158.509 Y118.509 E2.66839
N12730 G1 X191.491 Y118.509 E1.06057
N12731 G1 X191.491 Y201.431 E2.66646
N12732 ; COOLING_NODE: 0
N12733 M204 S10000
N12734 G1 X191.898 Y201.898 F60000
N12735 G1 F4421.739
N12736 M204 S8000
N12737 G1 X158.102 Y201.898 E1.08675
N12738 G1 X158.102 Y118.102 E2.69457
N12739 G1 X191.898 Y118.102 E1.08675
N12740 G1 X191.898 Y201.838 E2.69264
N12741 ; COOLING_NODE: 0
N12742 M204 S10000
N12743 G1 X192.29 Y202.29 F60000
N12744 ; FEATURE: Outer wall
N12745 ; LINE_WIDTH: 0.42
N12746 G1 F4773.528
N12747 M204 S5000
N12748 G1 X157.71 Y202.29 E1.03002
N12749 G1 X157.71 Y117.71 E2.51935
N12750 G1 X192.29 Y117.71 E1.03002
N12751 G1 X192.29 Y202.23 E2.51756
N12752 M73 P69 R18
N12753 G1 E-.8 F1800
N12754 M204 S10000
N12755 G1 X188.851 Y200.736 Z10.4 F60000
N12756 G1 Z10
N12757 G1 E.8 F1800
N12758 ; FEATURE: Sparse infill
N12759 ; LINE_WIDTH: 0.45
N12760 G1 F4421.739
N12761 M204 S8000
N12762 G1 X190.48 Y200.736 E.05236
N12763 G1 X190.736 Y199.78 E.0318
N12764 G1 X190.736 Y200.277 E.01598
N12765 G1 X159.264 Y168.806 E1.43118
N12766 G1 X159.264 Y171.537 E.0878
N12767 G1 X190.736 Y163.104 E1.0477
N12768 G1 X190.736 Y161.476 E.05236
N12769 M204 S10000
N12770 G1 X190.736 Y173.161 F60000
N12771 G1 F4421.739
N12772 M204 S8000
N12773 G1 X190.736 Y171.533 E.05236
N12774 G1 X159.264 Y179.966 E1.0477
N12775 G1 X159.264 Y180.32 E.0114
N12776 G1 X179.68 Y200.736 E.9284
N12777 G1 X182.051 Y200.736 E.07625
N12778 G1 X190.736 Y168.324 E1.07901
N12779 G1 X190.736 Y165.736 E.08323
N12780 G1 X159.264 Y134.264 E1.43118
N12781 G1 X159.264 Y137.822 E.11439
N12782 G1 X190.736 Y129.389 E1.0477
N12783 G1 X190.736 Y131.194 E.05803
N12784 G1 X178.806 Y119.264 E.54249
N12785 G1 X178.595 Y119.264 E.00681
N12786 G1 X159.264 Y191.405 E2.40162
N12787 G1 X159.264 Y191.834 E.01379
N12788 G1 X168.166 Y200.736 E.4048
N12789 G1 X165.193 Y200.736 E.09559
N12790 G1 X187.023 Y119.264 E2.71223
N12791 G1 X190.32 Y119.264 E.10602
N12792 G1 X190.736 Y119.68 E.01889
N12793 G1 X190.736 Y120.96 E.04117
N12794 G1 X159.264 Y129.393 E1.0477
N12795 G1 X159.264 Y128.492 E.02897
N12796 G1 X161.737 Y119.264 E.30719
N12797 G1 X160.109 Y119.264 E.05236
N12798 M204 S10000
N12799 G1 X171.794 Y119.264 F60000
N12800 G1 F4421.739
N12801 M204 S8000
N12802 G1 X170.166 Y119.264 E.05236
N12803 G1 X159.264 Y159.949 E1.35441
N12804 G1 X159.264 Y163.108 E.10159
N12805 G1 X190.736 Y154.675 E1.0477
N12806 G1 X190.736 Y154.222 E.01459
N12807 G1 X159.264 Y122.751 E1.43118
N12808 G1 X159.264 Y120.964 E.05745
N12809 G1 X165.607 Y119.264 E.21116
N12810 G1 X167.292 Y119.264 E.05418
N12811 G1 X190.736 Y142.708 E1.0661
N12812 G1 X190.736 Y146.247 E.1138
N12813 M73 P70 R18
N12814 G1 X159.264 Y154.679 E1.0477
N12815 G1 X159.264 Y157.292 E.08403
N12816 G1 X190.736 Y188.763 E1.43118
N12817 G1 X190.736 Y188.391 E.01199
N12818 G1 X159.264 Y196.823 E1.0477
N12819 G1 X159.264 Y198.452 E.05236
N12820 M204 S10000
N12821 G1 X159.264 Y186.766 F60000
N12822 G1 F4421.739
N12823 M204 S8000
N12824 G1 X159.264 Y188.394 E.05236
N12825 G1 X190.736 Y179.962 E1.0477
N12826 G1 X190.736 Y177.249 E.08722
N12827 G1 X159.264 Y145.778 E1.43118
N12828 G1 X159.264 Y146.25 E.01518
N12829 G1 X190.736 Y137.818 E1.0477
N12830 M204 S10000
N12831 G1 X190.736 Y135.239 F60000
N12832 G1 F4421.739
N12833 M204 S8000
N12834 G1 X190.736 Y136.867 E.05236
N12835 G1 X173.622 Y200.736 E2.12623
N12836 G1 X176.12 Y200.736 E.08033
N12837 G1 X190.736 Y196.819 E.48656
N12838 G1 X190.736 Y195.191 E.05236
N12839 ; WIPE_START
N12840 G1 X190.736 Y196.819 E-.61876
N12841 G1 X190.377 Y196.916 E-.14124
N12842 ; WIPE_END
N12843 G1 E-.04 F1800
N12844 M204 S10000
N12845 G17
N12846 G3 Z10.4 I1.217 J0 P1  F60000
N12847 ; stop printing object, unique label id: 372
N12848 M625
N12849 ; object ids of layer 50 start: 372
N12850 M624 AQAAAAAAAAA=
N12851 ;======== H2D 20250527========
N12852 ; SKIPPABLE_START
N12853 ; SKIPTYPE: timelapse
N12854 M622.1 S1 ; for prev firware, default turned on
N12855 
N12856 M1002 judge_flag timelapse_record_flag
N12857 
N12858 M622 J1
N12859 M993 A2 B2 C2
N12860 M993 A0 B0 C0
N12861 
N12862 
N12863 
N12864 
N12865     M9711 M0 E1 X261 Y132 Z10.4 S11 C10 O0 T3000
N12866 
N12867 
N12868 
N12869 M993 A3 B3 C3
N12870 
N12871 M623
N12872 ; SKIPPABLE_END
N12873 
N12874 ; object ids of this layer50 end: 372
N12875 M625
N12876 ; CHANGE_LAYER
N12877 ; Z_HEIGHT: 10.2
N12878 ; LAYER_HEIGHT: 0.2
N12879 ;======== H2D 20250521========
N12880 ; layer num/total_layer_count: 51/75
N12881 ; update layer progress
N12882 M73 L51
N12883 M991 S0 P50 ;notify layer change
N12884 
N12885 
N12886 ; OBJECT_ID: 372
N12887 ; COOLING_NODE: 0
N12888 ; start printing object, unique label id: 372
N12889 M624 AQAAAAAAAAA=
N12890 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=10.100G1 Z10.100 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N12719 G1 X158.916 Y201.084 E1.03439
N12720 G1 X158.916 Y118.916 E2.64221
N12721 G1 X191.084 Y118.916 E1.03439
N12722 G1 X191.084 Y201.024 E2.64028
N12728 G1 X158.509 Y201.491 E1.06057
N12729 G1 X158.509 Y118.509 E2.66839
N12730 G1 X191.491 Y118.509 E1.06057
N12731 G1 X191.491 Y201.431 E2.66646
N12737 G1 X158.102 Y201.898 E1.08675
N12738 G1 X158.102 Y118.102 E2.69457
N12739 G1 X191.898 Y118.102 E1.08675
N12740 G1 X191.898 Y201.838 E2.69264
N12748 G1 X157.71 Y202.29 E1.03002
N12749 G1 X157.71 Y117.71 E2.51935
N12750 G1 X192.29 Y117.71 E1.03002
N12751 G1 X192.29 Y202.23 E2.51756
N12762 G1 X190.48 Y200.736 E.05236
N12763 G1 X190.736 Y199.78 E.0318
N12764 G1 X190.736 Y200.277 E.01598
N12765 G1 X159.264 Y168.806 E1.43118
N12766 G1 X159.264 Y171.537 E.0878
N12767 G1 X190.736 Y163.104 E1.0477
N12768 G1 X190.736 Y161.476 E.05236
N12773 G1 X190.736 Y171.533 E.05236
N12774 G1 X159.264 Y179.966 E1.0477
N12775 G1 X159.264 Y180.32 E.0114
N12776 G1 X179.68 Y200.736 E.9284
N12777 G1 X182.051 Y200.736 E.07625
N12778 G1 X190.736 Y168.324 E1.07901
N12779 G1 X190.736 Y165.736 E.08323
N12780 G1 X159.264 Y134.264 E1.43118
N12781 G1 X159.264 Y137.822 E.11439
N12782 G1 X190.736 Y129.389 E1.0477
N12783 G1 X190.736 Y131.194 E.05803
N12784 G1 X178.806 Y119.264 E.54249
N12785 G1 X178.595 Y119.264 E.00681
N12786 G1 X159.264 Y191.405 E2.40162
N12787 G1 X159.264 Y191.834 E.01379
N12788 G1 X168.166 Y200.736 E.4048
N12789 G1 X165.193 Y200.736 E.09559
N12790 G1 X187.023 Y119.264 E2.71223
N12791 G1 X190.32 Y119.264 E.10602
N12792 G1 X190.736 Y119.68 E.01889
N12793 G1 X190.736 Y120.96 E.04117
N12794 G1 X159.264 Y129.393 E1.0477
N12795 G1 X159.264 Y128.492 E.02897
N12796 G1 X161.737 Y119.264 E.30719
N12797 G1 X160.109 Y119.264 E.05236
N12802 G1 X170.166 Y119.264 E.05236
N12803 G1 X159.264 Y159.949 E1.35441
N12804 G1 X159.264 Y163.108 E.10159
N12805 G1 X190.736 Y154.675 E1.0477
N12806 G1 X190.736 Y154.222 E.01459
N12807 G1 X159.264 Y122.751 E1.43118
N12808 G1 X159.264 Y120.964 E.05745
N12809 G1 X165.607 Y119.264 E.21116
N12810 G1 X167.292 Y119.264 E.05418
N12811 G1 X190.736 Y142.708 E1.0661
N12812 G1 X190.736 Y146.247 E.1138
N12814 G1 X159.264 Y154.679 E1.0477
N12815 G1 X159.264 Y157.292 E.08403
N12816 G1 X190.736 Y188.763 E1.43118
N12817 G1 X190.736 Y188.391 E.01199
N12818 G1 X159.264 Y196.823 E1.0477
N12819 G1 X159.264 Y198.452 E.05236
N12824 G1 X159.264 Y188.394 E.05236
N12825 G1 X190.736 Y179.962 E1.0477
N12826 G1 X190.736 Y177.249 E.08722
N12827 G1 X159.264 Y145.778 E1.43118
N12828 G1 X159.264 Y146.25 E.01518
N12829 G1 X190.736 Y137.818 E1.0477
N12834 G1 X190.736 Y136.867 E.05236
N12835 G1 X173.622 Y200.736 E2.12623
N12836 G1 X176.12 Y200.736 E.08033
N12837 G1 X190.736 Y196.819 E.48656
N12838 G1 X190.736 Y195.191 E.05236
N12840 G1 X190.736 Y196.819 E-.61876
N12841 G1 X190.377 Y196.916 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN12891 G1 Z10.2
N12892 G1 E.8 F1800
N12893 ; FEATURE: Inner wall
N12894 ; LINE_WIDTH: 0.45
N12895 ; LAYER_HEIGHT: 0.2
N12896 G1 F4421.739
N12897 M204 S8000
N12898 G1 X158.916 Y201.084 E1.03439
N12899 G1 X158.916 Y118.916 E2.64221
N12900 G1 X191.084 Y118.916 E1.03439
N12901 G1 X191.084 Y201.024 E2.64028
N12902 ; COOLING_NODE: 0
N12903 M204 S10000
N12904 G1 X191.491 Y201.491 F60000
N12905 G1 F4421.739
N12906 M204 S8000
N12907 G1 X158.509 Y201.491 E1.06057
N12908 G1 X158.509 Y118.509 E2.66839
N12909 G1 X191.491 Y118.509 E1.06057
N12910 G1 X191.491 Y201.431 E2.66646
N12911 ; COOLING_NODE: 0
N12912 M204 S10000
N12913 G1 X191.898 Y201.898 F60000
N12914 G1 F4421.739
N12915 M204 S8000
N12916 G1 X158.102 Y201.898 E1.08675
N12917 G1 X158.102 Y118.102 E2.69457
N12918 G1 X191.898 Y118.102 E1.08675
N12919 G1 X191.898 Y201.838 E2.69264
N12920 ; COOLING_NODE: 0
N12921 M204 S10000
N12922 G1 X192.29 Y202.29 F60000
N12923 ; FEATURE: Outer wall
N12924 ; LINE_WIDTH: 0.42
N12925 G1 F4773.528
N12926 M204 S5000
N12927 G1 X157.71 Y202.29 E1.03002
N12928 G1 X157.71 Y117.71 E2.51935
N12929 G1 X192.29 Y117.71 E1.03002
N12930 G1 X192.29 Y202.23 E2.51756
N12931 G1 E-.8 F1800
N12932 M204 S10000
N12933 G1 X190.736 Y200.077 Z10.6 F60000
N12934 G1 Z10.2
N12935 G1 E.8 F1800
N12936 ; FEATURE: Sparse infill
N12937 ; LINE_WIDTH: 0.45
N12938 G1 F4421.739
N12939 M204 S8000
N12940 G1 X159.264 Y168.606 E1.43118
N12941 G1 X159.264 Y171.683 E.09894
N12942 G1 X190.736 Y163.251 E1.0477
N12943 G1 X190.736 Y161.622 E.05236
N12944 M204 S10000
N12945 G1 X190.736 Y173.308 F60000
N12946 G1 F4421.739
N12947 M204 S8000
N12948 G1 X190.736 Y171.679 E.05236
N12949 G1 X159.264 Y180.12 E1.04776
N12950 G1 X179.88 Y200.736 E.9375
N12951 G1 X181.904 Y200.736 E.06511
N12952 G1 X190.736 Y167.777 E1.0972
N12953 G1 X190.736 Y165.536 E.07209
N12954 G1 X159.264 Y134.064 E1.43118
N12955 G1 X159.264 Y137.968 E.12552
N12956 G1 X190.736 Y129.535 E1.0477
N12957 G1 X190.736 Y130.994 E.04689
N12958 G1 X179.006 Y119.264 E.5334
N12959 G1 X178.448 Y119.264 E.01795
N12960 G1 X159.264 Y190.859 E2.38343
N12961 G1 X159.264 Y191.634 E.02493
N12962 G1 X168.366 Y200.736 E.41389
N12963 G1 X165.047 Y200.736 E.10673
N12964 G1 X186.877 Y119.264 E2.71223
N12965 G1 X190.52 Y119.264 E.11716
N12966 G1 X190.736 Y119.48 E.00979
N12967 G1 X190.736 Y121.107 E.05231
N12968 G1 X159.264 Y129.539 E1.0477
N12969 G1 X159.264 Y127.946 E.05125
N12970 G1 X161.591 Y119.264 E.289
N12971 G1 X159.962 Y119.264 E.05236
N12972 M204 S10000
N12973 G1 X171.648 Y119.264 F60000
N12974 G1 F4421.739
N12975 M204 S8000
N12976 G1 X170.019 Y119.264 E.05236
N12977 G1 X159.264 Y159.402 E1.33622
N12978 G1 X159.264 Y163.254 E.12387
N12979 G1 X190.736 Y154.822 E1.0477
N12980 G1 X190.736 Y154.022 E.02573
N12981 G1 X159.264 Y122.551 E1.43118
N12982 G1 X159.264 Y121.11 E.04631
N12983 G1 X166.154 Y119.264 E.22935
N12984 G1 X167.492 Y119.264 E.04304
N12985 G1 X190.736 Y142.508 E1.05701
N12986 G1 X190.736 Y146.393 E.12494
N12987 G1 X159.264 Y154.826 E1.04769
N12988 G1 X159.264 Y157.092 E.07289
N12989 G1 X190.736 Y188.563 E1.43118
N12990 G1 X190.736 Y188.537 E.00085
N12991 G1 X159.264 Y196.97 E1.0477
N12992 G1 X159.264 Y198.598 E.05236
N12993 M204 S10000
N12994 G1 X159.264 Y186.912 F60000
N12995 G1 F4421.739
N12996 M204 S8000
N12997 G1 X159.264 Y188.541 E.05236
N12998 G1 X190.736 Y180.108 E1.0477
N12999 G1 X190.736 Y177.049 E.09836
N13000 G1 X159.264 Y145.578 E1.43118
N13001 G1 X159.264 Y146.397 E.02632
N13002 G1 X190.736 Y137.964 E1.0477
N13003 G1 X190.736 Y139.593 E.05236
N13004 M204 S10000
N13005 G1 X190.736 Y134.692 F60000
N13006 G1 F4421.739
N13007 M204 S8000
N13008 G1 X190.736 Y136.321 E.05236
N13009 G1 X173.476 Y200.736 E2.14442
N13010 G1 X176.667 Y200.736 E.10261
N13011 G1 X190.736 Y196.966 E.46837
N13012 G1 X190.736 Y199.234 E.07294
N13013 G1 X190.333 Y200.736 E.04999
N13014 G1 X188.705 Y200.736 E.05236
N13015 ; WIPE_START
N13016 G1 X190.333 Y200.736 E-.61876
N13017 G1 X190.429 Y200.377 E-.14124
N13018 ; WIPE_END
N13019 G1 E-.04 F1800
N13020 M204 S10000
N13021 G17
N13022 G3 Z10.6 I1.217 J0 P1  F60000
N13023 ; stop printing object, unique label id: 372
N13024 M625
N13025 ; object ids of layer 51 start: 372
N13026 M624 AQAAAAAAAAA=
N13027 ;======== H2D 20250527========
N13028 ; SKIPPABLE_START
N13029 ; SKIPTYPE: timelapse
N13030 M622.1 S1 ; for prev firware, default turned on
N13031 
N13032 M1002 judge_flag timelapse_record_flag
N13033 
N13034 M622 J1
N13035 M993 A2 B2 C2
N13036 M993 A0 B0 C0
N13037 
N13038 
N13039 
N13040 
N13041     M9711 M0 E1 X261 Y132 Z10.6 S11 C10 O0 T3000
N13042 
N13043 
N13044 
N13045 M993 A3 B3 C3
N13046 
N13047 M623
N13048 ; SKIPPABLE_END
N13049 
N13050 ; object ids of this layer51 end: 372
N13051 M625
N13052 ; CHANGE_LAYER
N13053 ; Z_HEIGHT: 10.4
N13054 ; LAYER_HEIGHT: 0.2
N13055 ;======== H2D 20250521========
N13056 ; layer num/total_layer_count: 52/75
N13057 ; update layer progress
N13058 M73 L52
N13059 M991 S0 P51 ;notify layer change
N13060 
N13061 
N13062 ; OBJECT_ID: 372
N13063 ; COOLING_NODE: 0
N13064 ; start printing object, unique label id: 372
N13065 M624 AQAAAAAAAAA=
N13066 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=10.300G1 Z10.300 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N12898 G1 X158.916 Y201.084 E1.03439
N12899 G1 X158.916 Y118.916 E2.64221
N12900 G1 X191.084 Y118.916 E1.03439
N12901 G1 X191.084 Y201.024 E2.64028
N12907 G1 X158.509 Y201.491 E1.06057
N12908 G1 X158.509 Y118.509 E2.66839
N12909 G1 X191.491 Y118.509 E1.06057
N12910 G1 X191.491 Y201.431 E2.66646
N12916 G1 X158.102 Y201.898 E1.08675
N12917 G1 X158.102 Y118.102 E2.69457
N12918 G1 X191.898 Y118.102 E1.08675
N12919 G1 X191.898 Y201.838 E2.69264
N12927 G1 X157.71 Y202.29 E1.03002
N12928 G1 X157.71 Y117.71 E2.51935
N12929 G1 X192.29 Y117.71 E1.03002
N12930 G1 X192.29 Y202.23 E2.51756
N12940 G1 X159.264 Y168.606 E1.43118
N12941 G1 X159.264 Y171.683 E.09894
N12942 G1 X190.736 Y163.251 E1.0477
N12943 G1 X190.736 Y161.622 E.05236
N12948 G1 X190.736 Y171.679 E.05236
N12949 G1 X159.264 Y180.12 E1.04776
N12950 G1 X179.88 Y200.736 E.9375
N12951 G1 X181.904 Y200.736 E.06511
N12952 G1 X190.736 Y167.777 E1.0972
N12953 G1 X190.736 Y165.536 E.07209
N12954 G1 X159.264 Y134.064 E1.43118
N12955 G1 X159.264 Y137.968 E.12552
N12956 G1 X190.736 Y129.535 E1.0477
N12957 G1 X190.736 Y130.994 E.04689
N12958 G1 X179.006 Y119.264 E.5334
N12959 G1 X178.448 Y119.264 E.01795
N12960 G1 X159.264 Y190.859 E2.38343
N12961 G1 X159.264 Y191.634 E.02493
N12962 G1 X168.366 Y200.736 E.41389
N12963 G1 X165.047 Y200.736 E.10673
N12964 G1 X186.877 Y119.264 E2.71223
N12965 G1 X190.52 Y119.264 E.11716
N12966 G1 X190.736 Y119.48 E.00979
N12967 G1 X190.736 Y121.107 E.05231
N12968 G1 X159.264 Y129.539 E1.0477
N12969 G1 X159.264 Y127.946 E.05125
N12970 G1 X161.591 Y119.264 E.289
N12971 G1 X159.962 Y119.264 E.05236
N12976 G1 X170.019 Y119.264 E.05236
N12977 G1 X159.264 Y159.402 E1.33622
N12978 G1 X159.264 Y163.254 E.12387
N12979 G1 X190.736 Y154.822 E1.0477
N12980 G1 X190.736 Y154.022 E.02573
N12981 G1 X159.264 Y122.551 E1.43118
N12982 G1 X159.264 Y121.11 E.04631
N12983 G1 X166.154 Y119.264 E.22935
N12984 G1 X167.492 Y119.264 E.04304
N12985 G1 X190.736 Y142.508 E1.05701
N12986 G1 X190.736 Y146.393 E.12494
N12987 G1 X159.264 Y154.826 E1.04769
N12988 G1 X159.264 Y157.092 E.07289
N12989 G1 X190.736 Y188.563 E1.43118
N12990 G1 X190.736 Y188.537 E.00085
N12991 G1 X159.264 Y196.97 E1.0477
N12992 G1 X159.264 Y198.598 E.05236
N12997 G1 X159.264 Y188.541 E.05236
N12998 G1 X190.736 Y180.108 E1.0477
N12999 G1 X190.736 Y177.049 E.09836
N13000 G1 X159.264 Y145.578 E1.43118
N13001 G1 X159.264 Y146.397 E.02632
N13002 G1 X190.736 Y137.964 E1.0477
N13003 G1 X190.736 Y139.593 E.05236
N13008 G1 X190.736 Y136.321 E.05236
N13009 G1 X173.476 Y200.736 E2.14442
N13010 G1 X176.667 Y200.736 E.10261
N13011 G1 X190.736 Y196.966 E.46837
N13012 G1 X190.736 Y199.234 E.07294
N13013 G1 X190.333 Y200.736 E.04999
N13014 G1 X188.705 Y200.736 E.05236
N13016 G1 X190.333 Y200.736 E-.61876
N13017 G1 X190.429 Y200.377 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN13067 G1 Z10.4
N13068 G1 E.8 F1800
N13069 ; FEATURE: Inner wall
N13070 ; LINE_WIDTH: 0.45
N13071 ; LAYER_HEIGHT: 0.2
N13072 G1 F4421.739
N13073 M204 S8000
N13074 G1 X158.916 Y201.084 E1.03439
N13075 G1 X158.916 Y118.916 E2.64221
N13076 G1 X191.084 Y118.916 E1.03439
N13077 G1 X191.084 Y201.024 E2.64028
N13078 ; COOLING_NODE: 0
N13079 M204 S10000
N13080 G1 X191.491 Y201.491 F60000
N13081 G1 F4421.739
N13082 M204 S8000
N13083 G1 X158.509 Y201.491 E1.06057
N13084 G1 X158.509 Y118.509 E2.66839
N13085 G1 X191.491 Y118.509 E1.06057
N13086 G1 X191.491 Y201.431 E2.66646
N13087 ; COOLING_NODE: 0
N13088 M204 S10000
N13089 G1 X191.898 Y201.898 F60000
N13090 G1 F4421.739
N13091 M204 S8000
N13092 M73 P71 R18
N13093 G1 X158.102 Y201.898 E1.08675
N13094 G1 X158.102 Y118.102 E2.69457
N13095 G1 X191.898 Y118.102 E1.08675
N13096 G1 X191.898 Y201.838 E2.69264
N13097 ; COOLING_NODE: 0
N13098 M204 S10000
N13099 G1 X192.29 Y202.29 F60000
N13100 ; FEATURE: Outer wall
N13101 ; LINE_WIDTH: 0.42
N13102 G1 F4773.528
N13103 M204 S5000
N13104 G1 X157.71 Y202.29 E1.03002
N13105 G1 X157.71 Y117.71 E2.51935
N13106 G1 X192.29 Y117.71 E1.03002
N13107 G1 X192.29 Y202.23 E2.51756
N13108 G1 E-.8 F1800
N13109 M204 S10000
N13110 G1 X190.736 Y199.877 Z10.8 F60000
N13111 G1 Z10.4
N13112 G1 E.8 F1800
N13113 ; FEATURE: Sparse infill
N13114 ; LINE_WIDTH: 0.45
N13115 G1 F4421.739
N13116 M204 S8000
N13117 G1 X159.264 Y168.406 E1.43118
N13118 G1 X159.264 Y171.83 E.11008
N13119 G1 X190.736 Y163.397 E1.0477
N13120 G1 X190.736 Y161.769 E.05236
N13121 M204 S10000
N13122 G1 X190.736 Y173.454 F60000
N13123 G1 F4421.739
N13124 M204 S8000
N13125 G1 X190.736 Y171.826 E.05236
N13126 G1 X159.264 Y180.258 E1.0477
N13127 G1 X159.264 Y179.92 E.01088
N13128 G1 X180.08 Y200.736 E.9466
N13129 G1 X181.758 Y200.736 E.05397
N13130 G1 X190.736 Y167.231 E1.11539
N13131 G1 X190.736 Y165.336 E.06095
N13132 G1 X159.264 Y133.864 E1.43118
N13133 G1 X159.264 Y138.114 E.13666
N13134 G1 X190.736 Y129.682 E1.04769
N13135 G1 X190.736 Y130.794 E.03575
N13136 M73 P71 R17
N13137 G1 X179.206 Y119.264 E.5243
N13138 G1 X178.302 Y119.264 E.02909
N13139 G1 X159.264 Y190.313 E2.36524
N13140 G1 X159.264 Y191.434 E.03607
N13141 G1 X168.566 Y200.736 E.42299
N13142 G1 X164.9 Y200.736 E.11787
N13143 G1 X186.731 Y119.264 E2.71223
N13144 G1 X190.736 Y119.264 E.12879
N13145 G1 X190.736 Y121.253 E.06395
N13146 G1 X159.264 Y129.686 E1.0477
N13147 G1 X159.264 Y127.399 E.07353
N13148 G1 X161.444 Y119.264 E.27081
N13149 G1 X159.816 Y119.264 E.05236
N13150 M204 S10000
N13151 G1 X171.501 Y119.264 F60000
N13152 G1 F4421.739
N13153 M204 S8000
N13154 G1 X169.873 Y119.264 E.05236
N13155 G1 X159.264 Y158.856 E1.31803
N13156 G1 X159.264 Y163.401 E.14615
N13157 G1 X190.736 Y154.968 E1.0477
N13158 G1 X190.736 Y153.822 E.03687
N13159 G1 X159.264 Y122.351 E1.43118
N13160 G1 X159.264 Y121.257 E.03517
N13161 G1 X166.7 Y119.264 E.24754
N13162 G1 X167.692 Y119.264 E.0319
N13163 G1 X190.736 Y142.308 E1.04791
N13164 G1 X190.736 Y138.111 E.13496
N13165 G1 X159.264 Y146.543 E1.0477
N13166 G1 X159.264 Y145.378 E.03746
N13167 G1 X190.736 Y176.849 E1.43118
N13168 G1 X190.736 Y180.255 E.1095
N13169 G1 X159.264 Y188.687 E1.0477
N13170 G1 X159.264 Y187.059 E.05236
N13171 M204 S10000
N13172 G1 X159.264 Y198.744 F60000
N13173 G1 F4421.739
N13174 M204 S8000
N13175 G1 X159.264 Y197.116 E.05236
N13176 G1 X190.736 Y188.683 E1.04769
N13177 G1 X190.736 Y188.363 E.01029
N13178 G1 X159.264 Y156.892 E1.43118
N13179 G1 X159.264 Y154.972 E.06175
N13180 G1 X190.736 Y146.539 E1.04769
N13181 G1 X190.736 Y148.168 E.05236
N13182 M204 S10000
N13183 G1 X190.736 Y134.146 F60000
N13184 G1 F4421.739
N13185 M204 S8000
N13186 G1 X190.736 Y135.774 E.05236
N13187 G1 X173.329 Y200.736 E2.16261
N13188 G1 X177.213 Y200.736 E.12489
N13189 G1 X190.736 Y197.112 E.45018
N13190 G1 X190.736 Y198.688 E.05066
N13191 G1 X190.187 Y200.736 E.06818
N13192 G1 X188.558 Y200.736 E.05236
N13193 ; WIPE_START
N13194 G1 X190.187 Y200.736 E-.61876
N13195 G1 X190.283 Y200.377 E-.14124
N13196 ; WIPE_END
N13197 G1 E-.04 F1800
N13198 M204 S10000
N13199 G17
N13200 G3 Z10.8 I1.217 J0 P1  F60000
N13201 ; stop printing object, unique label id: 372
N13202 M625
N13203 ; object ids of layer 52 start: 372
N13204 M624 AQAAAAAAAAA=
N13205 ;======== H2D 20250527========
N13206 ; SKIPPABLE_START
N13207 ; SKIPTYPE: timelapse
N13208 M622.1 S1 ; for prev firware, default turned on
N13209 
N13210 M1002 judge_flag timelapse_record_flag
N13211 
N13212 M622 J1
N13213 M993 A2 B2 C2
N13214 M993 A0 B0 C0
N13215 
N13216 
N13217 
N13218 
N13219     M9711 M0 E1 X261 Y132 Z10.8 S11 C10 O0 T3000
N13220 
N13221 
N13222 
N13223 M993 A3 B3 C3
N13224 
N13225 M623
N13226 ; SKIPPABLE_END
N13227 
N13228 ; object ids of this layer52 end: 372
N13229 M625
N13230 ; CHANGE_LAYER
N13231 ; Z_HEIGHT: 10.6
N13232 ; LAYER_HEIGHT: 0.200001
N13233 ;======== H2D 20250521========
N13234 ; layer num/total_layer_count: 53/75
N13235 ; update layer progress
N13236 M73 L53
N13237 M991 S0 P52 ;notify layer change
N13238 
N13239 
N13240 M106 S38.25
N13241 ; OBJECT_ID: 372
N13242 ; COOLING_NODE: 0
N13243 ; start printing object, unique label id: 372
N13244 M624 AQAAAAAAAAA=
N13245 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=10.500G1 Z10.500 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N13074 G1 X158.916 Y201.084 E1.03439
N13075 G1 X158.916 Y118.916 E2.64221
N13076 G1 X191.084 Y118.916 E1.03439
N13077 G1 X191.084 Y201.024 E2.64028
N13083 G1 X158.509 Y201.491 E1.06057
N13084 G1 X158.509 Y118.509 E2.66839
N13085 G1 X191.491 Y118.509 E1.06057
N13086 G1 X191.491 Y201.431 E2.66646
N13093 G1 X158.102 Y201.898 E1.08675
N13094 G1 X158.102 Y118.102 E2.69457
N13095 G1 X191.898 Y118.102 E1.08675
N13096 G1 X191.898 Y201.838 E2.69264
N13104 G1 X157.71 Y202.29 E1.03002
N13105 G1 X157.71 Y117.71 E2.51935
N13106 G1 X192.29 Y117.71 E1.03002
N13107 G1 X192.29 Y202.23 E2.51756
N13117 G1 X159.264 Y168.406 E1.43118
N13118 G1 X159.264 Y171.83 E.11008
N13119 G1 X190.736 Y163.397 E1.0477
N13120 G1 X190.736 Y161.769 E.05236
N13125 G1 X190.736 Y171.826 E.05236
N13126 G1 X159.264 Y180.258 E1.0477
N13127 G1 X159.264 Y179.92 E.01088
N13128 G1 X180.08 Y200.736 E.9466
N13129 G1 X181.758 Y200.736 E.05397
N13130 G1 X190.736 Y167.231 E1.11539
N13131 G1 X190.736 Y165.336 E.06095
N13132 G1 X159.264 Y133.864 E1.43118
N13133 G1 X159.264 Y138.114 E.13666
N13134 G1 X190.736 Y129.682 E1.04769
N13135 G1 X190.736 Y130.794 E.03575
N13137 G1 X179.206 Y119.264 E.5243
N13138 G1 X178.302 Y119.264 E.02909
N13139 G1 X159.264 Y190.313 E2.36524
N13140 G1 X159.264 Y191.434 E.03607
N13141 G1 X168.566 Y200.736 E.42299
N13142 G1 X164.9 Y200.736 E.11787
N13143 G1 X186.731 Y119.264 E2.71223
N13144 G1 X190.736 Y119.264 E.12879
N13145 G1 X190.736 Y121.253 E.06395
N13146 G1 X159.264 Y129.686 E1.0477
N13147 G1 X159.264 Y127.399 E.07353
N13148 G1 X161.444 Y119.264 E.27081
N13149 G1 X159.816 Y119.264 E.05236
N13154 G1 X169.873 Y119.264 E.05236
N13155 G1 X159.264 Y158.856 E1.31803
N13156 G1 X159.264 Y163.401 E.14615
N13157 G1 X190.736 Y154.968 E1.0477
N13158 G1 X190.736 Y153.822 E.03687
N13159 G1 X159.264 Y122.351 E1.43118
N13160 G1 X159.264 Y121.257 E.03517
N13161 G1 X166.7 Y119.264 E.24754
N13162 G1 X167.692 Y119.264 E.0319
N13163 G1 X190.736 Y142.308 E1.04791
N13164 G1 X190.736 Y138.111 E.13496
N13165 G1 X159.264 Y146.543 E1.0477
N13166 G1 X159.264 Y145.378 E.03746
N13167 G1 X190.736 Y176.849 E1.43118
N13168 G1 X190.736 Y180.255 E.1095
N13169 G1 X159.264 Y188.687 E1.0477
N13170 G1 X159.264 Y187.059 E.05236
N13175 G1 X159.264 Y197.116 E.05236
N13176 G1 X190.736 Y188.683 E1.04769
N13177 G1 X190.736 Y188.363 E.01029
N13178 G1 X159.264 Y156.892 E1.43118
N13179 G1 X159.264 Y154.972 E.06175
N13180 G1 X190.736 Y146.539 E1.04769
N13181 G1 X190.736 Y148.168 E.05236
N13186 G1 X190.736 Y135.774 E.05236
N13187 G1 X173.329 Y200.736 E2.16261
N13188 G1 X177.213 Y200.736 E.12489
N13189 G1 X190.736 Y197.112 E.45018
N13190 G1 X190.736 Y198.688 E.05066
N13191 G1 X190.187 Y200.736 E.06818
N13192 G1 X188.558 Y200.736 E.05236
N13194 G1 X190.187 Y200.736 E-.61876
N13195 G1 X190.283 Y200.377 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN13246 G1 Z10.6
N13247 G1 E.8 F1800
N13248 ; FEATURE: Inner wall
N13249 ; LINE_WIDTH: 0.45
N13250 ; LAYER_HEIGHT: 0.2
N13251 G1 F4421.739
N13252 M204 S8000
N13253 G1 X158.916 Y201.084 E1.03439
N13254 G1 X158.916 Y118.916 E2.64221
N13255 G1 X191.084 Y118.916 E1.03439
N13256 G1 X191.084 Y201.024 E2.64028
N13257 ; COOLING_NODE: 0
N13258 M204 S10000
N13259 G1 X191.491 Y201.491 F60000
N13260 G1 F4421.739
N13261 M204 S8000
N13262 G1 X158.509 Y201.491 E1.06057
N13263 G1 X158.509 Y118.509 E2.66839
N13264 G1 X191.491 Y118.509 E1.06057
N13265 G1 X191.491 Y201.431 E2.66646
N13266 ; COOLING_NODE: 0
N13267 M204 S10000
N13268 G1 X191.898 Y201.898 F60000
N13269 G1 F4421.739
N13270 M204 S8000
N13271 G1 X158.102 Y201.898 E1.08675
N13272 G1 X158.102 Y118.102 E2.69457
N13273 G1 X191.898 Y118.102 E1.08675
N13274 G1 X191.898 Y201.838 E2.69264
N13275 ; COOLING_NODE: 0
N13276 M204 S10000
N13277 G1 X192.29 Y202.29 F60000
N13278 ; FEATURE: Outer wall
N13279 ; LINE_WIDTH: 0.42
N13280 G1 F4773.528
N13281 M204 S5000
N13282 G1 X157.71 Y202.29 E1.03002
N13283 G1 X157.71 Y117.71 E2.51935
N13284 G1 X192.29 Y117.71 E1.03002
N13285 G1 X192.29 Y202.23 E2.51756
N13286 G1 E-.8 F1800
N13287 M204 S10000
N13288 G1 X191.876 Y194.609 Z11 F60000
N13289 G1 X190.736 Y173.601 Z11
N13290 G1 Z10.6
N13291 G1 E.8 F1800
N13292 ; FEATURE: Sparse infill
N13293 ; LINE_WIDTH: 0.45
N13294 G1 F4421.739
N13295 M204 S8000
N13296 G1 X190.736 Y171.972 E.05236
N13297 G1 X159.264 Y180.405 E1.0477
N13298 G1 X159.264 Y179.72 E.02201
N13299 G1 X180.28 Y200.736 E.95569
N13300 G1 X181.612 Y200.736 E.04283
N13301 G1 X190.736 Y166.684 E1.13358
N13302 G1 X190.736 Y165.136 E.04981
N13303 G1 X159.264 Y133.664 E1.43118
N13304 G1 X159.264 Y138.261 E.1478
N13305 G1 X190.736 Y129.828 E1.04769
N13306 G1 X190.736 Y130.594 E.02461
N13307 G1 X179.406 Y119.264 E.51521
N13308 G1 X178.155 Y119.264 E.04023
N13309 M73 P72 R17
N13310 G1 X159.264 Y189.766 E2.34705
N13311 G1 X159.264 Y191.234 E.04721
N13312 G1 X168.766 Y200.736 E.43208
N13313 G1 X164.754 Y200.736 E.129
N13314 G1 X186.584 Y119.264 E2.71223
N13315 G1 X190.736 Y119.264 E.13349
N13316 G1 X190.736 Y121.399 E.06865
N13317 G1 X159.264 Y129.832 E1.0477
N13318 G1 X159.264 Y126.853 E.09581
N13319 G1 X161.298 Y119.264 E.25262
N13320 G1 X162.926 Y119.264 E.05236
N13321 M204 S10000
N13322 G1 X171.355 Y119.264 F60000
N13323 G1 F4421.739
N13324 M204 S8000
N13325 G1 X169.727 Y119.264 E.05236
N13326 G1 X159.264 Y158.309 E1.29983
N13327 G1 X159.264 Y163.547 E.16843
N13328 G1 X190.736 Y155.115 E1.0477
N13329 G1 X190.736 Y153.622 E.04801
N13330 G1 X159.264 Y122.151 E1.43118
N13331 G1 X159.264 Y121.403 E.02403
N13332 G1 X167.247 Y119.264 E.26573
N13333 G1 X167.892 Y119.264 E.02076
N13334 G1 X190.736 Y142.108 E1.03882
N13335 G1 X190.736 Y138.257 E.12382
N13336 G1 X159.264 Y146.69 E1.0477
N13337 G1 X159.264 Y145.178 E.0486
N13338 G1 X190.736 Y176.649 E1.43118
N13339 G1 X190.736 Y180.401 E.12063
N13340 G1 X159.264 Y188.834 E1.0477
N13341 M204 S10000
N13342 G1 X159.264 Y198.891 F60000
N13343 G1 F4421.739
N13344 M204 S8000
N13345 G1 X159.264 Y197.262 E.05236
N13346 G1 X190.736 Y188.83 E1.04769
N13347 G1 X190.736 Y188.163 E.02143
N13348 G1 X159.264 Y156.692 E1.43118
N13349 G1 X159.264 Y155.118 E.05061
N13350 G1 X190.736 Y146.686 E1.0477
N13351 G1 X190.736 Y148.314 E.05236
N13352 M204 S10000
N13353 G1 X190.736 Y161.915 F60000
N13354 G1 F4421.739
N13355 M204 S8000
N13356 G1 X190.736 Y163.543 E.05236
N13357 G1 X159.264 Y171.976 E1.0477
N13358 G1 X159.264 Y168.206 E.12122
N13359 G1 X190.736 Y199.677 E1.43118
N13360 G1 X190.736 Y200.736 E.03403
N13361 G1 X190.04 Y200.736 E.02235
N13362 G1 X190.736 Y198.141 E.08637
N13363 G1 X190.736 Y197.259 E.02838
N13364 G1 X177.759 Y200.736 E.43199
N13365 G1 X173.183 Y200.736 E.14717
N13366 G1 X190.736 Y135.228 E2.1808
N13367 G1 X190.736 Y133.599 E.05236
N13368 ; WIPE_START
N13369 G1 X190.736 Y135.228 E-.61876
N13370 G1 X190.639 Y135.587 E-.14124
N13371 ; WIPE_END
N13372 G1 E-.04 F1800
N13373 M204 S10000
N13374 G17
N13375 G3 Z11 I1.217 J0 P1  F60000
N13376 ; stop printing object, unique label id: 372
N13377 M625
N13378 ; object ids of layer 53 start: 372
N13379 M624 AQAAAAAAAAA=
N13380 ;======== H2D 20250527========
N13381 ; SKIPPABLE_START
N13382 ; SKIPTYPE: timelapse
N13383 M622.1 S1 ; for prev firware, default turned on
N13384 
N13385 M1002 judge_flag timelapse_record_flag
N13386 
N13387 M622 J1
N13388 M993 A2 B2 C2
N13389 M993 A0 B0 C0
N13390 
N13391 
N13392 
N13393 
N13394     M9711 M0 E1 X261 Y132 Z11 S11 C10 O0 T3000
N13395 
N13396 
N13397 
N13398 M993 A3 B3 C3
N13399 
N13400 M623
N13401 ; SKIPPABLE_END
N13402 
N13403 ; object ids of this layer53 end: 372
N13404 M625
N13405 ; CHANGE_LAYER
N13406 ; Z_HEIGHT: 10.8
N13407 ; LAYER_HEIGHT: 0.2
N13408 ;======== H2D 20250521========
N13409 ; layer num/total_layer_count: 54/75
N13410 ; update layer progress
N13411 M73 L54
N13412 M991 S0 P53 ;notify layer change
N13413 
N13414 
N13415 ; OBJECT_ID: 372
N13416 ; COOLING_NODE: 0
N13417 ; start printing object, unique label id: 372
N13418 M624 AQAAAAAAAAA=
N13419 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=10.700G1 Z10.700 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N13253 G1 X158.916 Y201.084 E1.03439
N13254 G1 X158.916 Y118.916 E2.64221
N13255 G1 X191.084 Y118.916 E1.03439
N13256 G1 X191.084 Y201.024 E2.64028
N13262 G1 X158.509 Y201.491 E1.06057
N13263 G1 X158.509 Y118.509 E2.66839
N13264 G1 X191.491 Y118.509 E1.06057
N13265 G1 X191.491 Y201.431 E2.66646
N13271 G1 X158.102 Y201.898 E1.08675
N13272 G1 X158.102 Y118.102 E2.69457
N13273 G1 X191.898 Y118.102 E1.08675
N13274 G1 X191.898 Y201.838 E2.69264
N13282 G1 X157.71 Y202.29 E1.03002
N13283 G1 X157.71 Y117.71 E2.51935
N13284 G1 X192.29 Y117.71 E1.03002
N13285 G1 X192.29 Y202.23 E2.51756
N13296 G1 X190.736 Y171.972 E.05236
N13297 G1 X159.264 Y180.405 E1.0477
N13298 G1 X159.264 Y179.72 E.02201
N13299 G1 X180.28 Y200.736 E.95569
N13300 G1 X181.612 Y200.736 E.04283
N13301 G1 X190.736 Y166.684 E1.13358
N13302 G1 X190.736 Y165.136 E.04981
N13303 G1 X159.264 Y133.664 E1.43118
N13304 G1 X159.264 Y138.261 E.1478
N13305 G1 X190.736 Y129.828 E1.04769
N13306 G1 X190.736 Y130.594 E.02461
N13307 G1 X179.406 Y119.264 E.51521
N13308 G1 X178.155 Y119.264 E.04023
N13310 G1 X159.264 Y189.766 E2.34705
N13311 G1 X159.264 Y191.234 E.04721
N13312 G1 X168.766 Y200.736 E.43208
N13313 G1 X164.754 Y200.736 E.129
N13314 G1 X186.584 Y119.264 E2.71223
N13315 G1 X190.736 Y119.264 E.13349
N13316 G1 X190.736 Y121.399 E.06865
N13317 G1 X159.264 Y129.832 E1.0477
N13318 G1 X159.264 Y126.853 E.09581
N13319 G1 X161.298 Y119.264 E.25262
N13320 G1 X162.926 Y119.264 E.05236
N13325 G1 X169.727 Y119.264 E.05236
N13326 G1 X159.264 Y158.309 E1.29983
N13327 G1 X159.264 Y163.547 E.16843
N13328 G1 X190.736 Y155.115 E1.0477
N13329 G1 X190.736 Y153.622 E.04801
N13330 G1 X159.264 Y122.151 E1.43118
N13331 G1 X159.264 Y121.403 E.02403
N13332 G1 X167.247 Y119.264 E.26573
N13333 G1 X167.892 Y119.264 E.02076
N13334 G1 X190.736 Y142.108 E1.03882
N13335 G1 X190.736 Y138.257 E.12382
N13336 G1 X159.264 Y146.69 E1.0477
N13337 G1 X159.264 Y145.178 E.0486
N13338 G1 X190.736 Y176.649 E1.43118
N13339 G1 X190.736 Y180.401 E.12063
N13340 G1 X159.264 Y188.834 E1.0477
N13345 G1 X159.264 Y197.262 E.05236
N13346 G1 X190.736 Y188.83 E1.04769
N13347 G1 X190.736 Y188.163 E.02143
N13348 G1 X159.264 Y156.692 E1.43118
N13349 G1 X159.264 Y155.118 E.05061
N13350 G1 X190.736 Y146.686 E1.0477
N13351 G1 X190.736 Y148.314 E.05236
N13356 G1 X190.736 Y163.543 E.05236
N13357 G1 X159.264 Y171.976 E1.0477
N13358 G1 X159.264 Y168.206 E.12122
N13359 G1 X190.736 Y199.677 E1.43118
N13360 G1 X190.736 Y200.736 E.03403
N13361 G1 X190.04 Y200.736 E.02235
N13362 G1 X190.736 Y198.141 E.08637
N13363 G1 X190.736 Y197.259 E.02838
N13364 G1 X177.759 Y200.736 E.43199
N13365 G1 X173.183 Y200.736 E.14717
N13366 G1 X190.736 Y135.228 E2.1808
N13367 G1 X190.736 Y133.599 E.05236
N13369 G1 X190.736 Y135.228 E-.61876
N13370 G1 X190.639 Y135.587 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN13420 G1 Z10.8
N13421 G1 E.8 F1800
N13422 ; FEATURE: Inner wall
N13423 ; LINE_WIDTH: 0.45
N13424 ; LAYER_HEIGHT: 0.2
N13425 G1 F4421.739
N13426 M204 S8000
N13427 G1 X158.916 Y201.084 E1.03439
N13428 G1 X158.916 Y118.916 E2.64221
N13429 G1 X191.084 Y118.916 E1.03439
N13430 G1 X191.084 Y201.024 E2.64028
N13431 ; COOLING_NODE: 0
N13432 M204 S10000
N13433 G1 X191.491 Y201.491 F60000
N13434 G1 F4421.739
N13435 M204 S8000
N13436 G1 X158.509 Y201.491 E1.06057
N13437 G1 X158.509 Y118.509 E2.66839
N13438 G1 X191.491 Y118.509 E1.06057
N13439 G1 X191.491 Y201.431 E2.66646
N13440 ; COOLING_NODE: 0
N13441 M204 S10000
N13442 G1 X191.898 Y201.898 F60000
N13443 G1 F4421.739
N13444 M204 S8000
N13445 G1 X158.102 Y201.898 E1.08675
N13446 G1 X158.102 Y118.102 E2.69457
N13447 G1 X191.898 Y118.102 E1.08675
N13448 G1 X191.898 Y201.838 E2.69264
N13449 ; COOLING_NODE: 0
N13450 M204 S10000
N13451 G1 X192.29 Y202.29 F60000
N13452 ; FEATURE: Outer wall
N13453 ; LINE_WIDTH: 0.42
N13454 G1 F4773.528
N13455 M204 S5000
N13456 G1 X157.71 Y202.29 E1.03002
N13457 G1 X157.71 Y117.71 E2.51935
N13458 G1 X192.29 Y117.71 E1.03002
N13459 G1 X192.29 Y202.23 E2.51756
N13460 G1 E-.8 F1800
N13461 M204 S10000
N13462 G1 X184.692 Y201.503 Z11.2 F60000
N13463 G1 X176.677 Y200.736 Z11.2
N13464 G1 Z10.8
N13465 G1 E.8 F1800
N13466 ; FEATURE: Sparse infill
N13467 ; LINE_WIDTH: 0.45
N13468 G1 F4421.739
N13469 M204 S8000
N13470 G1 X178.306 Y200.736 E.05236
N13471 G1 X190.736 Y197.405 E.4138
N13472 G1 X190.736 Y197.595 E.0061
N13473 G1 X189.894 Y200.736 E.10456
N13474 G1 X190.736 Y200.736 E.02706
N13475 G1 X190.736 Y199.477 E.04046
N13476 G1 X159.264 Y168.006 E1.43118
N13477 G1 X159.264 Y172.122 E.13236
N13478 G1 X190.736 Y163.69 E1.0477
N13479 G1 X190.736 Y162.061 E.05236
N13480 M204 S10000
N13481 G1 X190.736 Y170.49 F60000
N13482 G1 F4421.739
N13483 M204 S8000
N13484 G1 X190.736 Y172.119 E.05236
N13485 G1 X159.264 Y180.551 E1.0477
N13486 G1 X159.264 Y179.52 E.03315
N13487 G1 X180.48 Y200.736 E.96479
N13488 G1 X181.465 Y200.736 E.03169
N13489 G1 X190.736 Y166.138 E1.15177
N13490 G1 X190.736 Y164.936 E.03867
N13491 G1 X159.264 Y133.464 E1.43118
N13492 G1 X159.264 Y129.978 E.1121
N13493 G1 X190.736 Y121.546 E1.0477
N13494 G1 X190.736 Y119.264 E.07336
N13495 G1 X186.438 Y119.264 E.1382
N13496 G1 X164.608 Y200.736 E2.71223
N13497 G1 X162.979 Y200.736 E.05236
N13498 M204 S10000
N13499 G1 X190.736 Y148.461 F60000
N13500 G1 F4421.739
N13501 M204 S8000
N13502 G1 X190.736 Y146.832 E.05236
N13503 G1 X159.264 Y155.265 E1.0477
N13504 G1 X159.264 Y156.492 E.03947
N13505 G1 X190.736 Y187.963 E1.43118
N13506 G1 X190.736 Y188.976 E.03257
N13507 G1 X159.264 Y197.409 E1.0477
N13508 G1 X159.264 Y191.034 E.20499
N13509 G1 X168.966 Y200.736 E.44118
N13510 G1 X173.036 Y200.736 E.1309
N13511 G1 X190.736 Y134.681 E2.19899
N13512 G1 X190.736 Y133.053 E.05236
N13513 M204 S10000
N13514 G1 X159.264 Y127.935 F60000
N13515 G1 F4421.739
N13516 M204 S8000
N13517 M73 P72 R16
N13518 G1 X159.264 Y126.306 E.05236
N13519 G1 X161.151 Y119.264 E.23443
N13520 G1 X162.78 Y119.264 E.05236
N13521 M204 S10000
N13522 G1 X171.208 Y119.264 F60000
N13523 G1 F4421.739
N13524 M204 S8000
N13525 G1 X169.58 Y119.264 E.05236
N13526 G1 X159.264 Y157.763 E1.28164
N13527 G1 X159.264 Y163.694 E.19071
N13528 G1 X190.736 Y155.261 E1.0477
N13529 G1 X190.736 Y153.422 E.05915
N13530 G1 X159.264 Y121.951 E1.43118
N13531 G1 X159.264 Y121.55 E.01289
N13532 G1 X167.793 Y119.264 E.28393
N13533 G1 X168.092 Y119.264 E.00962
N13534 G1 X190.736 Y141.908 E1.02972
N13535 G1 X190.736 Y138.403 E.11268
N13536 G1 X159.264 Y146.836 E1.0477
N13537 G1 X159.264 Y144.978 E.05974
N13538 G1 X190.736 Y176.449 E1.43118
N13539 G1 X190.736 Y180.547 E.13177
N13540 G1 X159.264 Y188.98 E1.0477
N13541 G1 X159.264 Y189.22 E.00771
N13542 G1 X178.009 Y119.264 E2.32886
N13543 G1 X179.606 Y119.264 E.05137
N13544 M73 P73 R16
N13545 G1 X190.736 Y130.394 E.50611
N13546 G1 X190.736 Y129.975 E.01348
N13547 G1 X159.264 Y138.407 E1.0477
N13548 G1 X159.264 Y140.036 E.05236
N13549 ; WIPE_START
N13550 G1 X159.264 Y138.407 E-.61876
N13551 G1 X159.623 Y138.311 E-.14124
N13552 ; WIPE_END
N13553 G1 E-.04 F1800
N13554 M204 S10000
N13555 G17
N13556 G3 Z11.2 I1.217 J0 P1  F60000
N13557 ; stop printing object, unique label id: 372
N13558 M625
N13559 ; object ids of layer 54 start: 372
N13560 M624 AQAAAAAAAAA=
N13561 ;======== H2D 20250527========
N13562 ; SKIPPABLE_START
N13563 ; SKIPTYPE: timelapse
N13564 M622.1 S1 ; for prev firware, default turned on
N13565 
N13566 M1002 judge_flag timelapse_record_flag
N13567 
N13568 M622 J1
N13569 M993 A2 B2 C2
N13570 M993 A0 B0 C0
N13571 
N13572 
N13573 
N13574 
N13575     M9711 M0 E1 X261 Y132 Z11.2 S11 C10 O0 T3000
N13576 
N13577 
N13578 
N13579 M993 A3 B3 C3
N13580 
N13581 M623
N13582 ; SKIPPABLE_END
N13583 
N13584 ; object ids of this layer54 end: 372
N13585 M625
N13586 ; CHANGE_LAYER
N13587 ; Z_HEIGHT: 11
N13588 ; LAYER_HEIGHT: 0.2
N13589 ;======== H2D 20250521========
N13590 ; layer num/total_layer_count: 55/75
N13591 ; update layer progress
N13592 M73 L55
N13593 M991 S0 P54 ;notify layer change
N13594 
N13595 
N13596 ; OBJECT_ID: 372
N13597 ; COOLING_NODE: 0
N13598 ; start printing object, unique label id: 372
N13599 M624 AQAAAAAAAAA=
N13600 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=10.900G1 Z10.900 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N13427 G1 X158.916 Y201.084 E1.03439
N13428 G1 X158.916 Y118.916 E2.64221
N13429 G1 X191.084 Y118.916 E1.03439
N13430 G1 X191.084 Y201.024 E2.64028
N13436 G1 X158.509 Y201.491 E1.06057
N13437 G1 X158.509 Y118.509 E2.66839
N13438 G1 X191.491 Y118.509 E1.06057
N13439 G1 X191.491 Y201.431 E2.66646
N13445 G1 X158.102 Y201.898 E1.08675
N13446 G1 X158.102 Y118.102 E2.69457
N13447 G1 X191.898 Y118.102 E1.08675
N13448 G1 X191.898 Y201.838 E2.69264
N13456 G1 X157.71 Y202.29 E1.03002
N13457 G1 X157.71 Y117.71 E2.51935
N13458 G1 X192.29 Y117.71 E1.03002
N13459 G1 X192.29 Y202.23 E2.51756
N13470 G1 X178.306 Y200.736 E.05236
N13471 G1 X190.736 Y197.405 E.4138
N13472 G1 X190.736 Y197.595 E.0061
N13473 G1 X189.894 Y200.736 E.10456
N13474 G1 X190.736 Y200.736 E.02706
N13475 G1 X190.736 Y199.477 E.04046
N13476 G1 X159.264 Y168.006 E1.43118
N13477 G1 X159.264 Y172.122 E.13236
N13478 G1 X190.736 Y163.69 E1.0477
N13479 G1 X190.736 Y162.061 E.05236
N13484 G1 X190.736 Y172.119 E.05236
N13485 G1 X159.264 Y180.551 E1.0477
N13486 G1 X159.264 Y179.52 E.03315
N13487 G1 X180.48 Y200.736 E.96479
N13488 G1 X181.465 Y200.736 E.03169
N13489 G1 X190.736 Y166.138 E1.15177
N13490 G1 X190.736 Y164.936 E.03867
N13491 G1 X159.264 Y133.464 E1.43118
N13492 G1 X159.264 Y129.978 E.1121
N13493 G1 X190.736 Y121.546 E1.0477
N13494 G1 X190.736 Y119.264 E.07336
N13495 G1 X186.438 Y119.264 E.1382
N13496 G1 X164.608 Y200.736 E2.71223
N13497 G1 X162.979 Y200.736 E.05236
N13502 G1 X190.736 Y146.832 E.05236
N13503 G1 X159.264 Y155.265 E1.0477
N13504 G1 X159.264 Y156.492 E.03947
N13505 G1 X190.736 Y187.963 E1.43118
N13506 G1 X190.736 Y188.976 E.03257
N13507 G1 X159.264 Y197.409 E1.0477
N13508 G1 X159.264 Y191.034 E.20499
N13509 G1 X168.966 Y200.736 E.44118
N13510 G1 X173.036 Y200.736 E.1309
N13511 G1 X190.736 Y134.681 E2.19899
N13512 G1 X190.736 Y133.053 E.05236
N13518 G1 X159.264 Y126.306 E.05236
N13519 G1 X161.151 Y119.264 E.23443
N13520 G1 X162.78 Y119.264 E.05236
N13525 G1 X169.58 Y119.264 E.05236
N13526 G1 X159.264 Y157.763 E1.28164
N13527 G1 X159.264 Y163.694 E.19071
N13528 G1 X190.736 Y155.261 E1.0477
N13529 G1 X190.736 Y153.422 E.05915
N13530 G1 X159.264 Y121.951 E1.43118
N13531 G1 X159.264 Y121.55 E.01289
N13532 G1 X167.793 Y119.264 E.28393
N13533 G1 X168.092 Y119.264 E.00962
N13534 G1 X190.736 Y141.908 E1.02972
N13535 G1 X190.736 Y138.403 E.11268
N13536 G1 X159.264 Y146.836 E1.0477
N13537 G1 X159.264 Y144.978 E.05974
N13538 G1 X190.736 Y176.449 E1.43118
N13539 G1 X190.736 Y180.547 E.13177
N13540 G1 X159.264 Y188.98 E1.0477
N13541 G1 X159.264 Y189.22 E.00771
N13542 G1 X178.009 Y119.264 E2.32886
N13543 G1 X179.606 Y119.264 E.05137
N13545 G1 X190.736 Y130.394 E.50611
N13546 G1 X190.736 Y129.975 E.01348
N13547 G1 X159.264 Y138.407 E1.0477
N13548 G1 X159.264 Y140.036 E.05236
N13550 G1 X159.264 Y138.407 E-.61876
N13551 G1 X159.623 Y138.311 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN13601 G1 Z11
N13602 G1 E.8 F1800
N13603 ; FEATURE: Inner wall
N13604 ; LINE_WIDTH: 0.45
N13605 ; LAYER_HEIGHT: 0.2
N13606 G1 F4421.739
N13607 M204 S8000
N13608 G1 X158.916 Y201.084 E1.03439
N13609 G1 X158.916 Y118.916 E2.64221
N13610 G1 X191.084 Y118.916 E1.03439
N13611 G1 X191.084 Y201.024 E2.64028
N13612 ; COOLING_NODE: 0
N13613 M204 S10000
N13614 G1 X191.491 Y201.491 F60000
N13615 G1 F4421.739
N13616 M204 S8000
N13617 G1 X158.509 Y201.491 E1.06057
N13618 G1 X158.509 Y118.509 E2.66839
N13619 G1 X191.491 Y118.509 E1.06057
N13620 G1 X191.491 Y201.431 E2.66646
N13621 ; COOLING_NODE: 0
N13622 M204 S10000
N13623 G1 X191.898 Y201.898 F60000
N13624 G1 F4421.739
N13625 M204 S8000
N13626 G1 X158.102 Y201.898 E1.08675
N13627 G1 X158.102 Y118.102 E2.69457
N13628 G1 X191.898 Y118.102 E1.08675
N13629 G1 X191.898 Y201.838 E2.69264
N13630 ; COOLING_NODE: 0
N13631 M204 S10000
N13632 G1 X192.29 Y202.29 F60000
N13633 ; FEATURE: Outer wall
N13634 ; LINE_WIDTH: 0.42
N13635 G1 F4773.528
N13636 M204 S5000
N13637 G1 X157.71 Y202.29 E1.03002
N13638 G1 X157.71 Y117.71 E2.51935
N13639 G1 X192.29 Y117.71 E1.03002
N13640 G1 X192.29 Y202.23 E2.51756
N13641 G1 E-.8 F1800
N13642 M204 S10000
N13643 G1 X190.736 Y197.551 Z11.4 F60000
N13644 G1 Z11
N13645 G1 E.8 F1800
N13646 ; FEATURE: Sparse infill
N13647 ; LINE_WIDTH: 0.45
N13648 G1 F4421.739
N13649 M204 S8000
N13650 G1 X178.852 Y200.736 E.39561
N13651 G1 X177.224 Y200.736 E.05236
N13652 M204 S10000
N13653 G1 X162.833 Y200.736 F60000
N13654 G1 F4421.739
N13655 M204 S8000
N13656 G1 X164.461 Y200.736 E.05236
N13657 G1 X186.291 Y119.264 E2.71223
N13658 G1 X190.736 Y119.264 E.14291
N13659 G1 X190.736 Y121.692 E.07807
N13660 G1 X159.264 Y130.125 E1.0477
N13661 G1 X159.264 Y133.264 E.10096
N13662 G1 X190.736 Y164.736 E1.43118
N13663 G1 X190.736 Y165.592 E.02753
N13664 G1 X181.319 Y200.736 E1.16996
N13665 G1 X180.68 Y200.736 E.02055
N13666 G1 X159.264 Y179.32 E.97388
N13667 G1 X159.264 Y180.698 E.04429
N13668 G1 X190.736 Y172.265 E1.0477
N13669 G1 X190.736 Y176.249 E.12813
N13670 G1 X159.264 Y144.778 E1.43118
N13671 G1 X159.264 Y146.982 E.07088
N13672 G1 X190.736 Y138.55 E1.0477
N13673 G1 X190.736 Y141.708 E.10154
N13674 G1 X168.292 Y119.264 E1.02063
N13675 G1 X168.34 Y119.264 E.00152
N13676 G1 X159.264 Y121.696 E.30212
N13677 G1 X159.264 Y121.751 E.00175
N13678 G1 X190.736 Y153.222 E1.43118
N13679 G1 X190.736 Y155.407 E.07029
N13680 G1 X159.264 Y163.84 E1.04769
N13681 G1 X159.264 Y167.806 E.12754
N13682 G1 X190.736 Y199.277 E1.43118
N13683 G1 X190.736 Y200.736 E.04689
N13684 G1 X189.748 Y200.736 E.03177
N13685 G1 X190.736 Y197.048 E.12275
N13686 G1 X190.736 Y195.42 E.05236
N13687 M204 S10000
N13688 G1 X190.736 Y182.322 F60000
N13689 G1 F4421.739
N13690 M204 S8000
N13691 G1 X190.736 Y180.694 E.05236
N13692 G1 X159.264 Y189.126 E1.0477
N13693 G1 X159.264 Y188.673 E.01457
N13694 G1 X177.863 Y119.264 E2.31067
N13695 G1 X179.806 Y119.264 E.06251
N13696 G1 X190.736 Y130.194 E.49702
N13697 G1 X190.736 Y130.121 E.00234
N13698 G1 X159.264 Y138.554 E1.0477
N13699 G1 X159.264 Y140.182 E.05236
N13700 M204 S10000
N13701 G1 X159.264 Y127.388 F60000
N13702 G1 F4421.739
N13703 M204 S8000
N13704 G1 X159.264 Y125.76 E.05236
N13705 G1 X161.005 Y119.264 E.21624
N13706 G1 X162.633 Y119.264 E.05236
N13707 M204 S10000
N13708 G1 X171.062 Y119.264 F60000
N13709 G1 F4421.739
N13710 M204 S8000
N13711 G1 X169.434 Y119.264 E.05236
N13712 G1 X159.264 Y157.217 E1.26345
N13713 G1 X159.264 Y158.845 E.05236
N13714 M204 S10000
N13715 G1 X159.264 Y173.897 F60000
N13716 G1 F4421.739
N13717 M204 S8000
N13718 G1 X159.264 Y172.269 E.05236
N13719 G1 X190.736 Y163.836 E1.0477
N13720 G1 X190.736 Y162.208 E.05236
N13721 M204 S10000
N13722 G1 X190.736 Y148.607 F60000
N13723 G1 F4421.739
N13724 M204 S8000
N13725 G1 X190.736 Y146.979 E.05236
N13726 G1 X159.264 Y155.411 E1.0477
N13727 G1 X159.264 Y153.783 E.05236
N13728 M204 S10000
N13729 G1 X159.264 Y156.292 F60000
N13730 G1 F4421.739
N13731 M204 S8000
N13732 G1 X190.736 Y187.763 E1.43118
N13733 G1 X190.736 Y189.123 E.04371
N13734 G1 X159.264 Y197.555 E1.0477
N13735 G1 X159.264 Y190.834 E.21612
N13736 G1 X169.166 Y200.736 E.45027
N13737 G1 X172.89 Y200.736 E.11976
N13738 G1 X190.736 Y134.135 E2.21718
N13739 G1 X190.736 Y132.507 E.05236
N13740 ; WIPE_START
N13741 G1 X190.736 Y134.135 E-.61876
N13742 G1 X190.639 Y134.494 E-.14124
N13743 ; WIPE_END
N13744 G1 E-.04 F1800
N13745 M204 S10000
N13746 G17
N13747 G3 Z11.4 I1.217 J0 P1  F60000
N13748 ; stop printing object, unique label id: 372
N13749 M625
N13750 ; object ids of layer 55 start: 372
N13751 M624 AQAAAAAAAAA=
N13752 ;======== H2D 20250527========
N13753 ; SKIPPABLE_START
N13754 ; SKIPTYPE: timelapse
N13755 M622.1 S1 ; for prev firware, default turned on
N13756 
N13757 M1002 judge_flag timelapse_record_flag
N13758 
N13759 M622 J1
N13760 M993 A2 B2 C2
N13761 M993 A0 B0 C0
N13762 
N13763 
N13764 
N13765 
N13766     M9711 M0 E1 X261 Y132 Z11.4 S11 C10 O0 T3000
N13767 
N13768 
N13769 
N13770 M993 A3 B3 C3
N13771 
N13772 M623
N13773 ; SKIPPABLE_END
N13774 
N13775 ; object ids of this layer55 end: 372
N13776 M625
N13777 ; CHANGE_LAYER
N13778 ; Z_HEIGHT: 11.2
N13779 ; LAYER_HEIGHT: 0.2
N13780 ;======== H2D 20250521========
N13781 ; layer num/total_layer_count: 56/75
N13782 ; update layer progress
N13783 M73 L56
N13784 M991 S0 P55 ;notify layer change
N13785 
N13786 
N13787 ; OBJECT_ID: 372
N13788 ; COOLING_NODE: 0
N13789 ; start printing object, unique label id: 372
N13790 M624 AQAAAAAAAAA=
N13791 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=11.100G1 Z11.100 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N13608 G1 X158.916 Y201.084 E1.03439
N13609 G1 X158.916 Y118.916 E2.64221
N13610 G1 X191.084 Y118.916 E1.03439
N13611 G1 X191.084 Y201.024 E2.64028
N13617 G1 X158.509 Y201.491 E1.06057
N13618 G1 X158.509 Y118.509 E2.66839
N13619 G1 X191.491 Y118.509 E1.06057
N13620 G1 X191.491 Y201.431 E2.66646
N13626 G1 X158.102 Y201.898 E1.08675
N13627 G1 X158.102 Y118.102 E2.69457
N13628 G1 X191.898 Y118.102 E1.08675
N13629 G1 X191.898 Y201.838 E2.69264
N13637 G1 X157.71 Y202.29 E1.03002
N13638 G1 X157.71 Y117.71 E2.51935
N13639 G1 X192.29 Y117.71 E1.03002
N13640 G1 X192.29 Y202.23 E2.51756
N13650 G1 X178.852 Y200.736 E.39561
N13651 G1 X177.224 Y200.736 E.05236
N13656 G1 X164.461 Y200.736 E.05236
N13657 G1 X186.291 Y119.264 E2.71223
N13658 G1 X190.736 Y119.264 E.14291
N13659 G1 X190.736 Y121.692 E.07807
N13660 G1 X159.264 Y130.125 E1.0477
N13661 G1 X159.264 Y133.264 E.10096
N13662 G1 X190.736 Y164.736 E1.43118
N13663 G1 X190.736 Y165.592 E.02753
N13664 G1 X181.319 Y200.736 E1.16996
N13665 G1 X180.68 Y200.736 E.02055
N13666 G1 X159.264 Y179.32 E.97388
N13667 G1 X159.264 Y180.698 E.04429
N13668 G1 X190.736 Y172.265 E1.0477
N13669 G1 X190.736 Y176.249 E.12813
N13670 G1 X159.264 Y144.778 E1.43118
N13671 G1 X159.264 Y146.982 E.07088
N13672 G1 X190.736 Y138.55 E1.0477
N13673 G1 X190.736 Y141.708 E.10154
N13674 G1 X168.292 Y119.264 E1.02063
N13675 G1 X168.34 Y119.264 E.00152
N13676 G1 X159.264 Y121.696 E.30212
N13677 G1 X159.264 Y121.751 E.00175
N13678 G1 X190.736 Y153.222 E1.43118
N13679 G1 X190.736 Y155.407 E.07029
N13680 G1 X159.264 Y163.84 E1.04769
N13681 G1 X159.264 Y167.806 E.12754
N13682 G1 X190.736 Y199.277 E1.43118
N13683 G1 X190.736 Y200.736 E.04689
N13684 G1 X189.748 Y200.736 E.03177
N13685 G1 X190.736 Y197.048 E.12275
N13686 G1 X190.736 Y195.42 E.05236
N13691 G1 X190.736 Y180.694 E.05236
N13692 G1 X159.264 Y189.126 E1.0477
N13693 G1 X159.264 Y188.673 E.01457
N13694 G1 X177.863 Y119.264 E2.31067
N13695 G1 X179.806 Y119.264 E.06251
N13696 G1 X190.736 Y130.194 E.49702
N13697 G1 X190.736 Y130.121 E.00234
N13698 G1 X159.264 Y138.554 E1.0477
N13699 G1 X159.264 Y140.182 E.05236
N13704 G1 X159.264 Y125.76 E.05236
N13705 G1 X161.005 Y119.264 E.21624
N13706 G1 X162.633 Y119.264 E.05236
N13711 G1 X169.434 Y119.264 E.05236
N13712 G1 X159.264 Y157.217 E1.26345
N13713 G1 X159.264 Y158.845 E.05236
N13718 G1 X159.264 Y172.269 E.05236
N13719 G1 X190.736 Y163.836 E1.0477
N13720 G1 X190.736 Y162.208 E.05236
N13725 G1 X190.736 Y146.979 E.05236
N13726 G1 X159.264 Y155.411 E1.0477
N13727 G1 X159.264 Y153.783 E.05236
N13732 G1 X190.736 Y187.763 E1.43118
N13733 G1 X190.736 Y189.123 E.04371
N13734 G1 X159.264 Y197.555 E1.0477
N13735 G1 X159.264 Y190.834 E.21612
N13736 G1 X169.166 Y200.736 E.45027
N13737 G1 X172.89 Y200.736 E.11976
N13738 G1 X190.736 Y134.135 E2.21718
N13739 G1 X190.736 Y132.507 E.05236
N13741 G1 X190.736 Y134.135 E-.61876
N13742 G1 X190.639 Y134.494 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN13792 G1 Z11.2
N13793 G1 E.8 F1800
N13794 ; FEATURE: Inner wall
N13795 ; LINE_WIDTH: 0.45
N13796 ; LAYER_HEIGHT: 0.2
N13797 G1 F4421.739
N13798 M204 S8000
N13799 G1 X158.916 Y201.084 E1.03439
N13800 G1 X158.916 Y118.916 E2.64221
N13801 G1 X191.084 Y118.916 E1.03439
N13802 G1 X191.084 Y201.024 E2.64028
N13803 ; COOLING_NODE: 0
N13804 M204 S10000
N13805 G1 X191.491 Y201.491 F60000
N13806 G1 F4421.739
N13807 M204 S8000
N13808 G1 X158.509 Y201.491 E1.06057
N13809 G1 X158.509 Y118.509 E2.66839
N13810 G1 X191.491 Y118.509 E1.06057
N13811 G1 X191.491 Y201.431 E2.66646
N13812 ; COOLING_NODE: 0
N13813 M204 S10000
N13814 G1 X191.898 Y201.898 F60000
N13815 G1 F4421.739
N13816 M204 S8000
N13817 G1 X158.102 Y201.898 E1.08675
N13818 G1 X158.102 Y118.102 E2.69457
N13819 G1 X191.898 Y118.102 E1.08675
N13820 G1 X191.898 Y201.838 E2.69264
N13821 ; COOLING_NODE: 0
N13822 M204 S10000
N13823 G1 X192.29 Y202.29 F60000
N13824 ; FEATURE: Outer wall
N13825 ; LINE_WIDTH: 0.42
N13826 M73 P74 R16
N13827 G1 F4773.528
N13828 M204 S5000
N13829 G1 X157.71 Y202.29 E1.03002
N13830 G1 X157.71 Y117.71 E2.51935
N13831 G1 X192.29 Y117.71 E1.03002
N13832 G1 X192.29 Y202.23 E2.51756
N13833 G1 E-.8 F1800
N13834 M204 S10000
N13835 G1 X190.736 Y197.698 Z11.6 F60000
N13836 G1 Z11.2
N13837 G1 E.8 F1800
N13838 ; FEATURE: Sparse infill
N13839 ; LINE_WIDTH: 0.45
N13840 G1 F4421.739
N13841 M204 S8000
N13842 G1 X179.399 Y200.736 E.37742
N13843 G1 X177.77 Y200.736 E.05236
N13844 M204 S10000
N13845 G1 X162.686 Y200.736 F60000
N13846 G1 F4421.739
N13847 M204 S8000
N13848 G1 X164.315 Y200.736 E.05236
N13849 G1 X186.145 Y119.264 E2.71223
N13850 G1 X190.736 Y119.264 E.14762
N13851 G1 X190.736 Y121.839 E.08278
N13852 G1 X159.264 Y130.271 E1.0477
N13853 G1 X159.264 Y133.064 E.08982
N13854 G1 X190.736 Y164.536 E1.43118
N13855 G1 X190.736 Y165.045 E.01639
N13856 G1 X181.172 Y200.736 E1.18815
N13857 G1 X180.88 Y200.736 E.00941
N13858 G1 X159.264 Y179.12 E.98298
N13859 G1 X159.264 Y180.844 E.05543
N13860 G1 X190.736 Y172.411 E1.0477
N13861 G1 X190.736 Y176.049 E.11699
N13862 G1 X159.264 Y144.578 E1.43118
N13863 G1 X159.264 Y147.129 E.08201
N13864 G1 X190.736 Y138.696 E1.04769
N13865 G1 X190.736 Y141.508 E.0904
N13866 G1 X168.492 Y119.264 E1.01153
N13867 G1 X168.886 Y119.264 E.01266
N13868 G1 X159.264 Y121.843 E.32031
N13869 G1 X159.264 Y121.551 E.00939
N13870 G1 X190.736 Y153.022 E1.43118
N13871 G1 X190.736 Y155.554 E.08143
N13872 G1 X159.264 Y163.986 E1.0477
N13873 G1 X159.264 Y167.606 E.1164
N13874 G1 X190.736 Y199.077 E1.43118
N13875 G1 X190.736 Y200.736 E.05332
N13876 G1 X189.601 Y200.736 E.03648
N13877 G1 X190.736 Y196.502 E.14094
N13878 G1 X190.736 Y194.874 E.05236
N13879 M204 S10000
N13880 G1 X190.736 Y182.469 F60000
N13881 G1 F4421.739
N13882 M204 S8000
N13883 G1 X190.736 Y180.84 E.05236
N13884 G1 X159.264 Y189.273 E1.04769
N13885 G1 X159.264 Y188.127 E.03685
N13886 G1 X177.716 Y119.264 E2.29248
N13887 G1 X180.006 Y119.264 E.07364
N13888 G1 X190.736 Y129.994 E.48792
N13889 G1 X190.736 Y130.267 E.0088
N13890 G1 X159.264 Y138.7 E1.0477
N13891 G1 X159.264 Y140.328 E.05236
N13892 M204 S10000
N13893 G1 X159.264 Y126.842 F60000
N13894 G1 F4421.739
N13895 M204 S8000
N13896 G1 X159.264 Y125.214 E.05236
N13897 G1 X160.859 Y119.264 E.19805
N13898 G1 X162.487 Y119.264 E.05236
N13899 M204 S10000
N13900 G1 X170.916 Y119.264 F60000
N13901 G1 F4421.739
N13902 M204 S8000
N13903 G1 X169.287 Y119.264 E.05236
N13904 G1 X159.264 Y156.67 E1.24526
N13905 G1 X159.264 Y158.299 E.05236
N13906 M204 S10000
N13907 G1 X159.264 Y174.044 F60000
N13908 G1 F4421.739
N13909 M204 S8000
N13910 G1 X159.264 Y172.415 E.05236
N13911 G1 X190.736 Y163.983 E1.0477
N13912 G1 X190.736 Y162.354 E.05236
N13913 M204 S10000
N13914 G1 X190.736 Y148.753 F60000
N13915 G1 F4421.739
N13916 M204 S8000
N13917 G1 X190.736 Y147.125 E.05236
N13918 G1 X159.264 Y155.558 E1.0477
N13919 M204 S10000
N13920 G1 X159.264 Y156.092 F60000
N13921 G1 F4421.739
N13922 M204 S8000
N13923 G1 X190.736 Y187.563 E1.43118
N13924 G1 X190.736 Y189.269 E.05485
N13925 G1 X159.264 Y197.702 E1.0477
N13926 G1 X159.264 Y190.634 E.22726
N13927 G1 X169.366 Y200.736 E.45937
N13928 G1 X172.744 Y200.736 E.10862
N13929 M73 P74 R15
N13930 G1 X190.736 Y133.589 E2.23537
N13931 G1 X190.736 Y131.96 E.05236
N13932 ; WIPE_START
N13933 G1 X190.736 Y133.589 E-.61876
N13934 G1 X190.639 Y133.948 E-.14124
N13935 ; WIPE_END
N13936 G1 E-.04 F1800
N13937 M204 S10000
N13938 G17
N13939 G3 Z11.6 I1.217 J0 P1  F60000
N13940 ; stop printing object, unique label id: 372
N13941 M625
N13942 ; object ids of layer 56 start: 372
N13943 M624 AQAAAAAAAAA=
N13944 ;======== H2D 20250527========
N13945 ; SKIPPABLE_START
N13946 ; SKIPTYPE: timelapse
N13947 M622.1 S1 ; for prev firware, default turned on
N13948 
N13949 M1002 judge_flag timelapse_record_flag
N13950 
N13951 M622 J1
N13952 M993 A2 B2 C2
N13953 M993 A0 B0 C0
N13954 
N13955 
N13956 
N13957 
N13958     M9711 M0 E1 X261 Y132 Z11.6 S11 C10 O0 T3000
N13959 
N13960 
N13961 
N13962 M993 A3 B3 C3
N13963 
N13964 M623
N13965 ; SKIPPABLE_END
N13966 
N13967 ; object ids of this layer56 end: 372
N13968 M625
N13969 ; CHANGE_LAYER
N13970 ; Z_HEIGHT: 11.4
N13971 ; LAYER_HEIGHT: 0.2
N13972 ;======== H2D 20250521========
N13973 ; layer num/total_layer_count: 57/75
N13974 ; update layer progress
N13975 M73 L57
N13976 M991 S0 P56 ;notify layer change
N13977 
N13978 
N13979 ; OBJECT_ID: 372
N13980 ; COOLING_NODE: 0
N13981 ; start printing object, unique label id: 372
N13982 M624 AQAAAAAAAAA=
N13983 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=11.300G1 Z11.300 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N13799 G1 X158.916 Y201.084 E1.03439
N13800 G1 X158.916 Y118.916 E2.64221
N13801 G1 X191.084 Y118.916 E1.03439
N13802 G1 X191.084 Y201.024 E2.64028
N13808 G1 X158.509 Y201.491 E1.06057
N13809 G1 X158.509 Y118.509 E2.66839
N13810 G1 X191.491 Y118.509 E1.06057
N13811 G1 X191.491 Y201.431 E2.66646
N13817 G1 X158.102 Y201.898 E1.08675
N13818 G1 X158.102 Y118.102 E2.69457
N13819 G1 X191.898 Y118.102 E1.08675
N13820 G1 X191.898 Y201.838 E2.69264
N13829 G1 X157.71 Y202.29 E1.03002
N13830 G1 X157.71 Y117.71 E2.51935
N13831 G1 X192.29 Y117.71 E1.03002
N13832 G1 X192.29 Y202.23 E2.51756
N13842 G1 X179.399 Y200.736 E.37742
N13843 G1 X177.77 Y200.736 E.05236
N13848 G1 X164.315 Y200.736 E.05236
N13849 G1 X186.145 Y119.264 E2.71223
N13850 G1 X190.736 Y119.264 E.14762
N13851 G1 X190.736 Y121.839 E.08278
N13852 G1 X159.264 Y130.271 E1.0477
N13853 G1 X159.264 Y133.064 E.08982
N13854 G1 X190.736 Y164.536 E1.43118
N13855 G1 X190.736 Y165.045 E.01639
N13856 G1 X181.172 Y200.736 E1.18815
N13857 G1 X180.88 Y200.736 E.00941
N13858 G1 X159.264 Y179.12 E.98298
N13859 G1 X159.264 Y180.844 E.05543
N13860 G1 X190.736 Y172.411 E1.0477
N13861 G1 X190.736 Y176.049 E.11699
N13862 G1 X159.264 Y144.578 E1.43118
N13863 G1 X159.264 Y147.129 E.08201
N13864 G1 X190.736 Y138.696 E1.04769
N13865 G1 X190.736 Y141.508 E.0904
N13866 G1 X168.492 Y119.264 E1.01153
N13867 G1 X168.886 Y119.264 E.01266
N13868 G1 X159.264 Y121.843 E.32031
N13869 G1 X159.264 Y121.551 E.00939
N13870 G1 X190.736 Y153.022 E1.43118
N13871 G1 X190.736 Y155.554 E.08143
N13872 G1 X159.264 Y163.986 E1.0477
N13873 G1 X159.264 Y167.606 E.1164
N13874 G1 X190.736 Y199.077 E1.43118
N13875 G1 X190.736 Y200.736 E.05332
N13876 G1 X189.601 Y200.736 E.03648
N13877 G1 X190.736 Y196.502 E.14094
N13878 G1 X190.736 Y194.874 E.05236
N13883 G1 X190.736 Y180.84 E.05236
N13884 G1 X159.264 Y189.273 E1.04769
N13885 G1 X159.264 Y188.127 E.03685
N13886 G1 X177.716 Y119.264 E2.29248
N13887 G1 X180.006 Y119.264 E.07364
N13888 G1 X190.736 Y129.994 E.48792
N13889 G1 X190.736 Y130.267 E.0088
N13890 G1 X159.264 Y138.7 E1.0477
N13891 G1 X159.264 Y140.328 E.05236
N13896 G1 X159.264 Y125.214 E.05236
N13897 G1 X160.859 Y119.264 E.19805
N13898 G1 X162.487 Y119.264 E.05236
N13903 G1 X169.287 Y119.264 E.05236
N13904 G1 X159.264 Y156.67 E1.24526
N13905 G1 X159.264 Y158.299 E.05236
N13910 G1 X159.264 Y172.415 E.05236
N13911 G1 X190.736 Y163.983 E1.0477
N13912 G1 X190.736 Y162.354 E.05236
N13917 G1 X190.736 Y147.125 E.05236
N13918 G1 X159.264 Y155.558 E1.0477
N13923 G1 X190.736 Y187.563 E1.43118
N13924 G1 X190.736 Y189.269 E.05485
N13925 G1 X159.264 Y197.702 E1.0477
N13926 G1 X159.264 Y190.634 E.22726
N13927 G1 X169.366 Y200.736 E.45937
N13928 G1 X172.744 Y200.736 E.10862
N13930 G1 X190.736 Y133.589 E2.23537
N13931 G1 X190.736 Y131.96 E.05236
N13933 G1 X190.736 Y133.589 E-.61876
N13934 G1 X190.639 Y133.948 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN13984 G1 Z11.4
N13985 G1 E.8 F1800
N13986 ; FEATURE: Inner wall
N13987 ; LINE_WIDTH: 0.45
N13988 ; LAYER_HEIGHT: 0.2
N13989 G1 F4421.739
N13990 M204 S8000
N13991 G1 X158.916 Y201.084 E1.03439
N13992 G1 X158.916 Y118.916 E2.64221
N13993 G1 X191.084 Y118.916 E1.03439
N13994 G1 X191.084 Y201.024 E2.64028
N13995 ; COOLING_NODE: 0
N13996 M204 S10000
N13997 G1 X191.491 Y201.491 F60000
N13998 G1 F4421.739
N13999 M204 S8000
N14000 G1 X158.509 Y201.491 E1.06057
N14001 G1 X158.509 Y118.509 E2.66839
N14002 G1 X191.491 Y118.509 E1.06057
N14003 G1 X191.491 Y201.431 E2.66646
N14004 ; COOLING_NODE: 0
N14005 M204 S10000
N14006 G1 X191.898 Y201.898 F60000
N14007 G1 F4421.739
N14008 M204 S8000
N14009 G1 X158.102 Y201.898 E1.08675
N14010 G1 X158.102 Y118.102 E2.69457
N14011 G1 X191.898 Y118.102 E1.08675
N14012 G1 X191.898 Y201.838 E2.69264
N14013 ; COOLING_NODE: 0
N14014 M204 S10000
N14015 G1 X192.29 Y202.29 F60000
N14016 ; FEATURE: Outer wall
N14017 ; LINE_WIDTH: 0.42
N14018 G1 F4773.528
N14019 M204 S5000
N14020 G1 X157.71 Y202.29 E1.03002
N14021 G1 X157.71 Y117.71 E2.51935
N14022 G1 X192.29 Y117.71 E1.03002
N14023 G1 X192.29 Y202.23 E2.51756
N14024 G1 E-.8 F1800
N14025 M204 S10000
N14026 G1 X187.826 Y200.736 Z11.8 F60000
N14027 G1 Z11.4
N14028 G1 E.8 F1800
N14029 ; FEATURE: Sparse infill
N14030 ; LINE_WIDTH: 0.45
N14031 G1 F4421.739
N14032 M204 S8000
N14033 G1 X189.455 Y200.736 E.05236
N14034 G1 X190.736 Y195.956 E.15913
N14035 G1 X190.736 Y194.327 E.05236
N14036 M204 S10000
N14037 G1 X190.736 Y182.615 F60000
N14038 G1 F4421.739
N14039 M204 S8000
N14040 G1 X190.736 Y180.987 E.05236
N14041 G1 X159.264 Y189.419 E1.0477
N14042 G1 X159.264 Y190.434 E.03264
N14043 G1 X169.566 Y200.736 E.46846
N14044 G1 X172.597 Y200.736 E.09748
N14045 G1 X190.736 Y133.042 E2.25356
N14046 G1 X190.736 Y131.414 E.05236
N14047 M204 S10000
N14048 G1 X190.736 Y145.643 F60000
N14049 G1 F4421.739
N14050 M204 S8000
N14051 G1 X190.736 Y147.271 E.05236
N14052 G1 X159.264 Y155.704 E1.0477
N14053 M204 S10000
N14054 G1 X190.736 Y162.501 F60000
N14055 G1 F4421.739
N14056 M204 S8000
N14057 G1 X190.736 Y164.129 E.05236
N14058 G1 X159.264 Y172.562 E1.0477
N14059 G1 X159.264 Y174.19 E.05236
N14060 M204 S10000
N14061 G1 X159.264 Y189.209 F60000
N14062 G1 F4421.739
N14063 M204 S8000
N14064 G1 X159.264 Y187.58 E.05236
N14065 G1 X177.57 Y119.264 E2.27429
N14066 G1 X180.206 Y119.264 E.08478
N14067 G1 X190.736 Y129.794 E.47883
N14068 G1 X190.736 Y130.414 E.01994
N14069 G1 X159.264 Y138.847 E1.0477
N14070 G1 X159.264 Y137.218 E.05236
N14071 M204 S10000
N14072 G1 X159.264 Y126.295 F60000
N14073 G1 F4421.739
N14074 M204 S8000
N14075 G1 X159.264 Y124.667 E.05236
N14076 G1 X160.712 Y119.264 E.17986
N14077 G1 X162.34 Y119.264 E.05236
N14078 M204 S10000
N14079 G1 X168.692 Y119.264 F60000
N14080 G1 F4421.739
N14081 M204 S8000
N14082 G1 X190.736 Y141.308 E1.00244
N14083 M73 P75 R15
N14084 G1 X190.736 Y138.843 E.07927
N14085 G1 X159.264 Y147.275 E1.0477
N14086 G1 X159.264 Y144.378 E.09315
N14087 G1 X190.736 Y175.849 E1.43118
N14088 G1 X190.736 Y172.558 E.10585
N14089 G1 X159.264 Y180.99 E1.0477
N14090 G1 X159.264 Y178.92 E.06657
N14091 G1 X181.08 Y200.736 E.99207
N14092 M204 S10000
N14093 G1 X181.026 Y200.736 F60000
N14094 G1 F4421.739
N14095 M204 S8000
N14096 G1 X190.736 Y164.499 E1.20634
N14097 G1 X190.736 Y164.336 E.00525
N14098 G1 X159.264 Y132.864 E1.43118
N14099 G1 X159.264 Y130.418 E.07868
N14100 G1 X190.736 Y121.985 E1.0477
N14101 G1 X190.736 Y119.264 E.08749
N14102 G1 X185.998 Y119.264 E.15233
N14103 G1 X164.168 Y200.736 E2.71223
N14104 G1 X159.264 Y200.736 E.15769
N14105 G1 X159.264 Y197.848 E.09285
N14106 G1 X190.736 Y189.415 E1.0477
N14107 G1 X190.736 Y187.363 E.06598
N14108 G1 X159.264 Y155.892 E1.43118
N14109 G1 X159.264 Y156.124 E.00744
N14110 G1 X169.141 Y119.264 E1.22707
N14111 G1 X169.432 Y119.264 E.00937
N14112 G1 X159.264 Y121.989 E.3385
N14113 G1 X159.264 Y121.351 E.02053
N14114 G1 X190.736 Y152.822 E1.43118
N14115 G1 X190.736 Y155.7 E.09257
N14116 G1 X159.264 Y164.133 E1.0477
N14117 G1 X159.264 Y167.406 E.10526
N14118 G1 X190.736 Y198.877 E1.43118
N14119 G1 X190.736 Y197.844 E.03322
N14120 G1 X179.945 Y200.736 E.35923
N14121 G1 X178.317 Y200.736 E.05236
N14122 ; WIPE_START
N14123 G1 X179.945 Y200.736 E-.61876
N14124 G1 X180.304 Y200.639 E-.14124
N14125 ; WIPE_END
N14126 G1 E-.04 F1800
N14127 M204 S10000
N14128 G17
N14129 G3 Z11.8 I1.217 J0 P1  F60000
N14130 ; stop printing object, unique label id: 372
N14131 M625
N14132 ; object ids of layer 57 start: 372
N14133 M624 AQAAAAAAAAA=
N14134 ;======== H2D 20250527========
N14135 ; SKIPPABLE_START
N14136 ; SKIPTYPE: timelapse
N14137 M622.1 S1 ; for prev firware, default turned on
N14138 
N14139 M1002 judge_flag timelapse_record_flag
N14140 
N14141 M622 J1
N14142 M993 A2 B2 C2
N14143 M993 A0 B0 C0
N14144 
N14145 
N14146 
N14147 
N14148     M9711 M0 E1 X261 Y132 Z11.8 S11 C10 O0 T3000
N14149 
N14150 
N14151 
N14152 M993 A3 B3 C3
N14153 
N14154 M623
N14155 ; SKIPPABLE_END
N14156 
N14157 ; object ids of this layer57 end: 372
N14158 M625
N14159 ; CHANGE_LAYER
N14160 ; Z_HEIGHT: 11.6
N14161 ; LAYER_HEIGHT: 0.200001
N14162 ;======== H2D 20250521========
N14163 ; layer num/total_layer_count: 58/75
N14164 ; update layer progress
N14165 M73 L58
N14166 M991 S0 P57 ;notify layer change
N14167 
N14168 
N14169 ; OBJECT_ID: 372
N14170 ; COOLING_NODE: 0
N14171 ; start printing object, unique label id: 372
N14172 M624 AQAAAAAAAAA=
N14173 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=11.500G1 Z11.500 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N13991 G1 X158.916 Y201.084 E1.03439
N13992 G1 X158.916 Y118.916 E2.64221
N13993 G1 X191.084 Y118.916 E1.03439
N13994 G1 X191.084 Y201.024 E2.64028
N14000 G1 X158.509 Y201.491 E1.06057
N14001 G1 X158.509 Y118.509 E2.66839
N14002 G1 X191.491 Y118.509 E1.06057
N14003 G1 X191.491 Y201.431 E2.66646
N14009 G1 X158.102 Y201.898 E1.08675
N14010 G1 X158.102 Y118.102 E2.69457
N14011 G1 X191.898 Y118.102 E1.08675
N14012 G1 X191.898 Y201.838 E2.69264
N14020 G1 X157.71 Y202.29 E1.03002
N14021 G1 X157.71 Y117.71 E2.51935
N14022 G1 X192.29 Y117.71 E1.03002
N14023 G1 X192.29 Y202.23 E2.51756
N14033 G1 X189.455 Y200.736 E.05236
N14034 G1 X190.736 Y195.956 E.15913
N14035 G1 X190.736 Y194.327 E.05236
N14040 G1 X190.736 Y180.987 E.05236
N14041 G1 X159.264 Y189.419 E1.0477
N14042 G1 X159.264 Y190.434 E.03264
N14043 G1 X169.566 Y200.736 E.46846
N14044 G1 X172.597 Y200.736 E.09748
N14045 G1 X190.736 Y133.042 E2.25356
N14046 G1 X190.736 Y131.414 E.05236
N14051 G1 X190.736 Y147.271 E.05236
N14052 G1 X159.264 Y155.704 E1.0477
N14057 G1 X190.736 Y164.129 E.05236
N14058 G1 X159.264 Y172.562 E1.0477
N14059 G1 X159.264 Y174.19 E.05236
N14064 G1 X159.264 Y187.58 E.05236
N14065 G1 X177.57 Y119.264 E2.27429
N14066 G1 X180.206 Y119.264 E.08478
N14067 G1 X190.736 Y129.794 E.47883
N14068 G1 X190.736 Y130.414 E.01994
N14069 G1 X159.264 Y138.847 E1.0477
N14070 G1 X159.264 Y137.218 E.05236
N14075 G1 X159.264 Y124.667 E.05236
N14076 G1 X160.712 Y119.264 E.17986
N14077 G1 X162.34 Y119.264 E.05236
N14082 G1 X190.736 Y141.308 E1.00244
N14084 G1 X190.736 Y138.843 E.07927
N14085 G1 X159.264 Y147.275 E1.0477
N14086 G1 X159.264 Y144.378 E.09315
N14087 G1 X190.736 Y175.849 E1.43118
N14088 G1 X190.736 Y172.558 E.10585
N14089 G1 X159.264 Y180.99 E1.0477
N14090 G1 X159.264 Y178.92 E.06657
N14091 G1 X181.08 Y200.736 E.99207
N14096 G1 X190.736 Y164.499 E1.20634
N14097 G1 X190.736 Y164.336 E.00525
N14098 G1 X159.264 Y132.864 E1.43118
N14099 G1 X159.264 Y130.418 E.07868
N14100 G1 X190.736 Y121.985 E1.0477
N14101 G1 X190.736 Y119.264 E.08749
N14102 G1 X185.998 Y119.264 E.15233
N14103 G1 X164.168 Y200.736 E2.71223
N14104 G1 X159.264 Y200.736 E.15769
N14105 G1 X159.264 Y197.848 E.09285
N14106 G1 X190.736 Y189.415 E1.0477
N14107 G1 X190.736 Y187.363 E.06598
N14108 G1 X159.264 Y155.892 E1.43118
N14109 G1 X159.264 Y156.124 E.00744
N14110 G1 X169.141 Y119.264 E1.22707
N14111 G1 X169.432 Y119.264 E.00937
N14112 G1 X159.264 Y121.989 E.3385
N14113 G1 X159.264 Y121.351 E.02053
N14114 G1 X190.736 Y152.822 E1.43118
N14115 G1 X190.736 Y155.7 E.09257
N14116 G1 X159.264 Y164.133 E1.0477
N14117 G1 X159.264 Y167.406 E.10526
N14118 G1 X190.736 Y198.877 E1.43118
N14119 G1 X190.736 Y197.844 E.03322
N14120 G1 X179.945 Y200.736 E.35923
N14121 G1 X178.317 Y200.736 E.05236
N14123 G1 X179.945 Y200.736 E-.61876
N14124 G1 X180.304 Y200.639 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN14174 G1 Z11.6
N14175 G1 E.8 F1800
N14176 ; FEATURE: Inner wall
N14177 ; LINE_WIDTH: 0.45
N14178 ; LAYER_HEIGHT: 0.2
N14179 G1 F4421.739
N14180 M204 S8000
N14181 G1 X158.916 Y201.084 E1.03439
N14182 G1 X158.916 Y118.916 E2.64221
N14183 G1 X191.084 Y118.916 E1.03439
N14184 G1 X191.084 Y201.024 E2.64028
N14185 ; COOLING_NODE: 0
N14186 M204 S10000
N14187 G1 X191.491 Y201.491 F60000
N14188 G1 F4421.739
N14189 M204 S8000
N14190 G1 X158.509 Y201.491 E1.06057
N14191 G1 X158.509 Y118.509 E2.66839
N14192 G1 X191.491 Y118.509 E1.06057
N14193 G1 X191.491 Y201.431 E2.66646
N14194 ; COOLING_NODE: 0
N14195 M204 S10000
N14196 G1 X191.898 Y201.898 F60000
N14197 G1 F4421.739
N14198 M204 S8000
N14199 G1 X158.102 Y201.898 E1.08675
N14200 G1 X158.102 Y118.102 E2.69457
N14201 G1 X191.898 Y118.102 E1.08675
N14202 G1 X191.898 Y201.838 E2.69264
N14203 ; COOLING_NODE: 0
N14204 M204 S10000
N14205 G1 X192.29 Y202.29 F60000
N14206 ; FEATURE: Outer wall
N14207 ; LINE_WIDTH: 0.42
N14208 G1 F4773.528
N14209 M204 S5000
N14210 G1 X157.71 Y202.29 E1.03002
N14211 G1 X157.71 Y117.71 E2.51935
N14212 G1 X192.29 Y117.71 E1.03002
N14213 G1 X192.29 Y202.23 E2.51756
N14214 G1 E-.8 F1800
N14215 M204 S10000
N14216 G1 X187.68 Y200.736 Z12 F60000
N14217 G1 Z11.6
N14218 G1 E.8 F1800
N14219 ; FEATURE: Sparse infill
N14220 ; LINE_WIDTH: 0.45
N14221 G1 F4421.739
N14222 M204 S8000
N14223 G1 X189.308 Y200.736 E.05236
N14224 G1 X190.736 Y195.409 E.17732
N14225 G1 X190.736 Y193.781 E.05236
N14226 M204 S10000
N14227 G1 X190.736 Y182.761 F60000
N14228 G1 F4421.739
N14229 M204 S8000
N14230 G1 X190.736 Y181.133 E.05236
N14231 G1 X159.264 Y189.566 E1.0477
N14232 G1 X159.264 Y190.234 E.0215
N14233 G1 X169.766 Y200.736 E.47756
N14234 G1 X172.451 Y200.736 E.08634
N14235 G1 X190.736 Y132.496 E2.27175
N14236 G1 X190.736 Y130.867 E.05236
N14237 M204 S10000
N14238 G1 X190.736 Y145.79 F60000
N14239 G1 F4421.739
N14240 M204 S8000
N14241 G1 X190.736 Y147.418 E.05236
N14242 G1 X159.264 Y155.851 E1.0477
N14243 G1 X159.264 Y157.479 E.05236
N14244 M204 S10000
N14245 G1 X190.736 Y162.324 F60000
N14246 G1 F4421.739
N14247 M204 S8000
N14248 G1 X190.736 Y163.952 E.05236
N14249 G1 X180.88 Y200.736 E1.22453
N14250 G1 X180.491 Y200.736 E.01248
N14251 G1 X190.736 Y197.991 E.34103
N14252 G1 X190.736 Y198.677 E.02208
N14253 G1 X159.264 Y167.206 E1.43118
N14254 G1 X159.264 Y164.279 E.09412
N14255 G1 X190.736 Y155.847 E1.0477
N14256 G1 X190.736 Y152.622 E.10371
N14257 G1 X159.264 Y121.151 E1.43118
N14258 G1 X159.264 Y122.135 E.03167
N14259 G1 X169.979 Y119.264 E.35669
N14260 G1 X171.607 Y119.264 E.05236
N14261 M204 S10000
N14262 G1 X162.194 Y119.264 F60000
N14263 G1 F4421.739
N14264 M204 S8000
N14265 G1 X160.566 Y119.264 E.05236
N14266 G1 X159.264 Y124.121 E.16167
N14267 G1 X159.264 Y125.749 E.05236
N14268 M204 S10000
N14269 G1 X159.264 Y137.365 F60000
N14270 G1 F4421.739
N14271 M204 S8000
N14272 G1 X159.264 Y138.993 E.05236
N14273 G1 X190.736 Y130.56 E1.0477
N14274 G1 X190.736 Y129.594 E.03108
N14275 G1 X180.406 Y119.264 E.46973
N14276 G1 X177.423 Y119.264 E.09592
N14277 G1 X159.264 Y187.034 E2.2561
N14278 G1 X159.264 Y188.662 E.05236
N14279 M204 S10000
N14280 G1 X159.264 Y174.336 F60000
N14281 G1 F4421.739
N14282 M204 S8000
N14283 G1 X159.264 Y172.708 E.05236
N14284 G1 X190.736 Y164.275 E1.0477
N14285 G1 X190.736 Y164.136 E.0045
N14286 G1 X159.264 Y132.664 E1.43118
N14287 G1 X159.264 Y130.564 E.06754
N14288 G1 X190.736 Y122.131 E1.0477
N14289 G1 X190.736 Y119.264 E.09219
N14290 G1 X185.852 Y119.264 E.15703
N14291 G1 X164.022 Y200.736 E2.71223
N14292 G1 X159.264 Y200.736 E.15298
N14293 G1 X159.264 Y197.994 E.08814
N14294 G1 X190.736 Y189.562 E1.0477
N14295 G1 X190.736 Y187.163 E.07712
N14296 G1 X159.264 Y155.692 E1.43118
N14297 G1 X159.264 Y155.577 E.0037
N14298 G1 X168.994 Y119.264 E1.20888
N14299 M204 S10000
N14300 G1 X168.892 Y119.264 F60000
N14301 G1 F4421.739
N14302 M204 S8000
N14303 G1 X190.736 Y141.108 E.99334
N14304 G1 X190.736 Y138.989 E.06813
N14305 G1 X159.264 Y147.422 E1.0477
N14306 G1 X159.264 Y144.178 E.10429
N14307 G1 X190.736 Y175.649 E1.43118
N14308 G1 X190.736 Y172.704 E.09471
N14309 G1 X159.264 Y181.137 E1.0477
N14310 G1 X159.264 Y178.72 E.07771
N14311 G1 X181.28 Y200.736 E1.00117
N14312 ; WIPE_START
N14313 G1 X179.866 Y199.321 E-.76
N14314 ; WIPE_END
N14315 G1 E-.04 F1800
N14316 M204 S10000
N14317 G17
N14318 G3 Z12 I1.217 J0 P1  F60000
N14319 ; stop printing object, unique label id: 372
N14320 M625
N14321 ; object ids of layer 58 start: 372
N14322 M624 AQAAAAAAAAA=
N14323 ;======== H2D 20250527========
N14324 ; SKIPPABLE_START
N14325 ; SKIPTYPE: timelapse
N14326 M622.1 S1 ; for prev firware, default turned on
N14327 
N14328 M1002 judge_flag timelapse_record_flag
N14329 
N14330 M622 J1
N14331 M993 A2 B2 C2
N14332 M993 A0 B0 C0
N14333 
N14334 
N14335 
N14336 
N14337     M9711 M0 E1 X261 Y132 Z12 S11 C10 O0 T3000
N14338 
N14339 
N14340 
N14341 M993 A3 B3 C3
N14342 
N14343 M623
N14344 ; SKIPPABLE_END
N14345 
N14346 ; object ids of this layer58 end: 372
N14347 M625
N14348 ; CHANGE_LAYER
N14349 ; Z_HEIGHT: 11.8
N14350 ; LAYER_HEIGHT: 0.2
N14351 ;======== H2D 20250521========
N14352 ; layer num/total_layer_count: 59/75
N14353 ; update layer progress
N14354 M73 L59
N14355 M991 S0 P58 ;notify layer change
N14356 
N14357 
N14358 ; OBJECT_ID: 372
N14359 ; COOLING_NODE: 0
N14360 ; start printing object, unique label id: 372
N14361 M624 AQAAAAAAAAA=
N14362 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=11.700G1 Z11.700 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N14181 G1 X158.916 Y201.084 E1.03439
N14182 G1 X158.916 Y118.916 E2.64221
N14183 G1 X191.084 Y118.916 E1.03439
N14184 G1 X191.084 Y201.024 E2.64028
N14190 G1 X158.509 Y201.491 E1.06057
N14191 G1 X158.509 Y118.509 E2.66839
N14192 G1 X191.491 Y118.509 E1.06057
N14193 G1 X191.491 Y201.431 E2.66646
N14199 G1 X158.102 Y201.898 E1.08675
N14200 G1 X158.102 Y118.102 E2.69457
N14201 G1 X191.898 Y118.102 E1.08675
N14202 G1 X191.898 Y201.838 E2.69264
N14210 G1 X157.71 Y202.29 E1.03002
N14211 G1 X157.71 Y117.71 E2.51935
N14212 G1 X192.29 Y117.71 E1.03002
N14213 G1 X192.29 Y202.23 E2.51756
N14223 G1 X189.308 Y200.736 E.05236
N14224 G1 X190.736 Y195.409 E.17732
N14225 G1 X190.736 Y193.781 E.05236
N14230 G1 X190.736 Y181.133 E.05236
N14231 G1 X159.264 Y189.566 E1.0477
N14232 G1 X159.264 Y190.234 E.0215
N14233 G1 X169.766 Y200.736 E.47756
N14234 G1 X172.451 Y200.736 E.08634
N14235 G1 X190.736 Y132.496 E2.27175
N14236 G1 X190.736 Y130.867 E.05236
N14241 G1 X190.736 Y147.418 E.05236
N14242 G1 X159.264 Y155.851 E1.0477
N14243 G1 X159.264 Y157.479 E.05236
N14248 G1 X190.736 Y163.952 E.05236
N14249 G1 X180.88 Y200.736 E1.22453
N14250 G1 X180.491 Y200.736 E.01248
N14251 G1 X190.736 Y197.991 E.34103
N14252 G1 X190.736 Y198.677 E.02208
N14253 G1 X159.264 Y167.206 E1.43118
N14254 G1 X159.264 Y164.279 E.09412
N14255 G1 X190.736 Y155.847 E1.0477
N14256 G1 X190.736 Y152.622 E.10371
N14257 G1 X159.264 Y121.151 E1.43118
N14258 G1 X159.264 Y122.135 E.03167
N14259 G1 X169.979 Y119.264 E.35669
N14260 G1 X171.607 Y119.264 E.05236
N14265 G1 X160.566 Y119.264 E.05236
N14266 G1 X159.264 Y124.121 E.16167
N14267 G1 X159.264 Y125.749 E.05236
N14272 G1 X159.264 Y138.993 E.05236
N14273 G1 X190.736 Y130.56 E1.0477
N14274 G1 X190.736 Y129.594 E.03108
N14275 G1 X180.406 Y119.264 E.46973
N14276 G1 X177.423 Y119.264 E.09592
N14277 G1 X159.264 Y187.034 E2.2561
N14278 G1 X159.264 Y188.662 E.05236
N14283 G1 X159.264 Y172.708 E.05236
N14284 G1 X190.736 Y164.275 E1.0477
N14285 G1 X190.736 Y164.136 E.0045
N14286 G1 X159.264 Y132.664 E1.43118
N14287 G1 X159.264 Y130.564 E.06754
N14288 G1 X190.736 Y122.131 E1.0477
N14289 G1 X190.736 Y119.264 E.09219
N14290 G1 X185.852 Y119.264 E.15703
N14291 G1 X164.022 Y200.736 E2.71223
N14292 G1 X159.264 Y200.736 E.15298
N14293 G1 X159.264 Y197.994 E.08814
N14294 G1 X190.736 Y189.562 E1.0477
N14295 G1 X190.736 Y187.163 E.07712
N14296 G1 X159.264 Y155.692 E1.43118
N14297 G1 X159.264 Y155.577 E.0037
N14298 G1 X168.994 Y119.264 E1.20888
N14303 G1 X190.736 Y141.108 E.99334
N14304 G1 X190.736 Y138.989 E.06813
N14305 G1 X159.264 Y147.422 E1.0477
N14306 G1 X159.264 Y144.178 E.10429
N14307 G1 X190.736 Y175.649 E1.43118
N14308 G1 X190.736 Y172.704 E.09471
N14309 G1 X159.264 Y181.137 E1.0477
N14310 G1 X159.264 Y178.72 E.07771
N14311 G1 X181.28 Y200.736 E1.00117
N14313 G1 X179.866 Y199.321 E-.76
T0 ;TOOL_CHANGE:0 ; Revert to base toolN14363 G1 Z11.8
N14364 G1 E.8 F1800
N14365 ; FEATURE: Inner wall
N14366 ; LINE_WIDTH: 0.45
N14367 ; LAYER_HEIGHT: 0.2
N14368 G1 F4421.739
N14369 M204 S8000
N14370 G1 X158.916 Y201.084 E1.03439
N14371 G1 X158.916 Y118.916 E2.64221
N14372 G1 X191.084 Y118.916 E1.03439
N14373 G1 X191.084 Y201.024 E2.64028
N14374 ; COOLING_NODE: 0
N14375 M204 S10000
N14376 G1 X191.491 Y201.491 F60000
N14377 M73 P76 R15
N14378 G1 F4421.739
N14379 M204 S8000
N14380 G1 X158.509 Y201.491 E1.06057
N14381 M73 P76 R14
N14382 G1 X158.509 Y118.509 E2.66839
N14383 G1 X191.491 Y118.509 E1.06057
N14384 G1 X191.491 Y201.431 E2.66646
N14385 ; COOLING_NODE: 0
N14386 M204 S10000
N14387 G1 X191.898 Y201.898 F60000
N14388 G1 F4421.739
N14389 M204 S8000
N14390 G1 X158.102 Y201.898 E1.08675
N14391 G1 X158.102 Y118.102 E2.69457
N14392 G1 X191.898 Y118.102 E1.08675
N14393 G1 X191.898 Y201.838 E2.69264
N14394 ; COOLING_NODE: 0
N14395 M204 S10000
N14396 G1 X192.29 Y202.29 F60000
N14397 ; FEATURE: Outer wall
N14398 ; LINE_WIDTH: 0.42
N14399 G1 F4773.528
N14400 M204 S5000
N14401 G1 X157.71 Y202.29 E1.03002
N14402 G1 X157.71 Y117.71 E2.51935
N14403 G1 X192.29 Y117.71 E1.03002
N14404 G1 X192.29 Y202.23 E2.51756
N14405 G1 E-.8 F1800
N14406 M204 S10000
N14407 G1 X187.534 Y200.736 Z12.2 F60000
N14408 G1 Z11.8
N14409 G1 E.8 F1800
N14410 ; FEATURE: Sparse infill
N14411 ; LINE_WIDTH: 0.45
N14412 G1 F4421.739
N14413 M204 S8000
N14414 G1 X189.162 Y200.736 E.05236
N14415 G1 X190.736 Y194.863 E.19551
N14416 G1 X190.736 Y193.234 E.05236
N14417 M204 S10000
N14418 G1 X181.48 Y200.736 F60000
N14419 G1 F4421.739
N14420 M204 S8000
N14421 G1 X159.264 Y178.52 E1.01026
N14422 G1 X159.264 Y181.283 E.08885
N14423 G1 X190.736 Y172.851 E1.0477
N14424 G1 X190.736 Y175.449 E.08357
N14425 G1 X159.264 Y143.978 E1.43118
N14426 G1 X159.264 Y147.568 E.11543
N14427 G1 X190.736 Y139.135 E1.0477
N14428 G1 X190.736 Y140.908 E.05699
N14429 G1 X169.092 Y119.264 E.98425
N14430 G1 X168.848 Y119.264 E.00785
N14431 G1 X159.264 Y155.031 E1.19069
N14432 G1 X159.264 Y155.492 E.01484
N14433 G1 X190.736 Y186.963 E1.43118
N14434 G1 X190.736 Y189.708 E.08826
N14435 G1 X159.264 Y198.141 E1.0477
N14436 G1 X159.264 Y200.736 E.08343
N14437 G1 X163.876 Y200.736 E.14828
N14438 G1 X185.706 Y119.264 E2.71223
N14439 G1 X187.334 Y119.264 E.05236
N14440 M204 S10000
N14441 G1 X190.736 Y179.651 F60000
N14442 G1 F4421.739
N14443 M204 S8000
N14444 G1 X190.736 Y181.279 E.05236
N14445 G1 X159.264 Y189.712 E1.0477
N14446 G1 X159.264 Y190.034 E.01036
N14447 G1 X169.966 Y200.736 E.48665
N14448 G1 X172.304 Y200.736 E.0752
N14449 G1 X190.736 Y131.949 E2.28994
N14450 G1 X190.736 Y130.707 E.03996
N14451 G1 X159.264 Y139.139 E1.0477
N14452 G1 X159.264 Y137.511 E.05236
N14453 M204 S10000
N14454 G1 X159.264 Y125.203 F60000
N14455 G1 F4421.739
N14456 M204 S8000
N14457 G1 X159.264 Y123.574 E.05236
N14458 G1 X160.419 Y119.264 E.14348
N14459 G1 X162.048 Y119.264 E.05236
N14460 M204 S10000
N14461 G1 X172.153 Y119.264 F60000
N14462 G1 F4421.739
N14463 M204 S8000
N14464 G1 X170.525 Y119.264 E.05236
N14465 G1 X159.264 Y122.282 E.37488
N14466 G1 X159.264 Y120.951 E.04281
N14467 G1 X190.736 Y152.422 E1.43118
N14468 G1 X190.736 Y155.993 E.11485
N14469 G1 X159.264 Y164.426 E1.0477
N14470 G1 X159.264 Y167.006 E.08298
N14471 G1 X190.736 Y198.477 E1.43118
N14472 G1 X190.736 Y198.137 E.01094
N14473 G1 X181.038 Y200.736 E.32284
N14474 G1 X180.733 Y200.736 E.0098
N14475 G1 X190.736 Y163.406 E1.24273
N14476 G1 X190.736 Y161.778 E.05236
N14477 M204 S10000
N14478 G1 X190.736 Y145.936 F60000
N14479 G1 F4421.739
N14480 M204 S8000
N14481 G1 X190.736 Y147.564 E.05236
N14482 G1 X159.264 Y155.997 E1.04769
N14483 G1 X159.264 Y157.625 E.05236
N14484 M204 S10000
N14485 G1 X159.264 Y171.226 F60000
N14486 G1 F4421.739
N14487 M204 S8000
N14488 G1 X159.264 Y172.855 E.05236
N14489 G1 X190.736 Y164.422 E1.04769
N14490 M204 S10000
N14491 G1 X190.736 Y163.936 F60000
N14492 G1 F4421.739
N14493 M204 S8000
N14494 G1 X159.264 Y132.464 E1.43118
N14495 G1 X159.264 Y130.711 E.0564
N14496 G1 X190.736 Y122.278 E1.0477
N14497 G1 X190.736 Y129.394 E.22882
N14498 G1 X180.606 Y119.264 E.46064
N14499 G1 X177.277 Y119.264 E.10706
N14500 G1 X159.264 Y186.488 E2.23791
N14501 G1 X159.264 Y188.116 E.05236
N14502 ; WIPE_START
N14503 G1 X159.264 Y186.488 E-.61876
N14504 G1 X159.361 Y186.129 E-.14124
N14505 ; WIPE_END
N14506 G1 E-.04 F1800
N14507 M204 S10000
N14508 G17
N14509 G3 Z12.2 I1.217 J0 P1  F60000
N14510 ; stop printing object, unique label id: 372
N14511 M625
N14512 ; object ids of layer 59 start: 372
N14513 M624 AQAAAAAAAAA=
N14514 ;======== H2D 20250527========
N14515 ; SKIPPABLE_START
N14516 ; SKIPTYPE: timelapse
N14517 M622.1 S1 ; for prev firware, default turned on
N14518 
N14519 M1002 judge_flag timelapse_record_flag
N14520 
N14521 M622 J1
N14522 M993 A2 B2 C2
N14523 M993 A0 B0 C0
N14524 
N14525 
N14526 
N14527 
N14528     M9711 M0 E1 X261 Y132 Z12.2 S11 C10 O0 T3000
N14529 
N14530 
N14531 
N14532 M993 A3 B3 C3
N14533 
N14534 M623
N14535 ; SKIPPABLE_END
N14536 
N14537 ; object ids of this layer59 end: 372
N14538 M625
N14539 ; CHANGE_LAYER
N14540 ; Z_HEIGHT: 12
N14541 ; LAYER_HEIGHT: 0.2
N14542 ;======== H2D 20250521========
N14543 ; layer num/total_layer_count: 60/75
N14544 ; update layer progress
N14545 M73 L60
N14546 M991 S0 P59 ;notify layer change
N14547 
N14548 
N14549 ; OBJECT_ID: 372
N14550 ; COOLING_NODE: 0
N14551 ; start printing object, unique label id: 372
N14552 M624 AQAAAAAAAAA=
N14553 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=11.900G1 Z11.900 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N14370 G1 X158.916 Y201.084 E1.03439
N14371 G1 X158.916 Y118.916 E2.64221
N14372 G1 X191.084 Y118.916 E1.03439
N14373 G1 X191.084 Y201.024 E2.64028
N14380 G1 X158.509 Y201.491 E1.06057
N14382 G1 X158.509 Y118.509 E2.66839
N14383 G1 X191.491 Y118.509 E1.06057
N14384 G1 X191.491 Y201.431 E2.66646
N14390 G1 X158.102 Y201.898 E1.08675
N14391 G1 X158.102 Y118.102 E2.69457
N14392 G1 X191.898 Y118.102 E1.08675
N14393 G1 X191.898 Y201.838 E2.69264
N14401 G1 X157.71 Y202.29 E1.03002
N14402 G1 X157.71 Y117.71 E2.51935
N14403 G1 X192.29 Y117.71 E1.03002
N14404 G1 X192.29 Y202.23 E2.51756
N14414 G1 X189.162 Y200.736 E.05236
N14415 G1 X190.736 Y194.863 E.19551
N14416 G1 X190.736 Y193.234 E.05236
N14421 G1 X159.264 Y178.52 E1.01026
N14422 G1 X159.264 Y181.283 E.08885
N14423 G1 X190.736 Y172.851 E1.0477
N14424 G1 X190.736 Y175.449 E.08357
N14425 G1 X159.264 Y143.978 E1.43118
N14426 G1 X159.264 Y147.568 E.11543
N14427 G1 X190.736 Y139.135 E1.0477
N14428 G1 X190.736 Y140.908 E.05699
N14429 G1 X169.092 Y119.264 E.98425
N14430 G1 X168.848 Y119.264 E.00785
N14431 G1 X159.264 Y155.031 E1.19069
N14432 G1 X159.264 Y155.492 E.01484
N14433 G1 X190.736 Y186.963 E1.43118
N14434 G1 X190.736 Y189.708 E.08826
N14435 G1 X159.264 Y198.141 E1.0477
N14436 G1 X159.264 Y200.736 E.08343
N14437 G1 X163.876 Y200.736 E.14828
N14438 G1 X185.706 Y119.264 E2.71223
N14439 G1 X187.334 Y119.264 E.05236
N14444 G1 X190.736 Y181.279 E.05236
N14445 G1 X159.264 Y189.712 E1.0477
N14446 G1 X159.264 Y190.034 E.01036
N14447 G1 X169.966 Y200.736 E.48665
N14448 G1 X172.304 Y200.736 E.0752
N14449 G1 X190.736 Y131.949 E2.28994
N14450 G1 X190.736 Y130.707 E.03996
N14451 G1 X159.264 Y139.139 E1.0477
N14452 G1 X159.264 Y137.511 E.05236
N14457 G1 X159.264 Y123.574 E.05236
N14458 G1 X160.419 Y119.264 E.14348
N14459 G1 X162.048 Y119.264 E.05236
N14464 G1 X170.525 Y119.264 E.05236
N14465 G1 X159.264 Y122.282 E.37488
N14466 G1 X159.264 Y120.951 E.04281
N14467 G1 X190.736 Y152.422 E1.43118
N14468 G1 X190.736 Y155.993 E.11485
N14469 G1 X159.264 Y164.426 E1.0477
N14470 G1 X159.264 Y167.006 E.08298
N14471 G1 X190.736 Y198.477 E1.43118
N14472 G1 X190.736 Y198.137 E.01094
N14473 G1 X181.038 Y200.736 E.32284
N14474 G1 X180.733 Y200.736 E.0098
N14475 G1 X190.736 Y163.406 E1.24273
N14476 G1 X190.736 Y161.778 E.05236
N14481 G1 X190.736 Y147.564 E.05236
N14482 G1 X159.264 Y155.997 E1.04769
N14483 G1 X159.264 Y157.625 E.05236
N14488 G1 X159.264 Y172.855 E.05236
N14489 G1 X190.736 Y164.422 E1.04769
N14494 G1 X159.264 Y132.464 E1.43118
N14495 G1 X159.264 Y130.711 E.0564
N14496 G1 X190.736 Y122.278 E1.0477
N14497 G1 X190.736 Y129.394 E.22882
N14498 G1 X180.606 Y119.264 E.46064
N14499 G1 X177.277 Y119.264 E.10706
N14500 G1 X159.264 Y186.488 E2.23791
N14501 G1 X159.264 Y188.116 E.05236
N14503 G1 X159.264 Y186.488 E-.61876
N14504 G1 X159.361 Y186.129 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN14554 G1 Z12
N14555 G1 E.8 F1800
N14556 ; FEATURE: Inner wall
N14557 ; LINE_WIDTH: 0.45
N14558 ; LAYER_HEIGHT: 0.2
N14559 G1 F4421.739
N14560 M204 S8000
N14561 G1 X158.916 Y201.084 E1.03439
N14562 G1 X158.916 Y118.916 E2.64221
N14563 G1 X191.084 Y118.916 E1.03439
N14564 G1 X191.084 Y201.024 E2.64028
N14565 ; COOLING_NODE: 0
N14566 M204 S10000
N14567 G1 X191.491 Y201.491 F60000
N14568 G1 F4421.739
N14569 M204 S8000
N14570 G1 X158.509 Y201.491 E1.06057
N14571 G1 X158.509 Y118.509 E2.66839
N14572 G1 X191.491 Y118.509 E1.06057
N14573 G1 X191.491 Y201.431 E2.66646
N14574 ; COOLING_NODE: 0
N14575 M204 S10000
N14576 G1 X191.898 Y201.898 F60000
N14577 G1 F4421.739
N14578 M204 S8000
N14579 G1 X158.102 Y201.898 E1.08675
N14580 G1 X158.102 Y118.102 E2.69457
N14581 G1 X191.898 Y118.102 E1.08675
N14582 G1 X191.898 Y201.838 E2.69264
N14583 ; COOLING_NODE: 0
N14584 M204 S10000
N14585 G1 X192.29 Y202.29 F60000
N14586 ; FEATURE: Outer wall
N14587 ; LINE_WIDTH: 0.42
N14588 G1 F4773.528
N14589 M204 S5000
N14590 G1 X157.71 Y202.29 E1.03002
N14591 G1 X157.71 Y117.71 E2.51935
N14592 G1 X192.29 Y117.71 E1.03002
N14593 G1 X192.29 Y202.23 E2.51756
N14594 G1 E-.8 F1800
N14595 M204 S10000
N14596 M73 P77 R14
N14597 G1 X187.387 Y200.736 Z12.4 F60000
N14598 G1 Z12
N14599 G1 E.8 F1800
N14600 ; FEATURE: Sparse infill
N14601 ; LINE_WIDTH: 0.45
N14602 G1 F4421.739
N14603 M204 S8000
N14604 G1 X189.016 Y200.736 E.05236
N14605 G1 X190.736 Y194.316 E.2137
N14606 G1 X190.736 Y192.688 E.05236
N14607 M204 S10000
N14608 G1 X190.736 Y179.798 F60000
N14609 G1 F4421.739
N14610 M204 S8000
N14611 G1 X190.736 Y181.426 E.05236
N14612 G1 X159.264 Y189.859 E1.0477
N14613 G1 X159.264 Y189.834 E.00078
N14614 G1 X170.166 Y200.736 E.49575
N14615 G1 X172.158 Y200.736 E.06406
N14616 G1 X190.736 Y131.403 E2.30813
N14617 G1 X190.736 Y130.853 E.01768
N14618 G1 X159.264 Y139.286 E1.04769
N14619 G1 X159.264 Y137.657 E.05236
N14620 M204 S10000
N14621 G1 X172.7 Y119.264 F60000
N14622 G1 F4421.739
N14623 M204 S8000
N14624 G1 X171.072 Y119.264 E.05236
N14625 G1 X159.264 Y122.428 E.39307
N14626 M204 S10000
N14627 G1 X159.264 Y124.656 F60000
N14628 G1 F4421.739
N14629 M204 S8000
N14630 G1 X159.264 Y123.028 E.05236
N14631 G1 X160.273 Y119.264 E.12529
N14632 G1 X159.264 Y119.264 E.03243
N14633 G1 X159.264 Y120.751 E.04779
N14634 G1 X190.736 Y152.222 E1.43118
N14635 G1 X190.736 Y156.139 E.12599
N14636 G1 X159.264 Y164.572 E1.0477
N14637 G1 X159.264 Y166.806 E.07184
N14638 G1 X190.736 Y198.277 E1.43118
N14639 G1 X181.584 Y200.736 E.3047
N14640 G1 X181.68 Y200.736 E.00307
N14641 G1 X159.264 Y178.32 E1.01936
N14642 G1 X159.264 Y181.43 E.09999
N14643 G1 X190.736 Y172.997 E1.0477
N14644 G1 X190.736 Y175.249 E.07243
N14645 G1 X159.264 Y143.778 E1.43118
N14646 G1 X159.264 Y147.715 E.12657
N14647 G1 X190.736 Y139.282 E1.0477
N14648 G1 X190.736 Y140.708 E.04585
N14649 G1 X169.292 Y119.264 E.97515
N14650 G1 X168.702 Y119.264 E.01899
N14651 G1 X159.264 Y154.485 E1.1725
N14652 G1 X159.264 Y155.292 E.02598
N14653 G1 X190.736 Y186.763 E1.43118
N14654 G1 X190.736 Y189.855 E.0994
N14655 G1 X159.264 Y198.287 E1.04769
N14656 G1 X159.264 Y200.736 E.07873
N14657 G1 X163.729 Y200.736 E.14357
N14658 G1 X185.559 Y119.264 E2.71223
N14659 G1 X187.188 Y119.264 E.05236
N14660 M204 S10000
N14661 G1 X159.264 Y187.57 F60000
N14662 G1 F4421.739
N14663 M204 S8000
N14664 G1 X159.264 Y185.941 E.05236
N14665 G1 X177.13 Y119.264 E2.21972
N14666 G1 X180.806 Y119.264 E.1182
N14667 G1 X190.736 Y129.194 E.45154
N14668 G1 X190.736 Y122.424 E.21768
N14669 G1 X159.264 Y130.857 E1.0477
N14670 G1 X159.264 Y132.264 E.04526
N14671 G1 X190.736 Y163.736 E1.43118
N14672 M204 S10000
N14673 G1 X190.736 Y166.197 F60000
N14674 G1 F4421.739
N14675 M204 S8000
N14676 G1 X190.736 Y164.568 E.05236
N14677 G1 X159.264 Y173.001 E1.0477
N14678 G1 X159.264 Y171.373 E.05236
N14679 M204 S10000
N14680 G1 X159.264 Y157.772 F60000
N14681 G1 F4421.739
N14682 M204 S8000
N14683 G1 X159.264 Y156.143 E.05236
N14684 G1 X190.736 Y147.711 E1.04769
N14685 G1 X190.736 Y146.082 E.05236
N14686 M204 S10000
N14687 G1 X190.736 Y161.231 F60000
N14688 G1 F4421.739
N14689 M204 S8000
N14690 G1 X190.736 Y162.86 E.05236
N14691 G1 X180.587 Y200.736 E1.26092
N14692 G1 X178.958 Y200.736 E.05236
N14693 ; WIPE_START
N14694 G1 X180.587 Y200.736 E-.61876
N14695 G1 X180.683 Y200.377 E-.14124
N14696 ; WIPE_END
N14697 G1 E-.04 F1800
N14698 M204 S10000
N14699 G17
N14700 G3 Z12.4 I1.217 J0 P1  F60000
N14701 ; stop printing object, unique label id: 372
N14702 M625
N14703 ; object ids of layer 60 start: 372
N14704 M624 AQAAAAAAAAA=
N14705 ;======== H2D 20250527========
N14706 ; SKIPPABLE_START
N14707 ; SKIPTYPE: timelapse
N14708 M622.1 S1 ; for prev firware, default turned on
N14709 
N14710 M1002 judge_flag timelapse_record_flag
N14711 
N14712 M622 J1
N14713 M993 A2 B2 C2
N14714 M993 A0 B0 C0
N14715 
N14716 
N14717 
N14718 
N14719     M9711 M0 E1 X261 Y132 Z12.4 S11 C10 O0 T3000
N14720 
N14721 
N14722 
N14723 M993 A3 B3 C3
N14724 
N14725 M623
N14726 ; SKIPPABLE_END
N14727 
N14728 ; object ids of this layer60 end: 372
N14729 M625
N14730 ; CHANGE_LAYER
N14731 ; Z_HEIGHT: 12.2
N14732 ; LAYER_HEIGHT: 0.2
N14733 ;======== H2D 20250521========
N14734 ; layer num/total_layer_count: 61/75
N14735 ; update layer progress
N14736 M73 L61
N14737 M991 S0 P60 ;notify layer change
N14738 
N14739 
N14740 ; OBJECT_ID: 372
N14741 ; COOLING_NODE: 0
N14742 ; start printing object, unique label id: 372
N14743 M624 AQAAAAAAAAA=
N14744 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=12.100G1 Z12.100 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N14561 G1 X158.916 Y201.084 E1.03439
N14562 G1 X158.916 Y118.916 E2.64221
N14563 G1 X191.084 Y118.916 E1.03439
N14564 G1 X191.084 Y201.024 E2.64028
N14570 G1 X158.509 Y201.491 E1.06057
N14571 G1 X158.509 Y118.509 E2.66839
N14572 G1 X191.491 Y118.509 E1.06057
N14573 G1 X191.491 Y201.431 E2.66646
N14579 G1 X158.102 Y201.898 E1.08675
N14580 G1 X158.102 Y118.102 E2.69457
N14581 G1 X191.898 Y118.102 E1.08675
N14582 G1 X191.898 Y201.838 E2.69264
N14590 G1 X157.71 Y202.29 E1.03002
N14591 G1 X157.71 Y117.71 E2.51935
N14592 G1 X192.29 Y117.71 E1.03002
N14593 G1 X192.29 Y202.23 E2.51756
N14604 G1 X189.016 Y200.736 E.05236
N14605 G1 X190.736 Y194.316 E.2137
N14606 G1 X190.736 Y192.688 E.05236
N14611 G1 X190.736 Y181.426 E.05236
N14612 G1 X159.264 Y189.859 E1.0477
N14613 G1 X159.264 Y189.834 E.00078
N14614 G1 X170.166 Y200.736 E.49575
N14615 G1 X172.158 Y200.736 E.06406
N14616 G1 X190.736 Y131.403 E2.30813
N14617 G1 X190.736 Y130.853 E.01768
N14618 G1 X159.264 Y139.286 E1.04769
N14619 G1 X159.264 Y137.657 E.05236
N14624 G1 X171.072 Y119.264 E.05236
N14625 G1 X159.264 Y122.428 E.39307
N14630 G1 X159.264 Y123.028 E.05236
N14631 G1 X160.273 Y119.264 E.12529
N14632 G1 X159.264 Y119.264 E.03243
N14633 G1 X159.264 Y120.751 E.04779
N14634 G1 X190.736 Y152.222 E1.43118
N14635 G1 X190.736 Y156.139 E.12599
N14636 G1 X159.264 Y164.572 E1.0477
N14637 G1 X159.264 Y166.806 E.07184
N14638 G1 X190.736 Y198.277 E1.43118
N14639 G1 X181.584 Y200.736 E.3047
N14640 G1 X181.68 Y200.736 E.00307
N14641 G1 X159.264 Y178.32 E1.01936
N14642 G1 X159.264 Y181.43 E.09999
N14643 G1 X190.736 Y172.997 E1.0477
N14644 G1 X190.736 Y175.249 E.07243
N14645 G1 X159.264 Y143.778 E1.43118
N14646 G1 X159.264 Y147.715 E.12657
N14647 G1 X190.736 Y139.282 E1.0477
N14648 G1 X190.736 Y140.708 E.04585
N14649 G1 X169.292 Y119.264 E.97515
N14650 G1 X168.702 Y119.264 E.01899
N14651 G1 X159.264 Y154.485 E1.1725
N14652 G1 X159.264 Y155.292 E.02598
N14653 G1 X190.736 Y186.763 E1.43118
N14654 G1 X190.736 Y189.855 E.0994
N14655 G1 X159.264 Y198.287 E1.04769
N14656 G1 X159.264 Y200.736 E.07873
N14657 G1 X163.729 Y200.736 E.14357
N14658 G1 X185.559 Y119.264 E2.71223
N14659 G1 X187.188 Y119.264 E.05236
N14664 G1 X159.264 Y185.941 E.05236
N14665 G1 X177.13 Y119.264 E2.21972
N14666 G1 X180.806 Y119.264 E.1182
N14667 G1 X190.736 Y129.194 E.45154
N14668 G1 X190.736 Y122.424 E.21768
N14669 G1 X159.264 Y130.857 E1.0477
N14670 G1 X159.264 Y132.264 E.04526
N14671 G1 X190.736 Y163.736 E1.43118
N14676 G1 X190.736 Y164.568 E.05236
N14677 G1 X159.264 Y173.001 E1.0477
N14678 G1 X159.264 Y171.373 E.05236
N14683 G1 X159.264 Y156.143 E.05236
N14684 G1 X190.736 Y147.711 E1.04769
N14685 G1 X190.736 Y146.082 E.05236
N14690 G1 X190.736 Y162.86 E.05236
N14691 G1 X180.587 Y200.736 E1.26092
N14692 G1 X178.958 Y200.736 E.05236
N14694 G1 X180.587 Y200.736 E-.61876
N14695 G1 X180.683 Y200.377 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN14745 G1 Z12.2
N14746 G1 E.8 F1800
N14747 ; FEATURE: Inner wall
N14748 ; LINE_WIDTH: 0.45
N14749 ; LAYER_HEIGHT: 0.2
N14750 G1 F4421.739
N14751 M204 S8000
N14752 G1 X158.916 Y201.084 E1.03439
N14753 G1 X158.916 Y118.916 E2.64221
N14754 G1 X191.084 Y118.916 E1.03439
N14755 G1 X191.084 Y201.024 E2.64028
N14756 ; COOLING_NODE: 0
N14757 M204 S10000
N14758 G1 X191.491 Y201.491 F60000
N14759 G1 F4421.739
N14760 M204 S8000
N14761 G1 X158.509 Y201.491 E1.06057
N14762 G1 X158.509 Y118.509 E2.66839
N14763 G1 X191.491 Y118.509 E1.06057
N14764 G1 X191.491 Y201.431 E2.66646
N14765 ; COOLING_NODE: 0
N14766 M204 S10000
N14767 G1 X191.898 Y201.898 F60000
N14768 G1 F4421.739
N14769 M204 S8000
N14770 G1 X158.102 Y201.898 E1.08675
N14771 G1 X158.102 Y118.102 E2.69457
N14772 G1 X191.898 Y118.102 E1.08675
N14773 G1 X191.898 Y201.838 E2.69264
N14774 ; COOLING_NODE: 0
N14775 M204 S10000
N14776 G1 X192.29 Y202.29 F60000
N14777 ; FEATURE: Outer wall
N14778 ; LINE_WIDTH: 0.42
N14779 M73 P77 R13
N14780 G1 F4773.528
N14781 M204 S5000
N14782 G1 X157.71 Y202.29 E1.03002
N14783 G1 X157.71 Y117.71 E2.51935
N14784 G1 X192.29 Y117.71 E1.03002
N14785 G1 X192.29 Y202.23 E2.51756
N14786 G1 E-.8 F1800
N14787 M204 S10000
N14788 G1 X187.241 Y200.736 Z12.6 F60000
N14789 G1 Z12.2
N14790 G1 E.8 F1800
N14791 ; FEATURE: Sparse infill
N14792 ; LINE_WIDTH: 0.45
N14793 G1 F4421.739
N14794 M204 S8000
N14795 G1 X188.869 Y200.736 E.05236
N14796 G1 X190.736 Y193.77 E.23189
N14797 G1 X190.736 Y192.142 E.05236
N14798 M204 S10000
N14799 G1 X190.736 Y179.944 F60000
N14800 G1 F4421.739
N14801 M204 S8000
N14802 G1 X190.736 Y181.572 E.05236
N14803 G1 X159.264 Y190.005 E1.0477
N14804 G1 X159.264 Y189.634 E.01192
N14805 G1 X170.366 Y200.736 E.50484
N14806 G1 X172.012 Y200.736 E.05292
N14807 G1 X190.736 Y130.857 E2.32632
N14808 G1 X190.736 Y131 E.0046
N14809 G1 X159.264 Y139.432 E1.0477
N14810 G1 X159.264 Y143.578 E.13333
N14811 G1 X190.736 Y175.049 E1.43118
N14812 G1 X190.736 Y173.143 E.06129
N14813 G1 X159.264 Y181.576 E1.0477
N14814 G1 X159.264 Y178.12 E.11113
N14815 G1 X181.88 Y200.736 E1.02845
N14816 G1 X182.131 Y200.736 E.00807
N14817 G1 X190.736 Y198.43 E.28646
N14818 G1 X190.736 Y198.077 E.01133
N14819 G1 X159.264 Y166.606 E1.43118
N14820 G1 X159.264 Y164.719 E.0607
N14821 G1 X190.736 Y156.286 E1.0477
N14822 G1 X190.736 Y162.313 E.19382
N14823 G1 X180.44 Y200.736 E1.27911
N14824 G1 X178.812 Y200.736 E.05236
N14825 M204 S10000
N14826 G1 X159.264 Y187.023 F60000
N14827 G1 F4421.739
N14828 M204 S8000
N14829 G1 X159.264 Y185.395 E.05236
N14830 G1 X176.984 Y119.264 E2.20153
N14831 G1 X181.006 Y119.264 E.12934
N14832 G1 X190.736 Y128.994 E.44245
N14833 G1 X190.736 Y122.571 E.20654
N14834 G1 X159.264 Y131.003 E1.0477
N14835 G1 X159.264 Y132.064 E.03412
N14836 G1 X190.736 Y163.536 E1.43118
N14837 M204 S10000
N14838 G1 X190.736 Y166.343 F60000
N14839 M73 P78 R13
N14840 G1 F4421.739
N14841 M204 S8000
N14842 G1 X190.736 Y164.715 E.05236
N14843 G1 X159.264 Y173.147 E1.0477
N14844 G1 X159.264 Y171.519 E.05236
N14845 M204 S10000
N14846 G1 X173.246 Y119.264 F60000
N14847 G1 F4421.739
N14848 M204 S8000
N14849 G1 X171.618 Y119.264 E.05236
N14850 G1 X159.264 Y122.575 E.41126
N14851 G1 X159.264 Y122.481 E.00299
N14852 G1 X160.126 Y119.264 E.1071
N14853 G1 X159.264 Y119.264 E.02772
N14854 G1 X159.264 Y120.551 E.04136
N14855 G1 X190.736 Y152.022 E1.43118
N14856 G1 X190.736 Y147.857 E.13391
N14857 G1 X159.264 Y156.29 E1.0477
N14858 G1 X159.264 Y157.918 E.05236
N14859 M204 S10000
N14860 G1 X159.264 Y149.489 F60000
N14861 G1 F4421.739
N14862 M204 S8000
N14863 G1 X159.264 Y147.861 E.05236
N14864 G1 X190.736 Y139.428 E1.0477
N14865 G1 X190.736 Y140.508 E.03471
N14866 G1 X169.492 Y119.264 E.96605
N14867 G1 X168.555 Y119.264 E.03013
N14868 G1 X159.264 Y153.938 E1.15431
N14869 G1 X159.264 Y155.092 E.03712
N14870 G1 X190.736 Y186.563 E1.43118
N14871 G1 X190.736 Y190.001 E.11054
N14872 G1 X159.264 Y198.434 E1.0477
N14873 G1 X159.264 Y200.736 E.07402
N14874 G1 X163.583 Y200.736 E.13886
N14875 G1 X185.413 Y119.264 E2.71223
N14876 G1 X187.041 Y119.264 E.05236
N14877 ; WIPE_START
N14878 G1 X185.413 Y119.264 E-.61876
N14879 G1 X185.317 Y119.623 E-.14124
N14880 ; WIPE_END
N14881 G1 E-.04 F1800
N14882 M204 S10000
N14883 G17
N14884 G3 Z12.6 I1.217 J0 P1  F60000
N14885 ; stop printing object, unique label id: 372
N14886 M625
N14887 ; object ids of layer 61 start: 372
N14888 M624 AQAAAAAAAAA=
N14889 ;======== H2D 20250527========
N14890 ; SKIPPABLE_START
N14891 ; SKIPTYPE: timelapse
N14892 M622.1 S1 ; for prev firware, default turned on
N14893 
N14894 M1002 judge_flag timelapse_record_flag
N14895 
N14896 M622 J1
N14897 M993 A2 B2 C2
N14898 M993 A0 B0 C0
N14899 
N14900 
N14901 
N14902 
N14903     M9711 M0 E1 X261 Y132 Z12.6 S11 C10 O0 T3000
N14904 
N14905 
N14906 
N14907 M993 A3 B3 C3
N14908 
N14909 M623
N14910 ; SKIPPABLE_END
N14911 
N14912 ; object ids of this layer61 end: 372
N14913 M625
N14914 ; CHANGE_LAYER
N14915 ; Z_HEIGHT: 12.4
N14916 ; LAYER_HEIGHT: 0.2
N14917 ;======== H2D 20250521========
N14918 ; layer num/total_layer_count: 62/75
N14919 ; update layer progress
N14920 M73 L62
N14921 M991 S0 P61 ;notify layer change
N14922 
N14923 
N14924 ; OBJECT_ID: 372
N14925 ; COOLING_NODE: 0
N14926 ; start printing object, unique label id: 372
N14927 M624 AQAAAAAAAAA=
N14928 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=12.300G1 Z12.300 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N14752 G1 X158.916 Y201.084 E1.03439
N14753 G1 X158.916 Y118.916 E2.64221
N14754 G1 X191.084 Y118.916 E1.03439
N14755 G1 X191.084 Y201.024 E2.64028
N14761 G1 X158.509 Y201.491 E1.06057
N14762 G1 X158.509 Y118.509 E2.66839
N14763 G1 X191.491 Y118.509 E1.06057
N14764 G1 X191.491 Y201.431 E2.66646
N14770 G1 X158.102 Y201.898 E1.08675
N14771 G1 X158.102 Y118.102 E2.69457
N14772 G1 X191.898 Y118.102 E1.08675
N14773 G1 X191.898 Y201.838 E2.69264
N14782 G1 X157.71 Y202.29 E1.03002
N14783 G1 X157.71 Y117.71 E2.51935
N14784 G1 X192.29 Y117.71 E1.03002
N14785 G1 X192.29 Y202.23 E2.51756
N14795 G1 X188.869 Y200.736 E.05236
N14796 G1 X190.736 Y193.77 E.23189
N14797 G1 X190.736 Y192.142 E.05236
N14802 G1 X190.736 Y181.572 E.05236
N14803 G1 X159.264 Y190.005 E1.0477
N14804 G1 X159.264 Y189.634 E.01192
N14805 G1 X170.366 Y200.736 E.50484
N14806 G1 X172.012 Y200.736 E.05292
N14807 G1 X190.736 Y130.857 E2.32632
N14808 G1 X190.736 Y131 E.0046
N14809 G1 X159.264 Y139.432 E1.0477
N14810 G1 X159.264 Y143.578 E.13333
N14811 G1 X190.736 Y175.049 E1.43118
N14812 G1 X190.736 Y173.143 E.06129
N14813 G1 X159.264 Y181.576 E1.0477
N14814 G1 X159.264 Y178.12 E.11113
N14815 G1 X181.88 Y200.736 E1.02845
N14816 G1 X182.131 Y200.736 E.00807
N14817 G1 X190.736 Y198.43 E.28646
N14818 G1 X190.736 Y198.077 E.01133
N14819 G1 X159.264 Y166.606 E1.43118
N14820 G1 X159.264 Y164.719 E.0607
N14821 G1 X190.736 Y156.286 E1.0477
N14822 G1 X190.736 Y162.313 E.19382
N14823 G1 X180.44 Y200.736 E1.27911
N14824 G1 X178.812 Y200.736 E.05236
N14829 G1 X159.264 Y185.395 E.05236
N14830 G1 X176.984 Y119.264 E2.20153
N14831 G1 X181.006 Y119.264 E.12934
N14832 G1 X190.736 Y128.994 E.44245
N14833 G1 X190.736 Y122.571 E.20654
N14834 G1 X159.264 Y131.003 E1.0477
N14835 G1 X159.264 Y132.064 E.03412
N14836 G1 X190.736 Y163.536 E1.43118
N14842 G1 X190.736 Y164.715 E.05236
N14843 G1 X159.264 Y173.147 E1.0477
N14844 G1 X159.264 Y171.519 E.05236
N14849 G1 X171.618 Y119.264 E.05236
N14850 G1 X159.264 Y122.575 E.41126
N14851 G1 X159.264 Y122.481 E.00299
N14852 G1 X160.126 Y119.264 E.1071
N14853 G1 X159.264 Y119.264 E.02772
N14854 G1 X159.264 Y120.551 E.04136
N14855 G1 X190.736 Y152.022 E1.43118
N14856 G1 X190.736 Y147.857 E.13391
N14857 G1 X159.264 Y156.29 E1.0477
N14858 G1 X159.264 Y157.918 E.05236
N14863 G1 X159.264 Y147.861 E.05236
N14864 G1 X190.736 Y139.428 E1.0477
N14865 G1 X190.736 Y140.508 E.03471
N14866 G1 X169.492 Y119.264 E.96605
N14867 G1 X168.555 Y119.264 E.03013
N14868 G1 X159.264 Y153.938 E1.15431
N14869 G1 X159.264 Y155.092 E.03712
N14870 G1 X190.736 Y186.563 E1.43118
N14871 G1 X190.736 Y190.001 E.11054
N14872 G1 X159.264 Y198.434 E1.0477
N14873 G1 X159.264 Y200.736 E.07402
N14874 G1 X163.583 Y200.736 E.13886
N14875 G1 X185.413 Y119.264 E2.71223
N14876 G1 X187.041 Y119.264 E.05236
N14878 G1 X185.413 Y119.264 E-.61876
N14879 G1 X185.317 Y119.623 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN14929 G1 Z12.4
N14930 G1 E.8 F1800
N14931 ; FEATURE: Inner wall
N14932 ; LINE_WIDTH: 0.45
N14933 ; LAYER_HEIGHT: 0.2
N14934 G1 F4421.739
N14935 M204 S8000
N14936 G1 X158.916 Y201.084 E1.03439
N14937 G1 X158.916 Y118.916 E2.64221
N14938 G1 X191.084 Y118.916 E1.03439
N14939 G1 X191.084 Y201.024 E2.64028
N14940 ; COOLING_NODE: 0
N14941 M204 S10000
N14942 G1 X191.491 Y201.491 F60000
N14943 G1 F4421.739
N14944 M204 S8000
N14945 G1 X158.509 Y201.491 E1.06057
N14946 G1 X158.509 Y118.509 E2.66839
N14947 G1 X191.491 Y118.509 E1.06057
N14948 G1 X191.491 Y201.431 E2.66646
N14949 ; COOLING_NODE: 0
N14950 M204 S10000
N14951 G1 X191.898 Y201.898 F60000
N14952 G1 F4421.739
N14953 M204 S8000
N14954 G1 X158.102 Y201.898 E1.08675
N14955 G1 X158.102 Y118.102 E2.69457
N14956 G1 X191.898 Y118.102 E1.08675
N14957 G1 X191.898 Y201.838 E2.69264
N14958 ; COOLING_NODE: 0
N14959 M204 S10000
N14960 G1 X192.29 Y202.29 F60000
N14961 ; FEATURE: Outer wall
N14962 ; LINE_WIDTH: 0.42
N14963 G1 F4773.528
N14964 M204 S5000
N14965 G1 X157.71 Y202.29 E1.03002
N14966 G1 X157.71 Y117.71 E2.51935
N14967 G1 X192.29 Y117.71 E1.03002
N14968 G1 X192.29 Y202.23 E2.51756
N14969 G1 E-.8 F1800
N14970 M204 S10000
N14971 G1 X187.094 Y200.736 Z12.8 F60000
N14972 G1 Z12.4
N14973 G1 E.8 F1800
N14974 ; FEATURE: Sparse infill
N14975 ; LINE_WIDTH: 0.45
N14976 G1 F4421.739
N14977 M204 S8000
N14978 G1 X188.723 Y200.736 E.05236
N14979 G1 X190.736 Y193.223 E.25008
N14980 G1 X190.736 Y190.147 E.09891
N14981 G1 X159.264 Y198.58 E1.0477
N14982 G1 X159.264 Y200.736 E.06931
N14983 G1 X163.436 Y200.736 E.13415
N14984 G1 X185.266 Y119.264 E2.71223
N14985 G1 X181.206 Y119.264 E.13056
N14986 G1 X190.736 Y128.794 E.43335
N14987 G1 X190.736 Y130.31 E.04876
N14988 G1 X171.865 Y200.736 E2.34451
N14989 G1 X170.566 Y200.736 E.04178
N14990 G1 X159.264 Y189.434 E.51394
N14991 G1 X159.264 Y190.151 E.02306
N14992 G1 X190.736 Y181.719 E1.0477
N14993 G1 X190.736 Y186.363 E.14936
N14994 G1 X159.264 Y154.892 E1.43118
N14995 G1 X159.264 Y153.392 E.04825
N14996 G1 X168.409 Y119.264 E1.13612
N14997 G1 X169.692 Y119.264 E.04127
N14998 G1 X190.736 Y140.308 E.95696
N14999 G1 X190.736 Y139.575 E.02357
N15000 G1 X159.264 Y148.007 E1.0477
N15001 G1 X159.264 Y146.379 E.05236
N15002 M204 S10000
N15003 G1 X159.264 Y158.064 F60000
N15004 G1 F4421.739
N15005 M204 S8000
N15006 G1 X159.264 Y156.436 E.05236
N15007 G1 X190.736 Y148.004 E1.0477
N15008 G1 X190.736 Y151.822 E.12278
N15009 G1 X159.264 Y120.351 E1.43118
N15010 G1 X159.264 Y119.264 E.03492
N15011 G1 X159.98 Y119.264 E.02301
N15012 G1 X159.264 Y121.935 E.08891
N15013 G1 X159.264 Y122.721 E.02527
N15014 G1 X172.164 Y119.264 E.42945
N15015 G1 X176.838 Y119.264 E.15027
N15016 G1 X159.264 Y184.848 E2.18334
N15017 G1 X159.264 Y186.477 E.05236
N15018 M204 S10000
N15019 G1 X159.264 Y171.665 F60000
N15020 G1 F4421.739
N15021 M204 S8000
N15022 G1 X159.264 Y173.294 E.05236
N15023 G1 X190.736 Y164.861 E1.0477
N15024 G1 X190.736 Y163.336 E.04906
N15025 G1 X159.264 Y131.864 E1.43118
N15026 G1 X159.264 Y131.15 E.02298
N15027 G1 X190.736 Y122.717 E1.0477
N15028 G1 X190.736 Y121.089 E.05236
N15029 M204 S10000
N15030 G1 X190.736 Y131.146 F60000
N15031 G1 F4421.739
N15032 M204 S8000
N15033 G1 X159.264 Y139.579 E1.0477
N15034 G1 X159.264 Y143.378 E.12219
N15035 G1 X190.736 Y174.849 E1.43118
N15036 G1 X190.736 Y173.29 E.05015
N15037 G1 X159.264 Y181.723 E1.0477
N15038 G1 X159.264 Y177.92 E.12227
N15039 G1 X182.08 Y200.736 E1.03755
N15040 G1 X182.677 Y200.736 E.01921
N15041 G1 X190.736 Y198.576 E.26827
N15042 G1 X190.736 Y197.877 E.02247
N15043 G1 X159.264 Y166.406 E1.43118
N15044 G1 X159.264 Y164.865 E.04956
N15045 G1 X190.736 Y156.432 E1.0477
N15046 G1 X190.736 Y161.767 E.17154
N15047 G1 X180.294 Y200.736 E1.2973
N15048 G1 X178.666 Y200.736 E.05236
N15049 ; WIPE_START
N15050 G1 X180.294 Y200.736 E-.61876
N15051 G1 X180.39 Y200.377 E-.14124
N15052 ; WIPE_END
N15053 G1 E-.04 F1800
N15054 M204 S10000
N15055 G17
N15056 G3 Z12.8 I1.217 J0 P1  F60000
N15057 ; stop printing object, unique label id: 372
N15058 M625
N15059 ; object ids of layer 62 start: 372
N15060 M624 AQAAAAAAAAA=
N15061 ;======== H2D 20250527========
N15062 ; SKIPPABLE_START
N15063 ; SKIPTYPE: timelapse
N15064 M622.1 S1 ; for prev firware, default turned on
N15065 
N15066 M1002 judge_flag timelapse_record_flag
N15067 
N15068 M622 J1
N15069 M993 A2 B2 C2
N15070 M993 A0 B0 C0
N15071 
N15072 
N15073 
N15074 
N15075     M9711 M0 E1 X261 Y132 Z12.8 S11 C10 O0 T3000
N15076 
N15077 
N15078 
N15079 M993 A3 B3 C3
N15080 
N15081 M623
N15082 ; SKIPPABLE_END
N15083 
N15084 ; object ids of this layer62 end: 372
N15085 M625
N15086 ; CHANGE_LAYER
N15087 ; Z_HEIGHT: 12.6
N15088 ; LAYER_HEIGHT: 0.200001
N15089 ;======== H2D 20250521========
N15090 ; layer num/total_layer_count: 63/75
N15091 ; update layer progress
N15092 M73 L63
N15093 M991 S0 P62 ;notify layer change
N15094 
N15095 
N15096 ; OBJECT_ID: 372
N15097 ; COOLING_NODE: 0
N15098 ; start printing object, unique label id: 372
N15099 M624 AQAAAAAAAAA=
N15100 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=12.500G1 Z12.500 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N14936 G1 X158.916 Y201.084 E1.03439
N14937 G1 X158.916 Y118.916 E2.64221
N14938 G1 X191.084 Y118.916 E1.03439
N14939 G1 X191.084 Y201.024 E2.64028
N14945 G1 X158.509 Y201.491 E1.06057
N14946 G1 X158.509 Y118.509 E2.66839
N14947 G1 X191.491 Y118.509 E1.06057
N14948 G1 X191.491 Y201.431 E2.66646
N14954 G1 X158.102 Y201.898 E1.08675
N14955 G1 X158.102 Y118.102 E2.69457
N14956 G1 X191.898 Y118.102 E1.08675
N14957 G1 X191.898 Y201.838 E2.69264
N14965 G1 X157.71 Y202.29 E1.03002
N14966 G1 X157.71 Y117.71 E2.51935
N14967 G1 X192.29 Y117.71 E1.03002
N14968 G1 X192.29 Y202.23 E2.51756
N14978 G1 X188.723 Y200.736 E.05236
N14979 G1 X190.736 Y193.223 E.25008
N14980 G1 X190.736 Y190.147 E.09891
N14981 G1 X159.264 Y198.58 E1.0477
N14982 G1 X159.264 Y200.736 E.06931
N14983 G1 X163.436 Y200.736 E.13415
N14984 G1 X185.266 Y119.264 E2.71223
N14985 G1 X181.206 Y119.264 E.13056
N14986 G1 X190.736 Y128.794 E.43335
N14987 G1 X190.736 Y130.31 E.04876
N14988 G1 X171.865 Y200.736 E2.34451
N14989 G1 X170.566 Y200.736 E.04178
N14990 G1 X159.264 Y189.434 E.51394
N14991 G1 X159.264 Y190.151 E.02306
N14992 G1 X190.736 Y181.719 E1.0477
N14993 G1 X190.736 Y186.363 E.14936
N14994 G1 X159.264 Y154.892 E1.43118
N14995 G1 X159.264 Y153.392 E.04825
N14996 G1 X168.409 Y119.264 E1.13612
N14997 G1 X169.692 Y119.264 E.04127
N14998 G1 X190.736 Y140.308 E.95696
N14999 G1 X190.736 Y139.575 E.02357
N15000 G1 X159.264 Y148.007 E1.0477
N15001 G1 X159.264 Y146.379 E.05236
N15006 G1 X159.264 Y156.436 E.05236
N15007 G1 X190.736 Y148.004 E1.0477
N15008 G1 X190.736 Y151.822 E.12278
N15009 G1 X159.264 Y120.351 E1.43118
N15010 G1 X159.264 Y119.264 E.03492
N15011 G1 X159.98 Y119.264 E.02301
N15012 G1 X159.264 Y121.935 E.08891
N15013 G1 X159.264 Y122.721 E.02527
N15014 G1 X172.164 Y119.264 E.42945
N15015 G1 X176.838 Y119.264 E.15027
N15016 G1 X159.264 Y184.848 E2.18334
N15017 G1 X159.264 Y186.477 E.05236
N15022 G1 X159.264 Y173.294 E.05236
N15023 G1 X190.736 Y164.861 E1.0477
N15024 G1 X190.736 Y163.336 E.04906
N15025 G1 X159.264 Y131.864 E1.43118
N15026 G1 X159.264 Y131.15 E.02298
N15027 G1 X190.736 Y122.717 E1.0477
N15028 G1 X190.736 Y121.089 E.05236
N15033 G1 X159.264 Y139.579 E1.0477
N15034 G1 X159.264 Y143.378 E.12219
N15035 G1 X190.736 Y174.849 E1.43118
N15036 G1 X190.736 Y173.29 E.05015
N15037 G1 X159.264 Y181.723 E1.0477
N15038 G1 X159.264 Y177.92 E.12227
N15039 G1 X182.08 Y200.736 E1.03755
N15040 G1 X182.677 Y200.736 E.01921
N15041 G1 X190.736 Y198.576 E.26827
N15042 G1 X190.736 Y197.877 E.02247
N15043 G1 X159.264 Y166.406 E1.43118
N15044 G1 X159.264 Y164.865 E.04956
N15045 G1 X190.736 Y156.432 E1.0477
N15046 G1 X190.736 Y161.767 E.17154
N15047 G1 X180.294 Y200.736 E1.2973
N15048 G1 X178.666 Y200.736 E.05236
N15050 G1 X180.294 Y200.736 E-.61876
N15051 G1 X180.39 Y200.377 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN15101 G1 Z12.6
N15102 G1 E.8 F1800
N15103 ; FEATURE: Inner wall
N15104 ; LINE_WIDTH: 0.45
N15105 ; LAYER_HEIGHT: 0.2
N15106 G1 F4421.739
N15107 M204 S8000
N15108 G1 X158.916 Y201.084 E1.03439
N15109 G1 X158.916 Y118.916 E2.64221
N15110 G1 X191.084 Y118.916 E1.03439
N15111 G1 X191.084 Y201.024 E2.64028
N15112 ; COOLING_NODE: 0
N15113 M204 S10000
N15114 G1 X191.491 Y201.491 F60000
N15115 G1 F4421.739
N15116 M204 S8000
N15117 G1 X158.509 Y201.491 E1.06057
N15118 M73 P79 R13
N15119 G1 X158.509 Y118.509 E2.66839
N15120 G1 X191.491 Y118.509 E1.06057
N15121 G1 X191.491 Y201.431 E2.66646
N15122 ; COOLING_NODE: 0
N15123 M204 S10000
N15124 G1 X191.898 Y201.898 F60000
N15125 G1 F4421.739
N15126 M204 S8000
N15127 G1 X158.102 Y201.898 E1.08675
N15128 G1 X158.102 Y118.102 E2.69457
N15129 G1 X191.898 Y118.102 E1.08675
N15130 G1 X191.898 Y201.838 E2.69264
N15131 ; COOLING_NODE: 0
N15132 M204 S10000
N15133 G1 X192.29 Y202.29 F60000
N15134 ; FEATURE: Outer wall
N15135 ; LINE_WIDTH: 0.42
N15136 G1 F4773.528
N15137 M204 S5000
N15138 G1 X157.71 Y202.29 E1.03002
N15139 G1 X157.71 Y117.71 E2.51935
N15140 G1 X192.29 Y117.71 E1.03002
N15141 G1 X192.29 Y202.23 E2.51756
N15142 G1 E-.8 F1800
N15143 M204 S10000
N15144 G1 X190.205 Y200.736 Z13 F60000
N15145 G1 Z12.6
N15146 G1 E.8 F1800
N15147 ; FEATURE: Sparse infill
N15148 ; LINE_WIDTH: 0.45
N15149 G1 F4421.739
N15150 M204 S8000
N15151 G1 X188.576 Y200.736 E.05236
N15152 G1 X190.736 Y192.677 E.26827
N15153 G1 X190.736 Y190.294 E.07664
N15154 G1 X159.264 Y198.727 E1.0477
N15155 G1 X159.264 Y200.736 E.0646
N15156 M73 P79 R12
N15157 G1 X163.29 Y200.736 E.12944
N15158 G1 X185.12 Y119.264 E2.71223
N15159 G1 X181.406 Y119.264 E.11942
N15160 G1 X190.736 Y128.594 E.42426
N15161 G1 X190.736 Y129.764 E.03762
N15162 G1 X171.719 Y200.736 E2.3627
N15163 G1 X170.766 Y200.736 E.03064
N15164 G1 X159.264 Y189.234 E.52303
N15165 G1 X159.264 Y190.298 E.0342
N15166 G1 X190.736 Y181.865 E1.0477
N15167 G1 X190.736 Y186.163 E.13822
N15168 G1 X159.264 Y154.692 E1.43118
N15169 G1 X159.264 Y152.845 E.05939
N15170 G1 X168.262 Y119.264 E1.11793
N15171 G1 X169.892 Y119.264 E.05241
N15172 G1 X190.736 Y140.108 E.94786
N15173 G1 X190.736 Y139.721 E.01243
N15174 G1 X159.264 Y148.154 E1.0477
N15175 G1 X159.264 Y146.525 E.05236
N15176 M204 S10000
N15177 G1 X159.264 Y158.211 F60000
N15178 G1 F4421.739
N15179 M204 S8000
N15180 G1 X159.264 Y156.583 E.05236
N15181 G1 X190.736 Y148.15 E1.0477
N15182 G1 X190.736 Y151.622 E.11164
N15183 G1 X159.264 Y120.151 E1.43118
N15184 M204 S10000
N15185 G1 X161.462 Y119.264 F60000
N15186 G1 F4421.739
N15187 M204 S8000
N15188 G1 X159.834 Y119.264 E.05236
N15189 G1 X159.264 Y121.389 E.07072
N15190 G1 X159.264 Y122.867 E.04755
N15191 G1 X172.711 Y119.264 E.44764
N15192 G1 X176.691 Y119.264 E.128
N15193 G1 X159.264 Y184.302 E2.16515
N15194 G1 X159.264 Y185.93 E.05236
N15195 M204 S10000
N15196 G1 X159.264 Y171.812 F60000
N15197 G1 F4421.739
N15198 M204 S8000
N15199 G1 X159.264 Y173.44 E.05236
N15200 G1 X190.736 Y165.008 E1.0477
N15201 G1 X190.736 Y163.136 E.0602
N15202 G1 X159.264 Y131.664 E1.43118
N15203 G1 X159.264 Y131.296 E.01184
N15204 G1 X190.736 Y122.864 E1.0477
N15205 G1 X190.736 Y121.235 E.05236
N15206 M204 S10000
N15207 G1 X190.736 Y132.921 F60000
N15208 G1 F4421.739
N15209 M204 S8000
N15210 G1 X190.736 Y131.292 E.05236
N15211 G1 X159.264 Y139.725 E1.0477
N15212 G1 X159.264 Y143.178 E.11105
N15213 G1 X190.736 Y174.649 E1.43118
N15214 G1 X190.736 Y173.436 E.03901
N15215 G1 X159.264 Y181.869 E1.0477
N15216 G1 X159.264 Y177.72 E.13341
N15217 G1 X182.28 Y200.736 E1.04664
N15218 G1 X183.223 Y200.736 E.03035
N15219 G1 X190.736 Y198.723 E.25008
N15220 G1 X190.736 Y197.677 E.03361
N15221 G1 X159.264 Y166.206 E1.43118
N15222 G1 X159.264 Y165.011 E.03843
N15223 G1 X190.736 Y156.579 E1.04769
N15224 G1 X190.736 Y161.22 E.14926
N15225 G1 X180.147 Y200.736 E1.31549
N15226 G1 X178.519 Y200.736 E.05236
N15227 ; WIPE_START
N15228 G1 X180.147 Y200.736 E-.61876
N15229 G1 X180.244 Y200.377 E-.14124
N15230 ; WIPE_END
N15231 G1 E-.04 F1800
N15232 M204 S10000
N15233 G17
N15234 G3 Z13 I1.217 J0 P1  F60000
N15235 ; stop printing object, unique label id: 372
N15236 M625
N15237 ; object ids of layer 63 start: 372
N15238 M624 AQAAAAAAAAA=
N15239 ;======== H2D 20250527========
N15240 ; SKIPPABLE_START
N15241 ; SKIPTYPE: timelapse
N15242 M622.1 S1 ; for prev firware, default turned on
N15243 
N15244 M1002 judge_flag timelapse_record_flag
N15245 
N15246 M622 J1
N15247 M993 A2 B2 C2
N15248 M993 A0 B0 C0
N15249 
N15250 
N15251 
N15252 
N15253     M9711 M0 E1 X261 Y132 Z13 S11 C10 O0 T3000
N15254 
N15255 
N15256 
N15257 M993 A3 B3 C3
N15258 
N15259 M623
N15260 ; SKIPPABLE_END
N15261 
N15262 ; object ids of this layer63 end: 372
N15263 M625
N15264 ; CHANGE_LAYER
N15265 ; Z_HEIGHT: 12.8
N15266 ; LAYER_HEIGHT: 0.2
N15267 ;======== H2D 20250521========
N15268 ; layer num/total_layer_count: 64/75
N15269 ; update layer progress
N15270 M73 L64
N15271 M991 S0 P63 ;notify layer change
N15272 
N15273 
N15274 M106 S40.8
N15275 ; OBJECT_ID: 372
N15276 ; COOLING_NODE: 0
N15277 ; start printing object, unique label id: 372
N15278 M624 AQAAAAAAAAA=
N15279 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=12.700G1 Z12.700 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N15108 G1 X158.916 Y201.084 E1.03439
N15109 G1 X158.916 Y118.916 E2.64221
N15110 G1 X191.084 Y118.916 E1.03439
N15111 G1 X191.084 Y201.024 E2.64028
N15117 G1 X158.509 Y201.491 E1.06057
N15119 G1 X158.509 Y118.509 E2.66839
N15120 G1 X191.491 Y118.509 E1.06057
N15121 G1 X191.491 Y201.431 E2.66646
N15127 G1 X158.102 Y201.898 E1.08675
N15128 G1 X158.102 Y118.102 E2.69457
N15129 G1 X191.898 Y118.102 E1.08675
N15130 G1 X191.898 Y201.838 E2.69264
N15138 G1 X157.71 Y202.29 E1.03002
N15139 G1 X157.71 Y117.71 E2.51935
N15140 G1 X192.29 Y117.71 E1.03002
N15141 G1 X192.29 Y202.23 E2.51756
N15151 G1 X188.576 Y200.736 E.05236
N15152 G1 X190.736 Y192.677 E.26827
N15153 G1 X190.736 Y190.294 E.07664
N15154 G1 X159.264 Y198.727 E1.0477
N15155 G1 X159.264 Y200.736 E.0646
N15157 G1 X163.29 Y200.736 E.12944
N15158 G1 X185.12 Y119.264 E2.71223
N15159 G1 X181.406 Y119.264 E.11942
N15160 G1 X190.736 Y128.594 E.42426
N15161 G1 X190.736 Y129.764 E.03762
N15162 G1 X171.719 Y200.736 E2.3627
N15163 G1 X170.766 Y200.736 E.03064
N15164 G1 X159.264 Y189.234 E.52303
N15165 G1 X159.264 Y190.298 E.0342
N15166 G1 X190.736 Y181.865 E1.0477
N15167 G1 X190.736 Y186.163 E.13822
N15168 G1 X159.264 Y154.692 E1.43118
N15169 G1 X159.264 Y152.845 E.05939
N15170 G1 X168.262 Y119.264 E1.11793
N15171 G1 X169.892 Y119.264 E.05241
N15172 G1 X190.736 Y140.108 E.94786
N15173 G1 X190.736 Y139.721 E.01243
N15174 G1 X159.264 Y148.154 E1.0477
N15175 G1 X159.264 Y146.525 E.05236
N15180 G1 X159.264 Y156.583 E.05236
N15181 G1 X190.736 Y148.15 E1.0477
N15182 G1 X190.736 Y151.622 E.11164
N15183 G1 X159.264 Y120.151 E1.43118
N15188 G1 X159.834 Y119.264 E.05236
N15189 G1 X159.264 Y121.389 E.07072
N15190 G1 X159.264 Y122.867 E.04755
N15191 G1 X172.711 Y119.264 E.44764
N15192 G1 X176.691 Y119.264 E.128
N15193 G1 X159.264 Y184.302 E2.16515
N15194 G1 X159.264 Y185.93 E.05236
N15199 G1 X159.264 Y173.44 E.05236
N15200 G1 X190.736 Y165.008 E1.0477
N15201 G1 X190.736 Y163.136 E.0602
N15202 G1 X159.264 Y131.664 E1.43118
N15203 G1 X159.264 Y131.296 E.01184
N15204 G1 X190.736 Y122.864 E1.0477
N15205 G1 X190.736 Y121.235 E.05236
N15210 G1 X190.736 Y131.292 E.05236
N15211 G1 X159.264 Y139.725 E1.0477
N15212 G1 X159.264 Y143.178 E.11105
N15213 G1 X190.736 Y174.649 E1.43118
N15214 G1 X190.736 Y173.436 E.03901
N15215 G1 X159.264 Y181.869 E1.0477
N15216 G1 X159.264 Y177.72 E.13341
N15217 G1 X182.28 Y200.736 E1.04664
N15218 G1 X183.223 Y200.736 E.03035
N15219 G1 X190.736 Y198.723 E.25008
N15220 G1 X190.736 Y197.677 E.03361
N15221 G1 X159.264 Y166.206 E1.43118
N15222 G1 X159.264 Y165.011 E.03843
N15223 G1 X190.736 Y156.579 E1.04769
N15224 G1 X190.736 Y161.22 E.14926
N15225 G1 X180.147 Y200.736 E1.31549
N15226 G1 X178.519 Y200.736 E.05236
N15228 G1 X180.147 Y200.736 E-.61876
N15229 G1 X180.244 Y200.377 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN15280 G1 Z12.8
N15281 G1 E.8 F1800
N15282 ; FEATURE: Inner wall
N15283 ; LINE_WIDTH: 0.45
N15284 ; LAYER_HEIGHT: 0.2
N15285 G1 F4421.739
N15286 M204 S8000
N15287 G1 X158.916 Y201.084 E1.03439
N15288 G1 X158.916 Y118.916 E2.64221
N15289 G1 X191.084 Y118.916 E1.03439
N15290 G1 X191.084 Y201.024 E2.64028
N15291 ; COOLING_NODE: 0
N15292 M204 S10000
N15293 G1 X191.491 Y201.491 F60000
N15294 G1 F4421.739
N15295 M204 S8000
N15296 G1 X158.509 Y201.491 E1.06057
N15297 G1 X158.509 Y118.509 E2.66839
N15298 G1 X191.491 Y118.509 E1.06057
N15299 G1 X191.491 Y201.431 E2.66646
N15300 ; COOLING_NODE: 0
N15301 M204 S10000
N15302 G1 X191.898 Y201.898 F60000
N15303 G1 F4421.739
N15304 M204 S8000
N15305 G1 X158.102 Y201.898 E1.08675
N15306 G1 X158.102 Y118.102 E2.69457
N15307 G1 X191.898 Y118.102 E1.08675
N15308 G1 X191.898 Y201.838 E2.69264
N15309 ; COOLING_NODE: 0
N15310 M204 S10000
N15311 G1 X192.29 Y202.29 F60000
N15312 ; FEATURE: Outer wall
N15313 ; LINE_WIDTH: 0.42
N15314 G1 F4773.528
N15315 M204 S5000
N15316 G1 X157.71 Y202.29 E1.03002
N15317 G1 X157.71 Y117.71 E2.51935
N15318 G1 X192.29 Y117.71 E1.03002
N15319 G1 X192.29 Y202.23 E2.51756
N15320 G1 E-.8 F1800
N15321 M204 S10000
N15322 G1 X190.058 Y200.736 Z13.2 F60000
N15323 G1 Z12.8
N15324 G1 E.8 F1800
N15325 ; FEATURE: Sparse infill
N15326 ; LINE_WIDTH: 0.45
N15327 G1 F4421.739
N15328 M204 S8000
N15329 G1 X188.43 Y200.736 E.05236
N15330 G1 X190.736 Y192.131 E.28646
N15331 G1 X190.736 Y190.44 E.05436
N15332 G1 X159.264 Y198.873 E1.0477
N15333 G1 X159.264 Y200.548 E.05387
N15334 G1 X159.452 Y200.736 E.00852
N15335 G1 X163.143 Y200.736 E.11871
N15336 M73 P80 R12
N15337 G1 X184.974 Y119.264 E2.71223
N15338 G1 X181.606 Y119.264 E.10828
N15339 G1 X190.736 Y128.394 E.41516
N15340 G1 X190.736 Y129.217 E.02648
N15341 G1 X171.572 Y200.736 E2.38089
N15342 G1 X170.966 Y200.736 E.0195
N15343 G1 X159.264 Y189.034 E.53213
N15344 G1 X159.264 Y190.444 E.04534
N15345 G1 X190.736 Y182.012 E1.0477
N15346 G1 X190.736 Y185.963 E.12708
N15347 G1 X159.264 Y154.492 E1.43118
N15348 G1 X159.264 Y152.299 E.07053
N15349 G1 X168.116 Y119.264 E1.09974
N15350 G1 X170.092 Y119.264 E.06355
N15351 G1 X190.736 Y139.908 E.93877
N15352 G1 X190.736 Y139.868 E.00129
N15353 G1 X159.264 Y148.3 E1.04769
N15354 G1 X159.264 Y146.672 E.05236
N15355 M204 S10000
N15356 G1 X159.264 Y158.357 F60000
N15357 G1 F4421.739
N15358 M204 S8000
N15359 G1 X159.264 Y156.729 E.05236
N15360 G1 X190.736 Y148.296 E1.0477
N15361 G1 X190.736 Y151.422 E.1005
N15362 G1 X159.264 Y119.951 E1.43118
N15363 M204 S10000
N15364 G1 X161.316 Y119.264 F60000
N15365 G1 F4421.739
N15366 M204 S8000
N15367 G1 X159.687 Y119.264 E.05236
N15368 G1 X159.264 Y120.842 E.05253
N15369 G1 X159.264 Y123.014 E.06983
N15370 G1 X173.257 Y119.264 E.46583
N15371 G1 X176.545 Y119.264 E.10572
N15372 G1 X159.264 Y183.756 E2.14696
N15373 G1 X159.264 Y185.384 E.05236
N15374 M204 S10000
N15375 G1 X159.264 Y180.387 F60000
N15376 G1 F4421.739
N15377 M204 S8000
N15378 G1 X159.264 Y182.015 E.05236
N15379 G1 X190.736 Y173.583 E1.0477
N15380 G1 X190.736 Y174.449 E.02787
N15381 G1 X159.264 Y142.978 E1.43118
N15382 G1 X159.264 Y139.871 E.09991
N15383 G1 X190.736 Y131.439 E1.0477
N15384 G1 X190.736 Y133.067 E.05236
N15385 M204 S10000
N15386 G1 X190.736 Y121.382 F60000
N15387 G1 F4421.739
N15388 M204 S8000
N15389 G1 X190.736 Y123.01 E.05236
N15390 G1 X159.264 Y131.443 E1.0477
N15391 G1 X159.264 Y131.464 E.0007
N15392 G1 X190.736 Y162.936 E1.43118
N15393 G1 X190.736 Y165.154 E.07133
N15394 G1 X159.264 Y173.587 E1.0477
N15395 G1 X159.264 Y177.52 E.12649
N15396 G1 X182.48 Y200.736 E1.05574
N15397 G1 X183.77 Y200.736 E.04149
N15398 G1 X190.736 Y198.869 E.23189
N15399 G1 X190.736 Y197.477 E.04475
N15400 G1 X159.264 Y166.006 E1.43118
N15401 G1 X159.264 Y165.158 E.02729
N15402 G1 X190.736 Y156.725 E1.0477
N15403 G1 X190.736 Y160.674 E.12698
N15404 G1 X180.001 Y200.736 E1.33368
N15405 G1 X178.373 Y200.736 E.05236
N15406 ; WIPE_START
N15407 G1 X180.001 Y200.736 E-.61876
N15408 G1 X180.097 Y200.377 E-.14124
N15409 ; WIPE_END
N15410 G1 E-.04 F1800
N15411 M204 S10000
N15412 G17
N15413 G3 Z13.2 I1.217 J0 P1  F60000
N15414 ; stop printing object, unique label id: 372
N15415 M625
N15416 ; object ids of layer 64 start: 372
N15417 M624 AQAAAAAAAAA=
N15418 ;======== H2D 20250527========
N15419 ; SKIPPABLE_START
N15420 ; SKIPTYPE: timelapse
N15421 M622.1 S1 ; for prev firware, default turned on
N15422 
N15423 M1002 judge_flag timelapse_record_flag
N15424 
N15425 M622 J1
N15426 M993 A2 B2 C2
N15427 M993 A0 B0 C0
N15428 
N15429 
N15430 
N15431 
N15432     M9711 M0 E1 X261 Y132 Z13.2 S11 C10 O0 T3000
N15433 
N15434 
N15435 
N15436 M993 A3 B3 C3
N15437 
N15438 M623
N15439 ; SKIPPABLE_END
N15440 
N15441 ; object ids of this layer64 end: 372
N15442 M625
N15443 ; CHANGE_LAYER
N15444 ; Z_HEIGHT: 13
N15445 ; LAYER_HEIGHT: 0.2
N15446 ;======== H2D 20250521========
N15447 ; layer num/total_layer_count: 65/75
N15448 ; update layer progress
N15449 M73 L65
N15450 M991 S0 P64 ;notify layer change
N15451 
N15452 
N15453 ; OBJECT_ID: 372
N15454 ; COOLING_NODE: 0
N15455 ; start printing object, unique label id: 372
N15456 M624 AQAAAAAAAAA=
N15457 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=12.900G1 Z12.900 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N15287 G1 X158.916 Y201.084 E1.03439
N15288 G1 X158.916 Y118.916 E2.64221
N15289 G1 X191.084 Y118.916 E1.03439
N15290 G1 X191.084 Y201.024 E2.64028
N15296 G1 X158.509 Y201.491 E1.06057
N15297 G1 X158.509 Y118.509 E2.66839
N15298 G1 X191.491 Y118.509 E1.06057
N15299 G1 X191.491 Y201.431 E2.66646
N15305 G1 X158.102 Y201.898 E1.08675
N15306 G1 X158.102 Y118.102 E2.69457
N15307 G1 X191.898 Y118.102 E1.08675
N15308 G1 X191.898 Y201.838 E2.69264
N15316 G1 X157.71 Y202.29 E1.03002
N15317 G1 X157.71 Y117.71 E2.51935
N15318 G1 X192.29 Y117.71 E1.03002
N15319 G1 X192.29 Y202.23 E2.51756
N15329 G1 X188.43 Y200.736 E.05236
N15330 G1 X190.736 Y192.131 E.28646
N15331 G1 X190.736 Y190.44 E.05436
N15332 G1 X159.264 Y198.873 E1.0477
N15333 G1 X159.264 Y200.548 E.05387
N15334 G1 X159.452 Y200.736 E.00852
N15335 G1 X163.143 Y200.736 E.11871
N15337 G1 X184.974 Y119.264 E2.71223
N15338 G1 X181.606 Y119.264 E.10828
N15339 G1 X190.736 Y128.394 E.41516
N15340 G1 X190.736 Y129.217 E.02648
N15341 G1 X171.572 Y200.736 E2.38089
N15342 G1 X170.966 Y200.736 E.0195
N15343 G1 X159.264 Y189.034 E.53213
N15344 G1 X159.264 Y190.444 E.04534
N15345 G1 X190.736 Y182.012 E1.0477
N15346 G1 X190.736 Y185.963 E.12708
N15347 G1 X159.264 Y154.492 E1.43118
N15348 G1 X159.264 Y152.299 E.07053
N15349 G1 X168.116 Y119.264 E1.09974
N15350 G1 X170.092 Y119.264 E.06355
N15351 G1 X190.736 Y139.908 E.93877
N15352 G1 X190.736 Y139.868 E.00129
N15353 G1 X159.264 Y148.3 E1.04769
N15354 G1 X159.264 Y146.672 E.05236
N15359 G1 X159.264 Y156.729 E.05236
N15360 G1 X190.736 Y148.296 E1.0477
N15361 G1 X190.736 Y151.422 E.1005
N15362 G1 X159.264 Y119.951 E1.43118
N15367 G1 X159.687 Y119.264 E.05236
N15368 G1 X159.264 Y120.842 E.05253
N15369 G1 X159.264 Y123.014 E.06983
N15370 G1 X173.257 Y119.264 E.46583
N15371 G1 X176.545 Y119.264 E.10572
N15372 G1 X159.264 Y183.756 E2.14696
N15373 G1 X159.264 Y185.384 E.05236
N15378 G1 X159.264 Y182.015 E.05236
N15379 G1 X190.736 Y173.583 E1.0477
N15380 G1 X190.736 Y174.449 E.02787
N15381 G1 X159.264 Y142.978 E1.43118
N15382 G1 X159.264 Y139.871 E.09991
N15383 G1 X190.736 Y131.439 E1.0477
N15384 G1 X190.736 Y133.067 E.05236
N15389 G1 X190.736 Y123.01 E.05236
N15390 G1 X159.264 Y131.443 E1.0477
N15391 G1 X159.264 Y131.464 E.0007
N15392 G1 X190.736 Y162.936 E1.43118
N15393 G1 X190.736 Y165.154 E.07133
N15394 G1 X159.264 Y173.587 E1.0477
N15395 G1 X159.264 Y177.52 E.12649
N15396 G1 X182.48 Y200.736 E1.05574
N15397 G1 X183.77 Y200.736 E.04149
N15398 G1 X190.736 Y198.869 E.23189
N15399 G1 X190.736 Y197.477 E.04475
N15400 G1 X159.264 Y166.006 E1.43118
N15401 G1 X159.264 Y165.158 E.02729
N15402 G1 X190.736 Y156.725 E1.0477
N15403 G1 X190.736 Y160.674 E.12698
N15404 G1 X180.001 Y200.736 E1.33368
N15405 G1 X178.373 Y200.736 E.05236
N15407 G1 X180.001 Y200.736 E-.61876
N15408 G1 X180.097 Y200.377 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN15458 G1 Z13
N15459 G1 E.8 F1800
N15460 ; FEATURE: Inner wall
N15461 ; LINE_WIDTH: 0.45
N15462 ; LAYER_HEIGHT: 0.2
N15463 G1 F4421.739
N15464 M204 S8000
N15465 G1 X158.916 Y201.084 E1.03439
N15466 G1 X158.916 Y118.916 E2.64221
N15467 G1 X191.084 Y118.916 E1.03439
N15468 G1 X191.084 Y201.024 E2.64028
N15469 ; COOLING_NODE: 0
N15470 M204 S10000
N15471 G1 X191.491 Y201.491 F60000
N15472 G1 F4421.739
N15473 M204 S8000
N15474 G1 X158.509 Y201.491 E1.06057
N15475 G1 X158.509 Y118.509 E2.66839
N15476 G1 X191.491 Y118.509 E1.06057
N15477 G1 X191.491 Y201.431 E2.66646
N15478 ; COOLING_NODE: 0
N15479 M204 S10000
N15480 G1 X191.898 Y201.898 F60000
N15481 G1 F4421.739
N15482 M204 S8000
N15483 G1 X158.102 Y201.898 E1.08675
N15484 G1 X158.102 Y118.102 E2.69457
N15485 G1 X191.898 Y118.102 E1.08675
N15486 G1 X191.898 Y201.838 E2.69264
N15487 ; COOLING_NODE: 0
N15488 M204 S10000
N15489 G1 X192.29 Y202.29 F60000
N15490 ; FEATURE: Outer wall
N15491 ; LINE_WIDTH: 0.42
N15492 G1 F4773.528
N15493 M204 S5000
N15494 G1 X157.71 Y202.29 E1.03002
N15495 G1 X157.71 Y117.71 E2.51935
N15496 G1 X192.29 Y117.71 E1.03002
N15497 G1 X192.29 Y202.23 E2.51756
N15498 G1 E-.8 F1800
N15499 M204 S10000
N15500 G1 X189.912 Y200.736 Z13.4 F60000
N15501 G1 Z13
N15502 G1 E.8 F1800
N15503 ; FEATURE: Sparse infill
N15504 ; LINE_WIDTH: 0.45
N15505 G1 F4421.739
N15506 M204 S8000
N15507 G1 X188.283 Y200.736 E.05236
N15508 G1 X190.736 Y191.584 E.30465
N15509 G1 X190.736 Y190.587 E.03208
N15510 G1 X159.264 Y199.019 E1.0477
N15511 G1 X159.264 Y200.348 E.04273
N15512 G1 X159.652 Y200.736 E.01762
N15513 G1 X162.997 Y200.736 E.10757
N15514 G1 X184.827 Y119.264 E2.71223
N15515 G1 X181.806 Y119.264 E.09714
N15516 G1 X190.736 Y128.194 E.40607
N15517 G1 X190.736 Y128.671 E.01535
N15518 G1 X171.426 Y200.736 E2.39908
N15519 G1 X171.166 Y200.736 E.00836
N15520 G1 X159.264 Y188.834 E.54122
N15521 G1 X159.264 Y190.591 E.05648
N15522 G1 X190.736 Y182.158 E1.0477
N15523 G1 X190.736 Y185.763 E.11594
N15524 G1 X159.264 Y154.292 E1.43118
N15525 G1 X159.264 Y151.753 E.08167
N15526 G1 X167.97 Y119.264 E1.08155
N15527 G1 X170.292 Y119.264 E.07469
N15528 G1 X190.736 Y139.708 E.92967
N15529 G1 X190.736 Y140.014 E.00985
N15530 G1 X159.264 Y148.447 E1.0477
N15531 G1 X159.264 Y146.818 E.05236
N15532 M204 S10000
N15533 G1 X159.264 Y158.504 F60000
N15534 G1 F4421.739
N15535 M204 S8000
N15536 M73 P80 R11
N15537 G1 X159.264 Y156.875 E.05236
N15538 G1 X190.736 Y148.443 E1.0477
N15539 G1 X190.736 Y151.222 E.08936
N15540 G1 X159.264 Y119.751 E1.43118
N15541 G1 X159.264 Y120.296 E.01753
N15542 G1 X159.541 Y119.264 E.03434
N15543 G1 X161.169 Y119.264 E.05236
N15544 M204 S10000
N15545 G1 X159.264 Y124.789 F60000
N15546 G1 F4421.739
N15547 M204 S8000
N15548 G1 X159.264 Y123.16 E.05236
N15549 G1 X173.804 Y119.264 E.48402
N15550 G1 X176.398 Y119.264 E.08344
N15551 G1 X159.264 Y183.209 E2.12877
N15552 G1 X159.264 Y184.838 E.05236
N15553 M204 S10000
N15554 G1 X159.264 Y182.162 F60000
N15555 G1 F4421.739
N15556 M204 S8000
N15557 G1 X190.736 Y173.729 E1.0477
N15558 G1 X190.736 Y174.249 E.01673
N15559 G1 X159.264 Y142.778 E1.43118
N15560 G1 X159.264 Y140.018 E.08877
N15561 G1 X190.736 Y131.585 E1.0477
N15562 G1 X190.736 Y133.213 E.05236
N15563 M204 S10000
N15564 G1 X190.736 Y121.528 F60000
N15565 G1 F4421.739
N15566 M204 S8000
N15567 G1 X190.736 Y123.156 E.05236
N15568 G1 X159.264 Y131.589 E1.0477
N15569 G1 X159.264 Y131.264 E.01044
N15570 G1 X190.736 Y162.736 E1.43118
N15571 G1 X190.736 Y165.3 E.08247
N15572 G1 X159.264 Y173.733 E1.0477
N15573 G1 X159.264 Y177.32 E.11535
N15574 M73 P81 R11
N15575 G1 X182.68 Y200.736 E1.06483
N15576 G1 X184.316 Y200.736 E.05262
N15577 G1 X190.736 Y199.015 E.2137
N15578 G1 X190.736 Y197.277 E.05589
N15579 G1 X159.264 Y165.806 E1.43118
N15580 G1 X159.264 Y165.304 E.01615
N15581 G1 X190.736 Y156.872 E1.0477
N15582 G1 X190.736 Y160.128 E.1047
N15583 G1 X179.855 Y200.736 E1.35187
N15584 G1 X178.226 Y200.736 E.05236
N15585 ; WIPE_START
N15586 G1 X179.855 Y200.736 E-.61876
N15587 G1 X179.951 Y200.377 E-.14124
N15588 ; WIPE_END
N15589 G1 E-.04 F1800
N15590 M204 S10000
N15591 G17
N15592 G3 Z13.4 I1.217 J0 P1  F60000
N15593 ; stop printing object, unique label id: 372
N15594 M625
N15595 ; object ids of layer 65 start: 372
N15596 M624 AQAAAAAAAAA=
N15597 ;======== H2D 20250527========
N15598 ; SKIPPABLE_START
N15599 ; SKIPTYPE: timelapse
N15600 M622.1 S1 ; for prev firware, default turned on
N15601 
N15602 M1002 judge_flag timelapse_record_flag
N15603 
N15604 M622 J1
N15605 M993 A2 B2 C2
N15606 M993 A0 B0 C0
N15607 
N15608 
N15609 
N15610 
N15611     M9711 M0 E1 X261 Y132 Z13.4 S11 C10 O0 T3000
N15612 
N15613 
N15614 
N15615 M993 A3 B3 C3
N15616 
N15617 M623
N15618 ; SKIPPABLE_END
N15619 
N15620 ; object ids of this layer65 end: 372
N15621 M625
N15622 ; CHANGE_LAYER
N15623 ; Z_HEIGHT: 13.2
N15624 ; LAYER_HEIGHT: 0.2
N15625 ;======== H2D 20250521========
N15626 ; layer num/total_layer_count: 66/75
N15627 ; update layer progress
N15628 M73 L66
N15629 M991 S0 P65 ;notify layer change
N15630 
N15631 
N15632 ; OBJECT_ID: 372
N15633 ; COOLING_NODE: 0
N15634 ; start printing object, unique label id: 372
N15635 M624 AQAAAAAAAAA=
N15636 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=13.100G1 Z13.100 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N15465 G1 X158.916 Y201.084 E1.03439
N15466 G1 X158.916 Y118.916 E2.64221
N15467 G1 X191.084 Y118.916 E1.03439
N15468 G1 X191.084 Y201.024 E2.64028
N15474 G1 X158.509 Y201.491 E1.06057
N15475 G1 X158.509 Y118.509 E2.66839
N15476 G1 X191.491 Y118.509 E1.06057
N15477 G1 X191.491 Y201.431 E2.66646
N15483 G1 X158.102 Y201.898 E1.08675
N15484 G1 X158.102 Y118.102 E2.69457
N15485 G1 X191.898 Y118.102 E1.08675
N15486 G1 X191.898 Y201.838 E2.69264
N15494 G1 X157.71 Y202.29 E1.03002
N15495 G1 X157.71 Y117.71 E2.51935
N15496 G1 X192.29 Y117.71 E1.03002
N15497 G1 X192.29 Y202.23 E2.51756
N15507 G1 X188.283 Y200.736 E.05236
N15508 G1 X190.736 Y191.584 E.30465
N15509 G1 X190.736 Y190.587 E.03208
N15510 G1 X159.264 Y199.019 E1.0477
N15511 G1 X159.264 Y200.348 E.04273
N15512 G1 X159.652 Y200.736 E.01762
N15513 G1 X162.997 Y200.736 E.10757
N15514 G1 X184.827 Y119.264 E2.71223
N15515 G1 X181.806 Y119.264 E.09714
N15516 G1 X190.736 Y128.194 E.40607
N15517 G1 X190.736 Y128.671 E.01535
N15518 G1 X171.426 Y200.736 E2.39908
N15519 G1 X171.166 Y200.736 E.00836
N15520 G1 X159.264 Y188.834 E.54122
N15521 G1 X159.264 Y190.591 E.05648
N15522 G1 X190.736 Y182.158 E1.0477
N15523 G1 X190.736 Y185.763 E.11594
N15524 G1 X159.264 Y154.292 E1.43118
N15525 G1 X159.264 Y151.753 E.08167
N15526 G1 X167.97 Y119.264 E1.08155
N15527 G1 X170.292 Y119.264 E.07469
N15528 G1 X190.736 Y139.708 E.92967
N15529 G1 X190.736 Y140.014 E.00985
N15530 G1 X159.264 Y148.447 E1.0477
N15531 G1 X159.264 Y146.818 E.05236
N15537 G1 X159.264 Y156.875 E.05236
N15538 G1 X190.736 Y148.443 E1.0477
N15539 G1 X190.736 Y151.222 E.08936
N15540 G1 X159.264 Y119.751 E1.43118
N15541 G1 X159.264 Y120.296 E.01753
N15542 G1 X159.541 Y119.264 E.03434
N15543 G1 X161.169 Y119.264 E.05236
N15548 G1 X159.264 Y123.16 E.05236
N15549 G1 X173.804 Y119.264 E.48402
N15550 G1 X176.398 Y119.264 E.08344
N15551 G1 X159.264 Y183.209 E2.12877
N15552 G1 X159.264 Y184.838 E.05236
N15557 G1 X190.736 Y173.729 E1.0477
N15558 G1 X190.736 Y174.249 E.01673
N15559 G1 X159.264 Y142.778 E1.43118
N15560 G1 X159.264 Y140.018 E.08877
N15561 G1 X190.736 Y131.585 E1.0477
N15562 G1 X190.736 Y133.213 E.05236
N15567 G1 X190.736 Y123.156 E.05236
N15568 G1 X159.264 Y131.589 E1.0477
N15569 G1 X159.264 Y131.264 E.01044
N15570 G1 X190.736 Y162.736 E1.43118
N15571 G1 X190.736 Y165.3 E.08247
N15572 G1 X159.264 Y173.733 E1.0477
N15573 G1 X159.264 Y177.32 E.11535
N15575 G1 X182.68 Y200.736 E1.06483
N15576 G1 X184.316 Y200.736 E.05262
N15577 G1 X190.736 Y199.015 E.2137
N15578 G1 X190.736 Y197.277 E.05589
N15579 G1 X159.264 Y165.806 E1.43118
N15580 G1 X159.264 Y165.304 E.01615
N15581 G1 X190.736 Y156.872 E1.0477
N15582 G1 X190.736 Y160.128 E.1047
N15583 G1 X179.855 Y200.736 E1.35187
N15584 G1 X178.226 Y200.736 E.05236
N15586 G1 X179.855 Y200.736 E-.61876
N15587 G1 X179.951 Y200.377 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN15637 G1 Z13.2
N15638 G1 E.8 F1800
N15639 ; FEATURE: Inner wall
N15640 ; LINE_WIDTH: 0.45
N15641 ; LAYER_HEIGHT: 0.2
N15642 G1 F4421.739
N15643 M204 S8000
N15644 G1 X158.916 Y201.084 E1.03439
N15645 G1 X158.916 Y118.916 E2.64221
N15646 G1 X191.084 Y118.916 E1.03439
N15647 G1 X191.084 Y201.024 E2.64028
N15648 ; COOLING_NODE: 0
N15649 M204 S10000
N15650 G1 X191.491 Y201.491 F60000
N15651 G1 F4421.739
N15652 M204 S8000
N15653 G1 X158.509 Y201.491 E1.06057
N15654 G1 X158.509 Y118.509 E2.66839
N15655 G1 X191.491 Y118.509 E1.06057
N15656 G1 X191.491 Y201.431 E2.66646
N15657 ; COOLING_NODE: 0
N15658 M204 S10000
N15659 G1 X191.898 Y201.898 F60000
N15660 G1 F4421.739
N15661 M204 S8000
N15662 G1 X158.102 Y201.898 E1.08675
N15663 G1 X158.102 Y118.102 E2.69457
N15664 G1 X191.898 Y118.102 E1.08675
N15665 G1 X191.898 Y201.838 E2.69264
N15666 ; COOLING_NODE: 0
N15667 M204 S10000
N15668 G1 X192.29 Y202.29 F60000
N15669 ; FEATURE: Outer wall
N15670 ; LINE_WIDTH: 0.42
N15671 G1 F4773.528
N15672 M204 S5000
N15673 G1 X157.71 Y202.29 E1.03002
N15674 G1 X157.71 Y117.71 E2.51935
N15675 G1 X192.29 Y117.71 E1.03002
N15676 G1 X192.29 Y202.23 E2.51756
N15677 G1 E-.8 F1800
N15678 M204 S10000
N15679 G1 X189.765 Y200.736 Z13.6 F60000
N15680 G1 Z13.2
N15681 G1 E.8 F1800
N15682 ; FEATURE: Sparse infill
N15683 ; LINE_WIDTH: 0.45
N15684 G1 F4421.739
N15685 M204 S8000
N15686 G1 X188.137 Y200.736 E.05236
N15687 G1 X190.736 Y191.038 E.32284
N15688 G1 X190.736 Y190.733 E.0098
N15689 G1 X159.264 Y199.166 E1.0477
N15690 G1 X159.264 Y200.148 E.03159
N15691 G1 X159.852 Y200.736 E.02671
N15692 G1 X162.851 Y200.736 E.09643
N15693 G1 X184.681 Y119.264 E2.71223
N15694 G1 X182.006 Y119.264 E.086
N15695 G1 X190.736 Y127.994 E.39697
N15696 G1 X190.736 Y128.125 E.00421
N15697 G1 X171.279 Y200.736 E2.41727
N15698 G1 X171.366 Y200.736 E.00278
N15699 G1 X159.264 Y188.634 E.55032
N15700 G1 X159.264 Y190.737 E.06762
N15701 G1 X190.736 Y182.304 E1.04769
N15702 G1 X190.736 Y185.563 E.1048
N15703 G1 X159.264 Y154.092 E1.43118
N15704 G1 X159.264 Y151.206 E.09281
N15705 G1 X167.823 Y119.264 E1.06336
N15706 G1 X170.492 Y119.264 E.08583
N15707 G1 X190.736 Y139.508 E.92058
N15708 G1 X190.736 Y140.16 E.02099
N15709 G1 X159.264 Y148.593 E1.0477
N15710 G1 X159.264 Y146.965 E.05236
N15711 M204 S10000
N15712 G1 X159.264 Y158.65 F60000
N15713 G1 F4421.739
N15714 M204 S8000
N15715 G1 X159.264 Y157.022 E.05236
N15716 G1 X190.736 Y148.589 E1.0477
N15717 G1 X190.736 Y151.022 E.07822
N15718 G1 X159.264 Y119.551 E1.43118
N15719 G1 X159.264 Y123.307 E.12078
N15720 G1 X174.35 Y119.264 E.50221
N15721 G1 X176.252 Y119.264 E.06116
N15722 G1 X159.264 Y182.663 E2.11058
N15723 G1 X159.264 Y182.308 E.0114
N15724 G1 X190.736 Y173.876 E1.0477
N15725 G1 X190.736 Y174.049 E.00559
N15726 G1 X159.264 Y142.578 E1.43118
N15727 G1 X159.264 Y140.164 E.07763
N15728 G1 X190.736 Y131.732 E1.0477
N15729 G1 X190.736 Y133.36 E.05236
N15730 M204 S10000
N15731 G1 X190.736 Y121.674 F60000
N15732 G1 F4421.739
N15733 M204 S8000
N15734 G1 X190.736 Y123.303 E.05236
N15735 G1 X159.264 Y131.735 E1.04769
N15736 G1 X159.264 Y131.064 E.02157
N15737 G1 X190.736 Y162.536 E1.43118
N15738 G1 X190.736 Y165.447 E.09361
N15739 G1 X159.264 Y173.879 E1.0477
N15740 G1 X159.264 Y177.12 E.10421
N15741 G1 X182.88 Y200.736 E1.07393
N15742 G1 X184.863 Y200.736 E.06376
N15743 G1 X190.736 Y199.162 E.19551
N15744 G1 X190.736 Y197.077 E.06703
N15745 G1 X159.264 Y165.606 E1.43118
N15746 G1 X159.264 Y165.451 E.00501
N15747 G1 X190.736 Y157.018 E1.0477
N15748 G1 X190.736 Y159.581 E.08242
N15749 G1 X179.708 Y200.736 E1.37006
N15750 G1 X178.08 Y200.736 E.05236
N15751 ; WIPE_START
N15752 G1 X179.708 Y200.736 E-.61876
N15753 G1 X179.804 Y200.377 E-.14124
N15754 ; WIPE_END
N15755 G1 E-.04 F1800
N15756 M204 S10000
N15757 G17
N15758 G3 Z13.6 I1.217 J0 P1  F60000
N15759 ; stop printing object, unique label id: 372
N15760 M625
N15761 ; object ids of layer 66 start: 372
N15762 M624 AQAAAAAAAAA=
N15763 ;======== H2D 20250527========
N15764 ; SKIPPABLE_START
N15765 ; SKIPTYPE: timelapse
N15766 M622.1 S1 ; for prev firware, default turned on
N15767 
N15768 M1002 judge_flag timelapse_record_flag
N15769 
N15770 M622 J1
N15771 M993 A2 B2 C2
N15772 M993 A0 B0 C0
N15773 
N15774 
N15775 
N15776 
N15777     M9711 M0 E1 X261 Y132 Z13.6 S11 C10 O0 T3000
N15778 
N15779 
N15780 
N15781 M993 A3 B3 C3
N15782 
N15783 M623
N15784 ; SKIPPABLE_END
N15785 
N15786 ; object ids of this layer66 end: 372
N15787 M625
N15788 ; CHANGE_LAYER
N15789 ; Z_HEIGHT: 13.4
N15790 ; LAYER_HEIGHT: 0.2
N15791 ;======== H2D 20250521========
N15792 ; layer num/total_layer_count: 67/75
N15793 ; update layer progress
N15794 M73 L67
N15795 M991 S0 P66 ;notify layer change
N15796 
N15797 
N15798 ; OBJECT_ID: 372
N15799 ; COOLING_NODE: 0
N15800 ; start printing object, unique label id: 372
N15801 M624 AQAAAAAAAAA=
N15802 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=13.300G1 Z13.300 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N15644 G1 X158.916 Y201.084 E1.03439
N15645 G1 X158.916 Y118.916 E2.64221
N15646 G1 X191.084 Y118.916 E1.03439
N15647 G1 X191.084 Y201.024 E2.64028
N15653 G1 X158.509 Y201.491 E1.06057
N15654 G1 X158.509 Y118.509 E2.66839
N15655 G1 X191.491 Y118.509 E1.06057
N15656 G1 X191.491 Y201.431 E2.66646
N15662 G1 X158.102 Y201.898 E1.08675
N15663 G1 X158.102 Y118.102 E2.69457
N15664 G1 X191.898 Y118.102 E1.08675
N15665 G1 X191.898 Y201.838 E2.69264
N15673 G1 X157.71 Y202.29 E1.03002
N15674 G1 X157.71 Y117.71 E2.51935
N15675 G1 X192.29 Y117.71 E1.03002
N15676 G1 X192.29 Y202.23 E2.51756
N15686 G1 X188.137 Y200.736 E.05236
N15687 G1 X190.736 Y191.038 E.32284
N15688 G1 X190.736 Y190.733 E.0098
N15689 G1 X159.264 Y199.166 E1.0477
N15690 G1 X159.264 Y200.148 E.03159
N15691 G1 X159.852 Y200.736 E.02671
N15692 G1 X162.851 Y200.736 E.09643
N15693 G1 X184.681 Y119.264 E2.71223
N15694 G1 X182.006 Y119.264 E.086
N15695 G1 X190.736 Y127.994 E.39697
N15696 G1 X190.736 Y128.125 E.00421
N15697 G1 X171.279 Y200.736 E2.41727
N15698 G1 X171.366 Y200.736 E.00278
N15699 G1 X159.264 Y188.634 E.55032
N15700 G1 X159.264 Y190.737 E.06762
N15701 G1 X190.736 Y182.304 E1.04769
N15702 G1 X190.736 Y185.563 E.1048
N15703 G1 X159.264 Y154.092 E1.43118
N15704 G1 X159.264 Y151.206 E.09281
N15705 G1 X167.823 Y119.264 E1.06336
N15706 G1 X170.492 Y119.264 E.08583
N15707 G1 X190.736 Y139.508 E.92058
N15708 G1 X190.736 Y140.16 E.02099
N15709 G1 X159.264 Y148.593 E1.0477
N15710 G1 X159.264 Y146.965 E.05236
N15715 G1 X159.264 Y157.022 E.05236
N15716 G1 X190.736 Y148.589 E1.0477
N15717 G1 X190.736 Y151.022 E.07822
N15718 G1 X159.264 Y119.551 E1.43118
N15719 G1 X159.264 Y123.307 E.12078
N15720 G1 X174.35 Y119.264 E.50221
N15721 G1 X176.252 Y119.264 E.06116
N15722 G1 X159.264 Y182.663 E2.11058
N15723 G1 X159.264 Y182.308 E.0114
N15724 G1 X190.736 Y173.876 E1.0477
N15725 G1 X190.736 Y174.049 E.00559
N15726 G1 X159.264 Y142.578 E1.43118
N15727 G1 X159.264 Y140.164 E.07763
N15728 G1 X190.736 Y131.732 E1.0477
N15729 G1 X190.736 Y133.36 E.05236
N15734 G1 X190.736 Y123.303 E.05236
N15735 G1 X159.264 Y131.735 E1.04769
N15736 G1 X159.264 Y131.064 E.02157
N15737 G1 X190.736 Y162.536 E1.43118
N15738 G1 X190.736 Y165.447 E.09361
N15739 G1 X159.264 Y173.879 E1.0477
N15740 G1 X159.264 Y177.12 E.10421
N15741 G1 X182.88 Y200.736 E1.07393
N15742 G1 X184.863 Y200.736 E.06376
N15743 G1 X190.736 Y199.162 E.19551
N15744 G1 X190.736 Y197.077 E.06703
N15745 G1 X159.264 Y165.606 E1.43118
N15746 G1 X159.264 Y165.451 E.00501
N15747 G1 X190.736 Y157.018 E1.0477
N15748 G1 X190.736 Y159.581 E.08242
N15749 G1 X179.708 Y200.736 E1.37006
N15750 G1 X178.08 Y200.736 E.05236
N15752 G1 X179.708 Y200.736 E-.61876
N15753 G1 X179.804 Y200.377 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN15803 G1 Z13.4
N15804 G1 E.8 F1800
N15805 ; FEATURE: Inner wall
N15806 ; LINE_WIDTH: 0.45
N15807 ; LAYER_HEIGHT: 0.2
N15808 G1 F4421.739
N15809 M204 S8000
N15810 G1 X158.916 Y201.084 E1.03439
N15811 G1 X158.916 Y118.916 E2.64221
N15812 G1 X191.084 Y118.916 E1.03439
N15813 G1 X191.084 Y201.024 E2.64028
N15814 ; COOLING_NODE: 0
N15815 M204 S10000
N15816 G1 X191.491 Y201.491 F60000
N15817 G1 F4421.739
N15818 M204 S8000
N15819 G1 X158.509 Y201.491 E1.06057
N15820 G1 X158.509 Y118.509 E2.66839
N15821 G1 X191.491 Y118.509 E1.06057
N15822 G1 X191.491 Y201.431 E2.66646
N15823 ; COOLING_NODE: 0
N15824 M204 S10000
N15825 G1 X191.898 Y201.898 F60000
N15826 G1 F4421.739
N15827 M204 S8000
N15828 G1 X158.102 Y201.898 E1.08675
N15829 G1 X158.102 Y118.102 E2.69457
N15830 G1 X191.898 Y118.102 E1.08675
N15831 G1 X191.898 Y201.838 E2.69264
N15832 ; COOLING_NODE: 0
N15833 M204 S10000
N15834 G1 X192.29 Y202.29 F60000
N15835 ; FEATURE: Outer wall
N15836 ; LINE_WIDTH: 0.42
N15837 M73 P82 R11
N15838 G1 F4773.528
N15839 M204 S5000
N15840 G1 X157.71 Y202.29 E1.03002
N15841 G1 X157.71 Y117.71 E2.51935
N15842 G1 X192.29 Y117.71 E1.03002
N15843 G1 X192.29 Y202.23 E2.51756
N15844 G1 E-.8 F1800
N15845 M204 S10000
N15846 G1 X189.619 Y200.736 Z13.8 F60000
N15847 G1 Z13.4
N15848 G1 E.8 F1800
N15849 ; FEATURE: Sparse infill
N15850 ; LINE_WIDTH: 0.45
N15851 G1 F4421.739
N15852 M204 S8000
N15853 G1 X187.991 Y200.736 E.05236
N15854 G1 X190.736 Y190.491 E.34103
N15855 G1 X190.736 Y190.88 E.01248
N15856 G1 X159.264 Y199.312 E1.0477
N15857 G1 X159.264 Y199.948 E.02045
N15858 G1 X160.052 Y200.736 E.03581
N15859 G1 X162.704 Y200.736 E.08529
N15860 G1 X184.534 Y119.264 E2.71223
N15861 G1 X182.206 Y119.264 E.07486
N15862 G1 X190.736 Y127.794 E.38788
N15863 G1 X190.736 Y127.578 E.00693
N15864 G1 X171.133 Y200.736 E2.43547
N15865 G1 X171.566 Y200.736 E.01392
N15866 G1 X159.264 Y188.434 E.55942
N15867 G1 X159.264 Y190.883 E.07876
N15868 G1 X190.736 Y182.451 E1.04769
N15869 G1 X190.736 Y185.363 E.09366
N15870 G1 X159.264 Y153.892 E1.43118
N15871 G1 X159.264 Y150.66 E.10395
N15872 G1 X167.677 Y119.264 E1.04517
N15873 G1 X170.692 Y119.264 E.09697
N15874 G1 X190.736 Y139.308 E.91148
N15875 G1 X190.736 Y140.307 E.03213
N15876 G1 X159.264 Y148.739 E1.0477
N15877 G1 X159.264 Y147.111 E.05236
N15878 M204 S10000
N15879 G1 X159.264 Y158.797 F60000
N15880 G1 F4421.739
N15881 M204 S8000
N15882 G1 X159.264 Y157.168 E.05236
N15883 G1 X190.736 Y148.736 E1.0477
N15884 G1 X190.736 Y150.822 E.06708
N15885 G1 X159.264 Y119.351 E1.43118
N15886 G1 X159.264 Y123.453 E.13192
N15887 G1 X174.896 Y119.264 E.5204
N15888 G1 X176.106 Y119.264 E.03888
N15889 G1 X159.264 Y182.116 E2.09239
N15890 G1 X159.264 Y182.455 E.01088
N15891 G1 X190.736 Y174.022 E1.0477
N15892 G1 X190.736 Y173.849 E.00555
N15893 G1 X159.264 Y142.378 E1.43118
N15894 G1 X159.264 Y140.311 E.06649
N15895 G1 X190.736 Y131.878 E1.0477
N15896 G1 X190.736 Y133.506 E.05236
N15897 M204 S10000
N15898 G1 X190.736 Y121.821 F60000
N15899 G1 F4421.739
N15900 M204 S8000
N15901 G1 X190.736 Y123.449 E.05236
N15902 G1 X159.264 Y131.882 E1.04769
N15903 G1 X159.264 Y130.864 E.03271
N15904 G1 X190.736 Y162.336 E1.43118
N15905 G1 X190.736 Y165.593 E.10475
N15906 G1 X159.264 Y174.026 E1.04769
N15907 G1 X159.264 Y176.92 E.09308
N15908 G1 X183.08 Y200.736 E1.08302
N15909 G1 X185.409 Y200.736 E.0749
N15910 M73 P82 R10
N15911 G1 X190.736 Y199.308 E.17732
N15912 G1 X190.736 Y196.877 E.07817
N15913 G1 X159.264 Y165.406 E1.43118
N15914 G1 X159.264 Y165.597 E.00613
N15915 G1 X190.736 Y157.164 E1.0477
N15916 G1 X190.736 Y159.035 E.06014
N15917 G1 X179.562 Y200.736 E1.38825
N15918 G1 X177.934 Y200.736 E.05236
N15919 ; WIPE_START
N15920 G1 X179.562 Y200.736 E-.61876
N15921 G1 X179.658 Y200.377 E-.14124
N15922 ; WIPE_END
N15923 G1 E-.04 F1800
N15924 M204 S10000
N15925 G17
N15926 G3 Z13.8 I1.217 J0 P1  F60000
N15927 ; stop printing object, unique label id: 372
N15928 M625
N15929 ; object ids of layer 67 start: 372
N15930 M624 AQAAAAAAAAA=
N15931 ;======== H2D 20250527========
N15932 ; SKIPPABLE_START
N15933 ; SKIPTYPE: timelapse
N15934 M622.1 S1 ; for prev firware, default turned on
N15935 
N15936 M1002 judge_flag timelapse_record_flag
N15937 
N15938 M622 J1
N15939 M993 A2 B2 C2
N15940 M993 A0 B0 C0
N15941 
N15942 
N15943 
N15944 
N15945     M9711 M0 E1 X261 Y132 Z13.8 S11 C10 O0 T3000
N15946 
N15947 
N15948 
N15949 M993 A3 B3 C3
N15950 
N15951 M623
N15952 ; SKIPPABLE_END
N15953 
N15954 ; object ids of this layer67 end: 372
N15955 M625
N15956 ; CHANGE_LAYER
N15957 ; Z_HEIGHT: 13.6
N15958 ; LAYER_HEIGHT: 0.200001
N15959 ;======== H2D 20250521========
N15960 ; layer num/total_layer_count: 68/75
N15961 ; update layer progress
N15962 M73 L68
N15963 M991 S0 P67 ;notify layer change
N15964 
N15965 
N15966 ; OBJECT_ID: 372
N15967 ; COOLING_NODE: 0
N15968 ; start printing object, unique label id: 372
N15969 M624 AQAAAAAAAAA=
N15970 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=13.500G1 Z13.500 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N15810 G1 X158.916 Y201.084 E1.03439
N15811 G1 X158.916 Y118.916 E2.64221
N15812 G1 X191.084 Y118.916 E1.03439
N15813 G1 X191.084 Y201.024 E2.64028
N15819 G1 X158.509 Y201.491 E1.06057
N15820 G1 X158.509 Y118.509 E2.66839
N15821 G1 X191.491 Y118.509 E1.06057
N15822 G1 X191.491 Y201.431 E2.66646
N15828 G1 X158.102 Y201.898 E1.08675
N15829 G1 X158.102 Y118.102 E2.69457
N15830 G1 X191.898 Y118.102 E1.08675
N15831 G1 X191.898 Y201.838 E2.69264
N15840 G1 X157.71 Y202.29 E1.03002
N15841 G1 X157.71 Y117.71 E2.51935
N15842 G1 X192.29 Y117.71 E1.03002
N15843 G1 X192.29 Y202.23 E2.51756
N15853 G1 X187.991 Y200.736 E.05236
N15854 G1 X190.736 Y190.491 E.34103
N15855 G1 X190.736 Y190.88 E.01248
N15856 G1 X159.264 Y199.312 E1.0477
N15857 G1 X159.264 Y199.948 E.02045
N15858 G1 X160.052 Y200.736 E.03581
N15859 G1 X162.704 Y200.736 E.08529
N15860 G1 X184.534 Y119.264 E2.71223
N15861 G1 X182.206 Y119.264 E.07486
N15862 G1 X190.736 Y127.794 E.38788
N15863 G1 X190.736 Y127.578 E.00693
N15864 G1 X171.133 Y200.736 E2.43547
N15865 G1 X171.566 Y200.736 E.01392
N15866 G1 X159.264 Y188.434 E.55942
N15867 G1 X159.264 Y190.883 E.07876
N15868 G1 X190.736 Y182.451 E1.04769
N15869 G1 X190.736 Y185.363 E.09366
N15870 G1 X159.264 Y153.892 E1.43118
N15871 G1 X159.264 Y150.66 E.10395
N15872 G1 X167.677 Y119.264 E1.04517
N15873 G1 X170.692 Y119.264 E.09697
N15874 G1 X190.736 Y139.308 E.91148
N15875 G1 X190.736 Y140.307 E.03213
N15876 G1 X159.264 Y148.739 E1.0477
N15877 G1 X159.264 Y147.111 E.05236
N15882 G1 X159.264 Y157.168 E.05236
N15883 G1 X190.736 Y148.736 E1.0477
N15884 G1 X190.736 Y150.822 E.06708
N15885 G1 X159.264 Y119.351 E1.43118
N15886 G1 X159.264 Y123.453 E.13192
N15887 G1 X174.896 Y119.264 E.5204
N15888 G1 X176.106 Y119.264 E.03888
N15889 G1 X159.264 Y182.116 E2.09239
N15890 G1 X159.264 Y182.455 E.01088
N15891 G1 X190.736 Y174.022 E1.0477
N15892 G1 X190.736 Y173.849 E.00555
N15893 G1 X159.264 Y142.378 E1.43118
N15894 G1 X159.264 Y140.311 E.06649
N15895 G1 X190.736 Y131.878 E1.0477
N15896 G1 X190.736 Y133.506 E.05236
N15901 G1 X190.736 Y123.449 E.05236
N15902 G1 X159.264 Y131.882 E1.04769
N15903 G1 X159.264 Y130.864 E.03271
N15904 G1 X190.736 Y162.336 E1.43118
N15905 G1 X190.736 Y165.593 E.10475
N15906 G1 X159.264 Y174.026 E1.04769
N15907 G1 X159.264 Y176.92 E.09308
N15908 G1 X183.08 Y200.736 E1.08302
N15909 G1 X185.409 Y200.736 E.0749
N15911 G1 X190.736 Y199.308 E.17732
N15912 G1 X190.736 Y196.877 E.07817
N15913 G1 X159.264 Y165.406 E1.43118
N15914 G1 X159.264 Y165.597 E.00613
N15915 G1 X190.736 Y157.164 E1.0477
N15916 G1 X190.736 Y159.035 E.06014
N15917 G1 X179.562 Y200.736 E1.38825
N15918 G1 X177.934 Y200.736 E.05236
N15920 G1 X179.562 Y200.736 E-.61876
N15921 G1 X179.658 Y200.377 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN15971 G1 Z13.6
N15972 G1 E.8 F1800
N15973 ; FEATURE: Inner wall
N15974 ; LINE_WIDTH: 0.45
N15975 ; LAYER_HEIGHT: 0.2
N15976 G1 F4421.739
N15977 M204 S8000
N15978 G1 X158.916 Y201.084 E1.03439
N15979 G1 X158.916 Y118.916 E2.64221
N15980 G1 X191.084 Y118.916 E1.03439
N15981 G1 X191.084 Y201.024 E2.64028
N15982 ; COOLING_NODE: 0
N15983 M204 S10000
N15984 G1 X191.491 Y201.491 F60000
N15985 G1 F4421.739
N15986 M204 S8000
N15987 G1 X158.509 Y201.491 E1.06057
N15988 G1 X158.509 Y118.509 E2.66839
N15989 G1 X191.491 Y118.509 E1.06057
N15990 G1 X191.491 Y201.431 E2.66646
N15991 ; COOLING_NODE: 0
N15992 M204 S10000
N15993 G1 X191.898 Y201.898 F60000
N15994 G1 F4421.739
N15995 M204 S8000
N15996 G1 X158.102 Y201.898 E1.08675
N15997 G1 X158.102 Y118.102 E2.69457
N15998 G1 X191.898 Y118.102 E1.08675
N15999 G1 X191.898 Y201.838 E2.69264
N16000 ; COOLING_NODE: 0
N16001 M204 S10000
N16002 G1 X192.29 Y202.29 F60000
N16003 ; FEATURE: Outer wall
N16004 ; LINE_WIDTH: 0.42
N16005 G1 F4773.528
N16006 M204 S5000
N16007 G1 X157.71 Y202.29 E1.03002
N16008 G1 X157.71 Y117.71 E2.51935
N16009 G1 X192.29 Y117.71 E1.03002
N16010 G1 X192.29 Y202.23 E2.51756
N16011 G1 E-.8 F1800
N16012 M204 S10000
N16013 G1 X189.473 Y200.736 Z14 F60000
N16014 G1 Z13.6
N16015 G1 E.8 F1800
N16016 ; FEATURE: Sparse infill
N16017 ; LINE_WIDTH: 0.45
N16018 G1 F4421.739
N16019 M204 S8000
N16020 G1 X187.844 Y200.736 E.05236
N16021 G1 X190.736 Y189.945 E.35922
N16022 G1 X190.736 Y188.317 E.05236
N16023 M204 S10000
N16024 G1 X190.736 Y191.026 F60000
N16025 G1 F4421.739
N16026 M204 S8000
N16027 G1 X159.264 Y199.459 E1.0477
N16028 G1 X159.264 Y199.748 E.00931
N16029 G1 X160.252 Y200.736 E.0449
N16030 G1 X162.558 Y200.736 E.07415
N16031 G1 X184.388 Y119.264 E2.71223
N16032 G1 X182.406 Y119.264 E.06372
N16033 G1 X190.736 Y127.594 E.37878
N16034 M204 S10000
N16035 G1 X190.736 Y133.653 F60000
N16036 G1 F4421.739
N16037 M204 S8000
N16038 G1 X190.736 Y132.024 E.05236
N16039 G1 X159.264 Y140.457 E1.0477
N16040 G1 X159.264 Y142.178 E.05535
N16041 G1 X190.736 Y173.649 E1.43118
N16042 G1 X190.736 Y174.168 E.01668
N16043 G1 X159.264 Y182.601 E1.0477
N16044 G1 X159.264 Y181.57 E.03316
N16045 G1 X175.959 Y119.264 E2.07419
N16046 G1 X175.443 Y119.264 E.0166
N16047 G1 X159.264 Y123.599 E.53859
N16048 G1 X159.264 Y119.264 E.1394
N16049 G1 X159.378 Y119.264 E.00366
N16050 G1 X190.736 Y150.622 E1.426
N16051 G1 X190.736 Y148.882 E.05594
N16052 M73 P83 R10
N16053 G1 X159.264 Y157.315 E1.04769
N16054 G1 X159.264 Y158.943 E.05236
N16055 M204 S10000
N16056 G1 X159.264 Y148.886 F60000
N16057 G1 F4421.739
N16058 M204 S8000
N16059 G1 X190.736 Y140.453 E1.0477
N16060 G1 X190.736 Y139.108 E.04327
N16061 G1 X170.892 Y119.264 E.90239
N16062 G1 X167.53 Y119.264 E.10811
N16063 G1 X159.264 Y150.113 E1.02698
N16064 G1 X159.264 Y153.692 E.11509
N16065 G1 X190.736 Y185.163 E1.43118
N16066 G1 X190.736 Y182.597 E.08252
N16067 G1 X159.264 Y191.03 E1.0477
N16068 G1 X159.264 Y188.234 E.0899
N16069 G1 X171.766 Y200.736 E.56851
N16070 G1 X170.987 Y200.736 E.02505
N16071 G1 X190.736 Y127.032 E2.45366
N16072 G1 X190.736 Y123.596 E.11049
N16073 G1 X159.264 Y132.028 E1.0477
N16074 G1 X159.264 Y130.664 E.04385
N16075 G1 X190.736 Y162.136 E1.43118
N16076 G1 X190.736 Y165.74 E.11589
N16077 G1 X159.264 Y174.172 E1.0477
N16078 G1 X159.264 Y176.72 E.08194
N16079 G1 X183.28 Y200.736 E1.09212
N16080 G1 X185.956 Y200.736 E.08604
N16081 G1 X190.736 Y199.455 E.15913
N16082 G1 X190.736 Y196.677 E.08931
N16083 G1 X159.264 Y165.206 E1.43118
N16084 G1 X159.264 Y165.743 E.01727
N16085 G1 X190.736 Y157.311 E1.0477
N16086 G1 X190.736 Y158.488 E.03787
N16087 G1 X179.415 Y200.736 E1.40644
N16088 G1 X177.787 Y200.736 E.05236
N16089 ; WIPE_START
N16090 G1 X179.415 Y200.736 E-.61876
N16091 G1 X179.512 Y200.377 E-.14124
N16092 ; WIPE_END
N16093 G1 E-.04 F1800
N16094 M204 S10000
N16095 G17
N16096 G3 Z14 I1.217 J0 P1  F60000
N16097 ; stop printing object, unique label id: 372
N16098 M625
N16099 ; object ids of layer 68 start: 372
N16100 M624 AQAAAAAAAAA=
N16101 ;======== H2D 20250527========
N16102 ; SKIPPABLE_START
N16103 ; SKIPTYPE: timelapse
N16104 M622.1 S1 ; for prev firware, default turned on
N16105 
N16106 M1002 judge_flag timelapse_record_flag
N16107 
N16108 M622 J1
N16109 M993 A2 B2 C2
N16110 M993 A0 B0 C0
N16111 
N16112 
N16113 
N16114 
N16115     M9711 M0 E1 X261 Y132 Z14 S11 C10 O0 T3000
N16116 
N16117 
N16118 
N16119 M993 A3 B3 C3
N16120 
N16121 M623
N16122 ; SKIPPABLE_END
N16123 
N16124 ; object ids of this layer68 end: 372
N16125 M625
N16126 ; CHANGE_LAYER
N16127 ; Z_HEIGHT: 13.8
N16128 ; LAYER_HEIGHT: 0.2
N16129 ;======== H2D 20250521========
N16130 ; layer num/total_layer_count: 69/75
N16131 ; update layer progress
N16132 M73 L69
N16133 M991 S0 P68 ;notify layer change
N16134 
N16135 
N16136 ; OBJECT_ID: 372
N16137 ; COOLING_NODE: 0
N16138 ; start printing object, unique label id: 372
N16139 M624 AQAAAAAAAAA=
N16140 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=13.700G1 Z13.700 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N15978 G1 X158.916 Y201.084 E1.03439
N15979 G1 X158.916 Y118.916 E2.64221
N15980 G1 X191.084 Y118.916 E1.03439
N15981 G1 X191.084 Y201.024 E2.64028
N15987 G1 X158.509 Y201.491 E1.06057
N15988 G1 X158.509 Y118.509 E2.66839
N15989 G1 X191.491 Y118.509 E1.06057
N15990 G1 X191.491 Y201.431 E2.66646
N15996 G1 X158.102 Y201.898 E1.08675
N15997 G1 X158.102 Y118.102 E2.69457
N15998 G1 X191.898 Y118.102 E1.08675
N15999 G1 X191.898 Y201.838 E2.69264
N16007 G1 X157.71 Y202.29 E1.03002
N16008 G1 X157.71 Y117.71 E2.51935
N16009 G1 X192.29 Y117.71 E1.03002
N16010 G1 X192.29 Y202.23 E2.51756
N16020 G1 X187.844 Y200.736 E.05236
N16021 G1 X190.736 Y189.945 E.35922
N16022 G1 X190.736 Y188.317 E.05236
N16027 G1 X159.264 Y199.459 E1.0477
N16028 G1 X159.264 Y199.748 E.00931
N16029 G1 X160.252 Y200.736 E.0449
N16030 G1 X162.558 Y200.736 E.07415
N16031 G1 X184.388 Y119.264 E2.71223
N16032 G1 X182.406 Y119.264 E.06372
N16033 G1 X190.736 Y127.594 E.37878
N16038 G1 X190.736 Y132.024 E.05236
N16039 G1 X159.264 Y140.457 E1.0477
N16040 G1 X159.264 Y142.178 E.05535
N16041 G1 X190.736 Y173.649 E1.43118
N16042 G1 X190.736 Y174.168 E.01668
N16043 G1 X159.264 Y182.601 E1.0477
N16044 G1 X159.264 Y181.57 E.03316
N16045 G1 X175.959 Y119.264 E2.07419
N16046 G1 X175.443 Y119.264 E.0166
N16047 G1 X159.264 Y123.599 E.53859
N16048 G1 X159.264 Y119.264 E.1394
N16049 G1 X159.378 Y119.264 E.00366
N16050 G1 X190.736 Y150.622 E1.426
N16051 G1 X190.736 Y148.882 E.05594
N16053 G1 X159.264 Y157.315 E1.04769
N16054 G1 X159.264 Y158.943 E.05236
N16059 G1 X190.736 Y140.453 E1.0477
N16060 G1 X190.736 Y139.108 E.04327
N16061 G1 X170.892 Y119.264 E.90239
N16062 G1 X167.53 Y119.264 E.10811
N16063 G1 X159.264 Y150.113 E1.02698
N16064 G1 X159.264 Y153.692 E.11509
N16065 G1 X190.736 Y185.163 E1.43118
N16066 G1 X190.736 Y182.597 E.08252
N16067 G1 X159.264 Y191.03 E1.0477
N16068 G1 X159.264 Y188.234 E.0899
N16069 G1 X171.766 Y200.736 E.56851
N16070 G1 X170.987 Y200.736 E.02505
N16071 G1 X190.736 Y127.032 E2.45366
N16072 G1 X190.736 Y123.596 E.11049
N16073 G1 X159.264 Y132.028 E1.0477
N16074 G1 X159.264 Y130.664 E.04385
N16075 G1 X190.736 Y162.136 E1.43118
N16076 G1 X190.736 Y165.74 E.11589
N16077 G1 X159.264 Y174.172 E1.0477
N16078 G1 X159.264 Y176.72 E.08194
N16079 G1 X183.28 Y200.736 E1.09212
N16080 G1 X185.956 Y200.736 E.08604
N16081 G1 X190.736 Y199.455 E.15913
N16082 G1 X190.736 Y196.677 E.08931
N16083 G1 X159.264 Y165.206 E1.43118
N16084 G1 X159.264 Y165.743 E.01727
N16085 G1 X190.736 Y157.311 E1.0477
N16086 G1 X190.736 Y158.488 E.03787
N16087 G1 X179.415 Y200.736 E1.40644
N16088 G1 X177.787 Y200.736 E.05236
N16090 G1 X179.415 Y200.736 E-.61876
N16091 G1 X179.512 Y200.377 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN16141 G1 Z13.8
N16142 G1 E.8 F1800
N16143 ; FEATURE: Inner wall
N16144 ; LINE_WIDTH: 0.45
N16145 ; LAYER_HEIGHT: 0.2
N16146 G1 F4421.739
N16147 M204 S8000
N16148 G1 X158.916 Y201.084 E1.03439
N16149 G1 X158.916 Y118.916 E2.64221
N16150 G1 X191.084 Y118.916 E1.03439
N16151 G1 X191.084 Y201.024 E2.64028
N16152 ; COOLING_NODE: 0
N16153 M204 S10000
N16154 G1 X191.491 Y201.491 F60000
N16155 G1 F4421.739
N16156 M204 S8000
N16157 G1 X158.509 Y201.491 E1.06057
N16158 G1 X158.509 Y118.509 E2.66839
N16159 G1 X191.491 Y118.509 E1.06057
N16160 G1 X191.491 Y201.431 E2.66646
N16161 ; COOLING_NODE: 0
N16162 M204 S10000
N16163 G1 X191.898 Y201.898 F60000
N16164 G1 F4421.739
N16165 M204 S8000
N16166 G1 X158.102 Y201.898 E1.08675
N16167 G1 X158.102 Y118.102 E2.69457
N16168 G1 X191.898 Y118.102 E1.08675
N16169 G1 X191.898 Y201.838 E2.69264
N16170 ; COOLING_NODE: 0
N16171 M204 S10000
N16172 G1 X192.29 Y202.29 F60000
N16173 ; FEATURE: Outer wall
N16174 ; LINE_WIDTH: 0.42
N16175 G1 F4773.528
N16176 M204 S5000
N16177 G1 X157.71 Y202.29 E1.03002
N16178 G1 X157.71 Y117.71 E2.51935
N16179 G1 X192.29 Y117.71 E1.03002
N16180 G1 X192.29 Y202.23 E2.51756
N16181 G1 E-.8 F1800
N16182 M204 S10000
N16183 G1 X187.698 Y200.736 Z14.2 F60000
N16184 G1 Z13.8
N16185 G1 E.8 F1800
N16186 ; FEATURE: Sparse infill
N16187 ; LINE_WIDTH: 0.45
N16188 G1 F4421.739
N16189 M204 S8000
N16190 G1 X190.736 Y189.399 E.37741
N16191 G1 X190.736 Y187.77 E.05236
N16192 M204 S10000
N16193 G1 X190.736 Y192.801 F60000
N16194 G1 F4421.739
N16195 M204 S8000
N16196 G1 X190.736 Y191.172 E.05236
N16197 G1 X159.264 Y199.605 E1.0477
N16198 G1 X159.264 Y199.548 E.00183
N16199 G1 X160.452 Y200.736 E.054
N16200 G1 X162.411 Y200.736 E.06301
N16201 G1 X184.242 Y119.264 E2.71223
N16202 G1 X182.606 Y119.264 E.05258
N16203 G1 X190.736 Y127.394 E.36969
N16204 M204 S10000
N16205 G1 X190.736 Y133.799 F60000
N16206 G1 F4421.739
N16207 M204 S8000
N16208 G1 X190.736 Y132.171 E.05236
N16209 G1 X159.264 Y140.603 E1.0477
N16210 G1 X159.264 Y141.978 E.04421
N16211 G1 X190.736 Y173.449 E1.43118
N16212 G1 X190.736 Y174.315 E.02782
N16213 G1 X159.264 Y182.747 E1.0477
N16214 G1 X159.264 Y181.024 E.05543
N16215 G1 X175.813 Y119.264 E2.056
N16216 G1 X175.989 Y119.264 E.00568
N16217 G1 X159.264 Y123.746 E.55678
N16218 G1 X159.264 Y119.264 E.14411
N16219 G1 X159.578 Y119.264 E.0101
N16220 G1 X190.736 Y150.422 E1.4169
N16221 G1 X190.736 Y149.028 E.0448
N16222 G1 X159.264 Y157.461 E1.0477
N16223 G1 X159.264 Y159.089 E.05236
N16224 M204 S10000
N16225 G1 X159.264 Y149.032 F60000
N16226 G1 F4421.739
N16227 M204 S8000
N16228 G1 X190.736 Y140.6 E1.0477
N16229 G1 X190.736 Y138.908 E.05441
N16230 G1 X171.092 Y119.264 E.89329
N16231 G1 X167.384 Y119.264 E.11925
N16232 G1 X159.264 Y149.567 E1.00879
N16233 G1 X159.264 Y153.492 E.12623
N16234 G1 X190.736 Y184.963 E1.43118
N16235 G1 X190.736 Y182.744 E.07138
N16236 G1 X159.264 Y191.176 E1.0477
N16237 G1 X159.264 Y188.034 E.10104
N16238 G1 X171.966 Y200.736 E.57761
N16239 G1 X170.84 Y200.736 E.03619
N16240 G1 X190.736 Y126.485 E2.47185
N16241 G1 X190.736 Y123.742 E.08821
N16242 G1 X159.264 Y132.175 E1.0477
N16243 G1 X159.264 Y130.464 E.05499
N16244 G1 X190.736 Y161.936 E1.43118
N16245 G1 X190.736 Y165.886 E.12703
N16246 G1 X159.264 Y174.319 E1.0477
N16247 G1 X159.264 Y176.52 E.0708
N16248 G1 X183.48 Y200.736 E1.10121
N16249 G1 X186.502 Y200.736 E.09718
N16250 G1 X190.736 Y199.601 E.14094
N16251 G1 X190.736 Y196.477 E.10045
N16252 G1 X159.264 Y165.006 E1.43118
N16253 G1 X159.264 Y165.89 E.02841
N16254 G1 X190.736 Y157.457 E1.0477
N16255 G1 X190.736 Y157.942 E.01559
N16256 G1 X179.269 Y200.736 E1.42463
N16257 G1 X177.641 Y200.736 E.05236
N16258 ; WIPE_START
N16259 G1 X179.269 Y200.736 E-.61876
N16260 G1 X179.365 Y200.377 E-.14124
N16261 ; WIPE_END
N16262 G1 E-.04 F1800
N16263 M204 S10000
N16264 G17
N16265 G3 Z14.2 I1.217 J0 P1  F60000
N16266 ; stop printing object, unique label id: 372
N16267 M625
N16268 ; object ids of layer 69 start: 372
N16269 M624 AQAAAAAAAAA=
N16270 ;======== H2D 20250527========
N16271 ; SKIPPABLE_START
N16272 ; SKIPTYPE: timelapse
N16273 M622.1 S1 ; for prev firware, default turned on
N16274 
N16275 M1002 judge_flag timelapse_record_flag
N16276 
N16277 M622 J1
N16278 M993 A2 B2 C2
N16279 M993 A0 B0 C0
N16280 
N16281 
N16282 
N16283 
N16284     M9711 M0 E1 X261 Y132 Z14.2 S11 C10 O0 T3000
N16285 
N16286 
N16287 
N16288 M993 A3 B3 C3
N16289 
N16290 M623
N16291 ; SKIPPABLE_END
N16292 
N16293 ; object ids of this layer69 end: 372
N16294 M625
N16295 ; CHANGE_LAYER
N16296 ; Z_HEIGHT: 14
N16297 ; LAYER_HEIGHT: 0.2
N16298 ;======== H2D 20250521========
N16299 ; layer num/total_layer_count: 70/75
N16300 ; update layer progress
N16301 M73 L70
N16302 M991 S0 P69 ;notify layer change
N16303 
N16304 
N16305 M106 S30.6
N16306 ; OBJECT_ID: 372
N16307 ; COOLING_NODE: 0
N16308 ; start printing object, unique label id: 372
N16309 M624 AQAAAAAAAAA=
N16310 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=13.900G1 Z13.900 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N16148 G1 X158.916 Y201.084 E1.03439
N16149 G1 X158.916 Y118.916 E2.64221
N16150 G1 X191.084 Y118.916 E1.03439
N16151 G1 X191.084 Y201.024 E2.64028
N16157 G1 X158.509 Y201.491 E1.06057
N16158 G1 X158.509 Y118.509 E2.66839
N16159 G1 X191.491 Y118.509 E1.06057
N16160 G1 X191.491 Y201.431 E2.66646
N16166 G1 X158.102 Y201.898 E1.08675
N16167 G1 X158.102 Y118.102 E2.69457
N16168 G1 X191.898 Y118.102 E1.08675
N16169 G1 X191.898 Y201.838 E2.69264
N16177 G1 X157.71 Y202.29 E1.03002
N16178 G1 X157.71 Y117.71 E2.51935
N16179 G1 X192.29 Y117.71 E1.03002
N16180 G1 X192.29 Y202.23 E2.51756
N16190 G1 X190.736 Y189.399 E.37741
N16191 G1 X190.736 Y187.77 E.05236
N16196 G1 X190.736 Y191.172 E.05236
N16197 G1 X159.264 Y199.605 E1.0477
N16198 G1 X159.264 Y199.548 E.00183
N16199 G1 X160.452 Y200.736 E.054
N16200 G1 X162.411 Y200.736 E.06301
N16201 G1 X184.242 Y119.264 E2.71223
N16202 G1 X182.606 Y119.264 E.05258
N16203 G1 X190.736 Y127.394 E.36969
N16208 G1 X190.736 Y132.171 E.05236
N16209 G1 X159.264 Y140.603 E1.0477
N16210 G1 X159.264 Y141.978 E.04421
N16211 G1 X190.736 Y173.449 E1.43118
N16212 G1 X190.736 Y174.315 E.02782
N16213 G1 X159.264 Y182.747 E1.0477
N16214 G1 X159.264 Y181.024 E.05543
N16215 G1 X175.813 Y119.264 E2.056
N16216 G1 X175.989 Y119.264 E.00568
N16217 G1 X159.264 Y123.746 E.55678
N16218 G1 X159.264 Y119.264 E.14411
N16219 G1 X159.578 Y119.264 E.0101
N16220 G1 X190.736 Y150.422 E1.4169
N16221 G1 X190.736 Y149.028 E.0448
N16222 G1 X159.264 Y157.461 E1.0477
N16223 G1 X159.264 Y159.089 E.05236
N16228 G1 X190.736 Y140.6 E1.0477
N16229 G1 X190.736 Y138.908 E.05441
N16230 G1 X171.092 Y119.264 E.89329
N16231 G1 X167.384 Y119.264 E.11925
N16232 G1 X159.264 Y149.567 E1.00879
N16233 G1 X159.264 Y153.492 E.12623
N16234 G1 X190.736 Y184.963 E1.43118
N16235 G1 X190.736 Y182.744 E.07138
N16236 G1 X159.264 Y191.176 E1.0477
N16237 G1 X159.264 Y188.034 E.10104
N16238 G1 X171.966 Y200.736 E.57761
N16239 G1 X170.84 Y200.736 E.03619
N16240 G1 X190.736 Y126.485 E2.47185
N16241 G1 X190.736 Y123.742 E.08821
N16242 G1 X159.264 Y132.175 E1.0477
N16243 G1 X159.264 Y130.464 E.05499
N16244 G1 X190.736 Y161.936 E1.43118
N16245 G1 X190.736 Y165.886 E.12703
N16246 G1 X159.264 Y174.319 E1.0477
N16247 G1 X159.264 Y176.52 E.0708
N16248 G1 X183.48 Y200.736 E1.10121
N16249 G1 X186.502 Y200.736 E.09718
N16250 G1 X190.736 Y199.601 E.14094
N16251 G1 X190.736 Y196.477 E.10045
N16252 G1 X159.264 Y165.006 E1.43118
N16253 G1 X159.264 Y165.89 E.02841
N16254 G1 X190.736 Y157.457 E1.0477
N16255 G1 X190.736 Y157.942 E.01559
N16256 G1 X179.269 Y200.736 E1.42463
N16257 G1 X177.641 Y200.736 E.05236
N16259 G1 X179.269 Y200.736 E-.61876
N16260 G1 X179.365 Y200.377 E-.14124
T0 ;TOOL_CHANGE:0 ; Revert to base toolN16311 G1 Z14
N16312 G1 E.8 F1800
N16313 ; FEATURE: Inner wall
N16314 ; LINE_WIDTH: 0.45
N16315 ; LAYER_HEIGHT: 0.2
N16316 G1 F4421.739
N16317 M204 S8000
N16318 G1 X158.916 Y201.084 E1.03439
N16319 G1 X158.916 Y118.916 E2.64221
N16320 G1 X191.084 Y118.916 E1.03439
N16321 G1 X191.084 Y201.024 E2.64028
N16322 ; COOLING_NODE: 0
N16323 M204 S10000
N16324 G1 X191.491 Y201.491 F60000
N16325 M73 P84 R10
N16326 G1 F4421.739
N16327 M204 S8000
N16328 G1 X158.509 Y201.491 E1.06057
N16329 M73 P84 R9
N16330 G1 X158.509 Y118.509 E2.66839
N16331 G1 X191.491 Y118.509 E1.06057
N16332 G1 X191.491 Y201.431 E2.66646
N16333 ; COOLING_NODE: 0
N16334 M204 S10000
N16335 G1 X191.898 Y201.898 F60000
N16336 G1 F4421.739
N16337 M204 S8000
N16338 G1 X158.102 Y201.898 E1.08675
N16339 G1 X158.102 Y118.102 E2.69457
N16340 G1 X191.898 Y118.102 E1.08675
N16341 G1 X191.898 Y201.838 E2.69264
N16342 ; COOLING_NODE: 0
N16343 M204 S10000
N16344 G1 X192.29 Y202.29 F60000
N16345 ; FEATURE: Outer wall
N16346 ; LINE_WIDTH: 0.42
N16347 G1 F4773.528
N16348 M204 S5000
N16349 G1 X157.71 Y202.29 E1.03002
N16350 G1 X157.71 Y117.71 E2.51935
N16351 G1 X192.29 Y117.71 E1.03002
N16352 G1 X192.29 Y202.23 E2.51756
N16353 G1 E-.8 F1800
N16354 M204 S10000
N16355 G1 X190.947 Y194.717 Z14.4 F60000
N16356 G1 X190.358 Y191.42 Z14.4
N16357 G1 Z14
N16358 G1 E.8 F1800
N16359 ; FEATURE: Sparse infill
N16360 ; LINE_WIDTH: 0.45
N16361 G1 F4421.739
N16362 M204 S8000
N16363 G1 X159.642 Y199.65 E1.02258
N16364 G1 X159.642 Y199.725 E.00241
N16365 G1 X160.275 Y200.358 E.02879
N16366 G1 X162.366 Y200.358 E.06725
N16367 G1 X183.994 Y119.642 E2.68712
N16368 G1 X183.183 Y119.642 E.02607
N16369 G1 X190.358 Y126.817 E.32629
N16370 G1 X190.358 Y127.346 E.01704
N16371 G1 X170.795 Y200.358 E2.43062
N16372 G1 X171.789 Y200.358 E.03195
N16373 G1 X159.642 Y188.211 E.5524
N16374 G1 X159.642 Y191.222 E.0968
N16375 G1 X190.358 Y182.991 E1.02258
N16376 G1 X190.358 Y184.386 E.04487
N16377 G1 X159.642 Y153.67 E1.39687
N16378 G1 X159.642 Y157.506 E.12338
N16379 G1 X190.358 Y149.276 E1.02258
N16380 G1 X190.358 Y149.844 E.01828
N16381 G1 X160.156 Y119.642 E1.3735
N16382 G1 X159.642 Y119.642 E.01653
N16383 G1 X159.642 Y123.791 E.13344
N16384 G1 X175.128 Y119.642 E.51555
N16385 G1 X175.565 Y119.642 E.01406
N16386 G1 X159.642 Y179.07 E1.9784
N16387 G1 X159.642 Y182.793 E.11973
N16388 G1 X190.358 Y174.562 E1.02258
N16389 G1 X190.358 Y172.872 E.05434
N16390 G1 X159.642 Y142.156 E1.39687
N16391 G1 X159.642 Y140.649 E.04845
N16392 G1 X190.358 Y132.418 E1.02258
N16393 G1 X190.358 Y134.047 E.05236
N16394 M204 S10000
N16395 G1 X190.358 Y122.361 F60000
N16396 G1 F4421.739
N16397 M204 S8000
N16398 G1 X190.358 Y123.989 E.05236
N16399 G1 X159.642 Y132.22 E1.02258
N16400 G1 X159.642 Y130.642 E.05075
N16401 G1 X190.358 Y161.358 E1.39687
N16402 G1 X190.358 Y166.133 E.15355
N16403 G1 X159.642 Y174.364 E1.02258
N16404 G1 X159.642 Y176.697 E.07504
N16405 G1 X183.303 Y200.358 E1.076
N16406 G1 X179.224 Y200.358 E.13116
N16407 G1 X190.358 Y158.803 E1.3834
N16408 G1 X190.358 Y157.705 E.03532
N16409 G1 X159.642 Y165.935 E1.02258
N16410 G1 X159.642 Y165.183 E.02417
N16411 G1 X190.358 Y195.9 E1.39687
N16412 G1 X190.358 Y199.849 E.12697
N16413 G1 X188.456 Y200.358 E.06333
N16414 G1 X187.652 Y200.358 E.02584
N16415 G1 X190.358 Y190.26 E.33619
N16416 G1 X190.358 Y188.632 E.05236
N16417 M204 S10000
N16418 G1 X170.041 Y119.642 F60000
N16419 G1 F4421.739
N16420 M204 S8000
N16421 G1 X171.67 Y119.642 E.05236
N16422 G1 X190.358 Y138.33 E.84989
N16423 G1 X190.358 Y140.847 E.08092
N16424 G1 X159.642 Y149.078 E1.02258
N16425 G1 X159.642 Y147.613 E.0471
N16426 G1 X167.136 Y119.642 E.93118
N16427 G1 X165.508 Y119.642 E.05236
N16428 M204 S10000
N16429 G1 X159.438 Y119.279 F60000
N16430 ; FEATURE: Floating vertical shell
N16431 ; LINE_WIDTH: 0.382999
N16432 G1 F5292.891
N16433 M204 S8000
N16434 G1 X159.306 Y119.306 E.00362
N16435 G1 X159.279 Y119.438 E.00362
N16436 G1 X159.279 Y200.562 E2.17929
N16437 G1 X159.306 Y200.694 E.00362
N16438 G1 X159.438 Y200.721 E.00362
N16439 G1 X190.562 Y200.721 E.8361
N16440 G1 X190.694 Y200.694 E.00362
N16441 G1 X190.721 Y200.562 E.00362
N16442 G1 X190.721 Y119.438 E2.17929
N16443 G1 X190.694 Y119.306 E.00362
N16444 G1 X190.562 Y119.279 E.00362
N16445 G1 X159.498 Y119.279 E.83449
N16446 ; WIPE_START
N16447 G1 X161.498 Y119.279 E-.76
N16448 ; WIPE_END
N16449 G1 E-.04 F1800
N16450 M204 S10000
N16451 G17
N16452 G3 Z14.4 I1.217 J0 P1  F60000
N16453 ; stop printing object, unique label id: 372
N16454 M625
N16455 ; object ids of layer 70 start: 372
N16456 M624 AQAAAAAAAAA=
N16457 ;======== H2D 20250527========
N16458 ; SKIPPABLE_START
N16459 ; SKIPTYPE: timelapse
N16460 M622.1 S1 ; for prev firware, default turned on
N16461 
N16462 M1002 judge_flag timelapse_record_flag
N16463 
N16464 M622 J1
N16465 M993 A2 B2 C2
N16466 M993 A0 B0 C0
N16467 
N16468 
N16469 
N16470 
N16471     M9711 M0 E1 X261 Y132 Z14.4 S11 C10 O0 T3000
N16472 
N16473 
N16474 
N16475 M993 A3 B3 C3
N16476 
N16477 M623
N16478 ; SKIPPABLE_END
N16479 
N16480 ; object ids of this layer70 end: 372
N16481 M625
N16482 ; CHANGE_LAYER
N16483 ; Z_HEIGHT: 14.2
N16484 ; LAYER_HEIGHT: 0.2
N16485 ;======== H2D 20250521========
N16486 ; layer num/total_layer_count: 71/75
N16487 ; update layer progress
N16488 M73 L71
N16489 M991 S0 P70 ;notify layer change
N16490 
N16491 
N16492 M106 S25.5
N16493 ; OBJECT_ID: 372
N16494 ; COOLING_NODE: 0
N16495 ; start printing object, unique label id: 372
N16496 M624 AQAAAAAAAAA=
N16497 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=14.100G1 Z14.100 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N16318 G1 X158.916 Y201.084 E1.03439
N16319 G1 X158.916 Y118.916 E2.64221
N16320 G1 X191.084 Y118.916 E1.03439
N16321 G1 X191.084 Y201.024 E2.64028
N16328 G1 X158.509 Y201.491 E1.06057
N16330 G1 X158.509 Y118.509 E2.66839
N16331 G1 X191.491 Y118.509 E1.06057
N16332 G1 X191.491 Y201.431 E2.66646
N16338 G1 X158.102 Y201.898 E1.08675
N16339 G1 X158.102 Y118.102 E2.69457
N16340 G1 X191.898 Y118.102 E1.08675
N16341 G1 X191.898 Y201.838 E2.69264
N16349 G1 X157.71 Y202.29 E1.03002
N16350 G1 X157.71 Y117.71 E2.51935
N16351 G1 X192.29 Y117.71 E1.03002
N16352 G1 X192.29 Y202.23 E2.51756
N16363 G1 X159.642 Y199.65 E1.02258
N16364 G1 X159.642 Y199.725 E.00241
N16365 G1 X160.275 Y200.358 E.02879
N16366 G1 X162.366 Y200.358 E.06725
N16367 G1 X183.994 Y119.642 E2.68712
N16368 G1 X183.183 Y119.642 E.02607
N16369 G1 X190.358 Y126.817 E.32629
N16370 G1 X190.358 Y127.346 E.01704
N16371 G1 X170.795 Y200.358 E2.43062
N16372 G1 X171.789 Y200.358 E.03195
N16373 G1 X159.642 Y188.211 E.5524
N16374 G1 X159.642 Y191.222 E.0968
N16375 G1 X190.358 Y182.991 E1.02258
N16376 G1 X190.358 Y184.386 E.04487
N16377 G1 X159.642 Y153.67 E1.39687
N16378 G1 X159.642 Y157.506 E.12338
N16379 G1 X190.358 Y149.276 E1.02258
N16380 G1 X190.358 Y149.844 E.01828
N16381 G1 X160.156 Y119.642 E1.3735
N16382 G1 X159.642 Y119.642 E.01653
N16383 G1 X159.642 Y123.791 E.13344
N16384 G1 X175.128 Y119.642 E.51555
N16385 G1 X175.565 Y119.642 E.01406
N16386 G1 X159.642 Y179.07 E1.9784
N16387 G1 X159.642 Y182.793 E.11973
N16388 G1 X190.358 Y174.562 E1.02258
N16389 G1 X190.358 Y172.872 E.05434
N16390 G1 X159.642 Y142.156 E1.39687
N16391 G1 X159.642 Y140.649 E.04845
N16392 G1 X190.358 Y132.418 E1.02258
N16393 G1 X190.358 Y134.047 E.05236
N16398 G1 X190.358 Y123.989 E.05236
N16399 G1 X159.642 Y132.22 E1.02258
N16400 G1 X159.642 Y130.642 E.05075
N16401 G1 X190.358 Y161.358 E1.39687
N16402 G1 X190.358 Y166.133 E.15355
N16403 G1 X159.642 Y174.364 E1.02258
N16404 G1 X159.642 Y176.697 E.07504
N16405 G1 X183.303 Y200.358 E1.076
N16406 G1 X179.224 Y200.358 E.13116
N16407 G1 X190.358 Y158.803 E1.3834
N16408 G1 X190.358 Y157.705 E.03532
N16409 G1 X159.642 Y165.935 E1.02258
N16410 G1 X159.642 Y165.183 E.02417
N16411 G1 X190.358 Y195.9 E1.39687
N16412 G1 X190.358 Y199.849 E.12697
N16413 G1 X188.456 Y200.358 E.06333
N16414 G1 X187.652 Y200.358 E.02584
N16415 G1 X190.358 Y190.26 E.33619
N16416 G1 X190.358 Y188.632 E.05236
N16421 G1 X171.67 Y119.642 E.05236
N16422 G1 X190.358 Y138.33 E.84989
N16423 G1 X190.358 Y140.847 E.08092
N16424 G1 X159.642 Y149.078 E1.02258
N16425 G1 X159.642 Y147.613 E.0471
N16426 G1 X167.136 Y119.642 E.93118
N16427 G1 X165.508 Y119.642 E.05236
N16434 G1 X159.306 Y119.306 E.00362
N16435 G1 X159.279 Y119.438 E.00362
N16436 G1 X159.279 Y200.562 E2.17929
N16437 G1 X159.306 Y200.694 E.00362
N16438 G1 X159.438 Y200.721 E.00362
N16439 G1 X190.562 Y200.721 E.8361
N16440 G1 X190.694 Y200.694 E.00362
N16441 G1 X190.721 Y200.562 E.00362
N16442 G1 X190.721 Y119.438 E2.17929
N16443 G1 X190.694 Y119.306 E.00362
N16444 G1 X190.562 Y119.279 E.00362
N16445 G1 X159.498 Y119.279 E.83449
N16447 G1 X161.498 Y119.279 E-.76
T0 ;TOOL_CHANGE:0 ; Revert to base toolN16498 G1 Z14.2
N16499 G1 E.8 F1800
N16500 ; FEATURE: Inner wall
N16501 ; LINE_WIDTH: 0.45
N16502 ; LAYER_HEIGHT: 0.2
N16503 G1 F4421.739
N16504 M204 S8000
N16505 G1 X158.916 Y201.084 E1.03439
N16506 G1 X158.916 Y118.916 E2.64221
N16507 G1 X191.084 Y118.916 E1.03439
N16508 G1 X191.084 Y201.024 E2.64028
N16509 ; COOLING_NODE: 0
N16510 M204 S10000
N16511 G1 X191.491 Y201.491 F60000
N16512 G1 F4421.739
N16513 M204 S8000
N16514 G1 X158.509 Y201.491 E1.06057
N16515 G1 X158.509 Y118.509 E2.66839
N16516 G1 X191.491 Y118.509 E1.06057
N16517 G1 X191.491 Y201.431 E2.66646
N16518 ; COOLING_NODE: 0
N16519 M204 S10000
N16520 G1 X191.898 Y201.898 F60000
N16521 G1 F4421.739
N16522 M204 S8000
N16523 G1 X158.102 Y201.898 E1.08675
N16524 G1 X158.102 Y118.102 E2.69457
N16525 G1 X191.898 Y118.102 E1.08675
N16526 G1 X191.898 Y201.838 E2.69264
N16527 ; COOLING_NODE: 0
N16528 M204 S10000
N16529 G1 X192.29 Y202.29 F60000
N16530 ; FEATURE: Outer wall
N16531 ; LINE_WIDTH: 0.42
N16532 G1 F4773.528
N16533 M204 S5000
N16534 G1 X157.71 Y202.29 E1.03002
N16535 M73 P85 R9
N16536 G1 X157.71 Y117.71 E2.51935
N16537 G1 X192.29 Y117.71 E1.03002
N16538 G1 X192.29 Y202.23 E2.51756
N16539 G1 E-.8 F1800
N16540 M204 S10000
N16541 G1 X190.003 Y200.917 Z14.6 F60000
N16542 G1 Z14.2
N16543 G1 E.8 F1800
N16544 ; FEATURE: Bridge
N16545 ; LINE_WIDTH: 0.40189
N16546 ; LAYER_HEIGHT: 0.4
N16547 M106 S229.5
N16548 G1 F2837.908
N16549 M204 S8000
N16550 G1 X190.714 Y200.205 E.05039
N16551 G1 X190.714 Y199.566 E.03202
N16552 G1 X189.566 Y200.714 E.08132
N16553 G1 X188.927 Y200.714 E.03202
N16554 G1 X190.714 Y198.927 E.12661
N16555 G1 X190.714 Y198.288 E.03202
N16556 G1 X188.288 Y200.714 E.17189
N16557 G1 X187.649 Y200.714 E.03202
N16558 G1 X190.714 Y197.649 E.21717
N16559 G1 X190.714 Y197.01 E.03202
N16560 G1 X187.01 Y200.714 E.26245
N16561 G1 X186.371 Y200.714 E.03202
N16562 G1 X190.714 Y196.371 E.30773
N16563 G1 X190.714 Y195.732 E.03202
N16564 G1 X185.732 Y200.714 E.35302
N16565 G1 X185.093 Y200.714 E.03202
N16566 G1 X190.714 Y195.093 E.3983
N16567 G1 X190.714 Y194.454 E.03202
N16568 G1 X184.454 Y200.714 E.44358
N16569 G1 X183.815 Y200.714 E.03202
N16570 G1 X190.714 Y193.815 E.48886
N16571 G1 X190.714 Y193.176 E.03202
N16572 G1 X183.176 Y200.714 E.53414
N16573 G1 X182.537 Y200.714 E.03202
N16574 G1 X190.714 Y192.537 E.57943
N16575 G1 X190.714 Y191.897 E.03202
N16576 G1 X181.898 Y200.714 E.62471
N16577 G1 X181.258 Y200.714 E.03202
N16578 G1 X190.714 Y191.258 E.66999
N16579 G1 X190.714 Y190.619 E.03202
N16580 G1 X180.619 Y200.714 E.71527
N16581 G1 X179.98 Y200.714 E.03202
N16582 G1 X190.714 Y189.98 E.76055
N16583 G1 X190.714 Y189.341 E.03202
N16584 G1 X179.341 Y200.714 E.80583
N16585 G1 X178.702 Y200.714 E.03202
N16586 G1 X190.714 Y188.702 E.85112
N16587 G1 X190.714 Y188.063 E.03202
N16588 G1 X178.063 Y200.714 E.8964
N16589 G1 X177.424 Y200.714 E.03202
N16590 G1 X190.714 Y187.424 E.94168
N16591 G1 X190.714 Y186.785 E.03202
N16592 G1 X176.785 Y200.714 E.98696
N16593 G1 X176.146 Y200.714 E.03202
N16594 G1 X190.714 Y186.146 E1.03224
N16595 G1 X190.714 Y185.507 E.03202
N16596 G1 X175.507 Y200.714 E1.07753
N16597 G1 X174.868 Y200.714 E.03202
N16598 G1 X190.714 Y184.868 E1.12281
N16599 G1 X190.714 Y184.229 E.03202
N16600 G1 X174.229 Y200.714 E1.16809
N16601 G1 X173.59 Y200.714 E.03202
N16602 G1 X190.714 Y183.59 E1.21337
N16603 G1 X190.714 Y182.951 E.03202
N16604 G1 X172.951 Y200.714 E1.25865
N16605 G1 X172.311 Y200.714 E.03202
N16606 G1 X190.714 Y182.311 E1.30394
N16607 G1 X190.714 Y181.672 E.03202
N16608 G1 X171.672 Y200.714 E1.34922
N16609 G1 X171.033 Y200.714 E.03202
N16610 G1 X190.714 Y181.033 E1.3945
N16611 G1 X190.714 Y180.394 E.03202
N16612 G1 X170.394 Y200.714 E1.43978
N16613 G1 X169.755 Y200.714 E.03202
N16614 G1 X190.714 Y179.755 E1.48506
N16615 G1 X190.714 Y179.116 E.03202
N16616 G1 X169.116 Y200.714 E1.53034
N16617 G1 X168.477 Y200.714 E.03202
N16618 G1 X190.714 Y178.477 E1.57563
N16619 G1 X190.714 Y177.838 E.03202
N16620 G1 X167.838 Y200.714 E1.62091
N16621 G1 X167.199 Y200.714 E.03202
N16622 G1 X190.714 Y177.199 E1.66619
N16623 G1 X190.714 Y176.56 E.03202
N16624 G1 X166.56 Y200.714 E1.71147
N16625 G1 X165.921 Y200.714 E.03202
N16626 G1 X190.714 Y175.921 E1.75675
N16627 G1 X190.714 Y175.282 E.03202
N16628 G1 X165.282 Y200.714 E1.80204
N16629 G1 X164.643 Y200.714 E.03202
N16630 G1 X190.714 Y174.643 E1.84732
N16631 G1 X190.714 Y174.004 E.03202
N16632 G1 X164.004 Y200.714 E1.8926
N16633 G1 X163.364 Y200.714 E.03202
N16634 G1 X190.714 Y173.365 E1.93788
N16635 G1 X190.714 Y172.725 E.03202
N16636 G1 X162.725 Y200.714 E1.98316
N16637 G1 X162.086 Y200.714 E.03202
N16638 G1 X190.714 Y172.086 E2.02845
N16639 G1 X190.714 Y171.447 E.03202
N16640 G1 X161.447 Y200.714 E2.07373
N16641 G1 X160.808 Y200.714 E.03202
N16642 G1 X190.714 Y170.808 E2.11901
N16643 G1 X190.714 Y170.169 E.03202
N16644 M73 P85 R8
N16645 G1 X160.169 Y200.714 E2.16429
N16646 G1 X159.53 Y200.714 E.03202
N16647 G1 X190.714 Y169.53 E2.20957
N16648 G1 X190.714 Y168.891 E.03202
N16649 G1 X159.286 Y200.319 E2.22687
N16650 G1 X159.286 Y199.68 E.03202
N16651 G1 X190.714 Y168.252 E2.22687
N16652 G1 X190.714 Y167.613 E.03202
N16653 G1 X159.286 Y199.041 E2.22687
N16654 G1 X159.286 Y198.402 E.03202
N16655 G1 X190.714 Y166.974 E2.22687
N16656 G1 X190.714 Y166.335 E.03202
N16657 G1 X159.286 Y197.763 E2.22687
N16658 G1 X159.286 Y197.124 E.03202
N16659 G1 X190.714 Y165.696 E2.22687
N16660 G1 X190.714 Y165.057 E.03202
N16661 G1 X159.286 Y196.485 E2.22687
N16662 G1 X159.286 Y195.846 E.03202
N16663 G1 X190.714 Y164.418 E2.22687
N16664 G1 X190.714 Y163.778 E.03202
N16665 G1 X159.286 Y195.207 E2.22687
N16666 G1 X159.286 Y194.568 E.03202
N16667 G1 X190.714 Y163.139 E2.22687
N16668 G1 X190.714 Y162.5 E.03202
N16669 G1 X159.286 Y193.928 E2.22687
N16670 G1 X159.286 Y193.289 E.03202
N16671 G1 X190.714 Y161.861 E2.22687
N16672 G1 X190.714 Y161.222 E.03202
N16673 M73 P86 R8
N16674 G1 X159.286 Y192.65 E2.22687
N16675 G1 X159.286 Y192.011 E.03202
N16676 G1 X190.714 Y160.583 E2.22687
N16677 G1 X190.714 Y159.944 E.03202
N16678 G1 X159.286 Y191.372 E2.22687
N16679 G1 X159.286 Y190.733 E.03202
N16680 G1 X190.714 Y159.305 E2.22687
N16681 G1 X190.714 Y158.666 E.03202
N16682 G1 X159.286 Y190.094 E2.22687
N16683 G1 X159.286 Y189.455 E.03202
N16684 G1 X190.714 Y158.027 E2.22687
N16685 G1 X190.714 Y157.388 E.03202
N16686 G1 X159.286 Y188.816 E2.22687
N16687 G1 X159.286 Y188.177 E.03202
N16688 G1 X190.714 Y156.749 E2.22687
N16689 G1 X190.714 Y156.11 E.03202
N16690 G1 X159.286 Y187.538 E2.22687
N16691 G1 X159.286 Y186.899 E.03202
N16692 G1 X190.714 Y155.471 E2.22687
N16693 G1 X190.714 Y154.832 E.03202
N16694 G1 X159.286 Y186.26 E2.22687
N16695 G1 X159.286 Y185.621 E.03202
N16696 G1 X190.714 Y154.192 E2.22687
N16697 G1 X190.714 Y153.553 E.03202
N16698 G1 X159.286 Y184.981 E2.22687
N16699 G1 X159.286 Y184.342 E.03202
N16700 G1 X190.714 Y152.914 E2.22687
N16701 G1 X190.714 Y152.275 E.03202
N16702 G1 X159.286 Y183.703 E2.22687
N16703 G1 X159.286 Y183.064 E.03202
N16704 G1 X190.714 Y151.636 E2.22687
N16705 G1 X190.714 Y150.997 E.03202
N16706 G1 X159.286 Y182.425 E2.22687
N16707 G1 X159.286 Y181.786 E.03202
N16708 G1 X190.714 Y150.358 E2.22687
N16709 G1 X190.714 Y149.719 E.03202
N16710 G1 X159.286 Y181.147 E2.22687
N16711 G1 X159.286 Y180.508 E.03202
N16712 G1 X190.714 Y149.08 E2.22687
N16713 G1 X190.714 Y148.441 E.03202
N16714 G1 X159.286 Y179.869 E2.22687
N16715 G1 X159.286 Y179.23 E.03202
N16716 G1 X190.714 Y147.802 E2.22687
N16717 G1 X190.714 Y147.163 E.03202
N16718 G1 X159.286 Y178.591 E2.22687
N16719 G1 X159.286 Y177.952 E.03202
N16720 G1 X190.714 Y146.524 E2.22687
N16721 G1 X190.714 Y145.885 E.03202
N16722 G1 X159.286 Y177.313 E2.22687
N16723 G1 X159.286 Y176.674 E.03202
N16724 G1 X190.714 Y145.245 E2.22687
N16725 G1 X190.714 Y144.606 E.03202
N16726 G1 X159.286 Y176.035 E2.22687
N16727 G1 X159.286 Y175.395 E.03202
N16728 G1 X190.714 Y143.967 E2.22687
N16729 G1 X190.714 Y143.328 E.03202
N16730 G1 X159.286 Y174.756 E2.22687
N16731 G1 X159.286 Y174.117 E.03202
N16732 G1 X190.714 Y142.689 E2.22687
N16733 G1 X190.714 Y142.05 E.03202
N16734 G1 X159.286 Y173.478 E2.22687
N16735 G1 X159.286 Y172.839 E.03202
N16736 G1 X190.714 Y141.411 E2.22687
N16737 G1 X190.714 Y140.772 E.03202
N16738 G1 X159.286 Y172.2 E2.22687
N16739 G1 X159.286 Y171.561 E.03202
N16740 G1 X190.714 Y140.133 E2.22687
N16741 G1 X190.714 Y139.494 E.03202
N16742 G1 X159.286 Y170.922 E2.22687
N16743 G1 X159.286 Y170.283 E.03202
N16744 G1 X190.714 Y138.855 E2.22687
N16745 G1 X190.714 Y138.216 E.03202
N16746 G1 X159.286 Y169.644 E2.22687
N16747 G1 X159.286 Y169.005 E.03202
N16748 G1 X190.714 Y137.577 E2.22687
N16749 G1 X190.714 Y136.938 E.03202
N16750 G1 X159.286 Y168.366 E2.22687
N16751 G1 X159.286 Y167.727 E.03202
N16752 M73 P87 R8
N16753 G1 X190.714 Y136.299 E2.22687
N16754 G1 X190.714 Y135.659 E.03202
N16755 G1 X159.286 Y167.088 E2.22687
N16756 G1 X159.286 Y166.449 E.03202
N16757 G1 X190.714 Y135.02 E2.22687
N16758 G1 X190.714 Y134.381 E.03202
N16759 G1 X159.286 Y165.809 E2.22687
N16760 G1 X159.286 Y165.17 E.03202
N16761 G1 X190.714 Y133.742 E2.22687
N16762 G1 X190.714 Y133.103 E.03202
N16763 G1 X159.286 Y164.531 E2.22687
N16764 G1 X159.286 Y163.892 E.03202
N16765 G1 X190.714 Y132.464 E2.22687
N16766 G1 X190.714 Y131.825 E.03202
N16767 G1 X159.286 Y163.253 E2.22687
N16768 G1 X159.286 Y162.614 E.03202
N16769 G1 X190.714 Y131.186 E2.22687
N16770 G1 X190.714 Y130.547 E.03202
N16771 M73 P87 R7
N16772 G1 X159.286 Y161.975 E2.22687
N16773 G1 X159.286 Y161.336 E.03202
N16774 G1 X190.714 Y129.908 E2.22687
N16775 G1 X190.714 Y129.269 E.03202
N16776 G1 X159.286 Y160.697 E2.22687
N16777 G1 X159.286 Y160.058 E.03202
N16778 G1 X190.714 Y128.63 E2.22687
N16779 G1 X190.714 Y127.991 E.03202
N16780 G1 X159.286 Y159.419 E2.22687
N16781 G1 X159.286 Y158.78 E.03202
N16782 G1 X190.714 Y127.352 E2.22687
N16783 G1 X190.714 Y126.712 E.03202
N16784 G1 X159.286 Y158.141 E2.22687
N16785 G1 X159.286 Y157.502 E.03202
N16786 G1 X190.714 Y126.073 E2.22687
N16787 G1 X190.714 Y125.434 E.03202
N16788 G1 X159.286 Y156.862 E2.22687
N16789 G1 X159.286 Y156.223 E.03202
N16790 G1 X190.714 Y124.795 E2.22687
N16791 G1 X190.714 Y124.156 E.03202
N16792 G1 X159.286 Y155.584 E2.22687
N16793 G1 X159.286 Y154.945 E.03202
N16794 G1 X190.714 Y123.517 E2.22687
N16795 G1 X190.714 Y122.878 E.03202
N16796 G1 X159.286 Y154.306 E2.22687
N16797 G1 X159.286 Y153.667 E.03202
N16798 G1 X190.714 Y122.239 E2.22687
N16799 G1 X190.714 Y121.6 E.03202
N16800 G1 X159.286 Y153.028 E2.22687
N16801 G1 X159.286 Y152.389 E.03202
N16802 G1 X190.714 Y120.961 E2.22687
N16803 G1 X190.714 Y120.322 E.03202
N16804 G1 X159.286 Y151.75 E2.22687
N16805 G1 X159.286 Y151.111 E.03202
N16806 G1 X190.714 Y119.683 E2.22687
N16807 G1 X190.714 Y119.286 E.01988
N16808 G1 X190.472 Y119.286 E.01214
N16809 G1 X159.286 Y150.472 E2.20971
N16810 G1 X159.286 Y149.833 E.03202
N16811 G1 X189.833 Y119.286 E2.16442
N16812 G1 X189.194 Y119.286 E.03202
N16813 G1 X159.286 Y149.194 E2.11914
N16814 G1 X159.286 Y148.555 E.03202
N16815 G1 X188.555 Y119.286 E2.07386
N16816 G1 X187.916 Y119.286 E.03202
N16817 G1 X159.286 Y147.916 E2.02858
N16818 G1 X159.286 Y147.276 E.03202
N16819 G1 X187.276 Y119.286 E1.9833
N16820 G1 X186.637 Y119.286 E.03202
N16821 G1 X159.286 Y146.637 E1.93802
N16822 G1 X159.286 Y145.998 E.03202
N16823 G1 X185.998 Y119.286 E1.89273
N16824 G1 X185.359 Y119.286 E.03202
N16825 G1 X159.286 Y145.359 E1.84745
N16826 G1 X159.286 Y144.72 E.03202
N16827 G1 X184.72 Y119.286 E1.80217
N16828 G1 X184.081 Y119.286 E.03202
N16829 G1 X159.286 Y144.081 E1.75689
N16830 G1 X159.286 Y143.442 E.03202
N16831 G1 X183.442 Y119.286 E1.71161
N16832 G1 X182.803 Y119.286 E.03202
N16833 G1 X159.286 Y142.803 E1.66632
N16834 G1 X159.286 Y142.164 E.03202
N16835 M73 P88 R7
N16836 G1 X182.164 Y119.286 E1.62104
N16837 G1 X181.525 Y119.286 E.03202
N16838 G1 X159.286 Y141.525 E1.57576
N16839 G1 X159.286 Y140.886 E.03202
N16840 G1 X180.886 Y119.286 E1.53048
N16841 G1 X180.247 Y119.286 E.03202
N16842 G1 X159.286 Y140.247 E1.4852
N16843 G1 X159.286 Y139.608 E.03202
N16844 G1 X179.608 Y119.286 E1.43991
N16845 G1 X178.969 Y119.286 E.03202
N16846 G1 X159.286 Y138.969 E1.39463
N16847 G1 X159.286 Y138.329 E.03202
N16848 G1 X178.329 Y119.286 E1.34935
N16849 G1 X177.69 Y119.286 E.03202
N16850 G1 X159.286 Y137.69 E1.30407
N16851 G1 X159.286 Y137.051 E.03202
N16852 G1 X177.051 Y119.286 E1.25879
N16853 G1 X176.412 Y119.286 E.03202
N16854 G1 X159.286 Y136.412 E1.2135
N16855 G1 X159.286 Y135.773 E.03202
N16856 G1 X175.773 Y119.286 E1.16822
N16857 G1 X175.134 Y119.286 E.03202
N16858 G1 X159.286 Y135.134 E1.12294
N16859 G1 X159.286 Y134.495 E.03202
N16860 G1 X174.495 Y119.286 E1.07766
N16861 G1 X173.856 Y119.286 E.03202
N16862 G1 X159.286 Y133.856 E1.03238
N16863 G1 X159.286 Y133.217 E.03202
N16864 G1 X173.217 Y119.286 E.9871
N16865 G1 X172.578 Y119.286 E.03202
N16866 G1 X159.286 Y132.578 E.94181
N16867 G1 X159.286 Y131.939 E.03202
N16868 G1 X171.939 Y119.286 E.89653
N16869 G1 X171.3 Y119.286 E.03202
N16870 G1 X159.286 Y131.3 E.85125
N16871 G1 X159.286 Y130.661 E.03202
N16872 G1 X170.661 Y119.286 E.80597
N16873 G1 X170.022 Y119.286 E.03202
N16874 G1 X159.286 Y130.022 E.76069
N16875 G1 X159.286 Y129.383 E.03202
N16876 G1 X169.383 Y119.286 E.7154
N16877 G1 X168.743 Y119.286 E.03202
N16878 G1 X159.286 Y128.743 E.67012
N16879 G1 X159.286 Y128.104 E.03202
N16880 G1 X168.104 Y119.286 E.62484
N16881 G1 X167.465 Y119.286 E.03202
N16882 G1 X159.286 Y127.465 E.57956
N16883 G1 X159.286 Y126.826 E.03202
N16884 G1 X166.826 Y119.286 E.53428
N16885 G1 X166.187 Y119.286 E.03202
N16886 G1 X159.286 Y126.187 E.48899
N16887 G1 X159.286 Y125.548 E.03202
N16888 G1 X165.548 Y119.286 E.44371
N16889 G1 X164.909 Y119.286 E.03202
N16890 G1 X159.286 Y124.909 E.39843
N16891 G1 X159.286 Y124.27 E.03202
N16892 G1 X164.27 Y119.286 E.35315
N16893 G1 X163.631 Y119.286 E.03202
N16894 G1 X159.286 Y123.631 E.30787
N16895 G1 X159.286 Y122.992 E.03202
N16896 G1 X162.992 Y119.286 E.26258
N16897 G1 X162.353 Y119.286 E.03202
N16898 G1 X159.286 Y122.353 E.2173
N16899 G1 X159.286 Y121.714 E.03202
N16900 G1 X161.714 Y119.286 E.17202
N16901 G1 X161.075 Y119.286 E.03202
N16902 G1 X159.286 Y121.075 E.12674
N16903 G1 X159.286 Y120.436 E.03202
N16904 G1 X160.436 Y119.286 E.08146
N16905 G1 X159.796 Y119.286 E.03202
N16906 G1 X159.083 Y119.999 E.05052
N16907 M106 S25.5
N16908 ; WIPE_START
N16909 G1 X159.796 Y119.286 E-.38319
N16910 G1 X160.436 Y119.286 E-.24284
N16911 G1 X160.186 Y119.535 E-.13396
N16912 ; WIPE_END
N16913 G1 E-.04 F1800
N16914 M204 S10000
N16915 G17
N16916 G3 Z14.6 I1.217 J0 P1  F60000
N16917 ; stop printing object, unique label id: 372
N16918 M625
N16919 ; object ids of layer 71 start: 372
N16920 M624 AQAAAAAAAAA=
N16921 ;======== H2D 20250527========
N16922 ; SKIPPABLE_START
N16923 ; SKIPTYPE: timelapse
N16924 M622.1 S1 ; for prev firware, default turned on
N16925 
N16926 M1002 judge_flag timelapse_record_flag
N16927 
N16928 M622 J1
N16929 M993 A2 B2 C2
N16930 M993 A0 B0 C0
N16931 
N16932 
N16933 
N16934 
N16935     M9711 M0 E1 X261 Y132 Z14.6 S11 C10 O0 T3000
N16936 
N16937 
N16938 
N16939 M993 A3 B3 C3
N16940 
N16941 M623
N16942 ; SKIPPABLE_END
N16943 
N16944 ; object ids of this layer71 end: 372
N16945 M625
N16946 ; CHANGE_LAYER
N16947 ; Z_HEIGHT: 14.4
N16948 ; LAYER_HEIGHT: 0.2
N16949 ;======== H2D 20250521========
N16950 ; layer num/total_layer_count: 72/75
N16951 ; update layer progress
N16952 M73 L72
N16953 M991 S0 P71 ;notify layer change
N16954 
N16955 
N16956 ; OBJECT_ID: 372
N16957 ; COOLING_NODE: 0
N16958 ; start printing object, unique label id: 372
N16959 M624 AQAAAAAAAAA=
N16960 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=14.300G1 Z14.300 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N16505 G1 X158.916 Y201.084 E1.03439
N16506 G1 X158.916 Y118.916 E2.64221
N16507 G1 X191.084 Y118.916 E1.03439
N16508 G1 X191.084 Y201.024 E2.64028
N16514 G1 X158.509 Y201.491 E1.06057
N16515 G1 X158.509 Y118.509 E2.66839
N16516 G1 X191.491 Y118.509 E1.06057
N16517 G1 X191.491 Y201.431 E2.66646
N16523 G1 X158.102 Y201.898 E1.08675
N16524 G1 X158.102 Y118.102 E2.69457
N16525 G1 X191.898 Y118.102 E1.08675
N16526 G1 X191.898 Y201.838 E2.69264
N16534 G1 X157.71 Y202.29 E1.03002
N16536 G1 X157.71 Y117.71 E2.51935
N16537 G1 X192.29 Y117.71 E1.03002
N16538 G1 X192.29 Y202.23 E2.51756
N16550 G1 X190.714 Y200.205 E.05039
N16551 G1 X190.714 Y199.566 E.03202
N16552 G1 X189.566 Y200.714 E.08132
N16553 G1 X188.927 Y200.714 E.03202
N16554 G1 X190.714 Y198.927 E.12661
N16555 G1 X190.714 Y198.288 E.03202
N16556 G1 X188.288 Y200.714 E.17189
N16557 G1 X187.649 Y200.714 E.03202
N16558 G1 X190.714 Y197.649 E.21717
N16559 G1 X190.714 Y197.01 E.03202
N16560 G1 X187.01 Y200.714 E.26245
N16561 G1 X186.371 Y200.714 E.03202
N16562 G1 X190.714 Y196.371 E.30773
N16563 G1 X190.714 Y195.732 E.03202
N16564 G1 X185.732 Y200.714 E.35302
N16565 G1 X185.093 Y200.714 E.03202
N16566 G1 X190.714 Y195.093 E.3983
N16567 G1 X190.714 Y194.454 E.03202
N16568 G1 X184.454 Y200.714 E.44358
N16569 G1 X183.815 Y200.714 E.03202
N16570 G1 X190.714 Y193.815 E.48886
N16571 G1 X190.714 Y193.176 E.03202
N16572 G1 X183.176 Y200.714 E.53414
N16573 G1 X182.537 Y200.714 E.03202
N16574 G1 X190.714 Y192.537 E.57943
N16575 G1 X190.714 Y191.897 E.03202
N16576 G1 X181.898 Y200.714 E.62471
N16577 G1 X181.258 Y200.714 E.03202
N16578 G1 X190.714 Y191.258 E.66999
N16579 G1 X190.714 Y190.619 E.03202
N16580 G1 X180.619 Y200.714 E.71527
N16581 G1 X179.98 Y200.714 E.03202
N16582 G1 X190.714 Y189.98 E.76055
N16583 G1 X190.714 Y189.341 E.03202
N16584 G1 X179.341 Y200.714 E.80583
N16585 G1 X178.702 Y200.714 E.03202
N16586 G1 X190.714 Y188.702 E.85112
N16587 G1 X190.714 Y188.063 E.03202
N16588 G1 X178.063 Y200.714 E.8964
N16589 G1 X177.424 Y200.714 E.03202
N16590 G1 X190.714 Y187.424 E.94168
N16591 G1 X190.714 Y186.785 E.03202
N16592 G1 X176.785 Y200.714 E.98696
N16593 G1 X176.146 Y200.714 E.03202
N16594 G1 X190.714 Y186.146 E1.03224
N16595 G1 X190.714 Y185.507 E.03202
N16596 G1 X175.507 Y200.714 E1.07753
N16597 G1 X174.868 Y200.714 E.03202
N16598 G1 X190.714 Y184.868 E1.12281
N16599 G1 X190.714 Y184.229 E.03202
N16600 G1 X174.229 Y200.714 E1.16809
N16601 G1 X173.59 Y200.714 E.03202
N16602 G1 X190.714 Y183.59 E1.21337
N16603 G1 X190.714 Y182.951 E.03202
N16604 G1 X172.951 Y200.714 E1.25865
N16605 G1 X172.311 Y200.714 E.03202
N16606 G1 X190.714 Y182.311 E1.30394
N16607 G1 X190.714 Y181.672 E.03202
N16608 G1 X171.672 Y200.714 E1.34922
N16609 G1 X171.033 Y200.714 E.03202
N16610 G1 X190.714 Y181.033 E1.3945
N16611 G1 X190.714 Y180.394 E.03202
N16612 G1 X170.394 Y200.714 E1.43978
N16613 G1 X169.755 Y200.714 E.03202
N16614 G1 X190.714 Y179.755 E1.48506
N16615 G1 X190.714 Y179.116 E.03202
N16616 G1 X169.116 Y200.714 E1.53034
N16617 G1 X168.477 Y200.714 E.03202
N16618 G1 X190.714 Y178.477 E1.57563
N16619 G1 X190.714 Y177.838 E.03202
N16620 G1 X167.838 Y200.714 E1.62091
N16621 G1 X167.199 Y200.714 E.03202
N16622 G1 X190.714 Y177.199 E1.66619
N16623 G1 X190.714 Y176.56 E.03202
N16624 G1 X166.56 Y200.714 E1.71147
N16625 G1 X165.921 Y200.714 E.03202
N16626 G1 X190.714 Y175.921 E1.75675
N16627 G1 X190.714 Y175.282 E.03202
N16628 G1 X165.282 Y200.714 E1.80204
N16629 G1 X164.643 Y200.714 E.03202
N16630 G1 X190.714 Y174.643 E1.84732
N16631 G1 X190.714 Y174.004 E.03202
N16632 G1 X164.004 Y200.714 E1.8926
N16633 G1 X163.364 Y200.714 E.03202
N16634 G1 X190.714 Y173.365 E1.93788
N16635 G1 X190.714 Y172.725 E.03202
N16636 G1 X162.725 Y200.714 E1.98316
N16637 G1 X162.086 Y200.714 E.03202
N16638 G1 X190.714 Y172.086 E2.02845
N16639 G1 X190.714 Y171.447 E.03202
N16640 G1 X161.447 Y200.714 E2.07373
N16641 G1 X160.808 Y200.714 E.03202
N16642 G1 X190.714 Y170.808 E2.11901
N16643 G1 X190.714 Y170.169 E.03202
N16645 G1 X160.169 Y200.714 E2.16429
N16646 G1 X159.53 Y200.714 E.03202
N16647 G1 X190.714 Y169.53 E2.20957
N16648 G1 X190.714 Y168.891 E.03202
N16649 G1 X159.286 Y200.319 E2.22687
N16650 G1 X159.286 Y199.68 E.03202
N16651 G1 X190.714 Y168.252 E2.22687
N16652 G1 X190.714 Y167.613 E.03202
N16653 G1 X159.286 Y199.041 E2.22687
N16654 G1 X159.286 Y198.402 E.03202
N16655 G1 X190.714 Y166.974 E2.22687
N16656 G1 X190.714 Y166.335 E.03202
N16657 G1 X159.286 Y197.763 E2.22687
N16658 G1 X159.286 Y197.124 E.03202
N16659 G1 X190.714 Y165.696 E2.22687
N16660 G1 X190.714 Y165.057 E.03202
N16661 G1 X159.286 Y196.485 E2.22687
N16662 G1 X159.286 Y195.846 E.03202
N16663 G1 X190.714 Y164.418 E2.22687
N16664 G1 X190.714 Y163.778 E.03202
N16665 G1 X159.286 Y195.207 E2.22687
N16666 G1 X159.286 Y194.568 E.03202
N16667 G1 X190.714 Y163.139 E2.22687
N16668 G1 X190.714 Y162.5 E.03202
N16669 G1 X159.286 Y193.928 E2.22687
N16670 G1 X159.286 Y193.289 E.03202
N16671 G1 X190.714 Y161.861 E2.22687
N16672 G1 X190.714 Y161.222 E.03202
N16674 G1 X159.286 Y192.65 E2.22687
N16675 G1 X159.286 Y192.011 E.03202
N16676 G1 X190.714 Y160.583 E2.22687
N16677 G1 X190.714 Y159.944 E.03202
N16678 G1 X159.286 Y191.372 E2.22687
N16679 G1 X159.286 Y190.733 E.03202
N16680 G1 X190.714 Y159.305 E2.22687
N16681 G1 X190.714 Y158.666 E.03202
N16682 G1 X159.286 Y190.094 E2.22687
N16683 G1 X159.286 Y189.455 E.03202
N16684 G1 X190.714 Y158.027 E2.22687
N16685 G1 X190.714 Y157.388 E.03202
N16686 G1 X159.286 Y188.816 E2.22687
N16687 G1 X159.286 Y188.177 E.03202
N16688 G1 X190.714 Y156.749 E2.22687
N16689 G1 X190.714 Y156.11 E.03202
N16690 G1 X159.286 Y187.538 E2.22687
N16691 G1 X159.286 Y186.899 E.03202
N16692 G1 X190.714 Y155.471 E2.22687
N16693 G1 X190.714 Y154.832 E.03202
N16694 G1 X159.286 Y186.26 E2.22687
N16695 G1 X159.286 Y185.621 E.03202
N16696 G1 X190.714 Y154.192 E2.22687
N16697 G1 X190.714 Y153.553 E.03202
N16698 G1 X159.286 Y184.981 E2.22687
N16699 G1 X159.286 Y184.342 E.03202
N16700 G1 X190.714 Y152.914 E2.22687
N16701 G1 X190.714 Y152.275 E.03202
N16702 G1 X159.286 Y183.703 E2.22687
N16703 G1 X159.286 Y183.064 E.03202
N16704 G1 X190.714 Y151.636 E2.22687
N16705 G1 X190.714 Y150.997 E.03202
N16706 G1 X159.286 Y182.425 E2.22687
N16707 G1 X159.286 Y181.786 E.03202
N16708 G1 X190.714 Y150.358 E2.22687
N16709 G1 X190.714 Y149.719 E.03202
N16710 G1 X159.286 Y181.147 E2.22687
N16711 G1 X159.286 Y180.508 E.03202
N16712 G1 X190.714 Y149.08 E2.22687
N16713 G1 X190.714 Y148.441 E.03202
N16714 G1 X159.286 Y179.869 E2.22687
N16715 G1 X159.286 Y179.23 E.03202
N16716 G1 X190.714 Y147.802 E2.22687
N16717 G1 X190.714 Y147.163 E.03202
N16718 G1 X159.286 Y178.591 E2.22687
N16719 G1 X159.286 Y177.952 E.03202
N16720 G1 X190.714 Y146.524 E2.22687
N16721 G1 X190.714 Y145.885 E.03202
N16722 G1 X159.286 Y177.313 E2.22687
N16723 G1 X159.286 Y176.674 E.03202
N16724 G1 X190.714 Y145.245 E2.22687
N16725 G1 X190.714 Y144.606 E.03202
N16726 G1 X159.286 Y176.035 E2.22687
N16727 G1 X159.286 Y175.395 E.03202
N16728 G1 X190.714 Y143.967 E2.22687
N16729 G1 X190.714 Y143.328 E.03202
N16730 G1 X159.286 Y174.756 E2.22687
N16731 G1 X159.286 Y174.117 E.03202
N16732 G1 X190.714 Y142.689 E2.22687
N16733 G1 X190.714 Y142.05 E.03202
N16734 G1 X159.286 Y173.478 E2.22687
N16735 G1 X159.286 Y172.839 E.03202
N16736 G1 X190.714 Y141.411 E2.22687
N16737 G1 X190.714 Y140.772 E.03202
N16738 G1 X159.286 Y172.2 E2.22687
N16739 G1 X159.286 Y171.561 E.03202
N16740 G1 X190.714 Y140.133 E2.22687
N16741 G1 X190.714 Y139.494 E.03202
N16742 G1 X159.286 Y170.922 E2.22687
N16743 G1 X159.286 Y170.283 E.03202
N16744 G1 X190.714 Y138.855 E2.22687
N16745 G1 X190.714 Y138.216 E.03202
N16746 G1 X159.286 Y169.644 E2.22687
N16747 G1 X159.286 Y169.005 E.03202
N16748 G1 X190.714 Y137.577 E2.22687
N16749 G1 X190.714 Y136.938 E.03202
N16750 G1 X159.286 Y168.366 E2.22687
N16751 G1 X159.286 Y167.727 E.03202
N16753 G1 X190.714 Y136.299 E2.22687
N16754 G1 X190.714 Y135.659 E.03202
N16755 G1 X159.286 Y167.088 E2.22687
N16756 G1 X159.286 Y166.449 E.03202
N16757 G1 X190.714 Y135.02 E2.22687
N16758 G1 X190.714 Y134.381 E.03202
N16759 G1 X159.286 Y165.809 E2.22687
N16760 G1 X159.286 Y165.17 E.03202
N16761 G1 X190.714 Y133.742 E2.22687
N16762 G1 X190.714 Y133.103 E.03202
N16763 G1 X159.286 Y164.531 E2.22687
N16764 G1 X159.286 Y163.892 E.03202
N16765 G1 X190.714 Y132.464 E2.22687
N16766 G1 X190.714 Y131.825 E.03202
N16767 G1 X159.286 Y163.253 E2.22687
N16768 G1 X159.286 Y162.614 E.03202
N16769 G1 X190.714 Y131.186 E2.22687
N16770 G1 X190.714 Y130.547 E.03202
N16772 G1 X159.286 Y161.975 E2.22687
N16773 G1 X159.286 Y161.336 E.03202
N16774 G1 X190.714 Y129.908 E2.22687
N16775 G1 X190.714 Y129.269 E.03202
N16776 G1 X159.286 Y160.697 E2.22687
N16777 G1 X159.286 Y160.058 E.03202
N16778 G1 X190.714 Y128.63 E2.22687
N16779 G1 X190.714 Y127.991 E.03202
N16780 G1 X159.286 Y159.419 E2.22687
N16781 G1 X159.286 Y158.78 E.03202
N16782 G1 X190.714 Y127.352 E2.22687
N16783 G1 X190.714 Y126.712 E.03202
N16784 G1 X159.286 Y158.141 E2.22687
N16785 G1 X159.286 Y157.502 E.03202
N16786 G1 X190.714 Y126.073 E2.22687
N16787 G1 X190.714 Y125.434 E.03202
N16788 G1 X159.286 Y156.862 E2.22687
N16789 G1 X159.286 Y156.223 E.03202
N16790 G1 X190.714 Y124.795 E2.22687
N16791 G1 X190.714 Y124.156 E.03202
N16792 G1 X159.286 Y155.584 E2.22687
N16793 G1 X159.286 Y154.945 E.03202
N16794 G1 X190.714 Y123.517 E2.22687
N16795 G1 X190.714 Y122.878 E.03202
N16796 G1 X159.286 Y154.306 E2.22687
N16797 G1 X159.286 Y153.667 E.03202
N16798 G1 X190.714 Y122.239 E2.22687
N16799 G1 X190.714 Y121.6 E.03202
N16800 G1 X159.286 Y153.028 E2.22687
N16801 G1 X159.286 Y152.389 E.03202
N16802 G1 X190.714 Y120.961 E2.22687
N16803 G1 X190.714 Y120.322 E.03202
N16804 G1 X159.286 Y151.75 E2.22687
N16805 G1 X159.286 Y151.111 E.03202
N16806 G1 X190.714 Y119.683 E2.22687
N16807 G1 X190.714 Y119.286 E.01988
N16808 G1 X190.472 Y119.286 E.01214
N16809 G1 X159.286 Y150.472 E2.20971
N16810 G1 X159.286 Y149.833 E.03202
N16811 G1 X189.833 Y119.286 E2.16442
N16812 G1 X189.194 Y119.286 E.03202
N16813 G1 X159.286 Y149.194 E2.11914
N16814 G1 X159.286 Y148.555 E.03202
N16815 G1 X188.555 Y119.286 E2.07386
N16816 G1 X187.916 Y119.286 E.03202
N16817 G1 X159.286 Y147.916 E2.02858
N16818 G1 X159.286 Y147.276 E.03202
N16819 G1 X187.276 Y119.286 E1.9833
N16820 G1 X186.637 Y119.286 E.03202
N16821 G1 X159.286 Y146.637 E1.93802
N16822 G1 X159.286 Y145.998 E.03202
N16823 G1 X185.998 Y119.286 E1.89273
N16824 G1 X185.359 Y119.286 E.03202
N16825 G1 X159.286 Y145.359 E1.84745
N16826 G1 X159.286 Y144.72 E.03202
N16827 G1 X184.72 Y119.286 E1.80217
N16828 G1 X184.081 Y119.286 E.03202
N16829 G1 X159.286 Y144.081 E1.75689
N16830 G1 X159.286 Y143.442 E.03202
N16831 G1 X183.442 Y119.286 E1.71161
N16832 G1 X182.803 Y119.286 E.03202
N16833 G1 X159.286 Y142.803 E1.66632
N16834 G1 X159.286 Y142.164 E.03202
N16836 G1 X182.164 Y119.286 E1.62104
N16837 G1 X181.525 Y119.286 E.03202
N16838 G1 X159.286 Y141.525 E1.57576
N16839 G1 X159.286 Y140.886 E.03202
N16840 G1 X180.886 Y119.286 E1.53048
N16841 G1 X180.247 Y119.286 E.03202
N16842 G1 X159.286 Y140.247 E1.4852
N16843 G1 X159.286 Y139.608 E.03202
N16844 G1 X179.608 Y119.286 E1.43991
N16845 G1 X178.969 Y119.286 E.03202
N16846 G1 X159.286 Y138.969 E1.39463
N16847 G1 X159.286 Y138.329 E.03202
N16848 G1 X178.329 Y119.286 E1.34935
N16849 G1 X177.69 Y119.286 E.03202
N16850 G1 X159.286 Y137.69 E1.30407
N16851 G1 X159.286 Y137.051 E.03202
N16852 G1 X177.051 Y119.286 E1.25879
N16853 G1 X176.412 Y119.286 E.03202
N16854 G1 X159.286 Y136.412 E1.2135
N16855 G1 X159.286 Y135.773 E.03202
N16856 G1 X175.773 Y119.286 E1.16822
N16857 G1 X175.134 Y119.286 E.03202
N16858 G1 X159.286 Y135.134 E1.12294
N16859 G1 X159.286 Y134.495 E.03202
N16860 G1 X174.495 Y119.286 E1.07766
N16861 G1 X173.856 Y119.286 E.03202
N16862 G1 X159.286 Y133.856 E1.03238
N16863 G1 X159.286 Y133.217 E.03202
N16864 G1 X173.217 Y119.286 E.9871
N16865 G1 X172.578 Y119.286 E.03202
N16866 G1 X159.286 Y132.578 E.94181
N16867 G1 X159.286 Y131.939 E.03202
N16868 G1 X171.939 Y119.286 E.89653
N16869 G1 X171.3 Y119.286 E.03202
N16870 G1 X159.286 Y131.3 E.85125
N16871 G1 X159.286 Y130.661 E.03202
N16872 G1 X170.661 Y119.286 E.80597
N16873 G1 X170.022 Y119.286 E.03202
N16874 G1 X159.286 Y130.022 E.76069
N16875 G1 X159.286 Y129.383 E.03202
N16876 G1 X169.383 Y119.286 E.7154
N16877 G1 X168.743 Y119.286 E.03202
N16878 G1 X159.286 Y128.743 E.67012
N16879 G1 X159.286 Y128.104 E.03202
N16880 G1 X168.104 Y119.286 E.62484
N16881 G1 X167.465 Y119.286 E.03202
N16882 G1 X159.286 Y127.465 E.57956
N16883 G1 X159.286 Y126.826 E.03202
N16884 G1 X166.826 Y119.286 E.53428
N16885 G1 X166.187 Y119.286 E.03202
N16886 G1 X159.286 Y126.187 E.48899
N16887 G1 X159.286 Y125.548 E.03202
N16888 G1 X165.548 Y119.286 E.44371
N16889 G1 X164.909 Y119.286 E.03202
N16890 G1 X159.286 Y124.909 E.39843
N16891 G1 X159.286 Y124.27 E.03202
N16892 G1 X164.27 Y119.286 E.35315
N16893 G1 X163.631 Y119.286 E.03202
N16894 G1 X159.286 Y123.631 E.30787
N16895 G1 X159.286 Y122.992 E.03202
N16896 G1 X162.992 Y119.286 E.26258
N16897 G1 X162.353 Y119.286 E.03202
N16898 G1 X159.286 Y122.353 E.2173
N16899 G1 X159.286 Y121.714 E.03202
N16900 G1 X161.714 Y119.286 E.17202
N16901 G1 X161.075 Y119.286 E.03202
N16902 G1 X159.286 Y121.075 E.12674
N16903 G1 X159.286 Y120.436 E.03202
N16904 G1 X160.436 Y119.286 E.08146
N16905 G1 X159.796 Y119.286 E.03202
N16906 G1 X159.083 Y119.999 E.05052
N16909 G1 X159.796 Y119.286 E-.38319
N16910 G1 X160.436 Y119.286 E-.24284
N16911 G1 X160.186 Y119.535 E-.13396
T0 ;TOOL_CHANGE:0 ; Revert to base toolN16961 G1 Z14.4
N16962 G1 E.8 F1800
N16963 ; FEATURE: Inner wall
N16964 ; LINE_WIDTH: 0.45
N16965 ; LAYER_HEIGHT: 0.2
N16966 G1 F4421.739
N16967 M204 S8000
N16968 G1 X158.916 Y201.084 E1.03439
N16969 G1 X158.916 Y118.916 E2.64221
N16970 G1 X191.084 Y118.916 E1.03439
N16971 G1 X191.084 Y201.024 E2.64028
N16972 ; COOLING_NODE: 0
N16973 M204 S10000
N16974 G1 X191.491 Y201.491 F60000
N16975 G1 F4421.739
N16976 M204 S8000
N16977 G1 X158.509 Y201.491 E1.06057
N16978 G1 X158.509 Y118.509 E2.66839
N16979 G1 X191.491 Y118.509 E1.06057
N16980 G1 X191.491 Y201.431 E2.66646
N16981 ; COOLING_NODE: 0
N16982 M204 S10000
N16983 G1 X191.898 Y201.898 F60000
N16984 G1 F4421.739
N16985 M204 S8000
N16986 G1 X158.102 Y201.898 E1.08675
N16987 G1 X158.102 Y118.102 E2.69457
N16988 G1 X191.898 Y118.102 E1.08675
N16989 G1 X191.898 Y201.838 E2.69264
N16990 ; COOLING_NODE: 0
N16991 M204 S10000
N16992 G1 X192.29 Y202.29 F60000
N16993 ; FEATURE: Outer wall
N16994 ; LINE_WIDTH: 0.42
N16995 G1 F4773.528
N16996 M204 S5000
N16997 G1 X157.71 Y202.29 E1.03002
N16998 G1 X157.71 Y117.71 E2.51935
N16999 G1 X192.29 Y117.71 E1.03002
N17000 G1 X192.29 Y202.23 E2.51756
N17001 G1 E-.8 F1800
N17002 M204 S10000
N17003 G1 X190.157 Y200.92 Z14.8 F60000
N17004 G1 Z14.4
N17005 G1 E.8 F1800
N17006 ; FEATURE: Internal solid infill
N17007 ; LINE_WIDTH: 0.42056
N17008 G1 F4766.444
N17009 M204 S8000
N17010 G1 X190.751 Y200.326 E.02505
N17011 G1 X190.751 Y199.792 E.01593
N17012 G1 X189.792 Y200.751 E.04042
N17013 G1 X189.258 Y200.751 E.01593
N17014 G1 X190.751 Y199.258 E.06295
N17015 G1 X190.751 Y198.724 E.01593
N17016 G1 X188.724 Y200.751 E.08548
N17017 G1 X188.19 Y200.751 E.01593
N17018 G1 X190.751 Y198.19 E.10801
N17019 G1 X190.751 Y197.656 E.01593
N17020 G1 X187.656 Y200.751 E.13055
N17021 G1 X187.122 Y200.751 E.01593
N17022 G1 X190.751 Y197.122 E.15308
N17023 G1 X190.751 Y196.588 E.01593
N17024 G1 X186.588 Y200.751 E.17561
N17025 G1 X186.054 Y200.751 E.01593
N17026 G1 X190.751 Y196.054 E.19814
N17027 G1 X190.751 Y195.52 E.01593
N17028 G1 X185.52 Y200.751 E.22067
N17029 G1 X184.986 Y200.751 E.01593
N17030 G1 X190.751 Y194.986 E.2432
N17031 G1 X190.751 Y194.452 E.01593
N17032 G1 X184.452 Y200.751 E.26573
N17033 G1 X183.918 Y200.751 E.01593
N17034 G1 X190.751 Y193.918 E.28826
N17035 G1 X190.751 Y193.384 E.01593
N17036 G1 X183.384 Y200.751 E.31079
N17037 G1 X182.85 Y200.751 E.01593
N17038 G1 X190.751 Y192.85 E.33332
N17039 G1 X190.751 Y192.315 E.01593
N17040 G1 X182.315 Y200.751 E.35585
N17041 G1 X181.781 Y200.751 E.01593
N17042 G1 X190.751 Y191.781 E.37838
N17043 G1 X190.751 Y191.247 E.01593
N17044 G1 X181.247 Y200.751 E.40091
N17045 G1 X180.713 Y200.751 E.01593
N17046 G1 X190.751 Y190.713 E.42344
N17047 G1 X190.751 Y190.179 E.01593
N17048 G1 X180.179 Y200.751 E.44597
N17049 G1 X179.645 Y200.751 E.01593
N17050 G1 X190.751 Y189.645 E.46851
N17051 G1 X190.751 Y189.111 E.01593
N17052 G1 X179.111 Y200.751 E.49104
N17053 G1 X178.577 Y200.751 E.01593
N17054 G1 X190.751 Y188.577 E.51357
N17055 G1 X190.751 Y188.043 E.01593
N17056 G1 X178.043 Y200.751 E.5361
N17057 G1 X177.509 Y200.751 E.01593
N17058 G1 X190.751 Y187.509 E.55863
N17059 G1 X190.751 Y186.975 E.01593
N17060 G1 X176.975 Y200.751 E.58116
N17061 G1 X176.441 Y200.751 E.01593
N17062 G1 X190.751 Y186.441 E.60369
N17063 G1 X190.751 Y185.907 E.01593
N17064 G1 X175.907 Y200.751 E.62622
N17065 G1 X175.373 Y200.751 E.01593
N17066 G1 X190.751 Y185.373 E.64875
N17067 G1 X190.751 Y184.839 E.01593
N17068 M73 P88 R6
N17069 G1 X174.839 Y200.751 E.67128
N17070 G1 X174.305 Y200.751 E.01593
N17071 G1 X190.751 Y184.305 E.69381
N17072 G1 X190.751 Y183.77 E.01593
N17073 G1 X173.77 Y200.751 E.71634
N17074 G1 X173.236 Y200.751 E.01593
N17075 G1 X190.751 Y183.236 E.73887
N17076 G1 X190.751 Y182.702 E.01593
N17077 G1 X172.702 Y200.751 E.7614
N17078 G1 X172.168 Y200.751 E.01593
N17079 G1 X190.751 Y182.168 E.78393
N17080 G1 X190.751 Y181.634 E.01593
N17081 G1 X171.634 Y200.751 E.80646
N17082 G1 X171.1 Y200.751 E.01593
N17083 G1 X190.751 Y181.1 E.829
N17084 G1 X190.751 Y180.566 E.01593
N17085 G1 X170.566 Y200.751 E.85153
N17086 G1 X170.032 Y200.751 E.01593
N17087 G1 X190.751 Y180.032 E.87406
N17088 G1 X190.751 Y179.498 E.01593
N17089 G1 X169.498 Y200.751 E.89659
N17090 G1 X168.964 Y200.751 E.01593
N17091 G1 X190.751 Y178.964 E.91912
N17092 G1 X190.751 Y178.43 E.01593
N17093 G1 X168.43 Y200.751 E.94165
N17094 G1 X167.896 Y200.751 E.01593
N17095 G1 X190.751 Y177.896 E.96418
N17096 G1 X190.751 Y177.362 E.01593
N17097 G1 X167.362 Y200.751 E.98671
N17098 G1 X166.828 Y200.751 E.01593
N17099 G1 X190.751 Y176.828 E1.00924
N17100 G1 X190.751 Y176.294 E.01593
N17101 M73 P89 R6
N17102 G1 X166.294 Y200.751 E1.03177
N17103 G1 X165.759 Y200.751 E.01593
N17104 G1 X190.751 Y175.76 E1.0543
N17105 G1 X190.751 Y175.225 E.01593
N17106 G1 X165.225 Y200.751 E1.07683
N17107 G1 X164.691 Y200.751 E.01593
N17108 G1 X190.751 Y174.691 E1.09936
N17109 G1 X190.751 Y174.157 E.01593
N17110 G1 X164.157 Y200.751 E1.12189
N17111 G1 X163.623 Y200.751 E.01593
N17112 G1 X190.751 Y173.623 E1.14442
N17113 G1 X190.751 Y173.089 E.01593
N17114 G1 X163.089 Y200.751 E1.16696
N17115 G1 X162.555 Y200.751 E.01593
N17116 G1 X190.751 Y172.555 E1.18949
N17117 G1 X190.751 Y172.021 E.01593
N17118 G1 X162.021 Y200.751 E1.21202
N17119 G1 X161.487 Y200.751 E.01593
N17120 G1 X190.751 Y171.487 E1.23455
N17121 G1 X190.751 Y170.953 E.01593
N17122 G1 X160.953 Y200.751 E1.25708
N17123 G1 X160.419 Y200.751 E.01593
N17124 G1 X190.751 Y170.419 E1.27961
N17125 G1 X190.751 Y169.885 E.01593
N17126 G1 X159.885 Y200.751 E1.30214
N17127 G1 X159.351 Y200.751 E.01593
N17128 G1 X190.751 Y169.351 E1.32467
N17129 G1 X190.751 Y168.817 E.01593
N17130 G1 X159.249 Y200.318 E1.32894
N17131 G1 X159.249 Y199.784 E.01593
N17132 G1 X190.751 Y168.283 E1.32894
N17133 G1 X190.751 Y167.749 E.01593
N17134 G1 X159.249 Y199.25 E1.32894
N17135 G1 X159.249 Y198.716 E.01593
N17136 G1 X190.751 Y167.214 E1.32894
N17137 G1 X190.751 Y166.68 E.01593
N17138 G1 X159.249 Y198.181 E1.32894
N17139 G1 X159.249 Y197.647 E.01593
N17140 G1 X190.751 Y166.146 E1.32894
N17141 G1 X190.751 Y165.612 E.01593
N17142 G1 X159.249 Y197.113 E1.32894
N17143 G1 X159.249 Y196.579 E.01593
N17144 G1 X190.751 Y165.078 E1.32894
N17145 G1 X190.751 Y164.544 E.01593
N17146 G1 X159.249 Y196.045 E1.32894
N17147 G1 X159.249 Y195.511 E.01593
N17148 G1 X190.751 Y164.01 E1.32894
N17149 G1 X190.751 Y163.476 E.01593
N17150 G1 X159.249 Y194.977 E1.32894
N17151 G1 X159.249 Y194.443 E.01593
N17152 G1 X190.751 Y162.942 E1.32894
N17153 G1 X190.751 Y162.408 E.01593
N17154 G1 X159.249 Y193.909 E1.32894
N17155 G1 X159.249 Y193.375 E.01593
N17156 G1 X190.751 Y161.874 E1.32894
N17157 G1 X190.751 Y161.34 E.01593
N17158 G1 X159.249 Y192.841 E1.32894
N17159 G1 X159.249 Y192.307 E.01593
N17160 G1 X190.751 Y160.806 E1.32894
N17161 G1 X190.751 Y160.272 E.01593
N17162 G1 X159.249 Y191.773 E1.32894
N17163 G1 X159.249 Y191.239 E.01593
N17164 G1 X190.751 Y159.738 E1.32894
N17165 G1 X190.751 Y159.204 E.01593
N17166 G1 X159.249 Y190.705 E1.32894
N17167 G1 X159.249 Y190.171 E.01593
N17168 G1 X190.751 Y158.669 E1.32894
N17169 G1 X190.751 Y158.135 E.01593
N17170 G1 X159.249 Y189.636 E1.32894
N17171 G1 X159.249 Y189.102 E.01593
N17172 G1 X190.751 Y157.601 E1.32894
N17173 G1 X190.751 Y157.067 E.01593
N17174 G1 X159.249 Y188.568 E1.32894
N17175 G1 X159.249 Y188.034 E.01593
N17176 G1 X190.751 Y156.533 E1.32894
N17177 G1 X190.751 Y155.999 E.01593
N17178 G1 X159.249 Y187.5 E1.32894
N17179 G1 X159.249 Y186.966 E.01593
N17180 G1 X190.751 Y155.465 E1.32894
N17181 G1 X190.751 Y154.931 E.01593
N17182 G1 X159.249 Y186.432 E1.32894
N17183 G1 X159.249 Y185.898 E.01593
N17184 G1 X190.751 Y154.397 E1.32894
N17185 G1 X190.751 Y153.863 E.01593
N17186 G1 X159.249 Y185.364 E1.32894
N17187 G1 X159.249 Y184.83 E.01593
N17188 G1 X190.751 Y153.329 E1.32894
N17189 G1 X190.751 Y152.795 E.01593
N17190 G1 X159.249 Y184.296 E1.32894
N17191 G1 X159.249 Y183.762 E.01593
N17192 G1 X190.751 Y152.261 E1.32894
N17193 G1 X190.751 Y151.727 E.01593
N17194 G1 X159.249 Y183.228 E1.32894
N17195 G1 X159.249 Y182.694 E.01593
N17196 G1 X190.751 Y151.193 E1.32894
N17197 G1 X190.751 Y150.659 E.01593
N17198 G1 X159.249 Y182.16 E1.32894
N17199 G1 X159.249 Y181.626 E.01593
N17200 G1 X190.751 Y150.124 E1.32894
N17201 G1 X190.751 Y149.59 E.01593
N17202 G1 X159.249 Y181.091 E1.32894
N17203 G1 X159.249 Y180.557 E.01593
N17204 G1 X190.751 Y149.056 E1.32894
N17205 G1 X190.751 Y148.522 E.01593
N17206 G1 X159.249 Y180.023 E1.32894
N17207 G1 X159.249 Y179.489 E.01593
N17208 G1 X190.751 Y147.988 E1.32894
N17209 G1 X190.751 Y147.454 E.01593
N17210 G1 X159.249 Y178.955 E1.32894
N17211 G1 X159.249 Y178.421 E.01593
N17212 G1 X190.751 Y146.92 E1.32894
N17213 G1 X190.751 Y146.386 E.01593
N17214 G1 X159.249 Y177.887 E1.32894
N17215 G1 X159.249 Y177.353 E.01593
N17216 G1 X190.751 Y145.852 E1.32894
N17217 G1 X190.751 Y145.318 E.01593
N17218 G1 X159.249 Y176.819 E1.32894
N17219 G1 X159.249 Y176.285 E.01593
N17220 G1 X190.751 Y144.784 E1.32894
N17221 G1 X190.751 Y144.25 E.01593
N17222 G1 X159.249 Y175.751 E1.32894
N17223 G1 X159.249 Y175.217 E.01593
N17224 G1 X190.751 Y143.716 E1.32894
N17225 G1 X190.751 Y143.182 E.01593
N17226 G1 X159.249 Y174.683 E1.32894
N17227 G1 X159.249 Y174.149 E.01593
N17228 G1 X190.751 Y142.648 E1.32894
N17229 G1 X190.751 Y142.113 E.01593
N17230 G1 X159.249 Y173.615 E1.32894
N17231 G1 X159.249 Y173.081 E.01593
N17232 G1 X190.751 Y141.579 E1.32894
N17233 G1 X190.751 Y141.045 E.01593
N17234 G1 X159.249 Y172.546 E1.32894
N17235 G1 X159.249 Y172.012 E.01593
N17236 M73 P90 R6
N17237 G1 X190.751 Y140.511 E1.32894
N17238 G1 X190.751 Y139.977 E.01593
N17239 G1 X159.249 Y171.478 E1.32894
N17240 G1 X159.249 Y170.944 E.01593
N17241 G1 X190.751 Y139.443 E1.32894
N17242 G1 X190.751 Y138.909 E.01593
N17243 G1 X159.249 Y170.41 E1.32894
N17244 G1 X159.249 Y169.876 E.01593
N17245 G1 X190.751 Y138.375 E1.32894
N17246 G1 X190.751 Y137.841 E.01593
N17247 G1 X159.249 Y169.342 E1.32894
N17248 G1 X159.249 Y168.808 E.01593
N17249 G1 X190.751 Y137.307 E1.32894
N17250 G1 X190.751 Y136.773 E.01593
N17251 G1 X159.249 Y168.274 E1.32894
N17252 G1 X159.249 Y167.74 E.01593
N17253 G1 X190.751 Y136.239 E1.32894
N17254 G1 X190.751 Y135.705 E.01593
N17255 G1 X159.249 Y167.206 E1.32894
N17256 G1 X159.249 Y166.672 E.01593
N17257 G1 X190.751 Y135.171 E1.32894
N17258 G1 X190.751 Y134.637 E.01593
N17259 G1 X159.249 Y166.138 E1.32894
N17260 G1 X159.249 Y165.604 E.01593
N17261 G1 X190.751 Y134.103 E1.32894
N17262 G1 X190.751 Y133.568 E.01593
N17263 G1 X159.249 Y165.07 E1.32894
N17264 G1 X159.249 Y164.535 E.01593
N17265 G1 X190.751 Y133.034 E1.32894
N17266 G1 X190.751 Y132.5 E.01593
N17267 G1 X159.249 Y164.001 E1.32894
N17268 G1 X159.249 Y163.467 E.01593
N17269 G1 X190.751 Y131.966 E1.32894
N17270 G1 X190.751 Y131.432 E.01593
N17271 G1 X159.249 Y162.933 E1.32894
N17272 G1 X159.249 Y162.399 E.01593
N17273 G1 X190.751 Y130.898 E1.32894
N17274 G1 X190.751 Y130.364 E.01593
N17275 G1 X159.249 Y161.865 E1.32894
N17276 G1 X159.249 Y161.331 E.01593
N17277 G1 X190.751 Y129.83 E1.32894
N17278 G1 X190.751 Y129.296 E.01593
N17279 G1 X159.249 Y160.797 E1.32894
N17280 G1 X159.249 Y160.263 E.01593
N17281 G1 X190.751 Y128.762 E1.32894
N17282 G1 X190.751 Y128.228 E.01593
N17283 G1 X159.249 Y159.729 E1.32894
N17284 G1 X159.249 Y159.195 E.01593
N17285 G1 X190.751 Y127.694 E1.32894
N17286 G1 X190.751 Y127.16 E.01593
N17287 G1 X159.249 Y158.661 E1.32894
N17288 G1 X159.249 Y158.127 E.01593
N17289 G1 X190.751 Y126.626 E1.32894
N17290 G1 X190.751 Y126.092 E.01593
N17291 G1 X159.249 Y157.593 E1.32894
N17292 G1 X159.249 Y157.059 E.01593
N17293 M73 P90 R5
N17294 G1 X190.751 Y125.558 E1.32894
N17295 G1 X190.751 Y125.023 E.01593
N17296 G1 X159.249 Y156.525 E1.32894
N17297 G1 X159.249 Y155.99 E.01593
N17298 G1 X190.751 Y124.489 E1.32894
N17299 G1 X190.751 Y123.955 E.01593
N17300 G1 X159.249 Y155.456 E1.32894
N17301 G1 X159.249 Y154.922 E.01593
N17302 G1 X190.751 Y123.421 E1.32894
N17303 G1 X190.751 Y122.887 E.01593
N17304 G1 X159.249 Y154.388 E1.32894
N17305 G1 X159.249 Y153.854 E.01593
N17306 G1 X190.751 Y122.353 E1.32894
N17307 G1 X190.751 Y121.819 E.01593
N17308 G1 X159.249 Y153.32 E1.32894
N17309 G1 X159.249 Y152.786 E.01593
N17310 G1 X190.751 Y121.285 E1.32894
N17311 G1 X190.751 Y120.751 E.01593
N17312 G1 X159.249 Y152.252 E1.32894
N17313 G1 X159.249 Y151.718 E.01593
N17314 G1 X190.751 Y120.217 E1.32894
N17315 G1 X190.751 Y119.683 E.01593
N17316 G1 X159.249 Y151.184 E1.32894
N17317 G1 X159.249 Y150.65 E.01593
N17318 G1 X190.65 Y119.249 E1.32469
N17319 G1 X190.116 Y119.249 E.01593
N17320 G1 X159.249 Y150.116 E1.30216
N17321 G1 X159.249 Y149.582 E.01593
N17322 G1 X189.582 Y119.249 E1.27963
N17323 G1 X189.048 Y119.249 E.01593
N17324 G1 X159.249 Y149.048 E1.2571
N17325 G1 X159.249 Y148.514 E.01593
N17326 G1 X188.514 Y119.249 E1.23457
N17327 G1 X187.98 Y119.249 E.01593
N17328 G1 X159.249 Y147.98 E1.21204
N17329 G1 X159.249 Y147.445 E.01593
N17330 G1 X187.445 Y119.249 E1.18951
N17331 G1 X186.911 Y119.249 E.01593
N17332 G1 X159.249 Y146.911 E1.16698
N17333 G1 X159.249 Y146.377 E.01593
N17334 G1 X186.377 Y119.249 E1.14445
N17335 G1 X185.843 Y119.249 E.01593
N17336 G1 X159.249 Y145.843 E1.12192
N17337 G1 X159.249 Y145.309 E.01593
N17338 G1 X185.309 Y119.249 E1.09939
N17339 G1 X184.775 Y119.249 E.01593
N17340 G1 X159.249 Y144.775 E1.07686
N17341 G1 X159.249 Y144.241 E.01593
N17342 G1 X184.241 Y119.249 E1.05433
N17343 G1 X183.707 Y119.249 E.01593
N17344 G1 X159.249 Y143.707 E1.0318
N17345 G1 X159.249 Y143.173 E.01593
N17346 G1 X183.173 Y119.249 E1.00927
N17347 G1 X182.639 Y119.249 E.01593
N17348 G1 X159.249 Y142.639 E.98673
N17349 G1 X159.249 Y142.105 E.01593
N17350 G1 X182.105 Y119.249 E.9642
N17351 G1 X181.571 Y119.249 E.01593
N17352 G1 X159.249 Y141.571 E.94167
N17353 G1 X159.249 Y141.037 E.01593
N17354 G1 X181.037 Y119.249 E.91914
N17355 G1 X180.503 Y119.249 E.01593
N17356 G1 X159.249 Y140.503 E.89661
N17357 G1 X159.249 Y139.969 E.01593
N17358 G1 X179.969 Y119.249 E.87408
N17359 G1 X179.435 Y119.249 E.01593
N17360 G1 X159.249 Y139.435 E.85155
N17361 G1 X159.249 Y138.9 E.01593
N17362 G1 X178.9 Y119.249 E.82902
N17363 G1 X178.366 Y119.249 E.01593
N17364 G1 X159.249 Y138.366 E.80649
N17365 G1 X159.249 Y137.832 E.01593
N17366 G1 X177.832 Y119.249 E.78396
N17367 G1 X177.298 Y119.249 E.01593
N17368 G1 X159.249 Y137.298 E.76143
N17369 G1 X159.249 Y136.764 E.01593
N17370 G1 X176.764 Y119.249 E.7389
N17371 G1 X176.23 Y119.249 E.01593
N17372 G1 X159.249 Y136.23 E.71637
N17373 G1 X159.249 Y135.696 E.01593
N17374 G1 X175.696 Y119.249 E.69384
N17375 G1 X175.162 Y119.249 E.01593
N17376 G1 X159.249 Y135.162 E.67131
N17377 G1 X159.249 Y134.628 E.01593
N17378 G1 X174.628 Y119.249 E.64878
N17379 G1 X174.094 Y119.249 E.01593
N17380 G1 X159.249 Y134.094 E.62624
N17381 G1 X159.249 Y133.56 E.01593
N17382 M73 P91 R5
N17383 G1 X173.56 Y119.249 E.60371
N17384 G1 X173.026 Y119.249 E.01593
N17385 G1 X159.249 Y133.026 E.58118
N17386 G1 X159.249 Y132.492 E.01593
N17387 G1 X172.492 Y119.249 E.55865
N17388 G1 X171.958 Y119.249 E.01593
N17389 G1 X159.249 Y131.958 E.53612
N17390 G1 X159.249 Y131.424 E.01593
N17391 G1 X171.424 Y119.249 E.51359
N17392 G1 X170.89 Y119.249 E.01593
N17393 G1 X159.249 Y130.889 E.49106
N17394 G1 X159.249 Y130.355 E.01593
N17395 G1 X170.355 Y119.249 E.46853
N17396 G1 X169.821 Y119.249 E.01593
N17397 G1 X159.249 Y129.821 E.446
N17398 G1 X159.249 Y129.287 E.01593
N17399 G1 X169.287 Y119.249 E.42347
N17400 G1 X168.753 Y119.249 E.01593
N17401 G1 X159.249 Y128.753 E.40094
N17402 G1 X159.249 Y128.219 E.01593
N17403 G1 X168.219 Y119.249 E.37841
N17404 G1 X167.685 Y119.249 E.01593
N17405 G1 X159.249 Y127.685 E.35588
N17406 G1 X159.249 Y127.151 E.01593
N17407 G1 X167.151 Y119.249 E.33335
N17408 G1 X166.617 Y119.249 E.01593
N17409 G1 X159.249 Y126.617 E.31082
N17410 G1 X159.249 Y126.083 E.01593
N17411 G1 X166.083 Y119.249 E.28828
N17412 G1 X165.549 Y119.249 E.01593
N17413 G1 X159.249 Y125.549 E.26575
N17414 G1 X159.249 Y125.015 E.01593
N17415 G1 X165.015 Y119.249 E.24322
N17416 G1 X164.481 Y119.249 E.01593
N17417 G1 X159.249 Y124.481 E.22069
N17418 G1 X159.249 Y123.947 E.01593
N17419 G1 X163.947 Y119.249 E.19816
N17420 G1 X163.413 Y119.249 E.01593
N17421 G1 X159.249 Y123.413 E.17563
N17422 G1 X159.249 Y122.879 E.01593
N17423 G1 X162.879 Y119.249 E.1531
N17424 G1 X162.344 Y119.249 E.01593
N17425 G1 X159.249 Y122.344 E.13057
N17426 G1 X159.249 Y121.81 E.01593
N17427 G1 X161.81 Y119.249 E.10804
N17428 G1 X161.276 Y119.249 E.01593
N17429 G1 X159.249 Y121.276 E.08551
N17430 G1 X159.249 Y120.742 E.01593
N17431 G1 X160.742 Y119.249 E.06298
N17432 G1 X160.208 Y119.249 E.01593
N17433 G1 X159.249 Y120.208 E.04045
N17434 G1 X159.249 Y119.674 E.01593
N17435 G1 X159.844 Y119.08 E.02508
N17436 ; WIPE_START
N17437 G1 X159.249 Y119.674 E-.31942
N17438 G1 X159.249 Y120.208 E-.20295
N17439 G1 X159.692 Y119.766 E-.23763
N17440 ; WIPE_END
N17441 G1 E-.04 F1800
N17442 M204 S10000
N17443 G17
N17444 G3 Z14.8 I1.217 J0 P1  F60000
N17445 ; stop printing object, unique label id: 372
N17446 M625
N17447 ; object ids of layer 72 start: 372
N17448 M624 AQAAAAAAAAA=
N17449 ;======== H2D 20250527========
N17450 ; SKIPPABLE_START
N17451 ; SKIPTYPE: timelapse
N17452 M622.1 S1 ; for prev firware, default turned on
N17453 
N17454 M1002 judge_flag timelapse_record_flag
N17455 
N17456 M622 J1
N17457 M993 A2 B2 C2
N17458 M993 A0 B0 C0
N17459 
N17460 
N17461 
N17462 
N17463     M9711 M0 E1 X261 Y132 Z14.8 S11 C10 O0 T3000
N17464 
N17465 
N17466 
N17467 M993 A3 B3 C3
N17468 
N17469 M623
N17470 ; SKIPPABLE_END
N17471 
N17472 ; object ids of this layer72 end: 372
N17473 M625
N17474 ; CHANGE_LAYER
N17475 ; Z_HEIGHT: 14.6
N17476 ; LAYER_HEIGHT: 0.200001
N17477 ;======== H2D 20250521========
N17478 ; layer num/total_layer_count: 73/75
N17479 ; update layer progress
N17480 M73 L73
N17481 M991 S0 P72 ;notify layer change
N17482 
N17483 
N17484 ; OBJECT_ID: 372
N17485 ; COOLING_NODE: 0
N17486 ; start printing object, unique label id: 372
N17487 M624 AQAAAAAAAAA=
N17488 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=14.500G1 Z14.500 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N16968 G1 X158.916 Y201.084 E1.03439
N16969 G1 X158.916 Y118.916 E2.64221
N16970 G1 X191.084 Y118.916 E1.03439
N16971 G1 X191.084 Y201.024 E2.64028
N16977 G1 X158.509 Y201.491 E1.06057
N16978 G1 X158.509 Y118.509 E2.66839
N16979 G1 X191.491 Y118.509 E1.06057
N16980 G1 X191.491 Y201.431 E2.66646
N16986 G1 X158.102 Y201.898 E1.08675
N16987 G1 X158.102 Y118.102 E2.69457
N16988 G1 X191.898 Y118.102 E1.08675
N16989 G1 X191.898 Y201.838 E2.69264
N16997 G1 X157.71 Y202.29 E1.03002
N16998 G1 X157.71 Y117.71 E2.51935
N16999 G1 X192.29 Y117.71 E1.03002
N17000 G1 X192.29 Y202.23 E2.51756
N17010 G1 X190.751 Y200.326 E.02505
N17011 G1 X190.751 Y199.792 E.01593
N17012 G1 X189.792 Y200.751 E.04042
N17013 G1 X189.258 Y200.751 E.01593
N17014 G1 X190.751 Y199.258 E.06295
N17015 G1 X190.751 Y198.724 E.01593
N17016 G1 X188.724 Y200.751 E.08548
N17017 G1 X188.19 Y200.751 E.01593
N17018 G1 X190.751 Y198.19 E.10801
N17019 G1 X190.751 Y197.656 E.01593
N17020 G1 X187.656 Y200.751 E.13055
N17021 G1 X187.122 Y200.751 E.01593
N17022 G1 X190.751 Y197.122 E.15308
N17023 G1 X190.751 Y196.588 E.01593
N17024 G1 X186.588 Y200.751 E.17561
N17025 G1 X186.054 Y200.751 E.01593
N17026 G1 X190.751 Y196.054 E.19814
N17027 G1 X190.751 Y195.52 E.01593
N17028 G1 X185.52 Y200.751 E.22067
N17029 G1 X184.986 Y200.751 E.01593
N17030 G1 X190.751 Y194.986 E.2432
N17031 G1 X190.751 Y194.452 E.01593
N17032 G1 X184.452 Y200.751 E.26573
N17033 G1 X183.918 Y200.751 E.01593
N17034 G1 X190.751 Y193.918 E.28826
N17035 G1 X190.751 Y193.384 E.01593
N17036 G1 X183.384 Y200.751 E.31079
N17037 G1 X182.85 Y200.751 E.01593
N17038 G1 X190.751 Y192.85 E.33332
N17039 G1 X190.751 Y192.315 E.01593
N17040 G1 X182.315 Y200.751 E.35585
N17041 G1 X181.781 Y200.751 E.01593
N17042 G1 X190.751 Y191.781 E.37838
N17043 G1 X190.751 Y191.247 E.01593
N17044 G1 X181.247 Y200.751 E.40091
N17045 G1 X180.713 Y200.751 E.01593
N17046 G1 X190.751 Y190.713 E.42344
N17047 G1 X190.751 Y190.179 E.01593
N17048 G1 X180.179 Y200.751 E.44597
N17049 G1 X179.645 Y200.751 E.01593
N17050 G1 X190.751 Y189.645 E.46851
N17051 G1 X190.751 Y189.111 E.01593
N17052 G1 X179.111 Y200.751 E.49104
N17053 G1 X178.577 Y200.751 E.01593
N17054 G1 X190.751 Y188.577 E.51357
N17055 G1 X190.751 Y188.043 E.01593
N17056 G1 X178.043 Y200.751 E.5361
N17057 G1 X177.509 Y200.751 E.01593
N17058 G1 X190.751 Y187.509 E.55863
N17059 G1 X190.751 Y186.975 E.01593
N17060 G1 X176.975 Y200.751 E.58116
N17061 G1 X176.441 Y200.751 E.01593
N17062 G1 X190.751 Y186.441 E.60369
N17063 G1 X190.751 Y185.907 E.01593
N17064 G1 X175.907 Y200.751 E.62622
N17065 G1 X175.373 Y200.751 E.01593
N17066 G1 X190.751 Y185.373 E.64875
N17067 G1 X190.751 Y184.839 E.01593
N17069 G1 X174.839 Y200.751 E.67128
N17070 G1 X174.305 Y200.751 E.01593
N17071 G1 X190.751 Y184.305 E.69381
N17072 G1 X190.751 Y183.77 E.01593
N17073 G1 X173.77 Y200.751 E.71634
N17074 G1 X173.236 Y200.751 E.01593
N17075 G1 X190.751 Y183.236 E.73887
N17076 G1 X190.751 Y182.702 E.01593
N17077 G1 X172.702 Y200.751 E.7614
N17078 G1 X172.168 Y200.751 E.01593
N17079 G1 X190.751 Y182.168 E.78393
N17080 G1 X190.751 Y181.634 E.01593
N17081 G1 X171.634 Y200.751 E.80646
N17082 G1 X171.1 Y200.751 E.01593
N17083 G1 X190.751 Y181.1 E.829
N17084 G1 X190.751 Y180.566 E.01593
N17085 G1 X170.566 Y200.751 E.85153
N17086 G1 X170.032 Y200.751 E.01593
N17087 G1 X190.751 Y180.032 E.87406
N17088 G1 X190.751 Y179.498 E.01593
N17089 G1 X169.498 Y200.751 E.89659
N17090 G1 X168.964 Y200.751 E.01593
N17091 G1 X190.751 Y178.964 E.91912
N17092 G1 X190.751 Y178.43 E.01593
N17093 G1 X168.43 Y200.751 E.94165
N17094 G1 X167.896 Y200.751 E.01593
N17095 G1 X190.751 Y177.896 E.96418
N17096 G1 X190.751 Y177.362 E.01593
N17097 G1 X167.362 Y200.751 E.98671
N17098 G1 X166.828 Y200.751 E.01593
N17099 G1 X190.751 Y176.828 E1.00924
N17100 G1 X190.751 Y176.294 E.01593
N17102 G1 X166.294 Y200.751 E1.03177
N17103 G1 X165.759 Y200.751 E.01593
N17104 G1 X190.751 Y175.76 E1.0543
N17105 G1 X190.751 Y175.225 E.01593
N17106 G1 X165.225 Y200.751 E1.07683
N17107 G1 X164.691 Y200.751 E.01593
N17108 G1 X190.751 Y174.691 E1.09936
N17109 G1 X190.751 Y174.157 E.01593
N17110 G1 X164.157 Y200.751 E1.12189
N17111 G1 X163.623 Y200.751 E.01593
N17112 G1 X190.751 Y173.623 E1.14442
N17113 G1 X190.751 Y173.089 E.01593
N17114 G1 X163.089 Y200.751 E1.16696
N17115 G1 X162.555 Y200.751 E.01593
N17116 G1 X190.751 Y172.555 E1.18949
N17117 G1 X190.751 Y172.021 E.01593
N17118 G1 X162.021 Y200.751 E1.21202
N17119 G1 X161.487 Y200.751 E.01593
N17120 G1 X190.751 Y171.487 E1.23455
N17121 G1 X190.751 Y170.953 E.01593
N17122 G1 X160.953 Y200.751 E1.25708
N17123 G1 X160.419 Y200.751 E.01593
N17124 G1 X190.751 Y170.419 E1.27961
N17125 G1 X190.751 Y169.885 E.01593
N17126 G1 X159.885 Y200.751 E1.30214
N17127 G1 X159.351 Y200.751 E.01593
N17128 G1 X190.751 Y169.351 E1.32467
N17129 G1 X190.751 Y168.817 E.01593
N17130 G1 X159.249 Y200.318 E1.32894
N17131 G1 X159.249 Y199.784 E.01593
N17132 G1 X190.751 Y168.283 E1.32894
N17133 G1 X190.751 Y167.749 E.01593
N17134 G1 X159.249 Y199.25 E1.32894
N17135 G1 X159.249 Y198.716 E.01593
N17136 G1 X190.751 Y167.214 E1.32894
N17137 G1 X190.751 Y166.68 E.01593
N17138 G1 X159.249 Y198.181 E1.32894
N17139 G1 X159.249 Y197.647 E.01593
N17140 G1 X190.751 Y166.146 E1.32894
N17141 G1 X190.751 Y165.612 E.01593
N17142 G1 X159.249 Y197.113 E1.32894
N17143 G1 X159.249 Y196.579 E.01593
N17144 G1 X190.751 Y165.078 E1.32894
N17145 G1 X190.751 Y164.544 E.01593
N17146 G1 X159.249 Y196.045 E1.32894
N17147 G1 X159.249 Y195.511 E.01593
N17148 G1 X190.751 Y164.01 E1.32894
N17149 G1 X190.751 Y163.476 E.01593
N17150 G1 X159.249 Y194.977 E1.32894
N17151 G1 X159.249 Y194.443 E.01593
N17152 G1 X190.751 Y162.942 E1.32894
N17153 G1 X190.751 Y162.408 E.01593
N17154 G1 X159.249 Y193.909 E1.32894
N17155 G1 X159.249 Y193.375 E.01593
N17156 G1 X190.751 Y161.874 E1.32894
N17157 G1 X190.751 Y161.34 E.01593
N17158 G1 X159.249 Y192.841 E1.32894
N17159 G1 X159.249 Y192.307 E.01593
N17160 G1 X190.751 Y160.806 E1.32894
N17161 G1 X190.751 Y160.272 E.01593
N17162 G1 X159.249 Y191.773 E1.32894
N17163 G1 X159.249 Y191.239 E.01593
N17164 G1 X190.751 Y159.738 E1.32894
N17165 G1 X190.751 Y159.204 E.01593
N17166 G1 X159.249 Y190.705 E1.32894
N17167 G1 X159.249 Y190.171 E.01593
N17168 G1 X190.751 Y158.669 E1.32894
N17169 G1 X190.751 Y158.135 E.01593
N17170 G1 X159.249 Y189.636 E1.32894
N17171 G1 X159.249 Y189.102 E.01593
N17172 G1 X190.751 Y157.601 E1.32894
N17173 G1 X190.751 Y157.067 E.01593
N17174 G1 X159.249 Y188.568 E1.32894
N17175 G1 X159.249 Y188.034 E.01593
N17176 G1 X190.751 Y156.533 E1.32894
N17177 G1 X190.751 Y155.999 E.01593
N17178 G1 X159.249 Y187.5 E1.32894
N17179 G1 X159.249 Y186.966 E.01593
N17180 G1 X190.751 Y155.465 E1.32894
N17181 G1 X190.751 Y154.931 E.01593
N17182 G1 X159.249 Y186.432 E1.32894
N17183 G1 X159.249 Y185.898 E.01593
N17184 G1 X190.751 Y154.397 E1.32894
N17185 G1 X190.751 Y153.863 E.01593
N17186 G1 X159.249 Y185.364 E1.32894
N17187 G1 X159.249 Y184.83 E.01593
N17188 G1 X190.751 Y153.329 E1.32894
N17189 G1 X190.751 Y152.795 E.01593
N17190 G1 X159.249 Y184.296 E1.32894
N17191 G1 X159.249 Y183.762 E.01593
N17192 G1 X190.751 Y152.261 E1.32894
N17193 G1 X190.751 Y151.727 E.01593
N17194 G1 X159.249 Y183.228 E1.32894
N17195 G1 X159.249 Y182.694 E.01593
N17196 G1 X190.751 Y151.193 E1.32894
N17197 G1 X190.751 Y150.659 E.01593
N17198 G1 X159.249 Y182.16 E1.32894
N17199 G1 X159.249 Y181.626 E.01593
N17200 G1 X190.751 Y150.124 E1.32894
N17201 G1 X190.751 Y149.59 E.01593
N17202 G1 X159.249 Y181.091 E1.32894
N17203 G1 X159.249 Y180.557 E.01593
N17204 G1 X190.751 Y149.056 E1.32894
N17205 G1 X190.751 Y148.522 E.01593
N17206 G1 X159.249 Y180.023 E1.32894
N17207 G1 X159.249 Y179.489 E.01593
N17208 G1 X190.751 Y147.988 E1.32894
N17209 G1 X190.751 Y147.454 E.01593
N17210 G1 X159.249 Y178.955 E1.32894
N17211 G1 X159.249 Y178.421 E.01593
N17212 G1 X190.751 Y146.92 E1.32894
N17213 G1 X190.751 Y146.386 E.01593
N17214 G1 X159.249 Y177.887 E1.32894
N17215 G1 X159.249 Y177.353 E.01593
N17216 G1 X190.751 Y145.852 E1.32894
N17217 G1 X190.751 Y145.318 E.01593
N17218 G1 X159.249 Y176.819 E1.32894
N17219 G1 X159.249 Y176.285 E.01593
N17220 G1 X190.751 Y144.784 E1.32894
N17221 G1 X190.751 Y144.25 E.01593
N17222 G1 X159.249 Y175.751 E1.32894
N17223 G1 X159.249 Y175.217 E.01593
N17224 G1 X190.751 Y143.716 E1.32894
N17225 G1 X190.751 Y143.182 E.01593
N17226 G1 X159.249 Y174.683 E1.32894
N17227 G1 X159.249 Y174.149 E.01593
N17228 G1 X190.751 Y142.648 E1.32894
N17229 G1 X190.751 Y142.113 E.01593
N17230 G1 X159.249 Y173.615 E1.32894
N17231 G1 X159.249 Y173.081 E.01593
N17232 G1 X190.751 Y141.579 E1.32894
N17233 G1 X190.751 Y141.045 E.01593
N17234 G1 X159.249 Y172.546 E1.32894
N17235 G1 X159.249 Y172.012 E.01593
N17237 G1 X190.751 Y140.511 E1.32894
N17238 G1 X190.751 Y139.977 E.01593
N17239 G1 X159.249 Y171.478 E1.32894
N17240 G1 X159.249 Y170.944 E.01593
N17241 G1 X190.751 Y139.443 E1.32894
N17242 G1 X190.751 Y138.909 E.01593
N17243 G1 X159.249 Y170.41 E1.32894
N17244 G1 X159.249 Y169.876 E.01593
N17245 G1 X190.751 Y138.375 E1.32894
N17246 G1 X190.751 Y137.841 E.01593
N17247 G1 X159.249 Y169.342 E1.32894
N17248 G1 X159.249 Y168.808 E.01593
N17249 G1 X190.751 Y137.307 E1.32894
N17250 G1 X190.751 Y136.773 E.01593
N17251 G1 X159.249 Y168.274 E1.32894
N17252 G1 X159.249 Y167.74 E.01593
N17253 G1 X190.751 Y136.239 E1.32894
N17254 G1 X190.751 Y135.705 E.01593
N17255 G1 X159.249 Y167.206 E1.32894
N17256 G1 X159.249 Y166.672 E.01593
N17257 G1 X190.751 Y135.171 E1.32894
N17258 G1 X190.751 Y134.637 E.01593
N17259 G1 X159.249 Y166.138 E1.32894
N17260 G1 X159.249 Y165.604 E.01593
N17261 G1 X190.751 Y134.103 E1.32894
N17262 G1 X190.751 Y133.568 E.01593
N17263 G1 X159.249 Y165.07 E1.32894
N17264 G1 X159.249 Y164.535 E.01593
N17265 G1 X190.751 Y133.034 E1.32894
N17266 G1 X190.751 Y132.5 E.01593
N17267 G1 X159.249 Y164.001 E1.32894
N17268 G1 X159.249 Y163.467 E.01593
N17269 G1 X190.751 Y131.966 E1.32894
N17270 G1 X190.751 Y131.432 E.01593
N17271 G1 X159.249 Y162.933 E1.32894
N17272 G1 X159.249 Y162.399 E.01593
N17273 G1 X190.751 Y130.898 E1.32894
N17274 G1 X190.751 Y130.364 E.01593
N17275 G1 X159.249 Y161.865 E1.32894
N17276 G1 X159.249 Y161.331 E.01593
N17277 G1 X190.751 Y129.83 E1.32894
N17278 G1 X190.751 Y129.296 E.01593
N17279 G1 X159.249 Y160.797 E1.32894
N17280 G1 X159.249 Y160.263 E.01593
N17281 G1 X190.751 Y128.762 E1.32894
N17282 G1 X190.751 Y128.228 E.01593
N17283 G1 X159.249 Y159.729 E1.32894
N17284 G1 X159.249 Y159.195 E.01593
N17285 G1 X190.751 Y127.694 E1.32894
N17286 G1 X190.751 Y127.16 E.01593
N17287 G1 X159.249 Y158.661 E1.32894
N17288 G1 X159.249 Y158.127 E.01593
N17289 G1 X190.751 Y126.626 E1.32894
N17290 G1 X190.751 Y126.092 E.01593
N17291 G1 X159.249 Y157.593 E1.32894
N17292 G1 X159.249 Y157.059 E.01593
N17294 G1 X190.751 Y125.558 E1.32894
N17295 G1 X190.751 Y125.023 E.01593
N17296 G1 X159.249 Y156.525 E1.32894
N17297 G1 X159.249 Y155.99 E.01593
N17298 G1 X190.751 Y124.489 E1.32894
N17299 G1 X190.751 Y123.955 E.01593
N17300 G1 X159.249 Y155.456 E1.32894
N17301 G1 X159.249 Y154.922 E.01593
N17302 G1 X190.751 Y123.421 E1.32894
N17303 G1 X190.751 Y122.887 E.01593
N17304 G1 X159.249 Y154.388 E1.32894
N17305 G1 X159.249 Y153.854 E.01593
N17306 G1 X190.751 Y122.353 E1.32894
N17307 G1 X190.751 Y121.819 E.01593
N17308 G1 X159.249 Y153.32 E1.32894
N17309 G1 X159.249 Y152.786 E.01593
N17310 G1 X190.751 Y121.285 E1.32894
N17311 G1 X190.751 Y120.751 E.01593
N17312 G1 X159.249 Y152.252 E1.32894
N17313 G1 X159.249 Y151.718 E.01593
N17314 G1 X190.751 Y120.217 E1.32894
N17315 G1 X190.751 Y119.683 E.01593
N17316 G1 X159.249 Y151.184 E1.32894
N17317 G1 X159.249 Y150.65 E.01593
N17318 G1 X190.65 Y119.249 E1.32469
N17319 G1 X190.116 Y119.249 E.01593
N17320 G1 X159.249 Y150.116 E1.30216
N17321 G1 X159.249 Y149.582 E.01593
N17322 G1 X189.582 Y119.249 E1.27963
N17323 G1 X189.048 Y119.249 E.01593
N17324 G1 X159.249 Y149.048 E1.2571
N17325 G1 X159.249 Y148.514 E.01593
N17326 G1 X188.514 Y119.249 E1.23457
N17327 G1 X187.98 Y119.249 E.01593
N17328 G1 X159.249 Y147.98 E1.21204
N17329 G1 X159.249 Y147.445 E.01593
N17330 G1 X187.445 Y119.249 E1.18951
N17331 G1 X186.911 Y119.249 E.01593
N17332 G1 X159.249 Y146.911 E1.16698
N17333 G1 X159.249 Y146.377 E.01593
N17334 G1 X186.377 Y119.249 E1.14445
N17335 G1 X185.843 Y119.249 E.01593
N17336 G1 X159.249 Y145.843 E1.12192
N17337 G1 X159.249 Y145.309 E.01593
N17338 G1 X185.309 Y119.249 E1.09939
N17339 G1 X184.775 Y119.249 E.01593
N17340 G1 X159.249 Y144.775 E1.07686
N17341 G1 X159.249 Y144.241 E.01593
N17342 G1 X184.241 Y119.249 E1.05433
N17343 G1 X183.707 Y119.249 E.01593
N17344 G1 X159.249 Y143.707 E1.0318
N17345 G1 X159.249 Y143.173 E.01593
N17346 G1 X183.173 Y119.249 E1.00927
N17347 G1 X182.639 Y119.249 E.01593
N17348 G1 X159.249 Y142.639 E.98673
N17349 G1 X159.249 Y142.105 E.01593
N17350 G1 X182.105 Y119.249 E.9642
N17351 G1 X181.571 Y119.249 E.01593
N17352 G1 X159.249 Y141.571 E.94167
N17353 G1 X159.249 Y141.037 E.01593
N17354 G1 X181.037 Y119.249 E.91914
N17355 G1 X180.503 Y119.249 E.01593
N17356 G1 X159.249 Y140.503 E.89661
N17357 G1 X159.249 Y139.969 E.01593
N17358 G1 X179.969 Y119.249 E.87408
N17359 G1 X179.435 Y119.249 E.01593
N17360 G1 X159.249 Y139.435 E.85155
N17361 G1 X159.249 Y138.9 E.01593
N17362 G1 X178.9 Y119.249 E.82902
N17363 G1 X178.366 Y119.249 E.01593
N17364 G1 X159.249 Y138.366 E.80649
N17365 G1 X159.249 Y137.832 E.01593
N17366 G1 X177.832 Y119.249 E.78396
N17367 G1 X177.298 Y119.249 E.01593
N17368 G1 X159.249 Y137.298 E.76143
N17369 G1 X159.249 Y136.764 E.01593
N17370 G1 X176.764 Y119.249 E.7389
N17371 G1 X176.23 Y119.249 E.01593
N17372 G1 X159.249 Y136.23 E.71637
N17373 G1 X159.249 Y135.696 E.01593
N17374 G1 X175.696 Y119.249 E.69384
N17375 G1 X175.162 Y119.249 E.01593
N17376 G1 X159.249 Y135.162 E.67131
N17377 G1 X159.249 Y134.628 E.01593
N17378 G1 X174.628 Y119.249 E.64878
N17379 G1 X174.094 Y119.249 E.01593
N17380 G1 X159.249 Y134.094 E.62624
N17381 G1 X159.249 Y133.56 E.01593
N17383 G1 X173.56 Y119.249 E.60371
N17384 G1 X173.026 Y119.249 E.01593
N17385 G1 X159.249 Y133.026 E.58118
N17386 G1 X159.249 Y132.492 E.01593
N17387 G1 X172.492 Y119.249 E.55865
N17388 G1 X171.958 Y119.249 E.01593
N17389 G1 X159.249 Y131.958 E.53612
N17390 G1 X159.249 Y131.424 E.01593
N17391 G1 X171.424 Y119.249 E.51359
N17392 G1 X170.89 Y119.249 E.01593
N17393 G1 X159.249 Y130.889 E.49106
N17394 G1 X159.249 Y130.355 E.01593
N17395 G1 X170.355 Y119.249 E.46853
N17396 G1 X169.821 Y119.249 E.01593
N17397 G1 X159.249 Y129.821 E.446
N17398 G1 X159.249 Y129.287 E.01593
N17399 G1 X169.287 Y119.249 E.42347
N17400 G1 X168.753 Y119.249 E.01593
N17401 G1 X159.249 Y128.753 E.40094
N17402 G1 X159.249 Y128.219 E.01593
N17403 G1 X168.219 Y119.249 E.37841
N17404 G1 X167.685 Y119.249 E.01593
N17405 G1 X159.249 Y127.685 E.35588
N17406 G1 X159.249 Y127.151 E.01593
N17407 G1 X167.151 Y119.249 E.33335
N17408 G1 X166.617 Y119.249 E.01593
N17409 G1 X159.249 Y126.617 E.31082
N17410 G1 X159.249 Y126.083 E.01593
N17411 G1 X166.083 Y119.249 E.28828
N17412 G1 X165.549 Y119.249 E.01593
N17413 G1 X159.249 Y125.549 E.26575
N17414 G1 X159.249 Y125.015 E.01593
N17415 G1 X165.015 Y119.249 E.24322
N17416 G1 X164.481 Y119.249 E.01593
N17417 G1 X159.249 Y124.481 E.22069
N17418 G1 X159.249 Y123.947 E.01593
N17419 G1 X163.947 Y119.249 E.19816
N17420 G1 X163.413 Y119.249 E.01593
N17421 G1 X159.249 Y123.413 E.17563
N17422 G1 X159.249 Y122.879 E.01593
N17423 G1 X162.879 Y119.249 E.1531
N17424 G1 X162.344 Y119.249 E.01593
N17425 G1 X159.249 Y122.344 E.13057
N17426 G1 X159.249 Y121.81 E.01593
N17427 G1 X161.81 Y119.249 E.10804
N17428 G1 X161.276 Y119.249 E.01593
N17429 G1 X159.249 Y121.276 E.08551
N17430 G1 X159.249 Y120.742 E.01593
N17431 G1 X160.742 Y119.249 E.06298
N17432 G1 X160.208 Y119.249 E.01593
N17433 G1 X159.249 Y120.208 E.04045
N17434 G1 X159.249 Y119.674 E.01593
N17435 G1 X159.844 Y119.08 E.02508
N17437 G1 X159.249 Y119.674 E-.31942
N17438 G1 X159.249 Y120.208 E-.20295
N17439 G1 X159.692 Y119.766 E-.23763
T0 ;TOOL_CHANGE:0 ; Revert to base toolN17489 G1 Z14.6
N17490 G1 E.8 F1800
N17491 ; FEATURE: Inner wall
N17492 ; LINE_WIDTH: 0.45
N17493 ; LAYER_HEIGHT: 0.2
N17494 G1 F4421.739
N17495 M204 S8000
N17496 G1 X158.916 Y201.084 E1.03439
N17497 G1 X158.916 Y118.916 E2.64221
N17498 G1 X191.084 Y118.916 E1.03439
N17499 G1 X191.084 Y201.024 E2.64028
N17500 ; COOLING_NODE: 0
N17501 M204 S10000
N17502 G1 X191.491 Y201.491 F60000
N17503 G1 F4421.739
N17504 M204 S8000
N17505 G1 X158.509 Y201.491 E1.06057
N17506 G1 X158.509 Y118.509 E2.66839
N17507 G1 X191.491 Y118.509 E1.06057
N17508 G1 X191.491 Y201.431 E2.66646
N17509 ; COOLING_NODE: 0
N17510 M204 S10000
N17511 G1 X191.898 Y201.898 F60000
N17512 G1 F4421.739
N17513 M204 S8000
N17514 G1 X158.102 Y201.898 E1.08675
N17515 G1 X158.102 Y118.102 E2.69457
N17516 G1 X191.898 Y118.102 E1.08675
N17517 G1 X191.898 Y201.838 E2.69264
N17518 ; COOLING_NODE: 0
N17519 M204 S10000
N17520 G1 X192.29 Y202.29 F60000
N17521 ; FEATURE: Outer wall
N17522 ; LINE_WIDTH: 0.42
N17523 G1 F4773.528
N17524 M204 S5000
N17525 G1 X157.71 Y202.29 E1.03002
N17526 G1 X157.71 Y117.71 E2.51935
N17527 G1 X192.29 Y117.71 E1.03002
N17528 G1 X192.29 Y202.23 E2.51756
N17529 G1 E-.8 F1800
N17530 M204 S10000
N17531 G1 X184.672 Y201.754 Z15 F60000
N17532 G1 X159.08 Y200.156 Z15
N17533 G1 Z14.6
N17534 G1 E.8 F1800
N17535 ; FEATURE: Internal solid infill
N17536 ; LINE_WIDTH: 0.42056
N17537 G1 F4766.444
N17538 M204 S8000
N17539 G1 X159.674 Y200.751 E.02508
N17540 G1 X160.208 Y200.751 E.01593
N17541 G1 X159.249 Y199.792 E.04045
N17542 G1 X159.249 Y199.258 E.01593
N17543 G1 X160.742 Y200.751 E.06298
N17544 G1 X161.276 Y200.751 E.01593
N17545 G1 X159.249 Y198.724 E.08551
N17546 G1 X159.249 Y198.19 E.01593
N17547 G1 X161.81 Y200.751 E.10804
N17548 G1 X162.344 Y200.751 E.01593
N17549 G1 X159.249 Y197.656 E.13057
N17550 G1 X159.249 Y197.121 E.01593
N17551 G1 X162.879 Y200.751 E.1531
N17552 G1 X163.413 Y200.751 E.01593
N17553 G1 X159.249 Y196.587 E.17563
N17554 G1 X159.249 Y196.053 E.01593
N17555 G1 X163.947 Y200.751 E.19816
N17556 G1 X164.481 Y200.751 E.01593
N17557 G1 X159.249 Y195.519 E.22069
N17558 G1 X159.249 Y194.985 E.01593
N17559 G1 X165.015 Y200.751 E.24322
N17560 G1 X165.549 Y200.751 E.01593
N17561 G1 X159.249 Y194.451 E.26575
N17562 G1 X159.249 Y193.917 E.01593
N17563 G1 X166.083 Y200.751 E.28828
N17564 G1 X166.617 Y200.751 E.01593
N17565 G1 X159.249 Y193.383 E.31082
N17566 G1 X159.249 Y192.849 E.01593
N17567 G1 X167.151 Y200.751 E.33335
N17568 G1 X167.685 Y200.751 E.01593
N17569 G1 X159.249 Y192.315 E.35588
N17570 G1 X159.249 Y191.781 E.01593
N17571 G1 X168.219 Y200.751 E.37841
N17572 G1 X168.753 Y200.751 E.01593
N17573 G1 X159.249 Y191.247 E.40094
N17574 G1 X159.249 Y190.713 E.01593
N17575 G1 X169.287 Y200.751 E.42347
N17576 G1 X169.821 Y200.751 E.01593
N17577 G1 X159.249 Y190.179 E.446
N17578 G1 X159.249 Y189.645 E.01593
N17579 G1 X170.355 Y200.751 E.46853
N17580 G1 X170.89 Y200.751 E.01593
N17581 G1 X159.249 Y189.11 E.49106
N17582 G1 X159.249 Y188.576 E.01593
N17583 G1 X171.424 Y200.751 E.51359
N17584 G1 X171.958 Y200.751 E.01593
N17585 G1 X159.249 Y188.042 E.53612
N17586 G1 X159.249 Y187.508 E.01593
N17587 G1 X172.492 Y200.751 E.55865
N17588 G1 X173.026 Y200.751 E.01593
N17589 G1 X159.249 Y186.974 E.58118
N17590 G1 X159.249 Y186.44 E.01593
N17591 G1 X173.56 Y200.751 E.60371
N17592 G1 X174.094 Y200.751 E.01593
N17593 G1 X159.249 Y185.906 E.62624
N17594 G1 X159.249 Y185.372 E.01593
N17595 G1 X174.628 Y200.751 E.64877
N17596 G1 X175.162 Y200.751 E.01593
N17597 G1 X159.249 Y184.838 E.67131
N17598 G1 X159.249 Y184.304 E.01593
N17599 G1 X175.696 Y200.751 E.69384
N17600 G1 X176.23 Y200.751 E.01593
N17601 G1 X159.249 Y183.77 E.71637
N17602 G1 X159.249 Y183.236 E.01593
N17603 G1 X176.764 Y200.751 E.7389
N17604 G1 X177.298 Y200.751 E.01593
N17605 G1 X159.249 Y182.702 E.76143
N17606 G1 X159.249 Y182.168 E.01593
N17607 G1 X177.832 Y200.751 E.78396
N17608 G1 X178.366 Y200.751 E.01593
N17609 G1 X159.249 Y181.634 E.80649
N17610 G1 X159.249 Y181.1 E.01593
N17611 G1 X178.9 Y200.751 E.82902
N17612 G1 X179.435 Y200.751 E.01593
N17613 G1 X159.249 Y180.565 E.85155
N17614 G1 X159.249 Y180.031 E.01593
N17615 G1 X179.969 Y200.751 E.87408
N17616 G1 X180.503 Y200.751 E.01593
N17617 G1 X159.249 Y179.497 E.89661
N17618 G1 X159.249 Y178.963 E.01593
N17619 G1 X181.037 Y200.751 E.91914
N17620 G1 X181.571 Y200.751 E.01593
N17621 G1 X159.249 Y178.429 E.94167
N17622 G1 X159.249 Y177.895 E.01593
N17623 G1 X182.105 Y200.751 E.9642
N17624 G1 X182.639 Y200.751 E.01593
N17625 G1 X159.249 Y177.361 E.98673
N17626 G1 X159.249 Y176.827 E.01593
N17627 G1 X183.173 Y200.751 E1.00927
N17628 G1 X183.707 Y200.751 E.01593
N17629 G1 X159.249 Y176.293 E1.0318
N17630 G1 X159.249 Y175.759 E.01593
N17631 G1 X184.241 Y200.751 E1.05433
N17632 G1 X184.775 Y200.751 E.01593
N17633 G1 X159.249 Y175.225 E1.07686
N17634 G1 X159.249 Y174.691 E.01593
N17635 G1 X185.309 Y200.751 E1.09939
N17636 G1 X185.843 Y200.751 E.01593
N17637 G1 X159.249 Y174.157 E1.12192
N17638 G1 X159.249 Y173.623 E.01593
N17639 G1 X186.377 Y200.751 E1.14445
N17640 G1 X186.911 Y200.751 E.01593
N17641 G1 X159.249 Y173.089 E1.16698
N17642 G1 X159.249 Y172.555 E.01593
N17643 G1 X187.445 Y200.751 E1.18951
N17644 G1 X187.98 Y200.751 E.01593
N17645 G1 X159.249 Y172.02 E1.21204
N17646 G1 X159.249 Y171.486 E.01593
N17647 G1 X188.514 Y200.751 E1.23457
N17648 G1 X189.048 Y200.751 E.01593
N17649 G1 X159.249 Y170.952 E1.2571
N17650 G1 X159.249 Y170.418 E.01593
N17651 G1 X189.582 Y200.751 E1.27963
N17652 G1 X190.116 Y200.751 E.01593
N17653 G1 X159.249 Y169.884 E1.30216
N17654 G1 X159.249 Y169.35 E.01593
N17655 G1 X190.65 Y200.751 E1.32469
N17656 G1 X190.751 Y200.751 E.003
N17657 G1 X190.751 Y200.317 E.01293
N17658 G1 X159.249 Y168.816 E1.32894
N17659 G1 X159.249 Y168.282 E.01593
N17660 G1 X190.751 Y199.783 E1.32894
N17661 G1 X190.751 Y199.249 E.01593
N17662 G1 X159.249 Y167.748 E1.32894
N17663 G1 X159.249 Y167.214 E.01593
N17664 G1 X190.751 Y198.715 E1.32894
N17665 G1 X190.751 Y198.181 E.01593
N17666 M73 P92 R5
N17667 G1 X159.249 Y166.68 E1.32894
N17668 G1 X159.249 Y166.146 E.01593
N17669 G1 X190.751 Y197.647 E1.32894
N17670 G1 X190.751 Y197.113 E.01593
N17671 M73 P92 R4
N17672 G1 X159.249 Y165.612 E1.32894
N17673 G1 X159.249 Y165.078 E.01593
N17674 G1 X190.751 Y196.579 E1.32894
N17675 G1 X190.751 Y196.045 E.01593
N17676 G1 X159.249 Y164.544 E1.32894
N17677 G1 X159.249 Y164.01 E.01593
N17678 G1 X190.751 Y195.511 E1.32894
N17679 G1 X190.751 Y194.977 E.01593
N17680 G1 X159.249 Y163.475 E1.32894
N17681 G1 X159.249 Y162.941 E.01593
N17682 G1 X190.751 Y194.442 E1.32894
N17683 G1 X190.751 Y193.908 E.01593
N17684 G1 X159.249 Y162.407 E1.32894
N17685 G1 X159.249 Y161.873 E.01593
N17686 G1 X190.751 Y193.374 E1.32894
N17687 G1 X190.751 Y192.84 E.01593
N17688 G1 X159.249 Y161.339 E1.32894
N17689 G1 X159.249 Y160.805 E.01593
N17690 G1 X190.751 Y192.306 E1.32894
N17691 G1 X190.751 Y191.772 E.01593
N17692 G1 X159.249 Y160.271 E1.32894
N17693 G1 X159.249 Y159.737 E.01593
N17694 G1 X190.751 Y191.238 E1.32894
N17695 G1 X190.751 Y190.704 E.01593
N17696 G1 X159.249 Y159.203 E1.32894
N17697 G1 X159.249 Y158.669 E.01593
N17698 G1 X190.751 Y190.17 E1.32894
N17699 G1 X190.751 Y189.636 E.01593
N17700 G1 X159.249 Y158.135 E1.32894
N17701 G1 X159.249 Y157.601 E.01593
N17702 G1 X190.751 Y189.102 E1.32894
N17703 G1 X190.751 Y188.568 E.01593
N17704 G1 X159.249 Y157.067 E1.32894
N17705 G1 X159.249 Y156.533 E.01593
N17706 G1 X190.751 Y188.034 E1.32894
N17707 G1 X190.751 Y187.5 E.01593
N17708 G1 X159.249 Y155.999 E1.32894
N17709 G1 X159.249 Y155.464 E.01593
N17710 G1 X190.751 Y186.966 E1.32894
N17711 G1 X190.751 Y186.432 E.01593
N17712 G1 X159.249 Y154.93 E1.32894
N17713 G1 X159.249 Y154.396 E.01593
N17714 G1 X190.751 Y185.897 E1.32894
N17715 G1 X190.751 Y185.363 E.01593
N17716 G1 X159.249 Y153.862 E1.32894
N17717 G1 X159.249 Y153.328 E.01593
N17718 G1 X190.751 Y184.829 E1.32894
N17719 G1 X190.751 Y184.295 E.01593
N17720 G1 X159.249 Y152.794 E1.32894
N17721 G1 X159.249 Y152.26 E.01593
N17722 G1 X190.751 Y183.761 E1.32894
N17723 G1 X190.751 Y183.227 E.01593
N17724 G1 X159.249 Y151.726 E1.32894
N17725 G1 X159.249 Y151.192 E.01593
N17726 G1 X190.751 Y182.693 E1.32894
N17727 G1 X190.751 Y182.159 E.01593
N17728 G1 X159.249 Y150.658 E1.32894
N17729 G1 X159.249 Y150.124 E.01593
N17730 G1 X190.751 Y181.625 E1.32894
N17731 G1 X190.751 Y181.091 E.01593
N17732 G1 X159.249 Y149.59 E1.32894
N17733 G1 X159.249 Y149.056 E.01593
N17734 G1 X190.751 Y180.557 E1.32894
N17735 G1 X190.751 Y180.023 E.01593
N17736 G1 X159.249 Y148.522 E1.32894
N17737 G1 X159.249 Y147.988 E.01593
N17738 G1 X190.751 Y179.489 E1.32894
N17739 G1 X190.751 Y178.955 E.01593
N17740 G1 X159.249 Y147.454 E1.32894
N17741 G1 X159.249 Y146.919 E.01593
N17742 G1 X190.751 Y178.421 E1.32894
N17743 G1 X190.751 Y177.886 E.01593
N17744 G1 X159.249 Y146.385 E1.32894
N17745 G1 X159.249 Y145.851 E.01593
N17746 G1 X190.751 Y177.352 E1.32894
N17747 G1 X190.751 Y176.818 E.01593
N17748 G1 X159.249 Y145.317 E1.32894
N17749 G1 X159.249 Y144.783 E.01593
N17750 G1 X190.751 Y176.284 E1.32894
N17751 G1 X190.751 Y175.75 E.01593
N17752 G1 X159.249 Y144.249 E1.32894
N17753 G1 X159.249 Y143.715 E.01593
N17754 G1 X190.751 Y175.216 E1.32894
N17755 G1 X190.751 Y174.682 E.01593
N17756 G1 X159.249 Y143.181 E1.32894
N17757 G1 X159.249 Y142.647 E.01593
N17758 G1 X190.751 Y174.148 E1.32894
N17759 G1 X190.751 Y173.614 E.01593
N17760 G1 X159.249 Y142.113 E1.32894
N17761 G1 X159.249 Y141.579 E.01593
N17762 G1 X190.751 Y173.08 E1.32894
N17763 G1 X190.751 Y172.546 E.01593
N17764 G1 X159.249 Y141.045 E1.32894
N17765 G1 X159.249 Y140.511 E.01593
N17766 G1 X190.751 Y172.012 E1.32894
N17767 G1 X190.751 Y171.478 E.01593
N17768 G1 X159.249 Y139.977 E1.32894
N17769 G1 X159.249 Y139.443 E.01593
N17770 G1 X190.751 Y170.944 E1.32894
N17771 G1 X190.751 Y170.41 E.01593
N17772 G1 X159.249 Y138.909 E1.32894
N17773 G1 X159.249 Y138.374 E.01593
N17774 G1 X190.751 Y169.876 E1.32894
N17775 G1 X190.751 Y169.341 E.01593
N17776 G1 X159.249 Y137.84 E1.32894
N17777 G1 X159.249 Y137.306 E.01593
N17778 G1 X190.751 Y168.807 E1.32894
N17779 G1 X190.751 Y168.273 E.01593
N17780 G1 X159.249 Y136.772 E1.32894
N17781 G1 X159.249 Y136.238 E.01593
N17782 G1 X190.751 Y167.739 E1.32894
N17783 G1 X190.751 Y167.205 E.01593
N17784 G1 X159.249 Y135.704 E1.32894
N17785 G1 X159.249 Y135.17 E.01593
N17786 G1 X190.751 Y166.671 E1.32894
N17787 G1 X190.751 Y166.137 E.01593
N17788 G1 X159.249 Y134.636 E1.32894
N17789 G1 X159.249 Y134.102 E.01593
N17790 G1 X190.751 Y165.603 E1.32894
N17791 G1 X190.751 Y165.069 E.01593
N17792 G1 X159.249 Y133.568 E1.32894
N17793 G1 X159.249 Y133.034 E.01593
N17794 G1 X190.751 Y164.535 E1.32894
N17795 G1 X190.751 Y164.001 E.01593
N17796 G1 X159.249 Y132.5 E1.32894
N17797 G1 X159.249 Y131.966 E.01593
N17798 M73 P93 R4
N17799 G1 X190.751 Y163.467 E1.32894
N17800 G1 X190.751 Y162.933 E.01593
N17801 G1 X159.249 Y131.432 E1.32894
N17802 G1 X159.249 Y130.898 E.01593
N17803 G1 X190.751 Y162.399 E1.32894
N17804 G1 X190.751 Y161.865 E.01593
N17805 G1 X159.249 Y130.364 E1.32894
N17806 G1 X159.249 Y129.829 E.01593
N17807 G1 X190.751 Y161.331 E1.32894
N17808 G1 X190.751 Y160.796 E.01593
N17809 G1 X159.249 Y129.295 E1.32894
N17810 G1 X159.249 Y128.761 E.01593
N17811 G1 X190.751 Y160.262 E1.32894
N17812 G1 X190.751 Y159.728 E.01593
N17813 G1 X159.249 Y128.227 E1.32894
N17814 G1 X159.249 Y127.693 E.01593
N17815 G1 X190.751 Y159.194 E1.32894
N17816 G1 X190.751 Y158.66 E.01593
N17817 G1 X159.249 Y127.159 E1.32894
N17818 G1 X159.249 Y126.625 E.01593
N17819 G1 X190.751 Y158.126 E1.32894
N17820 G1 X190.751 Y157.592 E.01593
N17821 G1 X159.249 Y126.091 E1.32894
N17822 G1 X159.249 Y125.557 E.01593
N17823 G1 X190.751 Y157.058 E1.32894
N17824 G1 X190.751 Y156.524 E.01593
N17825 G1 X159.249 Y125.023 E1.32894
N17826 G1 X159.249 Y124.489 E.01593
N17827 G1 X190.751 Y155.99 E1.32894
N17828 G1 X190.751 Y155.456 E.01593
N17829 G1 X159.249 Y123.955 E1.32894
N17830 G1 X159.249 Y123.421 E.01593
N17831 G1 X190.751 Y154.922 E1.32894
N17832 G1 X190.751 Y154.388 E.01593
N17833 G1 X159.249 Y122.887 E1.32894
N17834 G1 X159.249 Y122.353 E.01593
N17835 G1 X190.751 Y153.854 E1.32894
N17836 G1 X190.751 Y153.32 E.01593
N17837 G1 X159.249 Y121.818 E1.32894
N17838 G1 X159.249 Y121.284 E.01593
N17839 G1 X190.751 Y152.786 E1.32894
N17840 G1 X190.751 Y152.251 E.01593
N17841 G1 X159.249 Y120.75 E1.32894
N17842 G1 X159.249 Y120.216 E.01593
N17843 G1 X190.751 Y151.717 E1.32894
N17844 G1 X190.751 Y151.183 E.01593
N17845 G1 X159.249 Y119.682 E1.32894
N17846 G1 X159.249 Y119.249 E.01291
N17847 G1 X159.351 Y119.249 E.00302
N17848 G1 X190.751 Y150.649 E1.32467
N17849 G1 X190.751 Y150.115 E.01593
N17850 G1 X159.885 Y119.249 E1.30214
N17851 G1 X160.419 Y119.249 E.01593
N17852 G1 X190.751 Y149.581 E1.27961
N17853 G1 X190.751 Y149.047 E.01593
N17854 G1 X160.953 Y119.249 E1.25708
N17855 G1 X161.487 Y119.249 E.01593
N17856 G1 X190.751 Y148.513 E1.23455
N17857 G1 X190.751 Y147.979 E.01593
N17858 G1 X162.021 Y119.249 E1.21202
N17859 G1 X162.555 Y119.249 E.01593
N17860 G1 X190.751 Y147.445 E1.18949
N17861 G1 X190.751 Y146.911 E.01593
N17862 G1 X163.089 Y119.249 E1.16695
N17863 G1 X163.623 Y119.249 E.01593
N17864 G1 X190.751 Y146.377 E1.14442
N17865 G1 X190.751 Y145.843 E.01593
N17866 G1 X164.157 Y119.249 E1.12189
N17867 G1 X164.691 Y119.249 E.01593
N17868 G1 X190.751 Y145.309 E1.09936
N17869 G1 X190.751 Y144.775 E.01593
N17870 G1 X165.225 Y119.249 E1.07683
N17871 G1 X165.76 Y119.249 E.01593
N17872 G1 X190.751 Y144.24 E1.0543
N17873 G1 X190.751 Y143.706 E.01593
N17874 G1 X166.294 Y119.249 E1.03177
N17875 G1 X166.828 Y119.249 E.01593
N17876 G1 X190.751 Y143.172 E1.00924
N17877 G1 X190.751 Y142.638 E.01593
N17878 G1 X167.362 Y119.249 E.98671
N17879 G1 X167.896 Y119.249 E.01593
N17880 G1 X190.751 Y142.104 E.96418
N17881 G1 X190.751 Y141.57 E.01593
N17882 G1 X168.43 Y119.249 E.94165
N17883 G1 X168.964 Y119.249 E.01593
N17884 G1 X190.751 Y141.036 E.91912
N17885 G1 X190.751 Y140.502 E.01593
N17886 M73 P93 R3
N17887 G1 X169.498 Y119.249 E.89659
N17888 G1 X170.032 Y119.249 E.01593
N17889 G1 X190.751 Y139.968 E.87406
N17890 G1 X190.751 Y139.434 E.01593
N17891 G1 X170.566 Y119.249 E.85153
N17892 G1 X171.1 Y119.249 E.01593
N17893 G1 X190.751 Y138.9 E.829
N17894 G1 X190.751 Y138.366 E.01593
N17895 G1 X171.634 Y119.249 E.80646
N17896 G1 X172.168 Y119.249 E.01593
N17897 G1 X190.751 Y137.832 E.78393
N17898 G1 X190.751 Y137.298 E.01593
N17899 G1 X172.702 Y119.249 E.7614
N17900 G1 X173.236 Y119.249 E.01593
N17901 G1 X190.751 Y136.764 E.73887
N17902 G1 X190.751 Y136.23 E.01593
N17903 G1 X173.77 Y119.249 E.71634
N17904 G1 X174.305 Y119.249 E.01593
N17905 G1 X190.751 Y135.695 E.69381
N17906 G1 X190.751 Y135.161 E.01593
N17907 G1 X174.839 Y119.249 E.67128
N17908 G1 X175.373 Y119.249 E.01593
N17909 G1 X190.751 Y134.627 E.64875
N17910 G1 X190.751 Y134.093 E.01593
N17911 G1 X175.907 Y119.249 E.62622
N17912 G1 X176.441 Y119.249 E.01593
N17913 G1 X190.751 Y133.559 E.60369
N17914 G1 X190.751 Y133.025 E.01593
N17915 G1 X176.975 Y119.249 E.58116
N17916 G1 X177.509 Y119.249 E.01593
N17917 G1 X190.751 Y132.491 E.55863
N17918 G1 X190.751 Y131.957 E.01593
N17919 G1 X178.043 Y119.249 E.5361
N17920 G1 X178.577 Y119.249 E.01593
N17921 G1 X190.751 Y131.423 E.51357
N17922 G1 X190.751 Y130.889 E.01593
N17923 G1 X179.111 Y119.249 E.49104
N17924 G1 X179.645 Y119.249 E.01593
N17925 G1 X190.751 Y130.355 E.4685
N17926 G1 X190.751 Y129.821 E.01593
N17927 G1 X180.179 Y119.249 E.44597
N17928 G1 X180.713 Y119.249 E.01593
N17929 G1 X190.751 Y129.287 E.42344
N17930 G1 X190.751 Y128.753 E.01593
N17931 G1 X181.247 Y119.249 E.40091
N17932 G1 X181.781 Y119.249 E.01593
N17933 G1 X190.751 Y128.219 E.37838
N17934 G1 X190.751 Y127.685 E.01593
N17935 G1 X182.315 Y119.249 E.35585
N17936 G1 X182.85 Y119.249 E.01593
N17937 G1 X190.751 Y127.15 E.33332
N17938 G1 X190.751 Y126.616 E.01593
N17939 G1 X183.384 Y119.249 E.31079
N17940 G1 X183.918 Y119.249 E.01593
N17941 G1 X190.751 Y126.082 E.28826
N17942 G1 X190.751 Y125.548 E.01593
N17943 G1 X184.452 Y119.249 E.26573
N17944 G1 X184.986 Y119.249 E.01593
N17945 G1 X190.751 Y125.014 E.2432
N17946 G1 X190.751 Y124.48 E.01593
N17947 G1 X185.52 Y119.249 E.22067
N17948 G1 X186.054 Y119.249 E.01593
N17949 G1 X190.751 Y123.946 E.19814
N17950 G1 X190.751 Y123.412 E.01593
N17951 G1 X186.588 Y119.249 E.17561
N17952 G1 X187.122 Y119.249 E.01593
N17953 G1 X190.751 Y122.878 E.15308
N17954 G1 X190.751 Y122.344 E.01593
N17955 G1 X187.656 Y119.249 E.13054
N17956 G1 X188.19 Y119.249 E.01593
N17957 G1 X190.751 Y121.81 E.10801
N17958 G1 X190.751 Y121.276 E.01593
N17959 G1 X188.724 Y119.249 E.08548
N17960 G1 X189.258 Y119.249 E.01593
N17961 G1 X190.751 Y120.742 E.06295
N17962 G1 X190.751 Y120.208 E.01593
N17963 G1 X189.792 Y119.249 E.04042
N17964 G1 X190.326 Y119.249 E.01593
N17965 G1 X190.92 Y119.843 E.02505
N17966 ; WIPE_START
N17967 G1 X190.326 Y119.249 E-.3191
N17968 G1 X189.792 Y119.249 E-.20294
N17969 G1 X190.235 Y119.692 E-.23796
N17970 ; WIPE_END
N17971 G1 E-.04 F1800
N17972 M204 S10000
N17973 G17
N17974 G3 Z15 I1.217 J0 P1  F60000
N17975 ; stop printing object, unique label id: 372
N17976 M625
N17977 ; object ids of layer 73 start: 372
N17978 M624 AQAAAAAAAAA=
N17979 ;======== H2D 20250527========
N17980 ; SKIPPABLE_START
N17981 ; SKIPTYPE: timelapse
N17982 M622.1 S1 ; for prev firware, default turned on
N17983 
N17984 M1002 judge_flag timelapse_record_flag
N17985 
N17986 M622 J1
N17987 M993 A2 B2 C2
N17988 M993 A0 B0 C0
N17989 
N17990 
N17991 
N17992 
N17993     M9711 M0 E1 X261 Y132 Z15 S11 C10 O0 T3000
N17994 
N17995 
N17996 
N17997 M993 A3 B3 C3
N17998 
N17999 M623
N18000 ; SKIPPABLE_END
N18001 
N18002 ; object ids of this layer73 end: 372
N18003 M625
N18004 ; CHANGE_LAYER
N18005 ; Z_HEIGHT: 14.8
N18006 ; LAYER_HEIGHT: 0.2
N18007 ;======== H2D 20250521========
N18008 ; layer num/total_layer_count: 74/75
N18009 ; update layer progress
N18010 M73 L74
N18011 M991 S0 P73 ;notify layer change
N18012 
N18013 
N18014 ; OBJECT_ID: 372
N18015 ; COOLING_NODE: 0
N18016 ; start printing object, unique label id: 372
N18017 M624 AQAAAAAAAAA=
N18018 G1 X191.084 Y201.084 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=14.700G1 Z14.700 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N17496 G1 X158.916 Y201.084 E1.03439
N17497 G1 X158.916 Y118.916 E2.64221
N17498 G1 X191.084 Y118.916 E1.03439
N17499 G1 X191.084 Y201.024 E2.64028
N17505 G1 X158.509 Y201.491 E1.06057
N17506 G1 X158.509 Y118.509 E2.66839
N17507 G1 X191.491 Y118.509 E1.06057
N17508 G1 X191.491 Y201.431 E2.66646
N17514 G1 X158.102 Y201.898 E1.08675
N17515 G1 X158.102 Y118.102 E2.69457
N17516 G1 X191.898 Y118.102 E1.08675
N17517 G1 X191.898 Y201.838 E2.69264
N17525 G1 X157.71 Y202.29 E1.03002
N17526 G1 X157.71 Y117.71 E2.51935
N17527 G1 X192.29 Y117.71 E1.03002
N17528 G1 X192.29 Y202.23 E2.51756
N17539 G1 X159.674 Y200.751 E.02508
N17540 G1 X160.208 Y200.751 E.01593
N17541 G1 X159.249 Y199.792 E.04045
N17542 G1 X159.249 Y199.258 E.01593
N17543 G1 X160.742 Y200.751 E.06298
N17544 G1 X161.276 Y200.751 E.01593
N17545 G1 X159.249 Y198.724 E.08551
N17546 G1 X159.249 Y198.19 E.01593
N17547 G1 X161.81 Y200.751 E.10804
N17548 G1 X162.344 Y200.751 E.01593
N17549 G1 X159.249 Y197.656 E.13057
N17550 G1 X159.249 Y197.121 E.01593
N17551 G1 X162.879 Y200.751 E.1531
N17552 G1 X163.413 Y200.751 E.01593
N17553 G1 X159.249 Y196.587 E.17563
N17554 G1 X159.249 Y196.053 E.01593
N17555 G1 X163.947 Y200.751 E.19816
N17556 G1 X164.481 Y200.751 E.01593
N17557 G1 X159.249 Y195.519 E.22069
N17558 G1 X159.249 Y194.985 E.01593
N17559 G1 X165.015 Y200.751 E.24322
N17560 G1 X165.549 Y200.751 E.01593
N17561 G1 X159.249 Y194.451 E.26575
N17562 G1 X159.249 Y193.917 E.01593
N17563 G1 X166.083 Y200.751 E.28828
N17564 G1 X166.617 Y200.751 E.01593
N17565 G1 X159.249 Y193.383 E.31082
N17566 G1 X159.249 Y192.849 E.01593
N17567 G1 X167.151 Y200.751 E.33335
N17568 G1 X167.685 Y200.751 E.01593
N17569 G1 X159.249 Y192.315 E.35588
N17570 G1 X159.249 Y191.781 E.01593
N17571 G1 X168.219 Y200.751 E.37841
N17572 G1 X168.753 Y200.751 E.01593
N17573 G1 X159.249 Y191.247 E.40094
N17574 G1 X159.249 Y190.713 E.01593
N17575 G1 X169.287 Y200.751 E.42347
N17576 G1 X169.821 Y200.751 E.01593
N17577 G1 X159.249 Y190.179 E.446
N17578 G1 X159.249 Y189.645 E.01593
N17579 G1 X170.355 Y200.751 E.46853
N17580 G1 X170.89 Y200.751 E.01593
N17581 G1 X159.249 Y189.11 E.49106
N17582 G1 X159.249 Y188.576 E.01593
N17583 G1 X171.424 Y200.751 E.51359
N17584 G1 X171.958 Y200.751 E.01593
N17585 G1 X159.249 Y188.042 E.53612
N17586 G1 X159.249 Y187.508 E.01593
N17587 G1 X172.492 Y200.751 E.55865
N17588 G1 X173.026 Y200.751 E.01593
N17589 G1 X159.249 Y186.974 E.58118
N17590 G1 X159.249 Y186.44 E.01593
N17591 G1 X173.56 Y200.751 E.60371
N17592 G1 X174.094 Y200.751 E.01593
N17593 G1 X159.249 Y185.906 E.62624
N17594 G1 X159.249 Y185.372 E.01593
N17595 G1 X174.628 Y200.751 E.64877
N17596 G1 X175.162 Y200.751 E.01593
N17597 G1 X159.249 Y184.838 E.67131
N17598 G1 X159.249 Y184.304 E.01593
N17599 G1 X175.696 Y200.751 E.69384
N17600 G1 X176.23 Y200.751 E.01593
N17601 G1 X159.249 Y183.77 E.71637
N17602 G1 X159.249 Y183.236 E.01593
N17603 G1 X176.764 Y200.751 E.7389
N17604 G1 X177.298 Y200.751 E.01593
N17605 G1 X159.249 Y182.702 E.76143
N17606 G1 X159.249 Y182.168 E.01593
N17607 G1 X177.832 Y200.751 E.78396
N17608 G1 X178.366 Y200.751 E.01593
N17609 G1 X159.249 Y181.634 E.80649
N17610 G1 X159.249 Y181.1 E.01593
N17611 G1 X178.9 Y200.751 E.82902
N17612 G1 X179.435 Y200.751 E.01593
N17613 G1 X159.249 Y180.565 E.85155
N17614 G1 X159.249 Y180.031 E.01593
N17615 G1 X179.969 Y200.751 E.87408
N17616 G1 X180.503 Y200.751 E.01593
N17617 G1 X159.249 Y179.497 E.89661
N17618 G1 X159.249 Y178.963 E.01593
N17619 G1 X181.037 Y200.751 E.91914
N17620 G1 X181.571 Y200.751 E.01593
N17621 G1 X159.249 Y178.429 E.94167
N17622 G1 X159.249 Y177.895 E.01593
N17623 G1 X182.105 Y200.751 E.9642
N17624 G1 X182.639 Y200.751 E.01593
N17625 G1 X159.249 Y177.361 E.98673
N17626 G1 X159.249 Y176.827 E.01593
N17627 G1 X183.173 Y200.751 E1.00927
N17628 G1 X183.707 Y200.751 E.01593
N17629 G1 X159.249 Y176.293 E1.0318
N17630 G1 X159.249 Y175.759 E.01593
N17631 G1 X184.241 Y200.751 E1.05433
N17632 G1 X184.775 Y200.751 E.01593
N17633 G1 X159.249 Y175.225 E1.07686
N17634 G1 X159.249 Y174.691 E.01593
N17635 G1 X185.309 Y200.751 E1.09939
N17636 G1 X185.843 Y200.751 E.01593
N17637 G1 X159.249 Y174.157 E1.12192
N17638 G1 X159.249 Y173.623 E.01593
N17639 G1 X186.377 Y200.751 E1.14445
N17640 G1 X186.911 Y200.751 E.01593
N17641 G1 X159.249 Y173.089 E1.16698
N17642 G1 X159.249 Y172.555 E.01593
N17643 G1 X187.445 Y200.751 E1.18951
N17644 G1 X187.98 Y200.751 E.01593
N17645 G1 X159.249 Y172.02 E1.21204
N17646 G1 X159.249 Y171.486 E.01593
N17647 G1 X188.514 Y200.751 E1.23457
N17648 G1 X189.048 Y200.751 E.01593
N17649 G1 X159.249 Y170.952 E1.2571
N17650 G1 X159.249 Y170.418 E.01593
N17651 G1 X189.582 Y200.751 E1.27963
N17652 G1 X190.116 Y200.751 E.01593
N17653 G1 X159.249 Y169.884 E1.30216
N17654 G1 X159.249 Y169.35 E.01593
N17655 G1 X190.65 Y200.751 E1.32469
N17656 G1 X190.751 Y200.751 E.003
N17657 G1 X190.751 Y200.317 E.01293
N17658 G1 X159.249 Y168.816 E1.32894
N17659 G1 X159.249 Y168.282 E.01593
N17660 G1 X190.751 Y199.783 E1.32894
N17661 G1 X190.751 Y199.249 E.01593
N17662 G1 X159.249 Y167.748 E1.32894
N17663 G1 X159.249 Y167.214 E.01593
N17664 G1 X190.751 Y198.715 E1.32894
N17665 G1 X190.751 Y198.181 E.01593
N17667 G1 X159.249 Y166.68 E1.32894
N17668 G1 X159.249 Y166.146 E.01593
N17669 G1 X190.751 Y197.647 E1.32894
N17670 G1 X190.751 Y197.113 E.01593
N17672 G1 X159.249 Y165.612 E1.32894
N17673 G1 X159.249 Y165.078 E.01593
N17674 G1 X190.751 Y196.579 E1.32894
N17675 G1 X190.751 Y196.045 E.01593
N17676 G1 X159.249 Y164.544 E1.32894
N17677 G1 X159.249 Y164.01 E.01593
N17678 G1 X190.751 Y195.511 E1.32894
N17679 G1 X190.751 Y194.977 E.01593
N17680 G1 X159.249 Y163.475 E1.32894
N17681 G1 X159.249 Y162.941 E.01593
N17682 G1 X190.751 Y194.442 E1.32894
N17683 G1 X190.751 Y193.908 E.01593
N17684 G1 X159.249 Y162.407 E1.32894
N17685 G1 X159.249 Y161.873 E.01593
N17686 G1 X190.751 Y193.374 E1.32894
N17687 G1 X190.751 Y192.84 E.01593
N17688 G1 X159.249 Y161.339 E1.32894
N17689 G1 X159.249 Y160.805 E.01593
N17690 G1 X190.751 Y192.306 E1.32894
N17691 G1 X190.751 Y191.772 E.01593
N17692 G1 X159.249 Y160.271 E1.32894
N17693 G1 X159.249 Y159.737 E.01593
N17694 G1 X190.751 Y191.238 E1.32894
N17695 G1 X190.751 Y190.704 E.01593
N17696 G1 X159.249 Y159.203 E1.32894
N17697 G1 X159.249 Y158.669 E.01593
N17698 G1 X190.751 Y190.17 E1.32894
N17699 G1 X190.751 Y189.636 E.01593
N17700 G1 X159.249 Y158.135 E1.32894
N17701 G1 X159.249 Y157.601 E.01593
N17702 G1 X190.751 Y189.102 E1.32894
N17703 G1 X190.751 Y188.568 E.01593
N17704 G1 X159.249 Y157.067 E1.32894
N17705 G1 X159.249 Y156.533 E.01593
N17706 G1 X190.751 Y188.034 E1.32894
N17707 G1 X190.751 Y187.5 E.01593
N17708 G1 X159.249 Y155.999 E1.32894
N17709 G1 X159.249 Y155.464 E.01593
N17710 G1 X190.751 Y186.966 E1.32894
N17711 G1 X190.751 Y186.432 E.01593
N17712 G1 X159.249 Y154.93 E1.32894
N17713 G1 X159.249 Y154.396 E.01593
N17714 G1 X190.751 Y185.897 E1.32894
N17715 G1 X190.751 Y185.363 E.01593
N17716 G1 X159.249 Y153.862 E1.32894
N17717 G1 X159.249 Y153.328 E.01593
N17718 G1 X190.751 Y184.829 E1.32894
N17719 G1 X190.751 Y184.295 E.01593
N17720 G1 X159.249 Y152.794 E1.32894
N17721 G1 X159.249 Y152.26 E.01593
N17722 G1 X190.751 Y183.761 E1.32894
N17723 G1 X190.751 Y183.227 E.01593
N17724 G1 X159.249 Y151.726 E1.32894
N17725 G1 X159.249 Y151.192 E.01593
N17726 G1 X190.751 Y182.693 E1.32894
N17727 G1 X190.751 Y182.159 E.01593
N17728 G1 X159.249 Y150.658 E1.32894
N17729 G1 X159.249 Y150.124 E.01593
N17730 G1 X190.751 Y181.625 E1.32894
N17731 G1 X190.751 Y181.091 E.01593
N17732 G1 X159.249 Y149.59 E1.32894
N17733 G1 X159.249 Y149.056 E.01593
N17734 G1 X190.751 Y180.557 E1.32894
N17735 G1 X190.751 Y180.023 E.01593
N17736 G1 X159.249 Y148.522 E1.32894
N17737 G1 X159.249 Y147.988 E.01593
N17738 G1 X190.751 Y179.489 E1.32894
N17739 G1 X190.751 Y178.955 E.01593
N17740 G1 X159.249 Y147.454 E1.32894
N17741 G1 X159.249 Y146.919 E.01593
N17742 G1 X190.751 Y178.421 E1.32894
N17743 G1 X190.751 Y177.886 E.01593
N17744 G1 X159.249 Y146.385 E1.32894
N17745 G1 X159.249 Y145.851 E.01593
N17746 G1 X190.751 Y177.352 E1.32894
N17747 G1 X190.751 Y176.818 E.01593
N17748 G1 X159.249 Y145.317 E1.32894
N17749 G1 X159.249 Y144.783 E.01593
N17750 G1 X190.751 Y176.284 E1.32894
N17751 G1 X190.751 Y175.75 E.01593
N17752 G1 X159.249 Y144.249 E1.32894
N17753 G1 X159.249 Y143.715 E.01593
N17754 G1 X190.751 Y175.216 E1.32894
N17755 G1 X190.751 Y174.682 E.01593
N17756 G1 X159.249 Y143.181 E1.32894
N17757 G1 X159.249 Y142.647 E.01593
N17758 G1 X190.751 Y174.148 E1.32894
N17759 G1 X190.751 Y173.614 E.01593
N17760 G1 X159.249 Y142.113 E1.32894
N17761 G1 X159.249 Y141.579 E.01593
N17762 G1 X190.751 Y173.08 E1.32894
N17763 G1 X190.751 Y172.546 E.01593
N17764 G1 X159.249 Y141.045 E1.32894
N17765 G1 X159.249 Y140.511 E.01593
N17766 G1 X190.751 Y172.012 E1.32894
N17767 G1 X190.751 Y171.478 E.01593
N17768 G1 X159.249 Y139.977 E1.32894
N17769 G1 X159.249 Y139.443 E.01593
N17770 G1 X190.751 Y170.944 E1.32894
N17771 G1 X190.751 Y170.41 E.01593
N17772 G1 X159.249 Y138.909 E1.32894
N17773 G1 X159.249 Y138.374 E.01593
N17774 G1 X190.751 Y169.876 E1.32894
N17775 G1 X190.751 Y169.341 E.01593
N17776 G1 X159.249 Y137.84 E1.32894
N17777 G1 X159.249 Y137.306 E.01593
N17778 G1 X190.751 Y168.807 E1.32894
N17779 G1 X190.751 Y168.273 E.01593
N17780 G1 X159.249 Y136.772 E1.32894
N17781 G1 X159.249 Y136.238 E.01593
N17782 G1 X190.751 Y167.739 E1.32894
N17783 G1 X190.751 Y167.205 E.01593
N17784 G1 X159.249 Y135.704 E1.32894
N17785 G1 X159.249 Y135.17 E.01593
N17786 G1 X190.751 Y166.671 E1.32894
N17787 G1 X190.751 Y166.137 E.01593
N17788 G1 X159.249 Y134.636 E1.32894
N17789 G1 X159.249 Y134.102 E.01593
N17790 G1 X190.751 Y165.603 E1.32894
N17791 G1 X190.751 Y165.069 E.01593
N17792 G1 X159.249 Y133.568 E1.32894
N17793 G1 X159.249 Y133.034 E.01593
N17794 G1 X190.751 Y164.535 E1.32894
N17795 G1 X190.751 Y164.001 E.01593
N17796 G1 X159.249 Y132.5 E1.32894
N17797 G1 X159.249 Y131.966 E.01593
N17799 G1 X190.751 Y163.467 E1.32894
N17800 G1 X190.751 Y162.933 E.01593
N17801 G1 X159.249 Y131.432 E1.32894
N17802 G1 X159.249 Y130.898 E.01593
N17803 G1 X190.751 Y162.399 E1.32894
N17804 G1 X190.751 Y161.865 E.01593
N17805 G1 X159.249 Y130.364 E1.32894
N17806 G1 X159.249 Y129.829 E.01593
N17807 G1 X190.751 Y161.331 E1.32894
N17808 G1 X190.751 Y160.796 E.01593
N17809 G1 X159.249 Y129.295 E1.32894
N17810 G1 X159.249 Y128.761 E.01593
N17811 G1 X190.751 Y160.262 E1.32894
N17812 G1 X190.751 Y159.728 E.01593
N17813 G1 X159.249 Y128.227 E1.32894
N17814 G1 X159.249 Y127.693 E.01593
N17815 G1 X190.751 Y159.194 E1.32894
N17816 G1 X190.751 Y158.66 E.01593
N17817 G1 X159.249 Y127.159 E1.32894
N17818 G1 X159.249 Y126.625 E.01593
N17819 G1 X190.751 Y158.126 E1.32894
N17820 G1 X190.751 Y157.592 E.01593
N17821 G1 X159.249 Y126.091 E1.32894
N17822 G1 X159.249 Y125.557 E.01593
N17823 G1 X190.751 Y157.058 E1.32894
N17824 G1 X190.751 Y156.524 E.01593
N17825 G1 X159.249 Y125.023 E1.32894
N17826 G1 X159.249 Y124.489 E.01593
N17827 G1 X190.751 Y155.99 E1.32894
N17828 G1 X190.751 Y155.456 E.01593
N17829 G1 X159.249 Y123.955 E1.32894
N17830 G1 X159.249 Y123.421 E.01593
N17831 G1 X190.751 Y154.922 E1.32894
N17832 G1 X190.751 Y154.388 E.01593
N17833 G1 X159.249 Y122.887 E1.32894
N17834 G1 X159.249 Y122.353 E.01593
N17835 G1 X190.751 Y153.854 E1.32894
N17836 G1 X190.751 Y153.32 E.01593
N17837 G1 X159.249 Y121.818 E1.32894
N17838 G1 X159.249 Y121.284 E.01593
N17839 G1 X190.751 Y152.786 E1.32894
N17840 G1 X190.751 Y152.251 E.01593
N17841 G1 X159.249 Y120.75 E1.32894
N17842 G1 X159.249 Y120.216 E.01593
N17843 G1 X190.751 Y151.717 E1.32894
N17844 G1 X190.751 Y151.183 E.01593
N17845 G1 X159.249 Y119.682 E1.32894
N17846 G1 X159.249 Y119.249 E.01291
N17847 G1 X159.351 Y119.249 E.00302
N17848 G1 X190.751 Y150.649 E1.32467
N17849 G1 X190.751 Y150.115 E.01593
N17850 G1 X159.885 Y119.249 E1.30214
N17851 G1 X160.419 Y119.249 E.01593
N17852 G1 X190.751 Y149.581 E1.27961
N17853 G1 X190.751 Y149.047 E.01593
N17854 G1 X160.953 Y119.249 E1.25708
N17855 G1 X161.487 Y119.249 E.01593
N17856 G1 X190.751 Y148.513 E1.23455
N17857 G1 X190.751 Y147.979 E.01593
N17858 G1 X162.021 Y119.249 E1.21202
N17859 G1 X162.555 Y119.249 E.01593
N17860 G1 X190.751 Y147.445 E1.18949
N17861 G1 X190.751 Y146.911 E.01593
N17862 G1 X163.089 Y119.249 E1.16695
N17863 G1 X163.623 Y119.249 E.01593
N17864 G1 X190.751 Y146.377 E1.14442
N17865 G1 X190.751 Y145.843 E.01593
N17866 G1 X164.157 Y119.249 E1.12189
N17867 G1 X164.691 Y119.249 E.01593
N17868 G1 X190.751 Y145.309 E1.09936
N17869 G1 X190.751 Y144.775 E.01593
N17870 G1 X165.225 Y119.249 E1.07683
N17871 G1 X165.76 Y119.249 E.01593
N17872 G1 X190.751 Y144.24 E1.0543
N17873 G1 X190.751 Y143.706 E.01593
N17874 G1 X166.294 Y119.249 E1.03177
N17875 G1 X166.828 Y119.249 E.01593
N17876 G1 X190.751 Y143.172 E1.00924
N17877 G1 X190.751 Y142.638 E.01593
N17878 G1 X167.362 Y119.249 E.98671
N17879 G1 X167.896 Y119.249 E.01593
N17880 G1 X190.751 Y142.104 E.96418
N17881 G1 X190.751 Y141.57 E.01593
N17882 G1 X168.43 Y119.249 E.94165
N17883 G1 X168.964 Y119.249 E.01593
N17884 G1 X190.751 Y141.036 E.91912
N17885 G1 X190.751 Y140.502 E.01593
N17887 G1 X169.498 Y119.249 E.89659
N17888 G1 X170.032 Y119.249 E.01593
N17889 G1 X190.751 Y139.968 E.87406
N17890 G1 X190.751 Y139.434 E.01593
N17891 G1 X170.566 Y119.249 E.85153
N17892 G1 X171.1 Y119.249 E.01593
N17893 G1 X190.751 Y138.9 E.829
N17894 G1 X190.751 Y138.366 E.01593
N17895 G1 X171.634 Y119.249 E.80646
N17896 G1 X172.168 Y119.249 E.01593
N17897 G1 X190.751 Y137.832 E.78393
N17898 G1 X190.751 Y137.298 E.01593
N17899 G1 X172.702 Y119.249 E.7614
N17900 G1 X173.236 Y119.249 E.01593
N17901 G1 X190.751 Y136.764 E.73887
N17902 G1 X190.751 Y136.23 E.01593
N17903 G1 X173.77 Y119.249 E.71634
N17904 G1 X174.305 Y119.249 E.01593
N17905 G1 X190.751 Y135.695 E.69381
N17906 G1 X190.751 Y135.161 E.01593
N17907 G1 X174.839 Y119.249 E.67128
N17908 G1 X175.373 Y119.249 E.01593
N17909 G1 X190.751 Y134.627 E.64875
N17910 G1 X190.751 Y134.093 E.01593
N17911 G1 X175.907 Y119.249 E.62622
N17912 G1 X176.441 Y119.249 E.01593
N17913 G1 X190.751 Y133.559 E.60369
N17914 G1 X190.751 Y133.025 E.01593
N17915 G1 X176.975 Y119.249 E.58116
N17916 G1 X177.509 Y119.249 E.01593
N17917 G1 X190.751 Y132.491 E.55863
N17918 G1 X190.751 Y131.957 E.01593
N17919 G1 X178.043 Y119.249 E.5361
N17920 G1 X178.577 Y119.249 E.01593
N17921 G1 X190.751 Y131.423 E.51357
N17922 G1 X190.751 Y130.889 E.01593
N17923 G1 X179.111 Y119.249 E.49104
N17924 G1 X179.645 Y119.249 E.01593
N17925 G1 X190.751 Y130.355 E.4685
N17926 G1 X190.751 Y129.821 E.01593
N17927 G1 X180.179 Y119.249 E.44597
N17928 G1 X180.713 Y119.249 E.01593
N17929 G1 X190.751 Y129.287 E.42344
N17930 G1 X190.751 Y128.753 E.01593
N17931 G1 X181.247 Y119.249 E.40091
N17932 G1 X181.781 Y119.249 E.01593
N17933 G1 X190.751 Y128.219 E.37838
N17934 G1 X190.751 Y127.685 E.01593
N17935 G1 X182.315 Y119.249 E.35585
N17936 G1 X182.85 Y119.249 E.01593
N17937 G1 X190.751 Y127.15 E.33332
N17938 G1 X190.751 Y126.616 E.01593
N17939 G1 X183.384 Y119.249 E.31079
N17940 G1 X183.918 Y119.249 E.01593
N17941 G1 X190.751 Y126.082 E.28826
N17942 G1 X190.751 Y125.548 E.01593
N17943 G1 X184.452 Y119.249 E.26573
N17944 G1 X184.986 Y119.249 E.01593
N17945 G1 X190.751 Y125.014 E.2432
N17946 G1 X190.751 Y124.48 E.01593
N17947 G1 X185.52 Y119.249 E.22067
N17948 G1 X186.054 Y119.249 E.01593
N17949 G1 X190.751 Y123.946 E.19814
N17950 G1 X190.751 Y123.412 E.01593
N17951 G1 X186.588 Y119.249 E.17561
N17952 G1 X187.122 Y119.249 E.01593
N17953 G1 X190.751 Y122.878 E.15308
N17954 G1 X190.751 Y122.344 E.01593
N17955 G1 X187.656 Y119.249 E.13054
N17956 G1 X188.19 Y119.249 E.01593
N17957 G1 X190.751 Y121.81 E.10801
N17958 G1 X190.751 Y121.276 E.01593
N17959 G1 X188.724 Y119.249 E.08548
N17960 G1 X189.258 Y119.249 E.01593
N17961 G1 X190.751 Y120.742 E.06295
N17962 G1 X190.751 Y120.208 E.01593
N17963 G1 X189.792 Y119.249 E.04042
N17964 G1 X190.326 Y119.249 E.01593
N17965 G1 X190.92 Y119.843 E.02505
N17967 G1 X190.326 Y119.249 E-.3191
N17968 G1 X189.792 Y119.249 E-.20294
N17969 G1 X190.235 Y119.692 E-.23796
T0 ;TOOL_CHANGE:0 ; Revert to base toolN18019 G1 Z14.8
N18020 G1 E.8 F1800
N18021 ; FEATURE: Inner wall
N18022 ; LINE_WIDTH: 0.45
N18023 ; LAYER_HEIGHT: 0.2
N18024 G1 F4421.739
N18025 M204 S8000
N18026 G1 X158.916 Y201.084 E1.03439
N18027 G1 X158.916 Y118.916 E2.64221
N18028 G1 X191.084 Y118.916 E1.03439
N18029 G1 X191.084 Y201.024 E2.64028
N18030 ; COOLING_NODE: 0
N18031 M204 S10000
N18032 G1 X191.491 Y201.491 F60000
N18033 G1 F4421.739
N18034 M204 S8000
N18035 G1 X158.509 Y201.491 E1.06057
N18036 G1 X158.509 Y118.509 E2.66839
N18037 G1 X191.491 Y118.509 E1.06057
N18038 G1 X191.491 Y201.431 E2.66646
N18039 ; COOLING_NODE: 0
N18040 M204 S10000
N18041 G1 X191.898 Y201.898 F60000
N18042 M73 P94 R3
N18043 G1 F4421.739
N18044 M204 S8000
N18045 G1 X158.102 Y201.898 E1.08675
N18046 G1 X158.102 Y118.102 E2.69457
N18047 G1 X191.898 Y118.102 E1.08675
N18048 G1 X191.898 Y201.838 E2.69264
N18049 ; COOLING_NODE: 0
N18050 M204 S10000
N18051 G1 X192.29 Y202.29 F60000
N18052 ; FEATURE: Outer wall
N18053 ; LINE_WIDTH: 0.42
N18054 G1 F4773.528
N18055 M204 S5000
N18056 G1 X157.71 Y202.29 E1.03002
N18057 G1 X157.71 Y117.71 E2.51935
N18058 G1 X192.29 Y117.71 E1.03002
N18059 G1 X192.29 Y202.23 E2.51756
N18060 G1 E-.8 F1800
N18061 M204 S10000
N18062 G1 X190.157 Y200.92 Z15.2 F60000
N18063 G1 Z14.8
N18064 G1 E.8 F1800
N18065 ; FEATURE: Internal solid infill
N18066 ; LINE_WIDTH: 0.42056
N18067 G1 F4766.444
N18068 M204 S8000
N18069 G1 X190.751 Y200.326 E.02505
N18070 G1 X190.751 Y199.792 E.01593
N18071 G1 X189.792 Y200.751 E.04042
N18072 G1 X189.258 Y200.751 E.01593
N18073 G1 X190.751 Y199.258 E.06295
N18074 G1 X190.751 Y198.724 E.01593
N18075 G1 X188.724 Y200.751 E.08548
N18076 G1 X188.19 Y200.751 E.01593
N18077 G1 X190.751 Y198.19 E.10801
N18078 G1 X190.751 Y197.656 E.01593
N18079 G1 X187.656 Y200.751 E.13055
N18080 G1 X187.122 Y200.751 E.01593
N18081 G1 X190.751 Y197.122 E.15308
N18082 G1 X190.751 Y196.588 E.01593
N18083 G1 X186.588 Y200.751 E.17561
N18084 G1 X186.054 Y200.751 E.01593
N18085 G1 X190.751 Y196.054 E.19814
N18086 G1 X190.751 Y195.52 E.01593
N18087 G1 X185.52 Y200.751 E.22067
N18088 G1 X184.986 Y200.751 E.01593
N18089 G1 X190.751 Y194.986 E.2432
N18090 G1 X190.751 Y194.452 E.01593
N18091 G1 X184.452 Y200.751 E.26573
N18092 G1 X183.918 Y200.751 E.01593
N18093 G1 X190.751 Y193.918 E.28826
N18094 G1 X190.751 Y193.384 E.01593
N18095 G1 X183.384 Y200.751 E.31079
N18096 G1 X182.85 Y200.751 E.01593
N18097 G1 X190.751 Y192.85 E.33332
N18098 G1 X190.751 Y192.315 E.01593
N18099 G1 X182.315 Y200.751 E.35585
N18100 G1 X181.781 Y200.751 E.01593
N18101 G1 X190.751 Y191.781 E.37838
N18102 G1 X190.751 Y191.247 E.01593
N18103 G1 X181.247 Y200.751 E.40091
N18104 G1 X180.713 Y200.751 E.01593
N18105 G1 X190.751 Y190.713 E.42344
N18106 G1 X190.751 Y190.179 E.01593
N18107 G1 X180.179 Y200.751 E.44597
N18108 G1 X179.645 Y200.751 E.01593
N18109 G1 X190.751 Y189.645 E.46851
N18110 G1 X190.751 Y189.111 E.01593
N18111 G1 X179.111 Y200.751 E.49104
N18112 G1 X178.577 Y200.751 E.01593
N18113 G1 X190.751 Y188.577 E.51357
N18114 G1 X190.751 Y188.043 E.01593
N18115 G1 X178.043 Y200.751 E.5361
N18116 G1 X177.509 Y200.751 E.01593
N18117 G1 X190.751 Y187.509 E.55863
N18118 G1 X190.751 Y186.975 E.01593
N18119 G1 X176.975 Y200.751 E.58116
N18120 G1 X176.441 Y200.751 E.01593
N18121 G1 X190.751 Y186.441 E.60369
N18122 G1 X190.751 Y185.907 E.01593
N18123 G1 X175.907 Y200.751 E.62622
N18124 G1 X175.373 Y200.751 E.01593
N18125 G1 X190.751 Y185.373 E.64875
N18126 G1 X190.751 Y184.839 E.01593
N18127 G1 X174.839 Y200.751 E.67128
N18128 G1 X174.305 Y200.751 E.01593
N18129 G1 X190.751 Y184.305 E.69381
N18130 G1 X190.751 Y183.77 E.01593
N18131 G1 X173.77 Y200.751 E.71634
N18132 G1 X173.236 Y200.751 E.01593
N18133 G1 X190.751 Y183.236 E.73887
N18134 G1 X190.751 Y182.702 E.01593
N18135 G1 X172.702 Y200.751 E.7614
N18136 G1 X172.168 Y200.751 E.01593
N18137 G1 X190.751 Y182.168 E.78393
N18138 G1 X190.751 Y181.634 E.01593
N18139 G1 X171.634 Y200.751 E.80646
N18140 G1 X171.1 Y200.751 E.01593
N18141 G1 X190.751 Y181.1 E.829
N18142 G1 X190.751 Y180.566 E.01593
N18143 G1 X170.566 Y200.751 E.85153
N18144 G1 X170.032 Y200.751 E.01593
N18145 G1 X190.751 Y180.032 E.87406
N18146 G1 X190.751 Y179.498 E.01593
N18147 G1 X169.498 Y200.751 E.89659
N18148 G1 X168.964 Y200.751 E.01593
N18149 G1 X190.751 Y178.964 E.91912
N18150 G1 X190.751 Y178.43 E.01593
N18151 G1 X168.43 Y200.751 E.94165
N18152 G1 X167.896 Y200.751 E.01593
N18153 G1 X190.751 Y177.896 E.96418
N18154 G1 X190.751 Y177.362 E.01593
N18155 G1 X167.362 Y200.751 E.98671
N18156 G1 X166.828 Y200.751 E.01593
N18157 G1 X190.751 Y176.828 E1.00924
N18158 G1 X190.751 Y176.294 E.01593
N18159 G1 X166.294 Y200.751 E1.03177
N18160 G1 X165.759 Y200.751 E.01593
N18161 G1 X190.751 Y175.76 E1.0543
N18162 G1 X190.751 Y175.225 E.01593
N18163 G1 X165.225 Y200.751 E1.07683
N18164 G1 X164.691 Y200.751 E.01593
N18165 G1 X190.751 Y174.691 E1.09936
N18166 G1 X190.751 Y174.157 E.01593
N18167 G1 X164.157 Y200.751 E1.12189
N18168 G1 X163.623 Y200.751 E.01593
N18169 G1 X190.751 Y173.623 E1.14442
N18170 G1 X190.751 Y173.089 E.01593
N18171 G1 X163.089 Y200.751 E1.16696
N18172 G1 X162.555 Y200.751 E.01593
N18173 G1 X190.751 Y172.555 E1.18949
N18174 G1 X190.751 Y172.021 E.01593
N18175 G1 X162.021 Y200.751 E1.21202
N18176 G1 X161.487 Y200.751 E.01593
N18177 G1 X190.751 Y171.487 E1.23455
N18178 G1 X190.751 Y170.953 E.01593
N18179 G1 X160.953 Y200.751 E1.25708
N18180 G1 X160.419 Y200.751 E.01593
N18181 G1 X190.751 Y170.419 E1.27961
N18182 G1 X190.751 Y169.885 E.01593
N18183 G1 X159.885 Y200.751 E1.30214
N18184 G1 X159.351 Y200.751 E.01593
N18185 G1 X190.751 Y169.351 E1.32467
N18186 G1 X190.751 Y168.817 E.01593
N18187 G1 X159.249 Y200.318 E1.32894
N18188 G1 X159.249 Y199.784 E.01593
N18189 G1 X190.751 Y168.283 E1.32894
N18190 G1 X190.751 Y167.749 E.01593
N18191 G1 X159.249 Y199.25 E1.32894
N18192 G1 X159.249 Y198.716 E.01593
N18193 G1 X190.751 Y167.214 E1.32894
N18194 G1 X190.751 Y166.68 E.01593
N18195 G1 X159.249 Y198.181 E1.32894
N18196 G1 X159.249 Y197.647 E.01593
N18197 G1 X190.751 Y166.146 E1.32894
N18198 G1 X190.751 Y165.612 E.01593
N18199 G1 X159.249 Y197.113 E1.32894
N18200 G1 X159.249 Y196.579 E.01593
N18201 G1 X190.751 Y165.078 E1.32894
N18202 G1 X190.751 Y164.544 E.01593
N18203 G1 X159.249 Y196.045 E1.32894
N18204 G1 X159.249 Y195.511 E.01593
N18205 G1 X190.751 Y164.01 E1.32894
N18206 G1 X190.751 Y163.476 E.01593
N18207 G1 X159.249 Y194.977 E1.32894
N18208 G1 X159.249 Y194.443 E.01593
N18209 G1 X190.751 Y162.942 E1.32894
N18210 G1 X190.751 Y162.408 E.01593
N18211 G1 X159.249 Y193.909 E1.32894
N18212 G1 X159.249 Y193.375 E.01593
N18213 G1 X190.751 Y161.874 E1.32894
N18214 G1 X190.751 Y161.34 E.01593
N18215 G1 X159.249 Y192.841 E1.32894
N18216 G1 X159.249 Y192.307 E.01593
N18217 G1 X190.751 Y160.806 E1.32894
N18218 G1 X190.751 Y160.272 E.01593
N18219 G1 X159.249 Y191.773 E1.32894
N18220 G1 X159.249 Y191.239 E.01593
N18221 G1 X190.751 Y159.738 E1.32894
N18222 G1 X190.751 Y159.204 E.01593
N18223 G1 X159.249 Y190.705 E1.32894
N18224 G1 X159.249 Y190.171 E.01593
N18225 G1 X190.751 Y158.669 E1.32894
N18226 G1 X190.751 Y158.135 E.01593
N18227 G1 X159.249 Y189.636 E1.32894
N18228 G1 X159.249 Y189.102 E.01593
N18229 M73 P95 R3
N18230 G1 X190.751 Y157.601 E1.32894
N18231 G1 X190.751 Y157.067 E.01593
N18232 G1 X159.249 Y188.568 E1.32894
N18233 G1 X159.249 Y188.034 E.01593
N18234 G1 X190.751 Y156.533 E1.32894
N18235 G1 X190.751 Y155.999 E.01593
N18236 G1 X159.249 Y187.5 E1.32894
N18237 G1 X159.249 Y186.966 E.01593
N18238 G1 X190.751 Y155.465 E1.32894
N18239 G1 X190.751 Y154.931 E.01593
N18240 G1 X159.249 Y186.432 E1.32894
N18241 G1 X159.249 Y185.898 E.01593
N18242 G1 X190.751 Y154.397 E1.32894
N18243 G1 X190.751 Y153.863 E.01593
N18244 G1 X159.249 Y185.364 E1.32894
N18245 G1 X159.249 Y184.83 E.01593
N18246 G1 X190.751 Y153.329 E1.32894
N18247 G1 X190.751 Y152.795 E.01593
N18248 G1 X159.249 Y184.296 E1.32894
N18249 G1 X159.249 Y183.762 E.01593
N18250 G1 X190.751 Y152.261 E1.32894
N18251 G1 X190.751 Y151.727 E.01593
N18252 G1 X159.249 Y183.228 E1.32894
N18253 G1 X159.249 Y182.694 E.01593
N18254 G1 X190.751 Y151.193 E1.32894
N18255 G1 X190.751 Y150.659 E.01593
N18256 G1 X159.249 Y182.16 E1.32894
N18257 G1 X159.249 Y181.626 E.01593
N18258 M73 P95 R2
N18259 G1 X190.751 Y150.124 E1.32894
N18260 G1 X190.751 Y149.59 E.01593
N18261 G1 X159.249 Y181.091 E1.32894
N18262 G1 X159.249 Y180.557 E.01593
N18263 G1 X190.751 Y149.056 E1.32894
N18264 G1 X190.751 Y148.522 E.01593
N18265 G1 X159.249 Y180.023 E1.32894
N18266 G1 X159.249 Y179.489 E.01593
N18267 G1 X190.751 Y147.988 E1.32894
N18268 G1 X190.751 Y147.454 E.01593
N18269 G1 X159.249 Y178.955 E1.32894
N18270 G1 X159.249 Y178.421 E.01593
N18271 G1 X190.751 Y146.92 E1.32894
N18272 G1 X190.751 Y146.386 E.01593
N18273 G1 X159.249 Y177.887 E1.32894
N18274 G1 X159.249 Y177.353 E.01593
N18275 G1 X190.751 Y145.852 E1.32894
N18276 G1 X190.751 Y145.318 E.01593
N18277 G1 X159.249 Y176.819 E1.32894
N18278 G1 X159.249 Y176.285 E.01593
N18279 G1 X190.751 Y144.784 E1.32894
N18280 G1 X190.751 Y144.25 E.01593
N18281 G1 X159.249 Y175.751 E1.32894
N18282 G1 X159.249 Y175.217 E.01593
N18283 G1 X190.751 Y143.716 E1.32894
N18284 G1 X190.751 Y143.182 E.01593
N18285 G1 X159.249 Y174.683 E1.32894
N18286 G1 X159.249 Y174.149 E.01593
N18287 G1 X190.751 Y142.648 E1.32894
N18288 G1 X190.751 Y142.113 E.01593
N18289 G1 X159.249 Y173.615 E1.32894
N18290 G1 X159.249 Y173.081 E.01593
N18291 G1 X190.751 Y141.579 E1.32894
N18292 G1 X190.751 Y141.045 E.01593
N18293 G1 X159.249 Y172.546 E1.32894
N18294 G1 X159.249 Y172.012 E.01593
N18295 G1 X190.751 Y140.511 E1.32894
N18296 G1 X190.751 Y139.977 E.01593
N18297 G1 X159.249 Y171.478 E1.32894
N18298 G1 X159.249 Y170.944 E.01593
N18299 G1 X190.751 Y139.443 E1.32894
N18300 G1 X190.751 Y138.909 E.01593
N18301 G1 X159.249 Y170.41 E1.32894
N18302 G1 X159.249 Y169.876 E.01593
N18303 G1 X190.751 Y138.375 E1.32894
N18304 G1 X190.751 Y137.841 E.01593
N18305 G1 X159.249 Y169.342 E1.32894
N18306 G1 X159.249 Y168.808 E.01593
N18307 G1 X190.751 Y137.307 E1.32894
N18308 G1 X190.751 Y136.773 E.01593
N18309 G1 X159.249 Y168.274 E1.32894
N18310 G1 X159.249 Y167.74 E.01593
N18311 G1 X190.751 Y136.239 E1.32894
N18312 G1 X190.751 Y135.705 E.01593
N18313 G1 X159.249 Y167.206 E1.32894
N18314 G1 X159.249 Y166.672 E.01593
N18315 G1 X190.751 Y135.171 E1.32894
N18316 G1 X190.751 Y134.637 E.01593
N18317 G1 X159.249 Y166.138 E1.32894
N18318 G1 X159.249 Y165.604 E.01593
N18319 G1 X190.751 Y134.103 E1.32894
N18320 G1 X190.751 Y133.568 E.01593
N18321 G1 X159.249 Y165.07 E1.32894
N18322 G1 X159.249 Y164.535 E.01593
N18323 G1 X190.751 Y133.034 E1.32894
N18324 G1 X190.751 Y132.5 E.01593
N18325 G1 X159.249 Y164.001 E1.32894
N18326 G1 X159.249 Y163.467 E.01593
N18327 G1 X190.751 Y131.966 E1.32894
N18328 G1 X190.751 Y131.432 E.01593
N18329 G1 X159.249 Y162.933 E1.32894
N18330 G1 X159.249 Y162.399 E.01593
N18331 G1 X190.751 Y130.898 E1.32894
N18332 G1 X190.751 Y130.364 E.01593
N18333 G1 X159.249 Y161.865 E1.32894
N18334 G1 X159.249 Y161.331 E.01593
N18335 G1 X190.751 Y129.83 E1.32894
N18336 G1 X190.751 Y129.296 E.01593
N18337 G1 X159.249 Y160.797 E1.32894
N18338 G1 X159.249 Y160.263 E.01593
N18339 G1 X190.751 Y128.762 E1.32894
N18340 G1 X190.751 Y128.228 E.01593
N18341 G1 X159.249 Y159.729 E1.32894
N18342 G1 X159.249 Y159.195 E.01593
N18343 G1 X190.751 Y127.694 E1.32894
N18344 G1 X190.751 Y127.16 E.01593
N18345 G1 X159.249 Y158.661 E1.32894
N18346 G1 X159.249 Y158.127 E.01593
N18347 G1 X190.751 Y126.626 E1.32894
N18348 G1 X190.751 Y126.092 E.01593
N18349 G1 X159.249 Y157.593 E1.32894
N18350 G1 X159.249 Y157.059 E.01593
N18351 G1 X190.751 Y125.558 E1.32894
N18352 G1 X190.751 Y125.023 E.01593
N18353 G1 X159.249 Y156.525 E1.32894
N18354 G1 X159.249 Y155.99 E.01593
N18355 G1 X190.751 Y124.489 E1.32894
N18356 G1 X190.751 Y123.955 E.01593
N18357 G1 X159.249 Y155.456 E1.32894
N18358 G1 X159.249 Y154.922 E.01593
N18359 M73 P96 R2
N18360 G1 X190.751 Y123.421 E1.32894
N18361 G1 X190.751 Y122.887 E.01593
N18362 G1 X159.249 Y154.388 E1.32894
N18363 G1 X159.249 Y153.854 E.01593
N18364 G1 X190.751 Y122.353 E1.32894
N18365 G1 X190.751 Y121.819 E.01593
N18366 G1 X159.249 Y153.32 E1.32894
N18367 G1 X159.249 Y152.786 E.01593
N18368 G1 X190.751 Y121.285 E1.32894
N18369 G1 X190.751 Y120.751 E.01593
N18370 G1 X159.249 Y152.252 E1.32894
N18371 G1 X159.249 Y151.718 E.01593
N18372 G1 X190.751 Y120.217 E1.32894
N18373 G1 X190.751 Y119.683 E.01593
N18374 G1 X159.249 Y151.184 E1.32894
N18375 G1 X159.249 Y150.65 E.01593
N18376 G1 X190.65 Y119.249 E1.32469
N18377 G1 X190.116 Y119.249 E.01593
N18378 G1 X159.249 Y150.116 E1.30216
N18379 G1 X159.249 Y149.582 E.01593
N18380 G1 X189.582 Y119.249 E1.27963
N18381 G1 X189.048 Y119.249 E.01593
N18382 G1 X159.249 Y149.048 E1.2571
N18383 G1 X159.249 Y148.514 E.01593
N18384 G1 X188.514 Y119.249 E1.23457
N18385 G1 X187.98 Y119.249 E.01593
N18386 G1 X159.249 Y147.98 E1.21204
N18387 G1 X159.249 Y147.445 E.01593
N18388 G1 X187.445 Y119.249 E1.18951
N18389 G1 X186.911 Y119.249 E.01593
N18390 G1 X159.249 Y146.911 E1.16698
N18391 G1 X159.249 Y146.377 E.01593
N18392 G1 X186.377 Y119.249 E1.14445
N18393 G1 X185.843 Y119.249 E.01593
N18394 G1 X159.249 Y145.843 E1.12192
N18395 G1 X159.249 Y145.309 E.01593
N18396 G1 X185.309 Y119.249 E1.09939
N18397 G1 X184.775 Y119.249 E.01593
N18398 G1 X159.249 Y144.775 E1.07686
N18399 G1 X159.249 Y144.241 E.01593
N18400 G1 X184.241 Y119.249 E1.05433
N18401 G1 X183.707 Y119.249 E.01593
N18402 G1 X159.249 Y143.707 E1.0318
N18403 G1 X159.249 Y143.173 E.01593
N18404 G1 X183.173 Y119.249 E1.00927
N18405 G1 X182.639 Y119.249 E.01593
N18406 G1 X159.249 Y142.639 E.98673
N18407 G1 X159.249 Y142.105 E.01593
N18408 G1 X182.105 Y119.249 E.9642
N18409 G1 X181.571 Y119.249 E.01593
N18410 G1 X159.249 Y141.571 E.94167
N18411 G1 X159.249 Y141.037 E.01593
N18412 G1 X181.037 Y119.249 E.91914
N18413 G1 X180.503 Y119.249 E.01593
N18414 G1 X159.249 Y140.503 E.89661
N18415 G1 X159.249 Y139.969 E.01593
N18416 G1 X179.969 Y119.249 E.87408
N18417 G1 X179.435 Y119.249 E.01593
N18418 G1 X159.249 Y139.435 E.85155
N18419 G1 X159.249 Y138.9 E.01593
N18420 G1 X178.9 Y119.249 E.82902
N18421 G1 X178.366 Y119.249 E.01593
N18422 G1 X159.249 Y138.366 E.80649
N18423 G1 X159.249 Y137.832 E.01593
N18424 G1 X177.832 Y119.249 E.78396
N18425 G1 X177.298 Y119.249 E.01593
N18426 G1 X159.249 Y137.298 E.76143
N18427 G1 X159.249 Y136.764 E.01593
N18428 G1 X176.764 Y119.249 E.7389
N18429 G1 X176.23 Y119.249 E.01593
N18430 G1 X159.249 Y136.23 E.71637
N18431 G1 X159.249 Y135.696 E.01593
N18432 G1 X175.696 Y119.249 E.69384
N18433 G1 X175.162 Y119.249 E.01593
N18434 G1 X159.249 Y135.162 E.67131
N18435 G1 X159.249 Y134.628 E.01593
N18436 G1 X174.628 Y119.249 E.64878
N18437 G1 X174.094 Y119.249 E.01593
N18438 G1 X159.249 Y134.094 E.62624
N18439 G1 X159.249 Y133.56 E.01593
N18440 G1 X173.56 Y119.249 E.60371
N18441 G1 X173.026 Y119.249 E.01593
N18442 G1 X159.249 Y133.026 E.58118
N18443 G1 X159.249 Y132.492 E.01593
N18444 G1 X172.492 Y119.249 E.55865
N18445 G1 X171.958 Y119.249 E.01593
N18446 G1 X159.249 Y131.958 E.53612
N18447 G1 X159.249 Y131.424 E.01593
N18448 G1 X171.424 Y119.249 E.51359
N18449 G1 X170.89 Y119.249 E.01593
N18450 G1 X159.249 Y130.889 E.49106
N18451 G1 X159.249 Y130.355 E.01593
N18452 G1 X170.355 Y119.249 E.46853
N18453 G1 X169.821 Y119.249 E.01593
N18454 G1 X159.249 Y129.821 E.446
N18455 G1 X159.249 Y129.287 E.01593
N18456 G1 X169.287 Y119.249 E.42347
N18457 G1 X168.753 Y119.249 E.01593
N18458 G1 X159.249 Y128.753 E.40094
N18459 G1 X159.249 Y128.219 E.01593
N18460 G1 X168.219 Y119.249 E.37841
N18461 G1 X167.685 Y119.249 E.01593
N18462 G1 X159.249 Y127.685 E.35588
N18463 G1 X159.249 Y127.151 E.01593
N18464 G1 X167.151 Y119.249 E.33335
N18465 G1 X166.617 Y119.249 E.01593
N18466 G1 X159.249 Y126.617 E.31082
N18467 G1 X159.249 Y126.083 E.01593
N18468 G1 X166.083 Y119.249 E.28828
N18469 G1 X165.549 Y119.249 E.01593
N18470 G1 X159.249 Y125.549 E.26575
N18471 G1 X159.249 Y125.015 E.01593
N18472 G1 X165.015 Y119.249 E.24322
N18473 G1 X164.481 Y119.249 E.01593
N18474 G1 X159.249 Y124.481 E.22069
N18475 G1 X159.249 Y123.947 E.01593
N18476 G1 X163.947 Y119.249 E.19816
N18477 G1 X163.413 Y119.249 E.01593
N18478 G1 X159.249 Y123.413 E.17563
N18479 G1 X159.249 Y122.879 E.01593
N18480 G1 X162.879 Y119.249 E.1531
N18481 G1 X162.344 Y119.249 E.01593
N18482 G1 X159.249 Y122.344 E.13057
N18483 G1 X159.249 Y121.81 E.01593
N18484 G1 X161.81 Y119.249 E.10804
N18485 G1 X161.276 Y119.249 E.01593
N18486 G1 X159.249 Y121.276 E.08551
N18487 G1 X159.249 Y120.742 E.01593
N18488 G1 X160.742 Y119.249 E.06298
N18489 G1 X160.208 Y119.249 E.01593
N18490 G1 X159.249 Y120.208 E.04045
N18491 G1 X159.249 Y119.674 E.01593
N18492 G1 X159.844 Y119.08 E.02508
N18493 ; WIPE_START
N18494 G1 X159.249 Y119.674 E-.31942
N18495 G1 X159.249 Y120.208 E-.20295
N18496 G1 X159.692 Y119.766 E-.23763
N18497 ; WIPE_END
N18498 G1 E-.04 F1800
N18499 M204 S10000
N18500 G17
N18501 G3 Z15.2 I1.217 J0 P1  F60000
N18502 ; stop printing object, unique label id: 372
N18503 M625
N18504 ; object ids of layer 74 start: 372
N18505 M624 AQAAAAAAAAA=
N18506 ;======== H2D 20250527========
N18507 ; SKIPPABLE_START
N18508 ; SKIPTYPE: timelapse
N18509 M622.1 S1 ; for prev firware, default turned on
N18510 
N18511 M1002 judge_flag timelapse_record_flag
N18512 
N18513 M622 J1
N18514 M993 A2 B2 C2
N18515 M993 A0 B0 C0
N18516 
N18517 
N18518 
N18519 
N18520     M9711 M0 E1 X261 Y132 Z15.2 S11 C10 O0 T3000
N18521 
N18522 
N18523 
N18524 M993 A3 B3 C3
N18525 
N18526 M623
N18527 ; SKIPPABLE_END
N18528 
N18529 ; object ids of this layer74 end: 372
N18530 M625
N18531 ; CHANGE_LAYER
N18532 ; Z_HEIGHT: 15
N18533 ; LAYER_HEIGHT: 0.2
N18534 ;======== H2D 20250521========
N18535 ; layer num/total_layer_count: 75/75
N18536 ; update layer progress
N18537 M73 L75
N18538 M991 S0 P74 ;notify layer change
N18539 
N18540 
N18541 ; OBJECT_ID: 372
N18542 ; COOLING_NODE: 0
N18543 ; start printing object, unique label id: 372
N18544 M624 AQAAAAAAAAA=
N18545 G1 X192.29 Y202.29 F60000
;LAYER_CHANGE_MORTAR;BRICK_MORTAR_LAYER at Z=14.900G1 Z14.900 F600T1 ;TOOL_CHANGE:1 ; Switch to TPU mortarM104 T1 S225M106 S128N18026 G1 X158.916 Y201.084 E1.03439
N18027 G1 X158.916 Y118.916 E2.64221
N18028 G1 X191.084 Y118.916 E1.03439
N18029 G1 X191.084 Y201.024 E2.64028
N18035 G1 X158.509 Y201.491 E1.06057
N18036 G1 X158.509 Y118.509 E2.66839
N18037 G1 X191.491 Y118.509 E1.06057
N18038 G1 X191.491 Y201.431 E2.66646
N18045 G1 X158.102 Y201.898 E1.08675
N18046 G1 X158.102 Y118.102 E2.69457
N18047 G1 X191.898 Y118.102 E1.08675
N18048 G1 X191.898 Y201.838 E2.69264
N18056 G1 X157.71 Y202.29 E1.03002
N18057 G1 X157.71 Y117.71 E2.51935
N18058 G1 X192.29 Y117.71 E1.03002
N18059 G1 X192.29 Y202.23 E2.51756
N18069 G1 X190.751 Y200.326 E.02505
N18070 G1 X190.751 Y199.792 E.01593
N18071 G1 X189.792 Y200.751 E.04042
N18072 G1 X189.258 Y200.751 E.01593
N18073 G1 X190.751 Y199.258 E.06295
N18074 G1 X190.751 Y198.724 E.01593
N18075 G1 X188.724 Y200.751 E.08548
N18076 G1 X188.19 Y200.751 E.01593
N18077 G1 X190.751 Y198.19 E.10801
N18078 G1 X190.751 Y197.656 E.01593
N18079 G1 X187.656 Y200.751 E.13055
N18080 G1 X187.122 Y200.751 E.01593
N18081 G1 X190.751 Y197.122 E.15308
N18082 G1 X190.751 Y196.588 E.01593
N18083 G1 X186.588 Y200.751 E.17561
N18084 G1 X186.054 Y200.751 E.01593
N18085 G1 X190.751 Y196.054 E.19814
N18086 G1 X190.751 Y195.52 E.01593
N18087 G1 X185.52 Y200.751 E.22067
N18088 G1 X184.986 Y200.751 E.01593
N18089 G1 X190.751 Y194.986 E.2432
N18090 G1 X190.751 Y194.452 E.01593
N18091 G1 X184.452 Y200.751 E.26573
N18092 G1 X183.918 Y200.751 E.01593
N18093 G1 X190.751 Y193.918 E.28826
N18094 G1 X190.751 Y193.384 E.01593
N18095 G1 X183.384 Y200.751 E.31079
N18096 G1 X182.85 Y200.751 E.01593
N18097 G1 X190.751 Y192.85 E.33332
N18098 G1 X190.751 Y192.315 E.01593
N18099 G1 X182.315 Y200.751 E.35585
N18100 G1 X181.781 Y200.751 E.01593
N18101 G1 X190.751 Y191.781 E.37838
N18102 G1 X190.751 Y191.247 E.01593
N18103 G1 X181.247 Y200.751 E.40091
N18104 G1 X180.713 Y200.751 E.01593
N18105 G1 X190.751 Y190.713 E.42344
N18106 G1 X190.751 Y190.179 E.01593
N18107 G1 X180.179 Y200.751 E.44597
N18108 G1 X179.645 Y200.751 E.01593
N18109 G1 X190.751 Y189.645 E.46851
N18110 G1 X190.751 Y189.111 E.01593
N18111 G1 X179.111 Y200.751 E.49104
N18112 G1 X178.577 Y200.751 E.01593
N18113 G1 X190.751 Y188.577 E.51357
N18114 G1 X190.751 Y188.043 E.01593
N18115 G1 X178.043 Y200.751 E.5361
N18116 G1 X177.509 Y200.751 E.01593
N18117 G1 X190.751 Y187.509 E.55863
N18118 G1 X190.751 Y186.975 E.01593
N18119 G1 X176.975 Y200.751 E.58116
N18120 G1 X176.441 Y200.751 E.01593
N18121 G1 X190.751 Y186.441 E.60369
N18122 G1 X190.751 Y185.907 E.01593
N18123 G1 X175.907 Y200.751 E.62622
N18124 G1 X175.373 Y200.751 E.01593
N18125 G1 X190.751 Y185.373 E.64875
N18126 G1 X190.751 Y184.839 E.01593
N18127 G1 X174.839 Y200.751 E.67128
N18128 G1 X174.305 Y200.751 E.01593
N18129 G1 X190.751 Y184.305 E.69381
N18130 G1 X190.751 Y183.77 E.01593
N18131 G1 X173.77 Y200.751 E.71634
N18132 G1 X173.236 Y200.751 E.01593
N18133 G1 X190.751 Y183.236 E.73887
N18134 G1 X190.751 Y182.702 E.01593
N18135 G1 X172.702 Y200.751 E.7614
N18136 G1 X172.168 Y200.751 E.01593
N18137 G1 X190.751 Y182.168 E.78393
N18138 G1 X190.751 Y181.634 E.01593
N18139 G1 X171.634 Y200.751 E.80646
N18140 G1 X171.1 Y200.751 E.01593
N18141 G1 X190.751 Y181.1 E.829
N18142 G1 X190.751 Y180.566 E.01593
N18143 G1 X170.566 Y200.751 E.85153
N18144 G1 X170.032 Y200.751 E.01593
N18145 G1 X190.751 Y180.032 E.87406
N18146 G1 X190.751 Y179.498 E.01593
N18147 G1 X169.498 Y200.751 E.89659
N18148 G1 X168.964 Y200.751 E.01593
N18149 G1 X190.751 Y178.964 E.91912
N18150 G1 X190.751 Y178.43 E.01593
N18151 G1 X168.43 Y200.751 E.94165
N18152 G1 X167.896 Y200.751 E.01593
N18153 G1 X190.751 Y177.896 E.96418
N18154 G1 X190.751 Y177.362 E.01593
N18155 G1 X167.362 Y200.751 E.98671
N18156 G1 X166.828 Y200.751 E.01593
N18157 G1 X190.751 Y176.828 E1.00924
N18158 G1 X190.751 Y176.294 E.01593
N18159 G1 X166.294 Y200.751 E1.03177
N18160 G1 X165.759 Y200.751 E.01593
N18161 G1 X190.751 Y175.76 E1.0543
N18162 G1 X190.751 Y175.225 E.01593
N18163 G1 X165.225 Y200.751 E1.07683
N18164 G1 X164.691 Y200.751 E.01593
N18165 G1 X190.751 Y174.691 E1.09936
N18166 G1 X190.751 Y174.157 E.01593
N18167 G1 X164.157 Y200.751 E1.12189
N18168 G1 X163.623 Y200.751 E.01593
N18169 G1 X190.751 Y173.623 E1.14442
N18170 G1 X190.751 Y173.089 E.01593
N18171 G1 X163.089 Y200.751 E1.16696
N18172 G1 X162.555 Y200.751 E.01593
N18173 G1 X190.751 Y172.555 E1.18949
N18174 G1 X190.751 Y172.021 E.01593
N18175 G1 X162.021 Y200.751 E1.21202
N18176 G1 X161.487 Y200.751 E.01593
N18177 G1 X190.751 Y171.487 E1.23455
N18178 G1 X190.751 Y170.953 E.01593
N18179 G1 X160.953 Y200.751 E1.25708
N18180 G1 X160.419 Y200.751 E.01593
N18181 G1 X190.751 Y170.419 E1.27961
N18182 G1 X190.751 Y169.885 E.01593
N18183 G1 X159.885 Y200.751 E1.30214
N18184 G1 X159.351 Y200.751 E.01593
N18185 G1 X190.751 Y169.351 E1.32467
N18186 G1 X190.751 Y168.817 E.01593
N18187 G1 X159.249 Y200.318 E1.32894
N18188 G1 X159.249 Y199.784 E.01593
N18189 G1 X190.751 Y168.283 E1.32894
N18190 G1 X190.751 Y167.749 E.01593
N18191 G1 X159.249 Y199.25 E1.32894
N18192 G1 X159.249 Y198.716 E.01593
N18193 G1 X190.751 Y167.214 E1.32894
N18194 G1 X190.751 Y166.68 E.01593
N18195 G1 X159.249 Y198.181 E1.32894
N18196 G1 X159.249 Y197.647 E.01593
N18197 G1 X190.751 Y166.146 E1.32894
N18198 G1 X190.751 Y165.612 E.01593
N18199 G1 X159.249 Y197.113 E1.32894
N18200 G1 X159.249 Y196.579 E.01593
N18201 G1 X190.751 Y165.078 E1.32894
N18202 G1 X190.751 Y164.544 E.01593
N18203 G1 X159.249 Y196.045 E1.32894
N18204 G1 X159.249 Y195.511 E.01593
N18205 G1 X190.751 Y164.01 E1.32894
N18206 G1 X190.751 Y163.476 E.01593
N18207 G1 X159.249 Y194.977 E1.32894
N18208 G1 X159.249 Y194.443 E.01593
N18209 G1 X190.751 Y162.942 E1.32894
N18210 G1 X190.751 Y162.408 E.01593
N18211 G1 X159.249 Y193.909 E1.32894
N18212 G1 X159.249 Y193.375 E.01593
N18213 G1 X190.751 Y161.874 E1.32894
N18214 G1 X190.751 Y161.34 E.01593
N18215 G1 X159.249 Y192.841 E1.32894
N18216 G1 X159.249 Y192.307 E.01593
N18217 G1 X190.751 Y160.806 E1.32894
N18218 G1 X190.751 Y160.272 E.01593
N18219 G1 X159.249 Y191.773 E1.32894
N18220 G1 X159.249 Y191.239 E.01593
N18221 G1 X190.751 Y159.738 E1.32894
N18222 G1 X190.751 Y159.204 E.01593
N18223 G1 X159.249 Y190.705 E1.32894
N18224 G1 X159.249 Y190.171 E.01593
N18225 G1 X190.751 Y158.669 E1.32894
N18226 G1 X190.751 Y158.135 E.01593
N18227 G1 X159.249 Y189.636 E1.32894
N18228 G1 X159.249 Y189.102 E.01593
N18230 G1 X190.751 Y157.601 E1.32894
N18231 G1 X190.751 Y157.067 E.01593
N18232 G1 X159.249 Y188.568 E1.32894
N18233 G1 X159.249 Y188.034 E.01593
N18234 G1 X190.751 Y156.533 E1.32894
N18235 G1 X190.751 Y155.999 E.01593
N18236 G1 X159.249 Y187.5 E1.32894
N18237 G1 X159.249 Y186.966 E.01593
N18238 G1 X190.751 Y155.465 E1.32894
N18239 G1 X190.751 Y154.931 E.01593
N18240 G1 X159.249 Y186.432 E1.32894
N18241 G1 X159.249 Y185.898 E.01593
N18242 G1 X190.751 Y154.397 E1.32894
N18243 G1 X190.751 Y153.863 E.01593
N18244 G1 X159.249 Y185.364 E1.32894
N18245 G1 X159.249 Y184.83 E.01593
N18246 G1 X190.751 Y153.329 E1.32894
N18247 G1 X190.751 Y152.795 E.01593
N18248 G1 X159.249 Y184.296 E1.32894
N18249 G1 X159.249 Y183.762 E.01593
N18250 G1 X190.751 Y152.261 E1.32894
N18251 G1 X190.751 Y151.727 E.01593
N18252 G1 X159.249 Y183.228 E1.32894
N18253 G1 X159.249 Y182.694 E.01593
N18254 G1 X190.751 Y151.193 E1.32894
N18255 G1 X190.751 Y150.659 E.01593
N18256 G1 X159.249 Y182.16 E1.32894
N18257 G1 X159.249 Y181.626 E.01593
N18259 G1 X190.751 Y150.124 E1.32894
N18260 G1 X190.751 Y149.59 E.01593
N18261 G1 X159.249 Y181.091 E1.32894
N18262 G1 X159.249 Y180.557 E.01593
N18263 G1 X190.751 Y149.056 E1.32894
N18264 G1 X190.751 Y148.522 E.01593
N18265 G1 X159.249 Y180.023 E1.32894
N18266 G1 X159.249 Y179.489 E.01593
N18267 G1 X190.751 Y147.988 E1.32894
N18268 G1 X190.751 Y147.454 E.01593
N18269 G1 X159.249 Y178.955 E1.32894
N18270 G1 X159.249 Y178.421 E.01593
N18271 G1 X190.751 Y146.92 E1.32894
N18272 G1 X190.751 Y146.386 E.01593
N18273 G1 X159.249 Y177.887 E1.32894
N18274 G1 X159.249 Y177.353 E.01593
N18275 G1 X190.751 Y145.852 E1.32894
N18276 G1 X190.751 Y145.318 E.01593
N18277 G1 X159.249 Y176.819 E1.32894
N18278 G1 X159.249 Y176.285 E.01593
N18279 G1 X190.751 Y144.784 E1.32894
N18280 G1 X190.751 Y144.25 E.01593
N18281 G1 X159.249 Y175.751 E1.32894
N18282 G1 X159.249 Y175.217 E.01593
N18283 G1 X190.751 Y143.716 E1.32894
N18284 G1 X190.751 Y143.182 E.01593
N18285 G1 X159.249 Y174.683 E1.32894
N18286 G1 X159.249 Y174.149 E.01593
N18287 G1 X190.751 Y142.648 E1.32894
N18288 G1 X190.751 Y142.113 E.01593
N18289 G1 X159.249 Y173.615 E1.32894
N18290 G1 X159.249 Y173.081 E.01593
N18291 G1 X190.751 Y141.579 E1.32894
N18292 G1 X190.751 Y141.045 E.01593
N18293 G1 X159.249 Y172.546 E1.32894
N18294 G1 X159.249 Y172.012 E.01593
N18295 G1 X190.751 Y140.511 E1.32894
N18296 G1 X190.751 Y139.977 E.01593
N18297 G1 X159.249 Y171.478 E1.32894
N18298 G1 X159.249 Y170.944 E.01593
N18299 G1 X190.751 Y139.443 E1.32894
N18300 G1 X190.751 Y138.909 E.01593
N18301 G1 X159.249 Y170.41 E1.32894
N18302 G1 X159.249 Y169.876 E.01593
N18303 G1 X190.751 Y138.375 E1.32894
N18304 G1 X190.751 Y137.841 E.01593
N18305 G1 X159.249 Y169.342 E1.32894
N18306 G1 X159.249 Y168.808 E.01593
N18307 G1 X190.751 Y137.307 E1.32894
N18308 G1 X190.751 Y136.773 E.01593
N18309 G1 X159.249 Y168.274 E1.32894
N18310 G1 X159.249 Y167.74 E.01593
N18311 G1 X190.751 Y136.239 E1.32894
N18312 G1 X190.751 Y135.705 E.01593
N18313 G1 X159.249 Y167.206 E1.32894
N18314 G1 X159.249 Y166.672 E.01593
N18315 G1 X190.751 Y135.171 E1.32894
N18316 G1 X190.751 Y134.637 E.01593
N18317 G1 X159.249 Y166.138 E1.32894
N18318 G1 X159.249 Y165.604 E.01593
N18319 G1 X190.751 Y134.103 E1.32894
N18320 G1 X190.751 Y133.568 E.01593
N18321 G1 X159.249 Y165.07 E1.32894
N18322 G1 X159.249 Y164.535 E.01593
N18323 G1 X190.751 Y133.034 E1.32894
N18324 G1 X190.751 Y132.5 E.01593
N18325 G1 X159.249 Y164.001 E1.32894
N18326 G1 X159.249 Y163.467 E.01593
N18327 G1 X190.751 Y131.966 E1.32894
N18328 G1 X190.751 Y131.432 E.01593
N18329 G1 X159.249 Y162.933 E1.32894
N18330 G1 X159.249 Y162.399 E.01593
N18331 G1 X190.751 Y130.898 E1.32894
N18332 G1 X190.751 Y130.364 E.01593
N18333 G1 X159.249 Y161.865 E1.32894
N18334 G1 X159.249 Y161.331 E.01593
N18335 G1 X190.751 Y129.83 E1.32894
N18336 G1 X190.751 Y129.296 E.01593
N18337 G1 X159.249 Y160.797 E1.32894
N18338 G1 X159.249 Y160.263 E.01593
N18339 G1 X190.751 Y128.762 E1.32894
N18340 G1 X190.751 Y128.228 E.01593
N18341 G1 X159.249 Y159.729 E1.32894
N18342 G1 X159.249 Y159.195 E.01593
N18343 G1 X190.751 Y127.694 E1.32894
N18344 G1 X190.751 Y127.16 E.01593
N18345 G1 X159.249 Y158.661 E1.32894
N18346 G1 X159.249 Y158.127 E.01593
N18347 G1 X190.751 Y126.626 E1.32894
N18348 G1 X190.751 Y126.092 E.01593
N18349 G1 X159.249 Y157.593 E1.32894
N18350 G1 X159.249 Y157.059 E.01593
N18351 G1 X190.751 Y125.558 E1.32894
N18352 G1 X190.751 Y125.023 E.01593
N18353 G1 X159.249 Y156.525 E1.32894
N18354 G1 X159.249 Y155.99 E.01593
N18355 G1 X190.751 Y124.489 E1.32894
N18356 G1 X190.751 Y123.955 E.01593
N18357 G1 X159.249 Y155.456 E1.32894
N18358 G1 X159.249 Y154.922 E.01593
N18360 G1 X190.751 Y123.421 E1.32894
N18361 G1 X190.751 Y122.887 E.01593
N18362 G1 X159.249 Y154.388 E1.32894
N18363 G1 X159.249 Y153.854 E.01593
N18364 G1 X190.751 Y122.353 E1.32894
N18365 G1 X190.751 Y121.819 E.01593
N18366 G1 X159.249 Y153.32 E1.32894
N18367 G1 X159.249 Y152.786 E.01593
N18368 G1 X190.751 Y121.285 E1.32894
N18369 G1 X190.751 Y120.751 E.01593
N18370 G1 X159.249 Y152.252 E1.32894
N18371 G1 X159.249 Y151.718 E.01593
N18372 G1 X190.751 Y120.217 E1.32894
N18373 G1 X190.751 Y119.683 E.01593
N18374 G1 X159.249 Y151.184 E1.32894
N18375 G1 X159.249 Y150.65 E.01593
N18376 G1 X190.65 Y119.249 E1.32469
N18377 G1 X190.116 Y119.249 E.01593
N18378 G1 X159.249 Y150.116 E1.30216
N18379 G1 X159.249 Y149.582 E.01593
N18380 G1 X189.582 Y119.249 E1.27963
N18381 G1 X189.048 Y119.249 E.01593
N18382 G1 X159.249 Y149.048 E1.2571
N18383 G1 X159.249 Y148.514 E.01593
N18384 G1 X188.514 Y119.249 E1.23457
N18385 G1 X187.98 Y119.249 E.01593
N18386 G1 X159.249 Y147.98 E1.21204
N18387 G1 X159.249 Y147.445 E.01593
N18388 G1 X187.445 Y119.249 E1.18951
N18389 G1 X186.911 Y119.249 E.01593
N18390 G1 X159.249 Y146.911 E1.16698
N18391 G1 X159.249 Y146.377 E.01593
N18392 G1 X186.377 Y119.249 E1.14445
N18393 G1 X185.843 Y119.249 E.01593
N18394 G1 X159.249 Y145.843 E1.12192
N18395 G1 X159.249 Y145.309 E.01593
N18396 G1 X185.309 Y119.249 E1.09939
N18397 G1 X184.775 Y119.249 E.01593
N18398 G1 X159.249 Y144.775 E1.07686
N18399 G1 X159.249 Y144.241 E.01593
N18400 G1 X184.241 Y119.249 E1.05433
N18401 G1 X183.707 Y119.249 E.01593
N18402 G1 X159.249 Y143.707 E1.0318
N18403 G1 X159.249 Y143.173 E.01593
N18404 G1 X183.173 Y119.249 E1.00927
N18405 G1 X182.639 Y119.249 E.01593
N18406 G1 X159.249 Y142.639 E.98673
N18407 G1 X159.249 Y142.105 E.01593
N18408 G1 X182.105 Y119.249 E.9642
N18409 G1 X181.571 Y119.249 E.01593
N18410 G1 X159.249 Y141.571 E.94167
N18411 G1 X159.249 Y141.037 E.01593
N18412 G1 X181.037 Y119.249 E.91914
N18413 G1 X180.503 Y119.249 E.01593
N18414 G1 X159.249 Y140.503 E.89661
N18415 G1 X159.249 Y139.969 E.01593
N18416 G1 X179.969 Y119.249 E.87408
N18417 G1 X179.435 Y119.249 E.01593
N18418 G1 X159.249 Y139.435 E.85155
N18419 G1 X159.249 Y138.9 E.01593
N18420 G1 X178.9 Y119.249 E.82902
N18421 G1 X178.366 Y119.249 E.01593
N18422 G1 X159.249 Y138.366 E.80649
N18423 G1 X159.249 Y137.832 E.01593
N18424 G1 X177.832 Y119.249 E.78396
N18425 G1 X177.298 Y119.249 E.01593
N18426 G1 X159.249 Y137.298 E.76143
N18427 G1 X159.249 Y136.764 E.01593
N18428 G1 X176.764 Y119.249 E.7389
N18429 G1 X176.23 Y119.249 E.01593
N18430 G1 X159.249 Y136.23 E.71637
N18431 G1 X159.249 Y135.696 E.01593
N18432 G1 X175.696 Y119.249 E.69384
N18433 G1 X175.162 Y119.249 E.01593
N18434 G1 X159.249 Y135.162 E.67131
N18435 G1 X159.249 Y134.628 E.01593
N18436 G1 X174.628 Y119.249 E.64878
N18437 G1 X174.094 Y119.249 E.01593
N18438 G1 X159.249 Y134.094 E.62624
N18439 G1 X159.249 Y133.56 E.01593
N18440 G1 X173.56 Y119.249 E.60371
N18441 G1 X173.026 Y119.249 E.01593
N18442 G1 X159.249 Y133.026 E.58118
N18443 G1 X159.249 Y132.492 E.01593
N18444 G1 X172.492 Y119.249 E.55865
N18445 G1 X171.958 Y119.249 E.01593
N18446 G1 X159.249 Y131.958 E.53612
N18447 G1 X159.249 Y131.424 E.01593
N18448 G1 X171.424 Y119.249 E.51359
N18449 G1 X170.89 Y119.249 E.01593
N18450 G1 X159.249 Y130.889 E.49106
N18451 G1 X159.249 Y130.355 E.01593
N18452 G1 X170.355 Y119.249 E.46853
N18453 G1 X169.821 Y119.249 E.01593
N18454 G1 X159.249 Y129.821 E.446
N18455 G1 X159.249 Y129.287 E.01593
N18456 G1 X169.287 Y119.249 E.42347
N18457 G1 X168.753 Y119.249 E.01593
N18458 G1 X159.249 Y128.753 E.40094
N18459 G1 X159.249 Y128.219 E.01593
N18460 G1 X168.219 Y119.249 E.37841
N18461 G1 X167.685 Y119.249 E.01593
N18462 G1 X159.249 Y127.685 E.35588
N18463 G1 X159.249 Y127.151 E.01593
N18464 G1 X167.151 Y119.249 E.33335
N18465 G1 X166.617 Y119.249 E.01593
N18466 G1 X159.249 Y126.617 E.31082
N18467 G1 X159.249 Y126.083 E.01593
N18468 G1 X166.083 Y119.249 E.28828
N18469 G1 X165.549 Y119.249 E.01593
N18470 G1 X159.249 Y125.549 E.26575
N18471 G1 X159.249 Y125.015 E.01593
N18472 G1 X165.015 Y119.249 E.24322
N18473 G1 X164.481 Y119.249 E.01593
N18474 G1 X159.249 Y124.481 E.22069
N18475 G1 X159.249 Y123.947 E.01593
N18476 G1 X163.947 Y119.249 E.19816
N18477 G1 X163.413 Y119.249 E.01593
N18478 G1 X159.249 Y123.413 E.17563
N18479 G1 X159.249 Y122.879 E.01593
N18480 G1 X162.879 Y119.249 E.1531
N18481 G1 X162.344 Y119.249 E.01593
N18482 G1 X159.249 Y122.344 E.13057
N18483 G1 X159.249 Y121.81 E.01593
N18484 G1 X161.81 Y119.249 E.10804
N18485 G1 X161.276 Y119.249 E.01593
N18486 G1 X159.249 Y121.276 E.08551
N18487 G1 X159.249 Y120.742 E.01593
N18488 G1 X160.742 Y119.249 E.06298
N18489 G1 X160.208 Y119.249 E.01593
N18490 G1 X159.249 Y120.208 E.04045
N18491 G1 X159.249 Y119.674 E.01593
N18492 G1 X159.844 Y119.08 E.02508
N18494 G1 X159.249 Y119.674 E-.31942
N18495 G1 X159.249 Y120.208 E-.20295
N18496 G1 X159.692 Y119.766 E-.23763
T0 ;TOOL_CHANGE:0 ; Revert to base toolN18546 G1 Z15
N18547 G1 E.8 F1800
N18548 ; FEATURE: Outer wall
N18549 ; LINE_WIDTH: 0.42
N18550 G1 F4773.528
N18551 M204 S5000
N18552 G1 X157.71 Y202.29 E1.03002
N18553 G1 X157.71 Y117.71 E2.51935
N18554 G1 X192.29 Y117.71 E1.03002
N18555 G1 X192.29 Y202.23 E2.51756
N18556 G1 E-.8 F1800
N18557 M204 S10000
N18558 G1 X192.271 Y194.598 Z15.4 F60000
N18559 G1 X192.083 Y118.691 Z15.4
N18560 G1 Z15
N18561 G1 E.8 F1800
N18562 ; FEATURE: Top surface
N18563 G1 F4773.528
N18564 M204 S2000
N18565 G1 X191.309 Y117.917 E.03259
N18566 G1 X190.776 Y117.917 E.01588
N18567 G1 X192.083 Y119.224 E.05505
N18568 G1 X192.083 Y119.758 E.01588
N18569 G1 X190.242 Y117.917 E.07752
N18570 G1 X189.709 Y117.917 E.01588
N18571 G1 X192.083 Y120.291 E.09998
N18572 G1 X192.083 Y120.824 E.01588
N18573 G1 X189.176 Y117.917 E.12244
N18574 G1 X188.643 Y117.917 E.01588
N18575 G1 X192.083 Y121.357 E.1449
N18576 G1 X192.083 Y121.891 E.01588
N18577 G1 X188.109 Y117.917 E.16737
N18578 G1 X187.576 Y117.917 E.01588
N18579 G1 X192.083 Y122.424 E.18983
N18580 G1 X192.083 Y122.957 E.01588
N18581 G1 X187.043 Y117.917 E.21229
N18582 G1 X186.51 Y117.917 E.01588
N18583 G1 X192.083 Y123.49 E.23476
N18584 G1 X192.083 Y124.024 E.01588
N18585 G1 X185.976 Y117.917 E.25722
N18586 G1 X185.443 Y117.917 E.01588
N18587 G1 X192.083 Y124.557 E.27968
N18588 G1 X192.083 Y125.09 E.01588
N18589 G1 X184.91 Y117.917 E.30215
N18590 G1 X184.377 Y117.917 E.01588
N18591 G1 X192.083 Y125.623 E.32461
N18592 G1 X192.083 Y126.157 E.01588
N18593 G1 X183.843 Y117.917 E.34707
N18594 G1 X183.31 Y117.917 E.01588
N18595 G1 X192.083 Y126.69 E.36954
N18596 G1 X192.083 Y127.223 E.01588
N18597 G1 X182.777 Y117.917 E.392
N18598 G1 X182.244 Y117.917 E.01588
N18599 G1 X192.083 Y127.756 E.41446
N18600 G1 X192.083 Y128.29 E.01588
N18601 G1 X181.71 Y117.917 E.43693
N18602 G1 X181.177 Y117.917 E.01588
N18603 G1 X192.083 Y128.823 E.45939
N18604 G1 X192.083 Y129.356 E.01588
N18605 G1 X180.644 Y117.917 E.48185
N18606 G1 X180.111 Y117.917 E.01588
N18607 G1 X192.083 Y129.889 E.50432
N18608 G1 X192.083 Y130.423 E.01588
N18609 G1 X179.577 Y117.917 E.52678
N18610 G1 X179.044 Y117.917 E.01588
N18611 G1 X192.083 Y130.956 E.54924
N18612 G1 X192.083 Y131.489 E.01588
N18613 M73 P96 R1
N18614 G1 X178.511 Y117.917 E.57171
N18615 G1 X177.978 Y117.917 E.01588
N18616 G1 X192.083 Y132.022 E.59417
N18617 G1 X192.083 Y132.556 E.01588
N18618 G1 X177.444 Y117.917 E.61663
N18619 G1 X176.911 Y117.917 E.01588
N18620 G1 X192.083 Y133.089 E.6391
N18621 G1 X192.083 Y133.622 E.01588
N18622 G1 X176.378 Y117.917 E.66156
N18623 G1 X175.845 Y117.917 E.01588
N18624 G1 X192.083 Y134.155 E.68402
N18625 G1 X192.083 Y134.689 E.01588
N18626 G1 X175.311 Y117.917 E.70649
N18627 G1 X174.778 Y117.917 E.01588
N18628 G1 X192.083 Y135.222 E.72895
N18629 G1 X192.083 Y135.755 E.01588
N18630 G1 X174.245 Y117.917 E.75141
N18631 G1 X173.712 Y117.917 E.01588
N18632 G1 X192.083 Y136.288 E.77388
N18633 G1 X192.083 Y136.822 E.01588
N18634 G1 X173.178 Y117.917 E.79634
N18635 G1 X172.645 Y117.917 E.01588
N18636 G1 X192.083 Y137.355 E.8188
N18637 G1 X192.083 Y137.888 E.01588
N18638 G1 X172.112 Y117.917 E.84127
N18639 G1 X171.578 Y117.917 E.01588
N18640 G1 X192.083 Y138.422 E.86373
N18641 G1 X192.083 Y138.955 E.01588
N18642 G1 X171.045 Y117.917 E.88619
N18643 G1 X170.512 Y117.917 E.01588
N18644 G1 X192.083 Y139.488 E.90866
N18645 G1 X192.083 Y140.021 E.01588
N18646 G1 X169.979 Y117.917 E.93112
N18647 G1 X169.445 Y117.917 E.01588
N18648 G1 X192.083 Y140.555 E.95358
N18649 G1 X192.083 Y141.088 E.01588
N18650 G1 X168.912 Y117.917 E.97605
N18651 M73 P97 R1
N18652 G1 X168.379 Y117.917 E.01588
N18653 G1 X192.083 Y141.621 E.99851
N18654 G1 X192.083 Y142.154 E.01588
N18655 G1 X167.846 Y117.917 E1.02097
N18656 G1 X167.312 Y117.917 E.01588
N18657 G1 X192.083 Y142.688 E1.04343
N18658 G1 X192.083 Y143.221 E.01588
N18659 G1 X166.779 Y117.917 E1.0659
N18660 G1 X166.246 Y117.917 E.01588
N18661 G1 X192.083 Y143.754 E1.08836
N18662 G1 X192.083 Y144.287 E.01588
N18663 G1 X165.713 Y117.917 E1.11082
N18664 G1 X165.179 Y117.917 E.01588
N18665 G1 X192.083 Y144.821 E1.13329
N18666 G1 X192.083 Y145.354 E.01588
N18667 G1 X164.646 Y117.917 E1.15575
N18668 G1 X164.113 Y117.917 E.01588
N18669 G1 X192.083 Y145.887 E1.17821
N18670 G1 X192.083 Y146.42 E.01588
N18671 G1 X163.58 Y117.917 E1.20068
N18672 G1 X163.046 Y117.917 E.01588
N18673 G1 X192.083 Y146.954 E1.22314
N18674 G1 X192.083 Y147.487 E.01588
N18675 G1 X162.513 Y117.917 E1.2456
N18676 G1 X161.98 Y117.917 E.01588
N18677 G1 X192.083 Y148.02 E1.26807
N18678 G1 X192.083 Y148.553 E.01588
N18679 G1 X161.447 Y117.917 E1.29053
N18680 G1 X160.913 Y117.917 E.01588
N18681 G1 X192.083 Y149.087 E1.31299
N18682 G1 X192.083 Y149.62 E.01588
N18683 G1 X160.38 Y117.917 E1.33546
N18684 G1 X159.847 Y117.917 E.01588
N18685 G1 X192.083 Y150.153 E1.35792
N18686 G1 X192.083 Y150.686 E.01588
N18687 G1 X159.314 Y117.917 E1.38038
N18688 G1 X158.78 Y117.917 E.01588
N18689 G1 X192.083 Y151.22 E1.40285
N18690 G1 X192.083 Y151.753 E.01588
N18691 G1 X158.247 Y117.917 E1.42531
N18692 G1 X157.917 Y118.121 E.01154
N18693 G1 X192.083 Y152.286 E1.4392
N18694 G1 X192.083 Y152.819 E.01588
N18695 G1 X157.917 Y118.654 E1.4392
N18696 G1 X157.917 Y119.187 E.01588
N18697 G1 X192.083 Y153.353 E1.4392
N18698 G1 X192.083 Y153.886 E.01588
N18699 G1 X157.917 Y119.721 E1.4392
N18700 G1 X157.917 Y120.254 E.01588
N18701 G1 X192.083 Y154.419 E1.4392
N18702 G1 X192.083 Y154.952 E.01588
N18703 G1 X157.917 Y120.787 E1.4392
N18704 G1 X157.917 Y121.321 E.01588
N18705 G1 X192.083 Y155.486 E1.4392
N18706 G1 X192.083 Y156.019 E.01588
N18707 G1 X157.917 Y121.854 E1.4392
N18708 G1 X157.917 Y122.387 E.01588
N18709 G1 X192.083 Y156.552 E1.4392
N18710 G1 X192.083 Y157.086 E.01588
N18711 G1 X157.917 Y122.92 E1.4392
N18712 G1 X157.917 Y123.454 E.01588
N18713 G1 X192.083 Y157.619 E1.4392
N18714 G1 X192.083 Y158.152 E.01588
N18715 G1 X157.917 Y123.987 E1.4392
N18716 G1 X157.917 Y124.52 E.01588
N18717 G1 X192.083 Y158.685 E1.4392
N18718 G1 X192.083 Y159.219 E.01588
N18719 G1 X157.917 Y125.053 E1.4392
N18720 G1 X157.917 Y125.587 E.01588
N18721 G1 X192.083 Y159.752 E1.4392
N18722 G1 X192.083 Y160.285 E.01588
N18723 G1 X157.917 Y126.12 E1.4392
N18724 G1 X157.917 Y126.653 E.01588
N18725 G1 X192.083 Y160.818 E1.4392
N18726 G1 X192.083 Y161.352 E.01588
N18727 G1 X157.917 Y127.186 E1.4392
N18728 G1 X157.917 Y127.72 E.01588
N18729 G1 X192.083 Y161.885 E1.4392
N18730 G1 X192.083 Y162.418 E.01588
N18731 G1 X157.917 Y128.253 E1.4392
N18732 G1 X157.917 Y128.786 E.01588
N18733 G1 X192.083 Y162.951 E1.4392
N18734 G1 X192.083 Y163.485 E.01588
N18735 G1 X157.917 Y129.319 E1.4392
N18736 G1 X157.917 Y129.853 E.01588
N18737 G1 X192.083 Y164.018 E1.4392
N18738 G1 X192.083 Y164.551 E.01588
N18739 G1 X157.917 Y130.386 E1.4392
N18740 G1 X157.917 Y130.919 E.01588
N18741 G1 X192.083 Y165.084 E1.4392
N18742 G1 X192.083 Y165.618 E.01588
N18743 G1 X157.917 Y131.452 E1.4392
N18744 G1 X157.917 Y131.986 E.01588
N18745 G1 X192.083 Y166.151 E1.4392
N18746 G1 X192.083 Y166.684 E.01588
N18747 G1 X157.917 Y132.519 E1.4392
N18748 G1 X157.917 Y133.052 E.01588
N18749 G1 X192.083 Y167.217 E1.4392
N18750 G1 X192.083 Y167.751 E.01588
N18751 G1 X157.917 Y133.585 E1.4392
N18752 G1 X157.917 Y134.119 E.01588
N18753 G1 X192.083 Y168.284 E1.4392
N18754 G1 X192.083 Y168.817 E.01588
N18755 G1 X157.917 Y134.652 E1.4392
N18756 G1 X157.917 Y135.185 E.01588
N18757 G1 X192.083 Y169.35 E1.4392
N18758 G1 X192.083 Y169.884 E.01588
N18759 G1 X157.917 Y135.718 E1.4392
N18760 G1 X157.917 Y136.252 E.01588
N18761 G1 X192.083 Y170.417 E1.4392
N18762 G1 X192.083 Y170.95 E.01588
N18763 G1 X157.917 Y136.785 E1.4392
N18764 G1 X157.917 Y137.318 E.01588
N18765 G1 X192.083 Y171.483 E1.4392
N18766 G1 X192.083 Y172.017 E.01588
N18767 G1 X157.917 Y137.851 E1.4392
N18768 G1 X157.917 Y138.385 E.01588
N18769 G1 X192.083 Y172.55 E1.4392
N18770 G1 X192.083 Y173.083 E.01588
N18771 G1 X157.917 Y138.918 E1.4392
N18772 G1 X157.917 Y139.451 E.01588
N18773 M73 P98 R1
N18774 G1 X192.083 Y173.617 E1.4392
N18775 G1 X192.083 Y174.15 E.01588
N18776 G1 X157.917 Y139.985 E1.4392
N18777 G1 X157.917 Y140.518 E.01588
N18778 G1 X192.083 Y174.683 E1.4392
N18779 G1 X192.083 Y175.216 E.01588
N18780 G1 X157.917 Y141.051 E1.4392
N18781 G1 X157.917 Y141.584 E.01588
N18782 G1 X192.083 Y175.75 E1.4392
N18783 G1 X192.083 Y176.283 E.01588
N18784 G1 X157.917 Y142.118 E1.4392
N18785 G1 X157.917 Y142.651 E.01588
N18786 G1 X192.083 Y176.816 E1.4392
N18787 G1 X192.083 Y177.349 E.01588
N18788 G1 X157.917 Y143.184 E1.4392
N18789 G1 X157.917 Y143.717 E.01588
N18790 G1 X192.083 Y177.883 E1.4392
N18791 G1 X192.083 Y178.416 E.01588
N18792 G1 X157.917 Y144.251 E1.4392
N18793 G1 X157.917 Y144.784 E.01588
N18794 G1 X192.083 Y178.949 E1.4392
N18795 G1 X192.083 Y179.482 E.01588
N18796 G1 X157.917 Y145.317 E1.4392
N18797 G1 X157.917 Y145.85 E.01588
N18798 G1 X192.083 Y180.016 E1.4392
N18799 G1 X192.083 Y180.549 E.01588
N18800 G1 X157.917 Y146.384 E1.4392
N18801 G1 X157.917 Y146.917 E.01588
N18802 G1 X192.083 Y181.082 E1.4392
N18803 G1 X192.083 Y181.615 E.01588
N18804 G1 X157.917 Y147.45 E1.4392
N18805 G1 X157.917 Y147.983 E.01588
N18806 G1 X192.083 Y182.149 E1.4392
N18807 G1 X192.083 Y182.682 E.01588
N18808 G1 X157.917 Y148.517 E1.4392
N18809 G1 X157.917 Y149.05 E.01588
N18810 G1 X192.083 Y183.215 E1.4392
N18811 G1 X192.083 Y183.748 E.01588
N18812 G1 X157.917 Y149.583 E1.4392
N18813 G1 X157.917 Y150.116 E.01588
N18814 G1 X192.083 Y184.282 E1.4392
N18815 G1 X192.083 Y184.815 E.01588
N18816 G1 X157.917 Y150.65 E1.4392
N18817 G1 X157.917 Y151.183 E.01588
N18818 G1 X192.083 Y185.348 E1.4392
N18819 G1 X192.083 Y185.881 E.01588
N18820 G1 X157.917 Y151.716 E1.4392
N18821 G1 X157.917 Y152.249 E.01588
N18822 M73 P98 R0
N18823 G1 X192.083 Y186.415 E1.4392
N18824 G1 X192.083 Y186.948 E.01588
N18825 G1 X157.917 Y152.783 E1.4392
N18826 G1 X157.917 Y153.316 E.01588
N18827 G1 X192.083 Y187.481 E1.4392
N18828 G1 X192.083 Y188.014 E.01588
N18829 G1 X157.917 Y153.849 E1.4392
N18830 G1 X157.917 Y154.382 E.01588
N18831 G1 X192.083 Y188.548 E1.4392
N18832 G1 X192.083 Y189.081 E.01588
N18833 G1 X157.917 Y154.916 E1.4392
N18834 G1 X157.917 Y155.449 E.01588
N18835 G1 X192.083 Y189.614 E1.4392
N18836 G1 X192.083 Y190.147 E.01588
N18837 G1 X157.917 Y155.982 E1.4392
N18838 G1 X157.917 Y156.515 E.01588
N18839 G1 X192.083 Y190.681 E1.4392
N18840 G1 X192.083 Y191.214 E.01588
N18841 G1 X157.917 Y157.049 E1.4392
N18842 G1 X157.917 Y157.582 E.01588
N18843 G1 X192.083 Y191.747 E1.4392
N18844 G1 X192.083 Y192.281 E.01588
N18845 G1 X157.917 Y158.115 E1.4392
N18846 G1 X157.917 Y158.649 E.01588
N18847 G1 X192.083 Y192.814 E1.4392
N18848 G1 X192.083 Y193.347 E.01588
N18849 G1 X157.917 Y159.182 E1.4392
N18850 G1 X157.917 Y159.715 E.01588
N18851 G1 X192.083 Y193.88 E1.4392
N18852 G1 X192.083 Y194.414 E.01588
N18853 G1 X157.917 Y160.248 E1.4392
N18854 G1 X157.917 Y160.782 E.01588
N18855 G1 X192.083 Y194.947 E1.4392
N18856 G1 X192.083 Y195.48 E.01588
N18857 G1 X157.917 Y161.315 E1.4392
N18858 G1 X157.917 Y161.848 E.01588
N18859 G1 X192.083 Y196.013 E1.4392
N18860 G1 X192.083 Y196.547 E.01588
N18861 G1 X157.917 Y162.381 E1.4392
N18862 G1 X157.917 Y162.915 E.01588
N18863 G1 X192.083 Y197.08 E1.4392
N18864 G1 X192.083 Y197.613 E.01588
N18865 G1 X157.917 Y163.448 E1.4392
N18866 G1 X157.917 Y163.981 E.01588
N18867 G1 X192.083 Y198.146 E1.4392
N18868 G1 X192.083 Y198.68 E.01588
N18869 G1 X157.917 Y164.514 E1.4392
N18870 G1 X157.917 Y165.048 E.01588
N18871 G1 X192.083 Y199.213 E1.4392
N18872 G1 X192.083 Y199.746 E.01588
N18873 M73 P99 R0
N18874 G1 X157.917 Y165.581 E1.4392
N18875 G1 X157.917 Y166.114 E.01588
N18876 G1 X192.083 Y200.279 E1.4392
N18877 G1 X192.083 Y200.813 E.01588
N18878 G1 X157.917 Y166.647 E1.4392
N18879 G1 X157.917 Y167.181 E.01588
N18880 G1 X192.083 Y201.346 E1.4392
N18881 G1 X192.083 Y201.879 E.01588
N18882 G1 X157.917 Y167.714 E1.4392
N18883 G1 X157.917 Y168.247 E.01588
N18884 G1 X191.753 Y202.083 E1.4253
N18885 G1 X191.22 Y202.083 E.01588
N18886 G1 X157.917 Y168.78 E1.40284
N18887 G1 X157.917 Y169.314 E.01588
N18888 G1 X190.686 Y202.083 E1.38038
N18889 G1 X190.153 Y202.083 E.01588
N18890 G1 X157.917 Y169.847 E1.35792
N18891 G1 X157.917 Y170.38 E.01588
N18892 G1 X189.62 Y202.083 E1.33545
N18893 G1 X189.087 Y202.083 E.01588
N18894 G1 X157.917 Y170.913 E1.31299
N18895 G1 X157.917 Y171.447 E.01588
N18896 G1 X188.553 Y202.083 E1.29053
N18897 G1 X188.02 Y202.083 E.01588
N18898 G1 X157.917 Y171.98 E1.26806
N18899 G1 X157.917 Y172.513 E.01588
N18900 G1 X187.487 Y202.083 E1.2456
N18901 G1 X186.954 Y202.083 E.01588
N18902 G1 X157.917 Y173.046 E1.22314
N18903 G1 X157.917 Y173.58 E.01588
N18904 G1 X186.42 Y202.083 E1.20067
N18905 G1 X185.887 Y202.083 E.01588
N18906 G1 X157.917 Y174.113 E1.17821
N18907 G1 X157.917 Y174.646 E.01588
N18908 G1 X185.354 Y202.083 E1.15575
N18909 G1 X184.82 Y202.083 E.01588
N18910 G1 X157.917 Y175.18 E1.13328
N18911 G1 X157.917 Y175.713 E.01588
N18912 G1 X184.287 Y202.083 E1.11082
N18913 G1 X183.754 Y202.083 E.01588
N18914 G1 X157.917 Y176.246 E1.08836
N18915 G1 X157.917 Y176.779 E.01588
N18916 G1 X183.221 Y202.083 E1.06589
N18917 G1 X182.687 Y202.083 E.01588
N18918 G1 X157.917 Y177.313 E1.04343
N18919 G1 X157.917 Y177.846 E.01588
N18920 G1 X182.154 Y202.083 E1.02097
N18921 G1 X181.621 Y202.083 E.01588
N18922 G1 X157.917 Y178.379 E.9985
N18923 G1 X157.917 Y178.912 E.01588
N18924 G1 X181.088 Y202.083 E.97604
N18925 G1 X180.554 Y202.083 E.01588
N18926 G1 X157.917 Y179.446 E.95358
N18927 G1 X157.917 Y179.979 E.01588
N18928 G1 X180.021 Y202.083 E.93111
N18929 G1 X179.488 Y202.083 E.01588
N18930 G1 X157.917 Y180.512 E.90865
N18931 G1 X157.917 Y181.045 E.01588
N18932 G1 X178.955 Y202.083 E.88619
N18933 G1 X178.421 Y202.083 E.01588
N18934 G1 X157.917 Y181.579 E.86372
N18935 G1 X157.917 Y182.112 E.01588
N18936 G1 X177.888 Y202.083 E.84126
N18937 G1 X177.355 Y202.083 E.01588
N18938 G1 X157.917 Y182.645 E.8188
N18939 G1 X157.917 Y183.178 E.01588
N18940 G1 X176.822 Y202.083 E.79633
N18941 G1 X176.288 Y202.083 E.01588
N18942 G1 X157.917 Y183.712 E.77387
N18943 G1 X157.917 Y184.245 E.01588
N18944 G1 X175.755 Y202.083 E.75141
N18945 G1 X175.222 Y202.083 E.01588
N18946 G1 X157.917 Y184.778 E.72894
N18947 G1 X157.917 Y185.311 E.01588
N18948 G1 X174.689 Y202.083 E.70648
N18949 G1 X174.155 Y202.083 E.01588
N18950 G1 X157.917 Y185.845 E.68402
N18951 G1 X157.917 Y186.378 E.01588
N18952 G1 X173.622 Y202.083 E.66155
N18953 G1 X173.089 Y202.083 E.01588
N18954 G1 X157.917 Y186.911 E.63909
N18955 G1 X157.917 Y187.444 E.01588
N18956 G1 X172.556 Y202.083 E.61663
N18957 G1 X172.022 Y202.083 E.01588
N18958 G1 X157.917 Y187.978 E.59416
N18959 G1 X157.917 Y188.511 E.01588
N18960 G1 X171.489 Y202.083 E.5717
N18961 G1 X170.956 Y202.083 E.01588
N18962 G1 X157.917 Y189.044 E.54924
N18963 G1 X157.917 Y189.577 E.01588
N18964 G1 X170.423 Y202.083 E.52677
N18965 G1 X169.889 Y202.083 E.01588
N18966 G1 X157.917 Y190.111 E.50431
N18967 G1 X157.917 Y190.644 E.01588
N18968 G1 X169.356 Y202.083 E.48185
N18969 G1 X168.823 Y202.083 E.01588
N18970 G1 X157.917 Y191.177 E.45939
N18971 G1 X157.917 Y191.71 E.01588
N18972 G1 X168.29 Y202.083 E.43692
N18973 G1 X167.756 Y202.083 E.01588
N18974 G1 X157.917 Y192.244 E.41446
N18975 G1 X157.917 Y192.777 E.01588
N18976 G1 X167.223 Y202.083 E.392
N18977 G1 X166.69 Y202.083 E.01588
N18978 G1 X157.917 Y193.31 E.36953
N18979 G1 X157.917 Y193.844 E.01588
N18980 G1 X166.156 Y202.083 E.34707
N18981 G1 X165.623 Y202.083 E.01588
N18982 G1 X157.917 Y194.377 E.32461
N18983 G1 X157.917 Y194.91 E.01588
N18984 G1 X165.09 Y202.083 E.30214
N18985 G1 X164.557 Y202.083 E.01588
N18986 G1 X157.917 Y195.443 E.27968
N18987 G1 X157.917 Y195.977 E.01588
N18988 G1 X164.023 Y202.083 E.25722
N18989 G1 X163.49 Y202.083 E.01588
N18990 G1 X157.917 Y196.51 E.23475
N18991 G1 X157.917 Y197.043 E.01588
N18992 G1 X162.957 Y202.083 E.21229
N18993 G1 X162.424 Y202.083 E.01588
N18994 G1 X157.917 Y197.576 E.18983
N18995 G1 X157.917 Y198.11 E.01588
N18996 G1 X161.89 Y202.083 E.16736
N18997 G1 X161.357 Y202.083 E.01588
N18998 G1 X157.917 Y198.643 E.1449
N18999 G1 X157.917 Y199.176 E.01588
N19000 G1 X160.824 Y202.083 E.12244
N19001 G1 X160.291 Y202.083 E.01588
N19002 G1 X157.917 Y199.709 E.09997
N19003 G1 X157.917 Y200.243 E.01588
N19004 G1 X159.757 Y202.083 E.07751
N19005 G1 X159.224 Y202.083 E.01588
N19006 G1 X157.917 Y200.776 E.05505
N19007 G1 X157.917 Y201.309 E.01588
N19008 G1 X158.691 Y202.083 E.03258
N19009 G1 E-.8 F1800
N19010 M204 S10000
N19011 G1 X166.323 Y202.075 Z15.4 F60000
N19012 G1 X192.101 Y202.049 Z15.4
N19013 G1 Z15
N19014 G1 E.8 F1800
N19015 ; FEATURE: Gap infill
N19016 ; LINE_WIDTH: 0.150796
N19017 G1 F15000
N19018 M204 S8000
N19019 G1 X191.912 Y202.049 E.00161
N19020 G1 X191.823 Y202.012 E.00082
N19021 ; WIPE_START
N19022 G1 X191.912 Y202.049 E-.25712
N19023 G1 X192.101 Y202.049 E-.50288
N19024 ; WIPE_END
N19025 G1 E-.04 F1800
N19026 M204 S10000
N19027 G17
N19028 G3 Z15.4 I1.217 J0 P1  F60000
N19029 ; stop printing object, unique label id: 372
N19030 M625
N19031 ; object ids of layer 75 start: 372
N19032 M624 AQAAAAAAAAA=
N19033 ;======== H2D 20250527========
N19034 ; SKIPPABLE_START
N19035 ; SKIPTYPE: timelapse
N19036 M622.1 S1 ; for prev firware, default turned on
N19037 
N19038 M1002 judge_flag timelapse_record_flag
N19039 
N19040 M622 J1
N19041 M993 A2 B2 C2
N19042 M993 A0 B0 C0
N19043 
N19044 
N19045 
N19046 
N19047     M9711 M0 E1 X261 Y132 Z15.4 S11 C10 O0 T3000
N19048 
N19049 
N19050 
N19051 M993 A3 B3 C3
N19052 
N19053 M623
N19054 ; SKIPPABLE_END
N19055 
N19056 ; object ids of this layer75 end: 372
N19057 M625
N19058 ; close powerlost recovery
N19059 M1003 S0
N19060 M106 S0
N19061 M106 P2 S0
N19062 M981 S0 P20000 ; close spaghetti detector
N19063 ; FEATURE: Custom
N19064 ; MACHINE_END_GCODE_START
N19065 ; filament end gcode 
N19066 ;===== date: 2025/05/16 =====================
N19067 ;===== H2D =====================
N19068 G392 S0 ;turn off nozzle clog detect
N19069 M993 A0 B0 C0 ; nozzle cam detection not allowed.
N19070 
N19071 M400 ; wait for buffer to clear
N19072 G92 E0 ; zero the extruder
N19073 G1 E-0.8 F1800 ; retract
N19074 G1 Z15.5 F900 ; lower z a little
N19075 
N19076 G90
N19077 M141 S0 ; turn off chamber heating
N19078 M140 S0 ; turn off bed
N19079 M106 S0 ; turn off fan
N19080 M106 P2 S0 ; turn off remote part cooling fan
N19081 M106 P3 S0 ; turn off chamber cooling fan
N19082 
N19083 ; pull back filament to AMS
N19084 M620 S65535
N19085 T65535
N19086 G150.2
N19087 M621 S65535
N19088 
N19089 M620 S65279
N19090 T65279
N19091 G150.2
N19092 M621 S65279
N19093 
N19094 G150.3
N19095 
N19096 M1002 judge_flag timelapse_record_flag
N19097 M622 J1
N19098     M400 ; wait all motion done
N19099     M991 S0 P-1 ;end smooth timelapse at safe pos
N19100     M400 S5 ;wait for last picture to be taken
N19101 M623  ;end of "timelapse_record_flag"
N19102 
N19103 M104 S0 T0; turn off hotend
N19104 M104 S0 T1; turn off hotend
N19105 
N19106 M400 ; wait all motion done
N19107 M17 S
N19108 M17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom
N19109 
N19110     G1 Z115 F600
N19111     G1 Z113
N19112 
N19113 M400 P100
N19114 M17 R ; restore z current
N19115 
N19116 M220 S100  ; Reset feedrate magnitude
N19117 M201.2 K1.0 ; Reset acc magnitude
N19118 M73.2   R1.0 ;Reset left time magnitude
N19119 M1002 set_gcode_claim_speed_level : 0
N19120 
N19121 M1015.4 S0 K0 ;disable air printing detect
N19122 ;=====printer finish  sound=========
N19123 M17
N19124 M400 S1
N19125 M1006 S1
N19126 M1006 A53 B10 L99 C53 D10 M99 E53 F10 N99 
N19127 M1006 A57 B10 L99 C57 D10 M99 E57 F10 N99 
N19128 M1006 A0 B15 L0 C0 D15 M0 E0 F15 N0 
N19129 M1006 A53 B10 L99 C53 D10 M99 E53 F10 N99 
N19130 M1006 A57 B10 L99 C57 D10 M99 E57 F10 N99 
N19131 M1006 A0 B15 L0 C0 D15 M0 E0 F15 N0 
N19132 M1006 A48 B10 L99 C48 D10 M99 E48 F10 N99 
N19133 M1006 A0 B15 L0 C0 D15 M0 E0 F15 N0 
N19134 M1006 A60 B10 L99 C60 D10 M99 E60 F10 N99 
N19135 M1006 W
N19136 ;=====printer finish  sound=========
N19137 M400
N19138 M18
N19139 
N19140 M73 P100 R0
N19141 ; EXECUTABLE_BLOCK_END
N19142 
