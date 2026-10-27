N1 ; HEADER_BLOCK_START
N2 ; BambuStudio 02.01.00.59
N3 ; model printing time: 39m 5s; total estimated time: 48m 53s
N4 ; total layer number: 63
N5 ; total filament length [mm] : 4395.38,119.74
N6 ; total filament volume [cm^3] : 10572.13,288.00
N7 ; total filament weight [g] : 13.64,0.36
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
N65 ; different_settings_to_system = enable_arc_fitting;gcode_add_line_number;skirt_loops;sparse_infill_pattern;;;
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
N265 ; post_process = 
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
N288 ; print_settings_id = 0.20mm Standard @BBL H2D
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
N302 ; process_notes = 
N303 ; raft_contact_distance = 0.1
N304 ; raft_expansion = 1.5
N305 ; raft_first_layer_density = 90%
N306 ; raft_first_layer_expansion = 2
N307 ; raft_layers = 0
N308 ; reduce_crossing_wall = 0
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
N433 ; wall_loops = 2
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
N453 M73 P0 R48
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
N695 M73 P1 R48
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
N728 M73 P2 R47
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
N779 M73 P10 R43
N780     G1 Z5 F1200
N781 M73 P11 R43
N782     G1 X187 Y160 F20000
N783     T1000
N784     M400 P200
N785 
N786     M970.3 Q1 A5 K0 O1
N787     M974 Q1 S2 P0
N788 
N789     M970.3 Q0 A5 K0 O1
N790     M974 Q0 S2 P0
N791 
N792     M970.2 Q2 K0 W38 Z0.01
N793     M974 Q2 S2 P0
N794     M500
N795 
N796     M975 S1
N797 ;===== mech mode sweep end =====
N798 
N799 M400
N800 ;M73 P99
N801 
N802 G150.3 ; move to garbage can to wait for temp
N803 M1026
N804 
N805 ;===== xy ofst cali start =====
N806 
N807 M1002 judge_flag auto_cali_toolhead_offset_flag
N808 
N809 M622 J0
N810     M1012.5 N1 R1
N811 M623
N812 
N813 M622 J1
N814     M1002 gcode_claim_action : 39
N815     M141 S0
N816     M620.17 T0 S240 L1
N817     M620.17 T1 S255 L0
N818     G383 O1 T255 L0
N819     M500
N820     M141 S0
N821 M623
N822 
N823 M622 J2
N824     M1002 gcode_claim_action : 39
N825     M141 S0
N826     M620.17 T0 S240 L1
N827     M620.17 T1 S255 L0
N828     G383.3 T255 L0
N829     M500
N830     M141 S0
N831 M623
N832 ;===== xy ofst cali end =====
N833 
N834 M400
N835 ;M73 P99
N836 
N837 M1002 gcode_claim_action : 0
N838 M400
N839 
N840 ;============switch again==================
N841 
N842 M211 X0 Y0 Z0 ;turn off soft endstop
N843 G91
N844 G1 Z6 F1200
N845 G90
N846 M1002 set_filament_type:PCTG
N847 M620 S0A
N848 M400
N849 T0
N850 M400
N851 M628 S0
N852 M629
N853 M400
N854 M621 S0A
N855 
N856 ;============switch again==================
N857 
N858 M400
N859 ;M73 P99
N860 
N861 ;===== wait temperature reaching the reference value =======
N862 
N863 M104 S255 ; rise to print tmpr
N864 
N865 M140 S70 
N866 M190 S70 
N867 
N868     ;========turn off light and fans =============
N869     M960 S1 P0 ; turn off laser
N870     M960 S2 P0 ; turn off laser
N871     M106 S0 ; turn off fan
N872     M106 P2 S0 ; turn off big fan
N873 
N874     ;============set motor current==================
N875     M400 S1
N876 
N877 ;===== wait temperature reaching the reference value =======
N878 
N879 M400
N880 ;M73 P99
N881 
N882 ;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==
N883     
N884         G29.1 Z-0.02 ; for Textured PEI Plate
N885     
N886     
N887 G150.1
N888 
N889 M975 S1 ; turn on mech mode supression
N890 M983.4 S1 ; turn on deformation compensation 
N891 G29.2 S1 ; turn on pos comp
N892 G29.7 S1
N893 
N894 G90
N895 M73 P19 R39
N896 G1 Z5 F1200
N897 G1 Y295 F30000
N898 G1 Y265 F18000
N899 
N900 ;===== nozzle load line ===============================
N901 G29.2 S1 ; ensure z comp turn on
N902 G90
N903 M83
N904 M109 S255
N905 
N906     ;G130 O0 F1.24725 L80 E5 D12 A154.814 B115.26 I45.8708 J169.064
N907     G130 O0 X250 Y-0.5 Z0.8 F1.24725 L40 E20 D5
N908 
N909 G90
N910 M83
N911 G1 Z0.2
N912 
N913 ;===== noozle load line end ===========================
N914 
N915 M400
N916 ;M73 P99
N917 
N918 M993 A1 B1 C1 ; nozzle cam detection allowed.
N919 
N920 
N921 M1015.3 S0;disable tpu clog detect
N922 
N923 
N924 
N925 M1015.4 S0 K0 H0.4 ;disable E air printing detect
N926 
N927 
N928 M620.6 I0 W1 ;enable ams air printing detect
N929 
N930 M211 Z1
N931 G29.99
N932 
N933 
N934 ; MACHINE_START_GCODE_END
N935 M104 T0 S0 N0 ;Multi extruder pre cooling
N936 ; filament start gcode
N937 ;VT0
N938 G90
N939 G21
N940 M83 ; use relative distances for extrusion
N941 M981 S1 P20000 ;open spaghetti detector
N942 M204 S10000
N943 M73 P20 R39
N944 G1 Z.2 F60000
N945 ; CHANGE_LAYER
N946 ; Z_HEIGHT: 0.2
N947 ; LAYER_HEIGHT: 0.2
N948 ;======== H2D 20250521========
N949 ; layer num/total_layer_count: 1/63
N950 ; update layer progress
N951 M73 L1
N952 M991 S0 P0 ;notify layer change
N953 
N954 
N955 M106 S0
N956 M106 P2 S0
N957 G1 E-.8 F1800
N958 G1 X155.435 Y124.289 F60000
N959 M204 S6000
N960 G1 Z.6
N961 G1 Z.2
N962 G1 E.8 F1800
N963 ; FEATURE: Skirt
N964 ; LINE_WIDTH: 0.5
N965 ; LAYER_HEIGHT: 0.2
N966 G1 F3000
N967 M204 S500
N968 G1 X156.009 Y123.667 E.03054
N969 G1 X166.058 Y115.993 E.45656
N970 G1 X167.55 Y115.488 E.05684
N971 G1 X182.55 Y115.488 E.54159
N972 G1 X184.05 Y116 E.05724
N973 G1 X194.001 Y123.675 E.45373
N974 G1 X194.815 Y124.798 E.0501
N975 G1 X194.955 Y125.512 E.02626
N976 G1 X200.454 Y249.881 E4.49487
N977 G1 X200.457 Y281.638 E1.14663
N978 G1 X200.065 Y282.97 E.0501
N979 G1 X199.014 Y283.876 E.0501
N980 G1 X198 Y284.095 E.03748
N981 G1 X164.991 Y284.095 E1.19182
N982 G1 X163.659 Y283.704 E.0501
N983 G1 X162.753 Y282.653 E.0501
N984 G1 X162.544 Y281.869 E.0293
N985 G1 X155.054 Y202.285 E2.88615
N986 G1 X155.043 Y125.62 E2.76806
N987 G1 X155.418 Y124.347 E.04794
N988 ; OBJECT_ID: 229
N989 ; WIPE_START
N990 G1 X156.009 Y123.667 E-.34205
N991 M73 P20 R38
N992 G1 X156.883 Y123 E-.41795
N993 ; WIPE_END
N994 G1 E-.04 F1800
N995 ; start printing object, unique label id: 229
N996 M624 AQAAAAAAAAA=
N997 M204 S6000
N998 G1 X159.983 Y129.974 Z.6 F60000
N999 G1 X191.643 Y201.198 Z.6
N1000 G1 Z.2
N1001 G1 E.8 F1800
N1002 ; FEATURE: Inner wall
N1003 G1 F3000
N1004 M204 S500
N1005 G1 X158.357 Y201.198 E1.20182
N1006 G1 X158.357 Y126.477 E2.69786
N1007 G1 X191.643 Y126.477 E1.20182
N1008 G1 X191.643 Y201.138 E2.69569
N1009 M204 S6000
N1010 G1 X192.1 Y201.655 F60000
N1011 ; FEATURE: Outer wall
N1012 G1 F3000
N1013 M204 S500
N1014 G1 X157.9 Y201.655 E1.23483
N1015 G1 X157.9 Y126.02 E2.73086
N1016 G1 X192.1 Y126.02 E1.23483
N1017 G1 X192.1 Y201.595 E2.7287
N1018 ; WIPE_START
N1019 G1 X190.1 Y201.598 E-.76
N1020 ; WIPE_END
N1021 G1 E-.04 F1800
N1022 M204 S6000
N1023 G1 X190.144 Y193.966 Z.6 F60000
N1024 G1 X190.536 Y126.66 Z.6
N1025 G1 Z.2
N1026 G1 E.8 F1800
N1027 ; FEATURE: Bottom surface
N1028 ; LINE_WIDTH: 0.50026
N1029 G1 F3935.803
N1030 M204 S500
N1031 G1 X191.254 Y127.379 E.03673
N1032 G1 X191.254 Y128.026 E.02337
N1033 G1 X190.094 Y126.866 E.05926
N1034 G1 X189.448 Y126.866 E.02337
N1035 G1 X191.254 Y128.673 E.09231
N1036 G1 X191.254 Y129.319 E.02337
N1037 G1 X188.801 Y126.866 E.12535
N1038 G1 X188.154 Y126.866 E.02337
N1039 G1 X191.254 Y129.966 E.15839
N1040 G1 X191.254 Y130.613 E.02337
N1041 G1 X187.507 Y126.866 E.19144
N1042 G1 X186.861 Y126.866 E.02337
N1043 G1 X191.254 Y131.26 E.22448
N1044 G1 X191.254 Y131.906 E.02337
N1045 G1 X186.214 Y126.866 E.25753
N1046 G1 X185.567 Y126.866 E.02337
N1047 G1 X191.254 Y132.553 E.29057
N1048 G1 X191.254 Y133.2 E.02337
N1049 G1 X184.92 Y126.866 E.32362
N1050 G1 X184.274 Y126.866 E.02337
N1051 G1 X191.254 Y133.847 E.35666
N1052 G1 X191.254 Y134.493 E.02337
N1053 G1 X183.627 Y126.866 E.3897
N1054 G1 X182.98 Y126.866 E.02337
N1055 G1 X191.254 Y135.14 E.42275
N1056 G1 X191.254 Y135.787 E.02337
N1057 G1 X182.333 Y126.866 E.45579
N1058 G1 X181.686 Y126.866 E.02337
N1059 G1 X191.254 Y136.434 E.48884
N1060 G1 X191.254 Y137.081 E.02337
N1061 G1 X181.04 Y126.866 E.52188
N1062 G1 X180.393 Y126.866 E.02337
N1063 G1 X191.254 Y137.727 E.55493
N1064 G1 X191.254 Y138.374 E.02337
N1065 G1 X179.746 Y126.866 E.58797
N1066 G1 X179.099 Y126.866 E.02337
N1067 G1 X191.254 Y139.021 E.62101
N1068 G1 X191.254 Y139.668 E.02337
N1069 G1 X178.453 Y126.866 E.65406
N1070 G1 X177.806 Y126.866 E.02337
N1071 G1 X191.254 Y140.314 E.6871
N1072 G1 X191.254 Y140.961 E.02337
N1073 G1 X177.159 Y126.866 E.72015
N1074 G1 X176.512 Y126.866 E.02337
N1075 G1 X191.254 Y141.608 E.75319
N1076 G1 X191.254 Y142.255 E.02337
N1077 G1 X175.865 Y126.866 E.78624
N1078 G1 X175.219 Y126.866 E.02337
N1079 G1 X191.254 Y142.902 E.81928
N1080 G1 X191.254 Y143.548 E.02337
N1081 G1 X174.572 Y126.866 E.85232
N1082 G1 X173.925 Y126.866 E.02337
N1083 G1 X191.254 Y144.195 E.88537
N1084 G1 X191.254 Y144.842 E.02337
N1085 G1 X173.278 Y126.866 E.91841
N1086 G1 X172.632 Y126.866 E.02337
N1087 G1 X191.254 Y145.489 E.95146
N1088 G1 X191.254 Y146.135 E.02337
N1089 G1 X171.985 Y126.866 E.9845
N1090 G1 X171.338 Y126.866 E.02337
N1091 M73 P21 R38
N1092 G1 X191.254 Y146.782 E1.01755
N1093 G1 X191.254 Y147.429 E.02337
N1094 G1 X170.691 Y126.866 E1.05059
N1095 G1 X170.044 Y126.866 E.02337
N1096 G1 X191.254 Y148.076 E1.08363
N1097 G1 X191.254 Y148.723 E.02337
N1098 G1 X169.398 Y126.866 E1.11668
N1099 G1 X168.751 Y126.866 E.02337
N1100 G1 X191.254 Y149.369 E1.14972
N1101 G1 X191.254 Y150.016 E.02337
N1102 G1 X168.104 Y126.866 E1.18277
N1103 G1 X167.457 Y126.866 E.02337
N1104 G1 X191.254 Y150.663 E1.21581
N1105 G1 X191.254 Y151.31 E.02337
N1106 G1 X166.811 Y126.866 E1.24886
N1107 G1 X166.164 Y126.866 E.02337
N1108 G1 X191.254 Y151.956 E1.2819
N1109 G1 X191.254 Y152.603 E.02337
N1110 G1 X165.517 Y126.866 E1.31494
N1111 G1 X164.87 Y126.866 E.02337
N1112 G1 X191.254 Y153.25 E1.34799
N1113 G1 X191.254 Y153.897 E.02337
N1114 G1 X164.223 Y126.866 E1.38103
N1115 G1 X163.577 Y126.866 E.02337
N1116 G1 X191.254 Y154.544 E1.41408
N1117 G1 X191.254 Y155.19 E.02337
N1118 G1 X162.93 Y126.866 E1.44712
N1119 G1 X162.283 Y126.866 E.02337
N1120 G1 X191.254 Y155.837 E1.48017
N1121 G1 X191.254 Y156.484 E.02337
N1122 G1 X161.636 Y126.866 E1.51321
N1123 G1 X160.99 Y126.866 E.02337
N1124 G1 X191.254 Y157.131 E1.54625
N1125 G1 X191.254 Y157.777 E.02337
N1126 G1 X160.343 Y126.866 E1.5793
N1127 G1 X159.696 Y126.866 E.02337
N1128 G1 X191.254 Y158.424 E1.61234
N1129 G1 X191.254 Y159.071 E.02337
N1130 G1 X159.049 Y126.866 E1.64539
N1131 G1 X158.746 Y126.866 E.01097
N1132 G1 X158.746 Y127.209 E.0124
N1133 G1 X191.254 Y159.718 E1.6609
N1134 G1 X191.254 Y160.365 E.02337
N1135 G1 X158.746 Y127.856 E1.6609
N1136 G1 X158.746 Y128.502 E.02337
N1137 G1 X191.254 Y161.011 E1.6609
N1138 G1 X191.254 Y161.658 E.02337
N1139 G1 X158.746 Y129.149 E1.6609
N1140 G1 X158.746 Y129.796 E.02337
N1141 G1 X191.254 Y162.305 E1.6609
N1142 G1 X191.254 Y162.952 E.02337
N1143 G1 X158.746 Y130.443 E1.6609
N1144 G1 X158.746 Y131.09 E.02337
N1145 G1 X191.254 Y163.598 E1.6609
N1146 G1 X191.254 Y164.245 E.02337
N1147 G1 X158.746 Y131.736 E1.6609
N1148 G1 X158.746 Y132.383 E.02337
N1149 G1 X191.254 Y164.892 E1.6609
N1150 G1 X191.254 Y165.539 E.02337
N1151 G1 X158.746 Y133.03 E1.6609
N1152 G1 X158.746 Y133.677 E.02337
N1153 G1 X191.254 Y166.186 E1.6609
N1154 G1 X191.254 Y166.832 E.02337
N1155 G1 X158.746 Y134.323 E1.6609
N1156 G1 X158.746 Y134.97 E.02337
N1157 G1 X191.254 Y167.479 E1.6609
N1158 G1 X191.254 Y168.126 E.02337
N1159 G1 X158.746 Y135.617 E1.6609
N1160 G1 X158.746 Y136.264 E.02337
N1161 G1 X191.254 Y168.773 E1.6609
N1162 G1 X191.254 Y169.419 E.02337
N1163 G1 X158.746 Y136.911 E1.6609
N1164 G1 X158.746 Y137.557 E.02337
N1165 G1 X191.254 Y170.066 E1.6609
N1166 G1 X191.254 Y170.713 E.02337
N1167 G1 X158.746 Y138.204 E1.6609
N1168 G1 X158.746 Y138.851 E.02337
N1169 G1 X191.254 Y171.36 E1.6609
N1170 G1 X191.254 Y172.007 E.02337
N1171 M73 P22 R38
N1172 G1 X158.746 Y139.498 E1.6609
N1173 G1 X158.746 Y140.144 E.02337
N1174 G1 X191.254 Y172.653 E1.6609
N1175 G1 X191.254 Y173.3 E.02337
N1176 G1 X158.746 Y140.791 E1.6609
N1177 G1 X158.746 Y141.438 E.02337
N1178 G1 X191.254 Y173.947 E1.6609
N1179 G1 X191.254 Y174.594 E.02337
N1180 G1 X158.746 Y142.085 E1.6609
N1181 G1 X158.746 Y142.732 E.02337
N1182 G1 X191.254 Y175.24 E1.6609
N1183 G1 X191.254 Y175.887 E.02337
N1184 G1 X158.746 Y143.378 E1.6609
N1185 G1 X158.746 Y144.025 E.02337
N1186 G1 X191.254 Y176.534 E1.6609
N1187 G1 X191.254 Y177.181 E.02337
N1188 G1 X158.746 Y144.672 E1.6609
N1189 G1 X158.746 Y145.319 E.02337
N1190 G1 X191.254 Y177.828 E1.6609
N1191 G1 X191.254 Y178.474 E.02337
N1192 G1 X158.746 Y145.965 E1.6609
N1193 G1 X158.746 Y146.612 E.02337
N1194 M73 P22 R37
N1195 G1 X191.254 Y179.121 E1.6609
N1196 G1 X191.254 Y179.768 E.02337
N1197 G1 X158.746 Y147.259 E1.6609
N1198 G1 X158.746 Y147.906 E.02337
N1199 G1 X191.254 Y180.415 E1.6609
N1200 G1 X191.254 Y181.061 E.02337
N1201 G1 X158.746 Y148.553 E1.6609
N1202 G1 X158.746 Y149.199 E.02337
N1203 G1 X191.254 Y181.708 E1.6609
N1204 G1 X191.254 Y182.355 E.02337
N1205 G1 X158.746 Y149.846 E1.6609
N1206 G1 X158.746 Y150.493 E.02337
N1207 G1 X191.254 Y183.002 E1.6609
N1208 G1 X191.254 Y183.649 E.02337
N1209 G1 X158.746 Y151.14 E1.6609
N1210 G1 X158.746 Y151.786 E.02337
N1211 M104 T0 S240 N0 ;Multi extruder pre heating
N1212 G1 X191.254 Y184.295 E1.6609
N1213 G1 X191.254 Y184.942 E.02337
N1214 G1 X158.746 Y152.433 E1.6609
N1215 G1 X158.746 Y153.08 E.02337
N1216 G1 X191.254 Y185.589 E1.6609
N1217 G1 X191.254 Y186.236 E.02337
N1218 G1 X158.746 Y153.727 E1.6609
N1219 G1 X158.746 Y154.374 E.02337
N1220 G1 X191.254 Y186.882 E1.6609
N1221 G1 X191.254 Y187.529 E.02337
N1222 G1 X158.746 Y155.02 E1.6609
N1223 G1 X158.746 Y155.667 E.02337
N1224 G1 X191.254 Y188.176 E1.6609
N1225 G1 X191.254 Y188.823 E.02337
N1226 G1 X158.746 Y156.314 E1.6609
N1227 G1 X158.746 Y156.961 E.02337
N1228 G1 X191.254 Y189.469 E1.6609
N1229 G1 X191.254 Y190.116 E.02337
N1230 G1 X158.746 Y157.607 E1.6609
N1231 G1 X158.746 Y158.254 E.02337
N1232 G1 X191.254 Y190.763 E1.6609
N1233 G1 X191.254 Y191.41 E.02337
N1234 G1 X158.746 Y158.901 E1.6609
N1235 G1 X158.746 Y159.548 E.02337
N1236 G1 X191.254 Y192.057 E1.6609
N1237 G1 X191.254 Y192.703 E.02337
N1238 G1 X158.746 Y160.195 E1.6609
N1239 G1 X158.746 Y160.841 E.02337
N1240 G1 X191.254 Y193.35 E1.6609
N1241 G1 X191.254 Y193.997 E.02337
N1242 G1 X158.746 Y161.488 E1.6609
N1243 G1 X158.746 Y162.135 E.02337
N1244 M73 P23 R37
N1245 G1 X191.254 Y194.644 E1.6609
N1246 G1 X191.254 Y195.29 E.02337
N1247 G1 X158.746 Y162.782 E1.6609
N1248 G1 X158.746 Y163.428 E.02337
N1249 G1 X191.254 Y195.937 E1.6609
N1250 G1 X191.254 Y196.584 E.02337
N1251 G1 X158.746 Y164.075 E1.6609
N1252 G1 X158.746 Y164.722 E.02337
N1253 G1 X191.254 Y197.231 E1.6609
N1254 G1 X191.254 Y197.878 E.02337
N1255 G1 X158.746 Y165.369 E1.6609
N1256 G1 X158.746 Y166.016 E.02337
N1257 G1 X191.254 Y198.524 E1.6609
N1258 G1 X191.254 Y199.171 E.02337
N1259 G1 X158.746 Y166.662 E1.6609
N1260 G1 X158.746 Y167.309 E.02337
N1261 G1 X191.254 Y199.818 E1.6609
N1262 G1 X191.254 Y200.465 E.02337
N1263 G1 X158.746 Y167.956 E1.6609
N1264 G1 X158.746 Y168.603 E.02337
N1265 G1 X190.952 Y200.809 E1.64546
N1266 G1 X190.305 Y200.809 E.02337
N1267 G1 X158.746 Y169.249 E1.61241
N1268 G1 X158.746 Y169.896 E.02337
N1269 G1 X189.659 Y200.809 E1.57937
N1270 G1 X189.012 Y200.809 E.02337
N1271 G1 X158.746 Y170.543 E1.54632
N1272 G1 X158.746 Y171.19 E.02337
N1273 G1 X188.365 Y200.809 E1.51328
N1274 G1 X187.718 Y200.809 E.02337
N1275 G1 X158.746 Y171.836 E1.48023
N1276 G1 X158.746 Y172.483 E.02337
N1277 G1 X187.071 Y200.809 E1.44719
N1278 G1 X186.425 Y200.809 E.02337
N1279 G1 X158.746 Y173.13 E1.41415
N1280 G1 X158.746 Y173.777 E.02337
N1281 G1 X185.778 Y200.809 E1.3811
N1282 G1 X185.131 Y200.809 E.02337
N1283 G1 X158.746 Y174.424 E1.34806
N1284 G1 X158.746 Y175.07 E.02337
N1285 G1 X184.484 Y200.809 E1.31501
N1286 G1 X183.838 Y200.809 E.02337
N1287 G1 X158.746 Y175.717 E1.28197
N1288 G1 X158.746 Y176.364 E.02337
N1289 G1 X183.191 Y200.809 E1.24892
N1290 G1 X182.544 Y200.809 E.02337
N1291 G1 X158.746 Y177.011 E1.21588
N1292 G1 X158.746 Y177.657 E.02337
N1293 G1 X181.897 Y200.809 E1.18284
N1294 G1 X181.25 Y200.809 E.02337
N1295 G1 X158.746 Y178.304 E1.14979
N1296 G1 X158.746 Y178.951 E.02337
N1297 G1 X180.604 Y200.809 E1.11675
N1298 G1 X179.957 Y200.809 E.02337
N1299 G1 X158.746 Y179.598 E1.0837
N1300 G1 X158.746 Y180.245 E.02337
N1301 G1 X179.31 Y200.809 E1.05066
N1302 G1 X178.663 Y200.809 E.02337
N1303 G1 X158.746 Y180.891 E1.01761
N1304 G1 X158.746 Y181.538 E.02337
N1305 G1 X178.017 Y200.809 E.98457
N1306 G1 X177.37 Y200.809 E.02337
N1307 G1 X158.746 Y182.185 E.95153
N1308 G1 X158.746 Y182.832 E.02337
N1309 G1 X176.723 Y200.809 E.91848
N1310 G1 X176.076 Y200.809 E.02337
N1311 G1 X158.746 Y183.478 E.88544
N1312 G1 X158.746 Y184.125 E.02337
N1313 G1 X175.43 Y200.809 E.85239
N1314 G1 X174.783 Y200.809 E.02337
N1315 G1 X158.746 Y184.772 E.81935
N1316 G1 X158.746 Y185.419 E.02337
N1317 G1 X174.136 Y200.809 E.7863
N1318 G1 X173.489 Y200.809 E.02337
N1319 G1 X158.746 Y186.066 E.75326
N1320 G1 X158.746 Y186.712 E.02337
N1321 G1 X172.842 Y200.809 E.72022
N1322 G1 X172.196 Y200.809 E.02337
N1323 G1 X158.746 Y187.359 E.68717
N1324 G1 X158.746 Y188.006 E.02337
N1325 G1 X171.549 Y200.809 E.65413
N1326 G1 X170.902 Y200.809 E.02337
N1327 G1 X158.746 Y188.653 E.62108
N1328 G1 X158.746 Y189.299 E.02337
N1329 G1 X170.255 Y200.809 E.58804
N1330 G1 X169.609 Y200.809 E.02337
N1331 G1 X158.746 Y189.946 E.555
N1332 G1 X158.746 Y190.593 E.02337
N1333 G1 X168.962 Y200.809 E.52195
N1334 G1 X168.315 Y200.809 E.02337
N1335 M73 P24 R37
N1336 G1 X158.746 Y191.24 E.48891
N1337 G1 X158.746 Y191.887 E.02337
N1338 G1 X167.668 Y200.809 E.45586
N1339 G1 X167.021 Y200.809 E.02337
N1340 G1 X158.746 Y192.533 E.42282
N1341 G1 X158.746 Y193.18 E.02337
N1342 G1 X166.375 Y200.809 E.38977
N1343 G1 X165.728 Y200.809 E.02337
N1344 G1 X158.746 Y193.827 E.35673
N1345 G1 X158.746 Y194.474 E.02337
N1346 G1 X165.081 Y200.809 E.32369
N1347 G1 X164.434 Y200.809 E.02337
N1348 G1 X158.746 Y195.12 E.29064
N1349 G1 X158.746 Y195.767 E.02337
N1350 G1 X163.788 Y200.809 E.2576
N1351 G1 X163.141 Y200.809 E.02337
N1352 G1 X158.746 Y196.414 E.22455
N1353 G1 X158.746 Y197.061 E.02337
N1354 G1 X162.494 Y200.809 E.19151
N1355 G1 X161.847 Y200.809 E.02337
N1356 G1 X158.746 Y197.708 E.15846
N1357 G1 X158.746 Y198.354 E.02337
N1358 G1 X161.2 Y200.809 E.12542
N1359 G1 X160.554 Y200.809 E.02337
N1360 G1 X158.746 Y199.001 E.09238
N1361 G1 X158.746 Y199.648 E.02337
N1362 G1 X159.907 Y200.809 E.05933
N1363 G1 X159.26 Y200.809 E.02337
N1364 G1 X158.54 Y200.089 E.0368
N1365 ; WIPE_START
N1366 G1 X159.26 Y200.809 E-.38704
N1367 G1 X159.907 Y200.809 E-.24578
N1368 G1 X159.67 Y200.572 E-.12719
N1369 ; WIPE_END
N1370 G1 E-.04 F1800
N1371 M204 S6000
N1372 G17
N1373 G3 Z.6 I1.217 J0 P1  F60000
N1374 ; stop printing object, unique label id: 229
N1375 M625
N1376 ; object ids of layer 1 start: 229,239
N1377 M624 AwAAAAAAAAA=
N1378 ;======== H2D 20250527========
N1379 ; SKIPPABLE_START
N1380 ; SKIPTYPE: timelapse
N1381 M622.1 S1 ; for prev firware, default turned on
N1382 
N1383 M1002 judge_flag timelapse_record_flag
N1384 
N1385 M622 J1
N1386 M993 A2 B2 C2
N1387 M993 A0 B0 C0
N1388 
N1389 
N1390 
N1391 
N1392     M9711 M0 E1 X260 Y141 Z0.6 S11 C10 O0 T3000
N1393 
N1394 
N1395 
N1396 M993 A3 B3 C3
N1397 
N1398 M623
N1399 ; SKIPPABLE_END
N1400 
N1401 ; object ids of this layer1 end: 229,239
N1402 M625
N1403 G1 X195.495 Y279.064
N1404 G1 Z.2
N1405 G1 E.8 F1800
N1406 ; LAYER_HEIGHT: 0.200000
N1407 ; FEATURE: Prime tower
N1408 ; LINE_WIDTH: 0.500000
N1409 ; WIPE_TOWER_START
N1410 M204 S6000
N1411 G1  X195.995 Y279.564  
N1412 M204 S500
N1413 G3  X193.533 Y281.605   I-4.373 J-2.768 E0.1236 F3000
N1414 G3  X190.885 Y280.355   I0.012 J-3.454 E0.1149
N1415 G2  X188.182 Y279.564   I-2.709 J4.247 E0.1085
N1416 G2  X174.618 Y279.568   I-6.687 J357.435 E0.5155
N1417 G2  X170.683 Y281.445   I0.499 J6.110 E0.1694
N1418 G3  X168.371 Y281.015   I-0.854 J-1.838 E0.0953
N1419 G1  X166.995 Y279.564   E0.0760
N1420 G3  X165.064 Y277.242   I3.871 J-5.183 E0.1159
N1421 G3  X166.240 Y274.649   I2.902 J-0.247 E0.1130
N1422 G2  X166.995 Y272.245   I-3.465 J-2.409 E0.0972
N1423 G2  X166.992 Y259.212   I-321.195 J-6.431 E0.4954
N1424 G2  X165.146 Y255.634   I-6.663 J1.171 E0.1554
N1425 G3  X165.661 Y253.471   I1.721 J-0.733 E0.0905
N1426 G1 E-0.8000 F1800
N1427 M204 S6000
N1428 G1  X167.381 Y251.657   F600
N1429 G1 E0.8000 F1800
N1430 M204 S500
N1431 G3  X170.238 Y250.033   I2.765 J1.539 E0.1313 F3000
N1432 G3  X172.775 Y251.633   I-12.405 J22.473 E0.1141
N1433 G2  X174.808 Y252.064   I2.042 J-4.626 E0.0796
N1434 G2  X188.372 Y252.060   I6.687 J-357.435 E0.5155
N1435 G2  X192.307 Y250.183   I-0.499 J-6.110 E0.1694
N1436 G3  X194.619 Y250.613   I0.854 J1.838 E0.0953
N1437 G1  X195.995 Y252.064   E0.0760
N1438 G1 E0.0000
N1439 G3  X197.926 Y254.386   I-3.871 J5.182 E0.1159
N1440 G3  X196.750 Y256.979   I-2.902 J0.247 E0.1130
N1441 G2  X195.995 Y259.382   I3.464 J2.409 E0.0972
N1442 G2  X195.998 Y272.416   I321.212 J6.432 E0.4954
N1443 G2  X197.844 Y275.994   I6.663 J-1.171 E0.1554
N1444 G3  X197.504 Y277.972   I-1.658 J0.734 E0.0808
N1445 G1  X195.995 Y279.564   E0.0834
N1446 ; WIPE_TOWER_END
N1447 G1  X195.495 Y252.064  
N1448 ; LAYER_HEIGHT: 0.200000
N1449 ; FEATURE: Prime tower
N1450 ; LINE_WIDTH: 0.500000
N1451 ; WIPE_TOWER_START
N1452 M204 S500
N1453 G1  X167.495  E1.0642
N1454 G1  Y272.314  E0.2565
N1455 G1  X195.495  E1.0642
N1456 G1  Y279.064  E0.2565
N1457 M204 S6000
N1458 G1  X168.495 Y272.314  
N1459 ;--------------------
N1460 ; CP EMPTY GRID START
N1461 ; layer #2
N1462 M204 S500
N1463 G1  Y272.814  E0.0190
N1464 M73 P24 R36
N1465 G1  X194.995  E1.0072
N1466 G1  Y273.337  E0.0199
N1467 G1  X167.995  E1.0262
N1468 G1  Y273.859  E0.0199
N1469 G1  X194.995  E1.0262
N1470 G1  Y274.382  E0.0199
N1471 G1  X167.995  E1.0262
N1472 G1  Y274.905  E0.0199
N1473 G1  X194.995  E1.0262
N1474 G1  Y275.428  E0.0199
N1475 G1  X167.995  E1.0262
N1476 G1  Y275.950  E0.0199
N1477 G1  X194.995  E1.0262
N1478 G1  Y276.473  E0.0199
N1479 G1  X167.995  E1.0262
N1480 G1  Y276.996  E0.0199
N1481 G1  X194.995  E1.0262
N1482 G1  Y277.519  E0.0199
N1483 G1  X167.995  E1.0262
N1484 G1  Y278.041  E0.0199
N1485 G1  X194.995  E1.0262
N1486 G1  Y278.564  E0.0199
N1487 G1  X167.995  E1.0262
N1488 G1  Y279.064  E0.0190
N1489 ; CP EMPTY GRID END
N1490 ;------------------
N1491 
N1492 
N1493 
N1494 
N1495 
N1496 
N1497 ; WIPE_TOWER_END
N1498 ; LAYER_HEIGHT: 0.200000
N1499 ; FEATURE: Prime tower
N1500 ; LINE_WIDTH: 0.500000
N1501 ;--------------------
N1502 ; CP TOOLCHANGE START
N1503 ; toolchange #1
N1504 ; material : TPU -> TPU
N1505 ;--------------------
N1506 M220 B
N1507 M220 S100
N1508 ; WIPE_TOWER_START
N1509 G1 E-.8 F1800
N1510 G17
N1511 G3 Z.6 I1.217 J0 P1  F60000
N1512 G1 X167.745 Y266.314 Z.2
N1513 G1 E.8 F1800
N1514 ; LAYER_HEIGHT: 0.200000
N1515 ; FEATURE: Prime tower
N1516 ; LINE_WIDTH: 1.000000
N1517 ; NOZZLE_CHANGE_START OF0 NF1
N1518 M204 S500
N1519 G1  X195.245 Y266.314  E2.1885 F1881
N1520 G1  Y267.314  E0.0796
N1521 G1  X167.745  E2.1885
N1522 G1  Y268.314  E0.0796
N1523 G1  X195.245  E2.1885
N1524 G1  Y269.314  E0.0796
N1525 G1  X167.745  E2.1885
N1526 G1  Y270.314  E0.0796
N1527 G1  X195.245  E2.1885
N1528 G1  Y271.314  E0.0796
N1529 G1  X167.745  E2.1885
N1530 ; NOZZLE_CHANGE_END OF0 NF1
N1531 M104 T1 S89 N0 ;Multi extruder pre cooling
N1532 
N1533 ; WIPE_START
N1534 G1 F5400
N1535 M204 S500
N1536 G1 X169.745 Y271.314 E-1.9
N1537 ; WIPE_END
N1538 G1 E-.1 F1800
N1539 M204 S6000
N1540 G17
N1541 G3 Z.6 I1.217 J0 P1  F5400
N1542 ; filament end gcode 
N1543 
N1544 ;======== H2D ========
N1545 ;===== 20250604 =====
N1546 M993 A2 B2 C2 ; nozzle cam detection allow status save.
N1547 M993 A0 B0 C0 ; nozzle cam detection not allowed.
N1548 
N1549 
N1550 M1015.4 S0 ; disable E air printing detect
N1551 
N1552 
N1553 M620 S1A
N1554 M1002 gcode_claim_action : 4
N1555 M204 S9000
N1556 
N1557 G1 Z3.2 F1200
N1558 
N1559 M400
N1560 M106 P1 S0
N1561 M106 P2 S0
N1562 
N1563 
N1564 
N1565 
N1566 M620.10 A0 F149.669 L0 H0.4 T270 P255 S1
N1567 
N1568 
N1569 
N1570 M620.10 A1 F79.8237 L0 H0.4 T250 P240 S1
N1571 
N1572 
N1573 
N1574 M620.11 P0 I0 E0
N1575 
N1576 
N1577 
N1578 M620.11 K1 I0 R10 F200
N1579 
N1580 
N1581 M628 S1
N1582 
N1583 
N1584 M620.11 S1 L0 I0 R10 D8 E-10 F200
N1585 
N1586 
N1587 M629
N1588 
N1589 
N1590 M620.11 H2 C331
N1591 
N1592 
N1593 T1
N1594 M73 E5
N1595 
N1596 ;deretract
N1597 
N1598 
N1599 
N1600 ; VFLUSH_START
N1601 
N1602 
N1603 ;VG1 E0 F79
N1604 
N1605 
N1606 SYNC T0
N1607 
N1608 ; VFLUSH_END
N1609 
N1610 M1002 set_filament_type:TPU
N1611 
N1612 M400
N1613 M83
N1614 
N1615 
N1616 
N1617 M628 S0
N1618 ;VM109 S240
N1619 M629
N1620 M400
N1621 
N1622 M983.3 F1.33333 A0.4
N1623 
N1624 
N1625 M400
N1626 
N1627 G1 Y320 F30000
N1628 G1 X201
N1629 
N1630 M73 P26 R36
N1631 G1 Y295
N1632 G1 Y265 F18000
N1633 G1 Z3.2 F3000
N1634 
N1635 M204 S500
N1636 
N1637 
N1638 M621 S1A
N1639 
N1640 M993 A3 B3 C3 ; nozzle cam detection allow status restore.
N1641 
N1642 
N1643 M1015.3 S1;enable tpu clog detect
N1644 
N1645 
N1646 
N1647 M1015.4 S0 ; disable E air printing detect
N1648 
N1649 
N1650 M620.6 I1 W1 ;enable ams air printing detect
N1651 M1002 gcode_claim_action : 0
N1652 M106 S0
N1653 M106 P2 S0
N1654 G1 X200 Y264.673 F60000
N1655 G1 Z.2
N1656 G1 X200 Y257.04 Z.6
N1657 G1 X200 Y247.99 Z.6
N1658 G1 X162.991 Y247.99
N1659 G1 X162.991 Y252.564
N1660 G1 X167.495 Y252.564
N1661 
N1662 ; filament start gcode
N1663 G1 Z.2
N1664 
N1665 G4 S0
N1666 ; CP TOOLCHANGE WIPE
N1667 ; LINE_WIDTH: 0.500000
N1668 ; LINE_WIDTH: 0.575000
N1669 M204 S500
N1670 G1  X170.495 Y252.564  E0.1311 F990
N1671 G1 E-0.8000 F1800
N1672 M204 S6000
N1673 G1  X165.995  F600
N1674 G1  X167.495  F240
N1675 G1  X167.995  F600
N1676 G1  Y253.064 
N1677 G1  X166.995 
N1678 G1  Y252.064 
N1679 G1  X168.495 
N1680 G1  Y253.564 
N1681 G1  X166.495 
N1682 G1  Y251.564 
N1683 G1  X170.495 Y252.564   F990
N1684 G1 E0.8000 F1800
N1685 M204 S500
N1686 G1  X195.495  E1.0927 F990
N1687 G1  Y253.064  E0.0219
N1688 G1  X167.495  E1.2238 F1125
N1689 G1  Y253.564  E0.0219
N1690 G1  X195.495  E1.2238 F1374
N1691 G1  Y254.064  E0.0219
N1692 G1  X167.495  E1.2238 F1826
N1693 G1  Y254.564  E0.0219
N1694 G1  X195.495  E1.2238
N1695 G1  Y255.064  E0.0219
N1696 M73 P26 R35
N1697 G1  X167.495  E1.2238
N1698 G1  Y255.564  E0.0219
N1699 G1  X195.495  E1.2238
N1700 G1  Y256.064  E0.0219
N1701 G1  X167.495  E1.2238
N1702 G1  Y256.564  E0.0219
N1703 G1  X195.495  E1.2238
N1704 G1  Y257.064  E0.0219
N1705 G1  X167.495  E1.2238
N1706 G1  Y257.564  E0.0219
N1707 G1  X195.495  E1.2238
N1708 G1  Y258.064  E0.0219
N1709 G1  X167.495  E1.2238
N1710 G1  Y258.564  E0.0219
N1711 G1  X195.495  E1.2238
N1712 G1  Y259.064  E0.0219
N1713 G1  X167.495  E1.2238
N1714 G1  Y259.564  E0.0219
N1715 G1  X195.495  E1.2238
N1716 G1  Y260.064  E0.0219
N1717 G1  X167.495  E1.2238
N1718 G1  Y260.564  E0.0219
N1719 G1  X195.495  E1.2238
N1720 G1  Y261.064  E0.0219
N1721 G1  X167.495  E1.2238
N1722 G1  Y261.564  E0.0219
N1723 G1  X195.495  E1.2238
N1724 G1  Y262.064  E0.0219
N1725 G1  X167.495  E1.2238
N1726 G1  Y262.564  E0.0219
N1727 G1  X195.495  E1.2238
N1728 G1  Y263.064  E0.0219
N1729 G1  X167.495  E1.2238
N1730 G1  Y263.564  E0.0219
N1731 G1  X195.495  E1.2238
N1732 G1  Y264.064  E0.0219
N1733 M73 P27 R35
N1734 G1  X167.495  E1.2238
N1735 G1  Y264.564  E0.0219
N1736 G1  X195.495  E1.2238
N1737 G1  Y265.064  E0.0219
N1738 G1  X167.495  E1.2238
N1739 G1  Y265.564  E0.0219
N1740 G1  X195.495  E1.2238
N1741 ; LINE_WIDTH: 0.500000
N1742 ; WIPE_TOWER_END
N1743 M220 R
N1744 G1 F60000
N1745 G4 S0
N1746 G92 E0
N1747 ; CP TOOLCHANGE END
N1748 ;------------------
N1749 
N1750 
N1751 
N1752 ; WIPE_START
N1753 G1 F5400
N1754 M204 S500
N1755 G1 X193.495 Y265.564 E-.76
N1756 ; WIPE_END
N1757 G1 E-.04 F1800
N1758 M204 S6000
N1759 G17
N1760 G3 Z.6 I1.217 J0 P1  F60000
N1761 ; OBJECT_ID: 239
N1762 ; start printing object, unique label id: 239
N1763 M624 AgAAAAAAAAA=
N1764 G1 X182.3 Y118.695 Z.2
N1765 G1 E.8 F1800
N1766 ; FEATURE: Outer wall
N1767 ; LINE_WIDTH: 0.5
N1768 ; LAYER_HEIGHT: 0.2
N1769 G1 F2100.29
N1770 M204 S500
N1771 G1 X167.8 Y118.695 E.55109
N1772 G1 X167.8 Y118.195 E.019
N1773 G1 X182.3 Y118.195 E.55109
N1774 G1 X182.3 Y118.635 E.01672
N1775 ; CHANGE_LAYER
N1776 ; Z_HEIGHT: 0.4
N1777 ; LAYER_HEIGHT: 0.2
N1778 ; WIPE_START
N1779 G1 F2100.29
N1780 G1 X180.3 Y118.644 E-.76
N1781 ; WIPE_END
N1782 G1 E-.04 F1800
N1783 ; stop printing object, unique label id: 239
N1784 M625
N1785 ;======== H2D 20250521========
N1786 ; layer num/total_layer_count: 2/63
N1787 ; update layer progress
N1788 M73 L2
N1789 M991 S0 P1 ;notify layer change
N1790 
N1791 
N1792 M106 S255
N1793 M106 P2 S255
N1794 ; open powerlost recovery
N1795 M1003 S1
N1796 ; OBJECT_ID: 239
N1797 ; start printing object, unique label id: 239
N1798 M624 AgAAAAAAAAA=
N1799 M204 S10000
N1800 G17
N1801 G3 Z.6 I-.055 J1.216 P1  F60000
N1802 G1 X182.34 Y118.735 Z.6
N1803 G1 Z.4
N1804 G1 E.8 F1800
N1805 ; FEATURE: Outer wall
N1806 ; LINE_WIDTH: 0.42
N1807 ; LAYER_HEIGHT: 0.2
N1808 G1 F2545.881
N1809 M204 S5000
N1810 G1 X167.76 Y118.735 E.45715
N1811 G1 X167.76 Y118.155 E.01819
N1812 G1 X182.34 Y118.155 E.45715
N1813 G1 X182.34 Y118.675 E.0163
N1814 M204 S10000
N1815 G1 X182.144 Y118.445 F60000
N1816 ; FEATURE: Gap infill
N1817 ; LINE_WIDTH: 0.23088
N1818 G1 F5107.47
N1819 M204 S8000
N1820 G1 X167.956 Y118.445 E.22174
N1821 ; WIPE_START
N1822 G1 X169.956 Y118.445 E-.76
N1823 ; WIPE_END
N1824 G1 E-.04 F1800
N1825 ; stop printing object, unique label id: 239
N1826 M625
N1827 M204 S10000
N1828 G17
N1829 G3 Z.8 I-1.199 J.208 P1  F60000
N1830 G1 X195.495 Y265.564 Z.8
N1831 G1 Z.4
N1832 G1 E.8 F1800
N1833 ; LAYER_HEIGHT: 0.200000
N1834 ; FEATURE: Prime tower
N1835 ; LINE_WIDTH: 0.500000
N1836 ; WIPE_TOWER_START
N1837 M204 S8000
N1838 G1  X167.495 Y265.564  E1.0642 F2100
N1839 G1  Y260.064  E0.2090
N1840 G1  X195.495  E1.0642
N1841 G1  Y265.564  E0.2090
N1842 M204 S10000
N1843 G1  X168.495 Y260.064  
N1844 ;--------------------
N1845 ; CP EMPTY GRID START
N1846 ; layer #3
N1847 M204 S8000
N1848 G1  Y265.564  E0.2090
N1849 M204 S10000
N1850 G1  X177.162 
N1851 M204 S8000
N1852 G1  Y260.064  E0.2090
N1853 M204 S10000
N1854 G1  X185.828 
N1855 M204 S8000
N1856 G1  Y265.564  E0.2090
N1857 M204 S10000
N1858 G1  X194.495 
N1859 M204 S8000
N1860 G1  Y260.064  E0.2090
N1861 ; CP EMPTY GRID END
N1862 ;------------------
N1863 
N1864 
N1865 
N1866 
N1867 
N1868 
N1869 ; WIPE_TOWER_END
N1870 ; LAYER_HEIGHT: 0.200000
N1871 ; FEATURE: Prime tower
N1872 ; LINE_WIDTH: 0.500000
N1873 ;--------------------
N1874 ; CP TOOLCHANGE START
N1875 ; toolchange #2
N1876 ; material : PCTG -> PCTG
N1877 ;--------------------
N1878 M220 B
N1879 M220 S100
N1880 ; WIPE_TOWER_START
N1881 G1 E-.8 F1800
N1882 G17
N1883 G3 Z.8 I1.217 J0 P1  F60000
N1884 G1 X167.745 Y252.814
N1885 G1 Z.4
N1886 G1 E.8 F1800
N1887 ; LAYER_HEIGHT: 0.200000
N1888 ; FEATURE: Prime tower
N1889 ; LINE_WIDTH: 1.000000
N1890 ; NOZZLE_CHANGE_START OF1 NF0
N1891 M104 T0 S210 N0 ;Multi extruder pre cooling in post extrusion
N1892 M204 S8000
N1893 G1  X195.245 Y252.814  E2.1885 F251
N1894 G1  Y254.314  E0.1194
N1895 M104 T1 S255 N0 ;Multi extruder pre heating
N1896 G1  X167.745  E2.1885
N1897 G1  Y255.814  E0.1194
N1898 G1  X195.245  E2.1885
N1899 G1  Y257.314  E0.1194
N1900 G1  X167.745  E2.1885
N1901 G1  Y258.814  E0.1194
N1902 M73 P28 R35
N1903 G1  X195.245  E2.1885
N1904 M204 S10000
N1905 G1  Y259.814 
N1906 G1  X168.245  F398
N1907 G1  Y258.314 
N1908 M73 P28 R34
N1909 G1  X194.745 
N1910 G1  Y256.814 
N1911 G1  X168.245 
N1912 G1  Y255.314 
N1913 G1  X194.745 
N1914 G1  Y253.814 
N1915 M73 P29 R34
N1916 G1  X168.245 
N1917 ; NOZZLE_CHANGE_END OF1 NF0
N1918 M104 T0 S0 N0 ;Multi extruder pre cooling
N1919 
N1920 G1 E-2 F1800
N1921 G17
N1922 G3 Z.8 I1.217 J0 P1  F5400
N1923 ; filament end gcode 
N1924 
N1925 ;======== H2D ========
N1926 ;===== 20250604 =====
N1927 M993 A2 B2 C2 ; nozzle cam detection allow status save.
N1928 M993 A0 B0 C0 ; nozzle cam detection not allowed.
N1929 
N1930 
N1931 M1015.4 S0 ; disable E air printing detect
N1932 
N1933 
N1934 M620 S0A
N1935 M1002 gcode_claim_action : 4
N1936 M204 S9000
N1937 
N1938 G1 Z3.4 F1200
N1939 
N1940 M400
N1941 M106 P1 S0
N1942 M106 P2 S0
N1943 
N1944 
N1945 ; get travel path for change filament
N1946 ;M620.1 X54 Y0 F21000 P0
N1947 ;M620.1 X54 Y0 F21000 P1
N1948 ;M620.1 X54 Y245 F21000 P2
N1949 
N1950 
N1951 
N1952 M620.10 A0 F79.8237 L0 H0.4 T250 P240 S1
N1953 
N1954 
N1955 
N1956 M620.10 A1 F149.669 L0 H0.4 T270 P255 S1
N1957 
N1958 
N1959 
N1960 M620.11 P0 I1 E0
N1961 
N1962 
N1963 
N1964 M620.11 K1 I1 R0 F200
N1965 
N1966 
N1967 M628 S1
N1968 
N1969 M620.11 S0 L0 I1 E-10 F200
N1970 
N1971 M629
N1972 
N1973 
N1974 M620.11 H2 C331
N1975 
N1976 
N1977 T0
N1978 M73 E4
N1979 
N1980 ;deretract
N1981 
N1982 
N1983 ;VG1 E4 F200
N1984 ;VG1 E4 F100
N1985 
N1986 
N1987 
N1988 ; VFLUSH_START
N1989 
N1990 
N1991 ;VG1 E0 F79
N1992 
N1993 
N1994 SYNC T0
N1995 
N1996 ; VFLUSH_END
N1997 
N1998 M1002 set_filament_type:PCTG
N1999 
N2000 M400
N2001 M83
N2002 
N2003 
N2004 
N2005 M628 S0
N2006 ;VM109 S255
N2007 M629
N2008 M400
N2009 
N2010 M983.3 F2.5 A0.4
N2011 
N2012 
N2013 M400
N2014 
N2015 G1 Y320 F30000
N2016 G1 X201
N2017 
N2018 G1 Y295
N2019 G1 Y265 F18000
N2020 G1 Z3.4 F3000
N2021 
N2022 M204 S8000
N2023 
N2024 
N2025 M621 S0A
N2026 
N2027 M993 A3 B3 C3 ; nozzle cam detection allow status restore.
N2028 
N2029 
N2030 M1015.3 S0;disable tpu clog detect
N2031 
N2032 
N2033 
N2034 M1015.4 S0 ; disable E air printing detect
N2035 
N2036 
N2037 M620.6 I0 W1 ;enable ams air printing detect
N2038 M1002 gcode_claim_action : 0
N2039 M106 S0
N2040 M106 P2 S0
N2041 G1 X200 Y278.814 F60000
N2042 G1 Z.4
N2043 G1 X195.495 Y278.814 Z.8
N2044 
N2045 ; filament start gcode
N2046 G1 Z.4
N2047 G1 E2 F1800
N2048 
N2049 G4 S0
N2050 ; CP TOOLCHANGE WIPE
N2051 ; LINE_WIDTH: 0.500000
N2052 M204 S8000
N2053 G1  X192.495 Y278.814  E0.1140 F1782
N2054 G1 E-0.8000 F1800
N2055 M204 S10000
N2056 G1  X196.995  F600
N2057 G1  X195.495  F240
N2058 G1  X195.995  F600
N2059 G1  Y279.314 
N2060 G1  X194.995 
N2061 G1  Y278.314 
N2062 G1  X196.495 
N2063 G1  Y279.814 
N2064 G1  X194.495 
N2065 G1  Y277.814 
N2066 G1  X192.495 Y278.814   F1782
N2067 G1 E0.8000 F1800
N2068 M204 S8000
N2069 G1  X167.495  E0.9502 F1782
N2070 G1  Y278.064  E0.0285
N2071 G1  X195.495  E1.0642 F2025
N2072 G1  Y277.314  E0.0285
N2073 G1  X167.495  E1.0642 F2473
N2074 G1  Y276.564  E0.0285
N2075 G1  X195.495  E1.0642 F3938
N2076 G1  Y275.814  E0.0285
N2077 G1  X167.495  E1.0642
N2078 G1  Y275.064  E0.0285
N2079 G1  X195.495  E1.0642
N2080 G1  Y274.314  E0.0285
N2081 G1  X167.495  E1.0642
N2082 G1  Y273.564  E0.0285
N2083 G1  X195.495  E1.0642
N2084 G1  Y272.814  E0.0285
N2085 G1  X167.495  E1.0642
N2086 G1  Y272.064  E0.0285
N2087 G1  X195.495  E1.0642
N2088 G1  Y271.314  E0.0285
N2089 G1  X167.495  E1.0642
N2090 G1  Y270.564  E0.0285
N2091 G1  X195.495  E1.0642
N2092 G1  Y269.814  E0.0285
N2093 G1  X167.495  E1.0642
N2094 G1  Y269.064  E0.0285
N2095 G1  X195.495  E1.0642
N2096 G1  Y268.314  E0.0285
N2097 M73 P30 R34
N2098 G1  X167.495  E1.0642
N2099 G1  Y267.564  E0.0285
N2100 G1  X195.495  E1.0642
N2101 G1  Y266.814  E0.0285
N2102 G1  X167.495  E1.0642
N2103 G1  Y266.064  E0.0285
N2104 G1  X195.495  E1.0642
N2105 ; WIPE_TOWER_END
N2106 M220 R
N2107 G1 F60000
N2108 G4 S0
N2109 G92 E0
N2110 ; CP TOOLCHANGE END
N2111 ;------------------
N2112 
N2113 
N2114 G1  Y252.064  
N2115 ; LAYER_HEIGHT: 0.200000
N2116 ; FEATURE: Prime tower
N2117 ; LINE_WIDTH: 0.500000
N2118 ; WIPE_TOWER_START
N2119 M204 S10000
N2120 G1  X195.846 Y279.721  
N2121 M204 S8000
N2122 G3  X193.064 Y281.636   I-3.469 J-2.060 E0.1325 F3938
N2123 G3  X190.723 Y280.255   I1.448 J-5.129 E0.1045
N2124 G2  X188.182 Y279.564   I-2.568 J4.426 E0.1012
N2125 G2  X174.618 Y279.568   I-6.687 J357.435 E0.5155
N2126 G2  X170.683 Y281.445   I0.499 J6.110 E0.1694
N2127 G3  X168.371 Y281.015   I-0.854 J-1.838 E0.0953
N2128 G1  X166.995 Y279.564   E0.0760
N2129 G3  X165.064 Y277.242   I3.871 J-5.183 E0.1159
N2130 G3  X166.240 Y274.649   I2.902 J-0.247 E0.1130
N2131 G2  X166.995 Y272.245   I-3.465 J-2.409 E0.0972
N2132 G2  X166.992 Y259.212   I-321.195 J-6.431 E0.4954
N2133 G2  X165.146 Y255.634   I-6.663 J1.171 E0.1554
N2134 G3  X165.485 Y253.656   I1.658 J-0.734 E0.0808
N2135 G1  X168.371 Y250.613   E0.1594
N2136 G3  X171.793 Y251.056   I1.525 J1.652 E0.1495
N2137 G2  X174.808 Y252.064   I3.021 J-4.025 E0.1229
N2138 G2  X188.372 Y252.060   I6.687 J-357.435 E0.5155
N2139 G2  X192.307 Y250.183   I-0.499 J-6.110 E0.1694
N2140 G3  X194.619 Y250.613   I0.854 J1.838 E0.0953
N2141 G1  X195.995 Y252.064   E0.0760
N2142 G3  X197.926 Y254.386   I-3.871 J5.182 E0.1159
N2143 G3  X196.750 Y256.979   I-2.902 J0.247 E0.1130
N2144 G2  X195.995 Y259.382   I3.464 J2.409 E0.0972
N2145 G2  X195.998 Y272.416   I321.212 J6.432 E0.4954
N2146 G2  X197.844 Y275.994   I6.663 J-1.171 E0.1554
N2147 G3  X197.564 Y277.905   I-1.654 J0.733 E0.0774
N2148 ; WIPE_TOWER_END
N2149 
N2150 ; WIPE_START
N2151 G1 F5107.47
N2152 M204 S8000
N2153 G1 X197.598 Y277.866 E-.01975
N2154 G1 X197.683 Y277.752 E-.0539
N2155 G1 X197.759 Y277.632 E-.05389
N2156 G1 X197.825 Y277.506 E-.0539
N2157 G1 X197.88 Y277.376 E-.0539
N2158 G1 X197.926 Y277.242 E-.05389
N2159 G1 X197.961 Y277.104 E-.0539
N2160 G1 X197.985 Y276.964 E-.05389
N2161 G1 X197.998 Y276.823 E-.0539
N2162 G1 X198 Y276.681 E-.05389
N2163 G1 X197.99 Y276.54 E-.05389
N2164 G1 X197.97 Y276.4 E-.05389
N2165 G1 X197.938 Y276.261 E-.0539
N2166 G1 X197.896 Y276.126 E-.05389
N2167 G1 X197.858 Y276.029 E-.03963
N2168 ; WIPE_END
N2169 G1 E-.04 F1800
N2170 M204 S10000
N2171 G17
N2172 G3 Z.8 I1.217 J0 P1  F60000
N2173 ; OBJECT_ID: 229
N2174 ; start printing object, unique label id: 229
N2175 M624 AQAAAAAAAAA=
N2176 G1 X191.898 Y201.453
N2177 G1 Z.4
N2178 G1 E.8 F1800
N2179 ; FEATURE: Inner wall
N2180 ; LINE_WIDTH: 0.45
N2181 ; LAYER_HEIGHT: 0.2
N2182 G1 F4421.739
N2183 M204 S8000
N2184 G1 X158.102 Y201.453 E1.08675
N2185 G1 X158.102 Y126.222 E2.41914
N2186 G1 X191.898 Y126.222 E1.08675
N2187 G1 X191.898 Y201.393 E2.41721
N2188 M204 S10000
N2189 G1 X192.29 Y201.845 F60000
N2190 ; FEATURE: Outer wall
N2191 ; LINE_WIDTH: 0.42
N2192 G1 F4773.528
N2193 M204 S5000
N2194 G1 X157.71 Y201.845 E1.03002
N2195 G1 X157.71 Y125.83 E2.26421
N2196 G1 X192.29 Y125.83 E1.03002
N2197 G1 X192.29 Y201.785 E2.26243
N2198 ; WIPE_START
N2199 M204 S8000
N2200 G1 X190.29 Y201.788 E-.76
N2201 ; WIPE_END
N2202 G1 E-.04 F1800
N2203 M204 S10000
N2204 G1 X190.971 Y201.289 Z.8 F60000
N2205 G1 Z.4
N2206 G1 E.8 F1800
N2207 ; FEATURE: Internal solid infill
N2208 ; LINE_WIDTH: 0.42067
N2209 G1 F4765.056
N2210 M204 S8000
N2211 G1 X191.565 Y200.695 E.02507
N2212 G1 X191.565 Y200.161 E.01594
N2213 G1 X190.606 Y201.119 E.04045
N2214 G1 X190.072 Y201.119 E.01594
N2215 G1 X191.565 Y199.627 E.06299
N2216 G1 X191.565 Y199.092 E.01594
N2217 G1 X189.538 Y201.119 E.08554
N2218 G1 X189.003 Y201.119 E.01594
N2219 G1 X191.565 Y198.558 E.10808
N2220 G1 X191.565 Y198.024 E.01594
N2221 G1 X188.469 Y201.119 E.13063
N2222 G1 X187.935 Y201.119 E.01594
N2223 G1 X191.565 Y197.49 E.15317
N2224 G1 X191.565 Y196.956 E.01594
N2225 G1 X187.401 Y201.119 E.17571
N2226 G1 X186.867 Y201.119 E.01594
N2227 G1 X191.565 Y196.421 E.19826
N2228 G1 X191.565 Y195.887 E.01594
N2229 G1 X186.332 Y201.119 E.2208
N2230 G1 X185.798 Y201.119 E.01594
N2231 G1 X191.565 Y195.353 E.24334
N2232 G1 X191.565 Y194.819 E.01594
N2233 G1 X185.264 Y201.119 E.26589
N2234 G1 X184.73 Y201.119 E.01594
N2235 G1 X191.565 Y194.284 E.28843
N2236 G1 X191.565 Y193.75 E.01594
N2237 G1 X184.195 Y201.119 E.31098
N2238 G1 X183.661 Y201.119 E.01594
N2239 G1 X191.565 Y193.216 E.33352
N2240 G1 X191.565 Y192.682 E.01594
N2241 G1 X183.127 Y201.119 E.35606
N2242 G1 X182.593 Y201.119 E.01594
N2243 G1 X191.565 Y192.148 E.37861
N2244 G1 X191.565 Y191.613 E.01594
N2245 G1 X182.059 Y201.119 E.40115
N2246 G1 X181.524 Y201.119 E.01594
N2247 G1 X191.565 Y191.079 E.42369
N2248 G1 X191.565 Y190.545 E.01594
N2249 G1 X180.99 Y201.119 E.44624
N2250 G1 X180.456 Y201.119 E.01594
N2251 G1 X191.565 Y190.011 E.46878
N2252 G1 X191.565 Y189.477 E.01594
N2253 G1 X179.922 Y201.119 E.49133
N2254 G1 X179.388 Y201.119 E.01594
N2255 G1 X191.565 Y188.942 E.51387
N2256 G1 X191.565 Y188.408 E.01594
N2257 G1 X178.853 Y201.119 E.53641
N2258 G1 X178.319 Y201.119 E.01594
N2259 G1 X191.565 Y187.874 E.55896
N2260 G1 X191.565 Y187.34 E.01594
N2261 M73 P30 R33
N2262 G1 X177.785 Y201.119 E.5815
N2263 G1 X177.251 Y201.119 E.01594
N2264 G1 X191.565 Y186.805 E.60404
N2265 G1 X191.565 Y186.271 E.01594
N2266 G1 X176.716 Y201.119 E.62659
N2267 G1 X176.182 Y201.119 E.01594
N2268 G1 X191.565 Y185.737 E.64913
N2269 G1 X191.565 Y185.203 E.01594
N2270 G1 X175.648 Y201.119 E.67168
N2271 G1 X175.114 Y201.119 E.01594
N2272 G1 X191.565 Y184.669 E.69422
N2273 G1 X191.565 Y184.134 E.01594
N2274 G1 X174.58 Y201.119 E.71676
N2275 G1 X174.045 Y201.119 E.01594
N2276 G1 X191.565 Y183.6 E.73931
N2277 G1 X191.565 Y183.066 E.01594
N2278 G1 X173.511 Y201.119 E.76185
N2279 G1 X172.977 Y201.119 E.01594
N2280 G1 X191.565 Y182.532 E.7844
N2281 G1 X191.565 Y181.997 E.01594
N2282 G1 X172.443 Y201.119 E.80694
N2283 G1 X171.908 Y201.119 E.01594
N2284 G1 X191.565 Y181.463 E.82948
N2285 G1 X191.565 Y180.929 E.01594
N2286 G1 X171.374 Y201.119 E.85203
N2287 G1 X170.84 Y201.119 E.01594
N2288 G1 X191.565 Y180.395 E.87457
N2289 G1 X191.565 Y179.861 E.01594
N2290 G1 X170.306 Y201.119 E.89711
N2291 G1 X169.772 Y201.119 E.01594
N2292 G1 X191.565 Y179.326 E.91966
N2293 G1 X191.565 Y178.792 E.01594
N2294 G1 X169.237 Y201.119 E.9422
N2295 G1 X168.703 Y201.119 E.01594
N2296 G1 X191.565 Y178.258 E.96475
N2297 G1 X191.565 Y177.724 E.01594
N2298 G1 X168.169 Y201.119 E.98729
N2299 G1 X167.635 Y201.119 E.01594
N2300 G1 X191.565 Y177.189 E1.00983
N2301 G1 X191.565 Y176.655 E.01594
N2302 G1 X167.1 Y201.119 E1.03238
N2303 G1 X166.566 Y201.119 E.01594
N2304 G1 X191.565 Y176.121 E1.05492
N2305 G1 X191.565 Y175.587 E.01594
N2306 G1 X166.032 Y201.119 E1.07746
N2307 G1 X165.498 Y201.119 E.01594
N2308 G1 X191.565 Y175.053 E1.10001
N2309 G1 X191.565 Y174.518 E.01594
N2310 G1 X164.964 Y201.119 E1.12255
N2311 G1 X164.429 Y201.119 E.01594
N2312 G1 X191.565 Y173.984 E1.1451
N2313 G1 X191.565 Y173.45 E.01594
N2314 G1 X163.895 Y201.119 E1.16764
N2315 G1 X163.361 Y201.119 E.01594
N2316 G1 X191.565 Y172.916 E1.19018
N2317 G1 X191.565 Y172.381 E.01594
N2318 G1 X162.827 Y201.119 E1.21273
N2319 G1 X162.293 Y201.119 E.01594
N2320 G1 X191.565 Y171.847 E1.23527
N2321 G1 X191.565 Y171.313 E.01594
N2322 G1 X161.758 Y201.119 E1.25781
N2323 G1 X161.224 Y201.119 E.01594
N2324 G1 X191.565 Y170.779 E1.28036
N2325 G1 X191.565 Y170.245 E.01594
N2326 G1 X160.69 Y201.119 E1.3029
N2327 G1 X160.156 Y201.119 E.01594
N2328 G1 X191.565 Y169.71 E1.32545
N2329 G1 X191.565 Y169.176 E.01594
N2330 G1 X159.621 Y201.119 E1.34799
N2331 G1 X159.087 Y201.119 E.01594
N2332 G1 X191.565 Y168.642 E1.37053
N2333 G1 X191.565 Y168.108 E.01594
N2334 M73 P31 R33
N2335 G1 X158.553 Y201.119 E1.39308
N2336 G1 X158.435 Y201.119 E.00351
N2337 G1 X158.435 Y200.703 E.01243
N2338 G1 X191.565 Y167.574 E1.39804
N2339 G1 X191.565 Y167.039 E.01594
N2340 G1 X158.435 Y200.169 E1.39804
N2341 G1 X158.435 Y199.634 E.01594
N2342 G1 X191.565 Y166.505 E1.39804
N2343 G1 X191.565 Y165.971 E.01594
N2344 G1 X158.435 Y199.1 E1.39804
N2345 G1 X158.435 Y198.566 E.01594
N2346 G1 X191.565 Y165.437 E1.39804
N2347 G1 X191.565 Y164.902 E.01594
N2348 G1 X158.435 Y198.032 E1.39804
N2349 G1 X158.435 Y197.498 E.01594
N2350 G1 X191.565 Y164.368 E1.39804
N2351 G1 X191.565 Y163.834 E.01594
N2352 G1 X158.435 Y196.963 E1.39804
N2353 G1 X158.435 Y196.429 E.01594
N2354 G1 X191.565 Y163.3 E1.39804
N2355 G1 X191.565 Y162.766 E.01594
N2356 G1 X158.435 Y195.895 E1.39804
N2357 G1 X158.435 Y195.361 E.01594
N2358 G1 X191.565 Y162.231 E1.39804
N2359 G1 X191.565 Y161.697 E.01594
N2360 G1 X158.435 Y194.826 E1.39804
N2361 G1 X158.435 Y194.292 E.01594
N2362 G1 X191.565 Y161.163 E1.39804
N2363 G1 X191.565 Y160.629 E.01594
N2364 G1 X158.435 Y193.758 E1.39804
N2365 G1 X158.435 Y193.224 E.01594
N2366 G1 X191.565 Y160.094 E1.39804
N2367 G1 X191.565 Y159.56 E.01594
N2368 G1 X158.435 Y192.69 E1.39804
N2369 G1 X158.435 Y192.155 E.01594
N2370 G1 X191.565 Y159.026 E1.39804
N2371 G1 X191.565 Y158.492 E.01594
N2372 G1 X158.435 Y191.621 E1.39804
N2373 G1 X158.435 Y191.087 E.01594
N2374 G1 X191.565 Y157.958 E1.39804
N2375 G1 X191.565 Y157.423 E.01594
N2376 G1 X158.435 Y190.553 E1.39804
N2377 G1 X158.435 Y190.018 E.01594
N2378 G1 X191.565 Y156.889 E1.39804
N2379 G1 X191.565 Y156.355 E.01594
N2380 G1 X158.435 Y189.484 E1.39804
N2381 G1 X158.435 Y188.95 E.01594
N2382 G1 X191.565 Y155.821 E1.39804
N2383 G1 X191.565 Y155.286 E.01594
N2384 G1 X158.435 Y188.416 E1.39804
N2385 G1 X158.435 Y187.882 E.01594
N2386 G1 X191.565 Y154.752 E1.39804
N2387 G1 X191.565 Y154.218 E.01594
N2388 G1 X158.435 Y187.347 E1.39804
N2389 G1 X158.435 Y186.813 E.01594
N2390 G1 X191.565 Y153.684 E1.39804
N2391 G1 X191.565 Y153.15 E.01594
N2392 G1 X158.435 Y186.279 E1.39804
N2393 G1 X158.435 Y185.745 E.01594
N2394 G1 X191.565 Y152.615 E1.39804
N2395 G1 X191.565 Y152.081 E.01594
N2396 G1 X158.435 Y185.211 E1.39804
N2397 G1 X158.435 Y184.676 E.01594
N2398 G1 X191.565 Y151.547 E1.39804
N2399 G1 X191.565 Y151.013 E.01594
N2400 G1 X158.435 Y184.142 E1.39804
N2401 G1 X158.435 Y183.608 E.01594
N2402 G1 X191.565 Y150.479 E1.39804
N2403 G1 X191.565 Y149.944 E.01594
N2404 G1 X158.435 Y183.074 E1.39804
N2405 G1 X158.435 Y182.539 E.01594
N2406 G1 X191.565 Y149.41 E1.39804
N2407 G1 X191.565 Y148.876 E.01594
N2408 G1 X158.435 Y182.005 E1.39804
N2409 G1 X158.435 Y181.471 E.01594
N2410 G1 X191.565 Y148.342 E1.39804
N2411 G1 X191.565 Y147.807 E.01594
N2412 G1 X158.435 Y180.937 E1.39804
N2413 G1 X158.435 Y180.403 E.01594
N2414 G1 X191.565 Y147.273 E1.39804
N2415 G1 X191.565 Y146.739 E.01594
N2416 G1 X158.435 Y179.868 E1.39804
N2417 G1 X158.435 Y179.334 E.01594
N2418 G1 X191.565 Y146.205 E1.39804
N2419 G1 X191.565 Y145.671 E.01594
N2420 G1 X158.435 Y178.8 E1.39804
N2421 G1 X158.435 Y178.266 E.01594
N2422 G1 X191.565 Y145.136 E1.39804
N2423 G1 X191.565 Y144.602 E.01594
N2424 G1 X158.435 Y177.731 E1.39804
N2425 G1 X158.435 Y177.197 E.01594
N2426 G1 X191.565 Y144.068 E1.39804
N2427 G1 X191.565 Y143.534 E.01594
N2428 G1 X158.435 Y176.663 E1.39804
N2429 G1 X158.435 Y176.129 E.01594
N2430 G1 X191.565 Y142.999 E1.39804
N2431 G1 X191.565 Y142.465 E.01594
N2432 M73 P32 R33
N2433 G1 X158.435 Y175.595 E1.39804
N2434 G1 X158.435 Y175.06 E.01594
N2435 G1 X191.565 Y141.931 E1.39804
N2436 G1 X191.565 Y141.397 E.01594
N2437 G1 X158.435 Y174.526 E1.39804
N2438 G1 X158.435 Y173.992 E.01594
N2439 G1 X191.565 Y140.863 E1.39804
N2440 G1 X191.565 Y140.328 E.01594
N2441 G1 X158.435 Y173.458 E1.39804
N2442 G1 X158.435 Y172.923 E.01594
N2443 G1 X191.565 Y139.794 E1.39804
N2444 G1 X191.565 Y139.26 E.01594
N2445 G1 X158.435 Y172.389 E1.39804
N2446 G1 X158.435 Y171.855 E.01594
N2447 G1 X191.565 Y138.726 E1.39804
N2448 G1 X191.565 Y138.191 E.01594
N2449 G1 X158.435 Y171.321 E1.39804
N2450 G1 X158.435 Y170.787 E.01594
N2451 G1 X191.565 Y137.657 E1.39804
N2452 G1 X191.565 Y137.123 E.01594
N2453 G1 X158.435 Y170.252 E1.39804
N2454 G1 X158.435 Y169.718 E.01594
N2455 G1 X191.565 Y136.589 E1.39804
N2456 G1 X191.565 Y136.055 E.01594
N2457 G1 X158.435 Y169.184 E1.39804
N2458 G1 X158.435 Y168.65 E.01594
N2459 G1 X191.565 Y135.52 E1.39804
N2460 G1 X191.565 Y134.986 E.01594
N2461 G1 X158.435 Y168.115 E1.39804
N2462 G1 X158.435 Y167.581 E.01594
N2463 G1 X191.565 Y134.452 E1.39804
N2464 G1 X191.565 Y133.918 E.01594
N2465 G1 X158.435 Y167.047 E1.39804
N2466 G1 X158.435 Y166.513 E.01594
N2467 G1 X191.565 Y133.383 E1.39804
N2468 G1 X191.565 Y132.849 E.01594
N2469 G1 X158.435 Y165.979 E1.39804
N2470 G1 X158.435 Y165.444 E.01594
N2471 G1 X191.565 Y132.315 E1.39804
N2472 G1 X191.565 Y131.781 E.01594
N2473 G1 X158.435 Y164.91 E1.39804
N2474 G1 X158.435 Y164.376 E.01594
N2475 G1 X191.565 Y131.247 E1.39804
N2476 G1 X191.565 Y130.712 E.01594
N2477 G1 X158.435 Y163.842 E1.39804
N2478 G1 X158.435 Y163.308 E.01594
N2479 G1 X191.565 Y130.178 E1.39804
N2480 G1 X191.565 Y129.644 E.01594
N2481 G1 X158.435 Y162.773 E1.39804
N2482 G1 X158.435 Y162.239 E.01594
N2483 G1 X191.565 Y129.11 E1.39804
N2484 M73 P32 R32
N2485 G1 X191.565 Y128.576 E.01594
N2486 G1 X158.435 Y161.705 E1.39804
N2487 G1 X158.435 Y161.171 E.01594
N2488 G1 X191.565 Y128.041 E1.39804
N2489 G1 X191.565 Y127.507 E.01594
N2490 G1 X158.435 Y160.636 E1.39804
N2491 G1 X158.435 Y160.102 E.01594
N2492 G1 X191.565 Y126.973 E1.39804
N2493 G1 X191.565 Y126.556 E.01245
N2494 G1 X191.448 Y126.556 E.00349
N2495 G1 X158.435 Y159.568 E1.39311
N2496 G1 X158.435 Y159.034 E.01594
N2497 G1 X190.914 Y126.556 E1.37057
N2498 G1 X190.379 Y126.556 E.01594
N2499 G1 X158.435 Y158.5 E1.34802
N2500 G1 X158.435 Y157.965 E.01594
N2501 G1 X189.845 Y126.556 E1.32548
N2502 G1 X189.311 Y126.556 E.01594
N2503 G1 X158.435 Y157.431 E1.30293
N2504 G1 X158.435 Y156.897 E.01594
N2505 G1 X188.777 Y126.556 E1.28039
N2506 G1 X188.242 Y126.556 E.01594
N2507 G1 X158.435 Y156.363 E1.25785
N2508 G1 X158.435 Y155.828 E.01594
N2509 G1 X187.708 Y126.556 E1.2353
N2510 G1 X187.174 Y126.556 E.01594
N2511 G1 X158.435 Y155.294 E1.21276
N2512 G1 X158.435 Y154.76 E.01594
N2513 G1 X186.64 Y126.556 E1.19022
N2514 G1 X186.106 Y126.556 E.01594
N2515 G1 X158.435 Y154.226 E1.16767
N2516 G1 X158.435 Y153.692 E.01594
N2517 G1 X185.571 Y126.556 E1.14513
N2518 G1 X185.037 Y126.556 E.01594
N2519 G1 X158.435 Y153.157 E1.12258
N2520 G1 X158.435 Y152.623 E.01594
N2521 G1 X184.503 Y126.556 E1.10004
N2522 G1 X183.969 Y126.556 E.01594
N2523 G1 X158.435 Y152.089 E1.0775
N2524 G1 X158.435 Y151.555 E.01594
N2525 G1 X183.435 Y126.556 E1.05495
N2526 G1 X182.9 Y126.556 E.01594
N2527 G1 X158.435 Y151.02 E1.03241
N2528 G1 X158.435 Y150.486 E.01594
N2529 G1 X182.366 Y126.556 E1.00987
N2530 G1 X181.832 Y126.556 E.01594
N2531 G1 X158.435 Y149.952 E.98732
N2532 G1 X158.435 Y149.418 E.01594
N2533 G1 X181.298 Y126.556 E.96478
N2534 G1 X180.763 Y126.556 E.01594
N2535 G1 X158.435 Y148.884 E.94223
N2536 G1 X158.435 Y148.349 E.01594
N2537 M73 P33 R32
N2538 G1 X180.229 Y126.556 E.91969
N2539 G1 X179.695 Y126.556 E.01594
N2540 G1 X158.435 Y147.815 E.89715
N2541 G1 X158.435 Y147.281 E.01594
N2542 G1 X179.161 Y126.556 E.8746
N2543 G1 X178.627 Y126.556 E.01594
N2544 G1 X158.435 Y146.747 E.85206
N2545 G1 X158.435 Y146.213 E.01594
N2546 G1 X178.092 Y126.556 E.82952
N2547 G1 X177.558 Y126.556 E.01594
N2548 G1 X158.435 Y145.678 E.80697
N2549 G1 X158.435 Y145.144 E.01594
N2550 G1 X177.024 Y126.556 E.78443
N2551 G1 X176.49 Y126.556 E.01594
N2552 G1 X158.435 Y144.61 E.76188
N2553 G1 X158.435 Y144.076 E.01594
N2554 G1 X175.955 Y126.556 E.73934
N2555 G1 X175.421 Y126.556 E.01594
N2556 G1 X158.435 Y143.541 E.7168
N2557 G1 X158.435 Y143.007 E.01594
N2558 G1 X174.887 Y126.556 E.69425
N2559 G1 X174.353 Y126.556 E.01594
N2560 G1 X158.435 Y142.473 E.67171
N2561 G1 X158.435 Y141.939 E.01594
N2562 G1 X173.819 Y126.556 E.64916
N2563 G1 X173.284 Y126.556 E.01594
N2564 G1 X158.435 Y141.405 E.62662
N2565 G1 X158.435 Y140.87 E.01594
N2566 G1 X172.75 Y126.556 E.60408
N2567 G1 X172.216 Y126.556 E.01594
N2568 G1 X158.435 Y140.336 E.58153
N2569 G1 X158.435 Y139.802 E.01594
N2570 G1 X171.682 Y126.556 E.55899
N2571 G1 X171.147 Y126.556 E.01594
N2572 G1 X158.435 Y139.268 E.53645
N2573 G1 X158.435 Y138.733 E.01594
N2574 G1 X170.613 Y126.556 E.5139
N2575 G1 X170.079 Y126.556 E.01594
N2576 G1 X158.435 Y138.199 E.49136
N2577 G1 X158.435 Y137.665 E.01594
N2578 G1 X169.545 Y126.556 E.46881
N2579 G1 X169.011 Y126.556 E.01594
N2580 G1 X158.435 Y137.131 E.44627
N2581 G1 X158.435 Y136.597 E.01594
N2582 G1 X168.476 Y126.556 E.42373
N2583 G1 X167.942 Y126.556 E.01594
N2584 G1 X158.435 Y136.062 E.40118
N2585 G1 X158.435 Y135.528 E.01594
N2586 G1 X167.408 Y126.556 E.37864
N2587 G1 X166.874 Y126.556 E.01594
N2588 G1 X158.435 Y134.994 E.3561
N2589 G1 X158.435 Y134.46 E.01594
N2590 G1 X166.339 Y126.556 E.33355
N2591 G1 X165.805 Y126.556 E.01594
N2592 G1 X158.435 Y133.925 E.31101
N2593 G1 X158.435 Y133.391 E.01594
N2594 G1 X165.271 Y126.556 E.28846
N2595 G1 X164.737 Y126.556 E.01594
N2596 G1 X158.435 Y132.857 E.26592
N2597 G1 X158.435 Y132.323 E.01594
N2598 G1 X164.203 Y126.556 E.24338
N2599 G1 X163.668 Y126.556 E.01594
N2600 G1 X158.435 Y131.789 E.22083
N2601 G1 X158.435 Y131.254 E.01594
N2602 G1 X163.134 Y126.556 E.19829
N2603 G1 X162.6 Y126.556 E.01594
N2604 G1 X158.435 Y130.72 E.17575
N2605 G1 X158.435 Y130.186 E.01594
N2606 G1 X162.066 Y126.556 E.1532
N2607 G1 X161.532 Y126.556 E.01594
N2608 G1 X158.435 Y129.652 E.13066
N2609 G1 X158.435 Y129.118 E.01594
N2610 G1 X160.997 Y126.556 E.10811
N2611 G1 X160.463 Y126.556 E.01594
N2612 G1 X158.435 Y128.583 E.08557
N2613 G1 X158.435 Y128.049 E.01594
N2614 G1 X159.929 Y126.556 E.06303
N2615 G1 X159.395 Y126.556 E.01594
N2616 G1 X158.435 Y127.515 E.04048
N2617 G1 X158.435 Y126.981 E.01594
N2618 G1 X159.03 Y126.386 E.0251
N2619 ; WIPE_START
N2620 G1 X158.435 Y126.981 E-.31964
N2621 G1 X158.435 Y127.515 E-.203
N2622 G1 X158.877 Y127.073 E-.23736
N2623 ; WIPE_END
N2624 G1 E-.04 F1800
N2625 M204 S10000
N2626 G17
N2627 G3 Z.8 I1.217 J0 P1  F60000
N2628 ; stop printing object, unique label id: 229
N2629 M625
N2630 ; object ids of layer 2 start: 229,239
N2631 M624 AwAAAAAAAAA=
N2632 ;======== H2D 20250527========
N2633 ; SKIPPABLE_START
N2634 ; SKIPTYPE: timelapse
N2635 M622.1 S1 ; for prev firware, default turned on
N2636 
N2637 M1002 judge_flag timelapse_record_flag
N2638 
N2639 M622 J1
N2640 M993 A2 B2 C2
N2641 M993 A0 B0 C0
N2642 
N2643 
N2644 
N2645 
N2646     M9711 M0 E1 X260 Y141 Z0.8 S11 C10 O0 T3000
N2647 
N2648 
N2649 
N2650 M993 A3 B3 C3
N2651 
N2652 M623
N2653 ; SKIPPABLE_END
N2654 
N2655 ; object ids of this layer2 end: 229,239
N2656 M625
N2657 ; CHANGE_LAYER
N2658 ; Z_HEIGHT: 0.6
N2659 ; LAYER_HEIGHT: 0.2
N2660 ;======== H2D 20250521========
N2661 ; layer num/total_layer_count: 3/63
N2662 ; update layer progress
N2663 M73 L3
N2664 M991 S0 P2 ;notify layer change
N2665 
N2666 
N2667 ; OBJECT_ID: 229
N2668 ; COOLING_NODE: 0
N2669 ; start printing object, unique label id: 229
N2670 M624 AQAAAAAAAAA=
N2671 G1 X191.898 Y201.453 F60000
N2672 G1 Z.6
N2673 G1 E.8 F1800
N2674 ; FEATURE: Inner wall
N2675 ; LINE_WIDTH: 0.45
N2676 ; LAYER_HEIGHT: 0.2
N2677 G1 F4421.739
N2678 M204 S8000
N2679 G1 X158.102 Y201.453 E1.08675
N2680 G1 X158.102 Y126.222 E2.41914
N2681 G1 X191.898 Y126.222 E1.08675
N2682 G1 X191.898 Y201.393 E2.41721
N2683 ; COOLING_NODE: 0
N2684 M204 S10000
N2685 G1 X192.29 Y201.845 F60000
N2686 ; FEATURE: Outer wall
N2687 ; LINE_WIDTH: 0.42
N2688 G1 F4773.528
N2689 M204 S5000
N2690 G1 X157.71 Y201.845 E1.03002
N2691 G1 X157.71 Y125.83 E2.26421
N2692 G1 X192.29 Y125.83 E1.03002
N2693 G1 X192.29 Y201.785 E2.26243
N2694 ; WIPE_START
N2695 M204 S8000
N2696 G1 X190.29 Y201.788 E-.76
N2697 ; WIPE_END
N2698 G1 E-.04 F1800
N2699 M204 S10000
N2700 G1 X182.663 Y201.487 Z1 F60000
N2701 G1 X158.266 Y200.525 Z1
N2702 G1 Z.6
N2703 G1 E.8 F1800
N2704 ; FEATURE: Internal solid infill
N2705 ; LINE_WIDTH: 0.42067
N2706 G1 F4765.056
N2707 M204 S8000
N2708 G1 X158.86 Y201.119 E.0251
N2709 G1 X159.395 Y201.119 E.01594
N2710 G1 X158.435 Y200.16 E.04048
N2711 G1 X158.435 Y199.626 E.01594
N2712 G1 X159.929 Y201.119 E.06303
N2713 G1 X160.463 Y201.119 E.01594
N2714 G1 X158.435 Y199.092 E.08557
N2715 G1 X158.435 Y198.557 E.01594
N2716 G1 X160.997 Y201.119 E.10811
N2717 G1 X161.532 Y201.119 E.01594
N2718 G1 X158.435 Y198.023 E.13066
N2719 G1 X158.435 Y197.489 E.01594
N2720 G1 X162.066 Y201.119 E.1532
N2721 G1 X162.6 Y201.119 E.01594
N2722 G1 X158.435 Y196.955 E.17575
N2723 G1 X158.435 Y196.421 E.01594
N2724 G1 X163.134 Y201.119 E.19829
N2725 G1 X163.668 Y201.119 E.01594
N2726 G1 X158.435 Y195.886 E.22083
N2727 G1 X158.435 Y195.352 E.01594
N2728 G1 X164.203 Y201.119 E.24338
N2729 G1 X164.737 Y201.119 E.01594
N2730 G1 X158.435 Y194.818 E.26592
N2731 G1 X158.435 Y194.284 E.01594
N2732 G1 X165.271 Y201.119 E.28846
N2733 G1 X165.805 Y201.119 E.01594
N2734 G1 X158.435 Y193.749 E.31101
N2735 G1 X158.435 Y193.215 E.01594
N2736 G1 X166.339 Y201.119 E.33355
N2737 G1 X166.874 Y201.119 E.01594
N2738 G1 X158.435 Y192.681 E.3561
N2739 G1 X158.435 Y192.147 E.01594
N2740 G1 X167.408 Y201.119 E.37864
N2741 G1 X167.942 Y201.119 E.01594
N2742 G1 X158.435 Y191.613 E.40118
N2743 G1 X158.435 Y191.078 E.01594
N2744 G1 X168.476 Y201.119 E.42373
N2745 G1 X169.011 Y201.119 E.01594
N2746 G1 X158.435 Y190.544 E.44627
N2747 G1 X158.435 Y190.01 E.01594
N2748 G1 X169.545 Y201.119 E.46881
N2749 G1 X170.079 Y201.119 E.01594
N2750 G1 X158.435 Y189.476 E.49136
N2751 G1 X158.435 Y188.942 E.01594
N2752 G1 X170.613 Y201.119 E.5139
N2753 G1 X171.147 Y201.119 E.01594
N2754 G1 X158.435 Y188.407 E.53645
N2755 G1 X158.435 Y187.873 E.01594
N2756 G1 X171.682 Y201.119 E.55899
N2757 G1 X172.216 Y201.119 E.01594
N2758 G1 X158.435 Y187.339 E.58153
N2759 G1 X158.435 Y186.805 E.01594
N2760 G1 X172.75 Y201.119 E.60408
N2761 G1 X173.284 Y201.119 E.01594
N2762 G1 X158.435 Y186.27 E.62662
N2763 G1 X158.435 Y185.736 E.01594
N2764 G1 X173.819 Y201.119 E.64916
N2765 G1 X174.353 Y201.119 E.01594
N2766 G1 X158.435 Y185.202 E.67171
N2767 G1 X158.435 Y184.668 E.01594
N2768 G1 X174.887 Y201.119 E.69425
N2769 G1 X175.421 Y201.119 E.01594
N2770 G1 X158.435 Y184.134 E.7168
N2771 G1 X158.435 Y183.599 E.01594
N2772 G1 X175.955 Y201.119 E.73934
N2773 G1 X176.49 Y201.119 E.01594
N2774 G1 X158.435 Y183.065 E.76188
N2775 G1 X158.435 Y182.531 E.01594
N2776 G1 X177.024 Y201.119 E.78443
N2777 G1 X177.558 Y201.119 E.01594
N2778 G1 X158.435 Y181.997 E.80697
N2779 G1 X158.435 Y181.462 E.01594
N2780 G1 X178.092 Y201.119 E.82951
N2781 G1 X178.627 Y201.119 E.01594
N2782 G1 X158.435 Y180.928 E.85206
N2783 G1 X158.435 Y180.394 E.01594
N2784 G1 X179.161 Y201.119 E.8746
N2785 G1 X179.695 Y201.119 E.01594
N2786 G1 X158.435 Y179.86 E.89715
N2787 G1 X158.435 Y179.326 E.01594
N2788 G1 X180.229 Y201.119 E.91969
N2789 G1 X180.763 Y201.119 E.01594
N2790 G1 X158.435 Y178.791 E.94223
N2791 G1 X158.435 Y178.257 E.01594
N2792 G1 X181.298 Y201.119 E.96478
N2793 G1 X181.832 Y201.119 E.01594
N2794 G1 X158.435 Y177.723 E.98732
N2795 G1 X158.435 Y177.189 E.01594
N2796 G1 X182.366 Y201.119 E1.00986
N2797 G1 X182.9 Y201.119 E.01594
N2798 G1 X158.435 Y176.654 E1.03241
N2799 G1 X158.435 Y176.12 E.01594
N2800 G1 X183.435 Y201.119 E1.05495
N2801 G1 X183.969 Y201.119 E.01594
N2802 G1 X158.435 Y175.586 E1.0775
N2803 G1 X158.435 Y175.052 E.01594
N2804 G1 X184.503 Y201.119 E1.10004
N2805 G1 X185.037 Y201.119 E.01594
N2806 G1 X158.435 Y174.518 E1.12258
N2807 G1 X158.435 Y173.983 E.01594
N2808 G1 X185.571 Y201.119 E1.14513
N2809 G1 X186.106 Y201.119 E.01594
N2810 G1 X158.435 Y173.449 E1.16767
N2811 G1 X158.435 Y172.915 E.01594
N2812 M73 P34 R32
N2813 G1 X186.64 Y201.119 E1.19022
N2814 G1 X187.174 Y201.119 E.01594
N2815 G1 X158.435 Y172.381 E1.21276
N2816 G1 X158.435 Y171.847 E.01594
N2817 G1 X187.708 Y201.119 E1.2353
N2818 G1 X188.242 Y201.119 E.01594
N2819 G1 X158.435 Y171.312 E1.25785
N2820 G1 X158.435 Y170.778 E.01594
N2821 G1 X188.777 Y201.119 E1.28039
N2822 G1 X189.311 Y201.119 E.01594
N2823 G1 X158.435 Y170.244 E1.30293
N2824 G1 X158.435 Y169.71 E.01594
N2825 G1 X189.845 Y201.119 E1.32548
N2826 G1 X190.379 Y201.119 E.01594
N2827 G1 X158.435 Y169.175 E1.34802
N2828 G1 X158.435 Y168.641 E.01594
N2829 G1 X190.914 Y201.119 E1.37057
N2830 G1 X191.448 Y201.119 E.01594
N2831 G1 X158.435 Y168.107 E1.39311
N2832 G1 X158.435 Y167.573 E.01594
N2833 G1 X191.565 Y200.702 E1.39804
N2834 G1 X191.565 Y200.168 E.01594
N2835 G1 X158.435 Y167.039 E1.39804
N2836 G1 X158.435 Y166.504 E.01594
N2837 G1 X191.565 Y199.634 E1.39804
N2838 G1 X191.565 Y199.099 E.01594
N2839 G1 X158.435 Y165.97 E1.39804
N2840 G1 X158.435 Y165.436 E.01594
N2841 G1 X191.565 Y198.565 E1.39804
N2842 G1 X191.565 Y198.031 E.01594
N2843 G1 X158.435 Y164.902 E1.39804
N2844 G1 X158.435 Y164.367 E.01594
N2845 G1 X191.565 Y197.497 E1.39804
N2846 G1 X191.565 Y196.963 E.01594
N2847 G1 X158.435 Y163.833 E1.39804
N2848 G1 X158.435 Y163.299 E.01594
N2849 G1 X191.565 Y196.428 E1.39804
N2850 G1 X191.565 Y195.894 E.01594
N2851 G1 X158.435 Y162.765 E1.39804
N2852 G1 X158.435 Y162.231 E.01594
N2853 G1 X191.565 Y195.36 E1.39804
N2854 G1 X191.565 Y194.826 E.01594
N2855 G1 X158.435 Y161.696 E1.39804
N2856 G1 X158.435 Y161.162 E.01594
N2857 G1 X191.565 Y194.291 E1.39804
N2858 G1 X191.565 Y193.757 E.01594
N2859 G1 X158.435 Y160.628 E1.39804
N2860 G1 X158.435 Y160.094 E.01594
N2861 G1 X191.565 Y193.223 E1.39804
N2862 G1 X191.565 Y192.689 E.01594
N2863 G1 X158.435 Y159.559 E1.39804
N2864 G1 X158.435 Y159.025 E.01594
N2865 G1 X191.565 Y192.155 E1.39804
N2866 G1 X191.565 Y191.62 E.01594
N2867 G1 X158.435 Y158.491 E1.39804
N2868 G1 X158.435 Y157.957 E.01594
N2869 M104 T0 S240 N0 ;Multi extruder pre heating
N2870 M73 P34 R31
N2871 G1 X191.565 Y191.086 E1.39804
N2872 G1 X191.565 Y190.552 E.01594
N2873 G1 X158.435 Y157.423 E1.39804
N2874 G1 X158.435 Y156.888 E.01594
N2875 G1 X191.565 Y190.018 E1.39804
N2876 G1 X191.565 Y189.484 E.01594
N2877 G1 X158.435 Y156.354 E1.39804
N2878 G1 X158.435 Y155.82 E.01594
N2879 G1 X191.565 Y188.949 E1.39804
N2880 G1 X191.565 Y188.415 E.01594
N2881 G1 X158.435 Y155.286 E1.39804
N2882 G1 X158.435 Y154.751 E.01594
N2883 G1 X191.565 Y187.881 E1.39804
N2884 G1 X191.565 Y187.347 E.01594
N2885 G1 X158.435 Y154.217 E1.39804
N2886 G1 X158.435 Y153.683 E.01594
N2887 G1 X191.565 Y186.812 E1.39804
N2888 G1 X191.565 Y186.278 E.01594
N2889 G1 X158.435 Y153.149 E1.39804
N2890 G1 X158.435 Y152.615 E.01594
N2891 G1 X191.565 Y185.744 E1.39804
N2892 G1 X191.565 Y185.21 E.01594
N2893 G1 X158.435 Y152.08 E1.39804
N2894 G1 X158.435 Y151.546 E.01594
N2895 G1 X191.565 Y184.676 E1.39804
N2896 G1 X191.565 Y184.141 E.01594
N2897 G1 X158.435 Y151.012 E1.39804
N2898 G1 X158.435 Y150.478 E.01594
N2899 G1 X191.565 Y183.607 E1.39804
N2900 G1 X191.565 Y183.073 E.01594
N2901 G1 X158.435 Y149.944 E1.39804
N2902 G1 X158.435 Y149.409 E.01594
N2903 G1 X191.565 Y182.539 E1.39804
N2904 G1 X191.565 Y182.004 E.01594
N2905 G1 X158.435 Y148.875 E1.39804
N2906 G1 X158.435 Y148.341 E.01594
N2907 G1 X191.565 Y181.47 E1.39804
N2908 G1 X191.565 Y180.936 E.01594
N2909 G1 X158.435 Y147.807 E1.39804
N2910 G1 X158.435 Y147.272 E.01594
N2911 G1 X191.565 Y180.402 E1.39804
N2912 G1 X191.565 Y179.868 E.01594
N2913 M73 P35 R31
N2914 G1 X158.435 Y146.738 E1.39804
N2915 G1 X158.435 Y146.204 E.01594
N2916 G1 X191.565 Y179.333 E1.39804
N2917 G1 X191.565 Y178.799 E.01594
N2918 G1 X158.435 Y145.67 E1.39804
N2919 G1 X158.435 Y145.136 E.01594
N2920 G1 X191.565 Y178.265 E1.39804
N2921 G1 X191.565 Y177.731 E.01594
N2922 G1 X158.435 Y144.601 E1.39804
N2923 G1 X158.435 Y144.067 E.01594
N2924 G1 X191.565 Y177.196 E1.39804
N2925 G1 X191.565 Y176.662 E.01594
N2926 G1 X158.435 Y143.533 E1.39804
N2927 G1 X158.435 Y142.999 E.01594
N2928 G1 X191.565 Y176.128 E1.39804
N2929 G1 X191.565 Y175.594 E.01594
N2930 G1 X158.435 Y142.464 E1.39804
N2931 G1 X158.435 Y141.93 E.01594
N2932 G1 X191.565 Y175.06 E1.39804
N2933 G1 X191.565 Y174.525 E.01594
N2934 G1 X158.435 Y141.396 E1.39804
N2935 G1 X158.435 Y140.862 E.01594
N2936 G1 X191.565 Y173.991 E1.39804
N2937 G1 X191.565 Y173.457 E.01594
N2938 G1 X158.435 Y140.328 E1.39804
N2939 G1 X158.435 Y139.793 E.01594
N2940 G1 X191.565 Y172.923 E1.39804
N2941 G1 X191.565 Y172.388 E.01594
N2942 G1 X158.435 Y139.259 E1.39804
N2943 G1 X158.435 Y138.725 E.01594
N2944 G1 X191.565 Y171.854 E1.39804
N2945 G1 X191.565 Y171.32 E.01594
N2946 G1 X158.435 Y138.191 E1.39804
N2947 G1 X158.435 Y137.656 E.01594
N2948 G1 X191.565 Y170.786 E1.39804
N2949 G1 X191.565 Y170.252 E.01594
N2950 G1 X158.435 Y137.122 E1.39804
N2951 G1 X158.435 Y136.588 E.01594
N2952 G1 X191.565 Y169.717 E1.39804
N2953 G1 X191.565 Y169.183 E.01594
N2954 G1 X158.435 Y136.054 E1.39804
N2955 G1 X158.435 Y135.52 E.01594
N2956 G1 X191.565 Y168.649 E1.39804
N2957 G1 X191.565 Y168.115 E.01594
N2958 G1 X158.435 Y134.985 E1.39804
N2959 G1 X158.435 Y134.451 E.01594
N2960 G1 X191.565 Y167.581 E1.39804
N2961 G1 X191.565 Y167.046 E.01594
N2962 G1 X158.435 Y133.917 E1.39804
N2963 G1 X158.435 Y133.383 E.01594
N2964 G1 X191.565 Y166.512 E1.39804
N2965 G1 X191.565 Y165.978 E.01594
N2966 G1 X158.435 Y132.849 E1.39804
N2967 G1 X158.435 Y132.314 E.01594
N2968 G1 X191.565 Y165.444 E1.39804
N2969 G1 X191.565 Y164.909 E.01594
N2970 G1 X158.435 Y131.78 E1.39804
N2971 G1 X158.435 Y131.246 E.01594
N2972 G1 X191.565 Y164.375 E1.39804
N2973 G1 X191.565 Y163.841 E.01594
N2974 G1 X158.435 Y130.712 E1.39804
N2975 G1 X158.435 Y130.177 E.01594
N2976 G1 X191.565 Y163.307 E1.39804
N2977 G1 X191.565 Y162.773 E.01594
N2978 G1 X158.435 Y129.643 E1.39804
N2979 G1 X158.435 Y129.109 E.01594
N2980 G1 X191.565 Y162.238 E1.39804
N2981 G1 X191.565 Y161.704 E.01594
N2982 G1 X158.435 Y128.575 E1.39804
N2983 G1 X158.435 Y128.041 E.01594
N2984 G1 X191.565 Y161.17 E1.39804
N2985 G1 X191.565 Y160.636 E.01594
N2986 G1 X158.435 Y127.506 E1.39804
N2987 G1 X158.435 Y126.972 E.01594
N2988 G1 X191.565 Y160.101 E1.39804
N2989 G1 X191.565 Y159.567 E.01594
N2990 G1 X158.553 Y126.556 E1.39308
N2991 G1 X159.087 Y126.556 E.01594
N2992 G1 X191.565 Y159.033 E1.37053
N2993 G1 X191.565 Y158.499 E.01594
N2994 G1 X159.621 Y126.556 E1.34799
N2995 G1 X160.156 Y126.556 E.01594
N2996 G1 X191.565 Y157.965 E1.32545
N2997 G1 X191.565 Y157.43 E.01594
N2998 G1 X160.69 Y126.556 E1.3029
N2999 G1 X161.224 Y126.556 E.01594
N3000 G1 X191.565 Y156.896 E1.28036
N3001 G1 X191.565 Y156.362 E.01594
N3002 G1 X161.758 Y126.556 E1.25781
N3003 G1 X162.293 Y126.556 E.01594
N3004 G1 X191.565 Y155.828 E1.23527
N3005 G1 X191.565 Y155.293 E.01594
N3006 G1 X162.827 Y126.556 E1.21273
N3007 G1 X163.361 Y126.556 E.01594
N3008 G1 X191.565 Y154.759 E1.19018
N3009 G1 X191.565 Y154.225 E.01594
N3010 G1 X163.895 Y126.556 E1.16764
N3011 G1 X164.429 Y126.556 E.01594
N3012 M73 P36 R31
N3013 G1 X191.565 Y153.691 E1.1451
N3014 G1 X191.565 Y153.157 E.01594
N3015 G1 X164.964 Y126.556 E1.12255
N3016 G1 X165.498 Y126.556 E.01594
N3017 G1 X191.565 Y152.622 E1.10001
N3018 G1 X191.565 Y152.088 E.01594
N3019 G1 X166.032 Y126.556 E1.07746
N3020 G1 X166.566 Y126.556 E.01594
N3021 G1 X191.565 Y151.554 E1.05492
N3022 G1 X191.565 Y151.02 E.01594
N3023 G1 X167.1 Y126.556 E1.03238
N3024 G1 X167.635 Y126.556 E.01594
N3025 G1 X191.565 Y150.486 E1.00983
N3026 G1 X191.565 Y149.951 E.01594
N3027 G1 X168.169 Y126.556 E.98729
N3028 G1 X168.703 Y126.556 E.01594
N3029 G1 X191.565 Y149.417 E.96475
N3030 G1 X191.565 Y148.883 E.01594
N3031 G1 X169.237 Y126.556 E.9422
N3032 G1 X169.772 Y126.556 E.01594
N3033 G1 X191.565 Y148.349 E.91966
N3034 G1 X191.565 Y147.814 E.01594
N3035 G1 X170.306 Y126.556 E.89711
N3036 G1 X170.84 Y126.556 E.01594
N3037 G1 X191.565 Y147.28 E.87457
N3038 G1 X191.565 Y146.746 E.01594
N3039 G1 X171.374 Y126.556 E.85203
N3040 G1 X171.908 Y126.556 E.01594
N3041 G1 X191.565 Y146.212 E.82948
N3042 G1 X191.565 Y145.678 E.01594
N3043 G1 X172.443 Y126.556 E.80694
N3044 G1 X172.977 Y126.556 E.01594
N3045 G1 X191.565 Y145.143 E.78439
N3046 G1 X191.565 Y144.609 E.01594
N3047 G1 X173.511 Y126.556 E.76185
N3048 G1 X174.045 Y126.556 E.01594
N3049 G1 X191.565 Y144.075 E.73931
N3050 G1 X191.565 Y143.541 E.01594
N3051 G1 X174.58 Y126.556 E.71676
N3052 G1 X175.114 Y126.556 E.01594
N3053 G1 X191.565 Y143.006 E.69422
N3054 G1 X191.565 Y142.472 E.01594
N3055 G1 X175.648 Y126.556 E.67168
N3056 G1 X176.182 Y126.556 E.01594
N3057 G1 X191.565 Y141.938 E.64913
N3058 G1 X191.565 Y141.404 E.01594
N3059 G1 X176.716 Y126.556 E.62659
N3060 G1 X177.251 Y126.556 E.01594
N3061 G1 X191.565 Y140.87 E.60404
N3062 G1 X191.565 Y140.335 E.01594
N3063 G1 X177.785 Y126.556 E.5815
N3064 G1 X178.319 Y126.556 E.01594
N3065 G1 X191.565 Y139.801 E.55896
N3066 G1 X191.565 Y139.267 E.01594
N3067 G1 X178.853 Y126.556 E.53641
N3068 G1 X179.388 Y126.556 E.01594
N3069 G1 X191.565 Y138.733 E.51387
N3070 G1 X191.565 Y138.198 E.01594
N3071 G1 X179.922 Y126.556 E.49133
N3072 G1 X180.456 Y126.556 E.01594
N3073 G1 X191.565 Y137.664 E.46878
N3074 G1 X191.565 Y137.13 E.01594
N3075 G1 X180.99 Y126.556 E.44624
N3076 G1 X181.524 Y126.556 E.01594
N3077 G1 X191.565 Y136.596 E.42369
N3078 G1 X191.565 Y136.062 E.01594
N3079 G1 X182.059 Y126.556 E.40115
N3080 G1 X182.593 Y126.556 E.01594
N3081 G1 X191.565 Y135.527 E.37861
N3082 G1 X191.565 Y134.993 E.01594
N3083 G1 X183.127 Y126.556 E.35606
N3084 G1 X183.661 Y126.556 E.01594
N3085 G1 X191.565 Y134.459 E.33352
N3086 G1 X191.565 Y133.925 E.01594
N3087 G1 X184.196 Y126.556 E.31098
N3088 G1 X184.73 Y126.556 E.01594
N3089 G1 X191.565 Y133.39 E.28843
N3090 G1 X191.565 Y132.856 E.01594
N3091 G1 X185.264 Y126.556 E.26589
N3092 G1 X185.798 Y126.556 E.01594
N3093 G1 X191.565 Y132.322 E.24334
N3094 G1 X191.565 Y131.788 E.01594
N3095 G1 X186.332 Y126.556 E.2208
N3096 G1 X186.867 Y126.556 E.01594
N3097 G1 X191.565 Y131.254 E.19826
N3098 G1 X191.565 Y130.719 E.01594
N3099 G1 X187.401 Y126.556 E.17571
N3100 G1 X187.935 Y126.556 E.01594
N3101 G1 X191.565 Y130.185 E.15317
N3102 G1 X191.565 Y129.651 E.01594
N3103 G1 X188.469 Y126.556 E.13063
N3104 G1 X189.003 Y126.556 E.01594
N3105 G1 X191.565 Y129.117 E.10808
N3106 G1 X191.565 Y128.583 E.01594
N3107 G1 X189.538 Y126.556 E.08554
N3108 G1 X190.072 Y126.556 E.01594
N3109 G1 X191.565 Y128.048 E.06299
N3110 G1 X191.565 Y127.514 E.01594
N3111 G1 X190.606 Y126.556 E.04045
N3112 G1 X191.14 Y126.556 E.01594
N3113 G1 X191.734 Y127.15 E.02507
N3114 ; WIPE_START
N3115 G1 X191.14 Y126.556 E-.31922
N3116 G1 X190.606 Y126.556 E-.203
N3117 G1 X191.049 Y126.998 E-.23778
N3118 ; WIPE_END
N3119 G1 E-.04 F1800
N3120 M204 S10000
N3121 G17
N3122 G3 Z1 I1.217 J0 P1  F60000
N3123 ; stop printing object, unique label id: 229
N3124 M625
N3125 ; object ids of layer 3 start: 229,239
N3126 M624 AwAAAAAAAAA=
N3127 ;======== H2D 20250527========
N3128 ; SKIPPABLE_START
N3129 ; SKIPTYPE: timelapse
N3130 M622.1 S1 ; for prev firware, default turned on
N3131 
N3132 M1002 judge_flag timelapse_record_flag
N3133 
N3134 M622 J1
N3135 M993 A2 B2 C2
N3136 M993 A0 B0 C0
N3137 
N3138 
N3139 
N3140 
N3141     M9711 M0 E1 X260 Y141 Z1 S11 C10 O0 T3000
N3142 
N3143 
N3144 
N3145 M993 A3 B3 C3
N3146 
N3147 M623
N3148 ; SKIPPABLE_END
N3149 
N3150 ; object ids of this layer3 end: 229,239
N3151 M625
N3152 G1 X195.495 Y279.064
N3153 G1 Z.6
N3154 G1 E.8 F1800
N3155 ; LAYER_HEIGHT: 0.200000
N3156 ; FEATURE: Prime tower
N3157 ; LINE_WIDTH: 0.500000
N3158 ; WIPE_TOWER_START
N3159 M204 S10000
N3160 G1  X195.995 Y279.564  
N3161 M204 S8000
N3162 G3  X193.533 Y281.605   I-4.373 J-2.768 E0.1236 F3938
N3163 G3  X190.885 Y280.355   I0.012 J-3.454 E0.1149
N3164 G2  X188.182 Y279.564   I-2.709 J4.247 E0.1085
N3165 G2  X174.618 Y279.568   I-6.687 J357.435 E0.5155
N3166 G2  X170.683 Y281.445   I0.499 J6.110 E0.1694
N3167 G3  X168.371 Y281.015   I-0.854 J-1.838 E0.0953
N3168 G1  X166.995 Y279.564   E0.0760
N3169 G3  X165.064 Y277.242   I3.871 J-5.183 E0.1159
N3170 G3  X166.240 Y274.649   I2.902 J-0.247 E0.1130
N3171 G2  X166.995 Y272.245   I-3.465 J-2.409 E0.0972
N3172 G2  X166.992 Y259.212   I-321.195 J-6.431 E0.4954
N3173 G2  X165.146 Y255.634   I-6.663 J1.171 E0.1554
N3174 G3  X165.485 Y253.656   I1.658 J-0.734 E0.0808
N3175 G1  X168.371 Y250.613   E0.1594
N3176 G3  X171.793 Y251.056   I1.525 J1.652 E0.1495
N3177 G2  X174.808 Y252.064   I3.021 J-4.025 E0.1229
N3178 G2  X188.372 Y252.060   I6.687 J-357.435 E0.5155
N3179 G2  X192.307 Y250.183   I-0.499 J-6.110 E0.1694
N3180 G3  X194.619 Y250.613   I0.854 J1.838 E0.0953
N3181 G1  X195.609 Y251.657   E0.0547
N3182 G1 E-0.8000 F1800
N3183 M204 S10000
N3184 G1  X197.329 Y253.471   F600
N3185 G1 E0.8000 F1800
N3186 M204 S8000
N3187 G3  X196.957 Y256.707   I-1.339 J1.486 E0.1447 F3938
N3188 G2  X195.995 Y259.382   I3.254 J2.680 E0.1102
N3189 G2  X195.998 Y272.416   I321.212 J6.432 E0.4954
N3190 G2  X197.844 Y275.994   I6.663 J-1.171 E0.1554
N3191 G3  X197.504 Y277.972   I-1.658 J0.734 E0.0808
N3192 G1  X195.995 Y279.564   E0.0834
N3193 ; WIPE_TOWER_END
N3194 G1  X195.495 Y252.064  
N3195 ; LAYER_HEIGHT: 0.200000
N3196 ; FEATURE: Prime tower
N3197 ; LINE_WIDTH: 0.500000
N3198 ; WIPE_TOWER_START
N3199 M204 S8000
N3200 G1  X167.495  E1.0642
N3201 G1  Y272.314  E0.2565
N3202 G1  X195.495  E1.0642
N3203 G1  Y279.064  E0.2565
N3204 M204 S10000
N3205 M73 P36 R30
N3206 G1  X168.495 Y272.314  
N3207 ;--------------------
N3208 ; CP EMPTY GRID START
N3209 ; layer #4
N3210 M204 S8000
N3211 G1  Y279.064  E0.2565
N3212 M204 S10000
N3213 G1  X177.162 
N3214 M204 S8000
N3215 G1  Y272.314  E0.2565
N3216 M204 S10000
N3217 G1  X185.828 
N3218 M204 S8000
N3219 G1  Y279.064  E0.2565
N3220 M204 S10000
N3221 G1  X194.495 
N3222 M204 S8000
N3223 G1  Y272.314  E0.2565
N3224 ; CP EMPTY GRID END
N3225 ;------------------
N3226 
N3227 
N3228 
N3229 
N3230 
N3231 
N3232 ; WIPE_TOWER_END
N3233 ; LAYER_HEIGHT: 0.200000
N3234 ; FEATURE: Prime tower
N3235 ; LINE_WIDTH: 0.500000
N3236 ;--------------------
N3237 ; CP TOOLCHANGE START
N3238 ; toolchange #3
N3239 ; material : TPU -> TPU
N3240 ;--------------------
N3241 M220 B
N3242 M220 S100
N3243 ; WIPE_TOWER_START
N3244 G1 E-.8 F1800
N3245 G17
N3246 G3 Z1 I1.217 J0 P1  F60000
N3247 G1 X167.745 Y266.314
N3248 G1 Z.6
N3249 G1 E.8 F1800
N3250 ; LAYER_HEIGHT: 0.200000
N3251 ; FEATURE: Prime tower
N3252 ; LINE_WIDTH: 1.000000
N3253 ; NOZZLE_CHANGE_START OF0 NF1
N3254 M204 S8000
N3255 G1  X195.245 Y266.314  E2.1885 F1881
N3256 G1  Y267.564  E0.0995
N3257 G1  X167.745  E2.1885
N3258 G1  Y268.814  E0.0995
N3259 G1  X195.245  E2.1885
N3260 G1  Y270.064  E0.0995
N3261 G1  X167.745  E2.1885
N3262 G1  Y271.314  E0.0995
N3263 G1  X195.245  E2.1885
N3264 ; NOZZLE_CHANGE_END OF0 NF1
N3265 M104 T1 S153 N0 ;Multi extruder pre cooling
N3266 
N3267 ; WIPE_START
N3268 G1 F5400
N3269 M204 S8000
N3270 G1 X193.245 Y271.314 E-1.9
N3271 ; WIPE_END
N3272 G1 E-.1 F1800
N3273 M204 S10000
N3274 G17
N3275 G3 Z1 I1.217 J0 P1  F5400
N3276 ; filament end gcode 
N3277 
N3278 ;======== H2D ========
N3279 ;===== 20250604 =====
N3280 M993 A2 B2 C2 ; nozzle cam detection allow status save.
N3281 M993 A0 B0 C0 ; nozzle cam detection not allowed.
N3282 
N3283 
N3284 M1015.4 S0 ; disable E air printing detect
N3285 
N3286 
N3287 M620 S1A
N3288 M1002 gcode_claim_action : 4
N3289 M204 S9000
N3290 
N3291 G1 Z3.6 F1200
N3292 
N3293 M400
N3294 M106 P1 S0
N3295 M106 P2 S0
N3296 
N3297 
N3298 
N3299 
N3300 M620.10 A0 F149.669 L0 H0.4 T270 P255 S1
N3301 
N3302 
N3303 
N3304 M620.10 A1 F79.8237 L0 H0.4 T250 P240 S1
N3305 
N3306 
N3307 
N3308 M620.11 P0 I0 E0
N3309 
N3310 
N3311 
N3312 M620.11 K1 I0 R10 F200
N3313 
N3314 
N3315 M628 S1
N3316 
N3317 
N3318 M620.11 S1 L0 I0 R10 D8 E-10 F200
N3319 
N3320 
N3321 M629
N3322 
N3323 
N3324 M620.11 H2 C331
N3325 
N3326 
N3327 T1
N3328 M73 E3
N3329 
N3330 ;deretract
N3331 
N3332 
N3333 
N3334 ; VFLUSH_START
N3335 
N3336 
N3337 ;VG1 E0 F79
N3338 
N3339 
N3340 SYNC T0
N3341 
N3342 ; VFLUSH_END
N3343 
N3344 M1002 set_filament_type:TPU
N3345 
N3346 M400
N3347 M83
N3348 
N3349 
N3350 
N3351 M628 S0
N3352 ;VM109 S240
N3353 M629
N3354 M400
N3355 
N3356 M983.3 F1.33333 A0.4
N3357 
N3358 
N3359 M400
N3360 
N3361 G1 Y320 F30000
N3362 G1 X201
N3363 
N3364 M73 P37 R30
N3365 G1 Y295
N3366 G1 Y265 F18000
N3367 G1 Z3.6 F3000
N3368 
N3369 M204 S8000
N3370 
N3371 
N3372 M621 S1A
N3373 
N3374 M993 A3 B3 C3 ; nozzle cam detection allow status restore.
N3375 
N3376 
N3377 M1015.3 S1;enable tpu clog detect
N3378 
N3379 
N3380 
N3381 M1015.4 S0 ; disable E air printing detect
N3382 
N3383 
N3384 M620.6 I1 W1 ;enable ams air printing detect
N3385 M1002 gcode_claim_action : 0
N3386 M106 S255
N3387 M106 P2 S255
N3388 G1 X200 Y252.564 F60000
N3389 G1 Z.6
N3390 G1 X195.495 Y252.564 Z1
N3391 
N3392 ; filament start gcode
N3393 G1 Z.6
N3394 G1 E2 F1800
N3395 
N3396 G4 S0
N3397 ; CP TOOLCHANGE WIPE
N3398 ; LINE_WIDTH: 0.500000
N3399 M204 S8000
N3400 G1  X192.495 Y252.564  E0.1140 F1782
N3401 G1 E-0.8000 F1800
N3402 M204 S10000
N3403 G1  X196.995  F600
N3404 G1  X195.495  F240
N3405 G1  X195.995  F600
N3406 G1  Y253.064 
N3407 G1  X194.995 
N3408 G1  Y252.064 
N3409 G1  X196.495 
N3410 G1  Y253.564 
N3411 G1  X194.495 
N3412 G1  Y251.564 
N3413 G1  X192.495 Y252.564   F1782
N3414 G1 E0.8000 F1800
N3415 M204 S8000
N3416 G1  X167.495  E0.9502 F1782
N3417 G1  Y253.314  E0.0285
N3418 G1  X195.495  E1.0642 F2025
N3419 G1  Y254.064  E0.0285
N3420 G1  X167.495  E1.0642 F2100
N3421 G1  Y254.814  E0.0285
N3422 G1  X195.495  E1.0642
N3423 G1  Y255.564  E0.0285
N3424 G1  X167.495  E1.0642
N3425 G1  Y256.314  E0.0285
N3426 G1  X195.495  E1.0642
N3427 G1  Y257.064  E0.0285
N3428 G1  X167.495  E1.0642
N3429 G1  Y257.814  E0.0285
N3430 G1  X195.495  E1.0642
N3431 G1  Y258.564  E0.0285
N3432 G1  X167.495  E1.0642
N3433 G1  Y259.314  E0.0285
N3434 G1  X195.495  E1.0642
N3435 G1  Y260.064  E0.0285
N3436 G1  X167.495  E1.0642
N3437 G1  Y260.814  E0.0285
N3438 G1  X195.495  E1.0642
N3439 G1  Y261.564  E0.0285
N3440 G1  X167.495  E1.0642
N3441 G1  Y262.314  E0.0285
N3442 G1  X195.495  E1.0642
N3443 G1  Y263.064  E0.0285
N3444 G1  X167.495  E1.0642
N3445 G1  Y263.814  E0.0285
N3446 G1  X195.495  E1.0642
N3447 G1  Y264.564  E0.0285
N3448 G1  X167.495  E1.0642
N3449 G1  Y265.314  E0.0285
N3450 G1  X195.495  E1.0642
N3451 ; WIPE_TOWER_END
N3452 M220 R
N3453 G1 F60000
N3454 G4 S0
N3455 G92 E0
N3456 ; CP TOOLCHANGE END
N3457 ;------------------
N3458 
N3459 
N3460 
N3461 ; WIPE_START
N3462 G1 F5400
N3463 M204 S8000
N3464 G1 X193.495 Y265.314 E-.76
N3465 ; WIPE_END
N3466 G1 E-.04 F1800
N3467 M204 S10000
N3468 G17
N3469 G3 Z1 I1.217 J0 P1  F60000
N3470 ; OBJECT_ID: 239
N3471 ; COOLING_NODE: 0
N3472 ; start printing object, unique label id: 239
N3473 M624 AgAAAAAAAAA=
N3474 G1 X182.34 Y118.735
N3475 G1 Z.6
N3476 G1 E.8 F1800
N3477 ; FEATURE: Outer wall
N3478 ; LINE_WIDTH: 0.42
N3479 ; LAYER_HEIGHT: 0.2
N3480 G1 F2545.881
N3481 M204 S5000
N3482 G1 X167.76 Y118.735 E.45715
N3483 G1 X167.76 Y118.155 E.01819
N3484 G1 X182.34 Y118.155 E.45715
N3485 G1 X182.34 Y118.675 E.0163
N3486 M204 S10000
N3487 G1 X182.144 Y118.445 F60000
N3488 ; FEATURE: Gap infill
N3489 ; LINE_WIDTH: 0.23088
N3490 G1 F5107.47
N3491 M204 S8000
N3492 G1 X167.956 Y118.445 E.22174
N3493 ; CHANGE_LAYER
N3494 ; Z_HEIGHT: 0.8
N3495 ; LAYER_HEIGHT: 0.2
N3496 ; WIPE_START
N3497 G1 F5107.47
N3498 G1 X169.956 Y118.445 E-.76
N3499 ; WIPE_END
N3500 G1 E-.04 F1800
N3501 ; stop printing object, unique label id: 239
N3502 M625
N3503 ;======== H2D 20250521========
N3504 ; layer num/total_layer_count: 4/63
N3505 ; update layer progress
N3506 M73 L4
N3507 M991 S0 P3 ;notify layer change
N3508 
N3509 
N3510 ; OBJECT_ID: 239
N3511 ; COOLING_NODE: 0
N3512 ; start printing object, unique label id: 239
N3513 M624 AgAAAAAAAAA=
N3514 M204 S10000
N3515 G17
N3516 G3 Z1 I-.028 J1.217 P1  F60000
N3517 G1 X182.34 Y118.735 Z1
N3518 G1 Z.8
N3519 G1 E.8 F1800
N3520 ; FEATURE: Outer wall
N3521 ; LINE_WIDTH: 0.42
N3522 ; LAYER_HEIGHT: 0.2
N3523 G1 F2545.881
N3524 M204 S5000
N3525 G1 X167.76 Y118.735 E.45715
N3526 G1 X167.76 Y118.155 E.01819
N3527 G1 X182.34 Y118.155 E.45715
N3528 G1 X182.34 Y118.675 E.0163
N3529 M204 S10000
N3530 G1 X182.144 Y118.445 F60000
N3531 ; FEATURE: Gap infill
N3532 ; LINE_WIDTH: 0.23088
N3533 G1 F5107.47
N3534 M204 S8000
N3535 G1 X167.956 Y118.445 E.22174
N3536 ; WIPE_START
N3537 G1 X169.956 Y118.445 E-.76
N3538 ; WIPE_END
N3539 G1 E-.04 F1800
N3540 ; stop printing object, unique label id: 239
N3541 M625
N3542 M204 S10000
N3543 G17
N3544 G3 Z1.2 I-1.217 J-.02 P1  F60000
N3545 G1 X167.495 Y265.564 Z1.2
N3546 G1 Z.8
N3547 G1 E.8 F1800
N3548 ; LAYER_HEIGHT: 0.200000
N3549 ; FEATURE: Prime tower
N3550 ; LINE_WIDTH: 0.500000
N3551 ; WIPE_TOWER_START
N3552 M204 S8000
N3553 G1  X167.495 Y260.064  E0.2090 F2100
N3554 G1  X195.495  E1.0642
N3555 G1  Y265.564  E0.2090
N3556 G1  X167.495  E1.0642
N3557 M204 S10000
N3558 G1  X168.495 Y260.064  
N3559 ;--------------------
N3560 ; CP EMPTY GRID START
N3561 ; layer #5
N3562 M204 S8000
N3563 G1  Y265.564  E0.2090
N3564 M204 S10000
N3565 G1  X177.162 
N3566 M204 S8000
N3567 G1  Y260.064  E0.2090
N3568 M204 S10000
N3569 G1  X185.828 
N3570 M204 S8000
N3571 G1  Y265.564  E0.2090
N3572 M204 S10000
N3573 G1  X194.495 
N3574 M204 S8000
N3575 G1  Y260.064  E0.2090
N3576 ; CP EMPTY GRID END
N3577 ;------------------
N3578 
N3579 
N3580 
N3581 
N3582 
N3583 
N3584 ; WIPE_TOWER_END
N3585 ; LAYER_HEIGHT: 0.200000
N3586 ; FEATURE: Prime tower
N3587 ; LINE_WIDTH: 0.500000
N3588 ;--------------------
N3589 ; CP TOOLCHANGE START
N3590 ; toolchange #4
N3591 ; material : PCTG -> PCTG
N3592 ;--------------------
N3593 M220 B
N3594 M220 S100
N3595 ; WIPE_TOWER_START
N3596 G1 E-.8 F1800
N3597 G17
N3598 G3 Z1.2 I1.217 J0 P1  F60000
N3599 G1 X167.745 Y252.814 Z.8
N3600 G1 E.8 F1800
N3601 ; LAYER_HEIGHT: 0.200000
N3602 ; FEATURE: Prime tower
N3603 ; LINE_WIDTH: 1.000000
N3604 ; NOZZLE_CHANGE_START OF1 NF0
N3605 M104 T0 S210 N0 ;Multi extruder pre cooling in post extrusion
N3606 M204 S8000
N3607 G1  X195.245 Y252.814  E2.1885 F251
N3608 G1  Y254.314  E0.1194
N3609 G1  X167.745  E2.1885
N3610 G1  Y255.814  E0.1194
N3611 M73 P38 R30
N3612 G1  X195.245  E2.1885
N3613 G1  Y257.314  E0.1194
N3614 M104 T1 S255 N0 ;Multi extruder pre heating
N3615 G1  X167.745  E2.1885
N3616 G1  Y258.814  E0.1194
N3617 G1  X195.245  E2.1885
N3618 M204 S10000
N3619 G1  Y259.814 
N3620 M73 P38 R29
N3621 G1  X168.245  F398
N3622 G1  Y258.314 
N3623 M73 P39 R29
N3624 G1  X194.745 
N3625 G1  Y256.814 
N3626 G1  X168.245 
N3627 G1  Y255.314 
N3628 G1  X194.745 
N3629 G1  Y253.814 
N3630 G1  X168.245 
N3631 ; NOZZLE_CHANGE_END OF1 NF0
N3632 M104 T0 S126 N0 ;Multi extruder pre cooling
N3633 
N3634 G1 E-2 F1800
N3635 G17
N3636 G3 Z1.2 I1.217 J0 P1  F5400
N3637 ; filament end gcode 
N3638 
N3639 ;======== H2D ========
N3640 ;===== 20250604 =====
N3641 M993 A2 B2 C2 ; nozzle cam detection allow status save.
N3642 M993 A0 B0 C0 ; nozzle cam detection not allowed.
N3643 
N3644 
N3645 M1015.4 S0 ; disable E air printing detect
N3646 
N3647 
N3648 M620 S0A
N3649 M1002 gcode_claim_action : 4
N3650 M204 S9000
N3651 
N3652 G1 Z3.8 F1200
N3653 
N3654 M400
N3655 M106 P1 S0
N3656 M106 P2 S0
N3657 
N3658 
N3659 
N3660 
N3661 M620.10 A0 F79.8237 L0 H0.4 T250 P240 S1
N3662 
N3663 
N3664 
N3665 M620.10 A1 F149.669 L0 H0.4 T270 P255 S1
N3666 
N3667 
N3668 
N3669 M620.11 P0 I1 E0
N3670 
N3671 
N3672 
N3673 M620.11 K1 I1 R0 F200
N3674 
N3675 
N3676 M628 S1
N3677 
N3678 M620.11 S0 L0 I1 E-10 F200
N3679 
N3680 M629
N3681 
N3682 
N3683 M620.11 H2 C331
N3684 
N3685 
N3686 T0
N3687 M73 E2
N3688 
N3689 ;deretract
N3690 
N3691 
N3692 ;VG1 E4 F200
N3693 ;VG1 E4 F100
N3694 
N3695 
N3696 
N3697 ; VFLUSH_START
N3698 
N3699 
N3700 ;VG1 E0 F79
N3701 
N3702 
N3703 SYNC T0
N3704 
N3705 ; VFLUSH_END
N3706 
N3707 M1002 set_filament_type:PCTG
N3708 
N3709 M400
N3710 M83
N3711 
N3712 
N3713 
N3714 M628 S0
N3715 ;VM109 S255
N3716 M629
N3717 M400
N3718 
N3719 M983.3 F2.5 A0.4
N3720 
N3721 
N3722 M400
N3723 
N3724 G1 Y320 F30000
N3725 M73 P40 R29
N3726 G1 X201
N3727 
N3728 G1 Y295
N3729 G1 Y265 F18000
N3730 G1 Z3.8 F3000
N3731 
N3732 M204 S8000
N3733 
N3734 
N3735 M621 S0A
N3736 
N3737 M993 A3 B3 C3 ; nozzle cam detection allow status restore.
N3738 
N3739 
N3740 M1015.3 S0;disable tpu clog detect
N3741 
N3742 
N3743 
N3744 M1015.4 S0 ; disable E air printing detect
N3745 
N3746 
N3747 M620.6 I0 W1 ;enable ams air printing detect
N3748 M1002 gcode_claim_action : 0
N3749 M106 S25.5
N3750 M106 P2 S0
N3751 G1 X200 Y265.364 F60000
N3752 G1 Z.8
N3753 G1 X200 Y272.996 Z1.2
N3754 G1 X200 Y283.638 Z1.2
N3755 G1 X162.991 Y283.638
N3756 G1 X162.991 Y278.814
N3757 G1 X167.495 Y278.814
N3758 
N3759 ; filament start gcode
N3760 G1 Z.8
N3761 G1 E2 F1800
N3762 
N3763 G4 S0
N3764 ; CP TOOLCHANGE WIPE
N3765 ; LINE_WIDTH: 0.500000
N3766 M204 S8000
N3767 G1  X170.495 Y278.814  E0.1140 F1782
N3768 G1 E-0.8000 F1800
N3769 M204 S10000
N3770 G1  X165.995  F600
N3771 G1  X167.495  F240
N3772 G1  X167.995  F600
N3773 G1  Y279.314 
N3774 G1  X166.995 
N3775 G1  Y278.314 
N3776 G1  X168.495 
N3777 G1  Y279.814 
N3778 G1  X166.495 
N3779 G1  Y277.814 
N3780 G1  X170.495 Y278.814   F1782
N3781 G1 E0.8000 F1800
N3782 M204 S8000
N3783 G1  X195.495  E0.9502 F1782
N3784 G1  Y278.064  E0.0285
N3785 G1  X167.495  E1.0642 F2025
N3786 G1  Y277.314  E0.0285
N3787 G1  X195.495  E1.0642 F2473
N3788 G1  Y276.564  E0.0285
N3789 G1  X167.495  E1.0642 F3938
N3790 G1  Y275.814  E0.0285
N3791 G1  X195.495  E1.0642
N3792 G1  Y275.064  E0.0285
N3793 G1  X167.495  E1.0642
N3794 G1  Y274.314  E0.0285
N3795 G1  X195.495  E1.0642
N3796 G1  Y273.564  E0.0285
N3797 G1  X167.495  E1.0642
N3798 G1  Y272.814  E0.0285
N3799 G1  X195.495  E1.0642
N3800 G1  Y272.064  E0.0285
N3801 G1  X167.495  E1.0642
N3802 G1  Y271.314  E0.0285
N3803 G1  X195.495  E1.0642
N3804 G1  Y270.564  E0.0285
N3805 G1  X167.495  E1.0642
N3806 G1  Y269.814  E0.0285
N3807 G1  X195.495  E1.0642
N3808 G1  Y269.064  E0.0285
N3809 G1  X167.495  E1.0642
N3810 G1  Y268.314  E0.0285
N3811 G1  X195.495  E1.0642
N3812 G1  Y267.564  E0.0285
N3813 G1  X167.495  E1.0642
N3814 G1  Y266.814  E0.0285
N3815 G1  X195.495  E1.0642
N3816 G1  Y266.064  E0.0285
N3817 G1  X167.495  E1.0642
N3818 ; WIPE_TOWER_END
N3819 M220 R
N3820 G1 F60000
N3821 G4 S0
N3822 G92 E0
N3823 ; CP TOOLCHANGE END
N3824 ;------------------
N3825 
N3826 
N3827 G1  Y252.064  
N3828 ; LAYER_HEIGHT: 0.200000
N3829 ; FEATURE: Prime tower
N3830 ; LINE_WIDTH: 0.500000
N3831 ; WIPE_TOWER_START
N3832 M204 S10000
N3833 G1  X168.371 Y281.015  
N3834 M204 S8000
N3835 G1  X167.144 Y279.721   E0.0678 F3938
N3836 G1 E-0.8000 F1800
N3837 M204 S10000
N3838 G1  X165.426 Y277.905   F600
N3839 G1 E0.8000 F1800
N3840 M204 S8000
N3841 G3  X166.033 Y274.920   I1.593 J-1.230 E0.1313 F3938
N3842 G2  X166.995 Y272.245   I-3.254 J-2.680 E0.1102
N3843 G2  X166.992 Y259.212   I-321.195 J-6.431 E0.4954
N3844 G2  X165.146 Y255.634   I-6.663 J1.171 E0.1554
N3845 G3  X165.485 Y253.656   I1.658 J-0.734 E0.0808
N3846 G3  X168.604 Y250.403   I19.398 J15.476 E0.1715
N3847 G3  X171.793 Y251.056   I1.276 J1.879 E0.1379
N3848 G2  X174.808 Y252.064   I3.021 J-4.025 E0.1229
N3849 G2  X188.372 Y252.060   I6.687 J-357.435 E0.5155
N3850 G2  X192.307 Y250.183   I-0.499 J-6.110 E0.1694
N3851 G3  X194.619 Y250.613   I0.854 J1.838 E0.0953
N3852 G1  X195.995 Y252.064   E0.0760
N3853 G1 E0.0000
N3854 G3  X197.926 Y254.386   I-3.871 J5.182 E0.1159
N3855 G3  X196.750 Y256.979   I-2.902 J0.247 E0.1130
N3856 G2  X195.995 Y259.382   I3.464 J2.409 E0.0972
N3857 G2  X195.998 Y272.416   I321.212 J6.432 E0.4954
N3858 G2  X197.844 Y275.994   I6.663 J-1.171 E0.1554
N3859 G3  X197.504 Y277.972   I-1.658 J0.734 E0.0808
N3860 G1  X195.995 Y279.564   E0.0834
N3861 G3  X193.533 Y281.605   I-4.373 J-2.768 E0.1236
N3862 G3  X190.885 Y280.355   I0.012 J-3.454 E0.1149
N3863 G2  X188.182 Y279.564   I-2.709 J4.247 E0.1085
N3864 G2  X174.618 Y279.568   I-6.687 J357.435 E0.5155
N3865 G2  X170.683 Y281.445   I0.499 J6.110 E0.1694
N3866 G3  X168.371 Y281.015   I-0.854 J-1.838 E0.0953
N3867 ; WIPE_TOWER_END
N3868 
N3869 ; WIPE_START
N3870 G1 F5107.47
N3871 M204 S8000
N3872 G1 X168.484 Y281.125 E-.05968
N3873 G1 X168.604 Y281.225 E-.05967
N3874 G1 X168.733 Y281.316 E-.05968
N3875 G1 X168.868 Y281.396 E-.05968
N3876 G1 X169.008 Y281.466 E-.05967
N3877 G1 X169.154 Y281.524 E-.05967
N3878 G1 X169.304 Y281.571 E-.05967
N3879 G1 X169.457 Y281.605 E-.05968
N3880 G1 X169.613 Y281.628 E-.05967
N3881 G1 X169.769 Y281.638 E-.05968
N3882 G1 X169.927 Y281.636 E-.05968
N3883 G1 X170.083 Y281.622 E-.05967
N3884 G1 X170.197 Y281.603 E-.04391
N3885 ; WIPE_END
N3886 G1 E-.04 F1800
N3887 M204 S10000
N3888 G17
N3889 G3 Z1.2 I1.217 J0 P1  F60000
N3890 ; OBJECT_ID: 229
N3891 ; COOLING_NODE: 0
N3892 ; start printing object, unique label id: 229
N3893 M624 AQAAAAAAAAA=
N3894 G1 X191.898 Y201.453 Z.8
N3895 G1 E.8 F1800
N3896 ; FEATURE: Inner wall
N3897 ; LINE_WIDTH: 0.45
N3898 ; LAYER_HEIGHT: 0.2
N3899 G1 F4421.739
N3900 M204 S8000
N3901 G1 X158.102 Y201.453 E1.08675
N3902 G1 X158.102 Y126.222 E2.41914
N3903 G1 X191.898 Y126.222 E1.08675
N3904 G1 X191.898 Y201.393 E2.41721
N3905 ; COOLING_NODE: 0
N3906 M204 S10000
N3907 G1 X192.29 Y201.845 F60000
N3908 ; FEATURE: Outer wall
N3909 ; LINE_WIDTH: 0.42
N3910 G1 F4773.528
N3911 M204 S5000
N3912 G1 X157.71 Y201.845 E1.03002
N3913 M73 P40 R28
N3914 G1 X157.71 Y125.83 E2.26421
N3915 G1 X192.29 Y125.83 E1.03002
N3916 G1 X192.29 Y201.785 E2.26243
N3917 ; WIPE_START
N3918 M204 S8000
N3919 G1 X190.29 Y201.788 E-.76
N3920 ; WIPE_END
N3921 G1 E-.04 F1800
N3922 M204 S10000
N3923 G1 X182.66 Y201.586 Z1.2 F60000
N3924 G1 X164.429 Y201.104 Z1.2
N3925 G1 Z.8
N3926 G1 E.8 F1800
N3927 ; FEATURE: Sparse infill
N3928 ; LINE_WIDTH: 0.45
N3929 G1 F4421.739
N3930 M204 S8000
N3931 G1 X184.4 Y126.571 E2.48129
N3932 G1 X184.589 Y126.571 E.00607
N3933 G1 X191.55 Y133.531 E.31655
N3934 G1 X191.55 Y134.702 E.03765
N3935 G1 X158.45 Y143.571 E1.1019
N3936 G1 X158.45 Y146.488 E.09379
N3937 G1 X191.55 Y179.587 E1.50523
N3938 G1 X191.55 Y176.846 E.08814
N3939 G1 X158.45 Y185.715 E1.1019
N3940 G1 X158.45 Y187.343 E.05236
N3941 M204 S10000
N3942 G1 X158.45 Y195.772 F60000
N3943 G1 F4421.739
N3944 M204 S8000
N3945 G1 X158.45 Y194.144 E.05236
N3946 G1 X191.55 Y185.275 E1.1019
N3947 G1 X191.55 Y191.101 E.18735
N3948 G1 X158.45 Y158.002 E1.50523
N3949 G1 X158.45 Y152 E.19299
N3950 G1 X191.55 Y143.131 E1.1019
N3951 G1 X191.55 Y145.045 E.06156
N3952 G1 X173.075 Y126.571 E.84016
N3953 G1 X175.971 Y126.571 E.09314
N3954 G1 X158.45 Y191.959 E2.17684
N3955 G1 X158.45 Y192.544 E.01878
N3956 M73 P41 R28
N3957 G1 X167.011 Y201.104 E.38931
N3958 G1 X172.858 Y201.104 E.188
N3959 G1 X191.55 Y131.344 E2.32237
N3960 G1 X191.55 Y126.571 E.15351
N3961 G1 X190.441 Y126.571 E.03565
N3962 G1 X158.45 Y135.142 E1.06499
N3963 G1 X158.45 Y134.974 E.00542
N3964 G1 X191.55 Y168.073 E1.50523
N3965 G1 X191.55 Y168.417 E.01107
N3966 G1 X158.45 Y177.286 E1.1019
N3967 G1 X158.45 Y181.03 E.12037
N3968 G1 X178.525 Y201.104 E.91292
N3969 G1 X181.286 Y201.104 E.08879
N3970 G1 X191.55 Y162.801 E1.27515
N3971 G1 X191.55 Y159.989 E.09043
N3972 G1 X158.45 Y168.858 E1.1019
N3973 G1 X158.45 Y169.516 E.02116
N3974 G1 X190.039 Y201.104 E1.43653
N3975 G1 X189.715 Y201.104 E.01042
N3976 G1 X191.55 Y194.258 E.22793
N3977 G1 X191.55 Y193.704 E.01781
N3978 G1 X163.93 Y201.104 E.91947
N3979 G1 X162.302 Y201.104 E.05236
N3980 M204 S10000
N3981 G1 X158.45 Y130.674 F60000
N3982 G1 F4421.739
N3983 M204 S8000
N3984 G1 X158.45 Y129.046 E.05236
N3985 M104 T0 S240 N0 ;Multi extruder pre heating
N3986 G1 X159.114 Y126.571 E.08241
N3987 G1 X161.561 Y126.571 E.0787
N3988 G1 X191.55 Y156.559 E1.36377
N3989 G1 X191.55 Y151.56 E.16076
N3990 G1 X158.45 Y160.429 E1.1019
N3991 G1 X158.45 Y160.503 E.00238
N3992 G1 X167.542 Y126.571 E1.12963
N3993 G1 X165.914 Y126.571 E.05236
N3994 ; WIPE_START
N3995 G1 X167.542 Y126.571 E-.61876
N3996 G1 X167.446 Y126.93 E-.14124
N3997 ; WIPE_END
N3998 G1 E-.04 F1800
N3999 M204 S10000
N4000 G17
N4001 G3 Z1.2 I1.217 J0 P1  F60000
N4002 ; stop printing object, unique label id: 229
N4003 M625
N4004 ; object ids of layer 4 start: 229,239
N4005 M624 AwAAAAAAAAA=
N4006 ;======== H2D 20250527========
N4007 ; SKIPPABLE_START
N4008 ; SKIPTYPE: timelapse
N4009 M622.1 S1 ; for prev firware, default turned on
N4010 
N4011 M1002 judge_flag timelapse_record_flag
N4012 
N4013 M622 J1
N4014 M993 A2 B2 C2
N4015 M993 A0 B0 C0
N4016 
N4017 
N4018 
N4019 
N4020     M9711 M0 E1 X260 Y141 Z1.2 S11 C10 O0 T3000
N4021 
N4022 
N4023 
N4024 M993 A3 B3 C3
N4025 
N4026 M623
N4027 ; SKIPPABLE_END
N4028 
N4029 ; object ids of this layer4 end: 229,239
N4030 M625
N4031 ; CHANGE_LAYER
N4032 ; Z_HEIGHT: 1
N4033 ; LAYER_HEIGHT: 0.2
N4034 ;======== H2D 20250521========
N4035 ; layer num/total_layer_count: 5/63
N4036 ; update layer progress
N4037 M73 L5
N4038 M991 S0 P4 ;notify layer change
N4039 
N4040 
N4041 ; OBJECT_ID: 229
N4042 ; COOLING_NODE: 0
N4043 ; start printing object, unique label id: 229
N4044 M624 AQAAAAAAAAA=
N4045 G1 X191.898 Y201.453 F60000
N4046 G1 Z1
N4047 G1 E.8 F1800
N4048 ; FEATURE: Inner wall
N4049 ; LINE_WIDTH: 0.45
N4050 ; LAYER_HEIGHT: 0.2
N4051 G1 F4421.739
N4052 M204 S8000
N4053 G1 X158.102 Y201.453 E1.08675
N4054 G1 X158.102 Y126.222 E2.41914
N4055 G1 X191.898 Y126.222 E1.08675
N4056 G1 X191.898 Y201.393 E2.41721
N4057 ; COOLING_NODE: 0
N4058 M204 S10000
N4059 G1 X192.29 Y201.845 F60000
N4060 ; FEATURE: Outer wall
N4061 ; LINE_WIDTH: 0.42
N4062 G1 F4773.528
N4063 M204 S5000
N4064 G1 X157.71 Y201.845 E1.03002
N4065 G1 X157.71 Y125.83 E2.26421
N4066 G1 X192.29 Y125.83 E1.03002
N4067 G1 X192.29 Y201.785 E2.26243
N4068 ; WIPE_START
N4069 M204 S8000
N4070 G1 X190.29 Y201.788 E-.76
N4071 ; WIPE_END
N4072 G1 E-.04 F1800
N4073 M204 S10000
N4074 G1 X182.784 Y200.405 Z1.4 F60000
N4075 G1 X158.45 Y195.919 Z1.4
N4076 G1 Z1
N4077 G1 E.8 F1800
N4078 ; FEATURE: Sparse infill
N4079 ; LINE_WIDTH: 0.45
N4080 G1 F4421.739
N4081 M204 S8000
N4082 G1 X158.45 Y194.29 E.05236
N4083 G1 X191.55 Y185.421 E1.1019
N4084 G1 X191.55 Y190.901 E.17621
N4085 G1 X158.45 Y157.802 E1.50523
N4086 G1 X158.45 Y152.146 E.18186
N4087 G1 X191.55 Y143.277 E1.1019
N4088 G1 X191.55 Y144.845 E.05042
N4089 G1 X173.275 Y126.571 E.83106
N4090 G1 X175.825 Y126.571 E.082
N4091 G1 X158.45 Y191.413 E2.15865
N4092 G1 X158.45 Y192.344 E.02992
N4093 G1 X167.211 Y201.104 E.39841
N4094 G1 X172.711 Y201.104 E.17686
N4095 G1 X191.55 Y130.798 E2.34056
N4096 G1 X191.55 Y126.571 E.13594
N4097 G1 X190.987 Y126.571 E.01808
N4098 G1 X158.45 Y135.289 E1.08318
N4099 G1 X158.45 Y134.774 E.01656
N4100 G1 X191.55 Y167.873 E1.50523
N4101 G1 X191.55 Y168.564 E.02221
N4102 G1 X158.45 Y177.433 E1.1019
N4103 G1 X158.45 Y180.83 E.10923
N4104 G1 X178.725 Y201.104 E.92202
N4105 G1 X181.14 Y201.104 E.07765
N4106 G1 X191.55 Y162.255 E1.29334
N4107 G1 X191.55 Y160.135 E.06816
N4108 G1 X158.45 Y169.004 E1.1019
N4109 G1 X158.45 Y169.316 E.01002
N4110 G1 X190.239 Y201.104 E1.44562
N4111 G1 X189.569 Y201.104 E.02156
N4112 G1 X191.55 Y193.711 E.24612
N4113 G1 X191.55 Y193.85 E.00447
N4114 G1 X164.477 Y201.104 E.90128
N4115 G1 X164.282 Y201.104 E.00625
N4116 G1 X184.254 Y126.571 E2.48129
N4117 G1 X184.789 Y126.571 E.01721
N4118 G1 X191.55 Y133.331 E.30746
N4119 G1 X191.55 Y134.849 E.04879
N4120 G1 X158.45 Y143.718 E1.1019
N4121 G1 X158.45 Y146.288 E.08265
N4122 G1 X191.55 Y179.387 E1.50523
N4123 G1 X191.55 Y176.993 E.077
N4124 G1 X158.45 Y185.862 E1.1019
N4125 G1 X158.45 Y184.233 E.05236
N4126 M204 S10000
N4127 G1 X158.45 Y130.128 F60000
N4128 G1 F4421.739
N4129 M204 S8000
N4130 G1 X158.45 Y128.5 E.05236
N4131 G1 X158.967 Y126.571 E.06422
N4132 G1 X159.531 Y126.571 E.01812
N4133 G1 X158.45 Y126.86 E.03597
N4134 G1 X158.45 Y126.571 E.00931
N4135 G1 X158.764 Y126.571 E.01008
N4136 M204 S10000
N4137 G1 X163.389 Y126.571 F60000
N4138 G1 F4421.739
N4139 M204 S8000
N4140 G1 X161.761 Y126.571 E.05236
N4141 G1 X191.55 Y156.359 E1.35467
N4142 G1 X191.55 Y151.706 E.14962
N4143 G1 X158.45 Y160.575 E1.1019
N4144 G1 X158.45 Y159.956 E.0199
N4145 G1 X167.396 Y126.571 E1.11144
N4146 G1 X169.024 Y126.571 E.05236
N4147 ; WIPE_START
N4148 G1 X167.396 Y126.571 E-.61876
N4149 G1 X167.3 Y126.93 E-.14124
N4150 ; WIPE_END
N4151 G1 E-.04 F1800
N4152 M204 S10000
N4153 G17
N4154 G3 Z1.4 I1.217 J0 P1  F60000
N4155 ; stop printing object, unique label id: 229
N4156 M625
N4157 ; object ids of layer 5 start: 229,239
N4158 M624 AwAAAAAAAAA=
N4159 ;======== H2D 20250527========
N4160 ; SKIPPABLE_START
N4161 ; SKIPTYPE: timelapse
N4162 M622.1 S1 ; for prev firware, default turned on
N4163 
N4164 M1002 judge_flag timelapse_record_flag
N4165 
N4166 M622 J1
N4167 M993 A2 B2 C2
N4168 M993 A0 B0 C0
N4169 
N4170 
N4171 
N4172 
N4173     M9711 M0 E1 X260 Y141 Z1.4 S11 C10 O0 T3000
N4174 
N4175 
N4176 
N4177 M993 A3 B3 C3
N4178 
N4179 M623
N4180 ; SKIPPABLE_END
N4181 
N4182 ; object ids of this layer5 end: 229,239
N4183 M625
N4184 G1 X167.495 Y279.064
N4185 G1 Z1
N4186 G1 E.8 F1800
N4187 ; LAYER_HEIGHT: 0.200000
N4188 ; FEATURE: Prime tower
N4189 ; LINE_WIDTH: 0.500000
N4190 ; WIPE_TOWER_START
N4191 M204 S10000
N4192 G1  X166.995 Y279.564  
N4193 M204 S8000
N4194 M73 P42 R28
N4195 G3  X165.064 Y277.242   I3.871 J-5.183 E0.1159 F3938
N4196 G3  X166.240 Y274.649   I2.902 J-0.247 E0.1130
N4197 G2  X166.995 Y272.245   I-3.465 J-2.409 E0.0972
N4198 G2  X166.992 Y259.212   I-321.195 J-6.431 E0.4954
N4199 G2  X165.146 Y255.634   I-6.663 J1.171 E0.1554
N4200 G3  X165.661 Y253.471   I1.721 J-0.733 E0.0905
N4201 G1 E-0.8000 F1800
N4202 M204 S10000
N4203 G1  X167.381 Y251.657   F600
N4204 G1 E0.8000 F1800
N4205 M204 S8000
N4206 G3  X170.238 Y250.033   I2.765 J1.539 E0.1313 F3938
N4207 G3  X172.775 Y251.633   I-12.405 J22.473 E0.1141
N4208 G2  X174.808 Y252.064   I2.042 J-4.626 E0.0796
N4209 G2  X188.372 Y252.060   I6.687 J-357.435 E0.5155
N4210 G2  X192.307 Y250.183   I-0.499 J-6.110 E0.1694
N4211 G3  X194.619 Y250.613   I0.854 J1.838 E0.0953
N4212 G1  X195.995 Y252.064   E0.0760
N4213 G1 E0.0000
N4214 G3  X197.926 Y254.386   I-3.871 J5.182 E0.1159
N4215 G3  X196.750 Y256.979   I-2.902 J0.247 E0.1130
N4216 G2  X195.995 Y259.382   I3.464 J2.409 E0.0972
N4217 G2  X195.998 Y272.416   I321.212 J6.432 E0.4954
N4218 G2  X197.844 Y275.994   I6.663 J-1.171 E0.1554
N4219 G3  X197.504 Y277.972   I-1.658 J0.734 E0.0808
N4220 G1  X195.995 Y279.564   E0.0834
N4221 G3  X193.533 Y281.605   I-4.373 J-2.768 E0.1236
N4222 G3  X190.885 Y280.355   I0.012 J-3.454 E0.1149
N4223 G2  X188.182 Y279.564   I-2.709 J4.247 E0.1085
N4224 G2  X174.618 Y279.568   I-6.687 J357.435 E0.5155
N4225 G2  X170.683 Y281.445   I0.499 J6.110 E0.1694
N4226 G3  X168.371 Y281.015   I-0.854 J-1.838 E0.0953
N4227 G1  X166.995 Y279.564   E0.0760
N4228 ; WIPE_TOWER_END
N4229 G1  X167.495 Y252.064  
N4230 ; LAYER_HEIGHT: 0.200000
N4231 ; FEATURE: Prime tower
N4232 ; LINE_WIDTH: 0.500000
N4233 ; WIPE_TOWER_START
N4234 M204 S8000
N4235 G1  Y272.314  E0.2565
N4236 G1  X195.495  E1.0642
N4237 G1  Y279.064  E0.2565
N4238 G1  X167.495  E1.0642
N4239 M204 S10000
N4240 G1  X168.495 Y272.314  
N4241 ;--------------------
N4242 ; CP EMPTY GRID START
N4243 ; layer #6
N4244 M204 S8000
N4245 G1  Y279.064  E0.2565
N4246 M204 S10000
N4247 G1  X177.162 
N4248 M204 S8000
N4249 G1  Y272.314  E0.2565
N4250 M204 S10000
N4251 G1  X185.828 
N4252 M204 S8000
N4253 G1  Y279.064  E0.2565
N4254 M204 S10000
N4255 G1  X194.495 
N4256 M204 S8000
N4257 G1  Y272.314  E0.2565
N4258 ; CP EMPTY GRID END
N4259 ;------------------
N4260 
N4261 
N4262 
N4263 
N4264 
N4265 
N4266 ; WIPE_TOWER_END
N4267 ; LAYER_HEIGHT: 0.200000
N4268 ; FEATURE: Prime tower
N4269 ; LINE_WIDTH: 0.500000
N4270 ;--------------------
N4271 ; CP TOOLCHANGE START
N4272 ; toolchange #5
N4273 ; material : TPU -> TPU
N4274 ;--------------------
N4275 M220 B
N4276 M220 S100
N4277 ; WIPE_TOWER_START
N4278 G1 E-.8 F1800
N4279 G17
N4280 G3 Z1.4 I1.217 J0 P1  F60000
N4281 G1 X167.745 Y266.314
N4282 G1 Z1
N4283 G1 E.8 F1800
N4284 ; LAYER_HEIGHT: 0.200000
N4285 ; FEATURE: Prime tower
N4286 ; LINE_WIDTH: 1.000000
N4287 ; NOZZLE_CHANGE_START OF0 NF1
N4288 M204 S8000
N4289 G1  X195.245 Y266.314  E2.1885 F1881
N4290 G1  Y267.564  E0.0995
N4291 G1  X167.745  E2.1885
N4292 G1  Y268.814  E0.0995
N4293 G1  X195.245  E2.1885
N4294 G1  Y270.064  E0.0995
N4295 G1  X167.745  E2.1885
N4296 G1  Y271.314  E0.0995
N4297 G1  X195.245  E2.1885
N4298 ; NOZZLE_CHANGE_END OF0 NF1
N4299 M104 T1 S163 N0 ;Multi extruder pre cooling
N4300 
N4301 ; WIPE_START
N4302 G1 F5400
N4303 M204 S8000
N4304 G1 X193.245 Y271.314 E-1.9
N4305 ; WIPE_END
N4306 G1 E-.1 F1800
N4307 M204 S10000
N4308 G17
N4309 G3 Z1.4 I1.217 J0 P1  F5400
N4310 ; filament end gcode 
N4311 
N4312 ;======== H2D ========
N4313 ;===== 20250604 =====
N4314 M993 A2 B2 C2 ; nozzle cam detection allow status save.
N4315 M993 A0 B0 C0 ; nozzle cam detection not allowed.
N4316 
N4317 
N4318 M1015.4 S0 ; disable E air printing detect
N4319 
N4320 
N4321 M620 S1A
N4322 M1002 gcode_claim_action : 4
N4323 M204 S9000
N4324 
N4325 G1 Z4 F1200
N4326 
N4327 M400
N4328 M106 P1 S0
N4329 M106 P2 S0
N4330 
N4331 
N4332 
N4333 
N4334 M620.10 A0 F149.669 L0 H0.4 T270 P255 S1
N4335 
N4336 
N4337 
N4338 M620.10 A1 F79.8237 L0 H0.4 T250 P240 S1
N4339 
N4340 
N4341 
N4342 M620.11 P0 I0 E0
N4343 
N4344 
N4345 
N4346 M620.11 K1 I0 R10 F200
N4347 
N4348 
N4349 M628 S1
N4350 
N4351 
N4352 M620.11 S1 L0 I0 R10 D8 E-10 F200
N4353 
N4354 
N4355 M629
N4356 
N4357 
N4358 M620.11 H2 C331
N4359 
N4360 
N4361 T1
N4362 M73 E1
N4363 
N4364 ;deretract
N4365 
N4366 
N4367 
N4368 ; VFLUSH_START
N4369 
N4370 
N4371 ;VG1 E0 F79
N4372 
N4373 
N4374 SYNC T0
N4375 
N4376 ; VFLUSH_END
N4377 
N4378 M1002 set_filament_type:TPU
N4379 
N4380 M400
N4381 M83
N4382 
N4383 
N4384 
N4385 M628 S0
N4386 ;VM109 S240
N4387 M629
N4388 M400
N4389 
N4390 M983.3 F1.33333 A0.4
N4391 
N4392 
N4393 M400
N4394 
N4395 G1 Y320 F30000
N4396 G1 X201
N4397 
N4398 G1 Y295
N4399 G1 Y265 F18000
N4400 G1 Z4 F3000
N4401 
N4402 M204 S8000
N4403 
N4404 
N4405 M621 S1A
N4406 
N4407 M993 A3 B3 C3 ; nozzle cam detection allow status restore.
N4408 
N4409 
N4410 M1015.3 S1;enable tpu clog detect
N4411 
N4412 
N4413 
N4414 M1015.4 S0 ; disable E air printing detect
N4415 
N4416 
N4417 M620.6 I1 W1 ;enable ams air printing detect
N4418 M1002 gcode_claim_action : 0
N4419 M106 S255
N4420 M106 P2 S255
N4421 G1 X200 Y264.673 F60000
N4422 G1 Z1
N4423 G1 X200 Y257.04 Z1.4
N4424 G1 X200 Y247.99 Z1.4
N4425 G1 X162.991 Y247.99
N4426 G1 X162.991 Y252.564
N4427 G1 X167.495 Y252.564
N4428 
N4429 ; filament start gcode
N4430 G1 Z1
N4431 G1 E2 F1800
N4432 
N4433 G4 S0
N4434 ; CP TOOLCHANGE WIPE
N4435 ; LINE_WIDTH: 0.500000
N4436 M204 S8000
N4437 G1  X170.495 Y252.564  E0.1140 F1782
N4438 G1 E-0.8000 F1800
N4439 M204 S10000
N4440 G1  X165.995  F600
N4441 G1  X167.495  F240
N4442 G1  X167.995  F600
N4443 G1  Y253.064 
N4444 G1  X166.995 
N4445 G1  Y252.064 
N4446 G1  X168.495 
N4447 G1  Y253.564 
N4448 G1  X166.495 
N4449 G1  Y251.564 
N4450 G1  X170.495 Y252.564   F1782
N4451 G1 E0.8000 F1800
N4452 M204 S8000
N4453 G1  X195.495  E0.9502 F1782
N4454 G1  Y253.314  E0.0285
N4455 G1  X167.495  E1.0642 F2025
N4456 G1  Y254.064  E0.0285
N4457 G1  X195.495  E1.0642 F2100
N4458 G1  Y254.814  E0.0285
N4459 G1  X167.495  E1.0642
N4460 G1  Y255.564  E0.0285
N4461 G1  X195.495  E1.0642
N4462 G1  Y256.314  E0.0285
N4463 M73 P42 R27
N4464 G1  X167.495  E1.0642
N4465 G1  Y257.064  E0.0285
N4466 G1  X195.495  E1.0642
N4467 G1  Y257.814  E0.0285
N4468 G1  X167.495  E1.0642
N4469 G1  Y258.564  E0.0285
N4470 G1  X195.495  E1.0642
N4471 G1  Y259.314  E0.0285
N4472 G1  X167.495  E1.0642
N4473 G1  Y260.064  E0.0285
N4474 G1  X195.495  E1.0642
N4475 G1  Y260.814  E0.0285
N4476 G1  X167.495  E1.0642
N4477 G1  Y261.564  E0.0285
N4478 G1  X195.495  E1.0642
N4479 G1  Y262.314  E0.0285
N4480 G1  X167.495  E1.0642
N4481 G1  Y263.064  E0.0285
N4482 M73 P43 R27
N4483 G1  X195.495  E1.0642
N4484 G1  Y263.814  E0.0285
N4485 G1  X167.495  E1.0642
N4486 G1  Y264.564  E0.0285
N4487 G1  X195.495  E1.0642
N4488 G1  Y265.314  E0.0285
N4489 G1  X167.495  E1.0642
N4490 ; WIPE_TOWER_END
N4491 M220 R
N4492 G1 F60000
N4493 G4 S0
N4494 G92 E0
N4495 ; CP TOOLCHANGE END
N4496 ;------------------
N4497 
N4498 
N4499 
N4500 ; WIPE_START
N4501 G1 F5400
N4502 M204 S8000
N4503 G1 X169.495 Y265.314 E-.76
N4504 ; WIPE_END
N4505 G1 E-.04 F1800
N4506 M204 S10000
N4507 G17
N4508 G3 Z1.4 I1.217 J0 P1  F60000
N4509 ; OBJECT_ID: 239
N4510 ; COOLING_NODE: 0
N4511 ; start printing object, unique label id: 239
N4512 M624 AgAAAAAAAAA=
N4513 G1 X182.34 Y118.735
N4514 G1 Z1
N4515 G1 E.8 F1800
N4516 ; FEATURE: Outer wall
N4517 ; LINE_WIDTH: 0.42
N4518 ; LAYER_HEIGHT: 0.2
N4519 G1 F2545.881
N4520 M204 S5000
N4521 G1 X167.76 Y118.735 E.45715
N4522 G1 X167.76 Y118.155 E.01819
N4523 G1 X182.34 Y118.155 E.45715
N4524 G1 X182.34 Y118.675 E.0163
N4525 M204 S10000
N4526 G1 X182.144 Y118.445 F60000
N4527 ; FEATURE: Gap infill
N4528 ; LINE_WIDTH: 0.23088
N4529 G1 F5107.47
N4530 M204 S8000
N4531 G1 X167.956 Y118.445 E.22174
N4532 ; CHANGE_LAYER
N4533 ; Z_HEIGHT: 1.2
N4534 ; LAYER_HEIGHT: 0.2
N4535 ; WIPE_START
N4536 G1 F5107.47
N4537 G1 X169.956 Y118.445 E-.76
N4538 ; WIPE_END
N4539 G1 E-.04 F1800
N4540 ; stop printing object, unique label id: 239
N4541 M625
N4542 ;======== H2D 20250521========
N4543 ; layer num/total_layer_count: 6/63
N4544 ; update layer progress
N4545 M73 L6
N4546 M991 S0 P5 ;notify layer change
N4547 
N4548 
N4549 ; LAYER_HEIGHT: 0.200000
N4550 ; FEATURE: Prime tower
N4551 ; LINE_WIDTH: 0.500000
N4552 ;--------------------
N4553 ; CP TOOLCHANGE START
N4554 ; toolchange #6
N4555 ; material : PCTG -> PCTG
N4556 ;--------------------
N4557 M220 B
N4558 M220 S100
N4559 ; WIPE_TOWER_START
N4560 M204 S10000
N4561 G17
N4562 G3 Z1.4 I1.217 J0 P1  F60000
N4563 G1 X167.745 Y252.814
N4564 G1 Z1.2
N4565 G1 E.8 F1800
N4566 ; LAYER_HEIGHT: 0.200000
N4567 ; FEATURE: Prime tower
N4568 ; LINE_WIDTH: 1.000000
N4569 ; NOZZLE_CHANGE_START OF1 NF0
N4570 M104 T0 S210 N0 ;Multi extruder pre cooling in post extrusion
N4571 M204 S8000
N4572 G1  X195.245 Y252.814  E2.1885 F251
N4573 G1  Y254.314  E0.1194
N4574 G1  X167.745  E2.1885
N4575 G1  Y255.814  E0.1194
N4576 G1  X195.245  E2.1885
N4577 G1  Y257.314  E0.1194
N4578 M104 T1 S255 N0 ;Multi extruder pre heating
N4579 G1  X167.745  E2.1885
N4580 G1  Y258.814  E0.1194
N4581 G1  X195.245  E2.1885
N4582 M204 S10000
N4583 G1  Y259.814 
N4584 M73 P44 R27
N4585 G1  X168.245  F398
N4586 G1  Y258.314 
N4587 G1  X194.745 
N4588 G1  Y256.814 
N4589 G1  X168.245 
N4590 G1  Y255.314 
N4591 G1  X194.745 
N4592 G1  Y253.814 
N4593 M73 P44 R26
N4594 G1  X168.245 
N4595 ; NOZZLE_CHANGE_END OF1 NF0
N4596 M104 T0 S0 N0 ;Multi extruder pre cooling
N4597 
N4598 G1 E-2 F1800
N4599 G17
N4600 G3 Z1.6 I1.217 J0 P1  F5400
N4601 ; filament end gcode 
N4602 
N4603 ;======== H2D ========
N4604 ;===== 20250604 =====
N4605 M993 A2 B2 C2 ; nozzle cam detection allow status save.
N4606 M993 A0 B0 C0 ; nozzle cam detection not allowed.
N4607 
N4608 
N4609 M1015.4 S0 ; disable E air printing detect
N4610 
N4611 
N4612 M620 S0A
N4613 M1002 gcode_claim_action : 4
N4614 M204 S9000
N4615 
N4616 G1 Z4.2 F1200
N4617 
N4618 M400
N4619 M106 P1 S0
N4620 M106 P2 S0
N4621 
N4622 
N4623 
N4624 
N4625 M620.10 A0 F79.8237 L0 H0.4 T250 P240 S1
N4626 
N4627 
N4628 
N4629 M620.10 A1 F149.669 L0 H0.4 T270 P255 S1
N4630 
N4631 
N4632 
N4633 M620.11 P0 I1 E0
N4634 
N4635 
N4636 
N4637 M620.11 K1 I1 R0 F200
N4638 
N4639 
N4640 M628 S1
N4641 
N4642 M620.11 S0 L0 I1 E-10 F200
N4643 
N4644 M629
N4645 
N4646 
N4647 M620.11 H2 C331
N4648 
N4649 
N4650 T0
N4651 M73 E0
N4652 
N4653 ;deretract
N4654 
N4655 
N4656 M73 P45 R26
N4657 ;VG1 E4 F200
N4658 ;VG1 E4 F100
N4659 
N4660 
N4661 
N4662 ; VFLUSH_START
N4663 
N4664 
N4665 ;VG1 E0 F79
N4666 
N4667 
N4668 SYNC T0
N4669 
N4670 ; VFLUSH_END
N4671 
N4672 M1002 set_filament_type:PCTG
N4673 
N4674 M400
N4675 M83
N4676 
N4677 
N4678 
N4679 M628 S0
N4680 ;VM109 S255
N4681 M629
N4682 M400
N4683 
N4684 M983.3 F2.5 A0.4
N4685 
N4686 
N4687 M400
N4688 
N4689 G1 Y320 F30000
N4690 G1 X201
N4691 
N4692 G1 Y295
N4693 G1 Y265 F18000
N4694 G1 Z4.2 F3000
N4695 
N4696 M204 S8000
N4697 
N4698 
N4699 M621 S0A
N4700 
N4701 M993 A3 B3 C3 ; nozzle cam detection allow status restore.
N4702 
N4703 
N4704 M1015.3 S0;disable tpu clog detect
N4705 
N4706 
N4707 
N4708 M1015.4 S0 ; disable E air printing detect
N4709 
N4710 
N4711 M620.6 I0 W1 ;enable ams air printing detect
N4712 M1002 gcode_claim_action : 0
N4713 M106 S25.5
N4714 M106 P2 S0
N4715 G1 X200 Y278.814 F60000
N4716 G1 Z1.2
N4717 G1 X195.495 Y278.814 Z1.6
N4718 
N4719 ; filament start gcode
N4720 G1 Z1.2
N4721 G1 E2 F1800
N4722 
N4723 G4 S0
N4724 ; CP TOOLCHANGE WIPE
N4725 ; LINE_WIDTH: 0.500000
N4726 M204 S8000
N4727 G1  X192.495 Y278.814  E0.1140 F1782
N4728 G1 E-0.8000 F1800
N4729 M204 S10000
N4730 G1  X196.995  F600
N4731 G1  X195.495  F240
N4732 G1  X195.995  F600
N4733 G1  Y279.314 
N4734 G1  X194.995 
N4735 G1  Y278.314 
N4736 G1  X196.495 
N4737 G1  Y279.814 
N4738 G1  X194.495 
N4739 G1  Y277.814 
N4740 G1  X192.495 Y278.814   F1782
N4741 G1 E0.8000 F1800
N4742 M204 S8000
N4743 G1  X167.495  E0.9502 F1782
N4744 G1  Y278.064  E0.0285
N4745 G1  X195.495  E1.0642 F2025
N4746 G1  Y277.314  E0.0285
N4747 G1  X167.495  E1.0642 F2473
N4748 G1  Y276.564  E0.0285
N4749 G1  X195.495  E1.0642 F3938
N4750 G1  Y275.814  E0.0285
N4751 G1  X167.495  E1.0642
N4752 G1  Y275.064  E0.0285
N4753 G1  X195.495  E1.0642
N4754 G1  Y274.314  E0.0285
N4755 G1  X167.495  E1.0642
N4756 G1  Y273.564  E0.0285
N4757 G1  X195.495  E1.0642
N4758 G1  Y272.814  E0.0285
N4759 G1  X167.495  E1.0642
N4760 G1  Y272.064  E0.0285
N4761 G1  X195.495  E1.0642
N4762 G1  Y271.314  E0.0285
N4763 G1  X167.495  E1.0642
N4764 G1  Y270.564  E0.0285
N4765 G1  X195.495  E1.0642
N4766 G1  Y269.814  E0.0285
N4767 G1  X167.495  E1.0642
N4768 G1  Y269.064  E0.0285
N4769 G1  X195.495  E1.0642
N4770 G1  Y268.314  E0.0285
N4771 G1  X167.495  E1.0642
N4772 G1  Y267.564  E0.0285
N4773 G1  X195.495  E1.0642
N4774 G1  Y266.814  E0.0285
N4775 G1  X167.495  E1.0642
N4776 G1  Y266.064  E0.0285
N4777 G1  X195.495  E1.0642
N4778 ; WIPE_TOWER_END
N4779 M220 R
N4780 G1 F60000
N4781 G4 S0
N4782 G92 E0
N4783 ; CP TOOLCHANGE END
N4784 ;------------------
N4785 
N4786 
N4787 G1  Y252.064  
N4788 ; LAYER_HEIGHT: 0.200000
N4789 ; FEATURE: Prime tower
N4790 ; LINE_WIDTH: 0.500000
N4791 ; WIPE_TOWER_START
N4792 M204 S10000
N4793 G1  X195.846 Y279.721  
N4794 M204 S8000
N4795 G3  X193.064 Y281.636   I-3.469 J-2.060 E0.1325 F3938
N4796 G3  X190.723 Y280.255   I1.448 J-5.129 E0.1045
N4797 G2  X188.182 Y279.564   I-2.568 J4.426 E0.1012
N4798 G2  X174.618 Y279.568   I-6.687 J357.435 E0.5155
N4799 G2  X170.683 Y281.445   I0.499 J6.110 E0.1694
N4800 G3  X168.371 Y281.015   I-0.854 J-1.838 E0.0953
N4801 G1  X166.995 Y279.564   E0.0760
N4802 G3  X165.064 Y277.242   I3.871 J-5.183 E0.1159
N4803 G3  X166.240 Y274.649   I2.902 J-0.247 E0.1130
N4804 G2  X166.995 Y272.245   I-3.465 J-2.409 E0.0972
N4805 G2  X166.992 Y259.212   I-321.195 J-6.431 E0.4954
N4806 G2  X165.146 Y255.634   I-6.663 J1.171 E0.1554
N4807 G3  X165.485 Y253.656   I1.658 J-0.734 E0.0808
N4808 G1  X168.371 Y250.613   E0.1594
N4809 G3  X171.793 Y251.056   I1.525 J1.652 E0.1495
N4810 G2  X174.808 Y252.064   I3.021 J-4.025 E0.1229
N4811 G2  X188.372 Y252.060   I6.687 J-357.435 E0.5155
N4812 G2  X192.307 Y250.183   I-0.499 J-6.110 E0.1694
N4813 G3  X194.619 Y250.613   I0.854 J1.838 E0.0953
N4814 G1  X195.995 Y252.064   E0.0760
N4815 G3  X197.926 Y254.386   I-3.871 J5.182 E0.1159
N4816 G3  X196.750 Y256.979   I-2.902 J0.247 E0.1130
N4817 G2  X195.995 Y259.382   I3.464 J2.409 E0.0972
N4818 G2  X195.998 Y272.416   I321.212 J6.432 E0.4954
N4819 G2  X197.844 Y275.994   I6.663 J-1.171 E0.1554
N4820 G3  X197.564 Y277.905   I-1.654 J0.733 E0.0774
N4821 ; WIPE_TOWER_END
N4822 
N4823 ; WIPE_START
N4824 G1 F5107.47
N4825 M204 S8000
N4826 G1 X197.598 Y277.866 E-.01975
N4827 G1 X197.683 Y277.752 E-.0539
N4828 G1 X197.759 Y277.632 E-.05389
N4829 G1 X197.825 Y277.506 E-.0539
N4830 G1 X197.88 Y277.376 E-.0539
N4831 G1 X197.926 Y277.242 E-.05389
N4832 G1 X197.961 Y277.104 E-.0539
N4833 G1 X197.985 Y276.964 E-.05389
N4834 G1 X197.998 Y276.823 E-.0539
N4835 G1 X198 Y276.681 E-.05389
N4836 G1 X197.99 Y276.54 E-.05389
N4837 G1 X197.97 Y276.4 E-.05389
N4838 G1 X197.938 Y276.261 E-.0539
N4839 G1 X197.896 Y276.126 E-.05389
N4840 G1 X197.858 Y276.029 E-.03963
N4841 ; WIPE_END
N4842 G1 E-.04 F1800
N4843 M204 S10000
N4844 G17
N4845 G3 Z1.6 I1.217 J0 P1  F60000
N4846 ; OBJECT_ID: 229
N4847 ; COOLING_NODE: 0
N4848 ; start printing object, unique label id: 229
N4849 M624 AQAAAAAAAAA=
N4850 G1 X191.898 Y201.453 Z1.2
N4851 G1 E.8 F1800
N4852 ; FEATURE: Inner wall
N4853 ; LINE_WIDTH: 0.45
N4854 ; LAYER_HEIGHT: 0.2
N4855 G1 F4421.739
N4856 M204 S8000
N4857 G1 X158.102 Y201.453 E1.08675
N4858 G1 X158.102 Y126.222 E2.41914
N4859 G1 X191.898 Y126.222 E1.08675
N4860 G1 X191.898 Y201.393 E2.41721
N4861 ; COOLING_NODE: 0
N4862 M204 S10000
N4863 G1 X192.29 Y201.845 F60000
N4864 ; FEATURE: Outer wall
N4865 ; LINE_WIDTH: 0.42
N4866 G1 F4773.528
N4867 M204 S5000
N4868 G1 X157.71 Y201.845 E1.03002
N4869 M73 P46 R26
N4870 G1 X157.71 Y125.83 E2.26421
N4871 G1 X192.29 Y125.83 E1.03002
N4872 G1 X192.29 Y201.785 E2.26243
N4873 ; WIPE_START
N4874 M204 S8000
N4875 G1 X190.29 Y201.788 E-.76
N4876 ; WIPE_END
N4877 G1 E-.04 F1800
N4878 M204 S10000
N4879 G1 X191.508 Y194.254 Z1.6 F60000
N4880 G1 X191.55 Y193.997 Z1.6
N4881 G1 Z1.2
N4882 G1 E.8 F1800
N4883 ; FEATURE: Sparse infill
N4884 ; LINE_WIDTH: 0.45
N4885 G1 F4421.739
N4886 M204 S8000
N4887 G1 X165.023 Y201.104 E.88309
N4888 G1 X164.136 Y201.104 E.02853
N4889 G1 X184.107 Y126.571 E2.48129
N4890 G1 X184.989 Y126.571 E.02835
N4891 G1 X191.55 Y133.131 E.29836
N4892 G1 X191.55 Y134.995 E.05993
N4893 G1 X158.45 Y143.864 E1.1019
N4894 G1 X158.45 Y146.088 E.07151
N4895 G1 X191.55 Y179.187 E1.50523
N4896 G1 X191.55 Y177.139 E.06586
N4897 G1 X158.45 Y186.008 E1.1019
N4898 G1 X158.45 Y184.38 E.05236
N4899 M204 S10000
N4900 G1 X158.45 Y196.065 F60000
N4901 G1 F4421.739
N4902 M204 S8000
N4903 G1 X158.45 Y194.437 E.05236
N4904 G1 X191.55 Y185.568 E1.1019
N4905 G1 X191.55 Y183.94 E.05236
N4906 M204 S10000
N4907 G1 X158.45 Y155.973 F60000
N4908 G1 F4421.739
N4909 M204 S8000
N4910 G1 X158.45 Y157.602 E.05236
N4911 G1 X191.55 Y190.701 E1.50523
N4912 G1 X191.55 Y193.165 E.07923
N4913 G1 X189.422 Y201.104 E.26431
N4914 G1 X190.439 Y201.104 E.0327
N4915 G1 X158.45 Y169.116 E1.45472
N4916 G1 X158.45 Y169.15 E.00112
N4917 G1 X191.55 Y160.281 E1.1019
N4918 G1 X191.55 Y161.708 E.04588
N4919 G1 X180.993 Y201.104 E1.31153
N4920 G1 X178.925 Y201.104 E.06651
N4921 G1 X158.45 Y180.63 E.93111
N4922 G1 X158.45 Y177.579 E.09809
N4923 G1 X191.55 Y168.71 E1.1019
N4924 G1 X191.55 Y167.673 E.03335
N4925 G1 X158.45 Y134.574 E1.50523
N4926 G1 X158.45 Y135.435 E.0277
N4927 G1 X191.55 Y126.571 E1.10187
N4928 G1 X191.55 Y130.251 E.11837
N4929 G1 X172.565 Y201.104 E2.35875
N4930 G1 X167.411 Y201.104 E.16572
N4931 G1 X158.45 Y192.144 E.4075
N4932 G1 X158.45 Y190.867 E.04106
N4933 G1 X175.678 Y126.571 E2.14046
N4934 G1 X173.475 Y126.571 E.07086
N4935 G1 X191.55 Y144.645 E.82197
N4936 G1 X191.55 Y143.424 E.03928
N4937 G1 X158.45 Y152.293 E1.1019
N4938 G1 X158.45 Y150.665 E.05236
N4939 M204 S10000
N4940 G1 X158.45 Y129.582 F60000
N4941 G1 F4421.739
N4942 M204 S8000
N4943 G1 X158.45 Y127.953 E.05236
N4944 G1 X158.821 Y126.571 E.04603
N4945 G1 X158.45 Y126.571 E.01191
N4946 G1 X158.45 Y126.803 E.00747
N4947 M204 S10000
N4948 G1 X158.45 Y127.006 F60000
N4949 G1 F4421.739
N4950 M204 S8000
N4951 G1 X160.077 Y126.571 E.05416
N4952 G1 X161.961 Y126.571 E.06058
N4953 G1 X191.55 Y156.159 E1.34558
N4954 G1 X191.55 Y151.853 E.13848
N4955 G1 X158.45 Y160.722 E1.1019
N4956 G1 X158.45 Y159.41 E.04218
N4957 G1 X167.25 Y126.571 E1.09325
N4958 G1 X168.878 Y126.571 E.05236
N4959 ; WIPE_START
N4960 G1 X167.25 Y126.571 E-.61876
N4961 G1 X167.153 Y126.93 E-.14124
N4962 ; WIPE_END
N4963 G1 E-.04 F1800
N4964 M204 S10000
N4965 G17
N4966 G3 Z1.6 I1.217 J0 P1  F60000
N4967 ; stop printing object, unique label id: 229
N4968 M625
N4969 ; object ids of layer 6 start: 229
N4970 M624 AQAAAAAAAAA=
N4971 ;======== H2D 20250527========
N4972 ; SKIPPABLE_START
N4973 ; SKIPTYPE: timelapse
N4974 M622.1 S1 ; for prev firware, default turned on
N4975 
N4976 M1002 judge_flag timelapse_record_flag
N4977 
N4978 M622 J1
N4979 M993 A2 B2 C2
N4980 M993 A0 B0 C0
N4981 
N4982 
N4983 
N4984 
N4985     M9711 M0 E1 X260 Y141 Z1.6 S11 C10 O0 T3000
N4986 
N4987 
N4988 
N4989 M993 A3 B3 C3
N4990 
N4991 M623
N4992 ; SKIPPABLE_END
N4993 
N4994 ; object ids of this layer6 end: 229
N4995 M625
N4996 ; CHANGE_LAYER
N4997 ; Z_HEIGHT: 1.4
N4998 ; LAYER_HEIGHT: 0.2
N4999 ;======== H2D 20250521========
N5000 ; layer num/total_layer_count: 7/63
N5001 ; update layer progress
N5002 M73 L7
N5003 M991 S0 P6 ;notify layer change
N5004 
N5005 
N5006 M106 S71.4
N5007 ; OBJECT_ID: 229
N5008 ; COOLING_NODE: 0
N5009 ; start printing object, unique label id: 229
N5010 M624 AQAAAAAAAAA=
N5011 G1 X191.898 Y201.453 F60000
N5012 G1 Z1.4
N5013 G1 E.8 F1800
N5014 ; FEATURE: Inner wall
N5015 ; LINE_WIDTH: 0.45
N5016 ; LAYER_HEIGHT: 0.2
N5017 G1 F4421.739
N5018 M204 S8000
N5019 G1 X158.102 Y201.453 E1.08675
N5020 G1 X158.102 Y126.222 E2.41914
N5021 G1 X191.898 Y126.222 E1.08675
N5022 G1 X191.898 Y201.393 E2.41721
N5023 ; COOLING_NODE: 0
N5024 M204 S10000
N5025 G1 X192.29 Y201.845 F60000
N5026 ; FEATURE: Outer wall
N5027 ; LINE_WIDTH: 0.42
N5028 G1 F4773.528
N5029 M204 S5000
N5030 G1 X157.71 Y201.845 E1.03002
N5031 G1 X157.71 Y125.83 E2.26421
N5032 G1 X192.29 Y125.83 E1.03002
N5033 G1 X192.29 Y201.785 E2.26243
N5034 ; WIPE_START
N5035 M204 S8000
N5036 G1 X190.29 Y201.788 E-.76
N5037 ; WIPE_END
N5038 G1 E-.04 F1800
N5039 M204 S10000
N5040 G1 X191.55 Y195.771 Z1.8 F60000
N5041 G1 Z1.4
N5042 G1 E.8 F1800
N5043 ; FEATURE: Sparse infill
N5044 ; LINE_WIDTH: 0.45
N5045 G1 F4421.739
N5046 M204 S8000
N5047 G1 X191.55 Y194.143 E.05236
N5048 G1 X165.569 Y201.104 E.8649
N5049 G1 X163.989 Y201.104 E.05081
N5050 G1 X183.961 Y126.571 E2.48129
N5051 G1 X185.189 Y126.571 E.03949
N5052 G1 X191.55 Y132.931 E.28927
N5053 G1 X191.55 Y135.141 E.07107
N5054 M73 P46 R25
N5055 G1 X158.45 Y144.01 E1.1019
N5056 G1 X158.45 Y145.888 E.06037
N5057 G1 X191.55 Y178.987 E1.50523
N5058 G1 X191.55 Y177.285 E.05472
N5059 G1 X158.45 Y186.154 E1.1019
N5060 G1 X158.45 Y184.526 E.05236
N5061 M204 S10000
N5062 G1 X158.45 Y196.212 F60000
N5063 G1 F4421.739
N5064 M204 S8000
N5065 G1 X158.45 Y194.583 E.05236
N5066 G1 X191.55 Y185.714 E1.1019
N5067 G1 X191.55 Y184.086 E.05236
N5068 M204 S10000
N5069 G1 X158.45 Y155.773 F60000
N5070 G1 F4421.739
N5071 M204 S8000
N5072 G1 X158.45 Y157.402 E.05236
N5073 G1 X191.55 Y190.501 E1.50523
N5074 G1 X191.55 Y192.618 E.06809
N5075 G1 X189.276 Y201.104 E.2825
N5076 G1 X190.639 Y201.104 E.04383
N5077 G1 X158.45 Y168.916 E1.46381
N5078 G1 X158.45 Y169.297 E.01225
N5079 G1 X191.55 Y160.428 E1.1019
N5080 G1 X191.55 Y161.162 E.0236
N5081 M73 P47 R25
N5082 G1 X180.847 Y201.104 E1.32972
N5083 G1 X179.125 Y201.104 E.05537
N5084 G1 X158.45 Y180.43 E.94021
N5085 G1 X158.45 Y177.726 E.08695
N5086 G1 X191.55 Y168.857 E1.1019
N5087 G1 X191.55 Y167.473 E.04449
N5088 G1 X158.45 Y134.374 E1.50523
N5089 G1 X158.45 Y135.582 E.03884
N5090 G1 X191.55 Y126.713 E1.1019
N5091 G1 X191.55 Y129.705 E.09622
N5092 G1 X172.418 Y201.104 E2.37694
N5093 G1 X167.611 Y201.104 E.15458
N5094 G1 X158.45 Y191.944 E.4166
N5095 G1 X158.45 Y190.32 E.0522
N5096 G1 X175.532 Y126.571 E2.12227
N5097 G1 X173.675 Y126.571 E.05972
N5098 G1 X191.55 Y144.445 E.81287
N5099 G1 X191.55 Y143.57 E.02814
N5100 G1 X158.45 Y152.439 E1.1019
N5101 G1 X158.45 Y150.811 E.05236
N5102 M204 S10000
N5103 G1 X158.45 Y126.949 F60000
N5104 G1 F4421.739
N5105 M204 S8000
N5106 G1 X158.45 Y126.571 E.01218
N5107 G1 X158.674 Y126.571 E.00721
N5108 G1 X158.45 Y127.407 E.02784
N5109 G1 X158.45 Y127.153 E.00817
N5110 G1 X160.624 Y126.571 E.07235
N5111 G1 X162.161 Y126.571 E.04944
N5112 G1 X191.55 Y155.959 E1.33648
N5113 G1 X191.55 Y151.999 E.12735
N5114 G1 X158.45 Y160.868 E1.1019
N5115 G1 X158.45 Y158.864 E.06446
N5116 G1 X167.103 Y126.571 E1.07506
N5117 G1 X168.732 Y126.571 E.05236
N5118 ; WIPE_START
N5119 G1 X167.103 Y126.571 E-.61876
N5120 G1 X167.007 Y126.93 E-.14124
N5121 ; WIPE_END
N5122 G1 E-.04 F1800
N5123 M204 S10000
N5124 G17
N5125 G3 Z1.8 I1.217 J0 P1  F60000
N5126 ; stop printing object, unique label id: 229
N5127 M625
N5128 ; object ids of layer 7 start: 229
N5129 M624 AQAAAAAAAAA=
N5130 ;======== H2D 20250527========
N5131 ; SKIPPABLE_START
N5132 ; SKIPTYPE: timelapse
N5133 M622.1 S1 ; for prev firware, default turned on
N5134 
N5135 M1002 judge_flag timelapse_record_flag
N5136 
N5137 M622 J1
N5138 M993 A2 B2 C2
N5139 M993 A0 B0 C0
N5140 
N5141 
N5142 
N5143 
N5144     M9711 M0 E1 X260 Y141 Z1.8 S11 C10 O0 T3000
N5145 
N5146 
N5147 
N5148 M993 A3 B3 C3
N5149 
N5150 M623
N5151 ; SKIPPABLE_END
N5152 
N5153 ; object ids of this layer7 end: 229
N5154 M625
N5155 ; CHANGE_LAYER
N5156 ; Z_HEIGHT: 1.6
N5157 ; LAYER_HEIGHT: 0.2
N5158 ;======== H2D 20250521========
N5159 ; layer num/total_layer_count: 8/63
N5160 ; update layer progress
N5161 M73 L8
N5162 M991 S0 P7 ;notify layer change
N5163 
N5164 
N5165 ; OBJECT_ID: 229
N5166 ; COOLING_NODE: 0
N5167 ; start printing object, unique label id: 229
N5168 M624 AQAAAAAAAAA=
N5169 G1 X191.898 Y201.453 F60000
N5170 G1 Z1.6
N5171 G1 E.8 F1800
N5172 ; FEATURE: Inner wall
N5173 ; LINE_WIDTH: 0.45
N5174 ; LAYER_HEIGHT: 0.2
N5175 G1 F4421.739
N5176 M204 S8000
N5177 G1 X158.102 Y201.453 E1.08675
N5178 G1 X158.102 Y126.222 E2.41914
N5179 G1 X191.898 Y126.222 E1.08675
N5180 G1 X191.898 Y201.393 E2.41721
N5181 ; COOLING_NODE: 0
N5182 M204 S10000
N5183 G1 X192.29 Y201.845 F60000
N5184 ; FEATURE: Outer wall
N5185 ; LINE_WIDTH: 0.42
N5186 G1 F4773.528
N5187 M204 S5000
N5188 G1 X157.71 Y201.845 E1.03002
N5189 G1 X157.71 Y125.83 E2.26421
N5190 G1 X192.29 Y125.83 E1.03002
N5191 G1 X192.29 Y201.785 E2.26243
N5192 ; WIPE_START
N5193 M204 S8000
N5194 G1 X190.29 Y201.788 E-.76
N5195 ; WIPE_END
N5196 G1 E-.04 F1800
N5197 M204 S10000
N5198 G1 X191.55 Y195.918 Z2 F60000
N5199 G1 Z1.6
N5200 G1 E.8 F1800
N5201 ; FEATURE: Sparse infill
N5202 ; LINE_WIDTH: 0.45
N5203 G1 F4421.739
N5204 M204 S8000
N5205 G1 X191.55 Y194.289 E.05236
N5206 G1 X166.116 Y201.104 E.84671
N5207 G1 X163.843 Y201.104 E.07309
N5208 G1 X183.814 Y126.571 E2.48129
N5209 G1 X185.389 Y126.571 E.05063
N5210 G1 X191.55 Y132.731 E.28017
N5211 G1 X191.55 Y135.288 E.08221
N5212 G1 X158.45 Y144.157 E1.1019
N5213 G1 X158.45 Y145.688 E.04923
N5214 G1 X191.55 Y178.787 E1.50523
N5215 G1 X191.55 Y177.432 E.04358
N5216 G1 X158.45 Y186.301 E1.1019
N5217 G1 X158.45 Y184.673 E.05236
N5218 M204 S10000
N5219 G1 X158.45 Y196.358 F60000
N5220 G1 F4421.739
N5221 M204 S8000
N5222 G1 X158.45 Y194.73 E.05236
N5223 G1 X191.55 Y185.861 E1.1019
N5224 G1 X191.55 Y184.232 E.05236
N5225 M204 S10000
N5226 G1 X158.45 Y157.202 F60000
N5227 G1 F4421.739
N5228 M204 S8000
N5229 G1 X191.55 Y190.301 E1.50523
N5230 G1 X191.55 Y192.072 E.05695
N5231 G1 X189.129 Y201.104 E.3007
N5232 G1 X190.839 Y201.104 E.05497
N5233 G1 X158.45 Y168.716 E1.47291
N5234 G1 X158.45 Y169.443 E.02339
N5235 G1 X191.55 Y160.574 E1.1019
N5236 G1 X180.701 Y201.104 E1.34919
N5237 G1 X179.325 Y201.104 E.04423
N5238 G1 X158.45 Y180.23 E.9493
N5239 G1 X158.45 Y177.872 E.07581
N5240 G1 X191.55 Y169.003 E1.1019
N5241 G1 X191.55 Y167.273 E.05563
N5242 G1 X158.45 Y134.174 E1.50523
N5243 G1 X158.45 Y135.728 E.04998
N5244 G1 X191.55 Y126.859 E1.1019
N5245 G1 X191.55 Y129.159 E.07394
N5246 G1 X172.272 Y201.104 E2.39513
N5247 G1 X167.811 Y201.104 E.14344
N5248 G1 X158.45 Y191.744 E.42569
N5249 G1 X158.45 Y189.774 E.06334
N5250 G1 X175.386 Y126.571 E2.10408
N5251 G1 X173.875 Y126.571 E.04858
N5252 G1 X191.55 Y144.245 E.80378
N5253 G1 X191.55 Y143.717 E.017
N5254 G1 X158.45 Y152.586 E1.1019
N5255 G1 X158.45 Y150.957 E.05236
N5256 M204 S10000
N5257 G1 X158.45 Y128.928 F60000
N5258 G1 F4421.739
N5259 M204 S8000
N5260 G1 X158.45 Y127.299 E.05236
N5261 G1 X161.17 Y126.571 E.09054
N5262 G1 X162.361 Y126.571 E.0383
N5263 G1 X191.55 Y155.759 E1.32739
N5264 G1 X191.55 Y152.145 E.11621
N5265 G1 X158.45 Y161.014 E1.1019
N5266 G1 X158.45 Y158.317 E.08674
N5267 G1 X166.957 Y126.571 E1.05687
N5268 G1 X168.585 Y126.571 E.05236
N5269 ; WIPE_START
N5270 G1 X166.957 Y126.571 E-.61876
N5271 G1 X166.861 Y126.93 E-.14124
N5272 ; WIPE_END
N5273 G1 E-.04 F1800
N5274 M204 S10000
N5275 G17
N5276 G3 Z2 I1.217 J0 P1  F60000
N5277 ; stop printing object, unique label id: 229
N5278 M625
N5279 ; object ids of layer 8 start: 229
N5280 M624 AQAAAAAAAAA=
N5281 ;======== H2D 20250527========
N5282 ; SKIPPABLE_START
N5283 ; SKIPTYPE: timelapse
N5284 M622.1 S1 ; for prev firware, default turned on
N5285 
N5286 M1002 judge_flag timelapse_record_flag
N5287 
N5288 M622 J1
N5289 M993 A2 B2 C2
N5290 M993 A0 B0 C0
N5291 
N5292 
N5293 
N5294 
N5295     M9711 M0 E1 X260 Y141 Z2 S11 C10 O0 T3000
N5296 
N5297 
N5298 
N5299 M993 A3 B3 C3
N5300 
N5301 M623
N5302 ; SKIPPABLE_END
N5303 
N5304 ; object ids of this layer8 end: 229
N5305 M625
N5306 ; CHANGE_LAYER
N5307 ; Z_HEIGHT: 1.8
N5308 ; LAYER_HEIGHT: 0.2
N5309 ;======== H2D 20250521========
N5310 ; layer num/total_layer_count: 9/63
N5311 ; update layer progress
N5312 M73 L9
N5313 M991 S0 P8 ;notify layer change
N5314 
N5315 
N5316 ; OBJECT_ID: 229
N5317 ; COOLING_NODE: 0
N5318 ; start printing object, unique label id: 229
N5319 M624 AQAAAAAAAAA=
N5320 G1 X191.898 Y201.453 F60000
N5321 G1 Z1.8
N5322 G1 E.8 F1800
N5323 ; FEATURE: Inner wall
N5324 ; LINE_WIDTH: 0.45
N5325 ; LAYER_HEIGHT: 0.2
N5326 G1 F4421.739
N5327 M204 S8000
N5328 G1 X158.102 Y201.453 E1.08675
N5329 G1 X158.102 Y126.222 E2.41914
N5330 G1 X191.898 Y126.222 E1.08675
N5331 G1 X191.898 Y201.393 E2.41721
N5332 ; COOLING_NODE: 0
N5333 M204 S10000
N5334 G1 X192.29 Y201.845 F60000
N5335 ; FEATURE: Outer wall
N5336 ; LINE_WIDTH: 0.42
N5337 M73 P48 R25
N5338 G1 F4773.528
N5339 M204 S5000
N5340 G1 X157.71 Y201.845 E1.03002
N5341 G1 X157.71 Y125.83 E2.26421
N5342 G1 X192.29 Y125.83 E1.03002
N5343 G1 X192.29 Y201.785 E2.26243
N5344 ; WIPE_START
N5345 M204 S8000
N5346 G1 X190.29 Y201.788 E-.76
N5347 ; WIPE_END
N5348 G1 E-.04 F1800
N5349 M204 S10000
N5350 G1 X191.55 Y196.064 Z2.2 F60000
N5351 G1 Z1.8
N5352 G1 E.8 F1800
N5353 ; FEATURE: Sparse infill
N5354 ; LINE_WIDTH: 0.45
N5355 G1 F4421.739
N5356 M204 S8000
N5357 G1 X191.55 Y194.436 E.05236
N5358 G1 X166.662 Y201.104 E.82852
N5359 G1 X163.697 Y201.104 E.09536
N5360 G1 X183.668 Y126.571 E2.48129
N5361 G1 X185.589 Y126.571 E.06177
N5362 G1 X191.55 Y132.531 E.27108
N5363 G1 X191.55 Y135.434 E.09335
N5364 G1 X158.45 Y144.303 E1.1019
N5365 G1 X158.45 Y145.488 E.03809
N5366 G1 X191.55 Y178.587 E1.50523
N5367 G1 X191.55 Y177.578 E.03244
N5368 G1 X158.45 Y186.447 E1.1019
N5369 G1 X158.45 Y184.819 E.05236
N5370 M204 S10000
N5371 G1 X158.45 Y196.504 F60000
N5372 G1 F4421.739
N5373 M204 S8000
N5374 G1 X158.45 Y194.876 E.05236
N5375 G1 X191.55 Y186.007 E1.1019
N5376 G1 X191.55 Y184.379 E.05236
N5377 M204 S10000
N5378 G1 X158.45 Y157.002 F60000
N5379 G1 F4421.739
N5380 M204 S8000
N5381 G1 X191.55 Y190.101 E1.50523
N5382 G1 X191.55 Y191.526 E.04581
N5383 G1 X188.983 Y201.104 E.31889
N5384 G1 X191.039 Y201.104 E.06611
N5385 G1 X158.45 Y168.516 E1.482
N5386 G1 X158.45 Y169.59 E.03453
N5387 G1 X191.55 Y160.721 E1.1019
N5388 M204 S10000
N5389 G1 X191.55 Y158.441 F60000
N5390 G1 F4421.739
N5391 M204 S8000
N5392 G1 X191.55 Y160.069 E.05236
N5393 G1 X180.554 Y201.104 E1.3661
N5394 G1 X179.525 Y201.104 E.03309
N5395 G1 X158.45 Y180.03 E.9584
N5396 G1 X158.45 Y178.018 E.06467
N5397 G1 X191.55 Y169.149 E1.1019
N5398 G1 X191.55 Y167.073 E.06677
N5399 G1 X158.45 Y133.974 E1.50523
N5400 G1 X158.45 Y135.874 E.06112
N5401 G1 X191.55 Y127.006 E1.1019
N5402 G1 X191.55 Y128.612 E.05167
N5403 G1 X172.125 Y201.104 E2.41332
N5404 G1 X168.011 Y201.104 E.1323
N5405 G1 X158.45 Y191.544 E.43479
N5406 G1 X158.45 Y189.227 E.07448
N5407 G1 X175.239 Y126.571 E2.08589
N5408 G1 X174.075 Y126.571 E.03744
N5409 G1 X191.55 Y144.045 E.79468
N5410 G1 X191.55 Y143.863 E.00586
N5411 G1 X158.45 Y152.732 E1.1019
N5412 G1 X158.45 Y151.104 E.05236
N5413 M204 S10000
N5414 G1 X158.45 Y129.074 F60000
N5415 G1 F4421.739
N5416 M204 S8000
N5417 G1 X158.45 Y127.446 E.05236
N5418 G1 X161.716 Y126.571 E.10873
N5419 G1 X162.561 Y126.571 E.02716
N5420 G1 X191.55 Y155.559 E1.31829
N5421 G1 X191.55 Y152.292 E.10507
N5422 G1 X158.45 Y161.161 E1.1019
N5423 G1 X158.45 Y157.771 E.10902
N5424 G1 X166.81 Y126.571 E1.03868
N5425 G1 X168.439 Y126.571 E.05236
N5426 ; WIPE_START
N5427 G1 X166.81 Y126.571 E-.61876
N5428 G1 X166.714 Y126.93 E-.14124
N5429 ; WIPE_END
N5430 G1 E-.04 F1800
N5431 M204 S10000
N5432 G17
N5433 G3 Z2.2 I1.217 J0 P1  F60000
N5434 ; stop printing object, unique label id: 229
N5435 M625
N5436 ; object ids of layer 9 start: 229
N5437 M624 AQAAAAAAAAA=
N5438 ;======== H2D 20250527========
N5439 ; SKIPPABLE_START
N5440 ; SKIPTYPE: timelapse
N5441 M622.1 S1 ; for prev firware, default turned on
N5442 
N5443 M1002 judge_flag timelapse_record_flag
N5444 
N5445 M622 J1
N5446 M993 A2 B2 C2
N5447 M993 A0 B0 C0
N5448 
N5449 
N5450 
N5451 
N5452     M9711 M0 E1 X260 Y141 Z2.2 S11 C10 O0 T3000
N5453 
N5454 
N5455 
N5456 M993 A3 B3 C3
N5457 
N5458 M623
N5459 ; SKIPPABLE_END
N5460 
N5461 ; object ids of this layer9 end: 229
N5462 M625
N5463 ; CHANGE_LAYER
N5464 ; Z_HEIGHT: 2
N5465 ; LAYER_HEIGHT: 0.2
N5466 ;======== H2D 20250521========
N5467 ; layer num/total_layer_count: 10/63
N5468 ; update layer progress
N5469 M73 L10
N5470 M991 S0 P9 ;notify layer change
N5471 
N5472 
N5473 ; OBJECT_ID: 229
N5474 ; COOLING_NODE: 0
N5475 ; start printing object, unique label id: 229
N5476 M624 AQAAAAAAAAA=
N5477 G1 X191.898 Y201.453 F60000
N5478 G1 Z2
N5479 G1 E.8 F1800
N5480 ; FEATURE: Inner wall
N5481 ; LINE_WIDTH: 0.45
N5482 ; LAYER_HEIGHT: 0.2
N5483 G1 F4421.739
N5484 M204 S8000
N5485 G1 X158.102 Y201.453 E1.08675
N5486 G1 X158.102 Y126.222 E2.41914
N5487 G1 X191.898 Y126.222 E1.08675
N5488 G1 X191.898 Y201.393 E2.41721
N5489 ; COOLING_NODE: 0
N5490 M204 S10000
N5491 G1 X192.29 Y201.845 F60000
N5492 ; FEATURE: Outer wall
N5493 ; LINE_WIDTH: 0.42
N5494 G1 F4773.528
N5495 M204 S5000
N5496 G1 X157.71 Y201.845 E1.03002
N5497 G1 X157.71 Y125.83 E2.26421
N5498 G1 X192.29 Y125.83 E1.03002
N5499 G1 X192.29 Y201.785 E2.26243
N5500 ; WIPE_START
N5501 M204 S8000
N5502 G1 X190.29 Y201.788 E-.76
N5503 ; WIPE_END
N5504 G1 E-.04 F1800
N5505 M204 S10000
N5506 G1 X191.55 Y196.211 Z2.4 F60000
N5507 G1 Z2
N5508 G1 E.8 F1800
N5509 ; FEATURE: Sparse infill
N5510 ; LINE_WIDTH: 0.45
N5511 G1 F4421.739
N5512 M204 S8000
N5513 G1 X191.55 Y194.582 E.05236
N5514 G1 X167.209 Y201.104 E.81033
N5515 G1 X163.55 Y201.104 E.11764
N5516 G1 X183.522 Y126.571 E2.48129
N5517 G1 X185.789 Y126.571 E.07291
N5518 G1 X191.55 Y132.331 E.26198
N5519 G1 X191.55 Y135.581 E.10449
N5520 M73 P48 R24
N5521 G1 X158.45 Y144.45 E1.1019
N5522 G1 X158.45 Y145.288 E.02695
N5523 G1 X191.55 Y178.387 E1.50523
N5524 G1 X191.55 Y177.725 E.0213
N5525 G1 X158.45 Y186.594 E1.1019
N5526 G1 X158.45 Y184.965 E.05236
N5527 M204 S10000
N5528 G1 X158.45 Y196.651 F60000
N5529 G1 F4421.739
N5530 M204 S8000
N5531 G1 X158.45 Y195.022 E.05236
N5532 G1 X191.55 Y186.153 E1.1019
N5533 G1 X191.55 Y184.525 E.05236
N5534 M204 S10000
N5535 G1 X158.45 Y156.802 F60000
N5536 G1 F4421.739
N5537 M204 S8000
N5538 G1 X191.55 Y189.901 E1.50523
N5539 G1 X191.55 Y190.979 E.03467
N5540 M73 P49 R24
N5541 G1 X188.837 Y201.104 E.33708
N5542 G1 X191.239 Y201.104 E.07725
N5543 G1 X158.45 Y168.316 E1.4911
N5544 G1 X158.45 Y169.736 E.04567
N5545 G1 X191.55 Y160.867 E1.1019
N5546 G1 X191.55 Y162.495 E.05236
N5547 M204 S10000
N5548 G1 X191.55 Y157.894 F60000
N5549 G1 F4421.739
N5550 M204 S8000
N5551 G1 X191.55 Y159.523 E.05236
N5552 G1 X180.408 Y201.104 E1.38429
N5553 G1 X179.725 Y201.104 E.02195
N5554 G1 X158.45 Y179.83 E.96749
N5555 G1 X158.45 Y178.165 E.05353
N5556 G1 X191.55 Y169.296 E1.1019
N5557 G1 X191.55 Y166.873 E.0779
N5558 G1 X158.45 Y133.774 E1.50523
N5559 G1 X158.45 Y136.021 E.07226
N5560 G1 X191.55 Y127.152 E1.1019
N5561 G1 X191.55 Y128.066 E.02939
N5562 G1 X171.979 Y201.104 E2.43151
N5563 G1 X173.607 Y201.104 E.05236
N5564 M204 S10000
N5565 G1 X168.211 Y201.104 F60000
N5566 G1 F4421.739
N5567 M204 S8000
N5568 G1 X158.45 Y191.344 E.44388
N5569 G1 X158.45 Y188.681 E.08562
N5570 G1 X175.093 Y126.571 E2.0677
N5571 G1 X174.275 Y126.571 E.0263
N5572 G1 X191.55 Y143.845 E.78559
N5573 G1 X191.55 Y144.01 E.00528
N5574 G1 X158.45 Y152.878 E1.1019
N5575 G1 X158.45 Y151.25 E.05236
N5576 M204 S10000
N5577 G1 X158.45 Y129.22 F60000
N5578 G1 F4421.739
N5579 M204 S8000
N5580 G1 X158.45 Y127.592 E.05236
N5581 G1 X162.263 Y126.571 E.12692
N5582 G1 X162.761 Y126.571 E.01602
N5583 G1 X191.55 Y155.359 E1.3092
N5584 G1 X191.55 Y152.438 E.09393
N5585 G1 X158.45 Y161.307 E1.1019
N5586 G1 X158.45 Y157.224 E.13129
N5587 G1 X166.664 Y126.571 E1.02049
N5588 G1 X168.292 Y126.571 E.05236
N5589 ; WIPE_START
N5590 G1 X166.664 Y126.571 E-.61876
N5591 G1 X166.568 Y126.93 E-.14124
N5592 ; WIPE_END
N5593 G1 E-.04 F1800
N5594 M204 S10000
N5595 G17
N5596 G3 Z2.4 I1.217 J0 P1  F60000
N5597 ; stop printing object, unique label id: 229
N5598 M625
N5599 ; object ids of layer 10 start: 229
N5600 M624 AQAAAAAAAAA=
N5601 ;======== H2D 20250527========
N5602 ; SKIPPABLE_START
N5603 ; SKIPTYPE: timelapse
N5604 M622.1 S1 ; for prev firware, default turned on
N5605 
N5606 M1002 judge_flag timelapse_record_flag
N5607 
N5608 M622 J1
N5609 M993 A2 B2 C2
N5610 M993 A0 B0 C0
N5611 
N5612 
N5613 
N5614 
N5615     M9711 M0 E1 X260 Y141 Z2.4 S11 C10 O0 T3000
N5616 
N5617 
N5618 
N5619 M993 A3 B3 C3
N5620 
N5621 M623
N5622 ; SKIPPABLE_END
N5623 
N5624 ; object ids of this layer10 end: 229
N5625 M625
N5626 ; CHANGE_LAYER
N5627 ; Z_HEIGHT: 2.2
N5628 ; LAYER_HEIGHT: 0.2
N5629 ;======== H2D 20250521========
N5630 ; layer num/total_layer_count: 11/63
N5631 ; update layer progress
N5632 M73 L11
N5633 M991 S0 P10 ;notify layer change
N5634 
N5635 
N5636 ; OBJECT_ID: 229
N5637 ; COOLING_NODE: 0
N5638 ; start printing object, unique label id: 229
N5639 M624 AQAAAAAAAAA=
N5640 G1 X191.898 Y201.453 F60000
N5641 G1 Z2.2
N5642 G1 E.8 F1800
N5643 ; FEATURE: Inner wall
N5644 ; LINE_WIDTH: 0.45
N5645 ; LAYER_HEIGHT: 0.2
N5646 G1 F4421.739
N5647 M204 S8000
N5648 G1 X158.102 Y201.453 E1.08675
N5649 G1 X158.102 Y126.222 E2.41914
N5650 G1 X191.898 Y126.222 E1.08675
N5651 G1 X191.898 Y201.393 E2.41721
N5652 ; COOLING_NODE: 0
N5653 M204 S10000
N5654 G1 X192.29 Y201.845 F60000
N5655 ; FEATURE: Outer wall
N5656 ; LINE_WIDTH: 0.42
N5657 G1 F4773.528
N5658 M204 S5000
N5659 G1 X157.71 Y201.845 E1.03002
N5660 G1 X157.71 Y125.83 E2.26421
N5661 G1 X192.29 Y125.83 E1.03002
N5662 G1 X192.29 Y201.785 E2.26243
N5663 ; WIPE_START
N5664 M204 S8000
N5665 G1 X190.29 Y201.788 E-.76
N5666 ; WIPE_END
N5667 G1 E-.04 F1800
N5668 M204 S10000
N5669 G1 X191.55 Y196.357 Z2.6 F60000
N5670 G1 Z2.2
N5671 G1 E.8 F1800
N5672 ; FEATURE: Sparse infill
N5673 ; LINE_WIDTH: 0.45
N5674 G1 F4421.739
N5675 M204 S8000
N5676 G1 X191.55 Y194.729 E.05236
N5677 G1 X167.755 Y201.104 E.79214
N5678 G1 X163.404 Y201.104 E.13992
N5679 G1 X183.375 Y126.571 E2.48129
N5680 G1 X185.989 Y126.571 E.08405
N5681 G1 X191.55 Y132.131 E.25288
N5682 G1 X191.55 Y135.727 E.11563
N5683 G1 X158.45 Y144.596 E1.1019
N5684 G1 X158.45 Y145.088 E.01581
N5685 G1 X191.55 Y178.187 E1.50523
N5686 G1 X191.55 Y177.871 E.01016
N5687 G1 X158.45 Y186.74 E1.1019
N5688 G1 X158.45 Y185.112 E.05236
N5689 M204 S10000
N5690 G1 X158.45 Y196.797 F60000
N5691 G1 F4421.739
N5692 M204 S8000
N5693 G1 X158.45 Y195.169 E.05236
N5694 G1 X191.55 Y186.3 E1.1019
N5695 G1 X191.55 Y184.672 E.05236
N5696 M204 S10000
N5697 G1 X158.45 Y163.082 F60000
N5698 G1 F4421.739
N5699 M204 S8000
N5700 G1 X158.45 Y161.454 E.05236
N5701 G1 X191.55 Y152.585 E1.1019
N5702 G1 X191.55 Y155.159 E.08279
N5703 G1 X162.961 Y126.571 E1.3001
N5704 G1 X162.809 Y126.571 E.00488
N5705 G1 X158.45 Y127.738 E.14511
N5706 G1 X158.45 Y129.367 E.05236
N5707 M204 S10000
N5708 G1 X168.146 Y126.571 F60000
N5709 G1 F4421.739
N5710 M204 S8000
N5711 G1 X166.518 Y126.571 E.05236
N5712 G1 X158.45 Y156.678 E1.00229
N5713 G1 X158.45 Y156.602 E.00245
N5714 G1 X191.55 Y189.701 E1.50523
N5715 G1 X191.55 Y190.433 E.02353
N5716 G1 X188.69 Y201.104 E.35527
N5717 G1 X191.439 Y201.104 E.08839
N5718 G1 X158.45 Y168.116 E1.50019
N5719 G1 X158.45 Y169.882 E.05681
N5720 G1 X191.55 Y161.014 E1.1019
N5721 G1 X191.55 Y162.642 E.05236
N5722 M204 S10000
N5723 G1 X191.55 Y157.348 F60000
N5724 G1 F4421.739
N5725 M204 S8000
N5726 G1 X191.55 Y158.976 E.05236
N5727 G1 X180.261 Y201.104 E1.40248
N5728 G1 X179.925 Y201.104 E.01082
N5729 G1 X158.45 Y179.63 E.97659
N5730 G1 X158.45 Y178.311 E.04239
N5731 G1 X191.55 Y169.442 E1.1019
N5732 G1 X191.55 Y166.673 E.08904
N5733 G1 X158.45 Y133.574 E1.50523
N5734 G1 X158.45 Y136.167 E.08339
N5735 G1 X191.55 Y127.298 E1.1019
N5736 G1 X191.55 Y127.519 E.00711
N5737 G1 X171.833 Y201.104 E2.4497
N5738 G1 X173.461 Y201.104 E.05236
N5739 M204 S10000
N5740 G1 X168.411 Y201.104 F60000
N5741 G1 F4421.739
N5742 M204 S8000
N5743 G1 X158.45 Y191.144 E.45298
N5744 G1 X158.45 Y188.135 E.09676
N5745 G1 X174.946 Y126.571 E2.04951
N5746 G1 X174.475 Y126.571 E.01516
N5747 G1 X191.55 Y143.645 E.77649
N5748 G1 X191.55 Y144.156 E.01642
N5749 G1 X158.45 Y153.025 E1.1019
N5750 G1 X158.45 Y151.397 E.05236
N5751 ; WIPE_START
N5752 G1 X158.45 Y153.025 E-.61876
N5753 G1 X158.809 Y152.929 E-.14124
N5754 ; WIPE_END
N5755 M73 P50 R24
N5756 G1 E-.04 F1800
N5757 M204 S10000
N5758 G17
N5759 G3 Z2.6 I1.217 J0 P1  F60000
N5760 ; stop printing object, unique label id: 229
N5761 M625
N5762 ; object ids of layer 11 start: 229
N5763 M624 AQAAAAAAAAA=
N5764 ;======== H2D 20250527========
N5765 ; SKIPPABLE_START
N5766 ; SKIPTYPE: timelapse
N5767 M622.1 S1 ; for prev firware, default turned on
N5768 
N5769 M1002 judge_flag timelapse_record_flag
N5770 
N5771 M622 J1
N5772 M993 A2 B2 C2
N5773 M993 A0 B0 C0
N5774 
N5775 
N5776 
N5777 
N5778     M9711 M0 E1 X260 Y141 Z2.6 S11 C10 O0 T3000
N5779 
N5780 
N5781 
N5782 M993 A3 B3 C3
N5783 
N5784 M623
N5785 ; SKIPPABLE_END
N5786 
N5787 ; object ids of this layer11 end: 229
N5788 M625
N5789 ; CHANGE_LAYER
N5790 ; Z_HEIGHT: 2.4
N5791 ; LAYER_HEIGHT: 0.2
N5792 ;======== H2D 20250521========
N5793 ; layer num/total_layer_count: 12/63
N5794 ; update layer progress
N5795 M73 L12
N5796 M991 S0 P11 ;notify layer change
N5797 
N5798 
N5799 ; OBJECT_ID: 229
N5800 ; COOLING_NODE: 0
N5801 ; start printing object, unique label id: 229
N5802 M624 AQAAAAAAAAA=
N5803 G1 X191.898 Y201.453 F60000
N5804 G1 Z2.4
N5805 G1 E.8 F1800
N5806 ; FEATURE: Inner wall
N5807 ; LINE_WIDTH: 0.45
N5808 ; LAYER_HEIGHT: 0.2
N5809 G1 F4421.739
N5810 M204 S8000
N5811 G1 X158.102 Y201.453 E1.08675
N5812 G1 X158.102 Y126.222 E2.41914
N5813 G1 X191.898 Y126.222 E1.08675
N5814 G1 X191.898 Y201.393 E2.41721
N5815 ; COOLING_NODE: 0
N5816 M204 S10000
N5817 G1 X192.29 Y201.845 F60000
N5818 ; FEATURE: Outer wall
N5819 ; LINE_WIDTH: 0.42
N5820 G1 F4773.528
N5821 M204 S5000
N5822 G1 X157.71 Y201.845 E1.03002
N5823 G1 X157.71 Y125.83 E2.26421
N5824 G1 X192.29 Y125.83 E1.03002
N5825 G1 X192.29 Y201.785 E2.26243
N5826 ; WIPE_START
N5827 M204 S8000
N5828 G1 X190.29 Y201.788 E-.76
N5829 ; WIPE_END
N5830 G1 E-.04 F1800
N5831 M204 S10000
N5832 G1 X191.55 Y196.503 Z2.8 F60000
N5833 G1 Z2.4
N5834 G1 E.8 F1800
N5835 ; FEATURE: Sparse infill
N5836 ; LINE_WIDTH: 0.45
N5837 G1 F4421.739
N5838 M204 S8000
N5839 G1 X191.55 Y194.875 E.05236
N5840 G1 X168.301 Y201.104 E.77395
N5841 G1 X168.611 Y201.104 E.00996
N5842 G1 X158.45 Y190.944 E.46207
N5843 G1 X158.45 Y187.588 E.1079
N5844 G1 X174.8 Y126.571 E2.03132
N5845 G1 X174.675 Y126.571 E.00402
N5846 G1 X191.55 Y143.445 E.7674
N5847 G1 X191.55 Y144.302 E.02756
N5848 G1 X158.45 Y153.171 E1.1019
N5849 G1 X158.45 Y151.543 E.05236
N5850 M204 S10000
N5851 G1 X158.45 Y163.228 F60000
N5852 G1 F4421.739
N5853 M204 S8000
N5854 G1 X158.45 Y161.6 E.05236
N5855 G1 X191.55 Y152.731 E1.1019
N5856 G1 X191.55 Y154.959 E.07165
N5857 G1 X163.161 Y126.571 E1.29101
N5858 G1 X163.356 Y126.571 E.00626
N5859 G1 X158.45 Y127.885 E.1633
N5860 G1 X158.45 Y129.513 E.05236
N5861 M204 S10000
N5862 G1 X167.999 Y126.571 F60000
N5863 G1 F4421.739
N5864 M204 S8000
N5865 G1 X166.371 Y126.571 E.05236
N5866 G1 X158.45 Y156.131 E.9841
N5867 G1 X158.45 Y156.402 E.00869
N5868 G1 X191.55 Y189.501 E1.50523
N5869 G1 X191.55 Y189.886 E.01239
N5870 G1 X188.544 Y201.104 E.37346
N5871 G1 X191.55 Y201.104 E.09666
N5872 G1 X191.55 Y201.015 E.00287
N5873 G1 X158.45 Y167.916 E1.50523
N5874 G1 X158.45 Y170.029 E.06795
N5875 G1 X191.55 Y161.16 E1.1019
N5876 G1 X191.55 Y162.788 E.05236
N5877 M204 S10000
N5878 G1 X191.55 Y156.801 F60000
N5879 G1 F4421.739
N5880 M204 S8000
N5881 G1 X191.55 Y158.43 E.05236
N5882 G1 X180.115 Y201.104 E1.42067
N5883 G1 X158.45 Y179.43 E.98545
N5884 G1 X158.45 Y178.458 E.03126
N5885 G1 X191.55 Y169.589 E1.1019
N5886 G1 X191.55 Y166.473 E.10018
N5887 G1 X158.45 Y133.374 E1.50523
N5888 G1 X158.45 Y136.314 E.09453
N5889 G1 X191.55 Y127.445 E1.1019
N5890 M204 S10000
N5891 G1 X190.324 Y126.571 F60000
N5892 G1 F4421.739
N5893 M204 S8000
N5894 G1 X191.55 Y126.571 E.03942
N5895 G1 X191.55 Y126.973 E.01294
N5896 G1 X171.686 Y201.104 E2.46789
N5897 G1 X173.315 Y201.104 E.05236
N5898 M204 S10000
N5899 G1 X158.45 Y186.886 F60000
N5900 G1 F4421.739
N5901 M204 S8000
N5902 G1 X191.55 Y178.018 E1.1019
N5903 G1 X191.55 Y177.987 E.00098
N5904 G1 X158.45 Y144.888 E1.50523
N5905 G1 X158.45 Y144.742 E.00467
N5906 G1 X191.55 Y135.874 E1.1019
N5907 G1 X191.55 Y131.931 E.12677
N5908 G1 X186.189 Y126.571 E.24379
N5909 G1 X183.229 Y126.571 E.09519
N5910 G1 X163.257 Y201.104 E2.48129
N5911 G1 X158.45 Y201.104 E.15458
N5912 G1 X158.45 Y195.315 E.18616
N5913 G1 X191.55 Y186.446 E1.1019
N5914 G1 X191.55 Y184.818 E.05236
N5915 ; WIPE_START
N5916 G1 X191.55 Y186.446 E-.61876
N5917 G1 X191.191 Y186.543 E-.14124
N5918 ; WIPE_END
N5919 G1 E-.04 F1800
N5920 M204 S10000
N5921 G17
N5922 G3 Z2.8 I1.217 J0 P1  F60000
N5923 ; stop printing object, unique label id: 229
N5924 M625
N5925 ; object ids of layer 12 start: 229
N5926 M624 AQAAAAAAAAA=
N5927 ;======== H2D 20250527========
N5928 ; SKIPPABLE_START
N5929 ; SKIPTYPE: timelapse
N5930 M622.1 S1 ; for prev firware, default turned on
N5931 
N5932 M1002 judge_flag timelapse_record_flag
N5933 
N5934 M622 J1
N5935 M993 A2 B2 C2
N5936 M993 A0 B0 C0
N5937 
N5938 
N5939 
N5940 
N5941     M9711 M0 E1 X260 Y141 Z2.8 S11 C10 O0 T3000
N5942 
N5943 
N5944 
N5945 M993 A3 B3 C3
N5946 
N5947 M623
N5948 ; SKIPPABLE_END
N5949 
N5950 ; object ids of this layer12 end: 229
N5951 M625
N5952 ; CHANGE_LAYER
N5953 ; Z_HEIGHT: 2.6
N5954 ; LAYER_HEIGHT: 0.2
N5955 ;======== H2D 20250521========
N5956 ; layer num/total_layer_count: 13/63
N5957 ; update layer progress
N5958 M73 L13
N5959 M991 S0 P12 ;notify layer change
N5960 
N5961 
N5962 ; OBJECT_ID: 229
N5963 ; COOLING_NODE: 0
N5964 ; start printing object, unique label id: 229
N5965 M624 AQAAAAAAAAA=
N5966 G1 X191.898 Y201.453 F60000
N5967 G1 Z2.6
N5968 G1 E.8 F1800
N5969 ; FEATURE: Inner wall
N5970 ; LINE_WIDTH: 0.45
N5971 ; LAYER_HEIGHT: 0.2
N5972 G1 F4421.739
N5973 M204 S8000
N5974 G1 X158.102 Y201.453 E1.08675
N5975 G1 X158.102 Y126.222 E2.41914
N5976 G1 X191.898 Y126.222 E1.08675
N5977 G1 X191.898 Y201.393 E2.41721
N5978 ; COOLING_NODE: 0
N5979 M204 S10000
N5980 G1 X192.29 Y201.845 F60000
N5981 ; FEATURE: Outer wall
N5982 ; LINE_WIDTH: 0.42
N5983 G1 F4773.528
N5984 M204 S5000
N5985 G1 X157.71 Y201.845 E1.03002
N5986 G1 X157.71 Y125.83 E2.26421
N5987 G1 X192.29 Y125.83 E1.03002
N5988 G1 X192.29 Y201.785 E2.26243
N5989 ; WIPE_START
N5990 M204 S8000
N5991 G1 X190.29 Y201.788 E-.76
N5992 ; WIPE_END
N5993 G1 E-.04 F1800
N5994 M204 S10000
N5995 G1 X191.55 Y196.65 Z3 F60000
N5996 G1 Z2.6
N5997 G1 E.8 F1800
N5998 ; FEATURE: Sparse infill
N5999 ; LINE_WIDTH: 0.45
N6000 G1 F4421.739
N6001 M204 S8000
N6002 G1 X191.55 Y195.022 E.05236
N6003 G1 X168.811 Y201.104 E.7569
N6004 G1 X158.45 Y190.744 E.47117
N6005 G1 X158.45 Y195.462 E.15172
N6006 G1 X191.55 Y186.593 E1.1019
N6007 G1 X191.55 Y184.964 E.05236
N6008 M204 S10000
N6009 G1 X173.168 Y201.104 F60000
N6010 M73 P50 R23
N6011 G1 F4421.739
N6012 M204 S8000
N6013 G1 X171.54 Y201.104 E.05236
N6014 G1 X191.511 Y126.571 E2.48129
N6015 G1 X189.883 Y126.571 E.05236
N6016 M204 S10000
N6017 G1 X191.55 Y127.591 F60000
N6018 G1 F4421.739
N6019 M204 S8000
N6020 G1 X158.45 Y136.46 E1.1019
N6021 G1 X158.45 Y133.174 E.10567
N6022 G1 X191.55 Y166.273 E1.50523
N6023 G1 X191.55 Y169.735 E.11132
N6024 M73 P51 R23
N6025 G1 X158.45 Y178.604 E1.1019
N6026 G1 X158.45 Y179.23 E.02012
N6027 G1 X180.325 Y201.104 E.99478
N6028 G1 X179.969 Y201.104 E.01146
N6029 G1 X191.55 Y157.883 E1.43886
N6030 G1 X191.55 Y156.255 E.05236
N6031 M204 S10000
N6032 G1 X191.55 Y162.935 F60000
N6033 G1 F4421.739
N6034 M204 S8000
N6035 G1 X191.55 Y161.306 E.05236
N6036 G1 X158.45 Y170.175 E1.1019
N6037 G1 X158.45 Y167.716 E.07909
N6038 G1 X191.55 Y200.815 E1.50523
N6039 G1 X191.55 Y201.104 E.00931
N6040 G1 X188.397 Y201.104 E.10137
N6041 G1 X191.55 Y189.301 E.39285
N6042 G1 X158.45 Y156.202 E1.50523
N6043 G1 X158.45 Y155.585 E.01983
N6044 G1 X166.225 Y126.571 E.96591
N6045 G1 X163.902 Y126.571 E.07469
N6046 G1 X158.45 Y128.031 E.18149
N6047 G1 X158.45 Y126.571 E.04697
N6048 G1 X158.618 Y126.571 E.00539
N6049 M204 S10000
N6050 G1 X163.361 Y126.571 F60000
N6051 G1 F4421.739
N6052 M204 S8000
N6053 G1 X191.55 Y154.759 E1.28191
N6054 G1 X191.55 Y152.878 E.06051
N6055 G1 X158.45 Y161.746 E1.1019
N6056 G1 X158.45 Y163.375 E.05236
N6057 M204 S10000
N6058 G1 X158.45 Y151.689 F60000
N6059 G1 F4421.739
N6060 M204 S8000
N6061 G1 X158.45 Y153.318 E.05236
N6062 G1 X191.55 Y144.449 E1.1019
N6063 G1 X191.55 Y143.245 E.0387
N6064 G1 X174.875 Y126.571 E.7583
N6065 G1 X174.654 Y126.571 E.00712
N6066 G1 X158.45 Y187.042 E2.01313
N6067 G1 X191.55 Y178.164 E1.10198
N6068 G1 X191.55 Y177.787 E.01211
N6069 G1 X158.45 Y144.688 E1.50523
N6070 G1 X158.45 Y144.889 E.00647
N6071 G1 X191.55 Y136.02 E1.1019
N6072 G1 X191.55 Y131.731 E.1379
N6073 G1 X186.389 Y126.571 E.23469
N6074 G1 X183.082 Y126.571 E.10633
N6075 G1 X163.111 Y201.104 E2.48129
N6076 G1 X161.483 Y201.104 E.05236
N6077 ; WIPE_START
N6078 G1 X163.111 Y201.104 E-.61876
N6079 G1 X163.207 Y200.745 E-.14124
N6080 ; WIPE_END
N6081 G1 E-.04 F1800
N6082 M204 S10000
N6083 G17
N6084 G3 Z3 I1.217 J0 P1  F60000
N6085 ; stop printing object, unique label id: 229
N6086 M625
N6087 ; object ids of layer 13 start: 229
N6088 M624 AQAAAAAAAAA=
N6089 ;======== H2D 20250527========
N6090 ; SKIPPABLE_START
N6091 ; SKIPTYPE: timelapse
N6092 M622.1 S1 ; for prev firware, default turned on
N6093 
N6094 M1002 judge_flag timelapse_record_flag
N6095 
N6096 M622 J1
N6097 M993 A2 B2 C2
N6098 M993 A0 B0 C0
N6099 
N6100 
N6101 
N6102 
N6103     M9711 M0 E1 X260 Y141 Z3 S11 C10 O0 T3000
N6104 
N6105 
N6106 
N6107 M993 A3 B3 C3
N6108 
N6109 M623
N6110 ; SKIPPABLE_END
N6111 
N6112 ; object ids of this layer13 end: 229
N6113 M625
N6114 ; CHANGE_LAYER
N6115 ; Z_HEIGHT: 2.8
N6116 ; LAYER_HEIGHT: 0.2
N6117 ;======== H2D 20250521========
N6118 ; layer num/total_layer_count: 14/63
N6119 ; update layer progress
N6120 M73 L14
N6121 M991 S0 P13 ;notify layer change
N6122 
N6123 
N6124 ; OBJECT_ID: 229
N6125 ; COOLING_NODE: 0
N6126 ; start printing object, unique label id: 229
N6127 M624 AQAAAAAAAAA=
N6128 G1 X191.898 Y201.453 F60000
N6129 G1 Z2.8
N6130 G1 E.8 F1800
N6131 ; FEATURE: Inner wall
N6132 ; LINE_WIDTH: 0.45
N6133 ; LAYER_HEIGHT: 0.2
N6134 G1 F4421.739
N6135 M204 S8000
N6136 G1 X158.102 Y201.453 E1.08675
N6137 G1 X158.102 Y126.222 E2.41914
N6138 G1 X191.898 Y126.222 E1.08675
N6139 G1 X191.898 Y201.393 E2.41721
N6140 ; COOLING_NODE: 0
N6141 M204 S10000
N6142 G1 X192.29 Y201.845 F60000
N6143 ; FEATURE: Outer wall
N6144 ; LINE_WIDTH: 0.42
N6145 G1 F4773.528
N6146 M204 S5000
N6147 G1 X157.71 Y201.845 E1.03002
N6148 G1 X157.71 Y125.83 E2.26421
N6149 G1 X192.29 Y125.83 E1.03002
N6150 G1 X192.29 Y201.785 E2.26243
N6151 ; WIPE_START
N6152 M204 S8000
N6153 G1 X190.29 Y201.788 E-.76
N6154 ; WIPE_END
N6155 G1 E-.04 F1800
N6156 M204 S10000
N6157 G1 X191.55 Y196.796 Z3.2 F60000
N6158 G1 Z2.8
N6159 G1 E.8 F1800
N6160 ; FEATURE: Sparse infill
N6161 ; LINE_WIDTH: 0.45
N6162 G1 F4421.739
N6163 M204 S8000
N6164 G1 X191.55 Y195.168 E.05236
N6165 G1 X169.394 Y201.104 E.73757
N6166 G1 X169.011 Y201.104 E.01232
N6167 G1 X158.45 Y190.544 E.48026
N6168 G1 X158.45 Y195.608 E.16285
N6169 G1 X191.55 Y186.739 E1.1019
N6170 G1 X191.55 Y185.111 E.05236
N6171 M204 S10000
N6172 G1 X173.022 Y201.104 F60000
N6173 G1 F4421.739
N6174 M204 S8000
N6175 G1 X171.393 Y201.104 E.05236
N6176 G1 X191.365 Y126.571 E2.48129
N6177 G1 X191.55 Y126.571 E.00595
N6178 G1 X191.55 Y127.738 E.03753
N6179 G1 X158.45 Y136.607 E1.1019
N6180 G1 X158.45 Y132.974 E.11681
N6181 G1 X191.55 Y166.073 E1.50523
N6182 G1 X191.55 Y169.882 E.12246
N6183 G1 X158.45 Y178.75 E1.1019
N6184 G1 X158.45 Y179.03 E.00898
N6185 G1 X180.525 Y201.104 E1.00387
N6186 G1 X179.822 Y201.104 E.0226
N6187 G1 X191.55 Y157.337 E1.45705
N6188 G1 X191.55 Y155.709 E.05236
N6189 M204 S10000
N6190 G1 X191.55 Y163.081 F60000
N6191 G1 F4421.739
N6192 M204 S8000
N6193 G1 X191.55 Y161.453 E.05236
N6194 G1 X158.45 Y170.322 E1.1019
N6195 G1 X158.45 Y167.516 E.09023
N6196 G1 X191.55 Y200.615 E1.50523
N6197 G1 X191.55 Y201.104 E.01574
N6198 G1 X188.251 Y201.104 E.10607
N6199 G1 X191.55 Y188.794 E.40984
N6200 G1 X191.55 Y189.101 E.00989
N6201 G1 X158.45 Y156.002 E1.50523
N6202 G1 X158.45 Y155.039 E.03097
N6203 G1 X166.078 Y126.571 E.94772
N6204 G1 X164.448 Y126.571 E.05241
N6205 G1 X158.45 Y128.178 E.19968
N6206 G1 X158.45 Y126.571 E.05168
N6207 G1 X158.471 Y126.571 E.00068
N6208 M204 S10000
N6209 G1 X163.561 Y126.571 F60000
N6210 G1 F4421.739
N6211 M204 S8000
N6212 G1 X191.55 Y154.559 E1.27282
N6213 G1 X191.55 Y153.024 E.04937
N6214 G1 X158.45 Y161.893 E1.1019
N6215 G1 X158.45 Y160.265 E.05236
N6216 M204 S10000
N6217 G1 X158.45 Y151.836 F60000
N6218 G1 F4421.739
N6219 M204 S8000
N6220 G1 X158.45 Y153.464 E.05236
N6221 G1 X191.55 Y144.595 E1.1019
N6222 G1 X191.55 Y143.045 E.04984
N6223 G1 X175.075 Y126.571 E.74921
N6224 G1 X174.507 Y126.571 E.01826
N6225 G1 X158.45 Y186.495 E1.99494
N6226 G1 X158.45 Y187.179 E.02199
N6227 G1 X191.55 Y178.31 E1.1019
N6228 G1 X191.55 Y177.587 E.02325
N6229 G1 X158.45 Y144.488 E1.50523
N6230 G1 X158.45 Y145.035 E.01761
N6231 G1 X191.55 Y136.166 E1.1019
N6232 G1 X191.55 Y131.531 E.14904
N6233 G1 X186.589 Y126.571 E.2256
N6234 G1 X182.936 Y126.571 E.11746
N6235 M73 P52 R23
N6236 G1 X162.965 Y201.104 E2.48129
N6237 G1 X161.336 Y201.104 E.05236
N6238 ; WIPE_START
N6239 G1 X162.965 Y201.104 E-.61876
N6240 G1 X163.061 Y200.745 E-.14124
N6241 ; WIPE_END
N6242 G1 E-.04 F1800
N6243 M204 S10000
N6244 G17
N6245 G3 Z3.2 I1.217 J0 P1  F60000
N6246 ; stop printing object, unique label id: 229
N6247 M625
N6248 ; object ids of layer 14 start: 229
N6249 M624 AQAAAAAAAAA=
N6250 ;======== H2D 20250527========
N6251 ; SKIPPABLE_START
N6252 ; SKIPTYPE: timelapse
N6253 M622.1 S1 ; for prev firware, default turned on
N6254 
N6255 M1002 judge_flag timelapse_record_flag
N6256 
N6257 M622 J1
N6258 M993 A2 B2 C2
N6259 M993 A0 B0 C0
N6260 
N6261 
N6262 
N6263 
N6264     M9711 M0 E1 X260 Y141 Z3.2 S11 C10 O0 T3000
N6265 
N6266 
N6267 
N6268 M993 A3 B3 C3
N6269 
N6270 M623
N6271 ; SKIPPABLE_END
N6272 
N6273 ; object ids of this layer14 end: 229
N6274 M625
N6275 ; CHANGE_LAYER
N6276 ; Z_HEIGHT: 3
N6277 ; LAYER_HEIGHT: 0.2
N6278 ;======== H2D 20250521========
N6279 ; layer num/total_layer_count: 15/63
N6280 ; update layer progress
N6281 M73 L15
N6282 M991 S0 P14 ;notify layer change
N6283 
N6284 
N6285 ; OBJECT_ID: 229
N6286 ; COOLING_NODE: 0
N6287 ; start printing object, unique label id: 229
N6288 M624 AQAAAAAAAAA=
N6289 G1 X191.898 Y201.453 F60000
N6290 G1 Z3
N6291 G1 E.8 F1800
N6292 ; FEATURE: Inner wall
N6293 ; LINE_WIDTH: 0.45
N6294 ; LAYER_HEIGHT: 0.2
N6295 G1 F4421.739
N6296 M204 S8000
N6297 G1 X158.102 Y201.453 E1.08675
N6298 G1 X158.102 Y126.222 E2.41914
N6299 G1 X191.898 Y126.222 E1.08675
N6300 G1 X191.898 Y201.393 E2.41721
N6301 ; COOLING_NODE: 0
N6302 M204 S10000
N6303 G1 X192.29 Y201.845 F60000
N6304 ; FEATURE: Outer wall
N6305 ; LINE_WIDTH: 0.42
N6306 G1 F4773.528
N6307 M204 S5000
N6308 G1 X157.71 Y201.845 E1.03002
N6309 G1 X157.71 Y125.83 E2.26421
N6310 G1 X192.29 Y125.83 E1.03002
N6311 G1 X192.29 Y201.785 E2.26243
N6312 ; WIPE_START
N6313 M204 S8000
N6314 G1 X190.29 Y201.788 E-.76
N6315 ; WIPE_END
N6316 G1 E-.04 F1800
N6317 M204 S10000
N6318 G1 X191.463 Y194.246 Z3.4 F60000
N6319 G1 X191.55 Y193.686 Z3.4
N6320 G1 Z3
N6321 G1 E.8 F1800
N6322 ; FEATURE: Sparse infill
N6323 ; LINE_WIDTH: 0.45
N6324 G1 F4421.739
N6325 M204 S8000
N6326 G1 X191.55 Y195.314 E.05236
N6327 G1 X169.941 Y201.104 E.71938
N6328 G1 X169.211 Y201.104 E.02346
N6329 G1 X158.45 Y190.344 E.48936
N6330 G1 X158.45 Y195.754 E.17399
N6331 G1 X191.55 Y186.886 E1.1019
N6332 G1 X191.55 Y188.247 E.04378
N6333 G1 X188.105 Y201.104 E.42803
N6334 G1 X191.55 Y201.104 E.11078
N6335 G1 X191.55 Y200.415 E.02217
N6336 G1 X158.45 Y167.316 E1.50523
N6337 G1 X158.45 Y170.468 E.10137
N6338 G1 X191.55 Y161.599 E1.1019
N6339 G1 X191.55 Y163.227 E.05236
N6340 M204 S10000
N6341 G1 X191.55 Y155.162 F60000
N6342 G1 F4421.739
N6343 M204 S8000
N6344 G1 X191.55 Y156.79 E.05236
N6345 G1 X179.676 Y201.104 E1.47524
N6346 G1 X180.725 Y201.104 E.03374
N6347 G1 X158.45 Y178.83 E1.01297
N6348 G1 X158.45 Y178.897 E.00216
N6349 G1 X191.55 Y170.028 E1.1019
N6350 G1 X191.55 Y165.873 E.1336
N6351 G1 X158.45 Y132.774 E1.50523
N6352 G1 X158.45 Y136.753 E.12795
N6353 G1 X191.55 Y127.884 E1.1019
N6354 G1 X191.55 Y126.571 E.04224
N6355 G1 X191.218 Y126.571 E.01066
N6356 G1 X171.247 Y201.104 E2.48129
N6357 G1 X172.875 Y201.104 E.05236
N6358 M204 S10000
N6359 G1 X161.19 Y201.104 F60000
N6360 G1 F4421.739
N6361 M204 S8000
N6362 G1 X162.818 Y201.104 E.05236
N6363 G1 X182.79 Y126.571 E2.48129
N6364 G1 X186.789 Y126.571 E.1286
N6365 G1 X191.55 Y131.331 E.2165
N6366 G1 X191.55 Y136.313 E.16018
N6367 G1 X158.45 Y145.182 E1.1019
N6368 G1 X158.45 Y144.288 E.02875
N6369 G1 X191.55 Y177.387 E1.50523
N6370 G1 X191.55 Y178.457 E.03439
N6371 G1 X158.45 Y187.326 E1.1019
N6372 G1 X158.45 Y185.949 E.04427
N6373 G1 X174.361 Y126.571 E1.97675
N6374 G1 X175.275 Y126.571 E.0294
N6375 G1 X191.55 Y142.845 E.74011
N6376 G1 X191.55 Y144.742 E.06098
N6377 G1 X158.45 Y153.611 E1.1019
N6378 M204 S10000
N6379 G1 X158.45 Y160.411 F60000
N6380 G1 F4421.739
N6381 M204 S8000
N6382 G1 X158.45 Y162.039 E.05236
N6383 G1 X191.55 Y153.17 E1.1019
N6384 G1 X191.55 Y154.359 E.03823
N6385 G1 X163.761 Y126.571 E1.26372
N6386 M204 S10000
N6387 G1 X158.45 Y126.696 F60000
N6388 G1 F4421.739
N6389 M204 S8000
N6390 G1 X158.45 Y128.324 E.05236
N6391 G1 X164.995 Y126.571 E.21787
N6392 G1 X165.932 Y126.571 E.03013
N6393 G1 X158.45 Y154.492 E.92953
N6394 G1 X158.45 Y155.802 E.04211
N6395 G1 X191.55 Y188.901 E1.50523
N6396 ; WIPE_START
N6397 G1 X190.135 Y187.487 E-.76
N6398 ; WIPE_END
N6399 G1 E-.04 F1800
N6400 M204 S10000
N6401 G17
N6402 G3 Z3.4 I1.217 J0 P1  F60000
N6403 ; stop printing object, unique label id: 229
N6404 M625
N6405 ; object ids of layer 15 start: 229
N6406 M624 AQAAAAAAAAA=
N6407 ;======== H2D 20250527========
N6408 ; SKIPPABLE_START
N6409 ; SKIPTYPE: timelapse
N6410 M622.1 S1 ; for prev firware, default turned on
N6411 
N6412 M1002 judge_flag timelapse_record_flag
N6413 
N6414 M622 J1
N6415 M993 A2 B2 C2
N6416 M993 A0 B0 C0
N6417 
N6418 
N6419 
N6420 
N6421     M9711 M0 E1 X260 Y141 Z3.4 S11 C10 O0 T3000
N6422 
N6423 
N6424 
N6425 M993 A3 B3 C3
N6426 
N6427 M623
N6428 ; SKIPPABLE_END
N6429 
N6430 ; object ids of this layer15 end: 229
N6431 M625
N6432 ; CHANGE_LAYER
N6433 ; Z_HEIGHT: 3.2
N6434 ; LAYER_HEIGHT: 0.2
N6435 ;======== H2D 20250521========
N6436 ; layer num/total_layer_count: 16/63
N6437 ; update layer progress
N6438 M73 L16
N6439 M991 S0 P15 ;notify layer change
N6440 
N6441 
N6442 M106 S68.85
N6443 ; OBJECT_ID: 229
N6444 ; COOLING_NODE: 0
N6445 ; start printing object, unique label id: 229
N6446 M624 AQAAAAAAAAA=
N6447 G1 X191.898 Y201.453 F60000
N6448 G1 Z3.2
N6449 G1 E.8 F1800
N6450 ; FEATURE: Inner wall
N6451 ; LINE_WIDTH: 0.45
N6452 ; LAYER_HEIGHT: 0.2
N6453 G1 F4421.739
N6454 M204 S8000
N6455 G1 X158.102 Y201.453 E1.08675
N6456 G1 X158.102 Y126.222 E2.41914
N6457 G1 X191.898 Y126.222 E1.08675
N6458 G1 X191.898 Y201.393 E2.41721
N6459 ; COOLING_NODE: 0
N6460 M204 S10000
N6461 G1 X192.29 Y201.845 F60000
N6462 ; FEATURE: Outer wall
N6463 ; LINE_WIDTH: 0.42
N6464 G1 F4773.528
N6465 M204 S5000
N6466 G1 X157.71 Y201.845 E1.03002
N6467 G1 X157.71 Y125.83 E2.26421
N6468 G1 X192.29 Y125.83 E1.03002
N6469 G1 X192.29 Y201.785 E2.26243
N6470 ; WIPE_START
N6471 M204 S8000
N6472 G1 X190.29 Y201.788 E-.76
N6473 ; WIPE_END
N6474 G1 E-.04 F1800
N6475 M204 S10000
N6476 G1 X191.484 Y194.25 Z3.6 F60000
N6477 G1 X191.55 Y193.832 Z3.6
N6478 G1 Z3.2
N6479 G1 E.8 F1800
N6480 ; FEATURE: Sparse infill
N6481 ; LINE_WIDTH: 0.45
N6482 G1 F4421.739
N6483 M204 S8000
N6484 G1 X191.55 Y195.461 E.05236
N6485 G1 X170.487 Y201.104 E.70119
N6486 G1 X169.411 Y201.104 E.0346
N6487 G1 X158.45 Y190.144 E.49845
N6488 G1 X158.45 Y195.901 E.18513
N6489 G1 X191.55 Y187.032 E1.1019
N6490 G1 X191.55 Y187.701 E.02151
N6491 G1 X187.958 Y201.104 E.44622
N6492 G1 X191.55 Y201.104 E.11549
N6493 M73 P52 R22
N6494 G1 X191.55 Y200.215 E.0286
N6495 G1 X158.45 Y167.116 E1.50523
N6496 G1 X158.45 Y170.615 E.11251
N6497 M73 P53 R22
N6498 G1 X191.55 Y161.746 E1.1019
N6499 G1 X191.55 Y165.673 E.1263
N6500 G1 X158.45 Y132.574 E1.50523
N6501 G1 X158.45 Y128.471 E.13195
N6502 G1 X165.541 Y126.571 E.23606
N6503 G1 X165.786 Y126.571 E.00785
N6504 G1 X158.45 Y153.946 E.91134
N6505 G1 X158.45 Y153.757 E.00607
N6506 G1 X191.55 Y144.888 E1.1019
N6507 G1 X191.55 Y142.645 E.07212
N6508 G1 X175.475 Y126.571 E.73102
N6509 G1 X174.214 Y126.571 E.04054
N6510 G1 X158.45 Y185.402 E1.95856
N6511 G1 X158.45 Y187.472 E.06655
N6512 G1 X191.55 Y178.603 E1.1019
N6513 G1 X191.55 Y177.187 E.04553
N6514 G1 X158.45 Y144.088 E1.50523
N6515 G1 X158.45 Y145.328 E.03988
N6516 G1 X191.55 Y136.459 E1.1019
N6517 G1 X191.55 Y131.131 E.17132
N6518 G1 X186.989 Y126.571 E.20741
N6519 G1 X182.643 Y126.571 E.13974
N6520 G1 X162.672 Y201.104 E2.48129
N6521 G1 X161.043 Y201.104 E.05236
N6522 M204 S10000
N6523 G1 X171.101 Y201.104 F60000
N6524 G1 F4421.739
N6525 M204 S8000
N6526 G1 X191.072 Y126.571 E2.48129
N6527 G1 X191.55 Y126.571 E.01536
N6528 G1 X191.55 Y128.03 E.04694
N6529 G1 X158.45 Y136.899 E1.1019
N6530 G1 X158.45 Y138.528 E.05236
N6531 M204 S10000
N6532 G1 X162.333 Y126.571 F60000
N6533 G1 F4421.739
N6534 M204 S8000
N6535 G1 X163.961 Y126.571 E.05236
N6536 G1 X191.55 Y154.159 E1.25462
N6537 G1 X191.55 Y153.317 E.02709
N6538 G1 X158.45 Y162.186 E1.1019
N6539 G1 X158.45 Y155.602 E.21172
N6540 G1 X191.55 Y188.701 E1.50523
N6541 M204 S10000
N6542 G1 X191.55 Y171.803 F60000
N6543 G1 F4421.739
N6544 M204 S8000
N6545 G1 X191.55 Y170.174 E.05236
N6546 G1 X158.45 Y179.043 E1.1019
N6547 G1 X158.45 Y178.63 E.0133
N6548 G1 X180.925 Y201.104 E1.02206
N6549 G1 X179.529 Y201.104 E.04488
N6550 G1 X191.55 Y156.244 E1.49343
N6551 G1 X191.55 Y154.616 E.05236
N6552 ; WIPE_START
N6553 G1 X191.55 Y156.244 E-.61876
N6554 G1 X191.453 Y156.603 E-.14124
N6555 ; WIPE_END
N6556 G1 E-.04 F1800
N6557 M204 S10000
N6558 G17
N6559 G3 Z3.6 I1.217 J0 P1  F60000
N6560 ; stop printing object, unique label id: 229
N6561 M625
N6562 ; object ids of layer 16 start: 229
N6563 M624 AQAAAAAAAAA=
N6564 ;======== H2D 20250527========
N6565 ; SKIPPABLE_START
N6566 ; SKIPTYPE: timelapse
N6567 M622.1 S1 ; for prev firware, default turned on
N6568 
N6569 M1002 judge_flag timelapse_record_flag
N6570 
N6571 M622 J1
N6572 M993 A2 B2 C2
N6573 M993 A0 B0 C0
N6574 
N6575 
N6576 
N6577 
N6578     M9711 M0 E1 X260 Y141 Z3.6 S11 C10 O0 T3000
N6579 
N6580 
N6581 
N6582 M993 A3 B3 C3
N6583 
N6584 M623
N6585 ; SKIPPABLE_END
N6586 
N6587 ; object ids of this layer16 end: 229
N6588 M625
N6589 ; CHANGE_LAYER
N6590 ; Z_HEIGHT: 3.4
N6591 ; LAYER_HEIGHT: 0.2
N6592 ;======== H2D 20250521========
N6593 ; layer num/total_layer_count: 17/63
N6594 ; update layer progress
N6595 M73 L17
N6596 M991 S0 P16 ;notify layer change
N6597 
N6598 
N6599 ; OBJECT_ID: 229
N6600 ; COOLING_NODE: 0
N6601 ; start printing object, unique label id: 229
N6602 M624 AQAAAAAAAAA=
N6603 G1 X191.898 Y201.453 F60000
N6604 G1 Z3.4
N6605 G1 E.8 F1800
N6606 ; FEATURE: Inner wall
N6607 ; LINE_WIDTH: 0.45
N6608 ; LAYER_HEIGHT: 0.2
N6609 G1 F4421.739
N6610 M204 S8000
N6611 G1 X158.102 Y201.453 E1.08675
N6612 G1 X158.102 Y126.222 E2.41914
N6613 G1 X191.898 Y126.222 E1.08675
N6614 G1 X191.898 Y201.393 E2.41721
N6615 ; COOLING_NODE: 0
N6616 M204 S10000
N6617 G1 X192.29 Y201.845 F60000
N6618 ; FEATURE: Outer wall
N6619 ; LINE_WIDTH: 0.42
N6620 G1 F4773.528
N6621 M204 S5000
N6622 G1 X157.71 Y201.845 E1.03002
N6623 G1 X157.71 Y125.83 E2.26421
N6624 G1 X192.29 Y125.83 E1.03002
N6625 G1 X192.29 Y201.785 E2.26243
N6626 ; WIPE_START
N6627 M204 S8000
N6628 G1 X190.29 Y201.788 E-.76
N6629 ; WIPE_END
N6630 G1 E-.04 F1800
N6631 M204 S10000
N6632 G1 X186.183 Y201.104 Z3.8 F60000
N6633 G1 Z3.4
N6634 G1 E.8 F1800
N6635 ; FEATURE: Sparse infill
N6636 ; LINE_WIDTH: 0.45
N6637 G1 F4421.739
N6638 M204 S8000
N6639 G1 X187.812 Y201.104 E.05236
N6640 G1 X191.55 Y187.154 E.46441
N6641 G1 X191.55 Y187.178 E.00077
N6642 G1 X158.45 Y196.047 E1.1019
N6643 G1 X158.45 Y201.104 E.16262
N6644 G1 X162.525 Y201.104 E.13104
N6645 G1 X182.497 Y126.571 E2.48129
N6646 G1 X187.189 Y126.571 E.15088
N6647 G1 X191.55 Y130.931 E.19831
N6648 G1 X191.55 Y136.606 E.18246
N6649 G1 X158.45 Y145.475 E1.1019
N6650 G1 X158.45 Y143.888 E.05102
N6651 G1 X191.55 Y176.987 E1.50523
N6652 G1 X191.55 Y178.75 E.05667
N6653 G1 X158.45 Y187.619 E1.1019
N6654 G1 X158.45 Y189.944 E.07477
N6655 G1 X169.611 Y201.104 E.50755
N6656 G1 X167.983 Y201.104 E.05236
N6657 M204 S10000
N6658 G1 X158.45 Y186.484 F60000
N6659 G1 F4421.739
N6660 M204 S8000
N6661 G1 X158.45 Y184.856 E.05236
N6662 G1 X174.068 Y126.571 E1.94037
N6663 G1 X175.675 Y126.571 E.05168
N6664 G1 X191.55 Y142.445 E.72192
N6665 G1 X191.55 Y145.034 E.08326
N6666 G1 X158.45 Y153.903 E1.1019
N6667 G1 X158.45 Y153.399 E.0162
N6668 G1 X165.639 Y126.571 E.89315
N6669 M204 S10000
N6670 G1 X167.716 Y126.571 F60000
N6671 G1 F4421.739
N6672 M204 S8000
N6673 G1 X166.088 Y126.571 E.05236
N6674 G1 X158.45 Y128.617 E.25425
N6675 G1 X158.45 Y132.374 E.12081
N6676 G1 X191.55 Y165.473 E1.50523
N6677 G1 X191.55 Y161.892 E.11516
N6678 G1 X158.45 Y170.761 E1.1019
N6679 G1 X158.45 Y166.916 E.12365
N6680 G1 X191.55 Y200.015 E1.50523
N6681 G1 X191.55 Y195.607 E.14174
N6682 G1 X171.034 Y201.104 E.683
N6683 G1 X170.954 Y201.104 E.00255
N6684 G1 X190.925 Y126.571 E2.48129
N6685 G1 X191.55 Y126.571 E.02007
N6686 G1 X191.55 Y128.177 E.05165
N6687 G1 X158.45 Y137.046 E1.1019
N6688 G1 X158.45 Y138.674 E.05236
N6689 M204 S10000
N6690 G1 X162.533 Y126.571 F60000
N6691 G1 F4421.739
N6692 M204 S8000
N6693 G1 X164.161 Y126.571 E.05236
N6694 G1 X191.55 Y153.959 E1.24553
N6695 G1 X191.55 Y153.463 E.01595
N6696 G1 X158.45 Y162.332 E1.1019
N6697 G1 X158.45 Y155.402 E.22286
N6698 M73 P54 R22
N6699 G1 X191.55 Y188.501 E1.50523
N6700 G1 X191.55 Y190.129 E.05236
N6701 M204 S10000
N6702 G1 X191.55 Y171.949 F60000
N6703 G1 F4421.739
N6704 M204 S8000
N6705 G1 X191.55 Y170.321 E.05236
N6706 G1 X158.45 Y179.19 E1.1019
N6707 G1 X158.45 Y178.43 E.02444
N6708 G1 X181.125 Y201.104 E1.03116
N6709 G1 X179.383 Y201.104 E.05602
N6710 G1 X191.55 Y155.698 E1.51162
N6711 G1 X191.55 Y154.163 E.04935
N6712 ; WIPE_START
N6713 G1 X191.55 Y155.698 E-.58324
N6714 G1 X191.429 Y156.147 E-.17677
N6715 ; WIPE_END
N6716 G1 E-.04 F1800
N6717 M204 S10000
N6718 G17
N6719 G3 Z3.8 I1.217 J0 P1  F60000
N6720 ; stop printing object, unique label id: 229
N6721 M625
N6722 ; object ids of layer 17 start: 229
N6723 M624 AQAAAAAAAAA=
N6724 ;======== H2D 20250527========
N6725 ; SKIPPABLE_START
N6726 ; SKIPTYPE: timelapse
N6727 M622.1 S1 ; for prev firware, default turned on
N6728 
N6729 M1002 judge_flag timelapse_record_flag
N6730 
N6731 M622 J1
N6732 M993 A2 B2 C2
N6733 M993 A0 B0 C0
N6734 
N6735 
N6736 
N6737 
N6738     M9711 M0 E1 X260 Y141 Z3.8 S11 C10 O0 T3000
N6739 
N6740 
N6741 
N6742 M993 A3 B3 C3
N6743 
N6744 M623
N6745 ; SKIPPABLE_END
N6746 
N6747 ; object ids of this layer17 end: 229
N6748 M625
N6749 ; CHANGE_LAYER
N6750 ; Z_HEIGHT: 3.6
N6751 ; LAYER_HEIGHT: 0.2
N6752 ;======== H2D 20250521========
N6753 ; layer num/total_layer_count: 18/63
N6754 ; update layer progress
N6755 M73 L18
N6756 M991 S0 P17 ;notify layer change
N6757 
N6758 
N6759 ; OBJECT_ID: 229
N6760 ; COOLING_NODE: 0
N6761 ; start printing object, unique label id: 229
N6762 M624 AQAAAAAAAAA=
N6763 G1 X191.898 Y201.453 F60000
N6764 G1 Z3.6
N6765 G1 E.8 F1800
N6766 ; FEATURE: Inner wall
N6767 ; LINE_WIDTH: 0.45
N6768 ; LAYER_HEIGHT: 0.2
N6769 G1 F4421.739
N6770 M204 S8000
N6771 G1 X158.102 Y201.453 E1.08675
N6772 G1 X158.102 Y126.222 E2.41914
N6773 G1 X191.898 Y126.222 E1.08675
N6774 G1 X191.898 Y201.393 E2.41721
N6775 ; COOLING_NODE: 0
N6776 M204 S10000
N6777 G1 X192.29 Y201.845 F60000
N6778 ; FEATURE: Outer wall
N6779 ; LINE_WIDTH: 0.42
N6780 G1 F4773.528
N6781 M204 S5000
N6782 G1 X157.71 Y201.845 E1.03002
N6783 G1 X157.71 Y125.83 E2.26421
N6784 G1 X192.29 Y125.83 E1.03002
N6785 G1 X192.29 Y201.785 E2.26243
N6786 ; WIPE_START
N6787 M204 S8000
N6788 G1 X190.29 Y201.788 E-.76
N6789 ; WIPE_END
N6790 G1 E-.04 F1800
N6791 M204 S10000
N6792 G1 X186.037 Y201.104 Z4 F60000
N6793 G1 Z3.6
N6794 G1 E.8 F1800
N6795 ; FEATURE: Sparse infill
N6796 ; LINE_WIDTH: 0.45
N6797 G1 F4421.739
N6798 M204 S8000
N6799 G1 X187.665 Y201.104 E.05236
N6800 G1 X191.55 Y186.608 E.4826
N6801 G1 X191.55 Y184.98 E.05236
N6802 M204 S10000
N6803 G1 X191.55 Y187.325 F60000
N6804 G1 F4421.739
N6805 M204 S8000
N6806 G1 X158.45 Y196.194 E1.1019
N6807 G1 X158.45 Y197.822 E.05236
N6808 M204 S10000
N6809 G1 X158.45 Y185.938 F60000
N6810 G1 F4421.739
N6811 M204 S8000
N6812 G1 X158.45 Y184.31 E.05236
N6813 G1 X173.921 Y126.571 E1.92218
N6814 G1 X175.875 Y126.571 E.06281
N6815 G1 X191.55 Y142.245 E.71283
N6816 G1 X191.55 Y145.181 E.09439
N6817 G1 X158.45 Y154.05 E1.1019
N6818 G1 X158.45 Y155.202 E.03704
N6819 G1 X191.55 Y188.301 E1.50523
N6820 G1 X191.55 Y189.929 E.05236
N6821 M204 S10000
N6822 G1 X191.55 Y172.095 F60000
N6823 G1 F4421.739
N6824 M204 S8000
N6825 G1 X191.55 Y170.467 E.05236
N6826 G1 X158.45 Y179.336 E1.1019
N6827 G1 X158.45 Y178.23 E.03558
N6828 G1 X181.325 Y201.104 E1.04025
N6829 G1 X179.237 Y201.104 E.06716
N6830 G1 X191.55 Y155.151 E1.52981
N6831 G1 X191.55 Y153.963 E.03822
N6832 M204 S10000
N6833 G1 X191.55 Y135.124 F60000
N6834 G1 F4421.739
N6835 M204 S8000
N6836 G1 X191.55 Y136.752 E.05236
N6837 G1 X158.45 Y145.621 E1.1019
N6838 G1 X158.45 Y143.688 E.06216
N6839 G1 X191.55 Y176.787 E1.50523
N6840 G1 X191.55 Y178.896 E.06781
N6841 G1 X158.45 Y187.765 E1.1019
N6842 G1 X158.45 Y189.744 E.06363
N6843 G1 X169.811 Y201.104 E.51664
N6844 G1 X162.379 Y201.104 E.23899
N6845 G1 X182.35 Y126.571 E2.48129
N6846 G1 X180.722 Y126.571 E.05236
N6847 M204 S10000
N6848 G1 X168.262 Y126.571 F60000
N6849 G1 F4421.739
N6850 M204 S8000
N6851 G1 X166.634 Y126.571 E.05236
N6852 G1 X158.45 Y128.763 E.27244
N6853 G1 X158.45 Y132.174 E.10967
N6854 G1 X191.55 Y165.273 E1.50523
N6855 G1 X191.55 Y162.038 E.10402
N6856 G1 X158.45 Y170.907 E1.1019
N6857 G1 X158.45 Y166.716 E.13479
N6858 G1 X191.55 Y199.815 E1.50523
N6859 G1 X191.55 Y195.754 E.1306
N6860 G1 X171.58 Y201.104 E.66481
N6861 G1 X170.808 Y201.104 E.02483
N6862 G1 X190.779 Y126.571 E2.48129
N6863 G1 X187.389 Y126.571 E.10902
N6864 G1 X191.55 Y130.731 E.18922
N6865 G1 X191.55 Y128.323 E.07744
N6866 G1 X158.45 Y137.192 E1.1019
N6867 G1 X158.45 Y138.82 E.05236
N6868 M204 S10000
N6869 G1 X158.45 Y153.846 F60000
N6870 G1 F4421.739
N6871 M204 S8000
N6872 G1 X158.45 Y152.853 E.03194
N6873 G1 X165.493 Y126.571 E.87496
N6874 M204 S10000
N6875 G1 X162.733 Y126.571 F60000
N6876 G1 F4421.739
N6877 M204 S8000
N6878 G1 X164.361 Y126.571 E.05236
N6879 G1 X191.55 Y153.759 E1.23643
N6880 G1 X191.55 Y153.61 E.00481
N6881 G1 X158.45 Y162.479 E1.1019
N6882 G1 X158.45 Y160.85 E.05236
N6883 ; WIPE_START
N6884 G1 X158.45 Y162.479 E-.61876
N6885 G1 X158.809 Y162.382 E-.14124
N6886 ; WIPE_END
N6887 G1 E-.04 F1800
N6888 M204 S10000
N6889 G17
N6890 G3 Z4 I1.217 J0 P1  F60000
N6891 ; stop printing object, unique label id: 229
N6892 M625
N6893 ; object ids of layer 18 start: 229
N6894 M624 AQAAAAAAAAA=
N6895 ;======== H2D 20250527========
N6896 ; SKIPPABLE_START
N6897 ; SKIPTYPE: timelapse
N6898 M622.1 S1 ; for prev firware, default turned on
N6899 
N6900 M1002 judge_flag timelapse_record_flag
N6901 
N6902 M622 J1
N6903 M993 A2 B2 C2
N6904 M993 A0 B0 C0
N6905 
N6906 
N6907 
N6908 
N6909     M9711 M0 E1 X260 Y141 Z4 S11 C10 O0 T3000
N6910 
N6911 
N6912 
N6913 M993 A3 B3 C3
N6914 
N6915 M623
N6916 ; SKIPPABLE_END
N6917 
N6918 ; object ids of this layer18 end: 229
N6919 M625
N6920 ; CHANGE_LAYER
N6921 ; Z_HEIGHT: 3.8
N6922 ; LAYER_HEIGHT: 0.2
N6923 ;======== H2D 20250521========
N6924 ; layer num/total_layer_count: 19/63
N6925 ; update layer progress
N6926 M73 L19
N6927 M991 S0 P18 ;notify layer change
N6928 
N6929 
N6930 ; OBJECT_ID: 229
N6931 ; COOLING_NODE: 0
N6932 ; start printing object, unique label id: 229
N6933 M624 AQAAAAAAAAA=
N6934 G1 X191.898 Y201.453 F60000
N6935 G1 Z3.8
N6936 G1 E.8 F1800
N6937 ; FEATURE: Inner wall
N6938 ; LINE_WIDTH: 0.45
N6939 ; LAYER_HEIGHT: 0.2
N6940 G1 F4421.739
N6941 M204 S8000
N6942 G1 X158.102 Y201.453 E1.08675
N6943 G1 X158.102 Y126.222 E2.41914
N6944 G1 X191.898 Y126.222 E1.08675
N6945 G1 X191.898 Y201.393 E2.41721
N6946 ; COOLING_NODE: 0
N6947 M204 S10000
N6948 G1 X192.29 Y201.845 F60000
N6949 ; FEATURE: Outer wall
N6950 ; LINE_WIDTH: 0.42
N6951 G1 F4773.528
N6952 M204 S5000
N6953 G1 X157.71 Y201.845 E1.03002
N6954 G1 X157.71 Y125.83 E2.26421
N6955 G1 X192.29 Y125.83 E1.03002
N6956 G1 X192.29 Y201.785 E2.26243
N6957 ; WIPE_START
N6958 M204 S8000
N6959 G1 X190.29 Y201.788 E-.76
N6960 ; WIPE_END
N6961 G1 E-.04 F1800
N6962 M204 S10000
N6963 G1 X185.891 Y201.104 Z4.2 F60000
N6964 M73 P55 R22
N6965 G1 Z3.8
N6966 G1 E.8 F1800
N6967 ; FEATURE: Sparse infill
N6968 ; LINE_WIDTH: 0.45
N6969 G1 F4421.739
N6970 M204 S8000
N6971 G1 X187.519 Y201.104 E.05236
N6972 G1 X191.55 Y186.062 E.50079
N6973 G1 X191.55 Y184.433 E.05236
N6974 M204 S10000
N6975 G1 X191.55 Y172.242 F60000
N6976 G1 F4421.739
N6977 M204 S8000
N6978 M73 P55 R21
N6979 G1 X191.55 Y170.614 E.05236
N6980 G1 X158.45 Y179.483 E1.1019
N6981 G1 X158.45 Y178.03 E.04672
N6982 G1 X181.525 Y201.104 E1.04935
N6983 G1 X179.09 Y201.104 E.0783
N6984 G1 X191.55 Y154.605 E1.54801
N6985 G1 X191.55 Y153.96 E.02075
N6986 M204 S10000
N6987 G1 X191.55 Y135.27 F60000
N6988 G1 F4421.739
N6989 M204 S8000
N6990 G1 X191.55 Y136.898 E.05236
N6991 G1 X158.45 Y145.767 E1.1019
N6992 G1 X158.45 Y143.488 E.0733
N6993 G1 X191.55 Y176.587 E1.50523
N6994 G1 X191.55 Y179.042 E.07895
N6995 G1 X158.45 Y187.911 E1.1019
N6996 G1 X158.45 Y189.544 E.05249
N6997 G1 X170.011 Y201.104 E.52574
N6998 G1 X170.661 Y201.104 E.02091
N6999 G1 X190.633 Y126.571 E2.48129
N7000 G1 X187.589 Y126.571 E.09788
N7001 G1 X191.55 Y130.531 E.18012
N7002 G1 X191.55 Y128.47 E.0663
N7003 G1 X158.45 Y137.339 E1.1019
N7004 G1 X158.45 Y138.967 E.05236
N7005 M204 S10000
N7006 G1 X158.45 Y153.935 F60000
N7007 G1 F4421.739
N7008 M204 S8000
N7009 G1 X158.45 Y152.307 E.05236
N7010 G1 X165.346 Y126.571 E.85677
N7011 G1 X164.561 Y126.571 E.02525
N7012 G1 X191.55 Y153.559 E1.22734
N7013 G1 X191.55 Y153.756 E.00633
N7014 G1 X158.45 Y162.625 E1.1019
N7015 G1 X158.45 Y166.516 E.12511
N7016 G1 X191.55 Y199.615 E1.50523
N7017 G1 X191.55 Y195.9 E.11946
N7018 G1 X172.126 Y201.104 E.64662
N7019 G1 X170.865 Y201.104 E.04056
N7020 M204 S10000
N7021 G1 X158.45 Y185.392 F60000
N7022 G1 F4421.739
N7023 M204 S8000
N7024 G1 X158.45 Y183.763 E.05236
N7025 G1 X173.775 Y126.571 E1.90399
N7026 G1 X176.075 Y126.571 E.07395
N7027 G1 X191.55 Y142.045 E.70373
N7028 G1 X191.55 Y145.327 E.10553
N7029 G1 X158.45 Y154.196 E1.1019
N7030 G1 X158.45 Y155.002 E.02591
N7031 G1 X191.55 Y188.101 E1.50523
N7032 G1 X191.55 Y187.471 E.02026
N7033 G1 X158.45 Y196.34 E1.1019
N7034 G1 X158.45 Y201.104 E.1532
N7035 G1 X162.233 Y201.104 E.12162
N7036 G1 X182.204 Y126.571 E2.48129
N7037 G1 X180.576 Y126.571 E.05236
N7038 M204 S10000
N7039 G1 X168.809 Y126.571 F60000
N7040 G1 F4421.739
N7041 M204 S8000
N7042 G1 X167.18 Y126.571 E.05236
N7043 G1 X158.45 Y128.91 E.29063
N7044 G1 X158.45 Y131.974 E.09853
N7045 G1 X191.55 Y165.073 E1.50523
N7046 G1 X191.55 Y162.185 E.09288
N7047 G1 X158.45 Y171.054 E1.1019
N7048 G1 X158.45 Y172.682 E.05236
N7049 ; WIPE_START
N7050 G1 X158.45 Y171.054 E-.61876
N7051 G1 X158.809 Y170.958 E-.14124
N7052 ; WIPE_END
N7053 G1 E-.04 F1800
N7054 M204 S10000
N7055 G17
N7056 G3 Z4.2 I1.217 J0 P1  F60000
N7057 ; stop printing object, unique label id: 229
N7058 M625
N7059 ; object ids of layer 19 start: 229
N7060 M624 AQAAAAAAAAA=
N7061 ;======== H2D 20250527========
N7062 ; SKIPPABLE_START
N7063 ; SKIPTYPE: timelapse
N7064 M622.1 S1 ; for prev firware, default turned on
N7065 
N7066 M1002 judge_flag timelapse_record_flag
N7067 
N7068 M622 J1
N7069 M993 A2 B2 C2
N7070 M993 A0 B0 C0
N7071 
N7072 
N7073 
N7074 
N7075     M9711 M0 E1 X260 Y141 Z4.2 S11 C10 O0 T3000
N7076 
N7077 
N7078 
N7079 M993 A3 B3 C3
N7080 
N7081 M623
N7082 ; SKIPPABLE_END
N7083 
N7084 ; object ids of this layer19 end: 229
N7085 M625
N7086 ; CHANGE_LAYER
N7087 ; Z_HEIGHT: 4
N7088 ; LAYER_HEIGHT: 0.2
N7089 ;======== H2D 20250521========
N7090 ; layer num/total_layer_count: 20/63
N7091 ; update layer progress
N7092 M73 L20
N7093 M991 S0 P19 ;notify layer change
N7094 
N7095 
N7096 ; OBJECT_ID: 229
N7097 ; COOLING_NODE: 0
N7098 ; start printing object, unique label id: 229
N7099 M624 AQAAAAAAAAA=
N7100 G1 X191.898 Y201.453 F60000
N7101 G1 Z4
N7102 G1 E.8 F1800
N7103 ; FEATURE: Inner wall
N7104 ; LINE_WIDTH: 0.45
N7105 ; LAYER_HEIGHT: 0.2
N7106 G1 F4421.739
N7107 M204 S8000
N7108 G1 X158.102 Y201.453 E1.08675
N7109 G1 X158.102 Y126.222 E2.41914
N7110 G1 X191.898 Y126.222 E1.08675
N7111 G1 X191.898 Y201.393 E2.41721
N7112 ; COOLING_NODE: 0
N7113 M204 S10000
N7114 G1 X192.29 Y201.845 F60000
N7115 ; FEATURE: Outer wall
N7116 ; LINE_WIDTH: 0.42
N7117 G1 F4773.528
N7118 M204 S5000
N7119 G1 X157.71 Y201.845 E1.03002
N7120 G1 X157.71 Y125.83 E2.26421
N7121 G1 X192.29 Y125.83 E1.03002
N7122 G1 X192.29 Y201.785 E2.26243
N7123 ; WIPE_START
N7124 M204 S8000
N7125 G1 X190.29 Y201.788 E-.76
N7126 ; WIPE_END
N7127 G1 E-.04 F1800
N7128 M204 S10000
N7129 G1 X189.001 Y201.104 Z4.4 F60000
N7130 G1 Z4
N7131 G1 E.8 F1800
N7132 ; FEATURE: Sparse infill
N7133 ; LINE_WIDTH: 0.45
N7134 G1 F4421.739
N7135 M204 S8000
N7136 G1 X187.373 Y201.104 E.05236
N7137 G1 X191.55 Y185.515 E.51898
N7138 G1 X191.55 Y183.887 E.05236
N7139 M204 S10000
N7140 G1 X191.55 Y169.132 F60000
N7141 G1 F4421.739
N7142 M204 S8000
N7143 G1 X191.55 Y170.76 E.05236
N7144 G1 X158.45 Y179.629 E1.1019
N7145 G1 X158.45 Y177.83 E.05786
N7146 G1 X181.725 Y201.104 E1.05844
N7147 G1 X178.944 Y201.104 E.08944
N7148 G1 X191.55 Y154.058 E1.5662
N7149 G1 X191.55 Y153.902 E.00502
N7150 G1 X158.45 Y162.771 E1.1019
N7151 G1 X158.45 Y166.316 E.11397
N7152 G1 X191.55 Y199.415 E1.50523
N7153 G1 X191.55 Y196.046 E.10832
N7154 G1 X172.673 Y201.104 E.62843
N7155 G1 X171.044 Y201.104 E.05236
N7156 M204 S10000
N7157 G1 X158.45 Y184.845 F60000
N7158 G1 F4421.739
N7159 M204 S8000
N7160 G1 X158.45 Y183.217 E.05236
N7161 G1 X173.629 Y126.571 E1.8858
N7162 G1 X176.275 Y126.571 E.08509
N7163 G1 X191.55 Y141.845 E.69464
N7164 G1 X191.55 Y145.474 E.11667
N7165 G1 X158.45 Y154.343 E1.1019
N7166 G1 X158.45 Y154.802 E.01477
N7167 G1 X191.55 Y187.901 E1.50523
N7168 G1 X191.55 Y187.618 E.00912
N7169 G1 X158.45 Y196.487 E1.1019
N7170 G1 X158.45 Y200.858 E.14056
N7171 G1 X158.697 Y201.104 E.01123
N7172 G1 X162.086 Y201.104 E.10898
N7173 G1 X182.057 Y126.571 E2.48129
N7174 G1 X180.429 Y126.571 E.05236
N7175 M204 S10000
N7176 G1 X169.355 Y126.571 F60000
N7177 G1 F4421.739
N7178 M204 S8000
N7179 G1 X167.727 Y126.571 E.05236
N7180 G1 X158.45 Y129.056 E.30882
N7181 G1 X158.45 Y131.774 E.08739
N7182 G1 X191.55 Y164.873 E1.50523
N7183 G1 X191.55 Y162.331 E.08174
N7184 G1 X158.45 Y171.2 E1.1019
N7185 G1 X158.45 Y172.828 E.05236
N7186 M204 S10000
N7187 M73 P56 R21
N7188 G1 X191.55 Y151.731 F60000
N7189 G1 F4421.739
N7190 M204 S8000
N7191 G1 X191.55 Y153.359 E.05236
N7192 G1 X164.761 Y126.571 E1.21824
N7193 G1 X165.2 Y126.571 E.01411
N7194 G1 X158.45 Y151.76 E.83858
N7195 G1 X158.45 Y153.388 E.05236
N7196 M204 S10000
N7197 G1 X158.45 Y139.113 F60000
N7198 G1 F4421.739
N7199 M204 S8000
N7200 G1 X158.45 Y137.485 E.05236
N7201 G1 X191.55 Y128.616 E1.1019
N7202 G1 X191.55 Y130.331 E.05516
N7203 G1 X187.789 Y126.571 E.17103
N7204 G1 X190.486 Y126.571 E.08674
N7205 G1 X170.515 Y201.104 E2.48129
N7206 G1 X170.211 Y201.104 E.00977
N7207 G1 X158.45 Y189.344 E.53484
N7208 G1 X158.45 Y188.058 E.04135
N7209 G1 X191.55 Y179.189 E1.1019
N7210 G1 X191.55 Y176.387 E.09009
N7211 G1 X158.45 Y143.288 E1.50523
N7212 G1 X158.45 Y145.914 E.08444
N7213 G1 X191.55 Y137.045 E1.1019
N7214 G1 X191.55 Y135.417 E.05236
N7215 ; WIPE_START
N7216 G1 X191.55 Y137.045 E-.61876
N7217 G1 X191.191 Y137.141 E-.14124
N7218 ; WIPE_END
N7219 G1 E-.04 F1800
N7220 M204 S10000
N7221 G17
N7222 G3 Z4.4 I1.217 J0 P1  F60000
N7223 ; stop printing object, unique label id: 229
N7224 M625
N7225 ; object ids of layer 20 start: 229
N7226 M624 AQAAAAAAAAA=
N7227 ;======== H2D 20250527========
N7228 ; SKIPPABLE_START
N7229 ; SKIPTYPE: timelapse
N7230 M622.1 S1 ; for prev firware, default turned on
N7231 
N7232 M1002 judge_flag timelapse_record_flag
N7233 
N7234 M622 J1
N7235 M993 A2 B2 C2
N7236 M993 A0 B0 C0
N7237 
N7238 
N7239 
N7240 
N7241     M9711 M0 E1 X260 Y141 Z4.4 S11 C10 O0 T3000
N7242 
N7243 
N7244 
N7245 M993 A3 B3 C3
N7246 
N7247 M623
N7248 ; SKIPPABLE_END
N7249 
N7250 ; object ids of this layer20 end: 229
N7251 M625
N7252 ; CHANGE_LAYER
N7253 ; Z_HEIGHT: 4.2
N7254 ; LAYER_HEIGHT: 0.2
N7255 ;======== H2D 20250521========
N7256 ; layer num/total_layer_count: 21/63
N7257 ; update layer progress
N7258 M73 L21
N7259 M991 S0 P20 ;notify layer change
N7260 
N7261 
N7262 ; OBJECT_ID: 229
N7263 ; COOLING_NODE: 0
N7264 ; start printing object, unique label id: 229
N7265 M624 AQAAAAAAAAA=
N7266 G1 X191.898 Y201.453 F60000
N7267 G1 Z4.2
N7268 G1 E.8 F1800
N7269 ; FEATURE: Inner wall
N7270 ; LINE_WIDTH: 0.45
N7271 ; LAYER_HEIGHT: 0.2
N7272 G1 F4421.739
N7273 M204 S8000
N7274 G1 X158.102 Y201.453 E1.08675
N7275 G1 X158.102 Y126.222 E2.41914
N7276 G1 X191.898 Y126.222 E1.08675
N7277 G1 X191.898 Y201.393 E2.41721
N7278 ; COOLING_NODE: 0
N7279 M204 S10000
N7280 G1 X192.29 Y201.845 F60000
N7281 ; FEATURE: Outer wall
N7282 ; LINE_WIDTH: 0.42
N7283 G1 F4773.528
N7284 M204 S5000
N7285 G1 X157.71 Y201.845 E1.03002
N7286 G1 X157.71 Y125.83 E2.26421
N7287 G1 X192.29 Y125.83 E1.03002
N7288 G1 X192.29 Y201.785 E2.26243
N7289 ; WIPE_START
N7290 M204 S8000
N7291 G1 X190.29 Y201.788 E-.76
N7292 ; WIPE_END
N7293 G1 E-.04 F1800
N7294 M204 S10000
N7295 G1 X188.854 Y201.104 Z4.6 F60000
N7296 G1 Z4.2
N7297 G1 E.8 F1800
N7298 ; FEATURE: Sparse infill
N7299 ; LINE_WIDTH: 0.45
N7300 G1 F4421.739
N7301 M204 S8000
N7302 G1 X187.226 Y201.104 E.05236
N7303 G1 X191.55 Y184.969 E.53717
N7304 G1 X191.55 Y183.34 E.05236
N7305 M204 S10000
N7306 G1 X191.55 Y169.278 F60000
N7307 G1 F4421.739
N7308 M204 S8000
N7309 G1 X191.55 Y170.906 E.05236
N7310 G1 X158.45 Y179.775 E1.1019
N7311 G1 X158.45 Y177.63 E.069
N7312 G1 X181.925 Y201.104 E1.06754
N7313 G1 X178.797 Y201.104 E.10058
N7314 G1 X191.55 Y153.512 E1.58439
N7315 G1 X191.55 Y153.159 E.01134
N7316 G1 X164.961 Y126.571 E1.20915
N7317 G1 X165.053 Y126.571 E.00298
N7318 G1 X158.45 Y151.214 E.82039
N7319 G1 X158.45 Y152.842 E.05236
N7320 M204 S10000
N7321 G1 X158.45 Y136.003 F60000
N7322 G1 F4421.739
N7323 M204 S8000
N7324 G1 X158.45 Y137.631 E.05236
N7325 G1 X191.55 Y128.762 E1.1019
N7326 G1 X191.55 Y130.131 E.04402
N7327 G1 X187.989 Y126.571 E.16193
N7328 G1 X190.34 Y126.571 E.0756
N7329 G1 X170.369 Y201.104 E2.48129
N7330 G1 X170.411 Y201.104 E.00137
N7331 G1 X158.45 Y189.144 E.54393
N7332 G1 X158.45 Y188.204 E.03021
N7333 G1 X191.55 Y179.335 E1.1019
N7334 G1 X191.55 Y176.187 E.10123
N7335 G1 X158.45 Y143.088 E1.50523
N7336 G1 X158.45 Y146.06 E.09558
N7337 G1 X191.55 Y137.191 E1.1019
N7338 G1 X191.55 Y135.563 E.05236
N7339 M204 S10000
N7340 G1 X183.539 Y126.571 F60000
N7341 G1 F4421.739
N7342 M204 S8000
N7343 G1 X181.911 Y126.571 E.05236
N7344 G1 X161.94 Y201.104 E2.48129
N7345 G1 X158.897 Y201.104 E.09784
N7346 G1 X158.45 Y200.658 E.02032
N7347 G1 X158.45 Y196.633 E.12942
N7348 G1 X191.55 Y187.764 E1.1019
N7349 G1 X191.55 Y187.701 E.00202
N7350 G1 X158.45 Y154.602 E1.50523
N7351 G1 X158.45 Y154.489 E.00363
N7352 G1 X191.55 Y145.62 E1.1019
N7353 G1 X191.55 Y141.645 E.12781
N7354 G1 X176.475 Y126.571 E.68554
N7355 G1 X173.482 Y126.571 E.09623
N7356 G1 X158.45 Y182.67 E1.86761
N7357 G1 X158.45 Y184.299 E.05236
N7358 M204 S10000
N7359 G1 X158.45 Y172.975 F60000
N7360 G1 F4421.739
N7361 M204 S8000
N7362 G1 X158.45 Y171.347 E.05236
N7363 G1 X191.55 Y162.478 E1.1019
N7364 G1 X191.55 Y164.673 E.0706
N7365 G1 X158.45 Y131.574 E1.50523
N7366 G1 X158.45 Y129.203 E.07625
N7367 G1 X168.273 Y126.571 E.32701
N7368 G1 X169.902 Y126.571 E.05236
N7369 M204 S10000
N7370 G1 X191.55 Y154.049 F60000
N7371 G1 F4421.739
N7372 M204 S8000
N7373 G1 X158.45 Y162.918 E1.1019
N7374 G1 X158.45 Y166.116 E.10283
N7375 G1 X191.55 Y199.215 E1.50523
N7376 G1 X191.55 Y196.193 E.09719
N7377 G1 X173.219 Y201.104 E.61024
N7378 G1 X171.591 Y201.104 E.05236
N7379 ; WIPE_START
N7380 G1 X173.219 Y201.104 E-.61876
N7381 G1 X173.578 Y201.008 E-.14124
N7382 ; WIPE_END
N7383 G1 E-.04 F1800
N7384 M204 S10000
N7385 G17
N7386 G3 Z4.6 I1.217 J0 P1  F60000
N7387 ; stop printing object, unique label id: 229
N7388 M625
N7389 ; object ids of layer 21 start: 229
N7390 M624 AQAAAAAAAAA=
N7391 ;======== H2D 20250527========
N7392 ; SKIPPABLE_START
N7393 ; SKIPTYPE: timelapse
N7394 M622.1 S1 ; for prev firware, default turned on
N7395 
N7396 M1002 judge_flag timelapse_record_flag
N7397 
N7398 M622 J1
N7399 M993 A2 B2 C2
N7400 M993 A0 B0 C0
N7401 
N7402 
N7403 
N7404 
N7405     M9711 M0 E1 X260 Y141 Z4.6 S11 C10 O0 T3000
N7406 
N7407 
N7408 
N7409 M993 A3 B3 C3
N7410 
N7411 M623
N7412 ; SKIPPABLE_END
N7413 
N7414 ; object ids of this layer21 end: 229
N7415 M625
N7416 ; CHANGE_LAYER
N7417 ; Z_HEIGHT: 4.4
N7418 ; LAYER_HEIGHT: 0.2
N7419 ;======== H2D 20250521========
N7420 ; layer num/total_layer_count: 22/63
N7421 ; update layer progress
N7422 M73 L22
N7423 M991 S0 P21 ;notify layer change
N7424 
N7425 
N7426 M106 S71.4
N7427 ; OBJECT_ID: 229
N7428 ; COOLING_NODE: 0
N7429 ; start printing object, unique label id: 229
N7430 M624 AQAAAAAAAAA=
N7431 G1 X191.898 Y201.453 F60000
N7432 G1 Z4.4
N7433 G1 E.8 F1800
N7434 ; FEATURE: Inner wall
N7435 ; LINE_WIDTH: 0.45
N7436 ; LAYER_HEIGHT: 0.2
N7437 G1 F4421.739
N7438 M204 S8000
N7439 G1 X158.102 Y201.453 E1.08675
N7440 G1 X158.102 Y126.222 E2.41914
N7441 G1 X191.898 Y126.222 E1.08675
N7442 G1 X191.898 Y201.393 E2.41721
N7443 ; COOLING_NODE: 0
N7444 M204 S10000
N7445 G1 X192.29 Y201.845 F60000
N7446 ; FEATURE: Outer wall
N7447 ; LINE_WIDTH: 0.42
N7448 G1 F4773.528
N7449 M204 S5000
N7450 G1 X157.71 Y201.845 E1.03002
N7451 G1 X157.71 Y125.83 E2.26421
N7452 G1 X192.29 Y125.83 E1.03002
N7453 G1 X192.29 Y201.785 E2.26243
N7454 ; WIPE_START
N7455 M204 S8000
N7456 M73 P57 R21
N7457 G1 X190.29 Y201.788 E-.76
N7458 ; WIPE_END
N7459 G1 E-.04 F1800
N7460 M204 S10000
N7461 G1 X188.708 Y201.104 Z4.8 F60000
N7462 M73 P57 R20
N7463 G1 Z4.4
N7464 G1 E.8 F1800
N7465 ; FEATURE: Sparse infill
N7466 ; LINE_WIDTH: 0.45
N7467 G1 F4421.739
N7468 M204 S8000
N7469 G1 X187.08 Y201.104 E.05236
N7470 G1 X191.55 Y184.422 E.55536
N7471 G1 X191.55 Y182.794 E.05236
N7472 M204 S10000
N7473 G1 X191.55 Y169.424 F60000
N7474 G1 F4421.739
N7475 M204 S8000
N7476 G1 X191.55 Y171.053 E.05236
N7477 G1 X158.45 Y179.922 E1.1019
N7478 G1 X158.45 Y177.43 E.08014
N7479 G1 X182.125 Y201.104 E1.07663
N7480 G1 X178.651 Y201.104 E.11172
N7481 G1 X191.55 Y152.959 E1.60277
N7482 G1 X165.161 Y126.571 E1.20005
N7483 G1 X164.907 Y126.571 E.00816
N7484 G1 X158.45 Y150.667 E.8022
N7485 G1 X158.45 Y152.296 E.05236
N7486 M204 S10000
N7487 G1 X158.45 Y136.149 F60000
N7488 G1 F4421.739
N7489 M204 S8000
N7490 G1 X158.45 Y137.778 E.05236
N7491 G1 X191.55 Y128.909 E1.1019
N7492 G1 X191.55 Y129.931 E.03288
N7493 G1 X188.189 Y126.571 E.15284
N7494 G1 X190.193 Y126.571 E.06446
N7495 G1 X170.222 Y201.104 E2.48129
N7496 G1 X170.611 Y201.104 E.01251
N7497 G1 X158.45 Y188.944 E.55303
N7498 G1 X158.45 Y188.351 E.01907
N7499 G1 X191.55 Y179.482 E1.1019
N7500 G1 X191.55 Y175.987 E.11237
N7501 G1 X158.45 Y142.888 E1.50523
N7502 G1 X158.45 Y146.207 E.10672
N7503 G1 X191.55 Y137.338 E1.1019
N7504 G1 X191.55 Y141.445 E.13209
N7505 G1 X176.675 Y126.571 E.67645
N7506 G1 X173.336 Y126.571 E.10737
N7507 G1 X158.45 Y182.124 E1.84942
N7508 G1 X158.45 Y183.752 E.05236
N7509 M204 S10000
N7510 G1 X158.45 Y173.121 F60000
N7511 G1 F4421.739
N7512 M204 S8000
N7513 G1 X158.45 Y171.493 E.05236
N7514 G1 X191.55 Y162.624 E1.1019
N7515 G1 X191.55 Y164.473 E.05946
N7516 G1 X158.45 Y131.374 E1.50523
N7517 G1 X158.45 Y129.349 E.06511
N7518 G1 X168.82 Y126.571 E.3452
N7519 G1 X170.448 Y126.571 E.05236
N7520 M204 S10000
N7521 G1 X183.393 Y126.571 F60000
N7522 G1 F4421.739
N7523 M204 S8000
N7524 G1 X181.765 Y126.571 E.05236
N7525 G1 X161.793 Y201.104 E2.48129
N7526 G1 X159.097 Y201.104 E.0867
N7527 G1 X158.45 Y200.458 E.02942
N7528 G1 X158.45 Y196.779 E.11828
N7529 G1 X191.55 Y187.91 E1.1019
N7530 G1 X191.55 Y187.501 E.01316
N7531 G1 X158.45 Y154.402 E1.50523
N7532 G1 X158.45 Y154.635 E.00751
N7533 G1 X191.55 Y145.766 E1.1019
N7534 G1 X191.55 Y147.395 E.05236
N7535 M204 S10000
N7536 G1 X191.55 Y154.195 F60000
N7537 G1 F4421.739
N7538 M204 S8000
N7539 G1 X158.45 Y163.064 E1.1019
N7540 G1 X158.45 Y165.916 E.0917
N7541 G1 X191.55 Y199.015 E1.50523
N7542 G1 X191.55 Y196.339 E.08605
N7543 G1 X173.766 Y201.104 E.59205
N7544 G1 X172.137 Y201.104 E.05236
N7545 ; WIPE_START
N7546 G1 X173.766 Y201.104 E-.61876
N7547 G1 X174.125 Y201.008 E-.14124
N7548 ; WIPE_END
N7549 G1 E-.04 F1800
N7550 M204 S10000
N7551 G17
N7552 G3 Z4.8 I1.217 J0 P1  F60000
N7553 ; stop printing object, unique label id: 229
N7554 M625
N7555 ; object ids of layer 22 start: 229
N7556 M624 AQAAAAAAAAA=
N7557 ;======== H2D 20250527========
N7558 ; SKIPPABLE_START
N7559 ; SKIPTYPE: timelapse
N7560 M622.1 S1 ; for prev firware, default turned on
N7561 
N7562 M1002 judge_flag timelapse_record_flag
N7563 
N7564 M622 J1
N7565 M993 A2 B2 C2
N7566 M993 A0 B0 C0
N7567 
N7568 
N7569 
N7570 
N7571     M9711 M0 E1 X260 Y141 Z4.8 S11 C10 O0 T3000
N7572 
N7573 
N7574 
N7575 M993 A3 B3 C3
N7576 
N7577 M623
N7578 ; SKIPPABLE_END
N7579 
N7580 ; object ids of this layer22 end: 229
N7581 M625
N7582 ; CHANGE_LAYER
N7583 ; Z_HEIGHT: 4.6
N7584 ; LAYER_HEIGHT: 0.2
N7585 ;======== H2D 20250521========
N7586 ; layer num/total_layer_count: 23/63
N7587 ; update layer progress
N7588 M73 L23
N7589 M991 S0 P22 ;notify layer change
N7590 
N7591 
N7592 ; OBJECT_ID: 229
N7593 ; COOLING_NODE: 0
N7594 ; start printing object, unique label id: 229
N7595 M624 AQAAAAAAAAA=
N7596 G1 X191.898 Y201.453 F60000
N7597 G1 Z4.6
N7598 G1 E.8 F1800
N7599 ; FEATURE: Inner wall
N7600 ; LINE_WIDTH: 0.45
N7601 ; LAYER_HEIGHT: 0.2
N7602 G1 F4421.739
N7603 M204 S8000
N7604 G1 X158.102 Y201.453 E1.08675
N7605 G1 X158.102 Y126.222 E2.41914
N7606 G1 X191.898 Y126.222 E1.08675
N7607 G1 X191.898 Y201.393 E2.41721
N7608 ; COOLING_NODE: 0
N7609 M204 S10000
N7610 G1 X192.29 Y201.845 F60000
N7611 ; FEATURE: Outer wall
N7612 ; LINE_WIDTH: 0.42
N7613 G1 F4773.528
N7614 M204 S5000
N7615 G1 X157.71 Y201.845 E1.03002
N7616 G1 X157.71 Y125.83 E2.26421
N7617 G1 X192.29 Y125.83 E1.03002
N7618 G1 X192.29 Y201.785 E2.26243
N7619 ; WIPE_START
N7620 M204 S8000
N7621 G1 X190.29 Y201.788 E-.76
N7622 ; WIPE_END
N7623 G1 E-.04 F1800
N7624 M204 S10000
N7625 G1 X188.562 Y201.104 Z5 F60000
N7626 G1 Z4.6
N7627 G1 E.8 F1800
N7628 ; FEATURE: Sparse infill
N7629 ; LINE_WIDTH: 0.45
N7630 G1 F4421.739
N7631 M204 S8000
N7632 G1 X186.933 Y201.104 E.05236
N7633 G1 X191.55 Y183.876 E.57355
N7634 G1 X191.55 Y182.248 E.05236
N7635 M204 S10000
N7636 G1 X191.55 Y169.571 F60000
N7637 G1 F4421.739
N7638 M204 S8000
N7639 G1 X191.55 Y171.199 E.05236
N7640 G1 X158.45 Y180.068 E1.1019
N7641 G1 X158.45 Y177.23 E.09128
N7642 G1 X182.325 Y201.104 E1.08573
N7643 G1 X178.505 Y201.104 E.12286
N7644 G1 X191.55 Y152.419 E1.62077
N7645 G1 X191.55 Y152.759 E.01094
N7646 G1 X165.361 Y126.571 E1.19096
N7647 G1 X164.761 Y126.571 E.0193
N7648 G1 X158.45 Y150.121 E.78401
N7649 G1 X158.45 Y151.749 E.05236
N7650 M204 S10000
N7651 G1 X158.45 Y136.296 F60000
N7652 G1 F4421.739
N7653 M204 S8000
N7654 G1 X158.45 Y137.924 E.05236
N7655 G1 X191.55 Y129.055 E1.1019
N7656 G1 X191.55 Y129.731 E.02174
N7657 G1 X188.389 Y126.571 E.14374
N7658 G1 X190.047 Y126.571 E.05332
N7659 G1 X170.076 Y201.104 E2.48129
N7660 G1 X170.811 Y201.104 E.02365
N7661 G1 X158.45 Y188.744 E.56212
N7662 G1 X158.45 Y188.497 E.00793
N7663 G1 X191.55 Y179.628 E1.1019
N7664 G1 X191.55 Y175.787 E.12351
N7665 G1 X158.45 Y142.688 E1.50523
N7666 G1 X158.45 Y146.353 E.11786
N7667 G1 X191.55 Y137.484 E1.1019
N7668 G1 X191.55 Y141.245 E.12095
N7669 G1 X176.875 Y126.571 E.66735
N7670 G1 X173.189 Y126.571 E.11851
N7671 M73 P58 R20
N7672 G1 X158.45 Y181.578 E1.83123
N7673 G1 X158.45 Y183.206 E.05236
N7674 M204 S10000
N7675 G1 X158.45 Y170.011 F60000
N7676 G1 F4421.739
N7677 M204 S8000
N7678 G1 X158.45 Y171.639 E.05236
N7679 G1 X191.55 Y162.77 E1.1019
N7680 G1 X191.55 Y164.273 E.04832
N7681 G1 X158.45 Y131.174 E1.50523
N7682 G1 X158.45 Y129.495 E.05397
N7683 G1 X169.366 Y126.571 E.3634
N7684 G1 X170.994 Y126.571 E.05236
N7685 M204 S10000
N7686 G1 X183.247 Y126.571 F60000
N7687 G1 F4421.739
N7688 M204 S8000
N7689 G1 X181.618 Y126.571 E.05236
N7690 G1 X161.647 Y201.104 E2.48129
N7691 G1 X159.297 Y201.104 E.07556
N7692 G1 X158.45 Y200.258 E.03851
N7693 G1 X158.45 Y196.926 E.10714
N7694 G1 X191.55 Y188.057 E1.1019
N7695 G1 X191.55 Y187.301 E.0243
N7696 G1 X158.45 Y154.202 E1.50523
N7697 G1 X158.45 Y154.782 E.01865
N7698 G1 X191.55 Y145.913 E1.1019
N7699 G1 X191.55 Y147.541 E.05236
N7700 M204 S10000
N7701 G1 X191.55 Y155.97 F60000
N7702 G1 F4421.739
N7703 M204 S8000
N7704 G1 X191.55 Y154.342 E.05236
N7705 G1 X158.45 Y163.211 E1.1019
N7706 G1 X158.45 Y165.716 E.08056
N7707 G1 X191.55 Y198.815 E1.50523
N7708 G1 X191.55 Y196.486 E.07491
N7709 G1 X174.312 Y201.104 E.57385
N7710 G1 X172.684 Y201.104 E.05236
N7711 ; WIPE_START
N7712 G1 X174.312 Y201.104 E-.61876
N7713 G1 X174.671 Y201.008 E-.14124
N7714 ; WIPE_END
N7715 G1 E-.04 F1800
N7716 M204 S10000
N7717 G17
N7718 G3 Z5 I1.217 J0 P1  F60000
N7719 ; stop printing object, unique label id: 229
N7720 M625
N7721 ; object ids of layer 23 start: 229
N7722 M624 AQAAAAAAAAA=
N7723 ;======== H2D 20250527========
N7724 ; SKIPPABLE_START
N7725 ; SKIPTYPE: timelapse
N7726 M622.1 S1 ; for prev firware, default turned on
N7727 
N7728 M1002 judge_flag timelapse_record_flag
N7729 
N7730 M622 J1
N7731 M993 A2 B2 C2
N7732 M993 A0 B0 C0
N7733 
N7734 
N7735 
N7736 
N7737     M9711 M0 E1 X260 Y141 Z5 S11 C10 O0 T3000
N7738 
N7739 
N7740 
N7741 M993 A3 B3 C3
N7742 
N7743 M623
N7744 ; SKIPPABLE_END
N7745 
N7746 ; object ids of this layer23 end: 229
N7747 M625
N7748 ; CHANGE_LAYER
N7749 ; Z_HEIGHT: 4.8
N7750 ; LAYER_HEIGHT: 0.2
N7751 ;======== H2D 20250521========
N7752 ; layer num/total_layer_count: 24/63
N7753 ; update layer progress
N7754 M73 L24
N7755 M991 S0 P23 ;notify layer change
N7756 
N7757 
N7758 M106 S68.85
N7759 ; OBJECT_ID: 229
N7760 ; COOLING_NODE: 0
N7761 ; start printing object, unique label id: 229
N7762 M624 AQAAAAAAAAA=
N7763 G1 X191.898 Y201.453 F60000
N7764 G1 Z4.8
N7765 G1 E.8 F1800
N7766 ; FEATURE: Inner wall
N7767 ; LINE_WIDTH: 0.45
N7768 ; LAYER_HEIGHT: 0.2
N7769 G1 F4421.739
N7770 M204 S8000
N7771 G1 X158.102 Y201.453 E1.08675
N7772 G1 X158.102 Y126.222 E2.41914
N7773 G1 X191.898 Y126.222 E1.08675
N7774 G1 X191.898 Y201.393 E2.41721
N7775 ; COOLING_NODE: 0
N7776 M204 S10000
N7777 G1 X192.29 Y201.845 F60000
N7778 ; FEATURE: Outer wall
N7779 ; LINE_WIDTH: 0.42
N7780 G1 F4773.528
N7781 M204 S5000
N7782 G1 X157.71 Y201.845 E1.03002
N7783 G1 X157.71 Y125.83 E2.26421
N7784 G1 X192.29 Y125.83 E1.03002
N7785 G1 X192.29 Y201.785 E2.26243
N7786 ; WIPE_START
N7787 M204 S8000
N7788 G1 X190.29 Y201.788 E-.76
N7789 ; WIPE_END
N7790 G1 E-.04 F1800
N7791 M204 S10000
N7792 G1 X188.415 Y201.104 Z5.2 F60000
N7793 G1 Z4.8
N7794 G1 E.8 F1800
N7795 ; FEATURE: Sparse infill
N7796 ; LINE_WIDTH: 0.45
N7797 G1 F4421.739
N7798 M204 S8000
N7799 G1 X186.787 Y201.104 E.05236
N7800 G1 X191.55 Y183.329 E.59174
N7801 G1 X191.55 Y179.774 E.11432
N7802 G1 X158.45 Y188.643 E1.1019
N7803 G1 X158.45 Y188.544 E.00321
N7804 G1 X171.011 Y201.104 E.57122
N7805 G1 X169.929 Y201.104 E.03479
N7806 G1 X189.901 Y126.571 E2.48129
N7807 G1 X188.589 Y126.571 E.04218
N7808 G1 X191.55 Y129.531 E.13465
N7809 G1 X191.55 Y129.202 E.0106
N7810 G1 X158.45 Y138.071 E1.1019
N7811 G1 X158.45 Y136.442 E.05236
N7812 M204 S10000
N7813 G1 X158.45 Y151.203 F60000
N7814 G1 F4421.739
N7815 M204 S8000
N7816 G1 X158.45 Y149.575 E.05236
N7817 G1 X164.614 Y126.571 E.76582
N7818 G1 X165.561 Y126.571 E.03044
N7819 G1 X191.55 Y152.559 E1.18186
N7820 M204 S10000
N7821 G1 X191.55 Y156.116 F60000
N7822 G1 F4421.739
N7823 M204 S8000
N7824 G1 X191.55 Y154.488 E.05236
N7825 G1 X158.45 Y163.357 E1.1019
N7826 G1 X158.45 Y165.516 E.06942
N7827 G1 X191.55 Y198.615 E1.50523
N7828 G1 X191.55 Y196.632 E.06377
N7829 G1 X174.858 Y201.104 E.55566
N7830 G1 X173.23 Y201.104 E.05236
N7831 M204 S10000
N7832 G1 X158.45 Y182.66 F60000
N7833 G1 F4421.739
N7834 M204 S8000
N7835 G1 X158.45 Y181.031 E.05236
N7836 G1 X173.043 Y126.571 E1.81304
N7837 G1 X169.913 Y126.571 E.10066
N7838 G1 X158.45 Y129.642 E.38159
N7839 G1 X158.45 Y130.974 E.04283
N7840 G1 X191.55 Y164.073 E1.50523
N7841 G1 X191.55 Y162.917 E.03718
N7842 G1 X158.45 Y171.786 E1.1019
N7843 G1 X158.45 Y177.03 E.16862
N7844 G1 X182.525 Y201.104 E1.09482
N7845 G1 X178.358 Y201.104 E.134
N7846 G1 X191.55 Y151.873 E1.63896
N7847 G1 X191.55 Y146.059 E.18694
N7848 G1 X158.45 Y154.928 E1.1019
N7849 G1 X158.45 Y154.002 E.02979
N7850 G1 X191.55 Y187.101 E1.50523
N7851 G1 X191.55 Y188.203 E.03544
N7852 G1 X158.45 Y197.072 E1.1019
N7853 G1 X158.45 Y200.058 E.096
N7854 G1 X159.497 Y201.104 E.04761
N7855 G1 X161.501 Y201.104 E.06442
N7856 G1 X181.472 Y126.571 E2.48129
N7857 G1 X177.075 Y126.571 E.14139
N7858 G1 X191.55 Y141.045 E.65826
N7859 G1 X191.55 Y137.63 E.10981
N7860 G1 X158.45 Y146.499 E1.1019
N7861 G1 X158.45 Y142.488 E.129
N7862 G1 X191.55 Y175.587 E1.50523
N7863 G1 X191.55 Y171.346 E.13639
N7864 G1 X158.45 Y180.215 E1.1019
N7865 ; WIPE_START
N7866 G1 X160.382 Y179.697 E-.76
N7867 ; WIPE_END
N7868 G1 E-.04 F1800
N7869 M204 S10000
N7870 G17
N7871 G3 Z5.2 I1.217 J0 P1  F60000
N7872 ; stop printing object, unique label id: 229
N7873 M625
N7874 ; object ids of layer 24 start: 229
N7875 M624 AQAAAAAAAAA=
N7876 ;======== H2D 20250527========
N7877 ; SKIPPABLE_START
N7878 ; SKIPTYPE: timelapse
N7879 M622.1 S1 ; for prev firware, default turned on
N7880 
N7881 M1002 judge_flag timelapse_record_flag
N7882 
N7883 M622 J1
N7884 M993 A2 B2 C2
N7885 M993 A0 B0 C0
N7886 
N7887 
N7888 
N7889 
N7890     M9711 M0 E1 X260 Y141 Z5.2 S11 C10 O0 T3000
N7891 
N7892 
N7893 
N7894 M993 A3 B3 C3
N7895 
N7896 M623
N7897 ; SKIPPABLE_END
N7898 
N7899 ; object ids of this layer24 end: 229
N7900 M625
N7901 ; CHANGE_LAYER
N7902 ; Z_HEIGHT: 5
N7903 ; LAYER_HEIGHT: 0.2
N7904 ;======== H2D 20250521========
N7905 ; layer num/total_layer_count: 25/63
N7906 ; update layer progress
N7907 M73 L25
N7908 M991 S0 P24 ;notify layer change
N7909 
N7910 
N7911 M106 S71.4
N7912 ; OBJECT_ID: 229
N7913 ; COOLING_NODE: 0
N7914 ; start printing object, unique label id: 229
N7915 M624 AQAAAAAAAAA=
N7916 G1 X191.898 Y201.453 F60000
N7917 G1 Z5
N7918 G1 E.8 F1800
N7919 ; FEATURE: Inner wall
N7920 ; LINE_WIDTH: 0.45
N7921 ; LAYER_HEIGHT: 0.2
N7922 G1 F4421.739
N7923 M204 S8000
N7924 G1 X158.102 Y201.453 E1.08675
N7925 G1 X158.102 Y126.222 E2.41914
N7926 G1 X191.898 Y126.222 E1.08675
N7927 G1 X191.898 Y201.393 E2.41721
N7928 ; COOLING_NODE: 0
N7929 M204 S10000
N7930 G1 X192.29 Y201.845 F60000
N7931 ; FEATURE: Outer wall
N7932 ; LINE_WIDTH: 0.42
N7933 G1 F4773.528
N7934 M204 S5000
N7935 M73 P59 R20
N7936 G1 X157.71 Y201.845 E1.03002
N7937 G1 X157.71 Y125.83 E2.26421
N7938 G1 X192.29 Y125.83 E1.03002
N7939 G1 X192.29 Y201.785 E2.26243
N7940 ; WIPE_START
N7941 M204 S8000
N7942 G1 X190.29 Y201.788 E-.76
N7943 ; WIPE_END
N7944 G1 E-.04 F1800
N7945 M204 S10000
N7946 G1 X182.674 Y201.29 Z5.4 F60000
N7947 M73 P59 R19
N7948 G1 X179.84 Y201.104 Z5.4
N7949 G1 Z5
N7950 G1 E.8 F1800
N7951 ; FEATURE: Sparse infill
N7952 ; LINE_WIDTH: 0.45
N7953 G1 F4421.739
N7954 M204 S8000
N7955 G1 X178.212 Y201.104 E.05236
N7956 G1 X191.55 Y151.326 E1.65715
N7957 G1 X191.55 Y146.206 E.16466
N7958 G1 X158.45 Y155.075 E1.1019
N7959 G1 X158.45 Y153.802 E.04093
N7960 G1 X191.55 Y186.901 E1.50523
N7961 G1 X191.55 Y188.35 E.04658
N7962 G1 X158.45 Y197.219 E1.1019
N7963 G1 X158.45 Y199.858 E.08486
N7964 G1 X159.697 Y201.104 E.0567
N7965 G1 X161.354 Y201.104 E.05328
N7966 G1 X181.325 Y126.571 E2.48129
N7967 G1 X177.275 Y126.571 E.13025
N7968 G1 X191.55 Y140.845 E.64916
N7969 G1 X191.55 Y137.777 E.09867
N7970 G1 X158.45 Y146.646 E1.1019
N7971 G1 X158.45 Y145.018 E.05236
N7972 M204 S10000
N7973 G1 X158.45 Y150.656 F60000
N7974 G1 F4421.739
N7975 M204 S8000
N7976 G1 X158.45 Y149.028 E.05236
N7977 G1 X164.468 Y126.571 E.74763
N7978 G1 X165.761 Y126.571 E.04158
N7979 G1 X191.55 Y152.359 E1.17277
N7980 M204 S10000
N7981 G1 X191.55 Y156.263 F60000
N7982 G1 F4421.739
N7983 M204 S8000
N7984 G1 X191.55 Y154.634 E.05236
N7985 G1 X158.45 Y163.503 E1.1019
N7986 G1 X158.45 Y165.316 E.05828
N7987 G1 X191.55 Y198.415 E1.50523
N7988 G1 X191.55 Y196.778 E.05263
N7989 G1 X175.405 Y201.104 E.53747
N7990 G1 X173.777 Y201.104 E.05236
N7991 M204 S10000
N7992 G1 X158.45 Y175.201 F60000
N7993 G1 F4421.739
N7994 M204 S8000
N7995 G1 X158.45 Y176.83 E.05236
N7996 G1 X182.725 Y201.104 E1.10392
N7997 G1 X186.64 Y201.104 E.1259
N7998 G1 X191.55 Y182.783 E.60993
N7999 G1 X191.55 Y179.921 E.09204
N8000 G1 X158.45 Y188.79 E1.1019
N8001 G1 X158.45 Y188.344 E.01435
N8002 G1 X171.211 Y201.104 E.58031
N8003 G1 X169.783 Y201.104 E.04593
N8004 G1 X189.754 Y126.571 E2.48129
N8005 G1 X188.789 Y126.571 E.03104
N8006 G1 X191.55 Y129.348 E.12593
N8007 G1 X158.45 Y138.217 E1.1019
N8008 G1 X158.45 Y142.288 E.1309
N8009 G1 X191.55 Y175.387 E1.50523
N8010 G1 X191.55 Y171.492 E.12525
N8011 G1 X158.45 Y180.361 E1.1019
N8012 G1 X158.45 Y180.485 E.00398
N8013 G1 X172.897 Y126.571 E1.79485
N8014 G1 X170.459 Y126.571 E.07839
N8015 G1 X158.45 Y129.788 E.39978
N8016 G1 X158.45 Y130.774 E.03169
N8017 G1 X191.55 Y163.873 E1.50523
N8018 G1 X191.55 Y163.063 E.02605
N8019 G1 X158.45 Y171.932 E1.1019
N8020 G1 X158.45 Y170.304 E.05236
N8021 ; WIPE_START
N8022 G1 X158.45 Y171.932 E-.61876
N8023 G1 X158.809 Y171.836 E-.14124
N8024 ; WIPE_END
N8025 G1 E-.04 F1800
N8026 M204 S10000
N8027 G17
N8028 G3 Z5.4 I1.217 J0 P1  F60000
N8029 ; stop printing object, unique label id: 229
N8030 M625
N8031 ; object ids of layer 25 start: 229
N8032 M624 AQAAAAAAAAA=
N8033 ;======== H2D 20250527========
N8034 ; SKIPPABLE_START
N8035 ; SKIPTYPE: timelapse
N8036 M622.1 S1 ; for prev firware, default turned on
N8037 
N8038 M1002 judge_flag timelapse_record_flag
N8039 
N8040 M622 J1
N8041 M993 A2 B2 C2
N8042 M993 A0 B0 C0
N8043 
N8044 
N8045 
N8046 
N8047     M9711 M0 E1 X260 Y141 Z5.4 S11 C10 O0 T3000
N8048 
N8049 
N8050 
N8051 M993 A3 B3 C3
N8052 
N8053 M623
N8054 ; SKIPPABLE_END
N8055 
N8056 ; object ids of this layer25 end: 229
N8057 M625
N8058 ; CHANGE_LAYER
N8059 ; Z_HEIGHT: 5.2
N8060 ; LAYER_HEIGHT: 0.2
N8061 ;======== H2D 20250521========
N8062 ; layer num/total_layer_count: 26/63
N8063 ; update layer progress
N8064 M73 L26
N8065 M991 S0 P25 ;notify layer change
N8066 
N8067 
N8068 ; OBJECT_ID: 229
N8069 ; COOLING_NODE: 0
N8070 ; start printing object, unique label id: 229
N8071 M624 AQAAAAAAAAA=
N8072 G1 X191.898 Y201.453 F60000
N8073 G1 Z5.2
N8074 G1 E.8 F1800
N8075 ; FEATURE: Inner wall
N8076 ; LINE_WIDTH: 0.45
N8077 ; LAYER_HEIGHT: 0.2
N8078 G1 F4421.739
N8079 M204 S8000
N8080 G1 X158.102 Y201.453 E1.08675
N8081 G1 X158.102 Y126.222 E2.41914
N8082 G1 X191.898 Y126.222 E1.08675
N8083 G1 X191.898 Y201.393 E2.41721
N8084 ; COOLING_NODE: 0
N8085 M204 S10000
N8086 G1 X192.29 Y201.845 F60000
N8087 ; FEATURE: Outer wall
N8088 ; LINE_WIDTH: 0.42
N8089 G1 F4773.528
N8090 M204 S5000
N8091 G1 X157.71 Y201.845 E1.03002
N8092 G1 X157.71 Y125.83 E2.26421
N8093 G1 X192.29 Y125.83 E1.03002
N8094 G1 X192.29 Y201.785 E2.26243
N8095 ; WIPE_START
N8096 M204 S8000
N8097 G1 X190.29 Y201.788 E-.76
N8098 ; WIPE_END
N8099 G1 E-.04 F1800
N8100 M204 S10000
N8101 G1 X182.673 Y201.297 Z5.6 F60000
N8102 G1 X179.694 Y201.104 Z5.6
N8103 G1 Z5.2
N8104 G1 E.8 F1800
N8105 ; FEATURE: Sparse infill
N8106 ; LINE_WIDTH: 0.45
N8107 G1 F4421.739
N8108 M204 S8000
N8109 G1 X178.065 Y201.104 E.05236
N8110 G1 X191.55 Y150.78 E1.67534
N8111 G1 X191.55 Y146.352 E.14238
N8112 G1 X158.45 Y155.221 E1.1019
N8113 G1 X158.45 Y153.602 E.05207
N8114 G1 X191.55 Y186.701 E1.50523
N8115 G1 X191.55 Y188.496 E.05772
N8116 G1 X158.45 Y197.365 E1.1019
N8117 G1 X158.45 Y199.658 E.07372
N8118 G1 X159.897 Y201.104 E.0658
N8119 G1 X161.208 Y201.104 E.04214
N8120 G1 X181.179 Y126.571 E2.48129
N8121 G1 X177.475 Y126.571 E.11911
N8122 G1 X191.55 Y140.645 E.64007
N8123 G1 X191.55 Y137.923 E.08753
N8124 G1 X158.45 Y146.792 E1.1019
N8125 G1 X158.45 Y145.164 E.05236
N8126 M204 S10000
N8127 G1 X158.45 Y150.11 F60000
N8128 G1 F4421.739
N8129 M204 S8000
N8130 G1 X158.45 Y148.482 E.05236
N8131 G1 X164.321 Y126.571 E.72944
N8132 G1 X165.961 Y126.571 E.05272
N8133 G1 X191.55 Y152.159 E1.16367
N8134 G1 X191.55 Y154.781 E.0843
N8135 G1 X158.45 Y163.65 E1.1019
N8136 G1 X158.45 Y165.116 E.04714
N8137 M73 P60 R19
N8138 G1 X191.55 Y198.215 E1.50523
N8139 G1 X191.55 Y196.925 E.04149
N8140 G1 X175.951 Y201.104 E.51928
N8141 G1 X174.323 Y201.104 E.05236
N8142 M204 S10000
N8143 G1 X158.45 Y175.001 F60000
N8144 G1 F4421.739
N8145 M204 S8000
N8146 G1 X158.45 Y176.63 E.05236
N8147 G1 X182.925 Y201.104 E1.11301
N8148 G1 X186.494 Y201.104 E.11477
N8149 G1 X191.55 Y182.237 E.62812
N8150 G1 X191.55 Y180.067 E.06976
N8151 G1 X158.45 Y188.936 E1.1019
N8152 G1 X158.45 Y188.144 E.02549
N8153 G1 X171.411 Y201.104 E.58941
N8154 G1 X169.636 Y201.104 E.05707
N8155 G1 X189.608 Y126.571 E2.48129
N8156 G1 X188.989 Y126.571 E.0199
N8157 G1 X191.55 Y129.131 E.11646
N8158 G1 X191.55 Y129.494 E.01168
N8159 G1 X158.45 Y138.363 E1.1019
N8160 G1 X158.45 Y142.088 E.11976
N8161 G1 X191.55 Y175.187 E1.50523
N8162 G1 X191.55 Y171.638 E.11411
N8163 G1 X158.45 Y180.507 E1.1019
N8164 G1 X158.45 Y179.938 E.0183
N8165 G1 X172.75 Y126.571 E1.77666
N8166 G1 X171.005 Y126.571 E.05611
N8167 G1 X158.45 Y129.935 E.41797
N8168 G1 X158.45 Y130.574 E.02055
N8169 G1 X191.55 Y163.673 E1.50523
N8170 G1 X191.55 Y163.21 E.01491
N8171 G1 X158.45 Y172.079 E1.1019
N8172 G1 X158.45 Y170.45 E.05236
N8173 ; WIPE_START
N8174 G1 X158.45 Y172.079 E-.61876
N8175 G1 X158.809 Y171.982 E-.14124
N8176 ; WIPE_END
N8177 G1 E-.04 F1800
N8178 M204 S10000
N8179 G17
N8180 G3 Z5.6 I1.217 J0 P1  F60000
N8181 ; stop printing object, unique label id: 229
N8182 M625
N8183 ; object ids of layer 26 start: 229
N8184 M624 AQAAAAAAAAA=
N8185 ;======== H2D 20250527========
N8186 ; SKIPPABLE_START
N8187 ; SKIPTYPE: timelapse
N8188 M622.1 S1 ; for prev firware, default turned on
N8189 
N8190 M1002 judge_flag timelapse_record_flag
N8191 
N8192 M622 J1
N8193 M993 A2 B2 C2
N8194 M993 A0 B0 C0
N8195 
N8196 
N8197 
N8198 
N8199     M9711 M0 E1 X260 Y141 Z5.6 S11 C10 O0 T3000
N8200 
N8201 
N8202 
N8203 M993 A3 B3 C3
N8204 
N8205 M623
N8206 ; SKIPPABLE_END
N8207 
N8208 ; object ids of this layer26 end: 229
N8209 M625
N8210 ; CHANGE_LAYER
N8211 ; Z_HEIGHT: 5.4
N8212 ; LAYER_HEIGHT: 0.2
N8213 ;======== H2D 20250521========
N8214 ; layer num/total_layer_count: 27/63
N8215 ; update layer progress
N8216 M73 L27
N8217 M991 S0 P26 ;notify layer change
N8218 
N8219 
N8220 ; OBJECT_ID: 229
N8221 ; COOLING_NODE: 0
N8222 ; start printing object, unique label id: 229
N8223 M624 AQAAAAAAAAA=
N8224 G1 X191.898 Y201.453 F60000
N8225 G1 Z5.4
N8226 G1 E.8 F1800
N8227 ; FEATURE: Inner wall
N8228 ; LINE_WIDTH: 0.45
N8229 ; LAYER_HEIGHT: 0.2
N8230 G1 F4421.739
N8231 M204 S8000
N8232 G1 X158.102 Y201.453 E1.08675
N8233 G1 X158.102 Y126.222 E2.41914
N8234 G1 X191.898 Y126.222 E1.08675
N8235 G1 X191.898 Y201.393 E2.41721
N8236 ; COOLING_NODE: 0
N8237 M204 S10000
N8238 G1 X192.29 Y201.845 F60000
N8239 ; FEATURE: Outer wall
N8240 ; LINE_WIDTH: 0.42
N8241 G1 F4773.528
N8242 M204 S5000
N8243 G1 X157.71 Y201.845 E1.03002
N8244 G1 X157.71 Y125.83 E2.26421
N8245 G1 X192.29 Y125.83 E1.03002
N8246 G1 X192.29 Y201.785 E2.26243
N8247 ; WIPE_START
N8248 M204 S8000
N8249 G1 X190.29 Y201.788 E-.76
N8250 ; WIPE_END
N8251 G1 E-.04 F1800
N8252 M204 S10000
N8253 G1 X182.673 Y201.303 Z5.8 F60000
N8254 G1 X179.547 Y201.104 Z5.8
N8255 G1 Z5.4
N8256 G1 E.8 F1800
N8257 ; FEATURE: Sparse infill
N8258 ; LINE_WIDTH: 0.45
N8259 G1 F4421.739
N8260 M204 S8000
N8261 G1 X177.919 Y201.104 E.05236
N8262 G1 X191.55 Y150.234 E1.69353
N8263 G1 X191.55 Y146.498 E.12011
N8264 G1 X158.45 Y155.367 E1.1019
N8265 G1 X158.45 Y153.402 E.06321
N8266 G1 X191.55 Y186.501 E1.50523
N8267 G1 X191.55 Y188.642 E.06886
N8268 G1 X158.45 Y197.511 E1.1019
N8269 G1 X158.45 Y199.458 E.06258
N8270 G1 X160.097 Y201.104 E.07489
N8271 G1 X161.061 Y201.104 E.031
N8272 G1 X181.033 Y126.571 E2.48129
N8273 G1 X177.675 Y126.571 E.10797
N8274 G1 X191.55 Y140.445 E.63097
N8275 G1 X191.55 Y138.07 E.07639
N8276 G1 X158.45 Y146.939 E1.1019
N8277 M204 S10000
N8278 G1 X158.45 Y149.564 F60000
N8279 G1 F4421.739
N8280 M204 S8000
N8281 G1 X158.45 Y147.935 E.05236
N8282 G1 X164.175 Y126.571 E.71125
N8283 G1 X166.161 Y126.571 E.06386
N8284 G1 X191.55 Y151.959 E1.15458
N8285 G1 X191.55 Y154.927 E.09544
N8286 G1 X158.45 Y163.796 E1.1019
N8287 G1 X158.45 Y164.916 E.036
N8288 G1 X191.55 Y198.015 E1.50523
N8289 G1 X191.55 Y197.071 E.03035
N8290 G1 X176.498 Y201.104 E.50109
N8291 G1 X174.869 Y201.104 E.05236
N8292 M204 S10000
N8293 G1 X158.45 Y174.801 F60000
N8294 G1 F4421.739
N8295 M204 S8000
N8296 G1 X158.45 Y176.43 E.05236
N8297 G1 X183.125 Y201.104 E1.12211
N8298 G1 X186.348 Y201.104 E.10363
N8299 G1 X191.55 Y181.69 E.64631
N8300 G1 X191.55 Y180.214 E.04748
N8301 G1 X158.45 Y189.083 E1.1019
N8302 G1 X158.45 Y187.944 E.03663
N8303 G1 X171.611 Y201.104 E.5985
N8304 G1 X169.49 Y201.104 E.06821
N8305 G1 X189.461 Y126.571 E2.48129
N8306 G1 X189.189 Y126.571 E.00876
N8307 G1 X191.55 Y128.931 E.10736
N8308 G1 X191.55 Y129.641 E.02282
N8309 G1 X158.45 Y138.51 E1.1019
N8310 G1 X158.45 Y141.888 E.10862
N8311 G1 X191.55 Y174.987 E1.50523
N8312 G1 X191.55 Y171.785 E.10297
N8313 G1 X158.45 Y180.654 E1.1019
N8314 G1 X158.45 Y179.392 E.04058
N8315 G1 X172.604 Y126.571 E1.75846
N8316 G1 X171.552 Y126.571 E.03383
N8317 G1 X158.45 Y130.081 E.43616
N8318 G1 X158.45 Y130.374 E.00942
N8319 G1 X191.55 Y163.473 E1.50523
N8320 G1 X191.55 Y163.356 E.00377
N8321 G1 X158.45 Y172.225 E1.1019
N8322 G1 X158.45 Y170.597 E.05236
N8323 ; WIPE_START
N8324 G1 X158.45 Y172.225 E-.61876
N8325 G1 X158.809 Y172.129 E-.14124
N8326 ; WIPE_END
N8327 G1 E-.04 F1800
N8328 M204 S10000
N8329 G17
N8330 G3 Z5.8 I1.217 J0 P1  F60000
N8331 ; stop printing object, unique label id: 229
N8332 M625
N8333 ; object ids of layer 27 start: 229
N8334 M624 AQAAAAAAAAA=
N8335 ;======== H2D 20250527========
N8336 ; SKIPPABLE_START
N8337 ; SKIPTYPE: timelapse
N8338 M622.1 S1 ; for prev firware, default turned on
N8339 
N8340 M1002 judge_flag timelapse_record_flag
N8341 
N8342 M622 J1
N8343 M993 A2 B2 C2
N8344 M993 A0 B0 C0
N8345 
N8346 
N8347 
N8348 
N8349     M9711 M0 E1 X260 Y141 Z5.8 S11 C10 O0 T3000
N8350 
N8351 
N8352 
N8353 M993 A3 B3 C3
N8354 
N8355 M623
N8356 ; SKIPPABLE_END
N8357 
N8358 ; object ids of this layer27 end: 229
N8359 M625
N8360 ; CHANGE_LAYER
N8361 ; Z_HEIGHT: 5.6
N8362 ; LAYER_HEIGHT: 0.2
N8363 ;======== H2D 20250521========
N8364 ; layer num/total_layer_count: 28/63
N8365 ; update layer progress
N8366 M73 L28
N8367 M991 S0 P27 ;notify layer change
N8368 
N8369 
N8370 ; OBJECT_ID: 229
N8371 ; COOLING_NODE: 0
N8372 ; start printing object, unique label id: 229
N8373 M624 AQAAAAAAAAA=
N8374 G1 X191.898 Y201.453 F60000
N8375 G1 Z5.6
N8376 G1 E.8 F1800
N8377 ; FEATURE: Inner wall
N8378 ; LINE_WIDTH: 0.45
N8379 ; LAYER_HEIGHT: 0.2
N8380 G1 F4421.739
N8381 M204 S8000
N8382 G1 X158.102 Y201.453 E1.08675
N8383 G1 X158.102 Y126.222 E2.41914
N8384 G1 X191.898 Y126.222 E1.08675
N8385 G1 X191.898 Y201.393 E2.41721
N8386 ; COOLING_NODE: 0
N8387 M204 S10000
N8388 G1 X192.29 Y201.845 F60000
N8389 ; FEATURE: Outer wall
N8390 ; LINE_WIDTH: 0.42
N8391 M73 P61 R19
N8392 G1 F4773.528
N8393 M204 S5000
N8394 G1 X157.71 Y201.845 E1.03002
N8395 G1 X157.71 Y125.83 E2.26421
N8396 G1 X192.29 Y125.83 E1.03002
N8397 G1 X192.29 Y201.785 E2.26243
N8398 ; WIPE_START
N8399 M204 S8000
N8400 G1 X190.29 Y201.788 E-.76
N8401 ; WIPE_END
N8402 G1 E-.04 F1800
N8403 M204 S10000
N8404 G1 X182.669 Y201.372 Z6 F60000
N8405 M73 P61 R18
N8406 G1 X177.772 Y201.104 Z6
N8407 G1 Z5.6
N8408 G1 E.8 F1800
N8409 ; FEATURE: Sparse infill
N8410 ; LINE_WIDTH: 0.45
N8411 G1 F4421.739
N8412 M204 S8000
N8413 G1 X191.55 Y149.687 E1.71172
N8414 G1 X191.55 Y146.645 E.09783
N8415 G1 X158.45 Y155.514 E1.1019
N8416 G1 X158.45 Y153.202 E.07435
N8417 G1 X191.55 Y186.301 E1.50523
N8418 G1 X191.55 Y188.789 E.08
N8419 G1 X158.45 Y197.658 E1.1019
N8420 G1 X158.45 Y199.258 E.05144
N8421 G1 X160.297 Y201.104 E.08399
N8422 G1 X160.915 Y201.104 E.01986
N8423 G1 X180.886 Y126.571 E2.48129
N8424 G1 X177.875 Y126.571 E.09683
N8425 G1 X191.55 Y140.245 E.62187
N8426 G1 X191.55 Y138.216 E.06525
N8427 G1 X158.45 Y147.085 E1.1019
N8428 G1 X158.45 Y147.389 E.00977
N8429 G1 X164.029 Y126.571 E.69306
N8430 G1 X166.361 Y126.571 E.075
N8431 G1 X191.55 Y151.759 E1.14548
N8432 G1 X191.55 Y155.074 E.10658
N8433 G1 X158.45 Y163.943 E1.1019
N8434 G1 X158.45 Y164.716 E.02486
N8435 G1 X191.55 Y197.815 E1.50523
N8436 G1 X191.55 Y197.218 E.01921
N8437 G1 X177.044 Y201.104 E.4829
N8438 G1 X175.416 Y201.104 E.05236
N8439 M204 S10000
N8440 G1 X158.45 Y174.601 F60000
N8441 G1 F4421.739
N8442 M204 S8000
N8443 G1 X158.45 Y176.23 E.05236
N8444 G1 X183.325 Y201.104 E1.1312
N8445 G1 X186.201 Y201.104 E.09249
N8446 G1 X191.55 Y181.144 E.6645
N8447 G1 X191.55 Y180.36 E.0252
N8448 G1 X158.45 Y189.229 E1.1019
N8449 G1 X158.45 Y187.744 E.04777
N8450 G1 X171.811 Y201.104 E.6076
N8451 G1 X169.344 Y201.104 E.07935
N8452 G1 X189.315 Y126.571 E2.48129
N8453 G1 X189.389 Y126.571 E.00238
N8454 G1 X191.55 Y128.731 E.09827
N8455 G1 X191.55 Y129.787 E.03395
N8456 G1 X158.45 Y138.656 E1.1019
N8457 G1 X158.45 Y141.688 E.09748
N8458 G1 X191.55 Y174.787 E1.50523
N8459 G1 X191.55 Y171.931 E.09184
N8460 G1 X158.45 Y180.8 E1.1019
N8461 G1 X158.45 Y178.846 E.06285
N8462 G1 X172.457 Y126.571 E1.74027
N8463 G1 X172.098 Y126.571 E.01155
N8464 G1 X158.45 Y130.227 E.45435
N8465 G1 X158.45 Y130.174 E.00172
N8466 G1 X191.55 Y163.273 E1.50523
N8467 G1 X191.55 Y163.502 E.00737
N8468 G1 X158.45 Y172.371 E1.1019
N8469 G1 X158.45 Y170.743 E.05236
N8470 ; WIPE_START
N8471 G1 X158.45 Y172.371 E-.61876
N8472 G1 X158.809 Y172.275 E-.14124
N8473 ; WIPE_END
N8474 G1 E-.04 F1800
N8475 M204 S10000
N8476 G17
N8477 G3 Z6 I1.217 J0 P1  F60000
N8478 ; stop printing object, unique label id: 229
N8479 M625
N8480 ; object ids of layer 28 start: 229
N8481 M624 AQAAAAAAAAA=
N8482 ;======== H2D 20250527========
N8483 ; SKIPPABLE_START
N8484 ; SKIPTYPE: timelapse
N8485 M622.1 S1 ; for prev firware, default turned on
N8486 
N8487 M1002 judge_flag timelapse_record_flag
N8488 
N8489 M622 J1
N8490 M993 A2 B2 C2
N8491 M993 A0 B0 C0
N8492 
N8493 
N8494 
N8495 
N8496     M9711 M0 E1 X260 Y141 Z6 S11 C10 O0 T3000
N8497 
N8498 
N8499 
N8500 M993 A3 B3 C3
N8501 
N8502 M623
N8503 ; SKIPPABLE_END
N8504 
N8505 ; object ids of this layer28 end: 229
N8506 M625
N8507 ; CHANGE_LAYER
N8508 ; Z_HEIGHT: 5.8
N8509 ; LAYER_HEIGHT: 0.2
N8510 ;======== H2D 20250521========
N8511 ; layer num/total_layer_count: 29/63
N8512 ; update layer progress
N8513 M73 L29
N8514 M991 S0 P28 ;notify layer change
N8515 
N8516 
N8517 ; OBJECT_ID: 229
N8518 ; COOLING_NODE: 0
N8519 ; start printing object, unique label id: 229
N8520 M624 AQAAAAAAAAA=
N8521 G1 X191.898 Y201.453 F60000
N8522 G1 Z5.8
N8523 G1 E.8 F1800
N8524 ; FEATURE: Inner wall
N8525 ; LINE_WIDTH: 0.45
N8526 ; LAYER_HEIGHT: 0.2
N8527 G1 F4421.739
N8528 M204 S8000
N8529 G1 X158.102 Y201.453 E1.08675
N8530 G1 X158.102 Y126.222 E2.41914
N8531 G1 X191.898 Y126.222 E1.08675
N8532 G1 X191.898 Y201.393 E2.41721
N8533 ; COOLING_NODE: 0
N8534 M204 S10000
N8535 G1 X192.29 Y201.845 F60000
N8536 ; FEATURE: Outer wall
N8537 ; LINE_WIDTH: 0.42
N8538 G1 F4773.528
N8539 M204 S5000
N8540 G1 X157.71 Y201.845 E1.03002
N8541 G1 X157.71 Y125.83 E2.26421
N8542 G1 X192.29 Y125.83 E1.03002
N8543 G1 X192.29 Y201.785 E2.26243
N8544 ; WIPE_START
N8545 M204 S8000
N8546 G1 X190.29 Y201.788 E-.76
N8547 ; WIPE_END
N8548 G1 E-.04 F1800
N8549 M204 S10000
N8550 G1 X184.504 Y196.811 Z6.2 F60000
N8551 G1 X158.45 Y174.401 Z6.2
N8552 G1 Z5.8
N8553 G1 E.8 F1800
N8554 ; FEATURE: Sparse infill
N8555 ; LINE_WIDTH: 0.45
N8556 G1 F4421.739
N8557 M204 S8000
N8558 G1 X158.45 Y176.03 E.05236
N8559 G1 X183.525 Y201.104 E1.1403
N8560 G1 X186.055 Y201.104 E.08135
N8561 G1 X191.55 Y180.597 E.68269
N8562 G1 X191.55 Y180.506 E.00292
N8563 G1 X158.45 Y189.375 E1.1019
N8564 G1 X158.45 Y187.544 E.05891
N8565 G1 X172.011 Y201.104 E.61669
N8566 G1 X169.197 Y201.104 E.09048
N8567 G1 X189.169 Y126.571 E2.48129
N8568 G1 X189.589 Y126.571 E.01351
N8569 G1 X191.55 Y128.531 E.08917
N8570 G1 X191.55 Y129.934 E.04509
N8571 G1 X158.45 Y138.803 E1.1019
N8572 G1 X158.45 Y141.488 E.08634
N8573 G1 X191.55 Y174.587 E1.50523
N8574 G1 X191.55 Y172.078 E.0807
N8575 G1 X158.45 Y180.947 E1.1019
N8576 G1 X158.45 Y178.299 E.08513
N8577 G1 X172.311 Y126.571 E1.72208
N8578 M73 P62 R18
N8579 G1 X172.645 Y126.571 E.01073
N8580 G1 X158.45 Y130.374 E.47254
N8581 G1 X158.45 Y129.974 E.01286
N8582 G1 X191.55 Y163.073 E1.50523
N8583 G1 X191.55 Y163.649 E.01851
N8584 G1 X158.45 Y172.518 E1.1019
N8585 G1 X158.45 Y170.89 E.05236
N8586 M204 S10000
N8587 G1 X191.55 Y156.848 F60000
N8588 G1 F4421.739
N8589 M204 S8000
N8590 G1 X191.55 Y155.22 E.05236
N8591 G1 X158.45 Y164.089 E1.1019
N8592 G1 X158.45 Y164.516 E.01372
N8593 G1 X191.55 Y197.615 E1.50523
N8594 G1 X191.55 Y197.364 E.00807
N8595 G1 X177.59 Y201.104 E.46471
N8596 G1 X177.626 Y201.104 E.00114
N8597 G1 X191.55 Y149.141 E1.72991
N8598 G1 X191.55 Y146.791 E.07555
N8599 G1 X158.45 Y155.66 E1.1019
N8600 G1 X158.45 Y153.002 E.08549
N8601 G1 X191.55 Y186.101 E1.50523
N8602 G1 X191.55 Y188.935 E.09114
N8603 G1 X158.45 Y197.804 E1.1019
N8604 G1 X158.45 Y199.058 E.0403
N8605 G1 X160.497 Y201.104 E.09308
N8606 G1 X160.768 Y201.104 E.00872
N8607 G1 X180.74 Y126.571 E2.48129
N8608 G1 X178.075 Y126.571 E.08569
N8609 G1 X191.55 Y140.045 E.61278
N8610 G1 X191.55 Y138.363 E.05411
N8611 G1 X158.45 Y147.231 E1.1019
N8612 G1 X158.45 Y146.843 E.01251
N8613 G1 X163.882 Y126.571 E.67487
N8614 G1 X166.561 Y126.571 E.08614
N8615 G1 X191.55 Y151.559 E1.13639
N8616 G1 X191.55 Y153.188 E.05236
N8617 ; WIPE_START
N8618 G1 X191.55 Y151.559 E-.61876
N8619 G1 X191.287 Y151.296 E-.14124
N8620 ; WIPE_END
N8621 G1 E-.04 F1800
N8622 M204 S10000
N8623 G17
N8624 G3 Z6.2 I1.217 J0 P1  F60000
N8625 ; stop printing object, unique label id: 229
N8626 M625
N8627 ; object ids of layer 29 start: 229
N8628 M624 AQAAAAAAAAA=
N8629 ;======== H2D 20250527========
N8630 ; SKIPPABLE_START
N8631 ; SKIPTYPE: timelapse
N8632 M622.1 S1 ; for prev firware, default turned on
N8633 
N8634 M1002 judge_flag timelapse_record_flag
N8635 
N8636 M622 J1
N8637 M993 A2 B2 C2
N8638 M993 A0 B0 C0
N8639 
N8640 
N8641 
N8642 
N8643     M9711 M0 E1 X260 Y141 Z6.2 S11 C10 O0 T3000
N8644 
N8645 
N8646 
N8647 M993 A3 B3 C3
N8648 
N8649 M623
N8650 ; SKIPPABLE_END
N8651 
N8652 ; object ids of this layer29 end: 229
N8653 M625
N8654 ; CHANGE_LAYER
N8655 ; Z_HEIGHT: 6
N8656 ; LAYER_HEIGHT: 0.2
N8657 ;======== H2D 20250521========
N8658 ; layer num/total_layer_count: 30/63
N8659 ; update layer progress
N8660 M73 L30
N8661 M991 S0 P29 ;notify layer change
N8662 
N8663 
N8664 ; OBJECT_ID: 229
N8665 ; COOLING_NODE: 0
N8666 ; start printing object, unique label id: 229
N8667 M624 AQAAAAAAAAA=
N8668 G1 X191.898 Y201.453 F60000
N8669 G1 Z6
N8670 G1 E.8 F1800
N8671 ; FEATURE: Inner wall
N8672 ; LINE_WIDTH: 0.45
N8673 ; LAYER_HEIGHT: 0.2
N8674 G1 F4421.739
N8675 M204 S8000
N8676 G1 X158.102 Y201.453 E1.08675
N8677 G1 X158.102 Y126.222 E2.41914
N8678 G1 X191.898 Y126.222 E1.08675
N8679 G1 X191.898 Y201.393 E2.41721
N8680 ; COOLING_NODE: 0
N8681 M204 S10000
N8682 G1 X192.29 Y201.845 F60000
N8683 ; FEATURE: Outer wall
N8684 ; LINE_WIDTH: 0.42
N8685 G1 F4773.528
N8686 M204 S5000
N8687 G1 X157.71 Y201.845 E1.03002
N8688 G1 X157.71 Y125.83 E2.26421
N8689 G1 X192.29 Y125.83 E1.03002
N8690 G1 X192.29 Y201.785 E2.26243
N8691 ; WIPE_START
N8692 M204 S8000
N8693 G1 X190.29 Y201.788 E-.76
N8694 ; WIPE_END
N8695 G1 E-.04 F1800
N8696 M204 S10000
N8697 G1 X190.744 Y194.169 Z6.4 F60000
N8698 G1 X191.55 Y180.653 Z6.4
N8699 G1 Z6
N8700 G1 E.8 F1800
N8701 ; FEATURE: Sparse infill
N8702 ; LINE_WIDTH: 0.45
N8703 G1 F4421.739
N8704 M204 S8000
N8705 G1 X158.45 Y189.522 E1.1019
N8706 G1 X158.45 Y187.344 E.07004
N8707 G1 X172.211 Y201.104 E.62579
N8708 G1 X169.051 Y201.104 E.10162
N8709 G1 X189.022 Y126.571 E2.48129
N8710 G1 X189.789 Y126.571 E.02465
N8711 G1 X191.55 Y128.331 E.08008
N8712 G1 X191.55 Y130.08 E.05623
N8713 G1 X158.45 Y138.949 E1.1019
N8714 G1 X158.45 Y141.288 E.0752
N8715 G1 X191.55 Y174.387 E1.50523
N8716 G1 X191.55 Y172.224 E.06956
N8717 G1 X158.45 Y181.093 E1.1019
N8718 G1 X158.45 Y177.753 E.10741
N8719 G1 X172.165 Y126.571 E1.70389
N8720 M204 S10000
N8721 G1 X174.819 Y126.571 F60000
N8722 G1 F4421.739
N8723 M204 S8000
N8724 G1 X173.191 Y126.571 E.05236
N8725 G1 X158.45 Y130.52 E.49073
N8726 G1 X158.45 Y129.774 E.024
N8727 G1 X191.55 Y162.873 E1.50523
N8728 G1 X191.55 Y163.795 E.02965
N8729 G1 X158.45 Y172.664 E1.1019
N8730 G1 X158.45 Y175.83 E.10179
N8731 G1 X183.725 Y201.104 E1.1494
N8732 G1 X185.908 Y201.104 E.07021
N8733 G1 X191.55 Y180.051 E.70088
N8734 G1 X191.55 Y178.423 E.05236
N8735 M204 S10000
N8736 G1 X191.55 Y156.995 F60000
N8737 G1 F4421.739
N8738 M204 S8000
N8739 G1 X191.55 Y155.367 E.05236
N8740 G1 X158.45 Y164.235 E1.1019
N8741 G1 X158.45 Y164.316 E.00258
N8742 G1 X191.55 Y197.415 E1.50523
N8743 G1 X191.55 Y197.51 E.00307
N8744 G1 X178.137 Y201.104 E.44652
N8745 G1 X177.48 Y201.104 E.02114
N8746 G1 X191.55 Y148.594 E1.7481
N8747 G1 X191.55 Y146.938 E.05327
N8748 G1 X158.45 Y155.807 E1.1019
N8749 G1 X158.45 Y152.802 E.09663
N8750 G1 X191.55 Y185.901 E1.50523
N8751 G1 X191.55 Y189.082 E.10228
N8752 G1 X158.45 Y197.951 E1.1019
N8753 G1 X158.45 Y198.858 E.02916
N8754 G1 X160.697 Y201.104 E.10218
N8755 G1 X160.622 Y201.104 E.00242
N8756 G1 X180.593 Y126.571 E2.48129
N8757 G1 X178.275 Y126.571 E.07455
N8758 G1 X191.55 Y139.845 E.60368
N8759 G1 X191.55 Y138.509 E.04297
N8760 G1 X158.45 Y147.378 E1.1019
N8761 G1 X158.45 Y146.296 E.03479
N8762 G1 X163.736 Y126.571 E.65668
N8763 G1 X166.761 Y126.571 E.09728
N8764 G1 X191.55 Y151.359 E1.12729
N8765 G1 X191.55 Y152.988 E.05236
N8766 ; WIPE_START
N8767 G1 X191.55 Y151.359 E-.61876
N8768 G1 X191.287 Y151.096 E-.14124
N8769 ; WIPE_END
N8770 G1 E-.04 F1800
N8771 M204 S10000
N8772 G17
N8773 G3 Z6.4 I1.217 J0 P1  F60000
N8774 ; stop printing object, unique label id: 229
N8775 M625
N8776 ; object ids of layer 30 start: 229
N8777 M624 AQAAAAAAAAA=
N8778 ;======== H2D 20250527========
N8779 ; SKIPPABLE_START
N8780 ; SKIPTYPE: timelapse
N8781 M622.1 S1 ; for prev firware, default turned on
N8782 
N8783 M1002 judge_flag timelapse_record_flag
N8784 
N8785 M622 J1
N8786 M993 A2 B2 C2
N8787 M993 A0 B0 C0
N8788 
N8789 
N8790 
N8791 
N8792     M9711 M0 E1 X260 Y141 Z6.4 S11 C10 O0 T3000
N8793 
N8794 
N8795 
N8796 M993 A3 B3 C3
N8797 
N8798 M623
N8799 ; SKIPPABLE_END
N8800 
N8801 ; object ids of this layer30 end: 229
N8802 M625
N8803 ; CHANGE_LAYER
N8804 ; Z_HEIGHT: 6.2
N8805 ; LAYER_HEIGHT: 0.2
N8806 ;======== H2D 20250521========
N8807 ; layer num/total_layer_count: 31/63
N8808 ; update layer progress
N8809 M73 L31
N8810 M991 S0 P30 ;notify layer change
N8811 
N8812 
N8813 ; OBJECT_ID: 229
N8814 ; COOLING_NODE: 0
N8815 ; start printing object, unique label id: 229
N8816 M624 AQAAAAAAAAA=
N8817 G1 X191.898 Y201.453 F60000
N8818 G1 Z6.2
N8819 G1 E.8 F1800
N8820 ; FEATURE: Inner wall
N8821 ; LINE_WIDTH: 0.45
N8822 ; LAYER_HEIGHT: 0.2
N8823 G1 F4421.739
N8824 M204 S8000
N8825 M73 P63 R18
N8826 G1 X158.102 Y201.453 E1.08675
N8827 G1 X158.102 Y126.222 E2.41914
N8828 G1 X191.898 Y126.222 E1.08675
N8829 G1 X191.898 Y201.393 E2.41721
N8830 ; COOLING_NODE: 0
N8831 M204 S10000
N8832 G1 X192.29 Y201.845 F60000
N8833 ; FEATURE: Outer wall
N8834 ; LINE_WIDTH: 0.42
N8835 G1 F4773.528
N8836 M204 S5000
N8837 G1 X157.71 Y201.845 E1.03002
N8838 G1 X157.71 Y125.83 E2.26421
N8839 G1 X192.29 Y125.83 E1.03002
N8840 G1 X192.29 Y201.785 E2.26243
N8841 ; WIPE_START
N8842 M204 S8000
N8843 G1 X190.29 Y201.788 E-.76
N8844 ; WIPE_END
N8845 G1 E-.04 F1800
N8846 M204 S10000
N8847 G1 X190.786 Y194.172 Z6.6 F60000
N8848 M73 P63 R17
N8849 G1 X191.55 Y182.428 Z6.6
N8850 G1 Z6.2
N8851 G1 E.8 F1800
N8852 ; FEATURE: Sparse infill
N8853 ; LINE_WIDTH: 0.45
N8854 G1 F4421.739
N8855 M204 S8000
N8856 G1 X191.55 Y180.799 E.05236
N8857 G1 X158.45 Y189.668 E1.1019
N8858 G1 X158.45 Y187.144 E.08118
N8859 G1 X172.411 Y201.104 E.63488
N8860 G1 X168.904 Y201.104 E.11276
N8861 G1 X188.876 Y126.571 E2.48129
N8862 G1 X189.989 Y126.571 E.03579
N8863 G1 X191.55 Y128.131 E.07098
N8864 G1 X191.55 Y130.227 E.06737
N8865 G1 X158.45 Y139.095 E1.1019
N8866 G1 X158.45 Y141.088 E.06407
N8867 G1 X191.55 Y174.187 E1.50523
N8868 G1 X191.55 Y172.371 E.05842
N8869 G1 X158.45 Y181.239 E1.1019
N8870 G1 X158.45 Y177.206 E.12969
N8871 G1 X172.018 Y126.571 E1.6857
N8872 G1 X170.39 Y126.571 E.05236
N8873 M204 S10000
N8874 G1 X175.366 Y126.571 F60000
N8875 G1 F4421.739
N8876 M204 S8000
N8877 G1 X173.737 Y126.571 E.05236
N8878 G1 X158.45 Y130.667 E.50892
N8879 G1 X158.45 Y129.574 E.03514
N8880 G1 X191.55 Y162.673 E1.50523
N8881 G1 X191.55 Y163.942 E.04079
N8882 G1 X158.45 Y172.811 E1.1019
N8883 G1 X158.45 Y175.63 E.09065
N8884 G1 X183.925 Y201.104 E1.15849
N8885 G1 X185.762 Y201.104 E.05907
N8886 G1 X191.55 Y179.505 E.71907
N8887 G1 X191.55 Y177.876 E.05236
N8888 M204 S10000
N8889 G1 X191.55 Y157.141 F60000
N8890 G1 F4421.739
N8891 M204 S8000
N8892 G1 X191.55 Y155.513 E.05236
N8893 G1 X158.45 Y164.382 E1.1019
N8894 G1 X158.45 Y164.116 E.00856
N8895 G1 X191.55 Y197.215 E1.50523
N8896 G1 X191.55 Y197.657 E.01421
N8897 G1 X178.683 Y201.104 E.42833
N8898 G1 X177.333 Y201.104 E.04341
N8899 G1 X191.55 Y148.048 E1.76629
N8900 G1 X191.55 Y147.084 E.03099
N8901 G1 X158.45 Y155.953 E1.1019
N8902 G1 X158.45 Y152.602 E.10777
N8903 G1 X191.55 Y185.701 E1.50523
N8904 G1 X191.55 Y189.228 E.11342
N8905 G1 X158.45 Y198.097 E1.1019
N8906 G1 X158.45 Y198.658 E.01802
N8907 G1 X160.897 Y201.104 E.11127
N8908 G1 X160.476 Y201.104 E.01356
N8909 G1 X180.447 Y126.571 E2.48129
N8910 G1 X178.475 Y126.571 E.06341
N8911 G1 X191.55 Y139.645 E.59459
N8912 G1 X191.55 Y138.655 E.03183
N8913 G1 X158.45 Y147.524 E1.1019
N8914 G1 X158.45 Y145.75 E.05707
N8915 G1 X163.589 Y126.571 E.63849
N8916 G1 X166.961 Y126.571 E.10842
N8917 G1 X191.55 Y151.159 E1.1182
N8918 G1 X191.55 Y152.788 E.05236
N8919 ; WIPE_START
N8920 G1 X191.55 Y151.159 E-.61876
N8921 G1 X191.287 Y150.896 E-.14124
N8922 ; WIPE_END
N8923 G1 E-.04 F1800
N8924 M204 S10000
N8925 G17
N8926 G3 Z6.6 I1.217 J0 P1  F60000
N8927 ; stop printing object, unique label id: 229
N8928 M625
N8929 ; object ids of layer 31 start: 229
N8930 M624 AQAAAAAAAAA=
N8931 ;======== H2D 20250527========
N8932 ; SKIPPABLE_START
N8933 ; SKIPTYPE: timelapse
N8934 M622.1 S1 ; for prev firware, default turned on
N8935 
N8936 M1002 judge_flag timelapse_record_flag
N8937 
N8938 M622 J1
N8939 M993 A2 B2 C2
N8940 M993 A0 B0 C0
N8941 
N8942 
N8943 
N8944 
N8945     M9711 M0 E1 X260 Y141 Z6.6 S11 C10 O0 T3000
N8946 
N8947 
N8948 
N8949 M993 A3 B3 C3
N8950 
N8951 M623
N8952 ; SKIPPABLE_END
N8953 
N8954 ; object ids of this layer31 end: 229
N8955 M625
N8956 ; CHANGE_LAYER
N8957 ; Z_HEIGHT: 6.4
N8958 ; LAYER_HEIGHT: 0.2
N8959 ;======== H2D 20250521========
N8960 ; layer num/total_layer_count: 32/63
N8961 ; update layer progress
N8962 M73 L32
N8963 M991 S0 P31 ;notify layer change
N8964 
N8965 
N8966 ; OBJECT_ID: 229
N8967 ; COOLING_NODE: 0
N8968 ; start printing object, unique label id: 229
N8969 M624 AQAAAAAAAAA=
N8970 G1 X191.898 Y201.453 F60000
N8971 G1 Z6.4
N8972 G1 E.8 F1800
N8973 ; FEATURE: Inner wall
N8974 ; LINE_WIDTH: 0.45
N8975 ; LAYER_HEIGHT: 0.2
N8976 G1 F4421.739
N8977 M204 S8000
N8978 G1 X158.102 Y201.453 E1.08675
N8979 G1 X158.102 Y126.222 E2.41914
N8980 G1 X191.898 Y126.222 E1.08675
N8981 G1 X191.898 Y201.393 E2.41721
N8982 ; COOLING_NODE: 0
N8983 M204 S10000
N8984 G1 X192.29 Y201.845 F60000
N8985 ; FEATURE: Outer wall
N8986 ; LINE_WIDTH: 0.42
N8987 G1 F4773.528
N8988 M204 S5000
N8989 G1 X157.71 Y201.845 E1.03002
N8990 G1 X157.71 Y125.83 E2.26421
N8991 G1 X192.29 Y125.83 E1.03002
N8992 G1 X192.29 Y201.785 E2.26243
N8993 ; WIPE_START
N8994 M204 S8000
N8995 G1 X190.29 Y201.788 E-.76
N8996 ; WIPE_END
N8997 G1 E-.04 F1800
N8998 M204 S10000
N8999 G1 X190.789 Y194.172 Z6.8 F60000
N9000 G1 X191.55 Y182.574 Z6.8
N9001 G1 Z6.4
N9002 G1 E.8 F1800
N9003 ; FEATURE: Sparse infill
N9004 ; LINE_WIDTH: 0.45
N9005 G1 F4421.739
N9006 M204 S8000
N9007 G1 X191.55 Y180.946 E.05236
N9008 G1 X158.45 Y189.815 E1.1019
N9009 G1 X158.45 Y186.944 E.09232
N9010 G1 X172.611 Y201.104 E.64398
N9011 G1 X168.758 Y201.104 E.1239
N9012 G1 X188.729 Y126.571 E2.48129
N9013 G1 X190.189 Y126.571 E.04693
N9014 G1 X191.55 Y127.931 E.06189
N9015 G1 X191.55 Y130.373 E.07851
N9016 G1 X158.45 Y139.242 E1.1019
N9017 G1 X158.45 Y140.888 E.05293
N9018 G1 X191.55 Y173.987 E1.50523
N9019 G1 X191.55 Y172.517 E.04728
N9020 G1 X158.45 Y181.386 E1.1019
N9021 G1 X158.45 Y176.66 E.15197
N9022 M73 P64 R17
N9023 G1 X171.872 Y126.571 E1.66751
N9024 G1 X170.243 Y126.571 E.05236
N9025 M204 S10000
N9026 G1 X175.912 Y126.571 F60000
N9027 G1 F4421.739
N9028 M204 S8000
N9029 G1 X174.284 Y126.571 E.05236
N9030 G1 X158.45 Y130.813 E.52711
N9031 G1 X158.45 Y129.374 E.04628
N9032 G1 X191.55 Y162.473 E1.50523
N9033 G1 X191.55 Y164.088 E.05193
N9034 G1 X158.45 Y172.957 E1.1019
N9035 G1 X158.45 Y171.329 E.05236
N9036 M204 S10000
N9037 G1 X158.45 Y175.43 F60000
N9038 G1 F4421.739
N9039 M204 S8000
N9040 G1 X184.125 Y201.104 E1.16759
N9041 G1 X185.616 Y201.104 E.04793
N9042 G1 X191.55 Y178.958 E.73726
N9043 G1 X191.55 Y177.33 E.05236
N9044 M204 S10000
N9045 G1 X191.55 Y157.288 F60000
N9046 G1 F4421.739
N9047 M204 S8000
N9048 G1 X191.55 Y155.659 E.05236
N9049 G1 X158.45 Y164.528 E1.1019
N9050 G1 X158.45 Y163.916 E.0197
N9051 G1 X191.55 Y197.015 E1.50523
N9052 G1 X191.55 Y197.803 E.02535
N9053 G1 X179.23 Y201.104 E.41014
N9054 G1 X177.187 Y201.104 E.06569
N9055 G1 X191.55 Y147.501 E1.78448
N9056 G1 X191.55 Y147.231 E.00871
N9057 G1 X158.45 Y156.099 E1.1019
N9058 G1 X158.45 Y152.402 E.11891
N9059 G1 X191.55 Y185.501 E1.50523
N9060 G1 X191.55 Y189.375 E.12455
N9061 G1 X158.45 Y198.243 E1.1019
N9062 G1 X158.45 Y198.458 E.00688
N9063 G1 X161.097 Y201.104 E.12037
N9064 G1 X160.329 Y201.104 E.0247
N9065 G1 X180.301 Y126.571 E2.48129
N9066 G1 X178.675 Y126.571 E.05227
N9067 G1 X191.55 Y139.445 E.58549
N9068 G1 X191.55 Y138.802 E.02069
N9069 G1 X158.45 Y147.671 E1.1019
N9070 G1 X158.45 Y145.203 E.07934
N9071 G1 X163.443 Y126.571 E.6203
N9072 G1 X167.161 Y126.571 E.11956
N9073 G1 X191.55 Y150.959 E1.1091
N9074 G1 X191.55 Y152.588 E.05236
N9075 ; WIPE_START
N9076 G1 X191.55 Y150.959 E-.61876
N9077 G1 X191.287 Y150.696 E-.14124
N9078 ; WIPE_END
N9079 G1 E-.04 F1800
N9080 M204 S10000
N9081 G17
N9082 G3 Z6.8 I1.217 J0 P1  F60000
N9083 ; stop printing object, unique label id: 229
N9084 M625
N9085 ; object ids of layer 32 start: 229
N9086 M624 AQAAAAAAAAA=
N9087 ;======== H2D 20250527========
N9088 ; SKIPPABLE_START
N9089 ; SKIPTYPE: timelapse
N9090 M622.1 S1 ; for prev firware, default turned on
N9091 
N9092 M1002 judge_flag timelapse_record_flag
N9093 
N9094 M622 J1
N9095 M993 A2 B2 C2
N9096 M993 A0 B0 C0
N9097 
N9098 
N9099 
N9100 
N9101     M9711 M0 E1 X260 Y141 Z6.8 S11 C10 O0 T3000
N9102 
N9103 
N9104 
N9105 M993 A3 B3 C3
N9106 
N9107 M623
N9108 ; SKIPPABLE_END
N9109 
N9110 ; object ids of this layer32 end: 229
N9111 M625
N9112 ; CHANGE_LAYER
N9113 ; Z_HEIGHT: 6.6
N9114 ; LAYER_HEIGHT: 0.2
N9115 ;======== H2D 20250521========
N9116 ; layer num/total_layer_count: 33/63
N9117 ; update layer progress
N9118 M73 L33
N9119 M991 S0 P32 ;notify layer change
N9120 
N9121 
N9122 ; OBJECT_ID: 229
N9123 ; COOLING_NODE: 0
N9124 ; start printing object, unique label id: 229
N9125 M624 AQAAAAAAAAA=
N9126 G1 X191.898 Y201.453 F60000
N9127 G1 Z6.6
N9128 G1 E.8 F1800
N9129 ; FEATURE: Inner wall
N9130 ; LINE_WIDTH: 0.45
N9131 ; LAYER_HEIGHT: 0.2
N9132 G1 F4421.739
N9133 M204 S8000
N9134 G1 X158.102 Y201.453 E1.08675
N9135 G1 X158.102 Y126.222 E2.41914
N9136 G1 X191.898 Y126.222 E1.08675
N9137 G1 X191.898 Y201.393 E2.41721
N9138 ; COOLING_NODE: 0
N9139 M204 S10000
N9140 G1 X192.29 Y201.845 F60000
N9141 ; FEATURE: Outer wall
N9142 ; LINE_WIDTH: 0.42
N9143 G1 F4773.528
N9144 M204 S5000
N9145 G1 X157.71 Y201.845 E1.03002
N9146 G1 X157.71 Y125.83 E2.26421
N9147 G1 X192.29 Y125.83 E1.03002
N9148 G1 X192.29 Y201.785 E2.26243
N9149 ; WIPE_START
N9150 M204 S8000
N9151 G1 X190.29 Y201.788 E-.76
N9152 ; WIPE_END
N9153 G1 E-.04 F1800
N9154 M204 S10000
N9155 G1 X191.187 Y194.209 Z7 F60000
N9156 G1 X191.55 Y191.149 Z7
N9157 G1 Z6.6
N9158 G1 E.8 F1800
N9159 ; FEATURE: Sparse infill
N9160 ; LINE_WIDTH: 0.45
N9161 G1 F4421.739
N9162 M204 S8000
N9163 G1 X191.55 Y189.521 E.05236
N9164 G1 X158.45 Y198.39 E1.1019
N9165 G1 X158.45 Y198.258 E.00426
N9166 G1 X161.297 Y201.104 E.12946
N9167 G1 X160.183 Y201.104 E.03583
N9168 G1 X180.154 Y126.571 E2.48129
N9169 G1 X178.875 Y126.571 E.04114
N9170 G1 X191.55 Y139.245 E.5764
N9171 G1 X191.55 Y138.948 E.00956
N9172 G1 X158.45 Y147.817 E1.1019
N9173 G1 X158.45 Y144.657 E.10162
N9174 G1 X163.297 Y126.571 E.60211
N9175 G1 X167.361 Y126.571 E.1307
N9176 G1 X191.55 Y150.759 E1.10001
N9177 G1 X191.55 Y155.806 E.16228
N9178 G1 X158.45 Y164.675 E1.1019
N9179 G1 X158.45 Y163.716 E.03084
N9180 G1 X191.55 Y196.815 E1.50523
N9181 G1 X191.55 Y197.95 E.03649
N9182 G1 X179.776 Y201.104 E.39195
N9183 G1 X177.04 Y201.104 E.08797
N9184 G1 X191.55 Y146.955 E1.80267
N9185 G1 X191.55 Y145.327 E.05236
N9186 M204 S10000
N9187 G1 X191.55 Y147.377 F60000
N9188 G1 F4421.739
N9189 M204 S8000
N9190 G1 X158.45 Y156.246 E1.1019
N9191 G1 X158.45 Y152.202 E.13005
N9192 G1 X191.55 Y185.301 E1.50523
N9193 G1 X191.55 Y181.092 E.13535
N9194 G1 X158.45 Y189.961 E1.1019
N9195 G1 X158.45 Y186.744 E.10346
N9196 G1 X172.811 Y201.104 E.65307
N9197 G1 X168.612 Y201.104 E.13504
N9198 G1 X188.583 Y126.571 E2.48129
N9199 G1 X190.389 Y126.571 E.05807
N9200 G1 X191.55 Y127.731 E.05279
N9201 G1 X191.55 Y130.519 E.08965
N9202 G1 X158.45 Y139.388 E1.1019
N9203 G1 X158.45 Y140.688 E.04179
N9204 G1 X191.55 Y173.787 E1.50523
N9205 G1 X191.55 Y172.663 E.03614
N9206 G1 X158.45 Y181.532 E1.1019
N9207 G1 X158.45 Y176.114 E.17425
N9208 G1 X171.725 Y126.571 E1.64932
N9209 G1 X170.097 Y126.571 E.05236
N9210 M204 S10000
N9211 G1 X176.459 Y126.571 F60000
N9212 G1 F4421.739
N9213 M204 S8000
N9214 G1 X174.83 Y126.571 E.05236
N9215 G1 X158.45 Y130.96 E.5453
N9216 G1 X158.45 Y129.174 E.05742
N9217 G1 X191.55 Y162.273 E1.50523
N9218 G1 X191.55 Y164.235 E.06307
N9219 G1 X158.45 Y173.103 E1.1019
N9220 G1 X158.45 Y171.475 E.05236
N9221 M204 S10000
N9222 G1 X158.45 Y175.23 F60000
N9223 G1 F4421.739
N9224 M204 S8000
N9225 M73 P65 R17
N9226 G1 X184.325 Y201.104 E1.17668
N9227 G1 X185.469 Y201.104 E.03679
N9228 G1 X191.55 Y178.412 E.75545
N9229 G1 X191.55 Y176.783 E.05236
N9230 ; WIPE_START
N9231 G1 X191.55 Y178.412 E-.61876
N9232 G1 X191.453 Y178.771 E-.14124
N9233 ; WIPE_END
N9234 G1 E-.04 F1800
N9235 M204 S10000
N9236 G17
N9237 G3 Z7 I1.217 J0 P1  F60000
N9238 ; stop printing object, unique label id: 229
N9239 M625
N9240 ; object ids of layer 33 start: 229
N9241 M624 AQAAAAAAAAA=
N9242 ;======== H2D 20250527========
N9243 ; SKIPPABLE_START
N9244 ; SKIPTYPE: timelapse
N9245 M622.1 S1 ; for prev firware, default turned on
N9246 
N9247 M1002 judge_flag timelapse_record_flag
N9248 
N9249 M622 J1
N9250 M993 A2 B2 C2
N9251 M993 A0 B0 C0
N9252 
N9253 
N9254 
N9255 
N9256     M9711 M0 E1 X260 Y141 Z7 S11 C10 O0 T3000
N9257 
N9258 
N9259 
N9260 M993 A3 B3 C3
N9261 
N9262 M623
N9263 ; SKIPPABLE_END
N9264 
N9265 ; object ids of this layer33 end: 229
N9266 M625
N9267 ; CHANGE_LAYER
N9268 ; Z_HEIGHT: 6.8
N9269 ; LAYER_HEIGHT: 0.2
N9270 ;======== H2D 20250521========
N9271 ; layer num/total_layer_count: 34/63
N9272 ; update layer progress
N9273 M73 L34
N9274 M991 S0 P33 ;notify layer change
N9275 
N9276 
N9277 M106 S68.85
N9278 ; OBJECT_ID: 229
N9279 ; COOLING_NODE: 0
N9280 ; start printing object, unique label id: 229
N9281 M624 AQAAAAAAAAA=
N9282 G1 X191.898 Y201.453 F60000
N9283 G1 Z6.8
N9284 G1 E.8 F1800
N9285 ; FEATURE: Inner wall
N9286 ; LINE_WIDTH: 0.45
N9287 ; LAYER_HEIGHT: 0.2
N9288 G1 F4421.739
N9289 M204 S8000
N9290 G1 X158.102 Y201.453 E1.08675
N9291 G1 X158.102 Y126.222 E2.41914
N9292 G1 X191.898 Y126.222 E1.08675
N9293 G1 X191.898 Y201.393 E2.41721
N9294 ; COOLING_NODE: 0
N9295 M204 S10000
N9296 G1 X192.29 Y201.845 F60000
N9297 ; FEATURE: Outer wall
N9298 ; LINE_WIDTH: 0.42
N9299 G1 F4773.528
N9300 M204 S5000
N9301 G1 X157.71 Y201.845 E1.03002
N9302 G1 X157.71 Y125.83 E2.26421
N9303 G1 X192.29 Y125.83 E1.03002
N9304 G1 X192.29 Y201.785 E2.26243
N9305 ; WIPE_START
N9306 M204 S8000
N9307 G1 X190.29 Y201.788 E-.76
N9308 ; WIPE_END
N9309 G1 E-.04 F1800
N9310 M204 S10000
N9311 G1 X191.2 Y194.21 Z7.2 F60000
N9312 G1 X191.55 Y191.296 Z7.2
N9313 G1 Z6.8
N9314 G1 E.8 F1800
N9315 ; FEATURE: Sparse infill
N9316 ; LINE_WIDTH: 0.45
N9317 M73 P65 R16
N9318 G1 F4421.739
N9319 M204 S8000
N9320 G1 X191.55 Y189.667 E.05236
N9321 G1 X158.45 Y198.536 E1.1019
N9322 G1 X158.45 Y198.058 E.01539
N9323 G1 X161.497 Y201.104 E.13856
N9324 G1 X160.036 Y201.104 E.04697
N9325 G1 X180.008 Y126.571 E2.48129
N9326 G1 X179.075 Y126.571 E.03
N9327 G1 X191.55 Y139.045 E.5673
N9328 G1 X191.55 Y139.095 E.00158
N9329 G1 X158.45 Y147.964 E1.1019
N9330 G1 X158.45 Y144.11 E.1239
N9331 G1 X163.15 Y126.571 E.58392
N9332 G1 X161.522 Y126.571 E.05236
N9333 M204 S10000
N9334 G1 X177.005 Y126.571 F60000
N9335 G1 F4421.739
N9336 M204 S8000
N9337 G1 X175.377 Y126.571 E.05236
N9338 G1 X158.45 Y131.106 E.56349
N9339 G1 X158.45 Y128.974 E.06856
N9340 G1 X191.55 Y162.073 E1.50523
N9341 G1 X191.55 Y164.381 E.07421
N9342 G1 X158.45 Y173.25 E1.1019
N9343 G1 X158.45 Y171.622 E.05236
N9344 M204 S10000
N9345 G1 X158.45 Y175.03 F60000
N9346 G1 F4421.739
N9347 M204 S8000
N9348 G1 X184.525 Y201.104 E1.18578
N9349 G1 X185.323 Y201.104 E.02565
N9350 G1 X191.55 Y177.865 E.77365
N9351 G1 X191.55 Y176.237 E.05236
N9352 M204 S10000
N9353 G1 X191.55 Y147.523 F60000
N9354 G1 F4421.739
N9355 M204 S8000
N9356 G1 X158.45 Y156.392 E1.1019
N9357 G1 X158.45 Y152.002 E.14118
N9358 G1 X191.55 Y185.101 E1.50523
N9359 G1 X191.55 Y181.239 E.12421
N9360 G1 X158.45 Y190.107 E1.1019
N9361 G1 X158.45 Y186.544 E.1146
N9362 G1 X173.011 Y201.104 E.66217
N9363 G1 X168.465 Y201.104 E.14618
N9364 G1 X188.437 Y126.571 E2.48129
N9365 G1 X190.589 Y126.571 E.06921
N9366 G1 X191.55 Y127.531 E.0437
N9367 G1 X191.55 Y130.666 E.10079
N9368 G1 X158.45 Y139.535 E1.1019
N9369 G1 X158.45 Y140.488 E.03065
N9370 G1 X191.55 Y173.587 E1.50523
N9371 G1 X191.55 Y172.81 E.025
N9372 G1 X158.45 Y181.679 E1.1019
N9373 G1 X158.45 Y175.567 E.19653
N9374 G1 X171.579 Y126.571 E1.63113
N9375 G1 X167.561 Y126.571 E.1292
N9376 G1 X191.55 Y150.559 E1.09091
N9377 G1 X191.55 Y155.952 E.17342
N9378 G1 X158.45 Y164.821 E1.1019
N9379 G1 X158.45 Y163.516 E.04198
N9380 G1 X191.55 Y196.615 E1.50523
N9381 G1 X191.55 Y198.096 E.04763
N9382 G1 X180.323 Y201.104 E.37376
N9383 G1 X176.894 Y201.104 E.11025
N9384 G1 X191.55 Y146.409 E1.82086
N9385 G1 X191.55 Y144.78 E.05236
N9386 ; WIPE_START
N9387 G1 X191.55 Y146.409 E-.61876
N9388 G1 X191.453 Y146.768 E-.14124
N9389 ; WIPE_END
N9390 G1 E-.04 F1800
N9391 M204 S10000
N9392 G17
N9393 G3 Z7.2 I1.217 J0 P1  F60000
N9394 ; stop printing object, unique label id: 229
N9395 M625
N9396 ; object ids of layer 34 start: 229
N9397 M624 AQAAAAAAAAA=
N9398 ;======== H2D 20250527========
N9399 ; SKIPPABLE_START
N9400 ; SKIPTYPE: timelapse
N9401 M622.1 S1 ; for prev firware, default turned on
N9402 
N9403 M1002 judge_flag timelapse_record_flag
N9404 
N9405 M622 J1
N9406 M993 A2 B2 C2
N9407 M993 A0 B0 C0
N9408 
N9409 
N9410 
N9411 
N9412     M9711 M0 E1 X260 Y141 Z7.2 S11 C10 O0 T3000
N9413 
N9414 
N9415 
N9416 M993 A3 B3 C3
N9417 
N9418 M623
N9419 ; SKIPPABLE_END
N9420 
N9421 ; object ids of this layer34 end: 229
N9422 M625
N9423 ; CHANGE_LAYER
N9424 ; Z_HEIGHT: 7
N9425 ; LAYER_HEIGHT: 0.2
N9426 ;======== H2D 20250521========
N9427 ; layer num/total_layer_count: 35/63
N9428 ; update layer progress
N9429 M73 L35
N9430 M991 S0 P34 ;notify layer change
N9431 
N9432 
N9433 ; OBJECT_ID: 229
N9434 ; COOLING_NODE: 0
N9435 ; start printing object, unique label id: 229
N9436 M624 AQAAAAAAAAA=
N9437 G1 X191.898 Y201.453 F60000
N9438 G1 Z7
N9439 G1 E.8 F1800
N9440 ; FEATURE: Inner wall
N9441 ; LINE_WIDTH: 0.45
N9442 ; LAYER_HEIGHT: 0.2
N9443 G1 F4421.739
N9444 M204 S8000
N9445 G1 X158.102 Y201.453 E1.08675
N9446 G1 X158.102 Y126.222 E2.41914
N9447 G1 X191.898 Y126.222 E1.08675
N9448 G1 X191.898 Y201.393 E2.41721
N9449 ; COOLING_NODE: 0
N9450 M204 S10000
N9451 G1 X192.29 Y201.845 F60000
N9452 ; FEATURE: Outer wall
N9453 ; LINE_WIDTH: 0.42
N9454 G1 F4773.528
N9455 M204 S5000
N9456 G1 X157.71 Y201.845 E1.03002
N9457 G1 X157.71 Y125.83 E2.26421
N9458 G1 X192.29 Y125.83 E1.03002
N9459 G1 X192.29 Y201.785 E2.26243
N9460 ; WIPE_START
N9461 M204 S8000
N9462 G1 X190.29 Y201.788 E-.76
N9463 ; WIPE_END
N9464 G1 E-.04 F1800
N9465 M204 S10000
N9466 G1 X191.212 Y194.212 Z7.4 F60000
N9467 G1 X191.55 Y191.442 Z7.4
N9468 G1 Z7
N9469 G1 E.8 F1800
N9470 ; FEATURE: Sparse infill
N9471 ; LINE_WIDTH: 0.45
N9472 G1 F4421.739
N9473 M204 S8000
N9474 G1 X191.55 Y189.814 E.05236
N9475 G1 X158.45 Y198.683 E1.1019
N9476 G1 X158.45 Y197.858 E.02653
N9477 G1 X161.697 Y201.104 E.14766
N9478 G1 X159.89 Y201.104 E.05811
N9479 G1 X179.861 Y126.571 E2.48129
N9480 G1 X179.275 Y126.571 E.01886
N9481 G1 X191.55 Y138.845 E.55821
N9482 G1 X191.55 Y139.241 E.01272
N9483 G1 X158.45 Y148.11 E1.1019
N9484 G1 X158.45 Y151.802 E.11872
N9485 M73 P66 R16
N9486 G1 X191.55 Y184.901 E1.50523
N9487 G1 X191.55 Y181.385 E.11307
N9488 G1 X158.45 Y190.254 E1.1019
N9489 G1 X158.45 Y186.344 E.12574
N9490 G1 X173.211 Y201.104 E.67126
N9491 G1 X176.748 Y201.104 E.11372
N9492 G1 X191.55 Y145.862 E1.83905
N9493 G1 X191.55 Y144.234 E.05236
N9494 M204 S10000
N9495 G1 X191.55 Y157.727 F60000
N9496 G1 F4421.739
N9497 M204 S8000
N9498 G1 X191.55 Y156.099 E.05236
N9499 G1 X158.45 Y164.968 E1.1019
N9500 G1 X158.45 Y163.316 E.05312
N9501 G1 X191.55 Y196.415 E1.50523
N9502 G1 X191.55 Y198.243 E.05876
N9503 G1 X180.869 Y201.104 E.35557
N9504 G1 X179.241 Y201.104 E.05236
N9505 M204 S10000
N9506 G1 X166.69 Y201.104 F60000
N9507 G1 F4421.739
N9508 M204 S8000
N9509 G1 X168.319 Y201.104 E.05236
N9510 G1 X188.29 Y126.571 E2.48129
N9511 G1 X190.789 Y126.571 E.08035
N9512 G1 X191.55 Y127.331 E.0346
N9513 G1 X191.55 Y130.812 E.11193
N9514 G1 X158.45 Y139.681 E1.1019
N9515 G1 X158.45 Y140.288 E.01951
N9516 G1 X191.55 Y173.387 E1.50523
N9517 G1 X191.55 Y172.956 E.01386
N9518 G1 X158.45 Y181.825 E1.1019
N9519 G1 X158.45 Y180.197 E.05236
N9520 M204 S10000
N9521 G1 X158.45 Y171.768 F60000
N9522 G1 F4421.739
N9523 M204 S8000
N9524 G1 X158.45 Y173.396 E.05236
N9525 G1 X191.55 Y164.527 E1.1019
N9526 G1 X191.55 Y161.873 E.08535
N9527 G1 X158.45 Y128.774 E1.50523
N9528 G1 X158.45 Y131.252 E.0797
N9529 G1 X175.923 Y126.571 E.58168
N9530 G1 X177.551 Y126.571 E.05236
N9531 M204 S10000
N9532 G1 X161.375 Y126.571 F60000
N9533 G1 F4421.739
N9534 M204 S8000
N9535 G1 X163.004 Y126.571 E.05236
N9536 G1 X158.45 Y143.564 E.56573
N9537 G1 X158.45 Y145.192 E.05236
N9538 M204 S10000
N9539 G1 X158.45 Y158.167 F60000
N9540 G1 F4421.739
N9541 M204 S8000
N9542 G1 X158.45 Y156.539 E.05236
N9543 G1 X191.55 Y147.67 E1.1019
N9544 G1 X191.55 Y150.359 E.08648
N9545 G1 X167.761 Y126.571 E1.08182
N9546 G1 X171.433 Y126.571 E.11806
N9547 G1 X158.45 Y175.021 E1.61294
N9548 G1 X158.45 Y174.83 E.00614
N9549 G1 X184.725 Y201.104 E1.19487
N9550 G1 X185.176 Y201.104 E.01451
N9551 G1 X191.55 Y177.319 E.79184
N9552 G1 X191.55 Y175.691 E.05236
N9553 ; WIPE_START
N9554 G1 X191.55 Y177.319 E-.61876
N9555 G1 X191.453 Y177.678 E-.14124
N9556 ; WIPE_END
N9557 G1 E-.04 F1800
N9558 M204 S10000
N9559 G17
N9560 G3 Z7.4 I1.217 J0 P1  F60000
N9561 ; stop printing object, unique label id: 229
N9562 M625
N9563 ; object ids of layer 35 start: 229
N9564 M624 AQAAAAAAAAA=
N9565 ;======== H2D 20250527========
N9566 ; SKIPPABLE_START
N9567 ; SKIPTYPE: timelapse
N9568 M622.1 S1 ; for prev firware, default turned on
N9569 
N9570 M1002 judge_flag timelapse_record_flag
N9571 
N9572 M622 J1
N9573 M993 A2 B2 C2
N9574 M993 A0 B0 C0
N9575 
N9576 
N9577 
N9578 
N9579     M9711 M0 E1 X260 Y141 Z7.4 S11 C10 O0 T3000
N9580 
N9581 
N9582 
N9583 M993 A3 B3 C3
N9584 
N9585 M623
N9586 ; SKIPPABLE_END
N9587 
N9588 ; object ids of this layer35 end: 229
N9589 M625
N9590 ; CHANGE_LAYER
N9591 ; Z_HEIGHT: 7.2
N9592 ; LAYER_HEIGHT: 0.2
N9593 ;======== H2D 20250521========
N9594 ; layer num/total_layer_count: 36/63
N9595 ; update layer progress
N9596 M73 L36
N9597 M991 S0 P35 ;notify layer change
N9598 
N9599 
N9600 ; OBJECT_ID: 229
N9601 ; COOLING_NODE: 0
N9602 ; start printing object, unique label id: 229
N9603 M624 AQAAAAAAAAA=
N9604 G1 X191.898 Y201.453 F60000
N9605 G1 Z7.2
N9606 G1 E.8 F1800
N9607 ; FEATURE: Inner wall
N9608 ; LINE_WIDTH: 0.45
N9609 ; LAYER_HEIGHT: 0.2
N9610 G1 F4421.739
N9611 M204 S8000
N9612 G1 X158.102 Y201.453 E1.08675
N9613 G1 X158.102 Y126.222 E2.41914
N9614 G1 X191.898 Y126.222 E1.08675
N9615 G1 X191.898 Y201.393 E2.41721
N9616 ; COOLING_NODE: 0
N9617 M204 S10000
N9618 G1 X192.29 Y201.845 F60000
N9619 ; FEATURE: Outer wall
N9620 ; LINE_WIDTH: 0.42
N9621 G1 F4773.528
N9622 M204 S5000
N9623 G1 X157.71 Y201.845 E1.03002
N9624 G1 X157.71 Y125.83 E2.26421
N9625 G1 X192.29 Y125.83 E1.03002
N9626 G1 X192.29 Y201.785 E2.26243
N9627 ; WIPE_START
N9628 M204 S8000
N9629 G1 X190.29 Y201.788 E-.76
N9630 ; WIPE_END
N9631 G1 E-.04 F1800
N9632 M204 S10000
N9633 G1 X191.226 Y194.213 Z7.6 F60000
N9634 G1 X191.55 Y191.588 Z7.6
N9635 G1 Z7.2
N9636 G1 E.8 F1800
N9637 ; FEATURE: Sparse infill
N9638 ; LINE_WIDTH: 0.45
N9639 G1 F4421.739
N9640 M204 S8000
N9641 G1 X191.55 Y189.96 E.05236
N9642 G1 X158.45 Y198.829 E1.1019
N9643 G1 X158.45 Y197.658 E.03767
N9644 G1 X161.897 Y201.104 E.15675
N9645 G1 X159.744 Y201.104 E.06925
N9646 G1 X179.715 Y126.571 E2.48129
N9647 G1 X179.475 Y126.571 E.00772
N9648 G1 X191.55 Y138.645 E.54911
N9649 G1 X191.55 Y139.387 E.02386
N9650 G1 X158.45 Y148.256 E1.1019
N9651 G1 X158.45 Y151.602 E.10758
N9652 G1 X191.55 Y184.701 E1.50523
N9653 G1 X191.55 Y181.531 E.10193
N9654 G1 X158.45 Y190.4 E1.1019
N9655 G1 X158.45 Y192.029 E.05236
N9656 M204 S10000
N9657 G1 X166.544 Y201.104 F60000
N9658 G1 F4421.739
N9659 M204 S8000
N9660 G1 X168.172 Y201.104 E.05236
N9661 G1 X188.144 Y126.571 E2.48129
N9662 G1 X190.989 Y126.571 E.09149
N9663 G1 X191.55 Y127.131 E.02551
N9664 G1 X191.55 Y130.959 E.12307
N9665 G1 X158.45 Y139.828 E1.1019
N9666 G1 X158.45 Y140.088 E.00837
N9667 G1 X191.55 Y173.187 E1.50523
N9668 G1 X191.55 Y173.103 E.00272
N9669 G1 X158.45 Y181.972 E1.1019
N9670 G1 X158.45 Y186.144 E.13416
N9671 G1 X173.411 Y201.104 E.68036
N9672 G1 X176.601 Y201.104 E.10258
N9673 G1 X191.55 Y145.316 E1.85724
N9674 G1 X191.55 Y143.688 E.05236
N9675 M204 S10000
N9676 G1 X191.55 Y154.617 F60000
N9677 G1 F4421.739
N9678 M204 S8000
N9679 G1 X191.55 Y156.245 E.05236
N9680 G1 X158.45 Y165.114 E1.1019
N9681 G1 X158.45 Y163.116 E.06426
N9682 G1 X191.55 Y196.215 E1.50523
N9683 G1 X191.55 Y198.389 E.0699
N9684 G1 X181.415 Y201.104 E.33738
N9685 G1 X179.787 Y201.104 E.05236
N9686 M204 S10000
N9687 G1 X191.55 Y175.144 F60000
N9688 G1 F4421.739
N9689 M204 S8000
N9690 G1 X191.55 Y176.773 E.05236
N9691 G1 X185.03 Y201.104 E.81003
N9692 G1 X184.925 Y201.104 E.00337
N9693 G1 X158.45 Y174.63 E1.20397
N9694 G1 X158.45 Y174.474 E.005
N9695 G1 X171.286 Y126.571 E1.59475
N9696 G1 X167.961 Y126.571 E.10693
N9697 G1 X191.55 Y150.159 E1.07272
N9698 G1 X191.55 Y147.816 E.07535
N9699 M73 P67 R16
N9700 G1 X158.45 Y156.685 E1.1019
N9701 G1 X158.45 Y158.313 E.05236
N9702 M204 S10000
N9703 G1 X158.45 Y144.646 F60000
N9704 G1 F4421.739
N9705 M204 S8000
N9706 G1 X158.45 Y143.018 E.05236
N9707 G1 X162.857 Y126.571 E.54754
N9708 G1 X161.229 Y126.571 E.05236
N9709 M204 S10000
N9710 G1 X178.098 Y126.571 F60000
N9711 G1 F4421.739
N9712 M204 S8000
N9713 G1 X176.469 Y126.571 E.05236
N9714 G1 X158.45 Y131.399 E.59987
N9715 G1 X158.45 Y128.574 E.09084
N9716 G1 X191.55 Y161.673 E1.50523
N9717 G1 X191.55 Y164.674 E.09649
N9718 G1 X158.45 Y173.543 E1.1019
N9719 ; WIPE_START
N9720 G1 X160.382 Y173.025 E-.76
N9721 ; WIPE_END
N9722 G1 E-.04 F1800
N9723 M204 S10000
N9724 G17
N9725 G3 Z7.6 I1.217 J0 P1  F60000
N9726 ; stop printing object, unique label id: 229
N9727 M625
N9728 ; object ids of layer 36 start: 229
N9729 M624 AQAAAAAAAAA=
N9730 ;======== H2D 20250527========
N9731 ; SKIPPABLE_START
N9732 ; SKIPTYPE: timelapse
N9733 M622.1 S1 ; for prev firware, default turned on
N9734 
N9735 M1002 judge_flag timelapse_record_flag
N9736 
N9737 M622 J1
N9738 M993 A2 B2 C2
N9739 M993 A0 B0 C0
N9740 
N9741 
N9742 
N9743 
N9744     M9711 M0 E1 X260 Y141 Z7.6 S11 C10 O0 T3000
N9745 
N9746 
N9747 
N9748 M993 A3 B3 C3
N9749 
N9750 M623
N9751 ; SKIPPABLE_END
N9752 
N9753 ; object ids of this layer36 end: 229
N9754 M625
N9755 ; CHANGE_LAYER
N9756 ; Z_HEIGHT: 7.4
N9757 ; LAYER_HEIGHT: 0.2
N9758 ;======== H2D 20250521========
N9759 ; layer num/total_layer_count: 37/63
N9760 ; update layer progress
N9761 M73 L37
N9762 M991 S0 P36 ;notify layer change
N9763 
N9764 
N9765 ; OBJECT_ID: 229
N9766 ; COOLING_NODE: 0
N9767 ; start printing object, unique label id: 229
N9768 M624 AQAAAAAAAAA=
N9769 G1 X191.898 Y201.453 F60000
N9770 G1 Z7.4
N9771 G1 E.8 F1800
N9772 ; FEATURE: Inner wall
N9773 ; LINE_WIDTH: 0.45
N9774 ; LAYER_HEIGHT: 0.2
N9775 G1 F4421.739
N9776 M204 S8000
N9777 G1 X158.102 Y201.453 E1.08675
N9778 G1 X158.102 Y126.222 E2.41914
N9779 G1 X191.898 Y126.222 E1.08675
N9780 G1 X191.898 Y201.393 E2.41721
N9781 ; COOLING_NODE: 0
N9782 M204 S10000
N9783 G1 X192.29 Y201.845 F60000
N9784 ; FEATURE: Outer wall
N9785 ; LINE_WIDTH: 0.42
N9786 G1 F4773.528
N9787 M204 S5000
N9788 G1 X157.71 Y201.845 E1.03002
N9789 G1 X157.71 Y125.83 E2.26421
N9790 G1 X192.29 Y125.83 E1.03002
N9791 G1 X192.29 Y201.785 E2.26243
N9792 ; WIPE_START
N9793 M204 S8000
N9794 G1 X190.29 Y201.788 E-.76
N9795 ; WIPE_END
N9796 G1 E-.04 F1800
N9797 M204 S10000
N9798 G1 X191.239 Y194.215 Z7.8 F60000
N9799 M73 P67 R15
N9800 G1 X191.55 Y191.735 Z7.8
N9801 G1 Z7.4
N9802 G1 E.8 F1800
N9803 ; FEATURE: Sparse infill
N9804 ; LINE_WIDTH: 0.45
N9805 G1 F4421.739
N9806 M204 S8000
N9807 G1 X191.55 Y190.107 E.05236
N9808 G1 X158.45 Y198.976 E1.1019
N9809 G1 X158.45 Y197.458 E.04881
N9810 G1 X162.097 Y201.104 E.16585
N9811 G1 X159.597 Y201.104 E.08039
N9812 G1 X179.568 Y126.571 E2.48129
N9813 G1 X179.675 Y126.571 E.00342
N9814 G1 X191.55 Y138.445 E.54002
N9815 G1 X191.55 Y139.534 E.035
N9816 G1 X158.45 Y148.403 E1.1019
N9817 G1 X158.45 Y151.402 E.09644
N9818 G1 X191.55 Y184.501 E1.50523
N9819 G1 X191.55 Y181.678 E.09079
N9820 G1 X158.45 Y190.547 E1.1019
N9821 G1 X158.45 Y192.175 E.05236
N9822 M204 S10000
N9823 G1 X166.398 Y201.104 F60000
N9824 G1 F4421.739
N9825 M204 S8000
N9826 G1 X168.026 Y201.104 E.05236
N9827 G1 X187.997 Y126.571 E2.48129
N9828 G1 X191.189 Y126.571 E.10263
N9829 G1 X191.55 Y126.931 E.01641
N9830 G1 X191.55 Y131.105 E.13421
N9831 G1 X158.45 Y139.974 E1.1019
N9832 G1 X158.45 Y139.888 E.00277
N9833 G1 X191.55 Y172.987 E1.50523
N9834 G1 X191.55 Y173.249 E.00842
N9835 G1 X158.45 Y182.118 E1.1019
N9836 G1 X158.45 Y185.944 E.12302
N9837 G1 X173.611 Y201.104 E.68945
N9838 G1 X176.455 Y201.104 E.09144
N9839 G1 X191.55 Y144.769 E1.87543
N9840 G1 X191.55 Y143.141 E.05236
N9841 M204 S10000
N9842 G1 X191.55 Y154.763 F60000
N9843 G1 F4421.739
N9844 M204 S8000
N9845 G1 X191.55 Y156.391 E.05236
N9846 G1 X158.45 Y165.26 E1.1019
N9847 G1 X158.45 Y162.916 E.0754
N9848 G1 X191.55 Y196.015 E1.50523
N9849 G1 X191.55 Y198.535 E.08104
N9850 G1 X181.962 Y201.104 E.31919
N9851 G1 X180.333 Y201.104 E.05236
N9852 M204 S10000
N9853 G1 X191.55 Y174.598 F60000
N9854 G1 F4421.739
N9855 M204 S8000
N9856 G1 X191.55 Y176.226 E.05236
N9857 G1 X184.884 Y201.104 E.82822
N9858 G1 X185.125 Y201.104 E.00777
N9859 G1 X158.45 Y174.43 E1.21306
N9860 G1 X158.45 Y176.058 E.05236
N9861 M204 S10000
N9862 G1 X161.083 Y126.571 F60000
N9863 G1 F4421.739
N9864 M204 S8000
N9865 G1 X162.711 Y126.571 E.05236
N9866 G1 X158.45 Y142.471 E.52934
N9867 G1 X158.45 Y144.1 E.05236
N9868 M204 S10000
N9869 G1 X158.45 Y158.46 F60000
N9870 G1 F4421.739
N9871 M204 S8000
N9872 G1 X158.45 Y156.832 E.05236
N9873 G1 X191.55 Y147.963 E1.1019
N9874 G1 X191.55 Y149.959 E.06421
N9875 G1 X168.161 Y126.571 E1.06363
N9876 G1 X171.14 Y126.571 E.09579
N9877 G1 X158.45 Y173.928 E1.57656
N9878 G1 X158.45 Y173.689 E.00768
N9879 G1 X191.55 Y164.82 E1.1019
N9880 G1 X191.55 Y161.473 E.10763
N9881 G1 X158.45 Y128.374 E1.50523
N9882 G1 X158.45 Y131.545 E.10198
N9883 G1 X177.016 Y126.571 E.61806
N9884 G1 X178.644 Y126.571 E.05236
N9885 ; WIPE_START
N9886 G1 X177.016 Y126.571 E-.61876
N9887 G1 X176.657 Y126.667 E-.14124
N9888 ; WIPE_END
N9889 G1 E-.04 F1800
N9890 M204 S10000
N9891 G17
N9892 G3 Z7.8 I1.217 J0 P1  F60000
N9893 ; stop printing object, unique label id: 229
N9894 M625
N9895 ; object ids of layer 37 start: 229
N9896 M624 AQAAAAAAAAA=
N9897 ;======== H2D 20250527========
N9898 ; SKIPPABLE_START
N9899 ; SKIPTYPE: timelapse
N9900 M622.1 S1 ; for prev firware, default turned on
N9901 
N9902 M1002 judge_flag timelapse_record_flag
N9903 
N9904 M622 J1
N9905 M993 A2 B2 C2
N9906 M993 A0 B0 C0
N9907 
N9908 
N9909 
N9910 
N9911     M9711 M0 E1 X260 Y141 Z7.8 S11 C10 O0 T3000
N9912 
N9913 
N9914 
N9915 M993 A3 B3 C3
N9916 
N9917 M623
N9918 ; SKIPPABLE_END
N9919 
N9920 ; object ids of this layer37 end: 229
N9921 M625
N9922 ; CHANGE_LAYER
N9923 ; Z_HEIGHT: 7.6
N9924 ; LAYER_HEIGHT: 0.2
N9925 ;======== H2D 20250521========
N9926 ; layer num/total_layer_count: 38/63
N9927 ; update layer progress
N9928 M73 L38
N9929 M991 S0 P37 ;notify layer change
N9930 
N9931 
N9932 ; OBJECT_ID: 229
N9933 ; COOLING_NODE: 0
N9934 ; start printing object, unique label id: 229
N9935 M624 AQAAAAAAAAA=
N9936 G1 X191.898 Y201.453 F60000
N9937 G1 Z7.6
N9938 G1 E.8 F1800
N9939 ; FEATURE: Inner wall
N9940 ; LINE_WIDTH: 0.45
N9941 ; LAYER_HEIGHT: 0.2
N9942 G1 F4421.739
N9943 M204 S8000
N9944 G1 X158.102 Y201.453 E1.08675
N9945 G1 X158.102 Y126.222 E2.41914
N9946 G1 X191.898 Y126.222 E1.08675
N9947 G1 X191.898 Y201.393 E2.41721
N9948 ; COOLING_NODE: 0
N9949 M204 S10000
N9950 G1 X192.29 Y201.845 F60000
N9951 ; FEATURE: Outer wall
N9952 ; LINE_WIDTH: 0.42
N9953 G1 F4773.528
N9954 M204 S5000
N9955 G1 X157.71 Y201.845 E1.03002
N9956 G1 X157.71 Y125.83 E2.26421
N9957 G1 X192.29 Y125.83 E1.03002
N9958 G1 X192.29 Y201.785 E2.26243
N9959 ; WIPE_START
N9960 M204 S8000
N9961 G1 X190.29 Y201.788 E-.76
N9962 ; WIPE_END
N9963 G1 E-.04 F1800
N9964 M204 S10000
N9965 G1 X182.678 Y201.235 Z8 F60000
N9966 M73 P68 R15
N9967 G1 X180.88 Y201.104 Z8
N9968 G1 Z7.6
N9969 G1 E.8 F1800
N9970 ; FEATURE: Sparse infill
N9971 ; LINE_WIDTH: 0.45
N9972 G1 F4421.739
N9973 M204 S8000
N9974 G1 X182.508 Y201.104 E.05236
N9975 G1 X191.55 Y198.682 E.301
N9976 G1 X191.55 Y195.815 E.09218
N9977 G1 X158.45 Y162.716 E1.50523
N9978 G1 X158.45 Y165.407 E.08653
N9979 G1 X191.55 Y156.538 E1.1019
N9980 G1 X191.55 Y154.909 E.05236
N9981 M204 S10000
N9982 G1 X191.55 Y142.595 F60000
N9983 G1 F4421.739
N9984 M204 S8000
N9985 G1 X191.55 Y144.223 E.05236
N9986 G1 X176.308 Y201.104 E1.89362
N9987 G1 X173.811 Y201.104 E.0803
N9988 G1 X158.45 Y185.744 E.69855
N9989 G1 X158.45 Y182.264 E.11188
N9990 G1 X191.55 Y173.395 E1.1019
N9991 G1 X191.55 Y172.787 E.01956
N9992 G1 X158.45 Y139.688 E1.50523
N9993 G1 X158.45 Y140.12 E.01391
N9994 G1 X191.55 Y131.251 E1.1019
N9995 G1 X191.55 Y126.571 E.15052
N9996 G1 X187.851 Y126.571 E.11894
N9997 G1 X167.88 Y201.104 E2.48129
N9998 G1 X169.508 Y201.104 E.05236
N9999 M204 S10000
N10000 G1 X158.45 Y192.321 F60000
N10001 G1 F4421.739
N10002 M204 S8000
N10003 G1 X158.45 Y190.693 E.05236
N10004 G1 X191.55 Y181.824 E1.1019
N10005 G1 X191.55 Y184.301 E.07965
N10006 G1 X158.45 Y151.202 E1.50523
N10007 G1 X158.45 Y148.549 E.0853
N10008 G1 X191.55 Y139.68 E1.1019
N10009 G1 X191.55 Y138.245 E.04614
N10010 G1 X179.875 Y126.571 E.53092
N10011 G1 X179.422 Y126.571 E.01456
N10012 G1 X159.451 Y201.104 E2.48129
N10013 G1 X162.297 Y201.104 E.09153
N10014 G1 X158.45 Y197.258 E.17494
N10015 G1 X158.45 Y199.122 E.05995
N10016 G1 X191.55 Y190.253 E1.1019
N10017 G1 X191.55 Y188.625 E.05236
N10018 M204 S10000
N10019 G1 X191.55 Y174.051 F60000
N10020 G1 F4421.739
N10021 M204 S8000
N10022 G1 X191.55 Y175.68 E.05236
N10023 G1 X184.737 Y201.104 E.84641
N10024 G1 X185.325 Y201.104 E.01891
N10025 G1 X158.45 Y174.23 E1.22216
N10026 G1 X158.45 Y173.836 E.01267
N10027 G1 X191.55 Y164.967 E1.1019
N10028 G1 X191.55 Y161.273 E.11877
N10029 G1 X158.45 Y128.174 E1.50523
N10030 G1 X158.45 Y131.692 E.11312
N10031 G1 X177.562 Y126.571 E.63625
N10032 G1 X179.191 Y126.571 E.05236
N10033 M204 S10000
N10034 G1 X164.193 Y126.571 F60000
N10035 G1 F4421.739
N10036 M204 S8000
N10037 G1 X162.564 Y126.571 E.05236
N10038 G1 X158.45 Y141.925 E.51115
N10039 G1 X158.45 Y143.553 E.05236
N10040 M204 S10000
N10041 G1 X158.45 Y155.35 F60000
N10042 G1 F4421.739
N10043 M204 S8000
N10044 G1 X158.45 Y156.978 E.05236
N10045 G1 X191.55 Y148.109 E1.1019
N10046 G1 X191.55 Y149.759 E.05307
N10047 G1 X168.361 Y126.571 E1.05453
N10048 G1 X170.993 Y126.571 E.08465
N10049 G1 X158.45 Y173.381 E1.55837
N10050 G1 X158.45 Y173.632 E.00806
N10051 ; WIPE_START
N10052 G1 X158.45 Y173.381 E-.09521
N10053 G1 X158.903 Y171.692 E-.6648
N10054 ; WIPE_END
N10055 G1 E-.04 F1800
N10056 M204 S10000
N10057 G17
N10058 G3 Z8 I1.217 J0 P1  F60000
N10059 ; stop printing object, unique label id: 229
N10060 M625
N10061 ; object ids of layer 38 start: 229
N10062 M624 AQAAAAAAAAA=
N10063 ;======== H2D 20250527========
N10064 ; SKIPPABLE_START
N10065 ; SKIPTYPE: timelapse
N10066 M622.1 S1 ; for prev firware, default turned on
N10067 
N10068 M1002 judge_flag timelapse_record_flag
N10069 
N10070 M622 J1
N10071 M993 A2 B2 C2
N10072 M993 A0 B0 C0
N10073 
N10074 
N10075 
N10076 
N10077     M9711 M0 E1 X260 Y141 Z8 S11 C10 O0 T3000
N10078 
N10079 
N10080 
N10081 M993 A3 B3 C3
N10082 
N10083 M623
N10084 ; SKIPPABLE_END
N10085 
N10086 ; object ids of this layer38 end: 229
N10087 M625
N10088 ; CHANGE_LAYER
N10089 ; Z_HEIGHT: 7.8
N10090 ; LAYER_HEIGHT: 0.2
N10091 ;======== H2D 20250521========
N10092 ; layer num/total_layer_count: 39/63
N10093 ; update layer progress
N10094 M73 L39
N10095 M991 S0 P38 ;notify layer change
N10096 
N10097 
N10098 ; OBJECT_ID: 229
N10099 ; COOLING_NODE: 0
N10100 ; start printing object, unique label id: 229
N10101 M624 AQAAAAAAAAA=
N10102 G1 X191.898 Y201.453 F60000
N10103 G1 Z7.8
N10104 G1 E.8 F1800
N10105 ; FEATURE: Inner wall
N10106 ; LINE_WIDTH: 0.45
N10107 ; LAYER_HEIGHT: 0.2
N10108 G1 F4421.739
N10109 M204 S8000
N10110 G1 X158.102 Y201.453 E1.08675
N10111 G1 X158.102 Y126.222 E2.41914
N10112 G1 X191.898 Y126.222 E1.08675
N10113 G1 X191.898 Y201.393 E2.41721
N10114 ; COOLING_NODE: 0
N10115 M204 S10000
N10116 G1 X192.29 Y201.845 F60000
N10117 ; FEATURE: Outer wall
N10118 ; LINE_WIDTH: 0.42
N10119 G1 F4773.528
N10120 M204 S5000
N10121 G1 X157.71 Y201.845 E1.03002
N10122 G1 X157.71 Y125.83 E2.26421
N10123 G1 X192.29 Y125.83 E1.03002
N10124 G1 X192.29 Y201.785 E2.26243
N10125 ; WIPE_START
N10126 M204 S8000
N10127 G1 X190.29 Y201.788 E-.76
N10128 ; WIPE_END
N10129 G1 E-.04 F1800
N10130 M204 S10000
N10131 G1 X182.68 Y201.201 Z8.2 F60000
N10132 G1 X181.426 Y201.104 Z8.2
N10133 G1 Z7.8
N10134 G1 E.8 F1800
N10135 ; FEATURE: Sparse infill
N10136 ; LINE_WIDTH: 0.45
N10137 G1 F4421.739
N10138 M204 S8000
N10139 G1 X183.055 Y201.104 E.05236
N10140 G1 X191.55 Y198.828 E.28281
N10141 G1 X191.55 Y195.615 E.10332
N10142 G1 X158.45 Y162.516 E1.50523
N10143 G1 X158.45 Y165.553 E.09767
N10144 G1 X191.55 Y156.684 E1.1019
N10145 G1 X191.55 Y155.056 E.05236
N10146 M204 S10000
N10147 G1 X191.55 Y142.048 F60000
N10148 G1 F4421.739
N10149 M204 S8000
N10150 G1 X191.55 Y143.677 E.05236
N10151 G1 X176.162 Y201.104 E1.91181
N10152 G1 X174.011 Y201.104 E.06916
N10153 G1 X158.45 Y185.544 E.70764
N10154 G1 X158.45 Y182.411 E.10074
N10155 G1 X191.55 Y173.542 E1.1019
N10156 G1 X191.55 Y172.587 E.0307
N10157 G1 X158.45 Y139.488 E1.50523
N10158 G1 X158.45 Y137.86 E.05236
N10159 M204 S10000
N10160 G1 X158.45 Y140.267 F60000
N10161 G1 F4421.739
N10162 M204 S8000
N10163 G1 X191.55 Y131.398 E1.1019
N10164 G1 X191.55 Y126.571 E.15523
N10165 G1 X187.704 Y126.571 E.12365
N10166 G1 X167.733 Y201.104 E2.48129
N10167 G1 X169.361 Y201.104 E.05236
N10168 M204 S10000
N10169 G1 X158.45 Y192.468 F60000
N10170 G1 F4421.739
N10171 M204 S8000
N10172 G1 X158.45 Y190.84 E.05236
N10173 G1 X191.55 Y181.971 E1.1019
N10174 G1 X191.55 Y184.101 E.06851
N10175 G1 X158.45 Y151.002 E1.50523
N10176 G1 X158.45 Y148.696 E.07416
N10177 G1 X191.55 Y139.827 E1.1019
N10178 G1 X191.55 Y138.045 E.05728
N10179 G1 X180.075 Y126.571 E.52183
N10180 G1 X179.276 Y126.571 E.0257
N10181 G1 X159.304 Y201.104 E2.48129
N10182 G1 X162.497 Y201.104 E.10267
N10183 G1 X158.45 Y197.058 E.18404
N10184 G1 X158.45 Y199.268 E.07109
N10185 G1 X191.55 Y190.399 E1.1019
N10186 G1 X191.55 Y188.771 E.05236
N10187 M204 S10000
N10188 M73 P69 R15
N10189 G1 X191.55 Y173.745 F60000
N10190 G1 F4421.739
N10191 M204 S8000
N10192 G1 X191.55 Y175.133 E.04463
N10193 G1 X184.591 Y201.104 E.8646
N10194 G1 X185.525 Y201.104 E.03005
N10195 G1 X158.45 Y174.03 E1.23125
N10196 G1 X158.45 Y173.982 E.00153
N10197 G1 X191.55 Y165.113 E1.1019
N10198 G1 X191.55 Y161.073 E.1299
N10199 G1 X158.45 Y127.974 E1.50523
N10200 G1 X158.45 Y131.838 E.12426
N10201 G1 X178.109 Y126.571 E.65444
N10202 G1 X179.072 Y126.571 E.03098
N10203 M204 S10000
N10204 G1 X164.046 Y126.571 F60000
N10205 G1 F4421.739
N10206 M204 S8000
N10207 G1 X162.418 Y126.571 E.05236
N10208 G1 X158.45 Y141.378 E.49296
N10209 G1 X158.45 Y143.007 E.05236
N10210 M204 S10000
N10211 G1 X158.45 Y155.496 F60000
N10212 G1 F4421.739
N10213 M204 S8000
N10214 G1 X158.45 Y157.124 E.05236
N10215 G1 X191.55 Y148.255 E1.1019
N10216 G1 X191.55 Y149.559 E.04193
N10217 G1 X168.561 Y126.571 E1.04544
N10218 G1 X170.847 Y126.571 E.07351
N10219 G1 X158.45 Y172.835 E1.54018
N10220 G1 X158.45 Y173.778 E.03033
N10221 ; WIPE_START
N10222 G1 X158.45 Y172.835 E-.35847
N10223 G1 X158.724 Y171.814 E-.40153
N10224 ; WIPE_END
N10225 G1 E-.04 F1800
N10226 M204 S10000
N10227 G17
N10228 G3 Z8.2 I1.217 J0 P1  F60000
N10229 ; stop printing object, unique label id: 229
N10230 M625
N10231 ; object ids of layer 39 start: 229
N10232 M624 AQAAAAAAAAA=
N10233 ;======== H2D 20250527========
N10234 ; SKIPPABLE_START
N10235 ; SKIPTYPE: timelapse
N10236 M622.1 S1 ; for prev firware, default turned on
N10237 
N10238 M1002 judge_flag timelapse_record_flag
N10239 
N10240 M622 J1
N10241 M993 A2 B2 C2
N10242 M993 A0 B0 C0
N10243 
N10244 
N10245 
N10246 
N10247     M9711 M0 E1 X260 Y141 Z8.2 S11 C10 O0 T3000
N10248 
N10249 
N10250 
N10251 M993 A3 B3 C3
N10252 
N10253 M623
N10254 ; SKIPPABLE_END
N10255 
N10256 ; object ids of this layer39 end: 229
N10257 M625
N10258 ; CHANGE_LAYER
N10259 ; Z_HEIGHT: 8
N10260 ; LAYER_HEIGHT: 0.2
N10261 ;======== H2D 20250521========
N10262 ; layer num/total_layer_count: 40/63
N10263 ; update layer progress
N10264 M73 L40
N10265 M991 S0 P39 ;notify layer change
N10266 
N10267 
N10268 ; OBJECT_ID: 229
N10269 ; COOLING_NODE: 0
N10270 ; start printing object, unique label id: 229
N10271 M624 AQAAAAAAAAA=
N10272 G1 X191.898 Y201.453 F60000
N10273 G1 Z8
N10274 G1 E.8 F1800
N10275 ; FEATURE: Inner wall
N10276 ; LINE_WIDTH: 0.45
N10277 ; LAYER_HEIGHT: 0.2
N10278 G1 F4421.739
N10279 M204 S8000
N10280 G1 X158.102 Y201.453 E1.08675
N10281 G1 X158.102 Y126.222 E2.41914
N10282 G1 X191.898 Y126.222 E1.08675
N10283 G1 X191.898 Y201.393 E2.41721
N10284 ; COOLING_NODE: 0
N10285 M204 S10000
N10286 G1 X192.29 Y201.845 F60000
N10287 ; FEATURE: Outer wall
N10288 ; LINE_WIDTH: 0.42
N10289 G1 F4773.528
N10290 M204 S5000
N10291 G1 X157.71 Y201.845 E1.03002
N10292 G1 X157.71 Y125.83 E2.26421
N10293 G1 X192.29 Y125.83 E1.03002
N10294 G1 X192.29 Y201.785 E2.26243
N10295 ; WIPE_START
N10296 M204 S8000
N10297 G1 X190.29 Y201.788 E-.76
N10298 ; WIPE_END
N10299 M73 P69 R14
N10300 G1 E-.04 F1800
N10301 M204 S10000
N10302 G1 X187.353 Y201.104 Z8.4 F60000
N10303 G1 Z8
N10304 G1 E.8 F1800
N10305 ; FEATURE: Sparse infill
N10306 ; LINE_WIDTH: 0.45
N10307 G1 F4421.739
N10308 M204 S8000
N10309 G1 X185.725 Y201.104 E.05236
N10310 G1 X158.45 Y173.83 E1.24035
N10311 G1 X158.45 Y174.128 E.00961
N10312 G1 X191.55 Y165.259 E1.1019
N10313 G1 X191.55 Y172.387 E.2292
N10314 G1 X158.45 Y139.288 E1.50523
N10315 G1 X158.45 Y137.66 E.05236
N10316 M204 S10000
N10317 G1 X163.9 Y126.571 F60000
N10318 G1 F4421.739
N10319 M204 S8000
N10320 G1 X162.272 Y126.571 E.05236
N10321 G1 X158.45 Y140.832 E.47477
N10322 G1 X158.45 Y142.46 E.05236
N10323 M204 S10000
N10324 G1 X158.45 Y140.413 F60000
N10325 G1 F4421.739
N10326 M204 S8000
N10327 G1 X191.55 Y131.544 E1.1019
N10328 G1 X191.55 Y126.571 E.15994
N10329 G1 X187.558 Y126.571 E.12836
N10330 G1 X167.587 Y201.104 E2.48129
N10331 G1 X162.697 Y201.104 E.15723
N10332 G1 X158.45 Y196.858 E.19313
N10333 G1 X158.45 Y190.986 E.18881
N10334 G1 X191.55 Y182.117 E1.1019
N10335 G1 X191.55 Y183.901 E.05737
N10336 G1 X158.45 Y150.802 E1.50523
N10337 G1 X158.45 Y148.842 E.06302
N10338 G1 X191.55 Y139.973 E1.1019
N10339 G1 X191.55 Y137.845 E.06842
N10340 G1 X180.275 Y126.571 E.51273
N10341 G1 X181.903 Y126.571 E.05236
N10342 M204 S10000
N10343 G1 X191.55 Y141.502 F60000
N10344 G1 F4421.739
N10345 M204 S8000
N10346 G1 X191.55 Y143.13 E.05236
N10347 G1 X176.016 Y201.104 E1.93
N10348 G1 X174.211 Y201.104 E.05802
N10349 G1 X158.45 Y185.344 E.71674
N10350 G1 X158.45 Y182.557 E.0896
N10351 G1 X191.55 Y173.688 E1.1019
N10352 G1 X191.55 Y174.587 E.0289
N10353 G1 X184.444 Y201.104 E.88279
N10354 M204 S10000
N10355 G1 X181.973 Y201.104 F60000
N10356 G1 F4421.739
N10357 M204 S8000
N10358 G1 X183.601 Y201.104 E.05236
N10359 G1 X191.55 Y198.975 E.26462
N10360 G1 X191.55 Y195.415 E.11446
N10361 G1 X158.45 Y162.316 E1.50523
N10362 G1 X158.45 Y165.7 E.10881
N10363 G1 X191.55 Y156.831 E1.1019
N10364 G1 X191.55 Y160.873 E.13
N10365 G1 X158.45 Y127.774 E1.50523
N10366 G1 X158.45 Y131.984 E.1354
N10367 G1 X178.655 Y126.571 E.67263
N10368 G1 X179.129 Y126.571 E.01525
N10369 G1 X159.158 Y201.104 E2.48129
N10370 G1 X158.45 Y201.104 E.02275
N10371 G1 X158.45 Y199.415 E.05433
N10372 G1 X191.55 Y190.546 E1.1019
N10373 G1 X191.55 Y188.917 E.05236
N10374 M204 S10000
N10375 G1 X158.45 Y173.626 F60000
N10376 G1 F4421.739
N10377 M204 S8000
N10378 G1 X158.45 Y172.289 E.04301
N10379 G1 X170.7 Y126.571 E1.52199
N10380 G1 X168.761 Y126.571 E.06237
N10381 G1 X191.55 Y149.359 E1.03634
N10382 G1 X191.55 Y148.402 E.03079
N10383 G1 X158.45 Y157.271 E1.1019
N10384 G1 X158.45 Y155.642 E.05236
N10385 ; WIPE_START
N10386 G1 X158.45 Y157.271 E-.61876
N10387 G1 X158.809 Y157.175 E-.14124
N10388 ; WIPE_END
N10389 G1 E-.04 F1800
N10390 M204 S10000
N10391 G17
N10392 G3 Z8.4 I1.217 J0 P1  F60000
N10393 ; stop printing object, unique label id: 229
N10394 M625
N10395 ; object ids of layer 40 start: 229
N10396 M624 AQAAAAAAAAA=
N10397 ;======== H2D 20250527========
N10398 ; SKIPPABLE_START
N10399 ; SKIPTYPE: timelapse
N10400 M622.1 S1 ; for prev firware, default turned on
N10401 
N10402 M1002 judge_flag timelapse_record_flag
N10403 
N10404 M622 J1
N10405 M993 A2 B2 C2
N10406 M993 A0 B0 C0
N10407 
N10408 
N10409 
N10410 
N10411     M9711 M0 E1 X260 Y141 Z8.4 S11 C10 O0 T3000
N10412 
N10413 
N10414 
N10415 M993 A3 B3 C3
N10416 
N10417 M623
N10418 ; SKIPPABLE_END
N10419 
N10420 ; object ids of this layer40 end: 229
N10421 M625
N10422 ; CHANGE_LAYER
N10423 ; Z_HEIGHT: 8.2
N10424 ; LAYER_HEIGHT: 0.2
N10425 ;======== H2D 20250521========
N10426 ; layer num/total_layer_count: 41/63
N10427 ; update layer progress
N10428 M73 L41
N10429 M991 S0 P40 ;notify layer change
N10430 
N10431 
N10432 ; OBJECT_ID: 229
N10433 ; COOLING_NODE: 0
N10434 ; start printing object, unique label id: 229
N10435 M624 AQAAAAAAAAA=
N10436 G1 X191.898 Y201.453 F60000
N10437 G1 Z8.2
N10438 G1 E.8 F1800
N10439 ; FEATURE: Inner wall
N10440 ; LINE_WIDTH: 0.45
N10441 ; LAYER_HEIGHT: 0.2
N10442 G1 F4421.739
N10443 M204 S8000
N10444 G1 X158.102 Y201.453 E1.08675
N10445 G1 X158.102 Y126.222 E2.41914
N10446 G1 X191.898 Y126.222 E1.08675
N10447 G1 X191.898 Y201.393 E2.41721
N10448 ; COOLING_NODE: 0
N10449 M204 S10000
N10450 G1 X192.29 Y201.845 F60000
N10451 ; FEATURE: Outer wall
N10452 ; LINE_WIDTH: 0.42
N10453 G1 F4773.528
N10454 M204 S5000
N10455 G1 X157.71 Y201.845 E1.03002
N10456 G1 X157.71 Y125.83 E2.26421
N10457 G1 X192.29 Y125.83 E1.03002
N10458 G1 X192.29 Y201.785 E2.26243
N10459 ; WIPE_START
N10460 M204 S8000
N10461 M73 P70 R14
N10462 G1 X190.29 Y201.788 E-.76
N10463 ; WIPE_END
N10464 G1 E-.04 F1800
N10465 M204 S10000
N10466 G1 X187.553 Y201.104 Z8.6 F60000
N10467 G1 Z8.2
N10468 G1 E.8 F1800
N10469 ; FEATURE: Sparse infill
N10470 ; LINE_WIDTH: 0.45
N10471 G1 F4421.739
N10472 M204 S8000
N10473 G1 X185.925 Y201.104 E.05236
N10474 G1 X158.45 Y173.63 E1.24944
N10475 G1 X158.45 Y174.275 E.02074
N10476 G1 X191.55 Y165.406 E1.1019
N10477 G1 X191.55 Y172.187 E.21806
N10478 G1 X158.45 Y139.088 E1.50523
N10479 M204 S10000
N10480 G1 X163.754 Y126.571 F60000
N10481 G1 F4421.739
N10482 M204 S8000
N10483 G1 X162.125 Y126.571 E.05236
N10484 G1 X158.45 Y140.286 E.45658
N10485 G1 X158.45 Y140.56 E.00881
N10486 G1 X191.55 Y131.691 E1.1019
N10487 G1 X191.55 Y137.645 E.19148
N10488 G1 X180.475 Y126.571 E.50364
N10489 G1 X187.412 Y126.571 E.22306
N10490 G1 X167.44 Y201.104 E2.48129
N10491 G1 X162.897 Y201.104 E.14609
N10492 G1 X158.45 Y196.658 E.20223
N10493 G1 X158.45 Y191.132 E.17767
N10494 G1 X191.55 Y182.263 E1.1019
N10495 G1 X191.55 Y183.701 E.04623
N10496 G1 X158.45 Y150.602 E1.50523
N10497 G1 X158.45 Y148.988 E.05188
N10498 G1 X191.55 Y140.119 E1.1019
N10499 G1 X191.55 Y142.584 E.07925
N10500 G1 X175.869 Y201.104 E1.94819
N10501 G1 X174.411 Y201.104 E.04688
N10502 G1 X158.45 Y185.144 E.72583
N10503 G1 X158.45 Y182.704 E.07846
N10504 G1 X191.55 Y173.835 E1.1019
N10505 G1 X191.55 Y174.041 E.00662
N10506 G1 X184.298 Y201.104 E.90098
N10507 G1 X184.147 Y201.104 E.00484
N10508 G1 X191.55 Y199.121 E.24643
N10509 G1 X191.55 Y195.215 E.1256
N10510 G1 X158.45 Y162.116 E1.50523
N10511 G1 X158.45 Y165.846 E.11995
N10512 G1 X191.55 Y156.977 E1.1019
N10513 G1 X191.55 Y160.673 E.11886
N10514 G1 X158.45 Y127.574 E1.50523
N10515 G1 X158.45 Y132.131 E.14653
N10516 G1 X179.202 Y126.571 E.69082
N10517 G1 X178.983 Y126.571 E.00703
N10518 G1 X159.012 Y201.104 E2.48129
N10519 G1 X158.45 Y201.104 E.01805
N10520 G1 X158.45 Y199.561 E.04963
N10521 G1 X191.55 Y190.692 E1.1019
N10522 G1 X191.55 Y189.064 E.05236
N10523 M204 S10000
N10524 G1 X158.45 Y173.371 F60000
N10525 G1 F4421.739
N10526 M204 S8000
N10527 G1 X158.45 Y171.742 E.05236
N10528 G1 X170.554 Y126.571 E1.5038
N10529 G1 X168.961 Y126.571 E.05123
N10530 G1 X191.55 Y149.159 E1.02724
N10531 G1 X191.55 Y148.548 E.01965
N10532 G1 X158.45 Y157.417 E1.1019
N10533 G1 X158.45 Y155.789 E.05236
N10534 ; WIPE_START
N10535 G1 X158.45 Y157.417 E-.61876
N10536 G1 X158.809 Y157.321 E-.14124
N10537 ; WIPE_END
N10538 G1 E-.04 F1800
N10539 M204 S10000
N10540 G17
N10541 G3 Z8.6 I1.217 J0 P1  F60000
N10542 ; stop printing object, unique label id: 229
N10543 M625
N10544 ; object ids of layer 41 start: 229
N10545 M624 AQAAAAAAAAA=
N10546 ;======== H2D 20250527========
N10547 ; SKIPPABLE_START
N10548 ; SKIPTYPE: timelapse
N10549 M622.1 S1 ; for prev firware, default turned on
N10550 
N10551 M1002 judge_flag timelapse_record_flag
N10552 
N10553 M622 J1
N10554 M993 A2 B2 C2
N10555 M993 A0 B0 C0
N10556 
N10557 
N10558 
N10559 
N10560     M9711 M0 E1 X260 Y141 Z8.6 S11 C10 O0 T3000
N10561 
N10562 
N10563 
N10564 M993 A3 B3 C3
N10565 
N10566 M623
N10567 ; SKIPPABLE_END
N10568 
N10569 ; object ids of this layer41 end: 229
N10570 M625
N10571 ; CHANGE_LAYER
N10572 ; Z_HEIGHT: 8.4
N10573 ; LAYER_HEIGHT: 0.2
N10574 ;======== H2D 20250521========
N10575 ; layer num/total_layer_count: 42/63
N10576 ; update layer progress
N10577 M73 L42
N10578 M991 S0 P41 ;notify layer change
N10579 
N10580 
N10581 ; OBJECT_ID: 229
N10582 ; COOLING_NODE: 0
N10583 ; start printing object, unique label id: 229
N10584 M624 AQAAAAAAAAA=
N10585 G1 X191.898 Y201.453 F60000
N10586 G1 Z8.4
N10587 G1 E.8 F1800
N10588 ; FEATURE: Inner wall
N10589 ; LINE_WIDTH: 0.45
N10590 ; LAYER_HEIGHT: 0.2
N10591 G1 F4421.739
N10592 M204 S8000
N10593 G1 X158.102 Y201.453 E1.08675
N10594 G1 X158.102 Y126.222 E2.41914
N10595 G1 X191.898 Y126.222 E1.08675
N10596 G1 X191.898 Y201.393 E2.41721
N10597 ; COOLING_NODE: 0
N10598 M204 S10000
N10599 G1 X192.29 Y201.845 F60000
N10600 ; FEATURE: Outer wall
N10601 ; LINE_WIDTH: 0.42
N10602 G1 F4773.528
N10603 M204 S5000
N10604 G1 X157.71 Y201.845 E1.03002
N10605 G1 X157.71 Y125.83 E2.26421
N10606 G1 X192.29 Y125.83 E1.03002
N10607 G1 X192.29 Y201.785 E2.26243
N10608 ; WIPE_START
N10609 M204 S8000
N10610 G1 X190.29 Y201.788 E-.76
N10611 ; WIPE_END
N10612 G1 E-.04 F1800
N10613 M204 S10000
N10614 G1 X190.635 Y194.164 Z8.8 F60000
N10615 G1 X191.55 Y173.981 Z8.8
N10616 G1 Z8.4
N10617 G1 E.8 F1800
N10618 ; FEATURE: Sparse infill
N10619 ; LINE_WIDTH: 0.45
N10620 G1 F4421.739
N10621 M204 S8000
N10622 G1 X158.45 Y182.85 E1.1019
N10623 G1 X158.45 Y184.944 E.06732
N10624 G1 X174.611 Y201.104 E.73493
N10625 G1 X175.723 Y201.104 E.03574
N10626 G1 X191.55 Y142.037 E1.96638
N10627 G1 X191.55 Y140.266 E.05697
N10628 G1 X158.45 Y149.135 E1.1019
N10629 G1 X158.45 Y150.402 E.04074
N10630 G1 X191.55 Y183.501 E1.50523
N10631 G1 X191.55 Y182.41 E.03509
N10632 G1 X158.45 Y191.279 E1.1019
N10633 G1 X158.45 Y196.458 E.16653
N10634 G1 X163.097 Y201.104 E.21132
N10635 G1 X167.294 Y201.104 E.13495
N10636 G1 X187.265 Y126.571 E2.48129
N10637 G1 X188.894 Y126.571 E.05236
N10638 M204 S10000
N10639 G1 X178.836 Y126.571 F60000
N10640 G1 F4421.739
N10641 M204 S8000
N10642 G1 X158.865 Y201.104 E2.48129
N10643 G1 X158.45 Y201.104 E.01334
N10644 G1 X158.45 Y199.708 E.04492
N10645 G1 X191.55 Y190.839 E1.1019
N10646 G1 X191.55 Y195.015 E.1343
N10647 G1 X158.45 Y161.916 E1.50523
N10648 G1 X158.45 Y165.992 E.13109
N10649 G1 X191.55 Y157.123 E1.1019
N10650 G1 X191.55 Y160.473 E.10772
N10651 M73 P71 R14
N10652 G1 X158.45 Y127.374 E1.50523
N10653 G1 X158.45 Y126.571 E.02583
N10654 G1 X161.979 Y126.571 E.11346
N10655 G1 X158.45 Y139.739 E.43839
N10656 G1 X158.45 Y140.706 E.03109
N10657 G1 X191.55 Y131.837 E1.1019
N10658 G1 X191.55 Y137.445 E.18034
N10659 G1 X180.675 Y126.571 E.49454
N10660 G1 X179.748 Y126.571 E.02981
N10661 G1 X158.45 Y132.277 E.70901
N10662 G1 X158.45 Y133.906 E.05236
N10663 M204 S10000
N10664 G1 X158.45 Y138.888 F60000
N10665 G1 F4421.739
N10666 M204 S8000
N10667 G1 X191.55 Y171.987 E1.50523
N10668 G1 X191.55 Y173.494 E.04846
N10669 G1 X184.152 Y201.104 E.91917
N10670 G1 X184.694 Y201.104 E.01744
N10671 G1 X191.55 Y199.267 E.22824
N10672 G1 X191.55 Y201.104 E.05907
N10673 G1 X186.125 Y201.104 E.17444
N10674 G1 X158.45 Y173.43 E1.25854
N10675 G1 X158.45 Y174.421 E.03188
N10676 G1 X191.55 Y165.552 E1.1019
N10677 G1 X191.55 Y167.181 E.05236
N10678 M204 S10000
N10679 G1 X158.45 Y172.824 F60000
N10680 G1 F4421.739
N10681 M204 S8000
N10682 G1 X158.45 Y171.196 E.05236
N10683 G1 X170.408 Y126.571 E1.48561
N10684 G1 X169.161 Y126.571 E.04009
N10685 G1 X191.55 Y148.959 E1.01815
N10686 G1 X191.55 Y148.695 E.00851
N10687 G1 X158.45 Y157.564 E1.1019
N10688 G1 X158.45 Y155.935 E.05236
N10689 ; WIPE_START
N10690 G1 X158.45 Y157.564 E-.61876
N10691 G1 X158.809 Y157.467 E-.14124
N10692 ; WIPE_END
N10693 G1 E-.04 F1800
N10694 M204 S10000
N10695 G17
N10696 G3 Z8.8 I1.217 J0 P1  F60000
N10697 ; stop printing object, unique label id: 229
N10698 M625
N10699 ; object ids of layer 42 start: 229
N10700 M624 AQAAAAAAAAA=
N10701 ;======== H2D 20250527========
N10702 ; SKIPPABLE_START
N10703 ; SKIPTYPE: timelapse
N10704 M622.1 S1 ; for prev firware, default turned on
N10705 
N10706 M1002 judge_flag timelapse_record_flag
N10707 
N10708 M622 J1
N10709 M993 A2 B2 C2
N10710 M993 A0 B0 C0
N10711 
N10712 
N10713 
N10714 
N10715     M9711 M0 E1 X260 Y141 Z8.8 S11 C10 O0 T3000
N10716 
N10717 
N10718 
N10719 M993 A3 B3 C3
N10720 
N10721 M623
N10722 ; SKIPPABLE_END
N10723 
N10724 ; object ids of this layer42 end: 229
N10725 M625
N10726 ; CHANGE_LAYER
N10727 ; Z_HEIGHT: 8.6
N10728 ; LAYER_HEIGHT: 0.200001
N10729 ;======== H2D 20250521========
N10730 ; layer num/total_layer_count: 43/63
N10731 ; update layer progress
N10732 M73 L43
N10733 M991 S0 P42 ;notify layer change
N10734 
N10735 
N10736 M106 S71.4
N10737 ; OBJECT_ID: 229
N10738 ; COOLING_NODE: 0
N10739 ; start printing object, unique label id: 229
N10740 M624 AQAAAAAAAAA=
N10741 G1 X191.898 Y201.453 F60000
N10742 G1 Z8.6
N10743 G1 E.8 F1800
N10744 ; FEATURE: Inner wall
N10745 ; LINE_WIDTH: 0.45
N10746 ; LAYER_HEIGHT: 0.2
N10747 G1 F4421.739
N10748 M204 S8000
N10749 G1 X158.102 Y201.453 E1.08675
N10750 G1 X158.102 Y126.222 E2.41914
N10751 G1 X191.898 Y126.222 E1.08675
N10752 G1 X191.898 Y201.393 E2.41721
N10753 ; COOLING_NODE: 0
N10754 M204 S10000
N10755 G1 X192.29 Y201.845 F60000
N10756 ; FEATURE: Outer wall
N10757 ; LINE_WIDTH: 0.42
N10758 G1 F4773.528
N10759 M204 S5000
N10760 G1 X157.71 Y201.845 E1.03002
N10761 G1 X157.71 Y125.83 E2.26421
N10762 G1 X192.29 Y125.83 E1.03002
N10763 G1 X192.29 Y201.785 E2.26243
N10764 ; WIPE_START
N10765 M204 S8000
N10766 G1 X190.29 Y201.788 E-.76
N10767 ; WIPE_END
N10768 M73 P71 R13
N10769 G1 E-.04 F1800
N10770 M204 S10000
N10771 G1 X191.55 Y201.042 Z9 F60000
N10772 G1 Z8.6
N10773 G1 E.8 F1800
N10774 ; FEATURE: Sparse infill
N10775 ; LINE_WIDTH: 0.45
N10776 G1 F4421.739
N10777 M204 S8000
N10778 G1 X191.55 Y199.414 E.05236
N10779 G1 X185.24 Y201.104 E.21005
N10780 G1 X184.005 Y201.104 E.03972
N10781 G1 X191.55 Y172.948 E.93736
N10782 G1 X191.55 Y171.787 E.03732
N10783 G1 X158.45 Y138.688 E1.50523
N10784 M204 S10000
N10785 G1 X158.45 Y134.052 F60000
N10786 G1 F4421.739
N10787 M204 S8000
N10788 G1 X158.45 Y132.424 E.05236
N10789 G1 X180.294 Y126.571 E.7272
N10790 G1 X180.875 Y126.571 E.01867
N10791 G1 X191.55 Y137.245 E.48545
N10792 G1 X191.55 Y131.983 E.1692
N10793 G1 X158.45 Y140.852 E1.1019
N10794 G1 X158.45 Y139.193 E.05337
N10795 G1 X161.832 Y126.571 E.4202
N10796 G1 X158.45 Y126.571 E.10876
N10797 G1 X158.45 Y127.174 E.0194
N10798 G1 X191.55 Y160.273 E1.50523
N10799 G1 X191.55 Y157.27 E.09658
N10800 G1 X158.45 Y166.139 E1.1019
N10801 G1 X158.45 Y164.51 E.05236
N10802 M204 S10000
N10803 G1 X158.45 Y172.278 F60000
N10804 G1 F4421.739
N10805 M204 S8000
N10806 G1 X158.45 Y170.649 E.05236
N10807 G1 X170.261 Y126.571 E1.46742
N10808 G1 X169.361 Y126.571 E.02895
N10809 G1 X191.55 Y148.759 E1.00905
N10810 G1 X191.55 Y148.841 E.00263
N10811 G1 X158.45 Y157.71 E1.1019
N10812 G1 X158.45 Y161.716 E.12881
N10813 G1 X191.55 Y194.815 E1.50523
N10814 G1 X191.55 Y190.985 E.12316
N10815 G1 X158.45 Y199.854 E1.1019
N10816 G1 X158.45 Y201.104 E.04021
N10817 G1 X158.719 Y201.104 E.00863
N10818 G1 X178.69 Y126.571 E2.48129
N10819 G1 X177.062 Y126.571 E.05236
N10820 M204 S10000
N10821 G1 X188.747 Y126.571 F60000
N10822 G1 F4421.739
N10823 M204 S8000
N10824 G1 X187.119 Y126.571 E.05236
N10825 G1 X167.148 Y201.104 E2.48129
N10826 G1 X163.297 Y201.104 E.12381
N10827 G1 X158.45 Y196.258 E.22042
N10828 G1 X158.45 Y191.425 E.15539
N10829 G1 X191.55 Y182.556 E1.1019
N10830 G1 X191.55 Y183.301 E.02395
N10831 G1 X158.45 Y150.202 E1.50523
N10832 G1 X158.45 Y149.281 E.0296
N10833 G1 X191.55 Y140.412 E1.1019
N10834 G1 X191.55 Y141.491 E.03469
N10835 G1 X175.576 Y201.104 E1.98457
N10836 G1 X174.811 Y201.104 E.0246
N10837 G1 X158.45 Y184.744 E.74402
N10838 G1 X158.45 Y182.996 E.05618
N10839 G1 X191.55 Y174.127 E1.1019
N10840 M204 S10000
N10841 G1 X191.55 Y167.327 F60000
N10842 G1 F4421.739
N10843 M204 S8000
N10844 G1 X191.55 Y165.699 E.05236
N10845 G1 X158.45 Y174.568 E1.1019
N10846 G1 X158.45 Y173.23 E.04302
N10847 G1 X186.325 Y201.104 E1.26763
N10848 ; WIPE_START
N10849 G1 X184.911 Y199.69 E-.76
N10850 ; WIPE_END
N10851 G1 E-.04 F1800
N10852 M204 S10000
N10853 G17
N10854 G3 Z9 I1.217 J0 P1  F60000
N10855 ; stop printing object, unique label id: 229
N10856 M625
N10857 ; object ids of layer 43 start: 229
N10858 M624 AQAAAAAAAAA=
N10859 ;======== H2D 20250527========
N10860 ; SKIPPABLE_START
N10861 ; SKIPTYPE: timelapse
N10862 M622.1 S1 ; for prev firware, default turned on
N10863 
N10864 M1002 judge_flag timelapse_record_flag
N10865 
N10866 M622 J1
N10867 M993 A2 B2 C2
N10868 M993 A0 B0 C0
N10869 
N10870 
N10871 
N10872 
N10873     M9711 M0 E1 X260 Y141 Z9 S11 C10 O0 T3000
N10874 
N10875 
N10876 
N10877 M993 A3 B3 C3
N10878 
N10879 M623
N10880 ; SKIPPABLE_END
N10881 
N10882 ; object ids of this layer43 end: 229
N10883 M625
N10884 ; CHANGE_LAYER
N10885 ; Z_HEIGHT: 8.8
N10886 ; LAYER_HEIGHT: 0.2
N10887 ;======== H2D 20250521========
N10888 ; layer num/total_layer_count: 44/63
N10889 ; update layer progress
N10890 M73 L44
N10891 M991 S0 P43 ;notify layer change
N10892 
N10893 
N10894 ; OBJECT_ID: 229
N10895 ; COOLING_NODE: 0
N10896 ; start printing object, unique label id: 229
N10897 M624 AQAAAAAAAAA=
N10898 G1 X191.898 Y201.453 F60000
N10899 G1 Z8.8
N10900 G1 E.8 F1800
N10901 ; FEATURE: Inner wall
N10902 ; LINE_WIDTH: 0.45
N10903 ; LAYER_HEIGHT: 0.2
N10904 G1 F4421.739
N10905 M204 S8000
N10906 G1 X158.102 Y201.453 E1.08675
N10907 G1 X158.102 Y126.222 E2.41914
N10908 G1 X191.898 Y126.222 E1.08675
N10909 G1 X191.898 Y201.393 E2.41721
N10910 ; COOLING_NODE: 0
N10911 M204 S10000
N10912 G1 X192.29 Y201.845 F60000
N10913 ; FEATURE: Outer wall
N10914 ; LINE_WIDTH: 0.42
N10915 G1 F4773.528
N10916 M204 S5000
N10917 M73 P72 R13
N10918 G1 X157.71 Y201.845 E1.03002
N10919 G1 X157.71 Y125.83 E2.26421
N10920 G1 X192.29 Y125.83 E1.03002
N10921 G1 X192.29 Y201.785 E2.26243
N10922 ; WIPE_START
N10923 M204 S8000
N10924 G1 X190.29 Y201.788 E-.76
N10925 ; WIPE_END
N10926 G1 E-.04 F1800
N10927 M204 S10000
N10928 G1 X191.466 Y201.104 Z9.2 F60000
N10929 G1 Z8.8
N10930 G1 E.8 F1800
N10931 ; FEATURE: Sparse infill
N10932 ; LINE_WIDTH: 0.45
N10933 G1 F4421.739
N10934 M204 S8000
N10935 G1 X191.55 Y201.104 E.0027
N10936 G1 X191.55 Y199.56 E.04966
N10937 G1 X185.787 Y201.104 E.19186
N10938 G1 X183.859 Y201.104 E.06199
N10939 G1 X191.55 Y172.401 E.95555
N10940 G1 X191.55 Y171.587 E.02618
N10941 G1 X158.45 Y138.488 E1.50523
N10942 G1 X158.45 Y138.646 E.0051
N10943 G1 X161.686 Y126.571 E.40201
N10944 G1 X158.45 Y126.571 E.10405
N10945 G1 X158.45 Y126.974 E.01297
N10946 G1 X191.55 Y160.073 E1.50523
N10947 G1 X191.55 Y157.416 E.08544
N10948 G1 X158.45 Y166.285 E1.1019
N10949 G1 X158.45 Y164.657 E.05236
N10950 M204 S10000
N10951 G1 X158.45 Y171.731 F60000
N10952 G1 F4421.739
N10953 M204 S8000
N10954 G1 X158.45 Y170.103 E.05236
N10955 G1 X170.115 Y126.571 E1.44923
N10956 G1 X169.561 Y126.571 E.01781
N10957 G1 X191.55 Y148.559 E.99996
N10958 G1 X191.55 Y148.987 E.01377
N10959 G1 X158.45 Y157.856 E1.1019
N10960 G1 X158.45 Y161.516 E.11767
N10961 G1 X191.55 Y194.615 E1.50523
N10962 G1 X191.55 Y191.131 E.11202
N10963 G1 X158.45 Y200 E1.1019
N10964 G1 X158.45 Y196.058 E.12679
N10965 G1 X163.497 Y201.104 E.22951
N10966 G1 X167.001 Y201.104 E.11267
N10967 G1 X186.972 Y126.571 E2.48129
N10968 G1 X188.601 Y126.571 E.05236
N10969 M204 S10000
N10970 G1 X176.915 Y126.571 F60000
N10971 G1 F4421.739
N10972 M204 S8000
N10973 G1 X178.544 Y126.571 E.05236
N10974 G1 X158.572 Y201.104 E2.48129
N10975 G1 X160.201 Y201.104 E.05236
N10976 M204 S10000
N10977 G1 X158.45 Y189.943 F60000
N10978 G1 F4421.739
N10979 M204 S8000
N10980 G1 X158.45 Y191.572 E.05236
N10981 G1 X191.55 Y182.703 E1.1019
N10982 G1 X191.55 Y183.101 E.01281
N10983 G1 X158.45 Y150.002 E1.50523
N10984 G1 X158.45 Y149.428 E.01846
N10985 G1 X191.55 Y140.559 E1.1019
N10986 G1 X191.55 Y140.945 E.01241
N10987 G1 X175.43 Y201.104 E2.00276
N10988 G1 X175.011 Y201.104 E.01347
N10989 G1 X158.45 Y184.544 E.75312
N10990 G1 X158.45 Y183.143 E.04505
N10991 G1 X191.55 Y174.274 E1.1019
N10992 G1 X191.55 Y175.902 E.05236
N10993 M204 S10000
N10994 G1 X191.55 Y164.217 F60000
N10995 G1 F4421.739
N10996 M204 S8000
N10997 G1 X191.55 Y165.845 E.05236
N10998 G1 X158.45 Y174.714 E1.1019
N10999 G1 X158.45 Y173.03 E.05416
N11000 G1 X186.525 Y201.104 E1.27673
N11001 M204 S10000
N11002 G1 X158.45 Y142.627 F60000
N11003 G1 F4421.739
N11004 M204 S8000
N11005 G1 X158.45 Y140.999 E.05236
N11006 G1 X191.55 Y132.13 E1.1019
N11007 G1 X191.55 Y137.045 E.15806
N11008 G1 X181.075 Y126.571 E.47635
N11009 G1 X180.841 Y126.571 E.00753
N11010 G1 X158.45 Y132.57 E.74539
N11011 G1 X158.45 Y130.942 E.05236
N11012 ; WIPE_START
N11013 G1 X158.45 Y132.57 E-.61876
N11014 G1 X158.809 Y132.474 E-.14124
N11015 ; WIPE_END
N11016 G1 E-.04 F1800
N11017 M204 S10000
N11018 G17
N11019 G3 Z9.2 I1.217 J0 P1  F60000
N11020 ; stop printing object, unique label id: 229
N11021 M625
N11022 ; object ids of layer 44 start: 229
N11023 M624 AQAAAAAAAAA=
N11024 ;======== H2D 20250527========
N11025 ; SKIPPABLE_START
N11026 ; SKIPTYPE: timelapse
N11027 M622.1 S1 ; for prev firware, default turned on
N11028 
N11029 M1002 judge_flag timelapse_record_flag
N11030 
N11031 M622 J1
N11032 M993 A2 B2 C2
N11033 M993 A0 B0 C0
N11034 
N11035 
N11036 
N11037 
N11038     M9711 M0 E1 X260 Y141 Z9.2 S11 C10 O0 T3000
N11039 
N11040 
N11041 
N11042 M993 A3 B3 C3
N11043 
N11044 M623
N11045 ; SKIPPABLE_END
N11046 
N11047 ; object ids of this layer44 end: 229
N11048 M625
N11049 ; CHANGE_LAYER
N11050 ; Z_HEIGHT: 9
N11051 ; LAYER_HEIGHT: 0.2
N11052 ;======== H2D 20250521========
N11053 ; layer num/total_layer_count: 45/63
N11054 ; update layer progress
N11055 M73 L45
N11056 M991 S0 P44 ;notify layer change
N11057 
N11058 
N11059 ; OBJECT_ID: 229
N11060 ; COOLING_NODE: 0
N11061 ; start printing object, unique label id: 229
N11062 M624 AQAAAAAAAAA=
N11063 G1 X191.898 Y201.453 F60000
N11064 G1 Z9
N11065 G1 E.8 F1800
N11066 ; FEATURE: Inner wall
N11067 ; LINE_WIDTH: 0.45
N11068 ; LAYER_HEIGHT: 0.2
N11069 G1 F4421.739
N11070 M204 S8000
N11071 G1 X158.102 Y201.453 E1.08675
N11072 G1 X158.102 Y126.222 E2.41914
N11073 G1 X191.898 Y126.222 E1.08675
N11074 G1 X191.898 Y201.393 E2.41721
N11075 ; COOLING_NODE: 0
N11076 M204 S10000
N11077 G1 X192.29 Y201.845 F60000
N11078 ; FEATURE: Outer wall
N11079 ; LINE_WIDTH: 0.42
N11080 G1 F4773.528
N11081 M204 S5000
N11082 G1 X157.71 Y201.845 E1.03002
N11083 G1 X157.71 Y125.83 E2.26421
N11084 G1 X192.29 Y125.83 E1.03002
N11085 G1 X192.29 Y201.785 E2.26243
N11086 ; WIPE_START
N11087 M204 S8000
N11088 G1 X190.29 Y201.788 E-.76
N11089 ; WIPE_END
N11090 G1 E-.04 F1800
N11091 M204 S10000
N11092 G1 X191.319 Y201.104 Z9.4 F60000
N11093 G1 Z9
N11094 G1 E.8 F1800
N11095 ; FEATURE: Sparse infill
N11096 ; LINE_WIDTH: 0.45
N11097 G1 F4421.739
N11098 M204 S8000
N11099 G1 X191.55 Y201.104 E.00741
N11100 G1 X191.55 Y199.707 E.04495
N11101 G1 X186.333 Y201.104 E.17367
N11102 G1 X186.725 Y201.104 E.01261
N11103 G1 X158.45 Y172.83 E1.28582
N11104 G1 X158.45 Y174.86 E.0653
N11105 G1 X191.55 Y165.991 E1.1019
N11106 G1 X191.55 Y164.363 E.05236
N11107 M204 S10000
N11108 G1 X191.55 Y176.049 F60000
N11109 G1 F4421.739
N11110 M204 S8000
N11111 G1 X191.55 Y174.42 E.05236
N11112 G1 X158.45 Y183.289 E1.1019
N11113 G1 X158.45 Y184.344 E.03391
N11114 G1 X175.211 Y201.104 E.76222
N11115 G1 X175.283 Y201.104 E.00233
N11116 G1 X191.55 Y140.398 E2.02096
N11117 G1 X191.55 Y140.705 E.00987
N11118 G1 X158.45 Y149.574 E1.1019
N11119 G1 X158.45 Y149.802 E.00732
N11120 G1 X191.55 Y182.901 E1.50523
N11121 G1 X191.55 Y182.849 E.00167
N11122 G1 X158.45 Y191.718 E1.1019
N11123 G1 X158.45 Y195.858 E.13311
N11124 G1 X163.697 Y201.104 E.23861
N11125 G1 X166.855 Y201.104 E.10153
N11126 G1 X186.826 Y126.571 E2.48129
N11127 G1 X188.454 Y126.571 E.05236
N11128 M204 S10000
N11129 G1 X176.769 Y126.571 F60000
N11130 G1 F4421.739
N11131 M204 S8000
N11132 M73 P73 R13
N11133 G1 X178.397 Y126.571 E.05236
N11134 G1 X158.45 Y201.013 E2.47825
N11135 G1 X158.45 Y201.104 E.00293
N11136 G1 X159.987 Y201.104 E.04943
N11137 M204 S10000
N11138 G1 X158.45 Y200.147 F60000
N11139 G1 F4421.739
N11140 M204 S8000
N11141 G1 X191.55 Y191.278 E1.1019
N11142 G1 X191.55 Y194.415 E.10088
N11143 G1 X158.45 Y161.316 E1.50523
N11144 G1 X158.45 Y158.003 E.10653
N11145 G1 X191.55 Y149.134 E1.1019
N11146 G1 X191.55 Y148.359 E.02491
N11147 G1 X169.761 Y126.571 E.99086
N11148 G1 X169.968 Y126.571 E.00667
N11149 G1 X158.45 Y169.557 E1.43104
N11150 G1 X158.45 Y171.185 E.05236
N11151 M204 S10000
N11152 G1 X158.45 Y164.803 F60000
N11153 G1 F4421.739
N11154 M204 S8000
N11155 G1 X158.45 Y166.432 E.05236
N11156 G1 X191.55 Y157.563 E1.1019
N11157 G1 X191.55 Y159.873 E.0743
N11158 G1 X158.45 Y126.774 E1.50523
N11159 G1 X158.45 Y126.571 E.00654
N11160 G1 X161.54 Y126.571 E.09934
N11161 G1 X158.45 Y138.1 E.38382
N11162 G1 X158.45 Y138.288 E.00604
N11163 G1 X191.55 Y171.387 E1.50523
N11164 G1 X191.55 Y171.855 E.01504
N11165 G1 X183.712 Y201.104 E.97374
N11166 G1 X182.084 Y201.104 E.05236
N11167 M204 S10000
N11168 G1 X158.45 Y142.774 F60000
N11169 G1 F4421.739
N11170 M204 S8000
N11171 G1 X158.45 Y141.145 E.05236
N11172 G1 X191.55 Y132.276 E1.1019
N11173 G1 X191.55 Y136.845 E.14692
N11174 G1 X181.275 Y126.571 E.46726
N11175 G1 X181.387 Y126.571 E.00361
N11176 G1 X158.45 Y132.716 E.76358
N11177 G1 X158.45 Y131.088 E.05236
N11178 ; WIPE_START
N11179 G1 X158.45 Y132.716 E-.61876
N11180 G1 X158.809 Y132.62 E-.14124
N11181 ; WIPE_END
N11182 G1 E-.04 F1800
N11183 M204 S10000
N11184 G17
N11185 G3 Z9.4 I1.217 J0 P1  F60000
N11186 ; stop printing object, unique label id: 229
N11187 M625
N11188 ; object ids of layer 45 start: 229
N11189 M624 AQAAAAAAAAA=
N11190 ;======== H2D 20250527========
N11191 ; SKIPPABLE_START
N11192 ; SKIPTYPE: timelapse
N11193 M622.1 S1 ; for prev firware, default turned on
N11194 
N11195 M1002 judge_flag timelapse_record_flag
N11196 
N11197 M622 J1
N11198 M993 A2 B2 C2
N11199 M993 A0 B0 C0
N11200 
N11201 
N11202 
N11203 
N11204     M9711 M0 E1 X260 Y141 Z9.4 S11 C10 O0 T3000
N11205 
N11206 
N11207 
N11208 M993 A3 B3 C3
N11209 
N11210 M623
N11211 ; SKIPPABLE_END
N11212 
N11213 ; object ids of this layer45 end: 229
N11214 M625
N11215 ; CHANGE_LAYER
N11216 ; Z_HEIGHT: 9.2
N11217 ; LAYER_HEIGHT: 0.2
N11218 ;======== H2D 20250521========
N11219 ; layer num/total_layer_count: 46/63
N11220 ; update layer progress
N11221 M73 L46
N11222 M991 S0 P45 ;notify layer change
N11223 
N11224 
N11225 ; OBJECT_ID: 229
N11226 ; COOLING_NODE: 0
N11227 ; start printing object, unique label id: 229
N11228 M624 AQAAAAAAAAA=
N11229 G1 X191.898 Y201.453 F60000
N11230 G1 Z9.2
N11231 G1 E.8 F1800
N11232 ; FEATURE: Inner wall
N11233 ; LINE_WIDTH: 0.45
N11234 ; LAYER_HEIGHT: 0.2
N11235 G1 F4421.739
N11236 M204 S8000
N11237 G1 X158.102 Y201.453 E1.08675
N11238 G1 X158.102 Y126.222 E2.41914
N11239 G1 X191.898 Y126.222 E1.08675
N11240 G1 X191.898 Y201.393 E2.41721
N11241 ; COOLING_NODE: 0
N11242 M204 S10000
N11243 G1 X192.29 Y201.845 F60000
N11244 ; FEATURE: Outer wall
N11245 ; LINE_WIDTH: 0.42
N11246 G1 F4773.528
N11247 M204 S5000
N11248 G1 X157.71 Y201.845 E1.03002
N11249 G1 X157.71 Y125.83 E2.26421
N11250 G1 X192.29 Y125.83 E1.03002
N11251 G1 X192.29 Y201.785 E2.26243
N11252 ; WIPE_START
N11253 M204 S8000
N11254 G1 X190.29 Y201.788 E-.76
N11255 ; WIPE_END
N11256 M73 P73 R12
N11257 G1 E-.04 F1800
N11258 M204 S10000
N11259 G1 X191.55 Y198.225 Z9.6 F60000
N11260 G1 Z9.2
N11261 G1 E.8 F1800
N11262 ; FEATURE: Sparse infill
N11263 ; LINE_WIDTH: 0.45
N11264 G1 F4421.739
N11265 M204 S8000
N11266 G1 X191.55 Y199.853 E.05236
N11267 G1 X186.879 Y201.104 E.15547
N11268 G1 X186.925 Y201.104 E.00147
N11269 G1 X158.45 Y172.63 E1.29492
N11270 G1 X158.45 Y175.007 E.07644
N11271 G1 X191.55 Y166.138 E1.1019
N11272 G1 X191.55 Y164.51 E.05236
N11273 M204 S10000
N11274 G1 X191.55 Y176.195 F60000
N11275 G1 F4421.739
N11276 M204 S8000
N11277 G1 X191.55 Y174.567 E.05236
N11278 G1 X158.45 Y183.436 E1.1019
N11279 G1 X158.45 Y184.144 E.02277
N11280 G1 X175.411 Y201.104 E.77131
N11281 G1 X175.137 Y201.104 E.00881
N11282 G1 X191.55 Y139.852 E2.03915
N11283 G1 X191.55 Y136.645 E.10311
N11284 G1 X181.475 Y126.571 E.45816
N11285 M204 S10000
N11286 G1 X176.622 Y126.571 F60000
N11287 G1 F4421.739
N11288 M204 S8000
N11289 G1 X178.251 Y126.571 E.05236
N11290 G1 X158.45 Y200.467 E2.46006
N11291 G1 X158.45 Y200.293 E.00558
N11292 G1 X191.55 Y191.424 E1.1019
N11293 G1 X191.55 Y194.215 E.08974
N11294 G1 X158.45 Y161.116 E1.50523
N11295 G1 X158.45 Y158.149 E.09539
N11296 G1 X191.55 Y149.28 E1.1019
N11297 G1 X191.55 Y148.159 E.03605
N11298 G1 X169.961 Y126.571 E.98177
N11299 G1 X169.822 Y126.571 E.00447
N11300 G1 X158.45 Y169.01 E1.41285
N11301 G1 X158.45 Y170.638 E.05236
N11302 M204 S10000
N11303 G1 X158.45 Y164.95 F60000
N11304 G1 F4421.739
N11305 M204 S8000
N11306 G1 X158.45 Y166.578 E.05236
N11307 G1 X191.55 Y157.709 E1.1019
N11308 G1 X191.55 Y159.673 E.06316
N11309 G1 X158.45 Y126.574 E1.50523
N11310 G1 X161.393 Y126.571 E.09463
N11311 G1 X158.45 Y137.553 E.36563
N11312 G1 X158.45 Y138.088 E.01718
N11313 G1 X191.55 Y171.187 E1.50523
N11314 G1 X191.55 Y171.308 E.0039
N11315 G1 X183.566 Y201.104 E.99193
N11316 G1 X181.938 Y201.104 E.05236
N11317 M204 S10000
N11318 G1 X158.45 Y142.92 F60000
N11319 G1 F4421.739
N11320 M204 S8000
N11321 G1 X158.45 Y141.292 E.05236
N11322 G1 X191.55 Y132.423 E1.1019
N11323 G1 X191.55 Y130.794 E.05236
N11324 M204 S10000
N11325 G1 X191.55 Y140.851 F60000
N11326 G1 F4421.739
N11327 M204 S8000
N11328 G1 X158.45 Y149.72 E1.1019
N11329 G1 X158.45 Y149.602 E.00382
N11330 G1 X191.55 Y182.701 E1.50523
N11331 G1 X191.55 Y182.995 E.00947
N11332 G1 X158.45 Y191.864 E1.1019
N11333 G1 X158.45 Y195.658 E.12197
N11334 G1 X163.897 Y201.104 E.2477
N11335 G1 X166.708 Y201.104 E.09039
N11336 G1 X186.68 Y126.571 E2.48129
N11337 G1 X181.934 Y126.571 E.15261
N11338 G1 X158.45 Y132.863 E.78177
N11339 G1 X158.45 Y131.235 E.05236
N11340 ; WIPE_START
N11341 G1 X158.45 Y132.863 E-.61876
N11342 G1 X158.809 Y132.767 E-.14124
N11343 ; WIPE_END
N11344 G1 E-.04 F1800
N11345 M204 S10000
N11346 G17
N11347 G3 Z9.6 I1.217 J0 P1  F60000
N11348 ; stop printing object, unique label id: 229
N11349 M625
N11350 ; object ids of layer 46 start: 229
N11351 M624 AQAAAAAAAAA=
N11352 ;======== H2D 20250527========
N11353 ; SKIPPABLE_START
N11354 ; SKIPTYPE: timelapse
N11355 M622.1 S1 ; for prev firware, default turned on
N11356 
N11357 M1002 judge_flag timelapse_record_flag
N11358 
N11359 M622 J1
N11360 M993 A2 B2 C2
N11361 M993 A0 B0 C0
N11362 
N11363 
N11364 
N11365 
N11366     M9711 M0 E1 X260 Y141 Z9.6 S11 C10 O0 T3000
N11367 
N11368 
N11369 
N11370 M993 A3 B3 C3
N11371 
N11372 M623
N11373 ; SKIPPABLE_END
N11374 
N11375 ; object ids of this layer46 end: 229
N11376 M625
N11377 ; CHANGE_LAYER
N11378 ; Z_HEIGHT: 9.4
N11379 ; LAYER_HEIGHT: 0.2
N11380 ;======== H2D 20250521========
N11381 ; layer num/total_layer_count: 47/63
N11382 ; update layer progress
N11383 M73 L47
N11384 M991 S0 P46 ;notify layer change
N11385 
N11386 
N11387 ; OBJECT_ID: 229
N11388 ; COOLING_NODE: 0
N11389 ; start printing object, unique label id: 229
N11390 M624 AQAAAAAAAAA=
N11391 G1 X191.898 Y201.453 F60000
N11392 G1 Z9.4
N11393 G1 E.8 F1800
N11394 ; FEATURE: Inner wall
N11395 ; LINE_WIDTH: 0.45
N11396 ; LAYER_HEIGHT: 0.2
N11397 G1 F4421.739
N11398 M204 S8000
N11399 G1 X158.102 Y201.453 E1.08675
N11400 G1 X158.102 Y126.222 E2.41914
N11401 G1 X191.898 Y126.222 E1.08675
N11402 G1 X191.898 Y201.393 E2.41721
N11403 ; COOLING_NODE: 0
N11404 M204 S10000
N11405 M73 P74 R12
N11406 G1 X192.29 Y201.845 F60000
N11407 ; FEATURE: Outer wall
N11408 ; LINE_WIDTH: 0.42
N11409 G1 F4773.528
N11410 M204 S5000
N11411 G1 X157.71 Y201.845 E1.03002
N11412 G1 X157.71 Y125.83 E2.26421
N11413 G1 X192.29 Y125.83 E1.03002
N11414 G1 X192.29 Y201.785 E2.26243
N11415 ; WIPE_START
N11416 M204 S8000
N11417 G1 X190.29 Y201.788 E-.76
N11418 ; WIPE_END
N11419 G1 E-.04 F1800
N11420 M204 S10000
N11421 G1 X191.55 Y198.371 Z9.8 F60000
N11422 G1 Z9.4
N11423 G1 E.8 F1800
N11424 ; FEATURE: Sparse infill
N11425 ; LINE_WIDTH: 0.45
N11426 G1 F4421.739
N11427 M204 S8000
N11428 G1 X191.55 Y199.999 E.05236
N11429 G1 X187.426 Y201.104 E.13728
N11430 G1 X187.125 Y201.104 E.00967
N11431 G1 X158.45 Y172.43 E1.30401
N11432 G1 X158.45 Y175.153 E.08758
N11433 G1 X191.55 Y166.284 E1.1019
N11434 G1 X191.55 Y164.656 E.05236
N11435 M204 S10000
N11436 G1 X191.55 Y176.341 F60000
N11437 G1 F4421.739
N11438 M204 S8000
N11439 G1 X191.55 Y174.713 E.05236
N11440 G1 X158.45 Y183.582 E1.1019
N11441 G1 X158.45 Y183.944 E.01163
N11442 G1 X175.611 Y201.104 E.78041
N11443 G1 X174.991 Y201.104 E.01995
N11444 G1 X191.55 Y139.305 E2.05734
N11445 G1 X191.55 Y136.445 E.09197
N11446 G1 X181.675 Y126.571 E.44907
N11447 M204 S10000
N11448 G1 X176.476 Y126.571 F60000
N11449 G1 F4421.739
N11450 M204 S8000
N11451 G1 X178.104 Y126.571 E.05236
N11452 G1 X158.45 Y199.92 E2.44187
N11453 G1 X158.45 Y200.44 E.01669
N11454 G1 X191.55 Y191.571 E1.1019
N11455 G1 X191.55 Y194.015 E.0786
N11456 G1 X158.45 Y160.916 E1.50523
N11457 G1 X158.45 Y158.296 E.08425
N11458 G1 X191.55 Y149.427 E1.1019
N11459 G1 X191.55 Y147.959 E.04719
N11460 G1 X170.161 Y126.571 E.97267
N11461 G1 X169.676 Y126.571 E.01561
N11462 G1 X158.45 Y168.464 E1.39466
N11463 G1 X158.45 Y170.092 E.05236
N11464 M204 S10000
N11465 G1 X158.45 Y165.096 F60000
N11466 G1 F4421.739
N11467 M204 S8000
N11468 G1 X158.45 Y166.724 E.05236
N11469 G1 X191.55 Y157.855 E1.1019
N11470 G1 X191.55 Y159.473 E.05202
N11471 G1 X158.647 Y126.571 E1.49628
N11472 G1 X161.247 Y126.571 E.0836
N11473 G1 X158.45 Y137.007 E.34744
N11474 G1 X158.45 Y137.888 E.02832
N11475 G1 X191.55 Y170.987 E1.50523
N11476 G1 X191.55 Y170.762 E.00724
N11477 G1 X183.419 Y201.104 E1.01012
N11478 G1 X181.791 Y201.104 E.05236
N11479 M204 S10000
N11480 G1 X158.45 Y143.066 F60000
N11481 G1 F4421.739
N11482 M204 S8000
N11483 G1 X158.45 Y141.438 E.05236
N11484 G1 X191.55 Y132.569 E1.1019
N11485 G1 X191.55 Y130.941 E.05236
N11486 M204 S10000
N11487 G1 X191.55 Y142.626 F60000
N11488 G1 F4421.739
N11489 M204 S8000
N11490 G1 X191.55 Y140.998 E.05236
N11491 G1 X158.45 Y149.867 E1.1019
N11492 G1 X158.45 Y149.402 E.01496
N11493 G1 X191.55 Y182.501 E1.50523
N11494 G1 X191.55 Y183.142 E.0206
N11495 G1 X158.45 Y192.011 E1.1019
N11496 G1 X158.45 Y195.458 E.11083
N11497 G1 X164.097 Y201.104 E.2568
N11498 G1 X166.562 Y201.104 E.07925
N11499 G1 X186.533 Y126.571 E2.48129
N11500 G1 X182.48 Y126.571 E.13034
N11501 G1 X158.45 Y133.009 E.79996
N11502 G1 X158.45 Y131.381 E.05236
N11503 ; WIPE_START
N11504 G1 X158.45 Y133.009 E-.61876
N11505 G1 X158.809 Y132.913 E-.14124
N11506 ; WIPE_END
N11507 G1 E-.04 F1800
N11508 M204 S10000
N11509 G17
N11510 G3 Z9.8 I1.217 J0 P1  F60000
N11511 ; stop printing object, unique label id: 229
N11512 M625
N11513 ; object ids of layer 47 start: 229
N11514 M624 AQAAAAAAAAA=
N11515 ;======== H2D 20250527========
N11516 ; SKIPPABLE_START
N11517 ; SKIPTYPE: timelapse
N11518 M622.1 S1 ; for prev firware, default turned on
N11519 
N11520 M1002 judge_flag timelapse_record_flag
N11521 
N11522 M622 J1
N11523 M993 A2 B2 C2
N11524 M993 A0 B0 C0
N11525 
N11526 
N11527 
N11528 
N11529     M9711 M0 E1 X260 Y141 Z9.8 S11 C10 O0 T3000
N11530 
N11531 
N11532 
N11533 M993 A3 B3 C3
N11534 
N11535 M623
N11536 ; SKIPPABLE_END
N11537 
N11538 ; object ids of this layer47 end: 229
N11539 M625
N11540 ; CHANGE_LAYER
N11541 ; Z_HEIGHT: 9.6
N11542 ; LAYER_HEIGHT: 0.200001
N11543 ;======== H2D 20250521========
N11544 ; layer num/total_layer_count: 48/63
N11545 ; update layer progress
N11546 M73 L48
N11547 M991 S0 P47 ;notify layer change
N11548 
N11549 
N11550 ; OBJECT_ID: 229
N11551 ; COOLING_NODE: 0
N11552 ; start printing object, unique label id: 229
N11553 M624 AQAAAAAAAAA=
N11554 G1 X191.898 Y201.453 F60000
N11555 G1 Z9.6
N11556 G1 E.8 F1800
N11557 ; FEATURE: Inner wall
N11558 ; LINE_WIDTH: 0.45
N11559 ; LAYER_HEIGHT: 0.2
N11560 G1 F4421.739
N11561 M204 S8000
N11562 G1 X158.102 Y201.453 E1.08675
N11563 G1 X158.102 Y126.222 E2.41914
N11564 G1 X191.898 Y126.222 E1.08675
N11565 G1 X191.898 Y201.393 E2.41721
N11566 ; COOLING_NODE: 0
N11567 M204 S10000
N11568 G1 X192.29 Y201.845 F60000
N11569 ; FEATURE: Outer wall
N11570 ; LINE_WIDTH: 0.42
N11571 G1 F4773.528
N11572 M204 S5000
N11573 G1 X157.71 Y201.845 E1.03002
N11574 G1 X157.71 Y125.83 E2.26421
N11575 G1 X192.29 Y125.83 E1.03002
N11576 G1 X192.29 Y201.785 E2.26243
N11577 ; WIPE_START
N11578 M204 S8000
N11579 G1 X190.29 Y201.788 E-.76
N11580 ; WIPE_END
N11581 G1 E-.04 F1800
N11582 M204 S10000
N11583 G1 X191.55 Y198.518 Z10 F60000
N11584 G1 Z9.6
N11585 G1 E.8 F1800
N11586 ; FEATURE: Sparse infill
N11587 ; LINE_WIDTH: 0.45
N11588 G1 F4421.739
N11589 M204 S8000
N11590 G1 X191.55 Y200.146 E.05236
N11591 G1 X187.972 Y201.104 E.11909
N11592 G1 X187.325 Y201.104 E.02081
N11593 G1 X158.45 Y172.23 E1.31311
N11594 G1 X158.45 Y175.3 E.09872
N11595 G1 X191.55 Y166.431 E1.1019
N11596 G1 X191.55 Y170.216 E.12171
N11597 G1 X183.273 Y201.104 E1.02831
N11598 G1 X181.645 Y201.104 E.05236
N11599 M204 S10000
N11600 G1 X191.55 Y176.488 F60000
N11601 G1 F4421.739
N11602 M204 S8000
N11603 G1 X191.55 Y174.859 E.05236
N11604 G1 X158.45 Y183.728 E1.1019
N11605 G1 X158.45 Y183.744 E.00049
N11606 G1 X175.811 Y201.104 E.7895
N11607 G1 X174.844 Y201.104 E.03109
N11608 G1 X191.55 Y138.759 E2.07553
N11609 G1 X191.55 Y136.245 E.08083
N11610 G1 X181.875 Y126.571 E.43997
N11611 M204 S10000
N11612 G1 X176.33 Y126.571 F60000
N11613 M73 P75 R12
N11614 G1 F4421.739
N11615 M204 S8000
N11616 G1 X177.958 Y126.571 E.05236
N11617 G1 X158.45 Y199.374 E2.42368
N11618 G1 X158.45 Y200.586 E.03897
N11619 G1 X191.55 Y191.717 E1.1019
N11620 G1 X191.55 Y193.815 E.06746
N11621 G1 X158.45 Y160.716 E1.50523
N11622 G1 X158.45 Y158.442 E.07311
N11623 G1 X191.55 Y149.573 E1.1019
N11624 G1 X191.55 Y147.759 E.05833
N11625 G1 X170.361 Y126.571 E.96358
N11626 G1 X169.529 Y126.571 E.02675
N11627 G1 X158.45 Y167.917 E1.37647
N11628 G1 X158.45 Y169.546 E.05236
N11629 M204 S10000
N11630 G1 X158.45 Y166.871 F60000
N11631 G1 F4421.739
N11632 M204 S8000
N11633 G1 X191.55 Y158.002 E1.1019
N11634 G1 X191.55 Y159.273 E.04088
N11635 G1 X158.847 Y126.571 E1.48719
N11636 G1 X161.1 Y126.571 E.07246
N11637 G1 X158.45 Y136.461 E.32925
N11638 G1 X158.45 Y137.688 E.03946
N11639 G1 X191.55 Y170.787 E1.50523
N11640 M204 S10000
N11641 G1 X191.55 Y142.773 F60000
N11642 G1 F4421.739
N11643 M204 S8000
N11644 G1 X191.55 Y141.144 E.05236
N11645 G1 X158.45 Y150.013 E1.1019
N11646 G1 X158.45 Y149.202 E.02609
N11647 G1 X191.55 Y182.301 E1.50523
N11648 G1 X191.55 Y183.288 E.03174
N11649 G1 X158.45 Y192.157 E1.1019
N11650 G1 X158.45 Y195.258 E.0997
N11651 G1 X164.297 Y201.104 E.26589
N11652 G1 X166.415 Y201.104 E.06812
N11653 G1 X186.387 Y126.571 E2.48129
N11654 G1 X183.026 Y126.571 E.10806
N11655 G1 X158.45 Y133.156 E.81816
N11656 G1 X158.45 Y131.527 E.05236
N11657 M204 S10000
N11658 G1 X158.45 Y143.213 F60000
N11659 G1 F4421.739
N11660 M204 S8000
N11661 G1 X158.45 Y141.584 E.05236
N11662 G1 X191.55 Y132.716 E1.1019
N11663 G1 X191.55 Y131.087 E.05236
N11664 ; WIPE_START
N11665 G1 X191.55 Y132.716 E-.61876
N11666 G1 X191.191 Y132.812 E-.14124
N11667 ; WIPE_END
N11668 G1 E-.04 F1800
N11669 M204 S10000
N11670 G17
N11671 G3 Z10 I1.217 J0 P1  F60000
N11672 ; stop printing object, unique label id: 229
N11673 M625
N11674 ; object ids of layer 48 start: 229
N11675 M624 AQAAAAAAAAA=
N11676 ;======== H2D 20250527========
N11677 ; SKIPPABLE_START
N11678 ; SKIPTYPE: timelapse
N11679 M622.1 S1 ; for prev firware, default turned on
N11680 
N11681 M1002 judge_flag timelapse_record_flag
N11682 
N11683 M622 J1
N11684 M993 A2 B2 C2
N11685 M993 A0 B0 C0
N11686 
N11687 
N11688 
N11689 
N11690     M9711 M0 E1 X260 Y141 Z10 S11 C10 O0 T3000
N11691 
N11692 
N11693 
N11694 M993 A3 B3 C3
N11695 
N11696 M623
N11697 ; SKIPPABLE_END
N11698 
N11699 ; object ids of this layer48 end: 229
N11700 M625
N11701 ; CHANGE_LAYER
N11702 ; Z_HEIGHT: 9.8
N11703 ; LAYER_HEIGHT: 0.2
N11704 ;======== H2D 20250521========
N11705 ; layer num/total_layer_count: 49/63
N11706 ; update layer progress
N11707 M73 L49
N11708 M991 S0 P48 ;notify layer change
N11709 
N11710 
N11711 ; OBJECT_ID: 229
N11712 ; COOLING_NODE: 0
N11713 ; start printing object, unique label id: 229
N11714 M624 AQAAAAAAAAA=
N11715 G1 X191.898 Y201.453 F60000
N11716 G1 Z9.8
N11717 G1 E.8 F1800
N11718 ; FEATURE: Inner wall
N11719 ; LINE_WIDTH: 0.45
N11720 ; LAYER_HEIGHT: 0.2
N11721 G1 F4421.739
N11722 M204 S8000
N11723 G1 X158.102 Y201.453 E1.08675
N11724 G1 X158.102 Y126.222 E2.41914
N11725 G1 X191.898 Y126.222 E1.08675
N11726 G1 X191.898 Y201.393 E2.41721
N11727 ; COOLING_NODE: 0
N11728 M204 S10000
N11729 G1 X192.29 Y201.845 F60000
N11730 ; FEATURE: Outer wall
N11731 ; LINE_WIDTH: 0.42
N11732 G1 F4773.528
N11733 M204 S5000
N11734 G1 X157.71 Y201.845 E1.03002
N11735 G1 X157.71 Y125.83 E2.26421
N11736 G1 X192.29 Y125.83 E1.03002
N11737 G1 X192.29 Y201.785 E2.26243
N11738 ; WIPE_START
N11739 M204 S8000
N11740 M73 P75 R11
N11741 G1 X190.29 Y201.788 E-.76
N11742 ; WIPE_END
N11743 G1 E-.04 F1800
N11744 M204 S10000
N11745 G1 X191.55 Y198.664 Z10.2 F60000
N11746 G1 Z9.8
N11747 G1 E.8 F1800
N11748 ; FEATURE: Sparse infill
N11749 ; LINE_WIDTH: 0.45
N11750 G1 F4421.739
N11751 M204 S8000
N11752 G1 X191.55 Y200.292 E.05236
N11753 G1 X188.519 Y201.104 E.1009
N11754 G1 X187.525 Y201.104 E.03195
N11755 G1 X158.45 Y172.03 E1.3222
N11756 G1 X158.45 Y175.446 E.10986
N11757 G1 X191.55 Y166.577 E1.1019
N11758 G1 X191.55 Y169.669 E.09943
N11759 G1 X183.127 Y201.104 E1.0465
N11760 G1 X181.498 Y201.104 E.05236
N11761 M204 S10000
N11762 G1 X191.55 Y176.634 F60000
N11763 G1 F4421.739
N11764 M204 S8000
N11765 G1 X191.55 Y175.006 E.05236
N11766 G1 X158.45 Y183.875 E1.1019
N11767 G1 X158.45 Y183.544 E.01065
N11768 G1 X176.011 Y201.104 E.7986
N11769 G1 X174.698 Y201.104 E.04223
N11770 G1 X191.55 Y138.213 E2.09372
N11771 G1 X191.55 Y136.045 E.06969
N11772 G1 X182.075 Y126.571 E.43088
N11773 G1 X177.812 Y126.571 E.13709
N11774 G1 X158.45 Y198.828 E2.40549
N11775 G1 X158.45 Y200.732 E.06125
N11776 G1 X191.55 Y191.863 E1.1019
N11777 G1 X191.55 Y193.615 E.05632
N11778 G1 X158.45 Y160.516 E1.50523
N11779 G1 X158.45 Y158.588 E.06197
N11780 G1 X191.55 Y149.72 E1.1019
N11781 G1 X191.55 Y147.559 E.06947
N11782 G1 X170.561 Y126.571 E.95448
N11783 G1 X169.383 Y126.571 E.03789
N11784 G1 X158.45 Y167.371 E1.35828
N11785 G1 X158.45 Y167.017 E.01137
N11786 G1 X191.55 Y158.148 E1.1019
N11787 G1 X191.55 Y159.073 E.02974
N11788 G1 X159.047 Y126.571 E1.47809
N11789 G1 X160.954 Y126.571 E.06132
N11790 G1 X158.45 Y135.914 E.31106
N11791 G1 X158.45 Y137.488 E.0506
N11792 G1 X191.55 Y170.587 E1.50523
N11793 M204 S10000
N11794 G1 X191.55 Y142.919 F60000
N11795 G1 F4421.739
N11796 M204 S8000
N11797 G1 X191.55 Y141.291 E.05236
N11798 G1 X158.45 Y150.16 E1.1019
N11799 G1 X158.45 Y149.002 E.03723
N11800 G1 X191.55 Y182.101 E1.50523
N11801 G1 X191.55 Y183.435 E.04288
N11802 G1 X158.45 Y192.304 E1.1019
N11803 G1 X158.45 Y195.058 E.08856
N11804 G1 X164.497 Y201.104 E.27499
N11805 G1 X166.269 Y201.104 E.05698
N11806 G1 X186.24 Y126.571 E2.48129
N11807 G1 X183.573 Y126.571 E.08578
N11808 G1 X158.45 Y133.302 E.83635
N11809 G1 X158.45 Y131.674 E.05236
N11810 M204 S10000
N11811 G1 X158.45 Y143.359 F60000
N11812 G1 F4421.739
N11813 M204 S8000
N11814 M73 P76 R11
N11815 G1 X158.45 Y141.731 E.05236
N11816 G1 X191.55 Y132.862 E1.1019
N11817 G1 X191.55 Y131.234 E.05236
N11818 ; WIPE_START
N11819 G1 X191.55 Y132.862 E-.61876
N11820 G1 X191.191 Y132.958 E-.14124
N11821 ; WIPE_END
N11822 G1 E-.04 F1800
N11823 M204 S10000
N11824 G17
N11825 G3 Z10.2 I1.217 J0 P1  F60000
N11826 ; stop printing object, unique label id: 229
N11827 M625
N11828 ; object ids of layer 49 start: 229
N11829 M624 AQAAAAAAAAA=
N11830 ;======== H2D 20250527========
N11831 ; SKIPPABLE_START
N11832 ; SKIPTYPE: timelapse
N11833 M622.1 S1 ; for prev firware, default turned on
N11834 
N11835 M1002 judge_flag timelapse_record_flag
N11836 
N11837 M622 J1
N11838 M993 A2 B2 C2
N11839 M993 A0 B0 C0
N11840 
N11841 
N11842 
N11843 
N11844     M9711 M0 E1 X260 Y141 Z10.2 S11 C10 O0 T3000
N11845 
N11846 
N11847 
N11848 M993 A3 B3 C3
N11849 
N11850 M623
N11851 ; SKIPPABLE_END
N11852 
N11853 ; object ids of this layer49 end: 229
N11854 M625
N11855 ; CHANGE_LAYER
N11856 ; Z_HEIGHT: 10
N11857 ; LAYER_HEIGHT: 0.2
N11858 ;======== H2D 20250521========
N11859 ; layer num/total_layer_count: 50/63
N11860 ; update layer progress
N11861 M73 L50
N11862 M991 S0 P49 ;notify layer change
N11863 
N11864 
N11865 ; OBJECT_ID: 229
N11866 ; COOLING_NODE: 0
N11867 ; start printing object, unique label id: 229
N11868 M624 AQAAAAAAAAA=
N11869 G1 X191.898 Y201.453 F60000
N11870 G1 Z10
N11871 G1 E.8 F1800
N11872 ; FEATURE: Inner wall
N11873 ; LINE_WIDTH: 0.45
N11874 ; LAYER_HEIGHT: 0.2
N11875 G1 F4421.739
N11876 M204 S8000
N11877 G1 X158.102 Y201.453 E1.08675
N11878 G1 X158.102 Y126.222 E2.41914
N11879 G1 X191.898 Y126.222 E1.08675
N11880 G1 X191.898 Y201.393 E2.41721
N11881 ; COOLING_NODE: 0
N11882 M204 S10000
N11883 G1 X192.29 Y201.845 F60000
N11884 ; FEATURE: Outer wall
N11885 ; LINE_WIDTH: 0.42
N11886 G1 F4773.528
N11887 M204 S5000
N11888 G1 X157.71 Y201.845 E1.03002
N11889 G1 X157.71 Y125.83 E2.26421
N11890 G1 X192.29 Y125.83 E1.03002
N11891 G1 X192.29 Y201.785 E2.26243
N11892 ; WIPE_START
N11893 M204 S8000
N11894 G1 X190.29 Y201.788 E-.76
N11895 ; WIPE_END
N11896 G1 E-.04 F1800
N11897 M204 S10000
N11898 G1 X191.55 Y198.81 Z10.4 F60000
N11899 G1 Z10
N11900 G1 E.8 F1800
N11901 ; FEATURE: Sparse infill
N11902 ; LINE_WIDTH: 0.45
N11903 G1 F4421.739
N11904 M204 S8000
N11905 G1 X191.55 Y200.439 E.05236
N11906 G1 X189.065 Y201.104 E.08271
N11907 G1 X187.725 Y201.104 E.04309
N11908 G1 X158.45 Y171.83 E1.3313
N11909 G1 X158.45 Y175.592 E.121
N11910 G1 X191.55 Y166.724 E1.1019
N11911 G1 X191.55 Y169.123 E.07715
N11912 G1 X182.98 Y201.104 E1.06469
N11913 G1 X181.352 Y201.104 E.05236
N11914 M204 S10000
N11915 G1 X191.55 Y176.781 F60000
N11916 G1 F4421.739
N11917 M204 S8000
N11918 G1 X191.55 Y175.152 E.05236
N11919 G1 X158.45 Y184.021 E1.1019
N11920 G1 X158.45 Y183.344 E.02179
N11921 G1 X176.211 Y201.104 E.80769
N11922 G1 X174.551 Y201.104 E.05337
N11923 G1 X191.55 Y137.666 E2.11191
N11924 G1 X191.55 Y135.845 E.05855
N11925 G1 X182.275 Y126.571 E.42178
N11926 G1 X177.665 Y126.571 E.14823
N11927 G1 X158.45 Y198.281 E2.3873
N11928 G1 X158.45 Y200.879 E.08353
N11929 G1 X191.55 Y192.01 E1.1019
N11930 G1 X191.55 Y193.415 E.04519
N11931 G1 X158.45 Y160.316 E1.50523
N11932 G1 X158.45 Y158.735 E.05083
N11933 G1 X191.55 Y149.866 E1.1019
N11934 G1 X191.55 Y147.359 E.0806
N11935 G1 X170.761 Y126.571 E.94539
N11936 G1 X169.236 Y126.571 E.04902
N11937 G1 X158.45 Y166.825 E1.34009
N11938 G1 X158.45 Y167.164 E.0109
N11939 G1 X191.55 Y158.295 E1.1019
N11940 G1 X191.55 Y158.873 E.0186
N11941 G1 X159.247 Y126.571 E1.469
N11942 G1 X160.808 Y126.571 E.05018
N11943 G1 X158.45 Y135.368 E.29287
N11944 G1 X158.45 Y137.288 E.06174
N11945 G1 X191.55 Y170.387 E1.50523
N11946 G1 X191.55 Y172.015 E.05236
N11947 M204 S10000
N11948 G1 X158.45 Y143.506 F60000
N11949 G1 F4421.739
N11950 M204 S8000
N11951 G1 X158.45 Y141.877 E.05236
N11952 G1 X191.55 Y133.008 E1.1019
N11953 G1 X191.55 Y131.38 E.05236
N11954 M204 S10000
N11955 G1 X191.55 Y143.065 F60000
N11956 G1 F4421.739
N11957 M204 S8000
N11958 G1 X191.55 Y141.437 E.05236
N11959 G1 X158.45 Y150.306 E1.1019
N11960 G1 X158.45 Y148.802 E.04837
N11961 G1 X191.55 Y181.901 E1.50523
N11962 G1 X191.55 Y183.581 E.05402
N11963 G1 X158.45 Y192.45 E1.1019
N11964 G1 X158.45 Y194.858 E.07742
N11965 G1 X164.697 Y201.104 E.28408
N11966 G1 X166.123 Y201.104 E.04584
N11967 G1 X186.094 Y126.571 E2.48129
N11968 G1 X184.119 Y126.571 E.0635
N11969 G1 X158.45 Y133.448 E.85454
N11970 G1 X158.45 Y131.82 E.05236
N11971 ; WIPE_START
N11972 G1 X158.45 Y133.448 E-.61876
N11973 G1 X158.809 Y133.352 E-.14124
N11974 ; WIPE_END
N11975 G1 E-.04 F1800
N11976 M204 S10000
N11977 G17
N11978 G3 Z10.4 I1.217 J0 P1  F60000
N11979 ; stop printing object, unique label id: 229
N11980 M625
N11981 ; object ids of layer 50 start: 229
N11982 M624 AQAAAAAAAAA=
N11983 ;======== H2D 20250527========
N11984 ; SKIPPABLE_START
N11985 ; SKIPTYPE: timelapse
N11986 M622.1 S1 ; for prev firware, default turned on
N11987 
N11988 M1002 judge_flag timelapse_record_flag
N11989 
N11990 M622 J1
N11991 M993 A2 B2 C2
N11992 M993 A0 B0 C0
N11993 
N11994 
N11995 
N11996 
N11997     M9711 M0 E1 X260 Y141 Z10.4 S11 C10 O0 T3000
N11998 
N11999 
N12000 
N12001 M993 A3 B3 C3
N12002 
N12003 M623
N12004 ; SKIPPABLE_END
N12005 
N12006 ; object ids of this layer50 end: 229
N12007 M625
N12008 ; CHANGE_LAYER
N12009 ; Z_HEIGHT: 10.2
N12010 ; LAYER_HEIGHT: 0.2
N12011 ;======== H2D 20250521========
N12012 ; layer num/total_layer_count: 51/63
N12013 ; update layer progress
N12014 M73 L51
N12015 M991 S0 P50 ;notify layer change
N12016 
N12017 
N12018 ; OBJECT_ID: 229
N12019 ; COOLING_NODE: 0
N12020 ; start printing object, unique label id: 229
N12021 M624 AQAAAAAAAAA=
N12022 G1 X191.898 Y201.453 F60000
N12023 G1 Z10.2
N12024 G1 E.8 F1800
N12025 ; FEATURE: Inner wall
N12026 ; LINE_WIDTH: 0.45
N12027 ; LAYER_HEIGHT: 0.2
N12028 G1 F4421.739
N12029 M204 S8000
N12030 G1 X158.102 Y201.453 E1.08675
N12031 G1 X158.102 Y126.222 E2.41914
N12032 G1 X191.898 Y126.222 E1.08675
N12033 G1 X191.898 Y201.393 E2.41721
N12034 ; COOLING_NODE: 0
N12035 M204 S10000
N12036 G1 X192.29 Y201.845 F60000
N12037 ; FEATURE: Outer wall
N12038 ; LINE_WIDTH: 0.42
N12039 G1 F4773.528
N12040 M204 S5000
N12041 G1 X157.71 Y201.845 E1.03002
N12042 G1 X157.71 Y125.83 E2.26421
N12043 G1 X192.29 Y125.83 E1.03002
N12044 G1 X192.29 Y201.785 E2.26243
N12045 ; WIPE_START
N12046 M204 S8000
N12047 G1 X190.29 Y201.788 E-.76
N12048 ; WIPE_END
N12049 G1 E-.04 F1800
N12050 M204 S10000
N12051 G1 X191.55 Y200.789 Z10.6 F60000
N12052 G1 Z10.2
N12053 G1 E.8 F1800
N12054 ; FEATURE: Sparse infill
N12055 ; LINE_WIDTH: 0.45
N12056 G1 F4421.739
N12057 M204 S8000
N12058 G1 X191.55 Y201.104 E.01016
N12059 G1 X191.263 Y201.104 E.00923
N12060 G1 X191.55 Y200.033 E.03567
N12061 G1 X191.55 Y200.585 E.01775
N12062 G1 X189.611 Y201.104 E.06452
N12063 G1 X187.925 Y201.104 E.05423
N12064 G1 X158.45 Y171.63 E1.34039
N12065 G1 X158.45 Y175.739 E.13214
N12066 G1 X191.55 Y166.87 E1.1019
N12067 G1 X191.55 Y168.576 E.05487
N12068 G1 X182.834 Y201.104 E1.08288
N12069 G1 X181.206 Y201.104 E.05236
N12070 M204 S10000
N12071 G1 X191.55 Y176.927 F60000
N12072 G1 F4421.739
N12073 M204 S8000
N12074 G1 X191.55 Y175.299 E.05236
N12075 G1 X158.45 Y184.168 E1.1019
N12076 G1 X158.45 Y183.144 E.03293
N12077 G1 X176.411 Y201.104 E.81679
N12078 G1 X174.405 Y201.104 E.06451
N12079 M73 P77 R11
N12080 G1 X191.55 Y137.12 E2.1301
N12081 G1 X191.55 Y135.645 E.04741
N12082 G1 X182.475 Y126.571 E.41269
N12083 G1 X177.519 Y126.571 E.15937
N12084 G1 X158.45 Y197.735 E2.36911
N12085 G1 X158.45 Y201.025 E.10581
N12086 G1 X191.55 Y192.156 E1.1019
N12087 G1 X191.55 Y193.215 E.03405
N12088 G1 X158.45 Y160.116 E1.50523
N12089 G1 X158.45 Y158.881 E.0397
N12090 G1 X191.55 Y150.012 E1.1019
N12091 G1 X191.55 Y147.159 E.09174
N12092 G1 X170.961 Y126.571 E.93629
N12093 G1 X169.09 Y126.571 E.06016
N12094 G1 X158.45 Y166.278 E1.3219
N12095 G1 X158.45 Y167.31 E.03318
N12096 G1 X191.55 Y158.441 E1.1019
N12097 G1 X191.55 Y158.673 E.00746
N12098 G1 X159.447 Y126.571 E1.4599
N12099 G1 X160.661 Y126.571 E.03904
N12100 G1 X158.45 Y134.821 E.27468
N12101 G1 X158.45 Y137.088 E.07288
N12102 G1 X191.55 Y170.187 E1.50523
N12103 G1 X191.55 Y171.815 E.05236
N12104 M204 S10000
N12105 G1 X191.55 Y143.212 F60000
N12106 G1 F4421.739
N12107 M204 S8000
N12108 G1 X191.55 Y141.584 E.05236
N12109 G1 X158.45 Y150.452 E1.1019
N12110 G1 X158.45 Y148.602 E.05951
N12111 G1 X191.55 Y181.701 E1.50523
N12112 G1 X191.55 Y183.728 E.06516
N12113 G1 X158.45 Y192.596 E1.1019
N12114 G1 X158.45 Y194.658 E.06628
N12115 G1 X164.897 Y201.104 E.29318
N12116 G1 X165.976 Y201.104 E.0347
N12117 G1 X185.948 Y126.571 E2.48129
N12118 G1 X184.666 Y126.571 E.04122
N12119 G1 X158.45 Y133.595 E.87273
N12120 M204 S10000
N12121 G1 X158.45 Y143.652 F60000
N12122 G1 F4421.739
N12123 M204 S8000
N12124 G1 X158.45 Y142.024 E.05236
N12125 G1 X191.55 Y133.155 E1.1019
N12126 G1 X191.55 Y131.526 E.05236
N12127 ; WIPE_START
N12128 G1 X191.55 Y133.155 E-.61876
N12129 G1 X191.191 Y133.251 E-.14124
N12130 ; WIPE_END
N12131 G1 E-.04 F1800
N12132 M204 S10000
N12133 G17
N12134 G3 Z10.6 I1.217 J0 P1  F60000
N12135 ; stop printing object, unique label id: 229
N12136 M625
N12137 ; object ids of layer 51 start: 229
N12138 M624 AQAAAAAAAAA=
N12139 ;======== H2D 20250527========
N12140 ; SKIPPABLE_START
N12141 ; SKIPTYPE: timelapse
N12142 M622.1 S1 ; for prev firware, default turned on
N12143 
N12144 M1002 judge_flag timelapse_record_flag
N12145 
N12146 M622 J1
N12147 M993 A2 B2 C2
N12148 M993 A0 B0 C0
N12149 
N12150 
N12151 
N12152 
N12153     M9711 M0 E1 X260 Y141 Z10.6 S11 C10 O0 T3000
N12154 
N12155 
N12156 
N12157 M993 A3 B3 C3
N12158 
N12159 M623
N12160 ; SKIPPABLE_END
N12161 
N12162 ; object ids of this layer51 end: 229
N12163 M625
N12164 ; CHANGE_LAYER
N12165 ; Z_HEIGHT: 10.4
N12166 ; LAYER_HEIGHT: 0.2
N12167 ;======== H2D 20250521========
N12168 ; layer num/total_layer_count: 52/63
N12169 ; update layer progress
N12170 M73 L52
N12171 M991 S0 P51 ;notify layer change
N12172 
N12173 
N12174 ; OBJECT_ID: 229
N12175 ; COOLING_NODE: 0
N12176 ; start printing object, unique label id: 229
N12177 M624 AQAAAAAAAAA=
N12178 G1 X191.898 Y201.453 F60000
N12179 G1 Z10.4
N12180 G1 E.8 F1800
N12181 ; FEATURE: Inner wall
N12182 ; LINE_WIDTH: 0.45
N12183 ; LAYER_HEIGHT: 0.2
N12184 G1 F4421.739
N12185 M204 S8000
N12186 G1 X158.102 Y201.453 E1.08675
N12187 G1 X158.102 Y126.222 E2.41914
N12188 G1 X191.898 Y126.222 E1.08675
N12189 G1 X191.898 Y201.393 E2.41721
N12190 ; COOLING_NODE: 0
N12191 M204 S10000
N12192 G1 X192.29 Y201.845 F60000
N12193 ; FEATURE: Outer wall
N12194 ; LINE_WIDTH: 0.42
N12195 G1 F4773.528
N12196 M204 S5000
N12197 G1 X157.71 Y201.845 E1.03002
N12198 G1 X157.71 Y125.83 E2.26421
N12199 G1 X192.29 Y125.83 E1.03002
N12200 G1 X192.29 Y201.785 E2.26243
N12201 ; WIPE_START
N12202 M204 S8000
N12203 M73 P77 R10
N12204 G1 X190.29 Y201.788 E-.76
N12205 ; WIPE_END
N12206 G1 E-.04 F1800
N12207 M204 S10000
N12208 G1 X191.32 Y201.104 Z10.8 F60000
N12209 G1 Z10.4
N12210 G1 E.8 F1800
N12211 ; FEATURE: Sparse infill
N12212 ; LINE_WIDTH: 0.45
N12213 G1 F4421.739
N12214 M204 S8000
N12215 G1 X191.55 Y201.104 E.00739
N12216 G1 X191.55 Y200.732 E.01199
N12217 G1 X190.158 Y201.104 E.04633
N12218 G1 X188.125 Y201.104 E.06537
N12219 G1 X158.45 Y171.43 E1.34949
N12220 G1 X158.45 Y175.885 E.14328
N12221 G1 X191.55 Y167.016 E1.1019
N12222 G1 X191.55 Y168.03 E.03259
N12223 G1 X182.687 Y201.104 E1.10107
N12224 G1 X181.059 Y201.104 E.05236
N12225 M204 S10000
N12226 G1 X191.116 Y201.104 F60000
N12227 G1 F4421.739
N12228 M204 S8000
N12229 G1 X191.55 Y199.487 E.05386
N12230 G1 X191.55 Y197.858 E.05236
N12231 M204 S10000
N12232 G1 X191.55 Y177.073 F60000
N12233 G1 F4421.739
N12234 M204 S8000
N12235 G1 X191.55 Y175.445 E.05236
N12236 G1 X158.45 Y184.314 E1.1019
N12237 G1 X158.45 Y182.944 E.04407
N12238 G1 X176.611 Y201.104 E.82588
N12239 G1 X174.259 Y201.104 E.07565
N12240 G1 X191.55 Y136.573 E2.14829
N12241 G1 X191.55 Y135.445 E.03627
N12242 G1 X182.675 Y126.571 E.40359
N12243 G1 X177.372 Y126.571 E.17051
N12244 G1 X158.45 Y197.188 E2.35092
N12245 G1 X158.45 Y201.104 E.12592
N12246 G1 X158.701 Y201.104 E.00807
N12247 G1 X191.55 Y192.303 E1.09355
N12248 G1 X191.55 Y193.015 E.02291
N12249 G1 X158.45 Y159.916 E1.50523
N12250 G1 X158.45 Y159.028 E.02856
N12251 G1 X191.55 Y150.159 E1.1019
N12252 G1 X191.55 Y146.959 E.10288
N12253 G1 X171.161 Y126.571 E.9272
N12254 G1 X168.944 Y126.571 E.0713
N12255 G1 X158.45 Y165.732 E1.3037
N12256 G1 X158.45 Y167.456 E.05546
N12257 G1 X191.55 Y158.588 E1.1019
N12258 G1 X191.55 Y158.473 E.00368
N12259 G1 X159.647 Y126.571 E1.45081
N12260 G1 X160.515 Y126.571 E.0279
N12261 G1 X158.45 Y134.275 E.25649
N12262 G1 X158.45 Y136.888 E.08402
N12263 G1 X191.55 Y169.987 E1.50523
N12264 G1 X191.55 Y171.615 E.05236
N12265 M204 S10000
N12266 G1 X191.55 Y143.358 F60000
N12267 G1 F4421.739
N12268 M204 S8000
N12269 G1 X191.55 Y141.73 E.05236
N12270 G1 X158.45 Y150.599 E1.1019
N12271 G1 X158.45 Y148.402 E.07065
N12272 G1 X191.55 Y181.501 E1.50523
N12273 G1 X191.55 Y183.874 E.0763
N12274 G1 X158.45 Y192.743 E1.1019
N12275 G1 X158.45 Y194.458 E.05514
N12276 G1 X165.097 Y201.104 E.30227
N12277 G1 X165.83 Y201.104 E.02356
N12278 M73 P78 R10
N12279 G1 X185.801 Y126.571 E2.48129
N12280 G1 X185.212 Y126.571 E.01894
N12281 G1 X158.45 Y133.741 E.89092
N12282 M204 S10000
N12283 G1 X158.45 Y143.798 F60000
N12284 G1 F4421.739
N12285 M204 S8000
N12286 G1 X158.45 Y142.17 E.05236
N12287 G1 X191.55 Y133.301 E1.1019
N12288 G1 X191.55 Y131.673 E.05236
N12289 ; WIPE_START
N12290 G1 X191.55 Y133.301 E-.61876
N12291 G1 X191.191 Y133.397 E-.14124
N12292 ; WIPE_END
N12293 G1 E-.04 F1800
N12294 M204 S10000
N12295 G17
N12296 G3 Z10.8 I1.217 J0 P1  F60000
N12297 ; stop printing object, unique label id: 229
N12298 M625
N12299 ; object ids of layer 52 start: 229
N12300 M624 AQAAAAAAAAA=
N12301 ;======== H2D 20250527========
N12302 ; SKIPPABLE_START
N12303 ; SKIPTYPE: timelapse
N12304 M622.1 S1 ; for prev firware, default turned on
N12305 
N12306 M1002 judge_flag timelapse_record_flag
N12307 
N12308 M622 J1
N12309 M993 A2 B2 C2
N12310 M993 A0 B0 C0
N12311 
N12312 
N12313 
N12314 
N12315     M9711 M0 E1 X260 Y141 Z10.8 S11 C10 O0 T3000
N12316 
N12317 
N12318 
N12319 M993 A3 B3 C3
N12320 
N12321 M623
N12322 ; SKIPPABLE_END
N12323 
N12324 ; object ids of this layer52 end: 229
N12325 M625
N12326 ; CHANGE_LAYER
N12327 ; Z_HEIGHT: 10.6
N12328 ; LAYER_HEIGHT: 0.200001
N12329 ;======== H2D 20250521========
N12330 ; layer num/total_layer_count: 53/63
N12331 ; update layer progress
N12332 M73 L53
N12333 M991 S0 P52 ;notify layer change
N12334 
N12335 
N12336 ; OBJECT_ID: 229
N12337 ; COOLING_NODE: 0
N12338 ; start printing object, unique label id: 229
N12339 M624 AQAAAAAAAAA=
N12340 G1 X191.898 Y201.453 F60000
N12341 G1 Z10.6
N12342 G1 E.8 F1800
N12343 ; FEATURE: Inner wall
N12344 ; LINE_WIDTH: 0.45
N12345 ; LAYER_HEIGHT: 0.2
N12346 G1 F4421.739
N12347 M204 S8000
N12348 G1 X158.102 Y201.453 E1.08675
N12349 G1 X158.102 Y126.222 E2.41914
N12350 G1 X191.898 Y126.222 E1.08675
N12351 G1 X191.898 Y201.393 E2.41721
N12352 ; COOLING_NODE: 0
N12353 M204 S10000
N12354 G1 X192.29 Y201.845 F60000
N12355 ; FEATURE: Outer wall
N12356 ; LINE_WIDTH: 0.42
N12357 G1 F4773.528
N12358 M204 S5000
N12359 G1 X157.71 Y201.845 E1.03002
N12360 G1 X157.71 Y125.83 E2.26421
N12361 G1 X192.29 Y125.83 E1.03002
N12362 G1 X192.29 Y201.785 E2.26243
N12363 ; WIPE_START
N12364 M204 S8000
N12365 G1 X190.29 Y201.788 E-.76
N12366 ; WIPE_END
N12367 G1 E-.04 F1800
N12368 M204 S10000
N12369 G1 X191.173 Y201.104 Z11 F60000
N12370 G1 Z10.6
N12371 G1 E.8 F1800
N12372 ; FEATURE: Sparse infill
N12373 ; LINE_WIDTH: 0.45
N12374 G1 F4421.739
N12375 M204 S8000
N12376 G1 X191.55 Y201.104 E.0121
N12377 G1 X191.55 Y200.878 E.00728
N12378 G1 X190.704 Y201.104 E.02814
N12379 G1 X190.97 Y201.104 E.00854
N12380 G1 X191.55 Y198.94 E.07205
N12381 G1 X191.55 Y197.312 E.05236
N12382 M204 S10000
N12383 G1 X186.697 Y201.104 F60000
N12384 G1 F4421.739
N12385 M204 S8000
N12386 G1 X188.325 Y201.104 E.05236
N12387 G1 X158.45 Y171.23 E1.35858
N12388 G1 X158.45 Y176.032 E.15442
N12389 G1 X191.55 Y167.163 E1.1019
N12390 G1 X191.55 Y167.484 E.01032
N12391 G1 X182.541 Y201.104 E1.11926
N12392 G1 X180.913 Y201.104 E.05236
N12393 M204 S10000
N12394 G1 X191.55 Y143.505 F60000
N12395 G1 F4421.739
N12396 M204 S8000
N12397 G1 X191.55 Y141.876 E.05236
N12398 G1 X158.45 Y150.745 E1.1019
N12399 G1 X158.45 Y148.202 E.08179
N12400 G1 X191.55 Y181.301 E1.50523
N12401 G1 X191.55 Y184.02 E.08744
N12402 G1 X158.45 Y192.889 E1.1019
N12403 G1 X158.45 Y194.258 E.044
N12404 G1 X165.297 Y201.104 E.31137
N12405 G1 X165.683 Y201.104 E.01242
N12406 G1 X185.655 Y126.571 E2.48129
N12407 G1 X185.758 Y126.571 E.00334
N12408 G1 X158.45 Y133.888 E.90911
N12409 G1 X158.45 Y133.729 E.00512
N12410 G1 X160.368 Y126.571 E.2383
N12411 G1 X159.847 Y126.571 E.01676
N12412 G1 X191.55 Y158.273 E1.44171
N12413 G1 X191.55 Y158.734 E.01482
N12414 G1 X158.45 Y167.603 E1.1019
N12415 G1 X158.45 Y165.185 E.07774
N12416 G1 X168.797 Y126.571 E1.28551
N12417 G1 X171.361 Y126.571 E.08244
N12418 G1 X191.55 Y146.759 E.9181
N12419 G1 X191.55 Y150.305 E.11402
N12420 G1 X158.45 Y159.174 E1.1019
N12421 G1 X158.45 Y159.716 E.01742
N12422 G1 X191.55 Y192.815 E1.50523
N12423 G1 X191.55 Y192.449 E.01177
N12424 G1 X159.248 Y201.104 E1.07536
N12425 G1 X158.45 Y201.104 E.02564
N12426 G1 X158.45 Y196.642 E.1435
N12427 G1 X177.226 Y126.571 E2.33273
N12428 G1 X182.875 Y126.571 E.18165
N12429 G1 X191.55 Y135.245 E.39449
N12430 G1 X191.55 Y136.027 E.02513
N12431 G1 X174.112 Y201.104 E2.16648
N12432 G1 X176.811 Y201.104 E.08679
N12433 G1 X158.45 Y182.744 E.83498
N12434 G1 X158.45 Y184.46 E.05521
N12435 G1 X191.55 Y175.592 E1.1019
N12436 G1 X191.55 Y169.787 E.18665
N12437 G1 X158.45 Y136.688 E1.50523
N12438 G1 X158.45 Y142.317 E.181
N12439 G1 X191.55 Y133.448 E1.1019
N12440 G1 X191.55 Y131.819 E.05236
N12441 ; WIPE_START
N12442 G1 X191.55 Y133.448 E-.61876
N12443 G1 X191.191 Y133.544 E-.14124
N12444 ; WIPE_END
N12445 G1 E-.04 F1800
N12446 M204 S10000
N12447 G17
N12448 G3 Z11 I1.217 J0 P1  F60000
N12449 ; stop printing object, unique label id: 229
N12450 M625
N12451 ; object ids of layer 53 start: 229
N12452 M624 AQAAAAAAAAA=
N12453 ;======== H2D 20250527========
N12454 ; SKIPPABLE_START
N12455 ; SKIPTYPE: timelapse
N12456 M622.1 S1 ; for prev firware, default turned on
N12457 
N12458 M1002 judge_flag timelapse_record_flag
N12459 
N12460 M622 J1
N12461 M993 A2 B2 C2
N12462 M993 A0 B0 C0
N12463 
N12464 
N12465 
N12466 
N12467     M9711 M0 E1 X260 Y141 Z11 S11 C10 O0 T3000
N12468 
N12469 
N12470 
N12471 M993 A3 B3 C3
N12472 
N12473 M623
N12474 ; SKIPPABLE_END
N12475 
N12476 ; object ids of this layer53 end: 229
N12477 M625
N12478 ; CHANGE_LAYER
N12479 ; Z_HEIGHT: 10.8
N12480 ; LAYER_HEIGHT: 0.2
N12481 ;======== H2D 20250521========
N12482 ; layer num/total_layer_count: 54/63
N12483 ; update layer progress
N12484 M73 L54
N12485 M991 S0 P53 ;notify layer change
N12486 
N12487 
N12488 M106 S68.85
N12489 ; OBJECT_ID: 229
N12490 ; COOLING_NODE: 0
N12491 ; start printing object, unique label id: 229
N12492 M624 AQAAAAAAAAA=
N12493 G1 X191.898 Y201.453 F60000
N12494 G1 Z10.8
N12495 G1 E.8 F1800
N12496 ; FEATURE: Inner wall
N12497 ; LINE_WIDTH: 0.45
N12498 ; LAYER_HEIGHT: 0.2
N12499 G1 F4421.739
N12500 M204 S8000
N12501 G1 X158.102 Y201.453 E1.08675
N12502 G1 X158.102 Y126.222 E2.41914
N12503 G1 X191.898 Y126.222 E1.08675
N12504 G1 X191.898 Y201.393 E2.41721
N12505 ; COOLING_NODE: 0
N12506 M204 S10000
N12507 G1 X192.29 Y201.845 F60000
N12508 ; FEATURE: Outer wall
N12509 ; LINE_WIDTH: 0.42
N12510 G1 F4773.528
N12511 M204 S5000
N12512 G1 X157.71 Y201.845 E1.03002
N12513 G1 X157.71 Y125.83 E2.26421
N12514 G1 X192.29 Y125.83 E1.03002
N12515 G1 X192.29 Y201.785 E2.26243
N12516 ; WIPE_START
N12517 M204 S8000
N12518 G1 X190.29 Y201.788 E-.76
N12519 ; WIPE_END
N12520 G1 E-.04 F1800
N12521 M204 S10000
N12522 G1 X191.55 Y196.766 Z11.2 F60000
N12523 G1 Z10.8
N12524 G1 E.8 F1800
N12525 ; FEATURE: Sparse infill
N12526 ; LINE_WIDTH: 0.45
N12527 G1 F4421.739
N12528 M204 S8000
N12529 G1 X191.55 Y198.394 E.05236
N12530 G1 X190.823 Y201.104 E.09024
N12531 G1 X188.525 Y201.104 E.0739
N12532 G1 X158.45 Y171.03 E1.36768
N12533 G1 X158.45 Y176.178 E.16556
N12534 G1 X191.55 Y167.309 E1.1019
N12535 G1 X191.55 Y166.937 E.01196
N12536 M73 P79 R10
N12537 G1 X182.395 Y201.104 E1.13745
N12538 G1 X184.023 Y201.104 E.05236
N12539 M204 S10000
N12540 G1 X191.55 Y140.394 F60000
N12541 G1 F4421.739
N12542 M204 S8000
N12543 G1 X191.55 Y142.023 E.05236
N12544 G1 X158.45 Y150.892 E1.1019
N12545 G1 X158.45 Y148.002 E.09293
N12546 G1 X191.55 Y181.101 E1.50523
N12547 G1 X191.55 Y184.167 E.09858
N12548 G1 X158.45 Y193.036 E1.1019
N12549 G1 X158.45 Y194.058 E.03286
N12550 G1 X165.497 Y201.104 E.32046
N12551 G1 X165.537 Y201.104 E.00128
N12552 G1 X185.508 Y126.571 E2.48129
N12553 M204 S10000
N12554 G1 X187.933 Y126.571 F60000
N12555 G1 F4421.739
N12556 M204 S8000
N12557 G1 X186.305 Y126.571 E.05236
N12558 G1 X158.45 Y134.034 E.9273
N12559 G1 X158.45 Y133.182 E.02739
N12560 G1 X160.222 Y126.571 E.22011
N12561 G1 X160.047 Y126.571 E.00562
N12562 G1 X191.55 Y158.073 E1.43262
N12563 G1 X191.55 Y158.88 E.02595
N12564 G1 X158.45 Y167.749 E1.1019
N12565 G1 X158.45 Y164.639 E.10002
N12566 G1 X168.651 Y126.571 E1.26732
N12567 G1 X171.561 Y126.571 E.09358
N12568 G1 X191.55 Y146.559 E.90901
N12569 G1 X191.55 Y150.452 E.12516
N12570 G1 X158.45 Y159.321 E1.1019
N12571 G1 X158.45 Y159.516 E.00628
N12572 G1 X191.55 Y192.615 E1.50523
N12573 G1 X191.55 Y192.596 E.00063
N12574 G1 X159.794 Y201.104 E1.05717
N12575 G1 X158.45 Y201.104 E.04321
N12576 G1 X158.45 Y196.096 E.16107
N12577 G1 X177.08 Y126.571 E2.31454
N12578 G1 X183.075 Y126.571 E.19279
N12579 G1 X191.55 Y135.045 E.3854
N12580 G1 X191.55 Y135.48 E.01399
N12581 G1 X173.966 Y201.104 E2.18467
N12582 G1 X177.011 Y201.104 E.09793
N12583 G1 X158.45 Y182.544 E.84407
N12584 G1 X158.45 Y184.607 E.06635
N12585 G1 X191.55 Y175.738 E1.1019
N12586 G1 X191.55 Y169.587 E.19779
N12587 G1 X158.45 Y136.488 E1.50523
N12588 G1 X158.45 Y142.463 E.19214
N12589 G1 X191.55 Y133.594 E1.1019
N12590 G1 X191.55 Y131.966 E.05236
N12591 ; WIPE_START
N12592 G1 X191.55 Y133.594 E-.61876
N12593 G1 X191.191 Y133.69 E-.14124
N12594 ; WIPE_END
N12595 G1 E-.04 F1800
N12596 M204 S10000
N12597 G17
N12598 G3 Z11.2 I1.217 J0 P1  F60000
N12599 ; stop printing object, unique label id: 229
N12600 M625
N12601 ; object ids of layer 54 start: 229
N12602 M624 AQAAAAAAAAA=
N12603 ;======== H2D 20250527========
N12604 ; SKIPPABLE_START
N12605 ; SKIPTYPE: timelapse
N12606 M622.1 S1 ; for prev firware, default turned on
N12607 
N12608 M1002 judge_flag timelapse_record_flag
N12609 
N12610 M622 J1
N12611 M993 A2 B2 C2
N12612 M993 A0 B0 C0
N12613 
N12614 
N12615 
N12616 
N12617     M9711 M0 E1 X260 Y141 Z11.2 S11 C10 O0 T3000
N12618 
N12619 
N12620 
N12621 M993 A3 B3 C3
N12622 
N12623 M623
N12624 ; SKIPPABLE_END
N12625 
N12626 ; object ids of this layer54 end: 229
N12627 M625
N12628 ; CHANGE_LAYER
N12629 ; Z_HEIGHT: 11
N12630 ; LAYER_HEIGHT: 0.2
N12631 ;======== H2D 20250521========
N12632 ; layer num/total_layer_count: 55/63
N12633 ; update layer progress
N12634 M73 L55
N12635 M991 S0 P54 ;notify layer change
N12636 
N12637 
N12638 ; OBJECT_ID: 229
N12639 ; COOLING_NODE: 0
N12640 ; start printing object, unique label id: 229
N12641 M624 AQAAAAAAAAA=
N12642 G1 X191.898 Y201.453 F60000
N12643 G1 Z11
N12644 G1 E.8 F1800
N12645 ; FEATURE: Inner wall
N12646 ; LINE_WIDTH: 0.45
N12647 ; LAYER_HEIGHT: 0.2
N12648 G1 F4421.739
N12649 M204 S8000
N12650 G1 X158.102 Y201.453 E1.08675
N12651 G1 X158.102 Y126.222 E2.41914
N12652 G1 X191.898 Y126.222 E1.08675
N12653 G1 X191.898 Y201.393 E2.41721
N12654 ; COOLING_NODE: 0
N12655 M204 S10000
N12656 G1 X192.29 Y201.845 F60000
N12657 ; FEATURE: Outer wall
N12658 ; LINE_WIDTH: 0.42
N12659 G1 F4773.528
N12660 M204 S5000
N12661 G1 X157.71 Y201.845 E1.03002
N12662 G1 X157.71 Y125.83 E2.26421
N12663 G1 X192.29 Y125.83 E1.03002
N12664 G1 X192.29 Y201.785 E2.26243
N12665 ; WIPE_START
N12666 M204 S8000
N12667 M73 P79 R9
N12668 G1 X190.29 Y201.788 E-.76
N12669 ; WIPE_END
N12670 G1 E-.04 F1800
N12671 M204 S10000
N12672 G1 X191.55 Y196.219 Z11.4 F60000
N12673 G1 Z11
N12674 G1 E.8 F1800
N12675 ; FEATURE: Sparse infill
N12676 ; LINE_WIDTH: 0.45
N12677 G1 F4421.739
N12678 M204 S8000
N12679 G1 X191.55 Y197.847 E.05236
N12680 G1 X190.677 Y201.104 E.10843
N12681 G1 X188.725 Y201.104 E.06277
N12682 G1 X158.45 Y170.83 E1.37678
N12683 G1 X158.45 Y167.896 E.09434
N12684 G1 X191.55 Y159.027 E1.1019
N12685 G1 X191.55 Y157.873 E.03709
N12686 G1 X160.247 Y126.571 E1.42352
N12687 G1 X160.076 Y126.571 E.00551
N12688 G1 X158.45 Y132.636 E.20192
N12689 G1 X158.45 Y134.181 E.04967
N12690 G1 X186.851 Y126.571 E.94549
N12691 G1 X191.55 Y126.571 E.15108
N12692 G1 X191.55 Y133.74 E.23056
N12693 G1 X158.45 Y142.609 E1.1019
N12694 G1 X158.45 Y136.288 E.20328
N12695 G1 X191.55 Y169.387 E1.50523
N12696 G1 X191.55 Y175.884 E.20893
N12697 G1 X158.45 Y184.753 E1.1019
N12698 G1 X158.45 Y182.344 E.07749
N12699 G1 X177.211 Y201.104 E.85317
N12700 G1 X173.819 Y201.104 E.10907
N12701 G1 X191.55 Y134.934 E2.20286
N12702 G1 X191.55 Y134.845 E.00285
N12703 G1 X183.275 Y126.571 E.3763
N12704 G1 X185.362 Y126.571 E.06711
N12705 G1 X165.391 Y201.104 E2.48129
N12706 G1 X165.697 Y201.104 E.00986
N12707 G1 X158.45 Y193.858 E.32956
N12708 G1 X158.45 Y193.182 E.02172
N12709 G1 X191.55 Y184.313 E1.1019
N12710 G1 X191.55 Y180.901 E.10972
N12711 G1 X158.45 Y147.802 E1.50523
N12712 G1 X158.45 Y151.038 E.10407
N12713 G1 X191.55 Y142.169 E1.1019
N12714 G1 X191.55 Y146.359 E.13474
N12715 G1 X171.761 Y126.571 E.89991
N12716 G1 X168.504 Y126.571 E.10472
N12717 G1 X158.45 Y164.093 E1.24913
N12718 G1 X158.45 Y165.721 E.05236
N12719 M204 S10000
N12720 G1 X158.45 Y177.953 F60000
N12721 G1 F4421.739
N12722 M204 S8000
N12723 G1 X158.45 Y176.325 E.05236
N12724 G1 X191.55 Y167.456 E1.1019
N12725 M204 S10000
N12726 G1 X191.55 Y164.762 F60000
N12727 G1 F4421.739
N12728 M204 S8000
N12729 M73 P80 R9
N12730 G1 X191.55 Y166.391 E.05236
N12731 G1 X182.248 Y201.104 E1.15564
N12732 G1 X183.876 Y201.104 E.05236
N12733 M204 S10000
N12734 G1 X191.55 Y152.226 F60000
N12735 G1 F4421.739
N12736 M204 S8000
N12737 G1 X191.55 Y150.598 E.05236
N12738 G1 X158.45 Y159.467 E1.1019
N12739 G1 X158.45 Y159.316 E.00486
N12740 G1 X191.55 Y192.415 E1.50523
N12741 G1 X191.55 Y192.742 E.01051
N12742 G1 X160.34 Y201.104 E1.03898
N12743 G1 X158.45 Y201.104 E.06078
N12744 G1 X158.45 Y195.549 E.17864
N12745 G1 X176.933 Y126.571 E2.29635
N12746 G1 X178.561 Y126.571 E.05236
N12747 ; WIPE_START
N12748 G1 X176.933 Y126.571 E-.61876
N12749 G1 X176.837 Y126.93 E-.14124
N12750 ; WIPE_END
N12751 G1 E-.04 F1800
N12752 M204 S10000
N12753 G17
N12754 G3 Z11.4 I1.217 J0 P1  F60000
N12755 ; stop printing object, unique label id: 229
N12756 M625
N12757 ; object ids of layer 55 start: 229
N12758 M624 AQAAAAAAAAA=
N12759 ;======== H2D 20250527========
N12760 ; SKIPPABLE_START
N12761 ; SKIPTYPE: timelapse
N12762 M622.1 S1 ; for prev firware, default turned on
N12763 
N12764 M1002 judge_flag timelapse_record_flag
N12765 
N12766 M622 J1
N12767 M993 A2 B2 C2
N12768 M993 A0 B0 C0
N12769 
N12770 
N12771 
N12772 
N12773     M9711 M0 E1 X260 Y141 Z11.4 S11 C10 O0 T3000
N12774 
N12775 
N12776 
N12777 M993 A3 B3 C3
N12778 
N12779 M623
N12780 ; SKIPPABLE_END
N12781 
N12782 ; object ids of this layer55 end: 229
N12783 M625
N12784 ; CHANGE_LAYER
N12785 ; Z_HEIGHT: 11.2
N12786 ; LAYER_HEIGHT: 0.2
N12787 ;======== H2D 20250521========
N12788 ; layer num/total_layer_count: 56/63
N12789 ; update layer progress
N12790 M73 L56
N12791 M991 S0 P55 ;notify layer change
N12792 
N12793 
N12794 ; OBJECT_ID: 229
N12795 ; COOLING_NODE: 0
N12796 ; start printing object, unique label id: 229
N12797 M624 AQAAAAAAAAA=
N12798 G1 X191.898 Y201.453 F60000
N12799 G1 Z11.2
N12800 G1 E.8 F1800
N12801 ; FEATURE: Inner wall
N12802 ; LINE_WIDTH: 0.45
N12803 ; LAYER_HEIGHT: 0.2
N12804 G1 F4421.739
N12805 M204 S8000
N12806 G1 X158.102 Y201.453 E1.08675
N12807 G1 X158.102 Y126.222 E2.41914
N12808 G1 X191.898 Y126.222 E1.08675
N12809 G1 X191.898 Y201.393 E2.41721
N12810 ; COOLING_NODE: 0
N12811 M204 S10000
N12812 G1 X192.29 Y201.845 F60000
N12813 ; FEATURE: Outer wall
N12814 ; LINE_WIDTH: 0.42
N12815 G1 F4773.528
N12816 M204 S5000
N12817 G1 X157.71 Y201.845 E1.03002
N12818 G1 X157.71 Y125.83 E2.26421
N12819 G1 X192.29 Y125.83 E1.03002
N12820 G1 X192.29 Y201.785 E2.26243
N12821 ; WIPE_START
N12822 M204 S8000
N12823 G1 X190.29 Y201.788 E-.76
N12824 ; WIPE_END
N12825 G1 E-.04 F1800
N12826 M204 S10000
N12827 G1 X191.55 Y195.673 Z11.6 F60000
N12828 G1 Z11.2
N12829 G1 E.8 F1800
N12830 ; FEATURE: Sparse infill
N12831 ; LINE_WIDTH: 0.45
N12832 G1 F4421.739
N12833 M204 S8000
N12834 G1 X191.55 Y197.301 E.05236
N12835 G1 X190.531 Y201.104 E.12662
N12836 G1 X188.925 Y201.104 E.05163
N12837 G1 X158.45 Y170.63 E1.38587
N12838 G1 X158.45 Y168.042 E.08321
N12839 G1 X191.55 Y159.173 E1.1019
N12840 G1 X191.55 Y157.673 E.04823
N12841 G1 X160.447 Y126.571 E1.41443
N12842 G1 X159.929 Y126.571 E.01665
N12843 G1 X158.45 Y132.089 E.18373
N12844 G1 X158.45 Y133.718 E.05236
N12845 M204 S10000
N12846 G1 X158.45 Y141.127 F60000
N12847 G1 F4421.739
N12848 M204 S8000
N12849 G1 X158.45 Y142.756 E.05236
N12850 G1 X191.55 Y133.887 E1.1019
N12851 G1 X191.55 Y126.571 E.23526
N12852 G1 X187.398 Y126.571 E.13351
N12853 G1 X158.45 Y134.327 E.96368
N12854 G1 X158.45 Y136.088 E.05662
N12855 G1 X191.55 Y169.187 E1.50523
N12856 G1 X191.55 Y167.602 E.05097
N12857 G1 X158.45 Y176.471 E1.1019
N12858 G1 X158.45 Y174.843 E.05236
N12859 M204 S10000
N12860 G1 X158.45 Y165.174 F60000
N12861 G1 F4421.739
N12862 M204 S8000
N12863 G1 X158.45 Y163.546 E.05236
N12864 G1 X168.358 Y126.571 E1.23094
N12865 G1 X171.961 Y126.571 E.11586
N12866 G1 X191.55 Y146.159 E.89082
N12867 G1 X191.55 Y142.316 E.1236
N12868 G1 X158.45 Y151.185 E1.1019
N12869 G1 X158.45 Y147.602 E.11521
N12870 G1 X191.55 Y180.701 E1.50523
N12871 G1 X191.55 Y184.46 E.12086
N12872 G1 X158.45 Y193.329 E1.1019
N12873 G1 X158.45 Y193.658 E.01058
N12874 G1 X165.897 Y201.104 E.33865
N12875 G1 X165.244 Y201.104 E.021
N12876 G1 X185.215 Y126.571 E2.48129
N12877 G1 X183.475 Y126.571 E.05597
N12878 G1 X191.55 Y134.645 E.36721
N12879 G1 X191.55 Y134.388 E.00829
N12880 G1 X173.673 Y201.104 E2.22105
N12881 G1 X177.411 Y201.104 E.12021
N12882 G1 X158.45 Y182.144 E.86226
N12883 G1 X158.45 Y184.9 E.08863
N12884 G1 X191.55 Y176.031 E1.1019
N12885 G1 X191.55 Y174.402 E.05236
N12886 M204 S10000
N12887 G1 X191.55 Y164.216 F60000
N12888 G1 F4421.739
N12889 M204 S8000
N12890 G1 X191.55 Y165.844 E.05236
N12891 G1 X182.102 Y201.104 E1.17383
N12892 G1 X183.73 Y201.104 E.05236
N12893 M204 S10000
N12894 G1 X191.55 Y152.373 F60000
N12895 G1 F4421.739
N12896 M204 S8000
N12897 G1 X191.55 Y150.744 E.05236
N12898 G1 X158.45 Y159.613 E1.1019
N12899 G1 X158.45 Y159.116 E.016
N12900 G1 X191.55 Y192.215 E1.50523
N12901 G1 X191.55 Y192.888 E.02165
N12902 G1 X160.887 Y201.104 E1.02079
N12903 G1 X158.45 Y201.104 E.07835
N12904 G1 X158.45 Y195.003 E.19621
N12905 G1 X176.787 Y126.571 E2.27816
N12906 G1 X178.415 Y126.571 E.05236
N12907 ; WIPE_START
N12908 G1 X176.787 Y126.571 E-.61876
N12909 G1 X176.69 Y126.93 E-.14124
N12910 ; WIPE_END
N12911 G1 E-.04 F1800
N12912 M204 S10000
N12913 G17
N12914 G3 Z11.6 I1.217 J0 P1  F60000
N12915 ; stop printing object, unique label id: 229
N12916 M625
N12917 ; object ids of layer 56 start: 229
N12918 M624 AQAAAAAAAAA=
N12919 ;======== H2D 20250527========
N12920 ; SKIPPABLE_START
N12921 ; SKIPTYPE: timelapse
N12922 M622.1 S1 ; for prev firware, default turned on
N12923 
N12924 M1002 judge_flag timelapse_record_flag
N12925 
N12926 M622 J1
N12927 M993 A2 B2 C2
N12928 M993 A0 B0 C0
N12929 
N12930 
N12931 
N12932 
N12933     M9711 M0 E1 X260 Y141 Z11.6 S11 C10 O0 T3000
N12934 
N12935 
N12936 
N12937 M993 A3 B3 C3
N12938 
N12939 M623
N12940 ; SKIPPABLE_END
N12941 
N12942 ; object ids of this layer56 end: 229
N12943 M625
N12944 ; CHANGE_LAYER
N12945 ; Z_HEIGHT: 11.4
N12946 ; LAYER_HEIGHT: 0.2
N12947 ;======== H2D 20250521========
N12948 ; layer num/total_layer_count: 57/63
N12949 ; update layer progress
N12950 M73 L57
N12951 M991 S0 P56 ;notify layer change
N12952 
N12953 
N12954 ; OBJECT_ID: 229
N12955 ; COOLING_NODE: 0
N12956 ; start printing object, unique label id: 229
N12957 M624 AQAAAAAAAAA=
N12958 G1 X191.898 Y201.453 F60000
N12959 G1 Z11.4
N12960 G1 E.8 F1800
N12961 ; FEATURE: Inner wall
N12962 ; LINE_WIDTH: 0.45
N12963 ; LAYER_HEIGHT: 0.2
N12964 G1 F4421.739
N12965 M204 S8000
N12966 G1 X158.102 Y201.453 E1.08675
N12967 G1 X158.102 Y126.222 E2.41914
N12968 G1 X191.898 Y126.222 E1.08675
N12969 G1 X191.898 Y201.393 E2.41721
N12970 ; COOLING_NODE: 0
N12971 M204 S10000
N12972 G1 X192.29 Y201.845 F60000
N12973 ; FEATURE: Outer wall
N12974 ; LINE_WIDTH: 0.42
N12975 G1 F4773.528
N12976 M204 S5000
N12977 G1 X157.71 Y201.845 E1.03002
N12978 G1 X157.71 Y125.83 E2.26421
N12979 G1 X192.29 Y125.83 E1.03002
N12980 G1 X192.29 Y201.785 E2.26243
N12981 ; WIPE_START
N12982 M204 S8000
N12983 G1 X190.29 Y201.788 E-.76
N12984 ; WIPE_END
N12985 G1 E-.04 F1800
N12986 M204 S10000
N12987 M73 P81 R9
N12988 G1 X191.55 Y195.126 Z11.8 F60000
N12989 G1 Z11.4
N12990 G1 E.8 F1800
N12991 ; FEATURE: Sparse infill
N12992 ; LINE_WIDTH: 0.45
N12993 G1 F4421.739
N12994 M204 S8000
N12995 G1 X191.55 Y196.755 E.05236
N12996 G1 X190.384 Y201.104 E.14481
N12997 G1 X189.125 Y201.104 E.04049
N12998 G1 X158.45 Y170.43 E1.39497
N12999 G1 X158.45 Y168.189 E.07207
N13000 G1 X191.55 Y159.32 E1.1019
N13001 G1 X191.55 Y157.473 E.05937
N13002 G1 X160.647 Y126.571 E1.40533
N13003 G1 X159.783 Y126.571 E.02779
N13004 G1 X158.45 Y131.543 E.16554
N13005 G1 X158.45 Y133.171 E.05236
N13006 M204 S10000
N13007 G1 X158.45 Y141.274 F60000
N13008 G1 F4421.739
N13009 M204 S8000
N13010 G1 X158.45 Y142.902 E.05236
N13011 G1 X191.55 Y134.033 E1.1019
N13012 G1 X191.55 Y133.841 E.00617
N13013 G1 X173.527 Y201.104 E2.23924
N13014 G1 X177.611 Y201.104 E.13135
N13015 G1 X158.45 Y181.944 E.87136
N13016 G1 X158.45 Y185.046 E.09977
N13017 G1 X191.55 Y176.177 E1.1019
N13018 G1 X191.55 Y174.549 E.05236
N13019 M204 S10000
N13020 G1 X191.55 Y163.67 F60000
N13021 G1 F4421.739
N13022 M204 S8000
N13023 G1 X191.55 Y165.298 E.05236
N13024 G1 X181.955 Y201.104 E1.19202
N13025 G1 X183.584 Y201.104 E.05236
N13026 M204 S10000
N13027 G1 X158.45 Y174.989 F60000
N13028 G1 F4421.739
N13029 M204 S8000
N13030 G1 X158.45 Y176.617 E.05236
N13031 G1 X191.55 Y167.748 E1.1019
N13032 G1 X191.55 Y168.987 E.03983
N13033 G1 X158.45 Y135.888 E1.50523
N13034 G1 X158.45 Y134.473 E.04548
N13035 G1 X187.944 Y126.571 E.98187
N13036 G1 X189.572 Y126.571 E.05236
N13037 M204 S10000
N13038 G1 X191.55 Y134.445 F60000
N13039 G1 F4421.739
N13040 M204 S8000
N13041 G1 X183.675 Y126.571 E.35811
N13042 G1 X185.069 Y126.571 E.04483
N13043 G1 X165.098 Y201.104 E2.48129
N13044 G1 X166.097 Y201.104 E.03214
N13045 G1 X158.45 Y193.458 E.34775
N13046 M204 S10000
N13047 G1 X158.45 Y193.475 F60000
N13048 G1 F4421.739
N13049 M204 S8000
N13050 G1 X191.55 Y184.606 E1.1019
N13051 G1 X191.55 Y180.501 E.132
N13052 G1 X158.45 Y147.402 E1.50523
N13053 G1 X158.45 Y151.331 E.12635
N13054 G1 X191.55 Y142.462 E1.1019
N13055 G1 X191.55 Y145.959 E.11246
N13056 G1 X172.161 Y126.571 E.88172
N13057 G1 X168.211 Y126.571 E.127
N13058 G1 X158.45 Y163 E1.21275
N13059 G1 X158.45 Y164.628 E.05236
N13060 M204 S10000
N13061 G1 X191.55 Y152.519 F60000
N13062 G1 F4421.739
N13063 M204 S8000
N13064 G1 X191.55 Y150.891 E.05236
N13065 G1 X158.45 Y159.76 E1.1019
N13066 G1 X158.45 Y158.916 E.02714
N13067 G1 X191.55 Y192.015 E1.50523
N13068 G1 X191.55 Y193.035 E.03279
N13069 G1 X161.433 Y201.104 E1.0026
N13070 G1 X158.45 Y201.104 E.09592
N13071 G1 X158.45 Y194.456 E.21378
N13072 G1 X176.64 Y126.571 E2.25997
N13073 G1 X178.269 Y126.571 E.05236
N13074 ; WIPE_START
N13075 G1 X176.64 Y126.571 E-.61876
N13076 G1 X176.544 Y126.93 E-.14124
N13077 ; WIPE_END
N13078 G1 E-.04 F1800
N13079 M204 S10000
N13080 G17
N13081 G3 Z11.8 I1.217 J0 P1  F60000
N13082 ; stop printing object, unique label id: 229
N13083 M625
N13084 ; object ids of layer 57 start: 229
N13085 M624 AQAAAAAAAAA=
N13086 ;======== H2D 20250527========
N13087 ; SKIPPABLE_START
N13088 ; SKIPTYPE: timelapse
N13089 M622.1 S1 ; for prev firware, default turned on
N13090 
N13091 M1002 judge_flag timelapse_record_flag
N13092 
N13093 M622 J1
N13094 M993 A2 B2 C2
N13095 M993 A0 B0 C0
N13096 
N13097 
N13098 
N13099 
N13100     M9711 M0 E1 X260 Y141 Z11.8 S11 C10 O0 T3000
N13101 
N13102 
N13103 
N13104 M993 A3 B3 C3
N13105 
N13106 M623
N13107 ; SKIPPABLE_END
N13108 
N13109 ; object ids of this layer57 end: 229
N13110 M625
N13111 ; CHANGE_LAYER
N13112 ; Z_HEIGHT: 11.6
N13113 ; LAYER_HEIGHT: 0.200001
N13114 ;======== H2D 20250521========
N13115 ; layer num/total_layer_count: 58/63
N13116 ; update layer progress
N13117 M73 L58
N13118 M991 S0 P57 ;notify layer change
N13119 
N13120 
N13121 M106 S61.2
N13122 ; OBJECT_ID: 229
N13123 ; COOLING_NODE: 0
N13124 ; start printing object, unique label id: 229
N13125 M624 AQAAAAAAAAA=
N13126 G1 X191.898 Y201.453 F60000
N13127 G1 Z11.6
N13128 G1 E.8 F1800
N13129 ; FEATURE: Inner wall
N13130 ; LINE_WIDTH: 0.45
N13131 ; LAYER_HEIGHT: 0.2
N13132 G1 F4421.739
N13133 M204 S8000
N13134 G1 X158.102 Y201.453 E1.08675
N13135 G1 X158.102 Y126.222 E2.41914
N13136 G1 X191.898 Y126.222 E1.08675
N13137 G1 X191.898 Y201.393 E2.41721
N13138 ; COOLING_NODE: 0
N13139 M204 S10000
N13140 G1 X192.29 Y201.845 F60000
N13141 ; FEATURE: Outer wall
N13142 ; LINE_WIDTH: 0.42
N13143 G1 F4773.528
N13144 M204 S5000
N13145 G1 X157.71 Y201.845 E1.03002
N13146 M73 P81 R8
N13147 G1 X157.71 Y125.83 E2.26421
N13148 G1 X192.29 Y125.83 E1.03002
N13149 G1 X192.29 Y201.785 E2.26243
N13150 ; WIPE_START
N13151 M204 S8000
N13152 G1 X190.29 Y201.788 E-.76
N13153 ; WIPE_END
N13154 G1 E-.04 F1800
N13155 M204 S10000
N13156 G1 X191.173 Y195.988 Z12 F60000
N13157 G1 Z11.6
N13158 G1 E.8 F1800
N13159 ; FEATURE: Sparse infill
N13160 ; LINE_WIDTH: 0.45
N13161 G1 F4421.739
N13162 M204 S8000
N13163 G1 X191.173 Y197.616 E.05236
N13164 G1 X190.339 Y200.727 E.10358
N13165 G1 X188.948 Y200.727 E.04473
N13166 G1 X158.827 Y170.607 E1.36976
N13167 G1 X158.827 Y168.234 E.07631
N13168 G1 X191.173 Y159.567 E1.07679
N13169 G1 X191.173 Y156.896 E.08589
N13170 G1 X161.224 Y126.948 E1.36193
N13171 G1 X159.535 Y126.948 E.05431
N13172 G1 X158.827 Y129.589 E.08793
N13173 G1 X158.827 Y131.217 E.05236
N13174 M204 S10000
N13175 G1 X166.336 Y126.948 F60000
N13176 G1 F4421.739
N13177 M204 S8000
N13178 G1 X167.964 Y126.948 E.05236
N13179 G1 X158.827 Y161.046 E1.13515
N13180 G1 X158.827 Y162.674 E.05236
N13181 M204 S10000
N13182 G1 X158.827 Y175.034 F60000
N13183 G1 F4421.739
N13184 M204 S8000
N13185 G1 X158.827 Y176.663 E.05236
N13186 G1 X191.173 Y167.996 E1.07679
N13187 G1 X191.173 Y168.41 E.01332
N13188 G1 X158.827 Y136.065 E1.47092
N13189 G1 X158.827 Y134.519 E.04972
N13190 G1 X187.083 Y126.948 E.94064
N13191 G1 X188.711 Y126.948 E.05236
N13192 M204 S10000
N13193 G1 X191.173 Y134.484 F60000
N13194 G1 F4421.739
N13195 M204 S8000
N13196 G1 X191.173 Y134.702 E.00702
N13197 G1 X173.481 Y200.727 E2.19801
N13198 G1 X177.434 Y200.727 E.12711
N13199 G1 X158.827 Y182.121 E.84615
N13200 G1 X158.827 Y185.091 E.09553
N13201 G1 X191.173 Y176.425 E1.07679
N13202 G1 X191.173 Y179.924 E.11253
N13203 G1 X158.827 Y147.579 E1.47092
N13204 G1 X158.827 Y151.376 E.12211
N13205 G1 X191.173 Y142.709 E1.07679
N13206 G1 X191.173 Y145.382 E.08594
N13207 G1 X172.738 Y126.948 E.83832
N13208 G1 X176.393 Y126.948 E.11752
N13209 G1 X158.827 Y192.502 E2.18236
N13210 G1 X158.827 Y193.317 E.02619
N13211 M204 S10000
N13212 G1 X158.465 Y200.931 F60000
N13213 ; FEATURE: Floating vertical shell
N13214 ; LINE_WIDTH: 0.383003
N13215 G1 F5292.831
N13216 M204 S8000
N13217 M73 P82 R8
N13218 G1 X158.492 Y201.063 E.00362
N13219 G1 X158.624 Y201.09 E.00362
N13220 G1 X191.376 Y201.09 E.87985
N13221 G1 X191.508 Y201.063 E.00362
N13222 G1 X191.535 Y200.931 E.00362
N13223 G1 X191.535 Y126.744 E1.99296
N13224 G1 X191.508 Y126.612 E.00362
N13225 G1 X191.376 Y126.585 E.00362
N13226 G1 X158.624 Y126.585 E.87985
N13227 G1 X158.492 Y126.612 E.00362
N13228 G1 X158.465 Y126.744 E.00362
N13229 G1 X158.465 Y200.871 E1.99134
N13230 M204 S10000
N13231 G1 X161.759 Y200.727 F60000
N13232 ; FEATURE: Sparse infill
N13233 ; LINE_WIDTH: 0.45
N13234 G1 F4421.739
N13235 M204 S8000
N13236 G1 X163.387 Y200.727 E.05236
N13237 G1 X191.173 Y193.282 E.92499
N13238 G1 X191.173 Y191.438 E.05931
N13239 G1 X158.827 Y159.093 E1.47092
N13240 G1 X158.827 Y157.465 E.05236
N13241 M204 S10000
N13242 G1 X158.827 Y159.805 F60000
N13243 G1 F4421.739
N13244 M204 S8000
N13245 G1 X191.173 Y151.138 E1.07679
N13246 G1 X191.173 Y152.767 E.05236
N13247 M204 S10000
N13248 G1 X191.173 Y164.531 F60000
N13249 G1 F4421.739
N13250 M204 S8000
N13251 G1 X191.173 Y166.159 E.05236
N13252 G1 X181.91 Y200.727 E1.1508
N13253 G1 X183.538 Y200.727 E.05236
N13254 M204 S10000
N13255 G1 X191.173 Y186.482 F60000
N13256 G1 F4421.739
N13257 M204 S8000
N13258 G1 X191.173 Y184.853 E.05236
N13259 G1 X158.827 Y193.52 E1.07679
N13260 G1 X158.827 Y193.635 E.00368
N13261 G1 X165.92 Y200.727 E.32254
N13262 G1 X165.052 Y200.727 E.0279
N13263 G1 X184.822 Y126.948 E2.45618
N13264 G1 X184.252 Y126.948 E.01831
N13265 G1 X191.173 Y133.868 E.31471
N13266 G1 X191.173 Y134.281 E.01326
N13267 G1 X158.827 Y142.947 E1.07679
N13268 G1 X158.827 Y141.319 E.05236
N13269 ; WIPE_START
N13270 G1 X158.827 Y142.947 E-.61876
N13271 G1 X159.187 Y142.851 E-.14124
N13272 ; WIPE_END
N13273 G1 E-.04 F1800
N13274 M204 S10000
N13275 G17
N13276 G3 Z12 I1.217 J0 P1  F60000
N13277 ; stop printing object, unique label id: 229
N13278 M625
N13279 ; object ids of layer 58 start: 229
N13280 M624 AQAAAAAAAAA=
N13281 ;======== H2D 20250527========
N13282 ; SKIPPABLE_START
N13283 ; SKIPTYPE: timelapse
N13284 M622.1 S1 ; for prev firware, default turned on
N13285 
N13286 M1002 judge_flag timelapse_record_flag
N13287 
N13288 M622 J1
N13289 M993 A2 B2 C2
N13290 M993 A0 B0 C0
N13291 
N13292 
N13293 
N13294 
N13295     M9711 M0 E1 X260 Y141 Z12 S11 C10 O0 T3000
N13296 
N13297 
N13298 
N13299 M993 A3 B3 C3
N13300 
N13301 M623
N13302 ; SKIPPABLE_END
N13303 
N13304 ; object ids of this layer58 end: 229
N13305 M625
N13306 ; CHANGE_LAYER
N13307 ; Z_HEIGHT: 11.8
N13308 ; LAYER_HEIGHT: 0.2
N13309 ;======== H2D 20250521========
N13310 ; layer num/total_layer_count: 59/63
N13311 ; update layer progress
N13312 M73 L59
N13313 M991 S0 P58 ;notify layer change
N13314 
N13315 
N13316 M106 S25.5
N13317 ; OBJECT_ID: 229
N13318 ; COOLING_NODE: 0
N13319 ; start printing object, unique label id: 229
N13320 M624 AQAAAAAAAAA=
N13321 G1 X191.898 Y201.453 F60000
N13322 G1 Z11.8
N13323 G1 E.8 F1800
N13324 ; FEATURE: Inner wall
N13325 ; LINE_WIDTH: 0.45
N13326 ; LAYER_HEIGHT: 0.2
N13327 G1 F4421.739
N13328 M204 S8000
N13329 G1 X158.102 Y201.453 E1.08675
N13330 G1 X158.102 Y126.222 E2.41914
N13331 G1 X191.898 Y126.222 E1.08675
N13332 G1 X191.898 Y201.393 E2.41721
N13333 ; COOLING_NODE: 0
N13334 M204 S10000
N13335 G1 X192.29 Y201.845 F60000
N13336 ; FEATURE: Outer wall
N13337 ; LINE_WIDTH: 0.42
N13338 G1 F4773.528
N13339 M204 S5000
N13340 G1 X157.71 Y201.845 E1.03002
N13341 G1 X157.71 Y125.83 E2.26421
N13342 G1 X192.29 Y125.83 E1.03002
N13343 G1 X192.29 Y201.785 E2.26243
N13344 ; WIPE_START
N13345 M204 S8000
N13346 G1 X190.29 Y201.788 E-.76
N13347 ; WIPE_END
N13348 G1 E-.04 F1800
N13349 M204 S10000
N13350 G1 X182.663 Y201.509 Z12.2 F60000
N13351 G1 X158.269 Y200.615 Z12.2
N13352 G1 Z11.8
N13353 G1 E.8 F1800
N13354 ; FEATURE: Bridge
N13355 ; LINE_WIDTH: 0.40033
N13356 ; LAYER_HEIGHT: 0.4
N13357 M106 S229.5
N13358 G1 F2860.068
N13359 M204 S8000
N13360 G1 X160.017 Y201.083 E.08996
N13361 G1 X161.757 Y201.083 E.0865
N13362 G1 X158.472 Y200.203 E.16909
N13363 G1 X158.472 Y199.736 E.02318
N13364 G1 X163.497 Y201.083 E.25864
N13365 G1 X165.237 Y201.083 E.0865
N13366 G1 X158.472 Y199.27 E.34819
N13367 G1 X158.472 Y198.804 E.02318
N13368 G1 X166.977 Y201.083 E.43775
N13369 G1 X168.717 Y201.083 E.0865
N13370 G1 X158.472 Y198.338 E.5273
N13371 G1 X158.472 Y197.872 E.02318
N13372 G1 X170.457 Y201.083 E.61685
N13373 G1 X172.197 Y201.083 E.0865
N13374 G1 X158.472 Y197.405 E.7064
N13375 G1 X158.472 Y196.939 E.02318
N13376 G1 X173.937 Y201.083 E.79595
N13377 G1 X175.677 Y201.083 E.0865
N13378 G1 X158.472 Y196.473 E.8855
N13379 G1 X158.472 Y196.007 E.02318
N13380 G1 X177.417 Y201.083 E.97505
N13381 G1 X179.156 Y201.083 E.0865
N13382 G1 X158.472 Y195.541 E1.06461
N13383 G1 X158.472 Y195.074 E.02318
N13384 G1 X180.896 Y201.083 E1.15416
N13385 G1 X182.636 Y201.083 E.0865
N13386 G1 X158.472 Y194.608 E1.24371
N13387 G1 X158.472 Y194.142 E.02318
N13388 G1 X184.376 Y201.083 E1.33326
N13389 G1 X186.116 Y201.083 E.0865
N13390 G1 X158.472 Y193.676 E1.42281
N13391 G1 X158.472 Y193.209 E.02318
N13392 G1 X187.856 Y201.083 E1.51237
N13393 G1 X189.596 Y201.083 E.0865
N13394 G1 X158.472 Y192.743 E1.60192
N13395 G1 X158.472 Y192.277 E.02318
N13396 G1 X191.336 Y201.083 E1.69147
N13397 G1 X191.528 Y201.083 E.00955
N13398 G1 X191.528 Y200.668 E.02062
N13399 G1 X158.472 Y191.811 E1.70136
N13400 G1 X158.472 Y191.345 E.02318
N13401 G1 X191.528 Y200.202 E1.70136
N13402 G1 X191.528 Y199.736 E.02318
N13403 G1 X158.472 Y190.878 E1.70136
N13404 G1 X158.472 Y190.412 E.02318
N13405 G1 X191.528 Y199.27 E1.70136
N13406 G1 X191.528 Y198.803 E.02318
N13407 G1 X158.472 Y189.946 E1.70136
N13408 G1 X158.472 Y189.48 E.02318
N13409 G1 X191.528 Y198.337 E1.70136
N13410 G1 X191.528 Y197.871 E.02318
N13411 G1 X158.472 Y189.013 E1.70136
N13412 G1 X158.472 Y188.547 E.02318
N13413 G1 X191.528 Y197.405 E1.70136
N13414 G1 X191.528 Y196.939 E.02318
N13415 G1 X158.472 Y188.081 E1.70136
N13416 G1 X158.472 Y187.615 E.02318
N13417 G1 X191.528 Y196.472 E1.70136
N13418 G1 X191.528 Y196.006 E.02318
N13419 G1 X158.472 Y187.149 E1.70136
N13420 G1 X158.472 Y186.682 E.02318
N13421 M73 P83 R8
N13422 G1 X191.528 Y195.54 E1.70136
N13423 G1 X191.528 Y195.074 E.02318
N13424 G1 X158.472 Y186.216 E1.70136
N13425 G1 X158.472 Y185.75 E.02318
N13426 G1 X191.528 Y194.607 E1.70136
N13427 G1 X191.528 Y194.141 E.02318
N13428 G1 X158.472 Y185.284 E1.70136
N13429 G1 X158.472 Y184.818 E.02318
N13430 G1 X191.528 Y193.675 E1.70136
N13431 G1 X191.528 Y193.209 E.02318
N13432 G1 X158.472 Y184.351 E1.70136
N13433 G1 X158.472 Y183.885 E.02318
N13434 G1 X191.528 Y192.743 E1.70136
N13435 G1 X191.528 Y192.276 E.02318
N13436 G1 X158.472 Y183.419 E1.70136
N13437 G1 X158.472 Y182.953 E.02318
N13438 G1 X191.528 Y191.81 E1.70136
N13439 G1 X191.528 Y191.344 E.02318
N13440 G1 X158.472 Y182.486 E1.70136
N13441 G1 X158.472 Y182.02 E.02318
N13442 G1 X191.528 Y190.878 E1.70136
N13443 G1 X191.528 Y190.411 E.02318
N13444 G1 X158.472 Y181.554 E1.70136
N13445 G1 X158.472 Y181.088 E.02318
N13446 G1 X191.528 Y189.945 E1.70136
N13447 G1 X191.528 Y189.479 E.02318
N13448 G1 X158.472 Y180.622 E1.70136
N13449 G1 X158.472 Y180.155 E.02318
N13450 G1 X191.528 Y189.013 E1.70136
N13451 G1 X191.528 Y188.547 E.02318
N13452 G1 X158.472 Y179.689 E1.70136
N13453 G1 X158.472 Y179.223 E.02318
N13454 G1 X191.528 Y188.08 E1.70136
N13455 G1 X191.528 Y187.614 E.02318
N13456 G1 X158.472 Y178.757 E1.70136
N13457 G1 X158.472 Y178.291 E.02318
N13458 G1 X191.528 Y187.148 E1.70136
N13459 G1 X191.528 Y186.682 E.02318
N13460 G1 X158.472 Y177.824 E1.70136
N13461 G1 X158.472 Y177.358 E.02318
N13462 G1 X191.528 Y186.216 E1.70136
N13463 G1 X191.528 Y185.749 E.02318
N13464 G1 X158.472 Y176.892 E1.70136
N13465 G1 X158.472 Y176.426 E.02318
N13466 G1 X191.528 Y185.283 E1.70136
N13467 G1 X191.528 Y184.817 E.02318
N13468 G1 X158.472 Y175.959 E1.70136
N13469 G1 X158.472 Y175.493 E.02318
N13470 G1 X191.528 Y184.351 E1.70136
N13471 G1 X191.528 Y183.884 E.02318
N13472 G1 X158.472 Y175.027 E1.70136
N13473 G1 X158.472 Y174.561 E.02318
N13474 M73 P83 R7
N13475 G1 X191.528 Y183.418 E1.70136
N13476 G1 X191.528 Y182.952 E.02318
N13477 G1 X158.472 Y174.095 E1.70136
N13478 G1 X158.472 Y173.628 E.02318
N13479 G1 X191.528 Y182.486 E1.70136
N13480 G1 X191.528 Y182.02 E.02318
N13481 G1 X158.472 Y173.162 E1.70136
N13482 G1 X158.472 Y172.696 E.02318
N13483 G1 X191.528 Y181.553 E1.70136
N13484 G1 X191.528 Y181.087 E.02318
N13485 G1 X158.472 Y172.23 E1.70136
N13486 G1 X158.472 Y171.763 E.02318
N13487 G1 X191.528 Y180.621 E1.70136
N13488 G1 X191.528 Y180.155 E.02318
N13489 G1 X158.472 Y171.297 E1.70136
N13490 G1 X158.472 Y170.831 E.02318
N13491 G1 X191.528 Y179.689 E1.70136
N13492 G1 X191.528 Y179.222 E.02318
N13493 G1 X158.472 Y170.365 E1.70136
N13494 G1 X158.472 Y169.899 E.02318
N13495 G1 X191.528 Y178.756 E1.70136
N13496 G1 X191.528 Y178.29 E.02318
N13497 G1 X158.472 Y169.432 E1.70136
N13498 G1 X158.472 Y168.966 E.02318
N13499 G1 X191.528 Y177.824 E1.70136
N13500 G1 X191.528 Y177.357 E.02318
N13501 G1 X158.472 Y168.5 E1.70136
N13502 G1 X158.472 Y168.034 E.02318
N13503 M73 P84 R7
N13504 G1 X191.528 Y176.891 E1.70136
N13505 G1 X191.528 Y176.425 E.02318
N13506 G1 X158.472 Y167.568 E1.70136
N13507 G1 X158.472 Y167.101 E.02318
N13508 G1 X191.528 Y175.959 E1.70136
N13509 G1 X191.528 Y175.493 E.02318
N13510 G1 X158.472 Y166.635 E1.70136
N13511 G1 X158.472 Y166.169 E.02318
N13512 G1 X191.528 Y175.026 E1.70136
N13513 G1 X191.528 Y174.56 E.02318
N13514 G1 X158.472 Y165.703 E1.70136
N13515 G1 X158.472 Y165.236 E.02318
N13516 G1 X191.528 Y174.094 E1.70136
N13517 G1 X191.528 Y173.628 E.02318
N13518 G1 X158.472 Y164.77 E1.70136
N13519 G1 X158.472 Y164.304 E.02318
N13520 G1 X191.528 Y173.161 E1.70136
N13521 G1 X191.528 Y172.695 E.02318
N13522 G1 X158.472 Y163.838 E1.70136
N13523 G1 X158.472 Y163.372 E.02318
N13524 G1 X191.528 Y172.229 E1.70136
N13525 G1 X191.528 Y171.763 E.02318
N13526 G1 X158.472 Y162.905 E1.70136
N13527 G1 X158.472 Y162.439 E.02318
N13528 G1 X191.528 Y171.297 E1.70136
N13529 G1 X191.528 Y170.83 E.02318
N13530 G1 X158.472 Y161.973 E1.70136
N13531 G1 X158.472 Y161.507 E.02318
N13532 G1 X191.528 Y170.364 E1.70136
N13533 G1 X191.528 Y169.898 E.02318
N13534 G1 X158.472 Y161.041 E1.70136
N13535 G1 X158.472 Y160.574 E.02318
N13536 G1 X191.528 Y169.432 E1.70136
N13537 G1 X191.528 Y168.966 E.02318
N13538 G1 X158.472 Y160.108 E1.70136
N13539 G1 X158.472 Y159.642 E.02318
N13540 G1 X191.528 Y168.499 E1.70136
N13541 G1 X191.528 Y168.033 E.02318
N13542 G1 X158.472 Y159.176 E1.70136
N13543 G1 X158.472 Y158.709 E.02318
N13544 G1 X191.528 Y167.567 E1.70136
N13545 G1 X191.528 Y167.101 E.02318
N13546 G1 X158.472 Y158.243 E1.70136
N13547 G1 X158.472 Y157.777 E.02318
N13548 G1 X191.528 Y166.634 E1.70136
N13549 G1 X191.528 Y166.168 E.02318
N13550 G1 X158.472 Y157.311 E1.70136
N13551 G1 X158.472 Y156.845 E.02318
N13552 G1 X191.528 Y165.702 E1.70136
N13553 G1 X191.528 Y165.236 E.02318
N13554 G1 X158.472 Y156.378 E1.70136
N13555 G1 X158.472 Y155.912 E.02318
N13556 G1 X191.528 Y164.77 E1.70136
N13557 G1 X191.528 Y164.303 E.02318
N13558 G1 X158.472 Y155.446 E1.70136
N13559 G1 X158.472 Y154.98 E.02318
N13560 G1 X191.528 Y163.837 E1.70136
N13561 G1 X191.528 Y163.371 E.02318
N13562 G1 X158.472 Y154.514 E1.70136
N13563 G1 X158.472 Y154.047 E.02318
N13564 G1 X191.528 Y162.905 E1.70136
N13565 G1 X191.528 Y162.439 E.02318
N13566 G1 X158.472 Y153.581 E1.70136
N13567 G1 X158.472 Y153.115 E.02318
N13568 G1 X191.528 Y161.972 E1.70136
N13569 G1 X191.528 Y161.506 E.02318
N13570 G1 X158.472 Y152.649 E1.70136
N13571 G1 X158.472 Y152.182 E.02318
N13572 G1 X191.528 Y161.04 E1.70136
N13573 G1 X191.528 Y160.574 E.02318
N13574 G1 X158.472 Y151.716 E1.70136
N13575 G1 X158.472 Y151.25 E.02318
N13576 G1 X191.528 Y160.107 E1.70136
N13577 G1 X191.528 Y159.641 E.02318
N13578 G1 X158.472 Y150.784 E1.70136
N13579 G1 X158.472 Y150.318 E.02318
N13580 G1 X191.528 Y159.175 E1.70136
N13581 G1 X191.528 Y158.709 E.02318
N13582 G1 X158.472 Y149.851 E1.70136
N13583 G1 X158.472 Y149.385 E.02318
N13584 M73 P85 R7
N13585 G1 X191.528 Y158.243 E1.70136
N13586 G1 X191.528 Y157.776 E.02318
N13587 G1 X158.472 Y148.919 E1.70136
N13588 G1 X158.472 Y148.453 E.02318
N13589 G1 X191.528 Y157.31 E1.70136
N13590 G1 X191.528 Y156.844 E.02318
N13591 G1 X158.472 Y147.986 E1.70136
N13592 G1 X158.472 Y147.52 E.02318
N13593 G1 X191.528 Y156.378 E1.70136
N13594 G1 X191.528 Y155.912 E.02318
N13595 G1 X158.472 Y147.054 E1.70136
N13596 G1 X158.472 Y146.588 E.02318
N13597 G1 X191.528 Y155.445 E1.70136
N13598 G1 X191.528 Y154.979 E.02318
N13599 G1 X158.472 Y146.122 E1.70136
N13600 G1 X158.472 Y145.655 E.02318
N13601 G1 X191.528 Y154.513 E1.70136
N13602 G1 X191.528 Y154.047 E.02318
N13603 G1 X158.472 Y145.189 E1.70136
N13604 G1 X158.472 Y144.723 E.02318
N13605 G1 X191.528 Y153.58 E1.70136
N13606 G1 X191.528 Y153.114 E.02318
N13607 G1 X158.472 Y144.257 E1.70136
N13608 G1 X158.472 Y143.791 E.02318
N13609 G1 X191.528 Y152.648 E1.70136
N13610 G1 X191.528 Y152.182 E.02318
N13611 G1 X158.472 Y143.324 E1.70136
N13612 G1 X158.472 Y142.858 E.02318
N13613 G1 X191.528 Y151.716 E1.70136
N13614 G1 X191.528 Y151.249 E.02318
N13615 G1 X158.472 Y142.392 E1.70136
N13616 G1 X158.472 Y141.926 E.02318
N13617 G1 X191.528 Y150.783 E1.70136
N13618 G1 X191.528 Y150.317 E.02318
N13619 G1 X158.472 Y141.459 E1.70136
N13620 G1 X158.472 Y140.993 E.02318
N13621 G1 X191.528 Y149.851 E1.70136
N13622 G1 X191.528 Y149.384 E.02318
N13623 G1 X158.472 Y140.527 E1.70136
N13624 G1 X158.472 Y140.061 E.02318
N13625 G1 X191.528 Y148.918 E1.70136
N13626 G1 X191.528 Y148.452 E.02318
N13627 G1 X158.472 Y139.595 E1.70136
N13628 G1 X158.472 Y139.128 E.02318
N13629 G1 X191.528 Y147.986 E1.70136
N13630 G1 X191.528 Y147.52 E.02318
N13631 G1 X158.472 Y138.662 E1.70136
N13632 G1 X158.472 Y138.196 E.02318
N13633 G1 X191.528 Y147.053 E1.70136
N13634 G1 X191.528 Y146.587 E.02318
N13635 G1 X158.472 Y137.73 E1.70136
N13636 G1 X158.472 Y137.264 E.02318
N13637 G1 X191.528 Y146.121 E1.70136
N13638 G1 X191.528 Y145.655 E.02318
N13639 G1 X158.472 Y136.797 E1.70136
N13640 G1 X158.472 Y136.331 E.02318
N13641 M73 P85 R6
N13642 G1 X191.528 Y145.189 E1.70136
N13643 G1 X191.528 Y144.722 E.02318
N13644 G1 X158.472 Y135.865 E1.70136
N13645 G1 X158.472 Y135.399 E.02318
N13646 G1 X191.528 Y144.256 E1.70136
N13647 G1 X191.528 Y143.79 E.02318
N13648 G1 X158.472 Y134.932 E1.70136
N13649 G1 X158.472 Y134.466 E.02318
N13650 G1 X191.528 Y143.324 E1.70136
N13651 G1 X191.528 Y142.857 E.02318
N13652 G1 X158.472 Y134 E1.70136
N13653 G1 X158.472 Y133.534 E.02318
N13654 G1 X191.528 Y142.391 E1.70136
N13655 G1 X191.528 Y141.925 E.02318
N13656 G1 X158.472 Y133.068 E1.70136
N13657 G1 X158.472 Y132.601 E.02318
N13658 G1 X191.528 Y141.459 E1.70136
N13659 G1 X191.528 Y140.993 E.02318
N13660 G1 X158.472 Y132.135 E1.70136
N13661 G1 X158.472 Y131.669 E.02318
N13662 G1 X191.528 Y140.526 E1.70136
N13663 G1 X191.528 Y140.06 E.02318
N13664 G1 X158.472 Y131.203 E1.70136
N13665 G1 X158.472 Y130.736 E.02318
N13666 M73 P86 R6
N13667 G1 X191.528 Y139.594 E1.70136
N13668 G1 X191.528 Y139.128 E.02318
N13669 G1 X158.472 Y130.27 E1.70136
N13670 G1 X158.472 Y129.804 E.02318
N13671 G1 X191.528 Y138.662 E1.70136
N13672 G1 X191.528 Y138.195 E.02318
N13673 G1 X158.472 Y129.338 E1.70136
N13674 G1 X158.472 Y128.872 E.02318
N13675 G1 X191.528 Y137.729 E1.70136
N13676 G1 X191.528 Y137.263 E.02318
N13677 G1 X158.472 Y128.405 E1.70136
N13678 G1 X158.472 Y127.939 E.02318
N13679 G1 X191.528 Y136.797 E1.70136
N13680 G1 X191.528 Y136.33 E.02318
N13681 G1 X158.472 Y127.473 E1.70136
N13682 G1 X158.472 Y127.007 E.02318
N13683 G1 X191.528 Y135.864 E1.70136
N13684 G1 X191.528 Y135.398 E.02318
N13685 G1 X158.664 Y126.592 E1.69147
N13686 G1 X160.404 Y126.592 E.0865
N13687 G1 X191.528 Y134.932 E1.60192
N13688 G1 X191.528 Y134.466 E.02318
N13689 G1 X162.144 Y126.592 E1.51237
N13690 G1 X163.884 Y126.592 E.0865
N13691 G1 X191.528 Y133.999 E1.42282
N13692 G1 X191.528 Y133.533 E.02318
N13693 G1 X165.624 Y126.592 E1.33327
N13694 G1 X167.364 Y126.592 E.0865
N13695 G1 X191.528 Y133.067 E1.24372
N13696 G1 X191.528 Y132.601 E.02318
N13697 G1 X169.103 Y126.592 E1.15416
N13698 G1 X170.843 Y126.592 E.0865
N13699 G1 X191.528 Y132.134 E1.06461
N13700 G1 X191.528 Y131.668 E.02318
N13701 G1 X172.583 Y126.592 E.97506
N13702 G1 X174.323 Y126.592 E.0865
N13703 G1 X191.528 Y131.202 E.88551
N13704 G1 X191.528 Y130.736 E.02318
N13705 G1 X176.063 Y126.592 E.79596
N13706 G1 X177.803 Y126.592 E.0865
N13707 G1 X191.528 Y130.27 E.70641
N13708 G1 X191.528 Y129.803 E.02318
N13709 G1 X179.543 Y126.592 E.61686
N13710 G1 X181.283 Y126.592 E.0865
N13711 G1 X191.528 Y129.337 E.5273
N13712 G1 X191.528 Y128.871 E.02318
N13713 G1 X183.023 Y126.592 E.43775
N13714 G1 X184.763 Y126.592 E.0865
N13715 G1 X191.528 Y128.405 E.3482
N13716 G1 X191.528 Y127.939 E.02318
N13717 G1 X186.503 Y126.592 E.25865
N13718 G1 X188.243 Y126.592 E.0865
N13719 G1 X191.528 Y127.472 E.1691
N13720 G1 X191.528 Y127.006 E.02318
N13721 G1 X189.227 Y126.389 E.11844
N13722 M106 S25.5
N13723 ; WIPE_START
N13724 G1 X191.159 Y126.907 E-.76
N13725 ; WIPE_END
N13726 G1 E-.04 F1800
N13727 M204 S10000
N13728 G17
N13729 G3 Z12.2 I1.217 J0 P1  F60000
N13730 ; stop printing object, unique label id: 229
N13731 M625
N13732 ; object ids of layer 59 start: 229
N13733 M624 AQAAAAAAAAA=
N13734 ;======== H2D 20250527========
N13735 ; SKIPPABLE_START
N13736 ; SKIPTYPE: timelapse
N13737 M622.1 S1 ; for prev firware, default turned on
N13738 
N13739 M1002 judge_flag timelapse_record_flag
N13740 
N13741 M622 J1
N13742 M993 A2 B2 C2
N13743 M993 A0 B0 C0
N13744 
N13745 
N13746 
N13747 
N13748     M9711 M0 E1 X260 Y141 Z12.2 S11 C10 O0 T3000
N13749 
N13750 
N13751 
N13752 M993 A3 B3 C3
N13753 
N13754 M623
N13755 ; SKIPPABLE_END
N13756 
N13757 ; object ids of this layer59 end: 229
N13758 M625
N13759 ; CHANGE_LAYER
N13760 ; Z_HEIGHT: 12
N13761 ; LAYER_HEIGHT: 0.2
N13762 ;======== H2D 20250521========
N13763 ; layer num/total_layer_count: 60/63
N13764 ; update layer progress
N13765 M73 L60
N13766 M991 S0 P59 ;notify layer change
N13767 
N13768 
N13769 ; OBJECT_ID: 229
N13770 ; COOLING_NODE: 0
N13771 ; start printing object, unique label id: 229
N13772 M624 AQAAAAAAAAA=
N13773 G1 X191.898 Y201.453 F60000
N13774 G1 Z12
N13775 G1 E.8 F1800
N13776 ; FEATURE: Inner wall
N13777 ; LINE_WIDTH: 0.45
N13778 ; LAYER_HEIGHT: 0.2
N13779 G1 F4421.739
N13780 M204 S8000
N13781 G1 X158.102 Y201.453 E1.08675
N13782 G1 X158.102 Y126.222 E2.41914
N13783 G1 X191.898 Y126.222 E1.08675
N13784 G1 X191.898 Y201.393 E2.41721
N13785 ; COOLING_NODE: 0
N13786 M204 S10000
N13787 G1 X192.29 Y201.845 F60000
N13788 ; FEATURE: Outer wall
N13789 ; LINE_WIDTH: 0.42
N13790 G1 F4773.528
N13791 M204 S5000
N13792 G1 X157.71 Y201.845 E1.03002
N13793 G1 X157.71 Y125.83 E2.26421
N13794 G1 X192.29 Y125.83 E1.03002
N13795 G1 X192.29 Y201.785 E2.26243
N13796 ; WIPE_START
N13797 M204 S8000
N13798 G1 X190.29 Y201.788 E-.76
N13799 ; WIPE_END
N13800 G1 E-.04 F1800
N13801 M204 S10000
N13802 G1 X190.971 Y201.289 Z12.4 F60000
N13803 G1 Z12
N13804 G1 E.8 F1800
N13805 ; FEATURE: Internal solid infill
N13806 ; LINE_WIDTH: 0.42067
N13807 G1 F4765.056
N13808 M204 S8000
N13809 G1 X191.565 Y200.695 E.02507
N13810 G1 X191.565 Y200.161 E.01594
N13811 G1 X190.606 Y201.119 E.04045
N13812 G1 X190.072 Y201.119 E.01594
N13813 G1 X191.565 Y199.627 E.06299
N13814 G1 X191.565 Y199.092 E.01594
N13815 G1 X189.538 Y201.119 E.08554
N13816 G1 X189.003 Y201.119 E.01594
N13817 G1 X191.565 Y198.558 E.10808
N13818 G1 X191.565 Y198.024 E.01594
N13819 G1 X188.469 Y201.119 E.13063
N13820 G1 X187.935 Y201.119 E.01594
N13821 G1 X191.565 Y197.49 E.15317
N13822 G1 X191.565 Y196.956 E.01594
N13823 G1 X187.401 Y201.119 E.17571
N13824 G1 X186.867 Y201.119 E.01594
N13825 G1 X191.565 Y196.421 E.19826
N13826 G1 X191.565 Y195.887 E.01594
N13827 G1 X186.332 Y201.119 E.2208
N13828 G1 X185.798 Y201.119 E.01594
N13829 G1 X191.565 Y195.353 E.24334
N13830 G1 X191.565 Y194.819 E.01594
N13831 G1 X185.264 Y201.119 E.26589
N13832 G1 X184.73 Y201.119 E.01594
N13833 G1 X191.565 Y194.284 E.28843
N13834 G1 X191.565 Y193.75 E.01594
N13835 G1 X184.195 Y201.119 E.31098
N13836 G1 X183.661 Y201.119 E.01594
N13837 G1 X191.565 Y193.216 E.33352
N13838 G1 X191.565 Y192.682 E.01594
N13839 G1 X183.127 Y201.119 E.35606
N13840 G1 X182.593 Y201.119 E.01594
N13841 G1 X191.565 Y192.148 E.37861
N13842 G1 X191.565 Y191.613 E.01594
N13843 G1 X182.059 Y201.119 E.40115
N13844 G1 X181.524 Y201.119 E.01594
N13845 G1 X191.565 Y191.079 E.42369
N13846 G1 X191.565 Y190.545 E.01594
N13847 G1 X180.99 Y201.119 E.44624
N13848 G1 X180.456 Y201.119 E.01594
N13849 G1 X191.565 Y190.011 E.46878
N13850 G1 X191.565 Y189.477 E.01594
N13851 G1 X179.922 Y201.119 E.49133
N13852 G1 X179.388 Y201.119 E.01594
N13853 G1 X191.565 Y188.942 E.51387
N13854 G1 X191.565 Y188.408 E.01594
N13855 G1 X178.853 Y201.119 E.53641
N13856 G1 X178.319 Y201.119 E.01594
N13857 G1 X191.565 Y187.874 E.55896
N13858 G1 X191.565 Y187.34 E.01594
N13859 G1 X177.785 Y201.119 E.5815
N13860 G1 X177.251 Y201.119 E.01594
N13861 G1 X191.565 Y186.805 E.60404
N13862 G1 X191.565 Y186.271 E.01594
N13863 G1 X176.716 Y201.119 E.62659
N13864 G1 X176.182 Y201.119 E.01594
N13865 G1 X191.565 Y185.737 E.64913
N13866 G1 X191.565 Y185.203 E.01594
N13867 G1 X175.648 Y201.119 E.67168
N13868 G1 X175.114 Y201.119 E.01594
N13869 G1 X191.565 Y184.669 E.69422
N13870 G1 X191.565 Y184.134 E.01594
N13871 G1 X174.58 Y201.119 E.71676
N13872 G1 X174.045 Y201.119 E.01594
N13873 G1 X191.565 Y183.6 E.73931
N13874 G1 X191.565 Y183.066 E.01594
N13875 G1 X173.511 Y201.119 E.76185
N13876 G1 X172.977 Y201.119 E.01594
N13877 G1 X191.565 Y182.532 E.7844
N13878 G1 X191.565 Y181.997 E.01594
N13879 G1 X172.443 Y201.119 E.80694
N13880 G1 X171.908 Y201.119 E.01594
N13881 G1 X191.565 Y181.463 E.82948
N13882 G1 X191.565 Y180.929 E.01594
N13883 G1 X171.374 Y201.119 E.85203
N13884 G1 X170.84 Y201.119 E.01594
N13885 G1 X191.565 Y180.395 E.87457
N13886 G1 X191.565 Y179.861 E.01594
N13887 M73 P87 R6
N13888 G1 X170.306 Y201.119 E.89711
N13889 G1 X169.772 Y201.119 E.01594
N13890 G1 X191.565 Y179.326 E.91966
N13891 G1 X191.565 Y178.792 E.01594
N13892 G1 X169.237 Y201.119 E.9422
N13893 G1 X168.703 Y201.119 E.01594
N13894 G1 X191.565 Y178.258 E.96475
N13895 G1 X191.565 Y177.724 E.01594
N13896 G1 X168.169 Y201.119 E.98729
N13897 G1 X167.635 Y201.119 E.01594
N13898 G1 X191.565 Y177.189 E1.00983
N13899 G1 X191.565 Y176.655 E.01594
N13900 G1 X167.1 Y201.119 E1.03238
N13901 G1 X166.566 Y201.119 E.01594
N13902 G1 X191.565 Y176.121 E1.05492
N13903 G1 X191.565 Y175.587 E.01594
N13904 G1 X166.032 Y201.119 E1.07746
N13905 G1 X165.498 Y201.119 E.01594
N13906 G1 X191.565 Y175.053 E1.10001
N13907 G1 X191.565 Y174.518 E.01594
N13908 G1 X164.964 Y201.119 E1.12255
N13909 G1 X164.429 Y201.119 E.01594
N13910 G1 X191.565 Y173.984 E1.1451
N13911 G1 X191.565 Y173.45 E.01594
N13912 G1 X163.895 Y201.119 E1.16764
N13913 G1 X163.361 Y201.119 E.01594
N13914 G1 X191.565 Y172.916 E1.19018
N13915 G1 X191.565 Y172.381 E.01594
N13916 G1 X162.827 Y201.119 E1.21273
N13917 G1 X162.293 Y201.119 E.01594
N13918 G1 X191.565 Y171.847 E1.23527
N13919 G1 X191.565 Y171.313 E.01594
N13920 G1 X161.758 Y201.119 E1.25781
N13921 G1 X161.224 Y201.119 E.01594
N13922 G1 X191.565 Y170.779 E1.28036
N13923 G1 X191.565 Y170.245 E.01594
N13924 G1 X160.69 Y201.119 E1.3029
N13925 G1 X160.156 Y201.119 E.01594
N13926 G1 X191.565 Y169.71 E1.32545
N13927 G1 X191.565 Y169.176 E.01594
N13928 G1 X159.621 Y201.119 E1.34799
N13929 G1 X159.087 Y201.119 E.01594
N13930 G1 X191.565 Y168.642 E1.37053
N13931 G1 X191.565 Y168.108 E.01594
N13932 G1 X158.553 Y201.119 E1.39308
N13933 G1 X158.435 Y201.119 E.00351
N13934 G1 X158.435 Y200.703 E.01243
N13935 G1 X191.565 Y167.574 E1.39804
N13936 G1 X191.565 Y167.039 E.01594
N13937 G1 X158.435 Y200.169 E1.39804
N13938 G1 X158.435 Y199.634 E.01594
N13939 G1 X191.565 Y166.505 E1.39804
N13940 G1 X191.565 Y165.971 E.01594
N13941 G1 X158.435 Y199.1 E1.39804
N13942 G1 X158.435 Y198.566 E.01594
N13943 G1 X191.565 Y165.437 E1.39804
N13944 G1 X191.565 Y164.902 E.01594
N13945 G1 X158.435 Y198.032 E1.39804
N13946 G1 X158.435 Y197.498 E.01594
N13947 G1 X191.565 Y164.368 E1.39804
N13948 G1 X191.565 Y163.834 E.01594
N13949 G1 X158.435 Y196.963 E1.39804
N13950 G1 X158.435 Y196.429 E.01594
N13951 G1 X191.565 Y163.3 E1.39804
N13952 G1 X191.565 Y162.766 E.01594
N13953 G1 X158.435 Y195.895 E1.39804
N13954 G1 X158.435 Y195.361 E.01594
N13955 G1 X191.565 Y162.231 E1.39804
N13956 G1 X191.565 Y161.697 E.01594
N13957 G1 X158.435 Y194.826 E1.39804
N13958 G1 X158.435 Y194.292 E.01594
N13959 G1 X191.565 Y161.163 E1.39804
N13960 G1 X191.565 Y160.629 E.01594
N13961 G1 X158.435 Y193.758 E1.39804
N13962 G1 X158.435 Y193.224 E.01594
N13963 G1 X191.565 Y160.094 E1.39804
N13964 G1 X191.565 Y159.56 E.01594
N13965 G1 X158.435 Y192.69 E1.39804
N13966 G1 X158.435 Y192.155 E.01594
N13967 G1 X191.565 Y159.026 E1.39804
N13968 G1 X191.565 Y158.492 E.01594
N13969 M73 P87 R5
N13970 G1 X158.435 Y191.621 E1.39804
N13971 G1 X158.435 Y191.087 E.01594
N13972 G1 X191.565 Y157.958 E1.39804
N13973 G1 X191.565 Y157.423 E.01594
N13974 G1 X158.435 Y190.553 E1.39804
N13975 G1 X158.435 Y190.018 E.01594
N13976 G1 X191.565 Y156.889 E1.39804
N13977 G1 X191.565 Y156.355 E.01594
N13978 G1 X158.435 Y189.484 E1.39804
N13979 G1 X158.435 Y188.95 E.01594
N13980 G1 X191.565 Y155.821 E1.39804
N13981 G1 X191.565 Y155.286 E.01594
N13982 G1 X158.435 Y188.416 E1.39804
N13983 G1 X158.435 Y187.882 E.01594
N13984 G1 X191.565 Y154.752 E1.39804
N13985 G1 X191.565 Y154.218 E.01594
N13986 G1 X158.435 Y187.347 E1.39804
N13987 G1 X158.435 Y186.813 E.01594
N13988 G1 X191.565 Y153.684 E1.39804
N13989 G1 X191.565 Y153.15 E.01594
N13990 G1 X158.435 Y186.279 E1.39804
N13991 G1 X158.435 Y185.745 E.01594
N13992 G1 X191.565 Y152.615 E1.39804
N13993 G1 X191.565 Y152.081 E.01594
N13994 M73 P88 R5
N13995 G1 X158.435 Y185.211 E1.39804
N13996 G1 X158.435 Y184.676 E.01594
N13997 G1 X191.565 Y151.547 E1.39804
N13998 G1 X191.565 Y151.013 E.01594
N13999 G1 X158.435 Y184.142 E1.39804
N14000 G1 X158.435 Y183.608 E.01594
N14001 G1 X191.565 Y150.479 E1.39804
N14002 G1 X191.565 Y149.944 E.01594
N14003 G1 X158.435 Y183.074 E1.39804
N14004 G1 X158.435 Y182.539 E.01594
N14005 G1 X191.565 Y149.41 E1.39804
N14006 G1 X191.565 Y148.876 E.01594
N14007 G1 X158.435 Y182.005 E1.39804
N14008 G1 X158.435 Y181.471 E.01594
N14009 G1 X191.565 Y148.342 E1.39804
N14010 G1 X191.565 Y147.807 E.01594
N14011 G1 X158.435 Y180.937 E1.39804
N14012 G1 X158.435 Y180.403 E.01594
N14013 G1 X191.565 Y147.273 E1.39804
N14014 G1 X191.565 Y146.739 E.01594
N14015 G1 X158.435 Y179.868 E1.39804
N14016 G1 X158.435 Y179.334 E.01594
N14017 G1 X191.565 Y146.205 E1.39804
N14018 G1 X191.565 Y145.671 E.01594
N14019 G1 X158.435 Y178.8 E1.39804
N14020 G1 X158.435 Y178.266 E.01594
N14021 G1 X191.565 Y145.136 E1.39804
N14022 G1 X191.565 Y144.602 E.01594
N14023 G1 X158.435 Y177.731 E1.39804
N14024 G1 X158.435 Y177.197 E.01594
N14025 G1 X191.565 Y144.068 E1.39804
N14026 G1 X191.565 Y143.534 E.01594
N14027 G1 X158.435 Y176.663 E1.39804
N14028 G1 X158.435 Y176.129 E.01594
N14029 G1 X191.565 Y142.999 E1.39804
N14030 G1 X191.565 Y142.465 E.01594
N14031 G1 X158.435 Y175.595 E1.39804
N14032 G1 X158.435 Y175.06 E.01594
N14033 G1 X191.565 Y141.931 E1.39804
N14034 G1 X191.565 Y141.397 E.01594
N14035 G1 X158.435 Y174.526 E1.39804
N14036 G1 X158.435 Y173.992 E.01594
N14037 G1 X191.565 Y140.863 E1.39804
N14038 G1 X191.565 Y140.328 E.01594
N14039 G1 X158.435 Y173.458 E1.39804
N14040 G1 X158.435 Y172.923 E.01594
N14041 G1 X191.565 Y139.794 E1.39804
N14042 G1 X191.565 Y139.26 E.01594
N14043 G1 X158.435 Y172.389 E1.39804
N14044 G1 X158.435 Y171.855 E.01594
N14045 G1 X191.565 Y138.726 E1.39804
N14046 G1 X191.565 Y138.191 E.01594
N14047 G1 X158.435 Y171.321 E1.39804
N14048 G1 X158.435 Y170.787 E.01594
N14049 G1 X191.565 Y137.657 E1.39804
N14050 G1 X191.565 Y137.123 E.01594
N14051 G1 X158.435 Y170.252 E1.39804
N14052 G1 X158.435 Y169.718 E.01594
N14053 G1 X191.565 Y136.589 E1.39804
N14054 G1 X191.565 Y136.055 E.01594
N14055 G1 X158.435 Y169.184 E1.39804
N14056 G1 X158.435 Y168.65 E.01594
N14057 G1 X191.565 Y135.52 E1.39804
N14058 G1 X191.565 Y134.986 E.01594
N14059 G1 X158.435 Y168.115 E1.39804
N14060 G1 X158.435 Y167.581 E.01594
N14061 G1 X191.565 Y134.452 E1.39804
N14062 G1 X191.565 Y133.918 E.01594
N14063 G1 X158.435 Y167.047 E1.39804
N14064 G1 X158.435 Y166.513 E.01594
N14065 G1 X191.565 Y133.383 E1.39804
N14066 G1 X191.565 Y132.849 E.01594
N14067 G1 X158.435 Y165.979 E1.39804
N14068 G1 X158.435 Y165.444 E.01594
N14069 G1 X191.565 Y132.315 E1.39804
N14070 G1 X191.565 Y131.781 E.01594
N14071 G1 X158.435 Y164.91 E1.39804
N14072 G1 X158.435 Y164.376 E.01594
N14073 G1 X191.565 Y131.247 E1.39804
N14074 G1 X191.565 Y130.712 E.01594
N14075 G1 X158.435 Y163.842 E1.39804
N14076 G1 X158.435 Y163.308 E.01594
N14077 G1 X191.565 Y130.178 E1.39804
N14078 G1 X191.565 Y129.644 E.01594
N14079 G1 X158.435 Y162.773 E1.39804
N14080 G1 X158.435 Y162.239 E.01594
N14081 G1 X191.565 Y129.11 E1.39804
N14082 G1 X191.565 Y128.576 E.01594
N14083 G1 X158.435 Y161.705 E1.39804
N14084 G1 X158.435 Y161.171 E.01594
N14085 G1 X191.565 Y128.041 E1.39804
N14086 G1 X191.565 Y127.507 E.01594
N14087 G1 X158.435 Y160.636 E1.39804
N14088 G1 X158.435 Y160.102 E.01594
N14089 G1 X191.565 Y126.973 E1.39804
N14090 G1 X191.565 Y126.556 E.01245
N14091 M73 P89 R5
N14092 G1 X191.448 Y126.556 E.00349
N14093 G1 X158.435 Y159.568 E1.39311
N14094 G1 X158.435 Y159.034 E.01594
N14095 G1 X190.914 Y126.556 E1.37057
N14096 G1 X190.379 Y126.556 E.01594
N14097 G1 X158.435 Y158.5 E1.34802
N14098 G1 X158.435 Y157.965 E.01594
N14099 G1 X189.845 Y126.556 E1.32548
N14100 G1 X189.311 Y126.556 E.01594
N14101 G1 X158.435 Y157.431 E1.30293
N14102 G1 X158.435 Y156.897 E.01594
N14103 G1 X188.777 Y126.556 E1.28039
N14104 G1 X188.242 Y126.556 E.01594
N14105 G1 X158.435 Y156.363 E1.25785
N14106 G1 X158.435 Y155.828 E.01594
N14107 G1 X187.708 Y126.556 E1.2353
N14108 G1 X187.174 Y126.556 E.01594
N14109 G1 X158.435 Y155.294 E1.21276
N14110 G1 X158.435 Y154.76 E.01594
N14111 G1 X186.64 Y126.556 E1.19022
N14112 G1 X186.106 Y126.556 E.01594
N14113 G1 X158.435 Y154.226 E1.16767
N14114 G1 X158.435 Y153.692 E.01594
N14115 G1 X185.571 Y126.556 E1.14513
N14116 G1 X185.037 Y126.556 E.01594
N14117 G1 X158.435 Y153.157 E1.12258
N14118 G1 X158.435 Y152.623 E.01594
N14119 G1 X184.503 Y126.556 E1.10004
N14120 G1 X183.969 Y126.556 E.01594
N14121 G1 X158.435 Y152.089 E1.0775
N14122 G1 X158.435 Y151.555 E.01594
N14123 G1 X183.435 Y126.556 E1.05495
N14124 G1 X182.9 Y126.556 E.01594
N14125 G1 X158.435 Y151.02 E1.03241
N14126 G1 X158.435 Y150.486 E.01594
N14127 G1 X182.366 Y126.556 E1.00987
N14128 G1 X181.832 Y126.556 E.01594
N14129 G1 X158.435 Y149.952 E.98732
N14130 G1 X158.435 Y149.418 E.01594
N14131 G1 X181.298 Y126.556 E.96478
N14132 G1 X180.763 Y126.556 E.01594
N14133 G1 X158.435 Y148.884 E.94223
N14134 G1 X158.435 Y148.349 E.01594
N14135 G1 X180.229 Y126.556 E.91969
N14136 G1 X179.695 Y126.556 E.01594
N14137 G1 X158.435 Y147.815 E.89715
N14138 G1 X158.435 Y147.281 E.01594
N14139 G1 X179.161 Y126.556 E.8746
N14140 G1 X178.627 Y126.556 E.01594
N14141 G1 X158.435 Y146.747 E.85206
N14142 G1 X158.435 Y146.213 E.01594
N14143 G1 X178.092 Y126.556 E.82952
N14144 G1 X177.558 Y126.556 E.01594
N14145 G1 X158.435 Y145.678 E.80697
N14146 G1 X158.435 Y145.144 E.01594
N14147 G1 X177.024 Y126.556 E.78443
N14148 G1 X176.49 Y126.556 E.01594
N14149 G1 X158.435 Y144.61 E.76188
N14150 G1 X158.435 Y144.076 E.01594
N14151 G1 X175.955 Y126.556 E.73934
N14152 G1 X175.421 Y126.556 E.01594
N14153 G1 X158.435 Y143.541 E.7168
N14154 G1 X158.435 Y143.007 E.01594
N14155 G1 X174.887 Y126.556 E.69425
N14156 G1 X174.353 Y126.556 E.01594
N14157 G1 X158.435 Y142.473 E.67171
N14158 G1 X158.435 Y141.939 E.01594
N14159 G1 X173.819 Y126.556 E.64916
N14160 G1 X173.284 Y126.556 E.01594
N14161 G1 X158.435 Y141.405 E.62662
N14162 G1 X158.435 Y140.87 E.01594
N14163 G1 X172.75 Y126.556 E.60408
N14164 G1 X172.216 Y126.556 E.01594
N14165 G1 X158.435 Y140.336 E.58153
N14166 G1 X158.435 Y139.802 E.01594
N14167 G1 X171.682 Y126.556 E.55899
N14168 G1 X171.147 Y126.556 E.01594
N14169 G1 X158.435 Y139.268 E.53645
N14170 G1 X158.435 Y138.733 E.01594
N14171 G1 X170.613 Y126.556 E.5139
N14172 G1 X170.079 Y126.556 E.01594
N14173 G1 X158.435 Y138.199 E.49136
N14174 G1 X158.435 Y137.665 E.01594
N14175 G1 X169.545 Y126.556 E.46881
N14176 G1 X169.011 Y126.556 E.01594
N14177 G1 X158.435 Y137.131 E.44627
N14178 G1 X158.435 Y136.597 E.01594
N14179 G1 X168.476 Y126.556 E.42373
N14180 G1 X167.942 Y126.556 E.01594
N14181 G1 X158.435 Y136.062 E.40118
N14182 G1 X158.435 Y135.528 E.01594
N14183 G1 X167.408 Y126.556 E.37864
N14184 G1 X166.874 Y126.556 E.01594
N14185 G1 X158.435 Y134.994 E.3561
N14186 G1 X158.435 Y134.46 E.01594
N14187 G1 X166.339 Y126.556 E.33355
N14188 G1 X165.805 Y126.556 E.01594
N14189 G1 X158.435 Y133.925 E.31101
N14190 G1 X158.435 Y133.391 E.01594
N14191 G1 X165.271 Y126.556 E.28846
N14192 G1 X164.737 Y126.556 E.01594
N14193 G1 X158.435 Y132.857 E.26592
N14194 G1 X158.435 Y132.323 E.01594
N14195 G1 X164.203 Y126.556 E.24338
N14196 G1 X163.668 Y126.556 E.01594
N14197 G1 X158.435 Y131.789 E.22083
N14198 G1 X158.435 Y131.254 E.01594
N14199 G1 X163.134 Y126.556 E.19829
N14200 G1 X162.6 Y126.556 E.01594
N14201 G1 X158.435 Y130.72 E.17575
N14202 G1 X158.435 Y130.186 E.01594
N14203 G1 X162.066 Y126.556 E.1532
N14204 G1 X161.532 Y126.556 E.01594
N14205 G1 X158.435 Y129.652 E.13066
N14206 G1 X158.435 Y129.118 E.01594
N14207 G1 X160.997 Y126.556 E.10811
N14208 G1 X160.463 Y126.556 E.01594
N14209 G1 X158.435 Y128.583 E.08557
N14210 G1 X158.435 Y128.049 E.01594
N14211 G1 X159.929 Y126.556 E.06303
N14212 G1 X159.395 Y126.556 E.01594
N14213 G1 X158.435 Y127.515 E.04048
N14214 G1 X158.435 Y126.981 E.01594
N14215 G1 X159.03 Y126.386 E.0251
N14216 ; WIPE_START
N14217 G1 X158.435 Y126.981 E-.31964
N14218 G1 X158.435 Y127.515 E-.203
N14219 G1 X158.877 Y127.073 E-.23736
N14220 ; WIPE_END
N14221 G1 E-.04 F1800
N14222 M204 S10000
N14223 G17
N14224 G3 Z12.4 I1.217 J0 P1  F60000
N14225 ; stop printing object, unique label id: 229
N14226 M625
N14227 ; object ids of layer 60 start: 229
N14228 M624 AQAAAAAAAAA=
N14229 ;======== H2D 20250527========
N14230 ; SKIPPABLE_START
N14231 ; SKIPTYPE: timelapse
N14232 M622.1 S1 ; for prev firware, default turned on
N14233 
N14234 M1002 judge_flag timelapse_record_flag
N14235 
N14236 M622 J1
N14237 M993 A2 B2 C2
N14238 M993 A0 B0 C0
N14239 
N14240 
N14241 
N14242 
N14243     M9711 M0 E1 X260 Y141 Z12.4 S11 C10 O0 T3000
N14244 
N14245 
N14246 
N14247 M993 A3 B3 C3
N14248 
N14249 M623
N14250 ; SKIPPABLE_END
N14251 
N14252 ; object ids of this layer60 end: 229
N14253 M625
N14254 ; CHANGE_LAYER
N14255 ; Z_HEIGHT: 12.2
N14256 ; LAYER_HEIGHT: 0.2
N14257 ;======== H2D 20250521========
N14258 ; layer num/total_layer_count: 61/63
N14259 ; update layer progress
N14260 M73 L61
N14261 M991 S0 P60 ;notify layer change
N14262 
N14263 
N14264 ; OBJECT_ID: 229
N14265 ; COOLING_NODE: 0
N14266 ; start printing object, unique label id: 229
N14267 M624 AQAAAAAAAAA=
N14268 G1 X191.898 Y201.453 F60000
N14269 G1 Z12.2
N14270 G1 E.8 F1800
N14271 ; FEATURE: Inner wall
N14272 ; LINE_WIDTH: 0.45
N14273 ; LAYER_HEIGHT: 0.2
N14274 G1 F4421.739
N14275 M204 S8000
N14276 G1 X158.102 Y201.453 E1.08675
N14277 G1 X158.102 Y126.222 E2.41914
N14278 G1 X191.898 Y126.222 E1.08675
N14279 G1 X191.898 Y201.393 E2.41721
N14280 ; COOLING_NODE: 0
N14281 M204 S10000
N14282 G1 X192.29 Y201.845 F60000
N14283 ; FEATURE: Outer wall
N14284 ; LINE_WIDTH: 0.42
N14285 G1 F4773.528
N14286 M204 S5000
N14287 G1 X157.71 Y201.845 E1.03002
N14288 M73 P89 R4
N14289 G1 X157.71 Y125.83 E2.26421
N14290 G1 X192.29 Y125.83 E1.03002
N14291 G1 X192.29 Y201.785 E2.26243
N14292 ; WIPE_START
N14293 M204 S8000
N14294 G1 X190.29 Y201.788 E-.76
N14295 ; WIPE_END
N14296 G1 E-.04 F1800
N14297 M204 S10000
N14298 G1 X182.663 Y201.487 Z12.6 F60000
N14299 G1 X158.266 Y200.525 Z12.6
N14300 G1 Z12.2
N14301 G1 E.8 F1800
N14302 ; FEATURE: Internal solid infill
N14303 ; LINE_WIDTH: 0.42067
N14304 G1 F4765.056
N14305 M204 S8000
N14306 G1 X158.86 Y201.119 E.0251
N14307 G1 X159.395 Y201.119 E.01594
N14308 G1 X158.435 Y200.16 E.04048
N14309 G1 X158.435 Y199.626 E.01594
N14310 G1 X159.929 Y201.119 E.06303
N14311 G1 X160.463 Y201.119 E.01594
N14312 G1 X158.435 Y199.092 E.08557
N14313 G1 X158.435 Y198.557 E.01594
N14314 G1 X160.997 Y201.119 E.10811
N14315 G1 X161.532 Y201.119 E.01594
N14316 G1 X158.435 Y198.023 E.13066
N14317 G1 X158.435 Y197.489 E.01594
N14318 G1 X162.066 Y201.119 E.1532
N14319 G1 X162.6 Y201.119 E.01594
N14320 G1 X158.435 Y196.955 E.17575
N14321 G1 X158.435 Y196.421 E.01594
N14322 G1 X163.134 Y201.119 E.19829
N14323 G1 X163.668 Y201.119 E.01594
N14324 G1 X158.435 Y195.886 E.22083
N14325 G1 X158.435 Y195.352 E.01594
N14326 G1 X164.203 Y201.119 E.24338
N14327 G1 X164.737 Y201.119 E.01594
N14328 G1 X158.435 Y194.818 E.26592
N14329 G1 X158.435 Y194.284 E.01594
N14330 G1 X165.271 Y201.119 E.28846
N14331 G1 X165.805 Y201.119 E.01594
N14332 G1 X158.435 Y193.749 E.31101
N14333 G1 X158.435 Y193.215 E.01594
N14334 G1 X166.339 Y201.119 E.33355
N14335 G1 X166.874 Y201.119 E.01594
N14336 G1 X158.435 Y192.681 E.3561
N14337 G1 X158.435 Y192.147 E.01594
N14338 G1 X167.408 Y201.119 E.37864
N14339 G1 X167.942 Y201.119 E.01594
N14340 G1 X158.435 Y191.613 E.40118
N14341 G1 X158.435 Y191.078 E.01594
N14342 G1 X168.476 Y201.119 E.42373
N14343 G1 X169.011 Y201.119 E.01594
N14344 G1 X158.435 Y190.544 E.44627
N14345 G1 X158.435 Y190.01 E.01594
N14346 G1 X169.545 Y201.119 E.46881
N14347 G1 X170.079 Y201.119 E.01594
N14348 G1 X158.435 Y189.476 E.49136
N14349 G1 X158.435 Y188.942 E.01594
N14350 M73 P90 R4
N14351 G1 X170.613 Y201.119 E.5139
N14352 G1 X171.147 Y201.119 E.01594
N14353 G1 X158.435 Y188.407 E.53645
N14354 G1 X158.435 Y187.873 E.01594
N14355 G1 X171.682 Y201.119 E.55899
N14356 G1 X172.216 Y201.119 E.01594
N14357 G1 X158.435 Y187.339 E.58153
N14358 G1 X158.435 Y186.805 E.01594
N14359 G1 X172.75 Y201.119 E.60408
N14360 G1 X173.284 Y201.119 E.01594
N14361 G1 X158.435 Y186.27 E.62662
N14362 G1 X158.435 Y185.736 E.01594
N14363 G1 X173.819 Y201.119 E.64916
N14364 G1 X174.353 Y201.119 E.01594
N14365 G1 X158.435 Y185.202 E.67171
N14366 G1 X158.435 Y184.668 E.01594
N14367 G1 X174.887 Y201.119 E.69425
N14368 G1 X175.421 Y201.119 E.01594
N14369 G1 X158.435 Y184.134 E.7168
N14370 G1 X158.435 Y183.599 E.01594
N14371 G1 X175.955 Y201.119 E.73934
N14372 G1 X176.49 Y201.119 E.01594
N14373 G1 X158.435 Y183.065 E.76188
N14374 G1 X158.435 Y182.531 E.01594
N14375 G1 X177.024 Y201.119 E.78443
N14376 G1 X177.558 Y201.119 E.01594
N14377 G1 X158.435 Y181.997 E.80697
N14378 G1 X158.435 Y181.462 E.01594
N14379 G1 X178.092 Y201.119 E.82951
N14380 G1 X178.627 Y201.119 E.01594
N14381 G1 X158.435 Y180.928 E.85206
N14382 G1 X158.435 Y180.394 E.01594
N14383 G1 X179.161 Y201.119 E.8746
N14384 G1 X179.695 Y201.119 E.01594
N14385 G1 X158.435 Y179.86 E.89715
N14386 G1 X158.435 Y179.326 E.01594
N14387 G1 X180.229 Y201.119 E.91969
N14388 G1 X180.763 Y201.119 E.01594
N14389 G1 X158.435 Y178.791 E.94223
N14390 G1 X158.435 Y178.257 E.01594
N14391 G1 X181.298 Y201.119 E.96478
N14392 G1 X181.832 Y201.119 E.01594
N14393 G1 X158.435 Y177.723 E.98732
N14394 G1 X158.435 Y177.189 E.01594
N14395 G1 X182.366 Y201.119 E1.00986
N14396 G1 X182.9 Y201.119 E.01594
N14397 G1 X158.435 Y176.654 E1.03241
N14398 G1 X158.435 Y176.12 E.01594
N14399 G1 X183.435 Y201.119 E1.05495
N14400 G1 X183.969 Y201.119 E.01594
N14401 G1 X158.435 Y175.586 E1.0775
N14402 G1 X158.435 Y175.052 E.01594
N14403 G1 X184.503 Y201.119 E1.10004
N14404 G1 X185.037 Y201.119 E.01594
N14405 G1 X158.435 Y174.518 E1.12258
N14406 G1 X158.435 Y173.983 E.01594
N14407 G1 X185.571 Y201.119 E1.14513
N14408 G1 X186.106 Y201.119 E.01594
N14409 G1 X158.435 Y173.449 E1.16767
N14410 G1 X158.435 Y172.915 E.01594
N14411 G1 X186.64 Y201.119 E1.19022
N14412 G1 X187.174 Y201.119 E.01594
N14413 G1 X158.435 Y172.381 E1.21276
N14414 G1 X158.435 Y171.847 E.01594
N14415 G1 X187.708 Y201.119 E1.2353
N14416 G1 X188.242 Y201.119 E.01594
N14417 G1 X158.435 Y171.312 E1.25785
N14418 G1 X158.435 Y170.778 E.01594
N14419 G1 X188.777 Y201.119 E1.28039
N14420 G1 X189.311 Y201.119 E.01594
N14421 G1 X158.435 Y170.244 E1.30293
N14422 G1 X158.435 Y169.71 E.01594
N14423 G1 X189.845 Y201.119 E1.32548
N14424 G1 X190.379 Y201.119 E.01594
N14425 G1 X158.435 Y169.175 E1.34802
N14426 G1 X158.435 Y168.641 E.01594
N14427 G1 X190.914 Y201.119 E1.37057
N14428 G1 X191.448 Y201.119 E.01594
N14429 G1 X158.435 Y168.107 E1.39311
N14430 G1 X158.435 Y167.573 E.01594
N14431 G1 X191.565 Y200.702 E1.39804
N14432 G1 X191.565 Y200.168 E.01594
N14433 G1 X158.435 Y167.039 E1.39804
N14434 G1 X158.435 Y166.504 E.01594
N14435 G1 X191.565 Y199.634 E1.39804
N14436 G1 X191.565 Y199.099 E.01594
N14437 G1 X158.435 Y165.97 E1.39804
N14438 G1 X158.435 Y165.436 E.01594
N14439 G1 X191.565 Y198.565 E1.39804
N14440 G1 X191.565 Y198.031 E.01594
N14441 G1 X158.435 Y164.902 E1.39804
N14442 G1 X158.435 Y164.367 E.01594
N14443 G1 X191.565 Y197.497 E1.39804
N14444 G1 X191.565 Y196.963 E.01594
N14445 G1 X158.435 Y163.833 E1.39804
N14446 G1 X158.435 Y163.299 E.01594
N14447 G1 X191.565 Y196.428 E1.39804
N14448 G1 X191.565 Y195.894 E.01594
N14449 G1 X158.435 Y162.765 E1.39804
N14450 G1 X158.435 Y162.231 E.01594
N14451 G1 X191.565 Y195.36 E1.39804
N14452 G1 X191.565 Y194.826 E.01594
N14453 G1 X158.435 Y161.696 E1.39804
N14454 G1 X158.435 Y161.162 E.01594
N14455 G1 X191.565 Y194.291 E1.39804
N14456 G1 X191.565 Y193.757 E.01594
N14457 G1 X158.435 Y160.628 E1.39804
N14458 G1 X158.435 Y160.094 E.01594
N14459 G1 X191.565 Y193.223 E1.39804
N14460 G1 X191.565 Y192.689 E.01594
N14461 G1 X158.435 Y159.559 E1.39804
N14462 G1 X158.435 Y159.025 E.01594
N14463 G1 X191.565 Y192.155 E1.39804
N14464 G1 X191.565 Y191.62 E.01594
N14465 G1 X158.435 Y158.491 E1.39804
N14466 G1 X158.435 Y157.957 E.01594
N14467 G1 X191.565 Y191.086 E1.39804
N14468 G1 X191.565 Y190.552 E.01594
N14469 G1 X158.435 Y157.423 E1.39804
N14470 G1 X158.435 Y156.888 E.01594
N14471 G1 X191.565 Y190.018 E1.39804
N14472 G1 X191.565 Y189.484 E.01594
N14473 M73 P91 R4
N14474 G1 X158.435 Y156.354 E1.39804
N14475 G1 X158.435 Y155.82 E.01594
N14476 G1 X191.565 Y188.949 E1.39804
N14477 G1 X191.565 Y188.415 E.01594
N14478 G1 X158.435 Y155.286 E1.39804
N14479 G1 X158.435 Y154.751 E.01594
N14480 G1 X191.565 Y187.881 E1.39804
N14481 G1 X191.565 Y187.347 E.01594
N14482 G1 X158.435 Y154.217 E1.39804
N14483 G1 X158.435 Y153.683 E.01594
N14484 G1 X191.565 Y186.812 E1.39804
N14485 G1 X191.565 Y186.278 E.01594
N14486 G1 X158.435 Y153.149 E1.39804
N14487 G1 X158.435 Y152.615 E.01594
N14488 G1 X191.565 Y185.744 E1.39804
N14489 G1 X191.565 Y185.21 E.01594
N14490 G1 X158.435 Y152.08 E1.39804
N14491 G1 X158.435 Y151.546 E.01594
N14492 G1 X191.565 Y184.676 E1.39804
N14493 G1 X191.565 Y184.141 E.01594
N14494 G1 X158.435 Y151.012 E1.39804
N14495 G1 X158.435 Y150.478 E.01594
N14496 G1 X191.565 Y183.607 E1.39804
N14497 G1 X191.565 Y183.073 E.01594
N14498 G1 X158.435 Y149.944 E1.39804
N14499 G1 X158.435 Y149.409 E.01594
N14500 G1 X191.565 Y182.539 E1.39804
N14501 G1 X191.565 Y182.004 E.01594
N14502 G1 X158.435 Y148.875 E1.39804
N14503 G1 X158.435 Y148.341 E.01594
N14504 G1 X191.565 Y181.47 E1.39804
N14505 G1 X191.565 Y180.936 E.01594
N14506 G1 X158.435 Y147.807 E1.39804
N14507 G1 X158.435 Y147.272 E.01594
N14508 G1 X191.565 Y180.402 E1.39804
N14509 G1 X191.565 Y179.868 E.01594
N14510 G1 X158.435 Y146.738 E1.39804
N14511 G1 X158.435 Y146.204 E.01594
N14512 G1 X191.565 Y179.333 E1.39804
N14513 G1 X191.565 Y178.799 E.01594
N14514 G1 X158.435 Y145.67 E1.39804
N14515 G1 X158.435 Y145.136 E.01594
N14516 G1 X191.565 Y178.265 E1.39804
N14517 G1 X191.565 Y177.731 E.01594
N14518 G1 X158.435 Y144.601 E1.39804
N14519 G1 X158.435 Y144.067 E.01594
N14520 G1 X191.565 Y177.196 E1.39804
N14521 G1 X191.565 Y176.662 E.01594
N14522 G1 X158.435 Y143.533 E1.39804
N14523 G1 X158.435 Y142.999 E.01594
N14524 G1 X191.565 Y176.128 E1.39804
N14525 G1 X191.565 Y175.594 E.01594
N14526 G1 X158.435 Y142.464 E1.39804
N14527 G1 X158.435 Y141.93 E.01594
N14528 G1 X191.565 Y175.06 E1.39804
N14529 G1 X191.565 Y174.525 E.01594
N14530 G1 X158.435 Y141.396 E1.39804
N14531 G1 X158.435 Y140.862 E.01594
N14532 G1 X191.565 Y173.991 E1.39804
N14533 G1 X191.565 Y173.457 E.01594
N14534 G1 X158.435 Y140.328 E1.39804
N14535 G1 X158.435 Y139.793 E.01594
N14536 G1 X191.565 Y172.923 E1.39804
N14537 G1 X191.565 Y172.388 E.01594
N14538 G1 X158.435 Y139.259 E1.39804
N14539 G1 X158.435 Y138.725 E.01594
N14540 G1 X191.565 Y171.854 E1.39804
N14541 G1 X191.565 Y171.32 E.01594
N14542 G1 X158.435 Y138.191 E1.39804
N14543 G1 X158.435 Y137.656 E.01594
N14544 G1 X191.565 Y170.786 E1.39804
N14545 G1 X191.565 Y170.252 E.01594
N14546 G1 X158.435 Y137.122 E1.39804
N14547 G1 X158.435 Y136.588 E.01594
N14548 G1 X191.565 Y169.717 E1.39804
N14549 G1 X191.565 Y169.183 E.01594
N14550 G1 X158.435 Y136.054 E1.39804
N14551 G1 X158.435 Y135.52 E.01594
N14552 G1 X191.565 Y168.649 E1.39804
N14553 G1 X191.565 Y168.115 E.01594
N14554 M73 P91 R3
N14555 G1 X158.435 Y134.985 E1.39804
N14556 G1 X158.435 Y134.451 E.01594
N14557 G1 X191.565 Y167.581 E1.39804
N14558 G1 X191.565 Y167.046 E.01594
N14559 G1 X158.435 Y133.917 E1.39804
N14560 G1 X158.435 Y133.383 E.01594
N14561 G1 X191.565 Y166.512 E1.39804
N14562 G1 X191.565 Y165.978 E.01594
N14563 G1 X158.435 Y132.849 E1.39804
N14564 G1 X158.435 Y132.314 E.01594
N14565 G1 X191.565 Y165.444 E1.39804
N14566 G1 X191.565 Y164.909 E.01594
N14567 G1 X158.435 Y131.78 E1.39804
N14568 G1 X158.435 Y131.246 E.01594
N14569 G1 X191.565 Y164.375 E1.39804
N14570 G1 X191.565 Y163.841 E.01594
N14571 M73 P92 R3
N14572 G1 X158.435 Y130.712 E1.39804
N14573 G1 X158.435 Y130.177 E.01594
N14574 G1 X191.565 Y163.307 E1.39804
N14575 G1 X191.565 Y162.773 E.01594
N14576 G1 X158.435 Y129.643 E1.39804
N14577 G1 X158.435 Y129.109 E.01594
N14578 G1 X191.565 Y162.238 E1.39804
N14579 G1 X191.565 Y161.704 E.01594
N14580 G1 X158.435 Y128.575 E1.39804
N14581 G1 X158.435 Y128.041 E.01594
N14582 G1 X191.565 Y161.17 E1.39804
N14583 G1 X191.565 Y160.636 E.01594
N14584 G1 X158.435 Y127.506 E1.39804
N14585 G1 X158.435 Y126.972 E.01594
N14586 G1 X191.565 Y160.101 E1.39804
N14587 G1 X191.565 Y159.567 E.01594
N14588 G1 X158.553 Y126.556 E1.39308
N14589 G1 X159.087 Y126.556 E.01594
N14590 G1 X191.565 Y159.033 E1.37053
N14591 G1 X191.565 Y158.499 E.01594
N14592 G1 X159.621 Y126.556 E1.34799
N14593 G1 X160.156 Y126.556 E.01594
N14594 G1 X191.565 Y157.965 E1.32545
N14595 G1 X191.565 Y157.43 E.01594
N14596 G1 X160.69 Y126.556 E1.3029
N14597 G1 X161.224 Y126.556 E.01594
N14598 G1 X191.565 Y156.896 E1.28036
N14599 G1 X191.565 Y156.362 E.01594
N14600 G1 X161.758 Y126.556 E1.25781
N14601 G1 X162.293 Y126.556 E.01594
N14602 G1 X191.565 Y155.828 E1.23527
N14603 G1 X191.565 Y155.293 E.01594
N14604 G1 X162.827 Y126.556 E1.21273
N14605 G1 X163.361 Y126.556 E.01594
N14606 G1 X191.565 Y154.759 E1.19018
N14607 G1 X191.565 Y154.225 E.01594
N14608 G1 X163.895 Y126.556 E1.16764
N14609 G1 X164.429 Y126.556 E.01594
N14610 G1 X191.565 Y153.691 E1.1451
N14611 G1 X191.565 Y153.157 E.01594
N14612 G1 X164.964 Y126.556 E1.12255
N14613 G1 X165.498 Y126.556 E.01594
N14614 G1 X191.565 Y152.622 E1.10001
N14615 G1 X191.565 Y152.088 E.01594
N14616 G1 X166.032 Y126.556 E1.07746
N14617 G1 X166.566 Y126.556 E.01594
N14618 G1 X191.565 Y151.554 E1.05492
N14619 G1 X191.565 Y151.02 E.01594
N14620 G1 X167.1 Y126.556 E1.03238
N14621 G1 X167.635 Y126.556 E.01594
N14622 G1 X191.565 Y150.486 E1.00983
N14623 G1 X191.565 Y149.951 E.01594
N14624 G1 X168.169 Y126.556 E.98729
N14625 G1 X168.703 Y126.556 E.01594
N14626 G1 X191.565 Y149.417 E.96475
N14627 G1 X191.565 Y148.883 E.01594
N14628 G1 X169.237 Y126.556 E.9422
N14629 G1 X169.772 Y126.556 E.01594
N14630 G1 X191.565 Y148.349 E.91966
N14631 G1 X191.565 Y147.814 E.01594
N14632 G1 X170.306 Y126.556 E.89711
N14633 G1 X170.84 Y126.556 E.01594
N14634 G1 X191.565 Y147.28 E.87457
N14635 G1 X191.565 Y146.746 E.01594
N14636 G1 X171.374 Y126.556 E.85203
N14637 G1 X171.908 Y126.556 E.01594
N14638 G1 X191.565 Y146.212 E.82948
N14639 G1 X191.565 Y145.678 E.01594
N14640 G1 X172.443 Y126.556 E.80694
N14641 G1 X172.977 Y126.556 E.01594
N14642 G1 X191.565 Y145.143 E.78439
N14643 G1 X191.565 Y144.609 E.01594
N14644 G1 X173.511 Y126.556 E.76185
N14645 G1 X174.045 Y126.556 E.01594
N14646 G1 X191.565 Y144.075 E.73931
N14647 G1 X191.565 Y143.541 E.01594
N14648 G1 X174.58 Y126.556 E.71676
N14649 G1 X175.114 Y126.556 E.01594
N14650 G1 X191.565 Y143.006 E.69422
N14651 G1 X191.565 Y142.472 E.01594
N14652 G1 X175.648 Y126.556 E.67168
N14653 G1 X176.182 Y126.556 E.01594
N14654 G1 X191.565 Y141.938 E.64913
N14655 G1 X191.565 Y141.404 E.01594
N14656 G1 X176.716 Y126.556 E.62659
N14657 G1 X177.251 Y126.556 E.01594
N14658 G1 X191.565 Y140.87 E.60404
N14659 G1 X191.565 Y140.335 E.01594
N14660 G1 X177.785 Y126.556 E.5815
N14661 G1 X178.319 Y126.556 E.01594
N14662 G1 X191.565 Y139.801 E.55896
N14663 G1 X191.565 Y139.267 E.01594
N14664 G1 X178.853 Y126.556 E.53641
N14665 G1 X179.388 Y126.556 E.01594
N14666 G1 X191.565 Y138.733 E.51387
N14667 G1 X191.565 Y138.198 E.01594
N14668 G1 X179.922 Y126.556 E.49133
N14669 G1 X180.456 Y126.556 E.01594
N14670 G1 X191.565 Y137.664 E.46878
N14671 G1 X191.565 Y137.13 E.01594
N14672 G1 X180.99 Y126.556 E.44624
N14673 G1 X181.524 Y126.556 E.01594
N14674 G1 X191.565 Y136.596 E.42369
N14675 G1 X191.565 Y136.062 E.01594
N14676 G1 X182.059 Y126.556 E.40115
N14677 G1 X182.593 Y126.556 E.01594
N14678 G1 X191.565 Y135.527 E.37861
N14679 G1 X191.565 Y134.993 E.01594
N14680 G1 X183.127 Y126.556 E.35606
N14681 G1 X183.661 Y126.556 E.01594
N14682 G1 X191.565 Y134.459 E.33352
N14683 G1 X191.565 Y133.925 E.01594
N14684 G1 X184.196 Y126.556 E.31098
N14685 G1 X184.73 Y126.556 E.01594
N14686 G1 X191.565 Y133.39 E.28843
N14687 G1 X191.565 Y132.856 E.01594
N14688 G1 X185.264 Y126.556 E.26589
N14689 G1 X185.798 Y126.556 E.01594
N14690 G1 X191.565 Y132.322 E.24334
N14691 G1 X191.565 Y131.788 E.01594
N14692 G1 X186.332 Y126.556 E.2208
N14693 G1 X186.867 Y126.556 E.01594
N14694 G1 X191.565 Y131.254 E.19826
N14695 G1 X191.565 Y130.719 E.01594
N14696 G1 X187.401 Y126.556 E.17571
N14697 G1 X187.935 Y126.556 E.01594
N14698 G1 X191.565 Y130.185 E.15317
N14699 G1 X191.565 Y129.651 E.01594
N14700 G1 X188.469 Y126.556 E.13063
N14701 G1 X189.003 Y126.556 E.01594
N14702 G1 X191.565 Y129.117 E.10808
N14703 G1 X191.565 Y128.583 E.01594
N14704 G1 X189.538 Y126.556 E.08554
N14705 G1 X190.072 Y126.556 E.01594
N14706 G1 X191.565 Y128.048 E.06299
N14707 G1 X191.565 Y127.514 E.01594
N14708 G1 X190.606 Y126.556 E.04045
N14709 G1 X191.14 Y126.556 E.01594
N14710 G1 X191.734 Y127.15 E.02507
N14711 ; WIPE_START
N14712 G1 X191.14 Y126.556 E-.31922
N14713 G1 X190.606 Y126.556 E-.203
N14714 G1 X191.049 Y126.998 E-.23778
N14715 ; WIPE_END
N14716 G1 E-.04 F1800
N14717 M204 S10000
N14718 G17
N14719 G3 Z12.6 I1.217 J0 P1  F60000
N14720 ; stop printing object, unique label id: 229
N14721 M625
N14722 ; object ids of layer 61 start: 229
N14723 M624 AQAAAAAAAAA=
N14724 ;======== H2D 20250527========
N14725 ; SKIPPABLE_START
N14726 ; SKIPTYPE: timelapse
N14727 M622.1 S1 ; for prev firware, default turned on
N14728 
N14729 M1002 judge_flag timelapse_record_flag
N14730 
N14731 M622 J1
N14732 M993 A2 B2 C2
N14733 M993 A0 B0 C0
N14734 
N14735 
N14736 
N14737 
N14738     M9711 M0 E1 X260 Y141 Z12.6 S11 C10 O0 T3000
N14739 
N14740 
N14741 
N14742 M993 A3 B3 C3
N14743 
N14744 M623
N14745 ; SKIPPABLE_END
N14746 
N14747 ; object ids of this layer61 end: 229
N14748 M625
N14749 ; CHANGE_LAYER
N14750 ; Z_HEIGHT: 12.4
N14751 ; LAYER_HEIGHT: 0.2
N14752 ;======== H2D 20250521========
N14753 ; layer num/total_layer_count: 62/63
N14754 ; update layer progress
N14755 M73 L62
N14756 M991 S0 P61 ;notify layer change
N14757 
N14758 
N14759 ; OBJECT_ID: 229
N14760 ; COOLING_NODE: 0
N14761 ; start printing object, unique label id: 229
N14762 M624 AQAAAAAAAAA=
N14763 G1 X191.898 Y201.453 F60000
N14764 G1 Z12.4
N14765 G1 E.8 F1800
N14766 ; FEATURE: Inner wall
N14767 ; LINE_WIDTH: 0.45
N14768 ; LAYER_HEIGHT: 0.2
N14769 G1 F4421.739
N14770 M204 S8000
N14771 G1 X158.102 Y201.453 E1.08675
N14772 G1 X158.102 Y126.222 E2.41914
N14773 G1 X191.898 Y126.222 E1.08675
N14774 G1 X191.898 Y201.393 E2.41721
N14775 ; COOLING_NODE: 0
N14776 M204 S10000
N14777 G1 X192.29 Y201.845 F60000
N14778 ; FEATURE: Outer wall
N14779 ; LINE_WIDTH: 0.42
N14780 G1 F4773.528
N14781 M204 S5000
N14782 G1 X157.71 Y201.845 E1.03002
N14783 G1 X157.71 Y125.83 E2.26421
N14784 G1 X192.29 Y125.83 E1.03002
N14785 G1 X192.29 Y201.785 E2.26243
N14786 ; WIPE_START
N14787 M204 S8000
N14788 G1 X190.29 Y201.788 E-.76
N14789 ; WIPE_END
N14790 M73 P93 R3
N14791 G1 E-.04 F1800
N14792 M204 S10000
N14793 G1 X190.971 Y201.289 Z12.8 F60000
N14794 G1 Z12.4
N14795 G1 E.8 F1800
N14796 ; FEATURE: Internal solid infill
N14797 ; LINE_WIDTH: 0.42067
N14798 G1 F4765.056
N14799 M204 S8000
N14800 G1 X191.565 Y200.695 E.02507
N14801 G1 X191.565 Y200.161 E.01594
N14802 G1 X190.606 Y201.119 E.04045
N14803 G1 X190.072 Y201.119 E.01594
N14804 G1 X191.565 Y199.627 E.06299
N14805 G1 X191.565 Y199.092 E.01594
N14806 G1 X189.538 Y201.119 E.08554
N14807 G1 X189.003 Y201.119 E.01594
N14808 G1 X191.565 Y198.558 E.10808
N14809 G1 X191.565 Y198.024 E.01594
N14810 G1 X188.469 Y201.119 E.13063
N14811 G1 X187.935 Y201.119 E.01594
N14812 G1 X191.565 Y197.49 E.15317
N14813 G1 X191.565 Y196.956 E.01594
N14814 G1 X187.401 Y201.119 E.17571
N14815 G1 X186.867 Y201.119 E.01594
N14816 G1 X191.565 Y196.421 E.19826
N14817 G1 X191.565 Y195.887 E.01594
N14818 G1 X186.332 Y201.119 E.2208
N14819 G1 X185.798 Y201.119 E.01594
N14820 G1 X191.565 Y195.353 E.24334
N14821 G1 X191.565 Y194.819 E.01594
N14822 G1 X185.264 Y201.119 E.26589
N14823 G1 X184.73 Y201.119 E.01594
N14824 G1 X191.565 Y194.284 E.28843
N14825 G1 X191.565 Y193.75 E.01594
N14826 G1 X184.195 Y201.119 E.31098
N14827 G1 X183.661 Y201.119 E.01594
N14828 G1 X191.565 Y193.216 E.33352
N14829 G1 X191.565 Y192.682 E.01594
N14830 G1 X183.127 Y201.119 E.35606
N14831 G1 X182.593 Y201.119 E.01594
N14832 G1 X191.565 Y192.148 E.37861
N14833 G1 X191.565 Y191.613 E.01594
N14834 G1 X182.059 Y201.119 E.40115
N14835 G1 X181.524 Y201.119 E.01594
N14836 G1 X191.565 Y191.079 E.42369
N14837 G1 X191.565 Y190.545 E.01594
N14838 G1 X180.99 Y201.119 E.44624
N14839 G1 X180.456 Y201.119 E.01594
N14840 G1 X191.565 Y190.011 E.46878
N14841 G1 X191.565 Y189.477 E.01594
N14842 G1 X179.922 Y201.119 E.49133
N14843 G1 X179.388 Y201.119 E.01594
N14844 G1 X191.565 Y188.942 E.51387
N14845 G1 X191.565 Y188.408 E.01594
N14846 G1 X178.853 Y201.119 E.53641
N14847 G1 X178.319 Y201.119 E.01594
N14848 G1 X191.565 Y187.874 E.55896
N14849 G1 X191.565 Y187.34 E.01594
N14850 G1 X177.785 Y201.119 E.5815
N14851 G1 X177.251 Y201.119 E.01594
N14852 G1 X191.565 Y186.805 E.60404
N14853 G1 X191.565 Y186.271 E.01594
N14854 G1 X176.716 Y201.119 E.62659
N14855 G1 X176.182 Y201.119 E.01594
N14856 G1 X191.565 Y185.737 E.64913
N14857 G1 X191.565 Y185.203 E.01594
N14858 G1 X175.648 Y201.119 E.67168
N14859 G1 X175.114 Y201.119 E.01594
N14860 G1 X191.565 Y184.669 E.69422
N14861 G1 X191.565 Y184.134 E.01594
N14862 G1 X174.58 Y201.119 E.71676
N14863 G1 X174.045 Y201.119 E.01594
N14864 G1 X191.565 Y183.6 E.73931
N14865 G1 X191.565 Y183.066 E.01594
N14866 G1 X173.511 Y201.119 E.76185
N14867 G1 X172.977 Y201.119 E.01594
N14868 G1 X191.565 Y182.532 E.7844
N14869 G1 X191.565 Y181.997 E.01594
N14870 G1 X172.443 Y201.119 E.80694
N14871 G1 X171.908 Y201.119 E.01594
N14872 G1 X191.565 Y181.463 E.82948
N14873 G1 X191.565 Y180.929 E.01594
N14874 G1 X171.374 Y201.119 E.85203
N14875 G1 X170.84 Y201.119 E.01594
N14876 G1 X191.565 Y180.395 E.87457
N14877 G1 X191.565 Y179.861 E.01594
N14878 G1 X170.306 Y201.119 E.89711
N14879 G1 X169.772 Y201.119 E.01594
N14880 G1 X191.565 Y179.326 E.91966
N14881 G1 X191.565 Y178.792 E.01594
N14882 G1 X169.237 Y201.119 E.9422
N14883 G1 X168.703 Y201.119 E.01594
N14884 G1 X191.565 Y178.258 E.96475
N14885 G1 X191.565 Y177.724 E.01594
N14886 G1 X168.169 Y201.119 E.98729
N14887 G1 X167.635 Y201.119 E.01594
N14888 G1 X191.565 Y177.189 E1.00983
N14889 G1 X191.565 Y176.655 E.01594
N14890 G1 X167.1 Y201.119 E1.03238
N14891 G1 X166.566 Y201.119 E.01594
N14892 G1 X191.565 Y176.121 E1.05492
N14893 G1 X191.565 Y175.587 E.01594
N14894 G1 X166.032 Y201.119 E1.07746
N14895 G1 X165.498 Y201.119 E.01594
N14896 G1 X191.565 Y175.053 E1.10001
N14897 G1 X191.565 Y174.518 E.01594
N14898 G1 X164.964 Y201.119 E1.12255
N14899 G1 X164.429 Y201.119 E.01594
N14900 G1 X191.565 Y173.984 E1.1451
N14901 G1 X191.565 Y173.45 E.01594
N14902 G1 X163.895 Y201.119 E1.16764
N14903 G1 X163.361 Y201.119 E.01594
N14904 G1 X191.565 Y172.916 E1.19018
N14905 G1 X191.565 Y172.381 E.01594
N14906 G1 X162.827 Y201.119 E1.21273
N14907 G1 X162.293 Y201.119 E.01594
N14908 G1 X191.565 Y171.847 E1.23527
N14909 G1 X191.565 Y171.313 E.01594
N14910 G1 X161.758 Y201.119 E1.25781
N14911 G1 X161.224 Y201.119 E.01594
N14912 G1 X191.565 Y170.779 E1.28036
N14913 G1 X191.565 Y170.245 E.01594
N14914 G1 X160.69 Y201.119 E1.3029
N14915 G1 X160.156 Y201.119 E.01594
N14916 G1 X191.565 Y169.71 E1.32545
N14917 G1 X191.565 Y169.176 E.01594
N14918 G1 X159.621 Y201.119 E1.34799
N14919 G1 X159.087 Y201.119 E.01594
N14920 G1 X191.565 Y168.642 E1.37053
N14921 G1 X191.565 Y168.108 E.01594
N14922 G1 X158.553 Y201.119 E1.39308
N14923 G1 X158.435 Y201.119 E.00351
N14924 G1 X158.435 Y200.703 E.01243
N14925 G1 X191.565 Y167.574 E1.39804
N14926 G1 X191.565 Y167.039 E.01594
N14927 G1 X158.435 Y200.169 E1.39804
N14928 G1 X158.435 Y199.634 E.01594
N14929 G1 X191.565 Y166.505 E1.39804
N14930 G1 X191.565 Y165.971 E.01594
N14931 G1 X158.435 Y199.1 E1.39804
N14932 G1 X158.435 Y198.566 E.01594
N14933 G1 X191.565 Y165.437 E1.39804
N14934 G1 X191.565 Y164.902 E.01594
N14935 G1 X158.435 Y198.032 E1.39804
N14936 G1 X158.435 Y197.498 E.01594
N14937 G1 X191.565 Y164.368 E1.39804
N14938 G1 X191.565 Y163.834 E.01594
N14939 M73 P93 R2
N14940 G1 X158.435 Y196.963 E1.39804
N14941 G1 X158.435 Y196.429 E.01594
N14942 G1 X191.565 Y163.3 E1.39804
N14943 G1 X191.565 Y162.766 E.01594
N14944 G1 X158.435 Y195.895 E1.39804
N14945 G1 X158.435 Y195.361 E.01594
N14946 G1 X191.565 Y162.231 E1.39804
N14947 G1 X191.565 Y161.697 E.01594
N14948 G1 X158.435 Y194.826 E1.39804
N14949 G1 X158.435 Y194.292 E.01594
N14950 G1 X191.565 Y161.163 E1.39804
N14951 G1 X191.565 Y160.629 E.01594
N14952 M73 P94 R2
N14953 G1 X158.435 Y193.758 E1.39804
N14954 G1 X158.435 Y193.224 E.01594
N14955 G1 X191.565 Y160.094 E1.39804
N14956 G1 X191.565 Y159.56 E.01594
N14957 G1 X158.435 Y192.69 E1.39804
N14958 G1 X158.435 Y192.155 E.01594
N14959 G1 X191.565 Y159.026 E1.39804
N14960 G1 X191.565 Y158.492 E.01594
N14961 G1 X158.435 Y191.621 E1.39804
N14962 G1 X158.435 Y191.087 E.01594
N14963 G1 X191.565 Y157.958 E1.39804
N14964 G1 X191.565 Y157.423 E.01594
N14965 G1 X158.435 Y190.553 E1.39804
N14966 G1 X158.435 Y190.018 E.01594
N14967 G1 X191.565 Y156.889 E1.39804
N14968 G1 X191.565 Y156.355 E.01594
N14969 G1 X158.435 Y189.484 E1.39804
N14970 G1 X158.435 Y188.95 E.01594
N14971 G1 X191.565 Y155.821 E1.39804
N14972 G1 X191.565 Y155.286 E.01594
N14973 G1 X158.435 Y188.416 E1.39804
N14974 G1 X158.435 Y187.882 E.01594
N14975 G1 X191.565 Y154.752 E1.39804
N14976 G1 X191.565 Y154.218 E.01594
N14977 G1 X158.435 Y187.347 E1.39804
N14978 G1 X158.435 Y186.813 E.01594
N14979 G1 X191.565 Y153.684 E1.39804
N14980 G1 X191.565 Y153.15 E.01594
N14981 G1 X158.435 Y186.279 E1.39804
N14982 G1 X158.435 Y185.745 E.01594
N14983 G1 X191.565 Y152.615 E1.39804
N14984 G1 X191.565 Y152.081 E.01594
N14985 G1 X158.435 Y185.211 E1.39804
N14986 G1 X158.435 Y184.676 E.01594
N14987 G1 X191.565 Y151.547 E1.39804
N14988 G1 X191.565 Y151.013 E.01594
N14989 G1 X158.435 Y184.142 E1.39804
N14990 G1 X158.435 Y183.608 E.01594
N14991 G1 X191.565 Y150.479 E1.39804
N14992 G1 X191.565 Y149.944 E.01594
N14993 G1 X158.435 Y183.074 E1.39804
N14994 G1 X158.435 Y182.539 E.01594
N14995 G1 X191.565 Y149.41 E1.39804
N14996 G1 X191.565 Y148.876 E.01594
N14997 G1 X158.435 Y182.005 E1.39804
N14998 G1 X158.435 Y181.471 E.01594
N14999 G1 X191.565 Y148.342 E1.39804
N15000 G1 X191.565 Y147.807 E.01594
N15001 G1 X158.435 Y180.937 E1.39804
N15002 G1 X158.435 Y180.403 E.01594
N15003 G1 X191.565 Y147.273 E1.39804
N15004 G1 X191.565 Y146.739 E.01594
N15005 G1 X158.435 Y179.868 E1.39804
N15006 G1 X158.435 Y179.334 E.01594
N15007 G1 X191.565 Y146.205 E1.39804
N15008 G1 X191.565 Y145.671 E.01594
N15009 G1 X158.435 Y178.8 E1.39804
N15010 G1 X158.435 Y178.266 E.01594
N15011 G1 X191.565 Y145.136 E1.39804
N15012 G1 X191.565 Y144.602 E.01594
N15013 G1 X158.435 Y177.731 E1.39804
N15014 G1 X158.435 Y177.197 E.01594
N15015 G1 X191.565 Y144.068 E1.39804
N15016 G1 X191.565 Y143.534 E.01594
N15017 G1 X158.435 Y176.663 E1.39804
N15018 G1 X158.435 Y176.129 E.01594
N15019 G1 X191.565 Y142.999 E1.39804
N15020 G1 X191.565 Y142.465 E.01594
N15021 G1 X158.435 Y175.595 E1.39804
N15022 G1 X158.435 Y175.06 E.01594
N15023 G1 X191.565 Y141.931 E1.39804
N15024 G1 X191.565 Y141.397 E.01594
N15025 G1 X158.435 Y174.526 E1.39804
N15026 G1 X158.435 Y173.992 E.01594
N15027 G1 X191.565 Y140.863 E1.39804
N15028 G1 X191.565 Y140.328 E.01594
N15029 G1 X158.435 Y173.458 E1.39804
N15030 G1 X158.435 Y172.923 E.01594
N15031 G1 X191.565 Y139.794 E1.39804
N15032 G1 X191.565 Y139.26 E.01594
N15033 G1 X158.435 Y172.389 E1.39804
N15034 G1 X158.435 Y171.855 E.01594
N15035 G1 X191.565 Y138.726 E1.39804
N15036 G1 X191.565 Y138.191 E.01594
N15037 G1 X158.435 Y171.321 E1.39804
N15038 G1 X158.435 Y170.787 E.01594
N15039 G1 X191.565 Y137.657 E1.39804
N15040 G1 X191.565 Y137.123 E.01594
N15041 G1 X158.435 Y170.252 E1.39804
N15042 G1 X158.435 Y169.718 E.01594
N15043 G1 X191.565 Y136.589 E1.39804
N15044 G1 X191.565 Y136.055 E.01594
N15045 G1 X158.435 Y169.184 E1.39804
N15046 G1 X158.435 Y168.65 E.01594
N15047 G1 X191.565 Y135.52 E1.39804
N15048 G1 X191.565 Y134.986 E.01594
N15049 M73 P95 R2
N15050 G1 X158.435 Y168.115 E1.39804
N15051 G1 X158.435 Y167.581 E.01594
N15052 G1 X191.565 Y134.452 E1.39804
N15053 G1 X191.565 Y133.918 E.01594
N15054 G1 X158.435 Y167.047 E1.39804
N15055 G1 X158.435 Y166.513 E.01594
N15056 G1 X191.565 Y133.383 E1.39804
N15057 G1 X191.565 Y132.849 E.01594
N15058 G1 X158.435 Y165.979 E1.39804
N15059 G1 X158.435 Y165.444 E.01594
N15060 G1 X191.565 Y132.315 E1.39804
N15061 G1 X191.565 Y131.781 E.01594
N15062 G1 X158.435 Y164.91 E1.39804
N15063 G1 X158.435 Y164.376 E.01594
N15064 G1 X191.565 Y131.247 E1.39804
N15065 G1 X191.565 Y130.712 E.01594
N15066 G1 X158.435 Y163.842 E1.39804
N15067 G1 X158.435 Y163.308 E.01594
N15068 G1 X191.565 Y130.178 E1.39804
N15069 G1 X191.565 Y129.644 E.01594
N15070 G1 X158.435 Y162.773 E1.39804
N15071 G1 X158.435 Y162.239 E.01594
N15072 G1 X191.565 Y129.11 E1.39804
N15073 G1 X191.565 Y128.576 E.01594
N15074 G1 X158.435 Y161.705 E1.39804
N15075 G1 X158.435 Y161.171 E.01594
N15076 G1 X191.565 Y128.041 E1.39804
N15077 G1 X191.565 Y127.507 E.01594
N15078 G1 X158.435 Y160.636 E1.39804
N15079 G1 X158.435 Y160.102 E.01594
N15080 G1 X191.565 Y126.973 E1.39804
N15081 G1 X191.565 Y126.556 E.01245
N15082 G1 X191.448 Y126.556 E.00349
N15083 G1 X158.435 Y159.568 E1.39311
N15084 G1 X158.435 Y159.034 E.01594
N15085 G1 X190.914 Y126.556 E1.37057
N15086 G1 X190.379 Y126.556 E.01594
N15087 G1 X158.435 Y158.5 E1.34802
N15088 G1 X158.435 Y157.965 E.01594
N15089 G1 X189.845 Y126.556 E1.32548
N15090 G1 X189.311 Y126.556 E.01594
N15091 G1 X158.435 Y157.431 E1.30293
N15092 G1 X158.435 Y156.897 E.01594
N15093 G1 X188.777 Y126.556 E1.28039
N15094 G1 X188.242 Y126.556 E.01594
N15095 G1 X158.435 Y156.363 E1.25785
N15096 G1 X158.435 Y155.828 E.01594
N15097 G1 X187.708 Y126.556 E1.2353
N15098 G1 X187.174 Y126.556 E.01594
N15099 G1 X158.435 Y155.294 E1.21276
N15100 G1 X158.435 Y154.76 E.01594
N15101 G1 X186.64 Y126.556 E1.19022
N15102 G1 X186.106 Y126.556 E.01594
N15103 G1 X158.435 Y154.226 E1.16767
N15104 G1 X158.435 Y153.692 E.01594
N15105 G1 X185.571 Y126.556 E1.14513
N15106 G1 X185.037 Y126.556 E.01594
N15107 G1 X158.435 Y153.157 E1.12258
N15108 G1 X158.435 Y152.623 E.01594
N15109 G1 X184.503 Y126.556 E1.10004
N15110 G1 X183.969 Y126.556 E.01594
N15111 G1 X158.435 Y152.089 E1.0775
N15112 G1 X158.435 Y151.555 E.01594
N15113 G1 X183.435 Y126.556 E1.05495
N15114 G1 X182.9 Y126.556 E.01594
N15115 G1 X158.435 Y151.02 E1.03241
N15116 G1 X158.435 Y150.486 E.01594
N15117 G1 X182.366 Y126.556 E1.00987
N15118 G1 X181.832 Y126.556 E.01594
N15119 G1 X158.435 Y149.952 E.98732
N15120 G1 X158.435 Y149.418 E.01594
N15121 G1 X181.298 Y126.556 E.96478
N15122 G1 X180.763 Y126.556 E.01594
N15123 G1 X158.435 Y148.884 E.94223
N15124 G1 X158.435 Y148.349 E.01594
N15125 G1 X180.229 Y126.556 E.91969
N15126 G1 X179.695 Y126.556 E.01594
N15127 G1 X158.435 Y147.815 E.89715
N15128 G1 X158.435 Y147.281 E.01594
N15129 G1 X179.161 Y126.556 E.8746
N15130 G1 X178.627 Y126.556 E.01594
N15131 G1 X158.435 Y146.747 E.85206
N15132 G1 X158.435 Y146.213 E.01594
N15133 G1 X178.092 Y126.556 E.82952
N15134 G1 X177.558 Y126.556 E.01594
N15135 G1 X158.435 Y145.678 E.80697
N15136 G1 X158.435 Y145.144 E.01594
N15137 G1 X177.024 Y126.556 E.78443
N15138 G1 X176.49 Y126.556 E.01594
N15139 G1 X158.435 Y144.61 E.76188
N15140 G1 X158.435 Y144.076 E.01594
N15141 G1 X175.955 Y126.556 E.73934
N15142 G1 X175.421 Y126.556 E.01594
N15143 G1 X158.435 Y143.541 E.7168
N15144 G1 X158.435 Y143.007 E.01594
N15145 G1 X174.887 Y126.556 E.69425
N15146 G1 X174.353 Y126.556 E.01594
N15147 G1 X158.435 Y142.473 E.67171
N15148 G1 X158.435 Y141.939 E.01594
N15149 G1 X173.819 Y126.556 E.64916
N15150 G1 X173.284 Y126.556 E.01594
N15151 G1 X158.435 Y141.405 E.62662
N15152 G1 X158.435 Y140.87 E.01594
N15153 G1 X172.75 Y126.556 E.60408
N15154 G1 X172.216 Y126.556 E.01594
N15155 G1 X158.435 Y140.336 E.58153
N15156 G1 X158.435 Y139.802 E.01594
N15157 G1 X171.682 Y126.556 E.55899
N15158 G1 X171.147 Y126.556 E.01594
N15159 G1 X158.435 Y139.268 E.53645
N15160 G1 X158.435 Y138.733 E.01594
N15161 G1 X170.613 Y126.556 E.5139
N15162 G1 X170.079 Y126.556 E.01594
N15163 M73 P95 R1
N15164 G1 X158.435 Y138.199 E.49136
N15165 G1 X158.435 Y137.665 E.01594
N15166 G1 X169.545 Y126.556 E.46881
N15167 G1 X169.011 Y126.556 E.01594
N15168 G1 X158.435 Y137.131 E.44627
N15169 G1 X158.435 Y136.597 E.01594
N15170 G1 X168.476 Y126.556 E.42373
N15171 G1 X167.942 Y126.556 E.01594
N15172 G1 X158.435 Y136.062 E.40118
N15173 G1 X158.435 Y135.528 E.01594
N15174 G1 X167.408 Y126.556 E.37864
N15175 G1 X166.874 Y126.556 E.01594
N15176 G1 X158.435 Y134.994 E.3561
N15177 G1 X158.435 Y134.46 E.01594
N15178 G1 X166.339 Y126.556 E.33355
N15179 G1 X165.805 Y126.556 E.01594
N15180 G1 X158.435 Y133.925 E.31101
N15181 G1 X158.435 Y133.391 E.01594
N15182 G1 X165.271 Y126.556 E.28846
N15183 G1 X164.737 Y126.556 E.01594
N15184 M73 P96 R1
N15185 G1 X158.435 Y132.857 E.26592
N15186 G1 X158.435 Y132.323 E.01594
N15187 G1 X164.203 Y126.556 E.24338
N15188 G1 X163.668 Y126.556 E.01594
N15189 G1 X158.435 Y131.789 E.22083
N15190 G1 X158.435 Y131.254 E.01594
N15191 G1 X163.134 Y126.556 E.19829
N15192 G1 X162.6 Y126.556 E.01594
N15193 G1 X158.435 Y130.72 E.17575
N15194 G1 X158.435 Y130.186 E.01594
N15195 G1 X162.066 Y126.556 E.1532
N15196 G1 X161.532 Y126.556 E.01594
N15197 G1 X158.435 Y129.652 E.13066
N15198 G1 X158.435 Y129.118 E.01594
N15199 G1 X160.997 Y126.556 E.10811
N15200 G1 X160.463 Y126.556 E.01594
N15201 G1 X158.435 Y128.583 E.08557
N15202 G1 X158.435 Y128.049 E.01594
N15203 G1 X159.929 Y126.556 E.06303
N15204 G1 X159.395 Y126.556 E.01594
N15205 G1 X158.435 Y127.515 E.04048
N15206 G1 X158.435 Y126.981 E.01594
N15207 G1 X159.03 Y126.386 E.0251
N15208 ; WIPE_START
N15209 G1 X158.435 Y126.981 E-.31964
N15210 G1 X158.435 Y127.515 E-.203
N15211 G1 X158.877 Y127.073 E-.23736
N15212 ; WIPE_END
N15213 G1 E-.04 F1800
N15214 M204 S10000
N15215 G17
N15216 G3 Z12.8 I1.217 J0 P1  F60000
N15217 ; stop printing object, unique label id: 229
N15218 M625
N15219 ; object ids of layer 62 start: 229
N15220 M624 AQAAAAAAAAA=
N15221 ;======== H2D 20250527========
N15222 ; SKIPPABLE_START
N15223 ; SKIPTYPE: timelapse
N15224 M622.1 S1 ; for prev firware, default turned on
N15225 
N15226 M1002 judge_flag timelapse_record_flag
N15227 
N15228 M622 J1
N15229 M993 A2 B2 C2
N15230 M993 A0 B0 C0
N15231 
N15232 
N15233 
N15234 
N15235     M9711 M0 E1 X260 Y141 Z12.8 S11 C10 O0 T3000
N15236 
N15237 
N15238 
N15239 M993 A3 B3 C3
N15240 
N15241 M623
N15242 ; SKIPPABLE_END
N15243 
N15244 ; object ids of this layer62 end: 229
N15245 M625
N15246 ; CHANGE_LAYER
N15247 ; Z_HEIGHT: 12.6
N15248 ; LAYER_HEIGHT: 0.200001
N15249 ;======== H2D 20250521========
N15250 ; layer num/total_layer_count: 63/63
N15251 ; update layer progress
N15252 M73 L63
N15253 M991 S0 P62 ;notify layer change
N15254 
N15255 
N15256 ; OBJECT_ID: 229
N15257 ; COOLING_NODE: 0
N15258 ; start printing object, unique label id: 229
N15259 M624 AQAAAAAAAAA=
N15260 G1 X192.29 Y201.845 F60000
N15261 G1 Z12.6
N15262 G1 E.8 F1800
N15263 ; FEATURE: Outer wall
N15264 ; LINE_WIDTH: 0.42
N15265 G1 F4773.528
N15266 M204 S5000
N15267 G1 X157.71 Y201.845 E1.03002
N15268 G1 X157.71 Y125.83 E2.26421
N15269 G1 X192.29 Y125.83 E1.03002
N15270 G1 X192.29 Y201.785 E2.26243
N15271 ; WIPE_START
N15272 M204 S8000
N15273 G1 X190.29 Y201.788 E-.76
N15274 ; WIPE_END
N15275 G1 E-.04 F1800
N15276 M204 S10000
N15277 G1 X190.472 Y194.158 Z13 F60000
N15278 G1 X192.083 Y126.795 Z13
N15279 G1 Z12.6
N15280 G1 E.8 F1800
N15281 ; FEATURE: Top surface
N15282 G1 F4773.528
N15283 M204 S2000
N15284 G1 X191.326 Y126.038 E.03189
N15285 G1 X190.792 Y126.038 E.01588
N15286 G1 X192.083 Y127.328 E.05435
N15287 G1 X192.083 Y127.861 E.01588
N15288 G1 X190.259 Y126.038 E.07681
N15289 G1 X189.726 Y126.038 E.01588
N15290 G1 X192.083 Y128.394 E.09928
N15291 G1 X192.083 Y128.928 E.01588
N15292 G1 X189.193 Y126.038 E.12174
N15293 G1 X188.659 Y126.038 E.01588
N15294 G1 X192.083 Y129.461 E.1442
N15295 G1 X192.083 Y129.994 E.01588
N15296 G1 X188.126 Y126.038 E.16667
N15297 G1 X187.593 Y126.038 E.01588
N15298 G1 X192.083 Y130.527 E.18913
N15299 G1 X192.083 Y131.061 E.01588
N15300 G1 X187.06 Y126.038 E.21159
N15301 G1 X186.526 Y126.038 E.01588
N15302 G1 X192.083 Y131.594 E.23406
N15303 G1 X192.083 Y132.127 E.01588
N15304 G1 X185.993 Y126.038 E.25652
N15305 G1 X185.46 Y126.038 E.01588
N15306 G1 X192.083 Y132.66 E.27898
N15307 G1 X192.083 Y133.194 E.01588
N15308 G1 X184.927 Y126.038 E.30145
N15309 G1 X184.393 Y126.038 E.01588
N15310 G1 X192.083 Y133.727 E.32391
N15311 G1 X192.083 Y134.26 E.01588
N15312 G1 X183.86 Y126.038 E.34637
N15313 G1 X183.327 Y126.038 E.01588
N15314 G1 X192.083 Y134.793 E.36884
N15315 G1 X192.083 Y135.327 E.01588
N15316 G1 X182.794 Y126.038 E.3913
N15317 G1 X182.26 Y126.038 E.01588
N15318 G1 X192.083 Y135.86 E.41376
N15319 G1 X192.083 Y136.393 E.01588
N15320 G1 X181.727 Y126.038 E.43622
N15321 G1 X181.194 Y126.038 E.01588
N15322 G1 X192.083 Y136.926 E.45869
N15323 G1 X192.083 Y137.46 E.01588
N15324 G1 X180.661 Y126.038 E.48115
N15325 G1 X180.127 Y126.038 E.01588
N15326 G1 X192.083 Y137.993 E.50361
N15327 G1 X192.083 Y138.526 E.01588
N15328 G1 X179.594 Y126.038 E.52608
N15329 G1 X179.061 Y126.038 E.01588
N15330 G1 X192.083 Y139.059 E.54854
N15331 G1 X192.083 Y139.593 E.01588
N15332 G1 X178.527 Y126.038 E.571
N15333 G1 X177.994 Y126.038 E.01588
N15334 G1 X192.083 Y140.126 E.59347
N15335 G1 X192.083 Y140.659 E.01588
N15336 G1 X177.461 Y126.038 E.61593
N15337 G1 X176.928 Y126.038 E.01588
N15338 G1 X192.083 Y141.192 E.63839
N15339 G1 X192.083 Y141.726 E.01588
N15340 G1 X176.394 Y126.038 E.66086
N15341 G1 X175.861 Y126.038 E.01588
N15342 G1 X192.083 Y142.259 E.68332
N15343 G1 X192.083 Y142.792 E.01588
N15344 G1 X175.328 Y126.038 E.70578
N15345 G1 X174.795 Y126.038 E.01588
N15346 G1 X192.083 Y143.326 E.72825
N15347 G1 X192.083 Y143.859 E.01588
N15348 G1 X174.261 Y126.038 E.75071
N15349 G1 X173.728 Y126.038 E.01588
N15350 G1 X192.083 Y144.392 E.77317
N15351 G1 X192.083 Y144.925 E.01588
N15352 G1 X173.195 Y126.038 E.79564
N15353 G1 X172.662 Y126.038 E.01588
N15354 G1 X192.083 Y145.459 E.8181
N15355 G1 X192.083 Y145.992 E.01588
N15356 G1 X172.128 Y126.038 E.84056
N15357 G1 X171.595 Y126.038 E.01588
N15358 G1 X192.083 Y146.525 E.86303
N15359 G1 X192.083 Y147.058 E.01588
N15360 G1 X171.062 Y126.038 E.88549
N15361 G1 X170.529 Y126.038 E.01588
N15362 G1 X192.083 Y147.592 E.90795
N15363 G1 X192.083 Y148.125 E.01588
N15364 G1 X169.995 Y126.038 E.93042
N15365 G1 X169.462 Y126.038 E.01588
N15366 G1 X192.083 Y148.658 E.95288
N15367 G1 X192.083 Y149.191 E.01588
N15368 G1 X168.929 Y126.038 E.97534
N15369 G1 X168.396 Y126.038 E.01588
N15370 G1 X192.083 Y149.725 E.99781
N15371 G1 X192.083 Y150.258 E.01588
N15372 G1 X167.862 Y126.038 E1.02027
N15373 G1 X167.329 Y126.038 E.01588
N15374 G1 X192.083 Y150.791 E1.04273
N15375 G1 X192.083 Y151.324 E.01588
N15376 G1 X166.796 Y126.038 E1.0652
N15377 G1 X166.263 Y126.038 E.01588
N15378 G1 X192.083 Y151.858 E1.08766
N15379 G1 X192.083 Y152.391 E.01588
N15380 G1 X165.729 Y126.038 E1.11012
N15381 G1 X165.196 Y126.038 E.01588
N15382 G1 X192.083 Y152.924 E1.13259
N15383 G1 X192.083 Y153.457 E.01588
N15384 G1 X164.663 Y126.038 E1.15505
N15385 G1 X164.13 Y126.038 E.01588
N15386 G1 X192.083 Y153.991 E1.17751
N15387 G1 X192.083 Y154.524 E.01588
N15388 G1 X163.596 Y126.038 E1.19998
N15389 G1 X163.063 Y126.038 E.01588
N15390 G1 X192.083 Y155.057 E1.22244
N15391 G1 X192.083 Y155.59 E.01588
N15392 G1 X162.53 Y126.038 E1.2449
N15393 G1 X161.997 Y126.038 E.01588
N15394 G1 X192.083 Y156.124 E1.26737
N15395 G1 X192.083 Y156.657 E.01588
N15396 G1 X161.463 Y126.038 E1.28983
N15397 G1 X160.93 Y126.038 E.01588
N15398 G1 X192.083 Y157.19 E1.31229
N15399 G1 X192.083 Y157.723 E.01588
N15400 G1 X160.397 Y126.038 E1.33476
N15401 G1 X159.863 Y126.038 E.01588
N15402 G1 X192.083 Y158.257 E1.35722
N15403 G1 X192.083 Y158.79 E.01588
N15404 G1 X159.33 Y126.038 E1.37968
N15405 G1 X158.797 Y126.038 E.01588
N15406 G1 X192.083 Y159.323 E1.40214
N15407 G1 X192.083 Y159.857 E.01588
N15408 G1 X158.264 Y126.038 E1.42461
N15409 G1 X157.917 Y126.225 E.01172
N15410 G1 X192.083 Y160.39 E1.4392
N15411 G1 X192.083 Y160.923 E.01588
N15412 G1 X157.917 Y126.758 E1.4392
N15413 G1 X157.917 Y127.291 E.01588
N15414 G1 X192.083 Y161.456 E1.4392
N15415 G1 X192.083 Y161.99 E.01588
N15416 G1 X157.917 Y127.824 E1.4392
N15417 G1 X157.917 Y128.358 E.01588
N15418 M73 P97 R1
N15419 G1 X192.083 Y162.523 E1.4392
N15420 G1 X192.083 Y163.056 E.01588
N15421 G1 X157.917 Y128.891 E1.4392
N15422 G1 X157.917 Y129.424 E.01588
N15423 G1 X192.083 Y163.589 E1.4392
N15424 G1 X192.083 Y164.123 E.01588
N15425 G1 X157.917 Y129.957 E1.4392
N15426 G1 X157.917 Y130.491 E.01588
N15427 G1 X192.083 Y164.656 E1.4392
N15428 G1 X192.083 Y165.189 E.01588
N15429 G1 X157.917 Y131.024 E1.4392
N15430 G1 X157.917 Y131.557 E.01588
N15431 G1 X192.083 Y165.722 E1.4392
N15432 G1 X192.083 Y166.256 E.01588
N15433 G1 X157.917 Y132.09 E1.4392
N15434 G1 X157.917 Y132.624 E.01588
N15435 G1 X192.083 Y166.789 E1.4392
N15436 G1 X192.083 Y167.322 E.01588
N15437 G1 X157.917 Y133.157 E1.4392
N15438 G1 X157.917 Y133.69 E.01588
N15439 G1 X192.083 Y167.855 E1.4392
N15440 G1 X192.083 Y168.389 E.01588
N15441 G1 X157.917 Y134.223 E1.4392
N15442 G1 X157.917 Y134.757 E.01588
N15443 G1 X192.083 Y168.922 E1.4392
N15444 G1 X192.083 Y169.455 E.01588
N15445 G1 X157.917 Y135.29 E1.4392
N15446 G1 X157.917 Y135.823 E.01588
N15447 G1 X192.083 Y169.988 E1.4392
N15448 G1 X192.083 Y170.522 E.01588
N15449 G1 X157.917 Y136.356 E1.4392
N15450 G1 X157.917 Y136.89 E.01588
N15451 G1 X192.083 Y171.055 E1.4392
N15452 G1 X192.083 Y171.588 E.01588
N15453 G1 X157.917 Y137.423 E1.4392
N15454 G1 X157.917 Y137.956 E.01588
N15455 G1 X192.083 Y172.121 E1.4392
N15456 G1 X192.083 Y172.655 E.01588
N15457 G1 X157.917 Y138.489 E1.4392
N15458 G1 X157.917 Y139.023 E.01588
N15459 G1 X192.083 Y173.188 E1.4392
N15460 G1 X192.083 Y173.721 E.01588
N15461 G1 X157.917 Y139.556 E1.4392
N15462 G1 X157.917 Y140.089 E.01588
N15463 G1 X192.083 Y174.254 E1.4392
N15464 G1 X192.083 Y174.788 E.01588
N15465 G1 X157.917 Y140.622 E1.4392
N15466 G1 X157.917 Y141.156 E.01588
N15467 G1 X192.083 Y175.321 E1.4392
N15468 G1 X192.083 Y175.854 E.01588
N15469 G1 X157.917 Y141.689 E1.4392
N15470 G1 X157.917 Y142.222 E.01588
N15471 G1 X192.083 Y176.387 E1.4392
N15472 G1 X192.083 Y176.921 E.01588
N15473 G1 X157.917 Y142.755 E1.4392
N15474 G1 X157.917 Y143.289 E.01588
N15475 G1 X192.083 Y177.454 E1.4392
N15476 G1 X192.083 Y177.987 E.01588
N15477 G1 X157.917 Y143.822 E1.4392
N15478 G1 X157.917 Y144.355 E.01588
N15479 G1 X192.083 Y178.521 E1.4392
N15480 G1 X192.083 Y179.054 E.01588
N15481 G1 X157.917 Y144.889 E1.4392
N15482 G1 X157.917 Y145.422 E.01588
N15483 G1 X192.083 Y179.587 E1.4392
N15484 G1 X192.083 Y180.12 E.01588
N15485 G1 X157.917 Y145.955 E1.4392
N15486 G1 X157.917 Y146.488 E.01588
N15487 G1 X192.083 Y180.654 E1.4392
N15488 G1 X192.083 Y181.187 E.01588
N15489 G1 X157.917 Y147.022 E1.4392
N15490 G1 X157.917 Y147.555 E.01588
N15491 M73 P97 R0
N15492 G1 X192.083 Y181.72 E1.4392
N15493 G1 X192.083 Y182.253 E.01588
N15494 M73 P98 R0
N15495 G1 X157.917 Y148.088 E1.4392
N15496 G1 X157.917 Y148.621 E.01588
N15497 G1 X192.083 Y182.787 E1.4392
N15498 G1 X192.083 Y183.32 E.01588
N15499 G1 X157.917 Y149.155 E1.4392
N15500 G1 X157.917 Y149.688 E.01588
N15501 G1 X192.083 Y183.853 E1.4392
N15502 G1 X192.083 Y184.386 E.01588
N15503 G1 X157.917 Y150.221 E1.4392
N15504 G1 X157.917 Y150.754 E.01588
N15505 G1 X192.083 Y184.92 E1.4392
N15506 G1 X192.083 Y185.453 E.01588
N15507 G1 X157.917 Y151.288 E1.4392
N15508 G1 X157.917 Y151.821 E.01588
N15509 G1 X192.083 Y185.986 E1.4392
N15510 G1 X192.083 Y186.519 E.01588
N15511 G1 X157.917 Y152.354 E1.4392
N15512 G1 X157.917 Y152.887 E.01588
N15513 G1 X192.083 Y187.053 E1.4392
N15514 G1 X192.083 Y187.586 E.01588
N15515 G1 X157.917 Y153.421 E1.4392
N15516 G1 X157.917 Y153.954 E.01588
N15517 G1 X192.083 Y188.119 E1.4392
N15518 G1 X192.083 Y188.652 E.01588
N15519 G1 X157.917 Y154.487 E1.4392
N15520 G1 X157.917 Y155.02 E.01588
N15521 G1 X192.083 Y189.186 E1.4392
N15522 G1 X192.083 Y189.719 E.01588
N15523 G1 X157.917 Y155.554 E1.4392
N15524 G1 X157.917 Y156.087 E.01588
N15525 G1 X192.083 Y190.252 E1.4392
N15526 G1 X192.083 Y190.785 E.01588
N15527 G1 X157.917 Y156.62 E1.4392
N15528 G1 X157.917 Y157.153 E.01588
N15529 G1 X192.083 Y191.319 E1.4392
N15530 G1 X192.083 Y191.852 E.01588
N15531 G1 X157.917 Y157.687 E1.4392
N15532 G1 X157.917 Y158.22 E.01588
N15533 G1 X192.083 Y192.385 E1.4392
N15534 G1 X192.083 Y192.918 E.01588
N15535 G1 X157.917 Y158.753 E1.4392
N15536 G1 X157.917 Y159.286 E.01588
N15537 G1 X192.083 Y193.452 E1.4392
N15538 G1 X192.083 Y193.985 E.01588
N15539 G1 X157.917 Y159.82 E1.4392
N15540 G1 X157.917 Y160.353 E.01588
N15541 G1 X192.083 Y194.518 E1.4392
N15542 G1 X192.083 Y195.052 E.01588
N15543 G1 X157.917 Y160.886 E1.4392
N15544 G1 X157.917 Y161.419 E.01588
N15545 G1 X192.083 Y195.585 E1.4392
N15546 G1 X192.083 Y196.118 E.01588
N15547 G1 X157.917 Y161.953 E1.4392
N15548 G1 X157.917 Y162.486 E.01588
N15549 G1 X192.083 Y196.651 E1.4392
N15550 G1 X192.083 Y197.185 E.01588
N15551 G1 X157.917 Y163.019 E1.4392
N15552 G1 X157.917 Y163.553 E.01588
N15553 G1 X192.083 Y197.718 E1.4392
N15554 G1 X192.083 Y198.251 E.01588
N15555 G1 X157.917 Y164.086 E1.4392
N15556 G1 X157.917 Y164.619 E.01588
N15557 G1 X192.083 Y198.784 E1.4392
N15558 G1 X192.083 Y199.318 E.01588
N15559 G1 X157.917 Y165.152 E1.4392
N15560 G1 X157.917 Y165.686 E.01588
N15561 G1 X192.083 Y199.851 E1.4392
N15562 G1 X192.083 Y200.384 E.01588
N15563 G1 X157.917 Y166.219 E1.4392
N15564 G1 X157.917 Y166.752 E.01588
N15565 G1 X192.083 Y200.917 E1.4392
N15566 G1 X192.083 Y201.451 E.01588
N15567 G1 X157.917 Y167.285 E1.4392
N15568 G1 X157.917 Y167.819 E.01588
N15569 G1 X191.736 Y201.637 E1.4246
N15570 G1 X191.203 Y201.637 E.01588
N15571 G1 X157.917 Y168.352 E1.40214
N15572 G1 X157.917 Y168.885 E.01588
N15573 G1 X190.67 Y201.637 E1.37968
N15574 G1 X190.136 Y201.637 E.01588
N15575 G1 X157.917 Y169.418 E1.35721
N15576 G1 X157.917 Y169.952 E.01588
N15577 G1 X189.603 Y201.637 E1.33475
N15578 G1 X189.07 Y201.637 E.01588
N15579 G1 X157.917 Y170.485 E1.31229
N15580 G1 X157.917 Y171.018 E.01588
N15581 G1 X188.537 Y201.637 E1.28982
N15582 G1 X188.003 Y201.637 E.01588
N15583 G1 X157.917 Y171.551 E1.26736
N15584 G1 X157.917 Y172.085 E.01588
N15585 M73 P99 R0
N15586 G1 X187.47 Y201.637 E1.2449
N15587 G1 X186.937 Y201.637 E.01588
N15588 G1 X157.917 Y172.618 E1.22243
N15589 G1 X157.917 Y173.151 E.01588
N15590 G1 X186.404 Y201.637 E1.19997
N15591 G1 X185.87 Y201.637 E.01588
N15592 G1 X157.917 Y173.684 E1.17751
N15593 G1 X157.917 Y174.218 E.01588
N15594 G1 X185.337 Y201.637 E1.15504
N15595 G1 X184.804 Y201.637 E.01588
N15596 G1 X157.917 Y174.751 E1.13258
N15597 G1 X157.917 Y175.284 E.01588
N15598 G1 X184.271 Y201.637 E1.11012
N15599 G1 X183.737 Y201.637 E.01588
N15600 G1 X157.917 Y175.817 E1.08765
N15601 G1 X157.917 Y176.351 E.01588
N15602 G1 X183.204 Y201.637 E1.06519
N15603 G1 X182.671 Y201.637 E.01588
N15604 G1 X157.917 Y176.884 E1.04273
N15605 G1 X157.917 Y177.417 E.01588
N15606 G1 X182.138 Y201.637 E1.02026
N15607 G1 X181.604 Y201.637 E.01588
N15608 G1 X157.917 Y177.95 E.9978
N15609 G1 X157.917 Y178.484 E.01588
N15610 G1 X181.071 Y201.637 E.97534
N15611 G1 X180.538 Y201.637 E.01588
N15612 G1 X157.917 Y179.017 E.95287
N15613 G1 X157.917 Y179.55 E.01588
N15614 G1 X180.005 Y201.637 E.93041
N15615 G1 X179.471 Y201.637 E.01588
N15616 G1 X157.917 Y180.084 E.90795
N15617 G1 X157.917 Y180.617 E.01588
N15618 G1 X178.938 Y201.637 E.88548
N15619 G1 X178.405 Y201.637 E.01588
N15620 G1 X157.917 Y181.15 E.86302
N15621 G1 X157.917 Y181.683 E.01588
N15622 G1 X177.871 Y201.637 E.84056
N15623 G1 X177.338 Y201.637 E.01588
N15624 G1 X157.917 Y182.217 E.81809
N15625 G1 X157.917 Y182.75 E.01588
N15626 G1 X176.805 Y201.637 E.79563
N15627 G1 X176.272 Y201.637 E.01588
N15628 G1 X157.917 Y183.283 E.77317
N15629 G1 X157.917 Y183.816 E.01588
N15630 G1 X175.738 Y201.637 E.75071
N15631 G1 X175.205 Y201.637 E.01588
N15632 G1 X157.917 Y184.35 E.72824
N15633 G1 X157.917 Y184.883 E.01588
N15634 G1 X174.672 Y201.637 E.70578
N15635 G1 X174.139 Y201.637 E.01588
N15636 G1 X157.917 Y185.416 E.68332
N15637 G1 X157.917 Y185.949 E.01588
N15638 G1 X173.605 Y201.637 E.66085
N15639 G1 X173.072 Y201.637 E.01588
N15640 G1 X157.917 Y186.483 E.63839
N15641 G1 X157.917 Y187.016 E.01588
N15642 G1 X172.539 Y201.637 E.61593
N15643 G1 X172.006 Y201.637 E.01588
N15644 G1 X157.917 Y187.549 E.59346
N15645 G1 X157.917 Y188.082 E.01588
N15646 G1 X171.472 Y201.637 E.571
N15647 G1 X170.939 Y201.637 E.01588
N15648 G1 X157.917 Y188.616 E.54854
N15649 G1 X157.917 Y189.149 E.01588
N15650 G1 X170.406 Y201.637 E.52607
N15651 G1 X169.873 Y201.637 E.01588
N15652 G1 X157.917 Y189.682 E.50361
N15653 G1 X157.917 Y190.215 E.01588
N15654 G1 X169.339 Y201.637 E.48115
N15655 G1 X168.806 Y201.637 E.01588
N15656 G1 X157.917 Y190.749 E.45868
N15657 G1 X157.917 Y191.282 E.01588
N15658 G1 X168.273 Y201.637 E.43622
N15659 G1 X167.74 Y201.637 E.01588
N15660 G1 X157.917 Y191.815 E.41376
N15661 G1 X157.917 Y192.348 E.01588
N15662 G1 X167.206 Y201.637 E.39129
N15663 G1 X166.673 Y201.637 E.01588
N15664 G1 X157.917 Y192.882 E.36883
N15665 G1 X157.917 Y193.415 E.01588
N15666 G1 X166.14 Y201.637 E.34637
N15667 G1 X165.607 Y201.637 E.01588
N15668 G1 X157.917 Y193.948 E.3239
N15669 G1 X157.917 Y194.481 E.01588
N15670 G1 X165.073 Y201.637 E.30144
N15671 G1 X164.54 Y201.637 E.01588
N15672 G1 X157.917 Y195.015 E.27898
N15673 G1 X157.917 Y195.548 E.01588
N15674 G1 X164.007 Y201.637 E.25651
N15675 G1 X163.474 Y201.637 E.01588
N15676 G1 X157.917 Y196.081 E.23405
N15677 G1 X157.917 Y196.614 E.01588
N15678 G1 X162.94 Y201.637 E.21159
N15679 G1 X162.407 Y201.637 E.01588
N15680 G1 X157.917 Y197.148 E.18912
N15681 G1 X157.917 Y197.681 E.01588
N15682 G1 X161.874 Y201.637 E.16666
N15683 G1 X161.34 Y201.637 E.01588
N15684 G1 X157.917 Y198.214 E.1442
N15685 G1 X157.917 Y198.748 E.01588
N15686 G1 X160.807 Y201.637 E.12173
N15687 G1 X160.274 Y201.637 E.01588
N15688 G1 X157.917 Y199.281 E.09927
N15689 G1 X157.917 Y199.814 E.01588
N15690 G1 X159.741 Y201.637 E.07681
N15691 G1 X159.207 Y201.637 E.01588
N15692 G1 X157.917 Y200.347 E.05434
N15693 G1 X157.917 Y200.881 E.01588
N15694 G1 X158.674 Y201.637 E.03188
N15695 ; WIPE_START
N15696 M204 S8000
N15697 G1 X157.917 Y200.881 E-.40672
N15698 G1 X157.917 Y200.347 E-.20264
N15699 G1 X158.198 Y200.628 E-.15064
N15700 ; WIPE_END
N15701 G1 E-.04 F1800
N15702 M204 S10000
N15703 G1 X165.827 Y200.85 Z13 F60000
N15704 G1 X192.101 Y201.614 Z13
N15705 G1 Z12.6
N15706 G1 E.8 F1800
N15707 ; FEATURE: Gap infill
N15708 ; LINE_WIDTH: 0.127568
N15709 G1 F15000
N15710 M204 S8000
N15711 G1 X191.76 Y201.614 E.00229
N15712 ; WIPE_START
N15713 G1 X192.101 Y201.614 E-.76
N15714 ; WIPE_END
N15715 G1 E-.04 F1800
N15716 M204 S10000
N15717 G17
N15718 G3 Z13 I1.217 J0 P1  F60000
N15719 ; stop printing object, unique label id: 229
N15720 M625
N15721 ; object ids of layer 63 start: 229
N15722 M624 AQAAAAAAAAA=
N15723 ;======== H2D 20250527========
N15724 ; SKIPPABLE_START
N15725 ; SKIPTYPE: timelapse
N15726 M622.1 S1 ; for prev firware, default turned on
N15727 
N15728 M1002 judge_flag timelapse_record_flag
N15729 
N15730 M622 J1
N15731 M993 A2 B2 C2
N15732 M993 A0 B0 C0
N15733 
N15734 
N15735 
N15736 
N15737     M9711 M0 E1 X260 Y141 Z13 S11 C10 O0 T3000
N15738 
N15739 
N15740 
N15741 M993 A3 B3 C3
N15742 
N15743 M623
N15744 ; SKIPPABLE_END
N15745 
N15746 ; object ids of this layer63 end: 229
N15747 M625
N15748 ; close powerlost recovery
N15749 M1003 S0
N15750 M106 S0
N15751 M106 P2 S0
N15752 M981 S0 P20000 ; close spaghetti detector
N15753 ; FEATURE: Custom
N15754 ; MACHINE_END_GCODE_START
N15755 ; filament end gcode 
N15756 ;===== date: 2025/05/16 =====================
N15757 ;===== H2D =====================
N15758 G392 S0 ;turn off nozzle clog detect
N15759 M993 A0 B0 C0 ; nozzle cam detection not allowed.
N15760 
N15761 M400 ; wait for buffer to clear
N15762 G92 E0 ; zero the extruder
N15763 G1 E-0.8 F1800 ; retract
N15764 G1 Z13.1 F900 ; lower z a little
N15765 
N15766 G90
N15767 M141 S0 ; turn off chamber heating
N15768 M140 S0 ; turn off bed
N15769 M106 S0 ; turn off fan
N15770 M106 P2 S0 ; turn off remote part cooling fan
N15771 M106 P3 S0 ; turn off chamber cooling fan
N15772 
N15773 ; pull back filament to AMS
N15774 M620 S65535
N15775 T65535
N15776 G150.2
N15777 M621 S65535
N15778 
N15779 M620 S65279
N15780 T65279
N15781 G150.2
N15782 M621 S65279
N15783 
N15784 G150.3
N15785 
N15786 M1002 judge_flag timelapse_record_flag
N15787 M622 J1
N15788     M400 ; wait all motion done
N15789     M991 S0 P-1 ;end smooth timelapse at safe pos
N15790     M400 S5 ;wait for last picture to be taken
N15791 M623  ;end of "timelapse_record_flag"
N15792 
N15793 M104 S0 T0; turn off hotend
N15794 M104 S0 T1; turn off hotend
N15795 
N15796 M400 ; wait all motion done
N15797 M17 S
N15798 M17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom
N15799 
N15800     G1 Z112.6 F600
N15801     G1 Z110.6
N15802 
N15803 M400 P100
N15804 M17 R ; restore z current
N15805 
N15806 M220 S100  ; Reset feedrate magnitude
N15807 M201.2 K1.0 ; Reset acc magnitude
N15808 M73.2   R1.0 ;Reset left time magnitude
N15809 M1002 set_gcode_claim_speed_level : 0
N15810 
N15811 M1015.4 S0 K0 ;disable air printing detect
N15812 ;=====printer finish  sound=========
N15813 M17
N15814 M400 S1
N15815 M1006 S1
N15816 M1006 A53 B10 L99 C53 D10 M99 E53 F10 N99 
N15817 M1006 A57 B10 L99 C57 D10 M99 E57 F10 N99 
N15818 M1006 A0 B15 L0 C0 D15 M0 E0 F15 N0 
N15819 M1006 A53 B10 L99 C53 D10 M99 E53 F10 N99 
N15820 M1006 A57 B10 L99 C57 D10 M99 E57 F10 N99 
N15821 M1006 A0 B15 L0 C0 D15 M0 E0 F15 N0 
N15822 M1006 A48 B10 L99 C48 D10 M99 E48 F10 N99 
N15823 M1006 A0 B15 L0 C0 D15 M0 E0 F15 N0 
N15824 M1006 A60 B10 L99 C60 D10 M99 E60 F10 N99 
N15825 M1006 W
N15826 ;=====printer finish  sound=========
N15827 M400
N15828 M18
N15829 
N15830 M73 P100 R0
N15831 ; EXECUTABLE_BLOCK_END
N15832 
