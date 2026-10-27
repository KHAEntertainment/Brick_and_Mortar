N1 ; HEADER_BLOCK_START
N2 ; BambuStudio 02.01.00.59
N3 ; model printing time: 43m 38s; total estimated time: 53m 26s
N4 ; total layer number: 63
N5 ; total filament length [mm] : 5030.70,119.74
N6 ; total filament volume [cm^3] : 12100.24,288.00
N7 ; total filament weight [g] : 15.61,0.36
N8 ; model label id: 229,239
N9 ; filament_density: 1.29,1.24
N10 ; filament_diameter: 1.75,1.75
N11 ; max_z_height: 12.60
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
N111 ; filament_map_mode = Manual
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
N265 ; post_process = "/opt/homebrew/bin/python3 \"/Users/bbrenner/Documents/Scripting Projects/Brick and Mortar/brick_and_mortar-non-verbose.py\" {input_file} {output_file}"
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
N453 M73 P0 R53
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
N695 M73 P0 R52
N696 G1 Y-16 F12000 ; move away from the trash bin
N697 G90
N698 
N699 M400
N700 ;M73 P99
N701 
N702 ;===== wipe right nozzle start =====
N703 
N704 M1002 gcode_claim_action : 14
N705     G150 T255
N706     
N707 M106 S255 ; turn on fan to cool the nozzle
N708 
N709 ;===== wipe left nozzle end =====
N710 
N711 M400
N712 ;M73 P99
N713 
N714 
N715 
N716 M400
N717 ;M73 P99
N718 
N719 ;===== bed leveling ==================================
N720 
N721 M1002 judge_flag g29_before_print_flag
N722 
N723 M190 S70; ensure bed temp
N724 M109 S140 A
N725 M106 S0 ; turn off fan , too noisy
N726 
N727 G91
N728 M73 P1 R52
N729 G1 Z5 F1200
N730 G90
N731 G1 X275 Y300 F30000
N732 
N733 M622 J1
N734     M1002 gcode_claim_action : 1
N735     G29.20 A3
N736     G29 A1 O X154.814 Y115.26 I45.8708 J169.064
N737     M400
N738     M500 ; save cali data
N739 M623
N740     
N741 M622 J2
N742     M1002 gcode_claim_action : 1
N743     
N744         G29.20 A3
N745         G29 A1 O X154.814 Y115.26 I45.8708 J169.064
N746     
N747     M400
N748     M500 ; save cali data
N749 M623
N750 
N751 M622 J0
N752     G28
N753 M623
N754 
N755 ;===== bed leveling end ================================
N756 
N757 G39.1 ; cali nozzle wrapped detection pos
N758 M500
N759 
N760 ;===== z ofst cali start =====
N761 
N762     M190 S70; ensure bed temp
N763 
N764     G383 O0 M2 T140
N765     M500
N766 
N767 ;===== z ofst cali end =====
N768 
N769 M400
N770 ;M73 P99
N771 
N772 M141 S0
N773 M104 S255 A
N774 
N775 ;===== mech mode sweep start =====
N776     M1002 gcode_claim_action : 3
N777 
N778     G90
N779 M73 P10 R48
N780     G1 Z5 F1200
N781     G1 X187 Y160 F20000
N782     T1000
N783     M400 P200
N784 
N785     M970.3 Q1 A5 K0 O1
N786     M974 Q1 S2 P0
N787 
N788     M970.3 Q0 A5 K0 O1
N789     M974 Q0 S2 P0
N790 
N791     M970.2 Q2 K0 W38 Z0.01
N792     M974 Q2 S2 P0
N793     M500
N794 
N795     M975 S1
N796 ;===== mech mode sweep end =====
N797 
N798 M400
N799 ;M73 P99
N800 
N801 G150.3 ; move to garbage can to wait for temp
N802 M1026
N803 
N804 ;===== xy ofst cali start =====
N805 
N806 M1002 judge_flag auto_cali_toolhead_offset_flag
N807 
N808 M622 J0
N809     M1012.5 N1 R1
N810 M623
N811 
N812 M622 J1
N813     M1002 gcode_claim_action : 39
N814     M141 S0
N815     M620.17 T0 S240 L1
N816     M620.17 T1 S255 L0
N817     G383 O1 T255 L0
N818     M500
N819     M141 S0
N820 M623
N821 
N822 M622 J2
N823     M1002 gcode_claim_action : 39
N824     M141 S0
N825     M620.17 T0 S240 L1
N826     M620.17 T1 S255 L0
N827     G383.3 T255 L0
N828     M500
N829     M141 S0
N830 M623
N831 ;===== xy ofst cali end =====
N832 
N833 M400
N834 ;M73 P99
N835 
N836 M1002 gcode_claim_action : 0
N837 M400
N838 
N839 ;============switch again==================
N840 
N841 M211 X0 Y0 Z0 ;turn off soft endstop
N842 G91
N843 G1 Z6 F1200
N844 G90
N845 M1002 set_filament_type:PCTG
N846 M620 S0A
N847 M400
N848 T0
N849 M400
N850 M628 S0
N851 M629
N852 M400
N853 M621 S0A
N854 
N855 ;============switch again==================
N856 
N857 M400
N858 ;M73 P99
N859 
N860 ;===== wait temperature reaching the reference value =======
N861 
N862 M104 S255 ; rise to print tmpr
N863 
N864 M140 S70 
N865 M190 S70 
N866 
N867     ;========turn off light and fans =============
N868     M960 S1 P0 ; turn off laser
N869     M960 S2 P0 ; turn off laser
N870     M106 S0 ; turn off fan
N871     M106 P2 S0 ; turn off big fan
N872 
N873     ;============set motor current==================
N874     M400 S1
N875 
N876 ;===== wait temperature reaching the reference value =======
N877 
N878 M400
N879 ;M73 P99
N880 
N881 ;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==
N882     
N883         G29.1 Z-0.02 ; for Textured PEI Plate
N884     
N885     
N886 G150.1
N887 
N888 M975 S1 ; turn on mech mode supression
N889 M983.4 S1 ; turn on deformation compensation 
N890 G29.2 S1 ; turn on pos comp
N891 G29.7 S1
N892 
N893 G90
N894 M73 P18 R43
N895 G1 Z5 F1200
N896 G1 Y295 F30000
N897 G1 Y265 F18000
N898 
N899 ;===== nozzle load line ===============================
N900 G29.2 S1 ; ensure z comp turn on
N901 G90
N902 M83
N903 M109 S255
N904 
N905     ;G130 O0 F1.24725 L80 E5 D12 A154.814 B115.26 I45.8708 J169.064
N906     G130 O0 X250 Y-0.5 Z0.8 F1.24725 L40 E20 D5
N907 
N908 G90
N909 M83
N910 G1 Z0.2
N911 
N912 ;===== noozle load line end ===========================
N913 
N914 M400
N915 ;M73 P99
N916 
N917 M993 A1 B1 C1 ; nozzle cam detection allowed.
N918 
N919 
N920 M1015.3 S0;disable tpu clog detect
N921 
N922 
N923 
N924 M1015.4 S0 K0 H0.4 ;disable E air printing detect
N925 
N926 
N927 M620.6 I0 W1 ;enable ams air printing detect
N928 
N929 M211 Z1
N930 G29.99
N931 
N932 
N933 ; MACHINE_START_GCODE_END
N934 M104 T0 S0 N0 ;Multi extruder pre cooling
N935 ; filament start gcode
N936 ;VT0
N937 G90
N938 G21
N939 M83 ; use relative distances for extrusion
N940 M981 S1 P20000 ;open spaghetti detector
N941 M204 S10000
N942 G1 Z.2 F60000
N943 ; CHANGE_LAYER
N944 ; Z_HEIGHT: 0.2
N945 ; LAYER_HEIGHT: 0.2
N946 ;======== H2D 20250521========
N947 ; layer num/total_layer_count: 1/63
N948 ; update layer progress
N949 M73 L1
N950 M991 S0 P0 ;notify layer change
N951 
N952 
N953 M106 S0
N954 M106 P2 S0
N955 G1 E-.8 F1800
N956 G1 X155.435 Y124.289 F60000
N957 M204 S6000
N958 G1 Z.6
N959 G1 Z.2
N960 G1 E.8 F1800
N961 ; FEATURE: Skirt
N962 ; LINE_WIDTH: 0.5
N963 ; LAYER_HEIGHT: 0.2
N964 G1 F3000
N965 M204 S500
N966 G1 X156.009 Y123.667 E.03054
N967 G1 X166.058 Y115.993 E.45656
N968 G1 X167.55 Y115.488 E.05684
N969 G1 X182.55 Y115.488 E.54159
N970 G1 X184.05 Y116 E.05724
N971 G1 X194.001 Y123.675 E.45373
N972 G1 X194.815 Y124.798 E.0501
N973 G1 X194.955 Y125.512 E.02626
N974 G1 X200.454 Y249.881 E4.49487
N975 G1 X200.457 Y281.638 E1.14663
N976 G1 X200.065 Y282.97 E.0501
N977 G1 X199.014 Y283.876 E.0501
N978 G1 X198 Y284.095 E.03748
N979 G1 X164.991 Y284.095 E1.19182
N980 G1 X163.659 Y283.704 E.0501
N981 G1 X162.753 Y282.653 E.0501
N982 G1 X162.544 Y281.869 E.0293
N983 G1 X155.054 Y202.285 E2.88615
N984 G1 X155.043 Y125.62 E2.76806
N985 G1 X155.418 Y124.347 E.04794
N986 ; OBJECT_ID: 229
N987 ; WIPE_START
N988 G1 X156.009 Y123.667 E-.34205
N989 G1 X156.883 Y123 E-.41795
N990 ; WIPE_END
N991 G1 E-.04 F1800
N992 ; start printing object, unique label id: 229
N993 M624 AQAAAAAAAAA=
N994 M204 S6000
N995 G1 X159.945 Y129.991 Z.6 F60000
N996 G1 X190.729 Y200.284 Z.6
N997 G1 Z.2
N998 G1 E.8 F1800
N999 ; FEATURE: Inner wall
N1000 G1 F3000
N1001 M204 S500
N1002 G1 X159.271 Y200.284 E1.13581
N1003 G1 X159.271 Y127.391 E2.63184
N1004 G1 X190.729 Y127.391 E1.13581
N1005 G1 X190.729 Y200.224 E2.62968
N1006 M204 S6000
N1007 G1 X191.186 Y200.741 F60000
N1008 G1 F3000
N1009 M204 S500
N1010 G1 X158.814 Y200.741 E1.16881
N1011 G1 X158.814 Y126.934 E2.66485
N1012 G1 X191.186 Y126.934 E1.16881
N1013 G1 X191.186 Y200.681 E2.66268
N1014 M204 S6000
N1015 G1 X191.643 Y201.198 F60000
N1016 G1 F3000
N1017 M204 S500
N1018 G1 X158.357 Y201.198 E1.20182
N1019 G1 X158.357 Y126.477 E2.69786
N1020 G1 X191.643 Y126.477 E1.20182
N1021 G1 X191.643 Y201.138 E2.69569
N1022 M204 S6000
N1023 G1 X192.1 Y201.655 F60000
N1024 ; FEATURE: Outer wall
N1025 G1 F3000
N1026 M204 S500
N1027 G1 X157.9 Y201.655 E1.23483
N1028 M73 P19 R43
N1029 G1 X157.9 Y126.02 E2.73086
N1030 G1 X192.1 Y126.02 E1.23483
N1031 G1 X192.1 Y201.595 E2.7287
N1032 G1 E-.8 F1800
N1033 M204 S6000
N1034 G1 X191.844 Y193.967 Z.6 F60000
N1035 G1 X189.619 Y127.574 Z.6
N1036 G1 Z.2
N1037 G1 E.8 F1800
N1038 ; FEATURE: Bottom surface
N1039 ; LINE_WIDTH: 0.50125
N1040 G1 F3927.301
N1041 M204 S500
N1042 G1 X190.34 Y128.295 E.03691
N1043 G1 X190.34 Y128.943 E.02347
N1044 G1 X189.177 Y127.78 E.05957
N1045 G1 X188.529 Y127.78 E.02347
N1046 G1 X190.34 Y129.592 E.09276
N1047 G1 X190.34 Y130.24 E.02347
N1048 G1 X187.881 Y127.78 E.12594
N1049 G1 X187.232 Y127.78 E.02347
N1050 G1 X190.34 Y130.888 E.15913
N1051 G1 X190.34 Y131.536 E.02347
N1052 G1 X186.584 Y127.78 E.19232
N1053 G1 X185.936 Y127.78 E.02347
N1054 G1 X190.34 Y132.184 E.22551
N1055 G1 X190.34 Y132.832 E.02347
N1056 G1 X185.288 Y127.78 E.25869
N1057 G1 X184.64 Y127.78 E.02347
N1058 G1 X190.34 Y133.481 E.29188
N1059 G1 X190.34 Y134.129 E.02347
N1060 G1 X183.991 Y127.78 E.32507
N1061 G1 X183.343 Y127.78 E.02347
N1062 G1 X190.34 Y134.777 E.35826
N1063 G1 X190.34 Y135.425 E.02347
N1064 G1 X182.695 Y127.78 E.39144
N1065 G1 X182.047 Y127.78 E.02347
N1066 G1 X190.34 Y136.073 E.42463
N1067 G1 X190.34 Y136.721 E.02347
N1068 G1 X181.399 Y127.78 E.45782
N1069 G1 X180.751 Y127.78 E.02347
N1070 G1 X190.34 Y137.37 E.49101
N1071 G1 X190.34 Y138.018 E.02347
N1072 G1 X180.102 Y127.78 E.52419
N1073 G1 X179.454 Y127.78 E.02347
N1074 G1 X190.34 Y138.666 E.55738
N1075 G1 X190.34 Y139.314 E.02347
N1076 G1 X178.806 Y127.78 E.59057
N1077 G1 X178.158 Y127.78 E.02347
N1078 G1 X190.34 Y139.962 E.62376
N1079 G1 X190.34 Y140.611 E.02347
N1080 G1 X177.51 Y127.78 E.65694
N1081 G1 X176.862 Y127.78 E.02347
N1082 G1 X190.34 Y141.259 E.69013
N1083 G1 X190.34 Y141.907 E.02347
N1084 G1 X176.213 Y127.78 E.72332
N1085 G1 X175.565 Y127.78 E.02347
N1086 G1 X190.34 Y142.555 E.75651
N1087 G1 X190.34 Y143.203 E.02347
N1088 G1 X174.917 Y127.78 E.78969
N1089 G1 X174.269 Y127.78 E.02347
N1090 G1 X190.34 Y143.851 E.82288
N1091 G1 X190.34 Y144.5 E.02347
N1092 G1 X173.621 Y127.78 E.85607
N1093 G1 X172.972 Y127.78 E.02347
N1094 G1 X190.34 Y145.148 E.88926
N1095 G1 X190.34 Y145.796 E.02347
N1096 G1 X172.324 Y127.78 E.92244
N1097 G1 X171.676 Y127.78 E.02347
N1098 G1 X190.34 Y146.444 E.95563
N1099 G1 X190.34 Y147.092 E.02347
N1100 G1 X171.028 Y127.78 E.98882
N1101 G1 X170.38 Y127.78 E.02347
N1102 G1 X190.34 Y147.74 E1.02201
N1103 G1 X190.34 Y148.389 E.02347
N1104 G1 X169.732 Y127.78 E1.05519
N1105 G1 X169.083 Y127.78 E.02347
N1106 G1 X190.34 Y149.037 E1.08838
N1107 G1 X190.34 Y149.685 E.02347
N1108 G1 X168.435 Y127.78 E1.12157
N1109 G1 X167.787 Y127.78 E.02347
N1110 M73 P19 R42
N1111 G1 X190.34 Y150.333 E1.15476
N1112 G1 X190.34 Y150.981 E.02347
N1113 G1 X167.139 Y127.78 E1.18794
N1114 G1 X166.491 Y127.78 E.02347
N1115 G1 X190.34 Y151.63 E1.22113
N1116 G1 X190.34 Y152.278 E.02347
N1117 G1 X165.843 Y127.78 E1.25432
N1118 G1 X165.194 Y127.78 E.02347
N1119 G1 X190.34 Y152.926 E1.28751
N1120 G1 X190.34 Y153.574 E.02347
N1121 G1 X164.546 Y127.78 E1.32069
N1122 G1 X163.898 Y127.78 E.02347
N1123 G1 X190.34 Y154.222 E1.35388
N1124 G1 X190.34 Y154.87 E.02347
N1125 G1 X163.25 Y127.78 E1.38707
N1126 G1 X162.602 Y127.78 E.02347
N1127 G1 X190.34 Y155.519 E1.42026
N1128 G1 X190.34 Y156.167 E.02347
N1129 G1 X161.953 Y127.78 E1.45344
N1130 G1 X161.305 Y127.78 E.02347
N1131 G1 X190.34 Y156.815 E1.48663
N1132 G1 X190.34 Y157.463 E.02347
N1133 G1 X160.657 Y127.78 E1.51982
N1134 G1 X160.009 Y127.78 E.02347
N1135 G1 X190.34 Y158.111 E1.55301
N1136 G1 X190.34 Y158.759 E.02347
N1137 G1 X159.66 Y128.079 E1.57089
N1138 G1 X159.66 Y128.727 E.02347
N1139 G1 X190.34 Y159.408 E1.57089
N1140 G1 X190.34 Y160.056 E.02347
N1141 G1 X159.66 Y129.375 E1.57089
N1142 G1 X159.66 Y130.023 E.02347
N1143 G1 X190.34 Y160.704 E1.57089
N1144 G1 X190.34 Y161.352 E.02347
N1145 G1 X159.66 Y130.672 E1.57089
N1146 G1 X159.66 Y131.32 E.02347
N1147 G1 X190.34 Y162 E1.57089
N1148 G1 X190.34 Y162.649 E.02347
N1149 G1 X159.66 Y131.968 E1.57089
N1150 G1 X159.66 Y132.616 E.02347
N1151 M73 P20 R42
N1152 G1 X190.34 Y163.297 E1.57089
N1153 G1 X190.34 Y163.945 E.02347
N1154 G1 X159.66 Y133.264 E1.57089
N1155 G1 X159.66 Y133.912 E.02347
N1156 G1 X190.34 Y164.593 E1.57089
N1157 G1 X190.34 Y165.241 E.02347
N1158 G1 X159.66 Y134.561 E1.57089
N1159 G1 X159.66 Y135.209 E.02347
N1160 G1 X190.34 Y165.889 E1.57089
N1161 G1 X190.34 Y166.538 E.02347
N1162 G1 X159.66 Y135.857 E1.57089
N1163 G1 X159.66 Y136.505 E.02347
N1164 G1 X190.34 Y167.186 E1.57089
N1165 G1 X190.34 Y167.834 E.02347
N1166 G1 X159.66 Y137.153 E1.57089
N1167 G1 X159.66 Y137.802 E.02347
N1168 G1 X190.34 Y168.482 E1.57089
N1169 G1 X190.34 Y169.13 E.02347
N1170 G1 X159.66 Y138.45 E1.57089
N1171 G1 X159.66 Y139.098 E.02347
N1172 G1 X190.34 Y169.778 E1.57089
N1173 G1 X190.34 Y170.427 E.02347
N1174 G1 X159.66 Y139.746 E1.57089
N1175 G1 X159.66 Y140.394 E.02347
N1176 G1 X190.34 Y171.075 E1.57089
N1177 G1 X190.34 Y171.723 E.02347
N1178 G1 X159.66 Y141.042 E1.57089
N1179 G1 X159.66 Y141.691 E.02347
N1180 G1 X190.34 Y172.371 E1.57089
N1181 G1 X190.34 Y173.019 E.02347
N1182 G1 X159.66 Y142.339 E1.57089
N1183 G1 X159.66 Y142.987 E.02347
N1184 G1 X190.34 Y173.668 E1.57089
N1185 G1 X190.34 Y174.316 E.02347
N1186 G1 X159.66 Y143.635 E1.57089
N1187 G1 X159.66 Y144.283 E.02347
N1188 G1 X190.34 Y174.964 E1.57089
N1189 G1 X190.34 Y175.612 E.02347
N1190 G1 X159.66 Y144.932 E1.57089
N1191 G1 X159.66 Y145.58 E.02347
N1192 G1 X190.34 Y176.26 E1.57089
N1193 G1 X190.34 Y176.908 E.02347
N1194 G1 X159.66 Y146.228 E1.57089
N1195 G1 X159.66 Y146.876 E.02347
N1196 G1 X190.34 Y177.557 E1.57089
N1197 G1 X190.34 Y178.205 E.02347
N1198 G1 X159.66 Y147.524 E1.57089
N1199 G1 X159.66 Y148.172 E.02347
N1200 G1 X190.34 Y178.853 E1.57089
N1201 G1 X190.34 Y179.501 E.02347
N1202 G1 X159.66 Y148.821 E1.57089
N1203 G1 X159.66 Y149.469 E.02347
N1204 G1 X190.34 Y180.149 E1.57089
N1205 G1 X190.34 Y180.797 E.02347
N1206 M104 T0 S240 N0 ;Multi extruder pre heating
N1207 G1 X159.66 Y150.117 E1.57089
N1208 G1 X159.66 Y150.765 E.02347
N1209 G1 X190.34 Y181.446 E1.57089
N1210 G1 X190.34 Y182.094 E.02347
N1211 G1 X159.66 Y151.413 E1.57089
N1212 G1 X159.66 Y152.061 E.02347
N1213 G1 X190.34 Y182.742 E1.57089
N1214 G1 X190.34 Y183.39 E.02347
N1215 G1 X159.66 Y152.71 E1.57089
N1216 G1 X159.66 Y153.358 E.02347
N1217 G1 X190.34 Y184.038 E1.57089
N1218 G1 X190.34 Y184.687 E.02347
N1219 G1 X159.66 Y154.006 E1.57089
N1220 G1 X159.66 Y154.654 E.02347
N1221 G1 X190.34 Y185.335 E1.57089
N1222 G1 X190.34 Y185.983 E.02347
N1223 G1 X159.66 Y155.302 E1.57089
N1224 G1 X159.66 Y155.951 E.02347
N1225 G1 X190.34 Y186.631 E1.57089
N1226 G1 X190.34 Y187.279 E.02347
N1227 G1 X159.66 Y156.599 E1.57089
N1228 G1 X159.66 Y157.247 E.02347
N1229 G1 X190.34 Y187.927 E1.57089
N1230 G1 X190.34 Y188.576 E.02347
N1231 G1 X159.66 Y157.895 E1.57089
N1232 G1 X159.66 Y158.543 E.02347
N1233 M73 P21 R42
N1234 G1 X190.34 Y189.224 E1.57089
N1235 G1 X190.34 Y189.872 E.02347
N1236 G1 X159.66 Y159.191 E1.57089
N1237 G1 X159.66 Y159.84 E.02347
N1238 G1 X190.34 Y190.52 E1.57089
N1239 G1 X190.34 Y191.168 E.02347
N1240 G1 X159.66 Y160.488 E1.57089
N1241 G1 X159.66 Y161.136 E.02347
N1242 G1 X190.34 Y191.816 E1.57089
N1243 G1 X190.34 Y192.465 E.02347
N1244 G1 X159.66 Y161.784 E1.57089
N1245 G1 X159.66 Y162.432 E.02347
N1246 G1 X190.34 Y193.113 E1.57089
N1247 G1 X190.34 Y193.761 E.02347
N1248 G1 X159.66 Y163.08 E1.57089
N1249 G1 X159.66 Y163.729 E.02347
N1250 G1 X190.34 Y194.409 E1.57089
N1251 G1 X190.34 Y195.057 E.02347
N1252 G1 X159.66 Y164.377 E1.57089
N1253 G1 X159.66 Y165.025 E.02347
N1254 G1 X190.34 Y195.706 E1.57089
N1255 G1 X190.34 Y196.354 E.02347
N1256 G1 X159.66 Y165.673 E1.57089
N1257 G1 X159.66 Y166.321 E.02347
N1258 G1 X190.34 Y197.002 E1.57089
N1259 G1 X190.34 Y197.65 E.02347
N1260 G1 X159.66 Y166.97 E1.57089
N1261 G1 X159.66 Y167.618 E.02347
N1262 G1 X190.34 Y198.298 E1.57089
N1263 G1 X190.34 Y198.946 E.02347
N1264 G1 X159.66 Y168.266 E1.57089
N1265 G1 X159.66 Y168.914 E.02347
N1266 G1 X190.34 Y199.595 E1.57089
N1267 G1 X190.34 Y199.895 E.01088
N1268 M73 P21 R41
N1269 G1 X189.993 Y199.895 E.01259
N1270 G1 X159.66 Y169.562 E1.55308
N1271 G1 X159.66 Y170.21 E.02347
N1272 G1 X189.344 Y199.895 E1.51989
N1273 G1 X188.696 Y199.895 E.02347
N1274 G1 X159.66 Y170.859 E1.48671
N1275 G1 X159.66 Y171.507 E.02347
N1276 G1 X188.048 Y199.895 E1.45352
N1277 G1 X187.4 Y199.895 E.02347
N1278 G1 X159.66 Y172.155 E1.42033
N1279 G1 X159.66 Y172.803 E.02347
N1280 G1 X186.752 Y199.895 E1.38714
N1281 G1 X186.103 Y199.895 E.02347
N1282 G1 X159.66 Y173.451 E1.35396
N1283 G1 X159.66 Y174.099 E.02347
N1284 G1 X185.455 Y199.895 E1.32077
N1285 G1 X184.807 Y199.895 E.02347
N1286 G1 X159.66 Y174.748 E1.28758
N1287 G1 X159.66 Y175.396 E.02347
N1288 G1 X184.159 Y199.895 E1.25439
N1289 G1 X183.511 Y199.895 E.02347
N1290 G1 X159.66 Y176.044 E1.22121
N1291 G1 X159.66 Y176.692 E.02347
N1292 G1 X182.863 Y199.895 E1.18802
N1293 G1 X182.214 Y199.895 E.02347
N1294 G1 X159.66 Y177.34 E1.15483
N1295 G1 X159.66 Y177.989 E.02347
N1296 G1 X181.566 Y199.895 E1.12164
N1297 G1 X180.918 Y199.895 E.02347
N1298 G1 X159.66 Y178.637 E1.08846
N1299 G1 X159.66 Y179.285 E.02347
N1300 G1 X180.27 Y199.895 E1.05527
N1301 G1 X179.622 Y199.895 E.02347
N1302 G1 X159.66 Y179.933 E1.02208
N1303 G1 X159.66 Y180.581 E.02347
N1304 G1 X178.974 Y199.895 E.98889
N1305 G1 X178.325 Y199.895 E.02347
N1306 G1 X159.66 Y181.229 E.95571
N1307 G1 X159.66 Y181.878 E.02347
N1308 G1 X177.677 Y199.895 E.92252
N1309 G1 X177.029 Y199.895 E.02347
N1310 G1 X159.66 Y182.526 E.88933
N1311 G1 X159.66 Y183.174 E.02347
N1312 G1 X176.381 Y199.895 E.85614
N1313 G1 X175.733 Y199.895 E.02347
N1314 G1 X159.66 Y183.822 E.82296
N1315 G1 X159.66 Y184.47 E.02347
N1316 G1 X175.084 Y199.895 E.78977
N1317 G1 X174.436 Y199.895 E.02347
N1318 G1 X159.66 Y185.118 E.75658
N1319 G1 X159.66 Y185.767 E.02347
N1320 G1 X173.788 Y199.895 E.72339
N1321 G1 X173.14 Y199.895 E.02347
N1322 G1 X159.66 Y186.415 E.69021
N1323 G1 X159.66 Y187.063 E.02347
N1324 G1 X172.492 Y199.895 E.65702
N1325 G1 X171.844 Y199.895 E.02347
N1326 G1 X159.66 Y187.711 E.62383
N1327 G1 X159.66 Y188.359 E.02347
N1328 G1 X171.195 Y199.895 E.59064
N1329 G1 X170.547 Y199.895 E.02347
N1330 G1 X159.66 Y189.008 E.55746
N1331 G1 X159.66 Y189.656 E.02347
N1332 M73 P22 R41
N1333 G1 X169.899 Y199.895 E.52427
N1334 G1 X169.251 Y199.895 E.02347
N1335 G1 X159.66 Y190.304 E.49108
N1336 G1 X159.66 Y190.952 E.02347
N1337 G1 X168.603 Y199.895 E.45789
N1338 G1 X167.955 Y199.895 E.02347
N1339 G1 X159.66 Y191.6 E.42471
N1340 G1 X159.66 Y192.248 E.02347
N1341 G1 X167.306 Y199.895 E.39152
N1342 G1 X166.658 Y199.895 E.02347
N1343 G1 X159.66 Y192.897 E.35833
N1344 G1 X159.66 Y193.545 E.02347
N1345 G1 X166.01 Y199.895 E.32514
N1346 G1 X165.362 Y199.895 E.02347
N1347 G1 X159.66 Y194.193 E.29196
N1348 G1 X159.66 Y194.841 E.02347
N1349 G1 X164.714 Y199.895 E.25877
N1350 G1 X164.065 Y199.895 E.02347
N1351 G1 X159.66 Y195.489 E.22558
N1352 G1 X159.66 Y196.137 E.02347
N1353 G1 X163.417 Y199.895 E.19239
N1354 G1 X162.769 Y199.895 E.02347
N1355 G1 X159.66 Y196.786 E.15921
N1356 G1 X159.66 Y197.434 E.02347
N1357 G1 X162.121 Y199.895 E.12602
N1358 G1 X161.473 Y199.895 E.02347
N1359 G1 X159.66 Y198.082 E.09283
N1360 G1 X159.66 Y198.73 E.02347
N1361 G1 X160.825 Y199.895 E.05964
N1362 G1 X160.176 Y199.895 E.02347
N1363 G1 X159.454 Y199.173 E.03699
N1364 ; WIPE_START
N1365 G1 X160.176 Y199.895 E-.38822
N1366 G1 X160.825 Y199.895 E-.2463
N1367 G1 X160.591 Y199.662 E-.12548
N1368 ; WIPE_END
N1369 G1 E-.04 F1800
N1370 M204 S6000
N1371 G17
N1372 G3 Z.6 I1.217 J0 P1  F60000
N1373 ; stop printing object, unique label id: 229
N1374 M625
N1375 ; object ids of layer 1 start: 229,239
N1376 M624 AwAAAAAAAAA=
N1377 ;======== H2D 20250527========
N1378 ; SKIPPABLE_START
N1379 ; SKIPTYPE: timelapse
N1380 M622.1 S1 ; for prev firware, default turned on
N1381 
N1382 M1002 judge_flag timelapse_record_flag
N1383 
N1384 M622 J1
N1385 M993 A2 B2 C2
N1386 M993 A0 B0 C0
N1387 
N1388 
N1389 
N1390 
N1391     M9711 M0 E1 X260 Y141 Z0.6 S11 C10 O0 T3000
N1392 
N1393 
N1394 
N1395 M993 A3 B3 C3
N1396 
N1397 M623
N1398 ; SKIPPABLE_END
N1399 
N1400 ; object ids of this layer1 end: 229,239
N1401 M625
N1402 G1 X195.495 Y279.064
N1403 G1 Z.2
N1404 G1 E.8 F1800
N1405 ; LAYER_HEIGHT: 0.200000
N1406 ; FEATURE: Prime tower
N1407 ; LINE_WIDTH: 0.500000
N1408 ; WIPE_TOWER_START
N1409 M204 S6000
N1410 G1  X195.995 Y279.564  
N1411 M204 S500
N1412 G3  X193.533 Y281.605   I-4.373 J-2.768 E0.1236 F3000
N1413 G3  X190.885 Y280.355   I0.012 J-3.454 E0.1149
N1414 G2  X188.182 Y279.564   I-2.709 J4.247 E0.1085
N1415 G2  X174.618 Y279.568   I-6.687 J357.435 E0.5155
N1416 G2  X170.683 Y281.445   I0.499 J6.110 E0.1694
N1417 G3  X168.371 Y281.015   I-0.854 J-1.838 E0.0953
N1418 G1  X166.995 Y279.564   E0.0760
N1419 G3  X165.064 Y277.242   I3.871 J-5.183 E0.1159
N1420 G3  X166.240 Y274.649   I2.902 J-0.247 E0.1130
N1421 G2  X166.995 Y272.245   I-3.465 J-2.409 E0.0972
N1422 G2  X166.992 Y259.212   I-321.195 J-6.431 E0.4954
N1423 G2  X165.146 Y255.634   I-6.663 J1.171 E0.1554
N1424 G3  X165.661 Y253.471   I1.721 J-0.733 E0.0905
N1425 G1 E-0.8000 F1800
N1426 M204 S6000
N1427 G1  X167.381 Y251.657   F600
N1428 G1 E0.8000 F1800
N1429 M204 S500
N1430 G3  X170.238 Y250.033   I2.765 J1.539 E0.1313 F3000
N1431 G3  X172.775 Y251.633   I-12.405 J22.473 E0.1141
N1432 G2  X174.808 Y252.064   I2.042 J-4.626 E0.0796
N1433 G2  X188.372 Y252.060   I6.687 J-357.435 E0.5155
N1434 G2  X192.307 Y250.183   I-0.499 J-6.110 E0.1694
N1435 G3  X194.619 Y250.613   I0.854 J1.838 E0.0953
N1436 G1  X195.995 Y252.064   E0.0760
N1437 G1 E0.0000
N1438 G3  X197.926 Y254.386   I-3.871 J5.182 E0.1159
N1439 G3  X196.750 Y256.979   I-2.902 J0.247 E0.1130
N1440 G2  X195.995 Y259.382   I3.464 J2.409 E0.0972
N1441 G2  X195.998 Y272.416   I321.212 J6.432 E0.4954
N1442 G2  X197.844 Y275.994   I6.663 J-1.171 E0.1554
N1443 G3  X197.504 Y277.972   I-1.658 J0.734 E0.0808
N1444 G1  X195.995 Y279.564   E0.0834
N1445 ; WIPE_TOWER_END
N1446 G1  X195.495 Y252.064  
N1447 ; LAYER_HEIGHT: 0.200000
N1448 ; FEATURE: Prime tower
N1449 ; LINE_WIDTH: 0.500000
N1450 ; WIPE_TOWER_START
N1451 M204 S500
N1452 G1  X167.495  E1.0642
N1453 G1  Y272.314  E0.2565
N1454 G1  X195.495  E1.0642
N1455 G1  Y279.064  E0.2565
N1456 M204 S6000
N1457 G1  X168.495 Y272.314  
N1458 ;--------------------
N1459 ; CP EMPTY GRID START
N1460 ; layer #2
N1461 M204 S500
N1462 G1  Y272.814  E0.0190
N1463 G1  X194.995  E1.0072
N1464 G1  Y273.337  E0.0199
N1465 G1  X167.995  E1.0262
N1466 G1  Y273.859  E0.0199
N1467 G1  X194.995  E1.0262
N1468 G1  Y274.382  E0.0199
N1469 G1  X167.995  E1.0262
N1470 G1  Y274.905  E0.0199
N1471 G1  X194.995  E1.0262
N1472 G1  Y275.428  E0.0199
N1473 G1  X167.995  E1.0262
N1474 G1  Y275.950  E0.0199
N1475 G1  X194.995  E1.0262
N1476 G1  Y276.473  E0.0199
N1477 G1  X167.995  E1.0262
N1478 G1  Y276.996  E0.0199
N1479 G1  X194.995  E1.0262
N1480 G1  Y277.519  E0.0199
N1481 G1  X167.995  E1.0262
N1482 G1  Y278.041  E0.0199
N1483 G1  X194.995  E1.0262
N1484 G1  Y278.564  E0.0199
N1485 G1  X167.995  E1.0262
N1486 G1  Y279.064  E0.0190
N1487 ; CP EMPTY GRID END
N1488 ;------------------
N1489 
N1490 
N1491 
N1492 
N1493 
N1494 
N1495 ; WIPE_TOWER_END
N1496 ; LAYER_HEIGHT: 0.200000
N1497 ; FEATURE: Prime tower
N1498 ; LINE_WIDTH: 0.500000
N1499 ;--------------------
N1500 ; CP TOOLCHANGE START
N1501 ; toolchange #1
N1502 ; material : TPU -> TPU
N1503 ;--------------------
N1504 M220 B
N1505 M220 S100
N1506 ; WIPE_TOWER_START
N1507 G1 E-.8 F1800
N1508 G17
N1509 G3 Z.6 I1.217 J0 P1  F60000
N1510 G1 X167.745 Y266.314 Z.2
N1511 G1 E.8 F1800
N1512 ; LAYER_HEIGHT: 0.200000
N1513 ; FEATURE: Prime tower
N1514 ; LINE_WIDTH: 1.000000
N1515 ; NOZZLE_CHANGE_START OF0 NF1
N1516 M204 S500
N1517 G1  X195.245 Y266.314  E2.1885 F1881
N1518 G1  Y267.314  E0.0796
N1519 G1  X167.745  E2.1885
N1520 G1  Y268.314  E0.0796
N1521 G1  X195.245  E2.1885
N1522 G1  Y269.314  E0.0796
N1523 G1  X167.745  E2.1885
N1524 G1  Y270.314  E0.0796
N1525 G1  X195.245  E2.1885
N1526 G1  Y271.314  E0.0796
N1527 G1  X167.745  E2.1885
N1528 ; NOZZLE_CHANGE_END OF0 NF1
N1529 M104 T1 S89 N0 ;Multi extruder pre cooling
N1530 
N1531 ; WIPE_START
N1532 G1 F5400
N1533 M204 S500
N1534 G1 X169.745 Y271.314 E-1.9
N1535 ; WIPE_END
N1536 G1 E-.1 F1800
N1537 M204 S6000
N1538 G17
N1539 G3 Z.6 I1.217 J0 P1  F5400
N1540 ; filament end gcode 
N1541 
N1542 ;======== H2D ========
N1543 ;===== 20250604 =====
N1544 M993 A2 B2 C2 ; nozzle cam detection allow status save.
N1545 M993 A0 B0 C0 ; nozzle cam detection not allowed.
N1546 
N1547 
N1548 M1015.4 S0 ; disable E air printing detect
N1549 
N1550 
N1551 M620 S1A
N1552 M1002 gcode_claim_action : 4
N1553 M204 S9000
N1554 
N1555 G1 Z3.2 F1200
N1556 
N1557 M400
N1558 M106 P1 S0
N1559 M106 P2 S0
N1560 
N1561 
N1562 
N1563 
N1564 M620.10 A0 F149.669 L0 H0.4 T270 P255 S1
N1565 
N1566 
N1567 
N1568 M620.10 A1 F79.8237 L0 H0.4 T250 P240 S1
N1569 
N1570 
N1571 
N1572 M620.11 P0 I0 E0
N1573 
N1574 
N1575 
N1576 M620.11 K1 I0 R10 F200
N1577 
N1578 
N1579 M628 S1
N1580 
N1581 
N1582 M620.11 S1 L0 I0 R10 D8 E-10 F200
N1583 
N1584 
N1585 M629
N1586 
N1587 
N1588 M620.11 H2 C331
N1589 
N1590 
N1591 T1
N1592 M73 E5
N1593 
N1594 ;deretract
N1595 
N1596 
N1597 
N1598 ; VFLUSH_START
N1599 
N1600 
N1601 ;VG1 E0 F79
N1602 
N1603 
N1604 SYNC T0
N1605 
N1606 ; VFLUSH_END
N1607 
N1608 M1002 set_filament_type:TPU
N1609 
N1610 M400
N1611 M83
N1612 
N1613 
N1614 
N1615 M628 S0
N1616 ;VM109 S240
N1617 M629
N1618 M400
N1619 
N1620 M983.3 F1.33333 A0.4
N1621 
N1622 
N1623 M400
N1624 
N1625 G1 Y320 F30000
N1626 G1 X201
N1627 
N1628 M73 P23 R40
N1629 G1 Y295
N1630 G1 Y265 F18000
N1631 G1 Z3.2 F3000
N1632 
N1633 M204 S500
N1634 
N1635 
N1636 M621 S1A
N1637 
N1638 M993 A3 B3 C3 ; nozzle cam detection allow status restore.
N1639 
N1640 
N1641 M1015.3 S1;enable tpu clog detect
N1642 
N1643 
N1644 
N1645 M1015.4 S0 ; disable E air printing detect
N1646 
N1647 
N1648 M620.6 I1 W1 ;enable ams air printing detect
N1649 M1002 gcode_claim_action : 0
N1650 M106 S0
N1651 M106 P2 S0
N1652 G1 X200 Y264.673 F60000
N1653 G1 Z.2
N1654 G1 X200 Y257.04 Z.6
N1655 G1 X200 Y247.99 Z.6
N1656 G1 X162.991 Y247.99
N1657 G1 X162.991 Y252.564
N1658 G1 X167.495 Y252.564
N1659 
N1660 ; filament start gcode
N1661 G1 Z.2
N1662 
N1663 G4 S0
N1664 ; CP TOOLCHANGE WIPE
N1665 ; LINE_WIDTH: 0.500000
N1666 ; LINE_WIDTH: 0.575000
N1667 M204 S500
N1668 G1  X170.495 Y252.564  E0.1311 F990
N1669 G1 E-0.8000 F1800
N1670 M204 S6000
N1671 G1  X165.995  F600
N1672 G1  X167.495  F240
N1673 G1  X167.995  F600
N1674 G1  Y253.064 
N1675 M73 P24 R40
N1676 G1  X166.995 
N1677 G1  Y252.064 
N1678 G1  X168.495 
N1679 G1  Y253.564 
N1680 G1  X166.495 
N1681 G1  Y251.564 
N1682 G1  X170.495 Y252.564   F990
N1683 G1 E0.8000 F1800
N1684 M204 S500
N1685 G1  X195.495  E1.0927 F990
N1686 G1  Y253.064  E0.0219
N1687 G1  X167.495  E1.2238 F1125
N1688 G1  Y253.564  E0.0219
N1689 G1  X195.495  E1.2238 F1374
N1690 G1  Y254.064  E0.0219
N1691 G1  X167.495  E1.2238 F1826
N1692 G1  Y254.564  E0.0219
N1693 G1  X195.495  E1.2238
N1694 G1  Y255.064  E0.0219
N1695 G1  X167.495  E1.2238
N1696 G1  Y255.564  E0.0219
N1697 G1  X195.495  E1.2238
N1698 G1  Y256.064  E0.0219
N1699 G1  X167.495  E1.2238
N1700 G1  Y256.564  E0.0219
N1701 G1  X195.495  E1.2238
N1702 G1  Y257.064  E0.0219
N1703 G1  X167.495  E1.2238
N1704 G1  Y257.564  E0.0219
N1705 G1  X195.495  E1.2238
N1706 G1  Y258.064  E0.0219
N1707 G1  X167.495  E1.2238
N1708 G1  Y258.564  E0.0219
N1709 G1  X195.495  E1.2238
N1710 G1  Y259.064  E0.0219
N1711 G1  X167.495  E1.2238
N1712 G1  Y259.564  E0.0219
N1713 G1  X195.495  E1.2238
N1714 G1  Y260.064  E0.0219
N1715 G1  X167.495  E1.2238
N1716 G1  Y260.564  E0.0219
N1717 G1  X195.495  E1.2238
N1718 G1  Y261.064  E0.0219
N1719 G1  X167.495  E1.2238
N1720 G1  Y261.564  E0.0219
N1721 G1  X195.495  E1.2238
N1722 G1  Y262.064  E0.0219
N1723 G1  X167.495  E1.2238
N1724 G1  Y262.564  E0.0219
N1725 G1  X195.495  E1.2238
N1726 G1  Y263.064  E0.0219
N1727 G1  X167.495  E1.2238
N1728 G1  Y263.564  E0.0219
N1729 G1  X195.495  E1.2238
N1730 G1  Y264.064  E0.0219
N1731 G1  X167.495  E1.2238
N1732 G1  Y264.564  E0.0219
N1733 G1  X195.495  E1.2238
N1734 G1  Y265.064  E0.0219
N1735 G1  X167.495  E1.2238
N1736 G1  Y265.564  E0.0219
N1737 G1  X195.495  E1.2238
N1738 ; LINE_WIDTH: 0.500000
N1739 ; WIPE_TOWER_END
N1740 M220 R
N1741 G1 F60000
N1742 G4 S0
N1743 G92 E0
N1744 ; CP TOOLCHANGE END
N1745 ;------------------
N1746 
N1747 
N1748 
N1749 ; WIPE_START
N1750 G1 F5400
N1751 M204 S500
N1752 G1 X193.495 Y265.564 E-.76
N1753 ; WIPE_END
N1754 G1 E-.04 F1800
N1755 M204 S6000
N1756 G17
N1757 G3 Z.6 I1.217 J0 P1  F60000
N1758 ; OBJECT_ID: 239
N1759 ; start printing object, unique label id: 239
N1760 M624 AgAAAAAAAAA=
N1761 G1 X182.3 Y118.695 Z.2
N1762 G1 E.8 F1800
N1763 ; FEATURE: Outer wall
N1764 ; LINE_WIDTH: 0.5
N1765 ; LAYER_HEIGHT: 0.2
N1766 G1 F2100.29
N1767 M204 S500
N1768 G1 X167.8 Y118.695 E.55109
N1769 G1 X167.8 Y118.195 E.019
N1770 G1 X182.3 Y118.195 E.55109
N1771 G1 X182.3 Y118.635 E.01672
N1772 ; CHANGE_LAYER
N1773 ; Z_HEIGHT: 0.4
N1774 ; LAYER_HEIGHT: 0.2
N1775 ; WIPE_START
N1776 G1 F2100.29
N1777 G1 X180.3 Y118.644 E-.76
N1778 ; WIPE_END
N1779 G1 E-.04 F1800
N1780 ; stop printing object, unique label id: 239
N1781 M625
N1782 ;======== H2D 20250521========
N1783 ; layer num/total_layer_count: 2/63
N1784 ; update layer progress
N1785 M73 L2
N1786 M991 S0 P1 ;notify layer change
N1787 
N1788 
N1789 M106 S255
N1790 M106 P2 S255
N1791 ; open powerlost recovery
N1792 M1003 S1
N1793 ; OBJECT_ID: 239
N1794 ; start printing object, unique label id: 239
N1795 M624 AgAAAAAAAAA=
N1796 M204 S10000
N1797 G17
N1798 G3 Z.6 I-.055 J1.216 P1  F60000
N1799 G1 X182.34 Y118.735 Z.6
N1800 G1 Z.4
N1801 G1 E.8 F1800
N1802 ; FEATURE: Outer wall
N1803 ; LINE_WIDTH: 0.42
N1804 ; LAYER_HEIGHT: 0.2
N1805 G1 F2545.881
N1806 M204 S5000
N1807 G1 X167.76 Y118.735 E.45715
N1808 G1 X167.76 Y118.155 E.01819
N1809 G1 X182.34 Y118.155 E.45715
N1810 G1 X182.34 Y118.675 E.0163
N1811 M204 S10000
N1812 M73 P25 R40
N1813 G1 X182.144 Y118.445 F60000
N1814 ; FEATURE: Gap infill
N1815 ; LINE_WIDTH: 0.23088
N1816 G1 F5107.47
N1817 M204 S8000
N1818 G1 X167.956 Y118.445 E.22174
N1819 ; WIPE_START
N1820 G1 X169.956 Y118.445 E-.76
N1821 ; WIPE_END
N1822 G1 E-.04 F1800
N1823 ; stop printing object, unique label id: 239
N1824 M625
N1825 M204 S10000
N1826 G17
N1827 G3 Z.8 I-1.199 J.208 P1  F60000
N1828 G1 X195.495 Y265.564 Z.8
N1829 G1 Z.4
N1830 G1 E.8 F1800
N1831 ; LAYER_HEIGHT: 0.200000
N1832 ; FEATURE: Prime tower
N1833 ; LINE_WIDTH: 0.500000
N1834 ; WIPE_TOWER_START
N1835 M204 S8000
N1836 G1  X167.495 Y265.564  E1.0642 F2100
N1837 G1  Y260.064  E0.2090
N1838 G1  X195.495  E1.0642
N1839 G1  Y265.564  E0.2090
N1840 M204 S10000
N1841 G1  X168.495 Y260.064  
N1842 ;--------------------
N1843 ; CP EMPTY GRID START
N1844 ; layer #3
N1845 M204 S8000
N1846 G1  Y265.564  E0.2090
N1847 M204 S10000
N1848 G1  X177.162 
N1849 M204 S8000
N1850 G1  Y260.064  E0.2090
N1851 M204 S10000
N1852 G1  X185.828 
N1853 M204 S8000
N1854 G1  Y265.564  E0.2090
N1855 M204 S10000
N1856 G1  X194.495 
N1857 M204 S8000
N1858 G1  Y260.064  E0.2090
N1859 ; CP EMPTY GRID END
N1860 ;------------------
N1861 
N1862 
N1863 
N1864 
N1865 
N1866 
N1867 ; WIPE_TOWER_END
N1868 ; LAYER_HEIGHT: 0.200000
N1869 ; FEATURE: Prime tower
N1870 ; LINE_WIDTH: 0.500000
N1871 ;--------------------
N1872 ; CP TOOLCHANGE START
N1873 ; toolchange #2
N1874 ; material : PCTG -> PCTG
N1875 ;--------------------
N1876 M220 B
N1877 M220 S100
N1878 ; WIPE_TOWER_START
N1879 G1 E-.8 F1800
N1880 G17
N1881 G3 Z.8 I1.217 J0 P1  F60000
N1882 G1 X167.745 Y252.814
N1883 G1 Z.4
N1884 G1 E.8 F1800
N1885 ; LAYER_HEIGHT: 0.200000
N1886 ; FEATURE: Prime tower
N1887 ; LINE_WIDTH: 1.000000
N1888 ; NOZZLE_CHANGE_START OF1 NF0
N1889 M104 T0 S210 N0 ;Multi extruder pre cooling in post extrusion
N1890 M204 S8000
N1891 G1  X195.245 Y252.814  E2.1885 F251
N1892 G1  Y254.314  E0.1194
N1893 M104 T1 S255 N0 ;Multi extruder pre heating
N1894 M73 P25 R39
N1895 G1  X167.745  E2.1885
N1896 G1  Y255.814  E0.1194
N1897 G1  X195.245  E2.1885
N1898 G1  Y257.314  E0.1194
N1899 G1  X167.745  E2.1885
N1900 G1  Y258.814  E0.1194
N1901 G1  X195.245  E2.1885
N1902 M204 S10000
N1903 G1  Y259.814 
N1904 M73 P26 R39
N1905 G1  X168.245  F398
N1906 G1  Y258.314 
N1907 G1  X194.745 
N1908 G1  Y256.814 
N1909 G1  X168.245 
N1910 G1  Y255.314 
N1911 G1  X194.745 
N1912 G1  Y253.814 
N1913 G1  X168.245 
N1914 ; NOZZLE_CHANGE_END OF1 NF0
N1915 M104 T0 S0 N0 ;Multi extruder pre cooling
N1916 
N1917 G1 E-2 F1800
N1918 G17
N1919 G3 Z.8 I1.217 J0 P1  F5400
N1920 ; filament end gcode 
N1921 
N1922 ;======== H2D ========
N1923 ;===== 20250604 =====
N1924 M993 A2 B2 C2 ; nozzle cam detection allow status save.
N1925 M993 A0 B0 C0 ; nozzle cam detection not allowed.
N1926 
N1927 
N1928 M1015.4 S0 ; disable E air printing detect
N1929 
N1930 
N1931 M620 S0A
N1932 M1002 gcode_claim_action : 4
N1933 M204 S9000
N1934 
N1935 G1 Z3.4 F1200
N1936 
N1937 M400
N1938 M106 P1 S0
N1939 M106 P2 S0
N1940 
N1941 
N1942 ; get travel path for change filament
N1943 ;M620.1 X54 Y0 F21000 P0
N1944 ;M620.1 X54 Y0 F21000 P1
N1945 ;M620.1 X54 Y245 F21000 P2
N1946 
N1947 
N1948 
N1949 M620.10 A0 F79.8237 L0 H0.4 T250 P240 S1
N1950 
N1951 
N1952 
N1953 M620.10 A1 F149.669 L0 H0.4 T270 P255 S1
N1954 
N1955 
N1956 
N1957 M620.11 P0 I1 E0
N1958 
N1959 
N1960 
N1961 M620.11 K1 I1 R0 F200
N1962 
N1963 
N1964 M628 S1
N1965 
N1966 M620.11 S0 L0 I1 E-10 F200
N1967 
N1968 M629
N1969 
N1970 
N1971 M620.11 H2 C331
N1972 
N1973 
N1974 T0
N1975 M73 E4
N1976 
N1977 ;deretract
N1978 
N1979 
N1980 ;VG1 E4 F200
N1981 ;VG1 E4 F100
N1982 
N1983 
N1984 
N1985 ; VFLUSH_START
N1986 
N1987 
N1988 ;VG1 E0 F79
N1989 
N1990 
N1991 SYNC T0
N1992 
N1993 ; VFLUSH_END
N1994 
N1995 M1002 set_filament_type:PCTG
N1996 
N1997 M400
N1998 M83
N1999 
N2000 
N2001 
N2002 M628 S0
N2003 ;VM109 S255
N2004 M629
N2005 M400
N2006 
N2007 M983.3 F2.5 A0.4
N2008 
N2009 
N2010 M400
N2011 
N2012 M73 P27 R38
N2013 G1 Y320 F30000
N2014 G1 X201
N2015 
N2016 G1 Y295
N2017 G1 Y265 F18000
N2018 G1 Z3.4 F3000
N2019 
N2020 M204 S8000
N2021 
N2022 
N2023 M621 S0A
N2024 
N2025 M993 A3 B3 C3 ; nozzle cam detection allow status restore.
N2026 
N2027 
N2028 M1015.3 S0;disable tpu clog detect
N2029 
N2030 
N2031 
N2032 M1015.4 S0 ; disable E air printing detect
N2033 
N2034 
N2035 M620.6 I0 W1 ;enable ams air printing detect
N2036 M1002 gcode_claim_action : 0
N2037 M106 S0
N2038 M106 P2 S0
N2039 G1 X200 Y278.814 F60000
N2040 G1 Z.4
N2041 G1 X195.495 Y278.814 Z.8
N2042 
N2043 ; filament start gcode
N2044 G1 Z.4
N2045 G1 E2 F1800
N2046 
N2047 G4 S0
N2048 ; CP TOOLCHANGE WIPE
N2049 ; LINE_WIDTH: 0.500000
N2050 M204 S8000
N2051 G1  X192.495 Y278.814  E0.1140 F1782
N2052 G1 E-0.8000 F1800
N2053 M204 S10000
N2054 G1  X196.995  F600
N2055 G1  X195.495  F240
N2056 G1  X195.995  F600
N2057 G1  Y279.314 
N2058 G1  X194.995 
N2059 G1  Y278.314 
N2060 G1  X196.495 
N2061 G1  Y279.814 
N2062 G1  X194.495 
N2063 G1  Y277.814 
N2064 G1  X192.495 Y278.814   F1782
N2065 G1 E0.8000 F1800
N2066 M204 S8000
N2067 G1  X167.495  E0.9502 F1782
N2068 G1  Y278.064  E0.0285
N2069 G1  X195.495  E1.0642 F2025
N2070 G1  Y277.314  E0.0285
N2071 G1  X167.495  E1.0642 F2473
N2072 G1  Y276.564  E0.0285
N2073 G1  X195.495  E1.0642 F3938
N2074 G1  Y275.814  E0.0285
N2075 G1  X167.495  E1.0642
N2076 G1  Y275.064  E0.0285
N2077 G1  X195.495  E1.0642
N2078 G1  Y274.314  E0.0285
N2079 G1  X167.495  E1.0642
N2080 G1  Y273.564  E0.0285
N2081 G1  X195.495  E1.0642
N2082 G1  Y272.814  E0.0285
N2083 G1  X167.495  E1.0642
N2084 G1  Y272.064  E0.0285
N2085 G1  X195.495  E1.0642
N2086 G1  Y271.314  E0.0285
N2087 G1  X167.495  E1.0642
N2088 G1  Y270.564  E0.0285
N2089 G1  X195.495  E1.0642
N2090 G1  Y269.814  E0.0285
N2091 G1  X167.495  E1.0642
N2092 G1  Y269.064  E0.0285
N2093 G1  X195.495  E1.0642
N2094 G1  Y268.314  E0.0285
N2095 G1  X167.495  E1.0642
N2096 G1  Y267.564  E0.0285
N2097 G1  X195.495  E1.0642
N2098 G1  Y266.814  E0.0285
N2099 G1  X167.495  E1.0642
N2100 G1  Y266.064  E0.0285
N2101 G1  X195.495  E1.0642
N2102 ; WIPE_TOWER_END
N2103 M220 R
N2104 G1 F60000
N2105 G4 S0
N2106 G92 E0
N2107 ; CP TOOLCHANGE END
N2108 ;------------------
N2109 
N2110 
N2111 G1  Y252.064  
N2112 ; LAYER_HEIGHT: 0.200000
N2113 ; FEATURE: Prime tower
N2114 ; LINE_WIDTH: 0.500000
N2115 ; WIPE_TOWER_START
N2116 M204 S10000
N2117 G1  X195.846 Y279.721  
N2118 M204 S8000
N2119 G3  X193.064 Y281.636   I-3.469 J-2.060 E0.1325 F3938
N2120 G3  X190.723 Y280.255   I1.448 J-5.129 E0.1045
N2121 G2  X188.182 Y279.564   I-2.568 J4.426 E0.1012
N2122 G2  X174.618 Y279.568   I-6.687 J357.435 E0.5155
N2123 G2  X170.683 Y281.445   I0.499 J6.110 E0.1694
N2124 G3  X168.371 Y281.015   I-0.854 J-1.838 E0.0953
N2125 G1  X166.995 Y279.564   E0.0760
N2126 G3  X165.064 Y277.242   I3.871 J-5.183 E0.1159
N2127 G3  X166.240 Y274.649   I2.902 J-0.247 E0.1130
N2128 G2  X166.995 Y272.245   I-3.465 J-2.409 E0.0972
N2129 G2  X166.992 Y259.212   I-321.195 J-6.431 E0.4954
N2130 G2  X165.146 Y255.634   I-6.663 J1.171 E0.1554
N2131 G3  X165.485 Y253.656   I1.658 J-0.734 E0.0808
N2132 G1  X168.371 Y250.613   E0.1594
N2133 G3  X171.793 Y251.056   I1.525 J1.652 E0.1495
N2134 G2  X174.808 Y252.064   I3.021 J-4.025 E0.1229
N2135 G2  X188.372 Y252.060   I6.687 J-357.435 E0.5155
N2136 G2  X192.307 Y250.183   I-0.499 J-6.110 E0.1694
N2137 G3  X194.619 Y250.613   I0.854 J1.838 E0.0953
N2138 G1  X195.995 Y252.064   E0.0760
N2139 G3  X197.926 Y254.386   I-3.871 J5.182 E0.1159
N2140 G3  X196.750 Y256.979   I-2.902 J0.247 E0.1130
N2141 G2  X195.995 Y259.382   I3.464 J2.409 E0.0972
N2142 G2  X195.998 Y272.416   I321.212 J6.432 E0.4954
N2143 G2  X197.844 Y275.994   I6.663 J-1.171 E0.1554
N2144 G3  X197.564 Y277.905   I-1.654 J0.733 E0.0774
N2145 ; WIPE_TOWER_END
N2146 
N2147 ; WIPE_START
N2148 G1 F5107.47
N2149 M204 S8000
N2150 G1 X197.598 Y277.866 E-.01975
N2151 G1 X197.683 Y277.752 E-.0539
N2152 G1 X197.759 Y277.632 E-.05389
N2153 G1 X197.825 Y277.506 E-.0539
N2154 G1 X197.88 Y277.376 E-.0539
N2155 G1 X197.926 Y277.242 E-.05389
N2156 G1 X197.961 Y277.104 E-.0539
N2157 G1 X197.985 Y276.964 E-.05389
N2158 G1 X197.998 Y276.823 E-.0539
N2159 G1 X198 Y276.681 E-.05389
N2160 G1 X197.99 Y276.54 E-.05389
N2161 G1 X197.97 Y276.4 E-.05389
N2162 G1 X197.938 Y276.261 E-.0539
N2163 G1 X197.896 Y276.126 E-.05389
N2164 G1 X197.858 Y276.029 E-.03963
N2165 ; WIPE_END
N2166 G1 E-.04 F1800
N2167 M204 S10000
N2168 G17
N2169 G3 Z.8 I1.217 J0 P1  F60000
N2170 ; OBJECT_ID: 229
N2171 ; start printing object, unique label id: 229
N2172 M624 AQAAAAAAAAA=
N2173 G1 X191.084 Y200.639
N2174 G1 Z.4
N2175 G1 E.8 F1800
N2176 ; FEATURE: Inner wall
N2177 ; LINE_WIDTH: 0.45
N2178 ; LAYER_HEIGHT: 0.2
N2179 G1 F4421.739
N2180 M204 S8000
N2181 G1 X158.916 Y200.639 E1.03439
N2182 G1 X158.916 Y127.036 E2.36678
N2183 G1 X191.084 Y127.036 E1.03439
N2184 G1 X191.084 Y200.579 E2.36485
N2185 M204 S10000
N2186 G1 X191.491 Y201.046 F60000
N2187 G1 F4421.739
N2188 M204 S8000
N2189 G1 X158.509 Y201.046 E1.06057
N2190 G1 X158.509 Y126.629 E2.39296
N2191 G1 X191.491 Y126.629 E1.06057
N2192 G1 X191.491 Y200.986 E2.39103
N2193 M204 S10000
N2194 G1 X191.898 Y201.453 F60000
N2195 G1 F4421.739
N2196 M204 S8000
N2197 G1 X158.102 Y201.453 E1.08675
N2198 G1 X158.102 Y126.222 E2.41914
N2199 G1 X191.898 Y126.222 E1.08675
N2200 G1 X191.898 Y201.393 E2.41721
N2201 M204 S10000
N2202 G1 X192.29 Y201.845 F60000
N2203 ; FEATURE: Outer wall
N2204 ; LINE_WIDTH: 0.42
N2205 G1 F4773.528
N2206 M204 S5000
N2207 G1 X157.71 Y201.845 E1.03002
N2208 G1 X157.71 Y125.83 E2.26421
N2209 G1 X192.29 Y125.83 E1.03002
N2210 G1 X192.29 Y201.785 E2.26243
N2211 G1 E-.8 F1800
N2212 M204 S10000
N2213 G1 X190.157 Y200.475 Z.8 F60000
N2214 G1 Z.4
N2215 M73 P28 R38
N2216 G1 E.8 F1800
N2217 ; FEATURE: Internal solid infill
N2218 ; LINE_WIDTH: 0.42048
N2219 G1 F4767.454
N2220 M204 S8000
N2221 G1 X190.751 Y199.881 E.02504
N2222 G1 X190.751 Y199.347 E.01592
N2223 G1 X189.793 Y200.305 E.0404
N2224 G1 X189.259 Y200.305 E.01592
N2225 G1 X190.751 Y198.813 E.06292
N2226 G1 X190.751 Y198.279 E.01592
N2227 G1 X188.725 Y200.305 E.08544
N2228 G1 X188.191 Y200.305 E.01592
N2229 G1 X190.751 Y197.746 E.10797
N2230 G1 X190.751 Y197.212 E.01592
N2231 G1 X187.657 Y200.305 E.13049
N2232 G1 X187.123 Y200.305 E.01592
N2233 G1 X190.751 Y196.678 E.15301
N2234 G1 X190.751 Y196.144 E.01592
N2235 G1 X186.589 Y200.305 E.17553
N2236 G1 X186.055 Y200.305 E.01592
N2237 G1 X190.751 Y195.61 E.19805
N2238 G1 X190.751 Y195.076 E.01592
N2239 G1 X185.521 Y200.305 E.22057
N2240 G1 X184.987 Y200.305 E.01592
N2241 G1 X190.751 Y194.542 E.24309
N2242 G1 X190.751 Y194.008 E.01592
N2243 G1 X184.453 Y200.305 E.26561
N2244 G1 X183.919 Y200.305 E.01592
N2245 G1 X190.751 Y193.474 E.28813
N2246 G1 X190.751 Y192.94 E.01592
N2247 G1 X183.385 Y200.305 E.31066
N2248 G1 X182.851 Y200.305 E.01592
N2249 G1 X190.751 Y192.406 E.33318
N2250 G1 X190.751 Y191.872 E.01592
N2251 G1 X182.317 Y200.305 E.3557
N2252 G1 X181.783 Y200.305 E.01592
N2253 G1 X190.751 Y191.338 E.37822
N2254 G1 X190.751 Y190.804 E.01593
N2255 G1 X181.249 Y200.305 E.40074
N2256 G1 X180.715 Y200.305 E.01592
N2257 G1 X190.751 Y190.27 E.42326
N2258 G1 X190.751 Y189.736 E.01592
N2259 G1 X180.182 Y200.305 E.44578
N2260 G1 X179.648 Y200.305 E.01592
N2261 G1 X190.751 Y189.202 E.4683
N2262 G1 X190.751 Y188.668 E.01592
N2263 G1 X179.114 Y200.305 E.49082
N2264 G1 X178.58 Y200.305 E.01592
N2265 G1 X190.751 Y188.134 E.51335
N2266 G1 X190.751 Y187.6 E.01592
N2267 G1 X178.046 Y200.305 E.53587
N2268 G1 X177.512 Y200.305 E.01592
N2269 G1 X190.751 Y187.067 E.55839
N2270 G1 X190.751 Y186.533 E.01592
N2271 G1 X176.978 Y200.305 E.58091
N2272 G1 X176.444 Y200.305 E.01593
N2273 G1 X190.751 Y185.999 E.60343
N2274 G1 X190.751 Y185.465 E.01592
N2275 G1 X175.91 Y200.305 E.62595
N2276 G1 X175.376 Y200.305 E.01592
N2277 G1 X190.751 Y184.931 E.64847
N2278 G1 X190.751 Y184.397 E.01592
N2279 G1 X174.842 Y200.305 E.67099
N2280 G1 X174.308 Y200.305 E.01592
N2281 G1 X190.751 Y183.863 E.69351
N2282 G1 X190.751 Y183.329 E.01592
N2283 G1 X173.774 Y200.305 E.71604
N2284 G1 X173.24 Y200.305 E.01593
N2285 G1 X190.751 Y182.795 E.73856
N2286 G1 X190.751 Y182.261 E.01592
N2287 G1 X172.706 Y200.305 E.76108
N2288 G1 X172.172 Y200.305 E.01592
N2289 G1 X190.751 Y181.727 E.7836
N2290 G1 X190.751 Y181.193 E.01592
N2291 G1 X171.638 Y200.305 E.80612
N2292 G1 X171.104 Y200.305 E.01592
N2293 G1 X190.751 Y180.659 E.82864
N2294 G1 X190.751 Y180.125 E.01592
N2295 G1 X170.57 Y200.305 E.85116
N2296 G1 X170.036 Y200.305 E.01592
N2297 G1 X190.751 Y179.591 E.87368
N2298 G1 X190.751 Y179.057 E.01592
N2299 G1 X169.503 Y200.305 E.8962
N2300 G1 X168.969 Y200.305 E.01592
N2301 G1 X190.751 Y178.523 E.91873
N2302 G1 X190.751 Y177.989 E.01592
N2303 G1 X168.435 Y200.305 E.94125
N2304 G1 X167.901 Y200.305 E.01592
N2305 G1 X190.751 Y177.455 E.96377
N2306 G1 X190.751 Y176.921 E.01592
N2307 G1 X167.367 Y200.305 E.98629
N2308 G1 X166.833 Y200.305 E.01592
N2309 G1 X190.751 Y176.388 E1.00881
N2310 G1 X190.751 Y175.854 E.01592
N2311 G1 X166.299 Y200.305 E1.03133
N2312 G1 X165.765 Y200.305 E.01592
N2313 G1 X190.751 Y175.32 E1.05385
N2314 G1 X190.751 Y174.786 E.01592
N2315 G1 X165.231 Y200.305 E1.07637
N2316 G1 X164.697 Y200.305 E.01592
N2317 G1 X190.751 Y174.252 E1.09889
N2318 G1 X190.751 Y173.718 E.01592
N2319 G1 X164.163 Y200.305 E1.12141
N2320 G1 X163.629 Y200.305 E.01592
N2321 G1 X190.751 Y173.184 E1.14394
N2322 G1 X190.751 Y172.65 E.01592
N2323 G1 X163.095 Y200.305 E1.16646
N2324 G1 X162.561 Y200.305 E.01592
N2325 G1 X190.751 Y172.116 E1.18898
N2326 G1 X190.751 Y171.582 E.01592
N2327 G1 X162.027 Y200.305 E1.2115
N2328 G1 X161.493 Y200.305 E.01592
N2329 G1 X190.751 Y171.048 E1.23402
N2330 G1 X190.751 Y170.514 E.01592
N2331 G1 X160.959 Y200.305 E1.25654
N2332 G1 X160.425 Y200.305 E.01592
N2333 G1 X190.751 Y169.98 E1.27906
N2334 G1 X190.751 Y169.446 E.01592
N2335 G1 X159.891 Y200.305 E1.30158
N2336 G1 X159.357 Y200.305 E.01592
N2337 G1 X190.751 Y168.912 E1.3241
N2338 G1 X190.751 Y168.378 E.01593
N2339 G1 X159.249 Y199.879 E1.32866
N2340 G1 X159.249 Y199.345 E.01592
N2341 G1 X190.751 Y167.844 E1.32866
N2342 G1 X190.751 Y167.31 E.01592
N2343 G1 X159.249 Y198.811 E1.32866
N2344 G1 X159.249 Y198.277 E.01593
N2345 G1 X190.751 Y166.776 E1.32866
N2346 G1 X190.751 Y166.242 E.01592
N2347 G1 X159.249 Y197.744 E1.32866
N2348 G1 X159.249 Y197.21 E.01592
N2349 G1 X190.751 Y165.709 E1.32866
N2350 G1 X190.751 Y165.175 E.01592
N2351 G1 X159.249 Y196.676 E1.32866
N2352 G1 X159.249 Y196.142 E.01592
N2353 G1 X190.751 Y164.641 E1.32866
N2354 G1 X190.751 Y164.107 E.01592
N2355 G1 X159.249 Y195.608 E1.32866
N2356 G1 X159.249 Y195.074 E.01592
N2357 G1 X190.751 Y163.573 E1.32866
N2358 G1 X190.751 Y163.039 E.01592
N2359 G1 X159.249 Y194.54 E1.32866
N2360 G1 X159.249 Y194.006 E.01592
N2361 G1 X190.751 Y162.505 E1.32866
N2362 G1 X190.751 Y161.971 E.01592
N2363 G1 X159.249 Y193.472 E1.32866
N2364 G1 X159.249 Y192.938 E.01592
N2365 G1 X190.751 Y161.437 E1.32866
N2366 G1 X190.751 Y160.903 E.01592
N2367 G1 X159.249 Y192.404 E1.32866
N2368 G1 X159.249 Y191.87 E.01592
N2369 G1 X190.751 Y160.369 E1.32866
N2370 G1 X190.751 Y159.835 E.01592
N2371 G1 X159.249 Y191.336 E1.32866
N2372 G1 X159.249 Y190.802 E.01592
N2373 G1 X190.751 Y159.301 E1.32866
N2374 G1 X190.751 Y158.767 E.01592
N2375 G1 X159.249 Y190.268 E1.32866
N2376 G1 X159.249 Y189.734 E.01592
N2377 G1 X190.751 Y158.233 E1.32866
N2378 G1 X190.751 Y157.699 E.01592
N2379 M73 P28 R37
N2380 G1 X159.249 Y189.2 E1.32866
N2381 G1 X159.249 Y188.666 E.01592
N2382 G1 X190.751 Y157.165 E1.32866
N2383 G1 X190.751 Y156.631 E.01592
N2384 G1 X159.249 Y188.132 E1.32866
N2385 G1 X159.249 Y187.598 E.01592
N2386 G1 X190.751 Y156.097 E1.32866
N2387 G1 X190.751 Y155.563 E.01592
N2388 M73 P29 R37
N2389 G1 X159.249 Y187.065 E1.32866
N2390 G1 X159.249 Y186.531 E.01593
N2391 G1 X190.751 Y155.03 E1.32866
N2392 G1 X190.751 Y154.496 E.01592
N2393 G1 X159.249 Y185.997 E1.32866
N2394 G1 X159.249 Y185.463 E.01592
N2395 G1 X190.751 Y153.962 E1.32866
N2396 G1 X190.751 Y153.428 E.01592
N2397 G1 X159.249 Y184.929 E1.32866
N2398 G1 X159.249 Y184.395 E.01592
N2399 G1 X190.751 Y152.894 E1.32866
N2400 G1 X190.751 Y152.36 E.01592
N2401 G1 X159.249 Y183.861 E1.32866
N2402 G1 X159.249 Y183.327 E.01592
N2403 G1 X190.751 Y151.826 E1.32866
N2404 G1 X190.751 Y151.292 E.01592
N2405 G1 X159.249 Y182.793 E1.32866
N2406 G1 X159.249 Y182.259 E.01592
N2407 G1 X190.751 Y150.758 E1.32866
N2408 G1 X190.751 Y150.224 E.01592
N2409 G1 X159.249 Y181.725 E1.32866
N2410 G1 X159.249 Y181.191 E.01592
N2411 G1 X190.751 Y149.69 E1.32866
N2412 G1 X190.751 Y149.156 E.01593
N2413 G1 X159.249 Y180.657 E1.32866
N2414 G1 X159.249 Y180.123 E.01592
N2415 G1 X190.751 Y148.622 E1.32866
N2416 G1 X190.751 Y148.088 E.01592
N2417 G1 X159.249 Y179.589 E1.32866
N2418 G1 X159.249 Y179.055 E.01592
N2419 G1 X190.751 Y147.554 E1.32866
N2420 G1 X190.751 Y147.02 E.01592
N2421 G1 X159.249 Y178.521 E1.32866
N2422 G1 X159.249 Y177.987 E.01592
N2423 G1 X190.751 Y146.486 E1.32866
N2424 G1 X190.751 Y145.952 E.01592
N2425 G1 X159.249 Y177.453 E1.32866
N2426 G1 X159.249 Y176.919 E.01592
N2427 G1 X190.751 Y145.418 E1.32866
N2428 G1 X190.751 Y144.884 E.01592
N2429 G1 X159.249 Y176.386 E1.32866
N2430 G1 X159.249 Y175.852 E.01592
N2431 G1 X190.751 Y144.351 E1.32866
N2432 G1 X190.751 Y143.817 E.01592
N2433 G1 X159.249 Y175.318 E1.32866
N2434 G1 X159.249 Y174.784 E.01592
N2435 G1 X190.751 Y143.283 E1.32866
N2436 G1 X190.751 Y142.749 E.01592
N2437 G1 X159.249 Y174.25 E1.32866
N2438 G1 X159.249 Y173.716 E.01592
N2439 G1 X190.751 Y142.215 E1.32866
N2440 G1 X190.751 Y141.681 E.01592
N2441 G1 X159.249 Y173.182 E1.32866
N2442 G1 X159.249 Y172.648 E.01592
N2443 G1 X190.751 Y141.147 E1.32866
N2444 G1 X190.751 Y140.613 E.01592
N2445 G1 X159.249 Y172.114 E1.32866
N2446 G1 X159.249 Y171.58 E.01592
N2447 G1 X190.751 Y140.079 E1.32866
N2448 G1 X190.751 Y139.545 E.01592
N2449 G1 X159.249 Y171.046 E1.32866
N2450 G1 X159.249 Y170.512 E.01592
N2451 G1 X190.751 Y139.011 E1.32866
N2452 G1 X190.751 Y138.477 E.01592
N2453 G1 X159.249 Y169.978 E1.32866
N2454 G1 X159.249 Y169.444 E.01592
N2455 G1 X190.751 Y137.943 E1.32866
N2456 G1 X190.751 Y137.409 E.01593
N2457 G1 X159.249 Y168.91 E1.32866
N2458 G1 X159.249 Y168.376 E.01592
N2459 G1 X190.751 Y136.875 E1.32866
N2460 G1 X190.751 Y136.341 E.01592
N2461 G1 X159.249 Y167.842 E1.32866
N2462 G1 X159.249 Y167.308 E.01592
N2463 G1 X190.751 Y135.807 E1.32866
N2464 G1 X190.751 Y135.273 E.01592
N2465 G1 X159.249 Y166.774 E1.32866
N2466 G1 X159.249 Y166.24 E.01592
N2467 G1 X190.751 Y134.739 E1.32866
N2468 G1 X190.751 Y134.205 E.01592
N2469 G1 X159.249 Y165.707 E1.32866
N2470 G1 X159.249 Y165.173 E.01592
N2471 G1 X190.751 Y133.672 E1.32866
N2472 G1 X190.751 Y133.138 E.01592
N2473 G1 X159.249 Y164.639 E1.32866
N2474 G1 X159.249 Y164.105 E.01593
N2475 G1 X190.751 Y132.604 E1.32866
N2476 G1 X190.751 Y132.07 E.01592
N2477 G1 X159.249 Y163.571 E1.32866
N2478 G1 X159.249 Y163.037 E.01592
N2479 G1 X190.751 Y131.536 E1.32866
N2480 G1 X190.751 Y131.002 E.01592
N2481 G1 X159.249 Y162.503 E1.32866
N2482 G1 X159.249 Y161.969 E.01592
N2483 G1 X190.751 Y130.468 E1.32866
N2484 G1 X190.751 Y129.934 E.01592
N2485 G1 X159.249 Y161.435 E1.32866
N2486 G1 X159.249 Y160.901 E.01592
N2487 G1 X190.751 Y129.4 E1.32866
N2488 G1 X190.751 Y128.866 E.01592
N2489 G1 X159.249 Y160.367 E1.32866
N2490 G1 X159.249 Y159.833 E.01592
N2491 G1 X190.751 Y128.332 E1.32866
N2492 G1 X190.751 Y127.798 E.01592
N2493 G1 X159.249 Y159.299 E1.32866
N2494 G1 X159.249 Y158.765 E.01592
N2495 G1 X190.645 Y127.37 E1.32421
N2496 G1 X190.111 Y127.37 E.01592
N2497 G1 X159.249 Y158.231 E1.30169
N2498 G1 X159.249 Y157.697 E.01592
N2499 M73 P30 R37
N2500 G1 X189.577 Y127.37 E1.27917
N2501 G1 X189.043 Y127.37 E.01592
N2502 G1 X159.249 Y157.163 E1.25664
N2503 G1 X159.249 Y156.629 E.01592
N2504 G1 X188.509 Y127.37 E1.23412
N2505 G1 X187.975 Y127.37 E.01592
N2506 G1 X159.249 Y156.095 E1.2116
N2507 G1 X159.249 Y155.561 E.01592
N2508 G1 X187.441 Y127.37 E1.18908
N2509 G1 X186.907 Y127.37 E.01592
N2510 G1 X159.249 Y155.028 E1.16656
N2511 G1 X159.249 Y154.494 E.01592
N2512 G1 X186.373 Y127.37 E1.14404
N2513 G1 X185.839 Y127.37 E.01592
N2514 G1 X159.249 Y153.96 E1.12152
N2515 G1 X159.249 Y153.426 E.01592
N2516 G1 X185.305 Y127.37 E1.099
N2517 G1 X184.772 Y127.37 E.01593
N2518 G1 X159.249 Y152.892 E1.07648
N2519 G1 X159.249 Y152.358 E.01592
N2520 G1 X184.238 Y127.37 E1.05395
N2521 G1 X183.704 Y127.37 E.01592
N2522 G1 X159.249 Y151.824 E1.03143
N2523 G1 X159.249 Y151.29 E.01592
N2524 G1 X183.17 Y127.37 E1.00891
N2525 G1 X182.636 Y127.37 E.01592
N2526 G1 X159.249 Y150.756 E.98639
N2527 G1 X159.249 Y150.222 E.01592
N2528 G1 X182.102 Y127.37 E.96387
N2529 G1 X181.568 Y127.37 E.01592
N2530 G1 X159.249 Y149.688 E.94135
N2531 G1 X159.249 Y149.154 E.01592
N2532 G1 X181.034 Y127.37 E.91883
N2533 G1 X180.5 Y127.37 E.01592
N2534 G1 X159.249 Y148.62 E.89631
N2535 G1 X159.249 Y148.086 E.01592
N2536 G1 X179.966 Y127.37 E.87379
N2537 G1 X179.432 Y127.37 E.01592
N2538 G1 X159.249 Y147.552 E.85126
N2539 G1 X159.249 Y147.018 E.01592
N2540 G1 X178.898 Y127.37 E.82874
N2541 G1 X178.364 Y127.37 E.01592
N2542 G1 X159.249 Y146.484 E.80622
N2543 G1 X159.249 Y145.95 E.01592
N2544 G1 X177.83 Y127.37 E.7837
N2545 G1 X177.296 Y127.37 E.01592
N2546 G1 X159.249 Y145.416 E.76118
N2547 G1 X159.249 Y144.882 E.01593
N2548 G1 X176.762 Y127.37 E.73866
N2549 G1 X176.228 Y127.37 E.01592
N2550 G1 X159.249 Y144.349 E.71614
N2551 G1 X159.249 Y143.815 E.01592
N2552 G1 X175.694 Y127.37 E.69362
N2553 G1 X175.16 Y127.37 E.01592
N2554 G1 X159.249 Y143.281 E.6711
N2555 G1 X159.249 Y142.747 E.01592
N2556 G1 X174.626 Y127.37 E.64857
N2557 G1 X174.093 Y127.37 E.01592
N2558 G1 X159.249 Y142.213 E.62605
N2559 G1 X159.249 Y141.679 E.01592
N2560 G1 X173.559 Y127.37 E.60353
N2561 G1 X173.025 Y127.37 E.01592
N2562 G1 X159.249 Y141.145 E.58101
N2563 G1 X159.249 Y140.611 E.01592
N2564 G1 X172.491 Y127.37 E.55849
N2565 G1 X171.957 Y127.37 E.01592
N2566 G1 X159.249 Y140.077 E.53597
N2567 G1 X159.249 Y139.543 E.01592
N2568 G1 X171.423 Y127.37 E.51345
N2569 G1 X170.889 Y127.37 E.01592
N2570 G1 X159.249 Y139.009 E.49093
N2571 G1 X159.249 Y138.475 E.01592
N2572 G1 X170.355 Y127.37 E.46841
N2573 G1 X169.821 Y127.37 E.01592
N2574 G1 X159.249 Y137.941 E.44588
N2575 G1 X159.249 Y137.407 E.01592
N2576 G1 X169.287 Y127.37 E.42336
N2577 G1 X168.753 Y127.37 E.01592
N2578 G1 X159.249 Y136.873 E.40084
N2579 G1 X159.249 Y136.339 E.01592
N2580 G1 X168.219 Y127.37 E.37832
N2581 G1 X167.685 Y127.37 E.01592
N2582 G1 X159.249 Y135.805 E.3558
N2583 G1 X159.249 Y135.271 E.01592
N2584 G1 X167.151 Y127.37 E.33328
N2585 G1 X166.617 Y127.37 E.01592
N2586 G1 X159.249 Y134.737 E.31076
N2587 G1 X159.249 Y134.203 E.01592
N2588 G1 X166.083 Y127.37 E.28824
N2589 G1 X165.549 Y127.37 E.01592
N2590 G1 X159.249 Y133.669 E.26572
N2591 G1 X159.249 Y133.136 E.01592
N2592 G1 X165.015 Y127.37 E.24319
N2593 G1 X164.481 Y127.37 E.01592
N2594 G1 X159.249 Y132.602 E.22067
N2595 G1 X159.249 Y132.068 E.01592
N2596 G1 X163.947 Y127.37 E.19815
N2597 G1 X163.413 Y127.37 E.01592
N2598 G1 X159.249 Y131.534 E.17563
N2599 G1 X159.249 Y131 E.01592
N2600 G1 X162.88 Y127.37 E.15311
N2601 G1 X162.346 Y127.37 E.01592
N2602 G1 X159.249 Y130.466 E.13059
N2603 G1 X159.249 Y129.932 E.01592
N2604 G1 X161.812 Y127.37 E.10807
N2605 G1 X161.278 Y127.37 E.01592
N2606 G1 X159.249 Y129.398 E.08555
N2607 G1 X159.249 Y128.864 E.01592
N2608 G1 X160.744 Y127.37 E.06303
N2609 G1 X160.21 Y127.37 E.01592
N2610 G1 X159.249 Y128.33 E.0405
N2611 G1 X159.249 Y127.796 E.01592
N2612 G1 X159.846 Y127.2 E.02514
N2613 ; WIPE_START
N2614 G1 X159.249 Y127.796 E-.32032
N2615 G1 X159.249 Y128.33 E-.2029
N2616 G1 X159.69 Y127.889 E-.23678
N2617 ; WIPE_END
N2618 G1 E-.04 F1800
N2619 M204 S10000
N2620 G17
N2621 G3 Z.8 I1.217 J0 P1  F60000
N2622 ; stop printing object, unique label id: 229
N2623 M625
N2624 ; object ids of layer 2 start: 229,239
N2625 M624 AwAAAAAAAAA=
N2626 ;======== H2D 20250527========
N2627 ; SKIPPABLE_START
N2628 ; SKIPTYPE: timelapse
N2629 M622.1 S1 ; for prev firware, default turned on
N2630 
N2631 M1002 judge_flag timelapse_record_flag
N2632 
N2633 M622 J1
N2634 M993 A2 B2 C2
N2635 M993 A0 B0 C0
N2636 
N2637 
N2638 
N2639 
N2640     M9711 M0 E1 X260 Y141 Z0.8 S11 C10 O0 T3000
N2641 
N2642 
N2643 
N2644 M993 A3 B3 C3
N2645 
N2646 M623
N2647 ; SKIPPABLE_END
N2648 
N2649 ; object ids of this layer2 end: 229,239
N2650 M625
N2651 ; CHANGE_LAYER
N2652 ; Z_HEIGHT: 0.6
N2653 ; LAYER_HEIGHT: 0.2
N2654 ;======== H2D 20250521========
N2655 ; layer num/total_layer_count: 3/63
N2656 ; update layer progress
N2657 M73 L3
N2658 M991 S0 P2 ;notify layer change
N2659 
N2660 
N2661 ; OBJECT_ID: 229
N2662 ; COOLING_NODE: 0
N2663 ; start printing object, unique label id: 229
N2664 M624 AQAAAAAAAAA=
N2665 G1 X191.084 Y200.639 F60000
N2666 G1 Z.6
N2667 G1 E.8 F1800
N2668 ; FEATURE: Inner wall
N2669 ; LINE_WIDTH: 0.45
N2670 ; LAYER_HEIGHT: 0.2
N2671 G1 F4421.739
N2672 M204 S8000
N2673 G1 X158.916 Y200.639 E1.03439
N2674 G1 X158.916 Y127.036 E2.36678
N2675 G1 X191.084 Y127.036 E1.03439
N2676 G1 X191.084 Y200.579 E2.36485
N2677 ; COOLING_NODE: 0
N2678 M204 S10000
N2679 G1 X191.491 Y201.046 F60000
N2680 G1 F4421.739
N2681 M204 S8000
N2682 G1 X158.509 Y201.046 E1.06057
N2683 G1 X158.509 Y126.629 E2.39296
N2684 G1 X191.491 Y126.629 E1.06057
N2685 G1 X191.491 Y200.986 E2.39103
N2686 ; COOLING_NODE: 0
N2687 M204 S10000
N2688 G1 X191.898 Y201.453 F60000
N2689 G1 F4421.739
N2690 M204 S8000
N2691 G1 X158.102 Y201.453 E1.08675
N2692 G1 X158.102 Y126.222 E2.41914
N2693 G1 X191.898 Y126.222 E1.08675
N2694 G1 X191.898 Y201.393 E2.41721
N2695 ; COOLING_NODE: 0
N2696 M204 S10000
N2697 G1 X192.29 Y201.845 F60000
N2698 ; FEATURE: Outer wall
N2699 ; LINE_WIDTH: 0.42
N2700 G1 F4773.528
N2701 M204 S5000
N2702 M73 P30 R36
N2703 G1 X157.71 Y201.845 E1.03002
N2704 G1 X157.71 Y125.83 E2.26421
N2705 G1 X192.29 Y125.83 E1.03002
N2706 G1 X192.29 Y201.785 E2.26243
N2707 G1 E-.8 F1800
N2708 M204 S10000
N2709 G1 X184.672 Y201.309 Z1 F60000
N2710 G1 X159.08 Y199.709 Z1
N2711 G1 Z.6
N2712 G1 E.8 F1800
N2713 ; FEATURE: Internal solid infill
N2714 ; LINE_WIDTH: 0.42048
N2715 G1 F4767.454
N2716 M204 S8000
N2717 G1 X159.676 Y200.305 E.02514
N2718 G1 X160.21 Y200.305 E.01592
N2719 G1 X159.249 Y199.345 E.0405
N2720 G1 X159.249 Y198.811 E.01592
N2721 G1 X160.744 Y200.305 E.06303
N2722 G1 X161.278 Y200.305 E.01592
N2723 G1 X159.249 Y198.277 E.08555
N2724 G1 X159.249 Y197.743 E.01592
N2725 G1 X161.812 Y200.305 E.10807
N2726 G1 X162.346 Y200.305 E.01592
N2727 G1 X159.249 Y197.209 E.13059
N2728 G1 X159.249 Y196.675 E.01593
N2729 G1 X162.88 Y200.305 E.15311
N2730 G1 X163.413 Y200.305 E.01592
N2731 G1 X159.249 Y196.141 E.17563
N2732 G1 X159.249 Y195.607 E.01592
N2733 G1 X163.947 Y200.305 E.19815
N2734 G1 X164.481 Y200.305 E.01592
N2735 G1 X159.249 Y195.073 E.22067
N2736 G1 X159.249 Y194.539 E.01592
N2737 G1 X165.015 Y200.305 E.24319
N2738 G1 X165.549 Y200.305 E.01592
N2739 G1 X159.249 Y194.005 E.26572
N2740 G1 X159.249 Y193.472 E.01592
N2741 G1 X166.083 Y200.305 E.28824
N2742 G1 X166.617 Y200.305 E.01593
N2743 G1 X159.249 Y192.938 E.31076
N2744 G1 X159.249 Y192.404 E.01592
N2745 G1 X167.151 Y200.305 E.33328
N2746 G1 X167.685 Y200.305 E.01592
N2747 G1 X159.249 Y191.87 E.3558
N2748 G1 X159.249 Y191.336 E.01592
N2749 G1 X168.219 Y200.305 E.37832
N2750 G1 X168.753 Y200.305 E.01592
N2751 G1 X159.249 Y190.802 E.40084
N2752 G1 X159.249 Y190.268 E.01592
N2753 G1 X169.287 Y200.305 E.42336
N2754 G1 X169.821 Y200.305 E.01592
N2755 G1 X159.249 Y189.734 E.44588
N2756 G1 X159.249 Y189.2 E.01592
N2757 G1 X170.355 Y200.305 E.46841
N2758 G1 X170.889 Y200.305 E.01592
N2759 M73 P31 R36
N2760 G1 X159.249 Y188.666 E.49093
N2761 G1 X159.249 Y188.132 E.01592
N2762 G1 X171.423 Y200.305 E.51345
N2763 G1 X171.957 Y200.305 E.01592
N2764 G1 X159.249 Y187.598 E.53597
N2765 G1 X159.249 Y187.064 E.01592
N2766 G1 X172.491 Y200.305 E.55849
N2767 G1 X173.025 Y200.305 E.01592
N2768 G1 X159.249 Y186.53 E.58101
N2769 G1 X159.249 Y185.996 E.01592
N2770 G1 X173.559 Y200.305 E.60353
N2771 G1 X174.092 Y200.305 E.01592
N2772 G1 X159.249 Y185.462 E.62605
N2773 G1 X159.249 Y184.928 E.01592
N2774 G1 X174.626 Y200.305 E.64857
N2775 G1 X175.16 Y200.305 E.01592
N2776 G1 X159.249 Y184.394 E.6711
N2777 G1 X159.249 Y183.86 E.01592
N2778 G1 X175.694 Y200.305 E.69362
N2779 G1 X176.228 Y200.305 E.01592
N2780 G1 X159.249 Y183.326 E.71614
N2781 G1 X159.249 Y182.793 E.01592
N2782 G1 X176.762 Y200.305 E.73866
N2783 G1 X177.296 Y200.305 E.01592
N2784 G1 X159.249 Y182.259 E.76118
N2785 G1 X159.249 Y181.725 E.01592
N2786 G1 X177.83 Y200.305 E.7837
N2787 G1 X178.364 Y200.305 E.01592
N2788 G1 X159.249 Y181.191 E.80622
N2789 G1 X159.249 Y180.657 E.01592
N2790 G1 X178.898 Y200.305 E.82874
N2791 G1 X179.432 Y200.305 E.01592
N2792 G1 X159.249 Y180.123 E.85126
N2793 G1 X159.249 Y179.589 E.01592
N2794 G1 X179.966 Y200.305 E.87379
N2795 G1 X180.5 Y200.305 E.01592
N2796 G1 X159.249 Y179.055 E.89631
N2797 G1 X159.249 Y178.521 E.01592
N2798 G1 X181.034 Y200.305 E.91883
N2799 G1 X181.568 Y200.305 E.01592
N2800 G1 X159.249 Y177.987 E.94135
N2801 G1 X159.249 Y177.453 E.01592
N2802 G1 X182.102 Y200.305 E.96387
N2803 G1 X182.636 Y200.305 E.01592
N2804 G1 X159.249 Y176.919 E.98639
N2805 G1 X159.249 Y176.385 E.01592
N2806 G1 X183.17 Y200.305 E1.00891
N2807 G1 X183.704 Y200.305 E.01592
N2808 G1 X159.249 Y175.851 E1.03143
N2809 G1 X159.249 Y175.317 E.01592
N2810 G1 X184.238 Y200.305 E1.05395
N2811 G1 X184.772 Y200.305 E.01592
N2812 G1 X159.249 Y174.783 E1.07648
N2813 G1 X159.249 Y174.249 E.01593
N2814 G1 X185.305 Y200.305 E1.099
N2815 G1 X185.839 Y200.305 E.01592
N2816 G1 X159.249 Y173.715 E1.12152
N2817 G1 X159.249 Y173.181 E.01592
N2818 G1 X186.373 Y200.305 E1.14404
N2819 G1 X186.907 Y200.305 E.01592
N2820 G1 X159.249 Y172.647 E1.16656
N2821 G1 X159.249 Y172.113 E.01592
N2822 G1 X187.441 Y200.305 E1.18908
N2823 G1 X187.975 Y200.305 E.01592
N2824 G1 X159.249 Y171.58 E1.2116
N2825 G1 X159.249 Y171.046 E.01592
N2826 G1 X188.509 Y200.305 E1.23412
N2827 G1 X189.043 Y200.305 E.01593
N2828 G1 X159.249 Y170.512 E1.25664
N2829 G1 X159.249 Y169.978 E.01592
N2830 G1 X189.577 Y200.305 E1.27917
N2831 G1 X190.111 Y200.305 E.01592
N2832 G1 X159.249 Y169.444 E1.30169
N2833 G1 X159.249 Y168.91 E.01592
N2834 G1 X190.645 Y200.305 E1.32421
N2835 G1 X190.751 Y200.305 E.00315
N2836 G1 X190.751 Y199.877 E.01278
N2837 G1 X159.249 Y168.376 E1.32866
N2838 G1 X159.249 Y167.842 E.01592
N2839 G1 X190.751 Y199.343 E1.32866
N2840 G1 X190.751 Y198.809 E.01592
N2841 G1 X159.249 Y167.308 E1.32866
N2842 G1 X159.249 Y166.774 E.01592
N2843 G1 X190.751 Y198.275 E1.32866
N2844 G1 X190.751 Y197.741 E.01592
N2845 G1 X159.249 Y166.24 E1.32866
N2846 G1 X159.249 Y165.706 E.01592
N2847 G1 X190.751 Y197.207 E1.32866
N2848 G1 X190.751 Y196.673 E.01592
N2849 G1 X159.249 Y165.172 E1.32866
N2850 G1 X159.249 Y164.638 E.01592
N2851 G1 X190.751 Y196.139 E1.32866
N2852 G1 X190.751 Y195.605 E.01592
N2853 G1 X159.249 Y164.104 E1.32866
N2854 G1 X159.249 Y163.57 E.01592
N2855 G1 X190.751 Y195.071 E1.32866
N2856 G1 X190.751 Y194.537 E.01592
N2857 M104 T0 S240 N0 ;Multi extruder pre heating
N2858 G1 X159.249 Y163.036 E1.32866
N2859 G1 X159.249 Y162.502 E.01592
N2860 G1 X190.751 Y194.003 E1.32866
N2861 G1 X190.751 Y193.47 E.01592
N2862 G1 X159.249 Y161.968 E1.32866
N2863 G1 X159.249 Y161.434 E.01592
N2864 G1 X190.751 Y192.936 E1.32866
N2865 G1 X190.751 Y192.402 E.01592
N2866 G1 X159.249 Y160.901 E1.32866
N2867 G1 X159.249 Y160.367 E.01592
N2868 G1 X190.751 Y191.868 E1.32866
N2869 G1 X190.751 Y191.334 E.01592
N2870 G1 X159.249 Y159.833 E1.32866
N2871 G1 X159.249 Y159.299 E.01592
N2872 G1 X190.751 Y190.8 E1.32866
N2873 G1 X190.751 Y190.266 E.01592
N2874 G1 X159.249 Y158.765 E1.32866
N2875 G1 X159.249 Y158.231 E.01592
N2876 G1 X190.751 Y189.732 E1.32866
N2877 G1 X190.751 Y189.198 E.01592
N2878 G1 X159.249 Y157.697 E1.32866
N2879 G1 X159.249 Y157.163 E.01592
N2880 G1 X190.751 Y188.664 E1.32866
N2881 G1 X190.751 Y188.13 E.01592
N2882 G1 X159.249 Y156.629 E1.32866
N2883 G1 X159.249 Y156.095 E.01592
N2884 G1 X190.751 Y187.596 E1.32866
N2885 G1 X190.751 Y187.062 E.01592
N2886 G1 X159.249 Y155.561 E1.32866
N2887 G1 X159.249 Y155.027 E.01592
N2888 G1 X190.751 Y186.528 E1.32866
N2889 G1 X190.751 Y185.994 E.01592
N2890 G1 X159.249 Y154.493 E1.32866
N2891 G1 X159.249 Y153.959 E.01592
N2892 G1 X190.751 Y185.46 E1.32866
N2893 G1 X190.751 Y184.926 E.01592
N2894 G1 X159.249 Y153.425 E1.32866
N2895 G1 X159.249 Y152.891 E.01592
N2896 G1 X190.751 Y184.392 E1.32866
N2897 G1 X190.751 Y183.858 E.01592
N2898 M73 P32 R36
N2899 G1 X159.249 Y152.357 E1.32866
N2900 G1 X159.249 Y151.823 E.01592
N2901 G1 X190.751 Y183.324 E1.32866
N2902 G1 X190.751 Y182.791 E.01592
N2903 G1 X159.249 Y151.289 E1.32866
N2904 G1 X159.249 Y150.755 E.01592
N2905 G1 X190.751 Y182.257 E1.32866
N2906 G1 X190.751 Y181.723 E.01592
N2907 G1 X159.249 Y150.222 E1.32866
N2908 G1 X159.249 Y149.688 E.01592
N2909 G1 X190.751 Y181.189 E1.32866
N2910 G1 X190.751 Y180.655 E.01592
N2911 G1 X159.249 Y149.154 E1.32866
N2912 G1 X159.249 Y148.62 E.01592
N2913 G1 X190.751 Y180.121 E1.32866
N2914 G1 X190.751 Y179.587 E.01592
N2915 G1 X159.249 Y148.086 E1.32866
N2916 G1 X159.249 Y147.552 E.01592
N2917 G1 X190.751 Y179.053 E1.32866
N2918 G1 X190.751 Y178.519 E.01593
N2919 G1 X159.249 Y147.018 E1.32866
N2920 G1 X159.249 Y146.484 E.01592
N2921 G1 X190.751 Y177.985 E1.32866
N2922 G1 X190.751 Y177.451 E.01592
N2923 G1 X159.249 Y145.95 E1.32866
N2924 G1 X159.249 Y145.416 E.01592
N2925 G1 X190.751 Y176.917 E1.32866
N2926 G1 X190.751 Y176.383 E.01592
N2927 G1 X159.249 Y144.882 E1.32866
N2928 G1 X159.249 Y144.348 E.01592
N2929 G1 X190.751 Y175.849 E1.32866
N2930 G1 X190.751 Y175.315 E.01592
N2931 G1 X159.249 Y143.814 E1.32866
N2932 G1 X159.249 Y143.28 E.01592
N2933 G1 X190.751 Y174.781 E1.32866
N2934 G1 X190.751 Y174.247 E.01592
N2935 G1 X159.249 Y142.746 E1.32866
N2936 G1 X159.249 Y142.212 E.01592
N2937 G1 X190.751 Y173.713 E1.32866
N2938 G1 X190.751 Y173.179 E.01592
N2939 G1 X159.249 Y141.678 E1.32866
N2940 G1 X159.249 Y141.144 E.01592
N2941 G1 X190.751 Y172.645 E1.32866
N2942 G1 X190.751 Y172.112 E.01592
N2943 G1 X159.249 Y140.61 E1.32866
N2944 G1 X159.249 Y140.076 E.01593
N2945 G1 X190.751 Y171.578 E1.32866
N2946 G1 X190.751 Y171.044 E.01592
N2947 G1 X159.249 Y139.543 E1.32866
N2948 G1 X159.249 Y139.009 E.01592
N2949 G1 X190.751 Y170.51 E1.32866
N2950 G1 X190.751 Y169.976 E.01592
N2951 G1 X159.249 Y138.475 E1.32866
N2952 G1 X159.249 Y137.941 E.01592
N2953 G1 X190.751 Y169.442 E1.32866
N2954 G1 X190.751 Y168.908 E.01592
N2955 G1 X159.249 Y137.407 E1.32866
N2956 G1 X159.249 Y136.873 E.01592
N2957 G1 X190.751 Y168.374 E1.32866
N2958 G1 X190.751 Y167.84 E.01592
N2959 G1 X159.249 Y136.339 E1.32866
N2960 G1 X159.249 Y135.805 E.01592
N2961 G1 X190.751 Y167.306 E1.32866
N2962 G1 X190.751 Y166.772 E.01592
N2963 G1 X159.249 Y135.271 E1.32866
N2964 G1 X159.249 Y134.737 E.01592
N2965 G1 X190.751 Y166.238 E1.32866
N2966 G1 X190.751 Y165.704 E.01592
N2967 G1 X159.249 Y134.203 E1.32866
N2968 G1 X159.249 Y133.669 E.01592
N2969 G1 X190.751 Y165.17 E1.32866
N2970 G1 X190.751 Y164.636 E.01592
N2971 M73 P32 R35
N2972 G1 X159.249 Y133.135 E1.32866
N2973 G1 X159.249 Y132.601 E.01592
N2974 G1 X190.751 Y164.102 E1.32866
N2975 G1 X190.751 Y163.568 E.01592
N2976 G1 X159.249 Y132.067 E1.32866
N2977 G1 X159.249 Y131.533 E.01592
N2978 G1 X190.751 Y163.034 E1.32866
N2979 G1 X190.751 Y162.5 E.01592
N2980 G1 X159.249 Y130.999 E1.32866
N2981 G1 X159.249 Y130.465 E.01592
N2982 G1 X190.751 Y161.966 E1.32866
N2983 G1 X190.751 Y161.432 E.01592
N2984 G1 X159.249 Y129.931 E1.32866
N2985 G1 X159.249 Y129.397 E.01592
N2986 G1 X190.751 Y160.899 E1.32866
N2987 G1 X190.751 Y160.365 E.01592
N2988 G1 X159.249 Y128.863 E1.32866
N2989 G1 X159.249 Y128.33 E.01592
N2990 G1 X190.751 Y159.831 E1.32866
N2991 G1 X190.751 Y159.297 E.01592
N2992 G1 X159.249 Y127.796 E1.32866
N2993 G1 X159.249 Y127.37 E.0127
N2994 G1 X159.357 Y127.37 E.00322
N2995 G1 X190.751 Y158.763 E1.3241
N2996 G1 X190.751 Y158.229 E.01592
N2997 G1 X159.891 Y127.37 E1.30158
N2998 G1 X160.425 Y127.37 E.01592
N2999 G1 X190.751 Y157.695 E1.27906
N3000 G1 X190.751 Y157.161 E.01592
N3001 G1 X160.959 Y127.37 E1.25654
N3002 G1 X161.493 Y127.37 E.01592
N3003 G1 X190.751 Y156.627 E1.23402
N3004 G1 X190.751 Y156.093 E.01593
N3005 G1 X162.027 Y127.37 E1.2115
N3006 G1 X162.561 Y127.37 E.01592
N3007 G1 X190.751 Y155.559 E1.18898
N3008 G1 X190.751 Y155.025 E.01592
N3009 G1 X163.095 Y127.37 E1.16646
N3010 G1 X163.629 Y127.37 E.01592
N3011 M73 P33 R35
N3012 G1 X190.751 Y154.491 E1.14394
N3013 G1 X190.751 Y153.957 E.01592
N3014 G1 X164.163 Y127.37 E1.12141
N3015 G1 X164.697 Y127.37 E.01592
N3016 G1 X190.751 Y153.423 E1.09889
N3017 G1 X190.751 Y152.889 E.01592
N3018 G1 X165.231 Y127.37 E1.07637
N3019 G1 X165.765 Y127.37 E.01592
N3020 G1 X190.751 Y152.355 E1.05385
N3021 G1 X190.751 Y151.821 E.01592
N3022 G1 X166.299 Y127.37 E1.03133
N3023 G1 X166.833 Y127.37 E.01592
N3024 G1 X190.751 Y151.287 E1.00881
N3025 G1 X190.751 Y150.753 E.01592
N3026 G1 X167.367 Y127.37 E.98629
N3027 G1 X167.901 Y127.37 E.01592
N3028 G1 X190.751 Y150.22 E.96377
N3029 G1 X190.751 Y149.686 E.01592
N3030 G1 X168.435 Y127.37 E.94125
N3031 G1 X168.969 Y127.37 E.01592
N3032 G1 X190.751 Y149.152 E.91873
N3033 G1 X190.751 Y148.618 E.01592
N3034 G1 X169.503 Y127.37 E.8962
N3035 G1 X170.036 Y127.37 E.01593
N3036 G1 X190.751 Y148.084 E.87368
N3037 G1 X190.751 Y147.55 E.01592
N3038 G1 X170.57 Y127.37 E.85116
N3039 G1 X171.104 Y127.37 E.01592
N3040 G1 X190.751 Y147.016 E.82864
N3041 G1 X190.751 Y146.482 E.01592
N3042 G1 X171.638 Y127.37 E.80612
N3043 G1 X172.172 Y127.37 E.01592
N3044 G1 X190.751 Y145.948 E.7836
N3045 G1 X190.751 Y145.414 E.01592
N3046 G1 X172.706 Y127.37 E.76108
N3047 G1 X173.24 Y127.37 E.01592
N3048 G1 X190.751 Y144.88 E.73856
N3049 G1 X190.751 Y144.346 E.01593
N3050 G1 X173.774 Y127.37 E.71603
N3051 G1 X174.308 Y127.37 E.01592
N3052 G1 X190.751 Y143.812 E.69351
N3053 G1 X190.751 Y143.278 E.01592
N3054 G1 X174.842 Y127.37 E.67099
N3055 G1 X175.376 Y127.37 E.01592
N3056 G1 X190.751 Y142.744 E.64847
N3057 G1 X190.751 Y142.21 E.01592
N3058 G1 X175.91 Y127.37 E.62595
N3059 G1 X176.444 Y127.37 E.01592
N3060 G1 X190.751 Y141.676 E.60343
N3061 G1 X190.751 Y141.142 E.01592
N3062 G1 X176.978 Y127.37 E.58091
N3063 G1 X177.512 Y127.37 E.01592
N3064 G1 X190.751 Y140.608 E.55839
N3065 G1 X190.751 Y140.074 E.01592
N3066 G1 X178.046 Y127.37 E.53587
N3067 G1 X178.58 Y127.37 E.01592
N3068 G1 X190.751 Y139.541 E.51335
N3069 G1 X190.751 Y139.007 E.01592
N3070 G1 X179.114 Y127.37 E.49082
N3071 G1 X179.648 Y127.37 E.01592
N3072 G1 X190.751 Y138.473 E.4683
N3073 G1 X190.751 Y137.939 E.01592
N3074 G1 X180.182 Y127.37 E.44578
N3075 G1 X180.715 Y127.37 E.01592
N3076 G1 X190.751 Y137.405 E.42326
N3077 G1 X190.751 Y136.871 E.01592
N3078 G1 X181.249 Y127.37 E.40074
N3079 G1 X181.783 Y127.37 E.01592
N3080 G1 X190.751 Y136.337 E.37822
N3081 G1 X190.751 Y135.803 E.01592
N3082 G1 X182.317 Y127.37 E.3557
N3083 G1 X182.851 Y127.37 E.01592
N3084 G1 X190.751 Y135.269 E.33318
N3085 G1 X190.751 Y134.735 E.01592
N3086 G1 X183.385 Y127.37 E.31066
N3087 G1 X183.919 Y127.37 E.01592
N3088 G1 X190.751 Y134.201 E.28813
N3089 G1 X190.751 Y133.667 E.01592
N3090 G1 X184.453 Y127.37 E.26561
N3091 G1 X184.987 Y127.37 E.01592
N3092 G1 X190.751 Y133.133 E.24309
N3093 G1 X190.751 Y132.599 E.01592
N3094 G1 X185.521 Y127.37 E.22057
N3095 G1 X186.055 Y127.37 E.01592
N3096 G1 X190.751 Y132.065 E.19805
N3097 G1 X190.751 Y131.531 E.01592
N3098 G1 X186.589 Y127.37 E.17553
N3099 G1 X187.123 Y127.37 E.01592
N3100 G1 X190.751 Y130.997 E.15301
N3101 G1 X190.751 Y130.463 E.01592
N3102 G1 X187.657 Y127.37 E.13049
N3103 G1 X188.191 Y127.37 E.01592
N3104 G1 X190.751 Y129.929 E.10797
N3105 G1 X190.751 Y129.395 E.01592
N3106 G1 X188.725 Y127.37 E.08544
N3107 G1 X189.259 Y127.37 E.01592
N3108 G1 X190.751 Y128.862 E.06292
N3109 G1 X190.751 Y128.328 E.01592
N3110 G1 X189.793 Y127.37 E.0404
N3111 G1 X190.327 Y127.37 E.01592
N3112 G1 X190.92 Y127.963 E.02504
N3113 ; WIPE_START
N3114 G1 X190.327 Y127.37 E-.31901
N3115 G1 X189.793 Y127.37 E-.2029
N3116 G1 X190.236 Y127.813 E-.23809
N3117 ; WIPE_END
N3118 G1 E-.04 F1800
N3119 M204 S10000
N3120 G17
N3121 G3 Z1 I1.217 J0 P1  F60000
N3122 ; stop printing object, unique label id: 229
N3123 M625
N3124 ; object ids of layer 3 start: 229,239
N3125 M624 AwAAAAAAAAA=
N3126 ;======== H2D 20250527========
N3127 ; SKIPPABLE_START
N3128 ; SKIPTYPE: timelapse
N3129 M622.1 S1 ; for prev firware, default turned on
N3130 
N3131 M1002 judge_flag timelapse_record_flag
N3132 
N3133 M622 J1
N3134 M993 A2 B2 C2
N3135 M993 A0 B0 C0
N3136 
N3137 
N3138 
N3139 
N3140     M9711 M0 E1 X260 Y141 Z1 S11 C10 O0 T3000
N3141 
N3142 
N3143 
N3144 M993 A3 B3 C3
N3145 
N3146 M623
N3147 ; SKIPPABLE_END
N3148 
N3149 ; object ids of this layer3 end: 229,239
N3150 M625
N3151 G1 X195.495 Y279.064
N3152 G1 Z.6
N3153 G1 E.8 F1800
N3154 ; LAYER_HEIGHT: 0.200000
N3155 ; FEATURE: Prime tower
N3156 ; LINE_WIDTH: 0.500000
N3157 ; WIPE_TOWER_START
N3158 M204 S10000
N3159 G1  X195.995 Y279.564  
N3160 M204 S8000
N3161 G3  X193.533 Y281.605   I-4.373 J-2.768 E0.1236 F3938
N3162 G3  X190.885 Y280.355   I0.012 J-3.454 E0.1149
N3163 G2  X188.182 Y279.564   I-2.709 J4.247 E0.1085
N3164 G2  X174.618 Y279.568   I-6.687 J357.435 E0.5155
N3165 G2  X170.683 Y281.445   I0.499 J6.110 E0.1694
N3166 G3  X168.371 Y281.015   I-0.854 J-1.838 E0.0953
N3167 G1  X166.995 Y279.564   E0.0760
N3168 G3  X165.064 Y277.242   I3.871 J-5.183 E0.1159
N3169 G3  X166.240 Y274.649   I2.902 J-0.247 E0.1130
N3170 G2  X166.995 Y272.245   I-3.465 J-2.409 E0.0972
N3171 G2  X166.992 Y259.212   I-321.195 J-6.431 E0.4954
N3172 G2  X165.146 Y255.634   I-6.663 J1.171 E0.1554
N3173 G3  X165.485 Y253.656   I1.658 J-0.734 E0.0808
N3174 G1  X168.371 Y250.613   E0.1594
N3175 G3  X171.793 Y251.056   I1.525 J1.652 E0.1495
N3176 G2  X174.808 Y252.064   I3.021 J-4.025 E0.1229
N3177 G2  X188.372 Y252.060   I6.687 J-357.435 E0.5155
N3178 G2  X192.307 Y250.183   I-0.499 J-6.110 E0.1694
N3179 G3  X194.619 Y250.613   I0.854 J1.838 E0.0953
N3180 G1  X195.609 Y251.657   E0.0547
N3181 G1 E-0.8000 F1800
N3182 M204 S10000
N3183 G1  X197.329 Y253.471   F600
N3184 G1 E0.8000 F1800
N3185 M204 S8000
N3186 G3  X196.957 Y256.707   I-1.339 J1.486 E0.1447 F3938
N3187 G2  X195.995 Y259.382   I3.254 J2.680 E0.1102
N3188 G2  X195.998 Y272.416   I321.212 J6.432 E0.4954
N3189 G2  X197.844 Y275.994   I6.663 J-1.171 E0.1554
N3190 G3  X197.504 Y277.972   I-1.658 J0.734 E0.0808
N3191 G1  X195.995 Y279.564   E0.0834
N3192 ; WIPE_TOWER_END
N3193 G1  X195.495 Y252.064  
N3194 ; LAYER_HEIGHT: 0.200000
N3195 ; FEATURE: Prime tower
N3196 ; LINE_WIDTH: 0.500000
N3197 ; WIPE_TOWER_START
N3198 M204 S8000
N3199 G1  X167.495  E1.0642
N3200 G1  Y272.314  E0.2565
N3201 G1  X195.495  E1.0642
N3202 G1  Y279.064  E0.2565
N3203 M204 S10000
N3204 G1  X168.495 Y272.314  
N3205 ;--------------------
N3206 ; CP EMPTY GRID START
N3207 ; layer #4
N3208 M204 S8000
N3209 G1  Y279.064  E0.2565
N3210 M204 S10000
N3211 G1  X177.162 
N3212 M204 S8000
N3213 G1  Y272.314  E0.2565
N3214 M204 S10000
N3215 G1  X185.828 
N3216 M204 S8000
N3217 G1  Y279.064  E0.2565
N3218 M204 S10000
N3219 G1  X194.495 
N3220 M204 S8000
N3221 G1  Y272.314  E0.2565
N3222 ; CP EMPTY GRID END
N3223 ;------------------
N3224 
N3225 
N3226 
N3227 
N3228 
N3229 
N3230 ; WIPE_TOWER_END
N3231 ; LAYER_HEIGHT: 0.200000
N3232 ; FEATURE: Prime tower
N3233 ; LINE_WIDTH: 0.500000
N3234 ;--------------------
N3235 ; CP TOOLCHANGE START
N3236 ; toolchange #3
N3237 ; material : TPU -> TPU
N3238 ;--------------------
N3239 M220 B
N3240 M220 S100
N3241 ; WIPE_TOWER_START
N3242 G1 E-.8 F1800
N3243 G17
N3244 G3 Z1 I1.217 J0 P1  F60000
N3245 G1 X167.745 Y266.314
N3246 G1 Z.6
N3247 G1 E.8 F1800
N3248 ; LAYER_HEIGHT: 0.200000
N3249 ; FEATURE: Prime tower
N3250 ; LINE_WIDTH: 1.000000
N3251 ; NOZZLE_CHANGE_START OF0 NF1
N3252 M204 S8000
N3253 G1  X195.245 Y266.314  E2.1885 F1881
N3254 G1  Y267.564  E0.0995
N3255 G1  X167.745  E2.1885
N3256 G1  Y268.814  E0.0995
N3257 G1  X195.245  E2.1885
N3258 G1  Y270.064  E0.0995
N3259 G1  X167.745  E2.1885
N3260 G1  Y271.314  E0.0995
N3261 G1  X195.245  E2.1885
N3262 ; NOZZLE_CHANGE_END OF0 NF1
N3263 M104 T1 S153 N0 ;Multi extruder pre cooling
N3264 
N3265 ; WIPE_START
N3266 G1 F5400
N3267 M204 S8000
N3268 G1 X193.245 Y271.314 E-1.9
N3269 ; WIPE_END
N3270 G1 E-.1 F1800
N3271 M204 S10000
N3272 G17
N3273 G3 Z1 I1.217 J0 P1  F5400
N3274 ; filament end gcode 
N3275 
N3276 ;======== H2D ========
N3277 ;===== 20250604 =====
N3278 M993 A2 B2 C2 ; nozzle cam detection allow status save.
N3279 M993 A0 B0 C0 ; nozzle cam detection not allowed.
N3280 
N3281 
N3282 M1015.4 S0 ; disable E air printing detect
N3283 
N3284 
N3285 M620 S1A
N3286 M1002 gcode_claim_action : 4
N3287 M204 S9000
N3288 
N3289 G1 Z3.6 F1200
N3290 
N3291 M400
N3292 M106 P1 S0
N3293 M106 P2 S0
N3294 
N3295 
N3296 
N3297 
N3298 M620.10 A0 F149.669 L0 H0.4 T270 P255 S1
N3299 
N3300 
N3301 
N3302 M620.10 A1 F79.8237 L0 H0.4 T250 P240 S1
N3303 
N3304 
N3305 
N3306 M620.11 P0 I0 E0
N3307 
N3308 
N3309 
N3310 M620.11 K1 I0 R10 F200
N3311 
N3312 
N3313 M628 S1
N3314 
N3315 
N3316 M620.11 S1 L0 I0 R10 D8 E-10 F200
N3317 
N3318 
N3319 M629
N3320 
N3321 
N3322 M620.11 H2 C331
N3323 
N3324 
N3325 T1
N3326 M73 E3
N3327 
N3328 ;deretract
N3329 
N3330 
N3331 
N3332 ; VFLUSH_START
N3333 
N3334 
N3335 ;VG1 E0 F79
N3336 
N3337 
N3338 SYNC T0
N3339 
N3340 ; VFLUSH_END
N3341 
N3342 M1002 set_filament_type:TPU
N3343 
N3344 M400
N3345 M83
N3346 
N3347 
N3348 
N3349 M628 S0
N3350 ;VM109 S240
N3351 M629
N3352 M400
N3353 
N3354 M983.3 F1.33333 A0.4
N3355 
N3356 
N3357 M400
N3358 
N3359 G1 Y320 F30000
N3360 G1 X201
N3361 
N3362 G1 Y295
N3363 G1 Y265 F18000
N3364 G1 Z3.6 F3000
N3365 
N3366 M204 S8000
N3367 
N3368 
N3369 M621 S1A
N3370 
N3371 M993 A3 B3 C3 ; nozzle cam detection allow status restore.
N3372 
N3373 
N3374 M1015.3 S1;enable tpu clog detect
N3375 
N3376 
N3377 
N3378 M1015.4 S0 ; disable E air printing detect
N3379 
N3380 
N3381 M620.6 I1 W1 ;enable ams air printing detect
N3382 M1002 gcode_claim_action : 0
N3383 M106 S255
N3384 M106 P2 S255
N3385 G1 X200 Y252.564 F60000
N3386 G1 Z.6
N3387 G1 X195.495 Y252.564 Z1
N3388 
N3389 ; filament start gcode
N3390 G1 Z.6
N3391 G1 E2 F1800
N3392 
N3393 G4 S0
N3394 ; CP TOOLCHANGE WIPE
N3395 ; LINE_WIDTH: 0.500000
N3396 M204 S8000
N3397 G1  X192.495 Y252.564  E0.1140 F1782
N3398 G1 E-0.8000 F1800
N3399 M204 S10000
N3400 G1  X196.995  F600
N3401 G1  X195.495  F240
N3402 G1  X195.995  F600
N3403 G1  Y253.064 
N3404 M73 P34 R35
N3405 G1  X194.995 
N3406 G1  Y252.064 
N3407 G1  X196.495 
N3408 G1  Y253.564 
N3409 G1  X194.495 
N3410 G1  Y251.564 
N3411 G1  X192.495 Y252.564   F1782
N3412 G1 E0.8000 F1800
N3413 M204 S8000
N3414 G1  X167.495  E0.9502 F1782
N3415 G1  Y253.314  E0.0285
N3416 G1  X195.495  E1.0642 F2025
N3417 G1  Y254.064  E0.0285
N3418 G1  X167.495  E1.0642 F2100
N3419 G1  Y254.814  E0.0285
N3420 G1  X195.495  E1.0642
N3421 G1  Y255.564  E0.0285
N3422 G1  X167.495  E1.0642
N3423 G1  Y256.314  E0.0285
N3424 G1  X195.495  E1.0642
N3425 G1  Y257.064  E0.0285
N3426 G1  X167.495  E1.0642
N3427 G1  Y257.814  E0.0285
N3428 G1  X195.495  E1.0642
N3429 G1  Y258.564  E0.0285
N3430 G1  X167.495  E1.0642
N3431 G1  Y259.314  E0.0285
N3432 G1  X195.495  E1.0642
N3433 G1  Y260.064  E0.0285
N3434 G1  X167.495  E1.0642
N3435 G1  Y260.814  E0.0285
N3436 G1  X195.495  E1.0642
N3437 G1  Y261.564  E0.0285
N3438 G1  X167.495  E1.0642
N3439 G1  Y262.314  E0.0285
N3440 G1  X195.495  E1.0642
N3441 G1  Y263.064  E0.0285
N3442 G1  X167.495  E1.0642
N3443 G1  Y263.814  E0.0285
N3444 G1  X195.495  E1.0642
N3445 G1  Y264.564  E0.0285
N3446 G1  X167.495  E1.0642
N3447 G1  Y265.314  E0.0285
N3448 G1  X195.495  E1.0642
N3449 ; WIPE_TOWER_END
N3450 M220 R
N3451 G1 F60000
N3452 G4 S0
N3453 G92 E0
N3454 ; CP TOOLCHANGE END
N3455 ;------------------
N3456 
N3457 
N3458 
N3459 ; WIPE_START
N3460 G1 F5400
N3461 M204 S8000
N3462 G1 X193.495 Y265.314 E-.76
N3463 ; WIPE_END
N3464 G1 E-.04 F1800
N3465 M204 S10000
N3466 G17
N3467 G3 Z1 I1.217 J0 P1  F60000
N3468 ; OBJECT_ID: 239
N3469 ; COOLING_NODE: 0
N3470 ; start printing object, unique label id: 239
N3471 M624 AgAAAAAAAAA=
N3472 G1 X182.34 Y118.735
N3473 G1 Z.6
N3474 G1 E.8 F1800
N3475 ; FEATURE: Outer wall
N3476 ; LINE_WIDTH: 0.42
N3477 ; LAYER_HEIGHT: 0.2
N3478 G1 F2545.881
N3479 M204 S5000
N3480 G1 X167.76 Y118.735 E.45715
N3481 G1 X167.76 Y118.155 E.01819
N3482 M73 P34 R34
N3483 G1 X182.34 Y118.155 E.45715
N3484 G1 X182.34 Y118.675 E.0163
N3485 M204 S10000
N3486 G1 X182.144 Y118.445 F60000
N3487 ; FEATURE: Gap infill
N3488 ; LINE_WIDTH: 0.23088
N3489 G1 F5107.47
N3490 M204 S8000
N3491 G1 X167.956 Y118.445 E.22174
N3492 ; CHANGE_LAYER
N3493 ; Z_HEIGHT: 0.8
N3494 ; LAYER_HEIGHT: 0.2
N3495 ; WIPE_START
N3496 G1 F5107.47
N3497 G1 X169.956 Y118.445 E-.76
N3498 ; WIPE_END
N3499 G1 E-.04 F1800
N3500 ; stop printing object, unique label id: 239
N3501 M625
N3502 ;======== H2D 20250521========
N3503 ; layer num/total_layer_count: 4/63
N3504 ; update layer progress
N3505 M73 L4
N3506 M991 S0 P3 ;notify layer change
N3507 
N3508 
N3509 ; OBJECT_ID: 239
N3510 ; COOLING_NODE: 0
N3511 ; start printing object, unique label id: 239
N3512 M624 AgAAAAAAAAA=
N3513 M204 S10000
N3514 G17
N3515 G3 Z1 I-.028 J1.217 P1  F60000
N3516 G1 X182.34 Y118.735 Z1
N3517 G1 Z.8
N3518 G1 E.8 F1800
N3519 ; FEATURE: Outer wall
N3520 ; LINE_WIDTH: 0.42
N3521 ; LAYER_HEIGHT: 0.2
N3522 G1 F2545.881
N3523 M204 S5000
N3524 G1 X167.76 Y118.735 E.45715
N3525 G1 X167.76 Y118.155 E.01819
N3526 G1 X182.34 Y118.155 E.45715
N3527 G1 X182.34 Y118.675 E.0163
N3528 M204 S10000
N3529 G1 X182.144 Y118.445 F60000
N3530 ; FEATURE: Gap infill
N3531 ; LINE_WIDTH: 0.23088
N3532 G1 F5107.47
N3533 M204 S8000
N3534 G1 X167.956 Y118.445 E.22174
N3535 ; WIPE_START
N3536 G1 X169.956 Y118.445 E-.76
N3537 ; WIPE_END
N3538 G1 E-.04 F1800
N3539 ; stop printing object, unique label id: 239
N3540 M625
N3541 M204 S10000
N3542 G17
N3543 G3 Z1.2 I-1.217 J-.02 P1  F60000
N3544 G1 X167.495 Y265.564 Z1.2
N3545 G1 Z.8
N3546 G1 E.8 F1800
N3547 ; LAYER_HEIGHT: 0.200000
N3548 ; FEATURE: Prime tower
N3549 ; LINE_WIDTH: 0.500000
N3550 ; WIPE_TOWER_START
N3551 M204 S8000
N3552 G1  X167.495 Y260.064  E0.2090 F2100
N3553 G1  X195.495  E1.0642
N3554 G1  Y265.564  E0.2090
N3555 G1  X167.495  E1.0642
N3556 M204 S10000
N3557 G1  X168.495 Y260.064  
N3558 ;--------------------
N3559 ; CP EMPTY GRID START
N3560 ; layer #5
N3561 M204 S8000
N3562 G1  Y265.564  E0.2090
N3563 M204 S10000
N3564 G1  X177.162 
N3565 M204 S8000
N3566 G1  Y260.064  E0.2090
N3567 M204 S10000
N3568 G1  X185.828 
N3569 M204 S8000
N3570 G1  Y265.564  E0.2090
N3571 M204 S10000
N3572 G1  X194.495 
N3573 M204 S8000
N3574 G1  Y260.064  E0.2090
N3575 ; CP EMPTY GRID END
N3576 ;------------------
N3577 
N3578 
N3579 
N3580 
N3581 
N3582 
N3583 ; WIPE_TOWER_END
N3584 ; LAYER_HEIGHT: 0.200000
N3585 ; FEATURE: Prime tower
N3586 ; LINE_WIDTH: 0.500000
N3587 ;--------------------
N3588 ; CP TOOLCHANGE START
N3589 ; toolchange #4
N3590 ; material : PCTG -> PCTG
N3591 ;--------------------
N3592 M220 B
N3593 M220 S100
N3594 ; WIPE_TOWER_START
N3595 G1 E-.8 F1800
N3596 G17
N3597 G3 Z1.2 I1.217 J0 P1  F60000
N3598 G1 X167.745 Y252.814 Z.8
N3599 G1 E.8 F1800
N3600 ; LAYER_HEIGHT: 0.200000
N3601 ; FEATURE: Prime tower
N3602 ; LINE_WIDTH: 1.000000
N3603 ; NOZZLE_CHANGE_START OF1 NF0
N3604 M104 T0 S210 N0 ;Multi extruder pre cooling in post extrusion
N3605 M204 S8000
N3606 G1  X195.245 Y252.814  E2.1885 F251
N3607 G1  Y254.314  E0.1194
N3608 G1  X167.745  E2.1885
N3609 G1  Y255.814  E0.1194
N3610 G1  X195.245  E2.1885
N3611 G1  Y257.314  E0.1194
N3612 M104 T1 S255 N0 ;Multi extruder pre heating
N3613 M73 P35 R34
N3614 G1  X167.745  E2.1885
N3615 G1  Y258.814  E0.1194
N3616 G1  X195.245  E2.1885
N3617 M204 S10000
N3618 G1  Y259.814 
N3619 G1  X168.245  F398
N3620 G1  Y258.314 
N3621 G1  X194.745 
N3622 G1  Y256.814 
N3623 G1  X168.245 
N3624 G1  Y255.314 
N3625 M73 P36 R34
N3626 G1  X194.745 
N3627 G1  Y253.814 
N3628 G1  X168.245 
N3629 ; NOZZLE_CHANGE_END OF1 NF0
N3630 M104 T0 S112 N0 ;Multi extruder pre cooling
N3631 
N3632 G1 E-2 F1800
N3633 G17
N3634 G3 Z1.2 I1.217 J0 P1  F5400
N3635 ; filament end gcode 
N3636 
N3637 ;======== H2D ========
N3638 ;===== 20250604 =====
N3639 M993 A2 B2 C2 ; nozzle cam detection allow status save.
N3640 M993 A0 B0 C0 ; nozzle cam detection not allowed.
N3641 
N3642 
N3643 M1015.4 S0 ; disable E air printing detect
N3644 
N3645 
N3646 M620 S0A
N3647 M1002 gcode_claim_action : 4
N3648 M204 S9000
N3649 
N3650 G1 Z3.8 F1200
N3651 
N3652 M400
N3653 M106 P1 S0
N3654 M106 P2 S0
N3655 
N3656 
N3657 
N3658 
N3659 M620.10 A0 F79.8237 L0 H0.4 T250 P240 S1
N3660 
N3661 
N3662 
N3663 M620.10 A1 F149.669 L0 H0.4 T270 P255 S1
N3664 
N3665 
N3666 
N3667 M620.11 P0 I1 E0
N3668 
N3669 
N3670 
N3671 M620.11 K1 I1 R0 F200
N3672 
N3673 
N3674 M628 S1
N3675 
N3676 M620.11 S0 L0 I1 E-10 F200
N3677 
N3678 M629
N3679 
N3680 
N3681 M620.11 H2 C331
N3682 
N3683 
N3684 T0
N3685 M73 E2
N3686 
N3687 ;deretract
N3688 
N3689 
N3690 M73 P36 R33
N3691 ;VG1 E4 F200
N3692 ;VG1 E4 F100
N3693 
N3694 
N3695 
N3696 ; VFLUSH_START
N3697 
N3698 
N3699 ;VG1 E0 F79
N3700 
N3701 
N3702 SYNC T0
N3703 
N3704 ; VFLUSH_END
N3705 
N3706 M1002 set_filament_type:PCTG
N3707 
N3708 M400
N3709 M83
N3710 
N3711 
N3712 
N3713 M628 S0
N3714 ;VM109 S255
N3715 M629
N3716 M400
N3717 
N3718 M983.3 F2.5 A0.4
N3719 
N3720 
N3721 M400
N3722 
N3723 G1 Y320 F30000
N3724 G1 X201
N3725 
N3726 G1 Y295
N3727 G1 Y265 F18000
N3728 G1 Z3.8 F3000
N3729 
N3730 M204 S8000
N3731 
N3732 
N3733 M621 S0A
N3734 
N3735 M993 A3 B3 C3 ; nozzle cam detection allow status restore.
N3736 
N3737 
N3738 M1015.3 S0;disable tpu clog detect
N3739 
N3740 
N3741 
N3742 M1015.4 S0 ; disable E air printing detect
N3743 
N3744 
N3745 M620.6 I0 W1 ;enable ams air printing detect
N3746 M1002 gcode_claim_action : 0
N3747 M106 S25.5
N3748 M106 P2 S0
N3749 G1 X200 Y265.364 F60000
N3750 G1 Z.8
N3751 G1 X200 Y272.996 Z1.2
N3752 G1 X200 Y283.638 Z1.2
N3753 G1 X162.991 Y283.638
N3754 G1 X162.991 Y278.814
N3755 G1 X167.495 Y278.814
N3756 
N3757 ; filament start gcode
N3758 G1 Z.8
N3759 G1 E2 F1800
N3760 
N3761 G4 S0
N3762 ; CP TOOLCHANGE WIPE
N3763 ; LINE_WIDTH: 0.500000
N3764 M204 S8000
N3765 G1  X170.495 Y278.814  E0.1140 F1782
N3766 G1 E-0.8000 F1800
N3767 M204 S10000
N3768 G1  X165.995  F600
N3769 G1  X167.495  F240
N3770 G1  X167.995  F600
N3771 G1  Y279.314 
N3772 G1  X166.995 
N3773 G1  Y278.314 
N3774 G1  X168.495 
N3775 G1  Y279.814 
N3776 G1  X166.495 
N3777 G1  Y277.814 
N3778 G1  X170.495 Y278.814   F1782
N3779 G1 E0.8000 F1800
N3780 M204 S8000
N3781 G1  X195.495  E0.9502 F1782
N3782 G1  Y278.064  E0.0285
N3783 G1  X167.495  E1.0642 F2025
N3784 G1  Y277.314  E0.0285
N3785 G1  X195.495  E1.0642 F2473
N3786 G1  Y276.564  E0.0285
N3787 G1  X167.495  E1.0642 F3938
N3788 G1  Y275.814  E0.0285
N3789 G1  X195.495  E1.0642
N3790 G1  Y275.064  E0.0285
N3791 G1  X167.495  E1.0642
N3792 G1  Y274.314  E0.0285
N3793 G1  X195.495  E1.0642
N3794 G1  Y273.564  E0.0285
N3795 G1  X167.495  E1.0642
N3796 G1  Y272.814  E0.0285
N3797 G1  X195.495  E1.0642
N3798 G1  Y272.064  E0.0285
N3799 G1  X167.495  E1.0642
N3800 G1  Y271.314  E0.0285
N3801 M73 P37 R33
N3802 G1  X195.495  E1.0642
N3803 G1  Y270.564  E0.0285
N3804 G1  X167.495  E1.0642
N3805 G1  Y269.814  E0.0285
N3806 G1  X195.495  E1.0642
N3807 G1  Y269.064  E0.0285
N3808 G1  X167.495  E1.0642
N3809 G1  Y268.314  E0.0285
N3810 G1  X195.495  E1.0642
N3811 G1  Y267.564  E0.0285
N3812 G1  X167.495  E1.0642
N3813 G1  Y266.814  E0.0285
N3814 G1  X195.495  E1.0642
N3815 G1  Y266.064  E0.0285
N3816 G1  X167.495  E1.0642
N3817 ; WIPE_TOWER_END
N3818 M220 R
N3819 G1 F60000
N3820 G4 S0
N3821 G92 E0
N3822 ; CP TOOLCHANGE END
N3823 ;------------------
N3824 
N3825 
N3826 G1  Y252.064  
N3827 ; LAYER_HEIGHT: 0.200000
N3828 ; FEATURE: Prime tower
N3829 ; LINE_WIDTH: 0.500000
N3830 ; WIPE_TOWER_START
N3831 M204 S10000
N3832 G1  X168.371 Y281.015  
N3833 M204 S8000
N3834 G1  X167.144 Y279.721   E0.0678 F3938
N3835 G1 E-0.8000 F1800
N3836 M204 S10000
N3837 G1  X165.426 Y277.905   F600
N3838 G1 E0.8000 F1800
N3839 M204 S8000
N3840 G3  X166.033 Y274.920   I1.593 J-1.230 E0.1313 F3938
N3841 G2  X166.995 Y272.245   I-3.254 J-2.680 E0.1102
N3842 G2  X166.992 Y259.212   I-321.195 J-6.431 E0.4954
N3843 G2  X165.146 Y255.634   I-6.663 J1.171 E0.1554
N3844 G3  X165.485 Y253.656   I1.658 J-0.734 E0.0808
N3845 G3  X168.604 Y250.403   I19.398 J15.476 E0.1715
N3846 G3  X171.793 Y251.056   I1.276 J1.879 E0.1379
N3847 G2  X174.808 Y252.064   I3.021 J-4.025 E0.1229
N3848 G2  X188.372 Y252.060   I6.687 J-357.435 E0.5155
N3849 G2  X192.307 Y250.183   I-0.499 J-6.110 E0.1694
N3850 G3  X194.619 Y250.613   I0.854 J1.838 E0.0953
N3851 G1  X195.995 Y252.064   E0.0760
N3852 G1 E0.0000
N3853 G3  X197.926 Y254.386   I-3.871 J5.182 E0.1159
N3854 G3  X196.750 Y256.979   I-2.902 J0.247 E0.1130
N3855 G2  X195.995 Y259.382   I3.464 J2.409 E0.0972
N3856 G2  X195.998 Y272.416   I321.212 J6.432 E0.4954
N3857 G2  X197.844 Y275.994   I6.663 J-1.171 E0.1554
N3858 G3  X197.504 Y277.972   I-1.658 J0.734 E0.0808
N3859 G1  X195.995 Y279.564   E0.0834
N3860 G3  X193.533 Y281.605   I-4.373 J-2.768 E0.1236
N3861 G3  X190.885 Y280.355   I0.012 J-3.454 E0.1149
N3862 G2  X188.182 Y279.564   I-2.709 J4.247 E0.1085
N3863 G2  X174.618 Y279.568   I-6.687 J357.435 E0.5155
N3864 G2  X170.683 Y281.445   I0.499 J6.110 E0.1694
N3865 G3  X168.371 Y281.015   I-0.854 J-1.838 E0.0953
N3866 ; WIPE_TOWER_END
N3867 
N3868 ; WIPE_START
N3869 G1 F5107.47
N3870 M204 S8000
N3871 G1 X168.484 Y281.125 E-.05968
N3872 G1 X168.604 Y281.225 E-.05967
N3873 G1 X168.733 Y281.316 E-.05968
N3874 G1 X168.868 Y281.396 E-.05968
N3875 G1 X169.008 Y281.466 E-.05967
N3876 G1 X169.154 Y281.524 E-.05967
N3877 G1 X169.304 Y281.571 E-.05967
N3878 G1 X169.457 Y281.605 E-.05968
N3879 G1 X169.613 Y281.628 E-.05967
N3880 G1 X169.769 Y281.638 E-.05968
N3881 G1 X169.927 Y281.636 E-.05968
N3882 G1 X170.083 Y281.622 E-.05967
N3883 G1 X170.197 Y281.603 E-.04391
N3884 ; WIPE_END
N3885 G1 E-.04 F1800
N3886 M204 S10000
N3887 G17
N3888 G3 Z1.2 I1.217 J0 P1  F60000
N3889 ; OBJECT_ID: 229
N3890 ; COOLING_NODE: 0
N3891 ; start printing object, unique label id: 229
N3892 M624 AQAAAAAAAAA=
N3893 G1 X191.084 Y200.639 Z.8
N3894 G1 E.8 F1800
N3895 ; FEATURE: Inner wall
N3896 ; LINE_WIDTH: 0.45
N3897 ; LAYER_HEIGHT: 0.2
N3898 G1 F4421.739
N3899 M204 S8000
N3900 G1 X158.916 Y200.639 E1.03439
N3901 G1 X158.916 Y127.036 E2.36678
N3902 G1 X191.084 Y127.036 E1.03439
N3903 G1 X191.084 Y200.579 E2.36485
N3904 ; COOLING_NODE: 0
N3905 M204 S10000
N3906 G1 X191.491 Y201.046 F60000
N3907 G1 F4421.739
N3908 M204 S8000
N3909 G1 X158.509 Y201.046 E1.06057
N3910 G1 X158.509 Y126.629 E2.39296
N3911 G1 X191.491 Y126.629 E1.06057
N3912 G1 X191.491 Y200.986 E2.39103
N3913 ; COOLING_NODE: 0
N3914 M204 S10000
N3915 G1 X191.898 Y201.453 F60000
N3916 G1 F4421.739
N3917 M204 S8000
N3918 G1 X158.102 Y201.453 E1.08675
N3919 G1 X158.102 Y126.222 E2.41914
N3920 G1 X191.898 Y126.222 E1.08675
N3921 G1 X191.898 Y201.393 E2.41721
N3922 ; COOLING_NODE: 0
N3923 M204 S10000
N3924 G1 X192.29 Y201.845 F60000
N3925 ; FEATURE: Outer wall
N3926 ; LINE_WIDTH: 0.42
N3927 G1 F4773.528
N3928 M204 S5000
N3929 G1 X157.71 Y201.845 E1.03002
N3930 G1 X157.71 Y125.83 E2.26421
N3931 G1 X192.29 Y125.83 E1.03002
N3932 G1 X192.29 Y201.785 E2.26243
N3933 G1 E-.8 F1800
N3934 M204 S10000
N3935 G1 X184.677 Y201.239 Z1.2 F60000
N3936 G1 X171.447 Y200.29 Z1.2
N3937 G1 Z.8
N3938 G1 E.8 F1800
N3939 ; FEATURE: Sparse infill
N3940 ; LINE_WIDTH: 0.45
N3941 G1 F4421.739
N3942 M204 S8000
N3943 G1 X173.076 Y200.29 E.05236
N3944 G1 X190.736 Y134.383 E2.19411
N3945 G1 X190.736 Y132.717 E.05356
N3946 G1 X185.403 Y127.385 E.2425
N3947 G1 X184.182 Y127.385 E.03927
N3948 G1 X164.647 Y200.29 E2.42708
N3949 G1 X163.019 Y200.29 E.05236
N3950 M204 S10000
N3951 G1 X159.264 Y190.549 F60000
N3952 G1 F4421.739
N3953 M204 S8000
N3954 G1 X159.264 Y188.921 E.05236
N3955 G1 X175.753 Y127.385 E2.04859
N3956 G1 X173.889 Y127.385 E.05994
N3957 G1 X190.736 Y144.231 E.76611
N3958 G1 X190.736 Y143.349 E.02836
N3959 G1 X159.264 Y151.782 E1.0477
N3960 G1 X159.264 Y150.154 E.05236
N3961 M204 S10000
N3962 G1 X159.264 Y161.839 F60000
N3963 G1 F4421.739
N3964 M204 S8000
N3965 G1 X159.264 Y160.211 E.05236
N3966 G1 X190.736 Y151.778 E1.04769
N3967 G1 X190.736 Y155.745 E.12757
N3968 G1 X162.375 Y127.385 E1.28972
N3969 G1 X167.324 Y127.385 E.15915
N3970 G1 X159.264 Y157.464 E1.00137
N3971 G1 X159.264 Y158.816 E.04346
N3972 G1 X190.736 Y190.287 E1.43118
N3973 G1 X190.736 Y185.493 E.15415
N3974 G1 X159.264 Y193.926 E1.0477
N3975 G1 X159.264 Y193.358 E.01827
N3976 G1 X166.197 Y200.29 E.31526
N3977 G1 X166.969 Y200.29 E.02481
N3978 G1 X190.736 Y193.922 E.79122
N3979 G1 X190.736 Y197.296 E.1085
N3980 G1 X189.933 Y200.29 E.09968
N3981 G1 X189.225 Y200.29 E.02278
N3982 G1 X159.264 Y170.33 E1.36248
N3983 G1 X159.264 Y168.639 E.05436
N3984 G1 X190.736 Y160.207 E1.0477
N3985 G1 X190.736 Y165.839 E.18112
N3986 G1 X181.504 Y200.29 E1.1469
N3987 G1 X177.711 Y200.29 E.12198
N3988 G1 X159.264 Y181.844 E.83887
N3989 G1 X159.264 Y185.497 E.11748
N3990 G1 X190.736 Y177.064 E1.0477
N3991 G1 X190.736 Y178.773 E.05494
N3992 G1 X159.264 Y147.302 E1.43118
N3993 G1 X159.264 Y143.353 E.12698
N3994 G1 X190.736 Y134.92 E1.0477
N3995 M204 S10000
N3996 G1 X189.031 Y127.385 F60000
N3997 G1 F4421.739
N3998 M204 S8000
N3999 G1 X187.403 Y127.385 E.05236
N4000 G1 X159.264 Y134.924 E.93674
N4001 G1 X159.264 Y135.788 E.02777
N4002 G1 X190.736 Y167.259 E1.43118
N4003 G1 X190.736 Y168.636 E.04426
N4004 M104 T0 S240 N0 ;Multi extruder pre heating
N4005 G1 X159.264 Y177.068 E1.0477
N4006 G1 X159.264 Y175.44 E.05236
N4007 ; WIPE_START
N4008 G1 X159.264 Y177.068 E-.61876
N4009 G1 X159.623 Y176.972 E-.14124
N4010 ; WIPE_END
N4011 G1 E-.04 F1800
N4012 M204 S10000
N4013 G17
N4014 G3 Z1.2 I1.217 J0 P1  F60000
N4015 ; stop printing object, unique label id: 229
N4016 M625
N4017 ; object ids of layer 4 start: 229,239
N4018 M624 AwAAAAAAAAA=
N4019 ;======== H2D 20250527========
N4020 ; SKIPPABLE_START
N4021 ; SKIPTYPE: timelapse
N4022 M622.1 S1 ; for prev firware, default turned on
N4023 
N4024 M1002 judge_flag timelapse_record_flag
N4025 
N4026 M622 J1
N4027 M993 A2 B2 C2
N4028 M993 A0 B0 C0
N4029 
N4030 
N4031 
N4032 
N4033     M9711 M0 E1 X260 Y141 Z1.2 S11 C10 O0 T3000
N4034 
N4035 
N4036 
N4037 M993 A3 B3 C3
N4038 
N4039 M623
N4040 ; SKIPPABLE_END
N4041 
N4042 ; object ids of this layer4 end: 229,239
N4043 M625
N4044 ; CHANGE_LAYER
N4045 ; Z_HEIGHT: 1
N4046 ; LAYER_HEIGHT: 0.2
N4047 ;======== H2D 20250521========
N4048 ; layer num/total_layer_count: 5/63
N4049 ; update layer progress
N4050 M73 L5
N4051 M991 S0 P4 ;notify layer change
N4052 
N4053 
N4054 ; OBJECT_ID: 229
N4055 ; COOLING_NODE: 0
N4056 ; start printing object, unique label id: 229
N4057 M624 AQAAAAAAAAA=
N4058 G1 X191.084 Y200.639 F60000
N4059 G1 Z1
N4060 G1 E.8 F1800
N4061 ; FEATURE: Inner wall
N4062 ; LINE_WIDTH: 0.45
N4063 ; LAYER_HEIGHT: 0.2
N4064 G1 F4421.739
N4065 M204 S8000
N4066 M73 P38 R33
N4067 G1 X158.916 Y200.639 E1.03439
N4068 G1 X158.916 Y127.036 E2.36678
N4069 G1 X191.084 Y127.036 E1.03439
N4070 G1 X191.084 Y200.579 E2.36485
N4071 ; COOLING_NODE: 0
N4072 M204 S10000
N4073 G1 X191.491 Y201.046 F60000
N4074 G1 F4421.739
N4075 M204 S8000
N4076 G1 X158.509 Y201.046 E1.06057
N4077 G1 X158.509 Y126.629 E2.39296
N4078 G1 X191.491 Y126.629 E1.06057
N4079 G1 X191.491 Y200.986 E2.39103
N4080 ; COOLING_NODE: 0
N4081 M204 S10000
N4082 G1 X191.898 Y201.453 F60000
N4083 G1 F4421.739
N4084 M204 S8000
N4085 G1 X158.102 Y201.453 E1.08675
N4086 G1 X158.102 Y126.222 E2.41914
N4087 G1 X191.898 Y126.222 E1.08675
N4088 G1 X191.898 Y201.393 E2.41721
N4089 ; COOLING_NODE: 0
N4090 M204 S10000
N4091 G1 X192.29 Y201.845 F60000
N4092 ; FEATURE: Outer wall
N4093 ; LINE_WIDTH: 0.42
N4094 G1 F4773.528
N4095 M204 S5000
N4096 G1 X157.71 Y201.845 E1.03002
N4097 M73 P38 R32
N4098 G1 X157.71 Y125.83 E2.26421
N4099 G1 X192.29 Y125.83 E1.03002
N4100 G1 X192.29 Y201.785 E2.26243
N4101 G1 E-.8 F1800
N4102 M204 S10000
N4103 G1 X184.685 Y201.144 Z1.4 F60000
N4104 G1 X174.558 Y200.29 Z1.4
N4105 G1 Z1
N4106 G1 E.8 F1800
N4107 ; FEATURE: Sparse infill
N4108 ; LINE_WIDTH: 0.45
N4109 G1 F4421.739
N4110 M204 S8000
N4111 G1 X172.929 Y200.29 E.05236
N4112 G1 X190.736 Y133.836 E2.2123
N4113 G1 X190.736 Y132.517 E.04242
N4114 G1 X185.603 Y127.385 E.23341
N4115 G1 X184.035 Y127.385 E.05041
N4116 G1 X164.5 Y200.29 E2.42708
N4117 G1 X162.872 Y200.29 E.05236
N4118 M204 S10000
N4119 G1 X159.264 Y190.003 F60000
N4120 G1 F4421.739
N4121 M204 S8000
N4122 G1 X159.264 Y188.375 E.05236
N4123 G1 X175.607 Y127.385 E2.0304
N4124 G1 X174.089 Y127.385 E.0488
N4125 G1 X190.736 Y144.031 E.75702
N4126 G1 X190.736 Y143.496 E.01722
N4127 G1 X159.264 Y151.928 E1.0477
N4128 G1 X159.264 Y150.3 E.05236
N4129 M204 S10000
N4130 G1 X159.264 Y161.985 F60000
N4131 G1 F4421.739
N4132 M204 S8000
N4133 G1 X159.264 Y160.357 E.05236
N4134 G1 X190.736 Y151.924 E1.0477
N4135 G1 X190.736 Y155.545 E.11643
N4136 G1 X162.575 Y127.385 E1.28062
N4137 G1 X167.178 Y127.385 E.14801
N4138 G1 X159.264 Y156.918 E.98318
N4139 G1 X159.264 Y158.616 E.0546
N4140 G1 X190.736 Y190.087 E1.43118
N4141 G1 X190.736 Y185.64 E.14301
N4142 G1 X159.264 Y194.072 E1.0477
N4143 G1 X159.264 Y193.158 E.02941
N4144 G1 X166.397 Y200.29 E.32436
N4145 G1 X167.515 Y200.29 E.03595
N4146 G1 X190.736 Y194.068 E.77303
N4147 G1 X190.736 Y196.75 E.08622
N4148 G1 X189.787 Y200.29 E.11787
N4149 G1 X189.425 Y200.29 E.01164
N4150 G1 X159.264 Y170.13 E1.37158
N4151 G1 X159.264 Y168.786 E.04322
N4152 G1 X190.736 Y160.353 E1.0477
N4153 G1 X190.736 Y165.293 E.15885
N4154 G1 X181.358 Y200.29 E1.16509
N4155 G1 X177.911 Y200.29 E.11085
N4156 G1 X159.264 Y181.644 E.84797
N4157 G1 X159.264 Y185.643 E.12861
N4158 G1 X190.736 Y177.211 E1.0477
N4159 G1 X190.736 Y178.573 E.0438
N4160 G1 X159.264 Y147.102 E1.43118
N4161 G1 X159.264 Y143.499 E.11584
N4162 G1 X190.736 Y135.067 E1.0477
N4163 M204 S10000
N4164 G1 X189.577 Y127.385 F60000
N4165 G1 F4421.739
N4166 M204 S8000
N4167 G1 X187.949 Y127.385 E.05236
N4168 G1 X159.264 Y135.071 E.95493
N4169 G1 X159.264 Y135.588 E.01664
N4170 G1 X190.736 Y167.059 E1.43118
N4171 G1 X190.736 Y168.782 E.0554
N4172 G1 X159.264 Y177.215 E1.0477
N4173 G1 X159.264 Y175.586 E.05236
N4174 ; WIPE_START
N4175 G1 X159.264 Y177.215 E-.61876
N4176 G1 X159.623 Y177.118 E-.14124
N4177 ; WIPE_END
N4178 G1 E-.04 F1800
N4179 M204 S10000
N4180 G17
N4181 G3 Z1.4 I1.217 J0 P1  F60000
N4182 ; stop printing object, unique label id: 229
N4183 M625
N4184 ; object ids of layer 5 start: 229,239
N4185 M624 AwAAAAAAAAA=
N4186 ;======== H2D 20250527========
N4187 ; SKIPPABLE_START
N4188 ; SKIPTYPE: timelapse
N4189 M622.1 S1 ; for prev firware, default turned on
N4190 
N4191 M1002 judge_flag timelapse_record_flag
N4192 
N4193 M622 J1
N4194 M993 A2 B2 C2
N4195 M993 A0 B0 C0
N4196 
N4197 
N4198 
N4199 
N4200     M9711 M0 E1 X260 Y141 Z1.4 S11 C10 O0 T3000
N4201 
N4202 
N4203 
N4204 M993 A3 B3 C3
N4205 
N4206 M623
N4207 ; SKIPPABLE_END
N4208 
N4209 ; object ids of this layer5 end: 229,239
N4210 M625
N4211 G1 X167.495 Y279.064
N4212 G1 Z1
N4213 G1 E.8 F1800
N4214 ; LAYER_HEIGHT: 0.200000
N4215 ; FEATURE: Prime tower
N4216 ; LINE_WIDTH: 0.500000
N4217 ; WIPE_TOWER_START
N4218 M204 S10000
N4219 G1  X166.995 Y279.564  
N4220 M204 S8000
N4221 G3  X165.064 Y277.242   I3.871 J-5.183 E0.1159 F3938
N4222 G3  X166.240 Y274.649   I2.902 J-0.247 E0.1130
N4223 G2  X166.995 Y272.245   I-3.465 J-2.409 E0.0972
N4224 G2  X166.992 Y259.212   I-321.195 J-6.431 E0.4954
N4225 G2  X165.146 Y255.634   I-6.663 J1.171 E0.1554
N4226 G3  X165.661 Y253.471   I1.721 J-0.733 E0.0905
N4227 G1 E-0.8000 F1800
N4228 M204 S10000
N4229 G1  X167.381 Y251.657   F600
N4230 G1 E0.8000 F1800
N4231 M204 S8000
N4232 G3  X170.238 Y250.033   I2.765 J1.539 E0.1313 F3938
N4233 G3  X172.775 Y251.633   I-12.405 J22.473 E0.1141
N4234 G2  X174.808 Y252.064   I2.042 J-4.626 E0.0796
N4235 G2  X188.372 Y252.060   I6.687 J-357.435 E0.5155
N4236 G2  X192.307 Y250.183   I-0.499 J-6.110 E0.1694
N4237 G3  X194.619 Y250.613   I0.854 J1.838 E0.0953
N4238 G1  X195.995 Y252.064   E0.0760
N4239 G1 E0.0000
N4240 G3  X197.926 Y254.386   I-3.871 J5.182 E0.1159
N4241 G3  X196.750 Y256.979   I-2.902 J0.247 E0.1130
N4242 G2  X195.995 Y259.382   I3.464 J2.409 E0.0972
N4243 G2  X195.998 Y272.416   I321.212 J6.432 E0.4954
N4244 G2  X197.844 Y275.994   I6.663 J-1.171 E0.1554
N4245 G3  X197.504 Y277.972   I-1.658 J0.734 E0.0808
N4246 G1  X195.995 Y279.564   E0.0834
N4247 G3  X193.533 Y281.605   I-4.373 J-2.768 E0.1236
N4248 G3  X190.885 Y280.355   I0.012 J-3.454 E0.1149
N4249 G2  X188.182 Y279.564   I-2.709 J4.247 E0.1085
N4250 G2  X174.618 Y279.568   I-6.687 J357.435 E0.5155
N4251 G2  X170.683 Y281.445   I0.499 J6.110 E0.1694
N4252 G3  X168.371 Y281.015   I-0.854 J-1.838 E0.0953
N4253 G1  X166.995 Y279.564   E0.0760
N4254 ; WIPE_TOWER_END
N4255 G1  X167.495 Y252.064  
N4256 ; LAYER_HEIGHT: 0.200000
N4257 ; FEATURE: Prime tower
N4258 ; LINE_WIDTH: 0.500000
N4259 ; WIPE_TOWER_START
N4260 M204 S8000
N4261 G1  Y272.314  E0.2565
N4262 G1  X195.495  E1.0642
N4263 G1  Y279.064  E0.2565
N4264 G1  X167.495  E1.0642
N4265 M204 S10000
N4266 G1  X168.495 Y272.314  
N4267 ;--------------------
N4268 ; CP EMPTY GRID START
N4269 ; layer #6
N4270 M204 S8000
N4271 G1  Y279.064  E0.2565
N4272 M204 S10000
N4273 G1  X177.162 
N4274 M204 S8000
N4275 G1  Y272.314  E0.2565
N4276 M204 S10000
N4277 G1  X185.828 
N4278 M204 S8000
N4279 G1  Y279.064  E0.2565
N4280 M204 S10000
N4281 G1  X194.495 
N4282 M204 S8000
N4283 G1  Y272.314  E0.2565
N4284 ; CP EMPTY GRID END
N4285 ;------------------
N4286 
N4287 
N4288 
N4289 
N4290 
N4291 
N4292 ; WIPE_TOWER_END
N4293 ; LAYER_HEIGHT: 0.200000
N4294 ; FEATURE: Prime tower
N4295 ; LINE_WIDTH: 0.500000
N4296 ;--------------------
N4297 ; CP TOOLCHANGE START
N4298 ; toolchange #5
N4299 ; material : TPU -> TPU
N4300 ;--------------------
N4301 M220 B
N4302 M220 S100
N4303 ; WIPE_TOWER_START
N4304 G1 E-.8 F1800
N4305 G17
N4306 G3 Z1.4 I1.217 J0 P1  F60000
N4307 G1 X167.745 Y266.314
N4308 G1 Z1
N4309 G1 E.8 F1800
N4310 ; LAYER_HEIGHT: 0.200000
N4311 ; FEATURE: Prime tower
N4312 ; LINE_WIDTH: 1.000000
N4313 ; NOZZLE_CHANGE_START OF0 NF1
N4314 M204 S8000
N4315 G1  X195.245 Y266.314  E2.1885 F1881
N4316 G1  Y267.564  E0.0995
N4317 G1  X167.745  E2.1885
N4318 G1  Y268.814  E0.0995
N4319 G1  X195.245  E2.1885
N4320 G1  Y270.064  E0.0995
N4321 M73 P39 R32
N4322 G1  X167.745  E2.1885
N4323 G1  Y271.314  E0.0995
N4324 G1  X195.245  E2.1885
N4325 ; NOZZLE_CHANGE_END OF0 NF1
N4326 M104 T1 S161 N0 ;Multi extruder pre cooling
N4327 
N4328 ; WIPE_START
N4329 G1 F5400
N4330 M204 S8000
N4331 G1 X193.245 Y271.314 E-1.9
N4332 ; WIPE_END
N4333 G1 E-.1 F1800
N4334 M204 S10000
N4335 G17
N4336 G3 Z1.4 I1.217 J0 P1  F5400
N4337 ; filament end gcode 
N4338 
N4339 ;======== H2D ========
N4340 ;===== 20250604 =====
N4341 M993 A2 B2 C2 ; nozzle cam detection allow status save.
N4342 M993 A0 B0 C0 ; nozzle cam detection not allowed.
N4343 
N4344 
N4345 M1015.4 S0 ; disable E air printing detect
N4346 
N4347 
N4348 M620 S1A
N4349 M1002 gcode_claim_action : 4
N4350 M204 S9000
N4351 
N4352 G1 Z4 F1200
N4353 
N4354 M400
N4355 M106 P1 S0
N4356 M106 P2 S0
N4357 
N4358 
N4359 
N4360 
N4361 M620.10 A0 F149.669 L0 H0.4 T270 P255 S1
N4362 
N4363 
N4364 
N4365 M620.10 A1 F79.8237 L0 H0.4 T250 P240 S1
N4366 
N4367 
N4368 
N4369 M620.11 P0 I0 E0
N4370 
N4371 
N4372 
N4373 M620.11 K1 I0 R10 F200
N4374 
N4375 
N4376 M628 S1
N4377 
N4378 
N4379 M620.11 S1 L0 I0 R10 D8 E-10 F200
N4380 
N4381 
N4382 M629
N4383 
N4384 
N4385 M620.11 H2 C331
N4386 
N4387 
N4388 T1
N4389 M73 E1
N4390 
N4391 ;deretract
N4392 
N4393 
N4394 
N4395 ; VFLUSH_START
N4396 
N4397 
N4398 ;VG1 E0 F79
N4399 
N4400 
N4401 SYNC T0
N4402 
N4403 ; VFLUSH_END
N4404 
N4405 M1002 set_filament_type:TPU
N4406 
N4407 M400
N4408 M83
N4409 
N4410 
N4411 
N4412 M628 S0
N4413 ;VM109 S240
N4414 M629
N4415 M400
N4416 
N4417 M983.3 F1.33333 A0.4
N4418 
N4419 
N4420 M400
N4421 
N4422 G1 Y320 F30000
N4423 G1 X201
N4424 
N4425 G1 Y295
N4426 G1 Y265 F18000
N4427 G1 Z4 F3000
N4428 
N4429 M204 S8000
N4430 
N4431 
N4432 M621 S1A
N4433 
N4434 M993 A3 B3 C3 ; nozzle cam detection allow status restore.
N4435 
N4436 
N4437 M1015.3 S1;enable tpu clog detect
N4438 
N4439 
N4440 
N4441 M1015.4 S0 ; disable E air printing detect
N4442 
N4443 
N4444 M620.6 I1 W1 ;enable ams air printing detect
N4445 M1002 gcode_claim_action : 0
N4446 M106 S255
N4447 M106 P2 S255
N4448 G1 X200 Y264.673 F60000
N4449 G1 Z1
N4450 G1 X200 Y257.04 Z1.4
N4451 G1 X200 Y247.99 Z1.4
N4452 G1 X162.991 Y247.99
N4453 G1 X162.991 Y252.564
N4454 G1 X167.495 Y252.564
N4455 
N4456 ; filament start gcode
N4457 G1 Z1
N4458 G1 E2 F1800
N4459 
N4460 G4 S0
N4461 ; CP TOOLCHANGE WIPE
N4462 ; LINE_WIDTH: 0.500000
N4463 M204 S8000
N4464 G1  X170.495 Y252.564  E0.1140 F1782
N4465 G1 E-0.8000 F1800
N4466 M204 S10000
N4467 G1  X165.995  F600
N4468 G1  X167.495  F240
N4469 G1  X167.995  F600
N4470 G1  Y253.064 
N4471 G1  X166.995 
N4472 G1  Y252.064 
N4473 G1  X168.495 
N4474 G1  Y253.564 
N4475 G1  X166.495 
N4476 G1  Y251.564 
N4477 G1  X170.495 Y252.564   F1782
N4478 G1 E0.8000 F1800
N4479 M204 S8000
N4480 G1  X195.495  E0.9502 F1782
N4481 G1  Y253.314  E0.0285
N4482 G1  X167.495  E1.0642 F2025
N4483 G1  Y254.064  E0.0285
N4484 G1  X195.495  E1.0642 F2100
N4485 G1  Y254.814  E0.0285
N4486 G1  X167.495  E1.0642
N4487 G1  Y255.564  E0.0285
N4488 G1  X195.495  E1.0642
N4489 G1  Y256.314  E0.0285
N4490 G1  X167.495  E1.0642
N4491 G1  Y257.064  E0.0285
N4492 G1  X195.495  E1.0642
N4493 G1  Y257.814  E0.0285
N4494 G1  X167.495  E1.0642
N4495 G1  Y258.564  E0.0285
N4496 G1  X195.495  E1.0642
N4497 G1  Y259.314  E0.0285
N4498 G1  X167.495  E1.0642
N4499 G1  Y260.064  E0.0285
N4500 G1  X195.495  E1.0642
N4501 G1  Y260.814  E0.0285
N4502 G1  X167.495  E1.0642
N4503 G1  Y261.564  E0.0285
N4504 G1  X195.495  E1.0642
N4505 G1  Y262.314  E0.0285
N4506 G1  X167.495  E1.0642
N4507 G1  Y263.064  E0.0285
N4508 G1  X195.495  E1.0642
N4509 G1  Y263.814  E0.0285
N4510 G1  X167.495  E1.0642
N4511 G1  Y264.564  E0.0285
N4512 G1  X195.495  E1.0642
N4513 G1  Y265.314  E0.0285
N4514 G1  X167.495  E1.0642
N4515 ; WIPE_TOWER_END
N4516 M220 R
N4517 G1 F60000
N4518 G4 S0
N4519 G92 E0
N4520 ; CP TOOLCHANGE END
N4521 ;------------------
N4522 
N4523 
N4524 
N4525 ; WIPE_START
N4526 G1 F5400
N4527 M204 S8000
N4528 G1 X169.495 Y265.314 E-.76
N4529 ; WIPE_END
N4530 G1 E-.04 F1800
N4531 M204 S10000
N4532 G17
N4533 G3 Z1.4 I1.217 J0 P1  F60000
N4534 ; OBJECT_ID: 239
N4535 ; COOLING_NODE: 0
N4536 ; start printing object, unique label id: 239
N4537 M624 AgAAAAAAAAA=
N4538 G1 X182.34 Y118.735
N4539 G1 Z1
N4540 G1 E.8 F1800
N4541 ; FEATURE: Outer wall
N4542 ; LINE_WIDTH: 0.42
N4543 ; LAYER_HEIGHT: 0.2
N4544 G1 F2545.881
N4545 M204 S5000
N4546 G1 X167.76 Y118.735 E.45715
N4547 G1 X167.76 Y118.155 E.01819
N4548 G1 X182.34 Y118.155 E.45715
N4549 G1 X182.34 Y118.675 E.0163
N4550 M204 S10000
N4551 G1 X182.144 Y118.445 F60000
N4552 ; FEATURE: Gap infill
N4553 ; LINE_WIDTH: 0.23088
N4554 G1 F5107.47
N4555 M204 S8000
N4556 G1 X167.956 Y118.445 E.22174
N4557 ; CHANGE_LAYER
N4558 ; Z_HEIGHT: 1.2
N4559 ; LAYER_HEIGHT: 0.2
N4560 ; WIPE_START
N4561 G1 F5107.47
N4562 G1 X169.956 Y118.445 E-.76
N4563 ; WIPE_END
N4564 G1 E-.04 F1800
N4565 ; stop printing object, unique label id: 239
N4566 M625
N4567 ;======== H2D 20250521========
N4568 ; layer num/total_layer_count: 6/63
N4569 ; update layer progress
N4570 M73 L6
N4571 M991 S0 P5 ;notify layer change
N4572 
N4573 
N4574 ; LAYER_HEIGHT: 0.200000
N4575 ; FEATURE: Prime tower
N4576 ; LINE_WIDTH: 0.500000
N4577 ;--------------------
N4578 ; CP TOOLCHANGE START
N4579 ; toolchange #6
N4580 ; material : PCTG -> PCTG
N4581 ;--------------------
N4582 M220 B
N4583 M220 S100
N4584 ; WIPE_TOWER_START
N4585 M204 S10000
N4586 G17
N4587 G3 Z1.4 I1.217 J0 P1  F60000
N4588 G1 X169.337 Y156.052
N4589 G1 X167.745 Y252.814
N4590 G1 Z1.2
N4591 G1 E.8 F1800
N4592 ; LAYER_HEIGHT: 0.200000
N4593 ; FEATURE: Prime tower
N4594 ; LINE_WIDTH: 1.000000
N4595 ; NOZZLE_CHANGE_START OF1 NF0
N4596 M104 T0 S210 N0 ;Multi extruder pre cooling in post extrusion
N4597 M204 S8000
N4598 G1  X195.245 Y252.814  E2.1885 F251
N4599 G1  Y254.314  E0.1194
N4600 G1  X167.745  E2.1885
N4601 G1  Y255.814  E0.1194
N4602 M73 P40 R32
N4603 G1  X195.245  E2.1885
N4604 G1  Y257.314  E0.1194
N4605 M104 T1 S255 N0 ;Multi extruder pre heating
N4606 M73 P40 R31
N4607 G1  X167.745  E2.1885
N4608 G1  Y258.814  E0.1194
N4609 G1  X195.245  E2.1885
N4610 M204 S10000
N4611 G1  Y259.814 
N4612 G1  X168.245  F398
N4613 G1  Y258.314 
N4614 G1  X194.745 
N4615 G1  Y256.814 
N4616 M73 P41 R31
N4617 G1  X168.245 
N4618 G1  Y255.314 
N4619 G1  X194.745 
N4620 G1  Y253.814 
N4621 G1  X168.245 
N4622 ; NOZZLE_CHANGE_END OF1 NF0
N4623 M104 T0 S0 N0 ;Multi extruder pre cooling
N4624 
N4625 G1 E-2 F1800
N4626 G17
N4627 G3 Z1.6 I1.217 J0 P1  F5400
N4628 ; filament end gcode 
N4629 
N4630 ;======== H2D ========
N4631 ;===== 20250604 =====
N4632 M993 A2 B2 C2 ; nozzle cam detection allow status save.
N4633 M993 A0 B0 C0 ; nozzle cam detection not allowed.
N4634 
N4635 
N4636 M1015.4 S0 ; disable E air printing detect
N4637 
N4638 
N4639 M620 S0A
N4640 M1002 gcode_claim_action : 4
N4641 M204 S9000
N4642 
N4643 G1 Z4.2 F1200
N4644 
N4645 M400
N4646 M106 P1 S0
N4647 M106 P2 S0
N4648 
N4649 
N4650 
N4651 
N4652 M620.10 A0 F79.8237 L0 H0.4 T250 P240 S1
N4653 
N4654 
N4655 
N4656 M620.10 A1 F149.669 L0 H0.4 T270 P255 S1
N4657 
N4658 
N4659 
N4660 M620.11 P0 I1 E0
N4661 
N4662 
N4663 
N4664 M620.11 K1 I1 R0 F200
N4665 
N4666 
N4667 M628 S1
N4668 
N4669 M620.11 S0 L0 I1 E-10 F200
N4670 
N4671 M629
N4672 
N4673 
N4674 M620.11 H2 C331
N4675 
N4676 
N4677 T0
N4678 M73 E0
N4679 
N4680 ;deretract
N4681 
N4682 
N4683 ;VG1 E4 F200
N4684 ;VG1 E4 F100
N4685 
N4686 
N4687 
N4688 ; VFLUSH_START
N4689 
N4690 
N4691 ;VG1 E0 F79
N4692 
N4693 
N4694 SYNC T0
N4695 
N4696 ; VFLUSH_END
N4697 
N4698 M1002 set_filament_type:PCTG
N4699 
N4700 M400
N4701 M83
N4702 
N4703 
N4704 
N4705 M628 S0
N4706 ;VM109 S255
N4707 M629
N4708 M400
N4709 
N4710 M983.3 F2.5 A0.4
N4711 
N4712 
N4713 M400
N4714 
N4715 G1 Y320 F30000
N4716 G1 X201
N4717 
N4718 G1 Y295
N4719 G1 Y265 F18000
N4720 G1 Z4.2 F3000
N4721 
N4722 M204 S8000
N4723 
N4724 
N4725 M621 S0A
N4726 
N4727 M993 A3 B3 C3 ; nozzle cam detection allow status restore.
N4728 
N4729 
N4730 M1015.3 S0;disable tpu clog detect
N4731 
N4732 
N4733 
N4734 M1015.4 S0 ; disable E air printing detect
N4735 
N4736 
N4737 M620.6 I0 W1 ;enable ams air printing detect
N4738 M1002 gcode_claim_action : 0
N4739 M106 S25.5
N4740 M106 P2 S0
N4741 G1 X200 Y278.814 F60000
N4742 G1 Z1.2
N4743 G1 X195.495 Y278.814 Z1.6
N4744 
N4745 ; filament start gcode
N4746 G1 Z1.2
N4747 G1 E2 F1800
N4748 
N4749 G4 S0
N4750 ; CP TOOLCHANGE WIPE
N4751 ; LINE_WIDTH: 0.500000
N4752 M204 S8000
N4753 G1  X192.495 Y278.814  E0.1140 F1782
N4754 G1 E-0.8000 F1800
N4755 M204 S10000
N4756 G1  X196.995  F600
N4757 G1  X195.495  F240
N4758 G1  X195.995  F600
N4759 G1  Y279.314 
N4760 G1  X194.995 
N4761 G1  Y278.314 
N4762 G1  X196.495 
N4763 G1  Y279.814 
N4764 G1  X194.495 
N4765 G1  Y277.814 
N4766 G1  X192.495 Y278.814   F1782
N4767 G1 E0.8000 F1800
N4768 M204 S8000
N4769 M73 P42 R31
N4770 G1  X167.495  E0.9502 F1782
N4771 G1  Y278.064  E0.0285
N4772 M73 P42 R30
N4773 G1  X195.495  E1.0642 F2025
N4774 G1  Y277.314  E0.0285
N4775 G1  X167.495  E1.0642 F2473
N4776 G1  Y276.564  E0.0285
N4777 G1  X195.495  E1.0642 F3938
N4778 G1  Y275.814  E0.0285
N4779 G1  X167.495  E1.0642
N4780 G1  Y275.064  E0.0285
N4781 G1  X195.495  E1.0642
N4782 G1  Y274.314  E0.0285
N4783 G1  X167.495  E1.0642
N4784 G1  Y273.564  E0.0285
N4785 G1  X195.495  E1.0642
N4786 G1  Y272.814  E0.0285
N4787 G1  X167.495  E1.0642
N4788 G1  Y272.064  E0.0285
N4789 G1  X195.495  E1.0642
N4790 G1  Y271.314  E0.0285
N4791 G1  X167.495  E1.0642
N4792 G1  Y270.564  E0.0285
N4793 G1  X195.495  E1.0642
N4794 G1  Y269.814  E0.0285
N4795 G1  X167.495  E1.0642
N4796 G1  Y269.064  E0.0285
N4797 G1  X195.495  E1.0642
N4798 G1  Y268.314  E0.0285
N4799 G1  X167.495  E1.0642
N4800 G1  Y267.564  E0.0285
N4801 G1  X195.495  E1.0642
N4802 G1  Y266.814  E0.0285
N4803 G1  X167.495  E1.0642
N4804 G1  Y266.064  E0.0285
N4805 G1  X195.495  E1.0642
N4806 ; WIPE_TOWER_END
N4807 M220 R
N4808 G1 F60000
N4809 G4 S0
N4810 G92 E0
N4811 ; CP TOOLCHANGE END
N4812 ;------------------
N4813 
N4814 
N4815 G1  Y252.064  
N4816 ; LAYER_HEIGHT: 0.200000
N4817 ; FEATURE: Prime tower
N4818 ; LINE_WIDTH: 0.500000
N4819 ; WIPE_TOWER_START
N4820 M204 S10000
N4821 G1  X195.846 Y279.721  
N4822 M204 S8000
N4823 G3  X193.064 Y281.636   I-3.469 J-2.060 E0.1325 F3938
N4824 G3  X190.723 Y280.255   I1.448 J-5.129 E0.1045
N4825 G2  X188.182 Y279.564   I-2.568 J4.426 E0.1012
N4826 G2  X174.618 Y279.568   I-6.687 J357.435 E0.5155
N4827 G2  X170.683 Y281.445   I0.499 J6.110 E0.1694
N4828 G3  X168.371 Y281.015   I-0.854 J-1.838 E0.0953
N4829 G1  X166.995 Y279.564   E0.0760
N4830 G3  X165.064 Y277.242   I3.871 J-5.183 E0.1159
N4831 G3  X166.240 Y274.649   I2.902 J-0.247 E0.1130
N4832 G2  X166.995 Y272.245   I-3.465 J-2.409 E0.0972
N4833 G2  X166.992 Y259.212   I-321.195 J-6.431 E0.4954
N4834 G2  X165.146 Y255.634   I-6.663 J1.171 E0.1554
N4835 G3  X165.485 Y253.656   I1.658 J-0.734 E0.0808
N4836 G1  X168.371 Y250.613   E0.1594
N4837 G3  X171.793 Y251.056   I1.525 J1.652 E0.1495
N4838 G2  X174.808 Y252.064   I3.021 J-4.025 E0.1229
N4839 G2  X188.372 Y252.060   I6.687 J-357.435 E0.5155
N4840 G2  X192.307 Y250.183   I-0.499 J-6.110 E0.1694
N4841 G3  X194.619 Y250.613   I0.854 J1.838 E0.0953
N4842 G1  X195.995 Y252.064   E0.0760
N4843 G3  X197.926 Y254.386   I-3.871 J5.182 E0.1159
N4844 G3  X196.750 Y256.979   I-2.902 J0.247 E0.1130
N4845 G2  X195.995 Y259.382   I3.464 J2.409 E0.0972
N4846 G2  X195.998 Y272.416   I321.212 J6.432 E0.4954
N4847 G2  X197.844 Y275.994   I6.663 J-1.171 E0.1554
N4848 G3  X197.564 Y277.905   I-1.654 J0.733 E0.0774
N4849 ; WIPE_TOWER_END
N4850 
N4851 ; WIPE_START
N4852 G1 F5107.47
N4853 M204 S8000
N4854 G1 X197.598 Y277.866 E-.01975
N4855 G1 X197.683 Y277.752 E-.0539
N4856 G1 X197.759 Y277.632 E-.05389
N4857 G1 X197.825 Y277.506 E-.0539
N4858 G1 X197.88 Y277.376 E-.0539
N4859 G1 X197.926 Y277.242 E-.05389
N4860 G1 X197.961 Y277.104 E-.0539
N4861 G1 X197.985 Y276.964 E-.05389
N4862 G1 X197.998 Y276.823 E-.0539
N4863 G1 X198 Y276.681 E-.05389
N4864 G1 X197.99 Y276.54 E-.05389
N4865 G1 X197.97 Y276.4 E-.05389
N4866 G1 X197.938 Y276.261 E-.0539
N4867 G1 X197.896 Y276.126 E-.05389
N4868 G1 X197.858 Y276.029 E-.03963
N4869 ; WIPE_END
N4870 G1 E-.04 F1800
N4871 M204 S10000
N4872 G17
N4873 G3 Z1.6 I1.217 J0 P1  F60000
N4874 ; OBJECT_ID: 229
N4875 ; COOLING_NODE: 0
N4876 ; start printing object, unique label id: 229
N4877 M624 AQAAAAAAAAA=
N4878 G1 X191.084 Y200.639 Z1.2
N4879 G1 E.8 F1800
N4880 ; FEATURE: Inner wall
N4881 ; LINE_WIDTH: 0.45
N4882 ; LAYER_HEIGHT: 0.2
N4883 G1 F4421.739
N4884 M204 S8000
N4885 G1 X158.916 Y200.639 E1.03439
N4886 G1 X158.916 Y127.036 E2.36678
N4887 G1 X191.084 Y127.036 E1.03439
N4888 G1 X191.084 Y200.579 E2.36485
N4889 ; COOLING_NODE: 0
N4890 M204 S10000
N4891 G1 X191.491 Y201.046 F60000
N4892 G1 F4421.739
N4893 M204 S8000
N4894 G1 X158.509 Y201.046 E1.06057
N4895 G1 X158.509 Y126.629 E2.39296
N4896 G1 X191.491 Y126.629 E1.06057
N4897 G1 X191.491 Y200.986 E2.39103
N4898 ; COOLING_NODE: 0
N4899 M204 S10000
N4900 G1 X191.898 Y201.453 F60000
N4901 G1 F4421.739
N4902 M204 S8000
N4903 G1 X158.102 Y201.453 E1.08675
N4904 G1 X158.102 Y126.222 E2.41914
N4905 G1 X191.898 Y126.222 E1.08675
N4906 G1 X191.898 Y201.393 E2.41721
N4907 ; COOLING_NODE: 0
N4908 M204 S10000
N4909 G1 X192.29 Y201.845 F60000
N4910 ; FEATURE: Outer wall
N4911 ; LINE_WIDTH: 0.42
N4912 G1 F4773.528
N4913 M204 S5000
N4914 G1 X157.71 Y201.845 E1.03002
N4915 G1 X157.71 Y125.83 E2.26421
N4916 G1 X192.29 Y125.83 E1.03002
N4917 G1 X192.29 Y201.785 E2.26243
N4918 G1 E-.8 F1800
N4919 M204 S10000
N4920 G1 X184.684 Y201.149 Z1.6 F60000
N4921 G1 X174.411 Y200.29 Z1.6
N4922 G1 Z1.2
N4923 G1 E.8 F1800
N4924 ; FEATURE: Sparse infill
N4925 ; LINE_WIDTH: 0.45
N4926 G1 F4421.739
N4927 M204 S8000
N4928 G1 X172.783 Y200.29 E.05236
N4929 G1 X190.736 Y133.29 E2.23049
N4930 G1 X190.736 Y132.317 E.03128
N4931 G1 X185.803 Y127.385 E.22431
N4932 G1 X183.889 Y127.385 E.06154
N4933 G1 X164.354 Y200.29 E2.42708
N4934 G1 X162.726 Y200.29 E.05236
N4935 M204 S10000
N4936 G1 X159.264 Y162.132 F60000
N4937 G1 F4421.739
N4938 M204 S8000
N4939 G1 X159.264 Y160.503 E.05236
N4940 G1 X190.736 Y152.071 E1.0477
N4941 G1 X190.736 Y155.345 E.10529
N4942 G1 X162.775 Y127.385 E1.27153
N4943 G1 X167.031 Y127.385 E.13687
N4944 G1 X159.264 Y156.372 E.96499
N4945 G1 X159.264 Y158.416 E.06574
N4946 G1 X190.736 Y189.887 E1.43118
N4947 G1 X190.736 Y185.786 E.13187
N4948 G1 X159.264 Y194.219 E1.0477
N4949 G1 X159.264 Y192.958 E.04055
N4950 G1 X166.597 Y200.29 E.33345
N4951 G1 X168.061 Y200.29 E.04709
N4952 G1 X190.736 Y194.215 E.75484
N4953 G1 X190.736 Y196.203 E.06394
N4954 G1 X189.64 Y200.29 E.13606
N4955 G1 X159.264 Y169.93 E1.38102
N4956 G1 X159.264 Y168.932 E.03208
N4957 G1 X190.736 Y160.5 E1.0477
N4958 G1 X190.736 Y164.747 E.13657
N4959 G1 X181.212 Y200.29 E1.18328
N4960 G1 X178.111 Y200.29 E.09971
N4961 G1 X159.264 Y181.444 E.85706
N4962 G1 X159.264 Y177.361 E.13129
N4963 G1 X190.736 Y168.928 E1.0477
N4964 G1 X190.736 Y166.859 E.06654
N4965 G1 X159.264 Y135.388 E1.43118
N4966 G1 X159.264 Y135.217 E.0055
N4967 M73 P43 R30
N4968 G1 X188.495 Y127.385 E.97312
N4969 G1 X190.124 Y127.385 E.05236
N4970 M204 S10000
N4971 G1 X190.736 Y136.842 F60000
N4972 G1 F4421.739
N4973 M204 S8000
N4974 G1 X190.736 Y135.213 E.05236
N4975 G1 X159.264 Y143.646 E1.0477
N4976 G1 X159.264 Y146.902 E.1047
N4977 G1 X190.736 Y178.373 E1.43118
N4978 G1 X190.736 Y177.357 E.03267
N4979 G1 X159.264 Y185.79 E1.04769
N4980 G1 X159.264 Y184.162 E.05236
N4981 M204 S10000
N4982 G1 X159.264 Y189.457 F60000
N4983 G1 F4421.739
N4984 M204 S8000
N4985 G1 X159.264 Y187.828 E.05236
N4986 G1 X175.46 Y127.385 E2.01221
N4987 G1 X174.289 Y127.385 E.03766
N4988 G1 X190.736 Y143.831 E.74792
N4989 G1 X190.736 Y143.642 E.00608
N4990 G1 X159.264 Y152.075 E1.0477
N4991 G1 X159.264 Y150.446 E.05236
N4992 ; WIPE_START
N4993 G1 X159.264 Y152.075 E-.61876
N4994 G1 X159.623 Y151.978 E-.14124
N4995 ; WIPE_END
N4996 G1 E-.04 F1800
N4997 M204 S10000
N4998 G17
N4999 G3 Z1.6 I1.217 J0 P1  F60000
N5000 ; stop printing object, unique label id: 229
N5001 M625
N5002 ; object ids of layer 6 start: 229
N5003 M624 AQAAAAAAAAA=
N5004 ;======== H2D 20250527========
N5005 ; SKIPPABLE_START
N5006 ; SKIPTYPE: timelapse
N5007 M622.1 S1 ; for prev firware, default turned on
N5008 
N5009 M1002 judge_flag timelapse_record_flag
N5010 
N5011 M622 J1
N5012 M993 A2 B2 C2
N5013 M993 A0 B0 C0
N5014 
N5015 
N5016 
N5017 
N5018     M9711 M0 E1 X260 Y141 Z1.6 S11 C10 O0 T3000
N5019 
N5020 
N5021 
N5022 M993 A3 B3 C3
N5023 
N5024 M623
N5025 ; SKIPPABLE_END
N5026 
N5027 ; object ids of this layer6 end: 229
N5028 M625
N5029 ; CHANGE_LAYER
N5030 ; Z_HEIGHT: 1.4
N5031 ; LAYER_HEIGHT: 0.2
N5032 ;======== H2D 20250521========
N5033 ; layer num/total_layer_count: 7/63
N5034 ; update layer progress
N5035 M73 L7
N5036 M991 S0 P6 ;notify layer change
N5037 
N5038 
N5039 M106 S48.45
N5040 ; OBJECT_ID: 229
N5041 ; COOLING_NODE: 0
N5042 ; start printing object, unique label id: 229
N5043 M624 AQAAAAAAAAA=
N5044 G1 X191.084 Y200.639 F60000
N5045 G1 Z1.4
N5046 G1 E.8 F1800
N5047 ; FEATURE: Inner wall
N5048 ; LINE_WIDTH: 0.45
N5049 ; LAYER_HEIGHT: 0.2
N5050 G1 F4421.739
N5051 M204 S8000
N5052 G1 X158.916 Y200.639 E1.03439
N5053 G1 X158.916 Y127.036 E2.36678
N5054 G1 X191.084 Y127.036 E1.03439
N5055 G1 X191.084 Y200.579 E2.36485
N5056 ; COOLING_NODE: 0
N5057 M204 S10000
N5058 G1 X191.491 Y201.046 F60000
N5059 G1 F4421.739
N5060 M204 S8000
N5061 G1 X158.509 Y201.046 E1.06057
N5062 G1 X158.509 Y126.629 E2.39296
N5063 G1 X191.491 Y126.629 E1.06057
N5064 G1 X191.491 Y200.986 E2.39103
N5065 ; COOLING_NODE: 0
N5066 M204 S10000
N5067 G1 X191.898 Y201.453 F60000
N5068 G1 F4421.739
N5069 M204 S8000
N5070 G1 X158.102 Y201.453 E1.08675
N5071 G1 X158.102 Y126.222 E2.41914
N5072 G1 X191.898 Y126.222 E1.08675
N5073 G1 X191.898 Y201.393 E2.41721
N5074 ; COOLING_NODE: 0
N5075 M204 S10000
N5076 G1 X192.29 Y201.845 F60000
N5077 ; FEATURE: Outer wall
N5078 ; LINE_WIDTH: 0.42
N5079 G1 F4773.528
N5080 M204 S5000
N5081 G1 X157.71 Y201.845 E1.03002
N5082 G1 X157.71 Y125.83 E2.26421
N5083 G1 X192.29 Y125.83 E1.03002
N5084 G1 X192.29 Y201.785 E2.26243
N5085 G1 E-.8 F1800
N5086 M204 S10000
N5087 G1 X184.684 Y201.154 Z1.8 F60000
N5088 G1 X174.265 Y200.29 Z1.8
N5089 G1 Z1.4
N5090 G1 E.8 F1800
N5091 ; FEATURE: Sparse infill
N5092 ; LINE_WIDTH: 0.45
N5093 G1 F4421.739
N5094 M204 S8000
N5095 G1 X172.636 Y200.29 E.05236
N5096 G1 X190.736 Y132.744 E2.24868
N5097 G1 X190.736 Y132.117 E.02014
N5098 G1 X186.003 Y127.385 E.21522
N5099 G1 X183.743 Y127.385 E.07268
N5100 G1 X164.208 Y200.29 E2.42708
N5101 G1 X162.579 Y200.29 E.05236
N5102 M204 S10000
N5103 G1 X159.264 Y162.278 F60000
N5104 G1 F4421.739
N5105 M204 S8000
N5106 G1 X159.264 Y160.65 E.05236
N5107 G1 X190.736 Y152.217 E1.0477
N5108 G1 X190.736 Y155.145 E.09415
N5109 G1 X162.975 Y127.385 E1.26243
N5110 G1 X166.885 Y127.385 E.12573
N5111 G1 X159.264 Y155.825 E.9468
N5112 G1 X159.264 Y158.216 E.07688
N5113 G1 X190.736 Y189.687 E1.43118
N5114 G1 X190.736 Y185.932 E.12073
N5115 G1 X159.264 Y194.365 E1.0477
N5116 G1 X159.264 Y192.758 E.05169
N5117 G1 X166.797 Y200.29 E.34255
N5118 G1 X168.608 Y200.29 E.05823
N5119 G1 X190.736 Y194.361 E.73665
N5120 G1 X190.736 Y195.657 E.04166
N5121 G1 X189.494 Y200.29 E.15425
N5122 G1 X189.825 Y200.29 E.01064
N5123 G1 X159.264 Y169.73 E1.38977
N5124 G1 X159.264 Y169.079 E.02094
N5125 G1 X190.736 Y160.646 E1.04769
N5126 G1 X190.736 Y164.2 E.11429
N5127 G1 X181.065 Y200.29 E1.20147
N5128 G1 X178.311 Y200.29 E.08857
N5129 G1 X159.264 Y181.244 E.86616
N5130 G1 X159.264 Y177.507 E.12015
N5131 G1 X190.736 Y169.075 E1.0477
N5132 G1 X190.736 Y166.659 E.07768
N5133 G1 X159.264 Y135.188 E1.43118
N5134 G1 X159.264 Y135.363 E.00564
N5135 G1 X189.042 Y127.385 E.99131
N5136 G1 X190.67 Y127.385 E.05236
N5137 M204 S10000
N5138 G1 X190.736 Y136.988 F60000
N5139 G1 F4421.739
N5140 M204 S8000
N5141 G1 X190.736 Y135.36 E.05236
N5142 G1 X159.264 Y143.792 E1.04769
N5143 G1 X159.264 Y146.702 E.09356
N5144 G1 X190.736 Y178.173 E1.43118
N5145 G1 X190.736 Y177.504 E.02153
N5146 G1 X159.264 Y185.936 E1.04769
N5147 G1 X159.264 Y184.308 E.05236
N5148 M204 S10000
N5149 G1 X159.264 Y188.91 F60000
N5150 G1 F4421.739
N5151 M204 S8000
N5152 G1 X159.264 Y187.282 E.05236
N5153 G1 X175.314 Y127.385 E1.99402
N5154 G1 X174.489 Y127.385 E.02652
N5155 G1 X190.736 Y143.631 E.73883
N5156 G1 X190.736 Y143.788 E.00506
N5157 M73 P43 R29
N5158 G1 X159.264 Y152.221 E1.0477
N5159 G1 X159.264 Y150.593 E.05236
N5160 ; WIPE_START
N5161 G1 X159.264 Y152.221 E-.61876
N5162 G1 X159.623 Y152.125 E-.14124
N5163 ; WIPE_END
N5164 G1 E-.04 F1800
N5165 M204 S10000
N5166 G17
N5167 G3 Z1.8 I1.217 J0 P1  F60000
N5168 ; stop printing object, unique label id: 229
N5169 M625
N5170 ; object ids of layer 7 start: 229
N5171 M624 AQAAAAAAAAA=
N5172 ;======== H2D 20250527========
N5173 ; SKIPPABLE_START
N5174 ; SKIPTYPE: timelapse
N5175 M622.1 S1 ; for prev firware, default turned on
N5176 
N5177 M1002 judge_flag timelapse_record_flag
N5178 
N5179 M622 J1
N5180 M993 A2 B2 C2
N5181 M993 A0 B0 C0
N5182 
N5183 
N5184 
N5185 
N5186     M9711 M0 E1 X260 Y141 Z1.8 S11 C10 O0 T3000
N5187 
N5188 
N5189 
N5190 M993 A3 B3 C3
N5191 
N5192 M623
N5193 ; SKIPPABLE_END
N5194 
N5195 ; object ids of this layer7 end: 229
N5196 M625
N5197 ; CHANGE_LAYER
N5198 ; Z_HEIGHT: 1.6
N5199 ; LAYER_HEIGHT: 0.2
N5200 ;======== H2D 20250521========
N5201 ; layer num/total_layer_count: 8/63
N5202 ; update layer progress
N5203 M73 L8
N5204 M991 S0 P7 ;notify layer change
N5205 
N5206 
N5207 ; OBJECT_ID: 229
N5208 ; COOLING_NODE: 0
N5209 ; start printing object, unique label id: 229
N5210 M624 AQAAAAAAAAA=
N5211 G1 X191.084 Y200.639 F60000
N5212 G1 Z1.6
N5213 G1 E.8 F1800
N5214 ; FEATURE: Inner wall
N5215 ; LINE_WIDTH: 0.45
N5216 ; LAYER_HEIGHT: 0.2
N5217 G1 F4421.739
N5218 M204 S8000
N5219 G1 X158.916 Y200.639 E1.03439
N5220 G1 X158.916 Y127.036 E2.36678
N5221 G1 X191.084 Y127.036 E1.03439
N5222 G1 X191.084 Y200.579 E2.36485
N5223 ; COOLING_NODE: 0
N5224 M204 S10000
N5225 G1 X191.491 Y201.046 F60000
N5226 G1 F4421.739
N5227 M204 S8000
N5228 G1 X158.509 Y201.046 E1.06057
N5229 M73 P44 R29
N5230 G1 X158.509 Y126.629 E2.39296
N5231 G1 X191.491 Y126.629 E1.06057
N5232 G1 X191.491 Y200.986 E2.39103
N5233 ; COOLING_NODE: 0
N5234 M204 S10000
N5235 G1 X191.898 Y201.453 F60000
N5236 G1 F4421.739
N5237 M204 S8000
N5238 G1 X158.102 Y201.453 E1.08675
N5239 G1 X158.102 Y126.222 E2.41914
N5240 G1 X191.898 Y126.222 E1.08675
N5241 G1 X191.898 Y201.393 E2.41721
N5242 ; COOLING_NODE: 0
N5243 M204 S10000
N5244 G1 X192.29 Y201.845 F60000
N5245 ; FEATURE: Outer wall
N5246 ; LINE_WIDTH: 0.42
N5247 G1 F4773.528
N5248 M204 S5000
N5249 G1 X157.71 Y201.845 E1.03002
N5250 G1 X157.71 Y125.83 E2.26421
N5251 G1 X192.29 Y125.83 E1.03002
N5252 G1 X192.29 Y201.785 E2.26243
N5253 G1 E-.8 F1800
N5254 M204 S10000
N5255 G1 X184.683 Y201.159 Z2 F60000
N5256 G1 X174.118 Y200.29 Z2
N5257 G1 Z1.6
N5258 G1 E.8 F1800
N5259 ; FEATURE: Sparse infill
N5260 ; LINE_WIDTH: 0.45
N5261 G1 F4421.739
N5262 M204 S8000
N5263 G1 X172.49 Y200.29 E.05236
N5264 G1 X190.736 Y132.197 E2.26687
N5265 G1 X190.736 Y131.917 E.009
N5266 G1 X186.203 Y127.385 E.20612
N5267 G1 X183.596 Y127.385 E.08382
N5268 G1 X164.061 Y200.29 E2.42708
N5269 G1 X162.433 Y200.29 E.05236
N5270 M204 S10000
N5271 G1 X159.264 Y162.425 F60000
N5272 G1 F4421.739
N5273 M204 S8000
N5274 G1 X159.264 Y160.796 E.05236
N5275 G1 X190.736 Y152.364 E1.0477
N5276 G1 X190.736 Y154.945 E.08301
N5277 G1 X163.175 Y127.385 E1.25334
N5278 G1 X166.739 Y127.385 E.11459
N5279 G1 X159.264 Y155.279 E.92861
N5280 G1 X159.264 Y158.016 E.08802
N5281 G1 X190.736 Y189.487 E1.43118
N5282 G1 X190.736 Y186.079 E.10959
N5283 G1 X159.264 Y194.511 E1.0477
N5284 G1 X159.264 Y192.558 E.06283
N5285 G1 X166.997 Y200.29 E.35165
N5286 G1 X169.154 Y200.29 E.06937
N5287 G1 X190.736 Y194.508 E.71846
N5288 G1 X190.736 Y195.11 E.01938
N5289 G1 X189.348 Y200.29 E.17244
N5290 G1 X190.025 Y200.29 E.02178
N5291 G1 X159.264 Y169.53 E1.39886
N5292 G1 X159.264 Y169.225 E.0098
N5293 G1 X190.736 Y160.792 E1.04769
N5294 G1 X190.736 Y163.654 E.09201
N5295 G1 X180.919 Y200.29 E1.21966
N5296 G1 X178.511 Y200.29 E.07743
N5297 G1 X159.264 Y181.044 E.87525
N5298 G1 X159.264 Y177.654 E.10901
N5299 G1 X190.736 Y169.221 E1.0477
N5300 G1 X190.736 Y166.459 E.08882
N5301 G1 X159.264 Y134.988 E1.43118
N5302 G1 X159.264 Y135.51 E.01678
N5303 G1 X189.588 Y127.385 E1.0095
N5304 G1 X190.736 Y127.385 E.03689
N5305 G1 X190.736 Y127.866 E.01547
N5306 M204 S10000
N5307 G1 X190.736 Y137.134 F60000
N5308 G1 F4421.739
N5309 M204 S8000
N5310 G1 X190.736 Y135.506 E.05236
N5311 G1 X159.264 Y143.939 E1.04769
N5312 G1 X159.264 Y146.502 E.08242
N5313 G1 X190.736 Y177.973 E1.43118
N5314 G1 X190.736 Y177.65 E.01039
N5315 G1 X159.264 Y186.083 E1.0477
N5316 M204 S10000
N5317 G1 X159.264 Y188.364 F60000
N5318 G1 F4421.739
N5319 M204 S8000
N5320 G1 X159.264 Y186.735 E.05236
N5321 G1 X175.167 Y127.385 E1.97583
N5322 G1 X174.689 Y127.385 E.01538
N5323 G1 X190.736 Y143.431 E.72973
N5324 G1 X190.736 Y143.935 E.0162
N5325 G1 X159.264 Y152.368 E1.0477
N5326 G1 X159.264 Y150.739 E.05236
N5327 ; WIPE_START
N5328 G1 X159.264 Y152.368 E-.61876
N5329 G1 X159.623 Y152.271 E-.14124
N5330 ; WIPE_END
N5331 G1 E-.04 F1800
N5332 M204 S10000
N5333 G17
N5334 G3 Z2 I1.217 J0 P1  F60000
N5335 ; stop printing object, unique label id: 229
N5336 M625
N5337 ; object ids of layer 8 start: 229
N5338 M624 AQAAAAAAAAA=
N5339 ;======== H2D 20250527========
N5340 ; SKIPPABLE_START
N5341 ; SKIPTYPE: timelapse
N5342 M622.1 S1 ; for prev firware, default turned on
N5343 
N5344 M1002 judge_flag timelapse_record_flag
N5345 
N5346 M622 J1
N5347 M993 A2 B2 C2
N5348 M993 A0 B0 C0
N5349 
N5350 
N5351 
N5352 
N5353     M9711 M0 E1 X260 Y141 Z2 S11 C10 O0 T3000
N5354 
N5355 
N5356 
N5357 M993 A3 B3 C3
N5358 
N5359 M623
N5360 ; SKIPPABLE_END
N5361 
N5362 ; object ids of this layer8 end: 229
N5363 M625
N5364 ; CHANGE_LAYER
N5365 ; Z_HEIGHT: 1.8
N5366 ; LAYER_HEIGHT: 0.2
N5367 ;======== H2D 20250521========
N5368 ; layer num/total_layer_count: 9/63
N5369 ; update layer progress
N5370 M73 L9
N5371 M991 S0 P8 ;notify layer change
N5372 
N5373 
N5374 M106 S51
N5375 ; OBJECT_ID: 229
N5376 ; COOLING_NODE: 0
N5377 ; start printing object, unique label id: 229
N5378 M624 AQAAAAAAAAA=
N5379 G1 X191.084 Y200.639 F60000
N5380 G1 Z1.8
N5381 G1 E.8 F1800
N5382 ; FEATURE: Inner wall
N5383 ; LINE_WIDTH: 0.45
N5384 ; LAYER_HEIGHT: 0.2
N5385 G1 F4421.739
N5386 M204 S8000
N5387 G1 X158.916 Y200.639 E1.03439
N5388 G1 X158.916 Y127.036 E2.36678
N5389 G1 X191.084 Y127.036 E1.03439
N5390 G1 X191.084 Y200.579 E2.36485
N5391 ; COOLING_NODE: 0
N5392 M204 S10000
N5393 G1 X191.491 Y201.046 F60000
N5394 G1 F4421.739
N5395 M204 S8000
N5396 G1 X158.509 Y201.046 E1.06057
N5397 G1 X158.509 Y126.629 E2.39296
N5398 G1 X191.491 Y126.629 E1.06057
N5399 G1 X191.491 Y200.986 E2.39103
N5400 ; COOLING_NODE: 0
N5401 M204 S10000
N5402 G1 X191.898 Y201.453 F60000
N5403 G1 F4421.739
N5404 M204 S8000
N5405 G1 X158.102 Y201.453 E1.08675
N5406 G1 X158.102 Y126.222 E2.41914
N5407 G1 X191.898 Y126.222 E1.08675
N5408 G1 X191.898 Y201.393 E2.41721
N5409 ; COOLING_NODE: 0
N5410 M204 S10000
N5411 G1 X192.29 Y201.845 F60000
N5412 ; FEATURE: Outer wall
N5413 ; LINE_WIDTH: 0.42
N5414 G1 F4773.528
N5415 M204 S5000
N5416 G1 X157.71 Y201.845 E1.03002
N5417 G1 X157.71 Y125.83 E2.26421
N5418 G1 X192.29 Y125.83 E1.03002
N5419 G1 X192.29 Y201.785 E2.26243
N5420 G1 E-.8 F1800
N5421 M204 S10000
N5422 M73 P45 R29
N5423 G1 X184.683 Y201.164 Z2.2 F60000
N5424 G1 X173.972 Y200.29 Z2.2
N5425 G1 Z1.8
N5426 G1 E.8 F1800
N5427 ; FEATURE: Sparse infill
N5428 ; LINE_WIDTH: 0.45
N5429 G1 F4421.739
N5430 M204 S8000
N5431 G1 X172.344 Y200.29 E.05236
N5432 G1 X190.736 Y131.651 E2.28506
N5433 G1 X190.736 Y131.717 E.00214
N5434 G1 X186.403 Y127.385 E.19703
N5435 G1 X183.45 Y127.385 E.09496
N5436 G1 X163.915 Y200.29 E2.42708
N5437 G1 X162.287 Y200.29 E.05236
N5438 M204 S10000
N5439 G1 X159.264 Y162.571 F60000
N5440 G1 F4421.739
N5441 M204 S8000
N5442 G1 X159.264 Y160.943 E.05236
N5443 G1 X190.736 Y152.51 E1.0477
N5444 G1 X190.736 Y154.745 E.07187
N5445 G1 X163.375 Y127.385 E1.24424
N5446 G1 X166.592 Y127.385 E.10345
N5447 G1 X159.264 Y154.732 E.91042
N5448 G1 X159.264 Y157.816 E.09916
N5449 G1 X190.736 Y189.287 E1.43118
N5450 G1 X190.736 Y186.225 E.09845
N5451 G1 X159.264 Y194.658 E1.0477
N5452 G1 X159.264 Y192.358 E.07396
N5453 G1 X167.197 Y200.29 E.36074
N5454 G1 X169.701 Y200.29 E.08051
N5455 G1 X190.736 Y194.654 E.70026
N5456 G1 X190.736 Y194.564 E.00289
N5457 G1 X189.201 Y200.29 E.19063
N5458 G1 X190.225 Y200.29 E.03292
N5459 G1 X159.264 Y169.33 E1.40796
N5460 G1 X159.264 Y169.371 E.00134
N5461 G1 X190.736 Y160.939 E1.0477
N5462 G1 X190.736 Y163.107 E.06973
N5463 G1 X180.772 Y200.29 E1.23785
N5464 G1 X178.711 Y200.29 E.06629
N5465 G1 X159.264 Y180.844 E.88435
N5466 G1 X159.264 Y177.8 E.09787
N5467 G1 X190.736 Y169.368 E1.0477
N5468 G1 X190.736 Y166.259 E.09996
N5469 G1 X159.264 Y134.788 E1.43118
N5470 G1 X159.264 Y135.656 E.02792
N5471 G1 X190.135 Y127.385 E1.02769
N5472 G1 X190.736 Y127.385 E.01932
N5473 G1 X190.736 Y128.412 E.03304
N5474 M204 S10000
N5475 G1 X190.736 Y137.281 F60000
N5476 G1 F4421.739
N5477 M204 S8000
N5478 G1 X190.736 Y135.652 E.05236
N5479 G1 X159.264 Y144.085 E1.0477
N5480 G1 X159.264 Y146.302 E.07129
N5481 G1 X190.736 Y177.773 E1.43118
N5482 G1 X190.736 Y177.796 E.00075
N5483 G1 X159.264 Y186.229 E1.0477
N5484 G1 X175.021 Y127.385 E1.95888
N5485 G1 X174.889 Y127.385 E.00424
N5486 G1 X190.736 Y143.231 E.72064
N5487 G1 X190.736 Y144.081 E.02734
N5488 G1 X159.264 Y152.514 E1.0477
N5489 G1 X159.264 Y150.886 E.05236
N5490 ; WIPE_START
N5491 G1 X159.264 Y152.514 E-.61876
N5492 G1 X159.623 Y152.418 E-.14124
N5493 ; WIPE_END
N5494 G1 E-.04 F1800
N5495 M204 S10000
N5496 G17
N5497 G3 Z2.2 I1.217 J0 P1  F60000
N5498 ; stop printing object, unique label id: 229
N5499 M625
N5500 ; object ids of layer 9 start: 229
N5501 M624 AQAAAAAAAAA=
N5502 ;======== H2D 20250527========
N5503 ; SKIPPABLE_START
N5504 ; SKIPTYPE: timelapse
N5505 M622.1 S1 ; for prev firware, default turned on
N5506 
N5507 M1002 judge_flag timelapse_record_flag
N5508 
N5509 M622 J1
N5510 M993 A2 B2 C2
N5511 M993 A0 B0 C0
N5512 
N5513 
N5514 
N5515 
N5516     M9711 M0 E1 X260 Y141 Z2.2 S11 C10 O0 T3000
N5517 
N5518 
N5519 
N5520 M993 A3 B3 C3
N5521 
N5522 M623
N5523 ; SKIPPABLE_END
N5524 
N5525 ; object ids of this layer9 end: 229
N5526 M625
N5527 ; CHANGE_LAYER
N5528 ; Z_HEIGHT: 2
N5529 ; LAYER_HEIGHT: 0.2
N5530 ;======== H2D 20250521========
N5531 ; layer num/total_layer_count: 10/63
N5532 ; update layer progress
N5533 M73 L10
N5534 M991 S0 P9 ;notify layer change
N5535 
N5536 
N5537 M106 S48.45
N5538 ; OBJECT_ID: 229
N5539 ; COOLING_NODE: 0
N5540 ; start printing object, unique label id: 229
N5541 M624 AQAAAAAAAAA=
N5542 G1 X191.084 Y200.639 F60000
N5543 G1 Z2
N5544 G1 E.8 F1800
N5545 ; FEATURE: Inner wall
N5546 ; LINE_WIDTH: 0.45
N5547 ; LAYER_HEIGHT: 0.2
N5548 G1 F4421.739
N5549 M204 S8000
N5550 G1 X158.916 Y200.639 E1.03439
N5551 G1 X158.916 Y127.036 E2.36678
N5552 G1 X191.084 Y127.036 E1.03439
N5553 G1 X191.084 Y200.579 E2.36485
N5554 ; COOLING_NODE: 0
N5555 M204 S10000
N5556 G1 X191.491 Y201.046 F60000
N5557 G1 F4421.739
N5558 M204 S8000
N5559 G1 X158.509 Y201.046 E1.06057
N5560 G1 X158.509 Y126.629 E2.39296
N5561 G1 X191.491 Y126.629 E1.06057
N5562 G1 X191.491 Y200.986 E2.39103
N5563 ; COOLING_NODE: 0
N5564 M204 S10000
N5565 G1 X191.898 Y201.453 F60000
N5566 G1 F4421.739
N5567 M204 S8000
N5568 G1 X158.102 Y201.453 E1.08675
N5569 G1 X158.102 Y126.222 E2.41914
N5570 G1 X191.898 Y126.222 E1.08675
N5571 G1 X191.898 Y201.393 E2.41721
N5572 ; COOLING_NODE: 0
N5573 M204 S10000
N5574 G1 X192.29 Y201.845 F60000
N5575 ; FEATURE: Outer wall
N5576 ; LINE_WIDTH: 0.42
N5577 G1 F4773.528
N5578 M204 S5000
N5579 G1 X157.71 Y201.845 E1.03002
N5580 M73 P45 R28
N5581 G1 X157.71 Y125.83 E2.26421
N5582 G1 X192.29 Y125.83 E1.03002
N5583 G1 X192.29 Y201.785 E2.26243
N5584 G1 E-.8 F1800
N5585 M204 S10000
N5586 G1 X190.736 Y194.8 Z2.4 F60000
N5587 G1 Z2
N5588 G1 E.8 F1800
N5589 ; FEATURE: Sparse infill
N5590 ; LINE_WIDTH: 0.45
N5591 G1 F4421.739
N5592 M204 S8000
N5593 G1 X170.247 Y200.29 E.68207
N5594 G1 X167.397 Y200.29 E.09165
N5595 G1 X159.264 Y192.158 E.36984
N5596 G1 X159.264 Y194.804 E.0851
N5597 G1 X190.736 Y186.372 E1.04769
N5598 G1 X190.736 Y189.087 E.08732
N5599 G1 X159.264 Y157.616 E1.43118
N5600 G1 X159.264 Y154.186 E.1103
N5601 G1 X166.446 Y127.385 E.89223
N5602 G1 X163.575 Y127.385 E.09231
N5603 G1 X190.736 Y154.545 E1.23515
N5604 G1 X190.736 Y152.656 E.06073
N5605 G1 X159.264 Y161.089 E1.0477
N5606 G1 X159.264 Y162.717 E.05236
N5607 M204 S10000
N5608 G1 X159.264 Y151.032 F60000
N5609 G1 F4421.739
N5610 M204 S8000
N5611 G1 X159.264 Y152.66 E.05236
N5612 G1 X190.736 Y144.228 E1.0477
N5613 G1 X190.736 Y143.031 E.03847
N5614 G1 X175.089 Y127.385 E.71154
N5615 G1 X174.875 Y127.385 E.00689
N5616 G1 X159.264 Y185.643 E1.93945
N5617 G1 X159.264 Y186.375 E.02357
N5618 G1 X190.736 Y177.943 E1.0477
N5619 G1 X190.736 Y177.573 E.01189
N5620 M73 P46 R28
N5621 G1 X159.264 Y146.102 E1.43118
N5622 G1 X159.264 Y144.232 E.06015
N5623 G1 X190.736 Y135.799 E1.0477
N5624 G1 X190.736 Y137.427 E.05236
N5625 M204 S10000
N5626 G1 X190.736 Y131.517 F60000
N5627 G1 F4421.739
N5628 M204 S8000
N5629 G1 X186.603 Y127.385 E.18793
N5630 G1 X183.303 Y127.385 E.1061
N5631 G1 X163.768 Y200.29 E2.42708
N5632 G1 X162.14 Y200.29 E.05236
N5633 M204 S10000
N5634 G1 X173.826 Y200.29 F60000
N5635 G1 F4421.739
N5636 M204 S8000
N5637 G1 X172.197 Y200.29 E.05236
N5638 G1 X190.736 Y131.104 E2.30325
N5639 G1 X190.736 Y127.385 E.11961
N5640 G1 X190.681 Y127.385 E.00175
N5641 G1 X159.264 Y135.803 E1.04588
N5642 G1 X159.264 Y134.588 E.03906
N5643 G1 X190.736 Y166.059 E1.43118
N5644 G1 X190.736 Y169.514 E.1111
N5645 G1 X159.264 Y177.947 E1.0477
N5646 G1 X159.264 Y180.644 E.08673
N5647 G1 X178.911 Y200.29 E.89344
N5648 G1 X180.626 Y200.29 E.05515
N5649 G1 X190.736 Y162.561 E1.25604
N5650 G1 X190.736 Y161.085 E.04745
N5651 G1 X159.264 Y169.518 E1.0477
N5652 G1 X159.264 Y169.13 E.01248
N5653 G1 X190.425 Y200.29 E1.41705
N5654 G1 X189.055 Y200.29 E.04406
N5655 G1 X190.736 Y194.018 E.20882
N5656 G1 X190.736 Y192.389 E.05236
N5657 ; WIPE_START
N5658 G1 X190.736 Y194.018 E-.61876
N5659 G1 X190.639 Y194.377 E-.14124
N5660 ; WIPE_END
N5661 G1 E-.04 F1800
N5662 M204 S10000
N5663 G17
N5664 G3 Z2.4 I1.217 J0 P1  F60000
N5665 ; stop printing object, unique label id: 229
N5666 M625
N5667 ; object ids of layer 10 start: 229
N5668 M624 AQAAAAAAAAA=
N5669 ;======== H2D 20250527========
N5670 ; SKIPPABLE_START
N5671 ; SKIPTYPE: timelapse
N5672 M622.1 S1 ; for prev firware, default turned on
N5673 
N5674 M1002 judge_flag timelapse_record_flag
N5675 
N5676 M622 J1
N5677 M993 A2 B2 C2
N5678 M993 A0 B0 C0
N5679 
N5680 
N5681 
N5682 
N5683     M9711 M0 E1 X260 Y141 Z2.4 S11 C10 O0 T3000
N5684 
N5685 
N5686 
N5687 M993 A3 B3 C3
N5688 
N5689 M623
N5690 ; SKIPPABLE_END
N5691 
N5692 ; object ids of this layer10 end: 229
N5693 M625
N5694 ; CHANGE_LAYER
N5695 ; Z_HEIGHT: 2.2
N5696 ; LAYER_HEIGHT: 0.2
N5697 ;======== H2D 20250521========
N5698 ; layer num/total_layer_count: 11/63
N5699 ; update layer progress
N5700 M73 L11
N5701 M991 S0 P10 ;notify layer change
N5702 
N5703 
N5704 M106 S51
N5705 ; OBJECT_ID: 229
N5706 ; COOLING_NODE: 0
N5707 ; start printing object, unique label id: 229
N5708 M624 AQAAAAAAAAA=
N5709 G1 X191.084 Y200.639 F60000
N5710 G1 Z2.2
N5711 G1 E.8 F1800
N5712 ; FEATURE: Inner wall
N5713 ; LINE_WIDTH: 0.45
N5714 ; LAYER_HEIGHT: 0.2
N5715 G1 F4421.739
N5716 M204 S8000
N5717 G1 X158.916 Y200.639 E1.03439
N5718 G1 X158.916 Y127.036 E2.36678
N5719 G1 X191.084 Y127.036 E1.03439
N5720 G1 X191.084 Y200.579 E2.36485
N5721 ; COOLING_NODE: 0
N5722 M204 S10000
N5723 G1 X191.491 Y201.046 F60000
N5724 G1 F4421.739
N5725 M204 S8000
N5726 G1 X158.509 Y201.046 E1.06057
N5727 G1 X158.509 Y126.629 E2.39296
N5728 G1 X191.491 Y126.629 E1.06057
N5729 G1 X191.491 Y200.986 E2.39103
N5730 ; COOLING_NODE: 0
N5731 M204 S10000
N5732 G1 X191.898 Y201.453 F60000
N5733 G1 F4421.739
N5734 M204 S8000
N5735 G1 X158.102 Y201.453 E1.08675
N5736 G1 X158.102 Y126.222 E2.41914
N5737 G1 X191.898 Y126.222 E1.08675
N5738 G1 X191.898 Y201.393 E2.41721
N5739 ; COOLING_NODE: 0
N5740 M204 S10000
N5741 G1 X192.29 Y201.845 F60000
N5742 ; FEATURE: Outer wall
N5743 ; LINE_WIDTH: 0.42
N5744 G1 F4773.528
N5745 M204 S5000
N5746 G1 X157.71 Y201.845 E1.03002
N5747 G1 X157.71 Y125.83 E2.26421
N5748 G1 X192.29 Y125.83 E1.03002
N5749 G1 X192.29 Y201.785 E2.26243
N5750 G1 E-.8 F1800
N5751 M204 S10000
N5752 G1 X190.736 Y196.575 Z2.6 F60000
N5753 G1 Z2.2
N5754 G1 E.8 F1800
N5755 ; FEATURE: Sparse infill
N5756 ; LINE_WIDTH: 0.45
N5757 G1 F4421.739
N5758 M204 S8000
N5759 G1 X190.736 Y194.947 E.05236
N5760 G1 X170.794 Y200.29 E.66388
N5761 G1 X167.597 Y200.29 E.10279
N5762 G1 X159.264 Y191.958 E.37893
N5763 G1 X159.264 Y194.951 E.09624
N5764 G1 X190.736 Y186.518 E1.0477
N5765 G1 X190.736 Y188.887 E.07618
N5766 G1 X159.264 Y157.416 E1.43118
N5767 G1 X159.264 Y153.639 E.12144
N5768 G1 X166.299 Y127.385 E.87404
N5769 G1 X163.775 Y127.385 E.08117
N5770 G1 X190.736 Y154.345 E1.22605
N5771 G1 X190.736 Y152.803 E.04959
N5772 G1 X159.264 Y161.236 E1.0477
N5773 G1 X159.264 Y162.864 E.05236
N5774 M204 S10000
N5775 G1 X159.264 Y152.807 F60000
N5776 G1 F4421.739
N5777 M204 S8000
N5778 G1 X190.736 Y144.374 E1.04769
N5779 G1 X190.736 Y142.831 E.04961
N5780 G1 X175.289 Y127.385 E.70245
N5781 G1 X174.728 Y127.385 E.01803
N5782 G1 X159.264 Y185.096 E1.92126
N5783 G1 X159.264 Y186.522 E.04585
N5784 G1 X190.736 Y178.089 E1.0477
N5785 G1 X190.736 Y177.373 E.02303
N5786 G1 X159.264 Y145.902 E1.43118
N5787 G1 X159.264 Y144.378 E.04901
N5788 G1 X190.736 Y135.945 E1.0477
N5789 G1 X190.736 Y137.574 E.05236
N5790 M204 S10000
N5791 G1 X190.736 Y131.317 F60000
N5792 G1 F4421.739
N5793 M204 S8000
N5794 G1 X186.803 Y127.385 E.17884
N5795 G1 X183.157 Y127.385 E.11724
N5796 G1 X163.622 Y200.29 E2.42708
N5797 G1 X161.994 Y200.29 E.05236
N5798 M204 S10000
N5799 G1 X172.051 Y200.29 F60000
N5800 G1 F4421.739
N5801 M204 S8000
N5802 G1 X190.736 Y130.558 E2.32144
N5803 G1 X190.736 Y127.516 E.0978
N5804 G1 X159.264 Y135.949 E1.0477
N5805 G1 X159.264 Y134.388 E.0502
N5806 G1 X190.736 Y165.859 E1.43118
N5807 G1 X190.736 Y169.66 E.12224
N5808 G1 X159.264 Y178.093 E1.04769
N5809 G1 X159.264 Y180.444 E.07559
N5810 G1 X179.111 Y200.29 E.90254
N5811 G1 X180.48 Y200.29 E.04401
N5812 G1 X190.736 Y162.015 E1.27423
N5813 G1 X190.736 Y161.232 E.02517
N5814 G1 X159.264 Y169.664 E1.0477
N5815 G1 X159.264 Y168.93 E.02362
N5816 G1 X190.625 Y200.29 E1.42615
N5817 G1 X188.908 Y200.29 E.0552
N5818 G1 X190.736 Y193.471 E.22701
N5819 G1 X190.736 Y191.843 E.05236
N5820 ; WIPE_START
N5821 M73 P47 R28
N5822 G1 X190.736 Y193.471 E-.61876
N5823 G1 X190.639 Y193.83 E-.14124
N5824 ; WIPE_END
N5825 G1 E-.04 F1800
N5826 M204 S10000
N5827 G17
N5828 G3 Z2.6 I1.217 J0 P1  F60000
N5829 ; stop printing object, unique label id: 229
N5830 M625
N5831 ; object ids of layer 11 start: 229
N5832 M624 AQAAAAAAAAA=
N5833 ;======== H2D 20250527========
N5834 ; SKIPPABLE_START
N5835 ; SKIPTYPE: timelapse
N5836 M622.1 S1 ; for prev firware, default turned on
N5837 
N5838 M1002 judge_flag timelapse_record_flag
N5839 
N5840 M622 J1
N5841 M993 A2 B2 C2
N5842 M993 A0 B0 C0
N5843 
N5844 
N5845 
N5846 
N5847     M9711 M0 E1 X260 Y141 Z2.6 S11 C10 O0 T3000
N5848 
N5849 
N5850 
N5851 M993 A3 B3 C3
N5852 
N5853 M623
N5854 ; SKIPPABLE_END
N5855 
N5856 ; object ids of this layer11 end: 229
N5857 M625
N5858 ; CHANGE_LAYER
N5859 ; Z_HEIGHT: 2.4
N5860 ; LAYER_HEIGHT: 0.2
N5861 ;======== H2D 20250521========
N5862 ; layer num/total_layer_count: 12/63
N5863 ; update layer progress
N5864 M73 L12
N5865 M991 S0 P11 ;notify layer change
N5866 
N5867 
N5868 M106 S48.45
N5869 ; OBJECT_ID: 229
N5870 ; COOLING_NODE: 0
N5871 ; start printing object, unique label id: 229
N5872 M624 AQAAAAAAAAA=
N5873 G1 X191.084 Y200.639 F60000
N5874 G1 Z2.4
N5875 G1 E.8 F1800
N5876 ; FEATURE: Inner wall
N5877 ; LINE_WIDTH: 0.45
N5878 ; LAYER_HEIGHT: 0.2
N5879 G1 F4421.739
N5880 M204 S8000
N5881 G1 X158.916 Y200.639 E1.03439
N5882 G1 X158.916 Y127.036 E2.36678
N5883 G1 X191.084 Y127.036 E1.03439
N5884 G1 X191.084 Y200.579 E2.36485
N5885 ; COOLING_NODE: 0
N5886 M204 S10000
N5887 G1 X191.491 Y201.046 F60000
N5888 G1 F4421.739
N5889 M204 S8000
N5890 G1 X158.509 Y201.046 E1.06057
N5891 G1 X158.509 Y126.629 E2.39296
N5892 G1 X191.491 Y126.629 E1.06057
N5893 G1 X191.491 Y200.986 E2.39103
N5894 ; COOLING_NODE: 0
N5895 M204 S10000
N5896 G1 X191.898 Y201.453 F60000
N5897 G1 F4421.739
N5898 M204 S8000
N5899 G1 X158.102 Y201.453 E1.08675
N5900 G1 X158.102 Y126.222 E2.41914
N5901 G1 X191.898 Y126.222 E1.08675
N5902 G1 X191.898 Y201.393 E2.41721
N5903 ; COOLING_NODE: 0
N5904 M204 S10000
N5905 G1 X192.29 Y201.845 F60000
N5906 ; FEATURE: Outer wall
N5907 ; LINE_WIDTH: 0.42
N5908 G1 F4773.528
N5909 M204 S5000
N5910 G1 X157.71 Y201.845 E1.03002
N5911 G1 X157.71 Y125.83 E2.26421
N5912 G1 X192.29 Y125.83 E1.03002
N5913 G1 X192.29 Y201.785 E2.26243
N5914 G1 E-.8 F1800
N5915 M204 S10000
N5916 G1 X190.736 Y196.722 Z2.8 F60000
N5917 G1 Z2.4
N5918 G1 E.8 F1800
N5919 ; FEATURE: Sparse infill
N5920 ; LINE_WIDTH: 0.45
N5921 G1 F4421.739
N5922 M204 S8000
N5923 G1 X190.736 Y195.093 E.05236
N5924 G1 X171.34 Y200.29 E.64569
N5925 G1 X167.797 Y200.29 E.11393
N5926 G1 X159.264 Y191.758 E.38803
N5927 G1 X159.264 Y195.097 E.10738
N5928 G1 X190.736 Y186.664 E1.0477
N5929 G1 X190.736 Y188.687 E.06504
N5930 G1 X159.264 Y157.216 E1.43118
N5931 G1 X159.264 Y161.382 E.13396
N5932 G1 X190.736 Y152.949 E1.0477
N5933 G1 X190.736 Y154.145 E.03845
N5934 G1 X163.975 Y127.385 E1.21696
N5935 G1 X166.153 Y127.385 E.07003
N5936 G1 X159.264 Y153.093 E.85585
N5937 G1 X159.264 Y152.953 E.0045
N5938 G1 X190.736 Y144.52 E1.0477
N5939 G1 X190.736 Y142.631 E.06075
N5940 G1 X175.489 Y127.385 E.69335
N5941 G1 X174.582 Y127.385 E.02917
N5942 G1 X159.264 Y184.55 E1.90307
N5943 G1 X159.264 Y186.668 E.06813
N5944 G1 X190.736 Y178.236 E1.0477
N5945 G1 X190.736 Y177.173 E.03417
N5946 G1 X159.264 Y145.702 E1.43118
N5947 G1 X159.264 Y144.524 E.03787
N5948 G1 X190.736 Y136.092 E1.0477
N5949 G1 X190.736 Y137.72 E.05236
N5950 M204 S10000
N5951 G1 X190.736 Y131.117 F60000
N5952 G1 F4421.739
N5953 M204 S8000
N5954 G1 X187.003 Y127.385 E.16974
N5955 G1 X183.011 Y127.385 E.12838
N5956 G1 X163.476 Y200.29 E2.42708
N5957 G1 X161.847 Y200.29 E.05236
N5958 M204 S10000
N5959 G1 X171.904 Y200.29 F60000
N5960 G1 F4421.739
N5961 M204 S8000
N5962 M73 P47 R27
N5963 G1 X190.736 Y130.011 E2.33963
N5964 G1 X190.736 Y127.663 E.07552
N5965 G1 X159.264 Y136.096 E1.04769
N5966 G1 X159.264 Y134.188 E.06134
N5967 G1 X190.736 Y165.659 E1.43118
N5968 G1 X190.736 Y169.807 E.13338
N5969 G1 X159.264 Y178.24 E1.0477
N5970 G1 X159.264 Y180.244 E.06445
N5971 G1 X179.311 Y200.29 E.91163
N5972 G1 X180.333 Y200.29 E.03287
N5973 G1 X190.736 Y161.468 E1.29242
N5974 G1 X190.736 Y161.378 E.0029
N5975 G1 X159.264 Y169.811 E1.0477
N5976 G1 X159.264 Y168.73 E.03476
N5977 G1 X190.736 Y200.201 E1.43118
N5978 G1 X190.736 Y200.29 E.00287
N5979 G1 X188.762 Y200.29 E.06346
N5980 G1 X190.736 Y192.925 E.2452
N5981 G1 X190.736 Y191.296 E.05236
N5982 M204 S10000
N5983 G1 X159.264 Y129.295 F60000
N5984 G1 F4421.739
N5985 M204 S8000
N5986 G1 X159.264 Y127.667 E.05236
N5987 G1 X160.317 Y127.385 E.03505
N5988 G1 X161.946 Y127.385 E.05236
N5989 ; WIPE_START
N5990 G1 X160.317 Y127.385 E-.61876
N5991 G1 X159.958 Y127.481 E-.14124
N5992 ; WIPE_END
N5993 G1 E-.04 F1800
N5994 M204 S10000
N5995 G17
N5996 G3 Z2.8 I1.217 J0 P1  F60000
N5997 ; stop printing object, unique label id: 229
N5998 M625
N5999 ; object ids of layer 12 start: 229
N6000 M624 AQAAAAAAAAA=
N6001 ;======== H2D 20250527========
N6002 ; SKIPPABLE_START
N6003 ; SKIPTYPE: timelapse
N6004 M622.1 S1 ; for prev firware, default turned on
N6005 
N6006 M1002 judge_flag timelapse_record_flag
N6007 
N6008 M622 J1
N6009 M993 A2 B2 C2
N6010 M993 A0 B0 C0
N6011 
N6012 
N6013 
N6014 
N6015     M9711 M0 E1 X260 Y141 Z2.8 S11 C10 O0 T3000
N6016 
N6017 
N6018 
N6019 M993 A3 B3 C3
N6020 
N6021 M623
N6022 ; SKIPPABLE_END
N6023 
N6024 ; object ids of this layer12 end: 229
N6025 M625
N6026 ; CHANGE_LAYER
N6027 ; Z_HEIGHT: 2.6
N6028 ; LAYER_HEIGHT: 0.2
N6029 ;======== H2D 20250521========
N6030 ; layer num/total_layer_count: 13/63
N6031 ; update layer progress
N6032 M73 L13
N6033 M991 S0 P12 ;notify layer change
N6034 
N6035 
N6036 ; OBJECT_ID: 229
N6037 ; COOLING_NODE: 0
N6038 ; start printing object, unique label id: 229
N6039 M624 AQAAAAAAAAA=
N6040 G1 X191.084 Y200.639 F60000
N6041 G1 Z2.6
N6042 G1 E.8 F1800
N6043 ; FEATURE: Inner wall
N6044 ; LINE_WIDTH: 0.45
N6045 ; LAYER_HEIGHT: 0.2
N6046 G1 F4421.739
N6047 M204 S8000
N6048 G1 X158.916 Y200.639 E1.03439
N6049 G1 X158.916 Y127.036 E2.36678
N6050 G1 X191.084 Y127.036 E1.03439
N6051 G1 X191.084 Y200.579 E2.36485
N6052 ; COOLING_NODE: 0
N6053 M204 S10000
N6054 G1 X191.491 Y201.046 F60000
N6055 G1 F4421.739
N6056 M204 S8000
N6057 G1 X158.509 Y201.046 E1.06057
N6058 G1 X158.509 Y126.629 E2.39296
N6059 G1 X191.491 Y126.629 E1.06057
N6060 G1 X191.491 Y200.986 E2.39103
N6061 ; COOLING_NODE: 0
N6062 M204 S10000
N6063 G1 X191.898 Y201.453 F60000
N6064 G1 F4421.739
N6065 M204 S8000
N6066 G1 X158.102 Y201.453 E1.08675
N6067 G1 X158.102 Y126.222 E2.41914
N6068 G1 X191.898 Y126.222 E1.08675
N6069 G1 X191.898 Y201.393 E2.41721
N6070 ; COOLING_NODE: 0
N6071 M204 S10000
N6072 M73 P48 R27
N6073 G1 X192.29 Y201.845 F60000
N6074 ; FEATURE: Outer wall
N6075 ; LINE_WIDTH: 0.42
N6076 G1 F4773.528
N6077 M204 S5000
N6078 G1 X157.71 Y201.845 E1.03002
N6079 G1 X157.71 Y125.83 E2.26421
N6080 G1 X192.29 Y125.83 E1.03002
N6081 G1 X192.29 Y201.785 E2.26243
N6082 G1 E-.8 F1800
N6083 M204 S10000
N6084 G1 X190.736 Y196.868 Z3 F60000
N6085 G1 Z2.6
N6086 G1 E.8 F1800
N6087 ; FEATURE: Sparse infill
N6088 ; LINE_WIDTH: 0.45
N6089 G1 F4421.739
N6090 M204 S8000
N6091 G1 X190.736 Y195.24 E.05236
N6092 G1 X171.886 Y200.29 E.6275
N6093 G1 X171.758 Y200.29 E.00413
N6094 G1 X190.736 Y129.465 E2.35782
N6095 G1 X190.736 Y127.809 E.05324
N6096 G1 X159.264 Y136.242 E1.0477
N6097 G1 X159.264 Y133.988 E.07248
N6098 G1 X190.736 Y165.459 E1.43118
N6099 G1 X190.736 Y169.953 E.14452
N6100 G1 X159.264 Y178.386 E1.0477
N6101 G1 X159.264 Y180.044 E.05331
N6102 G1 X179.511 Y200.29 E.92073
N6103 G1 X180.187 Y200.29 E.02173
N6104 G1 X190.736 Y160.922 E1.31061
N6105 G1 X190.736 Y159.293 E.05236
N6106 M204 S10000
N6107 G1 X190.736 Y161.524 F60000
N6108 G1 F4421.739
N6109 M204 S8000
N6110 G1 X159.264 Y169.957 E1.0477
N6111 G1 X159.264 Y168.53 E.0459
N6112 G1 X190.736 Y200.001 E1.43118
N6113 G1 X190.736 Y200.29 E.0093
N6114 G1 X188.616 Y200.29 E.06817
N6115 G1 X190.736 Y192.378 E.26339
N6116 G1 X190.736 Y190.75 E.05236
N6117 M204 S10000
N6118 G1 X190.736 Y137.866 F60000
N6119 G1 F4421.739
N6120 M204 S8000
N6121 G1 X190.736 Y136.238 E.05236
N6122 G1 X159.264 Y144.671 E1.0477
N6123 G1 X159.264 Y145.502 E.02673
N6124 G1 X190.736 Y176.973 E1.43118
N6125 G1 X190.736 Y178.382 E.04531
N6126 G1 X159.264 Y186.815 E1.0477
N6127 G1 X159.264 Y184.003 E.0904
N6128 G1 X174.435 Y127.385 E1.88488
N6129 G1 X175.689 Y127.385 E.04031
N6130 G1 X190.736 Y142.431 E.68426
N6131 G1 X190.736 Y144.667 E.07189
N6132 G1 X159.264 Y153.1 E1.0477
N6133 G1 X159.264 Y152.547 E.01778
N6134 G1 X166.007 Y127.385 E.83766
N6135 G1 X164.175 Y127.385 E.0589
N6136 G1 X190.736 Y153.945 E1.20786
N6137 G1 X190.736 Y153.096 E.02732
N6138 G1 X159.264 Y161.528 E1.0477
N6139 G1 X159.264 Y157.016 E.1451
N6140 G1 X190.736 Y188.487 E1.43118
N6141 G1 X190.736 Y186.811 E.0539
N6142 G1 X159.264 Y195.244 E1.0477
N6143 G1 X159.264 Y191.558 E.11852
N6144 G1 X167.997 Y200.29 E.39712
N6145 G1 X163.329 Y200.29 E.1501
N6146 G1 X182.864 Y127.385 E2.42708
N6147 G1 X187.203 Y127.385 E.13952
N6148 G1 X190.736 Y130.917 E.16065
N6149 G1 X190.736 Y132.546 E.05236
N6150 M204 S10000
N6151 G1 X162.492 Y127.385 F60000
N6152 G1 F4421.739
N6153 M204 S8000
N6154 G1 X160.864 Y127.385 E.05236
N6155 G1 X159.264 Y127.813 E.05324
N6156 G1 X159.264 Y129.441 E.05236
N6157 ; WIPE_START
N6158 G1 X159.264 Y127.813 E-.61876
N6159 G1 X159.623 Y127.717 E-.14124
N6160 ; WIPE_END
N6161 G1 E-.04 F1800
N6162 M204 S10000
N6163 G17
N6164 G3 Z3 I1.217 J0 P1  F60000
N6165 ; stop printing object, unique label id: 229
N6166 M625
N6167 ; object ids of layer 13 start: 229
N6168 M624 AQAAAAAAAAA=
N6169 ;======== H2D 20250527========
N6170 ; SKIPPABLE_START
N6171 ; SKIPTYPE: timelapse
N6172 M622.1 S1 ; for prev firware, default turned on
N6173 
N6174 M1002 judge_flag timelapse_record_flag
N6175 
N6176 M622 J1
N6177 M993 A2 B2 C2
N6178 M993 A0 B0 C0
N6179 
N6180 
N6181 
N6182 
N6183     M9711 M0 E1 X260 Y141 Z3 S11 C10 O0 T3000
N6184 
N6185 
N6186 
N6187 M993 A3 B3 C3
N6188 
N6189 M623
N6190 ; SKIPPABLE_END
N6191 
N6192 ; object ids of this layer13 end: 229
N6193 M625
N6194 ; CHANGE_LAYER
N6195 ; Z_HEIGHT: 2.8
N6196 ; LAYER_HEIGHT: 0.2
N6197 ;======== H2D 20250521========
N6198 ; layer num/total_layer_count: 14/63
N6199 ; update layer progress
N6200 M73 L14
N6201 M991 S0 P13 ;notify layer change
N6202 
N6203 
N6204 ; OBJECT_ID: 229
N6205 ; COOLING_NODE: 0
N6206 ; start printing object, unique label id: 229
N6207 M624 AQAAAAAAAAA=
N6208 G1 X191.084 Y200.639 F60000
N6209 G1 Z2.8
N6210 G1 E.8 F1800
N6211 ; FEATURE: Inner wall
N6212 ; LINE_WIDTH: 0.45
N6213 ; LAYER_HEIGHT: 0.2
N6214 G1 F4421.739
N6215 M204 S8000
N6216 G1 X158.916 Y200.639 E1.03439
N6217 G1 X158.916 Y127.036 E2.36678
N6218 G1 X191.084 Y127.036 E1.03439
N6219 G1 X191.084 Y200.579 E2.36485
N6220 ; COOLING_NODE: 0
N6221 M204 S10000
N6222 G1 X191.491 Y201.046 F60000
N6223 G1 F4421.739
N6224 M204 S8000
N6225 G1 X158.509 Y201.046 E1.06057
N6226 G1 X158.509 Y126.629 E2.39296
N6227 G1 X191.491 Y126.629 E1.06057
N6228 G1 X191.491 Y200.986 E2.39103
N6229 ; COOLING_NODE: 0
N6230 M204 S10000
N6231 G1 X191.898 Y201.453 F60000
N6232 G1 F4421.739
N6233 M204 S8000
N6234 G1 X158.102 Y201.453 E1.08675
N6235 G1 X158.102 Y126.222 E2.41914
N6236 G1 X191.898 Y126.222 E1.08675
N6237 G1 X191.898 Y201.393 E2.41721
N6238 ; COOLING_NODE: 0
N6239 M204 S10000
N6240 G1 X192.29 Y201.845 F60000
N6241 ; FEATURE: Outer wall
N6242 ; LINE_WIDTH: 0.42
N6243 G1 F4773.528
N6244 M204 S5000
N6245 G1 X157.71 Y201.845 E1.03002
N6246 G1 X157.71 Y125.83 E2.26421
N6247 G1 X192.29 Y125.83 E1.03002
N6248 G1 X192.29 Y201.785 E2.26243
N6249 G1 E-.8 F1800
N6250 M204 S10000
N6251 G1 X190.736 Y197.014 Z3.2 F60000
N6252 G1 Z2.8
N6253 G1 E.8 F1800
N6254 ; FEATURE: Sparse infill
N6255 ; LINE_WIDTH: 0.45
N6256 G1 F4421.739
N6257 M204 S8000
N6258 G1 X190.736 Y195.386 E.05236
N6259 G1 X172.433 Y200.29 E.60931
N6260 G1 X171.612 Y200.29 E.02641
N6261 G1 X190.736 Y128.919 E2.37601
N6262 G1 X190.736 Y127.956 E.03096
N6263 G1 X159.264 Y136.388 E1.0477
N6264 G1 X159.264 Y133.788 E.08362
N6265 G1 X190.736 Y165.259 E1.43118
N6266 G1 X190.736 Y161.671 E.11538
N6267 M73 P49 R27
N6268 G1 X159.264 Y170.104 E1.0477
N6269 G1 X159.264 Y168.33 E.05704
N6270 G1 X190.736 Y199.801 E1.43118
N6271 G1 X190.736 Y200.29 E.01574
N6272 G1 X188.469 Y200.29 E.07288
N6273 G1 X190.736 Y191.832 E.28158
N6274 G1 X190.736 Y190.204 E.05236
N6275 M204 S10000
N6276 G1 X190.736 Y171.728 F60000
N6277 G1 F4421.739
N6278 M204 S8000
N6279 G1 X190.736 Y170.1 E.05236
N6280 G1 X159.264 Y178.532 E1.0477
N6281 G1 X159.264 Y179.844 E.04217
N6282 G1 X179.711 Y200.29 E.92982
N6283 G1 X180.04 Y200.29 E.01059
N6284 G1 X190.736 Y160.375 E1.3288
N6285 G1 X190.736 Y158.747 E.05236
N6286 M204 S10000
N6287 G1 X190.736 Y138.013 F60000
N6288 G1 F4421.739
N6289 M204 S8000
N6290 G1 X190.736 Y136.385 E.05236
N6291 G1 X159.264 Y144.817 E1.0477
N6292 G1 X159.264 Y145.302 E.01559
N6293 G1 X190.736 Y176.773 E1.43118
N6294 G1 X190.736 Y178.528 E.05645
N6295 G1 X159.264 Y186.961 E1.04769
N6296 G1 X159.264 Y183.457 E.11268
N6297 G1 X174.289 Y127.385 E1.86669
N6298 G1 X175.889 Y127.385 E.05145
N6299 G1 X190.736 Y142.231 E.67516
N6300 G1 X190.736 Y144.813 E.08303
N6301 G1 X159.264 Y153.246 E1.0477
N6302 G1 X159.264 Y152 E.04006
N6303 G1 X165.86 Y127.385 E.81947
N6304 G1 X164.375 Y127.385 E.04776
N6305 G1 X190.736 Y153.745 E1.19877
N6306 G1 X190.736 Y153.242 E.01618
N6307 G1 X159.264 Y161.675 E1.04769
N6308 G1 X159.264 Y156.816 E.15624
N6309 G1 X190.736 Y188.287 E1.43118
N6310 G1 X190.736 Y186.957 E.04276
N6311 G1 X159.264 Y195.39 E1.0477
N6312 G1 X159.264 Y191.358 E.12966
N6313 G1 X168.197 Y200.29 E.40622
N6314 G1 X163.183 Y200.29 E.16124
N6315 G1 X182.718 Y127.385 E2.42708
N6316 G1 X187.403 Y127.385 E.15066
N6317 G1 X190.736 Y130.717 E.15155
N6318 G1 X190.736 Y132.346 E.05236
N6319 M204 S10000
N6320 G1 X163.038 Y127.385 F60000
N6321 G1 F4421.739
N6322 M204 S8000
N6323 G1 X161.41 Y127.385 E.05236
N6324 G1 X159.264 Y127.96 E.07143
N6325 G1 X159.264 Y129.588 E.05236
N6326 ; WIPE_START
N6327 G1 X159.264 Y127.96 E-.61876
N6328 G1 X159.623 Y127.863 E-.14124
N6329 ; WIPE_END
N6330 G1 E-.04 F1800
N6331 M204 S10000
N6332 G17
N6333 G3 Z3.2 I1.217 J0 P1  F60000
N6334 ; stop printing object, unique label id: 229
N6335 M625
N6336 ; object ids of layer 14 start: 229
N6337 M624 AQAAAAAAAAA=
N6338 ;======== H2D 20250527========
N6339 ; SKIPPABLE_START
N6340 ; SKIPTYPE: timelapse
N6341 M622.1 S1 ; for prev firware, default turned on
N6342 
N6343 M1002 judge_flag timelapse_record_flag
N6344 
N6345 M622 J1
N6346 M993 A2 B2 C2
N6347 M993 A0 B0 C0
N6348 
N6349 
N6350 
N6351 
N6352     M9711 M0 E1 X260 Y141 Z3.2 S11 C10 O0 T3000
N6353 
N6354 
N6355 
N6356 M993 A3 B3 C3
N6357 
N6358 M623
N6359 ; SKIPPABLE_END
N6360 
N6361 ; object ids of this layer14 end: 229
N6362 M625
N6363 ; CHANGE_LAYER
N6364 ; Z_HEIGHT: 3
N6365 ; LAYER_HEIGHT: 0.2
N6366 ;======== H2D 20250521========
N6367 ; layer num/total_layer_count: 15/63
N6368 ; update layer progress
N6369 M73 L15
N6370 M991 S0 P14 ;notify layer change
N6371 
N6372 
N6373 ; OBJECT_ID: 229
N6374 ; COOLING_NODE: 0
N6375 ; start printing object, unique label id: 229
N6376 M624 AQAAAAAAAAA=
N6377 G1 X191.084 Y200.639 F60000
N6378 G1 Z3
N6379 G1 E.8 F1800
N6380 ; FEATURE: Inner wall
N6381 ; LINE_WIDTH: 0.45
N6382 ; LAYER_HEIGHT: 0.2
N6383 G1 F4421.739
N6384 M204 S8000
N6385 G1 X158.916 Y200.639 E1.03439
N6386 G1 X158.916 Y127.036 E2.36678
N6387 G1 X191.084 Y127.036 E1.03439
N6388 G1 X191.084 Y200.579 E2.36485
N6389 ; COOLING_NODE: 0
N6390 M204 S10000
N6391 G1 X191.491 Y201.046 F60000
N6392 G1 F4421.739
N6393 M204 S8000
N6394 G1 X158.509 Y201.046 E1.06057
N6395 G1 X158.509 Y126.629 E2.39296
N6396 G1 X191.491 Y126.629 E1.06057
N6397 G1 X191.491 Y200.986 E2.39103
N6398 ; COOLING_NODE: 0
N6399 M204 S10000
N6400 G1 X191.898 Y201.453 F60000
N6401 M73 P49 R26
N6402 G1 F4421.739
N6403 M204 S8000
N6404 G1 X158.102 Y201.453 E1.08675
N6405 G1 X158.102 Y126.222 E2.41914
N6406 G1 X191.898 Y126.222 E1.08675
N6407 G1 X191.898 Y201.393 E2.41721
N6408 ; COOLING_NODE: 0
N6409 M204 S10000
N6410 G1 X192.29 Y201.845 F60000
N6411 ; FEATURE: Outer wall
N6412 ; LINE_WIDTH: 0.42
N6413 G1 F4773.528
N6414 M204 S5000
N6415 G1 X157.71 Y201.845 E1.03002
N6416 G1 X157.71 Y125.83 E2.26421
N6417 G1 X192.29 Y125.83 E1.03002
N6418 G1 X192.29 Y201.785 E2.26243
N6419 G1 E-.8 F1800
N6420 M204 S10000
N6421 G1 X190.736 Y197.161 Z3.4 F60000
N6422 G1 Z3
N6423 G1 E.8 F1800
N6424 ; FEATURE: Sparse infill
N6425 ; LINE_WIDTH: 0.45
N6426 G1 F4421.739
N6427 M204 S8000
N6428 G1 X190.736 Y195.532 E.05236
N6429 G1 X172.979 Y200.29 E.59112
N6430 G1 X171.465 Y200.29 E.04869
N6431 G1 X190.736 Y128.372 E2.39421
N6432 G1 X190.736 Y128.102 E.00868
N6433 G1 X159.264 Y136.535 E1.0477
N6434 G1 X159.264 Y133.588 E.09476
N6435 G1 X190.736 Y165.059 E1.43118
N6436 G1 X190.736 Y161.817 E.10424
N6437 G1 X159.264 Y170.25 E1.0477
N6438 G1 X159.264 Y168.13 E.06818
N6439 G1 X190.736 Y199.601 E1.43118
N6440 G1 X190.736 Y200.29 E.02217
N6441 G1 X188.323 Y200.29 E.07759
N6442 G1 X190.736 Y191.286 E.29977
N6443 G1 X190.736 Y189.657 E.05236
N6444 M204 S10000
N6445 G1 X190.736 Y171.874 F60000
N6446 G1 F4421.739
N6447 M204 S8000
N6448 G1 X190.736 Y170.246 E.05236
N6449 G1 X159.264 Y178.679 E1.0477
N6450 G1 X159.264 Y179.644 E.03103
N6451 G1 X179.911 Y200.29 E.93892
N6452 G1 X179.894 Y200.29 E.00055
N6453 G1 X190.736 Y159.829 E1.34699
N6454 G1 X190.736 Y158.201 E.05236
N6455 M204 S10000
N6456 G1 X190.736 Y138.159 F60000
N6457 G1 F4421.739
N6458 M204 S8000
N6459 G1 X190.736 Y136.531 E.05236
N6460 G1 X159.264 Y144.964 E1.04769
N6461 G1 X159.264 Y145.102 E.00445
N6462 G1 X190.736 Y176.573 E1.43118
N6463 G1 X190.736 Y178.675 E.06759
N6464 G1 X159.264 Y187.108 E1.04769
N6465 G1 X159.264 Y191.158 E.13024
N6466 G1 X168.397 Y200.29 E.41531
N6467 G1 X163.036 Y200.29 E.17238
N6468 G1 X182.571 Y127.385 E2.42708
N6469 G1 X187.603 Y127.385 E.1618
N6470 G1 X190.736 Y130.517 E.14246
N6471 G1 X190.736 Y132.146 E.05236
N6472 M204 S10000
N6473 M73 P50 R26
N6474 G1 X163.585 Y127.385 F60000
N6475 G1 F4421.739
N6476 M204 S8000
N6477 G1 X161.956 Y127.385 E.05236
N6478 G1 X159.264 Y128.106 E.08962
N6479 G1 X159.264 Y129.734 E.05236
N6480 M204 S10000
N6481 G1 X159.264 Y184.539 F60000
N6482 G1 F4421.739
N6483 M204 S8000
N6484 G1 X159.264 Y182.91 E.05236
N6485 G1 X174.143 Y127.385 E1.84849
N6486 G1 X176.089 Y127.385 E.06259
N6487 G1 X190.736 Y142.031 E.66606
N6488 G1 X190.736 Y144.96 E.09417
N6489 G1 X159.264 Y153.392 E1.0477
N6490 G1 X159.264 Y151.454 E.06234
N6491 G1 X165.714 Y127.385 E.80128
N6492 G1 X164.575 Y127.385 E.03662
N6493 G1 X190.736 Y153.545 E1.18967
N6494 G1 X190.736 Y153.389 E.00504
N6495 G1 X159.264 Y161.821 E1.0477
N6496 G1 X159.264 Y156.616 E.16738
N6497 G1 X190.736 Y188.087 E1.43118
N6498 G1 X190.736 Y187.104 E.03162
N6499 G1 X159.264 Y195.536 E1.0477
N6500 G1 X159.264 Y197.165 E.05236
N6501 ; WIPE_START
N6502 G1 X159.264 Y195.536 E-.61876
N6503 G1 X159.623 Y195.44 E-.14124
N6504 ; WIPE_END
N6505 G1 E-.04 F1800
N6506 M204 S10000
N6507 G17
N6508 G3 Z3.4 I1.217 J0 P1  F60000
N6509 ; stop printing object, unique label id: 229
N6510 M625
N6511 ; object ids of layer 15 start: 229
N6512 M624 AQAAAAAAAAA=
N6513 ;======== H2D 20250527========
N6514 ; SKIPPABLE_START
N6515 ; SKIPTYPE: timelapse
N6516 M622.1 S1 ; for prev firware, default turned on
N6517 
N6518 M1002 judge_flag timelapse_record_flag
N6519 
N6520 M622 J1
N6521 M993 A2 B2 C2
N6522 M993 A0 B0 C0
N6523 
N6524 
N6525 
N6526 
N6527     M9711 M0 E1 X260 Y141 Z3.4 S11 C10 O0 T3000
N6528 
N6529 
N6530 
N6531 M993 A3 B3 C3
N6532 
N6533 M623
N6534 ; SKIPPABLE_END
N6535 
N6536 ; object ids of this layer15 end: 229
N6537 M625
N6538 ; CHANGE_LAYER
N6539 ; Z_HEIGHT: 3.2
N6540 ; LAYER_HEIGHT: 0.2
N6541 ;======== H2D 20250521========
N6542 ; layer num/total_layer_count: 16/63
N6543 ; update layer progress
N6544 M73 L16
N6545 M991 S0 P15 ;notify layer change
N6546 
N6547 
N6548 ; OBJECT_ID: 229
N6549 ; COOLING_NODE: 0
N6550 ; start printing object, unique label id: 229
N6551 M624 AQAAAAAAAAA=
N6552 G1 X191.084 Y200.639 F60000
N6553 G1 Z3.2
N6554 G1 E.8 F1800
N6555 ; FEATURE: Inner wall
N6556 ; LINE_WIDTH: 0.45
N6557 ; LAYER_HEIGHT: 0.2
N6558 G1 F4421.739
N6559 M204 S8000
N6560 G1 X158.916 Y200.639 E1.03439
N6561 G1 X158.916 Y127.036 E2.36678
N6562 G1 X191.084 Y127.036 E1.03439
N6563 G1 X191.084 Y200.579 E2.36485
N6564 ; COOLING_NODE: 0
N6565 M204 S10000
N6566 G1 X191.491 Y201.046 F60000
N6567 G1 F4421.739
N6568 M204 S8000
N6569 G1 X158.509 Y201.046 E1.06057
N6570 G1 X158.509 Y126.629 E2.39296
N6571 G1 X191.491 Y126.629 E1.06057
N6572 G1 X191.491 Y200.986 E2.39103
N6573 ; COOLING_NODE: 0
N6574 M204 S10000
N6575 G1 X191.898 Y201.453 F60000
N6576 G1 F4421.739
N6577 M204 S8000
N6578 G1 X158.102 Y201.453 E1.08675
N6579 G1 X158.102 Y126.222 E2.41914
N6580 G1 X191.898 Y126.222 E1.08675
N6581 G1 X191.898 Y201.393 E2.41721
N6582 ; COOLING_NODE: 0
N6583 M204 S10000
N6584 G1 X192.29 Y201.845 F60000
N6585 ; FEATURE: Outer wall
N6586 ; LINE_WIDTH: 0.42
N6587 G1 F4773.528
N6588 M204 S5000
N6589 G1 X157.71 Y201.845 E1.03002
N6590 G1 X157.71 Y125.83 E2.26421
N6591 G1 X192.29 Y125.83 E1.03002
N6592 G1 X192.29 Y201.785 E2.26243
N6593 G1 E-.8 F1800
N6594 M204 S10000
N6595 G1 X190.736 Y197.307 Z3.6 F60000
N6596 G1 Z3.2
N6597 G1 E.8 F1800
N6598 ; FEATURE: Sparse infill
N6599 ; LINE_WIDTH: 0.45
N6600 G1 F4421.739
N6601 M204 S8000
N6602 G1 X190.736 Y195.679 E.05236
N6603 G1 X173.526 Y200.29 E.57293
N6604 G1 X171.319 Y200.29 E.07096
N6605 G1 X190.736 Y127.826 E2.4124
N6606 G1 X190.736 Y127.385 E.01418
N6607 G1 X187.803 Y127.385 E.0943
N6608 G1 X190.736 Y130.317 E.13336
N6609 G1 X190.736 Y136.677 E.20452
N6610 G1 X159.264 Y145.11 E1.04769
N6611 G1 X159.264 Y144.902 E.00669
N6612 G1 X190.736 Y176.373 E1.43118
N6613 G1 X190.736 Y178.821 E.07873
N6614 G1 X159.264 Y187.254 E1.0477
N6615 G1 X159.264 Y190.958 E.1191
N6616 G1 X168.597 Y200.29 E.42441
N6617 G1 X162.89 Y200.29 E.18352
N6618 G1 X182.425 Y127.385 E2.42708
N6619 G1 X180.797 Y127.385 E.05236
N6620 M204 S10000
N6621 G1 X190.736 Y128.249 F60000
N6622 G1 F4421.739
N6623 M204 S8000
N6624 G1 X159.264 Y136.681 E1.0477
N6625 G1 X159.264 Y133.388 E.1059
N6626 G1 X190.736 Y164.859 E1.43118
N6627 G1 X190.736 Y161.964 E.0931
N6628 G1 X159.264 Y170.396 E1.0477
N6629 G1 X159.264 Y167.93 E.07931
N6630 G1 X190.736 Y199.401 E1.43118
N6631 G1 X190.736 Y200.29 E.0286
N6632 G1 X188.176 Y200.29 E.0823
N6633 G1 X190.736 Y190.739 E.31796
N6634 G1 X190.736 Y189.111 E.05236
N6635 M204 S10000
N6636 G1 X190.736 Y172.021 F60000
N6637 G1 F4421.739
N6638 M204 S8000
N6639 G1 X190.736 Y170.393 E.05236
N6640 G1 X159.264 Y178.825 E1.0477
N6641 G1 X159.264 Y179.444 E.01989
N6642 G1 X180.111 Y200.29 E.94802
N6643 G1 X179.748 Y200.29 E.01169
N6644 G1 X190.736 Y159.282 E1.36518
N6645 G1 X190.736 Y157.654 E.05236
N6646 M204 S10000
N6647 G1 X164.131 Y127.385 F60000
N6648 G1 F4421.739
N6649 M204 S8000
N6650 G1 X162.503 Y127.385 E.05236
N6651 G1 X159.264 Y128.252 E.10781
N6652 G1 X159.264 Y129.881 E.05236
N6653 M204 S10000
N6654 G1 X159.264 Y183.992 F60000
N6655 G1 F4421.739
N6656 M204 S8000
N6657 G1 X159.264 Y182.364 E.05236
N6658 G1 X173.996 Y127.385 E1.8303
N6659 G1 X176.289 Y127.385 E.07373
N6660 G1 X190.736 Y141.831 E.65697
N6661 G1 X190.736 Y145.106 E.10531
N6662 G1 X159.264 Y153.539 E1.0477
N6663 G1 X159.264 Y150.907 E.08462
N6664 G1 X165.567 Y127.385 E.78309
N6665 G1 X164.775 Y127.385 E.02548
N6666 G1 X190.736 Y153.345 E1.18058
N6667 G1 X190.736 Y153.535 E.0061
N6668 G1 X159.264 Y161.968 E1.0477
N6669 G1 X159.264 Y156.416 E.17852
N6670 G1 X190.736 Y187.887 E1.43118
N6671 G1 X190.736 Y187.25 E.02048
N6672 G1 X159.264 Y195.683 E1.0477
N6673 G1 X159.264 Y197.311 E.05236
N6674 ; WIPE_START
N6675 G1 X159.264 Y195.683 E-.61876
N6676 G1 X159.623 Y195.587 E-.14124
N6677 ; WIPE_END
N6678 G1 E-.04 F1800
N6679 M204 S10000
N6680 G17
N6681 G3 Z3.6 I1.217 J0 P1  F60000
N6682 ; stop printing object, unique label id: 229
N6683 M625
N6684 ; object ids of layer 16 start: 229
N6685 M624 AQAAAAAAAAA=
N6686 ;======== H2D 20250527========
N6687 ; SKIPPABLE_START
N6688 ; SKIPTYPE: timelapse
N6689 M622.1 S1 ; for prev firware, default turned on
N6690 
N6691 M1002 judge_flag timelapse_record_flag
N6692 
N6693 M622 J1
N6694 M993 A2 B2 C2
N6695 M993 A0 B0 C0
N6696 
N6697 
N6698 
N6699 
N6700     M9711 M0 E1 X260 Y141 Z3.6 S11 C10 O0 T3000
N6701 
N6702 
N6703 
N6704 M993 A3 B3 C3
N6705 
N6706 M623
N6707 ; SKIPPABLE_END
N6708 
N6709 ; object ids of this layer16 end: 229
N6710 M625
N6711 ; CHANGE_LAYER
N6712 ; Z_HEIGHT: 3.4
N6713 ; LAYER_HEIGHT: 0.2
N6714 ;======== H2D 20250521========
N6715 ; layer num/total_layer_count: 17/63
N6716 ; update layer progress
N6717 M73 L17
N6718 M991 S0 P16 ;notify layer change
N6719 
N6720 
N6721 ; OBJECT_ID: 229
N6722 ; COOLING_NODE: 0
N6723 ; start printing object, unique label id: 229
N6724 M624 AQAAAAAAAAA=
N6725 G1 X191.084 Y200.639 F60000
N6726 G1 Z3.4
N6727 G1 E.8 F1800
N6728 ; FEATURE: Inner wall
N6729 ; LINE_WIDTH: 0.45
N6730 ; LAYER_HEIGHT: 0.2
N6731 G1 F4421.739
N6732 M204 S8000
N6733 G1 X158.916 Y200.639 E1.03439
N6734 G1 X158.916 Y127.036 E2.36678
N6735 G1 X191.084 Y127.036 E1.03439
N6736 G1 X191.084 Y200.579 E2.36485
N6737 ; COOLING_NODE: 0
N6738 M204 S10000
N6739 G1 X191.491 Y201.046 F60000
N6740 G1 F4421.739
N6741 M204 S8000
N6742 M73 P51 R26
N6743 G1 X158.509 Y201.046 E1.06057
N6744 G1 X158.509 Y126.629 E2.39296
N6745 G1 X191.491 Y126.629 E1.06057
N6746 G1 X191.491 Y200.986 E2.39103
N6747 ; COOLING_NODE: 0
N6748 M204 S10000
N6749 G1 X191.898 Y201.453 F60000
N6750 G1 F4421.739
N6751 M204 S8000
N6752 G1 X158.102 Y201.453 E1.08675
N6753 G1 X158.102 Y126.222 E2.41914
N6754 G1 X191.898 Y126.222 E1.08675
N6755 G1 X191.898 Y201.393 E2.41721
N6756 ; COOLING_NODE: 0
N6757 M204 S10000
N6758 G1 X192.29 Y201.845 F60000
N6759 ; FEATURE: Outer wall
N6760 ; LINE_WIDTH: 0.42
N6761 G1 F4773.528
N6762 M204 S5000
N6763 G1 X157.71 Y201.845 E1.03002
N6764 G1 X157.71 Y125.83 E2.26421
N6765 G1 X192.29 Y125.83 E1.03002
N6766 G1 X192.29 Y201.785 E2.26243
N6767 G1 E-.8 F1800
N6768 M204 S10000
N6769 G1 X186.402 Y200.29 Z3.8 F60000
N6770 G1 Z3.4
N6771 G1 E.8 F1800
N6772 ; FEATURE: Sparse infill
N6773 ; LINE_WIDTH: 0.45
N6774 G1 F4421.739
N6775 M204 S8000
N6776 G1 X188.03 Y200.29 E.05236
N6777 G1 X190.736 Y190.193 E.33616
N6778 G1 X190.736 Y188.564 E.05236
N6779 M204 S10000
N6780 G1 X190.736 Y168.911 F60000
N6781 G1 F4421.739
N6782 M204 S8000
N6783 G1 X190.736 Y170.539 E.05236
N6784 G1 X159.264 Y178.972 E1.0477
N6785 G1 X159.264 Y179.244 E.00875
N6786 G1 X180.311 Y200.29 E.95711
N6787 G1 X179.601 Y200.29 E.02283
N6788 G1 X190.736 Y158.736 E1.38337
N6789 G1 X190.736 Y157.108 E.05236
N6790 M204 S10000
N6791 G1 X164.678 Y127.385 F60000
N6792 G1 F4421.739
N6793 M204 S8000
N6794 M73 P51 R25
N6795 G1 X163.049 Y127.385 E.05236
N6796 G1 X159.264 Y128.399 E.126
N6797 G1 X159.264 Y130.027 E.05236
N6798 M204 S10000
N6799 G1 X159.264 Y151.989 F60000
N6800 G1 F4421.739
N6801 M204 S8000
N6802 G1 X159.264 Y150.361 E.05236
N6803 G1 X165.421 Y127.385 E.7649
N6804 G1 X164.975 Y127.385 E.01434
N6805 G1 X190.736 Y153.145 E1.17148
N6806 G1 X190.736 Y153.681 E.01724
N6807 G1 X159.264 Y162.114 E1.0477
N6808 G1 X159.264 Y160.486 E.05236
N6809 M204 S10000
N6810 G1 X159.264 Y183.446 F60000
N6811 G1 F4421.739
N6812 M204 S8000
N6813 G1 X159.264 Y181.818 E.05236
N6814 G1 X173.85 Y127.385 E1.81211
N6815 G1 X176.489 Y127.385 E.08487
N6816 G1 X190.736 Y141.631 E.64787
N6817 G1 X190.736 Y145.253 E.11645
N6818 G1 X159.264 Y153.685 E1.0477
N6819 G1 X159.264 Y156.216 E.08138
N6820 G1 X190.736 Y187.687 E1.43118
N6821 G1 X190.736 Y187.397 E.00934
N6822 G1 X159.264 Y195.829 E1.0477
N6823 G1 X159.264 Y200.29 E.14345
N6824 G1 X162.744 Y200.29 E.11187
N6825 G1 X182.279 Y127.385 E2.42708
N6826 G1 X180.65 Y127.385 E.05236
N6827 M204 S10000
N6828 G1 X190.736 Y135.195 F60000
N6829 G1 F4421.739
N6830 M204 S8000
N6831 G1 X190.736 Y136.824 E.05236
N6832 G1 X159.264 Y145.256 E1.0477
N6833 G1 X159.264 Y144.702 E.01783
N6834 G1 X190.736 Y176.173 E1.43118
N6835 G1 X190.736 Y178.968 E.08987
N6836 G1 X159.264 Y187.4 E1.0477
N6837 G1 X159.264 Y190.758 E.10796
N6838 G1 X168.797 Y200.29 E.4335
N6839 G1 X171.172 Y200.29 E.07638
N6840 G1 X190.707 Y127.385 E2.42708
N6841 G1 X188.003 Y127.385 E.08696
N6842 G1 X190.736 Y130.117 E.12427
N6843 G1 X190.736 Y131.746 E.05236
N6844 M204 S10000
N6845 G1 X190.736 Y128.395 F60000
N6846 G1 F4421.739
N6847 M204 S8000
N6848 G1 X159.264 Y136.828 E1.0477
N6849 G1 X159.264 Y133.188 E.11704
N6850 G1 X190.736 Y164.659 E1.43118
N6851 G1 X190.736 Y162.11 E.08197
N6852 G1 X159.264 Y170.543 E1.0477
N6853 G1 X159.264 Y167.73 E.09045
N6854 G1 X190.736 Y199.201 E1.43118
N6855 G1 X190.736 Y195.825 E.10855
N6856 G1 X174.072 Y200.29 E.55474
N6857 G1 X172.444 Y200.29 E.05236
N6858 ; WIPE_START
N6859 G1 X174.072 Y200.29 E-.61876
N6860 G1 X174.431 Y200.194 E-.14124
N6861 ; WIPE_END
N6862 G1 E-.04 F1800
N6863 M204 S10000
N6864 G17
N6865 G3 Z3.8 I1.217 J0 P1  F60000
N6866 ; stop printing object, unique label id: 229
N6867 M625
N6868 ; object ids of layer 17 start: 229
N6869 M624 AQAAAAAAAAA=
N6870 ;======== H2D 20250527========
N6871 ; SKIPPABLE_START
N6872 ; SKIPTYPE: timelapse
N6873 M622.1 S1 ; for prev firware, default turned on
N6874 
N6875 M1002 judge_flag timelapse_record_flag
N6876 
N6877 M622 J1
N6878 M993 A2 B2 C2
N6879 M993 A0 B0 C0
N6880 
N6881 
N6882 
N6883 
N6884     M9711 M0 E1 X260 Y141 Z3.8 S11 C10 O0 T3000
N6885 
N6886 
N6887 
N6888 M993 A3 B3 C3
N6889 
N6890 M623
N6891 ; SKIPPABLE_END
N6892 
N6893 ; object ids of this layer17 end: 229
N6894 M625
N6895 ; CHANGE_LAYER
N6896 ; Z_HEIGHT: 3.6
N6897 ; LAYER_HEIGHT: 0.2
N6898 ;======== H2D 20250521========
N6899 ; layer num/total_layer_count: 18/63
N6900 ; update layer progress
N6901 M73 L18
N6902 M991 S0 P17 ;notify layer change
N6903 
N6904 
N6905 ; OBJECT_ID: 229
N6906 ; COOLING_NODE: 0
N6907 ; start printing object, unique label id: 229
N6908 M624 AQAAAAAAAAA=
N6909 G1 X191.084 Y200.639 F60000
N6910 G1 Z3.6
N6911 G1 E.8 F1800
N6912 ; FEATURE: Inner wall
N6913 ; LINE_WIDTH: 0.45
N6914 ; LAYER_HEIGHT: 0.2
N6915 G1 F4421.739
N6916 M204 S8000
N6917 G1 X158.916 Y200.639 E1.03439
N6918 G1 X158.916 Y127.036 E2.36678
N6919 G1 X191.084 Y127.036 E1.03439
N6920 G1 X191.084 Y200.579 E2.36485
N6921 ; COOLING_NODE: 0
N6922 M204 S10000
N6923 G1 X191.491 Y201.046 F60000
N6924 G1 F4421.739
N6925 M204 S8000
N6926 G1 X158.509 Y201.046 E1.06057
N6927 G1 X158.509 Y126.629 E2.39296
N6928 G1 X191.491 Y126.629 E1.06057
N6929 G1 X191.491 Y200.986 E2.39103
N6930 ; COOLING_NODE: 0
N6931 M204 S10000
N6932 G1 X191.898 Y201.453 F60000
N6933 G1 F4421.739
N6934 M204 S8000
N6935 G1 X158.102 Y201.453 E1.08675
N6936 G1 X158.102 Y126.222 E2.41914
N6937 G1 X191.898 Y126.222 E1.08675
N6938 G1 X191.898 Y201.393 E2.41721
N6939 ; COOLING_NODE: 0
N6940 M204 S10000
N6941 G1 X192.29 Y201.845 F60000
N6942 ; FEATURE: Outer wall
N6943 ; LINE_WIDTH: 0.42
N6944 G1 F4773.528
N6945 M204 S5000
N6946 G1 X157.71 Y201.845 E1.03002
N6947 M73 P52 R25
N6948 G1 X157.71 Y125.83 E2.26421
N6949 G1 X192.29 Y125.83 E1.03002
N6950 G1 X192.29 Y201.785 E2.26243
N6951 G1 E-.8 F1800
N6952 M204 S10000
N6953 G1 X186.255 Y200.29 Z4 F60000
N6954 G1 Z3.6
N6955 G1 E.8 F1800
N6956 ; FEATURE: Sparse infill
N6957 ; LINE_WIDTH: 0.45
N6958 G1 F4421.739
N6959 M204 S8000
N6960 G1 X187.884 Y200.29 E.05236
N6961 G1 X190.736 Y189.646 E.35435
N6962 G1 X190.736 Y188.018 E.05236
N6963 M204 S10000
N6964 G1 X190.736 Y169.057 F60000
N6965 G1 F4421.739
N6966 M204 S8000
N6967 G1 X190.736 Y170.685 E.05236
N6968 G1 X159.264 Y179.118 E1.0477
N6969 G1 X159.264 Y179.044 E.00239
N6970 G1 X180.511 Y200.29 E.96621
N6971 G1 X179.455 Y200.29 E.03397
N6972 G1 X190.736 Y158.19 E1.40156
N6973 G1 X190.736 Y156.561 E.05236
N6974 M204 S10000
N6975 G1 X164.972 Y127.385 F60000
N6976 G1 F4421.739
N6977 M204 S8000
N6978 G1 X163.596 Y127.385 E.04424
N6979 G1 X159.264 Y128.545 E.14419
N6980 G1 X159.264 Y130.174 E.05236
N6981 M204 S10000
N6982 G1 X159.264 Y151.443 F60000
N6983 G1 F4421.739
N6984 M204 S8000
N6985 G1 X159.264 Y149.815 E.05236
N6986 G1 X165.275 Y127.385 E.74671
N6987 G1 X165.175 Y127.385 E.0032
N6988 G1 X190.736 Y152.945 E1.16239
N6989 G1 X190.736 Y153.828 E.02838
N6990 G1 X159.264 Y162.26 E1.0477
N6991 G1 X159.264 Y160.632 E.05236
N6992 M204 S10000
N6993 G1 X159.264 Y182.9 F60000
N6994 G1 F4421.739
N6995 M204 S8000
N6996 G1 X159.264 Y181.271 E.05236
N6997 G1 X173.703 Y127.385 E1.79392
N6998 G1 X176.689 Y127.385 E.09601
N6999 G1 X190.736 Y141.431 E.63878
N7000 G1 X190.736 Y145.399 E.12759
N7001 G1 X159.264 Y153.832 E1.04769
N7002 G1 X159.264 Y156.016 E.07024
N7003 G1 X190.736 Y187.487 E1.43118
N7004 G1 X190.736 Y187.543 E.0018
N7005 G1 X159.264 Y195.976 E1.04769
N7006 G1 X159.264 Y200.29 E.13875
N7007 G1 X162.597 Y200.29 E.10717
N7008 G1 X182.132 Y127.385 E2.42708
N7009 G1 X188.203 Y127.385 E.19522
N7010 G1 X190.736 Y129.917 E.11517
N7011 G1 X190.736 Y136.97 E.2268
N7012 G1 X159.264 Y145.403 E1.0477
N7013 G1 X159.264 Y144.502 E.02897
N7014 G1 X190.736 Y175.973 E1.43118
N7015 G1 X190.736 Y179.114 E.10101
N7016 G1 X159.264 Y187.547 E1.0477
N7017 G1 X159.264 Y190.558 E.09682
N7018 G1 X168.997 Y200.29 E.4426
N7019 G1 X171.026 Y200.29 E.06524
N7020 G1 X190.561 Y127.385 E2.42708
N7021 G1 X190.736 Y127.385 E.00562
N7022 G1 X190.736 Y128.541 E.03719
N7023 G1 X159.264 Y136.974 E1.0477
N7024 G1 X159.264 Y132.988 E.12818
N7025 G1 X190.736 Y164.459 E1.43118
N7026 G1 X190.736 Y162.257 E.07083
N7027 G1 X159.264 Y170.689 E1.04769
N7028 G1 X159.264 Y167.53 E.10159
N7029 G1 X190.736 Y199.001 E1.43118
N7030 G1 X190.736 Y195.972 E.09741
N7031 G1 X174.618 Y200.29 E.53655
N7032 G1 X172.99 Y200.29 E.05236
N7033 ; WIPE_START
N7034 G1 X174.618 Y200.29 E-.61876
N7035 G1 X174.977 Y200.194 E-.14124
N7036 ; WIPE_END
N7037 G1 E-.04 F1800
N7038 M204 S10000
N7039 G17
N7040 G3 Z4 I1.217 J0 P1  F60000
N7041 ; stop printing object, unique label id: 229
N7042 M625
N7043 ; object ids of layer 18 start: 229
N7044 M624 AQAAAAAAAAA=
N7045 ;======== H2D 20250527========
N7046 ; SKIPPABLE_START
N7047 ; SKIPTYPE: timelapse
N7048 M622.1 S1 ; for prev firware, default turned on
N7049 
N7050 M1002 judge_flag timelapse_record_flag
N7051 
N7052 M622 J1
N7053 M993 A2 B2 C2
N7054 M993 A0 B0 C0
N7055 
N7056 
N7057 
N7058 
N7059     M9711 M0 E1 X260 Y141 Z4 S11 C10 O0 T3000
N7060 
N7061 
N7062 
N7063 M993 A3 B3 C3
N7064 
N7065 M623
N7066 ; SKIPPABLE_END
N7067 
N7068 ; object ids of this layer18 end: 229
N7069 M625
N7070 ; CHANGE_LAYER
N7071 ; Z_HEIGHT: 3.8
N7072 ; LAYER_HEIGHT: 0.2
N7073 ;======== H2D 20250521========
N7074 ; layer num/total_layer_count: 19/63
N7075 ; update layer progress
N7076 M73 L19
N7077 M991 S0 P18 ;notify layer change
N7078 
N7079 
N7080 ; OBJECT_ID: 229
N7081 ; COOLING_NODE: 0
N7082 ; start printing object, unique label id: 229
N7083 M624 AQAAAAAAAAA=
N7084 G1 X191.084 Y200.639 F60000
N7085 G1 Z3.8
N7086 G1 E.8 F1800
N7087 ; FEATURE: Inner wall
N7088 ; LINE_WIDTH: 0.45
N7089 ; LAYER_HEIGHT: 0.2
N7090 G1 F4421.739
N7091 M204 S8000
N7092 G1 X158.916 Y200.639 E1.03439
N7093 G1 X158.916 Y127.036 E2.36678
N7094 G1 X191.084 Y127.036 E1.03439
N7095 G1 X191.084 Y200.579 E2.36485
N7096 ; COOLING_NODE: 0
N7097 M204 S10000
N7098 G1 X191.491 Y201.046 F60000
N7099 G1 F4421.739
N7100 M204 S8000
N7101 G1 X158.509 Y201.046 E1.06057
N7102 G1 X158.509 Y126.629 E2.39296
N7103 G1 X191.491 Y126.629 E1.06057
N7104 G1 X191.491 Y200.986 E2.39103
N7105 ; COOLING_NODE: 0
N7106 M204 S10000
N7107 G1 X191.898 Y201.453 F60000
N7108 G1 F4421.739
N7109 M204 S8000
N7110 G1 X158.102 Y201.453 E1.08675
N7111 G1 X158.102 Y126.222 E2.41914
N7112 G1 X191.898 Y126.222 E1.08675
N7113 G1 X191.898 Y201.393 E2.41721
N7114 ; COOLING_NODE: 0
N7115 M204 S10000
N7116 G1 X192.29 Y201.845 F60000
N7117 ; FEATURE: Outer wall
N7118 ; LINE_WIDTH: 0.42
N7119 G1 F4773.528
N7120 M204 S5000
N7121 G1 X157.71 Y201.845 E1.03002
N7122 G1 X157.71 Y125.83 E2.26421
N7123 G1 X192.29 Y125.83 E1.03002
N7124 G1 X192.29 Y201.785 E2.26243
N7125 G1 E-.8 F1800
N7126 M204 S10000
N7127 G1 X186.109 Y200.29 Z4.2 F60000
N7128 G1 Z3.8
N7129 G1 E.8 F1800
N7130 ; FEATURE: Sparse infill
N7131 ; LINE_WIDTH: 0.45
N7132 G1 F4421.739
N7133 M204 S8000
N7134 G1 X187.737 Y200.29 E.05236
N7135 G1 X190.736 Y189.1 E.37254
N7136 G1 X190.736 Y187.893 E.03882
N7137 M204 S10000
N7138 G1 X190.736 Y169.203 F60000
N7139 G1 F4421.739
N7140 M204 S8000
N7141 G1 X190.736 Y170.832 E.05236
N7142 G1 X159.264 Y179.264 E1.0477
N7143 G1 X159.264 Y178.844 E.01353
N7144 G1 X180.711 Y200.29 E.9753
N7145 G1 X179.308 Y200.29 E.0451
N7146 G1 X190.736 Y157.643 E1.41975
N7147 G1 X190.736 Y156.015 E.05236
N7148 M204 S10000
N7149 G1 X190.736 Y147.174 F60000
N7150 G1 F4421.739
N7151 M204 S8000
N7152 G1 X190.736 Y145.545 E.05236
N7153 G1 X159.264 Y153.978 E1.04769
N7154 G1 X159.264 Y155.816 E.0591
N7155 G1 X190.736 Y187.287 E1.43118
N7156 G1 X190.736 Y187.689 E.01294
N7157 G1 X159.264 Y196.122 E1.0477
N7158 G1 X159.264 Y200.29 E.13404
N7159 G1 X162.451 Y200.29 E.10246
N7160 G1 X181.986 Y127.385 E2.42708
N7161 M73 P53 R25
N7162 G1 X183.614 Y127.385 E.05236
N7163 M204 S10000
N7164 G1 X164.925 Y127.385 F60000
N7165 G1 F4421.739
N7166 M204 S8000
N7167 G1 X164.142 Y127.385 E.02516
N7168 G1 X159.264 Y128.692 E.16238
N7169 G1 X159.264 Y132.788 E.13172
N7170 G1 X190.736 Y164.259 E1.43118
N7171 G1 X190.736 Y162.403 E.05969
N7172 G1 X159.264 Y170.836 E1.0477
N7173 G1 X159.264 Y167.33 E.11273
N7174 G1 X190.736 Y198.801 E1.43118
N7175 G1 X190.736 Y196.118 E.08627
N7176 G1 X175.165 Y200.29 E.51836
N7177 G1 X173.536 Y200.29 E.05236
N7178 M204 S10000
N7179 G1 X159.264 Y182.353 F60000
N7180 G1 F4421.739
N7181 M204 S8000
N7182 G1 X159.264 Y180.725 E.05236
N7183 G1 X173.557 Y127.385 E1.77573
N7184 G1 X176.889 Y127.385 E.10715
N7185 G1 X190.736 Y141.231 E.62968
N7186 G1 X190.736 Y137.117 E.13231
N7187 G1 X159.264 Y145.549 E1.0477
N7188 G1 X159.264 Y144.302 E.04011
N7189 G1 X190.736 Y175.773 E1.43118
N7190 G1 X190.736 Y179.261 E.11215
N7191 G1 X159.264 Y187.693 E1.0477
N7192 G1 X159.264 Y190.358 E.08568
N7193 G1 X169.197 Y200.29 E.45169
N7194 G1 X170.88 Y200.29 E.0541
N7195 G1 X190.415 Y127.385 E2.42708
N7196 G1 X188.403 Y127.385 E.06468
N7197 G1 X190.736 Y129.717 E.10608
N7198 G1 X190.736 Y128.688 E.0331
N7199 M73 P53 R24
N7200 G1 X159.264 Y137.12 E1.0477
N7201 G1 X159.264 Y138.749 E.05236
N7202 M204 S10000
N7203 G1 X159.264 Y150.896 F60000
N7204 G1 F4421.739
N7205 M204 S8000
N7206 G1 X159.264 Y149.268 E.05236
N7207 G1 X165.128 Y127.385 E.72852
N7208 G1 X165.375 Y127.385 E.00794
N7209 G1 X190.736 Y152.745 E1.15329
N7210 G1 X190.736 Y153.974 E.03952
N7211 G1 X159.264 Y162.407 E1.0477
N7212 G1 X159.264 Y160.778 E.05236
N7213 ; WIPE_START
N7214 G1 X159.264 Y162.407 E-.61876
N7215 G1 X159.623 Y162.311 E-.14124
N7216 ; WIPE_END
N7217 G1 E-.04 F1800
N7218 M204 S10000
N7219 G17
N7220 G3 Z4.2 I1.217 J0 P1  F60000
N7221 ; stop printing object, unique label id: 229
N7222 M625
N7223 ; object ids of layer 19 start: 229
N7224 M624 AQAAAAAAAAA=
N7225 ;======== H2D 20250527========
N7226 ; SKIPPABLE_START
N7227 ; SKIPTYPE: timelapse
N7228 M622.1 S1 ; for prev firware, default turned on
N7229 
N7230 M1002 judge_flag timelapse_record_flag
N7231 
N7232 M622 J1
N7233 M993 A2 B2 C2
N7234 M993 A0 B0 C0
N7235 
N7236 
N7237 
N7238 
N7239     M9711 M0 E1 X260 Y141 Z4.2 S11 C10 O0 T3000
N7240 
N7241 
N7242 
N7243 M993 A3 B3 C3
N7244 
N7245 M623
N7246 ; SKIPPABLE_END
N7247 
N7248 ; object ids of this layer19 end: 229
N7249 M625
N7250 ; CHANGE_LAYER
N7251 ; Z_HEIGHT: 4
N7252 ; LAYER_HEIGHT: 0.2
N7253 ;======== H2D 20250521========
N7254 ; layer num/total_layer_count: 20/63
N7255 ; update layer progress
N7256 M73 L20
N7257 M991 S0 P19 ;notify layer change
N7258 
N7259 
N7260 ; OBJECT_ID: 229
N7261 ; COOLING_NODE: 0
N7262 ; start printing object, unique label id: 229
N7263 M624 AQAAAAAAAAA=
N7264 G1 X191.084 Y200.639 F60000
N7265 G1 Z4
N7266 G1 E.8 F1800
N7267 ; FEATURE: Inner wall
N7268 ; LINE_WIDTH: 0.45
N7269 ; LAYER_HEIGHT: 0.2
N7270 G1 F4421.739
N7271 M204 S8000
N7272 G1 X158.916 Y200.639 E1.03439
N7273 G1 X158.916 Y127.036 E2.36678
N7274 G1 X191.084 Y127.036 E1.03439
N7275 G1 X191.084 Y200.579 E2.36485
N7276 ; COOLING_NODE: 0
N7277 M204 S10000
N7278 G1 X191.491 Y201.046 F60000
N7279 G1 F4421.739
N7280 M204 S8000
N7281 G1 X158.509 Y201.046 E1.06057
N7282 G1 X158.509 Y126.629 E2.39296
N7283 G1 X191.491 Y126.629 E1.06057
N7284 G1 X191.491 Y200.986 E2.39103
N7285 ; COOLING_NODE: 0
N7286 M204 S10000
N7287 G1 X191.898 Y201.453 F60000
N7288 G1 F4421.739
N7289 M204 S8000
N7290 G1 X158.102 Y201.453 E1.08675
N7291 G1 X158.102 Y126.222 E2.41914
N7292 G1 X191.898 Y126.222 E1.08675
N7293 G1 X191.898 Y201.393 E2.41721
N7294 ; COOLING_NODE: 0
N7295 M204 S10000
N7296 G1 X192.29 Y201.845 F60000
N7297 ; FEATURE: Outer wall
N7298 ; LINE_WIDTH: 0.42
N7299 G1 F4773.528
N7300 M204 S5000
N7301 G1 X157.71 Y201.845 E1.03002
N7302 G1 X157.71 Y125.83 E2.26421
N7303 G1 X192.29 Y125.83 E1.03002
N7304 G1 X192.29 Y201.785 E2.26243
N7305 G1 E-.8 F1800
N7306 M204 S10000
N7307 G1 X185.962 Y200.29 Z4.4 F60000
N7308 G1 Z4
N7309 G1 E.8 F1800
N7310 ; FEATURE: Sparse infill
N7311 ; LINE_WIDTH: 0.45
N7312 G1 F4421.739
N7313 M204 S8000
N7314 G1 X187.591 Y200.29 E.05236
N7315 G1 X190.736 Y188.554 E.39073
N7316 G1 X190.736 Y187.836 E.02308
N7317 G1 X159.264 Y196.268 E1.0477
N7318 G1 X159.264 Y200.29 E.12933
N7319 G1 X162.304 Y200.29 E.09775
N7320 G1 X181.839 Y127.385 E2.42708
N7321 G1 X183.468 Y127.385 E.05236
N7322 M204 S10000
N7323 G1 X190.736 Y169.35 F60000
N7324 G1 F4421.739
N7325 M204 S8000
N7326 G1 X190.736 Y170.978 E.05236
N7327 G1 X159.264 Y179.411 E1.0477
N7328 M204 S10000
N7329 G1 X159.264 Y177.015 F60000
N7330 G1 F4421.739
N7331 M204 S8000
N7332 G1 X159.264 Y178.644 E.05236
N7333 G1 X180.911 Y200.29 E.9844
N7334 G1 X179.162 Y200.29 E.05624
N7335 G1 X190.736 Y157.097 E1.43794
N7336 G1 X190.736 Y155.469 E.05236
N7337 M204 S10000
N7338 G1 X190.736 Y147.32 F60000
N7339 G1 F4421.739
N7340 M204 S8000
N7341 G1 X190.736 Y145.692 E.05236
N7342 G1 X159.264 Y154.124 E1.0477
N7343 G1 X159.264 Y155.616 E.04796
N7344 G1 X190.736 Y187.087 E1.43118
N7345 G1 X190.736 Y185.459 E.05236
N7346 M204 S10000
N7347 G1 X174.083 Y200.29 F60000
N7348 G1 F4421.739
N7349 M204 S8000
N7350 G1 X175.711 Y200.29 E.05236
N7351 G1 X190.736 Y196.265 E.50017
N7352 G1 X190.736 Y198.601 E.07513
N7353 G1 X159.264 Y167.13 E1.43118
N7354 G1 X159.264 Y170.982 E.12387
N7355 G1 X190.736 Y162.549 E1.0477
N7356 G1 X190.736 Y164.059 E.04855
N7357 G1 X159.264 Y132.588 E1.43118
N7358 G1 X159.264 Y128.838 E.12059
N7359 G1 X164.688 Y127.385 E.18057
N7360 G1 X164.982 Y127.385 E.00943
N7361 G1 X159.264 Y148.722 E.71033
N7362 G1 X159.264 Y150.35 E.05236
N7363 M204 S10000
N7364 G1 X159.264 Y160.925 F60000
N7365 G1 F4421.739
N7366 M204 S8000
N7367 G1 X159.264 Y162.553 E.05236
N7368 G1 X190.736 Y154.121 E1.0477
N7369 G1 X190.736 Y152.545 E.05066
N7370 G1 X165.575 Y127.385 E1.1442
N7371 G1 X167.203 Y127.385 E.05236
N7372 M204 S10000
N7373 G1 X159.264 Y138.895 F60000
N7374 G1 F4421.739
N7375 M204 S8000
N7376 G1 X159.264 Y137.267 E.05236
N7377 G1 X190.736 Y128.834 E1.0477
N7378 G1 X190.736 Y129.517 E.02197
N7379 G1 X188.603 Y127.385 E.09698
N7380 G1 X190.268 Y127.385 E.05354
N7381 G1 X170.733 Y200.29 E2.42708
N7382 G1 X169.397 Y200.29 E.04296
N7383 G1 X159.264 Y190.158 E.46079
N7384 G1 X159.264 Y187.84 E.07454
N7385 M73 P54 R24
N7386 G1 X190.736 Y179.407 E1.0477
N7387 G1 X190.736 Y175.573 E.12328
N7388 G1 X159.264 Y144.102 E1.43118
N7389 G1 X159.264 Y145.696 E.05125
N7390 G1 X190.736 Y137.263 E1.0477
N7391 G1 X190.736 Y141.031 E.12117
N7392 G1 X177.089 Y127.385 E.62059
N7393 G1 X173.411 Y127.385 E.11829
N7394 G1 X159.264 Y180.178 E1.75754
N7395 G1 X159.264 Y181.807 E.05236
N7396 ; WIPE_START
N7397 G1 X159.264 Y180.178 E-.61876
N7398 G1 X159.361 Y179.819 E-.14124
N7399 ; WIPE_END
N7400 G1 E-.04 F1800
N7401 M204 S10000
N7402 G17
N7403 G3 Z4.4 I1.217 J0 P1  F60000
N7404 ; stop printing object, unique label id: 229
N7405 M625
N7406 ; object ids of layer 20 start: 229
N7407 M624 AQAAAAAAAAA=
N7408 ;======== H2D 20250527========
N7409 ; SKIPPABLE_START
N7410 ; SKIPTYPE: timelapse
N7411 M622.1 S1 ; for prev firware, default turned on
N7412 
N7413 M1002 judge_flag timelapse_record_flag
N7414 
N7415 M622 J1
N7416 M993 A2 B2 C2
N7417 M993 A0 B0 C0
N7418 
N7419 
N7420 
N7421 
N7422     M9711 M0 E1 X260 Y141 Z4.4 S11 C10 O0 T3000
N7423 
N7424 
N7425 
N7426 M993 A3 B3 C3
N7427 
N7428 M623
N7429 ; SKIPPABLE_END
N7430 
N7431 ; object ids of this layer20 end: 229
N7432 M625
N7433 ; CHANGE_LAYER
N7434 ; Z_HEIGHT: 4.2
N7435 ; LAYER_HEIGHT: 0.2
N7436 ;======== H2D 20250521========
N7437 ; layer num/total_layer_count: 21/63
N7438 ; update layer progress
N7439 M73 L21
N7440 M991 S0 P20 ;notify layer change
N7441 
N7442 
N7443 ; OBJECT_ID: 229
N7444 ; COOLING_NODE: 0
N7445 ; start printing object, unique label id: 229
N7446 M624 AQAAAAAAAAA=
N7447 G1 X191.084 Y200.639 F60000
N7448 G1 Z4.2
N7449 G1 E.8 F1800
N7450 ; FEATURE: Inner wall
N7451 ; LINE_WIDTH: 0.45
N7452 ; LAYER_HEIGHT: 0.2
N7453 G1 F4421.739
N7454 M204 S8000
N7455 G1 X158.916 Y200.639 E1.03439
N7456 G1 X158.916 Y127.036 E2.36678
N7457 G1 X191.084 Y127.036 E1.03439
N7458 G1 X191.084 Y200.579 E2.36485
N7459 ; COOLING_NODE: 0
N7460 M204 S10000
N7461 G1 X191.491 Y201.046 F60000
N7462 G1 F4421.739
N7463 M204 S8000
N7464 G1 X158.509 Y201.046 E1.06057
N7465 G1 X158.509 Y126.629 E2.39296
N7466 G1 X191.491 Y126.629 E1.06057
N7467 G1 X191.491 Y200.986 E2.39103
N7468 ; COOLING_NODE: 0
N7469 M204 S10000
N7470 G1 X191.898 Y201.453 F60000
N7471 G1 F4421.739
N7472 M204 S8000
N7473 G1 X158.102 Y201.453 E1.08675
N7474 G1 X158.102 Y126.222 E2.41914
N7475 G1 X191.898 Y126.222 E1.08675
N7476 G1 X191.898 Y201.393 E2.41721
N7477 ; COOLING_NODE: 0
N7478 M204 S10000
N7479 G1 X192.29 Y201.845 F60000
N7480 ; FEATURE: Outer wall
N7481 ; LINE_WIDTH: 0.42
N7482 G1 F4773.528
N7483 M204 S5000
N7484 G1 X157.71 Y201.845 E1.03002
N7485 G1 X157.71 Y125.83 E2.26421
N7486 G1 X192.29 Y125.83 E1.03002
N7487 G1 X192.29 Y201.785 E2.26243
N7488 G1 E-.8 F1800
N7489 M204 S10000
N7490 G1 X185.816 Y200.29 Z4.6 F60000
N7491 G1 Z4.2
N7492 G1 E.8 F1800
N7493 ; FEATURE: Sparse infill
N7494 ; LINE_WIDTH: 0.45
N7495 G1 F4421.739
N7496 M204 S8000
N7497 G1 X187.444 Y200.29 E.05236
N7498 G1 X190.736 Y187.982 E.40969
N7499 G1 X159.264 Y196.415 E1.0477
N7500 G1 X159.264 Y200.29 E.12462
N7501 G1 X162.158 Y200.29 E.09304
N7502 G1 X181.693 Y127.385 E2.42708
N7503 G1 X183.321 Y127.385 E.05236
N7504 M204 S10000
N7505 G1 X164.835 Y127.385 F60000
N7506 G1 F4421.739
N7507 M204 S8000
N7508 G1 X159.264 Y148.175 E.69214
N7509 G1 X159.264 Y149.804 E.05236
N7510 M204 S10000
N7511 G1 X159.264 Y139.042 F60000
N7512 G1 F4421.739
N7513 M204 S8000
N7514 G1 X159.264 Y137.413 E.05236
N7515 G1 X190.736 Y128.981 E1.0477
N7516 G1 X190.736 Y129.317 E.01083
N7517 G1 X188.803 Y127.385 E.08789
N7518 G1 X190.122 Y127.385 E.04241
N7519 G1 X170.587 Y200.29 E2.42708
N7520 G1 X169.597 Y200.29 E.03182
N7521 G1 X159.264 Y189.958 E.46988
N7522 G1 X159.264 Y187.986 E.0634
N7523 G1 X190.736 Y179.553 E1.0477
N7524 G1 X190.736 Y175.373 E.13442
N7525 G1 X159.264 Y143.902 E1.43118
N7526 G1 X159.264 Y145.842 E.06239
N7527 G1 X190.736 Y137.409 E1.0477
N7528 G1 X190.736 Y140.831 E.11003
N7529 G1 X177.289 Y127.385 E.61149
N7530 G1 X173.264 Y127.385 E.12943
N7531 G1 X159.264 Y179.632 E1.73935
N7532 G1 X159.264 Y179.557 E.00241
N7533 G1 X190.736 Y171.125 E1.0477
N7534 G1 X190.736 Y169.496 E.05236
N7535 M204 S10000
N7536 G1 X190.736 Y185.259 F60000
N7537 G1 F4421.739
N7538 M204 S8000
N7539 G1 X190.736 Y186.887 E.05236
N7540 G1 X159.264 Y155.416 E1.43118
N7541 G1 X159.264 Y154.271 E.03682
N7542 G1 X190.736 Y145.838 E1.0477
N7543 G1 X190.736 Y147.466 E.05236
N7544 M204 S10000
N7545 G1 X190.736 Y154.922 F60000
N7546 G1 F4421.739
N7547 M204 S8000
N7548 G1 X190.736 Y156.55 E.05236
N7549 G1 X179.015 Y200.29 E1.45613
N7550 G1 X181.111 Y200.29 E.06738
N7551 G1 X159.264 Y178.444 E.99349
N7552 M204 S10000
N7553 G1 X159.264 Y161.071 F60000
N7554 G1 F4421.739
N7555 M204 S8000
N7556 G1 X159.264 Y162.7 E.05236
N7557 G1 X190.736 Y154.267 E1.04769
N7558 G1 X190.736 Y152.345 E.0618
N7559 G1 X165.775 Y127.385 E1.1351
N7560 G1 X165.235 Y127.385 E.01737
N7561 G1 X159.264 Y128.984 E.19876
N7562 G1 X159.264 Y132.388 E.10945
N7563 G1 X190.736 Y163.859 E1.43118
N7564 G1 X190.736 Y162.696 E.03741
N7565 G1 X159.264 Y171.128 E1.0477
N7566 G1 X159.264 Y166.93 E.13501
N7567 G1 X190.736 Y198.401 E1.43118
N7568 G1 X190.736 Y196.411 E.06399
N7569 G1 X176.258 Y200.29 E.48198
N7570 G1 X174.629 Y200.29 E.05236
N7571 ; WIPE_START
N7572 G1 X176.258 Y200.29 E-.61876
N7573 G1 X176.617 Y200.194 E-.14124
N7574 ; WIPE_END
N7575 G1 E-.04 F1800
N7576 M204 S10000
N7577 G17
N7578 G3 Z4.6 I1.217 J0 P1  F60000
N7579 ; stop printing object, unique label id: 229
N7580 M625
N7581 ; object ids of layer 21 start: 229
N7582 M624 AQAAAAAAAAA=
N7583 ;======== H2D 20250527========
N7584 ; SKIPPABLE_START
N7585 ; SKIPTYPE: timelapse
N7586 M622.1 S1 ; for prev firware, default turned on
N7587 
N7588 M1002 judge_flag timelapse_record_flag
N7589 
N7590 M622 J1
N7591 M993 A2 B2 C2
N7592 M993 A0 B0 C0
N7593 
N7594 
N7595 
N7596 
N7597     M9711 M0 E1 X260 Y141 Z4.6 S11 C10 O0 T3000
N7598 
N7599 
N7600 
N7601 M993 A3 B3 C3
N7602 
N7603 M623
N7604 ; SKIPPABLE_END
N7605 
N7606 ; object ids of this layer21 end: 229
N7607 M625
N7608 ; CHANGE_LAYER
N7609 ; Z_HEIGHT: 4.4
N7610 ; LAYER_HEIGHT: 0.2
N7611 ;======== H2D 20250521========
N7612 ; layer num/total_layer_count: 22/63
N7613 ; update layer progress
N7614 M73 L22
N7615 M991 S0 P21 ;notify layer change
N7616 
N7617 
N7618 ; OBJECT_ID: 229
N7619 ; COOLING_NODE: 0
N7620 ; start printing object, unique label id: 229
N7621 M624 AQAAAAAAAAA=
N7622 G1 X191.084 Y200.639 F60000
N7623 G1 Z4.4
N7624 G1 E.8 F1800
N7625 ; FEATURE: Inner wall
N7626 ; LINE_WIDTH: 0.45
N7627 ; LAYER_HEIGHT: 0.2
N7628 G1 F4421.739
N7629 M204 S8000
N7630 G1 X158.916 Y200.639 E1.03439
N7631 G1 X158.916 Y127.036 E2.36678
N7632 G1 X191.084 Y127.036 E1.03439
N7633 G1 X191.084 Y200.579 E2.36485
N7634 ; COOLING_NODE: 0
N7635 M204 S10000
N7636 G1 X191.491 Y201.046 F60000
N7637 G1 F4421.739
N7638 M204 S8000
N7639 G1 X158.509 Y201.046 E1.06057
N7640 G1 X158.509 Y126.629 E2.39296
N7641 G1 X191.491 Y126.629 E1.06057
N7642 G1 X191.491 Y200.986 E2.39103
N7643 ; COOLING_NODE: 0
N7644 M204 S10000
N7645 G1 X191.898 Y201.453 F60000
N7646 M73 P55 R24
N7647 G1 F4421.739
N7648 M204 S8000
N7649 G1 X158.102 Y201.453 E1.08675
N7650 G1 X158.102 Y126.222 E2.41914
N7651 G1 X191.898 Y126.222 E1.08675
N7652 G1 X191.898 Y201.393 E2.41721
N7653 ; COOLING_NODE: 0
N7654 M204 S10000
N7655 G1 X192.29 Y201.845 F60000
N7656 ; FEATURE: Outer wall
N7657 ; LINE_WIDTH: 0.42
N7658 M73 P55 R23
N7659 G1 F4773.528
N7660 M204 S5000
N7661 G1 X157.71 Y201.845 E1.03002
N7662 G1 X157.71 Y125.83 E2.26421
N7663 G1 X192.29 Y125.83 E1.03002
N7664 G1 X192.29 Y201.785 E2.26243
N7665 G1 E-.8 F1800
N7666 M204 S10000
N7667 G1 X185.67 Y200.29 Z4.8 F60000
N7668 G1 Z4.4
N7669 G1 E.8 F1800
N7670 ; FEATURE: Sparse infill
N7671 ; LINE_WIDTH: 0.45
N7672 G1 F4421.739
N7673 M204 S8000
N7674 G1 X187.298 Y200.29 E.05236
N7675 G1 X190.736 Y187.461 E.42711
N7676 G1 X190.736 Y186.687 E.02488
N7677 G1 X159.264 Y155.216 E1.43118
N7678 G1 X159.264 Y154.417 E.02568
N7679 G1 X190.736 Y145.985 E1.0477
N7680 G1 X190.736 Y152.145 E.1981
N7681 G1 X165.975 Y127.385 E1.12601
N7682 G1 X165.781 Y127.385 E.00623
N7683 G1 X159.264 Y129.131 E.21695
N7684 G1 X159.264 Y132.188 E.09831
N7685 G1 X190.736 Y163.659 E1.43118
N7686 G1 X190.736 Y162.842 E.02627
N7687 G1 X159.264 Y171.275 E1.0477
N7688 G1 X159.264 Y172.903 E.05236
N7689 M204 S10000
N7690 G1 X159.264 Y178.244 F60000
N7691 G1 F4421.739
N7692 M204 S8000
N7693 G1 X181.311 Y200.29 E1.00259
N7694 G1 X178.869 Y200.29 E.07852
N7695 G1 X190.736 Y156.004 E1.47432
N7696 G1 X190.736 Y154.413 E.05115
N7697 G1 X159.264 Y162.846 E1.04769
N7698 G1 X159.264 Y166.73 E.12489
N7699 G1 X190.736 Y198.201 E1.43118
N7700 G1 X190.736 Y196.557 E.05285
N7701 G1 X176.804 Y200.29 E.46379
N7702 G1 X175.176 Y200.29 E.05236
N7703 M204 S10000
N7704 G1 X159.264 Y149.257 F60000
N7705 G1 F4421.739
N7706 M204 S8000
N7707 G1 X159.264 Y147.629 E.05236
N7708 G1 X164.689 Y127.385 E.67395
N7709 M204 S10000
N7710 G1 X171.489 Y127.385 F60000
N7711 G1 F4421.739
N7712 M204 S8000
N7713 G1 X173.118 Y127.385 E.05236
N7714 G1 X159.264 Y179.086 E1.72116
N7715 G1 X159.264 Y179.704 E.01987
N7716 G1 X190.736 Y171.271 E1.0477
N7717 G1 X190.736 Y175.173 E.12548
N7718 G1 X159.264 Y143.702 E1.43118
N7719 G1 X159.264 Y145.988 E.07353
N7720 G1 X190.736 Y137.556 E1.0477
N7721 G1 X190.736 Y140.631 E.09889
N7722 G1 X177.489 Y127.385 E.6024
N7723 G1 X181.546 Y127.385 E.13047
N7724 G1 X162.011 Y200.29 E2.42708
N7725 G1 X159.264 Y200.29 E.08833
N7726 G1 X159.264 Y196.561 E.11991
N7727 G1 X190.736 Y188.129 E1.0477
N7728 M204 S10000
N7729 G1 X190.736 Y181.328 F60000
N7730 G1 F4421.739
N7731 M204 S8000
N7732 G1 X190.736 Y179.7 E.05236
N7733 G1 X159.264 Y188.132 E1.04769
N7734 G1 X159.264 Y189.758 E.05227
N7735 G1 X169.797 Y200.29 E.47898
N7736 G1 X170.44 Y200.29 E.02069
N7737 G1 X189.975 Y127.385 E2.42708
N7738 G1 X189.003 Y127.385 E.03127
N7739 G1 X190.736 Y129.127 E.07901
N7740 G1 X159.264 Y137.56 E1.0477
N7741 G1 X159.264 Y139.188 E.05236
N7742 ; WIPE_START
N7743 G1 X159.264 Y137.56 E-.61876
N7744 G1 X159.623 Y137.463 E-.14124
N7745 ; WIPE_END
N7746 G1 E-.04 F1800
N7747 M204 S10000
N7748 G17
N7749 G3 Z4.8 I1.217 J0 P1  F60000
N7750 ; stop printing object, unique label id: 229
N7751 M625
N7752 ; object ids of layer 22 start: 229
N7753 M624 AQAAAAAAAAA=
N7754 ;======== H2D 20250527========
N7755 ; SKIPPABLE_START
N7756 ; SKIPTYPE: timelapse
N7757 M622.1 S1 ; for prev firware, default turned on
N7758 
N7759 M1002 judge_flag timelapse_record_flag
N7760 
N7761 M622 J1
N7762 M993 A2 B2 C2
N7763 M993 A0 B0 C0
N7764 
N7765 
N7766 
N7767 
N7768     M9711 M0 E1 X260 Y141 Z4.8 S11 C10 O0 T3000
N7769 
N7770 
N7771 
N7772 M993 A3 B3 C3
N7773 
N7774 M623
N7775 ; SKIPPABLE_END
N7776 
N7777 ; object ids of this layer22 end: 229
N7778 M625
N7779 ; CHANGE_LAYER
N7780 ; Z_HEIGHT: 4.6
N7781 ; LAYER_HEIGHT: 0.2
N7782 ;======== H2D 20250521========
N7783 ; layer num/total_layer_count: 23/63
N7784 ; update layer progress
N7785 M73 L23
N7786 M991 S0 P22 ;notify layer change
N7787 
N7788 
N7789 ; OBJECT_ID: 229
N7790 ; COOLING_NODE: 0
N7791 ; start printing object, unique label id: 229
N7792 M624 AQAAAAAAAAA=
N7793 G1 X191.084 Y200.639 F60000
N7794 G1 Z4.6
N7795 G1 E.8 F1800
N7796 ; FEATURE: Inner wall
N7797 ; LINE_WIDTH: 0.45
N7798 ; LAYER_HEIGHT: 0.2
N7799 G1 F4421.739
N7800 M204 S8000
N7801 G1 X158.916 Y200.639 E1.03439
N7802 G1 X158.916 Y127.036 E2.36678
N7803 G1 X191.084 Y127.036 E1.03439
N7804 G1 X191.084 Y200.579 E2.36485
N7805 ; COOLING_NODE: 0
N7806 M204 S10000
N7807 G1 X191.491 Y201.046 F60000
N7808 G1 F4421.739
N7809 M204 S8000
N7810 G1 X158.509 Y201.046 E1.06057
N7811 G1 X158.509 Y126.629 E2.39296
N7812 G1 X191.491 Y126.629 E1.06057
N7813 G1 X191.491 Y200.986 E2.39103
N7814 ; COOLING_NODE: 0
N7815 M204 S10000
N7816 G1 X191.898 Y201.453 F60000
N7817 G1 F4421.739
N7818 M204 S8000
N7819 G1 X158.102 Y201.453 E1.08675
N7820 G1 X158.102 Y126.222 E2.41914
N7821 G1 X191.898 Y126.222 E1.08675
N7822 G1 X191.898 Y201.393 E2.41721
N7823 ; COOLING_NODE: 0
N7824 M204 S10000
N7825 G1 X192.29 Y201.845 F60000
N7826 ; FEATURE: Outer wall
N7827 ; LINE_WIDTH: 0.42
N7828 G1 F4773.528
N7829 M204 S5000
N7830 G1 X157.71 Y201.845 E1.03002
N7831 G1 X157.71 Y125.83 E2.26421
N7832 G1 X192.29 Y125.83 E1.03002
N7833 G1 X192.29 Y201.785 E2.26243
N7834 G1 E-.8 F1800
N7835 M204 S10000
N7836 G1 X188.78 Y200.29 Z5 F60000
N7837 M73 P56 R23
N7838 G1 Z4.6
N7839 G1 E.8 F1800
N7840 ; FEATURE: Sparse infill
N7841 ; LINE_WIDTH: 0.45
N7842 G1 F4421.739
N7843 M204 S8000
N7844 G1 X187.151 Y200.29 E.05236
N7845 G1 X190.736 Y186.914 E.4453
N7846 G1 X190.736 Y186.487 E.01374
N7847 G1 X159.264 Y155.016 E1.43118
N7848 G1 X159.264 Y154.564 E.01454
N7849 G1 X190.736 Y146.131 E1.0477
N7850 G1 X190.736 Y151.945 E.18696
N7851 G1 X166.175 Y127.385 E1.11691
N7852 G1 X166.328 Y127.385 E.00491
N7853 G1 X159.264 Y129.277 E.23514
N7854 G1 X159.264 Y131.988 E.08717
N7855 G1 X190.736 Y163.459 E1.43118
N7856 G1 X190.736 Y162.989 E.01513
N7857 G1 X159.264 Y171.421 E1.0477
N7858 G1 X159.264 Y173.05 E.05236
N7859 M204 S10000
N7860 G1 X159.264 Y178.044 F60000
N7861 G1 F4421.739
N7862 M204 S8000
N7863 G1 X181.511 Y200.29 E1.01168
N7864 G1 X178.723 Y200.29 E.08966
N7865 G1 X190.736 Y155.458 E1.49251
N7866 G1 X190.736 Y154.56 E.02887
N7867 G1 X159.264 Y162.992 E1.0477
N7868 G1 X159.264 Y166.53 E.11375
N7869 G1 X190.736 Y198.001 E1.43118
N7870 G1 X190.736 Y196.704 E.04171
N7871 G1 X177.35 Y200.29 E.4456
N7872 G1 X175.722 Y200.29 E.05236
N7873 M204 S10000
N7874 G1 X171.343 Y127.385 F60000
N7875 G1 F4421.739
N7876 M204 S8000
N7877 G1 X172.971 Y127.385 E.05236
N7878 G1 X159.264 Y178.539 E1.70297
N7879 G1 X159.264 Y179.85 E.04215
N7880 G1 X190.736 Y171.417 E1.0477
N7881 G1 X190.736 Y174.973 E.11434
N7882 G1 X159.264 Y143.502 E1.43118
N7883 G1 X159.264 Y137.706 E.18637
N7884 G1 X190.736 Y129.273 E1.0477
N7885 G1 X190.736 Y128.917 E.01145
N7886 G1 X189.203 Y127.385 E.06969
N7887 G1 X189.829 Y127.385 E.02013
N7888 G1 X170.294 Y200.29 E2.42708
N7889 G1 X169.997 Y200.29 E.00955
N7890 G1 X159.264 Y189.558 E.48807
N7891 G1 X159.264 Y188.279 E.04112
N7892 G1 X190.736 Y179.846 E1.0477
N7893 G1 X190.736 Y181.474 E.05236
N7894 M204 S10000
N7895 G1 X190.736 Y189.903 F60000
N7896 G1 F4421.739
N7897 M204 S8000
N7898 G1 X190.736 Y188.275 E.05236
N7899 G1 X159.264 Y196.708 E1.0477
N7900 G1 X159.264 Y200.29 E.11521
N7901 G1 X161.865 Y200.29 E.08363
N7902 G1 X181.4 Y127.385 E2.42708
N7903 G1 X177.689 Y127.385 E.11933
N7904 G1 X190.736 Y140.431 E.5933
N7905 G1 X190.736 Y137.702 E.08775
N7906 G1 X159.264 Y146.135 E1.04769
N7907 M204 S10000
N7908 G1 X159.264 Y148.711 F60000
N7909 G1 F4421.739
N7910 M204 S8000
N7911 G1 X159.264 Y147.083 E.05236
N7912 G1 X164.542 Y127.385 E.65576
N7913 G1 X162.914 Y127.385 E.05236
N7914 ; WIPE_START
N7915 G1 X164.542 Y127.385 E-.61876
N7916 G1 X164.446 Y127.744 E-.14124
N7917 ; WIPE_END
N7918 G1 E-.04 F1800
N7919 M204 S10000
N7920 G17
N7921 G3 Z5 I1.217 J0 P1  F60000
N7922 ; stop printing object, unique label id: 229
N7923 M625
N7924 ; object ids of layer 23 start: 229
N7925 M624 AQAAAAAAAAA=
N7926 ;======== H2D 20250527========
N7927 ; SKIPPABLE_START
N7928 ; SKIPTYPE: timelapse
N7929 M622.1 S1 ; for prev firware, default turned on
N7930 
N7931 M1002 judge_flag timelapse_record_flag
N7932 
N7933 M622 J1
N7934 M993 A2 B2 C2
N7935 M993 A0 B0 C0
N7936 
N7937 
N7938 
N7939 
N7940     M9711 M0 E1 X260 Y141 Z5 S11 C10 O0 T3000
N7941 
N7942 
N7943 
N7944 M993 A3 B3 C3
N7945 
N7946 M623
N7947 ; SKIPPABLE_END
N7948 
N7949 ; object ids of this layer23 end: 229
N7950 M625
N7951 ; CHANGE_LAYER
N7952 ; Z_HEIGHT: 4.8
N7953 ; LAYER_HEIGHT: 0.2
N7954 ;======== H2D 20250521========
N7955 ; layer num/total_layer_count: 24/63
N7956 ; update layer progress
N7957 M73 L24
N7958 M991 S0 P23 ;notify layer change
N7959 
N7960 
N7961 ; OBJECT_ID: 229
N7962 ; COOLING_NODE: 0
N7963 ; start printing object, unique label id: 229
N7964 M624 AQAAAAAAAAA=
N7965 G1 X191.084 Y200.639 F60000
N7966 G1 Z4.8
N7967 G1 E.8 F1800
N7968 ; FEATURE: Inner wall
N7969 ; LINE_WIDTH: 0.45
N7970 ; LAYER_HEIGHT: 0.2
N7971 G1 F4421.739
N7972 M204 S8000
N7973 G1 X158.916 Y200.639 E1.03439
N7974 G1 X158.916 Y127.036 E2.36678
N7975 G1 X191.084 Y127.036 E1.03439
N7976 G1 X191.084 Y200.579 E2.36485
N7977 ; COOLING_NODE: 0
N7978 M204 S10000
N7979 G1 X191.491 Y201.046 F60000
N7980 G1 F4421.739
N7981 M204 S8000
N7982 G1 X158.509 Y201.046 E1.06057
N7983 G1 X158.509 Y126.629 E2.39296
N7984 G1 X191.491 Y126.629 E1.06057
N7985 G1 X191.491 Y200.986 E2.39103
N7986 ; COOLING_NODE: 0
N7987 M204 S10000
N7988 G1 X191.898 Y201.453 F60000
N7989 G1 F4421.739
N7990 M204 S8000
N7991 G1 X158.102 Y201.453 E1.08675
N7992 G1 X158.102 Y126.222 E2.41914
N7993 G1 X191.898 Y126.222 E1.08675
N7994 G1 X191.898 Y201.393 E2.41721
N7995 ; COOLING_NODE: 0
N7996 M204 S10000
N7997 G1 X192.29 Y201.845 F60000
N7998 ; FEATURE: Outer wall
N7999 ; LINE_WIDTH: 0.42
N8000 G1 F4773.528
N8001 M204 S5000
N8002 G1 X157.71 Y201.845 E1.03002
N8003 G1 X157.71 Y125.83 E2.26421
N8004 G1 X192.29 Y125.83 E1.03002
N8005 G1 X192.29 Y201.785 E2.26243
N8006 G1 E-.8 F1800
N8007 M204 S10000
N8008 G1 X191.288 Y194.218 Z5.2 F60000
N8009 G1 X190.736 Y190.05 Z5.2
N8010 G1 Z4.8
N8011 G1 E.8 F1800
N8012 ; FEATURE: Sparse infill
N8013 ; LINE_WIDTH: 0.45
N8014 G1 F4421.739
N8015 M204 S8000
N8016 G1 X190.736 Y188.421 E.05236
N8017 G1 X159.264 Y196.854 E1.0477
N8018 G1 X159.264 Y200.29 E.1105
N8019 G1 X161.719 Y200.29 E.07892
N8020 G1 X181.254 Y127.385 E2.42708
N8021 G1 X177.889 Y127.385 E.10819
N8022 G1 X190.736 Y140.231 E.58421
N8023 G1 X190.736 Y137.849 E.07661
N8024 G1 X159.264 Y146.281 E1.0477
N8025 G1 X159.264 Y146.536 E.00819
N8026 G1 X164.396 Y127.385 E.63757
N8027 G1 X162.768 Y127.385 E.05236
N8028 M204 S10000
N8029 G1 X166.375 Y127.385 F60000
N8030 G1 F4421.739
N8031 M204 S8000
N8032 G1 X190.736 Y151.745 E1.10782
N8033 G1 X190.736 Y146.277 E.17582
N8034 G1 X159.264 Y154.71 E1.0477
N8035 G1 X159.264 Y154.816 E.0034
N8036 G1 X190.736 Y186.287 E1.43118
N8037 G1 X190.736 Y186.368 E.0026
N8038 G1 X187.005 Y200.29 E.46349
N8039 G1 X181.711 Y200.29 E.17024
N8040 G1 X159.264 Y177.844 E1.02078
N8041 G1 X159.264 Y177.993 E.00479
N8042 G1 X172.825 Y127.385 E1.68478
N8043 G1 X166.874 Y127.385 E.19135
N8044 M73 P56 R22
N8045 G1 X159.264 Y129.424 E.25333
N8046 G1 X159.264 Y131.788 E.07603
N8047 M73 P57 R22
N8048 G1 X190.736 Y163.259 E1.43118
N8049 G1 X190.736 Y163.135 E.00399
N8050 G1 X159.264 Y171.568 E1.0477
N8051 G1 X159.264 Y169.939 E.05236
N8052 M204 S10000
N8053 G1 X159.264 Y181.625 F60000
N8054 G1 F4421.739
N8055 M204 S8000
N8056 G1 X159.264 Y179.996 E.05236
N8057 G1 X190.736 Y171.564 E1.0477
N8058 G1 X190.736 Y174.773 E.1032
N8059 G1 X159.264 Y143.302 E1.43118
N8060 G1 X159.264 Y137.852 E.17524
N8061 G1 X190.736 Y129.42 E1.0477
N8062 G1 X190.736 Y128.717 E.02259
N8063 G1 X189.403 Y127.385 E.0606
N8064 G1 X189.682 Y127.385 E.00899
N8065 G1 X170.147 Y200.29 E2.42708
N8066 G1 X170.197 Y200.29 E.00159
N8067 G1 X159.264 Y189.358 E.49717
N8068 G1 X159.264 Y188.425 E.02999
N8069 G1 X190.736 Y179.993 E1.0477
N8070 G1 X190.736 Y181.621 E.05236
N8071 M204 S10000
N8072 G1 X178.576 Y200.29 F60000
N8073 G1 F4421.739
N8074 M204 S8000
N8075 G1 X190.736 Y154.911 E1.5107
N8076 G1 X190.736 Y154.706 E.00659
N8077 G1 X159.264 Y163.139 E1.0477
N8078 G1 X159.264 Y166.33 E.10261
N8079 G1 X190.736 Y197.801 E1.43118
N8080 G1 X190.736 Y196.85 E.03057
N8081 G1 X177.897 Y200.29 E.42741
N8082 G1 X176.269 Y200.29 E.05236
N8083 ; WIPE_START
N8084 G1 X177.897 Y200.29 E-.61876
N8085 G1 X178.256 Y200.194 E-.14124
N8086 ; WIPE_END
N8087 G1 E-.04 F1800
N8088 M204 S10000
N8089 G17
N8090 G3 Z5.2 I1.217 J0 P1  F60000
N8091 ; stop printing object, unique label id: 229
N8092 M625
N8093 ; object ids of layer 24 start: 229
N8094 M624 AQAAAAAAAAA=
N8095 ;======== H2D 20250527========
N8096 ; SKIPPABLE_START
N8097 ; SKIPTYPE: timelapse
N8098 M622.1 S1 ; for prev firware, default turned on
N8099 
N8100 M1002 judge_flag timelapse_record_flag
N8101 
N8102 M622 J1
N8103 M993 A2 B2 C2
N8104 M993 A0 B0 C0
N8105 
N8106 
N8107 
N8108 
N8109     M9711 M0 E1 X260 Y141 Z5.2 S11 C10 O0 T3000
N8110 
N8111 
N8112 
N8113 M993 A3 B3 C3
N8114 
N8115 M623
N8116 ; SKIPPABLE_END
N8117 
N8118 ; object ids of this layer24 end: 229
N8119 M625
N8120 ; CHANGE_LAYER
N8121 ; Z_HEIGHT: 5
N8122 ; LAYER_HEIGHT: 0.2
N8123 ;======== H2D 20250521========
N8124 ; layer num/total_layer_count: 25/63
N8125 ; update layer progress
N8126 M73 L25
N8127 M991 S0 P24 ;notify layer change
N8128 
N8129 
N8130 M106 S51
N8131 ; OBJECT_ID: 229
N8132 ; COOLING_NODE: 0
N8133 ; start printing object, unique label id: 229
N8134 M624 AQAAAAAAAAA=
N8135 G1 X191.084 Y200.639 F60000
N8136 G1 Z5
N8137 G1 E.8 F1800
N8138 ; FEATURE: Inner wall
N8139 ; LINE_WIDTH: 0.45
N8140 ; LAYER_HEIGHT: 0.2
N8141 G1 F4421.739
N8142 M204 S8000
N8143 G1 X158.916 Y200.639 E1.03439
N8144 G1 X158.916 Y127.036 E2.36678
N8145 G1 X191.084 Y127.036 E1.03439
N8146 G1 X191.084 Y200.579 E2.36485
N8147 ; COOLING_NODE: 0
N8148 M204 S10000
N8149 G1 X191.491 Y201.046 F60000
N8150 G1 F4421.739
N8151 M204 S8000
N8152 G1 X158.509 Y201.046 E1.06057
N8153 G1 X158.509 Y126.629 E2.39296
N8154 G1 X191.491 Y126.629 E1.06057
N8155 G1 X191.491 Y200.986 E2.39103
N8156 ; COOLING_NODE: 0
N8157 M204 S10000
N8158 G1 X191.898 Y201.453 F60000
N8159 G1 F4421.739
N8160 M204 S8000
N8161 G1 X158.102 Y201.453 E1.08675
N8162 G1 X158.102 Y126.222 E2.41914
N8163 G1 X191.898 Y126.222 E1.08675
N8164 G1 X191.898 Y201.393 E2.41721
N8165 ; COOLING_NODE: 0
N8166 M204 S10000
N8167 G1 X192.29 Y201.845 F60000
N8168 ; FEATURE: Outer wall
N8169 ; LINE_WIDTH: 0.42
N8170 G1 F4773.528
N8171 M204 S5000
N8172 G1 X157.71 Y201.845 E1.03002
N8173 G1 X157.71 Y125.83 E2.26421
N8174 G1 X192.29 Y125.83 E1.03002
N8175 G1 X192.29 Y201.785 E2.26243
N8176 G1 E-.8 F1800
N8177 M204 S10000
N8178 G1 X191.275 Y194.22 Z5.4 F60000
N8179 G1 X190.736 Y190.196 Z5.4
N8180 G1 Z5
N8181 G1 E.8 F1800
N8182 ; FEATURE: Sparse infill
N8183 ; LINE_WIDTH: 0.45
N8184 G1 F4421.739
N8185 M204 S8000
N8186 G1 X190.736 Y188.568 E.05236
N8187 G1 X159.264 Y197 E1.0477
N8188 G1 X159.264 Y200.29 E.10579
N8189 G1 X161.572 Y200.29 E.07421
N8190 G1 X181.107 Y127.385 E2.42708
N8191 G1 X178.089 Y127.385 E.09706
N8192 G1 X190.736 Y140.031 E.57511
N8193 G1 X190.736 Y137.995 E.06548
N8194 G1 X159.264 Y146.428 E1.0477
N8195 G1 X159.264 Y145.99 E.01408
N8196 G1 X164.25 Y127.385 E.61938
N8197 G1 X162.621 Y127.385 E.05236
N8198 M204 S10000
N8199 G1 X166.575 Y127.385 F60000
N8200 G1 F4421.739
N8201 M204 S8000
N8202 G1 X190.736 Y151.545 E1.09872
N8203 G1 X190.736 Y154.365 E.09067
N8204 G1 X178.43 Y200.29 E1.52889
N8205 G1 X190.736 Y196.997 E.40964
N8206 G1 X190.736 Y197.601 E.01943
N8207 G1 X159.264 Y166.13 E1.43118
N8208 G1 X159.264 Y163.285 E.09147
N8209 G1 X190.736 Y154.853 E1.0477
N8210 M204 S10000
N8211 G1 X190.736 Y144.796 F60000
N8212 G1 F4421.739
N8213 M204 S8000
N8214 G1 X190.736 Y146.424 E.05236
N8215 G1 X159.264 Y154.856 E1.0477
N8216 G1 X159.264 Y154.616 E.00774
N8217 G1 X190.736 Y186.087 E1.43118
N8218 G1 X190.736 Y185.821 E.00854
N8219 G1 X186.859 Y200.29 E.48168
N8220 G1 X181.911 Y200.29 E.1591
N8221 G1 X159.264 Y177.644 E1.02987
N8222 G1 X159.264 Y177.446 E.00635
N8223 G1 X172.678 Y127.385 E1.66659
N8224 G1 X167.421 Y127.385 E.16908
N8225 G1 X159.264 Y129.57 E.27152
N8226 G1 X159.264 Y131.588 E.06489
N8227 G1 X190.736 Y163.059 E1.43118
N8228 G1 X190.736 Y163.281 E.00715
N8229 G1 X159.264 Y171.714 E1.04769
N8230 G1 X159.264 Y170.086 E.05236
N8231 M204 S10000
N8232 G1 X159.264 Y181.771 F60000
N8233 G1 F4421.739
N8234 M204 S8000
N8235 G1 X159.264 Y180.143 E.05236
N8236 G1 X190.736 Y171.71 E1.0477
N8237 G1 X190.736 Y174.573 E.09206
N8238 G1 X159.264 Y143.102 E1.43118
N8239 G1 X159.264 Y137.999 E.1641
N8240 G1 X190.736 Y129.566 E1.0477
N8241 G1 X190.736 Y128.517 E.03373
N8242 G1 X189.603 Y127.385 E.0515
N8243 G1 X189.536 Y127.385 E.00215
N8244 G1 X170.001 Y200.29 E2.42708
N8245 G1 X170.397 Y200.29 E.01273
N8246 G1 X159.264 Y189.158 E.50626
N8247 G1 X159.264 Y188.572 E.01885
N8248 G1 X190.736 Y180.139 E1.0477
N8249 G1 X190.736 Y181.767 E.05236
N8250 ; WIPE_START
N8251 G1 X190.736 Y180.139 E-.61876
N8252 G1 X190.377 Y180.235 E-.14124
N8253 ; WIPE_END
N8254 M73 P58 R22
N8255 G1 E-.04 F1800
N8256 M204 S10000
N8257 G17
N8258 G3 Z5.4 I1.217 J0 P1  F60000
N8259 ; stop printing object, unique label id: 229
N8260 M625
N8261 ; object ids of layer 25 start: 229
N8262 M624 AQAAAAAAAAA=
N8263 ;======== H2D 20250527========
N8264 ; SKIPPABLE_START
N8265 ; SKIPTYPE: timelapse
N8266 M622.1 S1 ; for prev firware, default turned on
N8267 
N8268 M1002 judge_flag timelapse_record_flag
N8269 
N8270 M622 J1
N8271 M993 A2 B2 C2
N8272 M993 A0 B0 C0
N8273 
N8274 
N8275 
N8276 
N8277     M9711 M0 E1 X260 Y141 Z5.4 S11 C10 O0 T3000
N8278 
N8279 
N8280 
N8281 M993 A3 B3 C3
N8282 
N8283 M623
N8284 ; SKIPPABLE_END
N8285 
N8286 ; object ids of this layer25 end: 229
N8287 M625
N8288 ; CHANGE_LAYER
N8289 ; Z_HEIGHT: 5.2
N8290 ; LAYER_HEIGHT: 0.2
N8291 ;======== H2D 20250521========
N8292 ; layer num/total_layer_count: 26/63
N8293 ; update layer progress
N8294 M73 L26
N8295 M991 S0 P25 ;notify layer change
N8296 
N8297 
N8298 M106 S48.45
N8299 ; OBJECT_ID: 229
N8300 ; COOLING_NODE: 0
N8301 ; start printing object, unique label id: 229
N8302 M624 AQAAAAAAAAA=
N8303 G1 X191.084 Y200.639 F60000
N8304 G1 Z5.2
N8305 G1 E.8 F1800
N8306 ; FEATURE: Inner wall
N8307 ; LINE_WIDTH: 0.45
N8308 ; LAYER_HEIGHT: 0.2
N8309 G1 F4421.739
N8310 M204 S8000
N8311 G1 X158.916 Y200.639 E1.03439
N8312 G1 X158.916 Y127.036 E2.36678
N8313 G1 X191.084 Y127.036 E1.03439
N8314 G1 X191.084 Y200.579 E2.36485
N8315 ; COOLING_NODE: 0
N8316 M204 S10000
N8317 G1 X191.491 Y201.046 F60000
N8318 G1 F4421.739
N8319 M204 S8000
N8320 G1 X158.509 Y201.046 E1.06057
N8321 G1 X158.509 Y126.629 E2.39296
N8322 G1 X191.491 Y126.629 E1.06057
N8323 G1 X191.491 Y200.986 E2.39103
N8324 ; COOLING_NODE: 0
N8325 M204 S10000
N8326 G1 X191.898 Y201.453 F60000
N8327 G1 F4421.739
N8328 M204 S8000
N8329 G1 X158.102 Y201.453 E1.08675
N8330 G1 X158.102 Y126.222 E2.41914
N8331 G1 X191.898 Y126.222 E1.08675
N8332 G1 X191.898 Y201.393 E2.41721
N8333 ; COOLING_NODE: 0
N8334 M204 S10000
N8335 G1 X192.29 Y201.845 F60000
N8336 ; FEATURE: Outer wall
N8337 ; LINE_WIDTH: 0.42
N8338 G1 F4773.528
N8339 M204 S5000
N8340 G1 X157.71 Y201.845 E1.03002
N8341 G1 X157.71 Y125.83 E2.26421
N8342 G1 X192.29 Y125.83 E1.03002
N8343 G1 X192.29 Y201.785 E2.26243
N8344 G1 E-.8 F1800
N8345 M204 S10000
N8346 G1 X191.263 Y194.222 Z5.6 F60000
N8347 G1 X190.736 Y190.343 Z5.6
N8348 G1 Z5.2
N8349 G1 E.8 F1800
N8350 ; FEATURE: Sparse infill
N8351 ; LINE_WIDTH: 0.45
N8352 G1 F4421.739
N8353 M204 S8000
N8354 G1 X190.736 Y188.714 E.05236
N8355 G1 X159.264 Y197.147 E1.04769
N8356 G1 X159.264 Y200.29 E.10108
N8357 G1 X161.426 Y200.29 E.0695
N8358 G1 X180.961 Y127.385 E2.42708
N8359 G1 X178.289 Y127.385 E.08592
N8360 G1 X190.736 Y139.831 E.56602
N8361 G1 X190.736 Y138.141 E.05434
N8362 G1 X159.264 Y146.574 E1.0477
N8363 G1 X159.264 Y145.443 E.03636
N8364 G1 X164.103 Y127.385 E.60118
N8365 G1 X162.475 Y127.385 E.05236
N8366 M204 S10000
N8367 G1 X166.775 Y127.385 F60000
N8368 G1 F4421.739
N8369 M204 S8000
N8370 G1 X190.736 Y151.345 E1.08963
N8371 G1 X190.736 Y153.818 E.07953
N8372 G1 X178.283 Y200.29 E1.54708
N8373 G1 X178.99 Y200.29 E.02271
N8374 G1 X190.736 Y197.143 E.39103
N8375 G1 X190.736 Y197.401 E.00829
N8376 G1 X159.264 Y165.93 E1.43118
N8377 G1 X159.264 Y163.432 E.08033
N8378 G1 X190.736 Y154.999 E1.0477
N8379 M204 S10000
N8380 G1 X190.736 Y144.942 F60000
N8381 G1 F4421.739
N8382 M204 S8000
N8383 G1 X190.736 Y146.57 E.05236
N8384 G1 X159.264 Y155.003 E1.04769
N8385 G1 X159.264 Y154.416 E.01888
N8386 G1 X190.736 Y185.887 E1.43118
N8387 M204 S10000
N8388 G1 X159.264 Y181.918 F60000
N8389 G1 F4421.739
N8390 M204 S8000
N8391 G1 X159.264 Y180.289 E.05236
N8392 G1 X190.736 Y171.857 E1.0477
N8393 G1 X190.736 Y174.373 E.08092
N8394 G1 X159.264 Y142.902 E1.43118
N8395 G1 X159.264 Y138.145 E.15296
N8396 G1 X190.736 Y129.713 E1.0477
N8397 G1 X190.736 Y128.317 E.04487
N8398 G1 X189.803 Y127.385 E.04241
N8399 G1 X189.39 Y127.385 E.01329
N8400 G1 X169.855 Y200.29 E2.42708
N8401 G1 X170.597 Y200.29 E.02387
N8402 G1 X159.264 Y188.958 E.51536
N8403 G1 X159.264 Y188.718 E.00771
N8404 G1 X190.736 Y180.285 E1.0477
N8405 G1 X190.736 Y185.275 E.16045
N8406 G1 X186.712 Y200.29 E.49987
N8407 G1 X182.111 Y200.29 E.14796
N8408 G1 X159.264 Y177.444 E1.03897
N8409 G1 X159.264 Y176.9 E.01749
N8410 G1 X172.532 Y127.385 E1.6484
N8411 G1 X167.967 Y127.385 E.1468
N8412 G1 X159.264 Y129.716 E.28971
N8413 G1 X159.264 Y131.388 E.05375
N8414 G1 X190.736 Y162.859 E1.43118
N8415 G1 X190.736 Y163.428 E.01829
N8416 G1 X159.264 Y171.86 E1.0477
N8417 G1 X159.264 Y170.232 E.05236
N8418 ; WIPE_START
N8419 G1 X159.264 Y171.86 E-.61876
N8420 G1 X159.623 Y171.764 E-.14124
N8421 ; WIPE_END
N8422 G1 E-.04 F1800
N8423 M204 S10000
N8424 G17
N8425 G3 Z5.6 I1.217 J0 P1  F60000
N8426 ; stop printing object, unique label id: 229
N8427 M625
N8428 ; object ids of layer 26 start: 229
N8429 M624 AQAAAAAAAAA=
N8430 ;======== H2D 20250527========
N8431 ; SKIPPABLE_START
N8432 ; SKIPTYPE: timelapse
N8433 M622.1 S1 ; for prev firware, default turned on
N8434 
N8435 M1002 judge_flag timelapse_record_flag
N8436 
N8437 M622 J1
N8438 M993 A2 B2 C2
N8439 M993 A0 B0 C0
N8440 
N8441 
N8442 
N8443 
N8444     M9711 M0 E1 X260 Y141 Z5.6 S11 C10 O0 T3000
N8445 
N8446 
N8447 
N8448 M993 A3 B3 C3
N8449 
N8450 M623
N8451 ; SKIPPABLE_END
N8452 
N8453 ; object ids of this layer26 end: 229
N8454 M625
N8455 ; CHANGE_LAYER
N8456 ; Z_HEIGHT: 5.4
N8457 ; LAYER_HEIGHT: 0.2
N8458 ;======== H2D 20250521========
N8459 ; layer num/total_layer_count: 27/63
N8460 ; update layer progress
N8461 M73 L27
N8462 M991 S0 P26 ;notify layer change
N8463 
N8464 
N8465 ; OBJECT_ID: 229
N8466 ; COOLING_NODE: 0
N8467 ; start printing object, unique label id: 229
N8468 M624 AQAAAAAAAAA=
N8469 G1 X191.084 Y200.639 F60000
N8470 G1 Z5.4
N8471 G1 E.8 F1800
N8472 ; FEATURE: Inner wall
N8473 ; LINE_WIDTH: 0.45
N8474 ; LAYER_HEIGHT: 0.2
N8475 G1 F4421.739
N8476 M204 S8000
N8477 G1 X158.916 Y200.639 E1.03439
N8478 G1 X158.916 Y127.036 E2.36678
N8479 G1 X191.084 Y127.036 E1.03439
N8480 G1 X191.084 Y200.579 E2.36485
N8481 ; COOLING_NODE: 0
N8482 M204 S10000
N8483 G1 X191.491 Y201.046 F60000
N8484 G1 F4421.739
N8485 M204 S8000
N8486 G1 X158.509 Y201.046 E1.06057
N8487 M73 P58 R21
N8488 G1 X158.509 Y126.629 E2.39296
N8489 G1 X191.491 Y126.629 E1.06057
N8490 G1 X191.491 Y200.986 E2.39103
N8491 ; COOLING_NODE: 0
N8492 M204 S10000
N8493 G1 X191.898 Y201.453 F60000
N8494 G1 F4421.739
N8495 M204 S8000
N8496 G1 X158.102 Y201.453 E1.08675
N8497 G1 X158.102 Y126.222 E2.41914
N8498 G1 X191.898 Y126.222 E1.08675
N8499 G1 X191.898 Y201.393 E2.41721
N8500 ; COOLING_NODE: 0
N8501 M204 S10000
N8502 G1 X192.29 Y201.845 F60000
N8503 ; FEATURE: Outer wall
N8504 ; LINE_WIDTH: 0.42
N8505 M73 P59 R21
N8506 G1 F4773.528
N8507 M204 S5000
N8508 G1 X157.71 Y201.845 E1.03002
N8509 G1 X157.71 Y125.83 E2.26421
N8510 G1 X192.29 Y125.83 E1.03002
N8511 G1 X192.29 Y201.785 E2.26243
N8512 G1 E-.8 F1800
N8513 M204 S10000
N8514 G1 X191.249 Y194.224 Z5.8 F60000
N8515 G1 X190.736 Y190.489 Z5.8
N8516 G1 Z5.4
N8517 G1 E.8 F1800
N8518 ; FEATURE: Sparse infill
N8519 ; LINE_WIDTH: 0.45
N8520 G1 F4421.739
N8521 M204 S8000
N8522 G1 X190.736 Y188.861 E.05236
N8523 G1 X159.264 Y197.293 E1.0477
N8524 G1 X159.264 Y200.29 E.09637
N8525 G1 X161.279 Y200.29 E.06479
N8526 G1 X180.814 Y127.385 E2.42708
N8527 G1 X178.489 Y127.385 E.07478
N8528 G1 X190.736 Y139.631 E.55692
N8529 G1 X190.736 Y138.288 E.0432
N8530 G1 X159.264 Y146.72 E1.0477
N8531 G1 X159.264 Y144.897 E.05864
N8532 G1 X163.957 Y127.385 E.58299
N8533 G1 X166.975 Y127.385 E.09705
N8534 G1 X190.736 Y151.145 E1.08053
N8535 G1 X190.736 Y153.272 E.06839
N8536 G1 X178.137 Y200.29 E1.56527
N8537 G1 X179.536 Y200.29 E.04499
N8538 G1 X190.736 Y197.289 E.37284
N8539 G1 X190.736 Y197.201 E.00284
N8540 G1 X159.264 Y165.73 E1.43118
N8541 G1 X159.264 Y163.578 E.06919
N8542 G1 X190.736 Y155.145 E1.0477
N8543 G1 X190.736 Y156.774 E.05236
N8544 M204 S10000
N8545 G1 X190.736 Y145.088 F60000
N8546 G1 F4421.739
N8547 M204 S8000
N8548 G1 X190.736 Y146.717 E.05236
N8549 G1 X159.264 Y155.149 E1.0477
N8550 G1 X159.264 Y154.216 E.03001
N8551 G1 X190.736 Y185.687 E1.43118
N8552 M204 S10000
N8553 G1 X159.264 Y182.064 F60000
N8554 G1 F4421.739
N8555 M204 S8000
N8556 G1 X159.264 Y180.436 E.05236
N8557 G1 X190.736 Y172.003 E1.0477
N8558 G1 X190.736 Y174.173 E.06978
N8559 G1 X159.264 Y142.702 E1.43118
N8560 G1 X159.264 Y138.292 E.14182
N8561 G1 X190.736 Y129.859 E1.0477
N8562 G1 X190.736 Y128.117 E.05601
N8563 G1 X190.003 Y127.385 E.03331
N8564 G1 X189.243 Y127.385 E.02443
N8565 G1 X169.708 Y200.29 E2.42708
N8566 G1 X170.797 Y200.29 E.03501
N8567 G1 X159.264 Y188.758 E.52445
N8568 G1 X159.264 Y188.864 E.00343
N8569 G1 X190.736 Y180.432 E1.0477
N8570 G1 X190.736 Y184.729 E.13817
N8571 G1 X186.566 Y200.29 E.51806
N8572 G1 X182.311 Y200.29 E.13682
N8573 G1 X159.264 Y177.244 E1.04806
N8574 G1 X159.264 Y176.354 E.02863
N8575 G1 X172.386 Y127.385 E1.63021
N8576 G1 X168.513 Y127.385 E.12452
N8577 G1 X159.264 Y129.863 E.3079
N8578 G1 X159.264 Y131.188 E.04261
N8579 G1 X190.736 Y162.659 E1.43118
N8580 G1 X190.736 Y163.574 E.02943
N8581 G1 X159.264 Y172.007 E1.0477
N8582 G1 X159.264 Y170.379 E.05236
N8583 ; WIPE_START
N8584 G1 X159.264 Y172.007 E-.61876
N8585 G1 X159.623 Y171.911 E-.14124
N8586 ; WIPE_END
N8587 G1 E-.04 F1800
N8588 M204 S10000
N8589 G17
N8590 G3 Z5.8 I1.217 J0 P1  F60000
N8591 ; stop printing object, unique label id: 229
N8592 M625
N8593 ; object ids of layer 27 start: 229
N8594 M624 AQAAAAAAAAA=
N8595 ;======== H2D 20250527========
N8596 ; SKIPPABLE_START
N8597 ; SKIPTYPE: timelapse
N8598 M622.1 S1 ; for prev firware, default turned on
N8599 
N8600 M1002 judge_flag timelapse_record_flag
N8601 
N8602 M622 J1
N8603 M993 A2 B2 C2
N8604 M993 A0 B0 C0
N8605 
N8606 
N8607 
N8608 
N8609     M9711 M0 E1 X260 Y141 Z5.8 S11 C10 O0 T3000
N8610 
N8611 
N8612 
N8613 M993 A3 B3 C3
N8614 
N8615 M623
N8616 ; SKIPPABLE_END
N8617 
N8618 ; object ids of this layer27 end: 229
N8619 M625
N8620 ; CHANGE_LAYER
N8621 ; Z_HEIGHT: 5.6
N8622 ; LAYER_HEIGHT: 0.2
N8623 ;======== H2D 20250521========
N8624 ; layer num/total_layer_count: 28/63
N8625 ; update layer progress
N8626 M73 L28
N8627 M991 S0 P27 ;notify layer change
N8628 
N8629 
N8630 ; OBJECT_ID: 229
N8631 ; COOLING_NODE: 0
N8632 ; start printing object, unique label id: 229
N8633 M624 AQAAAAAAAAA=
N8634 G1 X191.084 Y200.639 F60000
N8635 G1 Z5.6
N8636 G1 E.8 F1800
N8637 ; FEATURE: Inner wall
N8638 ; LINE_WIDTH: 0.45
N8639 ; LAYER_HEIGHT: 0.2
N8640 G1 F4421.739
N8641 M204 S8000
N8642 G1 X158.916 Y200.639 E1.03439
N8643 G1 X158.916 Y127.036 E2.36678
N8644 G1 X191.084 Y127.036 E1.03439
N8645 G1 X191.084 Y200.579 E2.36485
N8646 ; COOLING_NODE: 0
N8647 M204 S10000
N8648 G1 X191.491 Y201.046 F60000
N8649 G1 F4421.739
N8650 M204 S8000
N8651 G1 X158.509 Y201.046 E1.06057
N8652 G1 X158.509 Y126.629 E2.39296
N8653 G1 X191.491 Y126.629 E1.06057
N8654 G1 X191.491 Y200.986 E2.39103
N8655 ; COOLING_NODE: 0
N8656 M204 S10000
N8657 G1 X191.898 Y201.453 F60000
N8658 G1 F4421.739
N8659 M204 S8000
N8660 G1 X158.102 Y201.453 E1.08675
N8661 G1 X158.102 Y126.222 E2.41914
N8662 G1 X191.898 Y126.222 E1.08675
N8663 G1 X191.898 Y201.393 E2.41721
N8664 ; COOLING_NODE: 0
N8665 M204 S10000
N8666 G1 X192.29 Y201.845 F60000
N8667 ; FEATURE: Outer wall
N8668 ; LINE_WIDTH: 0.42
N8669 G1 F4773.528
N8670 M204 S5000
N8671 G1 X157.71 Y201.845 E1.03002
N8672 G1 X157.71 Y125.83 E2.26421
N8673 G1 X192.29 Y125.83 E1.03002
N8674 G1 X192.29 Y201.785 E2.26243
N8675 G1 E-.8 F1800
N8676 M204 S10000
N8677 G1 X185.724 Y197.893 Z6 F60000
N8678 G1 X159.264 Y182.21 Z6
N8679 G1 Z5.6
N8680 G1 E.8 F1800
N8681 ; FEATURE: Sparse infill
N8682 ; LINE_WIDTH: 0.45
N8683 G1 F4421.739
N8684 M204 S8000
N8685 G1 X159.264 Y180.582 E.05236
N8686 G1 X190.736 Y172.149 E1.0477
N8687 G1 X190.736 Y173.973 E.05864
N8688 G1 X159.264 Y142.502 E1.43118
N8689 G1 X159.264 Y138.438 E.13068
N8690 G1 X190.736 Y130.005 E1.0477
N8691 G1 X190.736 Y127.917 E.06715
N8692 G1 X190.203 Y127.385 E.02422
N8693 G1 X189.097 Y127.385 E.03557
N8694 G1 X169.562 Y200.29 E2.42708
N8695 G1 X170.997 Y200.29 E.04615
N8696 G1 X159.264 Y188.558 E.53355
N8697 G1 X159.264 Y189.011 E.01457
N8698 M73 P60 R21
N8699 G1 X190.736 Y180.578 E1.0477
N8700 G1 X190.736 Y184.182 E.11589
N8701 G1 X186.419 Y200.29 E.53625
N8702 G1 X182.511 Y200.29 E.12568
N8703 G1 X159.264 Y177.044 E1.05716
N8704 G1 X159.264 Y175.807 E.03977
N8705 G1 X172.239 Y127.385 E1.61202
N8706 G1 X169.06 Y127.385 E.10224
N8707 G1 X159.264 Y130.009 E.32609
N8708 G1 X159.264 Y130.988 E.03147
N8709 G1 X190.736 Y162.459 E1.43118
N8710 G1 X190.736 Y163.721 E.04057
N8711 G1 X159.264 Y172.153 E1.0477
N8712 G1 X159.264 Y170.525 E.05236
N8713 M204 S10000
N8714 G1 X190.736 Y156.92 F60000
N8715 G1 F4421.739
N8716 M204 S8000
N8717 G1 X190.736 Y155.292 E.05236
N8718 G1 X159.264 Y163.724 E1.0477
N8719 G1 X159.264 Y165.53 E.05805
N8720 G1 X190.736 Y197.001 E1.43118
N8721 G1 X190.736 Y197.436 E.01398
N8722 G1 X180.082 Y200.29 E.35465
N8723 G1 X177.991 Y200.29 E.06727
N8724 G1 X190.736 Y152.726 E1.58346
N8725 G1 X190.736 Y150.945 E.05725
N8726 G1 X167.175 Y127.385 E1.07144
N8727 G1 X163.81 Y127.385 E.10819
N8728 G1 X159.264 Y144.351 E.5648
N8729 G1 X159.264 Y146.867 E.08092
N8730 G1 X190.736 Y138.434 E1.0477
N8731 G1 X190.736 Y139.431 E.03206
N8732 G1 X178.689 Y127.385 E.54783
N8733 G1 X180.668 Y127.385 E.06364
N8734 G1 X161.133 Y200.29 E2.42708
N8735 G1 X159.483 Y200.29 E.05306
N8736 G1 X159.264 Y200.072 E.00994
N8737 G1 X159.264 Y197.44 E.08464
N8738 G1 X190.736 Y189.007 E1.0477
N8739 G1 X190.736 Y185.487 E.11319
N8740 G1 X159.264 Y154.016 E1.43118
N8741 G1 X159.264 Y155.296 E.04115
N8742 G1 X190.736 Y146.863 E1.0477
N8743 G1 X190.736 Y145.235 E.05236
N8744 ; WIPE_START
N8745 G1 X190.736 Y146.863 E-.61876
N8746 G1 X190.377 Y146.959 E-.14124
N8747 ; WIPE_END
N8748 G1 E-.04 F1800
N8749 M204 S10000
N8750 G17
N8751 G3 Z6 I1.217 J0 P1  F60000
N8752 ; stop printing object, unique label id: 229
N8753 M625
N8754 ; object ids of layer 28 start: 229
N8755 M624 AQAAAAAAAAA=
N8756 ;======== H2D 20250527========
N8757 ; SKIPPABLE_START
N8758 ; SKIPTYPE: timelapse
N8759 M622.1 S1 ; for prev firware, default turned on
N8760 
N8761 M1002 judge_flag timelapse_record_flag
N8762 
N8763 M622 J1
N8764 M993 A2 B2 C2
N8765 M993 A0 B0 C0
N8766 
N8767 
N8768 
N8769 
N8770     M9711 M0 E1 X260 Y141 Z6 S11 C10 O0 T3000
N8771 
N8772 
N8773 
N8774 M993 A3 B3 C3
N8775 
N8776 M623
N8777 ; SKIPPABLE_END
N8778 
N8779 ; object ids of this layer28 end: 229
N8780 M625
N8781 ; CHANGE_LAYER
N8782 ; Z_HEIGHT: 5.8
N8783 ; LAYER_HEIGHT: 0.2
N8784 ;======== H2D 20250521========
N8785 ; layer num/total_layer_count: 29/63
N8786 ; update layer progress
N8787 M73 L29
N8788 M991 S0 P28 ;notify layer change
N8789 
N8790 
N8791 ; OBJECT_ID: 229
N8792 ; COOLING_NODE: 0
N8793 ; start printing object, unique label id: 229
N8794 M624 AQAAAAAAAAA=
N8795 G1 X191.084 Y200.639 F60000
N8796 G1 Z5.8
N8797 G1 E.8 F1800
N8798 ; FEATURE: Inner wall
N8799 ; LINE_WIDTH: 0.45
N8800 ; LAYER_HEIGHT: 0.2
N8801 G1 F4421.739
N8802 M204 S8000
N8803 G1 X158.916 Y200.639 E1.03439
N8804 G1 X158.916 Y127.036 E2.36678
N8805 G1 X191.084 Y127.036 E1.03439
N8806 G1 X191.084 Y200.579 E2.36485
N8807 ; COOLING_NODE: 0
N8808 M204 S10000
N8809 G1 X191.491 Y201.046 F60000
N8810 G1 F4421.739
N8811 M204 S8000
N8812 G1 X158.509 Y201.046 E1.06057
N8813 G1 X158.509 Y126.629 E2.39296
N8814 G1 X191.491 Y126.629 E1.06057
N8815 G1 X191.491 Y200.986 E2.39103
N8816 ; COOLING_NODE: 0
N8817 M204 S10000
N8818 G1 X191.898 Y201.453 F60000
N8819 G1 F4421.739
N8820 M204 S8000
N8821 G1 X158.102 Y201.453 E1.08675
N8822 G1 X158.102 Y126.222 E2.41914
N8823 G1 X191.898 Y126.222 E1.08675
N8824 G1 X191.898 Y201.393 E2.41721
N8825 ; COOLING_NODE: 0
N8826 M204 S10000
N8827 G1 X192.29 Y201.845 F60000
N8828 ; FEATURE: Outer wall
N8829 ; LINE_WIDTH: 0.42
N8830 G1 F4773.528
N8831 M204 S5000
N8832 G1 X157.71 Y201.845 E1.03002
N8833 G1 X157.71 Y125.83 E2.26421
N8834 G1 X192.29 Y125.83 E1.03002
N8835 G1 X192.29 Y201.785 E2.26243
N8836 G1 E-.8 F1800
N8837 M204 S10000
N8838 G1 X185.711 Y197.915 Z6.2 F60000
N8839 G1 X159.264 Y182.357 Z6.2
N8840 G1 Z5.8
N8841 G1 E.8 F1800
N8842 ; FEATURE: Sparse infill
N8843 ; LINE_WIDTH: 0.45
N8844 G1 F4421.739
N8845 M204 S8000
N8846 G1 X159.264 Y180.728 E.05236
N8847 G1 X190.736 Y172.296 E1.04769
N8848 G1 X190.736 Y173.773 E.0475
N8849 G1 X159.264 Y142.302 E1.43118
N8850 G1 X159.264 Y138.585 E.11954
N8851 M73 P60 R20
N8852 G1 X190.736 Y130.152 E1.0477
N8853 G1 X190.736 Y127.717 E.07829
N8854 G1 X190.403 Y127.385 E.01512
N8855 G1 X188.95 Y127.385 E.04671
N8856 G1 X169.415 Y200.29 E2.42708
N8857 G1 X171.197 Y200.29 E.05729
N8858 G1 X159.264 Y188.358 E.54264
N8859 G1 X159.264 Y189.157 E.02571
N8860 G1 X190.736 Y180.725 E1.0477
N8861 G1 X190.736 Y183.636 E.09361
N8862 G1 X186.273 Y200.29 E.55444
N8863 G1 X182.711 Y200.29 E.11454
N8864 G1 X159.264 Y176.844 E1.06625
N8865 G1 X159.264 Y175.261 E.0509
N8866 G1 X172.093 Y127.385 E1.59383
N8867 G1 X169.606 Y127.385 E.07996
N8868 G1 X159.264 Y130.156 E.34428
N8869 G1 X159.264 Y130.788 E.02033
N8870 G1 X190.736 Y162.259 E1.43118
N8871 G1 X190.736 Y163.867 E.05171
N8872 G1 X159.264 Y172.3 E1.0477
N8873 G1 X159.264 Y170.671 E.05236
N8874 M204 S10000
N8875 G1 X190.736 Y157.067 F60000
N8876 G1 F4421.739
N8877 M204 S8000
N8878 G1 X190.736 Y155.438 E.05236
N8879 G1 X159.264 Y163.871 E1.04769
N8880 G1 X159.264 Y165.33 E.04691
N8881 G1 X190.736 Y196.801 E1.43118
N8882 G1 X190.736 Y197.582 E.02512
N8883 G1 X180.629 Y200.29 E.33646
N8884 G1 X177.844 Y200.29 E.08955
N8885 G1 X190.736 Y152.179 E1.60165
N8886 G1 X190.736 Y150.745 E.04611
N8887 G1 X167.375 Y127.385 E1.06234
N8888 G1 X163.664 Y127.385 E.11933
N8889 G1 X159.264 Y143.804 E.54661
N8890 G1 X159.264 Y147.013 E.1032
N8891 G1 X190.736 Y138.581 E1.0477
N8892 G1 X190.736 Y139.231 E.02092
N8893 M73 P61 R20
N8894 G1 X178.889 Y127.385 E.53873
N8895 G1 X180.522 Y127.385 E.0525
N8896 G1 X160.987 Y200.29 E2.42708
N8897 G1 X159.683 Y200.29 E.04192
N8898 G1 X159.264 Y199.872 E.01904
N8899 G1 X159.264 Y197.586 E.0735
N8900 G1 X190.736 Y189.153 E1.0477
N8901 G1 X190.736 Y185.287 E.12433
N8902 G1 X159.264 Y153.816 E1.43118
N8903 G1 X159.264 Y155.442 E.05229
N8904 G1 X190.736 Y147.009 E1.0477
N8905 G1 X190.736 Y145.381 E.05236
N8906 ; WIPE_START
N8907 G1 X190.736 Y147.009 E-.61876
N8908 G1 X190.377 Y147.106 E-.14124
N8909 ; WIPE_END
N8910 G1 E-.04 F1800
N8911 M204 S10000
N8912 G17
N8913 G3 Z6.2 I1.217 J0 P1  F60000
N8914 ; stop printing object, unique label id: 229
N8915 M625
N8916 ; object ids of layer 29 start: 229
N8917 M624 AQAAAAAAAAA=
N8918 ;======== H2D 20250527========
N8919 ; SKIPPABLE_START
N8920 ; SKIPTYPE: timelapse
N8921 M622.1 S1 ; for prev firware, default turned on
N8922 
N8923 M1002 judge_flag timelapse_record_flag
N8924 
N8925 M622 J1
N8926 M993 A2 B2 C2
N8927 M993 A0 B0 C0
N8928 
N8929 
N8930 
N8931 
N8932     M9711 M0 E1 X260 Y141 Z6.2 S11 C10 O0 T3000
N8933 
N8934 
N8935 
N8936 M993 A3 B3 C3
N8937 
N8938 M623
N8939 ; SKIPPABLE_END
N8940 
N8941 ; object ids of this layer29 end: 229
N8942 M625
N8943 ; CHANGE_LAYER
N8944 ; Z_HEIGHT: 6
N8945 ; LAYER_HEIGHT: 0.2
N8946 ;======== H2D 20250521========
N8947 ; layer num/total_layer_count: 30/63
N8948 ; update layer progress
N8949 M73 L30
N8950 M991 S0 P29 ;notify layer change
N8951 
N8952 
N8953 ; OBJECT_ID: 229
N8954 ; COOLING_NODE: 0
N8955 ; start printing object, unique label id: 229
N8956 M624 AQAAAAAAAAA=
N8957 G1 X191.084 Y200.639 F60000
N8958 G1 Z6
N8959 G1 E.8 F1800
N8960 ; FEATURE: Inner wall
N8961 ; LINE_WIDTH: 0.45
N8962 ; LAYER_HEIGHT: 0.2
N8963 G1 F4421.739
N8964 M204 S8000
N8965 G1 X158.916 Y200.639 E1.03439
N8966 G1 X158.916 Y127.036 E2.36678
N8967 G1 X191.084 Y127.036 E1.03439
N8968 G1 X191.084 Y200.579 E2.36485
N8969 ; COOLING_NODE: 0
N8970 M204 S10000
N8971 G1 X191.491 Y201.046 F60000
N8972 G1 F4421.739
N8973 M204 S8000
N8974 G1 X158.509 Y201.046 E1.06057
N8975 G1 X158.509 Y126.629 E2.39296
N8976 G1 X191.491 Y126.629 E1.06057
N8977 G1 X191.491 Y200.986 E2.39103
N8978 ; COOLING_NODE: 0
N8979 M204 S10000
N8980 G1 X191.898 Y201.453 F60000
N8981 G1 F4421.739
N8982 M204 S8000
N8983 G1 X158.102 Y201.453 E1.08675
N8984 G1 X158.102 Y126.222 E2.41914
N8985 G1 X191.898 Y126.222 E1.08675
N8986 G1 X191.898 Y201.393 E2.41721
N8987 ; COOLING_NODE: 0
N8988 M204 S10000
N8989 G1 X192.29 Y201.845 F60000
N8990 ; FEATURE: Outer wall
N8991 ; LINE_WIDTH: 0.42
N8992 G1 F4773.528
N8993 M204 S5000
N8994 G1 X157.71 Y201.845 E1.03002
N8995 G1 X157.71 Y125.83 E2.26421
N8996 G1 X192.29 Y125.83 E1.03002
N8997 G1 X192.29 Y201.785 E2.26243
N8998 G1 E-.8 F1800
N8999 M204 S10000
N9000 G1 X185.699 Y197.937 Z6.4 F60000
N9001 G1 X159.264 Y182.503 Z6.4
N9002 G1 Z6
N9003 G1 E.8 F1800
N9004 ; FEATURE: Sparse infill
N9005 ; LINE_WIDTH: 0.45
N9006 G1 F4421.739
N9007 M204 S8000
N9008 G1 X159.264 Y180.875 E.05236
N9009 G1 X190.736 Y172.442 E1.0477
N9010 G1 X190.736 Y173.573 E.03636
N9011 G1 X159.264 Y142.102 E1.43118
N9012 M204 S10000
N9013 G1 X159.264 Y137.103 F60000
N9014 G1 F4421.739
N9015 M204 S8000
N9016 G1 X159.264 Y138.731 E.05236
N9017 G1 X190.736 Y130.298 E1.04769
N9018 G1 X190.736 Y127.385 E.09369
N9019 G1 X188.804 Y127.385 E.06211
N9020 G1 X169.269 Y200.29 E2.42708
N9021 G1 X171.397 Y200.29 E.06843
N9022 G1 X159.264 Y188.158 E.55174
N9023 G1 X159.264 Y189.304 E.03685
N9024 G1 X190.736 Y180.871 E1.0477
N9025 G1 X190.736 Y183.089 E.07133
N9026 G1 X186.127 Y200.29 E.57263
N9027 G1 X182.911 Y200.29 E.1034
N9028 G1 X159.264 Y176.644 E1.07535
N9029 G1 X159.264 Y174.714 E.06204
N9030 G1 X171.946 Y127.385 E1.57564
N9031 G1 X170.153 Y127.385 E.05768
N9032 G1 X159.264 Y130.302 E.36247
N9033 G1 X159.264 Y130.588 E.00919
N9034 G1 X190.736 Y162.059 E1.43118
N9035 G1 X190.736 Y164.013 E.06285
N9036 G1 X159.264 Y172.446 E1.0477
N9037 G1 X159.264 Y170.818 E.05236
N9038 M204 S10000
N9039 G1 X190.736 Y157.213 F60000
N9040 G1 F4421.739
N9041 M204 S8000
N9042 G1 X190.736 Y155.585 E.05236
N9043 G1 X159.264 Y164.017 E1.04769
N9044 G1 X159.264 Y165.13 E.03577
N9045 G1 X190.736 Y196.601 E1.43118
N9046 G1 X190.736 Y197.729 E.03626
N9047 G1 X181.175 Y200.29 E.31827
N9048 G1 X177.698 Y200.29 E.11183
N9049 G1 X190.736 Y151.633 E1.61985
N9050 G1 X190.736 Y150.545 E.03497
N9051 G1 X167.575 Y127.385 E1.05324
N9052 G1 X163.518 Y127.385 E.13047
N9053 G1 X159.264 Y143.258 E.52842
N9054 G1 X159.264 Y147.16 E.12548
N9055 G1 X190.736 Y138.727 E1.0477
N9056 G1 X190.736 Y139.031 E.00978
N9057 G1 X179.089 Y127.385 E.52964
N9058 G1 X180.375 Y127.385 E.04136
N9059 G1 X160.84 Y200.29 E2.42708
N9060 G1 X159.883 Y200.29 E.03078
N9061 G1 X159.264 Y199.672 E.02813
N9062 G1 X159.264 Y197.732 E.06236
N9063 G1 X190.736 Y189.3 E1.0477
N9064 G1 X190.736 Y185.087 E.13547
N9065 G1 X159.264 Y153.616 E1.43118
N9066 G1 X159.264 Y155.589 E.06343
N9067 G1 X190.736 Y147.156 E1.0477
N9068 G1 X190.736 Y145.528 E.05236
N9069 ; WIPE_START
N9070 G1 X190.736 Y147.156 E-.61876
N9071 G1 X190.377 Y147.252 E-.14124
N9072 ; WIPE_END
N9073 G1 E-.04 F1800
N9074 M204 S10000
N9075 G17
N9076 G3 Z6.4 I1.217 J0 P1  F60000
N9077 ; stop printing object, unique label id: 229
N9078 M625
N9079 ; object ids of layer 30 start: 229
N9080 M624 AQAAAAAAAAA=
N9081 ;======== H2D 20250527========
N9082 ; SKIPPABLE_START
N9083 ; SKIPTYPE: timelapse
N9084 M622.1 S1 ; for prev firware, default turned on
N9085 
N9086 M1002 judge_flag timelapse_record_flag
N9087 
N9088 M622 J1
N9089 M993 A2 B2 C2
N9090 M993 A0 B0 C0
N9091 
N9092 
N9093 
N9094 
N9095     M9711 M0 E1 X260 Y141 Z6.4 S11 C10 O0 T3000
N9096 
N9097 
N9098 
N9099 M993 A3 B3 C3
N9100 
N9101 M623
N9102 ; SKIPPABLE_END
N9103 
N9104 ; object ids of this layer30 end: 229
N9105 M625
N9106 ; CHANGE_LAYER
N9107 ; Z_HEIGHT: 6.2
N9108 ; LAYER_HEIGHT: 0.2
N9109 ;======== H2D 20250521========
N9110 ; layer num/total_layer_count: 31/63
N9111 ; update layer progress
N9112 M73 L31
N9113 M991 S0 P30 ;notify layer change
N9114 
N9115 
N9116 ; OBJECT_ID: 229
N9117 ; COOLING_NODE: 0
N9118 ; start printing object, unique label id: 229
N9119 M624 AQAAAAAAAAA=
N9120 G1 X191.084 Y200.639 F60000
N9121 G1 Z6.2
N9122 G1 E.8 F1800
N9123 ; FEATURE: Inner wall
N9124 ; LINE_WIDTH: 0.45
N9125 ; LAYER_HEIGHT: 0.2
N9126 G1 F4421.739
N9127 M204 S8000
N9128 G1 X158.916 Y200.639 E1.03439
N9129 G1 X158.916 Y127.036 E2.36678
N9130 G1 X191.084 Y127.036 E1.03439
N9131 G1 X191.084 Y200.579 E2.36485
N9132 ; COOLING_NODE: 0
N9133 M204 S10000
N9134 G1 X191.491 Y201.046 F60000
N9135 G1 F4421.739
N9136 M204 S8000
N9137 G1 X158.509 Y201.046 E1.06057
N9138 G1 X158.509 Y126.629 E2.39296
N9139 G1 X191.491 Y126.629 E1.06057
N9140 G1 X191.491 Y200.986 E2.39103
N9141 ; COOLING_NODE: 0
N9142 M204 S10000
N9143 M73 P62 R20
N9144 G1 X191.898 Y201.453 F60000
N9145 G1 F4421.739
N9146 M204 S8000
N9147 G1 X158.102 Y201.453 E1.08675
N9148 G1 X158.102 Y126.222 E2.41914
N9149 G1 X191.898 Y126.222 E1.08675
N9150 G1 X191.898 Y201.393 E2.41721
N9151 ; COOLING_NODE: 0
N9152 M204 S10000
N9153 G1 X192.29 Y201.845 F60000
N9154 ; FEATURE: Outer wall
N9155 ; LINE_WIDTH: 0.42
N9156 G1 F4773.528
N9157 M204 S5000
N9158 G1 X157.71 Y201.845 E1.03002
N9159 G1 X157.71 Y125.83 E2.26421
N9160 G1 X192.29 Y125.83 E1.03002
N9161 G1 X192.29 Y201.785 E2.26243
N9162 G1 E-.8 F1800
N9163 M204 S10000
N9164 G1 X185.686 Y197.958 Z6.6 F60000
N9165 G1 X159.264 Y182.65 Z6.6
N9166 G1 Z6.2
N9167 G1 E.8 F1800
N9168 ; FEATURE: Sparse infill
N9169 ; LINE_WIDTH: 0.45
N9170 G1 F4421.739
N9171 M204 S8000
N9172 G1 X159.264 Y181.021 E.05236
N9173 G1 X190.736 Y172.589 E1.0477
N9174 G1 X190.736 Y173.373 E.02522
N9175 G1 X159.264 Y141.902 E1.43118
N9176 M204 S10000
N9177 G1 X159.264 Y137.249 F60000
N9178 G1 F4421.739
N9179 M204 S8000
N9180 G1 X159.264 Y138.877 E.05236
N9181 G1 X190.736 Y130.445 E1.0477
N9182 G1 X190.736 Y127.385 E.0984
N9183 G1 X188.658 Y127.385 E.06682
N9184 G1 X169.123 Y200.29 E2.42708
N9185 G1 X171.597 Y200.29 E.07957
N9186 G1 X159.264 Y187.958 E.56084
N9187 G1 X159.264 Y189.45 E.04799
N9188 G1 X190.736 Y181.017 E1.0477
N9189 G1 X190.736 Y182.543 E.04906
N9190 G1 X185.98 Y200.29 E.59082
N9191 G1 X183.111 Y200.29 E.09226
N9192 G1 X159.264 Y176.444 E1.08444
N9193 G1 X159.264 Y174.168 E.07318
N9194 G1 X171.8 Y127.385 E1.55745
N9195 G1 X170.699 Y127.385 E.0354
N9196 G1 X159.264 Y130.449 E.38066
N9197 G1 X159.264 Y130.388 E.00195
N9198 G1 X190.736 Y161.859 E1.43118
N9199 G1 X190.736 Y164.16 E.07399
N9200 G1 X159.264 Y172.593 E1.0477
N9201 G1 X159.264 Y170.964 E.05236
N9202 M204 S10000
N9203 G1 X190.736 Y157.359 F60000
N9204 G1 F4421.739
N9205 M204 S8000
N9206 G1 X190.736 Y155.731 E.05236
N9207 G1 X159.264 Y164.164 E1.0477
N9208 G1 X159.264 Y164.93 E.02464
N9209 G1 X190.736 Y196.401 E1.43118
N9210 G1 X190.736 Y197.875 E.0474
N9211 G1 X181.722 Y200.29 E.30008
N9212 G1 X177.551 Y200.29 E.1341
N9213 G1 X190.736 Y151.086 E1.63804
N9214 G1 X190.736 Y150.345 E.02383
N9215 G1 X167.775 Y127.385 E1.04415
N9216 G1 X163.371 Y127.385 E.14161
N9217 G1 X159.264 Y142.711 E.51023
N9218 G1 X159.264 Y147.306 E.14776
N9219 G1 X190.736 Y138.873 E1.0477
N9220 G1 X190.736 Y138.831 E.00136
N9221 G1 X179.289 Y127.385 E.52054
N9222 G1 X180.229 Y127.385 E.03022
N9223 G1 X160.694 Y200.29 E2.42708
N9224 G1 X160.083 Y200.29 E.01964
N9225 G1 X159.264 Y199.472 E.03723
N9226 G1 X159.264 Y197.879 E.05122
N9227 M73 P62 R19
N9228 G1 X190.736 Y189.446 E1.0477
N9229 G1 X190.736 Y184.887 E.14661
N9230 G1 X159.264 Y153.416 E1.43118
N9231 G1 X159.264 Y155.735 E.07457
N9232 G1 X190.736 Y147.302 E1.0477
N9233 G1 X190.736 Y145.674 E.05236
N9234 ; WIPE_START
N9235 G1 X190.736 Y147.302 E-.61876
N9236 G1 X190.377 Y147.398 E-.14124
N9237 ; WIPE_END
N9238 G1 E-.04 F1800
N9239 M204 S10000
N9240 G17
N9241 G3 Z6.6 I1.217 J0 P1  F60000
N9242 ; stop printing object, unique label id: 229
N9243 M625
N9244 ; object ids of layer 31 start: 229
N9245 M624 AQAAAAAAAAA=
N9246 ;======== H2D 20250527========
N9247 ; SKIPPABLE_START
N9248 ; SKIPTYPE: timelapse
N9249 M622.1 S1 ; for prev firware, default turned on
N9250 
N9251 M1002 judge_flag timelapse_record_flag
N9252 
N9253 M622 J1
N9254 M993 A2 B2 C2
N9255 M993 A0 B0 C0
N9256 
N9257 
N9258 
N9259 
N9260     M9711 M0 E1 X260 Y141 Z6.6 S11 C10 O0 T3000
N9261 
N9262 
N9263 
N9264 M993 A3 B3 C3
N9265 
N9266 M623
N9267 ; SKIPPABLE_END
N9268 
N9269 ; object ids of this layer31 end: 229
N9270 M625
N9271 ; CHANGE_LAYER
N9272 ; Z_HEIGHT: 6.4
N9273 ; LAYER_HEIGHT: 0.2
N9274 ;======== H2D 20250521========
N9275 ; layer num/total_layer_count: 32/63
N9276 ; update layer progress
N9277 M73 L32
N9278 M991 S0 P31 ;notify layer change
N9279 
N9280 
N9281 ; OBJECT_ID: 229
N9282 ; COOLING_NODE: 0
N9283 ; start printing object, unique label id: 229
N9284 M624 AQAAAAAAAAA=
N9285 G1 X191.084 Y200.639 F60000
N9286 G1 Z6.4
N9287 G1 E.8 F1800
N9288 ; FEATURE: Inner wall
N9289 ; LINE_WIDTH: 0.45
N9290 ; LAYER_HEIGHT: 0.2
N9291 G1 F4421.739
N9292 M204 S8000
N9293 G1 X158.916 Y200.639 E1.03439
N9294 G1 X158.916 Y127.036 E2.36678
N9295 G1 X191.084 Y127.036 E1.03439
N9296 G1 X191.084 Y200.579 E2.36485
N9297 ; COOLING_NODE: 0
N9298 M204 S10000
N9299 G1 X191.491 Y201.046 F60000
N9300 G1 F4421.739
N9301 M204 S8000
N9302 G1 X158.509 Y201.046 E1.06057
N9303 G1 X158.509 Y126.629 E2.39296
N9304 G1 X191.491 Y126.629 E1.06057
N9305 G1 X191.491 Y200.986 E2.39103
N9306 ; COOLING_NODE: 0
N9307 M204 S10000
N9308 G1 X191.898 Y201.453 F60000
N9309 G1 F4421.739
N9310 M204 S8000
N9311 G1 X158.102 Y201.453 E1.08675
N9312 G1 X158.102 Y126.222 E2.41914
N9313 G1 X191.898 Y126.222 E1.08675
N9314 G1 X191.898 Y201.393 E2.41721
N9315 ; COOLING_NODE: 0
N9316 M204 S10000
N9317 G1 X192.29 Y201.845 F60000
N9318 ; FEATURE: Outer wall
N9319 ; LINE_WIDTH: 0.42
N9320 G1 F4773.528
N9321 M204 S5000
N9322 G1 X157.71 Y201.845 E1.03002
N9323 G1 X157.71 Y125.83 E2.26421
N9324 G1 X192.29 Y125.83 E1.03002
N9325 G1 X192.29 Y201.785 E2.26243
N9326 G1 E-.8 F1800
N9327 M204 S10000
N9328 M73 P63 R19
N9329 G1 X187.462 Y200.29 Z6.8 F60000
N9330 G1 Z6.4
N9331 G1 E.8 F1800
N9332 ; FEATURE: Sparse infill
N9333 ; LINE_WIDTH: 0.45
N9334 G1 F4421.739
N9335 M204 S8000
N9336 G1 X185.834 Y200.29 E.05236
N9337 G1 X190.736 Y181.997 E.60901
N9338 G1 X190.736 Y181.164 E.02678
N9339 G1 X159.264 Y189.597 E1.0477
N9340 G1 X159.264 Y187.758 E.05913
N9341 G1 X171.797 Y200.29 E.56993
N9342 G1 X168.976 Y200.29 E.09071
N9343 G1 X188.511 Y127.385 E2.42708
N9344 G1 X190.736 Y127.385 E.07153
N9345 G1 X190.736 Y130.591 E.10311
N9346 G1 X159.264 Y139.024 E1.0477
N9347 G1 X159.264 Y137.395 E.05236
N9348 M204 S10000
N9349 G1 X159.264 Y141.702 F60000
N9350 G1 F4421.739
N9351 M204 S8000
N9352 G1 X190.736 Y173.173 E1.43118
N9353 G1 X190.736 Y172.735 E.01408
N9354 G1 X159.264 Y181.168 E1.0477
N9355 G1 X159.264 Y182.796 E.05236
N9356 M204 S10000
N9357 G1 X159.264 Y172.739 F60000
N9358 G1 F4421.739
N9359 M204 S8000
N9360 G1 X190.736 Y164.306 E1.0477
N9361 G1 X190.736 Y161.659 E.08512
N9362 G1 X159.264 Y130.188 E1.43118
N9363 G1 X159.264 Y130.595 E.01309
N9364 G1 X171.245 Y127.385 E.39885
N9365 G1 X171.654 Y127.385 E.01313
N9366 G1 X159.264 Y173.622 E1.53926
N9367 G1 X159.264 Y176.244 E.08432
N9368 G1 X183.311 Y200.29 E1.09354
N9369 M204 S10000
N9370 G1 X190.736 Y157.506 F60000
N9371 G1 F4421.739
N9372 M204 S8000
N9373 G1 X190.736 Y155.877 E.05236
N9374 G1 X159.264 Y164.31 E1.0477
N9375 G1 X159.264 Y164.73 E.0135
N9376 G1 X190.736 Y196.201 E1.43118
N9377 G1 X190.736 Y198.021 E.05854
N9378 G1 X182.268 Y200.29 E.28189
N9379 G1 X177.405 Y200.29 E.15638
N9380 G1 X190.736 Y150.54 E1.65623
N9381 G1 X190.736 Y150.145 E.01269
N9382 G1 X167.975 Y127.385 E1.03505
N9383 G1 X163.225 Y127.385 E.15275
N9384 G1 X159.264 Y142.165 E.49204
N9385 G1 X159.264 Y147.453 E.17003
N9386 G1 X190.736 Y139.02 E1.0477
N9387 G1 X190.736 Y138.631 E.0125
N9388 G1 X179.489 Y127.385 E.51145
N9389 G1 X180.082 Y127.385 E.01908
N9390 G1 X160.547 Y200.29 E2.42708
N9391 G1 X160.283 Y200.29 E.0085
N9392 G1 X159.264 Y199.272 E.04632
N9393 G1 X159.264 Y198.025 E.04008
N9394 G1 X190.736 Y189.593 E1.0477
N9395 G1 X190.736 Y184.687 E.15775
N9396 G1 X159.264 Y153.216 E1.43118
N9397 G1 X159.264 Y155.881 E.08571
N9398 G1 X190.736 Y147.449 E1.0477
N9399 G1 X190.736 Y145.82 E.05236
N9400 ; WIPE_START
N9401 G1 X190.736 Y147.449 E-.61876
N9402 G1 X190.377 Y147.545 E-.14124
N9403 ; WIPE_END
N9404 G1 E-.04 F1800
N9405 M204 S10000
N9406 G17
N9407 G3 Z6.8 I1.217 J0 P1  F60000
N9408 ; stop printing object, unique label id: 229
N9409 M625
N9410 ; object ids of layer 32 start: 229
N9411 M624 AQAAAAAAAAA=
N9412 ;======== H2D 20250527========
N9413 ; SKIPPABLE_START
N9414 ; SKIPTYPE: timelapse
N9415 M622.1 S1 ; for prev firware, default turned on
N9416 
N9417 M1002 judge_flag timelapse_record_flag
N9418 
N9419 M622 J1
N9420 M993 A2 B2 C2
N9421 M993 A0 B0 C0
N9422 
N9423 
N9424 
N9425 
N9426     M9711 M0 E1 X260 Y141 Z6.8 S11 C10 O0 T3000
N9427 
N9428 
N9429 
N9430 M993 A3 B3 C3
N9431 
N9432 M623
N9433 ; SKIPPABLE_END
N9434 
N9435 ; object ids of this layer32 end: 229
N9436 M625
N9437 ; CHANGE_LAYER
N9438 ; Z_HEIGHT: 6.6
N9439 ; LAYER_HEIGHT: 0.2
N9440 ;======== H2D 20250521========
N9441 ; layer num/total_layer_count: 33/63
N9442 ; update layer progress
N9443 M73 L33
N9444 M991 S0 P32 ;notify layer change
N9445 
N9446 
N9447 ; OBJECT_ID: 229
N9448 ; COOLING_NODE: 0
N9449 ; start printing object, unique label id: 229
N9450 M624 AQAAAAAAAAA=
N9451 G1 X191.084 Y200.639 F60000
N9452 G1 Z6.6
N9453 G1 E.8 F1800
N9454 ; FEATURE: Inner wall
N9455 ; LINE_WIDTH: 0.45
N9456 ; LAYER_HEIGHT: 0.2
N9457 G1 F4421.739
N9458 M204 S8000
N9459 G1 X158.916 Y200.639 E1.03439
N9460 G1 X158.916 Y127.036 E2.36678
N9461 G1 X191.084 Y127.036 E1.03439
N9462 G1 X191.084 Y200.579 E2.36485
N9463 ; COOLING_NODE: 0
N9464 M204 S10000
N9465 G1 X191.491 Y201.046 F60000
N9466 G1 F4421.739
N9467 M204 S8000
N9468 G1 X158.509 Y201.046 E1.06057
N9469 G1 X158.509 Y126.629 E2.39296
N9470 G1 X191.491 Y126.629 E1.06057
N9471 G1 X191.491 Y200.986 E2.39103
N9472 ; COOLING_NODE: 0
N9473 M204 S10000
N9474 G1 X191.898 Y201.453 F60000
N9475 G1 F4421.739
N9476 M204 S8000
N9477 G1 X158.102 Y201.453 E1.08675
N9478 G1 X158.102 Y126.222 E2.41914
N9479 G1 X191.898 Y126.222 E1.08675
N9480 G1 X191.898 Y201.393 E2.41721
N9481 ; COOLING_NODE: 0
N9482 M204 S10000
N9483 G1 X192.29 Y201.845 F60000
N9484 ; FEATURE: Outer wall
N9485 ; LINE_WIDTH: 0.42
N9486 G1 F4773.528
N9487 M204 S5000
N9488 G1 X157.71 Y201.845 E1.03002
N9489 G1 X157.71 Y125.83 E2.26421
N9490 G1 X192.29 Y125.83 E1.03002
N9491 G1 X192.29 Y201.785 E2.26243
N9492 G1 E-.8 F1800
N9493 M204 S10000
N9494 G1 X187.316 Y200.29 Z7 F60000
N9495 G1 Z6.6
N9496 G1 E.8 F1800
N9497 ; FEATURE: Sparse infill
N9498 ; LINE_WIDTH: 0.45
N9499 G1 F4421.739
N9500 M204 S8000
N9501 G1 X185.687 Y200.29 E.05236
N9502 G1 X190.736 Y181.45 E.6272
N9503 G1 X190.736 Y181.31 E.0045
N9504 G1 X159.264 Y189.743 E1.0477
N9505 G1 X159.264 Y187.558 E.07027
N9506 G1 X171.997 Y200.29 E.57903
N9507 G1 X168.83 Y200.29 E.10185
N9508 G1 X188.365 Y127.385 E2.42708
N9509 G1 X190.736 Y127.385 E.07624
N9510 G1 X190.736 Y130.738 E.10782
N9511 G1 X159.264 Y139.17 E1.0477
N9512 G1 X159.264 Y137.542 E.05236
N9513 M204 S10000
N9514 G1 X159.264 Y145.971 F60000
N9515 G1 F4421.739
N9516 M204 S8000
N9517 G1 X159.264 Y147.599 E.05236
N9518 G1 X190.736 Y139.166 E1.0477
N9519 G1 X190.736 Y138.431 E.02364
N9520 G1 X179.689 Y127.385 E.50235
N9521 G1 X179.936 Y127.385 E.00794
N9522 G1 X160.401 Y200.29 E2.42708
N9523 G1 X160.483 Y200.29 E.00264
N9524 G1 X159.264 Y199.072 E.05542
N9525 G1 X159.264 Y198.172 E.02894
N9526 G1 X190.736 Y189.739 E1.04769
N9527 G1 X190.736 Y184.487 E.16889
N9528 G1 X159.264 Y153.016 E1.43118
N9529 G1 X159.264 Y156.028 E.09685
N9530 G1 X190.736 Y147.595 E1.0477
N9531 G1 X190.736 Y145.967 E.05236
N9532 M204 S10000
N9533 M73 P64 R19
N9534 G1 X190.736 Y166.081 F60000
N9535 G1 F4421.739
N9536 M204 S8000
N9537 G1 X190.736 Y164.453 E.05236
N9538 G1 X159.264 Y172.885 E1.04769
N9539 G1 X159.264 Y173.075 E.0061
N9540 G1 X171.507 Y127.385 E1.52107
N9541 G1 X171.792 Y127.385 E.00915
N9542 G1 X159.264 Y130.741 E.41704
N9543 G1 X159.264 Y129.988 E.02423
N9544 G1 X190.736 Y161.459 E1.43118
N9545 G1 X190.736 Y156.024 E.17478
N9546 G1 X159.264 Y164.457 E1.0477
N9547 G1 X159.264 Y164.53 E.00236
N9548 G1 X190.736 Y196.001 E1.43118
N9549 G1 X190.736 Y198.168 E.06968
N9550 G1 X182.815 Y200.29 E.2637
N9551 G1 X177.259 Y200.29 E.17866
N9552 G1 X190.736 Y149.994 E1.67442
N9553 G1 X190.736 Y149.945 E.00156
N9554 G1 X168.175 Y127.385 E1.02596
N9555 G1 X163.078 Y127.385 E.16389
N9556 G1 X159.264 Y141.618 E.47385
N9557 G1 X159.264 Y141.502 E.00375
N9558 G1 X190.736 Y172.973 E1.43118
N9559 G1 X190.736 Y172.881 E.00294
N9560 G1 X159.264 Y181.314 E1.0477
N9561 G1 X159.264 Y176.044 E.16948
N9562 G1 X183.511 Y200.29 E1.10263
N9563 ; WIPE_START
N9564 G1 X182.097 Y198.876 E-.76
N9565 ; WIPE_END
N9566 G1 E-.04 F1800
N9567 M204 S10000
N9568 G17
N9569 G3 Z7 I1.217 J0 P1  F60000
N9570 ; stop printing object, unique label id: 229
N9571 M625
N9572 ; object ids of layer 33 start: 229
N9573 M624 AQAAAAAAAAA=
N9574 ;======== H2D 20250527========
N9575 ; SKIPPABLE_START
N9576 ; SKIPTYPE: timelapse
N9577 M622.1 S1 ; for prev firware, default turned on
N9578 
N9579 M1002 judge_flag timelapse_record_flag
N9580 
N9581 M622 J1
N9582 M993 A2 B2 C2
N9583 M993 A0 B0 C0
N9584 
N9585 
N9586 
N9587 
N9588     M9711 M0 E1 X260 Y141 Z7 S11 C10 O0 T3000
N9589 
N9590 
N9591 
N9592 M993 A3 B3 C3
N9593 
N9594 M623
N9595 ; SKIPPABLE_END
N9596 
N9597 ; object ids of this layer33 end: 229
N9598 M625
N9599 ; CHANGE_LAYER
N9600 ; Z_HEIGHT: 6.8
N9601 ; LAYER_HEIGHT: 0.2
N9602 ;======== H2D 20250521========
N9603 ; layer num/total_layer_count: 34/63
N9604 ; update layer progress
N9605 M73 L34
N9606 M991 S0 P33 ;notify layer change
N9607 
N9608 
N9609 ; OBJECT_ID: 229
N9610 ; COOLING_NODE: 0
N9611 ; start printing object, unique label id: 229
N9612 M624 AQAAAAAAAAA=
N9613 G1 X191.084 Y200.639 F60000
N9614 G1 Z6.8
N9615 G1 E.8 F1800
N9616 ; FEATURE: Inner wall
N9617 ; LINE_WIDTH: 0.45
N9618 ; LAYER_HEIGHT: 0.2
N9619 G1 F4421.739
N9620 M204 S8000
N9621 G1 X158.916 Y200.639 E1.03439
N9622 G1 X158.916 Y127.036 E2.36678
N9623 G1 X191.084 Y127.036 E1.03439
N9624 G1 X191.084 Y200.579 E2.36485
N9625 ; COOLING_NODE: 0
N9626 M204 S10000
N9627 G1 X191.491 Y201.046 F60000
N9628 G1 F4421.739
N9629 M204 S8000
N9630 G1 X158.509 Y201.046 E1.06057
N9631 G1 X158.509 Y126.629 E2.39296
N9632 G1 X191.491 Y126.629 E1.06057
N9633 G1 X191.491 Y200.986 E2.39103
N9634 ; COOLING_NODE: 0
N9635 M204 S10000
N9636 G1 X191.898 Y201.453 F60000
N9637 G1 F4421.739
N9638 M204 S8000
N9639 G1 X158.102 Y201.453 E1.08675
N9640 G1 X158.102 Y126.222 E2.41914
N9641 G1 X191.898 Y126.222 E1.08675
N9642 G1 X191.898 Y201.393 E2.41721
N9643 ; COOLING_NODE: 0
N9644 M204 S10000
N9645 G1 X192.29 Y201.845 F60000
N9646 ; FEATURE: Outer wall
N9647 ; LINE_WIDTH: 0.42
N9648 M73 P64 R18
N9649 G1 F4773.528
N9650 M204 S5000
N9651 G1 X157.71 Y201.845 E1.03002
N9652 G1 X157.71 Y125.83 E2.26421
N9653 G1 X192.29 Y125.83 E1.03002
N9654 G1 X192.29 Y201.785 E2.26243
N9655 G1 E-.8 F1800
N9656 M204 S10000
N9657 G1 X187.169 Y200.29 Z7.2 F60000
N9658 G1 Z6.8
N9659 G1 E.8 F1800
N9660 ; FEATURE: Sparse infill
N9661 ; LINE_WIDTH: 0.45
N9662 G1 F4421.739
N9663 M204 S8000
N9664 G1 X185.541 Y200.29 E.05236
N9665 G1 X190.736 Y180.904 E.64539
N9666 G1 X190.736 Y179.275 E.05236
N9667 M204 S10000
N9668 G1 X190.736 Y181.457 F60000
N9669 G1 F4421.739
N9670 M204 S8000
N9671 G1 X159.264 Y189.889 E1.0477
N9672 G1 X159.264 Y187.358 E.08141
N9673 G1 X172.197 Y200.29 E.58812
N9674 G1 X168.683 Y200.29 E.11299
N9675 G1 X188.218 Y127.385 E2.42708
N9676 G1 X190.736 Y127.385 E.08094
N9677 G1 X190.736 Y130.884 E.11252
N9678 G1 X159.264 Y139.317 E1.0477
N9679 G1 X159.264 Y137.688 E.05236
N9680 M204 S10000
N9681 G1 X159.264 Y146.117 F60000
N9682 G1 F4421.739
N9683 M204 S8000
N9684 G1 X159.264 Y147.745 E.05236
N9685 G1 X190.736 Y139.313 E1.0477
N9686 G1 X190.736 Y138.231 E.03478
N9687 G1 X179.889 Y127.385 E.49326
N9688 G1 X179.79 Y127.385 E.0032
N9689 G1 X160.255 Y200.29 E2.42708
N9690 G1 X160.683 Y200.29 E.01378
N9691 G1 X159.264 Y198.872 E.06451
N9692 G1 X159.264 Y198.318 E.0178
N9693 G1 X190.736 Y189.885 E1.0477
N9694 G1 X190.736 Y184.287 E.18003
N9695 G1 X159.264 Y152.816 E1.43118
N9696 G1 X159.264 Y156.174 E.10799
N9697 G1 X190.736 Y147.742 E1.04769
N9698 G1 X190.736 Y146.113 E.05236
N9699 M204 S10000
N9700 G1 X190.736 Y154.542 F60000
N9701 G1 F4421.739
N9702 M204 S8000
N9703 G1 X190.736 Y156.17 E.05236
N9704 G1 X159.264 Y164.603 E1.0477
N9705 G1 X159.264 Y164.33 E.00878
N9706 G1 X190.736 Y195.801 E1.43118
N9707 G1 X190.736 Y198.314 E.08082
N9708 G1 X183.361 Y200.29 E.24551
N9709 G1 X183.711 Y200.29 E.01126
N9710 G1 X159.264 Y175.844 E1.11173
N9711 G1 X159.264 Y181.461 E.18061
N9712 G1 X190.736 Y173.028 E1.0477
N9713 G1 X190.736 Y172.773 E.0082
N9714 G1 X159.264 Y141.302 E1.43118
N9715 G1 X159.264 Y141.072 E.00739
N9716 G1 X162.932 Y127.385 E.45566
N9717 G1 X168.375 Y127.385 E.17503
N9718 G1 X190.736 Y149.745 E1.01686
N9719 G1 X190.736 Y149.447 E.00958
N9720 G1 X177.112 Y200.29 E1.69261
N9721 G1 X178.74 Y200.29 E.05236
N9722 M204 S10000
N9723 G1 X173.967 Y127.385 F60000
N9724 G1 F4421.739
N9725 M204 S8000
N9726 G1 X172.338 Y127.385 E.05236
N9727 G1 X159.264 Y130.888 E.43523
N9728 G1 X159.264 Y129.788 E.03536
N9729 G1 X190.736 Y161.259 E1.43118
N9730 G1 X190.736 Y164.599 E.1074
N9731 G1 X159.264 Y173.032 E1.0477
N9732 G1 X159.264 Y172.529 E.01618
N9733 G1 X171.361 Y127.385 E1.50288
N9734 ; WIPE_START
N9735 G1 X170.843 Y129.317 E-.76
N9736 ; WIPE_END
N9737 G1 E-.04 F1800
N9738 M204 S10000
N9739 G17
N9740 G3 Z7.2 I1.217 J0 P1  F60000
N9741 ; stop printing object, unique label id: 229
N9742 M625
N9743 ; object ids of layer 34 start: 229
N9744 M624 AQAAAAAAAAA=
N9745 ;======== H2D 20250527========
N9746 ; SKIPPABLE_START
N9747 ; SKIPTYPE: timelapse
N9748 M622.1 S1 ; for prev firware, default turned on
N9749 
N9750 M1002 judge_flag timelapse_record_flag
N9751 
N9752 M622 J1
N9753 M993 A2 B2 C2
N9754 M993 A0 B0 C0
N9755 
N9756 
N9757 
N9758 
N9759     M9711 M0 E1 X260 Y141 Z7.2 S11 C10 O0 T3000
N9760 
N9761 
N9762 
N9763 M993 A3 B3 C3
N9764 
N9765 M623
N9766 ; SKIPPABLE_END
N9767 
N9768 ; object ids of this layer34 end: 229
N9769 M625
N9770 ; CHANGE_LAYER
N9771 ; Z_HEIGHT: 7
N9772 ; LAYER_HEIGHT: 0.2
N9773 ;======== H2D 20250521========
N9774 ; layer num/total_layer_count: 35/63
N9775 ; update layer progress
N9776 M73 L35
N9777 M991 S0 P34 ;notify layer change
N9778 
N9779 
N9780 ; OBJECT_ID: 229
N9781 ; COOLING_NODE: 0
N9782 ; start printing object, unique label id: 229
N9783 M624 AQAAAAAAAAA=
N9784 M73 P65 R18
N9785 G1 X191.084 Y200.639 F60000
N9786 G1 Z7
N9787 G1 E.8 F1800
N9788 ; FEATURE: Inner wall
N9789 ; LINE_WIDTH: 0.45
N9790 ; LAYER_HEIGHT: 0.2
N9791 G1 F4421.739
N9792 M204 S8000
N9793 G1 X158.916 Y200.639 E1.03439
N9794 G1 X158.916 Y127.036 E2.36678
N9795 G1 X191.084 Y127.036 E1.03439
N9796 G1 X191.084 Y200.579 E2.36485
N9797 ; COOLING_NODE: 0
N9798 M204 S10000
N9799 G1 X191.491 Y201.046 F60000
N9800 G1 F4421.739
N9801 M204 S8000
N9802 G1 X158.509 Y201.046 E1.06057
N9803 G1 X158.509 Y126.629 E2.39296
N9804 G1 X191.491 Y126.629 E1.06057
N9805 G1 X191.491 Y200.986 E2.39103
N9806 ; COOLING_NODE: 0
N9807 M204 S10000
N9808 G1 X191.898 Y201.453 F60000
N9809 G1 F4421.739
N9810 M204 S8000
N9811 G1 X158.102 Y201.453 E1.08675
N9812 G1 X158.102 Y126.222 E2.41914
N9813 G1 X191.898 Y126.222 E1.08675
N9814 G1 X191.898 Y201.393 E2.41721
N9815 ; COOLING_NODE: 0
N9816 M204 S10000
N9817 G1 X192.29 Y201.845 F60000
N9818 ; FEATURE: Outer wall
N9819 ; LINE_WIDTH: 0.42
N9820 G1 F4773.528
N9821 M204 S5000
N9822 G1 X157.71 Y201.845 E1.03002
N9823 G1 X157.71 Y125.83 E2.26421
N9824 G1 X192.29 Y125.83 E1.03002
N9825 G1 X192.29 Y201.785 E2.26243
N9826 G1 E-.8 F1800
N9827 M204 S10000
N9828 G1 X187.023 Y200.29 Z7.4 F60000
N9829 G1 Z7
N9830 G1 E.8 F1800
N9831 ; FEATURE: Sparse infill
N9832 ; LINE_WIDTH: 0.45
N9833 G1 F4421.739
N9834 M204 S8000
N9835 G1 X185.395 Y200.29 E.05236
N9836 G1 X190.736 Y180.357 E.66358
N9837 G1 X190.736 Y178.729 E.05236
N9838 M204 S10000
N9839 G1 X190.736 Y181.603 F60000
N9840 G1 F4421.739
N9841 M204 S8000
N9842 G1 X159.264 Y190.036 E1.0477
N9843 G1 X159.264 Y187.158 E.09255
N9844 G1 X172.397 Y200.29 E.59722
N9845 G1 X168.537 Y200.29 E.12413
N9846 G1 X188.072 Y127.385 E2.42708
N9847 G1 X190.736 Y127.385 E.08565
N9848 G1 X190.736 Y131.03 E.11723
N9849 G1 X159.264 Y139.463 E1.0477
N9850 M204 S10000
N9851 G1 X159.264 Y146.263 F60000
N9852 G1 F4421.739
N9853 M204 S8000
N9854 G1 X159.264 Y147.892 E.05236
N9855 G1 X190.736 Y139.459 E1.0477
N9856 G1 X190.736 Y138.031 E.04592
N9857 G1 X180.089 Y127.385 E.48416
N9858 G1 X179.643 Y127.385 E.01434
N9859 G1 X160.108 Y200.29 E2.42708
N9860 G1 X160.883 Y200.29 E.02492
N9861 G1 X159.264 Y198.672 E.07361
N9862 G1 X159.264 Y198.465 E.00666
N9863 G1 X190.736 Y190.032 E1.0477
N9864 G1 X190.736 Y184.087 E.19117
N9865 G1 X159.264 Y152.616 E1.43118
N9866 G1 X159.264 Y156.321 E.11913
N9867 G1 X190.736 Y147.888 E1.0477
N9868 G1 X190.736 Y148.901 E.03257
N9869 G1 X176.966 Y200.29 E1.7108
N9870 G1 X178.594 Y200.29 E.05236
N9871 M204 S10000
N9872 G1 X174.513 Y127.385 F60000
N9873 G1 F4421.739
N9874 M204 S8000
N9875 G1 X172.885 Y127.385 E.05236
N9876 G1 X159.264 Y131.034 E.45342
N9877 G1 X159.264 Y129.588 E.0465
N9878 G1 X190.736 Y161.059 E1.43118
N9879 G1 X190.736 Y164.746 E.11854
N9880 G1 X159.264 Y173.178 E1.0477
N9881 G1 X159.264 Y171.982 E.03845
N9882 G1 X171.214 Y127.385 E1.48469
N9883 G1 X168.575 Y127.385 E.08487
N9884 G1 X190.736 Y149.545 E1.00777
N9885 M204 S10000
N9886 G1 X190.736 Y154.688 F60000
N9887 G1 F4421.739
N9888 M204 S8000
N9889 G1 X190.736 Y156.317 E.05236
N9890 G1 X159.264 Y164.749 E1.0477
N9891 G1 X159.264 Y164.13 E.01992
N9892 G1 X190.736 Y195.601 E1.43118
N9893 G1 X190.736 Y198.461 E.09196
N9894 G1 X183.907 Y200.29 E.22732
N9895 G1 X159.264 Y175.644 E1.12074
N9896 G1 X159.264 Y181.607 E.19175
N9897 G1 X190.736 Y173.174 E1.0477
N9898 G1 X190.736 Y172.573 E.01933
N9899 G1 X159.264 Y141.102 E1.43118
N9900 G1 X159.264 Y140.526 E.01853
N9901 G1 X162.786 Y127.385 E.43747
N9902 G1 X164.414 Y127.385 E.05236
N9903 ; WIPE_START
N9904 G1 X162.786 Y127.385 E-.61876
N9905 G1 X162.689 Y127.744 E-.14124
N9906 ; WIPE_END
N9907 G1 E-.04 F1800
N9908 M204 S10000
N9909 G17
N9910 G3 Z7.4 I1.217 J0 P1  F60000
N9911 ; stop printing object, unique label id: 229
N9912 M625
N9913 ; object ids of layer 35 start: 229
N9914 M624 AQAAAAAAAAA=
N9915 ;======== H2D 20250527========
N9916 ; SKIPPABLE_START
N9917 ; SKIPTYPE: timelapse
N9918 M622.1 S1 ; for prev firware, default turned on
N9919 
N9920 M1002 judge_flag timelapse_record_flag
N9921 
N9922 M622 J1
N9923 M993 A2 B2 C2
N9924 M993 A0 B0 C0
N9925 
N9926 
N9927 
N9928 
N9929     M9711 M0 E1 X260 Y141 Z7.4 S11 C10 O0 T3000
N9930 
N9931 
N9932 
N9933 M993 A3 B3 C3
N9934 
N9935 M623
N9936 ; SKIPPABLE_END
N9937 
N9938 ; object ids of this layer35 end: 229
N9939 M625
N9940 ; CHANGE_LAYER
N9941 ; Z_HEIGHT: 7.2
N9942 ; LAYER_HEIGHT: 0.2
N9943 ;======== H2D 20250521========
N9944 ; layer num/total_layer_count: 36/63
N9945 ; update layer progress
N9946 M73 L36
N9947 M991 S0 P35 ;notify layer change
N9948 
N9949 
N9950 ; OBJECT_ID: 229
N9951 ; COOLING_NODE: 0
N9952 ; start printing object, unique label id: 229
N9953 M624 AQAAAAAAAAA=
N9954 G1 X191.084 Y200.639 F60000
N9955 G1 Z7.2
N9956 G1 E.8 F1800
N9957 ; FEATURE: Inner wall
N9958 ; LINE_WIDTH: 0.45
N9959 ; LAYER_HEIGHT: 0.2
N9960 G1 F4421.739
N9961 M204 S8000
N9962 G1 X158.916 Y200.639 E1.03439
N9963 G1 X158.916 Y127.036 E2.36678
N9964 G1 X191.084 Y127.036 E1.03439
N9965 G1 X191.084 Y200.579 E2.36485
N9966 ; COOLING_NODE: 0
N9967 M204 S10000
N9968 G1 X191.491 Y201.046 F60000
N9969 G1 F4421.739
N9970 M204 S8000
N9971 G1 X158.509 Y201.046 E1.06057
N9972 G1 X158.509 Y126.629 E2.39296
N9973 G1 X191.491 Y126.629 E1.06057
N9974 G1 X191.491 Y200.986 E2.39103
N9975 ; COOLING_NODE: 0
N9976 M204 S10000
N9977 G1 X191.898 Y201.453 F60000
N9978 G1 F4421.739
N9979 M204 S8000
N9980 G1 X158.102 Y201.453 E1.08675
N9981 G1 X158.102 Y126.222 E2.41914
N9982 G1 X191.898 Y126.222 E1.08675
N9983 G1 X191.898 Y201.393 E2.41721
N9984 ; COOLING_NODE: 0
N9985 M204 S10000
N9986 G1 X192.29 Y201.845 F60000
N9987 ; FEATURE: Outer wall
N9988 ; LINE_WIDTH: 0.42
N9989 M73 P66 R18
N9990 G1 F4773.528
N9991 M204 S5000
N9992 G1 X157.71 Y201.845 E1.03002
N9993 G1 X157.71 Y125.83 E2.26421
N9994 G1 X192.29 Y125.83 E1.03002
N9995 G1 X192.29 Y201.785 E2.26243
N9996 G1 E-.8 F1800
N9997 M204 S10000
N9998 G1 X185.248 Y200.29 Z7.6 F60000
N9999 G1 Z7.2
N10000 G1 E.8 F1800
N10001 ; FEATURE: Sparse infill
N10002 ; LINE_WIDTH: 0.45
N10003 G1 F4421.739
N10004 M204 S8000
N10005 G1 X190.736 Y179.811 E.68177
N10006 G1 X190.736 Y178.183 E.05236
N10007 M204 S10000
N10008 G1 X190.736 Y188.55 F60000
N10009 G1 F4421.739
N10010 M204 S8000
N10011 G1 X190.736 Y190.178 E.05236
N10012 G1 X159.264 Y198.611 E1.0477
N10013 G1 X159.264 Y198.472 E.00448
N10014 G1 X161.083 Y200.29 E.0827
N10015 G1 X159.962 Y200.29 E.03606
N10016 G1 X179.497 Y127.385 E2.42708
N10017 G1 X180.289 Y127.385 E.02548
N10018 G1 X190.736 Y137.831 E.47507
N10019 G1 X190.736 Y139.606 E.05706
N10020 G1 X159.264 Y148.038 E1.0477
N10021 G1 X159.264 Y140.902 E.22948
N10022 G1 X190.736 Y172.373 E1.43118
N10023 G1 X190.736 Y173.321 E.03047
N10024 G1 X159.264 Y181.753 E1.04769
N10025 G1 X159.264 Y175.444 E.20289
N10026 G1 X184.111 Y200.29 E1.12992
N10027 G1 X184.454 Y200.29 E.01102
N10028 G1 X190.736 Y198.607 E.20913
N10029 G1 X190.736 Y195.401 E.1031
N10030 G1 X159.264 Y163.93 E1.43118
N10031 G1 X159.264 Y164.896 E.03106
N10032 G1 X190.736 Y156.463 E1.0477
N10033 G1 X190.736 Y154.835 E.05236
N10034 M204 S10000
N10035 G1 X190.736 Y149.345 F60000
N10036 G1 F4421.739
N10037 M204 S8000
N10038 M73 P66 R17
N10039 G1 X168.775 Y127.385 E.99867
N10040 G1 X171.068 Y127.385 E.07373
N10041 G1 X159.264 Y171.436 E1.4665
N10042 G1 X159.264 Y173.325 E.06073
N10043 G1 X190.736 Y164.892 E1.0477
N10044 G1 X190.736 Y160.859 E.12968
N10045 G1 X159.264 Y129.388 E1.43118
N10046 G1 X159.264 Y131.181 E.05764
N10047 G1 X173.431 Y127.385 E.47162
N10048 G1 X175.059 Y127.385 E.05236
N10049 M204 S10000
N10050 G1 X164.267 Y127.385 F60000
N10051 G1 F4421.739
N10052 M204 S8000
N10053 G1 X162.639 Y127.385 E.05236
N10054 G1 X159.264 Y139.979 E.41928
N10055 G1 X159.264 Y139.609 E.01189
N10056 G1 X190.736 Y131.177 E1.0477
N10057 G1 X190.736 Y127.385 E.12194
N10058 G1 X187.926 Y127.385 E.09036
N10059 G1 X168.391 Y200.29 E2.42708
N10060 G1 X172.597 Y200.29 E.13527
N10061 G1 X159.264 Y186.958 E.60631
N10062 G1 X159.264 Y190.182 E.10369
N10063 G1 X190.736 Y181.75 E1.0477
N10064 G1 X190.736 Y183.887 E.06873
N10065 G1 X159.264 Y152.416 E1.43118
N10066 G1 X159.264 Y156.467 E.13027
N10067 G1 X190.736 Y148.034 E1.0477
N10068 G1 X190.736 Y148.354 E.01029
N10069 G1 X176.819 Y200.29 E1.72899
N10070 G1 X178.448 Y200.29 E.05236
N10071 ; WIPE_START
N10072 G1 X176.819 Y200.29 E-.61876
N10073 G1 X176.916 Y199.931 E-.14124
N10074 ; WIPE_END
N10075 G1 E-.04 F1800
N10076 M204 S10000
N10077 G17
N10078 G3 Z7.6 I1.217 J0 P1  F60000
N10079 ; stop printing object, unique label id: 229
N10080 M625
N10081 ; object ids of layer 36 start: 229
N10082 M624 AQAAAAAAAAA=
N10083 ;======== H2D 20250527========
N10084 ; SKIPPABLE_START
N10085 ; SKIPTYPE: timelapse
N10086 M622.1 S1 ; for prev firware, default turned on
N10087 
N10088 M1002 judge_flag timelapse_record_flag
N10089 
N10090 M622 J1
N10091 M993 A2 B2 C2
N10092 M993 A0 B0 C0
N10093 
N10094 
N10095 
N10096 
N10097     M9711 M0 E1 X260 Y141 Z7.6 S11 C10 O0 T3000
N10098 
N10099 
N10100 
N10101 M993 A3 B3 C3
N10102 
N10103 M623
N10104 ; SKIPPABLE_END
N10105 
N10106 ; object ids of this layer36 end: 229
N10107 M625
N10108 ; CHANGE_LAYER
N10109 ; Z_HEIGHT: 7.4
N10110 ; LAYER_HEIGHT: 0.2
N10111 ;======== H2D 20250521========
N10112 ; layer num/total_layer_count: 37/63
N10113 ; update layer progress
N10114 M73 L37
N10115 M991 S0 P36 ;notify layer change
N10116 
N10117 
N10118 ; OBJECT_ID: 229
N10119 ; COOLING_NODE: 0
N10120 ; start printing object, unique label id: 229
N10121 M624 AQAAAAAAAAA=
N10122 G1 X191.084 Y200.639 F60000
N10123 G1 Z7.4
N10124 G1 E.8 F1800
N10125 ; FEATURE: Inner wall
N10126 ; LINE_WIDTH: 0.45
N10127 ; LAYER_HEIGHT: 0.2
N10128 G1 F4421.739
N10129 M204 S8000
N10130 G1 X158.916 Y200.639 E1.03439
N10131 G1 X158.916 Y127.036 E2.36678
N10132 G1 X191.084 Y127.036 E1.03439
N10133 G1 X191.084 Y200.579 E2.36485
N10134 ; COOLING_NODE: 0
N10135 M204 S10000
N10136 G1 X191.491 Y201.046 F60000
N10137 G1 F4421.739
N10138 M204 S8000
N10139 G1 X158.509 Y201.046 E1.06057
N10140 G1 X158.509 Y126.629 E2.39296
N10141 G1 X191.491 Y126.629 E1.06057
N10142 G1 X191.491 Y200.986 E2.39103
N10143 ; COOLING_NODE: 0
N10144 M204 S10000
N10145 G1 X191.898 Y201.453 F60000
N10146 G1 F4421.739
N10147 M204 S8000
N10148 G1 X158.102 Y201.453 E1.08675
N10149 G1 X158.102 Y126.222 E2.41914
N10150 G1 X191.898 Y126.222 E1.08675
N10151 G1 X191.898 Y201.393 E2.41721
N10152 ; COOLING_NODE: 0
N10153 M204 S10000
N10154 G1 X192.29 Y201.845 F60000
N10155 ; FEATURE: Outer wall
N10156 ; LINE_WIDTH: 0.42
N10157 G1 F4773.528
N10158 M204 S5000
N10159 G1 X157.71 Y201.845 E1.03002
N10160 G1 X157.71 Y125.83 E2.26421
N10161 G1 X192.29 Y125.83 E1.03002
N10162 G1 X192.29 Y201.785 E2.26243
N10163 G1 E-.8 F1800
N10164 M204 S10000
N10165 G1 X184.748 Y200.612 Z7.8 F60000
N10166 G1 X182.683 Y200.29 Z7.8
N10167 G1 Z7.4
N10168 G1 E.8 F1800
N10169 ; FEATURE: Sparse infill
N10170 ; LINE_WIDTH: 0.45
N10171 G1 F4421.739
N10172 M204 S8000
N10173 G1 X184.311 Y200.29 E.05236
N10174 G1 X159.264 Y175.244 E1.13901
N10175 G1 X159.264 Y173.471 E.05701
N10176 G1 X190.736 Y165.038 E1.0477
N10177 G1 X190.736 Y166.667 E.05236
N10178 M204 S10000
N10179 G1 X190.736 Y177.636 F60000
N10180 G1 F4421.739
N10181 M204 S8000
N10182 G1 X190.736 Y179.265 E.05236
N10183 G1 X185.102 Y200.29 E.69996
N10184 G1 X185 Y200.29 E.00326
N10185 G1 X190.736 Y198.754 E.19093
N10186 G1 X190.736 Y195.201 E.11424
N10187 G1 X159.264 Y163.73 E1.43118
N10188 G1 X159.264 Y165.042 E.0422
N10189 G1 X190.736 Y156.61 E1.0477
N10190 M73 P67 R17
N10191 G1 X190.736 Y160.659 E.13022
N10192 G1 X159.264 Y129.188 E1.43118
N10193 G1 X159.264 Y131.327 E.06878
N10194 G1 X173.977 Y127.385 E.48981
N10195 G1 X175.606 Y127.385 E.05236
N10196 M204 S10000
N10197 G1 X164.121 Y127.385 F60000
N10198 G1 F4421.739
N10199 M204 S8000
N10200 G1 X162.493 Y127.385 E.05236
N10201 G1 X159.264 Y139.433 E.40109
N10202 G1 X159.264 Y139.756 E.01039
N10203 G1 X190.736 Y131.323 E1.04769
N10204 G1 X190.736 Y127.385 E.12665
N10205 G1 X187.779 Y127.385 E.09507
N10206 G1 X168.244 Y200.29 E2.42708
N10207 G1 X166.616 Y200.29 E.05236
N10208 M204 S10000
N10209 G1 X190.736 Y188.696 F60000
N10210 G1 F4421.739
N10211 M204 S8000
N10212 G1 X190.736 Y190.325 E.05236
N10213 G1 X159.264 Y198.757 E1.0477
N10214 G1 X159.264 Y198.272 E.01562
N10215 G1 X161.283 Y200.29 E.0918
N10216 G1 X159.815 Y200.29 E.0472
N10217 G1 X179.35 Y127.385 E2.42708
N10218 G1 X180.489 Y127.385 E.03662
N10219 G1 X190.736 Y137.631 E.46597
N10220 G1 X190.736 Y139.752 E.0682
N10221 G1 X159.264 Y148.185 E1.0477
N10222 G1 X159.264 Y152.216 E.12963
N10223 G1 X190.736 Y183.687 E1.43118
N10224 G1 X190.736 Y181.896 E.05759
N10225 G1 X159.264 Y190.329 E1.0477
N10226 G1 X159.264 Y186.758 E.11483
N10227 G1 X172.797 Y200.29 E.61541
N10228 G1 X176.673 Y200.29 E.12463
N10229 G1 X190.736 Y147.808 E1.74718
N10230 G1 X190.736 Y148.181 E.01199
N10231 G1 X159.264 Y156.613 E1.0477
N10232 G1 X159.264 Y158.242 E.05236
N10233 M204 S10000
N10234 G1 X159.264 Y142.33 F60000
N10235 G1 F4421.739
N10236 M204 S8000
N10237 G1 X159.264 Y140.702 E.05236
N10238 G1 X190.736 Y172.173 E1.43118
N10239 G1 X190.736 Y173.467 E.04161
N10240 G1 X159.264 Y181.9 E1.04769
N10241 G1 X159.264 Y180.271 E.05236
N10242 M204 S10000
N10243 G1 X159.264 Y172.518 F60000
N10244 G1 F4421.739
N10245 M204 S8000
N10246 G1 X159.264 Y170.889 E.05236
N10247 G1 X170.922 Y127.385 E1.44831
N10248 G1 X168.975 Y127.385 E.06259
N10249 G1 X190.736 Y149.145 E.98958
N10250 G1 X190.736 Y150.773 E.05236
N10251 ; WIPE_START
N10252 G1 X190.736 Y149.145 E-.61876
N10253 G1 X190.473 Y148.882 E-.14124
N10254 ; WIPE_END
N10255 G1 E-.04 F1800
N10256 M204 S10000
N10257 G17
N10258 G3 Z7.8 I1.217 J0 P1  F60000
N10259 ; stop printing object, unique label id: 229
N10260 M625
N10261 ; object ids of layer 37 start: 229
N10262 M624 AQAAAAAAAAA=
N10263 ;======== H2D 20250527========
N10264 ; SKIPPABLE_START
N10265 ; SKIPTYPE: timelapse
N10266 M622.1 S1 ; for prev firware, default turned on
N10267 
N10268 M1002 judge_flag timelapse_record_flag
N10269 
N10270 M622 J1
N10271 M993 A2 B2 C2
N10272 M993 A0 B0 C0
N10273 
N10274 
N10275 
N10276 
N10277     M9711 M0 E1 X260 Y141 Z7.8 S11 C10 O0 T3000
N10278 
N10279 
N10280 
N10281 M993 A3 B3 C3
N10282 
N10283 M623
N10284 ; SKIPPABLE_END
N10285 
N10286 ; object ids of this layer37 end: 229
N10287 M625
N10288 ; CHANGE_LAYER
N10289 ; Z_HEIGHT: 7.6
N10290 ; LAYER_HEIGHT: 0.2
N10291 ;======== H2D 20250521========
N10292 ; layer num/total_layer_count: 38/63
N10293 ; update layer progress
N10294 M73 L38
N10295 M991 S0 P37 ;notify layer change
N10296 
N10297 
N10298 ; OBJECT_ID: 229
N10299 ; COOLING_NODE: 0
N10300 ; start printing object, unique label id: 229
N10301 M624 AQAAAAAAAAA=
N10302 G1 X191.084 Y200.639 F60000
N10303 G1 Z7.6
N10304 G1 E.8 F1800
N10305 ; FEATURE: Inner wall
N10306 ; LINE_WIDTH: 0.45
N10307 ; LAYER_HEIGHT: 0.2
N10308 G1 F4421.739
N10309 M204 S8000
N10310 G1 X158.916 Y200.639 E1.03439
N10311 G1 X158.916 Y127.036 E2.36678
N10312 G1 X191.084 Y127.036 E1.03439
N10313 G1 X191.084 Y200.579 E2.36485
N10314 ; COOLING_NODE: 0
N10315 M204 S10000
N10316 G1 X191.491 Y201.046 F60000
N10317 G1 F4421.739
N10318 M204 S8000
N10319 G1 X158.509 Y201.046 E1.06057
N10320 G1 X158.509 Y126.629 E2.39296
N10321 G1 X191.491 Y126.629 E1.06057
N10322 G1 X191.491 Y200.986 E2.39103
N10323 ; COOLING_NODE: 0
N10324 M204 S10000
N10325 G1 X191.898 Y201.453 F60000
N10326 G1 F4421.739
N10327 M204 S8000
N10328 G1 X158.102 Y201.453 E1.08675
N10329 G1 X158.102 Y126.222 E2.41914
N10330 G1 X191.898 Y126.222 E1.08675
N10331 G1 X191.898 Y201.393 E2.41721
N10332 ; COOLING_NODE: 0
N10333 M204 S10000
N10334 G1 X192.29 Y201.845 F60000
N10335 ; FEATURE: Outer wall
N10336 ; LINE_WIDTH: 0.42
N10337 G1 F4773.528
N10338 M204 S5000
N10339 G1 X157.71 Y201.845 E1.03002
N10340 G1 X157.71 Y125.83 E2.26421
N10341 G1 X192.29 Y125.83 E1.03002
N10342 G1 X192.29 Y201.785 E2.26243
N10343 G1 E-.8 F1800
N10344 M204 S10000
N10345 G1 X185.159 Y200.29 Z8 F60000
N10346 G1 Z7.6
N10347 G1 E.8 F1800
N10348 ; FEATURE: Sparse infill
N10349 ; LINE_WIDTH: 0.45
N10350 G1 F4421.739
N10351 M204 S8000
N10352 G1 X185.547 Y200.29 E.01247
N10353 G1 X190.736 Y198.9 E.17274
N10354 G1 X190.736 Y195.001 E.12538
N10355 G1 X159.264 Y163.53 E1.43118
N10356 G1 X159.264 Y165.189 E.05334
N10357 G1 X190.736 Y156.756 E1.04769
N10358 G1 X190.736 Y160.459 E.11908
N10359 G1 X159.264 Y128.988 E1.43118
N10360 G1 X159.264 Y131.473 E.07992
N10361 G1 X174.524 Y127.385 E.508
N10362 G1 X176.152 Y127.385 E.05236
N10363 M204 S10000
N10364 G1 X163.975 Y127.385 F60000
N10365 G1 F4421.739
N10366 M204 S8000
N10367 G1 X162.346 Y127.385 E.05236
N10368 G1 X159.264 Y138.886 E.3829
N10369 G1 X159.264 Y139.699 E.02612
N10370 M204 S10000
N10371 G1 X159.264 Y158.388 F60000
N10372 G1 F4421.739
N10373 M204 S8000
N10374 G1 X159.264 Y156.76 E.05236
N10375 G1 X190.736 Y148.327 E1.0477
N10376 M204 S10000
N10377 G1 X190.736 Y150.573 F60000
N10378 G1 F4421.739
N10379 M204 S8000
N10380 G1 X190.736 Y148.945 E.05236
N10381 G1 X169.175 Y127.385 E.98048
N10382 G1 X170.775 Y127.385 E.05145
N10383 G1 X159.264 Y170.343 E1.43012
N10384 G1 X159.264 Y171.971 E.05236
N10385 M204 S10000
N10386 G1 X159.264 Y180.418 F60000
N10387 G1 F4421.739
N10388 M204 S8000
N10389 G1 X159.264 Y182.046 E.05236
N10390 G1 X190.736 Y173.614 E1.0477
N10391 G1 X190.736 Y171.973 E.05275
N10392 G1 X159.264 Y140.502 E1.43118
N10393 G1 X159.264 Y139.902 E.01929
N10394 G1 X190.736 Y131.47 E1.04769
N10395 G1 X190.736 Y127.385 E.13136
N10396 G1 X187.633 Y127.385 E.09978
N10397 G1 X168.098 Y200.29 E2.42708
N10398 G1 X166.469 Y200.29 E.05236
N10399 M204 S10000
N10400 G1 X190.736 Y166.813 F60000
N10401 G1 F4421.739
N10402 M204 S8000
N10403 G1 X190.736 Y165.185 E.05236
N10404 G1 X159.264 Y173.617 E1.0477
N10405 G1 X159.264 Y175.044 E.04587
N10406 G1 X184.511 Y200.29 E1.14811
N10407 G1 X184.955 Y200.29 E.01429
N10408 G1 X190.736 Y178.718 E.71815
N10409 G1 X190.736 Y177.09 E.05236
N10410 M204 S10000
N10411 G1 X190.736 Y188.843 F60000
N10412 G1 F4421.739
N10413 M204 S8000
N10414 M73 P68 R17
N10415 G1 X190.736 Y190.471 E.05236
N10416 G1 X159.264 Y198.904 E1.0477
N10417 G1 X159.264 Y198.072 E.02676
N10418 G1 X161.483 Y200.29 E.10089
N10419 G1 X159.669 Y200.29 E.05834
N10420 G1 X179.204 Y127.385 E2.42708
N10421 G1 X180.689 Y127.385 E.04776
N10422 G1 X190.736 Y137.431 E.45688
N10423 G1 X190.736 Y139.898 E.07934
N10424 G1 X159.264 Y148.331 E1.0477
N10425 G1 X159.264 Y152.016 E.11849
N10426 G1 X190.736 Y183.487 E1.43118
N10427 G1 X190.736 Y182.042 E.04645
N10428 G1 X159.264 Y190.475 E1.0477
N10429 G1 X159.264 Y186.558 E.12596
N10430 G1 X172.997 Y200.29 E.6245
N10431 G1 X176.527 Y200.29 E.1135
N10432 G1 X190.736 Y147.261 E1.76537
N10433 G1 X190.736 Y145.633 E.05236
N10434 ; WIPE_START
N10435 G1 X190.736 Y147.261 E-.61876
N10436 G1 X190.639 Y147.62 E-.14124
N10437 ; WIPE_END
N10438 G1 E-.04 F1800
N10439 M204 S10000
N10440 G17
N10441 G3 Z8 I1.217 J0 P1  F60000
N10442 ; stop printing object, unique label id: 229
N10443 M625
N10444 ; object ids of layer 38 start: 229
N10445 M624 AQAAAAAAAAA=
N10446 ;======== H2D 20250527========
N10447 ; SKIPPABLE_START
N10448 ; SKIPTYPE: timelapse
N10449 M622.1 S1 ; for prev firware, default turned on
N10450 
N10451 M1002 judge_flag timelapse_record_flag
N10452 
N10453 M622 J1
N10454 M993 A2 B2 C2
N10455 M993 A0 B0 C0
N10456 
N10457 
N10458 
N10459 
N10460     M9711 M0 E1 X260 Y141 Z8 S11 C10 O0 T3000
N10461 
N10462 
N10463 
N10464 M993 A3 B3 C3
N10465 
N10466 M623
N10467 ; SKIPPABLE_END
N10468 
N10469 ; object ids of this layer38 end: 229
N10470 M625
N10471 ; CHANGE_LAYER
N10472 ; Z_HEIGHT: 7.8
N10473 ; LAYER_HEIGHT: 0.2
N10474 ;======== H2D 20250521========
N10475 ; layer num/total_layer_count: 39/63
N10476 ; update layer progress
N10477 M73 L39
N10478 M991 S0 P38 ;notify layer change
N10479 
N10480 
N10481 ; OBJECT_ID: 229
N10482 ; COOLING_NODE: 0
N10483 ; start printing object, unique label id: 229
N10484 M624 AQAAAAAAAAA=
N10485 G1 X191.084 Y200.639 F60000
N10486 G1 Z7.8
N10487 G1 E.8 F1800
N10488 ; FEATURE: Inner wall
N10489 ; LINE_WIDTH: 0.45
N10490 ; LAYER_HEIGHT: 0.2
N10491 G1 F4421.739
N10492 M204 S8000
N10493 G1 X158.916 Y200.639 E1.03439
N10494 G1 X158.916 Y127.036 E2.36678
N10495 G1 X191.084 Y127.036 E1.03439
N10496 G1 X191.084 Y200.579 E2.36485
N10497 ; COOLING_NODE: 0
N10498 M204 S10000
N10499 G1 X191.491 Y201.046 F60000
N10500 G1 F4421.739
N10501 M204 S8000
N10502 M73 P68 R16
N10503 G1 X158.509 Y201.046 E1.06057
N10504 G1 X158.509 Y126.629 E2.39296
N10505 G1 X191.491 Y126.629 E1.06057
N10506 G1 X191.491 Y200.986 E2.39103
N10507 ; COOLING_NODE: 0
N10508 M204 S10000
N10509 G1 X191.898 Y201.453 F60000
N10510 G1 F4421.739
N10511 M204 S8000
N10512 G1 X158.102 Y201.453 E1.08675
N10513 G1 X158.102 Y126.222 E2.41914
N10514 G1 X191.898 Y126.222 E1.08675
N10515 G1 X191.898 Y201.393 E2.41721
N10516 ; COOLING_NODE: 0
N10517 M204 S10000
N10518 G1 X192.29 Y201.845 F60000
N10519 ; FEATURE: Outer wall
N10520 ; LINE_WIDTH: 0.42
N10521 G1 F4773.528
N10522 M204 S5000
N10523 G1 X157.71 Y201.845 E1.03002
N10524 G1 X157.71 Y125.83 E2.26421
N10525 G1 X192.29 Y125.83 E1.03002
N10526 G1 X192.29 Y201.785 E2.26243
N10527 G1 E-.8 F1800
N10528 M204 S10000
N10529 G1 X190.351 Y200.29 Z8.2 F60000
N10530 G1 Z7.8
N10531 G1 E.8 F1800
N10532 ; FEATURE: Sparse infill
N10533 ; LINE_WIDTH: 0.45
N10534 G1 F4421.739
N10535 M204 S8000
N10536 G1 X190.736 Y200.29 E.01236
N10537 G1 X190.736 Y199.046 E.04
N10538 G1 X186.093 Y200.29 E.15455
N10539 G1 X185.012 Y200.29 E.03475
N10540 M204 S10000
N10541 G1 X190.736 Y176.543 F60000
N10542 G1 F4421.739
N10543 M204 S8000
N10544 G1 X190.736 Y178.172 E.05236
N10545 G1 X184.809 Y200.29 E.73634
N10546 G1 X184.711 Y200.29 E.00315
N10547 G1 X159.264 Y174.844 E1.1572
N10548 G1 X159.264 Y173.764 E.03473
N10549 G1 X190.736 Y165.331 E1.0477
N10550 G1 X190.736 Y166.959 E.05236
N10551 M204 S10000
N10552 G1 X190.736 Y145.087 F60000
N10553 G1 F4421.739
N10554 M204 S8000
N10555 G1 X190.736 Y146.715 E.05236
N10556 G1 X176.38 Y200.29 E1.78356
N10557 G1 X173.197 Y200.29 E.10236
N10558 G1 X159.264 Y186.358 E.6336
N10559 G1 X159.264 Y182.193 E.13394
N10560 G1 X190.736 Y173.76 E1.0477
N10561 G1 X190.736 Y171.773 E.06389
N10562 G1 X159.264 Y140.302 E1.43118
N10563 G1 X159.264 Y140.049 E.00815
N10564 G1 X190.736 Y131.616 E1.0477
N10565 G1 X190.736 Y127.385 E.13606
N10566 G1 X187.486 Y127.385 E.10448
N10567 G1 X167.951 Y200.29 E2.42708
N10568 G1 X166.323 Y200.29 E.05236
N10569 M204 S10000
N10570 G1 X159.264 Y192.25 F60000
N10571 G1 F4421.739
N10572 M204 S8000
N10573 G1 X159.264 Y190.621 E.05236
N10574 G1 X190.736 Y182.189 E1.0477
N10575 G1 X190.736 Y183.287 E.03532
N10576 G1 X159.264 Y151.816 E1.43118
N10577 G1 X159.264 Y148.477 E.10735
N10578 G1 X190.736 Y140.045 E1.0477
N10579 G1 X190.736 Y137.231 E.09047
N10580 G1 X180.889 Y127.385 E.44778
N10581 G1 X179.058 Y127.385 E.0589
N10582 G1 X159.523 Y200.29 E2.42708
N10583 G1 X161.683 Y200.29 E.06948
N10584 G1 X159.264 Y197.872 E.10999
N10585 G1 X159.264 Y199.05 E.0379
N10586 G1 X190.736 Y190.618 E1.0477
N10587 G1 X190.736 Y194.801 E.13452
N10588 G1 X159.264 Y163.33 E1.43118
N10589 G1 X159.264 Y165.335 E.06448
N10590 G1 X190.736 Y156.902 E1.0477
N10591 G1 X190.736 Y160.259 E.10794
N10592 G1 X159.264 Y128.788 E1.43118
N10593 G1 X159.264 Y131.62 E.09106
N10594 G1 X175.07 Y127.385 E.52619
N10595 G1 X176.699 Y127.385 E.05236
N10596 M204 S10000
N10597 G1 X163.828 Y127.385 F60000
N10598 G1 F4421.739
N10599 M204 S8000
N10600 G1 X162.2 Y127.385 E.05236
N10601 G1 X159.264 Y138.34 E.36471
N10602 G1 X159.264 Y139.845 E.0484
N10603 M204 S10000
N10604 G1 X159.264 Y158.535 F60000
N10605 G1 F4421.739
N10606 M204 S8000
N10607 G1 X159.264 Y156.906 E.05236
N10608 G1 X190.736 Y148.474 E1.0477
N10609 G1 X190.736 Y148.745 E.00873
N10610 G1 X169.375 Y127.385 E.97139
N10611 G1 X170.629 Y127.385 E.04031
N10612 G1 X159.264 Y169.797 E1.41193
N10613 G1 X159.264 Y171.425 E.05236
N10614 ; WIPE_START
N10615 G1 X159.264 Y169.797 E-.61876
N10616 G1 X159.361 Y169.438 E-.14124
N10617 ; WIPE_END
N10618 G1 E-.04 F1800
N10619 M204 S10000
N10620 G17
N10621 G3 Z8.2 I1.217 J0 P1  F60000
N10622 ; stop printing object, unique label id: 229
N10623 M625
N10624 ; object ids of layer 39 start: 229
N10625 M624 AQAAAAAAAAA=
N10626 ;======== H2D 20250527========
N10627 ; SKIPPABLE_START
N10628 ; SKIPTYPE: timelapse
N10629 M622.1 S1 ; for prev firware, default turned on
N10630 
N10631 M1002 judge_flag timelapse_record_flag
N10632 
N10633 M622 J1
N10634 M993 A2 B2 C2
N10635 M993 A0 B0 C0
N10636 
N10637 
N10638 
N10639 
N10640     M9711 M0 E1 X260 Y141 Z8.2 S11 C10 O0 T3000
N10641 
N10642 
N10643 
N10644 M993 A3 B3 C3
N10645 
N10646 M623
N10647 ; SKIPPABLE_END
N10648 
N10649 ; object ids of this layer39 end: 229
N10650 M625
N10651 ; CHANGE_LAYER
N10652 ; Z_HEIGHT: 8
N10653 ; LAYER_HEIGHT: 0.2
N10654 ;======== H2D 20250521========
N10655 ; layer num/total_layer_count: 40/63
N10656 ; update layer progress
N10657 M73 L40
N10658 M991 S0 P39 ;notify layer change
N10659 
N10660 
N10661 ; OBJECT_ID: 229
N10662 ; COOLING_NODE: 0
N10663 ; start printing object, unique label id: 229
N10664 M624 AQAAAAAAAAA=
N10665 G1 X191.084 Y200.639 F60000
N10666 G1 Z8
N10667 G1 E.8 F1800
N10668 ; FEATURE: Inner wall
N10669 ; LINE_WIDTH: 0.45
N10670 ; LAYER_HEIGHT: 0.2
N10671 G1 F4421.739
N10672 M204 S8000
N10673 G1 X158.916 Y200.639 E1.03439
N10674 G1 X158.916 Y127.036 E2.36678
N10675 G1 X191.084 Y127.036 E1.03439
N10676 G1 X191.084 Y200.579 E2.36485
N10677 ; COOLING_NODE: 0
N10678 M204 S10000
N10679 G1 X191.491 Y201.046 F60000
N10680 G1 F4421.739
N10681 M204 S8000
N10682 M73 P69 R16
N10683 G1 X158.509 Y201.046 E1.06057
N10684 G1 X158.509 Y126.629 E2.39296
N10685 G1 X191.491 Y126.629 E1.06057
N10686 G1 X191.491 Y200.986 E2.39103
N10687 ; COOLING_NODE: 0
N10688 M204 S10000
N10689 G1 X191.898 Y201.453 F60000
N10690 G1 F4421.739
N10691 M204 S8000
N10692 G1 X158.102 Y201.453 E1.08675
N10693 G1 X158.102 Y126.222 E2.41914
N10694 G1 X191.898 Y126.222 E1.08675
N10695 G1 X191.898 Y201.393 E2.41721
N10696 ; COOLING_NODE: 0
N10697 M204 S10000
N10698 G1 X192.29 Y201.845 F60000
N10699 ; FEATURE: Outer wall
N10700 ; LINE_WIDTH: 0.42
N10701 G1 F4773.528
N10702 M204 S5000
N10703 G1 X157.71 Y201.845 E1.03002
N10704 G1 X157.71 Y125.83 E2.26421
N10705 G1 X192.29 Y125.83 E1.03002
N10706 G1 X192.29 Y201.785 E2.26243
N10707 G1 E-.8 F1800
N10708 M204 S10000
N10709 G1 X190.736 Y197.564 Z8.4 F60000
N10710 G1 Z8
N10711 G1 E.8 F1800
N10712 ; FEATURE: Sparse infill
N10713 ; LINE_WIDTH: 0.45
N10714 G1 F4421.739
N10715 M204 S8000
N10716 G1 X190.736 Y199.193 E.05236
N10717 G1 X186.639 Y200.29 E.13636
N10718 G1 X185.114 Y200.29 E.04904
N10719 M204 S10000
N10720 G1 X190.736 Y175.997 F60000
N10721 G1 F4421.739
N10722 M204 S8000
N10723 G1 X190.736 Y177.625 E.05236
N10724 G1 X184.662 Y200.29 E.75453
N10725 G1 X184.911 Y200.29 E.00799
N10726 G1 X159.264 Y174.644 E1.1663
N10727 G1 X159.264 Y173.91 E.02359
N10728 G1 X190.736 Y165.478 E1.0477
N10729 G1 X190.736 Y167.106 E.05236
N10730 M204 S10000
N10731 G1 X190.736 Y144.54 F60000
N10732 G1 F4421.739
N10733 M204 S8000
N10734 G1 X190.736 Y146.169 E.05236
N10735 G1 X176.234 Y200.29 E1.80175
N10736 G1 X173.397 Y200.29 E.09122
N10737 G1 X159.264 Y186.158 E.64269
N10738 G1 X159.264 Y182.339 E.1228
N10739 G1 X190.736 Y173.906 E1.0477
N10740 G1 X190.736 Y171.573 E.07503
N10741 G1 X159.264 Y140.102 E1.43118
N10742 G1 X159.264 Y140.195 E.00299
N10743 G1 X190.736 Y131.762 E1.0477
N10744 G1 X190.736 Y127.385 E.14077
N10745 G1 X187.34 Y127.385 E.10919
N10746 G1 X167.805 Y200.29 E2.42708
N10747 G1 X166.177 Y200.29 E.05236
N10748 M204 S10000
N10749 G1 X159.264 Y192.396 F60000
N10750 G1 F4421.739
N10751 M204 S8000
N10752 G1 X159.264 Y190.768 E.05236
N10753 G1 X190.736 Y182.335 E1.04769
N10754 G1 X190.736 Y183.087 E.02418
N10755 G1 X159.264 Y151.616 E1.43118
N10756 G1 X159.264 Y148.624 E.09621
N10757 G1 X190.736 Y140.191 E1.0477
N10758 G1 X190.736 Y137.031 E.10161
N10759 G1 X181.089 Y127.385 E.43868
N10760 G1 X178.911 Y127.385 E.07003
N10761 G1 X159.376 Y200.29 E2.42708
N10762 G1 X161.883 Y200.29 E.08062
N10763 G1 X159.264 Y197.672 E.11908
N10764 G1 X159.264 Y199.197 E.04904
N10765 G1 X190.736 Y190.764 E1.0477
N10766 G1 X190.736 Y194.601 E.12338
N10767 G1 X159.264 Y163.13 E1.43118
N10768 G1 X159.264 Y165.481 E.07562
N10769 G1 X190.736 Y157.049 E1.0477
N10770 G1 X190.736 Y160.059 E.0968
N10771 G1 X159.264 Y128.588 E1.43118
N10772 G1 X159.264 Y131.766 E.1022
N10773 G1 X175.617 Y127.385 E.54438
N10774 G1 X177.245 Y127.385 E.05236
N10775 M204 S10000
N10776 G1 X163.682 Y127.385 F60000
N10777 G1 F4421.739
N10778 M204 S8000
N10779 G1 X162.054 Y127.385 E.05236
N10780 G1 X159.264 Y137.794 E.34652
N10781 G1 X159.264 Y139.422 E.05236
N10782 M204 S10000
N10783 G1 X159.264 Y158.681 F60000
N10784 G1 F4421.739
N10785 M204 S8000
N10786 G1 X159.264 Y157.053 E.05236
N10787 G1 X190.736 Y148.62 E1.0477
N10788 G1 X190.736 Y148.545 E.00241
N10789 G1 X169.575 Y127.385 E.96229
N10790 G1 X170.482 Y127.385 E.02917
N10791 G1 X159.264 Y169.25 E1.39374
N10792 G1 X159.264 Y170.879 E.05236
N10793 ; WIPE_START
N10794 G1 X159.264 Y169.25 E-.61876
N10795 G1 X159.361 Y168.891 E-.14124
N10796 ; WIPE_END
N10797 G1 E-.04 F1800
N10798 M204 S10000
N10799 G17
N10800 G3 Z8.4 I1.217 J0 P1  F60000
N10801 ; stop printing object, unique label id: 229
N10802 M625
N10803 ; object ids of layer 40 start: 229
N10804 M624 AQAAAAAAAAA=
N10805 ;======== H2D 20250527========
N10806 ; SKIPPABLE_START
N10807 ; SKIPTYPE: timelapse
N10808 M622.1 S1 ; for prev firware, default turned on
N10809 
N10810 M1002 judge_flag timelapse_record_flag
N10811 
N10812 M622 J1
N10813 M993 A2 B2 C2
N10814 M993 A0 B0 C0
N10815 
N10816 
N10817 
N10818 
N10819     M9711 M0 E1 X260 Y141 Z8.4 S11 C10 O0 T3000
N10820 
N10821 
N10822 
N10823 M993 A3 B3 C3
N10824 
N10825 M623
N10826 ; SKIPPABLE_END
N10827 
N10828 ; object ids of this layer40 end: 229
N10829 M625
N10830 ; CHANGE_LAYER
N10831 ; Z_HEIGHT: 8.2
N10832 ; LAYER_HEIGHT: 0.2
N10833 ;======== H2D 20250521========
N10834 ; layer num/total_layer_count: 41/63
N10835 ; update layer progress
N10836 M73 L41
N10837 M991 S0 P40 ;notify layer change
N10838 
N10839 
N10840 ; OBJECT_ID: 229
N10841 ; COOLING_NODE: 0
N10842 ; start printing object, unique label id: 229
N10843 M624 AQAAAAAAAAA=
N10844 G1 X191.084 Y200.639 F60000
N10845 G1 Z8.2
N10846 G1 E.8 F1800
N10847 ; FEATURE: Inner wall
N10848 ; LINE_WIDTH: 0.45
N10849 ; LAYER_HEIGHT: 0.2
N10850 G1 F4421.739
N10851 M204 S8000
N10852 G1 X158.916 Y200.639 E1.03439
N10853 G1 X158.916 Y127.036 E2.36678
N10854 G1 X191.084 Y127.036 E1.03439
N10855 G1 X191.084 Y200.579 E2.36485
N10856 ; COOLING_NODE: 0
N10857 M204 S10000
N10858 G1 X191.491 Y201.046 F60000
N10859 G1 F4421.739
N10860 M204 S8000
N10861 G1 X158.509 Y201.046 E1.06057
N10862 G1 X158.509 Y126.629 E2.39296
N10863 G1 X191.491 Y126.629 E1.06057
N10864 G1 X191.491 Y200.986 E2.39103
N10865 ; COOLING_NODE: 0
N10866 M204 S10000
N10867 G1 X191.898 Y201.453 F60000
N10868 G1 F4421.739
N10869 M204 S8000
N10870 G1 X158.102 Y201.453 E1.08675
N10871 G1 X158.102 Y126.222 E2.41914
N10872 G1 X191.898 Y126.222 E1.08675
N10873 G1 X191.898 Y201.393 E2.41721
N10874 ; COOLING_NODE: 0
N10875 M204 S10000
N10876 G1 X192.29 Y201.845 F60000
N10877 ; FEATURE: Outer wall
N10878 ; LINE_WIDTH: 0.42
N10879 G1 F4773.528
N10880 M204 S5000
N10881 G1 X157.71 Y201.845 E1.03002
N10882 M73 P70 R16
N10883 G1 X157.71 Y125.83 E2.26421
N10884 G1 X192.29 Y125.83 E1.03002
N10885 G1 X192.29 Y201.785 E2.26243
N10886 G1 E-.8 F1800
N10887 M204 S10000
N10888 G1 X190.736 Y197.711 Z8.6 F60000
N10889 G1 Z8.2
N10890 M73 P70 R15
N10891 G1 E.8 F1800
N10892 ; FEATURE: Sparse infill
N10893 ; LINE_WIDTH: 0.45
N10894 G1 F4421.739
N10895 M204 S8000
N10896 G1 X190.736 Y199.339 E.05236
N10897 G1 X187.186 Y200.29 E.11817
N10898 G1 X185.557 Y200.29 E.05236
N10899 M204 S10000
N10900 G1 X190.736 Y175.451 F60000
N10901 G1 F4421.739
N10902 M204 S8000
N10903 G1 X190.736 Y177.079 E.05236
N10904 G1 X184.516 Y200.29 E.77272
N10905 G1 X185.111 Y200.29 E.01913
N10906 G1 X159.264 Y174.444 E1.17539
N10907 G1 X159.264 Y174.057 E.01245
N10908 G1 X190.736 Y165.624 E1.04769
N10909 G1 X190.736 Y163.996 E.05236
N10910 M204 S10000
N10911 G1 X190.736 Y143.994 F60000
N10912 G1 F4421.739
N10913 M204 S8000
N10914 G1 X190.736 Y145.622 E.05236
N10915 G1 X176.087 Y200.29 E1.81994
N10916 G1 X173.597 Y200.29 E.08008
N10917 G1 X159.264 Y185.958 E.65179
N10918 G1 X159.264 Y182.485 E.11166
N10919 G1 X190.736 Y174.053 E1.0477
N10920 G1 X190.736 Y171.373 E.08617
N10921 G1 X159.264 Y139.902 E1.43118
N10922 G1 X159.264 Y140.341 E.01413
N10923 G1 X190.736 Y131.909 E1.0477
N10924 G1 X190.736 Y127.385 E.14548
N10925 G1 X187.193 Y127.385 E.1139
N10926 G1 X167.658 Y200.29 E2.42708
N10927 G1 X169.287 Y200.29 E.05236
N10928 M204 S10000
N10929 G1 X159.264 Y189.286 F60000
N10930 G1 F4421.739
N10931 M204 S8000
N10932 G1 X159.264 Y190.914 E.05236
N10933 G1 X190.736 Y182.482 E1.0477
N10934 G1 X190.736 Y182.887 E.01304
N10935 G1 X159.264 Y151.416 E1.43118
N10936 G1 X159.264 Y148.77 E.08507
N10937 G1 X190.736 Y140.338 E1.04769
N10938 G1 X190.736 Y136.831 E.11275
N10939 G1 X181.289 Y127.385 E.42959
N10940 G1 X178.765 Y127.385 E.08117
N10941 G1 X159.264 Y200.161 E2.42276
N10942 G1 X159.264 Y200.29 E.00417
N10943 G1 X162.083 Y200.29 E.09064
N10944 G1 X159.264 Y197.472 E.12818
N10945 G1 X159.264 Y195.843 E.05236
N10946 M204 S10000
N10947 G1 X159.264 Y199.343 F60000
N10948 G1 F4421.739
N10949 M204 S8000
N10950 G1 X190.736 Y190.91 E1.0477
N10951 G1 X190.736 Y194.401 E.11224
N10952 G1 X159.264 Y162.93 E1.43118
N10953 G1 X159.264 Y165.628 E.08676
N10954 G1 X190.736 Y157.195 E1.0477
N10955 G1 X190.736 Y159.859 E.08566
N10956 G1 X159.264 Y128.388 E1.43118
N10957 G1 X159.264 Y131.913 E.11334
N10958 G1 X176.163 Y127.385 E.56257
N10959 G1 X177.791 Y127.385 E.05236
N10960 M204 S10000
N10961 G1 X163.535 Y127.385 F60000
N10962 G1 F4421.739
N10963 M204 S8000
N10964 G1 X161.907 Y127.385 E.05236
N10965 G1 X159.264 Y137.247 E.32833
N10966 G1 X159.264 Y138.875 E.05236
N10967 M204 S10000
N10968 G1 X159.264 Y155.571 F60000
N10969 G1 F4421.739
N10970 M204 S8000
N10971 G1 X159.264 Y157.199 E.05236
N10972 G1 X190.736 Y148.766 E1.0477
N10973 G1 X190.736 Y148.345 E.01355
N10974 G1 X169.775 Y127.385 E.9532
N10975 G1 X170.336 Y127.385 E.01803
N10976 G1 X159.264 Y168.704 E1.37554
N10977 G1 X159.264 Y170.332 E.05236
N10978 ; WIPE_START
N10979 G1 X159.264 Y168.704 E-.61876
N10980 G1 X159.361 Y168.345 E-.14124
N10981 ; WIPE_END
N10982 G1 E-.04 F1800
N10983 M204 S10000
N10984 G17
N10985 G3 Z8.6 I1.217 J0 P1  F60000
N10986 ; stop printing object, unique label id: 229
N10987 M625
N10988 ; object ids of layer 41 start: 229
N10989 M624 AQAAAAAAAAA=
N10990 ;======== H2D 20250527========
N10991 ; SKIPPABLE_START
N10992 ; SKIPTYPE: timelapse
N10993 M622.1 S1 ; for prev firware, default turned on
N10994 
N10995 M1002 judge_flag timelapse_record_flag
N10996 
N10997 M622 J1
N10998 M993 A2 B2 C2
N10999 M993 A0 B0 C0
N11000 
N11001 
N11002 
N11003 
N11004     M9711 M0 E1 X260 Y141 Z8.6 S11 C10 O0 T3000
N11005 
N11006 
N11007 
N11008 M993 A3 B3 C3
N11009 
N11010 M623
N11011 ; SKIPPABLE_END
N11012 
N11013 ; object ids of this layer41 end: 229
N11014 M625
N11015 ; CHANGE_LAYER
N11016 ; Z_HEIGHT: 8.4
N11017 ; LAYER_HEIGHT: 0.2
N11018 ;======== H2D 20250521========
N11019 ; layer num/total_layer_count: 42/63
N11020 ; update layer progress
N11021 M73 L42
N11022 M991 S0 P41 ;notify layer change
N11023 
N11024 
N11025 ; OBJECT_ID: 229
N11026 ; COOLING_NODE: 0
N11027 ; start printing object, unique label id: 229
N11028 M624 AQAAAAAAAAA=
N11029 G1 X191.084 Y200.639 F60000
N11030 G1 Z8.4
N11031 G1 E.8 F1800
N11032 ; FEATURE: Inner wall
N11033 ; LINE_WIDTH: 0.45
N11034 ; LAYER_HEIGHT: 0.2
N11035 G1 F4421.739
N11036 M204 S8000
N11037 G1 X158.916 Y200.639 E1.03439
N11038 G1 X158.916 Y127.036 E2.36678
N11039 G1 X191.084 Y127.036 E1.03439
N11040 G1 X191.084 Y200.579 E2.36485
N11041 ; COOLING_NODE: 0
N11042 M204 S10000
N11043 G1 X191.491 Y201.046 F60000
N11044 G1 F4421.739
N11045 M204 S8000
N11046 G1 X158.509 Y201.046 E1.06057
N11047 G1 X158.509 Y126.629 E2.39296
N11048 G1 X191.491 Y126.629 E1.06057
N11049 G1 X191.491 Y200.986 E2.39103
N11050 ; COOLING_NODE: 0
N11051 M204 S10000
N11052 G1 X191.898 Y201.453 F60000
N11053 G1 F4421.739
N11054 M204 S8000
N11055 G1 X158.102 Y201.453 E1.08675
N11056 G1 X158.102 Y126.222 E2.41914
N11057 G1 X191.898 Y126.222 E1.08675
N11058 G1 X191.898 Y201.393 E2.41721
N11059 ; COOLING_NODE: 0
N11060 M204 S10000
N11061 G1 X192.29 Y201.845 F60000
N11062 ; FEATURE: Outer wall
N11063 ; LINE_WIDTH: 0.42
N11064 G1 F4773.528
N11065 M204 S5000
N11066 G1 X157.71 Y201.845 E1.03002
N11067 G1 X157.71 Y125.83 E2.26421
N11068 G1 X192.29 Y125.83 E1.03002
N11069 G1 X192.29 Y201.785 E2.26243
N11070 G1 E-.8 F1800
N11071 M204 S10000
N11072 G1 X190.736 Y197.857 Z8.8 F60000
N11073 G1 Z8.4
N11074 G1 E.8 F1800
N11075 ; FEATURE: Sparse infill
N11076 ; LINE_WIDTH: 0.45
N11077 G1 F4421.739
N11078 M204 S8000
N11079 G1 X190.736 Y199.486 E.05236
N11080 G1 X187.732 Y200.29 E.09998
N11081 G1 X186.104 Y200.29 E.05236
N11082 M204 S10000
N11083 G1 X159.264 Y195.643 F60000
N11084 G1 F4421.739
N11085 M204 S8000
N11086 G1 X159.264 Y197.272 E.05236
N11087 G1 X162.283 Y200.29 E.13727
N11088 G1 X167.512 Y200.29 E.16815
N11089 G1 X187.047 Y127.385 E2.42708
N11090 G1 X181.489 Y127.385 E.17873
N11091 G1 X190.736 Y136.631 E.42049
N11092 G1 X190.736 Y140.484 E.12389
N11093 G1 X159.264 Y148.917 E1.0477
N11094 G1 X159.264 Y151.216 E.07394
N11095 G1 X190.736 Y182.687 E1.43118
N11096 G1 X190.736 Y182.628 E.0019
N11097 G1 X159.264 Y191.061 E1.0477
N11098 G1 X159.264 Y189.432 E.05236
N11099 M204 S10000
N11100 G1 X159.264 Y169.786 F60000
N11101 G1 F4421.739
N11102 M204 S8000
N11103 M73 P71 R15
N11104 G1 X159.264 Y168.157 E.05236
N11105 G1 X170.189 Y127.385 E1.35735
N11106 G1 X169.975 Y127.385 E.00689
N11107 G1 X190.736 Y148.145 E.9441
N11108 G1 X190.736 Y148.913 E.02468
N11109 G1 X159.264 Y157.345 E1.0477
N11110 G1 X159.264 Y155.717 E.05236
N11111 M204 S10000
N11112 G1 X159.264 Y138.329 F60000
N11113 G1 F4421.739
N11114 M204 S8000
N11115 G1 X159.264 Y136.701 E.05236
N11116 G1 X161.761 Y127.385 E.31014
N11117 G1 X159.264 Y127.385 E.08027
N11118 G1 X159.264 Y128.188 E.02583
N11119 G1 X190.736 Y159.659 E1.43118
N11120 G1 X190.736 Y157.342 E.07452
N11121 G1 X159.264 Y165.774 E1.0477
N11122 G1 X159.264 Y162.73 E.0979
N11123 G1 X190.736 Y194.201 E1.43118
N11124 G1 X190.736 Y191.057 E.10111
N11125 G1 X159.264 Y199.489 E1.0477
N11126 G1 X159.264 Y199.614 E.00401
N11127 G1 X178.618 Y127.385 E2.40457
N11128 G1 X176.709 Y127.385 E.06138
N11129 G1 X159.264 Y132.059 E.58076
N11130 G1 X159.264 Y130.431 E.05236
N11131 M204 S10000
N11132 G1 X190.736 Y130.427 F60000
N11133 G1 F4421.739
N11134 M204 S8000
N11135 G1 X190.736 Y132.055 E.05236
N11136 G1 X159.264 Y140.488 E1.0477
N11137 G1 X159.264 Y139.702 E.02527
N11138 G1 X190.736 Y171.173 E1.43118
N11139 G1 X190.736 Y165.77 E.17373
N11140 G1 X159.264 Y174.203 E1.0477
N11141 G1 X159.264 Y174.244 E.00131
N11142 G1 X185.311 Y200.29 E1.18449
N11143 G1 X184.37 Y200.29 E.03027
N11144 G1 X190.736 Y176.533 E.79091
N11145 G1 X190.736 Y174.199 E.07503
N11146 G1 X159.264 Y182.632 E1.0477
N11147 G1 X159.264 Y185.758 E.10052
N11148 G1 X173.797 Y200.29 E.66088
N11149 G1 X175.941 Y200.29 E.06894
N11150 G1 X190.736 Y145.076 E1.83813
N11151 G1 X190.736 Y143.448 E.05236
N11152 ; WIPE_START
N11153 G1 X190.736 Y145.076 E-.61876
N11154 G1 X190.639 Y145.435 E-.14124
N11155 ; WIPE_END
N11156 G1 E-.04 F1800
N11157 M204 S10000
N11158 G17
N11159 G3 Z8.8 I1.217 J0 P1  F60000
N11160 ; stop printing object, unique label id: 229
N11161 M625
N11162 ; object ids of layer 42 start: 229
N11163 M624 AQAAAAAAAAA=
N11164 ;======== H2D 20250527========
N11165 ; SKIPPABLE_START
N11166 ; SKIPTYPE: timelapse
N11167 M622.1 S1 ; for prev firware, default turned on
N11168 
N11169 M1002 judge_flag timelapse_record_flag
N11170 
N11171 M622 J1
N11172 M993 A2 B2 C2
N11173 M993 A0 B0 C0
N11174 
N11175 
N11176 
N11177 
N11178     M9711 M0 E1 X260 Y141 Z8.8 S11 C10 O0 T3000
N11179 
N11180 
N11181 
N11182 M993 A3 B3 C3
N11183 
N11184 M623
N11185 ; SKIPPABLE_END
N11186 
N11187 ; object ids of this layer42 end: 229
N11188 M625
N11189 ; CHANGE_LAYER
N11190 ; Z_HEIGHT: 8.6
N11191 ; LAYER_HEIGHT: 0.200001
N11192 ;======== H2D 20250521========
N11193 ; layer num/total_layer_count: 43/63
N11194 ; update layer progress
N11195 M73 L43
N11196 M991 S0 P42 ;notify layer change
N11197 
N11198 
N11199 ; OBJECT_ID: 229
N11200 ; COOLING_NODE: 0
N11201 ; start printing object, unique label id: 229
N11202 M624 AQAAAAAAAAA=
N11203 G1 X191.084 Y200.639 F60000
N11204 G1 Z8.6
N11205 G1 E.8 F1800
N11206 ; FEATURE: Inner wall
N11207 ; LINE_WIDTH: 0.45
N11208 ; LAYER_HEIGHT: 0.2
N11209 G1 F4421.739
N11210 M204 S8000
N11211 G1 X158.916 Y200.639 E1.03439
N11212 G1 X158.916 Y127.036 E2.36678
N11213 G1 X191.084 Y127.036 E1.03439
N11214 G1 X191.084 Y200.579 E2.36485
N11215 ; COOLING_NODE: 0
N11216 M204 S10000
N11217 G1 X191.491 Y201.046 F60000
N11218 G1 F4421.739
N11219 M204 S8000
N11220 G1 X158.509 Y201.046 E1.06057
N11221 G1 X158.509 Y126.629 E2.39296
N11222 G1 X191.491 Y126.629 E1.06057
N11223 G1 X191.491 Y200.986 E2.39103
N11224 ; COOLING_NODE: 0
N11225 M204 S10000
N11226 G1 X191.898 Y201.453 F60000
N11227 G1 F4421.739
N11228 M204 S8000
N11229 G1 X158.102 Y201.453 E1.08675
N11230 G1 X158.102 Y126.222 E2.41914
N11231 G1 X191.898 Y126.222 E1.08675
N11232 G1 X191.898 Y201.393 E2.41721
N11233 ; COOLING_NODE: 0
N11234 M204 S10000
N11235 G1 X192.29 Y201.845 F60000
N11236 ; FEATURE: Outer wall
N11237 ; LINE_WIDTH: 0.42
N11238 G1 F4773.528
N11239 M204 S5000
N11240 G1 X157.71 Y201.845 E1.03002
N11241 G1 X157.71 Y125.83 E2.26421
N11242 G1 X192.29 Y125.83 E1.03002
N11243 G1 X192.29 Y201.785 E2.26243
N11244 G1 E-.8 F1800
N11245 M204 S10000
N11246 G1 X190.736 Y198.004 Z9 F60000
N11247 G1 Z8.6
N11248 G1 E.8 F1800
N11249 ; FEATURE: Sparse infill
N11250 ; LINE_WIDTH: 0.45
N11251 G1 F4421.739
N11252 M204 S8000
N11253 G1 X190.736 Y199.632 E.05236
N11254 G1 X188.279 Y200.29 E.08179
N11255 G1 X186.65 Y200.29 E.05236
N11256 M204 S10000
N11257 G1 X159.264 Y195.443 F60000
N11258 G1 F4421.739
N11259 M204 S8000
N11260 G1 X159.264 Y197.072 E.05236
N11261 G1 X162.483 Y200.29 E.14637
N11262 G1 X167.366 Y200.29 E.15701
N11263 G1 X186.901 Y127.385 E2.42708
N11264 G1 X181.689 Y127.385 E.16759
N11265 G1 X190.736 Y136.431 E.4114
N11266 G1 X190.736 Y132.202 E.13601
N11267 G1 X159.264 Y140.634 E1.0477
N11268 G1 X159.264 Y139.502 E.03641
N11269 G1 X190.736 Y170.973 E1.43118
N11270 G1 X190.736 Y165.917 E.16259
N11271 G1 X159.264 Y174.349 E1.0477
N11272 G1 X159.264 Y174.044 E.00983
N11273 G1 X185.511 Y200.29 E1.19359
N11274 G1 X184.223 Y200.29 E.04141
N11275 G1 X190.736 Y175.986 E.8091
N11276 G1 X190.736 Y174.346 E.05275
N11277 G1 X159.264 Y182.778 E1.0477
N11278 G1 X159.264 Y185.558 E.08938
N11279 G1 X173.997 Y200.29 E.66998
N11280 G1 X175.794 Y200.29 E.0578
N11281 G1 X190.736 Y144.529 E1.85632
N11282 G1 X190.736 Y140.63 E.12538
N11283 G1 X159.264 Y149.063 E1.0477
N11284 G1 X159.264 Y151.016 E.0628
N11285 G1 X190.736 Y182.487 E1.43118
N11286 G1 X190.736 Y182.774 E.00924
N11287 G1 X159.264 Y191.207 E1.0477
N11288 G1 X159.264 Y189.579 E.05236
N11289 M204 S10000
N11290 G1 X159.264 Y169.239 F60000
N11291 G1 F4421.739
N11292 M204 S8000
N11293 G1 X159.264 Y167.611 E.05236
N11294 G1 X170.043 Y127.385 E1.33916
N11295 G1 X170.175 Y127.385 E.00424
N11296 G1 X190.736 Y147.945 E.93501
N11297 G1 X190.736 Y149.059 E.03582
N11298 G1 X159.264 Y157.492 E1.0477
N11299 G1 X159.264 Y155.864 E.05236
N11300 M204 S10000
N11301 M73 P71 R14
N11302 G1 X159.264 Y137.783 F60000
N11303 G1 F4421.739
N11304 M204 S8000
N11305 G1 X159.264 Y136.154 E.05236
N11306 G1 X161.614 Y127.385 E.29195
N11307 G1 X159.264 Y127.385 E.07556
N11308 G1 X159.264 Y127.988 E.0194
N11309 G1 X190.736 Y159.459 E1.43118
N11310 G1 X190.736 Y157.488 E.06338
N11311 G1 X159.264 Y165.921 E1.0477
N11312 G1 X159.264 Y162.53 E.10904
N11313 G1 X190.736 Y194.001 E1.43118
N11314 G1 X190.736 Y191.203 E.08997
N11315 M73 P72 R14
N11316 G1 X159.264 Y199.636 E1.04769
N11317 G1 X159.264 Y199.068 E.01827
N11318 G1 X178.472 Y127.385 E2.38638
N11319 G1 X177.256 Y127.385 E.0391
N11320 G1 X159.264 Y132.205 E.59895
N11321 G1 X159.264 Y130.577 E.05236
N11322 ; WIPE_START
N11323 G1 X159.264 Y132.205 E-.61876
N11324 G1 X159.623 Y132.109 E-.14124
N11325 ; WIPE_END
N11326 G1 E-.04 F1800
N11327 M204 S10000
N11328 G17
N11329 G3 Z9 I1.217 J0 P1  F60000
N11330 ; stop printing object, unique label id: 229
N11331 M625
N11332 ; object ids of layer 43 start: 229
N11333 M624 AQAAAAAAAAA=
N11334 ;======== H2D 20250527========
N11335 ; SKIPPABLE_START
N11336 ; SKIPTYPE: timelapse
N11337 M622.1 S1 ; for prev firware, default turned on
N11338 
N11339 M1002 judge_flag timelapse_record_flag
N11340 
N11341 M622 J1
N11342 M993 A2 B2 C2
N11343 M993 A0 B0 C0
N11344 
N11345 
N11346 
N11347 
N11348     M9711 M0 E1 X260 Y141 Z9 S11 C10 O0 T3000
N11349 
N11350 
N11351 
N11352 M993 A3 B3 C3
N11353 
N11354 M623
N11355 ; SKIPPABLE_END
N11356 
N11357 ; object ids of this layer43 end: 229
N11358 M625
N11359 ; CHANGE_LAYER
N11360 ; Z_HEIGHT: 8.8
N11361 ; LAYER_HEIGHT: 0.2
N11362 ;======== H2D 20250521========
N11363 ; layer num/total_layer_count: 44/63
N11364 ; update layer progress
N11365 M73 L44
N11366 M991 S0 P43 ;notify layer change
N11367 
N11368 
N11369 ; OBJECT_ID: 229
N11370 ; COOLING_NODE: 0
N11371 ; start printing object, unique label id: 229
N11372 M624 AQAAAAAAAAA=
N11373 G1 X191.084 Y200.639 F60000
N11374 G1 Z8.8
N11375 G1 E.8 F1800
N11376 ; FEATURE: Inner wall
N11377 ; LINE_WIDTH: 0.45
N11378 ; LAYER_HEIGHT: 0.2
N11379 G1 F4421.739
N11380 M204 S8000
N11381 G1 X158.916 Y200.639 E1.03439
N11382 G1 X158.916 Y127.036 E2.36678
N11383 G1 X191.084 Y127.036 E1.03439
N11384 G1 X191.084 Y200.579 E2.36485
N11385 ; COOLING_NODE: 0
N11386 M204 S10000
N11387 G1 X191.491 Y201.046 F60000
N11388 G1 F4421.739
N11389 M204 S8000
N11390 G1 X158.509 Y201.046 E1.06057
N11391 G1 X158.509 Y126.629 E2.39296
N11392 G1 X191.491 Y126.629 E1.06057
N11393 G1 X191.491 Y200.986 E2.39103
N11394 ; COOLING_NODE: 0
N11395 M204 S10000
N11396 G1 X191.898 Y201.453 F60000
N11397 G1 F4421.739
N11398 M204 S8000
N11399 G1 X158.102 Y201.453 E1.08675
N11400 G1 X158.102 Y126.222 E2.41914
N11401 G1 X191.898 Y126.222 E1.08675
N11402 G1 X191.898 Y201.393 E2.41721
N11403 ; COOLING_NODE: 0
N11404 M204 S10000
N11405 G1 X192.29 Y201.845 F60000
N11406 ; FEATURE: Outer wall
N11407 ; LINE_WIDTH: 0.42
N11408 G1 F4773.528
N11409 M204 S5000
N11410 G1 X157.71 Y201.845 E1.03002
N11411 G1 X157.71 Y125.83 E2.26421
N11412 G1 X192.29 Y125.83 E1.03002
N11413 G1 X192.29 Y201.785 E2.26243
N11414 G1 E-.8 F1800
N11415 M204 S10000
N11416 G1 X190.736 Y198.15 Z9.2 F60000
N11417 G1 Z8.8
N11418 G1 E.8 F1800
N11419 ; FEATURE: Sparse infill
N11420 ; LINE_WIDTH: 0.45
N11421 G1 F4421.739
N11422 M204 S8000
N11423 G1 X190.736 Y199.778 E.05236
N11424 G1 X188.825 Y200.29 E.0636
N11425 G1 X187.197 Y200.29 E.05236
N11426 M204 S10000
N11427 G1 X159.264 Y195.243 F60000
N11428 G1 F4421.739
N11429 M204 S8000
N11430 G1 X159.264 Y196.872 E.05236
N11431 G1 X162.683 Y200.29 E.15546
N11432 G1 X167.219 Y200.29 E.14587
N11433 G1 X186.754 Y127.385 E2.42708
N11434 G1 X181.889 Y127.385 E.15645
N11435 G1 X190.736 Y136.231 E.4023
N11436 G1 X190.736 Y132.348 E.12487
N11437 G1 X159.264 Y140.781 E1.0477
N11438 G1 X159.264 Y139.302 E.04755
N11439 G1 X190.736 Y170.773 E1.43118
N11440 G1 X190.736 Y166.063 E.15145
N11441 G1 X159.264 Y174.496 E1.0477
N11442 G1 X159.264 Y173.844 E.02097
N11443 G1 X185.711 Y200.29 E1.20268
N11444 G1 X184.077 Y200.29 E.05255
N11445 G1 X190.736 Y175.44 E.82729
N11446 G1 X190.736 Y174.492 E.03047
N11447 G1 X159.264 Y182.925 E1.04769
N11448 G1 X159.264 Y185.358 E.07824
N11449 G1 X174.197 Y200.29 E.67907
N11450 G1 X175.648 Y200.29 E.04666
N11451 G1 X190.736 Y143.983 E1.87451
N11452 G1 X190.736 Y140.777 E.1031
N11453 G1 X159.264 Y149.209 E1.0477
N11454 G1 X159.264 Y150.816 E.05166
N11455 G1 X190.736 Y182.287 E1.43118
N11456 G1 X190.736 Y182.921 E.02038
N11457 G1 X159.264 Y191.353 E1.0477
N11458 G1 X159.264 Y189.725 E.05236
N11459 M204 S10000
N11460 G1 X159.264 Y137.236 F60000
N11461 G1 F4421.739
N11462 M204 S8000
N11463 G1 X159.264 Y135.608 E.05236
N11464 G1 X161.468 Y127.385 E.27376
N11465 G1 X159.264 Y127.385 E.07085
N11466 G1 X159.264 Y127.788 E.01297
N11467 G1 X190.736 Y159.259 E1.43118
N11468 G1 X190.736 Y157.634 E.05224
N11469 G1 X159.264 Y166.067 E1.0477
N11470 M204 S10000
N11471 G1 X159.264 Y168.693 F60000
N11472 G1 F4421.739
N11473 M204 S8000
N11474 G1 X159.264 Y167.065 E.05236
N11475 G1 X169.897 Y127.385 E1.32097
N11476 G1 X170.375 Y127.385 E.01538
N11477 G1 X190.736 Y147.745 E.92591
N11478 G1 X190.736 Y149.206 E.04696
N11479 G1 X159.264 Y157.638 E1.04769
N11480 G1 X159.264 Y162.33 E.15086
N11481 G1 X190.736 Y193.801 E1.43118
N11482 G1 X190.736 Y191.35 E.07883
N11483 G1 X159.264 Y199.782 E1.0477
N11484 G1 X159.264 Y198.521 E.04055
N11485 G1 X178.325 Y127.385 E2.36819
N11486 G1 X177.802 Y127.385 E.01682
N11487 G1 X159.264 Y132.352 E.61714
N11488 G1 X159.264 Y130.724 E.05236
N11489 ; WIPE_START
N11490 G1 X159.264 Y132.352 E-.61876
N11491 G1 X159.623 Y132.256 E-.14124
N11492 ; WIPE_END
N11493 G1 E-.04 F1800
N11494 M204 S10000
N11495 G17
N11496 G3 Z9.2 I1.217 J0 P1  F60000
N11497 ; stop printing object, unique label id: 229
N11498 M625
N11499 ; object ids of layer 44 start: 229
N11500 M624 AQAAAAAAAAA=
N11501 ;======== H2D 20250527========
N11502 ; SKIPPABLE_START
N11503 ; SKIPTYPE: timelapse
N11504 M622.1 S1 ; for prev firware, default turned on
N11505 
N11506 M1002 judge_flag timelapse_record_flag
N11507 
N11508 M622 J1
N11509 M993 A2 B2 C2
N11510 M993 A0 B0 C0
N11511 
N11512 
N11513 
N11514 
N11515     M9711 M0 E1 X260 Y141 Z9.2 S11 C10 O0 T3000
N11516 
N11517 
N11518 
N11519 M993 A3 B3 C3
N11520 
N11521 M623
N11522 ; SKIPPABLE_END
N11523 
N11524 ; object ids of this layer44 end: 229
N11525 M625
N11526 ; CHANGE_LAYER
N11527 ; Z_HEIGHT: 9
N11528 ; LAYER_HEIGHT: 0.2
N11529 ;======== H2D 20250521========
N11530 ; layer num/total_layer_count: 45/63
N11531 ; update layer progress
N11532 M73 L45
N11533 M991 S0 P44 ;notify layer change
N11534 
N11535 
N11536 ; OBJECT_ID: 229
N11537 ; COOLING_NODE: 0
N11538 ; start printing object, unique label id: 229
N11539 M624 AQAAAAAAAAA=
N11540 G1 X191.084 Y200.639 F60000
N11541 G1 Z9
N11542 G1 E.8 F1800
N11543 ; FEATURE: Inner wall
N11544 ; LINE_WIDTH: 0.45
N11545 ; LAYER_HEIGHT: 0.2
N11546 G1 F4421.739
N11547 M204 S8000
N11548 G1 X158.916 Y200.639 E1.03439
N11549 G1 X158.916 Y127.036 E2.36678
N11550 G1 X191.084 Y127.036 E1.03439
N11551 G1 X191.084 Y200.579 E2.36485
N11552 ; COOLING_NODE: 0
N11553 M204 S10000
N11554 G1 X191.491 Y201.046 F60000
N11555 G1 F4421.739
N11556 M204 S8000
N11557 G1 X158.509 Y201.046 E1.06057
N11558 G1 X158.509 Y126.629 E2.39296
N11559 G1 X191.491 Y126.629 E1.06057
N11560 G1 X191.491 Y200.986 E2.39103
N11561 ; COOLING_NODE: 0
N11562 M204 S10000
N11563 G1 X191.898 Y201.453 F60000
N11564 M73 P73 R14
N11565 G1 F4421.739
N11566 M204 S8000
N11567 G1 X158.102 Y201.453 E1.08675
N11568 G1 X158.102 Y126.222 E2.41914
N11569 G1 X191.898 Y126.222 E1.08675
N11570 G1 X191.898 Y201.393 E2.41721
N11571 ; COOLING_NODE: 0
N11572 M204 S10000
N11573 G1 X192.29 Y201.845 F60000
N11574 ; FEATURE: Outer wall
N11575 ; LINE_WIDTH: 0.42
N11576 G1 F4773.528
N11577 M204 S5000
N11578 G1 X157.71 Y201.845 E1.03002
N11579 G1 X157.71 Y125.83 E2.26421
N11580 G1 X192.29 Y125.83 E1.03002
N11581 G1 X192.29 Y201.785 E2.26243
N11582 G1 E-.8 F1800
N11583 M204 S10000
N11584 G1 X190.736 Y198.296 Z9.4 F60000
N11585 G1 Z9
N11586 G1 E.8 F1800
N11587 ; FEATURE: Sparse infill
N11588 ; LINE_WIDTH: 0.45
N11589 G1 F4421.739
N11590 M204 S8000
N11591 G1 X190.736 Y199.925 E.05236
N11592 G1 X189.371 Y200.29 E.04541
N11593 G1 X187.743 Y200.29 E.05236
N11594 M204 S10000
N11595 G1 X159.264 Y195.043 F60000
N11596 G1 F4421.739
N11597 M204 S8000
N11598 G1 X159.264 Y196.672 E.05236
N11599 G1 X162.883 Y200.29 E.16456
N11600 G1 X167.073 Y200.29 E.13473
N11601 G1 X186.608 Y127.385 E2.42708
N11602 G1 X182.089 Y127.385 E.14531
N11603 G1 X190.736 Y136.031 E.39321
N11604 G1 X190.736 Y132.494 E.11373
N11605 G1 X159.264 Y140.927 E1.04769
N11606 G1 X159.264 Y139.102 E.05869
N11607 G1 X190.736 Y170.573 E1.43118
N11608 G1 X190.736 Y166.21 E.14031
N11609 G1 X159.264 Y174.642 E1.0477
N11610 G1 X159.264 Y173.644 E.03211
N11611 G1 X185.911 Y200.29 E1.21178
N11612 G1 X183.93 Y200.29 E.06369
N11613 G1 X190.736 Y174.893 E.84549
N11614 G1 X190.736 Y174.638 E.00819
N11615 G1 X159.264 Y183.071 E1.04769
N11616 G1 X159.264 Y185.158 E.0671
N11617 G1 X174.397 Y200.29 E.68817
N11618 G1 X175.502 Y200.29 E.03552
N11619 G1 X190.736 Y143.437 E1.8927
N11620 G1 X190.736 Y140.923 E.08082
N11621 G1 X159.264 Y149.356 E1.0477
N11622 G1 X159.264 Y150.616 E.04052
N11623 G1 X190.736 Y182.087 E1.43118
N11624 G1 X190.736 Y183.067 E.03152
N11625 G1 X159.264 Y191.5 E1.0477
N11626 G1 X159.264 Y189.872 E.05236
N11627 M204 S10000
N11628 G1 X159.264 Y136.69 F60000
N11629 G1 F4421.739
N11630 M204 S8000
N11631 G1 X159.264 Y135.062 E.05236
N11632 G1 X161.321 Y127.385 E.25557
N11633 G1 X159.264 Y127.385 E.06615
N11634 G1 X159.264 Y127.588 E.00654
N11635 G1 X190.736 Y159.059 E1.43118
N11636 G1 X190.736 Y157.781 E.0411
N11637 G1 X159.264 Y166.213 E1.0477
N11638 G1 X159.264 Y166.518 E.0098
N11639 G1 X169.75 Y127.385 E1.30278
N11640 G1 X170.575 Y127.385 E.02652
N11641 G1 X190.736 Y147.545 E.91682
N11642 G1 X190.736 Y149.352 E.0581
N11643 G1 X159.264 Y157.785 E1.0477
N11644 G1 X159.264 Y162.13 E.13972
N11645 G1 X190.736 Y193.601 E1.43118
N11646 G1 X190.736 Y191.496 E.06769
N11647 G1 X159.264 Y199.929 E1.0477
N11648 G1 X159.264 Y197.975 E.06283
N11649 G1 X178.179 Y127.385 E2.35
N11650 G1 X178.349 Y127.385 E.00546
N11651 G1 X159.264 Y132.498 E.63533
N11652 G1 X159.264 Y130.87 E.05236
N11653 ; WIPE_START
N11654 G1 X159.264 Y132.498 E-.61876
N11655 G1 X159.623 Y132.402 E-.14124
N11656 ; WIPE_END
N11657 G1 E-.04 F1800
N11658 M204 S10000
N11659 G17
N11660 G3 Z9.4 I1.217 J0 P1  F60000
N11661 ; stop printing object, unique label id: 229
N11662 M625
N11663 ; object ids of layer 45 start: 229
N11664 M624 AQAAAAAAAAA=
N11665 ;======== H2D 20250527========
N11666 ; SKIPPABLE_START
N11667 ; SKIPTYPE: timelapse
N11668 M622.1 S1 ; for prev firware, default turned on
N11669 
N11670 M1002 judge_flag timelapse_record_flag
N11671 
N11672 M622 J1
N11673 M993 A2 B2 C2
N11674 M993 A0 B0 C0
N11675 
N11676 
N11677 
N11678 
N11679     M9711 M0 E1 X260 Y141 Z9.4 S11 C10 O0 T3000
N11680 
N11681 
N11682 
N11683 M993 A3 B3 C3
N11684 
N11685 M623
N11686 ; SKIPPABLE_END
N11687 
N11688 ; object ids of this layer45 end: 229
N11689 M625
N11690 ; CHANGE_LAYER
N11691 ; Z_HEIGHT: 9.2
N11692 ; LAYER_HEIGHT: 0.2
N11693 ;======== H2D 20250521========
N11694 ; layer num/total_layer_count: 46/63
N11695 ; update layer progress
N11696 M73 L46
N11697 M991 S0 P45 ;notify layer change
N11698 
N11699 
N11700 ; OBJECT_ID: 229
N11701 ; COOLING_NODE: 0
N11702 ; start printing object, unique label id: 229
N11703 M624 AQAAAAAAAAA=
N11704 G1 X191.084 Y200.639 F60000
N11705 G1 Z9.2
N11706 G1 E.8 F1800
N11707 ; FEATURE: Inner wall
N11708 ; LINE_WIDTH: 0.45
N11709 ; LAYER_HEIGHT: 0.2
N11710 G1 F4421.739
N11711 M204 S8000
N11712 G1 X158.916 Y200.639 E1.03439
N11713 G1 X158.916 Y127.036 E2.36678
N11714 G1 X191.084 Y127.036 E1.03439
N11715 G1 X191.084 Y200.579 E2.36485
N11716 ; COOLING_NODE: 0
N11717 M204 S10000
N11718 G1 X191.491 Y201.046 F60000
N11719 G1 F4421.739
N11720 M204 S8000
N11721 G1 X158.509 Y201.046 E1.06057
N11722 G1 X158.509 Y126.629 E2.39296
N11723 G1 X191.491 Y126.629 E1.06057
N11724 G1 X191.491 Y200.986 E2.39103
N11725 ; COOLING_NODE: 0
N11726 M204 S10000
N11727 G1 X191.898 Y201.453 F60000
N11728 G1 F4421.739
N11729 M204 S8000
N11730 G1 X158.102 Y201.453 E1.08675
N11731 M73 P73 R13
N11732 G1 X158.102 Y126.222 E2.41914
N11733 G1 X191.898 Y126.222 E1.08675
N11734 G1 X191.898 Y201.393 E2.41721
N11735 ; COOLING_NODE: 0
N11736 M204 S10000
N11737 G1 X192.29 Y201.845 F60000
N11738 ; FEATURE: Outer wall
N11739 ; LINE_WIDTH: 0.42
N11740 G1 F4773.528
N11741 M204 S5000
N11742 G1 X157.71 Y201.845 E1.03002
N11743 G1 X157.71 Y125.83 E2.26421
N11744 G1 X192.29 Y125.83 E1.03002
N11745 G1 X192.29 Y201.785 E2.26243
N11746 G1 E-.8 F1800
N11747 M204 S10000
N11748 G1 X190.736 Y198.443 Z9.6 F60000
N11749 M73 P74 R13
N11750 G1 Z9.2
N11751 G1 E.8 F1800
N11752 ; FEATURE: Sparse infill
N11753 ; LINE_WIDTH: 0.45
N11754 G1 F4421.739
N11755 M204 S8000
N11756 G1 X190.736 Y200.071 E.05236
N11757 G1 X189.918 Y200.29 E.02722
N11758 G1 X188.29 Y200.29 E.05236
N11759 M204 S10000
N11760 G1 X190.736 Y174.785 F60000
N11761 G1 F4421.739
N11762 M204 S8000
N11763 G1 X159.264 Y183.217 E1.0477
N11764 G1 X159.264 Y184.958 E.05596
N11765 G1 X174.597 Y200.29 E.69726
N11766 G1 X175.355 Y200.29 E.02438
N11767 G1 X190.736 Y142.89 E1.91089
N11768 G1 X190.736 Y141.07 E.05854
N11769 G1 X159.264 Y149.502 E1.0477
N11770 G1 X159.264 Y150.416 E.02938
N11771 G1 X190.736 Y181.887 E1.43118
N11772 G1 X190.736 Y183.214 E.04266
N11773 G1 X159.264 Y191.646 E1.0477
N11774 G1 X159.264 Y190.018 E.05236
N11775 M204 S10000
N11776 G1 X159.264 Y196.472 F60000
N11777 G1 F4421.739
N11778 M204 S8000
N11779 G1 X163.083 Y200.29 E.17366
N11780 G1 X166.926 Y200.29 E.12359
N11781 G1 X186.461 Y127.385 E2.42708
N11782 G1 X188.09 Y127.385 E.05236
N11783 M204 S10000
N11784 G1 X178.033 Y127.385 F60000
N11785 G1 F4421.739
N11786 M204 S8000
N11787 G1 X159.264 Y197.428 E2.33181
N11788 G1 X159.264 Y200.075 E.08511
N11789 G1 X190.736 Y191.642 E1.0477
N11790 G1 X190.736 Y193.401 E.05655
N11791 G1 X159.264 Y161.93 E1.43118
N11792 G1 X159.264 Y157.931 E.12859
N11793 G1 X190.736 Y149.498 E1.0477
N11794 G1 X190.736 Y147.345 E.06924
N11795 G1 X170.775 Y127.385 E.90772
N11796 G1 X169.604 Y127.385 E.03766
N11797 G1 X159.264 Y165.972 E1.28459
N11798 G1 X159.264 Y166.36 E.01248
N11799 G1 X190.736 Y157.927 E1.0477
N11800 G1 X190.736 Y158.859 E.02996
N11801 G1 X159.264 Y127.388 E1.43118
N11802 G1 X161.175 Y127.385 E.06144
N11803 G1 X159.264 Y134.515 E.23738
N11804 G1 X159.264 Y136.143 E.05236
N11805 M204 S10000
N11806 G1 X159.264 Y131.016 F60000
N11807 G1 F4421.739
N11808 M204 S8000
N11809 G1 X159.264 Y132.645 E.05236
N11810 G1 X178.895 Y127.385 E.65352
N11811 G1 X182.289 Y127.385 E.10913
N11812 G1 X190.736 Y135.831 E.38411
N11813 G1 X190.736 Y132.641 E.10259
N11814 G1 X159.264 Y141.073 E1.04769
N11815 G1 X159.264 Y138.902 E.06983
N11816 G1 X190.736 Y170.373 E1.43118
N11817 G1 X190.736 Y174.347 E.12778
N11818 G1 X183.784 Y200.29 E.86368
N11819 G1 X186.111 Y200.29 E.07483
N11820 G1 X159.264 Y173.444 E1.22087
N11821 G1 X159.264 Y174.789 E.04325
N11822 G1 X190.736 Y166.356 E1.0477
N11823 G1 X190.736 Y164.728 E.05236
N11824 ; WIPE_START
N11825 G1 X190.736 Y166.356 E-.61876
N11826 G1 X190.377 Y166.452 E-.14124
N11827 ; WIPE_END
N11828 G1 E-.04 F1800
N11829 M204 S10000
N11830 G17
N11831 G3 Z9.6 I1.217 J0 P1  F60000
N11832 ; stop printing object, unique label id: 229
N11833 M625
N11834 ; object ids of layer 46 start: 229
N11835 M624 AQAAAAAAAAA=
N11836 ;======== H2D 20250527========
N11837 ; SKIPPABLE_START
N11838 ; SKIPTYPE: timelapse
N11839 M622.1 S1 ; for prev firware, default turned on
N11840 
N11841 M1002 judge_flag timelapse_record_flag
N11842 
N11843 M622 J1
N11844 M993 A2 B2 C2
N11845 M993 A0 B0 C0
N11846 
N11847 
N11848 
N11849 
N11850     M9711 M0 E1 X260 Y141 Z9.6 S11 C10 O0 T3000
N11851 
N11852 
N11853 
N11854 M993 A3 B3 C3
N11855 
N11856 M623
N11857 ; SKIPPABLE_END
N11858 
N11859 ; object ids of this layer46 end: 229
N11860 M625
N11861 ; CHANGE_LAYER
N11862 ; Z_HEIGHT: 9.4
N11863 ; LAYER_HEIGHT: 0.2
N11864 ;======== H2D 20250521========
N11865 ; layer num/total_layer_count: 47/63
N11866 ; update layer progress
N11867 M73 L47
N11868 M991 S0 P46 ;notify layer change
N11869 
N11870 
N11871 M106 S51
N11872 ; OBJECT_ID: 229
N11873 ; COOLING_NODE: 0
N11874 ; start printing object, unique label id: 229
N11875 M624 AQAAAAAAAAA=
N11876 G1 X191.084 Y200.639 F60000
N11877 G1 Z9.4
N11878 G1 E.8 F1800
N11879 ; FEATURE: Inner wall
N11880 ; LINE_WIDTH: 0.45
N11881 ; LAYER_HEIGHT: 0.2
N11882 G1 F4421.739
N11883 M204 S8000
N11884 G1 X158.916 Y200.639 E1.03439
N11885 G1 X158.916 Y127.036 E2.36678
N11886 G1 X191.084 Y127.036 E1.03439
N11887 G1 X191.084 Y200.579 E2.36485
N11888 ; COOLING_NODE: 0
N11889 M204 S10000
N11890 G1 X191.491 Y201.046 F60000
N11891 G1 F4421.739
N11892 M204 S8000
N11893 G1 X158.509 Y201.046 E1.06057
N11894 G1 X158.509 Y126.629 E2.39296
N11895 G1 X191.491 Y126.629 E1.06057
N11896 G1 X191.491 Y200.986 E2.39103
N11897 ; COOLING_NODE: 0
N11898 M204 S10000
N11899 G1 X191.898 Y201.453 F60000
N11900 G1 F4421.739
N11901 M204 S8000
N11902 G1 X158.102 Y201.453 E1.08675
N11903 G1 X158.102 Y126.222 E2.41914
N11904 G1 X191.898 Y126.222 E1.08675
N11905 G1 X191.898 Y201.393 E2.41721
N11906 ; COOLING_NODE: 0
N11907 M204 S10000
N11908 G1 X192.29 Y201.845 F60000
N11909 ; FEATURE: Outer wall
N11910 ; LINE_WIDTH: 0.42
N11911 G1 F4773.528
N11912 M204 S5000
N11913 G1 X157.71 Y201.845 E1.03002
N11914 G1 X157.71 Y125.83 E2.26421
N11915 G1 X192.29 Y125.83 E1.03002
N11916 G1 X192.29 Y201.785 E2.26243
N11917 G1 E-.8 F1800
N11918 M204 S10000
N11919 G1 X191.849 Y194.165 Z9.8 F60000
N11920 G1 X190.736 Y174.931 Z9.8
N11921 G1 Z9.4
N11922 G1 E.8 F1800
N11923 ; FEATURE: Sparse infill
N11924 ; LINE_WIDTH: 0.45
N11925 G1 F4421.739
N11926 M204 S8000
N11927 G1 X159.264 Y183.364 E1.0477
N11928 G1 X159.264 Y184.758 E.04482
N11929 G1 X174.797 Y200.29 E.70636
N11930 G1 X175.209 Y200.29 E.01324
N11931 G1 X190.736 Y142.344 E1.92908
N11932 G1 X190.736 Y141.216 E.03626
N11933 G1 X159.264 Y149.649 E1.0477
N11934 G1 X159.264 Y150.216 E.01824
N11935 G1 X190.736 Y181.687 E1.43118
N11936 G1 X190.736 Y183.36 E.0538
N11937 G1 X159.264 Y191.793 E1.0477
N11938 G1 X159.264 Y190.164 E.05236
N11939 M204 S10000
N11940 G1 X159.264 Y196.272 F60000
N11941 G1 F4421.739
N11942 M204 S8000
N11943 G1 X163.283 Y200.29 E.18275
N11944 G1 X166.78 Y200.29 E.11245
N11945 G1 X186.315 Y127.385 E2.42708
N11946 G1 X187.943 Y127.385 E.05236
N11947 M204 S10000
N11948 G1 X176.258 Y127.385 F60000
N11949 G1 F4421.739
N11950 M204 S8000
N11951 G1 X177.886 Y127.385 E.05236
N11952 G1 X159.264 Y196.882 E2.31362
N11953 G1 X159.264 Y200.221 E.10738
N11954 G1 X190.736 Y191.789 E1.0477
N11955 G1 X190.736 Y193.201 E.04541
N11956 G1 X159.264 Y161.73 E1.43118
N11957 G1 X159.264 Y158.077 E.11745
N11958 M73 P75 R13
N11959 G1 X190.736 Y149.645 E1.0477
N11960 G1 X190.736 Y147.145 E.08038
N11961 G1 X170.975 Y127.385 E.89863
N11962 G1 X169.457 Y127.385 E.0488
N11963 G1 X159.264 Y165.425 E1.2664
N11964 G1 X159.264 Y166.506 E.03476
N11965 G1 X190.736 Y158.074 E1.0477
N11966 G1 X190.736 Y158.659 E.01883
N11967 G1 X159.461 Y127.385 E1.42223
N11968 G1 X161.029 Y127.385 E.05041
N11969 G1 X159.264 Y133.969 E.21919
N11970 G1 X159.264 Y135.597 E.05236
N11971 M204 S10000
N11972 G1 X159.264 Y132.791 F60000
N11973 G1 F4421.739
N11974 M204 S8000
N11975 G1 X179.442 Y127.385 E.67171
N11976 G1 X182.489 Y127.385 E.098
N11977 G1 X190.736 Y135.631 E.37502
N11978 G1 X190.736 Y132.787 E.09145
N11979 G1 X159.264 Y141.22 E1.0477
N11980 G1 X159.264 Y138.702 E.08097
N11981 G1 X190.736 Y170.173 E1.43118
N11982 G1 X190.736 Y173.8 E.11664
N11983 G1 X183.638 Y200.29 E.88187
N11984 G1 X186.311 Y200.29 E.08597
N11985 G1 X159.264 Y173.244 E1.22997
N11986 G1 X159.264 Y174.935 E.05439
N11987 G1 X190.736 Y166.502 E1.0477
N11988 G1 X190.736 Y164.874 E.05236
N11989 ; WIPE_START
N11990 G1 X190.736 Y166.502 E-.61876
N11991 G1 X190.377 Y166.599 E-.14124
N11992 ; WIPE_END
N11993 G1 E-.04 F1800
N11994 M204 S10000
N11995 G17
N11996 G3 Z9.8 I1.217 J0 P1  F60000
N11997 ; stop printing object, unique label id: 229
N11998 M625
N11999 ; object ids of layer 47 start: 229
N12000 M624 AQAAAAAAAAA=
N12001 ;======== H2D 20250527========
N12002 ; SKIPPABLE_START
N12003 ; SKIPTYPE: timelapse
N12004 M622.1 S1 ; for prev firware, default turned on
N12005 
N12006 M1002 judge_flag timelapse_record_flag
N12007 
N12008 M622 J1
N12009 M993 A2 B2 C2
N12010 M993 A0 B0 C0
N12011 
N12012 
N12013 
N12014 
N12015     M9711 M0 E1 X260 Y141 Z9.8 S11 C10 O0 T3000
N12016 
N12017 
N12018 
N12019 M993 A3 B3 C3
N12020 
N12021 M623
N12022 ; SKIPPABLE_END
N12023 
N12024 ; object ids of this layer47 end: 229
N12025 M625
N12026 ; CHANGE_LAYER
N12027 ; Z_HEIGHT: 9.6
N12028 ; LAYER_HEIGHT: 0.200001
N12029 ;======== H2D 20250521========
N12030 ; layer num/total_layer_count: 48/63
N12031 ; update layer progress
N12032 M73 L48
N12033 M991 S0 P47 ;notify layer change
N12034 
N12035 
N12036 ; OBJECT_ID: 229
N12037 ; COOLING_NODE: 0
N12038 ; start printing object, unique label id: 229
N12039 M624 AQAAAAAAAAA=
N12040 G1 X191.084 Y200.639 F60000
N12041 G1 Z9.6
N12042 G1 E.8 F1800
N12043 ; FEATURE: Inner wall
N12044 ; LINE_WIDTH: 0.45
N12045 ; LAYER_HEIGHT: 0.2
N12046 G1 F4421.739
N12047 M204 S8000
N12048 G1 X158.916 Y200.639 E1.03439
N12049 G1 X158.916 Y127.036 E2.36678
N12050 G1 X191.084 Y127.036 E1.03439
N12051 G1 X191.084 Y200.579 E2.36485
N12052 ; COOLING_NODE: 0
N12053 M204 S10000
N12054 G1 X191.491 Y201.046 F60000
N12055 G1 F4421.739
N12056 M204 S8000
N12057 G1 X158.509 Y201.046 E1.06057
N12058 G1 X158.509 Y126.629 E2.39296
N12059 G1 X191.491 Y126.629 E1.06057
N12060 G1 X191.491 Y200.986 E2.39103
N12061 ; COOLING_NODE: 0
N12062 M204 S10000
N12063 G1 X191.898 Y201.453 F60000
N12064 G1 F4421.739
N12065 M204 S8000
N12066 G1 X158.102 Y201.453 E1.08675
N12067 G1 X158.102 Y126.222 E2.41914
N12068 G1 X191.898 Y126.222 E1.08675
N12069 G1 X191.898 Y201.393 E2.41721
N12070 ; COOLING_NODE: 0
N12071 M204 S10000
N12072 G1 X192.29 Y201.845 F60000
N12073 ; FEATURE: Outer wall
N12074 ; LINE_WIDTH: 0.42
N12075 G1 F4773.528
N12076 M204 S5000
N12077 G1 X157.71 Y201.845 E1.03002
N12078 G1 X157.71 Y125.83 E2.26421
N12079 G1 X192.29 Y125.83 E1.03002
N12080 G1 X192.29 Y201.785 E2.26243
N12081 G1 E-.8 F1800
N12082 M204 S10000
N12083 G1 X191.818 Y194.167 Z10 F60000
N12084 G1 X190.736 Y176.706 Z10
N12085 G1 Z9.6
N12086 G1 E.8 F1800
N12087 ; FEATURE: Sparse infill
N12088 ; LINE_WIDTH: 0.45
N12089 G1 F4421.739
N12090 M204 S8000
N12091 G1 X190.736 Y175.078 E.05236
N12092 G1 X159.264 Y183.51 E1.0477
N12093 G1 X159.264 Y184.558 E.03368
N12094 G1 X174.997 Y200.29 E.71545
N12095 G1 X175.062 Y200.29 E.0021
N12096 G1 X190.736 Y141.797 E1.94727
N12097 G1 X190.736 Y141.362 E.01398
N12098 G1 X159.264 Y149.795 E1.04769
N12099 G1 X159.264 Y150.016 E.0071
N12100 G1 X190.736 Y181.487 E1.43118
N12101 G1 X190.736 Y183.506 E.06494
N12102 G1 X159.264 Y191.939 E1.04769
N12103 G1 X159.264 Y190.311 E.05236
N12104 M204 S10000
N12105 G1 X159.264 Y198.952 F60000
N12106 G1 F4421.739
N12107 M204 S8000
N12108 M73 P75 R12
N12109 G1 X159.264 Y200.29 E.04305
N12110 G1 X159.554 Y200.29 E.00931
N12111 G1 X190.736 Y191.935 E1.03806
N12112 G1 X190.736 Y193.001 E.03427
N12113 G1 X159.264 Y161.53 E1.43118
N12114 G1 X159.264 Y158.224 E.10631
N12115 G1 X190.736 Y149.791 E1.0477
N12116 G1 X190.736 Y146.945 E.09152
N12117 G1 X171.175 Y127.385 E.88953
N12118 G1 X169.311 Y127.385 E.05994
N12119 G1 X159.264 Y164.879 E1.24821
N12120 G1 X159.264 Y166.653 E.05704
N12121 G1 X190.736 Y158.22 E1.04769
N12122 G1 X190.736 Y158.459 E.00769
N12123 G1 X159.661 Y127.385 E1.41314
N12124 G1 X160.882 Y127.385 E.03927
N12125 G1 X159.264 Y133.422 E.201
N12126 G1 X159.264 Y135.051 E.05236
N12127 M204 S10000
N12128 G1 X159.264 Y132.938 F60000
N12129 G1 F4421.739
N12130 M204 S8000
N12131 G1 X179.988 Y127.385 E.6899
N12132 G1 X182.689 Y127.385 E.08686
N12133 G1 X190.736 Y135.431 E.36592
N12134 G1 X190.736 Y132.934 E.08031
N12135 G1 X159.264 Y141.366 E1.0477
N12136 G1 X159.264 Y138.502 E.09211
N12137 G1 X190.736 Y169.973 E1.43118
N12138 G1 X190.736 Y173.254 E.10551
N12139 G1 X183.491 Y200.29 E.90006
N12140 G1 X186.511 Y200.29 E.0971
N12141 G1 X159.264 Y173.044 E1.23906
N12142 G1 X159.264 Y175.081 E.06553
N12143 G1 X190.736 Y166.649 E1.0477
N12144 G1 X190.736 Y165.021 E.05236
N12145 M204 S10000
N12146 G1 X187.797 Y127.385 F60000
N12147 G1 F4421.739
N12148 M204 S8000
N12149 G1 X186.169 Y127.385 E.05236
N12150 G1 X166.634 Y200.29 E2.42708
N12151 G1 X163.483 Y200.29 E.10131
N12152 G1 X159.264 Y196.072 E.19185
N12153 G1 X159.264 Y196.336 E.00849
N12154 G1 X177.74 Y127.385 E2.29543
N12155 G1 X176.112 Y127.385 E.05236
N12156 ; WIPE_START
N12157 G1 X177.74 Y127.385 E-.61876
N12158 G1 X177.644 Y127.744 E-.14124
N12159 ; WIPE_END
N12160 G1 E-.04 F1800
N12161 M204 S10000
N12162 G17
N12163 G3 Z10 I1.217 J0 P1  F60000
N12164 ; stop printing object, unique label id: 229
N12165 M625
N12166 ; object ids of layer 48 start: 229
N12167 M624 AQAAAAAAAAA=
N12168 ;======== H2D 20250527========
N12169 ; SKIPPABLE_START
N12170 ; SKIPTYPE: timelapse
N12171 M622.1 S1 ; for prev firware, default turned on
N12172 
N12173 M1002 judge_flag timelapse_record_flag
N12174 
N12175 M622 J1
N12176 M993 A2 B2 C2
N12177 M993 A0 B0 C0
N12178 
N12179 
N12180 
N12181 
N12182     M9711 M0 E1 X260 Y141 Z10 S11 C10 O0 T3000
N12183 
N12184 
N12185 
N12186 M993 A3 B3 C3
N12187 
N12188 M623
N12189 ; SKIPPABLE_END
N12190 
N12191 ; object ids of this layer48 end: 229
N12192 M625
N12193 ; CHANGE_LAYER
N12194 ; Z_HEIGHT: 9.8
N12195 ; LAYER_HEIGHT: 0.2
N12196 ;======== H2D 20250521========
N12197 ; layer num/total_layer_count: 49/63
N12198 ; update layer progress
N12199 M73 L49
N12200 M991 S0 P48 ;notify layer change
N12201 
N12202 
N12203 ; OBJECT_ID: 229
N12204 ; COOLING_NODE: 0
N12205 ; start printing object, unique label id: 229
N12206 M624 AQAAAAAAAAA=
N12207 G1 X191.084 Y200.639 F60000
N12208 G1 Z9.8
N12209 G1 E.8 F1800
N12210 ; FEATURE: Inner wall
N12211 ; LINE_WIDTH: 0.45
N12212 ; LAYER_HEIGHT: 0.2
N12213 G1 F4421.739
N12214 M204 S8000
N12215 G1 X158.916 Y200.639 E1.03439
N12216 G1 X158.916 Y127.036 E2.36678
N12217 G1 X191.084 Y127.036 E1.03439
N12218 G1 X191.084 Y200.579 E2.36485
N12219 ; COOLING_NODE: 0
N12220 M204 S10000
N12221 M73 P76 R12
N12222 G1 X191.491 Y201.046 F60000
N12223 G1 F4421.739
N12224 M204 S8000
N12225 G1 X158.509 Y201.046 E1.06057
N12226 G1 X158.509 Y126.629 E2.39296
N12227 G1 X191.491 Y126.629 E1.06057
N12228 G1 X191.491 Y200.986 E2.39103
N12229 ; COOLING_NODE: 0
N12230 M204 S10000
N12231 G1 X191.898 Y201.453 F60000
N12232 G1 F4421.739
N12233 M204 S8000
N12234 G1 X158.102 Y201.453 E1.08675
N12235 G1 X158.102 Y126.222 E2.41914
N12236 G1 X191.898 Y126.222 E1.08675
N12237 G1 X191.898 Y201.393 E2.41721
N12238 ; COOLING_NODE: 0
N12239 M204 S10000
N12240 G1 X192.29 Y201.845 F60000
N12241 ; FEATURE: Outer wall
N12242 ; LINE_WIDTH: 0.42
N12243 G1 F4773.528
N12244 M204 S5000
N12245 G1 X157.71 Y201.845 E1.03002
N12246 G1 X157.71 Y125.83 E2.26421
N12247 G1 X192.29 Y125.83 E1.03002
N12248 G1 X192.29 Y201.785 E2.26243
N12249 G1 E-.8 F1800
N12250 M204 S10000
N12251 G1 X191.815 Y194.167 Z10.2 F60000
N12252 G1 X190.736 Y176.852 Z10.2
N12253 G1 Z9.8
N12254 G1 E.8 F1800
N12255 ; FEATURE: Sparse infill
N12256 ; LINE_WIDTH: 0.45
N12257 G1 F4421.739
N12258 M204 S8000
N12259 G1 X190.736 Y175.224 E.05236
N12260 G1 X159.264 Y183.657 E1.0477
N12261 G1 X159.264 Y184.358 E.02254
N12262 G1 X175.197 Y200.29 E.72455
N12263 G1 X174.916 Y200.29 E.00904
N12264 G1 X190.736 Y141.251 E1.96546
N12265 G1 X190.736 Y141.509 E.00829
N12266 G1 X159.264 Y149.942 E1.0477
N12267 G1 X159.264 Y149.816 E.00404
N12268 G1 X190.736 Y181.287 E1.43118
N12269 G1 X190.736 Y183.653 E.07608
N12270 G1 X159.264 Y192.085 E1.0477
N12271 G1 X159.264 Y190.457 E.05236
N12272 M204 S10000
N12273 G1 X159.264 Y199.498 F60000
N12274 G1 F4421.739
N12275 M204 S8000
N12276 G1 X159.264 Y200.29 E.02548
N12277 G1 X160.1 Y200.29 E.02688
N12278 G1 X190.736 Y192.082 E1.01987
N12279 G1 X190.736 Y192.801 E.02313
N12280 G1 X159.264 Y161.33 E1.43118
N12281 G1 X159.264 Y158.37 E.09517
N12282 G1 X190.736 Y149.938 E1.0477
N12283 G1 X190.736 Y146.745 E.10266
N12284 G1 X171.375 Y127.385 E.88044
N12285 G1 X169.165 Y127.385 E.07108
N12286 G1 X159.264 Y164.333 E1.23002
N12287 G1 X159.264 Y166.799 E.07931
N12288 G1 X190.736 Y158.366 E1.0477
N12289 G1 X190.736 Y158.259 E.00345
N12290 G1 X159.861 Y127.385 E1.40404
N12291 G1 X160.736 Y127.385 E.02813
N12292 G1 X159.264 Y132.876 E.18281
N12293 G1 X159.264 Y133.084 E.00669
N12294 G1 X180.534 Y127.385 E.70809
N12295 G1 X182.889 Y127.385 E.07572
N12296 G1 X190.736 Y135.231 E.35683
N12297 G1 X190.736 Y133.08 E.06917
N12298 G1 X159.264 Y141.513 E1.0477
N12299 G1 X159.264 Y138.302 E.10325
N12300 G1 X190.736 Y169.773 E1.43118
N12301 G1 X190.736 Y172.708 E.09437
N12302 G1 X183.345 Y200.29 E.91825
N12303 G1 X186.711 Y200.29 E.10824
N12304 G1 X159.264 Y172.844 E1.24816
N12305 G1 X159.264 Y175.228 E.07666
N12306 G1 X190.736 Y166.795 E1.0477
N12307 G1 X190.736 Y165.167 E.05236
N12308 M204 S10000
N12309 G1 X187.651 Y127.385 F60000
N12310 G1 F4421.739
N12311 M204 S8000
N12312 G1 X186.022 Y127.385 E.05236
N12313 G1 X166.487 Y200.29 E2.42708
N12314 G1 X163.683 Y200.29 E.09017
N12315 G1 X159.264 Y195.872 E.20094
N12316 G1 X159.264 Y195.789 E.00265
N12317 G1 X177.593 Y127.385 E2.27724
N12318 G1 X175.965 Y127.385 E.05236
N12319 ; WIPE_START
N12320 G1 X177.593 Y127.385 E-.61876
N12321 G1 X177.497 Y127.744 E-.14124
N12322 ; WIPE_END
N12323 G1 E-.04 F1800
N12324 M204 S10000
N12325 G17
N12326 G3 Z10.2 I1.217 J0 P1  F60000
N12327 ; stop printing object, unique label id: 229
N12328 M625
N12329 ; object ids of layer 49 start: 229
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
N12345     M9711 M0 E1 X260 Y141 Z10.2 S11 C10 O0 T3000
N12346 
N12347 
N12348 
N12349 M993 A3 B3 C3
N12350 
N12351 M623
N12352 ; SKIPPABLE_END
N12353 
N12354 ; object ids of this layer49 end: 229
N12355 M625
N12356 ; CHANGE_LAYER
N12357 ; Z_HEIGHT: 10
N12358 ; LAYER_HEIGHT: 0.2
N12359 ;======== H2D 20250521========
N12360 ; layer num/total_layer_count: 50/63
N12361 ; update layer progress
N12362 M73 L50
N12363 M991 S0 P49 ;notify layer change
N12364 
N12365 
N12366 M106 S48.45
N12367 ; OBJECT_ID: 229
N12368 ; COOLING_NODE: 0
N12369 ; start printing object, unique label id: 229
N12370 M624 AQAAAAAAAAA=
N12371 G1 X191.084 Y200.639 F60000
N12372 G1 Z10
N12373 G1 E.8 F1800
N12374 ; FEATURE: Inner wall
N12375 ; LINE_WIDTH: 0.45
N12376 ; LAYER_HEIGHT: 0.2
N12377 G1 F4421.739
N12378 M204 S8000
N12379 G1 X158.916 Y200.639 E1.03439
N12380 G1 X158.916 Y127.036 E2.36678
N12381 G1 X191.084 Y127.036 E1.03439
N12382 G1 X191.084 Y200.579 E2.36485
N12383 ; COOLING_NODE: 0
N12384 M204 S10000
N12385 G1 X191.491 Y201.046 F60000
N12386 G1 F4421.739
N12387 M204 S8000
N12388 G1 X158.509 Y201.046 E1.06057
N12389 G1 X158.509 Y126.629 E2.39296
N12390 G1 X191.491 Y126.629 E1.06057
N12391 G1 X191.491 Y200.986 E2.39103
N12392 ; COOLING_NODE: 0
N12393 M204 S10000
N12394 G1 X191.898 Y201.453 F60000
N12395 G1 F4421.739
N12396 M204 S8000
N12397 G1 X158.102 Y201.453 E1.08675
N12398 G1 X158.102 Y126.222 E2.41914
N12399 G1 X191.898 Y126.222 E1.08675
N12400 G1 X191.898 Y201.393 E2.41721
N12401 ; COOLING_NODE: 0
N12402 M204 S10000
N12403 G1 X192.29 Y201.845 F60000
N12404 ; FEATURE: Outer wall
N12405 ; LINE_WIDTH: 0.42
N12406 M73 P77 R12
N12407 G1 F4773.528
N12408 M204 S5000
N12409 G1 X157.71 Y201.845 E1.03002
N12410 G1 X157.71 Y125.83 E2.26421
N12411 G1 X192.29 Y125.83 E1.03002
N12412 G1 X192.29 Y201.785 E2.26243
N12413 G1 E-.8 F1800
N12414 M204 S10000
N12415 G1 X191.812 Y194.167 Z10.4 F60000
N12416 G1 X190.736 Y176.999 Z10.4
N12417 G1 Z10
N12418 G1 E.8 F1800
N12419 ; FEATURE: Sparse infill
N12420 ; LINE_WIDTH: 0.45
N12421 G1 F4421.739
N12422 M204 S8000
N12423 G1 X190.736 Y175.37 E.05236
N12424 G1 X159.264 Y183.803 E1.0477
N12425 G1 X159.264 Y184.158 E.0114
N12426 G1 X175.397 Y200.29 E.73364
N12427 G1 X174.77 Y200.29 E.02018
N12428 G1 X190.736 Y140.705 E1.98365
N12429 G1 X190.736 Y139.076 E.05236
N12430 M204 S10000
N12431 G1 X190.736 Y141.655 F60000
N12432 G1 F4421.739
N12433 M204 S8000
N12434 G1 X159.264 Y150.088 E1.0477
N12435 G1 X159.264 Y149.616 E.01518
N12436 G1 X190.736 Y181.087 E1.43118
N12437 G1 X190.736 Y183.799 E.08722
N12438 G1 X159.264 Y192.232 E1.0477
N12439 G1 X159.264 Y190.604 E.05236
N12440 M204 S10000
N12441 G1 X159.264 Y200.044 F60000
N12442 G1 F4421.739
N12443 M204 S8000
N12444 G1 X159.264 Y200.29 E.00791
N12445 G1 X160.647 Y200.29 E.04445
N12446 G1 X190.736 Y192.228 E1.00168
N12447 G1 X190.736 Y192.601 E.01199
N12448 G1 X159.264 Y161.13 E1.43118
N12449 G1 X159.264 Y158.517 E.08403
N12450 G1 X190.736 Y150.084 E1.0477
N12451 G1 X190.736 Y146.545 E.1138
N12452 G1 X171.575 Y127.385 E.87134
N12453 G1 X169.018 Y127.385 E.08222
N12454 G1 X159.264 Y163.786 E1.21183
N12455 G1 X159.264 Y166.946 E.10159
N12456 G1 X190.736 Y158.513 E1.0477
N12457 G1 X190.736 Y158.059 E.01459
N12458 G1 X160.061 Y127.385 E1.39495
N12459 G1 X160.589 Y127.385 E.01699
N12460 G1 X159.264 Y132.329 E.16462
N12461 G1 X159.264 Y133.23 E.02897
N12462 G1 X181.081 Y127.385 E.72628
N12463 G1 X183.089 Y127.385 E.06458
N12464 G1 X190.736 Y135.031 E.34773
N12465 G1 X190.736 Y133.226 E.05803
N12466 G1 X159.264 Y141.659 E1.0477
N12467 G1 X159.264 Y138.102 E.11439
N12468 G1 X190.736 Y169.573 E1.43118
N12469 G1 X190.736 Y172.161 E.08323
N12470 G1 X183.198 Y200.29 E.93644
N12471 G1 X186.911 Y200.29 E.11938
N12472 G1 X159.264 Y172.644 E1.25725
N12473 G1 X159.264 Y175.374 E.0878
N12474 G1 X190.736 Y166.942 E1.0477
N12475 G1 X190.736 Y165.313 E.05236
N12476 M204 S10000
N12477 G1 X187.504 Y127.385 F60000
N12478 G1 F4421.739
N12479 M204 S8000
N12480 G1 X185.876 Y127.385 E.05236
N12481 G1 X166.341 Y200.29 E2.42708
N12482 G1 X163.883 Y200.29 E.07903
N12483 G1 X159.264 Y195.672 E.21004
N12484 G1 X159.264 Y195.243 E.01379
N12485 G1 X177.447 Y127.385 E2.25905
N12486 G1 X175.819 Y127.385 E.05236
N12487 ; WIPE_START
N12488 G1 X177.447 Y127.385 E-.61876
N12489 G1 X177.351 Y127.744 E-.14124
N12490 ; WIPE_END
N12491 G1 E-.04 F1800
N12492 M204 S10000
N12493 G17
N12494 G3 Z10.4 I1.217 J0 P1  F60000
N12495 ; stop printing object, unique label id: 229
N12496 M625
N12497 ; object ids of layer 50 start: 229
N12498 M624 AQAAAAAAAAA=
N12499 ;======== H2D 20250527========
N12500 ; SKIPPABLE_START
N12501 ; SKIPTYPE: timelapse
N12502 M622.1 S1 ; for prev firware, default turned on
N12503 
N12504 M1002 judge_flag timelapse_record_flag
N12505 
N12506 M622 J1
N12507 M993 A2 B2 C2
N12508 M993 A0 B0 C0
N12509 
N12510 
N12511 
N12512 
N12513     M9711 M0 E1 X260 Y141 Z10.4 S11 C10 O0 T3000
N12514 
N12515 
N12516 
N12517 M993 A3 B3 C3
N12518 
N12519 M623
N12520 ; SKIPPABLE_END
N12521 
N12522 ; object ids of this layer50 end: 229
N12523 M625
N12524 ; CHANGE_LAYER
N12525 ; Z_HEIGHT: 10.2
N12526 ; LAYER_HEIGHT: 0.2
N12527 ;======== H2D 20250521========
N12528 ; layer num/total_layer_count: 51/63
N12529 ; update layer progress
N12530 M73 L51
N12531 M991 S0 P50 ;notify layer change
N12532 
N12533 
N12534 ; OBJECT_ID: 229
N12535 ; COOLING_NODE: 0
N12536 ; start printing object, unique label id: 229
N12537 M624 AQAAAAAAAAA=
N12538 G1 X191.084 Y200.639 F60000
N12539 G1 Z10.2
N12540 G1 E.8 F1800
N12541 ; FEATURE: Inner wall
N12542 ; LINE_WIDTH: 0.45
N12543 ; LAYER_HEIGHT: 0.2
N12544 G1 F4421.739
N12545 M204 S8000
N12546 G1 X158.916 Y200.639 E1.03439
N12547 G1 X158.916 Y127.036 E2.36678
N12548 G1 X191.084 Y127.036 E1.03439
N12549 G1 X191.084 Y200.579 E2.36485
N12550 ; COOLING_NODE: 0
N12551 M204 S10000
N12552 M73 P77 R11
N12553 G1 X191.491 Y201.046 F60000
N12554 G1 F4421.739
N12555 M204 S8000
N12556 G1 X158.509 Y201.046 E1.06057
N12557 G1 X158.509 Y126.629 E2.39296
N12558 G1 X191.491 Y126.629 E1.06057
N12559 G1 X191.491 Y200.986 E2.39103
N12560 ; COOLING_NODE: 0
N12561 M204 S10000
N12562 G1 X191.898 Y201.453 F60000
N12563 G1 F4421.739
N12564 M204 S8000
N12565 G1 X158.102 Y201.453 E1.08675
N12566 G1 X158.102 Y126.222 E2.41914
N12567 G1 X191.898 Y126.222 E1.08675
N12568 G1 X191.898 Y201.393 E2.41721
N12569 ; COOLING_NODE: 0
N12570 M204 S10000
N12571 G1 X192.29 Y201.845 F60000
N12572 ; FEATURE: Outer wall
N12573 ; LINE_WIDTH: 0.42
N12574 G1 F4773.528
N12575 M204 S5000
N12576 G1 X157.71 Y201.845 E1.03002
N12577 G1 X157.71 Y125.83 E2.26421
N12578 G1 X192.29 Y125.83 E1.03002
N12579 G1 X192.29 Y201.785 E2.26243
N12580 G1 E-.8 F1800
N12581 M204 S10000
N12582 G1 X191.809 Y194.167 Z10.6 F60000
N12583 G1 X190.736 Y177.145 Z10.6
N12584 G1 Z10.2
N12585 G1 E.8 F1800
N12586 ; FEATURE: Sparse infill
N12587 ; LINE_WIDTH: 0.45
N12588 G1 F4421.739
N12589 M204 S8000
N12590 G1 X190.736 Y175.517 E.05236
N12591 G1 X159.264 Y183.958 E1.04776
N12592 G1 X175.597 Y200.29 E.74274
N12593 G1 X174.623 Y200.29 E.03131
N12594 G1 X190.736 Y140.158 E2.00184
N12595 G1 X190.736 Y138.53 E.05236
N12596 M204 S10000
N12597 G1 X190.736 Y143.43 F60000
N12598 G1 F4421.739
N12599 M204 S8000
N12600 G1 X190.736 Y141.802 E.05236
N12601 G1 X159.264 Y150.234 E1.0477
N12602 G1 X159.264 Y149.416 E.02632
N12603 G1 X190.736 Y180.887 E1.43118
N12604 G1 X190.736 Y183.946 E.09836
N12605 G1 X159.264 Y192.378 E1.0477
N12606 G1 X159.264 Y190.75 E.05236
N12607 M204 S10000
N12608 M73 P78 R11
N12609 G1 X159.565 Y200.29 F60000
N12610 G1 F4421.739
N12611 M204 S8000
N12612 G1 X161.193 Y200.29 E.05236
N12613 G1 X190.736 Y192.374 E.98349
N12614 G1 X190.736 Y192.401 E.00085
N12615 G1 X159.264 Y160.93 E1.43118
N12616 G1 X159.264 Y158.663 E.07289
N12617 G1 X190.736 Y150.23 E1.0477
N12618 G1 X190.736 Y146.345 E.12494
N12619 G1 X171.775 Y127.385 E.86225
N12620 G1 X168.872 Y127.385 E.09336
N12621 G1 X159.264 Y163.24 E1.19364
N12622 G1 X159.264 Y167.092 E.12387
N12623 G1 X190.736 Y158.659 E1.0477
N12624 G1 X190.736 Y157.859 E.02573
N12625 G1 X160.261 Y127.385 E1.38585
N12626 G1 X160.443 Y127.385 E.00585
N12627 G1 X159.264 Y131.783 E.14643
N12628 G1 X159.264 Y133.377 E.05125
N12629 G1 X181.627 Y127.385 E.74447
N12630 G1 X183.289 Y127.385 E.05344
N12631 G1 X190.736 Y134.831 E.33864
N12632 G1 X190.736 Y133.373 E.04689
N12633 G1 X159.264 Y141.806 E1.0477
N12634 G1 X159.264 Y137.902 E.12553
N12635 G1 X190.736 Y169.373 E1.43118
N12636 G1 X190.736 Y171.615 E.07209
N12637 G1 X183.052 Y200.29 E.95463
N12638 G1 X187.111 Y200.29 E.13052
N12639 G1 X159.264 Y172.444 E1.26635
N12640 G1 X159.264 Y175.521 E.09894
N12641 G1 X190.736 Y167.088 E1.0477
N12642 G1 X190.736 Y165.46 E.05236
N12643 M204 S10000
N12644 G1 X187.358 Y127.385 F60000
N12645 G1 F4421.739
N12646 M204 S8000
N12647 G1 X185.729 Y127.385 E.05236
N12648 G1 X166.194 Y200.29 E2.42708
N12649 G1 X164.083 Y200.29 E.06789
N12650 G1 X159.264 Y195.472 E.21913
N12651 G1 X159.264 Y194.696 E.02493
N12652 G1 X177.301 Y127.385 E2.24086
N12653 G1 X175.672 Y127.385 E.05236
N12654 ; WIPE_START
N12655 G1 X177.301 Y127.385 E-.61876
N12656 G1 X177.204 Y127.744 E-.14124
N12657 ; WIPE_END
N12658 G1 E-.04 F1800
N12659 M204 S10000
N12660 G17
N12661 G3 Z10.6 I1.217 J0 P1  F60000
N12662 ; stop printing object, unique label id: 229
N12663 M625
N12664 ; object ids of layer 51 start: 229
N12665 M624 AQAAAAAAAAA=
N12666 ;======== H2D 20250527========
N12667 ; SKIPPABLE_START
N12668 ; SKIPTYPE: timelapse
N12669 M622.1 S1 ; for prev firware, default turned on
N12670 
N12671 M1002 judge_flag timelapse_record_flag
N12672 
N12673 M622 J1
N12674 M993 A2 B2 C2
N12675 M993 A0 B0 C0
N12676 
N12677 
N12678 
N12679 
N12680     M9711 M0 E1 X260 Y141 Z10.6 S11 C10 O0 T3000
N12681 
N12682 
N12683 
N12684 M993 A3 B3 C3
N12685 
N12686 M623
N12687 ; SKIPPABLE_END
N12688 
N12689 ; object ids of this layer51 end: 229
N12690 M625
N12691 ; CHANGE_LAYER
N12692 ; Z_HEIGHT: 10.4
N12693 ; LAYER_HEIGHT: 0.2
N12694 ;======== H2D 20250521========
N12695 ; layer num/total_layer_count: 52/63
N12696 ; update layer progress
N12697 M73 L52
N12698 M991 S0 P51 ;notify layer change
N12699 
N12700 
N12701 ; OBJECT_ID: 229
N12702 ; COOLING_NODE: 0
N12703 ; start printing object, unique label id: 229
N12704 M624 AQAAAAAAAAA=
N12705 G1 X191.084 Y200.639 F60000
N12706 G1 Z10.4
N12707 G1 E.8 F1800
N12708 ; FEATURE: Inner wall
N12709 ; LINE_WIDTH: 0.45
N12710 ; LAYER_HEIGHT: 0.2
N12711 G1 F4421.739
N12712 M204 S8000
N12713 G1 X158.916 Y200.639 E1.03439
N12714 G1 X158.916 Y127.036 E2.36678
N12715 G1 X191.084 Y127.036 E1.03439
N12716 G1 X191.084 Y200.579 E2.36485
N12717 ; COOLING_NODE: 0
N12718 M204 S10000
N12719 G1 X191.491 Y201.046 F60000
N12720 G1 F4421.739
N12721 M204 S8000
N12722 G1 X158.509 Y201.046 E1.06057
N12723 G1 X158.509 Y126.629 E2.39296
N12724 G1 X191.491 Y126.629 E1.06057
N12725 G1 X191.491 Y200.986 E2.39103
N12726 ; COOLING_NODE: 0
N12727 M204 S10000
N12728 G1 X191.898 Y201.453 F60000
N12729 G1 F4421.739
N12730 M204 S8000
N12731 G1 X158.102 Y201.453 E1.08675
N12732 G1 X158.102 Y126.222 E2.41914
N12733 G1 X191.898 Y126.222 E1.08675
N12734 G1 X191.898 Y201.393 E2.41721
N12735 ; COOLING_NODE: 0
N12736 M204 S10000
N12737 G1 X192.29 Y201.845 F60000
N12738 ; FEATURE: Outer wall
N12739 ; LINE_WIDTH: 0.42
N12740 G1 F4773.528
N12741 M204 S5000
N12742 G1 X157.71 Y201.845 E1.03002
N12743 G1 X157.71 Y125.83 E2.26421
N12744 G1 X192.29 Y125.83 E1.03002
N12745 G1 X192.29 Y201.785 E2.26243
N12746 G1 E-.8 F1800
N12747 M204 S10000
N12748 G1 X191.807 Y194.168 Z10.8 F60000
N12749 G1 X190.736 Y177.292 Z10.8
N12750 G1 Z10.4
N12751 G1 E.8 F1800
N12752 ; FEATURE: Sparse infill
N12753 ; LINE_WIDTH: 0.45
N12754 G1 F4421.739
N12755 M204 S8000
N12756 G1 X190.736 Y175.663 E.05236
N12757 G1 X159.264 Y184.096 E1.0477
N12758 G1 X159.264 Y183.758 E.01088
N12759 G1 X175.797 Y200.29 E.75183
N12760 G1 X174.477 Y200.29 E.04245
N12761 G1 X190.736 Y139.612 E2.02003
N12762 G1 X190.736 Y137.983 E.05236
N12763 M204 S10000
N12764 G1 X187.211 Y127.385 F60000
N12765 G1 F4421.739
N12766 M204 S8000
N12767 G1 X185.583 Y127.385 E.05236
N12768 G1 X166.048 Y200.29 E2.42708
N12769 G1 X164.283 Y200.29 E.05675
N12770 G1 X159.264 Y195.272 E.22823
N12771 G1 X159.264 Y194.15 E.03607
N12772 G1 X177.154 Y127.385 E2.22267
N12773 G1 X175.526 Y127.385 E.05236
N12774 M204 S10000
N12775 G1 X190.736 Y152.005 F60000
N12776 G1 F4421.739
N12777 M204 S8000
N12778 G1 X190.736 Y150.377 E.05236
N12779 G1 X159.264 Y158.81 E1.04769
N12780 G1 X159.264 Y160.73 E.06175
N12781 G1 X190.736 Y192.201 E1.43118
N12782 G1 X190.736 Y192.521 E.01029
N12783 G1 X161.74 Y200.29 E.96529
N12784 G1 X160.111 Y200.29 E.05236
N12785 M204 S10000
N12786 G1 X159.264 Y190.896 F60000
N12787 G1 F4421.739
N12788 M204 S8000
N12789 G1 X159.264 Y192.525 E.05236
N12790 G1 X190.736 Y184.092 E1.0477
N12791 G1 X190.736 Y180.687 E.1095
N12792 G1 X159.264 Y149.216 E1.43118
N12793 G1 X159.264 Y150.381 E.03746
N12794 G1 X190.736 Y141.948 E1.0477
N12795 G1 X190.736 Y146.145 E.13496
N12796 G1 X171.975 Y127.385 E.85315
N12797 G1 X168.725 Y127.385 E.1045
N12798 G1 X159.264 Y162.693 E1.17545
N12799 G1 X159.264 Y167.238 E.14615
N12800 G1 X190.736 Y158.806 E1.0477
N12801 G1 X190.736 Y157.659 E.03687
N12802 G1 X160.461 Y127.385 E1.37676
N12803 G1 X160.297 Y127.385 E.00529
N12804 G1 X159.264 Y131.237 E.12823
N12805 G1 X159.264 Y133.523 E.07353
N12806 G1 X182.174 Y127.385 E.76266
N12807 G1 X183.489 Y127.385 E.0423
N12808 M73 P79 R11
N12809 G1 X190.736 Y134.631 E.32954
N12810 G1 X190.736 Y133.519 E.03575
N12811 G1 X159.264 Y141.952 E1.0477
N12812 G1 X159.264 Y137.702 E.13667
N12813 G1 X190.736 Y169.173 E1.43118
N12814 G1 X190.736 Y171.068 E.06095
N12815 G1 X182.906 Y200.29 E.97282
N12816 G1 X187.311 Y200.29 E.14166
N12817 G1 X159.264 Y172.244 E1.27544
N12818 G1 X159.264 Y175.667 E.11008
N12819 G1 X190.736 Y167.234 E1.0477
N12820 G1 X190.736 Y165.606 E.05236
N12821 ; WIPE_START
N12822 G1 X190.736 Y167.234 E-.61876
N12823 G1 X190.377 Y167.331 E-.14124
N12824 ; WIPE_END
N12825 G1 E-.04 F1800
N12826 M204 S10000
N12827 G17
N12828 G3 Z10.8 I1.217 J0 P1  F60000
N12829 ; stop printing object, unique label id: 229
N12830 M625
N12831 ; object ids of layer 52 start: 229
N12832 M624 AQAAAAAAAAA=
N12833 ;======== H2D 20250527========
N12834 ; SKIPPABLE_START
N12835 ; SKIPTYPE: timelapse
N12836 M622.1 S1 ; for prev firware, default turned on
N12837 
N12838 M1002 judge_flag timelapse_record_flag
N12839 
N12840 M622 J1
N12841 M993 A2 B2 C2
N12842 M993 A0 B0 C0
N12843 
N12844 
N12845 
N12846 
N12847     M9711 M0 E1 X260 Y141 Z10.8 S11 C10 O0 T3000
N12848 
N12849 
N12850 
N12851 M993 A3 B3 C3
N12852 
N12853 M623
N12854 ; SKIPPABLE_END
N12855 
N12856 ; object ids of this layer52 end: 229
N12857 M625
N12858 ; CHANGE_LAYER
N12859 ; Z_HEIGHT: 10.6
N12860 ; LAYER_HEIGHT: 0.200001
N12861 ;======== H2D 20250521========
N12862 ; layer num/total_layer_count: 53/63
N12863 ; update layer progress
N12864 M73 L53
N12865 M991 S0 P52 ;notify layer change
N12866 
N12867 
N12868 ; OBJECT_ID: 229
N12869 ; COOLING_NODE: 0
N12870 ; start printing object, unique label id: 229
N12871 M624 AQAAAAAAAAA=
N12872 G1 X191.084 Y200.639 F60000
N12873 G1 Z10.6
N12874 G1 E.8 F1800
N12875 ; FEATURE: Inner wall
N12876 ; LINE_WIDTH: 0.45
N12877 ; LAYER_HEIGHT: 0.2
N12878 G1 F4421.739
N12879 M204 S8000
N12880 G1 X158.916 Y200.639 E1.03439
N12881 G1 X158.916 Y127.036 E2.36678
N12882 G1 X191.084 Y127.036 E1.03439
N12883 G1 X191.084 Y200.579 E2.36485
N12884 ; COOLING_NODE: 0
N12885 M204 S10000
N12886 G1 X191.491 Y201.046 F60000
N12887 G1 F4421.739
N12888 M204 S8000
N12889 G1 X158.509 Y201.046 E1.06057
N12890 G1 X158.509 Y126.629 E2.39296
N12891 G1 X191.491 Y126.629 E1.06057
N12892 G1 X191.491 Y200.986 E2.39103
N12893 ; COOLING_NODE: 0
N12894 M204 S10000
N12895 G1 X191.898 Y201.453 F60000
N12896 G1 F4421.739
N12897 M204 S8000
N12898 G1 X158.102 Y201.453 E1.08675
N12899 G1 X158.102 Y126.222 E2.41914
N12900 G1 X191.898 Y126.222 E1.08675
N12901 G1 X191.898 Y201.393 E2.41721
N12902 ; COOLING_NODE: 0
N12903 M204 S10000
N12904 G1 X192.29 Y201.845 F60000
N12905 ; FEATURE: Outer wall
N12906 ; LINE_WIDTH: 0.42
N12907 G1 F4773.528
N12908 M204 S5000
N12909 G1 X157.71 Y201.845 E1.03002
N12910 G1 X157.71 Y125.83 E2.26421
N12911 G1 X192.29 Y125.83 E1.03002
N12912 G1 X192.29 Y201.785 E2.26243
N12913 G1 E-.8 F1800
N12914 M204 S10000
N12915 G1 X191.804 Y194.168 Z11 F60000
N12916 M73 P79 R10
N12917 G1 X190.736 Y177.438 Z11
N12918 G1 Z10.6
N12919 G1 E.8 F1800
N12920 ; FEATURE: Sparse infill
N12921 ; LINE_WIDTH: 0.45
N12922 G1 F4421.739
N12923 M204 S8000
N12924 G1 X190.736 Y175.81 E.05236
N12925 G1 X159.264 Y184.242 E1.0477
N12926 G1 X159.264 Y183.558 E.02201
N12927 G1 X175.997 Y200.29 E.76093
N12928 G1 X174.33 Y200.29 E.05359
N12929 G1 X190.736 Y139.065 E2.03822
N12930 G1 X190.736 Y137.437 E.05236
N12931 M204 S10000
N12932 G1 X187.065 Y127.385 F60000
N12933 G1 F4421.739
N12934 M204 S8000
N12935 G1 X185.437 Y127.385 E.05236
N12936 G1 X165.902 Y200.29 E2.42708
N12937 G1 X164.483 Y200.29 E.04561
N12938 G1 X159.264 Y195.072 E.23732
N12939 G1 X159.264 Y193.604 E.04721
N12940 G1 X177.008 Y127.385 E2.20448
N12941 G1 X175.379 Y127.385 E.05236
N12942 M204 S10000
N12943 G1 X190.736 Y152.152 F60000
N12944 G1 F4421.739
N12945 M204 S8000
N12946 G1 X190.736 Y150.523 E.05236
N12947 G1 X159.264 Y158.956 E1.0477
N12948 G1 X159.264 Y160.53 E.05061
N12949 G1 X190.736 Y192.001 E1.43118
N12950 G1 X190.736 Y192.667 E.02143
N12951 G1 X162.286 Y200.29 E.9471
N12952 G1 X160.658 Y200.29 E.05236
N12953 M204 S10000
N12954 G1 X159.264 Y192.671 F60000
N12955 G1 F4421.739
N12956 M204 S8000
N12957 G1 X190.736 Y184.238 E1.0477
N12958 G1 X190.736 Y180.487 E.12063
N12959 G1 X159.264 Y149.016 E1.43118
N12960 G1 X159.264 Y150.527 E.0486
N12961 G1 X190.736 Y142.095 E1.0477
N12962 G1 X190.736 Y145.945 E.12382
N12963 G1 X172.175 Y127.385 E.84405
N12964 G1 X168.579 Y127.385 E.11564
N12965 G1 X159.264 Y162.147 E1.15726
N12966 G1 X159.264 Y167.385 E.16843
N12967 G1 X190.736 Y158.952 E1.0477
N12968 G1 X190.736 Y157.459 E.04801
N12969 G1 X160.661 Y127.385 E1.36766
N12970 G1 X160.15 Y127.385 E.01643
N12971 G1 X159.264 Y130.69 E.11004
N12972 G1 X159.264 Y133.67 E.0958
N12973 G1 X182.72 Y127.385 E.78085
N12974 G1 X183.689 Y127.385 E.03116
N12975 G1 X190.736 Y134.431 E.32045
N12976 G1 X190.736 Y133.666 E.02461
N12977 G1 X159.264 Y142.098 E1.04769
N12978 G1 X159.264 Y137.502 E.1478
N12979 G1 X190.736 Y168.973 E1.43118
N12980 G1 X190.736 Y170.522 E.04981
N12981 G1 X182.759 Y200.29 E.99101
N12982 G1 X187.511 Y200.29 E.1528
N12983 G1 X159.264 Y172.044 E1.28454
N12984 G1 X159.264 Y175.814 E.12122
N12985 G1 X190.736 Y167.381 E1.0477
N12986 G1 X190.736 Y165.753 E.05236
N12987 ; WIPE_START
N12988 G1 X190.736 Y167.381 E-.61876
N12989 G1 X190.377 Y167.477 E-.14124
N12990 ; WIPE_END
N12991 G1 E-.04 F1800
N12992 M204 S10000
N12993 G17
N12994 G3 Z11 I1.217 J0 P1  F60000
N12995 ; stop printing object, unique label id: 229
N12996 M625
N12997 ; object ids of layer 53 start: 229
N12998 M624 AQAAAAAAAAA=
N12999 ;======== H2D 20250527========
N13000 ; SKIPPABLE_START
N13001 ; SKIPTYPE: timelapse
N13002 M622.1 S1 ; for prev firware, default turned on
N13003 
N13004 M1002 judge_flag timelapse_record_flag
N13005 
N13006 M622 J1
N13007 M993 A2 B2 C2
N13008 M993 A0 B0 C0
N13009 
N13010 
N13011 
N13012 
N13013     M9711 M0 E1 X260 Y141 Z11 S11 C10 O0 T3000
N13014 
N13015 
N13016 
N13017 M993 A3 B3 C3
N13018 
N13019 M623
N13020 ; SKIPPABLE_END
N13021 
N13022 ; object ids of this layer53 end: 229
N13023 M625
N13024 ; CHANGE_LAYER
N13025 ; Z_HEIGHT: 10.8
N13026 ; LAYER_HEIGHT: 0.2
N13027 ;======== H2D 20250521========
N13028 ; layer num/total_layer_count: 54/63
N13029 ; update layer progress
N13030 M73 L54
N13031 M991 S0 P53 ;notify layer change
N13032 
N13033 
N13034 ; OBJECT_ID: 229
N13035 ; COOLING_NODE: 0
N13036 ; start printing object, unique label id: 229
N13037 M624 AQAAAAAAAAA=
N13038 G1 X191.084 Y200.639 F60000
N13039 G1 Z10.8
N13040 G1 E.8 F1800
N13041 ; FEATURE: Inner wall
N13042 ; LINE_WIDTH: 0.45
N13043 ; LAYER_HEIGHT: 0.2
N13044 G1 F4421.739
N13045 M204 S8000
N13046 G1 X158.916 Y200.639 E1.03439
N13047 G1 X158.916 Y127.036 E2.36678
N13048 G1 X191.084 Y127.036 E1.03439
N13049 G1 X191.084 Y200.579 E2.36485
N13050 ; COOLING_NODE: 0
N13051 M204 S10000
N13052 G1 X191.491 Y201.046 F60000
N13053 G1 F4421.739
N13054 M204 S8000
N13055 G1 X158.509 Y201.046 E1.06057
N13056 G1 X158.509 Y126.629 E2.39296
N13057 G1 X191.491 Y126.629 E1.06057
N13058 G1 X191.491 Y200.986 E2.39103
N13059 ; COOLING_NODE: 0
N13060 M204 S10000
N13061 G1 X191.898 Y201.453 F60000
N13062 M73 P80 R10
N13063 G1 F4421.739
N13064 M204 S8000
N13065 G1 X158.102 Y201.453 E1.08675
N13066 G1 X158.102 Y126.222 E2.41914
N13067 G1 X191.898 Y126.222 E1.08675
N13068 G1 X191.898 Y201.393 E2.41721
N13069 ; COOLING_NODE: 0
N13070 M204 S10000
N13071 G1 X192.29 Y201.845 F60000
N13072 ; FEATURE: Outer wall
N13073 ; LINE_WIDTH: 0.42
N13074 G1 F4773.528
N13075 M204 S5000
N13076 G1 X157.71 Y201.845 E1.03002
N13077 G1 X157.71 Y125.83 E2.26421
N13078 G1 X192.29 Y125.83 E1.03002
N13079 G1 X192.29 Y201.785 E2.26243
N13080 G1 E-.8 F1800
N13081 M204 S10000
N13082 G1 X191.859 Y194.165 Z11.2 F60000
N13083 G1 X190.736 Y174.328 Z11.2
N13084 G1 Z10.8
N13085 G1 E.8 F1800
N13086 ; FEATURE: Sparse infill
N13087 ; LINE_WIDTH: 0.45
N13088 G1 F4421.739
N13089 M204 S8000
N13090 G1 X190.736 Y175.956 E.05236
N13091 G1 X159.264 Y184.389 E1.0477
N13092 G1 X159.264 Y183.358 E.03315
N13093 G1 X176.197 Y200.29 E.77002
N13094 G1 X174.184 Y200.29 E.06473
N13095 G1 X190.736 Y138.519 E2.05641
N13096 G1 X190.736 Y136.891 E.05236
N13097 M204 S10000
N13098 G1 X190.736 Y152.298 F60000
N13099 G1 F4421.739
N13100 M204 S8000
N13101 G1 X190.736 Y150.67 E.05236
N13102 G1 X159.264 Y159.102 E1.0477
N13103 G1 X159.264 Y160.33 E.03947
N13104 G1 X190.736 Y191.801 E1.43118
N13105 G1 X190.736 Y192.814 E.03257
N13106 G1 X162.832 Y200.29 E.92891
N13107 G1 X159.264 Y200.29 E.11473
N13108 G1 X159.264 Y194.872 E.17424
N13109 G1 X164.683 Y200.29 E.24642
N13110 G1 X165.755 Y200.29 E.03447
N13111 G1 X185.29 Y127.385 E2.42708
N13112 G1 X186.918 Y127.385 E.05236
N13113 M204 S10000
N13114 G1 X178.49 Y127.385 F60000
N13115 G1 F4421.739
N13116 M204 S8000
N13117 G1 X176.861 Y127.385 E.05236
N13118 G1 X159.264 Y193.057 E2.18629
N13119 G1 X159.264 Y192.818 E.00771
N13120 G1 X190.736 Y184.385 E1.0477
N13121 G1 X190.736 Y180.287 E.13177
N13122 G1 X159.264 Y148.816 E1.43118
N13123 G1 X159.264 Y150.674 E.05974
N13124 G1 X190.736 Y142.241 E1.0477
N13125 G1 X190.736 Y145.745 E.11268
N13126 G1 X172.375 Y127.385 E.83496
N13127 G1 X168.433 Y127.385 E.12678
N13128 G1 X159.264 Y161.601 E1.13907
N13129 G1 X159.264 Y167.531 E.19071
N13130 G1 X190.736 Y159.099 E1.0477
N13131 G1 X190.736 Y157.259 E.05915
N13132 G1 X160.861 Y127.385 E1.35857
N13133 G1 X160.004 Y127.385 E.02757
N13134 G1 X159.264 Y130.144 E.09185
N13135 G1 X159.264 Y131.772 E.05236
N13136 M204 S10000
N13137 G1 X159.264 Y143.873 F60000
N13138 G1 F4421.739
N13139 M204 S8000
N13140 G1 X159.264 Y142.245 E.05236
N13141 G1 X190.736 Y133.812 E1.0477
N13142 G1 X190.736 Y134.231 E.01348
N13143 G1 X183.889 Y127.385 E.31135
N13144 G1 X183.266 Y127.385 E.02002
N13145 G1 X159.264 Y133.816 E.79904
N13146 G1 X159.264 Y137.302 E.1121
N13147 G1 X190.736 Y168.773 E1.43118
N13148 G1 X190.736 Y169.976 E.03867
N13149 G1 X182.613 Y200.29 E1.0092
N13150 G1 X187.711 Y200.29 E.16394
N13151 G1 X159.264 Y171.844 E1.29363
N13152 G1 X159.264 Y175.96 E.13236
N13153 G1 X190.736 Y167.527 E1.0477
N13154 G1 X190.736 Y165.899 E.05236
N13155 ; WIPE_START
N13156 G1 X190.736 Y167.527 E-.61876
N13157 G1 X190.377 Y167.623 E-.14124
N13158 ; WIPE_END
N13159 G1 E-.04 F1800
N13160 M204 S10000
N13161 G17
N13162 G3 Z11.2 I1.217 J0 P1  F60000
N13163 ; stop printing object, unique label id: 229
N13164 M625
N13165 ; object ids of layer 54 start: 229
N13166 M624 AQAAAAAAAAA=
N13167 ;======== H2D 20250527========
N13168 ; SKIPPABLE_START
N13169 ; SKIPTYPE: timelapse
N13170 M622.1 S1 ; for prev firware, default turned on
N13171 
N13172 M1002 judge_flag timelapse_record_flag
N13173 
N13174 M622 J1
N13175 M993 A2 B2 C2
N13176 M993 A0 B0 C0
N13177 
N13178 
N13179 
N13180 
N13181     M9711 M0 E1 X260 Y141 Z11.2 S11 C10 O0 T3000
N13182 
N13183 
N13184 
N13185 M993 A3 B3 C3
N13186 
N13187 M623
N13188 ; SKIPPABLE_END
N13189 
N13190 ; object ids of this layer54 end: 229
N13191 M625
N13192 ; CHANGE_LAYER
N13193 ; Z_HEIGHT: 11
N13194 ; LAYER_HEIGHT: 0.2
N13195 ;======== H2D 20250521========
N13196 ; layer num/total_layer_count: 55/63
N13197 ; update layer progress
N13198 M73 L55
N13199 M991 S0 P54 ;notify layer change
N13200 
N13201 
N13202 ; OBJECT_ID: 229
N13203 ; COOLING_NODE: 0
N13204 ; start printing object, unique label id: 229
N13205 M624 AQAAAAAAAAA=
N13206 G1 X191.084 Y200.639 F60000
N13207 G1 Z11
N13208 G1 E.8 F1800
N13209 ; FEATURE: Inner wall
N13210 ; LINE_WIDTH: 0.45
N13211 ; LAYER_HEIGHT: 0.2
N13212 G1 F4421.739
N13213 M204 S8000
N13214 G1 X158.916 Y200.639 E1.03439
N13215 G1 X158.916 Y127.036 E2.36678
N13216 G1 X191.084 Y127.036 E1.03439
N13217 G1 X191.084 Y200.579 E2.36485
N13218 ; COOLING_NODE: 0
N13219 M204 S10000
N13220 G1 X191.491 Y201.046 F60000
N13221 G1 F4421.739
N13222 M204 S8000
N13223 G1 X158.509 Y201.046 E1.06057
N13224 G1 X158.509 Y126.629 E2.39296
N13225 G1 X191.491 Y126.629 E1.06057
N13226 G1 X191.491 Y200.986 E2.39103
N13227 ; COOLING_NODE: 0
N13228 M204 S10000
N13229 G1 X191.898 Y201.453 F60000
N13230 G1 F4421.739
N13231 M204 S8000
N13232 G1 X158.102 Y201.453 E1.08675
N13233 G1 X158.102 Y126.222 E2.41914
N13234 G1 X191.898 Y126.222 E1.08675
N13235 G1 X191.898 Y201.393 E2.41721
N13236 ; COOLING_NODE: 0
N13237 M204 S10000
N13238 G1 X192.29 Y201.845 F60000
N13239 ; FEATURE: Outer wall
N13240 ; LINE_WIDTH: 0.42
N13241 G1 F4773.528
N13242 M204 S5000
N13243 G1 X157.71 Y201.845 E1.03002
N13244 G1 X157.71 Y125.83 E2.26421
N13245 G1 X192.29 Y125.83 E1.03002
N13246 G1 X192.29 Y201.785 E2.26243
N13247 G1 E-.8 F1800
N13248 M204 S10000
N13249 G1 X191.534 Y194.19 Z11.4 F60000
N13250 M73 P81 R10
N13251 G1 X190.736 Y186.16 Z11.4
N13252 G1 Z11
N13253 G1 E.8 F1800
N13254 ; FEATURE: Sparse infill
N13255 ; LINE_WIDTH: 0.45
N13256 G1 F4421.739
N13257 M204 S8000
N13258 G1 X190.736 Y184.531 E.05236
N13259 G1 X159.264 Y192.964 E1.0477
N13260 G1 X159.264 Y192.511 E.01457
N13261 G1 X176.715 Y127.385 E2.1681
N13262 G1 X172.575 Y127.385 E.13312
N13263 G1 X190.736 Y145.545 E.82586
N13264 G1 X190.736 Y142.387 E.10154
N13265 G1 X159.264 Y150.82 E1.0477
N13266 G1 X159.264 Y148.616 E.07088
N13267 G1 X190.736 Y180.087 E1.43118
N13268 G1 X190.736 Y176.103 E.12813
N13269 G1 X159.264 Y184.535 E1.0477
N13270 G1 X159.264 Y183.158 E.04429
N13271 G1 X176.397 Y200.29 E.77912
N13272 G1 X174.038 Y200.29 E.07587
N13273 G1 X190.736 Y137.972 E2.0746
N13274 G1 X190.736 Y136.344 E.05236
N13275 M204 S10000
N13276 G1 X186.772 Y127.385 F60000
N13277 G1 F4421.739
N13278 M204 S8000
N13279 G1 X185.144 Y127.385 E.05236
N13280 G1 X165.609 Y200.29 E2.42708
N13281 G1 X164.883 Y200.29 E.02333
N13282 G1 X159.264 Y194.672 E.25551
N13283 G1 X159.264 Y200.29 E.18067
N13284 G1 X163.379 Y200.29 E.1323
N13285 G1 X190.736 Y192.96 E.91072
N13286 G1 X190.736 Y191.601 E.04371
N13287 G1 X159.264 Y160.13 E1.43118
N13288 M204 S10000
N13289 G1 X159.264 Y157.62 F60000
N13290 G1 F4421.739
N13291 M204 S8000
N13292 G1 X159.264 Y159.249 E.05236
N13293 G1 X190.736 Y150.816 E1.0477
N13294 G1 X190.736 Y152.444 E.05236
N13295 M204 S10000
N13296 G1 X190.736 Y166.045 F60000
N13297 G1 F4421.739
N13298 M204 S8000
N13299 G1 X190.736 Y167.674 E.05236
N13300 G1 X159.264 Y176.106 E1.0477
N13301 G1 X159.264 Y177.735 E.05236
N13302 M204 S10000
N13303 G1 X159.264 Y162.682 F60000
N13304 G1 F4421.739
N13305 M204 S8000
N13306 M73 P81 R9
N13307 G1 X159.264 Y161.054 E.05236
N13308 G1 X168.286 Y127.385 E1.12088
N13309 G1 X166.658 Y127.385 E.05236
N13310 M204 S10000
N13311 G1 X159.264 Y131.226 F60000
N13312 G1 F4421.739
N13313 M204 S8000
N13314 G1 X159.264 Y129.597 E.05236
N13315 G1 X159.857 Y127.385 E.07366
N13316 G1 X161.061 Y127.385 E.03871
N13317 G1 X190.736 Y157.059 E1.34947
N13318 G1 X190.736 Y159.245 E.07029
N13319 G1 X159.264 Y167.678 E1.04769
N13320 G1 X159.264 Y171.644 E.12754
N13321 G1 X187.911 Y200.29 E1.30273
N13322 G1 X182.466 Y200.29 E.17508
N13323 G1 X190.736 Y169.429 E1.02739
N13324 G1 X190.736 Y168.573 E.02753
N13325 G1 X159.264 Y137.102 E1.43118
N13326 G1 X159.264 Y133.962 E.10096
N13327 G1 X183.813 Y127.385 E.81723
N13328 G1 X184.089 Y127.385 E.00888
N13329 G1 X190.736 Y134.031 E.30226
N13330 G1 X190.736 Y133.959 E.00234
N13331 G1 X159.264 Y142.391 E1.0477
N13332 G1 X159.264 Y144.02 E.05236
N13333 ; WIPE_START
N13334 G1 X159.264 Y142.391 E-.61876
N13335 G1 X159.623 Y142.295 E-.14124
N13336 ; WIPE_END
N13337 G1 E-.04 F1800
N13338 M204 S10000
N13339 G17
N13340 G3 Z11.4 I1.217 J0 P1  F60000
N13341 ; stop printing object, unique label id: 229
N13342 M625
N13343 ; object ids of layer 55 start: 229
N13344 M624 AQAAAAAAAAA=
N13345 ;======== H2D 20250527========
N13346 ; SKIPPABLE_START
N13347 ; SKIPTYPE: timelapse
N13348 M622.1 S1 ; for prev firware, default turned on
N13349 
N13350 M1002 judge_flag timelapse_record_flag
N13351 
N13352 M622 J1
N13353 M993 A2 B2 C2
N13354 M993 A0 B0 C0
N13355 
N13356 
N13357 
N13358 
N13359     M9711 M0 E1 X260 Y141 Z11.4 S11 C10 O0 T3000
N13360 
N13361 
N13362 
N13363 M993 A3 B3 C3
N13364 
N13365 M623
N13366 ; SKIPPABLE_END
N13367 
N13368 ; object ids of this layer55 end: 229
N13369 M625
N13370 ; CHANGE_LAYER
N13371 ; Z_HEIGHT: 11.2
N13372 ; LAYER_HEIGHT: 0.2
N13373 ;======== H2D 20250521========
N13374 ; layer num/total_layer_count: 56/63
N13375 ; update layer progress
N13376 M73 L56
N13377 M991 S0 P55 ;notify layer change
N13378 
N13379 
N13380 ; OBJECT_ID: 229
N13381 ; COOLING_NODE: 0
N13382 ; start printing object, unique label id: 229
N13383 M624 AQAAAAAAAAA=
N13384 G1 X191.084 Y200.639 F60000
N13385 G1 Z11.2
N13386 G1 E.8 F1800
N13387 ; FEATURE: Inner wall
N13388 ; LINE_WIDTH: 0.45
N13389 ; LAYER_HEIGHT: 0.2
N13390 G1 F4421.739
N13391 M204 S8000
N13392 G1 X158.916 Y200.639 E1.03439
N13393 G1 X158.916 Y127.036 E2.36678
N13394 G1 X191.084 Y127.036 E1.03439
N13395 G1 X191.084 Y200.579 E2.36485
N13396 ; COOLING_NODE: 0
N13397 M204 S10000
N13398 G1 X191.491 Y201.046 F60000
N13399 G1 F4421.739
N13400 M204 S8000
N13401 G1 X158.509 Y201.046 E1.06057
N13402 G1 X158.509 Y126.629 E2.39296
N13403 G1 X191.491 Y126.629 E1.06057
N13404 G1 X191.491 Y200.986 E2.39103
N13405 ; COOLING_NODE: 0
N13406 M204 S10000
N13407 G1 X191.898 Y201.453 F60000
N13408 G1 F4421.739
N13409 M204 S8000
N13410 G1 X158.102 Y201.453 E1.08675
N13411 G1 X158.102 Y126.222 E2.41914
N13412 G1 X191.898 Y126.222 E1.08675
N13413 G1 X191.898 Y201.393 E2.41721
N13414 ; COOLING_NODE: 0
N13415 M204 S10000
N13416 G1 X192.29 Y201.845 F60000
N13417 ; FEATURE: Outer wall
N13418 ; LINE_WIDTH: 0.42
N13419 G1 F4773.528
N13420 M204 S5000
N13421 G1 X157.71 Y201.845 E1.03002
N13422 G1 X157.71 Y125.83 E2.26421
N13423 G1 X192.29 Y125.83 E1.03002
N13424 G1 X192.29 Y201.785 E2.26243
N13425 G1 E-.8 F1800
N13426 M204 S10000
N13427 G1 X191.527 Y194.191 Z11.6 F60000
N13428 G1 X190.736 Y186.306 Z11.6
N13429 G1 Z11.2
N13430 G1 E.8 F1800
N13431 ; FEATURE: Sparse infill
N13432 ; LINE_WIDTH: 0.45
N13433 G1 F4421.739
N13434 M204 S8000
N13435 G1 X190.736 Y184.678 E.05236
N13436 G1 X159.264 Y193.11 E1.04769
N13437 G1 X159.264 Y191.964 E.03685
N13438 G1 X176.569 Y127.385 E2.1499
N13439 G1 X172.775 Y127.385 E.12198
N13440 G1 X190.736 Y145.345 E.81677
N13441 G1 X190.736 Y142.534 E.0904
N13442 G1 X159.264 Y150.966 E1.04769
N13443 G1 X159.264 Y148.416 E.08201
N13444 G1 X190.736 Y179.887 E1.43118
N13445 G1 X190.736 Y176.249 E.11699
N13446 G1 X159.264 Y184.682 E1.0477
N13447 G1 X159.264 Y182.958 E.05543
N13448 G1 X176.597 Y200.29 E.78821
N13449 G1 X173.891 Y200.29 E.08701
N13450 G1 X190.736 Y137.426 E2.0928
N13451 G1 X190.736 Y135.798 E.05236
N13452 M204 S10000
N13453 G1 X186.626 Y127.385 F60000
N13454 G1 F4421.739
N13455 M204 S8000
N13456 G1 X184.997 Y127.385 E.05236
N13457 G1 X165.462 Y200.29 E2.42708
N13458 G1 X167.091 Y200.29 E.05236
N13459 M204 S10000
N13460 G1 X165.083 Y200.29 F60000
N13461 G1 F4421.739
N13462 M204 S8000
N13463 M73 P82 R9
N13464 G1 X159.264 Y194.472 E.26461
N13465 G1 X159.264 Y200.29 E.18711
N13466 G1 X163.925 Y200.29 E.14988
N13467 G1 X190.736 Y193.107 E.89253
N13468 G1 X190.736 Y191.401 E.05484
N13469 G1 X159.264 Y159.93 E1.43118
N13470 M204 S10000
N13471 G1 X159.264 Y159.395 F60000
N13472 G1 F4421.739
N13473 M204 S8000
N13474 G1 X190.736 Y150.963 E1.0477
N13475 G1 X190.736 Y152.591 E.05236
N13476 M204 S10000
N13477 G1 X190.736 Y166.192 F60000
N13478 G1 F4421.739
N13479 M204 S8000
N13480 G1 X190.736 Y167.82 E.05236
N13481 G1 X159.264 Y176.253 E1.0477
N13482 G1 X159.264 Y177.881 E.05236
N13483 M204 S10000
N13484 G1 X159.264 Y162.136 F60000
N13485 G1 F4421.739
N13486 M204 S8000
N13487 G1 X159.264 Y160.508 E.05236
N13488 G1 X168.14 Y127.385 E1.10269
N13489 G1 X166.511 Y127.385 E.05236
N13490 M204 S10000
N13491 G1 X159.264 Y130.679 F60000
N13492 G1 F4421.739
N13493 M204 S8000
N13494 G1 X159.264 Y129.051 E.05236
N13495 G1 X159.711 Y127.385 E.05547
N13496 G1 X161.261 Y127.385 E.04985
N13497 G1 X190.736 Y156.859 E1.34038
N13498 G1 X190.736 Y159.391 E.08143
N13499 G1 X159.264 Y167.824 E1.0477
N13500 G1 X159.264 Y171.444 E.1164
N13501 G1 X188.111 Y200.29 E1.31182
N13502 G1 X182.32 Y200.29 E.18622
N13503 G1 X190.736 Y168.883 E1.04558
N13504 G1 X190.736 Y168.373 E.01639
N13505 G1 X159.264 Y136.902 E1.43118
N13506 G1 X159.264 Y134.109 E.08982
N13507 G1 X184.359 Y127.385 E.83542
N13508 G1 X184.289 Y127.385 E.00226
N13509 G1 X190.736 Y133.831 E.29316
N13510 G1 X190.736 Y134.105 E.0088
N13511 G1 X159.264 Y142.538 E1.0477
N13512 G1 X159.264 Y144.166 E.05236
N13513 ; WIPE_START
N13514 G1 X159.264 Y142.538 E-.61876
N13515 G1 X159.623 Y142.441 E-.14124
N13516 ; WIPE_END
N13517 G1 E-.04 F1800
N13518 M204 S10000
N13519 G17
N13520 G3 Z11.6 I1.217 J0 P1  F60000
N13521 ; stop printing object, unique label id: 229
N13522 M625
N13523 ; object ids of layer 56 start: 229
N13524 M624 AQAAAAAAAAA=
N13525 ;======== H2D 20250527========
N13526 ; SKIPPABLE_START
N13527 ; SKIPTYPE: timelapse
N13528 M622.1 S1 ; for prev firware, default turned on
N13529 
N13530 M1002 judge_flag timelapse_record_flag
N13531 
N13532 M622 J1
N13533 M993 A2 B2 C2
N13534 M993 A0 B0 C0
N13535 
N13536 
N13537 
N13538 
N13539     M9711 M0 E1 X260 Y141 Z11.6 S11 C10 O0 T3000
N13540 
N13541 
N13542 
N13543 M993 A3 B3 C3
N13544 
N13545 M623
N13546 ; SKIPPABLE_END
N13547 
N13548 ; object ids of this layer56 end: 229
N13549 M625
N13550 ; CHANGE_LAYER
N13551 ; Z_HEIGHT: 11.4
N13552 ; LAYER_HEIGHT: 0.2
N13553 ;======== H2D 20250521========
N13554 ; layer num/total_layer_count: 57/63
N13555 ; update layer progress
N13556 M73 L57
N13557 M991 S0 P56 ;notify layer change
N13558 
N13559 
N13560 ; OBJECT_ID: 229
N13561 ; COOLING_NODE: 0
N13562 ; start printing object, unique label id: 229
N13563 M624 AQAAAAAAAAA=
N13564 G1 X191.084 Y200.639 F60000
N13565 G1 Z11.4
N13566 G1 E.8 F1800
N13567 ; FEATURE: Inner wall
N13568 ; LINE_WIDTH: 0.45
N13569 ; LAYER_HEIGHT: 0.2
N13570 G1 F4421.739
N13571 M204 S8000
N13572 G1 X158.916 Y200.639 E1.03439
N13573 G1 X158.916 Y127.036 E2.36678
N13574 G1 X191.084 Y127.036 E1.03439
N13575 G1 X191.084 Y200.579 E2.36485
N13576 ; COOLING_NODE: 0
N13577 M204 S10000
N13578 G1 X191.491 Y201.046 F60000
N13579 G1 F4421.739
N13580 M204 S8000
N13581 G1 X158.509 Y201.046 E1.06057
N13582 G1 X158.509 Y126.629 E2.39296
N13583 G1 X191.491 Y126.629 E1.06057
N13584 G1 X191.491 Y200.986 E2.39103
N13585 ; COOLING_NODE: 0
N13586 M204 S10000
N13587 G1 X191.898 Y201.453 F60000
N13588 G1 F4421.739
N13589 M204 S8000
N13590 G1 X158.102 Y201.453 E1.08675
N13591 G1 X158.102 Y126.222 E2.41914
N13592 G1 X191.898 Y126.222 E1.08675
N13593 G1 X191.898 Y201.393 E2.41721
N13594 ; COOLING_NODE: 0
N13595 M204 S10000
N13596 G1 X192.29 Y201.845 F60000
N13597 ; FEATURE: Outer wall
N13598 ; LINE_WIDTH: 0.42
N13599 G1 F4773.528
N13600 M204 S5000
N13601 G1 X157.71 Y201.845 E1.03002
N13602 G1 X157.71 Y125.83 E2.26421
N13603 G1 X192.29 Y125.83 E1.03002
N13604 G1 X192.29 Y201.785 E2.26243
N13605 G1 E-.8 F1800
N13606 M204 S10000
N13607 G1 X191.52 Y194.191 Z11.8 F60000
N13608 G1 X190.736 Y186.452 Z11.8
N13609 G1 Z11.4
N13610 G1 E.8 F1800
N13611 ; FEATURE: Sparse infill
N13612 ; LINE_WIDTH: 0.45
N13613 G1 F4421.739
N13614 M204 S8000
N13615 G1 X190.736 Y184.824 E.05236
N13616 G1 X159.264 Y193.257 E1.0477
N13617 G1 X159.264 Y194.272 E.03264
N13618 G1 X165.283 Y200.29 E.2737
N13619 M204 S10000
N13620 G1 X165.316 Y200.29 F60000
N13621 G1 F4421.739
N13622 M204 S8000
N13623 G1 X184.851 Y127.385 E2.42708
N13624 G1 X184.906 Y127.385 E.00176
N13625 G1 X159.264 Y134.255 E.85361
N13626 G1 X159.264 Y136.702 E.07868
N13627 G1 X190.736 Y168.173 E1.43118
N13628 G1 X190.736 Y168.336 E.00525
N13629 G1 X182.174 Y200.29 E1.06377
N13630 G1 X188.311 Y200.29 E.19736
N13631 G1 X159.264 Y171.244 E1.32092
N13632 G1 X159.264 Y167.97 E.10526
N13633 G1 X190.736 Y159.538 E1.0477
N13634 G1 X190.736 Y156.659 E.09257
N13635 G1 X161.461 Y127.385 E1.33128
N13636 G1 X159.565 Y127.385 E.06099
N13637 G1 X159.264 Y128.505 E.03728
N13638 G1 X159.264 Y130.133 E.05236
N13639 M204 S10000
N13640 G1 X166.365 Y127.385 F60000
N13641 G1 F4421.739
N13642 M204 S8000
N13643 G1 X167.993 Y127.385 E.05236
N13644 G1 X159.264 Y159.961 E1.0845
N13645 G1 X159.264 Y159.73 E.00744
N13646 G1 X190.736 Y191.201 E1.43118
N13647 G1 X190.736 Y193.253 E.06598
N13648 G1 X164.472 Y200.29 E.87434
N13649 G1 X162.843 Y200.29 E.05236
N13650 M204 S10000
N13651 G1 X159.264 Y193.046 F60000
N13652 G1 F4421.739
N13653 M204 S8000
N13654 G1 X159.264 Y191.418 E.05236
N13655 G1 X176.422 Y127.385 E2.13171
N13656 G1 X172.975 Y127.385 E.11084
N13657 G1 X190.736 Y145.145 E.80767
N13658 G1 X190.736 Y142.68 E.07927
N13659 G1 X159.264 Y151.113 E1.0477
N13660 G1 X159.264 Y148.216 E.09315
N13661 G1 X190.736 Y179.687 E1.43118
N13662 G1 X190.736 Y176.395 E.10585
N13663 G1 X159.264 Y184.828 E1.0477
N13664 G1 X159.264 Y182.758 E.06657
N13665 G1 X176.797 Y200.29 E.79731
N13666 G1 X173.745 Y200.29 E.09815
N13667 G1 X190.736 Y136.88 E2.11099
N13668 G1 X190.736 Y135.251 E.05236
N13669 M204 S10000
N13670 G1 X184.489 Y127.385 F60000
N13671 G1 F4421.739
N13672 M204 S8000
N13673 G1 X190.736 Y133.631 E.28407
N13674 G1 X190.736 Y134.251 E.01994
N13675 G1 X159.264 Y142.684 E1.0477
N13676 G1 X159.264 Y141.056 E.05236
N13677 M204 S10000
N13678 G1 X159.264 Y159.542 F60000
N13679 G1 F4421.739
N13680 M204 S8000
N13681 G1 X190.736 Y151.109 E1.0477
N13682 G1 X190.736 Y149.481 E.05236
N13683 M204 S10000
N13684 G1 X190.736 Y166.338 F60000
N13685 G1 F4421.739
N13686 M204 S8000
N13687 G1 X190.736 Y167.967 E.05236
N13688 G1 X159.264 Y176.399 E1.0477
N13689 M73 P83 R9
N13690 G1 X159.264 Y178.027 E.05236
N13691 ; WIPE_START
N13692 G1 X159.264 Y176.399 E-.61876
N13693 G1 X159.623 Y176.303 E-.14124
N13694 ; WIPE_END
N13695 G1 E-.04 F1800
N13696 M204 S10000
N13697 G17
N13698 G3 Z11.8 I1.217 J0 P1  F60000
N13699 ; stop printing object, unique label id: 229
N13700 M625
N13701 ; object ids of layer 57 start: 229
N13702 M624 AQAAAAAAAAA=
N13703 ;======== H2D 20250527========
N13704 ; SKIPPABLE_START
N13705 ; SKIPTYPE: timelapse
N13706 M622.1 S1 ; for prev firware, default turned on
N13707 
N13708 M1002 judge_flag timelapse_record_flag
N13709 
N13710 M622 J1
N13711 M993 A2 B2 C2
N13712 M993 A0 B0 C0
N13713 
N13714 
N13715 
N13716 
N13717     M9711 M0 E1 X260 Y141 Z11.8 S11 C10 O0 T3000
N13718 
N13719 
N13720 
N13721 M993 A3 B3 C3
N13722 
N13723 M623
N13724 ; SKIPPABLE_END
N13725 
N13726 ; object ids of this layer57 end: 229
N13727 M625
N13728 ; CHANGE_LAYER
N13729 ; Z_HEIGHT: 11.6
N13730 ; LAYER_HEIGHT: 0.200001
N13731 ;======== H2D 20250521========
N13732 ; layer num/total_layer_count: 58/63
N13733 ; update layer progress
N13734 M73 L58
N13735 M991 S0 P57 ;notify layer change
N13736 
N13737 
N13738 M106 S40.8
N13739 ; OBJECT_ID: 229
N13740 ; COOLING_NODE: 0
N13741 ; start printing object, unique label id: 229
N13742 M624 AQAAAAAAAAA=
N13743 G1 X191.084 Y200.639 F60000
N13744 G1 Z11.6
N13745 G1 E.8 F1800
N13746 ; FEATURE: Inner wall
N13747 ; LINE_WIDTH: 0.45
N13748 ; LAYER_HEIGHT: 0.2
N13749 G1 F4421.739
N13750 M204 S8000
N13751 G1 X158.916 Y200.639 E1.03439
N13752 G1 X158.916 Y127.036 E2.36678
N13753 G1 X191.084 Y127.036 E1.03439
N13754 G1 X191.084 Y200.579 E2.36485
N13755 ; COOLING_NODE: 0
N13756 M204 S10000
N13757 G1 X191.491 Y201.046 F60000
N13758 G1 F4421.739
N13759 M204 S8000
N13760 G1 X158.509 Y201.046 E1.06057
N13761 G1 X158.509 Y126.629 E2.39296
N13762 G1 X191.491 Y126.629 E1.06057
N13763 G1 X191.491 Y200.986 E2.39103
N13764 ; COOLING_NODE: 0
N13765 M204 S10000
N13766 G1 X191.898 Y201.453 F60000
N13767 G1 F4421.739
N13768 M204 S8000
N13769 M73 P83 R8
N13770 G1 X158.102 Y201.453 E1.08675
N13771 G1 X158.102 Y126.222 E2.41914
N13772 G1 X191.898 Y126.222 E1.08675
N13773 G1 X191.898 Y201.393 E2.41721
N13774 ; COOLING_NODE: 0
N13775 M204 S10000
N13776 G1 X192.29 Y201.845 F60000
N13777 ; FEATURE: Outer wall
N13778 ; LINE_WIDTH: 0.42
N13779 G1 F4773.528
N13780 M204 S5000
N13781 G1 X157.71 Y201.845 E1.03002
N13782 G1 X157.71 Y125.83 E2.26421
N13783 G1 X192.29 Y125.83 E1.03002
N13784 G1 X192.29 Y201.785 E2.26243
N13785 G1 E-.8 F1800
N13786 M204 S10000
N13787 G1 X191.491 Y194.194 Z12 F60000
N13788 G1 X190.358 Y183.443 Z12
N13789 G1 Z11.6
N13790 G1 E.8 F1800
N13791 ; FEATURE: Sparse infill
N13792 ; LINE_WIDTH: 0.45
N13793 G1 F4421.739
N13794 M204 S8000
N13795 G1 X190.358 Y185.072 E.05236
N13796 G1 X159.642 Y193.302 E1.02258
N13797 G1 X159.642 Y194.449 E.03687
N13798 G1 X165.106 Y199.913 E.24849
N13799 G1 X165.271 Y199.913 E.0053
N13800 G1 X184.603 Y127.762 E2.40197
N13801 G1 X185.066 Y127.762 E.01488
N13802 G1 X190.358 Y133.054 E.24067
N13803 G1 X190.358 Y134.499 E.04646
N13804 G1 X159.642 Y142.729 E1.02258
N13805 G1 X159.642 Y141.101 E.05236
N13806 M204 S10000
N13807 G1 X159.642 Y159.383 F60000
N13808 G1 F4421.739
N13809 M204 S8000
N13810 G1 X159.642 Y158.007 E.04425
N13811 G1 X167.746 Y127.762 E1.00689
N13812 G1 X162.038 Y127.762 E.18353
N13813 G1 X190.358 Y156.082 E1.28788
N13814 G1 X190.358 Y159.785 E.11908
N13815 G1 X159.642 Y168.016 E1.02258
N13816 G1 X159.642 Y171.421 E.1095
N13817 G1 X188.134 Y199.913 E1.29571
N13818 G1 X182.128 Y199.913 E.19312
N13819 G1 X190.358 Y169.198 E1.02254
N13820 G1 X190.358 Y168.418 E.02508
N13821 M204 S10000
N13822 G1 X190.358 Y149.728 F60000
N13823 G1 F4421.739
N13824 M204 S8000
N13825 G1 X190.358 Y151.356 E.05236
N13826 G1 X159.642 Y159.587 E1.02258
N13827 G1 X159.642 Y159.907 E.01029
N13828 G1 X190.358 Y190.624 E1.39687
N13829 G1 X190.358 Y193.5 E.0925
N13830 G1 X166.426 Y199.913 E.79674
N13831 G1 X165.474 Y199.913 E.0306
N13832 M204 S10000
N13833 G1 X159.642 Y191.092 F60000
N13834 G1 F4421.739
N13835 M204 S8000
N13836 G1 X159.642 Y189.464 E.05236
N13837 G1 X176.175 Y127.762 E2.05411
N13838 G1 X173.552 Y127.762 E.08433
N13839 G1 X190.358 Y144.568 E.76428
N13840 G1 X190.358 Y142.928 E.05275
N13841 G1 X159.642 Y151.158 E1.02258
N13842 G1 X159.642 Y148.393 E.08891
N13843 G1 X190.358 Y179.11 E1.39687
N13844 G1 X190.358 Y176.643 E.07933
N13845 G1 X159.642 Y184.873 E1.02258
N13846 G1 X159.642 Y182.935 E.06233
N13847 G1 X176.62 Y199.913 E.7721
N13848 G1 X173.699 Y199.913 E.09391
N13849 G1 X190.358 Y137.741 E2.06976
N13850 G1 X190.358 Y136.113 E.05236
N13851 M204 S10000
N13852 G1 X190.562 Y127.399 F60000
N13853 ; FEATURE: Floating vertical shell
N13854 ; LINE_WIDTH: 0.383001
N13855 G1 F5292.864
N13856 M204 S8000
N13857 G1 X159.438 Y127.399 E.83611
N13858 G1 X159.306 Y127.426 E.00362
N13859 G1 X159.279 Y127.558 E.00362
N13860 G1 X159.279 Y200.117 E1.9492
N13861 G1 X159.306 Y200.249 E.00362
N13862 G1 X159.438 Y200.276 E.00362
N13863 G1 X190.562 Y200.276 E.83611
N13864 G1 X190.694 Y200.249 E.00362
N13865 G1 X190.721 Y200.117 E.00362
N13866 G1 X190.721 Y127.558 E1.9492
N13867 G1 X190.694 Y127.426 E.00362
N13868 G1 X190.621 Y127.411 E.00201
N13869 M204 S10000
N13870 G1 X184.4 Y127.762 F60000
N13871 ; FEATURE: Sparse infill
N13872 ; LINE_WIDTH: 0.45
N13873 G1 F4421.739
N13874 M204 S8000
N13875 G1 X184.044 Y127.762 E.01143
N13876 G1 X159.642 Y134.301 E.81239
N13877 G1 X159.642 Y136.879 E.08292
N13878 G1 X190.358 Y167.596 E1.39687
N13879 G1 X190.358 Y168.214 E.01988
N13880 G1 X159.642 Y176.445 E1.02258
N13881 G1 X159.642 Y178.073 E.05236
N13882 ; WIPE_START
N13883 G1 X159.642 Y176.445 E-.61876
N13884 G1 X160.001 Y176.348 E-.14124
N13885 ; WIPE_END
N13886 G1 E-.04 F1800
N13887 M204 S10000
N13888 G17
N13889 G3 Z12 I1.217 J0 P1  F60000
N13890 ; stop printing object, unique label id: 229
N13891 M625
N13892 ; object ids of layer 58 start: 229
N13893 M624 AQAAAAAAAAA=
N13894 ;======== H2D 20250527========
N13895 ; SKIPPABLE_START
N13896 ; SKIPTYPE: timelapse
N13897 M622.1 S1 ; for prev firware, default turned on
N13898 
N13899 M1002 judge_flag timelapse_record_flag
N13900 
N13901 M622 J1
N13902 M993 A2 B2 C2
N13903 M993 A0 B0 C0
N13904 
N13905 
N13906 
N13907 
N13908     M9711 M0 E1 X260 Y141 Z12 S11 C10 O0 T3000
N13909 
N13910 
N13911 
N13912 M993 A3 B3 C3
N13913 
N13914 M623
N13915 ; SKIPPABLE_END
N13916 
N13917 ; object ids of this layer58 end: 229
N13918 M625
N13919 ; CHANGE_LAYER
N13920 ; Z_HEIGHT: 11.8
N13921 ; LAYER_HEIGHT: 0.2
N13922 ;======== H2D 20250521========
N13923 ; layer num/total_layer_count: 59/63
N13924 ; update layer progress
N13925 M73 L59
N13926 M991 S0 P58 ;notify layer change
N13927 
N13928 
N13929 M106 S25.5
N13930 ; OBJECT_ID: 229
N13931 ; COOLING_NODE: 0
N13932 ; start printing object, unique label id: 229
N13933 M624 AQAAAAAAAAA=
N13934 G1 X191.084 Y200.639 F60000
N13935 G1 Z11.8
N13936 G1 E.8 F1800
N13937 ; FEATURE: Inner wall
N13938 ; LINE_WIDTH: 0.45
N13939 ; LAYER_HEIGHT: 0.2
N13940 G1 F4421.739
N13941 M204 S8000
N13942 G1 X158.916 Y200.639 E1.03439
N13943 G1 X158.916 Y127.036 E2.36678
N13944 G1 X191.084 Y127.036 E1.03439
N13945 G1 X191.084 Y200.579 E2.36485
N13946 ; COOLING_NODE: 0
N13947 M204 S10000
N13948 G1 X191.491 Y201.046 F60000
N13949 G1 F4421.739
N13950 M204 S8000
N13951 G1 X158.509 Y201.046 E1.06057
N13952 G1 X158.509 Y126.629 E2.39296
N13953 G1 X191.491 Y126.629 E1.06057
N13954 G1 X191.491 Y200.986 E2.39103
N13955 ; COOLING_NODE: 0
N13956 M204 S10000
N13957 G1 X191.898 Y201.453 F60000
N13958 M73 P84 R8
N13959 G1 F4421.739
N13960 M204 S8000
N13961 G1 X158.102 Y201.453 E1.08675
N13962 G1 X158.102 Y126.222 E2.41914
N13963 G1 X191.898 Y126.222 E1.08675
N13964 G1 X191.898 Y201.393 E2.41721
N13965 ; COOLING_NODE: 0
N13966 M204 S10000
N13967 G1 X192.29 Y201.845 F60000
N13968 ; FEATURE: Outer wall
N13969 ; LINE_WIDTH: 0.42
N13970 G1 F4773.528
N13971 M204 S5000
N13972 G1 X157.71 Y201.845 E1.03002
N13973 G1 X157.71 Y125.83 E2.26421
N13974 G1 X192.29 Y125.83 E1.03002
N13975 G1 X192.29 Y201.785 E2.26243
N13976 G1 E-.8 F1800
N13977 M204 S10000
N13978 G1 X190.005 Y200.471 Z12.2 F60000
N13979 G1 Z11.8
N13980 G1 E.8 F1800
N13981 ; FEATURE: Bridge
N13982 ; LINE_WIDTH: 0.40079
N13983 ; LAYER_HEIGHT: 0.4
N13984 M106 S229.5
N13985 G1 F2853.507
N13986 M204 S8000
N13987 G1 X190.714 Y199.762 E.04995
N13988 G1 X190.714 Y199.125 E.03177
N13989 G1 X189.57 Y200.269 E.08061
N13990 G1 X188.933 Y200.269 E.03177
N13991 G1 X190.714 Y198.487 E.12553
N13992 G1 X190.714 Y197.85 E.03177
N13993 G1 X188.295 Y200.269 E.17045
N13994 G1 X187.658 Y200.269 E.03177
N13995 G1 X190.714 Y197.212 E.21538
N13996 G1 X190.714 Y196.575 E.03177
N13997 G1 X187.02 Y200.269 E.2603
N13998 G1 X186.383 Y200.269 E.03177
N13999 G1 X190.714 Y195.937 E.30523
N14000 G1 X190.714 Y195.3 E.03177
N14001 G1 X185.745 Y200.269 E.35015
N14002 G1 X185.108 Y200.269 E.03177
N14003 G1 X190.714 Y194.662 E.39508
N14004 G1 X190.714 Y194.025 E.03177
N14005 G1 X184.47 Y200.269 E.44
N14006 G1 X183.833 Y200.269 E.03177
N14007 G1 X190.714 Y193.387 E.48493
N14008 G1 X190.714 Y192.75 E.03177
N14009 G1 X183.195 Y200.269 E.52985
N14010 G1 X182.558 Y200.269 E.03177
N14011 G1 X190.714 Y192.112 E.57478
N14012 G1 X190.714 Y191.475 E.03177
N14013 G1 X181.92 Y200.269 E.6197
N14014 G1 X181.283 Y200.269 E.03177
N14015 G1 X190.714 Y190.837 E.66463
N14016 G1 X190.714 Y190.2 E.03177
N14017 G1 X180.645 Y200.269 E.70955
N14018 G1 X180.008 Y200.269 E.03177
N14019 G1 X190.714 Y189.562 E.75448
N14020 G1 X190.714 Y188.925 E.03177
N14021 G1 X179.37 Y200.269 E.7994
N14022 G1 X178.732 Y200.269 E.03177
N14023 G1 X190.714 Y188.287 E.84433
N14024 G1 X190.714 Y187.65 E.03177
N14025 G1 X178.095 Y200.269 E.88925
N14026 G1 X177.457 Y200.269 E.03177
N14027 G1 X190.714 Y187.012 E.93418
N14028 G1 X190.714 Y186.375 E.03177
N14029 G1 X176.82 Y200.269 E.9791
N14030 G1 X176.182 Y200.269 E.03177
N14031 G1 X190.714 Y185.737 E1.02403
N14032 G1 X190.714 Y185.1 E.03177
N14033 G1 X175.545 Y200.269 E1.06895
N14034 G1 X174.907 Y200.269 E.03177
N14035 G1 X190.714 Y184.462 E1.11387
N14036 G1 X190.714 Y183.825 E.03177
N14037 G1 X174.27 Y200.269 E1.1588
N14038 G1 X173.632 Y200.269 E.03177
N14039 G1 X190.714 Y183.187 E1.20372
N14040 G1 X190.714 Y182.55 E.03177
N14041 G1 X172.995 Y200.269 E1.24865
N14042 G1 X172.357 Y200.269 E.03177
N14043 G1 X190.714 Y181.912 E1.29357
N14044 G1 X190.714 Y181.275 E.03177
N14045 G1 X171.72 Y200.269 E1.3385
N14046 G1 X171.082 Y200.269 E.03177
N14047 G1 X190.714 Y180.637 E1.38342
N14048 G1 X190.714 Y180 E.03177
N14049 G1 X170.445 Y200.269 E1.42835
N14050 G1 X169.807 Y200.269 E.03177
N14051 G1 X190.714 Y179.362 E1.47327
N14052 G1 X190.714 Y178.725 E.03177
N14053 G1 X169.17 Y200.269 E1.5182
N14054 G1 X168.532 Y200.269 E.03177
N14055 G1 X190.714 Y178.087 E1.56312
N14056 G1 X190.714 Y177.45 E.03177
N14057 G1 X167.895 Y200.269 E1.60805
N14058 G1 X167.257 Y200.269 E.03177
N14059 G1 X190.714 Y176.812 E1.65297
N14060 G1 X190.714 Y176.174 E.03177
N14061 G1 X166.62 Y200.269 E1.6979
N14062 G1 X165.982 Y200.269 E.03177
N14063 G1 X190.714 Y175.537 E1.74282
N14064 G1 X190.714 Y174.899 E.03177
N14065 G1 X165.345 Y200.269 E1.78775
N14066 G1 X164.707 Y200.269 E.03177
N14067 G1 X190.714 Y174.262 E1.83267
N14068 G1 X190.714 Y173.624 E.03177
N14069 G1 X164.07 Y200.269 E1.8776
N14070 G1 X163.432 Y200.269 E.03177
N14071 G1 X190.714 Y172.987 E1.92252
N14072 G1 X190.714 Y172.349 E.03177
N14073 G1 X162.795 Y200.269 E1.96744
N14074 G1 X162.157 Y200.269 E.03177
N14075 G1 X190.714 Y171.712 E2.01237
N14076 G1 X190.714 Y171.074 E.03177
N14077 G1 X161.52 Y200.269 E2.05729
N14078 G1 X160.882 Y200.269 E.03177
N14079 G1 X190.714 Y170.437 E2.10222
N14080 G1 X190.714 Y169.799 E.03177
N14081 G1 X160.245 Y200.269 E2.14714
N14082 G1 X159.607 Y200.269 E.03177
N14083 G1 X190.714 Y169.162 E2.19207
N14084 G1 X190.714 Y168.524 E.03177
N14085 G1 X159.286 Y199.952 E2.2147
N14086 G1 X159.286 Y199.315 E.03177
N14087 G1 X190.714 Y167.887 E2.2147
N14088 G1 X190.714 Y167.249 E.03177
N14089 M73 P85 R8
N14090 G1 X159.286 Y198.677 E2.2147
N14091 G1 X159.286 Y198.04 E.03177
N14092 M73 P85 R7
N14093 G1 X190.714 Y166.612 E2.2147
N14094 G1 X190.714 Y165.974 E.03177
N14095 G1 X159.286 Y197.402 E2.2147
N14096 G1 X159.286 Y196.765 E.03177
N14097 G1 X190.714 Y165.337 E2.2147
N14098 G1 X190.714 Y164.699 E.03177
N14099 G1 X159.286 Y196.127 E2.2147
N14100 G1 X159.286 Y195.49 E.03177
N14101 G1 X190.714 Y164.062 E2.2147
N14102 G1 X190.714 Y163.424 E.03177
N14103 G1 X159.286 Y194.852 E2.2147
N14104 G1 X159.286 Y194.215 E.03177
N14105 G1 X190.714 Y162.787 E2.2147
N14106 G1 X190.714 Y162.149 E.03177
N14107 G1 X159.286 Y193.577 E2.2147
N14108 G1 X159.286 Y192.94 E.03177
N14109 G1 X190.714 Y161.512 E2.2147
N14110 G1 X190.714 Y160.874 E.03177
N14111 G1 X159.286 Y192.302 E2.2147
N14112 G1 X159.286 Y191.665 E.03177
N14113 G1 X190.714 Y160.237 E2.2147
N14114 G1 X190.714 Y159.599 E.03177
N14115 G1 X159.286 Y191.027 E2.2147
N14116 G1 X159.286 Y190.39 E.03177
N14117 G1 X190.714 Y158.962 E2.2147
N14118 G1 X190.714 Y158.324 E.03177
N14119 G1 X159.286 Y189.752 E2.2147
N14120 G1 X159.286 Y189.115 E.03177
N14121 G1 X190.714 Y157.687 E2.2147
N14122 G1 X190.714 Y157.049 E.03177
N14123 G1 X159.286 Y188.477 E2.2147
N14124 G1 X159.286 Y187.84 E.03177
N14125 G1 X190.714 Y156.412 E2.2147
N14126 G1 X190.714 Y155.774 E.03177
N14127 G1 X159.286 Y187.202 E2.2147
N14128 G1 X159.286 Y186.565 E.03177
N14129 G1 X190.714 Y155.137 E2.2147
N14130 G1 X190.714 Y154.499 E.03177
N14131 G1 X159.286 Y185.927 E2.2147
N14132 G1 X159.286 Y185.29 E.03177
N14133 G1 X190.714 Y153.862 E2.2147
N14134 G1 X190.714 Y153.224 E.03177
N14135 G1 X159.286 Y184.652 E2.2147
N14136 G1 X159.286 Y184.015 E.03177
N14137 G1 X190.714 Y152.587 E2.2147
N14138 G1 X190.714 Y151.949 E.03177
N14139 G1 X159.286 Y183.377 E2.2147
N14140 G1 X159.286 Y182.74 E.03177
N14141 G1 X190.714 Y151.311 E2.2147
N14142 G1 X190.714 Y150.674 E.03177
N14143 G1 X159.286 Y182.102 E2.2147
N14144 G1 X159.286 Y181.465 E.03177
N14145 G1 X190.714 Y150.036 E2.2147
N14146 G1 X190.714 Y149.399 E.03177
N14147 G1 X159.286 Y180.827 E2.2147
N14148 G1 X159.286 Y180.19 E.03177
N14149 G1 X190.714 Y148.761 E2.2147
N14150 G1 X190.714 Y148.124 E.03177
N14151 G1 X159.286 Y179.552 E2.2147
N14152 G1 X159.286 Y178.915 E.03177
N14153 G1 X190.714 Y147.486 E2.2147
N14154 G1 X190.714 Y146.849 E.03177
N14155 G1 X159.286 Y178.277 E2.2147
N14156 G1 X159.286 Y177.639 E.03177
N14157 M73 P86 R7
N14158 G1 X190.714 Y146.211 E2.2147
N14159 G1 X190.714 Y145.574 E.03177
N14160 G1 X159.286 Y177.002 E2.2147
N14161 G1 X159.286 Y176.364 E.03177
N14162 G1 X190.714 Y144.936 E2.2147
N14163 G1 X190.714 Y144.299 E.03177
N14164 G1 X159.286 Y175.727 E2.2147
N14165 G1 X159.286 Y175.089 E.03177
N14166 G1 X190.714 Y143.661 E2.2147
N14167 G1 X190.714 Y143.024 E.03177
N14168 G1 X159.286 Y174.452 E2.2147
N14169 G1 X159.286 Y173.814 E.03177
N14170 G1 X190.714 Y142.386 E2.2147
N14171 G1 X190.714 Y141.749 E.03177
N14172 G1 X159.286 Y173.177 E2.2147
N14173 G1 X159.286 Y172.539 E.03177
N14174 G1 X190.714 Y141.111 E2.2147
N14175 G1 X190.714 Y140.474 E.03177
N14176 G1 X159.286 Y171.902 E2.2147
N14177 G1 X159.286 Y171.264 E.03177
N14178 G1 X190.714 Y139.836 E2.2147
N14179 G1 X190.714 Y139.199 E.03177
N14180 G1 X159.286 Y170.627 E2.2147
N14181 G1 X159.286 Y169.989 E.03177
N14182 G1 X190.714 Y138.561 E2.2147
N14183 G1 X190.714 Y137.924 E.03177
N14184 G1 X159.286 Y169.352 E2.2147
N14185 G1 X159.286 Y168.714 E.03177
N14186 G1 X190.714 Y137.286 E2.2147
N14187 G1 X190.714 Y136.649 E.03177
N14188 G1 X159.286 Y168.077 E2.2147
N14189 G1 X159.286 Y167.439 E.03177
N14190 G1 X190.714 Y136.011 E2.2147
N14191 G1 X190.714 Y135.374 E.03177
N14192 G1 X159.286 Y166.802 E2.2147
N14193 G1 X159.286 Y166.164 E.03177
N14194 G1 X190.714 Y134.736 E2.2147
N14195 G1 X190.714 Y134.099 E.03177
N14196 G1 X159.286 Y165.527 E2.2147
N14197 G1 X159.286 Y164.889 E.03177
N14198 G1 X190.714 Y133.461 E2.2147
N14199 G1 X190.714 Y132.824 E.03177
N14200 G1 X159.286 Y164.252 E2.2147
N14201 G1 X159.286 Y163.614 E.03177
N14202 G1 X190.714 Y132.186 E2.2147
N14203 G1 X190.714 Y131.549 E.03177
N14204 G1 X159.286 Y162.977 E2.2147
N14205 G1 X159.286 Y162.339 E.03177
N14206 G1 X190.714 Y130.911 E2.2147
N14207 G1 X190.714 Y130.274 E.03177
N14208 G1 X159.286 Y161.702 E2.2147
N14209 G1 X159.286 Y161.064 E.03177
N14210 G1 X190.714 Y129.636 E2.2147
N14211 G1 X190.714 Y128.999 E.03177
N14212 G1 X159.286 Y160.427 E2.2147
N14213 G1 X159.286 Y159.789 E.03177
N14214 G1 X190.714 Y128.361 E2.2147
N14215 G1 X190.714 Y127.723 E.03177
N14216 G1 X159.286 Y159.152 E2.2147
N14217 G1 X159.286 Y158.514 E.03177
N14218 G1 X190.394 Y127.406 E2.19214
N14219 G1 X189.756 Y127.406 E.03177
N14220 M73 P86 R6
N14221 G1 X159.286 Y157.877 E2.14721
N14222 G1 X159.286 Y157.239 E.03177
N14223 G1 X189.119 Y127.406 E2.10229
N14224 G1 X188.481 Y127.406 E.03177
N14225 G1 X159.286 Y156.602 E2.05736
N14226 G1 X159.286 Y155.964 E.03177
N14227 M73 P87 R6
N14228 G1 X187.844 Y127.406 E2.01244
N14229 G1 X187.206 Y127.406 E.03177
N14230 G1 X159.286 Y155.327 E1.96751
N14231 G1 X159.286 Y154.689 E.03177
N14232 G1 X186.569 Y127.406 E1.92259
N14233 G1 X185.931 Y127.406 E.03177
N14234 G1 X159.286 Y154.052 E1.87766
N14235 G1 X159.286 Y153.414 E.03177
N14236 G1 X185.294 Y127.406 E1.83274
N14237 G1 X184.656 Y127.406 E.03177
N14238 G1 X159.286 Y152.776 E1.78782
N14239 G1 X159.286 Y152.139 E.03177
N14240 G1 X184.019 Y127.406 E1.74289
N14241 G1 X183.381 Y127.406 E.03177
N14242 G1 X159.286 Y151.501 E1.69797
N14243 G1 X159.286 Y150.864 E.03177
N14244 G1 X182.744 Y127.406 E1.65304
N14245 G1 X182.106 Y127.406 E.03177
N14246 G1 X159.286 Y150.226 E1.60812
N14247 G1 X159.286 Y149.589 E.03177
N14248 G1 X181.469 Y127.406 E1.56319
N14249 G1 X180.831 Y127.406 E.03177
N14250 G1 X159.286 Y148.951 E1.51827
N14251 G1 X159.286 Y148.314 E.03177
N14252 G1 X180.194 Y127.406 E1.47334
N14253 G1 X179.556 Y127.406 E.03177
N14254 G1 X159.286 Y147.676 E1.42842
N14255 G1 X159.286 Y147.039 E.03177
N14256 G1 X178.919 Y127.406 E1.38349
N14257 G1 X178.281 Y127.406 E.03177
N14258 G1 X159.286 Y146.401 E1.33857
N14259 G1 X159.286 Y145.764 E.03177
N14260 G1 X177.644 Y127.406 E1.29364
N14261 G1 X177.006 Y127.406 E.03177
N14262 G1 X159.286 Y145.126 E1.24872
N14263 G1 X159.286 Y144.489 E.03177
N14264 G1 X176.369 Y127.406 E1.20379
N14265 G1 X175.731 Y127.406 E.03177
N14266 G1 X159.286 Y143.851 E1.15887
N14267 G1 X159.286 Y143.214 E.03177
N14268 G1 X175.094 Y127.406 E1.11394
N14269 G1 X174.456 Y127.406 E.03177
N14270 G1 X159.286 Y142.576 E1.06902
N14271 G1 X159.286 Y141.939 E.03177
N14272 G1 X173.819 Y127.406 E1.02409
N14273 G1 X173.181 Y127.406 E.03177
N14274 G1 X159.286 Y141.301 E.97917
N14275 G1 X159.286 Y140.664 E.03177
N14276 G1 X172.544 Y127.406 E.93425
N14277 G1 X171.906 Y127.406 E.03177
N14278 G1 X159.286 Y140.026 E.88932
N14279 G1 X159.286 Y139.389 E.03177
N14280 G1 X171.269 Y127.406 E.8444
N14281 G1 X170.631 Y127.406 E.03177
N14282 G1 X159.286 Y138.751 E.79947
N14283 G1 X159.286 Y138.114 E.03177
N14284 G1 X169.993 Y127.406 E.75455
N14285 G1 X169.356 Y127.406 E.03177
N14286 G1 X159.286 Y137.476 E.70962
N14287 G1 X159.286 Y136.839 E.03177
N14288 G1 X168.718 Y127.406 E.6647
N14289 G1 X168.081 Y127.406 E.03177
N14290 G1 X159.286 Y136.201 E.61977
N14291 G1 X159.286 Y135.564 E.03177
N14292 G1 X167.443 Y127.406 E.57485
N14293 G1 X166.806 Y127.406 E.03177
N14294 G1 X159.286 Y134.926 E.52992
N14295 G1 X159.286 Y134.289 E.03177
N14296 G1 X166.168 Y127.406 E.485
N14297 G1 X165.531 Y127.406 E.03177
N14298 G1 X159.286 Y133.651 E.44007
N14299 G1 X159.286 Y133.014 E.03177
N14300 G1 X164.893 Y127.406 E.39515
N14301 G1 X164.256 Y127.406 E.03177
N14302 G1 X159.286 Y132.376 E.35022
N14303 G1 X159.286 Y131.739 E.03177
N14304 G1 X163.618 Y127.406 E.3053
N14305 G1 X162.981 Y127.406 E.03177
N14306 G1 X159.286 Y131.101 E.26037
N14307 G1 X159.286 Y130.464 E.03177
N14308 G1 X162.343 Y127.406 E.21545
N14309 G1 X161.706 Y127.406 E.03177
N14310 G1 X159.286 Y129.826 E.17052
N14311 G1 X159.286 Y129.188 E.03177
N14312 G1 X161.068 Y127.406 E.1256
N14313 G1 X160.431 Y127.406 E.03177
N14314 G1 X159.286 Y128.551 E.08068
N14315 G1 X159.286 Y127.913 E.03177
N14316 G1 X159.996 Y127.204 E.05002
N14317 M106 S25.5
N14318 ; WIPE_START
N14319 G1 X159.286 Y127.913 E-.38146
N14320 G1 X159.286 Y128.551 E-.24226
N14321 G1 X159.54 Y128.297 E-.13628
N14322 ; WIPE_END
N14323 G1 E-.04 F1800
N14324 M204 S10000
N14325 G17
N14326 G3 Z12.2 I1.217 J0 P1  F60000
N14327 ; stop printing object, unique label id: 229
N14328 M625
N14329 ; object ids of layer 59 start: 229
N14330 M624 AQAAAAAAAAA=
N14331 ;======== H2D 20250527========
N14332 ; SKIPPABLE_START
N14333 ; SKIPTYPE: timelapse
N14334 M622.1 S1 ; for prev firware, default turned on
N14335 
N14336 M1002 judge_flag timelapse_record_flag
N14337 
N14338 M622 J1
N14339 M993 A2 B2 C2
N14340 M993 A0 B0 C0
N14341 
N14342 
N14343 
N14344 
N14345     M9711 M0 E1 X260 Y141 Z12.2 S11 C10 O0 T3000
N14346 
N14347 
N14348 
N14349 M993 A3 B3 C3
N14350 
N14351 M623
N14352 ; SKIPPABLE_END
N14353 
N14354 ; object ids of this layer59 end: 229
N14355 M625
N14356 ; CHANGE_LAYER
N14357 ; Z_HEIGHT: 12
N14358 ; LAYER_HEIGHT: 0.2
N14359 ;======== H2D 20250521========
N14360 ; layer num/total_layer_count: 60/63
N14361 ; update layer progress
N14362 M73 L60
N14363 M991 S0 P59 ;notify layer change
N14364 
N14365 
N14366 ; OBJECT_ID: 229
N14367 ; COOLING_NODE: 0
N14368 ; start printing object, unique label id: 229
N14369 M624 AQAAAAAAAAA=
N14370 G1 X191.084 Y200.639 F60000
N14371 G1 Z12
N14372 G1 E.8 F1800
N14373 ; FEATURE: Inner wall
N14374 ; LINE_WIDTH: 0.45
N14375 ; LAYER_HEIGHT: 0.2
N14376 G1 F4421.739
N14377 M204 S8000
N14378 G1 X158.916 Y200.639 E1.03439
N14379 G1 X158.916 Y127.036 E2.36678
N14380 G1 X191.084 Y127.036 E1.03439
N14381 G1 X191.084 Y200.579 E2.36485
N14382 ; COOLING_NODE: 0
N14383 M204 S10000
N14384 G1 X191.491 Y201.046 F60000
N14385 G1 F4421.739
N14386 M204 S8000
N14387 G1 X158.509 Y201.046 E1.06057
N14388 G1 X158.509 Y126.629 E2.39296
N14389 G1 X191.491 Y126.629 E1.06057
N14390 G1 X191.491 Y200.986 E2.39103
N14391 ; COOLING_NODE: 0
N14392 M204 S10000
N14393 G1 X191.898 Y201.453 F60000
N14394 G1 F4421.739
N14395 M204 S8000
N14396 G1 X158.102 Y201.453 E1.08675
N14397 G1 X158.102 Y126.222 E2.41914
N14398 G1 X191.898 Y126.222 E1.08675
N14399 G1 X191.898 Y201.393 E2.41721
N14400 ; COOLING_NODE: 0
N14401 M204 S10000
N14402 G1 X192.29 Y201.845 F60000
N14403 ; FEATURE: Outer wall
N14404 ; LINE_WIDTH: 0.42
N14405 G1 F4773.528
N14406 M204 S5000
N14407 G1 X157.71 Y201.845 E1.03002
N14408 G1 X157.71 Y125.83 E2.26421
N14409 G1 X192.29 Y125.83 E1.03002
N14410 G1 X192.29 Y201.785 E2.26243
N14411 G1 E-.8 F1800
N14412 M204 S10000
N14413 M73 P88 R6
N14414 G1 X190.157 Y200.475 Z12.4 F60000
N14415 G1 Z12
N14416 G1 E.8 F1800
N14417 ; FEATURE: Internal solid infill
N14418 ; LINE_WIDTH: 0.42048
N14419 G1 F4767.454
N14420 M204 S8000
N14421 G1 X190.751 Y199.881 E.02504
N14422 G1 X190.751 Y199.347 E.01592
N14423 G1 X189.793 Y200.305 E.0404
N14424 G1 X189.259 Y200.305 E.01592
N14425 G1 X190.751 Y198.813 E.06292
N14426 G1 X190.751 Y198.279 E.01592
N14427 G1 X188.725 Y200.305 E.08544
N14428 G1 X188.191 Y200.305 E.01592
N14429 G1 X190.751 Y197.746 E.10797
N14430 G1 X190.751 Y197.212 E.01592
N14431 G1 X187.657 Y200.305 E.13049
N14432 G1 X187.123 Y200.305 E.01592
N14433 G1 X190.751 Y196.678 E.15301
N14434 G1 X190.751 Y196.144 E.01592
N14435 G1 X186.589 Y200.305 E.17553
N14436 G1 X186.055 Y200.305 E.01592
N14437 G1 X190.751 Y195.61 E.19805
N14438 G1 X190.751 Y195.076 E.01592
N14439 G1 X185.521 Y200.305 E.22057
N14440 G1 X184.987 Y200.305 E.01592
N14441 G1 X190.751 Y194.542 E.24309
N14442 G1 X190.751 Y194.008 E.01592
N14443 G1 X184.453 Y200.305 E.26561
N14444 G1 X183.919 Y200.305 E.01592
N14445 G1 X190.751 Y193.474 E.28813
N14446 G1 X190.751 Y192.94 E.01592
N14447 G1 X183.385 Y200.305 E.31066
N14448 G1 X182.851 Y200.305 E.01592
N14449 G1 X190.751 Y192.406 E.33318
N14450 G1 X190.751 Y191.872 E.01592
N14451 G1 X182.317 Y200.305 E.3557
N14452 G1 X181.783 Y200.305 E.01592
N14453 G1 X190.751 Y191.338 E.37822
N14454 G1 X190.751 Y190.804 E.01593
N14455 G1 X181.249 Y200.305 E.40074
N14456 G1 X180.715 Y200.305 E.01592
N14457 G1 X190.751 Y190.27 E.42326
N14458 G1 X190.751 Y189.736 E.01592
N14459 G1 X180.182 Y200.305 E.44578
N14460 G1 X179.648 Y200.305 E.01592
N14461 G1 X190.751 Y189.202 E.4683
N14462 G1 X190.751 Y188.668 E.01592
N14463 G1 X179.114 Y200.305 E.49082
N14464 G1 X178.58 Y200.305 E.01592
N14465 G1 X190.751 Y188.134 E.51335
N14466 G1 X190.751 Y187.6 E.01592
N14467 G1 X178.046 Y200.305 E.53587
N14468 G1 X177.512 Y200.305 E.01592
N14469 G1 X190.751 Y187.067 E.55839
N14470 G1 X190.751 Y186.533 E.01592
N14471 G1 X176.978 Y200.305 E.58091
N14472 G1 X176.444 Y200.305 E.01593
N14473 G1 X190.751 Y185.999 E.60343
N14474 G1 X190.751 Y185.465 E.01592
N14475 G1 X175.91 Y200.305 E.62595
N14476 G1 X175.376 Y200.305 E.01592
N14477 G1 X190.751 Y184.931 E.64847
N14478 G1 X190.751 Y184.397 E.01592
N14479 G1 X174.842 Y200.305 E.67099
N14480 G1 X174.308 Y200.305 E.01592
N14481 G1 X190.751 Y183.863 E.69351
N14482 G1 X190.751 Y183.329 E.01592
N14483 G1 X173.774 Y200.305 E.71604
N14484 G1 X173.24 Y200.305 E.01593
N14485 G1 X190.751 Y182.795 E.73856
N14486 G1 X190.751 Y182.261 E.01592
N14487 G1 X172.706 Y200.305 E.76108
N14488 G1 X172.172 Y200.305 E.01592
N14489 G1 X190.751 Y181.727 E.7836
N14490 G1 X190.751 Y181.193 E.01592
N14491 G1 X171.638 Y200.305 E.80612
N14492 G1 X171.104 Y200.305 E.01592
N14493 G1 X190.751 Y180.659 E.82864
N14494 G1 X190.751 Y180.125 E.01592
N14495 G1 X170.57 Y200.305 E.85116
N14496 G1 X170.036 Y200.305 E.01592
N14497 G1 X190.751 Y179.591 E.87368
N14498 G1 X190.751 Y179.057 E.01592
N14499 G1 X169.503 Y200.305 E.8962
N14500 G1 X168.969 Y200.305 E.01592
N14501 G1 X190.751 Y178.523 E.91873
N14502 G1 X190.751 Y177.989 E.01592
N14503 G1 X168.435 Y200.305 E.94125
N14504 G1 X167.901 Y200.305 E.01592
N14505 G1 X190.751 Y177.455 E.96377
N14506 G1 X190.751 Y176.921 E.01592
N14507 G1 X167.367 Y200.305 E.98629
N14508 G1 X166.833 Y200.305 E.01592
N14509 G1 X190.751 Y176.388 E1.00881
N14510 G1 X190.751 Y175.854 E.01592
N14511 G1 X166.299 Y200.305 E1.03133
N14512 G1 X165.765 Y200.305 E.01592
N14513 G1 X190.751 Y175.32 E1.05385
N14514 G1 X190.751 Y174.786 E.01592
N14515 G1 X165.231 Y200.305 E1.07637
N14516 G1 X164.697 Y200.305 E.01592
N14517 G1 X190.751 Y174.252 E1.09889
N14518 G1 X190.751 Y173.718 E.01592
N14519 G1 X164.163 Y200.305 E1.12141
N14520 G1 X163.629 Y200.305 E.01592
N14521 G1 X190.751 Y173.184 E1.14394
N14522 G1 X190.751 Y172.65 E.01592
N14523 G1 X163.095 Y200.305 E1.16646
N14524 G1 X162.561 Y200.305 E.01592
N14525 G1 X190.751 Y172.116 E1.18898
N14526 G1 X190.751 Y171.582 E.01592
N14527 G1 X162.027 Y200.305 E1.2115
N14528 G1 X161.493 Y200.305 E.01592
N14529 G1 X190.751 Y171.048 E1.23402
N14530 G1 X190.751 Y170.514 E.01592
N14531 G1 X160.959 Y200.305 E1.25654
N14532 G1 X160.425 Y200.305 E.01592
N14533 G1 X190.751 Y169.98 E1.27906
N14534 G1 X190.751 Y169.446 E.01592
N14535 G1 X159.891 Y200.305 E1.30158
N14536 G1 X159.357 Y200.305 E.01592
N14537 G1 X190.751 Y168.912 E1.3241
N14538 G1 X190.751 Y168.378 E.01593
N14539 G1 X159.249 Y199.879 E1.32866
N14540 G1 X159.249 Y199.345 E.01592
N14541 G1 X190.751 Y167.844 E1.32866
N14542 G1 X190.751 Y167.31 E.01592
N14543 G1 X159.249 Y198.811 E1.32866
N14544 G1 X159.249 Y198.277 E.01593
N14545 G1 X190.751 Y166.776 E1.32866
N14546 G1 X190.751 Y166.242 E.01592
N14547 G1 X159.249 Y197.744 E1.32866
N14548 G1 X159.249 Y197.21 E.01592
N14549 G1 X190.751 Y165.709 E1.32866
N14550 G1 X190.751 Y165.175 E.01592
N14551 G1 X159.249 Y196.676 E1.32866
N14552 G1 X159.249 Y196.142 E.01592
N14553 G1 X190.751 Y164.641 E1.32866
N14554 G1 X190.751 Y164.107 E.01592
N14555 G1 X159.249 Y195.608 E1.32866
N14556 G1 X159.249 Y195.074 E.01592
N14557 G1 X190.751 Y163.573 E1.32866
N14558 G1 X190.751 Y163.039 E.01592
N14559 G1 X159.249 Y194.54 E1.32866
N14560 G1 X159.249 Y194.006 E.01592
N14561 M73 P88 R5
N14562 G1 X190.751 Y162.505 E1.32866
N14563 G1 X190.751 Y161.971 E.01592
N14564 G1 X159.249 Y193.472 E1.32866
N14565 G1 X159.249 Y192.938 E.01592
N14566 G1 X190.751 Y161.437 E1.32866
N14567 G1 X190.751 Y160.903 E.01592
N14568 G1 X159.249 Y192.404 E1.32866
N14569 G1 X159.249 Y191.87 E.01592
N14570 G1 X190.751 Y160.369 E1.32866
N14571 G1 X190.751 Y159.835 E.01592
N14572 G1 X159.249 Y191.336 E1.32866
N14573 G1 X159.249 Y190.802 E.01592
N14574 G1 X190.751 Y159.301 E1.32866
N14575 G1 X190.751 Y158.767 E.01592
N14576 G1 X159.249 Y190.268 E1.32866
N14577 G1 X159.249 Y189.734 E.01592
N14578 G1 X190.751 Y158.233 E1.32866
N14579 G1 X190.751 Y157.699 E.01592
N14580 G1 X159.249 Y189.2 E1.32866
N14581 G1 X159.249 Y188.666 E.01592
N14582 G1 X190.751 Y157.165 E1.32866
N14583 G1 X190.751 Y156.631 E.01592
N14584 G1 X159.249 Y188.132 E1.32866
N14585 G1 X159.249 Y187.598 E.01592
N14586 M73 P89 R5
N14587 G1 X190.751 Y156.097 E1.32866
N14588 G1 X190.751 Y155.563 E.01592
N14589 G1 X159.249 Y187.065 E1.32866
N14590 G1 X159.249 Y186.531 E.01593
N14591 G1 X190.751 Y155.03 E1.32866
N14592 G1 X190.751 Y154.496 E.01592
N14593 G1 X159.249 Y185.997 E1.32866
N14594 G1 X159.249 Y185.463 E.01592
N14595 G1 X190.751 Y153.962 E1.32866
N14596 G1 X190.751 Y153.428 E.01592
N14597 G1 X159.249 Y184.929 E1.32866
N14598 G1 X159.249 Y184.395 E.01592
N14599 G1 X190.751 Y152.894 E1.32866
N14600 G1 X190.751 Y152.36 E.01592
N14601 G1 X159.249 Y183.861 E1.32866
N14602 G1 X159.249 Y183.327 E.01592
N14603 G1 X190.751 Y151.826 E1.32866
N14604 G1 X190.751 Y151.292 E.01592
N14605 G1 X159.249 Y182.793 E1.32866
N14606 G1 X159.249 Y182.259 E.01592
N14607 G1 X190.751 Y150.758 E1.32866
N14608 G1 X190.751 Y150.224 E.01592
N14609 G1 X159.249 Y181.725 E1.32866
N14610 G1 X159.249 Y181.191 E.01592
N14611 G1 X190.751 Y149.69 E1.32866
N14612 G1 X190.751 Y149.156 E.01593
N14613 G1 X159.249 Y180.657 E1.32866
N14614 G1 X159.249 Y180.123 E.01592
N14615 G1 X190.751 Y148.622 E1.32866
N14616 G1 X190.751 Y148.088 E.01592
N14617 G1 X159.249 Y179.589 E1.32866
N14618 G1 X159.249 Y179.055 E.01592
N14619 G1 X190.751 Y147.554 E1.32866
N14620 G1 X190.751 Y147.02 E.01592
N14621 G1 X159.249 Y178.521 E1.32866
N14622 G1 X159.249 Y177.987 E.01592
N14623 G1 X190.751 Y146.486 E1.32866
N14624 G1 X190.751 Y145.952 E.01592
N14625 G1 X159.249 Y177.453 E1.32866
N14626 G1 X159.249 Y176.919 E.01592
N14627 G1 X190.751 Y145.418 E1.32866
N14628 G1 X190.751 Y144.884 E.01592
N14629 G1 X159.249 Y176.386 E1.32866
N14630 G1 X159.249 Y175.852 E.01592
N14631 G1 X190.751 Y144.351 E1.32866
N14632 G1 X190.751 Y143.817 E.01592
N14633 G1 X159.249 Y175.318 E1.32866
N14634 G1 X159.249 Y174.784 E.01592
N14635 G1 X190.751 Y143.283 E1.32866
N14636 G1 X190.751 Y142.749 E.01592
N14637 G1 X159.249 Y174.25 E1.32866
N14638 G1 X159.249 Y173.716 E.01592
N14639 G1 X190.751 Y142.215 E1.32866
N14640 G1 X190.751 Y141.681 E.01592
N14641 G1 X159.249 Y173.182 E1.32866
N14642 G1 X159.249 Y172.648 E.01592
N14643 G1 X190.751 Y141.147 E1.32866
N14644 G1 X190.751 Y140.613 E.01592
N14645 G1 X159.249 Y172.114 E1.32866
N14646 G1 X159.249 Y171.58 E.01592
N14647 G1 X190.751 Y140.079 E1.32866
N14648 G1 X190.751 Y139.545 E.01592
N14649 G1 X159.249 Y171.046 E1.32866
N14650 G1 X159.249 Y170.512 E.01592
N14651 G1 X190.751 Y139.011 E1.32866
N14652 G1 X190.751 Y138.477 E.01592
N14653 G1 X159.249 Y169.978 E1.32866
N14654 G1 X159.249 Y169.444 E.01592
N14655 G1 X190.751 Y137.943 E1.32866
N14656 G1 X190.751 Y137.409 E.01593
N14657 G1 X159.249 Y168.91 E1.32866
N14658 G1 X159.249 Y168.376 E.01592
N14659 G1 X190.751 Y136.875 E1.32866
N14660 G1 X190.751 Y136.341 E.01592
N14661 G1 X159.249 Y167.842 E1.32866
N14662 G1 X159.249 Y167.308 E.01592
N14663 G1 X190.751 Y135.807 E1.32866
N14664 G1 X190.751 Y135.273 E.01592
N14665 G1 X159.249 Y166.774 E1.32866
N14666 G1 X159.249 Y166.24 E.01592
N14667 G1 X190.751 Y134.739 E1.32866
N14668 G1 X190.751 Y134.205 E.01592
N14669 G1 X159.249 Y165.707 E1.32866
N14670 G1 X159.249 Y165.173 E.01592
N14671 G1 X190.751 Y133.672 E1.32866
N14672 G1 X190.751 Y133.138 E.01592
N14673 G1 X159.249 Y164.639 E1.32866
N14674 G1 X159.249 Y164.105 E.01593
N14675 G1 X190.751 Y132.604 E1.32866
N14676 G1 X190.751 Y132.07 E.01592
N14677 G1 X159.249 Y163.571 E1.32866
N14678 G1 X159.249 Y163.037 E.01592
N14679 G1 X190.751 Y131.536 E1.32866
N14680 G1 X190.751 Y131.002 E.01592
N14681 G1 X159.249 Y162.503 E1.32866
N14682 G1 X159.249 Y161.969 E.01592
N14683 G1 X190.751 Y130.468 E1.32866
N14684 G1 X190.751 Y129.934 E.01592
N14685 G1 X159.249 Y161.435 E1.32866
N14686 G1 X159.249 Y160.901 E.01592
N14687 G1 X190.751 Y129.4 E1.32866
N14688 G1 X190.751 Y128.866 E.01592
N14689 G1 X159.249 Y160.367 E1.32866
N14690 G1 X159.249 Y159.833 E.01592
N14691 G1 X190.751 Y128.332 E1.32866
N14692 G1 X190.751 Y127.798 E.01592
N14693 G1 X159.249 Y159.299 E1.32866
N14694 G1 X159.249 Y158.765 E.01592
N14695 G1 X190.645 Y127.37 E1.32421
N14696 G1 X190.111 Y127.37 E.01592
N14697 M73 P90 R5
N14698 G1 X159.249 Y158.231 E1.30169
N14699 G1 X159.249 Y157.697 E.01592
N14700 G1 X189.577 Y127.37 E1.27917
N14701 G1 X189.043 Y127.37 E.01592
N14702 G1 X159.249 Y157.163 E1.25664
N14703 G1 X159.249 Y156.629 E.01592
N14704 G1 X188.509 Y127.37 E1.23412
N14705 G1 X187.975 Y127.37 E.01592
N14706 G1 X159.249 Y156.095 E1.2116
N14707 G1 X159.249 Y155.561 E.01592
N14708 G1 X187.441 Y127.37 E1.18908
N14709 G1 X186.907 Y127.37 E.01592
N14710 G1 X159.249 Y155.028 E1.16656
N14711 G1 X159.249 Y154.494 E.01592
N14712 G1 X186.373 Y127.37 E1.14404
N14713 G1 X185.839 Y127.37 E.01592
N14714 G1 X159.249 Y153.96 E1.12152
N14715 G1 X159.249 Y153.426 E.01592
N14716 G1 X185.305 Y127.37 E1.099
N14717 G1 X184.772 Y127.37 E.01593
N14718 G1 X159.249 Y152.892 E1.07648
N14719 G1 X159.249 Y152.358 E.01592
N14720 G1 X184.238 Y127.37 E1.05395
N14721 G1 X183.704 Y127.37 E.01592
N14722 G1 X159.249 Y151.824 E1.03143
N14723 G1 X159.249 Y151.29 E.01592
N14724 G1 X183.17 Y127.37 E1.00891
N14725 G1 X182.636 Y127.37 E.01592
N14726 G1 X159.249 Y150.756 E.98639
N14727 G1 X159.249 Y150.222 E.01592
N14728 G1 X182.102 Y127.37 E.96387
N14729 G1 X181.568 Y127.37 E.01592
N14730 G1 X159.249 Y149.688 E.94135
N14731 G1 X159.249 Y149.154 E.01592
N14732 G1 X181.034 Y127.37 E.91883
N14733 G1 X180.5 Y127.37 E.01592
N14734 G1 X159.249 Y148.62 E.89631
N14735 G1 X159.249 Y148.086 E.01592
N14736 G1 X179.966 Y127.37 E.87379
N14737 G1 X179.432 Y127.37 E.01592
N14738 G1 X159.249 Y147.552 E.85126
N14739 G1 X159.249 Y147.018 E.01592
N14740 G1 X178.898 Y127.37 E.82874
N14741 G1 X178.364 Y127.37 E.01592
N14742 G1 X159.249 Y146.484 E.80622
N14743 G1 X159.249 Y145.95 E.01592
N14744 G1 X177.83 Y127.37 E.7837
N14745 G1 X177.296 Y127.37 E.01592
N14746 G1 X159.249 Y145.416 E.76118
N14747 G1 X159.249 Y144.882 E.01593
N14748 G1 X176.762 Y127.37 E.73866
N14749 G1 X176.228 Y127.37 E.01592
N14750 G1 X159.249 Y144.349 E.71614
N14751 G1 X159.249 Y143.815 E.01592
N14752 G1 X175.694 Y127.37 E.69362
N14753 G1 X175.16 Y127.37 E.01592
N14754 G1 X159.249 Y143.281 E.6711
N14755 G1 X159.249 Y142.747 E.01592
N14756 G1 X174.626 Y127.37 E.64857
N14757 G1 X174.093 Y127.37 E.01592
N14758 G1 X159.249 Y142.213 E.62605
N14759 G1 X159.249 Y141.679 E.01592
N14760 G1 X173.559 Y127.37 E.60353
N14761 G1 X173.025 Y127.37 E.01592
N14762 G1 X159.249 Y141.145 E.58101
N14763 G1 X159.249 Y140.611 E.01592
N14764 G1 X172.491 Y127.37 E.55849
N14765 G1 X171.957 Y127.37 E.01592
N14766 G1 X159.249 Y140.077 E.53597
N14767 G1 X159.249 Y139.543 E.01592
N14768 G1 X171.423 Y127.37 E.51345
N14769 G1 X170.889 Y127.37 E.01592
N14770 G1 X159.249 Y139.009 E.49093
N14771 G1 X159.249 Y138.475 E.01592
N14772 G1 X170.355 Y127.37 E.46841
N14773 G1 X169.821 Y127.37 E.01592
N14774 G1 X159.249 Y137.941 E.44588
N14775 G1 X159.249 Y137.407 E.01592
N14776 G1 X169.287 Y127.37 E.42336
N14777 G1 X168.753 Y127.37 E.01592
N14778 G1 X159.249 Y136.873 E.40084
N14779 G1 X159.249 Y136.339 E.01592
N14780 G1 X168.219 Y127.37 E.37832
N14781 G1 X167.685 Y127.37 E.01592
N14782 G1 X159.249 Y135.805 E.3558
N14783 G1 X159.249 Y135.271 E.01592
N14784 G1 X167.151 Y127.37 E.33328
N14785 G1 X166.617 Y127.37 E.01592
N14786 G1 X159.249 Y134.737 E.31076
N14787 G1 X159.249 Y134.203 E.01592
N14788 G1 X166.083 Y127.37 E.28824
N14789 G1 X165.549 Y127.37 E.01592
N14790 G1 X159.249 Y133.669 E.26572
N14791 G1 X159.249 Y133.136 E.01592
N14792 G1 X165.015 Y127.37 E.24319
N14793 G1 X164.481 Y127.37 E.01592
N14794 G1 X159.249 Y132.602 E.22067
N14795 G1 X159.249 Y132.068 E.01592
N14796 G1 X163.947 Y127.37 E.19815
N14797 G1 X163.413 Y127.37 E.01592
N14798 G1 X159.249 Y131.534 E.17563
N14799 G1 X159.249 Y131 E.01592
N14800 G1 X162.88 Y127.37 E.15311
N14801 G1 X162.346 Y127.37 E.01592
N14802 G1 X159.249 Y130.466 E.13059
N14803 G1 X159.249 Y129.932 E.01592
N14804 G1 X161.812 Y127.37 E.10807
N14805 G1 X161.278 Y127.37 E.01592
N14806 G1 X159.249 Y129.398 E.08555
N14807 G1 X159.249 Y128.864 E.01592
N14808 G1 X160.744 Y127.37 E.06303
N14809 G1 X160.21 Y127.37 E.01592
N14810 G1 X159.249 Y128.33 E.0405
N14811 G1 X159.249 Y127.796 E.01592
N14812 G1 X159.846 Y127.2 E.02514
N14813 ; WIPE_START
N14814 G1 X159.249 Y127.796 E-.32032
N14815 G1 X159.249 Y128.33 E-.2029
N14816 G1 X159.69 Y127.889 E-.23678
N14817 ; WIPE_END
N14818 G1 E-.04 F1800
N14819 M204 S10000
N14820 G17
N14821 G3 Z12.4 I1.217 J0 P1  F60000
N14822 ; stop printing object, unique label id: 229
N14823 M625
N14824 ; object ids of layer 60 start: 229
N14825 M624 AQAAAAAAAAA=
N14826 ;======== H2D 20250527========
N14827 ; SKIPPABLE_START
N14828 ; SKIPTYPE: timelapse
N14829 M622.1 S1 ; for prev firware, default turned on
N14830 
N14831 M1002 judge_flag timelapse_record_flag
N14832 
N14833 M622 J1
N14834 M993 A2 B2 C2
N14835 M993 A0 B0 C0
N14836 
N14837 
N14838 
N14839 
N14840     M9711 M0 E1 X260 Y141 Z12.4 S11 C10 O0 T3000
N14841 
N14842 
N14843 
N14844 M993 A3 B3 C3
N14845 
N14846 M623
N14847 ; SKIPPABLE_END
N14848 
N14849 ; object ids of this layer60 end: 229
N14850 M625
N14851 ; CHANGE_LAYER
N14852 ; Z_HEIGHT: 12.2
N14853 ; LAYER_HEIGHT: 0.2
N14854 ;======== H2D 20250521========
N14855 ; layer num/total_layer_count: 61/63
N14856 ; update layer progress
N14857 M73 L61
N14858 M991 S0 P60 ;notify layer change
N14859 
N14860 
N14861 ; OBJECT_ID: 229
N14862 ; COOLING_NODE: 0
N14863 ; start printing object, unique label id: 229
N14864 M624 AQAAAAAAAAA=
N14865 G1 X191.084 Y200.639 F60000
N14866 G1 Z12.2
N14867 G1 E.8 F1800
N14868 ; FEATURE: Inner wall
N14869 ; LINE_WIDTH: 0.45
N14870 ; LAYER_HEIGHT: 0.2
N14871 G1 F4421.739
N14872 M204 S8000
N14873 G1 X158.916 Y200.639 E1.03439
N14874 G1 X158.916 Y127.036 E2.36678
N14875 G1 X191.084 Y127.036 E1.03439
N14876 G1 X191.084 Y200.579 E2.36485
N14877 ; COOLING_NODE: 0
N14878 M204 S10000
N14879 G1 X191.491 Y201.046 F60000
N14880 G1 F4421.739
N14881 M204 S8000
N14882 G1 X158.509 Y201.046 E1.06057
N14883 M73 P90 R4
N14884 G1 X158.509 Y126.629 E2.39296
N14885 G1 X191.491 Y126.629 E1.06057
N14886 G1 X191.491 Y200.986 E2.39103
N14887 ; COOLING_NODE: 0
N14888 M204 S10000
N14889 G1 X191.898 Y201.453 F60000
N14890 G1 F4421.739
N14891 M204 S8000
N14892 G1 X158.102 Y201.453 E1.08675
N14893 G1 X158.102 Y126.222 E2.41914
N14894 G1 X191.898 Y126.222 E1.08675
N14895 G1 X191.898 Y201.393 E2.41721
N14896 ; COOLING_NODE: 0
N14897 M204 S10000
N14898 G1 X192.29 Y201.845 F60000
N14899 ; FEATURE: Outer wall
N14900 ; LINE_WIDTH: 0.42
N14901 G1 F4773.528
N14902 M204 S5000
N14903 G1 X157.71 Y201.845 E1.03002
N14904 G1 X157.71 Y125.83 E2.26421
N14905 G1 X192.29 Y125.83 E1.03002
N14906 G1 X192.29 Y201.785 E2.26243
N14907 G1 E-.8 F1800
N14908 M204 S10000
N14909 G1 X184.672 Y201.309 Z12.6 F60000
N14910 G1 X159.08 Y199.709 Z12.6
N14911 G1 Z12.2
N14912 G1 E.8 F1800
N14913 ; FEATURE: Internal solid infill
N14914 ; LINE_WIDTH: 0.42048
N14915 G1 F4767.454
N14916 M204 S8000
N14917 G1 X159.676 Y200.305 E.02514
N14918 G1 X160.21 Y200.305 E.01592
N14919 G1 X159.249 Y199.345 E.0405
N14920 G1 X159.249 Y198.811 E.01592
N14921 G1 X160.744 Y200.305 E.06303
N14922 G1 X161.278 Y200.305 E.01592
N14923 G1 X159.249 Y198.277 E.08555
N14924 G1 X159.249 Y197.743 E.01592
N14925 G1 X161.812 Y200.305 E.10807
N14926 G1 X162.346 Y200.305 E.01592
N14927 G1 X159.249 Y197.209 E.13059
N14928 G1 X159.249 Y196.675 E.01593
N14929 G1 X162.88 Y200.305 E.15311
N14930 G1 X163.413 Y200.305 E.01592
N14931 G1 X159.249 Y196.141 E.17563
N14932 G1 X159.249 Y195.607 E.01592
N14933 G1 X163.947 Y200.305 E.19815
N14934 G1 X164.481 Y200.305 E.01592
N14935 G1 X159.249 Y195.073 E.22067
N14936 G1 X159.249 Y194.539 E.01592
N14937 G1 X165.015 Y200.305 E.24319
N14938 G1 X165.549 Y200.305 E.01592
N14939 G1 X159.249 Y194.005 E.26572
N14940 G1 X159.249 Y193.472 E.01592
N14941 G1 X166.083 Y200.305 E.28824
N14942 G1 X166.617 Y200.305 E.01593
N14943 G1 X159.249 Y192.938 E.31076
N14944 G1 X159.249 Y192.404 E.01592
N14945 G1 X167.151 Y200.305 E.33328
N14946 G1 X167.685 Y200.305 E.01592
N14947 G1 X159.249 Y191.87 E.3558
N14948 G1 X159.249 Y191.336 E.01592
N14949 M73 P91 R4
N14950 G1 X168.219 Y200.305 E.37832
N14951 G1 X168.753 Y200.305 E.01592
N14952 G1 X159.249 Y190.802 E.40084
N14953 G1 X159.249 Y190.268 E.01592
N14954 G1 X169.287 Y200.305 E.42336
N14955 G1 X169.821 Y200.305 E.01592
N14956 G1 X159.249 Y189.734 E.44588
N14957 G1 X159.249 Y189.2 E.01592
N14958 G1 X170.355 Y200.305 E.46841
N14959 G1 X170.889 Y200.305 E.01592
N14960 G1 X159.249 Y188.666 E.49093
N14961 G1 X159.249 Y188.132 E.01592
N14962 G1 X171.423 Y200.305 E.51345
N14963 G1 X171.957 Y200.305 E.01592
N14964 G1 X159.249 Y187.598 E.53597
N14965 G1 X159.249 Y187.064 E.01592
N14966 G1 X172.491 Y200.305 E.55849
N14967 G1 X173.025 Y200.305 E.01592
N14968 G1 X159.249 Y186.53 E.58101
N14969 G1 X159.249 Y185.996 E.01592
N14970 G1 X173.559 Y200.305 E.60353
N14971 G1 X174.092 Y200.305 E.01592
N14972 G1 X159.249 Y185.462 E.62605
N14973 G1 X159.249 Y184.928 E.01592
N14974 G1 X174.626 Y200.305 E.64857
N14975 G1 X175.16 Y200.305 E.01592
N14976 G1 X159.249 Y184.394 E.6711
N14977 G1 X159.249 Y183.86 E.01592
N14978 G1 X175.694 Y200.305 E.69362
N14979 G1 X176.228 Y200.305 E.01592
N14980 G1 X159.249 Y183.326 E.71614
N14981 G1 X159.249 Y182.793 E.01592
N14982 G1 X176.762 Y200.305 E.73866
N14983 G1 X177.296 Y200.305 E.01592
N14984 G1 X159.249 Y182.259 E.76118
N14985 G1 X159.249 Y181.725 E.01592
N14986 G1 X177.83 Y200.305 E.7837
N14987 G1 X178.364 Y200.305 E.01592
N14988 G1 X159.249 Y181.191 E.80622
N14989 G1 X159.249 Y180.657 E.01592
N14990 G1 X178.898 Y200.305 E.82874
N14991 G1 X179.432 Y200.305 E.01592
N14992 G1 X159.249 Y180.123 E.85126
N14993 G1 X159.249 Y179.589 E.01592
N14994 G1 X179.966 Y200.305 E.87379
N14995 G1 X180.5 Y200.305 E.01592
N14996 G1 X159.249 Y179.055 E.89631
N14997 G1 X159.249 Y178.521 E.01592
N14998 G1 X181.034 Y200.305 E.91883
N14999 G1 X181.568 Y200.305 E.01592
N15000 G1 X159.249 Y177.987 E.94135
N15001 G1 X159.249 Y177.453 E.01592
N15002 G1 X182.102 Y200.305 E.96387
N15003 G1 X182.636 Y200.305 E.01592
N15004 G1 X159.249 Y176.919 E.98639
N15005 G1 X159.249 Y176.385 E.01592
N15006 G1 X183.17 Y200.305 E1.00891
N15007 G1 X183.704 Y200.305 E.01592
N15008 G1 X159.249 Y175.851 E1.03143
N15009 G1 X159.249 Y175.317 E.01592
N15010 G1 X184.238 Y200.305 E1.05395
N15011 G1 X184.772 Y200.305 E.01592
N15012 G1 X159.249 Y174.783 E1.07648
N15013 G1 X159.249 Y174.249 E.01593
N15014 G1 X185.305 Y200.305 E1.099
N15015 G1 X185.839 Y200.305 E.01592
N15016 G1 X159.249 Y173.715 E1.12152
N15017 G1 X159.249 Y173.181 E.01592
N15018 G1 X186.373 Y200.305 E1.14404
N15019 G1 X186.907 Y200.305 E.01592
N15020 G1 X159.249 Y172.647 E1.16656
N15021 G1 X159.249 Y172.113 E.01592
N15022 G1 X187.441 Y200.305 E1.18908
N15023 G1 X187.975 Y200.305 E.01592
N15024 G1 X159.249 Y171.58 E1.2116
N15025 G1 X159.249 Y171.046 E.01592
N15026 G1 X188.509 Y200.305 E1.23412
N15027 G1 X189.043 Y200.305 E.01593
N15028 G1 X159.249 Y170.512 E1.25664
N15029 G1 X159.249 Y169.978 E.01592
N15030 G1 X189.577 Y200.305 E1.27917
N15031 G1 X190.111 Y200.305 E.01592
N15032 G1 X159.249 Y169.444 E1.30169
N15033 G1 X159.249 Y168.91 E.01592
N15034 G1 X190.645 Y200.305 E1.32421
N15035 G1 X190.751 Y200.305 E.00315
N15036 G1 X190.751 Y199.877 E.01278
N15037 G1 X159.249 Y168.376 E1.32866
N15038 G1 X159.249 Y167.842 E.01592
N15039 G1 X190.751 Y199.343 E1.32866
N15040 G1 X190.751 Y198.809 E.01592
N15041 G1 X159.249 Y167.308 E1.32866
N15042 G1 X159.249 Y166.774 E.01592
N15043 G1 X190.751 Y198.275 E1.32866
N15044 G1 X190.751 Y197.741 E.01592
N15045 G1 X159.249 Y166.24 E1.32866
N15046 G1 X159.249 Y165.706 E.01592
N15047 G1 X190.751 Y197.207 E1.32866
N15048 G1 X190.751 Y196.673 E.01592
N15049 G1 X159.249 Y165.172 E1.32866
N15050 G1 X159.249 Y164.638 E.01592
N15051 G1 X190.751 Y196.139 E1.32866
N15052 G1 X190.751 Y195.605 E.01592
N15053 G1 X159.249 Y164.104 E1.32866
N15054 G1 X159.249 Y163.57 E.01592
N15055 G1 X190.751 Y195.071 E1.32866
N15056 G1 X190.751 Y194.537 E.01592
N15057 G1 X159.249 Y163.036 E1.32866
N15058 G1 X159.249 Y162.502 E.01592
N15059 G1 X190.751 Y194.003 E1.32866
N15060 G1 X190.751 Y193.47 E.01592
N15061 G1 X159.249 Y161.968 E1.32866
N15062 G1 X159.249 Y161.434 E.01592
N15063 G1 X190.751 Y192.936 E1.32866
N15064 G1 X190.751 Y192.402 E.01592
N15065 G1 X159.249 Y160.901 E1.32866
N15066 G1 X159.249 Y160.367 E.01592
N15067 G1 X190.751 Y191.868 E1.32866
N15068 G1 X190.751 Y191.334 E.01592
N15069 G1 X159.249 Y159.833 E1.32866
N15070 G1 X159.249 Y159.299 E.01592
N15071 G1 X190.751 Y190.8 E1.32866
N15072 G1 X190.751 Y190.266 E.01592
N15073 G1 X159.249 Y158.765 E1.32866
N15074 G1 X159.249 Y158.231 E.01592
N15075 G1 X190.751 Y189.732 E1.32866
N15076 G1 X190.751 Y189.198 E.01592
N15077 G1 X159.249 Y157.697 E1.32866
N15078 G1 X159.249 Y157.163 E.01592
N15079 G1 X190.751 Y188.664 E1.32866
N15080 G1 X190.751 Y188.13 E.01592
N15081 G1 X159.249 Y156.629 E1.32866
N15082 G1 X159.249 Y156.095 E.01592
N15083 G1 X190.751 Y187.596 E1.32866
N15084 G1 X190.751 Y187.062 E.01592
N15085 G1 X159.249 Y155.561 E1.32866
N15086 G1 X159.249 Y155.027 E.01592
N15087 G1 X190.751 Y186.528 E1.32866
N15088 G1 X190.751 Y185.994 E.01592
N15089 G1 X159.249 Y154.493 E1.32866
N15090 G1 X159.249 Y153.959 E.01592
N15091 G1 X190.751 Y185.46 E1.32866
N15092 G1 X190.751 Y184.926 E.01592
N15093 M73 P92 R4
N15094 G1 X159.249 Y153.425 E1.32866
N15095 G1 X159.249 Y152.891 E.01592
N15096 G1 X190.751 Y184.392 E1.32866
N15097 G1 X190.751 Y183.858 E.01592
N15098 G1 X159.249 Y152.357 E1.32866
N15099 G1 X159.249 Y151.823 E.01592
N15100 G1 X190.751 Y183.324 E1.32866
N15101 G1 X190.751 Y182.791 E.01592
N15102 G1 X159.249 Y151.289 E1.32866
N15103 G1 X159.249 Y150.755 E.01592
N15104 G1 X190.751 Y182.257 E1.32866
N15105 G1 X190.751 Y181.723 E.01592
N15106 G1 X159.249 Y150.222 E1.32866
N15107 G1 X159.249 Y149.688 E.01592
N15108 G1 X190.751 Y181.189 E1.32866
N15109 G1 X190.751 Y180.655 E.01592
N15110 G1 X159.249 Y149.154 E1.32866
N15111 G1 X159.249 Y148.62 E.01592
N15112 G1 X190.751 Y180.121 E1.32866
N15113 G1 X190.751 Y179.587 E.01592
N15114 G1 X159.249 Y148.086 E1.32866
N15115 G1 X159.249 Y147.552 E.01592
N15116 G1 X190.751 Y179.053 E1.32866
N15117 G1 X190.751 Y178.519 E.01593
N15118 G1 X159.249 Y147.018 E1.32866
N15119 G1 X159.249 Y146.484 E.01592
N15120 G1 X190.751 Y177.985 E1.32866
N15121 G1 X190.751 Y177.451 E.01592
N15122 G1 X159.249 Y145.95 E1.32866
N15123 G1 X159.249 Y145.416 E.01592
N15124 G1 X190.751 Y176.917 E1.32866
N15125 G1 X190.751 Y176.383 E.01592
N15126 G1 X159.249 Y144.882 E1.32866
N15127 G1 X159.249 Y144.348 E.01592
N15128 G1 X190.751 Y175.849 E1.32866
N15129 G1 X190.751 Y175.315 E.01592
N15130 G1 X159.249 Y143.814 E1.32866
N15131 G1 X159.249 Y143.28 E.01592
N15132 G1 X190.751 Y174.781 E1.32866
N15133 G1 X190.751 Y174.247 E.01592
N15134 G1 X159.249 Y142.746 E1.32866
N15135 G1 X159.249 Y142.212 E.01592
N15136 G1 X190.751 Y173.713 E1.32866
N15137 G1 X190.751 Y173.179 E.01592
N15138 G1 X159.249 Y141.678 E1.32866
N15139 G1 X159.249 Y141.144 E.01592
N15140 G1 X190.751 Y172.645 E1.32866
N15141 G1 X190.751 Y172.112 E.01592
N15142 G1 X159.249 Y140.61 E1.32866
N15143 G1 X159.249 Y140.076 E.01593
N15144 G1 X190.751 Y171.578 E1.32866
N15145 G1 X190.751 Y171.044 E.01592
N15146 G1 X159.249 Y139.543 E1.32866
N15147 G1 X159.249 Y139.009 E.01592
N15148 G1 X190.751 Y170.51 E1.32866
N15149 G1 X190.751 Y169.976 E.01592
N15150 G1 X159.249 Y138.475 E1.32866
N15151 G1 X159.249 Y137.941 E.01592
N15152 M73 P92 R3
N15153 G1 X190.751 Y169.442 E1.32866
N15154 G1 X190.751 Y168.908 E.01592
N15155 G1 X159.249 Y137.407 E1.32866
N15156 G1 X159.249 Y136.873 E.01592
N15157 G1 X190.751 Y168.374 E1.32866
N15158 G1 X190.751 Y167.84 E.01592
N15159 G1 X159.249 Y136.339 E1.32866
N15160 G1 X159.249 Y135.805 E.01592
N15161 G1 X190.751 Y167.306 E1.32866
N15162 G1 X190.751 Y166.772 E.01592
N15163 G1 X159.249 Y135.271 E1.32866
N15164 G1 X159.249 Y134.737 E.01592
N15165 G1 X190.751 Y166.238 E1.32866
N15166 G1 X190.751 Y165.704 E.01592
N15167 G1 X159.249 Y134.203 E1.32866
N15168 G1 X159.249 Y133.669 E.01592
N15169 G1 X190.751 Y165.17 E1.32866
N15170 G1 X190.751 Y164.636 E.01592
N15171 G1 X159.249 Y133.135 E1.32866
N15172 G1 X159.249 Y132.601 E.01592
N15173 G1 X190.751 Y164.102 E1.32866
N15174 G1 X190.751 Y163.568 E.01592
N15175 G1 X159.249 Y132.067 E1.32866
N15176 G1 X159.249 Y131.533 E.01592
N15177 G1 X190.751 Y163.034 E1.32866
N15178 G1 X190.751 Y162.5 E.01592
N15179 G1 X159.249 Y130.999 E1.32866
N15180 G1 X159.249 Y130.465 E.01592
N15181 G1 X190.751 Y161.966 E1.32866
N15182 G1 X190.751 Y161.432 E.01592
N15183 G1 X159.249 Y129.931 E1.32866
N15184 G1 X159.249 Y129.397 E.01592
N15185 G1 X190.751 Y160.899 E1.32866
N15186 G1 X190.751 Y160.365 E.01592
N15187 G1 X159.249 Y128.863 E1.32866
N15188 G1 X159.249 Y128.33 E.01592
N15189 G1 X190.751 Y159.831 E1.32866
N15190 G1 X190.751 Y159.297 E.01592
N15191 G1 X159.249 Y127.796 E1.32866
N15192 G1 X159.249 Y127.37 E.0127
N15193 G1 X159.357 Y127.37 E.00322
N15194 G1 X190.751 Y158.763 E1.3241
N15195 G1 X190.751 Y158.229 E.01592
N15196 G1 X159.891 Y127.37 E1.30158
N15197 G1 X160.425 Y127.37 E.01592
N15198 G1 X190.751 Y157.695 E1.27906
N15199 G1 X190.751 Y157.161 E.01592
N15200 G1 X160.959 Y127.37 E1.25654
N15201 G1 X161.493 Y127.37 E.01592
N15202 G1 X190.751 Y156.627 E1.23402
N15203 G1 X190.751 Y156.093 E.01593
N15204 G1 X162.027 Y127.37 E1.2115
N15205 G1 X162.561 Y127.37 E.01592
N15206 M73 P93 R3
N15207 G1 X190.751 Y155.559 E1.18898
N15208 G1 X190.751 Y155.025 E.01592
N15209 G1 X163.095 Y127.37 E1.16646
N15210 G1 X163.629 Y127.37 E.01592
N15211 G1 X190.751 Y154.491 E1.14394
N15212 G1 X190.751 Y153.957 E.01592
N15213 G1 X164.163 Y127.37 E1.12141
N15214 G1 X164.697 Y127.37 E.01592
N15215 G1 X190.751 Y153.423 E1.09889
N15216 G1 X190.751 Y152.889 E.01592
N15217 G1 X165.231 Y127.37 E1.07637
N15218 G1 X165.765 Y127.37 E.01592
N15219 G1 X190.751 Y152.355 E1.05385
N15220 G1 X190.751 Y151.821 E.01592
N15221 G1 X166.299 Y127.37 E1.03133
N15222 G1 X166.833 Y127.37 E.01592
N15223 G1 X190.751 Y151.287 E1.00881
N15224 G1 X190.751 Y150.753 E.01592
N15225 G1 X167.367 Y127.37 E.98629
N15226 G1 X167.901 Y127.37 E.01592
N15227 G1 X190.751 Y150.22 E.96377
N15228 G1 X190.751 Y149.686 E.01592
N15229 G1 X168.435 Y127.37 E.94125
N15230 G1 X168.969 Y127.37 E.01592
N15231 G1 X190.751 Y149.152 E.91873
N15232 G1 X190.751 Y148.618 E.01592
N15233 G1 X169.503 Y127.37 E.8962
N15234 G1 X170.036 Y127.37 E.01593
N15235 G1 X190.751 Y148.084 E.87368
N15236 G1 X190.751 Y147.55 E.01592
N15237 G1 X170.57 Y127.37 E.85116
N15238 G1 X171.104 Y127.37 E.01592
N15239 G1 X190.751 Y147.016 E.82864
N15240 G1 X190.751 Y146.482 E.01592
N15241 G1 X171.638 Y127.37 E.80612
N15242 G1 X172.172 Y127.37 E.01592
N15243 G1 X190.751 Y145.948 E.7836
N15244 G1 X190.751 Y145.414 E.01592
N15245 G1 X172.706 Y127.37 E.76108
N15246 G1 X173.24 Y127.37 E.01592
N15247 G1 X190.751 Y144.88 E.73856
N15248 G1 X190.751 Y144.346 E.01593
N15249 G1 X173.774 Y127.37 E.71603
N15250 G1 X174.308 Y127.37 E.01592
N15251 G1 X190.751 Y143.812 E.69351
N15252 G1 X190.751 Y143.278 E.01592
N15253 G1 X174.842 Y127.37 E.67099
N15254 G1 X175.376 Y127.37 E.01592
N15255 G1 X190.751 Y142.744 E.64847
N15256 G1 X190.751 Y142.21 E.01592
N15257 G1 X175.91 Y127.37 E.62595
N15258 G1 X176.444 Y127.37 E.01592
N15259 G1 X190.751 Y141.676 E.60343
N15260 G1 X190.751 Y141.142 E.01592
N15261 G1 X176.978 Y127.37 E.58091
N15262 G1 X177.512 Y127.37 E.01592
N15263 G1 X190.751 Y140.608 E.55839
N15264 G1 X190.751 Y140.074 E.01592
N15265 G1 X178.046 Y127.37 E.53587
N15266 G1 X178.58 Y127.37 E.01592
N15267 G1 X190.751 Y139.541 E.51335
N15268 G1 X190.751 Y139.007 E.01592
N15269 G1 X179.114 Y127.37 E.49082
N15270 G1 X179.648 Y127.37 E.01592
N15271 G1 X190.751 Y138.473 E.4683
N15272 G1 X190.751 Y137.939 E.01592
N15273 G1 X180.182 Y127.37 E.44578
N15274 G1 X180.715 Y127.37 E.01592
N15275 G1 X190.751 Y137.405 E.42326
N15276 G1 X190.751 Y136.871 E.01592
N15277 G1 X181.249 Y127.37 E.40074
N15278 G1 X181.783 Y127.37 E.01592
N15279 G1 X190.751 Y136.337 E.37822
N15280 G1 X190.751 Y135.803 E.01592
N15281 G1 X182.317 Y127.37 E.3557
N15282 G1 X182.851 Y127.37 E.01592
N15283 G1 X190.751 Y135.269 E.33318
N15284 G1 X190.751 Y134.735 E.01592
N15285 G1 X183.385 Y127.37 E.31066
N15286 G1 X183.919 Y127.37 E.01592
N15287 G1 X190.751 Y134.201 E.28813
N15288 G1 X190.751 Y133.667 E.01592
N15289 G1 X184.453 Y127.37 E.26561
N15290 G1 X184.987 Y127.37 E.01592
N15291 G1 X190.751 Y133.133 E.24309
N15292 G1 X190.751 Y132.599 E.01592
N15293 G1 X185.521 Y127.37 E.22057
N15294 G1 X186.055 Y127.37 E.01592
N15295 G1 X190.751 Y132.065 E.19805
N15296 G1 X190.751 Y131.531 E.01592
N15297 G1 X186.589 Y127.37 E.17553
N15298 G1 X187.123 Y127.37 E.01592
N15299 G1 X190.751 Y130.997 E.15301
N15300 G1 X190.751 Y130.463 E.01592
N15301 G1 X187.657 Y127.37 E.13049
N15302 G1 X188.191 Y127.37 E.01592
N15303 G1 X190.751 Y129.929 E.10797
N15304 G1 X190.751 Y129.395 E.01592
N15305 G1 X188.725 Y127.37 E.08544
N15306 G1 X189.259 Y127.37 E.01592
N15307 G1 X190.751 Y128.862 E.06292
N15308 G1 X190.751 Y128.328 E.01592
N15309 G1 X189.793 Y127.37 E.0404
N15310 G1 X190.327 Y127.37 E.01592
N15311 G1 X190.92 Y127.963 E.02504
N15312 ; WIPE_START
N15313 G1 X190.327 Y127.37 E-.31901
N15314 G1 X189.793 Y127.37 E-.2029
N15315 G1 X190.236 Y127.813 E-.23809
N15316 ; WIPE_END
N15317 G1 E-.04 F1800
N15318 M204 S10000
N15319 G17
N15320 G3 Z12.6 I1.217 J0 P1  F60000
N15321 ; stop printing object, unique label id: 229
N15322 M625
N15323 ; object ids of layer 61 start: 229
N15324 M624 AQAAAAAAAAA=
N15325 ;======== H2D 20250527========
N15326 ; SKIPPABLE_START
N15327 ; SKIPTYPE: timelapse
N15328 M622.1 S1 ; for prev firware, default turned on
N15329 
N15330 M1002 judge_flag timelapse_record_flag
N15331 
N15332 M622 J1
N15333 M993 A2 B2 C2
N15334 M993 A0 B0 C0
N15335 
N15336 
N15337 
N15338 
N15339     M9711 M0 E1 X260 Y141 Z12.6 S11 C10 O0 T3000
N15340 
N15341 
N15342 
N15343 M993 A3 B3 C3
N15344 
N15345 M623
N15346 ; SKIPPABLE_END
N15347 
N15348 ; object ids of this layer61 end: 229
N15349 M625
N15350 ; CHANGE_LAYER
N15351 ; Z_HEIGHT: 12.4
N15352 ; LAYER_HEIGHT: 0.2
N15353 ;======== H2D 20250521========
N15354 ; layer num/total_layer_count: 62/63
N15355 ; update layer progress
N15356 M73 L62
N15357 M991 S0 P61 ;notify layer change
N15358 
N15359 
N15360 ; OBJECT_ID: 229
N15361 ; COOLING_NODE: 0
N15362 ; start printing object, unique label id: 229
N15363 M624 AQAAAAAAAAA=
N15364 G1 X191.084 Y200.639 F60000
N15365 G1 Z12.4
N15366 G1 E.8 F1800
N15367 ; FEATURE: Inner wall
N15368 ; LINE_WIDTH: 0.45
N15369 ; LAYER_HEIGHT: 0.2
N15370 G1 F4421.739
N15371 M204 S8000
N15372 G1 X158.916 Y200.639 E1.03439
N15373 G1 X158.916 Y127.036 E2.36678
N15374 G1 X191.084 Y127.036 E1.03439
N15375 G1 X191.084 Y200.579 E2.36485
N15376 ; COOLING_NODE: 0
N15377 M204 S10000
N15378 G1 X191.491 Y201.046 F60000
N15379 G1 F4421.739
N15380 M204 S8000
N15381 G1 X158.509 Y201.046 E1.06057
N15382 G1 X158.509 Y126.629 E2.39296
N15383 G1 X191.491 Y126.629 E1.06057
N15384 G1 X191.491 Y200.986 E2.39103
N15385 ; COOLING_NODE: 0
N15386 M204 S10000
N15387 G1 X191.898 Y201.453 F60000
N15388 G1 F4421.739
N15389 M204 S8000
N15390 G1 X158.102 Y201.453 E1.08675
N15391 G1 X158.102 Y126.222 E2.41914
N15392 G1 X191.898 Y126.222 E1.08675
N15393 G1 X191.898 Y201.393 E2.41721
N15394 ; COOLING_NODE: 0
N15395 M204 S10000
N15396 G1 X192.29 Y201.845 F60000
N15397 ; FEATURE: Outer wall
N15398 ; LINE_WIDTH: 0.42
N15399 G1 F4773.528
N15400 M204 S5000
N15401 G1 X157.71 Y201.845 E1.03002
N15402 G1 X157.71 Y125.83 E2.26421
N15403 G1 X192.29 Y125.83 E1.03002
N15404 G1 X192.29 Y201.785 E2.26243
N15405 G1 E-.8 F1800
N15406 M204 S10000
N15407 G1 X190.157 Y200.475 Z12.8 F60000
N15408 G1 Z12.4
N15409 G1 E.8 F1800
N15410 ; FEATURE: Internal solid infill
N15411 ; LINE_WIDTH: 0.42048
N15412 G1 F4767.454
N15413 M204 S8000
N15414 G1 X190.751 Y199.881 E.02504
N15415 G1 X190.751 Y199.347 E.01592
N15416 G1 X189.793 Y200.305 E.0404
N15417 G1 X189.259 Y200.305 E.01592
N15418 G1 X190.751 Y198.813 E.06292
N15419 G1 X190.751 Y198.279 E.01592
N15420 G1 X188.725 Y200.305 E.08544
N15421 G1 X188.191 Y200.305 E.01592
N15422 G1 X190.751 Y197.746 E.10797
N15423 G1 X190.751 Y197.212 E.01592
N15424 G1 X187.657 Y200.305 E.13049
N15425 G1 X187.123 Y200.305 E.01592
N15426 G1 X190.751 Y196.678 E.15301
N15427 G1 X190.751 Y196.144 E.01592
N15428 G1 X186.589 Y200.305 E.17553
N15429 G1 X186.055 Y200.305 E.01592
N15430 G1 X190.751 Y195.61 E.19805
N15431 G1 X190.751 Y195.076 E.01592
N15432 G1 X185.521 Y200.305 E.22057
N15433 G1 X184.987 Y200.305 E.01592
N15434 G1 X190.751 Y194.542 E.24309
N15435 G1 X190.751 Y194.008 E.01592
N15436 G1 X184.453 Y200.305 E.26561
N15437 G1 X183.919 Y200.305 E.01592
N15438 G1 X190.751 Y193.474 E.28813
N15439 G1 X190.751 Y192.94 E.01592
N15440 G1 X183.385 Y200.305 E.31066
N15441 G1 X182.851 Y200.305 E.01592
N15442 G1 X190.751 Y192.406 E.33318
N15443 G1 X190.751 Y191.872 E.01592
N15444 G1 X182.317 Y200.305 E.3557
N15445 G1 X181.783 Y200.305 E.01592
N15446 G1 X190.751 Y191.338 E.37822
N15447 G1 X190.751 Y190.804 E.01593
N15448 G1 X181.249 Y200.305 E.40074
N15449 G1 X180.715 Y200.305 E.01592
N15450 G1 X190.751 Y190.27 E.42326
N15451 G1 X190.751 Y189.736 E.01592
N15452 G1 X180.182 Y200.305 E.44578
N15453 G1 X179.648 Y200.305 E.01592
N15454 G1 X190.751 Y189.202 E.4683
N15455 G1 X190.751 Y188.668 E.01592
N15456 G1 X179.114 Y200.305 E.49082
N15457 G1 X178.58 Y200.305 E.01592
N15458 G1 X190.751 Y188.134 E.51335
N15459 G1 X190.751 Y187.6 E.01592
N15460 G1 X178.046 Y200.305 E.53587
N15461 G1 X177.512 Y200.305 E.01592
N15462 G1 X190.751 Y187.067 E.55839
N15463 G1 X190.751 Y186.533 E.01592
N15464 G1 X176.978 Y200.305 E.58091
N15465 G1 X176.444 Y200.305 E.01593
N15466 G1 X190.751 Y185.999 E.60343
N15467 G1 X190.751 Y185.465 E.01592
N15468 G1 X175.91 Y200.305 E.62595
N15469 G1 X175.376 Y200.305 E.01592
N15470 G1 X190.751 Y184.931 E.64847
N15471 G1 X190.751 Y184.397 E.01592
N15472 G1 X174.842 Y200.305 E.67099
N15473 G1 X174.308 Y200.305 E.01592
N15474 M73 P94 R3
N15475 G1 X190.751 Y183.863 E.69351
N15476 G1 X190.751 Y183.329 E.01592
N15477 G1 X173.774 Y200.305 E.71604
N15478 G1 X173.24 Y200.305 E.01593
N15479 G1 X190.751 Y182.795 E.73856
N15480 G1 X190.751 Y182.261 E.01592
N15481 G1 X172.706 Y200.305 E.76108
N15482 G1 X172.172 Y200.305 E.01592
N15483 G1 X190.751 Y181.727 E.7836
N15484 G1 X190.751 Y181.193 E.01592
N15485 G1 X171.638 Y200.305 E.80612
N15486 G1 X171.104 Y200.305 E.01592
N15487 G1 X190.751 Y180.659 E.82864
N15488 G1 X190.751 Y180.125 E.01592
N15489 G1 X170.57 Y200.305 E.85116
N15490 G1 X170.036 Y200.305 E.01592
N15491 G1 X190.751 Y179.591 E.87368
N15492 G1 X190.751 Y179.057 E.01592
N15493 G1 X169.503 Y200.305 E.8962
N15494 G1 X168.969 Y200.305 E.01592
N15495 G1 X190.751 Y178.523 E.91873
N15496 G1 X190.751 Y177.989 E.01592
N15497 G1 X168.435 Y200.305 E.94125
N15498 G1 X167.901 Y200.305 E.01592
N15499 G1 X190.751 Y177.455 E.96377
N15500 G1 X190.751 Y176.921 E.01592
N15501 G1 X167.367 Y200.305 E.98629
N15502 G1 X166.833 Y200.305 E.01592
N15503 G1 X190.751 Y176.388 E1.00881
N15504 G1 X190.751 Y175.854 E.01592
N15505 G1 X166.299 Y200.305 E1.03133
N15506 G1 X165.765 Y200.305 E.01592
N15507 G1 X190.751 Y175.32 E1.05385
N15508 G1 X190.751 Y174.786 E.01592
N15509 G1 X165.231 Y200.305 E1.07637
N15510 G1 X164.697 Y200.305 E.01592
N15511 G1 X190.751 Y174.252 E1.09889
N15512 G1 X190.751 Y173.718 E.01592
N15513 G1 X164.163 Y200.305 E1.12141
N15514 G1 X163.629 Y200.305 E.01592
N15515 G1 X190.751 Y173.184 E1.14394
N15516 G1 X190.751 Y172.65 E.01592
N15517 G1 X163.095 Y200.305 E1.16646
N15518 G1 X162.561 Y200.305 E.01592
N15519 G1 X190.751 Y172.116 E1.18898
N15520 G1 X190.751 Y171.582 E.01592
N15521 G1 X162.027 Y200.305 E1.2115
N15522 G1 X161.493 Y200.305 E.01592
N15523 G1 X190.751 Y171.048 E1.23402
N15524 G1 X190.751 Y170.514 E.01592
N15525 G1 X160.959 Y200.305 E1.25654
N15526 G1 X160.425 Y200.305 E.01592
N15527 G1 X190.751 Y169.98 E1.27906
N15528 G1 X190.751 Y169.446 E.01592
N15529 G1 X159.891 Y200.305 E1.30158
N15530 G1 X159.357 Y200.305 E.01592
N15531 G1 X190.751 Y168.912 E1.3241
N15532 G1 X190.751 Y168.378 E.01593
N15533 G1 X159.249 Y199.879 E1.32866
N15534 G1 X159.249 Y199.345 E.01592
N15535 M73 P94 R2
N15536 G1 X190.751 Y167.844 E1.32866
N15537 G1 X190.751 Y167.31 E.01592
N15538 G1 X159.249 Y198.811 E1.32866
N15539 G1 X159.249 Y198.277 E.01593
N15540 G1 X190.751 Y166.776 E1.32866
N15541 G1 X190.751 Y166.242 E.01592
N15542 G1 X159.249 Y197.744 E1.32866
N15543 G1 X159.249 Y197.21 E.01592
N15544 G1 X190.751 Y165.709 E1.32866
N15545 G1 X190.751 Y165.175 E.01592
N15546 G1 X159.249 Y196.676 E1.32866
N15547 G1 X159.249 Y196.142 E.01592
N15548 G1 X190.751 Y164.641 E1.32866
N15549 G1 X190.751 Y164.107 E.01592
N15550 G1 X159.249 Y195.608 E1.32866
N15551 G1 X159.249 Y195.074 E.01592
N15552 G1 X190.751 Y163.573 E1.32866
N15553 G1 X190.751 Y163.039 E.01592
N15554 G1 X159.249 Y194.54 E1.32866
N15555 G1 X159.249 Y194.006 E.01592
N15556 G1 X190.751 Y162.505 E1.32866
N15557 G1 X190.751 Y161.971 E.01592
N15558 G1 X159.249 Y193.472 E1.32866
N15559 G1 X159.249 Y192.938 E.01592
N15560 G1 X190.751 Y161.437 E1.32866
N15561 G1 X190.751 Y160.903 E.01592
N15562 G1 X159.249 Y192.404 E1.32866
N15563 G1 X159.249 Y191.87 E.01592
N15564 G1 X190.751 Y160.369 E1.32866
N15565 G1 X190.751 Y159.835 E.01592
N15566 G1 X159.249 Y191.336 E1.32866
N15567 G1 X159.249 Y190.802 E.01592
N15568 G1 X190.751 Y159.301 E1.32866
N15569 G1 X190.751 Y158.767 E.01592
N15570 G1 X159.249 Y190.268 E1.32866
N15571 G1 X159.249 Y189.734 E.01592
N15572 G1 X190.751 Y158.233 E1.32866
N15573 G1 X190.751 Y157.699 E.01592
N15574 G1 X159.249 Y189.2 E1.32866
N15575 G1 X159.249 Y188.666 E.01592
N15576 G1 X190.751 Y157.165 E1.32866
N15577 G1 X190.751 Y156.631 E.01592
N15578 G1 X159.249 Y188.132 E1.32866
N15579 G1 X159.249 Y187.598 E.01592
N15580 G1 X190.751 Y156.097 E1.32866
N15581 G1 X190.751 Y155.563 E.01592
N15582 G1 X159.249 Y187.065 E1.32866
N15583 G1 X159.249 Y186.531 E.01593
N15584 G1 X190.751 Y155.03 E1.32866
N15585 G1 X190.751 Y154.496 E.01592
N15586 G1 X159.249 Y185.997 E1.32866
N15587 G1 X159.249 Y185.463 E.01592
N15588 G1 X190.751 Y153.962 E1.32866
N15589 G1 X190.751 Y153.428 E.01592
N15590 G1 X159.249 Y184.929 E1.32866
N15591 G1 X159.249 Y184.395 E.01592
N15592 G1 X190.751 Y152.894 E1.32866
N15593 G1 X190.751 Y152.36 E.01592
N15594 G1 X159.249 Y183.861 E1.32866
N15595 G1 X159.249 Y183.327 E.01592
N15596 G1 X190.751 Y151.826 E1.32866
N15597 G1 X190.751 Y151.292 E.01592
N15598 G1 X159.249 Y182.793 E1.32866
N15599 G1 X159.249 Y182.259 E.01592
N15600 G1 X190.751 Y150.758 E1.32866
N15601 M73 P95 R2
N15602 G1 X190.751 Y150.224 E.01592
N15603 G1 X159.249 Y181.725 E1.32866
N15604 G1 X159.249 Y181.191 E.01592
N15605 G1 X190.751 Y149.69 E1.32866
N15606 G1 X190.751 Y149.156 E.01593
N15607 G1 X159.249 Y180.657 E1.32866
N15608 G1 X159.249 Y180.123 E.01592
N15609 G1 X190.751 Y148.622 E1.32866
N15610 G1 X190.751 Y148.088 E.01592
N15611 G1 X159.249 Y179.589 E1.32866
N15612 G1 X159.249 Y179.055 E.01592
N15613 G1 X190.751 Y147.554 E1.32866
N15614 G1 X190.751 Y147.02 E.01592
N15615 G1 X159.249 Y178.521 E1.32866
N15616 G1 X159.249 Y177.987 E.01592
N15617 G1 X190.751 Y146.486 E1.32866
N15618 G1 X190.751 Y145.952 E.01592
N15619 G1 X159.249 Y177.453 E1.32866
N15620 G1 X159.249 Y176.919 E.01592
N15621 G1 X190.751 Y145.418 E1.32866
N15622 G1 X190.751 Y144.884 E.01592
N15623 G1 X159.249 Y176.386 E1.32866
N15624 G1 X159.249 Y175.852 E.01592
N15625 G1 X190.751 Y144.351 E1.32866
N15626 G1 X190.751 Y143.817 E.01592
N15627 G1 X159.249 Y175.318 E1.32866
N15628 G1 X159.249 Y174.784 E.01592
N15629 G1 X190.751 Y143.283 E1.32866
N15630 G1 X190.751 Y142.749 E.01592
N15631 G1 X159.249 Y174.25 E1.32866
N15632 G1 X159.249 Y173.716 E.01592
N15633 G1 X190.751 Y142.215 E1.32866
N15634 G1 X190.751 Y141.681 E.01592
N15635 G1 X159.249 Y173.182 E1.32866
N15636 G1 X159.249 Y172.648 E.01592
N15637 G1 X190.751 Y141.147 E1.32866
N15638 G1 X190.751 Y140.613 E.01592
N15639 G1 X159.249 Y172.114 E1.32866
N15640 G1 X159.249 Y171.58 E.01592
N15641 G1 X190.751 Y140.079 E1.32866
N15642 G1 X190.751 Y139.545 E.01592
N15643 G1 X159.249 Y171.046 E1.32866
N15644 G1 X159.249 Y170.512 E.01592
N15645 G1 X190.751 Y139.011 E1.32866
N15646 G1 X190.751 Y138.477 E.01592
N15647 G1 X159.249 Y169.978 E1.32866
N15648 G1 X159.249 Y169.444 E.01592
N15649 G1 X190.751 Y137.943 E1.32866
N15650 G1 X190.751 Y137.409 E.01593
N15651 G1 X159.249 Y168.91 E1.32866
N15652 G1 X159.249 Y168.376 E.01592
N15653 G1 X190.751 Y136.875 E1.32866
N15654 G1 X190.751 Y136.341 E.01592
N15655 G1 X159.249 Y167.842 E1.32866
N15656 G1 X159.249 Y167.308 E.01592
N15657 G1 X190.751 Y135.807 E1.32866
N15658 G1 X190.751 Y135.273 E.01592
N15659 G1 X159.249 Y166.774 E1.32866
N15660 G1 X159.249 Y166.24 E.01592
N15661 G1 X190.751 Y134.739 E1.32866
N15662 G1 X190.751 Y134.205 E.01592
N15663 G1 X159.249 Y165.707 E1.32866
N15664 G1 X159.249 Y165.173 E.01592
N15665 G1 X190.751 Y133.672 E1.32866
N15666 G1 X190.751 Y133.138 E.01592
N15667 G1 X159.249 Y164.639 E1.32866
N15668 G1 X159.249 Y164.105 E.01593
N15669 G1 X190.751 Y132.604 E1.32866
N15670 G1 X190.751 Y132.07 E.01592
N15671 G1 X159.249 Y163.571 E1.32866
N15672 G1 X159.249 Y163.037 E.01592
N15673 G1 X190.751 Y131.536 E1.32866
N15674 G1 X190.751 Y131.002 E.01592
N15675 G1 X159.249 Y162.503 E1.32866
N15676 G1 X159.249 Y161.969 E.01592
N15677 G1 X190.751 Y130.468 E1.32866
N15678 G1 X190.751 Y129.934 E.01592
N15679 G1 X159.249 Y161.435 E1.32866
N15680 G1 X159.249 Y160.901 E.01592
N15681 G1 X190.751 Y129.4 E1.32866
N15682 G1 X190.751 Y128.866 E.01592
N15683 G1 X159.249 Y160.367 E1.32866
N15684 G1 X159.249 Y159.833 E.01592
N15685 G1 X190.751 Y128.332 E1.32866
N15686 G1 X190.751 Y127.798 E.01592
N15687 G1 X159.249 Y159.299 E1.32866
N15688 G1 X159.249 Y158.765 E.01592
N15689 G1 X190.645 Y127.37 E1.32421
N15690 G1 X190.111 Y127.37 E.01592
N15691 G1 X159.249 Y158.231 E1.30169
N15692 G1 X159.249 Y157.697 E.01592
N15693 G1 X189.577 Y127.37 E1.27917
N15694 G1 X189.043 Y127.37 E.01592
N15695 G1 X159.249 Y157.163 E1.25664
N15696 G1 X159.249 Y156.629 E.01592
N15697 G1 X188.509 Y127.37 E1.23412
N15698 G1 X187.975 Y127.37 E.01592
N15699 G1 X159.249 Y156.095 E1.2116
N15700 G1 X159.249 Y155.561 E.01592
N15701 G1 X187.441 Y127.37 E1.18908
N15702 G1 X186.907 Y127.37 E.01592
N15703 G1 X159.249 Y155.028 E1.16656
N15704 G1 X159.249 Y154.494 E.01592
N15705 G1 X186.373 Y127.37 E1.14404
N15706 G1 X185.839 Y127.37 E.01592
N15707 G1 X159.249 Y153.96 E1.12152
N15708 G1 X159.249 Y153.426 E.01592
N15709 G1 X185.305 Y127.37 E1.099
N15710 G1 X184.772 Y127.37 E.01593
N15711 G1 X159.249 Y152.892 E1.07648
N15712 G1 X159.249 Y152.358 E.01592
N15713 G1 X184.238 Y127.37 E1.05395
N15714 G1 X183.704 Y127.37 E.01592
N15715 M73 P96 R2
N15716 G1 X159.249 Y151.824 E1.03143
N15717 G1 X159.249 Y151.29 E.01592
N15718 G1 X183.17 Y127.37 E1.00891
N15719 G1 X182.636 Y127.37 E.01592
N15720 G1 X159.249 Y150.756 E.98639
N15721 G1 X159.249 Y150.222 E.01592
N15722 G1 X182.102 Y127.37 E.96387
N15723 G1 X181.568 Y127.37 E.01592
N15724 G1 X159.249 Y149.688 E.94135
N15725 G1 X159.249 Y149.154 E.01592
N15726 G1 X181.034 Y127.37 E.91883
N15727 G1 X180.5 Y127.37 E.01592
N15728 G1 X159.249 Y148.62 E.89631
N15729 G1 X159.249 Y148.086 E.01592
N15730 G1 X179.966 Y127.37 E.87379
N15731 G1 X179.432 Y127.37 E.01592
N15732 G1 X159.249 Y147.552 E.85126
N15733 G1 X159.249 Y147.018 E.01592
N15734 G1 X178.898 Y127.37 E.82874
N15735 G1 X178.364 Y127.37 E.01592
N15736 G1 X159.249 Y146.484 E.80622
N15737 G1 X159.249 Y145.95 E.01592
N15738 G1 X177.83 Y127.37 E.7837
N15739 G1 X177.296 Y127.37 E.01592
N15740 G1 X159.249 Y145.416 E.76118
N15741 G1 X159.249 Y144.882 E.01593
N15742 G1 X176.762 Y127.37 E.73866
N15743 G1 X176.228 Y127.37 E.01592
N15744 G1 X159.249 Y144.349 E.71614
N15745 G1 X159.249 Y143.815 E.01592
N15746 G1 X175.694 Y127.37 E.69362
N15747 G1 X175.16 Y127.37 E.01592
N15748 G1 X159.249 Y143.281 E.6711
N15749 G1 X159.249 Y142.747 E.01592
N15750 G1 X174.626 Y127.37 E.64857
N15751 G1 X174.093 Y127.37 E.01592
N15752 G1 X159.249 Y142.213 E.62605
N15753 G1 X159.249 Y141.679 E.01592
N15754 G1 X173.559 Y127.37 E.60353
N15755 G1 X173.025 Y127.37 E.01592
N15756 G1 X159.249 Y141.145 E.58101
N15757 G1 X159.249 Y140.611 E.01592
N15758 G1 X172.491 Y127.37 E.55849
N15759 G1 X171.957 Y127.37 E.01592
N15760 G1 X159.249 Y140.077 E.53597
N15761 G1 X159.249 Y139.543 E.01592
N15762 G1 X171.423 Y127.37 E.51345
N15763 M73 P96 R1
N15764 G1 X170.889 Y127.37 E.01592
N15765 G1 X159.249 Y139.009 E.49093
N15766 G1 X159.249 Y138.475 E.01592
N15767 G1 X170.355 Y127.37 E.46841
N15768 G1 X169.821 Y127.37 E.01592
N15769 G1 X159.249 Y137.941 E.44588
N15770 G1 X159.249 Y137.407 E.01592
N15771 G1 X169.287 Y127.37 E.42336
N15772 G1 X168.753 Y127.37 E.01592
N15773 G1 X159.249 Y136.873 E.40084
N15774 G1 X159.249 Y136.339 E.01592
N15775 G1 X168.219 Y127.37 E.37832
N15776 G1 X167.685 Y127.37 E.01592
N15777 G1 X159.249 Y135.805 E.3558
N15778 G1 X159.249 Y135.271 E.01592
N15779 G1 X167.151 Y127.37 E.33328
N15780 G1 X166.617 Y127.37 E.01592
N15781 G1 X159.249 Y134.737 E.31076
N15782 G1 X159.249 Y134.203 E.01592
N15783 G1 X166.083 Y127.37 E.28824
N15784 G1 X165.549 Y127.37 E.01592
N15785 G1 X159.249 Y133.669 E.26572
N15786 G1 X159.249 Y133.136 E.01592
N15787 G1 X165.015 Y127.37 E.24319
N15788 G1 X164.481 Y127.37 E.01592
N15789 G1 X159.249 Y132.602 E.22067
N15790 G1 X159.249 Y132.068 E.01592
N15791 G1 X163.947 Y127.37 E.19815
N15792 G1 X163.413 Y127.37 E.01592
N15793 G1 X159.249 Y131.534 E.17563
N15794 G1 X159.249 Y131 E.01592
N15795 G1 X162.88 Y127.37 E.15311
N15796 G1 X162.346 Y127.37 E.01592
N15797 G1 X159.249 Y130.466 E.13059
N15798 G1 X159.249 Y129.932 E.01592
N15799 G1 X161.812 Y127.37 E.10807
N15800 G1 X161.278 Y127.37 E.01592
N15801 G1 X159.249 Y129.398 E.08555
N15802 G1 X159.249 Y128.864 E.01592
N15803 G1 X160.744 Y127.37 E.06303
N15804 G1 X160.21 Y127.37 E.01592
N15805 G1 X159.249 Y128.33 E.0405
N15806 G1 X159.249 Y127.796 E.01592
N15807 G1 X159.846 Y127.2 E.02514
N15808 ; WIPE_START
N15809 G1 X159.249 Y127.796 E-.32032
N15810 G1 X159.249 Y128.33 E-.2029
N15811 G1 X159.69 Y127.889 E-.23678
N15812 ; WIPE_END
N15813 G1 E-.04 F1800
N15814 M204 S10000
N15815 G17
N15816 G3 Z12.8 I1.217 J0 P1  F60000
N15817 ; stop printing object, unique label id: 229
N15818 M625
N15819 ; object ids of layer 62 start: 229
N15820 M624 AQAAAAAAAAA=
N15821 ;======== H2D 20250527========
N15822 ; SKIPPABLE_START
N15823 ; SKIPTYPE: timelapse
N15824 M622.1 S1 ; for prev firware, default turned on
N15825 
N15826 M1002 judge_flag timelapse_record_flag
N15827 
N15828 M622 J1
N15829 M993 A2 B2 C2
N15830 M993 A0 B0 C0
N15831 
N15832 
N15833 
N15834 
N15835     M9711 M0 E1 X260 Y141 Z12.8 S11 C10 O0 T3000
N15836 
N15837 
N15838 
N15839 M993 A3 B3 C3
N15840 
N15841 M623
N15842 ; SKIPPABLE_END
N15843 
N15844 ; object ids of this layer62 end: 229
N15845 M625
N15846 ; CHANGE_LAYER
N15847 ; Z_HEIGHT: 12.6
N15848 ; LAYER_HEIGHT: 0.200001
N15849 ;======== H2D 20250521========
N15850 ; layer num/total_layer_count: 63/63
N15851 ; update layer progress
N15852 M73 L63
N15853 M991 S0 P62 ;notify layer change
N15854 
N15855 
N15856 ; OBJECT_ID: 229
N15857 ; COOLING_NODE: 0
N15858 ; start printing object, unique label id: 229
N15859 M624 AQAAAAAAAAA=
N15860 G1 X192.29 Y201.845 F60000
N15861 G1 Z12.6
N15862 G1 E.8 F1800
N15863 ; FEATURE: Outer wall
N15864 ; LINE_WIDTH: 0.42
N15865 G1 F4773.528
N15866 M204 S5000
N15867 G1 X157.71 Y201.845 E1.03002
N15868 G1 X157.71 Y125.83 E2.26421
N15869 G1 X192.29 Y125.83 E1.03002
N15870 G1 X192.29 Y201.785 E2.26243
N15871 G1 E-.8 F1800
N15872 M204 S10000
N15873 G1 X192.269 Y194.152 Z13 F60000
N15874 G1 X192.083 Y126.795 Z13
N15875 G1 Z12.6
N15876 G1 E.8 F1800
N15877 ; FEATURE: Top surface
N15878 G1 F4773.528
N15879 M204 S2000
N15880 G1 X191.326 Y126.038 E.03189
N15881 G1 X190.792 Y126.038 E.01588
N15882 G1 X192.083 Y127.328 E.05435
N15883 G1 X192.083 Y127.861 E.01588
N15884 G1 X190.259 Y126.038 E.07681
N15885 G1 X189.726 Y126.038 E.01588
N15886 G1 X192.083 Y128.394 E.09928
N15887 G1 X192.083 Y128.928 E.01588
N15888 G1 X189.193 Y126.038 E.12174
N15889 G1 X188.659 Y126.038 E.01588
N15890 G1 X192.083 Y129.461 E.1442
N15891 G1 X192.083 Y129.994 E.01588
N15892 G1 X188.126 Y126.038 E.16667
N15893 G1 X187.593 Y126.038 E.01588
N15894 G1 X192.083 Y130.527 E.18913
N15895 G1 X192.083 Y131.061 E.01588
N15896 G1 X187.06 Y126.038 E.21159
N15897 G1 X186.526 Y126.038 E.01588
N15898 G1 X192.083 Y131.594 E.23406
N15899 G1 X192.083 Y132.127 E.01588
N15900 G1 X185.993 Y126.038 E.25652
N15901 G1 X185.46 Y126.038 E.01588
N15902 G1 X192.083 Y132.66 E.27898
N15903 G1 X192.083 Y133.194 E.01588
N15904 G1 X184.927 Y126.038 E.30145
N15905 G1 X184.393 Y126.038 E.01588
N15906 G1 X192.083 Y133.727 E.32391
N15907 G1 X192.083 Y134.26 E.01588
N15908 G1 X183.86 Y126.038 E.34637
N15909 G1 X183.327 Y126.038 E.01588
N15910 G1 X192.083 Y134.793 E.36884
N15911 G1 X192.083 Y135.327 E.01588
N15912 G1 X182.794 Y126.038 E.3913
N15913 G1 X182.26 Y126.038 E.01588
N15914 G1 X192.083 Y135.86 E.41376
N15915 G1 X192.083 Y136.393 E.01588
N15916 G1 X181.727 Y126.038 E.43622
N15917 G1 X181.194 Y126.038 E.01588
N15918 G1 X192.083 Y136.926 E.45869
N15919 G1 X192.083 Y137.46 E.01588
N15920 G1 X180.661 Y126.038 E.48115
N15921 G1 X180.127 Y126.038 E.01588
N15922 G1 X192.083 Y137.993 E.50361
N15923 G1 X192.083 Y138.526 E.01588
N15924 G1 X179.594 Y126.038 E.52608
N15925 G1 X179.061 Y126.038 E.01588
N15926 G1 X192.083 Y139.059 E.54854
N15927 G1 X192.083 Y139.593 E.01588
N15928 G1 X178.527 Y126.038 E.571
N15929 G1 X177.994 Y126.038 E.01588
N15930 G1 X192.083 Y140.126 E.59347
N15931 G1 X192.083 Y140.659 E.01588
N15932 G1 X177.461 Y126.038 E.61593
N15933 G1 X176.928 Y126.038 E.01588
N15934 G1 X192.083 Y141.192 E.63839
N15935 G1 X192.083 Y141.726 E.01588
N15936 G1 X176.394 Y126.038 E.66086
N15937 G1 X175.861 Y126.038 E.01588
N15938 G1 X192.083 Y142.259 E.68332
N15939 G1 X192.083 Y142.792 E.01588
N15940 G1 X175.328 Y126.038 E.70578
N15941 G1 X174.795 Y126.038 E.01588
N15942 G1 X192.083 Y143.326 E.72825
N15943 G1 X192.083 Y143.859 E.01588
N15944 G1 X174.261 Y126.038 E.75071
N15945 G1 X173.728 Y126.038 E.01588
N15946 G1 X192.083 Y144.392 E.77317
N15947 G1 X192.083 Y144.925 E.01588
N15948 G1 X173.195 Y126.038 E.79564
N15949 G1 X172.662 Y126.038 E.01588
N15950 G1 X192.083 Y145.459 E.8181
N15951 G1 X192.083 Y145.992 E.01588
N15952 G1 X172.128 Y126.038 E.84056
N15953 G1 X171.595 Y126.038 E.01588
N15954 G1 X192.083 Y146.525 E.86303
N15955 G1 X192.083 Y147.058 E.01588
N15956 G1 X171.062 Y126.038 E.88549
N15957 G1 X170.529 Y126.038 E.01588
N15958 G1 X192.083 Y147.592 E.90795
N15959 G1 X192.083 Y148.125 E.01588
N15960 G1 X169.995 Y126.038 E.93042
N15961 G1 X169.462 Y126.038 E.01588
N15962 G1 X192.083 Y148.658 E.95288
N15963 G1 X192.083 Y149.191 E.01588
N15964 G1 X168.929 Y126.038 E.97534
N15965 G1 X168.396 Y126.038 E.01588
N15966 G1 X192.083 Y149.725 E.99781
N15967 G1 X192.083 Y150.258 E.01588
N15968 G1 X167.862 Y126.038 E1.02027
N15969 G1 X167.329 Y126.038 E.01588
N15970 G1 X192.083 Y150.791 E1.04273
N15971 G1 X192.083 Y151.324 E.01588
N15972 G1 X166.796 Y126.038 E1.0652
N15973 G1 X166.263 Y126.038 E.01588
N15974 G1 X192.083 Y151.858 E1.08766
N15975 G1 X192.083 Y152.391 E.01588
N15976 G1 X165.729 Y126.038 E1.11012
N15977 G1 X165.196 Y126.038 E.01588
N15978 G1 X192.083 Y152.924 E1.13259
N15979 G1 X192.083 Y153.457 E.01588
N15980 G1 X164.663 Y126.038 E1.15505
N15981 G1 X164.13 Y126.038 E.01588
N15982 G1 X192.083 Y153.991 E1.17751
N15983 G1 X192.083 Y154.524 E.01588
N15984 G1 X163.596 Y126.038 E1.19998
N15985 G1 X163.063 Y126.038 E.01588
N15986 G1 X192.083 Y155.057 E1.22244
N15987 G1 X192.083 Y155.59 E.01588
N15988 M73 P97 R1
N15989 G1 X162.53 Y126.038 E1.2449
N15990 G1 X161.997 Y126.038 E.01588
N15991 G1 X192.083 Y156.124 E1.26737
N15992 G1 X192.083 Y156.657 E.01588
N15993 G1 X161.463 Y126.038 E1.28983
N15994 G1 X160.93 Y126.038 E.01588
N15995 G1 X192.083 Y157.19 E1.31229
N15996 G1 X192.083 Y157.723 E.01588
N15997 G1 X160.397 Y126.038 E1.33476
N15998 G1 X159.863 Y126.038 E.01588
N15999 G1 X192.083 Y158.257 E1.35722
N16000 G1 X192.083 Y158.79 E.01588
N16001 G1 X159.33 Y126.038 E1.37968
N16002 G1 X158.797 Y126.038 E.01588
N16003 G1 X192.083 Y159.323 E1.40214
N16004 G1 X192.083 Y159.857 E.01588
N16005 G1 X158.264 Y126.038 E1.42461
N16006 G1 X157.917 Y126.225 E.01172
N16007 G1 X192.083 Y160.39 E1.4392
N16008 G1 X192.083 Y160.923 E.01588
N16009 G1 X157.917 Y126.758 E1.4392
N16010 G1 X157.917 Y127.291 E.01588
N16011 G1 X192.083 Y161.456 E1.4392
N16012 G1 X192.083 Y161.99 E.01588
N16013 G1 X157.917 Y127.824 E1.4392
N16014 G1 X157.917 Y128.358 E.01588
N16015 G1 X192.083 Y162.523 E1.4392
N16016 G1 X192.083 Y163.056 E.01588
N16017 G1 X157.917 Y128.891 E1.4392
N16018 G1 X157.917 Y129.424 E.01588
N16019 G1 X192.083 Y163.589 E1.4392
N16020 G1 X192.083 Y164.123 E.01588
N16021 G1 X157.917 Y129.957 E1.4392
N16022 G1 X157.917 Y130.491 E.01588
N16023 G1 X192.083 Y164.656 E1.4392
N16024 G1 X192.083 Y165.189 E.01588
N16025 G1 X157.917 Y131.024 E1.4392
N16026 G1 X157.917 Y131.557 E.01588
N16027 G1 X192.083 Y165.722 E1.4392
N16028 G1 X192.083 Y166.256 E.01588
N16029 G1 X157.917 Y132.09 E1.4392
N16030 G1 X157.917 Y132.624 E.01588
N16031 G1 X192.083 Y166.789 E1.4392
N16032 G1 X192.083 Y167.322 E.01588
N16033 G1 X157.917 Y133.157 E1.4392
N16034 G1 X157.917 Y133.69 E.01588
N16035 G1 X192.083 Y167.855 E1.4392
N16036 G1 X192.083 Y168.389 E.01588
N16037 G1 X157.917 Y134.223 E1.4392
N16038 G1 X157.917 Y134.757 E.01588
N16039 G1 X192.083 Y168.922 E1.4392
N16040 G1 X192.083 Y169.455 E.01588
N16041 G1 X157.917 Y135.29 E1.4392
N16042 G1 X157.917 Y135.823 E.01588
N16043 G1 X192.083 Y169.988 E1.4392
N16044 G1 X192.083 Y170.522 E.01588
N16045 G1 X157.917 Y136.356 E1.4392
N16046 G1 X157.917 Y136.89 E.01588
N16047 G1 X192.083 Y171.055 E1.4392
N16048 G1 X192.083 Y171.588 E.01588
N16049 G1 X157.917 Y137.423 E1.4392
N16050 G1 X157.917 Y137.956 E.01588
N16051 G1 X192.083 Y172.121 E1.4392
N16052 G1 X192.083 Y172.655 E.01588
N16053 G1 X157.917 Y138.489 E1.4392
N16054 G1 X157.917 Y139.023 E.01588
N16055 G1 X192.083 Y173.188 E1.4392
N16056 G1 X192.083 Y173.721 E.01588
N16057 G1 X157.917 Y139.556 E1.4392
N16058 G1 X157.917 Y140.089 E.01588
N16059 G1 X192.083 Y174.254 E1.4392
N16060 G1 X192.083 Y174.788 E.01588
N16061 G1 X157.917 Y140.622 E1.4392
N16062 G1 X157.917 Y141.156 E.01588
N16063 G1 X192.083 Y175.321 E1.4392
N16064 G1 X192.083 Y175.854 E.01588
N16065 G1 X157.917 Y141.689 E1.4392
N16066 G1 X157.917 Y142.222 E.01588
N16067 G1 X192.083 Y176.387 E1.4392
N16068 G1 X192.083 Y176.921 E.01588
N16069 G1 X157.917 Y142.755 E1.4392
N16070 G1 X157.917 Y143.289 E.01588
N16071 G1 X192.083 Y177.454 E1.4392
N16072 G1 X192.083 Y177.987 E.01588
N16073 G1 X157.917 Y143.822 E1.4392
N16074 G1 X157.917 Y144.355 E.01588
N16075 G1 X192.083 Y178.521 E1.4392
N16076 G1 X192.083 Y179.054 E.01588
N16077 G1 X157.917 Y144.889 E1.4392
N16078 G1 X157.917 Y145.422 E.01588
N16079 G1 X192.083 Y179.587 E1.4392
N16080 G1 X192.083 Y180.12 E.01588
N16081 G1 X157.917 Y145.955 E1.4392
N16082 G1 X157.917 Y146.488 E.01588
N16083 G1 X192.083 Y180.654 E1.4392
N16084 G1 X192.083 Y181.187 E.01588
N16085 G1 X157.917 Y147.022 E1.4392
N16086 G1 X157.917 Y147.555 E.01588
N16087 G1 X192.083 Y181.72 E1.4392
N16088 G1 X192.083 Y182.253 E.01588
N16089 M73 P98 R1
N16090 G1 X157.917 Y148.088 E1.4392
N16091 G1 X157.917 Y148.621 E.01588
N16092 G1 X192.083 Y182.787 E1.4392
N16093 G1 X192.083 Y183.32 E.01588
N16094 G1 X157.917 Y149.155 E1.4392
N16095 G1 X157.917 Y149.688 E.01588
N16096 G1 X192.083 Y183.853 E1.4392
N16097 G1 X192.083 Y184.386 E.01588
N16098 G1 X157.917 Y150.221 E1.4392
N16099 G1 X157.917 Y150.754 E.01588
N16100 G1 X192.083 Y184.92 E1.4392
N16101 G1 X192.083 Y185.453 E.01588
N16102 G1 X157.917 Y151.288 E1.4392
N16103 G1 X157.917 Y151.821 E.01588
N16104 M73 P98 R0
N16105 G1 X192.083 Y185.986 E1.4392
N16106 G1 X192.083 Y186.519 E.01588
N16107 G1 X157.917 Y152.354 E1.4392
N16108 G1 X157.917 Y152.887 E.01588
N16109 G1 X192.083 Y187.053 E1.4392
N16110 G1 X192.083 Y187.586 E.01588
N16111 G1 X157.917 Y153.421 E1.4392
N16112 G1 X157.917 Y153.954 E.01588
N16113 G1 X192.083 Y188.119 E1.4392
N16114 G1 X192.083 Y188.652 E.01588
N16115 G1 X157.917 Y154.487 E1.4392
N16116 G1 X157.917 Y155.02 E.01588
N16117 G1 X192.083 Y189.186 E1.4392
N16118 G1 X192.083 Y189.719 E.01588
N16119 G1 X157.917 Y155.554 E1.4392
N16120 G1 X157.917 Y156.087 E.01588
N16121 G1 X192.083 Y190.252 E1.4392
N16122 G1 X192.083 Y190.785 E.01588
N16123 G1 X157.917 Y156.62 E1.4392
N16124 G1 X157.917 Y157.153 E.01588
N16125 G1 X192.083 Y191.319 E1.4392
N16126 G1 X192.083 Y191.852 E.01588
N16127 G1 X157.917 Y157.687 E1.4392
N16128 G1 X157.917 Y158.22 E.01588
N16129 G1 X192.083 Y192.385 E1.4392
N16130 G1 X192.083 Y192.918 E.01588
N16131 G1 X157.917 Y158.753 E1.4392
N16132 G1 X157.917 Y159.286 E.01588
N16133 G1 X192.083 Y193.452 E1.4392
N16134 G1 X192.083 Y193.985 E.01588
N16135 G1 X157.917 Y159.82 E1.4392
N16136 G1 X157.917 Y160.353 E.01588
N16137 G1 X192.083 Y194.518 E1.4392
N16138 G1 X192.083 Y195.052 E.01588
N16139 G1 X157.917 Y160.886 E1.4392
N16140 G1 X157.917 Y161.419 E.01588
N16141 G1 X192.083 Y195.585 E1.4392
N16142 G1 X192.083 Y196.118 E.01588
N16143 G1 X157.917 Y161.953 E1.4392
N16144 G1 X157.917 Y162.486 E.01588
N16145 G1 X192.083 Y196.651 E1.4392
N16146 G1 X192.083 Y197.185 E.01588
N16147 G1 X157.917 Y163.019 E1.4392
N16148 G1 X157.917 Y163.553 E.01588
N16149 G1 X192.083 Y197.718 E1.4392
N16150 G1 X192.083 Y198.251 E.01588
N16151 G1 X157.917 Y164.086 E1.4392
N16152 G1 X157.917 Y164.619 E.01588
N16153 G1 X192.083 Y198.784 E1.4392
N16154 G1 X192.083 Y199.318 E.01588
N16155 G1 X157.917 Y165.152 E1.4392
N16156 G1 X157.917 Y165.686 E.01588
N16157 G1 X192.083 Y199.851 E1.4392
N16158 G1 X192.083 Y200.384 E.01588
N16159 G1 X157.917 Y166.219 E1.4392
N16160 G1 X157.917 Y166.752 E.01588
N16161 G1 X192.083 Y200.917 E1.4392
N16162 G1 X192.083 Y201.451 E.01588
N16163 G1 X157.917 Y167.285 E1.4392
N16164 G1 X157.917 Y167.819 E.01588
N16165 G1 X191.736 Y201.637 E1.4246
N16166 G1 X191.203 Y201.637 E.01588
N16167 G1 X157.917 Y168.352 E1.40214
N16168 G1 X157.917 Y168.885 E.01588
N16169 G1 X190.67 Y201.637 E1.37968
N16170 G1 X190.136 Y201.637 E.01588
N16171 G1 X157.917 Y169.418 E1.35721
N16172 G1 X157.917 Y169.952 E.01588
N16173 M73 P99 R0
N16174 G1 X189.603 Y201.637 E1.33475
N16175 G1 X189.07 Y201.637 E.01588
N16176 G1 X157.917 Y170.485 E1.31229
N16177 G1 X157.917 Y171.018 E.01588
N16178 G1 X188.537 Y201.637 E1.28982
N16179 G1 X188.003 Y201.637 E.01588
N16180 G1 X157.917 Y171.551 E1.26736
N16181 G1 X157.917 Y172.085 E.01588
N16182 G1 X187.47 Y201.637 E1.2449
N16183 G1 X186.937 Y201.637 E.01588
N16184 G1 X157.917 Y172.618 E1.22243
N16185 G1 X157.917 Y173.151 E.01588
N16186 G1 X186.404 Y201.637 E1.19997
N16187 G1 X185.87 Y201.637 E.01588
N16188 G1 X157.917 Y173.684 E1.17751
N16189 G1 X157.917 Y174.218 E.01588
N16190 G1 X185.337 Y201.637 E1.15504
N16191 G1 X184.804 Y201.637 E.01588
N16192 G1 X157.917 Y174.751 E1.13258
N16193 G1 X157.917 Y175.284 E.01588
N16194 G1 X184.271 Y201.637 E1.11012
N16195 G1 X183.737 Y201.637 E.01588
N16196 G1 X157.917 Y175.817 E1.08765
N16197 G1 X157.917 Y176.351 E.01588
N16198 G1 X183.204 Y201.637 E1.06519
N16199 G1 X182.671 Y201.637 E.01588
N16200 G1 X157.917 Y176.884 E1.04273
N16201 G1 X157.917 Y177.417 E.01588
N16202 G1 X182.138 Y201.637 E1.02026
N16203 G1 X181.604 Y201.637 E.01588
N16204 G1 X157.917 Y177.95 E.9978
N16205 G1 X157.917 Y178.484 E.01588
N16206 G1 X181.071 Y201.637 E.97534
N16207 G1 X180.538 Y201.637 E.01588
N16208 G1 X157.917 Y179.017 E.95287
N16209 G1 X157.917 Y179.55 E.01588
N16210 G1 X180.005 Y201.637 E.93041
N16211 G1 X179.471 Y201.637 E.01588
N16212 G1 X157.917 Y180.084 E.90795
N16213 G1 X157.917 Y180.617 E.01588
N16214 G1 X178.938 Y201.637 E.88548
N16215 G1 X178.405 Y201.637 E.01588
N16216 G1 X157.917 Y181.15 E.86302
N16217 G1 X157.917 Y181.683 E.01588
N16218 G1 X177.871 Y201.637 E.84056
N16219 G1 X177.338 Y201.637 E.01588
N16220 G1 X157.917 Y182.217 E.81809
N16221 G1 X157.917 Y182.75 E.01588
N16222 G1 X176.805 Y201.637 E.79563
N16223 G1 X176.272 Y201.637 E.01588
N16224 G1 X157.917 Y183.283 E.77317
N16225 G1 X157.917 Y183.816 E.01588
N16226 G1 X175.738 Y201.637 E.75071
N16227 G1 X175.205 Y201.637 E.01588
N16228 G1 X157.917 Y184.35 E.72824
N16229 G1 X157.917 Y184.883 E.01588
N16230 G1 X174.672 Y201.637 E.70578
N16231 G1 X174.139 Y201.637 E.01588
N16232 G1 X157.917 Y185.416 E.68332
N16233 G1 X157.917 Y185.949 E.01588
N16234 G1 X173.605 Y201.637 E.66085
N16235 G1 X173.072 Y201.637 E.01588
N16236 G1 X157.917 Y186.483 E.63839
N16237 G1 X157.917 Y187.016 E.01588
N16238 G1 X172.539 Y201.637 E.61593
N16239 G1 X172.006 Y201.637 E.01588
N16240 G1 X157.917 Y187.549 E.59346
N16241 G1 X157.917 Y188.082 E.01588
N16242 G1 X171.472 Y201.637 E.571
N16243 G1 X170.939 Y201.637 E.01588
N16244 G1 X157.917 Y188.616 E.54854
N16245 G1 X157.917 Y189.149 E.01588
N16246 G1 X170.406 Y201.637 E.52607
N16247 G1 X169.873 Y201.637 E.01588
N16248 G1 X157.917 Y189.682 E.50361
N16249 G1 X157.917 Y190.215 E.01588
N16250 G1 X169.339 Y201.637 E.48115
N16251 G1 X168.806 Y201.637 E.01588
N16252 G1 X157.917 Y190.749 E.45868
N16253 G1 X157.917 Y191.282 E.01588
N16254 G1 X168.273 Y201.637 E.43622
N16255 G1 X167.74 Y201.637 E.01588
N16256 G1 X157.917 Y191.815 E.41376
N16257 G1 X157.917 Y192.348 E.01588
N16258 G1 X167.206 Y201.637 E.39129
N16259 G1 X166.673 Y201.637 E.01588
N16260 G1 X157.917 Y192.882 E.36883
N16261 G1 X157.917 Y193.415 E.01588
N16262 G1 X166.14 Y201.637 E.34637
N16263 G1 X165.607 Y201.637 E.01588
N16264 G1 X157.917 Y193.948 E.3239
N16265 G1 X157.917 Y194.481 E.01588
N16266 G1 X165.073 Y201.637 E.30144
N16267 G1 X164.54 Y201.637 E.01588
N16268 G1 X157.917 Y195.015 E.27898
N16269 G1 X157.917 Y195.548 E.01588
N16270 G1 X164.007 Y201.637 E.25651
N16271 G1 X163.474 Y201.637 E.01588
N16272 G1 X157.917 Y196.081 E.23405
N16273 G1 X157.917 Y196.614 E.01588
N16274 G1 X162.94 Y201.637 E.21159
N16275 G1 X162.407 Y201.637 E.01588
N16276 G1 X157.917 Y197.148 E.18912
N16277 G1 X157.917 Y197.681 E.01588
N16278 G1 X161.874 Y201.637 E.16666
N16279 G1 X161.34 Y201.637 E.01588
N16280 G1 X157.917 Y198.214 E.1442
N16281 G1 X157.917 Y198.748 E.01588
N16282 G1 X160.807 Y201.637 E.12173
N16283 G1 X160.274 Y201.637 E.01588
N16284 G1 X157.917 Y199.281 E.09927
N16285 G1 X157.917 Y199.814 E.01588
N16286 G1 X159.741 Y201.637 E.07681
N16287 G1 X159.207 Y201.637 E.01588
N16288 G1 X157.917 Y200.347 E.05434
N16289 G1 X157.917 Y200.881 E.01588
N16290 G1 X158.674 Y201.637 E.03188
N16291 G1 E-.8 F1800
N16292 M204 S10000
N16293 G1 X166.307 Y201.632 Z13 F60000
N16294 G1 X192.101 Y201.614 Z13
N16295 G1 Z12.6
N16296 G1 E.8 F1800
N16297 ; FEATURE: Gap infill
N16298 ; LINE_WIDTH: 0.127568
N16299 G1 F15000
N16300 M204 S8000
N16301 G1 X191.76 Y201.614 E.00229
N16302 ; WIPE_START
N16303 G1 X192.101 Y201.614 E-.76
N16304 ; WIPE_END
N16305 G1 E-.04 F1800
N16306 M204 S10000
N16307 G17
N16308 G3 Z13 I1.217 J0 P1  F60000
N16309 ; stop printing object, unique label id: 229
N16310 M625
N16311 ; object ids of layer 63 start: 229
N16312 M624 AQAAAAAAAAA=
N16313 ;======== H2D 20250527========
N16314 ; SKIPPABLE_START
N16315 ; SKIPTYPE: timelapse
N16316 M622.1 S1 ; for prev firware, default turned on
N16317 
N16318 M1002 judge_flag timelapse_record_flag
N16319 
N16320 M622 J1
N16321 M993 A2 B2 C2
N16322 M993 A0 B0 C0
N16323 
N16324 
N16325 
N16326 
N16327     M9711 M0 E1 X260 Y141 Z13 S11 C10 O0 T3000
N16328 
N16329 
N16330 
N16331 M993 A3 B3 C3
N16332 
N16333 M623
N16334 ; SKIPPABLE_END
N16335 
N16336 ; object ids of this layer63 end: 229
N16337 M625
N16338 ; close powerlost recovery
N16339 M1003 S0
N16340 M106 S0
N16341 M106 P2 S0
N16342 M981 S0 P20000 ; close spaghetti detector
N16343 ; FEATURE: Custom
N16344 ; MACHINE_END_GCODE_START
N16345 ; filament end gcode 
N16346 ;===== date: 2025/05/16 =====================
N16347 ;===== H2D =====================
N16348 G392 S0 ;turn off nozzle clog detect
N16349 M993 A0 B0 C0 ; nozzle cam detection not allowed.
N16350 
N16351 M400 ; wait for buffer to clear
N16352 G92 E0 ; zero the extruder
N16353 G1 E-0.8 F1800 ; retract
N16354 G1 Z13.1 F900 ; lower z a little
N16355 
N16356 G90
N16357 M141 S0 ; turn off chamber heating
N16358 M140 S0 ; turn off bed
N16359 M106 S0 ; turn off fan
N16360 M106 P2 S0 ; turn off remote part cooling fan
N16361 M106 P3 S0 ; turn off chamber cooling fan
N16362 
N16363 ; pull back filament to AMS
N16364 M620 S65535
N16365 T65535
N16366 G150.2
N16367 M621 S65535
N16368 
N16369 M620 S65279
N16370 T65279
N16371 G150.2
N16372 M621 S65279
N16373 
N16374 G150.3
N16375 
N16376 M1002 judge_flag timelapse_record_flag
N16377 M622 J1
N16378     M400 ; wait all motion done
N16379     M991 S0 P-1 ;end smooth timelapse at safe pos
N16380     M400 S5 ;wait for last picture to be taken
N16381 M623  ;end of "timelapse_record_flag"
N16382 
N16383 M104 S0 T0; turn off hotend
N16384 M104 S0 T1; turn off hotend
N16385 
N16386 M400 ; wait all motion done
N16387 M17 S
N16388 M17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom
N16389 
N16390     G1 Z112.6 F600
N16391     G1 Z110.6
N16392 
N16393 M400 P100
N16394 M17 R ; restore z current
N16395 
N16396 M220 S100  ; Reset feedrate magnitude
N16397 M201.2 K1.0 ; Reset acc magnitude
N16398 M73.2   R1.0 ;Reset left time magnitude
N16399 M1002 set_gcode_claim_speed_level : 0
N16400 
N16401 M1015.4 S0 K0 ;disable air printing detect
N16402 ;=====printer finish  sound=========
N16403 M17
N16404 M400 S1
N16405 M1006 S1
N16406 M1006 A53 B10 L99 C53 D10 M99 E53 F10 N99 
N16407 M1006 A57 B10 L99 C57 D10 M99 E57 F10 N99 
N16408 M1006 A0 B15 L0 C0 D15 M0 E0 F15 N0 
N16409 M1006 A53 B10 L99 C53 D10 M99 E53 F10 N99 
N16410 M1006 A57 B10 L99 C57 D10 M99 E57 F10 N99 
N16411 M1006 A0 B15 L0 C0 D15 M0 E0 F15 N0 
N16412 M1006 A48 B10 L99 C48 D10 M99 E48 F10 N99 
N16413 M1006 A0 B15 L0 C0 D15 M0 E0 F15 N0 
N16414 M1006 A60 B10 L99 C60 D10 M99 E60 F10 N99 
N16415 M1006 W
N16416 ;=====printer finish  sound=========
N16417 M400
N16418 M18
N16419 
N16420 M73 P100 R0
N16421 ; EXECUTABLE_BLOCK_END
N16422 
