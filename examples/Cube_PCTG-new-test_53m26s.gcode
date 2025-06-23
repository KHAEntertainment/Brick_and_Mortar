N1 ; HEADER_BLOCK_START
N2 ; BambuStudio 02.01.00.59
N3 ; model printing time: 43m 38s; total estimated time: 53m 26s
N4 ; total layer number: 63
N5 ; total filament length [mm] : 5030.75,119.74
N6 ; total filament volume [cm^3] : 12100.38,288.00
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
N736     G29 A1 O X154.814 Y114.041 I45.8708 J170.283
N737     M400
N738     M500 ; save cali data
N739 M623
N740     
N741 M622 J2
N742     M1002 gcode_claim_action : 1
N743     
N744         G29.20 A3
N745         G29 A1 O X154.814 Y114.041 I45.8708 J170.283
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
N905     ;G130 O0 F1.24725 L80 E5 D12 A154.814 B114.041 I45.8708 J170.283
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
N966 G1 X155.94 Y123.722 E.0274
N967 G1 X166.757 Y114.828 E.50563
N968 G1 X168.317 Y114.269 E.05985
N969 G1 X183.317 Y114.269 E.54159
N970 G1 X185.027 Y114.961 E.06659
N971 G1 X194.209 Y123.855 E.46158
N972 G1 X194.955 Y125.512 E.06558
N973 G1 X200.454 Y249.881 E4.49487
N974 G1 X200.457 Y281.638 E1.14663
N975 G1 X200.065 Y282.97 E.0501
N976 G1 X199.014 Y283.876 E.0501
N977 G1 X198 Y284.095 E.03748
N978 G1 X164.991 Y284.095 E1.19182
N979 G1 X163.659 Y283.704 E.0501
N980 G1 X162.753 Y282.653 E.0501
N981 G1 X162.544 Y281.869 E.0293
N982 G1 X155.054 Y202.285 E2.88615
N983 G1 X155.043 Y125.62 E2.76806
N984 G1 X155.418 Y124.347 E.04794
N985 ; OBJECT_ID: 229
N986 ; WIPE_START
N987 G1 X155.94 Y123.722 E-.30914
N988 G1 X156.856 Y122.969 E-.45086
N989 ; WIPE_END
N990 G1 E-.04 F1800
N991 ; start printing object, unique label id: 229
N992 M624 AQAAAAAAAAA=
N993 M204 S6000
N994 G1 X159.919 Y129.96 Z.6 F60000
N995 G1 X190.729 Y200.284 Z.6
N996 G1 Z.2
N997 G1 E.8 F1800
N998 ; FEATURE: Inner wall
N999 G1 F3000
N1000 M204 S500
N1001 G1 X159.271 Y200.284 E1.13581
N1002 G1 X159.271 Y127.391 E2.63184
N1003 G1 X190.729 Y127.391 E1.13581
N1004 G1 X190.729 Y200.224 E2.62968
N1005 M204 S6000
N1006 G1 X191.186 Y200.741 F60000
N1007 G1 F3000
N1008 M204 S500
N1009 G1 X158.814 Y200.741 E1.16881
N1010 G1 X158.814 Y126.934 E2.66485
N1011 G1 X191.186 Y126.934 E1.16881
N1012 G1 X191.186 Y200.681 E2.66268
N1013 M204 S6000
N1014 G1 X191.643 Y201.198 F60000
N1015 G1 F3000
N1016 M204 S500
N1017 G1 X158.357 Y201.198 E1.20182
N1018 G1 X158.357 Y126.477 E2.69786
N1019 G1 X191.643 Y126.477 E1.20182
N1020 G1 X191.643 Y201.138 E2.69569
N1021 M204 S6000
N1022 G1 X192.1 Y201.655 F60000
N1023 ; FEATURE: Outer wall
N1024 G1 F3000
N1025 M204 S500
N1026 G1 X157.9 Y201.655 E1.23483
N1027 M73 P19 R43
N1028 G1 X157.9 Y126.02 E2.73086
N1029 G1 X192.1 Y126.02 E1.23483
N1030 G1 X192.1 Y201.595 E2.7287
N1031 G1 E-.8 F1800
N1032 M204 S6000
N1033 G1 X191.844 Y193.967 Z.6 F60000
N1034 G1 X189.619 Y127.574 Z.6
N1035 G1 Z.2
N1036 G1 E.8 F1800
N1037 ; FEATURE: Bottom surface
N1038 ; LINE_WIDTH: 0.50125
N1039 G1 F3927.301
N1040 M204 S500
N1041 G1 X190.34 Y128.295 E.03691
N1042 G1 X190.34 Y128.943 E.02347
N1043 G1 X189.177 Y127.78 E.05957
N1044 G1 X188.529 Y127.78 E.02347
N1045 G1 X190.34 Y129.592 E.09276
N1046 G1 X190.34 Y130.24 E.02347
N1047 G1 X187.881 Y127.78 E.12594
N1048 G1 X187.232 Y127.78 E.02347
N1049 G1 X190.34 Y130.888 E.15913
N1050 G1 X190.34 Y131.536 E.02347
N1051 G1 X186.584 Y127.78 E.19232
N1052 G1 X185.936 Y127.78 E.02347
N1053 G1 X190.34 Y132.184 E.22551
N1054 G1 X190.34 Y132.832 E.02347
N1055 G1 X185.288 Y127.78 E.25869
N1056 G1 X184.64 Y127.78 E.02347
N1057 G1 X190.34 Y133.481 E.29188
N1058 G1 X190.34 Y134.129 E.02347
N1059 G1 X183.991 Y127.78 E.32507
N1060 G1 X183.343 Y127.78 E.02347
N1061 G1 X190.34 Y134.777 E.35826
N1062 G1 X190.34 Y135.425 E.02347
N1063 G1 X182.695 Y127.78 E.39144
N1064 G1 X182.047 Y127.78 E.02347
N1065 G1 X190.34 Y136.073 E.42463
N1066 G1 X190.34 Y136.721 E.02347
N1067 G1 X181.399 Y127.78 E.45782
N1068 G1 X180.751 Y127.78 E.02347
N1069 G1 X190.34 Y137.37 E.49101
N1070 G1 X190.34 Y138.018 E.02347
N1071 G1 X180.102 Y127.78 E.52419
N1072 G1 X179.454 Y127.78 E.02347
N1073 G1 X190.34 Y138.666 E.55738
N1074 G1 X190.34 Y139.314 E.02347
N1075 G1 X178.806 Y127.78 E.59057
N1076 G1 X178.158 Y127.78 E.02347
N1077 G1 X190.34 Y139.962 E.62376
N1078 G1 X190.34 Y140.611 E.02347
N1079 G1 X177.51 Y127.78 E.65694
N1080 G1 X176.862 Y127.78 E.02347
N1081 G1 X190.34 Y141.259 E.69013
N1082 G1 X190.34 Y141.907 E.02347
N1083 G1 X176.213 Y127.78 E.72332
N1084 G1 X175.565 Y127.78 E.02347
N1085 G1 X190.34 Y142.555 E.75651
N1086 G1 X190.34 Y143.203 E.02347
N1087 G1 X174.917 Y127.78 E.78969
N1088 G1 X174.269 Y127.78 E.02347
N1089 G1 X190.34 Y143.851 E.82288
N1090 G1 X190.34 Y144.5 E.02347
N1091 G1 X173.621 Y127.78 E.85607
N1092 G1 X172.972 Y127.78 E.02347
N1093 G1 X190.34 Y145.148 E.88926
N1094 G1 X190.34 Y145.796 E.02347
N1095 G1 X172.324 Y127.78 E.92244
N1096 G1 X171.676 Y127.78 E.02347
N1097 G1 X190.34 Y146.444 E.95563
N1098 G1 X190.34 Y147.092 E.02347
N1099 G1 X171.028 Y127.78 E.98882
N1100 G1 X170.38 Y127.78 E.02347
N1101 G1 X190.34 Y147.74 E1.02201
N1102 G1 X190.34 Y148.389 E.02347
N1103 G1 X169.732 Y127.78 E1.05519
N1104 G1 X169.083 Y127.78 E.02347
N1105 G1 X190.34 Y149.037 E1.08838
N1106 G1 X190.34 Y149.685 E.02347
N1107 G1 X168.435 Y127.78 E1.12157
N1108 G1 X167.787 Y127.78 E.02347
N1109 M73 P19 R42
N1110 G1 X190.34 Y150.333 E1.15476
N1111 G1 X190.34 Y150.981 E.02347
N1112 G1 X167.139 Y127.78 E1.18794
N1113 G1 X166.491 Y127.78 E.02347
N1114 G1 X190.34 Y151.63 E1.22113
N1115 G1 X190.34 Y152.278 E.02347
N1116 G1 X165.843 Y127.78 E1.25432
N1117 G1 X165.194 Y127.78 E.02347
N1118 G1 X190.34 Y152.926 E1.28751
N1119 G1 X190.34 Y153.574 E.02347
N1120 G1 X164.546 Y127.78 E1.32069
N1121 G1 X163.898 Y127.78 E.02347
N1122 G1 X190.34 Y154.222 E1.35388
N1123 G1 X190.34 Y154.87 E.02347
N1124 G1 X163.25 Y127.78 E1.38707
N1125 G1 X162.602 Y127.78 E.02347
N1126 G1 X190.34 Y155.519 E1.42026
N1127 G1 X190.34 Y156.167 E.02347
N1128 G1 X161.953 Y127.78 E1.45344
N1129 G1 X161.305 Y127.78 E.02347
N1130 G1 X190.34 Y156.815 E1.48663
N1131 G1 X190.34 Y157.463 E.02347
N1132 G1 X160.657 Y127.78 E1.51982
N1133 G1 X160.009 Y127.78 E.02347
N1134 G1 X190.34 Y158.111 E1.55301
N1135 G1 X190.34 Y158.759 E.02347
N1136 G1 X159.66 Y128.079 E1.57089
N1137 G1 X159.66 Y128.727 E.02347
N1138 G1 X190.34 Y159.408 E1.57089
N1139 G1 X190.34 Y160.056 E.02347
N1140 G1 X159.66 Y129.375 E1.57089
N1141 G1 X159.66 Y130.023 E.02347
N1142 G1 X190.34 Y160.704 E1.57089
N1143 G1 X190.34 Y161.352 E.02347
N1144 G1 X159.66 Y130.672 E1.57089
N1145 G1 X159.66 Y131.32 E.02347
N1146 G1 X190.34 Y162 E1.57089
N1147 G1 X190.34 Y162.649 E.02347
N1148 G1 X159.66 Y131.968 E1.57089
N1149 G1 X159.66 Y132.616 E.02347
N1150 M73 P20 R42
N1151 G1 X190.34 Y163.297 E1.57089
N1152 G1 X190.34 Y163.945 E.02347
N1153 G1 X159.66 Y133.264 E1.57089
N1154 G1 X159.66 Y133.912 E.02347
N1155 G1 X190.34 Y164.593 E1.57089
N1156 G1 X190.34 Y165.241 E.02347
N1157 G1 X159.66 Y134.561 E1.57089
N1158 G1 X159.66 Y135.209 E.02347
N1159 G1 X190.34 Y165.889 E1.57089
N1160 G1 X190.34 Y166.538 E.02347
N1161 G1 X159.66 Y135.857 E1.57089
N1162 G1 X159.66 Y136.505 E.02347
N1163 G1 X190.34 Y167.186 E1.57089
N1164 G1 X190.34 Y167.834 E.02347
N1165 G1 X159.66 Y137.153 E1.57089
N1166 G1 X159.66 Y137.802 E.02347
N1167 G1 X190.34 Y168.482 E1.57089
N1168 G1 X190.34 Y169.13 E.02347
N1169 G1 X159.66 Y138.45 E1.57089
N1170 G1 X159.66 Y139.098 E.02347
N1171 G1 X190.34 Y169.778 E1.57089
N1172 G1 X190.34 Y170.427 E.02347
N1173 G1 X159.66 Y139.746 E1.57089
N1174 G1 X159.66 Y140.394 E.02347
N1175 G1 X190.34 Y171.075 E1.57089
N1176 G1 X190.34 Y171.723 E.02347
N1177 G1 X159.66 Y141.042 E1.57089
N1178 G1 X159.66 Y141.691 E.02347
N1179 G1 X190.34 Y172.371 E1.57089
N1180 G1 X190.34 Y173.019 E.02347
N1181 G1 X159.66 Y142.339 E1.57089
N1182 G1 X159.66 Y142.987 E.02347
N1183 G1 X190.34 Y173.668 E1.57089
N1184 G1 X190.34 Y174.316 E.02347
N1185 G1 X159.66 Y143.635 E1.57089
N1186 G1 X159.66 Y144.283 E.02347
N1187 G1 X190.34 Y174.964 E1.57089
N1188 G1 X190.34 Y175.612 E.02347
N1189 G1 X159.66 Y144.932 E1.57089
N1190 G1 X159.66 Y145.58 E.02347
N1191 G1 X190.34 Y176.26 E1.57089
N1192 G1 X190.34 Y176.908 E.02347
N1193 G1 X159.66 Y146.228 E1.57089
N1194 G1 X159.66 Y146.876 E.02347
N1195 G1 X190.34 Y177.557 E1.57089
N1196 G1 X190.34 Y178.205 E.02347
N1197 G1 X159.66 Y147.524 E1.57089
N1198 G1 X159.66 Y148.172 E.02347
N1199 G1 X190.34 Y178.853 E1.57089
N1200 G1 X190.34 Y179.501 E.02347
N1201 G1 X159.66 Y148.821 E1.57089
N1202 G1 X159.66 Y149.469 E.02347
N1203 G1 X190.34 Y180.149 E1.57089
N1204 G1 X190.34 Y180.797 E.02347
N1205 M104 T0 S240 N0 ;Multi extruder pre heating
N1206 G1 X159.66 Y150.117 E1.57089
N1207 G1 X159.66 Y150.765 E.02347
N1208 G1 X190.34 Y181.446 E1.57089
N1209 G1 X190.34 Y182.094 E.02347
N1210 G1 X159.66 Y151.413 E1.57089
N1211 G1 X159.66 Y152.061 E.02347
N1212 G1 X190.34 Y182.742 E1.57089
N1213 G1 X190.34 Y183.39 E.02347
N1214 G1 X159.66 Y152.71 E1.57089
N1215 G1 X159.66 Y153.358 E.02347
N1216 G1 X190.34 Y184.038 E1.57089
N1217 G1 X190.34 Y184.687 E.02347
N1218 G1 X159.66 Y154.006 E1.57089
N1219 G1 X159.66 Y154.654 E.02347
N1220 G1 X190.34 Y185.335 E1.57089
N1221 G1 X190.34 Y185.983 E.02347
N1222 G1 X159.66 Y155.302 E1.57089
N1223 G1 X159.66 Y155.951 E.02347
N1224 G1 X190.34 Y186.631 E1.57089
N1225 G1 X190.34 Y187.279 E.02347
N1226 G1 X159.66 Y156.599 E1.57089
N1227 G1 X159.66 Y157.247 E.02347
N1228 G1 X190.34 Y187.927 E1.57089
N1229 G1 X190.34 Y188.576 E.02347
N1230 G1 X159.66 Y157.895 E1.57089
N1231 G1 X159.66 Y158.543 E.02347
N1232 M73 P21 R42
N1233 G1 X190.34 Y189.224 E1.57089
N1234 G1 X190.34 Y189.872 E.02347
N1235 G1 X159.66 Y159.191 E1.57089
N1236 G1 X159.66 Y159.84 E.02347
N1237 G1 X190.34 Y190.52 E1.57089
N1238 G1 X190.34 Y191.168 E.02347
N1239 G1 X159.66 Y160.488 E1.57089
N1240 G1 X159.66 Y161.136 E.02347
N1241 G1 X190.34 Y191.816 E1.57089
N1242 G1 X190.34 Y192.465 E.02347
N1243 G1 X159.66 Y161.784 E1.57089
N1244 G1 X159.66 Y162.432 E.02347
N1245 G1 X190.34 Y193.113 E1.57089
N1246 G1 X190.34 Y193.761 E.02347
N1247 G1 X159.66 Y163.08 E1.57089
N1248 G1 X159.66 Y163.729 E.02347
N1249 G1 X190.34 Y194.409 E1.57089
N1250 G1 X190.34 Y195.057 E.02347
N1251 G1 X159.66 Y164.377 E1.57089
N1252 G1 X159.66 Y165.025 E.02347
N1253 G1 X190.34 Y195.706 E1.57089
N1254 G1 X190.34 Y196.354 E.02347
N1255 G1 X159.66 Y165.673 E1.57089
N1256 G1 X159.66 Y166.321 E.02347
N1257 G1 X190.34 Y197.002 E1.57089
N1258 G1 X190.34 Y197.65 E.02347
N1259 G1 X159.66 Y166.97 E1.57089
N1260 G1 X159.66 Y167.618 E.02347
N1261 G1 X190.34 Y198.298 E1.57089
N1262 G1 X190.34 Y198.946 E.02347
N1263 G1 X159.66 Y168.266 E1.57089
N1264 G1 X159.66 Y168.914 E.02347
N1265 G1 X190.34 Y199.595 E1.57089
N1266 G1 X190.34 Y199.895 E.01088
N1267 M73 P21 R41
N1268 G1 X189.993 Y199.895 E.01259
N1269 G1 X159.66 Y169.562 E1.55308
N1270 G1 X159.66 Y170.21 E.02347
N1271 G1 X189.344 Y199.895 E1.51989
N1272 G1 X188.696 Y199.895 E.02347
N1273 G1 X159.66 Y170.859 E1.48671
N1274 G1 X159.66 Y171.507 E.02347
N1275 G1 X188.048 Y199.895 E1.45352
N1276 G1 X187.4 Y199.895 E.02347
N1277 G1 X159.66 Y172.155 E1.42033
N1278 G1 X159.66 Y172.803 E.02347
N1279 G1 X186.752 Y199.895 E1.38714
N1280 G1 X186.103 Y199.895 E.02347
N1281 G1 X159.66 Y173.451 E1.35396
N1282 G1 X159.66 Y174.099 E.02347
N1283 G1 X185.455 Y199.895 E1.32077
N1284 G1 X184.807 Y199.895 E.02347
N1285 G1 X159.66 Y174.748 E1.28758
N1286 G1 X159.66 Y175.396 E.02347
N1287 G1 X184.159 Y199.895 E1.25439
N1288 G1 X183.511 Y199.895 E.02347
N1289 G1 X159.66 Y176.044 E1.22121
N1290 G1 X159.66 Y176.692 E.02347
N1291 G1 X182.863 Y199.895 E1.18802
N1292 G1 X182.214 Y199.895 E.02347
N1293 G1 X159.66 Y177.34 E1.15483
N1294 G1 X159.66 Y177.989 E.02347
N1295 G1 X181.566 Y199.895 E1.12164
N1296 G1 X180.918 Y199.895 E.02347
N1297 G1 X159.66 Y178.637 E1.08846
N1298 G1 X159.66 Y179.285 E.02347
N1299 G1 X180.27 Y199.895 E1.05527
N1300 G1 X179.622 Y199.895 E.02347
N1301 G1 X159.66 Y179.933 E1.02208
N1302 G1 X159.66 Y180.581 E.02347
N1303 G1 X178.974 Y199.895 E.98889
N1304 G1 X178.325 Y199.895 E.02347
N1305 G1 X159.66 Y181.229 E.95571
N1306 G1 X159.66 Y181.878 E.02347
N1307 G1 X177.677 Y199.895 E.92252
N1308 G1 X177.029 Y199.895 E.02347
N1309 G1 X159.66 Y182.526 E.88933
N1310 G1 X159.66 Y183.174 E.02347
N1311 G1 X176.381 Y199.895 E.85614
N1312 G1 X175.733 Y199.895 E.02347
N1313 G1 X159.66 Y183.822 E.82296
N1314 G1 X159.66 Y184.47 E.02347
N1315 G1 X175.084 Y199.895 E.78977
N1316 G1 X174.436 Y199.895 E.02347
N1317 G1 X159.66 Y185.118 E.75658
N1318 G1 X159.66 Y185.767 E.02347
N1319 G1 X173.788 Y199.895 E.72339
N1320 G1 X173.14 Y199.895 E.02347
N1321 G1 X159.66 Y186.415 E.69021
N1322 G1 X159.66 Y187.063 E.02347
N1323 G1 X172.492 Y199.895 E.65702
N1324 G1 X171.844 Y199.895 E.02347
N1325 G1 X159.66 Y187.711 E.62383
N1326 G1 X159.66 Y188.359 E.02347
N1327 G1 X171.195 Y199.895 E.59064
N1328 G1 X170.547 Y199.895 E.02347
N1329 G1 X159.66 Y189.008 E.55746
N1330 G1 X159.66 Y189.656 E.02347
N1331 M73 P22 R41
N1332 G1 X169.899 Y199.895 E.52427
N1333 G1 X169.251 Y199.895 E.02347
N1334 G1 X159.66 Y190.304 E.49108
N1335 G1 X159.66 Y190.952 E.02347
N1336 G1 X168.603 Y199.895 E.45789
N1337 G1 X167.955 Y199.895 E.02347
N1338 G1 X159.66 Y191.6 E.42471
N1339 G1 X159.66 Y192.248 E.02347
N1340 G1 X167.306 Y199.895 E.39152
N1341 G1 X166.658 Y199.895 E.02347
N1342 G1 X159.66 Y192.897 E.35833
N1343 G1 X159.66 Y193.545 E.02347
N1344 G1 X166.01 Y199.895 E.32514
N1345 G1 X165.362 Y199.895 E.02347
N1346 G1 X159.66 Y194.193 E.29196
N1347 G1 X159.66 Y194.841 E.02347
N1348 G1 X164.714 Y199.895 E.25877
N1349 G1 X164.065 Y199.895 E.02347
N1350 G1 X159.66 Y195.489 E.22558
N1351 G1 X159.66 Y196.137 E.02347
N1352 G1 X163.417 Y199.895 E.19239
N1353 G1 X162.769 Y199.895 E.02347
N1354 G1 X159.66 Y196.786 E.15921
N1355 G1 X159.66 Y197.434 E.02347
N1356 G1 X162.121 Y199.895 E.12602
N1357 G1 X161.473 Y199.895 E.02347
N1358 G1 X159.66 Y198.082 E.09283
N1359 G1 X159.66 Y198.73 E.02347
N1360 G1 X160.825 Y199.895 E.05964
N1361 G1 X160.176 Y199.895 E.02347
N1362 G1 X159.454 Y199.173 E.03699
N1363 ; WIPE_START
N1364 G1 X160.176 Y199.895 E-.38822
N1365 G1 X160.825 Y199.895 E-.2463
N1366 G1 X160.591 Y199.662 E-.12548
N1367 ; WIPE_END
N1368 G1 E-.04 F1800
N1369 M204 S6000
N1370 G17
N1371 G3 Z.6 I1.217 J0 P1  F60000
N1372 ; stop printing object, unique label id: 229
N1373 M625
N1374 ; object ids of layer 1 start: 229,239
N1375 M624 AwAAAAAAAAA=
N1376 ;======== H2D 20250527========
N1377 ; SKIPPABLE_START
N1378 ; SKIPTYPE: timelapse
N1379 M622.1 S1 ; for prev firware, default turned on
N1380 
N1381 M1002 judge_flag timelapse_record_flag
N1382 
N1383 M622 J1
N1384 M993 A2 B2 C2
N1385 M993 A0 B0 C0
N1386 
N1387 
N1388 
N1389 
N1390     M9711 M0 E1 X260 Y141 Z0.6 S11 C10 O0 T3000
N1391 
N1392 
N1393 
N1394 M993 A3 B3 C3
N1395 
N1396 M623
N1397 ; SKIPPABLE_END
N1398 
N1399 ; object ids of this layer1 end: 229,239
N1400 M625
N1401 G1 X195.495 Y279.064
N1402 G1 Z.2
N1403 G1 E.8 F1800
N1404 ; LAYER_HEIGHT: 0.200000
N1405 ; FEATURE: Prime tower
N1406 ; LINE_WIDTH: 0.500000
N1407 ; WIPE_TOWER_START
N1408 M204 S6000
N1409 G1  X195.995 Y279.564  
N1410 M204 S500
N1411 G3  X193.533 Y281.605   I-4.373 J-2.768 E0.1236 F3000
N1412 G3  X190.885 Y280.355   I0.012 J-3.454 E0.1149
N1413 G2  X188.182 Y279.564   I-2.709 J4.247 E0.1085
N1414 G2  X174.618 Y279.568   I-6.687 J357.435 E0.5155
N1415 G2  X170.683 Y281.445   I0.499 J6.110 E0.1694
N1416 G3  X168.371 Y281.015   I-0.854 J-1.838 E0.0953
N1417 G1  X166.995 Y279.564   E0.0760
N1418 G3  X165.064 Y277.242   I3.871 J-5.183 E0.1159
N1419 G3  X166.240 Y274.649   I2.902 J-0.247 E0.1130
N1420 G2  X166.995 Y272.245   I-3.465 J-2.409 E0.0972
N1421 G2  X166.992 Y259.212   I-321.195 J-6.431 E0.4954
N1422 G2  X165.146 Y255.634   I-6.663 J1.171 E0.1554
N1423 G3  X165.661 Y253.471   I1.721 J-0.733 E0.0905
N1424 G1 E-0.8000 F1800
N1425 M204 S6000
N1426 G1  X167.381 Y251.657   F600
N1427 G1 E0.8000 F1800
N1428 M204 S500
N1429 G3  X170.238 Y250.033   I2.765 J1.539 E0.1313 F3000
N1430 G3  X172.775 Y251.633   I-12.405 J22.473 E0.1141
N1431 G2  X174.808 Y252.064   I2.042 J-4.626 E0.0796
N1432 G2  X188.372 Y252.060   I6.687 J-357.435 E0.5155
N1433 G2  X192.307 Y250.183   I-0.499 J-6.110 E0.1694
N1434 G3  X194.619 Y250.613   I0.854 J1.838 E0.0953
N1435 G1  X195.995 Y252.064   E0.0760
N1436 G1 E0.0000
N1437 G3  X197.926 Y254.386   I-3.871 J5.182 E0.1159
N1438 G3  X196.750 Y256.979   I-2.902 J0.247 E0.1130
N1439 G2  X195.995 Y259.382   I3.464 J2.409 E0.0972
N1440 G2  X195.998 Y272.416   I321.212 J6.432 E0.4954
N1441 G2  X197.844 Y275.994   I6.663 J-1.171 E0.1554
N1442 G3  X197.504 Y277.972   I-1.658 J0.734 E0.0808
N1443 G1  X195.995 Y279.564   E0.0834
N1444 ; WIPE_TOWER_END
N1445 G1  X195.495 Y252.064  
N1446 ; LAYER_HEIGHT: 0.200000
N1447 ; FEATURE: Prime tower
N1448 ; LINE_WIDTH: 0.500000
N1449 ; WIPE_TOWER_START
N1450 M204 S500
N1451 G1  X167.495  E1.0642
N1452 G1  Y272.314  E0.2565
N1453 G1  X195.495  E1.0642
N1454 G1  Y279.064  E0.2565
N1455 M204 S6000
N1456 G1  X168.495 Y272.314  
N1457 ;--------------------
N1458 ; CP EMPTY GRID START
N1459 ; layer #2
N1460 M204 S500
N1461 G1  Y272.814  E0.0190
N1462 G1  X194.995  E1.0072
N1463 G1  Y273.337  E0.0199
N1464 G1  X167.995  E1.0262
N1465 G1  Y273.859  E0.0199
N1466 G1  X194.995  E1.0262
N1467 G1  Y274.382  E0.0199
N1468 G1  X167.995  E1.0262
N1469 G1  Y274.905  E0.0199
N1470 G1  X194.995  E1.0262
N1471 G1  Y275.428  E0.0199
N1472 G1  X167.995  E1.0262
N1473 G1  Y275.950  E0.0199
N1474 G1  X194.995  E1.0262
N1475 G1  Y276.473  E0.0199
N1476 G1  X167.995  E1.0262
N1477 G1  Y276.996  E0.0199
N1478 G1  X194.995  E1.0262
N1479 G1  Y277.519  E0.0199
N1480 G1  X167.995  E1.0262
N1481 G1  Y278.041  E0.0199
N1482 G1  X194.995  E1.0262
N1483 G1  Y278.564  E0.0199
N1484 G1  X167.995  E1.0262
N1485 G1  Y279.064  E0.0190
N1486 ; CP EMPTY GRID END
N1487 ;------------------
N1488 
N1489 
N1490 
N1491 
N1492 
N1493 
N1494 ; WIPE_TOWER_END
N1495 ; LAYER_HEIGHT: 0.200000
N1496 ; FEATURE: Prime tower
N1497 ; LINE_WIDTH: 0.500000
N1498 ;--------------------
N1499 ; CP TOOLCHANGE START
N1500 ; toolchange #1
N1501 ; material : TPU -> TPU
N1502 ;--------------------
N1503 M220 B
N1504 M220 S100
N1505 ; WIPE_TOWER_START
N1506 G1 E-.8 F1800
N1507 G17
N1508 G3 Z.6 I1.217 J0 P1  F60000
N1509 G1 X167.745 Y266.314 Z.2
N1510 G1 E.8 F1800
N1511 ; LAYER_HEIGHT: 0.200000
N1512 ; FEATURE: Prime tower
N1513 ; LINE_WIDTH: 1.000000
N1514 ; NOZZLE_CHANGE_START OF0 NF1
N1515 M204 S500
N1516 G1  X195.245 Y266.314  E2.1885 F1881
N1517 G1  Y267.314  E0.0796
N1518 G1  X167.745  E2.1885
N1519 G1  Y268.314  E0.0796
N1520 G1  X195.245  E2.1885
N1521 G1  Y269.314  E0.0796
N1522 G1  X167.745  E2.1885
N1523 G1  Y270.314  E0.0796
N1524 G1  X195.245  E2.1885
N1525 G1  Y271.314  E0.0796
N1526 G1  X167.745  E2.1885
N1527 ; NOZZLE_CHANGE_END OF0 NF1
N1528 M104 T1 S89 N0 ;Multi extruder pre cooling
N1529 
N1530 ; WIPE_START
N1531 G1 F5400
N1532 M204 S500
N1533 G1 X169.745 Y271.314 E-1.9
N1534 ; WIPE_END
N1535 G1 E-.1 F1800
N1536 M204 S6000
N1537 G17
N1538 G3 Z.6 I1.217 J0 P1  F5400
N1539 ; filament end gcode 
N1540 
N1541 ;======== H2D ========
N1542 ;===== 20250604 =====
N1543 M993 A2 B2 C2 ; nozzle cam detection allow status save.
N1544 M993 A0 B0 C0 ; nozzle cam detection not allowed.
N1545 
N1546 
N1547 M1015.4 S0 ; disable E air printing detect
N1548 
N1549 
N1550 M620 S1A
N1551 M1002 gcode_claim_action : 4
N1552 M204 S9000
N1553 
N1554 G1 Z3.2 F1200
N1555 
N1556 M400
N1557 M106 P1 S0
N1558 M106 P2 S0
N1559 
N1560 
N1561 
N1562 
N1563 M620.10 A0 F149.669 L0 H0.4 T270 P255 S1
N1564 
N1565 
N1566 
N1567 M620.10 A1 F79.8237 L0 H0.4 T250 P240 S1
N1568 
N1569 
N1570 
N1571 M620.11 P0 I0 E0
N1572 
N1573 
N1574 
N1575 M620.11 K1 I0 R10 F200
N1576 
N1577 
N1578 M628 S1
N1579 
N1580 
N1581 M620.11 S1 L0 I0 R10 D8 E-10 F200
N1582 
N1583 
N1584 M629
N1585 
N1586 
N1587 M620.11 H2 C331
N1588 
N1589 
N1590 T1
N1591 M73 E5
N1592 
N1593 ;deretract
N1594 
N1595 
N1596 
N1597 ; VFLUSH_START
N1598 
N1599 
N1600 ;VG1 E0 F79
N1601 
N1602 
N1603 SYNC T0
N1604 
N1605 ; VFLUSH_END
N1606 
N1607 M1002 set_filament_type:TPU
N1608 
N1609 M400
N1610 M83
N1611 
N1612 
N1613 
N1614 M628 S0
N1615 ;VM109 S240
N1616 M629
N1617 M400
N1618 
N1619 M983.3 F1.33333 A0.4
N1620 
N1621 
N1622 M400
N1623 
N1624 G1 Y320 F30000
N1625 G1 X201
N1626 
N1627 M73 P23 R40
N1628 G1 Y295
N1629 G1 Y265 F18000
N1630 G1 Z3.2 F3000
N1631 
N1632 M204 S500
N1633 
N1634 
N1635 M621 S1A
N1636 
N1637 M993 A3 B3 C3 ; nozzle cam detection allow status restore.
N1638 
N1639 
N1640 M1015.3 S1;enable tpu clog detect
N1641 
N1642 
N1643 
N1644 M1015.4 S0 ; disable E air printing detect
N1645 
N1646 
N1647 M620.6 I1 W1 ;enable ams air printing detect
N1648 M1002 gcode_claim_action : 0
N1649 M106 S0
N1650 M106 P2 S0
N1651 G1 X200 Y264.673 F60000
N1652 G1 Z.2
N1653 G1 X200 Y257.04 Z.6
N1654 G1 X200 Y247.99 Z.6
N1655 G1 X162.991 Y247.99
N1656 G1 X162.991 Y252.564
N1657 G1 X167.495 Y252.564
N1658 
N1659 ; filament start gcode
N1660 G1 Z.2
N1661 
N1662 G4 S0
N1663 ; CP TOOLCHANGE WIPE
N1664 ; LINE_WIDTH: 0.500000
N1665 ; LINE_WIDTH: 0.575000
N1666 M204 S500
N1667 G1  X170.495 Y252.564  E0.1311 F990
N1668 G1 E-0.8000 F1800
N1669 M204 S6000
N1670 G1  X165.995  F600
N1671 G1  X167.495  F240
N1672 G1  X167.995  F600
N1673 G1  Y253.064 
N1674 M73 P24 R40
N1675 G1  X166.995 
N1676 G1  Y252.064 
N1677 G1  X168.495 
N1678 G1  Y253.564 
N1679 G1  X166.495 
N1680 G1  Y251.564 
N1681 G1  X170.495 Y252.564   F990
N1682 G1 E0.8000 F1800
N1683 M204 S500
N1684 G1  X195.495  E1.0927 F990
N1685 G1  Y253.064  E0.0219
N1686 G1  X167.495  E1.2238 F1125
N1687 G1  Y253.564  E0.0219
N1688 G1  X195.495  E1.2238 F1374
N1689 G1  Y254.064  E0.0219
N1690 G1  X167.495  E1.2238 F1826
N1691 G1  Y254.564  E0.0219
N1692 G1  X195.495  E1.2238
N1693 G1  Y255.064  E0.0219
N1694 G1  X167.495  E1.2238
N1695 G1  Y255.564  E0.0219
N1696 G1  X195.495  E1.2238
N1697 G1  Y256.064  E0.0219
N1698 G1  X167.495  E1.2238
N1699 G1  Y256.564  E0.0219
N1700 G1  X195.495  E1.2238
N1701 G1  Y257.064  E0.0219
N1702 G1  X167.495  E1.2238
N1703 G1  Y257.564  E0.0219
N1704 G1  X195.495  E1.2238
N1705 G1  Y258.064  E0.0219
N1706 G1  X167.495  E1.2238
N1707 G1  Y258.564  E0.0219
N1708 G1  X195.495  E1.2238
N1709 G1  Y259.064  E0.0219
N1710 G1  X167.495  E1.2238
N1711 G1  Y259.564  E0.0219
N1712 G1  X195.495  E1.2238
N1713 G1  Y260.064  E0.0219
N1714 G1  X167.495  E1.2238
N1715 G1  Y260.564  E0.0219
N1716 G1  X195.495  E1.2238
N1717 G1  Y261.064  E0.0219
N1718 G1  X167.495  E1.2238
N1719 G1  Y261.564  E0.0219
N1720 G1  X195.495  E1.2238
N1721 G1  Y262.064  E0.0219
N1722 G1  X167.495  E1.2238
N1723 G1  Y262.564  E0.0219
N1724 G1  X195.495  E1.2238
N1725 G1  Y263.064  E0.0219
N1726 G1  X167.495  E1.2238
N1727 G1  Y263.564  E0.0219
N1728 G1  X195.495  E1.2238
N1729 G1  Y264.064  E0.0219
N1730 G1  X167.495  E1.2238
N1731 G1  Y264.564  E0.0219
N1732 G1  X195.495  E1.2238
N1733 G1  Y265.064  E0.0219
N1734 G1  X167.495  E1.2238
N1735 G1  Y265.564  E0.0219
N1736 G1  X195.495  E1.2238
N1737 ; LINE_WIDTH: 0.500000
N1738 ; WIPE_TOWER_END
N1739 M220 R
N1740 G1 F60000
N1741 G4 S0
N1742 G92 E0
N1743 ; CP TOOLCHANGE END
N1744 ;------------------
N1745 
N1746 
N1747 
N1748 ; WIPE_START
N1749 G1 F5400
N1750 M204 S500
N1751 G1 X193.495 Y265.564 E-.76
N1752 ; WIPE_END
N1753 G1 E-.04 F1800
N1754 M204 S6000
N1755 G17
N1756 G3 Z.6 I1.217 J0 P1  F60000
N1757 ; OBJECT_ID: 239
N1758 ; start printing object, unique label id: 239
N1759 M624 AgAAAAAAAAA=
N1760 G1 X183.067 Y117.476 Z.2
N1761 G1 E.8 F1800
N1762 ; FEATURE: Outer wall
N1763 ; LINE_WIDTH: 0.5
N1764 ; LAYER_HEIGHT: 0.2
N1765 G1 F2100.29
N1766 M204 S500
N1767 G1 X168.567 Y117.476 E.55109
N1768 G1 X168.567 Y116.976 E.019
N1769 G1 X183.067 Y116.976 E.55109
N1770 G1 X183.067 Y117.416 E.01672
N1771 ; CHANGE_LAYER
N1772 ; Z_HEIGHT: 0.4
N1773 ; LAYER_HEIGHT: 0.2
N1774 ; WIPE_START
N1775 G1 F2100.29
N1776 G1 X181.067 Y117.424 E-.76
N1777 ; WIPE_END
N1778 G1 E-.04 F1800
N1779 ; stop printing object, unique label id: 239
N1780 M625
N1781 ;======== H2D 20250521========
N1782 ; layer num/total_layer_count: 2/63
N1783 ; update layer progress
N1784 M73 L2
N1785 M991 S0 P1 ;notify layer change
N1786 
N1787 
N1788 M106 S255
N1789 M106 P2 S255
N1790 ; open powerlost recovery
N1791 M1003 S1
N1792 ; OBJECT_ID: 239
N1793 ; start printing object, unique label id: 239
N1794 M624 AgAAAAAAAAA=
N1795 M204 S10000
N1796 G17
N1797 G3 Z.6 I-.055 J1.216 P1  F60000
N1798 G1 X183.107 Y117.516 Z.6
N1799 G1 Z.4
N1800 G1 E.8 F1800
N1801 ; FEATURE: Outer wall
N1802 ; LINE_WIDTH: 0.42
N1803 ; LAYER_HEIGHT: 0.2
N1804 G1 F2545.881
N1805 M204 S5000
N1806 G1 X168.527 Y117.516 E.45715
N1807 G1 X168.527 Y116.936 E.01819
N1808 G1 X183.107 Y116.936 E.45715
N1809 G1 X183.107 Y117.456 E.0163
N1810 M204 S10000
N1811 M73 P25 R40
N1812 G1 X182.911 Y117.226 F60000
N1813 ; FEATURE: Gap infill
N1814 ; LINE_WIDTH: 0.23088
N1815 G1 F5107.47
N1816 M204 S8000
N1817 G1 X168.723 Y117.226 E.22174
N1818 ; WIPE_START
N1819 G1 X170.723 Y117.226 E-.76
N1820 ; WIPE_END
N1821 G1 E-.04 F1800
N1822 ; stop printing object, unique label id: 239
N1823 M625
N1824 M204 S10000
N1825 G17
N1826 G3 Z.8 I-1.2 J.2 P1  F60000
N1827 G1 X195.495 Y265.564 Z.8
N1828 G1 Z.4
N1829 G1 E.8 F1800
N1830 ; LAYER_HEIGHT: 0.200000
N1831 ; FEATURE: Prime tower
N1832 ; LINE_WIDTH: 0.500000
N1833 ; WIPE_TOWER_START
N1834 M204 S8000
N1835 G1  X167.495 Y265.564  E1.0642 F2100
N1836 G1  Y260.064  E0.2090
N1837 G1  X195.495  E1.0642
N1838 G1  Y265.564  E0.2090
N1839 M204 S10000
N1840 G1  X168.495 Y260.064  
N1841 ;--------------------
N1842 ; CP EMPTY GRID START
N1843 ; layer #3
N1844 M204 S8000
N1845 G1  Y265.564  E0.2090
N1846 M204 S10000
N1847 G1  X177.162 
N1848 M204 S8000
N1849 G1  Y260.064  E0.2090
N1850 M204 S10000
N1851 G1  X185.828 
N1852 M204 S8000
N1853 G1  Y265.564  E0.2090
N1854 M204 S10000
N1855 G1  X194.495 
N1856 M204 S8000
N1857 G1  Y260.064  E0.2090
N1858 ; CP EMPTY GRID END
N1859 ;------------------
N1860 
N1861 
N1862 
N1863 
N1864 
N1865 
N1866 ; WIPE_TOWER_END
N1867 ; LAYER_HEIGHT: 0.200000
N1868 ; FEATURE: Prime tower
N1869 ; LINE_WIDTH: 0.500000
N1870 ;--------------------
N1871 ; CP TOOLCHANGE START
N1872 ; toolchange #2
N1873 ; material : PCTG -> PCTG
N1874 ;--------------------
N1875 M220 B
N1876 M220 S100
N1877 ; WIPE_TOWER_START
N1878 G1 E-.8 F1800
N1879 G17
N1880 G3 Z.8 I1.217 J0 P1  F60000
N1881 G1 X167.745 Y252.814
N1882 G1 Z.4
N1883 G1 E.8 F1800
N1884 ; LAYER_HEIGHT: 0.200000
N1885 ; FEATURE: Prime tower
N1886 ; LINE_WIDTH: 1.000000
N1887 ; NOZZLE_CHANGE_START OF1 NF0
N1888 M104 T0 S210 N0 ;Multi extruder pre cooling in post extrusion
N1889 M204 S8000
N1890 G1  X195.245 Y252.814  E2.1885 F251
N1891 G1  Y254.314  E0.1194
N1892 M104 T1 S255 N0 ;Multi extruder pre heating
N1893 M73 P25 R39
N1894 G1  X167.745  E2.1885
N1895 G1  Y255.814  E0.1194
N1896 G1  X195.245  E2.1885
N1897 G1  Y257.314  E0.1194
N1898 G1  X167.745  E2.1885
N1899 G1  Y258.814  E0.1194
N1900 G1  X195.245  E2.1885
N1901 M204 S10000
N1902 G1  Y259.814 
N1903 M73 P26 R39
N1904 G1  X168.245  F398
N1905 G1  Y258.314 
N1906 G1  X194.745 
N1907 G1  Y256.814 
N1908 G1  X168.245 
N1909 G1  Y255.314 
N1910 G1  X194.745 
N1911 G1  Y253.814 
N1912 G1  X168.245 
N1913 ; NOZZLE_CHANGE_END OF1 NF0
N1914 M104 T0 S0 N0 ;Multi extruder pre cooling
N1915 
N1916 G1 E-2 F1800
N1917 G17
N1918 G3 Z.8 I1.217 J0 P1  F5400
N1919 ; filament end gcode 
N1920 
N1921 ;======== H2D ========
N1922 ;===== 20250604 =====
N1923 M993 A2 B2 C2 ; nozzle cam detection allow status save.
N1924 M993 A0 B0 C0 ; nozzle cam detection not allowed.
N1925 
N1926 
N1927 M1015.4 S0 ; disable E air printing detect
N1928 
N1929 
N1930 M620 S0A
N1931 M1002 gcode_claim_action : 4
N1932 M204 S9000
N1933 
N1934 G1 Z3.4 F1200
N1935 
N1936 M400
N1937 M106 P1 S0
N1938 M106 P2 S0
N1939 
N1940 
N1941 ; get travel path for change filament
N1942 ;M620.1 X54 Y0 F21000 P0
N1943 ;M620.1 X54 Y0 F21000 P1
N1944 ;M620.1 X54 Y245 F21000 P2
N1945 
N1946 
N1947 
N1948 M620.10 A0 F79.8237 L0 H0.4 T250 P240 S1
N1949 
N1950 
N1951 
N1952 M620.10 A1 F149.669 L0 H0.4 T270 P255 S1
N1953 
N1954 
N1955 
N1956 M620.11 P0 I1 E0
N1957 
N1958 
N1959 
N1960 M620.11 K1 I1 R0 F200
N1961 
N1962 
N1963 M628 S1
N1964 
N1965 M620.11 S0 L0 I1 E-10 F200
N1966 
N1967 M629
N1968 
N1969 
N1970 M620.11 H2 C331
N1971 
N1972 
N1973 T0
N1974 M73 E4
N1975 
N1976 ;deretract
N1977 
N1978 
N1979 ;VG1 E4 F200
N1980 ;VG1 E4 F100
N1981 
N1982 
N1983 
N1984 ; VFLUSH_START
N1985 
N1986 
N1987 ;VG1 E0 F79
N1988 
N1989 
N1990 SYNC T0
N1991 
N1992 ; VFLUSH_END
N1993 
N1994 M1002 set_filament_type:PCTG
N1995 
N1996 M400
N1997 M83
N1998 
N1999 
N2000 
N2001 M628 S0
N2002 ;VM109 S255
N2003 M629
N2004 M400
N2005 
N2006 M983.3 F2.5 A0.4
N2007 
N2008 
N2009 M400
N2010 
N2011 M73 P27 R38
N2012 G1 Y320 F30000
N2013 G1 X201
N2014 
N2015 G1 Y295
N2016 G1 Y265 F18000
N2017 G1 Z3.4 F3000
N2018 
N2019 M204 S8000
N2020 
N2021 
N2022 M621 S0A
N2023 
N2024 M993 A3 B3 C3 ; nozzle cam detection allow status restore.
N2025 
N2026 
N2027 M1015.3 S0;disable tpu clog detect
N2028 
N2029 
N2030 
N2031 M1015.4 S0 ; disable E air printing detect
N2032 
N2033 
N2034 M620.6 I0 W1 ;enable ams air printing detect
N2035 M1002 gcode_claim_action : 0
N2036 M106 S0
N2037 M106 P2 S0
N2038 G1 X200 Y278.814 F60000
N2039 G1 Z.4
N2040 G1 X195.495 Y278.814 Z.8
N2041 
N2042 ; filament start gcode
N2043 G1 Z.4
N2044 G1 E2 F1800
N2045 
N2046 G4 S0
N2047 ; CP TOOLCHANGE WIPE
N2048 ; LINE_WIDTH: 0.500000
N2049 M204 S8000
N2050 G1  X192.495 Y278.814  E0.1140 F1782
N2051 G1 E-0.8000 F1800
N2052 M204 S10000
N2053 G1  X196.995  F600
N2054 G1  X195.495  F240
N2055 G1  X195.995  F600
N2056 G1  Y279.314 
N2057 G1  X194.995 
N2058 G1  Y278.314 
N2059 G1  X196.495 
N2060 G1  Y279.814 
N2061 G1  X194.495 
N2062 G1  Y277.814 
N2063 G1  X192.495 Y278.814   F1782
N2064 G1 E0.8000 F1800
N2065 M204 S8000
N2066 G1  X167.495  E0.9502 F1782
N2067 G1  Y278.064  E0.0285
N2068 G1  X195.495  E1.0642 F2025
N2069 G1  Y277.314  E0.0285
N2070 G1  X167.495  E1.0642 F2473
N2071 G1  Y276.564  E0.0285
N2072 G1  X195.495  E1.0642 F3938
N2073 G1  Y275.814  E0.0285
N2074 G1  X167.495  E1.0642
N2075 G1  Y275.064  E0.0285
N2076 G1  X195.495  E1.0642
N2077 G1  Y274.314  E0.0285
N2078 G1  X167.495  E1.0642
N2079 G1  Y273.564  E0.0285
N2080 G1  X195.495  E1.0642
N2081 G1  Y272.814  E0.0285
N2082 G1  X167.495  E1.0642
N2083 G1  Y272.064  E0.0285
N2084 G1  X195.495  E1.0642
N2085 G1  Y271.314  E0.0285
N2086 G1  X167.495  E1.0642
N2087 G1  Y270.564  E0.0285
N2088 G1  X195.495  E1.0642
N2089 G1  Y269.814  E0.0285
N2090 G1  X167.495  E1.0642
N2091 G1  Y269.064  E0.0285
N2092 G1  X195.495  E1.0642
N2093 G1  Y268.314  E0.0285
N2094 G1  X167.495  E1.0642
N2095 G1  Y267.564  E0.0285
N2096 G1  X195.495  E1.0642
N2097 G1  Y266.814  E0.0285
N2098 G1  X167.495  E1.0642
N2099 G1  Y266.064  E0.0285
N2100 G1  X195.495  E1.0642
N2101 ; WIPE_TOWER_END
N2102 M220 R
N2103 G1 F60000
N2104 G4 S0
N2105 G92 E0
N2106 ; CP TOOLCHANGE END
N2107 ;------------------
N2108 
N2109 
N2110 G1  Y252.064  
N2111 ; LAYER_HEIGHT: 0.200000
N2112 ; FEATURE: Prime tower
N2113 ; LINE_WIDTH: 0.500000
N2114 ; WIPE_TOWER_START
N2115 M204 S10000
N2116 G1  X195.846 Y279.721  
N2117 M204 S8000
N2118 G3  X193.064 Y281.636   I-3.469 J-2.060 E0.1325 F3938
N2119 G3  X190.723 Y280.255   I1.448 J-5.129 E0.1045
N2120 G2  X188.182 Y279.564   I-2.568 J4.426 E0.1012
N2121 G2  X174.618 Y279.568   I-6.687 J357.435 E0.5155
N2122 G2  X170.683 Y281.445   I0.499 J6.110 E0.1694
N2123 G3  X168.371 Y281.015   I-0.854 J-1.838 E0.0953
N2124 G1  X166.995 Y279.564   E0.0760
N2125 G3  X165.064 Y277.242   I3.871 J-5.183 E0.1159
N2126 G3  X166.240 Y274.649   I2.902 J-0.247 E0.1130
N2127 G2  X166.995 Y272.245   I-3.465 J-2.409 E0.0972
N2128 G2  X166.992 Y259.212   I-321.195 J-6.431 E0.4954
N2129 G2  X165.146 Y255.634   I-6.663 J1.171 E0.1554
N2130 G3  X165.485 Y253.656   I1.658 J-0.734 E0.0808
N2131 G1  X168.371 Y250.613   E0.1594
N2132 G3  X171.793 Y251.056   I1.525 J1.652 E0.1495
N2133 G2  X174.808 Y252.064   I3.021 J-4.025 E0.1229
N2134 G2  X188.372 Y252.060   I6.687 J-357.435 E0.5155
N2135 G2  X192.307 Y250.183   I-0.499 J-6.110 E0.1694
N2136 G3  X194.619 Y250.613   I0.854 J1.838 E0.0953
N2137 G1  X195.995 Y252.064   E0.0760
N2138 G3  X197.926 Y254.386   I-3.871 J5.182 E0.1159
N2139 G3  X196.750 Y256.979   I-2.902 J0.247 E0.1130
N2140 G2  X195.995 Y259.382   I3.464 J2.409 E0.0972
N2141 G2  X195.998 Y272.416   I321.212 J6.432 E0.4954
N2142 G2  X197.844 Y275.994   I6.663 J-1.171 E0.1554
N2143 G3  X197.564 Y277.905   I-1.654 J0.733 E0.0774
N2144 ; WIPE_TOWER_END
N2145 
N2146 ; WIPE_START
N2147 G1 F5107.47
N2148 M204 S8000
N2149 G1 X197.598 Y277.866 E-.01975
N2150 G1 X197.683 Y277.752 E-.0539
N2151 G1 X197.759 Y277.632 E-.05389
N2152 G1 X197.825 Y277.506 E-.0539
N2153 G1 X197.88 Y277.376 E-.0539
N2154 G1 X197.926 Y277.242 E-.05389
N2155 G1 X197.961 Y277.104 E-.0539
N2156 G1 X197.985 Y276.964 E-.05389
N2157 G1 X197.998 Y276.823 E-.0539
N2158 G1 X198 Y276.681 E-.05389
N2159 G1 X197.99 Y276.54 E-.05389
N2160 G1 X197.97 Y276.4 E-.05389
N2161 G1 X197.938 Y276.261 E-.0539
N2162 G1 X197.896 Y276.126 E-.05389
N2163 G1 X197.858 Y276.029 E-.03963
N2164 ; WIPE_END
N2165 G1 E-.04 F1800
N2166 M204 S10000
N2167 G17
N2168 G3 Z.8 I1.217 J0 P1  F60000
N2169 ; OBJECT_ID: 229
N2170 ; start printing object, unique label id: 229
N2171 M624 AQAAAAAAAAA=
N2172 G1 X191.084 Y200.639
N2173 G1 Z.4
N2174 G1 E.8 F1800
N2175 ; FEATURE: Inner wall
N2176 ; LINE_WIDTH: 0.45
N2177 ; LAYER_HEIGHT: 0.2
N2178 G1 F4421.739
N2179 M204 S8000
N2180 G1 X158.916 Y200.639 E1.03439
N2181 G1 X158.916 Y127.036 E2.36678
N2182 G1 X191.084 Y127.036 E1.03439
N2183 G1 X191.084 Y200.579 E2.36485
N2184 M204 S10000
N2185 G1 X191.491 Y201.046 F60000
N2186 G1 F4421.739
N2187 M204 S8000
N2188 G1 X158.509 Y201.046 E1.06057
N2189 G1 X158.509 Y126.629 E2.39296
N2190 G1 X191.491 Y126.629 E1.06057
N2191 G1 X191.491 Y200.986 E2.39103
N2192 M204 S10000
N2193 G1 X191.898 Y201.453 F60000
N2194 G1 F4421.739
N2195 M204 S8000
N2196 G1 X158.102 Y201.453 E1.08675
N2197 G1 X158.102 Y126.222 E2.41914
N2198 G1 X191.898 Y126.222 E1.08675
N2199 G1 X191.898 Y201.393 E2.41721
N2200 M204 S10000
N2201 G1 X192.29 Y201.845 F60000
N2202 ; FEATURE: Outer wall
N2203 ; LINE_WIDTH: 0.42
N2204 G1 F4773.528
N2205 M204 S5000
N2206 G1 X157.71 Y201.845 E1.03002
N2207 G1 X157.71 Y125.83 E2.26421
N2208 G1 X192.29 Y125.83 E1.03002
N2209 G1 X192.29 Y201.785 E2.26243
N2210 G1 E-.8 F1800
N2211 M204 S10000
N2212 G1 X190.157 Y200.475 Z.8 F60000
N2213 G1 Z.4
N2214 M73 P28 R38
N2215 G1 E.8 F1800
N2216 ; FEATURE: Internal solid infill
N2217 ; LINE_WIDTH: 0.42048
N2218 G1 F4767.454
N2219 M204 S8000
N2220 G1 X190.751 Y199.881 E.02504
N2221 G1 X190.751 Y199.347 E.01592
N2222 G1 X189.793 Y200.305 E.0404
N2223 G1 X189.259 Y200.305 E.01592
N2224 G1 X190.751 Y198.813 E.06292
N2225 G1 X190.751 Y198.279 E.01592
N2226 G1 X188.725 Y200.305 E.08544
N2227 G1 X188.191 Y200.305 E.01592
N2228 G1 X190.751 Y197.746 E.10797
N2229 G1 X190.751 Y197.212 E.01592
N2230 G1 X187.657 Y200.305 E.13049
N2231 G1 X187.123 Y200.305 E.01592
N2232 G1 X190.751 Y196.678 E.15301
N2233 G1 X190.751 Y196.144 E.01592
N2234 G1 X186.589 Y200.305 E.17553
N2235 G1 X186.055 Y200.305 E.01592
N2236 G1 X190.751 Y195.61 E.19805
N2237 G1 X190.751 Y195.076 E.01592
N2238 G1 X185.521 Y200.305 E.22057
N2239 G1 X184.987 Y200.305 E.01592
N2240 G1 X190.751 Y194.542 E.24309
N2241 G1 X190.751 Y194.008 E.01592
N2242 G1 X184.453 Y200.305 E.26561
N2243 G1 X183.919 Y200.305 E.01592
N2244 G1 X190.751 Y193.474 E.28813
N2245 G1 X190.751 Y192.94 E.01592
N2246 G1 X183.385 Y200.305 E.31066
N2247 G1 X182.851 Y200.305 E.01592
N2248 G1 X190.751 Y192.406 E.33318
N2249 G1 X190.751 Y191.872 E.01592
N2250 G1 X182.317 Y200.305 E.3557
N2251 G1 X181.783 Y200.305 E.01592
N2252 G1 X190.751 Y191.338 E.37822
N2253 G1 X190.751 Y190.804 E.01593
N2254 G1 X181.249 Y200.305 E.40074
N2255 G1 X180.715 Y200.305 E.01592
N2256 G1 X190.751 Y190.27 E.42326
N2257 G1 X190.751 Y189.736 E.01592
N2258 G1 X180.182 Y200.305 E.44578
N2259 G1 X179.648 Y200.305 E.01592
N2260 G1 X190.751 Y189.202 E.4683
N2261 G1 X190.751 Y188.668 E.01592
N2262 G1 X179.114 Y200.305 E.49082
N2263 G1 X178.58 Y200.305 E.01592
N2264 G1 X190.751 Y188.134 E.51335
N2265 G1 X190.751 Y187.6 E.01592
N2266 G1 X178.046 Y200.305 E.53587
N2267 G1 X177.512 Y200.305 E.01592
N2268 G1 X190.751 Y187.067 E.55839
N2269 G1 X190.751 Y186.533 E.01592
N2270 G1 X176.978 Y200.305 E.58091
N2271 G1 X176.444 Y200.305 E.01593
N2272 G1 X190.751 Y185.999 E.60343
N2273 G1 X190.751 Y185.465 E.01592
N2274 G1 X175.91 Y200.305 E.62595
N2275 G1 X175.376 Y200.305 E.01592
N2276 G1 X190.751 Y184.931 E.64847
N2277 G1 X190.751 Y184.397 E.01592
N2278 G1 X174.842 Y200.305 E.67099
N2279 G1 X174.308 Y200.305 E.01592
N2280 G1 X190.751 Y183.863 E.69351
N2281 G1 X190.751 Y183.329 E.01592
N2282 G1 X173.774 Y200.305 E.71604
N2283 G1 X173.24 Y200.305 E.01593
N2284 G1 X190.751 Y182.795 E.73856
N2285 G1 X190.751 Y182.261 E.01592
N2286 G1 X172.706 Y200.305 E.76108
N2287 G1 X172.172 Y200.305 E.01592
N2288 G1 X190.751 Y181.727 E.7836
N2289 G1 X190.751 Y181.193 E.01592
N2290 G1 X171.638 Y200.305 E.80612
N2291 G1 X171.104 Y200.305 E.01592
N2292 G1 X190.751 Y180.659 E.82864
N2293 G1 X190.751 Y180.125 E.01592
N2294 G1 X170.57 Y200.305 E.85116
N2295 G1 X170.036 Y200.305 E.01592
N2296 G1 X190.751 Y179.591 E.87368
N2297 G1 X190.751 Y179.057 E.01592
N2298 G1 X169.503 Y200.305 E.8962
N2299 G1 X168.969 Y200.305 E.01592
N2300 G1 X190.751 Y178.523 E.91873
N2301 G1 X190.751 Y177.989 E.01592
N2302 G1 X168.435 Y200.305 E.94125
N2303 G1 X167.901 Y200.305 E.01592
N2304 G1 X190.751 Y177.455 E.96377
N2305 G1 X190.751 Y176.921 E.01592
N2306 G1 X167.367 Y200.305 E.98629
N2307 G1 X166.833 Y200.305 E.01592
N2308 G1 X190.751 Y176.388 E1.00881
N2309 G1 X190.751 Y175.854 E.01592
N2310 G1 X166.299 Y200.305 E1.03133
N2311 G1 X165.765 Y200.305 E.01592
N2312 G1 X190.751 Y175.32 E1.05385
N2313 G1 X190.751 Y174.786 E.01592
N2314 G1 X165.231 Y200.305 E1.07637
N2315 G1 X164.697 Y200.305 E.01592
N2316 G1 X190.751 Y174.252 E1.09889
N2317 G1 X190.751 Y173.718 E.01592
N2318 G1 X164.163 Y200.305 E1.12141
N2319 G1 X163.629 Y200.305 E.01592
N2320 G1 X190.751 Y173.184 E1.14394
N2321 G1 X190.751 Y172.65 E.01592
N2322 G1 X163.095 Y200.305 E1.16646
N2323 G1 X162.561 Y200.305 E.01592
N2324 G1 X190.751 Y172.116 E1.18898
N2325 G1 X190.751 Y171.582 E.01592
N2326 G1 X162.027 Y200.305 E1.2115
N2327 G1 X161.493 Y200.305 E.01592
N2328 G1 X190.751 Y171.048 E1.23402
N2329 G1 X190.751 Y170.514 E.01592
N2330 G1 X160.959 Y200.305 E1.25654
N2331 G1 X160.425 Y200.305 E.01592
N2332 G1 X190.751 Y169.98 E1.27906
N2333 G1 X190.751 Y169.446 E.01592
N2334 G1 X159.891 Y200.305 E1.30158
N2335 G1 X159.357 Y200.305 E.01592
N2336 G1 X190.751 Y168.912 E1.3241
N2337 G1 X190.751 Y168.378 E.01593
N2338 G1 X159.249 Y199.879 E1.32866
N2339 G1 X159.249 Y199.345 E.01592
N2340 G1 X190.751 Y167.844 E1.32866
N2341 G1 X190.751 Y167.31 E.01592
N2342 G1 X159.249 Y198.811 E1.32866
N2343 G1 X159.249 Y198.277 E.01593
N2344 G1 X190.751 Y166.776 E1.32866
N2345 G1 X190.751 Y166.242 E.01592
N2346 G1 X159.249 Y197.744 E1.32866
N2347 G1 X159.249 Y197.21 E.01592
N2348 G1 X190.751 Y165.709 E1.32866
N2349 G1 X190.751 Y165.175 E.01592
N2350 G1 X159.249 Y196.676 E1.32866
N2351 G1 X159.249 Y196.142 E.01592
N2352 G1 X190.751 Y164.641 E1.32866
N2353 G1 X190.751 Y164.107 E.01592
N2354 G1 X159.249 Y195.608 E1.32866
N2355 G1 X159.249 Y195.074 E.01592
N2356 G1 X190.751 Y163.573 E1.32866
N2357 G1 X190.751 Y163.039 E.01592
N2358 G1 X159.249 Y194.54 E1.32866
N2359 G1 X159.249 Y194.006 E.01592
N2360 G1 X190.751 Y162.505 E1.32866
N2361 G1 X190.751 Y161.971 E.01592
N2362 G1 X159.249 Y193.472 E1.32866
N2363 G1 X159.249 Y192.938 E.01592
N2364 G1 X190.751 Y161.437 E1.32866
N2365 G1 X190.751 Y160.903 E.01592
N2366 G1 X159.249 Y192.404 E1.32866
N2367 G1 X159.249 Y191.87 E.01592
N2368 G1 X190.751 Y160.369 E1.32866
N2369 G1 X190.751 Y159.835 E.01592
N2370 G1 X159.249 Y191.336 E1.32866
N2371 G1 X159.249 Y190.802 E.01592
N2372 G1 X190.751 Y159.301 E1.32866
N2373 G1 X190.751 Y158.767 E.01592
N2374 G1 X159.249 Y190.268 E1.32866
N2375 G1 X159.249 Y189.734 E.01592
N2376 G1 X190.751 Y158.233 E1.32866
N2377 G1 X190.751 Y157.699 E.01592
N2378 M73 P28 R37
N2379 G1 X159.249 Y189.2 E1.32866
N2380 G1 X159.249 Y188.666 E.01592
N2381 G1 X190.751 Y157.165 E1.32866
N2382 G1 X190.751 Y156.631 E.01592
N2383 G1 X159.249 Y188.132 E1.32866
N2384 G1 X159.249 Y187.598 E.01592
N2385 G1 X190.751 Y156.097 E1.32866
N2386 G1 X190.751 Y155.563 E.01592
N2387 M73 P29 R37
N2388 G1 X159.249 Y187.065 E1.32866
N2389 G1 X159.249 Y186.531 E.01593
N2390 G1 X190.751 Y155.03 E1.32866
N2391 G1 X190.751 Y154.496 E.01592
N2392 G1 X159.249 Y185.997 E1.32866
N2393 G1 X159.249 Y185.463 E.01592
N2394 G1 X190.751 Y153.962 E1.32866
N2395 G1 X190.751 Y153.428 E.01592
N2396 G1 X159.249 Y184.929 E1.32866
N2397 G1 X159.249 Y184.395 E.01592
N2398 G1 X190.751 Y152.894 E1.32866
N2399 G1 X190.751 Y152.36 E.01592
N2400 G1 X159.249 Y183.861 E1.32866
N2401 G1 X159.249 Y183.327 E.01592
N2402 G1 X190.751 Y151.826 E1.32866
N2403 G1 X190.751 Y151.292 E.01592
N2404 G1 X159.249 Y182.793 E1.32866
N2405 G1 X159.249 Y182.259 E.01592
N2406 G1 X190.751 Y150.758 E1.32866
N2407 G1 X190.751 Y150.224 E.01592
N2408 G1 X159.249 Y181.725 E1.32866
N2409 G1 X159.249 Y181.191 E.01592
N2410 G1 X190.751 Y149.69 E1.32866
N2411 G1 X190.751 Y149.156 E.01593
N2412 G1 X159.249 Y180.657 E1.32866
N2413 G1 X159.249 Y180.123 E.01592
N2414 G1 X190.751 Y148.622 E1.32866
N2415 G1 X190.751 Y148.088 E.01592
N2416 G1 X159.249 Y179.589 E1.32866
N2417 G1 X159.249 Y179.055 E.01592
N2418 G1 X190.751 Y147.554 E1.32866
N2419 G1 X190.751 Y147.02 E.01592
N2420 G1 X159.249 Y178.521 E1.32866
N2421 G1 X159.249 Y177.987 E.01592
N2422 G1 X190.751 Y146.486 E1.32866
N2423 G1 X190.751 Y145.952 E.01592
N2424 G1 X159.249 Y177.453 E1.32866
N2425 G1 X159.249 Y176.919 E.01592
N2426 G1 X190.751 Y145.418 E1.32866
N2427 G1 X190.751 Y144.884 E.01592
N2428 G1 X159.249 Y176.386 E1.32866
N2429 G1 X159.249 Y175.852 E.01592
N2430 G1 X190.751 Y144.351 E1.32866
N2431 G1 X190.751 Y143.817 E.01592
N2432 G1 X159.249 Y175.318 E1.32866
N2433 G1 X159.249 Y174.784 E.01592
N2434 G1 X190.751 Y143.283 E1.32866
N2435 G1 X190.751 Y142.749 E.01592
N2436 G1 X159.249 Y174.25 E1.32866
N2437 G1 X159.249 Y173.716 E.01592
N2438 G1 X190.751 Y142.215 E1.32866
N2439 G1 X190.751 Y141.681 E.01592
N2440 G1 X159.249 Y173.182 E1.32866
N2441 G1 X159.249 Y172.648 E.01592
N2442 G1 X190.751 Y141.147 E1.32866
N2443 G1 X190.751 Y140.613 E.01592
N2444 G1 X159.249 Y172.114 E1.32866
N2445 G1 X159.249 Y171.58 E.01592
N2446 G1 X190.751 Y140.079 E1.32866
N2447 G1 X190.751 Y139.545 E.01592
N2448 G1 X159.249 Y171.046 E1.32866
N2449 G1 X159.249 Y170.512 E.01592
N2450 G1 X190.751 Y139.011 E1.32866
N2451 G1 X190.751 Y138.477 E.01592
N2452 G1 X159.249 Y169.978 E1.32866
N2453 G1 X159.249 Y169.444 E.01592
N2454 G1 X190.751 Y137.943 E1.32866
N2455 G1 X190.751 Y137.409 E.01593
N2456 G1 X159.249 Y168.91 E1.32866
N2457 G1 X159.249 Y168.376 E.01592
N2458 G1 X190.751 Y136.875 E1.32866
N2459 G1 X190.751 Y136.341 E.01592
N2460 G1 X159.249 Y167.842 E1.32866
N2461 G1 X159.249 Y167.308 E.01592
N2462 G1 X190.751 Y135.807 E1.32866
N2463 G1 X190.751 Y135.273 E.01592
N2464 G1 X159.249 Y166.774 E1.32866
N2465 G1 X159.249 Y166.24 E.01592
N2466 G1 X190.751 Y134.739 E1.32866
N2467 G1 X190.751 Y134.205 E.01592
N2468 G1 X159.249 Y165.707 E1.32866
N2469 G1 X159.249 Y165.173 E.01592
N2470 G1 X190.751 Y133.672 E1.32866
N2471 G1 X190.751 Y133.138 E.01592
N2472 G1 X159.249 Y164.639 E1.32866
N2473 G1 X159.249 Y164.105 E.01593
N2474 G1 X190.751 Y132.604 E1.32866
N2475 G1 X190.751 Y132.07 E.01592
N2476 G1 X159.249 Y163.571 E1.32866
N2477 G1 X159.249 Y163.037 E.01592
N2478 G1 X190.751 Y131.536 E1.32866
N2479 G1 X190.751 Y131.002 E.01592
N2480 G1 X159.249 Y162.503 E1.32866
N2481 G1 X159.249 Y161.969 E.01592
N2482 G1 X190.751 Y130.468 E1.32866
N2483 G1 X190.751 Y129.934 E.01592
N2484 G1 X159.249 Y161.435 E1.32866
N2485 G1 X159.249 Y160.901 E.01592
N2486 G1 X190.751 Y129.4 E1.32866
N2487 G1 X190.751 Y128.866 E.01592
N2488 G1 X159.249 Y160.367 E1.32866
N2489 G1 X159.249 Y159.833 E.01592
N2490 G1 X190.751 Y128.332 E1.32866
N2491 G1 X190.751 Y127.798 E.01592
N2492 G1 X159.249 Y159.299 E1.32866
N2493 G1 X159.249 Y158.765 E.01592
N2494 G1 X190.645 Y127.37 E1.32421
N2495 G1 X190.111 Y127.37 E.01592
N2496 G1 X159.249 Y158.231 E1.30169
N2497 G1 X159.249 Y157.697 E.01592
N2498 M73 P30 R37
N2499 G1 X189.577 Y127.37 E1.27917
N2500 G1 X189.043 Y127.37 E.01592
N2501 G1 X159.249 Y157.163 E1.25664
N2502 G1 X159.249 Y156.629 E.01592
N2503 G1 X188.509 Y127.37 E1.23412
N2504 G1 X187.975 Y127.37 E.01592
N2505 G1 X159.249 Y156.095 E1.2116
N2506 G1 X159.249 Y155.561 E.01592
N2507 G1 X187.441 Y127.37 E1.18908
N2508 G1 X186.907 Y127.37 E.01592
N2509 G1 X159.249 Y155.028 E1.16656
N2510 G1 X159.249 Y154.494 E.01592
N2511 G1 X186.373 Y127.37 E1.14404
N2512 G1 X185.839 Y127.37 E.01592
N2513 G1 X159.249 Y153.96 E1.12152
N2514 G1 X159.249 Y153.426 E.01592
N2515 G1 X185.305 Y127.37 E1.099
N2516 G1 X184.772 Y127.37 E.01593
N2517 G1 X159.249 Y152.892 E1.07648
N2518 G1 X159.249 Y152.358 E.01592
N2519 G1 X184.238 Y127.37 E1.05395
N2520 G1 X183.704 Y127.37 E.01592
N2521 G1 X159.249 Y151.824 E1.03143
N2522 G1 X159.249 Y151.29 E.01592
N2523 G1 X183.17 Y127.37 E1.00891
N2524 G1 X182.636 Y127.37 E.01592
N2525 G1 X159.249 Y150.756 E.98639
N2526 G1 X159.249 Y150.222 E.01592
N2527 G1 X182.102 Y127.37 E.96387
N2528 G1 X181.568 Y127.37 E.01592
N2529 G1 X159.249 Y149.688 E.94135
N2530 G1 X159.249 Y149.154 E.01592
N2531 G1 X181.034 Y127.37 E.91883
N2532 G1 X180.5 Y127.37 E.01592
N2533 G1 X159.249 Y148.62 E.89631
N2534 G1 X159.249 Y148.086 E.01592
N2535 G1 X179.966 Y127.37 E.87379
N2536 G1 X179.432 Y127.37 E.01592
N2537 G1 X159.249 Y147.552 E.85126
N2538 G1 X159.249 Y147.018 E.01592
N2539 G1 X178.898 Y127.37 E.82874
N2540 G1 X178.364 Y127.37 E.01592
N2541 G1 X159.249 Y146.484 E.80622
N2542 G1 X159.249 Y145.95 E.01592
N2543 G1 X177.83 Y127.37 E.7837
N2544 G1 X177.296 Y127.37 E.01592
N2545 G1 X159.249 Y145.416 E.76118
N2546 G1 X159.249 Y144.882 E.01593
N2547 G1 X176.762 Y127.37 E.73866
N2548 G1 X176.228 Y127.37 E.01592
N2549 G1 X159.249 Y144.349 E.71614
N2550 G1 X159.249 Y143.815 E.01592
N2551 G1 X175.694 Y127.37 E.69362
N2552 G1 X175.16 Y127.37 E.01592
N2553 G1 X159.249 Y143.281 E.6711
N2554 G1 X159.249 Y142.747 E.01592
N2555 G1 X174.626 Y127.37 E.64857
N2556 G1 X174.093 Y127.37 E.01592
N2557 G1 X159.249 Y142.213 E.62605
N2558 G1 X159.249 Y141.679 E.01592
N2559 G1 X173.559 Y127.37 E.60353
N2560 G1 X173.025 Y127.37 E.01592
N2561 G1 X159.249 Y141.145 E.58101
N2562 G1 X159.249 Y140.611 E.01592
N2563 G1 X172.491 Y127.37 E.55849
N2564 G1 X171.957 Y127.37 E.01592
N2565 G1 X159.249 Y140.077 E.53597
N2566 G1 X159.249 Y139.543 E.01592
N2567 G1 X171.423 Y127.37 E.51345
N2568 G1 X170.889 Y127.37 E.01592
N2569 G1 X159.249 Y139.009 E.49093
N2570 G1 X159.249 Y138.475 E.01592
N2571 G1 X170.355 Y127.37 E.46841
N2572 G1 X169.821 Y127.37 E.01592
N2573 G1 X159.249 Y137.941 E.44588
N2574 G1 X159.249 Y137.407 E.01592
N2575 G1 X169.287 Y127.37 E.42336
N2576 G1 X168.753 Y127.37 E.01592
N2577 G1 X159.249 Y136.873 E.40084
N2578 G1 X159.249 Y136.339 E.01592
N2579 G1 X168.219 Y127.37 E.37832
N2580 G1 X167.685 Y127.37 E.01592
N2581 G1 X159.249 Y135.805 E.3558
N2582 G1 X159.249 Y135.271 E.01592
N2583 G1 X167.151 Y127.37 E.33328
N2584 G1 X166.617 Y127.37 E.01592
N2585 G1 X159.249 Y134.737 E.31076
N2586 G1 X159.249 Y134.203 E.01592
N2587 G1 X166.083 Y127.37 E.28824
N2588 G1 X165.549 Y127.37 E.01592
N2589 G1 X159.249 Y133.669 E.26572
N2590 G1 X159.249 Y133.136 E.01592
N2591 G1 X165.015 Y127.37 E.24319
N2592 G1 X164.481 Y127.37 E.01592
N2593 G1 X159.249 Y132.602 E.22067
N2594 G1 X159.249 Y132.068 E.01592
N2595 G1 X163.947 Y127.37 E.19815
N2596 G1 X163.413 Y127.37 E.01592
N2597 G1 X159.249 Y131.534 E.17563
N2598 G1 X159.249 Y131 E.01592
N2599 G1 X162.88 Y127.37 E.15311
N2600 G1 X162.346 Y127.37 E.01592
N2601 G1 X159.249 Y130.466 E.13059
N2602 G1 X159.249 Y129.932 E.01592
N2603 G1 X161.812 Y127.37 E.10807
N2604 G1 X161.278 Y127.37 E.01592
N2605 G1 X159.249 Y129.398 E.08555
N2606 G1 X159.249 Y128.864 E.01592
N2607 G1 X160.744 Y127.37 E.06303
N2608 G1 X160.21 Y127.37 E.01592
N2609 G1 X159.249 Y128.33 E.0405
N2610 G1 X159.249 Y127.796 E.01592
N2611 G1 X159.846 Y127.2 E.02514
N2612 ; WIPE_START
N2613 G1 X159.249 Y127.796 E-.32032
N2614 G1 X159.249 Y128.33 E-.2029
N2615 G1 X159.69 Y127.889 E-.23678
N2616 ; WIPE_END
N2617 G1 E-.04 F1800
N2618 M204 S10000
N2619 G17
N2620 G3 Z.8 I1.217 J0 P1  F60000
N2621 ; stop printing object, unique label id: 229
N2622 M625
N2623 ; object ids of layer 2 start: 229,239
N2624 M624 AwAAAAAAAAA=
N2625 ;======== H2D 20250527========
N2626 ; SKIPPABLE_START
N2627 ; SKIPTYPE: timelapse
N2628 M622.1 S1 ; for prev firware, default turned on
N2629 
N2630 M1002 judge_flag timelapse_record_flag
N2631 
N2632 M622 J1
N2633 M993 A2 B2 C2
N2634 M993 A0 B0 C0
N2635 
N2636 
N2637 
N2638 
N2639     M9711 M0 E1 X260 Y141 Z0.8 S11 C10 O0 T3000
N2640 
N2641 
N2642 
N2643 M993 A3 B3 C3
N2644 
N2645 M623
N2646 ; SKIPPABLE_END
N2647 
N2648 ; object ids of this layer2 end: 229,239
N2649 M625
N2650 ; CHANGE_LAYER
N2651 ; Z_HEIGHT: 0.6
N2652 ; LAYER_HEIGHT: 0.2
N2653 ;======== H2D 20250521========
N2654 ; layer num/total_layer_count: 3/63
N2655 ; update layer progress
N2656 M73 L3
N2657 M991 S0 P2 ;notify layer change
N2658 
N2659 
N2660 ; OBJECT_ID: 229
N2661 ; COOLING_NODE: 0
N2662 ; start printing object, unique label id: 229
N2663 M624 AQAAAAAAAAA=
N2664 G1 X191.084 Y200.639 F60000
N2665 G1 Z.6
N2666 G1 E.8 F1800
N2667 ; FEATURE: Inner wall
N2668 ; LINE_WIDTH: 0.45
N2669 ; LAYER_HEIGHT: 0.2
N2670 G1 F4421.739
N2671 M204 S8000
N2672 G1 X158.916 Y200.639 E1.03439
N2673 G1 X158.916 Y127.036 E2.36678
N2674 G1 X191.084 Y127.036 E1.03439
N2675 G1 X191.084 Y200.579 E2.36485
N2676 ; COOLING_NODE: 0
N2677 M204 S10000
N2678 G1 X191.491 Y201.046 F60000
N2679 G1 F4421.739
N2680 M204 S8000
N2681 G1 X158.509 Y201.046 E1.06057
N2682 G1 X158.509 Y126.629 E2.39296
N2683 G1 X191.491 Y126.629 E1.06057
N2684 G1 X191.491 Y200.986 E2.39103
N2685 ; COOLING_NODE: 0
N2686 M204 S10000
N2687 G1 X191.898 Y201.453 F60000
N2688 G1 F4421.739
N2689 M204 S8000
N2690 G1 X158.102 Y201.453 E1.08675
N2691 G1 X158.102 Y126.222 E2.41914
N2692 G1 X191.898 Y126.222 E1.08675
N2693 G1 X191.898 Y201.393 E2.41721
N2694 ; COOLING_NODE: 0
N2695 M204 S10000
N2696 G1 X192.29 Y201.845 F60000
N2697 ; FEATURE: Outer wall
N2698 ; LINE_WIDTH: 0.42
N2699 G1 F4773.528
N2700 M204 S5000
N2701 M73 P30 R36
N2702 G1 X157.71 Y201.845 E1.03002
N2703 G1 X157.71 Y125.83 E2.26421
N2704 G1 X192.29 Y125.83 E1.03002
N2705 G1 X192.29 Y201.785 E2.26243
N2706 G1 E-.8 F1800
N2707 M204 S10000
N2708 G1 X184.672 Y201.309 Z1 F60000
N2709 G1 X159.08 Y199.709 Z1
N2710 G1 Z.6
N2711 G1 E.8 F1800
N2712 ; FEATURE: Internal solid infill
N2713 ; LINE_WIDTH: 0.42048
N2714 G1 F4767.454
N2715 M204 S8000
N2716 G1 X159.676 Y200.305 E.02514
N2717 G1 X160.21 Y200.305 E.01592
N2718 G1 X159.249 Y199.345 E.0405
N2719 G1 X159.249 Y198.811 E.01592
N2720 G1 X160.744 Y200.305 E.06303
N2721 G1 X161.278 Y200.305 E.01592
N2722 G1 X159.249 Y198.277 E.08555
N2723 G1 X159.249 Y197.743 E.01592
N2724 G1 X161.812 Y200.305 E.10807
N2725 G1 X162.346 Y200.305 E.01592
N2726 G1 X159.249 Y197.209 E.13059
N2727 G1 X159.249 Y196.675 E.01593
N2728 G1 X162.88 Y200.305 E.15311
N2729 G1 X163.413 Y200.305 E.01592
N2730 G1 X159.249 Y196.141 E.17563
N2731 G1 X159.249 Y195.607 E.01592
N2732 G1 X163.947 Y200.305 E.19815
N2733 G1 X164.481 Y200.305 E.01592
N2734 G1 X159.249 Y195.073 E.22067
N2735 G1 X159.249 Y194.539 E.01592
N2736 G1 X165.015 Y200.305 E.24319
N2737 G1 X165.549 Y200.305 E.01592
N2738 G1 X159.249 Y194.005 E.26572
N2739 G1 X159.249 Y193.472 E.01592
N2740 G1 X166.083 Y200.305 E.28824
N2741 G1 X166.617 Y200.305 E.01593
N2742 G1 X159.249 Y192.938 E.31076
N2743 G1 X159.249 Y192.404 E.01592
N2744 G1 X167.151 Y200.305 E.33328
N2745 G1 X167.685 Y200.305 E.01592
N2746 G1 X159.249 Y191.87 E.3558
N2747 G1 X159.249 Y191.336 E.01592
N2748 G1 X168.219 Y200.305 E.37832
N2749 G1 X168.753 Y200.305 E.01592
N2750 G1 X159.249 Y190.802 E.40084
N2751 G1 X159.249 Y190.268 E.01592
N2752 G1 X169.287 Y200.305 E.42336
N2753 G1 X169.821 Y200.305 E.01592
N2754 G1 X159.249 Y189.734 E.44588
N2755 G1 X159.249 Y189.2 E.01592
N2756 G1 X170.355 Y200.305 E.46841
N2757 G1 X170.889 Y200.305 E.01592
N2758 M73 P31 R36
N2759 G1 X159.249 Y188.666 E.49093
N2760 G1 X159.249 Y188.132 E.01592
N2761 G1 X171.423 Y200.305 E.51345
N2762 G1 X171.957 Y200.305 E.01592
N2763 G1 X159.249 Y187.598 E.53597
N2764 G1 X159.249 Y187.064 E.01592
N2765 G1 X172.491 Y200.305 E.55849
N2766 G1 X173.025 Y200.305 E.01592
N2767 G1 X159.249 Y186.53 E.58101
N2768 G1 X159.249 Y185.996 E.01592
N2769 G1 X173.559 Y200.305 E.60353
N2770 G1 X174.092 Y200.305 E.01592
N2771 G1 X159.249 Y185.462 E.62605
N2772 G1 X159.249 Y184.928 E.01592
N2773 G1 X174.626 Y200.305 E.64857
N2774 G1 X175.16 Y200.305 E.01592
N2775 G1 X159.249 Y184.394 E.6711
N2776 G1 X159.249 Y183.86 E.01592
N2777 G1 X175.694 Y200.305 E.69362
N2778 G1 X176.228 Y200.305 E.01592
N2779 G1 X159.249 Y183.326 E.71614
N2780 G1 X159.249 Y182.793 E.01592
N2781 G1 X176.762 Y200.305 E.73866
N2782 G1 X177.296 Y200.305 E.01592
N2783 G1 X159.249 Y182.259 E.76118
N2784 G1 X159.249 Y181.725 E.01592
N2785 G1 X177.83 Y200.305 E.7837
N2786 G1 X178.364 Y200.305 E.01592
N2787 G1 X159.249 Y181.191 E.80622
N2788 G1 X159.249 Y180.657 E.01592
N2789 G1 X178.898 Y200.305 E.82874
N2790 G1 X179.432 Y200.305 E.01592
N2791 G1 X159.249 Y180.123 E.85126
N2792 G1 X159.249 Y179.589 E.01592
N2793 G1 X179.966 Y200.305 E.87379
N2794 G1 X180.5 Y200.305 E.01592
N2795 G1 X159.249 Y179.055 E.89631
N2796 G1 X159.249 Y178.521 E.01592
N2797 G1 X181.034 Y200.305 E.91883
N2798 G1 X181.568 Y200.305 E.01592
N2799 G1 X159.249 Y177.987 E.94135
N2800 G1 X159.249 Y177.453 E.01592
N2801 G1 X182.102 Y200.305 E.96387
N2802 G1 X182.636 Y200.305 E.01592
N2803 G1 X159.249 Y176.919 E.98639
N2804 G1 X159.249 Y176.385 E.01592
N2805 G1 X183.17 Y200.305 E1.00891
N2806 G1 X183.704 Y200.305 E.01592
N2807 G1 X159.249 Y175.851 E1.03143
N2808 G1 X159.249 Y175.317 E.01592
N2809 G1 X184.238 Y200.305 E1.05395
N2810 G1 X184.772 Y200.305 E.01592
N2811 G1 X159.249 Y174.783 E1.07648
N2812 G1 X159.249 Y174.249 E.01593
N2813 G1 X185.305 Y200.305 E1.099
N2814 G1 X185.839 Y200.305 E.01592
N2815 G1 X159.249 Y173.715 E1.12152
N2816 G1 X159.249 Y173.181 E.01592
N2817 G1 X186.373 Y200.305 E1.14404
N2818 G1 X186.907 Y200.305 E.01592
N2819 G1 X159.249 Y172.647 E1.16656
N2820 G1 X159.249 Y172.113 E.01592
N2821 G1 X187.441 Y200.305 E1.18908
N2822 G1 X187.975 Y200.305 E.01592
N2823 G1 X159.249 Y171.58 E1.2116
N2824 G1 X159.249 Y171.046 E.01592
N2825 G1 X188.509 Y200.305 E1.23412
N2826 G1 X189.043 Y200.305 E.01593
N2827 G1 X159.249 Y170.512 E1.25664
N2828 G1 X159.249 Y169.978 E.01592
N2829 G1 X189.577 Y200.305 E1.27917
N2830 G1 X190.111 Y200.305 E.01592
N2831 G1 X159.249 Y169.444 E1.30169
N2832 G1 X159.249 Y168.91 E.01592
N2833 G1 X190.645 Y200.305 E1.32421
N2834 G1 X190.751 Y200.305 E.00315
N2835 G1 X190.751 Y199.877 E.01278
N2836 G1 X159.249 Y168.376 E1.32866
N2837 G1 X159.249 Y167.842 E.01592
N2838 G1 X190.751 Y199.343 E1.32866
N2839 G1 X190.751 Y198.809 E.01592
N2840 G1 X159.249 Y167.308 E1.32866
N2841 G1 X159.249 Y166.774 E.01592
N2842 G1 X190.751 Y198.275 E1.32866
N2843 G1 X190.751 Y197.741 E.01592
N2844 G1 X159.249 Y166.24 E1.32866
N2845 G1 X159.249 Y165.706 E.01592
N2846 G1 X190.751 Y197.207 E1.32866
N2847 G1 X190.751 Y196.673 E.01592
N2848 G1 X159.249 Y165.172 E1.32866
N2849 G1 X159.249 Y164.638 E.01592
N2850 G1 X190.751 Y196.139 E1.32866
N2851 G1 X190.751 Y195.605 E.01592
N2852 G1 X159.249 Y164.104 E1.32866
N2853 G1 X159.249 Y163.57 E.01592
N2854 G1 X190.751 Y195.071 E1.32866
N2855 G1 X190.751 Y194.537 E.01592
N2856 G1 X159.249 Y163.036 E1.32866
N2857 G1 X159.249 Y162.502 E.01592
N2858 G1 X190.751 Y194.003 E1.32866
N2859 G1 X190.751 Y193.47 E.01592
N2860 M104 T0 S240 N0 ;Multi extruder pre heating
N2861 G1 X159.249 Y161.968 E1.32866
N2862 G1 X159.249 Y161.434 E.01592
N2863 G1 X190.751 Y192.936 E1.32866
N2864 G1 X190.751 Y192.402 E.01592
N2865 G1 X159.249 Y160.901 E1.32866
N2866 G1 X159.249 Y160.367 E.01592
N2867 G1 X190.751 Y191.868 E1.32866
N2868 G1 X190.751 Y191.334 E.01592
N2869 G1 X159.249 Y159.833 E1.32866
N2870 G1 X159.249 Y159.299 E.01592
N2871 G1 X190.751 Y190.8 E1.32866
N2872 G1 X190.751 Y190.266 E.01592
N2873 G1 X159.249 Y158.765 E1.32866
N2874 G1 X159.249 Y158.231 E.01592
N2875 G1 X190.751 Y189.732 E1.32866
N2876 G1 X190.751 Y189.198 E.01592
N2877 G1 X159.249 Y157.697 E1.32866
N2878 G1 X159.249 Y157.163 E.01592
N2879 G1 X190.751 Y188.664 E1.32866
N2880 G1 X190.751 Y188.13 E.01592
N2881 G1 X159.249 Y156.629 E1.32866
N2882 G1 X159.249 Y156.095 E.01592
N2883 G1 X190.751 Y187.596 E1.32866
N2884 G1 X190.751 Y187.062 E.01592
N2885 G1 X159.249 Y155.561 E1.32866
N2886 G1 X159.249 Y155.027 E.01592
N2887 G1 X190.751 Y186.528 E1.32866
N2888 G1 X190.751 Y185.994 E.01592
N2889 G1 X159.249 Y154.493 E1.32866
N2890 G1 X159.249 Y153.959 E.01592
N2891 G1 X190.751 Y185.46 E1.32866
N2892 G1 X190.751 Y184.926 E.01592
N2893 G1 X159.249 Y153.425 E1.32866
N2894 G1 X159.249 Y152.891 E.01592
N2895 G1 X190.751 Y184.392 E1.32866
N2896 G1 X190.751 Y183.858 E.01592
N2897 M73 P32 R36
N2898 G1 X159.249 Y152.357 E1.32866
N2899 G1 X159.249 Y151.823 E.01592
N2900 G1 X190.751 Y183.324 E1.32866
N2901 G1 X190.751 Y182.791 E.01592
N2902 G1 X159.249 Y151.289 E1.32866
N2903 G1 X159.249 Y150.755 E.01592
N2904 G1 X190.751 Y182.257 E1.32866
N2905 G1 X190.751 Y181.723 E.01592
N2906 G1 X159.249 Y150.222 E1.32866
N2907 G1 X159.249 Y149.688 E.01592
N2908 G1 X190.751 Y181.189 E1.32866
N2909 G1 X190.751 Y180.655 E.01592
N2910 G1 X159.249 Y149.154 E1.32866
N2911 G1 X159.249 Y148.62 E.01592
N2912 G1 X190.751 Y180.121 E1.32866
N2913 G1 X190.751 Y179.587 E.01592
N2914 G1 X159.249 Y148.086 E1.32866
N2915 G1 X159.249 Y147.552 E.01592
N2916 G1 X190.751 Y179.053 E1.32866
N2917 G1 X190.751 Y178.519 E.01593
N2918 G1 X159.249 Y147.018 E1.32866
N2919 G1 X159.249 Y146.484 E.01592
N2920 G1 X190.751 Y177.985 E1.32866
N2921 G1 X190.751 Y177.451 E.01592
N2922 G1 X159.249 Y145.95 E1.32866
N2923 G1 X159.249 Y145.416 E.01592
N2924 G1 X190.751 Y176.917 E1.32866
N2925 G1 X190.751 Y176.383 E.01592
N2926 G1 X159.249 Y144.882 E1.32866
N2927 G1 X159.249 Y144.348 E.01592
N2928 G1 X190.751 Y175.849 E1.32866
N2929 G1 X190.751 Y175.315 E.01592
N2930 G1 X159.249 Y143.814 E1.32866
N2931 G1 X159.249 Y143.28 E.01592
N2932 G1 X190.751 Y174.781 E1.32866
N2933 G1 X190.751 Y174.247 E.01592
N2934 G1 X159.249 Y142.746 E1.32866
N2935 G1 X159.249 Y142.212 E.01592
N2936 G1 X190.751 Y173.713 E1.32866
N2937 G1 X190.751 Y173.179 E.01592
N2938 G1 X159.249 Y141.678 E1.32866
N2939 G1 X159.249 Y141.144 E.01592
N2940 G1 X190.751 Y172.645 E1.32866
N2941 G1 X190.751 Y172.112 E.01592
N2942 G1 X159.249 Y140.61 E1.32866
N2943 G1 X159.249 Y140.076 E.01593
N2944 G1 X190.751 Y171.578 E1.32866
N2945 G1 X190.751 Y171.044 E.01592
N2946 G1 X159.249 Y139.543 E1.32866
N2947 G1 X159.249 Y139.009 E.01592
N2948 G1 X190.751 Y170.51 E1.32866
N2949 G1 X190.751 Y169.976 E.01592
N2950 G1 X159.249 Y138.475 E1.32866
N2951 G1 X159.249 Y137.941 E.01592
N2952 G1 X190.751 Y169.442 E1.32866
N2953 G1 X190.751 Y168.908 E.01592
N2954 G1 X159.249 Y137.407 E1.32866
N2955 G1 X159.249 Y136.873 E.01592
N2956 G1 X190.751 Y168.374 E1.32866
N2957 G1 X190.751 Y167.84 E.01592
N2958 G1 X159.249 Y136.339 E1.32866
N2959 G1 X159.249 Y135.805 E.01592
N2960 G1 X190.751 Y167.306 E1.32866
N2961 G1 X190.751 Y166.772 E.01592
N2962 G1 X159.249 Y135.271 E1.32866
N2963 G1 X159.249 Y134.737 E.01592
N2964 G1 X190.751 Y166.238 E1.32866
N2965 G1 X190.751 Y165.704 E.01592
N2966 G1 X159.249 Y134.203 E1.32866
N2967 G1 X159.249 Y133.669 E.01592
N2968 G1 X190.751 Y165.17 E1.32866
N2969 G1 X190.751 Y164.636 E.01592
N2970 M73 P32 R35
N2971 G1 X159.249 Y133.135 E1.32866
N2972 G1 X159.249 Y132.601 E.01592
N2973 G1 X190.751 Y164.102 E1.32866
N2974 G1 X190.751 Y163.568 E.01592
N2975 G1 X159.249 Y132.067 E1.32866
N2976 G1 X159.249 Y131.533 E.01592
N2977 G1 X190.751 Y163.034 E1.32866
N2978 G1 X190.751 Y162.5 E.01592
N2979 G1 X159.249 Y130.999 E1.32866
N2980 G1 X159.249 Y130.465 E.01592
N2981 G1 X190.751 Y161.966 E1.32866
N2982 G1 X190.751 Y161.432 E.01592
N2983 G1 X159.249 Y129.931 E1.32866
N2984 G1 X159.249 Y129.397 E.01592
N2985 G1 X190.751 Y160.899 E1.32866
N2986 G1 X190.751 Y160.365 E.01592
N2987 G1 X159.249 Y128.863 E1.32866
N2988 G1 X159.249 Y128.33 E.01592
N2989 G1 X190.751 Y159.831 E1.32866
N2990 G1 X190.751 Y159.297 E.01592
N2991 G1 X159.249 Y127.796 E1.32866
N2992 G1 X159.249 Y127.37 E.0127
N2993 G1 X159.357 Y127.37 E.00322
N2994 G1 X190.751 Y158.763 E1.3241
N2995 G1 X190.751 Y158.229 E.01592
N2996 G1 X159.891 Y127.37 E1.30158
N2997 G1 X160.425 Y127.37 E.01592
N2998 G1 X190.751 Y157.695 E1.27906
N2999 G1 X190.751 Y157.161 E.01592
N3000 G1 X160.959 Y127.37 E1.25654
N3001 G1 X161.493 Y127.37 E.01592
N3002 G1 X190.751 Y156.627 E1.23402
N3003 G1 X190.751 Y156.093 E.01593
N3004 G1 X162.027 Y127.37 E1.2115
N3005 G1 X162.561 Y127.37 E.01592
N3006 G1 X190.751 Y155.559 E1.18898
N3007 G1 X190.751 Y155.025 E.01592
N3008 G1 X163.095 Y127.37 E1.16646
N3009 G1 X163.629 Y127.37 E.01592
N3010 M73 P33 R35
N3011 G1 X190.751 Y154.491 E1.14394
N3012 G1 X190.751 Y153.957 E.01592
N3013 G1 X164.163 Y127.37 E1.12141
N3014 G1 X164.697 Y127.37 E.01592
N3015 G1 X190.751 Y153.423 E1.09889
N3016 G1 X190.751 Y152.889 E.01592
N3017 G1 X165.231 Y127.37 E1.07637
N3018 G1 X165.765 Y127.37 E.01592
N3019 G1 X190.751 Y152.355 E1.05385
N3020 G1 X190.751 Y151.821 E.01592
N3021 G1 X166.299 Y127.37 E1.03133
N3022 G1 X166.833 Y127.37 E.01592
N3023 G1 X190.751 Y151.287 E1.00881
N3024 G1 X190.751 Y150.753 E.01592
N3025 G1 X167.367 Y127.37 E.98629
N3026 G1 X167.901 Y127.37 E.01592
N3027 G1 X190.751 Y150.22 E.96377
N3028 G1 X190.751 Y149.686 E.01592
N3029 G1 X168.435 Y127.37 E.94125
N3030 G1 X168.969 Y127.37 E.01592
N3031 G1 X190.751 Y149.152 E.91873
N3032 G1 X190.751 Y148.618 E.01592
N3033 G1 X169.503 Y127.37 E.8962
N3034 G1 X170.036 Y127.37 E.01593
N3035 G1 X190.751 Y148.084 E.87368
N3036 G1 X190.751 Y147.55 E.01592
N3037 G1 X170.57 Y127.37 E.85116
N3038 G1 X171.104 Y127.37 E.01592
N3039 G1 X190.751 Y147.016 E.82864
N3040 G1 X190.751 Y146.482 E.01592
N3041 G1 X171.638 Y127.37 E.80612
N3042 G1 X172.172 Y127.37 E.01592
N3043 G1 X190.751 Y145.948 E.7836
N3044 G1 X190.751 Y145.414 E.01592
N3045 G1 X172.706 Y127.37 E.76108
N3046 G1 X173.24 Y127.37 E.01592
N3047 G1 X190.751 Y144.88 E.73856
N3048 G1 X190.751 Y144.346 E.01593
N3049 G1 X173.774 Y127.37 E.71603
N3050 G1 X174.308 Y127.37 E.01592
N3051 G1 X190.751 Y143.812 E.69351
N3052 G1 X190.751 Y143.278 E.01592
N3053 G1 X174.842 Y127.37 E.67099
N3054 G1 X175.376 Y127.37 E.01592
N3055 G1 X190.751 Y142.744 E.64847
N3056 G1 X190.751 Y142.21 E.01592
N3057 G1 X175.91 Y127.37 E.62595
N3058 G1 X176.444 Y127.37 E.01592
N3059 G1 X190.751 Y141.676 E.60343
N3060 G1 X190.751 Y141.142 E.01592
N3061 G1 X176.978 Y127.37 E.58091
N3062 G1 X177.512 Y127.37 E.01592
N3063 G1 X190.751 Y140.608 E.55839
N3064 G1 X190.751 Y140.074 E.01592
N3065 G1 X178.046 Y127.37 E.53587
N3066 G1 X178.58 Y127.37 E.01592
N3067 G1 X190.751 Y139.541 E.51335
N3068 G1 X190.751 Y139.007 E.01592
N3069 G1 X179.114 Y127.37 E.49082
N3070 G1 X179.648 Y127.37 E.01592
N3071 G1 X190.751 Y138.473 E.4683
N3072 G1 X190.751 Y137.939 E.01592
N3073 G1 X180.182 Y127.37 E.44578
N3074 G1 X180.715 Y127.37 E.01592
N3075 G1 X190.751 Y137.405 E.42326
N3076 G1 X190.751 Y136.871 E.01592
N3077 G1 X181.249 Y127.37 E.40074
N3078 G1 X181.783 Y127.37 E.01592
N3079 G1 X190.751 Y136.337 E.37822
N3080 G1 X190.751 Y135.803 E.01592
N3081 G1 X182.317 Y127.37 E.3557
N3082 G1 X182.851 Y127.37 E.01592
N3083 G1 X190.751 Y135.269 E.33318
N3084 G1 X190.751 Y134.735 E.01592
N3085 G1 X183.385 Y127.37 E.31066
N3086 G1 X183.919 Y127.37 E.01592
N3087 G1 X190.751 Y134.201 E.28813
N3088 G1 X190.751 Y133.667 E.01592
N3089 G1 X184.453 Y127.37 E.26561
N3090 G1 X184.987 Y127.37 E.01592
N3091 G1 X190.751 Y133.133 E.24309
N3092 G1 X190.751 Y132.599 E.01592
N3093 G1 X185.521 Y127.37 E.22057
N3094 G1 X186.055 Y127.37 E.01592
N3095 G1 X190.751 Y132.065 E.19805
N3096 G1 X190.751 Y131.531 E.01592
N3097 G1 X186.589 Y127.37 E.17553
N3098 G1 X187.123 Y127.37 E.01592
N3099 G1 X190.751 Y130.997 E.15301
N3100 G1 X190.751 Y130.463 E.01592
N3101 G1 X187.657 Y127.37 E.13049
N3102 G1 X188.191 Y127.37 E.01592
N3103 G1 X190.751 Y129.929 E.10797
N3104 G1 X190.751 Y129.395 E.01592
N3105 G1 X188.725 Y127.37 E.08544
N3106 G1 X189.259 Y127.37 E.01592
N3107 G1 X190.751 Y128.862 E.06292
N3108 G1 X190.751 Y128.328 E.01592
N3109 G1 X189.793 Y127.37 E.0404
N3110 G1 X190.327 Y127.37 E.01592
N3111 G1 X190.92 Y127.963 E.02504
N3112 ; WIPE_START
N3113 G1 X190.327 Y127.37 E-.31901
N3114 G1 X189.793 Y127.37 E-.2029
N3115 G1 X190.236 Y127.813 E-.23809
N3116 ; WIPE_END
N3117 G1 E-.04 F1800
N3118 M204 S10000
N3119 G17
N3120 G3 Z1 I1.217 J0 P1  F60000
N3121 ; stop printing object, unique label id: 229
N3122 M625
N3123 ; object ids of layer 3 start: 229,239
N3124 M624 AwAAAAAAAAA=
N3125 ;======== H2D 20250527========
N3126 ; SKIPPABLE_START
N3127 ; SKIPTYPE: timelapse
N3128 M622.1 S1 ; for prev firware, default turned on
N3129 
N3130 M1002 judge_flag timelapse_record_flag
N3131 
N3132 M622 J1
N3133 M993 A2 B2 C2
N3134 M993 A0 B0 C0
N3135 
N3136 
N3137 
N3138 
N3139     M9711 M0 E1 X260 Y141 Z1 S11 C10 O0 T3000
N3140 
N3141 
N3142 
N3143 M993 A3 B3 C3
N3144 
N3145 M623
N3146 ; SKIPPABLE_END
N3147 
N3148 ; object ids of this layer3 end: 229,239
N3149 M625
N3150 G1 X195.495 Y279.064
N3151 G1 Z.6
N3152 G1 E.8 F1800
N3153 ; LAYER_HEIGHT: 0.200000
N3154 ; FEATURE: Prime tower
N3155 ; LINE_WIDTH: 0.500000
N3156 ; WIPE_TOWER_START
N3157 M204 S10000
N3158 G1  X195.995 Y279.564  
N3159 M204 S8000
N3160 G3  X193.533 Y281.605   I-4.373 J-2.768 E0.1236 F3938
N3161 G3  X190.885 Y280.355   I0.012 J-3.454 E0.1149
N3162 G2  X188.182 Y279.564   I-2.709 J4.247 E0.1085
N3163 G2  X174.618 Y279.568   I-6.687 J357.435 E0.5155
N3164 G2  X170.683 Y281.445   I0.499 J6.110 E0.1694
N3165 G3  X168.371 Y281.015   I-0.854 J-1.838 E0.0953
N3166 G1  X166.995 Y279.564   E0.0760
N3167 G3  X165.064 Y277.242   I3.871 J-5.183 E0.1159
N3168 G3  X166.240 Y274.649   I2.902 J-0.247 E0.1130
N3169 G2  X166.995 Y272.245   I-3.465 J-2.409 E0.0972
N3170 G2  X166.992 Y259.212   I-321.195 J-6.431 E0.4954
N3171 G2  X165.146 Y255.634   I-6.663 J1.171 E0.1554
N3172 G3  X165.485 Y253.656   I1.658 J-0.734 E0.0808
N3173 G1  X168.371 Y250.613   E0.1594
N3174 G3  X171.793 Y251.056   I1.525 J1.652 E0.1495
N3175 G2  X174.808 Y252.064   I3.021 J-4.025 E0.1229
N3176 G2  X188.372 Y252.060   I6.687 J-357.435 E0.5155
N3177 G2  X192.307 Y250.183   I-0.499 J-6.110 E0.1694
N3178 G3  X194.619 Y250.613   I0.854 J1.838 E0.0953
N3179 G1  X195.609 Y251.657   E0.0547
N3180 G1 E-0.8000 F1800
N3181 M204 S10000
N3182 G1  X197.329 Y253.471   F600
N3183 G1 E0.8000 F1800
N3184 M204 S8000
N3185 G3  X196.957 Y256.707   I-1.339 J1.486 E0.1447 F3938
N3186 G2  X195.995 Y259.382   I3.254 J2.680 E0.1102
N3187 G2  X195.998 Y272.416   I321.212 J6.432 E0.4954
N3188 G2  X197.844 Y275.994   I6.663 J-1.171 E0.1554
N3189 G3  X197.504 Y277.972   I-1.658 J0.734 E0.0808
N3190 G1  X195.995 Y279.564   E0.0834
N3191 ; WIPE_TOWER_END
N3192 G1  X195.495 Y252.064  
N3193 ; LAYER_HEIGHT: 0.200000
N3194 ; FEATURE: Prime tower
N3195 ; LINE_WIDTH: 0.500000
N3196 ; WIPE_TOWER_START
N3197 M204 S8000
N3198 G1  X167.495  E1.0642
N3199 G1  Y272.314  E0.2565
N3200 G1  X195.495  E1.0642
N3201 G1  Y279.064  E0.2565
N3202 M204 S10000
N3203 G1  X168.495 Y272.314  
N3204 ;--------------------
N3205 ; CP EMPTY GRID START
N3206 ; layer #4
N3207 M204 S8000
N3208 G1  Y279.064  E0.2565
N3209 M204 S10000
N3210 G1  X177.162 
N3211 M204 S8000
N3212 G1  Y272.314  E0.2565
N3213 M204 S10000
N3214 G1  X185.828 
N3215 M204 S8000
N3216 G1  Y279.064  E0.2565
N3217 M204 S10000
N3218 G1  X194.495 
N3219 M204 S8000
N3220 G1  Y272.314  E0.2565
N3221 ; CP EMPTY GRID END
N3222 ;------------------
N3223 
N3224 
N3225 
N3226 
N3227 
N3228 
N3229 ; WIPE_TOWER_END
N3230 ; LAYER_HEIGHT: 0.200000
N3231 ; FEATURE: Prime tower
N3232 ; LINE_WIDTH: 0.500000
N3233 ;--------------------
N3234 ; CP TOOLCHANGE START
N3235 ; toolchange #3
N3236 ; material : TPU -> TPU
N3237 ;--------------------
N3238 M220 B
N3239 M220 S100
N3240 ; WIPE_TOWER_START
N3241 G1 E-.8 F1800
N3242 G17
N3243 G3 Z1 I1.217 J0 P1  F60000
N3244 G1 X167.745 Y266.314
N3245 G1 Z.6
N3246 G1 E.8 F1800
N3247 ; LAYER_HEIGHT: 0.200000
N3248 ; FEATURE: Prime tower
N3249 ; LINE_WIDTH: 1.000000
N3250 ; NOZZLE_CHANGE_START OF0 NF1
N3251 M204 S8000
N3252 G1  X195.245 Y266.314  E2.1885 F1881
N3253 G1  Y267.564  E0.0995
N3254 G1  X167.745  E2.1885
N3255 G1  Y268.814  E0.0995
N3256 G1  X195.245  E2.1885
N3257 G1  Y270.064  E0.0995
N3258 G1  X167.745  E2.1885
N3259 G1  Y271.314  E0.0995
N3260 G1  X195.245  E2.1885
N3261 ; NOZZLE_CHANGE_END OF0 NF1
N3262 M104 T1 S153 N0 ;Multi extruder pre cooling
N3263 
N3264 ; WIPE_START
N3265 G1 F5400
N3266 M204 S8000
N3267 G1 X193.245 Y271.314 E-1.9
N3268 ; WIPE_END
N3269 G1 E-.1 F1800
N3270 M204 S10000
N3271 G17
N3272 G3 Z1 I1.217 J0 P1  F5400
N3273 ; filament end gcode 
N3274 
N3275 ;======== H2D ========
N3276 ;===== 20250604 =====
N3277 M993 A2 B2 C2 ; nozzle cam detection allow status save.
N3278 M993 A0 B0 C0 ; nozzle cam detection not allowed.
N3279 
N3280 
N3281 M1015.4 S0 ; disable E air printing detect
N3282 
N3283 
N3284 M620 S1A
N3285 M1002 gcode_claim_action : 4
N3286 M204 S9000
N3287 
N3288 G1 Z3.6 F1200
N3289 
N3290 M400
N3291 M106 P1 S0
N3292 M106 P2 S0
N3293 
N3294 
N3295 
N3296 
N3297 M620.10 A0 F149.669 L0 H0.4 T270 P255 S1
N3298 
N3299 
N3300 
N3301 M620.10 A1 F79.8237 L0 H0.4 T250 P240 S1
N3302 
N3303 
N3304 
N3305 M620.11 P0 I0 E0
N3306 
N3307 
N3308 
N3309 M620.11 K1 I0 R10 F200
N3310 
N3311 
N3312 M628 S1
N3313 
N3314 
N3315 M620.11 S1 L0 I0 R10 D8 E-10 F200
N3316 
N3317 
N3318 M629
N3319 
N3320 
N3321 M620.11 H2 C331
N3322 
N3323 
N3324 T1
N3325 M73 E3
N3326 
N3327 ;deretract
N3328 
N3329 
N3330 
N3331 ; VFLUSH_START
N3332 
N3333 
N3334 ;VG1 E0 F79
N3335 
N3336 
N3337 SYNC T0
N3338 
N3339 ; VFLUSH_END
N3340 
N3341 M1002 set_filament_type:TPU
N3342 
N3343 M400
N3344 M83
N3345 
N3346 
N3347 
N3348 M628 S0
N3349 ;VM109 S240
N3350 M629
N3351 M400
N3352 
N3353 M983.3 F1.33333 A0.4
N3354 
N3355 
N3356 M400
N3357 
N3358 G1 Y320 F30000
N3359 G1 X201
N3360 
N3361 G1 Y295
N3362 G1 Y265 F18000
N3363 G1 Z3.6 F3000
N3364 
N3365 M204 S8000
N3366 
N3367 
N3368 M621 S1A
N3369 
N3370 M993 A3 B3 C3 ; nozzle cam detection allow status restore.
N3371 
N3372 
N3373 M1015.3 S1;enable tpu clog detect
N3374 
N3375 
N3376 
N3377 M1015.4 S0 ; disable E air printing detect
N3378 
N3379 
N3380 M620.6 I1 W1 ;enable ams air printing detect
N3381 M1002 gcode_claim_action : 0
N3382 M106 S255
N3383 M106 P2 S255
N3384 G1 X200 Y252.564 F60000
N3385 G1 Z.6
N3386 G1 X195.495 Y252.564 Z1
N3387 
N3388 ; filament start gcode
N3389 G1 Z.6
N3390 G1 E2 F1800
N3391 
N3392 G4 S0
N3393 ; CP TOOLCHANGE WIPE
N3394 ; LINE_WIDTH: 0.500000
N3395 M204 S8000
N3396 G1  X192.495 Y252.564  E0.1140 F1782
N3397 G1 E-0.8000 F1800
N3398 M204 S10000
N3399 G1  X196.995  F600
N3400 G1  X195.495  F240
N3401 G1  X195.995  F600
N3402 G1  Y253.064 
N3403 M73 P34 R35
N3404 G1  X194.995 
N3405 G1  Y252.064 
N3406 G1  X196.495 
N3407 G1  Y253.564 
N3408 G1  X194.495 
N3409 G1  Y251.564 
N3410 G1  X192.495 Y252.564   F1782
N3411 G1 E0.8000 F1800
N3412 M204 S8000
N3413 G1  X167.495  E0.9502 F1782
N3414 G1  Y253.314  E0.0285
N3415 G1  X195.495  E1.0642 F2025
N3416 G1  Y254.064  E0.0285
N3417 G1  X167.495  E1.0642 F2100
N3418 G1  Y254.814  E0.0285
N3419 G1  X195.495  E1.0642
N3420 G1  Y255.564  E0.0285
N3421 G1  X167.495  E1.0642
N3422 G1  Y256.314  E0.0285
N3423 G1  X195.495  E1.0642
N3424 G1  Y257.064  E0.0285
N3425 G1  X167.495  E1.0642
N3426 G1  Y257.814  E0.0285
N3427 G1  X195.495  E1.0642
N3428 G1  Y258.564  E0.0285
N3429 G1  X167.495  E1.0642
N3430 G1  Y259.314  E0.0285
N3431 G1  X195.495  E1.0642
N3432 G1  Y260.064  E0.0285
N3433 G1  X167.495  E1.0642
N3434 G1  Y260.814  E0.0285
N3435 G1  X195.495  E1.0642
N3436 G1  Y261.564  E0.0285
N3437 G1  X167.495  E1.0642
N3438 G1  Y262.314  E0.0285
N3439 G1  X195.495  E1.0642
N3440 G1  Y263.064  E0.0285
N3441 G1  X167.495  E1.0642
N3442 G1  Y263.814  E0.0285
N3443 G1  X195.495  E1.0642
N3444 G1  Y264.564  E0.0285
N3445 G1  X167.495  E1.0642
N3446 G1  Y265.314  E0.0285
N3447 G1  X195.495  E1.0642
N3448 ; WIPE_TOWER_END
N3449 M220 R
N3450 G1 F60000
N3451 G4 S0
N3452 G92 E0
N3453 ; CP TOOLCHANGE END
N3454 ;------------------
N3455 
N3456 
N3457 
N3458 ; WIPE_START
N3459 G1 F5400
N3460 M204 S8000
N3461 G1 X193.495 Y265.314 E-.76
N3462 ; WIPE_END
N3463 G1 E-.04 F1800
N3464 M204 S10000
N3465 G17
N3466 G3 Z1 I1.217 J0 P1  F60000
N3467 ; OBJECT_ID: 239
N3468 ; COOLING_NODE: 0
N3469 ; start printing object, unique label id: 239
N3470 M624 AgAAAAAAAAA=
N3471 G1 X183.107 Y117.516
N3472 G1 Z.6
N3473 G1 E.8 F1800
N3474 ; FEATURE: Outer wall
N3475 ; LINE_WIDTH: 0.42
N3476 ; LAYER_HEIGHT: 0.2
N3477 G1 F2545.881
N3478 M204 S5000
N3479 G1 X168.527 Y117.516 E.45715
N3480 G1 X168.527 Y116.936 E.01819
N3481 M73 P34 R34
N3482 G1 X183.107 Y116.936 E.45715
N3483 G1 X183.107 Y117.456 E.0163
N3484 M204 S10000
N3485 G1 X182.911 Y117.226 F60000
N3486 ; FEATURE: Gap infill
N3487 ; LINE_WIDTH: 0.23088
N3488 G1 F5107.47
N3489 M204 S8000
N3490 G1 X168.723 Y117.226 E.22174
N3491 ; CHANGE_LAYER
N3492 ; Z_HEIGHT: 0.8
N3493 ; LAYER_HEIGHT: 0.2
N3494 ; WIPE_START
N3495 G1 F5107.47
N3496 G1 X170.723 Y117.226 E-.76
N3497 ; WIPE_END
N3498 G1 E-.04 F1800
N3499 ; stop printing object, unique label id: 239
N3500 M625
N3501 ;======== H2D 20250521========
N3502 ; layer num/total_layer_count: 4/63
N3503 ; update layer progress
N3504 M73 L4
N3505 M991 S0 P3 ;notify layer change
N3506 
N3507 
N3508 ; OBJECT_ID: 239
N3509 ; COOLING_NODE: 0
N3510 ; start printing object, unique label id: 239
N3511 M624 AgAAAAAAAAA=
N3512 M204 S10000
N3513 G17
N3514 G3 Z1 I-.028 J1.217 P1  F60000
N3515 G1 X183.107 Y117.516 Z1
N3516 G1 Z.8
N3517 G1 E.8 F1800
N3518 ; FEATURE: Outer wall
N3519 ; LINE_WIDTH: 0.42
N3520 ; LAYER_HEIGHT: 0.2
N3521 G1 F2545.881
N3522 M204 S5000
N3523 G1 X168.527 Y117.516 E.45715
N3524 G1 X168.527 Y116.936 E.01819
N3525 G1 X183.107 Y116.936 E.45715
N3526 G1 X183.107 Y117.456 E.0163
N3527 M204 S10000
N3528 G1 X182.911 Y117.226 F60000
N3529 ; FEATURE: Gap infill
N3530 ; LINE_WIDTH: 0.23088
N3531 G1 F5107.47
N3532 M204 S8000
N3533 G1 X168.723 Y117.226 E.22174
N3534 ; WIPE_START
N3535 G1 X170.723 Y117.226 E-.76
N3536 ; WIPE_END
N3537 G1 E-.04 F1800
N3538 ; stop printing object, unique label id: 239
N3539 M625
N3540 M204 S10000
N3541 G17
N3542 G3 Z1.2 I-1.217 J-.026 P1  F60000
N3543 G1 X167.495 Y265.564 Z1.2
N3544 G1 Z.8
N3545 G1 E.8 F1800
N3546 ; LAYER_HEIGHT: 0.200000
N3547 ; FEATURE: Prime tower
N3548 ; LINE_WIDTH: 0.500000
N3549 ; WIPE_TOWER_START
N3550 M204 S8000
N3551 G1  X167.495 Y260.064  E0.2090 F2100
N3552 G1  X195.495  E1.0642
N3553 G1  Y265.564  E0.2090
N3554 G1  X167.495  E1.0642
N3555 M204 S10000
N3556 G1  X168.495 Y260.064  
N3557 ;--------------------
N3558 ; CP EMPTY GRID START
N3559 ; layer #5
N3560 M204 S8000
N3561 G1  Y265.564  E0.2090
N3562 M204 S10000
N3563 G1  X177.162 
N3564 M204 S8000
N3565 G1  Y260.064  E0.2090
N3566 M204 S10000
N3567 G1  X185.828 
N3568 M204 S8000
N3569 G1  Y265.564  E0.2090
N3570 M204 S10000
N3571 G1  X194.495 
N3572 M204 S8000
N3573 G1  Y260.064  E0.2090
N3574 ; CP EMPTY GRID END
N3575 ;------------------
N3576 
N3577 
N3578 
N3579 
N3580 
N3581 
N3582 ; WIPE_TOWER_END
N3583 ; LAYER_HEIGHT: 0.200000
N3584 ; FEATURE: Prime tower
N3585 ; LINE_WIDTH: 0.500000
N3586 ;--------------------
N3587 ; CP TOOLCHANGE START
N3588 ; toolchange #4
N3589 ; material : PCTG -> PCTG
N3590 ;--------------------
N3591 M220 B
N3592 M220 S100
N3593 ; WIPE_TOWER_START
N3594 G1 E-.8 F1800
N3595 G17
N3596 G3 Z1.2 I1.217 J0 P1  F60000
N3597 G1 X167.745 Y252.814 Z.8
N3598 G1 E.8 F1800
N3599 ; LAYER_HEIGHT: 0.200000
N3600 ; FEATURE: Prime tower
N3601 ; LINE_WIDTH: 1.000000
N3602 ; NOZZLE_CHANGE_START OF1 NF0
N3603 M104 T0 S210 N0 ;Multi extruder pre cooling in post extrusion
N3604 M204 S8000
N3605 G1  X195.245 Y252.814  E2.1885 F251
N3606 G1  Y254.314  E0.1194
N3607 G1  X167.745  E2.1885
N3608 G1  Y255.814  E0.1194
N3609 G1  X195.245  E2.1885
N3610 G1  Y257.314  E0.1194
N3611 M104 T1 S255 N0 ;Multi extruder pre heating
N3612 M73 P35 R34
N3613 G1  X167.745  E2.1885
N3614 G1  Y258.814  E0.1194
N3615 G1  X195.245  E2.1885
N3616 M204 S10000
N3617 G1  Y259.814 
N3618 G1  X168.245  F398
N3619 G1  Y258.314 
N3620 G1  X194.745 
N3621 G1  Y256.814 
N3622 G1  X168.245 
N3623 G1  Y255.314 
N3624 M73 P36 R34
N3625 G1  X194.745 
N3626 G1  Y253.814 
N3627 G1  X168.245 
N3628 ; NOZZLE_CHANGE_END OF1 NF0
N3629 M104 T0 S114 N0 ;Multi extruder pre cooling
N3630 
N3631 G1 E-2 F1800
N3632 G17
N3633 G3 Z1.2 I1.217 J0 P1  F5400
N3634 ; filament end gcode 
N3635 
N3636 ;======== H2D ========
N3637 ;===== 20250604 =====
N3638 M993 A2 B2 C2 ; nozzle cam detection allow status save.
N3639 M993 A0 B0 C0 ; nozzle cam detection not allowed.
N3640 
N3641 
N3642 M1015.4 S0 ; disable E air printing detect
N3643 
N3644 
N3645 M620 S0A
N3646 M1002 gcode_claim_action : 4
N3647 M204 S9000
N3648 
N3649 G1 Z3.8 F1200
N3650 
N3651 M400
N3652 M106 P1 S0
N3653 M106 P2 S0
N3654 
N3655 
N3656 
N3657 
N3658 M620.10 A0 F79.8237 L0 H0.4 T250 P240 S1
N3659 
N3660 
N3661 
N3662 M620.10 A1 F149.669 L0 H0.4 T270 P255 S1
N3663 
N3664 
N3665 
N3666 M620.11 P0 I1 E0
N3667 
N3668 
N3669 
N3670 M620.11 K1 I1 R0 F200
N3671 
N3672 
N3673 M628 S1
N3674 
N3675 M620.11 S0 L0 I1 E-10 F200
N3676 
N3677 M629
N3678 
N3679 
N3680 M620.11 H2 C331
N3681 
N3682 
N3683 T0
N3684 M73 E2
N3685 
N3686 ;deretract
N3687 
N3688 
N3689 M73 P36 R33
N3690 ;VG1 E4 F200
N3691 ;VG1 E4 F100
N3692 
N3693 
N3694 
N3695 ; VFLUSH_START
N3696 
N3697 
N3698 ;VG1 E0 F79
N3699 
N3700 
N3701 SYNC T0
N3702 
N3703 ; VFLUSH_END
N3704 
N3705 M1002 set_filament_type:PCTG
N3706 
N3707 M400
N3708 M83
N3709 
N3710 
N3711 
N3712 M628 S0
N3713 ;VM109 S255
N3714 M629
N3715 M400
N3716 
N3717 M983.3 F2.5 A0.4
N3718 
N3719 
N3720 M400
N3721 
N3722 G1 Y320 F30000
N3723 G1 X201
N3724 
N3725 G1 Y295
N3726 G1 Y265 F18000
N3727 G1 Z3.8 F3000
N3728 
N3729 M204 S8000
N3730 
N3731 
N3732 M621 S0A
N3733 
N3734 M993 A3 B3 C3 ; nozzle cam detection allow status restore.
N3735 
N3736 
N3737 M1015.3 S0;disable tpu clog detect
N3738 
N3739 
N3740 
N3741 M1015.4 S0 ; disable E air printing detect
N3742 
N3743 
N3744 M620.6 I0 W1 ;enable ams air printing detect
N3745 M1002 gcode_claim_action : 0
N3746 M106 S25.5
N3747 M106 P2 S0
N3748 G1 X200 Y265.364 F60000
N3749 G1 Z.8
N3750 G1 X200 Y272.996 Z1.2
N3751 G1 X200 Y283.638 Z1.2
N3752 G1 X162.991 Y283.638
N3753 G1 X162.991 Y278.814
N3754 G1 X167.495 Y278.814
N3755 
N3756 ; filament start gcode
N3757 G1 Z.8
N3758 G1 E2 F1800
N3759 
N3760 G4 S0
N3761 ; CP TOOLCHANGE WIPE
N3762 ; LINE_WIDTH: 0.500000
N3763 M204 S8000
N3764 G1  X170.495 Y278.814  E0.1140 F1782
N3765 G1 E-0.8000 F1800
N3766 M204 S10000
N3767 G1  X165.995  F600
N3768 G1  X167.495  F240
N3769 G1  X167.995  F600
N3770 G1  Y279.314 
N3771 G1  X166.995 
N3772 G1  Y278.314 
N3773 G1  X168.495 
N3774 G1  Y279.814 
N3775 G1  X166.495 
N3776 G1  Y277.814 
N3777 G1  X170.495 Y278.814   F1782
N3778 G1 E0.8000 F1800
N3779 M204 S8000
N3780 G1  X195.495  E0.9502 F1782
N3781 G1  Y278.064  E0.0285
N3782 G1  X167.495  E1.0642 F2025
N3783 G1  Y277.314  E0.0285
N3784 G1  X195.495  E1.0642 F2473
N3785 G1  Y276.564  E0.0285
N3786 G1  X167.495  E1.0642 F3938
N3787 G1  Y275.814  E0.0285
N3788 G1  X195.495  E1.0642
N3789 G1  Y275.064  E0.0285
N3790 G1  X167.495  E1.0642
N3791 G1  Y274.314  E0.0285
N3792 G1  X195.495  E1.0642
N3793 G1  Y273.564  E0.0285
N3794 G1  X167.495  E1.0642
N3795 G1  Y272.814  E0.0285
N3796 G1  X195.495  E1.0642
N3797 G1  Y272.064  E0.0285
N3798 G1  X167.495  E1.0642
N3799 G1  Y271.314  E0.0285
N3800 M73 P37 R33
N3801 G1  X195.495  E1.0642
N3802 G1  Y270.564  E0.0285
N3803 G1  X167.495  E1.0642
N3804 G1  Y269.814  E0.0285
N3805 G1  X195.495  E1.0642
N3806 G1  Y269.064  E0.0285
N3807 G1  X167.495  E1.0642
N3808 G1  Y268.314  E0.0285
N3809 G1  X195.495  E1.0642
N3810 G1  Y267.564  E0.0285
N3811 G1  X167.495  E1.0642
N3812 G1  Y266.814  E0.0285
N3813 G1  X195.495  E1.0642
N3814 G1  Y266.064  E0.0285
N3815 G1  X167.495  E1.0642
N3816 ; WIPE_TOWER_END
N3817 M220 R
N3818 G1 F60000
N3819 G4 S0
N3820 G92 E0
N3821 ; CP TOOLCHANGE END
N3822 ;------------------
N3823 
N3824 
N3825 G1  Y252.064  
N3826 ; LAYER_HEIGHT: 0.200000
N3827 ; FEATURE: Prime tower
N3828 ; LINE_WIDTH: 0.500000
N3829 ; WIPE_TOWER_START
N3830 M204 S10000
N3831 G1  X168.371 Y281.015  
N3832 M204 S8000
N3833 G1  X167.144 Y279.721   E0.0678 F3938
N3834 G1 E-0.8000 F1800
N3835 M204 S10000
N3836 G1  X165.426 Y277.905   F600
N3837 G1 E0.8000 F1800
N3838 M204 S8000
N3839 G3  X166.033 Y274.920   I1.593 J-1.230 E0.1313 F3938
N3840 G2  X166.995 Y272.245   I-3.254 J-2.680 E0.1102
N3841 G2  X166.992 Y259.212   I-321.195 J-6.431 E0.4954
N3842 G2  X165.146 Y255.634   I-6.663 J1.171 E0.1554
N3843 G3  X165.485 Y253.656   I1.658 J-0.734 E0.0808
N3844 G3  X168.604 Y250.403   I19.398 J15.476 E0.1715
N3845 G3  X171.793 Y251.056   I1.276 J1.879 E0.1379
N3846 G2  X174.808 Y252.064   I3.021 J-4.025 E0.1229
N3847 G2  X188.372 Y252.060   I6.687 J-357.435 E0.5155
N3848 G2  X192.307 Y250.183   I-0.499 J-6.110 E0.1694
N3849 G3  X194.619 Y250.613   I0.854 J1.838 E0.0953
N3850 G1  X195.995 Y252.064   E0.0760
N3851 G1 E0.0000
N3852 G3  X197.926 Y254.386   I-3.871 J5.182 E0.1159
N3853 G3  X196.750 Y256.979   I-2.902 J0.247 E0.1130
N3854 G2  X195.995 Y259.382   I3.464 J2.409 E0.0972
N3855 G2  X195.998 Y272.416   I321.212 J6.432 E0.4954
N3856 G2  X197.844 Y275.994   I6.663 J-1.171 E0.1554
N3857 G3  X197.504 Y277.972   I-1.658 J0.734 E0.0808
N3858 G1  X195.995 Y279.564   E0.0834
N3859 G3  X193.533 Y281.605   I-4.373 J-2.768 E0.1236
N3860 G3  X190.885 Y280.355   I0.012 J-3.454 E0.1149
N3861 G2  X188.182 Y279.564   I-2.709 J4.247 E0.1085
N3862 G2  X174.618 Y279.568   I-6.687 J357.435 E0.5155
N3863 G2  X170.683 Y281.445   I0.499 J6.110 E0.1694
N3864 G3  X168.371 Y281.015   I-0.854 J-1.838 E0.0953
N3865 ; WIPE_TOWER_END
N3866 
N3867 ; WIPE_START
N3868 G1 F5107.47
N3869 M204 S8000
N3870 G1 X168.484 Y281.125 E-.05968
N3871 G1 X168.604 Y281.225 E-.05967
N3872 G1 X168.733 Y281.316 E-.05968
N3873 G1 X168.868 Y281.396 E-.05968
N3874 G1 X169.008 Y281.466 E-.05967
N3875 G1 X169.154 Y281.524 E-.05967
N3876 G1 X169.304 Y281.571 E-.05967
N3877 G1 X169.457 Y281.605 E-.05968
N3878 G1 X169.613 Y281.628 E-.05967
N3879 G1 X169.769 Y281.638 E-.05968
N3880 G1 X169.927 Y281.636 E-.05968
N3881 G1 X170.083 Y281.622 E-.05967
N3882 G1 X170.197 Y281.603 E-.04391
N3883 ; WIPE_END
N3884 G1 E-.04 F1800
N3885 M204 S10000
N3886 G17
N3887 G3 Z1.2 I1.217 J0 P1  F60000
N3888 ; OBJECT_ID: 229
N3889 ; COOLING_NODE: 0
N3890 ; start printing object, unique label id: 229
N3891 M624 AQAAAAAAAAA=
N3892 G1 X191.084 Y200.639 Z.8
N3893 G1 E.8 F1800
N3894 ; FEATURE: Inner wall
N3895 ; LINE_WIDTH: 0.45
N3896 ; LAYER_HEIGHT: 0.2
N3897 G1 F4421.739
N3898 M204 S8000
N3899 G1 X158.916 Y200.639 E1.03439
N3900 G1 X158.916 Y127.036 E2.36678
N3901 G1 X191.084 Y127.036 E1.03439
N3902 G1 X191.084 Y200.579 E2.36485
N3903 ; COOLING_NODE: 0
N3904 M204 S10000
N3905 G1 X191.491 Y201.046 F60000
N3906 G1 F4421.739
N3907 M204 S8000
N3908 G1 X158.509 Y201.046 E1.06057
N3909 G1 X158.509 Y126.629 E2.39296
N3910 G1 X191.491 Y126.629 E1.06057
N3911 G1 X191.491 Y200.986 E2.39103
N3912 ; COOLING_NODE: 0
N3913 M204 S10000
N3914 G1 X191.898 Y201.453 F60000
N3915 G1 F4421.739
N3916 M204 S8000
N3917 G1 X158.102 Y201.453 E1.08675
N3918 G1 X158.102 Y126.222 E2.41914
N3919 G1 X191.898 Y126.222 E1.08675
N3920 G1 X191.898 Y201.393 E2.41721
N3921 ; COOLING_NODE: 0
N3922 M204 S10000
N3923 G1 X192.29 Y201.845 F60000
N3924 ; FEATURE: Outer wall
N3925 ; LINE_WIDTH: 0.42
N3926 G1 F4773.528
N3927 M204 S5000
N3928 G1 X157.71 Y201.845 E1.03002
N3929 G1 X157.71 Y125.83 E2.26421
N3930 G1 X192.29 Y125.83 E1.03002
N3931 G1 X192.29 Y201.785 E2.26243
N3932 G1 E-.8 F1800
N3933 M204 S10000
N3934 G1 X184.677 Y201.239 Z1.2 F60000
N3935 G1 X171.447 Y200.29 Z1.2
N3936 G1 Z.8
N3937 G1 E.8 F1800
N3938 ; FEATURE: Sparse infill
N3939 ; LINE_WIDTH: 0.45
N3940 G1 F4421.739
N3941 M204 S8000
N3942 G1 X173.076 Y200.29 E.05236
N3943 G1 X190.736 Y134.383 E2.19411
N3944 G1 X190.736 Y132.717 E.05356
N3945 G1 X185.403 Y127.385 E.2425
N3946 G1 X184.182 Y127.385 E.03927
N3947 G1 X164.647 Y200.29 E2.42708
N3948 G1 X163.019 Y200.29 E.05236
N3949 M204 S10000
N3950 G1 X159.264 Y190.549 F60000
N3951 G1 F4421.739
N3952 M204 S8000
N3953 G1 X159.264 Y188.921 E.05236
N3954 G1 X175.753 Y127.385 E2.04859
N3955 G1 X173.889 Y127.385 E.05994
N3956 G1 X190.736 Y144.231 E.76611
N3957 G1 X190.736 Y143.349 E.02836
N3958 G1 X159.264 Y151.782 E1.0477
N3959 G1 X159.264 Y150.154 E.05236
N3960 M204 S10000
N3961 G1 X159.264 Y161.839 F60000
N3962 G1 F4421.739
N3963 M204 S8000
N3964 G1 X159.264 Y160.211 E.05236
N3965 G1 X190.736 Y151.778 E1.04769
N3966 G1 X190.736 Y155.745 E.12757
N3967 G1 X162.375 Y127.385 E1.28972
N3968 G1 X167.324 Y127.385 E.15915
N3969 G1 X159.264 Y157.464 E1.00137
N3970 G1 X159.264 Y158.816 E.04346
N3971 G1 X190.736 Y190.287 E1.43118
N3972 G1 X190.736 Y185.493 E.15415
N3973 G1 X159.264 Y193.926 E1.0477
N3974 G1 X159.264 Y193.358 E.01827
N3975 G1 X166.197 Y200.29 E.31526
N3976 G1 X166.969 Y200.29 E.02481
N3977 G1 X190.736 Y193.922 E.79122
N3978 G1 X190.736 Y197.296 E.1085
N3979 G1 X189.933 Y200.29 E.09968
N3980 G1 X189.225 Y200.29 E.02278
N3981 G1 X159.264 Y170.33 E1.36248
N3982 G1 X159.264 Y168.639 E.05436
N3983 G1 X190.736 Y160.207 E1.0477
N3984 G1 X190.736 Y165.839 E.18112
N3985 G1 X181.504 Y200.29 E1.1469
N3986 G1 X177.711 Y200.29 E.12198
N3987 G1 X159.264 Y181.844 E.83887
N3988 G1 X159.264 Y185.497 E.11748
N3989 G1 X190.736 Y177.064 E1.0477
N3990 G1 X190.736 Y178.773 E.05494
N3991 G1 X159.264 Y147.302 E1.43118
N3992 G1 X159.264 Y143.353 E.12698
N3993 G1 X190.736 Y134.92 E1.0477
N3994 M204 S10000
N3995 G1 X189.031 Y127.385 F60000
N3996 G1 F4421.739
N3997 M204 S8000
N3998 G1 X187.403 Y127.385 E.05236
N3999 G1 X159.264 Y134.924 E.93674
N4000 G1 X159.264 Y135.788 E.02777
N4001 G1 X190.736 Y167.259 E1.43118
N4002 G1 X190.736 Y168.636 E.04426
N4003 M104 T0 S240 N0 ;Multi extruder pre heating
N4004 G1 X159.264 Y177.068 E1.0477
N4005 G1 X159.264 Y175.44 E.05236
N4006 ; WIPE_START
N4007 G1 X159.264 Y177.068 E-.61876
N4008 G1 X159.623 Y176.972 E-.14124
N4009 ; WIPE_END
N4010 G1 E-.04 F1800
N4011 M204 S10000
N4012 G17
N4013 G3 Z1.2 I1.217 J0 P1  F60000
N4014 ; stop printing object, unique label id: 229
N4015 M625
N4016 ; object ids of layer 4 start: 229,239
N4017 M624 AwAAAAAAAAA=
N4018 ;======== H2D 20250527========
N4019 ; SKIPPABLE_START
N4020 ; SKIPTYPE: timelapse
N4021 M622.1 S1 ; for prev firware, default turned on
N4022 
N4023 M1002 judge_flag timelapse_record_flag
N4024 
N4025 M622 J1
N4026 M993 A2 B2 C2
N4027 M993 A0 B0 C0
N4028 
N4029 
N4030 
N4031 
N4032     M9711 M0 E1 X260 Y141 Z1.2 S11 C10 O0 T3000
N4033 
N4034 
N4035 
N4036 M993 A3 B3 C3
N4037 
N4038 M623
N4039 ; SKIPPABLE_END
N4040 
N4041 ; object ids of this layer4 end: 229,239
N4042 M625
N4043 ; CHANGE_LAYER
N4044 ; Z_HEIGHT: 1
N4045 ; LAYER_HEIGHT: 0.2
N4046 ;======== H2D 20250521========
N4047 ; layer num/total_layer_count: 5/63
N4048 ; update layer progress
N4049 M73 L5
N4050 M991 S0 P4 ;notify layer change
N4051 
N4052 
N4053 ; OBJECT_ID: 229
N4054 ; COOLING_NODE: 0
N4055 ; start printing object, unique label id: 229
N4056 M624 AQAAAAAAAAA=
N4057 G1 X191.084 Y200.639 F60000
N4058 G1 Z1
N4059 G1 E.8 F1800
N4060 ; FEATURE: Inner wall
N4061 ; LINE_WIDTH: 0.45
N4062 ; LAYER_HEIGHT: 0.2
N4063 G1 F4421.739
N4064 M204 S8000
N4065 M73 P38 R33
N4066 G1 X158.916 Y200.639 E1.03439
N4067 G1 X158.916 Y127.036 E2.36678
N4068 G1 X191.084 Y127.036 E1.03439
N4069 G1 X191.084 Y200.579 E2.36485
N4070 ; COOLING_NODE: 0
N4071 M204 S10000
N4072 G1 X191.491 Y201.046 F60000
N4073 G1 F4421.739
N4074 M204 S8000
N4075 G1 X158.509 Y201.046 E1.06057
N4076 G1 X158.509 Y126.629 E2.39296
N4077 G1 X191.491 Y126.629 E1.06057
N4078 G1 X191.491 Y200.986 E2.39103
N4079 ; COOLING_NODE: 0
N4080 M204 S10000
N4081 G1 X191.898 Y201.453 F60000
N4082 G1 F4421.739
N4083 M204 S8000
N4084 G1 X158.102 Y201.453 E1.08675
N4085 G1 X158.102 Y126.222 E2.41914
N4086 G1 X191.898 Y126.222 E1.08675
N4087 G1 X191.898 Y201.393 E2.41721
N4088 ; COOLING_NODE: 0
N4089 M204 S10000
N4090 G1 X192.29 Y201.845 F60000
N4091 ; FEATURE: Outer wall
N4092 ; LINE_WIDTH: 0.42
N4093 G1 F4773.528
N4094 M204 S5000
N4095 G1 X157.71 Y201.845 E1.03002
N4096 M73 P38 R32
N4097 G1 X157.71 Y125.83 E2.26421
N4098 G1 X192.29 Y125.83 E1.03002
N4099 G1 X192.29 Y201.785 E2.26243
N4100 G1 E-.8 F1800
N4101 M204 S10000
N4102 G1 X184.685 Y201.144 Z1.4 F60000
N4103 G1 X174.558 Y200.29 Z1.4
N4104 G1 Z1
N4105 G1 E.8 F1800
N4106 ; FEATURE: Sparse infill
N4107 ; LINE_WIDTH: 0.45
N4108 G1 F4421.739
N4109 M204 S8000
N4110 G1 X172.929 Y200.29 E.05236
N4111 G1 X190.736 Y133.836 E2.2123
N4112 G1 X190.736 Y132.517 E.04242
N4113 G1 X185.603 Y127.385 E.23341
N4114 G1 X184.035 Y127.385 E.05041
N4115 G1 X164.5 Y200.29 E2.42708
N4116 G1 X162.872 Y200.29 E.05236
N4117 M204 S10000
N4118 G1 X159.264 Y190.003 F60000
N4119 G1 F4421.739
N4120 M204 S8000
N4121 G1 X159.264 Y188.375 E.05236
N4122 G1 X175.607 Y127.385 E2.0304
N4123 G1 X174.089 Y127.385 E.0488
N4124 G1 X190.736 Y144.031 E.75702
N4125 G1 X190.736 Y143.496 E.01722
N4126 G1 X159.264 Y151.928 E1.0477
N4127 G1 X159.264 Y150.3 E.05236
N4128 M204 S10000
N4129 G1 X159.264 Y161.985 F60000
N4130 G1 F4421.739
N4131 M204 S8000
N4132 G1 X159.264 Y160.357 E.05236
N4133 G1 X190.736 Y151.924 E1.0477
N4134 G1 X190.736 Y155.545 E.11643
N4135 G1 X162.575 Y127.385 E1.28062
N4136 G1 X167.178 Y127.385 E.14801
N4137 G1 X159.264 Y156.918 E.98318
N4138 G1 X159.264 Y158.616 E.0546
N4139 G1 X190.736 Y190.087 E1.43118
N4140 G1 X190.736 Y185.64 E.14301
N4141 G1 X159.264 Y194.072 E1.0477
N4142 G1 X159.264 Y193.158 E.02941
N4143 G1 X166.397 Y200.29 E.32436
N4144 G1 X167.515 Y200.29 E.03595
N4145 G1 X190.736 Y194.068 E.77303
N4146 G1 X190.736 Y196.75 E.08622
N4147 G1 X189.787 Y200.29 E.11787
N4148 G1 X189.425 Y200.29 E.01164
N4149 G1 X159.264 Y170.13 E1.37158
N4150 G1 X159.264 Y168.786 E.04322
N4151 G1 X190.736 Y160.353 E1.0477
N4152 G1 X190.736 Y165.293 E.15885
N4153 G1 X181.358 Y200.29 E1.16509
N4154 G1 X177.911 Y200.29 E.11085
N4155 G1 X159.264 Y181.644 E.84797
N4156 G1 X159.264 Y185.643 E.12861
N4157 G1 X190.736 Y177.211 E1.0477
N4158 G1 X190.736 Y178.573 E.0438
N4159 G1 X159.264 Y147.102 E1.43118
N4160 G1 X159.264 Y143.499 E.11584
N4161 G1 X190.736 Y135.067 E1.0477
N4162 M204 S10000
N4163 G1 X189.577 Y127.385 F60000
N4164 G1 F4421.739
N4165 M204 S8000
N4166 G1 X187.949 Y127.385 E.05236
N4167 G1 X159.264 Y135.071 E.95493
N4168 G1 X159.264 Y135.588 E.01664
N4169 G1 X190.736 Y167.059 E1.43118
N4170 G1 X190.736 Y168.782 E.0554
N4171 G1 X159.264 Y177.215 E1.0477
N4172 G1 X159.264 Y175.586 E.05236
N4173 ; WIPE_START
N4174 G1 X159.264 Y177.215 E-.61876
N4175 G1 X159.623 Y177.118 E-.14124
N4176 ; WIPE_END
N4177 G1 E-.04 F1800
N4178 M204 S10000
N4179 G17
N4180 G3 Z1.4 I1.217 J0 P1  F60000
N4181 ; stop printing object, unique label id: 229
N4182 M625
N4183 ; object ids of layer 5 start: 229,239
N4184 M624 AwAAAAAAAAA=
N4185 ;======== H2D 20250527========
N4186 ; SKIPPABLE_START
N4187 ; SKIPTYPE: timelapse
N4188 M622.1 S1 ; for prev firware, default turned on
N4189 
N4190 M1002 judge_flag timelapse_record_flag
N4191 
N4192 M622 J1
N4193 M993 A2 B2 C2
N4194 M993 A0 B0 C0
N4195 
N4196 
N4197 
N4198 
N4199     M9711 M0 E1 X260 Y141 Z1.4 S11 C10 O0 T3000
N4200 
N4201 
N4202 
N4203 M993 A3 B3 C3
N4204 
N4205 M623
N4206 ; SKIPPABLE_END
N4207 
N4208 ; object ids of this layer5 end: 229,239
N4209 M625
N4210 G1 X167.495 Y279.064
N4211 G1 Z1
N4212 G1 E.8 F1800
N4213 ; LAYER_HEIGHT: 0.200000
N4214 ; FEATURE: Prime tower
N4215 ; LINE_WIDTH: 0.500000
N4216 ; WIPE_TOWER_START
N4217 M204 S10000
N4218 G1  X166.995 Y279.564  
N4219 M204 S8000
N4220 G3  X165.064 Y277.242   I3.871 J-5.183 E0.1159 F3938
N4221 G3  X166.240 Y274.649   I2.902 J-0.247 E0.1130
N4222 G2  X166.995 Y272.245   I-3.465 J-2.409 E0.0972
N4223 G2  X166.992 Y259.212   I-321.195 J-6.431 E0.4954
N4224 G2  X165.146 Y255.634   I-6.663 J1.171 E0.1554
N4225 G3  X165.661 Y253.471   I1.721 J-0.733 E0.0905
N4226 G1 E-0.8000 F1800
N4227 M204 S10000
N4228 G1  X167.381 Y251.657   F600
N4229 G1 E0.8000 F1800
N4230 M204 S8000
N4231 G3  X170.238 Y250.033   I2.765 J1.539 E0.1313 F3938
N4232 G3  X172.775 Y251.633   I-12.405 J22.473 E0.1141
N4233 G2  X174.808 Y252.064   I2.042 J-4.626 E0.0796
N4234 G2  X188.372 Y252.060   I6.687 J-357.435 E0.5155
N4235 G2  X192.307 Y250.183   I-0.499 J-6.110 E0.1694
N4236 G3  X194.619 Y250.613   I0.854 J1.838 E0.0953
N4237 G1  X195.995 Y252.064   E0.0760
N4238 G1 E0.0000
N4239 G3  X197.926 Y254.386   I-3.871 J5.182 E0.1159
N4240 G3  X196.750 Y256.979   I-2.902 J0.247 E0.1130
N4241 G2  X195.995 Y259.382   I3.464 J2.409 E0.0972
N4242 G2  X195.998 Y272.416   I321.212 J6.432 E0.4954
N4243 G2  X197.844 Y275.994   I6.663 J-1.171 E0.1554
N4244 G3  X197.504 Y277.972   I-1.658 J0.734 E0.0808
N4245 G1  X195.995 Y279.564   E0.0834
N4246 G3  X193.533 Y281.605   I-4.373 J-2.768 E0.1236
N4247 G3  X190.885 Y280.355   I0.012 J-3.454 E0.1149
N4248 G2  X188.182 Y279.564   I-2.709 J4.247 E0.1085
N4249 G2  X174.618 Y279.568   I-6.687 J357.435 E0.5155
N4250 G2  X170.683 Y281.445   I0.499 J6.110 E0.1694
N4251 G3  X168.371 Y281.015   I-0.854 J-1.838 E0.0953
N4252 G1  X166.995 Y279.564   E0.0760
N4253 ; WIPE_TOWER_END
N4254 G1  X167.495 Y252.064  
N4255 ; LAYER_HEIGHT: 0.200000
N4256 ; FEATURE: Prime tower
N4257 ; LINE_WIDTH: 0.500000
N4258 ; WIPE_TOWER_START
N4259 M204 S8000
N4260 G1  Y272.314  E0.2565
N4261 G1  X195.495  E1.0642
N4262 G1  Y279.064  E0.2565
N4263 G1  X167.495  E1.0642
N4264 M204 S10000
N4265 G1  X168.495 Y272.314  
N4266 ;--------------------
N4267 ; CP EMPTY GRID START
N4268 ; layer #6
N4269 M204 S8000
N4270 G1  Y279.064  E0.2565
N4271 M204 S10000
N4272 G1  X177.162 
N4273 M204 S8000
N4274 G1  Y272.314  E0.2565
N4275 M204 S10000
N4276 G1  X185.828 
N4277 M204 S8000
N4278 G1  Y279.064  E0.2565
N4279 M204 S10000
N4280 G1  X194.495 
N4281 M204 S8000
N4282 G1  Y272.314  E0.2565
N4283 ; CP EMPTY GRID END
N4284 ;------------------
N4285 
N4286 
N4287 
N4288 
N4289 
N4290 
N4291 ; WIPE_TOWER_END
N4292 ; LAYER_HEIGHT: 0.200000
N4293 ; FEATURE: Prime tower
N4294 ; LINE_WIDTH: 0.500000
N4295 ;--------------------
N4296 ; CP TOOLCHANGE START
N4297 ; toolchange #5
N4298 ; material : TPU -> TPU
N4299 ;--------------------
N4300 M220 B
N4301 M220 S100
N4302 ; WIPE_TOWER_START
N4303 G1 E-.8 F1800
N4304 G17
N4305 G3 Z1.4 I1.217 J0 P1  F60000
N4306 G1 X167.745 Y266.314
N4307 G1 Z1
N4308 G1 E.8 F1800
N4309 ; LAYER_HEIGHT: 0.200000
N4310 ; FEATURE: Prime tower
N4311 ; LINE_WIDTH: 1.000000
N4312 ; NOZZLE_CHANGE_START OF0 NF1
N4313 M204 S8000
N4314 G1  X195.245 Y266.314  E2.1885 F1881
N4315 G1  Y267.564  E0.0995
N4316 G1  X167.745  E2.1885
N4317 G1  Y268.814  E0.0995
N4318 G1  X195.245  E2.1885
N4319 G1  Y270.064  E0.0995
N4320 M73 P39 R32
N4321 G1  X167.745  E2.1885
N4322 G1  Y271.314  E0.0995
N4323 G1  X195.245  E2.1885
N4324 ; NOZZLE_CHANGE_END OF0 NF1
N4325 M104 T1 S161 N0 ;Multi extruder pre cooling
N4326 
N4327 ; WIPE_START
N4328 G1 F5400
N4329 M204 S8000
N4330 G1 X193.245 Y271.314 E-1.9
N4331 ; WIPE_END
N4332 G1 E-.1 F1800
N4333 M204 S10000
N4334 G17
N4335 G3 Z1.4 I1.217 J0 P1  F5400
N4336 ; filament end gcode 
N4337 
N4338 ;======== H2D ========
N4339 ;===== 20250604 =====
N4340 M993 A2 B2 C2 ; nozzle cam detection allow status save.
N4341 M993 A0 B0 C0 ; nozzle cam detection not allowed.
N4342 
N4343 
N4344 M1015.4 S0 ; disable E air printing detect
N4345 
N4346 
N4347 M620 S1A
N4348 M1002 gcode_claim_action : 4
N4349 M204 S9000
N4350 
N4351 G1 Z4 F1200
N4352 
N4353 M400
N4354 M106 P1 S0
N4355 M106 P2 S0
N4356 
N4357 
N4358 
N4359 
N4360 M620.10 A0 F149.669 L0 H0.4 T270 P255 S1
N4361 
N4362 
N4363 
N4364 M620.10 A1 F79.8237 L0 H0.4 T250 P240 S1
N4365 
N4366 
N4367 
N4368 M620.11 P0 I0 E0
N4369 
N4370 
N4371 
N4372 M620.11 K1 I0 R10 F200
N4373 
N4374 
N4375 M628 S1
N4376 
N4377 
N4378 M620.11 S1 L0 I0 R10 D8 E-10 F200
N4379 
N4380 
N4381 M629
N4382 
N4383 
N4384 M620.11 H2 C331
N4385 
N4386 
N4387 T1
N4388 M73 E1
N4389 
N4390 ;deretract
N4391 
N4392 
N4393 
N4394 ; VFLUSH_START
N4395 
N4396 
N4397 ;VG1 E0 F79
N4398 
N4399 
N4400 SYNC T0
N4401 
N4402 ; VFLUSH_END
N4403 
N4404 M1002 set_filament_type:TPU
N4405 
N4406 M400
N4407 M83
N4408 
N4409 
N4410 
N4411 M628 S0
N4412 ;VM109 S240
N4413 M629
N4414 M400
N4415 
N4416 M983.3 F1.33333 A0.4
N4417 
N4418 
N4419 M400
N4420 
N4421 G1 Y320 F30000
N4422 G1 X201
N4423 
N4424 G1 Y295
N4425 G1 Y265 F18000
N4426 G1 Z4 F3000
N4427 
N4428 M204 S8000
N4429 
N4430 
N4431 M621 S1A
N4432 
N4433 M993 A3 B3 C3 ; nozzle cam detection allow status restore.
N4434 
N4435 
N4436 M1015.3 S1;enable tpu clog detect
N4437 
N4438 
N4439 
N4440 M1015.4 S0 ; disable E air printing detect
N4441 
N4442 
N4443 M620.6 I1 W1 ;enable ams air printing detect
N4444 M1002 gcode_claim_action : 0
N4445 M106 S255
N4446 M106 P2 S255
N4447 G1 X200 Y264.673 F60000
N4448 G1 Z1
N4449 G1 X200 Y257.04 Z1.4
N4450 G1 X200 Y247.99 Z1.4
N4451 G1 X162.991 Y247.99
N4452 G1 X162.991 Y252.564
N4453 G1 X167.495 Y252.564
N4454 
N4455 ; filament start gcode
N4456 G1 Z1
N4457 G1 E2 F1800
N4458 
N4459 G4 S0
N4460 ; CP TOOLCHANGE WIPE
N4461 ; LINE_WIDTH: 0.500000
N4462 M204 S8000
N4463 G1  X170.495 Y252.564  E0.1140 F1782
N4464 G1 E-0.8000 F1800
N4465 M204 S10000
N4466 G1  X165.995  F600
N4467 G1  X167.495  F240
N4468 G1  X167.995  F600
N4469 G1  Y253.064 
N4470 G1  X166.995 
N4471 G1  Y252.064 
N4472 G1  X168.495 
N4473 G1  Y253.564 
N4474 G1  X166.495 
N4475 G1  Y251.564 
N4476 G1  X170.495 Y252.564   F1782
N4477 G1 E0.8000 F1800
N4478 M204 S8000
N4479 G1  X195.495  E0.9502 F1782
N4480 G1  Y253.314  E0.0285
N4481 G1  X167.495  E1.0642 F2025
N4482 G1  Y254.064  E0.0285
N4483 G1  X195.495  E1.0642 F2100
N4484 G1  Y254.814  E0.0285
N4485 G1  X167.495  E1.0642
N4486 G1  Y255.564  E0.0285
N4487 G1  X195.495  E1.0642
N4488 G1  Y256.314  E0.0285
N4489 G1  X167.495  E1.0642
N4490 G1  Y257.064  E0.0285
N4491 G1  X195.495  E1.0642
N4492 G1  Y257.814  E0.0285
N4493 G1  X167.495  E1.0642
N4494 G1  Y258.564  E0.0285
N4495 G1  X195.495  E1.0642
N4496 G1  Y259.314  E0.0285
N4497 G1  X167.495  E1.0642
N4498 G1  Y260.064  E0.0285
N4499 G1  X195.495  E1.0642
N4500 G1  Y260.814  E0.0285
N4501 G1  X167.495  E1.0642
N4502 G1  Y261.564  E0.0285
N4503 G1  X195.495  E1.0642
N4504 G1  Y262.314  E0.0285
N4505 G1  X167.495  E1.0642
N4506 G1  Y263.064  E0.0285
N4507 G1  X195.495  E1.0642
N4508 G1  Y263.814  E0.0285
N4509 G1  X167.495  E1.0642
N4510 G1  Y264.564  E0.0285
N4511 G1  X195.495  E1.0642
N4512 G1  Y265.314  E0.0285
N4513 G1  X167.495  E1.0642
N4514 ; WIPE_TOWER_END
N4515 M220 R
N4516 G1 F60000
N4517 G4 S0
N4518 G92 E0
N4519 ; CP TOOLCHANGE END
N4520 ;------------------
N4521 
N4522 
N4523 
N4524 ; WIPE_START
N4525 G1 F5400
N4526 M204 S8000
N4527 G1 X169.495 Y265.314 E-.76
N4528 ; WIPE_END
N4529 G1 E-.04 F1800
N4530 M204 S10000
N4531 G17
N4532 G3 Z1.4 I1.217 J0 P1  F60000
N4533 ; OBJECT_ID: 239
N4534 ; COOLING_NODE: 0
N4535 ; start printing object, unique label id: 239
N4536 M624 AgAAAAAAAAA=
N4537 G1 X183.107 Y117.516
N4538 G1 Z1
N4539 G1 E.8 F1800
N4540 ; FEATURE: Outer wall
N4541 ; LINE_WIDTH: 0.42
N4542 ; LAYER_HEIGHT: 0.2
N4543 G1 F2545.881
N4544 M204 S5000
N4545 G1 X168.527 Y117.516 E.45715
N4546 G1 X168.527 Y116.936 E.01819
N4547 G1 X183.107 Y116.936 E.45715
N4548 G1 X183.107 Y117.456 E.0163
N4549 M204 S10000
N4550 G1 X182.911 Y117.226 F60000
N4551 ; FEATURE: Gap infill
N4552 ; LINE_WIDTH: 0.23088
N4553 G1 F5107.47
N4554 M204 S8000
N4555 G1 X168.723 Y117.226 E.22174
N4556 ; CHANGE_LAYER
N4557 ; Z_HEIGHT: 1.2
N4558 ; LAYER_HEIGHT: 0.2
N4559 ; WIPE_START
N4560 G1 F5107.47
N4561 G1 X170.723 Y117.226 E-.76
N4562 ; WIPE_END
N4563 G1 E-.04 F1800
N4564 ; stop printing object, unique label id: 239
N4565 M625
N4566 ;======== H2D 20250521========
N4567 ; layer num/total_layer_count: 6/63
N4568 ; update layer progress
N4569 M73 L6
N4570 M991 S0 P5 ;notify layer change
N4571 
N4572 
N4573 ; LAYER_HEIGHT: 0.200000
N4574 ; FEATURE: Prime tower
N4575 ; LINE_WIDTH: 0.500000
N4576 ;--------------------
N4577 ; CP TOOLCHANGE START
N4578 ; toolchange #6
N4579 ; material : PCTG -> PCTG
N4580 ;--------------------
N4581 M220 B
N4582 M220 S100
N4583 ; WIPE_TOWER_START
N4584 M204 S10000
N4585 G17
N4586 G3 Z1.4 I1.217 J0 P1  F60000
N4587 G1 X169.897 Y154.833
N4588 G1 X167.745 Y252.814
N4589 G1 Z1.2
N4590 G1 E.8 F1800
N4591 ; LAYER_HEIGHT: 0.200000
N4592 ; FEATURE: Prime tower
N4593 ; LINE_WIDTH: 1.000000
N4594 ; NOZZLE_CHANGE_START OF1 NF0
N4595 M104 T0 S210 N0 ;Multi extruder pre cooling in post extrusion
N4596 M204 S8000
N4597 G1  X195.245 Y252.814  E2.1885 F251
N4598 G1  Y254.314  E0.1194
N4599 G1  X167.745  E2.1885
N4600 G1  Y255.814  E0.1194
N4601 M73 P40 R32
N4602 G1  X195.245  E2.1885
N4603 G1  Y257.314  E0.1194
N4604 M104 T1 S255 N0 ;Multi extruder pre heating
N4605 M73 P40 R31
N4606 G1  X167.745  E2.1885
N4607 G1  Y258.814  E0.1194
N4608 G1  X195.245  E2.1885
N4609 M204 S10000
N4610 G1  Y259.814 
N4611 G1  X168.245  F398
N4612 G1  Y258.314 
N4613 G1  X194.745 
N4614 G1  Y256.814 
N4615 M73 P41 R31
N4616 G1  X168.245 
N4617 G1  Y255.314 
N4618 G1  X194.745 
N4619 G1  Y253.814 
N4620 G1  X168.245 
N4621 ; NOZZLE_CHANGE_END OF1 NF0
N4622 M104 T0 S0 N0 ;Multi extruder pre cooling
N4623 
N4624 G1 E-2 F1800
N4625 G17
N4626 G3 Z1.6 I1.217 J0 P1  F5400
N4627 ; filament end gcode 
N4628 
N4629 ;======== H2D ========
N4630 ;===== 20250604 =====
N4631 M993 A2 B2 C2 ; nozzle cam detection allow status save.
N4632 M993 A0 B0 C0 ; nozzle cam detection not allowed.
N4633 
N4634 
N4635 M1015.4 S0 ; disable E air printing detect
N4636 
N4637 
N4638 M620 S0A
N4639 M1002 gcode_claim_action : 4
N4640 M204 S9000
N4641 
N4642 G1 Z4.2 F1200
N4643 
N4644 M400
N4645 M106 P1 S0
N4646 M106 P2 S0
N4647 
N4648 
N4649 
N4650 
N4651 M620.10 A0 F79.8237 L0 H0.4 T250 P240 S1
N4652 
N4653 
N4654 
N4655 M620.10 A1 F149.669 L0 H0.4 T270 P255 S1
N4656 
N4657 
N4658 
N4659 M620.11 P0 I1 E0
N4660 
N4661 
N4662 
N4663 M620.11 K1 I1 R0 F200
N4664 
N4665 
N4666 M628 S1
N4667 
N4668 M620.11 S0 L0 I1 E-10 F200
N4669 
N4670 M629
N4671 
N4672 
N4673 M620.11 H2 C331
N4674 
N4675 
N4676 T0
N4677 M73 E0
N4678 
N4679 ;deretract
N4680 
N4681 
N4682 ;VG1 E4 F200
N4683 ;VG1 E4 F100
N4684 
N4685 
N4686 
N4687 ; VFLUSH_START
N4688 
N4689 
N4690 ;VG1 E0 F79
N4691 
N4692 
N4693 SYNC T0
N4694 
N4695 ; VFLUSH_END
N4696 
N4697 M1002 set_filament_type:PCTG
N4698 
N4699 M400
N4700 M83
N4701 
N4702 
N4703 
N4704 M628 S0
N4705 ;VM109 S255
N4706 M629
N4707 M400
N4708 
N4709 M983.3 F2.5 A0.4
N4710 
N4711 
N4712 M400
N4713 
N4714 G1 Y320 F30000
N4715 G1 X201
N4716 
N4717 G1 Y295
N4718 G1 Y265 F18000
N4719 G1 Z4.2 F3000
N4720 
N4721 M204 S8000
N4722 
N4723 
N4724 M621 S0A
N4725 
N4726 M993 A3 B3 C3 ; nozzle cam detection allow status restore.
N4727 
N4728 
N4729 M1015.3 S0;disable tpu clog detect
N4730 
N4731 
N4732 
N4733 M1015.4 S0 ; disable E air printing detect
N4734 
N4735 
N4736 M620.6 I0 W1 ;enable ams air printing detect
N4737 M1002 gcode_claim_action : 0
N4738 M106 S25.5
N4739 M106 P2 S0
N4740 G1 X200 Y278.814 F60000
N4741 G1 Z1.2
N4742 G1 X195.495 Y278.814 Z1.6
N4743 
N4744 ; filament start gcode
N4745 G1 Z1.2
N4746 G1 E2 F1800
N4747 
N4748 G4 S0
N4749 ; CP TOOLCHANGE WIPE
N4750 ; LINE_WIDTH: 0.500000
N4751 M204 S8000
N4752 G1  X192.495 Y278.814  E0.1140 F1782
N4753 G1 E-0.8000 F1800
N4754 M204 S10000
N4755 G1  X196.995  F600
N4756 G1  X195.495  F240
N4757 G1  X195.995  F600
N4758 G1  Y279.314 
N4759 G1  X194.995 
N4760 G1  Y278.314 
N4761 G1  X196.495 
N4762 G1  Y279.814 
N4763 G1  X194.495 
N4764 G1  Y277.814 
N4765 G1  X192.495 Y278.814   F1782
N4766 G1 E0.8000 F1800
N4767 M204 S8000
N4768 M73 P42 R31
N4769 G1  X167.495  E0.9502 F1782
N4770 G1  Y278.064  E0.0285
N4771 M73 P42 R30
N4772 G1  X195.495  E1.0642 F2025
N4773 G1  Y277.314  E0.0285
N4774 G1  X167.495  E1.0642 F2473
N4775 G1  Y276.564  E0.0285
N4776 G1  X195.495  E1.0642 F3938
N4777 G1  Y275.814  E0.0285
N4778 G1  X167.495  E1.0642
N4779 G1  Y275.064  E0.0285
N4780 G1  X195.495  E1.0642
N4781 G1  Y274.314  E0.0285
N4782 G1  X167.495  E1.0642
N4783 G1  Y273.564  E0.0285
N4784 G1  X195.495  E1.0642
N4785 G1  Y272.814  E0.0285
N4786 G1  X167.495  E1.0642
N4787 G1  Y272.064  E0.0285
N4788 G1  X195.495  E1.0642
N4789 G1  Y271.314  E0.0285
N4790 G1  X167.495  E1.0642
N4791 G1  Y270.564  E0.0285
N4792 G1  X195.495  E1.0642
N4793 G1  Y269.814  E0.0285
N4794 G1  X167.495  E1.0642
N4795 G1  Y269.064  E0.0285
N4796 G1  X195.495  E1.0642
N4797 G1  Y268.314  E0.0285
N4798 G1  X167.495  E1.0642
N4799 G1  Y267.564  E0.0285
N4800 G1  X195.495  E1.0642
N4801 G1  Y266.814  E0.0285
N4802 G1  X167.495  E1.0642
N4803 G1  Y266.064  E0.0285
N4804 G1  X195.495  E1.0642
N4805 ; WIPE_TOWER_END
N4806 M220 R
N4807 G1 F60000
N4808 G4 S0
N4809 G92 E0
N4810 ; CP TOOLCHANGE END
N4811 ;------------------
N4812 
N4813 
N4814 G1  Y252.064  
N4815 ; LAYER_HEIGHT: 0.200000
N4816 ; FEATURE: Prime tower
N4817 ; LINE_WIDTH: 0.500000
N4818 ; WIPE_TOWER_START
N4819 M204 S10000
N4820 G1  X195.846 Y279.721  
N4821 M204 S8000
N4822 G3  X193.064 Y281.636   I-3.469 J-2.060 E0.1325 F3938
N4823 G3  X190.723 Y280.255   I1.448 J-5.129 E0.1045
N4824 G2  X188.182 Y279.564   I-2.568 J4.426 E0.1012
N4825 G2  X174.618 Y279.568   I-6.687 J357.435 E0.5155
N4826 G2  X170.683 Y281.445   I0.499 J6.110 E0.1694
N4827 G3  X168.371 Y281.015   I-0.854 J-1.838 E0.0953
N4828 G1  X166.995 Y279.564   E0.0760
N4829 G3  X165.064 Y277.242   I3.871 J-5.183 E0.1159
N4830 G3  X166.240 Y274.649   I2.902 J-0.247 E0.1130
N4831 G2  X166.995 Y272.245   I-3.465 J-2.409 E0.0972
N4832 G2  X166.992 Y259.212   I-321.195 J-6.431 E0.4954
N4833 G2  X165.146 Y255.634   I-6.663 J1.171 E0.1554
N4834 G3  X165.485 Y253.656   I1.658 J-0.734 E0.0808
N4835 G1  X168.371 Y250.613   E0.1594
N4836 G3  X171.793 Y251.056   I1.525 J1.652 E0.1495
N4837 G2  X174.808 Y252.064   I3.021 J-4.025 E0.1229
N4838 G2  X188.372 Y252.060   I6.687 J-357.435 E0.5155
N4839 G2  X192.307 Y250.183   I-0.499 J-6.110 E0.1694
N4840 G3  X194.619 Y250.613   I0.854 J1.838 E0.0953
N4841 G1  X195.995 Y252.064   E0.0760
N4842 G3  X197.926 Y254.386   I-3.871 J5.182 E0.1159
N4843 G3  X196.750 Y256.979   I-2.902 J0.247 E0.1130
N4844 G2  X195.995 Y259.382   I3.464 J2.409 E0.0972
N4845 G2  X195.998 Y272.416   I321.212 J6.432 E0.4954
N4846 G2  X197.844 Y275.994   I6.663 J-1.171 E0.1554
N4847 G3  X197.564 Y277.905   I-1.654 J0.733 E0.0774
N4848 ; WIPE_TOWER_END
N4849 
N4850 ; WIPE_START
N4851 G1 F5107.47
N4852 M204 S8000
N4853 G1 X197.598 Y277.866 E-.01975
N4854 G1 X197.683 Y277.752 E-.0539
N4855 G1 X197.759 Y277.632 E-.05389
N4856 G1 X197.825 Y277.506 E-.0539
N4857 G1 X197.88 Y277.376 E-.0539
N4858 G1 X197.926 Y277.242 E-.05389
N4859 G1 X197.961 Y277.104 E-.0539
N4860 G1 X197.985 Y276.964 E-.05389
N4861 G1 X197.998 Y276.823 E-.0539
N4862 G1 X198 Y276.681 E-.05389
N4863 G1 X197.99 Y276.54 E-.05389
N4864 G1 X197.97 Y276.4 E-.05389
N4865 G1 X197.938 Y276.261 E-.0539
N4866 G1 X197.896 Y276.126 E-.05389
N4867 G1 X197.858 Y276.029 E-.03963
N4868 ; WIPE_END
N4869 G1 E-.04 F1800
N4870 M204 S10000
N4871 G17
N4872 G3 Z1.6 I1.217 J0 P1  F60000
N4873 ; OBJECT_ID: 229
N4874 ; COOLING_NODE: 0
N4875 ; start printing object, unique label id: 229
N4876 M624 AQAAAAAAAAA=
N4877 G1 X191.084 Y200.639 Z1.2
N4878 G1 E.8 F1800
N4879 ; FEATURE: Inner wall
N4880 ; LINE_WIDTH: 0.45
N4881 ; LAYER_HEIGHT: 0.2
N4882 G1 F4421.739
N4883 M204 S8000
N4884 G1 X158.916 Y200.639 E1.03439
N4885 G1 X158.916 Y127.036 E2.36678
N4886 G1 X191.084 Y127.036 E1.03439
N4887 G1 X191.084 Y200.579 E2.36485
N4888 ; COOLING_NODE: 0
N4889 M204 S10000
N4890 G1 X191.491 Y201.046 F60000
N4891 G1 F4421.739
N4892 M204 S8000
N4893 G1 X158.509 Y201.046 E1.06057
N4894 G1 X158.509 Y126.629 E2.39296
N4895 G1 X191.491 Y126.629 E1.06057
N4896 G1 X191.491 Y200.986 E2.39103
N4897 ; COOLING_NODE: 0
N4898 M204 S10000
N4899 G1 X191.898 Y201.453 F60000
N4900 G1 F4421.739
N4901 M204 S8000
N4902 G1 X158.102 Y201.453 E1.08675
N4903 G1 X158.102 Y126.222 E2.41914
N4904 G1 X191.898 Y126.222 E1.08675
N4905 G1 X191.898 Y201.393 E2.41721
N4906 ; COOLING_NODE: 0
N4907 M204 S10000
N4908 G1 X192.29 Y201.845 F60000
N4909 ; FEATURE: Outer wall
N4910 ; LINE_WIDTH: 0.42
N4911 G1 F4773.528
N4912 M204 S5000
N4913 G1 X157.71 Y201.845 E1.03002
N4914 G1 X157.71 Y125.83 E2.26421
N4915 G1 X192.29 Y125.83 E1.03002
N4916 G1 X192.29 Y201.785 E2.26243
N4917 G1 E-.8 F1800
N4918 M204 S10000
N4919 G1 X184.684 Y201.149 Z1.6 F60000
N4920 G1 X174.411 Y200.29 Z1.6
N4921 G1 Z1.2
N4922 G1 E.8 F1800
N4923 ; FEATURE: Sparse infill
N4924 ; LINE_WIDTH: 0.45
N4925 G1 F4421.739
N4926 M204 S8000
N4927 G1 X172.783 Y200.29 E.05236
N4928 G1 X190.736 Y133.29 E2.23049
N4929 G1 X190.736 Y132.317 E.03128
N4930 G1 X185.803 Y127.385 E.22431
N4931 G1 X183.889 Y127.385 E.06154
N4932 G1 X164.354 Y200.29 E2.42708
N4933 G1 X162.726 Y200.29 E.05236
N4934 M204 S10000
N4935 G1 X159.264 Y162.132 F60000
N4936 G1 F4421.739
N4937 M204 S8000
N4938 G1 X159.264 Y160.503 E.05236
N4939 G1 X190.736 Y152.071 E1.0477
N4940 G1 X190.736 Y155.345 E.10529
N4941 G1 X162.775 Y127.385 E1.27153
N4942 G1 X167.031 Y127.385 E.13687
N4943 G1 X159.264 Y156.372 E.96499
N4944 G1 X159.264 Y158.416 E.06574
N4945 G1 X190.736 Y189.887 E1.43118
N4946 G1 X190.736 Y185.786 E.13187
N4947 G1 X159.264 Y194.219 E1.0477
N4948 G1 X159.264 Y192.958 E.04055
N4949 G1 X166.597 Y200.29 E.33345
N4950 G1 X168.061 Y200.29 E.04709
N4951 G1 X190.736 Y194.215 E.75484
N4952 G1 X190.736 Y196.203 E.06394
N4953 G1 X189.64 Y200.29 E.13606
N4954 G1 X159.264 Y169.93 E1.38102
N4955 G1 X159.264 Y168.932 E.03208
N4956 G1 X190.736 Y160.5 E1.0477
N4957 G1 X190.736 Y164.747 E.13657
N4958 G1 X181.212 Y200.29 E1.18328
N4959 G1 X178.111 Y200.29 E.09971
N4960 G1 X159.264 Y181.444 E.85706
N4961 G1 X159.264 Y177.361 E.13129
N4962 G1 X190.736 Y168.928 E1.0477
N4963 G1 X190.736 Y166.859 E.06654
N4964 G1 X159.264 Y135.388 E1.43118
N4965 G1 X159.264 Y135.217 E.0055
N4966 M73 P43 R30
N4967 G1 X188.495 Y127.385 E.97312
N4968 G1 X190.124 Y127.385 E.05236
N4969 M204 S10000
N4970 G1 X190.736 Y136.842 F60000
N4971 G1 F4421.739
N4972 M204 S8000
N4973 G1 X190.736 Y135.213 E.05236
N4974 G1 X159.264 Y143.646 E1.0477
N4975 G1 X159.264 Y146.902 E.1047
N4976 G1 X190.736 Y178.373 E1.43118
N4977 G1 X190.736 Y177.357 E.03267
N4978 G1 X159.264 Y185.79 E1.04769
N4979 G1 X159.264 Y184.162 E.05236
N4980 M204 S10000
N4981 G1 X159.264 Y189.457 F60000
N4982 G1 F4421.739
N4983 M204 S8000
N4984 G1 X159.264 Y187.828 E.05236
N4985 G1 X175.46 Y127.385 E2.01221
N4986 G1 X174.289 Y127.385 E.03766
N4987 G1 X190.736 Y143.831 E.74792
N4988 G1 X190.736 Y143.642 E.00608
N4989 G1 X159.264 Y152.075 E1.0477
N4990 G1 X159.264 Y150.446 E.05236
N4991 ; WIPE_START
N4992 G1 X159.264 Y152.075 E-.61876
N4993 G1 X159.623 Y151.978 E-.14124
N4994 ; WIPE_END
N4995 G1 E-.04 F1800
N4996 M204 S10000
N4997 G17
N4998 G3 Z1.6 I1.217 J0 P1  F60000
N4999 ; stop printing object, unique label id: 229
N5000 M625
N5001 ; object ids of layer 6 start: 229
N5002 M624 AQAAAAAAAAA=
N5003 ;======== H2D 20250527========
N5004 ; SKIPPABLE_START
N5005 ; SKIPTYPE: timelapse
N5006 M622.1 S1 ; for prev firware, default turned on
N5007 
N5008 M1002 judge_flag timelapse_record_flag
N5009 
N5010 M622 J1
N5011 M993 A2 B2 C2
N5012 M993 A0 B0 C0
N5013 
N5014 
N5015 
N5016 
N5017     M9711 M0 E1 X260 Y141 Z1.6 S11 C10 O0 T3000
N5018 
N5019 
N5020 
N5021 M993 A3 B3 C3
N5022 
N5023 M623
N5024 ; SKIPPABLE_END
N5025 
N5026 ; object ids of this layer6 end: 229
N5027 M625
N5028 ; CHANGE_LAYER
N5029 ; Z_HEIGHT: 1.4
N5030 ; LAYER_HEIGHT: 0.2
N5031 ;======== H2D 20250521========
N5032 ; layer num/total_layer_count: 7/63
N5033 ; update layer progress
N5034 M73 L7
N5035 M991 S0 P6 ;notify layer change
N5036 
N5037 
N5038 M106 S48.45
N5039 ; OBJECT_ID: 229
N5040 ; COOLING_NODE: 0
N5041 ; start printing object, unique label id: 229
N5042 M624 AQAAAAAAAAA=
N5043 G1 X191.084 Y200.639 F60000
N5044 G1 Z1.4
N5045 G1 E.8 F1800
N5046 ; FEATURE: Inner wall
N5047 ; LINE_WIDTH: 0.45
N5048 ; LAYER_HEIGHT: 0.2
N5049 G1 F4421.739
N5050 M204 S8000
N5051 G1 X158.916 Y200.639 E1.03439
N5052 G1 X158.916 Y127.036 E2.36678
N5053 G1 X191.084 Y127.036 E1.03439
N5054 G1 X191.084 Y200.579 E2.36485
N5055 ; COOLING_NODE: 0
N5056 M204 S10000
N5057 G1 X191.491 Y201.046 F60000
N5058 G1 F4421.739
N5059 M204 S8000
N5060 G1 X158.509 Y201.046 E1.06057
N5061 G1 X158.509 Y126.629 E2.39296
N5062 G1 X191.491 Y126.629 E1.06057
N5063 G1 X191.491 Y200.986 E2.39103
N5064 ; COOLING_NODE: 0
N5065 M204 S10000
N5066 G1 X191.898 Y201.453 F60000
N5067 G1 F4421.739
N5068 M204 S8000
N5069 G1 X158.102 Y201.453 E1.08675
N5070 G1 X158.102 Y126.222 E2.41914
N5071 G1 X191.898 Y126.222 E1.08675
N5072 G1 X191.898 Y201.393 E2.41721
N5073 ; COOLING_NODE: 0
N5074 M204 S10000
N5075 G1 X192.29 Y201.845 F60000
N5076 ; FEATURE: Outer wall
N5077 ; LINE_WIDTH: 0.42
N5078 G1 F4773.528
N5079 M204 S5000
N5080 G1 X157.71 Y201.845 E1.03002
N5081 G1 X157.71 Y125.83 E2.26421
N5082 G1 X192.29 Y125.83 E1.03002
N5083 G1 X192.29 Y201.785 E2.26243
N5084 G1 E-.8 F1800
N5085 M204 S10000
N5086 G1 X184.684 Y201.154 Z1.8 F60000
N5087 G1 X174.265 Y200.29 Z1.8
N5088 G1 Z1.4
N5089 G1 E.8 F1800
N5090 ; FEATURE: Sparse infill
N5091 ; LINE_WIDTH: 0.45
N5092 G1 F4421.739
N5093 M204 S8000
N5094 G1 X172.636 Y200.29 E.05236
N5095 G1 X190.736 Y132.744 E2.24868
N5096 G1 X190.736 Y132.117 E.02014
N5097 G1 X186.003 Y127.385 E.21522
N5098 G1 X183.743 Y127.385 E.07268
N5099 G1 X164.208 Y200.29 E2.42708
N5100 G1 X162.579 Y200.29 E.05236
N5101 M204 S10000
N5102 G1 X159.264 Y162.278 F60000
N5103 G1 F4421.739
N5104 M204 S8000
N5105 G1 X159.264 Y160.65 E.05236
N5106 G1 X190.736 Y152.217 E1.0477
N5107 G1 X190.736 Y155.145 E.09415
N5108 G1 X162.975 Y127.385 E1.26243
N5109 G1 X166.885 Y127.385 E.12573
N5110 G1 X159.264 Y155.825 E.9468
N5111 G1 X159.264 Y158.216 E.07688
N5112 G1 X190.736 Y189.687 E1.43118
N5113 G1 X190.736 Y185.932 E.12073
N5114 G1 X159.264 Y194.365 E1.0477
N5115 G1 X159.264 Y192.758 E.05169
N5116 G1 X166.797 Y200.29 E.34255
N5117 G1 X168.608 Y200.29 E.05823
N5118 G1 X190.736 Y194.361 E.73665
N5119 G1 X190.736 Y195.657 E.04166
N5120 G1 X189.494 Y200.29 E.15425
N5121 G1 X189.825 Y200.29 E.01064
N5122 G1 X159.264 Y169.73 E1.38977
N5123 G1 X159.264 Y169.079 E.02094
N5124 G1 X190.736 Y160.646 E1.04769
N5125 G1 X190.736 Y164.2 E.11429
N5126 G1 X181.065 Y200.29 E1.20147
N5127 G1 X178.311 Y200.29 E.08857
N5128 G1 X159.264 Y181.244 E.86616
N5129 G1 X159.264 Y177.507 E.12015
N5130 G1 X190.736 Y169.075 E1.0477
N5131 G1 X190.736 Y166.659 E.07768
N5132 G1 X159.264 Y135.188 E1.43118
N5133 G1 X159.264 Y135.363 E.00564
N5134 G1 X189.042 Y127.385 E.99131
N5135 G1 X190.67 Y127.385 E.05236
N5136 M204 S10000
N5137 G1 X190.736 Y136.988 F60000
N5138 G1 F4421.739
N5139 M204 S8000
N5140 G1 X190.736 Y135.36 E.05236
N5141 G1 X159.264 Y143.792 E1.04769
N5142 G1 X159.264 Y146.702 E.09356
N5143 G1 X190.736 Y178.173 E1.43118
N5144 G1 X190.736 Y177.504 E.02153
N5145 G1 X159.264 Y185.936 E1.04769
N5146 G1 X159.264 Y184.308 E.05236
N5147 M204 S10000
N5148 G1 X159.264 Y188.91 F60000
N5149 G1 F4421.739
N5150 M204 S8000
N5151 G1 X159.264 Y187.282 E.05236
N5152 G1 X175.314 Y127.385 E1.99402
N5153 G1 X174.489 Y127.385 E.02652
N5154 G1 X190.736 Y143.631 E.73883
N5155 G1 X190.736 Y143.788 E.00506
N5156 M73 P43 R29
N5157 G1 X159.264 Y152.221 E1.0477
N5158 G1 X159.264 Y150.593 E.05236
N5159 ; WIPE_START
N5160 G1 X159.264 Y152.221 E-.61876
N5161 G1 X159.623 Y152.125 E-.14124
N5162 ; WIPE_END
N5163 G1 E-.04 F1800
N5164 M204 S10000
N5165 G17
N5166 G3 Z1.8 I1.217 J0 P1  F60000
N5167 ; stop printing object, unique label id: 229
N5168 M625
N5169 ; object ids of layer 7 start: 229
N5170 M624 AQAAAAAAAAA=
N5171 ;======== H2D 20250527========
N5172 ; SKIPPABLE_START
N5173 ; SKIPTYPE: timelapse
N5174 M622.1 S1 ; for prev firware, default turned on
N5175 
N5176 M1002 judge_flag timelapse_record_flag
N5177 
N5178 M622 J1
N5179 M993 A2 B2 C2
N5180 M993 A0 B0 C0
N5181 
N5182 
N5183 
N5184 
N5185     M9711 M0 E1 X260 Y141 Z1.8 S11 C10 O0 T3000
N5186 
N5187 
N5188 
N5189 M993 A3 B3 C3
N5190 
N5191 M623
N5192 ; SKIPPABLE_END
N5193 
N5194 ; object ids of this layer7 end: 229
N5195 M625
N5196 ; CHANGE_LAYER
N5197 ; Z_HEIGHT: 1.6
N5198 ; LAYER_HEIGHT: 0.2
N5199 ;======== H2D 20250521========
N5200 ; layer num/total_layer_count: 8/63
N5201 ; update layer progress
N5202 M73 L8
N5203 M991 S0 P7 ;notify layer change
N5204 
N5205 
N5206 ; OBJECT_ID: 229
N5207 ; COOLING_NODE: 0
N5208 ; start printing object, unique label id: 229
N5209 M624 AQAAAAAAAAA=
N5210 G1 X191.084 Y200.639 F60000
N5211 G1 Z1.6
N5212 G1 E.8 F1800
N5213 ; FEATURE: Inner wall
N5214 ; LINE_WIDTH: 0.45
N5215 ; LAYER_HEIGHT: 0.2
N5216 G1 F4421.739
N5217 M204 S8000
N5218 G1 X158.916 Y200.639 E1.03439
N5219 G1 X158.916 Y127.036 E2.36678
N5220 G1 X191.084 Y127.036 E1.03439
N5221 G1 X191.084 Y200.579 E2.36485
N5222 ; COOLING_NODE: 0
N5223 M204 S10000
N5224 G1 X191.491 Y201.046 F60000
N5225 G1 F4421.739
N5226 M204 S8000
N5227 G1 X158.509 Y201.046 E1.06057
N5228 M73 P44 R29
N5229 G1 X158.509 Y126.629 E2.39296
N5230 G1 X191.491 Y126.629 E1.06057
N5231 G1 X191.491 Y200.986 E2.39103
N5232 ; COOLING_NODE: 0
N5233 M204 S10000
N5234 G1 X191.898 Y201.453 F60000
N5235 G1 F4421.739
N5236 M204 S8000
N5237 G1 X158.102 Y201.453 E1.08675
N5238 G1 X158.102 Y126.222 E2.41914
N5239 G1 X191.898 Y126.222 E1.08675
N5240 G1 X191.898 Y201.393 E2.41721
N5241 ; COOLING_NODE: 0
N5242 M204 S10000
N5243 G1 X192.29 Y201.845 F60000
N5244 ; FEATURE: Outer wall
N5245 ; LINE_WIDTH: 0.42
N5246 G1 F4773.528
N5247 M204 S5000
N5248 G1 X157.71 Y201.845 E1.03002
N5249 G1 X157.71 Y125.83 E2.26421
N5250 G1 X192.29 Y125.83 E1.03002
N5251 G1 X192.29 Y201.785 E2.26243
N5252 G1 E-.8 F1800
N5253 M204 S10000
N5254 G1 X184.683 Y201.159 Z2 F60000
N5255 G1 X174.118 Y200.29 Z2
N5256 G1 Z1.6
N5257 G1 E.8 F1800
N5258 ; FEATURE: Sparse infill
N5259 ; LINE_WIDTH: 0.45
N5260 G1 F4421.739
N5261 M204 S8000
N5262 G1 X172.49 Y200.29 E.05236
N5263 G1 X190.736 Y132.197 E2.26687
N5264 G1 X190.736 Y131.917 E.009
N5265 G1 X186.203 Y127.385 E.20612
N5266 G1 X183.596 Y127.385 E.08382
N5267 G1 X164.061 Y200.29 E2.42708
N5268 G1 X162.433 Y200.29 E.05236
N5269 M204 S10000
N5270 G1 X159.264 Y162.425 F60000
N5271 G1 F4421.739
N5272 M204 S8000
N5273 G1 X159.264 Y160.796 E.05236
N5274 G1 X190.736 Y152.364 E1.0477
N5275 G1 X190.736 Y154.945 E.08301
N5276 G1 X163.175 Y127.385 E1.25334
N5277 G1 X166.739 Y127.385 E.11459
N5278 G1 X159.264 Y155.279 E.92861
N5279 G1 X159.264 Y158.016 E.08802
N5280 G1 X190.736 Y189.487 E1.43118
N5281 G1 X190.736 Y186.079 E.10959
N5282 G1 X159.264 Y194.511 E1.0477
N5283 G1 X159.264 Y192.558 E.06283
N5284 G1 X166.997 Y200.29 E.35165
N5285 G1 X169.154 Y200.29 E.06937
N5286 G1 X190.736 Y194.508 E.71846
N5287 G1 X190.736 Y195.11 E.01938
N5288 G1 X189.348 Y200.29 E.17244
N5289 G1 X190.025 Y200.29 E.02178
N5290 G1 X159.264 Y169.53 E1.39886
N5291 G1 X159.264 Y169.225 E.0098
N5292 G1 X190.736 Y160.792 E1.04769
N5293 G1 X190.736 Y163.654 E.09201
N5294 G1 X180.919 Y200.29 E1.21966
N5295 G1 X178.511 Y200.29 E.07743
N5296 G1 X159.264 Y181.044 E.87525
N5297 G1 X159.264 Y177.654 E.10901
N5298 G1 X190.736 Y169.221 E1.0477
N5299 G1 X190.736 Y166.459 E.08882
N5300 G1 X159.264 Y134.988 E1.43118
N5301 G1 X159.264 Y135.51 E.01678
N5302 G1 X189.588 Y127.385 E1.0095
N5303 G1 X190.736 Y127.385 E.03689
N5304 G1 X190.736 Y127.866 E.01547
N5305 M204 S10000
N5306 G1 X190.736 Y137.134 F60000
N5307 G1 F4421.739
N5308 M204 S8000
N5309 G1 X190.736 Y135.506 E.05236
N5310 G1 X159.264 Y143.939 E1.04769
N5311 G1 X159.264 Y146.502 E.08242
N5312 G1 X190.736 Y177.973 E1.43118
N5313 G1 X190.736 Y177.65 E.01039
N5314 G1 X159.264 Y186.083 E1.0477
N5315 M204 S10000
N5316 G1 X159.264 Y188.364 F60000
N5317 G1 F4421.739
N5318 M204 S8000
N5319 G1 X159.264 Y186.735 E.05236
N5320 G1 X175.167 Y127.385 E1.97583
N5321 G1 X174.689 Y127.385 E.01538
N5322 G1 X190.736 Y143.431 E.72973
N5323 G1 X190.736 Y143.935 E.0162
N5324 G1 X159.264 Y152.368 E1.0477
N5325 G1 X159.264 Y150.739 E.05236
N5326 ; WIPE_START
N5327 G1 X159.264 Y152.368 E-.61876
N5328 G1 X159.623 Y152.271 E-.14124
N5329 ; WIPE_END
N5330 G1 E-.04 F1800
N5331 M204 S10000
N5332 G17
N5333 G3 Z2 I1.217 J0 P1  F60000
N5334 ; stop printing object, unique label id: 229
N5335 M625
N5336 ; object ids of layer 8 start: 229
N5337 M624 AQAAAAAAAAA=
N5338 ;======== H2D 20250527========
N5339 ; SKIPPABLE_START
N5340 ; SKIPTYPE: timelapse
N5341 M622.1 S1 ; for prev firware, default turned on
N5342 
N5343 M1002 judge_flag timelapse_record_flag
N5344 
N5345 M622 J1
N5346 M993 A2 B2 C2
N5347 M993 A0 B0 C0
N5348 
N5349 
N5350 
N5351 
N5352     M9711 M0 E1 X260 Y141 Z2 S11 C10 O0 T3000
N5353 
N5354 
N5355 
N5356 M993 A3 B3 C3
N5357 
N5358 M623
N5359 ; SKIPPABLE_END
N5360 
N5361 ; object ids of this layer8 end: 229
N5362 M625
N5363 ; CHANGE_LAYER
N5364 ; Z_HEIGHT: 1.8
N5365 ; LAYER_HEIGHT: 0.2
N5366 ;======== H2D 20250521========
N5367 ; layer num/total_layer_count: 9/63
N5368 ; update layer progress
N5369 M73 L9
N5370 M991 S0 P8 ;notify layer change
N5371 
N5372 
N5373 M106 S51
N5374 ; OBJECT_ID: 229
N5375 ; COOLING_NODE: 0
N5376 ; start printing object, unique label id: 229
N5377 M624 AQAAAAAAAAA=
N5378 G1 X191.084 Y200.639 F60000
N5379 G1 Z1.8
N5380 G1 E.8 F1800
N5381 ; FEATURE: Inner wall
N5382 ; LINE_WIDTH: 0.45
N5383 ; LAYER_HEIGHT: 0.2
N5384 G1 F4421.739
N5385 M204 S8000
N5386 G1 X158.916 Y200.639 E1.03439
N5387 G1 X158.916 Y127.036 E2.36678
N5388 G1 X191.084 Y127.036 E1.03439
N5389 G1 X191.084 Y200.579 E2.36485
N5390 ; COOLING_NODE: 0
N5391 M204 S10000
N5392 G1 X191.491 Y201.046 F60000
N5393 G1 F4421.739
N5394 M204 S8000
N5395 G1 X158.509 Y201.046 E1.06057
N5396 G1 X158.509 Y126.629 E2.39296
N5397 G1 X191.491 Y126.629 E1.06057
N5398 G1 X191.491 Y200.986 E2.39103
N5399 ; COOLING_NODE: 0
N5400 M204 S10000
N5401 G1 X191.898 Y201.453 F60000
N5402 G1 F4421.739
N5403 M204 S8000
N5404 G1 X158.102 Y201.453 E1.08675
N5405 G1 X158.102 Y126.222 E2.41914
N5406 G1 X191.898 Y126.222 E1.08675
N5407 G1 X191.898 Y201.393 E2.41721
N5408 ; COOLING_NODE: 0
N5409 M204 S10000
N5410 G1 X192.29 Y201.845 F60000
N5411 ; FEATURE: Outer wall
N5412 ; LINE_WIDTH: 0.42
N5413 G1 F4773.528
N5414 M204 S5000
N5415 G1 X157.71 Y201.845 E1.03002
N5416 G1 X157.71 Y125.83 E2.26421
N5417 G1 X192.29 Y125.83 E1.03002
N5418 G1 X192.29 Y201.785 E2.26243
N5419 G1 E-.8 F1800
N5420 M204 S10000
N5421 M73 P45 R29
N5422 G1 X184.683 Y201.164 Z2.2 F60000
N5423 G1 X173.972 Y200.29 Z2.2
N5424 G1 Z1.8
N5425 G1 E.8 F1800
N5426 ; FEATURE: Sparse infill
N5427 ; LINE_WIDTH: 0.45
N5428 G1 F4421.739
N5429 M204 S8000
N5430 G1 X172.344 Y200.29 E.05236
N5431 G1 X190.736 Y131.651 E2.28506
N5432 G1 X190.736 Y131.717 E.00214
N5433 G1 X186.403 Y127.385 E.19703
N5434 G1 X183.45 Y127.385 E.09496
N5435 G1 X163.915 Y200.29 E2.42708
N5436 G1 X162.287 Y200.29 E.05236
N5437 M204 S10000
N5438 G1 X159.264 Y162.571 F60000
N5439 G1 F4421.739
N5440 M204 S8000
N5441 G1 X159.264 Y160.943 E.05236
N5442 G1 X190.736 Y152.51 E1.0477
N5443 G1 X190.736 Y154.745 E.07187
N5444 G1 X163.375 Y127.385 E1.24424
N5445 G1 X166.592 Y127.385 E.10345
N5446 G1 X159.264 Y154.732 E.91042
N5447 G1 X159.264 Y157.816 E.09916
N5448 G1 X190.736 Y189.287 E1.43118
N5449 G1 X190.736 Y186.225 E.09845
N5450 G1 X159.264 Y194.658 E1.0477
N5451 G1 X159.264 Y192.358 E.07396
N5452 G1 X167.197 Y200.29 E.36074
N5453 G1 X169.701 Y200.29 E.08051
N5454 G1 X190.736 Y194.654 E.70026
N5455 G1 X190.736 Y194.564 E.00289
N5456 G1 X189.201 Y200.29 E.19063
N5457 G1 X190.225 Y200.29 E.03292
N5458 G1 X159.264 Y169.33 E1.40796
N5459 G1 X159.264 Y169.371 E.00134
N5460 G1 X190.736 Y160.939 E1.0477
N5461 G1 X190.736 Y163.107 E.06973
N5462 G1 X180.772 Y200.29 E1.23785
N5463 G1 X178.711 Y200.29 E.06629
N5464 G1 X159.264 Y180.844 E.88435
N5465 G1 X159.264 Y177.8 E.09787
N5466 G1 X190.736 Y169.368 E1.0477
N5467 G1 X190.736 Y166.259 E.09996
N5468 G1 X159.264 Y134.788 E1.43118
N5469 G1 X159.264 Y135.656 E.02792
N5470 G1 X190.135 Y127.385 E1.02769
N5471 G1 X190.736 Y127.385 E.01932
N5472 G1 X190.736 Y128.412 E.03304
N5473 M204 S10000
N5474 G1 X190.736 Y137.281 F60000
N5475 G1 F4421.739
N5476 M204 S8000
N5477 G1 X190.736 Y135.652 E.05236
N5478 G1 X159.264 Y144.085 E1.0477
N5479 G1 X159.264 Y146.302 E.07129
N5480 G1 X190.736 Y177.773 E1.43118
N5481 G1 X190.736 Y177.796 E.00075
N5482 G1 X159.264 Y186.229 E1.0477
N5483 G1 X175.021 Y127.385 E1.95888
N5484 G1 X174.889 Y127.385 E.00424
N5485 G1 X190.736 Y143.231 E.72064
N5486 G1 X190.736 Y144.081 E.02734
N5487 G1 X159.264 Y152.514 E1.0477
N5488 G1 X159.264 Y150.886 E.05236
N5489 ; WIPE_START
N5490 G1 X159.264 Y152.514 E-.61876
N5491 G1 X159.623 Y152.418 E-.14124
N5492 ; WIPE_END
N5493 G1 E-.04 F1800
N5494 M204 S10000
N5495 G17
N5496 G3 Z2.2 I1.217 J0 P1  F60000
N5497 ; stop printing object, unique label id: 229
N5498 M625
N5499 ; object ids of layer 9 start: 229
N5500 M624 AQAAAAAAAAA=
N5501 ;======== H2D 20250527========
N5502 ; SKIPPABLE_START
N5503 ; SKIPTYPE: timelapse
N5504 M622.1 S1 ; for prev firware, default turned on
N5505 
N5506 M1002 judge_flag timelapse_record_flag
N5507 
N5508 M622 J1
N5509 M993 A2 B2 C2
N5510 M993 A0 B0 C0
N5511 
N5512 
N5513 
N5514 
N5515     M9711 M0 E1 X260 Y141 Z2.2 S11 C10 O0 T3000
N5516 
N5517 
N5518 
N5519 M993 A3 B3 C3
N5520 
N5521 M623
N5522 ; SKIPPABLE_END
N5523 
N5524 ; object ids of this layer9 end: 229
N5525 M625
N5526 ; CHANGE_LAYER
N5527 ; Z_HEIGHT: 2
N5528 ; LAYER_HEIGHT: 0.2
N5529 ;======== H2D 20250521========
N5530 ; layer num/total_layer_count: 10/63
N5531 ; update layer progress
N5532 M73 L10
N5533 M991 S0 P9 ;notify layer change
N5534 
N5535 
N5536 M106 S48.45
N5537 ; OBJECT_ID: 229
N5538 ; COOLING_NODE: 0
N5539 ; start printing object, unique label id: 229
N5540 M624 AQAAAAAAAAA=
N5541 G1 X191.084 Y200.639 F60000
N5542 G1 Z2
N5543 G1 E.8 F1800
N5544 ; FEATURE: Inner wall
N5545 ; LINE_WIDTH: 0.45
N5546 ; LAYER_HEIGHT: 0.2
N5547 G1 F4421.739
N5548 M204 S8000
N5549 G1 X158.916 Y200.639 E1.03439
N5550 G1 X158.916 Y127.036 E2.36678
N5551 G1 X191.084 Y127.036 E1.03439
N5552 G1 X191.084 Y200.579 E2.36485
N5553 ; COOLING_NODE: 0
N5554 M204 S10000
N5555 G1 X191.491 Y201.046 F60000
N5556 G1 F4421.739
N5557 M204 S8000
N5558 G1 X158.509 Y201.046 E1.06057
N5559 G1 X158.509 Y126.629 E2.39296
N5560 G1 X191.491 Y126.629 E1.06057
N5561 G1 X191.491 Y200.986 E2.39103
N5562 ; COOLING_NODE: 0
N5563 M204 S10000
N5564 G1 X191.898 Y201.453 F60000
N5565 G1 F4421.739
N5566 M204 S8000
N5567 G1 X158.102 Y201.453 E1.08675
N5568 G1 X158.102 Y126.222 E2.41914
N5569 G1 X191.898 Y126.222 E1.08675
N5570 G1 X191.898 Y201.393 E2.41721
N5571 ; COOLING_NODE: 0
N5572 M204 S10000
N5573 G1 X192.29 Y201.845 F60000
N5574 ; FEATURE: Outer wall
N5575 ; LINE_WIDTH: 0.42
N5576 G1 F4773.528
N5577 M204 S5000
N5578 G1 X157.71 Y201.845 E1.03002
N5579 M73 P45 R28
N5580 G1 X157.71 Y125.83 E2.26421
N5581 G1 X192.29 Y125.83 E1.03002
N5582 G1 X192.29 Y201.785 E2.26243
N5583 G1 E-.8 F1800
N5584 M204 S10000
N5585 G1 X190.736 Y194.8 Z2.4 F60000
N5586 G1 Z2
N5587 G1 E.8 F1800
N5588 ; FEATURE: Sparse infill
N5589 ; LINE_WIDTH: 0.45
N5590 G1 F4421.739
N5591 M204 S8000
N5592 G1 X170.247 Y200.29 E.68207
N5593 G1 X167.397 Y200.29 E.09165
N5594 G1 X159.264 Y192.158 E.36984
N5595 G1 X159.264 Y194.804 E.0851
N5596 G1 X190.736 Y186.372 E1.04769
N5597 G1 X190.736 Y189.087 E.08732
N5598 G1 X159.264 Y157.616 E1.43118
N5599 G1 X159.264 Y154.186 E.1103
N5600 G1 X166.446 Y127.385 E.89223
N5601 G1 X163.575 Y127.385 E.09231
N5602 G1 X190.736 Y154.545 E1.23515
N5603 G1 X190.736 Y152.656 E.06073
N5604 G1 X159.264 Y161.089 E1.0477
N5605 G1 X159.264 Y162.717 E.05236
N5606 M204 S10000
N5607 G1 X159.264 Y151.032 F60000
N5608 G1 F4421.739
N5609 M204 S8000
N5610 G1 X159.264 Y152.66 E.05236
N5611 G1 X190.736 Y144.228 E1.0477
N5612 G1 X190.736 Y143.031 E.03847
N5613 G1 X175.089 Y127.385 E.71154
N5614 G1 X174.875 Y127.385 E.00689
N5615 G1 X159.264 Y185.643 E1.93945
N5616 G1 X159.264 Y186.375 E.02357
N5617 G1 X190.736 Y177.943 E1.0477
N5618 G1 X190.736 Y177.573 E.01189
N5619 M73 P46 R28
N5620 G1 X159.264 Y146.102 E1.43118
N5621 G1 X159.264 Y144.232 E.06015
N5622 G1 X190.736 Y135.799 E1.0477
N5623 G1 X190.736 Y137.427 E.05236
N5624 M204 S10000
N5625 G1 X190.736 Y131.517 F60000
N5626 G1 F4421.739
N5627 M204 S8000
N5628 G1 X186.603 Y127.385 E.18793
N5629 G1 X183.303 Y127.385 E.1061
N5630 G1 X163.768 Y200.29 E2.42708
N5631 G1 X162.14 Y200.29 E.05236
N5632 M204 S10000
N5633 G1 X173.826 Y200.29 F60000
N5634 G1 F4421.739
N5635 M204 S8000
N5636 G1 X172.197 Y200.29 E.05236
N5637 G1 X190.736 Y131.104 E2.30325
N5638 G1 X190.736 Y127.385 E.11961
N5639 G1 X190.681 Y127.385 E.00175
N5640 G1 X159.264 Y135.803 E1.04588
N5641 G1 X159.264 Y134.588 E.03906
N5642 G1 X190.736 Y166.059 E1.43118
N5643 G1 X190.736 Y169.514 E.1111
N5644 G1 X159.264 Y177.947 E1.0477
N5645 G1 X159.264 Y180.644 E.08673
N5646 G1 X178.911 Y200.29 E.89344
N5647 G1 X180.626 Y200.29 E.05515
N5648 G1 X190.736 Y162.561 E1.25604
N5649 G1 X190.736 Y161.085 E.04745
N5650 G1 X159.264 Y169.518 E1.0477
N5651 G1 X159.264 Y169.13 E.01248
N5652 G1 X190.425 Y200.29 E1.41705
N5653 G1 X189.055 Y200.29 E.04406
N5654 G1 X190.736 Y194.018 E.20882
N5655 G1 X190.736 Y192.389 E.05236
N5656 ; WIPE_START
N5657 G1 X190.736 Y194.018 E-.61876
N5658 G1 X190.639 Y194.377 E-.14124
N5659 ; WIPE_END
N5660 G1 E-.04 F1800
N5661 M204 S10000
N5662 G17
N5663 G3 Z2.4 I1.217 J0 P1  F60000
N5664 ; stop printing object, unique label id: 229
N5665 M625
N5666 ; object ids of layer 10 start: 229
N5667 M624 AQAAAAAAAAA=
N5668 ;======== H2D 20250527========
N5669 ; SKIPPABLE_START
N5670 ; SKIPTYPE: timelapse
N5671 M622.1 S1 ; for prev firware, default turned on
N5672 
N5673 M1002 judge_flag timelapse_record_flag
N5674 
N5675 M622 J1
N5676 M993 A2 B2 C2
N5677 M993 A0 B0 C0
N5678 
N5679 
N5680 
N5681 
N5682     M9711 M0 E1 X260 Y141 Z2.4 S11 C10 O0 T3000
N5683 
N5684 
N5685 
N5686 M993 A3 B3 C3
N5687 
N5688 M623
N5689 ; SKIPPABLE_END
N5690 
N5691 ; object ids of this layer10 end: 229
N5692 M625
N5693 ; CHANGE_LAYER
N5694 ; Z_HEIGHT: 2.2
N5695 ; LAYER_HEIGHT: 0.2
N5696 ;======== H2D 20250521========
N5697 ; layer num/total_layer_count: 11/63
N5698 ; update layer progress
N5699 M73 L11
N5700 M991 S0 P10 ;notify layer change
N5701 
N5702 
N5703 M106 S51
N5704 ; OBJECT_ID: 229
N5705 ; COOLING_NODE: 0
N5706 ; start printing object, unique label id: 229
N5707 M624 AQAAAAAAAAA=
N5708 G1 X191.084 Y200.639 F60000
N5709 G1 Z2.2
N5710 G1 E.8 F1800
N5711 ; FEATURE: Inner wall
N5712 ; LINE_WIDTH: 0.45
N5713 ; LAYER_HEIGHT: 0.2
N5714 G1 F4421.739
N5715 M204 S8000
N5716 G1 X158.916 Y200.639 E1.03439
N5717 G1 X158.916 Y127.036 E2.36678
N5718 G1 X191.084 Y127.036 E1.03439
N5719 G1 X191.084 Y200.579 E2.36485
N5720 ; COOLING_NODE: 0
N5721 M204 S10000
N5722 G1 X191.491 Y201.046 F60000
N5723 G1 F4421.739
N5724 M204 S8000
N5725 G1 X158.509 Y201.046 E1.06057
N5726 G1 X158.509 Y126.629 E2.39296
N5727 G1 X191.491 Y126.629 E1.06057
N5728 G1 X191.491 Y200.986 E2.39103
N5729 ; COOLING_NODE: 0
N5730 M204 S10000
N5731 G1 X191.898 Y201.453 F60000
N5732 G1 F4421.739
N5733 M204 S8000
N5734 G1 X158.102 Y201.453 E1.08675
N5735 G1 X158.102 Y126.222 E2.41914
N5736 G1 X191.898 Y126.222 E1.08675
N5737 G1 X191.898 Y201.393 E2.41721
N5738 ; COOLING_NODE: 0
N5739 M204 S10000
N5740 G1 X192.29 Y201.845 F60000
N5741 ; FEATURE: Outer wall
N5742 ; LINE_WIDTH: 0.42
N5743 G1 F4773.528
N5744 M204 S5000
N5745 G1 X157.71 Y201.845 E1.03002
N5746 G1 X157.71 Y125.83 E2.26421
N5747 G1 X192.29 Y125.83 E1.03002
N5748 G1 X192.29 Y201.785 E2.26243
N5749 G1 E-.8 F1800
N5750 M204 S10000
N5751 G1 X190.736 Y196.575 Z2.6 F60000
N5752 G1 Z2.2
N5753 G1 E.8 F1800
N5754 ; FEATURE: Sparse infill
N5755 ; LINE_WIDTH: 0.45
N5756 G1 F4421.739
N5757 M204 S8000
N5758 G1 X190.736 Y194.947 E.05236
N5759 G1 X170.794 Y200.29 E.66388
N5760 G1 X167.597 Y200.29 E.10279
N5761 G1 X159.264 Y191.958 E.37893
N5762 G1 X159.264 Y194.951 E.09624
N5763 G1 X190.736 Y186.518 E1.0477
N5764 G1 X190.736 Y188.887 E.07618
N5765 G1 X159.264 Y157.416 E1.43118
N5766 G1 X159.264 Y153.639 E.12144
N5767 G1 X166.299 Y127.385 E.87404
N5768 G1 X163.775 Y127.385 E.08117
N5769 G1 X190.736 Y154.345 E1.22605
N5770 G1 X190.736 Y152.803 E.04959
N5771 G1 X159.264 Y161.236 E1.0477
N5772 G1 X159.264 Y162.864 E.05236
N5773 M204 S10000
N5774 G1 X159.264 Y152.807 F60000
N5775 G1 F4421.739
N5776 M204 S8000
N5777 G1 X190.736 Y144.374 E1.04769
N5778 G1 X190.736 Y142.831 E.04961
N5779 G1 X175.289 Y127.385 E.70245
N5780 G1 X174.728 Y127.385 E.01803
N5781 G1 X159.264 Y185.096 E1.92126
N5782 G1 X159.264 Y186.522 E.04585
N5783 G1 X190.736 Y178.089 E1.0477
N5784 G1 X190.736 Y177.373 E.02303
N5785 G1 X159.264 Y145.902 E1.43118
N5786 G1 X159.264 Y144.378 E.04901
N5787 G1 X190.736 Y135.945 E1.0477
N5788 G1 X190.736 Y137.574 E.05236
N5789 M204 S10000
N5790 G1 X190.736 Y131.317 F60000
N5791 G1 F4421.739
N5792 M204 S8000
N5793 G1 X186.803 Y127.385 E.17884
N5794 G1 X183.157 Y127.385 E.11724
N5795 G1 X163.622 Y200.29 E2.42708
N5796 G1 X161.994 Y200.29 E.05236
N5797 M204 S10000
N5798 G1 X172.051 Y200.29 F60000
N5799 G1 F4421.739
N5800 M204 S8000
N5801 G1 X190.736 Y130.558 E2.32144
N5802 G1 X190.736 Y127.516 E.0978
N5803 G1 X159.264 Y135.949 E1.0477
N5804 G1 X159.264 Y134.388 E.0502
N5805 G1 X190.736 Y165.859 E1.43118
N5806 G1 X190.736 Y169.66 E.12224
N5807 G1 X159.264 Y178.093 E1.04769
N5808 G1 X159.264 Y180.444 E.07559
N5809 G1 X179.111 Y200.29 E.90254
N5810 G1 X180.48 Y200.29 E.04401
N5811 G1 X190.736 Y162.015 E1.27423
N5812 G1 X190.736 Y161.232 E.02517
N5813 G1 X159.264 Y169.664 E1.0477
N5814 G1 X159.264 Y168.93 E.02362
N5815 G1 X190.625 Y200.29 E1.42615
N5816 G1 X188.908 Y200.29 E.0552
N5817 G1 X190.736 Y193.471 E.22701
N5818 G1 X190.736 Y191.843 E.05236
N5819 ; WIPE_START
N5820 M73 P47 R28
N5821 G1 X190.736 Y193.471 E-.61876
N5822 G1 X190.639 Y193.83 E-.14124
N5823 ; WIPE_END
N5824 G1 E-.04 F1800
N5825 M204 S10000
N5826 G17
N5827 G3 Z2.6 I1.217 J0 P1  F60000
N5828 ; stop printing object, unique label id: 229
N5829 M625
N5830 ; object ids of layer 11 start: 229
N5831 M624 AQAAAAAAAAA=
N5832 ;======== H2D 20250527========
N5833 ; SKIPPABLE_START
N5834 ; SKIPTYPE: timelapse
N5835 M622.1 S1 ; for prev firware, default turned on
N5836 
N5837 M1002 judge_flag timelapse_record_flag
N5838 
N5839 M622 J1
N5840 M993 A2 B2 C2
N5841 M993 A0 B0 C0
N5842 
N5843 
N5844 
N5845 
N5846     M9711 M0 E1 X260 Y141 Z2.6 S11 C10 O0 T3000
N5847 
N5848 
N5849 
N5850 M993 A3 B3 C3
N5851 
N5852 M623
N5853 ; SKIPPABLE_END
N5854 
N5855 ; object ids of this layer11 end: 229
N5856 M625
N5857 ; CHANGE_LAYER
N5858 ; Z_HEIGHT: 2.4
N5859 ; LAYER_HEIGHT: 0.2
N5860 ;======== H2D 20250521========
N5861 ; layer num/total_layer_count: 12/63
N5862 ; update layer progress
N5863 M73 L12
N5864 M991 S0 P11 ;notify layer change
N5865 
N5866 
N5867 M106 S48.45
N5868 ; OBJECT_ID: 229
N5869 ; COOLING_NODE: 0
N5870 ; start printing object, unique label id: 229
N5871 M624 AQAAAAAAAAA=
N5872 G1 X191.084 Y200.639 F60000
N5873 G1 Z2.4
N5874 G1 E.8 F1800
N5875 ; FEATURE: Inner wall
N5876 ; LINE_WIDTH: 0.45
N5877 ; LAYER_HEIGHT: 0.2
N5878 G1 F4421.739
N5879 M204 S8000
N5880 G1 X158.916 Y200.639 E1.03439
N5881 G1 X158.916 Y127.036 E2.36678
N5882 G1 X191.084 Y127.036 E1.03439
N5883 G1 X191.084 Y200.579 E2.36485
N5884 ; COOLING_NODE: 0
N5885 M204 S10000
N5886 G1 X191.491 Y201.046 F60000
N5887 G1 F4421.739
N5888 M204 S8000
N5889 G1 X158.509 Y201.046 E1.06057
N5890 G1 X158.509 Y126.629 E2.39296
N5891 G1 X191.491 Y126.629 E1.06057
N5892 G1 X191.491 Y200.986 E2.39103
N5893 ; COOLING_NODE: 0
N5894 M204 S10000
N5895 G1 X191.898 Y201.453 F60000
N5896 G1 F4421.739
N5897 M204 S8000
N5898 G1 X158.102 Y201.453 E1.08675
N5899 G1 X158.102 Y126.222 E2.41914
N5900 G1 X191.898 Y126.222 E1.08675
N5901 G1 X191.898 Y201.393 E2.41721
N5902 ; COOLING_NODE: 0
N5903 M204 S10000
N5904 G1 X192.29 Y201.845 F60000
N5905 ; FEATURE: Outer wall
N5906 ; LINE_WIDTH: 0.42
N5907 G1 F4773.528
N5908 M204 S5000
N5909 G1 X157.71 Y201.845 E1.03002
N5910 G1 X157.71 Y125.83 E2.26421
N5911 G1 X192.29 Y125.83 E1.03002
N5912 G1 X192.29 Y201.785 E2.26243
N5913 G1 E-.8 F1800
N5914 M204 S10000
N5915 G1 X190.736 Y196.722 Z2.8 F60000
N5916 G1 Z2.4
N5917 G1 E.8 F1800
N5918 ; FEATURE: Sparse infill
N5919 ; LINE_WIDTH: 0.45
N5920 G1 F4421.739
N5921 M204 S8000
N5922 G1 X190.736 Y195.093 E.05236
N5923 G1 X171.34 Y200.29 E.64569
N5924 G1 X167.797 Y200.29 E.11393
N5925 G1 X159.264 Y191.758 E.38803
N5926 G1 X159.264 Y195.097 E.10738
N5927 G1 X190.736 Y186.664 E1.0477
N5928 G1 X190.736 Y188.687 E.06504
N5929 G1 X159.264 Y157.216 E1.43118
N5930 G1 X159.264 Y161.382 E.13396
N5931 G1 X190.736 Y152.949 E1.0477
N5932 G1 X190.736 Y154.145 E.03845
N5933 G1 X163.975 Y127.385 E1.21696
N5934 G1 X166.153 Y127.385 E.07003
N5935 G1 X159.264 Y153.093 E.85585
N5936 G1 X159.264 Y152.953 E.0045
N5937 G1 X190.736 Y144.52 E1.0477
N5938 G1 X190.736 Y142.631 E.06075
N5939 G1 X175.489 Y127.385 E.69335
N5940 G1 X174.582 Y127.385 E.02917
N5941 G1 X159.264 Y184.55 E1.90307
N5942 G1 X159.264 Y186.668 E.06813
N5943 G1 X190.736 Y178.236 E1.0477
N5944 G1 X190.736 Y177.173 E.03417
N5945 G1 X159.264 Y145.702 E1.43118
N5946 G1 X159.264 Y144.524 E.03787
N5947 G1 X190.736 Y136.092 E1.0477
N5948 G1 X190.736 Y137.72 E.05236
N5949 M204 S10000
N5950 G1 X190.736 Y131.117 F60000
N5951 G1 F4421.739
N5952 M204 S8000
N5953 G1 X187.003 Y127.385 E.16974
N5954 G1 X183.011 Y127.385 E.12838
N5955 G1 X163.476 Y200.29 E2.42708
N5956 G1 X161.847 Y200.29 E.05236
N5957 M204 S10000
N5958 G1 X171.904 Y200.29 F60000
N5959 G1 F4421.739
N5960 M204 S8000
N5961 M73 P47 R27
N5962 G1 X190.736 Y130.011 E2.33963
N5963 G1 X190.736 Y127.663 E.07552
N5964 G1 X159.264 Y136.096 E1.04769
N5965 G1 X159.264 Y134.188 E.06134
N5966 G1 X190.736 Y165.659 E1.43118
N5967 G1 X190.736 Y169.807 E.13338
N5968 G1 X159.264 Y178.24 E1.0477
N5969 G1 X159.264 Y180.244 E.06445
N5970 G1 X179.311 Y200.29 E.91163
N5971 G1 X180.333 Y200.29 E.03287
N5972 G1 X190.736 Y161.468 E1.29242
N5973 G1 X190.736 Y161.378 E.0029
N5974 G1 X159.264 Y169.811 E1.0477
N5975 G1 X159.264 Y168.73 E.03476
N5976 G1 X190.736 Y200.201 E1.43118
N5977 G1 X190.736 Y200.29 E.00287
N5978 G1 X188.762 Y200.29 E.06346
N5979 G1 X190.736 Y192.925 E.2452
N5980 G1 X190.736 Y191.296 E.05236
N5981 M204 S10000
N5982 G1 X159.264 Y129.295 F60000
N5983 G1 F4421.739
N5984 M204 S8000
N5985 G1 X159.264 Y127.667 E.05236
N5986 G1 X160.317 Y127.385 E.03505
N5987 G1 X161.946 Y127.385 E.05236
N5988 ; WIPE_START
N5989 G1 X160.317 Y127.385 E-.61876
N5990 G1 X159.958 Y127.481 E-.14124
N5991 ; WIPE_END
N5992 G1 E-.04 F1800
N5993 M204 S10000
N5994 G17
N5995 G3 Z2.8 I1.217 J0 P1  F60000
N5996 ; stop printing object, unique label id: 229
N5997 M625
N5998 ; object ids of layer 12 start: 229
N5999 M624 AQAAAAAAAAA=
N6000 ;======== H2D 20250527========
N6001 ; SKIPPABLE_START
N6002 ; SKIPTYPE: timelapse
N6003 M622.1 S1 ; for prev firware, default turned on
N6004 
N6005 M1002 judge_flag timelapse_record_flag
N6006 
N6007 M622 J1
N6008 M993 A2 B2 C2
N6009 M993 A0 B0 C0
N6010 
N6011 
N6012 
N6013 
N6014     M9711 M0 E1 X260 Y141 Z2.8 S11 C10 O0 T3000
N6015 
N6016 
N6017 
N6018 M993 A3 B3 C3
N6019 
N6020 M623
N6021 ; SKIPPABLE_END
N6022 
N6023 ; object ids of this layer12 end: 229
N6024 M625
N6025 ; CHANGE_LAYER
N6026 ; Z_HEIGHT: 2.6
N6027 ; LAYER_HEIGHT: 0.2
N6028 ;======== H2D 20250521========
N6029 ; layer num/total_layer_count: 13/63
N6030 ; update layer progress
N6031 M73 L13
N6032 M991 S0 P12 ;notify layer change
N6033 
N6034 
N6035 ; OBJECT_ID: 229
N6036 ; COOLING_NODE: 0
N6037 ; start printing object, unique label id: 229
N6038 M624 AQAAAAAAAAA=
N6039 G1 X191.084 Y200.639 F60000
N6040 G1 Z2.6
N6041 G1 E.8 F1800
N6042 ; FEATURE: Inner wall
N6043 ; LINE_WIDTH: 0.45
N6044 ; LAYER_HEIGHT: 0.2
N6045 G1 F4421.739
N6046 M204 S8000
N6047 G1 X158.916 Y200.639 E1.03439
N6048 G1 X158.916 Y127.036 E2.36678
N6049 G1 X191.084 Y127.036 E1.03439
N6050 G1 X191.084 Y200.579 E2.36485
N6051 ; COOLING_NODE: 0
N6052 M204 S10000
N6053 G1 X191.491 Y201.046 F60000
N6054 G1 F4421.739
N6055 M204 S8000
N6056 G1 X158.509 Y201.046 E1.06057
N6057 G1 X158.509 Y126.629 E2.39296
N6058 G1 X191.491 Y126.629 E1.06057
N6059 G1 X191.491 Y200.986 E2.39103
N6060 ; COOLING_NODE: 0
N6061 M204 S10000
N6062 G1 X191.898 Y201.453 F60000
N6063 G1 F4421.739
N6064 M204 S8000
N6065 G1 X158.102 Y201.453 E1.08675
N6066 G1 X158.102 Y126.222 E2.41914
N6067 G1 X191.898 Y126.222 E1.08675
N6068 G1 X191.898 Y201.393 E2.41721
N6069 ; COOLING_NODE: 0
N6070 M204 S10000
N6071 M73 P48 R27
N6072 G1 X192.29 Y201.845 F60000
N6073 ; FEATURE: Outer wall
N6074 ; LINE_WIDTH: 0.42
N6075 G1 F4773.528
N6076 M204 S5000
N6077 G1 X157.71 Y201.845 E1.03002
N6078 G1 X157.71 Y125.83 E2.26421
N6079 G1 X192.29 Y125.83 E1.03002
N6080 G1 X192.29 Y201.785 E2.26243
N6081 G1 E-.8 F1800
N6082 M204 S10000
N6083 G1 X190.736 Y196.868 Z3 F60000
N6084 G1 Z2.6
N6085 G1 E.8 F1800
N6086 ; FEATURE: Sparse infill
N6087 ; LINE_WIDTH: 0.45
N6088 G1 F4421.739
N6089 M204 S8000
N6090 G1 X190.736 Y195.24 E.05236
N6091 G1 X171.886 Y200.29 E.6275
N6092 G1 X171.758 Y200.29 E.00413
N6093 G1 X190.736 Y129.465 E2.35782
N6094 G1 X190.736 Y127.809 E.05324
N6095 G1 X159.264 Y136.242 E1.0477
N6096 G1 X159.264 Y133.988 E.07248
N6097 G1 X190.736 Y165.459 E1.43118
N6098 G1 X190.736 Y169.953 E.14452
N6099 G1 X159.264 Y178.386 E1.0477
N6100 G1 X159.264 Y180.044 E.05331
N6101 G1 X179.511 Y200.29 E.92073
N6102 G1 X180.187 Y200.29 E.02173
N6103 G1 X190.736 Y160.922 E1.31061
N6104 G1 X190.736 Y159.293 E.05236
N6105 M204 S10000
N6106 G1 X190.736 Y161.524 F60000
N6107 G1 F4421.739
N6108 M204 S8000
N6109 G1 X159.264 Y169.957 E1.0477
N6110 G1 X159.264 Y168.53 E.0459
N6111 G1 X190.736 Y200.001 E1.43118
N6112 G1 X190.736 Y200.29 E.0093
N6113 G1 X188.616 Y200.29 E.06817
N6114 G1 X190.736 Y192.378 E.26339
N6115 G1 X190.736 Y190.75 E.05236
N6116 M204 S10000
N6117 G1 X190.736 Y137.866 F60000
N6118 G1 F4421.739
N6119 M204 S8000
N6120 G1 X190.736 Y136.238 E.05236
N6121 G1 X159.264 Y144.671 E1.0477
N6122 G1 X159.264 Y145.502 E.02673
N6123 G1 X190.736 Y176.973 E1.43118
N6124 G1 X190.736 Y178.382 E.04531
N6125 G1 X159.264 Y186.815 E1.0477
N6126 G1 X159.264 Y184.003 E.0904
N6127 G1 X174.435 Y127.385 E1.88488
N6128 G1 X175.689 Y127.385 E.04031
N6129 G1 X190.736 Y142.431 E.68426
N6130 G1 X190.736 Y144.667 E.07189
N6131 G1 X159.264 Y153.1 E1.0477
N6132 G1 X159.264 Y152.547 E.01778
N6133 G1 X166.007 Y127.385 E.83766
N6134 G1 X164.175 Y127.385 E.0589
N6135 G1 X190.736 Y153.945 E1.20786
N6136 G1 X190.736 Y153.096 E.02732
N6137 G1 X159.264 Y161.528 E1.0477
N6138 G1 X159.264 Y157.016 E.1451
N6139 G1 X190.736 Y188.487 E1.43118
N6140 G1 X190.736 Y186.811 E.0539
N6141 G1 X159.264 Y195.244 E1.0477
N6142 G1 X159.264 Y191.558 E.11852
N6143 G1 X167.997 Y200.29 E.39712
N6144 G1 X163.329 Y200.29 E.1501
N6145 G1 X182.864 Y127.385 E2.42708
N6146 G1 X187.203 Y127.385 E.13952
N6147 G1 X190.736 Y130.917 E.16065
N6148 G1 X190.736 Y132.546 E.05236
N6149 M204 S10000
N6150 G1 X162.492 Y127.385 F60000
N6151 G1 F4421.739
N6152 M204 S8000
N6153 G1 X160.864 Y127.385 E.05236
N6154 G1 X159.264 Y127.813 E.05324
N6155 G1 X159.264 Y129.441 E.05236
N6156 ; WIPE_START
N6157 G1 X159.264 Y127.813 E-.61876
N6158 G1 X159.623 Y127.717 E-.14124
N6159 ; WIPE_END
N6160 G1 E-.04 F1800
N6161 M204 S10000
N6162 G17
N6163 G3 Z3 I1.217 J0 P1  F60000
N6164 ; stop printing object, unique label id: 229
N6165 M625
N6166 ; object ids of layer 13 start: 229
N6167 M624 AQAAAAAAAAA=
N6168 ;======== H2D 20250527========
N6169 ; SKIPPABLE_START
N6170 ; SKIPTYPE: timelapse
N6171 M622.1 S1 ; for prev firware, default turned on
N6172 
N6173 M1002 judge_flag timelapse_record_flag
N6174 
N6175 M622 J1
N6176 M993 A2 B2 C2
N6177 M993 A0 B0 C0
N6178 
N6179 
N6180 
N6181 
N6182     M9711 M0 E1 X260 Y141 Z3 S11 C10 O0 T3000
N6183 
N6184 
N6185 
N6186 M993 A3 B3 C3
N6187 
N6188 M623
N6189 ; SKIPPABLE_END
N6190 
N6191 ; object ids of this layer13 end: 229
N6192 M625
N6193 ; CHANGE_LAYER
N6194 ; Z_HEIGHT: 2.8
N6195 ; LAYER_HEIGHT: 0.2
N6196 ;======== H2D 20250521========
N6197 ; layer num/total_layer_count: 14/63
N6198 ; update layer progress
N6199 M73 L14
N6200 M991 S0 P13 ;notify layer change
N6201 
N6202 
N6203 ; OBJECT_ID: 229
N6204 ; COOLING_NODE: 0
N6205 ; start printing object, unique label id: 229
N6206 M624 AQAAAAAAAAA=
N6207 G1 X191.084 Y200.639 F60000
N6208 G1 Z2.8
N6209 G1 E.8 F1800
N6210 ; FEATURE: Inner wall
N6211 ; LINE_WIDTH: 0.45
N6212 ; LAYER_HEIGHT: 0.2
N6213 G1 F4421.739
N6214 M204 S8000
N6215 G1 X158.916 Y200.639 E1.03439
N6216 G1 X158.916 Y127.036 E2.36678
N6217 G1 X191.084 Y127.036 E1.03439
N6218 G1 X191.084 Y200.579 E2.36485
N6219 ; COOLING_NODE: 0
N6220 M204 S10000
N6221 G1 X191.491 Y201.046 F60000
N6222 G1 F4421.739
N6223 M204 S8000
N6224 G1 X158.509 Y201.046 E1.06057
N6225 G1 X158.509 Y126.629 E2.39296
N6226 G1 X191.491 Y126.629 E1.06057
N6227 G1 X191.491 Y200.986 E2.39103
N6228 ; COOLING_NODE: 0
N6229 M204 S10000
N6230 G1 X191.898 Y201.453 F60000
N6231 G1 F4421.739
N6232 M204 S8000
N6233 G1 X158.102 Y201.453 E1.08675
N6234 G1 X158.102 Y126.222 E2.41914
N6235 G1 X191.898 Y126.222 E1.08675
N6236 G1 X191.898 Y201.393 E2.41721
N6237 ; COOLING_NODE: 0
N6238 M204 S10000
N6239 G1 X192.29 Y201.845 F60000
N6240 ; FEATURE: Outer wall
N6241 ; LINE_WIDTH: 0.42
N6242 G1 F4773.528
N6243 M204 S5000
N6244 G1 X157.71 Y201.845 E1.03002
N6245 G1 X157.71 Y125.83 E2.26421
N6246 G1 X192.29 Y125.83 E1.03002
N6247 G1 X192.29 Y201.785 E2.26243
N6248 G1 E-.8 F1800
N6249 M204 S10000
N6250 G1 X190.736 Y197.014 Z3.2 F60000
N6251 G1 Z2.8
N6252 G1 E.8 F1800
N6253 ; FEATURE: Sparse infill
N6254 ; LINE_WIDTH: 0.45
N6255 G1 F4421.739
N6256 M204 S8000
N6257 G1 X190.736 Y195.386 E.05236
N6258 G1 X172.433 Y200.29 E.60931
N6259 G1 X171.612 Y200.29 E.02641
N6260 G1 X190.736 Y128.919 E2.37601
N6261 G1 X190.736 Y127.956 E.03096
N6262 G1 X159.264 Y136.388 E1.0477
N6263 G1 X159.264 Y133.788 E.08362
N6264 G1 X190.736 Y165.259 E1.43118
N6265 M73 P49 R27
N6266 G1 X190.736 Y161.671 E.11538
N6267 G1 X159.264 Y170.104 E1.0477
N6268 G1 X159.264 Y168.33 E.05704
N6269 G1 X190.736 Y199.801 E1.43118
N6270 G1 X190.736 Y200.29 E.01574
N6271 G1 X188.469 Y200.29 E.07288
N6272 G1 X190.736 Y191.832 E.28158
N6273 G1 X190.736 Y190.204 E.05236
N6274 M204 S10000
N6275 G1 X190.736 Y171.728 F60000
N6276 G1 F4421.739
N6277 M204 S8000
N6278 G1 X190.736 Y170.1 E.05236
N6279 G1 X159.264 Y178.532 E1.0477
N6280 G1 X159.264 Y179.844 E.04217
N6281 G1 X179.711 Y200.29 E.92982
N6282 G1 X180.04 Y200.29 E.01059
N6283 G1 X190.736 Y160.375 E1.3288
N6284 G1 X190.736 Y158.747 E.05236
N6285 M204 S10000
N6286 G1 X190.736 Y138.013 F60000
N6287 G1 F4421.739
N6288 M204 S8000
N6289 G1 X190.736 Y136.385 E.05236
N6290 G1 X159.264 Y144.817 E1.0477
N6291 G1 X159.264 Y145.302 E.01559
N6292 G1 X190.736 Y176.773 E1.43118
N6293 G1 X190.736 Y178.528 E.05645
N6294 G1 X159.264 Y186.961 E1.04769
N6295 G1 X159.264 Y183.457 E.11268
N6296 G1 X174.289 Y127.385 E1.86669
N6297 G1 X175.889 Y127.385 E.05145
N6298 G1 X190.736 Y142.231 E.67516
N6299 G1 X190.736 Y144.813 E.08303
N6300 G1 X159.264 Y153.246 E1.0477
N6301 G1 X159.264 Y152 E.04006
N6302 G1 X165.86 Y127.385 E.81947
N6303 G1 X164.375 Y127.385 E.04776
N6304 G1 X190.736 Y153.745 E1.19877
N6305 G1 X190.736 Y153.242 E.01618
N6306 G1 X159.264 Y161.675 E1.04769
N6307 G1 X159.264 Y156.816 E.15624
N6308 G1 X190.736 Y188.287 E1.43118
N6309 G1 X190.736 Y186.957 E.04276
N6310 G1 X159.264 Y195.39 E1.0477
N6311 G1 X159.264 Y191.358 E.12966
N6312 G1 X168.197 Y200.29 E.40622
N6313 G1 X163.183 Y200.29 E.16124
N6314 G1 X182.718 Y127.385 E2.42708
N6315 G1 X187.403 Y127.385 E.15066
N6316 G1 X190.736 Y130.717 E.15155
N6317 G1 X190.736 Y132.346 E.05236
N6318 M204 S10000
N6319 G1 X163.038 Y127.385 F60000
N6320 G1 F4421.739
N6321 M204 S8000
N6322 G1 X161.41 Y127.385 E.05236
N6323 G1 X159.264 Y127.96 E.07143
N6324 G1 X159.264 Y129.588 E.05236
N6325 ; WIPE_START
N6326 G1 X159.264 Y127.96 E-.61876
N6327 G1 X159.623 Y127.863 E-.14124
N6328 ; WIPE_END
N6329 G1 E-.04 F1800
N6330 M204 S10000
N6331 G17
N6332 G3 Z3.2 I1.217 J0 P1  F60000
N6333 ; stop printing object, unique label id: 229
N6334 M625
N6335 ; object ids of layer 14 start: 229
N6336 M624 AQAAAAAAAAA=
N6337 ;======== H2D 20250527========
N6338 ; SKIPPABLE_START
N6339 ; SKIPTYPE: timelapse
N6340 M622.1 S1 ; for prev firware, default turned on
N6341 
N6342 M1002 judge_flag timelapse_record_flag
N6343 
N6344 M622 J1
N6345 M993 A2 B2 C2
N6346 M993 A0 B0 C0
N6347 
N6348 
N6349 
N6350 
N6351     M9711 M0 E1 X260 Y141 Z3.2 S11 C10 O0 T3000
N6352 
N6353 
N6354 
N6355 M993 A3 B3 C3
N6356 
N6357 M623
N6358 ; SKIPPABLE_END
N6359 
N6360 ; object ids of this layer14 end: 229
N6361 M625
N6362 ; CHANGE_LAYER
N6363 ; Z_HEIGHT: 3
N6364 ; LAYER_HEIGHT: 0.2
N6365 ;======== H2D 20250521========
N6366 ; layer num/total_layer_count: 15/63
N6367 ; update layer progress
N6368 M73 L15
N6369 M991 S0 P14 ;notify layer change
N6370 
N6371 
N6372 ; OBJECT_ID: 229
N6373 ; COOLING_NODE: 0
N6374 ; start printing object, unique label id: 229
N6375 M624 AQAAAAAAAAA=
N6376 G1 X191.084 Y200.639 F60000
N6377 G1 Z3
N6378 G1 E.8 F1800
N6379 ; FEATURE: Inner wall
N6380 ; LINE_WIDTH: 0.45
N6381 ; LAYER_HEIGHT: 0.2
N6382 G1 F4421.739
N6383 M204 S8000
N6384 G1 X158.916 Y200.639 E1.03439
N6385 G1 X158.916 Y127.036 E2.36678
N6386 G1 X191.084 Y127.036 E1.03439
N6387 G1 X191.084 Y200.579 E2.36485
N6388 ; COOLING_NODE: 0
N6389 M204 S10000
N6390 G1 X191.491 Y201.046 F60000
N6391 G1 F4421.739
N6392 M204 S8000
N6393 G1 X158.509 Y201.046 E1.06057
N6394 G1 X158.509 Y126.629 E2.39296
N6395 G1 X191.491 Y126.629 E1.06057
N6396 G1 X191.491 Y200.986 E2.39103
N6397 ; COOLING_NODE: 0
N6398 M204 S10000
N6399 G1 X191.898 Y201.453 F60000
N6400 M73 P49 R26
N6401 G1 F4421.739
N6402 M204 S8000
N6403 G1 X158.102 Y201.453 E1.08675
N6404 G1 X158.102 Y126.222 E2.41914
N6405 G1 X191.898 Y126.222 E1.08675
N6406 G1 X191.898 Y201.393 E2.41721
N6407 ; COOLING_NODE: 0
N6408 M204 S10000
N6409 G1 X192.29 Y201.845 F60000
N6410 ; FEATURE: Outer wall
N6411 ; LINE_WIDTH: 0.42
N6412 G1 F4773.528
N6413 M204 S5000
N6414 G1 X157.71 Y201.845 E1.03002
N6415 G1 X157.71 Y125.83 E2.26421
N6416 G1 X192.29 Y125.83 E1.03002
N6417 G1 X192.29 Y201.785 E2.26243
N6418 G1 E-.8 F1800
N6419 M204 S10000
N6420 G1 X190.736 Y197.161 Z3.4 F60000
N6421 G1 Z3
N6422 G1 E.8 F1800
N6423 ; FEATURE: Sparse infill
N6424 ; LINE_WIDTH: 0.45
N6425 G1 F4421.739
N6426 M204 S8000
N6427 G1 X190.736 Y195.532 E.05236
N6428 G1 X172.979 Y200.29 E.59112
N6429 G1 X171.465 Y200.29 E.04869
N6430 G1 X190.736 Y128.372 E2.39421
N6431 G1 X190.736 Y128.102 E.00868
N6432 G1 X159.264 Y136.535 E1.0477
N6433 G1 X159.264 Y133.588 E.09476
N6434 G1 X190.736 Y165.059 E1.43118
N6435 G1 X190.736 Y161.817 E.10424
N6436 G1 X159.264 Y170.25 E1.0477
N6437 G1 X159.264 Y168.13 E.06818
N6438 G1 X190.736 Y199.601 E1.43118
N6439 G1 X190.736 Y200.29 E.02217
N6440 G1 X188.323 Y200.29 E.07759
N6441 G1 X190.736 Y191.286 E.29977
N6442 G1 X190.736 Y189.657 E.05236
N6443 M204 S10000
N6444 G1 X190.736 Y171.874 F60000
N6445 G1 F4421.739
N6446 M204 S8000
N6447 G1 X190.736 Y170.246 E.05236
N6448 G1 X159.264 Y178.679 E1.0477
N6449 G1 X159.264 Y179.644 E.03103
N6450 G1 X179.911 Y200.29 E.93892
N6451 G1 X179.894 Y200.29 E.00055
N6452 G1 X190.736 Y159.829 E1.34699
N6453 G1 X190.736 Y158.201 E.05236
N6454 M204 S10000
N6455 G1 X190.736 Y138.159 F60000
N6456 G1 F4421.739
N6457 M204 S8000
N6458 G1 X190.736 Y136.531 E.05236
N6459 G1 X159.264 Y144.964 E1.04769
N6460 G1 X159.264 Y145.102 E.00445
N6461 G1 X190.736 Y176.573 E1.43118
N6462 G1 X190.736 Y178.675 E.06759
N6463 G1 X159.264 Y187.108 E1.04769
N6464 G1 X159.264 Y191.158 E.13024
N6465 G1 X168.397 Y200.29 E.41531
N6466 G1 X163.036 Y200.29 E.17238
N6467 G1 X182.571 Y127.385 E2.42708
N6468 G1 X187.603 Y127.385 E.1618
N6469 G1 X190.736 Y130.517 E.14246
N6470 G1 X190.736 Y132.146 E.05236
N6471 M204 S10000
N6472 M73 P50 R26
N6473 G1 X163.585 Y127.385 F60000
N6474 G1 F4421.739
N6475 M204 S8000
N6476 G1 X161.956 Y127.385 E.05236
N6477 G1 X159.264 Y128.106 E.08962
N6478 G1 X159.264 Y129.734 E.05236
N6479 M204 S10000
N6480 G1 X159.264 Y184.539 F60000
N6481 G1 F4421.739
N6482 M204 S8000
N6483 G1 X159.264 Y182.91 E.05236
N6484 G1 X174.143 Y127.385 E1.84849
N6485 G1 X176.089 Y127.385 E.06259
N6486 G1 X190.736 Y142.031 E.66606
N6487 G1 X190.736 Y144.96 E.09417
N6488 G1 X159.264 Y153.392 E1.0477
N6489 G1 X159.264 Y151.454 E.06234
N6490 G1 X165.714 Y127.385 E.80128
N6491 G1 X164.575 Y127.385 E.03662
N6492 G1 X190.736 Y153.545 E1.18967
N6493 G1 X190.736 Y153.389 E.00504
N6494 G1 X159.264 Y161.821 E1.0477
N6495 G1 X159.264 Y156.616 E.16738
N6496 G1 X190.736 Y188.087 E1.43118
N6497 G1 X190.736 Y187.104 E.03162
N6498 G1 X159.264 Y195.536 E1.0477
N6499 G1 X159.264 Y197.165 E.05236
N6500 ; WIPE_START
N6501 G1 X159.264 Y195.536 E-.61876
N6502 G1 X159.623 Y195.44 E-.14124
N6503 ; WIPE_END
N6504 G1 E-.04 F1800
N6505 M204 S10000
N6506 G17
N6507 G3 Z3.4 I1.217 J0 P1  F60000
N6508 ; stop printing object, unique label id: 229
N6509 M625
N6510 ; object ids of layer 15 start: 229
N6511 M624 AQAAAAAAAAA=
N6512 ;======== H2D 20250527========
N6513 ; SKIPPABLE_START
N6514 ; SKIPTYPE: timelapse
N6515 M622.1 S1 ; for prev firware, default turned on
N6516 
N6517 M1002 judge_flag timelapse_record_flag
N6518 
N6519 M622 J1
N6520 M993 A2 B2 C2
N6521 M993 A0 B0 C0
N6522 
N6523 
N6524 
N6525 
N6526     M9711 M0 E1 X260 Y141 Z3.4 S11 C10 O0 T3000
N6527 
N6528 
N6529 
N6530 M993 A3 B3 C3
N6531 
N6532 M623
N6533 ; SKIPPABLE_END
N6534 
N6535 ; object ids of this layer15 end: 229
N6536 M625
N6537 ; CHANGE_LAYER
N6538 ; Z_HEIGHT: 3.2
N6539 ; LAYER_HEIGHT: 0.2
N6540 ;======== H2D 20250521========
N6541 ; layer num/total_layer_count: 16/63
N6542 ; update layer progress
N6543 M73 L16
N6544 M991 S0 P15 ;notify layer change
N6545 
N6546 
N6547 ; OBJECT_ID: 229
N6548 ; COOLING_NODE: 0
N6549 ; start printing object, unique label id: 229
N6550 M624 AQAAAAAAAAA=
N6551 G1 X191.084 Y200.639 F60000
N6552 G1 Z3.2
N6553 G1 E.8 F1800
N6554 ; FEATURE: Inner wall
N6555 ; LINE_WIDTH: 0.45
N6556 ; LAYER_HEIGHT: 0.2
N6557 G1 F4421.739
N6558 M204 S8000
N6559 G1 X158.916 Y200.639 E1.03439
N6560 G1 X158.916 Y127.036 E2.36678
N6561 G1 X191.084 Y127.036 E1.03439
N6562 G1 X191.084 Y200.579 E2.36485
N6563 ; COOLING_NODE: 0
N6564 M204 S10000
N6565 G1 X191.491 Y201.046 F60000
N6566 G1 F4421.739
N6567 M204 S8000
N6568 G1 X158.509 Y201.046 E1.06057
N6569 G1 X158.509 Y126.629 E2.39296
N6570 G1 X191.491 Y126.629 E1.06057
N6571 G1 X191.491 Y200.986 E2.39103
N6572 ; COOLING_NODE: 0
N6573 M204 S10000
N6574 G1 X191.898 Y201.453 F60000
N6575 G1 F4421.739
N6576 M204 S8000
N6577 G1 X158.102 Y201.453 E1.08675
N6578 G1 X158.102 Y126.222 E2.41914
N6579 G1 X191.898 Y126.222 E1.08675
N6580 G1 X191.898 Y201.393 E2.41721
N6581 ; COOLING_NODE: 0
N6582 M204 S10000
N6583 G1 X192.29 Y201.845 F60000
N6584 ; FEATURE: Outer wall
N6585 ; LINE_WIDTH: 0.42
N6586 G1 F4773.528
N6587 M204 S5000
N6588 G1 X157.71 Y201.845 E1.03002
N6589 G1 X157.71 Y125.83 E2.26421
N6590 G1 X192.29 Y125.83 E1.03002
N6591 G1 X192.29 Y201.785 E2.26243
N6592 G1 E-.8 F1800
N6593 M204 S10000
N6594 G1 X190.736 Y197.307 Z3.6 F60000
N6595 G1 Z3.2
N6596 G1 E.8 F1800
N6597 ; FEATURE: Sparse infill
N6598 ; LINE_WIDTH: 0.45
N6599 G1 F4421.739
N6600 M204 S8000
N6601 G1 X190.736 Y195.679 E.05236
N6602 G1 X173.526 Y200.29 E.57293
N6603 G1 X171.319 Y200.29 E.07096
N6604 G1 X190.736 Y127.826 E2.4124
N6605 G1 X190.736 Y127.385 E.01418
N6606 G1 X187.803 Y127.385 E.0943
N6607 G1 X190.736 Y130.317 E.13336
N6608 G1 X190.736 Y136.677 E.20452
N6609 G1 X159.264 Y145.11 E1.04769
N6610 G1 X159.264 Y144.902 E.00669
N6611 G1 X190.736 Y176.373 E1.43118
N6612 G1 X190.736 Y178.821 E.07873
N6613 G1 X159.264 Y187.254 E1.0477
N6614 G1 X159.264 Y190.958 E.1191
N6615 G1 X168.597 Y200.29 E.42441
N6616 G1 X162.89 Y200.29 E.18352
N6617 G1 X182.425 Y127.385 E2.42708
N6618 G1 X180.797 Y127.385 E.05236
N6619 M204 S10000
N6620 G1 X190.736 Y128.249 F60000
N6621 G1 F4421.739
N6622 M204 S8000
N6623 G1 X159.264 Y136.681 E1.0477
N6624 G1 X159.264 Y133.388 E.1059
N6625 G1 X190.736 Y164.859 E1.43118
N6626 G1 X190.736 Y161.964 E.0931
N6627 G1 X159.264 Y170.396 E1.0477
N6628 G1 X159.264 Y167.93 E.07931
N6629 G1 X190.736 Y199.401 E1.43118
N6630 G1 X190.736 Y200.29 E.0286
N6631 G1 X188.176 Y200.29 E.0823
N6632 G1 X190.736 Y190.739 E.31796
N6633 G1 X190.736 Y189.111 E.05236
N6634 M204 S10000
N6635 G1 X190.736 Y172.021 F60000
N6636 G1 F4421.739
N6637 M204 S8000
N6638 G1 X190.736 Y170.393 E.05236
N6639 G1 X159.264 Y178.825 E1.0477
N6640 G1 X159.264 Y179.444 E.01989
N6641 G1 X180.111 Y200.29 E.94802
N6642 G1 X179.748 Y200.29 E.01169
N6643 G1 X190.736 Y159.282 E1.36518
N6644 G1 X190.736 Y157.654 E.05236
N6645 M204 S10000
N6646 G1 X164.131 Y127.385 F60000
N6647 G1 F4421.739
N6648 M204 S8000
N6649 G1 X162.503 Y127.385 E.05236
N6650 G1 X159.264 Y128.252 E.10781
N6651 G1 X159.264 Y129.881 E.05236
N6652 M204 S10000
N6653 G1 X159.264 Y183.992 F60000
N6654 G1 F4421.739
N6655 M204 S8000
N6656 G1 X159.264 Y182.364 E.05236
N6657 G1 X173.996 Y127.385 E1.8303
N6658 G1 X176.289 Y127.385 E.07373
N6659 G1 X190.736 Y141.831 E.65697
N6660 G1 X190.736 Y145.106 E.10531
N6661 G1 X159.264 Y153.539 E1.0477
N6662 G1 X159.264 Y150.907 E.08462
N6663 G1 X165.567 Y127.385 E.78309
N6664 G1 X164.775 Y127.385 E.02548
N6665 G1 X190.736 Y153.345 E1.18058
N6666 G1 X190.736 Y153.535 E.0061
N6667 G1 X159.264 Y161.968 E1.0477
N6668 G1 X159.264 Y156.416 E.17852
N6669 G1 X190.736 Y187.887 E1.43118
N6670 G1 X190.736 Y187.25 E.02048
N6671 G1 X159.264 Y195.683 E1.0477
N6672 G1 X159.264 Y197.311 E.05236
N6673 ; WIPE_START
N6674 G1 X159.264 Y195.683 E-.61876
N6675 G1 X159.623 Y195.587 E-.14124
N6676 ; WIPE_END
N6677 G1 E-.04 F1800
N6678 M204 S10000
N6679 G17
N6680 G3 Z3.6 I1.217 J0 P1  F60000
N6681 ; stop printing object, unique label id: 229
N6682 M625
N6683 ; object ids of layer 16 start: 229
N6684 M624 AQAAAAAAAAA=
N6685 ;======== H2D 20250527========
N6686 ; SKIPPABLE_START
N6687 ; SKIPTYPE: timelapse
N6688 M622.1 S1 ; for prev firware, default turned on
N6689 
N6690 M1002 judge_flag timelapse_record_flag
N6691 
N6692 M622 J1
N6693 M993 A2 B2 C2
N6694 M993 A0 B0 C0
N6695 
N6696 
N6697 
N6698 
N6699     M9711 M0 E1 X260 Y141 Z3.6 S11 C10 O0 T3000
N6700 
N6701 
N6702 
N6703 M993 A3 B3 C3
N6704 
N6705 M623
N6706 ; SKIPPABLE_END
N6707 
N6708 ; object ids of this layer16 end: 229
N6709 M625
N6710 ; CHANGE_LAYER
N6711 ; Z_HEIGHT: 3.4
N6712 ; LAYER_HEIGHT: 0.2
N6713 ;======== H2D 20250521========
N6714 ; layer num/total_layer_count: 17/63
N6715 ; update layer progress
N6716 M73 L17
N6717 M991 S0 P16 ;notify layer change
N6718 
N6719 
N6720 ; OBJECT_ID: 229
N6721 ; COOLING_NODE: 0
N6722 ; start printing object, unique label id: 229
N6723 M624 AQAAAAAAAAA=
N6724 G1 X191.084 Y200.639 F60000
N6725 G1 Z3.4
N6726 G1 E.8 F1800
N6727 ; FEATURE: Inner wall
N6728 ; LINE_WIDTH: 0.45
N6729 ; LAYER_HEIGHT: 0.2
N6730 G1 F4421.739
N6731 M204 S8000
N6732 G1 X158.916 Y200.639 E1.03439
N6733 G1 X158.916 Y127.036 E2.36678
N6734 G1 X191.084 Y127.036 E1.03439
N6735 G1 X191.084 Y200.579 E2.36485
N6736 ; COOLING_NODE: 0
N6737 M204 S10000
N6738 G1 X191.491 Y201.046 F60000
N6739 G1 F4421.739
N6740 M204 S8000
N6741 M73 P51 R26
N6742 G1 X158.509 Y201.046 E1.06057
N6743 G1 X158.509 Y126.629 E2.39296
N6744 G1 X191.491 Y126.629 E1.06057
N6745 G1 X191.491 Y200.986 E2.39103
N6746 ; COOLING_NODE: 0
N6747 M204 S10000
N6748 G1 X191.898 Y201.453 F60000
N6749 G1 F4421.739
N6750 M204 S8000
N6751 G1 X158.102 Y201.453 E1.08675
N6752 G1 X158.102 Y126.222 E2.41914
N6753 G1 X191.898 Y126.222 E1.08675
N6754 G1 X191.898 Y201.393 E2.41721
N6755 ; COOLING_NODE: 0
N6756 M204 S10000
N6757 G1 X192.29 Y201.845 F60000
N6758 ; FEATURE: Outer wall
N6759 ; LINE_WIDTH: 0.42
N6760 G1 F4773.528
N6761 M204 S5000
N6762 G1 X157.71 Y201.845 E1.03002
N6763 G1 X157.71 Y125.83 E2.26421
N6764 G1 X192.29 Y125.83 E1.03002
N6765 G1 X192.29 Y201.785 E2.26243
N6766 G1 E-.8 F1800
N6767 M204 S10000
N6768 G1 X186.402 Y200.29 Z3.8 F60000
N6769 G1 Z3.4
N6770 G1 E.8 F1800
N6771 ; FEATURE: Sparse infill
N6772 ; LINE_WIDTH: 0.45
N6773 G1 F4421.739
N6774 M204 S8000
N6775 G1 X188.03 Y200.29 E.05236
N6776 G1 X190.736 Y190.193 E.33616
N6777 G1 X190.736 Y188.564 E.05236
N6778 M204 S10000
N6779 G1 X190.736 Y168.911 F60000
N6780 G1 F4421.739
N6781 M204 S8000
N6782 G1 X190.736 Y170.539 E.05236
N6783 G1 X159.264 Y178.972 E1.0477
N6784 G1 X159.264 Y179.244 E.00875
N6785 G1 X180.311 Y200.29 E.95711
N6786 G1 X179.601 Y200.29 E.02283
N6787 G1 X190.736 Y158.736 E1.38337
N6788 G1 X190.736 Y157.108 E.05236
N6789 M204 S10000
N6790 G1 X164.678 Y127.385 F60000
N6791 G1 F4421.739
N6792 M204 S8000
N6793 M73 P51 R25
N6794 G1 X163.049 Y127.385 E.05236
N6795 G1 X159.264 Y128.399 E.126
N6796 G1 X159.264 Y130.027 E.05236
N6797 M204 S10000
N6798 G1 X159.264 Y151.989 F60000
N6799 G1 F4421.739
N6800 M204 S8000
N6801 G1 X159.264 Y150.361 E.05236
N6802 G1 X165.421 Y127.385 E.7649
N6803 G1 X164.975 Y127.385 E.01434
N6804 G1 X190.736 Y153.145 E1.17148
N6805 G1 X190.736 Y153.681 E.01724
N6806 G1 X159.264 Y162.114 E1.0477
N6807 G1 X159.264 Y160.486 E.05236
N6808 M204 S10000
N6809 G1 X159.264 Y183.446 F60000
N6810 G1 F4421.739
N6811 M204 S8000
N6812 G1 X159.264 Y181.818 E.05236
N6813 G1 X173.85 Y127.385 E1.81211
N6814 G1 X176.489 Y127.385 E.08487
N6815 G1 X190.736 Y141.631 E.64787
N6816 G1 X190.736 Y145.253 E.11645
N6817 G1 X159.264 Y153.685 E1.0477
N6818 G1 X159.264 Y156.216 E.08138
N6819 G1 X190.736 Y187.687 E1.43118
N6820 G1 X190.736 Y187.397 E.00934
N6821 G1 X159.264 Y195.829 E1.0477
N6822 G1 X159.264 Y200.29 E.14345
N6823 G1 X162.744 Y200.29 E.11187
N6824 G1 X182.279 Y127.385 E2.42708
N6825 G1 X180.65 Y127.385 E.05236
N6826 M204 S10000
N6827 G1 X190.736 Y135.195 F60000
N6828 G1 F4421.739
N6829 M204 S8000
N6830 G1 X190.736 Y136.824 E.05236
N6831 G1 X159.264 Y145.256 E1.0477
N6832 G1 X159.264 Y144.702 E.01783
N6833 G1 X190.736 Y176.173 E1.43118
N6834 G1 X190.736 Y178.968 E.08987
N6835 G1 X159.264 Y187.4 E1.0477
N6836 G1 X159.264 Y190.758 E.10796
N6837 G1 X168.797 Y200.29 E.4335
N6838 G1 X171.172 Y200.29 E.07638
N6839 G1 X190.707 Y127.385 E2.42708
N6840 G1 X188.003 Y127.385 E.08696
N6841 G1 X190.736 Y130.117 E.12427
N6842 G1 X190.736 Y131.746 E.05236
N6843 M204 S10000
N6844 G1 X190.736 Y128.395 F60000
N6845 G1 F4421.739
N6846 M204 S8000
N6847 G1 X159.264 Y136.828 E1.0477
N6848 G1 X159.264 Y133.188 E.11704
N6849 G1 X190.736 Y164.659 E1.43118
N6850 G1 X190.736 Y162.11 E.08197
N6851 G1 X159.264 Y170.543 E1.0477
N6852 G1 X159.264 Y167.73 E.09045
N6853 G1 X190.736 Y199.201 E1.43118
N6854 G1 X190.736 Y195.825 E.10855
N6855 G1 X174.072 Y200.29 E.55474
N6856 G1 X172.444 Y200.29 E.05236
N6857 ; WIPE_START
N6858 G1 X174.072 Y200.29 E-.61876
N6859 G1 X174.431 Y200.194 E-.14124
N6860 ; WIPE_END
N6861 G1 E-.04 F1800
N6862 M204 S10000
N6863 G17
N6864 G3 Z3.8 I1.217 J0 P1  F60000
N6865 ; stop printing object, unique label id: 229
N6866 M625
N6867 ; object ids of layer 17 start: 229
N6868 M624 AQAAAAAAAAA=
N6869 ;======== H2D 20250527========
N6870 ; SKIPPABLE_START
N6871 ; SKIPTYPE: timelapse
N6872 M622.1 S1 ; for prev firware, default turned on
N6873 
N6874 M1002 judge_flag timelapse_record_flag
N6875 
N6876 M622 J1
N6877 M993 A2 B2 C2
N6878 M993 A0 B0 C0
N6879 
N6880 
N6881 
N6882 
N6883     M9711 M0 E1 X260 Y141 Z3.8 S11 C10 O0 T3000
N6884 
N6885 
N6886 
N6887 M993 A3 B3 C3
N6888 
N6889 M623
N6890 ; SKIPPABLE_END
N6891 
N6892 ; object ids of this layer17 end: 229
N6893 M625
N6894 ; CHANGE_LAYER
N6895 ; Z_HEIGHT: 3.6
N6896 ; LAYER_HEIGHT: 0.2
N6897 ;======== H2D 20250521========
N6898 ; layer num/total_layer_count: 18/63
N6899 ; update layer progress
N6900 M73 L18
N6901 M991 S0 P17 ;notify layer change
N6902 
N6903 
N6904 ; OBJECT_ID: 229
N6905 ; COOLING_NODE: 0
N6906 ; start printing object, unique label id: 229
N6907 M624 AQAAAAAAAAA=
N6908 G1 X191.084 Y200.639 F60000
N6909 G1 Z3.6
N6910 G1 E.8 F1800
N6911 ; FEATURE: Inner wall
N6912 ; LINE_WIDTH: 0.45
N6913 ; LAYER_HEIGHT: 0.2
N6914 G1 F4421.739
N6915 M204 S8000
N6916 G1 X158.916 Y200.639 E1.03439
N6917 G1 X158.916 Y127.036 E2.36678
N6918 G1 X191.084 Y127.036 E1.03439
N6919 G1 X191.084 Y200.579 E2.36485
N6920 ; COOLING_NODE: 0
N6921 M204 S10000
N6922 G1 X191.491 Y201.046 F60000
N6923 G1 F4421.739
N6924 M204 S8000
N6925 G1 X158.509 Y201.046 E1.06057
N6926 G1 X158.509 Y126.629 E2.39296
N6927 G1 X191.491 Y126.629 E1.06057
N6928 G1 X191.491 Y200.986 E2.39103
N6929 ; COOLING_NODE: 0
N6930 M204 S10000
N6931 G1 X191.898 Y201.453 F60000
N6932 G1 F4421.739
N6933 M204 S8000
N6934 G1 X158.102 Y201.453 E1.08675
N6935 G1 X158.102 Y126.222 E2.41914
N6936 G1 X191.898 Y126.222 E1.08675
N6937 G1 X191.898 Y201.393 E2.41721
N6938 ; COOLING_NODE: 0
N6939 M204 S10000
N6940 G1 X192.29 Y201.845 F60000
N6941 ; FEATURE: Outer wall
N6942 ; LINE_WIDTH: 0.42
N6943 G1 F4773.528
N6944 M204 S5000
N6945 G1 X157.71 Y201.845 E1.03002
N6946 M73 P52 R25
N6947 G1 X157.71 Y125.83 E2.26421
N6948 G1 X192.29 Y125.83 E1.03002
N6949 G1 X192.29 Y201.785 E2.26243
N6950 G1 E-.8 F1800
N6951 M204 S10000
N6952 G1 X186.255 Y200.29 Z4 F60000
N6953 G1 Z3.6
N6954 G1 E.8 F1800
N6955 ; FEATURE: Sparse infill
N6956 ; LINE_WIDTH: 0.45
N6957 G1 F4421.739
N6958 M204 S8000
N6959 G1 X187.884 Y200.29 E.05236
N6960 G1 X190.736 Y189.646 E.35435
N6961 G1 X190.736 Y188.018 E.05236
N6962 M204 S10000
N6963 G1 X190.736 Y169.057 F60000
N6964 G1 F4421.739
N6965 M204 S8000
N6966 G1 X190.736 Y170.685 E.05236
N6967 G1 X159.264 Y179.118 E1.0477
N6968 G1 X159.264 Y179.044 E.00239
N6969 G1 X180.511 Y200.29 E.96621
N6970 G1 X179.455 Y200.29 E.03397
N6971 G1 X190.736 Y158.19 E1.40156
N6972 G1 X190.736 Y156.561 E.05236
N6973 M204 S10000
N6974 G1 X164.972 Y127.385 F60000
N6975 G1 F4421.739
N6976 M204 S8000
N6977 G1 X163.596 Y127.385 E.04424
N6978 G1 X159.264 Y128.545 E.14419
N6979 G1 X159.264 Y130.174 E.05236
N6980 M204 S10000
N6981 G1 X159.264 Y151.443 F60000
N6982 G1 F4421.739
N6983 M204 S8000
N6984 G1 X159.264 Y149.815 E.05236
N6985 G1 X165.275 Y127.385 E.74671
N6986 G1 X165.175 Y127.385 E.0032
N6987 G1 X190.736 Y152.945 E1.16239
N6988 G1 X190.736 Y153.828 E.02838
N6989 G1 X159.264 Y162.26 E1.0477
N6990 G1 X159.264 Y160.632 E.05236
N6991 M204 S10000
N6992 G1 X159.264 Y182.9 F60000
N6993 G1 F4421.739
N6994 M204 S8000
N6995 G1 X159.264 Y181.271 E.05236
N6996 G1 X173.703 Y127.385 E1.79392
N6997 G1 X176.689 Y127.385 E.09601
N6998 G1 X190.736 Y141.431 E.63878
N6999 G1 X190.736 Y145.399 E.12759
N7000 G1 X159.264 Y153.832 E1.04769
N7001 G1 X159.264 Y156.016 E.07024
N7002 G1 X190.736 Y187.487 E1.43118
N7003 G1 X190.736 Y187.543 E.0018
N7004 G1 X159.264 Y195.976 E1.04769
N7005 G1 X159.264 Y200.29 E.13875
N7006 G1 X162.597 Y200.29 E.10717
N7007 G1 X182.132 Y127.385 E2.42708
N7008 G1 X188.203 Y127.385 E.19522
N7009 G1 X190.736 Y129.917 E.11517
N7010 G1 X190.736 Y136.97 E.2268
N7011 G1 X159.264 Y145.403 E1.0477
N7012 G1 X159.264 Y144.502 E.02897
N7013 G1 X190.736 Y175.973 E1.43118
N7014 G1 X190.736 Y179.114 E.10101
N7015 G1 X159.264 Y187.547 E1.0477
N7016 G1 X159.264 Y190.558 E.09682
N7017 G1 X168.997 Y200.29 E.4426
N7018 G1 X171.026 Y200.29 E.06524
N7019 G1 X190.561 Y127.385 E2.42708
N7020 G1 X190.736 Y127.385 E.00562
N7021 G1 X190.736 Y128.541 E.03719
N7022 G1 X159.264 Y136.974 E1.0477
N7023 G1 X159.264 Y132.988 E.12818
N7024 G1 X190.736 Y164.459 E1.43118
N7025 G1 X190.736 Y162.257 E.07083
N7026 G1 X159.264 Y170.689 E1.04769
N7027 G1 X159.264 Y167.53 E.10159
N7028 G1 X190.736 Y199.001 E1.43118
N7029 G1 X190.736 Y195.972 E.09741
N7030 G1 X174.618 Y200.29 E.53655
N7031 G1 X172.99 Y200.29 E.05236
N7032 ; WIPE_START
N7033 G1 X174.618 Y200.29 E-.61876
N7034 G1 X174.977 Y200.194 E-.14124
N7035 ; WIPE_END
N7036 G1 E-.04 F1800
N7037 M204 S10000
N7038 G17
N7039 G3 Z4 I1.217 J0 P1  F60000
N7040 ; stop printing object, unique label id: 229
N7041 M625
N7042 ; object ids of layer 18 start: 229
N7043 M624 AQAAAAAAAAA=
N7044 ;======== H2D 20250527========
N7045 ; SKIPPABLE_START
N7046 ; SKIPTYPE: timelapse
N7047 M622.1 S1 ; for prev firware, default turned on
N7048 
N7049 M1002 judge_flag timelapse_record_flag
N7050 
N7051 M622 J1
N7052 M993 A2 B2 C2
N7053 M993 A0 B0 C0
N7054 
N7055 
N7056 
N7057 
N7058     M9711 M0 E1 X260 Y141 Z4 S11 C10 O0 T3000
N7059 
N7060 
N7061 
N7062 M993 A3 B3 C3
N7063 
N7064 M623
N7065 ; SKIPPABLE_END
N7066 
N7067 ; object ids of this layer18 end: 229
N7068 M625
N7069 ; CHANGE_LAYER
N7070 ; Z_HEIGHT: 3.8
N7071 ; LAYER_HEIGHT: 0.2
N7072 ;======== H2D 20250521========
N7073 ; layer num/total_layer_count: 19/63
N7074 ; update layer progress
N7075 M73 L19
N7076 M991 S0 P18 ;notify layer change
N7077 
N7078 
N7079 ; OBJECT_ID: 229
N7080 ; COOLING_NODE: 0
N7081 ; start printing object, unique label id: 229
N7082 M624 AQAAAAAAAAA=
N7083 G1 X191.084 Y200.639 F60000
N7084 G1 Z3.8
N7085 G1 E.8 F1800
N7086 ; FEATURE: Inner wall
N7087 ; LINE_WIDTH: 0.45
N7088 ; LAYER_HEIGHT: 0.2
N7089 G1 F4421.739
N7090 M204 S8000
N7091 G1 X158.916 Y200.639 E1.03439
N7092 G1 X158.916 Y127.036 E2.36678
N7093 G1 X191.084 Y127.036 E1.03439
N7094 G1 X191.084 Y200.579 E2.36485
N7095 ; COOLING_NODE: 0
N7096 M204 S10000
N7097 G1 X191.491 Y201.046 F60000
N7098 G1 F4421.739
N7099 M204 S8000
N7100 G1 X158.509 Y201.046 E1.06057
N7101 G1 X158.509 Y126.629 E2.39296
N7102 G1 X191.491 Y126.629 E1.06057
N7103 G1 X191.491 Y200.986 E2.39103
N7104 ; COOLING_NODE: 0
N7105 M204 S10000
N7106 G1 X191.898 Y201.453 F60000
N7107 G1 F4421.739
N7108 M204 S8000
N7109 G1 X158.102 Y201.453 E1.08675
N7110 G1 X158.102 Y126.222 E2.41914
N7111 G1 X191.898 Y126.222 E1.08675
N7112 G1 X191.898 Y201.393 E2.41721
N7113 ; COOLING_NODE: 0
N7114 M204 S10000
N7115 G1 X192.29 Y201.845 F60000
N7116 ; FEATURE: Outer wall
N7117 ; LINE_WIDTH: 0.42
N7118 G1 F4773.528
N7119 M204 S5000
N7120 G1 X157.71 Y201.845 E1.03002
N7121 G1 X157.71 Y125.83 E2.26421
N7122 G1 X192.29 Y125.83 E1.03002
N7123 G1 X192.29 Y201.785 E2.26243
N7124 G1 E-.8 F1800
N7125 M204 S10000
N7126 G1 X186.109 Y200.29 Z4.2 F60000
N7127 G1 Z3.8
N7128 G1 E.8 F1800
N7129 ; FEATURE: Sparse infill
N7130 ; LINE_WIDTH: 0.45
N7131 G1 F4421.739
N7132 M204 S8000
N7133 G1 X187.737 Y200.29 E.05236
N7134 G1 X190.736 Y189.1 E.37254
N7135 G1 X190.736 Y187.893 E.03882
N7136 M204 S10000
N7137 G1 X190.736 Y169.203 F60000
N7138 G1 F4421.739
N7139 M204 S8000
N7140 G1 X190.736 Y170.832 E.05236
N7141 G1 X159.264 Y179.264 E1.0477
N7142 G1 X159.264 Y178.844 E.01353
N7143 G1 X180.711 Y200.29 E.9753
N7144 G1 X179.308 Y200.29 E.0451
N7145 G1 X190.736 Y157.643 E1.41975
N7146 G1 X190.736 Y156.015 E.05236
N7147 M204 S10000
N7148 G1 X190.736 Y147.174 F60000
N7149 G1 F4421.739
N7150 M204 S8000
N7151 G1 X190.736 Y145.545 E.05236
N7152 G1 X159.264 Y153.978 E1.04769
N7153 G1 X159.264 Y155.816 E.0591
N7154 G1 X190.736 Y187.287 E1.43118
N7155 G1 X190.736 Y187.689 E.01294
N7156 G1 X159.264 Y196.122 E1.0477
N7157 G1 X159.264 Y200.29 E.13404
N7158 G1 X162.451 Y200.29 E.10246
N7159 G1 X181.986 Y127.385 E2.42708
N7160 M73 P53 R25
N7161 G1 X183.614 Y127.385 E.05236
N7162 M204 S10000
N7163 G1 X164.925 Y127.385 F60000
N7164 G1 F4421.739
N7165 M204 S8000
N7166 G1 X164.142 Y127.385 E.02516
N7167 G1 X159.264 Y128.692 E.16238
N7168 G1 X159.264 Y132.788 E.13172
N7169 G1 X190.736 Y164.259 E1.43118
N7170 G1 X190.736 Y162.403 E.05969
N7171 G1 X159.264 Y170.836 E1.0477
N7172 G1 X159.264 Y167.33 E.11273
N7173 G1 X190.736 Y198.801 E1.43118
N7174 G1 X190.736 Y196.118 E.08627
N7175 G1 X175.165 Y200.29 E.51836
N7176 G1 X173.536 Y200.29 E.05236
N7177 M204 S10000
N7178 G1 X159.264 Y182.353 F60000
N7179 G1 F4421.739
N7180 M204 S8000
N7181 G1 X159.264 Y180.725 E.05236
N7182 G1 X173.557 Y127.385 E1.77573
N7183 G1 X176.889 Y127.385 E.10715
N7184 G1 X190.736 Y141.231 E.62968
N7185 G1 X190.736 Y137.117 E.13231
N7186 G1 X159.264 Y145.549 E1.0477
N7187 G1 X159.264 Y144.302 E.04011
N7188 G1 X190.736 Y175.773 E1.43118
N7189 G1 X190.736 Y179.261 E.11215
N7190 G1 X159.264 Y187.693 E1.0477
N7191 G1 X159.264 Y190.358 E.08568
N7192 G1 X169.197 Y200.29 E.45169
N7193 G1 X170.88 Y200.29 E.0541
N7194 G1 X190.415 Y127.385 E2.42708
N7195 G1 X188.403 Y127.385 E.06468
N7196 G1 X190.736 Y129.717 E.10608
N7197 G1 X190.736 Y128.688 E.0331
N7198 M73 P53 R24
N7199 G1 X159.264 Y137.12 E1.0477
N7200 G1 X159.264 Y138.749 E.05236
N7201 M204 S10000
N7202 G1 X159.264 Y150.896 F60000
N7203 G1 F4421.739
N7204 M204 S8000
N7205 G1 X159.264 Y149.268 E.05236
N7206 G1 X165.128 Y127.385 E.72852
N7207 G1 X165.375 Y127.385 E.00794
N7208 G1 X190.736 Y152.745 E1.15329
N7209 G1 X190.736 Y153.974 E.03952
N7210 G1 X159.264 Y162.407 E1.0477
N7211 G1 X159.264 Y160.778 E.05236
N7212 ; WIPE_START
N7213 G1 X159.264 Y162.407 E-.61876
N7214 G1 X159.623 Y162.311 E-.14124
N7215 ; WIPE_END
N7216 G1 E-.04 F1800
N7217 M204 S10000
N7218 G17
N7219 G3 Z4.2 I1.217 J0 P1  F60000
N7220 ; stop printing object, unique label id: 229
N7221 M625
N7222 ; object ids of layer 19 start: 229
N7223 M624 AQAAAAAAAAA=
N7224 ;======== H2D 20250527========
N7225 ; SKIPPABLE_START
N7226 ; SKIPTYPE: timelapse
N7227 M622.1 S1 ; for prev firware, default turned on
N7228 
N7229 M1002 judge_flag timelapse_record_flag
N7230 
N7231 M622 J1
N7232 M993 A2 B2 C2
N7233 M993 A0 B0 C0
N7234 
N7235 
N7236 
N7237 
N7238     M9711 M0 E1 X260 Y141 Z4.2 S11 C10 O0 T3000
N7239 
N7240 
N7241 
N7242 M993 A3 B3 C3
N7243 
N7244 M623
N7245 ; SKIPPABLE_END
N7246 
N7247 ; object ids of this layer19 end: 229
N7248 M625
N7249 ; CHANGE_LAYER
N7250 ; Z_HEIGHT: 4
N7251 ; LAYER_HEIGHT: 0.2
N7252 ;======== H2D 20250521========
N7253 ; layer num/total_layer_count: 20/63
N7254 ; update layer progress
N7255 M73 L20
N7256 M991 S0 P19 ;notify layer change
N7257 
N7258 
N7259 ; OBJECT_ID: 229
N7260 ; COOLING_NODE: 0
N7261 ; start printing object, unique label id: 229
N7262 M624 AQAAAAAAAAA=
N7263 G1 X191.084 Y200.639 F60000
N7264 G1 Z4
N7265 G1 E.8 F1800
N7266 ; FEATURE: Inner wall
N7267 ; LINE_WIDTH: 0.45
N7268 ; LAYER_HEIGHT: 0.2
N7269 G1 F4421.739
N7270 M204 S8000
N7271 G1 X158.916 Y200.639 E1.03439
N7272 G1 X158.916 Y127.036 E2.36678
N7273 G1 X191.084 Y127.036 E1.03439
N7274 G1 X191.084 Y200.579 E2.36485
N7275 ; COOLING_NODE: 0
N7276 M204 S10000
N7277 G1 X191.491 Y201.046 F60000
N7278 G1 F4421.739
N7279 M204 S8000
N7280 G1 X158.509 Y201.046 E1.06057
N7281 G1 X158.509 Y126.629 E2.39296
N7282 G1 X191.491 Y126.629 E1.06057
N7283 G1 X191.491 Y200.986 E2.39103
N7284 ; COOLING_NODE: 0
N7285 M204 S10000
N7286 G1 X191.898 Y201.453 F60000
N7287 G1 F4421.739
N7288 M204 S8000
N7289 G1 X158.102 Y201.453 E1.08675
N7290 G1 X158.102 Y126.222 E2.41914
N7291 G1 X191.898 Y126.222 E1.08675
N7292 G1 X191.898 Y201.393 E2.41721
N7293 ; COOLING_NODE: 0
N7294 M204 S10000
N7295 G1 X192.29 Y201.845 F60000
N7296 ; FEATURE: Outer wall
N7297 ; LINE_WIDTH: 0.42
N7298 G1 F4773.528
N7299 M204 S5000
N7300 G1 X157.71 Y201.845 E1.03002
N7301 G1 X157.71 Y125.83 E2.26421
N7302 G1 X192.29 Y125.83 E1.03002
N7303 G1 X192.29 Y201.785 E2.26243
N7304 G1 E-.8 F1800
N7305 M204 S10000
N7306 G1 X185.962 Y200.29 Z4.4 F60000
N7307 G1 Z4
N7308 G1 E.8 F1800
N7309 ; FEATURE: Sparse infill
N7310 ; LINE_WIDTH: 0.45
N7311 G1 F4421.739
N7312 M204 S8000
N7313 G1 X187.591 Y200.29 E.05236
N7314 G1 X190.736 Y188.554 E.39073
N7315 G1 X190.736 Y187.836 E.02308
N7316 G1 X159.264 Y196.268 E1.0477
N7317 G1 X159.264 Y200.29 E.12933
N7318 G1 X162.304 Y200.29 E.09775
N7319 G1 X181.839 Y127.385 E2.42708
N7320 G1 X183.468 Y127.385 E.05236
N7321 M204 S10000
N7322 G1 X190.736 Y169.35 F60000
N7323 G1 F4421.739
N7324 M204 S8000
N7325 G1 X190.736 Y170.978 E.05236
N7326 G1 X159.264 Y179.411 E1.0477
N7327 M204 S10000
N7328 G1 X159.264 Y177.015 F60000
N7329 G1 F4421.739
N7330 M204 S8000
N7331 G1 X159.264 Y178.644 E.05236
N7332 G1 X180.911 Y200.29 E.9844
N7333 G1 X179.162 Y200.29 E.05624
N7334 G1 X190.736 Y157.097 E1.43794
N7335 G1 X190.736 Y155.469 E.05236
N7336 M204 S10000
N7337 G1 X190.736 Y147.32 F60000
N7338 G1 F4421.739
N7339 M204 S8000
N7340 G1 X190.736 Y145.692 E.05236
N7341 G1 X159.264 Y154.124 E1.0477
N7342 G1 X159.264 Y155.616 E.04796
N7343 G1 X190.736 Y187.087 E1.43118
N7344 G1 X190.736 Y185.459 E.05236
N7345 M204 S10000
N7346 G1 X174.083 Y200.29 F60000
N7347 G1 F4421.739
N7348 M204 S8000
N7349 G1 X175.711 Y200.29 E.05236
N7350 G1 X190.736 Y196.265 E.50017
N7351 G1 X190.736 Y198.601 E.07513
N7352 G1 X159.264 Y167.13 E1.43118
N7353 G1 X159.264 Y170.982 E.12387
N7354 G1 X190.736 Y162.549 E1.0477
N7355 G1 X190.736 Y164.059 E.04855
N7356 G1 X159.264 Y132.588 E1.43118
N7357 G1 X159.264 Y128.838 E.12059
N7358 G1 X164.688 Y127.385 E.18057
N7359 G1 X164.982 Y127.385 E.00943
N7360 G1 X159.264 Y148.722 E.71033
N7361 G1 X159.264 Y150.35 E.05236
N7362 M204 S10000
N7363 G1 X159.264 Y160.925 F60000
N7364 G1 F4421.739
N7365 M204 S8000
N7366 G1 X159.264 Y162.553 E.05236
N7367 G1 X190.736 Y154.121 E1.0477
N7368 G1 X190.736 Y152.545 E.05066
N7369 G1 X165.575 Y127.385 E1.1442
N7370 G1 X167.203 Y127.385 E.05236
N7371 M204 S10000
N7372 G1 X159.264 Y138.895 F60000
N7373 G1 F4421.739
N7374 M204 S8000
N7375 G1 X159.264 Y137.267 E.05236
N7376 G1 X190.736 Y128.834 E1.0477
N7377 G1 X190.736 Y129.517 E.02197
N7378 G1 X188.603 Y127.385 E.09698
N7379 G1 X190.268 Y127.385 E.05354
N7380 G1 X170.733 Y200.29 E2.42708
N7381 G1 X169.397 Y200.29 E.04296
N7382 G1 X159.264 Y190.158 E.46079
N7383 G1 X159.264 Y187.84 E.07454
N7384 M73 P54 R24
N7385 G1 X190.736 Y179.407 E1.0477
N7386 G1 X190.736 Y175.573 E.12328
N7387 G1 X159.264 Y144.102 E1.43118
N7388 G1 X159.264 Y145.696 E.05125
N7389 G1 X190.736 Y137.263 E1.0477
N7390 G1 X190.736 Y141.031 E.12117
N7391 G1 X177.089 Y127.385 E.62059
N7392 G1 X173.411 Y127.385 E.11829
N7393 G1 X159.264 Y180.178 E1.75754
N7394 G1 X159.264 Y181.807 E.05236
N7395 ; WIPE_START
N7396 G1 X159.264 Y180.178 E-.61876
N7397 G1 X159.361 Y179.819 E-.14124
N7398 ; WIPE_END
N7399 G1 E-.04 F1800
N7400 M204 S10000
N7401 G17
N7402 G3 Z4.4 I1.217 J0 P1  F60000
N7403 ; stop printing object, unique label id: 229
N7404 M625
N7405 ; object ids of layer 20 start: 229
N7406 M624 AQAAAAAAAAA=
N7407 ;======== H2D 20250527========
N7408 ; SKIPPABLE_START
N7409 ; SKIPTYPE: timelapse
N7410 M622.1 S1 ; for prev firware, default turned on
N7411 
N7412 M1002 judge_flag timelapse_record_flag
N7413 
N7414 M622 J1
N7415 M993 A2 B2 C2
N7416 M993 A0 B0 C0
N7417 
N7418 
N7419 
N7420 
N7421     M9711 M0 E1 X260 Y141 Z4.4 S11 C10 O0 T3000
N7422 
N7423 
N7424 
N7425 M993 A3 B3 C3
N7426 
N7427 M623
N7428 ; SKIPPABLE_END
N7429 
N7430 ; object ids of this layer20 end: 229
N7431 M625
N7432 ; CHANGE_LAYER
N7433 ; Z_HEIGHT: 4.2
N7434 ; LAYER_HEIGHT: 0.2
N7435 ;======== H2D 20250521========
N7436 ; layer num/total_layer_count: 21/63
N7437 ; update layer progress
N7438 M73 L21
N7439 M991 S0 P20 ;notify layer change
N7440 
N7441 
N7442 ; OBJECT_ID: 229
N7443 ; COOLING_NODE: 0
N7444 ; start printing object, unique label id: 229
N7445 M624 AQAAAAAAAAA=
N7446 G1 X191.084 Y200.639 F60000
N7447 G1 Z4.2
N7448 G1 E.8 F1800
N7449 ; FEATURE: Inner wall
N7450 ; LINE_WIDTH: 0.45
N7451 ; LAYER_HEIGHT: 0.2
N7452 G1 F4421.739
N7453 M204 S8000
N7454 G1 X158.916 Y200.639 E1.03439
N7455 G1 X158.916 Y127.036 E2.36678
N7456 G1 X191.084 Y127.036 E1.03439
N7457 G1 X191.084 Y200.579 E2.36485
N7458 ; COOLING_NODE: 0
N7459 M204 S10000
N7460 G1 X191.491 Y201.046 F60000
N7461 G1 F4421.739
N7462 M204 S8000
N7463 G1 X158.509 Y201.046 E1.06057
N7464 G1 X158.509 Y126.629 E2.39296
N7465 G1 X191.491 Y126.629 E1.06057
N7466 G1 X191.491 Y200.986 E2.39103
N7467 ; COOLING_NODE: 0
N7468 M204 S10000
N7469 G1 X191.898 Y201.453 F60000
N7470 G1 F4421.739
N7471 M204 S8000
N7472 G1 X158.102 Y201.453 E1.08675
N7473 G1 X158.102 Y126.222 E2.41914
N7474 G1 X191.898 Y126.222 E1.08675
N7475 G1 X191.898 Y201.393 E2.41721
N7476 ; COOLING_NODE: 0
N7477 M204 S10000
N7478 G1 X192.29 Y201.845 F60000
N7479 ; FEATURE: Outer wall
N7480 ; LINE_WIDTH: 0.42
N7481 G1 F4773.528
N7482 M204 S5000
N7483 G1 X157.71 Y201.845 E1.03002
N7484 G1 X157.71 Y125.83 E2.26421
N7485 G1 X192.29 Y125.83 E1.03002
N7486 G1 X192.29 Y201.785 E2.26243
N7487 G1 E-.8 F1800
N7488 M204 S10000
N7489 G1 X185.816 Y200.29 Z4.6 F60000
N7490 G1 Z4.2
N7491 G1 E.8 F1800
N7492 ; FEATURE: Sparse infill
N7493 ; LINE_WIDTH: 0.45
N7494 G1 F4421.739
N7495 M204 S8000
N7496 G1 X187.444 Y200.29 E.05236
N7497 G1 X190.736 Y187.982 E.40969
N7498 G1 X159.264 Y196.415 E1.0477
N7499 G1 X159.264 Y200.29 E.12462
N7500 G1 X162.158 Y200.29 E.09304
N7501 G1 X181.693 Y127.385 E2.42708
N7502 G1 X183.321 Y127.385 E.05236
N7503 M204 S10000
N7504 G1 X164.835 Y127.385 F60000
N7505 G1 F4421.739
N7506 M204 S8000
N7507 G1 X159.264 Y148.175 E.69214
N7508 G1 X159.264 Y149.804 E.05236
N7509 M204 S10000
N7510 G1 X159.264 Y139.042 F60000
N7511 G1 F4421.739
N7512 M204 S8000
N7513 G1 X159.264 Y137.413 E.05236
N7514 G1 X190.736 Y128.981 E1.0477
N7515 G1 X190.736 Y129.317 E.01083
N7516 G1 X188.803 Y127.385 E.08789
N7517 G1 X190.122 Y127.385 E.04241
N7518 G1 X170.587 Y200.29 E2.42708
N7519 G1 X169.597 Y200.29 E.03182
N7520 G1 X159.264 Y189.958 E.46988
N7521 G1 X159.264 Y187.986 E.0634
N7522 G1 X190.736 Y179.553 E1.0477
N7523 G1 X190.736 Y175.373 E.13442
N7524 G1 X159.264 Y143.902 E1.43118
N7525 G1 X159.264 Y145.842 E.06239
N7526 G1 X190.736 Y137.409 E1.0477
N7527 G1 X190.736 Y140.831 E.11003
N7528 G1 X177.289 Y127.385 E.61149
N7529 G1 X173.264 Y127.385 E.12943
N7530 G1 X159.264 Y179.632 E1.73935
N7531 G1 X159.264 Y179.557 E.00241
N7532 G1 X190.736 Y171.125 E1.0477
N7533 G1 X190.736 Y169.496 E.05236
N7534 M204 S10000
N7535 G1 X190.736 Y185.259 F60000
N7536 G1 F4421.739
N7537 M204 S8000
N7538 G1 X190.736 Y186.887 E.05236
N7539 G1 X159.264 Y155.416 E1.43118
N7540 G1 X159.264 Y154.271 E.03682
N7541 G1 X190.736 Y145.838 E1.0477
N7542 G1 X190.736 Y147.466 E.05236
N7543 M204 S10000
N7544 G1 X190.736 Y154.922 F60000
N7545 G1 F4421.739
N7546 M204 S8000
N7547 G1 X190.736 Y156.55 E.05236
N7548 G1 X179.015 Y200.29 E1.45613
N7549 G1 X181.111 Y200.29 E.06738
N7550 G1 X159.264 Y178.444 E.99349
N7551 M204 S10000
N7552 G1 X159.264 Y161.071 F60000
N7553 G1 F4421.739
N7554 M204 S8000
N7555 G1 X159.264 Y162.7 E.05236
N7556 G1 X190.736 Y154.267 E1.04769
N7557 G1 X190.736 Y152.345 E.0618
N7558 G1 X165.775 Y127.385 E1.1351
N7559 G1 X165.235 Y127.385 E.01737
N7560 G1 X159.264 Y128.984 E.19876
N7561 G1 X159.264 Y132.388 E.10945
N7562 G1 X190.736 Y163.859 E1.43118
N7563 G1 X190.736 Y162.696 E.03741
N7564 G1 X159.264 Y171.128 E1.0477
N7565 G1 X159.264 Y166.93 E.13501
N7566 G1 X190.736 Y198.401 E1.43118
N7567 G1 X190.736 Y196.411 E.06399
N7568 G1 X176.258 Y200.29 E.48198
N7569 G1 X174.629 Y200.29 E.05236
N7570 ; WIPE_START
N7571 G1 X176.258 Y200.29 E-.61876
N7572 G1 X176.617 Y200.194 E-.14124
N7573 ; WIPE_END
N7574 G1 E-.04 F1800
N7575 M204 S10000
N7576 G17
N7577 G3 Z4.6 I1.217 J0 P1  F60000
N7578 ; stop printing object, unique label id: 229
N7579 M625
N7580 ; object ids of layer 21 start: 229
N7581 M624 AQAAAAAAAAA=
N7582 ;======== H2D 20250527========
N7583 ; SKIPPABLE_START
N7584 ; SKIPTYPE: timelapse
N7585 M622.1 S1 ; for prev firware, default turned on
N7586 
N7587 M1002 judge_flag timelapse_record_flag
N7588 
N7589 M622 J1
N7590 M993 A2 B2 C2
N7591 M993 A0 B0 C0
N7592 
N7593 
N7594 
N7595 
N7596     M9711 M0 E1 X260 Y141 Z4.6 S11 C10 O0 T3000
N7597 
N7598 
N7599 
N7600 M993 A3 B3 C3
N7601 
N7602 M623
N7603 ; SKIPPABLE_END
N7604 
N7605 ; object ids of this layer21 end: 229
N7606 M625
N7607 ; CHANGE_LAYER
N7608 ; Z_HEIGHT: 4.4
N7609 ; LAYER_HEIGHT: 0.2
N7610 ;======== H2D 20250521========
N7611 ; layer num/total_layer_count: 22/63
N7612 ; update layer progress
N7613 M73 L22
N7614 M991 S0 P21 ;notify layer change
N7615 
N7616 
N7617 ; OBJECT_ID: 229
N7618 ; COOLING_NODE: 0
N7619 ; start printing object, unique label id: 229
N7620 M624 AQAAAAAAAAA=
N7621 G1 X191.084 Y200.639 F60000
N7622 G1 Z4.4
N7623 G1 E.8 F1800
N7624 ; FEATURE: Inner wall
N7625 ; LINE_WIDTH: 0.45
N7626 ; LAYER_HEIGHT: 0.2
N7627 G1 F4421.739
N7628 M204 S8000
N7629 G1 X158.916 Y200.639 E1.03439
N7630 G1 X158.916 Y127.036 E2.36678
N7631 G1 X191.084 Y127.036 E1.03439
N7632 G1 X191.084 Y200.579 E2.36485
N7633 ; COOLING_NODE: 0
N7634 M204 S10000
N7635 G1 X191.491 Y201.046 F60000
N7636 G1 F4421.739
N7637 M204 S8000
N7638 G1 X158.509 Y201.046 E1.06057
N7639 G1 X158.509 Y126.629 E2.39296
N7640 G1 X191.491 Y126.629 E1.06057
N7641 G1 X191.491 Y200.986 E2.39103
N7642 ; COOLING_NODE: 0
N7643 M204 S10000
N7644 G1 X191.898 Y201.453 F60000
N7645 M73 P55 R24
N7646 G1 F4421.739
N7647 M204 S8000
N7648 G1 X158.102 Y201.453 E1.08675
N7649 G1 X158.102 Y126.222 E2.41914
N7650 G1 X191.898 Y126.222 E1.08675
N7651 G1 X191.898 Y201.393 E2.41721
N7652 ; COOLING_NODE: 0
N7653 M204 S10000
N7654 G1 X192.29 Y201.845 F60000
N7655 ; FEATURE: Outer wall
N7656 ; LINE_WIDTH: 0.42
N7657 M73 P55 R23
N7658 G1 F4773.528
N7659 M204 S5000
N7660 G1 X157.71 Y201.845 E1.03002
N7661 G1 X157.71 Y125.83 E2.26421
N7662 G1 X192.29 Y125.83 E1.03002
N7663 G1 X192.29 Y201.785 E2.26243
N7664 G1 E-.8 F1800
N7665 M204 S10000
N7666 G1 X185.67 Y200.29 Z4.8 F60000
N7667 G1 Z4.4
N7668 G1 E.8 F1800
N7669 ; FEATURE: Sparse infill
N7670 ; LINE_WIDTH: 0.45
N7671 G1 F4421.739
N7672 M204 S8000
N7673 G1 X187.298 Y200.29 E.05236
N7674 G1 X190.736 Y187.461 E.42711
N7675 G1 X190.736 Y186.687 E.02488
N7676 G1 X159.264 Y155.216 E1.43118
N7677 G1 X159.264 Y154.417 E.02568
N7678 G1 X190.736 Y145.985 E1.0477
N7679 G1 X190.736 Y152.145 E.1981
N7680 G1 X165.975 Y127.385 E1.12601
N7681 G1 X165.781 Y127.385 E.00623
N7682 G1 X159.264 Y129.131 E.21695
N7683 G1 X159.264 Y132.188 E.09831
N7684 G1 X190.736 Y163.659 E1.43118
N7685 G1 X190.736 Y162.842 E.02627
N7686 G1 X159.264 Y171.275 E1.0477
N7687 G1 X159.264 Y172.903 E.05236
N7688 M204 S10000
N7689 G1 X159.264 Y178.244 F60000
N7690 G1 F4421.739
N7691 M204 S8000
N7692 G1 X181.311 Y200.29 E1.00259
N7693 G1 X178.869 Y200.29 E.07852
N7694 G1 X190.736 Y156.004 E1.47432
N7695 G1 X190.736 Y154.413 E.05115
N7696 G1 X159.264 Y162.846 E1.04769
N7697 G1 X159.264 Y166.73 E.12489
N7698 G1 X190.736 Y198.201 E1.43118
N7699 G1 X190.736 Y196.557 E.05285
N7700 G1 X176.804 Y200.29 E.46379
N7701 G1 X175.176 Y200.29 E.05236
N7702 M204 S10000
N7703 G1 X159.264 Y149.257 F60000
N7704 G1 F4421.739
N7705 M204 S8000
N7706 G1 X159.264 Y147.629 E.05236
N7707 G1 X164.689 Y127.385 E.67395
N7708 M204 S10000
N7709 G1 X171.489 Y127.385 F60000
N7710 G1 F4421.739
N7711 M204 S8000
N7712 G1 X173.118 Y127.385 E.05236
N7713 G1 X159.264 Y179.086 E1.72116
N7714 G1 X159.264 Y179.704 E.01987
N7715 G1 X190.736 Y171.271 E1.0477
N7716 G1 X190.736 Y175.173 E.12548
N7717 G1 X159.264 Y143.702 E1.43118
N7718 G1 X159.264 Y145.988 E.07353
N7719 G1 X190.736 Y137.556 E1.0477
N7720 G1 X190.736 Y140.631 E.09889
N7721 G1 X177.489 Y127.385 E.6024
N7722 G1 X181.546 Y127.385 E.13047
N7723 G1 X162.011 Y200.29 E2.42708
N7724 G1 X159.264 Y200.29 E.08833
N7725 G1 X159.264 Y196.561 E.11991
N7726 G1 X190.736 Y188.129 E1.0477
N7727 M204 S10000
N7728 G1 X190.736 Y181.328 F60000
N7729 G1 F4421.739
N7730 M204 S8000
N7731 G1 X190.736 Y179.7 E.05236
N7732 G1 X159.264 Y188.132 E1.04769
N7733 G1 X159.264 Y189.758 E.05227
N7734 G1 X169.797 Y200.29 E.47898
N7735 G1 X170.44 Y200.29 E.02069
N7736 G1 X189.975 Y127.385 E2.42708
N7737 G1 X189.003 Y127.385 E.03127
N7738 G1 X190.736 Y129.127 E.07901
N7739 G1 X159.264 Y137.56 E1.0477
N7740 G1 X159.264 Y139.188 E.05236
N7741 ; WIPE_START
N7742 G1 X159.264 Y137.56 E-.61876
N7743 G1 X159.623 Y137.463 E-.14124
N7744 ; WIPE_END
N7745 G1 E-.04 F1800
N7746 M204 S10000
N7747 G17
N7748 G3 Z4.8 I1.217 J0 P1  F60000
N7749 ; stop printing object, unique label id: 229
N7750 M625
N7751 ; object ids of layer 22 start: 229
N7752 M624 AQAAAAAAAAA=
N7753 ;======== H2D 20250527========
N7754 ; SKIPPABLE_START
N7755 ; SKIPTYPE: timelapse
N7756 M622.1 S1 ; for prev firware, default turned on
N7757 
N7758 M1002 judge_flag timelapse_record_flag
N7759 
N7760 M622 J1
N7761 M993 A2 B2 C2
N7762 M993 A0 B0 C0
N7763 
N7764 
N7765 
N7766 
N7767     M9711 M0 E1 X260 Y141 Z4.8 S11 C10 O0 T3000
N7768 
N7769 
N7770 
N7771 M993 A3 B3 C3
N7772 
N7773 M623
N7774 ; SKIPPABLE_END
N7775 
N7776 ; object ids of this layer22 end: 229
N7777 M625
N7778 ; CHANGE_LAYER
N7779 ; Z_HEIGHT: 4.6
N7780 ; LAYER_HEIGHT: 0.2
N7781 ;======== H2D 20250521========
N7782 ; layer num/total_layer_count: 23/63
N7783 ; update layer progress
N7784 M73 L23
N7785 M991 S0 P22 ;notify layer change
N7786 
N7787 
N7788 ; OBJECT_ID: 229
N7789 ; COOLING_NODE: 0
N7790 ; start printing object, unique label id: 229
N7791 M624 AQAAAAAAAAA=
N7792 G1 X191.084 Y200.639 F60000
N7793 G1 Z4.6
N7794 G1 E.8 F1800
N7795 ; FEATURE: Inner wall
N7796 ; LINE_WIDTH: 0.45
N7797 ; LAYER_HEIGHT: 0.2
N7798 G1 F4421.739
N7799 M204 S8000
N7800 G1 X158.916 Y200.639 E1.03439
N7801 G1 X158.916 Y127.036 E2.36678
N7802 G1 X191.084 Y127.036 E1.03439
N7803 G1 X191.084 Y200.579 E2.36485
N7804 ; COOLING_NODE: 0
N7805 M204 S10000
N7806 G1 X191.491 Y201.046 F60000
N7807 G1 F4421.739
N7808 M204 S8000
N7809 G1 X158.509 Y201.046 E1.06057
N7810 G1 X158.509 Y126.629 E2.39296
N7811 G1 X191.491 Y126.629 E1.06057
N7812 G1 X191.491 Y200.986 E2.39103
N7813 ; COOLING_NODE: 0
N7814 M204 S10000
N7815 G1 X191.898 Y201.453 F60000
N7816 G1 F4421.739
N7817 M204 S8000
N7818 G1 X158.102 Y201.453 E1.08675
N7819 G1 X158.102 Y126.222 E2.41914
N7820 G1 X191.898 Y126.222 E1.08675
N7821 G1 X191.898 Y201.393 E2.41721
N7822 ; COOLING_NODE: 0
N7823 M204 S10000
N7824 G1 X192.29 Y201.845 F60000
N7825 ; FEATURE: Outer wall
N7826 ; LINE_WIDTH: 0.42
N7827 G1 F4773.528
N7828 M204 S5000
N7829 G1 X157.71 Y201.845 E1.03002
N7830 G1 X157.71 Y125.83 E2.26421
N7831 G1 X192.29 Y125.83 E1.03002
N7832 G1 X192.29 Y201.785 E2.26243
N7833 G1 E-.8 F1800
N7834 M204 S10000
N7835 G1 X188.78 Y200.29 Z5 F60000
N7836 M73 P56 R23
N7837 G1 Z4.6
N7838 G1 E.8 F1800
N7839 ; FEATURE: Sparse infill
N7840 ; LINE_WIDTH: 0.45
N7841 G1 F4421.739
N7842 M204 S8000
N7843 G1 X187.151 Y200.29 E.05236
N7844 G1 X190.736 Y186.914 E.4453
N7845 G1 X190.736 Y186.487 E.01374
N7846 G1 X159.264 Y155.016 E1.43118
N7847 G1 X159.264 Y154.564 E.01454
N7848 G1 X190.736 Y146.131 E1.0477
N7849 G1 X190.736 Y151.945 E.18696
N7850 G1 X166.175 Y127.385 E1.11691
N7851 G1 X166.328 Y127.385 E.00491
N7852 G1 X159.264 Y129.277 E.23514
N7853 G1 X159.264 Y131.988 E.08717
N7854 G1 X190.736 Y163.459 E1.43118
N7855 G1 X190.736 Y162.989 E.01513
N7856 G1 X159.264 Y171.421 E1.0477
N7857 G1 X159.264 Y173.05 E.05236
N7858 M204 S10000
N7859 G1 X159.264 Y178.044 F60000
N7860 G1 F4421.739
N7861 M204 S8000
N7862 G1 X181.511 Y200.29 E1.01168
N7863 G1 X178.723 Y200.29 E.08966
N7864 G1 X190.736 Y155.458 E1.49251
N7865 G1 X190.736 Y154.56 E.02887
N7866 G1 X159.264 Y162.992 E1.0477
N7867 G1 X159.264 Y166.53 E.11375
N7868 G1 X190.736 Y198.001 E1.43118
N7869 G1 X190.736 Y196.704 E.04171
N7870 G1 X177.35 Y200.29 E.4456
N7871 G1 X175.722 Y200.29 E.05236
N7872 M204 S10000
N7873 G1 X171.343 Y127.385 F60000
N7874 G1 F4421.739
N7875 M204 S8000
N7876 G1 X172.971 Y127.385 E.05236
N7877 G1 X159.264 Y178.539 E1.70297
N7878 G1 X159.264 Y179.85 E.04215
N7879 G1 X190.736 Y171.417 E1.0477
N7880 G1 X190.736 Y174.973 E.11434
N7881 G1 X159.264 Y143.502 E1.43118
N7882 G1 X159.264 Y137.706 E.18637
N7883 G1 X190.736 Y129.273 E1.0477
N7884 G1 X190.736 Y128.917 E.01145
N7885 G1 X189.203 Y127.385 E.06969
N7886 G1 X189.829 Y127.385 E.02013
N7887 G1 X170.294 Y200.29 E2.42708
N7888 G1 X169.997 Y200.29 E.00955
N7889 G1 X159.264 Y189.558 E.48807
N7890 G1 X159.264 Y188.279 E.04112
N7891 G1 X190.736 Y179.846 E1.0477
N7892 G1 X190.736 Y181.474 E.05236
N7893 M204 S10000
N7894 G1 X190.736 Y189.903 F60000
N7895 G1 F4421.739
N7896 M204 S8000
N7897 G1 X190.736 Y188.275 E.05236
N7898 G1 X159.264 Y196.708 E1.0477
N7899 G1 X159.264 Y200.29 E.11521
N7900 G1 X161.865 Y200.29 E.08363
N7901 G1 X181.4 Y127.385 E2.42708
N7902 G1 X177.689 Y127.385 E.11933
N7903 G1 X190.736 Y140.431 E.5933
N7904 G1 X190.736 Y137.702 E.08775
N7905 G1 X159.264 Y146.135 E1.04769
N7906 M204 S10000
N7907 G1 X159.264 Y148.711 F60000
N7908 G1 F4421.739
N7909 M204 S8000
N7910 G1 X159.264 Y147.083 E.05236
N7911 G1 X164.542 Y127.385 E.65576
N7912 G1 X162.914 Y127.385 E.05236
N7913 ; WIPE_START
N7914 G1 X164.542 Y127.385 E-.61876
N7915 G1 X164.446 Y127.744 E-.14124
N7916 ; WIPE_END
N7917 G1 E-.04 F1800
N7918 M204 S10000
N7919 G17
N7920 G3 Z5 I1.217 J0 P1  F60000
N7921 ; stop printing object, unique label id: 229
N7922 M625
N7923 ; object ids of layer 23 start: 229
N7924 M624 AQAAAAAAAAA=
N7925 ;======== H2D 20250527========
N7926 ; SKIPPABLE_START
N7927 ; SKIPTYPE: timelapse
N7928 M622.1 S1 ; for prev firware, default turned on
N7929 
N7930 M1002 judge_flag timelapse_record_flag
N7931 
N7932 M622 J1
N7933 M993 A2 B2 C2
N7934 M993 A0 B0 C0
N7935 
N7936 
N7937 
N7938 
N7939     M9711 M0 E1 X260 Y141 Z5 S11 C10 O0 T3000
N7940 
N7941 
N7942 
N7943 M993 A3 B3 C3
N7944 
N7945 M623
N7946 ; SKIPPABLE_END
N7947 
N7948 ; object ids of this layer23 end: 229
N7949 M625
N7950 ; CHANGE_LAYER
N7951 ; Z_HEIGHT: 4.8
N7952 ; LAYER_HEIGHT: 0.2
N7953 ;======== H2D 20250521========
N7954 ; layer num/total_layer_count: 24/63
N7955 ; update layer progress
N7956 M73 L24
N7957 M991 S0 P23 ;notify layer change
N7958 
N7959 
N7960 ; OBJECT_ID: 229
N7961 ; COOLING_NODE: 0
N7962 ; start printing object, unique label id: 229
N7963 M624 AQAAAAAAAAA=
N7964 G1 X191.084 Y200.639 F60000
N7965 G1 Z4.8
N7966 G1 E.8 F1800
N7967 ; FEATURE: Inner wall
N7968 ; LINE_WIDTH: 0.45
N7969 ; LAYER_HEIGHT: 0.2
N7970 G1 F4421.739
N7971 M204 S8000
N7972 G1 X158.916 Y200.639 E1.03439
N7973 G1 X158.916 Y127.036 E2.36678
N7974 G1 X191.084 Y127.036 E1.03439
N7975 G1 X191.084 Y200.579 E2.36485
N7976 ; COOLING_NODE: 0
N7977 M204 S10000
N7978 G1 X191.491 Y201.046 F60000
N7979 G1 F4421.739
N7980 M204 S8000
N7981 G1 X158.509 Y201.046 E1.06057
N7982 G1 X158.509 Y126.629 E2.39296
N7983 G1 X191.491 Y126.629 E1.06057
N7984 G1 X191.491 Y200.986 E2.39103
N7985 ; COOLING_NODE: 0
N7986 M204 S10000
N7987 G1 X191.898 Y201.453 F60000
N7988 G1 F4421.739
N7989 M204 S8000
N7990 G1 X158.102 Y201.453 E1.08675
N7991 G1 X158.102 Y126.222 E2.41914
N7992 G1 X191.898 Y126.222 E1.08675
N7993 G1 X191.898 Y201.393 E2.41721
N7994 ; COOLING_NODE: 0
N7995 M204 S10000
N7996 G1 X192.29 Y201.845 F60000
N7997 ; FEATURE: Outer wall
N7998 ; LINE_WIDTH: 0.42
N7999 G1 F4773.528
N8000 M204 S5000
N8001 G1 X157.71 Y201.845 E1.03002
N8002 G1 X157.71 Y125.83 E2.26421
N8003 G1 X192.29 Y125.83 E1.03002
N8004 G1 X192.29 Y201.785 E2.26243
N8005 G1 E-.8 F1800
N8006 M204 S10000
N8007 G1 X191.288 Y194.218 Z5.2 F60000
N8008 G1 X190.736 Y190.05 Z5.2
N8009 G1 Z4.8
N8010 G1 E.8 F1800
N8011 ; FEATURE: Sparse infill
N8012 ; LINE_WIDTH: 0.45
N8013 G1 F4421.739
N8014 M204 S8000
N8015 G1 X190.736 Y188.421 E.05236
N8016 G1 X159.264 Y196.854 E1.0477
N8017 G1 X159.264 Y200.29 E.1105
N8018 G1 X161.719 Y200.29 E.07892
N8019 G1 X181.254 Y127.385 E2.42708
N8020 G1 X177.889 Y127.385 E.10819
N8021 G1 X190.736 Y140.231 E.58421
N8022 G1 X190.736 Y137.849 E.07661
N8023 G1 X159.264 Y146.281 E1.0477
N8024 G1 X159.264 Y146.536 E.00819
N8025 G1 X164.396 Y127.385 E.63757
N8026 G1 X162.768 Y127.385 E.05236
N8027 M204 S10000
N8028 G1 X166.375 Y127.385 F60000
N8029 G1 F4421.739
N8030 M204 S8000
N8031 G1 X190.736 Y151.745 E1.10782
N8032 G1 X190.736 Y146.277 E.17582
N8033 G1 X159.264 Y154.71 E1.0477
N8034 G1 X159.264 Y154.816 E.0034
N8035 G1 X190.736 Y186.287 E1.43118
N8036 G1 X190.736 Y186.368 E.0026
N8037 G1 X187.005 Y200.29 E.46349
N8038 G1 X181.711 Y200.29 E.17024
N8039 G1 X159.264 Y177.844 E1.02078
N8040 G1 X159.264 Y177.993 E.00479
N8041 G1 X172.825 Y127.385 E1.68478
N8042 G1 X166.874 Y127.385 E.19135
N8043 M73 P56 R22
N8044 G1 X159.264 Y129.424 E.25333
N8045 G1 X159.264 Y131.788 E.07603
N8046 M73 P57 R22
N8047 G1 X190.736 Y163.259 E1.43118
N8048 G1 X190.736 Y163.135 E.00399
N8049 G1 X159.264 Y171.568 E1.0477
N8050 G1 X159.264 Y169.939 E.05236
N8051 M204 S10000
N8052 G1 X159.264 Y181.625 F60000
N8053 G1 F4421.739
N8054 M204 S8000
N8055 G1 X159.264 Y179.996 E.05236
N8056 G1 X190.736 Y171.564 E1.0477
N8057 G1 X190.736 Y174.773 E.1032
N8058 G1 X159.264 Y143.302 E1.43118
N8059 G1 X159.264 Y137.852 E.17524
N8060 G1 X190.736 Y129.42 E1.0477
N8061 G1 X190.736 Y128.717 E.02259
N8062 G1 X189.403 Y127.385 E.0606
N8063 G1 X189.682 Y127.385 E.00899
N8064 G1 X170.147 Y200.29 E2.42708
N8065 G1 X170.197 Y200.29 E.00159
N8066 G1 X159.264 Y189.358 E.49717
N8067 G1 X159.264 Y188.425 E.02999
N8068 G1 X190.736 Y179.993 E1.0477
N8069 G1 X190.736 Y181.621 E.05236
N8070 M204 S10000
N8071 G1 X178.576 Y200.29 F60000
N8072 G1 F4421.739
N8073 M204 S8000
N8074 G1 X190.736 Y154.911 E1.5107
N8075 G1 X190.736 Y154.706 E.00659
N8076 G1 X159.264 Y163.139 E1.0477
N8077 G1 X159.264 Y166.33 E.10261
N8078 G1 X190.736 Y197.801 E1.43118
N8079 G1 X190.736 Y196.85 E.03057
N8080 G1 X177.897 Y200.29 E.42741
N8081 G1 X176.269 Y200.29 E.05236
N8082 ; WIPE_START
N8083 G1 X177.897 Y200.29 E-.61876
N8084 G1 X178.256 Y200.194 E-.14124
N8085 ; WIPE_END
N8086 G1 E-.04 F1800
N8087 M204 S10000
N8088 G17
N8089 G3 Z5.2 I1.217 J0 P1  F60000
N8090 ; stop printing object, unique label id: 229
N8091 M625
N8092 ; object ids of layer 24 start: 229
N8093 M624 AQAAAAAAAAA=
N8094 ;======== H2D 20250527========
N8095 ; SKIPPABLE_START
N8096 ; SKIPTYPE: timelapse
N8097 M622.1 S1 ; for prev firware, default turned on
N8098 
N8099 M1002 judge_flag timelapse_record_flag
N8100 
N8101 M622 J1
N8102 M993 A2 B2 C2
N8103 M993 A0 B0 C0
N8104 
N8105 
N8106 
N8107 
N8108     M9711 M0 E1 X260 Y141 Z5.2 S11 C10 O0 T3000
N8109 
N8110 
N8111 
N8112 M993 A3 B3 C3
N8113 
N8114 M623
N8115 ; SKIPPABLE_END
N8116 
N8117 ; object ids of this layer24 end: 229
N8118 M625
N8119 ; CHANGE_LAYER
N8120 ; Z_HEIGHT: 5
N8121 ; LAYER_HEIGHT: 0.2
N8122 ;======== H2D 20250521========
N8123 ; layer num/total_layer_count: 25/63
N8124 ; update layer progress
N8125 M73 L25
N8126 M991 S0 P24 ;notify layer change
N8127 
N8128 
N8129 M106 S51
N8130 ; OBJECT_ID: 229
N8131 ; COOLING_NODE: 0
N8132 ; start printing object, unique label id: 229
N8133 M624 AQAAAAAAAAA=
N8134 G1 X191.084 Y200.639 F60000
N8135 G1 Z5
N8136 G1 E.8 F1800
N8137 ; FEATURE: Inner wall
N8138 ; LINE_WIDTH: 0.45
N8139 ; LAYER_HEIGHT: 0.2
N8140 G1 F4421.739
N8141 M204 S8000
N8142 G1 X158.916 Y200.639 E1.03439
N8143 G1 X158.916 Y127.036 E2.36678
N8144 G1 X191.084 Y127.036 E1.03439
N8145 G1 X191.084 Y200.579 E2.36485
N8146 ; COOLING_NODE: 0
N8147 M204 S10000
N8148 G1 X191.491 Y201.046 F60000
N8149 G1 F4421.739
N8150 M204 S8000
N8151 G1 X158.509 Y201.046 E1.06057
N8152 G1 X158.509 Y126.629 E2.39296
N8153 G1 X191.491 Y126.629 E1.06057
N8154 G1 X191.491 Y200.986 E2.39103
N8155 ; COOLING_NODE: 0
N8156 M204 S10000
N8157 G1 X191.898 Y201.453 F60000
N8158 G1 F4421.739
N8159 M204 S8000
N8160 G1 X158.102 Y201.453 E1.08675
N8161 G1 X158.102 Y126.222 E2.41914
N8162 G1 X191.898 Y126.222 E1.08675
N8163 G1 X191.898 Y201.393 E2.41721
N8164 ; COOLING_NODE: 0
N8165 M204 S10000
N8166 G1 X192.29 Y201.845 F60000
N8167 ; FEATURE: Outer wall
N8168 ; LINE_WIDTH: 0.42
N8169 G1 F4773.528
N8170 M204 S5000
N8171 G1 X157.71 Y201.845 E1.03002
N8172 G1 X157.71 Y125.83 E2.26421
N8173 G1 X192.29 Y125.83 E1.03002
N8174 G1 X192.29 Y201.785 E2.26243
N8175 G1 E-.8 F1800
N8176 M204 S10000
N8177 G1 X191.275 Y194.22 Z5.4 F60000
N8178 G1 X190.736 Y190.196 Z5.4
N8179 G1 Z5
N8180 G1 E.8 F1800
N8181 ; FEATURE: Sparse infill
N8182 ; LINE_WIDTH: 0.45
N8183 G1 F4421.739
N8184 M204 S8000
N8185 G1 X190.736 Y188.568 E.05236
N8186 G1 X159.264 Y197 E1.0477
N8187 G1 X159.264 Y200.29 E.10579
N8188 G1 X161.572 Y200.29 E.07421
N8189 G1 X181.107 Y127.385 E2.42708
N8190 G1 X178.089 Y127.385 E.09706
N8191 G1 X190.736 Y140.031 E.57511
N8192 G1 X190.736 Y137.995 E.06548
N8193 G1 X159.264 Y146.428 E1.0477
N8194 G1 X159.264 Y145.99 E.01408
N8195 G1 X164.25 Y127.385 E.61938
N8196 G1 X162.621 Y127.385 E.05236
N8197 M204 S10000
N8198 G1 X166.575 Y127.385 F60000
N8199 G1 F4421.739
N8200 M204 S8000
N8201 G1 X190.736 Y151.545 E1.09872
N8202 G1 X190.736 Y154.365 E.09067
N8203 G1 X178.43 Y200.29 E1.52889
N8204 G1 X190.736 Y196.997 E.40964
N8205 G1 X190.736 Y197.601 E.01943
N8206 G1 X159.264 Y166.13 E1.43118
N8207 G1 X159.264 Y163.285 E.09147
N8208 G1 X190.736 Y154.853 E1.0477
N8209 M204 S10000
N8210 G1 X190.736 Y144.796 F60000
N8211 G1 F4421.739
N8212 M204 S8000
N8213 G1 X190.736 Y146.424 E.05236
N8214 G1 X159.264 Y154.856 E1.0477
N8215 G1 X159.264 Y154.616 E.00774
N8216 G1 X190.736 Y186.087 E1.43118
N8217 G1 X190.736 Y185.821 E.00854
N8218 G1 X186.859 Y200.29 E.48168
N8219 G1 X181.911 Y200.29 E.1591
N8220 G1 X159.264 Y177.644 E1.02987
N8221 G1 X159.264 Y177.446 E.00635
N8222 G1 X172.678 Y127.385 E1.66659
N8223 G1 X167.421 Y127.385 E.16908
N8224 G1 X159.264 Y129.57 E.27152
N8225 G1 X159.264 Y131.588 E.06489
N8226 G1 X190.736 Y163.059 E1.43118
N8227 G1 X190.736 Y163.281 E.00715
N8228 G1 X159.264 Y171.714 E1.04769
N8229 G1 X159.264 Y170.086 E.05236
N8230 M204 S10000
N8231 G1 X159.264 Y181.771 F60000
N8232 G1 F4421.739
N8233 M204 S8000
N8234 G1 X159.264 Y180.143 E.05236
N8235 G1 X190.736 Y171.71 E1.0477
N8236 G1 X190.736 Y174.573 E.09206
N8237 G1 X159.264 Y143.102 E1.43118
N8238 G1 X159.264 Y137.999 E.1641
N8239 G1 X190.736 Y129.566 E1.0477
N8240 G1 X190.736 Y128.517 E.03373
N8241 G1 X189.603 Y127.385 E.0515
N8242 G1 X189.536 Y127.385 E.00215
N8243 G1 X170.001 Y200.29 E2.42708
N8244 G1 X170.397 Y200.29 E.01273
N8245 G1 X159.264 Y189.158 E.50626
N8246 G1 X159.264 Y188.572 E.01885
N8247 G1 X190.736 Y180.139 E1.0477
N8248 G1 X190.736 Y181.767 E.05236
N8249 ; WIPE_START
N8250 G1 X190.736 Y180.139 E-.61876
N8251 G1 X190.377 Y180.235 E-.14124
N8252 ; WIPE_END
N8253 M73 P58 R22
N8254 G1 E-.04 F1800
N8255 M204 S10000
N8256 G17
N8257 G3 Z5.4 I1.217 J0 P1  F60000
N8258 ; stop printing object, unique label id: 229
N8259 M625
N8260 ; object ids of layer 25 start: 229
N8261 M624 AQAAAAAAAAA=
N8262 ;======== H2D 20250527========
N8263 ; SKIPPABLE_START
N8264 ; SKIPTYPE: timelapse
N8265 M622.1 S1 ; for prev firware, default turned on
N8266 
N8267 M1002 judge_flag timelapse_record_flag
N8268 
N8269 M622 J1
N8270 M993 A2 B2 C2
N8271 M993 A0 B0 C0
N8272 
N8273 
N8274 
N8275 
N8276     M9711 M0 E1 X260 Y141 Z5.4 S11 C10 O0 T3000
N8277 
N8278 
N8279 
N8280 M993 A3 B3 C3
N8281 
N8282 M623
N8283 ; SKIPPABLE_END
N8284 
N8285 ; object ids of this layer25 end: 229
N8286 M625
N8287 ; CHANGE_LAYER
N8288 ; Z_HEIGHT: 5.2
N8289 ; LAYER_HEIGHT: 0.2
N8290 ;======== H2D 20250521========
N8291 ; layer num/total_layer_count: 26/63
N8292 ; update layer progress
N8293 M73 L26
N8294 M991 S0 P25 ;notify layer change
N8295 
N8296 
N8297 M106 S48.45
N8298 ; OBJECT_ID: 229
N8299 ; COOLING_NODE: 0
N8300 ; start printing object, unique label id: 229
N8301 M624 AQAAAAAAAAA=
N8302 G1 X191.084 Y200.639 F60000
N8303 G1 Z5.2
N8304 G1 E.8 F1800
N8305 ; FEATURE: Inner wall
N8306 ; LINE_WIDTH: 0.45
N8307 ; LAYER_HEIGHT: 0.2
N8308 G1 F4421.739
N8309 M204 S8000
N8310 G1 X158.916 Y200.639 E1.03439
N8311 G1 X158.916 Y127.036 E2.36678
N8312 G1 X191.084 Y127.036 E1.03439
N8313 G1 X191.084 Y200.579 E2.36485
N8314 ; COOLING_NODE: 0
N8315 M204 S10000
N8316 G1 X191.491 Y201.046 F60000
N8317 G1 F4421.739
N8318 M204 S8000
N8319 G1 X158.509 Y201.046 E1.06057
N8320 G1 X158.509 Y126.629 E2.39296
N8321 G1 X191.491 Y126.629 E1.06057
N8322 G1 X191.491 Y200.986 E2.39103
N8323 ; COOLING_NODE: 0
N8324 M204 S10000
N8325 G1 X191.898 Y201.453 F60000
N8326 G1 F4421.739
N8327 M204 S8000
N8328 G1 X158.102 Y201.453 E1.08675
N8329 G1 X158.102 Y126.222 E2.41914
N8330 G1 X191.898 Y126.222 E1.08675
N8331 G1 X191.898 Y201.393 E2.41721
N8332 ; COOLING_NODE: 0
N8333 M204 S10000
N8334 G1 X192.29 Y201.845 F60000
N8335 ; FEATURE: Outer wall
N8336 ; LINE_WIDTH: 0.42
N8337 G1 F4773.528
N8338 M204 S5000
N8339 G1 X157.71 Y201.845 E1.03002
N8340 G1 X157.71 Y125.83 E2.26421
N8341 G1 X192.29 Y125.83 E1.03002
N8342 G1 X192.29 Y201.785 E2.26243
N8343 G1 E-.8 F1800
N8344 M204 S10000
N8345 G1 X191.263 Y194.222 Z5.6 F60000
N8346 G1 X190.736 Y190.343 Z5.6
N8347 G1 Z5.2
N8348 G1 E.8 F1800
N8349 ; FEATURE: Sparse infill
N8350 ; LINE_WIDTH: 0.45
N8351 G1 F4421.739
N8352 M204 S8000
N8353 G1 X190.736 Y188.714 E.05236
N8354 G1 X159.264 Y197.147 E1.04769
N8355 G1 X159.264 Y200.29 E.10108
N8356 G1 X161.426 Y200.29 E.0695
N8357 G1 X180.961 Y127.385 E2.42708
N8358 G1 X178.289 Y127.385 E.08592
N8359 G1 X190.736 Y139.831 E.56602
N8360 G1 X190.736 Y138.141 E.05434
N8361 G1 X159.264 Y146.574 E1.0477
N8362 G1 X159.264 Y145.443 E.03636
N8363 G1 X164.103 Y127.385 E.60118
N8364 G1 X162.475 Y127.385 E.05236
N8365 M204 S10000
N8366 G1 X166.775 Y127.385 F60000
N8367 G1 F4421.739
N8368 M204 S8000
N8369 G1 X190.736 Y151.345 E1.08963
N8370 G1 X190.736 Y153.818 E.07953
N8371 G1 X178.283 Y200.29 E1.54708
N8372 G1 X178.99 Y200.29 E.02271
N8373 G1 X190.736 Y197.143 E.39103
N8374 G1 X190.736 Y197.401 E.00829
N8375 G1 X159.264 Y165.93 E1.43118
N8376 G1 X159.264 Y163.432 E.08033
N8377 G1 X190.736 Y154.999 E1.0477
N8378 M204 S10000
N8379 G1 X190.736 Y144.942 F60000
N8380 G1 F4421.739
N8381 M204 S8000
N8382 G1 X190.736 Y146.57 E.05236
N8383 G1 X159.264 Y155.003 E1.04769
N8384 G1 X159.264 Y154.416 E.01888
N8385 G1 X190.736 Y185.887 E1.43118
N8386 M204 S10000
N8387 G1 X159.264 Y181.918 F60000
N8388 G1 F4421.739
N8389 M204 S8000
N8390 G1 X159.264 Y180.289 E.05236
N8391 G1 X190.736 Y171.857 E1.0477
N8392 G1 X190.736 Y174.373 E.08092
N8393 G1 X159.264 Y142.902 E1.43118
N8394 G1 X159.264 Y138.145 E.15296
N8395 G1 X190.736 Y129.713 E1.0477
N8396 G1 X190.736 Y128.317 E.04487
N8397 G1 X189.803 Y127.385 E.04241
N8398 G1 X189.39 Y127.385 E.01329
N8399 G1 X169.855 Y200.29 E2.42708
N8400 G1 X170.597 Y200.29 E.02387
N8401 G1 X159.264 Y188.958 E.51536
N8402 G1 X159.264 Y188.718 E.00771
N8403 G1 X190.736 Y180.285 E1.0477
N8404 G1 X190.736 Y185.275 E.16045
N8405 G1 X186.712 Y200.29 E.49987
N8406 G1 X182.111 Y200.29 E.14796
N8407 G1 X159.264 Y177.444 E1.03897
N8408 G1 X159.264 Y176.9 E.01749
N8409 G1 X172.532 Y127.385 E1.6484
N8410 G1 X167.967 Y127.385 E.1468
N8411 G1 X159.264 Y129.716 E.28971
N8412 G1 X159.264 Y131.388 E.05375
N8413 G1 X190.736 Y162.859 E1.43118
N8414 G1 X190.736 Y163.428 E.01829
N8415 G1 X159.264 Y171.86 E1.0477
N8416 G1 X159.264 Y170.232 E.05236
N8417 ; WIPE_START
N8418 G1 X159.264 Y171.86 E-.61876
N8419 G1 X159.623 Y171.764 E-.14124
N8420 ; WIPE_END
N8421 G1 E-.04 F1800
N8422 M204 S10000
N8423 G17
N8424 G3 Z5.6 I1.217 J0 P1  F60000
N8425 ; stop printing object, unique label id: 229
N8426 M625
N8427 ; object ids of layer 26 start: 229
N8428 M624 AQAAAAAAAAA=
N8429 ;======== H2D 20250527========
N8430 ; SKIPPABLE_START
N8431 ; SKIPTYPE: timelapse
N8432 M622.1 S1 ; for prev firware, default turned on
N8433 
N8434 M1002 judge_flag timelapse_record_flag
N8435 
N8436 M622 J1
N8437 M993 A2 B2 C2
N8438 M993 A0 B0 C0
N8439 
N8440 
N8441 
N8442 
N8443     M9711 M0 E1 X260 Y141 Z5.6 S11 C10 O0 T3000
N8444 
N8445 
N8446 
N8447 M993 A3 B3 C3
N8448 
N8449 M623
N8450 ; SKIPPABLE_END
N8451 
N8452 ; object ids of this layer26 end: 229
N8453 M625
N8454 ; CHANGE_LAYER
N8455 ; Z_HEIGHT: 5.4
N8456 ; LAYER_HEIGHT: 0.2
N8457 ;======== H2D 20250521========
N8458 ; layer num/total_layer_count: 27/63
N8459 ; update layer progress
N8460 M73 L27
N8461 M991 S0 P26 ;notify layer change
N8462 
N8463 
N8464 ; OBJECT_ID: 229
N8465 ; COOLING_NODE: 0
N8466 ; start printing object, unique label id: 229
N8467 M624 AQAAAAAAAAA=
N8468 G1 X191.084 Y200.639 F60000
N8469 G1 Z5.4
N8470 G1 E.8 F1800
N8471 ; FEATURE: Inner wall
N8472 ; LINE_WIDTH: 0.45
N8473 ; LAYER_HEIGHT: 0.2
N8474 G1 F4421.739
N8475 M204 S8000
N8476 G1 X158.916 Y200.639 E1.03439
N8477 G1 X158.916 Y127.036 E2.36678
N8478 G1 X191.084 Y127.036 E1.03439
N8479 G1 X191.084 Y200.579 E2.36485
N8480 ; COOLING_NODE: 0
N8481 M204 S10000
N8482 G1 X191.491 Y201.046 F60000
N8483 G1 F4421.739
N8484 M204 S8000
N8485 G1 X158.509 Y201.046 E1.06057
N8486 M73 P58 R21
N8487 G1 X158.509 Y126.629 E2.39296
N8488 G1 X191.491 Y126.629 E1.06057
N8489 G1 X191.491 Y200.986 E2.39103
N8490 ; COOLING_NODE: 0
N8491 M204 S10000
N8492 G1 X191.898 Y201.453 F60000
N8493 G1 F4421.739
N8494 M204 S8000
N8495 G1 X158.102 Y201.453 E1.08675
N8496 G1 X158.102 Y126.222 E2.41914
N8497 G1 X191.898 Y126.222 E1.08675
N8498 G1 X191.898 Y201.393 E2.41721
N8499 ; COOLING_NODE: 0
N8500 M204 S10000
N8501 G1 X192.29 Y201.845 F60000
N8502 ; FEATURE: Outer wall
N8503 ; LINE_WIDTH: 0.42
N8504 M73 P59 R21
N8505 G1 F4773.528
N8506 M204 S5000
N8507 G1 X157.71 Y201.845 E1.03002
N8508 G1 X157.71 Y125.83 E2.26421
N8509 G1 X192.29 Y125.83 E1.03002
N8510 G1 X192.29 Y201.785 E2.26243
N8511 G1 E-.8 F1800
N8512 M204 S10000
N8513 G1 X191.249 Y194.224 Z5.8 F60000
N8514 G1 X190.736 Y190.489 Z5.8
N8515 G1 Z5.4
N8516 G1 E.8 F1800
N8517 ; FEATURE: Sparse infill
N8518 ; LINE_WIDTH: 0.45
N8519 G1 F4421.739
N8520 M204 S8000
N8521 G1 X190.736 Y188.861 E.05236
N8522 G1 X159.264 Y197.293 E1.0477
N8523 G1 X159.264 Y200.29 E.09637
N8524 G1 X161.279 Y200.29 E.06479
N8525 G1 X180.814 Y127.385 E2.42708
N8526 G1 X178.489 Y127.385 E.07478
N8527 G1 X190.736 Y139.631 E.55692
N8528 G1 X190.736 Y138.288 E.0432
N8529 G1 X159.264 Y146.72 E1.0477
N8530 G1 X159.264 Y144.897 E.05864
N8531 G1 X163.957 Y127.385 E.58299
N8532 G1 X166.975 Y127.385 E.09705
N8533 G1 X190.736 Y151.145 E1.08053
N8534 G1 X190.736 Y153.272 E.06839
N8535 G1 X178.137 Y200.29 E1.56527
N8536 G1 X179.536 Y200.29 E.04499
N8537 G1 X190.736 Y197.289 E.37284
N8538 G1 X190.736 Y197.201 E.00284
N8539 G1 X159.264 Y165.73 E1.43118
N8540 G1 X159.264 Y163.578 E.06919
N8541 G1 X190.736 Y155.145 E1.0477
N8542 G1 X190.736 Y156.774 E.05236
N8543 M204 S10000
N8544 G1 X190.736 Y145.088 F60000
N8545 G1 F4421.739
N8546 M204 S8000
N8547 G1 X190.736 Y146.717 E.05236
N8548 G1 X159.264 Y155.149 E1.0477
N8549 G1 X159.264 Y154.216 E.03001
N8550 G1 X190.736 Y185.687 E1.43118
N8551 M204 S10000
N8552 G1 X159.264 Y182.064 F60000
N8553 G1 F4421.739
N8554 M204 S8000
N8555 G1 X159.264 Y180.436 E.05236
N8556 G1 X190.736 Y172.003 E1.0477
N8557 G1 X190.736 Y174.173 E.06978
N8558 G1 X159.264 Y142.702 E1.43118
N8559 G1 X159.264 Y138.292 E.14182
N8560 G1 X190.736 Y129.859 E1.0477
N8561 G1 X190.736 Y128.117 E.05601
N8562 G1 X190.003 Y127.385 E.03331
N8563 G1 X189.243 Y127.385 E.02443
N8564 G1 X169.708 Y200.29 E2.42708
N8565 G1 X170.797 Y200.29 E.03501
N8566 G1 X159.264 Y188.758 E.52445
N8567 G1 X159.264 Y188.864 E.00343
N8568 G1 X190.736 Y180.432 E1.0477
N8569 G1 X190.736 Y184.729 E.13817
N8570 G1 X186.566 Y200.29 E.51806
N8571 G1 X182.311 Y200.29 E.13682
N8572 G1 X159.264 Y177.244 E1.04806
N8573 G1 X159.264 Y176.354 E.02863
N8574 G1 X172.386 Y127.385 E1.63021
N8575 G1 X168.513 Y127.385 E.12452
N8576 G1 X159.264 Y129.863 E.3079
N8577 G1 X159.264 Y131.188 E.04261
N8578 G1 X190.736 Y162.659 E1.43118
N8579 G1 X190.736 Y163.574 E.02943
N8580 G1 X159.264 Y172.007 E1.0477
N8581 G1 X159.264 Y170.379 E.05236
N8582 ; WIPE_START
N8583 G1 X159.264 Y172.007 E-.61876
N8584 G1 X159.623 Y171.911 E-.14124
N8585 ; WIPE_END
N8586 G1 E-.04 F1800
N8587 M204 S10000
N8588 G17
N8589 G3 Z5.8 I1.217 J0 P1  F60000
N8590 ; stop printing object, unique label id: 229
N8591 M625
N8592 ; object ids of layer 27 start: 229
N8593 M624 AQAAAAAAAAA=
N8594 ;======== H2D 20250527========
N8595 ; SKIPPABLE_START
N8596 ; SKIPTYPE: timelapse
N8597 M622.1 S1 ; for prev firware, default turned on
N8598 
N8599 M1002 judge_flag timelapse_record_flag
N8600 
N8601 M622 J1
N8602 M993 A2 B2 C2
N8603 M993 A0 B0 C0
N8604 
N8605 
N8606 
N8607 
N8608     M9711 M0 E1 X260 Y141 Z5.8 S11 C10 O0 T3000
N8609 
N8610 
N8611 
N8612 M993 A3 B3 C3
N8613 
N8614 M623
N8615 ; SKIPPABLE_END
N8616 
N8617 ; object ids of this layer27 end: 229
N8618 M625
N8619 ; CHANGE_LAYER
N8620 ; Z_HEIGHT: 5.6
N8621 ; LAYER_HEIGHT: 0.2
N8622 ;======== H2D 20250521========
N8623 ; layer num/total_layer_count: 28/63
N8624 ; update layer progress
N8625 M73 L28
N8626 M991 S0 P27 ;notify layer change
N8627 
N8628 
N8629 ; OBJECT_ID: 229
N8630 ; COOLING_NODE: 0
N8631 ; start printing object, unique label id: 229
N8632 M624 AQAAAAAAAAA=
N8633 G1 X191.084 Y200.639 F60000
N8634 G1 Z5.6
N8635 G1 E.8 F1800
N8636 ; FEATURE: Inner wall
N8637 ; LINE_WIDTH: 0.45
N8638 ; LAYER_HEIGHT: 0.2
N8639 G1 F4421.739
N8640 M204 S8000
N8641 G1 X158.916 Y200.639 E1.03439
N8642 G1 X158.916 Y127.036 E2.36678
N8643 G1 X191.084 Y127.036 E1.03439
N8644 G1 X191.084 Y200.579 E2.36485
N8645 ; COOLING_NODE: 0
N8646 M204 S10000
N8647 G1 X191.491 Y201.046 F60000
N8648 G1 F4421.739
N8649 M204 S8000
N8650 G1 X158.509 Y201.046 E1.06057
N8651 G1 X158.509 Y126.629 E2.39296
N8652 G1 X191.491 Y126.629 E1.06057
N8653 G1 X191.491 Y200.986 E2.39103
N8654 ; COOLING_NODE: 0
N8655 M204 S10000
N8656 G1 X191.898 Y201.453 F60000
N8657 G1 F4421.739
N8658 M204 S8000
N8659 G1 X158.102 Y201.453 E1.08675
N8660 G1 X158.102 Y126.222 E2.41914
N8661 G1 X191.898 Y126.222 E1.08675
N8662 G1 X191.898 Y201.393 E2.41721
N8663 ; COOLING_NODE: 0
N8664 M204 S10000
N8665 G1 X192.29 Y201.845 F60000
N8666 ; FEATURE: Outer wall
N8667 ; LINE_WIDTH: 0.42
N8668 G1 F4773.528
N8669 M204 S5000
N8670 G1 X157.71 Y201.845 E1.03002
N8671 G1 X157.71 Y125.83 E2.26421
N8672 G1 X192.29 Y125.83 E1.03002
N8673 G1 X192.29 Y201.785 E2.26243
N8674 G1 E-.8 F1800
N8675 M204 S10000
N8676 G1 X185.724 Y197.893 Z6 F60000
N8677 G1 X159.264 Y182.21 Z6
N8678 G1 Z5.6
N8679 G1 E.8 F1800
N8680 ; FEATURE: Sparse infill
N8681 ; LINE_WIDTH: 0.45
N8682 G1 F4421.739
N8683 M204 S8000
N8684 G1 X159.264 Y180.582 E.05236
N8685 G1 X190.736 Y172.149 E1.0477
N8686 G1 X190.736 Y173.973 E.05864
N8687 G1 X159.264 Y142.502 E1.43118
N8688 G1 X159.264 Y138.438 E.13068
N8689 G1 X190.736 Y130.005 E1.0477
N8690 G1 X190.736 Y127.917 E.06715
N8691 G1 X190.203 Y127.385 E.02422
N8692 G1 X189.097 Y127.385 E.03557
N8693 G1 X169.562 Y200.29 E2.42708
N8694 G1 X170.997 Y200.29 E.04615
N8695 G1 X159.264 Y188.558 E.53355
N8696 G1 X159.264 Y189.011 E.01457
N8697 M73 P60 R21
N8698 G1 X190.736 Y180.578 E1.0477
N8699 G1 X190.736 Y184.182 E.11589
N8700 G1 X186.419 Y200.29 E.53625
N8701 G1 X182.511 Y200.29 E.12568
N8702 G1 X159.264 Y177.044 E1.05716
N8703 G1 X159.264 Y175.807 E.03977
N8704 G1 X172.239 Y127.385 E1.61202
N8705 G1 X169.06 Y127.385 E.10224
N8706 G1 X159.264 Y130.009 E.32609
N8707 G1 X159.264 Y130.988 E.03147
N8708 G1 X190.736 Y162.459 E1.43118
N8709 G1 X190.736 Y163.721 E.04057
N8710 G1 X159.264 Y172.153 E1.0477
N8711 G1 X159.264 Y170.525 E.05236
N8712 M204 S10000
N8713 G1 X190.736 Y156.92 F60000
N8714 G1 F4421.739
N8715 M204 S8000
N8716 G1 X190.736 Y155.292 E.05236
N8717 G1 X159.264 Y163.724 E1.0477
N8718 G1 X159.264 Y165.53 E.05805
N8719 G1 X190.736 Y197.001 E1.43118
N8720 G1 X190.736 Y197.436 E.01398
N8721 G1 X180.082 Y200.29 E.35465
N8722 G1 X177.991 Y200.29 E.06727
N8723 G1 X190.736 Y152.726 E1.58346
N8724 G1 X190.736 Y150.945 E.05725
N8725 G1 X167.175 Y127.385 E1.07144
N8726 G1 X163.81 Y127.385 E.10819
N8727 G1 X159.264 Y144.351 E.5648
N8728 G1 X159.264 Y146.867 E.08092
N8729 G1 X190.736 Y138.434 E1.0477
N8730 G1 X190.736 Y139.431 E.03206
N8731 G1 X178.689 Y127.385 E.54783
N8732 G1 X180.668 Y127.385 E.06364
N8733 G1 X161.133 Y200.29 E2.42708
N8734 G1 X159.483 Y200.29 E.05306
N8735 G1 X159.264 Y200.072 E.00994
N8736 G1 X159.264 Y197.44 E.08464
N8737 G1 X190.736 Y189.007 E1.0477
N8738 G1 X190.736 Y185.487 E.11319
N8739 G1 X159.264 Y154.016 E1.43118
N8740 G1 X159.264 Y155.296 E.04115
N8741 G1 X190.736 Y146.863 E1.0477
N8742 G1 X190.736 Y145.235 E.05236
N8743 ; WIPE_START
N8744 G1 X190.736 Y146.863 E-.61876
N8745 G1 X190.377 Y146.959 E-.14124
N8746 ; WIPE_END
N8747 G1 E-.04 F1800
N8748 M204 S10000
N8749 G17
N8750 G3 Z6 I1.217 J0 P1  F60000
N8751 ; stop printing object, unique label id: 229
N8752 M625
N8753 ; object ids of layer 28 start: 229
N8754 M624 AQAAAAAAAAA=
N8755 ;======== H2D 20250527========
N8756 ; SKIPPABLE_START
N8757 ; SKIPTYPE: timelapse
N8758 M622.1 S1 ; for prev firware, default turned on
N8759 
N8760 M1002 judge_flag timelapse_record_flag
N8761 
N8762 M622 J1
N8763 M993 A2 B2 C2
N8764 M993 A0 B0 C0
N8765 
N8766 
N8767 
N8768 
N8769     M9711 M0 E1 X260 Y141 Z6 S11 C10 O0 T3000
N8770 
N8771 
N8772 
N8773 M993 A3 B3 C3
N8774 
N8775 M623
N8776 ; SKIPPABLE_END
N8777 
N8778 ; object ids of this layer28 end: 229
N8779 M625
N8780 ; CHANGE_LAYER
N8781 ; Z_HEIGHT: 5.8
N8782 ; LAYER_HEIGHT: 0.2
N8783 ;======== H2D 20250521========
N8784 ; layer num/total_layer_count: 29/63
N8785 ; update layer progress
N8786 M73 L29
N8787 M991 S0 P28 ;notify layer change
N8788 
N8789 
N8790 ; OBJECT_ID: 229
N8791 ; COOLING_NODE: 0
N8792 ; start printing object, unique label id: 229
N8793 M624 AQAAAAAAAAA=
N8794 G1 X191.084 Y200.639 F60000
N8795 G1 Z5.8
N8796 G1 E.8 F1800
N8797 ; FEATURE: Inner wall
N8798 ; LINE_WIDTH: 0.45
N8799 ; LAYER_HEIGHT: 0.2
N8800 G1 F4421.739
N8801 M204 S8000
N8802 G1 X158.916 Y200.639 E1.03439
N8803 G1 X158.916 Y127.036 E2.36678
N8804 G1 X191.084 Y127.036 E1.03439
N8805 G1 X191.084 Y200.579 E2.36485
N8806 ; COOLING_NODE: 0
N8807 M204 S10000
N8808 G1 X191.491 Y201.046 F60000
N8809 G1 F4421.739
N8810 M204 S8000
N8811 G1 X158.509 Y201.046 E1.06057
N8812 G1 X158.509 Y126.629 E2.39296
N8813 G1 X191.491 Y126.629 E1.06057
N8814 G1 X191.491 Y200.986 E2.39103
N8815 ; COOLING_NODE: 0
N8816 M204 S10000
N8817 G1 X191.898 Y201.453 F60000
N8818 G1 F4421.739
N8819 M204 S8000
N8820 G1 X158.102 Y201.453 E1.08675
N8821 G1 X158.102 Y126.222 E2.41914
N8822 G1 X191.898 Y126.222 E1.08675
N8823 G1 X191.898 Y201.393 E2.41721
N8824 ; COOLING_NODE: 0
N8825 M204 S10000
N8826 G1 X192.29 Y201.845 F60000
N8827 ; FEATURE: Outer wall
N8828 ; LINE_WIDTH: 0.42
N8829 G1 F4773.528
N8830 M204 S5000
N8831 G1 X157.71 Y201.845 E1.03002
N8832 G1 X157.71 Y125.83 E2.26421
N8833 G1 X192.29 Y125.83 E1.03002
N8834 G1 X192.29 Y201.785 E2.26243
N8835 G1 E-.8 F1800
N8836 M204 S10000
N8837 G1 X185.711 Y197.915 Z6.2 F60000
N8838 G1 X159.264 Y182.357 Z6.2
N8839 G1 Z5.8
N8840 G1 E.8 F1800
N8841 ; FEATURE: Sparse infill
N8842 ; LINE_WIDTH: 0.45
N8843 G1 F4421.739
N8844 M204 S8000
N8845 G1 X159.264 Y180.728 E.05236
N8846 G1 X190.736 Y172.296 E1.04769
N8847 G1 X190.736 Y173.773 E.0475
N8848 G1 X159.264 Y142.302 E1.43118
N8849 G1 X159.264 Y138.585 E.11954
N8850 M73 P60 R20
N8851 G1 X190.736 Y130.152 E1.0477
N8852 G1 X190.736 Y127.717 E.07829
N8853 G1 X190.403 Y127.385 E.01512
N8854 G1 X188.95 Y127.385 E.04671
N8855 G1 X169.415 Y200.29 E2.42708
N8856 G1 X171.197 Y200.29 E.05729
N8857 G1 X159.264 Y188.358 E.54264
N8858 G1 X159.264 Y189.157 E.02571
N8859 G1 X190.736 Y180.725 E1.0477
N8860 G1 X190.736 Y183.636 E.09361
N8861 G1 X186.273 Y200.29 E.55444
N8862 G1 X182.711 Y200.29 E.11454
N8863 G1 X159.264 Y176.844 E1.06625
N8864 G1 X159.264 Y175.261 E.0509
N8865 G1 X172.093 Y127.385 E1.59383
N8866 G1 X169.606 Y127.385 E.07996
N8867 G1 X159.264 Y130.156 E.34428
N8868 G1 X159.264 Y130.788 E.02033
N8869 G1 X190.736 Y162.259 E1.43118
N8870 G1 X190.736 Y163.867 E.05171
N8871 G1 X159.264 Y172.3 E1.0477
N8872 G1 X159.264 Y170.671 E.05236
N8873 M204 S10000
N8874 G1 X190.736 Y157.067 F60000
N8875 G1 F4421.739
N8876 M204 S8000
N8877 G1 X190.736 Y155.438 E.05236
N8878 G1 X159.264 Y163.871 E1.04769
N8879 G1 X159.264 Y165.33 E.04691
N8880 G1 X190.736 Y196.801 E1.43118
N8881 G1 X190.736 Y197.582 E.02512
N8882 G1 X180.629 Y200.29 E.33646
N8883 G1 X177.844 Y200.29 E.08955
N8884 G1 X190.736 Y152.179 E1.60165
N8885 G1 X190.736 Y150.745 E.04611
N8886 G1 X167.375 Y127.385 E1.06234
N8887 G1 X163.664 Y127.385 E.11933
N8888 G1 X159.264 Y143.804 E.54661
N8889 G1 X159.264 Y147.013 E.1032
N8890 G1 X190.736 Y138.581 E1.0477
N8891 G1 X190.736 Y139.231 E.02092
N8892 M73 P61 R20
N8893 G1 X178.889 Y127.385 E.53873
N8894 G1 X180.522 Y127.385 E.0525
N8895 G1 X160.987 Y200.29 E2.42708
N8896 G1 X159.683 Y200.29 E.04192
N8897 G1 X159.264 Y199.872 E.01904
N8898 G1 X159.264 Y197.586 E.0735
N8899 G1 X190.736 Y189.153 E1.0477
N8900 G1 X190.736 Y185.287 E.12433
N8901 G1 X159.264 Y153.816 E1.43118
N8902 G1 X159.264 Y155.442 E.05229
N8903 G1 X190.736 Y147.009 E1.0477
N8904 G1 X190.736 Y145.381 E.05236
N8905 ; WIPE_START
N8906 G1 X190.736 Y147.009 E-.61876
N8907 G1 X190.377 Y147.106 E-.14124
N8908 ; WIPE_END
N8909 G1 E-.04 F1800
N8910 M204 S10000
N8911 G17
N8912 G3 Z6.2 I1.217 J0 P1  F60000
N8913 ; stop printing object, unique label id: 229
N8914 M625
N8915 ; object ids of layer 29 start: 229
N8916 M624 AQAAAAAAAAA=
N8917 ;======== H2D 20250527========
N8918 ; SKIPPABLE_START
N8919 ; SKIPTYPE: timelapse
N8920 M622.1 S1 ; for prev firware, default turned on
N8921 
N8922 M1002 judge_flag timelapse_record_flag
N8923 
N8924 M622 J1
N8925 M993 A2 B2 C2
N8926 M993 A0 B0 C0
N8927 
N8928 
N8929 
N8930 
N8931     M9711 M0 E1 X260 Y141 Z6.2 S11 C10 O0 T3000
N8932 
N8933 
N8934 
N8935 M993 A3 B3 C3
N8936 
N8937 M623
N8938 ; SKIPPABLE_END
N8939 
N8940 ; object ids of this layer29 end: 229
N8941 M625
N8942 ; CHANGE_LAYER
N8943 ; Z_HEIGHT: 6
N8944 ; LAYER_HEIGHT: 0.2
N8945 ;======== H2D 20250521========
N8946 ; layer num/total_layer_count: 30/63
N8947 ; update layer progress
N8948 M73 L30
N8949 M991 S0 P29 ;notify layer change
N8950 
N8951 
N8952 ; OBJECT_ID: 229
N8953 ; COOLING_NODE: 0
N8954 ; start printing object, unique label id: 229
N8955 M624 AQAAAAAAAAA=
N8956 G1 X191.084 Y200.639 F60000
N8957 G1 Z6
N8958 G1 E.8 F1800
N8959 ; FEATURE: Inner wall
N8960 ; LINE_WIDTH: 0.45
N8961 ; LAYER_HEIGHT: 0.2
N8962 G1 F4421.739
N8963 M204 S8000
N8964 G1 X158.916 Y200.639 E1.03439
N8965 G1 X158.916 Y127.036 E2.36678
N8966 G1 X191.084 Y127.036 E1.03439
N8967 G1 X191.084 Y200.579 E2.36485
N8968 ; COOLING_NODE: 0
N8969 M204 S10000
N8970 G1 X191.491 Y201.046 F60000
N8971 G1 F4421.739
N8972 M204 S8000
N8973 G1 X158.509 Y201.046 E1.06057
N8974 G1 X158.509 Y126.629 E2.39296
N8975 G1 X191.491 Y126.629 E1.06057
N8976 G1 X191.491 Y200.986 E2.39103
N8977 ; COOLING_NODE: 0
N8978 M204 S10000
N8979 G1 X191.898 Y201.453 F60000
N8980 G1 F4421.739
N8981 M204 S8000
N8982 G1 X158.102 Y201.453 E1.08675
N8983 G1 X158.102 Y126.222 E2.41914
N8984 G1 X191.898 Y126.222 E1.08675
N8985 G1 X191.898 Y201.393 E2.41721
N8986 ; COOLING_NODE: 0
N8987 M204 S10000
N8988 G1 X192.29 Y201.845 F60000
N8989 ; FEATURE: Outer wall
N8990 ; LINE_WIDTH: 0.42
N8991 G1 F4773.528
N8992 M204 S5000
N8993 G1 X157.71 Y201.845 E1.03002
N8994 G1 X157.71 Y125.83 E2.26421
N8995 G1 X192.29 Y125.83 E1.03002
N8996 G1 X192.29 Y201.785 E2.26243
N8997 G1 E-.8 F1800
N8998 M204 S10000
N8999 G1 X185.699 Y197.937 Z6.4 F60000
N9000 G1 X159.264 Y182.503 Z6.4
N9001 G1 Z6
N9002 G1 E.8 F1800
N9003 ; FEATURE: Sparse infill
N9004 ; LINE_WIDTH: 0.45
N9005 G1 F4421.739
N9006 M204 S8000
N9007 G1 X159.264 Y180.875 E.05236
N9008 G1 X190.736 Y172.442 E1.0477
N9009 G1 X190.736 Y173.573 E.03636
N9010 G1 X159.264 Y142.102 E1.43118
N9011 M204 S10000
N9012 G1 X159.264 Y137.103 F60000
N9013 G1 F4421.739
N9014 M204 S8000
N9015 G1 X159.264 Y138.731 E.05236
N9016 G1 X190.736 Y130.298 E1.04769
N9017 G1 X190.736 Y127.385 E.09369
N9018 G1 X188.804 Y127.385 E.06211
N9019 G1 X169.269 Y200.29 E2.42708
N9020 G1 X171.397 Y200.29 E.06843
N9021 G1 X159.264 Y188.158 E.55174
N9022 G1 X159.264 Y189.304 E.03685
N9023 G1 X190.736 Y180.871 E1.0477
N9024 G1 X190.736 Y183.089 E.07133
N9025 G1 X186.127 Y200.29 E.57263
N9026 G1 X182.911 Y200.29 E.1034
N9027 G1 X159.264 Y176.644 E1.07535
N9028 G1 X159.264 Y174.714 E.06204
N9029 G1 X171.946 Y127.385 E1.57564
N9030 G1 X170.153 Y127.385 E.05768
N9031 G1 X159.264 Y130.302 E.36247
N9032 G1 X159.264 Y130.588 E.00919
N9033 G1 X190.736 Y162.059 E1.43118
N9034 G1 X190.736 Y164.013 E.06285
N9035 G1 X159.264 Y172.446 E1.0477
N9036 G1 X159.264 Y170.818 E.05236
N9037 M204 S10000
N9038 G1 X190.736 Y157.213 F60000
N9039 G1 F4421.739
N9040 M204 S8000
N9041 G1 X190.736 Y155.585 E.05236
N9042 G1 X159.264 Y164.017 E1.04769
N9043 G1 X159.264 Y165.13 E.03577
N9044 G1 X190.736 Y196.601 E1.43118
N9045 G1 X190.736 Y197.729 E.03626
N9046 G1 X181.175 Y200.29 E.31827
N9047 G1 X177.698 Y200.29 E.11183
N9048 G1 X190.736 Y151.633 E1.61985
N9049 G1 X190.736 Y150.545 E.03497
N9050 G1 X167.575 Y127.385 E1.05324
N9051 G1 X163.518 Y127.385 E.13047
N9052 G1 X159.264 Y143.258 E.52842
N9053 G1 X159.264 Y147.16 E.12548
N9054 G1 X190.736 Y138.727 E1.0477
N9055 G1 X190.736 Y139.031 E.00978
N9056 G1 X179.089 Y127.385 E.52964
N9057 G1 X180.375 Y127.385 E.04136
N9058 G1 X160.84 Y200.29 E2.42708
N9059 G1 X159.883 Y200.29 E.03078
N9060 G1 X159.264 Y199.672 E.02813
N9061 G1 X159.264 Y197.732 E.06236
N9062 G1 X190.736 Y189.3 E1.0477
N9063 G1 X190.736 Y185.087 E.13547
N9064 G1 X159.264 Y153.616 E1.43118
N9065 G1 X159.264 Y155.589 E.06343
N9066 G1 X190.736 Y147.156 E1.0477
N9067 G1 X190.736 Y145.528 E.05236
N9068 ; WIPE_START
N9069 G1 X190.736 Y147.156 E-.61876
N9070 G1 X190.377 Y147.252 E-.14124
N9071 ; WIPE_END
N9072 G1 E-.04 F1800
N9073 M204 S10000
N9074 G17
N9075 G3 Z6.4 I1.217 J0 P1  F60000
N9076 ; stop printing object, unique label id: 229
N9077 M625
N9078 ; object ids of layer 30 start: 229
N9079 M624 AQAAAAAAAAA=
N9080 ;======== H2D 20250527========
N9081 ; SKIPPABLE_START
N9082 ; SKIPTYPE: timelapse
N9083 M622.1 S1 ; for prev firware, default turned on
N9084 
N9085 M1002 judge_flag timelapse_record_flag
N9086 
N9087 M622 J1
N9088 M993 A2 B2 C2
N9089 M993 A0 B0 C0
N9090 
N9091 
N9092 
N9093 
N9094     M9711 M0 E1 X260 Y141 Z6.4 S11 C10 O0 T3000
N9095 
N9096 
N9097 
N9098 M993 A3 B3 C3
N9099 
N9100 M623
N9101 ; SKIPPABLE_END
N9102 
N9103 ; object ids of this layer30 end: 229
N9104 M625
N9105 ; CHANGE_LAYER
N9106 ; Z_HEIGHT: 6.2
N9107 ; LAYER_HEIGHT: 0.2
N9108 ;======== H2D 20250521========
N9109 ; layer num/total_layer_count: 31/63
N9110 ; update layer progress
N9111 M73 L31
N9112 M991 S0 P30 ;notify layer change
N9113 
N9114 
N9115 ; OBJECT_ID: 229
N9116 ; COOLING_NODE: 0
N9117 ; start printing object, unique label id: 229
N9118 M624 AQAAAAAAAAA=
N9119 G1 X191.084 Y200.639 F60000
N9120 G1 Z6.2
N9121 G1 E.8 F1800
N9122 ; FEATURE: Inner wall
N9123 ; LINE_WIDTH: 0.45
N9124 ; LAYER_HEIGHT: 0.2
N9125 G1 F4421.739
N9126 M204 S8000
N9127 G1 X158.916 Y200.639 E1.03439
N9128 G1 X158.916 Y127.036 E2.36678
N9129 G1 X191.084 Y127.036 E1.03439
N9130 G1 X191.084 Y200.579 E2.36485
N9131 ; COOLING_NODE: 0
N9132 M204 S10000
N9133 G1 X191.491 Y201.046 F60000
N9134 G1 F4421.739
N9135 M204 S8000
N9136 G1 X158.509 Y201.046 E1.06057
N9137 G1 X158.509 Y126.629 E2.39296
N9138 G1 X191.491 Y126.629 E1.06057
N9139 G1 X191.491 Y200.986 E2.39103
N9140 ; COOLING_NODE: 0
N9141 M204 S10000
N9142 M73 P62 R20
N9143 G1 X191.898 Y201.453 F60000
N9144 G1 F4421.739
N9145 M204 S8000
N9146 G1 X158.102 Y201.453 E1.08675
N9147 G1 X158.102 Y126.222 E2.41914
N9148 G1 X191.898 Y126.222 E1.08675
N9149 G1 X191.898 Y201.393 E2.41721
N9150 ; COOLING_NODE: 0
N9151 M204 S10000
N9152 G1 X192.29 Y201.845 F60000
N9153 ; FEATURE: Outer wall
N9154 ; LINE_WIDTH: 0.42
N9155 G1 F4773.528
N9156 M204 S5000
N9157 G1 X157.71 Y201.845 E1.03002
N9158 G1 X157.71 Y125.83 E2.26421
N9159 G1 X192.29 Y125.83 E1.03002
N9160 G1 X192.29 Y201.785 E2.26243
N9161 G1 E-.8 F1800
N9162 M204 S10000
N9163 G1 X185.686 Y197.958 Z6.6 F60000
N9164 G1 X159.264 Y182.65 Z6.6
N9165 G1 Z6.2
N9166 G1 E.8 F1800
N9167 ; FEATURE: Sparse infill
N9168 ; LINE_WIDTH: 0.45
N9169 G1 F4421.739
N9170 M204 S8000
N9171 G1 X159.264 Y181.021 E.05236
N9172 G1 X190.736 Y172.589 E1.0477
N9173 G1 X190.736 Y173.373 E.02522
N9174 G1 X159.264 Y141.902 E1.43118
N9175 M204 S10000
N9176 G1 X159.264 Y137.249 F60000
N9177 G1 F4421.739
N9178 M204 S8000
N9179 G1 X159.264 Y138.877 E.05236
N9180 G1 X190.736 Y130.445 E1.0477
N9181 G1 X190.736 Y127.385 E.0984
N9182 G1 X188.658 Y127.385 E.06682
N9183 G1 X169.123 Y200.29 E2.42708
N9184 G1 X171.597 Y200.29 E.07957
N9185 G1 X159.264 Y187.958 E.56084
N9186 G1 X159.264 Y189.45 E.04799
N9187 G1 X190.736 Y181.017 E1.0477
N9188 G1 X190.736 Y182.543 E.04906
N9189 G1 X185.98 Y200.29 E.59082
N9190 G1 X183.111 Y200.29 E.09226
N9191 G1 X159.264 Y176.444 E1.08444
N9192 G1 X159.264 Y174.168 E.07318
N9193 G1 X171.8 Y127.385 E1.55745
N9194 G1 X170.699 Y127.385 E.0354
N9195 G1 X159.264 Y130.449 E.38066
N9196 G1 X159.264 Y130.388 E.00195
N9197 G1 X190.736 Y161.859 E1.43118
N9198 G1 X190.736 Y164.16 E.07399
N9199 G1 X159.264 Y172.593 E1.0477
N9200 G1 X159.264 Y170.964 E.05236
N9201 M204 S10000
N9202 G1 X190.736 Y157.359 F60000
N9203 G1 F4421.739
N9204 M204 S8000
N9205 G1 X190.736 Y155.731 E.05236
N9206 G1 X159.264 Y164.164 E1.0477
N9207 G1 X159.264 Y164.93 E.02464
N9208 G1 X190.736 Y196.401 E1.43118
N9209 G1 X190.736 Y197.875 E.0474
N9210 G1 X181.722 Y200.29 E.30008
N9211 G1 X177.551 Y200.29 E.1341
N9212 G1 X190.736 Y151.086 E1.63804
N9213 G1 X190.736 Y150.345 E.02383
N9214 G1 X167.775 Y127.385 E1.04415
N9215 G1 X163.371 Y127.385 E.14161
N9216 G1 X159.264 Y142.711 E.51023
N9217 G1 X159.264 Y147.306 E.14776
N9218 G1 X190.736 Y138.873 E1.0477
N9219 G1 X190.736 Y138.831 E.00136
N9220 G1 X179.289 Y127.385 E.52054
N9221 G1 X180.229 Y127.385 E.03022
N9222 G1 X160.694 Y200.29 E2.42708
N9223 G1 X160.083 Y200.29 E.01964
N9224 G1 X159.264 Y199.472 E.03723
N9225 G1 X159.264 Y197.879 E.05122
N9226 M73 P62 R19
N9227 G1 X190.736 Y189.446 E1.0477
N9228 G1 X190.736 Y184.887 E.14661
N9229 G1 X159.264 Y153.416 E1.43118
N9230 G1 X159.264 Y155.735 E.07457
N9231 G1 X190.736 Y147.302 E1.0477
N9232 G1 X190.736 Y145.674 E.05236
N9233 ; WIPE_START
N9234 G1 X190.736 Y147.302 E-.61876
N9235 G1 X190.377 Y147.398 E-.14124
N9236 ; WIPE_END
N9237 G1 E-.04 F1800
N9238 M204 S10000
N9239 G17
N9240 G3 Z6.6 I1.217 J0 P1  F60000
N9241 ; stop printing object, unique label id: 229
N9242 M625
N9243 ; object ids of layer 31 start: 229
N9244 M624 AQAAAAAAAAA=
N9245 ;======== H2D 20250527========
N9246 ; SKIPPABLE_START
N9247 ; SKIPTYPE: timelapse
N9248 M622.1 S1 ; for prev firware, default turned on
N9249 
N9250 M1002 judge_flag timelapse_record_flag
N9251 
N9252 M622 J1
N9253 M993 A2 B2 C2
N9254 M993 A0 B0 C0
N9255 
N9256 
N9257 
N9258 
N9259     M9711 M0 E1 X260 Y141 Z6.6 S11 C10 O0 T3000
N9260 
N9261 
N9262 
N9263 M993 A3 B3 C3
N9264 
N9265 M623
N9266 ; SKIPPABLE_END
N9267 
N9268 ; object ids of this layer31 end: 229
N9269 M625
N9270 ; CHANGE_LAYER
N9271 ; Z_HEIGHT: 6.4
N9272 ; LAYER_HEIGHT: 0.2
N9273 ;======== H2D 20250521========
N9274 ; layer num/total_layer_count: 32/63
N9275 ; update layer progress
N9276 M73 L32
N9277 M991 S0 P31 ;notify layer change
N9278 
N9279 
N9280 ; OBJECT_ID: 229
N9281 ; COOLING_NODE: 0
N9282 ; start printing object, unique label id: 229
N9283 M624 AQAAAAAAAAA=
N9284 G1 X191.084 Y200.639 F60000
N9285 G1 Z6.4
N9286 G1 E.8 F1800
N9287 ; FEATURE: Inner wall
N9288 ; LINE_WIDTH: 0.45
N9289 ; LAYER_HEIGHT: 0.2
N9290 G1 F4421.739
N9291 M204 S8000
N9292 G1 X158.916 Y200.639 E1.03439
N9293 G1 X158.916 Y127.036 E2.36678
N9294 G1 X191.084 Y127.036 E1.03439
N9295 G1 X191.084 Y200.579 E2.36485
N9296 ; COOLING_NODE: 0
N9297 M204 S10000
N9298 G1 X191.491 Y201.046 F60000
N9299 G1 F4421.739
N9300 M204 S8000
N9301 G1 X158.509 Y201.046 E1.06057
N9302 G1 X158.509 Y126.629 E2.39296
N9303 G1 X191.491 Y126.629 E1.06057
N9304 G1 X191.491 Y200.986 E2.39103
N9305 ; COOLING_NODE: 0
N9306 M204 S10000
N9307 G1 X191.898 Y201.453 F60000
N9308 G1 F4421.739
N9309 M204 S8000
N9310 G1 X158.102 Y201.453 E1.08675
N9311 G1 X158.102 Y126.222 E2.41914
N9312 G1 X191.898 Y126.222 E1.08675
N9313 G1 X191.898 Y201.393 E2.41721
N9314 ; COOLING_NODE: 0
N9315 M204 S10000
N9316 G1 X192.29 Y201.845 F60000
N9317 ; FEATURE: Outer wall
N9318 ; LINE_WIDTH: 0.42
N9319 G1 F4773.528
N9320 M204 S5000
N9321 G1 X157.71 Y201.845 E1.03002
N9322 G1 X157.71 Y125.83 E2.26421
N9323 G1 X192.29 Y125.83 E1.03002
N9324 G1 X192.29 Y201.785 E2.26243
N9325 G1 E-.8 F1800
N9326 M204 S10000
N9327 M73 P63 R19
N9328 G1 X187.462 Y200.29 Z6.8 F60000
N9329 G1 Z6.4
N9330 G1 E.8 F1800
N9331 ; FEATURE: Sparse infill
N9332 ; LINE_WIDTH: 0.45
N9333 G1 F4421.739
N9334 M204 S8000
N9335 G1 X185.834 Y200.29 E.05236
N9336 G1 X190.736 Y181.997 E.60901
N9337 G1 X190.736 Y181.164 E.02678
N9338 G1 X159.264 Y189.597 E1.0477
N9339 G1 X159.264 Y187.758 E.05913
N9340 G1 X171.797 Y200.29 E.56993
N9341 G1 X168.976 Y200.29 E.09071
N9342 G1 X188.511 Y127.385 E2.42708
N9343 G1 X190.736 Y127.385 E.07153
N9344 G1 X190.736 Y130.591 E.10311
N9345 G1 X159.264 Y139.024 E1.0477
N9346 G1 X159.264 Y137.395 E.05236
N9347 M204 S10000
N9348 G1 X159.264 Y141.702 F60000
N9349 G1 F4421.739
N9350 M204 S8000
N9351 G1 X190.736 Y173.173 E1.43118
N9352 G1 X190.736 Y172.735 E.01408
N9353 G1 X159.264 Y181.168 E1.0477
N9354 G1 X159.264 Y182.796 E.05236
N9355 M204 S10000
N9356 G1 X159.264 Y172.739 F60000
N9357 G1 F4421.739
N9358 M204 S8000
N9359 G1 X190.736 Y164.306 E1.0477
N9360 G1 X190.736 Y161.659 E.08512
N9361 G1 X159.264 Y130.188 E1.43118
N9362 G1 X159.264 Y130.595 E.01309
N9363 G1 X171.245 Y127.385 E.39885
N9364 G1 X171.654 Y127.385 E.01313
N9365 G1 X159.264 Y173.622 E1.53926
N9366 G1 X159.264 Y176.244 E.08432
N9367 G1 X183.311 Y200.29 E1.09354
N9368 M204 S10000
N9369 G1 X190.736 Y157.506 F60000
N9370 G1 F4421.739
N9371 M204 S8000
N9372 G1 X190.736 Y155.877 E.05236
N9373 G1 X159.264 Y164.31 E1.0477
N9374 G1 X159.264 Y164.73 E.0135
N9375 G1 X190.736 Y196.201 E1.43118
N9376 G1 X190.736 Y198.021 E.05854
N9377 G1 X182.268 Y200.29 E.28189
N9378 G1 X177.405 Y200.29 E.15638
N9379 G1 X190.736 Y150.54 E1.65623
N9380 G1 X190.736 Y150.145 E.01269
N9381 G1 X167.975 Y127.385 E1.03505
N9382 G1 X163.225 Y127.385 E.15275
N9383 G1 X159.264 Y142.165 E.49204
N9384 G1 X159.264 Y147.453 E.17003
N9385 G1 X190.736 Y139.02 E1.0477
N9386 G1 X190.736 Y138.631 E.0125
N9387 G1 X179.489 Y127.385 E.51145
N9388 G1 X180.082 Y127.385 E.01908
N9389 G1 X160.547 Y200.29 E2.42708
N9390 G1 X160.283 Y200.29 E.0085
N9391 G1 X159.264 Y199.272 E.04632
N9392 G1 X159.264 Y198.025 E.04008
N9393 G1 X190.736 Y189.593 E1.0477
N9394 G1 X190.736 Y184.687 E.15775
N9395 G1 X159.264 Y153.216 E1.43118
N9396 G1 X159.264 Y155.881 E.08571
N9397 G1 X190.736 Y147.449 E1.0477
N9398 G1 X190.736 Y145.82 E.05236
N9399 ; WIPE_START
N9400 G1 X190.736 Y147.449 E-.61876
N9401 G1 X190.377 Y147.545 E-.14124
N9402 ; WIPE_END
N9403 G1 E-.04 F1800
N9404 M204 S10000
N9405 G17
N9406 G3 Z6.8 I1.217 J0 P1  F60000
N9407 ; stop printing object, unique label id: 229
N9408 M625
N9409 ; object ids of layer 32 start: 229
N9410 M624 AQAAAAAAAAA=
N9411 ;======== H2D 20250527========
N9412 ; SKIPPABLE_START
N9413 ; SKIPTYPE: timelapse
N9414 M622.1 S1 ; for prev firware, default turned on
N9415 
N9416 M1002 judge_flag timelapse_record_flag
N9417 
N9418 M622 J1
N9419 M993 A2 B2 C2
N9420 M993 A0 B0 C0
N9421 
N9422 
N9423 
N9424 
N9425     M9711 M0 E1 X260 Y141 Z6.8 S11 C10 O0 T3000
N9426 
N9427 
N9428 
N9429 M993 A3 B3 C3
N9430 
N9431 M623
N9432 ; SKIPPABLE_END
N9433 
N9434 ; object ids of this layer32 end: 229
N9435 M625
N9436 ; CHANGE_LAYER
N9437 ; Z_HEIGHT: 6.6
N9438 ; LAYER_HEIGHT: 0.2
N9439 ;======== H2D 20250521========
N9440 ; layer num/total_layer_count: 33/63
N9441 ; update layer progress
N9442 M73 L33
N9443 M991 S0 P32 ;notify layer change
N9444 
N9445 
N9446 ; OBJECT_ID: 229
N9447 ; COOLING_NODE: 0
N9448 ; start printing object, unique label id: 229
N9449 M624 AQAAAAAAAAA=
N9450 G1 X191.084 Y200.639 F60000
N9451 G1 Z6.6
N9452 G1 E.8 F1800
N9453 ; FEATURE: Inner wall
N9454 ; LINE_WIDTH: 0.45
N9455 ; LAYER_HEIGHT: 0.2
N9456 G1 F4421.739
N9457 M204 S8000
N9458 G1 X158.916 Y200.639 E1.03439
N9459 G1 X158.916 Y127.036 E2.36678
N9460 G1 X191.084 Y127.036 E1.03439
N9461 G1 X191.084 Y200.579 E2.36485
N9462 ; COOLING_NODE: 0
N9463 M204 S10000
N9464 G1 X191.491 Y201.046 F60000
N9465 G1 F4421.739
N9466 M204 S8000
N9467 G1 X158.509 Y201.046 E1.06057
N9468 G1 X158.509 Y126.629 E2.39296
N9469 G1 X191.491 Y126.629 E1.06057
N9470 G1 X191.491 Y200.986 E2.39103
N9471 ; COOLING_NODE: 0
N9472 M204 S10000
N9473 G1 X191.898 Y201.453 F60000
N9474 G1 F4421.739
N9475 M204 S8000
N9476 G1 X158.102 Y201.453 E1.08675
N9477 G1 X158.102 Y126.222 E2.41914
N9478 G1 X191.898 Y126.222 E1.08675
N9479 G1 X191.898 Y201.393 E2.41721
N9480 ; COOLING_NODE: 0
N9481 M204 S10000
N9482 G1 X192.29 Y201.845 F60000
N9483 ; FEATURE: Outer wall
N9484 ; LINE_WIDTH: 0.42
N9485 G1 F4773.528
N9486 M204 S5000
N9487 G1 X157.71 Y201.845 E1.03002
N9488 G1 X157.71 Y125.83 E2.26421
N9489 G1 X192.29 Y125.83 E1.03002
N9490 G1 X192.29 Y201.785 E2.26243
N9491 G1 E-.8 F1800
N9492 M204 S10000
N9493 G1 X187.316 Y200.29 Z7 F60000
N9494 G1 Z6.6
N9495 G1 E.8 F1800
N9496 ; FEATURE: Sparse infill
N9497 ; LINE_WIDTH: 0.45
N9498 G1 F4421.739
N9499 M204 S8000
N9500 G1 X185.687 Y200.29 E.05236
N9501 G1 X190.736 Y181.45 E.6272
N9502 G1 X190.736 Y181.31 E.0045
N9503 G1 X159.264 Y189.743 E1.0477
N9504 G1 X159.264 Y187.558 E.07027
N9505 G1 X171.997 Y200.29 E.57903
N9506 G1 X168.83 Y200.29 E.10185
N9507 G1 X188.365 Y127.385 E2.42708
N9508 G1 X190.736 Y127.385 E.07624
N9509 G1 X190.736 Y130.738 E.10782
N9510 G1 X159.264 Y139.17 E1.0477
N9511 G1 X159.264 Y137.542 E.05236
N9512 M204 S10000
N9513 G1 X159.264 Y145.971 F60000
N9514 G1 F4421.739
N9515 M204 S8000
N9516 G1 X159.264 Y147.599 E.05236
N9517 G1 X190.736 Y139.166 E1.0477
N9518 G1 X190.736 Y138.431 E.02364
N9519 G1 X179.689 Y127.385 E.50235
N9520 G1 X179.936 Y127.385 E.00794
N9521 G1 X160.401 Y200.29 E2.42708
N9522 G1 X160.483 Y200.29 E.00264
N9523 G1 X159.264 Y199.072 E.05542
N9524 G1 X159.264 Y198.172 E.02894
N9525 G1 X190.736 Y189.739 E1.04769
N9526 G1 X190.736 Y184.487 E.16889
N9527 G1 X159.264 Y153.016 E1.43118
N9528 G1 X159.264 Y156.028 E.09685
N9529 G1 X190.736 Y147.595 E1.0477
N9530 G1 X190.736 Y145.967 E.05236
N9531 M204 S10000
N9532 M73 P64 R19
N9533 G1 X190.736 Y166.081 F60000
N9534 G1 F4421.739
N9535 M204 S8000
N9536 G1 X190.736 Y164.453 E.05236
N9537 G1 X159.264 Y172.885 E1.04769
N9538 G1 X159.264 Y173.075 E.0061
N9539 G1 X171.507 Y127.385 E1.52107
N9540 G1 X171.792 Y127.385 E.00915
N9541 G1 X159.264 Y130.741 E.41704
N9542 G1 X159.264 Y129.988 E.02423
N9543 G1 X190.736 Y161.459 E1.43118
N9544 G1 X190.736 Y156.024 E.17478
N9545 G1 X159.264 Y164.457 E1.0477
N9546 G1 X159.264 Y164.53 E.00236
N9547 G1 X190.736 Y196.001 E1.43118
N9548 G1 X190.736 Y198.168 E.06968
N9549 G1 X182.815 Y200.29 E.2637
N9550 G1 X177.259 Y200.29 E.17866
N9551 G1 X190.736 Y149.994 E1.67442
N9552 G1 X190.736 Y149.945 E.00156
N9553 G1 X168.175 Y127.385 E1.02596
N9554 G1 X163.078 Y127.385 E.16389
N9555 G1 X159.264 Y141.618 E.47385
N9556 G1 X159.264 Y141.502 E.00375
N9557 G1 X190.736 Y172.973 E1.43118
N9558 G1 X190.736 Y172.881 E.00294
N9559 G1 X159.264 Y181.314 E1.0477
N9560 G1 X159.264 Y176.044 E.16948
N9561 G1 X183.511 Y200.29 E1.10263
N9562 ; WIPE_START
N9563 G1 X182.097 Y198.876 E-.76
N9564 ; WIPE_END
N9565 G1 E-.04 F1800
N9566 M204 S10000
N9567 G17
N9568 G3 Z7 I1.217 J0 P1  F60000
N9569 ; stop printing object, unique label id: 229
N9570 M625
N9571 ; object ids of layer 33 start: 229
N9572 M624 AQAAAAAAAAA=
N9573 ;======== H2D 20250527========
N9574 ; SKIPPABLE_START
N9575 ; SKIPTYPE: timelapse
N9576 M622.1 S1 ; for prev firware, default turned on
N9577 
N9578 M1002 judge_flag timelapse_record_flag
N9579 
N9580 M622 J1
N9581 M993 A2 B2 C2
N9582 M993 A0 B0 C0
N9583 
N9584 
N9585 
N9586 
N9587     M9711 M0 E1 X260 Y141 Z7 S11 C10 O0 T3000
N9588 
N9589 
N9590 
N9591 M993 A3 B3 C3
N9592 
N9593 M623
N9594 ; SKIPPABLE_END
N9595 
N9596 ; object ids of this layer33 end: 229
N9597 M625
N9598 ; CHANGE_LAYER
N9599 ; Z_HEIGHT: 6.8
N9600 ; LAYER_HEIGHT: 0.2
N9601 ;======== H2D 20250521========
N9602 ; layer num/total_layer_count: 34/63
N9603 ; update layer progress
N9604 M73 L34
N9605 M991 S0 P33 ;notify layer change
N9606 
N9607 
N9608 ; OBJECT_ID: 229
N9609 ; COOLING_NODE: 0
N9610 ; start printing object, unique label id: 229
N9611 M624 AQAAAAAAAAA=
N9612 G1 X191.084 Y200.639 F60000
N9613 G1 Z6.8
N9614 G1 E.8 F1800
N9615 ; FEATURE: Inner wall
N9616 ; LINE_WIDTH: 0.45
N9617 ; LAYER_HEIGHT: 0.2
N9618 G1 F4421.739
N9619 M204 S8000
N9620 G1 X158.916 Y200.639 E1.03439
N9621 G1 X158.916 Y127.036 E2.36678
N9622 G1 X191.084 Y127.036 E1.03439
N9623 G1 X191.084 Y200.579 E2.36485
N9624 ; COOLING_NODE: 0
N9625 M204 S10000
N9626 G1 X191.491 Y201.046 F60000
N9627 G1 F4421.739
N9628 M204 S8000
N9629 G1 X158.509 Y201.046 E1.06057
N9630 G1 X158.509 Y126.629 E2.39296
N9631 G1 X191.491 Y126.629 E1.06057
N9632 G1 X191.491 Y200.986 E2.39103
N9633 ; COOLING_NODE: 0
N9634 M204 S10000
N9635 G1 X191.898 Y201.453 F60000
N9636 G1 F4421.739
N9637 M204 S8000
N9638 G1 X158.102 Y201.453 E1.08675
N9639 G1 X158.102 Y126.222 E2.41914
N9640 G1 X191.898 Y126.222 E1.08675
N9641 G1 X191.898 Y201.393 E2.41721
N9642 ; COOLING_NODE: 0
N9643 M204 S10000
N9644 G1 X192.29 Y201.845 F60000
N9645 ; FEATURE: Outer wall
N9646 ; LINE_WIDTH: 0.42
N9647 M73 P64 R18
N9648 G1 F4773.528
N9649 M204 S5000
N9650 G1 X157.71 Y201.845 E1.03002
N9651 G1 X157.71 Y125.83 E2.26421
N9652 G1 X192.29 Y125.83 E1.03002
N9653 G1 X192.29 Y201.785 E2.26243
N9654 G1 E-.8 F1800
N9655 M204 S10000
N9656 G1 X187.169 Y200.29 Z7.2 F60000
N9657 G1 Z6.8
N9658 G1 E.8 F1800
N9659 ; FEATURE: Sparse infill
N9660 ; LINE_WIDTH: 0.45
N9661 G1 F4421.739
N9662 M204 S8000
N9663 G1 X185.541 Y200.29 E.05236
N9664 G1 X190.736 Y180.904 E.64539
N9665 G1 X190.736 Y179.275 E.05236
N9666 M204 S10000
N9667 G1 X190.736 Y181.457 F60000
N9668 G1 F4421.739
N9669 M204 S8000
N9670 G1 X159.264 Y189.889 E1.0477
N9671 G1 X159.264 Y187.358 E.08141
N9672 G1 X172.197 Y200.29 E.58812
N9673 G1 X168.683 Y200.29 E.11299
N9674 G1 X188.218 Y127.385 E2.42708
N9675 G1 X190.736 Y127.385 E.08094
N9676 G1 X190.736 Y130.884 E.11252
N9677 G1 X159.264 Y139.317 E1.0477
N9678 G1 X159.264 Y137.688 E.05236
N9679 M204 S10000
N9680 G1 X159.264 Y146.117 F60000
N9681 G1 F4421.739
N9682 M204 S8000
N9683 G1 X159.264 Y147.745 E.05236
N9684 G1 X190.736 Y139.313 E1.0477
N9685 G1 X190.736 Y138.231 E.03478
N9686 G1 X179.889 Y127.385 E.49326
N9687 G1 X179.79 Y127.385 E.0032
N9688 G1 X160.255 Y200.29 E2.42708
N9689 G1 X160.683 Y200.29 E.01378
N9690 G1 X159.264 Y198.872 E.06451
N9691 G1 X159.264 Y198.318 E.0178
N9692 G1 X190.736 Y189.885 E1.0477
N9693 G1 X190.736 Y184.287 E.18003
N9694 G1 X159.264 Y152.816 E1.43118
N9695 G1 X159.264 Y156.174 E.10799
N9696 G1 X190.736 Y147.742 E1.04769
N9697 G1 X190.736 Y146.113 E.05236
N9698 M204 S10000
N9699 G1 X190.736 Y154.542 F60000
N9700 G1 F4421.739
N9701 M204 S8000
N9702 G1 X190.736 Y156.17 E.05236
N9703 G1 X159.264 Y164.603 E1.0477
N9704 G1 X159.264 Y164.33 E.00878
N9705 G1 X190.736 Y195.801 E1.43118
N9706 G1 X190.736 Y198.314 E.08082
N9707 G1 X183.361 Y200.29 E.24551
N9708 G1 X183.711 Y200.29 E.01126
N9709 G1 X159.264 Y175.844 E1.11173
N9710 G1 X159.264 Y181.461 E.18061
N9711 G1 X190.736 Y173.028 E1.0477
N9712 G1 X190.736 Y172.773 E.0082
N9713 G1 X159.264 Y141.302 E1.43118
N9714 G1 X159.264 Y141.072 E.00739
N9715 G1 X162.932 Y127.385 E.45566
N9716 G1 X168.375 Y127.385 E.17503
N9717 G1 X190.736 Y149.745 E1.01686
N9718 G1 X190.736 Y149.447 E.00958
N9719 G1 X177.112 Y200.29 E1.69261
N9720 G1 X178.74 Y200.29 E.05236
N9721 M204 S10000
N9722 G1 X173.967 Y127.385 F60000
N9723 G1 F4421.739
N9724 M204 S8000
N9725 G1 X172.338 Y127.385 E.05236
N9726 G1 X159.264 Y130.888 E.43523
N9727 G1 X159.264 Y129.788 E.03536
N9728 G1 X190.736 Y161.259 E1.43118
N9729 G1 X190.736 Y164.599 E.1074
N9730 G1 X159.264 Y173.032 E1.0477
N9731 G1 X159.264 Y172.529 E.01618
N9732 G1 X171.361 Y127.385 E1.50288
N9733 ; WIPE_START
N9734 G1 X170.843 Y129.317 E-.76
N9735 ; WIPE_END
N9736 G1 E-.04 F1800
N9737 M204 S10000
N9738 G17
N9739 G3 Z7.2 I1.217 J0 P1  F60000
N9740 ; stop printing object, unique label id: 229
N9741 M625
N9742 ; object ids of layer 34 start: 229
N9743 M624 AQAAAAAAAAA=
N9744 ;======== H2D 20250527========
N9745 ; SKIPPABLE_START
N9746 ; SKIPTYPE: timelapse
N9747 M622.1 S1 ; for prev firware, default turned on
N9748 
N9749 M1002 judge_flag timelapse_record_flag
N9750 
N9751 M622 J1
N9752 M993 A2 B2 C2
N9753 M993 A0 B0 C0
N9754 
N9755 
N9756 
N9757 
N9758     M9711 M0 E1 X260 Y141 Z7.2 S11 C10 O0 T3000
N9759 
N9760 
N9761 
N9762 M993 A3 B3 C3
N9763 
N9764 M623
N9765 ; SKIPPABLE_END
N9766 
N9767 ; object ids of this layer34 end: 229
N9768 M625
N9769 ; CHANGE_LAYER
N9770 ; Z_HEIGHT: 7
N9771 ; LAYER_HEIGHT: 0.2
N9772 ;======== H2D 20250521========
N9773 ; layer num/total_layer_count: 35/63
N9774 ; update layer progress
N9775 M73 L35
N9776 M991 S0 P34 ;notify layer change
N9777 
N9778 
N9779 ; OBJECT_ID: 229
N9780 ; COOLING_NODE: 0
N9781 ; start printing object, unique label id: 229
N9782 M624 AQAAAAAAAAA=
N9783 M73 P65 R18
N9784 G1 X191.084 Y200.639 F60000
N9785 G1 Z7
N9786 G1 E.8 F1800
N9787 ; FEATURE: Inner wall
N9788 ; LINE_WIDTH: 0.45
N9789 ; LAYER_HEIGHT: 0.2
N9790 G1 F4421.739
N9791 M204 S8000
N9792 G1 X158.916 Y200.639 E1.03439
N9793 G1 X158.916 Y127.036 E2.36678
N9794 G1 X191.084 Y127.036 E1.03439
N9795 G1 X191.084 Y200.579 E2.36485
N9796 ; COOLING_NODE: 0
N9797 M204 S10000
N9798 G1 X191.491 Y201.046 F60000
N9799 G1 F4421.739
N9800 M204 S8000
N9801 G1 X158.509 Y201.046 E1.06057
N9802 G1 X158.509 Y126.629 E2.39296
N9803 G1 X191.491 Y126.629 E1.06057
N9804 G1 X191.491 Y200.986 E2.39103
N9805 ; COOLING_NODE: 0
N9806 M204 S10000
N9807 G1 X191.898 Y201.453 F60000
N9808 G1 F4421.739
N9809 M204 S8000
N9810 G1 X158.102 Y201.453 E1.08675
N9811 G1 X158.102 Y126.222 E2.41914
N9812 G1 X191.898 Y126.222 E1.08675
N9813 G1 X191.898 Y201.393 E2.41721
N9814 ; COOLING_NODE: 0
N9815 M204 S10000
N9816 G1 X192.29 Y201.845 F60000
N9817 ; FEATURE: Outer wall
N9818 ; LINE_WIDTH: 0.42
N9819 G1 F4773.528
N9820 M204 S5000
N9821 G1 X157.71 Y201.845 E1.03002
N9822 G1 X157.71 Y125.83 E2.26421
N9823 G1 X192.29 Y125.83 E1.03002
N9824 G1 X192.29 Y201.785 E2.26243
N9825 G1 E-.8 F1800
N9826 M204 S10000
N9827 G1 X187.023 Y200.29 Z7.4 F60000
N9828 G1 Z7
N9829 G1 E.8 F1800
N9830 ; FEATURE: Sparse infill
N9831 ; LINE_WIDTH: 0.45
N9832 G1 F4421.739
N9833 M204 S8000
N9834 G1 X185.395 Y200.29 E.05236
N9835 G1 X190.736 Y180.357 E.66358
N9836 G1 X190.736 Y178.729 E.05236
N9837 M204 S10000
N9838 G1 X190.736 Y181.603 F60000
N9839 G1 F4421.739
N9840 M204 S8000
N9841 G1 X159.264 Y190.036 E1.0477
N9842 G1 X159.264 Y187.158 E.09255
N9843 G1 X172.397 Y200.29 E.59722
N9844 G1 X168.537 Y200.29 E.12413
N9845 G1 X188.072 Y127.385 E2.42708
N9846 G1 X190.736 Y127.385 E.08565
N9847 G1 X190.736 Y131.03 E.11723
N9848 G1 X159.264 Y139.463 E1.0477
N9849 M204 S10000
N9850 G1 X159.264 Y146.263 F60000
N9851 G1 F4421.739
N9852 M204 S8000
N9853 G1 X159.264 Y147.892 E.05236
N9854 G1 X190.736 Y139.459 E1.0477
N9855 G1 X190.736 Y138.031 E.04592
N9856 G1 X180.089 Y127.385 E.48416
N9857 G1 X179.643 Y127.385 E.01434
N9858 G1 X160.108 Y200.29 E2.42708
N9859 G1 X160.883 Y200.29 E.02492
N9860 G1 X159.264 Y198.672 E.07361
N9861 G1 X159.264 Y198.465 E.00666
N9862 G1 X190.736 Y190.032 E1.0477
N9863 G1 X190.736 Y184.087 E.19117
N9864 G1 X159.264 Y152.616 E1.43118
N9865 G1 X159.264 Y156.321 E.11913
N9866 G1 X190.736 Y147.888 E1.0477
N9867 G1 X190.736 Y148.901 E.03257
N9868 G1 X176.966 Y200.29 E1.7108
N9869 G1 X178.594 Y200.29 E.05236
N9870 M204 S10000
N9871 G1 X174.513 Y127.385 F60000
N9872 G1 F4421.739
N9873 M204 S8000
N9874 G1 X172.885 Y127.385 E.05236
N9875 G1 X159.264 Y131.034 E.45342
N9876 G1 X159.264 Y129.588 E.0465
N9877 G1 X190.736 Y161.059 E1.43118
N9878 G1 X190.736 Y164.746 E.11854
N9879 G1 X159.264 Y173.178 E1.0477
N9880 G1 X159.264 Y171.982 E.03845
N9881 G1 X171.214 Y127.385 E1.48469
N9882 G1 X168.575 Y127.385 E.08487
N9883 G1 X190.736 Y149.545 E1.00777
N9884 M204 S10000
N9885 G1 X190.736 Y154.688 F60000
N9886 G1 F4421.739
N9887 M204 S8000
N9888 G1 X190.736 Y156.317 E.05236
N9889 G1 X159.264 Y164.749 E1.0477
N9890 G1 X159.264 Y164.13 E.01992
N9891 G1 X190.736 Y195.601 E1.43118
N9892 G1 X190.736 Y198.461 E.09196
N9893 G1 X183.907 Y200.29 E.22732
N9894 G1 X159.264 Y175.644 E1.12074
N9895 G1 X159.264 Y181.607 E.19175
N9896 G1 X190.736 Y173.174 E1.0477
N9897 G1 X190.736 Y172.573 E.01933
N9898 G1 X159.264 Y141.102 E1.43118
N9899 G1 X159.264 Y140.526 E.01853
N9900 G1 X162.786 Y127.385 E.43747
N9901 G1 X164.414 Y127.385 E.05236
N9902 ; WIPE_START
N9903 G1 X162.786 Y127.385 E-.61876
N9904 G1 X162.689 Y127.744 E-.14124
N9905 ; WIPE_END
N9906 G1 E-.04 F1800
N9907 M204 S10000
N9908 G17
N9909 G3 Z7.4 I1.217 J0 P1  F60000
N9910 ; stop printing object, unique label id: 229
N9911 M625
N9912 ; object ids of layer 35 start: 229
N9913 M624 AQAAAAAAAAA=
N9914 ;======== H2D 20250527========
N9915 ; SKIPPABLE_START
N9916 ; SKIPTYPE: timelapse
N9917 M622.1 S1 ; for prev firware, default turned on
N9918 
N9919 M1002 judge_flag timelapse_record_flag
N9920 
N9921 M622 J1
N9922 M993 A2 B2 C2
N9923 M993 A0 B0 C0
N9924 
N9925 
N9926 
N9927 
N9928     M9711 M0 E1 X260 Y141 Z7.4 S11 C10 O0 T3000
N9929 
N9930 
N9931 
N9932 M993 A3 B3 C3
N9933 
N9934 M623
N9935 ; SKIPPABLE_END
N9936 
N9937 ; object ids of this layer35 end: 229
N9938 M625
N9939 ; CHANGE_LAYER
N9940 ; Z_HEIGHT: 7.2
N9941 ; LAYER_HEIGHT: 0.2
N9942 ;======== H2D 20250521========
N9943 ; layer num/total_layer_count: 36/63
N9944 ; update layer progress
N9945 M73 L36
N9946 M991 S0 P35 ;notify layer change
N9947 
N9948 
N9949 ; OBJECT_ID: 229
N9950 ; COOLING_NODE: 0
N9951 ; start printing object, unique label id: 229
N9952 M624 AQAAAAAAAAA=
N9953 G1 X191.084 Y200.639 F60000
N9954 G1 Z7.2
N9955 G1 E.8 F1800
N9956 ; FEATURE: Inner wall
N9957 ; LINE_WIDTH: 0.45
N9958 ; LAYER_HEIGHT: 0.2
N9959 G1 F4421.739
N9960 M204 S8000
N9961 G1 X158.916 Y200.639 E1.03439
N9962 G1 X158.916 Y127.036 E2.36678
N9963 G1 X191.084 Y127.036 E1.03439
N9964 G1 X191.084 Y200.579 E2.36485
N9965 ; COOLING_NODE: 0
N9966 M204 S10000
N9967 G1 X191.491 Y201.046 F60000
N9968 G1 F4421.739
N9969 M204 S8000
N9970 G1 X158.509 Y201.046 E1.06057
N9971 G1 X158.509 Y126.629 E2.39296
N9972 G1 X191.491 Y126.629 E1.06057
N9973 G1 X191.491 Y200.986 E2.39103
N9974 ; COOLING_NODE: 0
N9975 M204 S10000
N9976 G1 X191.898 Y201.453 F60000
N9977 G1 F4421.739
N9978 M204 S8000
N9979 G1 X158.102 Y201.453 E1.08675
N9980 G1 X158.102 Y126.222 E2.41914
N9981 G1 X191.898 Y126.222 E1.08675
N9982 G1 X191.898 Y201.393 E2.41721
N9983 ; COOLING_NODE: 0
N9984 M204 S10000
N9985 M73 P66 R18
N9986 G1 X192.29 Y201.845 F60000
N9987 ; FEATURE: Outer wall
N9988 ; LINE_WIDTH: 0.42
N9989 G1 F4773.528
N9990 M204 S5000
N9991 G1 X157.71 Y201.845 E1.03002
N9992 G1 X157.71 Y125.83 E2.26421
N9993 G1 X192.29 Y125.83 E1.03002
N9994 G1 X192.29 Y201.785 E2.26243
N9995 G1 E-.8 F1800
N9996 M204 S10000
N9997 G1 X185.248 Y200.29 Z7.6 F60000
N9998 G1 Z7.2
N9999 G1 E.8 F1800
N10000 ; FEATURE: Sparse infill
N10001 ; LINE_WIDTH: 0.45
N10002 G1 F4421.739
N10003 M204 S8000
N10004 G1 X190.736 Y179.811 E.68177
N10005 G1 X190.736 Y178.183 E.05236
N10006 M204 S10000
N10007 G1 X190.736 Y188.55 F60000
N10008 G1 F4421.739
N10009 M204 S8000
N10010 G1 X190.736 Y190.178 E.05236
N10011 G1 X159.264 Y198.611 E1.0477
N10012 G1 X159.264 Y198.472 E.00448
N10013 G1 X161.083 Y200.29 E.0827
N10014 G1 X159.962 Y200.29 E.03606
N10015 G1 X179.497 Y127.385 E2.42708
N10016 G1 X180.289 Y127.385 E.02548
N10017 G1 X190.736 Y137.831 E.47507
N10018 G1 X190.736 Y139.606 E.05706
N10019 G1 X159.264 Y148.038 E1.0477
N10020 G1 X159.264 Y140.902 E.22948
N10021 G1 X190.736 Y172.373 E1.43118
N10022 G1 X190.736 Y173.321 E.03047
N10023 G1 X159.264 Y181.753 E1.04769
N10024 G1 X159.264 Y175.444 E.20289
N10025 G1 X184.111 Y200.29 E1.12992
N10026 G1 X184.454 Y200.29 E.01102
N10027 G1 X190.736 Y198.607 E.20913
N10028 G1 X190.736 Y195.401 E.1031
N10029 G1 X159.264 Y163.93 E1.43118
N10030 G1 X159.264 Y164.896 E.03106
N10031 G1 X190.736 Y156.463 E1.0477
N10032 G1 X190.736 Y154.835 E.05236
N10033 M204 S10000
N10034 G1 X190.736 Y149.345 F60000
N10035 G1 F4421.739
N10036 M204 S8000
N10037 M73 P66 R17
N10038 G1 X168.775 Y127.385 E.99867
N10039 G1 X171.068 Y127.385 E.07373
N10040 G1 X159.264 Y171.436 E1.4665
N10041 G1 X159.264 Y173.325 E.06073
N10042 G1 X190.736 Y164.892 E1.0477
N10043 G1 X190.736 Y160.859 E.12968
N10044 G1 X159.264 Y129.388 E1.43118
N10045 G1 X159.264 Y131.181 E.05764
N10046 G1 X173.431 Y127.385 E.47162
N10047 G1 X175.059 Y127.385 E.05236
N10048 M204 S10000
N10049 G1 X164.267 Y127.385 F60000
N10050 G1 F4421.739
N10051 M204 S8000
N10052 G1 X162.639 Y127.385 E.05236
N10053 G1 X159.264 Y139.979 E.41928
N10054 G1 X159.264 Y139.609 E.01189
N10055 G1 X190.736 Y131.177 E1.0477
N10056 G1 X190.736 Y127.385 E.12194
N10057 G1 X187.926 Y127.385 E.09036
N10058 G1 X168.391 Y200.29 E2.42708
N10059 G1 X172.597 Y200.29 E.13527
N10060 G1 X159.264 Y186.958 E.60631
N10061 G1 X159.264 Y190.182 E.10369
N10062 G1 X190.736 Y181.75 E1.0477
N10063 G1 X190.736 Y183.887 E.06873
N10064 G1 X159.264 Y152.416 E1.43118
N10065 G1 X159.264 Y156.467 E.13027
N10066 G1 X190.736 Y148.034 E1.0477
N10067 G1 X190.736 Y148.354 E.01029
N10068 G1 X176.819 Y200.29 E1.72899
N10069 G1 X178.448 Y200.29 E.05236
N10070 ; WIPE_START
N10071 G1 X176.819 Y200.29 E-.61876
N10072 G1 X176.916 Y199.931 E-.14124
N10073 ; WIPE_END
N10074 G1 E-.04 F1800
N10075 M204 S10000
N10076 G17
N10077 G3 Z7.6 I1.217 J0 P1  F60000
N10078 ; stop printing object, unique label id: 229
N10079 M625
N10080 ; object ids of layer 36 start: 229
N10081 M624 AQAAAAAAAAA=
N10082 ;======== H2D 20250527========
N10083 ; SKIPPABLE_START
N10084 ; SKIPTYPE: timelapse
N10085 M622.1 S1 ; for prev firware, default turned on
N10086 
N10087 M1002 judge_flag timelapse_record_flag
N10088 
N10089 M622 J1
N10090 M993 A2 B2 C2
N10091 M993 A0 B0 C0
N10092 
N10093 
N10094 
N10095 
N10096     M9711 M0 E1 X260 Y141 Z7.6 S11 C10 O0 T3000
N10097 
N10098 
N10099 
N10100 M993 A3 B3 C3
N10101 
N10102 M623
N10103 ; SKIPPABLE_END
N10104 
N10105 ; object ids of this layer36 end: 229
N10106 M625
N10107 ; CHANGE_LAYER
N10108 ; Z_HEIGHT: 7.4
N10109 ; LAYER_HEIGHT: 0.2
N10110 ;======== H2D 20250521========
N10111 ; layer num/total_layer_count: 37/63
N10112 ; update layer progress
N10113 M73 L37
N10114 M991 S0 P36 ;notify layer change
N10115 
N10116 
N10117 ; OBJECT_ID: 229
N10118 ; COOLING_NODE: 0
N10119 ; start printing object, unique label id: 229
N10120 M624 AQAAAAAAAAA=
N10121 G1 X191.084 Y200.639 F60000
N10122 G1 Z7.4
N10123 G1 E.8 F1800
N10124 ; FEATURE: Inner wall
N10125 ; LINE_WIDTH: 0.45
N10126 ; LAYER_HEIGHT: 0.2
N10127 G1 F4421.739
N10128 M204 S8000
N10129 G1 X158.916 Y200.639 E1.03439
N10130 G1 X158.916 Y127.036 E2.36678
N10131 G1 X191.084 Y127.036 E1.03439
N10132 G1 X191.084 Y200.579 E2.36485
N10133 ; COOLING_NODE: 0
N10134 M204 S10000
N10135 G1 X191.491 Y201.046 F60000
N10136 G1 F4421.739
N10137 M204 S8000
N10138 G1 X158.509 Y201.046 E1.06057
N10139 G1 X158.509 Y126.629 E2.39296
N10140 G1 X191.491 Y126.629 E1.06057
N10141 G1 X191.491 Y200.986 E2.39103
N10142 ; COOLING_NODE: 0
N10143 M204 S10000
N10144 G1 X191.898 Y201.453 F60000
N10145 G1 F4421.739
N10146 M204 S8000
N10147 G1 X158.102 Y201.453 E1.08675
N10148 G1 X158.102 Y126.222 E2.41914
N10149 G1 X191.898 Y126.222 E1.08675
N10150 G1 X191.898 Y201.393 E2.41721
N10151 ; COOLING_NODE: 0
N10152 M204 S10000
N10153 G1 X192.29 Y201.845 F60000
N10154 ; FEATURE: Outer wall
N10155 ; LINE_WIDTH: 0.42
N10156 G1 F4773.528
N10157 M204 S5000
N10158 G1 X157.71 Y201.845 E1.03002
N10159 G1 X157.71 Y125.83 E2.26421
N10160 G1 X192.29 Y125.83 E1.03002
N10161 G1 X192.29 Y201.785 E2.26243
N10162 G1 E-.8 F1800
N10163 M204 S10000
N10164 G1 X184.748 Y200.612 Z7.8 F60000
N10165 G1 X182.683 Y200.29 Z7.8
N10166 G1 Z7.4
N10167 G1 E.8 F1800
N10168 ; FEATURE: Sparse infill
N10169 ; LINE_WIDTH: 0.45
N10170 G1 F4421.739
N10171 M204 S8000
N10172 G1 X184.311 Y200.29 E.05236
N10173 G1 X159.264 Y175.244 E1.13901
N10174 G1 X159.264 Y173.471 E.05701
N10175 G1 X190.736 Y165.038 E1.0477
N10176 G1 X190.736 Y166.667 E.05236
N10177 M204 S10000
N10178 G1 X190.736 Y177.636 F60000
N10179 G1 F4421.739
N10180 M204 S8000
N10181 G1 X190.736 Y179.265 E.05236
N10182 G1 X185.102 Y200.29 E.69996
N10183 G1 X185 Y200.29 E.00326
N10184 G1 X190.736 Y198.754 E.19093
N10185 G1 X190.736 Y195.201 E.11424
N10186 G1 X159.264 Y163.73 E1.43118
N10187 G1 X159.264 Y165.042 E.0422
N10188 G1 X190.736 Y156.61 E1.0477
N10189 M73 P67 R17
N10190 G1 X190.736 Y160.659 E.13022
N10191 G1 X159.264 Y129.188 E1.43118
N10192 G1 X159.264 Y131.327 E.06878
N10193 G1 X173.977 Y127.385 E.48981
N10194 G1 X175.606 Y127.385 E.05236
N10195 M204 S10000
N10196 G1 X164.121 Y127.385 F60000
N10197 G1 F4421.739
N10198 M204 S8000
N10199 G1 X162.493 Y127.385 E.05236
N10200 G1 X159.264 Y139.433 E.40109
N10201 G1 X159.264 Y139.756 E.01039
N10202 G1 X190.736 Y131.323 E1.04769
N10203 G1 X190.736 Y127.385 E.12665
N10204 G1 X187.779 Y127.385 E.09507
N10205 G1 X168.244 Y200.29 E2.42708
N10206 G1 X166.616 Y200.29 E.05236
N10207 M204 S10000
N10208 G1 X190.736 Y188.696 F60000
N10209 G1 F4421.739
N10210 M204 S8000
N10211 G1 X190.736 Y190.325 E.05236
N10212 G1 X159.264 Y198.757 E1.0477
N10213 G1 X159.264 Y198.272 E.01562
N10214 G1 X161.283 Y200.29 E.0918
N10215 G1 X159.815 Y200.29 E.0472
N10216 G1 X179.35 Y127.385 E2.42708
N10217 G1 X180.489 Y127.385 E.03662
N10218 G1 X190.736 Y137.631 E.46597
N10219 G1 X190.736 Y139.752 E.0682
N10220 G1 X159.264 Y148.185 E1.0477
N10221 G1 X159.264 Y152.216 E.12963
N10222 G1 X190.736 Y183.687 E1.43118
N10223 G1 X190.736 Y181.896 E.05759
N10224 G1 X159.264 Y190.329 E1.0477
N10225 G1 X159.264 Y186.758 E.11483
N10226 G1 X172.797 Y200.29 E.61541
N10227 G1 X176.673 Y200.29 E.12463
N10228 G1 X190.736 Y147.808 E1.74718
N10229 G1 X190.736 Y148.181 E.01199
N10230 G1 X159.264 Y156.613 E1.0477
N10231 G1 X159.264 Y158.242 E.05236
N10232 M204 S10000
N10233 G1 X159.264 Y142.33 F60000
N10234 G1 F4421.739
N10235 M204 S8000
N10236 G1 X159.264 Y140.702 E.05236
N10237 G1 X190.736 Y172.173 E1.43118
N10238 G1 X190.736 Y173.467 E.04161
N10239 G1 X159.264 Y181.9 E1.04769
N10240 G1 X159.264 Y180.271 E.05236
N10241 M204 S10000
N10242 G1 X159.264 Y172.518 F60000
N10243 G1 F4421.739
N10244 M204 S8000
N10245 G1 X159.264 Y170.889 E.05236
N10246 G1 X170.922 Y127.385 E1.44831
N10247 G1 X168.975 Y127.385 E.06259
N10248 G1 X190.736 Y149.145 E.98958
N10249 G1 X190.736 Y150.773 E.05236
N10250 ; WIPE_START
N10251 G1 X190.736 Y149.145 E-.61876
N10252 G1 X190.473 Y148.882 E-.14124
N10253 ; WIPE_END
N10254 G1 E-.04 F1800
N10255 M204 S10000
N10256 G17
N10257 G3 Z7.8 I1.217 J0 P1  F60000
N10258 ; stop printing object, unique label id: 229
N10259 M625
N10260 ; object ids of layer 37 start: 229
N10261 M624 AQAAAAAAAAA=
N10262 ;======== H2D 20250527========
N10263 ; SKIPPABLE_START
N10264 ; SKIPTYPE: timelapse
N10265 M622.1 S1 ; for prev firware, default turned on
N10266 
N10267 M1002 judge_flag timelapse_record_flag
N10268 
N10269 M622 J1
N10270 M993 A2 B2 C2
N10271 M993 A0 B0 C0
N10272 
N10273 
N10274 
N10275 
N10276     M9711 M0 E1 X260 Y141 Z7.8 S11 C10 O0 T3000
N10277 
N10278 
N10279 
N10280 M993 A3 B3 C3
N10281 
N10282 M623
N10283 ; SKIPPABLE_END
N10284 
N10285 ; object ids of this layer37 end: 229
N10286 M625
N10287 ; CHANGE_LAYER
N10288 ; Z_HEIGHT: 7.6
N10289 ; LAYER_HEIGHT: 0.2
N10290 ;======== H2D 20250521========
N10291 ; layer num/total_layer_count: 38/63
N10292 ; update layer progress
N10293 M73 L38
N10294 M991 S0 P37 ;notify layer change
N10295 
N10296 
N10297 ; OBJECT_ID: 229
N10298 ; COOLING_NODE: 0
N10299 ; start printing object, unique label id: 229
N10300 M624 AQAAAAAAAAA=
N10301 G1 X191.084 Y200.639 F60000
N10302 G1 Z7.6
N10303 G1 E.8 F1800
N10304 ; FEATURE: Inner wall
N10305 ; LINE_WIDTH: 0.45
N10306 ; LAYER_HEIGHT: 0.2
N10307 G1 F4421.739
N10308 M204 S8000
N10309 G1 X158.916 Y200.639 E1.03439
N10310 G1 X158.916 Y127.036 E2.36678
N10311 G1 X191.084 Y127.036 E1.03439
N10312 G1 X191.084 Y200.579 E2.36485
N10313 ; COOLING_NODE: 0
N10314 M204 S10000
N10315 G1 X191.491 Y201.046 F60000
N10316 G1 F4421.739
N10317 M204 S8000
N10318 G1 X158.509 Y201.046 E1.06057
N10319 G1 X158.509 Y126.629 E2.39296
N10320 G1 X191.491 Y126.629 E1.06057
N10321 G1 X191.491 Y200.986 E2.39103
N10322 ; COOLING_NODE: 0
N10323 M204 S10000
N10324 G1 X191.898 Y201.453 F60000
N10325 G1 F4421.739
N10326 M204 S8000
N10327 G1 X158.102 Y201.453 E1.08675
N10328 G1 X158.102 Y126.222 E2.41914
N10329 G1 X191.898 Y126.222 E1.08675
N10330 G1 X191.898 Y201.393 E2.41721
N10331 ; COOLING_NODE: 0
N10332 M204 S10000
N10333 G1 X192.29 Y201.845 F60000
N10334 ; FEATURE: Outer wall
N10335 ; LINE_WIDTH: 0.42
N10336 G1 F4773.528
N10337 M204 S5000
N10338 G1 X157.71 Y201.845 E1.03002
N10339 G1 X157.71 Y125.83 E2.26421
N10340 G1 X192.29 Y125.83 E1.03002
N10341 G1 X192.29 Y201.785 E2.26243
N10342 G1 E-.8 F1800
N10343 M204 S10000
N10344 G1 X185.159 Y200.29 Z8 F60000
N10345 G1 Z7.6
N10346 G1 E.8 F1800
N10347 ; FEATURE: Sparse infill
N10348 ; LINE_WIDTH: 0.45
N10349 G1 F4421.739
N10350 M204 S8000
N10351 G1 X185.547 Y200.29 E.01247
N10352 G1 X190.736 Y198.9 E.17274
N10353 G1 X190.736 Y195.001 E.12538
N10354 G1 X159.264 Y163.53 E1.43118
N10355 G1 X159.264 Y165.189 E.05334
N10356 G1 X190.736 Y156.756 E1.04769
N10357 G1 X190.736 Y160.459 E.11908
N10358 G1 X159.264 Y128.988 E1.43118
N10359 G1 X159.264 Y131.473 E.07992
N10360 G1 X174.524 Y127.385 E.508
N10361 G1 X176.152 Y127.385 E.05236
N10362 M204 S10000
N10363 G1 X163.975 Y127.385 F60000
N10364 G1 F4421.739
N10365 M204 S8000
N10366 G1 X162.346 Y127.385 E.05236
N10367 G1 X159.264 Y138.886 E.3829
N10368 G1 X159.264 Y139.699 E.02612
N10369 M204 S10000
N10370 G1 X159.264 Y158.388 F60000
N10371 G1 F4421.739
N10372 M204 S8000
N10373 G1 X159.264 Y156.76 E.05236
N10374 G1 X190.736 Y148.327 E1.0477
N10375 M204 S10000
N10376 G1 X190.736 Y150.573 F60000
N10377 G1 F4421.739
N10378 M204 S8000
N10379 G1 X190.736 Y148.945 E.05236
N10380 G1 X169.175 Y127.385 E.98048
N10381 G1 X170.775 Y127.385 E.05145
N10382 G1 X159.264 Y170.343 E1.43012
N10383 G1 X159.264 Y171.971 E.05236
N10384 M204 S10000
N10385 G1 X159.264 Y180.418 F60000
N10386 G1 F4421.739
N10387 M204 S8000
N10388 G1 X159.264 Y182.046 E.05236
N10389 G1 X190.736 Y173.614 E1.0477
N10390 G1 X190.736 Y171.973 E.05275
N10391 G1 X159.264 Y140.502 E1.43118
N10392 G1 X159.264 Y139.902 E.01929
N10393 G1 X190.736 Y131.47 E1.04769
N10394 G1 X190.736 Y127.385 E.13136
N10395 G1 X187.633 Y127.385 E.09978
N10396 G1 X168.098 Y200.29 E2.42708
N10397 G1 X166.469 Y200.29 E.05236
N10398 M204 S10000
N10399 G1 X190.736 Y166.813 F60000
N10400 G1 F4421.739
N10401 M204 S8000
N10402 G1 X190.736 Y165.185 E.05236
N10403 G1 X159.264 Y173.617 E1.0477
N10404 G1 X159.264 Y175.044 E.04587
N10405 G1 X184.511 Y200.29 E1.14811
N10406 G1 X184.955 Y200.29 E.01429
N10407 G1 X190.736 Y178.718 E.71815
N10408 G1 X190.736 Y177.09 E.05236
N10409 M204 S10000
N10410 G1 X190.736 Y188.843 F60000
N10411 G1 F4421.739
N10412 M204 S8000
N10413 M73 P68 R17
N10414 G1 X190.736 Y190.471 E.05236
N10415 G1 X159.264 Y198.904 E1.0477
N10416 G1 X159.264 Y198.072 E.02676
N10417 G1 X161.483 Y200.29 E.10089
N10418 G1 X159.669 Y200.29 E.05834
N10419 G1 X179.204 Y127.385 E2.42708
N10420 G1 X180.689 Y127.385 E.04776
N10421 G1 X190.736 Y137.431 E.45688
N10422 G1 X190.736 Y139.898 E.07934
N10423 G1 X159.264 Y148.331 E1.0477
N10424 G1 X159.264 Y152.016 E.11849
N10425 G1 X190.736 Y183.487 E1.43118
N10426 G1 X190.736 Y182.042 E.04645
N10427 G1 X159.264 Y190.475 E1.0477
N10428 G1 X159.264 Y186.558 E.12596
N10429 G1 X172.997 Y200.29 E.6245
N10430 G1 X176.527 Y200.29 E.1135
N10431 G1 X190.736 Y147.261 E1.76537
N10432 G1 X190.736 Y145.633 E.05236
N10433 ; WIPE_START
N10434 G1 X190.736 Y147.261 E-.61876
N10435 G1 X190.639 Y147.62 E-.14124
N10436 ; WIPE_END
N10437 G1 E-.04 F1800
N10438 M204 S10000
N10439 G17
N10440 G3 Z8 I1.217 J0 P1  F60000
N10441 ; stop printing object, unique label id: 229
N10442 M625
N10443 ; object ids of layer 38 start: 229
N10444 M624 AQAAAAAAAAA=
N10445 ;======== H2D 20250527========
N10446 ; SKIPPABLE_START
N10447 ; SKIPTYPE: timelapse
N10448 M622.1 S1 ; for prev firware, default turned on
N10449 
N10450 M1002 judge_flag timelapse_record_flag
N10451 
N10452 M622 J1
N10453 M993 A2 B2 C2
N10454 M993 A0 B0 C0
N10455 
N10456 
N10457 
N10458 
N10459     M9711 M0 E1 X260 Y141 Z8 S11 C10 O0 T3000
N10460 
N10461 
N10462 
N10463 M993 A3 B3 C3
N10464 
N10465 M623
N10466 ; SKIPPABLE_END
N10467 
N10468 ; object ids of this layer38 end: 229
N10469 M625
N10470 ; CHANGE_LAYER
N10471 ; Z_HEIGHT: 7.8
N10472 ; LAYER_HEIGHT: 0.2
N10473 ;======== H2D 20250521========
N10474 ; layer num/total_layer_count: 39/63
N10475 ; update layer progress
N10476 M73 L39
N10477 M991 S0 P38 ;notify layer change
N10478 
N10479 
N10480 ; OBJECT_ID: 229
N10481 ; COOLING_NODE: 0
N10482 ; start printing object, unique label id: 229
N10483 M624 AQAAAAAAAAA=
N10484 G1 X191.084 Y200.639 F60000
N10485 G1 Z7.8
N10486 G1 E.8 F1800
N10487 ; FEATURE: Inner wall
N10488 ; LINE_WIDTH: 0.45
N10489 ; LAYER_HEIGHT: 0.2
N10490 G1 F4421.739
N10491 M204 S8000
N10492 G1 X158.916 Y200.639 E1.03439
N10493 G1 X158.916 Y127.036 E2.36678
N10494 G1 X191.084 Y127.036 E1.03439
N10495 G1 X191.084 Y200.579 E2.36485
N10496 ; COOLING_NODE: 0
N10497 M204 S10000
N10498 G1 X191.491 Y201.046 F60000
N10499 G1 F4421.739
N10500 M204 S8000
N10501 M73 P68 R16
N10502 G1 X158.509 Y201.046 E1.06057
N10503 G1 X158.509 Y126.629 E2.39296
N10504 G1 X191.491 Y126.629 E1.06057
N10505 G1 X191.491 Y200.986 E2.39103
N10506 ; COOLING_NODE: 0
N10507 M204 S10000
N10508 G1 X191.898 Y201.453 F60000
N10509 G1 F4421.739
N10510 M204 S8000
N10511 G1 X158.102 Y201.453 E1.08675
N10512 G1 X158.102 Y126.222 E2.41914
N10513 G1 X191.898 Y126.222 E1.08675
N10514 G1 X191.898 Y201.393 E2.41721
N10515 ; COOLING_NODE: 0
N10516 M204 S10000
N10517 G1 X192.29 Y201.845 F60000
N10518 ; FEATURE: Outer wall
N10519 ; LINE_WIDTH: 0.42
N10520 G1 F4773.528
N10521 M204 S5000
N10522 G1 X157.71 Y201.845 E1.03002
N10523 G1 X157.71 Y125.83 E2.26421
N10524 G1 X192.29 Y125.83 E1.03002
N10525 G1 X192.29 Y201.785 E2.26243
N10526 G1 E-.8 F1800
N10527 M204 S10000
N10528 G1 X190.351 Y200.29 Z8.2 F60000
N10529 G1 Z7.8
N10530 G1 E.8 F1800
N10531 ; FEATURE: Sparse infill
N10532 ; LINE_WIDTH: 0.45
N10533 G1 F4421.739
N10534 M204 S8000
N10535 G1 X190.736 Y200.29 E.01236
N10536 G1 X190.736 Y199.046 E.04
N10537 G1 X186.093 Y200.29 E.15455
N10538 G1 X185.012 Y200.29 E.03475
N10539 M204 S10000
N10540 G1 X190.736 Y176.543 F60000
N10541 G1 F4421.739
N10542 M204 S8000
N10543 G1 X190.736 Y178.172 E.05236
N10544 G1 X184.809 Y200.29 E.73634
N10545 G1 X184.711 Y200.29 E.00315
N10546 G1 X159.264 Y174.844 E1.1572
N10547 G1 X159.264 Y173.764 E.03473
N10548 G1 X190.736 Y165.331 E1.0477
N10549 G1 X190.736 Y166.959 E.05236
N10550 M204 S10000
N10551 G1 X190.736 Y145.087 F60000
N10552 G1 F4421.739
N10553 M204 S8000
N10554 G1 X190.736 Y146.715 E.05236
N10555 G1 X176.38 Y200.29 E1.78356
N10556 G1 X173.197 Y200.29 E.10236
N10557 G1 X159.264 Y186.358 E.6336
N10558 G1 X159.264 Y182.193 E.13394
N10559 G1 X190.736 Y173.76 E1.0477
N10560 G1 X190.736 Y171.773 E.06389
N10561 G1 X159.264 Y140.302 E1.43118
N10562 G1 X159.264 Y140.049 E.00815
N10563 G1 X190.736 Y131.616 E1.0477
N10564 G1 X190.736 Y127.385 E.13606
N10565 G1 X187.486 Y127.385 E.10448
N10566 G1 X167.951 Y200.29 E2.42708
N10567 G1 X166.323 Y200.29 E.05236
N10568 M204 S10000
N10569 G1 X159.264 Y192.25 F60000
N10570 G1 F4421.739
N10571 M204 S8000
N10572 G1 X159.264 Y190.621 E.05236
N10573 G1 X190.736 Y182.189 E1.0477
N10574 G1 X190.736 Y183.287 E.03532
N10575 G1 X159.264 Y151.816 E1.43118
N10576 G1 X159.264 Y148.477 E.10735
N10577 G1 X190.736 Y140.045 E1.0477
N10578 G1 X190.736 Y137.231 E.09047
N10579 G1 X180.889 Y127.385 E.44778
N10580 G1 X179.058 Y127.385 E.0589
N10581 G1 X159.523 Y200.29 E2.42708
N10582 G1 X161.683 Y200.29 E.06948
N10583 G1 X159.264 Y197.872 E.10999
N10584 G1 X159.264 Y199.05 E.0379
N10585 G1 X190.736 Y190.618 E1.0477
N10586 G1 X190.736 Y194.801 E.13452
N10587 G1 X159.264 Y163.33 E1.43118
N10588 G1 X159.264 Y165.335 E.06448
N10589 G1 X190.736 Y156.902 E1.0477
N10590 G1 X190.736 Y160.259 E.10794
N10591 G1 X159.264 Y128.788 E1.43118
N10592 G1 X159.264 Y131.62 E.09106
N10593 G1 X175.07 Y127.385 E.52619
N10594 G1 X176.699 Y127.385 E.05236
N10595 M204 S10000
N10596 G1 X163.828 Y127.385 F60000
N10597 G1 F4421.739
N10598 M204 S8000
N10599 G1 X162.2 Y127.385 E.05236
N10600 G1 X159.264 Y138.34 E.36471
N10601 G1 X159.264 Y139.845 E.0484
N10602 M204 S10000
N10603 G1 X159.264 Y158.535 F60000
N10604 G1 F4421.739
N10605 M204 S8000
N10606 G1 X159.264 Y156.906 E.05236
N10607 G1 X190.736 Y148.474 E1.0477
N10608 G1 X190.736 Y148.745 E.00873
N10609 G1 X169.375 Y127.385 E.97139
N10610 G1 X170.629 Y127.385 E.04031
N10611 G1 X159.264 Y169.797 E1.41193
N10612 G1 X159.264 Y171.425 E.05236
N10613 ; WIPE_START
N10614 G1 X159.264 Y169.797 E-.61876
N10615 G1 X159.361 Y169.438 E-.14124
N10616 ; WIPE_END
N10617 G1 E-.04 F1800
N10618 M204 S10000
N10619 G17
N10620 G3 Z8.2 I1.217 J0 P1  F60000
N10621 ; stop printing object, unique label id: 229
N10622 M625
N10623 ; object ids of layer 39 start: 229
N10624 M624 AQAAAAAAAAA=
N10625 ;======== H2D 20250527========
N10626 ; SKIPPABLE_START
N10627 ; SKIPTYPE: timelapse
N10628 M622.1 S1 ; for prev firware, default turned on
N10629 
N10630 M1002 judge_flag timelapse_record_flag
N10631 
N10632 M622 J1
N10633 M993 A2 B2 C2
N10634 M993 A0 B0 C0
N10635 
N10636 
N10637 
N10638 
N10639     M9711 M0 E1 X260 Y141 Z8.2 S11 C10 O0 T3000
N10640 
N10641 
N10642 
N10643 M993 A3 B3 C3
N10644 
N10645 M623
N10646 ; SKIPPABLE_END
N10647 
N10648 ; object ids of this layer39 end: 229
N10649 M625
N10650 ; CHANGE_LAYER
N10651 ; Z_HEIGHT: 8
N10652 ; LAYER_HEIGHT: 0.2
N10653 ;======== H2D 20250521========
N10654 ; layer num/total_layer_count: 40/63
N10655 ; update layer progress
N10656 M73 L40
N10657 M991 S0 P39 ;notify layer change
N10658 
N10659 
N10660 ; OBJECT_ID: 229
N10661 ; COOLING_NODE: 0
N10662 ; start printing object, unique label id: 229
N10663 M624 AQAAAAAAAAA=
N10664 G1 X191.084 Y200.639 F60000
N10665 G1 Z8
N10666 G1 E.8 F1800
N10667 ; FEATURE: Inner wall
N10668 ; LINE_WIDTH: 0.45
N10669 ; LAYER_HEIGHT: 0.2
N10670 G1 F4421.739
N10671 M204 S8000
N10672 G1 X158.916 Y200.639 E1.03439
N10673 G1 X158.916 Y127.036 E2.36678
N10674 G1 X191.084 Y127.036 E1.03439
N10675 G1 X191.084 Y200.579 E2.36485
N10676 ; COOLING_NODE: 0
N10677 M204 S10000
N10678 G1 X191.491 Y201.046 F60000
N10679 G1 F4421.739
N10680 M204 S8000
N10681 M73 P69 R16
N10682 G1 X158.509 Y201.046 E1.06057
N10683 G1 X158.509 Y126.629 E2.39296
N10684 G1 X191.491 Y126.629 E1.06057
N10685 G1 X191.491 Y200.986 E2.39103
N10686 ; COOLING_NODE: 0
N10687 M204 S10000
N10688 G1 X191.898 Y201.453 F60000
N10689 G1 F4421.739
N10690 M204 S8000
N10691 G1 X158.102 Y201.453 E1.08675
N10692 G1 X158.102 Y126.222 E2.41914
N10693 G1 X191.898 Y126.222 E1.08675
N10694 G1 X191.898 Y201.393 E2.41721
N10695 ; COOLING_NODE: 0
N10696 M204 S10000
N10697 G1 X192.29 Y201.845 F60000
N10698 ; FEATURE: Outer wall
N10699 ; LINE_WIDTH: 0.42
N10700 G1 F4773.528
N10701 M204 S5000
N10702 G1 X157.71 Y201.845 E1.03002
N10703 G1 X157.71 Y125.83 E2.26421
N10704 G1 X192.29 Y125.83 E1.03002
N10705 G1 X192.29 Y201.785 E2.26243
N10706 G1 E-.8 F1800
N10707 M204 S10000
N10708 G1 X190.736 Y197.564 Z8.4 F60000
N10709 G1 Z8
N10710 G1 E.8 F1800
N10711 ; FEATURE: Sparse infill
N10712 ; LINE_WIDTH: 0.45
N10713 G1 F4421.739
N10714 M204 S8000
N10715 G1 X190.736 Y199.193 E.05236
N10716 G1 X186.639 Y200.29 E.13636
N10717 G1 X185.114 Y200.29 E.04904
N10718 M204 S10000
N10719 G1 X190.736 Y175.997 F60000
N10720 G1 F4421.739
N10721 M204 S8000
N10722 G1 X190.736 Y177.625 E.05236
N10723 G1 X184.662 Y200.29 E.75453
N10724 G1 X184.911 Y200.29 E.00799
N10725 G1 X159.264 Y174.644 E1.1663
N10726 G1 X159.264 Y173.91 E.02359
N10727 G1 X190.736 Y165.478 E1.0477
N10728 G1 X190.736 Y167.106 E.05236
N10729 M204 S10000
N10730 G1 X190.736 Y144.54 F60000
N10731 G1 F4421.739
N10732 M204 S8000
N10733 G1 X190.736 Y146.169 E.05236
N10734 G1 X176.234 Y200.29 E1.80175
N10735 G1 X173.397 Y200.29 E.09122
N10736 G1 X159.264 Y186.158 E.64269
N10737 G1 X159.264 Y182.339 E.1228
N10738 G1 X190.736 Y173.906 E1.0477
N10739 G1 X190.736 Y171.573 E.07503
N10740 G1 X159.264 Y140.102 E1.43118
N10741 G1 X159.264 Y140.195 E.00299
N10742 G1 X190.736 Y131.762 E1.0477
N10743 G1 X190.736 Y127.385 E.14077
N10744 G1 X187.34 Y127.385 E.10919
N10745 G1 X167.805 Y200.29 E2.42708
N10746 G1 X166.177 Y200.29 E.05236
N10747 M204 S10000
N10748 G1 X159.264 Y192.396 F60000
N10749 G1 F4421.739
N10750 M204 S8000
N10751 G1 X159.264 Y190.768 E.05236
N10752 G1 X190.736 Y182.335 E1.04769
N10753 G1 X190.736 Y183.087 E.02418
N10754 G1 X159.264 Y151.616 E1.43118
N10755 G1 X159.264 Y148.624 E.09621
N10756 G1 X190.736 Y140.191 E1.0477
N10757 G1 X190.736 Y137.031 E.10161
N10758 G1 X181.089 Y127.385 E.43868
N10759 G1 X178.911 Y127.385 E.07003
N10760 G1 X159.376 Y200.29 E2.42708
N10761 G1 X161.883 Y200.29 E.08062
N10762 G1 X159.264 Y197.672 E.11908
N10763 G1 X159.264 Y199.197 E.04904
N10764 G1 X190.736 Y190.764 E1.0477
N10765 G1 X190.736 Y194.601 E.12338
N10766 G1 X159.264 Y163.13 E1.43118
N10767 G1 X159.264 Y165.481 E.07562
N10768 G1 X190.736 Y157.049 E1.0477
N10769 G1 X190.736 Y160.059 E.0968
N10770 G1 X159.264 Y128.588 E1.43118
N10771 G1 X159.264 Y131.766 E.1022
N10772 G1 X175.617 Y127.385 E.54438
N10773 G1 X177.245 Y127.385 E.05236
N10774 M204 S10000
N10775 G1 X163.682 Y127.385 F60000
N10776 G1 F4421.739
N10777 M204 S8000
N10778 G1 X162.054 Y127.385 E.05236
N10779 G1 X159.264 Y137.794 E.34652
N10780 G1 X159.264 Y139.422 E.05236
N10781 M204 S10000
N10782 G1 X159.264 Y158.681 F60000
N10783 G1 F4421.739
N10784 M204 S8000
N10785 G1 X159.264 Y157.053 E.05236
N10786 G1 X190.736 Y148.62 E1.0477
N10787 G1 X190.736 Y148.545 E.00241
N10788 G1 X169.575 Y127.385 E.96229
N10789 G1 X170.482 Y127.385 E.02917
N10790 G1 X159.264 Y169.25 E1.39374
N10791 G1 X159.264 Y170.879 E.05236
N10792 ; WIPE_START
N10793 G1 X159.264 Y169.25 E-.61876
N10794 G1 X159.361 Y168.891 E-.14124
N10795 ; WIPE_END
N10796 G1 E-.04 F1800
N10797 M204 S10000
N10798 G17
N10799 G3 Z8.4 I1.217 J0 P1  F60000
N10800 ; stop printing object, unique label id: 229
N10801 M625
N10802 ; object ids of layer 40 start: 229
N10803 M624 AQAAAAAAAAA=
N10804 ;======== H2D 20250527========
N10805 ; SKIPPABLE_START
N10806 ; SKIPTYPE: timelapse
N10807 M622.1 S1 ; for prev firware, default turned on
N10808 
N10809 M1002 judge_flag timelapse_record_flag
N10810 
N10811 M622 J1
N10812 M993 A2 B2 C2
N10813 M993 A0 B0 C0
N10814 
N10815 
N10816 
N10817 
N10818     M9711 M0 E1 X260 Y141 Z8.4 S11 C10 O0 T3000
N10819 
N10820 
N10821 
N10822 M993 A3 B3 C3
N10823 
N10824 M623
N10825 ; SKIPPABLE_END
N10826 
N10827 ; object ids of this layer40 end: 229
N10828 M625
N10829 ; CHANGE_LAYER
N10830 ; Z_HEIGHT: 8.2
N10831 ; LAYER_HEIGHT: 0.2
N10832 ;======== H2D 20250521========
N10833 ; layer num/total_layer_count: 41/63
N10834 ; update layer progress
N10835 M73 L41
N10836 M991 S0 P40 ;notify layer change
N10837 
N10838 
N10839 ; OBJECT_ID: 229
N10840 ; COOLING_NODE: 0
N10841 ; start printing object, unique label id: 229
N10842 M624 AQAAAAAAAAA=
N10843 G1 X191.084 Y200.639 F60000
N10844 G1 Z8.2
N10845 G1 E.8 F1800
N10846 ; FEATURE: Inner wall
N10847 ; LINE_WIDTH: 0.45
N10848 ; LAYER_HEIGHT: 0.2
N10849 G1 F4421.739
N10850 M204 S8000
N10851 G1 X158.916 Y200.639 E1.03439
N10852 G1 X158.916 Y127.036 E2.36678
N10853 G1 X191.084 Y127.036 E1.03439
N10854 G1 X191.084 Y200.579 E2.36485
N10855 ; COOLING_NODE: 0
N10856 M204 S10000
N10857 G1 X191.491 Y201.046 F60000
N10858 G1 F4421.739
N10859 M204 S8000
N10860 G1 X158.509 Y201.046 E1.06057
N10861 G1 X158.509 Y126.629 E2.39296
N10862 G1 X191.491 Y126.629 E1.06057
N10863 G1 X191.491 Y200.986 E2.39103
N10864 ; COOLING_NODE: 0
N10865 M204 S10000
N10866 G1 X191.898 Y201.453 F60000
N10867 G1 F4421.739
N10868 M204 S8000
N10869 G1 X158.102 Y201.453 E1.08675
N10870 G1 X158.102 Y126.222 E2.41914
N10871 G1 X191.898 Y126.222 E1.08675
N10872 G1 X191.898 Y201.393 E2.41721
N10873 ; COOLING_NODE: 0
N10874 M204 S10000
N10875 G1 X192.29 Y201.845 F60000
N10876 ; FEATURE: Outer wall
N10877 ; LINE_WIDTH: 0.42
N10878 G1 F4773.528
N10879 M204 S5000
N10880 G1 X157.71 Y201.845 E1.03002
N10881 M73 P70 R16
N10882 G1 X157.71 Y125.83 E2.26421
N10883 G1 X192.29 Y125.83 E1.03002
N10884 G1 X192.29 Y201.785 E2.26243
N10885 G1 E-.8 F1800
N10886 M204 S10000
N10887 G1 X190.736 Y197.711 Z8.6 F60000
N10888 G1 Z8.2
N10889 M73 P70 R15
N10890 G1 E.8 F1800
N10891 ; FEATURE: Sparse infill
N10892 ; LINE_WIDTH: 0.45
N10893 G1 F4421.739
N10894 M204 S8000
N10895 G1 X190.736 Y199.339 E.05236
N10896 G1 X187.186 Y200.29 E.11817
N10897 G1 X185.557 Y200.29 E.05236
N10898 M204 S10000
N10899 G1 X190.736 Y175.451 F60000
N10900 G1 F4421.739
N10901 M204 S8000
N10902 G1 X190.736 Y177.079 E.05236
N10903 G1 X184.516 Y200.29 E.77272
N10904 G1 X185.111 Y200.29 E.01913
N10905 G1 X159.264 Y174.444 E1.17539
N10906 G1 X159.264 Y174.057 E.01245
N10907 G1 X190.736 Y165.624 E1.04769
N10908 G1 X190.736 Y163.996 E.05236
N10909 M204 S10000
N10910 G1 X190.736 Y143.994 F60000
N10911 G1 F4421.739
N10912 M204 S8000
N10913 G1 X190.736 Y145.622 E.05236
N10914 G1 X176.087 Y200.29 E1.81994
N10915 G1 X173.597 Y200.29 E.08008
N10916 G1 X159.264 Y185.958 E.65179
N10917 G1 X159.264 Y182.485 E.11166
N10918 G1 X190.736 Y174.053 E1.0477
N10919 G1 X190.736 Y171.373 E.08617
N10920 G1 X159.264 Y139.902 E1.43118
N10921 G1 X159.264 Y140.341 E.01413
N10922 G1 X190.736 Y131.909 E1.0477
N10923 G1 X190.736 Y127.385 E.14548
N10924 G1 X187.193 Y127.385 E.1139
N10925 G1 X167.658 Y200.29 E2.42708
N10926 G1 X169.287 Y200.29 E.05236
N10927 M204 S10000
N10928 G1 X159.264 Y189.286 F60000
N10929 G1 F4421.739
N10930 M204 S8000
N10931 G1 X159.264 Y190.914 E.05236
N10932 G1 X190.736 Y182.482 E1.0477
N10933 G1 X190.736 Y182.887 E.01304
N10934 G1 X159.264 Y151.416 E1.43118
N10935 G1 X159.264 Y148.77 E.08507
N10936 G1 X190.736 Y140.338 E1.04769
N10937 G1 X190.736 Y136.831 E.11275
N10938 G1 X181.289 Y127.385 E.42959
N10939 G1 X178.765 Y127.385 E.08117
N10940 G1 X159.264 Y200.161 E2.42276
N10941 G1 X159.264 Y200.29 E.00417
N10942 G1 X162.083 Y200.29 E.09064
N10943 G1 X159.264 Y197.472 E.12818
N10944 G1 X159.264 Y195.843 E.05236
N10945 M204 S10000
N10946 G1 X159.264 Y199.343 F60000
N10947 G1 F4421.739
N10948 M204 S8000
N10949 G1 X190.736 Y190.91 E1.0477
N10950 G1 X190.736 Y194.401 E.11224
N10951 G1 X159.264 Y162.93 E1.43118
N10952 G1 X159.264 Y165.628 E.08676
N10953 G1 X190.736 Y157.195 E1.0477
N10954 G1 X190.736 Y159.859 E.08566
N10955 G1 X159.264 Y128.388 E1.43118
N10956 G1 X159.264 Y131.913 E.11334
N10957 G1 X176.163 Y127.385 E.56257
N10958 G1 X177.791 Y127.385 E.05236
N10959 M204 S10000
N10960 G1 X163.535 Y127.385 F60000
N10961 G1 F4421.739
N10962 M204 S8000
N10963 G1 X161.907 Y127.385 E.05236
N10964 G1 X159.264 Y137.247 E.32833
N10965 G1 X159.264 Y138.875 E.05236
N10966 M204 S10000
N10967 G1 X159.264 Y155.571 F60000
N10968 G1 F4421.739
N10969 M204 S8000
N10970 G1 X159.264 Y157.199 E.05236
N10971 G1 X190.736 Y148.766 E1.0477
N10972 G1 X190.736 Y148.345 E.01355
N10973 G1 X169.775 Y127.385 E.9532
N10974 G1 X170.336 Y127.385 E.01803
N10975 G1 X159.264 Y168.704 E1.37554
N10976 G1 X159.264 Y170.332 E.05236
N10977 ; WIPE_START
N10978 G1 X159.264 Y168.704 E-.61876
N10979 G1 X159.361 Y168.345 E-.14124
N10980 ; WIPE_END
N10981 G1 E-.04 F1800
N10982 M204 S10000
N10983 G17
N10984 G3 Z8.6 I1.217 J0 P1  F60000
N10985 ; stop printing object, unique label id: 229
N10986 M625
N10987 ; object ids of layer 41 start: 229
N10988 M624 AQAAAAAAAAA=
N10989 ;======== H2D 20250527========
N10990 ; SKIPPABLE_START
N10991 ; SKIPTYPE: timelapse
N10992 M622.1 S1 ; for prev firware, default turned on
N10993 
N10994 M1002 judge_flag timelapse_record_flag
N10995 
N10996 M622 J1
N10997 M993 A2 B2 C2
N10998 M993 A0 B0 C0
N10999 
N11000 
N11001 
N11002 
N11003     M9711 M0 E1 X260 Y141 Z8.6 S11 C10 O0 T3000
N11004 
N11005 
N11006 
N11007 M993 A3 B3 C3
N11008 
N11009 M623
N11010 ; SKIPPABLE_END
N11011 
N11012 ; object ids of this layer41 end: 229
N11013 M625
N11014 ; CHANGE_LAYER
N11015 ; Z_HEIGHT: 8.4
N11016 ; LAYER_HEIGHT: 0.2
N11017 ;======== H2D 20250521========
N11018 ; layer num/total_layer_count: 42/63
N11019 ; update layer progress
N11020 M73 L42
N11021 M991 S0 P41 ;notify layer change
N11022 
N11023 
N11024 ; OBJECT_ID: 229
N11025 ; COOLING_NODE: 0
N11026 ; start printing object, unique label id: 229
N11027 M624 AQAAAAAAAAA=
N11028 G1 X191.084 Y200.639 F60000
N11029 G1 Z8.4
N11030 G1 E.8 F1800
N11031 ; FEATURE: Inner wall
N11032 ; LINE_WIDTH: 0.45
N11033 ; LAYER_HEIGHT: 0.2
N11034 G1 F4421.739
N11035 M204 S8000
N11036 G1 X158.916 Y200.639 E1.03439
N11037 G1 X158.916 Y127.036 E2.36678
N11038 G1 X191.084 Y127.036 E1.03439
N11039 G1 X191.084 Y200.579 E2.36485
N11040 ; COOLING_NODE: 0
N11041 M204 S10000
N11042 G1 X191.491 Y201.046 F60000
N11043 G1 F4421.739
N11044 M204 S8000
N11045 G1 X158.509 Y201.046 E1.06057
N11046 G1 X158.509 Y126.629 E2.39296
N11047 G1 X191.491 Y126.629 E1.06057
N11048 G1 X191.491 Y200.986 E2.39103
N11049 ; COOLING_NODE: 0
N11050 M204 S10000
N11051 G1 X191.898 Y201.453 F60000
N11052 G1 F4421.739
N11053 M204 S8000
N11054 G1 X158.102 Y201.453 E1.08675
N11055 G1 X158.102 Y126.222 E2.41914
N11056 G1 X191.898 Y126.222 E1.08675
N11057 G1 X191.898 Y201.393 E2.41721
N11058 ; COOLING_NODE: 0
N11059 M204 S10000
N11060 G1 X192.29 Y201.845 F60000
N11061 ; FEATURE: Outer wall
N11062 ; LINE_WIDTH: 0.42
N11063 G1 F4773.528
N11064 M204 S5000
N11065 G1 X157.71 Y201.845 E1.03002
N11066 G1 X157.71 Y125.83 E2.26421
N11067 G1 X192.29 Y125.83 E1.03002
N11068 G1 X192.29 Y201.785 E2.26243
N11069 G1 E-.8 F1800
N11070 M204 S10000
N11071 G1 X190.736 Y197.857 Z8.8 F60000
N11072 G1 Z8.4
N11073 G1 E.8 F1800
N11074 ; FEATURE: Sparse infill
N11075 ; LINE_WIDTH: 0.45
N11076 G1 F4421.739
N11077 M204 S8000
N11078 G1 X190.736 Y199.486 E.05236
N11079 G1 X187.732 Y200.29 E.09998
N11080 G1 X186.104 Y200.29 E.05236
N11081 M204 S10000
N11082 G1 X159.264 Y195.643 F60000
N11083 G1 F4421.739
N11084 M204 S8000
N11085 G1 X159.264 Y197.272 E.05236
N11086 G1 X162.283 Y200.29 E.13727
N11087 G1 X167.512 Y200.29 E.16815
N11088 G1 X187.047 Y127.385 E2.42708
N11089 G1 X181.489 Y127.385 E.17873
N11090 G1 X190.736 Y136.631 E.42049
N11091 G1 X190.736 Y140.484 E.12389
N11092 G1 X159.264 Y148.917 E1.0477
N11093 G1 X159.264 Y151.216 E.07394
N11094 G1 X190.736 Y182.687 E1.43118
N11095 G1 X190.736 Y182.628 E.0019
N11096 G1 X159.264 Y191.061 E1.0477
N11097 G1 X159.264 Y189.432 E.05236
N11098 M204 S10000
N11099 G1 X159.264 Y169.786 F60000
N11100 G1 F4421.739
N11101 M204 S8000
N11102 M73 P71 R15
N11103 G1 X159.264 Y168.157 E.05236
N11104 G1 X170.189 Y127.385 E1.35735
N11105 G1 X169.975 Y127.385 E.00689
N11106 G1 X190.736 Y148.145 E.9441
N11107 G1 X190.736 Y148.913 E.02468
N11108 G1 X159.264 Y157.345 E1.0477
N11109 G1 X159.264 Y155.717 E.05236
N11110 M204 S10000
N11111 G1 X159.264 Y138.329 F60000
N11112 G1 F4421.739
N11113 M204 S8000
N11114 G1 X159.264 Y136.701 E.05236
N11115 G1 X161.761 Y127.385 E.31014
N11116 G1 X159.264 Y127.385 E.08027
N11117 G1 X159.264 Y128.188 E.02583
N11118 G1 X190.736 Y159.659 E1.43118
N11119 G1 X190.736 Y157.342 E.07452
N11120 G1 X159.264 Y165.774 E1.0477
N11121 G1 X159.264 Y162.73 E.0979
N11122 G1 X190.736 Y194.201 E1.43118
N11123 G1 X190.736 Y191.057 E.10111
N11124 G1 X159.264 Y199.489 E1.0477
N11125 G1 X159.264 Y199.614 E.00401
N11126 G1 X178.618 Y127.385 E2.40457
N11127 G1 X176.709 Y127.385 E.06138
N11128 G1 X159.264 Y132.059 E.58076
N11129 G1 X159.264 Y130.431 E.05236
N11130 M204 S10000
N11131 G1 X190.736 Y130.427 F60000
N11132 G1 F4421.739
N11133 M204 S8000
N11134 G1 X190.736 Y132.055 E.05236
N11135 G1 X159.264 Y140.488 E1.0477
N11136 G1 X159.264 Y139.702 E.02527
N11137 G1 X190.736 Y171.173 E1.43118
N11138 G1 X190.736 Y165.77 E.17373
N11139 G1 X159.264 Y174.203 E1.0477
N11140 G1 X159.264 Y174.244 E.00131
N11141 G1 X185.311 Y200.29 E1.18449
N11142 G1 X184.37 Y200.29 E.03027
N11143 G1 X190.736 Y176.533 E.79091
N11144 G1 X190.736 Y174.199 E.07503
N11145 G1 X159.264 Y182.632 E1.0477
N11146 G1 X159.264 Y185.758 E.10052
N11147 G1 X173.797 Y200.29 E.66088
N11148 G1 X175.941 Y200.29 E.06894
N11149 G1 X190.736 Y145.076 E1.83813
N11150 G1 X190.736 Y143.448 E.05236
N11151 ; WIPE_START
N11152 G1 X190.736 Y145.076 E-.61876
N11153 G1 X190.639 Y145.435 E-.14124
N11154 ; WIPE_END
N11155 G1 E-.04 F1800
N11156 M204 S10000
N11157 G17
N11158 G3 Z8.8 I1.217 J0 P1  F60000
N11159 ; stop printing object, unique label id: 229
N11160 M625
N11161 ; object ids of layer 42 start: 229
N11162 M624 AQAAAAAAAAA=
N11163 ;======== H2D 20250527========
N11164 ; SKIPPABLE_START
N11165 ; SKIPTYPE: timelapse
N11166 M622.1 S1 ; for prev firware, default turned on
N11167 
N11168 M1002 judge_flag timelapse_record_flag
N11169 
N11170 M622 J1
N11171 M993 A2 B2 C2
N11172 M993 A0 B0 C0
N11173 
N11174 
N11175 
N11176 
N11177     M9711 M0 E1 X260 Y141 Z8.8 S11 C10 O0 T3000
N11178 
N11179 
N11180 
N11181 M993 A3 B3 C3
N11182 
N11183 M623
N11184 ; SKIPPABLE_END
N11185 
N11186 ; object ids of this layer42 end: 229
N11187 M625
N11188 ; CHANGE_LAYER
N11189 ; Z_HEIGHT: 8.6
N11190 ; LAYER_HEIGHT: 0.200001
N11191 ;======== H2D 20250521========
N11192 ; layer num/total_layer_count: 43/63
N11193 ; update layer progress
N11194 M73 L43
N11195 M991 S0 P42 ;notify layer change
N11196 
N11197 
N11198 ; OBJECT_ID: 229
N11199 ; COOLING_NODE: 0
N11200 ; start printing object, unique label id: 229
N11201 M624 AQAAAAAAAAA=
N11202 G1 X191.084 Y200.639 F60000
N11203 G1 Z8.6
N11204 G1 E.8 F1800
N11205 ; FEATURE: Inner wall
N11206 ; LINE_WIDTH: 0.45
N11207 ; LAYER_HEIGHT: 0.2
N11208 G1 F4421.739
N11209 M204 S8000
N11210 G1 X158.916 Y200.639 E1.03439
N11211 G1 X158.916 Y127.036 E2.36678
N11212 G1 X191.084 Y127.036 E1.03439
N11213 G1 X191.084 Y200.579 E2.36485
N11214 ; COOLING_NODE: 0
N11215 M204 S10000
N11216 G1 X191.491 Y201.046 F60000
N11217 G1 F4421.739
N11218 M204 S8000
N11219 G1 X158.509 Y201.046 E1.06057
N11220 G1 X158.509 Y126.629 E2.39296
N11221 G1 X191.491 Y126.629 E1.06057
N11222 G1 X191.491 Y200.986 E2.39103
N11223 ; COOLING_NODE: 0
N11224 M204 S10000
N11225 G1 X191.898 Y201.453 F60000
N11226 G1 F4421.739
N11227 M204 S8000
N11228 G1 X158.102 Y201.453 E1.08675
N11229 G1 X158.102 Y126.222 E2.41914
N11230 G1 X191.898 Y126.222 E1.08675
N11231 G1 X191.898 Y201.393 E2.41721
N11232 ; COOLING_NODE: 0
N11233 M204 S10000
N11234 G1 X192.29 Y201.845 F60000
N11235 ; FEATURE: Outer wall
N11236 ; LINE_WIDTH: 0.42
N11237 G1 F4773.528
N11238 M204 S5000
N11239 G1 X157.71 Y201.845 E1.03002
N11240 G1 X157.71 Y125.83 E2.26421
N11241 G1 X192.29 Y125.83 E1.03002
N11242 G1 X192.29 Y201.785 E2.26243
N11243 G1 E-.8 F1800
N11244 M204 S10000
N11245 G1 X190.736 Y198.004 Z9 F60000
N11246 G1 Z8.6
N11247 G1 E.8 F1800
N11248 ; FEATURE: Sparse infill
N11249 ; LINE_WIDTH: 0.45
N11250 G1 F4421.739
N11251 M204 S8000
N11252 G1 X190.736 Y199.632 E.05236
N11253 G1 X188.279 Y200.29 E.08179
N11254 G1 X186.65 Y200.29 E.05236
N11255 M204 S10000
N11256 G1 X159.264 Y195.443 F60000
N11257 G1 F4421.739
N11258 M204 S8000
N11259 G1 X159.264 Y197.072 E.05236
N11260 G1 X162.483 Y200.29 E.14637
N11261 G1 X167.366 Y200.29 E.15701
N11262 G1 X186.901 Y127.385 E2.42708
N11263 G1 X181.689 Y127.385 E.16759
N11264 G1 X190.736 Y136.431 E.4114
N11265 G1 X190.736 Y132.202 E.13601
N11266 G1 X159.264 Y140.634 E1.0477
N11267 G1 X159.264 Y139.502 E.03641
N11268 G1 X190.736 Y170.973 E1.43118
N11269 G1 X190.736 Y165.917 E.16259
N11270 G1 X159.264 Y174.349 E1.0477
N11271 G1 X159.264 Y174.044 E.00983
N11272 G1 X185.511 Y200.29 E1.19359
N11273 G1 X184.223 Y200.29 E.04141
N11274 G1 X190.736 Y175.986 E.8091
N11275 G1 X190.736 Y174.346 E.05275
N11276 G1 X159.264 Y182.778 E1.0477
N11277 G1 X159.264 Y185.558 E.08938
N11278 G1 X173.997 Y200.29 E.66998
N11279 G1 X175.794 Y200.29 E.0578
N11280 G1 X190.736 Y144.529 E1.85632
N11281 G1 X190.736 Y140.63 E.12538
N11282 G1 X159.264 Y149.063 E1.0477
N11283 G1 X159.264 Y151.016 E.0628
N11284 G1 X190.736 Y182.487 E1.43118
N11285 G1 X190.736 Y182.774 E.00924
N11286 G1 X159.264 Y191.207 E1.0477
N11287 G1 X159.264 Y189.579 E.05236
N11288 M204 S10000
N11289 G1 X159.264 Y169.239 F60000
N11290 G1 F4421.739
N11291 M204 S8000
N11292 G1 X159.264 Y167.611 E.05236
N11293 G1 X170.043 Y127.385 E1.33916
N11294 G1 X170.175 Y127.385 E.00424
N11295 G1 X190.736 Y147.945 E.93501
N11296 G1 X190.736 Y149.059 E.03582
N11297 G1 X159.264 Y157.492 E1.0477
N11298 G1 X159.264 Y155.864 E.05236
N11299 M204 S10000
N11300 M73 P71 R14
N11301 G1 X159.264 Y137.783 F60000
N11302 G1 F4421.739
N11303 M204 S8000
N11304 G1 X159.264 Y136.154 E.05236
N11305 G1 X161.614 Y127.385 E.29195
N11306 G1 X159.264 Y127.385 E.07556
N11307 G1 X159.264 Y127.988 E.0194
N11308 G1 X190.736 Y159.459 E1.43118
N11309 G1 X190.736 Y157.488 E.06338
N11310 G1 X159.264 Y165.921 E1.0477
N11311 G1 X159.264 Y162.53 E.10904
N11312 G1 X190.736 Y194.001 E1.43118
N11313 G1 X190.736 Y191.203 E.08997
N11314 M73 P72 R14
N11315 G1 X159.264 Y199.636 E1.04769
N11316 G1 X159.264 Y199.068 E.01827
N11317 G1 X178.472 Y127.385 E2.38638
N11318 G1 X177.256 Y127.385 E.0391
N11319 G1 X159.264 Y132.205 E.59895
N11320 G1 X159.264 Y130.577 E.05236
N11321 ; WIPE_START
N11322 G1 X159.264 Y132.205 E-.61876
N11323 G1 X159.623 Y132.109 E-.14124
N11324 ; WIPE_END
N11325 G1 E-.04 F1800
N11326 M204 S10000
N11327 G17
N11328 G3 Z9 I1.217 J0 P1  F60000
N11329 ; stop printing object, unique label id: 229
N11330 M625
N11331 ; object ids of layer 43 start: 229
N11332 M624 AQAAAAAAAAA=
N11333 ;======== H2D 20250527========
N11334 ; SKIPPABLE_START
N11335 ; SKIPTYPE: timelapse
N11336 M622.1 S1 ; for prev firware, default turned on
N11337 
N11338 M1002 judge_flag timelapse_record_flag
N11339 
N11340 M622 J1
N11341 M993 A2 B2 C2
N11342 M993 A0 B0 C0
N11343 
N11344 
N11345 
N11346 
N11347     M9711 M0 E1 X260 Y141 Z9 S11 C10 O0 T3000
N11348 
N11349 
N11350 
N11351 M993 A3 B3 C3
N11352 
N11353 M623
N11354 ; SKIPPABLE_END
N11355 
N11356 ; object ids of this layer43 end: 229
N11357 M625
N11358 ; CHANGE_LAYER
N11359 ; Z_HEIGHT: 8.8
N11360 ; LAYER_HEIGHT: 0.2
N11361 ;======== H2D 20250521========
N11362 ; layer num/total_layer_count: 44/63
N11363 ; update layer progress
N11364 M73 L44
N11365 M991 S0 P43 ;notify layer change
N11366 
N11367 
N11368 ; OBJECT_ID: 229
N11369 ; COOLING_NODE: 0
N11370 ; start printing object, unique label id: 229
N11371 M624 AQAAAAAAAAA=
N11372 G1 X191.084 Y200.639 F60000
N11373 G1 Z8.8
N11374 G1 E.8 F1800
N11375 ; FEATURE: Inner wall
N11376 ; LINE_WIDTH: 0.45
N11377 ; LAYER_HEIGHT: 0.2
N11378 G1 F4421.739
N11379 M204 S8000
N11380 G1 X158.916 Y200.639 E1.03439
N11381 G1 X158.916 Y127.036 E2.36678
N11382 G1 X191.084 Y127.036 E1.03439
N11383 G1 X191.084 Y200.579 E2.36485
N11384 ; COOLING_NODE: 0
N11385 M204 S10000
N11386 G1 X191.491 Y201.046 F60000
N11387 G1 F4421.739
N11388 M204 S8000
N11389 G1 X158.509 Y201.046 E1.06057
N11390 G1 X158.509 Y126.629 E2.39296
N11391 G1 X191.491 Y126.629 E1.06057
N11392 G1 X191.491 Y200.986 E2.39103
N11393 ; COOLING_NODE: 0
N11394 M204 S10000
N11395 G1 X191.898 Y201.453 F60000
N11396 G1 F4421.739
N11397 M204 S8000
N11398 G1 X158.102 Y201.453 E1.08675
N11399 G1 X158.102 Y126.222 E2.41914
N11400 G1 X191.898 Y126.222 E1.08675
N11401 G1 X191.898 Y201.393 E2.41721
N11402 ; COOLING_NODE: 0
N11403 M204 S10000
N11404 G1 X192.29 Y201.845 F60000
N11405 ; FEATURE: Outer wall
N11406 ; LINE_WIDTH: 0.42
N11407 G1 F4773.528
N11408 M204 S5000
N11409 G1 X157.71 Y201.845 E1.03002
N11410 G1 X157.71 Y125.83 E2.26421
N11411 G1 X192.29 Y125.83 E1.03002
N11412 G1 X192.29 Y201.785 E2.26243
N11413 G1 E-.8 F1800
N11414 M204 S10000
N11415 G1 X190.736 Y198.15 Z9.2 F60000
N11416 G1 Z8.8
N11417 G1 E.8 F1800
N11418 ; FEATURE: Sparse infill
N11419 ; LINE_WIDTH: 0.45
N11420 G1 F4421.739
N11421 M204 S8000
N11422 G1 X190.736 Y199.778 E.05236
N11423 G1 X188.825 Y200.29 E.0636
N11424 G1 X187.197 Y200.29 E.05236
N11425 M204 S10000
N11426 G1 X159.264 Y195.243 F60000
N11427 G1 F4421.739
N11428 M204 S8000
N11429 G1 X159.264 Y196.872 E.05236
N11430 G1 X162.683 Y200.29 E.15546
N11431 G1 X167.219 Y200.29 E.14587
N11432 G1 X186.754 Y127.385 E2.42708
N11433 G1 X181.889 Y127.385 E.15645
N11434 G1 X190.736 Y136.231 E.4023
N11435 G1 X190.736 Y132.348 E.12487
N11436 G1 X159.264 Y140.781 E1.0477
N11437 G1 X159.264 Y139.302 E.04755
N11438 G1 X190.736 Y170.773 E1.43118
N11439 G1 X190.736 Y166.063 E.15145
N11440 G1 X159.264 Y174.496 E1.0477
N11441 G1 X159.264 Y173.844 E.02097
N11442 G1 X185.711 Y200.29 E1.20268
N11443 G1 X184.077 Y200.29 E.05255
N11444 G1 X190.736 Y175.44 E.82729
N11445 G1 X190.736 Y174.492 E.03047
N11446 G1 X159.264 Y182.925 E1.04769
N11447 G1 X159.264 Y185.358 E.07824
N11448 G1 X174.197 Y200.29 E.67907
N11449 G1 X175.648 Y200.29 E.04666
N11450 G1 X190.736 Y143.983 E1.87451
N11451 G1 X190.736 Y140.777 E.1031
N11452 G1 X159.264 Y149.209 E1.0477
N11453 G1 X159.264 Y150.816 E.05166
N11454 G1 X190.736 Y182.287 E1.43118
N11455 G1 X190.736 Y182.921 E.02038
N11456 G1 X159.264 Y191.353 E1.0477
N11457 G1 X159.264 Y189.725 E.05236
N11458 M204 S10000
N11459 G1 X159.264 Y137.236 F60000
N11460 G1 F4421.739
N11461 M204 S8000
N11462 G1 X159.264 Y135.608 E.05236
N11463 G1 X161.468 Y127.385 E.27376
N11464 G1 X159.264 Y127.385 E.07085
N11465 G1 X159.264 Y127.788 E.01297
N11466 G1 X190.736 Y159.259 E1.43118
N11467 G1 X190.736 Y157.634 E.05224
N11468 G1 X159.264 Y166.067 E1.0477
N11469 M204 S10000
N11470 G1 X159.264 Y168.693 F60000
N11471 G1 F4421.739
N11472 M204 S8000
N11473 G1 X159.264 Y167.065 E.05236
N11474 G1 X169.897 Y127.385 E1.32097
N11475 G1 X170.375 Y127.385 E.01538
N11476 G1 X190.736 Y147.745 E.92591
N11477 G1 X190.736 Y149.206 E.04696
N11478 G1 X159.264 Y157.638 E1.04769
N11479 G1 X159.264 Y162.33 E.15086
N11480 G1 X190.736 Y193.801 E1.43118
N11481 G1 X190.736 Y191.35 E.07883
N11482 G1 X159.264 Y199.782 E1.0477
N11483 G1 X159.264 Y198.521 E.04055
N11484 G1 X178.325 Y127.385 E2.36819
N11485 G1 X177.802 Y127.385 E.01682
N11486 G1 X159.264 Y132.352 E.61714
N11487 G1 X159.264 Y130.724 E.05236
N11488 ; WIPE_START
N11489 G1 X159.264 Y132.352 E-.61876
N11490 G1 X159.623 Y132.256 E-.14124
N11491 ; WIPE_END
N11492 G1 E-.04 F1800
N11493 M204 S10000
N11494 G17
N11495 G3 Z9.2 I1.217 J0 P1  F60000
N11496 ; stop printing object, unique label id: 229
N11497 M625
N11498 ; object ids of layer 44 start: 229
N11499 M624 AQAAAAAAAAA=
N11500 ;======== H2D 20250527========
N11501 ; SKIPPABLE_START
N11502 ; SKIPTYPE: timelapse
N11503 M622.1 S1 ; for prev firware, default turned on
N11504 
N11505 M1002 judge_flag timelapse_record_flag
N11506 
N11507 M622 J1
N11508 M993 A2 B2 C2
N11509 M993 A0 B0 C0
N11510 
N11511 
N11512 
N11513 
N11514     M9711 M0 E1 X260 Y141 Z9.2 S11 C10 O0 T3000
N11515 
N11516 
N11517 
N11518 M993 A3 B3 C3
N11519 
N11520 M623
N11521 ; SKIPPABLE_END
N11522 
N11523 ; object ids of this layer44 end: 229
N11524 M625
N11525 ; CHANGE_LAYER
N11526 ; Z_HEIGHT: 9
N11527 ; LAYER_HEIGHT: 0.2
N11528 ;======== H2D 20250521========
N11529 ; layer num/total_layer_count: 45/63
N11530 ; update layer progress
N11531 M73 L45
N11532 M991 S0 P44 ;notify layer change
N11533 
N11534 
N11535 ; OBJECT_ID: 229
N11536 ; COOLING_NODE: 0
N11537 ; start printing object, unique label id: 229
N11538 M624 AQAAAAAAAAA=
N11539 G1 X191.084 Y200.639 F60000
N11540 G1 Z9
N11541 G1 E.8 F1800
N11542 ; FEATURE: Inner wall
N11543 ; LINE_WIDTH: 0.45
N11544 ; LAYER_HEIGHT: 0.2
N11545 G1 F4421.739
N11546 M204 S8000
N11547 G1 X158.916 Y200.639 E1.03439
N11548 G1 X158.916 Y127.036 E2.36678
N11549 G1 X191.084 Y127.036 E1.03439
N11550 G1 X191.084 Y200.579 E2.36485
N11551 ; COOLING_NODE: 0
N11552 M204 S10000
N11553 G1 X191.491 Y201.046 F60000
N11554 G1 F4421.739
N11555 M204 S8000
N11556 G1 X158.509 Y201.046 E1.06057
N11557 G1 X158.509 Y126.629 E2.39296
N11558 G1 X191.491 Y126.629 E1.06057
N11559 G1 X191.491 Y200.986 E2.39103
N11560 ; COOLING_NODE: 0
N11561 M204 S10000
N11562 G1 X191.898 Y201.453 F60000
N11563 M73 P73 R14
N11564 G1 F4421.739
N11565 M204 S8000
N11566 G1 X158.102 Y201.453 E1.08675
N11567 G1 X158.102 Y126.222 E2.41914
N11568 G1 X191.898 Y126.222 E1.08675
N11569 G1 X191.898 Y201.393 E2.41721
N11570 ; COOLING_NODE: 0
N11571 M204 S10000
N11572 G1 X192.29 Y201.845 F60000
N11573 ; FEATURE: Outer wall
N11574 ; LINE_WIDTH: 0.42
N11575 G1 F4773.528
N11576 M204 S5000
N11577 G1 X157.71 Y201.845 E1.03002
N11578 G1 X157.71 Y125.83 E2.26421
N11579 G1 X192.29 Y125.83 E1.03002
N11580 G1 X192.29 Y201.785 E2.26243
N11581 G1 E-.8 F1800
N11582 M204 S10000
N11583 G1 X190.736 Y198.296 Z9.4 F60000
N11584 G1 Z9
N11585 G1 E.8 F1800
N11586 ; FEATURE: Sparse infill
N11587 ; LINE_WIDTH: 0.45
N11588 G1 F4421.739
N11589 M204 S8000
N11590 G1 X190.736 Y199.925 E.05236
N11591 G1 X189.371 Y200.29 E.04541
N11592 G1 X187.743 Y200.29 E.05236
N11593 M204 S10000
N11594 G1 X159.264 Y195.043 F60000
N11595 G1 F4421.739
N11596 M204 S8000
N11597 G1 X159.264 Y196.672 E.05236
N11598 G1 X162.883 Y200.29 E.16456
N11599 G1 X167.073 Y200.29 E.13473
N11600 G1 X186.608 Y127.385 E2.42708
N11601 G1 X182.089 Y127.385 E.14531
N11602 G1 X190.736 Y136.031 E.39321
N11603 G1 X190.736 Y132.494 E.11373
N11604 G1 X159.264 Y140.927 E1.04769
N11605 G1 X159.264 Y139.102 E.05869
N11606 G1 X190.736 Y170.573 E1.43118
N11607 G1 X190.736 Y166.21 E.14031
N11608 G1 X159.264 Y174.642 E1.0477
N11609 G1 X159.264 Y173.644 E.03211
N11610 G1 X185.911 Y200.29 E1.21178
N11611 G1 X183.93 Y200.29 E.06369
N11612 G1 X190.736 Y174.893 E.84549
N11613 G1 X190.736 Y174.638 E.00819
N11614 G1 X159.264 Y183.071 E1.04769
N11615 G1 X159.264 Y185.158 E.0671
N11616 G1 X174.397 Y200.29 E.68817
N11617 G1 X175.502 Y200.29 E.03552
N11618 G1 X190.736 Y143.437 E1.8927
N11619 G1 X190.736 Y140.923 E.08082
N11620 G1 X159.264 Y149.356 E1.0477
N11621 G1 X159.264 Y150.616 E.04052
N11622 G1 X190.736 Y182.087 E1.43118
N11623 G1 X190.736 Y183.067 E.03152
N11624 G1 X159.264 Y191.5 E1.0477
N11625 G1 X159.264 Y189.872 E.05236
N11626 M204 S10000
N11627 G1 X159.264 Y136.69 F60000
N11628 G1 F4421.739
N11629 M204 S8000
N11630 G1 X159.264 Y135.062 E.05236
N11631 G1 X161.321 Y127.385 E.25557
N11632 G1 X159.264 Y127.385 E.06615
N11633 G1 X159.264 Y127.588 E.00654
N11634 G1 X190.736 Y159.059 E1.43118
N11635 G1 X190.736 Y157.781 E.0411
N11636 G1 X159.264 Y166.213 E1.0477
N11637 G1 X159.264 Y166.518 E.0098
N11638 G1 X169.75 Y127.385 E1.30278
N11639 G1 X170.575 Y127.385 E.02652
N11640 G1 X190.736 Y147.545 E.91682
N11641 G1 X190.736 Y149.352 E.0581
N11642 G1 X159.264 Y157.785 E1.0477
N11643 G1 X159.264 Y162.13 E.13972
N11644 G1 X190.736 Y193.601 E1.43118
N11645 G1 X190.736 Y191.496 E.06769
N11646 G1 X159.264 Y199.929 E1.0477
N11647 G1 X159.264 Y197.975 E.06283
N11648 G1 X178.179 Y127.385 E2.35
N11649 G1 X178.349 Y127.385 E.00546
N11650 G1 X159.264 Y132.498 E.63533
N11651 G1 X159.264 Y130.87 E.05236
N11652 ; WIPE_START
N11653 G1 X159.264 Y132.498 E-.61876
N11654 G1 X159.623 Y132.402 E-.14124
N11655 ; WIPE_END
N11656 G1 E-.04 F1800
N11657 M204 S10000
N11658 G17
N11659 G3 Z9.4 I1.217 J0 P1  F60000
N11660 ; stop printing object, unique label id: 229
N11661 M625
N11662 ; object ids of layer 45 start: 229
N11663 M624 AQAAAAAAAAA=
N11664 ;======== H2D 20250527========
N11665 ; SKIPPABLE_START
N11666 ; SKIPTYPE: timelapse
N11667 M622.1 S1 ; for prev firware, default turned on
N11668 
N11669 M1002 judge_flag timelapse_record_flag
N11670 
N11671 M622 J1
N11672 M993 A2 B2 C2
N11673 M993 A0 B0 C0
N11674 
N11675 
N11676 
N11677 
N11678     M9711 M0 E1 X260 Y141 Z9.4 S11 C10 O0 T3000
N11679 
N11680 
N11681 
N11682 M993 A3 B3 C3
N11683 
N11684 M623
N11685 ; SKIPPABLE_END
N11686 
N11687 ; object ids of this layer45 end: 229
N11688 M625
N11689 ; CHANGE_LAYER
N11690 ; Z_HEIGHT: 9.2
N11691 ; LAYER_HEIGHT: 0.2
N11692 ;======== H2D 20250521========
N11693 ; layer num/total_layer_count: 46/63
N11694 ; update layer progress
N11695 M73 L46
N11696 M991 S0 P45 ;notify layer change
N11697 
N11698 
N11699 ; OBJECT_ID: 229
N11700 ; COOLING_NODE: 0
N11701 ; start printing object, unique label id: 229
N11702 M624 AQAAAAAAAAA=
N11703 G1 X191.084 Y200.639 F60000
N11704 G1 Z9.2
N11705 G1 E.8 F1800
N11706 ; FEATURE: Inner wall
N11707 ; LINE_WIDTH: 0.45
N11708 ; LAYER_HEIGHT: 0.2
N11709 G1 F4421.739
N11710 M204 S8000
N11711 G1 X158.916 Y200.639 E1.03439
N11712 G1 X158.916 Y127.036 E2.36678
N11713 G1 X191.084 Y127.036 E1.03439
N11714 G1 X191.084 Y200.579 E2.36485
N11715 ; COOLING_NODE: 0
N11716 M204 S10000
N11717 G1 X191.491 Y201.046 F60000
N11718 G1 F4421.739
N11719 M204 S8000
N11720 G1 X158.509 Y201.046 E1.06057
N11721 G1 X158.509 Y126.629 E2.39296
N11722 G1 X191.491 Y126.629 E1.06057
N11723 G1 X191.491 Y200.986 E2.39103
N11724 ; COOLING_NODE: 0
N11725 M204 S10000
N11726 G1 X191.898 Y201.453 F60000
N11727 G1 F4421.739
N11728 M204 S8000
N11729 G1 X158.102 Y201.453 E1.08675
N11730 M73 P73 R13
N11731 G1 X158.102 Y126.222 E2.41914
N11732 G1 X191.898 Y126.222 E1.08675
N11733 G1 X191.898 Y201.393 E2.41721
N11734 ; COOLING_NODE: 0
N11735 M204 S10000
N11736 G1 X192.29 Y201.845 F60000
N11737 ; FEATURE: Outer wall
N11738 ; LINE_WIDTH: 0.42
N11739 G1 F4773.528
N11740 M204 S5000
N11741 G1 X157.71 Y201.845 E1.03002
N11742 G1 X157.71 Y125.83 E2.26421
N11743 G1 X192.29 Y125.83 E1.03002
N11744 G1 X192.29 Y201.785 E2.26243
N11745 G1 E-.8 F1800
N11746 M204 S10000
N11747 G1 X190.736 Y198.443 Z9.6 F60000
N11748 M73 P74 R13
N11749 G1 Z9.2
N11750 G1 E.8 F1800
N11751 ; FEATURE: Sparse infill
N11752 ; LINE_WIDTH: 0.45
N11753 G1 F4421.739
N11754 M204 S8000
N11755 G1 X190.736 Y200.071 E.05236
N11756 G1 X189.918 Y200.29 E.02722
N11757 G1 X188.29 Y200.29 E.05236
N11758 M204 S10000
N11759 G1 X190.736 Y174.785 F60000
N11760 G1 F4421.739
N11761 M204 S8000
N11762 G1 X159.264 Y183.217 E1.0477
N11763 G1 X159.264 Y184.958 E.05596
N11764 G1 X174.597 Y200.29 E.69726
N11765 G1 X175.355 Y200.29 E.02438
N11766 G1 X190.736 Y142.89 E1.91089
N11767 G1 X190.736 Y141.07 E.05854
N11768 G1 X159.264 Y149.502 E1.0477
N11769 G1 X159.264 Y150.416 E.02938
N11770 G1 X190.736 Y181.887 E1.43118
N11771 G1 X190.736 Y183.214 E.04266
N11772 G1 X159.264 Y191.646 E1.0477
N11773 G1 X159.264 Y190.018 E.05236
N11774 M204 S10000
N11775 G1 X159.264 Y196.472 F60000
N11776 G1 F4421.739
N11777 M204 S8000
N11778 G1 X163.083 Y200.29 E.17366
N11779 G1 X166.926 Y200.29 E.12359
N11780 G1 X186.461 Y127.385 E2.42708
N11781 G1 X188.09 Y127.385 E.05236
N11782 M204 S10000
N11783 G1 X178.033 Y127.385 F60000
N11784 G1 F4421.739
N11785 M204 S8000
N11786 G1 X159.264 Y197.428 E2.33181
N11787 G1 X159.264 Y200.075 E.08511
N11788 G1 X190.736 Y191.642 E1.0477
N11789 G1 X190.736 Y193.401 E.05655
N11790 G1 X159.264 Y161.93 E1.43118
N11791 G1 X159.264 Y157.931 E.12859
N11792 G1 X190.736 Y149.498 E1.0477
N11793 G1 X190.736 Y147.345 E.06924
N11794 G1 X170.775 Y127.385 E.90772
N11795 G1 X169.604 Y127.385 E.03766
N11796 G1 X159.264 Y165.972 E1.28459
N11797 G1 X159.264 Y166.36 E.01248
N11798 G1 X190.736 Y157.927 E1.0477
N11799 G1 X190.736 Y158.859 E.02996
N11800 G1 X159.264 Y127.388 E1.43118
N11801 G1 X161.175 Y127.385 E.06144
N11802 G1 X159.264 Y134.515 E.23738
N11803 G1 X159.264 Y136.143 E.05236
N11804 M204 S10000
N11805 G1 X159.264 Y131.016 F60000
N11806 G1 F4421.739
N11807 M204 S8000
N11808 G1 X159.264 Y132.645 E.05236
N11809 G1 X178.895 Y127.385 E.65352
N11810 G1 X182.289 Y127.385 E.10913
N11811 G1 X190.736 Y135.831 E.38411
N11812 G1 X190.736 Y132.641 E.10259
N11813 G1 X159.264 Y141.073 E1.04769
N11814 G1 X159.264 Y138.902 E.06983
N11815 G1 X190.736 Y170.373 E1.43118
N11816 G1 X190.736 Y174.347 E.12778
N11817 G1 X183.784 Y200.29 E.86368
N11818 G1 X186.111 Y200.29 E.07483
N11819 G1 X159.264 Y173.444 E1.22087
N11820 G1 X159.264 Y174.789 E.04325
N11821 G1 X190.736 Y166.356 E1.0477
N11822 G1 X190.736 Y164.728 E.05236
N11823 ; WIPE_START
N11824 G1 X190.736 Y166.356 E-.61876
N11825 G1 X190.377 Y166.452 E-.14124
N11826 ; WIPE_END
N11827 G1 E-.04 F1800
N11828 M204 S10000
N11829 G17
N11830 G3 Z9.6 I1.217 J0 P1  F60000
N11831 ; stop printing object, unique label id: 229
N11832 M625
N11833 ; object ids of layer 46 start: 229
N11834 M624 AQAAAAAAAAA=
N11835 ;======== H2D 20250527========
N11836 ; SKIPPABLE_START
N11837 ; SKIPTYPE: timelapse
N11838 M622.1 S1 ; for prev firware, default turned on
N11839 
N11840 M1002 judge_flag timelapse_record_flag
N11841 
N11842 M622 J1
N11843 M993 A2 B2 C2
N11844 M993 A0 B0 C0
N11845 
N11846 
N11847 
N11848 
N11849     M9711 M0 E1 X260 Y141 Z9.6 S11 C10 O0 T3000
N11850 
N11851 
N11852 
N11853 M993 A3 B3 C3
N11854 
N11855 M623
N11856 ; SKIPPABLE_END
N11857 
N11858 ; object ids of this layer46 end: 229
N11859 M625
N11860 ; CHANGE_LAYER
N11861 ; Z_HEIGHT: 9.4
N11862 ; LAYER_HEIGHT: 0.2
N11863 ;======== H2D 20250521========
N11864 ; layer num/total_layer_count: 47/63
N11865 ; update layer progress
N11866 M73 L47
N11867 M991 S0 P46 ;notify layer change
N11868 
N11869 
N11870 M106 S51
N11871 ; OBJECT_ID: 229
N11872 ; COOLING_NODE: 0
N11873 ; start printing object, unique label id: 229
N11874 M624 AQAAAAAAAAA=
N11875 G1 X191.084 Y200.639 F60000
N11876 G1 Z9.4
N11877 G1 E.8 F1800
N11878 ; FEATURE: Inner wall
N11879 ; LINE_WIDTH: 0.45
N11880 ; LAYER_HEIGHT: 0.2
N11881 G1 F4421.739
N11882 M204 S8000
N11883 G1 X158.916 Y200.639 E1.03439
N11884 G1 X158.916 Y127.036 E2.36678
N11885 G1 X191.084 Y127.036 E1.03439
N11886 G1 X191.084 Y200.579 E2.36485
N11887 ; COOLING_NODE: 0
N11888 M204 S10000
N11889 G1 X191.491 Y201.046 F60000
N11890 G1 F4421.739
N11891 M204 S8000
N11892 G1 X158.509 Y201.046 E1.06057
N11893 G1 X158.509 Y126.629 E2.39296
N11894 G1 X191.491 Y126.629 E1.06057
N11895 G1 X191.491 Y200.986 E2.39103
N11896 ; COOLING_NODE: 0
N11897 M204 S10000
N11898 G1 X191.898 Y201.453 F60000
N11899 G1 F4421.739
N11900 M204 S8000
N11901 G1 X158.102 Y201.453 E1.08675
N11902 G1 X158.102 Y126.222 E2.41914
N11903 G1 X191.898 Y126.222 E1.08675
N11904 G1 X191.898 Y201.393 E2.41721
N11905 ; COOLING_NODE: 0
N11906 M204 S10000
N11907 G1 X192.29 Y201.845 F60000
N11908 ; FEATURE: Outer wall
N11909 ; LINE_WIDTH: 0.42
N11910 G1 F4773.528
N11911 M204 S5000
N11912 G1 X157.71 Y201.845 E1.03002
N11913 G1 X157.71 Y125.83 E2.26421
N11914 G1 X192.29 Y125.83 E1.03002
N11915 G1 X192.29 Y201.785 E2.26243
N11916 G1 E-.8 F1800
N11917 M204 S10000
N11918 G1 X191.849 Y194.165 Z9.8 F60000
N11919 G1 X190.736 Y174.931 Z9.8
N11920 G1 Z9.4
N11921 G1 E.8 F1800
N11922 ; FEATURE: Sparse infill
N11923 ; LINE_WIDTH: 0.45
N11924 G1 F4421.739
N11925 M204 S8000
N11926 G1 X159.264 Y183.364 E1.0477
N11927 G1 X159.264 Y184.758 E.04482
N11928 G1 X174.797 Y200.29 E.70636
N11929 G1 X175.209 Y200.29 E.01324
N11930 G1 X190.736 Y142.344 E1.92908
N11931 G1 X190.736 Y141.216 E.03626
N11932 G1 X159.264 Y149.649 E1.0477
N11933 G1 X159.264 Y150.216 E.01824
N11934 G1 X190.736 Y181.687 E1.43118
N11935 G1 X190.736 Y183.36 E.0538
N11936 G1 X159.264 Y191.793 E1.0477
N11937 G1 X159.264 Y190.164 E.05236
N11938 M204 S10000
N11939 G1 X159.264 Y196.272 F60000
N11940 G1 F4421.739
N11941 M204 S8000
N11942 G1 X163.283 Y200.29 E.18275
N11943 G1 X166.78 Y200.29 E.11245
N11944 G1 X186.315 Y127.385 E2.42708
N11945 G1 X187.943 Y127.385 E.05236
N11946 M204 S10000
N11947 G1 X176.258 Y127.385 F60000
N11948 G1 F4421.739
N11949 M204 S8000
N11950 G1 X177.886 Y127.385 E.05236
N11951 G1 X159.264 Y196.882 E2.31362
N11952 G1 X159.264 Y200.221 E.10738
N11953 G1 X190.736 Y191.789 E1.0477
N11954 G1 X190.736 Y193.201 E.04541
N11955 G1 X159.264 Y161.73 E1.43118
N11956 G1 X159.264 Y158.077 E.11745
N11957 M73 P75 R13
N11958 G1 X190.736 Y149.645 E1.0477
N11959 G1 X190.736 Y147.145 E.08038
N11960 G1 X170.975 Y127.385 E.89863
N11961 G1 X169.457 Y127.385 E.0488
N11962 G1 X159.264 Y165.425 E1.2664
N11963 G1 X159.264 Y166.506 E.03476
N11964 G1 X190.736 Y158.074 E1.0477
N11965 G1 X190.736 Y158.659 E.01883
N11966 G1 X159.461 Y127.385 E1.42223
N11967 G1 X161.029 Y127.385 E.05041
N11968 G1 X159.264 Y133.969 E.21919
N11969 G1 X159.264 Y135.597 E.05236
N11970 M204 S10000
N11971 G1 X159.264 Y132.791 F60000
N11972 G1 F4421.739
N11973 M204 S8000
N11974 G1 X179.442 Y127.385 E.67171
N11975 G1 X182.489 Y127.385 E.098
N11976 G1 X190.736 Y135.631 E.37502
N11977 G1 X190.736 Y132.787 E.09145
N11978 G1 X159.264 Y141.22 E1.0477
N11979 G1 X159.264 Y138.702 E.08097
N11980 G1 X190.736 Y170.173 E1.43118
N11981 G1 X190.736 Y173.8 E.11664
N11982 G1 X183.638 Y200.29 E.88187
N11983 G1 X186.311 Y200.29 E.08597
N11984 G1 X159.264 Y173.244 E1.22997
N11985 G1 X159.264 Y174.935 E.05439
N11986 G1 X190.736 Y166.502 E1.0477
N11987 G1 X190.736 Y164.874 E.05236
N11988 ; WIPE_START
N11989 G1 X190.736 Y166.502 E-.61876
N11990 G1 X190.377 Y166.599 E-.14124
N11991 ; WIPE_END
N11992 G1 E-.04 F1800
N11993 M204 S10000
N11994 G17
N11995 G3 Z9.8 I1.217 J0 P1  F60000
N11996 ; stop printing object, unique label id: 229
N11997 M625
N11998 ; object ids of layer 47 start: 229
N11999 M624 AQAAAAAAAAA=
N12000 ;======== H2D 20250527========
N12001 ; SKIPPABLE_START
N12002 ; SKIPTYPE: timelapse
N12003 M622.1 S1 ; for prev firware, default turned on
N12004 
N12005 M1002 judge_flag timelapse_record_flag
N12006 
N12007 M622 J1
N12008 M993 A2 B2 C2
N12009 M993 A0 B0 C0
N12010 
N12011 
N12012 
N12013 
N12014     M9711 M0 E1 X260 Y141 Z9.8 S11 C10 O0 T3000
N12015 
N12016 
N12017 
N12018 M993 A3 B3 C3
N12019 
N12020 M623
N12021 ; SKIPPABLE_END
N12022 
N12023 ; object ids of this layer47 end: 229
N12024 M625
N12025 ; CHANGE_LAYER
N12026 ; Z_HEIGHT: 9.6
N12027 ; LAYER_HEIGHT: 0.200001
N12028 ;======== H2D 20250521========
N12029 ; layer num/total_layer_count: 48/63
N12030 ; update layer progress
N12031 M73 L48
N12032 M991 S0 P47 ;notify layer change
N12033 
N12034 
N12035 ; OBJECT_ID: 229
N12036 ; COOLING_NODE: 0
N12037 ; start printing object, unique label id: 229
N12038 M624 AQAAAAAAAAA=
N12039 G1 X191.084 Y200.639 F60000
N12040 G1 Z9.6
N12041 G1 E.8 F1800
N12042 ; FEATURE: Inner wall
N12043 ; LINE_WIDTH: 0.45
N12044 ; LAYER_HEIGHT: 0.2
N12045 G1 F4421.739
N12046 M204 S8000
N12047 G1 X158.916 Y200.639 E1.03439
N12048 G1 X158.916 Y127.036 E2.36678
N12049 G1 X191.084 Y127.036 E1.03439
N12050 G1 X191.084 Y200.579 E2.36485
N12051 ; COOLING_NODE: 0
N12052 M204 S10000
N12053 G1 X191.491 Y201.046 F60000
N12054 G1 F4421.739
N12055 M204 S8000
N12056 G1 X158.509 Y201.046 E1.06057
N12057 G1 X158.509 Y126.629 E2.39296
N12058 G1 X191.491 Y126.629 E1.06057
N12059 G1 X191.491 Y200.986 E2.39103
N12060 ; COOLING_NODE: 0
N12061 M204 S10000
N12062 G1 X191.898 Y201.453 F60000
N12063 G1 F4421.739
N12064 M204 S8000
N12065 G1 X158.102 Y201.453 E1.08675
N12066 G1 X158.102 Y126.222 E2.41914
N12067 G1 X191.898 Y126.222 E1.08675
N12068 G1 X191.898 Y201.393 E2.41721
N12069 ; COOLING_NODE: 0
N12070 M204 S10000
N12071 G1 X192.29 Y201.845 F60000
N12072 ; FEATURE: Outer wall
N12073 ; LINE_WIDTH: 0.42
N12074 G1 F4773.528
N12075 M204 S5000
N12076 G1 X157.71 Y201.845 E1.03002
N12077 G1 X157.71 Y125.83 E2.26421
N12078 G1 X192.29 Y125.83 E1.03002
N12079 G1 X192.29 Y201.785 E2.26243
N12080 G1 E-.8 F1800
N12081 M204 S10000
N12082 G1 X191.818 Y194.167 Z10 F60000
N12083 G1 X190.736 Y176.706 Z10
N12084 G1 Z9.6
N12085 G1 E.8 F1800
N12086 ; FEATURE: Sparse infill
N12087 ; LINE_WIDTH: 0.45
N12088 G1 F4421.739
N12089 M204 S8000
N12090 G1 X190.736 Y175.078 E.05236
N12091 G1 X159.264 Y183.51 E1.0477
N12092 G1 X159.264 Y184.558 E.03368
N12093 G1 X174.997 Y200.29 E.71545
N12094 G1 X175.062 Y200.29 E.0021
N12095 G1 X190.736 Y141.797 E1.94727
N12096 G1 X190.736 Y141.362 E.01398
N12097 G1 X159.264 Y149.795 E1.04769
N12098 G1 X159.264 Y150.016 E.0071
N12099 G1 X190.736 Y181.487 E1.43118
N12100 G1 X190.736 Y183.506 E.06494
N12101 G1 X159.264 Y191.939 E1.04769
N12102 G1 X159.264 Y190.311 E.05236
N12103 M204 S10000
N12104 G1 X159.264 Y198.952 F60000
N12105 G1 F4421.739
N12106 M204 S8000
N12107 M73 P75 R12
N12108 G1 X159.264 Y200.29 E.04305
N12109 G1 X159.554 Y200.29 E.00931
N12110 G1 X190.736 Y191.935 E1.03806
N12111 G1 X190.736 Y193.001 E.03427
N12112 G1 X159.264 Y161.53 E1.43118
N12113 G1 X159.264 Y158.224 E.10631
N12114 G1 X190.736 Y149.791 E1.0477
N12115 G1 X190.736 Y146.945 E.09152
N12116 G1 X171.175 Y127.385 E.88953
N12117 G1 X169.311 Y127.385 E.05994
N12118 G1 X159.264 Y164.879 E1.24821
N12119 G1 X159.264 Y166.653 E.05704
N12120 G1 X190.736 Y158.22 E1.04769
N12121 G1 X190.736 Y158.459 E.00769
N12122 G1 X159.661 Y127.385 E1.41314
N12123 G1 X160.882 Y127.385 E.03927
N12124 G1 X159.264 Y133.422 E.201
N12125 G1 X159.264 Y135.051 E.05236
N12126 M204 S10000
N12127 G1 X159.264 Y132.938 F60000
N12128 G1 F4421.739
N12129 M204 S8000
N12130 G1 X179.988 Y127.385 E.6899
N12131 G1 X182.689 Y127.385 E.08686
N12132 G1 X190.736 Y135.431 E.36592
N12133 G1 X190.736 Y132.934 E.08031
N12134 G1 X159.264 Y141.366 E1.0477
N12135 G1 X159.264 Y138.502 E.09211
N12136 G1 X190.736 Y169.973 E1.43118
N12137 G1 X190.736 Y173.254 E.10551
N12138 G1 X183.491 Y200.29 E.90006
N12139 G1 X186.511 Y200.29 E.0971
N12140 G1 X159.264 Y173.044 E1.23906
N12141 G1 X159.264 Y175.081 E.06553
N12142 G1 X190.736 Y166.649 E1.0477
N12143 G1 X190.736 Y165.021 E.05236
N12144 M204 S10000
N12145 G1 X187.797 Y127.385 F60000
N12146 G1 F4421.739
N12147 M204 S8000
N12148 G1 X186.169 Y127.385 E.05236
N12149 G1 X166.634 Y200.29 E2.42708
N12150 G1 X163.483 Y200.29 E.10131
N12151 G1 X159.264 Y196.072 E.19185
N12152 G1 X159.264 Y196.336 E.00849
N12153 G1 X177.74 Y127.385 E2.29543
N12154 G1 X176.112 Y127.385 E.05236
N12155 ; WIPE_START
N12156 G1 X177.74 Y127.385 E-.61876
N12157 G1 X177.644 Y127.744 E-.14124
N12158 ; WIPE_END
N12159 G1 E-.04 F1800
N12160 M204 S10000
N12161 G17
N12162 G3 Z10 I1.217 J0 P1  F60000
N12163 ; stop printing object, unique label id: 229
N12164 M625
N12165 ; object ids of layer 48 start: 229
N12166 M624 AQAAAAAAAAA=
N12167 ;======== H2D 20250527========
N12168 ; SKIPPABLE_START
N12169 ; SKIPTYPE: timelapse
N12170 M622.1 S1 ; for prev firware, default turned on
N12171 
N12172 M1002 judge_flag timelapse_record_flag
N12173 
N12174 M622 J1
N12175 M993 A2 B2 C2
N12176 M993 A0 B0 C0
N12177 
N12178 
N12179 
N12180 
N12181     M9711 M0 E1 X260 Y141 Z10 S11 C10 O0 T3000
N12182 
N12183 
N12184 
N12185 M993 A3 B3 C3
N12186 
N12187 M623
N12188 ; SKIPPABLE_END
N12189 
N12190 ; object ids of this layer48 end: 229
N12191 M625
N12192 ; CHANGE_LAYER
N12193 ; Z_HEIGHT: 9.8
N12194 ; LAYER_HEIGHT: 0.2
N12195 ;======== H2D 20250521========
N12196 ; layer num/total_layer_count: 49/63
N12197 ; update layer progress
N12198 M73 L49
N12199 M991 S0 P48 ;notify layer change
N12200 
N12201 
N12202 ; OBJECT_ID: 229
N12203 ; COOLING_NODE: 0
N12204 ; start printing object, unique label id: 229
N12205 M624 AQAAAAAAAAA=
N12206 G1 X191.084 Y200.639 F60000
N12207 G1 Z9.8
N12208 G1 E.8 F1800
N12209 ; FEATURE: Inner wall
N12210 ; LINE_WIDTH: 0.45
N12211 ; LAYER_HEIGHT: 0.2
N12212 G1 F4421.739
N12213 M204 S8000
N12214 G1 X158.916 Y200.639 E1.03439
N12215 G1 X158.916 Y127.036 E2.36678
N12216 G1 X191.084 Y127.036 E1.03439
N12217 G1 X191.084 Y200.579 E2.36485
N12218 ; COOLING_NODE: 0
N12219 M204 S10000
N12220 M73 P76 R12
N12221 G1 X191.491 Y201.046 F60000
N12222 G1 F4421.739
N12223 M204 S8000
N12224 G1 X158.509 Y201.046 E1.06057
N12225 G1 X158.509 Y126.629 E2.39296
N12226 G1 X191.491 Y126.629 E1.06057
N12227 G1 X191.491 Y200.986 E2.39103
N12228 ; COOLING_NODE: 0
N12229 M204 S10000
N12230 G1 X191.898 Y201.453 F60000
N12231 G1 F4421.739
N12232 M204 S8000
N12233 G1 X158.102 Y201.453 E1.08675
N12234 G1 X158.102 Y126.222 E2.41914
N12235 G1 X191.898 Y126.222 E1.08675
N12236 G1 X191.898 Y201.393 E2.41721
N12237 ; COOLING_NODE: 0
N12238 M204 S10000
N12239 G1 X192.29 Y201.845 F60000
N12240 ; FEATURE: Outer wall
N12241 ; LINE_WIDTH: 0.42
N12242 G1 F4773.528
N12243 M204 S5000
N12244 G1 X157.71 Y201.845 E1.03002
N12245 G1 X157.71 Y125.83 E2.26421
N12246 G1 X192.29 Y125.83 E1.03002
N12247 G1 X192.29 Y201.785 E2.26243
N12248 G1 E-.8 F1800
N12249 M204 S10000
N12250 G1 X191.815 Y194.167 Z10.2 F60000
N12251 G1 X190.736 Y176.852 Z10.2
N12252 G1 Z9.8
N12253 G1 E.8 F1800
N12254 ; FEATURE: Sparse infill
N12255 ; LINE_WIDTH: 0.45
N12256 G1 F4421.739
N12257 M204 S8000
N12258 G1 X190.736 Y175.224 E.05236
N12259 G1 X159.264 Y183.657 E1.0477
N12260 G1 X159.264 Y184.358 E.02254
N12261 G1 X175.197 Y200.29 E.72455
N12262 G1 X174.916 Y200.29 E.00904
N12263 G1 X190.736 Y141.251 E1.96546
N12264 G1 X190.736 Y141.509 E.00829
N12265 G1 X159.264 Y149.942 E1.0477
N12266 G1 X159.264 Y149.816 E.00404
N12267 G1 X190.736 Y181.287 E1.43118
N12268 G1 X190.736 Y183.653 E.07608
N12269 G1 X159.264 Y192.085 E1.0477
N12270 G1 X159.264 Y190.457 E.05236
N12271 M204 S10000
N12272 G1 X159.264 Y199.498 F60000
N12273 G1 F4421.739
N12274 M204 S8000
N12275 G1 X159.264 Y200.29 E.02548
N12276 G1 X160.1 Y200.29 E.02688
N12277 G1 X190.736 Y192.082 E1.01987
N12278 G1 X190.736 Y192.801 E.02313
N12279 G1 X159.264 Y161.33 E1.43118
N12280 G1 X159.264 Y158.37 E.09517
N12281 G1 X190.736 Y149.938 E1.0477
N12282 G1 X190.736 Y146.745 E.10266
N12283 G1 X171.375 Y127.385 E.88044
N12284 G1 X169.165 Y127.385 E.07108
N12285 G1 X159.264 Y164.333 E1.23002
N12286 G1 X159.264 Y166.799 E.07931
N12287 G1 X190.736 Y158.366 E1.0477
N12288 G1 X190.736 Y158.259 E.00345
N12289 G1 X159.861 Y127.385 E1.40404
N12290 G1 X160.736 Y127.385 E.02813
N12291 G1 X159.264 Y132.876 E.18281
N12292 G1 X159.264 Y133.084 E.00669
N12293 G1 X180.534 Y127.385 E.70809
N12294 G1 X182.889 Y127.385 E.07572
N12295 G1 X190.736 Y135.231 E.35683
N12296 G1 X190.736 Y133.08 E.06917
N12297 G1 X159.264 Y141.513 E1.0477
N12298 G1 X159.264 Y138.302 E.10325
N12299 G1 X190.736 Y169.773 E1.43118
N12300 G1 X190.736 Y172.708 E.09437
N12301 G1 X183.345 Y200.29 E.91825
N12302 G1 X186.711 Y200.29 E.10824
N12303 G1 X159.264 Y172.844 E1.24816
N12304 G1 X159.264 Y175.228 E.07666
N12305 G1 X190.736 Y166.795 E1.0477
N12306 G1 X190.736 Y165.167 E.05236
N12307 M204 S10000
N12308 G1 X187.651 Y127.385 F60000
N12309 G1 F4421.739
N12310 M204 S8000
N12311 G1 X186.022 Y127.385 E.05236
N12312 G1 X166.487 Y200.29 E2.42708
N12313 G1 X163.683 Y200.29 E.09017
N12314 G1 X159.264 Y195.872 E.20094
N12315 G1 X159.264 Y195.789 E.00265
N12316 G1 X177.593 Y127.385 E2.27724
N12317 G1 X175.965 Y127.385 E.05236
N12318 ; WIPE_START
N12319 G1 X177.593 Y127.385 E-.61876
N12320 G1 X177.497 Y127.744 E-.14124
N12321 ; WIPE_END
N12322 G1 E-.04 F1800
N12323 M204 S10000
N12324 G17
N12325 G3 Z10.2 I1.217 J0 P1  F60000
N12326 ; stop printing object, unique label id: 229
N12327 M625
N12328 ; object ids of layer 49 start: 229
N12329 M624 AQAAAAAAAAA=
N12330 ;======== H2D 20250527========
N12331 ; SKIPPABLE_START
N12332 ; SKIPTYPE: timelapse
N12333 M622.1 S1 ; for prev firware, default turned on
N12334 
N12335 M1002 judge_flag timelapse_record_flag
N12336 
N12337 M622 J1
N12338 M993 A2 B2 C2
N12339 M993 A0 B0 C0
N12340 
N12341 
N12342 
N12343 
N12344     M9711 M0 E1 X260 Y141 Z10.2 S11 C10 O0 T3000
N12345 
N12346 
N12347 
N12348 M993 A3 B3 C3
N12349 
N12350 M623
N12351 ; SKIPPABLE_END
N12352 
N12353 ; object ids of this layer49 end: 229
N12354 M625
N12355 ; CHANGE_LAYER
N12356 ; Z_HEIGHT: 10
N12357 ; LAYER_HEIGHT: 0.2
N12358 ;======== H2D 20250521========
N12359 ; layer num/total_layer_count: 50/63
N12360 ; update layer progress
N12361 M73 L50
N12362 M991 S0 P49 ;notify layer change
N12363 
N12364 
N12365 M106 S48.45
N12366 ; OBJECT_ID: 229
N12367 ; COOLING_NODE: 0
N12368 ; start printing object, unique label id: 229
N12369 M624 AQAAAAAAAAA=
N12370 G1 X191.084 Y200.639 F60000
N12371 G1 Z10
N12372 G1 E.8 F1800
N12373 ; FEATURE: Inner wall
N12374 ; LINE_WIDTH: 0.45
N12375 ; LAYER_HEIGHT: 0.2
N12376 G1 F4421.739
N12377 M204 S8000
N12378 G1 X158.916 Y200.639 E1.03439
N12379 G1 X158.916 Y127.036 E2.36678
N12380 G1 X191.084 Y127.036 E1.03439
N12381 G1 X191.084 Y200.579 E2.36485
N12382 ; COOLING_NODE: 0
N12383 M204 S10000
N12384 G1 X191.491 Y201.046 F60000
N12385 G1 F4421.739
N12386 M204 S8000
N12387 G1 X158.509 Y201.046 E1.06057
N12388 G1 X158.509 Y126.629 E2.39296
N12389 G1 X191.491 Y126.629 E1.06057
N12390 G1 X191.491 Y200.986 E2.39103
N12391 ; COOLING_NODE: 0
N12392 M204 S10000
N12393 G1 X191.898 Y201.453 F60000
N12394 G1 F4421.739
N12395 M204 S8000
N12396 G1 X158.102 Y201.453 E1.08675
N12397 G1 X158.102 Y126.222 E2.41914
N12398 G1 X191.898 Y126.222 E1.08675
N12399 G1 X191.898 Y201.393 E2.41721
N12400 ; COOLING_NODE: 0
N12401 M204 S10000
N12402 G1 X192.29 Y201.845 F60000
N12403 ; FEATURE: Outer wall
N12404 ; LINE_WIDTH: 0.42
N12405 M73 P77 R12
N12406 G1 F4773.528
N12407 M204 S5000
N12408 G1 X157.71 Y201.845 E1.03002
N12409 G1 X157.71 Y125.83 E2.26421
N12410 G1 X192.29 Y125.83 E1.03002
N12411 G1 X192.29 Y201.785 E2.26243
N12412 G1 E-.8 F1800
N12413 M204 S10000
N12414 G1 X191.812 Y194.167 Z10.4 F60000
N12415 G1 X190.736 Y176.999 Z10.4
N12416 G1 Z10
N12417 G1 E.8 F1800
N12418 ; FEATURE: Sparse infill
N12419 ; LINE_WIDTH: 0.45
N12420 G1 F4421.739
N12421 M204 S8000
N12422 G1 X190.736 Y175.37 E.05236
N12423 G1 X159.264 Y183.803 E1.0477
N12424 G1 X159.264 Y184.158 E.0114
N12425 G1 X175.397 Y200.29 E.73364
N12426 G1 X174.77 Y200.29 E.02018
N12427 G1 X190.736 Y140.705 E1.98365
N12428 G1 X190.736 Y139.076 E.05236
N12429 M204 S10000
N12430 G1 X190.736 Y141.655 F60000
N12431 G1 F4421.739
N12432 M204 S8000
N12433 G1 X159.264 Y150.088 E1.0477
N12434 G1 X159.264 Y149.616 E.01518
N12435 G1 X190.736 Y181.087 E1.43118
N12436 G1 X190.736 Y183.799 E.08722
N12437 G1 X159.264 Y192.232 E1.0477
N12438 G1 X159.264 Y190.604 E.05236
N12439 M204 S10000
N12440 G1 X159.264 Y200.044 F60000
N12441 G1 F4421.739
N12442 M204 S8000
N12443 G1 X159.264 Y200.29 E.00791
N12444 G1 X160.647 Y200.29 E.04445
N12445 G1 X190.736 Y192.228 E1.00168
N12446 G1 X190.736 Y192.601 E.01199
N12447 G1 X159.264 Y161.13 E1.43118
N12448 G1 X159.264 Y158.517 E.08403
N12449 G1 X190.736 Y150.084 E1.0477
N12450 G1 X190.736 Y146.545 E.1138
N12451 G1 X171.575 Y127.385 E.87134
N12452 G1 X169.018 Y127.385 E.08222
N12453 G1 X159.264 Y163.786 E1.21183
N12454 G1 X159.264 Y166.946 E.10159
N12455 G1 X190.736 Y158.513 E1.0477
N12456 G1 X190.736 Y158.059 E.01459
N12457 G1 X160.061 Y127.385 E1.39495
N12458 G1 X160.589 Y127.385 E.01699
N12459 G1 X159.264 Y132.329 E.16462
N12460 G1 X159.264 Y133.23 E.02897
N12461 G1 X181.081 Y127.385 E.72628
N12462 G1 X183.089 Y127.385 E.06458
N12463 G1 X190.736 Y135.031 E.34773
N12464 G1 X190.736 Y133.226 E.05803
N12465 G1 X159.264 Y141.659 E1.0477
N12466 G1 X159.264 Y138.102 E.11439
N12467 G1 X190.736 Y169.573 E1.43118
N12468 G1 X190.736 Y172.161 E.08323
N12469 G1 X183.198 Y200.29 E.93644
N12470 G1 X186.911 Y200.29 E.11938
N12471 G1 X159.264 Y172.644 E1.25725
N12472 G1 X159.264 Y175.374 E.0878
N12473 G1 X190.736 Y166.942 E1.0477
N12474 G1 X190.736 Y165.313 E.05236
N12475 M204 S10000
N12476 G1 X187.504 Y127.385 F60000
N12477 G1 F4421.739
N12478 M204 S8000
N12479 G1 X185.876 Y127.385 E.05236
N12480 G1 X166.341 Y200.29 E2.42708
N12481 G1 X163.883 Y200.29 E.07903
N12482 G1 X159.264 Y195.672 E.21004
N12483 G1 X159.264 Y195.243 E.01379
N12484 G1 X177.447 Y127.385 E2.25905
N12485 G1 X175.819 Y127.385 E.05236
N12486 ; WIPE_START
N12487 G1 X177.447 Y127.385 E-.61876
N12488 G1 X177.351 Y127.744 E-.14124
N12489 ; WIPE_END
N12490 G1 E-.04 F1800
N12491 M204 S10000
N12492 G17
N12493 G3 Z10.4 I1.217 J0 P1  F60000
N12494 ; stop printing object, unique label id: 229
N12495 M625
N12496 ; object ids of layer 50 start: 229
N12497 M624 AQAAAAAAAAA=
N12498 ;======== H2D 20250527========
N12499 ; SKIPPABLE_START
N12500 ; SKIPTYPE: timelapse
N12501 M622.1 S1 ; for prev firware, default turned on
N12502 
N12503 M1002 judge_flag timelapse_record_flag
N12504 
N12505 M622 J1
N12506 M993 A2 B2 C2
N12507 M993 A0 B0 C0
N12508 
N12509 
N12510 
N12511 
N12512     M9711 M0 E1 X260 Y141 Z10.4 S11 C10 O0 T3000
N12513 
N12514 
N12515 
N12516 M993 A3 B3 C3
N12517 
N12518 M623
N12519 ; SKIPPABLE_END
N12520 
N12521 ; object ids of this layer50 end: 229
N12522 M625
N12523 ; CHANGE_LAYER
N12524 ; Z_HEIGHT: 10.2
N12525 ; LAYER_HEIGHT: 0.2
N12526 ;======== H2D 20250521========
N12527 ; layer num/total_layer_count: 51/63
N12528 ; update layer progress
N12529 M73 L51
N12530 M991 S0 P50 ;notify layer change
N12531 
N12532 
N12533 ; OBJECT_ID: 229
N12534 ; COOLING_NODE: 0
N12535 ; start printing object, unique label id: 229
N12536 M624 AQAAAAAAAAA=
N12537 G1 X191.084 Y200.639 F60000
N12538 G1 Z10.2
N12539 G1 E.8 F1800
N12540 ; FEATURE: Inner wall
N12541 ; LINE_WIDTH: 0.45
N12542 ; LAYER_HEIGHT: 0.2
N12543 G1 F4421.739
N12544 M204 S8000
N12545 G1 X158.916 Y200.639 E1.03439
N12546 G1 X158.916 Y127.036 E2.36678
N12547 G1 X191.084 Y127.036 E1.03439
N12548 G1 X191.084 Y200.579 E2.36485
N12549 ; COOLING_NODE: 0
N12550 M204 S10000
N12551 M73 P77 R11
N12552 G1 X191.491 Y201.046 F60000
N12553 G1 F4421.739
N12554 M204 S8000
N12555 G1 X158.509 Y201.046 E1.06057
N12556 G1 X158.509 Y126.629 E2.39296
N12557 G1 X191.491 Y126.629 E1.06057
N12558 G1 X191.491 Y200.986 E2.39103
N12559 ; COOLING_NODE: 0
N12560 M204 S10000
N12561 G1 X191.898 Y201.453 F60000
N12562 G1 F4421.739
N12563 M204 S8000
N12564 G1 X158.102 Y201.453 E1.08675
N12565 G1 X158.102 Y126.222 E2.41914
N12566 G1 X191.898 Y126.222 E1.08675
N12567 G1 X191.898 Y201.393 E2.41721
N12568 ; COOLING_NODE: 0
N12569 M204 S10000
N12570 G1 X192.29 Y201.845 F60000
N12571 ; FEATURE: Outer wall
N12572 ; LINE_WIDTH: 0.42
N12573 G1 F4773.528
N12574 M204 S5000
N12575 G1 X157.71 Y201.845 E1.03002
N12576 G1 X157.71 Y125.83 E2.26421
N12577 G1 X192.29 Y125.83 E1.03002
N12578 G1 X192.29 Y201.785 E2.26243
N12579 G1 E-.8 F1800
N12580 M204 S10000
N12581 G1 X191.809 Y194.167 Z10.6 F60000
N12582 G1 X190.736 Y177.145 Z10.6
N12583 G1 Z10.2
N12584 G1 E.8 F1800
N12585 ; FEATURE: Sparse infill
N12586 ; LINE_WIDTH: 0.45
N12587 G1 F4421.739
N12588 M204 S8000
N12589 G1 X190.736 Y175.517 E.05236
N12590 G1 X159.264 Y183.958 E1.04776
N12591 G1 X175.597 Y200.29 E.74274
N12592 G1 X174.623 Y200.29 E.03131
N12593 G1 X190.736 Y140.158 E2.00184
N12594 G1 X190.736 Y138.53 E.05236
N12595 M204 S10000
N12596 G1 X190.736 Y143.43 F60000
N12597 G1 F4421.739
N12598 M204 S8000
N12599 G1 X190.736 Y141.802 E.05236
N12600 G1 X159.264 Y150.234 E1.0477
N12601 G1 X159.264 Y149.416 E.02632
N12602 G1 X190.736 Y180.887 E1.43118
N12603 G1 X190.736 Y183.946 E.09836
N12604 G1 X159.264 Y192.378 E1.0477
N12605 G1 X159.264 Y190.75 E.05236
N12606 M204 S10000
N12607 M73 P78 R11
N12608 G1 X159.565 Y200.29 F60000
N12609 G1 F4421.739
N12610 M204 S8000
N12611 G1 X161.193 Y200.29 E.05236
N12612 G1 X190.736 Y192.374 E.98349
N12613 G1 X190.736 Y192.401 E.00085
N12614 G1 X159.264 Y160.93 E1.43118
N12615 G1 X159.264 Y158.663 E.07289
N12616 G1 X190.736 Y150.23 E1.0477
N12617 G1 X190.736 Y146.345 E.12494
N12618 G1 X171.775 Y127.385 E.86225
N12619 G1 X168.872 Y127.385 E.09336
N12620 G1 X159.264 Y163.24 E1.19364
N12621 G1 X159.264 Y167.092 E.12387
N12622 G1 X190.736 Y158.659 E1.0477
N12623 G1 X190.736 Y157.859 E.02573
N12624 G1 X160.261 Y127.385 E1.38585
N12625 G1 X160.443 Y127.385 E.00585
N12626 G1 X159.264 Y131.783 E.14643
N12627 G1 X159.264 Y133.377 E.05125
N12628 G1 X181.627 Y127.385 E.74447
N12629 G1 X183.289 Y127.385 E.05344
N12630 G1 X190.736 Y134.831 E.33864
N12631 G1 X190.736 Y133.373 E.04689
N12632 G1 X159.264 Y141.806 E1.0477
N12633 G1 X159.264 Y137.902 E.12553
N12634 G1 X190.736 Y169.373 E1.43118
N12635 G1 X190.736 Y171.615 E.07209
N12636 G1 X183.052 Y200.29 E.95463
N12637 G1 X187.111 Y200.29 E.13052
N12638 G1 X159.264 Y172.444 E1.26635
N12639 G1 X159.264 Y175.521 E.09894
N12640 G1 X190.736 Y167.088 E1.0477
N12641 G1 X190.736 Y165.46 E.05236
N12642 M204 S10000
N12643 G1 X187.358 Y127.385 F60000
N12644 G1 F4421.739
N12645 M204 S8000
N12646 G1 X185.729 Y127.385 E.05236
N12647 G1 X166.194 Y200.29 E2.42708
N12648 G1 X164.083 Y200.29 E.06789
N12649 G1 X159.264 Y195.472 E.21913
N12650 G1 X159.264 Y194.696 E.02493
N12651 G1 X177.301 Y127.385 E2.24086
N12652 G1 X175.672 Y127.385 E.05236
N12653 ; WIPE_START
N12654 G1 X177.301 Y127.385 E-.61876
N12655 G1 X177.204 Y127.744 E-.14124
N12656 ; WIPE_END
N12657 G1 E-.04 F1800
N12658 M204 S10000
N12659 G17
N12660 G3 Z10.6 I1.217 J0 P1  F60000
N12661 ; stop printing object, unique label id: 229
N12662 M625
N12663 ; object ids of layer 51 start: 229
N12664 M624 AQAAAAAAAAA=
N12665 ;======== H2D 20250527========
N12666 ; SKIPPABLE_START
N12667 ; SKIPTYPE: timelapse
N12668 M622.1 S1 ; for prev firware, default turned on
N12669 
N12670 M1002 judge_flag timelapse_record_flag
N12671 
N12672 M622 J1
N12673 M993 A2 B2 C2
N12674 M993 A0 B0 C0
N12675 
N12676 
N12677 
N12678 
N12679     M9711 M0 E1 X260 Y141 Z10.6 S11 C10 O0 T3000
N12680 
N12681 
N12682 
N12683 M993 A3 B3 C3
N12684 
N12685 M623
N12686 ; SKIPPABLE_END
N12687 
N12688 ; object ids of this layer51 end: 229
N12689 M625
N12690 ; CHANGE_LAYER
N12691 ; Z_HEIGHT: 10.4
N12692 ; LAYER_HEIGHT: 0.2
N12693 ;======== H2D 20250521========
N12694 ; layer num/total_layer_count: 52/63
N12695 ; update layer progress
N12696 M73 L52
N12697 M991 S0 P51 ;notify layer change
N12698 
N12699 
N12700 ; OBJECT_ID: 229
N12701 ; COOLING_NODE: 0
N12702 ; start printing object, unique label id: 229
N12703 M624 AQAAAAAAAAA=
N12704 G1 X191.084 Y200.639 F60000
N12705 G1 Z10.4
N12706 G1 E.8 F1800
N12707 ; FEATURE: Inner wall
N12708 ; LINE_WIDTH: 0.45
N12709 ; LAYER_HEIGHT: 0.2
N12710 G1 F4421.739
N12711 M204 S8000
N12712 G1 X158.916 Y200.639 E1.03439
N12713 G1 X158.916 Y127.036 E2.36678
N12714 G1 X191.084 Y127.036 E1.03439
N12715 G1 X191.084 Y200.579 E2.36485
N12716 ; COOLING_NODE: 0
N12717 M204 S10000
N12718 G1 X191.491 Y201.046 F60000
N12719 G1 F4421.739
N12720 M204 S8000
N12721 G1 X158.509 Y201.046 E1.06057
N12722 G1 X158.509 Y126.629 E2.39296
N12723 G1 X191.491 Y126.629 E1.06057
N12724 G1 X191.491 Y200.986 E2.39103
N12725 ; COOLING_NODE: 0
N12726 M204 S10000
N12727 G1 X191.898 Y201.453 F60000
N12728 G1 F4421.739
N12729 M204 S8000
N12730 G1 X158.102 Y201.453 E1.08675
N12731 G1 X158.102 Y126.222 E2.41914
N12732 G1 X191.898 Y126.222 E1.08675
N12733 G1 X191.898 Y201.393 E2.41721
N12734 ; COOLING_NODE: 0
N12735 M204 S10000
N12736 G1 X192.29 Y201.845 F60000
N12737 ; FEATURE: Outer wall
N12738 ; LINE_WIDTH: 0.42
N12739 G1 F4773.528
N12740 M204 S5000
N12741 G1 X157.71 Y201.845 E1.03002
N12742 G1 X157.71 Y125.83 E2.26421
N12743 G1 X192.29 Y125.83 E1.03002
N12744 G1 X192.29 Y201.785 E2.26243
N12745 G1 E-.8 F1800
N12746 M204 S10000
N12747 G1 X191.807 Y194.168 Z10.8 F60000
N12748 G1 X190.736 Y177.292 Z10.8
N12749 G1 Z10.4
N12750 G1 E.8 F1800
N12751 ; FEATURE: Sparse infill
N12752 ; LINE_WIDTH: 0.45
N12753 G1 F4421.739
N12754 M204 S8000
N12755 G1 X190.736 Y175.663 E.05236
N12756 G1 X159.264 Y184.096 E1.0477
N12757 G1 X159.264 Y183.758 E.01088
N12758 G1 X175.797 Y200.29 E.75183
N12759 G1 X174.477 Y200.29 E.04245
N12760 G1 X190.736 Y139.612 E2.02003
N12761 G1 X190.736 Y137.983 E.05236
N12762 M204 S10000
N12763 G1 X187.211 Y127.385 F60000
N12764 G1 F4421.739
N12765 M204 S8000
N12766 G1 X185.583 Y127.385 E.05236
N12767 G1 X166.048 Y200.29 E2.42708
N12768 G1 X164.283 Y200.29 E.05675
N12769 G1 X159.264 Y195.272 E.22823
N12770 G1 X159.264 Y194.15 E.03607
N12771 G1 X177.154 Y127.385 E2.22267
N12772 G1 X175.526 Y127.385 E.05236
N12773 M204 S10000
N12774 G1 X190.736 Y152.005 F60000
N12775 G1 F4421.739
N12776 M204 S8000
N12777 G1 X190.736 Y150.377 E.05236
N12778 G1 X159.264 Y158.81 E1.04769
N12779 G1 X159.264 Y160.73 E.06175
N12780 G1 X190.736 Y192.201 E1.43118
N12781 G1 X190.736 Y192.521 E.01029
N12782 G1 X161.74 Y200.29 E.96529
N12783 G1 X160.111 Y200.29 E.05236
N12784 M204 S10000
N12785 G1 X159.264 Y190.896 F60000
N12786 G1 F4421.739
N12787 M204 S8000
N12788 G1 X159.264 Y192.525 E.05236
N12789 G1 X190.736 Y184.092 E1.0477
N12790 G1 X190.736 Y180.687 E.1095
N12791 G1 X159.264 Y149.216 E1.43118
N12792 G1 X159.264 Y150.381 E.03746
N12793 G1 X190.736 Y141.948 E1.0477
N12794 G1 X190.736 Y146.145 E.13496
N12795 G1 X171.975 Y127.385 E.85315
N12796 G1 X168.725 Y127.385 E.1045
N12797 G1 X159.264 Y162.693 E1.17545
N12798 G1 X159.264 Y167.238 E.14615
N12799 G1 X190.736 Y158.806 E1.0477
N12800 G1 X190.736 Y157.659 E.03687
N12801 G1 X160.461 Y127.385 E1.37676
N12802 G1 X160.297 Y127.385 E.00529
N12803 G1 X159.264 Y131.237 E.12823
N12804 G1 X159.264 Y133.523 E.07353
N12805 G1 X182.174 Y127.385 E.76266
N12806 G1 X183.489 Y127.385 E.0423
N12807 M73 P79 R11
N12808 G1 X190.736 Y134.631 E.32954
N12809 G1 X190.736 Y133.519 E.03575
N12810 G1 X159.264 Y141.952 E1.0477
N12811 G1 X159.264 Y137.702 E.13667
N12812 G1 X190.736 Y169.173 E1.43118
N12813 G1 X190.736 Y171.068 E.06095
N12814 G1 X182.906 Y200.29 E.97282
N12815 G1 X187.311 Y200.29 E.14166
N12816 G1 X159.264 Y172.244 E1.27544
N12817 G1 X159.264 Y175.667 E.11008
N12818 G1 X190.736 Y167.234 E1.0477
N12819 G1 X190.736 Y165.606 E.05236
N12820 ; WIPE_START
N12821 G1 X190.736 Y167.234 E-.61876
N12822 G1 X190.377 Y167.331 E-.14124
N12823 ; WIPE_END
N12824 G1 E-.04 F1800
N12825 M204 S10000
N12826 G17
N12827 G3 Z10.8 I1.217 J0 P1  F60000
N12828 ; stop printing object, unique label id: 229
N12829 M625
N12830 ; object ids of layer 52 start: 229
N12831 M624 AQAAAAAAAAA=
N12832 ;======== H2D 20250527========
N12833 ; SKIPPABLE_START
N12834 ; SKIPTYPE: timelapse
N12835 M622.1 S1 ; for prev firware, default turned on
N12836 
N12837 M1002 judge_flag timelapse_record_flag
N12838 
N12839 M622 J1
N12840 M993 A2 B2 C2
N12841 M993 A0 B0 C0
N12842 
N12843 
N12844 
N12845 
N12846     M9711 M0 E1 X260 Y141 Z10.8 S11 C10 O0 T3000
N12847 
N12848 
N12849 
N12850 M993 A3 B3 C3
N12851 
N12852 M623
N12853 ; SKIPPABLE_END
N12854 
N12855 ; object ids of this layer52 end: 229
N12856 M625
N12857 ; CHANGE_LAYER
N12858 ; Z_HEIGHT: 10.6
N12859 ; LAYER_HEIGHT: 0.200001
N12860 ;======== H2D 20250521========
N12861 ; layer num/total_layer_count: 53/63
N12862 ; update layer progress
N12863 M73 L53
N12864 M991 S0 P52 ;notify layer change
N12865 
N12866 
N12867 ; OBJECT_ID: 229
N12868 ; COOLING_NODE: 0
N12869 ; start printing object, unique label id: 229
N12870 M624 AQAAAAAAAAA=
N12871 G1 X191.084 Y200.639 F60000
N12872 G1 Z10.6
N12873 G1 E.8 F1800
N12874 ; FEATURE: Inner wall
N12875 ; LINE_WIDTH: 0.45
N12876 ; LAYER_HEIGHT: 0.2
N12877 G1 F4421.739
N12878 M204 S8000
N12879 G1 X158.916 Y200.639 E1.03439
N12880 G1 X158.916 Y127.036 E2.36678
N12881 G1 X191.084 Y127.036 E1.03439
N12882 G1 X191.084 Y200.579 E2.36485
N12883 ; COOLING_NODE: 0
N12884 M204 S10000
N12885 G1 X191.491 Y201.046 F60000
N12886 G1 F4421.739
N12887 M204 S8000
N12888 G1 X158.509 Y201.046 E1.06057
N12889 G1 X158.509 Y126.629 E2.39296
N12890 G1 X191.491 Y126.629 E1.06057
N12891 G1 X191.491 Y200.986 E2.39103
N12892 ; COOLING_NODE: 0
N12893 M204 S10000
N12894 G1 X191.898 Y201.453 F60000
N12895 G1 F4421.739
N12896 M204 S8000
N12897 G1 X158.102 Y201.453 E1.08675
N12898 G1 X158.102 Y126.222 E2.41914
N12899 G1 X191.898 Y126.222 E1.08675
N12900 G1 X191.898 Y201.393 E2.41721
N12901 ; COOLING_NODE: 0
N12902 M204 S10000
N12903 G1 X192.29 Y201.845 F60000
N12904 ; FEATURE: Outer wall
N12905 ; LINE_WIDTH: 0.42
N12906 G1 F4773.528
N12907 M204 S5000
N12908 G1 X157.71 Y201.845 E1.03002
N12909 G1 X157.71 Y125.83 E2.26421
N12910 G1 X192.29 Y125.83 E1.03002
N12911 G1 X192.29 Y201.785 E2.26243
N12912 G1 E-.8 F1800
N12913 M204 S10000
N12914 G1 X191.804 Y194.168 Z11 F60000
N12915 M73 P79 R10
N12916 G1 X190.736 Y177.438 Z11
N12917 G1 Z10.6
N12918 G1 E.8 F1800
N12919 ; FEATURE: Sparse infill
N12920 ; LINE_WIDTH: 0.45
N12921 G1 F4421.739
N12922 M204 S8000
N12923 G1 X190.736 Y175.81 E.05236
N12924 G1 X159.264 Y184.242 E1.0477
N12925 G1 X159.264 Y183.558 E.02201
N12926 G1 X175.997 Y200.29 E.76093
N12927 G1 X174.33 Y200.29 E.05359
N12928 G1 X190.736 Y139.065 E2.03822
N12929 G1 X190.736 Y137.437 E.05236
N12930 M204 S10000
N12931 G1 X187.065 Y127.385 F60000
N12932 G1 F4421.739
N12933 M204 S8000
N12934 G1 X185.437 Y127.385 E.05236
N12935 G1 X165.902 Y200.29 E2.42708
N12936 G1 X164.483 Y200.29 E.04561
N12937 G1 X159.264 Y195.072 E.23732
N12938 G1 X159.264 Y193.604 E.04721
N12939 G1 X177.008 Y127.385 E2.20448
N12940 G1 X175.379 Y127.385 E.05236
N12941 M204 S10000
N12942 G1 X190.736 Y152.152 F60000
N12943 G1 F4421.739
N12944 M204 S8000
N12945 G1 X190.736 Y150.523 E.05236
N12946 G1 X159.264 Y158.956 E1.0477
N12947 G1 X159.264 Y160.53 E.05061
N12948 G1 X190.736 Y192.001 E1.43118
N12949 G1 X190.736 Y192.667 E.02143
N12950 G1 X162.286 Y200.29 E.9471
N12951 G1 X160.658 Y200.29 E.05236
N12952 M204 S10000
N12953 G1 X159.264 Y192.671 F60000
N12954 G1 F4421.739
N12955 M204 S8000
N12956 G1 X190.736 Y184.238 E1.0477
N12957 G1 X190.736 Y180.487 E.12063
N12958 G1 X159.264 Y149.016 E1.43118
N12959 G1 X159.264 Y150.527 E.0486
N12960 G1 X190.736 Y142.095 E1.0477
N12961 G1 X190.736 Y145.945 E.12382
N12962 G1 X172.175 Y127.385 E.84405
N12963 G1 X168.579 Y127.385 E.11564
N12964 G1 X159.264 Y162.147 E1.15726
N12965 G1 X159.264 Y167.385 E.16843
N12966 G1 X190.736 Y158.952 E1.0477
N12967 G1 X190.736 Y157.459 E.04801
N12968 G1 X160.661 Y127.385 E1.36766
N12969 G1 X160.15 Y127.385 E.01643
N12970 G1 X159.264 Y130.69 E.11004
N12971 G1 X159.264 Y133.67 E.0958
N12972 G1 X182.72 Y127.385 E.78085
N12973 G1 X183.689 Y127.385 E.03116
N12974 G1 X190.736 Y134.431 E.32045
N12975 G1 X190.736 Y133.666 E.02461
N12976 G1 X159.264 Y142.098 E1.04769
N12977 G1 X159.264 Y137.502 E.1478
N12978 G1 X190.736 Y168.973 E1.43118
N12979 G1 X190.736 Y170.522 E.04981
N12980 G1 X182.759 Y200.29 E.99101
N12981 G1 X187.511 Y200.29 E.1528
N12982 G1 X159.264 Y172.044 E1.28454
N12983 G1 X159.264 Y175.814 E.12122
N12984 G1 X190.736 Y167.381 E1.0477
N12985 G1 X190.736 Y165.753 E.05236
N12986 ; WIPE_START
N12987 G1 X190.736 Y167.381 E-.61876
N12988 G1 X190.377 Y167.477 E-.14124
N12989 ; WIPE_END
N12990 G1 E-.04 F1800
N12991 M204 S10000
N12992 G17
N12993 G3 Z11 I1.217 J0 P1  F60000
N12994 ; stop printing object, unique label id: 229
N12995 M625
N12996 ; object ids of layer 53 start: 229
N12997 M624 AQAAAAAAAAA=
N12998 ;======== H2D 20250527========
N12999 ; SKIPPABLE_START
N13000 ; SKIPTYPE: timelapse
N13001 M622.1 S1 ; for prev firware, default turned on
N13002 
N13003 M1002 judge_flag timelapse_record_flag
N13004 
N13005 M622 J1
N13006 M993 A2 B2 C2
N13007 M993 A0 B0 C0
N13008 
N13009 
N13010 
N13011 
N13012     M9711 M0 E1 X260 Y141 Z11 S11 C10 O0 T3000
N13013 
N13014 
N13015 
N13016 M993 A3 B3 C3
N13017 
N13018 M623
N13019 ; SKIPPABLE_END
N13020 
N13021 ; object ids of this layer53 end: 229
N13022 M625
N13023 ; CHANGE_LAYER
N13024 ; Z_HEIGHT: 10.8
N13025 ; LAYER_HEIGHT: 0.2
N13026 ;======== H2D 20250521========
N13027 ; layer num/total_layer_count: 54/63
N13028 ; update layer progress
N13029 M73 L54
N13030 M991 S0 P53 ;notify layer change
N13031 
N13032 
N13033 ; OBJECT_ID: 229
N13034 ; COOLING_NODE: 0
N13035 ; start printing object, unique label id: 229
N13036 M624 AQAAAAAAAAA=
N13037 G1 X191.084 Y200.639 F60000
N13038 G1 Z10.8
N13039 G1 E.8 F1800
N13040 ; FEATURE: Inner wall
N13041 ; LINE_WIDTH: 0.45
N13042 ; LAYER_HEIGHT: 0.2
N13043 G1 F4421.739
N13044 M204 S8000
N13045 G1 X158.916 Y200.639 E1.03439
N13046 G1 X158.916 Y127.036 E2.36678
N13047 G1 X191.084 Y127.036 E1.03439
N13048 G1 X191.084 Y200.579 E2.36485
N13049 ; COOLING_NODE: 0
N13050 M204 S10000
N13051 G1 X191.491 Y201.046 F60000
N13052 G1 F4421.739
N13053 M204 S8000
N13054 G1 X158.509 Y201.046 E1.06057
N13055 G1 X158.509 Y126.629 E2.39296
N13056 G1 X191.491 Y126.629 E1.06057
N13057 G1 X191.491 Y200.986 E2.39103
N13058 ; COOLING_NODE: 0
N13059 M204 S10000
N13060 G1 X191.898 Y201.453 F60000
N13061 M73 P80 R10
N13062 G1 F4421.739
N13063 M204 S8000
N13064 G1 X158.102 Y201.453 E1.08675
N13065 G1 X158.102 Y126.222 E2.41914
N13066 G1 X191.898 Y126.222 E1.08675
N13067 G1 X191.898 Y201.393 E2.41721
N13068 ; COOLING_NODE: 0
N13069 M204 S10000
N13070 G1 X192.29 Y201.845 F60000
N13071 ; FEATURE: Outer wall
N13072 ; LINE_WIDTH: 0.42
N13073 G1 F4773.528
N13074 M204 S5000
N13075 G1 X157.71 Y201.845 E1.03002
N13076 G1 X157.71 Y125.83 E2.26421
N13077 G1 X192.29 Y125.83 E1.03002
N13078 G1 X192.29 Y201.785 E2.26243
N13079 G1 E-.8 F1800
N13080 M204 S10000
N13081 G1 X191.859 Y194.165 Z11.2 F60000
N13082 G1 X190.736 Y174.328 Z11.2
N13083 G1 Z10.8
N13084 G1 E.8 F1800
N13085 ; FEATURE: Sparse infill
N13086 ; LINE_WIDTH: 0.45
N13087 G1 F4421.739
N13088 M204 S8000
N13089 G1 X190.736 Y175.956 E.05236
N13090 G1 X159.264 Y184.389 E1.0477
N13091 G1 X159.264 Y183.358 E.03315
N13092 G1 X176.197 Y200.29 E.77002
N13093 G1 X174.184 Y200.29 E.06473
N13094 G1 X190.736 Y138.519 E2.05641
N13095 G1 X190.736 Y136.891 E.05236
N13096 M204 S10000
N13097 G1 X190.736 Y152.298 F60000
N13098 G1 F4421.739
N13099 M204 S8000
N13100 G1 X190.736 Y150.67 E.05236
N13101 G1 X159.264 Y159.102 E1.0477
N13102 G1 X159.264 Y160.33 E.03947
N13103 G1 X190.736 Y191.801 E1.43118
N13104 G1 X190.736 Y192.814 E.03257
N13105 G1 X162.832 Y200.29 E.92891
N13106 G1 X159.264 Y200.29 E.11473
N13107 G1 X159.264 Y194.872 E.17424
N13108 G1 X164.683 Y200.29 E.24642
N13109 G1 X165.755 Y200.29 E.03447
N13110 G1 X185.29 Y127.385 E2.42708
N13111 G1 X186.918 Y127.385 E.05236
N13112 M204 S10000
N13113 G1 X178.49 Y127.385 F60000
N13114 G1 F4421.739
N13115 M204 S8000
N13116 G1 X176.861 Y127.385 E.05236
N13117 G1 X159.264 Y193.057 E2.18629
N13118 G1 X159.264 Y192.818 E.00771
N13119 G1 X190.736 Y184.385 E1.0477
N13120 G1 X190.736 Y180.287 E.13177
N13121 G1 X159.264 Y148.816 E1.43118
N13122 G1 X159.264 Y150.674 E.05974
N13123 G1 X190.736 Y142.241 E1.0477
N13124 G1 X190.736 Y145.745 E.11268
N13125 G1 X172.375 Y127.385 E.83496
N13126 G1 X168.433 Y127.385 E.12678
N13127 G1 X159.264 Y161.601 E1.13907
N13128 G1 X159.264 Y167.531 E.19071
N13129 G1 X190.736 Y159.099 E1.0477
N13130 G1 X190.736 Y157.259 E.05915
N13131 G1 X160.861 Y127.385 E1.35857
N13132 G1 X160.004 Y127.385 E.02757
N13133 G1 X159.264 Y130.144 E.09185
N13134 G1 X159.264 Y131.772 E.05236
N13135 M204 S10000
N13136 G1 X159.264 Y143.873 F60000
N13137 G1 F4421.739
N13138 M204 S8000
N13139 G1 X159.264 Y142.245 E.05236
N13140 G1 X190.736 Y133.812 E1.0477
N13141 G1 X190.736 Y134.231 E.01348
N13142 G1 X183.889 Y127.385 E.31135
N13143 G1 X183.266 Y127.385 E.02002
N13144 G1 X159.264 Y133.816 E.79904
N13145 G1 X159.264 Y137.302 E.1121
N13146 G1 X190.736 Y168.773 E1.43118
N13147 G1 X190.736 Y169.976 E.03867
N13148 G1 X182.613 Y200.29 E1.0092
N13149 G1 X187.711 Y200.29 E.16394
N13150 G1 X159.264 Y171.844 E1.29363
N13151 G1 X159.264 Y175.96 E.13236
N13152 G1 X190.736 Y167.527 E1.0477
N13153 G1 X190.736 Y165.899 E.05236
N13154 ; WIPE_START
N13155 G1 X190.736 Y167.527 E-.61876
N13156 G1 X190.377 Y167.623 E-.14124
N13157 ; WIPE_END
N13158 G1 E-.04 F1800
N13159 M204 S10000
N13160 G17
N13161 G3 Z11.2 I1.217 J0 P1  F60000
N13162 ; stop printing object, unique label id: 229
N13163 M625
N13164 ; object ids of layer 54 start: 229
N13165 M624 AQAAAAAAAAA=
N13166 ;======== H2D 20250527========
N13167 ; SKIPPABLE_START
N13168 ; SKIPTYPE: timelapse
N13169 M622.1 S1 ; for prev firware, default turned on
N13170 
N13171 M1002 judge_flag timelapse_record_flag
N13172 
N13173 M622 J1
N13174 M993 A2 B2 C2
N13175 M993 A0 B0 C0
N13176 
N13177 
N13178 
N13179 
N13180     M9711 M0 E1 X260 Y141 Z11.2 S11 C10 O0 T3000
N13181 
N13182 
N13183 
N13184 M993 A3 B3 C3
N13185 
N13186 M623
N13187 ; SKIPPABLE_END
N13188 
N13189 ; object ids of this layer54 end: 229
N13190 M625
N13191 ; CHANGE_LAYER
N13192 ; Z_HEIGHT: 11
N13193 ; LAYER_HEIGHT: 0.2
N13194 ;======== H2D 20250521========
N13195 ; layer num/total_layer_count: 55/63
N13196 ; update layer progress
N13197 M73 L55
N13198 M991 S0 P54 ;notify layer change
N13199 
N13200 
N13201 ; OBJECT_ID: 229
N13202 ; COOLING_NODE: 0
N13203 ; start printing object, unique label id: 229
N13204 M624 AQAAAAAAAAA=
N13205 G1 X191.084 Y200.639 F60000
N13206 G1 Z11
N13207 G1 E.8 F1800
N13208 ; FEATURE: Inner wall
N13209 ; LINE_WIDTH: 0.45
N13210 ; LAYER_HEIGHT: 0.2
N13211 G1 F4421.739
N13212 M204 S8000
N13213 G1 X158.916 Y200.639 E1.03439
N13214 G1 X158.916 Y127.036 E2.36678
N13215 G1 X191.084 Y127.036 E1.03439
N13216 G1 X191.084 Y200.579 E2.36485
N13217 ; COOLING_NODE: 0
N13218 M204 S10000
N13219 G1 X191.491 Y201.046 F60000
N13220 G1 F4421.739
N13221 M204 S8000
N13222 G1 X158.509 Y201.046 E1.06057
N13223 G1 X158.509 Y126.629 E2.39296
N13224 G1 X191.491 Y126.629 E1.06057
N13225 G1 X191.491 Y200.986 E2.39103
N13226 ; COOLING_NODE: 0
N13227 M204 S10000
N13228 G1 X191.898 Y201.453 F60000
N13229 G1 F4421.739
N13230 M204 S8000
N13231 G1 X158.102 Y201.453 E1.08675
N13232 G1 X158.102 Y126.222 E2.41914
N13233 G1 X191.898 Y126.222 E1.08675
N13234 G1 X191.898 Y201.393 E2.41721
N13235 ; COOLING_NODE: 0
N13236 M204 S10000
N13237 G1 X192.29 Y201.845 F60000
N13238 ; FEATURE: Outer wall
N13239 ; LINE_WIDTH: 0.42
N13240 G1 F4773.528
N13241 M204 S5000
N13242 G1 X157.71 Y201.845 E1.03002
N13243 G1 X157.71 Y125.83 E2.26421
N13244 G1 X192.29 Y125.83 E1.03002
N13245 G1 X192.29 Y201.785 E2.26243
N13246 G1 E-.8 F1800
N13247 M204 S10000
N13248 G1 X191.534 Y194.19 Z11.4 F60000
N13249 M73 P81 R10
N13250 G1 X190.736 Y186.16 Z11.4
N13251 G1 Z11
N13252 G1 E.8 F1800
N13253 ; FEATURE: Sparse infill
N13254 ; LINE_WIDTH: 0.45
N13255 G1 F4421.739
N13256 M204 S8000
N13257 G1 X190.736 Y184.531 E.05236
N13258 G1 X159.264 Y192.964 E1.0477
N13259 G1 X159.264 Y192.511 E.01457
N13260 G1 X176.715 Y127.385 E2.1681
N13261 G1 X172.575 Y127.385 E.13312
N13262 G1 X190.736 Y145.545 E.82586
N13263 G1 X190.736 Y142.387 E.10154
N13264 G1 X159.264 Y150.82 E1.0477
N13265 G1 X159.264 Y148.616 E.07088
N13266 G1 X190.736 Y180.087 E1.43118
N13267 G1 X190.736 Y176.103 E.12813
N13268 G1 X159.264 Y184.535 E1.0477
N13269 G1 X159.264 Y183.158 E.04429
N13270 G1 X176.397 Y200.29 E.77912
N13271 G1 X174.038 Y200.29 E.07587
N13272 G1 X190.736 Y137.972 E2.0746
N13273 G1 X190.736 Y136.344 E.05236
N13274 M204 S10000
N13275 G1 X186.772 Y127.385 F60000
N13276 G1 F4421.739
N13277 M204 S8000
N13278 G1 X185.144 Y127.385 E.05236
N13279 G1 X165.609 Y200.29 E2.42708
N13280 G1 X164.883 Y200.29 E.02333
N13281 G1 X159.264 Y194.672 E.25551
N13282 G1 X159.264 Y200.29 E.18067
N13283 G1 X163.379 Y200.29 E.1323
N13284 G1 X190.736 Y192.96 E.91072
N13285 G1 X190.736 Y191.601 E.04371
N13286 G1 X159.264 Y160.13 E1.43118
N13287 M204 S10000
N13288 G1 X159.264 Y157.62 F60000
N13289 G1 F4421.739
N13290 M204 S8000
N13291 G1 X159.264 Y159.249 E.05236
N13292 G1 X190.736 Y150.816 E1.0477
N13293 G1 X190.736 Y152.444 E.05236
N13294 M204 S10000
N13295 G1 X190.736 Y166.045 F60000
N13296 G1 F4421.739
N13297 M204 S8000
N13298 G1 X190.736 Y167.674 E.05236
N13299 G1 X159.264 Y176.106 E1.0477
N13300 G1 X159.264 Y177.735 E.05236
N13301 M204 S10000
N13302 G1 X159.264 Y162.682 F60000
N13303 G1 F4421.739
N13304 M204 S8000
N13305 M73 P81 R9
N13306 G1 X159.264 Y161.054 E.05236
N13307 G1 X168.286 Y127.385 E1.12088
N13308 G1 X166.658 Y127.385 E.05236
N13309 M204 S10000
N13310 G1 X159.264 Y131.226 F60000
N13311 G1 F4421.739
N13312 M204 S8000
N13313 G1 X159.264 Y129.597 E.05236
N13314 G1 X159.857 Y127.385 E.07366
N13315 G1 X161.061 Y127.385 E.03871
N13316 G1 X190.736 Y157.059 E1.34947
N13317 G1 X190.736 Y159.245 E.07029
N13318 G1 X159.264 Y167.678 E1.04769
N13319 G1 X159.264 Y171.644 E.12754
N13320 G1 X187.911 Y200.29 E1.30273
N13321 G1 X182.466 Y200.29 E.17508
N13322 G1 X190.736 Y169.429 E1.02739
N13323 G1 X190.736 Y168.573 E.02753
N13324 G1 X159.264 Y137.102 E1.43118
N13325 G1 X159.264 Y133.962 E.10096
N13326 G1 X183.813 Y127.385 E.81723
N13327 G1 X184.089 Y127.385 E.00888
N13328 G1 X190.736 Y134.031 E.30226
N13329 G1 X190.736 Y133.959 E.00234
N13330 G1 X159.264 Y142.391 E1.0477
N13331 G1 X159.264 Y144.02 E.05236
N13332 ; WIPE_START
N13333 G1 X159.264 Y142.391 E-.61876
N13334 G1 X159.623 Y142.295 E-.14124
N13335 ; WIPE_END
N13336 G1 E-.04 F1800
N13337 M204 S10000
N13338 G17
N13339 G3 Z11.4 I1.217 J0 P1  F60000
N13340 ; stop printing object, unique label id: 229
N13341 M625
N13342 ; object ids of layer 55 start: 229
N13343 M624 AQAAAAAAAAA=
N13344 ;======== H2D 20250527========
N13345 ; SKIPPABLE_START
N13346 ; SKIPTYPE: timelapse
N13347 M622.1 S1 ; for prev firware, default turned on
N13348 
N13349 M1002 judge_flag timelapse_record_flag
N13350 
N13351 M622 J1
N13352 M993 A2 B2 C2
N13353 M993 A0 B0 C0
N13354 
N13355 
N13356 
N13357 
N13358     M9711 M0 E1 X260 Y141 Z11.4 S11 C10 O0 T3000
N13359 
N13360 
N13361 
N13362 M993 A3 B3 C3
N13363 
N13364 M623
N13365 ; SKIPPABLE_END
N13366 
N13367 ; object ids of this layer55 end: 229
N13368 M625
N13369 ; CHANGE_LAYER
N13370 ; Z_HEIGHT: 11.2
N13371 ; LAYER_HEIGHT: 0.2
N13372 ;======== H2D 20250521========
N13373 ; layer num/total_layer_count: 56/63
N13374 ; update layer progress
N13375 M73 L56
N13376 M991 S0 P55 ;notify layer change
N13377 
N13378 
N13379 ; OBJECT_ID: 229
N13380 ; COOLING_NODE: 0
N13381 ; start printing object, unique label id: 229
N13382 M624 AQAAAAAAAAA=
N13383 G1 X191.084 Y200.639 F60000
N13384 G1 Z11.2
N13385 G1 E.8 F1800
N13386 ; FEATURE: Inner wall
N13387 ; LINE_WIDTH: 0.45
N13388 ; LAYER_HEIGHT: 0.2
N13389 G1 F4421.739
N13390 M204 S8000
N13391 G1 X158.916 Y200.639 E1.03439
N13392 G1 X158.916 Y127.036 E2.36678
N13393 G1 X191.084 Y127.036 E1.03439
N13394 G1 X191.084 Y200.579 E2.36485
N13395 ; COOLING_NODE: 0
N13396 M204 S10000
N13397 G1 X191.491 Y201.046 F60000
N13398 G1 F4421.739
N13399 M204 S8000
N13400 G1 X158.509 Y201.046 E1.06057
N13401 G1 X158.509 Y126.629 E2.39296
N13402 G1 X191.491 Y126.629 E1.06057
N13403 G1 X191.491 Y200.986 E2.39103
N13404 ; COOLING_NODE: 0
N13405 M204 S10000
N13406 G1 X191.898 Y201.453 F60000
N13407 G1 F4421.739
N13408 M204 S8000
N13409 G1 X158.102 Y201.453 E1.08675
N13410 G1 X158.102 Y126.222 E2.41914
N13411 G1 X191.898 Y126.222 E1.08675
N13412 G1 X191.898 Y201.393 E2.41721
N13413 ; COOLING_NODE: 0
N13414 M204 S10000
N13415 G1 X192.29 Y201.845 F60000
N13416 ; FEATURE: Outer wall
N13417 ; LINE_WIDTH: 0.42
N13418 G1 F4773.528
N13419 M204 S5000
N13420 G1 X157.71 Y201.845 E1.03002
N13421 G1 X157.71 Y125.83 E2.26421
N13422 G1 X192.29 Y125.83 E1.03002
N13423 G1 X192.29 Y201.785 E2.26243
N13424 G1 E-.8 F1800
N13425 M204 S10000
N13426 G1 X191.527 Y194.191 Z11.6 F60000
N13427 G1 X190.736 Y186.306 Z11.6
N13428 G1 Z11.2
N13429 G1 E.8 F1800
N13430 ; FEATURE: Sparse infill
N13431 ; LINE_WIDTH: 0.45
N13432 G1 F4421.739
N13433 M204 S8000
N13434 G1 X190.736 Y184.678 E.05236
N13435 G1 X159.264 Y193.11 E1.04769
N13436 G1 X159.264 Y191.964 E.03685
N13437 G1 X176.569 Y127.385 E2.1499
N13438 G1 X172.775 Y127.385 E.12198
N13439 G1 X190.736 Y145.345 E.81677
N13440 G1 X190.736 Y142.534 E.0904
N13441 G1 X159.264 Y150.966 E1.04769
N13442 G1 X159.264 Y148.416 E.08201
N13443 G1 X190.736 Y179.887 E1.43118
N13444 G1 X190.736 Y176.249 E.11699
N13445 G1 X159.264 Y184.682 E1.0477
N13446 G1 X159.264 Y182.958 E.05543
N13447 G1 X176.597 Y200.29 E.78821
N13448 G1 X173.891 Y200.29 E.08701
N13449 G1 X190.736 Y137.426 E2.0928
N13450 G1 X190.736 Y135.798 E.05236
N13451 M204 S10000
N13452 G1 X186.626 Y127.385 F60000
N13453 G1 F4421.739
N13454 M204 S8000
N13455 G1 X184.997 Y127.385 E.05236
N13456 G1 X165.462 Y200.29 E2.42708
N13457 G1 X167.091 Y200.29 E.05236
N13458 M204 S10000
N13459 G1 X165.083 Y200.29 F60000
N13460 G1 F4421.739
N13461 M204 S8000
N13462 M73 P82 R9
N13463 G1 X159.264 Y194.472 E.26461
N13464 G1 X159.264 Y200.29 E.18711
N13465 G1 X163.925 Y200.29 E.14988
N13466 G1 X190.736 Y193.107 E.89253
N13467 G1 X190.736 Y191.401 E.05484
N13468 G1 X159.264 Y159.93 E1.43118
N13469 M204 S10000
N13470 G1 X159.264 Y159.395 F60000
N13471 G1 F4421.739
N13472 M204 S8000
N13473 G1 X190.736 Y150.963 E1.0477
N13474 G1 X190.736 Y152.591 E.05236
N13475 M204 S10000
N13476 G1 X190.736 Y166.192 F60000
N13477 G1 F4421.739
N13478 M204 S8000
N13479 G1 X190.736 Y167.82 E.05236
N13480 G1 X159.264 Y176.253 E1.0477
N13481 G1 X159.264 Y177.881 E.05236
N13482 M204 S10000
N13483 G1 X159.264 Y162.136 F60000
N13484 G1 F4421.739
N13485 M204 S8000
N13486 G1 X159.264 Y160.508 E.05236
N13487 G1 X168.14 Y127.385 E1.10269
N13488 G1 X166.511 Y127.385 E.05236
N13489 M204 S10000
N13490 G1 X159.264 Y130.679 F60000
N13491 G1 F4421.739
N13492 M204 S8000
N13493 G1 X159.264 Y129.051 E.05236
N13494 G1 X159.711 Y127.385 E.05547
N13495 G1 X161.261 Y127.385 E.04985
N13496 G1 X190.736 Y156.859 E1.34038
N13497 G1 X190.736 Y159.391 E.08143
N13498 G1 X159.264 Y167.824 E1.0477
N13499 G1 X159.264 Y171.444 E.1164
N13500 G1 X188.111 Y200.29 E1.31182
N13501 G1 X182.32 Y200.29 E.18622
N13502 G1 X190.736 Y168.883 E1.04558
N13503 G1 X190.736 Y168.373 E.01639
N13504 G1 X159.264 Y136.902 E1.43118
N13505 G1 X159.264 Y134.109 E.08982
N13506 G1 X184.359 Y127.385 E.83542
N13507 G1 X184.289 Y127.385 E.00226
N13508 G1 X190.736 Y133.831 E.29316
N13509 G1 X190.736 Y134.105 E.0088
N13510 G1 X159.264 Y142.538 E1.0477
N13511 G1 X159.264 Y144.166 E.05236
N13512 ; WIPE_START
N13513 G1 X159.264 Y142.538 E-.61876
N13514 G1 X159.623 Y142.441 E-.14124
N13515 ; WIPE_END
N13516 G1 E-.04 F1800
N13517 M204 S10000
N13518 G17
N13519 G3 Z11.6 I1.217 J0 P1  F60000
N13520 ; stop printing object, unique label id: 229
N13521 M625
N13522 ; object ids of layer 56 start: 229
N13523 M624 AQAAAAAAAAA=
N13524 ;======== H2D 20250527========
N13525 ; SKIPPABLE_START
N13526 ; SKIPTYPE: timelapse
N13527 M622.1 S1 ; for prev firware, default turned on
N13528 
N13529 M1002 judge_flag timelapse_record_flag
N13530 
N13531 M622 J1
N13532 M993 A2 B2 C2
N13533 M993 A0 B0 C0
N13534 
N13535 
N13536 
N13537 
N13538     M9711 M0 E1 X260 Y141 Z11.6 S11 C10 O0 T3000
N13539 
N13540 
N13541 
N13542 M993 A3 B3 C3
N13543 
N13544 M623
N13545 ; SKIPPABLE_END
N13546 
N13547 ; object ids of this layer56 end: 229
N13548 M625
N13549 ; CHANGE_LAYER
N13550 ; Z_HEIGHT: 11.4
N13551 ; LAYER_HEIGHT: 0.2
N13552 ;======== H2D 20250521========
N13553 ; layer num/total_layer_count: 57/63
N13554 ; update layer progress
N13555 M73 L57
N13556 M991 S0 P56 ;notify layer change
N13557 
N13558 
N13559 ; OBJECT_ID: 229
N13560 ; COOLING_NODE: 0
N13561 ; start printing object, unique label id: 229
N13562 M624 AQAAAAAAAAA=
N13563 G1 X191.084 Y200.639 F60000
N13564 G1 Z11.4
N13565 G1 E.8 F1800
N13566 ; FEATURE: Inner wall
N13567 ; LINE_WIDTH: 0.45
N13568 ; LAYER_HEIGHT: 0.2
N13569 G1 F4421.739
N13570 M204 S8000
N13571 G1 X158.916 Y200.639 E1.03439
N13572 G1 X158.916 Y127.036 E2.36678
N13573 G1 X191.084 Y127.036 E1.03439
N13574 G1 X191.084 Y200.579 E2.36485
N13575 ; COOLING_NODE: 0
N13576 M204 S10000
N13577 G1 X191.491 Y201.046 F60000
N13578 G1 F4421.739
N13579 M204 S8000
N13580 G1 X158.509 Y201.046 E1.06057
N13581 G1 X158.509 Y126.629 E2.39296
N13582 G1 X191.491 Y126.629 E1.06057
N13583 G1 X191.491 Y200.986 E2.39103
N13584 ; COOLING_NODE: 0
N13585 M204 S10000
N13586 G1 X191.898 Y201.453 F60000
N13587 G1 F4421.739
N13588 M204 S8000
N13589 G1 X158.102 Y201.453 E1.08675
N13590 G1 X158.102 Y126.222 E2.41914
N13591 G1 X191.898 Y126.222 E1.08675
N13592 G1 X191.898 Y201.393 E2.41721
N13593 ; COOLING_NODE: 0
N13594 M204 S10000
N13595 G1 X192.29 Y201.845 F60000
N13596 ; FEATURE: Outer wall
N13597 ; LINE_WIDTH: 0.42
N13598 G1 F4773.528
N13599 M204 S5000
N13600 G1 X157.71 Y201.845 E1.03002
N13601 G1 X157.71 Y125.83 E2.26421
N13602 G1 X192.29 Y125.83 E1.03002
N13603 G1 X192.29 Y201.785 E2.26243
N13604 G1 E-.8 F1800
N13605 M204 S10000
N13606 G1 X191.52 Y194.191 Z11.8 F60000
N13607 G1 X190.736 Y186.452 Z11.8
N13608 G1 Z11.4
N13609 G1 E.8 F1800
N13610 ; FEATURE: Sparse infill
N13611 ; LINE_WIDTH: 0.45
N13612 G1 F4421.739
N13613 M204 S8000
N13614 G1 X190.736 Y184.824 E.05236
N13615 G1 X159.264 Y193.257 E1.0477
N13616 G1 X159.264 Y194.272 E.03264
N13617 G1 X165.283 Y200.29 E.2737
N13618 M204 S10000
N13619 G1 X165.316 Y200.29 F60000
N13620 G1 F4421.739
N13621 M204 S8000
N13622 G1 X184.851 Y127.385 E2.42708
N13623 G1 X184.906 Y127.385 E.00176
N13624 G1 X159.264 Y134.255 E.85361
N13625 G1 X159.264 Y136.702 E.07868
N13626 G1 X190.736 Y168.173 E1.43118
N13627 G1 X190.736 Y168.336 E.00525
N13628 G1 X182.174 Y200.29 E1.06377
N13629 G1 X188.311 Y200.29 E.19736
N13630 G1 X159.264 Y171.244 E1.32092
N13631 G1 X159.264 Y167.97 E.10526
N13632 G1 X190.736 Y159.538 E1.0477
N13633 G1 X190.736 Y156.659 E.09257
N13634 G1 X161.461 Y127.385 E1.33128
N13635 G1 X159.565 Y127.385 E.06099
N13636 G1 X159.264 Y128.505 E.03728
N13637 G1 X159.264 Y130.133 E.05236
N13638 M204 S10000
N13639 G1 X166.365 Y127.385 F60000
N13640 G1 F4421.739
N13641 M204 S8000
N13642 G1 X167.993 Y127.385 E.05236
N13643 G1 X159.264 Y159.961 E1.0845
N13644 G1 X159.264 Y159.73 E.00744
N13645 G1 X190.736 Y191.201 E1.43118
N13646 G1 X190.736 Y193.253 E.06598
N13647 G1 X164.472 Y200.29 E.87434
N13648 G1 X162.843 Y200.29 E.05236
N13649 M204 S10000
N13650 G1 X159.264 Y193.046 F60000
N13651 G1 F4421.739
N13652 M204 S8000
N13653 G1 X159.264 Y191.418 E.05236
N13654 G1 X176.422 Y127.385 E2.13171
N13655 G1 X172.975 Y127.385 E.11084
N13656 G1 X190.736 Y145.145 E.80767
N13657 G1 X190.736 Y142.68 E.07927
N13658 G1 X159.264 Y151.113 E1.0477
N13659 G1 X159.264 Y148.216 E.09315
N13660 G1 X190.736 Y179.687 E1.43118
N13661 G1 X190.736 Y176.395 E.10585
N13662 G1 X159.264 Y184.828 E1.0477
N13663 G1 X159.264 Y182.758 E.06657
N13664 G1 X176.797 Y200.29 E.79731
N13665 G1 X173.745 Y200.29 E.09815
N13666 G1 X190.736 Y136.88 E2.11099
N13667 G1 X190.736 Y135.251 E.05236
N13668 M204 S10000
N13669 G1 X184.489 Y127.385 F60000
N13670 G1 F4421.739
N13671 M204 S8000
N13672 G1 X190.736 Y133.631 E.28407
N13673 G1 X190.736 Y134.251 E.01994
N13674 G1 X159.264 Y142.684 E1.0477
N13675 G1 X159.264 Y141.056 E.05236
N13676 M204 S10000
N13677 G1 X159.264 Y159.542 F60000
N13678 G1 F4421.739
N13679 M204 S8000
N13680 G1 X190.736 Y151.109 E1.0477
N13681 G1 X190.736 Y149.481 E.05236
N13682 M204 S10000
N13683 G1 X190.736 Y166.338 F60000
N13684 G1 F4421.739
N13685 M204 S8000
N13686 G1 X190.736 Y167.967 E.05236
N13687 G1 X159.264 Y176.399 E1.0477
N13688 M73 P83 R9
N13689 G1 X159.264 Y178.027 E.05236
N13690 ; WIPE_START
N13691 G1 X159.264 Y176.399 E-.61876
N13692 G1 X159.623 Y176.303 E-.14124
N13693 ; WIPE_END
N13694 G1 E-.04 F1800
N13695 M204 S10000
N13696 G17
N13697 G3 Z11.8 I1.217 J0 P1  F60000
N13698 ; stop printing object, unique label id: 229
N13699 M625
N13700 ; object ids of layer 57 start: 229
N13701 M624 AQAAAAAAAAA=
N13702 ;======== H2D 20250527========
N13703 ; SKIPPABLE_START
N13704 ; SKIPTYPE: timelapse
N13705 M622.1 S1 ; for prev firware, default turned on
N13706 
N13707 M1002 judge_flag timelapse_record_flag
N13708 
N13709 M622 J1
N13710 M993 A2 B2 C2
N13711 M993 A0 B0 C0
N13712 
N13713 
N13714 
N13715 
N13716     M9711 M0 E1 X260 Y141 Z11.8 S11 C10 O0 T3000
N13717 
N13718 
N13719 
N13720 M993 A3 B3 C3
N13721 
N13722 M623
N13723 ; SKIPPABLE_END
N13724 
N13725 ; object ids of this layer57 end: 229
N13726 M625
N13727 ; CHANGE_LAYER
N13728 ; Z_HEIGHT: 11.6
N13729 ; LAYER_HEIGHT: 0.200001
N13730 ;======== H2D 20250521========
N13731 ; layer num/total_layer_count: 58/63
N13732 ; update layer progress
N13733 M73 L58
N13734 M991 S0 P57 ;notify layer change
N13735 
N13736 
N13737 M106 S40.8
N13738 ; OBJECT_ID: 229
N13739 ; COOLING_NODE: 0
N13740 ; start printing object, unique label id: 229
N13741 M624 AQAAAAAAAAA=
N13742 G1 X191.084 Y200.639 F60000
N13743 G1 Z11.6
N13744 G1 E.8 F1800
N13745 ; FEATURE: Inner wall
N13746 ; LINE_WIDTH: 0.45
N13747 ; LAYER_HEIGHT: 0.2
N13748 G1 F4421.739
N13749 M204 S8000
N13750 G1 X158.916 Y200.639 E1.03439
N13751 G1 X158.916 Y127.036 E2.36678
N13752 G1 X191.084 Y127.036 E1.03439
N13753 G1 X191.084 Y200.579 E2.36485
N13754 ; COOLING_NODE: 0
N13755 M204 S10000
N13756 G1 X191.491 Y201.046 F60000
N13757 G1 F4421.739
N13758 M204 S8000
N13759 G1 X158.509 Y201.046 E1.06057
N13760 G1 X158.509 Y126.629 E2.39296
N13761 G1 X191.491 Y126.629 E1.06057
N13762 G1 X191.491 Y200.986 E2.39103
N13763 ; COOLING_NODE: 0
N13764 M204 S10000
N13765 G1 X191.898 Y201.453 F60000
N13766 G1 F4421.739
N13767 M204 S8000
N13768 M73 P83 R8
N13769 G1 X158.102 Y201.453 E1.08675
N13770 G1 X158.102 Y126.222 E2.41914
N13771 G1 X191.898 Y126.222 E1.08675
N13772 G1 X191.898 Y201.393 E2.41721
N13773 ; COOLING_NODE: 0
N13774 M204 S10000
N13775 G1 X192.29 Y201.845 F60000
N13776 ; FEATURE: Outer wall
N13777 ; LINE_WIDTH: 0.42
N13778 G1 F4773.528
N13779 M204 S5000
N13780 G1 X157.71 Y201.845 E1.03002
N13781 G1 X157.71 Y125.83 E2.26421
N13782 G1 X192.29 Y125.83 E1.03002
N13783 G1 X192.29 Y201.785 E2.26243
N13784 G1 E-.8 F1800
N13785 M204 S10000
N13786 G1 X191.491 Y194.194 Z12 F60000
N13787 G1 X190.358 Y183.443 Z12
N13788 G1 Z11.6
N13789 G1 E.8 F1800
N13790 ; FEATURE: Sparse infill
N13791 ; LINE_WIDTH: 0.45
N13792 G1 F4421.739
N13793 M204 S8000
N13794 G1 X190.358 Y185.072 E.05236
N13795 G1 X159.642 Y193.302 E1.02258
N13796 G1 X159.642 Y194.449 E.03687
N13797 G1 X165.106 Y199.913 E.24849
N13798 G1 X165.271 Y199.913 E.0053
N13799 G1 X184.603 Y127.762 E2.40197
N13800 G1 X185.066 Y127.762 E.01488
N13801 G1 X190.358 Y133.054 E.24067
N13802 G1 X190.358 Y134.499 E.04646
N13803 G1 X159.642 Y142.729 E1.02258
N13804 G1 X159.642 Y141.101 E.05236
N13805 M204 S10000
N13806 G1 X159.642 Y159.383 F60000
N13807 G1 F4421.739
N13808 M204 S8000
N13809 G1 X159.642 Y158.007 E.04425
N13810 G1 X167.746 Y127.762 E1.00689
N13811 G1 X162.038 Y127.762 E.18353
N13812 G1 X190.358 Y156.082 E1.28788
N13813 G1 X190.358 Y159.785 E.11908
N13814 G1 X159.642 Y168.016 E1.02258
N13815 G1 X159.642 Y171.421 E.1095
N13816 G1 X188.134 Y199.913 E1.29571
N13817 G1 X182.128 Y199.913 E.19312
N13818 G1 X190.358 Y169.198 E1.02254
N13819 G1 X190.358 Y168.418 E.02508
N13820 M204 S10000
N13821 G1 X190.358 Y149.728 F60000
N13822 G1 F4421.739
N13823 M204 S8000
N13824 G1 X190.358 Y151.356 E.05236
N13825 G1 X159.642 Y159.587 E1.02258
N13826 G1 X159.642 Y159.907 E.01029
N13827 G1 X190.358 Y190.624 E1.39687
N13828 G1 X190.358 Y193.5 E.0925
N13829 G1 X166.426 Y199.913 E.79674
N13830 G1 X165.474 Y199.913 E.0306
N13831 M204 S10000
N13832 G1 X159.642 Y191.092 F60000
N13833 G1 F4421.739
N13834 M204 S8000
N13835 G1 X159.642 Y189.464 E.05236
N13836 G1 X176.175 Y127.762 E2.05411
N13837 G1 X173.552 Y127.762 E.08433
N13838 G1 X190.358 Y144.568 E.76428
N13839 G1 X190.358 Y142.928 E.05275
N13840 G1 X159.642 Y151.158 E1.02258
N13841 G1 X159.642 Y148.393 E.08891
N13842 G1 X190.358 Y179.11 E1.39687
N13843 G1 X190.358 Y176.643 E.07933
N13844 G1 X159.642 Y184.873 E1.02258
N13845 G1 X159.642 Y182.935 E.06233
N13846 G1 X176.62 Y199.913 E.7721
N13847 G1 X173.699 Y199.913 E.09391
N13848 G1 X190.358 Y137.741 E2.06976
N13849 G1 X190.358 Y136.113 E.05236
N13850 M204 S10000
N13851 G1 X190.562 Y127.399 F60000
N13852 ; FEATURE: Floating vertical shell
N13853 ; LINE_WIDTH: 0.383001
N13854 G1 F5292.864
N13855 M204 S8000
N13856 G1 X159.438 Y127.399 E.83611
N13857 G1 X159.306 Y127.426 E.00362
N13858 G1 X159.279 Y127.558 E.00362
N13859 G1 X159.279 Y200.117 E1.9492
N13860 G1 X159.306 Y200.249 E.00362
N13861 G1 X159.438 Y200.276 E.00362
N13862 G1 X190.562 Y200.276 E.83611
N13863 G1 X190.694 Y200.249 E.00362
N13864 G1 X190.721 Y200.117 E.00362
N13865 G1 X190.721 Y127.558 E1.9492
N13866 G1 X190.694 Y127.426 E.00362
N13867 G1 X190.621 Y127.411 E.00201
N13868 M204 S10000
N13869 G1 X184.4 Y127.762 F60000
N13870 ; FEATURE: Sparse infill
N13871 ; LINE_WIDTH: 0.45
N13872 G1 F4421.739
N13873 M204 S8000
N13874 G1 X184.044 Y127.762 E.01143
N13875 G1 X159.642 Y134.301 E.81239
N13876 G1 X159.642 Y136.879 E.08292
N13877 G1 X190.358 Y167.596 E1.39687
N13878 G1 X190.358 Y168.214 E.01988
N13879 G1 X159.642 Y176.445 E1.02258
N13880 G1 X159.642 Y178.073 E.05236
N13881 ; WIPE_START
N13882 G1 X159.642 Y176.445 E-.61876
N13883 G1 X160.001 Y176.348 E-.14124
N13884 ; WIPE_END
N13885 G1 E-.04 F1800
N13886 M204 S10000
N13887 G17
N13888 G3 Z12 I1.217 J0 P1  F60000
N13889 ; stop printing object, unique label id: 229
N13890 M625
N13891 ; object ids of layer 58 start: 229
N13892 M624 AQAAAAAAAAA=
N13893 ;======== H2D 20250527========
N13894 ; SKIPPABLE_START
N13895 ; SKIPTYPE: timelapse
N13896 M622.1 S1 ; for prev firware, default turned on
N13897 
N13898 M1002 judge_flag timelapse_record_flag
N13899 
N13900 M622 J1
N13901 M993 A2 B2 C2
N13902 M993 A0 B0 C0
N13903 
N13904 
N13905 
N13906 
N13907     M9711 M0 E1 X260 Y141 Z12 S11 C10 O0 T3000
N13908 
N13909 
N13910 
N13911 M993 A3 B3 C3
N13912 
N13913 M623
N13914 ; SKIPPABLE_END
N13915 
N13916 ; object ids of this layer58 end: 229
N13917 M625
N13918 ; CHANGE_LAYER
N13919 ; Z_HEIGHT: 11.8
N13920 ; LAYER_HEIGHT: 0.2
N13921 ;======== H2D 20250521========
N13922 ; layer num/total_layer_count: 59/63
N13923 ; update layer progress
N13924 M73 L59
N13925 M991 S0 P58 ;notify layer change
N13926 
N13927 
N13928 M106 S25.5
N13929 ; OBJECT_ID: 229
N13930 ; COOLING_NODE: 0
N13931 ; start printing object, unique label id: 229
N13932 M624 AQAAAAAAAAA=
N13933 G1 X191.084 Y200.639 F60000
N13934 G1 Z11.8
N13935 G1 E.8 F1800
N13936 ; FEATURE: Inner wall
N13937 ; LINE_WIDTH: 0.45
N13938 ; LAYER_HEIGHT: 0.2
N13939 G1 F4421.739
N13940 M204 S8000
N13941 G1 X158.916 Y200.639 E1.03439
N13942 G1 X158.916 Y127.036 E2.36678
N13943 G1 X191.084 Y127.036 E1.03439
N13944 G1 X191.084 Y200.579 E2.36485
N13945 ; COOLING_NODE: 0
N13946 M204 S10000
N13947 G1 X191.491 Y201.046 F60000
N13948 G1 F4421.739
N13949 M204 S8000
N13950 G1 X158.509 Y201.046 E1.06057
N13951 G1 X158.509 Y126.629 E2.39296
N13952 G1 X191.491 Y126.629 E1.06057
N13953 G1 X191.491 Y200.986 E2.39103
N13954 ; COOLING_NODE: 0
N13955 M204 S10000
N13956 G1 X191.898 Y201.453 F60000
N13957 M73 P84 R8
N13958 G1 F4421.739
N13959 M204 S8000
N13960 G1 X158.102 Y201.453 E1.08675
N13961 G1 X158.102 Y126.222 E2.41914
N13962 G1 X191.898 Y126.222 E1.08675
N13963 G1 X191.898 Y201.393 E2.41721
N13964 ; COOLING_NODE: 0
N13965 M204 S10000
N13966 G1 X192.29 Y201.845 F60000
N13967 ; FEATURE: Outer wall
N13968 ; LINE_WIDTH: 0.42
N13969 G1 F4773.528
N13970 M204 S5000
N13971 G1 X157.71 Y201.845 E1.03002
N13972 G1 X157.71 Y125.83 E2.26421
N13973 G1 X192.29 Y125.83 E1.03002
N13974 G1 X192.29 Y201.785 E2.26243
N13975 G1 E-.8 F1800
N13976 M204 S10000
N13977 G1 X190.005 Y200.471 Z12.2 F60000
N13978 G1 Z11.8
N13979 G1 E.8 F1800
N13980 ; FEATURE: Bridge
N13981 ; LINE_WIDTH: 0.40079
N13982 ; LAYER_HEIGHT: 0.4
N13983 M106 S229.5
N13984 G1 F2853.507
N13985 M204 S8000
N13986 G1 X190.714 Y199.762 E.04995
N13987 G1 X190.714 Y199.125 E.03177
N13988 G1 X189.57 Y200.269 E.08061
N13989 G1 X188.933 Y200.269 E.03177
N13990 G1 X190.714 Y198.487 E.12553
N13991 G1 X190.714 Y197.85 E.03177
N13992 G1 X188.295 Y200.269 E.17045
N13993 G1 X187.658 Y200.269 E.03177
N13994 G1 X190.714 Y197.212 E.21538
N13995 G1 X190.714 Y196.575 E.03177
N13996 G1 X187.02 Y200.269 E.2603
N13997 G1 X186.383 Y200.269 E.03177
N13998 G1 X190.714 Y195.937 E.30523
N13999 G1 X190.714 Y195.3 E.03177
N14000 G1 X185.745 Y200.269 E.35015
N14001 G1 X185.108 Y200.269 E.03177
N14002 G1 X190.714 Y194.662 E.39508
N14003 G1 X190.714 Y194.025 E.03177
N14004 G1 X184.47 Y200.269 E.44
N14005 G1 X183.833 Y200.269 E.03177
N14006 G1 X190.714 Y193.387 E.48493
N14007 G1 X190.714 Y192.75 E.03177
N14008 G1 X183.195 Y200.269 E.52985
N14009 G1 X182.558 Y200.269 E.03177
N14010 G1 X190.714 Y192.112 E.57478
N14011 G1 X190.714 Y191.475 E.03177
N14012 G1 X181.92 Y200.269 E.6197
N14013 G1 X181.283 Y200.269 E.03177
N14014 G1 X190.714 Y190.837 E.66463
N14015 G1 X190.714 Y190.2 E.03177
N14016 G1 X180.645 Y200.269 E.70955
N14017 G1 X180.008 Y200.269 E.03177
N14018 G1 X190.714 Y189.562 E.75448
N14019 G1 X190.714 Y188.925 E.03177
N14020 G1 X179.37 Y200.269 E.7994
N14021 G1 X178.732 Y200.269 E.03177
N14022 G1 X190.714 Y188.287 E.84433
N14023 G1 X190.714 Y187.65 E.03177
N14024 G1 X178.095 Y200.269 E.88925
N14025 G1 X177.457 Y200.269 E.03177
N14026 G1 X190.714 Y187.012 E.93418
N14027 G1 X190.714 Y186.375 E.03177
N14028 G1 X176.82 Y200.269 E.9791
N14029 G1 X176.182 Y200.269 E.03177
N14030 G1 X190.714 Y185.737 E1.02403
N14031 G1 X190.714 Y185.1 E.03177
N14032 G1 X175.545 Y200.269 E1.06895
N14033 G1 X174.907 Y200.269 E.03177
N14034 G1 X190.714 Y184.462 E1.11387
N14035 G1 X190.714 Y183.825 E.03177
N14036 G1 X174.27 Y200.269 E1.1588
N14037 G1 X173.632 Y200.269 E.03177
N14038 G1 X190.714 Y183.187 E1.20372
N14039 G1 X190.714 Y182.55 E.03177
N14040 G1 X172.995 Y200.269 E1.24865
N14041 G1 X172.357 Y200.269 E.03177
N14042 G1 X190.714 Y181.912 E1.29357
N14043 G1 X190.714 Y181.275 E.03177
N14044 G1 X171.72 Y200.269 E1.3385
N14045 G1 X171.082 Y200.269 E.03177
N14046 G1 X190.714 Y180.637 E1.38342
N14047 G1 X190.714 Y180 E.03177
N14048 G1 X170.445 Y200.269 E1.42835
N14049 G1 X169.807 Y200.269 E.03177
N14050 G1 X190.714 Y179.362 E1.47327
N14051 G1 X190.714 Y178.725 E.03177
N14052 G1 X169.17 Y200.269 E1.5182
N14053 G1 X168.532 Y200.269 E.03177
N14054 G1 X190.714 Y178.087 E1.56312
N14055 G1 X190.714 Y177.45 E.03177
N14056 G1 X167.895 Y200.269 E1.60805
N14057 G1 X167.257 Y200.269 E.03177
N14058 G1 X190.714 Y176.812 E1.65297
N14059 G1 X190.714 Y176.174 E.03177
N14060 G1 X166.62 Y200.269 E1.6979
N14061 G1 X165.982 Y200.269 E.03177
N14062 G1 X190.714 Y175.537 E1.74282
N14063 G1 X190.714 Y174.899 E.03177
N14064 G1 X165.345 Y200.269 E1.78775
N14065 G1 X164.707 Y200.269 E.03177
N14066 G1 X190.714 Y174.262 E1.83267
N14067 G1 X190.714 Y173.624 E.03177
N14068 G1 X164.07 Y200.269 E1.8776
N14069 G1 X163.432 Y200.269 E.03177
N14070 G1 X190.714 Y172.987 E1.92252
N14071 G1 X190.714 Y172.349 E.03177
N14072 G1 X162.795 Y200.269 E1.96744
N14073 G1 X162.157 Y200.269 E.03177
N14074 G1 X190.714 Y171.712 E2.01237
N14075 G1 X190.714 Y171.074 E.03177
N14076 G1 X161.52 Y200.269 E2.05729
N14077 G1 X160.882 Y200.269 E.03177
N14078 G1 X190.714 Y170.437 E2.10222
N14079 G1 X190.714 Y169.799 E.03177
N14080 G1 X160.245 Y200.269 E2.14714
N14081 G1 X159.607 Y200.269 E.03177
N14082 G1 X190.714 Y169.162 E2.19207
N14083 G1 X190.714 Y168.524 E.03177
N14084 G1 X159.286 Y199.952 E2.2147
N14085 G1 X159.286 Y199.315 E.03177
N14086 G1 X190.714 Y167.887 E2.2147
N14087 G1 X190.714 Y167.249 E.03177
N14088 M73 P85 R8
N14089 G1 X159.286 Y198.677 E2.2147
N14090 G1 X159.286 Y198.04 E.03177
N14091 M73 P85 R7
N14092 G1 X190.714 Y166.612 E2.2147
N14093 G1 X190.714 Y165.974 E.03177
N14094 G1 X159.286 Y197.402 E2.2147
N14095 G1 X159.286 Y196.765 E.03177
N14096 G1 X190.714 Y165.337 E2.2147
N14097 G1 X190.714 Y164.699 E.03177
N14098 G1 X159.286 Y196.127 E2.2147
N14099 G1 X159.286 Y195.49 E.03177
N14100 G1 X190.714 Y164.062 E2.2147
N14101 G1 X190.714 Y163.424 E.03177
N14102 G1 X159.286 Y194.852 E2.2147
N14103 G1 X159.286 Y194.215 E.03177
N14104 G1 X190.714 Y162.787 E2.2147
N14105 G1 X190.714 Y162.149 E.03177
N14106 G1 X159.286 Y193.577 E2.2147
N14107 G1 X159.286 Y192.94 E.03177
N14108 G1 X190.714 Y161.512 E2.2147
N14109 G1 X190.714 Y160.874 E.03177
N14110 G1 X159.286 Y192.302 E2.2147
N14111 G1 X159.286 Y191.665 E.03177
N14112 G1 X190.714 Y160.237 E2.2147
N14113 G1 X190.714 Y159.599 E.03177
N14114 G1 X159.286 Y191.027 E2.2147
N14115 G1 X159.286 Y190.39 E.03177
N14116 G1 X190.714 Y158.962 E2.2147
N14117 G1 X190.714 Y158.324 E.03177
N14118 G1 X159.286 Y189.752 E2.2147
N14119 G1 X159.286 Y189.115 E.03177
N14120 G1 X190.714 Y157.687 E2.2147
N14121 G1 X190.714 Y157.049 E.03177
N14122 G1 X159.286 Y188.477 E2.2147
N14123 G1 X159.286 Y187.84 E.03177
N14124 G1 X190.714 Y156.412 E2.2147
N14125 G1 X190.714 Y155.774 E.03177
N14126 G1 X159.286 Y187.202 E2.2147
N14127 G1 X159.286 Y186.565 E.03177
N14128 G1 X190.714 Y155.137 E2.2147
N14129 G1 X190.714 Y154.499 E.03177
N14130 G1 X159.286 Y185.927 E2.2147
N14131 G1 X159.286 Y185.29 E.03177
N14132 G1 X190.714 Y153.862 E2.2147
N14133 G1 X190.714 Y153.224 E.03177
N14134 G1 X159.286 Y184.652 E2.2147
N14135 G1 X159.286 Y184.015 E.03177
N14136 G1 X190.714 Y152.587 E2.2147
N14137 G1 X190.714 Y151.949 E.03177
N14138 G1 X159.286 Y183.377 E2.2147
N14139 G1 X159.286 Y182.74 E.03177
N14140 G1 X190.714 Y151.311 E2.2147
N14141 G1 X190.714 Y150.674 E.03177
N14142 G1 X159.286 Y182.102 E2.2147
N14143 G1 X159.286 Y181.465 E.03177
N14144 G1 X190.714 Y150.036 E2.2147
N14145 G1 X190.714 Y149.399 E.03177
N14146 G1 X159.286 Y180.827 E2.2147
N14147 G1 X159.286 Y180.19 E.03177
N14148 G1 X190.714 Y148.761 E2.2147
N14149 G1 X190.714 Y148.124 E.03177
N14150 G1 X159.286 Y179.552 E2.2147
N14151 G1 X159.286 Y178.915 E.03177
N14152 G1 X190.714 Y147.486 E2.2147
N14153 G1 X190.714 Y146.849 E.03177
N14154 G1 X159.286 Y178.277 E2.2147
N14155 G1 X159.286 Y177.639 E.03177
N14156 M73 P86 R7
N14157 G1 X190.714 Y146.211 E2.2147
N14158 G1 X190.714 Y145.574 E.03177
N14159 G1 X159.286 Y177.002 E2.2147
N14160 G1 X159.286 Y176.364 E.03177
N14161 G1 X190.714 Y144.936 E2.2147
N14162 G1 X190.714 Y144.299 E.03177
N14163 G1 X159.286 Y175.727 E2.2147
N14164 G1 X159.286 Y175.089 E.03177
N14165 G1 X190.714 Y143.661 E2.2147
N14166 G1 X190.714 Y143.024 E.03177
N14167 G1 X159.286 Y174.452 E2.2147
N14168 G1 X159.286 Y173.814 E.03177
N14169 G1 X190.714 Y142.386 E2.2147
N14170 G1 X190.714 Y141.749 E.03177
N14171 G1 X159.286 Y173.177 E2.2147
N14172 G1 X159.286 Y172.539 E.03177
N14173 G1 X190.714 Y141.111 E2.2147
N14174 G1 X190.714 Y140.474 E.03177
N14175 G1 X159.286 Y171.902 E2.2147
N14176 G1 X159.286 Y171.264 E.03177
N14177 G1 X190.714 Y139.836 E2.2147
N14178 G1 X190.714 Y139.199 E.03177
N14179 G1 X159.286 Y170.627 E2.2147
N14180 G1 X159.286 Y169.989 E.03177
N14181 G1 X190.714 Y138.561 E2.2147
N14182 G1 X190.714 Y137.924 E.03177
N14183 G1 X159.286 Y169.352 E2.2147
N14184 G1 X159.286 Y168.714 E.03177
N14185 G1 X190.714 Y137.286 E2.2147
N14186 G1 X190.714 Y136.649 E.03177
N14187 G1 X159.286 Y168.077 E2.2147
N14188 G1 X159.286 Y167.439 E.03177
N14189 G1 X190.714 Y136.011 E2.2147
N14190 G1 X190.714 Y135.374 E.03177
N14191 G1 X159.286 Y166.802 E2.2147
N14192 G1 X159.286 Y166.164 E.03177
N14193 G1 X190.714 Y134.736 E2.2147
N14194 G1 X190.714 Y134.099 E.03177
N14195 G1 X159.286 Y165.527 E2.2147
N14196 G1 X159.286 Y164.889 E.03177
N14197 G1 X190.714 Y133.461 E2.2147
N14198 G1 X190.714 Y132.824 E.03177
N14199 G1 X159.286 Y164.252 E2.2147
N14200 G1 X159.286 Y163.614 E.03177
N14201 G1 X190.714 Y132.186 E2.2147
N14202 G1 X190.714 Y131.549 E.03177
N14203 G1 X159.286 Y162.977 E2.2147
N14204 G1 X159.286 Y162.339 E.03177
N14205 G1 X190.714 Y130.911 E2.2147
N14206 G1 X190.714 Y130.274 E.03177
N14207 G1 X159.286 Y161.702 E2.2147
N14208 G1 X159.286 Y161.064 E.03177
N14209 G1 X190.714 Y129.636 E2.2147
N14210 G1 X190.714 Y128.999 E.03177
N14211 G1 X159.286 Y160.427 E2.2147
N14212 G1 X159.286 Y159.789 E.03177
N14213 G1 X190.714 Y128.361 E2.2147
N14214 G1 X190.714 Y127.723 E.03177
N14215 G1 X159.286 Y159.152 E2.2147
N14216 G1 X159.286 Y158.514 E.03177
N14217 G1 X190.394 Y127.406 E2.19214
N14218 G1 X189.756 Y127.406 E.03177
N14219 M73 P86 R6
N14220 G1 X159.286 Y157.877 E2.14721
N14221 G1 X159.286 Y157.239 E.03177
N14222 G1 X189.119 Y127.406 E2.10229
N14223 G1 X188.481 Y127.406 E.03177
N14224 G1 X159.286 Y156.602 E2.05736
N14225 G1 X159.286 Y155.964 E.03177
N14226 M73 P87 R6
N14227 G1 X187.844 Y127.406 E2.01244
N14228 G1 X187.206 Y127.406 E.03177
N14229 G1 X159.286 Y155.327 E1.96751
N14230 G1 X159.286 Y154.689 E.03177
N14231 G1 X186.569 Y127.406 E1.92259
N14232 G1 X185.931 Y127.406 E.03177
N14233 G1 X159.286 Y154.052 E1.87766
N14234 G1 X159.286 Y153.414 E.03177
N14235 G1 X185.294 Y127.406 E1.83274
N14236 G1 X184.656 Y127.406 E.03177
N14237 G1 X159.286 Y152.776 E1.78782
N14238 G1 X159.286 Y152.139 E.03177
N14239 G1 X184.019 Y127.406 E1.74289
N14240 G1 X183.381 Y127.406 E.03177
N14241 G1 X159.286 Y151.501 E1.69797
N14242 G1 X159.286 Y150.864 E.03177
N14243 G1 X182.744 Y127.406 E1.65304
N14244 G1 X182.106 Y127.406 E.03177
N14245 G1 X159.286 Y150.226 E1.60812
N14246 G1 X159.286 Y149.589 E.03177
N14247 G1 X181.469 Y127.406 E1.56319
N14248 G1 X180.831 Y127.406 E.03177
N14249 G1 X159.286 Y148.951 E1.51827
N14250 G1 X159.286 Y148.314 E.03177
N14251 G1 X180.194 Y127.406 E1.47334
N14252 G1 X179.556 Y127.406 E.03177
N14253 G1 X159.286 Y147.676 E1.42842
N14254 G1 X159.286 Y147.039 E.03177
N14255 G1 X178.919 Y127.406 E1.38349
N14256 G1 X178.281 Y127.406 E.03177
N14257 G1 X159.286 Y146.401 E1.33857
N14258 G1 X159.286 Y145.764 E.03177
N14259 G1 X177.644 Y127.406 E1.29364
N14260 G1 X177.006 Y127.406 E.03177
N14261 G1 X159.286 Y145.126 E1.24872
N14262 G1 X159.286 Y144.489 E.03177
N14263 G1 X176.369 Y127.406 E1.20379
N14264 G1 X175.731 Y127.406 E.03177
N14265 G1 X159.286 Y143.851 E1.15887
N14266 G1 X159.286 Y143.214 E.03177
N14267 G1 X175.094 Y127.406 E1.11394
N14268 G1 X174.456 Y127.406 E.03177
N14269 G1 X159.286 Y142.576 E1.06902
N14270 G1 X159.286 Y141.939 E.03177
N14271 G1 X173.819 Y127.406 E1.02409
N14272 G1 X173.181 Y127.406 E.03177
N14273 G1 X159.286 Y141.301 E.97917
N14274 G1 X159.286 Y140.664 E.03177
N14275 G1 X172.544 Y127.406 E.93425
N14276 G1 X171.906 Y127.406 E.03177
N14277 G1 X159.286 Y140.026 E.88932
N14278 G1 X159.286 Y139.389 E.03177
N14279 G1 X171.269 Y127.406 E.8444
N14280 G1 X170.631 Y127.406 E.03177
N14281 G1 X159.286 Y138.751 E.79947
N14282 G1 X159.286 Y138.114 E.03177
N14283 G1 X169.993 Y127.406 E.75455
N14284 G1 X169.356 Y127.406 E.03177
N14285 G1 X159.286 Y137.476 E.70962
N14286 G1 X159.286 Y136.839 E.03177
N14287 G1 X168.718 Y127.406 E.6647
N14288 G1 X168.081 Y127.406 E.03177
N14289 G1 X159.286 Y136.201 E.61977
N14290 G1 X159.286 Y135.564 E.03177
N14291 G1 X167.443 Y127.406 E.57485
N14292 G1 X166.806 Y127.406 E.03177
N14293 G1 X159.286 Y134.926 E.52992
N14294 G1 X159.286 Y134.289 E.03177
N14295 G1 X166.168 Y127.406 E.485
N14296 G1 X165.531 Y127.406 E.03177
N14297 G1 X159.286 Y133.651 E.44007
N14298 G1 X159.286 Y133.014 E.03177
N14299 G1 X164.893 Y127.406 E.39515
N14300 G1 X164.256 Y127.406 E.03177
N14301 G1 X159.286 Y132.376 E.35022
N14302 G1 X159.286 Y131.739 E.03177
N14303 G1 X163.618 Y127.406 E.3053
N14304 G1 X162.981 Y127.406 E.03177
N14305 G1 X159.286 Y131.101 E.26037
N14306 G1 X159.286 Y130.464 E.03177
N14307 G1 X162.343 Y127.406 E.21545
N14308 G1 X161.706 Y127.406 E.03177
N14309 G1 X159.286 Y129.826 E.17052
N14310 G1 X159.286 Y129.188 E.03177
N14311 G1 X161.068 Y127.406 E.1256
N14312 G1 X160.431 Y127.406 E.03177
N14313 G1 X159.286 Y128.551 E.08068
N14314 G1 X159.286 Y127.913 E.03177
N14315 G1 X159.996 Y127.204 E.05002
N14316 M106 S25.5
N14317 ; WIPE_START
N14318 G1 X159.286 Y127.913 E-.38146
N14319 G1 X159.286 Y128.551 E-.24226
N14320 G1 X159.54 Y128.297 E-.13628
N14321 ; WIPE_END
N14322 G1 E-.04 F1800
N14323 M204 S10000
N14324 G17
N14325 G3 Z12.2 I1.217 J0 P1  F60000
N14326 ; stop printing object, unique label id: 229
N14327 M625
N14328 ; object ids of layer 59 start: 229
N14329 M624 AQAAAAAAAAA=
N14330 ;======== H2D 20250527========
N14331 ; SKIPPABLE_START
N14332 ; SKIPTYPE: timelapse
N14333 M622.1 S1 ; for prev firware, default turned on
N14334 
N14335 M1002 judge_flag timelapse_record_flag
N14336 
N14337 M622 J1
N14338 M993 A2 B2 C2
N14339 M993 A0 B0 C0
N14340 
N14341 
N14342 
N14343 
N14344     M9711 M0 E1 X260 Y141 Z12.2 S11 C10 O0 T3000
N14345 
N14346 
N14347 
N14348 M993 A3 B3 C3
N14349 
N14350 M623
N14351 ; SKIPPABLE_END
N14352 
N14353 ; object ids of this layer59 end: 229
N14354 M625
N14355 ; CHANGE_LAYER
N14356 ; Z_HEIGHT: 12
N14357 ; LAYER_HEIGHT: 0.2
N14358 ;======== H2D 20250521========
N14359 ; layer num/total_layer_count: 60/63
N14360 ; update layer progress
N14361 M73 L60
N14362 M991 S0 P59 ;notify layer change
N14363 
N14364 
N14365 ; OBJECT_ID: 229
N14366 ; COOLING_NODE: 0
N14367 ; start printing object, unique label id: 229
N14368 M624 AQAAAAAAAAA=
N14369 G1 X191.084 Y200.639 F60000
N14370 G1 Z12
N14371 G1 E.8 F1800
N14372 ; FEATURE: Inner wall
N14373 ; LINE_WIDTH: 0.45
N14374 ; LAYER_HEIGHT: 0.2
N14375 G1 F4421.739
N14376 M204 S8000
N14377 G1 X158.916 Y200.639 E1.03439
N14378 G1 X158.916 Y127.036 E2.36678
N14379 G1 X191.084 Y127.036 E1.03439
N14380 G1 X191.084 Y200.579 E2.36485
N14381 ; COOLING_NODE: 0
N14382 M204 S10000
N14383 G1 X191.491 Y201.046 F60000
N14384 G1 F4421.739
N14385 M204 S8000
N14386 G1 X158.509 Y201.046 E1.06057
N14387 G1 X158.509 Y126.629 E2.39296
N14388 G1 X191.491 Y126.629 E1.06057
N14389 G1 X191.491 Y200.986 E2.39103
N14390 ; COOLING_NODE: 0
N14391 M204 S10000
N14392 G1 X191.898 Y201.453 F60000
N14393 G1 F4421.739
N14394 M204 S8000
N14395 G1 X158.102 Y201.453 E1.08675
N14396 G1 X158.102 Y126.222 E2.41914
N14397 G1 X191.898 Y126.222 E1.08675
N14398 G1 X191.898 Y201.393 E2.41721
N14399 ; COOLING_NODE: 0
N14400 M204 S10000
N14401 G1 X192.29 Y201.845 F60000
N14402 ; FEATURE: Outer wall
N14403 ; LINE_WIDTH: 0.42
N14404 G1 F4773.528
N14405 M204 S5000
N14406 G1 X157.71 Y201.845 E1.03002
N14407 G1 X157.71 Y125.83 E2.26421
N14408 G1 X192.29 Y125.83 E1.03002
N14409 G1 X192.29 Y201.785 E2.26243
N14410 G1 E-.8 F1800
N14411 M204 S10000
N14412 M73 P88 R6
N14413 G1 X190.157 Y200.475 Z12.4 F60000
N14414 G1 Z12
N14415 G1 E.8 F1800
N14416 ; FEATURE: Internal solid infill
N14417 ; LINE_WIDTH: 0.42048
N14418 G1 F4767.454
N14419 M204 S8000
N14420 G1 X190.751 Y199.881 E.02504
N14421 G1 X190.751 Y199.347 E.01592
N14422 G1 X189.793 Y200.305 E.0404
N14423 G1 X189.259 Y200.305 E.01592
N14424 G1 X190.751 Y198.813 E.06292
N14425 G1 X190.751 Y198.279 E.01592
N14426 G1 X188.725 Y200.305 E.08544
N14427 G1 X188.191 Y200.305 E.01592
N14428 G1 X190.751 Y197.746 E.10797
N14429 G1 X190.751 Y197.212 E.01592
N14430 G1 X187.657 Y200.305 E.13049
N14431 G1 X187.123 Y200.305 E.01592
N14432 G1 X190.751 Y196.678 E.15301
N14433 G1 X190.751 Y196.144 E.01592
N14434 G1 X186.589 Y200.305 E.17553
N14435 G1 X186.055 Y200.305 E.01592
N14436 G1 X190.751 Y195.61 E.19805
N14437 G1 X190.751 Y195.076 E.01592
N14438 G1 X185.521 Y200.305 E.22057
N14439 G1 X184.987 Y200.305 E.01592
N14440 G1 X190.751 Y194.542 E.24309
N14441 G1 X190.751 Y194.008 E.01592
N14442 G1 X184.453 Y200.305 E.26561
N14443 G1 X183.919 Y200.305 E.01592
N14444 G1 X190.751 Y193.474 E.28813
N14445 G1 X190.751 Y192.94 E.01592
N14446 G1 X183.385 Y200.305 E.31066
N14447 G1 X182.851 Y200.305 E.01592
N14448 G1 X190.751 Y192.406 E.33318
N14449 G1 X190.751 Y191.872 E.01592
N14450 G1 X182.317 Y200.305 E.3557
N14451 G1 X181.783 Y200.305 E.01592
N14452 G1 X190.751 Y191.338 E.37822
N14453 G1 X190.751 Y190.804 E.01593
N14454 G1 X181.249 Y200.305 E.40074
N14455 G1 X180.715 Y200.305 E.01592
N14456 G1 X190.751 Y190.27 E.42326
N14457 G1 X190.751 Y189.736 E.01592
N14458 G1 X180.182 Y200.305 E.44578
N14459 G1 X179.648 Y200.305 E.01592
N14460 G1 X190.751 Y189.202 E.4683
N14461 G1 X190.751 Y188.668 E.01592
N14462 G1 X179.114 Y200.305 E.49082
N14463 G1 X178.58 Y200.305 E.01592
N14464 G1 X190.751 Y188.134 E.51335
N14465 G1 X190.751 Y187.6 E.01592
N14466 G1 X178.046 Y200.305 E.53587
N14467 G1 X177.512 Y200.305 E.01592
N14468 G1 X190.751 Y187.067 E.55839
N14469 G1 X190.751 Y186.533 E.01592
N14470 G1 X176.978 Y200.305 E.58091
N14471 G1 X176.444 Y200.305 E.01593
N14472 G1 X190.751 Y185.999 E.60343
N14473 G1 X190.751 Y185.465 E.01592
N14474 G1 X175.91 Y200.305 E.62595
N14475 G1 X175.376 Y200.305 E.01592
N14476 G1 X190.751 Y184.931 E.64847
N14477 G1 X190.751 Y184.397 E.01592
N14478 G1 X174.842 Y200.305 E.67099
N14479 G1 X174.308 Y200.305 E.01592
N14480 G1 X190.751 Y183.863 E.69351
N14481 G1 X190.751 Y183.329 E.01592
N14482 G1 X173.774 Y200.305 E.71604
N14483 G1 X173.24 Y200.305 E.01593
N14484 G1 X190.751 Y182.795 E.73856
N14485 G1 X190.751 Y182.261 E.01592
N14486 G1 X172.706 Y200.305 E.76108
N14487 G1 X172.172 Y200.305 E.01592
N14488 G1 X190.751 Y181.727 E.7836
N14489 G1 X190.751 Y181.193 E.01592
N14490 G1 X171.638 Y200.305 E.80612
N14491 G1 X171.104 Y200.305 E.01592
N14492 G1 X190.751 Y180.659 E.82864
N14493 G1 X190.751 Y180.125 E.01592
N14494 G1 X170.57 Y200.305 E.85116
N14495 G1 X170.036 Y200.305 E.01592
N14496 G1 X190.751 Y179.591 E.87368
N14497 G1 X190.751 Y179.057 E.01592
N14498 G1 X169.503 Y200.305 E.8962
N14499 G1 X168.969 Y200.305 E.01592
N14500 G1 X190.751 Y178.523 E.91873
N14501 G1 X190.751 Y177.989 E.01592
N14502 G1 X168.435 Y200.305 E.94125
N14503 G1 X167.901 Y200.305 E.01592
N14504 G1 X190.751 Y177.455 E.96377
N14505 G1 X190.751 Y176.921 E.01592
N14506 G1 X167.367 Y200.305 E.98629
N14507 G1 X166.833 Y200.305 E.01592
N14508 G1 X190.751 Y176.388 E1.00881
N14509 G1 X190.751 Y175.854 E.01592
N14510 G1 X166.299 Y200.305 E1.03133
N14511 G1 X165.765 Y200.305 E.01592
N14512 G1 X190.751 Y175.32 E1.05385
N14513 G1 X190.751 Y174.786 E.01592
N14514 G1 X165.231 Y200.305 E1.07637
N14515 G1 X164.697 Y200.305 E.01592
N14516 G1 X190.751 Y174.252 E1.09889
N14517 G1 X190.751 Y173.718 E.01592
N14518 G1 X164.163 Y200.305 E1.12141
N14519 G1 X163.629 Y200.305 E.01592
N14520 G1 X190.751 Y173.184 E1.14394
N14521 G1 X190.751 Y172.65 E.01592
N14522 G1 X163.095 Y200.305 E1.16646
N14523 G1 X162.561 Y200.305 E.01592
N14524 G1 X190.751 Y172.116 E1.18898
N14525 G1 X190.751 Y171.582 E.01592
N14526 G1 X162.027 Y200.305 E1.2115
N14527 G1 X161.493 Y200.305 E.01592
N14528 G1 X190.751 Y171.048 E1.23402
N14529 G1 X190.751 Y170.514 E.01592
N14530 G1 X160.959 Y200.305 E1.25654
N14531 G1 X160.425 Y200.305 E.01592
N14532 G1 X190.751 Y169.98 E1.27906
N14533 G1 X190.751 Y169.446 E.01592
N14534 G1 X159.891 Y200.305 E1.30158
N14535 G1 X159.357 Y200.305 E.01592
N14536 G1 X190.751 Y168.912 E1.3241
N14537 G1 X190.751 Y168.378 E.01593
N14538 G1 X159.249 Y199.879 E1.32866
N14539 G1 X159.249 Y199.345 E.01592
N14540 G1 X190.751 Y167.844 E1.32866
N14541 G1 X190.751 Y167.31 E.01592
N14542 G1 X159.249 Y198.811 E1.32866
N14543 G1 X159.249 Y198.277 E.01593
N14544 G1 X190.751 Y166.776 E1.32866
N14545 G1 X190.751 Y166.242 E.01592
N14546 G1 X159.249 Y197.744 E1.32866
N14547 G1 X159.249 Y197.21 E.01592
N14548 G1 X190.751 Y165.709 E1.32866
N14549 G1 X190.751 Y165.175 E.01592
N14550 G1 X159.249 Y196.676 E1.32866
N14551 G1 X159.249 Y196.142 E.01592
N14552 G1 X190.751 Y164.641 E1.32866
N14553 G1 X190.751 Y164.107 E.01592
N14554 G1 X159.249 Y195.608 E1.32866
N14555 G1 X159.249 Y195.074 E.01592
N14556 G1 X190.751 Y163.573 E1.32866
N14557 G1 X190.751 Y163.039 E.01592
N14558 G1 X159.249 Y194.54 E1.32866
N14559 G1 X159.249 Y194.006 E.01592
N14560 M73 P88 R5
N14561 G1 X190.751 Y162.505 E1.32866
N14562 G1 X190.751 Y161.971 E.01592
N14563 G1 X159.249 Y193.472 E1.32866
N14564 G1 X159.249 Y192.938 E.01592
N14565 G1 X190.751 Y161.437 E1.32866
N14566 G1 X190.751 Y160.903 E.01592
N14567 G1 X159.249 Y192.404 E1.32866
N14568 G1 X159.249 Y191.87 E.01592
N14569 G1 X190.751 Y160.369 E1.32866
N14570 G1 X190.751 Y159.835 E.01592
N14571 G1 X159.249 Y191.336 E1.32866
N14572 G1 X159.249 Y190.802 E.01592
N14573 G1 X190.751 Y159.301 E1.32866
N14574 G1 X190.751 Y158.767 E.01592
N14575 G1 X159.249 Y190.268 E1.32866
N14576 G1 X159.249 Y189.734 E.01592
N14577 G1 X190.751 Y158.233 E1.32866
N14578 G1 X190.751 Y157.699 E.01592
N14579 G1 X159.249 Y189.2 E1.32866
N14580 G1 X159.249 Y188.666 E.01592
N14581 G1 X190.751 Y157.165 E1.32866
N14582 G1 X190.751 Y156.631 E.01592
N14583 G1 X159.249 Y188.132 E1.32866
N14584 G1 X159.249 Y187.598 E.01592
N14585 M73 P89 R5
N14586 G1 X190.751 Y156.097 E1.32866
N14587 G1 X190.751 Y155.563 E.01592
N14588 G1 X159.249 Y187.065 E1.32866
N14589 G1 X159.249 Y186.531 E.01593
N14590 G1 X190.751 Y155.03 E1.32866
N14591 G1 X190.751 Y154.496 E.01592
N14592 G1 X159.249 Y185.997 E1.32866
N14593 G1 X159.249 Y185.463 E.01592
N14594 G1 X190.751 Y153.962 E1.32866
N14595 G1 X190.751 Y153.428 E.01592
N14596 G1 X159.249 Y184.929 E1.32866
N14597 G1 X159.249 Y184.395 E.01592
N14598 G1 X190.751 Y152.894 E1.32866
N14599 G1 X190.751 Y152.36 E.01592
N14600 G1 X159.249 Y183.861 E1.32866
N14601 G1 X159.249 Y183.327 E.01592
N14602 G1 X190.751 Y151.826 E1.32866
N14603 G1 X190.751 Y151.292 E.01592
N14604 G1 X159.249 Y182.793 E1.32866
N14605 G1 X159.249 Y182.259 E.01592
N14606 G1 X190.751 Y150.758 E1.32866
N14607 G1 X190.751 Y150.224 E.01592
N14608 G1 X159.249 Y181.725 E1.32866
N14609 G1 X159.249 Y181.191 E.01592
N14610 G1 X190.751 Y149.69 E1.32866
N14611 G1 X190.751 Y149.156 E.01593
N14612 G1 X159.249 Y180.657 E1.32866
N14613 G1 X159.249 Y180.123 E.01592
N14614 G1 X190.751 Y148.622 E1.32866
N14615 G1 X190.751 Y148.088 E.01592
N14616 G1 X159.249 Y179.589 E1.32866
N14617 G1 X159.249 Y179.055 E.01592
N14618 G1 X190.751 Y147.554 E1.32866
N14619 G1 X190.751 Y147.02 E.01592
N14620 G1 X159.249 Y178.521 E1.32866
N14621 G1 X159.249 Y177.987 E.01592
N14622 G1 X190.751 Y146.486 E1.32866
N14623 G1 X190.751 Y145.952 E.01592
N14624 G1 X159.249 Y177.453 E1.32866
N14625 G1 X159.249 Y176.919 E.01592
N14626 G1 X190.751 Y145.418 E1.32866
N14627 G1 X190.751 Y144.884 E.01592
N14628 G1 X159.249 Y176.386 E1.32866
N14629 G1 X159.249 Y175.852 E.01592
N14630 G1 X190.751 Y144.351 E1.32866
N14631 G1 X190.751 Y143.817 E.01592
N14632 G1 X159.249 Y175.318 E1.32866
N14633 G1 X159.249 Y174.784 E.01592
N14634 G1 X190.751 Y143.283 E1.32866
N14635 G1 X190.751 Y142.749 E.01592
N14636 G1 X159.249 Y174.25 E1.32866
N14637 G1 X159.249 Y173.716 E.01592
N14638 G1 X190.751 Y142.215 E1.32866
N14639 G1 X190.751 Y141.681 E.01592
N14640 G1 X159.249 Y173.182 E1.32866
N14641 G1 X159.249 Y172.648 E.01592
N14642 G1 X190.751 Y141.147 E1.32866
N14643 G1 X190.751 Y140.613 E.01592
N14644 G1 X159.249 Y172.114 E1.32866
N14645 G1 X159.249 Y171.58 E.01592
N14646 G1 X190.751 Y140.079 E1.32866
N14647 G1 X190.751 Y139.545 E.01592
N14648 G1 X159.249 Y171.046 E1.32866
N14649 G1 X159.249 Y170.512 E.01592
N14650 G1 X190.751 Y139.011 E1.32866
N14651 G1 X190.751 Y138.477 E.01592
N14652 G1 X159.249 Y169.978 E1.32866
N14653 G1 X159.249 Y169.444 E.01592
N14654 G1 X190.751 Y137.943 E1.32866
N14655 G1 X190.751 Y137.409 E.01593
N14656 G1 X159.249 Y168.91 E1.32866
N14657 G1 X159.249 Y168.376 E.01592
N14658 G1 X190.751 Y136.875 E1.32866
N14659 G1 X190.751 Y136.341 E.01592
N14660 G1 X159.249 Y167.842 E1.32866
N14661 G1 X159.249 Y167.308 E.01592
N14662 G1 X190.751 Y135.807 E1.32866
N14663 G1 X190.751 Y135.273 E.01592
N14664 G1 X159.249 Y166.774 E1.32866
N14665 G1 X159.249 Y166.24 E.01592
N14666 G1 X190.751 Y134.739 E1.32866
N14667 G1 X190.751 Y134.205 E.01592
N14668 G1 X159.249 Y165.707 E1.32866
N14669 G1 X159.249 Y165.173 E.01592
N14670 G1 X190.751 Y133.672 E1.32866
N14671 G1 X190.751 Y133.138 E.01592
N14672 G1 X159.249 Y164.639 E1.32866
N14673 G1 X159.249 Y164.105 E.01593
N14674 G1 X190.751 Y132.604 E1.32866
N14675 G1 X190.751 Y132.07 E.01592
N14676 G1 X159.249 Y163.571 E1.32866
N14677 G1 X159.249 Y163.037 E.01592
N14678 G1 X190.751 Y131.536 E1.32866
N14679 G1 X190.751 Y131.002 E.01592
N14680 G1 X159.249 Y162.503 E1.32866
N14681 G1 X159.249 Y161.969 E.01592
N14682 G1 X190.751 Y130.468 E1.32866
N14683 G1 X190.751 Y129.934 E.01592
N14684 G1 X159.249 Y161.435 E1.32866
N14685 G1 X159.249 Y160.901 E.01592
N14686 G1 X190.751 Y129.4 E1.32866
N14687 G1 X190.751 Y128.866 E.01592
N14688 G1 X159.249 Y160.367 E1.32866
N14689 G1 X159.249 Y159.833 E.01592
N14690 G1 X190.751 Y128.332 E1.32866
N14691 G1 X190.751 Y127.798 E.01592
N14692 G1 X159.249 Y159.299 E1.32866
N14693 G1 X159.249 Y158.765 E.01592
N14694 G1 X190.645 Y127.37 E1.32421
N14695 G1 X190.111 Y127.37 E.01592
N14696 M73 P90 R5
N14697 G1 X159.249 Y158.231 E1.30169
N14698 G1 X159.249 Y157.697 E.01592
N14699 G1 X189.577 Y127.37 E1.27917
N14700 G1 X189.043 Y127.37 E.01592
N14701 G1 X159.249 Y157.163 E1.25664
N14702 G1 X159.249 Y156.629 E.01592
N14703 G1 X188.509 Y127.37 E1.23412
N14704 G1 X187.975 Y127.37 E.01592
N14705 G1 X159.249 Y156.095 E1.2116
N14706 G1 X159.249 Y155.561 E.01592
N14707 G1 X187.441 Y127.37 E1.18908
N14708 G1 X186.907 Y127.37 E.01592
N14709 G1 X159.249 Y155.028 E1.16656
N14710 G1 X159.249 Y154.494 E.01592
N14711 G1 X186.373 Y127.37 E1.14404
N14712 G1 X185.839 Y127.37 E.01592
N14713 G1 X159.249 Y153.96 E1.12152
N14714 G1 X159.249 Y153.426 E.01592
N14715 G1 X185.305 Y127.37 E1.099
N14716 G1 X184.772 Y127.37 E.01593
N14717 G1 X159.249 Y152.892 E1.07648
N14718 G1 X159.249 Y152.358 E.01592
N14719 G1 X184.238 Y127.37 E1.05395
N14720 G1 X183.704 Y127.37 E.01592
N14721 G1 X159.249 Y151.824 E1.03143
N14722 G1 X159.249 Y151.29 E.01592
N14723 G1 X183.17 Y127.37 E1.00891
N14724 G1 X182.636 Y127.37 E.01592
N14725 G1 X159.249 Y150.756 E.98639
N14726 G1 X159.249 Y150.222 E.01592
N14727 G1 X182.102 Y127.37 E.96387
N14728 G1 X181.568 Y127.37 E.01592
N14729 G1 X159.249 Y149.688 E.94135
N14730 G1 X159.249 Y149.154 E.01592
N14731 G1 X181.034 Y127.37 E.91883
N14732 G1 X180.5 Y127.37 E.01592
N14733 G1 X159.249 Y148.62 E.89631
N14734 G1 X159.249 Y148.086 E.01592
N14735 G1 X179.966 Y127.37 E.87379
N14736 G1 X179.432 Y127.37 E.01592
N14737 G1 X159.249 Y147.552 E.85126
N14738 G1 X159.249 Y147.018 E.01592
N14739 G1 X178.898 Y127.37 E.82874
N14740 G1 X178.364 Y127.37 E.01592
N14741 G1 X159.249 Y146.484 E.80622
N14742 G1 X159.249 Y145.95 E.01592
N14743 G1 X177.83 Y127.37 E.7837
N14744 G1 X177.296 Y127.37 E.01592
N14745 G1 X159.249 Y145.416 E.76118
N14746 G1 X159.249 Y144.882 E.01593
N14747 G1 X176.762 Y127.37 E.73866
N14748 G1 X176.228 Y127.37 E.01592
N14749 G1 X159.249 Y144.349 E.71614
N14750 G1 X159.249 Y143.815 E.01592
N14751 G1 X175.694 Y127.37 E.69362
N14752 G1 X175.16 Y127.37 E.01592
N14753 G1 X159.249 Y143.281 E.6711
N14754 G1 X159.249 Y142.747 E.01592
N14755 G1 X174.626 Y127.37 E.64857
N14756 G1 X174.093 Y127.37 E.01592
N14757 G1 X159.249 Y142.213 E.62605
N14758 G1 X159.249 Y141.679 E.01592
N14759 G1 X173.559 Y127.37 E.60353
N14760 G1 X173.025 Y127.37 E.01592
N14761 G1 X159.249 Y141.145 E.58101
N14762 G1 X159.249 Y140.611 E.01592
N14763 G1 X172.491 Y127.37 E.55849
N14764 G1 X171.957 Y127.37 E.01592
N14765 G1 X159.249 Y140.077 E.53597
N14766 G1 X159.249 Y139.543 E.01592
N14767 G1 X171.423 Y127.37 E.51345
N14768 G1 X170.889 Y127.37 E.01592
N14769 G1 X159.249 Y139.009 E.49093
N14770 G1 X159.249 Y138.475 E.01592
N14771 G1 X170.355 Y127.37 E.46841
N14772 G1 X169.821 Y127.37 E.01592
N14773 G1 X159.249 Y137.941 E.44588
N14774 G1 X159.249 Y137.407 E.01592
N14775 G1 X169.287 Y127.37 E.42336
N14776 G1 X168.753 Y127.37 E.01592
N14777 G1 X159.249 Y136.873 E.40084
N14778 G1 X159.249 Y136.339 E.01592
N14779 G1 X168.219 Y127.37 E.37832
N14780 G1 X167.685 Y127.37 E.01592
N14781 G1 X159.249 Y135.805 E.3558
N14782 G1 X159.249 Y135.271 E.01592
N14783 G1 X167.151 Y127.37 E.33328
N14784 G1 X166.617 Y127.37 E.01592
N14785 G1 X159.249 Y134.737 E.31076
N14786 G1 X159.249 Y134.203 E.01592
N14787 G1 X166.083 Y127.37 E.28824
N14788 G1 X165.549 Y127.37 E.01592
N14789 G1 X159.249 Y133.669 E.26572
N14790 G1 X159.249 Y133.136 E.01592
N14791 G1 X165.015 Y127.37 E.24319
N14792 G1 X164.481 Y127.37 E.01592
N14793 G1 X159.249 Y132.602 E.22067
N14794 G1 X159.249 Y132.068 E.01592
N14795 G1 X163.947 Y127.37 E.19815
N14796 G1 X163.413 Y127.37 E.01592
N14797 G1 X159.249 Y131.534 E.17563
N14798 G1 X159.249 Y131 E.01592
N14799 G1 X162.88 Y127.37 E.15311
N14800 G1 X162.346 Y127.37 E.01592
N14801 G1 X159.249 Y130.466 E.13059
N14802 G1 X159.249 Y129.932 E.01592
N14803 G1 X161.812 Y127.37 E.10807
N14804 G1 X161.278 Y127.37 E.01592
N14805 G1 X159.249 Y129.398 E.08555
N14806 G1 X159.249 Y128.864 E.01592
N14807 G1 X160.744 Y127.37 E.06303
N14808 G1 X160.21 Y127.37 E.01592
N14809 G1 X159.249 Y128.33 E.0405
N14810 G1 X159.249 Y127.796 E.01592
N14811 G1 X159.846 Y127.2 E.02514
N14812 ; WIPE_START
N14813 G1 X159.249 Y127.796 E-.32032
N14814 G1 X159.249 Y128.33 E-.2029
N14815 G1 X159.69 Y127.889 E-.23678
N14816 ; WIPE_END
N14817 G1 E-.04 F1800
N14818 M204 S10000
N14819 G17
N14820 G3 Z12.4 I1.217 J0 P1  F60000
N14821 ; stop printing object, unique label id: 229
N14822 M625
N14823 ; object ids of layer 60 start: 229
N14824 M624 AQAAAAAAAAA=
N14825 ;======== H2D 20250527========
N14826 ; SKIPPABLE_START
N14827 ; SKIPTYPE: timelapse
N14828 M622.1 S1 ; for prev firware, default turned on
N14829 
N14830 M1002 judge_flag timelapse_record_flag
N14831 
N14832 M622 J1
N14833 M993 A2 B2 C2
N14834 M993 A0 B0 C0
N14835 
N14836 
N14837 
N14838 
N14839     M9711 M0 E1 X260 Y141 Z12.4 S11 C10 O0 T3000
N14840 
N14841 
N14842 
N14843 M993 A3 B3 C3
N14844 
N14845 M623
N14846 ; SKIPPABLE_END
N14847 
N14848 ; object ids of this layer60 end: 229
N14849 M625
N14850 ; CHANGE_LAYER
N14851 ; Z_HEIGHT: 12.2
N14852 ; LAYER_HEIGHT: 0.2
N14853 ;======== H2D 20250521========
N14854 ; layer num/total_layer_count: 61/63
N14855 ; update layer progress
N14856 M73 L61
N14857 M991 S0 P60 ;notify layer change
N14858 
N14859 
N14860 ; OBJECT_ID: 229
N14861 ; COOLING_NODE: 0
N14862 ; start printing object, unique label id: 229
N14863 M624 AQAAAAAAAAA=
N14864 G1 X191.084 Y200.639 F60000
N14865 G1 Z12.2
N14866 G1 E.8 F1800
N14867 ; FEATURE: Inner wall
N14868 ; LINE_WIDTH: 0.45
N14869 ; LAYER_HEIGHT: 0.2
N14870 G1 F4421.739
N14871 M204 S8000
N14872 G1 X158.916 Y200.639 E1.03439
N14873 G1 X158.916 Y127.036 E2.36678
N14874 G1 X191.084 Y127.036 E1.03439
N14875 G1 X191.084 Y200.579 E2.36485
N14876 ; COOLING_NODE: 0
N14877 M204 S10000
N14878 G1 X191.491 Y201.046 F60000
N14879 G1 F4421.739
N14880 M204 S8000
N14881 G1 X158.509 Y201.046 E1.06057
N14882 M73 P90 R4
N14883 G1 X158.509 Y126.629 E2.39296
N14884 G1 X191.491 Y126.629 E1.06057
N14885 G1 X191.491 Y200.986 E2.39103
N14886 ; COOLING_NODE: 0
N14887 M204 S10000
N14888 G1 X191.898 Y201.453 F60000
N14889 G1 F4421.739
N14890 M204 S8000
N14891 G1 X158.102 Y201.453 E1.08675
N14892 G1 X158.102 Y126.222 E2.41914
N14893 G1 X191.898 Y126.222 E1.08675
N14894 G1 X191.898 Y201.393 E2.41721
N14895 ; COOLING_NODE: 0
N14896 M204 S10000
N14897 G1 X192.29 Y201.845 F60000
N14898 ; FEATURE: Outer wall
N14899 ; LINE_WIDTH: 0.42
N14900 G1 F4773.528
N14901 M204 S5000
N14902 G1 X157.71 Y201.845 E1.03002
N14903 G1 X157.71 Y125.83 E2.26421
N14904 G1 X192.29 Y125.83 E1.03002
N14905 G1 X192.29 Y201.785 E2.26243
N14906 G1 E-.8 F1800
N14907 M204 S10000
N14908 G1 X184.672 Y201.309 Z12.6 F60000
N14909 G1 X159.08 Y199.709 Z12.6
N14910 G1 Z12.2
N14911 G1 E.8 F1800
N14912 ; FEATURE: Internal solid infill
N14913 ; LINE_WIDTH: 0.42048
N14914 G1 F4767.454
N14915 M204 S8000
N14916 G1 X159.676 Y200.305 E.02514
N14917 G1 X160.21 Y200.305 E.01592
N14918 G1 X159.249 Y199.345 E.0405
N14919 G1 X159.249 Y198.811 E.01592
N14920 G1 X160.744 Y200.305 E.06303
N14921 G1 X161.278 Y200.305 E.01592
N14922 G1 X159.249 Y198.277 E.08555
N14923 G1 X159.249 Y197.743 E.01592
N14924 G1 X161.812 Y200.305 E.10807
N14925 G1 X162.346 Y200.305 E.01592
N14926 G1 X159.249 Y197.209 E.13059
N14927 G1 X159.249 Y196.675 E.01593
N14928 G1 X162.88 Y200.305 E.15311
N14929 G1 X163.413 Y200.305 E.01592
N14930 G1 X159.249 Y196.141 E.17563
N14931 G1 X159.249 Y195.607 E.01592
N14932 G1 X163.947 Y200.305 E.19815
N14933 G1 X164.481 Y200.305 E.01592
N14934 G1 X159.249 Y195.073 E.22067
N14935 G1 X159.249 Y194.539 E.01592
N14936 G1 X165.015 Y200.305 E.24319
N14937 G1 X165.549 Y200.305 E.01592
N14938 G1 X159.249 Y194.005 E.26572
N14939 G1 X159.249 Y193.472 E.01592
N14940 G1 X166.083 Y200.305 E.28824
N14941 G1 X166.617 Y200.305 E.01593
N14942 G1 X159.249 Y192.938 E.31076
N14943 G1 X159.249 Y192.404 E.01592
N14944 G1 X167.151 Y200.305 E.33328
N14945 G1 X167.685 Y200.305 E.01592
N14946 G1 X159.249 Y191.87 E.3558
N14947 G1 X159.249 Y191.336 E.01592
N14948 M73 P91 R4
N14949 G1 X168.219 Y200.305 E.37832
N14950 G1 X168.753 Y200.305 E.01592
N14951 G1 X159.249 Y190.802 E.40084
N14952 G1 X159.249 Y190.268 E.01592
N14953 G1 X169.287 Y200.305 E.42336
N14954 G1 X169.821 Y200.305 E.01592
N14955 G1 X159.249 Y189.734 E.44588
N14956 G1 X159.249 Y189.2 E.01592
N14957 G1 X170.355 Y200.305 E.46841
N14958 G1 X170.889 Y200.305 E.01592
N14959 G1 X159.249 Y188.666 E.49093
N14960 G1 X159.249 Y188.132 E.01592
N14961 G1 X171.423 Y200.305 E.51345
N14962 G1 X171.957 Y200.305 E.01592
N14963 G1 X159.249 Y187.598 E.53597
N14964 G1 X159.249 Y187.064 E.01592
N14965 G1 X172.491 Y200.305 E.55849
N14966 G1 X173.025 Y200.305 E.01592
N14967 G1 X159.249 Y186.53 E.58101
N14968 G1 X159.249 Y185.996 E.01592
N14969 G1 X173.559 Y200.305 E.60353
N14970 G1 X174.092 Y200.305 E.01592
N14971 G1 X159.249 Y185.462 E.62605
N14972 G1 X159.249 Y184.928 E.01592
N14973 G1 X174.626 Y200.305 E.64857
N14974 G1 X175.16 Y200.305 E.01592
N14975 G1 X159.249 Y184.394 E.6711
N14976 G1 X159.249 Y183.86 E.01592
N14977 G1 X175.694 Y200.305 E.69362
N14978 G1 X176.228 Y200.305 E.01592
N14979 G1 X159.249 Y183.326 E.71614
N14980 G1 X159.249 Y182.793 E.01592
N14981 G1 X176.762 Y200.305 E.73866
N14982 G1 X177.296 Y200.305 E.01592
N14983 G1 X159.249 Y182.259 E.76118
N14984 G1 X159.249 Y181.725 E.01592
N14985 G1 X177.83 Y200.305 E.7837
N14986 G1 X178.364 Y200.305 E.01592
N14987 G1 X159.249 Y181.191 E.80622
N14988 G1 X159.249 Y180.657 E.01592
N14989 G1 X178.898 Y200.305 E.82874
N14990 G1 X179.432 Y200.305 E.01592
N14991 G1 X159.249 Y180.123 E.85126
N14992 G1 X159.249 Y179.589 E.01592
N14993 G1 X179.966 Y200.305 E.87379
N14994 G1 X180.5 Y200.305 E.01592
N14995 G1 X159.249 Y179.055 E.89631
N14996 G1 X159.249 Y178.521 E.01592
N14997 G1 X181.034 Y200.305 E.91883
N14998 G1 X181.568 Y200.305 E.01592
N14999 G1 X159.249 Y177.987 E.94135
N15000 G1 X159.249 Y177.453 E.01592
N15001 G1 X182.102 Y200.305 E.96387
N15002 G1 X182.636 Y200.305 E.01592
N15003 G1 X159.249 Y176.919 E.98639
N15004 G1 X159.249 Y176.385 E.01592
N15005 G1 X183.17 Y200.305 E1.00891
N15006 G1 X183.704 Y200.305 E.01592
N15007 G1 X159.249 Y175.851 E1.03143
N15008 G1 X159.249 Y175.317 E.01592
N15009 G1 X184.238 Y200.305 E1.05395
N15010 G1 X184.772 Y200.305 E.01592
N15011 G1 X159.249 Y174.783 E1.07648
N15012 G1 X159.249 Y174.249 E.01593
N15013 G1 X185.305 Y200.305 E1.099
N15014 G1 X185.839 Y200.305 E.01592
N15015 G1 X159.249 Y173.715 E1.12152
N15016 G1 X159.249 Y173.181 E.01592
N15017 G1 X186.373 Y200.305 E1.14404
N15018 G1 X186.907 Y200.305 E.01592
N15019 G1 X159.249 Y172.647 E1.16656
N15020 G1 X159.249 Y172.113 E.01592
N15021 G1 X187.441 Y200.305 E1.18908
N15022 G1 X187.975 Y200.305 E.01592
N15023 G1 X159.249 Y171.58 E1.2116
N15024 G1 X159.249 Y171.046 E.01592
N15025 G1 X188.509 Y200.305 E1.23412
N15026 G1 X189.043 Y200.305 E.01593
N15027 G1 X159.249 Y170.512 E1.25664
N15028 G1 X159.249 Y169.978 E.01592
N15029 G1 X189.577 Y200.305 E1.27917
N15030 G1 X190.111 Y200.305 E.01592
N15031 G1 X159.249 Y169.444 E1.30169
N15032 G1 X159.249 Y168.91 E.01592
N15033 G1 X190.645 Y200.305 E1.32421
N15034 G1 X190.751 Y200.305 E.00315
N15035 G1 X190.751 Y199.877 E.01278
N15036 G1 X159.249 Y168.376 E1.32866
N15037 G1 X159.249 Y167.842 E.01592
N15038 G1 X190.751 Y199.343 E1.32866
N15039 G1 X190.751 Y198.809 E.01592
N15040 G1 X159.249 Y167.308 E1.32866
N15041 G1 X159.249 Y166.774 E.01592
N15042 G1 X190.751 Y198.275 E1.32866
N15043 G1 X190.751 Y197.741 E.01592
N15044 G1 X159.249 Y166.24 E1.32866
N15045 G1 X159.249 Y165.706 E.01592
N15046 G1 X190.751 Y197.207 E1.32866
N15047 G1 X190.751 Y196.673 E.01592
N15048 G1 X159.249 Y165.172 E1.32866
N15049 G1 X159.249 Y164.638 E.01592
N15050 G1 X190.751 Y196.139 E1.32866
N15051 G1 X190.751 Y195.605 E.01592
N15052 G1 X159.249 Y164.104 E1.32866
N15053 G1 X159.249 Y163.57 E.01592
N15054 G1 X190.751 Y195.071 E1.32866
N15055 G1 X190.751 Y194.537 E.01592
N15056 G1 X159.249 Y163.036 E1.32866
N15057 G1 X159.249 Y162.502 E.01592
N15058 G1 X190.751 Y194.003 E1.32866
N15059 G1 X190.751 Y193.47 E.01592
N15060 G1 X159.249 Y161.968 E1.32866
N15061 G1 X159.249 Y161.434 E.01592
N15062 G1 X190.751 Y192.936 E1.32866
N15063 G1 X190.751 Y192.402 E.01592
N15064 G1 X159.249 Y160.901 E1.32866
N15065 G1 X159.249 Y160.367 E.01592
N15066 G1 X190.751 Y191.868 E1.32866
N15067 G1 X190.751 Y191.334 E.01592
N15068 G1 X159.249 Y159.833 E1.32866
N15069 G1 X159.249 Y159.299 E.01592
N15070 G1 X190.751 Y190.8 E1.32866
N15071 G1 X190.751 Y190.266 E.01592
N15072 G1 X159.249 Y158.765 E1.32866
N15073 G1 X159.249 Y158.231 E.01592
N15074 G1 X190.751 Y189.732 E1.32866
N15075 G1 X190.751 Y189.198 E.01592
N15076 G1 X159.249 Y157.697 E1.32866
N15077 G1 X159.249 Y157.163 E.01592
N15078 G1 X190.751 Y188.664 E1.32866
N15079 G1 X190.751 Y188.13 E.01592
N15080 G1 X159.249 Y156.629 E1.32866
N15081 G1 X159.249 Y156.095 E.01592
N15082 G1 X190.751 Y187.596 E1.32866
N15083 G1 X190.751 Y187.062 E.01592
N15084 G1 X159.249 Y155.561 E1.32866
N15085 G1 X159.249 Y155.027 E.01592
N15086 G1 X190.751 Y186.528 E1.32866
N15087 G1 X190.751 Y185.994 E.01592
N15088 G1 X159.249 Y154.493 E1.32866
N15089 G1 X159.249 Y153.959 E.01592
N15090 G1 X190.751 Y185.46 E1.32866
N15091 G1 X190.751 Y184.926 E.01592
N15092 M73 P92 R4
N15093 G1 X159.249 Y153.425 E1.32866
N15094 G1 X159.249 Y152.891 E.01592
N15095 G1 X190.751 Y184.392 E1.32866
N15096 G1 X190.751 Y183.858 E.01592
N15097 G1 X159.249 Y152.357 E1.32866
N15098 G1 X159.249 Y151.823 E.01592
N15099 G1 X190.751 Y183.324 E1.32866
N15100 G1 X190.751 Y182.791 E.01592
N15101 G1 X159.249 Y151.289 E1.32866
N15102 G1 X159.249 Y150.755 E.01592
N15103 G1 X190.751 Y182.257 E1.32866
N15104 G1 X190.751 Y181.723 E.01592
N15105 G1 X159.249 Y150.222 E1.32866
N15106 G1 X159.249 Y149.688 E.01592
N15107 G1 X190.751 Y181.189 E1.32866
N15108 G1 X190.751 Y180.655 E.01592
N15109 G1 X159.249 Y149.154 E1.32866
N15110 G1 X159.249 Y148.62 E.01592
N15111 G1 X190.751 Y180.121 E1.32866
N15112 G1 X190.751 Y179.587 E.01592
N15113 G1 X159.249 Y148.086 E1.32866
N15114 G1 X159.249 Y147.552 E.01592
N15115 G1 X190.751 Y179.053 E1.32866
N15116 G1 X190.751 Y178.519 E.01593
N15117 G1 X159.249 Y147.018 E1.32866
N15118 G1 X159.249 Y146.484 E.01592
N15119 G1 X190.751 Y177.985 E1.32866
N15120 G1 X190.751 Y177.451 E.01592
N15121 G1 X159.249 Y145.95 E1.32866
N15122 G1 X159.249 Y145.416 E.01592
N15123 G1 X190.751 Y176.917 E1.32866
N15124 G1 X190.751 Y176.383 E.01592
N15125 G1 X159.249 Y144.882 E1.32866
N15126 G1 X159.249 Y144.348 E.01592
N15127 G1 X190.751 Y175.849 E1.32866
N15128 G1 X190.751 Y175.315 E.01592
N15129 G1 X159.249 Y143.814 E1.32866
N15130 G1 X159.249 Y143.28 E.01592
N15131 G1 X190.751 Y174.781 E1.32866
N15132 G1 X190.751 Y174.247 E.01592
N15133 G1 X159.249 Y142.746 E1.32866
N15134 G1 X159.249 Y142.212 E.01592
N15135 G1 X190.751 Y173.713 E1.32866
N15136 G1 X190.751 Y173.179 E.01592
N15137 G1 X159.249 Y141.678 E1.32866
N15138 G1 X159.249 Y141.144 E.01592
N15139 G1 X190.751 Y172.645 E1.32866
N15140 G1 X190.751 Y172.112 E.01592
N15141 G1 X159.249 Y140.61 E1.32866
N15142 G1 X159.249 Y140.076 E.01593
N15143 G1 X190.751 Y171.578 E1.32866
N15144 G1 X190.751 Y171.044 E.01592
N15145 G1 X159.249 Y139.543 E1.32866
N15146 G1 X159.249 Y139.009 E.01592
N15147 G1 X190.751 Y170.51 E1.32866
N15148 G1 X190.751 Y169.976 E.01592
N15149 G1 X159.249 Y138.475 E1.32866
N15150 G1 X159.249 Y137.941 E.01592
N15151 M73 P92 R3
N15152 G1 X190.751 Y169.442 E1.32866
N15153 G1 X190.751 Y168.908 E.01592
N15154 G1 X159.249 Y137.407 E1.32866
N15155 G1 X159.249 Y136.873 E.01592
N15156 G1 X190.751 Y168.374 E1.32866
N15157 G1 X190.751 Y167.84 E.01592
N15158 G1 X159.249 Y136.339 E1.32866
N15159 G1 X159.249 Y135.805 E.01592
N15160 G1 X190.751 Y167.306 E1.32866
N15161 G1 X190.751 Y166.772 E.01592
N15162 G1 X159.249 Y135.271 E1.32866
N15163 G1 X159.249 Y134.737 E.01592
N15164 G1 X190.751 Y166.238 E1.32866
N15165 G1 X190.751 Y165.704 E.01592
N15166 G1 X159.249 Y134.203 E1.32866
N15167 G1 X159.249 Y133.669 E.01592
N15168 G1 X190.751 Y165.17 E1.32866
N15169 G1 X190.751 Y164.636 E.01592
N15170 G1 X159.249 Y133.135 E1.32866
N15171 G1 X159.249 Y132.601 E.01592
N15172 G1 X190.751 Y164.102 E1.32866
N15173 G1 X190.751 Y163.568 E.01592
N15174 G1 X159.249 Y132.067 E1.32866
N15175 G1 X159.249 Y131.533 E.01592
N15176 G1 X190.751 Y163.034 E1.32866
N15177 G1 X190.751 Y162.5 E.01592
N15178 G1 X159.249 Y130.999 E1.32866
N15179 G1 X159.249 Y130.465 E.01592
N15180 G1 X190.751 Y161.966 E1.32866
N15181 G1 X190.751 Y161.432 E.01592
N15182 G1 X159.249 Y129.931 E1.32866
N15183 G1 X159.249 Y129.397 E.01592
N15184 G1 X190.751 Y160.899 E1.32866
N15185 G1 X190.751 Y160.365 E.01592
N15186 G1 X159.249 Y128.863 E1.32866
N15187 G1 X159.249 Y128.33 E.01592
N15188 G1 X190.751 Y159.831 E1.32866
N15189 G1 X190.751 Y159.297 E.01592
N15190 G1 X159.249 Y127.796 E1.32866
N15191 G1 X159.249 Y127.37 E.0127
N15192 G1 X159.357 Y127.37 E.00322
N15193 G1 X190.751 Y158.763 E1.3241
N15194 G1 X190.751 Y158.229 E.01592
N15195 G1 X159.891 Y127.37 E1.30158
N15196 G1 X160.425 Y127.37 E.01592
N15197 G1 X190.751 Y157.695 E1.27906
N15198 G1 X190.751 Y157.161 E.01592
N15199 G1 X160.959 Y127.37 E1.25654
N15200 G1 X161.493 Y127.37 E.01592
N15201 G1 X190.751 Y156.627 E1.23402
N15202 G1 X190.751 Y156.093 E.01593
N15203 G1 X162.027 Y127.37 E1.2115
N15204 G1 X162.561 Y127.37 E.01592
N15205 M73 P93 R3
N15206 G1 X190.751 Y155.559 E1.18898
N15207 G1 X190.751 Y155.025 E.01592
N15208 G1 X163.095 Y127.37 E1.16646
N15209 G1 X163.629 Y127.37 E.01592
N15210 G1 X190.751 Y154.491 E1.14394
N15211 G1 X190.751 Y153.957 E.01592
N15212 G1 X164.163 Y127.37 E1.12141
N15213 G1 X164.697 Y127.37 E.01592
N15214 G1 X190.751 Y153.423 E1.09889
N15215 G1 X190.751 Y152.889 E.01592
N15216 G1 X165.231 Y127.37 E1.07637
N15217 G1 X165.765 Y127.37 E.01592
N15218 G1 X190.751 Y152.355 E1.05385
N15219 G1 X190.751 Y151.821 E.01592
N15220 G1 X166.299 Y127.37 E1.03133
N15221 G1 X166.833 Y127.37 E.01592
N15222 G1 X190.751 Y151.287 E1.00881
N15223 G1 X190.751 Y150.753 E.01592
N15224 G1 X167.367 Y127.37 E.98629
N15225 G1 X167.901 Y127.37 E.01592
N15226 G1 X190.751 Y150.22 E.96377
N15227 G1 X190.751 Y149.686 E.01592
N15228 G1 X168.435 Y127.37 E.94125
N15229 G1 X168.969 Y127.37 E.01592
N15230 G1 X190.751 Y149.152 E.91873
N15231 G1 X190.751 Y148.618 E.01592
N15232 G1 X169.503 Y127.37 E.8962
N15233 G1 X170.036 Y127.37 E.01593
N15234 G1 X190.751 Y148.084 E.87368
N15235 G1 X190.751 Y147.55 E.01592
N15236 G1 X170.57 Y127.37 E.85116
N15237 G1 X171.104 Y127.37 E.01592
N15238 G1 X190.751 Y147.016 E.82864
N15239 G1 X190.751 Y146.482 E.01592
N15240 G1 X171.638 Y127.37 E.80612
N15241 G1 X172.172 Y127.37 E.01592
N15242 G1 X190.751 Y145.948 E.7836
N15243 G1 X190.751 Y145.414 E.01592
N15244 G1 X172.706 Y127.37 E.76108
N15245 G1 X173.24 Y127.37 E.01592
N15246 G1 X190.751 Y144.88 E.73856
N15247 G1 X190.751 Y144.346 E.01593
N15248 G1 X173.774 Y127.37 E.71603
N15249 G1 X174.308 Y127.37 E.01592
N15250 G1 X190.751 Y143.812 E.69351
N15251 G1 X190.751 Y143.278 E.01592
N15252 G1 X174.842 Y127.37 E.67099
N15253 G1 X175.376 Y127.37 E.01592
N15254 G1 X190.751 Y142.744 E.64847
N15255 G1 X190.751 Y142.21 E.01592
N15256 G1 X175.91 Y127.37 E.62595
N15257 G1 X176.444 Y127.37 E.01592
N15258 G1 X190.751 Y141.676 E.60343
N15259 G1 X190.751 Y141.142 E.01592
N15260 G1 X176.978 Y127.37 E.58091
N15261 G1 X177.512 Y127.37 E.01592
N15262 G1 X190.751 Y140.608 E.55839
N15263 G1 X190.751 Y140.074 E.01592
N15264 G1 X178.046 Y127.37 E.53587
N15265 G1 X178.58 Y127.37 E.01592
N15266 G1 X190.751 Y139.541 E.51335
N15267 G1 X190.751 Y139.007 E.01592
N15268 G1 X179.114 Y127.37 E.49082
N15269 G1 X179.648 Y127.37 E.01592
N15270 G1 X190.751 Y138.473 E.4683
N15271 G1 X190.751 Y137.939 E.01592
N15272 G1 X180.182 Y127.37 E.44578
N15273 G1 X180.715 Y127.37 E.01592
N15274 G1 X190.751 Y137.405 E.42326
N15275 G1 X190.751 Y136.871 E.01592
N15276 G1 X181.249 Y127.37 E.40074
N15277 G1 X181.783 Y127.37 E.01592
N15278 G1 X190.751 Y136.337 E.37822
N15279 G1 X190.751 Y135.803 E.01592
N15280 G1 X182.317 Y127.37 E.3557
N15281 G1 X182.851 Y127.37 E.01592
N15282 G1 X190.751 Y135.269 E.33318
N15283 G1 X190.751 Y134.735 E.01592
N15284 G1 X183.385 Y127.37 E.31066
N15285 G1 X183.919 Y127.37 E.01592
N15286 G1 X190.751 Y134.201 E.28813
N15287 G1 X190.751 Y133.667 E.01592
N15288 G1 X184.453 Y127.37 E.26561
N15289 G1 X184.987 Y127.37 E.01592
N15290 G1 X190.751 Y133.133 E.24309
N15291 G1 X190.751 Y132.599 E.01592
N15292 G1 X185.521 Y127.37 E.22057
N15293 G1 X186.055 Y127.37 E.01592
N15294 G1 X190.751 Y132.065 E.19805
N15295 G1 X190.751 Y131.531 E.01592
N15296 G1 X186.589 Y127.37 E.17553
N15297 G1 X187.123 Y127.37 E.01592
N15298 G1 X190.751 Y130.997 E.15301
N15299 G1 X190.751 Y130.463 E.01592
N15300 G1 X187.657 Y127.37 E.13049
N15301 G1 X188.191 Y127.37 E.01592
N15302 G1 X190.751 Y129.929 E.10797
N15303 G1 X190.751 Y129.395 E.01592
N15304 G1 X188.725 Y127.37 E.08544
N15305 G1 X189.259 Y127.37 E.01592
N15306 G1 X190.751 Y128.862 E.06292
N15307 G1 X190.751 Y128.328 E.01592
N15308 G1 X189.793 Y127.37 E.0404
N15309 G1 X190.327 Y127.37 E.01592
N15310 G1 X190.92 Y127.963 E.02504
N15311 ; WIPE_START
N15312 G1 X190.327 Y127.37 E-.31901
N15313 G1 X189.793 Y127.37 E-.2029
N15314 G1 X190.236 Y127.813 E-.23809
N15315 ; WIPE_END
N15316 G1 E-.04 F1800
N15317 M204 S10000
N15318 G17
N15319 G3 Z12.6 I1.217 J0 P1  F60000
N15320 ; stop printing object, unique label id: 229
N15321 M625
N15322 ; object ids of layer 61 start: 229
N15323 M624 AQAAAAAAAAA=
N15324 ;======== H2D 20250527========
N15325 ; SKIPPABLE_START
N15326 ; SKIPTYPE: timelapse
N15327 M622.1 S1 ; for prev firware, default turned on
N15328 
N15329 M1002 judge_flag timelapse_record_flag
N15330 
N15331 M622 J1
N15332 M993 A2 B2 C2
N15333 M993 A0 B0 C0
N15334 
N15335 
N15336 
N15337 
N15338     M9711 M0 E1 X260 Y141 Z12.6 S11 C10 O0 T3000
N15339 
N15340 
N15341 
N15342 M993 A3 B3 C3
N15343 
N15344 M623
N15345 ; SKIPPABLE_END
N15346 
N15347 ; object ids of this layer61 end: 229
N15348 M625
N15349 ; CHANGE_LAYER
N15350 ; Z_HEIGHT: 12.4
N15351 ; LAYER_HEIGHT: 0.2
N15352 ;======== H2D 20250521========
N15353 ; layer num/total_layer_count: 62/63
N15354 ; update layer progress
N15355 M73 L62
N15356 M991 S0 P61 ;notify layer change
N15357 
N15358 
N15359 ; OBJECT_ID: 229
N15360 ; COOLING_NODE: 0
N15361 ; start printing object, unique label id: 229
N15362 M624 AQAAAAAAAAA=
N15363 G1 X191.084 Y200.639 F60000
N15364 G1 Z12.4
N15365 G1 E.8 F1800
N15366 ; FEATURE: Inner wall
N15367 ; LINE_WIDTH: 0.45
N15368 ; LAYER_HEIGHT: 0.2
N15369 G1 F4421.739
N15370 M204 S8000
N15371 G1 X158.916 Y200.639 E1.03439
N15372 G1 X158.916 Y127.036 E2.36678
N15373 G1 X191.084 Y127.036 E1.03439
N15374 G1 X191.084 Y200.579 E2.36485
N15375 ; COOLING_NODE: 0
N15376 M204 S10000
N15377 G1 X191.491 Y201.046 F60000
N15378 G1 F4421.739
N15379 M204 S8000
N15380 G1 X158.509 Y201.046 E1.06057
N15381 G1 X158.509 Y126.629 E2.39296
N15382 G1 X191.491 Y126.629 E1.06057
N15383 G1 X191.491 Y200.986 E2.39103
N15384 ; COOLING_NODE: 0
N15385 M204 S10000
N15386 G1 X191.898 Y201.453 F60000
N15387 G1 F4421.739
N15388 M204 S8000
N15389 G1 X158.102 Y201.453 E1.08675
N15390 G1 X158.102 Y126.222 E2.41914
N15391 G1 X191.898 Y126.222 E1.08675
N15392 G1 X191.898 Y201.393 E2.41721
N15393 ; COOLING_NODE: 0
N15394 M204 S10000
N15395 G1 X192.29 Y201.845 F60000
N15396 ; FEATURE: Outer wall
N15397 ; LINE_WIDTH: 0.42
N15398 G1 F4773.528
N15399 M204 S5000
N15400 G1 X157.71 Y201.845 E1.03002
N15401 G1 X157.71 Y125.83 E2.26421
N15402 G1 X192.29 Y125.83 E1.03002
N15403 G1 X192.29 Y201.785 E2.26243
N15404 G1 E-.8 F1800
N15405 M204 S10000
N15406 G1 X190.157 Y200.475 Z12.8 F60000
N15407 G1 Z12.4
N15408 G1 E.8 F1800
N15409 ; FEATURE: Internal solid infill
N15410 ; LINE_WIDTH: 0.42048
N15411 G1 F4767.454
N15412 M204 S8000
N15413 G1 X190.751 Y199.881 E.02504
N15414 G1 X190.751 Y199.347 E.01592
N15415 G1 X189.793 Y200.305 E.0404
N15416 G1 X189.259 Y200.305 E.01592
N15417 G1 X190.751 Y198.813 E.06292
N15418 G1 X190.751 Y198.279 E.01592
N15419 G1 X188.725 Y200.305 E.08544
N15420 G1 X188.191 Y200.305 E.01592
N15421 G1 X190.751 Y197.746 E.10797
N15422 G1 X190.751 Y197.212 E.01592
N15423 G1 X187.657 Y200.305 E.13049
N15424 G1 X187.123 Y200.305 E.01592
N15425 G1 X190.751 Y196.678 E.15301
N15426 G1 X190.751 Y196.144 E.01592
N15427 G1 X186.589 Y200.305 E.17553
N15428 G1 X186.055 Y200.305 E.01592
N15429 G1 X190.751 Y195.61 E.19805
N15430 G1 X190.751 Y195.076 E.01592
N15431 G1 X185.521 Y200.305 E.22057
N15432 G1 X184.987 Y200.305 E.01592
N15433 G1 X190.751 Y194.542 E.24309
N15434 G1 X190.751 Y194.008 E.01592
N15435 G1 X184.453 Y200.305 E.26561
N15436 G1 X183.919 Y200.305 E.01592
N15437 G1 X190.751 Y193.474 E.28813
N15438 G1 X190.751 Y192.94 E.01592
N15439 G1 X183.385 Y200.305 E.31066
N15440 G1 X182.851 Y200.305 E.01592
N15441 G1 X190.751 Y192.406 E.33318
N15442 G1 X190.751 Y191.872 E.01592
N15443 G1 X182.317 Y200.305 E.3557
N15444 G1 X181.783 Y200.305 E.01592
N15445 G1 X190.751 Y191.338 E.37822
N15446 G1 X190.751 Y190.804 E.01593
N15447 G1 X181.249 Y200.305 E.40074
N15448 G1 X180.715 Y200.305 E.01592
N15449 G1 X190.751 Y190.27 E.42326
N15450 G1 X190.751 Y189.736 E.01592
N15451 G1 X180.182 Y200.305 E.44578
N15452 G1 X179.648 Y200.305 E.01592
N15453 G1 X190.751 Y189.202 E.4683
N15454 G1 X190.751 Y188.668 E.01592
N15455 G1 X179.114 Y200.305 E.49082
N15456 G1 X178.58 Y200.305 E.01592
N15457 G1 X190.751 Y188.134 E.51335
N15458 G1 X190.751 Y187.6 E.01592
N15459 G1 X178.046 Y200.305 E.53587
N15460 G1 X177.512 Y200.305 E.01592
N15461 G1 X190.751 Y187.067 E.55839
N15462 G1 X190.751 Y186.533 E.01592
N15463 G1 X176.978 Y200.305 E.58091
N15464 G1 X176.444 Y200.305 E.01593
N15465 G1 X190.751 Y185.999 E.60343
N15466 G1 X190.751 Y185.465 E.01592
N15467 G1 X175.91 Y200.305 E.62595
N15468 G1 X175.376 Y200.305 E.01592
N15469 G1 X190.751 Y184.931 E.64847
N15470 G1 X190.751 Y184.397 E.01592
N15471 G1 X174.842 Y200.305 E.67099
N15472 G1 X174.308 Y200.305 E.01592
N15473 M73 P94 R3
N15474 G1 X190.751 Y183.863 E.69351
N15475 G1 X190.751 Y183.329 E.01592
N15476 G1 X173.774 Y200.305 E.71604
N15477 G1 X173.24 Y200.305 E.01593
N15478 G1 X190.751 Y182.795 E.73856
N15479 G1 X190.751 Y182.261 E.01592
N15480 G1 X172.706 Y200.305 E.76108
N15481 G1 X172.172 Y200.305 E.01592
N15482 G1 X190.751 Y181.727 E.7836
N15483 G1 X190.751 Y181.193 E.01592
N15484 G1 X171.638 Y200.305 E.80612
N15485 G1 X171.104 Y200.305 E.01592
N15486 G1 X190.751 Y180.659 E.82864
N15487 G1 X190.751 Y180.125 E.01592
N15488 G1 X170.57 Y200.305 E.85116
N15489 G1 X170.036 Y200.305 E.01592
N15490 G1 X190.751 Y179.591 E.87368
N15491 G1 X190.751 Y179.057 E.01592
N15492 G1 X169.503 Y200.305 E.8962
N15493 G1 X168.969 Y200.305 E.01592
N15494 G1 X190.751 Y178.523 E.91873
N15495 G1 X190.751 Y177.989 E.01592
N15496 G1 X168.435 Y200.305 E.94125
N15497 G1 X167.901 Y200.305 E.01592
N15498 G1 X190.751 Y177.455 E.96377
N15499 G1 X190.751 Y176.921 E.01592
N15500 G1 X167.367 Y200.305 E.98629
N15501 G1 X166.833 Y200.305 E.01592
N15502 G1 X190.751 Y176.388 E1.00881
N15503 G1 X190.751 Y175.854 E.01592
N15504 G1 X166.299 Y200.305 E1.03133
N15505 G1 X165.765 Y200.305 E.01592
N15506 G1 X190.751 Y175.32 E1.05385
N15507 G1 X190.751 Y174.786 E.01592
N15508 G1 X165.231 Y200.305 E1.07637
N15509 G1 X164.697 Y200.305 E.01592
N15510 G1 X190.751 Y174.252 E1.09889
N15511 G1 X190.751 Y173.718 E.01592
N15512 G1 X164.163 Y200.305 E1.12141
N15513 G1 X163.629 Y200.305 E.01592
N15514 G1 X190.751 Y173.184 E1.14394
N15515 G1 X190.751 Y172.65 E.01592
N15516 G1 X163.095 Y200.305 E1.16646
N15517 G1 X162.561 Y200.305 E.01592
N15518 G1 X190.751 Y172.116 E1.18898
N15519 G1 X190.751 Y171.582 E.01592
N15520 G1 X162.027 Y200.305 E1.2115
N15521 G1 X161.493 Y200.305 E.01592
N15522 G1 X190.751 Y171.048 E1.23402
N15523 G1 X190.751 Y170.514 E.01592
N15524 G1 X160.959 Y200.305 E1.25654
N15525 G1 X160.425 Y200.305 E.01592
N15526 G1 X190.751 Y169.98 E1.27906
N15527 G1 X190.751 Y169.446 E.01592
N15528 G1 X159.891 Y200.305 E1.30158
N15529 G1 X159.357 Y200.305 E.01592
N15530 G1 X190.751 Y168.912 E1.3241
N15531 G1 X190.751 Y168.378 E.01593
N15532 G1 X159.249 Y199.879 E1.32866
N15533 G1 X159.249 Y199.345 E.01592
N15534 M73 P94 R2
N15535 G1 X190.751 Y167.844 E1.32866
N15536 G1 X190.751 Y167.31 E.01592
N15537 G1 X159.249 Y198.811 E1.32866
N15538 G1 X159.249 Y198.277 E.01593
N15539 G1 X190.751 Y166.776 E1.32866
N15540 G1 X190.751 Y166.242 E.01592
N15541 G1 X159.249 Y197.744 E1.32866
N15542 G1 X159.249 Y197.21 E.01592
N15543 G1 X190.751 Y165.709 E1.32866
N15544 G1 X190.751 Y165.175 E.01592
N15545 G1 X159.249 Y196.676 E1.32866
N15546 G1 X159.249 Y196.142 E.01592
N15547 G1 X190.751 Y164.641 E1.32866
N15548 G1 X190.751 Y164.107 E.01592
N15549 G1 X159.249 Y195.608 E1.32866
N15550 G1 X159.249 Y195.074 E.01592
N15551 G1 X190.751 Y163.573 E1.32866
N15552 G1 X190.751 Y163.039 E.01592
N15553 G1 X159.249 Y194.54 E1.32866
N15554 G1 X159.249 Y194.006 E.01592
N15555 G1 X190.751 Y162.505 E1.32866
N15556 G1 X190.751 Y161.971 E.01592
N15557 G1 X159.249 Y193.472 E1.32866
N15558 G1 X159.249 Y192.938 E.01592
N15559 G1 X190.751 Y161.437 E1.32866
N15560 G1 X190.751 Y160.903 E.01592
N15561 G1 X159.249 Y192.404 E1.32866
N15562 G1 X159.249 Y191.87 E.01592
N15563 G1 X190.751 Y160.369 E1.32866
N15564 G1 X190.751 Y159.835 E.01592
N15565 G1 X159.249 Y191.336 E1.32866
N15566 G1 X159.249 Y190.802 E.01592
N15567 G1 X190.751 Y159.301 E1.32866
N15568 G1 X190.751 Y158.767 E.01592
N15569 G1 X159.249 Y190.268 E1.32866
N15570 G1 X159.249 Y189.734 E.01592
N15571 G1 X190.751 Y158.233 E1.32866
N15572 G1 X190.751 Y157.699 E.01592
N15573 G1 X159.249 Y189.2 E1.32866
N15574 G1 X159.249 Y188.666 E.01592
N15575 G1 X190.751 Y157.165 E1.32866
N15576 G1 X190.751 Y156.631 E.01592
N15577 G1 X159.249 Y188.132 E1.32866
N15578 G1 X159.249 Y187.598 E.01592
N15579 G1 X190.751 Y156.097 E1.32866
N15580 G1 X190.751 Y155.563 E.01592
N15581 G1 X159.249 Y187.065 E1.32866
N15582 G1 X159.249 Y186.531 E.01593
N15583 G1 X190.751 Y155.03 E1.32866
N15584 G1 X190.751 Y154.496 E.01592
N15585 G1 X159.249 Y185.997 E1.32866
N15586 G1 X159.249 Y185.463 E.01592
N15587 G1 X190.751 Y153.962 E1.32866
N15588 G1 X190.751 Y153.428 E.01592
N15589 G1 X159.249 Y184.929 E1.32866
N15590 G1 X159.249 Y184.395 E.01592
N15591 G1 X190.751 Y152.894 E1.32866
N15592 G1 X190.751 Y152.36 E.01592
N15593 G1 X159.249 Y183.861 E1.32866
N15594 G1 X159.249 Y183.327 E.01592
N15595 G1 X190.751 Y151.826 E1.32866
N15596 G1 X190.751 Y151.292 E.01592
N15597 G1 X159.249 Y182.793 E1.32866
N15598 G1 X159.249 Y182.259 E.01592
N15599 G1 X190.751 Y150.758 E1.32866
N15600 M73 P95 R2
N15601 G1 X190.751 Y150.224 E.01592
N15602 G1 X159.249 Y181.725 E1.32866
N15603 G1 X159.249 Y181.191 E.01592
N15604 G1 X190.751 Y149.69 E1.32866
N15605 G1 X190.751 Y149.156 E.01593
N15606 G1 X159.249 Y180.657 E1.32866
N15607 G1 X159.249 Y180.123 E.01592
N15608 G1 X190.751 Y148.622 E1.32866
N15609 G1 X190.751 Y148.088 E.01592
N15610 G1 X159.249 Y179.589 E1.32866
N15611 G1 X159.249 Y179.055 E.01592
N15612 G1 X190.751 Y147.554 E1.32866
N15613 G1 X190.751 Y147.02 E.01592
N15614 G1 X159.249 Y178.521 E1.32866
N15615 G1 X159.249 Y177.987 E.01592
N15616 G1 X190.751 Y146.486 E1.32866
N15617 G1 X190.751 Y145.952 E.01592
N15618 G1 X159.249 Y177.453 E1.32866
N15619 G1 X159.249 Y176.919 E.01592
N15620 G1 X190.751 Y145.418 E1.32866
N15621 G1 X190.751 Y144.884 E.01592
N15622 G1 X159.249 Y176.386 E1.32866
N15623 G1 X159.249 Y175.852 E.01592
N15624 G1 X190.751 Y144.351 E1.32866
N15625 G1 X190.751 Y143.817 E.01592
N15626 G1 X159.249 Y175.318 E1.32866
N15627 G1 X159.249 Y174.784 E.01592
N15628 G1 X190.751 Y143.283 E1.32866
N15629 G1 X190.751 Y142.749 E.01592
N15630 G1 X159.249 Y174.25 E1.32866
N15631 G1 X159.249 Y173.716 E.01592
N15632 G1 X190.751 Y142.215 E1.32866
N15633 G1 X190.751 Y141.681 E.01592
N15634 G1 X159.249 Y173.182 E1.32866
N15635 G1 X159.249 Y172.648 E.01592
N15636 G1 X190.751 Y141.147 E1.32866
N15637 G1 X190.751 Y140.613 E.01592
N15638 G1 X159.249 Y172.114 E1.32866
N15639 G1 X159.249 Y171.58 E.01592
N15640 G1 X190.751 Y140.079 E1.32866
N15641 G1 X190.751 Y139.545 E.01592
N15642 G1 X159.249 Y171.046 E1.32866
N15643 G1 X159.249 Y170.512 E.01592
N15644 G1 X190.751 Y139.011 E1.32866
N15645 G1 X190.751 Y138.477 E.01592
N15646 G1 X159.249 Y169.978 E1.32866
N15647 G1 X159.249 Y169.444 E.01592
N15648 G1 X190.751 Y137.943 E1.32866
N15649 G1 X190.751 Y137.409 E.01593
N15650 G1 X159.249 Y168.91 E1.32866
N15651 G1 X159.249 Y168.376 E.01592
N15652 G1 X190.751 Y136.875 E1.32866
N15653 G1 X190.751 Y136.341 E.01592
N15654 G1 X159.249 Y167.842 E1.32866
N15655 G1 X159.249 Y167.308 E.01592
N15656 G1 X190.751 Y135.807 E1.32866
N15657 G1 X190.751 Y135.273 E.01592
N15658 G1 X159.249 Y166.774 E1.32866
N15659 G1 X159.249 Y166.24 E.01592
N15660 G1 X190.751 Y134.739 E1.32866
N15661 G1 X190.751 Y134.205 E.01592
N15662 G1 X159.249 Y165.707 E1.32866
N15663 G1 X159.249 Y165.173 E.01592
N15664 G1 X190.751 Y133.672 E1.32866
N15665 G1 X190.751 Y133.138 E.01592
N15666 G1 X159.249 Y164.639 E1.32866
N15667 G1 X159.249 Y164.105 E.01593
N15668 G1 X190.751 Y132.604 E1.32866
N15669 G1 X190.751 Y132.07 E.01592
N15670 G1 X159.249 Y163.571 E1.32866
N15671 G1 X159.249 Y163.037 E.01592
N15672 G1 X190.751 Y131.536 E1.32866
N15673 G1 X190.751 Y131.002 E.01592
N15674 G1 X159.249 Y162.503 E1.32866
N15675 G1 X159.249 Y161.969 E.01592
N15676 G1 X190.751 Y130.468 E1.32866
N15677 G1 X190.751 Y129.934 E.01592
N15678 G1 X159.249 Y161.435 E1.32866
N15679 G1 X159.249 Y160.901 E.01592
N15680 G1 X190.751 Y129.4 E1.32866
N15681 G1 X190.751 Y128.866 E.01592
N15682 G1 X159.249 Y160.367 E1.32866
N15683 G1 X159.249 Y159.833 E.01592
N15684 G1 X190.751 Y128.332 E1.32866
N15685 G1 X190.751 Y127.798 E.01592
N15686 G1 X159.249 Y159.299 E1.32866
N15687 G1 X159.249 Y158.765 E.01592
N15688 G1 X190.645 Y127.37 E1.32421
N15689 G1 X190.111 Y127.37 E.01592
N15690 G1 X159.249 Y158.231 E1.30169
N15691 G1 X159.249 Y157.697 E.01592
N15692 G1 X189.577 Y127.37 E1.27917
N15693 G1 X189.043 Y127.37 E.01592
N15694 G1 X159.249 Y157.163 E1.25664
N15695 G1 X159.249 Y156.629 E.01592
N15696 G1 X188.509 Y127.37 E1.23412
N15697 G1 X187.975 Y127.37 E.01592
N15698 G1 X159.249 Y156.095 E1.2116
N15699 G1 X159.249 Y155.561 E.01592
N15700 G1 X187.441 Y127.37 E1.18908
N15701 G1 X186.907 Y127.37 E.01592
N15702 G1 X159.249 Y155.028 E1.16656
N15703 G1 X159.249 Y154.494 E.01592
N15704 G1 X186.373 Y127.37 E1.14404
N15705 G1 X185.839 Y127.37 E.01592
N15706 G1 X159.249 Y153.96 E1.12152
N15707 G1 X159.249 Y153.426 E.01592
N15708 G1 X185.305 Y127.37 E1.099
N15709 G1 X184.772 Y127.37 E.01593
N15710 G1 X159.249 Y152.892 E1.07648
N15711 G1 X159.249 Y152.358 E.01592
N15712 G1 X184.238 Y127.37 E1.05395
N15713 G1 X183.704 Y127.37 E.01592
N15714 M73 P96 R2
N15715 G1 X159.249 Y151.824 E1.03143
N15716 G1 X159.249 Y151.29 E.01592
N15717 G1 X183.17 Y127.37 E1.00891
N15718 G1 X182.636 Y127.37 E.01592
N15719 G1 X159.249 Y150.756 E.98639
N15720 G1 X159.249 Y150.222 E.01592
N15721 G1 X182.102 Y127.37 E.96387
N15722 G1 X181.568 Y127.37 E.01592
N15723 G1 X159.249 Y149.688 E.94135
N15724 G1 X159.249 Y149.154 E.01592
N15725 G1 X181.034 Y127.37 E.91883
N15726 G1 X180.5 Y127.37 E.01592
N15727 G1 X159.249 Y148.62 E.89631
N15728 G1 X159.249 Y148.086 E.01592
N15729 G1 X179.966 Y127.37 E.87379
N15730 G1 X179.432 Y127.37 E.01592
N15731 G1 X159.249 Y147.552 E.85126
N15732 G1 X159.249 Y147.018 E.01592
N15733 G1 X178.898 Y127.37 E.82874
N15734 G1 X178.364 Y127.37 E.01592
N15735 G1 X159.249 Y146.484 E.80622
N15736 G1 X159.249 Y145.95 E.01592
N15737 G1 X177.83 Y127.37 E.7837
N15738 G1 X177.296 Y127.37 E.01592
N15739 G1 X159.249 Y145.416 E.76118
N15740 G1 X159.249 Y144.882 E.01593
N15741 G1 X176.762 Y127.37 E.73866
N15742 G1 X176.228 Y127.37 E.01592
N15743 G1 X159.249 Y144.349 E.71614
N15744 G1 X159.249 Y143.815 E.01592
N15745 G1 X175.694 Y127.37 E.69362
N15746 G1 X175.16 Y127.37 E.01592
N15747 G1 X159.249 Y143.281 E.6711
N15748 G1 X159.249 Y142.747 E.01592
N15749 G1 X174.626 Y127.37 E.64857
N15750 G1 X174.093 Y127.37 E.01592
N15751 G1 X159.249 Y142.213 E.62605
N15752 G1 X159.249 Y141.679 E.01592
N15753 G1 X173.559 Y127.37 E.60353
N15754 G1 X173.025 Y127.37 E.01592
N15755 G1 X159.249 Y141.145 E.58101
N15756 G1 X159.249 Y140.611 E.01592
N15757 G1 X172.491 Y127.37 E.55849
N15758 G1 X171.957 Y127.37 E.01592
N15759 G1 X159.249 Y140.077 E.53597
N15760 G1 X159.249 Y139.543 E.01592
N15761 G1 X171.423 Y127.37 E.51345
N15762 M73 P96 R1
N15763 G1 X170.889 Y127.37 E.01592
N15764 G1 X159.249 Y139.009 E.49093
N15765 G1 X159.249 Y138.475 E.01592
N15766 G1 X170.355 Y127.37 E.46841
N15767 G1 X169.821 Y127.37 E.01592
N15768 G1 X159.249 Y137.941 E.44588
N15769 G1 X159.249 Y137.407 E.01592
N15770 G1 X169.287 Y127.37 E.42336
N15771 G1 X168.753 Y127.37 E.01592
N15772 G1 X159.249 Y136.873 E.40084
N15773 G1 X159.249 Y136.339 E.01592
N15774 G1 X168.219 Y127.37 E.37832
N15775 G1 X167.685 Y127.37 E.01592
N15776 G1 X159.249 Y135.805 E.3558
N15777 G1 X159.249 Y135.271 E.01592
N15778 G1 X167.151 Y127.37 E.33328
N15779 G1 X166.617 Y127.37 E.01592
N15780 G1 X159.249 Y134.737 E.31076
N15781 G1 X159.249 Y134.203 E.01592
N15782 G1 X166.083 Y127.37 E.28824
N15783 G1 X165.549 Y127.37 E.01592
N15784 G1 X159.249 Y133.669 E.26572
N15785 G1 X159.249 Y133.136 E.01592
N15786 G1 X165.015 Y127.37 E.24319
N15787 G1 X164.481 Y127.37 E.01592
N15788 G1 X159.249 Y132.602 E.22067
N15789 G1 X159.249 Y132.068 E.01592
N15790 G1 X163.947 Y127.37 E.19815
N15791 G1 X163.413 Y127.37 E.01592
N15792 G1 X159.249 Y131.534 E.17563
N15793 G1 X159.249 Y131 E.01592
N15794 G1 X162.88 Y127.37 E.15311
N15795 G1 X162.346 Y127.37 E.01592
N15796 G1 X159.249 Y130.466 E.13059
N15797 G1 X159.249 Y129.932 E.01592
N15798 G1 X161.812 Y127.37 E.10807
N15799 G1 X161.278 Y127.37 E.01592
N15800 G1 X159.249 Y129.398 E.08555
N15801 G1 X159.249 Y128.864 E.01592
N15802 G1 X160.744 Y127.37 E.06303
N15803 G1 X160.21 Y127.37 E.01592
N15804 G1 X159.249 Y128.33 E.0405
N15805 G1 X159.249 Y127.796 E.01592
N15806 G1 X159.846 Y127.2 E.02514
N15807 ; WIPE_START
N15808 G1 X159.249 Y127.796 E-.32032
N15809 G1 X159.249 Y128.33 E-.2029
N15810 G1 X159.69 Y127.889 E-.23678
N15811 ; WIPE_END
N15812 G1 E-.04 F1800
N15813 M204 S10000
N15814 G17
N15815 G3 Z12.8 I1.217 J0 P1  F60000
N15816 ; stop printing object, unique label id: 229
N15817 M625
N15818 ; object ids of layer 62 start: 229
N15819 M624 AQAAAAAAAAA=
N15820 ;======== H2D 20250527========
N15821 ; SKIPPABLE_START
N15822 ; SKIPTYPE: timelapse
N15823 M622.1 S1 ; for prev firware, default turned on
N15824 
N15825 M1002 judge_flag timelapse_record_flag
N15826 
N15827 M622 J1
N15828 M993 A2 B2 C2
N15829 M993 A0 B0 C0
N15830 
N15831 
N15832 
N15833 
N15834     M9711 M0 E1 X260 Y141 Z12.8 S11 C10 O0 T3000
N15835 
N15836 
N15837 
N15838 M993 A3 B3 C3
N15839 
N15840 M623
N15841 ; SKIPPABLE_END
N15842 
N15843 ; object ids of this layer62 end: 229
N15844 M625
N15845 ; CHANGE_LAYER
N15846 ; Z_HEIGHT: 12.6
N15847 ; LAYER_HEIGHT: 0.200001
N15848 ;======== H2D 20250521========
N15849 ; layer num/total_layer_count: 63/63
N15850 ; update layer progress
N15851 M73 L63
N15852 M991 S0 P62 ;notify layer change
N15853 
N15854 
N15855 ; OBJECT_ID: 229
N15856 ; COOLING_NODE: 0
N15857 ; start printing object, unique label id: 229
N15858 M624 AQAAAAAAAAA=
N15859 G1 X192.29 Y201.845 F60000
N15860 G1 Z12.6
N15861 G1 E.8 F1800
N15862 ; FEATURE: Outer wall
N15863 ; LINE_WIDTH: 0.42
N15864 G1 F4773.528
N15865 M204 S5000
N15866 G1 X157.71 Y201.845 E1.03002
N15867 G1 X157.71 Y125.83 E2.26421
N15868 G1 X192.29 Y125.83 E1.03002
N15869 G1 X192.29 Y201.785 E2.26243
N15870 G1 E-.8 F1800
N15871 M204 S10000
N15872 G1 X192.269 Y194.152 Z13 F60000
N15873 G1 X192.083 Y126.795 Z13
N15874 G1 Z12.6
N15875 G1 E.8 F1800
N15876 ; FEATURE: Top surface
N15877 G1 F4773.528
N15878 M204 S2000
N15879 G1 X191.326 Y126.038 E.03189
N15880 G1 X190.792 Y126.038 E.01588
N15881 G1 X192.083 Y127.328 E.05435
N15882 G1 X192.083 Y127.861 E.01588
N15883 G1 X190.259 Y126.038 E.07681
N15884 G1 X189.726 Y126.038 E.01588
N15885 G1 X192.083 Y128.394 E.09928
N15886 G1 X192.083 Y128.928 E.01588
N15887 G1 X189.193 Y126.038 E.12174
N15888 G1 X188.659 Y126.038 E.01588
N15889 G1 X192.083 Y129.461 E.1442
N15890 G1 X192.083 Y129.994 E.01588
N15891 G1 X188.126 Y126.038 E.16667
N15892 G1 X187.593 Y126.038 E.01588
N15893 G1 X192.083 Y130.527 E.18913
N15894 G1 X192.083 Y131.061 E.01588
N15895 G1 X187.06 Y126.038 E.21159
N15896 G1 X186.526 Y126.038 E.01588
N15897 G1 X192.083 Y131.594 E.23406
N15898 G1 X192.083 Y132.127 E.01588
N15899 G1 X185.993 Y126.038 E.25652
N15900 G1 X185.46 Y126.038 E.01588
N15901 G1 X192.083 Y132.66 E.27898
N15902 G1 X192.083 Y133.194 E.01588
N15903 G1 X184.927 Y126.038 E.30145
N15904 G1 X184.393 Y126.038 E.01588
N15905 G1 X192.083 Y133.727 E.32391
N15906 G1 X192.083 Y134.26 E.01588
N15907 G1 X183.86 Y126.038 E.34637
N15908 G1 X183.327 Y126.038 E.01588
N15909 G1 X192.083 Y134.793 E.36884
N15910 G1 X192.083 Y135.327 E.01588
N15911 G1 X182.794 Y126.038 E.3913
N15912 G1 X182.26 Y126.038 E.01588
N15913 G1 X192.083 Y135.86 E.41376
N15914 G1 X192.083 Y136.393 E.01588
N15915 G1 X181.727 Y126.038 E.43622
N15916 G1 X181.194 Y126.038 E.01588
N15917 G1 X192.083 Y136.926 E.45869
N15918 G1 X192.083 Y137.46 E.01588
N15919 G1 X180.661 Y126.038 E.48115
N15920 G1 X180.127 Y126.038 E.01588
N15921 G1 X192.083 Y137.993 E.50361
N15922 G1 X192.083 Y138.526 E.01588
N15923 G1 X179.594 Y126.038 E.52608
N15924 G1 X179.061 Y126.038 E.01588
N15925 G1 X192.083 Y139.059 E.54854
N15926 G1 X192.083 Y139.593 E.01588
N15927 G1 X178.527 Y126.038 E.571
N15928 G1 X177.994 Y126.038 E.01588
N15929 G1 X192.083 Y140.126 E.59347
N15930 G1 X192.083 Y140.659 E.01588
N15931 G1 X177.461 Y126.038 E.61593
N15932 G1 X176.928 Y126.038 E.01588
N15933 G1 X192.083 Y141.192 E.63839
N15934 G1 X192.083 Y141.726 E.01588
N15935 G1 X176.394 Y126.038 E.66086
N15936 G1 X175.861 Y126.038 E.01588
N15937 G1 X192.083 Y142.259 E.68332
N15938 G1 X192.083 Y142.792 E.01588
N15939 G1 X175.328 Y126.038 E.70578
N15940 G1 X174.795 Y126.038 E.01588
N15941 G1 X192.083 Y143.326 E.72825
N15942 G1 X192.083 Y143.859 E.01588
N15943 G1 X174.261 Y126.038 E.75071
N15944 G1 X173.728 Y126.038 E.01588
N15945 G1 X192.083 Y144.392 E.77317
N15946 G1 X192.083 Y144.925 E.01588
N15947 G1 X173.195 Y126.038 E.79564
N15948 G1 X172.662 Y126.038 E.01588
N15949 G1 X192.083 Y145.459 E.8181
N15950 G1 X192.083 Y145.992 E.01588
N15951 G1 X172.128 Y126.038 E.84056
N15952 G1 X171.595 Y126.038 E.01588
N15953 G1 X192.083 Y146.525 E.86303
N15954 G1 X192.083 Y147.058 E.01588
N15955 G1 X171.062 Y126.038 E.88549
N15956 G1 X170.529 Y126.038 E.01588
N15957 G1 X192.083 Y147.592 E.90795
N15958 G1 X192.083 Y148.125 E.01588
N15959 G1 X169.995 Y126.038 E.93042
N15960 G1 X169.462 Y126.038 E.01588
N15961 G1 X192.083 Y148.658 E.95288
N15962 G1 X192.083 Y149.191 E.01588
N15963 G1 X168.929 Y126.038 E.97534
N15964 G1 X168.396 Y126.038 E.01588
N15965 G1 X192.083 Y149.725 E.99781
N15966 G1 X192.083 Y150.258 E.01588
N15967 G1 X167.862 Y126.038 E1.02027
N15968 G1 X167.329 Y126.038 E.01588
N15969 G1 X192.083 Y150.791 E1.04273
N15970 G1 X192.083 Y151.324 E.01588
N15971 G1 X166.796 Y126.038 E1.0652
N15972 G1 X166.263 Y126.038 E.01588
N15973 G1 X192.083 Y151.858 E1.08766
N15974 G1 X192.083 Y152.391 E.01588
N15975 G1 X165.729 Y126.038 E1.11012
N15976 G1 X165.196 Y126.038 E.01588
N15977 G1 X192.083 Y152.924 E1.13259
N15978 G1 X192.083 Y153.457 E.01588
N15979 G1 X164.663 Y126.038 E1.15505
N15980 G1 X164.13 Y126.038 E.01588
N15981 G1 X192.083 Y153.991 E1.17751
N15982 G1 X192.083 Y154.524 E.01588
N15983 G1 X163.596 Y126.038 E1.19998
N15984 G1 X163.063 Y126.038 E.01588
N15985 G1 X192.083 Y155.057 E1.22244
N15986 G1 X192.083 Y155.59 E.01588
N15987 M73 P97 R1
N15988 G1 X162.53 Y126.038 E1.2449
N15989 G1 X161.997 Y126.038 E.01588
N15990 G1 X192.083 Y156.124 E1.26737
N15991 G1 X192.083 Y156.657 E.01588
N15992 G1 X161.463 Y126.038 E1.28983
N15993 G1 X160.93 Y126.038 E.01588
N15994 G1 X192.083 Y157.19 E1.31229
N15995 G1 X192.083 Y157.723 E.01588
N15996 G1 X160.397 Y126.038 E1.33476
N15997 G1 X159.863 Y126.038 E.01588
N15998 G1 X192.083 Y158.257 E1.35722
N15999 G1 X192.083 Y158.79 E.01588
N16000 G1 X159.33 Y126.038 E1.37968
N16001 G1 X158.797 Y126.038 E.01588
N16002 G1 X192.083 Y159.323 E1.40214
N16003 G1 X192.083 Y159.857 E.01588
N16004 G1 X158.264 Y126.038 E1.42461
N16005 G1 X157.917 Y126.225 E.01172
N16006 G1 X192.083 Y160.39 E1.4392
N16007 G1 X192.083 Y160.923 E.01588
N16008 G1 X157.917 Y126.758 E1.4392
N16009 G1 X157.917 Y127.291 E.01588
N16010 G1 X192.083 Y161.456 E1.4392
N16011 G1 X192.083 Y161.99 E.01588
N16012 G1 X157.917 Y127.824 E1.4392
N16013 G1 X157.917 Y128.358 E.01588
N16014 G1 X192.083 Y162.523 E1.4392
N16015 G1 X192.083 Y163.056 E.01588
N16016 G1 X157.917 Y128.891 E1.4392
N16017 G1 X157.917 Y129.424 E.01588
N16018 G1 X192.083 Y163.589 E1.4392
N16019 G1 X192.083 Y164.123 E.01588
N16020 G1 X157.917 Y129.957 E1.4392
N16021 G1 X157.917 Y130.491 E.01588
N16022 G1 X192.083 Y164.656 E1.4392
N16023 G1 X192.083 Y165.189 E.01588
N16024 G1 X157.917 Y131.024 E1.4392
N16025 G1 X157.917 Y131.557 E.01588
N16026 G1 X192.083 Y165.722 E1.4392
N16027 G1 X192.083 Y166.256 E.01588
N16028 G1 X157.917 Y132.09 E1.4392
N16029 G1 X157.917 Y132.624 E.01588
N16030 G1 X192.083 Y166.789 E1.4392
N16031 G1 X192.083 Y167.322 E.01588
N16032 G1 X157.917 Y133.157 E1.4392
N16033 G1 X157.917 Y133.69 E.01588
N16034 G1 X192.083 Y167.855 E1.4392
N16035 G1 X192.083 Y168.389 E.01588
N16036 G1 X157.917 Y134.223 E1.4392
N16037 G1 X157.917 Y134.757 E.01588
N16038 G1 X192.083 Y168.922 E1.4392
N16039 G1 X192.083 Y169.455 E.01588
N16040 G1 X157.917 Y135.29 E1.4392
N16041 G1 X157.917 Y135.823 E.01588
N16042 G1 X192.083 Y169.988 E1.4392
N16043 G1 X192.083 Y170.522 E.01588
N16044 G1 X157.917 Y136.356 E1.4392
N16045 G1 X157.917 Y136.89 E.01588
N16046 G1 X192.083 Y171.055 E1.4392
N16047 G1 X192.083 Y171.588 E.01588
N16048 G1 X157.917 Y137.423 E1.4392
N16049 G1 X157.917 Y137.956 E.01588
N16050 G1 X192.083 Y172.121 E1.4392
N16051 G1 X192.083 Y172.655 E.01588
N16052 G1 X157.917 Y138.489 E1.4392
N16053 G1 X157.917 Y139.023 E.01588
N16054 G1 X192.083 Y173.188 E1.4392
N16055 G1 X192.083 Y173.721 E.01588
N16056 G1 X157.917 Y139.556 E1.4392
N16057 G1 X157.917 Y140.089 E.01588
N16058 G1 X192.083 Y174.254 E1.4392
N16059 G1 X192.083 Y174.788 E.01588
N16060 G1 X157.917 Y140.622 E1.4392
N16061 G1 X157.917 Y141.156 E.01588
N16062 G1 X192.083 Y175.321 E1.4392
N16063 G1 X192.083 Y175.854 E.01588
N16064 G1 X157.917 Y141.689 E1.4392
N16065 G1 X157.917 Y142.222 E.01588
N16066 G1 X192.083 Y176.387 E1.4392
N16067 G1 X192.083 Y176.921 E.01588
N16068 G1 X157.917 Y142.755 E1.4392
N16069 G1 X157.917 Y143.289 E.01588
N16070 G1 X192.083 Y177.454 E1.4392
N16071 G1 X192.083 Y177.987 E.01588
N16072 G1 X157.917 Y143.822 E1.4392
N16073 G1 X157.917 Y144.355 E.01588
N16074 G1 X192.083 Y178.521 E1.4392
N16075 G1 X192.083 Y179.054 E.01588
N16076 G1 X157.917 Y144.889 E1.4392
N16077 G1 X157.917 Y145.422 E.01588
N16078 G1 X192.083 Y179.587 E1.4392
N16079 G1 X192.083 Y180.12 E.01588
N16080 G1 X157.917 Y145.955 E1.4392
N16081 G1 X157.917 Y146.488 E.01588
N16082 G1 X192.083 Y180.654 E1.4392
N16083 G1 X192.083 Y181.187 E.01588
N16084 G1 X157.917 Y147.022 E1.4392
N16085 G1 X157.917 Y147.555 E.01588
N16086 G1 X192.083 Y181.72 E1.4392
N16087 G1 X192.083 Y182.253 E.01588
N16088 M73 P98 R1
N16089 G1 X157.917 Y148.088 E1.4392
N16090 G1 X157.917 Y148.621 E.01588
N16091 G1 X192.083 Y182.787 E1.4392
N16092 G1 X192.083 Y183.32 E.01588
N16093 G1 X157.917 Y149.155 E1.4392
N16094 G1 X157.917 Y149.688 E.01588
N16095 G1 X192.083 Y183.853 E1.4392
N16096 G1 X192.083 Y184.386 E.01588
N16097 G1 X157.917 Y150.221 E1.4392
N16098 G1 X157.917 Y150.754 E.01588
N16099 G1 X192.083 Y184.92 E1.4392
N16100 G1 X192.083 Y185.453 E.01588
N16101 G1 X157.917 Y151.288 E1.4392
N16102 G1 X157.917 Y151.821 E.01588
N16103 M73 P98 R0
N16104 G1 X192.083 Y185.986 E1.4392
N16105 G1 X192.083 Y186.519 E.01588
N16106 G1 X157.917 Y152.354 E1.4392
N16107 G1 X157.917 Y152.887 E.01588
N16108 G1 X192.083 Y187.053 E1.4392
N16109 G1 X192.083 Y187.586 E.01588
N16110 G1 X157.917 Y153.421 E1.4392
N16111 G1 X157.917 Y153.954 E.01588
N16112 G1 X192.083 Y188.119 E1.4392
N16113 G1 X192.083 Y188.652 E.01588
N16114 G1 X157.917 Y154.487 E1.4392
N16115 G1 X157.917 Y155.02 E.01588
N16116 G1 X192.083 Y189.186 E1.4392
N16117 G1 X192.083 Y189.719 E.01588
N16118 G1 X157.917 Y155.554 E1.4392
N16119 G1 X157.917 Y156.087 E.01588
N16120 G1 X192.083 Y190.252 E1.4392
N16121 G1 X192.083 Y190.785 E.01588
N16122 G1 X157.917 Y156.62 E1.4392
N16123 G1 X157.917 Y157.153 E.01588
N16124 G1 X192.083 Y191.319 E1.4392
N16125 G1 X192.083 Y191.852 E.01588
N16126 G1 X157.917 Y157.687 E1.4392
N16127 G1 X157.917 Y158.22 E.01588
N16128 G1 X192.083 Y192.385 E1.4392
N16129 G1 X192.083 Y192.918 E.01588
N16130 G1 X157.917 Y158.753 E1.4392
N16131 G1 X157.917 Y159.286 E.01588
N16132 G1 X192.083 Y193.452 E1.4392
N16133 G1 X192.083 Y193.985 E.01588
N16134 G1 X157.917 Y159.82 E1.4392
N16135 G1 X157.917 Y160.353 E.01588
N16136 G1 X192.083 Y194.518 E1.4392
N16137 G1 X192.083 Y195.052 E.01588
N16138 G1 X157.917 Y160.886 E1.4392
N16139 G1 X157.917 Y161.419 E.01588
N16140 G1 X192.083 Y195.585 E1.4392
N16141 G1 X192.083 Y196.118 E.01588
N16142 G1 X157.917 Y161.953 E1.4392
N16143 G1 X157.917 Y162.486 E.01588
N16144 G1 X192.083 Y196.651 E1.4392
N16145 G1 X192.083 Y197.185 E.01588
N16146 G1 X157.917 Y163.019 E1.4392
N16147 G1 X157.917 Y163.553 E.01588
N16148 G1 X192.083 Y197.718 E1.4392
N16149 G1 X192.083 Y198.251 E.01588
N16150 G1 X157.917 Y164.086 E1.4392
N16151 G1 X157.917 Y164.619 E.01588
N16152 G1 X192.083 Y198.784 E1.4392
N16153 G1 X192.083 Y199.318 E.01588
N16154 G1 X157.917 Y165.152 E1.4392
N16155 G1 X157.917 Y165.686 E.01588
N16156 G1 X192.083 Y199.851 E1.4392
N16157 G1 X192.083 Y200.384 E.01588
N16158 G1 X157.917 Y166.219 E1.4392
N16159 G1 X157.917 Y166.752 E.01588
N16160 G1 X192.083 Y200.917 E1.4392
N16161 G1 X192.083 Y201.451 E.01588
N16162 G1 X157.917 Y167.285 E1.4392
N16163 G1 X157.917 Y167.819 E.01588
N16164 G1 X191.736 Y201.637 E1.4246
N16165 G1 X191.203 Y201.637 E.01588
N16166 G1 X157.917 Y168.352 E1.40214
N16167 G1 X157.917 Y168.885 E.01588
N16168 G1 X190.67 Y201.637 E1.37968
N16169 G1 X190.136 Y201.637 E.01588
N16170 G1 X157.917 Y169.418 E1.35721
N16171 G1 X157.917 Y169.952 E.01588
N16172 M73 P99 R0
N16173 G1 X189.603 Y201.637 E1.33475
N16174 G1 X189.07 Y201.637 E.01588
N16175 G1 X157.917 Y170.485 E1.31229
N16176 G1 X157.917 Y171.018 E.01588
N16177 G1 X188.537 Y201.637 E1.28982
N16178 G1 X188.003 Y201.637 E.01588
N16179 G1 X157.917 Y171.551 E1.26736
N16180 G1 X157.917 Y172.085 E.01588
N16181 G1 X187.47 Y201.637 E1.2449
N16182 G1 X186.937 Y201.637 E.01588
N16183 G1 X157.917 Y172.618 E1.22243
N16184 G1 X157.917 Y173.151 E.01588
N16185 G1 X186.404 Y201.637 E1.19997
N16186 G1 X185.87 Y201.637 E.01588
N16187 G1 X157.917 Y173.684 E1.17751
N16188 G1 X157.917 Y174.218 E.01588
N16189 G1 X185.337 Y201.637 E1.15504
N16190 G1 X184.804 Y201.637 E.01588
N16191 G1 X157.917 Y174.751 E1.13258
N16192 G1 X157.917 Y175.284 E.01588
N16193 G1 X184.271 Y201.637 E1.11012
N16194 G1 X183.737 Y201.637 E.01588
N16195 G1 X157.917 Y175.817 E1.08765
N16196 G1 X157.917 Y176.351 E.01588
N16197 G1 X183.204 Y201.637 E1.06519
N16198 G1 X182.671 Y201.637 E.01588
N16199 G1 X157.917 Y176.884 E1.04273
N16200 G1 X157.917 Y177.417 E.01588
N16201 G1 X182.138 Y201.637 E1.02026
N16202 G1 X181.604 Y201.637 E.01588
N16203 G1 X157.917 Y177.95 E.9978
N16204 G1 X157.917 Y178.484 E.01588
N16205 G1 X181.071 Y201.637 E.97534
N16206 G1 X180.538 Y201.637 E.01588
N16207 G1 X157.917 Y179.017 E.95287
N16208 G1 X157.917 Y179.55 E.01588
N16209 G1 X180.005 Y201.637 E.93041
N16210 G1 X179.471 Y201.637 E.01588
N16211 G1 X157.917 Y180.084 E.90795
N16212 G1 X157.917 Y180.617 E.01588
N16213 G1 X178.938 Y201.637 E.88548
N16214 G1 X178.405 Y201.637 E.01588
N16215 G1 X157.917 Y181.15 E.86302
N16216 G1 X157.917 Y181.683 E.01588
N16217 G1 X177.871 Y201.637 E.84056
N16218 G1 X177.338 Y201.637 E.01588
N16219 G1 X157.917 Y182.217 E.81809
N16220 G1 X157.917 Y182.75 E.01588
N16221 G1 X176.805 Y201.637 E.79563
N16222 G1 X176.272 Y201.637 E.01588
N16223 G1 X157.917 Y183.283 E.77317
N16224 G1 X157.917 Y183.816 E.01588
N16225 G1 X175.738 Y201.637 E.75071
N16226 G1 X175.205 Y201.637 E.01588
N16227 G1 X157.917 Y184.35 E.72824
N16228 G1 X157.917 Y184.883 E.01588
N16229 G1 X174.672 Y201.637 E.70578
N16230 G1 X174.139 Y201.637 E.01588
N16231 G1 X157.917 Y185.416 E.68332
N16232 G1 X157.917 Y185.949 E.01588
N16233 G1 X173.605 Y201.637 E.66085
N16234 G1 X173.072 Y201.637 E.01588
N16235 G1 X157.917 Y186.483 E.63839
N16236 G1 X157.917 Y187.016 E.01588
N16237 G1 X172.539 Y201.637 E.61593
N16238 G1 X172.006 Y201.637 E.01588
N16239 G1 X157.917 Y187.549 E.59346
N16240 G1 X157.917 Y188.082 E.01588
N16241 G1 X171.472 Y201.637 E.571
N16242 G1 X170.939 Y201.637 E.01588
N16243 G1 X157.917 Y188.616 E.54854
N16244 G1 X157.917 Y189.149 E.01588
N16245 G1 X170.406 Y201.637 E.52607
N16246 G1 X169.873 Y201.637 E.01588
N16247 G1 X157.917 Y189.682 E.50361
N16248 G1 X157.917 Y190.215 E.01588
N16249 G1 X169.339 Y201.637 E.48115
N16250 G1 X168.806 Y201.637 E.01588
N16251 G1 X157.917 Y190.749 E.45868
N16252 G1 X157.917 Y191.282 E.01588
N16253 G1 X168.273 Y201.637 E.43622
N16254 G1 X167.74 Y201.637 E.01588
N16255 G1 X157.917 Y191.815 E.41376
N16256 G1 X157.917 Y192.348 E.01588
N16257 G1 X167.206 Y201.637 E.39129
N16258 G1 X166.673 Y201.637 E.01588
N16259 G1 X157.917 Y192.882 E.36883
N16260 G1 X157.917 Y193.415 E.01588
N16261 G1 X166.14 Y201.637 E.34637
N16262 G1 X165.607 Y201.637 E.01588
N16263 G1 X157.917 Y193.948 E.3239
N16264 G1 X157.917 Y194.481 E.01588
N16265 G1 X165.073 Y201.637 E.30144
N16266 G1 X164.54 Y201.637 E.01588
N16267 G1 X157.917 Y195.015 E.27898
N16268 G1 X157.917 Y195.548 E.01588
N16269 G1 X164.007 Y201.637 E.25651
N16270 G1 X163.474 Y201.637 E.01588
N16271 G1 X157.917 Y196.081 E.23405
N16272 G1 X157.917 Y196.614 E.01588
N16273 G1 X162.94 Y201.637 E.21159
N16274 G1 X162.407 Y201.637 E.01588
N16275 G1 X157.917 Y197.148 E.18912
N16276 G1 X157.917 Y197.681 E.01588
N16277 G1 X161.874 Y201.637 E.16666
N16278 G1 X161.34 Y201.637 E.01588
N16279 G1 X157.917 Y198.214 E.1442
N16280 G1 X157.917 Y198.748 E.01588
N16281 G1 X160.807 Y201.637 E.12173
N16282 G1 X160.274 Y201.637 E.01588
N16283 G1 X157.917 Y199.281 E.09927
N16284 G1 X157.917 Y199.814 E.01588
N16285 G1 X159.741 Y201.637 E.07681
N16286 G1 X159.207 Y201.637 E.01588
N16287 G1 X157.917 Y200.347 E.05434
N16288 G1 X157.917 Y200.881 E.01588
N16289 G1 X158.674 Y201.637 E.03188
N16290 G1 E-.8 F1800
N16291 M204 S10000
N16292 G1 X166.307 Y201.632 Z13 F60000
N16293 G1 X192.101 Y201.614 Z13
N16294 G1 Z12.6
N16295 G1 E.8 F1800
N16296 ; FEATURE: Gap infill
N16297 ; LINE_WIDTH: 0.127568
N16298 G1 F15000
N16299 M204 S8000
N16300 G1 X191.76 Y201.614 E.00229
N16301 ; WIPE_START
N16302 G1 X192.101 Y201.614 E-.76
N16303 ; WIPE_END
N16304 G1 E-.04 F1800
N16305 M204 S10000
N16306 G17
N16307 G3 Z13 I1.217 J0 P1  F60000
N16308 ; stop printing object, unique label id: 229
N16309 M625
N16310 ; object ids of layer 63 start: 229
N16311 M624 AQAAAAAAAAA=
N16312 ;======== H2D 20250527========
N16313 ; SKIPPABLE_START
N16314 ; SKIPTYPE: timelapse
N16315 M622.1 S1 ; for prev firware, default turned on
N16316 
N16317 M1002 judge_flag timelapse_record_flag
N16318 
N16319 M622 J1
N16320 M993 A2 B2 C2
N16321 M993 A0 B0 C0
N16322 
N16323 
N16324 
N16325 
N16326     M9711 M0 E1 X260 Y141 Z13 S11 C10 O0 T3000
N16327 
N16328 
N16329 
N16330 M993 A3 B3 C3
N16331 
N16332 M623
N16333 ; SKIPPABLE_END
N16334 
N16335 ; object ids of this layer63 end: 229
N16336 M625
N16337 ; close powerlost recovery
N16338 M1003 S0
N16339 M106 S0
N16340 M106 P2 S0
N16341 M981 S0 P20000 ; close spaghetti detector
N16342 ; FEATURE: Custom
N16343 ; MACHINE_END_GCODE_START
N16344 ; filament end gcode 
N16345 ;===== date: 2025/05/16 =====================
N16346 ;===== H2D =====================
N16347 G392 S0 ;turn off nozzle clog detect
N16348 M993 A0 B0 C0 ; nozzle cam detection not allowed.
N16349 
N16350 M400 ; wait for buffer to clear
N16351 G92 E0 ; zero the extruder
N16352 G1 E-0.8 F1800 ; retract
N16353 G1 Z13.1 F900 ; lower z a little
N16354 
N16355 G90
N16356 M141 S0 ; turn off chamber heating
N16357 M140 S0 ; turn off bed
N16358 M106 S0 ; turn off fan
N16359 M106 P2 S0 ; turn off remote part cooling fan
N16360 M106 P3 S0 ; turn off chamber cooling fan
N16361 
N16362 ; pull back filament to AMS
N16363 M620 S65535
N16364 T65535
N16365 G150.2
N16366 M621 S65535
N16367 
N16368 M620 S65279
N16369 T65279
N16370 G150.2
N16371 M621 S65279
N16372 
N16373 G150.3
N16374 
N16375 M1002 judge_flag timelapse_record_flag
N16376 M622 J1
N16377     M400 ; wait all motion done
N16378     M991 S0 P-1 ;end smooth timelapse at safe pos
N16379     M400 S5 ;wait for last picture to be taken
N16380 M623  ;end of "timelapse_record_flag"
N16381 
N16382 M104 S0 T0; turn off hotend
N16383 M104 S0 T1; turn off hotend
N16384 
N16385 M400 ; wait all motion done
N16386 M17 S
N16387 M17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom
N16388 
N16389     G1 Z112.6 F600
N16390     G1 Z110.6
N16391 
N16392 M400 P100
N16393 M17 R ; restore z current
N16394 
N16395 M220 S100  ; Reset feedrate magnitude
N16396 M201.2 K1.0 ; Reset acc magnitude
N16397 M73.2   R1.0 ;Reset left time magnitude
N16398 M1002 set_gcode_claim_speed_level : 0
N16399 
N16400 M1015.4 S0 K0 ;disable air printing detect
N16401 ;=====printer finish  sound=========
N16402 M17
N16403 M400 S1
N16404 M1006 S1
N16405 M1006 A53 B10 L99 C53 D10 M99 E53 F10 N99 
N16406 M1006 A57 B10 L99 C57 D10 M99 E57 F10 N99 
N16407 M1006 A0 B15 L0 C0 D15 M0 E0 F15 N0 
N16408 M1006 A53 B10 L99 C53 D10 M99 E53 F10 N99 
N16409 M1006 A57 B10 L99 C57 D10 M99 E57 F10 N99 
N16410 M1006 A0 B15 L0 C0 D15 M0 E0 F15 N0 
N16411 M1006 A48 B10 L99 C48 D10 M99 E48 F10 N99 
N16412 M1006 A0 B15 L0 C0 D15 M0 E0 F15 N0 
N16413 M1006 A60 B10 L99 C60 D10 M99 E60 F10 N99 
N16414 M1006 W
N16415 ;=====printer finish  sound=========
N16416 M400
N16417 M18
N16418 
N16419 M73 P100 R0
N16420 ; EXECUTABLE_BLOCK_END
N16421 
