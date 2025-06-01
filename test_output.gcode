N1 ; HEADER_BLOCK_START
N2 ; BambuStudio 02.00.03.54
N3 ; model printing time: 24m 13s; total estimated time: 33m 46s
N4 ; total layer number: 63
N5 ; total filament length [mm] : 5019.53,1.14
N6 ; total filament volume [cm^3] : 12073.38,2.74
N7 ; total filament weight [g] : 15.09,0.00
N8 ; model label id: 79,90
N9 ; filament_density: 1.25,1.26,1.26,1.28,1.27
N10 ; filament_diameter: 1.75,1.75,1.75,1.75,1.75
N11 ; max_z_height: 12.69
N12 ; HEADER_BLOCK_END
N13 
N14 ; CONFIG_BLOCK_START
N15 ; accel_to_decel_enable = 0
N16 ; accel_to_decel_factor = 50%
N17 ; activate_air_filtration = 0,0,0,0,0
N18 ; additional_cooling_fan_speed = 0,100,100,0,0
N19 ; apply_scarf_seam_on_circles = 1
N20 ; auxiliary_fan = 1
N21 ; bed_custom_model = 
N22 ; bed_custom_texture = 
N23 ; bed_exclude_area = 
N24 ; bed_temperature_formula = by_highest_temp
N25 ; before_layer_change_gcode = 
N26 ; best_object_pos = 0.3,0.5
N27 ; bottom_color_penetration_layers = 3
N28 ; bottom_shell_layers = 3
N29 ; bottom_shell_thickness = 0
N30 ; bottom_surface_pattern = monotonic
N31 ; bridge_angle = 0
N32 ; bridge_flow = 1
N33 ; bridge_no_support = 0
N34 ; bridge_speed = 50,50
N35 ; brim_object_gap = 0.1
N36 ; brim_type = auto_brim
N37 ; brim_width = 5
N38 ; chamber_temperatures = 0,0,0,0,0
N39 ; change_filament_gcode = ;======== H2D ========\n;===== 20250427 =====\nM993 A2 B2 C2 ; nozzle cam detection allow status save.\nM993 A0 B0 C0 ; nozzle cam detection not allowed.\n\n{if (filament_type[next_extruder] == "PLA") ||  (filament_type[next_extruder] == "PETG")\n ||  (filament_type[next_extruder] == "PLA-CF")  ||  (filament_type[next_extruder] == "PETG-CF")}\nM1015.4 S1 K0 ;disable E air printing detect\n{else}\nM1015.4 S0 ; disable E air printing detect\n{endif}\n\nM620 S[next_extruder]A\nM1002 gcode_claim_action : 4\nM204 S9000\n\nG1 Z{max_layer_z + 3.0} F1200\n\nM400\nM106 P1 S0\nM106 P2 S0\n\n{if toolchange_count == 2}\n; get travel path for change filament\n;M620.1 X[travel_point_1_x] Y[travel_point_1_y] F21000 P0\n;M620.1 X[travel_point_2_x] Y[travel_point_2_y] F21000 P1\n;M620.1 X[travel_point_3_x] Y[travel_point_3_y] F21000 P2\n{endif}\n\n{if ((filament_type[current_extruder] == "PLA") || (filament_type[current_extruder] == "PLA-CF") || (filament_type[current_extruder] == "PETG")) && (nozzle_diameter[current_extruder] == 0.2)}\nM620.10 A0 F74.8347 L[flush_length] H{nozzle_diameter[current_extruder]} T{nozzle_temperature_range_high[current_extruder]} P{nozzle_temperature[current_extruder]} S1\n{else}\nM620.10 A0 F{filament_max_volumetric_speed[current_extruder]/2.4053*60} L[flush_length] H{nozzle_diameter[current_extruder]} T{nozzle_temperature_range_high[current_extruder]} P{nozzle_temperature[current_extruder]} S1\n{endif}\n\n{if ((filament_type[next_extruder] == "PLA") || (filament_type[next_extruder] == "PLA-CF") || (filament_type[next_extruder] == "PETG")) && (nozzle_diameter[next_extruder] == 0.2)}\nM620.10 A1 F74.8347 L[flush_length] H{nozzle_diameter[next_extruder]} T{nozzle_temperature_range_high[next_extruder]} P{nozzle_temperature[next_extruder]} S1\n{else}\nM620.10 A1 F{filament_max_volumetric_speed[next_extruder]/2.4053*60} L[flush_length] H{nozzle_diameter[next_extruder]} T{nozzle_temperature_range_high[next_extruder]} P{nozzle_temperature[next_extruder]} S1\n{endif}\n\n\n{if filament_type[current_extruder] == "TPU"}\nM620.11 S0 L0 I[current_extruder] E-{retraction_distances_when_cut[current_extruder]} F{max((filament_max_volumetric_speed[current_extruder]/2.4053*60), 200)}\n{else}\n{if (filament_type[current_extruder] == "PA") || (filament_type[current_extruder] == "PA-GF")}\nM620.11 S1 L0 I[current_extruder] R4 D2 E-{retraction_distances_when_cut[current_extruder]} F{max((filament_max_volumetric_speed[current_extruder]/2.4053*60), 200)}\n{else}\nM620.11 S1 L0 I[current_extruder] R10 D8 E-{retraction_distances_when_cut[current_extruder]} F{max((filament_max_volumetric_speed[current_extruder]/2.4053*60), 200)}\n{endif}\n{endif}\n\n{if filament_type[current_extruder] == "TPU" || filament_type[next_extruder] == "TPU"}\nM620.11 H2 C331\n{else}\nM620.11 H0\n{endif}\n\nT[next_extruder]\n\n;deretract\n{if filament_type[next_extruder] == "TPU"}\n{else}\n{if (filament_type[next_extruder] == "PA") || (filament_type[next_extruder] == "PA-GF")}\n;VG1 E1 F{max(new_filament_e_feedrate, 200)}\n;VG1 E1 F{max(new_filament_e_feedrate/2, 100)}\n{else}\n;VG1 E4 F{max(new_filament_e_feedrate, 200)}\n;VG1 E4 F{max(new_filament_e_feedrate/2, 100)}\n{endif}\n{endif}\n\n; VFLUSH_START\n\n{if flush_length>41.5}\n;VG1 E41.5 F{min(old_filament_e_feedrate,new_filament_e_feedrate)}\n;VG1 E{flush_length-41.5} F{new_filament_e_feedrate}\n{else}\n;VG1 E{flush_length} F{min(old_filament_e_feedrate,new_filament_e_feedrate)}\n{endif}\n\nSYNC T{ceil(flush_length / 125) * 5}\n\n; VFLUSH_END\n\nM1002 set_filament_type:{filament_type[next_extruder]}\n\nM400\nM83\n{if next_extruder < 255}\n\nM628 S0\n;VM109 S[new_filament_temp]\nM629\nM400\n\nM983.3 F{filament_max_volumetric_speed[next_extruder]/2.4} A0.4\n\nM400\n{if wipe_avoid_perimeter}\nG1 Y320 F30000\nG1 X{wipe_avoid_pos_x} F30000\n{endif}\nG1 Y295 F30000\nG1 Y265 F18000\nG1 Z{max_layer_z + 3.0} F3000\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\nM621 S[next_extruder]A\n\nM993 A3 B3 C3 ; nozzle cam detection allow status restore.\n\n{if (filament_type[next_extruder]  == "TPU")}\nM1015.3 S1;enable tpu clog detect\n{else}\nM1015.3 S0;disable tpu clog detect\n{endif}\n\n{if (filament_type[next_extruder] == "PLA") ||  (filament_type[next_extruder] == "PETG")\n ||  (filament_type[next_extruder] == "PLA-CF")  ||  (filament_type[next_extruder] == "PETG-CF")}\nM1015.4 S1 K1 H[nozzle_diameter] ;enable E air printing detect\n{else}\nM1015.4 S0 ; disable E air printing detect\n{endif}\n\nM620.6 I[next_extruder] W1 ;enable ams air printing detect\nM1002 gcode_claim_action : 0\n
N40 ; circle_compensation_manual_offset = 0
N41 ; circle_compensation_speed = 200,200,200,200,200
N42 ; close_fan_the_first_x_layers = 3,1,1,3,3
N43 ; complete_print_exhaust_fan_speed = 70,70,70,70,70
N44 ; cool_plate_temp = 0,30,30,0,0
N45 ; cool_plate_temp_initial_layer = 0,30,30,0,0
N46 ; counter_coef_1 = 0,0,0,0,0
N47 ; counter_coef_2 = 0.008,0.008,0.008,0.007,0.008
N48 ; counter_coef_3 = -0.041,-0.041,-0.041,0.003,-0.041
N49 ; counter_limit_max = 0.033,0.033,0.033,0.1,0.033
N50 ; counter_limit_min = -0.035,-0.035,-0.035,-0.035,-0.035
N51 ; curr_bed_type = Textured PEI Plate
N52 ; default_acceleration = 8000,8000
N53 ; default_filament_colour = ;;;;
N54 ; default_filament_profile = "Bambu PLA Basic @BBL H2D"
N55 ; default_jerk = 0
N56 ; default_nozzle_volume_type = Standard,Standard
N57 ; default_print_profile = 0.20mm Standard @BBL H2D
N58 ; deretraction_speed = 30,30
N59 ; detect_floating_vertical_shell = 1
N60 ; detect_narrow_internal_solid_infill = 1
N61 ; detect_overhang_wall = 1
N62 ; detect_thin_wall = 0
N63 ; diameter_limit = 50,50,50,50,50
N64 ; different_settings_to_system = enable_arc_fitting;enable_prime_tower;enable_support;gcode_add_line_number;interlocking_beam;precise_z_height;process_notes;reduce_crossing_wall;sparse_infill_pattern;support_filament;wall_loops;;;;;;
N65 ; draft_shield = disabled
N66 ; during_print_exhaust_fan_speed = 70,70,70,70,70
N67 ; elefant_foot_compensation = 0.15
N68 ; enable_arc_fitting = 0
N69 ; enable_circle_compensation = 0
N70 ; enable_long_retraction_when_cut = 2
N71 ; enable_overhang_bridge_fan = 1,1,1,1,1
N72 ; enable_overhang_speed = 1,1
N73 ; enable_pre_heating = 1
N74 ; enable_pressure_advance = 0,0,0,0,0
N75 ; enable_prime_tower = 0
N76 ; enable_support = 1
N77 ; enforce_support_layers = 0
N78 ; eng_plate_temp = 70,30,30,70,70
N79 ; eng_plate_temp_initial_layer = 70,30,30,70,70
N80 ; ensure_vertical_shell_thickness = enabled
N81 ; exclude_object = 1
N82 ; extruder_ams_count = 1#0|4#0;1#0|4#1
N83 ; extruder_clearance_dist_to_rod = 33
N84 ; extruder_clearance_height_to_lid = 201
N85 ; extruder_clearance_height_to_rod = 47.4
N86 ; extruder_clearance_max_radius = 96
N87 ; extruder_colour = #018001;#018001
N88 ; extruder_offset = 0x0,0x0
N89 ; extruder_printable_area = 0x0,325x0,325x320,0x320#25x0,350x0,350x320,25x320
N90 ; extruder_printable_height = 320,325
N91 ; extruder_type = Direct Drive,Direct Drive
N92 ; extruder_variant_list = "Direct Drive Standard,Direct Drive High Flow";"Direct Drive Standard,Direct Drive High Flow"
N93 ; fan_cooling_layer_time = 30,30,40,20,30
N94 ; fan_max_speed = 40,40,50,40,90
N95 ; fan_min_speed = 5,20,10,20,40
N96 ; filament_adhesiveness_category = 300,600,600,300,300
N97 ; filament_change_length = 10,10,10,12,10
N98 ; filament_colour = #0D6284;#5898DD;#C1C1C1;#F9DFB9;#FFFFFF
N99 ; filament_cost = 34.99,38.99,41.99,24.99,30
N100 ; filament_density = 1.25,1.26,1.26,1.28,1.27
N101 ; filament_diameter = 1.75,1.75,1.75,1.75,1.75
N102 ; filament_end_gcode = "; filament end gcode \n";"; filament end gcode \n";"; filament end gcode \n";"; filament end gcode \n";"; filament end gcode \n"
N103 ; filament_extruder_variant = "Direct Drive Standard";"Direct Drive Standard";"Direct Drive Standard";"Direct Drive Standard";"Direct Drive Standard"
N104 ; filament_flow_ratio = 0.95,0.97,1,0.95,0.95
N105 ; filament_ids = GFG98;GFU02;GFU98;GFG02;GFG99
N106 ; filament_is_support = 0,0,0,0,0
N107 ; filament_map = 1,1,2,1,1
N108 ; filament_map_mode = Auto For Flush
N109 ; filament_max_volumetric_speed = 11.5,12,10.5,24,12
N110 ; filament_minimal_purge_on_wipe_tower = 15,15,15,15,15
N111 ; filament_notes = 
N112 ; filament_pre_cooling_temperature = 0,200,200,0,0
N113 ; filament_prime_volume = 45,45,45,30,45
N114 ; filament_ramming_travel_time = 0,20,20,0,0
N115 ; filament_ramming_volumetric_speed = -1,4.5,2.625,-1,-1
N116 ; filament_retraction_length = nil,0.4,nil,nil,nil
N117 ; filament_scarf_gap = 0%,0%,0%,0%,0%
N118 ; filament_scarf_height = 10%,10%,10%,10%,10%
N119 ; filament_scarf_length = 10,10,10,10,10
N120 ; filament_scarf_seam_type = none,none,none,none,none
N121 ; filament_self_index = 1,1,2,2,3,3,4,4,5,5
N122 ; filament_settings_id = "Generic PETG-CF @BBL H2D";"Bambu TPU for AMS @BBL H2D";"Generic TPU for AMS @BBL H2D";"Bambu PETG HF @BBL H2D 0.4 nozzle";"Generic PETG @BBL H2D"
N123 ; filament_shrink = 100%,100%,100%,100%,100%
N124 ; filament_soluble = 0,0,0,0,0
N125 ; filament_start_gcode = "; filament start gcode\n";"; filament start gcode\n";"; filament start gcode\n";"; filament start gcode\n";"; filament start gcode\n"
N126 ; filament_type = PETG-CF;TPU-AMS;TPU-AMS;PETG;PETG
N127 ; filament_vendor = Generic;"Bambu Lab";Generic;"Bambu Lab";Generic
N128 ; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
N129 ; filter_out_gap_fill = 0
N130 ; first_layer_print_sequence = 0
N131 ; flush_into_infill = 0
N132 ; flush_into_objects = 0
N133 ; flush_into_support = 1
N134 ; flush_multiplier = 1,1
N135 ; flush_volumes_matrix = 0,359,519,619,629,190,0,396,513,523,259,259,0,301,338,312,322,193,0,287,273,271,190,192,0,0,374,534,634,644,205,0,411,528,538,274,274,0,316,353,327,337,208,0,302,288,286,205,207,0
N136 ; flush_volumes_vector = 140,140,140,140,140,140,140,140,140,140
N137 ; full_fan_speed_layer = 0,0,0,0,0
N138 ; fuzzy_skin = none
N139 ; fuzzy_skin_point_distance = 0.8
N140 ; fuzzy_skin_thickness = 0.3
N141 ; gap_infill_speed = 250,250
N142 ; gcode_add_line_number = 1
N143 ; gcode_flavor = marlin
N144 ; grab_length = 0,0
N145 ; has_scarf_joint_seam = 1
N146 ; head_wrap_detect_zone = 
N147 ; hole_coef_1 = 0,0,0,0,0
N148 ; hole_coef_2 = -0.008,-0.008,-0.008,-0.006,-0.008
N149 ; hole_coef_3 = 0.23415,0.23415,0.23415,0.1,0.23415
N150 ; hole_limit_max = 0.22,0.22,0.22,0.22,0.22
N151 ; hole_limit_min = 0.088,0.088,0.088,0.1,0.088
N152 ; host_type = octoprint
N153 ; hot_plate_temp = 70,35,35,70,70
N154 ; hot_plate_temp_initial_layer = 70,35,35,70,70
N155 ; hotend_cooling_rate = 2,2
N156 ; hotend_heating_rate = 3.6,3.6
N157 ; impact_strength_z = 10,9.6,10,10.6,10
N158 ; independent_support_layer_height = 1
N159 ; infill_combination = 0
N160 ; infill_direction = 45
N161 ; infill_jerk = 9
N162 ; infill_rotate_step = 0
N163 ; infill_shift_step = 0.4
N164 ; infill_wall_overlap = 15%
N165 ; inherits_group = "0.20mm Standard @BBL H2D";;;;;;
N166 ; initial_layer_acceleration = 500,500
N167 ; initial_layer_flow_ratio = 1
N168 ; initial_layer_infill_speed = 105,105
N169 ; initial_layer_jerk = 9
N170 ; initial_layer_line_width = 0.5
N171 ; initial_layer_print_height = 0.2
N172 ; initial_layer_speed = 50,50
N173 ; initial_layer_travel_acceleration = 6000,6000
N174 ; inner_wall_acceleration = 0,0
N175 ; inner_wall_jerk = 9
N176 ; inner_wall_line_width = 0.45
N177 ; inner_wall_speed = 300,300
N178 ; interface_shells = 0
N179 ; interlocking_beam = 1
N180 ; interlocking_beam_layer_count = 2
N181 ; interlocking_beam_width = 0.8
N182 ; interlocking_boundary_avoidance = 2
N183 ; interlocking_depth = 2
N184 ; interlocking_orientation = 22.5
N185 ; internal_bridge_support_thickness = 0.8
N186 ; internal_solid_infill_line_width = 0.42
N187 ; internal_solid_infill_pattern = zig-zag
N188 ; internal_solid_infill_speed = 250,250
N189 ; ironing_direction = 45
N190 ; ironing_flow = 10%
N191 ; ironing_inset = 0.21
N192 ; ironing_pattern = zig-zag
N193 ; ironing_spacing = 0.15
N194 ; ironing_speed = 30
N195 ; ironing_type = no ironing
N196 ; is_infill_first = 0
N197 ; layer_change_gcode = ;======== H2D 20250521========\n; layer num/total_layer_count: {layer_num+1}/[total_layer_count]\n; update layer progress\nM73 L{layer_num+1}\nM991 S0 P{layer_num} ;notify layer change\n\n
N198 ; layer_height = 0.2
N199 ; line_width = 0.42
N200 ; long_retractions_when_cut = 0,0
N201 ; machine_end_gcode = ;===== date: 2024/12/19 =====================\n;===== H2D =====================\nG392 S0 ;turn off nozzle clog detect\nM993 A0 B0 C0 ; nozzle cam detection not allowed.\n\n{if timelapse_type == 2}\nM991 S0 P-1 ;end timelapse immediately\n{endif}\nM400 ; wait for buffer to clear\nG92 E0 ; zero the extruder\nG1 E-0.8 F1800 ; retract\nG1 Z{max_layer_z + 0.5} F900 ; lower z a little\n\nG90\nG150.3\n\n{if timelapse_type == 1}\nM991 S0 P-1 ;end timelapse at safe pos\n{endif}\n\nM141 S0 ; turn off chamber heating\nM140 S0 ; turn off bed\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off remote part cooling fan\nM106 P3 S0 ; turn off chamber cooling fan\n\n; pull back filament to AMS\nM620 S65535\nT65535\nG150.2\nM621 S65535\n\nM620 S65279\nT65279\nG150.2\nM621 S65279\n\nG150.3\n\nM104 S0 T0; turn off hotend\nM104 S0 T1; turn off hotend\n\nM400 ; wait all motion done\nM17 S\nM17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom\n{if (max_layer_z + 100.0) < 320}\n    G1 Z{max_layer_z + 100.0} F600\n    G1 Z{max_layer_z +98.0}\n{else}\n    G1 Z320 F600\n    G1 Z320\n{endif}\nM400 P100\nM17 R ; restore z current\n\nM220 S100  ; Reset feedrate magnitude\nM201.2 K1.0 ; Reset acc magnitude\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 0\n\nM1015.4 S0 K0 ;disable air printing detect\n;=====printer finish  sound=========\nM17\nM400 S1\nM1006 S1\nM1006 A53 B10 L99 C53 D10 M99 E53 F10 N99 \nM1006 A57 B10 L99 C57 D10 M99 E57 F10 N99 \nM1006 A0 B15 L0 C0 D15 M0 E0 F15 N0 \nM1006 A53 B10 L99 C53 D10 M99 E53 F10 N99 \nM1006 A57 B10 L99 C57 D10 M99 E57 F10 N99 \nM1006 A0 B15 L0 C0 D15 M0 E0 F15 N0 \nM1006 A48 B10 L99 C48 D10 M99 E48 F10 N99 \nM1006 A0 B15 L0 C0 D15 M0 E0 F15 N0 \nM1006 A60 B10 L99 C60 D10 M99 E60 F10 N99 \nM1006 W\n;=====printer finish  sound=========\nM400\nM18\n\n
N202 ; machine_load_filament_time = 24
N203 ; machine_max_acceleration_e = 5000,5000,5000,5000
N204 ; machine_max_acceleration_extruding = 20000,20000,20000,20000
N205 ; machine_max_acceleration_retracting = 5000,5000,5000,5000
N206 ; machine_max_acceleration_travel = 9000,9000,9000,9000
N207 ; machine_max_acceleration_x = 16000,16000,16000,16000
N208 ; machine_max_acceleration_y = 16000,16000,16000,16000
N209 ; machine_max_acceleration_z = 500,500,500,500
N210 ; machine_max_jerk_e = 2.5,2.5,2.5,2.5
N211 ; machine_max_jerk_x = 9,9,9,9
N212 ; machine_max_jerk_y = 9,9,9,9
N213 ; machine_max_jerk_z = 3,3,3,3
N214 ; machine_max_speed_e = 50,50,50,50
N215 ; machine_max_speed_x = 1000,1000,1000,1000
N216 ; machine_max_speed_y = 1000,1000,1000,1000
N217 ; machine_max_speed_z = 30,30,30,30
N218 ; machine_min_extruding_rate = 0,0
N219 ; machine_min_travel_rate = 0,0
N220 ; machine_pause_gcode = M400 U1
N221 ; machine_start_gcode = ;===== machine: H2D =========================\n;===== date: 20250427 =====================\n\n;M1002 set_flag extrude_cali_flag=1\n;M1002 set_flag g29_before_print_flag=1\n;M1002 set_flag auto_cali_toolhead_offset_flag=1\n;M1002 set_flag build_plate_detect_flag=1\n\nM993 A0 B0 C0 ; nozzle cam detection not allowed.\n\nM400\n;M73 P99\n\n;=====printer start sound ===================\nM17\nM400 S1\nM1006 S1\nM1006 A53 B9 L99 C53 D9 M99 E53 F9 N99 \nM1006 A56 B9 L99 C56 D9 M99 E56 F9 N99 \nM1006 A61 B9 L99 C61 D9 M99 E61 F9 N99 \nM1006 A53 B9 L99 C53 D9 M99 E53 F9 N99 \nM1006 A56 B9 L99 C56 D9 M99 E56 F9 N99 \nM1006 A61 B18 L99 C61 D18 M99 E61 F18 N99 \nM1006 W\n;=====printer start sound ===================\n\n;===== reset machine status =================\nM204 S10000\nM630 S0 P0\n\nG90\nM17 D ; reset motor current to default\nM960 S5 P1 ; turn on logo lamp\nG90\nM220 S100 ;Reset Feedrate\nM221 S100 ;Reset Flowrate\nM73.2   R1.0 ;Reset left time magnitude\nG29.1 Z{+0.0} ; clear z-trim value first\nM983.1 M1 \nM901 D4\nM481 S0 ; turn off cutter pos comp\n;===== reset machine status =================\n\nM620 M ;enable remap\n\n;===== avoid end stop =================\nG91\nG380 S2 Z22 F1200\nG380 S2 Z-12 F1200\nG90\n;===== avoid end stop =================\n\n;==== set airduct mode ==== \n\n{if (overall_chamber_temperature >= 40)}\n\n    M145 P1 ; set airduct mode to heating mode for heating\n    M106 P2 S0 ; turn off auxiliary fan\n    M106 P3 S0 ; turn off chamber fan\n\n{else}\n    M145 P0 ; set airduct mode to cooling mode for cooling\n    M106 P2 S178 ; turn on auxiliary fan for cooling\n    M106 P3 S127 ; turn on chamber fan for cooling\n    M140 S0 ; stop heatbed from heating\n\n    M1002 gcode_claim_action : 29\n    M191 S0 ; wait for chamber temp\n    M142 P1 R35 S40 U0.3 V0.5 ; set chamber autocooling\n    M106 P2 S0 ; turn off auxiliary fan\n\n{endif}\n;==== set airduct mode ==== \n\n;===== start to heat heatbed & hotend==========\n\n    M1002 set_filament_type:{filament_type[initial_no_support_extruder]}\n\n    M104 S140 A\n    M140 S[bed_temperature_initial_layer_single]\n\n    ;===== set chamber temperature ==========\n    {if (overall_chamber_temperature >= 40)}\n        M145 P1 ; set airduct mode to heating mode\n        M141 S[overall_chamber_temperature] ; Let Chamber begin to heat\n    {endif}\n    ;===== set chamber temperature ==========\n\n;===== start to heat heatbead & hotend==========\n\n;====== cog noise reduction=================\nM982.2 S1 ; turn on cog noise reduction\n\n;===== first homing start =====\nM1002 gcode_claim_action : 13\n\nG28 X T300\n\nG150.1 F18000 ; wipe mouth to avoid filament stick to heatbed\nG150.3 F18000\nM400 P200\nM972 S24 P0 T2000\n{if curr_bed_type=="Textured PEI Plate"}\nM972 S26 P0 C0\n{elsif curr_bed_type=="High Temp Plate"}\nM972 S36 P0 C0 X1\n{endif}\nM972 S35 P0 C0\n\nG90\nG1 X175 Y160 F30000\n\nG28 Z P0 T250\n\n;===== first homign end =====\n\nM400\n;M73 P99\n\n;===== detection start =====\n\n    T1001\n    G383.4 ; left-extruder load status detection\n    \n    M104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]-80} A ; rise temp in advance\n\nM1002 judge_flag build_plate_detect_flag\nM622 S1\n    M972 S19 P0 C0    ; heatbed presence detection\nM623\n\n    M972 S14 P0 ; nozzle type detection\n\n;===== detection end =====\n\nM400\n;M73 P99\n\n;===== prepare print temperature and material ==========\nM400\nM211 X0 Y0 Z0 ;turn off soft endstop\nM975 S1 ; turn on input shaping\n\nG29.2 S0 ; avoid invalid abl data\n\n{if ((filament_type[initial_no_support_extruder] == "PLA") || (filament_type[initial_no_support_extruder] == "PLA-CF") || (filament_type[initial_no_support_extruder] == "PETG")) && (nozzle_diameter[initial_no_support_extruder] == 0.2)}\nM620.10 A0 F74.8347 H{nozzle_diameter[initial_no_support_extruder]} T{nozzle_temperature_range_high[initial_no_support_extruder]} P{nozzle_temperature_initial_layer[initial_no_support_extruder]} S1\nM620.10 A1 F74.8347 H{nozzle_diameter[initial_no_support_extruder]} T{nozzle_temperature_range_high[initial_no_support_extruder]} P{nozzle_temperature_initial_layer[initial_no_support_extruder]} S1\n{else}\nM620.10 A0 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60} H{nozzle_diameter[initial_no_support_extruder]} T{nozzle_temperature_range_high[initial_no_support_extruder]} P{nozzle_temperature_initial_layer[initial_no_support_extruder]} S1\nM620.10 A1 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60} H{nozzle_diameter[initial_no_support_extruder]} T{nozzle_temperature_range_high[initial_no_support_extruder]} P{nozzle_temperature_initial_layer[initial_no_support_extruder]} S1\n{endif}\n\n{if filament_type[initial_no_support_extruder] == "TPU"}\n    M620.11 S0 L0 I[initial_no_support_extruder] E-{retraction_distances_when_cut[initial_no_support_extruder]} F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60}\n{else}\n{if (filament_type[initial_no_support_extruder] == "PA") ||  (filament_type[initial_no_support_extruder] == "PA-GF")}\n    M620.11 S1 L0 I[initial_no_support_extruder] R4 D2 E-{retraction_distances_when_cut[initial_no_support_extruder]} F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60}\n{else}\n    M620.11 S1 L0 I[initial_no_support_extruder] R10 D8 E-{retraction_distances_when_cut[initial_no_support_extruder]} F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60}\n{endif}\n{endif}\n\nM620 S[initial_no_support_extruder]A   ; switch material if AMS exist\nM1002 gcode_claim_action : 4\nM1002 set_filament_type:UNKNOWN\nM400\nT[initial_no_support_extruder]\nM400\nM628 S0\nM629\nM400\nM1002 set_filament_type:{filament_type[initial_no_support_extruder]}\nM621 S[initial_no_support_extruder]A\n\nM104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]}\nM400\nM106 P1 S0\n\nG29.2 S1\n;===== prepare print temperature and material ==========\n\nM400\n;M73 P99\n\n;===== auto extrude cali start =========================\nM975 S1\nM1002 judge_flag extrude_cali_flag\n\nM622 J0\n    M983.3 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4} A0.4 ; cali dynamic extrusion compensation\nM623\n\nM622 J1\n    M1002 set_filament_type:{filament_type[initial_no_support_extruder]}\n    M1002 gcode_claim_action : 8\n\n    M109 S{nozzle_temperature[initial_no_support_extruder]}\n\n    G90\n    M83\n    M983.3 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4} A0.4 ; cali dynamic extrusion compensation\n\n    M400\n    M106 P1 S255\n    M400 S5\n    M106 P1 S0\n    G150.3\nM623\n\nM622 J2\n    M1002 set_filament_type:{filament_type[initial_no_support_extruder]}\n    M1002 gcode_claim_action : 8\n\n    M109 S{nozzle_temperature[initial_no_support_extruder]}\n\n    G90\n    M83\n    M983.3 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4} A0.4 ; cali dynamic extrusion compensation\n\n    M400\n    M106 P1 S255\n    M400 S5\n    M106 P1 S0\n    G150.3\nM623\n\n;===== auto extrude cali end =========================\n\n{if filament_type[initial_no_support_extruder] == "TPU"}\n    G150.2\n    G150.1\n    G150.2\n    G150.1\n    G150.2\n    G150.1\n{else}\n    M106 P1 S0\n    M400 S2\n    M83\n    G1 E45 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60}\n    G1 E-3 F1800\n    M400 P500\n    G150.2\n    G150.1\n{endif}\n\nG91\nG1 Y-16 F12000 ; move away from the trash bin\nG90\n\nM400\n;M73 P99\n\n;===== wipe right nozzle start =====\n\nM1002 gcode_claim_action : 14\n    G150 T{nozzle_temperature_initial_layer[initial_no_support_extruder]}\n    {if (overall_chamber_temperature >= 40)}\n        G150 T{nozzle_temperature_initial_layer[initial_no_support_extruder] - 80}\n    {endif}\nM106 S255 ; turn on fan to cool the nozzle\n\n;===== wipe left nozzle end =====\n\nM400\n;M73 P99\n\n{if (overall_chamber_temperature >= 40)}\n    M1002 gcode_claim_action : 49\n    M191 S[overall_chamber_temperature] ; wait for chamber temp\n{endif}\n\nM400\n;M73 P99\n\n;===== bed leveling ==================================\n\nM1002 judge_flag g29_before_print_flag\n\nM190 S[bed_temperature_initial_layer_single]; ensure bed temp\nM109 S140 A\nM106 S0 ; turn off fan , too noisy\n\nG91\nG1 Z5 F1200\nG90\nG1 X275 Y300 F30000\n\nM622 J1\n    M1002 gcode_claim_action : 1\n    G29.20 A3\n    G29 A1 O X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    M400\n    M500 ; save cali data\nM623\n    \nM622 J2\n    M1002 gcode_claim_action : 1\n    {if has_tpu_in_first_layer}\n        G29.20 A3\n        G29 A1 O X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    {else}\n        G29.20 A4\n        G29 A2 O X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    {endif}\n    M400\n    M500 ; save cali data\nM623\n\nM622 J0\n    G28\nM623\n\n;===== bed leveling end ================================\n\nG39.1 ; cali nozzle wrapped detection pos\nM500\n\n;===== z ofst cali start =====\n\n    M190 S[bed_temperature_initial_layer_single]; ensure bed temp\n\n    G383 O0 M2 T140\n    M500\n\n;===== z ofst cali end =====\n\nM400\n;M73 P99\n\nM141 S[overall_chamber_temperature]\nM104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]} A\n\n;===== mech mode sweep start =====\n    M1002 gcode_claim_action : 3\n\n    G90\n    G1 Z5 F1200\n    G1 X187 Y160 F20000\n    T1000\n    M400 P200\n\n    M970.3 Q1 A5 K0 O1\n    M974 Q1 S2 P0\n\n    M970.3 Q0 A5 K0 O1\n    M974 Q0 S2 P0\n\n    M970.2 Q2 K0 W38 Z0.01\n    M974 Q2 S2 P0\n    M500\n\n    M975 S1\n;===== mech mode sweep end =====\n\nM400\n;M73 P99\n\nG150.3 ; move to garbage can to wait for temp\nM1026\n\n;===== xy ofst cali start =====\n\nM1002 judge_flag auto_cali_toolhead_offset_flag\n\nM622 J0\n    M1012.5 N1 R1\nM623\n\nM622 J1\n    M1002 gcode_claim_action : 39\n    M141 S0\n    M620.17 T0 S{nozzle_temperature_initial_layer[(first_non_support_filaments[0] != -1 ? first_non_support_filaments[0] : first_filaments[0])]} L{(first_non_support_filaments[0] != -1 ? first_non_support_filaments[0] : first_filaments[0])}\n    M620.17 T1 S{nozzle_temperature_initial_layer[(first_non_support_filaments[1] != -1 ? first_non_support_filaments[1] : first_filaments[1])]} L{(first_non_support_filaments[1] != -1 ? first_non_support_filaments[1] : first_filaments[1])}\n    G383 O1 T{nozzle_temperature_initial_layer[initial_no_support_extruder]} L{initial_no_support_extruder}\n    M500\n    M141 S[overall_chamber_temperature]\nM623\n\nM622 J2\n    M1002 gcode_claim_action : 39\n    M141 S0\n    M620.17 T0 S{nozzle_temperature_initial_layer[(first_non_support_filaments[0] != -1 ? first_non_support_filaments[0] : first_filaments[0])]} L{(first_non_support_filaments[0] != -1 ? first_non_support_filaments[0] : first_filaments[0])}\n    M620.17 T1 S{nozzle_temperature_initial_layer[(first_non_support_filaments[1] != -1 ? first_non_support_filaments[1] : first_filaments[1])]} L{(first_non_support_filaments[1] != -1 ? first_non_support_filaments[1] : first_filaments[1])}\n    G383.3 T{nozzle_temperature_initial_layer[initial_no_support_extruder]} L{initial_no_support_extruder}\n    M500\n    M141 S[overall_chamber_temperature]\nM623\n;===== xy ofst cali end =====\n\nM400\n;M73 P99\n\nM1002 gcode_claim_action : 0\nM400\n\n;============switch again==================\n\nM211 X0 Y0 Z0 ;turn off soft endstop\nG91\nG1 Z6 F1200\nG90\nM1002 set_filament_type:{filament_type[initial_no_support_extruder]}\nM620 S[initial_no_support_extruder]A\nM400\nT[initial_no_support_extruder]\nM400\nM628 S0\nM629\nM400\nM621 S[initial_no_support_extruder]A\n\n;============switch again==================\n\nM400\n;M73 P99\n\n;===== wait temperature reaching the reference value =======\n\nM104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]} ; rise to print tmpr\n\nM140 S[bed_temperature_initial_layer_single] \nM190 S[bed_temperature_initial_layer_single] \n\n    ;========turn off light and fans =============\n    M960 S1 P0 ; turn off laser\n    M960 S2 P0 ; turn off laser\n    M106 S0 ; turn off fan\n    M106 P2 S0 ; turn off big fan\n\n    {if (overall_chamber_temperature >= 40)}\n        M106 P3 S0 ; turn off chamber fan\n    {else}\n        M142 P1 R35 S40 U0.3 V0.5 ; set chamber autocooling\n    {endif}\n\n    ;============set motor current==================\n    M400 S1\n\n;===== wait temperature reaching the reference value =======\n\nM400\n;M73 P99\n\n;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==\n    {if curr_bed_type=="Textured PEI Plate"}\n        G29.1 Z{-0.02} ; for Textured PEI Plate\n    {endif}\n    \nG150.1\n\nM975 S1 ; turn on mech mode supression\nM983.4 S1 ; turn on deformation compensation \nG29.2 S1 ; turn on pos comp\nG29.7 S1\n\nG90\nG1 Z5 F1200\nG1 Y295 F30000\nG1 Y265 F18000\n\n;===== nozzle load line ===============================\nG29.2 S1 ; ensure z comp turn on\nG90\nM83\nM109 S{nozzle_temperature_initial_layer[initial_no_support_extruder]}\n{if filament_type[initial_no_support_extruder] == "TPU"}\n    ;G130 O0 F{filament_max_volumetric_speed[initial_no_support_extruder]/2/2.4053} L80 E5 D12 A{first_layer_print_min[0]} B{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    G130 O0 X250 Y-0.5 Z0.8 F{filament_max_volumetric_speed[initial_no_support_extruder]/2/2.4053} L40 E20 D5\n{else}\n    ;G130 O0 F{filament_max_volumetric_speed[initial_no_support_extruder]/2/2.4053} L80 E5 D12 A{first_layer_print_min[0]} B{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    G130 O0 X250 Y-0.5 Z0.8 F{filament_max_volumetric_speed[initial_no_support_extruder]/2/2.4053} L40 E20 D5\n{endif}\nG90\nM83\nG1 Z0.2\n\n;===== noozle load line end ===========================\n\nM400\n;M73 P99\n\nM993 A1 B1 C1 ; nozzle cam detection allowed.\n\n{if (filament_type[initial_no_support_extruder] == "TPU")}\nM1015.3 S1;enable tpu clog detect\n{else}\nM1015.3 S0;disable tpu clog detect\n{endif}\n\n{if (filament_type[initial_no_support_extruder] == "PLA") ||  (filament_type[initial_no_support_extruder] == "PETG")\n ||  (filament_type[initial_no_support_extruder] == "PLA-CF")  ||  (filament_type[initial_no_support_extruder] == "PETG-CF")}\nM1015.4 S1 K1 H[nozzle_diameter] ;enable E air printing detect\n{else}\nM1015.4 S0 K0 H[nozzle_diameter] ;disable E air printing detect\n{endif}\n\nM620.6 I[initial_no_support_extruder] W1 ;enable ams air printing detect\n\nM211 Z1\nG29.99\n\n\n
N222 ; machine_switch_extruder_time = 5.6
N223 ; machine_unload_filament_time = 24
N224 ; master_extruder_id = 2
N225 ; max_bridge_length = 0
N226 ; max_layer_height = 0.28,0.28
N227 ; max_travel_detour_distance = 0
N228 ; min_bead_width = 85%
N229 ; min_feature_size = 25%
N230 ; min_layer_height = 0.08,0.08
N231 ; minimum_sparse_infill_area = 15
N232 ; mmu_segmented_region_interlocking_depth = 0
N233 ; mmu_segmented_region_max_width = 0
N234 ; nozzle_diameter = 0.4,0.4
N235 ; nozzle_height = 4
N236 ; nozzle_temperature = 255,230,230,245,255
N237 ; nozzle_temperature_initial_layer = 255,230,230,245,255
N238 ; nozzle_temperature_range_high = 270,240,250,270,270
N239 ; nozzle_temperature_range_low = 240,220,200,230,220
N240 ; nozzle_type = hardened_steel,hardened_steel
N241 ; nozzle_volume = 130,145
N242 ; nozzle_volume_type = Standard,Standard
N243 ; only_one_wall_first_layer = 0
N244 ; ooze_prevention = 0
N245 ; other_layers_print_sequence = 0
N246 ; other_layers_print_sequence_nums = 0
N247 ; outer_wall_acceleration = 5000,5000
N248 ; outer_wall_jerk = 9
N249 ; outer_wall_line_width = 0.42
N250 ; outer_wall_speed = 200,200
N251 ; overhang_1_4_speed = 0,0
N252 ; overhang_2_4_speed = 50,50
N253 ; overhang_3_4_speed = 30,30
N254 ; overhang_4_4_speed = 10,10
N255 ; overhang_fan_speed = 100,100,100,100,90
N256 ; overhang_fan_threshold = 10%,25%,25%,10%,10%
N257 ; overhang_threshold_participating_cooling = 95%,95%,95%,95%,95%
N258 ; overhang_totally_speed = 10,10
N259 ; physical_extruder_map = 1,0
N260 ; post_process = 
N261 ; pre_start_fan_time = 0,0,0,2,0
N262 ; precise_z_height = 1
N263 ; pressure_advance = 0.02,0.02,0.02,0.02,0.02
N264 ; prime_tower_brim_width = -1
N265 ; prime_tower_enable_framework = 0
N266 ; prime_tower_extra_rib_length = 0
N267 ; prime_tower_fillet_wall = 1
N268 ; prime_tower_infill_gap = 150%
N269 ; prime_tower_lift_height = -1
N270 ; prime_tower_lift_speed = 90
N271 ; prime_tower_max_speed = 90
N272 ; prime_tower_rib_wall = 1
N273 ; prime_tower_rib_width = 8
N274 ; prime_tower_skip_points = 1
N275 ; prime_tower_width = 60
N276 ; print_compatible_printers = "Bambu Lab H2D 0.4 nozzle"
N277 ; print_extruder_id = 1,2
N278 ; print_extruder_variant = "Direct Drive Standard";"Direct Drive Standard"
N279 ; print_flow_ratio = 1
N280 ; print_sequence = by layer
N281 ; print_settings_id = 0.20mm Standard @BBL H2D
N282 ; printable_area = 0x0,350x0,350x320,0x320
N283 ; printable_height = 325
N284 ; printer_extruder_id = 1,2
N285 ; printer_extruder_variant = "Direct Drive Standard";"Direct Drive Standard"
N286 ; printer_model = Bambu Lab H2D
N287 ; printer_notes = 
N288 ; printer_settings_id = Bambu Lab H2D 0.4 nozzle
N289 ; printer_structure = corexy
N290 ; printer_technology = FFF
N291 ; printer_variant = 0.4
N292 ; printhost_authorization_type = key
N293 ; printhost_ssl_ignore_revoke = 0
N294 ; printing_by_object_gcode = 
N295 ; process_notes = --base-tool T0                     # Tool for base material (default: T0)\n--alt-tool T1                      # Tool for mortar material (default: T1)\n\n--layer-height 0.2                # Layer height in mm (default: 0.2)\n--mortar-offset-z 0.1             # Z offset for mortar layer (default: half of layer height)\n--brick-offset-xy 0.25            # XY stagger for mortar paths (default: 0.25mm)\n\n--over-extrude 1.05               # Extrusion multiplier for mortar layer (default: 1.05 = 5% over)\n--enable-over-extrude             # Explicit toggle for applying over-extrusion (optional)\n\n--enable-tool-settings            # Use hardcoded temp/fan settings (default: off)\n--no-tool-settings                # Disable hardcoded temp/fan settings even if defined\n\n--no-modify-infill                # Skip infill entirely (default: true – script focuses on walls)\n--include-top-bottom              # Enable modification of top/bottom shells (experimental)\n\n--debug                           # Print debug information while running\n
N296 ; raft_contact_distance = 0.1
N297 ; raft_expansion = 1.5
N298 ; raft_first_layer_density = 90%
N299 ; raft_first_layer_expansion = 2
N300 ; raft_layers = 0
N301 ; reduce_crossing_wall = 1
N302 ; reduce_fan_stop_start_freq = 1,1,1,1,1
N303 ; reduce_infill_retraction = 1
N304 ; required_nozzle_HRC = 40,3,3,3,3
N305 ; resolution = 0.012
N306 ; retract_before_wipe = 0%,0%
N307 ; retract_length_toolchange = 2,2
N308 ; retract_lift_above = 0,0
N309 ; retract_lift_below = 319,319
N310 ; retract_restart_extra = 0,0
N311 ; retract_restart_extra_toolchange = 0,0
N312 ; retract_when_changing_layer = 1,1
N313 ; retraction_distances_when_cut = 18,18
N314 ; retraction_length = 0.8,0.8
N315 ; retraction_minimum_travel = 1,1
N316 ; retraction_speed = 30,30
N317 ; role_base_wipe_speed = 1
N318 ; scan_first_layer = 0
N319 ; scarf_angle_threshold = 155
N320 ; seam_gap = 15%
N321 ; seam_position = aligned
N322 ; seam_slope_conditional = 1
N323 ; seam_slope_entire_loop = 0
N324 ; seam_slope_inner_walls = 1
N325 ; seam_slope_steps = 10
N326 ; silent_mode = 0
N327 ; single_extruder_multi_material = 1
N328 ; skirt_distance = 2
N329 ; skirt_height = 1
N330 ; skirt_loops = 0
N331 ; slice_closing_radius = 0.049
N332 ; slicing_mode = regular
N333 ; slow_down_for_layer_cooling = 1,1,1,1,1
N334 ; slow_down_layer_time = 6,10,10,10,12
N335 ; slow_down_min_speed = 10,10,10,20,20
N336 ; small_perimeter_speed = 50%,50%
N337 ; small_perimeter_threshold = 0,0
N338 ; smooth_coefficient = 4
N339 ; smooth_speed_discontinuity_area = 1
N340 ; solid_infill_filament = 1
N341 ; sparse_infill_acceleration = 100%,100%
N342 ; sparse_infill_anchor = 400%
N343 ; sparse_infill_anchor_max = 20
N344 ; sparse_infill_density = 15%
N345 ; sparse_infill_filament = 1
N346 ; sparse_infill_line_width = 0.45
N347 ; sparse_infill_pattern = zig-zag
N348 ; sparse_infill_speed = 350,350
N349 ; spiral_mode = 0
N350 ; spiral_mode_max_xy_smoothing = 200%
N351 ; spiral_mode_smooth = 0
N352 ; standby_temperature_delta = -5
N353 ; start_end_points = 30x-3,54x245
N354 ; supertack_plate_temp = 70,0,0,70,70
N355 ; supertack_plate_temp_initial_layer = 70,0,0,70,70
N356 ; support_air_filtration = 0
N357 ; support_angle = 0
N358 ; support_base_pattern = default
N359 ; support_base_pattern_spacing = 2.5
N360 ; support_bottom_interface_spacing = 0.5
N361 ; support_bottom_z_distance = 0.2
N362 ; support_chamber_temp_control = 1
N363 ; support_critical_regions_only = 0
N364 ; support_expansion = 0
N365 ; support_filament = 3
N366 ; support_interface_bottom_layers = 2
N367 ; support_interface_filament = 0
N368 ; support_interface_loop_pattern = 0
N369 ; support_interface_not_for_body = 1
N370 ; support_interface_pattern = auto
N371 ; support_interface_spacing = 0.5
N372 ; support_interface_speed = 80,80
N373 ; support_interface_top_layers = 2
N374 ; support_line_width = 0.42
N375 ; support_object_first_layer_gap = 0.2
N376 ; support_object_xy_distance = 0.35
N377 ; support_on_build_plate_only = 0
N378 ; support_remove_small_overhang = 1
N379 ; support_speed = 150,150
N380 ; support_style = default
N381 ; support_threshold_angle = 30
N382 ; support_top_z_distance = 0.2
N383 ; support_type = tree(auto)
N384 ; symmetric_infill_y_axis = 0
N385 ; temperature_vitrification = 70,30,30,70,70
N386 ; template_custom_gcode = 
N387 ; textured_plate_temp = 70,35,35,70,70
N388 ; textured_plate_temp_initial_layer = 70,35,35,70,70
N389 ; thick_bridges = 0
N390 ; thumbnail_size = 50x50
N391 ; time_lapse_gcode = ;======== H2D 20250213========\n; SKIPPABLE_START\n; SKIPTYPE: timelapse\nM622.1 S1 ; for prev firware, default turned on\n\nM1002 judge_flag timelapse_record_flag\n\nM622 J1\nM993 A2 B2 C2\nM993 A0 B0 C0\n\n{if !spiral_mode }\nM9712 E{most_used_physical_extruder_id} M{timelapse_type}\nM83\nG1 Z{max_layer_z + 0.4} F1200\nM400\nM9713\n{endif}\n\nM9711 M{timelapse_type} E{most_used_physical_extruder_id} Z{layer_z + 0.4} S11 C10 O0 T3000\n\n{if !spiral_mode }\nM9712 E{most_used_physical_extruder_id} M{timelapse_type}\nG90\nG1 Z{max_layer_z + 3.0} F1200\nG1 Y295 F30000\nG1 Y265 F18000\nM83\nM9713\n{endif}\nM993 A3 B3 C3\n\nM623\n; SKIPPABLE_END\n
N392 ; timelapse_type = 0
N393 ; top_area_threshold = 200%
N394 ; top_color_penetration_layers = 5
N395 ; top_one_wall_type = all top
N396 ; top_shell_layers = 5
N397 ; top_shell_thickness = 1
N398 ; top_solid_infill_flow_ratio = 1
N399 ; top_surface_acceleration = 2000,2000
N400 ; top_surface_jerk = 9
N401 ; top_surface_line_width = 0.42
N402 ; top_surface_pattern = monotonicline
N403 ; top_surface_speed = 200,200
N404 ; travel_acceleration = 10000,10000
N405 ; travel_jerk = 9
N406 ; travel_speed = 1000,1000
N407 ; travel_speed_z = 0,0
N408 ; tree_support_branch_angle = 45
N409 ; tree_support_branch_diameter = 2
N410 ; tree_support_branch_diameter_angle = 5
N411 ; tree_support_branch_distance = 5
N412 ; tree_support_wall_count = 0
N413 ; unprintable_filament_types = TPU;PPS-CF,PPA-CF
N414 ; upward_compatible_machine = 
N415 ; use_firmware_retraction = 0
N416 ; use_relative_e_distances = 1
N417 ; vertical_shell_speed = 80%,80%
N418 ; wall_distribution_count = 1
N419 ; wall_filament = 1
N420 ; wall_generator = classic
N421 ; wall_loops = 4
N422 ; wall_sequence = inner wall/outer wall
N423 ; wall_transition_angle = 10
N424 ; wall_transition_filter_deviation = 25%
N425 ; wall_transition_length = 100%
N426 ; wipe = 1,1
N427 ; wipe_distance = 2,2
N428 ; wipe_speed = 80%
N429 ; wipe_tower_no_sparse_layers = 0
N430 ; wipe_tower_rotation_angle = 0
N431 ; wipe_tower_x = 165
N432 ; wipe_tower_y = 250
N433 ; xy_contour_compensation = 0
N434 ; xy_hole_compensation = 0
N435 ; z_direction_outwall_speed_continuous = 1
N436 ; z_hop = 0.4,0.4
N437 ; z_hop_types = Auto Lift,Auto Lift
N438 ; CONFIG_BLOCK_END
N439 
N440 ; EXECUTABLE_BLOCK_START
N441 M73 P0 R33
N442 M201 X16000 Y16000 Z500 E5000
N443 M203 X1000 Y1000 Z30 E50
N444 M204 P20000 R5000 T20000
N445 M205 X9.00 Y9.00 Z3.00 E2.50
N446 M106 S0
N447 M106 P2 S0
N448 ; FEATURE: Custom
N449 ;===== machine: H2D =========================
N450 ;===== date: 20250427 =====================
N451 
N452 ;M1002 set_flag extrude_cali_flag=1
N453 ;M1002 set_flag g29_before_print_flag=1
N454 ;M1002 set_flag auto_cali_toolhead_offset_flag=1
N455 ;M1002 set_flag build_plate_detect_flag=1
N456 
N457 M993 A0 B0 C0 ; nozzle cam detection not allowed.
N458 
N459 M400
N460 ;M73 P99
N461 
N462 ;=====printer start sound ===================
N463 M17
N464 M400 S1
N465 M1006 S1
N466 M1006 A53 B9 L99 C53 D9 M99 E53 F9 N99 
N467 M1006 A56 B9 L99 C56 D9 M99 E56 F9 N99 
N468 M1006 A61 B9 L99 C61 D9 M99 E61 F9 N99 
N469 M1006 A53 B9 L99 C53 D9 M99 E53 F9 N99 
N470 M1006 A56 B9 L99 C56 D9 M99 E56 F9 N99 
N471 M1006 A61 B18 L99 C61 D18 M99 E61 F18 N99 
N472 M1006 W
N473 ;=====printer start sound ===================
N474 
N475 ;===== reset machine status =================
N476 M204 S10000
N477 M630 S0 P0
N478 
N479 G90
N480 M17 D ; reset motor current to default
N481 M960 S5 P1 ; turn on logo lamp
N482 G90
N483 M220 S100 ;Reset Feedrate
N484 M221 S100 ;Reset Flowrate
N485 M73.2   R1.0 ;Reset left time magnitude
N486 G29.1 Z0 ; clear z-trim value first
N487 M983.1 M1 
N488 M901 D4
N489 M481 S0 ; turn off cutter pos comp
N490 ;===== reset machine status =================
N491 
N492 M620 M ;enable remap
N493 
N494 ;===== avoid end stop =================
N495 G91
N496 G380 S2 Z22 F1200
N497 G380 S2 Z-12 F1200
N498 G90
N499 ;===== avoid end stop =================
N500 
N501 ;==== set airduct mode ==== 
N502 
N503 
N504     M145 P0 ; set airduct mode to cooling mode for cooling
N505     M106 P2 S178 ; turn on auxiliary fan for cooling
N506     M106 P3 S127 ; turn on chamber fan for cooling
N507     M140 S0 ; stop heatbed from heating
N508 
N509     M1002 gcode_claim_action : 29
N510     M191 S0 ; wait for chamber temp
N511     M142 P1 R35 S40 U0.3 V0.5 ; set chamber autocooling
N512     M106 P2 S0 ; turn off auxiliary fan
N513 
N514 
N515 ;==== set airduct mode ==== 
N516 
N517 ;===== start to heat heatbed & hotend==========
N518 
N519     M1002 set_filament_type:PETG-CF
N520 
N521     M104 S140 A
N522     M140 S70
N523 
N524     ;===== set chamber temperature ==========
N525     
N526     ;===== set chamber temperature ==========
N527 
N528 ;===== start to heat heatbead & hotend==========
N529 
N530 ;====== cog noise reduction=================
N531 M982.2 S1 ; turn on cog noise reduction
N532 
N533 ;===== first homing start =====
N534 M1002 gcode_claim_action : 13
N535 
N536 G28 X T300
N537 
N538 G150.1 F18000 ; wipe mouth to avoid filament stick to heatbed
N539 G150.3 F18000
N540 M400 P200
N541 M972 S24 P0 T2000
N542 
N543 M972 S26 P0 C0
N544 
N545 M972 S35 P0 C0
N546 
N547 G90
N548 G1 X175 Y160 F30000
N549 
N550 G28 Z P0 T250
N551 
N552 ;===== first homign end =====
N553 
N554 M400
N555 ;M73 P99
N556 
N557 ;===== detection start =====
N558 
N559     T1001
N560     G383.4 ; left-extruder load status detection
N561     
N562     M104 S175 A ; rise temp in advance
N563 
N564 M1002 judge_flag build_plate_detect_flag
N565 M622 S1
N566     M972 S19 P0 C0    ; heatbed presence detection
N567 M623
N568 
N569     M972 S14 P0 ; nozzle type detection
N570 
N571 ;===== detection end =====
N572 
N573 M400
N574 ;M73 P99
N575 
N576 ;===== prepare print temperature and material ==========
N577 M400
N578 M211 X0 Y0 Z0 ;turn off soft endstop
N579 M975 S1 ; turn on input shaping
N580 
N581 G29.2 S0 ; avoid invalid abl data
N582 
N583 
N584 M620.10 A0 F286.867 H0.4 T270 P255 S1
N585 M620.10 A1 F286.867 H0.4 T270 P255 S1
N586 
N587 
N588 
N589 
N590     M620.11 S1 L0 I0 R10 D8 E-18 F286.867
N591 
N592 
N593 
N594 M620 S0A   ; switch material if AMS exist
N595 M1002 gcode_claim_action : 4
N596 M1002 set_filament_type:UNKNOWN
N597 M400
N598 T0
N599 M400
N600 M628 S0
N601 M629
N602 M400
N603 M1002 set_filament_type:PETG-CF
N604 M621 S0A
N605 
N606 M104 S255
N607 M400
N608 M106 P1 S0
N609 
N610 G29.2 S1
N611 ;===== prepare print temperature and material ==========
N612 
N613 M400
N614 ;M73 P99
N615 
N616 ;===== auto extrude cali start =========================
N617 M975 S1
N618 M1002 judge_flag extrude_cali_flag
N619 
N620 M622 J0
N621     M983.3 F4.79167 A0.4 ; cali dynamic extrusion compensation
N622 M623
N623 
N624 M622 J1
N625     M1002 set_filament_type:PETG-CF
N626     M1002 gcode_claim_action : 8
N627 
N628     M109 S255
N629 
N630     G90
N631     M83
N632     M983.3 F4.79167 A0.4 ; cali dynamic extrusion compensation
N633 
N634     M400
N635     M106 P1 S255
N636     M400 S5
N637     M106 P1 S0
N638     G150.3
N639 M623
N640 
N641 M622 J2
N642     M1002 set_filament_type:PETG-CF
N643     M1002 gcode_claim_action : 8
N644 
N645     M109 S255
N646 
N647     G90
N648     M83
N649     M983.3 F4.79167 A0.4 ; cali dynamic extrusion compensation
N650 
N651     M400
N652     M106 P1 S255
N653     M400 S5
N654     M106 P1 S0
N655     G150.3
N656 M623
N657 
N658 ;===== auto extrude cali end =========================
N659 
N660 
N661     M106 P1 S0
N662     M400 S2
N663     M83
N664     G1 E45 F286.867
N665     G1 E-3 F1800
N666     M400 P500
N667     G150.2
N668     G150.1
N669 
N670 
N671 G91
N672 M73 P1 R33
N673 G1 Y-16 F12000 ; move away from the trash bin
N674 G90
N675 
N676 M400
N677 ;M73 P99
N678 
N679 ;===== wipe right nozzle start =====
N680 
N681 M1002 gcode_claim_action : 14
N682     G150 T255
N683     
N684 M106 S255 ; turn on fan to cool the nozzle
N685 
N686 ;===== wipe left nozzle end =====
N687 
N688 M400
N689 ;M73 P99
N690 
N691 
N692 
N693 M400
N694 ;M73 P99
N695 
N696 ;===== bed leveling ==================================
N697 
N698 M1002 judge_flag g29_before_print_flag
N699 
N700 M190 S70; ensure bed temp
N701 M109 S140 A
N702 M106 S0 ; turn off fan , too noisy
N703 
N704 G91
N705 M73 P2 R32
N706 G1 Z5 F1200
N707 G90
N708 G1 X275 Y300 F30000
N709 
N710 M622 J1
N711     M1002 gcode_claim_action : 1
N712     G29.20 A3
N713     G29 A1 O X157.309 Y114.718 I35 J83.9511
N714     M400
N715     M500 ; save cali data
N716 M623
N717     
N718 M622 J2
N719     M1002 gcode_claim_action : 1
N720     
N721         G29.20 A4
N722         G29 A2 O X157.309 Y114.718 I35 J83.9511
N723     
N724     M400
N725     M500 ; save cali data
N726 M623
N727 
N728 M622 J0
N729     G28
N730 M623
N731 
N732 ;===== bed leveling end ================================
N733 
N734 G39.1 ; cali nozzle wrapped detection pos
N735 M500
N736 
N737 ;===== z ofst cali start =====
N738 
N739     M190 S70; ensure bed temp
N740 
N741     G383 O0 M2 T140
N742     M500
N743 
N744 ;===== z ofst cali end =====
N745 
N746 M400
N747 ;M73 P99
N748 
N749 M141 S0
N750 M104 S255 A
N751 
N752 ;===== mech mode sweep start =====
N753     M1002 gcode_claim_action : 3
N754 
N755     G90
N756 M73 P15 R28
N757     G1 Z5 F1200
N758     G1 X187 Y160 F20000
N759     T1000
N760     M400 P200
N761 
N762     M970.3 Q1 A5 K0 O1
N763     M974 Q1 S2 P0
N764 
N765     M970.3 Q0 A5 K0 O1
N766     M974 Q0 S2 P0
N767 
N768     M970.2 Q2 K0 W38 Z0.01
N769     M974 Q2 S2 P0
N770     M500
N771 
N772     M975 S1
N773 ;===== mech mode sweep end =====
N774 
N775 M400
N776 ;M73 P99
N777 
N778 G150.3 ; move to garbage can to wait for temp
N779 M1026
N780 
N781 ;===== xy ofst cali start =====
N782 
N783 M1002 judge_flag auto_cali_toolhead_offset_flag
N784 
N785 M622 J0
N786     M1012.5 N1 R1
N787 M623
N788 
N789 M622 J1
N790     M1002 gcode_claim_action : 39
N791     M141 S0
N792     M620.17 T0 S230 L2
N793     M620.17 T1 S255 L0
N794     G383 O1 T255 L0
N795     M500
N796     M141 S0
N797 M623
N798 
N799 M622 J2
N800     M1002 gcode_claim_action : 39
N801     M141 S0
N802     M620.17 T0 S230 L2
N803     M620.17 T1 S255 L0
N804     G383.3 T255 L0
N805     M500
N806     M141 S0
N807 M623
N808 ;===== xy ofst cali end =====
N809 
N810 M400
N811 ;M73 P99
N812 
N813 M1002 gcode_claim_action : 0
N814 M400
N815 
N816 ;============switch again==================
N817 
N818 M211 X0 Y0 Z0 ;turn off soft endstop
N819 G91
N820 G1 Z6 F1200
N821 G90
N822 M1002 set_filament_type:PETG-CF
N823 M620 S0A
N824 M400
N825 T0
N826 M400
N827 M628 S0
N828 M629
N829 M400
N830 M621 S0A
N831 
N832 ;============switch again==================
N833 
N834 M400
N835 ;M73 P99
N836 
N837 ;===== wait temperature reaching the reference value =======
N838 
N839 M104 S255 ; rise to print tmpr
N840 
N841 M140 S70 
N842 M190 S70 
N843 
N844     ;========turn off light and fans =============
N845     M960 S1 P0 ; turn off laser
N846     M960 S2 P0 ; turn off laser
N847     M106 S0 ; turn off fan
N848     M106 P2 S0 ; turn off big fan
N849 
N850     
N851         M142 P1 R35 S40 U0.3 V0.5 ; set chamber autocooling
N852     
N853 
N854     ;============set motor current==================
N855     M400 S1
N856 
N857 ;===== wait temperature reaching the reference value =======
N858 
N859 M400
N860 ;M73 P99
N861 
N862 ;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==
N863     
N864         G29.1 Z-0.02 ; for Textured PEI Plate
N865     
N866     
N867 G150.1
N868 
N869 M975 S1 ; turn on mech mode supression
N870 M983.4 S1 ; turn on deformation compensation 
N871 G29.2 S1 ; turn on pos comp
N872 G29.7 S1
N873 
N874 G90
N875 M73 P28 R24
N876 G1 Z5 F1200
N877 G1 Y295 F30000
N878 G1 Y265 F18000
N879 
N880 ;===== nozzle load line ===============================
N881 G29.2 S1 ; ensure z comp turn on
N882 G90
N883 M83
N884 M109 S255
N885 
N886     ;G130 O0 F2.39055 L80 E5 D12 A157.309 B114.718 I35 J83.9511
N887     G130 O0 X250 Y-0.5 Z0.8 F2.39055 L40 E20 D5
N888 
N889 G90
N890 M83
N891 G1 Z0.2
N892 
N893 ;===== noozle load line end ===========================
N894 
N895 M400
N896 ;M73 P99
N897 
N898 M993 A1 B1 C1 ; nozzle cam detection allowed.
N899 
N900 
N901 M1015.3 S0;disable tpu clog detect
N902 
N903 
N904 
N905 M1015.4 S1 K1 H0.4 ;enable E air printing detect
N906 
N907 
N908 M620.6 I0 W1 ;enable ams air printing detect
N909 
N910 M211 Z1
N911 G29.99
N912 
N913 
N914 ; MACHINE_START_GCODE_END
N915 M104 T0 S44 N0 ;Multi extruder pre cooling
N916 ; filament start gcode
N917 ;VT0
N918 G90
N919 G21
N920 M83 ; use relative distances for extrusion
N921 M981 S1 P20000 ;open spaghetti detector
N922 ; CHANGE_LAYER
N923 ; Z_HEIGHT: 0.2
N924 ; LAYER_HEIGHT: 0.2
N925 G1 E-.8 F1800
N926 ;======== H2D 20250521========
N927 ; layer num/total_layer_count: 1/63
N928 ; update layer progress
N929 M73 L1
N930 M991 S0 P0 ;notify layer change
N931 
N932 
N933 M106 S0
N934 M106 P2 S0
N935 ; OBJECT_ID: 79
N936 ; start printing object, unique label id: 79
N937 M624 AQAAAAAAAAA=
N938 G1 X190.538 Y196.897 F60000
N939 M204 S6000
N940 G1 Z.4
N941 G1 Z.2
N942 G1 E.8 F1800
N943 ; FEATURE: Inner wall
N944 ; LINE_WIDTH: 0.5
N945 G1 F3000
N946 M204 S500
N947 G1 X159.08 Y196.897 E1.13581
N948 G1 X159.08 Y124.005 E2.63184
N949 G1 X190.538 Y124.005 E1.13581
N950 G1 X190.538 Y196.837 E2.62968
N951 M204 S6000
N952 G1 X190.995 Y197.354 F60000
N953 G1 F3000
N954 M204 S500
N955 G1 X158.623 Y197.354 E1.16881
N956 G1 X158.623 Y123.548 E2.66485
N957 G1 X190.995 Y123.548 E1.16881
N958 G1 X190.995 Y197.294 E2.66268
N959 M204 S6000
N960 G1 X191.452 Y197.812 F60000
N961 G1 F3000
N962 M204 S500
N963 G1 X158.166 Y197.812 E1.20182
N964 G1 X158.166 Y123.091 E2.69786
N965 G1 X191.452 Y123.091 E1.20182
N966 G1 X191.452 Y197.752 E2.69569
N967 M204 S6000
N968 G1 X191.909 Y198.269 F60000
N969 ; FEATURE: Outer wall
N970 G1 F3000
N971 M204 S500
N972 G1 X157.709 Y198.269 E1.23483
N973 G1 X157.709 Y122.634 E2.73086
N974 G1 X191.909 Y122.634 E1.23483
N975 G1 X191.909 Y198.209 E2.7287
N976 M73 P28 R23
N977 G1 E-.8 F1800
N978 M204 S6000
N979 M73 P29 R23
N980 G1 X191.653 Y190.58 Z.6 F60000
N981 G1 X189.428 Y124.188 Z.6
N982 G1 Z.2
N983 G1 E.8 F1800
N984 ; FEATURE: Bottom surface
N985 ; LINE_WIDTH: 0.50125
N986 G1 F6300
N987 M204 S500
N988 G1 X190.149 Y124.909 E.03691
N989 G1 X190.149 Y125.557 E.02347
N990 G1 X188.986 Y124.394 E.05957
N991 G1 X188.338 Y124.394 E.02347
N992 G1 X190.149 Y126.205 E.09276
N993 G1 X190.149 Y126.854 E.02347
N994 G1 X187.689 Y124.394 E.12594
N995 G1 X187.041 Y124.394 E.02347
N996 G1 X190.149 Y127.502 E.15913
N997 G1 X190.149 Y128.15 E.02347
N998 G1 X186.393 Y124.394 E.19232
N999 G1 X185.745 Y124.394 E.02347
N1000 G1 X190.149 Y128.798 E.22551
N1001 G1 X190.149 Y129.446 E.02347
N1002 G1 X185.097 Y124.394 E.25869
N1003 G1 X184.448 Y124.394 E.02347
N1004 G1 X190.149 Y130.094 E.29188
N1005 G1 X190.149 Y130.743 E.02347
N1006 G1 X183.8 Y124.394 E.32507
N1007 G1 X183.152 Y124.394 E.02347
N1008 G1 X190.149 Y131.391 E.35826
N1009 G1 X190.149 Y132.039 E.02347
N1010 G1 X182.504 Y124.394 E.39144
N1011 G1 X181.856 Y124.394 E.02347
N1012 G1 X190.149 Y132.687 E.42463
N1013 G1 X190.149 Y133.335 E.02347
N1014 G1 X181.208 Y124.394 E.45782
N1015 G1 X180.559 Y124.394 E.02347
N1016 G1 X190.149 Y133.983 E.49101
N1017 G1 X190.149 Y134.632 E.02347
N1018 G1 X179.911 Y124.394 E.52419
N1019 G1 X179.263 Y124.394 E.02347
N1020 G1 X190.149 Y135.28 E.55738
N1021 G1 X190.149 Y135.928 E.02347
N1022 G1 X178.615 Y124.394 E.59057
N1023 G1 X177.967 Y124.394 E.02347
N1024 G1 X190.149 Y136.576 E.62376
N1025 G1 X190.149 Y137.224 E.02347
N1026 G1 X177.319 Y124.394 E.65694
N1027 G1 X176.67 Y124.394 E.02347
N1028 G1 X190.149 Y137.873 E.69013
N1029 G1 X190.149 Y138.521 E.02347
N1030 G1 X176.022 Y124.394 E.72332
N1031 G1 X175.374 Y124.394 E.02347
N1032 G1 X190.149 Y139.169 E.75651
N1033 G1 X190.149 Y139.817 E.02347
N1034 G1 X174.726 Y124.394 E.78969
N1035 G1 X174.078 Y124.394 E.02347
N1036 G1 X190.149 Y140.465 E.82288
N1037 G1 X190.149 Y141.113 E.02347
N1038 G1 X173.429 Y124.394 E.85607
N1039 G1 X172.781 Y124.394 E.02347
N1040 G1 X190.149 Y141.762 E.88926
N1041 G1 X190.149 Y142.41 E.02347
N1042 G1 X172.133 Y124.394 E.92244
N1043 G1 X171.485 Y124.394 E.02347
N1044 G1 X190.149 Y143.058 E.95563
N1045 G1 X190.149 Y143.706 E.02347
N1046 G1 X170.837 Y124.394 E.98882
N1047 G1 X170.189 Y124.394 E.02347
N1048 G1 X190.149 Y144.354 E1.02201
N1049 G1 X190.149 Y145.002 E.02347
N1050 G1 X169.54 Y124.394 E1.05519
N1051 G1 X168.892 Y124.394 E.02347
N1052 G1 X190.149 Y145.651 E1.08838
N1053 G1 X190.149 Y146.299 E.02347
N1054 G1 X168.244 Y124.394 E1.12157
N1055 G1 X167.596 Y124.394 E.02347
N1056 G1 X190.149 Y146.947 E1.15476
N1057 G1 X190.149 Y147.595 E.02347
N1058 G1 X166.948 Y124.394 E1.18794
N1059 G1 X166.3 Y124.394 E.02347
N1060 G1 X190.149 Y148.243 E1.22113
N1061 G1 X190.149 Y148.892 E.02347
N1062 G1 X165.651 Y124.394 E1.25432
N1063 G1 X165.003 Y124.394 E.02347
N1064 G1 X190.149 Y149.54 E1.28751
N1065 G1 X190.149 Y150.188 E.02347
N1066 G1 X164.355 Y124.394 E1.32069
N1067 G1 X163.707 Y124.394 E.02347
N1068 G1 X190.149 Y150.836 E1.35388
N1069 G1 X190.149 Y151.484 E.02347
N1070 G1 X163.059 Y124.394 E1.38707
N1071 G1 X162.41 Y124.394 E.02347
N1072 G1 X190.149 Y152.132 E1.42026
N1073 G1 X190.149 Y152.781 E.02347
N1074 M73 P30 R23
N1075 G1 X161.762 Y124.394 E1.45344
N1076 G1 X161.114 Y124.394 E.02347
N1077 G1 X190.149 Y153.429 E1.48663
N1078 G1 X190.149 Y154.077 E.02347
N1079 G1 X160.466 Y124.394 E1.51982
N1080 G1 X159.818 Y124.394 E.02347
N1081 G1 X190.149 Y154.725 E1.55301
N1082 G1 X190.149 Y155.373 E.02347
N1083 G1 X159.469 Y124.693 E1.57089
N1084 G1 X159.469 Y125.341 E.02347
N1085 G1 X190.149 Y156.021 E1.57089
N1086 G1 X190.149 Y156.67 E.02347
N1087 G1 X159.469 Y125.989 E1.57089
N1088 G1 X159.469 Y126.637 E.02347
N1089 G1 X190.149 Y157.318 E1.57089
N1090 G1 X190.149 Y157.966 E.02347
N1091 G1 X159.469 Y127.285 E1.57089
N1092 G1 X159.469 Y127.934 E.02347
N1093 G1 X190.149 Y158.614 E1.57089
N1094 G1 X190.149 Y159.262 E.02347
N1095 G1 X159.469 Y128.582 E1.57089
N1096 G1 X159.469 Y129.23 E.02347
N1097 G1 X190.149 Y159.911 E1.57089
N1098 G1 X190.149 Y160.559 E.02347
N1099 G1 X159.469 Y129.878 E1.57089
N1100 G1 X159.469 Y130.526 E.02347
N1101 G1 X190.149 Y161.207 E1.57089
N1102 G1 X190.149 Y161.855 E.02347
N1103 G1 X159.469 Y131.175 E1.57089
N1104 G1 X159.469 Y131.823 E.02347
N1105 G1 X190.149 Y162.503 E1.57089
N1106 G1 X190.149 Y163.151 E.02347
N1107 G1 X159.469 Y132.471 E1.57089
N1108 G1 X159.469 Y133.119 E.02347
N1109 G1 X190.149 Y163.8 E1.57089
N1110 G1 X190.149 Y164.448 E.02347
N1111 G1 X159.469 Y133.767 E1.57089
N1112 G1 X159.469 Y134.415 E.02347
N1113 M104 T0 S230 N0 ;Multi extruder pre heating
N1114 G1 X190.149 Y165.096 E1.57089
N1115 G1 X190.149 Y165.744 E.02347
N1116 G1 X159.469 Y135.064 E1.57089
N1117 G1 X159.469 Y135.712 E.02347
N1118 G1 X190.149 Y166.392 E1.57089
N1119 G1 X190.149 Y167.04 E.02347
N1120 G1 X159.469 Y136.36 E1.57089
N1121 G1 X159.469 Y137.008 E.02347
N1122 G1 X190.149 Y167.689 E1.57089
N1123 G1 X190.149 Y168.337 E.02347
N1124 G1 X159.469 Y137.656 E1.57089
N1125 G1 X159.469 Y138.304 E.02347
N1126 G1 X190.149 Y168.985 E1.57089
N1127 G1 X190.149 Y169.633 E.02347
N1128 G1 X159.469 Y138.953 E1.57089
N1129 G1 X159.469 Y139.601 E.02347
N1130 G1 X190.149 Y170.281 E1.57089
N1131 G1 X190.149 Y170.93 E.02347
N1132 G1 X159.469 Y140.249 E1.57089
N1133 G1 X159.469 Y140.897 E.02347
N1134 G1 X190.149 Y171.578 E1.57089
N1135 G1 X190.149 Y172.226 E.02347
N1136 G1 X159.469 Y141.545 E1.57089
N1137 G1 X159.469 Y142.194 E.02347
N1138 G1 X190.149 Y172.874 E1.57089
N1139 G1 X190.149 Y173.522 E.02347
N1140 M73 P31 R23
N1141 G1 X159.469 Y142.842 E1.57089
N1142 G1 X159.469 Y143.49 E.02347
N1143 G1 X190.149 Y174.17 E1.57089
N1144 G1 X190.149 Y174.819 E.02347
N1145 G1 X159.469 Y144.138 E1.57089
N1146 G1 X159.469 Y144.786 E.02347
N1147 G1 X190.149 Y175.467 E1.57089
N1148 G1 X190.149 Y176.115 E.02347
N1149 G1 X159.469 Y145.434 E1.57089
N1150 G1 X159.469 Y146.083 E.02347
N1151 G1 X190.149 Y176.763 E1.57089
N1152 G1 X190.149 Y177.411 E.02347
N1153 G1 X159.469 Y146.731 E1.57089
N1154 G1 X159.469 Y147.379 E.02347
N1155 G1 X190.149 Y178.059 E1.57089
N1156 G1 X190.149 Y178.708 E.02347
N1157 G1 X159.469 Y148.027 E1.57089
N1158 G1 X159.469 Y148.675 E.02347
N1159 G1 X190.149 Y179.356 E1.57089
N1160 G1 X190.149 Y180.004 E.02347
N1161 G1 X159.469 Y149.323 E1.57089
N1162 G1 X159.469 Y149.972 E.02347
N1163 G1 X190.149 Y180.652 E1.57089
N1164 G1 X190.149 Y181.3 E.02347
N1165 G1 X159.469 Y150.62 E1.57089
N1166 G1 X159.469 Y151.268 E.02347
N1167 G1 X190.149 Y181.949 E1.57089
N1168 G1 X190.149 Y182.597 E.02347
N1169 G1 X159.469 Y151.916 E1.57089
N1170 G1 X159.469 Y152.564 E.02347
N1171 G1 X190.149 Y183.245 E1.57089
N1172 G1 X190.149 Y183.893 E.02347
N1173 G1 X159.469 Y153.213 E1.57089
N1174 G1 X159.469 Y153.861 E.02347
N1175 G1 X190.149 Y184.541 E1.57089
N1176 G1 X190.149 Y185.189 E.02347
N1177 G1 X159.469 Y154.509 E1.57089
N1178 G1 X159.469 Y155.157 E.02347
N1179 G1 X190.149 Y185.838 E1.57089
N1180 G1 X190.149 Y186.486 E.02347
N1181 G1 X159.469 Y155.805 E1.57089
N1182 G1 X159.469 Y156.453 E.02347
N1183 G1 X190.149 Y187.134 E1.57089
N1184 G1 X190.149 Y187.782 E.02347
N1185 G1 X159.469 Y157.102 E1.57089
N1186 G1 X159.469 Y157.75 E.02347
N1187 G1 X190.149 Y188.43 E1.57089
N1188 G1 X190.149 Y189.078 E.02347
N1189 G1 X159.469 Y158.398 E1.57089
N1190 G1 X159.469 Y159.046 E.02347
N1191 G1 X190.149 Y189.727 E1.57089
N1192 G1 X190.149 Y190.375 E.02347
N1193 G1 X159.469 Y159.694 E1.57089
N1194 G1 X159.469 Y160.342 E.02347
N1195 G1 X190.149 Y191.023 E1.57089
N1196 G1 X190.149 Y191.671 E.02347
N1197 G1 X159.469 Y160.991 E1.57089
N1198 G1 X159.469 Y161.639 E.02347
N1199 G1 X190.149 Y192.319 E1.57089
N1200 M73 P31 R22
N1201 G1 X190.149 Y192.968 E.02347
N1202 G1 X159.469 Y162.287 E1.57089
N1203 G1 X159.469 Y162.935 E.02347
N1204 G1 X190.149 Y193.616 E1.57089
N1205 G1 X190.149 Y194.264 E.02347
N1206 M73 P32 R22
N1207 G1 X159.469 Y163.583 E1.57089
N1208 G1 X159.469 Y164.232 E.02347
N1209 G1 X190.149 Y194.912 E1.57089
N1210 G1 X190.149 Y195.56 E.02347
N1211 G1 X159.469 Y164.88 E1.57089
N1212 G1 X159.469 Y165.528 E.02347
N1213 G1 X190.149 Y196.208 E1.57089
N1214 G1 X190.149 Y196.509 E.01088
N1215 G1 X189.801 Y196.509 E.01259
N1216 G1 X159.469 Y166.176 E1.55308
N1217 G1 X159.469 Y166.824 E.02347
N1218 G1 X189.153 Y196.509 E1.51989
N1219 G1 X188.505 Y196.509 E.02347
N1220 G1 X159.469 Y167.472 E1.48671
N1221 G1 X159.469 Y168.121 E.02347
N1222 G1 X187.857 Y196.509 E1.45352
N1223 G1 X187.209 Y196.509 E.02347
N1224 G1 X159.469 Y168.769 E1.42033
N1225 G1 X159.469 Y169.417 E.02347
N1226 G1 X186.56 Y196.509 E1.38714
N1227 G1 X185.912 Y196.509 E.02347
N1228 G1 X159.469 Y170.065 E1.35396
N1229 G1 X159.469 Y170.713 E.02347
N1230 G1 X185.264 Y196.509 E1.32077
N1231 G1 X184.616 Y196.509 E.02347
N1232 G1 X159.469 Y171.361 E1.28758
N1233 G1 X159.469 Y172.01 E.02347
N1234 G1 X183.968 Y196.509 E1.25439
N1235 G1 X183.32 Y196.509 E.02347
N1236 G1 X159.469 Y172.658 E1.22121
N1237 G1 X159.469 Y173.306 E.02347
N1238 G1 X182.671 Y196.509 E1.18802
N1239 G1 X182.023 Y196.509 E.02347
N1240 G1 X159.469 Y173.954 E1.15483
N1241 G1 X159.469 Y174.602 E.02347
N1242 G1 X181.375 Y196.509 E1.12164
N1243 G1 X180.727 Y196.509 E.02347
N1244 G1 X159.469 Y175.251 E1.08846
N1245 G1 X159.469 Y175.899 E.02347
N1246 G1 X180.079 Y196.509 E1.05527
N1247 G1 X179.431 Y196.509 E.02347
N1248 G1 X159.469 Y176.547 E1.02208
N1249 G1 X159.469 Y177.195 E.02347
N1250 G1 X178.782 Y196.509 E.98889
N1251 G1 X178.134 Y196.509 E.02347
N1252 G1 X159.469 Y177.843 E.95571
N1253 G1 X159.469 Y178.491 E.02347
N1254 G1 X177.486 Y196.509 E.92252
N1255 G1 X176.838 Y196.509 E.02347
N1256 G1 X159.469 Y179.14 E.88933
N1257 G1 X159.469 Y179.788 E.02347
N1258 G1 X176.19 Y196.509 E.85614
N1259 G1 X175.541 Y196.509 E.02347
N1260 G1 X159.469 Y180.436 E.82296
N1261 G1 X159.469 Y181.084 E.02347
N1262 G1 X174.893 Y196.509 E.78977
N1263 G1 X174.245 Y196.509 E.02347
N1264 G1 X159.469 Y181.732 E.75658
N1265 G1 X159.469 Y182.38 E.02347
N1266 G1 X173.597 Y196.509 E.72339
N1267 G1 X172.949 Y196.509 E.02347
N1268 G1 X159.469 Y183.029 E.69021
N1269 G1 X159.469 Y183.677 E.02347
N1270 G1 X172.301 Y196.509 E.65702
N1271 G1 X171.652 Y196.509 E.02347
N1272 G1 X159.469 Y184.325 E.62383
N1273 G1 X159.469 Y184.973 E.02347
N1274 G1 X171.004 Y196.509 E.59064
N1275 G1 X170.356 Y196.509 E.02347
N1276 G1 X159.469 Y185.621 E.55746
N1277 G1 X159.469 Y186.27 E.02347
N1278 G1 X169.708 Y196.509 E.52427
N1279 G1 X169.06 Y196.509 E.02347
N1280 G1 X159.469 Y186.918 E.49108
N1281 G1 X159.469 Y187.566 E.02347
N1282 G1 X168.412 Y196.509 E.45789
N1283 G1 X167.763 Y196.509 E.02347
N1284 G1 X159.469 Y188.214 E.42471
N1285 G1 X159.469 Y188.862 E.02347
N1286 G1 X167.115 Y196.509 E.39152
N1287 G1 X166.467 Y196.509 E.02347
N1288 M73 P33 R22
N1289 G1 X159.469 Y189.51 E.35833
N1290 G1 X159.469 Y190.159 E.02347
N1291 G1 X165.819 Y196.509 E.32514
N1292 G1 X165.171 Y196.509 E.02347
N1293 G1 X159.469 Y190.807 E.29196
N1294 G1 X159.469 Y191.455 E.02347
N1295 G1 X164.522 Y196.509 E.25877
N1296 G1 X163.874 Y196.509 E.02347
N1297 G1 X159.469 Y192.103 E.22558
N1298 G1 X159.469 Y192.751 E.02347
N1299 G1 X163.226 Y196.509 E.19239
N1300 G1 X162.578 Y196.509 E.02347
N1301 G1 X159.469 Y193.399 E.15921
N1302 G1 X159.469 Y194.048 E.02347
N1303 G1 X161.93 Y196.509 E.12602
N1304 G1 X161.282 Y196.509 E.02347
N1305 G1 X159.469 Y194.696 E.09283
N1306 G1 X159.469 Y195.344 E.02347
N1307 G1 X160.633 Y196.509 E.05964
N1308 G1 X159.985 Y196.509 E.02347
N1309 G1 X159.263 Y195.786 E.03699
N1310 ; OBJECT_ID: 90
N1311 ; WIPE_START
N1312 G1 X159.985 Y196.509 E-.38822
N1313 G1 X160.633 Y196.509 E-.2463
N1314 G1 X160.4 Y196.275 E-.12548
N1315 ; WIPE_END
N1316 G1 E-.04 F1800
N1317 M204 S6000
N1318 G17
N1319 G3 Z.6 I1.217 J0 P1  F60000
N1320 ; stop printing object, unique label id: 79
N1321 M625
N1322 ; object ids of layer 1 start: 79,90
N1323 M624 AwAAAAAAAAA=
N1324 ;======== H2D 20250213========
N1325 ; SKIPPABLE_START
N1326 ; SKIPTYPE: timelapse
N1327 M622.1 S1 ; for prev firware, default turned on
N1328 
N1329 M1002 judge_flag timelapse_record_flag
N1330 
N1331 M622 J1
N1332 M993 A2 B2 C2
N1333 M993 A0 B0 C0
N1334 
N1335 
N1336 M9712 E1 M0
N1337 M83
N1338 G1 Z0.6 F1200
N1339 M400
N1340 M9713
N1341 
N1342 
N1343 M9711 M0 E1 Z0.6 S11 C10 O0 T3000
N1344 
N1345 
N1346 M9712 E1 M0
N1347 G90
N1348 G1 Z3.2
N1349 G1 Y295 F30000
N1350 G1 Y265 F18000
N1351 M83
N1352 M9713
N1353 
N1354 M993 A3 B3 C3
N1355 
N1356 M623
N1357 ; SKIPPABLE_END
N1358 
N1359 ; object ids of this layer1 end: 79,90
N1360 M625
N1361 G1 E-1.2 F1800
N1362 ; filament end gcode 
N1363 G1 Z3.6 F60000
N1364 ;======== H2D ========
N1365 ;===== 20250427 =====
N1366 M993 A2 B2 C2 ; nozzle cam detection allow status save.
N1367 M993 A0 B0 C0 ; nozzle cam detection not allowed.
N1368 
N1369 
N1370 M1015.4 S0 ; disable E air printing detect
N1371 
N1372 
N1373 M620 S2A
N1374 M1002 gcode_claim_action : 4
N1375 M204 S9000
N1376 
N1377 G1 Z3.2 F1200
N1378 
N1379 M400
N1380 M106 P1 S0
N1381 M106 P2 S0
N1382 
N1383 
N1384 
N1385 
N1386 M620.10 A0 F286.867 L0 H0.4 T270 P255 S1
N1387 
N1388 
N1389 
N1390 M620.10 A1 F261.922 L0 H0.4 T250 P230 S1
N1391 
N1392 
N1393 
N1394 
N1395 
N1396 M620.11 S1 L0 I0 R10 D8 E-18 F286.867
N1397 
N1398 
N1399 
N1400 
N1401 M620.11 H0
N1402 
N1403 
N1404 T2
N1405 M73 E1
N1406 
N1407 ;deretract
N1408 
N1409 
N1410 ;VG1 E4 F261
N1411 ;VG1 E4 F130
N1412 
N1413 
N1414 
N1415 ; VFLUSH_START
N1416 
N1417 
N1418 ;VG1 E0 F261
N1419 
N1420 
N1421 SYNC T0
N1422 
N1423 ; VFLUSH_END
N1424 
N1425 M1002 set_filament_type:TPU-AMS
N1426 
N1427 M400
N1428 M83
N1429 
N1430 
N1431 M628 S0
N1432 ;VM109 S230
N1433 M629
N1434 M400
N1435 
N1436 M983.3 F4.375 A0.4
N1437 
N1438 M400
N1439 
N1440 M73 P34 R22
N1441 G1 Y295 F30000
N1442 G1 Y265 F18000
N1443 G1 Z3.2 F3000
N1444 
N1445 M204 S500
N1446 
N1447 
N1448 M621 S2A
N1449 
N1450 M993 A3 B3 C3 ; nozzle cam detection allow status restore.
N1451 
N1452 
N1453 M1015.3 S0;disable tpu clog detect
N1454 
N1455 
N1456 
N1457 M1015.4 S0 ; disable E air printing detect
N1458 
N1459 
N1460 M620.6 I2 W1 ;enable ams air printing detect
N1461 M1002 gcode_claim_action : 0
N1462 M106 S0
N1463 M106 P2 S0
N1464 M104 S230 ; set nozzle temperature
N1465 ; filament start gcode
N1466 ; OBJECT_ID: 79
N1467 ; OBJECT_ID: 90
N1468 G1 E-.8 F1800
N1469 ; start printing object, unique label id: 90
N1470 M624 AgAAAAAAAAA=
N1471 G1 X179.55 Y115.468 F60000
N1472 G1 Z.2
N1473 G1 E.8 F1800
N1474 ; FEATURE: Outer wall
N1475 ; LINE_WIDTH: 0.5
N1476 G1 F3000
N1477 M204 S500
N1478 G1 X165.05 Y115.468 E.55109
N1479 G1 X165.05 Y114.968 E.019
N1480 G1 X179.55 Y114.968 E.55109
N1481 G1 X179.55 Y115.408 E.01672
N1482 ; CHANGE_LAYER
N1483 ; Z_HEIGHT: 0.4
N1484 ; LAYER_HEIGHT: 0.2
N1485 ; WIPE_START
N1486 G1 F3000
N1487 G1 X177.55 Y115.416 E-.76
N1488 ; WIPE_END
N1489 M73 P34 R21
N1490 G1 E-.04 F1800
N1491 ; stop printing object, unique label id: 90
N1492 M625
N1493 ;======== H2D 20250521========
N1494 ; layer num/total_layer_count: 2/63
N1495 ; update layer progress
N1496 M73 L2
N1497 M991 S0 P1 ;notify layer change
N1498 
N1499 
N1500 M106 S25.5
N1501 M106 P2 S255
N1502 ; open powerlost recovery
N1503 M1003 S1
N1504 G1 E-1.2
N1505 ; filament end gcode 
N1506 M204 S10000
N1507 G17
N1508 G3 Z.6 I1.217 J0 P1  F60000
N1509 ;======== H2D ========
N1510 ;===== 20250427 =====
N1511 M993 A2 B2 C2 ; nozzle cam detection allow status save.
N1512 M993 A0 B0 C0 ; nozzle cam detection not allowed.
N1513 
N1514 
N1515 M1015.4 S1 K0 ;disable E air printing detect
N1516 
N1517 
N1518 M620 S0A
N1519 M1002 gcode_claim_action : 4
N1520 M204 S9000
N1521 
N1522 G1 Z3.4 F1200
N1523 
N1524 M400
N1525 M106 P1 S0
N1526 M106 P2 S0
N1527 
N1528 
N1529 ; get travel path for change filament
N1530 ;M620.1 X54 Y0 F21000 P0
N1531 ;M620.1 X54 Y0 F21000 P1
N1532 ;M620.1 X54 Y245 F21000 P2
N1533 
N1534 
N1535 
N1536 M620.10 A0 F261.922 L0 H0.4 T250 P230 S1
N1537 
N1538 
N1539 
N1540 M620.10 A1 F286.867 L0 H0.4 T270 P255 S1
N1541 
N1542 
N1543 
N1544 
N1545 
N1546 M620.11 S1 L0 I2 R10 D8 E-18 F261.922
N1547 
N1548 
N1549 
N1550 
N1551 M620.11 H0
N1552 
N1553 
N1554 T0
N1555 M73 E0
N1556 M104 T0 S242 N0 ;Multi extruder pre cooling in post extrusion
N1557 M104 T0 S0 N0 ;Multi extruder pre cooling
N1558 
N1559 ;deretract
N1560 
N1561 
N1562 ;VG1 E4 F286
N1563 ;VG1 E4 F143
N1564 
N1565 
N1566 
N1567 ; VFLUSH_START
N1568 
N1569 
N1570 ;VG1 E0 F261
N1571 
N1572 
N1573 SYNC T0
N1574 
N1575 ; VFLUSH_END
N1576 
N1577 M1002 set_filament_type:PETG-CF
N1578 
N1579 M400
N1580 M83
N1581 
N1582 
N1583 M628 S0
N1584 ;VM109 S255
N1585 M629
N1586 M400
N1587 
N1588 M983.3 F4.79167 A0.4
N1589 
N1590 M400
N1591 
N1592 M73 P35 R21
N1593 G1 Y295 F30000
N1594 G1 Y265 F18000
N1595 G1 Z3.4 F3000
N1596 
N1597 M204 S8000
N1598 
N1599 
N1600 M621 S0A
N1601 
N1602 M993 A3 B3 C3 ; nozzle cam detection allow status restore.
N1603 
N1604 
N1605 M1015.3 S0;disable tpu clog detect
N1606 
N1607 
N1608 
N1609 M1015.4 S1 K1 H0.4 ;enable E air printing detect
N1610 
N1611 
N1612 M620.6 I0 W1 ;enable ams air printing detect
N1613 M1002 gcode_claim_action : 0
N1614 M106 S0
N1615 M106 P2 S0
N1616 M104 S255 ; set nozzle temperature
N1617 ; filament start gcode
N1618 ; OBJECT_ID: 79
N1619 ; start printing object, unique label id: 79
N1620 M624 AQAAAAAAAAA=
N1621 G1 X190.893 Y197.252 F60000
N1622 G1 Z.4
N1623 G1 E2 F1800
N1624 ; FEATURE: Inner wall
N1625 ; LINE_WIDTH: 0.45
N1626 G1 F8475
N1627 M204 S8000
N1628 G1 X158.725 Y197.252 E1.03439
N1629 G1 X158.725 Y123.65 E2.36678
N1630 G1 X190.893 Y123.65 E1.03439
N1631 G1 X190.893 Y197.192 E2.36485
N1632 M204 S10000
N1633 G1 X191.3 Y197.659 F60000
N1634 G1 F8475
N1635 M204 S8000
N1636 G1 X158.318 Y197.659 E1.06057
N1637 G1 X158.318 Y123.243 E2.39296
N1638 G1 X191.3 Y123.243 E1.06057
N1639 G1 X191.3 Y197.599 E2.39103
N1640 M204 S10000
N1641 G1 X191.707 Y198.067 F60000
N1642 G1 F8475
N1643 M204 S8000
N1644 G1 X157.911 Y198.067 E1.08675
N1645 G1 X157.911 Y122.836 E2.41914
N1646 G1 X191.707 Y122.836 E1.08675
N1647 G1 X191.707 Y198.007 E2.41721
N1648 M204 S10000
N1649 G1 X192.099 Y198.459 F60000
N1650 ; FEATURE: Outer wall
N1651 ; LINE_WIDTH: 0.42
N1652 G1 F9149.261
N1653 M204 S5000
N1654 G1 X157.519 Y198.459 E1.03002
N1655 G1 X157.519 Y122.444 E2.26421
N1656 G1 X192.099 Y122.444 E1.03002
N1657 G1 X192.099 Y198.399 E2.26243
N1658 G1 E-.8 F1800
N1659 M204 S10000
N1660 G1 X189.966 Y197.089 Z.8 F60000
N1661 G1 Z.4
N1662 G1 E.8 F1800
N1663 ; FEATURE: Internal solid infill
N1664 ; LINE_WIDTH: 0.42048
N1665 G1 F9137.621
N1666 M204 S8000
N1667 G1 X190.559 Y196.495 E.02504
N1668 G1 X190.559 Y195.961 E.01592
N1669 G1 X189.601 Y196.919 E.0404
N1670 G1 X189.068 Y196.919 E.01592
N1671 G1 X190.559 Y195.427 E.06292
N1672 G1 X190.559 Y194.893 E.01592
N1673 G1 X188.534 Y196.919 E.08544
N1674 G1 X188 Y196.919 E.01592
N1675 G1 X190.559 Y194.359 E.10797
N1676 G1 X190.559 Y193.825 E.01592
N1677 G1 X187.466 Y196.919 E.13049
N1678 G1 X186.932 Y196.919 E.01592
N1679 G1 X190.559 Y193.291 E.15301
N1680 G1 X190.559 Y192.758 E.01592
N1681 G1 X186.398 Y196.919 E.17553
N1682 G1 X185.864 Y196.919 E.01592
N1683 G1 X190.559 Y192.224 E.19805
N1684 G1 X190.559 Y191.69 E.01592
N1685 G1 X185.33 Y196.919 E.22057
N1686 G1 X184.796 Y196.919 E.01592
N1687 G1 X190.559 Y191.156 E.24309
N1688 G1 X190.559 Y190.622 E.01592
N1689 G1 X184.262 Y196.919 E.26561
N1690 G1 X183.728 Y196.919 E.01592
N1691 G1 X190.559 Y190.088 E.28813
N1692 G1 X190.559 Y189.554 E.01592
N1693 G1 X183.194 Y196.919 E.31066
N1694 G1 X182.66 Y196.919 E.01592
N1695 G1 X190.559 Y189.02 E.33318
N1696 G1 X190.559 Y188.486 E.01592
N1697 G1 X182.126 Y196.919 E.3557
N1698 G1 X181.592 Y196.919 E.01592
N1699 G1 X190.559 Y187.952 E.37822
N1700 G1 X190.559 Y187.418 E.01593
N1701 G1 X181.058 Y196.919 E.40074
N1702 G1 X180.524 Y196.919 E.01592
N1703 G1 X190.559 Y186.884 E.42326
N1704 G1 X190.559 Y186.35 E.01592
N1705 G1 X179.99 Y196.919 E.44578
N1706 G1 X179.456 Y196.919 E.01592
N1707 G1 X190.559 Y185.816 E.4683
N1708 G1 X190.559 Y185.282 E.01592
N1709 G1 X178.922 Y196.919 E.49082
N1710 G1 X178.389 Y196.919 E.01592
N1711 G1 X190.559 Y184.748 E.51335
N1712 G1 X190.559 Y184.214 E.01592
N1713 G1 X177.855 Y196.919 E.53587
N1714 G1 X177.321 Y196.919 E.01592
N1715 G1 X190.559 Y183.68 E.55839
N1716 G1 X190.559 Y183.146 E.01592
N1717 G1 X176.787 Y196.919 E.58091
N1718 G1 X176.253 Y196.919 E.01593
N1719 G1 X190.559 Y182.612 E.60343
N1720 G1 X190.559 Y182.079 E.01592
N1721 G1 X175.719 Y196.919 E.62595
N1722 G1 X175.185 Y196.919 E.01592
N1723 G1 X190.559 Y181.545 E.64847
N1724 G1 X190.559 Y181.011 E.01592
N1725 G1 X174.651 Y196.919 E.67099
N1726 G1 X174.117 Y196.919 E.01592
N1727 G1 X190.559 Y180.477 E.69351
N1728 G1 X190.559 Y179.943 E.01592
N1729 G1 X173.583 Y196.919 E.71604
N1730 G1 X173.049 Y196.919 E.01593
N1731 G1 X190.559 Y179.409 E.73856
N1732 G1 X190.559 Y178.875 E.01592
N1733 G1 X172.515 Y196.919 E.76108
N1734 G1 X171.981 Y196.919 E.01592
N1735 G1 X190.559 Y178.341 E.7836
N1736 G1 X190.559 Y177.807 E.01592
N1737 G1 X171.447 Y196.919 E.80612
N1738 G1 X170.913 Y196.919 E.01592
N1739 G1 X190.559 Y177.273 E.82864
N1740 G1 X190.559 Y176.739 E.01592
N1741 G1 X170.379 Y196.919 E.85116
N1742 G1 X169.845 Y196.919 E.01592
N1743 G1 X190.559 Y176.205 E.87368
N1744 G1 X190.559 Y175.671 E.01592
N1745 G1 X169.311 Y196.919 E.8962
N1746 G1 X168.777 Y196.919 E.01592
N1747 G1 X190.559 Y175.137 E.91873
N1748 G1 X190.559 Y174.603 E.01592
N1749 G1 X168.243 Y196.919 E.94125
N1750 G1 X167.71 Y196.919 E.01592
N1751 G1 X190.559 Y174.069 E.96377
N1752 G1 X190.559 Y173.535 E.01592
N1753 G1 X167.176 Y196.919 E.98629
N1754 G1 X166.642 Y196.919 E.01592
N1755 G1 X190.559 Y173.001 E1.00881
N1756 G1 X190.559 Y172.467 E.01592
N1757 G1 X166.108 Y196.919 E1.03133
N1758 G1 X165.574 Y196.919 E.01592
N1759 G1 X190.559 Y171.933 E1.05385
N1760 M73 P36 R21
N1761 G1 X190.559 Y171.4 E.01592
N1762 G1 X165.04 Y196.919 E1.07637
N1763 G1 X164.506 Y196.919 E.01592
N1764 G1 X190.559 Y170.866 E1.09889
N1765 G1 X190.559 Y170.332 E.01592
N1766 G1 X163.972 Y196.919 E1.12141
N1767 G1 X163.438 Y196.919 E.01592
N1768 G1 X190.559 Y169.798 E1.14394
N1769 G1 X190.559 Y169.264 E.01592
N1770 G1 X162.904 Y196.919 E1.16646
N1771 G1 X162.37 Y196.919 E.01592
N1772 G1 X190.559 Y168.73 E1.18898
N1773 G1 X190.559 Y168.196 E.01592
N1774 G1 X161.836 Y196.919 E1.2115
N1775 G1 X161.302 Y196.919 E.01592
N1776 G1 X190.559 Y167.662 E1.23402
N1777 G1 X190.559 Y167.128 E.01592
N1778 G1 X160.768 Y196.919 E1.25654
N1779 G1 X160.234 Y196.919 E.01592
N1780 G1 X190.559 Y166.594 E1.27906
N1781 G1 X190.559 Y166.06 E.01592
N1782 G1 X159.7 Y196.919 E1.30158
N1783 G1 X159.166 Y196.919 E.01592
N1784 G1 X190.559 Y165.526 E1.3241
N1785 G1 X190.559 Y164.992 E.01593
N1786 G1 X159.058 Y196.493 E1.32866
N1787 G1 X159.058 Y195.959 E.01592
N1788 G1 X190.559 Y164.458 E1.32866
N1789 G1 X190.559 Y163.924 E.01592
N1790 G1 X159.058 Y195.425 E1.32866
N1791 G1 X159.058 Y194.891 E.01593
N1792 G1 X190.559 Y163.39 E1.32866
N1793 G1 X190.559 Y162.856 E.01592
N1794 G1 X159.058 Y194.357 E1.32866
N1795 G1 X159.058 Y193.823 E.01592
N1796 G1 X190.559 Y162.322 E1.32866
N1797 G1 X190.559 Y161.788 E.01592
N1798 G1 X159.058 Y193.289 E1.32866
N1799 G1 X159.058 Y192.756 E.01592
N1800 G1 X190.559 Y161.254 E1.32866
N1801 G1 X190.559 Y160.721 E.01592
N1802 G1 X159.058 Y192.222 E1.32866
N1803 G1 X159.058 Y191.688 E.01592
N1804 G1 X190.559 Y160.187 E1.32866
N1805 G1 X190.559 Y159.653 E.01592
N1806 G1 X159.058 Y191.154 E1.32866
N1807 G1 X159.058 Y190.62 E.01592
N1808 G1 X190.559 Y159.119 E1.32866
N1809 G1 X190.559 Y158.585 E.01592
N1810 G1 X159.058 Y190.086 E1.32866
N1811 G1 X159.058 Y189.552 E.01592
N1812 G1 X190.559 Y158.051 E1.32866
N1813 G1 X190.559 Y157.517 E.01592
N1814 G1 X159.058 Y189.018 E1.32866
N1815 G1 X159.058 Y188.484 E.01592
N1816 G1 X190.559 Y156.983 E1.32866
N1817 G1 X190.559 Y156.449 E.01592
N1818 G1 X159.058 Y187.95 E1.32866
N1819 G1 X159.058 Y187.416 E.01592
N1820 G1 X190.559 Y155.915 E1.32866
N1821 G1 X190.559 Y155.381 E.01592
N1822 G1 X159.058 Y186.882 E1.32866
N1823 G1 X159.058 Y186.348 E.01592
N1824 G1 X190.559 Y154.847 E1.32866
N1825 G1 X190.559 Y154.313 E.01592
N1826 G1 X159.058 Y185.814 E1.32866
N1827 G1 X159.058 Y185.28 E.01592
N1828 G1 X190.559 Y153.779 E1.32866
N1829 G1 X190.559 Y153.245 E.01592
N1830 G1 X159.058 Y184.746 E1.32866
N1831 G1 X159.058 Y184.212 E.01592
N1832 G1 X190.559 Y152.711 E1.32866
N1833 G1 X190.559 Y152.177 E.01592
N1834 G1 X159.058 Y183.678 E1.32866
N1835 G1 X159.058 Y183.144 E.01593
N1836 G1 X190.559 Y151.643 E1.32866
N1837 G1 X190.559 Y151.109 E.01592
N1838 G1 X159.058 Y182.61 E1.32866
N1839 G1 X159.058 Y182.077 E.01592
N1840 G1 X190.559 Y150.575 E1.32866
N1841 G1 X190.559 Y150.042 E.01592
N1842 G1 X159.058 Y181.543 E1.32866
N1843 G1 X159.058 Y181.009 E.01592
N1844 G1 X190.559 Y149.508 E1.32866
N1845 G1 X190.559 Y148.974 E.01592
N1846 G1 X159.058 Y180.475 E1.32866
N1847 G1 X159.058 Y179.941 E.01592
N1848 G1 X190.559 Y148.44 E1.32866
N1849 G1 X190.559 Y147.906 E.01592
N1850 G1 X159.058 Y179.407 E1.32866
N1851 G1 X159.058 Y178.873 E.01592
N1852 G1 X190.559 Y147.372 E1.32866
N1853 G1 X190.559 Y146.838 E.01592
N1854 G1 X159.058 Y178.339 E1.32866
N1855 G1 X159.058 Y177.805 E.01592
N1856 G1 X190.559 Y146.304 E1.32866
N1857 G1 X190.559 Y145.77 E.01593
N1858 G1 X159.058 Y177.271 E1.32866
N1859 G1 X159.058 Y176.737 E.01592
N1860 G1 X190.559 Y145.236 E1.32866
N1861 G1 X190.559 Y144.702 E.01592
N1862 G1 X159.058 Y176.203 E1.32866
N1863 G1 X159.058 Y175.669 E.01592
N1864 G1 X190.559 Y144.168 E1.32866
N1865 G1 X190.559 Y143.634 E.01592
N1866 G1 X159.058 Y175.135 E1.32866
N1867 G1 X159.058 Y174.601 E.01592
N1868 G1 X190.559 Y143.1 E1.32866
N1869 G1 X190.559 Y142.566 E.01592
N1870 G1 X159.058 Y174.067 E1.32866
N1871 G1 X159.058 Y173.533 E.01592
N1872 G1 X190.559 Y142.032 E1.32866
N1873 G1 X190.559 Y141.498 E.01592
N1874 G1 X159.058 Y172.999 E1.32866
N1875 G1 X159.058 Y172.465 E.01592
N1876 G1 X190.559 Y140.964 E1.32866
N1877 G1 X190.559 Y140.43 E.01592
N1878 G1 X159.058 Y171.931 E1.32866
N1879 G1 X159.058 Y171.398 E.01592
N1880 G1 X190.559 Y139.896 E1.32866
N1881 G1 X190.559 Y139.362 E.01592
N1882 G1 X159.058 Y170.864 E1.32866
N1883 G1 X159.058 Y170.33 E.01592
N1884 G1 X190.559 Y138.829 E1.32866
N1885 G1 X190.559 Y138.295 E.01592
N1886 G1 X159.058 Y169.796 E1.32866
N1887 G1 X159.058 Y169.262 E.01592
N1888 G1 X190.559 Y137.761 E1.32866
N1889 G1 X190.559 Y137.227 E.01592
N1890 M73 P37 R21
N1891 G1 X159.058 Y168.728 E1.32866
N1892 G1 X159.058 Y168.194 E.01592
N1893 G1 X190.559 Y136.693 E1.32866
N1894 G1 X190.559 Y136.159 E.01592
N1895 G1 X159.058 Y167.66 E1.32866
N1896 G1 X159.058 Y167.126 E.01592
N1897 G1 X190.559 Y135.625 E1.32866
N1898 G1 X190.559 Y135.091 E.01592
N1899 G1 X159.058 Y166.592 E1.32866
N1900 G1 X159.058 Y166.058 E.01592
N1901 G1 X190.559 Y134.557 E1.32866
N1902 G1 X190.559 Y134.023 E.01593
N1903 G1 X159.058 Y165.524 E1.32866
N1904 G1 X159.058 Y164.99 E.01592
N1905 G1 X190.559 Y133.489 E1.32866
N1906 G1 X190.559 Y132.955 E.01592
N1907 G1 X159.058 Y164.456 E1.32866
N1908 G1 X159.058 Y163.922 E.01592
N1909 G1 X190.559 Y132.421 E1.32866
N1910 G1 X190.559 Y131.887 E.01592
N1911 G1 X159.058 Y163.388 E1.32866
N1912 G1 X159.058 Y162.854 E.01592
N1913 G1 X190.559 Y131.353 E1.32866
N1914 G1 X190.559 Y130.819 E.01592
N1915 G1 X159.058 Y162.32 E1.32866
N1916 G1 X159.058 Y161.786 E.01592
N1917 G1 X190.559 Y130.285 E1.32866
N1918 G1 X190.559 Y129.751 E.01592
N1919 G1 X159.058 Y161.252 E1.32866
N1920 G1 X159.058 Y160.718 E.01593
N1921 G1 X190.559 Y129.217 E1.32866
N1922 G1 X190.559 Y128.683 E.01592
N1923 G1 X159.058 Y160.185 E1.32866
N1924 G1 X159.058 Y159.651 E.01592
N1925 G1 X190.559 Y128.15 E1.32866
N1926 G1 X190.559 Y127.616 E.01592
N1927 G1 X159.058 Y159.117 E1.32866
N1928 G1 X159.058 Y158.583 E.01592
N1929 G1 X190.559 Y127.082 E1.32866
N1930 G1 X190.559 Y126.548 E.01592
N1931 G1 X159.058 Y158.049 E1.32866
N1932 G1 X159.058 Y157.515 E.01592
N1933 G1 X190.559 Y126.014 E1.32866
N1934 G1 X190.559 Y125.48 E.01592
N1935 G1 X159.058 Y156.981 E1.32866
N1936 G1 X159.058 Y156.447 E.01592
N1937 G1 X190.559 Y124.946 E1.32866
N1938 G1 X190.559 Y124.412 E.01592
N1939 G1 X159.058 Y155.913 E1.32866
N1940 G1 X159.058 Y155.379 E.01592
N1941 G1 X190.454 Y123.984 E1.32421
N1942 G1 X189.92 Y123.984 E.01592
N1943 G1 X159.058 Y154.845 E1.30169
N1944 G1 X159.058 Y154.311 E.01592
N1945 G1 X189.386 Y123.984 E1.27917
N1946 G1 X188.852 Y123.984 E.01592
N1947 G1 X159.058 Y153.777 E1.25664
N1948 G1 X159.058 Y153.243 E.01592
N1949 G1 X188.318 Y123.984 E1.23412
N1950 G1 X187.784 Y123.984 E.01592
N1951 G1 X159.058 Y152.709 E1.2116
N1952 G1 X159.058 Y152.175 E.01592
N1953 G1 X187.25 Y123.984 E1.18908
N1954 G1 X186.716 Y123.984 E.01592
N1955 G1 X159.058 Y151.641 E1.16656
N1956 G1 X159.058 Y151.107 E.01592
N1957 G1 X186.182 Y123.984 E1.14404
N1958 G1 X185.648 Y123.984 E.01592
N1959 G1 X159.058 Y150.573 E1.12152
N1960 G1 X159.058 Y150.039 E.01592
N1961 G1 X185.114 Y123.984 E1.099
N1962 G1 X184.58 Y123.984 E.01593
N1963 G1 X159.058 Y149.506 E1.07648
N1964 G1 X159.058 Y148.972 E.01592
N1965 G1 X184.046 Y123.984 E1.05395
N1966 G1 X183.512 Y123.984 E.01592
N1967 G1 X159.058 Y148.438 E1.03143
N1968 G1 X159.058 Y147.904 E.01592
N1969 G1 X182.978 Y123.984 E1.00891
N1970 G1 X182.445 Y123.984 E.01592
N1971 G1 X159.058 Y147.37 E.98639
N1972 G1 X159.058 Y146.836 E.01592
N1973 G1 X181.911 Y123.984 E.96387
N1974 G1 X181.377 Y123.984 E.01592
N1975 G1 X159.058 Y146.302 E.94135
N1976 G1 X159.058 Y145.768 E.01592
N1977 G1 X180.843 Y123.984 E.91883
N1978 G1 X180.309 Y123.983 E.01592
N1979 G1 X159.058 Y145.234 E.89631
N1980 G1 X159.058 Y144.7 E.01592
N1981 G1 X179.775 Y123.983 E.87379
N1982 G1 X179.241 Y123.983 E.01592
N1983 G1 X159.058 Y144.166 E.85126
N1984 G1 X159.058 Y143.632 E.01592
N1985 G1 X178.707 Y123.983 E.82874
N1986 G1 X178.173 Y123.983 E.01592
N1987 G1 X159.058 Y143.098 E.80622
N1988 G1 X159.058 Y142.564 E.01592
N1989 G1 X177.639 Y123.983 E.7837
N1990 G1 X177.105 Y123.983 E.01592
N1991 G1 X159.058 Y142.03 E.76118
N1992 G1 X159.058 Y141.496 E.01593
N1993 G1 X176.571 Y123.983 E.73866
N1994 G1 X176.037 Y123.983 E.01592
N1995 G1 X159.058 Y140.962 E.71614
N1996 G1 X159.058 Y140.428 E.01592
N1997 G1 X175.503 Y123.983 E.69362
N1998 G1 X174.969 Y123.983 E.01592
N1999 G1 X159.058 Y139.894 E.6711
N2000 G1 X159.058 Y139.36 E.01592
N2001 G1 X174.435 Y123.984 E.64857
N2002 G1 X173.901 Y123.984 E.01592
N2003 G1 X159.058 Y138.827 E.62605
N2004 G1 X159.058 Y138.293 E.01592
N2005 G1 X173.367 Y123.984 E.60353
N2006 G1 X172.833 Y123.984 E.01592
N2007 G1 X159.058 Y137.759 E.58101
N2008 G1 X159.058 Y137.225 E.01592
N2009 G1 X172.299 Y123.984 E.55849
N2010 G1 X171.766 Y123.984 E.01592
N2011 G1 X159.058 Y136.691 E.53597
N2012 G1 X159.058 Y136.157 E.01592
N2013 G1 X171.232 Y123.984 E.51345
N2014 G1 X170.698 Y123.984 E.01592
N2015 M73 P37 R20
N2016 G1 X159.058 Y135.623 E.49093
N2017 G1 X159.058 Y135.089 E.01592
N2018 G1 X170.164 Y123.984 E.46841
N2019 G1 X169.63 Y123.984 E.01592
N2020 G1 X159.058 Y134.555 E.44588
N2021 G1 X159.058 Y134.021 E.01592
N2022 G1 X169.096 Y123.984 E.42336
N2023 G1 X168.562 Y123.984 E.01592
N2024 G1 X159.058 Y133.487 E.40084
N2025 G1 X159.058 Y132.953 E.01592
N2026 G1 X168.028 Y123.984 E.37832
N2027 G1 X167.494 Y123.984 E.01592
N2028 G1 X159.058 Y132.419 E.3558
N2029 G1 X159.058 Y131.885 E.01592
N2030 G1 X166.96 Y123.984 E.33328
N2031 G1 X166.426 Y123.984 E.01592
N2032 G1 X159.058 Y131.351 E.31076
N2033 G1 X159.058 Y130.817 E.01592
N2034 G1 X165.892 Y123.984 E.28824
N2035 G1 X165.358 Y123.984 E.01592
N2036 G1 X159.058 Y130.283 E.26572
N2037 G1 X159.058 Y129.749 E.01592
N2038 G1 X164.824 Y123.984 E.24319
N2039 G1 X164.29 Y123.984 E.01592
N2040 G1 X159.058 Y129.215 E.22067
N2041 G1 X159.058 Y128.681 E.01592
N2042 G1 X163.756 Y123.984 E.19815
N2043 G1 X163.222 Y123.984 E.01592
N2044 G1 X159.058 Y128.148 E.17563
N2045 G1 X159.058 Y127.614 E.01592
N2046 G1 X162.688 Y123.984 E.15311
N2047 G1 X162.154 Y123.984 E.01592
N2048 G1 X159.058 Y127.08 E.13059
N2049 G1 X159.058 Y126.546 E.01592
N2050 G1 X161.62 Y123.984 E.10807
N2051 G1 X161.087 Y123.984 E.01592
N2052 G1 X159.058 Y126.012 E.08555
N2053 G1 X159.058 Y125.478 E.01592
N2054 G1 X160.553 Y123.984 E.06303
N2055 G1 X160.019 Y123.984 E.01592
N2056 G1 X159.058 Y124.944 E.0405
N2057 G1 X159.058 Y124.41 E.01592
N2058 G1 X159.654 Y123.814 E.02514
N2059 ; WIPE_START
N2060 G1 X159.058 Y124.41 E-.32032
N2061 G1 X159.058 Y124.944 E-.2029
N2062 G1 X159.499 Y124.503 E-.23678
N2063 ; WIPE_END
N2064 G1 E-.04 F1800
N2065 M204 S10000
N2066 G17
N2067 G3 Z.8 I1.217 J0 P1  F60000
N2068 ; stop printing object, unique label id: 79
N2069 M625
N2070 ; object ids of layer 2 start: 79
N2071 M624 AQAAAAAAAAA=
N2072 ;======== H2D 20250213========
N2073 ; SKIPPABLE_START
N2074 ; SKIPTYPE: timelapse
N2075 M622.1 S1 ; for prev firware, default turned on
N2076 
N2077 M1002 judge_flag timelapse_record_flag
N2078 
N2079 M622 J1
N2080 M993 A2 B2 C2
N2081 M993 A0 B0 C0
N2082 
N2083 
N2084 M9712 E1 M0
N2085 M83
N2086 G1 Z0.8 F1200
N2087 M400
N2088 M9713
N2089 
N2090 
N2091 M9711 M0 E1 Z0.8 S11 C10 O0 T3000
N2092 
N2093 
N2094 M9712 E1 M0
N2095 G90
N2096 G1 Z3.4
N2097 G1 Y295 F30000
N2098 G1 Y265 F18000
N2099 M83
N2100 M9713
N2101 
N2102 M993 A3 B3 C3
N2103 
N2104 M623
N2105 ; SKIPPABLE_END
N2106 
N2107 ; object ids of this layer2 end: 79
N2108 M625
N2109 ; CHANGE_LAYER
N2110 ; Z_HEIGHT: 0.6
N2111 ; LAYER_HEIGHT: 0.2
N2112 ;======== H2D 20250521========
N2113 ; layer num/total_layer_count: 3/63
N2114 ; update layer progress
N2115 M73 L3
N2116 M991 S0 P2 ;notify layer change
N2117 
N2118 
N2119 ; OBJECT_ID: 79
N2120 ; COOLING_NODE: 0
N2121 ; start printing object, unique label id: 79
N2122 M624 AQAAAAAAAAA=
N2123 G1 X190.893 Y197.252 F60000
N2124 G1 Z.6
N2125 G1 E.8 F1800
N2126 ; FEATURE: Inner wall
N2127 ; LINE_WIDTH: 0.45
N2128 G1 F8475
N2129 M204 S8000
N2130 G1 X158.725 Y197.252 E1.03439
N2131 M73 P38 R20
N2132 G1 X158.725 Y123.65 E2.36678
N2133 G1 X190.893 Y123.65 E1.03439
N2134 G1 X190.893 Y197.192 E2.36485
N2135 ; COOLING_NODE: 0
N2136 M204 S10000
N2137 G1 X191.3 Y197.659 F60000
N2138 G1 F8475
N2139 M204 S8000
N2140 G1 X158.318 Y197.659 E1.06057
N2141 G1 X158.318 Y123.243 E2.39296
N2142 G1 X191.3 Y123.243 E1.06057
N2143 G1 X191.3 Y197.599 E2.39103
N2144 ; COOLING_NODE: 0
N2145 M204 S10000
N2146 G1 X191.707 Y198.067 F60000
N2147 G1 F8475
N2148 M204 S8000
N2149 G1 X157.911 Y198.067 E1.08675
N2150 G1 X157.911 Y122.836 E2.41914
N2151 G1 X191.707 Y122.836 E1.08675
N2152 G1 X191.707 Y198.007 E2.41721
N2153 ; COOLING_NODE: 0
N2154 M204 S10000
N2155 G1 X192.099 Y198.459 F60000
N2156 ; FEATURE: Outer wall
N2157 ; LINE_WIDTH: 0.42
N2158 G1 F9149.261
N2159 M204 S5000
N2160 G1 X157.519 Y198.459 E1.03002
N2161 G1 X157.519 Y122.444 E2.26421
N2162 G1 X192.099 Y122.444 E1.03002
N2163 G1 X192.099 Y198.399 E2.26243
N2164 G1 E-.8 F1800
N2165 M204 S10000
N2166 G1 X184.481 Y197.923 Z1 F60000
N2167 G1 X158.889 Y196.323 Z1
N2168 G1 Z.6
N2169 G1 E.8 F1800
N2170 ; FEATURE: Internal solid infill
N2171 ; LINE_WIDTH: 0.42048
N2172 G1 F9137.621
N2173 M204 S8000
N2174 G1 X159.485 Y196.919 E.02514
N2175 G1 X160.019 Y196.919 E.01592
N2176 G1 X159.058 Y195.959 E.0405
N2177 G1 X159.058 Y195.425 E.01592
N2178 G1 X160.553 Y196.919 E.06303
N2179 G1 X161.087 Y196.919 E.01592
N2180 G1 X159.058 Y194.891 E.08555
N2181 G1 X159.058 Y194.357 E.01592
N2182 G1 X161.62 Y196.919 E.10807
N2183 G1 X162.154 Y196.919 E.01592
N2184 G1 X159.058 Y193.823 E.13059
N2185 G1 X159.058 Y193.289 E.01593
N2186 G1 X162.688 Y196.919 E.15311
N2187 G1 X163.222 Y196.919 E.01592
N2188 G1 X159.058 Y192.755 E.17563
N2189 G1 X159.058 Y192.221 E.01592
N2190 G1 X163.756 Y196.919 E.19815
N2191 G1 X164.29 Y196.919 E.01592
N2192 G1 X159.058 Y191.687 E.22067
N2193 G1 X159.058 Y191.153 E.01592
N2194 G1 X164.824 Y196.919 E.24319
N2195 G1 X165.358 Y196.919 E.01592
N2196 G1 X159.058 Y190.619 E.26572
N2197 G1 X159.058 Y190.085 E.01592
N2198 G1 X165.892 Y196.919 E.28824
N2199 G1 X166.426 Y196.919 E.01593
N2200 G1 X159.058 Y189.551 E.31076
N2201 G1 X159.058 Y189.017 E.01592
N2202 G1 X166.96 Y196.919 E.33328
N2203 G1 X167.494 Y196.919 E.01592
N2204 G1 X159.058 Y188.483 E.3558
N2205 G1 X159.058 Y187.95 E.01592
N2206 G1 X168.028 Y196.919 E.37832
N2207 G1 X168.562 Y196.919 E.01592
N2208 G1 X159.058 Y187.416 E.40084
N2209 G1 X159.058 Y186.882 E.01592
N2210 G1 X169.096 Y196.919 E.42336
N2211 G1 X169.63 Y196.919 E.01592
N2212 G1 X159.058 Y186.348 E.44588
N2213 G1 X159.058 Y185.814 E.01592
N2214 G1 X170.164 Y196.919 E.46841
N2215 G1 X170.698 Y196.919 E.01592
N2216 G1 X159.058 Y185.28 E.49093
N2217 G1 X159.058 Y184.746 E.01592
N2218 G1 X171.232 Y196.919 E.51345
N2219 G1 X171.766 Y196.919 E.01592
N2220 G1 X159.058 Y184.212 E.53597
N2221 G1 X159.058 Y183.678 E.01592
N2222 G1 X172.299 Y196.919 E.55849
N2223 G1 X172.833 Y196.919 E.01592
N2224 G1 X159.058 Y183.144 E.58101
N2225 G1 X159.058 Y182.61 E.01592
N2226 G1 X173.367 Y196.919 E.60353
N2227 G1 X173.901 Y196.919 E.01592
N2228 G1 X159.058 Y182.076 E.62605
N2229 G1 X159.058 Y181.542 E.01592
N2230 G1 X174.435 Y196.919 E.64857
N2231 G1 X174.969 Y196.919 E.01592
N2232 G1 X159.058 Y181.008 E.6711
N2233 G1 X159.058 Y180.474 E.01592
N2234 G1 X175.503 Y196.919 E.69362
N2235 G1 X176.037 Y196.919 E.01592
N2236 G1 X159.058 Y179.94 E.71614
N2237 G1 X159.058 Y179.406 E.01592
N2238 G1 X176.571 Y196.919 E.73866
N2239 G1 X177.105 Y196.919 E.01592
N2240 G1 X159.058 Y178.872 E.76118
N2241 G1 X159.058 Y178.338 E.01592
N2242 G1 X177.639 Y196.919 E.7837
N2243 G1 X178.173 Y196.919 E.01592
N2244 G1 X159.058 Y177.804 E.80622
N2245 G1 X159.058 Y177.271 E.01592
N2246 G1 X178.707 Y196.919 E.82874
N2247 G1 X179.241 Y196.919 E.01592
N2248 G1 X159.058 Y176.737 E.85126
N2249 G1 X159.058 Y176.203 E.01592
N2250 G1 X179.775 Y196.919 E.87379
N2251 G1 X180.309 Y196.919 E.01592
N2252 G1 X159.058 Y175.669 E.89631
N2253 G1 X159.058 Y175.135 E.01592
N2254 G1 X180.843 Y196.919 E.91883
N2255 G1 X181.377 Y196.919 E.01592
N2256 G1 X159.058 Y174.601 E.94135
N2257 G1 X159.058 Y174.067 E.01592
N2258 G1 X181.911 Y196.919 E.96387
N2259 G1 X182.445 Y196.919 E.01592
N2260 G1 X159.058 Y173.533 E.98639
N2261 G1 X159.058 Y172.999 E.01592
N2262 G1 X182.978 Y196.919 E1.00891
N2263 G1 X183.512 Y196.919 E.01592
N2264 G1 X159.058 Y172.465 E1.03143
N2265 G1 X159.058 Y171.931 E.01592
N2266 G1 X184.046 Y196.919 E1.05395
N2267 G1 X184.58 Y196.919 E.01592
N2268 G1 X159.058 Y171.397 E1.07648
N2269 G1 X159.058 Y170.863 E.01593
N2270 G1 X185.114 Y196.919 E1.099
N2271 G1 X185.648 Y196.919 E.01592
N2272 G1 X159.058 Y170.329 E1.12152
N2273 G1 X159.058 Y169.795 E.01592
N2274 G1 X186.182 Y196.919 E1.14404
N2275 G1 X186.716 Y196.919 E.01592
N2276 G1 X159.058 Y169.261 E1.16656
N2277 G1 X159.058 Y168.727 E.01592
N2278 G1 X187.25 Y196.919 E1.18908
N2279 G1 X187.784 Y196.919 E.01592
N2280 G1 X159.058 Y168.193 E1.2116
N2281 G1 X159.058 Y167.659 E.01592
N2282 G1 X188.318 Y196.919 E1.23412
N2283 G1 X188.852 Y196.919 E.01593
N2284 G1 X159.058 Y167.125 E1.25664
N2285 G1 X159.058 Y166.592 E.01592
N2286 G1 X189.386 Y196.919 E1.27917
N2287 G1 X189.92 Y196.919 E.01592
N2288 G1 X159.058 Y166.058 E1.30169
N2289 G1 X159.058 Y165.524 E.01592
N2290 G1 X190.454 Y196.919 E1.32421
N2291 G1 X190.559 Y196.919 E.00315
N2292 G1 X190.559 Y196.491 E.01278
N2293 G1 X159.058 Y164.99 E1.32866
N2294 G1 X159.058 Y164.456 E.01592
N2295 G1 X190.559 Y195.957 E1.32866
N2296 G1 X190.559 Y195.423 E.01592
N2297 G1 X159.058 Y163.922 E1.32866
N2298 G1 X159.058 Y163.388 E.01592
N2299 G1 X190.559 Y194.889 E1.32866
N2300 G1 X190.559 Y194.355 E.01592
N2301 G1 X159.058 Y162.854 E1.32866
N2302 G1 X159.058 Y162.32 E.01592
N2303 G1 X190.559 Y193.821 E1.32866
N2304 G1 X190.559 Y193.287 E.01592
N2305 G1 X159.058 Y161.786 E1.32866
N2306 G1 X159.058 Y161.252 E.01592
N2307 G1 X190.559 Y192.753 E1.32866
N2308 G1 X190.559 Y192.219 E.01592
N2309 G1 X159.058 Y160.718 E1.32866
N2310 G1 X159.058 Y160.184 E.01592
N2311 G1 X190.559 Y191.685 E1.32866
N2312 G1 X190.559 Y191.151 E.01592
N2313 G1 X159.058 Y159.65 E1.32866
N2314 G1 X159.058 Y159.116 E.01592
N2315 M73 P39 R20
N2316 G1 X190.559 Y190.617 E1.32866
N2317 G1 X190.559 Y190.083 E.01592
N2318 G1 X159.058 Y158.582 E1.32866
N2319 G1 X159.058 Y158.048 E.01592
N2320 G1 X190.559 Y189.549 E1.32866
N2321 G1 X190.559 Y189.015 E.01592
N2322 G1 X159.058 Y157.514 E1.32866
N2323 G1 X159.058 Y156.98 E.01592
N2324 G1 X190.559 Y188.482 E1.32866
N2325 G1 X190.559 Y187.948 E.01592
N2326 G1 X159.058 Y156.446 E1.32866
N2327 G1 X159.058 Y155.913 E.01592
N2328 G1 X190.559 Y187.414 E1.32866
N2329 G1 X190.559 Y186.88 E.01592
N2330 G1 X159.058 Y155.379 E1.32866
N2331 G1 X159.058 Y154.845 E.01592
N2332 G1 X190.559 Y186.346 E1.32866
N2333 G1 X190.559 Y185.812 E.01592
N2334 G1 X159.058 Y154.311 E1.32866
N2335 G1 X159.058 Y153.777 E.01592
N2336 G1 X190.559 Y185.278 E1.32866
N2337 G1 X190.559 Y184.744 E.01592
N2338 G1 X159.058 Y153.243 E1.32866
N2339 G1 X159.058 Y152.709 E.01592
N2340 G1 X190.559 Y184.21 E1.32866
N2341 G1 X190.559 Y183.676 E.01592
N2342 G1 X159.058 Y152.175 E1.32866
N2343 G1 X159.058 Y151.641 E.01592
N2344 G1 X190.559 Y183.142 E1.32866
N2345 G1 X190.559 Y182.608 E.01592
N2346 G1 X159.058 Y151.107 E1.32866
N2347 G1 X159.058 Y150.573 E.01592
N2348 G1 X190.559 Y182.074 E1.32866
N2349 G1 X190.559 Y181.54 E.01592
N2350 G1 X159.058 Y150.039 E1.32866
N2351 G1 X159.058 Y149.505 E.01592
N2352 G1 X190.559 Y181.006 E1.32866
N2353 G1 X190.559 Y180.472 E.01592
N2354 G1 X159.058 Y148.971 E1.32866
N2355 G1 X159.058 Y148.437 E.01592
N2356 G1 X190.559 Y179.938 E1.32866
N2357 G1 X190.559 Y179.404 E.01592
N2358 G1 X159.058 Y147.903 E1.32866
N2359 G1 X159.058 Y147.369 E.01592
N2360 G1 X190.559 Y178.87 E1.32866
N2361 G1 X190.559 Y178.336 E.01592
N2362 G1 X159.058 Y146.835 E1.32866
N2363 G1 X159.058 Y146.301 E.01592
N2364 G1 X190.559 Y177.802 E1.32866
N2365 G1 X190.559 Y177.269 E.01592
N2366 G1 X159.058 Y145.767 E1.32866
N2367 G1 X159.058 Y145.234 E.01592
N2368 G1 X190.559 Y176.735 E1.32866
N2369 G1 X190.559 Y176.201 E.01592
N2370 G1 X159.058 Y144.7 E1.32866
N2371 G1 X159.058 Y144.166 E.01592
N2372 G1 X190.559 Y175.667 E1.32866
N2373 G1 X190.559 Y175.133 E.01593
N2374 G1 X159.058 Y143.632 E1.32866
N2375 G1 X159.058 Y143.098 E.01592
N2376 G1 X190.559 Y174.599 E1.32866
N2377 G1 X190.559 Y174.065 E.01592
N2378 G1 X159.058 Y142.564 E1.32866
N2379 G1 X159.058 Y142.03 E.01592
N2380 G1 X190.559 Y173.531 E1.32866
N2381 G1 X190.559 Y172.997 E.01592
N2382 G1 X159.058 Y141.496 E1.32866
N2383 G1 X159.058 Y140.962 E.01592
N2384 G1 X190.559 Y172.463 E1.32866
N2385 G1 X190.559 Y171.929 E.01592
N2386 G1 X159.058 Y140.428 E1.32866
N2387 G1 X159.058 Y139.894 E.01592
N2388 G1 X190.559 Y171.395 E1.32866
N2389 G1 X190.559 Y170.861 E.01592
N2390 G1 X159.058 Y139.36 E1.32866
N2391 G1 X159.058 Y138.826 E.01592
N2392 G1 X190.559 Y170.327 E1.32866
N2393 G1 X190.559 Y169.793 E.01592
N2394 G1 X159.058 Y138.292 E1.32866
N2395 G1 X159.058 Y137.758 E.01592
N2396 G1 X190.559 Y169.259 E1.32866
N2397 G1 X190.559 Y168.725 E.01592
N2398 G1 X159.058 Y137.224 E1.32866
N2399 G1 X159.058 Y136.69 E.01593
N2400 G1 X190.559 Y168.191 E1.32866
N2401 G1 X190.559 Y167.657 E.01592
N2402 G1 X159.058 Y136.156 E1.32866
N2403 G1 X159.058 Y135.622 E.01592
N2404 G1 X190.559 Y167.123 E1.32866
N2405 G1 X190.559 Y166.59 E.01592
N2406 G1 X159.058 Y135.088 E1.32866
N2407 G1 X159.058 Y134.554 E.01592
N2408 G1 X190.559 Y166.056 E1.32866
N2409 G1 X190.559 Y165.522 E.01592
N2410 G1 X159.058 Y134.021 E1.32866
N2411 G1 X159.058 Y133.487 E.01592
N2412 G1 X190.559 Y164.988 E1.32866
N2413 G1 X190.559 Y164.454 E.01592
N2414 G1 X159.058 Y132.953 E1.32866
N2415 G1 X159.058 Y132.419 E.01592
N2416 G1 X190.559 Y163.92 E1.32866
N2417 G1 X190.559 Y163.386 E.01592
N2418 G1 X159.058 Y131.885 E1.32866
N2419 G1 X159.058 Y131.351 E.01592
N2420 G1 X190.559 Y162.852 E1.32866
N2421 G1 X190.559 Y162.318 E.01592
N2422 G1 X159.058 Y130.817 E1.32866
N2423 G1 X159.058 Y130.283 E.01592
N2424 G1 X190.559 Y161.784 E1.32866
N2425 G1 X190.559 Y161.25 E.01592
N2426 G1 X159.058 Y129.749 E1.32866
N2427 G1 X159.058 Y129.215 E.01592
N2428 G1 X190.559 Y160.716 E1.32866
N2429 G1 X190.559 Y160.182 E.01592
N2430 G1 X159.058 Y128.681 E1.32866
N2431 G1 X159.058 Y128.147 E.01592
N2432 G1 X190.559 Y159.648 E1.32866
N2433 G1 X190.559 Y159.114 E.01592
N2434 G1 X159.058 Y127.613 E1.32866
N2435 G1 X159.058 Y127.079 E.01592
N2436 G1 X190.559 Y158.58 E1.32866
N2437 G1 X190.559 Y158.046 E.01592
N2438 G1 X159.058 Y126.545 E1.32866
N2439 G1 X159.058 Y126.011 E.01592
N2440 M73 P40 R20
N2441 G1 X190.559 Y157.512 E1.32866
N2442 G1 X190.559 Y156.978 E.01592
N2443 G1 X159.058 Y125.477 E1.32866
N2444 G1 X159.058 Y124.943 E.01592
N2445 G1 X190.559 Y156.444 E1.32866
N2446 G1 X190.559 Y155.911 E.01592
N2447 G1 X159.058 Y124.409 E1.32866
N2448 G1 X159.058 Y123.984 E.0127
N2449 G1 X159.166 Y123.984 E.00322
N2450 G1 X190.559 Y155.377 E1.3241
N2451 G1 X190.559 Y154.843 E.01592
N2452 G1 X159.7 Y123.984 E1.30158
N2453 G1 X160.234 Y123.984 E.01592
N2454 G1 X190.559 Y154.309 E1.27906
N2455 G1 X190.559 Y153.775 E.01592
N2456 G1 X160.768 Y123.984 E1.25654
N2457 G1 X161.302 Y123.984 E.01592
N2458 G1 X190.559 Y153.241 E1.23402
N2459 G1 X190.559 Y152.707 E.01593
N2460 G1 X161.836 Y123.984 E1.2115
N2461 G1 X162.37 Y123.984 E.01592
N2462 G1 X190.559 Y152.173 E1.18898
N2463 G1 X190.559 Y151.639 E.01592
N2464 G1 X162.904 Y123.984 E1.16646
N2465 G1 X163.438 Y123.984 E.01592
N2466 G1 X190.559 Y151.105 E1.14394
N2467 G1 X190.559 Y150.571 E.01592
N2468 G1 X163.972 Y123.984 E1.12141
N2469 G1 X164.506 Y123.984 E.01592
N2470 G1 X190.559 Y150.037 E1.09889
N2471 G1 X190.559 Y149.503 E.01592
N2472 G1 X165.04 Y123.984 E1.07637
N2473 G1 X165.574 Y123.984 E.01592
N2474 G1 X190.559 Y148.969 E1.05385
N2475 G1 X190.559 Y148.435 E.01592
N2476 G1 X166.108 Y123.984 E1.03133
N2477 G1 X166.642 Y123.984 E.01592
N2478 G1 X190.559 Y147.901 E1.00881
N2479 G1 X190.559 Y147.367 E.01592
N2480 G1 X167.176 Y123.984 E.98629
N2481 G1 X167.71 Y123.984 E.01592
N2482 G1 X190.559 Y146.833 E.96377
N2483 G1 X190.559 Y146.299 E.01592
N2484 G1 X168.243 Y123.984 E.94125
N2485 G1 X168.777 Y123.984 E.01592
N2486 G1 X190.559 Y145.765 E.91873
N2487 G1 X190.559 Y145.232 E.01592
N2488 G1 X169.311 Y123.984 E.8962
N2489 G1 X169.845 Y123.984 E.01593
N2490 G1 X190.559 Y144.698 E.87368
N2491 G1 X190.559 Y144.164 E.01592
N2492 G1 X170.379 Y123.984 E.85116
N2493 G1 X170.913 Y123.984 E.01592
N2494 G1 X190.559 Y143.63 E.82864
N2495 G1 X190.559 Y143.096 E.01592
N2496 G1 X171.447 Y123.984 E.80612
N2497 G1 X171.981 Y123.984 E.01592
N2498 G1 X190.559 Y142.562 E.7836
N2499 G1 X190.559 Y142.028 E.01592
N2500 G1 X172.515 Y123.984 E.76108
N2501 G1 X173.049 Y123.984 E.01592
N2502 G1 X190.559 Y141.494 E.73856
N2503 G1 X190.559 Y140.96 E.01593
N2504 G1 X173.583 Y123.984 E.71603
N2505 G1 X174.117 Y123.984 E.01592
N2506 G1 X190.559 Y140.426 E.69351
N2507 G1 X190.559 Y139.892 E.01592
N2508 G1 X174.651 Y123.984 E.67099
N2509 G1 X175.185 Y123.984 E.01592
N2510 G1 X190.559 Y139.358 E.64847
N2511 G1 X190.559 Y138.824 E.01592
N2512 G1 X175.719 Y123.984 E.62595
N2513 G1 X176.253 Y123.984 E.01592
N2514 G1 X190.559 Y138.29 E.60343
N2515 G1 X190.559 Y137.756 E.01592
N2516 G1 X176.787 Y123.984 E.58091
N2517 G1 X177.321 Y123.984 E.01592
N2518 G1 X190.559 Y137.222 E.55839
N2519 G1 X190.559 Y136.688 E.01592
N2520 G1 X177.855 Y123.984 E.53587
N2521 G1 X178.389 Y123.984 E.01592
N2522 G1 X190.559 Y136.154 E.51335
N2523 G1 X190.559 Y135.62 E.01592
N2524 G1 X178.922 Y123.984 E.49082
N2525 G1 X179.456 Y123.984 E.01592
N2526 G1 X190.559 Y135.086 E.4683
N2527 G1 X190.559 Y134.553 E.01592
N2528 G1 X179.99 Y123.984 E.44578
N2529 G1 X180.524 Y123.984 E.01592
N2530 G1 X190.559 Y134.019 E.42326
N2531 G1 X190.559 Y133.485 E.01592
N2532 G1 X181.058 Y123.984 E.40074
N2533 G1 X181.592 Y123.984 E.01592
N2534 G1 X190.559 Y132.951 E.37822
N2535 G1 X190.559 Y132.417 E.01592
N2536 G1 X182.126 Y123.984 E.3557
N2537 G1 X182.66 Y123.984 E.01592
N2538 G1 X190.559 Y131.883 E.33318
N2539 G1 X190.559 Y131.349 E.01592
N2540 G1 X183.194 Y123.984 E.31066
N2541 G1 X183.728 Y123.984 E.01592
N2542 G1 X190.559 Y130.815 E.28813
N2543 G1 X190.559 Y130.281 E.01592
N2544 G1 X184.262 Y123.984 E.26561
N2545 G1 X184.796 Y123.984 E.01592
N2546 G1 X190.559 Y129.747 E.24309
N2547 G1 X190.559 Y129.213 E.01592
N2548 G1 X185.33 Y123.984 E.22057
N2549 G1 X185.864 Y123.984 E.01592
N2550 G1 X190.559 Y128.679 E.19805
N2551 G1 X190.559 Y128.145 E.01592
N2552 G1 X186.398 Y123.984 E.17553
N2553 G1 X186.932 Y123.984 E.01592
N2554 G1 X190.559 Y127.611 E.15301
N2555 G1 X190.559 Y127.077 E.01592
N2556 G1 X187.466 Y123.984 E.13049
N2557 G1 X188 Y123.984 E.01592
N2558 G1 X190.559 Y126.543 E.10797
N2559 G1 X190.559 Y126.009 E.01592
N2560 G1 X188.534 Y123.984 E.08544
N2561 G1 X189.068 Y123.984 E.01592
N2562 G1 X190.559 Y125.475 E.06292
N2563 G1 X190.559 Y124.941 E.01592
N2564 G1 X189.601 Y123.984 E.0404
N2565 G1 X190.135 Y123.984 E.01592
N2566 G1 X190.729 Y124.577 E.02504
N2567 ; WIPE_START
N2568 G1 X190.135 Y123.984 E-.31901
N2569 G1 X189.601 Y123.984 E-.2029
N2570 G1 X190.045 Y124.427 E-.23809
N2571 ; WIPE_END
N2572 G1 E-.04 F1800
N2573 M204 S10000
N2574 G17
N2575 G3 Z1 I1.217 J0 P1  F60000
N2576 ; stop printing object, unique label id: 79
N2577 M625
N2578 ; object ids of layer 3 start: 79
N2579 M624 AQAAAAAAAAA=
N2580 ;======== H2D 20250213========
N2581 ; SKIPPABLE_START
N2582 ; SKIPTYPE: timelapse
N2583 M622.1 S1 ; for prev firware, default turned on
N2584 
N2585 M1002 judge_flag timelapse_record_flag
N2586 
N2587 M622 J1
N2588 M993 A2 B2 C2
N2589 M993 A0 B0 C0
N2590 
N2591 
N2592 M9712 E1 M0
N2593 M83
N2594 G1 Z1 F1200
N2595 M400
N2596 M9713
N2597 
N2598 
N2599 M9711 M0 E1 Z1 S11 C10 O0 T3000
N2600 
N2601 
N2602 M9712 E1 M0
N2603 G90
N2604 G1 Z3.6
N2605 G1 Y295 F30000
N2606 G1 Y265 F18000
N2607 M83
N2608 M9713
N2609 
N2610 M993 A3 B3 C3
N2611 
N2612 M623
N2613 ; SKIPPABLE_END
N2614 
N2615 ; object ids of this layer3 end: 79
N2616 M625
N2617 ; CHANGE_LAYER
N2618 ; Z_HEIGHT: 0.8
N2619 ; LAYER_HEIGHT: 0.2
N2620 ;======== H2D 20250521========
N2621 ; layer num/total_layer_count: 4/63
N2622 ; update layer progress
N2623 M73 L4
N2624 M991 S0 P3 ;notify layer change
N2625 
N2626 
N2627 M106 S73.95
N2628 ; OBJECT_ID: 79
N2629 ; COOLING_NODE: 0
N2630 ; start printing object, unique label id: 79
N2631 M624 AQAAAAAAAAA=
N2632 G1 X190.893 Y197.252 F60000
N2633 G1 Z.8
N2634 G1 E.8 F1800
N2635 ; FEATURE: Inner wall
N2636 ; LINE_WIDTH: 0.45
N2637 G1 F8475
N2638 M204 S8000
N2639 G1 X158.725 Y197.252 E1.03439
N2640 G1 X158.725 Y123.65 E2.36678
N2641 G1 X190.893 Y123.65 E1.03439
N2642 G1 X190.893 Y197.192 E2.36485
N2643 ; COOLING_NODE: 0
N2644 M204 S10000
N2645 G1 X191.3 Y197.659 F60000
N2646 G1 F8475
N2647 M204 S8000
N2648 G1 X158.318 Y197.659 E1.06057
N2649 G1 X158.318 Y123.243 E2.39296
N2650 G1 X191.3 Y123.243 E1.06057
N2651 G1 X191.3 Y197.599 E2.39103
N2652 ; COOLING_NODE: 0
N2653 M204 S10000
N2654 G1 X191.707 Y198.067 F60000
N2655 G1 F8475
N2656 M204 S8000
N2657 G1 X157.911 Y198.067 E1.08675
N2658 M73 P40 R19
N2659 G1 X157.911 Y122.836 E2.41914
N2660 G1 X191.707 Y122.836 E1.08675
N2661 G1 X191.707 Y198.007 E2.41721
N2662 ; COOLING_NODE: 0
N2663 M204 S10000
N2664 G1 X192.099 Y198.459 F60000
N2665 ; FEATURE: Outer wall
N2666 ; LINE_WIDTH: 0.42
N2667 G1 F9149.261
N2668 M204 S5000
N2669 G1 X157.519 Y198.459 E1.03002
N2670 G1 X157.519 Y122.444 E2.26421
N2671 G1 X192.099 Y122.444 E1.03002
N2672 G1 X192.099 Y198.399 E2.26243
N2673 G1 E-.8 F1800
N2674 M204 S10000
N2675 G1 X188.067 Y197.087 Z1.2 F60000
N2676 G1 Z.8
N2677 G1 E.8 F1800
N2678 ; FEATURE: Sparse infill
N2679 ; LINE_WIDTH: 0.45
N2680 G1 F8475
N2681 M204 S8000
N2682 G1 X190.544 Y194.609 E.11268
N2683 G1 X190.544 Y190.772 E.12342
N2684 G1 X184.412 Y196.904 E.27889
N2685 G1 X180.574 Y196.904 E.12342
N2686 G1 X190.544 Y186.934 E.45342
N2687 G1 X190.544 Y183.096 E.12342
N2688 G1 X176.736 Y196.904 E.62796
N2689 G1 X172.898 Y196.904 E.12342
N2690 G1 X190.544 Y179.258 E.80249
N2691 M73 P41 R19
N2692 G1 X190.544 Y175.42 E.12342
N2693 G1 X169.06 Y196.904 E.97703
N2694 G1 X165.222 Y196.904 E.12342
N2695 G1 X190.544 Y171.582 E1.15157
N2696 G1 X190.544 Y167.744 E.12342
N2697 G1 X161.384 Y196.904 E1.3261
N2698 G1 X159.073 Y196.904 E.0743
N2699 G1 X159.073 Y195.377 E.04912
N2700 G1 X190.544 Y163.906 E1.43118
N2701 G1 X190.544 Y160.068 E.12342
N2702 G1 X159.073 Y191.539 E1.43118
N2703 G1 X159.073 Y187.701 E.12342
N2704 G1 X190.544 Y156.23 E1.43118
N2705 G1 X190.544 Y152.392 E.12342
N2706 G1 X159.073 Y183.863 E1.43118
N2707 G1 X159.073 Y180.025 E.12342
N2708 G1 X190.544 Y148.554 E1.43118
N2709 G1 X190.544 Y144.716 E.12342
N2710 G1 X159.073 Y176.187 E1.43118
N2711 G1 X159.073 Y172.349 E.12342
N2712 G1 X190.544 Y140.878 E1.43118
N2713 G1 X190.544 Y137.04 E.12342
N2714 G1 X159.073 Y168.511 E1.43118
N2715 G1 X159.073 Y164.673 E.12342
N2716 G1 X190.544 Y133.202 E1.43118
N2717 G1 X190.544 Y129.364 E.12342
N2718 G1 X159.073 Y160.835 E1.43118
N2719 G1 X159.073 Y156.997 E.12342
N2720 G1 X190.544 Y125.526 E1.43118
N2721 G1 X190.544 Y123.999 E.04912
N2722 G1 X188.234 Y123.999 E.0743
N2723 G1 X159.073 Y153.159 E1.3261
N2724 G1 X159.073 Y149.321 E.12342
N2725 G1 X184.396 Y123.999 E1.15157
N2726 G1 X180.558 Y123.999 E.12342
N2727 G1 X159.073 Y145.483 E.97703
N2728 G1 X159.073 Y141.645 E.12342
N2729 G1 X176.72 Y123.999 E.80249
N2730 G1 X172.882 Y123.999 E.12342
N2731 G1 X159.073 Y137.807 E.62796
N2732 G1 X159.073 Y133.969 E.12342
N2733 G1 X169.044 Y123.999 E.45342
N2734 G1 X165.206 Y123.999 E.12342
N2735 G1 X159.073 Y130.131 E.27889
N2736 G1 X159.073 Y126.293 E.12342
N2737 G1 X161.551 Y123.815 E.11268
N2738 ; WIPE_START
N2739 G1 X160.137 Y125.23 E-.76
N2740 ; WIPE_END
N2741 G1 E-.04 F1800
N2742 M204 S10000
N2743 G17
N2744 G3 Z1.2 I1.217 J0 P1  F60000
N2745 ; stop printing object, unique label id: 79
N2746 M625
N2747 ; object ids of layer 4 start: 79
N2748 M624 AQAAAAAAAAA=
N2749 ;======== H2D 20250213========
N2750 ; SKIPPABLE_START
N2751 ; SKIPTYPE: timelapse
N2752 M622.1 S1 ; for prev firware, default turned on
N2753 
N2754 M1002 judge_flag timelapse_record_flag
N2755 
N2756 M622 J1
N2757 M993 A2 B2 C2
N2758 M993 A0 B0 C0
N2759 
N2760 
N2761 M9712 E1 M0
N2762 M83
N2763 G1 Z1.2 F1200
N2764 M400
N2765 M9713
N2766 
N2767 
N2768 M9711 M0 E1 Z1.2 S11 C10 O0 T3000
N2769 
N2770 
N2771 M9712 E1 M0
N2772 G90
N2773 G1 Z3.8
N2774 G1 Y295 F30000
N2775 G1 Y265 F18000
N2776 M83
N2777 M9713
N2778 
N2779 M993 A3 B3 C3
N2780 
N2781 M623
N2782 ; SKIPPABLE_END
N2783 
N2784 ; object ids of this layer4 end: 79
N2785 M625
N2786 ; CHANGE_LAYER
N2787 ; Z_HEIGHT: 1
N2788 ; LAYER_HEIGHT: 0.2
N2789 ;======== H2D 20250521========
N2790 ; layer num/total_layer_count: 5/63
N2791 ; update layer progress
N2792 M73 L5
N2793 M991 S0 P4 ;notify layer change
N2794 
N2795 
N2796 M106 S71.4
N2797 ; OBJECT_ID: 79
N2798 ; COOLING_NODE: 0
N2799 ; start printing object, unique label id: 79
N2800 M624 AQAAAAAAAAA=
N2801 G1 X190.893 Y197.252 F60000
N2802 G1 Z1
N2803 G1 E.8 F1800
N2804 ; FEATURE: Inner wall
N2805 G1 F8475
N2806 M204 S8000
N2807 G1 X158.725 Y197.252 E1.03439
N2808 G1 X158.725 Y123.65 E2.36678
N2809 G1 X190.893 Y123.65 E1.03439
N2810 G1 X190.893 Y197.192 E2.36485
N2811 ; COOLING_NODE: 0
N2812 M204 S10000
N2813 G1 X191.3 Y197.659 F60000
N2814 G1 F8475
N2815 M204 S8000
N2816 G1 X158.318 Y197.659 E1.06057
N2817 G1 X158.318 Y123.243 E2.39296
N2818 G1 X191.3 Y123.243 E1.06057
N2819 G1 X191.3 Y197.599 E2.39103
N2820 ; COOLING_NODE: 0
N2821 M204 S10000
N2822 G1 X191.707 Y198.067 F60000
N2823 G1 F8475
N2824 M204 S8000
N2825 G1 X157.911 Y198.067 E1.08675
N2826 G1 X157.911 Y122.836 E2.41914
N2827 G1 X191.707 Y122.836 E1.08675
N2828 G1 X191.707 Y198.007 E2.41721
N2829 ; COOLING_NODE: 0
N2830 M204 S10000
N2831 G1 X192.099 Y198.459 F60000
N2832 ; FEATURE: Outer wall
N2833 ; LINE_WIDTH: 0.42
N2834 G1 F9149.261
N2835 M204 S5000
N2836 G1 X157.519 Y198.459 E1.03002
N2837 G1 X157.519 Y122.444 E2.26421
N2838 G1 X192.099 Y122.444 E1.03002
N2839 G1 X192.099 Y198.399 E2.26243
N2840 G1 E-.8 F1800
N2841 M204 S10000
N2842 G1 X184.52 Y197.492 Z1.4 F60000
N2843 G1 X158.89 Y194.426 Z1.4
N2844 G1 Z1
N2845 G1 E.8 F1800
N2846 ; FEATURE: Sparse infill
N2847 ; LINE_WIDTH: 0.45
N2848 G1 F8475
N2849 M204 S8000
N2850 G1 X161.368 Y196.904 E.11268
N2851 G1 X165.206 Y196.904 E.12342
N2852 G1 X159.073 Y190.772 E.27889
N2853 G1 X159.073 Y186.934 E.12342
N2854 G1 X169.044 Y196.904 E.45342
N2855 G1 X172.882 Y196.904 E.12342
N2856 G1 X159.073 Y183.096 E.62796
N2857 G1 X159.073 Y179.258 E.12342
N2858 G1 X176.72 Y196.904 E.80249
N2859 G1 X180.558 Y196.904 E.12342
N2860 G1 X159.073 Y175.42 E.97703
N2861 G1 X159.073 Y171.582 E.12342
N2862 G1 X184.396 Y196.904 E1.15157
N2863 G1 X188.234 Y196.904 E.12342
N2864 G1 X159.073 Y167.744 E1.3261
N2865 G1 X159.073 Y163.906 E.12342
N2866 G1 X190.544 Y195.377 E1.43118
N2867 G1 X190.544 Y191.539 E.12342
N2868 G1 X159.073 Y160.068 E1.43118
N2869 G1 X159.073 Y156.23 E.12342
N2870 G1 X190.544 Y187.701 E1.43118
N2871 G1 X190.544 Y183.863 E.12342
N2872 G1 X159.073 Y152.392 E1.43118
N2873 G1 X159.073 Y148.554 E.12342
N2874 G1 X190.544 Y180.025 E1.43118
N2875 G1 X190.544 Y176.187 E.12342
N2876 G1 X159.073 Y144.716 E1.43118
N2877 G1 X159.073 Y140.878 E.12342
N2878 G1 X190.544 Y172.349 E1.43118
N2879 G1 X190.544 Y168.511 E.12342
N2880 G1 X159.073 Y137.04 E1.43118
N2881 G1 X159.073 Y133.202 E.12342
N2882 G1 X190.544 Y164.673 E1.43118
N2883 G1 X190.544 Y160.835 E.12342
N2884 G1 X159.073 Y129.364 E1.43118
N2885 G1 X159.073 Y125.526 E.12342
N2886 G1 X190.544 Y156.997 E1.43118
N2887 G1 X190.544 Y153.159 E.12342
N2888 M73 P42 R19
N2889 G1 X161.384 Y123.999 E1.3261
N2890 G1 X165.222 Y123.999 E.12342
N2891 G1 X190.544 Y149.321 E1.15157
N2892 G1 X190.544 Y145.483 E.12342
N2893 G1 X169.06 Y123.999 E.97703
N2894 G1 X172.898 Y123.999 E.12342
N2895 G1 X190.544 Y141.645 E.80249
N2896 G1 X190.544 Y137.807 E.12342
N2897 G1 X176.736 Y123.999 E.62796
N2898 G1 X180.574 Y123.999 E.12342
N2899 G1 X190.544 Y133.969 E.45342
N2900 G1 X190.544 Y130.131 E.12342
N2901 G1 X184.412 Y123.999 E.27889
N2902 G1 X188.25 Y123.999 E.12342
N2903 G1 X190.728 Y126.476 E.11268
N2904 ; WIPE_START
N2905 G1 X189.313 Y125.062 E-.76
N2906 ; WIPE_END
N2907 G1 E-.04 F1800
N2908 M204 S10000
N2909 G17
N2910 G3 Z1.4 I1.217 J0 P1  F60000
N2911 ; stop printing object, unique label id: 79
N2912 M625
N2913 ; object ids of layer 5 start: 79
N2914 M624 AQAAAAAAAAA=
N2915 ;======== H2D 20250213========
N2916 ; SKIPPABLE_START
N2917 ; SKIPTYPE: timelapse
N2918 M622.1 S1 ; for prev firware, default turned on
N2919 
N2920 M1002 judge_flag timelapse_record_flag
N2921 
N2922 M622 J1
N2923 M993 A2 B2 C2
N2924 M993 A0 B0 C0
N2925 
N2926 
N2927 M9712 E1 M0
N2928 M83
N2929 G1 Z1.4 F1200
N2930 M400
N2931 M9713
N2932 
N2933 
N2934 M9711 M0 E1 Z1.4 S11 C10 O0 T3000
N2935 
N2936 
N2937 M9712 E1 M0
N2938 G90
N2939 G1 Z4
N2940 G1 Y295 F30000
N2941 G1 Y265 F18000
N2942 M83
N2943 M9713
N2944 
N2945 M993 A3 B3 C3
N2946 
N2947 M623
N2948 ; SKIPPABLE_END
N2949 
N2950 ; object ids of this layer5 end: 79
N2951 M625
N2952 ; CHANGE_LAYER
N2953 ; Z_HEIGHT: 1.2
N2954 ; LAYER_HEIGHT: 0.2
N2955 ;======== H2D 20250521========
N2956 ; layer num/total_layer_count: 6/63
N2957 ; update layer progress
N2958 M73 L6
N2959 M991 S0 P5 ;notify layer change
N2960 
N2961 
N2962 M106 S73.95
N2963 ; OBJECT_ID: 79
N2964 ; COOLING_NODE: 0
N2965 ; start printing object, unique label id: 79
N2966 M624 AQAAAAAAAAA=
N2967 G1 X190.893 Y197.252 F60000
N2968 G1 Z1.2
N2969 G1 E.8 F1800
N2970 ; FEATURE: Inner wall
N2971 G1 F8475
N2972 M204 S8000
N2973 G1 X158.725 Y197.252 E1.03439
N2974 G1 X158.725 Y123.65 E2.36678
N2975 G1 X190.893 Y123.65 E1.03439
N2976 G1 X190.893 Y197.192 E2.36485
N2977 ; COOLING_NODE: 0
N2978 M204 S10000
N2979 G1 X191.3 Y197.659 F60000
N2980 G1 F8475
N2981 M204 S8000
N2982 G1 X158.318 Y197.659 E1.06057
N2983 G1 X158.318 Y123.243 E2.39296
N2984 G1 X191.3 Y123.243 E1.06057
N2985 G1 X191.3 Y197.599 E2.39103
N2986 ; COOLING_NODE: 0
N2987 M204 S10000
N2988 G1 X191.707 Y198.067 F60000
N2989 G1 F8475
N2990 M204 S8000
N2991 G1 X157.911 Y198.067 E1.08675
N2992 G1 X157.911 Y122.836 E2.41914
N2993 G1 X191.707 Y122.836 E1.08675
N2994 G1 X191.707 Y198.007 E2.41721
N2995 ; COOLING_NODE: 0
N2996 M204 S10000
N2997 G1 X192.099 Y198.459 F60000
N2998 ; FEATURE: Outer wall
N2999 ; LINE_WIDTH: 0.42
N3000 G1 F9149.261
N3001 M204 S5000
N3002 G1 X157.519 Y198.459 E1.03002
N3003 G1 X157.519 Y122.444 E2.26421
N3004 G1 X192.099 Y122.444 E1.03002
N3005 G1 X192.099 Y198.399 E2.26243
N3006 G1 E-.8 F1800
N3007 M204 S10000
N3008 G1 X188.067 Y197.087 Z1.6 F60000
N3009 G1 Z1.2
N3010 G1 E.8 F1800
N3011 ; FEATURE: Sparse infill
N3012 ; LINE_WIDTH: 0.45
N3013 G1 F8475
N3014 M204 S8000
N3015 G1 X190.544 Y194.609 E.11268
N3016 G1 X190.544 Y190.772 E.12342
N3017 G1 X184.412 Y196.904 E.27889
N3018 G1 X180.574 Y196.904 E.12342
N3019 G1 X190.544 Y186.934 E.45342
N3020 G1 X190.544 Y183.096 E.12342
N3021 G1 X176.736 Y196.904 E.62796
N3022 G1 X172.898 Y196.904 E.12342
N3023 G1 X190.544 Y179.258 E.80249
N3024 G1 X190.544 Y175.42 E.12342
N3025 G1 X169.06 Y196.904 E.97703
N3026 G1 X165.222 Y196.904 E.12342
N3027 G1 X190.544 Y171.582 E1.15157
N3028 G1 X190.544 Y167.744 E.12342
N3029 G1 X161.384 Y196.904 E1.3261
N3030 G1 X159.073 Y196.904 E.0743
N3031 G1 X159.073 Y195.377 E.04912
N3032 G1 X190.544 Y163.906 E1.43118
N3033 G1 X190.544 Y160.068 E.12342
N3034 G1 X159.073 Y191.539 E1.43118
N3035 G1 X159.073 Y187.701 E.12342
N3036 G1 X190.544 Y156.23 E1.43118
N3037 G1 X190.544 Y152.392 E.12342
N3038 G1 X159.073 Y183.863 E1.43118
N3039 G1 X159.073 Y180.025 E.12342
N3040 G1 X190.544 Y148.554 E1.43118
N3041 G1 X190.544 Y144.716 E.12342
N3042 G1 X159.073 Y176.187 E1.43118
N3043 G1 X159.073 Y172.349 E.12342
N3044 G1 X190.544 Y140.878 E1.43118
N3045 G1 X190.544 Y137.04 E.12342
N3046 G1 X159.073 Y168.511 E1.43118
N3047 G1 X159.073 Y164.673 E.12342
N3048 G1 X190.544 Y133.202 E1.43118
N3049 G1 X190.544 Y129.364 E.12342
N3050 G1 X159.073 Y160.835 E1.43118
N3051 G1 X159.073 Y156.997 E.12342
N3052 G1 X190.544 Y125.526 E1.43118
N3053 G1 X190.544 Y123.999 E.04912
N3054 G1 X188.234 Y123.999 E.0743
N3055 G1 X159.073 Y153.159 E1.3261
N3056 G1 X159.073 Y149.321 E.12342
N3057 G1 X184.396 Y123.999 E1.15157
N3058 G1 X180.558 Y123.999 E.12342
N3059 G1 X159.073 Y145.483 E.97703
N3060 G1 X159.073 Y141.645 E.12342
N3061 G1 X176.72 Y123.999 E.80249
N3062 G1 X172.882 Y123.999 E.12342
N3063 G1 X159.073 Y137.807 E.62796
N3064 G1 X159.073 Y133.969 E.12342
N3065 G1 X169.044 Y123.999 E.45342
N3066 G1 X165.206 Y123.999 E.12342
N3067 G1 X159.073 Y130.131 E.27889
N3068 G1 X159.073 Y126.293 E.12342
N3069 G1 X161.551 Y123.815 E.11268
N3070 ; WIPE_START
N3071 G1 X160.137 Y125.23 E-.76
N3072 ; WIPE_END
N3073 G1 E-.04 F1800
N3074 M204 S10000
N3075 G17
N3076 G3 Z1.6 I1.217 J0 P1  F60000
N3077 ; stop printing object, unique label id: 79
N3078 M625
N3079 ; object ids of layer 6 start: 79
N3080 M624 AQAAAAAAAAA=
N3081 ;======== H2D 20250213========
N3082 ; SKIPPABLE_START
N3083 ; SKIPTYPE: timelapse
N3084 M622.1 S1 ; for prev firware, default turned on
N3085 
N3086 M1002 judge_flag timelapse_record_flag
N3087 
N3088 M622 J1
N3089 M993 A2 B2 C2
N3090 M993 A0 B0 C0
N3091 
N3092 
N3093 M9712 E1 M0
N3094 M83
N3095 G1 Z1.6 F1200
N3096 M400
N3097 M9713
N3098 
N3099 
N3100 M9711 M0 E1 Z1.6 S11 C10 O0 T3000
N3101 
N3102 
N3103 M9712 E1 M0
N3104 G90
N3105 G1 Z4.2
N3106 G1 Y295 F30000
N3107 G1 Y265 F18000
N3108 M83
N3109 M9713
N3110 
N3111 M993 A3 B3 C3
N3112 
N3113 M623
N3114 ; SKIPPABLE_END
N3115 
N3116 ; object ids of this layer6 end: 79
N3117 M625
N3118 ; CHANGE_LAYER
N3119 ; Z_HEIGHT: 1.4
N3120 ; LAYER_HEIGHT: 0.2
N3121 ;======== H2D 20250521========
N3122 ; layer num/total_layer_count: 7/63
N3123 ; update layer progress
N3124 M73 L7
N3125 M991 S0 P6 ;notify layer change
N3126 
N3127 
N3128 M106 S71.4
N3129 ; OBJECT_ID: 79
N3130 ; COOLING_NODE: 0
N3131 ; start printing object, unique label id: 79
N3132 M624 AQAAAAAAAAA=
N3133 G1 X190.893 Y197.252 F60000
N3134 G1 Z1.4
N3135 G1 E.8 F1800
N3136 ; FEATURE: Inner wall
N3137 G1 F8475
N3138 M204 S8000
N3139 G1 X158.725 Y197.252 E1.03439
N3140 G1 X158.725 Y123.65 E2.36678
N3141 G1 X190.893 Y123.65 E1.03439
N3142 G1 X190.893 Y197.192 E2.36485
N3143 ; COOLING_NODE: 0
N3144 M204 S10000
N3145 G1 X191.3 Y197.659 F60000
N3146 G1 F8475
N3147 M204 S8000
N3148 G1 X158.318 Y197.659 E1.06057
N3149 G1 X158.318 Y123.243 E2.39296
N3150 G1 X191.3 Y123.243 E1.06057
N3151 G1 X191.3 Y197.599 E2.39103
N3152 ; COOLING_NODE: 0
N3153 M204 S10000
N3154 M73 P43 R19
N3155 G1 X191.707 Y198.067 F60000
N3156 G1 F8475
N3157 M204 S8000
N3158 G1 X157.911 Y198.067 E1.08675
N3159 G1 X157.911 Y122.836 E2.41914
N3160 G1 X191.707 Y122.836 E1.08675
N3161 G1 X191.707 Y198.007 E2.41721
N3162 ; COOLING_NODE: 0
N3163 M204 S10000
N3164 G1 X192.099 Y198.459 F60000
N3165 ; FEATURE: Outer wall
N3166 ; LINE_WIDTH: 0.42
N3167 G1 F9149.261
N3168 M204 S5000
N3169 G1 X157.519 Y198.459 E1.03002
N3170 G1 X157.519 Y122.444 E2.26421
N3171 G1 X192.099 Y122.444 E1.03002
N3172 G1 X192.099 Y198.399 E2.26243
N3173 G1 E-.8 F1800
N3174 M204 S10000
N3175 G1 X184.52 Y197.492 Z1.8 F60000
N3176 G1 X158.89 Y194.426 Z1.8
N3177 G1 Z1.4
N3178 G1 E.8 F1800
N3179 ; FEATURE: Sparse infill
N3180 ; LINE_WIDTH: 0.45
N3181 G1 F8475
N3182 M204 S8000
N3183 G1 X161.368 Y196.904 E.11268
N3184 G1 X165.206 Y196.904 E.12342
N3185 G1 X159.073 Y190.772 E.27889
N3186 G1 X159.073 Y186.934 E.12342
N3187 G1 X169.044 Y196.904 E.45342
N3188 G1 X172.882 Y196.904 E.12342
N3189 G1 X159.073 Y183.096 E.62796
N3190 G1 X159.073 Y179.258 E.12342
N3191 G1 X176.72 Y196.904 E.80249
N3192 G1 X180.558 Y196.904 E.12342
N3193 G1 X159.073 Y175.42 E.97703
N3194 G1 X159.073 Y171.582 E.12342
N3195 G1 X184.396 Y196.904 E1.15157
N3196 G1 X188.234 Y196.904 E.12342
N3197 G1 X159.073 Y167.744 E1.3261
N3198 G1 X159.073 Y163.906 E.12342
N3199 G1 X190.544 Y195.377 E1.43118
N3200 G1 X190.544 Y191.539 E.12342
N3201 G1 X159.073 Y160.068 E1.43118
N3202 G1 X159.073 Y156.23 E.12342
N3203 G1 X190.544 Y187.701 E1.43118
N3204 G1 X190.544 Y183.863 E.12342
N3205 G1 X159.073 Y152.392 E1.43118
N3206 G1 X159.073 Y148.554 E.12342
N3207 G1 X190.544 Y180.025 E1.43118
N3208 G1 X190.544 Y176.187 E.12342
N3209 G1 X159.073 Y144.716 E1.43118
N3210 G1 X159.073 Y140.878 E.12342
N3211 G1 X190.544 Y172.349 E1.43118
N3212 G1 X190.544 Y168.511 E.12342
N3213 G1 X159.073 Y137.04 E1.43118
N3214 G1 X159.073 Y133.202 E.12342
N3215 G1 X190.544 Y164.673 E1.43118
N3216 G1 X190.544 Y160.835 E.12342
N3217 G1 X159.073 Y129.364 E1.43118
N3218 G1 X159.073 Y125.526 E.12342
N3219 G1 X190.544 Y156.997 E1.43118
N3220 G1 X190.544 Y153.159 E.12342
N3221 G1 X161.384 Y123.999 E1.3261
N3222 G1 X165.222 Y123.999 E.12342
N3223 G1 X190.544 Y149.321 E1.15157
N3224 G1 X190.544 Y145.483 E.12342
N3225 G1 X169.06 Y123.999 E.97703
N3226 G1 X172.898 Y123.999 E.12342
N3227 G1 X190.544 Y141.645 E.80249
N3228 G1 X190.544 Y137.807 E.12342
N3229 G1 X176.736 Y123.999 E.62796
N3230 G1 X180.574 Y123.999 E.12342
N3231 G1 X190.544 Y133.969 E.45342
N3232 G1 X190.544 Y130.131 E.12342
N3233 G1 X184.412 Y123.999 E.27889
N3234 G1 X188.25 Y123.999 E.12342
N3235 G1 X190.728 Y126.476 E.11268
N3236 ; WIPE_START
N3237 G1 X189.313 Y125.062 E-.76
N3238 ; WIPE_END
N3239 G1 E-.04 F1800
N3240 M204 S10000
N3241 G17
N3242 G3 Z1.8 I1.217 J0 P1  F60000
N3243 ; stop printing object, unique label id: 79
N3244 M625
N3245 ; object ids of layer 7 start: 79
N3246 M624 AQAAAAAAAAA=
N3247 ;======== H2D 20250213========
N3248 ; SKIPPABLE_START
N3249 ; SKIPTYPE: timelapse
N3250 M622.1 S1 ; for prev firware, default turned on
N3251 
N3252 M1002 judge_flag timelapse_record_flag
N3253 
N3254 M622 J1
N3255 M993 A2 B2 C2
N3256 M993 A0 B0 C0
N3257 
N3258 
N3259 M9712 E1 M0
N3260 M83
N3261 G1 Z1.8 F1200
N3262 M400
N3263 M9713
N3264 
N3265 
N3266 M9711 M0 E1 Z1.8 S11 C10 O0 T3000
N3267 
N3268 
N3269 M9712 E1 M0
N3270 G90
N3271 G1 Z4.4
N3272 G1 Y295 F30000
N3273 G1 Y265 F18000
N3274 M83
N3275 M9713
N3276 
N3277 M993 A3 B3 C3
N3278 
N3279 M623
N3280 ; SKIPPABLE_END
N3281 
N3282 ; object ids of this layer7 end: 79
N3283 M625
N3284 ; CHANGE_LAYER
N3285 ; Z_HEIGHT: 1.6
N3286 ; LAYER_HEIGHT: 0.2
N3287 ;======== H2D 20250521========
N3288 ; layer num/total_layer_count: 8/63
N3289 ; update layer progress
N3290 M73 L8
N3291 M991 S0 P7 ;notify layer change
N3292 
N3293 
N3294 M106 S73.95
N3295 ; OBJECT_ID: 79
N3296 ; COOLING_NODE: 0
N3297 ; start printing object, unique label id: 79
N3298 M624 AQAAAAAAAAA=
N3299 G1 X190.893 Y197.252 F60000
N3300 G1 Z1.6
N3301 G1 E.8 F1800
N3302 ; FEATURE: Inner wall
N3303 G1 F8475
N3304 M204 S8000
N3305 G1 X158.725 Y197.252 E1.03439
N3306 G1 X158.725 Y123.65 E2.36678
N3307 G1 X190.893 Y123.65 E1.03439
N3308 G1 X190.893 Y197.192 E2.36485
N3309 ; COOLING_NODE: 0
N3310 M204 S10000
N3311 G1 X191.3 Y197.659 F60000
N3312 G1 F8475
N3313 M204 S8000
N3314 G1 X158.318 Y197.659 E1.06057
N3315 G1 X158.318 Y123.243 E2.39296
N3316 G1 X191.3 Y123.243 E1.06057
N3317 G1 X191.3 Y197.599 E2.39103
N3318 ; COOLING_NODE: 0
N3319 M204 S10000
N3320 G1 X191.707 Y198.067 F60000
N3321 M73 P43 R18
N3322 G1 F8475
N3323 M204 S8000
N3324 G1 X157.911 Y198.067 E1.08675
N3325 G1 X157.911 Y122.836 E2.41914
N3326 G1 X191.707 Y122.836 E1.08675
N3327 G1 X191.707 Y198.007 E2.41721
N3328 ; COOLING_NODE: 0
N3329 M204 S10000
N3330 G1 X192.099 Y198.459 F60000
N3331 ; FEATURE: Outer wall
N3332 ; LINE_WIDTH: 0.42
N3333 G1 F9149.261
N3334 M204 S5000
N3335 G1 X157.519 Y198.459 E1.03002
N3336 G1 X157.519 Y122.444 E2.26421
N3337 G1 X192.099 Y122.444 E1.03002
N3338 G1 X192.099 Y198.399 E2.26243
N3339 G1 E-.8 F1800
N3340 M204 S10000
N3341 G1 X188.067 Y197.087 Z2 F60000
N3342 G1 Z1.6
N3343 G1 E.8 F1800
N3344 ; FEATURE: Sparse infill
N3345 ; LINE_WIDTH: 0.45
N3346 G1 F8475
N3347 M204 S8000
N3348 G1 X190.544 Y194.609 E.11268
N3349 G1 X190.544 Y190.772 E.12342
N3350 G1 X184.412 Y196.904 E.27889
N3351 G1 X180.574 Y196.904 E.12342
N3352 G1 X190.544 Y186.934 E.45342
N3353 G1 X190.544 Y183.096 E.12342
N3354 G1 X176.736 Y196.904 E.62796
N3355 G1 X172.898 Y196.904 E.12342
N3356 M73 P44 R18
N3357 G1 X190.544 Y179.258 E.80249
N3358 G1 X190.544 Y175.42 E.12342
N3359 G1 X169.06 Y196.904 E.97703
N3360 G1 X165.222 Y196.904 E.12342
N3361 G1 X190.544 Y171.582 E1.15157
N3362 G1 X190.544 Y167.744 E.12342
N3363 G1 X161.384 Y196.904 E1.3261
N3364 G1 X159.073 Y196.904 E.0743
N3365 G1 X159.073 Y195.377 E.04912
N3366 G1 X190.544 Y163.906 E1.43118
N3367 G1 X190.544 Y160.068 E.12342
N3368 G1 X159.073 Y191.539 E1.43118
N3369 G1 X159.073 Y187.701 E.12342
N3370 G1 X190.544 Y156.23 E1.43118
N3371 G1 X190.544 Y152.392 E.12342
N3372 G1 X159.073 Y183.863 E1.43118
N3373 G1 X159.073 Y180.025 E.12342
N3374 G1 X190.544 Y148.554 E1.43118
N3375 G1 X190.544 Y144.716 E.12342
N3376 G1 X159.073 Y176.187 E1.43118
N3377 G1 X159.073 Y172.349 E.12342
N3378 G1 X190.544 Y140.878 E1.43118
N3379 G1 X190.544 Y137.04 E.12342
N3380 G1 X159.073 Y168.511 E1.43118
N3381 G1 X159.073 Y164.673 E.12342
N3382 G1 X190.544 Y133.202 E1.43118
N3383 G1 X190.544 Y129.364 E.12342
N3384 G1 X159.073 Y160.835 E1.43118
N3385 G1 X159.073 Y156.997 E.12342
N3386 G1 X190.544 Y125.526 E1.43118
N3387 G1 X190.544 Y123.999 E.04912
N3388 G1 X188.234 Y123.999 E.0743
N3389 G1 X159.073 Y153.159 E1.3261
N3390 G1 X159.073 Y149.321 E.12342
N3391 G1 X184.396 Y123.999 E1.15157
N3392 G1 X180.558 Y123.999 E.12342
N3393 G1 X159.073 Y145.483 E.97703
N3394 G1 X159.073 Y141.645 E.12342
N3395 G1 X176.72 Y123.999 E.80249
N3396 G1 X172.882 Y123.999 E.12342
N3397 G1 X159.073 Y137.807 E.62796
N3398 G1 X159.073 Y133.969 E.12342
N3399 G1 X169.044 Y123.999 E.45342
N3400 G1 X165.206 Y123.999 E.12342
N3401 G1 X159.073 Y130.131 E.27889
N3402 G1 X159.073 Y126.293 E.12342
N3403 G1 X161.551 Y123.815 E.11268
N3404 ; WIPE_START
N3405 G1 X160.137 Y125.23 E-.76
N3406 ; WIPE_END
N3407 G1 E-.04 F1800
N3408 M204 S10000
N3409 G17
N3410 G3 Z2 I1.217 J0 P1  F60000
N3411 ; stop printing object, unique label id: 79
N3412 M625
N3413 ; object ids of layer 8 start: 79
N3414 M624 AQAAAAAAAAA=
N3415 ;======== H2D 20250213========
N3416 ; SKIPPABLE_START
N3417 ; SKIPTYPE: timelapse
N3418 M622.1 S1 ; for prev firware, default turned on
N3419 
N3420 M1002 judge_flag timelapse_record_flag
N3421 
N3422 M622 J1
N3423 M993 A2 B2 C2
N3424 M993 A0 B0 C0
N3425 
N3426 
N3427 M9712 E1 M0
N3428 M83
N3429 G1 Z2 F1200
N3430 M400
N3431 M9713
N3432 
N3433 
N3434 M9711 M0 E1 Z2 S11 C10 O0 T3000
N3435 
N3436 
N3437 M9712 E1 M0
N3438 G90
N3439 G1 Z4.6
N3440 G1 Y295 F30000
N3441 G1 Y265 F18000
N3442 M83
N3443 M9713
N3444 
N3445 M993 A3 B3 C3
N3446 
N3447 M623
N3448 ; SKIPPABLE_END
N3449 
N3450 ; object ids of this layer8 end: 79
N3451 M625
N3452 ; CHANGE_LAYER
N3453 ; Z_HEIGHT: 1.8
N3454 ; LAYER_HEIGHT: 0.2
N3455 ;======== H2D 20250521========
N3456 ; layer num/total_layer_count: 9/63
N3457 ; update layer progress
N3458 M73 L9
N3459 M991 S0 P8 ;notify layer change
N3460 
N3461 
N3462 M106 S71.4
N3463 ; OBJECT_ID: 79
N3464 ; COOLING_NODE: 0
N3465 ; start printing object, unique label id: 79
N3466 M624 AQAAAAAAAAA=
N3467 G1 X190.893 Y197.252 F60000
N3468 G1 Z1.8
N3469 G1 E.8 F1800
N3470 ; FEATURE: Inner wall
N3471 G1 F8475
N3472 M204 S8000
N3473 G1 X158.725 Y197.252 E1.03439
N3474 G1 X158.725 Y123.65 E2.36678
N3475 G1 X190.893 Y123.65 E1.03439
N3476 G1 X190.893 Y197.192 E2.36485
N3477 ; COOLING_NODE: 0
N3478 M204 S10000
N3479 G1 X191.3 Y197.659 F60000
N3480 G1 F8475
N3481 M204 S8000
N3482 G1 X158.318 Y197.659 E1.06057
N3483 G1 X158.318 Y123.243 E2.39296
N3484 G1 X191.3 Y123.243 E1.06057
N3485 G1 X191.3 Y197.599 E2.39103
N3486 ; COOLING_NODE: 0
N3487 M204 S10000
N3488 G1 X191.707 Y198.067 F60000
N3489 G1 F8475
N3490 M204 S8000
N3491 G1 X157.911 Y198.067 E1.08675
N3492 G1 X157.911 Y122.836 E2.41914
N3493 G1 X191.707 Y122.836 E1.08675
N3494 G1 X191.707 Y198.007 E2.41721
N3495 ; COOLING_NODE: 0
N3496 M204 S10000
N3497 G1 X192.099 Y198.459 F60000
N3498 ; FEATURE: Outer wall
N3499 ; LINE_WIDTH: 0.42
N3500 G1 F9149.261
N3501 M204 S5000
N3502 G1 X157.519 Y198.459 E1.03002
N3503 G1 X157.519 Y122.444 E2.26421
N3504 G1 X192.099 Y122.444 E1.03002
N3505 G1 X192.099 Y198.399 E2.26243
N3506 G1 E-.8 F1800
N3507 M204 S10000
N3508 G1 X184.52 Y197.492 Z2.2 F60000
N3509 G1 X158.89 Y194.426 Z2.2
N3510 G1 Z1.8
N3511 G1 E.8 F1800
N3512 ; FEATURE: Sparse infill
N3513 ; LINE_WIDTH: 0.45
N3514 G1 F8475
N3515 M204 S8000
N3516 G1 X161.368 Y196.904 E.11268
N3517 G1 X165.206 Y196.904 E.12342
N3518 G1 X159.073 Y190.772 E.27889
N3519 G1 X159.073 Y186.934 E.12342
N3520 G1 X169.044 Y196.904 E.45342
N3521 G1 X172.882 Y196.904 E.12342
N3522 G1 X159.073 Y183.096 E.62796
N3523 G1 X159.073 Y179.258 E.12342
N3524 G1 X176.72 Y196.904 E.80249
N3525 G1 X180.558 Y196.904 E.12342
N3526 G1 X159.073 Y175.42 E.97703
N3527 G1 X159.073 Y171.582 E.12342
N3528 G1 X184.396 Y196.904 E1.15157
N3529 G1 X188.234 Y196.904 E.12342
N3530 G1 X159.073 Y167.744 E1.3261
N3531 G1 X159.073 Y163.906 E.12342
N3532 G1 X190.544 Y195.377 E1.43118
N3533 G1 X190.544 Y191.539 E.12342
N3534 G1 X159.073 Y160.068 E1.43118
N3535 G1 X159.073 Y156.23 E.12342
N3536 G1 X190.544 Y187.701 E1.43118
N3537 G1 X190.544 Y183.863 E.12342
N3538 G1 X159.073 Y152.392 E1.43118
N3539 G1 X159.073 Y148.554 E.12342
N3540 G1 X190.544 Y180.025 E1.43118
N3541 G1 X190.544 Y176.187 E.12342
N3542 G1 X159.073 Y144.716 E1.43118
N3543 G1 X159.073 Y140.878 E.12342
N3544 G1 X190.544 Y172.349 E1.43118
N3545 G1 X190.544 Y168.511 E.12342
N3546 G1 X159.073 Y137.04 E1.43118
N3547 G1 X159.073 Y133.202 E.12342
N3548 G1 X190.544 Y164.673 E1.43118
N3549 G1 X190.544 Y160.835 E.12342
N3550 G1 X159.073 Y129.364 E1.43118
N3551 G1 X159.073 Y125.526 E.12342
N3552 G1 X190.544 Y156.997 E1.43118
N3553 G1 X190.544 Y153.159 E.12342
N3554 M73 P45 R18
N3555 G1 X161.384 Y123.999 E1.3261
N3556 G1 X165.222 Y123.999 E.12342
N3557 G1 X190.544 Y149.321 E1.15157
N3558 G1 X190.544 Y145.483 E.12342
N3559 G1 X169.06 Y123.999 E.97703
N3560 G1 X172.898 Y123.999 E.12342
N3561 G1 X190.544 Y141.645 E.80249
N3562 G1 X190.544 Y137.807 E.12342
N3563 G1 X176.736 Y123.999 E.62796
N3564 G1 X180.574 Y123.999 E.12342
N3565 G1 X190.544 Y133.969 E.45342
N3566 G1 X190.544 Y130.131 E.12342
N3567 G1 X184.412 Y123.999 E.27889
N3568 G1 X188.25 Y123.999 E.12342
N3569 G1 X190.728 Y126.476 E.11268
N3570 ; WIPE_START
N3571 G1 X189.313 Y125.062 E-.76
N3572 ; WIPE_END
N3573 G1 E-.04 F1800
N3574 M204 S10000
N3575 G17
N3576 G3 Z2.2 I1.217 J0 P1  F60000
N3577 ; stop printing object, unique label id: 79
N3578 M625
N3579 ; object ids of layer 9 start: 79
N3580 M624 AQAAAAAAAAA=
N3581 ;======== H2D 20250213========
N3582 ; SKIPPABLE_START
N3583 ; SKIPTYPE: timelapse
N3584 M622.1 S1 ; for prev firware, default turned on
N3585 
N3586 M1002 judge_flag timelapse_record_flag
N3587 
N3588 M622 J1
N3589 M993 A2 B2 C2
N3590 M993 A0 B0 C0
N3591 
N3592 
N3593 M9712 E1 M0
N3594 M83
N3595 G1 Z2.2 F1200
N3596 M400
N3597 M9713
N3598 
N3599 
N3600 M9711 M0 E1 Z2.2 S11 C10 O0 T3000
N3601 
N3602 
N3603 M9712 E1 M0
N3604 G90
N3605 G1 Z4.8
N3606 G1 Y295 F30000
N3607 G1 Y265 F18000
N3608 M83
N3609 M9713
N3610 
N3611 M993 A3 B3 C3
N3612 
N3613 M623
N3614 ; SKIPPABLE_END
N3615 
N3616 ; object ids of this layer9 end: 79
N3617 M625
N3618 ; CHANGE_LAYER
N3619 ; Z_HEIGHT: 2
N3620 ; LAYER_HEIGHT: 0.2
N3621 ;======== H2D 20250521========
N3622 ; layer num/total_layer_count: 10/63
N3623 ; update layer progress
N3624 M73 L10
N3625 M991 S0 P9 ;notify layer change
N3626 
N3627 
N3628 M106 S73.95
N3629 ; OBJECT_ID: 79
N3630 ; COOLING_NODE: 0
N3631 ; start printing object, unique label id: 79
N3632 M624 AQAAAAAAAAA=
N3633 G1 X190.893 Y197.252 F60000
N3634 G1 Z2
N3635 G1 E.8 F1800
N3636 ; FEATURE: Inner wall
N3637 G1 F8475
N3638 M204 S8000
N3639 G1 X158.725 Y197.252 E1.03439
N3640 G1 X158.725 Y123.65 E2.36678
N3641 G1 X190.893 Y123.65 E1.03439
N3642 G1 X190.893 Y197.192 E2.36485
N3643 ; COOLING_NODE: 0
N3644 M204 S10000
N3645 G1 X191.3 Y197.659 F60000
N3646 G1 F8475
N3647 M204 S8000
N3648 G1 X158.318 Y197.659 E1.06057
N3649 G1 X158.318 Y123.243 E2.39296
N3650 G1 X191.3 Y123.243 E1.06057
N3651 G1 X191.3 Y197.599 E2.39103
N3652 ; COOLING_NODE: 0
N3653 M204 S10000
N3654 G1 X191.707 Y198.067 F60000
N3655 G1 F8475
N3656 M204 S8000
N3657 G1 X157.911 Y198.067 E1.08675
N3658 G1 X157.911 Y122.836 E2.41914
N3659 G1 X191.707 Y122.836 E1.08675
N3660 G1 X191.707 Y198.007 E2.41721
N3661 ; COOLING_NODE: 0
N3662 M204 S10000
N3663 G1 X192.099 Y198.459 F60000
N3664 ; FEATURE: Outer wall
N3665 ; LINE_WIDTH: 0.42
N3666 G1 F9149.261
N3667 M204 S5000
N3668 G1 X157.519 Y198.459 E1.03002
N3669 G1 X157.519 Y122.444 E2.26421
N3670 G1 X192.099 Y122.444 E1.03002
N3671 G1 X192.099 Y198.399 E2.26243
N3672 G1 E-.8 F1800
N3673 M204 S10000
N3674 G1 X188.067 Y197.087 Z2.4 F60000
N3675 G1 Z2
N3676 G1 E.8 F1800
N3677 ; FEATURE: Sparse infill
N3678 ; LINE_WIDTH: 0.45
N3679 G1 F8475
N3680 M204 S8000
N3681 G1 X190.544 Y194.609 E.11268
N3682 G1 X190.544 Y190.772 E.12342
N3683 G1 X184.412 Y196.904 E.27889
N3684 G1 X180.574 Y196.904 E.12342
N3685 G1 X190.544 Y186.934 E.45342
N3686 G1 X190.544 Y183.096 E.12342
N3687 G1 X176.736 Y196.904 E.62796
N3688 G1 X172.898 Y196.904 E.12342
N3689 G1 X190.544 Y179.258 E.80249
N3690 G1 X190.544 Y175.42 E.12342
N3691 G1 X169.06 Y196.904 E.97703
N3692 G1 X165.222 Y196.904 E.12342
N3693 G1 X190.544 Y171.582 E1.15157
N3694 G1 X190.544 Y167.744 E.12342
N3695 G1 X161.384 Y196.904 E1.3261
N3696 G1 X159.073 Y196.904 E.0743
N3697 G1 X159.073 Y195.377 E.04912
N3698 G1 X190.544 Y163.906 E1.43118
N3699 G1 X190.544 Y160.068 E.12342
N3700 G1 X159.073 Y191.539 E1.43118
N3701 G1 X159.073 Y187.701 E.12342
N3702 G1 X190.544 Y156.23 E1.43118
N3703 G1 X190.544 Y152.392 E.12342
N3704 G1 X159.073 Y183.863 E1.43118
N3705 G1 X159.073 Y180.025 E.12342
N3706 G1 X190.544 Y148.554 E1.43118
N3707 G1 X190.544 Y144.716 E.12342
N3708 G1 X159.073 Y176.187 E1.43118
N3709 G1 X159.073 Y172.349 E.12342
N3710 G1 X190.544 Y140.878 E1.43118
N3711 G1 X190.544 Y137.04 E.12342
N3712 G1 X159.073 Y168.511 E1.43118
N3713 G1 X159.073 Y164.673 E.12342
N3714 G1 X190.544 Y133.202 E1.43118
N3715 G1 X190.544 Y129.364 E.12342
N3716 G1 X159.073 Y160.835 E1.43118
N3717 G1 X159.073 Y156.997 E.12342
N3718 G1 X190.544 Y125.526 E1.43118
N3719 G1 X190.544 Y123.999 E.04912
N3720 G1 X188.234 Y123.999 E.0743
N3721 G1 X159.073 Y153.159 E1.3261
N3722 G1 X159.073 Y149.321 E.12342
N3723 G1 X184.396 Y123.999 E1.15157
N3724 G1 X180.558 Y123.999 E.12342
N3725 G1 X159.073 Y145.483 E.97703
N3726 G1 X159.073 Y141.645 E.12342
N3727 G1 X176.72 Y123.999 E.80249
N3728 G1 X172.882 Y123.999 E.12342
N3729 G1 X159.073 Y137.807 E.62796
N3730 G1 X159.073 Y133.969 E.12342
N3731 G1 X169.044 Y123.999 E.45342
N3732 G1 X165.206 Y123.999 E.12342
N3733 G1 X159.073 Y130.131 E.27889
N3734 G1 X159.073 Y126.293 E.12342
N3735 G1 X161.551 Y123.815 E.11268
N3736 ; WIPE_START
N3737 G1 X160.137 Y125.23 E-.76
N3738 ; WIPE_END
N3739 G1 E-.04 F1800
N3740 M204 S10000
N3741 G17
N3742 G3 Z2.4 I1.217 J0 P1  F60000
N3743 ; stop printing object, unique label id: 79
N3744 M625
N3745 ; object ids of layer 10 start: 79
N3746 M624 AQAAAAAAAAA=
N3747 ;======== H2D 20250213========
N3748 ; SKIPPABLE_START
N3749 ; SKIPTYPE: timelapse
N3750 M622.1 S1 ; for prev firware, default turned on
N3751 
N3752 M1002 judge_flag timelapse_record_flag
N3753 
N3754 M622 J1
N3755 M993 A2 B2 C2
N3756 M993 A0 B0 C0
N3757 
N3758 
N3759 M9712 E1 M0
N3760 M83
N3761 G1 Z2.4 F1200
N3762 M400
N3763 M9713
N3764 
N3765 
N3766 M9711 M0 E1 Z2.4 S11 C10 O0 T3000
N3767 
N3768 
N3769 M9712 E1 M0
N3770 G90
N3771 G1 Z5
N3772 G1 Y295 F30000
N3773 G1 Y265 F18000
N3774 M83
N3775 M9713
N3776 
N3777 M993 A3 B3 C3
N3778 
N3779 M623
N3780 ; SKIPPABLE_END
N3781 
N3782 ; object ids of this layer10 end: 79
N3783 M625
N3784 ; CHANGE_LAYER
N3785 ; Z_HEIGHT: 2.2
N3786 ; LAYER_HEIGHT: 0.2
N3787 ;======== H2D 20250521========
N3788 ; layer num/total_layer_count: 11/63
N3789 ; update layer progress
N3790 M73 L11
N3791 M991 S0 P10 ;notify layer change
N3792 
N3793 
N3794 M106 S71.4
N3795 ; OBJECT_ID: 79
N3796 ; COOLING_NODE: 0
N3797 ; start printing object, unique label id: 79
N3798 M624 AQAAAAAAAAA=
N3799 G1 X190.893 Y197.252 F60000
N3800 G1 Z2.2
N3801 G1 E.8 F1800
N3802 ; FEATURE: Inner wall
N3803 G1 F8475
N3804 M204 S8000
N3805 G1 X158.725 Y197.252 E1.03439
N3806 G1 X158.725 Y123.65 E2.36678
N3807 G1 X190.893 Y123.65 E1.03439
N3808 G1 X190.893 Y197.192 E2.36485
N3809 ; COOLING_NODE: 0
N3810 M204 S10000
N3811 G1 X191.3 Y197.659 F60000
N3812 G1 F8475
N3813 M204 S8000
N3814 G1 X158.318 Y197.659 E1.06057
N3815 G1 X158.318 Y123.243 E2.39296
N3816 G1 X191.3 Y123.243 E1.06057
N3817 G1 X191.3 Y197.599 E2.39103
N3818 ; COOLING_NODE: 0
N3819 M204 S10000
N3820 M73 P46 R18
N3821 G1 X191.707 Y198.067 F60000
N3822 G1 F8475
N3823 M204 S8000
N3824 G1 X157.911 Y198.067 E1.08675
N3825 G1 X157.911 Y122.836 E2.41914
N3826 G1 X191.707 Y122.836 E1.08675
N3827 G1 X191.707 Y198.007 E2.41721
N3828 ; COOLING_NODE: 0
N3829 M204 S10000
N3830 G1 X192.099 Y198.459 F60000
N3831 ; FEATURE: Outer wall
N3832 ; LINE_WIDTH: 0.42
N3833 G1 F9149.261
N3834 M204 S5000
N3835 G1 X157.519 Y198.459 E1.03002
N3836 G1 X157.519 Y122.444 E2.26421
N3837 G1 X192.099 Y122.444 E1.03002
N3838 G1 X192.099 Y198.399 E2.26243
N3839 G1 E-.8 F1800
N3840 M204 S10000
N3841 G1 X184.52 Y197.492 Z2.6 F60000
N3842 G1 X158.89 Y194.426 Z2.6
N3843 G1 Z2.2
N3844 G1 E.8 F1800
N3845 ; FEATURE: Sparse infill
N3846 ; LINE_WIDTH: 0.45
N3847 G1 F8475
N3848 M204 S8000
N3849 G1 X161.368 Y196.904 E.11268
N3850 G1 X165.206 Y196.904 E.12342
N3851 G1 X159.073 Y190.772 E.27889
N3852 G1 X159.073 Y186.934 E.12342
N3853 G1 X169.044 Y196.904 E.45342
N3854 G1 X172.882 Y196.904 E.12342
N3855 G1 X159.073 Y183.096 E.62796
N3856 G1 X159.073 Y179.258 E.12342
N3857 G1 X176.72 Y196.904 E.80249
N3858 G1 X180.558 Y196.904 E.12342
N3859 G1 X159.073 Y175.42 E.97703
N3860 G1 X159.073 Y171.582 E.12342
N3861 G1 X184.396 Y196.904 E1.15157
N3862 G1 X188.234 Y196.904 E.12342
N3863 G1 X159.073 Y167.744 E1.3261
N3864 G1 X159.073 Y163.906 E.12342
N3865 G1 X190.544 Y195.377 E1.43118
N3866 G1 X190.544 Y191.539 E.12342
N3867 G1 X159.073 Y160.068 E1.43118
N3868 G1 X159.073 Y156.23 E.12342
N3869 G1 X190.544 Y187.701 E1.43118
N3870 G1 X190.544 Y183.863 E.12342
N3871 G1 X159.073 Y152.392 E1.43118
N3872 G1 X159.073 Y148.554 E.12342
N3873 G1 X190.544 Y180.025 E1.43118
N3874 G1 X190.544 Y176.187 E.12342
N3875 G1 X159.073 Y144.716 E1.43118
N3876 G1 X159.073 Y140.878 E.12342
N3877 G1 X190.544 Y172.349 E1.43118
N3878 G1 X190.544 Y168.511 E.12342
N3879 G1 X159.073 Y137.04 E1.43118
N3880 G1 X159.073 Y133.202 E.12342
N3881 G1 X190.544 Y164.673 E1.43118
N3882 G1 X190.544 Y160.835 E.12342
N3883 G1 X159.073 Y129.364 E1.43118
N3884 G1 X159.073 Y125.526 E.12342
N3885 G1 X190.544 Y156.997 E1.43118
N3886 G1 X190.544 Y153.159 E.12342
N3887 G1 X161.384 Y123.999 E1.3261
N3888 G1 X165.222 Y123.999 E.12342
N3889 G1 X190.544 Y149.321 E1.15157
N3890 G1 X190.544 Y145.483 E.12342
N3891 G1 X169.06 Y123.999 E.97703
N3892 G1 X172.898 Y123.999 E.12342
N3893 G1 X190.544 Y141.645 E.80249
N3894 G1 X190.544 Y137.807 E.12342
N3895 G1 X176.736 Y123.999 E.62796
N3896 G1 X180.574 Y123.999 E.12342
N3897 G1 X190.544 Y133.969 E.45342
N3898 G1 X190.544 Y130.131 E.12342
N3899 G1 X184.412 Y123.999 E.27889
N3900 G1 X188.25 Y123.999 E.12342
N3901 G1 X190.728 Y126.476 E.11268
N3902 ; WIPE_START
N3903 G1 X189.313 Y125.062 E-.76
N3904 ; WIPE_END
N3905 G1 E-.04 F1800
N3906 M204 S10000
N3907 G17
N3908 G3 Z2.6 I1.217 J0 P1  F60000
N3909 ; stop printing object, unique label id: 79
N3910 M625
N3911 ; object ids of layer 11 start: 79
N3912 M624 AQAAAAAAAAA=
N3913 ;======== H2D 20250213========
N3914 ; SKIPPABLE_START
N3915 ; SKIPTYPE: timelapse
N3916 M622.1 S1 ; for prev firware, default turned on
N3917 
N3918 M1002 judge_flag timelapse_record_flag
N3919 
N3920 M622 J1
N3921 M993 A2 B2 C2
N3922 M993 A0 B0 C0
N3923 
N3924 
N3925 M9712 E1 M0
N3926 M83
N3927 G1 Z2.6 F1200
N3928 M400
N3929 M9713
N3930 
N3931 
N3932 M9711 M0 E1 Z2.6 S11 C10 O0 T3000
N3933 
N3934 
N3935 M9712 E1 M0
N3936 G90
N3937 G1 Z5.2
N3938 G1 Y295 F30000
N3939 G1 Y265 F18000
N3940 M83
N3941 M9713
N3942 
N3943 M993 A3 B3 C3
N3944 
N3945 M623
N3946 ; SKIPPABLE_END
N3947 
N3948 ; object ids of this layer11 end: 79
N3949 M625
N3950 ; CHANGE_LAYER
N3951 ; Z_HEIGHT: 2.4
N3952 ; LAYER_HEIGHT: 0.2
N3953 ;======== H2D 20250521========
N3954 ; layer num/total_layer_count: 12/63
N3955 ; update layer progress
N3956 M73 L12
N3957 M991 S0 P11 ;notify layer change
N3958 
N3959 
N3960 M106 S73.95
N3961 ; OBJECT_ID: 79
N3962 ; COOLING_NODE: 0
N3963 ; start printing object, unique label id: 79
N3964 M624 AQAAAAAAAAA=
N3965 G1 X190.893 Y197.252 F60000
N3966 G1 Z2.4
N3967 G1 E.8 F1800
N3968 ; FEATURE: Inner wall
N3969 G1 F8475
N3970 M204 S8000
N3971 G1 X158.725 Y197.252 E1.03439
N3972 G1 X158.725 Y123.65 E2.36678
N3973 G1 X190.893 Y123.65 E1.03439
N3974 G1 X190.893 Y197.192 E2.36485
N3975 ; COOLING_NODE: 0
N3976 M204 S10000
N3977 G1 X191.3 Y197.659 F60000
N3978 G1 F8475
N3979 M204 S8000
N3980 G1 X158.318 Y197.659 E1.06057
N3981 M73 P46 R17
N3982 G1 X158.318 Y123.243 E2.39296
N3983 G1 X191.3 Y123.243 E1.06057
N3984 G1 X191.3 Y197.599 E2.39103
N3985 ; COOLING_NODE: 0
N3986 M204 S10000
N3987 G1 X191.707 Y198.067 F60000
N3988 G1 F8475
N3989 M204 S8000
N3990 G1 X157.911 Y198.067 E1.08675
N3991 G1 X157.911 Y122.836 E2.41914
N3992 G1 X191.707 Y122.836 E1.08675
N3993 G1 X191.707 Y198.007 E2.41721
N3994 ; COOLING_NODE: 0
N3995 M204 S10000
N3996 G1 X192.099 Y198.459 F60000
N3997 ; FEATURE: Outer wall
N3998 ; LINE_WIDTH: 0.42
N3999 G1 F9149.261
N4000 M204 S5000
N4001 G1 X157.519 Y198.459 E1.03002
N4002 G1 X157.519 Y122.444 E2.26421
N4003 G1 X192.099 Y122.444 E1.03002
N4004 G1 X192.099 Y198.399 E2.26243
N4005 G1 E-.8 F1800
N4006 M204 S10000
N4007 G1 X188.067 Y197.087 Z2.8 F60000
N4008 G1 Z2.4
N4009 G1 E.8 F1800
N4010 ; FEATURE: Sparse infill
N4011 ; LINE_WIDTH: 0.45
N4012 G1 F8475
N4013 M204 S8000
N4014 G1 X190.544 Y194.609 E.11268
N4015 G1 X190.544 Y190.772 E.12342
N4016 G1 X184.412 Y196.904 E.27889
N4017 G1 X180.574 Y196.904 E.12342
N4018 G1 X190.544 Y186.934 E.45342
N4019 G1 X190.544 Y183.096 E.12342
N4020 G1 X176.736 Y196.904 E.62796
N4021 M73 P47 R17
N4022 G1 X172.898 Y196.904 E.12342
N4023 G1 X190.544 Y179.258 E.80249
N4024 G1 X190.544 Y175.42 E.12342
N4025 G1 X169.06 Y196.904 E.97703
N4026 G1 X165.222 Y196.904 E.12342
N4027 G1 X190.544 Y171.582 E1.15157
N4028 G1 X190.544 Y167.744 E.12342
N4029 G1 X161.384 Y196.904 E1.3261
N4030 G1 X159.073 Y196.904 E.0743
N4031 G1 X159.073 Y195.377 E.04912
N4032 G1 X190.544 Y163.906 E1.43118
N4033 G1 X190.544 Y160.068 E.12342
N4034 G1 X159.073 Y191.539 E1.43118
N4035 G1 X159.073 Y187.701 E.12342
N4036 G1 X190.544 Y156.23 E1.43118
N4037 G1 X190.544 Y152.392 E.12342
N4038 G1 X159.073 Y183.863 E1.43118
N4039 G1 X159.073 Y180.025 E.12342
N4040 G1 X190.544 Y148.554 E1.43118
N4041 G1 X190.544 Y144.716 E.12342
N4042 G1 X159.073 Y176.187 E1.43118
N4043 G1 X159.073 Y172.349 E.12342
N4044 G1 X190.544 Y140.878 E1.43118
N4045 G1 X190.544 Y137.04 E.12342
N4046 G1 X159.073 Y168.511 E1.43118
N4047 G1 X159.073 Y164.673 E.12342
N4048 G1 X190.544 Y133.202 E1.43118
N4049 G1 X190.544 Y129.364 E.12342
N4050 G1 X159.073 Y160.835 E1.43118
N4051 G1 X159.073 Y156.997 E.12342
N4052 G1 X190.544 Y125.526 E1.43118
N4053 G1 X190.544 Y123.999 E.04912
N4054 G1 X188.234 Y123.999 E.0743
N4055 G1 X159.073 Y153.159 E1.3261
N4056 G1 X159.073 Y149.321 E.12342
N4057 G1 X184.396 Y123.999 E1.15157
N4058 G1 X180.558 Y123.999 E.12342
N4059 G1 X159.073 Y145.483 E.97703
N4060 G1 X159.073 Y141.645 E.12342
N4061 G1 X176.72 Y123.999 E.80249
N4062 G1 X172.882 Y123.999 E.12342
N4063 G1 X159.073 Y137.807 E.62796
N4064 G1 X159.073 Y133.969 E.12342
N4065 G1 X169.044 Y123.999 E.45342
N4066 G1 X165.206 Y123.999 E.12342
N4067 G1 X159.073 Y130.131 E.27889
N4068 G1 X159.073 Y126.293 E.12342
N4069 G1 X161.551 Y123.815 E.11268
N4070 ; WIPE_START
N4071 G1 X160.137 Y125.23 E-.76
N4072 ; WIPE_END
N4073 G1 E-.04 F1800
N4074 M204 S10000
N4075 G17
N4076 G3 Z2.8 I1.217 J0 P1  F60000
N4077 ; stop printing object, unique label id: 79
N4078 M625
N4079 ; object ids of layer 12 start: 79
N4080 M624 AQAAAAAAAAA=
N4081 ;======== H2D 20250213========
N4082 ; SKIPPABLE_START
N4083 ; SKIPTYPE: timelapse
N4084 M622.1 S1 ; for prev firware, default turned on
N4085 
N4086 M1002 judge_flag timelapse_record_flag
N4087 
N4088 M622 J1
N4089 M993 A2 B2 C2
N4090 M993 A0 B0 C0
N4091 
N4092 
N4093 M9712 E1 M0
N4094 M83
N4095 G1 Z2.8 F1200
N4096 M400
N4097 M9713
N4098 
N4099 
N4100 M9711 M0 E1 Z2.8 S11 C10 O0 T3000
N4101 
N4102 
N4103 M9712 E1 M0
N4104 G90
N4105 G1 Z5.4
N4106 G1 Y295 F30000
N4107 G1 Y265 F18000
N4108 M83
N4109 M9713
N4110 
N4111 M993 A3 B3 C3
N4112 
N4113 M623
N4114 ; SKIPPABLE_END
N4115 
N4116 ; object ids of this layer12 end: 79
N4117 M625
N4118 ; CHANGE_LAYER
N4119 ; Z_HEIGHT: 2.6
N4120 ; LAYER_HEIGHT: 0.2
N4121 ;======== H2D 20250521========
N4122 ; layer num/total_layer_count: 13/63
N4123 ; update layer progress
N4124 M73 L13
N4125 M991 S0 P12 ;notify layer change
N4126 
N4127 
N4128 M106 S71.4
N4129 ; OBJECT_ID: 79
N4130 ; COOLING_NODE: 0
N4131 ; start printing object, unique label id: 79
N4132 M624 AQAAAAAAAAA=
N4133 G1 X190.893 Y197.252 F60000
N4134 G1 Z2.6
N4135 G1 E.8 F1800
N4136 ; FEATURE: Inner wall
N4137 G1 F8475
N4138 M204 S8000
N4139 G1 X158.725 Y197.252 E1.03439
N4140 G1 X158.725 Y123.65 E2.36678
N4141 G1 X190.893 Y123.65 E1.03439
N4142 G1 X190.893 Y197.192 E2.36485
N4143 ; COOLING_NODE: 0
N4144 M204 S10000
N4145 G1 X191.3 Y197.659 F60000
N4146 G1 F8475
N4147 M204 S8000
N4148 G1 X158.318 Y197.659 E1.06057
N4149 G1 X158.318 Y123.243 E2.39296
N4150 G1 X191.3 Y123.243 E1.06057
N4151 G1 X191.3 Y197.599 E2.39103
N4152 ; COOLING_NODE: 0
N4153 M204 S10000
N4154 G1 X191.707 Y198.067 F60000
N4155 G1 F8475
N4156 M204 S8000
N4157 G1 X157.911 Y198.067 E1.08675
N4158 G1 X157.911 Y122.836 E2.41914
N4159 G1 X191.707 Y122.836 E1.08675
N4160 G1 X191.707 Y198.007 E2.41721
N4161 ; COOLING_NODE: 0
N4162 M204 S10000
N4163 G1 X192.099 Y198.459 F60000
N4164 ; FEATURE: Outer wall
N4165 ; LINE_WIDTH: 0.42
N4166 G1 F9149.261
N4167 M204 S5000
N4168 G1 X157.519 Y198.459 E1.03002
N4169 G1 X157.519 Y122.444 E2.26421
N4170 G1 X192.099 Y122.444 E1.03002
N4171 G1 X192.099 Y198.399 E2.26243
N4172 G1 E-.8 F1800
N4173 M204 S10000
N4174 G1 X184.52 Y197.492 Z3 F60000
N4175 G1 X158.89 Y194.426 Z3
N4176 G1 Z2.6
N4177 G1 E.8 F1800
N4178 ; FEATURE: Sparse infill
N4179 ; LINE_WIDTH: 0.45
N4180 G1 F8475
N4181 M204 S8000
N4182 G1 X161.368 Y196.904 E.11268
N4183 G1 X165.206 Y196.904 E.12342
N4184 G1 X159.073 Y190.772 E.27889
N4185 G1 X159.073 Y186.934 E.12342
N4186 G1 X169.044 Y196.904 E.45342
N4187 G1 X172.882 Y196.904 E.12342
N4188 G1 X159.073 Y183.096 E.62796
N4189 G1 X159.073 Y179.258 E.12342
N4190 G1 X176.72 Y196.904 E.80249
N4191 G1 X180.558 Y196.904 E.12342
N4192 G1 X159.073 Y175.42 E.97703
N4193 G1 X159.073 Y171.582 E.12342
N4194 G1 X184.396 Y196.904 E1.15157
N4195 G1 X188.234 Y196.904 E.12342
N4196 G1 X159.073 Y167.744 E1.3261
N4197 G1 X159.073 Y163.906 E.12342
N4198 G1 X190.544 Y195.377 E1.43118
N4199 G1 X190.544 Y191.539 E.12342
N4200 G1 X159.073 Y160.068 E1.43118
N4201 G1 X159.073 Y156.23 E.12342
N4202 G1 X190.544 Y187.701 E1.43118
N4203 G1 X190.544 Y183.863 E.12342
N4204 G1 X159.073 Y152.392 E1.43118
N4205 G1 X159.073 Y148.554 E.12342
N4206 G1 X190.544 Y180.025 E1.43118
N4207 G1 X190.544 Y176.187 E.12342
N4208 G1 X159.073 Y144.716 E1.43118
N4209 G1 X159.073 Y140.878 E.12342
N4210 G1 X190.544 Y172.349 E1.43118
N4211 G1 X190.544 Y168.511 E.12342
N4212 G1 X159.073 Y137.04 E1.43118
N4213 G1 X159.073 Y133.202 E.12342
N4214 G1 X190.544 Y164.673 E1.43118
N4215 G1 X190.544 Y160.835 E.12342
N4216 G1 X159.073 Y129.364 E1.43118
N4217 G1 X159.073 Y125.526 E.12342
N4218 G1 X190.544 Y156.997 E1.43118
N4219 G1 X190.544 Y153.159 E.12342
N4220 M73 P48 R17
N4221 G1 X161.384 Y123.999 E1.3261
N4222 G1 X165.222 Y123.999 E.12342
N4223 G1 X190.544 Y149.321 E1.15157
N4224 G1 X190.544 Y145.483 E.12342
N4225 G1 X169.06 Y123.999 E.97703
N4226 G1 X172.898 Y123.999 E.12342
N4227 G1 X190.544 Y141.645 E.80249
N4228 G1 X190.544 Y137.807 E.12342
N4229 G1 X176.736 Y123.999 E.62796
N4230 G1 X180.574 Y123.999 E.12342
N4231 G1 X190.544 Y133.969 E.45342
N4232 G1 X190.544 Y130.131 E.12342
N4233 G1 X184.412 Y123.999 E.27889
N4234 G1 X188.25 Y123.999 E.12342
N4235 G1 X190.728 Y126.476 E.11268
N4236 ; WIPE_START
N4237 G1 X189.313 Y125.062 E-.76
N4238 ; WIPE_END
N4239 G1 E-.04 F1800
N4240 M204 S10000
N4241 G17
N4242 G3 Z3 I1.217 J0 P1  F60000
N4243 ; stop printing object, unique label id: 79
N4244 M625
N4245 ; object ids of layer 13 start: 79
N4246 M624 AQAAAAAAAAA=
N4247 ;======== H2D 20250213========
N4248 ; SKIPPABLE_START
N4249 ; SKIPTYPE: timelapse
N4250 M622.1 S1 ; for prev firware, default turned on
N4251 
N4252 M1002 judge_flag timelapse_record_flag
N4253 
N4254 M622 J1
N4255 M993 A2 B2 C2
N4256 M993 A0 B0 C0
N4257 
N4258 
N4259 M9712 E1 M0
N4260 M83
N4261 G1 Z3 F1200
N4262 M400
N4263 M9713
N4264 
N4265 
N4266 M9711 M0 E1 Z3 S11 C10 O0 T3000
N4267 
N4268 
N4269 M9712 E1 M0
N4270 G90
N4271 G1 Z5.6
N4272 G1 Y295 F30000
N4273 G1 Y265 F18000
N4274 M83
N4275 M9713
N4276 
N4277 M993 A3 B3 C3
N4278 
N4279 M623
N4280 ; SKIPPABLE_END
N4281 
N4282 ; object ids of this layer13 end: 79
N4283 M625
N4284 ; CHANGE_LAYER
N4285 ; Z_HEIGHT: 2.8
N4286 ; LAYER_HEIGHT: 0.2
N4287 ;======== H2D 20250521========
N4288 ; layer num/total_layer_count: 14/63
N4289 ; update layer progress
N4290 M73 L14
N4291 M991 S0 P13 ;notify layer change
N4292 
N4293 
N4294 M106 S73.95
N4295 ; OBJECT_ID: 79
N4296 ; COOLING_NODE: 0
N4297 ; start printing object, unique label id: 79
N4298 M624 AQAAAAAAAAA=
N4299 G1 X190.893 Y197.252 F60000
N4300 G1 Z2.8
N4301 G1 E.8 F1800
N4302 ; FEATURE: Inner wall
N4303 G1 F8475
N4304 M204 S8000
N4305 G1 X158.725 Y197.252 E1.03439
N4306 G1 X158.725 Y123.65 E2.36678
N4307 G1 X190.893 Y123.65 E1.03439
N4308 G1 X190.893 Y197.192 E2.36485
N4309 ; COOLING_NODE: 0
N4310 M204 S10000
N4311 G1 X191.3 Y197.659 F60000
N4312 G1 F8475
N4313 M204 S8000
N4314 G1 X158.318 Y197.659 E1.06057
N4315 G1 X158.318 Y123.243 E2.39296
N4316 G1 X191.3 Y123.243 E1.06057
N4317 G1 X191.3 Y197.599 E2.39103
N4318 ; COOLING_NODE: 0
N4319 M204 S10000
N4320 G1 X191.707 Y198.067 F60000
N4321 G1 F8475
N4322 M204 S8000
N4323 G1 X157.911 Y198.067 E1.08675
N4324 G1 X157.911 Y122.836 E2.41914
N4325 G1 X191.707 Y122.836 E1.08675
N4326 G1 X191.707 Y198.007 E2.41721
N4327 ; COOLING_NODE: 0
N4328 M204 S10000
N4329 G1 X192.099 Y198.459 F60000
N4330 ; FEATURE: Outer wall
N4331 ; LINE_WIDTH: 0.42
N4332 G1 F9149.261
N4333 M204 S5000
N4334 G1 X157.519 Y198.459 E1.03002
N4335 G1 X157.519 Y122.444 E2.26421
N4336 G1 X192.099 Y122.444 E1.03002
N4337 G1 X192.099 Y198.399 E2.26243
N4338 G1 E-.8 F1800
N4339 M204 S10000
N4340 G1 X188.067 Y197.087 Z3.2 F60000
N4341 G1 Z2.8
N4342 G1 E.8 F1800
N4343 ; FEATURE: Sparse infill
N4344 ; LINE_WIDTH: 0.45
N4345 G1 F8475
N4346 M204 S8000
N4347 G1 X190.544 Y194.609 E.11268
N4348 G1 X190.544 Y190.772 E.12342
N4349 G1 X184.412 Y196.904 E.27889
N4350 G1 X180.574 Y196.904 E.12342
N4351 G1 X190.544 Y186.934 E.45342
N4352 G1 X190.544 Y183.096 E.12342
N4353 G1 X176.736 Y196.904 E.62796
N4354 G1 X172.898 Y196.904 E.12342
N4355 G1 X190.544 Y179.258 E.80249
N4356 G1 X190.544 Y175.42 E.12342
N4357 G1 X169.06 Y196.904 E.97703
N4358 G1 X165.222 Y196.904 E.12342
N4359 G1 X190.544 Y171.582 E1.15157
N4360 G1 X190.544 Y167.744 E.12342
N4361 G1 X161.384 Y196.904 E1.3261
N4362 G1 X159.073 Y196.904 E.0743
N4363 G1 X159.073 Y195.377 E.04912
N4364 G1 X190.544 Y163.906 E1.43118
N4365 G1 X190.544 Y160.068 E.12342
N4366 G1 X159.073 Y191.539 E1.43118
N4367 G1 X159.073 Y187.701 E.12342
N4368 G1 X190.544 Y156.23 E1.43118
N4369 G1 X190.544 Y152.392 E.12342
N4370 G1 X159.073 Y183.863 E1.43118
N4371 G1 X159.073 Y180.025 E.12342
N4372 G1 X190.544 Y148.554 E1.43118
N4373 G1 X190.544 Y144.716 E.12342
N4374 G1 X159.073 Y176.187 E1.43118
N4375 G1 X159.073 Y172.349 E.12342
N4376 G1 X190.544 Y140.878 E1.43118
N4377 G1 X190.544 Y137.04 E.12342
N4378 G1 X159.073 Y168.511 E1.43118
N4379 G1 X159.073 Y164.673 E.12342
N4380 G1 X190.544 Y133.202 E1.43118
N4381 G1 X190.544 Y129.364 E.12342
N4382 G1 X159.073 Y160.835 E1.43118
N4383 G1 X159.073 Y156.997 E.12342
N4384 G1 X190.544 Y125.526 E1.43118
N4385 G1 X190.544 Y123.999 E.04912
N4386 G1 X188.234 Y123.999 E.0743
N4387 G1 X159.073 Y153.159 E1.3261
N4388 G1 X159.073 Y149.321 E.12342
N4389 G1 X184.396 Y123.999 E1.15157
N4390 G1 X180.558 Y123.999 E.12342
N4391 G1 X159.073 Y145.483 E.97703
N4392 G1 X159.073 Y141.645 E.12342
N4393 G1 X176.72 Y123.999 E.80249
N4394 G1 X172.882 Y123.999 E.12342
N4395 G1 X159.073 Y137.807 E.62796
N4396 G1 X159.073 Y133.969 E.12342
N4397 G1 X169.044 Y123.999 E.45342
N4398 G1 X165.206 Y123.999 E.12342
N4399 G1 X159.073 Y130.131 E.27889
N4400 G1 X159.073 Y126.293 E.12342
N4401 G1 X161.551 Y123.815 E.11268
N4402 ; WIPE_START
N4403 G1 X160.137 Y125.23 E-.76
N4404 ; WIPE_END
N4405 G1 E-.04 F1800
N4406 M204 S10000
N4407 G17
N4408 G3 Z3.2 I1.217 J0 P1  F60000
N4409 ; stop printing object, unique label id: 79
N4410 M625
N4411 ; object ids of layer 14 start: 79
N4412 M624 AQAAAAAAAAA=
N4413 ;======== H2D 20250213========
N4414 ; SKIPPABLE_START
N4415 ; SKIPTYPE: timelapse
N4416 M622.1 S1 ; for prev firware, default turned on
N4417 
N4418 M1002 judge_flag timelapse_record_flag
N4419 
N4420 M622 J1
N4421 M993 A2 B2 C2
N4422 M993 A0 B0 C0
N4423 
N4424 
N4425 M9712 E1 M0
N4426 M83
N4427 G1 Z3.2 F1200
N4428 M400
N4429 M9713
N4430 
N4431 
N4432 M9711 M0 E1 Z3.2 S11 C10 O0 T3000
N4433 
N4434 
N4435 M9712 E1 M0
N4436 G90
N4437 G1 Z5.8
N4438 G1 Y295 F30000
N4439 G1 Y265 F18000
N4440 M83
N4441 M9713
N4442 
N4443 M993 A3 B3 C3
N4444 
N4445 M623
N4446 ; SKIPPABLE_END
N4447 
N4448 ; object ids of this layer14 end: 79
N4449 M625
N4450 ; CHANGE_LAYER
N4451 ; Z_HEIGHT: 3
N4452 ; LAYER_HEIGHT: 0.2
N4453 ;======== H2D 20250521========
N4454 ; layer num/total_layer_count: 15/63
N4455 ; update layer progress
N4456 M73 L15
N4457 M991 S0 P14 ;notify layer change
N4458 
N4459 
N4460 M106 S71.4
N4461 ; OBJECT_ID: 79
N4462 ; COOLING_NODE: 0
N4463 ; start printing object, unique label id: 79
N4464 M624 AQAAAAAAAAA=
N4465 G1 X190.893 Y197.252 F60000
N4466 G1 Z3
N4467 G1 E.8 F1800
N4468 ; FEATURE: Inner wall
N4469 G1 F8475
N4470 M204 S8000
N4471 G1 X158.725 Y197.252 E1.03439
N4472 G1 X158.725 Y123.65 E2.36678
N4473 G1 X190.893 Y123.65 E1.03439
N4474 G1 X190.893 Y197.192 E2.36485
N4475 ; COOLING_NODE: 0
N4476 M204 S10000
N4477 G1 X191.3 Y197.659 F60000
N4478 G1 F8475
N4479 M204 S8000
N4480 G1 X158.318 Y197.659 E1.06057
N4481 G1 X158.318 Y123.243 E2.39296
N4482 G1 X191.3 Y123.243 E1.06057
N4483 G1 X191.3 Y197.599 E2.39103
N4484 ; COOLING_NODE: 0
N4485 M204 S10000
N4486 M73 P49 R17
N4487 G1 X191.707 Y198.067 F60000
N4488 G1 F8475
N4489 M204 S8000
N4490 G1 X157.911 Y198.067 E1.08675
N4491 G1 X157.911 Y122.836 E2.41914
N4492 G1 X191.707 Y122.836 E1.08675
N4493 G1 X191.707 Y198.007 E2.41721
N4494 ; COOLING_NODE: 0
N4495 M204 S10000
N4496 G1 X192.099 Y198.459 F60000
N4497 ; FEATURE: Outer wall
N4498 ; LINE_WIDTH: 0.42
N4499 G1 F9149.261
N4500 M204 S5000
N4501 G1 X157.519 Y198.459 E1.03002
N4502 G1 X157.519 Y122.444 E2.26421
N4503 G1 X192.099 Y122.444 E1.03002
N4504 G1 X192.099 Y198.399 E2.26243
N4505 G1 E-.8 F1800
N4506 M204 S10000
N4507 G1 X184.52 Y197.492 Z3.4 F60000
N4508 G1 X158.89 Y194.426 Z3.4
N4509 G1 Z3
N4510 G1 E.8 F1800
N4511 ; FEATURE: Sparse infill
N4512 ; LINE_WIDTH: 0.45
N4513 G1 F8475
N4514 M204 S8000
N4515 G1 X161.368 Y196.904 E.11268
N4516 G1 X165.206 Y196.904 E.12342
N4517 G1 X159.073 Y190.772 E.27889
N4518 G1 X159.073 Y186.934 E.12342
N4519 G1 X169.044 Y196.904 E.45342
N4520 G1 X172.882 Y196.904 E.12342
N4521 G1 X159.073 Y183.096 E.62796
N4522 G1 X159.073 Y179.258 E.12342
N4523 G1 X176.72 Y196.904 E.80249
N4524 G1 X180.558 Y196.904 E.12342
N4525 G1 X159.073 Y175.42 E.97703
N4526 G1 X159.073 Y171.582 E.12342
N4527 G1 X184.396 Y196.904 E1.15157
N4528 G1 X188.234 Y196.904 E.12342
N4529 G1 X159.073 Y167.744 E1.3261
N4530 G1 X159.073 Y163.906 E.12342
N4531 G1 X190.544 Y195.377 E1.43118
N4532 G1 X190.544 Y191.539 E.12342
N4533 G1 X159.073 Y160.068 E1.43118
N4534 G1 X159.073 Y156.23 E.12342
N4535 G1 X190.544 Y187.701 E1.43118
N4536 G1 X190.544 Y183.863 E.12342
N4537 G1 X159.073 Y152.392 E1.43118
N4538 G1 X159.073 Y148.554 E.12342
N4539 G1 X190.544 Y180.025 E1.43118
N4540 G1 X190.544 Y176.187 E.12342
N4541 G1 X159.073 Y144.716 E1.43118
N4542 G1 X159.073 Y140.878 E.12342
N4543 G1 X190.544 Y172.349 E1.43118
N4544 G1 X190.544 Y168.511 E.12342
N4545 G1 X159.073 Y137.04 E1.43118
N4546 G1 X159.073 Y133.202 E.12342
N4547 G1 X190.544 Y164.673 E1.43118
N4548 G1 X190.544 Y160.835 E.12342
N4549 G1 X159.073 Y129.364 E1.43118
N4550 G1 X159.073 Y125.526 E.12342
N4551 G1 X190.544 Y156.997 E1.43118
N4552 G1 X190.544 Y153.159 E.12342
N4553 G1 X161.384 Y123.999 E1.3261
N4554 G1 X165.222 Y123.999 E.12342
N4555 G1 X190.544 Y149.321 E1.15157
N4556 G1 X190.544 Y145.483 E.12342
N4557 G1 X169.06 Y123.999 E.97703
N4558 G1 X172.898 Y123.999 E.12342
N4559 G1 X190.544 Y141.645 E.80249
N4560 G1 X190.544 Y137.807 E.12342
N4561 G1 X176.736 Y123.999 E.62796
N4562 G1 X180.574 Y123.999 E.12342
N4563 G1 X190.544 Y133.969 E.45342
N4564 G1 X190.544 Y130.131 E.12342
N4565 G1 X184.412 Y123.999 E.27889
N4566 G1 X188.25 Y123.999 E.12342
N4567 G1 X190.728 Y126.476 E.11268
N4568 ; WIPE_START
N4569 G1 X189.313 Y125.062 E-.76
N4570 ; WIPE_END
N4571 G1 E-.04 F1800
N4572 M204 S10000
N4573 G17
N4574 G3 Z3.4 I1.217 J0 P1  F60000
N4575 ; stop printing object, unique label id: 79
N4576 M625
N4577 ; object ids of layer 15 start: 79
N4578 M624 AQAAAAAAAAA=
N4579 ;======== H2D 20250213========
N4580 ; SKIPPABLE_START
N4581 ; SKIPTYPE: timelapse
N4582 M622.1 S1 ; for prev firware, default turned on
N4583 
N4584 M1002 judge_flag timelapse_record_flag
N4585 
N4586 M622 J1
N4587 M993 A2 B2 C2
N4588 M993 A0 B0 C0
N4589 
N4590 
N4591 M9712 E1 M0
N4592 M83
N4593 G1 Z3.4 F1200
N4594 M400
N4595 M9713
N4596 
N4597 
N4598 M9711 M0 E1 Z3.4 S11 C10 O0 T3000
N4599 
N4600 
N4601 M9712 E1 M0
N4602 G90
N4603 G1 Z6
N4604 G1 Y295 F30000
N4605 G1 Y265 F18000
N4606 M83
N4607 M9713
N4608 
N4609 M993 A3 B3 C3
N4610 
N4611 M623
N4612 ; SKIPPABLE_END
N4613 
N4614 ; object ids of this layer15 end: 79
N4615 M625
N4616 ; CHANGE_LAYER
N4617 ; Z_HEIGHT: 3.2
N4618 ; LAYER_HEIGHT: 0.2
N4619 ;======== H2D 20250521========
N4620 ; layer num/total_layer_count: 16/63
N4621 ; update layer progress
N4622 M73 L16
N4623 M991 S0 P15 ;notify layer change
N4624 
N4625 
N4626 M106 S73.95
N4627 ; OBJECT_ID: 79
N4628 ; COOLING_NODE: 0
N4629 ; start printing object, unique label id: 79
N4630 M624 AQAAAAAAAAA=
N4631 G1 X190.893 Y197.252 F60000
N4632 G1 Z3.2
N4633 G1 E.8 F1800
N4634 ; FEATURE: Inner wall
N4635 G1 F8475
N4636 M204 S8000
N4637 G1 X158.725 Y197.252 E1.03439
N4638 G1 X158.725 Y123.65 E2.36678
N4639 G1 X190.893 Y123.65 E1.03439
N4640 G1 X190.893 Y197.192 E2.36485
N4641 ; COOLING_NODE: 0
N4642 M204 S10000
N4643 G1 X191.3 Y197.659 F60000
N4644 M73 P49 R16
N4645 G1 F8475
N4646 M204 S8000
N4647 G1 X158.318 Y197.659 E1.06057
N4648 G1 X158.318 Y123.243 E2.39296
N4649 G1 X191.3 Y123.243 E1.06057
N4650 G1 X191.3 Y197.599 E2.39103
N4651 ; COOLING_NODE: 0
N4652 M204 S10000
N4653 G1 X191.707 Y198.067 F60000
N4654 G1 F8475
N4655 M204 S8000
N4656 G1 X157.911 Y198.067 E1.08675
N4657 G1 X157.911 Y122.836 E2.41914
N4658 G1 X191.707 Y122.836 E1.08675
N4659 G1 X191.707 Y198.007 E2.41721
N4660 ; COOLING_NODE: 0
N4661 M204 S10000
N4662 G1 X192.099 Y198.459 F60000
N4663 ; FEATURE: Outer wall
N4664 ; LINE_WIDTH: 0.42
N4665 G1 F9149.261
N4666 M204 S5000
N4667 G1 X157.519 Y198.459 E1.03002
N4668 G1 X157.519 Y122.444 E2.26421
N4669 G1 X192.099 Y122.444 E1.03002
N4670 G1 X192.099 Y198.399 E2.26243
N4671 G1 E-.8 F1800
N4672 M204 S10000
N4673 G1 X188.067 Y197.087 Z3.6 F60000
N4674 G1 Z3.2
N4675 G1 E.8 F1800
N4676 ; FEATURE: Sparse infill
N4677 ; LINE_WIDTH: 0.45
N4678 G1 F8475
N4679 M204 S8000
N4680 G1 X190.544 Y194.609 E.11268
N4681 G1 X190.544 Y190.772 E.12342
N4682 G1 X184.412 Y196.904 E.27889
N4683 G1 X180.574 Y196.904 E.12342
N4684 G1 X190.544 Y186.934 E.45342
N4685 G1 X190.544 Y183.096 E.12342
N4686 M73 P50 R16
N4687 G1 X176.736 Y196.904 E.62796
N4688 G1 X172.898 Y196.904 E.12342
N4689 G1 X190.544 Y179.258 E.80249
N4690 G1 X190.544 Y175.42 E.12342
N4691 G1 X169.06 Y196.904 E.97703
N4692 G1 X165.222 Y196.904 E.12342
N4693 G1 X190.544 Y171.582 E1.15157
N4694 G1 X190.544 Y167.744 E.12342
N4695 G1 X161.384 Y196.904 E1.3261
N4696 G1 X159.073 Y196.904 E.0743
N4697 G1 X159.073 Y195.377 E.04912
N4698 G1 X190.544 Y163.906 E1.43118
N4699 G1 X190.544 Y160.068 E.12342
N4700 G1 X159.073 Y191.539 E1.43118
N4701 G1 X159.073 Y187.701 E.12342
N4702 G1 X190.544 Y156.23 E1.43118
N4703 G1 X190.544 Y152.392 E.12342
N4704 G1 X159.073 Y183.863 E1.43118
N4705 G1 X159.073 Y180.025 E.12342
N4706 G1 X190.544 Y148.554 E1.43118
N4707 G1 X190.544 Y144.716 E.12342
N4708 G1 X159.073 Y176.187 E1.43118
N4709 G1 X159.073 Y172.349 E.12342
N4710 G1 X190.544 Y140.878 E1.43118
N4711 G1 X190.544 Y137.04 E.12342
N4712 G1 X159.073 Y168.511 E1.43118
N4713 G1 X159.073 Y164.673 E.12342
N4714 G1 X190.544 Y133.202 E1.43118
N4715 G1 X190.544 Y129.364 E.12342
N4716 G1 X159.073 Y160.835 E1.43118
N4717 G1 X159.073 Y156.997 E.12342
N4718 G1 X190.544 Y125.526 E1.43118
N4719 G1 X190.544 Y123.999 E.04912
N4720 G1 X188.234 Y123.999 E.0743
N4721 G1 X159.073 Y153.159 E1.3261
N4722 G1 X159.073 Y149.321 E.12342
N4723 G1 X184.396 Y123.999 E1.15157
N4724 G1 X180.558 Y123.999 E.12342
N4725 G1 X159.073 Y145.483 E.97703
N4726 G1 X159.073 Y141.645 E.12342
N4727 G1 X176.72 Y123.999 E.80249
N4728 G1 X172.882 Y123.999 E.12342
N4729 G1 X159.073 Y137.807 E.62796
N4730 G1 X159.073 Y133.969 E.12342
N4731 G1 X169.044 Y123.999 E.45342
N4732 G1 X165.206 Y123.999 E.12342
N4733 G1 X159.073 Y130.131 E.27889
N4734 G1 X159.073 Y126.293 E.12342
N4735 G1 X161.551 Y123.815 E.11268
N4736 ; WIPE_START
N4737 G1 X160.137 Y125.23 E-.76
N4738 ; WIPE_END
N4739 G1 E-.04 F1800
N4740 M204 S10000
N4741 G17
N4742 G3 Z3.6 I1.217 J0 P1  F60000
N4743 ; stop printing object, unique label id: 79
N4744 M625
N4745 ; object ids of layer 16 start: 79
N4746 M624 AQAAAAAAAAA=
N4747 ;======== H2D 20250213========
N4748 ; SKIPPABLE_START
N4749 ; SKIPTYPE: timelapse
N4750 M622.1 S1 ; for prev firware, default turned on
N4751 
N4752 M1002 judge_flag timelapse_record_flag
N4753 
N4754 M622 J1
N4755 M993 A2 B2 C2
N4756 M993 A0 B0 C0
N4757 
N4758 
N4759 M9712 E1 M0
N4760 M83
N4761 G1 Z3.6 F1200
N4762 M400
N4763 M9713
N4764 
N4765 
N4766 M9711 M0 E1 Z3.6 S11 C10 O0 T3000
N4767 
N4768 
N4769 M9712 E1 M0
N4770 G90
N4771 G1 Z6.2
N4772 G1 Y295 F30000
N4773 G1 Y265 F18000
N4774 M83
N4775 M9713
N4776 
N4777 M993 A3 B3 C3
N4778 
N4779 M623
N4780 ; SKIPPABLE_END
N4781 
N4782 ; object ids of this layer16 end: 79
N4783 M625
N4784 ; CHANGE_LAYER
N4785 ; Z_HEIGHT: 3.4
N4786 ; LAYER_HEIGHT: 0.2
N4787 ;======== H2D 20250521========
N4788 ; layer num/total_layer_count: 17/63
N4789 ; update layer progress
N4790 M73 L17
N4791 M991 S0 P16 ;notify layer change
N4792 
N4793 
N4794 M106 S71.4
N4795 ; OBJECT_ID: 79
N4796 ; COOLING_NODE: 0
N4797 ; start printing object, unique label id: 79
N4798 M624 AQAAAAAAAAA=
N4799 G1 X190.893 Y197.252 F60000
N4800 G1 Z3.4
N4801 G1 E.8 F1800
N4802 ; FEATURE: Inner wall
N4803 G1 F8475
N4804 M204 S8000
N4805 G1 X158.725 Y197.252 E1.03439
N4806 G1 X158.725 Y123.65 E2.36678
N4807 G1 X190.893 Y123.65 E1.03439
N4808 G1 X190.893 Y197.192 E2.36485
N4809 ; COOLING_NODE: 0
N4810 M204 S10000
N4811 G1 X191.3 Y197.659 F60000
N4812 G1 F8475
N4813 M204 S8000
N4814 G1 X158.318 Y197.659 E1.06057
N4815 G1 X158.318 Y123.243 E2.39296
N4816 G1 X191.3 Y123.243 E1.06057
N4817 G1 X191.3 Y197.599 E2.39103
N4818 ; COOLING_NODE: 0
N4819 M204 S10000
N4820 G1 X191.707 Y198.067 F60000
N4821 G1 F8475
N4822 M204 S8000
N4823 G1 X157.911 Y198.067 E1.08675
N4824 G1 X157.911 Y122.836 E2.41914
N4825 G1 X191.707 Y122.836 E1.08675
N4826 G1 X191.707 Y198.007 E2.41721
N4827 ; COOLING_NODE: 0
N4828 M204 S10000
N4829 G1 X192.099 Y198.459 F60000
N4830 ; FEATURE: Outer wall
N4831 ; LINE_WIDTH: 0.42
N4832 G1 F9149.261
N4833 M204 S5000
N4834 G1 X157.519 Y198.459 E1.03002
N4835 G1 X157.519 Y122.444 E2.26421
N4836 G1 X192.099 Y122.444 E1.03002
N4837 G1 X192.099 Y198.399 E2.26243
N4838 G1 E-.8 F1800
N4839 M204 S10000
N4840 G1 X184.52 Y197.492 Z3.8 F60000
N4841 G1 X158.89 Y194.426 Z3.8
N4842 G1 Z3.4
N4843 G1 E.8 F1800
N4844 ; FEATURE: Sparse infill
N4845 ; LINE_WIDTH: 0.45
N4846 G1 F8475
N4847 M204 S8000
N4848 G1 X161.368 Y196.904 E.11268
N4849 G1 X165.206 Y196.904 E.12342
N4850 G1 X159.073 Y190.772 E.27889
N4851 G1 X159.073 Y186.934 E.12342
N4852 G1 X169.044 Y196.904 E.45342
N4853 G1 X172.882 Y196.904 E.12342
N4854 G1 X159.073 Y183.096 E.62796
N4855 G1 X159.073 Y179.258 E.12342
N4856 G1 X176.72 Y196.904 E.80249
N4857 G1 X180.558 Y196.904 E.12342
N4858 G1 X159.073 Y175.42 E.97703
N4859 G1 X159.073 Y171.582 E.12342
N4860 G1 X184.396 Y196.904 E1.15157
N4861 G1 X188.234 Y196.904 E.12342
N4862 G1 X159.073 Y167.744 E1.3261
N4863 G1 X159.073 Y163.906 E.12342
N4864 G1 X190.544 Y195.377 E1.43118
N4865 G1 X190.544 Y191.539 E.12342
N4866 G1 X159.073 Y160.068 E1.43118
N4867 G1 X159.073 Y156.23 E.12342
N4868 G1 X190.544 Y187.701 E1.43118
N4869 G1 X190.544 Y183.863 E.12342
N4870 G1 X159.073 Y152.392 E1.43118
N4871 G1 X159.073 Y148.554 E.12342
N4872 G1 X190.544 Y180.025 E1.43118
N4873 G1 X190.544 Y176.187 E.12342
N4874 G1 X159.073 Y144.716 E1.43118
N4875 G1 X159.073 Y140.878 E.12342
N4876 G1 X190.544 Y172.349 E1.43118
N4877 G1 X190.544 Y168.511 E.12342
N4878 G1 X159.073 Y137.04 E1.43118
N4879 G1 X159.073 Y133.202 E.12342
N4880 G1 X190.544 Y164.673 E1.43118
N4881 G1 X190.544 Y160.835 E.12342
N4882 G1 X159.073 Y129.364 E1.43118
N4883 G1 X159.073 Y125.526 E.12342
N4884 G1 X190.544 Y156.997 E1.43118
N4885 M73 P51 R16
N4886 G1 X190.544 Y153.159 E.12342
N4887 G1 X161.384 Y123.999 E1.3261
N4888 G1 X165.222 Y123.999 E.12342
N4889 G1 X190.544 Y149.321 E1.15157
N4890 G1 X190.544 Y145.483 E.12342
N4891 G1 X169.06 Y123.999 E.97703
N4892 G1 X172.898 Y123.999 E.12342
N4893 G1 X190.544 Y141.645 E.80249
N4894 G1 X190.544 Y137.807 E.12342
N4895 G1 X176.736 Y123.999 E.62796
N4896 G1 X180.574 Y123.999 E.12342
N4897 G1 X190.544 Y133.969 E.45342
N4898 G1 X190.544 Y130.131 E.12342
N4899 G1 X184.412 Y123.999 E.27889
N4900 G1 X188.25 Y123.999 E.12342
N4901 G1 X190.728 Y126.476 E.11268
N4902 ; WIPE_START
N4903 G1 X189.313 Y125.062 E-.76
N4904 ; WIPE_END
N4905 G1 E-.04 F1800
N4906 M204 S10000
N4907 G17
N4908 G3 Z3.8 I1.217 J0 P1  F60000
N4909 ; stop printing object, unique label id: 79
N4910 M625
N4911 ; object ids of layer 17 start: 79
N4912 M624 AQAAAAAAAAA=
N4913 ;======== H2D 20250213========
N4914 ; SKIPPABLE_START
N4915 ; SKIPTYPE: timelapse
N4916 M622.1 S1 ; for prev firware, default turned on
N4917 
N4918 M1002 judge_flag timelapse_record_flag
N4919 
N4920 M622 J1
N4921 M993 A2 B2 C2
N4922 M993 A0 B0 C0
N4923 
N4924 
N4925 M9712 E1 M0
N4926 M83
N4927 G1 Z3.8 F1200
N4928 M400
N4929 M9713
N4930 
N4931 
N4932 M9711 M0 E1 Z3.8 S11 C10 O0 T3000
N4933 
N4934 
N4935 M9712 E1 M0
N4936 G90
N4937 G1 Z6.4
N4938 G1 Y295 F30000
N4939 G1 Y265 F18000
N4940 M83
N4941 M9713
N4942 
N4943 M993 A3 B3 C3
N4944 
N4945 M623
N4946 ; SKIPPABLE_END
N4947 
N4948 ; object ids of this layer17 end: 79
N4949 M625
N4950 ; CHANGE_LAYER
N4951 ; Z_HEIGHT: 3.6
N4952 ; LAYER_HEIGHT: 0.2
N4953 ;======== H2D 20250521========
N4954 ; layer num/total_layer_count: 18/63
N4955 ; update layer progress
N4956 M73 L18
N4957 M991 S0 P17 ;notify layer change
N4958 
N4959 
N4960 M106 S73.95
N4961 ; OBJECT_ID: 79
N4962 ; COOLING_NODE: 0
N4963 ; start printing object, unique label id: 79
N4964 M624 AQAAAAAAAAA=
N4965 G1 X190.893 Y197.252 F60000
N4966 G1 Z3.6
N4967 G1 E.8 F1800
N4968 ; FEATURE: Inner wall
N4969 G1 F8475
N4970 M204 S8000
N4971 G1 X158.725 Y197.252 E1.03439
N4972 G1 X158.725 Y123.65 E2.36678
N4973 G1 X190.893 Y123.65 E1.03439
N4974 G1 X190.893 Y197.192 E2.36485
N4975 ; COOLING_NODE: 0
N4976 M204 S10000
N4977 G1 X191.3 Y197.659 F60000
N4978 G1 F8475
N4979 M204 S8000
N4980 G1 X158.318 Y197.659 E1.06057
N4981 G1 X158.318 Y123.243 E2.39296
N4982 G1 X191.3 Y123.243 E1.06057
N4983 G1 X191.3 Y197.599 E2.39103
N4984 ; COOLING_NODE: 0
N4985 M204 S10000
N4986 G1 X191.707 Y198.067 F60000
N4987 G1 F8475
N4988 M204 S8000
N4989 G1 X157.911 Y198.067 E1.08675
N4990 G1 X157.911 Y122.836 E2.41914
N4991 G1 X191.707 Y122.836 E1.08675
N4992 G1 X191.707 Y198.007 E2.41721
N4993 ; COOLING_NODE: 0
N4994 M204 S10000
N4995 G1 X192.099 Y198.459 F60000
N4996 ; FEATURE: Outer wall
N4997 ; LINE_WIDTH: 0.42
N4998 G1 F9149.261
N4999 M204 S5000
N5000 G1 X157.519 Y198.459 E1.03002
N5001 G1 X157.519 Y122.444 E2.26421
N5002 G1 X192.099 Y122.444 E1.03002
N5003 G1 X192.099 Y198.399 E2.26243
N5004 G1 E-.8 F1800
N5005 M204 S10000
N5006 G1 X188.067 Y197.087 Z4 F60000
N5007 G1 Z3.6
N5008 G1 E.8 F1800
N5009 ; FEATURE: Sparse infill
N5010 ; LINE_WIDTH: 0.45
N5011 G1 F8475
N5012 M204 S8000
N5013 G1 X190.544 Y194.609 E.11268
N5014 G1 X190.544 Y190.772 E.12342
N5015 G1 X184.412 Y196.904 E.27889
N5016 G1 X180.574 Y196.904 E.12342
N5017 G1 X190.544 Y186.934 E.45342
N5018 G1 X190.544 Y183.096 E.12342
N5019 G1 X176.736 Y196.904 E.62796
N5020 G1 X172.898 Y196.904 E.12342
N5021 G1 X190.544 Y179.258 E.80249
N5022 G1 X190.544 Y175.42 E.12342
N5023 G1 X169.06 Y196.904 E.97703
N5024 G1 X165.222 Y196.904 E.12342
N5025 G1 X190.544 Y171.582 E1.15157
N5026 G1 X190.544 Y167.744 E.12342
N5027 G1 X161.384 Y196.904 E1.3261
N5028 G1 X159.073 Y196.904 E.0743
N5029 G1 X159.073 Y195.377 E.04912
N5030 G1 X190.544 Y163.906 E1.43118
N5031 G1 X190.544 Y160.068 E.12342
N5032 G1 X159.073 Y191.539 E1.43118
N5033 G1 X159.073 Y187.701 E.12342
N5034 G1 X190.544 Y156.23 E1.43118
N5035 G1 X190.544 Y152.392 E.12342
N5036 G1 X159.073 Y183.863 E1.43118
N5037 G1 X159.073 Y180.025 E.12342
N5038 G1 X190.544 Y148.554 E1.43118
N5039 G1 X190.544 Y144.716 E.12342
N5040 G1 X159.073 Y176.187 E1.43118
N5041 G1 X159.073 Y172.349 E.12342
N5042 G1 X190.544 Y140.878 E1.43118
N5043 G1 X190.544 Y137.04 E.12342
N5044 G1 X159.073 Y168.511 E1.43118
N5045 G1 X159.073 Y164.673 E.12342
N5046 G1 X190.544 Y133.202 E1.43118
N5047 G1 X190.544 Y129.364 E.12342
N5048 G1 X159.073 Y160.835 E1.43118
N5049 G1 X159.073 Y156.997 E.12342
N5050 G1 X190.544 Y125.526 E1.43118
N5051 G1 X190.544 Y123.999 E.04912
N5052 G1 X188.234 Y123.999 E.0743
N5053 G1 X159.073 Y153.159 E1.3261
N5054 G1 X159.073 Y149.321 E.12342
N5055 G1 X184.396 Y123.999 E1.15157
N5056 G1 X180.558 Y123.999 E.12342
N5057 G1 X159.073 Y145.483 E.97703
N5058 G1 X159.073 Y141.645 E.12342
N5059 G1 X176.72 Y123.999 E.80249
N5060 G1 X172.882 Y123.999 E.12342
N5061 G1 X159.073 Y137.807 E.62796
N5062 G1 X159.073 Y133.969 E.12342
N5063 G1 X169.044 Y123.999 E.45342
N5064 G1 X165.206 Y123.999 E.12342
N5065 G1 X159.073 Y130.131 E.27889
N5066 G1 X159.073 Y126.293 E.12342
N5067 G1 X161.551 Y123.815 E.11268
N5068 ; WIPE_START
N5069 G1 X160.137 Y125.23 E-.76
N5070 ; WIPE_END
N5071 G1 E-.04 F1800
N5072 M204 S10000
N5073 G17
N5074 G3 Z4 I1.217 J0 P1  F60000
N5075 ; stop printing object, unique label id: 79
N5076 M625
N5077 ; object ids of layer 18 start: 79
N5078 M624 AQAAAAAAAAA=
N5079 ;======== H2D 20250213========
N5080 ; SKIPPABLE_START
N5081 ; SKIPTYPE: timelapse
N5082 M622.1 S1 ; for prev firware, default turned on
N5083 
N5084 M1002 judge_flag timelapse_record_flag
N5085 
N5086 M622 J1
N5087 M993 A2 B2 C2
N5088 M993 A0 B0 C0
N5089 
N5090 
N5091 M9712 E1 M0
N5092 M83
N5093 G1 Z4 F1200
N5094 M400
N5095 M9713
N5096 
N5097 
N5098 M9711 M0 E1 Z4 S11 C10 O0 T3000
N5099 
N5100 
N5101 M9712 E1 M0
N5102 G90
N5103 G1 Z6.6
N5104 G1 Y295 F30000
N5105 G1 Y265 F18000
N5106 M83
N5107 M9713
N5108 
N5109 M993 A3 B3 C3
N5110 
N5111 M623
N5112 ; SKIPPABLE_END
N5113 
N5114 ; object ids of this layer18 end: 79
N5115 M625
N5116 ; CHANGE_LAYER
N5117 ; Z_HEIGHT: 3.8
N5118 ; LAYER_HEIGHT: 0.2
N5119 ;======== H2D 20250521========
N5120 ; layer num/total_layer_count: 19/63
N5121 ; update layer progress
N5122 M73 L19
N5123 M991 S0 P18 ;notify layer change
N5124 
N5125 
N5126 M106 S71.4
N5127 ; OBJECT_ID: 79
N5128 ; COOLING_NODE: 0
N5129 ; start printing object, unique label id: 79
N5130 M624 AQAAAAAAAAA=
N5131 G1 X190.893 Y197.252 F60000
N5132 G1 Z3.8
N5133 G1 E.8 F1800
N5134 ; FEATURE: Inner wall
N5135 G1 F8475
N5136 M204 S8000
N5137 G1 X158.725 Y197.252 E1.03439
N5138 G1 X158.725 Y123.65 E2.36678
N5139 G1 X190.893 Y123.65 E1.03439
N5140 G1 X190.893 Y197.192 E2.36485
N5141 ; COOLING_NODE: 0
N5142 M204 S10000
N5143 G1 X191.3 Y197.659 F60000
N5144 G1 F8475
N5145 M204 S8000
N5146 G1 X158.318 Y197.659 E1.06057
N5147 M73 P52 R16
N5148 G1 X158.318 Y123.243 E2.39296
N5149 G1 X191.3 Y123.243 E1.06057
N5150 G1 X191.3 Y197.599 E2.39103
N5151 ; COOLING_NODE: 0
N5152 M204 S10000
N5153 G1 X191.707 Y198.067 F60000
N5154 G1 F8475
N5155 M204 S8000
N5156 G1 X157.911 Y198.067 E1.08675
N5157 G1 X157.911 Y122.836 E2.41914
N5158 G1 X191.707 Y122.836 E1.08675
N5159 G1 X191.707 Y198.007 E2.41721
N5160 ; COOLING_NODE: 0
N5161 M204 S10000
N5162 G1 X192.099 Y198.459 F60000
N5163 ; FEATURE: Outer wall
N5164 ; LINE_WIDTH: 0.42
N5165 G1 F9149.261
N5166 M204 S5000
N5167 G1 X157.519 Y198.459 E1.03002
N5168 G1 X157.519 Y122.444 E2.26421
N5169 G1 X192.099 Y122.444 E1.03002
N5170 G1 X192.099 Y198.399 E2.26243
N5171 G1 E-.8 F1800
N5172 M204 S10000
N5173 G1 X184.52 Y197.492 Z4.2 F60000
N5174 G1 X158.89 Y194.426 Z4.2
N5175 G1 Z3.8
N5176 G1 E.8 F1800
N5177 ; FEATURE: Sparse infill
N5178 ; LINE_WIDTH: 0.45
N5179 G1 F8475
N5180 M204 S8000
N5181 G1 X161.368 Y196.904 E.11268
N5182 G1 X165.206 Y196.904 E.12342
N5183 G1 X159.073 Y190.772 E.27889
N5184 G1 X159.073 Y186.934 E.12342
N5185 G1 X169.044 Y196.904 E.45342
N5186 G1 X172.882 Y196.904 E.12342
N5187 G1 X159.073 Y183.096 E.62796
N5188 G1 X159.073 Y179.258 E.12342
N5189 G1 X176.72 Y196.904 E.80249
N5190 G1 X180.558 Y196.904 E.12342
N5191 G1 X159.073 Y175.42 E.97703
N5192 G1 X159.073 Y171.582 E.12342
N5193 G1 X184.396 Y196.904 E1.15157
N5194 G1 X188.234 Y196.904 E.12342
N5195 G1 X159.073 Y167.744 E1.3261
N5196 G1 X159.073 Y163.906 E.12342
N5197 G1 X190.544 Y195.377 E1.43118
N5198 G1 X190.544 Y191.539 E.12342
N5199 G1 X159.073 Y160.068 E1.43118
N5200 G1 X159.073 Y156.23 E.12342
N5201 G1 X190.544 Y187.701 E1.43118
N5202 G1 X190.544 Y183.863 E.12342
N5203 G1 X159.073 Y152.392 E1.43118
N5204 G1 X159.073 Y148.554 E.12342
N5205 G1 X190.544 Y180.025 E1.43118
N5206 G1 X190.544 Y176.187 E.12342
N5207 G1 X159.073 Y144.716 E1.43118
N5208 G1 X159.073 Y140.878 E.12342
N5209 G1 X190.544 Y172.349 E1.43118
N5210 G1 X190.544 Y168.511 E.12342
N5211 G1 X159.073 Y137.04 E1.43118
N5212 G1 X159.073 Y133.202 E.12342
N5213 G1 X190.544 Y164.673 E1.43118
N5214 G1 X190.544 Y160.835 E.12342
N5215 G1 X159.073 Y129.364 E1.43118
N5216 G1 X159.073 Y125.526 E.12342
N5217 G1 X190.544 Y156.997 E1.43118
N5218 G1 X190.544 Y153.159 E.12342
N5219 G1 X161.384 Y123.999 E1.3261
N5220 G1 X165.222 Y123.999 E.12342
N5221 G1 X190.544 Y149.321 E1.15157
N5222 G1 X190.544 Y145.483 E.12342
N5223 G1 X169.06 Y123.999 E.97703
N5224 G1 X172.898 Y123.999 E.12342
N5225 G1 X190.544 Y141.645 E.80249
N5226 G1 X190.544 Y137.807 E.12342
N5227 G1 X176.736 Y123.999 E.62796
N5228 G1 X180.574 Y123.999 E.12342
N5229 G1 X190.544 Y133.969 E.45342
N5230 G1 X190.544 Y130.131 E.12342
N5231 G1 X184.412 Y123.999 E.27889
N5232 G1 X188.25 Y123.999 E.12342
N5233 G1 X190.728 Y126.476 E.11268
N5234 ; WIPE_START
N5235 G1 X189.313 Y125.062 E-.76
N5236 ; WIPE_END
N5237 G1 E-.04 F1800
N5238 M204 S10000
N5239 G17
N5240 G3 Z4.2 I1.217 J0 P1  F60000
N5241 ; stop printing object, unique label id: 79
N5242 M625
N5243 ; object ids of layer 19 start: 79
N5244 M624 AQAAAAAAAAA=
N5245 ;======== H2D 20250213========
N5246 ; SKIPPABLE_START
N5247 ; SKIPTYPE: timelapse
N5248 M622.1 S1 ; for prev firware, default turned on
N5249 
N5250 M1002 judge_flag timelapse_record_flag
N5251 
N5252 M622 J1
N5253 M993 A2 B2 C2
N5254 M993 A0 B0 C0
N5255 
N5256 
N5257 M9712 E1 M0
N5258 M83
N5259 G1 Z4.2 F1200
N5260 M400
N5261 M9713
N5262 
N5263 
N5264 M9711 M0 E1 Z4.2 S11 C10 O0 T3000
N5265 
N5266 
N5267 M9712 E1 M0
N5268 G90
N5269 G1 Z6.8
N5270 G1 Y295 F30000
N5271 G1 Y265 F18000
N5272 M83
N5273 M9713
N5274 
N5275 M993 A3 B3 C3
N5276 
N5277 M623
N5278 ; SKIPPABLE_END
N5279 
N5280 ; object ids of this layer19 end: 79
N5281 M625
N5282 ; CHANGE_LAYER
N5283 ; Z_HEIGHT: 4
N5284 ; LAYER_HEIGHT: 0.2
N5285 ;======== H2D 20250521========
N5286 ; layer num/total_layer_count: 20/63
N5287 ; update layer progress
N5288 M73 L20
N5289 M991 S0 P19 ;notify layer change
N5290 
N5291 
N5292 M106 S73.95
N5293 ; OBJECT_ID: 79
N5294 ; COOLING_NODE: 0
N5295 ; start printing object, unique label id: 79
N5296 M624 AQAAAAAAAAA=
N5297 G1 X190.893 Y197.252 F60000
N5298 G1 Z4
N5299 M73 P52 R15
N5300 G1 E.8 F1800
N5301 ; FEATURE: Inner wall
N5302 G1 F8475
N5303 M204 S8000
N5304 G1 X158.725 Y197.252 E1.03439
N5305 G1 X158.725 Y123.65 E2.36678
N5306 G1 X190.893 Y123.65 E1.03439
N5307 G1 X190.893 Y197.192 E2.36485
N5308 ; COOLING_NODE: 0
N5309 M204 S10000
N5310 G1 X191.3 Y197.659 F60000
N5311 G1 F8475
N5312 M204 S8000
N5313 G1 X158.318 Y197.659 E1.06057
N5314 G1 X158.318 Y123.243 E2.39296
N5315 G1 X191.3 Y123.243 E1.06057
N5316 G1 X191.3 Y197.599 E2.39103
N5317 ; COOLING_NODE: 0
N5318 M204 S10000
N5319 G1 X191.707 Y198.067 F60000
N5320 G1 F8475
N5321 M204 S8000
N5322 G1 X157.911 Y198.067 E1.08675
N5323 G1 X157.911 Y122.836 E2.41914
N5324 G1 X191.707 Y122.836 E1.08675
N5325 G1 X191.707 Y198.007 E2.41721
N5326 ; COOLING_NODE: 0
N5327 M204 S10000
N5328 G1 X192.099 Y198.459 F60000
N5329 ; FEATURE: Outer wall
N5330 ; LINE_WIDTH: 0.42
N5331 G1 F9149.261
N5332 M204 S5000
N5333 G1 X157.519 Y198.459 E1.03002
N5334 G1 X157.519 Y122.444 E2.26421
N5335 G1 X192.099 Y122.444 E1.03002
N5336 G1 X192.099 Y198.399 E2.26243
N5337 G1 E-.8 F1800
N5338 M204 S10000
N5339 G1 X188.067 Y197.087 Z4.4 F60000
N5340 G1 Z4
N5341 G1 E.8 F1800
N5342 ; FEATURE: Sparse infill
N5343 ; LINE_WIDTH: 0.45
N5344 G1 F8475
N5345 M204 S8000
N5346 G1 X190.544 Y194.609 E.11268
N5347 G1 X190.544 Y190.772 E.12342
N5348 G1 X184.412 Y196.904 E.27889
N5349 G1 X180.574 Y196.904 E.12342
N5350 M73 P53 R15
N5351 G1 X190.544 Y186.934 E.45342
N5352 G1 X190.544 Y183.096 E.12342
N5353 G1 X176.736 Y196.904 E.62796
N5354 G1 X172.898 Y196.904 E.12342
N5355 G1 X190.544 Y179.258 E.80249
N5356 G1 X190.544 Y175.42 E.12342
N5357 G1 X169.06 Y196.904 E.97703
N5358 G1 X165.222 Y196.904 E.12342
N5359 G1 X190.544 Y171.582 E1.15157
N5360 G1 X190.544 Y167.744 E.12342
N5361 G1 X161.384 Y196.904 E1.3261
N5362 G1 X159.073 Y196.904 E.0743
N5363 G1 X159.073 Y195.377 E.04912
N5364 G1 X190.544 Y163.906 E1.43118
N5365 G1 X190.544 Y160.068 E.12342
N5366 G1 X159.073 Y191.539 E1.43118
N5367 G1 X159.073 Y187.701 E.12342
N5368 G1 X190.544 Y156.23 E1.43118
N5369 G1 X190.544 Y152.392 E.12342
N5370 G1 X159.073 Y183.863 E1.43118
N5371 G1 X159.073 Y180.025 E.12342
N5372 G1 X190.544 Y148.554 E1.43118
N5373 G1 X190.544 Y144.716 E.12342
N5374 G1 X159.073 Y176.187 E1.43118
N5375 G1 X159.073 Y172.349 E.12342
N5376 G1 X190.544 Y140.878 E1.43118
N5377 G1 X190.544 Y137.04 E.12342
N5378 G1 X159.073 Y168.511 E1.43118
N5379 G1 X159.073 Y164.673 E.12342
N5380 G1 X190.544 Y133.202 E1.43118
N5381 G1 X190.544 Y129.364 E.12342
N5382 G1 X159.073 Y160.835 E1.43118
N5383 G1 X159.073 Y156.997 E.12342
N5384 G1 X190.544 Y125.526 E1.43118
N5385 G1 X190.544 Y123.999 E.04912
N5386 G1 X188.234 Y123.999 E.0743
N5387 G1 X159.073 Y153.159 E1.3261
N5388 G1 X159.073 Y149.321 E.12342
N5389 G1 X184.396 Y123.999 E1.15157
N5390 G1 X180.558 Y123.999 E.12342
N5391 G1 X159.073 Y145.483 E.97703
N5392 G1 X159.073 Y141.645 E.12342
N5393 G1 X176.72 Y123.999 E.80249
N5394 G1 X172.882 Y123.999 E.12342
N5395 G1 X159.073 Y137.807 E.62796
N5396 G1 X159.073 Y133.969 E.12342
N5397 G1 X169.044 Y123.999 E.45342
N5398 G1 X165.206 Y123.999 E.12342
N5399 G1 X159.073 Y130.131 E.27889
N5400 G1 X159.073 Y126.293 E.12342
N5401 G1 X161.551 Y123.815 E.11268
N5402 ; WIPE_START
N5403 G1 X160.137 Y125.23 E-.76
N5404 ; WIPE_END
N5405 G1 E-.04 F1800
N5406 M204 S10000
N5407 G17
N5408 G3 Z4.4 I1.217 J0 P1  F60000
N5409 ; stop printing object, unique label id: 79
N5410 M625
N5411 ; object ids of layer 20 start: 79
N5412 M624 AQAAAAAAAAA=
N5413 ;======== H2D 20250213========
N5414 ; SKIPPABLE_START
N5415 ; SKIPTYPE: timelapse
N5416 M622.1 S1 ; for prev firware, default turned on
N5417 
N5418 M1002 judge_flag timelapse_record_flag
N5419 
N5420 M622 J1
N5421 M993 A2 B2 C2
N5422 M993 A0 B0 C0
N5423 
N5424 
N5425 M9712 E1 M0
N5426 M83
N5427 G1 Z4.4 F1200
N5428 M400
N5429 M9713
N5430 
N5431 
N5432 M9711 M0 E1 Z4.4 S11 C10 O0 T3000
N5433 
N5434 
N5435 M9712 E1 M0
N5436 G90
N5437 G1 Z7
N5438 G1 Y295 F30000
N5439 G1 Y265 F18000
N5440 M83
N5441 M9713
N5442 
N5443 M993 A3 B3 C3
N5444 
N5445 M623
N5446 ; SKIPPABLE_END
N5447 
N5448 ; object ids of this layer20 end: 79
N5449 M625
N5450 ; CHANGE_LAYER
N5451 ; Z_HEIGHT: 4.2
N5452 ; LAYER_HEIGHT: 0.2
N5453 ;======== H2D 20250521========
N5454 ; layer num/total_layer_count: 21/63
N5455 ; update layer progress
N5456 M73 L21
N5457 M991 S0 P20 ;notify layer change
N5458 
N5459 
N5460 M106 S71.4
N5461 ; OBJECT_ID: 79
N5462 ; COOLING_NODE: 0
N5463 ; start printing object, unique label id: 79
N5464 M624 AQAAAAAAAAA=
N5465 G1 X190.893 Y197.252 F60000
N5466 G1 Z4.2
N5467 G1 E.8 F1800
N5468 ; FEATURE: Inner wall
N5469 G1 F8475
N5470 M204 S8000
N5471 G1 X158.725 Y197.252 E1.03439
N5472 G1 X158.725 Y123.65 E2.36678
N5473 G1 X190.893 Y123.65 E1.03439
N5474 G1 X190.893 Y197.192 E2.36485
N5475 ; COOLING_NODE: 0
N5476 M204 S10000
N5477 G1 X191.3 Y197.659 F60000
N5478 G1 F8475
N5479 M204 S8000
N5480 G1 X158.318 Y197.659 E1.06057
N5481 G1 X158.318 Y123.243 E2.39296
N5482 G1 X191.3 Y123.243 E1.06057
N5483 G1 X191.3 Y197.599 E2.39103
N5484 ; COOLING_NODE: 0
N5485 M204 S10000
N5486 G1 X191.707 Y198.067 F60000
N5487 G1 F8475
N5488 M204 S8000
N5489 G1 X157.911 Y198.067 E1.08675
N5490 G1 X157.911 Y122.836 E2.41914
N5491 G1 X191.707 Y122.836 E1.08675
N5492 G1 X191.707 Y198.007 E2.41721
N5493 ; COOLING_NODE: 0
N5494 M204 S10000
N5495 G1 X192.099 Y198.459 F60000
N5496 ; FEATURE: Outer wall
N5497 ; LINE_WIDTH: 0.42
N5498 G1 F9149.261
N5499 M204 S5000
N5500 G1 X157.519 Y198.459 E1.03002
N5501 G1 X157.519 Y122.444 E2.26421
N5502 G1 X192.099 Y122.444 E1.03002
N5503 G1 X192.099 Y198.399 E2.26243
N5504 G1 E-.8 F1800
N5505 M204 S10000
N5506 G1 X184.52 Y197.492 Z4.6 F60000
N5507 G1 X158.89 Y194.426 Z4.6
N5508 G1 Z4.2
N5509 G1 E.8 F1800
N5510 ; FEATURE: Sparse infill
N5511 ; LINE_WIDTH: 0.45
N5512 G1 F8475
N5513 M204 S8000
N5514 G1 X161.368 Y196.904 E.11268
N5515 G1 X165.206 Y196.904 E.12342
N5516 G1 X159.073 Y190.772 E.27889
N5517 G1 X159.073 Y186.934 E.12342
N5518 G1 X169.044 Y196.904 E.45342
N5519 G1 X172.882 Y196.904 E.12342
N5520 G1 X159.073 Y183.096 E.62796
N5521 G1 X159.073 Y179.258 E.12342
N5522 G1 X176.72 Y196.904 E.80249
N5523 G1 X180.558 Y196.904 E.12342
N5524 G1 X159.073 Y175.42 E.97703
N5525 G1 X159.073 Y171.582 E.12342
N5526 G1 X184.396 Y196.904 E1.15157
N5527 G1 X188.234 Y196.904 E.12342
N5528 G1 X159.073 Y167.744 E1.3261
N5529 G1 X159.073 Y163.906 E.12342
N5530 G1 X190.544 Y195.377 E1.43118
N5531 G1 X190.544 Y191.539 E.12342
N5532 G1 X159.073 Y160.068 E1.43118
N5533 G1 X159.073 Y156.23 E.12342
N5534 G1 X190.544 Y187.701 E1.43118
N5535 G1 X190.544 Y183.863 E.12342
N5536 G1 X159.073 Y152.392 E1.43118
N5537 G1 X159.073 Y148.554 E.12342
N5538 G1 X190.544 Y180.025 E1.43118
N5539 G1 X190.544 Y176.187 E.12342
N5540 G1 X159.073 Y144.716 E1.43118
N5541 G1 X159.073 Y140.878 E.12342
N5542 G1 X190.544 Y172.349 E1.43118
N5543 G1 X190.544 Y168.511 E.12342
N5544 G1 X159.073 Y137.04 E1.43118
N5545 G1 X159.073 Y133.202 E.12342
N5546 G1 X190.544 Y164.673 E1.43118
N5547 G1 X190.544 Y160.835 E.12342
N5548 G1 X159.073 Y129.364 E1.43118
N5549 G1 X159.073 Y125.526 E.12342
N5550 M73 P54 R15
N5551 G1 X190.544 Y156.997 E1.43118
N5552 G1 X190.544 Y153.159 E.12342
N5553 G1 X161.384 Y123.999 E1.3261
N5554 G1 X165.222 Y123.999 E.12342
N5555 G1 X190.544 Y149.321 E1.15157
N5556 G1 X190.544 Y145.483 E.12342
N5557 G1 X169.06 Y123.999 E.97703
N5558 G1 X172.898 Y123.999 E.12342
N5559 G1 X190.544 Y141.645 E.80249
N5560 G1 X190.544 Y137.807 E.12342
N5561 G1 X176.736 Y123.999 E.62796
N5562 G1 X180.574 Y123.999 E.12342
N5563 G1 X190.544 Y133.969 E.45342
N5564 G1 X190.544 Y130.131 E.12342
N5565 G1 X184.412 Y123.999 E.27889
N5566 G1 X188.25 Y123.999 E.12342
N5567 G1 X190.728 Y126.476 E.11268
N5568 ; WIPE_START
N5569 G1 X189.313 Y125.062 E-.76
N5570 ; WIPE_END
N5571 G1 E-.04 F1800
N5572 M204 S10000
N5573 G17
N5574 G3 Z4.6 I1.217 J0 P1  F60000
N5575 ; stop printing object, unique label id: 79
N5576 M625
N5577 ; object ids of layer 21 start: 79
N5578 M624 AQAAAAAAAAA=
N5579 ;======== H2D 20250213========
N5580 ; SKIPPABLE_START
N5581 ; SKIPTYPE: timelapse
N5582 M622.1 S1 ; for prev firware, default turned on
N5583 
N5584 M1002 judge_flag timelapse_record_flag
N5585 
N5586 M622 J1
N5587 M993 A2 B2 C2
N5588 M993 A0 B0 C0
N5589 
N5590 
N5591 M9712 E1 M0
N5592 M83
N5593 G1 Z4.6 F1200
N5594 M400
N5595 M9713
N5596 
N5597 
N5598 M9711 M0 E1 Z4.6 S11 C10 O0 T3000
N5599 
N5600 
N5601 M9712 E1 M0
N5602 G90
N5603 G1 Z7.2
N5604 G1 Y295 F30000
N5605 G1 Y265 F18000
N5606 M83
N5607 M9713
N5608 
N5609 M993 A3 B3 C3
N5610 
N5611 M623
N5612 ; SKIPPABLE_END
N5613 
N5614 ; object ids of this layer21 end: 79
N5615 M625
N5616 ; CHANGE_LAYER
N5617 ; Z_HEIGHT: 4.4
N5618 ; LAYER_HEIGHT: 0.2
N5619 ;======== H2D 20250521========
N5620 ; layer num/total_layer_count: 22/63
N5621 ; update layer progress
N5622 M73 L22
N5623 M991 S0 P21 ;notify layer change
N5624 
N5625 
N5626 M106 S73.95
N5627 ; OBJECT_ID: 79
N5628 ; COOLING_NODE: 0
N5629 ; start printing object, unique label id: 79
N5630 M624 AQAAAAAAAAA=
N5631 G1 X190.893 Y197.252 F60000
N5632 G1 Z4.4
N5633 G1 E.8 F1800
N5634 ; FEATURE: Inner wall
N5635 G1 F8475
N5636 M204 S8000
N5637 G1 X158.725 Y197.252 E1.03439
N5638 G1 X158.725 Y123.65 E2.36678
N5639 G1 X190.893 Y123.65 E1.03439
N5640 G1 X190.893 Y197.192 E2.36485
N5641 ; COOLING_NODE: 0
N5642 M204 S10000
N5643 G1 X191.3 Y197.659 F60000
N5644 G1 F8475
N5645 M204 S8000
N5646 G1 X158.318 Y197.659 E1.06057
N5647 G1 X158.318 Y123.243 E2.39296
N5648 G1 X191.3 Y123.243 E1.06057
N5649 G1 X191.3 Y197.599 E2.39103
N5650 ; COOLING_NODE: 0
N5651 M204 S10000
N5652 G1 X191.707 Y198.067 F60000
N5653 G1 F8475
N5654 M204 S8000
N5655 G1 X157.911 Y198.067 E1.08675
N5656 G1 X157.911 Y122.836 E2.41914
N5657 G1 X191.707 Y122.836 E1.08675
N5658 G1 X191.707 Y198.007 E2.41721
N5659 ; COOLING_NODE: 0
N5660 M204 S10000
N5661 G1 X192.099 Y198.459 F60000
N5662 ; FEATURE: Outer wall
N5663 ; LINE_WIDTH: 0.42
N5664 G1 F9149.261
N5665 M204 S5000
N5666 G1 X157.519 Y198.459 E1.03002
N5667 G1 X157.519 Y122.444 E2.26421
N5668 G1 X192.099 Y122.444 E1.03002
N5669 G1 X192.099 Y198.399 E2.26243
N5670 G1 E-.8 F1800
N5671 M204 S10000
N5672 G1 X188.067 Y197.087 Z4.8 F60000
N5673 G1 Z4.4
N5674 G1 E.8 F1800
N5675 ; FEATURE: Sparse infill
N5676 ; LINE_WIDTH: 0.45
N5677 G1 F8475
N5678 M204 S8000
N5679 G1 X190.544 Y194.609 E.11268
N5680 G1 X190.544 Y190.772 E.12342
N5681 G1 X184.412 Y196.904 E.27889
N5682 G1 X180.574 Y196.904 E.12342
N5683 G1 X190.544 Y186.934 E.45342
N5684 G1 X190.544 Y183.096 E.12342
N5685 G1 X176.736 Y196.904 E.62796
N5686 G1 X172.898 Y196.904 E.12342
N5687 G1 X190.544 Y179.258 E.80249
N5688 G1 X190.544 Y175.42 E.12342
N5689 G1 X169.06 Y196.904 E.97703
N5690 G1 X165.222 Y196.904 E.12342
N5691 G1 X190.544 Y171.582 E1.15157
N5692 G1 X190.544 Y167.744 E.12342
N5693 G1 X161.384 Y196.904 E1.3261
N5694 G1 X159.073 Y196.904 E.0743
N5695 G1 X159.073 Y195.377 E.04912
N5696 G1 X190.544 Y163.906 E1.43118
N5697 G1 X190.544 Y160.068 E.12342
N5698 G1 X159.073 Y191.539 E1.43118
N5699 G1 X159.073 Y187.701 E.12342
N5700 G1 X190.544 Y156.23 E1.43118
N5701 G1 X190.544 Y152.392 E.12342
N5702 G1 X159.073 Y183.863 E1.43118
N5703 G1 X159.073 Y180.025 E.12342
N5704 G1 X190.544 Y148.554 E1.43118
N5705 G1 X190.544 Y144.716 E.12342
N5706 G1 X159.073 Y176.187 E1.43118
N5707 G1 X159.073 Y172.349 E.12342
N5708 G1 X190.544 Y140.878 E1.43118
N5709 G1 X190.544 Y137.04 E.12342
N5710 G1 X159.073 Y168.511 E1.43118
N5711 G1 X159.073 Y164.673 E.12342
N5712 G1 X190.544 Y133.202 E1.43118
N5713 G1 X190.544 Y129.364 E.12342
N5714 G1 X159.073 Y160.835 E1.43118
N5715 G1 X159.073 Y156.997 E.12342
N5716 G1 X190.544 Y125.526 E1.43118
N5717 G1 X190.544 Y123.999 E.04912
N5718 G1 X188.234 Y123.999 E.0743
N5719 G1 X159.073 Y153.159 E1.3261
N5720 G1 X159.073 Y149.321 E.12342
N5721 G1 X184.396 Y123.999 E1.15157
N5722 G1 X180.558 Y123.999 E.12342
N5723 G1 X159.073 Y145.483 E.97703
N5724 G1 X159.073 Y141.645 E.12342
N5725 G1 X176.72 Y123.999 E.80249
N5726 G1 X172.882 Y123.999 E.12342
N5727 G1 X159.073 Y137.807 E.62796
N5728 G1 X159.073 Y133.969 E.12342
N5729 G1 X169.044 Y123.999 E.45342
N5730 G1 X165.206 Y123.999 E.12342
N5731 G1 X159.073 Y130.131 E.27889
N5732 G1 X159.073 Y126.293 E.12342
N5733 G1 X161.551 Y123.815 E.11268
N5734 ; WIPE_START
N5735 G1 X160.137 Y125.23 E-.76
N5736 ; WIPE_END
N5737 G1 E-.04 F1800
N5738 M204 S10000
N5739 G17
N5740 G3 Z4.8 I1.217 J0 P1  F60000
N5741 ; stop printing object, unique label id: 79
N5742 M625
N5743 ; object ids of layer 22 start: 79
N5744 M624 AQAAAAAAAAA=
N5745 ;======== H2D 20250213========
N5746 ; SKIPPABLE_START
N5747 ; SKIPTYPE: timelapse
N5748 M622.1 S1 ; for prev firware, default turned on
N5749 
N5750 M1002 judge_flag timelapse_record_flag
N5751 
N5752 M622 J1
N5753 M993 A2 B2 C2
N5754 M993 A0 B0 C0
N5755 
N5756 
N5757 M9712 E1 M0
N5758 M83
N5759 G1 Z4.8 F1200
N5760 M400
N5761 M9713
N5762 
N5763 
N5764 M9711 M0 E1 Z4.8 S11 C10 O0 T3000
N5765 
N5766 
N5767 M9712 E1 M0
N5768 G90
N5769 G1 Z7.4
N5770 G1 Y295 F30000
N5771 G1 Y265 F18000
N5772 M83
N5773 M9713
N5774 
N5775 M993 A3 B3 C3
N5776 
N5777 M623
N5778 ; SKIPPABLE_END
N5779 
N5780 ; object ids of this layer22 end: 79
N5781 M625
N5782 ; CHANGE_LAYER
N5783 ; Z_HEIGHT: 4.6
N5784 ; LAYER_HEIGHT: 0.2
N5785 ;======== H2D 20250521========
N5786 ; layer num/total_layer_count: 23/63
N5787 ; update layer progress
N5788 M73 L23
N5789 M991 S0 P22 ;notify layer change
N5790 
N5791 
N5792 M106 S71.4
N5793 ; OBJECT_ID: 79
N5794 ; COOLING_NODE: 0
N5795 ; start printing object, unique label id: 79
N5796 M624 AQAAAAAAAAA=
N5797 G1 X190.893 Y197.252 F60000
N5798 G1 Z4.6
N5799 G1 E.8 F1800
N5800 ; FEATURE: Inner wall
N5801 G1 F8475
N5802 M204 S8000
N5803 G1 X158.725 Y197.252 E1.03439
N5804 G1 X158.725 Y123.65 E2.36678
N5805 G1 X190.893 Y123.65 E1.03439
N5806 G1 X190.893 Y197.192 E2.36485
N5807 ; COOLING_NODE: 0
N5808 M204 S10000
N5809 G1 X191.3 Y197.659 F60000
N5810 G1 F8475
N5811 M204 S8000
N5812 G1 X158.318 Y197.659 E1.06057
N5813 M73 P55 R15
N5814 G1 X158.318 Y123.243 E2.39296
N5815 G1 X191.3 Y123.243 E1.06057
N5816 G1 X191.3 Y197.599 E2.39103
N5817 ; COOLING_NODE: 0
N5818 M204 S10000
N5819 G1 X191.707 Y198.067 F60000
N5820 G1 F8475
N5821 M204 S8000
N5822 G1 X157.911 Y198.067 E1.08675
N5823 G1 X157.911 Y122.836 E2.41914
N5824 G1 X191.707 Y122.836 E1.08675
N5825 G1 X191.707 Y198.007 E2.41721
N5826 ; COOLING_NODE: 0
N5827 M204 S10000
N5828 G1 X192.099 Y198.459 F60000
N5829 ; FEATURE: Outer wall
N5830 ; LINE_WIDTH: 0.42
N5831 G1 F9149.261
N5832 M204 S5000
N5833 G1 X157.519 Y198.459 E1.03002
N5834 G1 X157.519 Y122.444 E2.26421
N5835 G1 X192.099 Y122.444 E1.03002
N5836 G1 X192.099 Y198.399 E2.26243
N5837 G1 E-.8 F1800
N5838 M204 S10000
N5839 G1 X184.52 Y197.492 Z5 F60000
N5840 G1 X158.89 Y194.426 Z5
N5841 G1 Z4.6
N5842 G1 E.8 F1800
N5843 ; FEATURE: Sparse infill
N5844 ; LINE_WIDTH: 0.45
N5845 G1 F8475
N5846 M204 S8000
N5847 G1 X161.368 Y196.904 E.11268
N5848 G1 X165.206 Y196.904 E.12342
N5849 G1 X159.073 Y190.772 E.27889
N5850 G1 X159.073 Y186.934 E.12342
N5851 G1 X169.044 Y196.904 E.45342
N5852 G1 X172.882 Y196.904 E.12342
N5853 G1 X159.073 Y183.096 E.62796
N5854 G1 X159.073 Y179.258 E.12342
N5855 G1 X176.72 Y196.904 E.80249
N5856 G1 X180.558 Y196.904 E.12342
N5857 G1 X159.073 Y175.42 E.97703
N5858 G1 X159.073 Y171.582 E.12342
N5859 G1 X184.396 Y196.904 E1.15157
N5860 G1 X188.234 Y196.904 E.12342
N5861 G1 X159.073 Y167.744 E1.3261
N5862 G1 X159.073 Y163.906 E.12342
N5863 G1 X190.544 Y195.377 E1.43118
N5864 G1 X190.544 Y191.539 E.12342
N5865 G1 X159.073 Y160.068 E1.43118
N5866 G1 X159.073 Y156.23 E.12342
N5867 G1 X190.544 Y187.701 E1.43118
N5868 G1 X190.544 Y183.863 E.12342
N5869 G1 X159.073 Y152.392 E1.43118
N5870 G1 X159.073 Y148.554 E.12342
N5871 G1 X190.544 Y180.025 E1.43118
N5872 G1 X190.544 Y176.187 E.12342
N5873 G1 X159.073 Y144.716 E1.43118
N5874 G1 X159.073 Y140.878 E.12342
N5875 G1 X190.544 Y172.349 E1.43118
N5876 G1 X190.544 Y168.511 E.12342
N5877 G1 X159.073 Y137.04 E1.43118
N5878 G1 X159.073 Y133.202 E.12342
N5879 G1 X190.544 Y164.673 E1.43118
N5880 G1 X190.544 Y160.835 E.12342
N5881 G1 X159.073 Y129.364 E1.43118
N5882 G1 X159.073 Y125.526 E.12342
N5883 G1 X190.544 Y156.997 E1.43118
N5884 G1 X190.544 Y153.159 E.12342
N5885 G1 X161.384 Y123.999 E1.3261
N5886 G1 X165.222 Y123.999 E.12342
N5887 G1 X190.544 Y149.321 E1.15157
N5888 G1 X190.544 Y145.483 E.12342
N5889 G1 X169.06 Y123.999 E.97703
N5890 G1 X172.898 Y123.999 E.12342
N5891 G1 X190.544 Y141.645 E.80249
N5892 G1 X190.544 Y137.807 E.12342
N5893 G1 X176.736 Y123.999 E.62796
N5894 G1 X180.574 Y123.999 E.12342
N5895 G1 X190.544 Y133.969 E.45342
N5896 G1 X190.544 Y130.131 E.12342
N5897 G1 X184.412 Y123.999 E.27889
N5898 M73 P55 R14
N5899 G1 X188.25 Y123.999 E.12342
N5900 G1 X190.728 Y126.476 E.11268
N5901 ; WIPE_START
N5902 G1 X189.313 Y125.062 E-.76
N5903 ; WIPE_END
N5904 G1 E-.04 F1800
N5905 M204 S10000
N5906 G17
N5907 G3 Z5 I1.217 J0 P1  F60000
N5908 ; stop printing object, unique label id: 79
N5909 M625
N5910 ; object ids of layer 23 start: 79
N5911 M624 AQAAAAAAAAA=
N5912 ;======== H2D 20250213========
N5913 ; SKIPPABLE_START
N5914 ; SKIPTYPE: timelapse
N5915 M622.1 S1 ; for prev firware, default turned on
N5916 
N5917 M1002 judge_flag timelapse_record_flag
N5918 
N5919 M622 J1
N5920 M993 A2 B2 C2
N5921 M993 A0 B0 C0
N5922 
N5923 
N5924 M9712 E1 M0
N5925 M83
N5926 G1 Z5 F1200
N5927 M400
N5928 M9713
N5929 
N5930 
N5931 M9711 M0 E1 Z5 S11 C10 O0 T3000
N5932 
N5933 
N5934 M9712 E1 M0
N5935 G90
N5936 G1 Z7.6
N5937 G1 Y295 F30000
N5938 G1 Y265 F18000
N5939 M83
N5940 M9713
N5941 
N5942 M993 A3 B3 C3
N5943 
N5944 M623
N5945 ; SKIPPABLE_END
N5946 
N5947 ; object ids of this layer23 end: 79
N5948 M625
N5949 ; CHANGE_LAYER
N5950 ; Z_HEIGHT: 4.8
N5951 ; LAYER_HEIGHT: 0.2
N5952 ;======== H2D 20250521========
N5953 ; layer num/total_layer_count: 24/63
N5954 ; update layer progress
N5955 M73 L24
N5956 M991 S0 P23 ;notify layer change
N5957 
N5958 
N5959 M106 S73.95
N5960 ; OBJECT_ID: 79
N5961 ; COOLING_NODE: 0
N5962 ; start printing object, unique label id: 79
N5963 M624 AQAAAAAAAAA=
N5964 G1 X190.893 Y197.252 F60000
N5965 G1 Z4.8
N5966 G1 E.8 F1800
N5967 ; FEATURE: Inner wall
N5968 G1 F8475
N5969 M204 S8000
N5970 G1 X158.725 Y197.252 E1.03439
N5971 G1 X158.725 Y123.65 E2.36678
N5972 G1 X190.893 Y123.65 E1.03439
N5973 G1 X190.893 Y197.192 E2.36485
N5974 ; COOLING_NODE: 0
N5975 M204 S10000
N5976 G1 X191.3 Y197.659 F60000
N5977 G1 F8475
N5978 M204 S8000
N5979 G1 X158.318 Y197.659 E1.06057
N5980 G1 X158.318 Y123.243 E2.39296
N5981 G1 X191.3 Y123.243 E1.06057
N5982 G1 X191.3 Y197.599 E2.39103
N5983 ; COOLING_NODE: 0
N5984 M204 S10000
N5985 G1 X191.707 Y198.067 F60000
N5986 G1 F8475
N5987 M204 S8000
N5988 G1 X157.911 Y198.067 E1.08675
N5989 G1 X157.911 Y122.836 E2.41914
N5990 G1 X191.707 Y122.836 E1.08675
N5991 G1 X191.707 Y198.007 E2.41721
N5992 ; COOLING_NODE: 0
N5993 M204 S10000
N5994 G1 X192.099 Y198.459 F60000
N5995 ; FEATURE: Outer wall
N5996 ; LINE_WIDTH: 0.42
N5997 G1 F9149.261
N5998 M204 S5000
N5999 G1 X157.519 Y198.459 E1.03002
N6000 G1 X157.519 Y122.444 E2.26421
N6001 G1 X192.099 Y122.444 E1.03002
N6002 G1 X192.099 Y198.399 E2.26243
N6003 G1 E-.8 F1800
N6004 M204 S10000
N6005 G1 X188.067 Y197.087 Z5.2 F60000
N6006 G1 Z4.8
N6007 G1 E.8 F1800
N6008 ; FEATURE: Sparse infill
N6009 ; LINE_WIDTH: 0.45
N6010 G1 F8475
N6011 M204 S8000
N6012 G1 X190.544 Y194.609 E.11268
N6013 M73 P56 R14
N6014 G1 X190.544 Y190.772 E.12342
N6015 G1 X184.412 Y196.904 E.27889
N6016 G1 X180.574 Y196.904 E.12342
N6017 G1 X190.544 Y186.934 E.45342
N6018 G1 X190.544 Y183.096 E.12342
N6019 G1 X176.736 Y196.904 E.62796
N6020 G1 X172.898 Y196.904 E.12342
N6021 G1 X190.544 Y179.258 E.80249
N6022 G1 X190.544 Y175.42 E.12342
N6023 G1 X169.06 Y196.904 E.97703
N6024 G1 X165.222 Y196.904 E.12342
N6025 G1 X190.544 Y171.582 E1.15157
N6026 G1 X190.544 Y167.744 E.12342
N6027 G1 X161.384 Y196.904 E1.3261
N6028 G1 X159.073 Y196.904 E.0743
N6029 G1 X159.073 Y195.377 E.04912
N6030 G1 X190.544 Y163.906 E1.43118
N6031 G1 X190.544 Y160.068 E.12342
N6032 G1 X159.073 Y191.539 E1.43118
N6033 G1 X159.073 Y187.701 E.12342
N6034 G1 X190.544 Y156.23 E1.43118
N6035 G1 X190.544 Y152.392 E.12342
N6036 G1 X159.073 Y183.863 E1.43118
N6037 G1 X159.073 Y180.025 E.12342
N6038 G1 X190.544 Y148.554 E1.43118
N6039 G1 X190.544 Y144.716 E.12342
N6040 G1 X159.073 Y176.187 E1.43118
N6041 G1 X159.073 Y172.349 E.12342
N6042 G1 X190.544 Y140.878 E1.43118
N6043 G1 X190.544 Y137.04 E.12342
N6044 G1 X159.073 Y168.511 E1.43118
N6045 G1 X159.073 Y164.673 E.12342
N6046 G1 X190.544 Y133.202 E1.43118
N6047 G1 X190.544 Y129.364 E.12342
N6048 G1 X159.073 Y160.835 E1.43118
N6049 G1 X159.073 Y156.997 E.12342
N6050 G1 X190.544 Y125.526 E1.43118
N6051 G1 X190.544 Y123.999 E.04912
N6052 G1 X188.234 Y123.999 E.0743
N6053 G1 X159.073 Y153.159 E1.3261
N6054 G1 X159.073 Y149.321 E.12342
N6055 G1 X184.396 Y123.999 E1.15157
N6056 G1 X180.558 Y123.999 E.12342
N6057 G1 X159.073 Y145.483 E.97703
N6058 G1 X159.073 Y141.645 E.12342
N6059 G1 X176.72 Y123.999 E.80249
N6060 G1 X172.882 Y123.999 E.12342
N6061 G1 X159.073 Y137.807 E.62796
N6062 G1 X159.073 Y133.969 E.12342
N6063 G1 X169.044 Y123.999 E.45342
N6064 G1 X165.206 Y123.999 E.12342
N6065 G1 X159.073 Y130.131 E.27889
N6066 G1 X159.073 Y126.293 E.12342
N6067 G1 X161.551 Y123.815 E.11268
N6068 ; WIPE_START
N6069 G1 X160.137 Y125.23 E-.76
N6070 ; WIPE_END
N6071 G1 E-.04 F1800
N6072 M204 S10000
N6073 G17
N6074 G3 Z5.2 I1.217 J0 P1  F60000
N6075 ; stop printing object, unique label id: 79
N6076 M625
N6077 ; object ids of layer 24 start: 79
N6078 M624 AQAAAAAAAAA=
N6079 ;======== H2D 20250213========
N6080 ; SKIPPABLE_START
N6081 ; SKIPTYPE: timelapse
N6082 M622.1 S1 ; for prev firware, default turned on
N6083 
N6084 M1002 judge_flag timelapse_record_flag
N6085 
N6086 M622 J1
N6087 M993 A2 B2 C2
N6088 M993 A0 B0 C0
N6089 
N6090 
N6091 M9712 E1 M0
N6092 M83
N6093 G1 Z5.2 F1200
N6094 M400
N6095 M9713
N6096 
N6097 
N6098 M9711 M0 E1 Z5.2 S11 C10 O0 T3000
N6099 
N6100 
N6101 M9712 E1 M0
N6102 G90
N6103 G1 Z7.8
N6104 G1 Y295 F30000
N6105 G1 Y265 F18000
N6106 M83
N6107 M9713
N6108 
N6109 M993 A3 B3 C3
N6110 
N6111 M623
N6112 ; SKIPPABLE_END
N6113 
N6114 ; object ids of this layer24 end: 79
N6115 M625
N6116 ; CHANGE_LAYER
N6117 ; Z_HEIGHT: 5
N6118 ; LAYER_HEIGHT: 0.2
N6119 ;======== H2D 20250521========
N6120 ; layer num/total_layer_count: 25/63
N6121 ; update layer progress
N6122 M73 L25
N6123 M991 S0 P24 ;notify layer change
N6124 
N6125 
N6126 M106 S71.4
N6127 ; OBJECT_ID: 79
N6128 ; COOLING_NODE: 0
N6129 ; start printing object, unique label id: 79
N6130 M624 AQAAAAAAAAA=
N6131 G1 X190.893 Y197.252 F60000
N6132 G1 Z5
N6133 G1 E.8 F1800
N6134 ; FEATURE: Inner wall
N6135 G1 F8475
N6136 M204 S8000
N6137 G1 X158.725 Y197.252 E1.03439
N6138 G1 X158.725 Y123.65 E2.36678
N6139 G1 X190.893 Y123.65 E1.03439
N6140 G1 X190.893 Y197.192 E2.36485
N6141 ; COOLING_NODE: 0
N6142 M204 S10000
N6143 G1 X191.3 Y197.659 F60000
N6144 G1 F8475
N6145 M204 S8000
N6146 G1 X158.318 Y197.659 E1.06057
N6147 G1 X158.318 Y123.243 E2.39296
N6148 G1 X191.3 Y123.243 E1.06057
N6149 G1 X191.3 Y197.599 E2.39103
N6150 ; COOLING_NODE: 0
N6151 M204 S10000
N6152 G1 X191.707 Y198.067 F60000
N6153 G1 F8475
N6154 M204 S8000
N6155 G1 X157.911 Y198.067 E1.08675
N6156 G1 X157.911 Y122.836 E2.41914
N6157 G1 X191.707 Y122.836 E1.08675
N6158 G1 X191.707 Y198.007 E2.41721
N6159 ; COOLING_NODE: 0
N6160 M204 S10000
N6161 G1 X192.099 Y198.459 F60000
N6162 ; FEATURE: Outer wall
N6163 ; LINE_WIDTH: 0.42
N6164 G1 F9149.261
N6165 M204 S5000
N6166 G1 X157.519 Y198.459 E1.03002
N6167 G1 X157.519 Y122.444 E2.26421
N6168 G1 X192.099 Y122.444 E1.03002
N6169 G1 X192.099 Y198.399 E2.26243
N6170 G1 E-.8 F1800
N6171 M204 S10000
N6172 G1 X184.52 Y197.492 Z5.4 F60000
N6173 G1 X158.89 Y194.426 Z5.4
N6174 G1 Z5
N6175 G1 E.8 F1800
N6176 ; FEATURE: Sparse infill
N6177 ; LINE_WIDTH: 0.45
N6178 G1 F8475
N6179 M204 S8000
N6180 G1 X161.368 Y196.904 E.11268
N6181 G1 X165.206 Y196.904 E.12342
N6182 G1 X159.073 Y190.772 E.27889
N6183 G1 X159.073 Y186.934 E.12342
N6184 G1 X169.044 Y196.904 E.45342
N6185 G1 X172.882 Y196.904 E.12342
N6186 G1 X159.073 Y183.096 E.62796
N6187 G1 X159.073 Y179.258 E.12342
N6188 G1 X176.72 Y196.904 E.80249
N6189 G1 X180.558 Y196.904 E.12342
N6190 G1 X159.073 Y175.42 E.97703
N6191 G1 X159.073 Y171.582 E.12342
N6192 G1 X184.396 Y196.904 E1.15157
N6193 G1 X188.234 Y196.904 E.12342
N6194 G1 X159.073 Y167.744 E1.3261
N6195 G1 X159.073 Y163.906 E.12342
N6196 G1 X190.544 Y195.377 E1.43118
N6197 G1 X190.544 Y191.539 E.12342
N6198 G1 X159.073 Y160.068 E1.43118
N6199 G1 X159.073 Y156.23 E.12342
N6200 G1 X190.544 Y187.701 E1.43118
N6201 G1 X190.544 Y183.863 E.12342
N6202 G1 X159.073 Y152.392 E1.43118
N6203 G1 X159.073 Y148.554 E.12342
N6204 G1 X190.544 Y180.025 E1.43118
N6205 G1 X190.544 Y176.187 E.12342
N6206 G1 X159.073 Y144.716 E1.43118
N6207 G1 X159.073 Y140.878 E.12342
N6208 G1 X190.544 Y172.349 E1.43118
N6209 G1 X190.544 Y168.511 E.12342
N6210 G1 X159.073 Y137.04 E1.43118
N6211 G1 X159.073 Y133.202 E.12342
N6212 G1 X190.544 Y164.673 E1.43118
N6213 G1 X190.544 Y160.835 E.12342
N6214 G1 X159.073 Y129.364 E1.43118
N6215 G1 X159.073 Y125.526 E.12342
N6216 M73 P57 R14
N6217 G1 X190.544 Y156.997 E1.43118
N6218 G1 X190.544 Y153.159 E.12342
N6219 G1 X161.384 Y123.999 E1.3261
N6220 G1 X165.222 Y123.999 E.12342
N6221 G1 X190.544 Y149.321 E1.15157
N6222 G1 X190.544 Y145.483 E.12342
N6223 G1 X169.06 Y123.999 E.97703
N6224 G1 X172.898 Y123.999 E.12342
N6225 G1 X190.544 Y141.645 E.80249
N6226 G1 X190.544 Y137.807 E.12342
N6227 G1 X176.736 Y123.999 E.62796
N6228 G1 X180.574 Y123.999 E.12342
N6229 G1 X190.544 Y133.969 E.45342
N6230 G1 X190.544 Y130.131 E.12342
N6231 G1 X184.412 Y123.999 E.27889
N6232 G1 X188.25 Y123.999 E.12342
N6233 G1 X190.728 Y126.476 E.11268
N6234 ; WIPE_START
N6235 G1 X189.313 Y125.062 E-.76
N6236 ; WIPE_END
N6237 G1 E-.04 F1800
N6238 M204 S10000
N6239 G17
N6240 G3 Z5.4 I1.217 J0 P1  F60000
N6241 ; stop printing object, unique label id: 79
N6242 M625
N6243 ; object ids of layer 25 start: 79
N6244 M624 AQAAAAAAAAA=
N6245 ;======== H2D 20250213========
N6246 ; SKIPPABLE_START
N6247 ; SKIPTYPE: timelapse
N6248 M622.1 S1 ; for prev firware, default turned on
N6249 
N6250 M1002 judge_flag timelapse_record_flag
N6251 
N6252 M622 J1
N6253 M993 A2 B2 C2
N6254 M993 A0 B0 C0
N6255 
N6256 
N6257 M9712 E1 M0
N6258 M83
N6259 G1 Z5.4 F1200
N6260 M400
N6261 M9713
N6262 
N6263 
N6264 M9711 M0 E1 Z5.4 S11 C10 O0 T3000
N6265 
N6266 
N6267 M9712 E1 M0
N6268 G90
N6269 G1 Z8
N6270 G1 Y295 F30000
N6271 G1 Y265 F18000
N6272 M83
N6273 M9713
N6274 
N6275 M993 A3 B3 C3
N6276 
N6277 M623
N6278 ; SKIPPABLE_END
N6279 
N6280 ; object ids of this layer25 end: 79
N6281 M625
N6282 ; CHANGE_LAYER
N6283 ; Z_HEIGHT: 5.2
N6284 ; LAYER_HEIGHT: 0.2
N6285 ;======== H2D 20250521========
N6286 ; layer num/total_layer_count: 26/63
N6287 ; update layer progress
N6288 M73 L26
N6289 M991 S0 P25 ;notify layer change
N6290 
N6291 
N6292 M106 S73.95
N6293 ; OBJECT_ID: 79
N6294 ; COOLING_NODE: 0
N6295 ; start printing object, unique label id: 79
N6296 M624 AQAAAAAAAAA=
N6297 G1 X190.893 Y197.252 F60000
N6298 G1 Z5.2
N6299 G1 E.8 F1800
N6300 ; FEATURE: Inner wall
N6301 G1 F8475
N6302 M204 S8000
N6303 G1 X158.725 Y197.252 E1.03439
N6304 G1 X158.725 Y123.65 E2.36678
N6305 G1 X190.893 Y123.65 E1.03439
N6306 G1 X190.893 Y197.192 E2.36485
N6307 ; COOLING_NODE: 0
N6308 M204 S10000
N6309 G1 X191.3 Y197.659 F60000
N6310 G1 F8475
N6311 M204 S8000
N6312 G1 X158.318 Y197.659 E1.06057
N6313 G1 X158.318 Y123.243 E2.39296
N6314 G1 X191.3 Y123.243 E1.06057
N6315 G1 X191.3 Y197.599 E2.39103
N6316 ; COOLING_NODE: 0
N6317 M204 S10000
N6318 G1 X191.707 Y198.067 F60000
N6319 G1 F8475
N6320 M204 S8000
N6321 G1 X157.911 Y198.067 E1.08675
N6322 G1 X157.911 Y122.836 E2.41914
N6323 G1 X191.707 Y122.836 E1.08675
N6324 G1 X191.707 Y198.007 E2.41721
N6325 ; COOLING_NODE: 0
N6326 M204 S10000
N6327 G1 X192.099 Y198.459 F60000
N6328 ; FEATURE: Outer wall
N6329 ; LINE_WIDTH: 0.42
N6330 G1 F9149.261
N6331 M204 S5000
N6332 G1 X157.519 Y198.459 E1.03002
N6333 G1 X157.519 Y122.444 E2.26421
N6334 G1 X192.099 Y122.444 E1.03002
N6335 G1 X192.099 Y198.399 E2.26243
N6336 G1 E-.8 F1800
N6337 M204 S10000
N6338 G1 X188.067 Y197.087 Z5.6 F60000
N6339 G1 Z5.2
N6340 G1 E.8 F1800
N6341 ; FEATURE: Sparse infill
N6342 ; LINE_WIDTH: 0.45
N6343 G1 F8475
N6344 M204 S8000
N6345 G1 X190.544 Y194.609 E.11268
N6346 G1 X190.544 Y190.772 E.12342
N6347 G1 X184.412 Y196.904 E.27889
N6348 G1 X180.574 Y196.904 E.12342
N6349 G1 X190.544 Y186.934 E.45342
N6350 G1 X190.544 Y183.096 E.12342
N6351 G1 X176.736 Y196.904 E.62796
N6352 G1 X172.898 Y196.904 E.12342
N6353 G1 X190.544 Y179.258 E.80249
N6354 G1 X190.544 Y175.42 E.12342
N6355 G1 X169.06 Y196.904 E.97703
N6356 G1 X165.222 Y196.904 E.12342
N6357 G1 X190.544 Y171.582 E1.15157
N6358 G1 X190.544 Y167.744 E.12342
N6359 G1 X161.384 Y196.904 E1.3261
N6360 G1 X159.073 Y196.904 E.0743
N6361 G1 X159.073 Y195.377 E.04912
N6362 G1 X190.544 Y163.906 E1.43118
N6363 G1 X190.544 Y160.068 E.12342
N6364 G1 X159.073 Y191.539 E1.43118
N6365 G1 X159.073 Y187.701 E.12342
N6366 G1 X190.544 Y156.23 E1.43118
N6367 G1 X190.544 Y152.392 E.12342
N6368 G1 X159.073 Y183.863 E1.43118
N6369 G1 X159.073 Y180.025 E.12342
N6370 G1 X190.544 Y148.554 E1.43118
N6371 G1 X190.544 Y144.716 E.12342
N6372 G1 X159.073 Y176.187 E1.43118
N6373 G1 X159.073 Y172.349 E.12342
N6374 G1 X190.544 Y140.878 E1.43118
N6375 G1 X190.544 Y137.04 E.12342
N6376 G1 X159.073 Y168.511 E1.43118
N6377 G1 X159.073 Y164.673 E.12342
N6378 G1 X190.544 Y133.202 E1.43118
N6379 G1 X190.544 Y129.364 E.12342
N6380 G1 X159.073 Y160.835 E1.43118
N6381 G1 X159.073 Y156.997 E.12342
N6382 G1 X190.544 Y125.526 E1.43118
N6383 G1 X190.544 Y123.999 E.04912
N6384 G1 X188.234 Y123.999 E.0743
N6385 G1 X159.073 Y153.159 E1.3261
N6386 G1 X159.073 Y149.321 E.12342
N6387 G1 X184.396 Y123.999 E1.15157
N6388 G1 X180.558 Y123.999 E.12342
N6389 G1 X159.073 Y145.483 E.97703
N6390 G1 X159.073 Y141.645 E.12342
N6391 G1 X176.72 Y123.999 E.80249
N6392 G1 X172.882 Y123.999 E.12342
N6393 G1 X159.073 Y137.807 E.62796
N6394 G1 X159.073 Y133.969 E.12342
N6395 G1 X169.044 Y123.999 E.45342
N6396 G1 X165.206 Y123.999 E.12342
N6397 G1 X159.073 Y130.131 E.27889
N6398 G1 X159.073 Y126.293 E.12342
N6399 G1 X161.551 Y123.815 E.11268
N6400 ; WIPE_START
N6401 G1 X160.137 Y125.23 E-.76
N6402 ; WIPE_END
N6403 G1 E-.04 F1800
N6404 M204 S10000
N6405 G17
N6406 G3 Z5.6 I1.217 J0 P1  F60000
N6407 ; stop printing object, unique label id: 79
N6408 M625
N6409 ; object ids of layer 26 start: 79
N6410 M624 AQAAAAAAAAA=
N6411 ;======== H2D 20250213========
N6412 ; SKIPPABLE_START
N6413 ; SKIPTYPE: timelapse
N6414 M622.1 S1 ; for prev firware, default turned on
N6415 
N6416 M1002 judge_flag timelapse_record_flag
N6417 
N6418 M622 J1
N6419 M993 A2 B2 C2
N6420 M993 A0 B0 C0
N6421 
N6422 
N6423 M9712 E1 M0
N6424 M83
N6425 G1 Z5.6 F1200
N6426 M400
N6427 M9713
N6428 
N6429 
N6430 M9711 M0 E1 Z5.6 S11 C10 O0 T3000
N6431 
N6432 
N6433 M9712 E1 M0
N6434 G90
N6435 G1 Z8.2
N6436 G1 Y295 F30000
N6437 G1 Y265 F18000
N6438 M83
N6439 M9713
N6440 
N6441 M993 A3 B3 C3
N6442 
N6443 M623
N6444 ; SKIPPABLE_END
N6445 
N6446 ; object ids of this layer26 end: 79
N6447 M625
N6448 ; CHANGE_LAYER
N6449 ; Z_HEIGHT: 5.4
N6450 ; LAYER_HEIGHT: 0.2
N6451 ;======== H2D 20250521========
N6452 ; layer num/total_layer_count: 27/63
N6453 ; update layer progress
N6454 M73 L27
N6455 M991 S0 P26 ;notify layer change
N6456 
N6457 
N6458 M106 S71.4
N6459 ; OBJECT_ID: 79
N6460 ; COOLING_NODE: 0
N6461 ; start printing object, unique label id: 79
N6462 M624 AQAAAAAAAAA=
N6463 G1 X190.893 Y197.252 F60000
N6464 G1 Z5.4
N6465 G1 E.8 F1800
N6466 ; FEATURE: Inner wall
N6467 G1 F8475
N6468 M204 S8000
N6469 G1 X158.725 Y197.252 E1.03439
N6470 G1 X158.725 Y123.65 E2.36678
N6471 G1 X190.893 Y123.65 E1.03439
N6472 G1 X190.893 Y197.192 E2.36485
N6473 ; COOLING_NODE: 0
N6474 M204 S10000
N6475 G1 X191.3 Y197.659 F60000
N6476 G1 F8475
N6477 M204 S8000
N6478 G1 X158.318 Y197.659 E1.06057
N6479 M73 P58 R14
N6480 G1 X158.318 Y123.243 E2.39296
N6481 G1 X191.3 Y123.243 E1.06057
N6482 G1 X191.3 Y197.599 E2.39103
N6483 ; COOLING_NODE: 0
N6484 M204 S10000
N6485 G1 X191.707 Y198.067 F60000
N6486 G1 F8475
N6487 M204 S8000
N6488 G1 X157.911 Y198.067 E1.08675
N6489 G1 X157.911 Y122.836 E2.41914
N6490 G1 X191.707 Y122.836 E1.08675
N6491 G1 X191.707 Y198.007 E2.41721
N6492 ; COOLING_NODE: 0
N6493 M204 S10000
N6494 G1 X192.099 Y198.459 F60000
N6495 ; FEATURE: Outer wall
N6496 ; LINE_WIDTH: 0.42
N6497 G1 F9149.261
N6498 M204 S5000
N6499 G1 X157.519 Y198.459 E1.03002
N6500 G1 X157.519 Y122.444 E2.26421
N6501 G1 X192.099 Y122.444 E1.03002
N6502 G1 X192.099 Y198.399 E2.26243
N6503 G1 E-.8 F1800
N6504 M204 S10000
N6505 G1 X184.52 Y197.492 Z5.8 F60000
N6506 G1 X158.89 Y194.426 Z5.8
N6507 G1 Z5.4
N6508 G1 E.8 F1800
N6509 ; FEATURE: Sparse infill
N6510 ; LINE_WIDTH: 0.45
N6511 G1 F8475
N6512 M204 S8000
N6513 G1 X161.368 Y196.904 E.11268
N6514 G1 X165.206 Y196.904 E.12342
N6515 G1 X159.073 Y190.772 E.27889
N6516 G1 X159.073 Y186.934 E.12342
N6517 G1 X169.044 Y196.904 E.45342
N6518 G1 X172.882 Y196.904 E.12342
N6519 G1 X159.073 Y183.096 E.62796
N6520 G1 X159.073 Y179.258 E.12342
N6521 G1 X176.72 Y196.904 E.80249
N6522 G1 X180.558 Y196.904 E.12342
N6523 G1 X159.073 Y175.42 E.97703
N6524 G1 X159.073 Y171.582 E.12342
N6525 G1 X184.396 Y196.904 E1.15157
N6526 G1 X188.234 Y196.904 E.12342
N6527 G1 X159.073 Y167.744 E1.3261
N6528 G1 X159.073 Y163.906 E.12342
N6529 G1 X190.544 Y195.377 E1.43118
N6530 G1 X190.544 Y191.539 E.12342
N6531 G1 X159.073 Y160.068 E1.43118
N6532 G1 X159.073 Y156.23 E.12342
N6533 G1 X190.544 Y187.701 E1.43118
N6534 G1 X190.544 Y183.863 E.12342
N6535 G1 X159.073 Y152.392 E1.43118
N6536 G1 X159.073 Y148.554 E.12342
N6537 G1 X190.544 Y180.025 E1.43118
N6538 G1 X190.544 Y176.187 E.12342
N6539 G1 X159.073 Y144.716 E1.43118
N6540 G1 X159.073 Y140.878 E.12342
N6541 G1 X190.544 Y172.349 E1.43118
N6542 G1 X190.544 Y168.511 E.12342
N6543 G1 X159.073 Y137.04 E1.43118
N6544 G1 X159.073 Y133.202 E.12342
N6545 G1 X190.544 Y164.673 E1.43118
N6546 G1 X190.544 Y160.835 E.12342
N6547 G1 X159.073 Y129.364 E1.43118
N6548 G1 X159.073 Y125.526 E.12342
N6549 G1 X190.544 Y156.997 E1.43118
N6550 G1 X190.544 Y153.159 E.12342
N6551 G1 X161.384 Y123.999 E1.3261
N6552 G1 X165.222 Y123.999 E.12342
N6553 G1 X190.544 Y149.321 E1.15157
N6554 G1 X190.544 Y145.483 E.12342
N6555 G1 X169.06 Y123.999 E.97703
N6556 G1 X172.898 Y123.999 E.12342
N6557 M73 P58 R13
N6558 G1 X190.544 Y141.645 E.80249
N6559 G1 X190.544 Y137.807 E.12342
N6560 G1 X176.736 Y123.999 E.62796
N6561 G1 X180.574 Y123.999 E.12342
N6562 G1 X190.544 Y133.969 E.45342
N6563 G1 X190.544 Y130.131 E.12342
N6564 G1 X184.412 Y123.999 E.27889
N6565 G1 X188.25 Y123.999 E.12342
N6566 G1 X190.728 Y126.476 E.11268
N6567 ; WIPE_START
N6568 G1 X189.313 Y125.062 E-.76
N6569 ; WIPE_END
N6570 G1 E-.04 F1800
N6571 M204 S10000
N6572 G17
N6573 G3 Z5.8 I1.217 J0 P1  F60000
N6574 ; stop printing object, unique label id: 79
N6575 M625
N6576 ; object ids of layer 27 start: 79
N6577 M624 AQAAAAAAAAA=
N6578 ;======== H2D 20250213========
N6579 ; SKIPPABLE_START
N6580 ; SKIPTYPE: timelapse
N6581 M622.1 S1 ; for prev firware, default turned on
N6582 
N6583 M1002 judge_flag timelapse_record_flag
N6584 
N6585 M622 J1
N6586 M993 A2 B2 C2
N6587 M993 A0 B0 C0
N6588 
N6589 
N6590 M9712 E1 M0
N6591 M83
N6592 G1 Z5.8 F1200
N6593 M400
N6594 M9713
N6595 
N6596 
N6597 M9711 M0 E1 Z5.8 S11 C10 O0 T3000
N6598 
N6599 
N6600 M9712 E1 M0
N6601 G90
N6602 G1 Z8.4
N6603 G1 Y295 F30000
N6604 G1 Y265 F18000
N6605 M83
N6606 M9713
N6607 
N6608 M993 A3 B3 C3
N6609 
N6610 M623
N6611 ; SKIPPABLE_END
N6612 
N6613 ; object ids of this layer27 end: 79
N6614 M625
N6615 ; CHANGE_LAYER
N6616 ; Z_HEIGHT: 5.6
N6617 ; LAYER_HEIGHT: 0.2
N6618 ;======== H2D 20250521========
N6619 ; layer num/total_layer_count: 28/63
N6620 ; update layer progress
N6621 M73 L28
N6622 M991 S0 P27 ;notify layer change
N6623 
N6624 
N6625 M106 S73.95
N6626 ; OBJECT_ID: 79
N6627 ; COOLING_NODE: 0
N6628 ; start printing object, unique label id: 79
N6629 M624 AQAAAAAAAAA=
N6630 G1 X190.893 Y197.252 F60000
N6631 G1 Z5.6
N6632 G1 E.8 F1800
N6633 ; FEATURE: Inner wall
N6634 G1 F8475
N6635 M204 S8000
N6636 G1 X158.725 Y197.252 E1.03439
N6637 G1 X158.725 Y123.65 E2.36678
N6638 G1 X190.893 Y123.65 E1.03439
N6639 G1 X190.893 Y197.192 E2.36485
N6640 ; COOLING_NODE: 0
N6641 M204 S10000
N6642 G1 X191.3 Y197.659 F60000
N6643 G1 F8475
N6644 M204 S8000
N6645 G1 X158.318 Y197.659 E1.06057
N6646 G1 X158.318 Y123.243 E2.39296
N6647 G1 X191.3 Y123.243 E1.06057
N6648 G1 X191.3 Y197.599 E2.39103
N6649 ; COOLING_NODE: 0
N6650 M204 S10000
N6651 G1 X191.707 Y198.067 F60000
N6652 G1 F8475
N6653 M204 S8000
N6654 G1 X157.911 Y198.067 E1.08675
N6655 G1 X157.911 Y122.836 E2.41914
N6656 G1 X191.707 Y122.836 E1.08675
N6657 G1 X191.707 Y198.007 E2.41721
N6658 ; COOLING_NODE: 0
N6659 M204 S10000
N6660 G1 X192.099 Y198.459 F60000
N6661 ; FEATURE: Outer wall
N6662 ; LINE_WIDTH: 0.42
N6663 G1 F9149.261
N6664 M204 S5000
N6665 G1 X157.519 Y198.459 E1.03002
N6666 G1 X157.519 Y122.444 E2.26421
N6667 G1 X192.099 Y122.444 E1.03002
N6668 G1 X192.099 Y198.399 E2.26243
N6669 G1 E-.8 F1800
N6670 M204 S10000
N6671 G1 X188.067 Y197.087 Z6 F60000
N6672 G1 Z5.6
N6673 G1 E.8 F1800
N6674 ; FEATURE: Sparse infill
N6675 ; LINE_WIDTH: 0.45
N6676 M73 P59 R13
N6677 G1 F8475
N6678 M204 S8000
N6679 G1 X190.544 Y194.609 E.11268
N6680 G1 X190.544 Y190.772 E.12342
N6681 G1 X184.412 Y196.904 E.27889
N6682 G1 X180.574 Y196.904 E.12342
N6683 G1 X190.544 Y186.934 E.45342
N6684 G1 X190.544 Y183.096 E.12342
N6685 G1 X176.736 Y196.904 E.62796
N6686 G1 X172.898 Y196.904 E.12342
N6687 G1 X190.544 Y179.258 E.80249
N6688 G1 X190.544 Y175.42 E.12342
N6689 G1 X169.06 Y196.904 E.97703
N6690 G1 X165.222 Y196.904 E.12342
N6691 G1 X190.544 Y171.582 E1.15157
N6692 G1 X190.544 Y167.744 E.12342
N6693 G1 X161.384 Y196.904 E1.3261
N6694 G1 X159.073 Y196.904 E.0743
N6695 G1 X159.073 Y195.377 E.04912
N6696 G1 X190.544 Y163.906 E1.43118
N6697 G1 X190.544 Y160.068 E.12342
N6698 G1 X159.073 Y191.539 E1.43118
N6699 G1 X159.073 Y187.701 E.12342
N6700 G1 X190.544 Y156.23 E1.43118
N6701 G1 X190.544 Y152.392 E.12342
N6702 G1 X159.073 Y183.863 E1.43118
N6703 G1 X159.073 Y180.025 E.12342
N6704 G1 X190.544 Y148.554 E1.43118
N6705 G1 X190.544 Y144.716 E.12342
N6706 G1 X159.073 Y176.187 E1.43118
N6707 G1 X159.073 Y172.349 E.12342
N6708 G1 X190.544 Y140.878 E1.43118
N6709 G1 X190.544 Y137.04 E.12342
N6710 G1 X159.073 Y168.511 E1.43118
N6711 G1 X159.073 Y164.673 E.12342
N6712 G1 X190.544 Y133.202 E1.43118
N6713 G1 X190.544 Y129.364 E.12342
N6714 G1 X159.073 Y160.835 E1.43118
N6715 G1 X159.073 Y156.997 E.12342
N6716 G1 X190.544 Y125.526 E1.43118
N6717 G1 X190.544 Y123.999 E.04912
N6718 G1 X188.234 Y123.999 E.0743
N6719 G1 X159.073 Y153.159 E1.3261
N6720 G1 X159.073 Y149.321 E.12342
N6721 G1 X184.396 Y123.999 E1.15157
N6722 G1 X180.558 Y123.999 E.12342
N6723 G1 X159.073 Y145.483 E.97703
N6724 G1 X159.073 Y141.645 E.12342
N6725 G1 X176.72 Y123.999 E.80249
N6726 G1 X172.882 Y123.999 E.12342
N6727 G1 X159.073 Y137.807 E.62796
N6728 G1 X159.073 Y133.969 E.12342
N6729 G1 X169.044 Y123.999 E.45342
N6730 G1 X165.206 Y123.999 E.12342
N6731 G1 X159.073 Y130.131 E.27889
N6732 G1 X159.073 Y126.293 E.12342
N6733 G1 X161.551 Y123.815 E.11268
N6734 ; WIPE_START
N6735 G1 X160.137 Y125.23 E-.76
N6736 ; WIPE_END
N6737 G1 E-.04 F1800
N6738 M204 S10000
N6739 G17
N6740 G3 Z6 I1.217 J0 P1  F60000
N6741 ; stop printing object, unique label id: 79
N6742 M625
N6743 ; object ids of layer 28 start: 79
N6744 M624 AQAAAAAAAAA=
N6745 ;======== H2D 20250213========
N6746 ; SKIPPABLE_START
N6747 ; SKIPTYPE: timelapse
N6748 M622.1 S1 ; for prev firware, default turned on
N6749 
N6750 M1002 judge_flag timelapse_record_flag
N6751 
N6752 M622 J1
N6753 M993 A2 B2 C2
N6754 M993 A0 B0 C0
N6755 
N6756 
N6757 M9712 E1 M0
N6758 M83
N6759 G1 Z6 F1200
N6760 M400
N6761 M9713
N6762 
N6763 
N6764 M9711 M0 E1 Z6 S11 C10 O0 T3000
N6765 
N6766 
N6767 M9712 E1 M0
N6768 G90
N6769 G1 Z8.6
N6770 G1 Y295 F30000
N6771 G1 Y265 F18000
N6772 M83
N6773 M9713
N6774 
N6775 M993 A3 B3 C3
N6776 
N6777 M623
N6778 ; SKIPPABLE_END
N6779 
N6780 ; object ids of this layer28 end: 79
N6781 M625
N6782 ; CHANGE_LAYER
N6783 ; Z_HEIGHT: 5.8
N6784 ; LAYER_HEIGHT: 0.2
N6785 ;======== H2D 20250521========
N6786 ; layer num/total_layer_count: 29/63
N6787 ; update layer progress
N6788 M73 L29
N6789 M991 S0 P28 ;notify layer change
N6790 
N6791 
N6792 M106 S71.4
N6793 ; OBJECT_ID: 79
N6794 ; COOLING_NODE: 0
N6795 ; start printing object, unique label id: 79
N6796 M624 AQAAAAAAAAA=
N6797 G1 X190.893 Y197.252 F60000
N6798 G1 Z5.8
N6799 G1 E.8 F1800
N6800 ; FEATURE: Inner wall
N6801 G1 F8475
N6802 M204 S8000
N6803 G1 X158.725 Y197.252 E1.03439
N6804 G1 X158.725 Y123.65 E2.36678
N6805 G1 X190.893 Y123.65 E1.03439
N6806 G1 X190.893 Y197.192 E2.36485
N6807 ; COOLING_NODE: 0
N6808 M204 S10000
N6809 G1 X191.3 Y197.659 F60000
N6810 G1 F8475
N6811 M204 S8000
N6812 G1 X158.318 Y197.659 E1.06057
N6813 G1 X158.318 Y123.243 E2.39296
N6814 G1 X191.3 Y123.243 E1.06057
N6815 G1 X191.3 Y197.599 E2.39103
N6816 ; COOLING_NODE: 0
N6817 M204 S10000
N6818 G1 X191.707 Y198.067 F60000
N6819 G1 F8475
N6820 M204 S8000
N6821 G1 X157.911 Y198.067 E1.08675
N6822 G1 X157.911 Y122.836 E2.41914
N6823 G1 X191.707 Y122.836 E1.08675
N6824 G1 X191.707 Y198.007 E2.41721
N6825 ; COOLING_NODE: 0
N6826 M204 S10000
N6827 G1 X192.099 Y198.459 F60000
N6828 ; FEATURE: Outer wall
N6829 ; LINE_WIDTH: 0.42
N6830 G1 F9149.261
N6831 M204 S5000
N6832 G1 X157.519 Y198.459 E1.03002
N6833 G1 X157.519 Y122.444 E2.26421
N6834 G1 X192.099 Y122.444 E1.03002
N6835 G1 X192.099 Y198.399 E2.26243
N6836 G1 E-.8 F1800
N6837 M204 S10000
N6838 G1 X184.52 Y197.492 Z6.2 F60000
N6839 G1 X158.89 Y194.426 Z6.2
N6840 G1 Z5.8
N6841 G1 E.8 F1800
N6842 ; FEATURE: Sparse infill
N6843 ; LINE_WIDTH: 0.45
N6844 G1 F8475
N6845 M204 S8000
N6846 G1 X161.368 Y196.904 E.11268
N6847 G1 X165.206 Y196.904 E.12342
N6848 G1 X159.073 Y190.772 E.27889
N6849 G1 X159.073 Y186.934 E.12342
N6850 G1 X169.044 Y196.904 E.45342
N6851 G1 X172.882 Y196.904 E.12342
N6852 G1 X159.073 Y183.096 E.62796
N6853 G1 X159.073 Y179.258 E.12342
N6854 G1 X176.72 Y196.904 E.80249
N6855 G1 X180.558 Y196.904 E.12342
N6856 G1 X159.073 Y175.42 E.97703
N6857 G1 X159.073 Y171.582 E.12342
N6858 G1 X184.396 Y196.904 E1.15157
N6859 G1 X188.234 Y196.904 E.12342
N6860 G1 X159.073 Y167.744 E1.3261
N6861 G1 X159.073 Y163.906 E.12342
N6862 G1 X190.544 Y195.377 E1.43118
N6863 G1 X190.544 Y191.539 E.12342
N6864 G1 X159.073 Y160.068 E1.43118
N6865 G1 X159.073 Y156.23 E.12342
N6866 G1 X190.544 Y187.701 E1.43118
N6867 G1 X190.544 Y183.863 E.12342
N6868 G1 X159.073 Y152.392 E1.43118
N6869 G1 X159.073 Y148.554 E.12342
N6870 G1 X190.544 Y180.025 E1.43118
N6871 G1 X190.544 Y176.187 E.12342
N6872 G1 X159.073 Y144.716 E1.43118
N6873 G1 X159.073 Y140.878 E.12342
N6874 G1 X190.544 Y172.349 E1.43118
N6875 G1 X190.544 Y168.511 E.12342
N6876 G1 X159.073 Y137.04 E1.43118
N6877 G1 X159.073 Y133.202 E.12342
N6878 G1 X190.544 Y164.673 E1.43118
N6879 G1 X190.544 Y160.835 E.12342
N6880 G1 X159.073 Y129.364 E1.43118
N6881 G1 X159.073 Y125.526 E.12342
N6882 M73 P60 R13
N6883 G1 X190.544 Y156.997 E1.43118
N6884 G1 X190.544 Y153.159 E.12342
N6885 G1 X161.384 Y123.999 E1.3261
N6886 G1 X165.222 Y123.999 E.12342
N6887 G1 X190.544 Y149.321 E1.15157
N6888 G1 X190.544 Y145.483 E.12342
N6889 G1 X169.06 Y123.999 E.97703
N6890 G1 X172.898 Y123.999 E.12342
N6891 G1 X190.544 Y141.645 E.80249
N6892 G1 X190.544 Y137.807 E.12342
N6893 G1 X176.736 Y123.999 E.62796
N6894 G1 X180.574 Y123.999 E.12342
N6895 G1 X190.544 Y133.969 E.45342
N6896 G1 X190.544 Y130.131 E.12342
N6897 G1 X184.412 Y123.999 E.27889
N6898 G1 X188.25 Y123.999 E.12342
N6899 G1 X190.728 Y126.476 E.11268
N6900 ; WIPE_START
N6901 G1 X189.313 Y125.062 E-.76
N6902 ; WIPE_END
N6903 G1 E-.04 F1800
N6904 M204 S10000
N6905 G17
N6906 G3 Z6.2 I1.217 J0 P1  F60000
N6907 ; stop printing object, unique label id: 79
N6908 M625
N6909 ; object ids of layer 29 start: 79
N6910 M624 AQAAAAAAAAA=
N6911 ;======== H2D 20250213========
N6912 ; SKIPPABLE_START
N6913 ; SKIPTYPE: timelapse
N6914 M622.1 S1 ; for prev firware, default turned on
N6915 
N6916 M1002 judge_flag timelapse_record_flag
N6917 
N6918 M622 J1
N6919 M993 A2 B2 C2
N6920 M993 A0 B0 C0
N6921 
N6922 
N6923 M9712 E1 M0
N6924 M83
N6925 G1 Z6.2 F1200
N6926 M400
N6927 M9713
N6928 
N6929 
N6930 M9711 M0 E1 Z6.2 S11 C10 O0 T3000
N6931 
N6932 
N6933 M9712 E1 M0
N6934 G90
N6935 G1 Z8.8
N6936 G1 Y295 F30000
N6937 G1 Y265 F18000
N6938 M83
N6939 M9713
N6940 
N6941 M993 A3 B3 C3
N6942 
N6943 M623
N6944 ; SKIPPABLE_END
N6945 
N6946 ; object ids of this layer29 end: 79
N6947 M625
N6948 ; CHANGE_LAYER
N6949 ; Z_HEIGHT: 6
N6950 ; LAYER_HEIGHT: 0.2
N6951 ;======== H2D 20250521========
N6952 ; layer num/total_layer_count: 30/63
N6953 ; update layer progress
N6954 M73 L30
N6955 M991 S0 P29 ;notify layer change
N6956 
N6957 
N6958 M106 S73.95
N6959 ; OBJECT_ID: 79
N6960 ; COOLING_NODE: 0
N6961 ; start printing object, unique label id: 79
N6962 M624 AQAAAAAAAAA=
N6963 G1 X190.893 Y197.252 F60000
N6964 G1 Z6
N6965 G1 E.8 F1800
N6966 ; FEATURE: Inner wall
N6967 G1 F8475
N6968 M204 S8000
N6969 G1 X158.725 Y197.252 E1.03439
N6970 G1 X158.725 Y123.65 E2.36678
N6971 G1 X190.893 Y123.65 E1.03439
N6972 G1 X190.893 Y197.192 E2.36485
N6973 ; COOLING_NODE: 0
N6974 M204 S10000
N6975 G1 X191.3 Y197.659 F60000
N6976 G1 F8475
N6977 M204 S8000
N6978 G1 X158.318 Y197.659 E1.06057
N6979 G1 X158.318 Y123.243 E2.39296
N6980 G1 X191.3 Y123.243 E1.06057
N6981 G1 X191.3 Y197.599 E2.39103
N6982 ; COOLING_NODE: 0
N6983 M204 S10000
N6984 G1 X191.707 Y198.067 F60000
N6985 G1 F8475
N6986 M204 S8000
N6987 G1 X157.911 Y198.067 E1.08675
N6988 G1 X157.911 Y122.836 E2.41914
N6989 G1 X191.707 Y122.836 E1.08675
N6990 G1 X191.707 Y198.007 E2.41721
N6991 ; COOLING_NODE: 0
N6992 M204 S10000
N6993 G1 X192.099 Y198.459 F60000
N6994 ; FEATURE: Outer wall
N6995 ; LINE_WIDTH: 0.42
N6996 G1 F9149.261
N6997 M204 S5000
N6998 G1 X157.519 Y198.459 E1.03002
N6999 G1 X157.519 Y122.444 E2.26421
N7000 G1 X192.099 Y122.444 E1.03002
N7001 G1 X192.099 Y198.399 E2.26243
N7002 G1 E-.8 F1800
N7003 M204 S10000
N7004 G1 X188.067 Y197.087 Z6.4 F60000
N7005 G1 Z6
N7006 G1 E.8 F1800
N7007 ; FEATURE: Sparse infill
N7008 ; LINE_WIDTH: 0.45
N7009 G1 F8475
N7010 M204 S8000
N7011 G1 X190.544 Y194.609 E.11268
N7012 G1 X190.544 Y190.772 E.12342
N7013 G1 X184.412 Y196.904 E.27889
N7014 G1 X180.574 Y196.904 E.12342
N7015 G1 X190.544 Y186.934 E.45342
N7016 G1 X190.544 Y183.096 E.12342
N7017 G1 X176.736 Y196.904 E.62796
N7018 G1 X172.898 Y196.904 E.12342
N7019 G1 X190.544 Y179.258 E.80249
N7020 G1 X190.544 Y175.42 E.12342
N7021 G1 X169.06 Y196.904 E.97703
N7022 G1 X165.222 Y196.904 E.12342
N7023 G1 X190.544 Y171.582 E1.15157
N7024 G1 X190.544 Y167.744 E.12342
N7025 G1 X161.384 Y196.904 E1.3261
N7026 G1 X159.073 Y196.904 E.0743
N7027 G1 X159.073 Y195.377 E.04912
N7028 G1 X190.544 Y163.906 E1.43118
N7029 G1 X190.544 Y160.068 E.12342
N7030 G1 X159.073 Y191.539 E1.43118
N7031 G1 X159.073 Y187.701 E.12342
N7032 G1 X190.544 Y156.23 E1.43118
N7033 G1 X190.544 Y152.392 E.12342
N7034 G1 X159.073 Y183.863 E1.43118
N7035 G1 X159.073 Y180.025 E.12342
N7036 G1 X190.544 Y148.554 E1.43118
N7037 G1 X190.544 Y144.716 E.12342
N7038 G1 X159.073 Y176.187 E1.43118
N7039 G1 X159.073 Y172.349 E.12342
N7040 G1 X190.544 Y140.878 E1.43118
N7041 G1 X190.544 Y137.04 E.12342
N7042 G1 X159.073 Y168.511 E1.43118
N7043 G1 X159.073 Y164.673 E.12342
N7044 G1 X190.544 Y133.202 E1.43118
N7045 G1 X190.544 Y129.364 E.12342
N7046 G1 X159.073 Y160.835 E1.43118
N7047 G1 X159.073 Y156.997 E.12342
N7048 G1 X190.544 Y125.526 E1.43118
N7049 G1 X190.544 Y123.999 E.04912
N7050 G1 X188.234 Y123.999 E.0743
N7051 G1 X159.073 Y153.159 E1.3261
N7052 G1 X159.073 Y149.321 E.12342
N7053 G1 X184.396 Y123.999 E1.15157
N7054 G1 X180.558 Y123.999 E.12342
N7055 G1 X159.073 Y145.483 E.97703
N7056 G1 X159.073 Y141.645 E.12342
N7057 G1 X176.72 Y123.999 E.80249
N7058 G1 X172.882 Y123.999 E.12342
N7059 G1 X159.073 Y137.807 E.62796
N7060 G1 X159.073 Y133.969 E.12342
N7061 G1 X169.044 Y123.999 E.45342
N7062 G1 X165.206 Y123.999 E.12342
N7063 G1 X159.073 Y130.131 E.27889
N7064 G1 X159.073 Y126.293 E.12342
N7065 G1 X161.551 Y123.815 E.11268
N7066 ; WIPE_START
N7067 G1 X160.137 Y125.23 E-.76
N7068 ; WIPE_END
N7069 G1 E-.04 F1800
N7070 M204 S10000
N7071 G17
N7072 G3 Z6.4 I1.217 J0 P1  F60000
N7073 ; stop printing object, unique label id: 79
N7074 M625
N7075 ; object ids of layer 30 start: 79
N7076 M624 AQAAAAAAAAA=
N7077 ;======== H2D 20250213========
N7078 ; SKIPPABLE_START
N7079 ; SKIPTYPE: timelapse
N7080 M622.1 S1 ; for prev firware, default turned on
N7081 
N7082 M1002 judge_flag timelapse_record_flag
N7083 
N7084 M622 J1
N7085 M993 A2 B2 C2
N7086 M993 A0 B0 C0
N7087 
N7088 
N7089 M9712 E1 M0
N7090 M83
N7091 G1 Z6.4 F1200
N7092 M400
N7093 M9713
N7094 
N7095 
N7096 M9711 M0 E1 Z6.4 S11 C10 O0 T3000
N7097 
N7098 
N7099 M9712 E1 M0
N7100 G90
N7101 G1 Z9
N7102 G1 Y295 F30000
N7103 G1 Y265 F18000
N7104 M83
N7105 M9713
N7106 
N7107 M993 A3 B3 C3
N7108 
N7109 M623
N7110 ; SKIPPABLE_END
N7111 
N7112 ; object ids of this layer30 end: 79
N7113 M625
N7114 ; CHANGE_LAYER
N7115 ; Z_HEIGHT: 6.2
N7116 ; LAYER_HEIGHT: 0.2
N7117 ;======== H2D 20250521========
N7118 ; layer num/total_layer_count: 31/63
N7119 ; update layer progress
N7120 M73 L31
N7121 M991 S0 P30 ;notify layer change
N7122 
N7123 
N7124 M106 S71.4
N7125 ; OBJECT_ID: 79
N7126 ; COOLING_NODE: 0
N7127 ; start printing object, unique label id: 79
N7128 M624 AQAAAAAAAAA=
N7129 G1 X190.893 Y197.252 F60000
N7130 G1 Z6.2
N7131 G1 E.8 F1800
N7132 ; FEATURE: Inner wall
N7133 G1 F8475
N7134 M204 S8000
N7135 G1 X158.725 Y197.252 E1.03439
N7136 G1 X158.725 Y123.65 E2.36678
N7137 G1 X190.893 Y123.65 E1.03439
N7138 G1 X190.893 Y197.192 E2.36485
N7139 ; COOLING_NODE: 0
N7140 M204 S10000
N7141 G1 X191.3 Y197.659 F60000
N7142 G1 F8475
N7143 M204 S8000
N7144 G1 X158.318 Y197.659 E1.06057
N7145 M73 P61 R13
N7146 G1 X158.318 Y123.243 E2.39296
N7147 G1 X191.3 Y123.243 E1.06057
N7148 G1 X191.3 Y197.599 E2.39103
N7149 ; COOLING_NODE: 0
N7150 M204 S10000
N7151 G1 X191.707 Y198.067 F60000
N7152 G1 F8475
N7153 M204 S8000
N7154 G1 X157.911 Y198.067 E1.08675
N7155 G1 X157.911 Y122.836 E2.41914
N7156 G1 X191.707 Y122.836 E1.08675
N7157 G1 X191.707 Y198.007 E2.41721
N7158 ; COOLING_NODE: 0
N7159 M204 S10000
N7160 G1 X192.099 Y198.459 F60000
N7161 ; FEATURE: Outer wall
N7162 ; LINE_WIDTH: 0.42
N7163 G1 F9149.261
N7164 M204 S5000
N7165 G1 X157.519 Y198.459 E1.03002
N7166 G1 X157.519 Y122.444 E2.26421
N7167 G1 X192.099 Y122.444 E1.03002
N7168 G1 X192.099 Y198.399 E2.26243
N7169 G1 E-.8 F1800
N7170 M204 S10000
N7171 G1 X184.52 Y197.492 Z6.6 F60000
N7172 G1 X158.89 Y194.426 Z6.6
N7173 G1 Z6.2
N7174 G1 E.8 F1800
N7175 ; FEATURE: Sparse infill
N7176 ; LINE_WIDTH: 0.45
N7177 G1 F8475
N7178 M204 S8000
N7179 G1 X161.368 Y196.904 E.11268
N7180 G1 X165.206 Y196.904 E.12342
N7181 G1 X159.073 Y190.772 E.27889
N7182 G1 X159.073 Y186.934 E.12342
N7183 G1 X169.044 Y196.904 E.45342
N7184 G1 X172.882 Y196.904 E.12342
N7185 G1 X159.073 Y183.096 E.62796
N7186 G1 X159.073 Y179.258 E.12342
N7187 G1 X176.72 Y196.904 E.80249
N7188 G1 X180.558 Y196.904 E.12342
N7189 G1 X159.073 Y175.42 E.97703
N7190 G1 X159.073 Y171.582 E.12342
N7191 G1 X184.396 Y196.904 E1.15157
N7192 G1 X188.234 Y196.904 E.12342
N7193 G1 X159.073 Y167.744 E1.3261
N7194 G1 X159.073 Y163.906 E.12342
N7195 G1 X190.544 Y195.377 E1.43118
N7196 G1 X190.544 Y191.539 E.12342
N7197 G1 X159.073 Y160.068 E1.43118
N7198 G1 X159.073 Y156.23 E.12342
N7199 G1 X190.544 Y187.701 E1.43118
N7200 G1 X190.544 Y183.863 E.12342
N7201 G1 X159.073 Y152.392 E1.43118
N7202 G1 X159.073 Y148.554 E.12342
N7203 G1 X190.544 Y180.025 E1.43118
N7204 G1 X190.544 Y176.187 E.12342
N7205 G1 X159.073 Y144.716 E1.43118
N7206 G1 X159.073 Y140.878 E.12342
N7207 G1 X190.544 Y172.349 E1.43118
N7208 G1 X190.544 Y168.511 E.12342
N7209 G1 X159.073 Y137.04 E1.43118
N7210 G1 X159.073 Y133.202 E.12342
N7211 G1 X190.544 Y164.673 E1.43118
N7212 G1 X190.544 Y160.835 E.12342
N7213 G1 X159.073 Y129.364 E1.43118
N7214 G1 X159.073 Y125.526 E.12342
N7215 G1 X190.544 Y156.997 E1.43118
N7216 G1 X190.544 Y153.159 E.12342
N7217 G1 X161.384 Y123.999 E1.3261
N7218 M73 P61 R12
N7219 G1 X165.222 Y123.999 E.12342
N7220 G1 X190.544 Y149.321 E1.15157
N7221 G1 X190.544 Y145.483 E.12342
N7222 G1 X169.06 Y123.999 E.97703
N7223 G1 X172.898 Y123.999 E.12342
N7224 G1 X190.544 Y141.645 E.80249
N7225 G1 X190.544 Y137.807 E.12342
N7226 G1 X176.736 Y123.999 E.62796
N7227 G1 X180.574 Y123.999 E.12342
N7228 G1 X190.544 Y133.969 E.45342
N7229 G1 X190.544 Y130.131 E.12342
N7230 G1 X184.412 Y123.999 E.27889
N7231 G1 X188.25 Y123.999 E.12342
N7232 G1 X190.728 Y126.476 E.11268
N7233 ; WIPE_START
N7234 G1 X189.313 Y125.062 E-.76
N7235 ; WIPE_END
N7236 G1 E-.04 F1800
N7237 M204 S10000
N7238 G17
N7239 G3 Z6.6 I1.217 J0 P1  F60000
N7240 ; stop printing object, unique label id: 79
N7241 M625
N7242 ; object ids of layer 31 start: 79
N7243 M624 AQAAAAAAAAA=
N7244 ;======== H2D 20250213========
N7245 ; SKIPPABLE_START
N7246 ; SKIPTYPE: timelapse
N7247 M622.1 S1 ; for prev firware, default turned on
N7248 
N7249 M1002 judge_flag timelapse_record_flag
N7250 
N7251 M622 J1
N7252 M993 A2 B2 C2
N7253 M993 A0 B0 C0
N7254 
N7255 
N7256 M9712 E1 M0
N7257 M83
N7258 G1 Z6.6 F1200
N7259 M400
N7260 M9713
N7261 
N7262 
N7263 M9711 M0 E1 Z6.6 S11 C10 O0 T3000
N7264 
N7265 
N7266 M9712 E1 M0
N7267 G90
N7268 G1 Z9.2
N7269 G1 Y295 F30000
N7270 G1 Y265 F18000
N7271 M83
N7272 M9713
N7273 
N7274 M993 A3 B3 C3
N7275 
N7276 M623
N7277 ; SKIPPABLE_END
N7278 
N7279 ; object ids of this layer31 end: 79
N7280 M625
N7281 ; CHANGE_LAYER
N7282 ; Z_HEIGHT: 6.4
N7283 ; LAYER_HEIGHT: 0.2
N7284 ;======== H2D 20250521========
N7285 ; layer num/total_layer_count: 32/63
N7286 ; update layer progress
N7287 M73 L32
N7288 M991 S0 P31 ;notify layer change
N7289 
N7290 
N7291 M106 S73.95
N7292 ; OBJECT_ID: 79
N7293 ; COOLING_NODE: 0
N7294 ; start printing object, unique label id: 79
N7295 M624 AQAAAAAAAAA=
N7296 G1 X190.893 Y197.252 F60000
N7297 G1 Z6.4
N7298 G1 E.8 F1800
N7299 ; FEATURE: Inner wall
N7300 G1 F8475
N7301 M204 S8000
N7302 G1 X158.725 Y197.252 E1.03439
N7303 G1 X158.725 Y123.65 E2.36678
N7304 G1 X190.893 Y123.65 E1.03439
N7305 G1 X190.893 Y197.192 E2.36485
N7306 ; COOLING_NODE: 0
N7307 M204 S10000
N7308 G1 X191.3 Y197.659 F60000
N7309 G1 F8475
N7310 M204 S8000
N7311 G1 X158.318 Y197.659 E1.06057
N7312 G1 X158.318 Y123.243 E2.39296
N7313 G1 X191.3 Y123.243 E1.06057
N7314 G1 X191.3 Y197.599 E2.39103
N7315 ; COOLING_NODE: 0
N7316 M204 S10000
N7317 G1 X191.707 Y198.067 F60000
N7318 G1 F8475
N7319 M204 S8000
N7320 G1 X157.911 Y198.067 E1.08675
N7321 G1 X157.911 Y122.836 E2.41914
N7322 G1 X191.707 Y122.836 E1.08675
N7323 G1 X191.707 Y198.007 E2.41721
N7324 ; COOLING_NODE: 0
N7325 M204 S10000
N7326 G1 X192.099 Y198.459 F60000
N7327 ; FEATURE: Outer wall
N7328 ; LINE_WIDTH: 0.42
N7329 G1 F9149.261
N7330 M204 S5000
N7331 G1 X157.519 Y198.459 E1.03002
N7332 G1 X157.519 Y122.444 E2.26421
N7333 G1 X192.099 Y122.444 E1.03002
N7334 G1 X192.099 Y198.399 E2.26243
N7335 G1 E-.8 F1800
N7336 M204 S10000
N7337 G1 X188.067 Y197.087 Z6.8 F60000
N7338 G1 Z6.4
N7339 M73 P62 R12
N7340 G1 E.8 F1800
N7341 ; FEATURE: Sparse infill
N7342 ; LINE_WIDTH: 0.45
N7343 G1 F8475
N7344 M204 S8000
N7345 G1 X190.544 Y194.609 E.11268
N7346 G1 X190.544 Y190.772 E.12342
N7347 G1 X184.412 Y196.904 E.27889
N7348 G1 X180.574 Y196.904 E.12342
N7349 G1 X190.544 Y186.934 E.45342
N7350 G1 X190.544 Y183.096 E.12342
N7351 G1 X176.736 Y196.904 E.62796
N7352 G1 X172.898 Y196.904 E.12342
N7353 G1 X190.544 Y179.258 E.80249
N7354 G1 X190.544 Y175.42 E.12342
N7355 G1 X169.06 Y196.904 E.97703
N7356 G1 X165.222 Y196.904 E.12342
N7357 G1 X190.544 Y171.582 E1.15157
N7358 G1 X190.544 Y167.744 E.12342
N7359 G1 X161.384 Y196.904 E1.3261
N7360 G1 X159.073 Y196.904 E.0743
N7361 G1 X159.073 Y195.377 E.04912
N7362 G1 X190.544 Y163.906 E1.43118
N7363 G1 X190.544 Y160.068 E.12342
N7364 G1 X159.073 Y191.539 E1.43118
N7365 G1 X159.073 Y187.701 E.12342
N7366 G1 X190.544 Y156.23 E1.43118
N7367 G1 X190.544 Y152.392 E.12342
N7368 G1 X159.073 Y183.863 E1.43118
N7369 G1 X159.073 Y180.025 E.12342
N7370 G1 X190.544 Y148.554 E1.43118
N7371 G1 X190.544 Y144.716 E.12342
N7372 G1 X159.073 Y176.187 E1.43118
N7373 G1 X159.073 Y172.349 E.12342
N7374 G1 X190.544 Y140.878 E1.43118
N7375 G1 X190.544 Y137.04 E.12342
N7376 G1 X159.073 Y168.511 E1.43118
N7377 G1 X159.073 Y164.673 E.12342
N7378 G1 X190.544 Y133.202 E1.43118
N7379 G1 X190.544 Y129.364 E.12342
N7380 G1 X159.073 Y160.835 E1.43118
N7381 G1 X159.073 Y156.997 E.12342
N7382 G1 X190.544 Y125.526 E1.43118
N7383 G1 X190.544 Y123.999 E.04912
N7384 G1 X188.234 Y123.999 E.0743
N7385 G1 X159.073 Y153.159 E1.3261
N7386 G1 X159.073 Y149.321 E.12342
N7387 G1 X184.396 Y123.999 E1.15157
N7388 G1 X180.558 Y123.999 E.12342
N7389 G1 X159.073 Y145.483 E.97703
N7390 G1 X159.073 Y141.645 E.12342
N7391 G1 X176.72 Y123.999 E.80249
N7392 G1 X172.882 Y123.999 E.12342
N7393 G1 X159.073 Y137.807 E.62796
N7394 G1 X159.073 Y133.969 E.12342
N7395 G1 X169.044 Y123.999 E.45342
N7396 G1 X165.206 Y123.999 E.12342
N7397 G1 X159.073 Y130.131 E.27889
N7398 G1 X159.073 Y126.293 E.12342
N7399 G1 X161.551 Y123.815 E.11268
N7400 ; WIPE_START
N7401 G1 X160.137 Y125.23 E-.76
N7402 ; WIPE_END
N7403 G1 E-.04 F1800
N7404 M204 S10000
N7405 G17
N7406 G3 Z6.8 I1.217 J0 P1  F60000
N7407 ; stop printing object, unique label id: 79
N7408 M625
N7409 ; object ids of layer 32 start: 79
N7410 M624 AQAAAAAAAAA=
N7411 ;======== H2D 20250213========
N7412 ; SKIPPABLE_START
N7413 ; SKIPTYPE: timelapse
N7414 M622.1 S1 ; for prev firware, default turned on
N7415 
N7416 M1002 judge_flag timelapse_record_flag
N7417 
N7418 M622 J1
N7419 M993 A2 B2 C2
N7420 M993 A0 B0 C0
N7421 
N7422 
N7423 M9712 E1 M0
N7424 M83
N7425 G1 Z6.8 F1200
N7426 M400
N7427 M9713
N7428 
N7429 
N7430 M9711 M0 E1 Z6.8 S11 C10 O0 T3000
N7431 
N7432 
N7433 M9712 E1 M0
N7434 G90
N7435 G1 Z9.4
N7436 G1 Y295 F30000
N7437 G1 Y265 F18000
N7438 M83
N7439 M9713
N7440 
N7441 M993 A3 B3 C3
N7442 
N7443 M623
N7444 ; SKIPPABLE_END
N7445 
N7446 ; object ids of this layer32 end: 79
N7447 M625
N7448 ; CHANGE_LAYER
N7449 ; Z_HEIGHT: 6.6
N7450 ; LAYER_HEIGHT: 0.2
N7451 ;======== H2D 20250521========
N7452 ; layer num/total_layer_count: 33/63
N7453 ; update layer progress
N7454 M73 L33
N7455 M991 S0 P32 ;notify layer change
N7456 
N7457 
N7458 M106 S71.4
N7459 ; OBJECT_ID: 79
N7460 ; COOLING_NODE: 0
N7461 ; start printing object, unique label id: 79
N7462 M624 AQAAAAAAAAA=
N7463 G1 X190.893 Y197.252 F60000
N7464 G1 Z6.6
N7465 G1 E.8 F1800
N7466 ; FEATURE: Inner wall
N7467 G1 F8475
N7468 M204 S8000
N7469 G1 X158.725 Y197.252 E1.03439
N7470 G1 X158.725 Y123.65 E2.36678
N7471 G1 X190.893 Y123.65 E1.03439
N7472 G1 X190.893 Y197.192 E2.36485
N7473 ; COOLING_NODE: 0
N7474 M204 S10000
N7475 G1 X191.3 Y197.659 F60000
N7476 G1 F8475
N7477 M204 S8000
N7478 G1 X158.318 Y197.659 E1.06057
N7479 G1 X158.318 Y123.243 E2.39296
N7480 G1 X191.3 Y123.243 E1.06057
N7481 G1 X191.3 Y197.599 E2.39103
N7482 ; COOLING_NODE: 0
N7483 M204 S10000
N7484 G1 X191.707 Y198.067 F60000
N7485 G1 F8475
N7486 M204 S8000
N7487 G1 X157.911 Y198.067 E1.08675
N7488 G1 X157.911 Y122.836 E2.41914
N7489 G1 X191.707 Y122.836 E1.08675
N7490 G1 X191.707 Y198.007 E2.41721
N7491 ; COOLING_NODE: 0
N7492 M204 S10000
N7493 G1 X192.099 Y198.459 F60000
N7494 ; FEATURE: Outer wall
N7495 ; LINE_WIDTH: 0.42
N7496 G1 F9149.261
N7497 M204 S5000
N7498 G1 X157.519 Y198.459 E1.03002
N7499 G1 X157.519 Y122.444 E2.26421
N7500 G1 X192.099 Y122.444 E1.03002
N7501 G1 X192.099 Y198.399 E2.26243
N7502 G1 E-.8 F1800
N7503 M204 S10000
N7504 G1 X184.52 Y197.492 Z7 F60000
N7505 G1 X158.89 Y194.426 Z7
N7506 G1 Z6.6
N7507 G1 E.8 F1800
N7508 ; FEATURE: Sparse infill
N7509 ; LINE_WIDTH: 0.45
N7510 G1 F8475
N7511 M204 S8000
N7512 G1 X161.368 Y196.904 E.11268
N7513 G1 X165.206 Y196.904 E.12342
N7514 G1 X159.073 Y190.772 E.27889
N7515 G1 X159.073 Y186.934 E.12342
N7516 G1 X169.044 Y196.904 E.45342
N7517 G1 X172.882 Y196.904 E.12342
N7518 G1 X159.073 Y183.096 E.62796
N7519 G1 X159.073 Y179.258 E.12342
N7520 G1 X176.72 Y196.904 E.80249
N7521 G1 X180.558 Y196.904 E.12342
N7522 G1 X159.073 Y175.42 E.97703
N7523 G1 X159.073 Y171.582 E.12342
N7524 G1 X184.396 Y196.904 E1.15157
N7525 G1 X188.234 Y196.904 E.12342
N7526 G1 X159.073 Y167.744 E1.3261
N7527 G1 X159.073 Y163.906 E.12342
N7528 G1 X190.544 Y195.377 E1.43118
N7529 G1 X190.544 Y191.539 E.12342
N7530 G1 X159.073 Y160.068 E1.43118
N7531 G1 X159.073 Y156.23 E.12342
N7532 G1 X190.544 Y187.701 E1.43118
N7533 G1 X190.544 Y183.863 E.12342
N7534 G1 X159.073 Y152.392 E1.43118
N7535 G1 X159.073 Y148.554 E.12342
N7536 G1 X190.544 Y180.025 E1.43118
N7537 G1 X190.544 Y176.187 E.12342
N7538 G1 X159.073 Y144.716 E1.43118
N7539 G1 X159.073 Y140.878 E.12342
N7540 G1 X190.544 Y172.349 E1.43118
N7541 G1 X190.544 Y168.511 E.12342
N7542 G1 X159.073 Y137.04 E1.43118
N7543 G1 X159.073 Y133.202 E.12342
N7544 G1 X190.544 Y164.673 E1.43118
N7545 G1 X190.544 Y160.835 E.12342
N7546 G1 X159.073 Y129.364 E1.43118
N7547 G1 X159.073 Y125.526 E.12342
N7548 M73 P63 R12
N7549 G1 X190.544 Y156.997 E1.43118
N7550 G1 X190.544 Y153.159 E.12342
N7551 G1 X161.384 Y123.999 E1.3261
N7552 G1 X165.222 Y123.999 E.12342
N7553 G1 X190.544 Y149.321 E1.15157
N7554 G1 X190.544 Y145.483 E.12342
N7555 G1 X169.06 Y123.999 E.97703
N7556 G1 X172.898 Y123.999 E.12342
N7557 G1 X190.544 Y141.645 E.80249
N7558 G1 X190.544 Y137.807 E.12342
N7559 G1 X176.736 Y123.999 E.62796
N7560 G1 X180.574 Y123.999 E.12342
N7561 G1 X190.544 Y133.969 E.45342
N7562 G1 X190.544 Y130.131 E.12342
N7563 G1 X184.412 Y123.999 E.27889
N7564 G1 X188.25 Y123.999 E.12342
N7565 G1 X190.728 Y126.476 E.11268
N7566 ; WIPE_START
N7567 G1 X189.313 Y125.062 E-.76
N7568 ; WIPE_END
N7569 G1 E-.04 F1800
N7570 M204 S10000
N7571 G17
N7572 G3 Z7 I1.217 J0 P1  F60000
N7573 ; stop printing object, unique label id: 79
N7574 M625
N7575 ; object ids of layer 33 start: 79
N7576 M624 AQAAAAAAAAA=
N7577 ;======== H2D 20250213========
N7578 ; SKIPPABLE_START
N7579 ; SKIPTYPE: timelapse
N7580 M622.1 S1 ; for prev firware, default turned on
N7581 
N7582 M1002 judge_flag timelapse_record_flag
N7583 
N7584 M622 J1
N7585 M993 A2 B2 C2
N7586 M993 A0 B0 C0
N7587 
N7588 
N7589 M9712 E1 M0
N7590 M83
N7591 G1 Z7 F1200
N7592 M400
N7593 M9713
N7594 
N7595 
N7596 M9711 M0 E1 Z7 S11 C10 O0 T3000
N7597 
N7598 
N7599 M9712 E1 M0
N7600 G90
N7601 G1 Z9.6
N7602 G1 Y295 F30000
N7603 G1 Y265 F18000
N7604 M83
N7605 M9713
N7606 
N7607 M993 A3 B3 C3
N7608 
N7609 M623
N7610 ; SKIPPABLE_END
N7611 
N7612 ; object ids of this layer33 end: 79
N7613 M625
N7614 ; CHANGE_LAYER
N7615 ; Z_HEIGHT: 6.8
N7616 ; LAYER_HEIGHT: 0.2
N7617 ;======== H2D 20250521========
N7618 ; layer num/total_layer_count: 34/63
N7619 ; update layer progress
N7620 M73 L34
N7621 M991 S0 P33 ;notify layer change
N7622 
N7623 
N7624 M106 S73.95
N7625 ; OBJECT_ID: 79
N7626 ; COOLING_NODE: 0
N7627 ; start printing object, unique label id: 79
N7628 M624 AQAAAAAAAAA=
N7629 G1 X190.893 Y197.252 F60000
N7630 G1 Z6.8
N7631 G1 E.8 F1800
N7632 ; FEATURE: Inner wall
N7633 G1 F8475
N7634 M204 S8000
N7635 G1 X158.725 Y197.252 E1.03439
N7636 G1 X158.725 Y123.65 E2.36678
N7637 G1 X190.893 Y123.65 E1.03439
N7638 G1 X190.893 Y197.192 E2.36485
N7639 ; COOLING_NODE: 0
N7640 M204 S10000
N7641 G1 X191.3 Y197.659 F60000
N7642 G1 F8475
N7643 M204 S8000
N7644 G1 X158.318 Y197.659 E1.06057
N7645 G1 X158.318 Y123.243 E2.39296
N7646 G1 X191.3 Y123.243 E1.06057
N7647 G1 X191.3 Y197.599 E2.39103
N7648 ; COOLING_NODE: 0
N7649 M204 S10000
N7650 G1 X191.707 Y198.067 F60000
N7651 G1 F8475
N7652 M204 S8000
N7653 G1 X157.911 Y198.067 E1.08675
N7654 G1 X157.911 Y122.836 E2.41914
N7655 G1 X191.707 Y122.836 E1.08675
N7656 G1 X191.707 Y198.007 E2.41721
N7657 ; COOLING_NODE: 0
N7658 M204 S10000
N7659 G1 X192.099 Y198.459 F60000
N7660 ; FEATURE: Outer wall
N7661 ; LINE_WIDTH: 0.42
N7662 G1 F9149.261
N7663 M204 S5000
N7664 G1 X157.519 Y198.459 E1.03002
N7665 G1 X157.519 Y122.444 E2.26421
N7666 G1 X192.099 Y122.444 E1.03002
N7667 G1 X192.099 Y198.399 E2.26243
N7668 G1 E-.8 F1800
N7669 M204 S10000
N7670 G1 X188.067 Y197.087 Z7.2 F60000
N7671 G1 Z6.8
N7672 G1 E.8 F1800
N7673 ; FEATURE: Sparse infill
N7674 ; LINE_WIDTH: 0.45
N7675 G1 F8475
N7676 M204 S8000
N7677 G1 X190.544 Y194.609 E.11268
N7678 G1 X190.544 Y190.772 E.12342
N7679 G1 X184.412 Y196.904 E.27889
N7680 G1 X180.574 Y196.904 E.12342
N7681 G1 X190.544 Y186.934 E.45342
N7682 G1 X190.544 Y183.096 E.12342
N7683 G1 X176.736 Y196.904 E.62796
N7684 G1 X172.898 Y196.904 E.12342
N7685 G1 X190.544 Y179.258 E.80249
N7686 G1 X190.544 Y175.42 E.12342
N7687 G1 X169.06 Y196.904 E.97703
N7688 G1 X165.222 Y196.904 E.12342
N7689 G1 X190.544 Y171.582 E1.15157
N7690 G1 X190.544 Y167.744 E.12342
N7691 G1 X161.384 Y196.904 E1.3261
N7692 G1 X159.073 Y196.904 E.0743
N7693 G1 X159.073 Y195.377 E.04912
N7694 G1 X190.544 Y163.906 E1.43118
N7695 G1 X190.544 Y160.068 E.12342
N7696 G1 X159.073 Y191.539 E1.43118
N7697 G1 X159.073 Y187.701 E.12342
N7698 G1 X190.544 Y156.23 E1.43118
N7699 G1 X190.544 Y152.392 E.12342
N7700 G1 X159.073 Y183.863 E1.43118
N7701 G1 X159.073 Y180.025 E.12342
N7702 G1 X190.544 Y148.554 E1.43118
N7703 G1 X190.544 Y144.716 E.12342
N7704 G1 X159.073 Y176.187 E1.43118
N7705 G1 X159.073 Y172.349 E.12342
N7706 G1 X190.544 Y140.878 E1.43118
N7707 G1 X190.544 Y137.04 E.12342
N7708 G1 X159.073 Y168.511 E1.43118
N7709 G1 X159.073 Y164.673 E.12342
N7710 G1 X190.544 Y133.202 E1.43118
N7711 G1 X190.544 Y129.364 E.12342
N7712 G1 X159.073 Y160.835 E1.43118
N7713 G1 X159.073 Y156.997 E.12342
N7714 G1 X190.544 Y125.526 E1.43118
N7715 G1 X190.544 Y123.999 E.04912
N7716 G1 X188.234 Y123.999 E.0743
N7717 G1 X159.073 Y153.159 E1.3261
N7718 G1 X159.073 Y149.321 E.12342
N7719 G1 X184.396 Y123.999 E1.15157
N7720 G1 X180.558 Y123.999 E.12342
N7721 G1 X159.073 Y145.483 E.97703
N7722 G1 X159.073 Y141.645 E.12342
N7723 G1 X176.72 Y123.999 E.80249
N7724 G1 X172.882 Y123.999 E.12342
N7725 G1 X159.073 Y137.807 E.62796
N7726 G1 X159.073 Y133.969 E.12342
N7727 G1 X169.044 Y123.999 E.45342
N7728 G1 X165.206 Y123.999 E.12342
N7729 G1 X159.073 Y130.131 E.27889
N7730 G1 X159.073 Y126.293 E.12342
N7731 G1 X161.551 Y123.815 E.11268
N7732 ; WIPE_START
N7733 G1 X160.137 Y125.23 E-.76
N7734 ; WIPE_END
N7735 G1 E-.04 F1800
N7736 M204 S10000
N7737 G17
N7738 G3 Z7.2 I1.217 J0 P1  F60000
N7739 ; stop printing object, unique label id: 79
N7740 M625
N7741 ; object ids of layer 34 start: 79
N7742 M624 AQAAAAAAAAA=
N7743 ;======== H2D 20250213========
N7744 ; SKIPPABLE_START
N7745 ; SKIPTYPE: timelapse
N7746 M622.1 S1 ; for prev firware, default turned on
N7747 
N7748 M1002 judge_flag timelapse_record_flag
N7749 
N7750 M622 J1
N7751 M993 A2 B2 C2
N7752 M993 A0 B0 C0
N7753 
N7754 
N7755 M9712 E1 M0
N7756 M83
N7757 G1 Z7.2 F1200
N7758 M400
N7759 M9713
N7760 
N7761 
N7762 M9711 M0 E1 Z7.2 S11 C10 O0 T3000
N7763 
N7764 
N7765 M9712 E1 M0
N7766 G90
N7767 G1 Z9.8
N7768 G1 Y295 F30000
N7769 G1 Y265 F18000
N7770 M83
N7771 M9713
N7772 
N7773 M993 A3 B3 C3
N7774 
N7775 M623
N7776 ; SKIPPABLE_END
N7777 
N7778 ; object ids of this layer34 end: 79
N7779 M625
N7780 ; CHANGE_LAYER
N7781 ; Z_HEIGHT: 7
N7782 ; LAYER_HEIGHT: 0.2
N7783 ;======== H2D 20250521========
N7784 ; layer num/total_layer_count: 35/63
N7785 ; update layer progress
N7786 M73 L35
N7787 M991 S0 P34 ;notify layer change
N7788 
N7789 
N7790 M106 S71.4
N7791 ; OBJECT_ID: 79
N7792 ; COOLING_NODE: 0
N7793 ; start printing object, unique label id: 79
N7794 M624 AQAAAAAAAAA=
N7795 G1 X190.893 Y197.252 F60000
N7796 G1 Z7
N7797 G1 E.8 F1800
N7798 ; FEATURE: Inner wall
N7799 G1 F8475
N7800 M204 S8000
N7801 G1 X158.725 Y197.252 E1.03439
N7802 G1 X158.725 Y123.65 E2.36678
N7803 G1 X190.893 Y123.65 E1.03439
N7804 G1 X190.893 Y197.192 E2.36485
N7805 ; COOLING_NODE: 0
N7806 M204 S10000
N7807 G1 X191.3 Y197.659 F60000
N7808 G1 F8475
N7809 M204 S8000
N7810 G1 X158.318 Y197.659 E1.06057
N7811 M73 P64 R12
N7812 G1 X158.318 Y123.243 E2.39296
N7813 G1 X191.3 Y123.243 E1.06057
N7814 G1 X191.3 Y197.599 E2.39103
N7815 ; COOLING_NODE: 0
N7816 M204 S10000
N7817 G1 X191.707 Y198.067 F60000
N7818 G1 F8475
N7819 M204 S8000
N7820 G1 X157.911 Y198.067 E1.08675
N7821 G1 X157.911 Y122.836 E2.41914
N7822 G1 X191.707 Y122.836 E1.08675
N7823 G1 X191.707 Y198.007 E2.41721
N7824 ; COOLING_NODE: 0
N7825 M204 S10000
N7826 G1 X192.099 Y198.459 F60000
N7827 ; FEATURE: Outer wall
N7828 ; LINE_WIDTH: 0.42
N7829 G1 F9149.261
N7830 M204 S5000
N7831 G1 X157.519 Y198.459 E1.03002
N7832 G1 X157.519 Y122.444 E2.26421
N7833 G1 X192.099 Y122.444 E1.03002
N7834 G1 X192.099 Y198.399 E2.26243
N7835 G1 E-.8 F1800
N7836 M204 S10000
N7837 G1 X184.52 Y197.492 Z7.4 F60000
N7838 G1 X158.89 Y194.426 Z7.4
N7839 G1 Z7
N7840 G1 E.8 F1800
N7841 ; FEATURE: Sparse infill
N7842 ; LINE_WIDTH: 0.45
N7843 G1 F8475
N7844 M204 S8000
N7845 G1 X161.368 Y196.904 E.11268
N7846 G1 X165.206 Y196.904 E.12342
N7847 G1 X159.073 Y190.772 E.27889
N7848 G1 X159.073 Y186.934 E.12342
N7849 G1 X169.044 Y196.904 E.45342
N7850 G1 X172.882 Y196.904 E.12342
N7851 G1 X159.073 Y183.096 E.62796
N7852 G1 X159.073 Y179.258 E.12342
N7853 G1 X176.72 Y196.904 E.80249
N7854 G1 X180.558 Y196.904 E.12342
N7855 G1 X159.073 Y175.42 E.97703
N7856 G1 X159.073 Y171.582 E.12342
N7857 G1 X184.396 Y196.904 E1.15157
N7858 G1 X188.234 Y196.904 E.12342
N7859 G1 X159.073 Y167.744 E1.3261
N7860 G1 X159.073 Y163.906 E.12342
N7861 G1 X190.544 Y195.377 E1.43118
N7862 G1 X190.544 Y191.539 E.12342
N7863 G1 X159.073 Y160.068 E1.43118
N7864 G1 X159.073 Y156.23 E.12342
N7865 G1 X190.544 Y187.701 E1.43118
N7866 G1 X190.544 Y183.863 E.12342
N7867 G1 X159.073 Y152.392 E1.43118
N7868 G1 X159.073 Y148.554 E.12342
N7869 G1 X190.544 Y180.025 E1.43118
N7870 G1 X190.544 Y176.187 E.12342
N7871 G1 X159.073 Y144.716 E1.43118
N7872 G1 X159.073 Y140.878 E.12342
N7873 G1 X190.544 Y172.349 E1.43118
N7874 G1 X190.544 Y168.511 E.12342
N7875 G1 X159.073 Y137.04 E1.43118
N7876 G1 X159.073 Y133.202 E.12342
N7877 G1 X190.544 Y164.673 E1.43118
N7878 G1 X190.544 Y160.835 E.12342
N7879 M73 P64 R11
N7880 G1 X159.073 Y129.364 E1.43118
N7881 G1 X159.073 Y125.526 E.12342
N7882 G1 X190.544 Y156.997 E1.43118
N7883 G1 X190.544 Y153.159 E.12342
N7884 G1 X161.384 Y123.999 E1.3261
N7885 G1 X165.222 Y123.999 E.12342
N7886 G1 X190.544 Y149.321 E1.15157
N7887 G1 X190.544 Y145.483 E.12342
N7888 G1 X169.06 Y123.999 E.97703
N7889 G1 X172.898 Y123.999 E.12342
N7890 G1 X190.544 Y141.645 E.80249
N7891 G1 X190.544 Y137.807 E.12342
N7892 G1 X176.736 Y123.999 E.62796
N7893 G1 X180.574 Y123.999 E.12342
N7894 G1 X190.544 Y133.969 E.45342
N7895 G1 X190.544 Y130.131 E.12342
N7896 G1 X184.412 Y123.999 E.27889
N7897 G1 X188.25 Y123.999 E.12342
N7898 G1 X190.728 Y126.476 E.11268
N7899 ; WIPE_START
N7900 G1 X189.313 Y125.062 E-.76
N7901 ; WIPE_END
N7902 G1 E-.04 F1800
N7903 M204 S10000
N7904 G17
N7905 G3 Z7.4 I1.217 J0 P1  F60000
N7906 ; stop printing object, unique label id: 79
N7907 M625
N7908 ; object ids of layer 35 start: 79
N7909 M624 AQAAAAAAAAA=
N7910 ;======== H2D 20250213========
N7911 ; SKIPPABLE_START
N7912 ; SKIPTYPE: timelapse
N7913 M622.1 S1 ; for prev firware, default turned on
N7914 
N7915 M1002 judge_flag timelapse_record_flag
N7916 
N7917 M622 J1
N7918 M993 A2 B2 C2
N7919 M993 A0 B0 C0
N7920 
N7921 
N7922 M9712 E1 M0
N7923 M83
N7924 G1 Z7.4 F1200
N7925 M400
N7926 M9713
N7927 
N7928 
N7929 M9711 M0 E1 Z7.4 S11 C10 O0 T3000
N7930 
N7931 
N7932 M9712 E1 M0
N7933 G90
N7934 G1 Z10
N7935 G1 Y295 F30000
N7936 G1 Y265 F18000
N7937 M83
N7938 M9713
N7939 
N7940 M993 A3 B3 C3
N7941 
N7942 M623
N7943 ; SKIPPABLE_END
N7944 
N7945 ; object ids of this layer35 end: 79
N7946 M625
N7947 ; CHANGE_LAYER
N7948 ; Z_HEIGHT: 7.2
N7949 ; LAYER_HEIGHT: 0.2
N7950 ;======== H2D 20250521========
N7951 ; layer num/total_layer_count: 36/63
N7952 ; update layer progress
N7953 M73 L36
N7954 M991 S0 P35 ;notify layer change
N7955 
N7956 
N7957 M106 S73.95
N7958 ; OBJECT_ID: 79
N7959 ; COOLING_NODE: 0
N7960 ; start printing object, unique label id: 79
N7961 M624 AQAAAAAAAAA=
N7962 G1 X190.893 Y197.252 F60000
N7963 G1 Z7.2
N7964 G1 E.8 F1800
N7965 ; FEATURE: Inner wall
N7966 G1 F8475
N7967 M204 S8000
N7968 G1 X158.725 Y197.252 E1.03439
N7969 G1 X158.725 Y123.65 E2.36678
N7970 G1 X190.893 Y123.65 E1.03439
N7971 G1 X190.893 Y197.192 E2.36485
N7972 ; COOLING_NODE: 0
N7973 M204 S10000
N7974 G1 X191.3 Y197.659 F60000
N7975 G1 F8475
N7976 M204 S8000
N7977 G1 X158.318 Y197.659 E1.06057
N7978 G1 X158.318 Y123.243 E2.39296
N7979 G1 X191.3 Y123.243 E1.06057
N7980 G1 X191.3 Y197.599 E2.39103
N7981 ; COOLING_NODE: 0
N7982 M204 S10000
N7983 G1 X191.707 Y198.067 F60000
N7984 G1 F8475
N7985 M204 S8000
N7986 G1 X157.911 Y198.067 E1.08675
N7987 G1 X157.911 Y122.836 E2.41914
N7988 G1 X191.707 Y122.836 E1.08675
N7989 G1 X191.707 Y198.007 E2.41721
N7990 ; COOLING_NODE: 0
N7991 M204 S10000
N7992 G1 X192.099 Y198.459 F60000
N7993 ; FEATURE: Outer wall
N7994 ; LINE_WIDTH: 0.42
N7995 G1 F9149.261
N7996 M204 S5000
N7997 G1 X157.519 Y198.459 E1.03002
N7998 G1 X157.519 Y122.444 E2.26421
N7999 G1 X192.099 Y122.444 E1.03002
N8000 G1 X192.099 Y198.399 E2.26243
N8001 G1 E-.8 F1800
N8002 M204 S10000
N8003 G1 X188.067 Y197.087 Z7.6 F60000
N8004 G1 Z7.2
N8005 M73 P65 R11
N8006 G1 E.8 F1800
N8007 ; FEATURE: Sparse infill
N8008 ; LINE_WIDTH: 0.45
N8009 G1 F8475
N8010 M204 S8000
N8011 G1 X190.544 Y194.609 E.11268
N8012 G1 X190.544 Y190.772 E.12342
N8013 G1 X184.412 Y196.904 E.27889
N8014 G1 X180.574 Y196.904 E.12342
N8015 G1 X190.544 Y186.934 E.45342
N8016 G1 X190.544 Y183.096 E.12342
N8017 G1 X176.736 Y196.904 E.62796
N8018 G1 X172.898 Y196.904 E.12342
N8019 G1 X190.544 Y179.258 E.80249
N8020 G1 X190.544 Y175.42 E.12342
N8021 G1 X169.06 Y196.904 E.97703
N8022 G1 X165.222 Y196.904 E.12342
N8023 G1 X190.544 Y171.582 E1.15157
N8024 G1 X190.544 Y167.744 E.12342
N8025 G1 X161.384 Y196.904 E1.3261
N8026 G1 X159.073 Y196.904 E.0743
N8027 G1 X159.073 Y195.377 E.04912
N8028 G1 X190.544 Y163.906 E1.43118
N8029 G1 X190.544 Y160.068 E.12342
N8030 G1 X159.073 Y191.539 E1.43118
N8031 G1 X159.073 Y187.701 E.12342
N8032 G1 X190.544 Y156.23 E1.43118
N8033 G1 X190.544 Y152.392 E.12342
N8034 G1 X159.073 Y183.863 E1.43118
N8035 G1 X159.073 Y180.025 E.12342
N8036 G1 X190.544 Y148.554 E1.43118
N8037 G1 X190.544 Y144.716 E.12342
N8038 G1 X159.073 Y176.187 E1.43118
N8039 G1 X159.073 Y172.349 E.12342
N8040 G1 X190.544 Y140.878 E1.43118
N8041 G1 X190.544 Y137.04 E.12342
N8042 G1 X159.073 Y168.511 E1.43118
N8043 G1 X159.073 Y164.673 E.12342
N8044 G1 X190.544 Y133.202 E1.43118
N8045 G1 X190.544 Y129.364 E.12342
N8046 G1 X159.073 Y160.835 E1.43118
N8047 G1 X159.073 Y156.997 E.12342
N8048 G1 X190.544 Y125.526 E1.43118
N8049 G1 X190.544 Y123.999 E.04912
N8050 G1 X188.234 Y123.999 E.0743
N8051 G1 X159.073 Y153.159 E1.3261
N8052 G1 X159.073 Y149.321 E.12342
N8053 G1 X184.396 Y123.999 E1.15157
N8054 G1 X180.558 Y123.999 E.12342
N8055 G1 X159.073 Y145.483 E.97703
N8056 G1 X159.073 Y141.645 E.12342
N8057 G1 X176.72 Y123.999 E.80249
N8058 G1 X172.882 Y123.999 E.12342
N8059 G1 X159.073 Y137.807 E.62796
N8060 G1 X159.073 Y133.969 E.12342
N8061 G1 X169.044 Y123.999 E.45342
N8062 G1 X165.206 Y123.999 E.12342
N8063 G1 X159.073 Y130.131 E.27889
N8064 G1 X159.073 Y126.293 E.12342
N8065 G1 X161.551 Y123.815 E.11268
N8066 ; WIPE_START
N8067 G1 X160.137 Y125.23 E-.76
N8068 ; WIPE_END
N8069 G1 E-.04 F1800
N8070 M204 S10000
N8071 G17
N8072 G3 Z7.6 I1.217 J0 P1  F60000
N8073 ; stop printing object, unique label id: 79
N8074 M625
N8075 ; object ids of layer 36 start: 79
N8076 M624 AQAAAAAAAAA=
N8077 ;======== H2D 20250213========
N8078 ; SKIPPABLE_START
N8079 ; SKIPTYPE: timelapse
N8080 M622.1 S1 ; for prev firware, default turned on
N8081 
N8082 M1002 judge_flag timelapse_record_flag
N8083 
N8084 M622 J1
N8085 M993 A2 B2 C2
N8086 M993 A0 B0 C0
N8087 
N8088 
N8089 M9712 E1 M0
N8090 M83
N8091 G1 Z7.6 F1200
N8092 M400
N8093 M9713
N8094 
N8095 
N8096 M9711 M0 E1 Z7.6 S11 C10 O0 T3000
N8097 
N8098 
N8099 M9712 E1 M0
N8100 G90
N8101 G1 Z10.2
N8102 G1 Y295 F30000
N8103 G1 Y265 F18000
N8104 M83
N8105 M9713
N8106 
N8107 M993 A3 B3 C3
N8108 
N8109 M623
N8110 ; SKIPPABLE_END
N8111 
N8112 ; object ids of this layer36 end: 79
N8113 M625
N8114 ; CHANGE_LAYER
N8115 ; Z_HEIGHT: 7.4
N8116 ; LAYER_HEIGHT: 0.2
N8117 ;======== H2D 20250521========
N8118 ; layer num/total_layer_count: 37/63
N8119 ; update layer progress
N8120 M73 L37
N8121 M991 S0 P36 ;notify layer change
N8122 
N8123 
N8124 M106 S71.4
N8125 ; OBJECT_ID: 79
N8126 ; COOLING_NODE: 0
N8127 ; start printing object, unique label id: 79
N8128 M624 AQAAAAAAAAA=
N8129 G1 X190.893 Y197.252 F60000
N8130 G1 Z7.4
N8131 G1 E.8 F1800
N8132 ; FEATURE: Inner wall
N8133 G1 F8475
N8134 M204 S8000
N8135 G1 X158.725 Y197.252 E1.03439
N8136 G1 X158.725 Y123.65 E2.36678
N8137 G1 X190.893 Y123.65 E1.03439
N8138 G1 X190.893 Y197.192 E2.36485
N8139 ; COOLING_NODE: 0
N8140 M204 S10000
N8141 G1 X191.3 Y197.659 F60000
N8142 G1 F8475
N8143 M204 S8000
N8144 G1 X158.318 Y197.659 E1.06057
N8145 G1 X158.318 Y123.243 E2.39296
N8146 G1 X191.3 Y123.243 E1.06057
N8147 G1 X191.3 Y197.599 E2.39103
N8148 ; COOLING_NODE: 0
N8149 M204 S10000
N8150 G1 X191.707 Y198.067 F60000
N8151 G1 F8475
N8152 M204 S8000
N8153 G1 X157.911 Y198.067 E1.08675
N8154 G1 X157.911 Y122.836 E2.41914
N8155 G1 X191.707 Y122.836 E1.08675
N8156 G1 X191.707 Y198.007 E2.41721
N8157 ; COOLING_NODE: 0
N8158 M204 S10000
N8159 G1 X192.099 Y198.459 F60000
N8160 ; FEATURE: Outer wall
N8161 ; LINE_WIDTH: 0.42
N8162 G1 F9149.261
N8163 M204 S5000
N8164 G1 X157.519 Y198.459 E1.03002
N8165 G1 X157.519 Y122.444 E2.26421
N8166 G1 X192.099 Y122.444 E1.03002
N8167 G1 X192.099 Y198.399 E2.26243
N8168 G1 E-.8 F1800
N8169 M204 S10000
N8170 G1 X184.52 Y197.492 Z7.8 F60000
N8171 G1 X158.89 Y194.426 Z7.8
N8172 G1 Z7.4
N8173 G1 E.8 F1800
N8174 ; FEATURE: Sparse infill
N8175 ; LINE_WIDTH: 0.45
N8176 G1 F8475
N8177 M204 S8000
N8178 G1 X161.368 Y196.904 E.11268
N8179 G1 X165.206 Y196.904 E.12342
N8180 G1 X159.073 Y190.772 E.27889
N8181 G1 X159.073 Y186.934 E.12342
N8182 G1 X169.044 Y196.904 E.45342
N8183 G1 X172.882 Y196.904 E.12342
N8184 G1 X159.073 Y183.096 E.62796
N8185 G1 X159.073 Y179.258 E.12342
N8186 G1 X176.72 Y196.904 E.80249
N8187 G1 X180.558 Y196.904 E.12342
N8188 G1 X159.073 Y175.42 E.97703
N8189 G1 X159.073 Y171.582 E.12342
N8190 G1 X184.396 Y196.904 E1.15157
N8191 G1 X188.234 Y196.904 E.12342
N8192 G1 X159.073 Y167.744 E1.3261
N8193 G1 X159.073 Y163.906 E.12342
N8194 G1 X190.544 Y195.377 E1.43118
N8195 G1 X190.544 Y191.539 E.12342
N8196 G1 X159.073 Y160.068 E1.43118
N8197 G1 X159.073 Y156.23 E.12342
N8198 G1 X190.544 Y187.701 E1.43118
N8199 G1 X190.544 Y183.863 E.12342
N8200 G1 X159.073 Y152.392 E1.43118
N8201 G1 X159.073 Y148.554 E.12342
N8202 G1 X190.544 Y180.025 E1.43118
N8203 G1 X190.544 Y176.187 E.12342
N8204 G1 X159.073 Y144.716 E1.43118
N8205 G1 X159.073 Y140.878 E.12342
N8206 G1 X190.544 Y172.349 E1.43118
N8207 G1 X190.544 Y168.511 E.12342
N8208 G1 X159.073 Y137.04 E1.43118
N8209 G1 X159.073 Y133.202 E.12342
N8210 G1 X190.544 Y164.673 E1.43118
N8211 G1 X190.544 Y160.835 E.12342
N8212 M73 P66 R11
N8213 G1 X159.073 Y129.364 E1.43118
N8214 G1 X159.073 Y125.526 E.12342
N8215 G1 X190.544 Y156.997 E1.43118
N8216 G1 X190.544 Y153.159 E.12342
N8217 G1 X161.384 Y123.999 E1.3261
N8218 G1 X165.222 Y123.999 E.12342
N8219 G1 X190.544 Y149.321 E1.15157
N8220 G1 X190.544 Y145.483 E.12342
N8221 G1 X169.06 Y123.999 E.97703
N8222 G1 X172.898 Y123.999 E.12342
N8223 G1 X190.544 Y141.645 E.80249
N8224 G1 X190.544 Y137.807 E.12342
N8225 G1 X176.736 Y123.999 E.62796
N8226 G1 X180.574 Y123.999 E.12342
N8227 G1 X190.544 Y133.969 E.45342
N8228 G1 X190.544 Y130.131 E.12342
N8229 G1 X184.412 Y123.999 E.27889
N8230 G1 X188.25 Y123.999 E.12342
N8231 G1 X190.728 Y126.476 E.11268
N8232 ; WIPE_START
N8233 G1 X189.313 Y125.062 E-.76
N8234 ; WIPE_END
N8235 G1 E-.04 F1800
N8236 M204 S10000
N8237 G17
N8238 G3 Z7.8 I1.217 J0 P1  F60000
N8239 ; stop printing object, unique label id: 79
N8240 M625
N8241 ; object ids of layer 37 start: 79
N8242 M624 AQAAAAAAAAA=
N8243 ;======== H2D 20250213========
N8244 ; SKIPPABLE_START
N8245 ; SKIPTYPE: timelapse
N8246 M622.1 S1 ; for prev firware, default turned on
N8247 
N8248 M1002 judge_flag timelapse_record_flag
N8249 
N8250 M622 J1
N8251 M993 A2 B2 C2
N8252 M993 A0 B0 C0
N8253 
N8254 
N8255 M9712 E1 M0
N8256 M83
N8257 G1 Z7.8 F1200
N8258 M400
N8259 M9713
N8260 
N8261 
N8262 M9711 M0 E1 Z7.8 S11 C10 O0 T3000
N8263 
N8264 
N8265 M9712 E1 M0
N8266 G90
N8267 G1 Z10.4
N8268 G1 Y295 F30000
N8269 G1 Y265 F18000
N8270 M83
N8271 M9713
N8272 
N8273 M993 A3 B3 C3
N8274 
N8275 M623
N8276 ; SKIPPABLE_END
N8277 
N8278 ; object ids of this layer37 end: 79
N8279 M625
N8280 ; CHANGE_LAYER
N8281 ; Z_HEIGHT: 7.6
N8282 ; LAYER_HEIGHT: 0.2
N8283 ;======== H2D 20250521========
N8284 ; layer num/total_layer_count: 38/63
N8285 ; update layer progress
N8286 M73 L38
N8287 M991 S0 P37 ;notify layer change
N8288 
N8289 
N8290 M106 S73.95
N8291 ; OBJECT_ID: 79
N8292 ; COOLING_NODE: 0
N8293 ; start printing object, unique label id: 79
N8294 M624 AQAAAAAAAAA=
N8295 G1 X190.893 Y197.252 F60000
N8296 G1 Z7.6
N8297 G1 E.8 F1800
N8298 ; FEATURE: Inner wall
N8299 G1 F8475
N8300 M204 S8000
N8301 G1 X158.725 Y197.252 E1.03439
N8302 G1 X158.725 Y123.65 E2.36678
N8303 G1 X190.893 Y123.65 E1.03439
N8304 G1 X190.893 Y197.192 E2.36485
N8305 ; COOLING_NODE: 0
N8306 M204 S10000
N8307 G1 X191.3 Y197.659 F60000
N8308 G1 F8475
N8309 M204 S8000
N8310 G1 X158.318 Y197.659 E1.06057
N8311 G1 X158.318 Y123.243 E2.39296
N8312 G1 X191.3 Y123.243 E1.06057
N8313 G1 X191.3 Y197.599 E2.39103
N8314 ; COOLING_NODE: 0
N8315 M204 S10000
N8316 G1 X191.707 Y198.067 F60000
N8317 G1 F8475
N8318 M204 S8000
N8319 G1 X157.911 Y198.067 E1.08675
N8320 G1 X157.911 Y122.836 E2.41914
N8321 G1 X191.707 Y122.836 E1.08675
N8322 G1 X191.707 Y198.007 E2.41721
N8323 ; COOLING_NODE: 0
N8324 M204 S10000
N8325 G1 X192.099 Y198.459 F60000
N8326 ; FEATURE: Outer wall
N8327 ; LINE_WIDTH: 0.42
N8328 G1 F9149.261
N8329 M204 S5000
N8330 G1 X157.519 Y198.459 E1.03002
N8331 G1 X157.519 Y122.444 E2.26421
N8332 G1 X192.099 Y122.444 E1.03002
N8333 G1 X192.099 Y198.399 E2.26243
N8334 G1 E-.8 F1800
N8335 M204 S10000
N8336 G1 X188.067 Y197.087 Z8 F60000
N8337 G1 Z7.6
N8338 G1 E.8 F1800
N8339 ; FEATURE: Sparse infill
N8340 ; LINE_WIDTH: 0.45
N8341 G1 F8475
N8342 M204 S8000
N8343 G1 X190.544 Y194.609 E.11268
N8344 G1 X190.544 Y190.772 E.12342
N8345 G1 X184.412 Y196.904 E.27889
N8346 G1 X180.574 Y196.904 E.12342
N8347 G1 X190.544 Y186.934 E.45342
N8348 G1 X190.544 Y183.096 E.12342
N8349 G1 X176.736 Y196.904 E.62796
N8350 G1 X172.898 Y196.904 E.12342
N8351 G1 X190.544 Y179.258 E.80249
N8352 G1 X190.544 Y175.42 E.12342
N8353 G1 X169.06 Y196.904 E.97703
N8354 G1 X165.222 Y196.904 E.12342
N8355 G1 X190.544 Y171.582 E1.15157
N8356 G1 X190.544 Y167.744 E.12342
N8357 G1 X161.384 Y196.904 E1.3261
N8358 G1 X159.073 Y196.904 E.0743
N8359 G1 X159.073 Y195.377 E.04912
N8360 G1 X190.544 Y163.906 E1.43118
N8361 G1 X190.544 Y160.068 E.12342
N8362 G1 X159.073 Y191.539 E1.43118
N8363 G1 X159.073 Y187.701 E.12342
N8364 G1 X190.544 Y156.23 E1.43118
N8365 G1 X190.544 Y152.392 E.12342
N8366 G1 X159.073 Y183.863 E1.43118
N8367 G1 X159.073 Y180.025 E.12342
N8368 G1 X190.544 Y148.554 E1.43118
N8369 G1 X190.544 Y144.716 E.12342
N8370 G1 X159.073 Y176.187 E1.43118
N8371 G1 X159.073 Y172.349 E.12342
N8372 G1 X190.544 Y140.878 E1.43118
N8373 G1 X190.544 Y137.04 E.12342
N8374 G1 X159.073 Y168.511 E1.43118
N8375 G1 X159.073 Y164.673 E.12342
N8376 G1 X190.544 Y133.202 E1.43118
N8377 G1 X190.544 Y129.364 E.12342
N8378 G1 X159.073 Y160.835 E1.43118
N8379 G1 X159.073 Y156.997 E.12342
N8380 G1 X190.544 Y125.526 E1.43118
N8381 G1 X190.544 Y123.999 E.04912
N8382 G1 X188.234 Y123.999 E.0743
N8383 G1 X159.073 Y153.159 E1.3261
N8384 G1 X159.073 Y149.321 E.12342
N8385 G1 X184.396 Y123.999 E1.15157
N8386 G1 X180.558 Y123.999 E.12342
N8387 G1 X159.073 Y145.483 E.97703
N8388 G1 X159.073 Y141.645 E.12342
N8389 G1 X176.72 Y123.999 E.80249
N8390 G1 X172.882 Y123.999 E.12342
N8391 G1 X159.073 Y137.807 E.62796
N8392 G1 X159.073 Y133.969 E.12342
N8393 G1 X169.044 Y123.999 E.45342
N8394 G1 X165.206 Y123.999 E.12342
N8395 G1 X159.073 Y130.131 E.27889
N8396 G1 X159.073 Y126.293 E.12342
N8397 G1 X161.551 Y123.815 E.11268
N8398 ; WIPE_START
N8399 G1 X160.137 Y125.23 E-.76
N8400 ; WIPE_END
N8401 G1 E-.04 F1800
N8402 M204 S10000
N8403 G17
N8404 G3 Z8 I1.217 J0 P1  F60000
N8405 ; stop printing object, unique label id: 79
N8406 M625
N8407 ; object ids of layer 38 start: 79
N8408 M624 AQAAAAAAAAA=
N8409 ;======== H2D 20250213========
N8410 ; SKIPPABLE_START
N8411 ; SKIPTYPE: timelapse
N8412 M622.1 S1 ; for prev firware, default turned on
N8413 
N8414 M1002 judge_flag timelapse_record_flag
N8415 
N8416 M622 J1
N8417 M993 A2 B2 C2
N8418 M993 A0 B0 C0
N8419 
N8420 
N8421 M9712 E1 M0
N8422 M83
N8423 G1 Z8 F1200
N8424 M400
N8425 M9713
N8426 
N8427 
N8428 M9711 M0 E1 Z8 S11 C10 O0 T3000
N8429 
N8430 
N8431 M9712 E1 M0
N8432 G90
N8433 G1 Z10.6
N8434 G1 Y295 F30000
N8435 G1 Y265 F18000
N8436 M83
N8437 M9713
N8438 
N8439 M993 A3 B3 C3
N8440 
N8441 M623
N8442 ; SKIPPABLE_END
N8443 
N8444 ; object ids of this layer38 end: 79
N8445 M625
N8446 ; CHANGE_LAYER
N8447 ; Z_HEIGHT: 7.8
N8448 ; LAYER_HEIGHT: 0.2
N8449 ;======== H2D 20250521========
N8450 ; layer num/total_layer_count: 39/63
N8451 ; update layer progress
N8452 M73 L39
N8453 M991 S0 P38 ;notify layer change
N8454 
N8455 
N8456 M106 S71.4
N8457 ; OBJECT_ID: 79
N8458 ; COOLING_NODE: 0
N8459 ; start printing object, unique label id: 79
N8460 M624 AQAAAAAAAAA=
N8461 G1 X190.893 Y197.252 F60000
N8462 G1 Z7.8
N8463 G1 E.8 F1800
N8464 ; FEATURE: Inner wall
N8465 G1 F8475
N8466 M204 S8000
N8467 G1 X158.725 Y197.252 E1.03439
N8468 G1 X158.725 Y123.65 E2.36678
N8469 G1 X190.893 Y123.65 E1.03439
N8470 G1 X190.893 Y197.192 E2.36485
N8471 ; COOLING_NODE: 0
N8472 M204 S10000
N8473 G1 X191.3 Y197.659 F60000
N8474 G1 F8475
N8475 M204 S8000
N8476 G1 X158.318 Y197.659 E1.06057
N8477 M73 P67 R11
N8478 G1 X158.318 Y123.243 E2.39296
N8479 G1 X191.3 Y123.243 E1.06057
N8480 G1 X191.3 Y197.599 E2.39103
N8481 ; COOLING_NODE: 0
N8482 M204 S10000
N8483 G1 X191.707 Y198.067 F60000
N8484 G1 F8475
N8485 M204 S8000
N8486 G1 X157.911 Y198.067 E1.08675
N8487 G1 X157.911 Y122.836 E2.41914
N8488 G1 X191.707 Y122.836 E1.08675
N8489 G1 X191.707 Y198.007 E2.41721
N8490 ; COOLING_NODE: 0
N8491 M204 S10000
N8492 G1 X192.099 Y198.459 F60000
N8493 ; FEATURE: Outer wall
N8494 ; LINE_WIDTH: 0.42
N8495 G1 F9149.261
N8496 M204 S5000
N8497 G1 X157.519 Y198.459 E1.03002
N8498 G1 X157.519 Y122.444 E2.26421
N8499 G1 X192.099 Y122.444 E1.03002
N8500 G1 X192.099 Y198.399 E2.26243
N8501 G1 E-.8 F1800
N8502 M204 S10000
N8503 G1 X184.52 Y197.492 Z8.2 F60000
N8504 G1 X158.89 Y194.426 Z8.2
N8505 G1 Z7.8
N8506 G1 E.8 F1800
N8507 ; FEATURE: Sparse infill
N8508 ; LINE_WIDTH: 0.45
N8509 G1 F8475
N8510 M204 S8000
N8511 G1 X161.368 Y196.904 E.11268
N8512 G1 X165.206 Y196.904 E.12342
N8513 G1 X159.073 Y190.772 E.27889
N8514 G1 X159.073 Y186.934 E.12342
N8515 G1 X169.044 Y196.904 E.45342
N8516 G1 X172.882 Y196.904 E.12342
N8517 G1 X159.073 Y183.096 E.62796
N8518 G1 X159.073 Y179.258 E.12342
N8519 G1 X176.72 Y196.904 E.80249
N8520 G1 X180.558 Y196.904 E.12342
N8521 G1 X159.073 Y175.42 E.97703
N8522 G1 X159.073 Y171.582 E.12342
N8523 G1 X184.396 Y196.904 E1.15157
N8524 G1 X188.234 Y196.904 E.12342
N8525 G1 X159.073 Y167.744 E1.3261
N8526 G1 X159.073 Y163.906 E.12342
N8527 G1 X190.544 Y195.377 E1.43118
N8528 G1 X190.544 Y191.539 E.12342
N8529 G1 X159.073 Y160.068 E1.43118
N8530 G1 X159.073 Y156.23 E.12342
N8531 G1 X190.544 Y187.701 E1.43118
N8532 G1 X190.544 Y183.863 E.12342
N8533 G1 X159.073 Y152.392 E1.43118
N8534 G1 X159.073 Y148.554 E.12342
N8535 G1 X190.544 Y180.025 E1.43118
N8536 G1 X190.544 Y176.187 E.12342
N8537 G1 X159.073 Y144.716 E1.43118
N8538 G1 X159.073 Y140.878 E.12342
N8539 G1 X190.544 Y172.349 E1.43118
N8540 G1 X190.544 Y168.511 E.12342
N8541 M73 P67 R10
N8542 G1 X159.073 Y137.04 E1.43118
N8543 G1 X159.073 Y133.202 E.12342
N8544 G1 X190.544 Y164.673 E1.43118
N8545 G1 X190.544 Y160.835 E.12342
N8546 G1 X159.073 Y129.364 E1.43118
N8547 G1 X159.073 Y125.526 E.12342
N8548 G1 X190.544 Y156.997 E1.43118
N8549 G1 X190.544 Y153.159 E.12342
N8550 G1 X161.384 Y123.999 E1.3261
N8551 G1 X165.222 Y123.999 E.12342
N8552 G1 X190.544 Y149.321 E1.15157
N8553 G1 X190.544 Y145.483 E.12342
N8554 G1 X169.06 Y123.999 E.97703
N8555 G1 X172.898 Y123.999 E.12342
N8556 G1 X190.544 Y141.645 E.80249
N8557 G1 X190.544 Y137.807 E.12342
N8558 G1 X176.736 Y123.999 E.62796
N8559 G1 X180.574 Y123.999 E.12342
N8560 G1 X190.544 Y133.969 E.45342
N8561 G1 X190.544 Y130.131 E.12342
N8562 G1 X184.412 Y123.999 E.27889
N8563 G1 X188.25 Y123.999 E.12342
N8564 G1 X190.728 Y126.476 E.11268
N8565 ; WIPE_START
N8566 G1 X189.313 Y125.062 E-.76
N8567 ; WIPE_END
N8568 G1 E-.04 F1800
N8569 M204 S10000
N8570 G17
N8571 G3 Z8.2 I1.217 J0 P1  F60000
N8572 ; stop printing object, unique label id: 79
N8573 M625
N8574 ; object ids of layer 39 start: 79
N8575 M624 AQAAAAAAAAA=
N8576 ;======== H2D 20250213========
N8577 ; SKIPPABLE_START
N8578 ; SKIPTYPE: timelapse
N8579 M622.1 S1 ; for prev firware, default turned on
N8580 
N8581 M1002 judge_flag timelapse_record_flag
N8582 
N8583 M622 J1
N8584 M993 A2 B2 C2
N8585 M993 A0 B0 C0
N8586 
N8587 
N8588 M9712 E1 M0
N8589 M83
N8590 G1 Z8.2 F1200
N8591 M400
N8592 M9713
N8593 
N8594 
N8595 M9711 M0 E1 Z8.2 S11 C10 O0 T3000
N8596 
N8597 
N8598 M9712 E1 M0
N8599 G90
N8600 G1 Z10.8
N8601 G1 Y295 F30000
N8602 G1 Y265 F18000
N8603 M83
N8604 M9713
N8605 
N8606 M993 A3 B3 C3
N8607 
N8608 M623
N8609 ; SKIPPABLE_END
N8610 
N8611 ; object ids of this layer39 end: 79
N8612 M625
N8613 ; CHANGE_LAYER
N8614 ; Z_HEIGHT: 8
N8615 ; LAYER_HEIGHT: 0.2
N8616 ;======== H2D 20250521========
N8617 ; layer num/total_layer_count: 40/63
N8618 ; update layer progress
N8619 M73 L40
N8620 M991 S0 P39 ;notify layer change
N8621 
N8622 
N8623 M106 S73.95
N8624 ; OBJECT_ID: 79
N8625 ; COOLING_NODE: 0
N8626 ; start printing object, unique label id: 79
N8627 M624 AQAAAAAAAAA=
N8628 G1 X190.893 Y197.252 F60000
N8629 G1 Z8
N8630 G1 E.8 F1800
N8631 ; FEATURE: Inner wall
N8632 G1 F8475
N8633 M204 S8000
N8634 G1 X158.725 Y197.252 E1.03439
N8635 G1 X158.725 Y123.65 E2.36678
N8636 G1 X190.893 Y123.65 E1.03439
N8637 G1 X190.893 Y197.192 E2.36485
N8638 ; COOLING_NODE: 0
N8639 M204 S10000
N8640 G1 X191.3 Y197.659 F60000
N8641 G1 F8475
N8642 M204 S8000
N8643 G1 X158.318 Y197.659 E1.06057
N8644 G1 X158.318 Y123.243 E2.39296
N8645 G1 X191.3 Y123.243 E1.06057
N8646 G1 X191.3 Y197.599 E2.39103
N8647 ; COOLING_NODE: 0
N8648 M204 S10000
N8649 G1 X191.707 Y198.067 F60000
N8650 G1 F8475
N8651 M204 S8000
N8652 G1 X157.911 Y198.067 E1.08675
N8653 G1 X157.911 Y122.836 E2.41914
N8654 G1 X191.707 Y122.836 E1.08675
N8655 G1 X191.707 Y198.007 E2.41721
N8656 ; COOLING_NODE: 0
N8657 M204 S10000
N8658 G1 X192.099 Y198.459 F60000
N8659 ; FEATURE: Outer wall
N8660 ; LINE_WIDTH: 0.42
N8661 G1 F9149.261
N8662 M204 S5000
N8663 G1 X157.519 Y198.459 E1.03002
N8664 G1 X157.519 Y122.444 E2.26421
N8665 G1 X192.099 Y122.444 E1.03002
N8666 G1 X192.099 Y198.399 E2.26243
N8667 G1 E-.8 F1800
N8668 M204 S10000
N8669 G1 X188.067 Y197.087 Z8.4 F60000
N8670 G1 Z8
N8671 M73 P68 R10
N8672 G1 E.8 F1800
N8673 ; FEATURE: Sparse infill
N8674 ; LINE_WIDTH: 0.45
N8675 G1 F8475
N8676 M204 S8000
N8677 G1 X190.544 Y194.609 E.11268
N8678 G1 X190.544 Y190.772 E.12342
N8679 G1 X184.412 Y196.904 E.27889
N8680 G1 X180.574 Y196.904 E.12342
N8681 G1 X190.544 Y186.934 E.45342
N8682 G1 X190.544 Y183.096 E.12342
N8683 G1 X176.736 Y196.904 E.62796
N8684 G1 X172.898 Y196.904 E.12342
N8685 G1 X190.544 Y179.258 E.80249
N8686 G1 X190.544 Y175.42 E.12342
N8687 G1 X169.06 Y196.904 E.97703
N8688 G1 X165.222 Y196.904 E.12342
N8689 G1 X190.544 Y171.582 E1.15157
N8690 G1 X190.544 Y167.744 E.12342
N8691 G1 X161.384 Y196.904 E1.3261
N8692 G1 X159.073 Y196.904 E.0743
N8693 G1 X159.073 Y195.377 E.04912
N8694 G1 X190.544 Y163.906 E1.43118
N8695 G1 X190.544 Y160.068 E.12342
N8696 G1 X159.073 Y191.539 E1.43118
N8697 G1 X159.073 Y187.701 E.12342
N8698 G1 X190.544 Y156.23 E1.43118
N8699 G1 X190.544 Y152.392 E.12342
N8700 G1 X159.073 Y183.863 E1.43118
N8701 G1 X159.073 Y180.025 E.12342
N8702 G1 X190.544 Y148.554 E1.43118
N8703 G1 X190.544 Y144.716 E.12342
N8704 G1 X159.073 Y176.187 E1.43118
N8705 G1 X159.073 Y172.349 E.12342
N8706 G1 X190.544 Y140.878 E1.43118
N8707 G1 X190.544 Y137.04 E.12342
N8708 G1 X159.073 Y168.511 E1.43118
N8709 G1 X159.073 Y164.673 E.12342
N8710 G1 X190.544 Y133.202 E1.43118
N8711 G1 X190.544 Y129.364 E.12342
N8712 G1 X159.073 Y160.835 E1.43118
N8713 G1 X159.073 Y156.997 E.12342
N8714 G1 X190.544 Y125.526 E1.43118
N8715 G1 X190.544 Y123.999 E.04912
N8716 G1 X188.234 Y123.999 E.0743
N8717 G1 X159.073 Y153.159 E1.3261
N8718 G1 X159.073 Y149.321 E.12342
N8719 G1 X184.396 Y123.999 E1.15157
N8720 G1 X180.558 Y123.999 E.12342
N8721 G1 X159.073 Y145.483 E.97703
N8722 G1 X159.073 Y141.645 E.12342
N8723 G1 X176.72 Y123.999 E.80249
N8724 G1 X172.882 Y123.999 E.12342
N8725 G1 X159.073 Y137.807 E.62796
N8726 G1 X159.073 Y133.969 E.12342
N8727 G1 X169.044 Y123.999 E.45342
N8728 G1 X165.206 Y123.999 E.12342
N8729 G1 X159.073 Y130.131 E.27889
N8730 G1 X159.073 Y126.293 E.12342
N8731 G1 X161.551 Y123.815 E.11268
N8732 ; WIPE_START
N8733 G1 X160.137 Y125.23 E-.76
N8734 ; WIPE_END
N8735 G1 E-.04 F1800
N8736 M204 S10000
N8737 G17
N8738 G3 Z8.4 I1.217 J0 P1  F60000
N8739 ; stop printing object, unique label id: 79
N8740 M625
N8741 ; object ids of layer 40 start: 79
N8742 M624 AQAAAAAAAAA=
N8743 ;======== H2D 20250213========
N8744 ; SKIPPABLE_START
N8745 ; SKIPTYPE: timelapse
N8746 M622.1 S1 ; for prev firware, default turned on
N8747 
N8748 M1002 judge_flag timelapse_record_flag
N8749 
N8750 M622 J1
N8751 M993 A2 B2 C2
N8752 M993 A0 B0 C0
N8753 
N8754 
N8755 M9712 E1 M0
N8756 M83
N8757 G1 Z8.4 F1200
N8758 M400
N8759 M9713
N8760 
N8761 
N8762 M9711 M0 E1 Z8.4 S11 C10 O0 T3000
N8763 
N8764 
N8765 M9712 E1 M0
N8766 G90
N8767 G1 Z11
N8768 G1 Y295 F30000
N8769 G1 Y265 F18000
N8770 M83
N8771 M9713
N8772 
N8773 M993 A3 B3 C3
N8774 
N8775 M623
N8776 ; SKIPPABLE_END
N8777 
N8778 ; object ids of this layer40 end: 79
N8779 M625
N8780 ; CHANGE_LAYER
N8781 ; Z_HEIGHT: 8.2
N8782 ; LAYER_HEIGHT: 0.2
N8783 ;======== H2D 20250521========
N8784 ; layer num/total_layer_count: 41/63
N8785 ; update layer progress
N8786 M73 L41
N8787 M991 S0 P40 ;notify layer change
N8788 
N8789 
N8790 M106 S71.4
N8791 ; OBJECT_ID: 79
N8792 ; COOLING_NODE: 0
N8793 ; start printing object, unique label id: 79
N8794 M624 AQAAAAAAAAA=
N8795 G1 X190.893 Y197.252 F60000
N8796 G1 Z8.2
N8797 G1 E.8 F1800
N8798 ; FEATURE: Inner wall
N8799 G1 F8475
N8800 M204 S8000
N8801 G1 X158.725 Y197.252 E1.03439
N8802 G1 X158.725 Y123.65 E2.36678
N8803 G1 X190.893 Y123.65 E1.03439
N8804 G1 X190.893 Y197.192 E2.36485
N8805 ; COOLING_NODE: 0
N8806 M204 S10000
N8807 G1 X191.3 Y197.659 F60000
N8808 G1 F8475
N8809 M204 S8000
N8810 G1 X158.318 Y197.659 E1.06057
N8811 G1 X158.318 Y123.243 E2.39296
N8812 G1 X191.3 Y123.243 E1.06057
N8813 G1 X191.3 Y197.599 E2.39103
N8814 ; COOLING_NODE: 0
N8815 M204 S10000
N8816 G1 X191.707 Y198.067 F60000
N8817 G1 F8475
N8818 M204 S8000
N8819 G1 X157.911 Y198.067 E1.08675
N8820 G1 X157.911 Y122.836 E2.41914
N8821 G1 X191.707 Y122.836 E1.08675
N8822 G1 X191.707 Y198.007 E2.41721
N8823 ; COOLING_NODE: 0
N8824 M204 S10000
N8825 G1 X192.099 Y198.459 F60000
N8826 ; FEATURE: Outer wall
N8827 ; LINE_WIDTH: 0.42
N8828 G1 F9149.261
N8829 M204 S5000
N8830 G1 X157.519 Y198.459 E1.03002
N8831 G1 X157.519 Y122.444 E2.26421
N8832 G1 X192.099 Y122.444 E1.03002
N8833 G1 X192.099 Y198.399 E2.26243
N8834 G1 E-.8 F1800
N8835 M204 S10000
N8836 G1 X184.52 Y197.492 Z8.6 F60000
N8837 G1 X158.89 Y194.426 Z8.6
N8838 G1 Z8.2
N8839 G1 E.8 F1800
N8840 ; FEATURE: Sparse infill
N8841 ; LINE_WIDTH: 0.45
N8842 G1 F8475
N8843 M204 S8000
N8844 G1 X161.368 Y196.904 E.11268
N8845 G1 X165.206 Y196.904 E.12342
N8846 G1 X159.073 Y190.772 E.27889
N8847 G1 X159.073 Y186.934 E.12342
N8848 G1 X169.044 Y196.904 E.45342
N8849 G1 X172.882 Y196.904 E.12342
N8850 G1 X159.073 Y183.096 E.62796
N8851 G1 X159.073 Y179.258 E.12342
N8852 G1 X176.72 Y196.904 E.80249
N8853 G1 X180.558 Y196.904 E.12342
N8854 G1 X159.073 Y175.42 E.97703
N8855 G1 X159.073 Y171.582 E.12342
N8856 G1 X184.396 Y196.904 E1.15157
N8857 G1 X188.234 Y196.904 E.12342
N8858 G1 X159.073 Y167.744 E1.3261
N8859 G1 X159.073 Y163.906 E.12342
N8860 G1 X190.544 Y195.377 E1.43118
N8861 G1 X190.544 Y191.539 E.12342
N8862 G1 X159.073 Y160.068 E1.43118
N8863 G1 X159.073 Y156.23 E.12342
N8864 G1 X190.544 Y187.701 E1.43118
N8865 G1 X190.544 Y183.863 E.12342
N8866 G1 X159.073 Y152.392 E1.43118
N8867 G1 X159.073 Y148.554 E.12342
N8868 G1 X190.544 Y180.025 E1.43118
N8869 G1 X190.544 Y176.187 E.12342
N8870 G1 X159.073 Y144.716 E1.43118
N8871 G1 X159.073 Y140.878 E.12342
N8872 G1 X190.544 Y172.349 E1.43118
N8873 G1 X190.544 Y168.511 E.12342
N8874 G1 X159.073 Y137.04 E1.43118
N8875 G1 X159.073 Y133.202 E.12342
N8876 G1 X190.544 Y164.673 E1.43118
N8877 G1 X190.544 Y160.835 E.12342
N8878 M73 P69 R10
N8879 G1 X159.073 Y129.364 E1.43118
N8880 G1 X159.073 Y125.526 E.12342
N8881 G1 X190.544 Y156.997 E1.43118
N8882 G1 X190.544 Y153.159 E.12342
N8883 G1 X161.384 Y123.999 E1.3261
N8884 G1 X165.222 Y123.999 E.12342
N8885 G1 X190.544 Y149.321 E1.15157
N8886 G1 X190.544 Y145.483 E.12342
N8887 G1 X169.06 Y123.999 E.97703
N8888 G1 X172.898 Y123.999 E.12342
N8889 G1 X190.544 Y141.645 E.80249
N8890 G1 X190.544 Y137.807 E.12342
N8891 G1 X176.736 Y123.999 E.62796
N8892 G1 X180.574 Y123.999 E.12342
N8893 G1 X190.544 Y133.969 E.45342
N8894 G1 X190.544 Y130.131 E.12342
N8895 G1 X184.412 Y123.999 E.27889
N8896 G1 X188.25 Y123.999 E.12342
N8897 G1 X190.728 Y126.476 E.11268
N8898 ; WIPE_START
N8899 G1 X189.313 Y125.062 E-.76
N8900 ; WIPE_END
N8901 G1 E-.04 F1800
N8902 M204 S10000
N8903 G17
N8904 G3 Z8.6 I1.217 J0 P1  F60000
N8905 ; stop printing object, unique label id: 79
N8906 M625
N8907 ; object ids of layer 41 start: 79
N8908 M624 AQAAAAAAAAA=
N8909 ;======== H2D 20250213========
N8910 ; SKIPPABLE_START
N8911 ; SKIPTYPE: timelapse
N8912 M622.1 S1 ; for prev firware, default turned on
N8913 
N8914 M1002 judge_flag timelapse_record_flag
N8915 
N8916 M622 J1
N8917 M993 A2 B2 C2
N8918 M993 A0 B0 C0
N8919 
N8920 
N8921 M9712 E1 M0
N8922 M83
N8923 G1 Z8.6 F1200
N8924 M400
N8925 M9713
N8926 
N8927 
N8928 M9711 M0 E1 Z8.6 S11 C10 O0 T3000
N8929 
N8930 
N8931 M9712 E1 M0
N8932 G90
N8933 G1 Z11.2
N8934 G1 Y295 F30000
N8935 G1 Y265 F18000
N8936 M83
N8937 M9713
N8938 
N8939 M993 A3 B3 C3
N8940 
N8941 M623
N8942 ; SKIPPABLE_END
N8943 
N8944 ; object ids of this layer41 end: 79
N8945 M625
N8946 ; CHANGE_LAYER
N8947 ; Z_HEIGHT: 8.4
N8948 ; LAYER_HEIGHT: 0.2
N8949 ;======== H2D 20250521========
N8950 ; layer num/total_layer_count: 42/63
N8951 ; update layer progress
N8952 M73 L42
N8953 M991 S0 P41 ;notify layer change
N8954 
N8955 
N8956 M106 S73.95
N8957 ; OBJECT_ID: 79
N8958 ; COOLING_NODE: 0
N8959 ; start printing object, unique label id: 79
N8960 M624 AQAAAAAAAAA=
N8961 G1 X190.893 Y197.252 F60000
N8962 G1 Z8.4
N8963 G1 E.8 F1800
N8964 ; FEATURE: Inner wall
N8965 G1 F8475
N8966 M204 S8000
N8967 G1 X158.725 Y197.252 E1.03439
N8968 G1 X158.725 Y123.65 E2.36678
N8969 G1 X190.893 Y123.65 E1.03439
N8970 G1 X190.893 Y197.192 E2.36485
N8971 ; COOLING_NODE: 0
N8972 M204 S10000
N8973 G1 X191.3 Y197.659 F60000
N8974 G1 F8475
N8975 M204 S8000
N8976 G1 X158.318 Y197.659 E1.06057
N8977 G1 X158.318 Y123.243 E2.39296
N8978 G1 X191.3 Y123.243 E1.06057
N8979 G1 X191.3 Y197.599 E2.39103
N8980 ; COOLING_NODE: 0
N8981 M204 S10000
N8982 G1 X191.707 Y198.067 F60000
N8983 G1 F8475
N8984 M204 S8000
N8985 G1 X157.911 Y198.067 E1.08675
N8986 G1 X157.911 Y122.836 E2.41914
N8987 G1 X191.707 Y122.836 E1.08675
N8988 G1 X191.707 Y198.007 E2.41721
N8989 ; COOLING_NODE: 0
N8990 M204 S10000
N8991 G1 X192.099 Y198.459 F60000
N8992 ; FEATURE: Outer wall
N8993 ; LINE_WIDTH: 0.42
N8994 G1 F9149.261
N8995 M204 S5000
N8996 G1 X157.519 Y198.459 E1.03002
N8997 G1 X157.519 Y122.444 E2.26421
N8998 G1 X192.099 Y122.444 E1.03002
N8999 G1 X192.099 Y198.399 E2.26243
N9000 G1 E-.8 F1800
N9001 M204 S10000
N9002 G1 X188.067 Y197.087 Z8.8 F60000
N9003 G1 Z8.4
N9004 G1 E.8 F1800
N9005 ; FEATURE: Sparse infill
N9006 ; LINE_WIDTH: 0.45
N9007 G1 F8475
N9008 M204 S8000
N9009 G1 X190.544 Y194.609 E.11268
N9010 G1 X190.544 Y190.772 E.12342
N9011 G1 X184.412 Y196.904 E.27889
N9012 G1 X180.574 Y196.904 E.12342
N9013 G1 X190.544 Y186.934 E.45342
N9014 G1 X190.544 Y183.096 E.12342
N9015 G1 X176.736 Y196.904 E.62796
N9016 G1 X172.898 Y196.904 E.12342
N9017 G1 X190.544 Y179.258 E.80249
N9018 G1 X190.544 Y175.42 E.12342
N9019 G1 X169.06 Y196.904 E.97703
N9020 G1 X165.222 Y196.904 E.12342
N9021 G1 X190.544 Y171.582 E1.15157
N9022 G1 X190.544 Y167.744 E.12342
N9023 G1 X161.384 Y196.904 E1.3261
N9024 G1 X159.073 Y196.904 E.0743
N9025 G1 X159.073 Y195.377 E.04912
N9026 G1 X190.544 Y163.906 E1.43118
N9027 G1 X190.544 Y160.068 E.12342
N9028 G1 X159.073 Y191.539 E1.43118
N9029 G1 X159.073 Y187.701 E.12342
N9030 G1 X190.544 Y156.23 E1.43118
N9031 G1 X190.544 Y152.392 E.12342
N9032 G1 X159.073 Y183.863 E1.43118
N9033 G1 X159.073 Y180.025 E.12342
N9034 G1 X190.544 Y148.554 E1.43118
N9035 G1 X190.544 Y144.716 E.12342
N9036 G1 X159.073 Y176.187 E1.43118
N9037 G1 X159.073 Y172.349 E.12342
N9038 G1 X190.544 Y140.878 E1.43118
N9039 G1 X190.544 Y137.04 E.12342
N9040 G1 X159.073 Y168.511 E1.43118
N9041 G1 X159.073 Y164.673 E.12342
N9042 G1 X190.544 Y133.202 E1.43118
N9043 G1 X190.544 Y129.364 E.12342
N9044 G1 X159.073 Y160.835 E1.43118
N9045 G1 X159.073 Y156.997 E.12342
N9046 G1 X190.544 Y125.526 E1.43118
N9047 G1 X190.544 Y123.999 E.04912
N9048 G1 X188.234 Y123.999 E.0743
N9049 G1 X159.073 Y153.159 E1.3261
N9050 G1 X159.073 Y149.321 E.12342
N9051 G1 X184.396 Y123.999 E1.15157
N9052 G1 X180.558 Y123.999 E.12342
N9053 G1 X159.073 Y145.483 E.97703
N9054 G1 X159.073 Y141.645 E.12342
N9055 G1 X176.72 Y123.999 E.80249
N9056 G1 X172.882 Y123.999 E.12342
N9057 G1 X159.073 Y137.807 E.62796
N9058 G1 X159.073 Y133.969 E.12342
N9059 G1 X169.044 Y123.999 E.45342
N9060 G1 X165.206 Y123.999 E.12342
N9061 G1 X159.073 Y130.131 E.27889
N9062 G1 X159.073 Y126.293 E.12342
N9063 G1 X161.551 Y123.815 E.11268
N9064 ; WIPE_START
N9065 G1 X160.137 Y125.23 E-.76
N9066 ; WIPE_END
N9067 G1 E-.04 F1800
N9068 M204 S10000
N9069 G17
N9070 G3 Z8.8 I1.217 J0 P1  F60000
N9071 ; stop printing object, unique label id: 79
N9072 M625
N9073 ; object ids of layer 42 start: 79
N9074 M624 AQAAAAAAAAA=
N9075 ;======== H2D 20250213========
N9076 ; SKIPPABLE_START
N9077 ; SKIPTYPE: timelapse
N9078 M622.1 S1 ; for prev firware, default turned on
N9079 
N9080 M1002 judge_flag timelapse_record_flag
N9081 
N9082 M622 J1
N9083 M993 A2 B2 C2
N9084 M993 A0 B0 C0
N9085 
N9086 
N9087 M9712 E1 M0
N9088 M83
N9089 G1 Z8.8 F1200
N9090 M400
N9091 M9713
N9092 
N9093 
N9094 M9711 M0 E1 Z8.8 S11 C10 O0 T3000
N9095 
N9096 
N9097 M9712 E1 M0
N9098 G90
N9099 G1 Z11.4
N9100 G1 Y295 F30000
N9101 G1 Y265 F18000
N9102 M83
N9103 M9713
N9104 
N9105 M993 A3 B3 C3
N9106 
N9107 M623
N9108 ; SKIPPABLE_END
N9109 
N9110 ; object ids of this layer42 end: 79
N9111 M625
N9112 ; CHANGE_LAYER
N9113 ; Z_HEIGHT: 8.6
N9114 ; LAYER_HEIGHT: 0.200001
N9115 ;======== H2D 20250521========
N9116 ; layer num/total_layer_count: 43/63
N9117 ; update layer progress
N9118 M73 L43
N9119 M991 S0 P42 ;notify layer change
N9120 
N9121 
N9122 M106 S71.4
N9123 ; OBJECT_ID: 79
N9124 ; COOLING_NODE: 0
N9125 ; start printing object, unique label id: 79
N9126 M624 AQAAAAAAAAA=
N9127 G1 X190.893 Y197.252 F60000
N9128 G1 Z8.6
N9129 G1 E.8 F1800
N9130 ; FEATURE: Inner wall
N9131 G1 F8475
N9132 M204 S8000
N9133 G1 X158.725 Y197.252 E1.03439
N9134 G1 X158.725 Y123.65 E2.36678
N9135 G1 X190.893 Y123.65 E1.03439
N9136 G1 X190.893 Y197.192 E2.36485
N9137 ; COOLING_NODE: 0
N9138 M204 S10000
N9139 G1 X191.3 Y197.659 F60000
N9140 G1 F8475
N9141 M204 S8000
N9142 G1 X158.318 Y197.659 E1.06057
N9143 M73 P70 R10
N9144 G1 X158.318 Y123.243 E2.39296
N9145 G1 X191.3 Y123.243 E1.06057
N9146 G1 X191.3 Y197.599 E2.39103
N9147 ; COOLING_NODE: 0
N9148 M204 S10000
N9149 G1 X191.707 Y198.067 F60000
N9150 G1 F8475
N9151 M204 S8000
N9152 G1 X157.911 Y198.067 E1.08675
N9153 G1 X157.911 Y122.836 E2.41914
N9154 G1 X191.707 Y122.836 E1.08675
N9155 G1 X191.707 Y198.007 E2.41721
N9156 ; COOLING_NODE: 0
N9157 M204 S10000
N9158 G1 X192.099 Y198.459 F60000
N9159 ; FEATURE: Outer wall
N9160 ; LINE_WIDTH: 0.42
N9161 G1 F9149.261
N9162 M204 S5000
N9163 G1 X157.519 Y198.459 E1.03002
N9164 G1 X157.519 Y122.444 E2.26421
N9165 G1 X192.099 Y122.444 E1.03002
N9166 G1 X192.099 Y198.399 E2.26243
N9167 G1 E-.8 F1800
N9168 M204 S10000
N9169 G1 X184.52 Y197.492 Z9 F60000
N9170 G1 X158.89 Y194.426 Z9
N9171 G1 Z8.6
N9172 G1 E.8 F1800
N9173 ; FEATURE: Sparse infill
N9174 ; LINE_WIDTH: 0.45
N9175 G1 F8475
N9176 M204 S8000
N9177 G1 X161.368 Y196.904 E.11268
N9178 G1 X165.206 Y196.904 E.12342
N9179 G1 X159.073 Y190.772 E.27889
N9180 G1 X159.073 Y186.934 E.12342
N9181 G1 X169.044 Y196.904 E.45342
N9182 G1 X172.882 Y196.904 E.12342
N9183 G1 X159.073 Y183.096 E.62796
N9184 G1 X159.073 Y179.258 E.12342
N9185 G1 X176.72 Y196.904 E.80249
N9186 G1 X180.558 Y196.904 E.12342
N9187 G1 X159.073 Y175.42 E.97703
N9188 G1 X159.073 Y171.582 E.12342
N9189 G1 X184.396 Y196.904 E1.15157
N9190 G1 X188.234 Y196.904 E.12342
N9191 G1 X159.073 Y167.744 E1.3261
N9192 G1 X159.073 Y163.906 E.12342
N9193 G1 X190.544 Y195.377 E1.43118
N9194 G1 X190.544 Y191.539 E.12342
N9195 G1 X159.073 Y160.068 E1.43118
N9196 G1 X159.073 Y156.23 E.12342
N9197 G1 X190.544 Y187.701 E1.43118
N9198 G1 X190.544 Y183.863 E.12342
N9199 G1 X159.073 Y152.392 E1.43118
N9200 G1 X159.073 Y148.554 E.12342
N9201 G1 X190.544 Y180.025 E1.43118
N9202 M73 P70 R9
N9203 G1 X190.544 Y176.187 E.12342
N9204 G1 X159.073 Y144.716 E1.43118
N9205 G1 X159.073 Y140.878 E.12342
N9206 G1 X190.544 Y172.349 E1.43118
N9207 G1 X190.544 Y168.511 E.12342
N9208 G1 X159.073 Y137.04 E1.43118
N9209 G1 X159.073 Y133.202 E.12342
N9210 G1 X190.544 Y164.673 E1.43118
N9211 G1 X190.544 Y160.835 E.12342
N9212 G1 X159.073 Y129.364 E1.43118
N9213 G1 X159.073 Y125.526 E.12342
N9214 G1 X190.544 Y156.997 E1.43118
N9215 G1 X190.544 Y153.159 E.12342
N9216 G1 X161.384 Y123.999 E1.3261
N9217 G1 X165.222 Y123.999 E.12342
N9218 G1 X190.544 Y149.321 E1.15157
N9219 G1 X190.544 Y145.483 E.12342
N9220 G1 X169.06 Y123.999 E.97703
N9221 G1 X172.898 Y123.999 E.12342
N9222 G1 X190.544 Y141.645 E.80249
N9223 G1 X190.544 Y137.807 E.12342
N9224 G1 X176.736 Y123.999 E.62796
N9225 G1 X180.574 Y123.999 E.12342
N9226 G1 X190.544 Y133.969 E.45342
N9227 G1 X190.544 Y130.131 E.12342
N9228 G1 X184.412 Y123.999 E.27889
N9229 G1 X188.25 Y123.999 E.12342
N9230 G1 X190.728 Y126.476 E.11268
N9231 ; WIPE_START
N9232 G1 X189.313 Y125.062 E-.76
N9233 ; WIPE_END
N9234 G1 E-.04 F1800
N9235 M204 S10000
N9236 G17
N9237 G3 Z9 I1.217 J0 P1  F60000
N9238 ; stop printing object, unique label id: 79
N9239 M625
N9240 ; object ids of layer 43 start: 79
N9241 M624 AQAAAAAAAAA=
N9242 ;======== H2D 20250213========
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
N9254 M9712 E1 M0
N9255 M83
N9256 G1 Z9 F1200
N9257 M400
N9258 M9713
N9259 
N9260 
N9261 M9711 M0 E1 Z9 S11 C10 O0 T3000
N9262 
N9263 
N9264 M9712 E1 M0
N9265 G90
N9266 G1 Z11.6
N9267 G1 Y295 F30000
N9268 G1 Y265 F18000
N9269 M83
N9270 M9713
N9271 
N9272 M993 A3 B3 C3
N9273 
N9274 M623
N9275 ; SKIPPABLE_END
N9276 
N9277 ; object ids of this layer43 end: 79
N9278 M625
N9279 ; CHANGE_LAYER
N9280 ; Z_HEIGHT: 8.8
N9281 ; LAYER_HEIGHT: 0.2
N9282 ;======== H2D 20250521========
N9283 ; layer num/total_layer_count: 44/63
N9284 ; update layer progress
N9285 M73 L44
N9286 M991 S0 P43 ;notify layer change
N9287 
N9288 
N9289 M106 S73.95
N9290 ; OBJECT_ID: 79
N9291 ; COOLING_NODE: 0
N9292 ; start printing object, unique label id: 79
N9293 M624 AQAAAAAAAAA=
N9294 G1 X190.893 Y197.252 F60000
N9295 G1 Z8.8
N9296 G1 E.8 F1800
N9297 ; FEATURE: Inner wall
N9298 G1 F8475
N9299 M204 S8000
N9300 G1 X158.725 Y197.252 E1.03439
N9301 G1 X158.725 Y123.65 E2.36678
N9302 G1 X190.893 Y123.65 E1.03439
N9303 G1 X190.893 Y197.192 E2.36485
N9304 ; COOLING_NODE: 0
N9305 M204 S10000
N9306 G1 X191.3 Y197.659 F60000
N9307 G1 F8475
N9308 M204 S8000
N9309 G1 X158.318 Y197.659 E1.06057
N9310 G1 X158.318 Y123.243 E2.39296
N9311 G1 X191.3 Y123.243 E1.06057
N9312 G1 X191.3 Y197.599 E2.39103
N9313 ; COOLING_NODE: 0
N9314 M204 S10000
N9315 G1 X191.707 Y198.067 F60000
N9316 G1 F8475
N9317 M204 S8000
N9318 G1 X157.911 Y198.067 E1.08675
N9319 G1 X157.911 Y122.836 E2.41914
N9320 G1 X191.707 Y122.836 E1.08675
N9321 G1 X191.707 Y198.007 E2.41721
N9322 ; COOLING_NODE: 0
N9323 M204 S10000
N9324 G1 X192.099 Y198.459 F60000
N9325 ; FEATURE: Outer wall
N9326 ; LINE_WIDTH: 0.42
N9327 G1 F9149.261
N9328 M204 S5000
N9329 G1 X157.519 Y198.459 E1.03002
N9330 G1 X157.519 Y122.444 E2.26421
N9331 G1 X192.099 Y122.444 E1.03002
N9332 G1 X192.099 Y198.399 E2.26243
N9333 G1 E-.8 F1800
N9334 M204 S10000
N9335 G1 X188.067 Y197.087 Z9.2 F60000
N9336 G1 Z8.8
N9337 M73 P71 R9
N9338 G1 E.8 F1800
N9339 ; FEATURE: Sparse infill
N9340 ; LINE_WIDTH: 0.45
N9341 G1 F8475
N9342 M204 S8000
N9343 G1 X190.544 Y194.609 E.11268
N9344 G1 X190.544 Y190.772 E.12342
N9345 G1 X184.412 Y196.904 E.27889
N9346 G1 X180.574 Y196.904 E.12342
N9347 G1 X190.544 Y186.934 E.45342
N9348 G1 X190.544 Y183.096 E.12342
N9349 G1 X176.736 Y196.904 E.62796
N9350 G1 X172.898 Y196.904 E.12342
N9351 G1 X190.544 Y179.258 E.80249
N9352 G1 X190.544 Y175.42 E.12342
N9353 G1 X169.06 Y196.904 E.97703
N9354 G1 X165.222 Y196.904 E.12342
N9355 G1 X190.544 Y171.582 E1.15157
N9356 G1 X190.544 Y167.744 E.12342
N9357 G1 X161.384 Y196.904 E1.3261
N9358 G1 X159.073 Y196.904 E.0743
N9359 G1 X159.073 Y195.377 E.04912
N9360 G1 X190.544 Y163.906 E1.43118
N9361 G1 X190.544 Y160.068 E.12342
N9362 G1 X159.073 Y191.539 E1.43118
N9363 G1 X159.073 Y187.701 E.12342
N9364 G1 X190.544 Y156.23 E1.43118
N9365 G1 X190.544 Y152.392 E.12342
N9366 G1 X159.073 Y183.863 E1.43118
N9367 G1 X159.073 Y180.025 E.12342
N9368 G1 X190.544 Y148.554 E1.43118
N9369 G1 X190.544 Y144.716 E.12342
N9370 G1 X159.073 Y176.187 E1.43118
N9371 G1 X159.073 Y172.349 E.12342
N9372 G1 X190.544 Y140.878 E1.43118
N9373 G1 X190.544 Y137.04 E.12342
N9374 G1 X159.073 Y168.511 E1.43118
N9375 G1 X159.073 Y164.673 E.12342
N9376 G1 X190.544 Y133.202 E1.43118
N9377 G1 X190.544 Y129.364 E.12342
N9378 G1 X159.073 Y160.835 E1.43118
N9379 G1 X159.073 Y156.997 E.12342
N9380 G1 X190.544 Y125.526 E1.43118
N9381 G1 X190.544 Y123.999 E.04912
N9382 G1 X188.234 Y123.999 E.0743
N9383 G1 X159.073 Y153.159 E1.3261
N9384 G1 X159.073 Y149.321 E.12342
N9385 G1 X184.396 Y123.999 E1.15157
N9386 G1 X180.558 Y123.999 E.12342
N9387 G1 X159.073 Y145.483 E.97703
N9388 G1 X159.073 Y141.645 E.12342
N9389 G1 X176.72 Y123.999 E.80249
N9390 G1 X172.882 Y123.999 E.12342
N9391 G1 X159.073 Y137.807 E.62796
N9392 G1 X159.073 Y133.969 E.12342
N9393 G1 X169.044 Y123.999 E.45342
N9394 G1 X165.206 Y123.999 E.12342
N9395 G1 X159.073 Y130.131 E.27889
N9396 G1 X159.073 Y126.293 E.12342
N9397 G1 X161.551 Y123.815 E.11268
N9398 ; WIPE_START
N9399 G1 X160.137 Y125.23 E-.76
N9400 ; WIPE_END
N9401 G1 E-.04 F1800
N9402 M204 S10000
N9403 G17
N9404 G3 Z9.2 I1.217 J0 P1  F60000
N9405 ; stop printing object, unique label id: 79
N9406 M625
N9407 ; object ids of layer 44 start: 79
N9408 M624 AQAAAAAAAAA=
N9409 ;======== H2D 20250213========
N9410 ; SKIPPABLE_START
N9411 ; SKIPTYPE: timelapse
N9412 M622.1 S1 ; for prev firware, default turned on
N9413 
N9414 M1002 judge_flag timelapse_record_flag
N9415 
N9416 M622 J1
N9417 M993 A2 B2 C2
N9418 M993 A0 B0 C0
N9419 
N9420 
N9421 M9712 E1 M0
N9422 M83
N9423 G1 Z9.2 F1200
N9424 M400
N9425 M9713
N9426 
N9427 
N9428 M9711 M0 E1 Z9.2 S11 C10 O0 T3000
N9429 
N9430 
N9431 M9712 E1 M0
N9432 G90
N9433 G1 Z11.8
N9434 G1 Y295 F30000
N9435 G1 Y265 F18000
N9436 M83
N9437 M9713
N9438 
N9439 M993 A3 B3 C3
N9440 
N9441 M623
N9442 ; SKIPPABLE_END
N9443 
N9444 ; object ids of this layer44 end: 79
N9445 M625
N9446 ; CHANGE_LAYER
N9447 ; Z_HEIGHT: 9
N9448 ; LAYER_HEIGHT: 0.2
N9449 ;======== H2D 20250521========
N9450 ; layer num/total_layer_count: 45/63
N9451 ; update layer progress
N9452 M73 L45
N9453 M991 S0 P44 ;notify layer change
N9454 
N9455 
N9456 M106 S71.4
N9457 ; OBJECT_ID: 79
N9458 ; COOLING_NODE: 0
N9459 ; start printing object, unique label id: 79
N9460 M624 AQAAAAAAAAA=
N9461 G1 X190.893 Y197.252 F60000
N9462 G1 Z9
N9463 G1 E.8 F1800
N9464 ; FEATURE: Inner wall
N9465 G1 F8475
N9466 M204 S8000
N9467 G1 X158.725 Y197.252 E1.03439
N9468 G1 X158.725 Y123.65 E2.36678
N9469 G1 X190.893 Y123.65 E1.03439
N9470 G1 X190.893 Y197.192 E2.36485
N9471 ; COOLING_NODE: 0
N9472 M204 S10000
N9473 G1 X191.3 Y197.659 F60000
N9474 G1 F8475
N9475 M204 S8000
N9476 G1 X158.318 Y197.659 E1.06057
N9477 G1 X158.318 Y123.243 E2.39296
N9478 G1 X191.3 Y123.243 E1.06057
N9479 G1 X191.3 Y197.599 E2.39103
N9480 ; COOLING_NODE: 0
N9481 M204 S10000
N9482 G1 X191.707 Y198.067 F60000
N9483 G1 F8475
N9484 M204 S8000
N9485 G1 X157.911 Y198.067 E1.08675
N9486 G1 X157.911 Y122.836 E2.41914
N9487 G1 X191.707 Y122.836 E1.08675
N9488 G1 X191.707 Y198.007 E2.41721
N9489 ; COOLING_NODE: 0
N9490 M204 S10000
N9491 G1 X192.099 Y198.459 F60000
N9492 ; FEATURE: Outer wall
N9493 ; LINE_WIDTH: 0.42
N9494 G1 F9149.261
N9495 M204 S5000
N9496 G1 X157.519 Y198.459 E1.03002
N9497 G1 X157.519 Y122.444 E2.26421
N9498 G1 X192.099 Y122.444 E1.03002
N9499 G1 X192.099 Y198.399 E2.26243
N9500 G1 E-.8 F1800
N9501 M204 S10000
N9502 G1 X184.52 Y197.492 Z9.4 F60000
N9503 G1 X158.89 Y194.426 Z9.4
N9504 G1 Z9
N9505 G1 E.8 F1800
N9506 ; FEATURE: Sparse infill
N9507 ; LINE_WIDTH: 0.45
N9508 G1 F8475
N9509 M204 S8000
N9510 G1 X161.368 Y196.904 E.11268
N9511 G1 X165.206 Y196.904 E.12342
N9512 G1 X159.073 Y190.772 E.27889
N9513 G1 X159.073 Y186.934 E.12342
N9514 G1 X169.044 Y196.904 E.45342
N9515 G1 X172.882 Y196.904 E.12342
N9516 G1 X159.073 Y183.096 E.62796
N9517 G1 X159.073 Y179.258 E.12342
N9518 G1 X176.72 Y196.904 E.80249
N9519 G1 X180.558 Y196.904 E.12342
N9520 G1 X159.073 Y175.42 E.97703
N9521 G1 X159.073 Y171.582 E.12342
N9522 G1 X184.396 Y196.904 E1.15157
N9523 G1 X188.234 Y196.904 E.12342
N9524 G1 X159.073 Y167.744 E1.3261
N9525 G1 X159.073 Y163.906 E.12342
N9526 G1 X190.544 Y195.377 E1.43118
N9527 G1 X190.544 Y191.539 E.12342
N9528 G1 X159.073 Y160.068 E1.43118
N9529 G1 X159.073 Y156.23 E.12342
N9530 G1 X190.544 Y187.701 E1.43118
N9531 G1 X190.544 Y183.863 E.12342
N9532 G1 X159.073 Y152.392 E1.43118
N9533 G1 X159.073 Y148.554 E.12342
N9534 G1 X190.544 Y180.025 E1.43118
N9535 G1 X190.544 Y176.187 E.12342
N9536 G1 X159.073 Y144.716 E1.43118
N9537 G1 X159.073 Y140.878 E.12342
N9538 G1 X190.544 Y172.349 E1.43118
N9539 G1 X190.544 Y168.511 E.12342
N9540 G1 X159.073 Y137.04 E1.43118
N9541 G1 X159.073 Y133.202 E.12342
N9542 G1 X190.544 Y164.673 E1.43118
N9543 G1 X190.544 Y160.835 E.12342
N9544 M73 P72 R9
N9545 G1 X159.073 Y129.364 E1.43118
N9546 G1 X159.073 Y125.526 E.12342
N9547 G1 X190.544 Y156.997 E1.43118
N9548 G1 X190.544 Y153.159 E.12342
N9549 G1 X161.384 Y123.999 E1.3261
N9550 G1 X165.222 Y123.999 E.12342
N9551 G1 X190.544 Y149.321 E1.15157
N9552 G1 X190.544 Y145.483 E.12342
N9553 G1 X169.06 Y123.999 E.97703
N9554 G1 X172.898 Y123.999 E.12342
N9555 G1 X190.544 Y141.645 E.80249
N9556 G1 X190.544 Y137.807 E.12342
N9557 G1 X176.736 Y123.999 E.62796
N9558 G1 X180.574 Y123.999 E.12342
N9559 G1 X190.544 Y133.969 E.45342
N9560 G1 X190.544 Y130.131 E.12342
N9561 G1 X184.412 Y123.999 E.27889
N9562 G1 X188.25 Y123.999 E.12342
N9563 G1 X190.728 Y126.476 E.11268
N9564 ; WIPE_START
N9565 G1 X189.313 Y125.062 E-.76
N9566 ; WIPE_END
N9567 G1 E-.04 F1800
N9568 M204 S10000
N9569 G17
N9570 G3 Z9.4 I1.217 J0 P1  F60000
N9571 ; stop printing object, unique label id: 79
N9572 M625
N9573 ; object ids of layer 45 start: 79
N9574 M624 AQAAAAAAAAA=
N9575 ;======== H2D 20250213========
N9576 ; SKIPPABLE_START
N9577 ; SKIPTYPE: timelapse
N9578 M622.1 S1 ; for prev firware, default turned on
N9579 
N9580 M1002 judge_flag timelapse_record_flag
N9581 
N9582 M622 J1
N9583 M993 A2 B2 C2
N9584 M993 A0 B0 C0
N9585 
N9586 
N9587 M9712 E1 M0
N9588 M83
N9589 G1 Z9.4 F1200
N9590 M400
N9591 M9713
N9592 
N9593 
N9594 M9711 M0 E1 Z9.4 S11 C10 O0 T3000
N9595 
N9596 
N9597 M9712 E1 M0
N9598 G90
N9599 G1 Z12
N9600 G1 Y295 F30000
N9601 G1 Y265 F18000
N9602 M83
N9603 M9713
N9604 
N9605 M993 A3 B3 C3
N9606 
N9607 M623
N9608 ; SKIPPABLE_END
N9609 
N9610 ; object ids of this layer45 end: 79
N9611 M625
N9612 ; CHANGE_LAYER
N9613 ; Z_HEIGHT: 9.2
N9614 ; LAYER_HEIGHT: 0.2
N9615 ;======== H2D 20250521========
N9616 ; layer num/total_layer_count: 46/63
N9617 ; update layer progress
N9618 M73 L46
N9619 M991 S0 P45 ;notify layer change
N9620 
N9621 
N9622 M106 S73.95
N9623 ; OBJECT_ID: 79
N9624 ; COOLING_NODE: 0
N9625 ; start printing object, unique label id: 79
N9626 M624 AQAAAAAAAAA=
N9627 G1 X190.893 Y197.252 F60000
N9628 G1 Z9.2
N9629 G1 E.8 F1800
N9630 ; FEATURE: Inner wall
N9631 G1 F8475
N9632 M204 S8000
N9633 G1 X158.725 Y197.252 E1.03439
N9634 G1 X158.725 Y123.65 E2.36678
N9635 G1 X190.893 Y123.65 E1.03439
N9636 G1 X190.893 Y197.192 E2.36485
N9637 ; COOLING_NODE: 0
N9638 M204 S10000
N9639 G1 X191.3 Y197.659 F60000
N9640 G1 F8475
N9641 M204 S8000
N9642 G1 X158.318 Y197.659 E1.06057
N9643 G1 X158.318 Y123.243 E2.39296
N9644 G1 X191.3 Y123.243 E1.06057
N9645 G1 X191.3 Y197.599 E2.39103
N9646 ; COOLING_NODE: 0
N9647 M204 S10000
N9648 G1 X191.707 Y198.067 F60000
N9649 G1 F8475
N9650 M204 S8000
N9651 G1 X157.911 Y198.067 E1.08675
N9652 G1 X157.911 Y122.836 E2.41914
N9653 G1 X191.707 Y122.836 E1.08675
N9654 G1 X191.707 Y198.007 E2.41721
N9655 ; COOLING_NODE: 0
N9656 M204 S10000
N9657 G1 X192.099 Y198.459 F60000
N9658 ; FEATURE: Outer wall
N9659 ; LINE_WIDTH: 0.42
N9660 G1 F9149.261
N9661 M204 S5000
N9662 G1 X157.519 Y198.459 E1.03002
N9663 G1 X157.519 Y122.444 E2.26421
N9664 G1 X192.099 Y122.444 E1.03002
N9665 G1 X192.099 Y198.399 E2.26243
N9666 G1 E-.8 F1800
N9667 M204 S10000
N9668 G1 X188.067 Y197.087 Z9.6 F60000
N9669 G1 Z9.2
N9670 G1 E.8 F1800
N9671 ; FEATURE: Sparse infill
N9672 ; LINE_WIDTH: 0.45
N9673 G1 F8475
N9674 M204 S8000
N9675 G1 X190.544 Y194.609 E.11268
N9676 G1 X190.544 Y190.772 E.12342
N9677 G1 X184.412 Y196.904 E.27889
N9678 G1 X180.574 Y196.904 E.12342
N9679 G1 X190.544 Y186.934 E.45342
N9680 G1 X190.544 Y183.096 E.12342
N9681 G1 X176.736 Y196.904 E.62796
N9682 G1 X172.898 Y196.904 E.12342
N9683 G1 X190.544 Y179.258 E.80249
N9684 G1 X190.544 Y175.42 E.12342
N9685 G1 X169.06 Y196.904 E.97703
N9686 G1 X165.222 Y196.904 E.12342
N9687 G1 X190.544 Y171.582 E1.15157
N9688 G1 X190.544 Y167.744 E.12342
N9689 G1 X161.384 Y196.904 E1.3261
N9690 G1 X159.073 Y196.904 E.0743
N9691 G1 X159.073 Y195.377 E.04912
N9692 G1 X190.544 Y163.906 E1.43118
N9693 G1 X190.544 Y160.068 E.12342
N9694 G1 X159.073 Y191.539 E1.43118
N9695 G1 X159.073 Y187.701 E.12342
N9696 G1 X190.544 Y156.23 E1.43118
N9697 G1 X190.544 Y152.392 E.12342
N9698 G1 X159.073 Y183.863 E1.43118
N9699 G1 X159.073 Y180.025 E.12342
N9700 G1 X190.544 Y148.554 E1.43118
N9701 G1 X190.544 Y144.716 E.12342
N9702 G1 X159.073 Y176.187 E1.43118
N9703 G1 X159.073 Y172.349 E.12342
N9704 G1 X190.544 Y140.878 E1.43118
N9705 G1 X190.544 Y137.04 E.12342
N9706 G1 X159.073 Y168.511 E1.43118
N9707 G1 X159.073 Y164.673 E.12342
N9708 G1 X190.544 Y133.202 E1.43118
N9709 G1 X190.544 Y129.364 E.12342
N9710 G1 X159.073 Y160.835 E1.43118
N9711 G1 X159.073 Y156.997 E.12342
N9712 G1 X190.544 Y125.526 E1.43118
N9713 G1 X190.544 Y123.999 E.04912
N9714 G1 X188.234 Y123.999 E.0743
N9715 G1 X159.073 Y153.159 E1.3261
N9716 G1 X159.073 Y149.321 E.12342
N9717 G1 X184.396 Y123.999 E1.15157
N9718 G1 X180.558 Y123.999 E.12342
N9719 G1 X159.073 Y145.483 E.97703
N9720 G1 X159.073 Y141.645 E.12342
N9721 G1 X176.72 Y123.999 E.80249
N9722 G1 X172.882 Y123.999 E.12342
N9723 G1 X159.073 Y137.807 E.62796
N9724 G1 X159.073 Y133.969 E.12342
N9725 G1 X169.044 Y123.999 E.45342
N9726 G1 X165.206 Y123.999 E.12342
N9727 G1 X159.073 Y130.131 E.27889
N9728 G1 X159.073 Y126.293 E.12342
N9729 G1 X161.551 Y123.815 E.11268
N9730 ; WIPE_START
N9731 G1 X160.137 Y125.23 E-.76
N9732 ; WIPE_END
N9733 G1 E-.04 F1800
N9734 M204 S10000
N9735 G17
N9736 G3 Z9.6 I1.217 J0 P1  F60000
N9737 ; stop printing object, unique label id: 79
N9738 M625
N9739 ; object ids of layer 46 start: 79
N9740 M624 AQAAAAAAAAA=
N9741 ;======== H2D 20250213========
N9742 ; SKIPPABLE_START
N9743 ; SKIPTYPE: timelapse
N9744 M622.1 S1 ; for prev firware, default turned on
N9745 
N9746 M1002 judge_flag timelapse_record_flag
N9747 
N9748 M622 J1
N9749 M993 A2 B2 C2
N9750 M993 A0 B0 C0
N9751 
N9752 
N9753 M9712 E1 M0
N9754 M83
N9755 G1 Z9.6 F1200
N9756 M400
N9757 M9713
N9758 
N9759 
N9760 M9711 M0 E1 Z9.6 S11 C10 O0 T3000
N9761 
N9762 
N9763 M9712 E1 M0
N9764 G90
N9765 G1 Z12.2
N9766 G1 Y295 F30000
N9767 G1 Y265 F18000
N9768 M83
N9769 M9713
N9770 
N9771 M993 A3 B3 C3
N9772 
N9773 M623
N9774 ; SKIPPABLE_END
N9775 
N9776 ; object ids of this layer46 end: 79
N9777 M625
N9778 ; CHANGE_LAYER
N9779 ; Z_HEIGHT: 9.4
N9780 ; LAYER_HEIGHT: 0.2
N9781 ;======== H2D 20250521========
N9782 ; layer num/total_layer_count: 47/63
N9783 ; update layer progress
N9784 M73 L47
N9785 M991 S0 P46 ;notify layer change
N9786 
N9787 
N9788 M106 S71.4
N9789 ; OBJECT_ID: 79
N9790 ; COOLING_NODE: 0
N9791 ; start printing object, unique label id: 79
N9792 M624 AQAAAAAAAAA=
N9793 G1 X190.893 Y197.252 F60000
N9794 G1 Z9.4
N9795 G1 E.8 F1800
N9796 ; FEATURE: Inner wall
N9797 G1 F8475
N9798 M204 S8000
N9799 G1 X158.725 Y197.252 E1.03439
N9800 G1 X158.725 Y123.65 E2.36678
N9801 G1 X190.893 Y123.65 E1.03439
N9802 G1 X190.893 Y197.192 E2.36485
N9803 ; COOLING_NODE: 0
N9804 M204 S10000
N9805 G1 X191.3 Y197.659 F60000
N9806 G1 F8475
N9807 M204 S8000
N9808 M73 P73 R9
N9809 G1 X158.318 Y197.659 E1.06057
N9810 G1 X158.318 Y123.243 E2.39296
N9811 G1 X191.3 Y123.243 E1.06057
N9812 G1 X191.3 Y197.599 E2.39103
N9813 ; COOLING_NODE: 0
N9814 M204 S10000
N9815 G1 X191.707 Y198.067 F60000
N9816 G1 F8475
N9817 M204 S8000
N9818 G1 X157.911 Y198.067 E1.08675
N9819 G1 X157.911 Y122.836 E2.41914
N9820 G1 X191.707 Y122.836 E1.08675
N9821 G1 X191.707 Y198.007 E2.41721
N9822 ; COOLING_NODE: 0
N9823 M204 S10000
N9824 G1 X192.099 Y198.459 F60000
N9825 ; FEATURE: Outer wall
N9826 ; LINE_WIDTH: 0.42
N9827 G1 F9149.261
N9828 M204 S5000
N9829 G1 X157.519 Y198.459 E1.03002
N9830 G1 X157.519 Y122.444 E2.26421
N9831 G1 X192.099 Y122.444 E1.03002
N9832 G1 X192.099 Y198.399 E2.26243
N9833 G1 E-.8 F1800
N9834 M204 S10000
N9835 G1 X184.52 Y197.492 Z9.8 F60000
N9836 G1 X158.89 Y194.426 Z9.8
N9837 G1 Z9.4
N9838 G1 E.8 F1800
N9839 ; FEATURE: Sparse infill
N9840 ; LINE_WIDTH: 0.45
N9841 G1 F8475
N9842 M204 S8000
N9843 G1 X161.368 Y196.904 E.11268
N9844 G1 X165.206 Y196.904 E.12342
N9845 G1 X159.073 Y190.772 E.27889
N9846 G1 X159.073 Y186.934 E.12342
N9847 G1 X169.044 Y196.904 E.45342
N9848 G1 X172.882 Y196.904 E.12342
N9849 G1 X159.073 Y183.096 E.62796
N9850 G1 X159.073 Y179.258 E.12342
N9851 G1 X176.72 Y196.904 E.80249
N9852 G1 X180.558 Y196.904 E.12342
N9853 G1 X159.073 Y175.42 E.97703
N9854 G1 X159.073 Y171.582 E.12342
N9855 G1 X184.396 Y196.904 E1.15157
N9856 G1 X188.234 Y196.904 E.12342
N9857 G1 X159.073 Y167.744 E1.3261
N9858 G1 X159.073 Y163.906 E.12342
N9859 G1 X190.544 Y195.377 E1.43118
N9860 G1 X190.544 Y191.539 E.12342
N9861 G1 X159.073 Y160.068 E1.43118
N9862 G1 X159.073 Y156.23 E.12342
N9863 M73 P73 R8
N9864 G1 X190.544 Y187.701 E1.43118
N9865 G1 X190.544 Y183.863 E.12342
N9866 G1 X159.073 Y152.392 E1.43118
N9867 G1 X159.073 Y148.554 E.12342
N9868 G1 X190.544 Y180.025 E1.43118
N9869 G1 X190.544 Y176.187 E.12342
N9870 G1 X159.073 Y144.716 E1.43118
N9871 G1 X159.073 Y140.878 E.12342
N9872 G1 X190.544 Y172.349 E1.43118
N9873 G1 X190.544 Y168.511 E.12342
N9874 G1 X159.073 Y137.04 E1.43118
N9875 G1 X159.073 Y133.202 E.12342
N9876 G1 X190.544 Y164.673 E1.43118
N9877 G1 X190.544 Y160.835 E.12342
N9878 G1 X159.073 Y129.364 E1.43118
N9879 G1 X159.073 Y125.526 E.12342
N9880 G1 X190.544 Y156.997 E1.43118
N9881 G1 X190.544 Y153.159 E.12342
N9882 G1 X161.384 Y123.999 E1.3261
N9883 G1 X165.222 Y123.999 E.12342
N9884 G1 X190.544 Y149.321 E1.15157
N9885 G1 X190.544 Y145.483 E.12342
N9886 G1 X169.06 Y123.999 E.97703
N9887 G1 X172.898 Y123.999 E.12342
N9888 G1 X190.544 Y141.645 E.80249
N9889 G1 X190.544 Y137.807 E.12342
N9890 G1 X176.736 Y123.999 E.62796
N9891 G1 X180.574 Y123.999 E.12342
N9892 G1 X190.544 Y133.969 E.45342
N9893 G1 X190.544 Y130.131 E.12342
N9894 G1 X184.412 Y123.999 E.27889
N9895 G1 X188.25 Y123.999 E.12342
N9896 G1 X190.728 Y126.476 E.11268
N9897 ; WIPE_START
N9898 G1 X189.313 Y125.062 E-.76
N9899 ; WIPE_END
N9900 G1 E-.04 F1800
N9901 M204 S10000
N9902 G17
N9903 G3 Z9.8 I1.217 J0 P1  F60000
N9904 ; stop printing object, unique label id: 79
N9905 M625
N9906 ; object ids of layer 47 start: 79
N9907 M624 AQAAAAAAAAA=
N9908 ;======== H2D 20250213========
N9909 ; SKIPPABLE_START
N9910 ; SKIPTYPE: timelapse
N9911 M622.1 S1 ; for prev firware, default turned on
N9912 
N9913 M1002 judge_flag timelapse_record_flag
N9914 
N9915 M622 J1
N9916 M993 A2 B2 C2
N9917 M993 A0 B0 C0
N9918 
N9919 
N9920 M9712 E1 M0
N9921 M83
N9922 G1 Z9.8 F1200
N9923 M400
N9924 M9713
N9925 
N9926 
N9927 M9711 M0 E1 Z9.8 S11 C10 O0 T3000
N9928 
N9929 
N9930 M9712 E1 M0
N9931 G90
N9932 G1 Z12.4
N9933 G1 Y295 F30000
N9934 G1 Y265 F18000
N9935 M83
N9936 M9713
N9937 
N9938 M993 A3 B3 C3
N9939 
N9940 M623
N9941 ; SKIPPABLE_END
N9942 
N9943 ; object ids of this layer47 end: 79
N9944 M625
N9945 ; CHANGE_LAYER
N9946 ; Z_HEIGHT: 9.6
N9947 ; LAYER_HEIGHT: 0.200001
N9948 ;======== H2D 20250521========
N9949 ; layer num/total_layer_count: 48/63
N9950 ; update layer progress
N9951 M73 L48
N9952 M991 S0 P47 ;notify layer change
N9953 
N9954 
N9955 M106 S73.95
N9956 ; OBJECT_ID: 79
N9957 ; COOLING_NODE: 0
N9958 ; start printing object, unique label id: 79
N9959 M624 AQAAAAAAAAA=
N9960 G1 X190.893 Y197.252 F60000
N9961 G1 Z9.6
N9962 G1 E.8 F1800
N9963 ; FEATURE: Inner wall
N9964 G1 F8475
N9965 M204 S8000
N9966 G1 X158.725 Y197.252 E1.03439
N9967 G1 X158.725 Y123.65 E2.36678
N9968 G1 X190.893 Y123.65 E1.03439
N9969 G1 X190.893 Y197.192 E2.36485
N9970 ; COOLING_NODE: 0
N9971 M204 S10000
N9972 G1 X191.3 Y197.659 F60000
N9973 G1 F8475
N9974 M204 S8000
N9975 G1 X158.318 Y197.659 E1.06057
N9976 G1 X158.318 Y123.243 E2.39296
N9977 G1 X191.3 Y123.243 E1.06057
N9978 G1 X191.3 Y197.599 E2.39103
N9979 ; COOLING_NODE: 0
N9980 M204 S10000
N9981 G1 X191.707 Y198.067 F60000
N9982 G1 F8475
N9983 M204 S8000
N9984 G1 X157.911 Y198.067 E1.08675
N9985 G1 X157.911 Y122.836 E2.41914
N9986 G1 X191.707 Y122.836 E1.08675
N9987 G1 X191.707 Y198.007 E2.41721
N9988 ; COOLING_NODE: 0
N9989 M204 S10000
N9990 G1 X192.099 Y198.459 F60000
N9991 ; FEATURE: Outer wall
N9992 ; LINE_WIDTH: 0.42
N9993 G1 F9149.261
N9994 M204 S5000
N9995 G1 X157.519 Y198.459 E1.03002
N9996 G1 X157.519 Y122.444 E2.26421
N9997 G1 X192.099 Y122.444 E1.03002
N9998 G1 X192.099 Y198.399 E2.26243
N9999 G1 E-.8 F1800
N10000 M204 S10000
N10001 G1 X188.067 Y197.087 Z10 F60000
N10002 G1 Z9.6
N10003 M73 P74 R8
N10004 G1 E.8 F1800
N10005 ; FEATURE: Sparse infill
N10006 ; LINE_WIDTH: 0.45
N10007 G1 F8475
N10008 M204 S8000
N10009 G1 X190.544 Y194.609 E.11268
N10010 G1 X190.544 Y190.772 E.12342
N10011 G1 X184.412 Y196.904 E.27889
N10012 G1 X180.574 Y196.904 E.12342
N10013 G1 X190.544 Y186.934 E.45342
N10014 G1 X190.544 Y183.096 E.12342
N10015 G1 X176.736 Y196.904 E.62796
N10016 G1 X172.898 Y196.904 E.12342
N10017 G1 X190.544 Y179.258 E.80249
N10018 G1 X190.544 Y175.42 E.12342
N10019 G1 X169.06 Y196.904 E.97703
N10020 G1 X165.222 Y196.904 E.12342
N10021 G1 X190.544 Y171.582 E1.15157
N10022 G1 X190.544 Y167.744 E.12342
N10023 G1 X161.384 Y196.904 E1.3261
N10024 G1 X159.073 Y196.904 E.0743
N10025 G1 X159.073 Y195.377 E.04912
N10026 G1 X190.544 Y163.906 E1.43118
N10027 G1 X190.544 Y160.068 E.12342
N10028 G1 X159.073 Y191.539 E1.43118
N10029 G1 X159.073 Y187.701 E.12342
N10030 G1 X190.544 Y156.23 E1.43118
N10031 G1 X190.544 Y152.392 E.12342
N10032 G1 X159.073 Y183.863 E1.43118
N10033 G1 X159.073 Y180.025 E.12342
N10034 G1 X190.544 Y148.554 E1.43118
N10035 G1 X190.544 Y144.716 E.12342
N10036 G1 X159.073 Y176.187 E1.43118
N10037 G1 X159.073 Y172.349 E.12342
N10038 G1 X190.544 Y140.878 E1.43118
N10039 G1 X190.544 Y137.04 E.12342
N10040 G1 X159.073 Y168.511 E1.43118
N10041 G1 X159.073 Y164.673 E.12342
N10042 G1 X190.544 Y133.202 E1.43118
N10043 G1 X190.544 Y129.364 E.12342
N10044 G1 X159.073 Y160.835 E1.43118
N10045 G1 X159.073 Y156.997 E.12342
N10046 G1 X190.544 Y125.526 E1.43118
N10047 G1 X190.544 Y123.999 E.04912
N10048 G1 X188.234 Y123.999 E.0743
N10049 G1 X159.073 Y153.159 E1.3261
N10050 G1 X159.073 Y149.321 E.12342
N10051 G1 X184.396 Y123.999 E1.15157
N10052 G1 X180.558 Y123.999 E.12342
N10053 G1 X159.073 Y145.483 E.97703
N10054 G1 X159.073 Y141.645 E.12342
N10055 G1 X176.72 Y123.999 E.80249
N10056 G1 X172.882 Y123.999 E.12342
N10057 G1 X159.073 Y137.807 E.62796
N10058 G1 X159.073 Y133.969 E.12342
N10059 G1 X169.044 Y123.999 E.45342
N10060 G1 X165.206 Y123.999 E.12342
N10061 G1 X159.073 Y130.131 E.27889
N10062 G1 X159.073 Y126.293 E.12342
N10063 G1 X161.551 Y123.815 E.11268
N10064 ; WIPE_START
N10065 G1 X160.137 Y125.23 E-.76
N10066 ; WIPE_END
N10067 G1 E-.04 F1800
N10068 M204 S10000
N10069 G17
N10070 G3 Z10 I1.217 J0 P1  F60000
N10071 ; stop printing object, unique label id: 79
N10072 M625
N10073 ; object ids of layer 48 start: 79
N10074 M624 AQAAAAAAAAA=
N10075 ;======== H2D 20250213========
N10076 ; SKIPPABLE_START
N10077 ; SKIPTYPE: timelapse
N10078 M622.1 S1 ; for prev firware, default turned on
N10079 
N10080 M1002 judge_flag timelapse_record_flag
N10081 
N10082 M622 J1
N10083 M993 A2 B2 C2
N10084 M993 A0 B0 C0
N10085 
N10086 
N10087 M9712 E1 M0
N10088 M83
N10089 G1 Z10 F1200
N10090 M400
N10091 M9713
N10092 
N10093 
N10094 M9711 M0 E1 Z10 S11 C10 O0 T3000
N10095 
N10096 
N10097 M9712 E1 M0
N10098 G90
N10099 G1 Z12.6
N10100 G1 Y295 F30000
N10101 G1 Y265 F18000
N10102 M83
N10103 M9713
N10104 
N10105 M993 A3 B3 C3
N10106 
N10107 M623
N10108 ; SKIPPABLE_END
N10109 
N10110 ; object ids of this layer48 end: 79
N10111 M625
N10112 ; CHANGE_LAYER
N10113 ; Z_HEIGHT: 9.8
N10114 ; LAYER_HEIGHT: 0.2
N10115 ;======== H2D 20250521========
N10116 ; layer num/total_layer_count: 49/63
N10117 ; update layer progress
N10118 M73 L49
N10119 M991 S0 P48 ;notify layer change
N10120 
N10121 
N10122 M106 S71.4
N10123 ; OBJECT_ID: 79
N10124 ; COOLING_NODE: 0
N10125 ; start printing object, unique label id: 79
N10126 M624 AQAAAAAAAAA=
N10127 G1 X190.893 Y197.252 F60000
N10128 G1 Z9.8
N10129 G1 E.8 F1800
N10130 ; FEATURE: Inner wall
N10131 G1 F8475
N10132 M204 S8000
N10133 G1 X158.725 Y197.252 E1.03439
N10134 G1 X158.725 Y123.65 E2.36678
N10135 G1 X190.893 Y123.65 E1.03439
N10136 G1 X190.893 Y197.192 E2.36485
N10137 ; COOLING_NODE: 0
N10138 M204 S10000
N10139 G1 X191.3 Y197.659 F60000
N10140 G1 F8475
N10141 M204 S8000
N10142 G1 X158.318 Y197.659 E1.06057
N10143 G1 X158.318 Y123.243 E2.39296
N10144 G1 X191.3 Y123.243 E1.06057
N10145 G1 X191.3 Y197.599 E2.39103
N10146 ; COOLING_NODE: 0
N10147 M204 S10000
N10148 G1 X191.707 Y198.067 F60000
N10149 G1 F8475
N10150 M204 S8000
N10151 G1 X157.911 Y198.067 E1.08675
N10152 G1 X157.911 Y122.836 E2.41914
N10153 G1 X191.707 Y122.836 E1.08675
N10154 G1 X191.707 Y198.007 E2.41721
N10155 ; COOLING_NODE: 0
N10156 M204 S10000
N10157 G1 X192.099 Y198.459 F60000
N10158 ; FEATURE: Outer wall
N10159 ; LINE_WIDTH: 0.42
N10160 G1 F9149
N10161 M204 S5000
N10162 G1 X157.519 Y198.459 E1.03002
N10163 G1 X157.519 Y122.444 E2.26421
N10164 G1 X192.099 Y122.444 E1.03002
N10165 G1 X192.099 Y198.399 E2.26243
N10166 G1 E-.8 F1800
N10167 M204 S10000
N10168 G1 X184.52 Y197.492 Z10.2 F60000
N10169 G1 X158.89 Y194.426 Z10.2
N10170 G1 Z9.8
N10171 G1 E.8 F1800
N10172 ; FEATURE: Sparse infill
N10173 ; LINE_WIDTH: 0.45
N10174 G1 F8475
N10175 M204 S8000
N10176 G1 X161.368 Y196.904 E.11268
N10177 G1 X165.206 Y196.904 E.12342
N10178 G1 X159.073 Y190.772 E.27889
N10179 G1 X159.073 Y186.934 E.12342
N10180 G1 X169.044 Y196.904 E.45342
N10181 G1 X172.882 Y196.904 E.12342
N10182 G1 X159.073 Y183.096 E.62796
N10183 G1 X159.073 Y179.258 E.12342
N10184 G1 X176.72 Y196.904 E.80249
N10185 G1 X180.558 Y196.904 E.12342
N10186 G1 X159.073 Y175.42 E.97703
N10187 G1 X159.073 Y171.582 E.12342
N10188 G1 X184.396 Y196.904 E1.15157
N10189 G1 X188.234 Y196.904 E.12342
N10190 G1 X159.073 Y167.744 E1.3261
N10191 G1 X159.073 Y163.906 E.12342
N10192 G1 X190.544 Y195.377 E1.43118
N10193 G1 X190.544 Y191.539 E.12342
N10194 G1 X159.073 Y160.068 E1.43118
N10195 G1 X159.073 Y156.23 E.12342
N10196 G1 X190.544 Y187.701 E1.43118
N10197 G1 X190.544 Y183.863 E.12342
N10198 G1 X159.073 Y152.392 E1.43118
N10199 G1 X159.073 Y148.554 E.12342
N10200 G1 X190.544 Y180.025 E1.43118
N10201 G1 X190.544 Y176.187 E.12342
N10202 G1 X159.073 Y144.716 E1.43118
N10203 G1 X159.073 Y140.878 E.12342
N10204 G1 X190.544 Y172.349 E1.43118
N10205 G1 X190.544 Y168.511 E.12342
N10206 G1 X159.073 Y137.04 E1.43118
N10207 G1 X159.073 Y133.202 E.12342
N10208 G1 X190.544 Y164.673 E1.43118
N10209 G1 X190.544 Y160.835 E.12342
N10210 M73 P75 R8
N10211 G1 X159.073 Y129.364 E1.43118
N10212 G1 X159.073 Y125.526 E.12342
N10213 G1 X190.544 Y156.997 E1.43118
N10214 G1 X190.544 Y153.159 E.12342
N10215 G1 X161.384 Y123.999 E1.3261
N10216 G1 X165.222 Y123.999 E.12342
N10217 G1 X190.544 Y149.321 E1.15157
N10218 G1 X190.544 Y145.483 E.12342
N10219 G1 X169.06 Y123.999 E.97703
N10220 G1 X172.898 Y123.999 E.12342
N10221 G1 X190.544 Y141.645 E.80249
N10222 G1 X190.544 Y137.807 E.12342
N10223 G1 X176.736 Y123.999 E.62796
N10224 G1 X180.574 Y123.999 E.12342
N10225 G1 X190.544 Y133.969 E.45342
N10226 G1 X190.544 Y130.131 E.12342
N10227 G1 X184.412 Y123.999 E.27889
N10228 G1 X188.25 Y123.999 E.12342
N10229 G1 X190.728 Y126.476 E.11268
N10230 ; WIPE_START
N10231 G1 X189.313 Y125.062 E-.76
N10232 ; WIPE_END
N10233 G1 E-.04 F1800
N10234 M204 S10000
N10235 G17
N10236 G3 Z10.2 I1.217 J0 P1  F60000
N10237 ; stop printing object, unique label id: 79
N10238 M625
N10239 ; object ids of layer 49 start: 79
N10240 M624 AQAAAAAAAAA=
N10241 ;======== H2D 20250213========
N10242 ; SKIPPABLE_START
N10243 ; SKIPTYPE: timelapse
N10244 M622.1 S1 ; for prev firware, default turned on
N10245 
N10246 M1002 judge_flag timelapse_record_flag
N10247 
N10248 M622 J1
N10249 M993 A2 B2 C2
N10250 M993 A0 B0 C0
N10251 
N10252 
N10253 M9712 E1 M0
N10254 M83
N10255 G1 Z10.2 F1200
N10256 M400
N10257 M9713
N10258 
N10259 
N10260 M9711 M0 E1 Z10.2 S11 C10 O0 T3000
N10261 
N10262 
N10263 M9712 E1 M0
N10264 G90
N10265 G1 Z12.8
N10266 G1 Y295 F30000
N10267 G1 Y265 F18000
N10268 M83
N10269 M9713
N10270 
N10271 M993 A3 B3 C3
N10272 
N10273 M623
N10274 ; SKIPPABLE_END
N10275 
N10276 ; object ids of this layer49 end: 79
N10277 M625
N10278 ; CHANGE_LAYER
N10279 ; Z_HEIGHT: 10
N10280 ; LAYER_HEIGHT: 0.2
N10281 ;======== H2D 20250521========
N10282 ; layer num/total_layer_count: 50/63
N10283 ; update layer progress
N10284 M73 L50
N10285 M991 S0 P49 ;notify layer change
N10286 
N10287 
N10288 M106 S73.95
N10289 ; OBJECT_ID: 79
N10290 ; COOLING_NODE: 0
N10291 ; start printing object, unique label id: 79
N10292 M624 AQAAAAAAAAA=
N10293 G1 X190.893 Y197.252 F60000
N10294 G1 Z10
N10295 G1 E.8 F1800
N10296 ; FEATURE: Inner wall
N10297 G1 F8475
N10298 M204 S8000
N10299 G1 X158.725 Y197.252 E1.03439
N10300 G1 X158.725 Y123.65 E2.36678
N10301 G1 X190.893 Y123.65 E1.03439
N10302 G1 X190.893 Y197.192 E2.36485
N10303 ; COOLING_NODE: 0
N10304 M204 S10000
N10305 G1 X191.3 Y197.659 F60000
N10306 G1 F8475
N10307 M204 S8000
N10308 G1 X158.318 Y197.659 E1.06057
N10309 G1 X158.318 Y123.243 E2.39296
N10310 G1 X191.3 Y123.243 E1.06057
N10311 G1 X191.3 Y197.599 E2.39103
N10312 ; COOLING_NODE: 0
N10313 M204 S10000
N10314 G1 X191.707 Y198.067 F60000
N10315 G1 F8475
N10316 M204 S8000
N10317 G1 X157.911 Y198.067 E1.08675
N10318 G1 X157.911 Y122.836 E2.41914
N10319 G1 X191.707 Y122.836 E1.08675
N10320 G1 X191.707 Y198.007 E2.41721
N10321 ; COOLING_NODE: 0
N10322 M204 S10000
N10323 G1 X192.099 Y198.459 F60000
N10324 ; FEATURE: Outer wall
N10325 ; LINE_WIDTH: 0.42
N10326 G1 F9149
N10327 M204 S5000
N10328 G1 X157.519 Y198.459 E1.03002
N10329 G1 X157.519 Y122.444 E2.26421
N10330 G1 X192.099 Y122.444 E1.03002
N10331 G1 X192.099 Y198.399 E2.26243
N10332 G1 E-.8 F1800
N10333 M204 S10000
N10334 G1 X188.067 Y197.087 Z10.4 F60000
N10335 G1 Z10
N10336 G1 E.8 F1800
N10337 ; FEATURE: Sparse infill
N10338 ; LINE_WIDTH: 0.45
N10339 G1 F8475
N10340 M204 S8000
N10341 G1 X190.544 Y194.609 E.11268
N10342 G1 X190.544 Y190.772 E.12342
N10343 G1 X184.412 Y196.904 E.27889
N10344 G1 X180.574 Y196.904 E.12342
N10345 G1 X190.544 Y186.934 E.45342
N10346 G1 X190.544 Y183.096 E.12342
N10347 G1 X176.736 Y196.904 E.62796
N10348 G1 X172.898 Y196.904 E.12342
N10349 G1 X190.544 Y179.258 E.80249
N10350 G1 X190.544 Y175.42 E.12342
N10351 G1 X169.06 Y196.904 E.97703
N10352 G1 X165.222 Y196.904 E.12342
N10353 G1 X190.544 Y171.582 E1.15157
N10354 G1 X190.544 Y167.744 E.12342
N10355 G1 X161.384 Y196.904 E1.3261
N10356 G1 X159.073 Y196.904 E.0743
N10357 G1 X159.073 Y195.377 E.04912
N10358 G1 X190.544 Y163.906 E1.43118
N10359 G1 X190.544 Y160.068 E.12342
N10360 G1 X159.073 Y191.539 E1.43118
N10361 G1 X159.073 Y187.701 E.12342
N10362 G1 X190.544 Y156.23 E1.43118
N10363 G1 X190.544 Y152.392 E.12342
N10364 G1 X159.073 Y183.863 E1.43118
N10365 G1 X159.073 Y180.025 E.12342
N10366 G1 X190.544 Y148.554 E1.43118
N10367 G1 X190.544 Y144.716 E.12342
N10368 G1 X159.073 Y176.187 E1.43118
N10369 G1 X159.073 Y172.349 E.12342
N10370 G1 X190.544 Y140.878 E1.43118
N10371 G1 X190.544 Y137.04 E.12342
N10372 G1 X159.073 Y168.511 E1.43118
N10373 G1 X159.073 Y164.673 E.12342
N10374 G1 X190.544 Y133.202 E1.43118
N10375 G1 X190.544 Y129.364 E.12342
N10376 G1 X159.073 Y160.835 E1.43118
N10377 G1 X159.073 Y156.997 E.12342
N10378 G1 X190.544 Y125.526 E1.43118
N10379 G1 X190.544 Y123.999 E.04912
N10380 G1 X188.234 Y123.999 E.0743
N10381 G1 X159.073 Y153.159 E1.3261
N10382 G1 X159.073 Y149.321 E.12342
N10383 G1 X184.396 Y123.999 E1.15157
N10384 G1 X180.558 Y123.999 E.12342
N10385 G1 X159.073 Y145.483 E.97703
N10386 G1 X159.073 Y141.645 E.12342
N10387 G1 X176.72 Y123.999 E.80249
N10388 G1 X172.882 Y123.999 E.12342
N10389 G1 X159.073 Y137.807 E.62796
N10390 G1 X159.073 Y133.969 E.12342
N10391 G1 X169.044 Y123.999 E.45342
N10392 G1 X165.206 Y123.999 E.12342
N10393 G1 X159.073 Y130.131 E.27889
N10394 G1 X159.073 Y126.293 E.12342
N10395 G1 X161.551 Y123.815 E.11268
N10396 ; WIPE_START
N10397 G1 X160.137 Y125.23 E-.76
N10398 ; WIPE_END
N10399 G1 E-.04 F1800
N10400 M204 S10000
N10401 G17
N10402 G3 Z10.4 I1.217 J0 P1  F60000
N10403 ; stop printing object, unique label id: 79
N10404 M625
N10405 ; object ids of layer 50 start: 79
N10406 M624 AQAAAAAAAAA=
N10407 ;======== H2D 20250213========
N10408 ; SKIPPABLE_START
N10409 ; SKIPTYPE: timelapse
N10410 M622.1 S1 ; for prev firware, default turned on
N10411 
N10412 M1002 judge_flag timelapse_record_flag
N10413 
N10414 M622 J1
N10415 M993 A2 B2 C2
N10416 M993 A0 B0 C0
N10417 
N10418 
N10419 M9712 E1 M0
N10420 M83
N10421 G1 Z10.4 F1200
N10422 M400
N10423 M9713
N10424 
N10425 
N10426 M9711 M0 E1 Z10.4 S11 C10 O0 T3000
N10427 
N10428 
N10429 M9712 E1 M0
N10430 G90
N10431 G1 Z13
N10432 G1 Y295 F30000
N10433 G1 Y265 F18000
N10434 M83
N10435 M9713
N10436 
N10437 M993 A3 B3 C3
N10438 
N10439 M623
N10440 ; SKIPPABLE_END
N10441 
N10442 ; object ids of this layer50 end: 79
N10443 M625
N10444 ; CHANGE_LAYER
N10445 ; Z_HEIGHT: 10.2
N10446 ; LAYER_HEIGHT: 0.2
N10447 ;======== H2D 20250521========
N10448 ; layer num/total_layer_count: 51/63
N10449 ; update layer progress
N10450 M73 L51
N10451 M991 S0 P50 ;notify layer change
N10452 
N10453 
N10454 M106 S71.4
N10455 ; OBJECT_ID: 79
N10456 ; COOLING_NODE: 0
N10457 ; start printing object, unique label id: 79
N10458 M624 AQAAAAAAAAA=
N10459 G1 X190.893 Y197.252 F60000
N10460 G1 Z10.2
N10461 G1 E.8 F1800
N10462 ; FEATURE: Inner wall
N10463 G1 F8475
N10464 M204 S8000
N10465 G1 X158.725 Y197.252 E1.03439
N10466 G1 X158.725 Y123.65 E2.36678
N10467 G1 X190.893 Y123.65 E1.03439
N10468 G1 X190.893 Y197.192 E2.36485
N10469 ; COOLING_NODE: 0
N10470 M204 S10000
N10471 G1 X191.3 Y197.659 F60000
N10472 G1 F8475
N10473 M204 S8000
N10474 M73 P76 R8
N10475 G1 X158.318 Y197.659 E1.06057
N10476 G1 X158.318 Y123.243 E2.39296
N10477 G1 X191.3 Y123.243 E1.06057
N10478 G1 X191.3 Y197.599 E2.39103
N10479 ; COOLING_NODE: 0
N10480 M204 S10000
N10481 G1 X191.707 Y198.067 F60000
N10482 G1 F8475
N10483 M204 S8000
N10484 G1 X157.911 Y198.067 E1.08675
N10485 G1 X157.911 Y122.836 E2.41914
N10486 G1 X191.707 Y122.836 E1.08675
N10487 G1 X191.707 Y198.007 E2.41721
N10488 ; COOLING_NODE: 0
N10489 M204 S10000
N10490 G1 X192.099 Y198.459 F60000
N10491 ; FEATURE: Outer wall
N10492 ; LINE_WIDTH: 0.42
N10493 G1 F9148
N10494 M204 S5000
N10495 G1 X157.519 Y198.459 E1.03002
N10496 G1 X157.519 Y122.444 E2.26421
N10497 G1 X192.099 Y122.444 E1.03002
N10498 G1 X192.099 Y198.399 E2.26243
N10499 G1 E-.8 F1800
N10500 M204 S10000
N10501 G1 X184.52 Y197.492 Z10.6 F60000
N10502 G1 X158.89 Y194.426 Z10.6
N10503 G1 Z10.2
N10504 G1 E.8 F1800
N10505 ; FEATURE: Sparse infill
N10506 ; LINE_WIDTH: 0.45
N10507 G1 F8475
N10508 M204 S8000
N10509 G1 X161.368 Y196.904 E.11268
N10510 G1 X165.206 Y196.904 E.12342
N10511 G1 X159.073 Y190.772 E.27889
N10512 G1 X159.073 Y186.934 E.12342
N10513 G1 X169.044 Y196.904 E.45342
N10514 G1 X172.882 Y196.904 E.12342
N10515 G1 X159.073 Y183.096 E.62796
N10516 G1 X159.073 Y179.258 E.12342
N10517 G1 X176.72 Y196.904 E.80249
N10518 G1 X180.558 Y196.904 E.12342
N10519 G1 X159.073 Y175.42 E.97703
N10520 G1 X159.073 Y171.582 E.12342
N10521 G1 X184.396 Y196.904 E1.15157
N10522 G1 X188.234 Y196.904 E.12342
N10523 G1 X159.073 Y167.744 E1.3261
N10524 G1 X159.073 Y163.906 E.12342
N10525 M73 P76 R7
N10526 G1 X190.544 Y195.377 E1.43118
N10527 G1 X190.544 Y191.539 E.12342
N10528 G1 X159.073 Y160.068 E1.43118
N10529 G1 X159.073 Y156.23 E.12342
N10530 G1 X190.544 Y187.701 E1.43118
N10531 G1 X190.544 Y183.863 E.12342
N10532 G1 X159.073 Y152.392 E1.43118
N10533 G1 X159.073 Y148.554 E.12342
N10534 G1 X190.544 Y180.025 E1.43118
N10535 G1 X190.544 Y176.187 E.12342
N10536 G1 X159.073 Y144.716 E1.43118
N10537 G1 X159.073 Y140.878 E.12342
N10538 G1 X190.544 Y172.349 E1.43118
N10539 G1 X190.544 Y168.511 E.12342
N10540 G1 X159.073 Y137.04 E1.43118
N10541 G1 X159.073 Y133.202 E.12342
N10542 G1 X190.544 Y164.673 E1.43118
N10543 G1 X190.544 Y160.835 E.12342
N10544 G1 X159.073 Y129.364 E1.43118
N10545 G1 X159.073 Y125.526 E.12342
N10546 G1 X190.544 Y156.997 E1.43118
N10547 G1 X190.544 Y153.159 E.12342
N10548 G1 X161.384 Y123.999 E1.3261
N10549 G1 X165.222 Y123.999 E.12342
N10550 G1 X190.544 Y149.321 E1.15157
N10551 G1 X190.544 Y145.483 E.12342
N10552 G1 X169.06 Y123.999 E.97703
N10553 G1 X172.898 Y123.999 E.12342
N10554 G1 X190.544 Y141.645 E.80249
N10555 G1 X190.544 Y137.807 E.12342
N10556 G1 X176.736 Y123.999 E.62796
N10557 G1 X180.574 Y123.999 E.12342
N10558 G1 X190.544 Y133.969 E.45342
N10559 G1 X190.544 Y130.131 E.12342
N10560 G1 X184.412 Y123.999 E.27889
N10561 G1 X188.25 Y123.999 E.12342
N10562 G1 X190.728 Y126.476 E.11268
N10563 ; WIPE_START
N10564 G1 X189.313 Y125.062 E-.76
N10565 ; WIPE_END
N10566 G1 E-.04 F1800
N10567 M204 S10000
N10568 G17
N10569 G3 Z10.6 I1.217 J0 P1  F60000
N10570 ; stop printing object, unique label id: 79
N10571 M625
N10572 ; object ids of layer 51 start: 79
N10573 M624 AQAAAAAAAAA=
N10574 ;======== H2D 20250213========
N10575 ; SKIPPABLE_START
N10576 ; SKIPTYPE: timelapse
N10577 M622.1 S1 ; for prev firware, default turned on
N10578 
N10579 M1002 judge_flag timelapse_record_flag
N10580 
N10581 M622 J1
N10582 M993 A2 B2 C2
N10583 M993 A0 B0 C0
N10584 
N10585 
N10586 M9712 E1 M0
N10587 M83
N10588 G1 Z10.6 F1200
N10589 M400
N10590 M9713
N10591 
N10592 
N10593 M9711 M0 E1 Z10.6 S11 C10 O0 T3000
N10594 
N10595 
N10596 M9712 E1 M0
N10597 G90
N10598 G1 Z13.2
N10599 G1 Y295 F30000
N10600 G1 Y265 F18000
N10601 M83
N10602 M9713
N10603 
N10604 M993 A3 B3 C3
N10605 
N10606 M623
N10607 ; SKIPPABLE_END
N10608 
N10609 ; object ids of this layer51 end: 79
N10610 M625
N10611 ; CHANGE_LAYER
N10612 ; Z_HEIGHT: 10.4
N10613 ; LAYER_HEIGHT: 0.2
N10614 ;======== H2D 20250521========
N10615 ; layer num/total_layer_count: 52/63
N10616 ; update layer progress
N10617 M73 L52
N10618 M991 S0 P51 ;notify layer change
N10619 
N10620 
N10621 M106 S73.95
N10622 ; OBJECT_ID: 79
N10623 ; COOLING_NODE: 0
N10624 ; start printing object, unique label id: 79
N10625 M624 AQAAAAAAAAA=
N10626 G1 X190.893 Y197.252 F60000
N10627 G1 Z10.4
N10628 G1 E.8 F1800
N10629 ; FEATURE: Inner wall
N10630 G1 F8475
N10631 M204 S8000
N10632 G1 X158.725 Y197.252 E1.03439
N10633 G1 X158.725 Y123.65 E2.36678
N10634 G1 X190.893 Y123.65 E1.03439
N10635 G1 X190.893 Y197.192 E2.36485
N10636 ; COOLING_NODE: 0
N10637 M204 S10000
N10638 G1 X191.3 Y197.659 F60000
N10639 G1 F8475
N10640 M204 S8000
N10641 G1 X158.318 Y197.659 E1.06057
N10642 G1 X158.318 Y123.243 E2.39296
N10643 G1 X191.3 Y123.243 E1.06057
N10644 G1 X191.3 Y197.599 E2.39103
N10645 ; COOLING_NODE: 0
N10646 M204 S10000
N10647 G1 X191.707 Y198.067 F60000
N10648 G1 F8475
N10649 M204 S8000
N10650 G1 X157.911 Y198.067 E1.08675
N10651 G1 X157.911 Y122.836 E2.41914
N10652 G1 X191.707 Y122.836 E1.08675
N10653 G1 X191.707 Y198.007 E2.41721
N10654 ; COOLING_NODE: 0
N10655 M204 S10000
N10656 G1 X192.099 Y198.459 F60000
N10657 ; FEATURE: Outer wall
N10658 ; LINE_WIDTH: 0.42
N10659 G1 F9143
N10660 M204 S5000
N10661 G1 X157.519 Y198.459 E1.03002
N10662 G1 X157.519 Y122.444 E2.26421
N10663 G1 X192.099 Y122.444 E1.03002
N10664 G1 X192.099 Y198.399 E2.26243
N10665 G1 E-.8 F1800
N10666 M204 S10000
N10667 G1 X188.067 Y197.087 Z10.8 F60000
N10668 G1 Z10.4
N10669 M73 P77 R7
N10670 G1 E.8 F1800
N10671 ; FEATURE: Sparse infill
N10672 ; LINE_WIDTH: 0.45
N10673 G1 F8475
N10674 M204 S8000
N10675 G1 X190.544 Y194.609 E.11268
N10676 G1 X190.544 Y190.772 E.12342
N10677 G1 X184.412 Y196.904 E.27889
N10678 G1 X180.574 Y196.904 E.12342
N10679 G1 X190.544 Y186.934 E.45342
N10680 G1 X190.544 Y183.096 E.12342
N10681 G1 X176.736 Y196.904 E.62796
N10682 G1 X172.898 Y196.904 E.12342
N10683 G1 X190.544 Y179.258 E.80249
N10684 G1 X190.544 Y175.42 E.12342
N10685 G1 X169.06 Y196.904 E.97703
N10686 G1 X165.222 Y196.904 E.12342
N10687 G1 X190.544 Y171.582 E1.15157
N10688 G1 X190.544 Y167.744 E.12342
N10689 G1 X161.384 Y196.904 E1.3261
N10690 G1 X159.073 Y196.904 E.0743
N10691 G1 X159.073 Y195.377 E.04912
N10692 G1 X190.544 Y163.906 E1.43118
N10693 G1 X190.544 Y160.068 E.12342
N10694 G1 X159.073 Y191.539 E1.43118
N10695 G1 X159.073 Y187.701 E.12342
N10696 G1 X190.544 Y156.23 E1.43118
N10697 G1 X190.544 Y152.392 E.12342
N10698 G1 X159.073 Y183.863 E1.43118
N10699 G1 X159.073 Y180.025 E.12342
N10700 G1 X190.544 Y148.554 E1.43118
N10701 G1 X190.544 Y144.716 E.12342
N10702 G1 X159.073 Y176.187 E1.43118
N10703 G1 X159.073 Y172.349 E.12342
N10704 G1 X190.544 Y140.878 E1.43118
N10705 G1 X190.544 Y137.04 E.12342
N10706 G1 X159.073 Y168.511 E1.43118
N10707 G1 X159.073 Y164.673 E.12342
N10708 G1 X190.544 Y133.202 E1.43118
N10709 G1 X190.544 Y129.364 E.12342
N10710 G1 X159.073 Y160.835 E1.43118
N10711 G1 X159.073 Y156.997 E.12342
N10712 G1 X190.544 Y125.526 E1.43118
N10713 G1 X190.544 Y123.999 E.04912
N10714 G1 X188.234 Y123.999 E.0743
N10715 G1 X159.073 Y153.159 E1.3261
N10716 G1 X159.073 Y149.321 E.12342
N10717 G1 X184.396 Y123.999 E1.15157
N10718 G1 X180.558 Y123.999 E.12342
N10719 G1 X159.073 Y145.483 E.97703
N10720 G1 X159.073 Y141.645 E.12342
N10721 G1 X176.72 Y123.999 E.80249
N10722 G1 X172.882 Y123.999 E.12342
N10723 G1 X159.073 Y137.807 E.62796
N10724 G1 X159.073 Y133.969 E.12342
N10725 G1 X169.044 Y123.999 E.45342
N10726 G1 X165.206 Y123.999 E.12342
N10727 G1 X159.073 Y130.131 E.27889
N10728 G1 X159.073 Y126.293 E.12342
N10729 G1 X161.551 Y123.815 E.11268
N10730 ; WIPE_START
N10731 G1 X160.137 Y125.23 E-.76
N10732 ; WIPE_END
N10733 G1 E-.04 F1800
N10734 M204 S10000
N10735 G17
N10736 G3 Z10.8 I1.217 J0 P1  F60000
N10737 ; stop printing object, unique label id: 79
N10738 M625
N10739 ; object ids of layer 52 start: 79
N10740 M624 AQAAAAAAAAA=
N10741 ;======== H2D 20250213========
N10742 ; SKIPPABLE_START
N10743 ; SKIPTYPE: timelapse
N10744 M622.1 S1 ; for prev firware, default turned on
N10745 
N10746 M1002 judge_flag timelapse_record_flag
N10747 
N10748 M622 J1
N10749 M993 A2 B2 C2
N10750 M993 A0 B0 C0
N10751 
N10752 
N10753 M9712 E1 M0
N10754 M83
N10755 G1 Z10.8 F1200
N10756 M400
N10757 M9713
N10758 
N10759 
N10760 M9711 M0 E1 Z10.8 S11 C10 O0 T3000
N10761 
N10762 
N10763 M9712 E1 M0
N10764 G90
N10765 G1 Z13.4
N10766 G1 Y295 F30000
N10767 G1 Y265 F18000
N10768 M83
N10769 M9713
N10770 
N10771 M993 A3 B3 C3
N10772 
N10773 M623
N10774 ; SKIPPABLE_END
N10775 
N10776 ; object ids of this layer52 end: 79
N10777 M625
N10778 ; CHANGE_LAYER
N10779 ; Z_HEIGHT: 10.6
N10780 ; LAYER_HEIGHT: 0.200001
N10781 ;======== H2D 20250521========
N10782 ; layer num/total_layer_count: 53/63
N10783 ; update layer progress
N10784 M73 L53
N10785 M991 S0 P52 ;notify layer change
N10786 
N10787 
N10788 M106 S71.4
N10789 ; OBJECT_ID: 79
N10790 ; COOLING_NODE: 0
N10791 ; start printing object, unique label id: 79
N10792 M624 AQAAAAAAAAA=
N10793 G1 X190.893 Y197.252 F60000
N10794 G1 Z10.6
N10795 G1 E.8 F1800
N10796 ; FEATURE: Inner wall
N10797 G1 F8475
N10798 M204 S8000
N10799 G1 X158.725 Y197.252 E1.03439
N10800 G1 X158.725 Y123.65 E2.36678
N10801 G1 X190.893 Y123.65 E1.03439
N10802 G1 X190.893 Y197.192 E2.36485
N10803 ; COOLING_NODE: 0
N10804 M204 S10000
N10805 G1 X191.3 Y197.659 F60000
N10806 G1 F8475
N10807 M204 S8000
N10808 G1 X158.318 Y197.659 E1.06057
N10809 G1 X158.318 Y123.243 E2.39296
N10810 G1 X191.3 Y123.243 E1.06057
N10811 G1 X191.3 Y197.599 E2.39103
N10812 ; COOLING_NODE: 0
N10813 M204 S10000
N10814 G1 X191.707 Y198.067 F60000
N10815 G1 F8475
N10816 M204 S8000
N10817 G1 X157.911 Y198.067 E1.08675
N10818 G1 X157.911 Y122.836 E2.41914
N10819 G1 X191.707 Y122.836 E1.08675
N10820 G1 X191.707 Y198.007 E2.41721
N10821 ; COOLING_NODE: 0
N10822 M204 S10000
N10823 G1 X192.099 Y198.459 F60000
N10824 ; FEATURE: Outer wall
N10825 ; LINE_WIDTH: 0.42
N10826 G1 F9132
N10827 M204 S5000
N10828 G1 X157.519 Y198.459 E1.03002
N10829 G1 X157.519 Y122.444 E2.26421
N10830 G1 X192.099 Y122.444 E1.03002
N10831 G1 X192.099 Y198.399 E2.26243
N10832 G1 E-.8 F1800
N10833 M204 S10000
N10834 G1 X184.52 Y197.492 Z11 F60000
N10835 G1 X158.89 Y194.426 Z11
N10836 G1 Z10.6
N10837 G1 E.8 F1800
N10838 ; FEATURE: Sparse infill
N10839 ; LINE_WIDTH: 0.45
N10840 G1 F8475
N10841 M204 S8000
N10842 G1 X161.368 Y196.904 E.11268
N10843 G1 X165.206 Y196.904 E.12342
N10844 G1 X159.073 Y190.772 E.27889
N10845 G1 X159.073 Y186.934 E.12342
N10846 G1 X169.044 Y196.904 E.45342
N10847 G1 X172.882 Y196.904 E.12342
N10848 G1 X159.073 Y183.096 E.62796
N10849 G1 X159.073 Y179.258 E.12342
N10850 G1 X176.72 Y196.904 E.80249
N10851 G1 X180.558 Y196.904 E.12342
N10852 G1 X159.073 Y175.42 E.97703
N10853 G1 X159.073 Y171.582 E.12342
N10854 G1 X184.396 Y196.904 E1.15157
N10855 G1 X188.234 Y196.904 E.12342
N10856 G1 X159.073 Y167.744 E1.3261
N10857 G1 X159.073 Y163.906 E.12342
N10858 G1 X190.544 Y195.377 E1.43118
N10859 G1 X190.544 Y191.539 E.12342
N10860 G1 X159.073 Y160.068 E1.43118
N10861 G1 X159.073 Y156.23 E.12342
N10862 G1 X190.544 Y187.701 E1.43118
N10863 G1 X190.544 Y183.863 E.12342
N10864 G1 X159.073 Y152.392 E1.43118
N10865 G1 X159.073 Y148.554 E.12342
N10866 G1 X190.544 Y180.025 E1.43118
N10867 G1 X190.544 Y176.187 E.12342
N10868 G1 X159.073 Y144.716 E1.43118
N10869 G1 X159.073 Y140.878 E.12342
N10870 G1 X190.544 Y172.349 E1.43118
N10871 G1 X190.544 Y168.511 E.12342
N10872 G1 X159.073 Y137.04 E1.43118
N10873 G1 X159.073 Y133.202 E.12342
N10874 G1 X190.544 Y164.673 E1.43118
N10875 G1 X190.544 Y160.835 E.12342
N10876 M73 P78 R7
N10877 G1 X159.073 Y129.364 E1.43118
N10878 G1 X159.073 Y125.526 E.12342
N10879 G1 X190.544 Y156.997 E1.43118
N10880 G1 X190.544 Y153.159 E.12342
N10881 G1 X161.384 Y123.999 E1.3261
N10882 G1 X165.222 Y123.999 E.12342
N10883 G1 X190.544 Y149.321 E1.15157
N10884 G1 X190.544 Y145.483 E.12342
N10885 G1 X169.06 Y123.999 E.97703
N10886 G1 X172.898 Y123.999 E.12342
N10887 G1 X190.544 Y141.645 E.80249
N10888 G1 X190.544 Y137.807 E.12342
N10889 G1 X176.736 Y123.999 E.62796
N10890 G1 X180.574 Y123.999 E.12342
N10891 G1 X190.544 Y133.969 E.45342
N10892 G1 X190.544 Y130.131 E.12342
N10893 G1 X184.412 Y123.999 E.27889
N10894 G1 X188.25 Y123.999 E.12342
N10895 G1 X190.728 Y126.476 E.11268
N10896 ; WIPE_START
N10897 G1 X189.313 Y125.062 E-.76
N10898 ; WIPE_END
N10899 G1 E-.04 F1800
N10900 M204 S10000
N10901 G17
N10902 G3 Z11 I1.217 J0 P1  F60000
N10903 ; stop printing object, unique label id: 79
N10904 M625
N10905 ; object ids of layer 53 start: 79
N10906 M624 AQAAAAAAAAA=
N10907 ;======== H2D 20250213========
N10908 ; SKIPPABLE_START
N10909 ; SKIPTYPE: timelapse
N10910 M622.1 S1 ; for prev firware, default turned on
N10911 
N10912 M1002 judge_flag timelapse_record_flag
N10913 
N10914 M622 J1
N10915 M993 A2 B2 C2
N10916 M993 A0 B0 C0
N10917 
N10918 
N10919 M9712 E1 M0
N10920 M83
N10921 G1 Z11 F1200
N10922 M400
N10923 M9713
N10924 
N10925 
N10926 M9711 M0 E1 Z11 S11 C10 O0 T3000
N10927 
N10928 
N10929 M9712 E1 M0
N10930 G90
N10931 G1 Z13.6
N10932 G1 Y295 F30000
N10933 G1 Y265 F18000
N10934 M83
N10935 M9713
N10936 
N10937 M993 A3 B3 C3
N10938 
N10939 M623
N10940 ; SKIPPABLE_END
N10941 
N10942 ; object ids of this layer53 end: 79
N10943 M625
N10944 ; CHANGE_LAYER
N10945 ; Z_HEIGHT: 10.8
N10946 ; LAYER_HEIGHT: 0.2
N10947 ;======== H2D 20250521========
N10948 ; layer num/total_layer_count: 54/63
N10949 ; update layer progress
N10950 M73 L54
N10951 M991 S0 P53 ;notify layer change
N10952 
N10953 
N10954 M106 S73.95
N10955 ; OBJECT_ID: 79
N10956 ; COOLING_NODE: 0
N10957 ; start printing object, unique label id: 79
N10958 M624 AQAAAAAAAAA=
N10959 G1 X190.893 Y197.252 F60000
N10960 G1 Z10.8
N10961 G1 E.8 F1800
N10962 ; FEATURE: Inner wall
N10963 G1 F8475
N10964 M204 S8000
N10965 G1 X158.725 Y197.252 E1.03439
N10966 G1 X158.725 Y123.65 E2.36678
N10967 G1 X190.893 Y123.65 E1.03439
N10968 G1 X190.893 Y197.192 E2.36485
N10969 ; COOLING_NODE: 0
N10970 M204 S10000
N10971 G1 X191.3 Y197.659 F60000
N10972 G1 F8475
N10973 M204 S8000
N10974 G1 X158.318 Y197.659 E1.06057
N10975 G1 X158.318 Y123.243 E2.39296
N10976 G1 X191.3 Y123.243 E1.06057
N10977 G1 X191.3 Y197.599 E2.39103
N10978 ; COOLING_NODE: 0
N10979 M204 S10000
N10980 G1 X191.707 Y198.067 F60000
N10981 G1 F8475
N10982 M204 S8000
N10983 G1 X157.911 Y198.067 E1.08675
N10984 G1 X157.911 Y122.836 E2.41914
N10985 G1 X191.707 Y122.836 E1.08675
N10986 G1 X191.707 Y198.007 E2.41721
N10987 ; COOLING_NODE: 0
N10988 M204 S10000
N10989 G1 X192.099 Y198.459 F60000
N10990 ; FEATURE: Outer wall
N10991 ; LINE_WIDTH: 0.42
N10992 G1 F9106
N10993 M204 S5000
N10994 G1 X157.519 Y198.459 E1.03002
N10995 G1 X157.519 Y122.444 E2.26421
N10996 G1 X192.099 Y122.444 E1.03002
N10997 G1 X192.099 Y198.399 E2.26243
N10998 G1 E-.8 F1800
N10999 M204 S10000
N11000 G1 X188.067 Y197.087 Z11.2 F60000
N11001 G1 Z10.8
N11002 G1 E.8 F1800
N11003 ; FEATURE: Sparse infill
N11004 ; LINE_WIDTH: 0.45
N11005 G1 F8475
N11006 M204 S8000
N11007 G1 X190.544 Y194.609 E.11268
N11008 G1 X190.544 Y190.772 E.12342
N11009 G1 X184.412 Y196.904 E.27889
N11010 G1 X180.574 Y196.904 E.12342
N11011 G1 X190.544 Y186.934 E.45342
N11012 G1 X190.544 Y183.096 E.12342
N11013 G1 X176.736 Y196.904 E.62796
N11014 G1 X172.898 Y196.904 E.12342
N11015 G1 X190.544 Y179.258 E.80249
N11016 G1 X190.544 Y175.42 E.12342
N11017 G1 X169.06 Y196.904 E.97703
N11018 G1 X165.222 Y196.904 E.12342
N11019 G1 X190.544 Y171.582 E1.15157
N11020 G1 X190.544 Y167.744 E.12342
N11021 G1 X161.384 Y196.904 E1.3261
N11022 G1 X159.073 Y196.904 E.0743
N11023 G1 X159.073 Y195.377 E.04912
N11024 G1 X190.544 Y163.906 E1.43118
N11025 G1 X190.544 Y160.068 E.12342
N11026 G1 X159.073 Y191.539 E1.43118
N11027 G1 X159.073 Y187.701 E.12342
N11028 G1 X190.544 Y156.23 E1.43118
N11029 G1 X190.544 Y152.392 E.12342
N11030 G1 X159.073 Y183.863 E1.43118
N11031 G1 X159.073 Y180.025 E.12342
N11032 G1 X190.544 Y148.554 E1.43118
N11033 G1 X190.544 Y144.716 E.12342
N11034 G1 X159.073 Y176.187 E1.43118
N11035 G1 X159.073 Y172.349 E.12342
N11036 G1 X190.544 Y140.878 E1.43118
N11037 G1 X190.544 Y137.04 E.12342
N11038 G1 X159.073 Y168.511 E1.43118
N11039 G1 X159.073 Y164.673 E.12342
N11040 G1 X190.544 Y133.202 E1.43118
N11041 G1 X190.544 Y129.364 E.12342
N11042 G1 X159.073 Y160.835 E1.43118
N11043 G1 X159.073 Y156.997 E.12342
N11044 G1 X190.544 Y125.526 E1.43118
N11045 G1 X190.544 Y123.999 E.04912
N11046 G1 X188.234 Y123.999 E.0743
N11047 G1 X159.073 Y153.159 E1.3261
N11048 G1 X159.073 Y149.321 E.12342
N11049 G1 X184.396 Y123.999 E1.15157
N11050 G1 X180.558 Y123.999 E.12342
N11051 G1 X159.073 Y145.483 E.97703
N11052 G1 X159.073 Y141.645 E.12342
N11053 G1 X176.72 Y123.999 E.80249
N11054 G1 X172.882 Y123.999 E.12342
N11055 G1 X159.073 Y137.807 E.62796
N11056 G1 X159.073 Y133.969 E.12342
N11057 G1 X169.044 Y123.999 E.45342
N11058 G1 X165.206 Y123.999 E.12342
N11059 G1 X159.073 Y130.131 E.27889
N11060 G1 X159.073 Y126.293 E.12342
N11061 G1 X161.551 Y123.815 E.11268
N11062 ; WIPE_START
N11063 G1 X160.137 Y125.23 E-.76
N11064 ; WIPE_END
N11065 G1 E-.04 F1800
N11066 M204 S10000
N11067 G17
N11068 G3 Z11.2 I1.217 J0 P1  F60000
N11069 ; stop printing object, unique label id: 79
N11070 M625
N11071 ; object ids of layer 54 start: 79
N11072 M624 AQAAAAAAAAA=
N11073 ;======== H2D 20250213========
N11074 ; SKIPPABLE_START
N11075 ; SKIPTYPE: timelapse
N11076 M622.1 S1 ; for prev firware, default turned on
N11077 
N11078 M1002 judge_flag timelapse_record_flag
N11079 
N11080 M622 J1
N11081 M993 A2 B2 C2
N11082 M993 A0 B0 C0
N11083 
N11084 
N11085 M9712 E1 M0
N11086 M83
N11087 G1 Z11.2 F1200
N11088 M400
N11089 M9713
N11090 
N11091 
N11092 M9711 M0 E1 Z11.2 S11 C10 O0 T3000
N11093 
N11094 
N11095 M9712 E1 M0
N11096 G90
N11097 G1 Z13.8
N11098 G1 Y295 F30000
N11099 G1 Y265 F18000
N11100 M83
N11101 M9713
N11102 
N11103 M993 A3 B3 C3
N11104 
N11105 M623
N11106 ; SKIPPABLE_END
N11107 
N11108 ; object ids of this layer54 end: 79
N11109 M625
N11110 ; CHANGE_LAYER
N11111 ; Z_HEIGHT: 11
N11112 ; LAYER_HEIGHT: 0.2
N11113 ;======== H2D 20250521========
N11114 ; layer num/total_layer_count: 55/63
N11115 ; update layer progress
N11116 M73 L55
N11117 M991 S0 P54 ;notify layer change
N11118 
N11119 
N11120 M106 S71.4
N11121 ; OBJECT_ID: 79
N11122 ; COOLING_NODE: 0
N11123 ; start printing object, unique label id: 79
N11124 M624 AQAAAAAAAAA=
N11125 G1 X190.893 Y197.252 F60000
N11126 G1 Z11
N11127 G1 E.8 F1800
N11128 ; FEATURE: Inner wall
N11129 G1 F8475
N11130 M204 S8000
N11131 G1 X158.725 Y197.252 E1.03439
N11132 G1 X158.725 Y123.65 E2.36678
N11133 G1 X190.893 Y123.65 E1.03439
N11134 G1 X190.893 Y197.192 E2.36485
N11135 ; COOLING_NODE: 0
N11136 M204 S10000
N11137 G1 X191.3 Y197.659 F60000
N11138 M73 P79 R7
N11139 G1 F8475
N11140 M204 S8000
N11141 G1 X158.318 Y197.659 E1.06057
N11142 G1 X158.318 Y123.243 E2.39296
N11143 G1 X191.3 Y123.243 E1.06057
N11144 G1 X191.3 Y197.599 E2.39103
N11145 ; COOLING_NODE: 0
N11146 M204 S10000
N11147 G1 X191.707 Y198.067 F60000
N11148 G1 F8475
N11149 M204 S8000
N11150 G1 X157.911 Y198.067 E1.08675
N11151 G1 X157.911 Y122.836 E2.41914
N11152 G1 X191.707 Y122.836 E1.08675
N11153 G1 X191.707 Y198.007 E2.41721
N11154 ; COOLING_NODE: 0
N11155 M204 S10000
N11156 G1 X192.099 Y198.459 F60000
N11157 ; FEATURE: Outer wall
N11158 ; LINE_WIDTH: 0.42
N11159 G1 F9058
N11160 M204 S5000
N11161 G1 X157.519 Y198.459 E1.03002
N11162 G1 X157.519 Y122.444 E2.26421
N11163 G1 X192.099 Y122.444 E1.03002
N11164 G1 X192.099 Y198.399 E2.26243
N11165 G1 E-.8 F1800
N11166 M204 S10000
N11167 G1 X184.52 Y197.492 Z11.4 F60000
N11168 G1 X158.89 Y194.426 Z11.4
N11169 G1 Z11
N11170 G1 E.8 F1800
N11171 ; FEATURE: Sparse infill
N11172 ; LINE_WIDTH: 0.45
N11173 G1 F8475
N11174 M204 S8000
N11175 G1 X161.368 Y196.904 E.11268
N11176 G1 X165.206 Y196.904 E.12342
N11177 G1 X159.073 Y190.772 E.27889
N11178 G1 X159.073 Y186.934 E.12342
N11179 G1 X169.044 Y196.904 E.45342
N11180 G1 X172.882 Y196.904 E.12342
N11181 G1 X159.073 Y183.096 E.62796
N11182 M73 P79 R6
N11183 G1 X159.073 Y179.258 E.12342
N11184 G1 X176.72 Y196.904 E.80249
N11185 G1 X180.558 Y196.904 E.12342
N11186 G1 X159.073 Y175.42 E.97703
N11187 G1 X159.073 Y171.582 E.12342
N11188 G1 X184.396 Y196.904 E1.15157
N11189 G1 X188.234 Y196.904 E.12342
N11190 G1 X159.073 Y167.744 E1.3261
N11191 G1 X159.073 Y163.906 E.12342
N11192 G1 X190.544 Y195.377 E1.43118
N11193 G1 X190.544 Y191.539 E.12342
N11194 G1 X159.073 Y160.068 E1.43118
N11195 G1 X159.073 Y156.23 E.12342
N11196 G1 X190.544 Y187.701 E1.43118
N11197 G1 X190.544 Y183.863 E.12342
N11198 G1 X159.073 Y152.392 E1.43118
N11199 G1 X159.073 Y148.554 E.12342
N11200 G1 X190.544 Y180.025 E1.43118
N11201 G1 X190.544 Y176.187 E.12342
N11202 G1 X159.073 Y144.716 E1.43118
N11203 G1 X159.073 Y140.878 E.12342
N11204 G1 X190.544 Y172.349 E1.43118
N11205 G1 X190.544 Y168.511 E.12342
N11206 G1 X159.073 Y137.04 E1.43118
N11207 G1 X159.073 Y133.202 E.12342
N11208 G1 X190.544 Y164.673 E1.43118
N11209 G1 X190.544 Y160.835 E.12342
N11210 G1 X159.073 Y129.364 E1.43118
N11211 G1 X159.073 Y125.526 E.12342
N11212 G1 X190.544 Y156.997 E1.43118
N11213 G1 X190.544 Y153.159 E.12342
N11214 G1 X161.384 Y123.999 E1.3261
N11215 G1 X165.222 Y123.999 E.12342
N11216 G1 X190.544 Y149.321 E1.15157
N11217 G1 X190.544 Y145.483 E.12342
N11218 G1 X169.06 Y123.999 E.97703
N11219 G1 X172.898 Y123.999 E.12342
N11220 G1 X190.544 Y141.645 E.80249
N11221 G1 X190.544 Y137.807 E.12342
N11222 G1 X176.736 Y123.999 E.62796
N11223 G1 X180.574 Y123.999 E.12342
N11224 G1 X190.544 Y133.969 E.45342
N11225 G1 X190.544 Y130.131 E.12342
N11226 G1 X184.412 Y123.999 E.27889
N11227 G1 X188.25 Y123.999 E.12342
N11228 G1 X190.728 Y126.476 E.11268
N11229 ; WIPE_START
N11230 G1 X189.313 Y125.062 E-.76
N11231 ; WIPE_END
N11232 G1 E-.04 F1800
N11233 M204 S10000
N11234 G17
N11235 G3 Z11.4 I1.217 J0 P1  F60000
N11236 ; stop printing object, unique label id: 79
N11237 M625
N11238 ; object ids of layer 55 start: 79
N11239 M624 AQAAAAAAAAA=
N11240 ;======== H2D 20250213========
N11241 ; SKIPPABLE_START
N11242 ; SKIPTYPE: timelapse
N11243 M622.1 S1 ; for prev firware, default turned on
N11244 
N11245 M1002 judge_flag timelapse_record_flag
N11246 
N11247 M622 J1
N11248 M993 A2 B2 C2
N11249 M993 A0 B0 C0
N11250 
N11251 
N11252 M9712 E1 M0
N11253 M83
N11254 G1 Z11.4 F1200
N11255 M400
N11256 M9713
N11257 
N11258 
N11259 M9711 M0 E1 Z11.4 S11 C10 O0 T3000
N11260 
N11261 
N11262 M9712 E1 M0
N11263 G90
N11264 G1 Z14
N11265 G1 Y295 F30000
N11266 G1 Y265 F18000
N11267 M83
N11268 M9713
N11269 
N11270 M993 A3 B3 C3
N11271 
N11272 M623
N11273 ; SKIPPABLE_END
N11274 
N11275 ; object ids of this layer55 end: 79
N11276 M625
N11277 ; CHANGE_LAYER
N11278 ; Z_HEIGHT: 11.2
N11279 ; LAYER_HEIGHT: 0.2
N11280 ;======== H2D 20250521========
N11281 ; layer num/total_layer_count: 56/63
N11282 ; update layer progress
N11283 M73 L56
N11284 M991 S0 P55 ;notify layer change
N11285 
N11286 
N11287 ; OBJECT_ID: 79
N11288 ; COOLING_NODE: 0
N11289 ; start printing object, unique label id: 79
N11290 M624 AQAAAAAAAAA=
N11291 G1 X190.893 Y197.252 F60000
N11292 G1 Z11.2
N11293 G1 E.8 F1800
N11294 ; FEATURE: Inner wall
N11295 G1 F8475
N11296 M204 S8000
N11297 G1 X158.725 Y197.252 E1.03439
N11298 G1 X158.725 Y123.65 E2.36678
N11299 G1 X190.893 Y123.65 E1.03439
N11300 G1 X190.893 Y197.192 E2.36485
N11301 ; COOLING_NODE: 0
N11302 M204 S10000
N11303 G1 X191.3 Y197.659 F60000
N11304 G1 F8475
N11305 M204 S8000
N11306 G1 X158.318 Y197.659 E1.06057
N11307 G1 X158.318 Y123.243 E2.39296
N11308 G1 X191.3 Y123.243 E1.06057
N11309 G1 X191.3 Y197.599 E2.39103
N11310 ; COOLING_NODE: 0
N11311 M204 S10000
N11312 G1 X191.707 Y198.067 F60000
N11313 G1 F8475
N11314 M204 S8000
N11315 G1 X157.911 Y198.067 E1.08675
N11316 G1 X157.911 Y122.836 E2.41914
N11317 G1 X191.707 Y122.836 E1.08675
N11318 G1 X191.707 Y198.007 E2.41721
N11319 ; COOLING_NODE: 0
N11320 M204 S10000
N11321 G1 X192.099 Y198.459 F60000
N11322 ; FEATURE: Outer wall
N11323 ; LINE_WIDTH: 0.42
N11324 G1 F8980
N11325 M204 S5000
N11326 G1 X157.519 Y198.459 E1.03002
N11327 G1 X157.519 Y122.444 E2.26421
N11328 G1 X192.099 Y122.444 E1.03002
N11329 G1 X192.099 Y198.399 E2.26243
N11330 G1 E-.8 F1800
N11331 M204 S10000
N11332 G1 X188.067 Y197.087 Z11.6 F60000
N11333 M73 P80 R6
N11334 G1 Z11.2
N11335 G1 E.8 F1800
N11336 ; FEATURE: Sparse infill
N11337 ; LINE_WIDTH: 0.45
N11338 G1 F8475
N11339 M204 S8000
N11340 G1 X190.544 Y194.609 E.11268
N11341 G1 X190.544 Y190.772 E.12342
N11342 G1 X184.412 Y196.904 E.27889
N11343 G1 X180.574 Y196.904 E.12342
N11344 G1 X190.544 Y186.934 E.45342
N11345 G1 X190.544 Y183.096 E.12342
N11346 G1 X176.736 Y196.904 E.62796
N11347 G1 X172.898 Y196.904 E.12342
N11348 G1 X190.544 Y179.258 E.80249
N11349 G1 X190.544 Y175.42 E.12342
N11350 G1 X169.06 Y196.904 E.97703
N11351 G1 X165.222 Y196.904 E.12342
N11352 G1 X190.544 Y171.582 E1.15157
N11353 G1 X190.544 Y167.744 E.12342
N11354 G1 X161.384 Y196.904 E1.3261
N11355 G1 X159.073 Y196.904 E.0743
N11356 G1 X159.073 Y195.377 E.04912
N11357 G1 X190.544 Y163.906 E1.43118
N11358 G1 X190.544 Y160.068 E.12342
N11359 G1 X159.073 Y191.539 E1.43118
N11360 G1 X159.073 Y187.701 E.12342
N11361 G1 X190.544 Y156.23 E1.43118
N11362 G1 X190.544 Y152.392 E.12342
N11363 G1 X159.073 Y183.863 E1.43118
N11364 G1 X159.073 Y180.025 E.12342
N11365 G1 X190.544 Y148.554 E1.43118
N11366 G1 X190.544 Y144.716 E.12342
N11367 G1 X159.073 Y176.187 E1.43118
N11368 G1 X159.073 Y172.349 E.12342
N11369 G1 X190.544 Y140.878 E1.43118
N11370 G1 X190.544 Y137.04 E.12342
N11371 G1 X159.073 Y168.511 E1.43118
N11372 G1 X159.073 Y164.673 E.12342
N11373 G1 X190.544 Y133.202 E1.43118
N11374 G1 X190.544 Y129.364 E.12342
N11375 G1 X159.073 Y160.835 E1.43118
N11376 G1 X159.073 Y156.997 E.12342
N11377 G1 X190.544 Y125.526 E1.43118
N11378 G1 X190.544 Y123.999 E.04912
N11379 G1 X188.234 Y123.999 E.0743
N11380 G1 X159.073 Y153.159 E1.3261
N11381 G1 X159.073 Y149.321 E.12342
N11382 G1 X184.396 Y123.999 E1.15157
N11383 G1 X180.558 Y123.999 E.12342
N11384 G1 X159.073 Y145.483 E.97703
N11385 G1 X159.073 Y141.645 E.12342
N11386 G1 X176.72 Y123.999 E.80249
N11387 G1 X172.882 Y123.999 E.12342
N11388 G1 X159.073 Y137.807 E.62796
N11389 G1 X159.073 Y133.969 E.12342
N11390 G1 X169.044 Y123.999 E.45342
N11391 G1 X165.206 Y123.999 E.12342
N11392 G1 X159.073 Y130.131 E.27889
N11393 G1 X159.073 Y126.293 E.12342
N11394 G1 X161.551 Y123.815 E.11268
N11395 ; WIPE_START
N11396 G1 X160.137 Y125.23 E-.76
N11397 ; WIPE_END
N11398 G1 E-.04 F1800
N11399 M204 S10000
N11400 G17
N11401 G3 Z11.6 I1.217 J0 P1  F60000
N11402 ; stop printing object, unique label id: 79
N11403 M625
N11404 ; object ids of layer 56 start: 79
N11405 M624 AQAAAAAAAAA=
N11406 ;======== H2D 20250213========
N11407 ; SKIPPABLE_START
N11408 ; SKIPTYPE: timelapse
N11409 M622.1 S1 ; for prev firware, default turned on
N11410 
N11411 M1002 judge_flag timelapse_record_flag
N11412 
N11413 M622 J1
N11414 M993 A2 B2 C2
N11415 M993 A0 B0 C0
N11416 
N11417 
N11418 M9712 E1 M0
N11419 M83
N11420 G1 Z11.6 F1200
N11421 M400
N11422 M9713
N11423 
N11424 
N11425 M9711 M0 E1 Z11.6 S11 C10 O0 T3000
N11426 
N11427 
N11428 M9712 E1 M0
N11429 G90
N11430 G1 Z14.2
N11431 G1 Y295 F30000
N11432 G1 Y265 F18000
N11433 M83
N11434 M9713
N11435 
N11436 M993 A3 B3 C3
N11437 
N11438 M623
N11439 ; SKIPPABLE_END
N11440 
N11441 ; object ids of this layer56 end: 79
N11442 M625
N11443 ; CHANGE_LAYER
N11444 ; Z_HEIGHT: 11.4
N11445 ; LAYER_HEIGHT: 0.2
N11446 ;======== H2D 20250521========
N11447 ; layer num/total_layer_count: 57/63
N11448 ; update layer progress
N11449 M73 L57
N11450 M991 S0 P56 ;notify layer change
N11451 
N11452 
N11453 ; OBJECT_ID: 79
N11454 ; COOLING_NODE: 0
N11455 ; start printing object, unique label id: 79
N11456 M624 AQAAAAAAAAA=
N11457 G1 X190.893 Y197.252 F60000
N11458 G1 Z11.4
N11459 G1 E.8 F1800
N11460 ; FEATURE: Inner wall
N11461 G1 F8475
N11462 M204 S8000
N11463 G1 X158.725 Y197.252 E1.03439
N11464 G1 X158.725 Y123.65 E2.36678
N11465 G1 X190.893 Y123.65 E1.03439
N11466 G1 X190.893 Y197.192 E2.36485
N11467 ; COOLING_NODE: 0
N11468 M204 S10000
N11469 G1 X191.3 Y197.659 F60000
N11470 G1 F8475
N11471 M204 S8000
N11472 G1 X158.318 Y197.659 E1.06057
N11473 G1 X158.318 Y123.243 E2.39296
N11474 G1 X191.3 Y123.243 E1.06057
N11475 G1 X191.3 Y197.599 E2.39103
N11476 ; COOLING_NODE: 0
N11477 M204 S10000
N11478 G1 X191.707 Y198.067 F60000
N11479 G1 F8475
N11480 M204 S8000
N11481 G1 X157.911 Y198.067 E1.08675
N11482 G1 X157.911 Y122.836 E2.41914
N11483 G1 X191.707 Y122.836 E1.08675
N11484 G1 X191.707 Y198.007 E2.41721
N11485 ; COOLING_NODE: 0
N11486 M204 S10000
N11487 G1 X192.099 Y198.459 F60000
N11488 ; FEATURE: Outer wall
N11489 ; LINE_WIDTH: 0.42
N11490 G1 F8871
N11491 M204 S5000
N11492 G1 X157.519 Y198.459 E1.03002
N11493 G1 X157.519 Y122.444 E2.26421
N11494 G1 X192.099 Y122.444 E1.03002
N11495 G1 X192.099 Y198.399 E2.26243
N11496 G1 E-.8 F1800
N11497 M204 S10000
N11498 G1 X184.52 Y197.492 Z11.8 F60000
N11499 G1 X158.89 Y194.426 Z11.8
N11500 G1 Z11.4
N11501 G1 E.8 F1800
N11502 ; FEATURE: Sparse infill
N11503 ; LINE_WIDTH: 0.45
N11504 G1 F8475
N11505 M204 S8000
N11506 G1 X161.368 Y196.904 E.11268
N11507 G1 X165.206 Y196.904 E.12342
N11508 G1 X159.073 Y190.772 E.27889
N11509 G1 X159.073 Y186.934 E.12342
N11510 G1 X169.044 Y196.904 E.45342
N11511 G1 X172.882 Y196.904 E.12342
N11512 G1 X159.073 Y183.096 E.62796
N11513 G1 X159.073 Y179.258 E.12342
N11514 G1 X176.72 Y196.904 E.80249
N11515 G1 X180.558 Y196.904 E.12342
N11516 G1 X159.073 Y175.42 E.97703
N11517 G1 X159.073 Y171.582 E.12342
N11518 G1 X184.396 Y196.904 E1.15157
N11519 G1 X188.234 Y196.904 E.12342
N11520 G1 X159.073 Y167.744 E1.3261
N11521 G1 X159.073 Y163.906 E.12342
N11522 G1 X190.544 Y195.377 E1.43118
N11523 G1 X190.544 Y191.539 E.12342
N11524 G1 X159.073 Y160.068 E1.43118
N11525 G1 X159.073 Y156.23 E.12342
N11526 G1 X190.544 Y187.701 E1.43118
N11527 G1 X190.544 Y183.863 E.12342
N11528 G1 X159.073 Y152.392 E1.43118
N11529 G1 X159.073 Y148.554 E.12342
N11530 G1 X190.544 Y180.025 E1.43118
N11531 G1 X190.544 Y176.187 E.12342
N11532 G1 X159.073 Y144.716 E1.43118
N11533 G1 X159.073 Y140.878 E.12342
N11534 G1 X190.544 Y172.349 E1.43118
N11535 G1 X190.544 Y168.511 E.12342
N11536 G1 X159.073 Y137.04 E1.43118
N11537 G1 X159.073 Y133.202 E.12342
N11538 M73 P81 R6
N11539 G1 X190.544 Y164.673 E1.43118
N11540 G1 X190.544 Y160.835 E.12342
N11541 G1 X159.073 Y129.364 E1.43118
N11542 G1 X159.073 Y125.526 E.12342
N11543 G1 X190.544 Y156.997 E1.43118
N11544 G1 X190.544 Y153.159 E.12342
N11545 G1 X161.384 Y123.999 E1.3261
N11546 G1 X165.222 Y123.999 E.12342
N11547 G1 X190.544 Y149.321 E1.15157
N11548 G1 X190.544 Y145.483 E.12342
N11549 G1 X169.06 Y123.999 E.97703
N11550 G1 X172.898 Y123.999 E.12342
N11551 G1 X190.544 Y141.645 E.80249
N11552 G1 X190.544 Y137.807 E.12342
N11553 G1 X176.736 Y123.999 E.62796
N11554 G1 X180.574 Y123.999 E.12342
N11555 G1 X190.544 Y133.969 E.45342
N11556 G1 X190.544 Y130.131 E.12342
N11557 G1 X184.412 Y123.999 E.27889
N11558 G1 X188.25 Y123.999 E.12342
N11559 G1 X190.728 Y126.476 E.11268
N11560 ; WIPE_START
N11561 G1 X189.313 Y125.062 E-.76
N11562 ; WIPE_END
N11563 G1 E-.04 F1800
N11564 M204 S10000
N11565 G17
N11566 G3 Z11.8 I1.217 J0 P1  F60000
N11567 ; stop printing object, unique label id: 79
N11568 M625
N11569 ; object ids of layer 57 start: 79
N11570 M624 AQAAAAAAAAA=
N11571 ;======== H2D 20250213========
N11572 ; SKIPPABLE_START
N11573 ; SKIPTYPE: timelapse
N11574 M622.1 S1 ; for prev firware, default turned on
N11575 
N11576 M1002 judge_flag timelapse_record_flag
N11577 
N11578 M622 J1
N11579 M993 A2 B2 C2
N11580 M993 A0 B0 C0
N11581 
N11582 
N11583 M9712 E1 M0
N11584 M83
N11585 G1 Z11.8 F1200
N11586 M400
N11587 M9713
N11588 
N11589 
N11590 M9711 M0 E1 Z11.8 S11 C10 O0 T3000
N11591 
N11592 
N11593 M9712 E1 M0
N11594 G90
N11595 G1 Z14.4
N11596 G1 Y295 F30000
N11597 G1 Y265 F18000
N11598 M83
N11599 M9713
N11600 
N11601 M993 A3 B3 C3
N11602 
N11603 M623
N11604 ; SKIPPABLE_END
N11605 
N11606 ; object ids of this layer57 end: 79
N11607 M625
N11608 ; CHANGE_LAYER
N11609 ; Z_HEIGHT: 11.6
N11610 ; LAYER_HEIGHT: 0.200001
N11611 ;======== H2D 20250521========
N11612 ; layer num/total_layer_count: 58/63
N11613 ; update layer progress
N11614 M73 L58
N11615 M991 S0 P57 ;notify layer change
N11616 
N11617 
N11618 M106 S73.95
N11619 ; OBJECT_ID: 79
N11620 ; COOLING_NODE: 0
N11621 ; start printing object, unique label id: 79
N11622 M624 AQAAAAAAAAA=
N11623 G1 X190.893 Y197.252 F60000
N11624 G1 Z11.6
N11625 G1 E.8 F1800
N11626 ; FEATURE: Inner wall
N11627 G1 F8475
N11628 M204 S8000
N11629 G1 X158.725 Y197.252 E1.03439
N11630 G1 X158.725 Y123.65 E2.36678
N11631 G1 X190.893 Y123.65 E1.03439
N11632 G1 X190.893 Y197.192 E2.36485
N11633 ; COOLING_NODE: 0
N11634 M204 S10000
N11635 G1 X191.3 Y197.659 F60000
N11636 G1 F8475
N11637 M204 S8000
N11638 G1 X158.318 Y197.659 E1.06057
N11639 G1 X158.318 Y123.243 E2.39296
N11640 G1 X191.3 Y123.243 E1.06057
N11641 G1 X191.3 Y197.599 E2.39103
N11642 ; COOLING_NODE: 0
N11643 M204 S10000
N11644 G1 X191.707 Y198.067 F60000
N11645 G1 F8475
N11646 M204 S8000
N11647 G1 X157.911 Y198.067 E1.08675
N11648 G1 X157.911 Y122.836 E2.41914
N11649 G1 X191.707 Y122.836 E1.08675
N11650 G1 X191.707 Y198.007 E2.41721
N11651 ; COOLING_NODE: 0
N11652 M204 S10000
N11653 G1 X192.099 Y198.459 F60000
N11654 ; FEATURE: Outer wall
N11655 ; LINE_WIDTH: 0.42
N11656 G1 F8747
N11657 M204 S5000
N11658 G1 X157.519 Y198.459 E1.03002
N11659 G1 X157.519 Y122.444 E2.26421
N11660 G1 X192.099 Y122.444 E1.03002
N11661 G1 X192.099 Y198.399 E2.26243
N11662 G1 E-.8 F1800
N11663 M204 S10000
N11664 G1 X188.427 Y196.727 Z12 F60000
N11665 G1 Z11.6
N11666 G1 E.8 F1800
N11667 ; FEATURE: Sparse infill
N11668 ; LINE_WIDTH: 0.45
N11669 G1 F8475
N11670 M204 S8000
N11671 G1 X190.184 Y194.97 E.0799
N11672 G1 X190.184 Y191.132 E.12342
N11673 G1 X184.772 Y196.544 E.2461
N11674 G1 X180.934 Y196.544 E.12342
N11675 G1 X190.184 Y187.294 E.42064
N11676 G1 X190.184 Y183.456 E.12342
N11677 G1 X177.096 Y196.544 E.59517
N11678 G1 X173.258 Y196.544 E.12342
N11679 G1 X190.184 Y179.618 E.76971
N11680 G1 X190.184 Y175.78 E.12342
N11681 G1 X169.42 Y196.544 E.94424
N11682 G1 X165.582 Y196.544 E.12342
N11683 G1 X190.184 Y171.942 E1.11878
N11684 G1 X190.184 Y168.104 E.12342
N11685 G1 X161.744 Y196.544 E1.29332
N11686 G1 X159.434 Y196.544 E.0743
N11687 G1 X159.434 Y195.016 E.04912
N11688 G1 X190.184 Y164.266 E1.39839
N11689 G1 X190.184 Y160.428 E.12342
N11690 G1 X159.434 Y191.178 E1.39839
N11691 G1 X159.434 Y187.34 E.12342
N11692 G1 X190.184 Y156.59 E1.39839
N11693 G1 X190.184 Y152.752 E.12342
N11694 G1 X159.434 Y183.502 E1.39839
N11695 G1 X159.434 Y179.664 E.12342
N11696 G1 X190.184 Y148.914 E1.39839
N11697 G1 X190.184 Y145.076 E.12342
N11698 G1 X159.434 Y175.826 E1.39839
N11699 G1 X159.434 Y171.988 E.12342
N11700 G1 X190.184 Y141.238 E1.39839
N11701 G1 X190.184 Y137.4 E.12342
N11702 G1 X159.434 Y168.15 E1.39839
N11703 G1 X159.434 Y164.312 E.12342
N11704 G1 X190.184 Y133.562 E1.39839
N11705 G1 X190.184 Y129.724 E.12342
N11706 G1 X159.434 Y160.474 E1.39839
N11707 G1 X159.434 Y156.636 E.12342
N11708 G1 X190.184 Y125.886 E1.39839
N11709 G1 X190.184 Y124.359 E.04912
N11710 G1 X187.873 Y124.359 E.0743
N11711 G1 X159.434 Y152.799 E1.29332
N11712 G1 X159.434 Y148.961 E.12342
N11713 G1 X184.035 Y124.359 E1.11878
N11714 G1 X180.197 Y124.359 E.12342
N11715 G1 X159.434 Y145.123 E.94424
N11716 G1 X159.434 Y141.285 E.12342
N11717 G1 X176.359 Y124.359 E.76971
N11718 G1 X172.521 Y124.359 E.12342
N11719 G1 X159.434 Y137.447 E.59517
N11720 G1 X159.434 Y133.609 E.12342
N11721 G1 X168.683 Y124.359 E.42064
N11722 G1 X164.845 Y124.359 E.12342
N11723 G1 X159.434 Y129.771 E.2461
N11724 G1 X159.434 Y125.933 E.12342
N11725 G1 X161.191 Y124.176 E.0799
N11726 ; WIPE_START
N11727 G1 X159.776 Y125.59 E-.76
N11728 ; WIPE_END
N11729 G1 E-.04 F1800
N11730 M204 S10000
N11731 G17
N11732 G3 Z12 I1.217 J0 P1  F60000
N11733 ; stop printing object, unique label id: 79
N11734 M625
N11735 ; object ids of layer 58 start: 79
N11736 M624 AQAAAAAAAAA=
N11737 ;======== H2D 20250213========
N11738 ; SKIPPABLE_START
N11739 ; SKIPTYPE: timelapse
N11740 M622.1 S1 ; for prev firware, default turned on
N11741 
N11742 M1002 judge_flag timelapse_record_flag
N11743 
N11744 M622 J1
N11745 M993 A2 B2 C2
N11746 M993 A0 B0 C0
N11747 
N11748 
N11749 M9712 E1 M0
N11750 M83
N11751 G1 Z12 F1200
N11752 M400
N11753 M9713
N11754 
N11755 
N11756 M9711 M0 E1 Z12 S11 C10 O0 T3000
N11757 
N11758 
N11759 M9712 E1 M0
N11760 G90
N11761 G1 Z14.6
N11762 G1 Y295 F30000
N11763 G1 Y265 F18000
N11764 M83
N11765 M9713
N11766 
N11767 M993 A3 B3 C3
N11768 
N11769 M623
N11770 ; SKIPPABLE_END
N11771 
N11772 ; object ids of this layer58 end: 79
N11773 M625
N11774 ; CHANGE_LAYER
N11775 ; Z_HEIGHT: 11.8178
N11776 ; LAYER_HEIGHT: 0.217756
N11777 ;======== H2D 20250521========
N11778 ; layer num/total_layer_count: 59/63
N11779 ; update layer progress
N11780 M73 L59
N11781 M991 S0 P58 ;notify layer change
N11782 
N11783 
N11784 M106 S12.75
N11785 ; OBJECT_ID: 79
N11786 ; COOLING_NODE: 0
N11787 ; start printing object, unique label id: 79
N11788 M624 AQAAAAAAAAA=
N11789 G1 X190.904 Y197.264 F60000
N11790 G1 Z11.818
N11791 G1 E.8 F1800
N11792 ; FEATURE: Inner wall
N11793 G1 F7857.484
N11794 M204 S8000
N11795 G1 X158.714 Y197.264 E1.11648
N11796 G1 X158.714 Y123.639 E2.55358
N11797 G1 X190.904 Y123.639 E1.11648
N11798 G1 X190.904 Y197.204 E2.5515
N11799 ; COOLING_NODE: 0
N11800 M204 S10000
N11801 G1 X191.307 Y197.667 F60000
N11802 M73 P82 R6
N11803 G1 F7857.484
N11804 M204 S8000
N11805 G1 X158.31 Y197.667 E1.14445
N11806 G1 X158.31 Y123.236 E2.58155
N11807 G1 X191.307 Y123.236 E1.14445
N11808 G1 X191.307 Y197.607 E2.57947
N11809 ; COOLING_NODE: 0
N11810 M204 S10000
N11811 G1 X191.711 Y198.07 F60000
N11812 G1 F7857.484
N11813 M204 S8000
N11814 G1 X157.907 Y198.07 E1.17243
N11815 G1 X157.907 Y122.832 E2.60952
N11816 G1 X191.711 Y122.832 E1.17243
N11817 G1 X191.711 Y198.01 E2.60744
N11818 ; COOLING_NODE: 0
N11819 M204 S10000
N11820 G1 X192.099 Y198.459 F60000
N11821 ; FEATURE: Outer wall
N11822 ; LINE_WIDTH: 0.42
N11823 G1 F8488.997
N11824 M204 S5000
N11825 G1 X157.519 Y198.459 E1.11013
N11826 G1 X157.519 Y122.444 E2.44032
N11827 G1 X192.099 Y122.444 E1.11013
N11828 G1 X192.099 Y198.399 E2.4384
N11829 G1 E-.8 F1800
N11830 M204 S10000
N11831 G1 X184.483 Y197.891 Z12.218 F60000
N11832 M73 P82 R5
N11833 G1 X158.879 Y196.186 Z12.218
N11834 G1 Z11.818
N11835 G1 E.8 F1800
N11836 ; FEATURE: Bridge
N11837 ; LINE_WIDTH: 0.40101
N11838 ; LAYER_HEIGHT: 0.4
N11839 M106 S255
N11840 G1 F3000
N11841 M204 S8000
N11842 G1 X159.589 Y196.895 E.05004
N11843 G1 X160.227 Y196.895 E.03182
N11844 G1 X159.082 Y195.751 E.08075
N11845 G1 X159.082 Y195.113 E.03182
N11846 G1 X160.864 Y196.895 E.12574
N11847 G1 X161.502 Y196.895 E.03182
N11848 G1 X159.082 Y194.475 E.17074
N11849 G1 X159.082 Y193.837 E.03182
N11850 G1 X162.14 Y196.895 E.21574
N11851 G1 X162.778 Y196.895 E.03182
N11852 G1 X159.082 Y193.2 E.26073
N11853 G1 X159.082 Y192.562 E.03182
N11854 G1 X163.416 Y196.895 E.30573
N11855 G1 X164.054 Y196.895 E.03182
N11856 G1 X159.082 Y191.924 E.35072
N11857 G1 X159.082 Y191.286 E.03182
N11858 G1 X164.691 Y196.895 E.39572
N11859 G1 X165.329 Y196.895 E.03182
N11860 G1 X159.082 Y190.648 E.44072
N11861 G1 X159.082 Y190.01 E.03182
N11862 G1 X165.967 Y196.895 E.48571
N11863 G1 X166.605 Y196.895 E.03182
N11864 G1 X159.082 Y189.373 E.53071
N11865 G1 X159.082 Y188.735 E.03182
N11866 G1 X167.243 Y196.895 E.5757
N11867 G1 X167.88 Y196.895 E.03182
N11868 G1 X159.082 Y188.097 E.6207
N11869 G1 X159.082 Y187.459 E.03182
N11870 G1 X168.518 Y196.895 E.6657
N11871 G1 X169.156 Y196.895 E.03182
N11872 G1 X159.082 Y186.821 E.71069
N11873 G1 X159.082 Y186.183 E.03182
N11874 G1 X169.794 Y196.895 E.75569
N11875 G1 X170.432 Y196.895 E.03182
N11876 G1 X159.082 Y185.546 E.80068
N11877 G1 X159.082 Y184.908 E.03182
N11878 G1 X171.07 Y196.895 E.84568
N11879 G1 X171.707 Y196.895 E.03182
N11880 G1 X159.082 Y184.27 E.89068
N11881 G1 X159.082 Y183.632 E.03182
N11882 G1 X172.345 Y196.895 E.93567
N11883 G1 X172.983 Y196.895 E.03182
N11884 G1 X159.082 Y182.994 E.98067
N11885 G1 X159.082 Y182.357 E.03182
N11886 G1 X173.621 Y196.895 E1.02566
N11887 G1 X174.259 Y196.895 E.03182
N11888 G1 X159.082 Y181.719 E1.07066
N11889 G1 X159.082 Y181.081 E.03182
N11890 G1 X174.897 Y196.895 E1.11566
N11891 G1 X175.534 Y196.895 E.03182
N11892 G1 X159.082 Y180.443 E1.16065
N11893 G1 X159.082 Y179.805 E.03182
N11894 G1 X176.172 Y196.895 E1.20565
N11895 G1 X176.81 Y196.895 E.03182
N11896 G1 X159.082 Y179.167 E1.25064
N11897 G1 X159.082 Y178.53 E.03182
N11898 G1 X177.448 Y196.895 E1.29564
N11899 G1 X178.086 Y196.895 E.03182
N11900 G1 X159.082 Y177.892 E1.34064
N11901 G1 X159.082 Y177.254 E.03182
N11902 G1 X178.723 Y196.895 E1.38563
N11903 G1 X179.361 Y196.895 E.03182
N11904 G1 X159.082 Y176.616 E1.43063
N11905 G1 X159.082 Y175.978 E.03182
N11906 G1 X179.999 Y196.895 E1.47562
N11907 G1 X180.637 Y196.895 E.03182
N11908 G1 X159.082 Y175.34 E1.52062
N11909 G1 X159.082 Y174.703 E.03182
N11910 G1 X181.275 Y196.895 E1.56562
N11911 G1 X181.913 Y196.895 E.03182
N11912 G1 X159.082 Y174.065 E1.61061
N11913 G1 X159.082 Y173.427 E.03182
N11914 G1 X182.55 Y196.895 E1.65561
N11915 G1 X183.188 Y196.895 E.03182
N11916 G1 X159.082 Y172.789 E1.7006
N11917 G1 X159.082 Y172.151 E.03182
N11918 G1 X183.826 Y196.895 E1.7456
N11919 G1 X184.464 Y196.895 E.03182
N11920 M73 P83 R5
N11921 G1 X159.082 Y171.514 E1.7906
N11922 G1 X159.082 Y170.876 E.03182
N11923 G1 X185.102 Y196.895 E1.83559
N11924 G1 X185.74 Y196.895 E.03182
N11925 G1 X159.082 Y170.238 E1.88059
N11926 G1 X159.082 Y169.6 E.03182
N11927 G1 X186.377 Y196.895 E1.92558
N11928 G1 X187.015 Y196.895 E.03182
N11929 G1 X159.082 Y168.962 E1.97058
N11930 G1 X159.082 Y168.324 E.03182
N11931 G1 X187.653 Y196.895 E2.01558
N11932 G1 X188.291 Y196.895 E.03182
N11933 G1 X159.082 Y167.687 E2.06057
N11934 G1 X159.082 Y167.049 E.03182
N11935 G1 X188.929 Y196.895 E2.10557
N11936 G1 X189.567 Y196.895 E.03182
N11937 G1 X159.082 Y166.411 E2.15056
N11938 G1 X159.082 Y165.773 E.03182
N11939 G1 X190.204 Y196.895 E2.19556
N11940 G1 X190.536 Y196.895 E.01653
N11941 G1 X190.536 Y196.589 E.01529
N11942 G1 X159.082 Y165.135 E2.21894
N11943 G1 X159.082 Y164.497 E.03182
N11944 G1 X190.536 Y195.951 E2.21894
N11945 G1 X190.536 Y195.313 E.03182
N11946 G1 X159.082 Y163.86 E2.21894
N11947 G1 X159.082 Y163.222 E.03182
N11948 G1 X190.536 Y194.676 E2.21894
N11949 G1 X190.536 Y194.038 E.03182
N11950 G1 X159.082 Y162.584 E2.21894
N11951 G1 X159.082 Y161.946 E.03182
N11952 G1 X190.536 Y193.4 E2.21894
N11953 G1 X190.536 Y192.762 E.03182
N11954 G1 X159.082 Y161.308 E2.21894
N11955 G1 X159.082 Y160.67 E.03182
N11956 G1 X190.536 Y192.124 E2.21894
N11957 G1 X190.536 Y191.486 E.03182
N11958 G1 X159.082 Y160.033 E2.21894
N11959 G1 X159.082 Y159.395 E.03182
N11960 G1 X190.536 Y190.849 E2.21894
N11961 G1 X190.536 Y190.211 E.03182
N11962 G1 X159.082 Y158.757 E2.21894
N11963 G1 X159.082 Y158.119 E.03182
N11964 G1 X190.536 Y189.573 E2.21894
N11965 G1 X190.536 Y188.935 E.03182
N11966 G1 X159.082 Y157.481 E2.21894
N11967 G1 X159.082 Y156.844 E.03182
N11968 G1 X190.536 Y188.297 E2.21894
N11969 G1 X190.536 Y187.659 E.03182
N11970 M73 P84 R5
N11971 G1 X159.082 Y156.206 E2.21894
N11972 G1 X159.082 Y155.568 E.03182
N11973 G1 X190.536 Y187.022 E2.21894
N11974 G1 X190.536 Y186.384 E.03182
N11975 G1 X159.082 Y154.93 E2.21894
N11976 G1 X159.082 Y154.292 E.03182
N11977 G1 X190.536 Y185.746 E2.21894
N11978 G1 X190.536 Y185.108 E.03182
N11979 G1 X159.082 Y153.654 E2.21894
N11980 G1 X159.082 Y153.017 E.03182
N11981 G1 X190.536 Y184.47 E2.21894
N11982 G1 X190.536 Y183.833 E.03182
N11983 G1 X159.082 Y152.379 E2.21894
N11984 G1 X159.082 Y151.741 E.03182
N11985 G1 X190.536 Y183.195 E2.21894
N11986 G1 X190.536 Y182.557 E.03182
N11987 G1 X159.082 Y151.103 E2.21894
N11988 G1 X159.082 Y150.465 E.03182
N11989 G1 X190.536 Y181.919 E2.21894
N11990 G1 X190.536 Y181.281 E.03182
N11991 G1 X159.082 Y149.827 E2.21894
N11992 G1 X159.082 Y149.19 E.03182
N11993 G1 X190.536 Y180.643 E2.21894
N11994 G1 X190.536 Y180.006 E.03182
N11995 G1 X159.082 Y148.552 E2.21894
N11996 G1 X159.082 Y147.914 E.03182
N11997 G1 X190.536 Y179.368 E2.21894
N11998 G1 X190.536 Y178.73 E.03182
N11999 G1 X159.082 Y147.276 E2.21894
N12000 G1 X159.082 Y146.638 E.03182
N12001 G1 X190.536 Y178.092 E2.21894
N12002 G1 X190.536 Y177.454 E.03182
N12003 G1 X159.082 Y146.001 E2.21894
N12004 G1 X159.082 Y145.363 E.03182
N12005 G1 X190.536 Y176.816 E2.21894
N12006 G1 X190.536 Y176.179 E.03182
N12007 G1 X159.082 Y144.725 E2.21894
N12008 G1 X159.082 Y144.087 E.03182
N12009 G1 X190.536 Y175.541 E2.21894
N12010 G1 X190.536 Y174.903 E.03182
N12011 G1 X159.082 Y143.449 E2.21894
N12012 G1 X159.082 Y142.811 E.03182
N12013 G1 X190.536 Y174.265 E2.21894
N12014 G1 X190.536 Y173.627 E.03182
N12015 M73 P85 R5
N12016 G1 X159.082 Y142.174 E2.21894
N12017 G1 X159.082 Y141.536 E.03182
N12018 G1 X190.536 Y172.989 E2.21894
N12019 G1 X190.536 Y172.352 E.03182
N12020 G1 X159.082 Y140.898 E2.21894
N12021 G1 X159.082 Y140.26 E.03182
N12022 G1 X190.536 Y171.714 E2.21894
N12023 G1 X190.536 Y171.076 E.03182
N12024 G1 X159.082 Y139.622 E2.21894
N12025 G1 X159.082 Y138.984 E.03182
N12026 M73 P85 R4
N12027 G1 X190.536 Y170.438 E2.21894
N12028 G1 X190.536 Y169.8 E.03182
N12029 G1 X159.082 Y138.347 E2.21894
N12030 G1 X159.082 Y137.709 E.03182
N12031 G1 X190.536 Y169.163 E2.21894
N12032 G1 X190.536 Y168.525 E.03182
N12033 G1 X159.082 Y137.071 E2.21894
N12034 G1 X159.082 Y136.433 E.03182
N12035 G1 X190.536 Y167.887 E2.21894
N12036 G1 X190.536 Y167.249 E.03182
N12037 G1 X159.082 Y135.795 E2.21894
N12038 G1 X159.082 Y135.158 E.03182
N12039 G1 X190.536 Y166.611 E2.21894
N12040 G1 X190.536 Y165.973 E.03182
N12041 G1 X159.082 Y134.52 E2.21894
N12042 G1 X159.082 Y133.882 E.03182
N12043 G1 X190.536 Y165.336 E2.21894
N12044 G1 X190.536 Y164.698 E.03182
N12045 G1 X159.082 Y133.244 E2.21894
N12046 G1 X159.082 Y132.606 E.03182
N12047 G1 X190.536 Y164.06 E2.21894
N12048 G1 X190.536 Y163.422 E.03182
N12049 G1 X159.082 Y131.968 E2.21894
N12050 G1 X159.082 Y131.331 E.03182
N12051 G1 X190.536 Y162.784 E2.21894
N12052 G1 X190.536 Y162.146 E.03182
N12053 G1 X159.082 Y130.693 E2.21894
N12054 G1 X159.082 Y130.055 E.03182
N12055 G1 X190.536 Y161.509 E2.21894
N12056 G1 X190.536 Y160.871 E.03182
N12057 G1 X159.082 Y129.417 E2.21894
N12058 G1 X159.082 Y128.779 E.03182
N12059 G1 X190.536 Y160.233 E2.21894
N12060 G1 X190.536 Y159.595 E.03182
N12061 M73 P86 R4
N12062 G1 X159.082 Y128.141 E2.21894
N12063 G1 X159.082 Y127.504 E.03182
N12064 G1 X190.536 Y158.957 E2.21894
N12065 G1 X190.536 Y158.32 E.03182
N12066 G1 X159.082 Y126.866 E2.21894
N12067 G1 X159.082 Y126.228 E.03182
N12068 G1 X190.536 Y157.682 E2.21894
N12069 G1 X190.536 Y157.044 E.03182
N12070 G1 X159.082 Y125.59 E2.21894
N12071 G1 X159.082 Y124.952 E.03182
N12072 G1 X190.536 Y156.406 E2.21894
N12073 G1 X190.536 Y155.768 E.03182
N12074 G1 X159.082 Y124.315 E2.21894
N12075 G1 X159.082 Y124.007 E.01533
N12076 G1 X159.412 Y124.007 E.01649
N12077 G1 X190.536 Y155.13 E2.19562
N12078 G1 X190.536 Y154.493 E.03182
N12079 G1 X160.05 Y124.007 E2.15063
N12080 G1 X160.688 Y124.007 E.03182
N12081 G1 X190.536 Y153.855 E2.10563
N12082 G1 X190.536 Y153.217 E.03182
N12083 G1 X161.326 Y124.007 E2.06063
N12084 G1 X161.964 Y124.007 E.03182
N12085 G1 X190.536 Y152.579 E2.01564
N12086 G1 X190.536 Y151.941 E.03182
N12087 G1 X162.602 Y124.007 E1.97064
N12088 G1 X163.239 Y124.007 E.03182
N12089 G1 X190.536 Y151.303 E1.92565
N12090 G1 X190.536 Y150.666 E.03182
N12091 G1 X163.877 Y124.007 E1.88065
N12092 G1 X164.515 Y124.007 E.03182
N12093 G1 X190.536 Y150.028 E1.83565
N12094 G1 X190.536 Y149.39 E.03182
N12095 G1 X165.153 Y124.007 E1.79066
N12096 G1 X165.791 Y124.007 E.03182
N12097 G1 X190.536 Y148.752 E1.74566
N12098 G1 X190.536 Y148.114 E.03182
N12099 G1 X166.429 Y124.007 E1.70067
N12100 G1 X167.066 Y124.007 E.03182
N12101 G1 X190.536 Y147.477 E1.65567
N12102 G1 X190.536 Y146.839 E.03182
N12103 G1 X167.704 Y124.007 E1.61067
N12104 G1 X168.342 Y124.007 E.03182
N12105 G1 X190.536 Y146.201 E1.56568
N12106 G1 X190.536 Y145.563 E.03182
N12107 G1 X168.98 Y124.007 E1.52068
N12108 G1 X169.618 Y124.007 E.03182
N12109 G1 X190.536 Y144.925 E1.47569
N12110 G1 X190.536 Y144.287 E.03182
N12111 G1 X170.255 Y124.007 E1.43069
N12112 G1 X170.893 Y124.007 E.03182
N12113 G1 X190.536 Y143.65 E1.38569
N12114 G1 X190.536 Y143.012 E.03182
N12115 M73 P87 R4
N12116 G1 X171.531 Y124.007 E1.3407
N12117 G1 X172.169 Y124.007 E.03182
N12118 G1 X190.536 Y142.374 E1.2957
N12119 G1 X190.536 Y141.736 E.03182
N12120 G1 X172.807 Y124.007 E1.25071
N12121 G1 X173.445 Y124.007 E.03182
N12122 G1 X190.536 Y141.098 E1.20571
N12123 G1 X190.536 Y140.46 E.03182
N12124 G1 X174.082 Y124.007 E1.16071
N12125 G1 X174.72 Y124.007 E.03182
N12126 G1 X190.536 Y139.823 E1.11572
N12127 G1 X190.536 Y139.185 E.03182
N12128 G1 X175.358 Y124.007 E1.07072
N12129 G1 X175.996 Y124.007 E.03182
N12130 G1 X190.536 Y138.547 E1.02573
N12131 G1 X190.536 Y137.909 E.03182
N12132 G1 X176.634 Y124.007 E.98073
N12133 G1 X177.272 Y124.007 E.03182
N12134 G1 X190.536 Y137.271 E.93573
N12135 G1 X190.536 Y136.634 E.03182
N12136 G1 X177.909 Y124.007 E.89074
N12137 G1 X178.547 Y124.007 E.03182
N12138 G1 X190.536 Y135.996 E.84574
N12139 G1 X190.536 Y135.358 E.03182
N12140 G1 X179.185 Y124.007 E.80075
N12141 G1 X179.823 Y124.007 E.03182
N12142 G1 X190.536 Y134.72 E.75575
N12143 G1 X190.536 Y134.082 E.03182
N12144 G1 X180.461 Y124.007 E.71075
N12145 G1 X181.098 Y124.007 E.03182
N12146 G1 X190.536 Y133.444 E.66576
N12147 G1 X190.536 Y132.807 E.03182
N12148 G1 X181.736 Y124.007 E.62076
N12149 G1 X182.374 Y124.007 E.03182
N12150 G1 X190.536 Y132.169 E.57577
N12151 G1 X190.536 Y131.531 E.03182
N12152 G1 X183.012 Y124.007 E.53077
N12153 G1 X183.65 Y124.007 E.03182
N12154 G1 X190.536 Y130.893 E.48577
N12155 G1 X190.536 Y130.255 E.03182
N12156 G1 X184.288 Y124.007 E.44078
N12157 G1 X184.925 Y124.007 E.03182
N12158 G1 X190.536 Y129.617 E.39578
N12159 G1 X190.536 Y128.98 E.03182
N12160 G1 X185.563 Y124.007 E.35079
N12161 G1 X186.201 Y124.007 E.03182
N12162 G1 X190.536 Y128.342 E.30579
N12163 G1 X190.536 Y127.704 E.03182
N12164 G1 X186.839 Y124.007 E.26079
N12165 G1 X187.477 Y124.007 E.03182
N12166 G1 X190.536 Y127.066 E.2158
N12167 G1 X190.536 Y126.428 E.03182
N12168 G1 X188.115 Y124.007 E.1708
N12169 G1 X188.752 Y124.007 E.03182
N12170 G1 X190.536 Y125.79 E.12581
N12171 G1 X190.536 Y125.153 E.03182
N12172 G1 X189.39 Y124.007 E.08081
N12173 G1 X190.028 Y124.007 E.03182
N12174 G1 X190.738 Y124.717 E.0501
N12175 M106 S12.75
N12176 ; WIPE_START
N12177 G1 X190.028 Y124.007 E-.38165
N12178 G1 X189.39 Y124.007 E-.24238
N12179 G1 X189.643 Y124.26 E-.13598
N12180 ; WIPE_END
N12181 G1 E-.04 F1800
N12182 M204 S10000
N12183 G17
N12184 G3 Z12.218 I1.217 J0 P1  F60000
N12185 ; stop printing object, unique label id: 79
N12186 M625
N12187 ; object ids of layer 59 start: 79
N12188 M624 AQAAAAAAAAA=
N12189 ;======== H2D 20250213========
N12190 ; SKIPPABLE_START
N12191 ; SKIPTYPE: timelapse
N12192 M622.1 S1 ; for prev firware, default turned on
N12193 
N12194 M1002 judge_flag timelapse_record_flag
N12195 
N12196 M622 J1
N12197 M993 A2 B2 C2
N12198 M993 A0 B0 C0
N12199 
N12200 
N12201 M9712 E1 M0
N12202 M83
N12203 G1 Z12.2178 F1200
N12204 M400
N12205 M9713
N12206 
N12207 
N12208 M9711 M0 E1 Z12.2178 S11 C10 O0 T3000
N12209 
N12210 
N12211 M9712 E1 M0
N12212 G90
N12213 G1 Z14.8178
N12214 G1 Y295 F30000
N12215 G1 Y265 F18000
N12216 M83
N12217 M9713
N12218 
N12219 M993 A3 B3 C3
N12220 
N12221 M623
N12222 ; SKIPPABLE_END
N12223 
N12224 ; object ids of this layer59 end: 79
N12225 M625
N12226 ; CHANGE_LAYER
N12227 ; Z_HEIGHT: 12.0355
N12228 ; LAYER_HEIGHT: 0.217756
N12229 ;======== H2D 20250521========
N12230 ; layer num/total_layer_count: 60/63
N12231 ; update layer progress
N12232 M73 L60
N12233 M991 S0 P59 ;notify layer change
N12234 
N12235 
N12236 ; OBJECT_ID: 79
N12237 ; COOLING_NODE: 0
N12238 ; start printing object, unique label id: 79
N12239 M624 AQAAAAAAAAA=
N12240 G1 X190.904 Y197.264 F60000
N12241 G1 Z12.036
N12242 G1 E.8 F1800
N12243 ; FEATURE: Inner wall
N12244 ; LINE_WIDTH: 0.45
N12245 G1 F7857.484
N12246 M204 S8000
N12247 G1 X158.714 Y197.264 E1.11648
N12248 G1 X158.714 Y123.639 E2.55358
N12249 G1 X190.904 Y123.639 E1.11648
N12250 G1 X190.904 Y197.204 E2.5515
N12251 ; COOLING_NODE: 0
N12252 M204 S10000
N12253 G1 X191.307 Y197.667 F60000
N12254 G1 F7857.484
N12255 M204 S8000
N12256 G1 X158.31 Y197.667 E1.14445
N12257 G1 X158.31 Y123.236 E2.58155
N12258 G1 X191.307 Y123.236 E1.14445
N12259 G1 X191.307 Y197.607 E2.57947
N12260 ; COOLING_NODE: 0
N12261 M204 S10000
N12262 G1 X191.711 Y198.07 F60000
N12263 G1 F7857.484
N12264 M204 S8000
N12265 G1 X157.907 Y198.07 E1.17243
N12266 G1 X157.907 Y122.832 E2.60952
N12267 G1 X191.711 Y122.832 E1.17243
N12268 G1 X191.711 Y198.01 E2.60744
N12269 ; COOLING_NODE: 0
N12270 M204 S10000
N12271 G1 X192.099 Y198.459 F60000
N12272 ; FEATURE: Outer wall
N12273 ; LINE_WIDTH: 0.42
N12274 G1 F8488.997
N12275 M204 S5000
N12276 G1 X157.519 Y198.459 E1.11013
N12277 G1 X157.519 Y122.444 E2.44032
N12278 G1 X192.099 Y122.444 E1.11013
N12279 G1 X192.099 Y198.399 E2.4384
N12280 G1 E-.8 F1800
N12281 M204 S10000
N12282 G1 X189.986 Y197.102 Z12.436 F60000
N12283 G1 Z12.036
N12284 G1 E.8 F1800
N12285 ; FEATURE: Internal solid infill
N12286 ; LINE_WIDTH: 0.420681
N12287 G1 F8473.54
N12288 M204 S8000
N12289 G1 X190.574 Y196.514 E.02675
N12290 G1 X190.574 Y195.985 E.01701
N12291 G1 X189.625 Y196.934 E.04316
N12292 G1 X189.096 Y196.934 E.01701
N12293 G1 X190.574 Y195.456 E.06722
N12294 G1 X190.574 Y194.927 E.01701
N12295 G1 X188.567 Y196.934 E.09127
N12296 G1 X188.039 Y196.934 E.01701
N12297 G1 X190.574 Y194.398 E.11532
N12298 G1 X190.574 Y193.87 E.01701
N12299 G1 X187.51 Y196.934 E.13938
N12300 G1 X186.981 Y196.934 E.01701
N12301 G1 X190.574 Y193.341 E.16343
N12302 G1 X190.574 Y192.812 E.01701
N12303 G1 X186.452 Y196.934 E.18748
N12304 G1 X185.923 Y196.934 E.01701
N12305 G1 X190.574 Y192.283 E.21154
N12306 G1 X190.574 Y191.754 E.01701
N12307 G1 X185.394 Y196.934 E.23559
N12308 G1 X184.866 Y196.934 E.01701
N12309 G1 X190.574 Y191.225 E.25965
N12310 G1 X190.574 Y190.696 E.01701
N12311 G1 X184.337 Y196.934 E.2837
N12312 G1 X183.808 Y196.934 E.01701
N12313 G1 X190.574 Y190.168 E.30775
N12314 G1 X190.574 Y189.639 E.01701
N12315 G1 X183.279 Y196.934 E.33181
N12316 G1 X182.75 Y196.934 E.01701
N12317 G1 X190.574 Y189.11 E.35586
N12318 G1 X190.574 Y188.581 E.01701
N12319 G1 X182.221 Y196.934 E.37992
N12320 G1 X181.692 Y196.934 E.01701
N12321 G1 X190.574 Y188.052 E.40397
N12322 G1 X190.574 Y187.523 E.01701
N12323 G1 X181.164 Y196.934 E.42802
N12324 G1 X180.635 Y196.934 E.01701
N12325 G1 X190.574 Y186.995 E.45208
N12326 G1 X190.574 Y186.466 E.01701
N12327 G1 X180.106 Y196.934 E.47613
N12328 G1 X179.577 Y196.934 E.01701
N12329 G1 X190.574 Y185.937 E.50019
N12330 G1 X190.574 Y185.408 E.01701
N12331 G1 X179.048 Y196.934 E.52424
N12332 G1 X178.519 Y196.934 E.01701
N12333 G1 X190.574 Y184.879 E.54829
N12334 G1 X190.574 Y184.35 E.01701
N12335 G1 X177.991 Y196.934 E.57235
N12336 G1 X177.462 Y196.934 E.01701
N12337 G1 X190.574 Y183.821 E.5964
N12338 G1 X190.574 Y183.293 E.01701
N12339 M73 P88 R4
N12340 G1 X176.933 Y196.934 E.62045
N12341 G1 X176.404 Y196.934 E.01701
N12342 G1 X190.574 Y182.764 E.64451
N12343 G1 X190.574 Y182.235 E.01701
N12344 G1 X175.875 Y196.934 E.66856
N12345 G1 X175.346 Y196.934 E.01701
N12346 G1 X190.574 Y181.706 E.69262
N12347 G1 X190.574 Y181.177 E.01701
N12348 G1 X174.817 Y196.934 E.71667
N12349 G1 X174.289 Y196.934 E.01701
N12350 G1 X190.574 Y180.648 E.74072
N12351 G1 X190.574 Y180.12 E.01701
N12352 G1 X173.76 Y196.934 E.76478
N12353 G1 X173.231 Y196.934 E.01701
N12354 G1 X190.574 Y179.591 E.78883
N12355 G1 X190.574 Y179.062 E.01701
N12356 G1 X172.702 Y196.934 E.81289
N12357 G1 X172.173 Y196.934 E.01701
N12358 G1 X190.574 Y178.533 E.83694
N12359 G1 X190.574 Y178.004 E.01701
N12360 G1 X171.644 Y196.934 E.86099
N12361 G1 X171.116 Y196.934 E.01701
N12362 G1 X190.574 Y177.475 E.88505
N12363 G1 X190.574 Y176.946 E.01701
N12364 G1 X170.587 Y196.934 E.9091
N12365 G1 X170.058 Y196.934 E.01701
N12366 G1 X190.574 Y176.418 E.93315
N12367 G1 X190.574 Y175.889 E.01701
N12368 G1 X169.529 Y196.934 E.95721
N12369 G1 X169 Y196.934 E.01701
N12370 G1 X190.574 Y175.36 E.98126
N12371 G1 X190.574 Y174.831 E.01701
N12372 G1 X168.471 Y196.934 E1.00532
N12373 G1 X167.942 Y196.934 E.01701
N12374 G1 X190.574 Y174.302 E1.02937
N12375 G1 X190.574 Y173.773 E.01701
N12376 M73 P88 R3
N12377 G1 X167.414 Y196.934 E1.05342
N12378 G1 X166.885 Y196.934 E.01701
N12379 G1 X190.574 Y173.245 E1.07748
N12380 G1 X190.574 Y172.716 E.01701
N12381 G1 X166.356 Y196.934 E1.10153
N12382 G1 X165.827 Y196.934 E.01701
N12383 G1 X190.574 Y172.187 E1.12559
N12384 G1 X190.574 Y171.658 E.01701
N12385 G1 X165.298 Y196.934 E1.14964
N12386 G1 X164.769 Y196.934 E.01701
N12387 G1 X190.574 Y171.129 E1.17369
N12388 G1 X190.574 Y170.6 E.01701
N12389 G1 X164.241 Y196.934 E1.19775
N12390 G1 X163.712 Y196.934 E.01701
N12391 G1 X190.574 Y170.071 E1.2218
N12392 G1 X190.574 Y169.543 E.01701
N12393 G1 X163.183 Y196.934 E1.24586
N12394 G1 X162.654 Y196.934 E.01701
N12395 G1 X190.574 Y169.014 E1.26991
N12396 G1 X190.574 Y168.485 E.01701
N12397 G1 X162.125 Y196.934 E1.29396
N12398 G1 X161.596 Y196.934 E.01701
N12399 G1 X190.574 Y167.956 E1.31802
N12400 G1 X190.574 Y167.427 E.01701
N12401 G1 X161.068 Y196.934 E1.34207
N12402 G1 X160.539 Y196.934 E.01701
N12403 G1 X190.574 Y166.898 E1.36613
N12404 G1 X190.574 Y166.37 E.01701
N12405 G1 X160.01 Y196.934 E1.39018
N12406 G1 X159.481 Y196.934 E.01701
N12407 G1 X190.574 Y165.841 E1.41423
N12408 G1 X190.574 Y165.312 E.01701
N12409 G1 X159.044 Y196.842 E1.43413
N12410 G1 X159.044 Y196.314 E.01701
N12411 G1 X190.574 Y164.783 E1.43413
N12412 G1 X190.574 Y164.254 E.01701
N12413 G1 X159.044 Y195.785 E1.43413
N12414 G1 X159.044 Y195.256 E.01701
N12415 G1 X190.574 Y163.725 E1.43413
N12416 G1 X190.574 Y163.197 E.01701
N12417 G1 X159.044 Y194.727 E1.43413
N12418 G1 X159.044 Y194.198 E.01701
N12419 G1 X190.574 Y162.668 E1.43413
N12420 G1 X190.574 Y162.139 E.01701
N12421 G1 X159.044 Y193.669 E1.43413
N12422 G1 X159.044 Y193.14 E.01701
N12423 G1 X190.574 Y161.61 E1.43413
N12424 G1 X190.574 Y161.081 E.01701
N12425 G1 X159.044 Y192.612 E1.43413
N12426 G1 X159.044 Y192.083 E.01701
N12427 G1 X190.574 Y160.552 E1.43413
N12428 G1 X190.574 Y160.023 E.01701
N12429 G1 X159.044 Y191.554 E1.43413
N12430 G1 X159.044 Y191.025 E.01701
N12431 G1 X190.574 Y159.495 E1.43413
N12432 G1 X190.574 Y158.966 E.01701
N12433 G1 X159.044 Y190.496 E1.43413
N12434 G1 X159.044 Y189.967 E.01701
N12435 G1 X190.574 Y158.437 E1.43413
N12436 G1 X190.574 Y157.908 E.01701
N12437 G1 X159.044 Y189.439 E1.43413
N12438 G1 X159.044 Y188.91 E.01701
N12439 G1 X190.574 Y157.379 E1.43413
N12440 G1 X190.574 Y156.85 E.01701
N12441 G1 X159.044 Y188.381 E1.43413
N12442 G1 X159.044 Y187.852 E.01701
N12443 G1 X190.574 Y156.322 E1.43413
N12444 G1 X190.574 Y155.793 E.01701
N12445 G1 X159.044 Y187.323 E1.43413
N12446 G1 X159.044 Y186.794 E.01701
N12447 G1 X190.574 Y155.264 E1.43413
N12448 G1 X190.574 Y154.735 E.01701
N12449 G1 X159.044 Y186.265 E1.43413
N12450 G1 X159.044 Y185.737 E.01701
N12451 G1 X190.574 Y154.206 E1.43413
N12452 G1 X190.574 Y153.677 E.01701
N12453 G1 X159.044 Y185.208 E1.43413
N12454 G1 X159.044 Y184.679 E.01701
N12455 G1 X190.574 Y153.148 E1.43413
N12456 G1 X190.574 Y152.62 E.01701
N12457 G1 X159.044 Y184.15 E1.43413
N12458 G1 X159.044 Y183.621 E.01701
N12459 G1 X190.574 Y152.091 E1.43413
N12460 G1 X190.574 Y151.562 E.01701
N12461 G1 X159.044 Y183.092 E1.43413
N12462 G1 X159.044 Y182.564 E.01701
N12463 G1 X190.574 Y151.033 E1.43413
N12464 G1 X190.574 Y150.504 E.01701
N12465 G1 X159.044 Y182.035 E1.43413
N12466 G1 X159.044 Y181.506 E.01701
N12467 G1 X190.574 Y149.975 E1.43413
N12468 G1 X190.574 Y149.447 E.01701
N12469 G1 X159.044 Y180.977 E1.43413
N12470 G1 X159.044 Y180.448 E.01701
N12471 G1 X190.574 Y148.918 E1.43413
N12472 G1 X190.574 Y148.389 E.01701
N12473 G1 X159.044 Y179.919 E1.43413
N12474 G1 X159.044 Y179.39 E.01701
N12475 G1 X190.574 Y147.86 E1.43413
N12476 G1 X190.574 Y147.331 E.01701
N12477 M73 P89 R3
N12478 G1 X159.044 Y178.862 E1.43413
N12479 G1 X159.044 Y178.333 E.01701
N12480 G1 X190.574 Y146.802 E1.43413
N12481 G1 X190.574 Y146.273 E.01701
N12482 G1 X159.044 Y177.804 E1.43413
N12483 G1 X159.044 Y177.275 E.01701
N12484 G1 X190.574 Y145.745 E1.43413
N12485 G1 X190.574 Y145.216 E.01701
N12486 G1 X159.044 Y176.746 E1.43413
N12487 G1 X159.044 Y176.217 E.01701
N12488 G1 X190.574 Y144.687 E1.43413
N12489 G1 X190.574 Y144.158 E.01701
N12490 G1 X159.044 Y175.689 E1.43413
N12491 G1 X159.044 Y175.16 E.01701
N12492 G1 X190.574 Y143.629 E1.43413
N12493 G1 X190.574 Y143.1 E.01701
N12494 G1 X159.044 Y174.631 E1.43413
N12495 G1 X159.044 Y174.102 E.01701
N12496 G1 X190.574 Y142.572 E1.43413
N12497 G1 X190.574 Y142.043 E.01701
N12498 G1 X159.044 Y173.573 E1.43413
N12499 G1 X159.044 Y173.044 E.01701
N12500 G1 X190.574 Y141.514 E1.43413
N12501 G1 X190.574 Y140.985 E.01701
N12502 G1 X159.044 Y172.516 E1.43413
N12503 G1 X159.044 Y171.987 E.01701
N12504 G1 X190.574 Y140.456 E1.43413
N12505 G1 X190.574 Y139.927 E.01701
N12506 G1 X159.044 Y171.458 E1.43413
N12507 G1 X159.044 Y170.929 E.01701
N12508 G1 X190.574 Y139.398 E1.43413
N12509 G1 X190.574 Y138.87 E.01701
N12510 G1 X159.044 Y170.4 E1.43413
N12511 G1 X159.044 Y169.871 E.01701
N12512 G1 X190.574 Y138.341 E1.43413
N12513 G1 X190.574 Y137.812 E.01701
N12514 G1 X159.044 Y169.342 E1.43413
N12515 G1 X159.044 Y168.814 E.01701
N12516 G1 X190.574 Y137.283 E1.43413
N12517 G1 X190.574 Y136.754 E.01701
N12518 G1 X159.044 Y168.285 E1.43413
N12519 G1 X159.044 Y167.756 E.01701
N12520 G1 X190.574 Y136.225 E1.43413
N12521 G1 X190.574 Y135.697 E.01701
N12522 G1 X159.044 Y167.227 E1.43413
N12523 G1 X159.044 Y166.698 E.01701
N12524 G1 X190.574 Y135.168 E1.43413
N12525 G1 X190.574 Y134.639 E.01701
N12526 G1 X159.044 Y166.169 E1.43413
N12527 G1 X159.044 Y165.641 E.01701
N12528 G1 X190.574 Y134.11 E1.43413
N12529 G1 X190.574 Y133.581 E.01701
N12530 G1 X159.044 Y165.112 E1.43413
N12531 G1 X159.044 Y164.583 E.01701
N12532 G1 X190.574 Y133.052 E1.43413
N12533 G1 X190.574 Y132.523 E.01701
N12534 G1 X159.044 Y164.054 E1.43413
N12535 G1 X159.044 Y163.525 E.01701
N12536 G1 X190.574 Y131.995 E1.43413
N12537 G1 X190.574 Y131.466 E.01701
N12538 G1 X159.044 Y162.996 E1.43413
N12539 G1 X159.044 Y162.467 E.01701
N12540 G1 X190.574 Y130.937 E1.43413
N12541 G1 X190.574 Y130.408 E.01701
N12542 G1 X159.044 Y161.939 E1.43413
N12543 G1 X159.044 Y161.41 E.01701
N12544 G1 X190.574 Y129.879 E1.43413
N12545 G1 X190.574 Y129.35 E.01701
N12546 G1 X159.044 Y160.881 E1.43413
N12547 G1 X159.044 Y160.352 E.01701
N12548 G1 X190.574 Y128.822 E1.43413
N12549 G1 X190.574 Y128.293 E.01701
N12550 G1 X159.044 Y159.823 E1.43413
N12551 G1 X159.044 Y159.294 E.01701
N12552 G1 X190.574 Y127.764 E1.43413
N12553 G1 X190.574 Y127.235 E.01701
N12554 G1 X159.044 Y158.766 E1.43413
N12555 G1 X159.044 Y158.237 E.01701
N12556 G1 X190.574 Y126.706 E1.43413
N12557 G1 X190.574 Y126.177 E.01701
N12558 G1 X159.044 Y157.708 E1.43413
N12559 G1 X159.044 Y157.179 E.01701
N12560 G1 X190.574 Y125.649 E1.43413
N12561 G1 X190.574 Y125.12 E.01701
N12562 G1 X159.044 Y156.65 E1.43413
N12563 G1 X159.044 Y156.121 E.01701
N12564 G1 X190.574 Y124.591 E1.43413
N12565 G1 X190.574 Y124.062 E.01701
N12566 G1 X159.044 Y155.592 E1.43413
N12567 G1 X159.044 Y155.064 E.01701
N12568 G1 X190.138 Y123.969 E1.41431
N12569 G1 X189.61 Y123.969 E.01701
N12570 G1 X159.044 Y154.535 E1.39026
N12571 G1 X159.044 Y154.006 E.01701
N12572 G1 X189.081 Y123.969 E1.3662
N12573 G1 X188.552 Y123.969 E.01701
N12574 G1 X159.044 Y153.477 E1.34215
N12575 G1 X159.044 Y152.948 E.01701
N12576 G1 X188.023 Y123.969 E1.3181
N12577 G1 X187.494 Y123.969 E.01701
N12578 G1 X159.044 Y152.419 E1.29404
N12579 G1 X159.044 Y151.891 E.01701
N12580 G1 X186.965 Y123.969 E1.26999
N12581 G1 X186.437 Y123.969 E.01701
N12582 G1 X159.044 Y151.362 E1.24593
N12583 G1 X159.044 Y150.833 E.01701
N12584 G1 X185.908 Y123.969 E1.22188
N12585 G1 X185.379 Y123.969 E.01701
N12586 G1 X159.044 Y150.304 E1.19783
N12587 G1 X159.044 Y149.775 E.01701
N12588 G1 X184.85 Y123.969 E1.17377
N12589 G1 X184.321 Y123.969 E.01701
N12590 G1 X159.044 Y149.246 E1.14972
N12591 G1 X159.044 Y148.717 E.01701
N12592 G1 X183.792 Y123.969 E1.12566
N12593 G1 X183.263 Y123.969 E.01701
N12594 G1 X159.044 Y148.189 E1.10161
N12595 G1 X159.044 Y147.66 E.01701
N12596 G1 X182.735 Y123.969 E1.07756
N12597 G1 X182.206 Y123.969 E.01701
N12598 G1 X159.044 Y147.131 E1.0535
N12599 G1 X159.044 Y146.602 E.01701
N12600 M73 P90 R3
N12601 G1 X181.677 Y123.969 E1.02945
N12602 G1 X181.148 Y123.969 E.01701
N12603 G1 X159.044 Y146.073 E1.0054
N12604 G1 X159.044 Y145.544 E.01701
N12605 G1 X180.619 Y123.969 E.98134
N12606 G1 X180.09 Y123.969 E.01701
N12607 G1 X159.044 Y145.016 E.95729
N12608 G1 X159.044 Y144.487 E.01701
N12609 G1 X179.562 Y123.969 E.93323
N12610 G1 X179.033 Y123.969 E.01701
N12611 G1 X159.044 Y143.958 E.90918
N12612 G1 X159.044 Y143.429 E.01701
N12613 G1 X178.504 Y123.969 E.88513
N12614 G1 X177.975 Y123.969 E.01701
N12615 G1 X159.044 Y142.9 E.86107
N12616 G1 X159.044 Y142.371 E.01701
N12617 G1 X177.446 Y123.969 E.83702
N12618 G1 X176.917 Y123.969 E.01701
N12619 G1 X159.044 Y141.842 E.81296
N12620 G1 X159.044 Y141.314 E.01701
N12621 G1 X176.388 Y123.969 E.78891
N12622 G1 X175.86 Y123.969 E.01701
N12623 G1 X159.044 Y140.785 E.76486
N12624 G1 X159.044 Y140.256 E.01701
N12625 G1 X175.331 Y123.969 E.7408
N12626 G1 X174.802 Y123.969 E.01701
N12627 G1 X159.044 Y139.727 E.71675
N12628 G1 X159.044 Y139.198 E.01701
N12629 G1 X174.273 Y123.969 E.69269
N12630 G1 X173.744 Y123.969 E.01701
N12631 G1 X159.044 Y138.669 E.66864
N12632 G1 X159.044 Y138.141 E.01701
N12633 G1 X173.215 Y123.969 E.64459
N12634 G1 X172.687 Y123.969 E.01701
N12635 G1 X159.044 Y137.612 E.62053
N12636 G1 X159.044 Y137.083 E.01701
N12637 G1 X172.158 Y123.969 E.59648
N12638 G1 X171.629 Y123.969 E.01701
N12639 G1 X159.044 Y136.554 E.57243
N12640 G1 X159.044 Y136.025 E.01701
N12641 G1 X171.1 Y123.969 E.54837
N12642 G1 X170.571 Y123.969 E.01701
N12643 G1 X159.044 Y135.496 E.52432
N12644 G1 X159.044 Y134.968 E.01701
N12645 G1 X170.042 Y123.969 E.50026
N12646 G1 X169.513 Y123.969 E.01701
N12647 G1 X159.044 Y134.439 E.47621
N12648 G1 X159.044 Y133.91 E.01701
N12649 G1 X168.985 Y123.969 E.45216
N12650 G1 X168.456 Y123.969 E.01701
N12651 G1 X159.044 Y133.381 E.4281
N12652 G1 X159.044 Y132.852 E.01701
N12653 G1 X167.927 Y123.969 E.40405
N12654 G1 X167.398 Y123.969 E.01701
N12655 G1 X159.044 Y132.323 E.37999
N12656 G1 X159.044 Y131.794 E.01701
N12657 G1 X166.869 Y123.969 E.35594
N12658 G1 X166.34 Y123.969 E.01701
N12659 G1 X159.044 Y131.266 E.33189
N12660 G1 X159.044 Y130.737 E.01701
N12661 G1 X165.812 Y123.969 E.30783
N12662 G1 X165.283 Y123.969 E.01701
N12663 G1 X159.044 Y130.208 E.28378
N12664 G1 X159.044 Y129.679 E.01701
N12665 G1 X164.754 Y123.969 E.25972
N12666 G1 X164.225 Y123.969 E.01701
N12667 G1 X159.044 Y129.15 E.23567
N12668 G1 X159.044 Y128.621 E.01701
N12669 G1 X163.696 Y123.969 E.21162
N12670 G1 X163.167 Y123.969 E.01701
N12671 G1 X159.044 Y128.093 E.18756
N12672 G1 X159.044 Y127.564 E.01701
N12673 G1 X162.638 Y123.969 E.16351
N12674 G1 X162.11 Y123.969 E.01701
N12675 G1 X159.044 Y127.035 E.13946
N12676 G1 X159.044 Y126.506 E.01701
N12677 G1 X161.581 Y123.969 E.1154
N12678 G1 X161.052 Y123.969 E.01701
N12679 G1 X159.044 Y125.977 E.09135
N12680 G1 X159.044 Y125.448 E.01701
N12681 G1 X160.523 Y123.969 E.06729
N12682 G1 X159.994 Y123.969 E.01701
N12683 G1 X159.044 Y124.919 E.04324
N12684 G1 X159.044 Y124.391 E.01701
N12685 G1 X159.633 Y123.801 E.02683
N12686 ; WIPE_START
N12687 G1 X159.044 Y124.391 E-.31695
N12688 G1 X159.044 Y124.919 E-.20096
N12689 G1 X159.494 Y124.469 E-.24209
N12690 ; WIPE_END
N12691 G1 E-.04 F1800
N12692 M204 S10000
N12693 G17
N12694 G3 Z12.436 I1.217 J0 P1  F60000
N12695 ; stop printing object, unique label id: 79
N12696 M625
N12697 ; object ids of layer 60 start: 79
N12698 M624 AQAAAAAAAAA=
N12699 ;======== H2D 20250213========
N12700 ; SKIPPABLE_START
N12701 ; SKIPTYPE: timelapse
N12702 M622.1 S1 ; for prev firware, default turned on
N12703 
N12704 M1002 judge_flag timelapse_record_flag
N12705 
N12706 M622 J1
N12707 M993 A2 B2 C2
N12708 M993 A0 B0 C0
N12709 
N12710 
N12711 M9712 E1 M0
N12712 M83
N12713 G1 Z12.4355 F1200
N12714 M400
N12715 M9713
N12716 
N12717 
N12718 M9711 M0 E1 Z12.4355 S11 C10 O0 T3000
N12719 
N12720 
N12721 M9712 E1 M0
N12722 G90
N12723 G1 Z15.0355
N12724 G1 Y295 F30000
N12725 G1 Y265 F18000
N12726 M83
N12727 M9713
N12728 
N12729 M993 A3 B3 C3
N12730 
N12731 M623
N12732 ; SKIPPABLE_END
N12733 
N12734 ; object ids of this layer60 end: 79
N12735 M625
N12736 ; CHANGE_LAYER
N12737 ; Z_HEIGHT: 12.2533
N12738 ; LAYER_HEIGHT: 0.217756
N12739 ;======== H2D 20250521========
N12740 ; layer num/total_layer_count: 61/63
N12741 ; update layer progress
N12742 M73 L61
N12743 M991 S0 P60 ;notify layer change
N12744 
N12745 
N12746 ; OBJECT_ID: 79
N12747 ; COOLING_NODE: 0
N12748 ; start printing object, unique label id: 79
N12749 M624 AQAAAAAAAAA=
N12750 G1 X190.904 Y197.264 F60000
N12751 G1 Z12.253
N12752 G1 E.8 F1800
N12753 ; FEATURE: Inner wall
N12754 ; LINE_WIDTH: 0.45
N12755 G1 F7857.484
N12756 M204 S8000
N12757 G1 X158.714 Y197.264 E1.11648
N12758 G1 X158.714 Y123.639 E2.55358
N12759 G1 X190.904 Y123.639 E1.11648
N12760 G1 X190.904 Y197.204 E2.5515
N12761 ; COOLING_NODE: 0
N12762 M204 S10000
N12763 G1 X191.307 Y197.667 F60000
N12764 G1 F7857.484
N12765 M204 S8000
N12766 G1 X158.31 Y197.667 E1.14445
N12767 G1 X158.31 Y123.236 E2.58155
N12768 G1 X191.307 Y123.236 E1.14445
N12769 G1 X191.307 Y197.607 E2.57947
N12770 ; COOLING_NODE: 0
N12771 M204 S10000
N12772 G1 X191.711 Y198.07 F60000
N12773 G1 F7857.484
N12774 M204 S8000
N12775 G1 X157.907 Y198.07 E1.17243
N12776 G1 X157.907 Y122.832 E2.60952
N12777 G1 X191.711 Y122.832 E1.17243
N12778 G1 X191.711 Y198.01 E2.60744
N12779 ; COOLING_NODE: 0
N12780 M204 S10000
N12781 G1 X192.099 Y198.459 F60000
N12782 ; FEATURE: Outer wall
N12783 ; LINE_WIDTH: 0.42
N12784 G1 F8488.997
N12785 M204 S5000
N12786 G1 X157.519 Y198.459 E1.11013
N12787 G1 X157.519 Y122.444 E2.44032
N12788 G1 X192.099 Y122.444 E1.11013
N12789 G1 X192.099 Y198.399 E2.4384
N12790 G1 E-.8 F1800
N12791 M204 S10000
N12792 G1 X184.481 Y197.927 Z12.653 F60000
N12793 G1 X158.876 Y196.344 Z12.653
N12794 G1 Z12.253
N12795 G1 E.8 F1800
N12796 ; FEATURE: Internal solid infill
N12797 ; LINE_WIDTH: 0.420681
N12798 G1 F8473.54
N12799 M204 S8000
N12800 G1 X159.465 Y196.934 E.02682
N12801 G1 X159.994 Y196.934 E.01701
N12802 G1 X159.044 Y195.983 E.04324
N12803 G1 X159.044 Y195.454 E.01701
N12804 G1 X160.523 Y196.934 E.06729
N12805 G1 X161.052 Y196.934 E.01701
N12806 G1 X159.044 Y194.926 E.09135
N12807 G1 X159.044 Y194.397 E.01701
N12808 G1 X161.581 Y196.934 E.1154
N12809 G1 X162.11 Y196.934 E.01701
N12810 G1 X159.044 Y193.868 E.13945
N12811 G1 X159.044 Y193.339 E.01701
N12812 G1 X162.638 Y196.934 E.16351
N12813 G1 X163.167 Y196.934 E.01701
N12814 G1 X159.044 Y192.81 E.18756
N12815 G1 X159.044 Y192.281 E.01701
N12816 G1 X163.696 Y196.934 E.21162
N12817 G1 X164.225 Y196.934 E.01701
N12818 G1 X159.044 Y191.752 E.23567
N12819 G1 X159.044 Y191.224 E.01701
N12820 G1 X164.754 Y196.934 E.25972
N12821 G1 X165.283 Y196.934 E.01701
N12822 G1 X159.044 Y190.695 E.28378
N12823 G1 X159.044 Y190.166 E.01701
N12824 G1 X165.812 Y196.934 E.30783
N12825 G1 X166.34 Y196.934 E.01701
N12826 G1 X159.044 Y189.637 E.33189
N12827 G1 X159.044 Y189.108 E.01701
N12828 G1 X166.869 Y196.934 E.35594
N12829 G1 X167.398 Y196.934 E.01701
N12830 G1 X159.044 Y188.579 E.37999
N12831 G1 X159.044 Y188.051 E.01701
N12832 G1 X167.927 Y196.934 E.40405
N12833 G1 X168.456 Y196.934 E.01701
N12834 G1 X159.044 Y187.522 E.4281
N12835 G1 X159.044 Y186.993 E.01701
N12836 G1 X168.985 Y196.934 E.45215
N12837 G1 X169.513 Y196.934 E.01701
N12838 G1 X159.044 Y186.464 E.47621
N12839 G1 X159.044 Y185.935 E.01701
N12840 G1 X170.042 Y196.934 E.50026
N12841 G1 X170.571 Y196.934 E.01701
N12842 G1 X159.044 Y185.406 E.52432
N12843 G1 X159.044 Y184.877 E.01701
N12844 G1 X171.1 Y196.934 E.54837
N12845 G1 X171.629 Y196.934 E.01701
N12846 G1 X159.044 Y184.349 E.57242
N12847 G1 X159.044 Y183.82 E.01701
N12848 G1 X172.158 Y196.934 E.59648
N12849 G1 X172.687 Y196.934 E.01701
N12850 G1 X159.044 Y183.291 E.62053
N12851 G1 X159.044 Y182.762 E.01701
N12852 G1 X173.215 Y196.934 E.64459
N12853 G1 X173.744 Y196.934 E.01701
N12854 G1 X159.044 Y182.233 E.66864
N12855 G1 X159.044 Y181.704 E.01701
N12856 G1 X174.273 Y196.934 E.69269
N12857 G1 X174.802 Y196.934 E.01701
N12858 G1 X159.044 Y181.176 E.71675
N12859 G1 X159.044 Y180.647 E.01701
N12860 G1 X175.331 Y196.934 E.7408
N12861 G1 X175.86 Y196.934 E.01701
N12862 G1 X159.044 Y180.118 E.76486
N12863 G1 X159.044 Y179.589 E.01701
N12864 G1 X176.388 Y196.934 E.78891
N12865 G1 X176.917 Y196.934 E.01701
N12866 G1 X159.044 Y179.06 E.81296
N12867 G1 X159.044 Y178.531 E.01701
N12868 G1 X177.446 Y196.934 E.83702
N12869 G1 X177.975 Y196.934 E.01701
N12870 G1 X159.044 Y178.002 E.86107
N12871 G1 X159.044 Y177.474 E.01701
N12872 G1 X178.504 Y196.934 E.88512
N12873 G1 X179.033 Y196.934 E.01701
N12874 G1 X159.044 Y176.945 E.90918
N12875 G1 X159.044 Y176.416 E.01701
N12876 G1 X179.561 Y196.934 E.93323
N12877 G1 X180.09 Y196.934 E.01701
N12878 G1 X159.044 Y175.887 E.95729
N12879 G1 X159.044 Y175.358 E.01701
N12880 G1 X180.619 Y196.934 E.98134
N12881 G1 X181.148 Y196.934 E.01701
N12882 M73 P91 R3
N12883 G1 X159.044 Y174.829 E1.00539
N12884 G1 X159.044 Y174.301 E.01701
N12885 G1 X181.677 Y196.934 E1.02945
N12886 G1 X182.206 Y196.934 E.01701
N12887 G1 X159.044 Y173.772 E1.0535
N12888 G1 X159.044 Y173.243 E.01701
N12889 G1 X182.735 Y196.934 E1.07756
N12890 G1 X183.263 Y196.934 E.01701
N12891 G1 X159.044 Y172.714 E1.10161
N12892 G1 X159.044 Y172.185 E.01701
N12893 G1 X183.792 Y196.934 E1.12566
N12894 G1 X184.321 Y196.934 E.01701
N12895 G1 X159.044 Y171.656 E1.14972
N12896 G1 X159.044 Y171.127 E.01701
N12897 G1 X184.85 Y196.934 E1.17377
N12898 G1 X185.379 Y196.934 E.01701
N12899 G1 X159.044 Y170.599 E1.19783
N12900 G1 X159.044 Y170.07 E.01701
N12901 G1 X185.908 Y196.934 E1.22188
N12902 G1 X186.436 Y196.934 E.01701
N12903 G1 X159.044 Y169.541 E1.24593
N12904 G1 X159.044 Y169.012 E.01701
N12905 M73 P91 R2
N12906 G1 X186.965 Y196.934 E1.26999
N12907 G1 X187.494 Y196.934 E.01701
N12908 G1 X159.044 Y168.483 E1.29404
N12909 G1 X159.044 Y167.954 E.01701
N12910 G1 X188.023 Y196.934 E1.31809
N12911 G1 X188.552 Y196.934 E.01701
N12912 G1 X159.044 Y167.426 E1.34215
N12913 G1 X159.044 Y166.897 E.01701
N12914 G1 X189.081 Y196.934 E1.3662
N12915 G1 X189.61 Y196.934 E.01701
N12916 G1 X159.044 Y166.368 E1.39026
N12917 G1 X159.044 Y165.839 E.01701
N12918 G1 X190.138 Y196.934 E1.41431
N12919 G1 X190.574 Y196.934 E.01401
N12920 G1 X190.574 Y196.841 E.003
N12921 G1 X159.044 Y165.31 E1.43413
N12922 G1 X159.044 Y164.781 E.01701
N12923 G1 X190.574 Y196.312 E1.43413
N12924 G1 X190.574 Y195.783 E.01701
N12925 G1 X159.044 Y164.252 E1.43413
N12926 G1 X159.044 Y163.724 E.01701
N12927 G1 X190.574 Y195.254 E1.43413
N12928 G1 X190.574 Y194.725 E.01701
N12929 G1 X159.044 Y163.195 E1.43413
N12930 G1 X159.044 Y162.666 E.01701
N12931 G1 X190.574 Y194.196 E1.43413
N12932 G1 X190.574 Y193.668 E.01701
N12933 G1 X159.044 Y162.137 E1.43413
N12934 G1 X159.044 Y161.608 E.01701
N12935 G1 X190.574 Y193.139 E1.43413
N12936 G1 X190.574 Y192.61 E.01701
N12937 G1 X159.044 Y161.079 E1.43413
N12938 G1 X159.044 Y160.551 E.01701
N12939 G1 X190.574 Y192.081 E1.43413
N12940 G1 X190.574 Y191.552 E.01701
N12941 G1 X159.044 Y160.022 E1.43413
N12942 G1 X159.044 Y159.493 E.01701
N12943 G1 X190.574 Y191.023 E1.43413
N12944 G1 X190.574 Y190.495 E.01701
N12945 G1 X159.044 Y158.964 E1.43413
N12946 G1 X159.044 Y158.435 E.01701
N12947 G1 X190.574 Y189.966 E1.43413
N12948 G1 X190.574 Y189.437 E.01701
N12949 G1 X159.044 Y157.906 E1.43413
N12950 G1 X159.044 Y157.378 E.01701
N12951 G1 X190.574 Y188.908 E1.43413
N12952 G1 X190.574 Y188.379 E.01701
N12953 G1 X159.044 Y156.849 E1.43413
N12954 G1 X159.044 Y156.32 E.01701
N12955 G1 X190.574 Y187.85 E1.43413
N12956 G1 X190.574 Y187.321 E.01701
N12957 G1 X159.044 Y155.791 E1.43413
N12958 G1 X159.044 Y155.262 E.01701
N12959 G1 X190.574 Y186.793 E1.43413
N12960 G1 X190.574 Y186.264 E.01701
N12961 G1 X159.044 Y154.733 E1.43413
N12962 G1 X159.044 Y154.204 E.01701
N12963 G1 X190.574 Y185.735 E1.43413
N12964 G1 X190.574 Y185.206 E.01701
N12965 G1 X159.044 Y153.676 E1.43413
N12966 G1 X159.044 Y153.147 E.01701
N12967 G1 X190.574 Y184.677 E1.43413
N12968 G1 X190.574 Y184.148 E.01701
N12969 G1 X159.044 Y152.618 E1.43413
N12970 G1 X159.044 Y152.089 E.01701
N12971 G1 X190.574 Y183.62 E1.43413
N12972 G1 X190.574 Y183.091 E.01701
N12973 G1 X159.044 Y151.56 E1.43413
N12974 G1 X159.044 Y151.031 E.01701
N12975 G1 X190.574 Y182.562 E1.43413
N12976 G1 X190.574 Y182.033 E.01701
N12977 G1 X159.044 Y150.503 E1.43413
N12978 G1 X159.044 Y149.974 E.01701
N12979 G1 X190.574 Y181.504 E1.43413
N12980 G1 X190.574 Y180.975 E.01701
N12981 G1 X159.044 Y149.445 E1.43413
N12982 G1 X159.044 Y148.916 E.01701
N12983 G1 X190.574 Y180.446 E1.43413
N12984 G1 X190.574 Y179.918 E.01701
N12985 G1 X159.044 Y148.387 E1.43413
N12986 G1 X159.044 Y147.858 E.01701
N12987 G1 X190.574 Y179.389 E1.43413
N12988 G1 X190.574 Y178.86 E.01701
N12989 G1 X159.044 Y147.329 E1.43413
N12990 G1 X159.044 Y146.801 E.01701
N12991 G1 X190.574 Y178.331 E1.43413
N12992 G1 X190.574 Y177.802 E.01701
N12993 G1 X159.044 Y146.272 E1.43413
N12994 G1 X159.044 Y145.743 E.01701
N12995 G1 X190.574 Y177.273 E1.43413
N12996 G1 X190.574 Y176.745 E.01701
N12997 G1 X159.044 Y145.214 E1.43413
N12998 G1 X159.044 Y144.685 E.01701
N12999 G1 X190.574 Y176.216 E1.43413
N13000 G1 X190.574 Y175.687 E.01701
N13001 G1 X159.044 Y144.156 E1.43413
N13002 G1 X159.044 Y143.628 E.01701
N13003 G1 X190.574 Y175.158 E1.43413
N13004 G1 X190.574 Y174.629 E.01701
N13005 G1 X159.044 Y143.099 E1.43413
N13006 G1 X159.044 Y142.57 E.01701
N13007 G1 X190.574 Y174.1 E1.43413
N13008 G1 X190.574 Y173.571 E.01701
N13009 M73 P92 R2
N13010 G1 X159.044 Y142.041 E1.43413
N13011 G1 X159.044 Y141.512 E.01701
N13012 G1 X190.574 Y173.043 E1.43413
N13013 G1 X190.574 Y172.514 E.01701
N13014 G1 X159.044 Y140.983 E1.43413
N13015 G1 X159.044 Y140.454 E.01701
N13016 G1 X190.574 Y171.985 E1.43413
N13017 G1 X190.574 Y171.456 E.01701
N13018 G1 X159.044 Y139.926 E1.43413
N13019 G1 X159.044 Y139.397 E.01701
N13020 G1 X190.574 Y170.927 E1.43413
N13021 G1 X190.574 Y170.398 E.01701
N13022 G1 X159.044 Y138.868 E1.43413
N13023 G1 X159.044 Y138.339 E.01701
N13024 G1 X190.574 Y169.87 E1.43413
N13025 G1 X190.574 Y169.341 E.01701
N13026 G1 X159.044 Y137.81 E1.43413
N13027 G1 X159.044 Y137.281 E.01701
N13028 G1 X190.574 Y168.812 E1.43413
N13029 G1 X190.574 Y168.283 E.01701
N13030 G1 X159.044 Y136.753 E1.43413
N13031 G1 X159.044 Y136.224 E.01701
N13032 G1 X190.574 Y167.754 E1.43413
N13033 G1 X190.574 Y167.225 E.01701
N13034 G1 X159.044 Y135.695 E1.43413
N13035 G1 X159.044 Y135.166 E.01701
N13036 G1 X190.574 Y166.697 E1.43413
N13037 G1 X190.574 Y166.168 E.01701
N13038 G1 X159.044 Y134.637 E1.43413
N13039 G1 X159.044 Y134.108 E.01701
N13040 G1 X190.574 Y165.639 E1.43413
N13041 G1 X190.574 Y165.11 E.01701
N13042 G1 X159.044 Y133.579 E1.43413
N13043 G1 X159.044 Y133.051 E.01701
N13044 G1 X190.574 Y164.581 E1.43413
N13045 G1 X190.574 Y164.052 E.01701
N13046 G1 X159.044 Y132.522 E1.43413
N13047 G1 X159.044 Y131.993 E.01701
N13048 G1 X190.574 Y163.523 E1.43413
N13049 G1 X190.574 Y162.995 E.01701
N13050 G1 X159.044 Y131.464 E1.43413
N13051 G1 X159.044 Y130.935 E.01701
N13052 G1 X190.574 Y162.466 E1.43413
N13053 G1 X190.574 Y161.937 E.01701
N13054 G1 X159.044 Y130.406 E1.43413
N13055 G1 X159.044 Y129.878 E.01701
N13056 G1 X190.574 Y161.408 E1.43413
N13057 G1 X190.574 Y160.879 E.01701
N13058 G1 X159.044 Y129.349 E1.43413
N13059 G1 X159.044 Y128.82 E.01701
N13060 G1 X190.574 Y160.35 E1.43413
N13061 G1 X190.574 Y159.822 E.01701
N13062 G1 X159.044 Y128.291 E1.43413
N13063 G1 X159.044 Y127.762 E.01701
N13064 G1 X190.574 Y159.293 E1.43413
N13065 G1 X190.574 Y158.764 E.01701
N13066 G1 X159.044 Y127.233 E1.43413
N13067 G1 X159.044 Y126.704 E.01701
N13068 G1 X190.574 Y158.235 E1.43413
N13069 G1 X190.574 Y157.706 E.01701
N13070 G1 X159.044 Y126.176 E1.43413
N13071 G1 X159.044 Y125.647 E.01701
N13072 G1 X190.574 Y157.177 E1.43413
N13073 G1 X190.574 Y156.648 E.01701
N13074 G1 X159.044 Y125.118 E1.43413
N13075 G1 X159.044 Y124.589 E.01701
N13076 G1 X190.574 Y156.12 E1.43413
N13077 G1 X190.574 Y155.591 E.01701
N13078 G1 X159.044 Y124.06 E1.43413
N13079 G1 X159.044 Y123.969 E.00294
N13080 G1 X159.481 Y123.969 E.01407
N13081 G1 X190.574 Y155.062 E1.41423
N13082 G1 X190.574 Y154.533 E.01701
N13083 G1 X160.01 Y123.969 E1.39018
N13084 G1 X160.539 Y123.969 E.01701
N13085 G1 X190.574 Y154.004 E1.36613
N13086 G1 X190.574 Y153.475 E.01701
N13087 G1 X161.068 Y123.969 E1.34207
N13088 G1 X161.596 Y123.969 E.01701
N13089 G1 X190.574 Y152.947 E1.31802
N13090 G1 X190.574 Y152.418 E.01701
N13091 G1 X162.125 Y123.969 E1.29396
N13092 G1 X162.654 Y123.969 E.01701
N13093 G1 X190.574 Y151.889 E1.26991
N13094 G1 X190.574 Y151.36 E.01701
N13095 G1 X163.183 Y123.969 E1.24586
N13096 G1 X163.712 Y123.969 E.01701
N13097 G1 X190.574 Y150.831 E1.2218
N13098 G1 X190.574 Y150.302 E.01701
N13099 G1 X164.241 Y123.969 E1.19775
N13100 G1 X164.769 Y123.969 E.01701
N13101 G1 X190.574 Y149.773 E1.17369
N13102 G1 X190.574 Y149.245 E.01701
N13103 G1 X165.298 Y123.969 E1.14964
N13104 G1 X165.827 Y123.969 E.01701
N13105 G1 X190.574 Y148.716 E1.12559
N13106 G1 X190.574 Y148.187 E.01701
N13107 G1 X166.356 Y123.969 E1.10153
N13108 G1 X166.885 Y123.969 E.01701
N13109 G1 X190.574 Y147.658 E1.07748
N13110 G1 X190.574 Y147.129 E.01701
N13111 G1 X167.414 Y123.969 E1.05342
N13112 G1 X167.942 Y123.969 E.01701
N13113 G1 X190.574 Y146.6 E1.02937
N13114 G1 X190.574 Y146.072 E.01701
N13115 G1 X168.471 Y123.969 E1.00532
N13116 G1 X169 Y123.969 E.01701
N13117 G1 X190.574 Y145.543 E.98126
N13118 G1 X190.574 Y145.014 E.01701
N13119 G1 X169.529 Y123.969 E.95721
N13120 G1 X170.058 Y123.969 E.01701
N13121 G1 X190.574 Y144.485 E.93316
N13122 G1 X190.574 Y143.956 E.01701
N13123 G1 X170.587 Y123.969 E.9091
N13124 G1 X171.116 Y123.969 E.01701
N13125 G1 X190.574 Y143.427 E.88505
N13126 G1 X190.574 Y142.898 E.01701
N13127 G1 X171.644 Y123.969 E.86099
N13128 G1 X172.173 Y123.969 E.01701
N13129 G1 X190.574 Y142.37 E.83694
N13130 G1 X190.574 Y141.841 E.01701
N13131 G1 X172.702 Y123.969 E.81289
N13132 G1 X173.231 Y123.969 E.01701
N13133 G1 X190.574 Y141.312 E.78883
N13134 G1 X190.574 Y140.783 E.01701
N13135 G1 X173.76 Y123.969 E.76478
N13136 G1 X174.289 Y123.969 E.01701
N13137 G1 X190.574 Y140.254 E.74072
N13138 G1 X190.574 Y139.725 E.01701
N13139 G1 X174.817 Y123.969 E.71667
N13140 M73 P93 R2
N13141 G1 X175.346 Y123.969 E.01701
N13142 G1 X190.574 Y139.197 E.69262
N13143 G1 X190.574 Y138.668 E.01701
N13144 G1 X175.875 Y123.969 E.66856
N13145 G1 X176.404 Y123.969 E.01701
N13146 G1 X190.574 Y138.139 E.64451
N13147 G1 X190.574 Y137.61 E.01701
N13148 G1 X176.933 Y123.969 E.62045
N13149 G1 X177.462 Y123.969 E.01701
N13150 G1 X190.574 Y137.081 E.5964
N13151 G1 X190.574 Y136.552 E.01701
N13152 G1 X177.991 Y123.969 E.57235
N13153 G1 X178.519 Y123.969 E.01701
N13154 G1 X190.574 Y136.023 E.54829
N13155 G1 X190.574 Y135.495 E.01701
N13156 G1 X179.048 Y123.969 E.52424
N13157 G1 X179.577 Y123.969 E.01701
N13158 G1 X190.574 Y134.966 E.50019
N13159 G1 X190.574 Y134.437 E.01701
N13160 G1 X180.106 Y123.969 E.47613
N13161 G1 X180.635 Y123.969 E.01701
N13162 G1 X190.574 Y133.908 E.45208
N13163 G1 X190.574 Y133.379 E.01701
N13164 G1 X181.164 Y123.969 E.42802
N13165 G1 X181.692 Y123.969 E.01701
N13166 G1 X190.574 Y132.85 E.40397
N13167 G1 X190.574 Y132.322 E.01701
N13168 G1 X182.221 Y123.969 E.37992
N13169 G1 X182.75 Y123.969 E.01701
N13170 G1 X190.574 Y131.793 E.35586
N13171 G1 X190.574 Y131.264 E.01701
N13172 G1 X183.279 Y123.969 E.33181
N13173 G1 X183.808 Y123.969 E.01701
N13174 G1 X190.574 Y130.735 E.30775
N13175 G1 X190.574 Y130.206 E.01701
N13176 G1 X184.337 Y123.969 E.2837
N13177 G1 X184.866 Y123.969 E.01701
N13178 G1 X190.574 Y129.677 E.25965
N13179 G1 X190.574 Y129.148 E.01701
N13180 G1 X185.394 Y123.969 E.23559
N13181 G1 X185.923 Y123.969 E.01701
N13182 G1 X190.574 Y128.62 E.21154
N13183 G1 X190.574 Y128.091 E.01701
N13184 G1 X186.452 Y123.969 E.18748
N13185 G1 X186.981 Y123.969 E.01701
N13186 G1 X190.574 Y127.562 E.16343
N13187 G1 X190.574 Y127.033 E.01701
N13188 G1 X187.51 Y123.969 E.13938
N13189 G1 X188.039 Y123.969 E.01701
N13190 G1 X190.574 Y126.504 E.11532
N13191 G1 X190.574 Y125.975 E.01701
N13192 G1 X188.567 Y123.969 E.09127
N13193 G1 X189.096 Y123.969 E.01701
N13194 G1 X190.574 Y125.447 E.06722
N13195 G1 X190.574 Y124.918 E.01701
N13196 G1 X189.625 Y123.969 E.04316
N13197 G1 X190.154 Y123.969 E.01701
N13198 G1 X190.742 Y124.557 E.02675
N13199 ; WIPE_START
N13200 G1 X190.154 Y123.969 E-.31602
N13201 G1 X189.625 Y123.969 E-.20096
N13202 G1 X190.077 Y124.421 E-.24302
N13203 ; WIPE_END
N13204 G1 E-.04 F1800
N13205 M204 S10000
N13206 G17
N13207 G3 Z12.653 I1.217 J0 P1  F60000
N13208 ; stop printing object, unique label id: 79
N13209 M625
N13210 ; object ids of layer 61 start: 79
N13211 M624 AQAAAAAAAAA=
N13212 ;======== H2D 20250213========
N13213 ; SKIPPABLE_START
N13214 ; SKIPTYPE: timelapse
N13215 M622.1 S1 ; for prev firware, default turned on
N13216 
N13217 M1002 judge_flag timelapse_record_flag
N13218 
N13219 M622 J1
N13220 M993 A2 B2 C2
N13221 M993 A0 B0 C0
N13222 
N13223 
N13224 M9712 E1 M0
N13225 M83
N13226 G1 Z12.6533 F1200
N13227 M400
N13228 M9713
N13229 
N13230 
N13231 M9711 M0 E1 Z12.6533 S11 C10 O0 T3000
N13232 
N13233 
N13234 M9712 E1 M0
N13235 G90
N13236 G1 Z15.2533
N13237 G1 Y295 F30000
N13238 G1 Y265 F18000
N13239 M83
N13240 M9713
N13241 
N13242 M993 A3 B3 C3
N13243 
N13244 M623
N13245 ; SKIPPABLE_END
N13246 
N13247 ; object ids of this layer61 end: 79
N13248 M625
N13249 ; CHANGE_LAYER
N13250 ; Z_HEIGHT: 12.471
N13251 ; LAYER_HEIGHT: 0.217756
N13252 ;======== H2D 20250521========
N13253 ; layer num/total_layer_count: 62/63
N13254 ; update layer progress
N13255 M73 L62
N13256 M991 S0 P61 ;notify layer change
N13257 
N13258 
N13259 ; OBJECT_ID: 79
N13260 ; COOLING_NODE: 0
N13261 ; start printing object, unique label id: 79
N13262 M624 AQAAAAAAAAA=
N13263 G1 X190.904 Y197.264 F60000
N13264 G1 Z12.471
N13265 G1 E.8 F1800
N13266 ; FEATURE: Inner wall
N13267 ; LINE_WIDTH: 0.45
N13268 G1 F7857.484
N13269 M204 S8000
N13270 G1 X158.714 Y197.264 E1.11648
N13271 G1 X158.714 Y123.639 E2.55358
N13272 G1 X190.904 Y123.639 E1.11648
N13273 G1 X190.904 Y197.204 E2.5515
N13274 ; COOLING_NODE: 0
N13275 M204 S10000
N13276 G1 X191.307 Y197.667 F60000
N13277 G1 F7857.484
N13278 M204 S8000
N13279 G1 X158.31 Y197.667 E1.14445
N13280 G1 X158.31 Y123.236 E2.58155
N13281 G1 X191.307 Y123.236 E1.14445
N13282 G1 X191.307 Y197.607 E2.57947
N13283 ; COOLING_NODE: 0
N13284 M204 S10000
N13285 G1 X191.711 Y198.07 F60000
N13286 G1 F7857.484
N13287 M204 S8000
N13288 G1 X157.907 Y198.07 E1.17243
N13289 G1 X157.907 Y122.832 E2.60952
N13290 G1 X191.711 Y122.832 E1.17243
N13291 G1 X191.711 Y198.01 E2.60744
N13292 ; COOLING_NODE: 0
N13293 M204 S10000
N13294 G1 X192.099 Y198.459 F60000
N13295 ; FEATURE: Outer wall
N13296 ; LINE_WIDTH: 0.42
N13297 G1 F8488.997
N13298 M204 S5000
N13299 G1 X157.519 Y198.459 E1.11013
N13300 G1 X157.519 Y122.444 E2.44032
N13301 G1 X192.099 Y122.444 E1.11013
N13302 G1 X192.099 Y198.399 E2.4384
N13303 G1 E-.8 F1800
N13304 M204 S10000
N13305 G1 X189.986 Y197.102 Z12.871 F60000
N13306 G1 Z12.471
N13307 G1 E.8 F1800
N13308 ; FEATURE: Internal solid infill
N13309 ; LINE_WIDTH: 0.420681
N13310 G1 F8473.54
N13311 M204 S8000
N13312 G1 X190.574 Y196.514 E.02675
N13313 G1 X190.574 Y195.985 E.01701
N13314 G1 X189.625 Y196.934 E.04316
N13315 G1 X189.096 Y196.934 E.01701
N13316 G1 X190.574 Y195.456 E.06722
N13317 G1 X190.574 Y194.927 E.01701
N13318 G1 X188.567 Y196.934 E.09127
N13319 G1 X188.039 Y196.934 E.01701
N13320 G1 X190.574 Y194.398 E.11532
N13321 G1 X190.574 Y193.87 E.01701
N13322 G1 X187.51 Y196.934 E.13938
N13323 G1 X186.981 Y196.934 E.01701
N13324 G1 X190.574 Y193.341 E.16343
N13325 G1 X190.574 Y192.812 E.01701
N13326 G1 X186.452 Y196.934 E.18748
N13327 G1 X185.923 Y196.934 E.01701
N13328 G1 X190.574 Y192.283 E.21154
N13329 G1 X190.574 Y191.754 E.01701
N13330 G1 X185.394 Y196.934 E.23559
N13331 G1 X184.866 Y196.934 E.01701
N13332 G1 X190.574 Y191.225 E.25965
N13333 G1 X190.574 Y190.696 E.01701
N13334 G1 X184.337 Y196.934 E.2837
N13335 G1 X183.808 Y196.934 E.01701
N13336 G1 X190.574 Y190.168 E.30775
N13337 G1 X190.574 Y189.639 E.01701
N13338 G1 X183.279 Y196.934 E.33181
N13339 G1 X182.75 Y196.934 E.01701
N13340 G1 X190.574 Y189.11 E.35586
N13341 G1 X190.574 Y188.581 E.01701
N13342 G1 X182.221 Y196.934 E.37992
N13343 G1 X181.692 Y196.934 E.01701
N13344 G1 X190.574 Y188.052 E.40397
N13345 G1 X190.574 Y187.523 E.01701
N13346 G1 X181.164 Y196.934 E.42802
N13347 G1 X180.635 Y196.934 E.01701
N13348 G1 X190.574 Y186.995 E.45208
N13349 G1 X190.574 Y186.466 E.01701
N13350 G1 X180.106 Y196.934 E.47613
N13351 G1 X179.577 Y196.934 E.01701
N13352 G1 X190.574 Y185.937 E.50019
N13353 G1 X190.574 Y185.408 E.01701
N13354 G1 X179.048 Y196.934 E.52424
N13355 G1 X178.519 Y196.934 E.01701
N13356 G1 X190.574 Y184.879 E.54829
N13357 G1 X190.574 Y184.35 E.01701
N13358 G1 X177.991 Y196.934 E.57235
N13359 G1 X177.462 Y196.934 E.01701
N13360 G1 X190.574 Y183.821 E.5964
N13361 G1 X190.574 Y183.293 E.01701
N13362 G1 X176.933 Y196.934 E.62045
N13363 G1 X176.404 Y196.934 E.01701
N13364 G1 X190.574 Y182.764 E.64451
N13365 G1 X190.574 Y182.235 E.01701
N13366 G1 X175.875 Y196.934 E.66856
N13367 G1 X175.346 Y196.934 E.01701
N13368 G1 X190.574 Y181.706 E.69262
N13369 G1 X190.574 Y181.177 E.01701
N13370 G1 X174.817 Y196.934 E.71667
N13371 G1 X174.289 Y196.934 E.01701
N13372 G1 X190.574 Y180.648 E.74072
N13373 G1 X190.574 Y180.12 E.01701
N13374 G1 X173.76 Y196.934 E.76478
N13375 G1 X173.231 Y196.934 E.01701
N13376 G1 X190.574 Y179.591 E.78883
N13377 G1 X190.574 Y179.062 E.01701
N13378 G1 X172.702 Y196.934 E.81289
N13379 G1 X172.173 Y196.934 E.01701
N13380 G1 X190.574 Y178.533 E.83694
N13381 G1 X190.574 Y178.004 E.01701
N13382 G1 X171.644 Y196.934 E.86099
N13383 G1 X171.116 Y196.934 E.01701
N13384 G1 X190.574 Y177.475 E.88505
N13385 G1 X190.574 Y176.946 E.01701
N13386 G1 X170.587 Y196.934 E.9091
N13387 G1 X170.058 Y196.934 E.01701
N13388 G1 X190.574 Y176.418 E.93315
N13389 G1 X190.574 Y175.889 E.01701
N13390 G1 X169.529 Y196.934 E.95721
N13391 G1 X169 Y196.934 E.01701
N13392 G1 X190.574 Y175.36 E.98126
N13393 G1 X190.574 Y174.831 E.01701
N13394 G1 X168.471 Y196.934 E1.00532
N13395 G1 X167.942 Y196.934 E.01701
N13396 G1 X190.574 Y174.302 E1.02937
N13397 G1 X190.574 Y173.773 E.01701
N13398 G1 X167.414 Y196.934 E1.05342
N13399 G1 X166.885 Y196.934 E.01701
N13400 G1 X190.574 Y173.245 E1.07748
N13401 G1 X190.574 Y172.716 E.01701
N13402 G1 X166.356 Y196.934 E1.10153
N13403 G1 X165.827 Y196.934 E.01701
N13404 G1 X190.574 Y172.187 E1.12559
N13405 G1 X190.574 Y171.658 E.01701
N13406 G1 X165.298 Y196.934 E1.14964
N13407 G1 X164.769 Y196.934 E.01701
N13408 G1 X190.574 Y171.129 E1.17369
N13409 G1 X190.574 Y170.6 E.01701
N13410 G1 X164.241 Y196.934 E1.19775
N13411 G1 X163.712 Y196.934 E.01701
N13412 G1 X190.574 Y170.071 E1.2218
N13413 G1 X190.574 Y169.543 E.01701
N13414 G1 X163.183 Y196.934 E1.24586
N13415 G1 X162.654 Y196.934 E.01701
N13416 G1 X190.574 Y169.014 E1.26991
N13417 G1 X190.574 Y168.485 E.01701
N13418 M73 P94 R2
N13419 G1 X162.125 Y196.934 E1.29396
N13420 G1 X161.596 Y196.934 E.01701
N13421 G1 X190.574 Y167.956 E1.31802
N13422 G1 X190.574 Y167.427 E.01701
N13423 G1 X161.068 Y196.934 E1.34207
N13424 G1 X160.539 Y196.934 E.01701
N13425 G1 X190.574 Y166.898 E1.36613
N13426 G1 X190.574 Y166.37 E.01701
N13427 G1 X160.01 Y196.934 E1.39018
N13428 G1 X159.481 Y196.934 E.01701
N13429 G1 X190.574 Y165.841 E1.41423
N13430 G1 X190.574 Y165.312 E.01701
N13431 G1 X159.044 Y196.842 E1.43413
N13432 G1 X159.044 Y196.314 E.01701
N13433 M73 P94 R1
N13434 G1 X190.574 Y164.783 E1.43413
N13435 G1 X190.574 Y164.254 E.01701
N13436 G1 X159.044 Y195.785 E1.43413
N13437 G1 X159.044 Y195.256 E.01701
N13438 G1 X190.574 Y163.725 E1.43413
N13439 G1 X190.574 Y163.197 E.01701
N13440 G1 X159.044 Y194.727 E1.43413
N13441 G1 X159.044 Y194.198 E.01701
N13442 G1 X190.574 Y162.668 E1.43413
N13443 G1 X190.574 Y162.139 E.01701
N13444 G1 X159.044 Y193.669 E1.43413
N13445 G1 X159.044 Y193.14 E.01701
N13446 G1 X190.574 Y161.61 E1.43413
N13447 G1 X190.574 Y161.081 E.01701
N13448 G1 X159.044 Y192.612 E1.43413
N13449 G1 X159.044 Y192.083 E.01701
N13450 G1 X190.574 Y160.552 E1.43413
N13451 G1 X190.574 Y160.023 E.01701
N13452 G1 X159.044 Y191.554 E1.43413
N13453 G1 X159.044 Y191.025 E.01701
N13454 G1 X190.574 Y159.495 E1.43413
N13455 G1 X190.574 Y158.966 E.01701
N13456 G1 X159.044 Y190.496 E1.43413
N13457 G1 X159.044 Y189.967 E.01701
N13458 G1 X190.574 Y158.437 E1.43413
N13459 G1 X190.574 Y157.908 E.01701
N13460 G1 X159.044 Y189.439 E1.43413
N13461 G1 X159.044 Y188.91 E.01701
N13462 G1 X190.574 Y157.379 E1.43413
N13463 G1 X190.574 Y156.85 E.01701
N13464 G1 X159.044 Y188.381 E1.43413
N13465 G1 X159.044 Y187.852 E.01701
N13466 G1 X190.574 Y156.322 E1.43413
N13467 G1 X190.574 Y155.793 E.01701
N13468 G1 X159.044 Y187.323 E1.43413
N13469 G1 X159.044 Y186.794 E.01701
N13470 G1 X190.574 Y155.264 E1.43413
N13471 G1 X190.574 Y154.735 E.01701
N13472 G1 X159.044 Y186.265 E1.43413
N13473 G1 X159.044 Y185.737 E.01701
N13474 G1 X190.574 Y154.206 E1.43413
N13475 G1 X190.574 Y153.677 E.01701
N13476 G1 X159.044 Y185.208 E1.43413
N13477 G1 X159.044 Y184.679 E.01701
N13478 G1 X190.574 Y153.148 E1.43413
N13479 G1 X190.574 Y152.62 E.01701
N13480 G1 X159.044 Y184.15 E1.43413
N13481 G1 X159.044 Y183.621 E.01701
N13482 G1 X190.574 Y152.091 E1.43413
N13483 G1 X190.574 Y151.562 E.01701
N13484 G1 X159.044 Y183.092 E1.43413
N13485 G1 X159.044 Y182.564 E.01701
N13486 G1 X190.574 Y151.033 E1.43413
N13487 G1 X190.574 Y150.504 E.01701
N13488 G1 X159.044 Y182.035 E1.43413
N13489 G1 X159.044 Y181.506 E.01701
N13490 G1 X190.574 Y149.975 E1.43413
N13491 G1 X190.574 Y149.447 E.01701
N13492 G1 X159.044 Y180.977 E1.43413
N13493 G1 X159.044 Y180.448 E.01701
N13494 G1 X190.574 Y148.918 E1.43413
N13495 G1 X190.574 Y148.389 E.01701
N13496 G1 X159.044 Y179.919 E1.43413
N13497 G1 X159.044 Y179.39 E.01701
N13498 G1 X190.574 Y147.86 E1.43413
N13499 G1 X190.574 Y147.331 E.01701
N13500 G1 X159.044 Y178.862 E1.43413
N13501 G1 X159.044 Y178.333 E.01701
N13502 G1 X190.574 Y146.802 E1.43413
N13503 G1 X190.574 Y146.273 E.01701
N13504 G1 X159.044 Y177.804 E1.43413
N13505 G1 X159.044 Y177.275 E.01701
N13506 G1 X190.574 Y145.745 E1.43413
N13507 G1 X190.574 Y145.216 E.01701
N13508 G1 X159.044 Y176.746 E1.43413
N13509 G1 X159.044 Y176.217 E.01701
N13510 G1 X190.574 Y144.687 E1.43413
N13511 G1 X190.574 Y144.158 E.01701
N13512 G1 X159.044 Y175.689 E1.43413
N13513 G1 X159.044 Y175.16 E.01701
N13514 G1 X190.574 Y143.629 E1.43413
N13515 G1 X190.574 Y143.1 E.01701
N13516 G1 X159.044 Y174.631 E1.43413
N13517 G1 X159.044 Y174.102 E.01701
N13518 G1 X190.574 Y142.572 E1.43413
N13519 G1 X190.574 Y142.043 E.01701
N13520 G1 X159.044 Y173.573 E1.43413
N13521 G1 X159.044 Y173.044 E.01701
N13522 G1 X190.574 Y141.514 E1.43413
N13523 G1 X190.574 Y140.985 E.01701
N13524 G1 X159.044 Y172.516 E1.43413
N13525 G1 X159.044 Y171.987 E.01701
N13526 G1 X190.574 Y140.456 E1.43413
N13527 G1 X190.574 Y139.927 E.01701
N13528 G1 X159.044 Y171.458 E1.43413
N13529 G1 X159.044 Y170.929 E.01701
N13530 G1 X190.574 Y139.398 E1.43413
N13531 G1 X190.574 Y138.87 E.01701
N13532 G1 X159.044 Y170.4 E1.43413
N13533 G1 X159.044 Y169.871 E.01701
N13534 G1 X190.574 Y138.341 E1.43413
N13535 G1 X190.574 Y137.812 E.01701
N13536 G1 X159.044 Y169.342 E1.43413
N13537 G1 X159.044 Y168.814 E.01701
N13538 M73 P95 R1
N13539 G1 X190.574 Y137.283 E1.43413
N13540 G1 X190.574 Y136.754 E.01701
N13541 G1 X159.044 Y168.285 E1.43413
N13542 G1 X159.044 Y167.756 E.01701
N13543 G1 X190.574 Y136.225 E1.43413
N13544 G1 X190.574 Y135.697 E.01701
N13545 G1 X159.044 Y167.227 E1.43413
N13546 G1 X159.044 Y166.698 E.01701
N13547 G1 X190.574 Y135.168 E1.43413
N13548 G1 X190.574 Y134.639 E.01701
N13549 G1 X159.044 Y166.169 E1.43413
N13550 G1 X159.044 Y165.641 E.01701
N13551 G1 X190.574 Y134.11 E1.43413
N13552 G1 X190.574 Y133.581 E.01701
N13553 G1 X159.044 Y165.112 E1.43413
N13554 G1 X159.044 Y164.583 E.01701
N13555 G1 X190.574 Y133.052 E1.43413
N13556 G1 X190.574 Y132.523 E.01701
N13557 G1 X159.044 Y164.054 E1.43413
N13558 G1 X159.044 Y163.525 E.01701
N13559 G1 X190.574 Y131.995 E1.43413
N13560 G1 X190.574 Y131.466 E.01701
N13561 G1 X159.044 Y162.996 E1.43413
N13562 G1 X159.044 Y162.467 E.01701
N13563 G1 X190.574 Y130.937 E1.43413
N13564 G1 X190.574 Y130.408 E.01701
N13565 G1 X159.044 Y161.939 E1.43413
N13566 G1 X159.044 Y161.41 E.01701
N13567 G1 X190.574 Y129.879 E1.43413
N13568 G1 X190.574 Y129.35 E.01701
N13569 G1 X159.044 Y160.881 E1.43413
N13570 G1 X159.044 Y160.352 E.01701
N13571 G1 X190.574 Y128.822 E1.43413
N13572 G1 X190.574 Y128.293 E.01701
N13573 G1 X159.044 Y159.823 E1.43413
N13574 G1 X159.044 Y159.294 E.01701
N13575 G1 X190.574 Y127.764 E1.43413
N13576 G1 X190.574 Y127.235 E.01701
N13577 G1 X159.044 Y158.766 E1.43413
N13578 G1 X159.044 Y158.237 E.01701
N13579 G1 X190.574 Y126.706 E1.43413
N13580 G1 X190.574 Y126.177 E.01701
N13581 G1 X159.044 Y157.708 E1.43413
N13582 G1 X159.044 Y157.179 E.01701
N13583 G1 X190.574 Y125.649 E1.43413
N13584 G1 X190.574 Y125.12 E.01701
N13585 G1 X159.044 Y156.65 E1.43413
N13586 G1 X159.044 Y156.121 E.01701
N13587 G1 X190.574 Y124.591 E1.43413
N13588 G1 X190.574 Y124.062 E.01701
N13589 G1 X159.044 Y155.592 E1.43413
N13590 G1 X159.044 Y155.064 E.01701
N13591 G1 X190.138 Y123.969 E1.41431
N13592 G1 X189.61 Y123.969 E.01701
N13593 G1 X159.044 Y154.535 E1.39026
N13594 G1 X159.044 Y154.006 E.01701
N13595 G1 X189.081 Y123.969 E1.3662
N13596 G1 X188.552 Y123.969 E.01701
N13597 G1 X159.044 Y153.477 E1.34215
N13598 G1 X159.044 Y152.948 E.01701
N13599 G1 X188.023 Y123.969 E1.3181
N13600 G1 X187.494 Y123.969 E.01701
N13601 G1 X159.044 Y152.419 E1.29404
N13602 G1 X159.044 Y151.891 E.01701
N13603 G1 X186.965 Y123.969 E1.26999
N13604 G1 X186.437 Y123.969 E.01701
N13605 G1 X159.044 Y151.362 E1.24593
N13606 G1 X159.044 Y150.833 E.01701
N13607 G1 X185.908 Y123.969 E1.22188
N13608 G1 X185.379 Y123.969 E.01701
N13609 G1 X159.044 Y150.304 E1.19783
N13610 G1 X159.044 Y149.775 E.01701
N13611 G1 X184.85 Y123.969 E1.17377
N13612 G1 X184.321 Y123.969 E.01701
N13613 G1 X159.044 Y149.246 E1.14972
N13614 G1 X159.044 Y148.717 E.01701
N13615 G1 X183.792 Y123.969 E1.12566
N13616 G1 X183.263 Y123.969 E.01701
N13617 G1 X159.044 Y148.189 E1.10161
N13618 G1 X159.044 Y147.66 E.01701
N13619 G1 X182.735 Y123.969 E1.07756
N13620 G1 X182.206 Y123.969 E.01701
N13621 G1 X159.044 Y147.131 E1.0535
N13622 G1 X159.044 Y146.602 E.01701
N13623 G1 X181.677 Y123.969 E1.02945
N13624 G1 X181.148 Y123.969 E.01701
N13625 G1 X159.044 Y146.073 E1.0054
N13626 G1 X159.044 Y145.544 E.01701
N13627 G1 X180.619 Y123.969 E.98134
N13628 G1 X180.09 Y123.969 E.01701
N13629 G1 X159.044 Y145.016 E.95729
N13630 G1 X159.044 Y144.487 E.01701
N13631 G1 X179.562 Y123.969 E.93323
N13632 G1 X179.033 Y123.969 E.01701
N13633 G1 X159.044 Y143.958 E.90918
N13634 G1 X159.044 Y143.429 E.01701
N13635 G1 X178.504 Y123.969 E.88513
N13636 G1 X177.975 Y123.969 E.01701
N13637 G1 X159.044 Y142.9 E.86107
N13638 G1 X159.044 Y142.371 E.01701
N13639 G1 X177.446 Y123.969 E.83702
N13640 G1 X176.917 Y123.969 E.01701
N13641 G1 X159.044 Y141.842 E.81296
N13642 G1 X159.044 Y141.314 E.01701
N13643 G1 X176.388 Y123.969 E.78891
N13644 G1 X175.86 Y123.969 E.01701
N13645 G1 X159.044 Y140.785 E.76486
N13646 G1 X159.044 Y140.256 E.01701
N13647 G1 X175.331 Y123.969 E.7408
N13648 G1 X174.802 Y123.969 E.01701
N13649 G1 X159.044 Y139.727 E.71675
N13650 G1 X159.044 Y139.198 E.01701
N13651 G1 X174.273 Y123.969 E.69269
N13652 G1 X173.744 Y123.969 E.01701
N13653 G1 X159.044 Y138.669 E.66864
N13654 G1 X159.044 Y138.141 E.01701
N13655 G1 X173.215 Y123.969 E.64459
N13656 G1 X172.687 Y123.969 E.01701
N13657 G1 X159.044 Y137.612 E.62053
N13658 G1 X159.044 Y137.083 E.01701
N13659 G1 X172.158 Y123.969 E.59648
N13660 G1 X171.629 Y123.969 E.01701
N13661 G1 X159.044 Y136.554 E.57243
N13662 G1 X159.044 Y136.025 E.01701
N13663 G1 X171.1 Y123.969 E.54837
N13664 G1 X170.571 Y123.969 E.01701
N13665 G1 X159.044 Y135.496 E.52432
N13666 G1 X159.044 Y134.968 E.01701
N13667 G1 X170.042 Y123.969 E.50026
N13668 G1 X169.513 Y123.969 E.01701
N13669 G1 X159.044 Y134.439 E.47621
N13670 G1 X159.044 Y133.91 E.01701
N13671 G1 X168.985 Y123.969 E.45216
N13672 G1 X168.456 Y123.969 E.01701
N13673 G1 X159.044 Y133.381 E.4281
N13674 G1 X159.044 Y132.852 E.01701
N13675 G1 X167.927 Y123.969 E.40405
N13676 G1 X167.398 Y123.969 E.01701
N13677 G1 X159.044 Y132.323 E.37999
N13678 G1 X159.044 Y131.794 E.01701
N13679 G1 X166.869 Y123.969 E.35594
N13680 G1 X166.34 Y123.969 E.01701
N13681 G1 X159.044 Y131.266 E.33189
N13682 G1 X159.044 Y130.737 E.01701
N13683 G1 X165.812 Y123.969 E.30783
N13684 G1 X165.283 Y123.969 E.01701
N13685 G1 X159.044 Y130.208 E.28378
N13686 G1 X159.044 Y129.679 E.01701
N13687 G1 X164.754 Y123.969 E.25972
N13688 G1 X164.225 Y123.969 E.01701
N13689 G1 X159.044 Y129.15 E.23567
N13690 G1 X159.044 Y128.621 E.01701
N13691 G1 X163.696 Y123.969 E.21162
N13692 G1 X163.167 Y123.969 E.01701
N13693 G1 X159.044 Y128.093 E.18756
N13694 G1 X159.044 Y127.564 E.01701
N13695 G1 X162.638 Y123.969 E.16351
N13696 G1 X162.11 Y123.969 E.01701
N13697 G1 X159.044 Y127.035 E.13946
N13698 G1 X159.044 Y126.506 E.01701
N13699 G1 X161.581 Y123.969 E.1154
N13700 G1 X161.052 Y123.969 E.01701
N13701 G1 X159.044 Y125.977 E.09135
N13702 G1 X159.044 Y125.448 E.01701
N13703 M73 P96 R1
N13704 G1 X160.523 Y123.969 E.06729
N13705 G1 X159.994 Y123.969 E.01701
N13706 G1 X159.044 Y124.919 E.04324
N13707 G1 X159.044 Y124.391 E.01701
N13708 G1 X159.633 Y123.801 E.02683
N13709 ; WIPE_START
N13710 G1 X159.044 Y124.391 E-.31695
N13711 G1 X159.044 Y124.919 E-.20096
N13712 G1 X159.494 Y124.469 E-.24209
N13713 ; WIPE_END
N13714 G1 E-.04 F1800
N13715 M204 S10000
N13716 G17
N13717 G3 Z12.871 I1.217 J0 P1  F60000
N13718 ; stop printing object, unique label id: 79
N13719 M625
N13720 ; object ids of layer 62 start: 79
N13721 M624 AQAAAAAAAAA=
N13722 ;======== H2D 20250213========
N13723 ; SKIPPABLE_START
N13724 ; SKIPTYPE: timelapse
N13725 M622.1 S1 ; for prev firware, default turned on
N13726 
N13727 M1002 judge_flag timelapse_record_flag
N13728 
N13729 M622 J1
N13730 M993 A2 B2 C2
N13731 M993 A0 B0 C0
N13732 
N13733 
N13734 M9712 E1 M0
N13735 M83
N13736 G1 Z12.871 F1200
N13737 M400
N13738 M9713
N13739 
N13740 
N13741 M9711 M0 E1 Z12.871 S11 C10 O0 T3000
N13742 
N13743 
N13744 M9712 E1 M0
N13745 G90
N13746 G1 Z15.471
N13747 G1 Y295 F30000
N13748 G1 Y265 F18000
N13749 M83
N13750 M9713
N13751 
N13752 M993 A3 B3 C3
N13753 
N13754 M623
N13755 ; SKIPPABLE_END
N13756 
N13757 ; object ids of this layer62 end: 79
N13758 M625
N13759 ; CHANGE_LAYER
N13760 ; Z_HEIGHT: 12.6888
N13761 ; LAYER_HEIGHT: 0.217756
N13762 ;======== H2D 20250521========
N13763 ; layer num/total_layer_count: 63/63
N13764 ; update layer progress
N13765 M73 L63
N13766 M991 S0 P62 ;notify layer change
N13767 
N13768 
N13769 ; OBJECT_ID: 79
N13770 ; COOLING_NODE: 0
N13771 ; start printing object, unique label id: 79
N13772 M624 AQAAAAAAAAA=
N13773 G1 X192.099 Y198.459 F60000
N13774 G1 Z12.689
N13775 G1 E.8 F1800
N13776 ; FEATURE: Outer wall
N13777 ; LINE_WIDTH: 0.42
N13778 G1 F8488.997
N13779 M204 S5000
N13780 G1 X157.519 Y198.459 E1.11013
N13781 G1 X157.519 Y122.444 E2.44032
N13782 G1 X192.099 Y122.444 E1.11013
N13783 G1 X192.099 Y198.399 E2.4384
N13784 G1 E-.8 F1800
N13785 M204 S10000
N13786 G1 X192.078 Y190.766 Z13.089 F60000
N13787 G1 X191.894 Y123.43 Z13.089
N13788 G1 Z12.689
N13789 G1 E.8 F1800
N13790 ; FEATURE: Top surface
N13791 G1 F8488.997
N13792 M204 S2000
N13793 G1 X191.113 Y122.649 E.03542
N13794 G1 X190.586 Y122.649 E.01695
N13795 G1 X191.894 Y123.957 E.05939
N13796 G1 X191.894 Y124.485 E.01695
N13797 G1 X190.058 Y122.649 E.08335
N13798 G1 X189.53 Y122.649 E.01695
N13799 G1 X191.894 Y125.013 E.10732
N13800 G1 X191.894 Y125.541 E.01695
N13801 G1 X189.002 Y122.649 E.13128
N13802 G1 X188.474 Y122.649 E.01695
N13803 G1 X191.894 Y126.069 E.15525
N13804 G1 X191.894 Y126.597 E.01695
N13805 G1 X187.946 Y122.649 E.17922
N13806 G1 X187.418 Y122.649 E.01695
N13807 G1 X191.894 Y127.125 E.20318
N13808 G1 X191.894 Y127.652 E.01695
N13809 G1 X186.89 Y122.649 E.22715
N13810 G1 X186.363 Y122.649 E.01695
N13811 G1 X191.894 Y128.18 E.25111
N13812 G1 X191.894 Y128.708 E.01695
N13813 G1 X185.835 Y122.649 E.27508
N13814 G1 X185.307 Y122.649 E.01695
N13815 G1 X191.894 Y129.236 E.29904
N13816 G1 X191.894 Y129.764 E.01695
N13817 G1 X184.779 Y122.649 E.32301
N13818 G1 X184.251 Y122.649 E.01695
N13819 G1 X191.894 Y130.292 E.34698
N13820 G1 X191.894 Y130.82 E.01695
N13821 G1 X183.723 Y122.649 E.37094
N13822 G1 X183.195 Y122.649 E.01695
N13823 G1 X191.894 Y131.348 E.39491
N13824 G1 X191.894 Y131.875 E.01695
N13825 G1 X182.667 Y122.649 E.41887
N13826 G1 X182.14 Y122.649 E.01695
N13827 G1 X191.894 Y132.403 E.44284
N13828 G1 X191.894 Y132.931 E.01695
N13829 G1 X181.612 Y122.649 E.46681
N13830 G1 X181.084 Y122.649 E.01695
N13831 G1 X191.894 Y133.459 E.49077
N13832 G1 X191.894 Y133.987 E.01695
N13833 G1 X180.556 Y122.649 E.51474
N13834 G1 X180.028 Y122.649 E.01695
N13835 G1 X191.894 Y134.515 E.5387
N13836 G1 X191.894 Y135.043 E.01695
N13837 G1 X179.5 Y122.649 E.56267
N13838 G1 X178.972 Y122.649 E.01695
N13839 G1 X191.894 Y135.57 E.58663
N13840 G1 X191.894 Y136.098 E.01695
N13841 G1 X178.445 Y122.649 E.6106
N13842 G1 X177.917 Y122.649 E.01695
N13843 G1 X191.894 Y136.626 E.63457
N13844 G1 X191.894 Y137.154 E.01695
N13845 G1 X177.389 Y122.649 E.65853
N13846 G1 X176.861 Y122.649 E.01695
N13847 G1 X191.894 Y137.682 E.6825
N13848 G1 X191.894 Y138.21 E.01695
N13849 G1 X176.333 Y122.649 E.70646
N13850 G1 X175.805 Y122.649 E.01695
N13851 G1 X191.894 Y138.738 E.73043
N13852 G1 X191.894 Y139.266 E.01695
N13853 G1 X175.277 Y122.649 E.75439
N13854 G1 X174.749 Y122.649 E.01695
N13855 G1 X191.894 Y139.793 E.77836
N13856 G1 X191.894 Y140.321 E.01695
N13857 G1 X174.222 Y122.649 E.80233
N13858 G1 X173.694 Y122.649 E.01695
N13859 G1 X191.894 Y140.849 E.82629
N13860 G1 X191.894 Y141.377 E.01695
N13861 G1 X173.166 Y122.649 E.85026
N13862 G1 X172.638 Y122.649 E.01695
N13863 G1 X191.894 Y141.905 E.87422
N13864 G1 X191.894 Y142.433 E.01695
N13865 G1 X172.11 Y122.649 E.89819
N13866 G1 X171.582 Y122.649 E.01695
N13867 G1 X191.894 Y142.961 E.92216
N13868 G1 X191.894 Y143.489 E.01695
N13869 G1 X171.054 Y122.649 E.94612
N13870 G1 X170.526 Y122.649 E.01695
N13871 G1 X191.894 Y144.016 E.97009
N13872 G1 X191.894 Y144.544 E.01695
N13873 G1 X169.999 Y122.649 E.99405
N13874 G1 X169.471 Y122.649 E.01695
N13875 G1 X191.894 Y145.072 E1.01802
N13876 G1 X191.894 Y145.6 E.01695
N13877 G1 X168.943 Y122.649 E1.04198
N13878 G1 X168.415 Y122.649 E.01695
N13879 G1 X191.894 Y146.128 E1.06595
N13880 G1 X191.894 Y146.656 E.01695
N13881 G1 X167.887 Y122.649 E1.08992
N13882 G1 X167.359 Y122.649 E.01695
N13883 G1 X191.894 Y147.184 E1.11388
N13884 G1 X191.894 Y147.711 E.01695
N13885 G1 X166.831 Y122.649 E1.13785
N13886 G1 X166.304 Y122.649 E.01695
N13887 G1 X191.894 Y148.239 E1.16181
N13888 G1 X191.894 Y148.767 E.01695
N13889 G1 X165.776 Y122.649 E1.18578
N13890 G1 X165.248 Y122.649 E.01695
N13891 G1 X191.894 Y149.295 E1.20974
N13892 G1 X191.894 Y149.823 E.01695
N13893 G1 X164.72 Y122.649 E1.23371
N13894 G1 X164.192 Y122.649 E.01695
N13895 G1 X191.894 Y150.351 E1.25768
N13896 G1 X191.894 Y150.879 E.01695
N13897 G1 X163.664 Y122.649 E1.28164
N13898 G1 X163.136 Y122.649 E.01695
N13899 G1 X191.894 Y151.407 E1.30561
N13900 G1 X191.894 Y151.934 E.01695
N13901 G1 X162.608 Y122.649 E1.32957
N13902 G1 X162.081 Y122.649 E.01695
N13903 G1 X191.894 Y152.462 E1.35354
N13904 G1 X191.894 Y152.99 E.01695
N13905 G1 X161.553 Y122.649 E1.37751
N13906 G1 X161.025 Y122.649 E.01695
N13907 G1 X191.894 Y153.518 E1.40147
N13908 G1 X191.894 Y154.046 E.01695
N13909 G1 X160.497 Y122.649 E1.42544
N13910 G1 X159.969 Y122.649 E.01695
N13911 G1 X191.894 Y154.574 E1.4494
N13912 G1 X191.894 Y155.102 E.01695
N13913 G1 X159.441 Y122.649 E1.47337
N13914 G1 X158.913 Y122.649 E.01695
N13915 G1 X191.894 Y155.63 E1.49733
N13916 G1 X191.894 Y156.157 E.01695
N13917 G1 X158.385 Y122.649 E1.5213
N13918 G1 X157.858 Y122.649 E.01695
N13919 G1 X191.894 Y156.685 E1.54527
N13920 G1 X191.894 Y157.213 E.01695
N13921 G1 X157.724 Y123.044 E1.55133
N13922 G1 X157.724 Y123.572 E.01695
N13923 G1 X191.894 Y157.741 E1.55133
N13924 G1 X191.894 Y158.269 E.01695
N13925 M73 P97 R1
N13926 G1 X157.724 Y124.099 E1.55133
N13927 G1 X157.724 Y124.627 E.01695
N13928 G1 X191.894 Y158.797 E1.55133
N13929 G1 X191.894 Y159.325 E.01695
N13930 G1 X157.724 Y125.155 E1.55133
N13931 G1 X157.724 Y125.683 E.01695
N13932 M73 P97 R0
N13933 G1 X191.894 Y159.852 E1.55133
N13934 G1 X191.894 Y160.38 E.01695
N13935 G1 X157.724 Y126.211 E1.55133
N13936 G1 X157.724 Y126.739 E.01695
N13937 G1 X191.894 Y160.908 E1.55133
N13938 G1 X191.894 Y161.436 E.01695
N13939 G1 X157.724 Y127.267 E1.55133
N13940 G1 X157.724 Y127.795 E.01695
N13941 G1 X191.894 Y161.964 E1.55133
N13942 G1 X191.894 Y162.492 E.01695
N13943 G1 X157.724 Y128.322 E1.55133
N13944 G1 X157.724 Y128.85 E.01695
N13945 G1 X191.894 Y163.02 E1.55133
N13946 G1 X191.894 Y163.548 E.01695
N13947 G1 X157.724 Y129.378 E1.55133
N13948 G1 X157.724 Y129.906 E.01695
N13949 G1 X191.894 Y164.075 E1.55133
N13950 G1 X191.894 Y164.603 E.01695
N13951 G1 X157.724 Y130.434 E1.55133
N13952 G1 X157.724 Y130.962 E.01695
N13953 G1 X191.894 Y165.131 E1.55133
N13954 G1 X191.894 Y165.659 E.01695
N13955 G1 X157.724 Y131.49 E1.55133
N13956 G1 X157.724 Y132.017 E.01695
N13957 G1 X191.894 Y166.187 E1.55133
N13958 G1 X191.894 Y166.715 E.01695
N13959 G1 X157.724 Y132.545 E1.55133
N13960 G1 X157.724 Y133.073 E.01695
N13961 G1 X191.894 Y167.243 E1.55133
N13962 G1 X191.894 Y167.771 E.01695
N13963 G1 X157.724 Y133.601 E1.55133
N13964 G1 X157.724 Y134.129 E.01695
N13965 G1 X191.894 Y168.298 E1.55133
N13966 G1 X191.894 Y168.826 E.01695
N13967 G1 X157.724 Y134.657 E1.55133
N13968 G1 X157.724 Y135.185 E.01695
N13969 G1 X191.894 Y169.354 E1.55133
N13970 G1 X191.894 Y169.882 E.01695
N13971 G1 X157.724 Y135.713 E1.55133
N13972 G1 X157.724 Y136.24 E.01695
N13973 G1 X191.894 Y170.41 E1.55133
N13974 G1 X191.894 Y170.938 E.01695
N13975 G1 X157.724 Y136.768 E1.55133
N13976 G1 X157.724 Y137.296 E.01695
N13977 G1 X191.894 Y171.466 E1.55133
N13978 G1 X191.894 Y171.993 E.01695
N13979 G1 X157.724 Y137.824 E1.55133
N13980 G1 X157.724 Y138.352 E.01695
N13981 G1 X191.894 Y172.521 E1.55133
N13982 G1 X191.894 Y173.049 E.01695
N13983 G1 X157.724 Y138.88 E1.55133
N13984 G1 X157.724 Y139.408 E.01695
N13985 G1 X191.894 Y173.577 E1.55133
N13986 G1 X191.894 Y174.105 E.01695
N13987 G1 X157.724 Y139.936 E1.55133
N13988 G1 X157.724 Y140.463 E.01695
N13989 G1 X191.894 Y174.633 E1.55133
N13990 G1 X191.894 Y175.161 E.01695
N13991 G1 X157.724 Y140.991 E1.55133
N13992 G1 X157.724 Y141.519 E.01695
N13993 G1 X191.894 Y175.689 E1.55133
N13994 G1 X191.894 Y176.216 E.01695
N13995 G1 X157.724 Y142.047 E1.55133
N13996 G1 X157.724 Y142.575 E.01695
N13997 G1 X191.894 Y176.744 E1.55133
N13998 G1 X191.894 Y177.272 E.01695
N13999 G1 X157.724 Y143.103 E1.55133
N14000 G1 X157.724 Y143.631 E.01695
N14001 G1 X191.894 Y177.8 E1.55133
N14002 G1 X191.894 Y178.328 E.01695
N14003 G1 X157.724 Y144.158 E1.55133
N14004 G1 X157.724 Y144.686 E.01695
N14005 G1 X191.894 Y178.856 E1.55133
N14006 G1 X191.894 Y179.384 E.01695
N14007 G1 X157.724 Y145.214 E1.55133
N14008 G1 X157.724 Y145.742 E.01695
N14009 G1 X191.894 Y179.912 E1.55133
N14010 G1 X191.894 Y180.439 E.01695
N14011 G1 X157.724 Y146.27 E1.55133
N14012 G1 X157.724 Y146.798 E.01695
N14013 G1 X191.894 Y180.967 E1.55133
N14014 G1 X191.894 Y181.495 E.01695
N14015 G1 X157.724 Y147.326 E1.55133
N14016 G1 X157.724 Y147.854 E.01695
N14017 G1 X191.894 Y182.023 E1.55133
N14018 G1 X191.894 Y182.551 E.01695
N14019 G1 X157.724 Y148.381 E1.55133
N14020 G1 X157.724 Y148.909 E.01695
N14021 G1 X191.894 Y183.079 E1.55133
N14022 G1 X191.894 Y183.607 E.01695
N14023 M73 P98 R0
N14024 G1 X157.724 Y149.437 E1.55133
N14025 G1 X157.724 Y149.965 E.01695
N14026 G1 X191.894 Y184.134 E1.55133
N14027 G1 X191.894 Y184.662 E.01695
N14028 G1 X157.724 Y150.493 E1.55133
N14029 G1 X157.724 Y151.021 E.01695
N14030 G1 X191.894 Y185.19 E1.55133
N14031 G1 X191.894 Y185.718 E.01695
N14032 G1 X157.724 Y151.549 E1.55133
N14033 G1 X157.724 Y152.077 E.01695
N14034 G1 X191.894 Y186.246 E1.55133
N14035 G1 X191.894 Y186.774 E.01695
N14036 G1 X157.724 Y152.604 E1.55133
N14037 G1 X157.724 Y153.132 E.01695
N14038 G1 X191.894 Y187.302 E1.55133
N14039 G1 X191.894 Y187.83 E.01695
N14040 G1 X157.724 Y153.66 E1.55133
N14041 G1 X157.724 Y154.188 E.01695
N14042 G1 X191.894 Y188.357 E1.55133
N14043 G1 X191.894 Y188.885 E.01695
N14044 G1 X157.724 Y154.716 E1.55133
N14045 G1 X157.724 Y155.244 E.01695
N14046 G1 X191.894 Y189.413 E1.55133
N14047 G1 X191.894 Y189.941 E.01695
N14048 G1 X157.724 Y155.772 E1.55133
N14049 G1 X157.724 Y156.299 E.01695
N14050 G1 X191.894 Y190.469 E1.55133
N14051 G1 X191.894 Y190.997 E.01695
N14052 G1 X157.724 Y156.827 E1.55133
N14053 G1 X157.724 Y157.355 E.01695
N14054 G1 X191.894 Y191.525 E1.55133
N14055 G1 X191.894 Y192.053 E.01695
N14056 G1 X157.724 Y157.883 E1.55133
N14057 G1 X157.724 Y158.411 E.01695
N14058 G1 X191.894 Y192.58 E1.55133
N14059 G1 X191.894 Y193.108 E.01695
N14060 G1 X157.724 Y158.939 E1.55133
N14061 G1 X157.724 Y159.467 E.01695
N14062 G1 X191.894 Y193.636 E1.55133
N14063 G1 X191.894 Y194.164 E.01695
N14064 G1 X157.724 Y159.995 E1.55133
N14065 G1 X157.724 Y160.522 E.01695
N14066 G1 X191.894 Y194.692 E1.55133
N14067 G1 X191.894 Y195.22 E.01695
N14068 G1 X157.724 Y161.05 E1.55133
N14069 G1 X157.724 Y161.578 E.01695
N14070 G1 X191.894 Y195.748 E1.55133
N14071 G1 X191.894 Y196.275 E.01695
N14072 G1 X157.724 Y162.106 E1.55133
N14073 G1 X157.724 Y162.634 E.01695
N14074 G1 X191.894 Y196.803 E1.55133
N14075 G1 X191.894 Y197.331 E.01695
N14076 G1 X157.724 Y163.162 E1.55133
N14077 G1 X157.724 Y163.69 E.01695
N14078 G1 X191.894 Y197.859 E1.55133
N14079 G1 X191.76 Y198.253 E.01336
N14080 G1 X157.724 Y164.217 E1.54526
N14081 G1 X157.724 Y164.745 E.01695
N14082 G1 X191.232 Y198.253 E1.52129
N14083 G1 X190.704 Y198.253 E.01695
N14084 G1 X157.724 Y165.273 E1.49733
N14085 G1 X157.724 Y165.801 E.01695
N14086 G1 X190.176 Y198.253 E1.47336
N14087 G1 X189.648 Y198.253 E.01695
N14088 G1 X157.724 Y166.329 E1.4494
N14089 G1 X157.724 Y166.857 E.01695
N14090 G1 X189.121 Y198.253 E1.42543
N14091 G1 X188.593 Y198.253 E.01695
N14092 G1 X157.724 Y167.385 E1.40146
N14093 G1 X157.724 Y167.913 E.01695
N14094 G1 X188.065 Y198.253 E1.3775
N14095 G1 X187.537 Y198.253 E.01695
N14096 G1 X157.724 Y168.44 E1.35353
N14097 G1 X157.724 Y168.968 E.01695
N14098 G1 X187.009 Y198.253 E1.32957
N14099 G1 X186.481 Y198.253 E.01695
N14100 G1 X157.724 Y169.496 E1.3056
N14101 G1 X157.724 Y170.024 E.01695
N14102 G1 X185.953 Y198.253 E1.28164
N14103 G1 X185.425 Y198.253 E.01695
N14104 G1 X157.724 Y170.552 E1.25767
N14105 G1 X157.724 Y171.08 E.01695
N14106 G1 X184.898 Y198.253 E1.2337
N14107 G1 X184.37 Y198.253 E.01695
N14108 G1 X157.724 Y171.608 E1.20974
N14109 G1 X157.724 Y172.136 E.01695
N14110 G1 X183.842 Y198.253 E1.18577
N14111 G1 X183.314 Y198.253 E.01695
N14112 G1 X157.724 Y172.663 E1.16181
N14113 G1 X157.724 Y173.191 E.01695
N14114 G1 X182.786 Y198.253 E1.13784
N14115 G1 X182.258 Y198.253 E.01695
N14116 G1 X157.724 Y173.719 E1.11388
N14117 G1 X157.724 Y174.247 E.01695
N14118 G1 X181.73 Y198.253 E1.08991
N14119 G1 X181.203 Y198.253 E.01695
N14120 G1 X157.724 Y174.775 E1.06594
N14121 G1 X157.724 Y175.303 E.01695
N14122 M73 P99 R0
N14123 G1 X180.675 Y198.253 E1.04198
N14124 G1 X180.147 Y198.253 E.01695
N14125 G1 X157.724 Y175.831 E1.01801
N14126 G1 X157.724 Y176.358 E.01695
N14127 G1 X179.619 Y198.253 E.99405
N14128 G1 X179.091 Y198.253 E.01695
N14129 G1 X157.724 Y176.886 E.97008
N14130 G1 X157.724 Y177.414 E.01695
N14131 G1 X178.563 Y198.253 E.94611
N14132 G1 X178.035 Y198.253 E.01695
N14133 G1 X157.724 Y177.942 E.92215
N14134 G1 X157.724 Y178.47 E.01695
N14135 G1 X177.507 Y198.253 E.89818
N14136 G1 X176.98 Y198.253 E.01695
N14137 G1 X157.724 Y178.998 E.87422
N14138 G1 X157.724 Y179.526 E.01695
N14139 G1 X176.452 Y198.253 E.85025
N14140 G1 X175.924 Y198.253 E.01695
N14141 G1 X157.724 Y180.054 E.82629
N14142 G1 X157.724 Y180.581 E.01695
N14143 G1 X175.396 Y198.253 E.80232
N14144 G1 X174.868 Y198.253 E.01695
N14145 G1 X157.724 Y181.109 E.77835
N14146 G1 X157.724 Y181.637 E.01695
N14147 G1 X174.34 Y198.253 E.75439
N14148 G1 X173.812 Y198.253 E.01695
N14149 G1 X157.724 Y182.165 E.73042
N14150 G1 X157.724 Y182.693 E.01695
N14151 G1 X173.284 Y198.253 E.70646
N14152 G1 X172.757 Y198.253 E.01695
N14153 G1 X157.724 Y183.221 E.68249
N14154 G1 X157.724 Y183.749 E.01695
N14155 G1 X172.229 Y198.253 E.65853
N14156 G1 X171.701 Y198.253 E.01695
N14157 G1 X157.724 Y184.277 E.63456
N14158 G1 X157.724 Y184.804 E.01695
N14159 G1 X171.173 Y198.253 E.61059
N14160 G1 X170.645 Y198.253 E.01695
N14161 G1 X157.724 Y185.332 E.58663
N14162 G1 X157.724 Y185.86 E.01695
N14163 G1 X170.117 Y198.253 E.56266
N14164 G1 X169.589 Y198.253 E.01695
N14165 G1 X157.724 Y186.388 E.5387
N14166 G1 X157.724 Y186.916 E.01695
N14167 G1 X169.062 Y198.253 E.51473
N14168 G1 X168.534 Y198.253 E.01695
N14169 G1 X157.724 Y187.444 E.49076
N14170 G1 X157.724 Y187.972 E.01695
N14171 G1 X168.006 Y198.253 E.4668
N14172 G1 X167.478 Y198.253 E.01695
N14173 G1 X157.724 Y188.499 E.44283
N14174 G1 X157.724 Y189.027 E.01695
N14175 G1 X166.95 Y198.253 E.41887
N14176 G1 X166.422 Y198.253 E.01695
N14177 G1 X157.724 Y189.555 E.3949
N14178 G1 X157.724 Y190.083 E.01695
N14179 G1 X165.894 Y198.253 E.37094
N14180 G1 X165.366 Y198.253 E.01695
N14181 G1 X157.724 Y190.611 E.34697
N14182 G1 X157.724 Y191.139 E.01695
N14183 G1 X164.839 Y198.253 E.323
N14184 G1 X164.311 Y198.253 E.01695
N14185 G1 X157.724 Y191.667 E.29904
N14186 G1 X157.724 Y192.195 E.01695
N14187 G1 X163.783 Y198.253 E.27507
N14188 G1 X163.255 Y198.253 E.01695
N14189 G1 X157.724 Y192.722 E.25111
N14190 G1 X157.724 Y193.25 E.01695
N14191 G1 X162.727 Y198.253 E.22714
N14192 G1 X162.199 Y198.253 E.01695
N14193 G1 X157.724 Y193.778 E.20318
N14194 G1 X157.724 Y194.306 E.01695
N14195 G1 X161.671 Y198.253 E.17921
N14196 G1 X161.143 Y198.253 E.01695
N14197 G1 X157.724 Y194.834 E.15524
N14198 G1 X157.724 Y195.362 E.01695
N14199 G1 X160.616 Y198.253 E.13128
N14200 G1 X160.088 Y198.253 E.01695
N14201 G1 X157.724 Y195.89 E.10731
N14202 G1 X157.724 Y196.418 E.01695
N14203 G1 X159.56 Y198.253 E.08335
N14204 G1 X159.032 Y198.253 E.01695
N14205 G1 X157.724 Y196.945 E.05938
N14206 G1 X157.724 Y197.473 E.01695
N14207 G1 X158.504 Y198.253 E.03541
N14208 ; WIPE_START
N14209 M204 S8000
N14210 G1 X157.724 Y197.473 E-.41919
N14211 G1 X157.724 Y196.945 E-.20059
N14212 G1 X157.985 Y197.206 E-.14022
N14213 ; WIPE_END
N14214 G1 E-.04 F1800
N14215 M204 S10000
N14216 G17
N14217 G3 Z13.089 I1.217 J0 P1  F60000
N14218 ; stop printing object, unique label id: 79
N14219 M625
N14220 ; object ids of layer 63 start: 79
N14221 M624 AQAAAAAAAAA=
N14222 ;======== H2D 20250213========
N14223 ; SKIPPABLE_START
N14224 ; SKIPTYPE: timelapse
N14225 M622.1 S1 ; for prev firware, default turned on
N14226 
N14227 M1002 judge_flag timelapse_record_flag
N14228 
N14229 M622 J1
N14230 M993 A2 B2 C2
N14231 M993 A0 B0 C0
N14232 
N14233 
N14234 M9712 E1 M0
N14235 M83
N14236 G1 Z13.0888 F1200
N14237 M400
N14238 M9713
N14239 
N14240 
N14241 M9711 M0 E1 Z13.0888 S11 C10 O0 T3000
N14242 
N14243 
N14244 M9712 E1 M0
N14245 G90
N14246 G1 Z15.6888
N14247 G1 Y295 F30000
N14248 G1 Y265 F18000
N14249 M83
N14250 M9713
N14251 
N14252 M993 A3 B3 C3
N14253 
N14254 M623
N14255 ; SKIPPABLE_END
N14256 
N14257 ; object ids of this layer63 end: 79
N14258 M625
N14259 ; close powerlost recovery
N14260 M1003 S0
N14261 M106 S0
N14262 M106 P2 S0
N14263 M981 S0 P20000 ; close spaghetti detector
N14264 ; FEATURE: Custom
N14265 ; MACHINE_END_GCODE_START
N14266 ; filament end gcode 
N14267 ;===== date: 2024/12/19 =====================
N14268 ;===== H2D =====================
N14269 G392 S0 ;turn off nozzle clog detect
N14270 M993 A0 B0 C0 ; nozzle cam detection not allowed.
N14271 
N14272 
N14273 M400 ; wait for buffer to clear
N14274 G92 E0 ; zero the extruder
N14275 G1 E-0.8 F1800 ; retract
N14276 G1 Z13.1888 F900 ; lower z a little
N14277 
N14278 G90
N14279 G150.3
N14280 
N14281 
N14282 
N14283 M141 S0 ; turn off chamber heating
N14284 M140 S0 ; turn off bed
N14285 M106 S0 ; turn off fan
N14286 M106 P2 S0 ; turn off remote part cooling fan
N14287 M106 P3 S0 ; turn off chamber cooling fan
N14288 
N14289 ; pull back filament to AMS
N14290 M620 S65535
N14291 T65535
N14292 G150.2
N14293 M621 S65535
N14294 
N14295 M620 S65279
N14296 T65279
N14297 G150.2
N14298 M621 S65279
N14299 
N14300 G150.3
N14301 
N14302 M104 S0 T0; turn off hotend
N14303 M104 S0 T1; turn off hotend
N14304 
N14305 M400 ; wait all motion done
N14306 M17 S
N14307 M17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom
N14308 
N14309     G1 Z112.689 F600
N14310     G1 Z110.689
N14311 
N14312 M400 P100
N14313 M17 R ; restore z current
N14314 
N14315 M220 S100  ; Reset feedrate magnitude
N14316 M201.2 K1.0 ; Reset acc magnitude
N14317 M73.2   R1.0 ;Reset left time magnitude
N14318 M1002 set_gcode_claim_speed_level : 0
N14319 
N14320 M1015.4 S0 K0 ;disable air printing detect
N14321 ;=====printer finish  sound=========
N14322 M17
N14323 M400 S1
N14324 M1006 S1
N14325 M1006 A53 B10 L99 C53 D10 M99 E53 F10 N99 
N14326 M1006 A57 B10 L99 C57 D10 M99 E57 F10 N99 
N14327 M1006 A0 B15 L0 C0 D15 M0 E0 F15 N0 
N14328 M1006 A53 B10 L99 C53 D10 M99 E53 F10 N99 
N14329 M1006 A57 B10 L99 C57 D10 M99 E57 F10 N99 
N14330 M1006 A0 B15 L0 C0 D15 M0 E0 F15 N0 
N14331 M1006 A48 B10 L99 C48 D10 M99 E48 F10 N99 
N14332 M1006 A0 B15 L0 C0 D15 M0 E0 F15 N0 
N14333 M1006 A60 B10 L99 C60 D10 M99 E60 F10 N99 
N14334 M1006 W
N14335 ;=====printer finish  sound=========
N14336 M400
N14337 M18
N14338 
N14339 M73 P100 R0
N14340 ; EXECUTABLE_BLOCK_END
N14341 
