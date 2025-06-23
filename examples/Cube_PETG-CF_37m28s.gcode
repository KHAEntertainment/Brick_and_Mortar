N1 ; HEADER_BLOCK_START
N2 ; BambuStudio 02.01.00.59
N3 ; model printing time: 27m 49s; total estimated time: 37m 28s
N4 ; total layer number: 63
N5 ; total filament length [mm] : 5030.97,119.74
N6 ; total filament volume [cm^3] : 12100.91,288.00
N7 ; total filament weight [g] : 15.13,0.36
N8 ; model label id: 130,138
N9 ; filament_density: 1.25,1.26,1.26,1.28,1.27
N10 ; filament_diameter: 1.75,1.75,1.75,1.75,1.75
N11 ; max_z_height: 12.60
N12 ; filament: 1,3
N13 ; HEADER_BLOCK_END
N14 
N15 ; CONFIG_BLOCK_START
N16 ; accel_to_decel_enable = 0
N17 ; accel_to_decel_factor = 50%
N18 ; activate_air_filtration = 0,0,0,0,0
N19 ; additional_cooling_fan_speed = 0,100,100,0,100
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
N39 ; chamber_temperatures = 0,0,0,0,0
N40 ; change_filament_gcode = ;======== H2D ========\n;===== 20250604 =====\nM993 A2 B2 C2 ; nozzle cam detection allow status save.\nM993 A0 B0 C0 ; nozzle cam detection not allowed.\n\n{if (filament_type[next_extruder] == "PLA") ||  (filament_type[next_extruder] == "PETG")\n ||  (filament_type[next_extruder] == "PLA-CF")  ||  (filament_type[next_extruder] == "PETG-CF")}\nM1015.4 S1 K0 ;disable E air printing detect\n{else}\nM1015.4 S0 ; disable E air printing detect\n{endif}\n\nM620 S[next_extruder]A\nM1002 gcode_claim_action : 4\nM204 S9000\n\nG1 Z{max_layer_z + 3.0} F1200\n\nM400\nM106 P1 S0\nM106 P2 S0\n\n{if toolchange_count == 2}\n; get travel path for change filament\n;M620.1 X[travel_point_1_x] Y[travel_point_1_y] F21000 P0\n;M620.1 X[travel_point_2_x] Y[travel_point_2_y] F21000 P1\n;M620.1 X[travel_point_3_x] Y[travel_point_3_y] F21000 P2\n{endif}\n\n{if ((filament_type[current_extruder] == "PLA") || (filament_type[current_extruder] == "PLA-CF") || (filament_type[current_extruder] == "PETG")) && (nozzle_diameter[current_extruder] == 0.2)}\nM620.10 A0 F74.8347 L[flush_length] H{nozzle_diameter[current_extruder]} T{nozzle_temperature_range_high[current_extruder]} P{nozzle_temperature[current_extruder]} S1\n{else}\nM620.10 A0 F{filament_max_volumetric_speed[current_extruder]/2.4053*60} L[flush_length] H{nozzle_diameter[current_extruder]} T{nozzle_temperature_range_high[current_extruder]} P{nozzle_temperature[current_extruder]} S1\n{endif}\n\n{if ((filament_type[next_extruder] == "PLA") || (filament_type[next_extruder] == "PLA-CF") || (filament_type[next_extruder] == "PETG")) && (nozzle_diameter[next_extruder] == 0.2)}\nM620.10 A1 F74.8347 L[flush_length] H{nozzle_diameter[next_extruder]} T{nozzle_temperature_range_high[next_extruder]} P{nozzle_temperature[next_extruder]} S1\n{else}\nM620.10 A1 F{filament_max_volumetric_speed[next_extruder]/2.4053*60} L[flush_length] H{nozzle_diameter[next_extruder]} T{nozzle_temperature_range_high[next_extruder]} P{nozzle_temperature[next_extruder]} S1\n{endif}\n\n{if long_retraction_when_cut}\nM620.11 P1 I[current_extruder] E-{retraction_distance_when_cut} F{max((filament_max_volumetric_speed[current_extruder]/2.4053*60), 200)}\n{else}\nM620.11 P0 I[current_extruder] E0\n{endif}\n\n{if long_retraction_when_ec}\nM620.11 K1 I[current_extruder] R{retraction_distance_when_ec} F{max((filament_max_volumetric_speed[current_extruder]/2.4053*60), 200)}\n{else}\nM620.11 K0 I[current_extruder] R0\n{endif}\n\nM628 S1\n{if filament_type[current_extruder] == "TPU"}\nM620.11 S0 L0 I[current_extruder] E-{retraction_distances_when_cut[current_extruder]} F{max((filament_max_volumetric_speed[current_extruder]/2.4053*60), 200)}\n{else}\n{if (filament_type[current_extruder] == "PA") || (filament_type[current_extruder] == "PA-GF")}\nM620.11 S1 L0 I[current_extruder] R4 D2 E-{retraction_distances_when_cut[current_extruder]} F{max((filament_max_volumetric_speed[current_extruder]/2.4053*60), 200)}\n{else}\nM620.11 S1 L0 I[current_extruder] R10 D8 E-{retraction_distances_when_cut[current_extruder]} F{max((filament_max_volumetric_speed[current_extruder]/2.4053*60), 200)}\n{endif}\n{endif}\nM629\n\n{if filament_type[current_extruder] == "TPU" || filament_type[next_extruder] == "TPU"}\nM620.11 H2 C331\n{else}\nM620.11 H0\n{endif}\n\nT[next_extruder]\n\n;deretract\n{if filament_type[next_extruder] == "TPU"}\n{else}\n{if (filament_type[next_extruder] == "PA") || (filament_type[next_extruder] == "PA-GF")}\n;VG1 E1 F{max(new_filament_e_feedrate, 200)}\n;VG1 E1 F{max(new_filament_e_feedrate/2, 100)}\n{else}\n;VG1 E4 F{max(new_filament_e_feedrate, 200)}\n;VG1 E4 F{max(new_filament_e_feedrate/2, 100)}\n{endif}\n{endif}\n\n; VFLUSH_START\n\n{if flush_length>41.5}\n;VG1 E41.5 F{min(old_filament_e_feedrate,new_filament_e_feedrate)}\n;VG1 E{flush_length-41.5} F{new_filament_e_feedrate}\n{else}\n;VG1 E{flush_length} F{min(old_filament_e_feedrate,new_filament_e_feedrate)}\n{endif}\n\nSYNC T{ceil(flush_length / 125) * 5}\n\n; VFLUSH_END\n\nM1002 set_filament_type:{filament_type[next_extruder]}\n\nM400\nM83\n{if next_extruder < 255}\n\n\nM628 S0\n;VM109 S[new_filament_temp]\nM629\nM400\n\nM983.3 F{filament_max_volumetric_speed[next_extruder]/2.4} A0.4\n\n\nM400\n{if wipe_avoid_perimeter}\nG1 Y320 F30000\nG1 X{wipe_avoid_pos_x} F30000\n{endif}\nG1 Y295 F30000\nG1 Y265 F18000\nG1 Z{max_layer_z + 3.0} F3000\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\nM621 S[next_extruder]A\n\nM993 A3 B3 C3 ; nozzle cam detection allow status restore.\n\n{if (filament_type[next_extruder]  == "TPU")}\nM1015.3 S1;enable tpu clog detect\n{else}\nM1015.3 S0;disable tpu clog detect\n{endif}\n\n{if (filament_type[next_extruder] == "PLA") ||  (filament_type[next_extruder] == "PETG")\n ||  (filament_type[next_extruder] == "PLA-CF")  ||  (filament_type[next_extruder] == "PETG-CF")}\nM1015.4 S1 K1 H[nozzle_diameter] ;enable E air printing detect\n{else}\nM1015.4 S0 ; disable E air printing detect\n{endif}\n\nM620.6 I[next_extruder] W1 ;enable ams air printing detect\nM1002 gcode_claim_action : 0\n
N41 ; circle_compensation_manual_offset = 0
N42 ; circle_compensation_speed = 200,200,200,200,200
N43 ; close_fan_the_first_x_layers = 3,1,1,3,1
N44 ; complete_print_exhaust_fan_speed = 70,70,70,70,80
N45 ; cool_plate_temp = 0,30,30,0,60
N46 ; cool_plate_temp_initial_layer = 0,30,30,0,60
N47 ; counter_coef_1 = 0,0,0,0,0
N48 ; counter_coef_2 = 0.008,0.008,0.008,0.007,0.025
N49 ; counter_coef_3 = -0.041,-0.041,-0.041,0.003,-0.11
N50 ; counter_limit_max = 0.033,0.033,0.033,0.1,0.05
N51 ; counter_limit_min = -0.035,-0.035,-0.035,-0.035,-0.04
N52 ; curr_bed_type = Textured PEI Plate
N53 ; default_acceleration = 8000,8000
N54 ; default_filament_colour = ;;;;
N55 ; default_filament_profile = "Bambu PLA Basic @BBL H2D"
N56 ; default_jerk = 0
N57 ; default_nozzle_volume_type = Standard,Standard
N58 ; default_print_profile = 0.20mm Standard @BBL H2D
N59 ; deretraction_speed = 30,30
N60 ; detect_floating_vertical_shell = 1
N61 ; detect_narrow_internal_solid_infill = 1
N62 ; detect_overhang_wall = 1
N63 ; detect_thin_wall = 0
N64 ; diameter_limit = 50,50,50,50,50
N65 ; different_settings_to_system = enable_arc_fitting;gcode_add_line_number;post_process;process_notes;reduce_crossing_wall;skirt_loops;sparse_infill_pattern;support_filament;wall_loops;;;;;;
N66 ; draft_shield = disabled
N67 ; during_print_exhaust_fan_speed = 70,70,70,70,60
N68 ; elefant_foot_compensation = 0.15
N69 ; enable_arc_fitting = 0
N70 ; enable_circle_compensation = 0
N71 ; enable_long_retraction_when_cut = 2
N72 ; enable_overhang_bridge_fan = 1,1,1,1,1
N73 ; enable_overhang_speed = 1,1
N74 ; enable_pre_heating = 1
N75 ; enable_pressure_advance = 0,0,0,0,1
N76 ; enable_prime_tower = 1
N77 ; enable_support = 0
N78 ; enforce_support_layers = 0
N79 ; eng_plate_temp = 70,30,30,70,60
N80 ; eng_plate_temp_initial_layer = 70,30,30,70,60
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
N94 ; fan_cooling_layer_time = 30,30,40,20,30
N95 ; fan_max_speed = 40,40,50,40,100
N96 ; fan_min_speed = 5,20,10,20,80
N97 ; filament_adhesiveness_category = 300,600,600,300,0
N98 ; filament_change_length = 10,10,10,12,10
N99 ; filament_colour = #0D6284;#5898DD;#C1C1C1;#F9DFB9;#FFFFFF
N100 ; filament_cost = 34.99,38.99,41.99,24.99,30
N101 ; filament_density = 1.25,1.26,1.26,1.28,1.27
N102 ; filament_diameter = 1.75,1.75,1.75,1.75,1.75
N103 ; filament_end_gcode = "; filament end gcode \n";"; filament end gcode \n";"; filament end gcode \n";"; filament end gcode \n";"; filament end gcode \n"
N104 ; filament_extruder_variant = "Direct Drive Standard";"Direct Drive Standard";"Direct Drive Standard";"Direct Drive Standard";"Direct Drive Standard"
N105 ; filament_flow_ratio = 0.95,0.97,1,0.95,1
N106 ; filament_flush_temp = 0,0,0,0,0
N107 ; filament_flush_volumetric_speed = 0,0,0,0,0
N108 ; filament_ids = GFG98;GFU02;GFU98;GFG02;GFG99
N109 ; filament_is_support = 0,0,0,0,0
N110 ; filament_map = 1,1,2,1,1
N111 ; filament_map_mode = Manual
N112 ; filament_max_volumetric_speed = 11.5,12,10.5,25,12
N113 ; filament_minimal_purge_on_wipe_tower = 15,15,15,15,15
N114 ; filament_notes = 
N115 ; filament_pre_cooling_temperature = 0,200,200,0,0
N116 ; filament_prime_volume = 45,45,45,30,45
N117 ; filament_printable = 3,3,3,3,3
N118 ; filament_ramming_travel_time = 0,20,20,0,0
N119 ; filament_ramming_volumetric_speed = -1,4.5,2.625,-1,-1
N120 ; filament_retraction_length = nil,0.4,nil,0.4,nil
N121 ; filament_scarf_gap = 0%,0%,0%,0%,0
N122 ; filament_scarf_height = 10%,10%,10%,10%,0%
N123 ; filament_scarf_length = 10,10,10,10,10
N124 ; filament_scarf_seam_type = none,none,none,none,none
N125 ; filament_self_index = 1,1,2,2,3,3,4,4,5
N126 ; filament_settings_id = "Generic PETG-CF @BBL H2D";"Bambu TPU for AMS @BBL H2D";"Generic TPU for AMS @BBL H2D";"Bambu PETG HF @BBL H2D 0.4 nozzle";"Flashforge PETG-CF(BrickAndMortarTest.3mf)"
N127 ; filament_shrink = 100%,100%,100%,100%,100%
N128 ; filament_soluble = 0,0,0,0,0
N129 ; filament_start_gcode = "; filament start gcode\n";"; filament start gcode\n";"; filament start gcode\n";"; filament start gcode\n";"; filament start gcode\n; Set print speed based on conditions (e.g., first few layers)\n{if layer_num < 5}\n  M220 S50 ; Slow down print speed for the first few layers (50%)\n{else}\n  M220 S100 ; Normal speed after the first few layers\n{endif}\n;right_extruder_material:PETG-CF10\n"
N130 ; filament_type = PETG-CF;TPU-AMS;TPU-AMS;PETG;PETG-CF
N131 ; filament_vendor = Generic;"Bambu Lab";Generic;"Bambu Lab";Generic
N132 ; filament_wipe = nil,nil,nil,1,nil
N133 ; filament_wipe_distance = nil,nil,nil,1,nil
N134 ; filament_z_hop_types = nil,nil,nil,Spiral Lift,nil
N135 ; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
N136 ; filter_out_gap_fill = 0
N137 ; first_layer_print_sequence = 0
N138 ; flush_into_infill = 0
N139 ; flush_into_objects = 0
N140 ; flush_into_support = 1
N141 ; flush_multiplier = 1,1
N142 ; flush_volumes_matrix = 0,359,519,619,629,190,0,396,513,523,259,259,0,301,338,312,322,193,0,287,273,271,190,192,0,0,374,534,634,644,205,0,411,528,538,274,274,0,316,353,327,337,208,0,302,288,286,205,207,0
N143 ; flush_volumes_vector = 140,140,140,140,140,140,140,140,140,140
N144 ; full_fan_speed_layer = 0,0,0,0,0
N145 ; fuzzy_skin = none
N146 ; fuzzy_skin_point_distance = 0.8
N147 ; fuzzy_skin_thickness = 0.3
N148 ; gap_infill_speed = 250,250
N149 ; gcode_add_line_number = 1
N150 ; gcode_flavor = marlin
N151 ; grab_length = 0,0
N152 ; has_scarf_joint_seam = 1
N153 ; head_wrap_detect_zone = 
N154 ; hole_coef_1 = 0,0,0,0,0
N155 ; hole_coef_2 = -0.008,-0.008,-0.008,-0.006,-0.025
N156 ; hole_coef_3 = 0.23415,0.23415,0.23415,0.1,0.28
N157 ; hole_limit_max = 0.22,0.22,0.22,0.22,0.25
N158 ; hole_limit_min = 0.088,0.088,0.088,0.1,0.08
N159 ; host_type = octoprint
N160 ; hot_plate_temp = 70,35,35,70,70
N161 ; hot_plate_temp_initial_layer = 70,35,35,70,70
N162 ; hotend_cooling_rate = 2,2
N163 ; hotend_heating_rate = 3.6,3.6
N164 ; impact_strength_z = 10,9.6,10,10.6,0
N165 ; independent_support_layer_height = 0
N166 ; infill_combination = 0
N167 ; infill_direction = 45
N168 ; infill_jerk = 9
N169 ; infill_lock_depth = 1
N170 ; infill_rotate_step = 0
N171 ; infill_shift_step = 0.4
N172 ; infill_wall_overlap = 15%
N173 ; inherits_group = "0.20mm Standard @BBL H2D";;;;;;
N174 ; initial_layer_acceleration = 500,500
N175 ; initial_layer_flow_ratio = 1
N176 ; initial_layer_infill_speed = 105,105
N177 ; initial_layer_jerk = 9
N178 ; initial_layer_line_width = 0.5
N179 ; initial_layer_print_height = 0.2
N180 ; initial_layer_speed = 50,50
N181 ; initial_layer_travel_acceleration = 6000,6000
N182 ; inner_wall_acceleration = 0,0
N183 ; inner_wall_jerk = 9
N184 ; inner_wall_line_width = 0.45
N185 ; inner_wall_speed = 300,300
N186 ; interface_shells = 0
N187 ; interlocking_beam = 0
N188 ; interlocking_beam_layer_count = 2
N189 ; interlocking_beam_width = 0.8
N190 ; interlocking_boundary_avoidance = 2
N191 ; interlocking_depth = 2
N192 ; interlocking_orientation = 22.5
N193 ; internal_bridge_support_thickness = 0.8
N194 ; internal_solid_infill_line_width = 0.42
N195 ; internal_solid_infill_pattern = zig-zag
N196 ; internal_solid_infill_speed = 250,250
N197 ; ironing_direction = 45
N198 ; ironing_flow = 10%
N199 ; ironing_inset = 0.21
N200 ; ironing_pattern = zig-zag
N201 ; ironing_spacing = 0.15
N202 ; ironing_speed = 30
N203 ; ironing_type = no ironing
N204 ; is_infill_first = 0
N205 ; layer_change_gcode = ;======== H2D 20250521========\n; layer num/total_layer_count: {layer_num+1}/[total_layer_count]\n; update layer progress\nM73 L{layer_num+1}\nM991 S0 P{layer_num} ;notify layer change\n\n
N206 ; layer_height = 0.2
N207 ; line_width = 0.42
N208 ; long_retractions_when_cut = 0,0
N209 ; long_retractions_when_ec = 1,1,1,1,0
N210 ; machine_end_gcode = ;===== date: 2025/05/16 =====================\n;===== H2D =====================\nG392 S0 ;turn off nozzle clog detect\nM993 A0 B0 C0 ; nozzle cam detection not allowed.\n\nM400 ; wait for buffer to clear\nG92 E0 ; zero the extruder\nG1 E-0.8 F1800 ; retract\nG1 Z{max_layer_z + 0.5} F900 ; lower z a little\n\nG90\nM141 S0 ; turn off chamber heating\nM140 S0 ; turn off bed\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off remote part cooling fan\nM106 P3 S0 ; turn off chamber cooling fan\n\n; pull back filament to AMS\nM620 S65535\nT65535\nG150.2\nM621 S65535\n\nM620 S65279\nT65279\nG150.2\nM621 S65279\n\nG150.3\n\nM1002 judge_flag timelapse_record_flag\nM622 J1\n    M400 ; wait all motion done\n    M991 S0 P-1 ;end smooth timelapse at safe pos\n    M400 S5 ;wait for last picture to be taken\nM623  ;end of "timelapse_record_flag"\n\nM104 S0 T0; turn off hotend\nM104 S0 T1; turn off hotend\n\nM400 ; wait all motion done\nM17 S\nM17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom\n{if (max_layer_z + 100.0) < 320}\n    G1 Z{max_layer_z + 100.0} F600\n    G1 Z{max_layer_z +98.0}\n{else}\n    G1 Z320 F600\n    G1 Z320\n{endif}\nM400 P100\nM17 R ; restore z current\n\nM220 S100  ; Reset feedrate magnitude\nM201.2 K1.0 ; Reset acc magnitude\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 0\n\nM1015.4 S0 K0 ;disable air printing detect\n;=====printer finish  sound=========\nM17\nM400 S1\nM1006 S1\nM1006 A53 B10 L99 C53 D10 M99 E53 F10 N99 \nM1006 A57 B10 L99 C57 D10 M99 E57 F10 N99 \nM1006 A0 B15 L0 C0 D15 M0 E0 F15 N0 \nM1006 A53 B10 L99 C53 D10 M99 E53 F10 N99 \nM1006 A57 B10 L99 C57 D10 M99 E57 F10 N99 \nM1006 A0 B15 L0 C0 D15 M0 E0 F15 N0 \nM1006 A48 B10 L99 C48 D10 M99 E48 F10 N99 \nM1006 A0 B15 L0 C0 D15 M0 E0 F15 N0 \nM1006 A60 B10 L99 C60 D10 M99 E60 F10 N99 \nM1006 W\n;=====printer finish  sound=========\nM400\nM18\n\n
N211 ; machine_load_filament_time = 30
N212 ; machine_max_acceleration_e = 5000,5000,5000,5000
N213 ; machine_max_acceleration_extruding = 20000,20000,20000,20000
N214 ; machine_max_acceleration_retracting = 5000,5000,5000,5000
N215 ; machine_max_acceleration_travel = 9000,9000,9000,9000
N216 ; machine_max_acceleration_x = 16000,16000,16000,16000
N217 ; machine_max_acceleration_y = 16000,16000,16000,16000
N218 ; machine_max_acceleration_z = 500,500,500,500
N219 ; machine_max_jerk_e = 2.5,2.5,2.5,2.5
N220 ; machine_max_jerk_x = 9,9,9,9
N221 ; machine_max_jerk_y = 9,9,9,9
N222 ; machine_max_jerk_z = 3,3,3,3
N223 ; machine_max_speed_e = 50,50,50,50
N224 ; machine_max_speed_x = 1000,1000,1000,1000
N225 ; machine_max_speed_y = 1000,1000,1000,1000
N226 ; machine_max_speed_z = 30,30,30,30
N227 ; machine_min_extruding_rate = 0,0
N228 ; machine_min_travel_rate = 0,0
N229 ; machine_pause_gcode = M400 U1
N230 ; machine_start_gcode = ;===== machine: H2D =========================\n;===== date: 20250604 =====================\n\n;M1002 set_flag extrude_cali_flag=1\n;M1002 set_flag g29_before_print_flag=1\n;M1002 set_flag auto_cali_toolhead_offset_flag=1\n;M1002 set_flag build_plate_detect_flag=1\n\nM993 A0 B0 C0 ; nozzle cam detection not allowed.\n\nM400\n;M73 P99\n\n;=====printer start sound ===================\nM17\nM400 S1\nM1006 S1\nM1006 A53 B9 L99 C53 D9 M99 E53 F9 N99 \nM1006 A56 B9 L99 C56 D9 M99 E56 F9 N99 \nM1006 A61 B9 L99 C61 D9 M99 E61 F9 N99 \nM1006 A53 B9 L99 C53 D9 M99 E53 F9 N99 \nM1006 A56 B9 L99 C56 D9 M99 E56 F9 N99 \nM1006 A61 B18 L99 C61 D18 M99 E61 F18 N99 \nM1006 W\n;=====printer start sound ===================\n\n;===== reset machine status =================\nM204 S10000\nM630 S0 P0\n\nG90\nM17 D ; reset motor current to default\nM960 S5 P1 ; turn on logo lamp\nG90\nM220 S100 ;Reset Feedrate\nM221 S100 ;Reset Flowrate\nM73.2   R1.0 ;Reset left time magnitude\nG29.1 Z{+0.0} ; clear z-trim value first\nM983.1 M1 \nM901 D4\nM481 S0 ; turn off cutter pos comp\n;===== reset machine status =================\n\nM620 M ;enable remap\n\n;===== avoid end stop =================\nG91\nG380 S2 Z22 F1200\nG380 S2 Z-12 F1200\nG90\n;===== avoid end stop =================\n\n;==== set airduct mode ==== \n\n{if (overall_chamber_temperature >= 40)}\n\n    M145 P1 ; set airduct mode to heating mode for heating\n    M106 P2 S0 ; turn off auxiliary fan\n    M106 P3 S0 ; turn off chamber fan\n\n{else}\n    M145 P0 ; set airduct mode to cooling mode for cooling\n    M106 P2 S178 ; turn on auxiliary fan for cooling\n    M106 P3 S127 ; turn on chamber fan for cooling\n    M140 S0 ; stop heatbed from heating\n\n    M1002 gcode_claim_action : 29\n    M191 S0 ; wait for chamber temp\n    M106 P2 S0 ; turn off auxiliary fan\n    {if (min_vitrification_temperature <= 50)}\n        {if (nozzle_diameter == 0.2)}\n            M142 P1 R30 S35 T40 U0.3 V0.5 W0.8 O40 ; set PLA/TPU ND0.2 chamber autocooling\n        {else}\n            M142 P1 R30 S40 T45 U0.3 V0.5 W0.8 O45; set PLA/TPU ND0.4 chamber autocooling\n        {endif}\n    {else}\n        {if (!is_all_bbl_filament)}\n            M142 P1 R35 S40 T45 U0.3 V0.5 W0.8 O45 L1 ; set third-party PETG chamber autocooling\n        {else}\n            {if (nozzle_diameter == 0.2)}\n                M142 P1 R35 S45 T50 U0.3 V0.5 W0.8 O50 L1 ; set PETG ND0.2 chamber autocooling\n            {else}\n                M142 P1 R35 S50 T55 U0.3 V0.5 W0.8 O55 L1 ; set PETG ND0.4 chamber autocooling\n            {endif}\n        {endif}\n    {endif}\n{endif}\n;==== set airduct mode ==== \n\n;===== start to heat heatbed & hotend==========\n\n    M1002 set_filament_type:{filament_type[initial_no_support_extruder]}\n\n    M104 S140 A\n    M140 S[bed_temperature_initial_layer_single]\n\n    ;===== set chamber temperature ==========\n    {if (overall_chamber_temperature >= 40)}\n        M145 P1 ; set airduct mode to heating mode\n        M141 S[overall_chamber_temperature] ; Let Chamber begin to heat\n    {endif}\n    ;===== set chamber temperature ==========\n\n;===== start to heat heatbead & hotend==========\n\n;====== cog noise reduction=================\nM982.2 S1 ; turn on cog noise reduction\n\n;===== first homing start =====\nM1002 gcode_claim_action : 13\n\nG28 X T300\n\nG150.1 F18000 ; wipe mouth to avoid filament stick to heatbed\nG150.3 F18000\nM400 P200\nM972 S24 P0 T2000\n{if curr_bed_type=="Textured PEI Plate"}\nM972 S26 P0 C0\n{elsif curr_bed_type=="High Temp Plate"}\nM972 S36 P0 C0 X1\n{endif}\nM972 S35 P0 C0\n\nG90\nG1 X175 Y160 F30000\n\nG28 Z P0 T250\n\n;===== first homing end =====\n\nM400\n;M73 P99\n\n;===== detection start =====\n\n    T1001\n    G383.4 ; left-extruder load status detection\n    \n    M104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]-80} A ; rise temp in advance\n\nM1002 judge_flag build_plate_detect_flag\nM622 S1\n    M972 S19 P0 C0    ; heatbed presence detection\nM623\n\n    M972 S14 P0 ; nozzle type detection\n\n;===== detection end =====\n\nM400\n;M73 P99\n\n;===== prepare print temperature and material ==========\nM400\nM211 X0 Y0 Z0 ;turn off soft endstop\nM975 S1 ; turn on input shaping\n\nG29.2 S0 ; avoid invalid abl data\n\n{if ((filament_type[initial_no_support_extruder] == "PLA") || (filament_type[initial_no_support_extruder] == "PLA-CF") || (filament_type[initial_no_support_extruder] == "PETG")) && (nozzle_diameter[initial_no_support_extruder] == 0.2)}\nM620.10 A0 F74.8347 H{nozzle_diameter[initial_no_support_extruder]} T{nozzle_temperature_range_high[initial_no_support_extruder]} P{nozzle_temperature_initial_layer[initial_no_support_extruder]} S1\nM620.10 A1 F74.8347 H{nozzle_diameter[initial_no_support_extruder]} T{nozzle_temperature_range_high[initial_no_support_extruder]} P{nozzle_temperature_initial_layer[initial_no_support_extruder]} S1\n{else}\nM620.10 A0 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60} H{nozzle_diameter[initial_no_support_extruder]} T{nozzle_temperature_range_high[initial_no_support_extruder]} P{nozzle_temperature_initial_layer[initial_no_support_extruder]} S1\nM620.10 A1 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60} H{nozzle_diameter[initial_no_support_extruder]} T{nozzle_temperature_range_high[initial_no_support_extruder]} P{nozzle_temperature_initial_layer[initial_no_support_extruder]} S1\n{endif}\n\nM620.11 P0 I[initial_no_support_extruder] E0\n\n{if long_retraction_when_ec }\nM620.11 K1 I[initial_no_support_extruder] R{retraction_distance_when_ec} F{max((filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60), 200)}\n{else}\nM620.11 K0 I[initial_no_support_extruder] R0\n{endif}\n\nM628 S1\n{if filament_type[initial_no_support_extruder] == "TPU"}\n    M620.11 S0 L0 I[initial_no_support_extruder] E-{retraction_distances_when_cut[initial_no_support_extruder]} F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60}\n{else}\n{if (filament_type[initial_no_support_extruder] == "PA") ||  (filament_type[initial_no_support_extruder] == "PA-GF")}\n    M620.11 S1 L0 I[initial_no_support_extruder] R4 D2 E-{retraction_distances_when_cut[initial_no_support_extruder]} F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60}\n{else}\n    M620.11 S1 L0 I[initial_no_support_extruder] R10 D8 E-{retraction_distances_when_cut[initial_no_support_extruder]} F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60}\n{endif}\n{endif}\nM629\n\nM620 S[initial_no_support_extruder]A   ; switch material if AMS exist\nM1002 gcode_claim_action : 4\nM1002 set_filament_type:UNKNOWN\nM400\nT[initial_no_support_extruder]\nM400\nM628 S0\nM629\nM400\nM1002 set_filament_type:{filament_type[initial_no_support_extruder]}\nM621 S[initial_no_support_extruder]A\n\nM104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]}\nM400\nM106 P1 S0\n\nG29.2 S1\n;===== prepare print temperature and material ==========\n\nM400\n;M73 P99\n\n;===== auto extrude cali start =========================\nM975 S1\nM1002 judge_flag extrude_cali_flag\n\nM622 J0\n    M983.3 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4} A0.4 ; cali dynamic extrusion compensation\nM623\n\nM622 J1\n    M1002 set_filament_type:{filament_type[initial_no_support_extruder]}\n    M1002 gcode_claim_action : 8\n\n    M109 S{nozzle_temperature[initial_no_support_extruder]}\n\n    G90\n    M83\n    M983.3 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4} A0.4 ; cali dynamic extrusion compensation\n\n    M400\n    M106 P1 S255\n    M400 S5\n    M106 P1 S0\n    G150.3\nM623\n\nM622 J2\n    M1002 set_filament_type:{filament_type[initial_no_support_extruder]}\n    M1002 gcode_claim_action : 8\n\n    M109 S{nozzle_temperature[initial_no_support_extruder]}\n\n    G90\n    M83\n    M983.3 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4} A0.4 ; cali dynamic extrusion compensation\n\n    M400\n    M106 P1 S255\n    M400 S5\n    M106 P1 S0\n    G150.3\nM623\n\n;===== auto extrude cali end =========================\n\n{if filament_type[initial_no_support_extruder] == "TPU"}\n    G150.2\n    G150.1\n    G150.2\n    G150.1\n    G150.2\n    G150.1\n{else}\n    M106 P1 S0\n    M400 S2\n    M83\n    G1 E45 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60}\n    G1 E-3 F1800\n    M400 P500\n    G150.2\n    G150.1\n{endif}\n\nG91\nG1 Y-16 F12000 ; move away from the trash bin\nG90\n\nM400\n;M73 P99\n\n;===== wipe right nozzle start =====\n\nM1002 gcode_claim_action : 14\n    G150 T{nozzle_temperature_initial_layer[initial_no_support_extruder]}\n    {if (overall_chamber_temperature >= 40)}\n        G150 T{nozzle_temperature_initial_layer[initial_no_support_extruder] - 80}\n    {endif}\nM106 S255 ; turn on fan to cool the nozzle\n\n;===== wipe left nozzle end =====\n\nM400\n;M73 P99\n\n{if (overall_chamber_temperature >= 40)}\n    M1002 gcode_claim_action : 49\n    M191 S[overall_chamber_temperature] ; wait for chamber temp\n{endif}\n\nM400\n;M73 P99\n\n;===== bed leveling ==================================\n\nM1002 judge_flag g29_before_print_flag\n\nM190 S[bed_temperature_initial_layer_single]; ensure bed temp\nM109 S140 A\nM106 S0 ; turn off fan , too noisy\n\nG91\nG1 Z5 F1200\nG90\nG1 X275 Y300 F30000\n\nM622 J1\n    M1002 gcode_claim_action : 1\n    G29.20 A3\n    G29 A1 O X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    M400\n    M500 ; save cali data\nM623\n    \nM622 J2\n    M1002 gcode_claim_action : 1\n    {if has_tpu_in_first_layer}\n        G29.20 A3\n        G29 A1 O X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    {else}\n        G29.20 A4\n        G29 A2 O X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    {endif}\n    M400\n    M500 ; save cali data\nM623\n\nM622 J0\n    G28\nM623\n\n;===== bed leveling end ================================\n\nG39.1 ; cali nozzle wrapped detection pos\nM500\n\n;===== z ofst cali start =====\n\n    M190 S[bed_temperature_initial_layer_single]; ensure bed temp\n\n    G383 O0 M2 T140\n    M500\n\n;===== z ofst cali end =====\n\nM400\n;M73 P99\n\nM141 S[overall_chamber_temperature]\nM104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]} A\n\n;===== mech mode sweep start =====\n    M1002 gcode_claim_action : 3\n\n    G90\n    G1 Z5 F1200\n    G1 X187 Y160 F20000\n    T1000\n    M400 P200\n\n    M970.3 Q1 A5 K0 O1\n    M974 Q1 S2 P0\n\n    M970.3 Q0 A5 K0 O1\n    M974 Q0 S2 P0\n\n    M970.2 Q2 K0 W38 Z0.01\n    M974 Q2 S2 P0\n    M500\n\n    M975 S1\n;===== mech mode sweep end =====\n\nM400\n;M73 P99\n\nG150.3 ; move to garbage can to wait for temp\nM1026\n\n;===== xy ofst cali start =====\n\nM1002 judge_flag auto_cali_toolhead_offset_flag\n\nM622 J0\n    M1012.5 N1 R1\nM623\n\nM622 J1\n    M1002 gcode_claim_action : 39\n    M141 S0\n    M620.17 T0 S{nozzle_temperature_initial_layer[(first_non_support_filaments[0] != -1 ? first_non_support_filaments[0] : first_filaments[0])]} L{(first_non_support_filaments[0] != -1 ? first_non_support_filaments[0] : first_filaments[0])}\n    M620.17 T1 S{nozzle_temperature_initial_layer[(first_non_support_filaments[1] != -1 ? first_non_support_filaments[1] : first_filaments[1])]} L{(first_non_support_filaments[1] != -1 ? first_non_support_filaments[1] : first_filaments[1])}\n    G383 O1 T{nozzle_temperature_initial_layer[initial_no_support_extruder]} L{initial_no_support_extruder}\n    M500\n    M141 S[overall_chamber_temperature]\nM623\n\nM622 J2\n    M1002 gcode_claim_action : 39\n    M141 S0\n    M620.17 T0 S{nozzle_temperature_initial_layer[(first_non_support_filaments[0] != -1 ? first_non_support_filaments[0] : first_filaments[0])]} L{(first_non_support_filaments[0] != -1 ? first_non_support_filaments[0] : first_filaments[0])}\n    M620.17 T1 S{nozzle_temperature_initial_layer[(first_non_support_filaments[1] != -1 ? first_non_support_filaments[1] : first_filaments[1])]} L{(first_non_support_filaments[1] != -1 ? first_non_support_filaments[1] : first_filaments[1])}\n    G383.3 T{nozzle_temperature_initial_layer[initial_no_support_extruder]} L{initial_no_support_extruder}\n    M500\n    M141 S[overall_chamber_temperature]\nM623\n;===== xy ofst cali end =====\n\nM400\n;M73 P99\n\nM1002 gcode_claim_action : 0\nM400\n\n;============switch again==================\n\nM211 X0 Y0 Z0 ;turn off soft endstop\nG91\nG1 Z6 F1200\nG90\nM1002 set_filament_type:{filament_type[initial_no_support_extruder]}\nM620 S[initial_no_support_extruder]A\nM400\nT[initial_no_support_extruder]\nM400\nM628 S0\nM629\nM400\nM621 S[initial_no_support_extruder]A\n\n;============switch again==================\n\nM400\n;M73 P99\n\n;===== wait temperature reaching the reference value =======\n\nM104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]} ; rise to print tmpr\n\nM140 S[bed_temperature_initial_layer_single] \nM190 S[bed_temperature_initial_layer_single] \n\n    ;========turn off light and fans =============\n    M960 S1 P0 ; turn off laser\n    M960 S2 P0 ; turn off laser\n    M106 S0 ; turn off fan\n    M106 P2 S0 ; turn off big fan\n\n    ;============set motor current==================\n    M400 S1\n\n;===== wait temperature reaching the reference value =======\n\nM400\n;M73 P99\n\n;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==\n    {if curr_bed_type=="Textured PEI Plate"}\n        G29.1 Z{-0.02} ; for Textured PEI Plate\n    {endif}\n    \nG150.1\n\nM975 S1 ; turn on mech mode supression\nM983.4 S1 ; turn on deformation compensation \nG29.2 S1 ; turn on pos comp\nG29.7 S1\n\nG90\nG1 Z5 F1200\nG1 Y295 F30000\nG1 Y265 F18000\n\n;===== nozzle load line ===============================\nG29.2 S1 ; ensure z comp turn on\nG90\nM83\nM109 S{nozzle_temperature_initial_layer[initial_no_support_extruder]}\n{if filament_type[initial_no_support_extruder] == "TPU"}\n    ;G130 O0 F{filament_max_volumetric_speed[initial_no_support_extruder]/2/2.4053} L80 E5 D12 A{first_layer_print_min[0]} B{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    G130 O0 X250 Y-0.5 Z0.8 F{filament_max_volumetric_speed[initial_no_support_extruder]/2/2.4053} L40 E20 D5\n{else}\n    ;G130 O0 F{filament_max_volumetric_speed[initial_no_support_extruder]/2/2.4053} L80 E5 D12 A{first_layer_print_min[0]} B{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    G130 O0 X250 Y-0.5 Z0.8 F{filament_max_volumetric_speed[initial_no_support_extruder]/2/2.4053} L40 E20 D5\n{endif}\nG90\nM83\nG1 Z0.2\n\n;===== noozle load line end ===========================\n\nM400\n;M73 P99\n\nM993 A1 B1 C1 ; nozzle cam detection allowed.\n\n{if (filament_type[initial_no_support_extruder] == "TPU")}\nM1015.3 S1;enable tpu clog detect\n{else}\nM1015.3 S0;disable tpu clog detect\n{endif}\n\n{if (filament_type[initial_no_support_extruder] == "PLA") ||  (filament_type[initial_no_support_extruder] == "PETG")\n ||  (filament_type[initial_no_support_extruder] == "PLA-CF")  ||  (filament_type[initial_no_support_extruder] == "PETG-CF")}\nM1015.4 S1 K1 H[nozzle_diameter] ;enable E air printing detect\n{else}\nM1015.4 S0 K0 H[nozzle_diameter] ;disable E air printing detect\n{endif}\n\nM620.6 I[initial_no_support_extruder] W1 ;enable ams air printing detect\n\nM211 Z1\nG29.99\n\n\n
N231 ; machine_switch_extruder_time = 5.6
N232 ; machine_unload_filament_time = 30
N233 ; master_extruder_id = 2
N234 ; max_bridge_length = 0
N235 ; max_layer_height = 0.28,0.28
N236 ; max_travel_detour_distance = 0
N237 ; min_bead_width = 85%
N238 ; min_feature_size = 25%
N239 ; min_layer_height = 0.08,0.08
N240 ; minimum_sparse_infill_area = 15
N241 ; mmu_segmented_region_interlocking_depth = 0
N242 ; mmu_segmented_region_max_width = 0
N243 ; nozzle_diameter = 0.4,0.4
N244 ; nozzle_height = 4
N245 ; nozzle_temperature = 255,230,230,245,245
N246 ; nozzle_temperature_initial_layer = 255,230,230,245,245
N247 ; nozzle_temperature_range_high = 270,240,250,270,260
N248 ; nozzle_temperature_range_low = 240,220,200,230,220
N249 ; nozzle_type = hardened_steel,hardened_steel
N250 ; nozzle_volume = 130,145
N251 ; nozzle_volume_type = Standard,Standard
N252 ; only_one_wall_first_layer = 0
N253 ; ooze_prevention = 0
N254 ; other_layers_print_sequence = 0
N255 ; other_layers_print_sequence_nums = 0
N256 ; outer_wall_acceleration = 5000,5000
N257 ; outer_wall_jerk = 9
N258 ; outer_wall_line_width = 0.42
N259 ; outer_wall_speed = 200,200
N260 ; overhang_1_4_speed = 0,0
N261 ; overhang_2_4_speed = 50,50
N262 ; overhang_3_4_speed = 30,30
N263 ; overhang_4_4_speed = 10,10
N264 ; overhang_fan_speed = 100,100,100,100,90
N265 ; overhang_fan_threshold = 10%,25%,25%,10%,25%
N266 ; overhang_threshold_participating_cooling = 95%,95%,95%,95%,95%
N267 ; overhang_totally_speed = 10,10
N268 ; physical_extruder_map = 1,0
N269 ; post_process = "/opt/homebrew/bin/python3 \"/Users/bbrenner/Documents/Scripting Projects/Brick and Mortar/brick_and_mortar-non-verbose.py\" {input_file} {output_file}"
N270 ; pre_start_fan_time = 0,0,0,2,0
N271 ; precise_outer_wall = 0
N272 ; precise_z_height = 0
N273 ; pressure_advance = 0.02,0.02,0.02,0.02,0.035
N274 ; prime_tower_brim_width = -1
N275 ; prime_tower_enable_framework = 0
N276 ; prime_tower_extra_rib_length = 0
N277 ; prime_tower_fillet_wall = 1
N278 ; prime_tower_flat_ironing = 1
N279 ; prime_tower_infill_gap = 150%
N280 ; prime_tower_lift_height = -1
N281 ; prime_tower_lift_speed = 90
N282 ; prime_tower_max_speed = 90
N283 ; prime_tower_rib_wall = 1
N284 ; prime_tower_rib_width = 8
N285 ; prime_tower_skip_points = 1
N286 ; prime_tower_width = 60
N287 ; print_compatible_printers = "Bambu Lab H2D 0.4 nozzle"
N288 ; print_extruder_id = 1,2
N289 ; print_extruder_variant = "Direct Drive Standard";"Direct Drive Standard"
N290 ; print_flow_ratio = 1
N291 ; print_sequence = by layer
N292 ; print_settings_id = 0.20mm Brick and Mortar Test
N293 ; printable_area = 0x0,350x0,350x320,0x320
N294 ; printable_height = 325
N295 ; printer_extruder_id = 1,2
N296 ; printer_extruder_variant = "Direct Drive Standard";"Direct Drive Standard"
N297 ; printer_model = Bambu Lab H2D
N298 ; printer_notes = 
N299 ; printer_settings_id = Bambu Lab H2D 0.4 nozzle
N300 ; printer_structure = corexy
N301 ; printer_technology = FFF
N302 ; printer_variant = 0.4
N303 ; printhost_authorization_type = key
N304 ; printhost_ssl_ignore_revoke = 0
N305 ; printing_by_object_gcode = 
N306 ; process_notes = --base-tool T0                     # Tool for base material (default: T0)\n--alt-tool T1                      # Tool for mortar material (default: T1)\n\n--layer-height 0.2                # Layer height in mm (default: 0.2)\n--mortar-offset-z 0.1             # Z offset for mortar layer (default: half of layer height)\n--brick-offset-xy 0.25            # XY stagger for mortar paths (default: 0.25mm)\n\n--over-extrude 1.05               # Extrusion multiplier for mortar layer (default: 1.05 = 5% over)\n--enable-over-extrude             # Explicit toggle for applying over-extrusion (optional)\n\n--enable-tool-settings            # Use hardcoded temp/fan settings (default: off)\n--no-tool-settings                # Disable hardcoded temp/fan settings even if defined\n\n--no-modify-infill                # Skip infill entirely (default: true – script focuses on walls)\n--include-top-bottom              # Enable modification of top/bottom shells (experimental)\n\n--debug                           # Print debug information while running\n
N307 ; raft_contact_distance = 0.1
N308 ; raft_expansion = 1.5
N309 ; raft_first_layer_density = 90%
N310 ; raft_first_layer_expansion = 2
N311 ; raft_layers = 0
N312 ; reduce_crossing_wall = 1
N313 ; reduce_fan_stop_start_freq = 1,1,1,1,1
N314 ; reduce_infill_retraction = 1
N315 ; required_nozzle_HRC = 40,3,3,3,0
N316 ; resolution = 0.012
N317 ; retract_before_wipe = 0%,0%
N318 ; retract_length_toolchange = 2,2
N319 ; retract_lift_above = 0,0
N320 ; retract_lift_below = 319,319
N321 ; retract_restart_extra = 0,0
N322 ; retract_restart_extra_toolchange = 0,0
N323 ; retract_when_changing_layer = 1,1
N324 ; retraction_distances_when_cut = 10,10
N325 ; retraction_distances_when_ec = 10,0,10,10,10
N326 ; retraction_length = 0.8,0.8
N327 ; retraction_minimum_travel = 1,1
N328 ; retraction_speed = 30,30
N329 ; role_base_wipe_speed = 1
N330 ; scan_first_layer = 0
N331 ; scarf_angle_threshold = 155
N332 ; seam_gap = 15%
N333 ; seam_position = aligned
N334 ; seam_slope_conditional = 1
N335 ; seam_slope_entire_loop = 0
N336 ; seam_slope_inner_walls = 1
N337 ; seam_slope_steps = 10
N338 ; silent_mode = 0
N339 ; single_extruder_multi_material = 1
N340 ; skeleton_infill_density = 15%
N341 ; skeleton_infill_line_width = 0.45
N342 ; skin_infill_density = 15%
N343 ; skin_infill_depth = 2
N344 ; skin_infill_line_width = 0.45
N345 ; skirt_distance = 2
N346 ; skirt_height = 1
N347 ; skirt_loops = 1
N348 ; slice_closing_radius = 0.049
N349 ; slicing_mode = regular
N350 ; slow_down_for_layer_cooling = 1,1,1,1,1
N351 ; slow_down_layer_time = 6,10,10,10,8
N352 ; slow_down_min_speed = 10,10,10,20,20
N353 ; small_perimeter_speed = 50%,50%
N354 ; small_perimeter_threshold = 0,0
N355 ; smooth_coefficient = 4
N356 ; smooth_speed_discontinuity_area = 1
N357 ; solid_infill_filament = 1
N358 ; sparse_infill_acceleration = 100%,100%
N359 ; sparse_infill_anchor = 400%
N360 ; sparse_infill_anchor_max = 20
N361 ; sparse_infill_density = 15%
N362 ; sparse_infill_filament = 1
N363 ; sparse_infill_line_width = 0.45
N364 ; sparse_infill_pattern = cubic
N365 ; sparse_infill_speed = 350,350
N366 ; spiral_mode = 0
N367 ; spiral_mode_max_xy_smoothing = 200%
N368 ; spiral_mode_smooth = 0
N369 ; standby_temperature_delta = -5
N370 ; start_end_points = 30x-3,54x245
N371 ; supertack_plate_temp = 70,0,0,70,35
N372 ; supertack_plate_temp_initial_layer = 70,0,0,70,35
N373 ; support_air_filtration = 0
N374 ; support_angle = 0
N375 ; support_base_pattern = default
N376 ; support_base_pattern_spacing = 2.5
N377 ; support_bottom_interface_spacing = 0.5
N378 ; support_bottom_z_distance = 0.2
N379 ; support_chamber_temp_control = 1
N380 ; support_critical_regions_only = 0
N381 ; support_expansion = 0
N382 ; support_filament = 3
N383 ; support_interface_bottom_layers = 2
N384 ; support_interface_filament = 0
N385 ; support_interface_loop_pattern = 0
N386 ; support_interface_not_for_body = 1
N387 ; support_interface_pattern = auto
N388 ; support_interface_spacing = 0.5
N389 ; support_interface_speed = 80,80
N390 ; support_interface_top_layers = 2
N391 ; support_line_width = 0.42
N392 ; support_object_first_layer_gap = 0.2
N393 ; support_object_xy_distance = 0.35
N394 ; support_on_build_plate_only = 0
N395 ; support_remove_small_overhang = 1
N396 ; support_speed = 150,150
N397 ; support_style = default
N398 ; support_threshold_angle = 30
N399 ; support_top_z_distance = 0.2
N400 ; support_type = tree(auto)
N401 ; symmetric_infill_y_axis = 0
N402 ; temperature_vitrification = 70,30,30,70,70
N403 ; template_custom_gcode = 
N404 ; textured_plate_temp = 70,35,35,70,60
N405 ; textured_plate_temp_initial_layer = 70,35,35,70,60
N406 ; thick_bridges = 0
N407 ; thumbnail_size = 50x50
N408 ; time_lapse_gcode = ;======== H2D 20250527========\n; SKIPPABLE_START\n; SKIPTYPE: timelapse\nM622.1 S1 ; for prev firware, default turned on\n\nM1002 judge_flag timelapse_record_flag\n\nM622 J1\nM993 A2 B2 C2\nM993 A0 B0 C0\n\n{if !spiral_mode && !(has_timelapse_safe_pos && timelapse_type == 0 && print_sequence != "by object") }\n    {if most_used_physical_extruder_id!= curr_physical_extruder_id || timelapse_type == 1}\n        M83\n        G1 Z{max_layer_z + 0.4} F1200\n        M400\n    {endif}\n{endif}\n\n{if has_timelapse_safe_pos && timelapse_type == 0 && print_sequence != "by object"}\n    M9711 M{timelapse_type} E{most_used_physical_extruder_id} X{timelapse_pos_x} Y{timelapse_pos_y} Z{layer_z + 0.4} S11 C10 O0 T3000\n{else}\n    M9711 M{timelapse_type} E{most_used_physical_extruder_id} Z{layer_z + 0.4} S11 C10 O0 T3000\n{endif}\n\n{if !spiral_mode && !(has_timelapse_safe_pos && timelapse_type == 0 && print_sequence != "by object") }\n    {if most_used_physical_extruder_id!= curr_physical_extruder_id || timelapse_type == 1}\n        G90\n        G1 Z{max_layer_z + 3.0} F1200\n        G1 Y295 F30000\n        G1 Y265 F18000\n        M83\n    {endif}\n{endif}\nM993 A3 B3 C3\n\nM623\n; SKIPPABLE_END\n
N409 ; timelapse_type = 0
N410 ; top_area_threshold = 200%
N411 ; top_color_penetration_layers = 5
N412 ; top_one_wall_type = all top
N413 ; top_shell_layers = 5
N414 ; top_shell_thickness = 1
N415 ; top_solid_infill_flow_ratio = 1
N416 ; top_surface_acceleration = 2000,2000
N417 ; top_surface_jerk = 9
N418 ; top_surface_line_width = 0.42
N419 ; top_surface_pattern = monotonicline
N420 ; top_surface_speed = 200,200
N421 ; travel_acceleration = 10000,10000
N422 ; travel_jerk = 9
N423 ; travel_speed = 1000,1000
N424 ; travel_speed_z = 0,0
N425 ; tree_support_branch_angle = 45
N426 ; tree_support_branch_diameter = 2
N427 ; tree_support_branch_diameter_angle = 5
N428 ; tree_support_branch_distance = 5
N429 ; tree_support_wall_count = 0
N430 ; upward_compatible_machine = 
N431 ; use_firmware_retraction = 0
N432 ; use_relative_e_distances = 1
N433 ; vertical_shell_speed = 80%,80%
N434 ; wall_distribution_count = 1
N435 ; wall_filament = 1
N436 ; wall_generator = classic
N437 ; wall_loops = 4
N438 ; wall_sequence = inner wall/outer wall
N439 ; wall_transition_angle = 10
N440 ; wall_transition_filter_deviation = 25%
N441 ; wall_transition_length = 100%
N442 ; wipe = 1,1
N443 ; wipe_distance = 2,2
N444 ; wipe_speed = 80%
N445 ; wipe_tower_no_sparse_layers = 0
N446 ; wipe_tower_rotation_angle = 0
N447 ; wipe_tower_x = 165
N448 ; wipe_tower_y = 250
N449 ; xy_contour_compensation = 0
N450 ; xy_hole_compensation = 0
N451 ; z_direction_outwall_speed_continuous = 1
N452 ; z_hop = 0.4,0.4
N453 ; z_hop_types = Auto Lift,Auto Lift
N454 ; CONFIG_BLOCK_END
N455 
N456 ; EXECUTABLE_BLOCK_START
N457 M73 P0 R37
N458 M201 X16000 Y16000 Z500 E5000
N459 M203 X1000 Y1000 Z30 E50
N460 M204 P20000 R5000 T20000
N461 M205 X9.00 Y9.00 Z3.00 E2.50
N462 M106 S0
N463 M106 P2 S0
N464 ; FEATURE: Custom
N465 ;===== machine: H2D =========================
N466 ;===== date: 20250604 =====================
N467 
N468 ;M1002 set_flag extrude_cali_flag=1
N469 ;M1002 set_flag g29_before_print_flag=1
N470 ;M1002 set_flag auto_cali_toolhead_offset_flag=1
N471 ;M1002 set_flag build_plate_detect_flag=1
N472 
N473 M993 A0 B0 C0 ; nozzle cam detection not allowed.
N474 
N475 M400
N476 ;M73 P99
N477 
N478 ;=====printer start sound ===================
N479 M17
N480 M400 S1
N481 M1006 S1
N482 M1006 A53 B9 L99 C53 D9 M99 E53 F9 N99 
N483 M1006 A56 B9 L99 C56 D9 M99 E56 F9 N99 
N484 M1006 A61 B9 L99 C61 D9 M99 E61 F9 N99 
N485 M1006 A53 B9 L99 C53 D9 M99 E53 F9 N99 
N486 M1006 A56 B9 L99 C56 D9 M99 E56 F9 N99 
N487 M1006 A61 B18 L99 C61 D18 M99 E61 F18 N99 
N488 M1006 W
N489 ;=====printer start sound ===================
N490 
N491 ;===== reset machine status =================
N492 M204 S10000
N493 M630 S0 P0
N494 
N495 G90
N496 M17 D ; reset motor current to default
N497 M960 S5 P1 ; turn on logo lamp
N498 G90
N499 M220 S100 ;Reset Feedrate
N500 M221 S100 ;Reset Flowrate
N501 M73.2   R1.0 ;Reset left time magnitude
N502 G29.1 Z0 ; clear z-trim value first
N503 M983.1 M1 
N504 M901 D4
N505 M481 S0 ; turn off cutter pos comp
N506 ;===== reset machine status =================
N507 
N508 M620 M ;enable remap
N509 
N510 ;===== avoid end stop =================
N511 G91
N512 G380 S2 Z22 F1200
N513 G380 S2 Z-12 F1200
N514 G90
N515 ;===== avoid end stop =================
N516 
N517 ;==== set airduct mode ==== 
N518 
N519 
N520     M145 P0 ; set airduct mode to cooling mode for cooling
N521     M106 P2 S178 ; turn on auxiliary fan for cooling
N522     M106 P3 S127 ; turn on chamber fan for cooling
N523     M140 S0 ; stop heatbed from heating
N524 
N525     M1002 gcode_claim_action : 29
N526     M191 S0 ; wait for chamber temp
N527     M106 P2 S0 ; turn off auxiliary fan
N528     
N529         
N530             M142 P1 R30 S40 T45 U0.3 V0.5 W0.8 O45; set PLA/TPU ND0.4 chamber autocooling
N531         
N532     
N533 
N534 ;==== set airduct mode ==== 
N535 
N536 ;===== start to heat heatbed & hotend==========
N537 
N538     M1002 set_filament_type:PETG-CF
N539 
N540     M104 S140 A
N541     M140 S70
N542 
N543     ;===== set chamber temperature ==========
N544     
N545     ;===== set chamber temperature ==========
N546 
N547 ;===== start to heat heatbead & hotend==========
N548 
N549 ;====== cog noise reduction=================
N550 M982.2 S1 ; turn on cog noise reduction
N551 
N552 ;===== first homing start =====
N553 M1002 gcode_claim_action : 13
N554 
N555 G28 X T300
N556 
N557 G150.1 F18000 ; wipe mouth to avoid filament stick to heatbed
N558 G150.3 F18000
N559 M400 P200
N560 M972 S24 P0 T2000
N561 
N562 M972 S26 P0 C0
N563 
N564 M972 S35 P0 C0
N565 
N566 G90
N567 G1 X175 Y160 F30000
N568 
N569 G28 Z P0 T250
N570 
N571 ;===== first homing end =====
N572 
N573 M400
N574 ;M73 P99
N575 
N576 ;===== detection start =====
N577 
N578     T1001
N579     G383.4 ; left-extruder load status detection
N580     
N581     M104 S175 A ; rise temp in advance
N582 
N583 M1002 judge_flag build_plate_detect_flag
N584 M622 S1
N585     M972 S19 P0 C0    ; heatbed presence detection
N586 M623
N587 
N588     M972 S14 P0 ; nozzle type detection
N589 
N590 ;===== detection end =====
N591 
N592 M400
N593 ;M73 P99
N594 
N595 ;===== prepare print temperature and material ==========
N596 M400
N597 M211 X0 Y0 Z0 ;turn off soft endstop
N598 M975 S1 ; turn on input shaping
N599 
N600 G29.2 S0 ; avoid invalid abl data
N601 
N602 
N603 M620.10 A0 F286.867 H0.4 T270 P255 S1
N604 M620.10 A1 F286.867 H0.4 T270 P255 S1
N605 
N606 
N607 M620.11 P0 I0 E0
N608 
N609 
N610 M620.11 K1 I0 R10 F286.867
N611 
N612 
N613 M628 S1
N614 
N615 
N616     M620.11 S1 L0 I0 R10 D8 E-10 F286.867
N617 
N618 
N619 M629
N620 
N621 M620 S0A   ; switch material if AMS exist
N622 M1002 gcode_claim_action : 4
N623 M1002 set_filament_type:UNKNOWN
N624 M400
N625 T0
N626 M400
N627 M628 S0
N628 M629
N629 M400
N630 M1002 set_filament_type:PETG-CF
N631 M621 S0A
N632 
N633 M104 S255
N634 M400
N635 M106 P1 S0
N636 
N637 G29.2 S1
N638 ;===== prepare print temperature and material ==========
N639 
N640 M400
N641 ;M73 P99
N642 
N643 ;===== auto extrude cali start =========================
N644 M975 S1
N645 M1002 judge_flag extrude_cali_flag
N646 
N647 M622 J0
N648     M983.3 F4.79167 A0.4 ; cali dynamic extrusion compensation
N649 M623
N650 
N651 M622 J1
N652     M1002 set_filament_type:PETG-CF
N653     M1002 gcode_claim_action : 8
N654 
N655     M109 S255
N656 
N657     G90
N658     M83
N659     M983.3 F4.79167 A0.4 ; cali dynamic extrusion compensation
N660 
N661     M400
N662     M106 P1 S255
N663     M400 S5
N664     M106 P1 S0
N665     G150.3
N666 M623
N667 
N668 M622 J2
N669     M1002 set_filament_type:PETG-CF
N670     M1002 gcode_claim_action : 8
N671 
N672     M109 S255
N673 
N674     G90
N675     M83
N676     M983.3 F4.79167 A0.4 ; cali dynamic extrusion compensation
N677 
N678     M400
N679     M106 P1 S255
N680     M400 S5
N681     M106 P1 S0
N682     G150.3
N683 M623
N684 
N685 ;===== auto extrude cali end =========================
N686 
N687 
N688     M106 P1 S0
N689     M400 S2
N690     M83
N691     G1 E45 F286.867
N692     G1 E-3 F1800
N693     M400 P500
N694     G150.2
N695     G150.1
N696 
N697 
N698 G91
N699 M73 P1 R36
N700 G1 Y-16 F12000 ; move away from the trash bin
N701 G90
N702 
N703 M400
N704 ;M73 P99
N705 
N706 ;===== wipe right nozzle start =====
N707 
N708 M1002 gcode_claim_action : 14
N709     G150 T255
N710     
N711 M106 S255 ; turn on fan to cool the nozzle
N712 
N713 ;===== wipe left nozzle end =====
N714 
N715 M400
N716 ;M73 P99
N717 
N718 
N719 
N720 M400
N721 ;M73 P99
N722 
N723 ;===== bed leveling ==================================
N724 
N725 M1002 judge_flag g29_before_print_flag
N726 
N727 M190 S70; ensure bed temp
N728 M109 S140 A
N729 M106 S0 ; turn off fan , too noisy
N730 
N731 G91
N732 M73 P2 R36
N733 G1 Z5 F1200
N734 G90
N735 G1 X275 Y300 F30000
N736 
N737 M622 J1
N738     M1002 gcode_claim_action : 1
N739     G29.20 A3
N740     G29 A1 O X154.814 Y111.422 I45.8708 J172.902
N741     M400
N742     M500 ; save cali data
N743 M623
N744     
N745 M622 J2
N746     M1002 gcode_claim_action : 1
N747     
N748         G29.20 A4
N749         G29 A2 O X154.814 Y111.422 I45.8708 J172.902
N750     
N751     M400
N752     M500 ; save cali data
N753 M623
N754 
N755 M622 J0
N756     G28
N757 M623
N758 
N759 ;===== bed leveling end ================================
N760 
N761 G39.1 ; cali nozzle wrapped detection pos
N762 M500
N763 
N764 ;===== z ofst cali start =====
N765 
N766     M190 S70; ensure bed temp
N767 
N768     G383 O0 M2 T140
N769     M500
N770 
N771 ;===== z ofst cali end =====
N772 
N773 M400
N774 ;M73 P99
N775 
N776 M141 S0
N777 M104 S255 A
N778 
N779 ;===== mech mode sweep start =====
N780     M1002 gcode_claim_action : 3
N781 
N782     G90
N783 M73 P13 R32
N784     G1 Z5 F1200
N785     G1 X187 Y160 F20000
N786     T1000
N787     M400 P200
N788 
N789     M970.3 Q1 A5 K0 O1
N790     M974 Q1 S2 P0
N791 
N792     M970.3 Q0 A5 K0 O1
N793     M974 Q0 S2 P0
N794 
N795     M970.2 Q2 K0 W38 Z0.01
N796     M974 Q2 S2 P0
N797     M500
N798 
N799     M975 S1
N800 ;===== mech mode sweep end =====
N801 
N802 M400
N803 ;M73 P99
N804 
N805 G150.3 ; move to garbage can to wait for temp
N806 M1026
N807 
N808 ;===== xy ofst cali start =====
N809 
N810 M1002 judge_flag auto_cali_toolhead_offset_flag
N811 
N812 M622 J0
N813     M1012.5 N1 R1
N814 M623
N815 
N816 M622 J1
N817     M1002 gcode_claim_action : 39
N818     M141 S0
N819     M620.17 T0 S230 L2
N820     M620.17 T1 S255 L0
N821     G383 O1 T255 L0
N822     M500
N823     M141 S0
N824 M623
N825 
N826 M622 J2
N827     M1002 gcode_claim_action : 39
N828     M141 S0
N829     M620.17 T0 S230 L2
N830     M620.17 T1 S255 L0
N831     G383.3 T255 L0
N832     M500
N833     M141 S0
N834 M623
N835 ;===== xy ofst cali end =====
N836 
N837 M400
N838 ;M73 P99
N839 
N840 M1002 gcode_claim_action : 0
N841 M400
N842 
N843 ;============switch again==================
N844 
N845 M211 X0 Y0 Z0 ;turn off soft endstop
N846 G91
N847 G1 Z6 F1200
N848 G90
N849 M1002 set_filament_type:PETG-CF
N850 M620 S0A
N851 M400
N852 T0
N853 M400
N854 M628 S0
N855 M629
N856 M400
N857 M621 S0A
N858 
N859 ;============switch again==================
N860 
N861 M400
N862 ;M73 P99
N863 
N864 ;===== wait temperature reaching the reference value =======
N865 
N866 M104 S255 ; rise to print tmpr
N867 
N868 M140 S70 
N869 M190 S70 
N870 
N871     ;========turn off light and fans =============
N872     M960 S1 P0 ; turn off laser
N873     M960 S2 P0 ; turn off laser
N874     M106 S0 ; turn off fan
N875     M106 P2 S0 ; turn off big fan
N876 
N877     ;============set motor current==================
N878     M400 S1
N879 
N880 ;===== wait temperature reaching the reference value =======
N881 
N882 M400
N883 ;M73 P99
N884 
N885 ;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==
N886     
N887         G29.1 Z-0.02 ; for Textured PEI Plate
N888     
N889     
N890 G150.1
N891 
N892 M975 S1 ; turn on mech mode supression
N893 M983.4 S1 ; turn on deformation compensation 
N894 G29.2 S1 ; turn on pos comp
N895 G29.7 S1
N896 
N897 G90
N898 M73 P25 R27
N899 G1 Z5 F1200
N900 G1 Y295 F30000
N901 G1 Y265 F18000
N902 
N903 ;===== nozzle load line ===============================
N904 G29.2 S1 ; ensure z comp turn on
N905 G90
N906 M83
N907 M109 S255
N908 
N909     ;G130 O0 F2.39055 L80 E5 D12 A154.814 B111.422 I45.8708 J172.902
N910     G130 O0 X250 Y-0.5 Z0.8 F2.39055 L40 E20 D5
N911 
N912 G90
N913 M83
N914 G1 Z0.2
N915 
N916 ;===== noozle load line end ===========================
N917 
N918 M400
N919 ;M73 P99
N920 
N921 M993 A1 B1 C1 ; nozzle cam detection allowed.
N922 
N923 
N924 M1015.3 S0;disable tpu clog detect
N925 
N926 
N927 
N928 M1015.4 S1 K1 H0.4 ;enable E air printing detect
N929 
N930 
N931 M620.6 I0 W1 ;enable ams air printing detect
N932 
N933 M211 Z1
N934 G29.99
N935 
N936 
N937 ; MACHINE_START_GCODE_END
N938 M104 T0 S10 N0 ;Multi extruder pre cooling
N939 ; filament start gcode
N940 ;VT0
N941 G90
N942 G21
N943 M83 ; use relative distances for extrusion
N944 M981 S1 P20000 ;open spaghetti detector
N945 M204 S10000
N946 G1 Z.2 F60000
N947 ; CHANGE_LAYER
N948 ; Z_HEIGHT: 0.2
N949 ; LAYER_HEIGHT: 0.2
N950 ;======== H2D 20250521========
N951 ; layer num/total_layer_count: 1/63
N952 ; update layer progress
N953 M73 L1
N954 M991 S0 P0 ;notify layer change
N955 
N956 
N957 M106 S0
N958 M106 P2 S0
N959 G1 E-.8 F1800
N960 G1 X155.435 Y120.452 F60000
N961 M204 S6000
N962 G1 Z.6
N963 G1 Z.2
N964 G1 E.8 F1800
N965 ; FEATURE: Skirt
N966 ; LINE_WIDTH: 0.5
N967 ; LAYER_HEIGHT: 0.2
N968 G1 F3000
N969 M204 S500
N970 G1 X156.009 Y119.83 E.03054
N971 G1 X166.058 Y112.155 E.45656
N972 G1 X167.55 Y111.651 E.05684
N973 G1 X182.55 Y111.651 E.54159
N974 G1 X184.05 Y112.162 E.05724
N975 G1 X194.001 Y119.837 E.45373
N976 G1 X194.815 Y120.96 E.0501
N977 G1 X194.955 Y121.677 E.02637
N978 G1 X200.454 Y249.884 E4.6333
N979 G1 X200.457 Y281.638 E1.14651
N980 G1 X200.065 Y282.97 E.0501
N981 G1 X199.014 Y283.876 E.0501
N982 G1 X198 Y284.095 E.03748
N983 G1 X164.991 Y284.095 E1.19182
N984 G1 X163.659 Y283.704 E.0501
N985 G1 X162.753 Y282.653 E.0501
N986 G1 X162.543 Y281.858 E.02968
N987 G1 X155.053 Y198.437 E3.02412
N988 G1 X155.043 Y121.783 E2.76768
N989 G1 X155.418 Y120.509 E.04794
N990 ; OBJECT_ID: 130
N991 ; WIPE_START
N992 G1 X156.009 Y119.83 E-.34205
N993 M73 P26 R27
N994 G1 X156.883 Y119.162 E-.41795
N995 ; WIPE_END
N996 G1 E-.04 F1800
N997 ; start printing object, unique label id: 130
N998 M624 AQAAAAAAAAA=
N999 M204 S6000
N1000 G1 X159.945 Y126.154 Z.6 F60000
N1001 G1 X190.729 Y196.446 Z.6
N1002 G1 Z.2
N1003 G1 E.8 F1800
N1004 ; FEATURE: Inner wall
N1005 G1 F3000
N1006 M204 S500
N1007 G1 X159.271 Y196.446 E1.13581
N1008 G1 X159.271 Y123.554 E2.63184
N1009 G1 X190.729 Y123.554 E1.13581
N1010 G1 X190.729 Y196.386 E2.62968
N1011 M204 S6000
N1012 G1 X191.186 Y196.903 F60000
N1013 G1 F3000
N1014 M204 S500
N1015 G1 X158.814 Y196.903 E1.16881
N1016 G1 X158.814 Y123.097 E2.66485
N1017 G1 X191.186 Y123.097 E1.16881
N1018 G1 X191.186 Y196.843 E2.66268
N1019 M204 S6000
N1020 G1 X191.643 Y197.36 F60000
N1021 G1 F3000
N1022 M204 S500
N1023 G1 X158.357 Y197.36 E1.20182
N1024 G1 X158.357 Y122.64 E2.69786
N1025 G1 X191.643 Y122.64 E1.20182
N1026 G1 X191.643 Y197.3 E2.69569
N1027 M204 S6000
N1028 G1 X192.1 Y197.817 F60000
N1029 ; FEATURE: Outer wall
N1030 G1 F3000
N1031 M204 S500
N1032 G1 X157.9 Y197.817 E1.23483
N1033 G1 X157.9 Y122.183 E2.73086
N1034 G1 X192.1 Y122.183 E1.23483
N1035 G1 X192.1 Y197.757 E2.7287
N1036 G1 E-.8 F1800
N1037 M204 S6000
N1038 G1 X191.844 Y190.129 Z.6 F60000
N1039 G1 X189.619 Y123.737 Z.6
N1040 G1 Z.2
N1041 G1 E.8 F1800
N1042 ; FEATURE: Bottom surface
N1043 ; LINE_WIDTH: 0.50125
N1044 G1 F6300
N1045 M204 S500
N1046 G1 X190.34 Y124.458 E.03691
N1047 G1 X190.34 Y125.106 E.02347
N1048 G1 X189.177 Y123.942 E.05957
N1049 G1 X188.529 Y123.942 E.02347
N1050 G1 X190.34 Y125.754 E.09276
N1051 M73 P27 R27
N1052 G1 X190.34 Y126.402 E.02347
N1053 G1 X187.881 Y123.942 E.12594
N1054 G1 X187.232 Y123.942 E.02347
N1055 G1 X190.34 Y127.05 E.15913
N1056 G1 X190.34 Y127.699 E.02347
N1057 G1 X186.584 Y123.942 E.19232
N1058 G1 X185.936 Y123.942 E.02347
N1059 G1 X190.34 Y128.347 E.22551
N1060 G1 X190.34 Y128.995 E.02347
N1061 G1 X185.288 Y123.942 E.25869
N1062 G1 X184.64 Y123.942 E.02347
N1063 G1 X190.34 Y129.643 E.29188
N1064 G1 X190.34 Y130.291 E.02347
N1065 G1 X183.991 Y123.942 E.32507
N1066 G1 X183.343 Y123.942 E.02347
N1067 G1 X190.34 Y130.939 E.35826
N1068 G1 X190.34 Y131.588 E.02347
N1069 G1 X182.695 Y123.942 E.39144
N1070 G1 X182.047 Y123.942 E.02347
N1071 G1 X190.34 Y132.236 E.42463
N1072 G1 X190.34 Y132.884 E.02347
N1073 G1 X181.399 Y123.942 E.45782
N1074 G1 X180.751 Y123.942 E.02347
N1075 G1 X190.34 Y133.532 E.49101
N1076 G1 X190.34 Y134.18 E.02347
N1077 G1 X180.102 Y123.942 E.52419
N1078 G1 X179.454 Y123.942 E.02347
N1079 G1 X190.34 Y134.829 E.55738
N1080 G1 X190.34 Y135.477 E.02347
N1081 G1 X178.806 Y123.942 E.59057
N1082 G1 X178.158 Y123.942 E.02347
N1083 G1 X190.34 Y136.125 E.62376
N1084 G1 X190.34 Y136.773 E.02347
N1085 G1 X177.51 Y123.942 E.65694
N1086 G1 X176.862 Y123.942 E.02347
N1087 G1 X190.34 Y137.421 E.69013
N1088 G1 X190.34 Y138.069 E.02347
N1089 G1 X176.213 Y123.942 E.72332
N1090 G1 X175.565 Y123.942 E.02347
N1091 G1 X190.34 Y138.718 E.75651
N1092 G1 X190.34 Y139.366 E.02347
N1093 G1 X174.917 Y123.942 E.78969
N1094 G1 X174.269 Y123.942 E.02347
N1095 G1 X190.34 Y140.014 E.82288
N1096 G1 X190.34 Y140.662 E.02347
N1097 G1 X173.621 Y123.942 E.85607
N1098 G1 X172.972 Y123.942 E.02347
N1099 G1 X190.34 Y141.31 E.88926
N1100 G1 X190.34 Y141.958 E.02347
N1101 G1 X172.324 Y123.942 E.92244
N1102 G1 X171.676 Y123.942 E.02347
N1103 G1 X190.34 Y142.607 E.95563
N1104 G1 X190.34 Y143.255 E.02347
N1105 G1 X171.028 Y123.942 E.98882
N1106 G1 X170.38 Y123.942 E.02347
N1107 G1 X190.34 Y143.903 E1.02201
N1108 G1 X190.34 Y144.551 E.02347
N1109 G1 X169.732 Y123.942 E1.05519
N1110 G1 X169.083 Y123.942 E.02347
N1111 G1 X190.34 Y145.199 E1.08838
N1112 G1 X190.34 Y145.848 E.02347
N1113 G1 X168.435 Y123.942 E1.12157
N1114 G1 X167.787 Y123.942 E.02347
N1115 G1 X190.34 Y146.496 E1.15476
N1116 G1 X190.34 Y147.144 E.02347
N1117 G1 X167.139 Y123.942 E1.18794
N1118 G1 X166.491 Y123.942 E.02347
N1119 G1 X190.34 Y147.792 E1.22113
N1120 G1 X190.34 Y148.44 E.02347
N1121 G1 X165.843 Y123.942 E1.25432
N1122 G1 X165.194 Y123.942 E.02347
N1123 G1 X190.34 Y149.088 E1.28751
N1124 G1 X190.34 Y149.737 E.02347
N1125 G1 X164.546 Y123.942 E1.32069
N1126 G1 X163.898 Y123.942 E.02347
N1127 G1 X190.34 Y150.385 E1.35388
N1128 G1 X190.34 Y151.033 E.02347
N1129 G1 X163.25 Y123.942 E1.38707
N1130 G1 X162.602 Y123.942 E.02347
N1131 G1 X190.34 Y151.681 E1.42026
N1132 G1 X190.34 Y152.329 E.02347
N1133 G1 X161.953 Y123.942 E1.45344
N1134 G1 X161.305 Y123.942 E.02347
N1135 G1 X190.34 Y152.977 E1.48663
N1136 G1 X190.34 Y153.626 E.02347
N1137 G1 X160.657 Y123.942 E1.51982
N1138 G1 X160.009 Y123.942 E.02347
N1139 G1 X190.34 Y154.274 E1.55301
N1140 G1 X190.34 Y154.922 E.02347
N1141 G1 X159.66 Y124.241 E1.57089
N1142 G1 X159.66 Y124.89 E.02347
N1143 G1 X190.34 Y155.57 E1.57089
N1144 G1 X190.34 Y156.218 E.02347
N1145 G1 X159.66 Y125.538 E1.57089
N1146 G1 X159.66 Y126.186 E.02347
N1147 G1 X190.34 Y156.867 E1.57089
N1148 G1 X190.34 Y157.515 E.02347
N1149 G1 X159.66 Y126.834 E1.57089
N1150 G1 X159.66 Y127.482 E.02347
N1151 G1 X190.34 Y158.163 E1.57089
N1152 G1 X190.34 Y158.811 E.02347
N1153 M73 P28 R26
N1154 G1 X159.66 Y128.13 E1.57089
N1155 G1 X159.66 Y128.779 E.02347
N1156 G1 X190.34 Y159.459 E1.57089
N1157 G1 X190.34 Y160.107 E.02347
N1158 G1 X159.66 Y129.427 E1.57089
N1159 G1 X159.66 Y130.075 E.02347
N1160 G1 X190.34 Y160.756 E1.57089
N1161 G1 X190.34 Y161.404 E.02347
N1162 G1 X159.66 Y130.723 E1.57089
N1163 G1 X159.66 Y131.371 E.02347
N1164 G1 X190.34 Y162.052 E1.57089
N1165 G1 X190.34 Y162.7 E.02347
N1166 G1 X159.66 Y132.02 E1.57089
N1167 G1 X159.66 Y132.668 E.02347
N1168 G1 X190.34 Y163.348 E1.57089
N1169 G1 X190.34 Y163.996 E.02347
N1170 G1 X159.66 Y133.316 E1.57089
N1171 G1 X159.66 Y133.964 E.02347
N1172 G1 X190.34 Y164.645 E1.57089
N1173 G1 X190.34 Y165.293 E.02347
N1174 G1 X159.66 Y134.612 E1.57089
N1175 G1 X159.66 Y135.26 E.02347
N1176 G1 X190.34 Y165.941 E1.57089
N1177 G1 X190.34 Y166.589 E.02347
N1178 G1 X159.66 Y135.909 E1.57089
N1179 G1 X159.66 Y136.557 E.02347
N1180 G1 X190.34 Y167.237 E1.57089
N1181 G1 X190.34 Y167.886 E.02347
N1182 G1 X159.66 Y137.205 E1.57089
N1183 G1 X159.66 Y137.853 E.02347
N1184 G1 X190.34 Y168.534 E1.57089
N1185 G1 X190.34 Y169.182 E.02347
N1186 G1 X159.66 Y138.501 E1.57089
N1187 G1 X159.66 Y139.149 E.02347
N1188 G1 X190.34 Y169.83 E1.57089
N1189 G1 X190.34 Y170.478 E.02347
N1190 G1 X159.66 Y139.798 E1.57089
N1191 G1 X159.66 Y140.446 E.02347
N1192 G1 X190.34 Y171.126 E1.57089
N1193 G1 X190.34 Y171.775 E.02347
N1194 G1 X159.66 Y141.094 E1.57089
N1195 G1 X159.66 Y141.742 E.02347
N1196 M104 T0 S230 N0 ;Multi extruder pre heating
N1197 G1 X190.34 Y172.423 E1.57089
N1198 G1 X190.34 Y173.071 E.02347
N1199 G1 X159.66 Y142.39 E1.57089
N1200 G1 X159.66 Y143.039 E.02347
N1201 G1 X190.34 Y173.719 E1.57089
N1202 G1 X190.34 Y174.367 E.02347
N1203 G1 X159.66 Y143.687 E1.57089
N1204 G1 X159.66 Y144.335 E.02347
N1205 G1 X190.34 Y175.015 E1.57089
N1206 G1 X190.34 Y175.664 E.02347
N1207 G1 X159.66 Y144.983 E1.57089
N1208 G1 X159.66 Y145.631 E.02347
N1209 G1 X190.34 Y176.312 E1.57089
N1210 G1 X190.34 Y176.96 E.02347
N1211 G1 X159.66 Y146.279 E1.57089
N1212 G1 X159.66 Y146.928 E.02347
N1213 G1 X190.34 Y177.608 E1.57089
N1214 G1 X190.34 Y178.256 E.02347
N1215 G1 X159.66 Y147.576 E1.57089
N1216 G1 X159.66 Y148.224 E.02347
N1217 G1 X190.34 Y178.905 E1.57089
N1218 G1 X190.34 Y179.553 E.02347
N1219 G1 X159.66 Y148.872 E1.57089
N1220 G1 X159.66 Y149.52 E.02347
N1221 G1 X190.34 Y180.201 E1.57089
N1222 G1 X190.34 Y180.849 E.02347
N1223 G1 X159.66 Y150.168 E1.57089
N1224 G1 X159.66 Y150.817 E.02347
N1225 G1 X190.34 Y181.497 E1.57089
N1226 G1 X190.34 Y182.145 E.02347
N1227 M73 P29 R26
N1228 G1 X159.66 Y151.465 E1.57089
N1229 G1 X159.66 Y152.113 E.02347
N1230 G1 X190.34 Y182.794 E1.57089
N1231 G1 X190.34 Y183.442 E.02347
N1232 G1 X159.66 Y152.761 E1.57089
N1233 G1 X159.66 Y153.409 E.02347
N1234 G1 X190.34 Y184.09 E1.57089
N1235 G1 X190.34 Y184.738 E.02347
N1236 G1 X159.66 Y154.058 E1.57089
N1237 G1 X159.66 Y154.706 E.02347
N1238 G1 X190.34 Y185.386 E1.57089
N1239 G1 X190.34 Y186.034 E.02347
N1240 G1 X159.66 Y155.354 E1.57089
N1241 G1 X159.66 Y156.002 E.02347
N1242 G1 X190.34 Y186.683 E1.57089
N1243 G1 X190.34 Y187.331 E.02347
N1244 G1 X159.66 Y156.65 E1.57089
N1245 G1 X159.66 Y157.298 E.02347
N1246 G1 X190.34 Y187.979 E1.57089
N1247 G1 X190.34 Y188.627 E.02347
N1248 G1 X159.66 Y157.947 E1.57089
N1249 G1 X159.66 Y158.595 E.02347
N1250 G1 X190.34 Y189.275 E1.57089
N1251 G1 X190.34 Y189.924 E.02347
N1252 G1 X159.66 Y159.243 E1.57089
N1253 G1 X159.66 Y159.891 E.02347
N1254 G1 X190.34 Y190.572 E1.57089
N1255 G1 X190.34 Y191.22 E.02347
N1256 G1 X159.66 Y160.539 E1.57089
N1257 G1 X159.66 Y161.187 E.02347
N1258 G1 X190.34 Y191.868 E1.57089
N1259 G1 X190.34 Y192.516 E.02347
N1260 G1 X159.66 Y161.836 E1.57089
N1261 G1 X159.66 Y162.484 E.02347
N1262 G1 X190.34 Y193.164 E1.57089
N1263 G1 X190.34 Y193.813 E.02347
N1264 G1 X159.66 Y163.132 E1.57089
N1265 G1 X159.66 Y163.78 E.02347
N1266 G1 X190.34 Y194.461 E1.57089
N1267 G1 X190.34 Y195.109 E.02347
N1268 G1 X159.66 Y164.428 E1.57089
N1269 G1 X159.66 Y165.077 E.02347
N1270 G1 X190.34 Y195.757 E1.57089
N1271 G1 X190.34 Y196.058 E.01088
N1272 G1 X189.993 Y196.058 E.01259
N1273 G1 X159.66 Y165.725 E1.55308
N1274 G1 X159.66 Y166.373 E.02347
N1275 G1 X189.344 Y196.058 E1.51989
N1276 G1 X188.696 Y196.058 E.02347
N1277 G1 X159.66 Y167.021 E1.48671
N1278 G1 X159.66 Y167.669 E.02347
N1279 G1 X188.048 Y196.058 E1.45352
N1280 G1 X187.4 Y196.058 E.02347
N1281 G1 X159.66 Y168.317 E1.42033
N1282 G1 X159.66 Y168.966 E.02347
N1283 G1 X186.752 Y196.058 E1.38714
N1284 G1 X186.103 Y196.058 E.02347
N1285 G1 X159.66 Y169.614 E1.35396
N1286 G1 X159.66 Y170.262 E.02347
N1287 G1 X185.455 Y196.058 E1.32077
N1288 G1 X184.807 Y196.058 E.02347
N1289 G1 X159.66 Y170.91 E1.28758
N1290 G1 X159.66 Y171.558 E.02347
N1291 G1 X184.159 Y196.058 E1.25439
N1292 G1 X183.511 Y196.058 E.02347
N1293 G1 X159.66 Y172.206 E1.22121
N1294 G1 X159.66 Y172.855 E.02347
N1295 G1 X182.863 Y196.058 E1.18802
N1296 G1 X182.214 Y196.058 E.02347
N1297 G1 X159.66 Y173.503 E1.15483
N1298 G1 X159.66 Y174.151 E.02347
N1299 G1 X181.566 Y196.058 E1.12164
N1300 G1 X180.918 Y196.058 E.02347
N1301 M73 P30 R26
N1302 G1 X159.66 Y174.799 E1.08846
N1303 G1 X159.66 Y175.447 E.02347
N1304 G1 X180.27 Y196.058 E1.05527
N1305 G1 X179.622 Y196.058 E.02347
N1306 G1 X159.66 Y176.096 E1.02208
N1307 G1 X159.66 Y176.744 E.02347
N1308 G1 X178.974 Y196.058 E.98889
N1309 G1 X178.325 Y196.058 E.02347
N1310 G1 X159.66 Y177.392 E.95571
N1311 G1 X159.66 Y178.04 E.02347
N1312 G1 X177.677 Y196.058 E.92252
N1313 G1 X177.029 Y196.058 E.02347
N1314 G1 X159.66 Y178.688 E.88933
N1315 G1 X159.66 Y179.336 E.02347
N1316 G1 X176.381 Y196.058 E.85614
N1317 G1 X175.733 Y196.058 E.02347
N1318 G1 X159.66 Y179.985 E.82296
N1319 G1 X159.66 Y180.633 E.02347
N1320 G1 X175.084 Y196.058 E.78977
N1321 G1 X174.436 Y196.058 E.02347
N1322 G1 X159.66 Y181.281 E.75658
N1323 G1 X159.66 Y181.929 E.02347
N1324 G1 X173.788 Y196.058 E.72339
N1325 G1 X173.14 Y196.058 E.02347
N1326 G1 X159.66 Y182.577 E.69021
N1327 G1 X159.66 Y183.225 E.02347
N1328 G1 X172.492 Y196.058 E.65702
N1329 G1 X171.844 Y196.058 E.02347
N1330 G1 X159.66 Y183.874 E.62383
N1331 G1 X159.66 Y184.522 E.02347
N1332 G1 X171.195 Y196.058 E.59064
N1333 G1 X170.547 Y196.058 E.02347
N1334 G1 X159.66 Y185.17 E.55746
N1335 G1 X159.66 Y185.818 E.02347
N1336 G1 X169.899 Y196.058 E.52427
N1337 G1 X169.251 Y196.058 E.02347
N1338 G1 X159.66 Y186.466 E.49108
N1339 G1 X159.66 Y187.115 E.02347
N1340 G1 X168.603 Y196.058 E.45789
N1341 G1 X167.955 Y196.058 E.02347
N1342 G1 X159.66 Y187.763 E.42471
N1343 G1 X159.66 Y188.411 E.02347
N1344 G1 X167.306 Y196.058 E.39152
N1345 G1 X166.658 Y196.058 E.02347
N1346 G1 X159.66 Y189.059 E.35833
N1347 G1 X159.66 Y189.707 E.02347
N1348 G1 X166.01 Y196.058 E.32514
N1349 G1 X165.362 Y196.058 E.02347
N1350 G1 X159.66 Y190.355 E.29196
N1351 G1 X159.66 Y191.004 E.02347
N1352 G1 X164.714 Y196.058 E.25877
N1353 G1 X164.065 Y196.058 E.02347
N1354 G1 X159.66 Y191.652 E.22558
N1355 G1 X159.66 Y192.3 E.02347
N1356 G1 X163.417 Y196.058 E.19239
N1357 G1 X162.769 Y196.058 E.02347
N1358 G1 X159.66 Y192.948 E.15921
N1359 G1 X159.66 Y193.596 E.02347
N1360 G1 X162.121 Y196.058 E.12602
N1361 G1 X161.473 Y196.058 E.02347
N1362 G1 X159.66 Y194.244 E.09283
N1363 G1 X159.66 Y194.893 E.02347
N1364 G1 X160.825 Y196.058 E.05964
N1365 G1 X160.176 Y196.058 E.02347
N1366 G1 X159.454 Y195.335 E.03699
N1367 ; WIPE_START
N1368 G1 X160.176 Y196.058 E-.38822
N1369 G1 X160.825 Y196.058 E-.2463
N1370 G1 X160.591 Y195.824 E-.12548
N1371 ; WIPE_END
N1372 G1 E-.04 F1800
N1373 M204 S6000
N1374 G17
N1375 G3 Z.6 I1.217 J0 P1  F60000
N1376 ; stop printing object, unique label id: 130
N1377 M625
N1378 ; object ids of layer 1 start: 130,138
N1379 M624 AwAAAAAAAAA=
N1380 ;======== H2D 20250527========
N1381 ; SKIPPABLE_START
N1382 ; SKIPTYPE: timelapse
N1383 M622.1 S1 ; for prev firware, default turned on
N1384 
N1385 M1002 judge_flag timelapse_record_flag
N1386 
N1387 M622 J1
N1388 M993 A2 B2 C2
N1389 M993 A0 B0 C0
N1390 
N1391 
N1392 
N1393 
N1394     M9711 M0 E1 X260 Y137 Z0.6 S11 C10 O0 T3000
N1395 
N1396 
N1397 
N1398 M993 A3 B3 C3
N1399 
N1400 M623
N1401 ; SKIPPABLE_END
N1402 
N1403 ; object ids of this layer1 end: 130,138
N1404 M625
N1405 G1 X195.495 Y279.064
N1406 G1 Z.2
N1407 G1 E.8 F1800
N1408 ; LAYER_HEIGHT: 0.200000
N1409 ; FEATURE: Prime tower
N1410 ; LINE_WIDTH: 0.500000
N1411 ; WIPE_TOWER_START
N1412 M204 S6000
N1413 G1  X195.995 Y279.564  
N1414 M204 S500
N1415 G3  X193.533 Y281.605   I-4.373 J-2.768 E0.1236 F3000
N1416 G3  X190.885 Y280.355   I0.012 J-3.454 E0.1149
N1417 G2  X188.182 Y279.564   I-2.709 J4.247 E0.1085
N1418 G2  X174.618 Y279.568   I-6.687 J357.435 E0.5155
N1419 G2  X170.683 Y281.445   I0.499 J6.110 E0.1694
N1420 G3  X168.371 Y281.015   I-0.854 J-1.838 E0.0953
N1421 G1  X166.995 Y279.564   E0.0760
N1422 G3  X165.064 Y277.242   I3.871 J-5.183 E0.1159
N1423 G3  X166.240 Y274.649   I2.902 J-0.247 E0.1130
N1424 G2  X166.995 Y272.245   I-3.465 J-2.409 E0.0972
N1425 G2  X166.992 Y259.212   I-321.195 J-6.431 E0.4954
N1426 G2  X165.146 Y255.634   I-6.663 J1.171 E0.1554
N1427 G3  X165.661 Y253.471   I1.721 J-0.733 E0.0905
N1428 G1 E-0.8000 F1800
N1429 M204 S6000
N1430 G1  X167.381 Y251.657   F600
N1431 G1 E0.8000 F1800
N1432 M204 S500
N1433 G3  X170.238 Y250.033   I2.765 J1.539 E0.1313 F3000
N1434 G3  X172.775 Y251.633   I-12.405 J22.473 E0.1141
N1435 G2  X174.808 Y252.064   I2.042 J-4.626 E0.0796
N1436 G2  X188.372 Y252.060   I6.687 J-357.435 E0.5155
N1437 G2  X192.307 Y250.183   I-0.499 J-6.110 E0.1694
N1438 G3  X194.619 Y250.613   I0.854 J1.838 E0.0953
N1439 G1  X195.995 Y252.064   E0.0760
N1440 M73 P30 R25
N1441 G1 E0.0000
N1442 G3  X197.926 Y254.386   I-3.871 J5.182 E0.1159
N1443 G3  X196.750 Y256.979   I-2.902 J0.247 E0.1130
N1444 G2  X195.995 Y259.382   I3.464 J2.409 E0.0972
N1445 G2  X195.998 Y272.416   I321.212 J6.432 E0.4954
N1446 G2  X197.844 Y275.994   I6.663 J-1.171 E0.1554
N1447 G3  X197.504 Y277.972   I-1.658 J0.734 E0.0808
N1448 G1  X195.995 Y279.564   E0.0834
N1449 ; WIPE_TOWER_END
N1450 G1  X195.495 Y252.064  
N1451 ; LAYER_HEIGHT: 0.200000
N1452 ; FEATURE: Prime tower
N1453 ; LINE_WIDTH: 0.500000
N1454 ; WIPE_TOWER_START
N1455 M204 S500
N1456 G1  X167.495  E1.0642
N1457 G1  Y272.314  E0.2565
N1458 G1  X195.495  E1.0642
N1459 G1  Y279.064  E0.2565
N1460 M204 S6000
N1461 G1  X168.495 Y272.314  
N1462 ;--------------------
N1463 ; CP EMPTY GRID START
N1464 ; layer #2
N1465 M204 S500
N1466 G1  Y272.814  E0.0190
N1467 G1  X194.995  E1.0072
N1468 G1  Y273.337  E0.0199
N1469 G1  X167.995  E1.0262
N1470 G1  Y273.859  E0.0199
N1471 G1  X194.995  E1.0262
N1472 G1  Y274.382  E0.0199
N1473 G1  X167.995  E1.0262
N1474 G1  Y274.905  E0.0199
N1475 G1  X194.995  E1.0262
N1476 G1  Y275.428  E0.0199
N1477 G1  X167.995  E1.0262
N1478 G1  Y275.950  E0.0199
N1479 G1  X194.995  E1.0262
N1480 G1  Y276.473  E0.0199
N1481 M73 P31 R25
N1482 G1  X167.995  E1.0262
N1483 G1  Y276.996  E0.0199
N1484 G1  X194.995  E1.0262
N1485 G1  Y277.519  E0.0199
N1486 G1  X167.995  E1.0262
N1487 G1  Y278.041  E0.0199
N1488 G1  X194.995  E1.0262
N1489 G1  Y278.564  E0.0199
N1490 G1  X167.995  E1.0262
N1491 G1  Y279.064  E0.0190
N1492 ; CP EMPTY GRID END
N1493 ;------------------
N1494 
N1495 
N1496 
N1497 
N1498 
N1499 
N1500 ; WIPE_TOWER_END
N1501 ; LAYER_HEIGHT: 0.200000
N1502 ; FEATURE: Prime tower
N1503 ; LINE_WIDTH: 0.500000
N1504 ;--------------------
N1505 ; CP TOOLCHANGE START
N1506 ; toolchange #1
N1507 ; material : TPU-AMS -> TPU-AMS
N1508 ;--------------------
N1509 M220 B
N1510 M220 S100
N1511 ; WIPE_TOWER_START
N1512 G1 E-.8 F1800
N1513 G17
N1514 G3 Z.6 I1.217 J0 P1  F60000
N1515 G1 X167.745 Y266.314 Z.2
N1516 G1 E.8 F1800
N1517 ; LAYER_HEIGHT: 0.200000
N1518 ; FEATURE: Prime tower
N1519 ; LINE_WIDTH: 1.000000
N1520 ; NOZZLE_CHANGE_START OF0 NF2
N1521 M204 S500
N1522 G1  X195.245 Y266.314  E2.1885 F3605
N1523 G1  Y267.314  E0.0796
N1524 G1  X167.745  E2.1885
N1525 G1  Y268.314  E0.0796
N1526 G1  X195.245  E2.1885
N1527 G1  Y269.314  E0.0796
N1528 G1  X167.745  E2.1885
N1529 G1  Y270.314  E0.0796
N1530 G1  X195.245  E2.1885
N1531 G1  Y271.314  E0.0796
N1532 G1  X167.745  E2.1885
N1533 ; NOZZLE_CHANGE_END OF0 NF2
N1534 M104 T1 S121 N0 ;Multi extruder pre cooling
N1535 
N1536 ; WIPE_START
N1537 G1 F5400
N1538 M204 S500
N1539 G1 X169.745 Y271.314 E-1.9
N1540 ; WIPE_END
N1541 G1 E-.1 F1800
N1542 M204 S6000
N1543 G17
N1544 G3 Z.6 I1.217 J0 P1  F5400
N1545 ; filament end gcode 
N1546 
N1547 ;======== H2D ========
N1548 ;===== 20250604 =====
N1549 M993 A2 B2 C2 ; nozzle cam detection allow status save.
N1550 M993 A0 B0 C0 ; nozzle cam detection not allowed.
N1551 
N1552 
N1553 M1015.4 S0 ; disable E air printing detect
N1554 
N1555 
N1556 M620 S2A
N1557 M1002 gcode_claim_action : 4
N1558 M204 S9000
N1559 
N1560 G1 Z3.2 F1200
N1561 
N1562 M400
N1563 M106 P1 S0
N1564 M106 P2 S0
N1565 
N1566 
N1567 
N1568 
N1569 M620.10 A0 F286.867 L0 H0.4 T270 P255 S1
N1570 
N1571 
N1572 
N1573 M620.10 A1 F261.922 L0 H0.4 T250 P230 S1
N1574 
N1575 
N1576 
N1577 M620.11 P0 I0 E0
N1578 
N1579 
N1580 
N1581 M620.11 K1 I0 R10 F286.867
N1582 
N1583 
N1584 M628 S1
N1585 
N1586 
N1587 M620.11 S1 L0 I0 R10 D8 E-10 F286.867
N1588 
N1589 
N1590 M629
N1591 
N1592 
N1593 M620.11 H0
N1594 
N1595 
N1596 T2
N1597 M73 E5
N1598 
N1599 ;deretract
N1600 
N1601 
N1602 ;VG1 E4 F261
N1603 ;VG1 E4 F130
N1604 
N1605 
N1606 
N1607 ; VFLUSH_START
N1608 
N1609 
N1610 ;VG1 E0 F261
N1611 
N1612 
N1613 SYNC T0
N1614 
N1615 ; VFLUSH_END
N1616 
N1617 M1002 set_filament_type:TPU-AMS
N1618 
N1619 M400
N1620 M83
N1621 
N1622 
N1623 
N1624 M628 S0
N1625 ;VM109 S230
N1626 M629
N1627 M400
N1628 
N1629 M983.3 F4.375 A0.4
N1630 
N1631 
N1632 M400
N1633 
N1634 M73 P32 R25
N1635 G1 Y320 F30000
N1636 M73 P33 R25
N1637 G1 X201
N1638 
N1639 G1 Y295
N1640 G1 Y265 F18000
N1641 G1 Z3.2 F3000
N1642 
N1643 M204 S500
N1644 
N1645 
N1646 M621 S2A
N1647 
N1648 M993 A3 B3 C3 ; nozzle cam detection allow status restore.
N1649 
N1650 
N1651 M1015.3 S0;disable tpu clog detect
N1652 
N1653 
N1654 
N1655 M1015.4 S0 ; disable E air printing detect
N1656 
N1657 
N1658 M620.6 I2 W1 ;enable ams air printing detect
N1659 M1002 gcode_claim_action : 0
N1660 M106 S0
N1661 M106 P2 S0
N1662 G1 X200 Y264.673 F60000
N1663 G1 Z.2
N1664 G1 X200 Y257.04 Z.6
N1665 G1 X200 Y247.99 Z.6
N1666 G1 X162.991 Y247.99
N1667 G1 X162.991 Y252.564
N1668 G1 X167.495 Y252.564
N1669 
N1670 ; filament start gcode
N1671 G1 Z.2
N1672 
N1673 G4 S0
N1674 ; CP TOOLCHANGE WIPE
N1675 ; LINE_WIDTH: 0.500000
N1676 ; LINE_WIDTH: 0.575000
N1677 M204 S500
N1678 G1  X170.495 Y252.564  E0.1311 F990
N1679 G1 E-0.8000 F1800
N1680 M204 S6000
N1681 G1  X165.995  F600
N1682 G1  X167.495  F240
N1683 G1  X167.995  F600
N1684 G1  Y253.064 
N1685 G1  X166.995 
N1686 G1  Y252.064 
N1687 G1  X168.495 
N1688 G1  Y253.564 
N1689 G1  X166.495 
N1690 G1  Y251.564 
N1691 G1  X170.495 Y252.564   F990
N1692 G1 E0.8000 F1800
N1693 M204 S500
N1694 G1  X195.495  E1.0927 F990
N1695 G1  Y253.064  E0.0219
N1696 G1  X167.495  E1.2238 F1125
N1697 G1  Y253.564  E0.0219
N1698 M73 P33 R24
N1699 G1  X195.495  E1.2238 F1374
N1700 G1  Y254.064  E0.0219
N1701 G1  X167.495  E1.2238 F2625
N1702 G1  Y254.564  E0.0219
N1703 G1  X195.495  E1.2238 F2675
N1704 G1  Y255.064  E0.0219
N1705 G1  X167.495  E1.2238 F2725
N1706 G1  Y255.564  E0.0219
N1707 G1  X195.495  E1.2238 F2775
N1708 G1  Y256.064  E0.0219
N1709 G1  X167.495  E1.2238 F2825
N1710 G1  Y256.564  E0.0219
N1711 G1  X195.495  E1.2238 F2875
N1712 G1  Y257.064  E0.0219
N1713 G1  X167.495  E1.2238 F2925
N1714 G1  Y257.564  E0.0219
N1715 G1  X195.495  E1.2238 F2975
N1716 G1  Y258.064  E0.0219
N1717 G1  X167.495  E1.2238 F3000
N1718 G1  Y258.564  E0.0219
N1719 G1  X195.495  E1.2238
N1720 G1  Y259.064  E0.0219
N1721 G1  X167.495  E1.2238
N1722 G1  Y259.564  E0.0219
N1723 G1  X195.495  E1.2238
N1724 G1  Y260.064  E0.0219
N1725 G1  X167.495  E1.2238
N1726 G1  Y260.564  E0.0219
N1727 G1  X195.495  E1.2238
N1728 G1  Y261.064  E0.0219
N1729 G1  X167.495  E1.2238
N1730 G1  Y261.564  E0.0219
N1731 G1  X195.495  E1.2238
N1732 G1  Y262.064  E0.0219
N1733 G1  X167.495  E1.2238
N1734 G1  Y262.564  E0.0219
N1735 G1  X195.495  E1.2238
N1736 G1  Y263.064  E0.0219
N1737 M73 P34 R24
N1738 G1  X167.495  E1.2238
N1739 G1  Y263.564  E0.0219
N1740 G1  X195.495  E1.2238
N1741 G1  Y264.064  E0.0219
N1742 G1  X167.495  E1.2238
N1743 G1  Y264.564  E0.0219
N1744 G1  X195.495  E1.2238
N1745 G1  Y265.064  E0.0219
N1746 G1  X167.495  E1.2238
N1747 G1  Y265.564  E0.0219
N1748 G1  X195.495  E1.2238
N1749 ; LINE_WIDTH: 0.500000
N1750 ; WIPE_TOWER_END
N1751 M220 R
N1752 G1 F60000
N1753 G4 S0
N1754 G92 E0
N1755 ; CP TOOLCHANGE END
N1756 ;------------------
N1757 
N1758 
N1759 
N1760 ; WIPE_START
N1761 G1 F5400
N1762 M204 S500
N1763 G1 X193.495 Y265.564 E-.76
N1764 ; WIPE_END
N1765 G1 E-.04 F1800
N1766 M204 S6000
N1767 G17
N1768 G3 Z.6 I1.217 J0 P1  F60000
N1769 ; OBJECT_ID: 138
N1770 ; start printing object, unique label id: 138
N1771 M624 AgAAAAAAAAA=
N1772 G1 X182.3 Y114.858 Z.2
N1773 G1 E.8 F1800
N1774 ; FEATURE: Outer wall
N1775 ; LINE_WIDTH: 0.5
N1776 ; LAYER_HEIGHT: 0.2
N1777 G1 F3000
N1778 M204 S500
N1779 G1 X167.8 Y114.858 E.55109
N1780 G1 X167.8 Y114.358 E.019
N1781 G1 X182.3 Y114.358 E.55109
N1782 G1 X182.3 Y114.798 E.01672
N1783 ; CHANGE_LAYER
N1784 ; Z_HEIGHT: 0.4
N1785 ; LAYER_HEIGHT: 0.2
N1786 ; WIPE_START
N1787 G1 F3000
N1788 G1 X180.3 Y114.806 E-.76
N1789 ; WIPE_END
N1790 G1 E-.04 F1800
N1791 ; stop printing object, unique label id: 138
N1792 M625
N1793 ;======== H2D 20250521========
N1794 ; layer num/total_layer_count: 2/63
N1795 ; update layer progress
N1796 M73 L2
N1797 M991 S0 P1 ;notify layer change
N1798 
N1799 
N1800 M106 S25.5
N1801 M106 P2 S255
N1802 ; open powerlost recovery
N1803 M1003 S1
N1804 ; OBJECT_ID: 138
N1805 ; start printing object, unique label id: 138
N1806 M624 AgAAAAAAAAA=
N1807 M204 S10000
N1808 G17
N1809 G3 Z.6 I-.055 J1.216 P1  F60000
N1810 G1 X182.34 Y114.898 Z.6
N1811 G1 Z.4
N1812 G1 E.8 F1800
N1813 ; FEATURE: Outer wall
N1814 ; LINE_WIDTH: 0.42
N1815 ; LAYER_HEIGHT: 0.2
N1816 G1 F8353.673
N1817 M204 S5000
N1818 G1 X167.76 Y114.898 E.45715
N1819 G1 X167.76 Y114.318 E.01819
N1820 G1 X182.34 Y114.318 E.45715
N1821 G1 X182.34 Y114.838 E.0163
N1822 M204 S10000
N1823 G1 X182.144 Y114.608 F60000
N1824 ; FEATURE: Gap infill
N1825 ; LINE_WIDTH: 0.23088
N1826 G1 F15000
N1827 M204 S8000
N1828 G1 X167.956 Y114.608 E.22174
N1829 ; WIPE_START
N1830 G1 X169.956 Y114.608 E-.76
N1831 ; WIPE_END
N1832 G1 E-.04 F1800
N1833 ; stop printing object, unique label id: 138
N1834 M625
N1835 M204 S10000
N1836 G17
N1837 G3 Z.8 I-1.2 J.203 P1  F60000
N1838 G1 X195.495 Y265.564 Z.8
N1839 G1 Z.4
N1840 G1 E.8 F1800
N1841 ; LAYER_HEIGHT: 0.200000
N1842 ; FEATURE: Prime tower
N1843 ; LINE_WIDTH: 0.500000
N1844 ; WIPE_TOWER_START
N1845 M204 S8000
N1846 G1  X167.495 Y265.564  E1.0642 F5400
N1847 G1  Y260.064  E0.2090
N1848 G1  X195.495  E1.0642
N1849 G1  Y265.564  E0.2090
N1850 M204 S10000
N1851 G1  X168.495 Y260.064  
N1852 M104 T1 S255 N0 ;Multi extruder pre heating
N1853 ;--------------------
N1854 ; CP EMPTY GRID START
N1855 ; layer #3
N1856 M204 S8000
N1857 G1  Y265.564  E0.2090
N1858 M204 S10000
N1859 G1  X177.162 
N1860 M204 S8000
N1861 G1  Y260.064  E0.2090
N1862 M204 S10000
N1863 G1  X185.828 
N1864 M204 S8000
N1865 G1  Y265.564  E0.2090
N1866 M204 S10000
N1867 G1  X194.495 
N1868 M204 S8000
N1869 G1  Y260.064  E0.2090
N1870 ; CP EMPTY GRID END
N1871 ;------------------
N1872 
N1873 
N1874 
N1875 
N1876 
N1877 
N1878 ; WIPE_TOWER_END
N1879 ; LAYER_HEIGHT: 0.200000
N1880 ; FEATURE: Prime tower
N1881 ; LINE_WIDTH: 0.500000
N1882 ;--------------------
N1883 ; CP TOOLCHANGE START
N1884 ; toolchange #2
N1885 ; material : PETG-CF -> PETG-CF
N1886 ;--------------------
N1887 M220 B
N1888 M220 S100
N1889 ; WIPE_TOWER_START
N1890 G1 E-.8 F1800
N1891 G17
N1892 G3 Z.8 I1.217 J0 P1  F60000
N1893 G1 X167.745 Y252.814
N1894 G1 Z.4
N1895 G1 E.8 F1800
N1896 ; LAYER_HEIGHT: 0.200000
N1897 ; FEATURE: Prime tower
N1898 ; LINE_WIDTH: 1.000000
N1899 ; NOZZLE_CHANGE_START OF2 NF0
N1900 M104 T0 S200 N0 ;Multi extruder pre cooling in post extrusion
N1901 M204 S8000
N1902 G1  X195.245 Y252.814  E2.1885 F550
N1903 G1  Y254.314  E0.1194
N1904 G1  X167.745  E2.1885
N1905 G1  Y255.814  E0.1194
N1906 G1  X195.245  E2.1885
N1907 G1  Y257.314  E0.1194
N1908 G1  X167.745  E2.1885
N1909 G1  Y258.814  E0.1194
N1910 G1  X195.245  E2.1885
N1911 M204 S10000
N1912 G1  Y259.814 
N1913 G1  X168.245  F398
N1914 G1  Y258.314 
N1915 M73 P35 R24
N1916 G1  X194.745 
N1917 G1  Y256.814 
N1918 G1  X168.245 
N1919 G1  Y255.314 
N1920 G1  X194.745 
N1921 G1  Y253.814 
N1922 G1  X168.245 
N1923 ; NOZZLE_CHANGE_END OF2 NF0
N1924 M104 T0 S40 N0 ;Multi extruder pre cooling
N1925 
N1926 G1 E-2 F1800
N1927 G17
N1928 G3 Z.8 I1.217 J0 P1  F5400
N1929 ; filament end gcode 
N1930 
N1931 ;======== H2D ========
N1932 ;===== 20250604 =====
N1933 M993 A2 B2 C2 ; nozzle cam detection allow status save.
N1934 M993 A0 B0 C0 ; nozzle cam detection not allowed.
N1935 
N1936 
N1937 M1015.4 S1 K0 ;disable E air printing detect
N1938 
N1939 
N1940 M620 S0A
N1941 M1002 gcode_claim_action : 4
N1942 M204 S9000
N1943 
N1944 G1 Z3.4 F1200
N1945 
N1946 M400
N1947 M106 P1 S0
N1948 M106 P2 S0
N1949 
N1950 
N1951 ; get travel path for change filament
N1952 ;M620.1 X54 Y0 F21000 P0
N1953 ;M620.1 X54 Y0 F21000 P1
N1954 ;M620.1 X54 Y245 F21000 P2
N1955 
N1956 
N1957 
N1958 M620.10 A0 F261.922 L0 H0.4 T250 P230 S1
N1959 
N1960 
N1961 
N1962 M620.10 A1 F286.867 L0 H0.4 T270 P255 S1
N1963 
N1964 
N1965 
N1966 M620.11 P0 I2 E0
N1967 
N1968 
N1969 
N1970 M620.11 K1 I2 R10 F261.922
N1971 
N1972 
N1973 M628 S1
N1974 
N1975 
N1976 M620.11 S1 L0 I2 R10 D8 E-10 F261.922
N1977 
N1978 
N1979 M629
N1980 
N1981 
N1982 M620.11 H0
N1983 
N1984 
N1985 T0
N1986 M73 E4
N1987 
N1988 ;deretract
N1989 
N1990 
N1991 M73 P36 R23
N1992 ;VG1 E4 F286
N1993 ;VG1 E4 F143
N1994 
N1995 
N1996 
N1997 ; VFLUSH_START
N1998 
N1999 
N2000 ;VG1 E0 F261
N2001 
N2002 
N2003 SYNC T0
N2004 
N2005 ; VFLUSH_END
N2006 
N2007 M1002 set_filament_type:PETG-CF
N2008 
N2009 M400
N2010 M83
N2011 
N2012 
N2013 
N2014 M628 S0
N2015 ;VM109 S255
N2016 M629
N2017 M400
N2018 
N2019 M983.3 F4.79167 A0.4
N2020 
N2021 
N2022 M400
N2023 
N2024 G1 Y320 F30000
N2025 G1 X201
N2026 
N2027 G1 Y295
N2028 G1 Y265 F18000
N2029 G1 Z3.4 F3000
N2030 
N2031 M204 S8000
N2032 
N2033 
N2034 M621 S0A
N2035 
N2036 M993 A3 B3 C3 ; nozzle cam detection allow status restore.
N2037 
N2038 
N2039 M1015.3 S0;disable tpu clog detect
N2040 
N2041 
N2042 
N2043 M1015.4 S1 K1 H0.4 ;enable E air printing detect
N2044 
N2045 
N2046 M620.6 I0 W1 ;enable ams air printing detect
N2047 M1002 gcode_claim_action : 0
N2048 M106 S0
N2049 M106 P2 S0
N2050 G1 X200 Y278.814 F60000
N2051 G1 Z.4
N2052 G1 X195.495 Y278.814 Z.8
N2053 
N2054 ; filament start gcode
N2055 G1 Z.4
N2056 G1 E2 F1800
N2057 
N2058 G4 S0
N2059 ; CP TOOLCHANGE WIPE
N2060 ; LINE_WIDTH: 0.500000
N2061 M204 S8000
N2062 G1  X192.495 Y278.814  E0.1140 F1782
N2063 G1 E-0.8000 F1800
N2064 M204 S10000
N2065 G1  X196.995  F600
N2066 G1  X195.495  F240
N2067 G1  X195.995  F600
N2068 G1  Y279.314 
N2069 G1  X194.995 
N2070 G1  Y278.314 
N2071 G1  X196.495 
N2072 G1  Y279.814 
N2073 G1  X194.495 
N2074 G1  Y277.814 
N2075 G1  X192.495 Y278.814   F1782
N2076 G1 E0.8000 F1800
N2077 M204 S8000
N2078 G1  X167.495  E0.9502 F1782
N2079 G1  Y278.064  E0.0285
N2080 G1  X195.495  E1.0642 F2025
N2081 G1  Y277.314  E0.0285
N2082 G1  X167.495  E1.0642 F2473
N2083 G1  Y276.564  E0.0285
N2084 G1  X195.495  E1.0642 F4725
N2085 G1  Y275.814  E0.0285
N2086 G1  X167.495  E1.0642 F4775
N2087 G1  Y275.064  E0.0285
N2088 G1  X195.495  E1.0642 F4825
N2089 G1  Y274.314  E0.0285
N2090 G1  X167.495  E1.0642 F4875
N2091 G1  Y273.564  E0.0285
N2092 G1  X195.495  E1.0642 F4925
N2093 G1  Y272.814  E0.0285
N2094 G1  X167.495  E1.0642 F4975
N2095 G1  Y272.064  E0.0285
N2096 G1  X195.495  E1.0642 F5025
N2097 G1  Y271.314  E0.0285
N2098 G1  X167.495  E1.0642 F5075
N2099 G1  Y270.564  E0.0285
N2100 G1  X195.495  E1.0642 F5125
N2101 G1  Y269.814  E0.0285
N2102 G1  X167.495  E1.0642 F5175
N2103 G1  Y269.064  E0.0285
N2104 G1  X195.495  E1.0642 F5225
N2105 G1  Y268.314  E0.0285
N2106 G1  X167.495  E1.0642 F5275
N2107 G1  Y267.564  E0.0285
N2108 G1  X195.495  E1.0642 F5325
N2109 G1  Y266.814  E0.0285
N2110 G1  X167.495  E1.0642 F5375
N2111 G1  Y266.064  E0.0285
N2112 G1  X195.495  E1.0642 F5400
N2113 ; WIPE_TOWER_END
N2114 M220 R
N2115 G1 F60000
N2116 G4 S0
N2117 G92 E0
N2118 ; CP TOOLCHANGE END
N2119 ;------------------
N2120 
N2121 
N2122 G1  Y252.064  
N2123 ; LAYER_HEIGHT: 0.200000
N2124 ; FEATURE: Prime tower
N2125 ; LINE_WIDTH: 0.500000
N2126 ; WIPE_TOWER_START
N2127 M204 S10000
N2128 G1  X195.846 Y279.721  
N2129 M204 S8000
N2130 G3  X193.064 Y281.636   I-3.469 J-2.060 E0.1325 F5400
N2131 G3  X190.723 Y280.255   I1.448 J-5.129 E0.1045
N2132 G2  X188.182 Y279.564   I-2.568 J4.426 E0.1012
N2133 G2  X174.618 Y279.568   I-6.687 J357.435 E0.5155
N2134 G2  X170.683 Y281.445   I0.499 J6.110 E0.1694
N2135 G3  X168.371 Y281.015   I-0.854 J-1.838 E0.0953
N2136 G1  X166.995 Y279.564   E0.0760
N2137 G3  X165.064 Y277.242   I3.871 J-5.183 E0.1159
N2138 G3  X166.240 Y274.649   I2.902 J-0.247 E0.1130
N2139 G2  X166.995 Y272.245   I-3.465 J-2.409 E0.0972
N2140 G2  X166.992 Y259.212   I-321.195 J-6.431 E0.4954
N2141 G2  X165.146 Y255.634   I-6.663 J1.171 E0.1554
N2142 G3  X165.485 Y253.656   I1.658 J-0.734 E0.0808
N2143 G1  X168.371 Y250.613   E0.1594
N2144 G3  X171.793 Y251.056   I1.525 J1.652 E0.1495
N2145 G2  X174.808 Y252.064   I3.021 J-4.025 E0.1229
N2146 G2  X188.372 Y252.060   I6.687 J-357.435 E0.5155
N2147 G2  X192.307 Y250.183   I-0.499 J-6.110 E0.1694
N2148 G3  X194.619 Y250.613   I0.854 J1.838 E0.0953
N2149 G1  X195.995 Y252.064   E0.0760
N2150 G3  X197.926 Y254.386   I-3.871 J5.182 E0.1159
N2151 G3  X196.750 Y256.979   I-2.902 J0.247 E0.1130
N2152 G2  X195.995 Y259.382   I3.464 J2.409 E0.0972
N2153 G2  X195.998 Y272.416   I321.212 J6.432 E0.4954
N2154 G2  X197.844 Y275.994   I6.663 J-1.171 E0.1554
N2155 G3  X197.564 Y277.905   I-1.654 J0.733 E0.0774
N2156 ; WIPE_TOWER_END
N2157 
N2158 ; WIPE_START
N2159 G1 F15000
N2160 M204 S8000
N2161 G1 X197.598 Y277.866 E-.01975
N2162 G1 X197.683 Y277.752 E-.0539
N2163 G1 X197.759 Y277.632 E-.05389
N2164 G1 X197.825 Y277.506 E-.05389
N2165 G1 X197.88 Y277.376 E-.0539
N2166 G1 X197.926 Y277.242 E-.05389
N2167 G1 X197.961 Y277.104 E-.0539
N2168 G1 X197.985 Y276.964 E-.05389
N2169 G1 X197.998 Y276.823 E-.05391
N2170 G1 X198 Y276.681 E-.05388
N2171 G1 X197.99 Y276.54 E-.0539
N2172 G1 X197.97 Y276.4 E-.05389
N2173 G1 X197.939 Y276.261 E-.05389
N2174 G1 X197.896 Y276.126 E-.0539
N2175 G1 X197.858 Y276.029 E-.03963
N2176 ; WIPE_END
N2177 G1 E-.04 F1800
N2178 M204 S10000
N2179 G17
N2180 G3 Z.8 I1.217 J0 P1  F60000
N2181 ; OBJECT_ID: 130
N2182 ; start printing object, unique label id: 130
N2183 M624 AQAAAAAAAAA=
N2184 G1 X191.084 Y196.801
N2185 G1 Z.4
N2186 G1 E.8 F1800
N2187 ; FEATURE: Inner wall
N2188 ; LINE_WIDTH: 0.45
N2189 ; LAYER_HEIGHT: 0.2
N2190 G1 F8475
N2191 M204 S8000
N2192 G1 X158.916 Y196.801 E1.03439
N2193 G1 X158.916 Y123.199 E2.36678
N2194 G1 X191.084 Y123.199 E1.03439
N2195 G1 X191.084 Y196.741 E2.36485
N2196 M204 S10000
N2197 G1 X191.491 Y197.208 F60000
N2198 M73 P37 R23
N2199 G1 F8475
N2200 M204 S8000
N2201 G1 X158.509 Y197.208 E1.06057
N2202 G1 X158.509 Y122.792 E2.39296
N2203 G1 X191.491 Y122.792 E1.06057
N2204 G1 X191.491 Y197.148 E2.39103
N2205 M204 S10000
N2206 G1 X191.898 Y197.615 F60000
N2207 G1 F8475
N2208 M204 S8000
N2209 G1 X158.102 Y197.615 E1.08675
N2210 G1 X158.102 Y122.385 E2.41914
N2211 G1 X191.898 Y122.385 E1.08675
N2212 G1 X191.898 Y197.555 E2.41721
N2213 M204 S10000
N2214 G1 X192.29 Y198.007 F60000
N2215 ; FEATURE: Outer wall
N2216 ; LINE_WIDTH: 0.42
N2217 G1 F9149.261
N2218 M204 S5000
N2219 G1 X157.71 Y198.007 E1.03002
N2220 G1 X157.71 Y121.993 E2.26421
N2221 G1 X192.29 Y121.993 E1.03002
N2222 G1 X192.29 Y197.947 E2.26243
N2223 G1 E-.8 F1800
N2224 M204 S10000
N2225 G1 X190.157 Y196.637 Z.8 F60000
N2226 G1 Z.4
N2227 G1 E.8 F1800
N2228 ; FEATURE: Internal solid infill
N2229 ; LINE_WIDTH: 0.42048
N2230 G1 F9137.621
N2231 M204 S8000
N2232 G1 X190.751 Y196.044 E.02504
N2233 G1 X190.751 Y195.51 E.01592
N2234 G1 X189.793 Y196.468 E.0404
N2235 G1 X189.259 Y196.468 E.01592
N2236 G1 X190.751 Y194.976 E.06292
N2237 G1 X190.751 Y194.442 E.01592
N2238 G1 X188.725 Y196.468 E.08544
N2239 G1 X188.191 Y196.468 E.01592
N2240 G1 X190.751 Y193.908 E.10797
N2241 G1 X190.751 Y193.374 E.01592
N2242 G1 X187.657 Y196.468 E.13049
N2243 G1 X187.123 Y196.468 E.01592
N2244 G1 X190.751 Y192.84 E.15301
N2245 G1 X190.751 Y192.306 E.01592
N2246 G1 X186.589 Y196.468 E.17553
N2247 G1 X186.055 Y196.468 E.01592
N2248 G1 X190.751 Y191.772 E.19805
N2249 G1 X190.751 Y191.238 E.01592
N2250 G1 X185.521 Y196.468 E.22057
N2251 G1 X184.987 Y196.468 E.01592
N2252 G1 X190.751 Y190.704 E.24309
N2253 G1 X190.751 Y190.17 E.01592
N2254 G1 X184.453 Y196.468 E.26561
N2255 G1 X183.919 Y196.468 E.01592
N2256 G1 X190.751 Y189.636 E.28813
N2257 G1 X190.751 Y189.103 E.01592
N2258 G1 X183.385 Y196.468 E.31066
N2259 G1 X182.851 Y196.468 E.01592
N2260 G1 X190.751 Y188.569 E.33318
N2261 G1 X190.751 Y188.035 E.01592
N2262 G1 X182.317 Y196.468 E.3557
N2263 G1 X181.783 Y196.468 E.01592
N2264 G1 X190.751 Y187.501 E.37822
N2265 G1 X190.751 Y186.967 E.01593
N2266 G1 X181.249 Y196.468 E.40074
N2267 G1 X180.715 Y196.468 E.01592
N2268 G1 X190.751 Y186.433 E.42326
N2269 G1 X190.751 Y185.899 E.01592
N2270 G1 X180.182 Y196.468 E.44578
N2271 G1 X179.648 Y196.468 E.01592
N2272 G1 X190.751 Y185.365 E.4683
N2273 G1 X190.751 Y184.831 E.01592
N2274 G1 X179.114 Y196.468 E.49082
N2275 G1 X178.58 Y196.468 E.01592
N2276 G1 X190.751 Y184.297 E.51335
N2277 G1 X190.751 Y183.763 E.01592
N2278 G1 X178.046 Y196.468 E.53587
N2279 G1 X177.512 Y196.468 E.01592
N2280 G1 X190.751 Y183.229 E.55839
N2281 G1 X190.751 Y182.695 E.01592
N2282 G1 X176.978 Y196.468 E.58091
N2283 G1 X176.444 Y196.468 E.01593
N2284 G1 X190.751 Y182.161 E.60343
N2285 G1 X190.751 Y181.627 E.01592
N2286 G1 X175.91 Y196.468 E.62595
N2287 G1 X175.376 Y196.468 E.01592
N2288 G1 X190.751 Y181.093 E.64847
N2289 G1 X190.751 Y180.559 E.01592
N2290 G1 X174.842 Y196.468 E.67099
N2291 G1 X174.308 Y196.468 E.01592
N2292 G1 X190.751 Y180.025 E.69351
N2293 G1 X190.751 Y179.491 E.01592
N2294 G1 X173.774 Y196.468 E.71604
N2295 G1 X173.24 Y196.468 E.01593
N2296 G1 X190.751 Y178.957 E.73856
N2297 G1 X190.751 Y178.423 E.01592
N2298 G1 X172.706 Y196.468 E.76108
N2299 G1 X172.172 Y196.468 E.01592
N2300 G1 X190.751 Y177.89 E.7836
N2301 G1 X190.751 Y177.356 E.01592
N2302 G1 X171.638 Y196.468 E.80612
N2303 G1 X171.104 Y196.468 E.01592
N2304 G1 X190.751 Y176.822 E.82864
N2305 G1 X190.751 Y176.288 E.01592
N2306 G1 X170.57 Y196.468 E.85116
N2307 G1 X170.036 Y196.468 E.01592
N2308 G1 X190.751 Y175.754 E.87368
N2309 G1 X190.751 Y175.22 E.01592
N2310 G1 X169.503 Y196.468 E.8962
N2311 G1 X168.969 Y196.468 E.01592
N2312 G1 X190.751 Y174.686 E.91873
N2313 G1 X190.751 Y174.152 E.01592
N2314 G1 X168.435 Y196.468 E.94125
N2315 G1 X167.901 Y196.468 E.01592
N2316 G1 X190.751 Y173.618 E.96377
N2317 G1 X190.751 Y173.084 E.01592
N2318 G1 X167.367 Y196.468 E.98629
N2319 G1 X166.833 Y196.468 E.01592
N2320 G1 X190.751 Y172.55 E1.00881
N2321 G1 X190.751 Y172.016 E.01592
N2322 G1 X166.299 Y196.468 E1.03133
N2323 G1 X165.765 Y196.468 E.01592
N2324 G1 X190.751 Y171.482 E1.05385
N2325 G1 X190.751 Y170.948 E.01592
N2326 G1 X165.231 Y196.468 E1.07637
N2327 G1 X164.697 Y196.468 E.01592
N2328 G1 X190.751 Y170.414 E1.09889
N2329 G1 X190.751 Y169.88 E.01592
N2330 G1 X164.163 Y196.468 E1.12141
N2331 G1 X163.629 Y196.468 E.01592
N2332 G1 X190.751 Y169.346 E1.14394
N2333 G1 X190.751 Y168.812 E.01592
N2334 G1 X163.095 Y196.468 E1.16646
N2335 G1 X162.561 Y196.468 E.01592
N2336 G1 X190.751 Y168.278 E1.18898
N2337 G1 X190.751 Y167.744 E.01592
N2338 G1 X162.027 Y196.468 E1.2115
N2339 G1 X161.493 Y196.468 E.01592
N2340 G1 X190.751 Y167.211 E1.23402
N2341 G1 X190.751 Y166.677 E.01592
N2342 G1 X160.959 Y196.468 E1.25654
N2343 G1 X160.425 Y196.468 E.01592
N2344 G1 X190.751 Y166.143 E1.27906
N2345 G1 X190.751 Y165.609 E.01592
N2346 G1 X159.891 Y196.468 E1.30158
N2347 G1 X159.357 Y196.468 E.01592
N2348 G1 X190.751 Y165.075 E1.3241
N2349 G1 X190.751 Y164.541 E.01593
N2350 G1 X159.249 Y196.042 E1.32866
N2351 G1 X159.249 Y195.508 E.01592
N2352 G1 X190.751 Y164.007 E1.32866
N2353 G1 X190.751 Y163.473 E.01592
N2354 G1 X159.249 Y194.974 E1.32866
N2355 G1 X159.249 Y194.44 E.01593
N2356 G1 X190.751 Y162.939 E1.32866
N2357 G1 X190.751 Y162.405 E.01592
N2358 G1 X159.249 Y193.906 E1.32866
N2359 G1 X159.249 Y193.372 E.01592
N2360 G1 X190.751 Y161.871 E1.32866
N2361 G1 X190.751 Y161.337 E.01592
N2362 G1 X159.249 Y192.838 E1.32866
N2363 G1 X159.249 Y192.304 E.01592
N2364 G1 X190.751 Y160.803 E1.32866
N2365 G1 X190.751 Y160.269 E.01592
N2366 G1 X159.249 Y191.77 E1.32866
N2367 G1 X159.249 Y191.236 E.01592
N2368 G1 X190.751 Y159.735 E1.32866
N2369 G1 X190.751 Y159.201 E.01592
N2370 G1 X159.249 Y190.702 E1.32866
N2371 G1 X159.249 Y190.168 E.01592
N2372 G1 X190.751 Y158.667 E1.32866
N2373 G1 X190.751 Y158.133 E.01592
N2374 G1 X159.249 Y189.634 E1.32866
N2375 G1 X159.249 Y189.1 E.01592
N2376 G1 X190.751 Y157.599 E1.32866
N2377 G1 X190.751 Y157.065 E.01592
N2378 G1 X159.249 Y188.567 E1.32866
N2379 G1 X159.249 Y188.033 E.01592
N2380 G1 X190.751 Y156.532 E1.32866
N2381 G1 X190.751 Y155.998 E.01592
N2382 G1 X159.249 Y187.499 E1.32866
N2383 G1 X159.249 Y186.965 E.01592
N2384 G1 X190.751 Y155.464 E1.32866
N2385 G1 X190.751 Y154.93 E.01592
N2386 G1 X159.249 Y186.431 E1.32866
N2387 G1 X159.249 Y185.897 E.01592
N2388 M73 P38 R23
N2389 G1 X190.751 Y154.396 E1.32866
N2390 G1 X190.751 Y153.862 E.01592
N2391 G1 X159.249 Y185.363 E1.32866
N2392 G1 X159.249 Y184.829 E.01592
N2393 G1 X190.751 Y153.328 E1.32866
N2394 G1 X190.751 Y152.794 E.01592
N2395 G1 X159.249 Y184.295 E1.32866
N2396 G1 X159.249 Y183.761 E.01592
N2397 G1 X190.751 Y152.26 E1.32866
N2398 G1 X190.751 Y151.726 E.01592
N2399 G1 X159.249 Y183.227 E1.32866
N2400 G1 X159.249 Y182.693 E.01593
N2401 G1 X190.751 Y151.192 E1.32866
N2402 G1 X190.751 Y150.658 E.01592
N2403 G1 X159.249 Y182.159 E1.32866
N2404 G1 X159.249 Y181.625 E.01592
N2405 G1 X190.751 Y150.124 E1.32866
N2406 G1 X190.751 Y149.59 E.01592
N2407 G1 X159.249 Y181.091 E1.32866
N2408 G1 X159.249 Y180.557 E.01592
N2409 G1 X190.751 Y149.056 E1.32866
N2410 G1 X190.751 Y148.522 E.01592
N2411 G1 X159.249 Y180.023 E1.32866
N2412 G1 X159.249 Y179.489 E.01592
N2413 G1 X190.751 Y147.988 E1.32866
N2414 G1 X190.751 Y147.454 E.01592
N2415 G1 X159.249 Y178.955 E1.32866
N2416 G1 X159.249 Y178.421 E.01592
N2417 G1 X190.751 Y146.92 E1.32866
N2418 G1 X190.751 Y146.386 E.01592
N2419 G1 X159.249 Y177.888 E1.32866
N2420 G1 X159.249 Y177.354 E.01592
N2421 G1 X190.751 Y145.853 E1.32866
N2422 G1 X190.751 Y145.319 E.01593
N2423 G1 X159.249 Y176.82 E1.32866
N2424 G1 X159.249 Y176.286 E.01592
N2425 G1 X190.751 Y144.785 E1.32866
N2426 G1 X190.751 Y144.251 E.01592
N2427 G1 X159.249 Y175.752 E1.32866
N2428 G1 X159.249 Y175.218 E.01592
N2429 G1 X190.751 Y143.717 E1.32866
N2430 G1 X190.751 Y143.183 E.01592
N2431 G1 X159.249 Y174.684 E1.32866
N2432 G1 X159.249 Y174.15 E.01592
N2433 G1 X190.751 Y142.649 E1.32866
N2434 G1 X190.751 Y142.115 E.01592
N2435 G1 X159.249 Y173.616 E1.32866
N2436 G1 X159.249 Y173.082 E.01592
N2437 G1 X190.751 Y141.581 E1.32866
N2438 G1 X190.751 Y141.047 E.01592
N2439 G1 X159.249 Y172.548 E1.32866
N2440 G1 X159.249 Y172.014 E.01592
N2441 G1 X190.751 Y140.513 E1.32866
N2442 G1 X190.751 Y139.979 E.01592
N2443 G1 X159.249 Y171.48 E1.32866
N2444 G1 X159.249 Y170.946 E.01592
N2445 G1 X190.751 Y139.445 E1.32866
N2446 G1 X190.751 Y138.911 E.01592
N2447 G1 X159.249 Y170.412 E1.32866
N2448 G1 X159.249 Y169.878 E.01592
N2449 G1 X190.751 Y138.377 E1.32866
N2450 G1 X190.751 Y137.843 E.01592
N2451 G1 X159.249 Y169.344 E1.32866
N2452 G1 X159.249 Y168.81 E.01592
N2453 G1 X190.751 Y137.309 E1.32866
N2454 G1 X190.751 Y136.775 E.01592
N2455 G1 X159.249 Y168.276 E1.32866
N2456 G1 X159.249 Y167.742 E.01592
N2457 G1 X190.751 Y136.241 E1.32866
N2458 G1 X190.751 Y135.707 E.01592
N2459 G1 X159.249 Y167.209 E1.32866
N2460 G1 X159.249 Y166.675 E.01592
N2461 G1 X190.751 Y135.174 E1.32866
N2462 G1 X190.751 Y134.64 E.01592
N2463 G1 X159.249 Y166.141 E1.32866
N2464 G1 X159.249 Y165.607 E.01592
N2465 G1 X190.751 Y134.106 E1.32866
N2466 G1 X190.751 Y133.572 E.01593
N2467 G1 X159.249 Y165.073 E1.32866
N2468 G1 X159.249 Y164.539 E.01592
N2469 G1 X190.751 Y133.038 E1.32866
N2470 G1 X190.751 Y132.504 E.01592
N2471 G1 X159.249 Y164.005 E1.32866
N2472 G1 X159.249 Y163.471 E.01592
N2473 G1 X190.751 Y131.97 E1.32866
N2474 G1 X190.751 Y131.436 E.01592
N2475 G1 X159.249 Y162.937 E1.32866
N2476 G1 X159.249 Y162.403 E.01592
N2477 G1 X190.751 Y130.902 E1.32866
N2478 G1 X190.751 Y130.368 E.01592
N2479 G1 X159.249 Y161.869 E1.32866
N2480 G1 X159.249 Y161.335 E.01592
N2481 M73 P38 R22
N2482 G1 X190.751 Y129.834 E1.32866
N2483 G1 X190.751 Y129.3 E.01592
N2484 G1 X159.249 Y160.801 E1.32866
N2485 G1 X159.249 Y160.267 E.01593
N2486 G1 X190.751 Y128.766 E1.32866
N2487 G1 X190.751 Y128.232 E.01592
N2488 G1 X159.249 Y159.733 E1.32866
N2489 G1 X159.249 Y159.199 E.01592
N2490 G1 X190.751 Y127.698 E1.32866
N2491 G1 X190.751 Y127.164 E.01592
N2492 G1 X159.249 Y158.665 E1.32866
N2493 G1 X159.249 Y158.131 E.01592
N2494 G1 X190.751 Y126.63 E1.32866
N2495 G1 X190.751 Y126.096 E.01592
N2496 G1 X159.249 Y157.597 E1.32866
N2497 G1 X159.249 Y157.063 E.01592
N2498 G1 X190.751 Y125.562 E1.32866
N2499 G1 X190.751 Y125.028 E.01592
N2500 G1 X159.249 Y156.53 E1.32866
N2501 G1 X159.249 Y155.996 E.01592
N2502 G1 X190.751 Y124.495 E1.32866
N2503 G1 X190.751 Y123.961 E.01592
N2504 G1 X159.249 Y155.462 E1.32866
N2505 G1 X159.249 Y154.928 E.01592
N2506 G1 X190.645 Y123.532 E1.32421
N2507 G1 X190.111 Y123.532 E.01592
N2508 G1 X159.249 Y154.394 E1.30169
N2509 G1 X159.249 Y153.86 E.01592
N2510 G1 X189.577 Y123.532 E1.27917
N2511 G1 X189.043 Y123.532 E.01592
N2512 G1 X159.249 Y153.326 E1.25664
N2513 G1 X159.249 Y152.792 E.01592
N2514 G1 X188.509 Y123.532 E1.23412
N2515 G1 X187.975 Y123.532 E.01592
N2516 G1 X159.249 Y152.258 E1.2116
N2517 G1 X159.249 Y151.724 E.01592
N2518 G1 X187.441 Y123.532 E1.18908
N2519 G1 X186.907 Y123.532 E.01592
N2520 G1 X159.249 Y151.19 E1.16656
N2521 G1 X159.249 Y150.656 E.01592
N2522 G1 X186.373 Y123.532 E1.14404
N2523 G1 X185.839 Y123.532 E.01592
N2524 G1 X159.249 Y150.122 E1.12152
N2525 G1 X159.249 Y149.588 E.01592
N2526 G1 X185.305 Y123.532 E1.099
N2527 G1 X184.772 Y123.532 E.01593
N2528 G1 X159.249 Y149.054 E1.07648
N2529 G1 X159.249 Y148.52 E.01592
N2530 G1 X184.238 Y123.532 E1.05395
N2531 G1 X183.704 Y123.532 E.01592
N2532 M73 P39 R22
N2533 G1 X159.249 Y147.986 E1.03143
N2534 G1 X159.249 Y147.452 E.01592
N2535 G1 X183.17 Y123.532 E1.00891
N2536 G1 X182.636 Y123.532 E.01592
N2537 G1 X159.249 Y146.918 E.98639
N2538 G1 X159.249 Y146.384 E.01592
N2539 G1 X182.102 Y123.532 E.96387
N2540 G1 X181.568 Y123.532 E.01592
N2541 G1 X159.249 Y145.851 E.94135
N2542 G1 X159.249 Y145.317 E.01592
N2543 G1 X181.034 Y123.532 E.91883
N2544 G1 X180.5 Y123.532 E.01592
N2545 G1 X159.249 Y144.783 E.89631
N2546 G1 X159.249 Y144.249 E.01592
N2547 G1 X179.966 Y123.532 E.87379
N2548 G1 X179.432 Y123.532 E.01592
N2549 G1 X159.249 Y143.715 E.85126
N2550 G1 X159.249 Y143.181 E.01592
N2551 G1 X178.898 Y123.532 E.82874
N2552 G1 X178.364 Y123.532 E.01592
N2553 G1 X159.249 Y142.647 E.80622
N2554 G1 X159.249 Y142.113 E.01592
N2555 G1 X177.83 Y123.532 E.7837
N2556 G1 X177.296 Y123.532 E.01592
N2557 G1 X159.249 Y141.579 E.76118
N2558 G1 X159.249 Y141.045 E.01593
N2559 G1 X176.762 Y123.532 E.73866
N2560 G1 X176.228 Y123.532 E.01592
N2561 G1 X159.249 Y140.511 E.71614
N2562 G1 X159.249 Y139.977 E.01592
N2563 G1 X175.694 Y123.532 E.69362
N2564 G1 X175.16 Y123.532 E.01592
N2565 G1 X159.249 Y139.443 E.6711
N2566 G1 X159.249 Y138.909 E.01592
N2567 G1 X174.626 Y123.532 E.64857
N2568 G1 X174.093 Y123.532 E.01592
N2569 G1 X159.249 Y138.375 E.62605
N2570 G1 X159.249 Y137.841 E.01592
N2571 G1 X173.559 Y123.532 E.60353
N2572 G1 X173.025 Y123.532 E.01592
N2573 G1 X159.249 Y137.307 E.58101
N2574 G1 X159.249 Y136.773 E.01592
N2575 G1 X172.491 Y123.532 E.55849
N2576 G1 X171.957 Y123.532 E.01592
N2577 G1 X159.249 Y136.239 E.53597
N2578 G1 X159.249 Y135.705 E.01592
N2579 G1 X171.423 Y123.532 E.51345
N2580 G1 X170.889 Y123.532 E.01592
N2581 G1 X159.249 Y135.172 E.49093
N2582 G1 X159.249 Y134.638 E.01592
N2583 G1 X170.355 Y123.532 E.46841
N2584 G1 X169.821 Y123.532 E.01592
N2585 G1 X159.249 Y134.104 E.44588
N2586 G1 X159.249 Y133.57 E.01592
N2587 G1 X169.287 Y123.532 E.42336
N2588 G1 X168.753 Y123.532 E.01592
N2589 G1 X159.249 Y133.036 E.40084
N2590 G1 X159.249 Y132.502 E.01592
N2591 G1 X168.219 Y123.532 E.37832
N2592 G1 X167.685 Y123.532 E.01592
N2593 G1 X159.249 Y131.968 E.3558
N2594 G1 X159.249 Y131.434 E.01592
N2595 G1 X167.151 Y123.532 E.33328
N2596 G1 X166.617 Y123.532 E.01592
N2597 G1 X159.249 Y130.9 E.31076
N2598 G1 X159.249 Y130.366 E.01592
N2599 G1 X166.083 Y123.532 E.28824
N2600 G1 X165.549 Y123.532 E.01592
N2601 G1 X159.249 Y129.832 E.26572
N2602 G1 X159.249 Y129.298 E.01592
N2603 G1 X165.015 Y123.532 E.24319
N2604 G1 X164.481 Y123.532 E.01592
N2605 G1 X159.249 Y128.764 E.22067
N2606 G1 X159.249 Y128.23 E.01592
N2607 G1 X163.947 Y123.532 E.19815
N2608 G1 X163.413 Y123.532 E.01592
N2609 G1 X159.249 Y127.696 E.17563
N2610 G1 X159.249 Y127.162 E.01592
N2611 G1 X162.88 Y123.532 E.15311
N2612 G1 X162.346 Y123.532 E.01592
N2613 G1 X159.249 Y126.628 E.13059
N2614 G1 X159.249 Y126.094 E.01592
N2615 G1 X161.812 Y123.532 E.10807
N2616 G1 X161.278 Y123.532 E.01592
N2617 G1 X159.249 Y125.56 E.08555
N2618 G1 X159.249 Y125.026 E.01592
N2619 G1 X160.744 Y123.532 E.06303
N2620 G1 X160.21 Y123.532 E.01592
N2621 G1 X159.249 Y124.492 E.0405
N2622 G1 X159.249 Y123.959 E.01592
N2623 G1 X159.846 Y123.362 E.02514
N2624 ; WIPE_START
N2625 G1 X159.249 Y123.959 E-.32032
N2626 G1 X159.249 Y124.492 E-.2029
N2627 G1 X159.69 Y124.052 E-.23678
N2628 ; WIPE_END
N2629 G1 E-.04 F1800
N2630 M204 S10000
N2631 G17
N2632 G3 Z.8 I1.217 J0 P1  F60000
N2633 ; stop printing object, unique label id: 130
N2634 M625
N2635 ; object ids of layer 2 start: 130,138
N2636 M624 AwAAAAAAAAA=
N2637 ;======== H2D 20250527========
N2638 ; SKIPPABLE_START
N2639 ; SKIPTYPE: timelapse
N2640 M622.1 S1 ; for prev firware, default turned on
N2641 
N2642 M1002 judge_flag timelapse_record_flag
N2643 
N2644 M622 J1
N2645 M993 A2 B2 C2
N2646 M993 A0 B0 C0
N2647 
N2648 
N2649 
N2650 
N2651     M9711 M0 E1 X260 Y137 Z0.8 S11 C10 O0 T3000
N2652 
N2653 
N2654 
N2655 M993 A3 B3 C3
N2656 
N2657 M623
N2658 ; SKIPPABLE_END
N2659 
N2660 ; object ids of this layer2 end: 130,138
N2661 M625
N2662 ; CHANGE_LAYER
N2663 ; Z_HEIGHT: 0.6
N2664 ; LAYER_HEIGHT: 0.2
N2665 ;======== H2D 20250521========
N2666 ; layer num/total_layer_count: 3/63
N2667 ; update layer progress
N2668 M73 L3
N2669 M991 S0 P2 ;notify layer change
N2670 
N2671 
N2672 ; OBJECT_ID: 130
N2673 ; COOLING_NODE: 0
N2674 ; start printing object, unique label id: 130
N2675 M624 AQAAAAAAAAA=
N2676 G1 X191.084 Y196.801 F60000
N2677 G1 Z.6
N2678 G1 E.8 F1800
N2679 ; FEATURE: Inner wall
N2680 ; LINE_WIDTH: 0.45
N2681 ; LAYER_HEIGHT: 0.2
N2682 G1 F8475
N2683 M204 S8000
N2684 G1 X158.916 Y196.801 E1.03439
N2685 G1 X158.916 Y123.199 E2.36678
N2686 G1 X191.084 Y123.199 E1.03439
N2687 G1 X191.084 Y196.741 E2.36485
N2688 ; COOLING_NODE: 0
N2689 M204 S10000
N2690 G1 X191.491 Y197.208 F60000
N2691 G1 F8475
N2692 M204 S8000
N2693 G1 X158.509 Y197.208 E1.06057
N2694 G1 X158.509 Y122.792 E2.39296
N2695 G1 X191.491 Y122.792 E1.06057
N2696 G1 X191.491 Y197.148 E2.39103
N2697 ; COOLING_NODE: 0
N2698 M204 S10000
N2699 G1 X191.898 Y197.615 F60000
N2700 G1 F8475
N2701 M204 S8000
N2702 G1 X158.102 Y197.615 E1.08675
N2703 G1 X158.102 Y122.385 E2.41914
N2704 G1 X191.898 Y122.385 E1.08675
N2705 G1 X191.898 Y197.555 E2.41721
N2706 ; COOLING_NODE: 0
N2707 M204 S10000
N2708 G1 X192.29 Y198.007 F60000
N2709 ; FEATURE: Outer wall
N2710 ; LINE_WIDTH: 0.42
N2711 G1 F9149.261
N2712 M204 S5000
N2713 G1 X157.71 Y198.007 E1.03002
N2714 G1 X157.71 Y121.993 E2.26421
N2715 G1 X192.29 Y121.993 E1.03002
N2716 G1 X192.29 Y197.947 E2.26243
N2717 M104 T0 S230 N0 ;Multi extruder pre heating
N2718 G1 E-.8 F1800
N2719 M204 S10000
N2720 G1 X184.672 Y197.471 Z1 F60000
N2721 G1 X159.08 Y195.872 Z1
N2722 G1 Z.6
N2723 G1 E.8 F1800
N2724 ; FEATURE: Internal solid infill
N2725 ; LINE_WIDTH: 0.42048
N2726 G1 F9137.621
N2727 M204 S8000
N2728 G1 X159.676 Y196.468 E.02514
N2729 G1 X160.21 Y196.468 E.01592
N2730 G1 X159.249 Y195.507 E.0405
N2731 G1 X159.249 Y194.974 E.01592
N2732 G1 X160.744 Y196.468 E.06303
N2733 G1 X161.278 Y196.468 E.01592
N2734 G1 X159.249 Y194.44 E.08555
N2735 G1 X159.249 Y193.906 E.01592
N2736 G1 X161.812 Y196.468 E.10807
N2737 G1 X162.346 Y196.468 E.01592
N2738 G1 X159.249 Y193.372 E.13059
N2739 G1 X159.249 Y192.838 E.01593
N2740 G1 X162.88 Y196.468 E.15311
N2741 G1 X163.413 Y196.468 E.01592
N2742 G1 X159.249 Y192.304 E.17563
N2743 G1 X159.249 Y191.77 E.01592
N2744 G1 X163.947 Y196.468 E.19815
N2745 G1 X164.481 Y196.468 E.01592
N2746 G1 X159.249 Y191.236 E.22067
N2747 G1 X159.249 Y190.702 E.01592
N2748 G1 X165.015 Y196.468 E.24319
N2749 G1 X165.549 Y196.468 E.01592
N2750 G1 X159.249 Y190.168 E.26572
N2751 G1 X159.249 Y189.634 E.01592
N2752 G1 X166.083 Y196.468 E.28824
N2753 G1 X166.617 Y196.468 E.01593
N2754 G1 X159.249 Y189.1 E.31076
N2755 G1 X159.249 Y188.566 E.01592
N2756 G1 X167.151 Y196.468 E.33328
N2757 G1 X167.685 Y196.468 E.01592
N2758 G1 X159.249 Y188.032 E.3558
N2759 G1 X159.249 Y187.498 E.01592
N2760 G1 X168.219 Y196.468 E.37832
N2761 G1 X168.753 Y196.468 E.01592
N2762 G1 X159.249 Y186.964 E.40084
N2763 G1 X159.249 Y186.43 E.01592
N2764 G1 X169.287 Y196.468 E.42336
N2765 G1 X169.821 Y196.468 E.01592
N2766 G1 X159.249 Y185.896 E.44588
N2767 G1 X159.249 Y185.362 E.01592
N2768 G1 X170.355 Y196.468 E.46841
N2769 G1 X170.889 Y196.468 E.01592
N2770 G1 X159.249 Y184.828 E.49093
N2771 G1 X159.249 Y184.295 E.01592
N2772 G1 X171.423 Y196.468 E.51345
N2773 G1 X171.957 Y196.468 E.01592
N2774 G1 X159.249 Y183.761 E.53597
N2775 G1 X159.249 Y183.227 E.01592
N2776 G1 X172.491 Y196.468 E.55849
N2777 G1 X173.025 Y196.468 E.01592
N2778 G1 X159.249 Y182.693 E.58101
N2779 G1 X159.249 Y182.159 E.01592
N2780 G1 X173.559 Y196.468 E.60353
N2781 G1 X174.092 Y196.468 E.01592
N2782 G1 X159.249 Y181.625 E.62605
N2783 G1 X159.249 Y181.091 E.01592
N2784 G1 X174.626 Y196.468 E.64857
N2785 G1 X175.16 Y196.468 E.01592
N2786 G1 X159.249 Y180.557 E.6711
N2787 G1 X159.249 Y180.023 E.01592
N2788 G1 X175.694 Y196.468 E.69362
N2789 G1 X176.228 Y196.468 E.01592
N2790 G1 X159.249 Y179.489 E.71614
N2791 G1 X159.249 Y178.955 E.01592
N2792 G1 X176.762 Y196.468 E.73866
N2793 G1 X177.296 Y196.468 E.01592
N2794 G1 X159.249 Y178.421 E.76118
N2795 G1 X159.249 Y177.887 E.01592
N2796 G1 X177.83 Y196.468 E.7837
N2797 G1 X178.364 Y196.468 E.01592
N2798 G1 X159.249 Y177.353 E.80622
N2799 G1 X159.249 Y176.819 E.01592
N2800 G1 X178.898 Y196.468 E.82874
N2801 G1 X179.432 Y196.468 E.01592
N2802 G1 X159.249 Y176.285 E.85126
N2803 G1 X159.249 Y175.751 E.01592
N2804 G1 X179.966 Y196.468 E.87379
N2805 G1 X180.5 Y196.468 E.01592
N2806 G1 X159.249 Y175.217 E.89631
N2807 G1 X159.249 Y174.683 E.01592
N2808 G1 X181.034 Y196.468 E.91883
N2809 G1 X181.568 Y196.468 E.01592
N2810 G1 X159.249 Y174.149 E.94135
N2811 G1 X159.249 Y173.616 E.01592
N2812 G1 X182.102 Y196.468 E.96387
N2813 G1 X182.636 Y196.468 E.01592
N2814 G1 X159.249 Y173.082 E.98639
N2815 G1 X159.249 Y172.548 E.01592
N2816 G1 X183.17 Y196.468 E1.00891
N2817 G1 X183.704 Y196.468 E.01592
N2818 G1 X159.249 Y172.014 E1.03143
N2819 G1 X159.249 Y171.48 E.01592
N2820 G1 X184.238 Y196.468 E1.05395
N2821 G1 X184.772 Y196.468 E.01592
N2822 G1 X159.249 Y170.946 E1.07648
N2823 G1 X159.249 Y170.412 E.01593
N2824 G1 X185.305 Y196.468 E1.099
N2825 G1 X185.839 Y196.468 E.01592
N2826 G1 X159.249 Y169.878 E1.12152
N2827 G1 X159.249 Y169.344 E.01592
N2828 G1 X186.373 Y196.468 E1.14404
N2829 G1 X186.907 Y196.468 E.01592
N2830 G1 X159.249 Y168.81 E1.16656
N2831 G1 X159.249 Y168.276 E.01592
N2832 G1 X187.441 Y196.468 E1.18908
N2833 G1 X187.975 Y196.468 E.01592
N2834 M73 P40 R22
N2835 G1 X159.249 Y167.742 E1.2116
N2836 G1 X159.249 Y167.208 E.01592
N2837 G1 X188.509 Y196.468 E1.23412
N2838 G1 X189.043 Y196.468 E.01593
N2839 G1 X159.249 Y166.674 E1.25664
N2840 G1 X159.249 Y166.14 E.01592
N2841 G1 X189.577 Y196.468 E1.27917
N2842 G1 X190.111 Y196.468 E.01592
N2843 G1 X159.249 Y165.606 E1.30169
N2844 G1 X159.249 Y165.072 E.01592
N2845 G1 X190.645 Y196.468 E1.32421
N2846 G1 X190.751 Y196.468 E.00315
N2847 G1 X190.751 Y196.039 E.01278
N2848 G1 X159.249 Y164.538 E1.32866
N2849 G1 X159.249 Y164.004 E.01592
N2850 G1 X190.751 Y195.505 E1.32866
N2851 G1 X190.751 Y194.972 E.01592
N2852 G1 X159.249 Y163.47 E1.32866
N2853 G1 X159.249 Y162.936 E.01592
N2854 G1 X190.751 Y194.438 E1.32866
N2855 G1 X190.751 Y193.904 E.01592
N2856 G1 X159.249 Y162.403 E1.32866
N2857 G1 X159.249 Y161.869 E.01592
N2858 G1 X190.751 Y193.37 E1.32866
N2859 G1 X190.751 Y192.836 E.01592
N2860 G1 X159.249 Y161.335 E1.32866
N2861 G1 X159.249 Y160.801 E.01592
N2862 G1 X190.751 Y192.302 E1.32866
N2863 G1 X190.751 Y191.768 E.01592
N2864 G1 X159.249 Y160.267 E1.32866
N2865 G1 X159.249 Y159.733 E.01592
N2866 G1 X190.751 Y191.234 E1.32866
N2867 G1 X190.751 Y190.7 E.01592
N2868 G1 X159.249 Y159.199 E1.32866
N2869 G1 X159.249 Y158.665 E.01592
N2870 G1 X190.751 Y190.166 E1.32866
N2871 G1 X190.751 Y189.632 E.01592
N2872 G1 X159.249 Y158.131 E1.32866
N2873 G1 X159.249 Y157.597 E.01592
N2874 G1 X190.751 Y189.098 E1.32866
N2875 G1 X190.751 Y188.564 E.01592
N2876 G1 X159.249 Y157.063 E1.32866
N2877 G1 X159.249 Y156.529 E.01592
N2878 G1 X190.751 Y188.03 E1.32866
N2879 G1 X190.751 Y187.496 E.01592
N2880 G1 X159.249 Y155.995 E1.32866
N2881 G1 X159.249 Y155.461 E.01592
N2882 G1 X190.751 Y186.962 E1.32866
N2883 G1 X190.751 Y186.428 E.01592
N2884 G1 X159.249 Y154.927 E1.32866
N2885 G1 X159.249 Y154.393 E.01592
N2886 G1 X190.751 Y185.894 E1.32866
N2887 G1 X190.751 Y185.36 E.01592
N2888 G1 X159.249 Y153.859 E1.32866
N2889 G1 X159.249 Y153.325 E.01592
N2890 G1 X190.751 Y184.826 E1.32866
N2891 G1 X190.751 Y184.293 E.01592
N2892 G1 X159.249 Y152.791 E1.32866
N2893 G1 X159.249 Y152.257 E.01592
N2894 G1 X190.751 Y183.759 E1.32866
N2895 G1 X190.751 Y183.225 E.01592
N2896 G1 X159.249 Y151.724 E1.32866
N2897 G1 X159.249 Y151.19 E.01592
N2898 G1 X190.751 Y182.691 E1.32866
N2899 G1 X190.751 Y182.157 E.01592
N2900 G1 X159.249 Y150.656 E1.32866
N2901 G1 X159.249 Y150.122 E.01592
N2902 G1 X190.751 Y181.623 E1.32866
N2903 G1 X190.751 Y181.089 E.01592
N2904 G1 X159.249 Y149.588 E1.32866
N2905 G1 X159.249 Y149.054 E.01592
N2906 G1 X190.751 Y180.555 E1.32866
N2907 G1 X190.751 Y180.021 E.01592
N2908 G1 X159.249 Y148.52 E1.32866
N2909 G1 X159.249 Y147.986 E.01592
N2910 G1 X190.751 Y179.487 E1.32866
N2911 G1 X190.751 Y178.953 E.01592
N2912 G1 X159.249 Y147.452 E1.32866
N2913 G1 X159.249 Y146.918 E.01592
N2914 G1 X190.751 Y178.419 E1.32866
N2915 G1 X190.751 Y177.885 E.01592
N2916 G1 X159.249 Y146.384 E1.32866
N2917 G1 X159.249 Y145.85 E.01592
N2918 G1 X190.751 Y177.351 E1.32866
N2919 G1 X190.751 Y176.817 E.01592
N2920 G1 X159.249 Y145.316 E1.32866
N2921 G1 X159.249 Y144.782 E.01592
N2922 G1 X190.751 Y176.283 E1.32866
N2923 G1 X190.751 Y175.749 E.01592
N2924 G1 X159.249 Y144.248 E1.32866
N2925 G1 X159.249 Y143.714 E.01592
N2926 G1 X190.751 Y175.215 E1.32866
N2927 G1 X190.751 Y174.681 E.01593
N2928 G1 X159.249 Y143.18 E1.32866
N2929 G1 X159.249 Y142.646 E.01592
N2930 G1 X190.751 Y174.147 E1.32866
N2931 G1 X190.751 Y173.614 E.01592
N2932 G1 X159.249 Y142.112 E1.32866
N2933 G1 X159.249 Y141.578 E.01592
N2934 G1 X190.751 Y173.08 E1.32866
N2935 G1 X190.751 Y172.546 E.01592
N2936 G1 X159.249 Y141.045 E1.32866
N2937 G1 X159.249 Y140.511 E.01592
N2938 G1 X190.751 Y172.012 E1.32866
N2939 G1 X190.751 Y171.478 E.01592
N2940 G1 X159.249 Y139.977 E1.32866
N2941 G1 X159.249 Y139.443 E.01592
N2942 G1 X190.751 Y170.944 E1.32866
N2943 G1 X190.751 Y170.41 E.01592
N2944 G1 X159.249 Y138.909 E1.32866
N2945 G1 X159.249 Y138.375 E.01592
N2946 G1 X190.751 Y169.876 E1.32866
N2947 G1 X190.751 Y169.342 E.01592
N2948 G1 X159.249 Y137.841 E1.32866
N2949 G1 X159.249 Y137.307 E.01592
N2950 G1 X190.751 Y168.808 E1.32866
N2951 G1 X190.751 Y168.274 E.01592
N2952 G1 X159.249 Y136.773 E1.32866
N2953 G1 X159.249 Y136.239 E.01593
N2954 G1 X190.751 Y167.74 E1.32866
N2955 G1 X190.751 Y167.206 E.01592
N2956 G1 X159.249 Y135.705 E1.32866
N2957 G1 X159.249 Y135.171 E.01592
N2958 G1 X190.751 Y166.672 E1.32866
N2959 G1 X190.751 Y166.138 E.01592
N2960 G1 X159.249 Y134.637 E1.32866
N2961 G1 X159.249 Y134.103 E.01592
N2962 G1 X190.751 Y165.604 E1.32866
N2963 G1 X190.751 Y165.07 E.01592
N2964 G1 X159.249 Y133.569 E1.32866
N2965 G1 X159.249 Y133.035 E.01592
N2966 G1 X190.751 Y164.536 E1.32866
N2967 G1 X190.751 Y164.002 E.01592
N2968 G1 X159.249 Y132.501 E1.32866
N2969 G1 X159.249 Y131.967 E.01592
N2970 G1 X190.751 Y163.468 E1.32866
N2971 G1 X190.751 Y162.934 E.01592
N2972 G1 X159.249 Y131.433 E1.32866
N2973 G1 X159.249 Y130.899 E.01592
N2974 G1 X190.751 Y162.401 E1.32866
N2975 G1 X190.751 Y161.867 E.01592
N2976 M73 P41 R22
N2977 G1 X159.249 Y130.366 E1.32866
N2978 G1 X159.249 Y129.832 E.01592
N2979 G1 X190.751 Y161.333 E1.32866
N2980 G1 X190.751 Y160.799 E.01592
N2981 G1 X159.249 Y129.298 E1.32866
N2982 G1 X159.249 Y128.764 E.01592
N2983 G1 X190.751 Y160.265 E1.32866
N2984 G1 X190.751 Y159.731 E.01592
N2985 G1 X159.249 Y128.23 E1.32866
N2986 G1 X159.249 Y127.696 E.01592
N2987 G1 X190.751 Y159.197 E1.32866
N2988 G1 X190.751 Y158.663 E.01592
N2989 G1 X159.249 Y127.162 E1.32866
N2990 G1 X159.249 Y126.628 E.01592
N2991 G1 X190.751 Y158.129 E1.32866
N2992 G1 X190.751 Y157.595 E.01592
N2993 G1 X159.249 Y126.094 E1.32866
N2994 G1 X159.249 Y125.56 E.01592
N2995 G1 X190.751 Y157.061 E1.32866
N2996 G1 X190.751 Y156.527 E.01592
N2997 G1 X159.249 Y125.026 E1.32866
N2998 G1 X159.249 Y124.492 E.01592
N2999 G1 X190.751 Y155.993 E1.32866
N3000 G1 X190.751 Y155.459 E.01592
N3001 G1 X159.249 Y123.958 E1.32866
N3002 G1 X159.249 Y123.532 E.0127
N3003 G1 X159.357 Y123.532 E.00322
N3004 G1 X190.751 Y154.925 E1.3241
N3005 G1 X190.751 Y154.391 E.01592
N3006 G1 X159.891 Y123.532 E1.30158
N3007 G1 X160.425 Y123.532 E.01592
N3008 G1 X190.751 Y153.857 E1.27906
N3009 G1 X190.751 Y153.323 E.01592
N3010 G1 X160.959 Y123.532 E1.25654
N3011 G1 X161.493 Y123.532 E.01592
N3012 G1 X190.751 Y152.789 E1.23402
N3013 G1 X190.751 Y152.255 E.01593
N3014 G1 X162.027 Y123.532 E1.2115
N3015 G1 X162.561 Y123.532 E.01592
N3016 G1 X190.751 Y151.722 E1.18898
N3017 G1 X190.751 Y151.188 E.01592
N3018 G1 X163.095 Y123.532 E1.16646
N3019 G1 X163.629 Y123.532 E.01592
N3020 G1 X190.751 Y150.654 E1.14394
N3021 G1 X190.751 Y150.12 E.01592
N3022 G1 X164.163 Y123.532 E1.12141
N3023 G1 X164.697 Y123.532 E.01592
N3024 M73 P41 R21
N3025 G1 X190.751 Y149.586 E1.09889
N3026 G1 X190.751 Y149.052 E.01592
N3027 G1 X165.231 Y123.532 E1.07637
N3028 G1 X165.765 Y123.532 E.01592
N3029 G1 X190.751 Y148.518 E1.05385
N3030 G1 X190.751 Y147.984 E.01592
N3031 G1 X166.299 Y123.532 E1.03133
N3032 G1 X166.833 Y123.532 E.01592
N3033 G1 X190.751 Y147.45 E1.00881
N3034 G1 X190.751 Y146.916 E.01592
N3035 G1 X167.367 Y123.532 E.98629
N3036 G1 X167.901 Y123.532 E.01592
N3037 G1 X190.751 Y146.382 E.96377
N3038 G1 X190.751 Y145.848 E.01592
N3039 G1 X168.435 Y123.532 E.94125
N3040 G1 X168.969 Y123.532 E.01592
N3041 G1 X190.751 Y145.314 E.91873
N3042 G1 X190.751 Y144.78 E.01592
N3043 G1 X169.503 Y123.532 E.8962
N3044 G1 X170.036 Y123.532 E.01593
N3045 G1 X190.751 Y144.246 E.87368
N3046 G1 X190.751 Y143.712 E.01592
N3047 G1 X170.57 Y123.532 E.85116
N3048 G1 X171.104 Y123.532 E.01592
N3049 G1 X190.751 Y143.178 E.82864
N3050 G1 X190.751 Y142.644 E.01592
N3051 G1 X171.638 Y123.532 E.80612
N3052 G1 X172.172 Y123.532 E.01592
N3053 G1 X190.751 Y142.11 E.7836
N3054 G1 X190.751 Y141.576 E.01592
N3055 G1 X172.706 Y123.532 E.76108
N3056 G1 X173.24 Y123.532 E.01592
N3057 G1 X190.751 Y141.043 E.73856
N3058 G1 X190.751 Y140.509 E.01593
N3059 G1 X173.774 Y123.532 E.71603
N3060 G1 X174.308 Y123.532 E.01592
N3061 G1 X190.751 Y139.975 E.69351
N3062 G1 X190.751 Y139.441 E.01592
N3063 G1 X174.842 Y123.532 E.67099
N3064 G1 X175.376 Y123.532 E.01592
N3065 G1 X190.751 Y138.907 E.64847
N3066 G1 X190.751 Y138.373 E.01592
N3067 G1 X175.91 Y123.532 E.62595
N3068 G1 X176.444 Y123.532 E.01592
N3069 G1 X190.751 Y137.839 E.60343
N3070 G1 X190.751 Y137.305 E.01592
N3071 G1 X176.978 Y123.532 E.58091
N3072 G1 X177.512 Y123.532 E.01592
N3073 G1 X190.751 Y136.771 E.55839
N3074 G1 X190.751 Y136.237 E.01592
N3075 G1 X178.046 Y123.532 E.53587
N3076 G1 X178.58 Y123.532 E.01592
N3077 G1 X190.751 Y135.703 E.51335
N3078 G1 X190.751 Y135.169 E.01592
N3079 G1 X179.114 Y123.532 E.49082
N3080 G1 X179.648 Y123.532 E.01592
N3081 G1 X190.751 Y134.635 E.4683
N3082 G1 X190.751 Y134.101 E.01592
N3083 G1 X180.182 Y123.532 E.44578
N3084 G1 X180.715 Y123.532 E.01592
N3085 G1 X190.751 Y133.567 E.42326
N3086 G1 X190.751 Y133.033 E.01592
N3087 G1 X181.249 Y123.532 E.40074
N3088 G1 X181.783 Y123.532 E.01592
N3089 G1 X190.751 Y132.499 E.37822
N3090 G1 X190.751 Y131.965 E.01592
N3091 G1 X182.317 Y123.532 E.3557
N3092 G1 X182.851 Y123.532 E.01592
N3093 G1 X190.751 Y131.431 E.33318
N3094 G1 X190.751 Y130.897 E.01592
N3095 G1 X183.385 Y123.532 E.31066
N3096 G1 X183.919 Y123.532 E.01592
N3097 G1 X190.751 Y130.364 E.28813
N3098 G1 X190.751 Y129.83 E.01592
N3099 G1 X184.453 Y123.532 E.26561
N3100 G1 X184.987 Y123.532 E.01592
N3101 G1 X190.751 Y129.296 E.24309
N3102 G1 X190.751 Y128.762 E.01592
N3103 G1 X185.521 Y123.532 E.22057
N3104 G1 X186.055 Y123.532 E.01592
N3105 G1 X190.751 Y128.228 E.19805
N3106 G1 X190.751 Y127.694 E.01592
N3107 G1 X186.589 Y123.532 E.17553
N3108 G1 X187.123 Y123.532 E.01592
N3109 G1 X190.751 Y127.16 E.15301
N3110 G1 X190.751 Y126.626 E.01592
N3111 G1 X187.657 Y123.532 E.13049
N3112 G1 X188.191 Y123.532 E.01592
N3113 G1 X190.751 Y126.092 E.10797
N3114 G1 X190.751 Y125.558 E.01592
N3115 G1 X188.725 Y123.532 E.08544
N3116 G1 X189.259 Y123.532 E.01592
N3117 G1 X190.751 Y125.024 E.06292
N3118 G1 X190.751 Y124.49 E.01592
N3119 G1 X189.793 Y123.532 E.0404
N3120 G1 X190.327 Y123.532 E.01592
N3121 G1 X190.92 Y124.126 E.02504
N3122 ; WIPE_START
N3123 G1 X190.327 Y123.532 E-.31901
N3124 G1 X189.793 Y123.532 E-.2029
N3125 G1 X190.236 Y123.975 E-.23809
N3126 ; WIPE_END
N3127 G1 E-.04 F1800
N3128 M204 S10000
N3129 G17
N3130 G3 Z1 I1.217 J0 P1  F60000
N3131 ; stop printing object, unique label id: 130
N3132 M625
N3133 ; object ids of layer 3 start: 130,138
N3134 M624 AwAAAAAAAAA=
N3135 ;======== H2D 20250527========
N3136 ; SKIPPABLE_START
N3137 ; SKIPTYPE: timelapse
N3138 M622.1 S1 ; for prev firware, default turned on
N3139 
N3140 M1002 judge_flag timelapse_record_flag
N3141 
N3142 M622 J1
N3143 M993 A2 B2 C2
N3144 M993 A0 B0 C0
N3145 
N3146 
N3147 
N3148 
N3149     M9711 M0 E1 X260 Y137 Z1 S11 C10 O0 T3000
N3150 
N3151 
N3152 
N3153 M993 A3 B3 C3
N3154 
N3155 M623
N3156 ; SKIPPABLE_END
N3157 
N3158 ; object ids of this layer3 end: 130,138
N3159 M625
N3160 G1 X195.495 Y279.064
N3161 G1 Z.6
N3162 G1 E.8 F1800
N3163 ; LAYER_HEIGHT: 0.200000
N3164 ; FEATURE: Prime tower
N3165 ; LINE_WIDTH: 0.500000
N3166 ; WIPE_TOWER_START
N3167 M204 S10000
N3168 G1  X195.995 Y279.564  
N3169 M204 S8000
N3170 G3  X193.533 Y281.605   I-4.373 J-2.768 E0.1236 F5400
N3171 G3  X190.885 Y280.355   I0.012 J-3.454 E0.1149
N3172 G2  X188.182 Y279.564   I-2.709 J4.247 E0.1085
N3173 G2  X174.618 Y279.568   I-6.687 J357.435 E0.5155
N3174 G2  X170.683 Y281.445   I0.499 J6.110 E0.1694
N3175 G3  X168.371 Y281.015   I-0.854 J-1.838 E0.0953
N3176 G1  X166.995 Y279.564   E0.0760
N3177 G3  X165.064 Y277.242   I3.871 J-5.183 E0.1159
N3178 G3  X166.240 Y274.649   I2.902 J-0.247 E0.1130
N3179 G2  X166.995 Y272.245   I-3.465 J-2.409 E0.0972
N3180 G2  X166.992 Y259.212   I-321.195 J-6.431 E0.4954
N3181 G2  X165.146 Y255.634   I-6.663 J1.171 E0.1554
N3182 G3  X165.485 Y253.656   I1.658 J-0.734 E0.0808
N3183 G1  X168.371 Y250.613   E0.1594
N3184 G3  X171.793 Y251.056   I1.525 J1.652 E0.1495
N3185 G2  X174.808 Y252.064   I3.021 J-4.025 E0.1229
N3186 G2  X188.372 Y252.060   I6.687 J-357.435 E0.5155
N3187 G2  X192.307 Y250.183   I-0.499 J-6.110 E0.1694
N3188 G3  X194.619 Y250.613   I0.854 J1.838 E0.0953
N3189 G1  X195.609 Y251.657   E0.0547
N3190 G1 E-0.8000 F1800
N3191 M204 S10000
N3192 G1  X197.329 Y253.471   F600
N3193 G1 E0.8000 F1800
N3194 M204 S8000
N3195 G3  X196.957 Y256.707   I-1.339 J1.486 E0.1447 F5400
N3196 G2  X195.995 Y259.382   I3.254 J2.680 E0.1102
N3197 G2  X195.998 Y272.416   I321.212 J6.432 E0.4954
N3198 G2  X197.844 Y275.994   I6.663 J-1.171 E0.1554
N3199 G3  X197.504 Y277.972   I-1.658 J0.734 E0.0808
N3200 G1  X195.995 Y279.564   E0.0834
N3201 ; WIPE_TOWER_END
N3202 G1  X195.495 Y252.064  
N3203 ; LAYER_HEIGHT: 0.200000
N3204 ; FEATURE: Prime tower
N3205 ; LINE_WIDTH: 0.500000
N3206 ; WIPE_TOWER_START
N3207 M204 S8000
N3208 G1  X167.495  E1.0642
N3209 G1  Y272.314  E0.2565
N3210 G1  X195.495  E1.0642
N3211 G1  Y279.064  E0.2565
N3212 M204 S10000
N3213 G1  X168.495 Y272.314  
N3214 ;--------------------
N3215 ; CP EMPTY GRID START
N3216 ; layer #4
N3217 M204 S8000
N3218 G1  Y279.064  E0.2565
N3219 M204 S10000
N3220 G1  X177.162 
N3221 M204 S8000
N3222 G1  Y272.314  E0.2565
N3223 M204 S10000
N3224 G1  X185.828 
N3225 M204 S8000
N3226 G1  Y279.064  E0.2565
N3227 M204 S10000
N3228 G1  X194.495 
N3229 M204 S8000
N3230 G1  Y272.314  E0.2565
N3231 ; CP EMPTY GRID END
N3232 ;------------------
N3233 
N3234 
N3235 
N3236 
N3237 
N3238 
N3239 ; WIPE_TOWER_END
N3240 ; LAYER_HEIGHT: 0.200000
N3241 ; FEATURE: Prime tower
N3242 ; LINE_WIDTH: 0.500000
N3243 ;--------------------
N3244 ; CP TOOLCHANGE START
N3245 ; toolchange #3
N3246 ; material : TPU-AMS -> TPU-AMS
N3247 ;--------------------
N3248 M220 B
N3249 M220 S100
N3250 ; WIPE_TOWER_START
N3251 G1 E-.8 F1800
N3252 G17
N3253 G3 Z1 I1.217 J0 P1  F60000
N3254 G1 X167.745 Y266.314
N3255 G1 Z.6
N3256 G1 E.8 F1800
N3257 ; LAYER_HEIGHT: 0.200000
N3258 ; FEATURE: Prime tower
N3259 ; LINE_WIDTH: 1.000000
N3260 ; NOZZLE_CHANGE_START OF0 NF2
N3261 M204 S8000
N3262 G1  X195.245 Y266.314  E2.1885 F3605
N3263 G1  Y267.564  E0.0995
N3264 G1  X167.745  E2.1885
N3265 G1  Y268.814  E0.0995
N3266 G1  X195.245  E2.1885
N3267 G1  Y270.064  E0.0995
N3268 G1  X167.745  E2.1885
N3269 G1  Y271.314  E0.0995
N3270 G1  X195.245  E2.1885
N3271 ; NOZZLE_CHANGE_END OF0 NF2
N3272 M104 T1 S183 N0 ;Multi extruder pre cooling
N3273 
N3274 ; WIPE_START
N3275 G1 F5400
N3276 M204 S8000
N3277 G1 X193.245 Y271.314 E-1.9
N3278 ; WIPE_END
N3279 G1 E-.1 F1800
N3280 M204 S10000
N3281 G17
N3282 M73 P42 R21
N3283 G3 Z1 I1.217 J0 P1  F5400
N3284 ; filament end gcode 
N3285 
N3286 ;======== H2D ========
N3287 ;===== 20250604 =====
N3288 M993 A2 B2 C2 ; nozzle cam detection allow status save.
N3289 M993 A0 B0 C0 ; nozzle cam detection not allowed.
N3290 
N3291 
N3292 M1015.4 S0 ; disable E air printing detect
N3293 
N3294 
N3295 M620 S2A
N3296 M1002 gcode_claim_action : 4
N3297 M204 S9000
N3298 
N3299 G1 Z3.6 F1200
N3300 
N3301 M400
N3302 M106 P1 S0
N3303 M106 P2 S0
N3304 
N3305 
N3306 
N3307 
N3308 M620.10 A0 F286.867 L0 H0.4 T270 P255 S1
N3309 
N3310 
N3311 
N3312 M620.10 A1 F261.922 L0 H0.4 T250 P230 S1
N3313 
N3314 
N3315 
N3316 M620.11 P0 I0 E0
N3317 
N3318 
N3319 
N3320 M620.11 K1 I0 R10 F286.867
N3321 
N3322 
N3323 M628 S1
N3324 
N3325 
N3326 M620.11 S1 L0 I0 R10 D8 E-10 F286.867
N3327 
N3328 
N3329 M629
N3330 
N3331 
N3332 M620.11 H0
N3333 
N3334 
N3335 T2
N3336 M73 E3
N3337 
N3338 ;deretract
N3339 
N3340 
N3341 ;VG1 E4 F261
N3342 ;VG1 E4 F130
N3343 
N3344 
N3345 
N3346 ; VFLUSH_START
N3347 
N3348 
N3349 ;VG1 E0 F261
N3350 
N3351 
N3352 SYNC T0
N3353 
N3354 ; VFLUSH_END
N3355 
N3356 M1002 set_filament_type:TPU-AMS
N3357 
N3358 M400
N3359 M83
N3360 
N3361 
N3362 
N3363 M628 S0
N3364 ;VM109 S230
N3365 M629
N3366 M400
N3367 
N3368 M983.3 F4.375 A0.4
N3369 
N3370 
N3371 M400
N3372 
N3373 G1 Y320 F30000
N3374 G1 X201
N3375 
N3376 G1 Y295
N3377 G1 Y265 F18000
N3378 G1 Z3.6 F3000
N3379 
N3380 M204 S8000
N3381 
N3382 
N3383 M621 S2A
N3384 
N3385 M993 A3 B3 C3 ; nozzle cam detection allow status restore.
N3386 
N3387 
N3388 M1015.3 S0;disable tpu clog detect
N3389 
N3390 
N3391 
N3392 M1015.4 S0 ; disable E air printing detect
N3393 
N3394 
N3395 M620.6 I2 W1 ;enable ams air printing detect
N3396 M1002 gcode_claim_action : 0
N3397 M106 S25.5
N3398 M106 P2 S255
N3399 G1 X200 Y252.564 F60000
N3400 G1 Z.6
N3401 G1 X195.495 Y252.564 Z1
N3402 
N3403 ; filament start gcode
N3404 G1 Z.6
N3405 G1 E2 F1800
N3406 
N3407 G4 S0
N3408 ; CP TOOLCHANGE WIPE
N3409 ; LINE_WIDTH: 0.500000
N3410 M204 S8000
N3411 G1  X192.495 Y252.564  E0.1140 F1782
N3412 G1 E-0.8000 F1800
N3413 M204 S10000
N3414 G1  X196.995  F600
N3415 G1  X195.495  F240
N3416 G1  X195.995  F600
N3417 G1  Y253.064 
N3418 G1  X194.995 
N3419 G1  Y252.064 
N3420 G1  X196.495 
N3421 G1  Y253.564 
N3422 G1  X194.495 
N3423 G1  Y251.564 
N3424 G1  X192.495 Y252.564   F1782
N3425 G1 E0.8000 F1800
N3426 M204 S8000
N3427 G1  X167.495  E0.9502 F1782
N3428 G1  Y253.314  E0.0285
N3429 G1  X195.495  E1.0642 F2025
N3430 G1  Y254.064  E0.0285
N3431 G1  X167.495  E1.0642 F2473
N3432 G1  Y254.814  E0.0285
N3433 G1  X195.495  E1.0642 F4725
N3434 G1  Y255.564  E0.0285
N3435 G1  X167.495  E1.0642 F4775
N3436 G1  Y256.314  E0.0285
N3437 G1  X195.495  E1.0642 F4825
N3438 G1  Y257.064  E0.0285
N3439 G1  X167.495  E1.0642 F4875
N3440 G1  Y257.814  E0.0285
N3441 G1  X195.495  E1.0642 F4925
N3442 G1  Y258.564  E0.0285
N3443 G1  X167.495  E1.0642 F4975
N3444 G1  Y259.314  E0.0285
N3445 G1  X195.495  E1.0642 F5025
N3446 G1  Y260.064  E0.0285
N3447 G1  X167.495  E1.0642 F5075
N3448 G1  Y260.814  E0.0285
N3449 G1  X195.495  E1.0642 F5125
N3450 G1  Y261.564  E0.0285
N3451 G1  X167.495  E1.0642 F5175
N3452 G1  Y262.314  E0.0285
N3453 G1  X195.495  E1.0642 F5225
N3454 G1  Y263.064  E0.0285
N3455 G1  X167.495  E1.0642 F5275
N3456 G1  Y263.814  E0.0285
N3457 G1  X195.495  E1.0642 F5325
N3458 G1  Y264.564  E0.0285
N3459 G1  X167.495  E1.0642 F5375
N3460 G1  Y265.314  E0.0285
N3461 G1  X195.495  E1.0642 F5400
N3462 ; WIPE_TOWER_END
N3463 M220 R
N3464 G1 F60000
N3465 G4 S0
N3466 G92 E0
N3467 ; CP TOOLCHANGE END
N3468 ;------------------
N3469 
N3470 
N3471 
N3472 ; WIPE_START
N3473 G1 F5400
N3474 M204 S8000
N3475 G1 X193.495 Y265.314 E-.76
N3476 ; WIPE_END
N3477 G1 E-.04 F1800
N3478 M204 S10000
N3479 G17
N3480 G3 Z1 I1.217 J0 P1  F60000
N3481 ; OBJECT_ID: 138
N3482 ; COOLING_NODE: 0
N3483 ; start printing object, unique label id: 138
N3484 M624 AgAAAAAAAAA=
N3485 G1 X182.34 Y114.898
N3486 G1 Z.6
N3487 G1 E.8 F1800
N3488 ; FEATURE: Outer wall
N3489 ; LINE_WIDTH: 0.42
N3490 ; LAYER_HEIGHT: 0.2
N3491 G1 F8353.673
N3492 M204 S5000
N3493 G1 X167.76 Y114.898 E.45715
N3494 G1 X167.76 Y114.318 E.01819
N3495 G1 X182.34 Y114.318 E.45715
N3496 G1 X182.34 Y114.838 E.0163
N3497 M204 S10000
N3498 G1 X182.144 Y114.608 F60000
N3499 ; FEATURE: Gap infill
N3500 ; LINE_WIDTH: 0.23088
N3501 G1 F15000
N3502 M204 S8000
N3503 G1 X167.956 Y114.608 E.22174
N3504 ; CHANGE_LAYER
N3505 ; Z_HEIGHT: 0.8
N3506 ; LAYER_HEIGHT: 0.2
N3507 ; WIPE_START
N3508 G1 F15000
N3509 G1 X169.956 Y114.608 E-.76
N3510 ; WIPE_END
N3511 G1 E-.04 F1800
N3512 ; stop printing object, unique label id: 138
N3513 M625
N3514 ;======== H2D 20250521========
N3515 ; layer num/total_layer_count: 4/63
N3516 ; update layer progress
N3517 M73 L4
N3518 M991 S0 P3 ;notify layer change
N3519 
N3520 
N3521 ; OBJECT_ID: 138
N3522 ; COOLING_NODE: 0
N3523 ; start printing object, unique label id: 138
N3524 M624 AgAAAAAAAAA=
N3525 M204 S10000
N3526 G17
N3527 G3 Z1 I-.028 J1.217 P1  F60000
N3528 G1 X182.34 Y114.898 Z1
N3529 G1 Z.8
N3530 G1 E.8 F1800
N3531 ; FEATURE: Outer wall
N3532 ; LINE_WIDTH: 0.42
N3533 ; LAYER_HEIGHT: 0.2
N3534 G1 F8353.673
N3535 M204 S5000
N3536 G1 X167.76 Y114.898 E.45715
N3537 G1 X167.76 Y114.318 E.01819
N3538 G1 X182.34 Y114.318 E.45715
N3539 G1 X182.34 Y114.838 E.0163
N3540 M204 S10000
N3541 G1 X182.144 Y114.608 F60000
N3542 ; FEATURE: Gap infill
N3543 ; LINE_WIDTH: 0.23088
N3544 G1 F15000
N3545 M204 S8000
N3546 G1 X167.956 Y114.608 E.22174
N3547 ; WIPE_START
N3548 G1 X169.956 Y114.608 E-.76
N3549 ; WIPE_END
N3550 G1 E-.04 F1800
N3551 ; stop printing object, unique label id: 138
N3552 M625
N3553 M204 S10000
N3554 G17
N3555 G3 Z1.2 I-1.217 J-.02 P1  F60000
N3556 G1 X167.495 Y265.564 Z1.2
N3557 G1 Z.8
N3558 G1 E.8 F1800
N3559 ; LAYER_HEIGHT: 0.200000
N3560 ; FEATURE: Prime tower
N3561 ; LINE_WIDTH: 0.500000
N3562 ; WIPE_TOWER_START
N3563 M204 S8000
N3564 G1  X167.495 Y260.064  E0.2090 F5400
N3565 G1  X195.495  E1.0642
N3566 G1  Y265.564  E0.2090
N3567 G1  X167.495  E1.0642
N3568 M204 S10000
N3569 G1  X168.495 Y260.064  
N3570 ;--------------------
N3571 ; CP EMPTY GRID START
N3572 ; layer #5
N3573 M204 S8000
N3574 G1  Y265.564  E0.2090
N3575 M204 S10000
N3576 G1  X177.162 
N3577 M204 S8000
N3578 G1  Y260.064  E0.2090
N3579 M204 S10000
N3580 G1  X185.828 
N3581 M204 S8000
N3582 G1  Y265.564  E0.2090
N3583 M204 S10000
N3584 G1  X194.495 
N3585 M204 S8000
N3586 G1  Y260.064  E0.2090
N3587 ; CP EMPTY GRID END
N3588 ;------------------
N3589 
N3590 
N3591 
N3592 
N3593 
N3594 
N3595 ; WIPE_TOWER_END
N3596 ; LAYER_HEIGHT: 0.200000
N3597 ; FEATURE: Prime tower
N3598 ; LINE_WIDTH: 0.500000
N3599 ;--------------------
N3600 ; CP TOOLCHANGE START
N3601 ; toolchange #4
N3602 ; material : PETG-CF -> PETG-CF
N3603 ;--------------------
N3604 M220 B
N3605 M220 S100
N3606 ; WIPE_TOWER_START
N3607 G1 E-.8 F1800
N3608 G17
N3609 M73 P43 R21
N3610 G3 Z1.2 I1.217 J0 P1  F60000
N3611 G1 X167.745 Y252.814 Z.8
N3612 G1 E.8 F1800
N3613 ; LAYER_HEIGHT: 0.200000
N3614 ; FEATURE: Prime tower
N3615 ; LINE_WIDTH: 1.000000
N3616 ; NOZZLE_CHANGE_START OF2 NF0
N3617 M104 T0 S200 N0 ;Multi extruder pre cooling in post extrusion
N3618 M204 S8000
N3619 G1  X195.245 Y252.814  E2.1885 F550
N3620 G1  Y254.314  E0.1194
N3621 G1  X167.745  E2.1885
N3622 G1  Y255.814  E0.1194
N3623 G1  X195.245  E2.1885
N3624 G1  Y257.314  E0.1194
N3625 G1  X167.745  E2.1885
N3626 G1  Y258.814  E0.1194
N3627 M104 T1 S255 N0 ;Multi extruder pre heating
N3628 G1  X195.245  E2.1885
N3629 M204 S10000
N3630 G1  Y259.814 
N3631 G1  X168.245  F398
N3632 G1  Y258.314 
N3633 G1  X194.745 
N3634 G1  Y256.814 
N3635 G1  X168.245 
N3636 G1  Y255.314 
N3637 M73 P44 R20
N3638 G1  X194.745 
N3639 G1  Y253.814 
N3640 G1  X168.245 
N3641 ; NOZZLE_CHANGE_END OF2 NF0
N3642 M104 T0 S140 N0 ;Multi extruder pre cooling
N3643 
N3644 G1 E-2 F1800
N3645 G17
N3646 G3 Z1.2 I1.217 J0 P1  F5400
N3647 ; filament end gcode 
N3648 
N3649 ;======== H2D ========
N3650 ;===== 20250604 =====
N3651 M993 A2 B2 C2 ; nozzle cam detection allow status save.
N3652 M993 A0 B0 C0 ; nozzle cam detection not allowed.
N3653 
N3654 
N3655 M1015.4 S1 K0 ;disable E air printing detect
N3656 
N3657 
N3658 M620 S0A
N3659 M1002 gcode_claim_action : 4
N3660 M204 S9000
N3661 
N3662 G1 Z3.8 F1200
N3663 
N3664 M400
N3665 M106 P1 S0
N3666 M106 P2 S0
N3667 
N3668 
N3669 
N3670 
N3671 M620.10 A0 F261.922 L0 H0.4 T250 P230 S1
N3672 
N3673 
N3674 
N3675 M620.10 A1 F286.867 L0 H0.4 T270 P255 S1
N3676 
N3677 
N3678 
N3679 M620.11 P0 I2 E0
N3680 
N3681 
N3682 
N3683 M620.11 K1 I2 R10 F261.922
N3684 
N3685 
N3686 M628 S1
N3687 
N3688 
N3689 M620.11 S1 L0 I2 R10 D8 E-10 F261.922
N3690 
N3691 
N3692 M629
N3693 
N3694 
N3695 M620.11 H0
N3696 
N3697 
N3698 T0
N3699 M73 E2
N3700 
N3701 ;deretract
N3702 
N3703 
N3704 ;VG1 E4 F286
N3705 ;VG1 E4 F143
N3706 
N3707 
N3708 
N3709 ; VFLUSH_START
N3710 
N3711 
N3712 ;VG1 E0 F261
N3713 
N3714 
N3715 SYNC T0
N3716 
N3717 ; VFLUSH_END
N3718 
N3719 M1002 set_filament_type:PETG-CF
N3720 
N3721 M400
N3722 M83
N3723 
N3724 
N3725 
N3726 M628 S0
N3727 ;VM109 S255
N3728 M629
N3729 M400
N3730 
N3731 M983.3 F4.79167 A0.4
N3732 
N3733 
N3734 M400
N3735 
N3736 G1 Y320 F30000
N3737 G1 X201
N3738 
N3739 M73 P45 R20
N3740 G1 Y295
N3741 G1 Y265 F18000
N3742 G1 Z3.8 F3000
N3743 
N3744 M204 S8000
N3745 
N3746 
N3747 M621 S0A
N3748 
N3749 M993 A3 B3 C3 ; nozzle cam detection allow status restore.
N3750 
N3751 
N3752 M1015.3 S0;disable tpu clog detect
N3753 
N3754 
N3755 
N3756 M1015.4 S1 K1 H0.4 ;enable E air printing detect
N3757 
N3758 
N3759 M620.6 I0 W1 ;enable ams air printing detect
N3760 M1002 gcode_claim_action : 0
N3761 M106 S12.75
N3762 M106 P2 S0
N3763 G1 X200 Y265.364 F60000
N3764 G1 Z.8
N3765 G1 X200 Y272.996 Z1.2
N3766 G1 X200 Y283.638 Z1.2
N3767 G1 X162.991 Y283.638
N3768 G1 X162.991 Y278.814
N3769 G1 X167.495 Y278.814
N3770 
N3771 ; filament start gcode
N3772 G1 Z.8
N3773 G1 E2 F1800
N3774 
N3775 G4 S0
N3776 ; CP TOOLCHANGE WIPE
N3777 ; LINE_WIDTH: 0.500000
N3778 M204 S8000
N3779 G1  X170.495 Y278.814  E0.1140 F1782
N3780 G1 E-0.8000 F1800
N3781 M204 S10000
N3782 G1  X165.995  F600
N3783 G1  X167.495  F240
N3784 G1  X167.995  F600
N3785 G1  Y279.314 
N3786 G1  X166.995 
N3787 G1  Y278.314 
N3788 G1  X168.495 
N3789 G1  Y279.814 
N3790 G1  X166.495 
N3791 G1  Y277.814 
N3792 G1  X170.495 Y278.814   F1782
N3793 G1 E0.8000 F1800
N3794 M204 S8000
N3795 G1  X195.495  E0.9502 F1782
N3796 G1  Y278.064  E0.0285
N3797 G1  X167.495  E1.0642 F2025
N3798 G1  Y277.314  E0.0285
N3799 G1  X195.495  E1.0642 F2473
N3800 G1  Y276.564  E0.0285
N3801 G1  X167.495  E1.0642 F4725
N3802 G1  Y275.814  E0.0285
N3803 G1  X195.495  E1.0642 F4775
N3804 G1  Y275.064  E0.0285
N3805 G1  X167.495  E1.0642 F4825
N3806 G1  Y274.314  E0.0285
N3807 G1  X195.495  E1.0642 F4875
N3808 G1  Y273.564  E0.0285
N3809 G1  X167.495  E1.0642 F4925
N3810 G1  Y272.814  E0.0285
N3811 G1  X195.495  E1.0642 F4975
N3812 G1  Y272.064  E0.0285
N3813 G1  X167.495  E1.0642 F5025
N3814 G1  Y271.314  E0.0285
N3815 G1  X195.495  E1.0642 F5075
N3816 G1  Y270.564  E0.0285
N3817 G1  X167.495  E1.0642 F5125
N3818 G1  Y269.814  E0.0285
N3819 G1  X195.495  E1.0642 F5175
N3820 G1  Y269.064  E0.0285
N3821 G1  X167.495  E1.0642 F5225
N3822 G1  Y268.314  E0.0285
N3823 G1  X195.495  E1.0642 F5275
N3824 G1  Y267.564  E0.0285
N3825 G1  X167.495  E1.0642 F5325
N3826 G1  Y266.814  E0.0285
N3827 G1  X195.495  E1.0642 F5375
N3828 G1  Y266.064  E0.0285
N3829 G1  X167.495  E1.0642 F5400
N3830 ; WIPE_TOWER_END
N3831 M220 R
N3832 G1 F60000
N3833 G4 S0
N3834 G92 E0
N3835 ; CP TOOLCHANGE END
N3836 ;------------------
N3837 
N3838 
N3839 G1  Y252.064  
N3840 ; LAYER_HEIGHT: 0.200000
N3841 ; FEATURE: Prime tower
N3842 ; LINE_WIDTH: 0.500000
N3843 ; WIPE_TOWER_START
N3844 M204 S10000
N3845 G1  X168.371 Y281.015  
N3846 M204 S8000
N3847 G1  X167.144 Y279.721   E0.0678 F5400
N3848 G1 E-0.8000 F1800
N3849 M204 S10000
N3850 G1  X165.426 Y277.905   F600
N3851 G1 E0.8000 F1800
N3852 M204 S8000
N3853 G3  X166.033 Y274.920   I1.593 J-1.230 E0.1313 F5400
N3854 G2  X166.995 Y272.245   I-3.254 J-2.680 E0.1102
N3855 G2  X166.992 Y259.212   I-321.195 J-6.431 E0.4954
N3856 G2  X165.146 Y255.634   I-6.663 J1.171 E0.1554
N3857 G3  X165.485 Y253.656   I1.658 J-0.734 E0.0808
N3858 G3  X168.604 Y250.403   I19.398 J15.476 E0.1715
N3859 G3  X171.793 Y251.056   I1.276 J1.879 E0.1379
N3860 G2  X174.808 Y252.064   I3.021 J-4.025 E0.1229
N3861 G2  X188.372 Y252.060   I6.687 J-357.435 E0.5155
N3862 G2  X192.307 Y250.183   I-0.499 J-6.110 E0.1694
N3863 G3  X194.619 Y250.613   I0.854 J1.838 E0.0953
N3864 G1  X195.995 Y252.064   E0.0760
N3865 G1 E0.0000
N3866 G3  X197.926 Y254.386   I-3.871 J5.182 E0.1159
N3867 G3  X196.750 Y256.979   I-2.902 J0.247 E0.1130
N3868 G2  X195.995 Y259.382   I3.464 J2.409 E0.0972
N3869 G2  X195.998 Y272.416   I321.212 J6.432 E0.4954
N3870 G2  X197.844 Y275.994   I6.663 J-1.171 E0.1554
N3871 G3  X197.504 Y277.972   I-1.658 J0.734 E0.0808
N3872 G1  X195.995 Y279.564   E0.0834
N3873 G3  X193.533 Y281.605   I-4.373 J-2.768 E0.1236
N3874 G3  X190.885 Y280.355   I0.012 J-3.454 E0.1149
N3875 G2  X188.182 Y279.564   I-2.709 J4.247 E0.1085
N3876 G2  X174.618 Y279.568   I-6.687 J357.435 E0.5155
N3877 G2  X170.683 Y281.445   I0.499 J6.110 E0.1694
N3878 G3  X168.371 Y281.015   I-0.854 J-1.838 E0.0953
N3879 ; WIPE_TOWER_END
N3880 
N3881 ; WIPE_START
N3882 G1 F15000
N3883 M204 S8000
N3884 G1 X168.484 Y281.125 E-.05968
N3885 G1 X168.604 Y281.225 E-.05967
N3886 G1 X168.733 Y281.316 E-.05968
N3887 G1 X168.868 Y281.396 E-.05967
N3888 G1 X169.008 Y281.466 E-.05968
N3889 G1 X169.154 Y281.524 E-.05967
N3890 G1 X169.304 Y281.571 E-.05968
N3891 G1 X169.457 Y281.605 E-.05967
N3892 G1 X169.613 Y281.628 E-.05967
N3893 G1 X169.769 Y281.638 E-.05968
N3894 G1 X169.927 Y281.636 E-.05967
N3895 G1 X170.083 Y281.622 E-.05967
N3896 G1 X170.197 Y281.603 E-.0439
N3897 ; WIPE_END
N3898 G1 E-.04 F1800
N3899 M204 S10000
N3900 G17
N3901 G3 Z1.2 I1.217 J0 P1  F60000
N3902 ; OBJECT_ID: 130
N3903 ; COOLING_NODE: 0
N3904 ; start printing object, unique label id: 130
N3905 M624 AQAAAAAAAAA=
N3906 G1 X191.084 Y196.801 Z.8
N3907 G1 E.8 F1800
N3908 ; FEATURE: Inner wall
N3909 ; LINE_WIDTH: 0.45
N3910 ; LAYER_HEIGHT: 0.2
N3911 G1 F8475
N3912 M204 S8000
N3913 G1 X158.916 Y196.801 E1.03439
N3914 G1 X158.916 Y123.199 E2.36678
N3915 G1 X191.084 Y123.199 E1.03439
N3916 G1 X191.084 Y196.741 E2.36485
N3917 ; COOLING_NODE: 0
N3918 M204 S10000
N3919 G1 X191.491 Y197.208 F60000
N3920 G1 F8475
N3921 M204 S8000
N3922 G1 X158.509 Y197.208 E1.06057
N3923 G1 X158.509 Y122.792 E2.39296
N3924 G1 X191.491 Y122.792 E1.06057
N3925 G1 X191.491 Y197.148 E2.39103
N3926 ; COOLING_NODE: 0
N3927 M204 S10000
N3928 G1 X191.898 Y197.615 F60000
N3929 G1 F8475
N3930 M204 S8000
N3931 G1 X158.102 Y197.615 E1.08675
N3932 G1 X158.102 Y122.385 E2.41914
N3933 G1 X191.898 Y122.385 E1.08675
N3934 G1 X191.898 Y197.555 E2.41721
N3935 ; COOLING_NODE: 0
N3936 M204 S10000
N3937 G1 X192.29 Y198.007 F60000
N3938 ; FEATURE: Outer wall
N3939 ; LINE_WIDTH: 0.42
N3940 G1 F9149.261
N3941 M204 S5000
N3942 G1 X157.71 Y198.007 E1.03002
N3943 G1 X157.71 Y121.993 E2.26421
N3944 G1 X192.29 Y121.993 E1.03002
N3945 G1 X192.29 Y197.947 E2.26243
N3946 G1 E-.8 F1800
N3947 M204 S10000
N3948 G1 X184.677 Y197.401 Z1.2 F60000
N3949 G1 X171.447 Y196.453 Z1.2
N3950 G1 Z.8
N3951 G1 E.8 F1800
N3952 ; FEATURE: Sparse infill
N3953 ; LINE_WIDTH: 0.45
N3954 G1 F8475
N3955 M204 S8000
N3956 G1 X173.076 Y196.453 E.05236
N3957 G1 X190.736 Y130.545 E2.19411
N3958 G1 X190.736 Y128.88 E.05356
N3959 G1 X185.403 Y123.547 E.2425
N3960 G1 X184.182 Y123.547 E.03927
N3961 G1 X164.647 Y196.453 E2.42708
N3962 G1 X163.019 Y196.453 E.05236
N3963 M204 S10000
N3964 G1 X159.264 Y186.712 F60000
N3965 G1 F8475
N3966 M204 S8000
N3967 G1 X159.264 Y185.084 E.05236
N3968 G1 X175.753 Y123.547 E2.04859
N3969 G1 X173.889 Y123.547 E.05994
N3970 G1 X190.736 Y140.394 E.76611
N3971 G1 X190.736 Y139.512 E.02836
N3972 G1 X159.264 Y147.944 E1.0477
N3973 G1 X159.264 Y146.316 E.05236
N3974 M204 S10000
N3975 M73 P46 R20
N3976 G1 X159.264 Y158.001 F60000
N3977 G1 F8475
N3978 M204 S8000
N3979 G1 X159.264 Y156.373 E.05236
N3980 M104 T0 S230 N0 ;Multi extruder pre heating
N3981 G1 X190.736 Y147.941 E1.04769
N3982 G1 X190.736 Y151.908 E.12757
N3983 G1 X162.375 Y123.547 E1.28972
N3984 G1 X167.324 Y123.547 E.15915
N3985 G1 X159.264 Y153.627 E1.00137
N3986 G1 X159.264 Y154.978 E.04346
N3987 G1 X190.736 Y186.449 E1.43118
N3988 G1 X190.736 Y181.656 E.15415
N3989 G1 X159.264 Y190.088 E1.0477
N3990 G1 X159.264 Y189.52 E.01827
N3991 G1 X166.197 Y196.453 E.31526
N3992 G1 X166.969 Y196.453 E.02481
N3993 G1 X190.736 Y190.084 E.79122
N3994 G1 X190.736 Y193.459 E.1085
N3995 G1 X189.933 Y196.453 E.09968
N3996 G1 X189.225 Y196.453 E.02278
N3997 G1 X159.264 Y166.492 E1.36248
N3998 G1 X159.264 Y164.802 E.05436
N3999 G1 X190.736 Y156.369 E1.0477
N4000 G1 X190.736 Y162.002 E.18112
N4001 G1 X181.504 Y196.453 E1.1469
N4002 G1 X177.711 Y196.453 E.12198
N4003 G1 X159.264 Y178.006 E.83887
N4004 G1 X159.264 Y181.66 E.11748
N4005 G1 X190.736 Y173.227 E1.0477
N4006 G1 X190.736 Y174.936 E.05494
N4007 G1 X159.264 Y143.464 E1.43118
N4008 G1 X159.264 Y139.516 E.12698
N4009 G1 X190.736 Y131.083 E1.0477
N4010 M204 S10000
N4011 G1 X189.031 Y123.547 F60000
N4012 G1 F8475
N4013 M204 S8000
N4014 G1 X187.403 Y123.547 E.05236
N4015 G1 X159.264 Y131.087 E.93674
N4016 G1 X159.264 Y131.951 E.02777
N4017 G1 X190.736 Y163.422 E1.43118
N4018 G1 X190.736 Y164.798 E.04426
N4019 G1 X159.264 Y173.231 E1.0477
N4020 G1 X159.264 Y171.602 E.05236
N4021 ; WIPE_START
N4022 G1 X159.264 Y173.231 E-.61876
N4023 G1 X159.623 Y173.135 E-.14124
N4024 ; WIPE_END
N4025 G1 E-.04 F1800
N4026 M204 S10000
N4027 G17
N4028 G3 Z1.2 I1.217 J0 P1  F60000
N4029 ; stop printing object, unique label id: 130
N4030 M625
N4031 ; object ids of layer 4 start: 130,138
N4032 M624 AwAAAAAAAAA=
N4033 ;======== H2D 20250527========
N4034 ; SKIPPABLE_START
N4035 ; SKIPTYPE: timelapse
N4036 M622.1 S1 ; for prev firware, default turned on
N4037 
N4038 M1002 judge_flag timelapse_record_flag
N4039 
N4040 M622 J1
N4041 M993 A2 B2 C2
N4042 M993 A0 B0 C0
N4043 
N4044 
N4045 
N4046 
N4047     M9711 M0 E1 X260 Y137 Z1.2 S11 C10 O0 T3000
N4048 
N4049 
N4050 
N4051 M993 A3 B3 C3
N4052 
N4053 M623
N4054 ; SKIPPABLE_END
N4055 
N4056 ; object ids of this layer4 end: 130,138
N4057 M625
N4058 ; CHANGE_LAYER
N4059 ; Z_HEIGHT: 1
N4060 ; LAYER_HEIGHT: 0.2
N4061 ;======== H2D 20250521========
N4062 ; layer num/total_layer_count: 5/63
N4063 ; update layer progress
N4064 M73 L5
N4065 M991 S0 P4 ;notify layer change
N4066 
N4067 
N4068 ; OBJECT_ID: 130
N4069 ; COOLING_NODE: 0
N4070 ; start printing object, unique label id: 130
N4071 M624 AQAAAAAAAAA=
N4072 G1 X191.084 Y196.801 F60000
N4073 G1 Z1
N4074 G1 E.8 F1800
N4075 ; FEATURE: Inner wall
N4076 ; LINE_WIDTH: 0.45
N4077 ; LAYER_HEIGHT: 0.2
N4078 G1 F8475
N4079 M204 S8000
N4080 G1 X158.916 Y196.801 E1.03439
N4081 G1 X158.916 Y123.199 E2.36678
N4082 G1 X191.084 Y123.199 E1.03439
N4083 G1 X191.084 Y196.741 E2.36485
N4084 ; COOLING_NODE: 0
N4085 M204 S10000
N4086 G1 X191.491 Y197.208 F60000
N4087 G1 F8475
N4088 M204 S8000
N4089 G1 X158.509 Y197.208 E1.06057
N4090 G1 X158.509 Y122.792 E2.39296
N4091 G1 X191.491 Y122.792 E1.06057
N4092 G1 X191.491 Y197.148 E2.39103
N4093 ; COOLING_NODE: 0
N4094 M204 S10000
N4095 G1 X191.898 Y197.615 F60000
N4096 G1 F8475
N4097 M204 S8000
N4098 G1 X158.102 Y197.615 E1.08675
N4099 G1 X158.102 Y122.385 E2.41914
N4100 G1 X191.898 Y122.385 E1.08675
N4101 G1 X191.898 Y197.555 E2.41721
N4102 ; COOLING_NODE: 0
N4103 M204 S10000
N4104 G1 X192.29 Y198.007 F60000
N4105 ; FEATURE: Outer wall
N4106 ; LINE_WIDTH: 0.42
N4107 G1 F9149.261
N4108 M204 S5000
N4109 G1 X157.71 Y198.007 E1.03002
N4110 G1 X157.71 Y121.993 E2.26421
N4111 G1 X192.29 Y121.993 E1.03002
N4112 G1 X192.29 Y197.947 E2.26243
N4113 G1 E-.8 F1800
N4114 M204 S10000
N4115 G1 X184.685 Y197.306 Z1.4 F60000
N4116 G1 X174.558 Y196.453 Z1.4
N4117 G1 Z1
N4118 G1 E.8 F1800
N4119 ; FEATURE: Sparse infill
N4120 ; LINE_WIDTH: 0.45
N4121 G1 F8475
N4122 M204 S8000
N4123 G1 X172.929 Y196.453 E.05236
N4124 G1 X190.736 Y129.999 E2.2123
N4125 G1 X190.736 Y128.68 E.04242
N4126 G1 X185.603 Y123.547 E.23341
N4127 G1 X184.035 Y123.547 E.05041
N4128 G1 X164.5 Y196.453 E2.42708
N4129 G1 X162.872 Y196.453 E.05236
N4130 M204 S10000
N4131 G1 X159.264 Y186.165 F60000
N4132 G1 F8475
N4133 M204 S8000
N4134 G1 X159.264 Y184.537 E.05236
N4135 G1 X175.607 Y123.547 E2.0304
N4136 G1 X174.089 Y123.547 E.0488
N4137 G1 X190.736 Y140.194 E.75702
N4138 G1 X190.736 Y139.658 E.01722
N4139 G1 X159.264 Y148.091 E1.0477
N4140 G1 X159.264 Y146.462 E.05236
N4141 M204 S10000
N4142 G1 X159.264 Y158.148 F60000
N4143 G1 F8475
N4144 M204 S8000
N4145 G1 X159.264 Y156.52 E.05236
N4146 G1 X190.736 Y148.087 E1.0477
N4147 G1 X190.736 Y151.708 E.11643
N4148 G1 X162.575 Y123.547 E1.28062
N4149 G1 X167.178 Y123.547 E.14801
N4150 M73 P46 R19
N4151 G1 X159.264 Y153.08 E.98318
N4152 G1 X159.264 Y154.778 E.0546
N4153 G1 X190.736 Y186.249 E1.43118
N4154 G1 X190.736 Y181.802 E.14301
N4155 G1 X159.264 Y190.235 E1.0477
N4156 G1 X159.264 Y189.32 E.02941
N4157 G1 X166.397 Y196.453 E.32436
N4158 G1 X167.515 Y196.453 E.03595
N4159 G1 X190.736 Y190.231 E.77303
N4160 G1 X190.736 Y192.912 E.08622
N4161 G1 X189.787 Y196.453 E.11787
N4162 G1 X189.425 Y196.453 E.01164
N4163 G1 X159.264 Y166.292 E1.37158
N4164 G1 X159.264 Y164.948 E.04322
N4165 G1 X190.736 Y156.516 E1.0477
N4166 G1 X190.736 Y161.455 E.15885
N4167 G1 X181.358 Y196.453 E1.16509
N4168 G1 X177.911 Y196.453 E.11085
N4169 G1 X159.264 Y177.806 E.84797
N4170 G1 X159.264 Y181.806 E.12861
N4171 G1 X190.736 Y173.373 E1.0477
N4172 G1 X190.736 Y174.736 E.0438
N4173 G1 X159.264 Y143.264 E1.43118
N4174 G1 X159.264 Y139.662 E.11584
N4175 G1 X190.736 Y131.229 E1.0477
N4176 M204 S10000
N4177 G1 X189.577 Y123.547 F60000
N4178 G1 F8475
N4179 M204 S8000
N4180 G1 X187.949 Y123.547 E.05236
N4181 G1 X159.264 Y131.233 E.95493
N4182 G1 X159.264 Y131.751 E.01664
N4183 G1 X190.736 Y163.222 E1.43118
N4184 G1 X190.736 Y164.944 E.0554
N4185 G1 X159.264 Y173.377 E1.0477
N4186 G1 X159.264 Y171.749 E.05236
N4187 ; WIPE_START
N4188 G1 X159.264 Y173.377 E-.61876
N4189 G1 X159.623 Y173.281 E-.14124
N4190 ; WIPE_END
N4191 G1 E-.04 F1800
N4192 M204 S10000
N4193 G17
N4194 G3 Z1.4 I1.217 J0 P1  F60000
N4195 ; stop printing object, unique label id: 130
N4196 M625
N4197 ; object ids of layer 5 start: 130,138
N4198 M624 AwAAAAAAAAA=
N4199 ;======== H2D 20250527========
N4200 ; SKIPPABLE_START
N4201 ; SKIPTYPE: timelapse
N4202 M622.1 S1 ; for prev firware, default turned on
N4203 
N4204 M1002 judge_flag timelapse_record_flag
N4205 
N4206 M622 J1
N4207 M993 A2 B2 C2
N4208 M993 A0 B0 C0
N4209 
N4210 
N4211 
N4212 
N4213     M9711 M0 E1 X260 Y137 Z1.4 S11 C10 O0 T3000
N4214 
N4215 
N4216 
N4217 M993 A3 B3 C3
N4218 
N4219 M623
N4220 ; SKIPPABLE_END
N4221 
N4222 ; object ids of this layer5 end: 130,138
N4223 M625
N4224 G1 X167.495 Y279.064
N4225 G1 Z1
N4226 G1 E.8 F1800
N4227 ; LAYER_HEIGHT: 0.200000
N4228 ; FEATURE: Prime tower
N4229 ; LINE_WIDTH: 0.500000
N4230 ; WIPE_TOWER_START
N4231 M204 S10000
N4232 G1  X166.995 Y279.564  
N4233 M204 S8000
N4234 G3  X165.064 Y277.242   I3.871 J-5.183 E0.1159 F5400
N4235 G3  X166.240 Y274.649   I2.902 J-0.247 E0.1130
N4236 G2  X166.995 Y272.245   I-3.465 J-2.409 E0.0972
N4237 G2  X166.992 Y259.212   I-321.195 J-6.431 E0.4954
N4238 G2  X165.146 Y255.634   I-6.663 J1.171 E0.1554
N4239 G3  X165.661 Y253.471   I1.721 J-0.733 E0.0905
N4240 G1 E-0.8000 F1800
N4241 M204 S10000
N4242 G1  X167.381 Y251.657   F600
N4243 G1 E0.8000 F1800
N4244 M204 S8000
N4245 G3  X170.238 Y250.033   I2.765 J1.539 E0.1313 F5400
N4246 G3  X172.775 Y251.633   I-12.405 J22.473 E0.1141
N4247 G2  X174.808 Y252.064   I2.042 J-4.626 E0.0796
N4248 G2  X188.372 Y252.060   I6.687 J-357.435 E0.5155
N4249 G2  X192.307 Y250.183   I-0.499 J-6.110 E0.1694
N4250 G3  X194.619 Y250.613   I0.854 J1.838 E0.0953
N4251 G1  X195.995 Y252.064   E0.0760
N4252 G1 E0.0000
N4253 G3  X197.926 Y254.386   I-3.871 J5.182 E0.1159
N4254 G3  X196.750 Y256.979   I-2.902 J0.247 E0.1130
N4255 G2  X195.995 Y259.382   I3.464 J2.409 E0.0972
N4256 G2  X195.998 Y272.416   I321.212 J6.432 E0.4954
N4257 G2  X197.844 Y275.994   I6.663 J-1.171 E0.1554
N4258 G3  X197.504 Y277.972   I-1.658 J0.734 E0.0808
N4259 G1  X195.995 Y279.564   E0.0834
N4260 G3  X193.533 Y281.605   I-4.373 J-2.768 E0.1236
N4261 G3  X190.885 Y280.355   I0.012 J-3.454 E0.1149
N4262 G2  X188.182 Y279.564   I-2.709 J4.247 E0.1085
N4263 G2  X174.618 Y279.568   I-6.687 J357.435 E0.5155
N4264 G2  X170.683 Y281.445   I0.499 J6.110 E0.1694
N4265 G3  X168.371 Y281.015   I-0.854 J-1.838 E0.0953
N4266 G1  X166.995 Y279.564   E0.0760
N4267 ; WIPE_TOWER_END
N4268 G1  X167.495 Y252.064  
N4269 ; LAYER_HEIGHT: 0.200000
N4270 ; FEATURE: Prime tower
N4271 ; LINE_WIDTH: 0.500000
N4272 ; WIPE_TOWER_START
N4273 M204 S8000
N4274 G1  Y272.314  E0.2565
N4275 G1  X195.495  E1.0642
N4276 G1  Y279.064  E0.2565
N4277 G1  X167.495  E1.0642
N4278 M204 S10000
N4279 G1  X168.495 Y272.314  
N4280 ;--------------------
N4281 ; CP EMPTY GRID START
N4282 ; layer #6
N4283 M204 S8000
N4284 M73 P47 R19
N4285 G1  Y279.064  E0.2565
N4286 M204 S10000
N4287 G1  X177.162 
N4288 M204 S8000
N4289 G1  Y272.314  E0.2565
N4290 M204 S10000
N4291 G1  X185.828 
N4292 M204 S8000
N4293 G1  Y279.064  E0.2565
N4294 M204 S10000
N4295 G1  X194.495 
N4296 M204 S8000
N4297 G1  Y272.314  E0.2565
N4298 ; CP EMPTY GRID END
N4299 ;------------------
N4300 
N4301 
N4302 
N4303 
N4304 
N4305 
N4306 ; WIPE_TOWER_END
N4307 ; LAYER_HEIGHT: 0.200000
N4308 ; FEATURE: Prime tower
N4309 ; LINE_WIDTH: 0.500000
N4310 ;--------------------
N4311 ; CP TOOLCHANGE START
N4312 ; toolchange #5
N4313 ; material : TPU-AMS -> TPU-AMS
N4314 ;--------------------
N4315 M220 B
N4316 M220 S100
N4317 ; WIPE_TOWER_START
N4318 G1 E-.8 F1800
N4319 G17
N4320 G3 Z1.4 I1.217 J0 P1  F60000
N4321 G1 X167.745 Y266.314
N4322 G1 Z1
N4323 G1 E.8 F1800
N4324 ; LAYER_HEIGHT: 0.200000
N4325 ; FEATURE: Prime tower
N4326 ; LINE_WIDTH: 1.000000
N4327 ; NOZZLE_CHANGE_START OF0 NF2
N4328 M204 S8000
N4329 G1  X195.245 Y266.314  E2.1885 F3605
N4330 G1  Y267.564  E0.0995
N4331 G1  X167.745  E2.1885
N4332 G1  Y268.814  E0.0995
N4333 G1  X195.245  E2.1885
N4334 G1  Y270.064  E0.0995
N4335 G1  X167.745  E2.1885
N4336 G1  Y271.314  E0.0995
N4337 G1  X195.245  E2.1885
N4338 ; NOZZLE_CHANGE_END OF0 NF2
N4339 M104 T1 S181 N0 ;Multi extruder pre cooling
N4340 
N4341 ; WIPE_START
N4342 G1 F5400
N4343 M204 S8000
N4344 G1 X193.245 Y271.314 E-1.9
N4345 ; WIPE_END
N4346 G1 E-.1 F1800
N4347 M204 S10000
N4348 G17
N4349 G3 Z1.4 I1.217 J0 P1  F5400
N4350 ; filament end gcode 
N4351 
N4352 ;======== H2D ========
N4353 ;===== 20250604 =====
N4354 M993 A2 B2 C2 ; nozzle cam detection allow status save.
N4355 M993 A0 B0 C0 ; nozzle cam detection not allowed.
N4356 
N4357 
N4358 M1015.4 S0 ; disable E air printing detect
N4359 
N4360 
N4361 M620 S2A
N4362 M1002 gcode_claim_action : 4
N4363 M204 S9000
N4364 
N4365 G1 Z4 F1200
N4366 
N4367 M400
N4368 M106 P1 S0
N4369 M106 P2 S0
N4370 
N4371 
N4372 
N4373 
N4374 M620.10 A0 F286.867 L0 H0.4 T270 P255 S1
N4375 
N4376 
N4377 
N4378 M620.10 A1 F261.922 L0 H0.4 T250 P230 S1
N4379 
N4380 
N4381 
N4382 M620.11 P0 I0 E0
N4383 
N4384 
N4385 
N4386 M620.11 K1 I0 R10 F286.867
N4387 
N4388 
N4389 M628 S1
N4390 
N4391 
N4392 M620.11 S1 L0 I0 R10 D8 E-10 F286.867
N4393 
N4394 
N4395 M629
N4396 
N4397 
N4398 M620.11 H0
N4399 
N4400 
N4401 T2
N4402 M73 E1
N4403 
N4404 ;deretract
N4405 
N4406 
N4407 ;VG1 E4 F261
N4408 ;VG1 E4 F130
N4409 
N4410 
N4411 
N4412 ; VFLUSH_START
N4413 
N4414 
N4415 ;VG1 E0 F261
N4416 
N4417 
N4418 SYNC T0
N4419 
N4420 ; VFLUSH_END
N4421 
N4422 M1002 set_filament_type:TPU-AMS
N4423 
N4424 M400
N4425 M83
N4426 
N4427 
N4428 
N4429 M628 S0
N4430 ;VM109 S230
N4431 M629
N4432 M400
N4433 
N4434 M983.3 F4.375 A0.4
N4435 
N4436 
N4437 M400
N4438 
N4439 G1 Y320 F30000
N4440 G1 X201
N4441 
N4442 G1 Y295
N4443 G1 Y265 F18000
N4444 G1 Z4 F3000
N4445 
N4446 M204 S8000
N4447 
N4448 
N4449 M621 S2A
N4450 
N4451 M993 A3 B3 C3 ; nozzle cam detection allow status restore.
N4452 
N4453 
N4454 M1015.3 S0;disable tpu clog detect
N4455 
N4456 
N4457 
N4458 M1015.4 S0 ; disable E air printing detect
N4459 
N4460 
N4461 M620.6 I2 W1 ;enable ams air printing detect
N4462 M1002 gcode_claim_action : 0
N4463 M106 S58.65
N4464 M106 P2 S255
N4465 G1 X200 Y264.673 F60000
N4466 G1 Z1
N4467 G1 X200 Y257.04 Z1.4
N4468 G1 X200 Y247.99 Z1.4
N4469 G1 X162.991 Y247.99
N4470 G1 X162.991 Y252.564
N4471 G1 X167.495 Y252.564
N4472 
N4473 ; filament start gcode
N4474 G1 Z1
N4475 G1 E2 F1800
N4476 
N4477 G4 S0
N4478 ; CP TOOLCHANGE WIPE
N4479 ; LINE_WIDTH: 0.500000
N4480 M204 S8000
N4481 G1  X170.495 Y252.564  E0.1140 F1782
N4482 G1 E-0.8000 F1800
N4483 M204 S10000
N4484 G1  X165.995  F600
N4485 G1  X167.495  F240
N4486 G1  X167.995  F600
N4487 G1  Y253.064 
N4488 G1  X166.995 
N4489 G1  Y252.064 
N4490 G1  X168.495 
N4491 G1  Y253.564 
N4492 G1  X166.495 
N4493 G1  Y251.564 
N4494 G1  X170.495 Y252.564   F1782
N4495 G1 E0.8000 F1800
N4496 M204 S8000
N4497 G1  X195.495  E0.9502 F1782
N4498 G1  Y253.314  E0.0285
N4499 G1  X167.495  E1.0642 F2025
N4500 G1  Y254.064  E0.0285
N4501 G1  X195.495  E1.0642 F2473
N4502 G1  Y254.814  E0.0285
N4503 G1  X167.495  E1.0642 F4725
N4504 G1  Y255.564  E0.0285
N4505 G1  X195.495  E1.0642 F4775
N4506 G1  Y256.314  E0.0285
N4507 G1  X167.495  E1.0642 F4825
N4508 G1  Y257.064  E0.0285
N4509 G1  X195.495  E1.0642 F4875
N4510 G1  Y257.814  E0.0285
N4511 G1  X167.495  E1.0642 F4925
N4512 G1  Y258.564  E0.0285
N4513 G1  X195.495  E1.0642 F4975
N4514 G1  Y259.314  E0.0285
N4515 G1  X167.495  E1.0642 F5025
N4516 G1  Y260.064  E0.0285
N4517 G1  X195.495  E1.0642 F5075
N4518 G1  Y260.814  E0.0285
N4519 G1  X167.495  E1.0642 F5125
N4520 G1  Y261.564  E0.0285
N4521 G1  X195.495  E1.0642 F5175
N4522 G1  Y262.314  E0.0285
N4523 G1  X167.495  E1.0642 F5225
N4524 G1  Y263.064  E0.0285
N4525 G1  X195.495  E1.0642 F5275
N4526 G1  Y263.814  E0.0285
N4527 G1  X167.495  E1.0642 F5325
N4528 G1  Y264.564  E0.0285
N4529 M73 P48 R19
N4530 G1  X195.495  E1.0642 F5375
N4531 G1  Y265.314  E0.0285
N4532 G1  X167.495  E1.0642 F5400
N4533 ; WIPE_TOWER_END
N4534 M220 R
N4535 G1 F60000
N4536 G4 S0
N4537 G92 E0
N4538 ; CP TOOLCHANGE END
N4539 ;------------------
N4540 
N4541 
N4542 
N4543 ; WIPE_START
N4544 G1 F5400
N4545 M204 S8000
N4546 G1 X169.495 Y265.314 E-.76
N4547 ; WIPE_END
N4548 G1 E-.04 F1800
N4549 M204 S10000
N4550 G17
N4551 G3 Z1.4 I1.217 J0 P1  F60000
N4552 ; OBJECT_ID: 138
N4553 ; COOLING_NODE: 0
N4554 ; start printing object, unique label id: 138
N4555 M624 AgAAAAAAAAA=
N4556 G1 X182.34 Y114.898
N4557 G1 Z1
N4558 G1 E.8 F1800
N4559 ; FEATURE: Outer wall
N4560 ; LINE_WIDTH: 0.42
N4561 ; LAYER_HEIGHT: 0.2
N4562 G1 F8353.673
N4563 M204 S5000
N4564 G1 X167.76 Y114.898 E.45715
N4565 G1 X167.76 Y114.318 E.01819
N4566 G1 X182.34 Y114.318 E.45715
N4567 G1 X182.34 Y114.838 E.0163
N4568 M204 S10000
N4569 G1 X182.144 Y114.608 F60000
N4570 ; FEATURE: Gap infill
N4571 ; LINE_WIDTH: 0.23088
N4572 G1 F15000
N4573 M204 S8000
N4574 G1 X167.956 Y114.608 E.22174
N4575 ; CHANGE_LAYER
N4576 ; Z_HEIGHT: 1.2
N4577 ; LAYER_HEIGHT: 0.2
N4578 ; WIPE_START
N4579 G1 F15000
N4580 G1 X169.956 Y114.608 E-.76
N4581 ; WIPE_END
N4582 G1 E-.04 F1800
N4583 ; stop printing object, unique label id: 138
N4584 M625
N4585 ;======== H2D 20250521========
N4586 ; layer num/total_layer_count: 6/63
N4587 ; update layer progress
N4588 M73 L6
N4589 M991 S0 P5 ;notify layer change
N4590 
N4591 
N4592 M106 S25.5
N4593 ; LAYER_HEIGHT: 0.200000
N4594 ; FEATURE: Prime tower
N4595 ; LINE_WIDTH: 0.500000
N4596 ;--------------------
N4597 ; CP TOOLCHANGE START
N4598 ; toolchange #6
N4599 ; material : PETG-CF -> PETG-CF
N4600 ;--------------------
N4601 M220 B
N4602 M220 S100
N4603 ; WIPE_TOWER_START
N4604 M204 S10000
N4605 G17
N4606 G3 Z1.4 I1.217 J0 P1  F60000
N4607 G1 X169.354 Y152.214
N4608 G1 X167.745 Y252.814
N4609 G1 Z1.2
N4610 G1 E.8 F1800
N4611 ; LAYER_HEIGHT: 0.200000
N4612 ; FEATURE: Prime tower
N4613 ; LINE_WIDTH: 1.000000
N4614 ; NOZZLE_CHANGE_START OF2 NF0
N4615 M104 T0 S200 N0 ;Multi extruder pre cooling in post extrusion
N4616 M204 S8000
N4617 G1  X195.245 Y252.814  E2.1885 F550
N4618 G1  Y254.314  E0.1194
N4619 G1  X167.745  E2.1885
N4620 G1  Y255.814  E0.1194
N4621 G1  X195.245  E2.1885
N4622 G1  Y257.314  E0.1194
N4623 G1  X167.745  E2.1885
N4624 G1  Y258.814  E0.1194
N4625 G1  X195.245  E2.1885
N4626 M204 S10000
N4627 G1  Y259.814 
N4628 M104 T1 S255 N0 ;Multi extruder pre heating
N4629 G1  X168.245  F398
N4630 G1  Y258.314 
N4631 G1  X194.745 
N4632 G1  Y256.814 
N4633 G1  X168.245 
N4634 G1  Y255.314 
N4635 M73 P49 R19
N4636 G1  X194.745 
N4637 G1  Y253.814 
N4638 M73 P49 R18
N4639 G1  X168.245 
N4640 ; NOZZLE_CHANGE_END OF2 NF0
N4641 M104 T0 S0 N0 ;Multi extruder pre cooling
N4642 
N4643 G1 E-2 F1800
N4644 G17
N4645 G3 Z1.6 I1.217 J0 P1  F5400
N4646 ; filament end gcode 
N4647 
N4648 ;======== H2D ========
N4649 ;===== 20250604 =====
N4650 M993 A2 B2 C2 ; nozzle cam detection allow status save.
N4651 M993 A0 B0 C0 ; nozzle cam detection not allowed.
N4652 
N4653 
N4654 M1015.4 S1 K0 ;disable E air printing detect
N4655 
N4656 
N4657 M620 S0A
N4658 M1002 gcode_claim_action : 4
N4659 M204 S9000
N4660 
N4661 G1 Z4.2 F1200
N4662 
N4663 M400
N4664 M106 P1 S0
N4665 M106 P2 S0
N4666 
N4667 
N4668 
N4669 
N4670 M620.10 A0 F261.922 L0 H0.4 T250 P230 S1
N4671 
N4672 
N4673 
N4674 M620.10 A1 F286.867 L0 H0.4 T270 P255 S1
N4675 
N4676 
N4677 
N4678 M620.11 P0 I2 E0
N4679 
N4680 
N4681 
N4682 M620.11 K1 I2 R10 F261.922
N4683 
N4684 
N4685 M628 S1
N4686 
N4687 
N4688 M620.11 S1 L0 I2 R10 D8 E-10 F261.922
N4689 
N4690 
N4691 M629
N4692 
N4693 
N4694 M620.11 H0
N4695 
N4696 
N4697 T0
N4698 M73 E0
N4699 
N4700 ;deretract
N4701 
N4702 
N4703 ;VG1 E4 F286
N4704 ;VG1 E4 F143
N4705 
N4706 
N4707 
N4708 ; VFLUSH_START
N4709 
N4710 
N4711 ;VG1 E0 F261
N4712 
N4713 
N4714 SYNC T0
N4715 
N4716 ; VFLUSH_END
N4717 
N4718 M1002 set_filament_type:PETG-CF
N4719 
N4720 M400
N4721 M83
N4722 
N4723 
N4724 
N4725 M628 S0
N4726 ;VM109 S255
N4727 M629
N4728 M400
N4729 
N4730 M983.3 F4.79167 A0.4
N4731 
N4732 
N4733 M400
N4734 
N4735 M73 P50 R18
N4736 G1 Y320 F30000
N4737 G1 X201
N4738 
N4739 G1 Y295
N4740 G1 Y265 F18000
N4741 G1 Z4.2 F3000
N4742 
N4743 M204 S8000
N4744 
N4745 
N4746 M621 S0A
N4747 
N4748 M993 A3 B3 C3 ; nozzle cam detection allow status restore.
N4749 
N4750 
N4751 M1015.3 S0;disable tpu clog detect
N4752 
N4753 
N4754 
N4755 M1015.4 S1 K1 H0.4 ;enable E air printing detect
N4756 
N4757 
N4758 M620.6 I0 W1 ;enable ams air printing detect
N4759 M1002 gcode_claim_action : 0
N4760 M106 S12.75
N4761 M106 P2 S0
N4762 G1 X200 Y278.814 F60000
N4763 G1 Z1.2
N4764 G1 X195.495 Y278.814 Z1.6
N4765 
N4766 ; filament start gcode
N4767 G1 Z1.2
N4768 G1 E2 F1800
N4769 
N4770 G4 S0
N4771 ; CP TOOLCHANGE WIPE
N4772 ; LINE_WIDTH: 0.500000
N4773 M204 S8000
N4774 G1  X192.495 Y278.814  E0.1140 F1782
N4775 G1 E-0.8000 F1800
N4776 M204 S10000
N4777 G1  X196.995  F600
N4778 G1  X195.495  F240
N4779 G1  X195.995  F600
N4780 G1  Y279.314 
N4781 G1  X194.995 
N4782 G1  Y278.314 
N4783 G1  X196.495 
N4784 G1  Y279.814 
N4785 G1  X194.495 
N4786 G1  Y277.814 
N4787 G1  X192.495 Y278.814   F1782
N4788 G1 E0.8000 F1800
N4789 M204 S8000
N4790 G1  X167.495  E0.9502 F1782
N4791 G1  Y278.064  E0.0285
N4792 G1  X195.495  E1.0642 F2025
N4793 G1  Y277.314  E0.0285
N4794 G1  X167.495  E1.0642 F2473
N4795 G1  Y276.564  E0.0285
N4796 G1  X195.495  E1.0642 F4725
N4797 G1  Y275.814  E0.0285
N4798 G1  X167.495  E1.0642 F4775
N4799 G1  Y275.064  E0.0285
N4800 G1  X195.495  E1.0642 F4825
N4801 G1  Y274.314  E0.0285
N4802 G1  X167.495  E1.0642 F4875
N4803 G1  Y273.564  E0.0285
N4804 G1  X195.495  E1.0642 F4925
N4805 G1  Y272.814  E0.0285
N4806 G1  X167.495  E1.0642 F4975
N4807 G1  Y272.064  E0.0285
N4808 G1  X195.495  E1.0642 F5025
N4809 G1  Y271.314  E0.0285
N4810 G1  X167.495  E1.0642 F5075
N4811 G1  Y270.564  E0.0285
N4812 G1  X195.495  E1.0642 F5125
N4813 G1  Y269.814  E0.0285
N4814 G1  X167.495  E1.0642 F5175
N4815 G1  Y269.064  E0.0285
N4816 G1  X195.495  E1.0642 F5225
N4817 G1  Y268.314  E0.0285
N4818 G1  X167.495  E1.0642 F5275
N4819 G1  Y267.564  E0.0285
N4820 G1  X195.495  E1.0642 F5325
N4821 G1  Y266.814  E0.0285
N4822 G1  X167.495  E1.0642 F5375
N4823 G1  Y266.064  E0.0285
N4824 G1  X195.495  E1.0642 F5400
N4825 ; WIPE_TOWER_END
N4826 M220 R
N4827 G1 F60000
N4828 G4 S0
N4829 G92 E0
N4830 ; CP TOOLCHANGE END
N4831 ;------------------
N4832 
N4833 
N4834 G1  Y252.064  
N4835 ; LAYER_HEIGHT: 0.200000
N4836 ; FEATURE: Prime tower
N4837 ; LINE_WIDTH: 0.500000
N4838 ; WIPE_TOWER_START
N4839 M204 S10000
N4840 G1  X195.846 Y279.721  
N4841 M204 S8000
N4842 G3  X193.064 Y281.636   I-3.469 J-2.060 E0.1325 F5400
N4843 G3  X190.723 Y280.255   I1.448 J-5.129 E0.1045
N4844 G2  X188.182 Y279.564   I-2.568 J4.426 E0.1012
N4845 G2  X174.618 Y279.568   I-6.687 J357.435 E0.5155
N4846 G2  X170.683 Y281.445   I0.499 J6.110 E0.1694
N4847 G3  X168.371 Y281.015   I-0.854 J-1.838 E0.0953
N4848 G1  X166.995 Y279.564   E0.0760
N4849 G3  X165.064 Y277.242   I3.871 J-5.183 E0.1159
N4850 G3  X166.240 Y274.649   I2.902 J-0.247 E0.1130
N4851 G2  X166.995 Y272.245   I-3.465 J-2.409 E0.0972
N4852 G2  X166.992 Y259.212   I-321.195 J-6.431 E0.4954
N4853 G2  X165.146 Y255.634   I-6.663 J1.171 E0.1554
N4854 G3  X165.485 Y253.656   I1.658 J-0.734 E0.0808
N4855 G1  X168.371 Y250.613   E0.1594
N4856 G3  X171.793 Y251.056   I1.525 J1.652 E0.1495
N4857 G2  X174.808 Y252.064   I3.021 J-4.025 E0.1229
N4858 G2  X188.372 Y252.060   I6.687 J-357.435 E0.5155
N4859 G2  X192.307 Y250.183   I-0.499 J-6.110 E0.1694
N4860 G3  X194.619 Y250.613   I0.854 J1.838 E0.0953
N4861 G1  X195.995 Y252.064   E0.0760
N4862 G3  X197.926 Y254.386   I-3.871 J5.182 E0.1159
N4863 G3  X196.750 Y256.979   I-2.902 J0.247 E0.1130
N4864 G2  X195.995 Y259.382   I3.464 J2.409 E0.0972
N4865 G2  X195.998 Y272.416   I321.212 J6.432 E0.4954
N4866 G2  X197.844 Y275.994   I6.663 J-1.171 E0.1554
N4867 G3  X197.564 Y277.905   I-1.654 J0.733 E0.0774
N4868 ; WIPE_TOWER_END
N4869 
N4870 ; WIPE_START
N4871 G1 F15000
N4872 M204 S8000
N4873 G1 X197.598 Y277.866 E-.01975
N4874 G1 X197.683 Y277.752 E-.0539
N4875 G1 X197.759 Y277.632 E-.05389
N4876 G1 X197.825 Y277.506 E-.05389
N4877 G1 X197.88 Y277.376 E-.0539
N4878 G1 X197.926 Y277.242 E-.05389
N4879 G1 X197.961 Y277.104 E-.0539
N4880 G1 X197.985 Y276.964 E-.05389
N4881 G1 X197.998 Y276.823 E-.05391
N4882 G1 X198 Y276.681 E-.05388
N4883 G1 X197.99 Y276.54 E-.0539
N4884 G1 X197.97 Y276.4 E-.05389
N4885 G1 X197.939 Y276.261 E-.05389
N4886 G1 X197.896 Y276.126 E-.0539
N4887 G1 X197.858 Y276.029 E-.03963
N4888 ; WIPE_END
N4889 G1 E-.04 F1800
N4890 M204 S10000
N4891 G17
N4892 G3 Z1.6 I1.217 J0 P1  F60000
N4893 ; OBJECT_ID: 130
N4894 ; COOLING_NODE: 0
N4895 ; start printing object, unique label id: 130
N4896 M624 AQAAAAAAAAA=
N4897 G1 X191.084 Y196.801 Z1.2
N4898 G1 E.8 F1800
N4899 ; FEATURE: Inner wall
N4900 ; LINE_WIDTH: 0.45
N4901 ; LAYER_HEIGHT: 0.2
N4902 G1 F8475
N4903 M204 S8000
N4904 G1 X158.916 Y196.801 E1.03439
N4905 G1 X158.916 Y123.199 E2.36678
N4906 G1 X191.084 Y123.199 E1.03439
N4907 G1 X191.084 Y196.741 E2.36485
N4908 ; COOLING_NODE: 0
N4909 M204 S10000
N4910 G1 X191.491 Y197.208 F60000
N4911 G1 F8475
N4912 M204 S8000
N4913 G1 X158.509 Y197.208 E1.06057
N4914 G1 X158.509 Y122.792 E2.39296
N4915 G1 X191.491 Y122.792 E1.06057
N4916 G1 X191.491 Y197.148 E2.39103
N4917 ; COOLING_NODE: 0
N4918 M204 S10000
N4919 G1 X191.898 Y197.615 F60000
N4920 G1 F8475
N4921 M204 S8000
N4922 G1 X158.102 Y197.615 E1.08675
N4923 G1 X158.102 Y122.385 E2.41914
N4924 G1 X191.898 Y122.385 E1.08675
N4925 G1 X191.898 Y197.555 E2.41721
N4926 ; COOLING_NODE: 0
N4927 M204 S10000
N4928 G1 X192.29 Y198.007 F60000
N4929 ; FEATURE: Outer wall
N4930 ; LINE_WIDTH: 0.42
N4931 G1 F9149.261
N4932 M204 S5000
N4933 G1 X157.71 Y198.007 E1.03002
N4934 G1 X157.71 Y121.993 E2.26421
N4935 G1 X192.29 Y121.993 E1.03002
N4936 G1 X192.29 Y197.947 E2.26243
N4937 G1 E-.8 F1800
N4938 M204 S10000
N4939 G1 X184.684 Y197.311 Z1.6 F60000
N4940 G1 X174.411 Y196.453 Z1.6
N4941 G1 Z1.2
N4942 G1 E.8 F1800
N4943 ; FEATURE: Sparse infill
N4944 ; LINE_WIDTH: 0.45
N4945 G1 F8475
N4946 M204 S8000
N4947 G1 X172.783 Y196.453 E.05236
N4948 G1 X190.736 Y129.452 E2.23049
N4949 G1 X190.736 Y128.48 E.03128
N4950 G1 X185.803 Y123.547 E.22431
N4951 G1 X183.889 Y123.547 E.06154
N4952 G1 X164.354 Y196.453 E2.42708
N4953 G1 X162.726 Y196.453 E.05236
N4954 M204 S10000
N4955 G1 X159.264 Y158.294 F60000
N4956 G1 F8475
N4957 M204 S8000
N4958 M73 P51 R18
N4959 G1 X159.264 Y156.666 E.05236
N4960 G1 X190.736 Y148.233 E1.0477
N4961 G1 X190.736 Y151.508 E.10529
N4962 G1 X162.775 Y123.547 E1.27153
N4963 G1 X167.031 Y123.547 E.13687
N4964 G1 X159.264 Y152.534 E.96499
N4965 G1 X159.264 Y154.578 E.06574
N4966 G1 X190.736 Y186.049 E1.43118
N4967 G1 X190.736 Y181.948 E.13187
N4968 G1 X159.264 Y190.381 E1.0477
N4969 G1 X159.264 Y189.12 E.04055
N4970 G1 X166.597 Y196.453 E.33345
N4971 G1 X168.061 Y196.453 E.04709
N4972 G1 X190.736 Y190.377 E.75484
N4973 G1 X190.736 Y192.366 E.06394
N4974 G1 X189.64 Y196.453 E.13606
N4975 G1 X159.264 Y166.092 E1.38102
N4976 G1 X159.264 Y165.095 E.03208
N4977 G1 X190.736 Y156.662 E1.0477
N4978 G1 X190.736 Y160.909 E.13657
N4979 G1 X181.212 Y196.453 E1.18328
N4980 G1 X178.111 Y196.453 E.09971
N4981 G1 X159.264 Y177.606 E.85706
N4982 G1 X159.264 Y173.524 E.13129
N4983 G1 X190.736 Y165.091 E1.0477
N4984 G1 X190.736 Y163.022 E.06654
N4985 G1 X159.264 Y131.551 E1.43118
N4986 G1 X159.264 Y131.38 E.0055
N4987 G1 X188.495 Y123.547 E.97312
N4988 G1 X190.124 Y123.547 E.05236
N4989 M204 S10000
N4990 G1 X190.736 Y133.004 F60000
N4991 G1 F8475
N4992 M204 S8000
N4993 G1 X190.736 Y131.376 E.05236
N4994 G1 X159.264 Y139.808 E1.0477
N4995 G1 X159.264 Y143.064 E.1047
N4996 G1 X190.736 Y174.536 E1.43118
N4997 G1 X190.736 Y173.52 E.03267
N4998 G1 X159.264 Y181.952 E1.04769
N4999 G1 X159.264 Y180.324 E.05236
N5000 M204 S10000
N5001 G1 X159.264 Y185.619 F60000
N5002 G1 F8475
N5003 M204 S8000
N5004 G1 X159.264 Y183.991 E.05236
N5005 G1 X175.46 Y123.547 E2.01221
N5006 G1 X174.289 Y123.547 E.03766
N5007 G1 X190.736 Y139.994 E.74792
N5008 G1 X190.736 Y139.805 E.00608
N5009 G1 X159.264 Y148.237 E1.0477
N5010 G1 X159.264 Y146.609 E.05236
N5011 ; WIPE_START
N5012 G1 X159.264 Y148.237 E-.61876
N5013 G1 X159.623 Y148.141 E-.14124
N5014 ; WIPE_END
N5015 G1 E-.04 F1800
N5016 M204 S10000
N5017 G17
N5018 G3 Z1.6 I1.217 J0 P1  F60000
N5019 ; stop printing object, unique label id: 130
N5020 M625
N5021 ; object ids of layer 6 start: 130
N5022 M624 AQAAAAAAAAA=
N5023 ;======== H2D 20250527========
N5024 ; SKIPPABLE_START
N5025 ; SKIPTYPE: timelapse
N5026 M622.1 S1 ; for prev firware, default turned on
N5027 
N5028 M1002 judge_flag timelapse_record_flag
N5029 
N5030 M622 J1
N5031 M993 A2 B2 C2
N5032 M993 A0 B0 C0
N5033 
N5034 
N5035 
N5036 
N5037     M9711 M0 E1 X260 Y137 Z1.6 S11 C10 O0 T3000
N5038 
N5039 
N5040 
N5041 M993 A3 B3 C3
N5042 
N5043 M623
N5044 ; SKIPPABLE_END
N5045 
N5046 ; object ids of this layer6 end: 130
N5047 M625
N5048 ; CHANGE_LAYER
N5049 ; Z_HEIGHT: 1.4
N5050 ; LAYER_HEIGHT: 0.2
N5051 ;======== H2D 20250521========
N5052 ; layer num/total_layer_count: 7/63
N5053 ; update layer progress
N5054 M73 L7
N5055 M991 S0 P6 ;notify layer change
N5056 
N5057 
N5058 M106 S76.5
N5059 ; OBJECT_ID: 130
N5060 ; COOLING_NODE: 0
N5061 ; start printing object, unique label id: 130
N5062 M624 AQAAAAAAAAA=
N5063 G1 X191.084 Y196.801 F60000
N5064 G1 Z1.4
N5065 G1 E.8 F1800
N5066 ; FEATURE: Inner wall
N5067 ; LINE_WIDTH: 0.45
N5068 ; LAYER_HEIGHT: 0.2
N5069 G1 F8475
N5070 M204 S8000
N5071 G1 X158.916 Y196.801 E1.03439
N5072 G1 X158.916 Y123.199 E2.36678
N5073 G1 X191.084 Y123.199 E1.03439
N5074 G1 X191.084 Y196.741 E2.36485
N5075 ; COOLING_NODE: 0
N5076 M204 S10000
N5077 G1 X191.491 Y197.208 F60000
N5078 G1 F8475
N5079 M204 S8000
N5080 G1 X158.509 Y197.208 E1.06057
N5081 G1 X158.509 Y122.792 E2.39296
N5082 G1 X191.491 Y122.792 E1.06057
N5083 G1 X191.491 Y197.148 E2.39103
N5084 ; COOLING_NODE: 0
N5085 M204 S10000
N5086 G1 X191.898 Y197.615 F60000
N5087 G1 F8475
N5088 M204 S8000
N5089 G1 X158.102 Y197.615 E1.08675
N5090 G1 X158.102 Y122.385 E2.41914
N5091 G1 X191.898 Y122.385 E1.08675
N5092 G1 X191.898 Y197.555 E2.41721
N5093 ; COOLING_NODE: 0
N5094 M204 S10000
N5095 G1 X192.29 Y198.007 F60000
N5096 ; FEATURE: Outer wall
N5097 ; LINE_WIDTH: 0.42
N5098 G1 F9149.261
N5099 M204 S5000
N5100 G1 X157.71 Y198.007 E1.03002
N5101 G1 X157.71 Y121.993 E2.26421
N5102 G1 X192.29 Y121.993 E1.03002
N5103 G1 X192.29 Y197.947 E2.26243
N5104 G1 E-.8 F1800
N5105 M204 S10000
N5106 G1 X184.684 Y197.317 Z1.8 F60000
N5107 G1 X174.265 Y196.453 Z1.8
N5108 G1 Z1.4
N5109 G1 E.8 F1800
N5110 ; FEATURE: Sparse infill
N5111 ; LINE_WIDTH: 0.45
N5112 G1 F8475
N5113 M204 S8000
N5114 G1 X172.636 Y196.453 E.05236
N5115 G1 X190.736 Y128.906 E2.24868
N5116 G1 X190.736 Y128.28 E.02014
N5117 G1 X186.003 Y123.547 E.21522
N5118 G1 X183.743 Y123.547 E.07268
N5119 G1 X164.208 Y196.453 E2.42708
N5120 G1 X162.579 Y196.453 E.05236
N5121 M204 S10000
N5122 G1 X159.264 Y158.441 F60000
N5123 G1 F8475
N5124 M204 S8000
N5125 G1 X159.264 Y156.812 E.05236
N5126 G1 X190.736 Y148.38 E1.0477
N5127 G1 X190.736 Y151.308 E.09415
N5128 G1 X162.975 Y123.547 E1.26243
N5129 G1 X166.885 Y123.547 E.12573
N5130 G1 X159.264 Y151.988 E.9468
N5131 G1 X159.264 Y154.378 E.07688
N5132 G1 X190.736 Y185.849 E1.43118
N5133 G1 X190.736 Y182.095 E.12073
N5134 G1 X159.264 Y190.528 E1.0477
N5135 G1 X159.264 Y188.92 E.05169
N5136 G1 X166.797 Y196.453 E.34255
N5137 G1 X168.608 Y196.453 E.05823
N5138 G1 X190.736 Y190.524 E.73665
N5139 G1 X190.736 Y191.819 E.04166
N5140 G1 X189.494 Y196.453 E.15425
N5141 G1 X189.825 Y196.453 E.01064
N5142 G1 X159.264 Y165.892 E1.38977
N5143 G1 X159.264 Y165.241 E.02094
N5144 G1 X190.736 Y156.809 E1.04769
N5145 G1 X190.736 Y160.363 E.11429
N5146 G1 X181.065 Y196.453 E1.20147
N5147 G1 X178.311 Y196.453 E.08857
N5148 G1 X159.264 Y177.406 E.86616
N5149 G1 X159.264 Y173.67 E.12015
N5150 G1 X190.736 Y165.237 E1.0477
N5151 G1 X190.736 Y162.822 E.07768
N5152 G1 X159.264 Y131.351 E1.43118
N5153 G1 X159.264 Y131.526 E.00564
N5154 G1 X189.042 Y123.547 E.99131
N5155 G1 X190.67 Y123.547 E.05236
N5156 M204 S10000
N5157 G1 X190.736 Y133.15 F60000
N5158 G1 F8475
N5159 M204 S8000
N5160 G1 X190.736 Y131.522 E.05236
N5161 G1 X159.264 Y139.955 E1.04769
N5162 G1 X159.264 Y142.864 E.09356
N5163 G1 X190.736 Y174.336 E1.43118
N5164 G1 X190.736 Y173.666 E.02153
N5165 G1 X159.264 Y182.099 E1.04769
N5166 G1 X159.264 Y180.47 E.05236
N5167 M204 S10000
N5168 G1 X159.264 Y185.073 F60000
N5169 G1 F8475
N5170 M204 S8000
N5171 G1 X159.264 Y183.444 E.05236
N5172 G1 X175.314 Y123.547 E1.99402
N5173 G1 X174.489 Y123.547 E.02652
N5174 G1 X190.736 Y139.794 E.73883
N5175 G1 X190.736 Y139.951 E.00506
N5176 G1 X159.264 Y148.384 E1.0477
N5177 G1 X159.264 Y146.755 E.05236
N5178 ; WIPE_START
N5179 G1 X159.264 Y148.384 E-.61876
N5180 G1 X159.623 Y148.287 E-.14124
N5181 ; WIPE_END
N5182 G1 E-.04 F1800
N5183 M204 S10000
N5184 G17
N5185 G3 Z1.8 I1.217 J0 P1  F60000
N5186 ; stop printing object, unique label id: 130
N5187 M625
N5188 ; object ids of layer 7 start: 130
N5189 M624 AQAAAAAAAAA=
N5190 ;======== H2D 20250527========
N5191 ; SKIPPABLE_START
N5192 ; SKIPTYPE: timelapse
N5193 M622.1 S1 ; for prev firware, default turned on
N5194 
N5195 M1002 judge_flag timelapse_record_flag
N5196 
N5197 M622 J1
N5198 M993 A2 B2 C2
N5199 M993 A0 B0 C0
N5200 
N5201 
N5202 
N5203 
N5204     M9711 M0 E1 X260 Y137 Z1.8 S11 C10 O0 T3000
N5205 
N5206 
N5207 
N5208 M993 A3 B3 C3
N5209 
N5210 M623
N5211 ; SKIPPABLE_END
N5212 
N5213 ; object ids of this layer7 end: 130
N5214 M625
N5215 ; CHANGE_LAYER
N5216 ; Z_HEIGHT: 1.6
N5217 ; LAYER_HEIGHT: 0.2
N5218 ;======== H2D 20250521========
N5219 ; layer num/total_layer_count: 8/63
N5220 ; update layer progress
N5221 M73 L8
N5222 M991 S0 P7 ;notify layer change
N5223 
N5224 
N5225 ; OBJECT_ID: 130
N5226 ; COOLING_NODE: 0
N5227 ; start printing object, unique label id: 130
N5228 M624 AQAAAAAAAAA=
N5229 G1 X191.084 Y196.801 F60000
N5230 G1 Z1.6
N5231 G1 E.8 F1800
N5232 ; FEATURE: Inner wall
N5233 ; LINE_WIDTH: 0.45
N5234 ; LAYER_HEIGHT: 0.2
N5235 G1 F8475
N5236 M204 S8000
N5237 G1 X158.916 Y196.801 E1.03439
N5238 G1 X158.916 Y123.199 E2.36678
N5239 G1 X191.084 Y123.199 E1.03439
N5240 G1 X191.084 Y196.741 E2.36485
N5241 ; COOLING_NODE: 0
N5242 M204 S10000
N5243 G1 X191.491 Y197.208 F60000
N5244 G1 F8475
N5245 M204 S8000
N5246 G1 X158.509 Y197.208 E1.06057
N5247 M73 P52 R17
N5248 G1 X158.509 Y122.792 E2.39296
N5249 G1 X191.491 Y122.792 E1.06057
N5250 G1 X191.491 Y197.148 E2.39103
N5251 ; COOLING_NODE: 0
N5252 M204 S10000
N5253 G1 X191.898 Y197.615 F60000
N5254 G1 F8475
N5255 M204 S8000
N5256 G1 X158.102 Y197.615 E1.08675
N5257 G1 X158.102 Y122.385 E2.41914
N5258 G1 X191.898 Y122.385 E1.08675
N5259 G1 X191.898 Y197.555 E2.41721
N5260 ; COOLING_NODE: 0
N5261 M204 S10000
N5262 G1 X192.29 Y198.007 F60000
N5263 ; FEATURE: Outer wall
N5264 ; LINE_WIDTH: 0.42
N5265 G1 F9149.261
N5266 M204 S5000
N5267 G1 X157.71 Y198.007 E1.03002
N5268 G1 X157.71 Y121.993 E2.26421
N5269 G1 X192.29 Y121.993 E1.03002
N5270 G1 X192.29 Y197.947 E2.26243
N5271 G1 E-.8 F1800
N5272 M204 S10000
N5273 G1 X184.683 Y197.322 Z2 F60000
N5274 G1 X174.118 Y196.453 Z2
N5275 G1 Z1.6
N5276 G1 E.8 F1800
N5277 ; FEATURE: Sparse infill
N5278 ; LINE_WIDTH: 0.45
N5279 G1 F8475
N5280 M204 S8000
N5281 G1 X172.49 Y196.453 E.05236
N5282 G1 X190.736 Y128.36 E2.26687
N5283 G1 X190.736 Y128.08 E.009
N5284 G1 X186.203 Y123.547 E.20612
N5285 G1 X183.596 Y123.547 E.08382
N5286 G1 X164.061 Y196.453 E2.42708
N5287 G1 X162.433 Y196.453 E.05236
N5288 M204 S10000
N5289 G1 X159.264 Y158.587 F60000
N5290 G1 F8475
N5291 M204 S8000
N5292 G1 X159.264 Y156.959 E.05236
N5293 G1 X190.736 Y148.526 E1.0477
N5294 G1 X190.736 Y151.108 E.08301
N5295 G1 X163.175 Y123.547 E1.25334
N5296 G1 X166.739 Y123.547 E.11459
N5297 G1 X159.264 Y151.441 E.92861
N5298 G1 X159.264 Y154.178 E.08802
N5299 G1 X190.736 Y185.649 E1.43118
N5300 G1 X190.736 Y182.241 E.10959
N5301 G1 X159.264 Y190.674 E1.0477
N5302 G1 X159.264 Y188.72 E.06283
N5303 G1 X166.997 Y196.453 E.35165
N5304 G1 X169.154 Y196.453 E.06937
N5305 G1 X190.736 Y190.67 E.71846
N5306 G1 X190.736 Y191.273 E.01938
N5307 G1 X189.348 Y196.453 E.17244
N5308 G1 X190.025 Y196.453 E.02178
N5309 G1 X159.264 Y165.692 E1.39886
N5310 G1 X159.264 Y165.388 E.0098
N5311 G1 X190.736 Y156.955 E1.04769
N5312 G1 X190.736 Y159.816 E.09201
N5313 G1 X180.919 Y196.453 E1.21966
N5314 G1 X178.511 Y196.453 E.07743
N5315 G1 X159.264 Y177.206 E.87525
N5316 G1 X159.264 Y173.816 E.10901
N5317 G1 X190.736 Y165.384 E1.0477
N5318 G1 X190.736 Y162.622 E.08882
N5319 G1 X159.264 Y131.15 E1.43118
N5320 G1 X159.264 Y131.672 E.01678
N5321 G1 X189.588 Y123.547 E1.0095
N5322 G1 X190.736 Y123.547 E.03689
N5323 G1 X190.736 Y124.028 E.01547
N5324 M204 S10000
N5325 G1 X190.736 Y133.297 F60000
N5326 G1 F8475
N5327 M204 S8000
N5328 G1 X190.736 Y131.669 E.05236
N5329 G1 X159.264 Y140.101 E1.04769
N5330 G1 X159.264 Y142.664 E.08242
N5331 G1 X190.736 Y174.136 E1.43118
N5332 G1 X190.736 Y173.813 E.01039
N5333 G1 X159.264 Y182.245 E1.0477
N5334 M204 S10000
N5335 G1 X159.264 Y184.526 F60000
N5336 G1 F8475
N5337 M204 S8000
N5338 G1 X159.264 Y182.898 E.05236
N5339 G1 X175.167 Y123.547 E1.97583
N5340 G1 X174.689 Y123.547 E.01538
N5341 G1 X190.736 Y139.594 E.72973
N5342 G1 X190.736 Y140.097 E.0162
N5343 G1 X159.264 Y148.53 E1.0477
N5344 G1 X159.264 Y146.902 E.05236
N5345 ; WIPE_START
N5346 G1 X159.264 Y148.53 E-.61876
N5347 G1 X159.623 Y148.434 E-.14124
N5348 ; WIPE_END
N5349 G1 E-.04 F1800
N5350 M204 S10000
N5351 G17
N5352 G3 Z2 I1.217 J0 P1  F60000
N5353 ; stop printing object, unique label id: 130
N5354 M625
N5355 ; object ids of layer 8 start: 130
N5356 M624 AQAAAAAAAAA=
N5357 ;======== H2D 20250527========
N5358 ; SKIPPABLE_START
N5359 ; SKIPTYPE: timelapse
N5360 M622.1 S1 ; for prev firware, default turned on
N5361 
N5362 M1002 judge_flag timelapse_record_flag
N5363 
N5364 M622 J1
N5365 M993 A2 B2 C2
N5366 M993 A0 B0 C0
N5367 
N5368 
N5369 
N5370 
N5371     M9711 M0 E1 X260 Y137 Z2 S11 C10 O0 T3000
N5372 
N5373 
N5374 
N5375 M993 A3 B3 C3
N5376 
N5377 M623
N5378 ; SKIPPABLE_END
N5379 
N5380 ; object ids of this layer8 end: 130
N5381 M625
N5382 ; CHANGE_LAYER
N5383 ; Z_HEIGHT: 1.8
N5384 ; LAYER_HEIGHT: 0.2
N5385 ;======== H2D 20250521========
N5386 ; layer num/total_layer_count: 9/63
N5387 ; update layer progress
N5388 M73 L9
N5389 M991 S0 P8 ;notify layer change
N5390 
N5391 
N5392 ; OBJECT_ID: 130
N5393 ; COOLING_NODE: 0
N5394 ; start printing object, unique label id: 130
N5395 M624 AQAAAAAAAAA=
N5396 G1 X191.084 Y196.801 F60000
N5397 G1 Z1.8
N5398 G1 E.8 F1800
N5399 ; FEATURE: Inner wall
N5400 ; LINE_WIDTH: 0.45
N5401 ; LAYER_HEIGHT: 0.2
N5402 G1 F8475
N5403 M204 S8000
N5404 G1 X158.916 Y196.801 E1.03439
N5405 G1 X158.916 Y123.199 E2.36678
N5406 G1 X191.084 Y123.199 E1.03439
N5407 G1 X191.084 Y196.741 E2.36485
N5408 ; COOLING_NODE: 0
N5409 M204 S10000
N5410 G1 X191.491 Y197.208 F60000
N5411 G1 F8475
N5412 M204 S8000
N5413 G1 X158.509 Y197.208 E1.06057
N5414 G1 X158.509 Y122.792 E2.39296
N5415 G1 X191.491 Y122.792 E1.06057
N5416 G1 X191.491 Y197.148 E2.39103
N5417 ; COOLING_NODE: 0
N5418 M204 S10000
N5419 G1 X191.898 Y197.615 F60000
N5420 G1 F8475
N5421 M204 S8000
N5422 G1 X158.102 Y197.615 E1.08675
N5423 G1 X158.102 Y122.385 E2.41914
N5424 G1 X191.898 Y122.385 E1.08675
N5425 G1 X191.898 Y197.555 E2.41721
N5426 ; COOLING_NODE: 0
N5427 M204 S10000
N5428 G1 X192.29 Y198.007 F60000
N5429 ; FEATURE: Outer wall
N5430 ; LINE_WIDTH: 0.42
N5431 G1 F9149.261
N5432 M204 S5000
N5433 G1 X157.71 Y198.007 E1.03002
N5434 G1 X157.71 Y121.993 E2.26421
N5435 G1 X192.29 Y121.993 E1.03002
N5436 G1 X192.29 Y197.947 E2.26243
N5437 G1 E-.8 F1800
N5438 M204 S10000
N5439 G1 X184.683 Y197.327 Z2.2 F60000
N5440 G1 X173.972 Y196.453 Z2.2
N5441 G1 Z1.8
N5442 G1 E.8 F1800
N5443 ; FEATURE: Sparse infill
N5444 ; LINE_WIDTH: 0.45
N5445 G1 F8475
N5446 M204 S8000
N5447 G1 X172.344 Y196.453 E.05236
N5448 G1 X190.736 Y127.813 E2.28506
N5449 G1 X190.736 Y127.88 E.00214
N5450 G1 X186.403 Y123.547 E.19703
N5451 G1 X183.45 Y123.547 E.09496
N5452 G1 X163.915 Y196.453 E2.42708
N5453 G1 X162.287 Y196.453 E.05236
N5454 M204 S10000
N5455 G1 X159.264 Y158.734 F60000
N5456 G1 F8475
N5457 M204 S8000
N5458 G1 X159.264 Y157.105 E.05236
N5459 G1 X190.736 Y148.673 E1.0477
N5460 G1 X190.736 Y150.908 E.07187
N5461 G1 X163.375 Y123.547 E1.24424
N5462 G1 X166.592 Y123.547 E.10345
N5463 G1 X159.264 Y150.895 E.91042
N5464 G1 X159.264 Y153.978 E.09916
N5465 G1 X190.736 Y185.449 E1.43118
N5466 G1 X190.736 Y182.388 E.09845
N5467 G1 X159.264 Y190.82 E1.0477
N5468 G1 X159.264 Y188.52 E.07396
N5469 G1 X167.197 Y196.453 E.36074
N5470 G1 X169.701 Y196.453 E.08051
N5471 G1 X190.736 Y190.817 E.70026
N5472 G1 X190.736 Y190.727 E.00289
N5473 G1 X189.201 Y196.453 E.19063
N5474 G1 X190.225 Y196.453 E.03292
N5475 M73 P53 R17
N5476 G1 X159.264 Y165.492 E1.40796
N5477 G1 X159.264 Y165.534 E.00134
N5478 G1 X190.736 Y157.101 E1.0477
N5479 G1 X190.736 Y159.27 E.06973
N5480 G1 X180.772 Y196.453 E1.23785
N5481 G1 X178.711 Y196.453 E.06629
N5482 G1 X159.264 Y177.006 E.88435
N5483 G1 X159.264 Y173.963 E.09787
N5484 G1 X190.736 Y165.53 E1.0477
N5485 G1 X190.736 Y162.422 E.09996
N5486 G1 X159.264 Y130.95 E1.43118
N5487 G1 X159.264 Y131.819 E.02792
N5488 G1 X190.135 Y123.547 E1.02769
N5489 G1 X190.736 Y123.547 E.01932
N5490 G1 X190.736 Y124.575 E.03304
N5491 M204 S10000
N5492 G1 X190.736 Y133.443 F60000
N5493 G1 F8475
N5494 M204 S8000
N5495 G1 X190.736 Y131.815 E.05236
N5496 G1 X159.264 Y140.248 E1.0477
N5497 G1 X159.264 Y142.464 E.07129
N5498 G1 X190.736 Y173.936 E1.43118
N5499 G1 X190.736 Y173.959 E.00075
N5500 G1 X159.264 Y182.392 E1.0477
N5501 G1 X175.021 Y123.547 E1.95888
N5502 G1 X174.889 Y123.547 E.00424
N5503 G1 X190.736 Y139.394 E.72064
N5504 G1 X190.736 Y140.244 E.02734
N5505 G1 X159.264 Y148.676 E1.0477
N5506 G1 X159.264 Y147.048 E.05236
N5507 ; WIPE_START
N5508 G1 X159.264 Y148.676 E-.61876
N5509 G1 X159.623 Y148.58 E-.14124
N5510 ; WIPE_END
N5511 G1 E-.04 F1800
N5512 M204 S10000
N5513 G17
N5514 G3 Z2.2 I1.217 J0 P1  F60000
N5515 ; stop printing object, unique label id: 130
N5516 M625
N5517 ; object ids of layer 9 start: 130
N5518 M624 AQAAAAAAAAA=
N5519 ;======== H2D 20250527========
N5520 ; SKIPPABLE_START
N5521 ; SKIPTYPE: timelapse
N5522 M622.1 S1 ; for prev firware, default turned on
N5523 
N5524 M1002 judge_flag timelapse_record_flag
N5525 
N5526 M622 J1
N5527 M993 A2 B2 C2
N5528 M993 A0 B0 C0
N5529 
N5530 
N5531 
N5532 
N5533     M9711 M0 E1 X260 Y137 Z2.2 S11 C10 O0 T3000
N5534 
N5535 
N5536 
N5537 M993 A3 B3 C3
N5538 
N5539 M623
N5540 ; SKIPPABLE_END
N5541 
N5542 ; object ids of this layer9 end: 130
N5543 M625
N5544 ; CHANGE_LAYER
N5545 ; Z_HEIGHT: 2
N5546 ; LAYER_HEIGHT: 0.2
N5547 ;======== H2D 20250521========
N5548 ; layer num/total_layer_count: 10/63
N5549 ; update layer progress
N5550 M73 L10
N5551 M991 S0 P9 ;notify layer change
N5552 
N5553 
N5554 ; OBJECT_ID: 130
N5555 ; COOLING_NODE: 0
N5556 ; start printing object, unique label id: 130
N5557 M624 AQAAAAAAAAA=
N5558 G1 X191.084 Y196.801 F60000
N5559 G1 Z2
N5560 G1 E.8 F1800
N5561 ; FEATURE: Inner wall
N5562 ; LINE_WIDTH: 0.45
N5563 ; LAYER_HEIGHT: 0.2
N5564 G1 F8475
N5565 M204 S8000
N5566 G1 X158.916 Y196.801 E1.03439
N5567 G1 X158.916 Y123.199 E2.36678
N5568 G1 X191.084 Y123.199 E1.03439
N5569 G1 X191.084 Y196.741 E2.36485
N5570 ; COOLING_NODE: 0
N5571 M204 S10000
N5572 G1 X191.491 Y197.208 F60000
N5573 G1 F8475
N5574 M204 S8000
N5575 G1 X158.509 Y197.208 E1.06057
N5576 G1 X158.509 Y122.792 E2.39296
N5577 G1 X191.491 Y122.792 E1.06057
N5578 G1 X191.491 Y197.148 E2.39103
N5579 ; COOLING_NODE: 0
N5580 M204 S10000
N5581 G1 X191.898 Y197.615 F60000
N5582 G1 F8475
N5583 M204 S8000
N5584 G1 X158.102 Y197.615 E1.08675
N5585 G1 X158.102 Y122.385 E2.41914
N5586 G1 X191.898 Y122.385 E1.08675
N5587 G1 X191.898 Y197.555 E2.41721
N5588 ; COOLING_NODE: 0
N5589 M204 S10000
N5590 G1 X192.29 Y198.007 F60000
N5591 ; FEATURE: Outer wall
N5592 ; LINE_WIDTH: 0.42
N5593 G1 F9149.261
N5594 M204 S5000
N5595 G1 X157.71 Y198.007 E1.03002
N5596 G1 X157.71 Y121.993 E2.26421
N5597 G1 X192.29 Y121.993 E1.03002
N5598 G1 X192.29 Y197.947 E2.26243
N5599 G1 E-.8 F1800
N5600 M204 S10000
N5601 G1 X190.736 Y190.963 Z2.4 F60000
N5602 G1 Z2
N5603 G1 E.8 F1800
N5604 ; FEATURE: Sparse infill
N5605 ; LINE_WIDTH: 0.45
N5606 G1 F8475
N5607 M204 S8000
N5608 G1 X170.247 Y196.453 E.68207
N5609 G1 X167.397 Y196.453 E.09165
N5610 G1 X159.264 Y188.32 E.36984
N5611 G1 X159.264 Y190.967 E.0851
N5612 G1 X190.736 Y182.534 E1.04769
N5613 G1 X190.736 Y185.249 E.08732
N5614 G1 X159.264 Y153.778 E1.43118
N5615 G1 X159.264 Y150.348 E.1103
N5616 G1 X166.446 Y123.547 E.89223
N5617 G1 X163.575 Y123.547 E.09231
N5618 G1 X190.736 Y150.708 E1.23515
N5619 G1 X190.736 Y148.819 E.06073
N5620 G1 X159.264 Y157.252 E1.0477
N5621 G1 X159.264 Y158.88 E.05236
N5622 M204 S10000
N5623 G1 X159.264 Y147.195 F60000
N5624 G1 F8475
N5625 M204 S8000
N5626 G1 X159.264 Y148.823 E.05236
N5627 G1 X190.736 Y140.39 E1.0477
N5628 G1 X190.736 Y139.194 E.03847
N5629 G1 X175.089 Y123.547 E.71154
N5630 G1 X174.875 Y123.547 E.00689
N5631 G1 X159.264 Y181.805 E1.93945
N5632 G1 X159.264 Y182.538 E.02357
N5633 G1 X190.736 Y174.105 E1.0477
N5634 G1 X190.736 Y173.736 E.01189
N5635 G1 X159.264 Y142.264 E1.43118
N5636 G1 X159.264 Y140.394 E.06015
N5637 G1 X190.736 Y131.961 E1.0477
N5638 G1 X190.736 Y133.59 E.05236
N5639 M204 S10000
N5640 G1 X190.736 Y127.68 F60000
N5641 G1 F8475
N5642 M204 S8000
N5643 G1 X186.603 Y123.547 E.18793
N5644 G1 X183.303 Y123.547 E.1061
N5645 G1 X163.768 Y196.453 E2.42708
N5646 G1 X162.14 Y196.453 E.05236
N5647 M204 S10000
N5648 G1 X173.826 Y196.453 F60000
N5649 G1 F8475
N5650 M204 S8000
N5651 G1 X172.197 Y196.453 E.05236
N5652 G1 X190.736 Y127.267 E2.30325
N5653 G1 X190.736 Y123.547 E.11961
N5654 G1 X190.681 Y123.547 E.00175
N5655 G1 X159.264 Y131.965 E1.04588
N5656 G1 X159.264 Y130.75 E.03906
N5657 G1 X190.736 Y162.222 E1.43118
N5658 G1 X190.736 Y165.677 E.1111
N5659 G1 X159.264 Y174.109 E1.0477
N5660 G1 X159.264 Y176.806 E.08673
N5661 G1 X178.911 Y196.453 E.89344
N5662 G1 X180.626 Y196.453 E.05515
N5663 G1 X190.736 Y158.723 E1.25604
N5664 G1 X190.736 Y157.248 E.04745
N5665 G1 X159.264 Y165.68 E1.0477
N5666 G1 X159.264 Y165.292 E.01248
N5667 G1 X190.425 Y196.453 E1.41705
N5668 G1 X189.055 Y196.453 E.04406
N5669 G1 X190.736 Y190.18 E.20882
N5670 G1 X190.736 Y188.552 E.05236
N5671 ; WIPE_START
N5672 G1 X190.736 Y190.18 E-.61876
N5673 G1 X190.639 Y190.539 E-.14124
N5674 ; WIPE_END
N5675 G1 E-.04 F1800
N5676 M204 S10000
N5677 G17
N5678 G3 Z2.4 I1.217 J0 P1  F60000
N5679 ; stop printing object, unique label id: 130
N5680 M625
N5681 ; object ids of layer 10 start: 130
N5682 M624 AQAAAAAAAAA=
N5683 ;======== H2D 20250527========
N5684 ; SKIPPABLE_START
N5685 ; SKIPTYPE: timelapse
N5686 M622.1 S1 ; for prev firware, default turned on
N5687 
N5688 M1002 judge_flag timelapse_record_flag
N5689 
N5690 M622 J1
N5691 M993 A2 B2 C2
N5692 M993 A0 B0 C0
N5693 
N5694 
N5695 
N5696 
N5697     M9711 M0 E1 X260 Y137 Z2.4 S11 C10 O0 T3000
N5698 
N5699 
N5700 
N5701 M993 A3 B3 C3
N5702 
N5703 M623
N5704 ; SKIPPABLE_END
N5705 
N5706 ; object ids of this layer10 end: 130
N5707 M625
N5708 ; CHANGE_LAYER
N5709 ; Z_HEIGHT: 2.2
N5710 ; LAYER_HEIGHT: 0.2
N5711 ;======== H2D 20250521========
N5712 ; layer num/total_layer_count: 11/63
N5713 ; update layer progress
N5714 M73 L11
N5715 M991 S0 P10 ;notify layer change
N5716 
N5717 
N5718 ; OBJECT_ID: 130
N5719 ; COOLING_NODE: 0
N5720 ; start printing object, unique label id: 130
N5721 M624 AQAAAAAAAAA=
N5722 G1 X191.084 Y196.801 F60000
N5723 G1 Z2.2
N5724 G1 E.8 F1800
N5725 ; FEATURE: Inner wall
N5726 ; LINE_WIDTH: 0.45
N5727 ; LAYER_HEIGHT: 0.2
N5728 G1 F8475
N5729 M204 S8000
N5730 G1 X158.916 Y196.801 E1.03439
N5731 G1 X158.916 Y123.199 E2.36678
N5732 G1 X191.084 Y123.199 E1.03439
N5733 G1 X191.084 Y196.741 E2.36485
N5734 ; COOLING_NODE: 0
N5735 M204 S10000
N5736 G1 X191.491 Y197.208 F60000
N5737 G1 F8475
N5738 M204 S8000
N5739 G1 X158.509 Y197.208 E1.06057
N5740 G1 X158.509 Y122.792 E2.39296
N5741 G1 X191.491 Y122.792 E1.06057
N5742 G1 X191.491 Y197.148 E2.39103
N5743 ; COOLING_NODE: 0
N5744 M204 S10000
N5745 G1 X191.898 Y197.615 F60000
N5746 G1 F8475
N5747 M204 S8000
N5748 G1 X158.102 Y197.615 E1.08675
N5749 G1 X158.102 Y122.385 E2.41914
N5750 G1 X191.898 Y122.385 E1.08675
N5751 G1 X191.898 Y197.555 E2.41721
N5752 ; COOLING_NODE: 0
N5753 M204 S10000
N5754 G1 X192.29 Y198.007 F60000
N5755 ; FEATURE: Outer wall
N5756 ; LINE_WIDTH: 0.42
N5757 G1 F9149.261
N5758 M204 S5000
N5759 M73 P54 R17
N5760 G1 X157.71 Y198.007 E1.03002
N5761 G1 X157.71 Y121.993 E2.26421
N5762 G1 X192.29 Y121.993 E1.03002
N5763 G1 X192.29 Y197.947 E2.26243
N5764 G1 E-.8 F1800
N5765 M204 S10000
N5766 G1 X190.736 Y192.738 Z2.6 F60000
N5767 G1 Z2.2
N5768 G1 E.8 F1800
N5769 ; FEATURE: Sparse infill
N5770 ; LINE_WIDTH: 0.45
N5771 G1 F8475
N5772 M204 S8000
N5773 G1 X190.736 Y191.109 E.05236
N5774 G1 X170.794 Y196.453 E.66388
N5775 G1 X167.597 Y196.453 E.10279
N5776 G1 X159.264 Y188.12 E.37893
N5777 G1 X159.264 Y191.113 E.09624
N5778 G1 X190.736 Y182.681 E1.0477
N5779 G1 X190.736 Y185.049 E.07618
N5780 G1 X159.264 Y153.578 E1.43118
N5781 G1 X159.264 Y149.802 E.12144
N5782 G1 X166.299 Y123.547 E.87404
N5783 G1 X163.775 Y123.547 E.08117
N5784 G1 X190.736 Y150.508 E1.22605
N5785 G1 X190.736 Y148.965 E.04959
N5786 G1 X159.264 Y157.398 E1.0477
N5787 G1 X159.264 Y159.026 E.05236
N5788 M204 S10000
N5789 G1 X159.264 Y148.969 F60000
N5790 G1 F8475
N5791 M204 S8000
N5792 G1 X190.736 Y140.537 E1.04769
N5793 G1 X190.736 Y138.994 E.04961
N5794 G1 X175.289 Y123.547 E.70245
N5795 G1 X174.728 Y123.547 E.01803
N5796 G1 X159.264 Y181.259 E1.92126
N5797 G1 X159.264 Y182.684 E.04585
N5798 G1 X190.736 Y174.252 E1.0477
N5799 G1 X190.736 Y173.536 E.02303
N5800 G1 X159.264 Y142.064 E1.43118
N5801 G1 X159.264 Y140.54 E.04901
N5802 G1 X190.736 Y132.108 E1.0477
N5803 G1 X190.736 Y133.736 E.05236
N5804 M204 S10000
N5805 G1 X190.736 Y127.48 F60000
N5806 G1 F8475
N5807 M204 S8000
N5808 G1 X186.803 Y123.547 E.17884
N5809 G1 X183.157 Y123.547 E.11724
N5810 G1 X163.622 Y196.453 E2.42708
N5811 G1 X161.994 Y196.453 E.05236
N5812 M204 S10000
N5813 G1 X172.051 Y196.453 F60000
N5814 G1 F8475
N5815 M204 S8000
N5816 G1 X190.736 Y126.72 E2.32144
N5817 G1 X190.736 Y123.679 E.0978
N5818 G1 X159.264 Y132.112 E1.0477
N5819 G1 X159.264 Y130.551 E.0502
N5820 G1 X190.736 Y162.022 E1.43118
N5821 G1 X190.736 Y165.823 E.12224
N5822 G1 X159.264 Y174.256 E1.04769
N5823 G1 X159.264 Y176.606 E.07559
N5824 G1 X179.111 Y196.453 E.90254
N5825 G1 X180.48 Y196.453 E.04401
N5826 G1 X190.736 Y158.177 E1.27423
N5827 G1 X190.736 Y157.394 E.02517
N5828 G1 X159.264 Y165.827 E1.0477
N5829 G1 X159.264 Y165.092 E.02362
N5830 G1 X190.625 Y196.453 E1.42615
N5831 G1 X188.908 Y196.453 E.0552
N5832 G1 X190.736 Y189.634 E.22701
N5833 G1 X190.736 Y188.005 E.05236
N5834 ; WIPE_START
N5835 G1 X190.736 Y189.634 E-.61876
N5836 G1 X190.639 Y189.993 E-.14124
N5837 ; WIPE_END
N5838 G1 E-.04 F1800
N5839 M204 S10000
N5840 G17
N5841 G3 Z2.6 I1.217 J0 P1  F60000
N5842 ; stop printing object, unique label id: 130
N5843 M625
N5844 ; object ids of layer 11 start: 130
N5845 M624 AQAAAAAAAAA=
N5846 ;======== H2D 20250527========
N5847 ; SKIPPABLE_START
N5848 ; SKIPTYPE: timelapse
N5849 M622.1 S1 ; for prev firware, default turned on
N5850 
N5851 M1002 judge_flag timelapse_record_flag
N5852 
N5853 M622 J1
N5854 M993 A2 B2 C2
N5855 M993 A0 B0 C0
N5856 
N5857 
N5858 
N5859 
N5860     M9711 M0 E1 X260 Y137 Z2.6 S11 C10 O0 T3000
N5861 
N5862 
N5863 
N5864 M993 A3 B3 C3
N5865 
N5866 M623
N5867 ; SKIPPABLE_END
N5868 
N5869 ; object ids of this layer11 end: 130
N5870 M625
N5871 ; CHANGE_LAYER
N5872 ; Z_HEIGHT: 2.4
N5873 ; LAYER_HEIGHT: 0.2
N5874 ;======== H2D 20250521========
N5875 ; layer num/total_layer_count: 12/63
N5876 ; update layer progress
N5877 M73 L12
N5878 M991 S0 P11 ;notify layer change
N5879 
N5880 
N5881 ; OBJECT_ID: 130
N5882 ; COOLING_NODE: 0
N5883 ; start printing object, unique label id: 130
N5884 M624 AQAAAAAAAAA=
N5885 G1 X191.084 Y196.801 F60000
N5886 G1 Z2.4
N5887 G1 E.8 F1800
N5888 ; FEATURE: Inner wall
N5889 ; LINE_WIDTH: 0.45
N5890 ; LAYER_HEIGHT: 0.2
N5891 G1 F8475
N5892 M204 S8000
N5893 G1 X158.916 Y196.801 E1.03439
N5894 G1 X158.916 Y123.199 E2.36678
N5895 G1 X191.084 Y123.199 E1.03439
N5896 G1 X191.084 Y196.741 E2.36485
N5897 ; COOLING_NODE: 0
N5898 M204 S10000
N5899 G1 X191.491 Y197.208 F60000
N5900 G1 F8475
N5901 M204 S8000
N5902 G1 X158.509 Y197.208 E1.06057
N5903 G1 X158.509 Y122.792 E2.39296
N5904 G1 X191.491 Y122.792 E1.06057
N5905 G1 X191.491 Y197.148 E2.39103
N5906 ; COOLING_NODE: 0
N5907 M204 S10000
N5908 G1 X191.898 Y197.615 F60000
N5909 G1 F8475
N5910 M204 S8000
N5911 G1 X158.102 Y197.615 E1.08675
N5912 G1 X158.102 Y122.385 E2.41914
N5913 G1 X191.898 Y122.385 E1.08675
N5914 G1 X191.898 Y197.555 E2.41721
N5915 ; COOLING_NODE: 0
N5916 M204 S10000
N5917 G1 X192.29 Y198.007 F60000
N5918 ; FEATURE: Outer wall
N5919 ; LINE_WIDTH: 0.42
N5920 G1 F9149.261
N5921 M204 S5000
N5922 G1 X157.71 Y198.007 E1.03002
N5923 G1 X157.71 Y121.993 E2.26421
N5924 G1 X192.29 Y121.993 E1.03002
N5925 G1 X192.29 Y197.947 E2.26243
N5926 G1 E-.8 F1800
N5927 M204 S10000
N5928 M73 P54 R16
N5929 G1 X190.736 Y192.884 Z2.8 F60000
N5930 G1 Z2.4
N5931 G1 E.8 F1800
N5932 ; FEATURE: Sparse infill
N5933 ; LINE_WIDTH: 0.45
N5934 G1 F8475
N5935 M204 S8000
N5936 G1 X190.736 Y191.256 E.05236
N5937 G1 X171.34 Y196.453 E.64569
N5938 G1 X167.797 Y196.453 E.11393
N5939 G1 X159.264 Y187.92 E.38803
N5940 G1 X159.264 Y191.26 E.10738
N5941 G1 X190.736 Y182.827 E1.0477
N5942 G1 X190.736 Y184.849 E.06504
N5943 G1 X159.264 Y153.378 E1.43118
N5944 G1 X159.264 Y157.544 E.13396
N5945 G1 X190.736 Y149.112 E1.0477
N5946 G1 X190.736 Y150.308 E.03845
N5947 G1 X163.975 Y123.547 E1.21696
N5948 G1 X166.153 Y123.547 E.07003
N5949 G1 X159.264 Y149.256 E.85585
N5950 G1 X159.264 Y149.116 E.0045
N5951 G1 X190.736 Y140.683 E1.0477
N5952 G1 X190.736 Y138.794 E.06075
N5953 G1 X175.489 Y123.547 E.69335
N5954 G1 X174.582 Y123.547 E.02917
N5955 G1 X159.264 Y180.712 E1.90307
N5956 G1 X159.264 Y182.831 E.06813
N5957 G1 X190.736 Y174.398 E1.0477
N5958 G1 X190.736 Y173.336 E.03417
N5959 G1 X159.264 Y141.864 E1.43118
N5960 G1 X159.264 Y140.687 E.03787
N5961 G1 X190.736 Y132.254 E1.0477
N5962 G1 X190.736 Y133.883 E.05236
N5963 M204 S10000
N5964 G1 X190.736 Y127.28 F60000
N5965 G1 F8475
N5966 M204 S8000
N5967 G1 X187.003 Y123.547 E.16974
N5968 G1 X183.011 Y123.547 E.12838
N5969 G1 X163.476 Y196.453 E2.42708
N5970 G1 X161.847 Y196.453 E.05236
N5971 M204 S10000
N5972 G1 X171.904 Y196.453 F60000
N5973 G1 F8475
N5974 M204 S8000
N5975 G1 X190.736 Y126.174 E2.33963
N5976 G1 X190.736 Y123.825 E.07552
N5977 G1 X159.264 Y132.258 E1.04769
N5978 G1 X159.264 Y130.351 E.06134
N5979 G1 X190.736 Y161.822 E1.43118
N5980 G1 X190.736 Y165.969 E.13338
N5981 G1 X159.264 Y174.402 E1.0477
N5982 G1 X159.264 Y176.406 E.06445
N5983 G1 X179.311 Y196.453 E.91163
N5984 G1 X180.333 Y196.453 E.03287
N5985 G1 X190.736 Y157.631 E1.29242
N5986 G1 X190.736 Y157.541 E.0029
N5987 G1 X159.264 Y165.973 E1.0477
N5988 G1 X159.264 Y164.892 E.03476
N5989 M73 P55 R16
N5990 G1 X190.736 Y196.363 E1.43118
N5991 G1 X190.736 Y196.453 E.00287
N5992 G1 X188.762 Y196.453 E.06346
N5993 G1 X190.736 Y189.087 E.2452
N5994 G1 X190.736 Y187.459 E.05236
N5995 M204 S10000
N5996 G1 X159.264 Y125.458 F60000
N5997 G1 F8475
N5998 M204 S8000
N5999 G1 X159.264 Y123.829 E.05236
N6000 G1 X160.317 Y123.547 E.03505
N6001 G1 X161.946 Y123.547 E.05236
N6002 ; WIPE_START
N6003 G1 X160.317 Y123.547 E-.61876
N6004 G1 X159.958 Y123.643 E-.14124
N6005 ; WIPE_END
N6006 G1 E-.04 F1800
N6007 M204 S10000
N6008 G17
N6009 G3 Z2.8 I1.217 J0 P1  F60000
N6010 ; stop printing object, unique label id: 130
N6011 M625
N6012 ; object ids of layer 12 start: 130
N6013 M624 AQAAAAAAAAA=
N6014 ;======== H2D 20250527========
N6015 ; SKIPPABLE_START
N6016 ; SKIPTYPE: timelapse
N6017 M622.1 S1 ; for prev firware, default turned on
N6018 
N6019 M1002 judge_flag timelapse_record_flag
N6020 
N6021 M622 J1
N6022 M993 A2 B2 C2
N6023 M993 A0 B0 C0
N6024 
N6025 
N6026 
N6027 
N6028     M9711 M0 E1 X260 Y137 Z2.8 S11 C10 O0 T3000
N6029 
N6030 
N6031 
N6032 M993 A3 B3 C3
N6033 
N6034 M623
N6035 ; SKIPPABLE_END
N6036 
N6037 ; object ids of this layer12 end: 130
N6038 M625
N6039 ; CHANGE_LAYER
N6040 ; Z_HEIGHT: 2.6
N6041 ; LAYER_HEIGHT: 0.2
N6042 ;======== H2D 20250521========
N6043 ; layer num/total_layer_count: 13/63
N6044 ; update layer progress
N6045 M73 L13
N6046 M991 S0 P12 ;notify layer change
N6047 
N6048 
N6049 ; OBJECT_ID: 130
N6050 ; COOLING_NODE: 0
N6051 ; start printing object, unique label id: 130
N6052 M624 AQAAAAAAAAA=
N6053 G1 X191.084 Y196.801 F60000
N6054 G1 Z2.6
N6055 G1 E.8 F1800
N6056 ; FEATURE: Inner wall
N6057 ; LINE_WIDTH: 0.45
N6058 ; LAYER_HEIGHT: 0.2
N6059 G1 F8475
N6060 M204 S8000
N6061 G1 X158.916 Y196.801 E1.03439
N6062 G1 X158.916 Y123.199 E2.36678
N6063 G1 X191.084 Y123.199 E1.03439
N6064 G1 X191.084 Y196.741 E2.36485
N6065 ; COOLING_NODE: 0
N6066 M204 S10000
N6067 G1 X191.491 Y197.208 F60000
N6068 G1 F8475
N6069 M204 S8000
N6070 G1 X158.509 Y197.208 E1.06057
N6071 G1 X158.509 Y122.792 E2.39296
N6072 G1 X191.491 Y122.792 E1.06057
N6073 G1 X191.491 Y197.148 E2.39103
N6074 ; COOLING_NODE: 0
N6075 M204 S10000
N6076 G1 X191.898 Y197.615 F60000
N6077 G1 F8475
N6078 M204 S8000
N6079 G1 X158.102 Y197.615 E1.08675
N6080 G1 X158.102 Y122.385 E2.41914
N6081 G1 X191.898 Y122.385 E1.08675
N6082 G1 X191.898 Y197.555 E2.41721
N6083 ; COOLING_NODE: 0
N6084 M204 S10000
N6085 G1 X192.29 Y198.007 F60000
N6086 ; FEATURE: Outer wall
N6087 ; LINE_WIDTH: 0.42
N6088 G1 F9149.261
N6089 M204 S5000
N6090 G1 X157.71 Y198.007 E1.03002
N6091 G1 X157.71 Y121.993 E2.26421
N6092 G1 X192.29 Y121.993 E1.03002
N6093 G1 X192.29 Y197.947 E2.26243
N6094 G1 E-.8 F1800
N6095 M204 S10000
N6096 G1 X190.736 Y193.03 Z3 F60000
N6097 G1 Z2.6
N6098 G1 E.8 F1800
N6099 ; FEATURE: Sparse infill
N6100 ; LINE_WIDTH: 0.45
N6101 G1 F8475
N6102 M204 S8000
N6103 G1 X190.736 Y191.402 E.05236
N6104 G1 X171.886 Y196.453 E.6275
N6105 G1 X171.758 Y196.453 E.00413
N6106 G1 X190.736 Y125.628 E2.35782
N6107 G1 X190.736 Y123.972 E.05324
N6108 G1 X159.264 Y132.404 E1.0477
N6109 G1 X159.264 Y130.151 E.07248
N6110 G1 X190.736 Y161.622 E1.43118
N6111 G1 X190.736 Y166.116 E.14452
N6112 G1 X159.264 Y174.548 E1.0477
N6113 G1 X159.264 Y176.206 E.05331
N6114 G1 X179.511 Y196.453 E.92073
N6115 G1 X180.187 Y196.453 E.02173
N6116 G1 X190.736 Y157.084 E1.31061
N6117 G1 X190.736 Y155.456 E.05236
N6118 M204 S10000
N6119 G1 X190.736 Y157.687 F60000
N6120 G1 F8475
N6121 M204 S8000
N6122 G1 X159.264 Y166.12 E1.0477
N6123 G1 X159.264 Y164.692 E.0459
N6124 G1 X190.736 Y196.163 E1.43118
N6125 G1 X190.736 Y196.453 E.0093
N6126 G1 X188.616 Y196.453 E.06817
N6127 G1 X190.736 Y188.541 E.26339
N6128 G1 X190.736 Y186.913 E.05236
N6129 M204 S10000
N6130 G1 X190.736 Y134.029 F60000
N6131 G1 F8475
N6132 M204 S8000
N6133 G1 X190.736 Y132.401 E.05236
N6134 G1 X159.264 Y140.833 E1.0477
N6135 G1 X159.264 Y141.664 E.02673
N6136 G1 X190.736 Y173.136 E1.43118
N6137 G1 X190.736 Y174.545 E.04531
N6138 G1 X159.264 Y182.977 E1.0477
N6139 G1 X159.264 Y180.166 E.0904
N6140 G1 X174.435 Y123.547 E1.88488
N6141 G1 X175.689 Y123.547 E.04031
N6142 G1 X190.736 Y138.594 E.68426
N6143 G1 X190.736 Y140.829 E.07189
N6144 G1 X159.264 Y149.262 E1.0477
N6145 G1 X159.264 Y148.709 E.01778
N6146 G1 X166.007 Y123.547 E.83766
N6147 G1 X164.175 Y123.547 E.0589
N6148 G1 X190.736 Y150.108 E1.20786
N6149 G1 X190.736 Y149.258 E.02732
N6150 G1 X159.264 Y157.691 E1.0477
N6151 G1 X159.264 Y153.178 E.1451
N6152 G1 X190.736 Y184.649 E1.43118
N6153 G1 X190.736 Y182.973 E.0539
N6154 G1 X159.264 Y191.406 E1.0477
N6155 G1 X159.264 Y187.72 E.11852
N6156 G1 X167.997 Y196.453 E.39712
N6157 G1 X163.329 Y196.453 E.1501
N6158 G1 X182.864 Y123.547 E2.42708
N6159 G1 X187.203 Y123.547 E.13952
N6160 G1 X190.736 Y127.08 E.16065
N6161 G1 X190.736 Y128.708 E.05236
N6162 M204 S10000
N6163 G1 X162.492 Y123.547 F60000
N6164 G1 F8475
N6165 M204 S8000
N6166 G1 X160.864 Y123.547 E.05236
N6167 G1 X159.264 Y123.976 E.05324
N6168 G1 X159.264 Y125.604 E.05236
N6169 ; WIPE_START
N6170 G1 X159.264 Y123.976 E-.61876
N6171 G1 X159.623 Y123.879 E-.14124
N6172 ; WIPE_END
N6173 G1 E-.04 F1800
N6174 M204 S10000
N6175 G17
N6176 G3 Z3 I1.217 J0 P1  F60000
N6177 ; stop printing object, unique label id: 130
N6178 M625
N6179 ; object ids of layer 13 start: 130
N6180 M624 AQAAAAAAAAA=
N6181 ;======== H2D 20250527========
N6182 ; SKIPPABLE_START
N6183 ; SKIPTYPE: timelapse
N6184 M622.1 S1 ; for prev firware, default turned on
N6185 
N6186 M1002 judge_flag timelapse_record_flag
N6187 
N6188 M622 J1
N6189 M993 A2 B2 C2
N6190 M993 A0 B0 C0
N6191 
N6192 
N6193 
N6194 
N6195     M9711 M0 E1 X260 Y137 Z3 S11 C10 O0 T3000
N6196 
N6197 
N6198 
N6199 M993 A3 B3 C3
N6200 
N6201 M623
N6202 ; SKIPPABLE_END
N6203 
N6204 ; object ids of this layer13 end: 130
N6205 M625
N6206 ; CHANGE_LAYER
N6207 ; Z_HEIGHT: 2.8
N6208 ; LAYER_HEIGHT: 0.2
N6209 ;======== H2D 20250521========
N6210 ; layer num/total_layer_count: 14/63
N6211 ; update layer progress
N6212 M73 L14
N6213 M991 S0 P13 ;notify layer change
N6214 
N6215 
N6216 ; OBJECT_ID: 130
N6217 ; COOLING_NODE: 0
N6218 ; start printing object, unique label id: 130
N6219 M624 AQAAAAAAAAA=
N6220 G1 X191.084 Y196.801 F60000
N6221 G1 Z2.8
N6222 G1 E.8 F1800
N6223 ; FEATURE: Inner wall
N6224 ; LINE_WIDTH: 0.45
N6225 ; LAYER_HEIGHT: 0.2
N6226 G1 F8475
N6227 M204 S8000
N6228 G1 X158.916 Y196.801 E1.03439
N6229 G1 X158.916 Y123.199 E2.36678
N6230 G1 X191.084 Y123.199 E1.03439
N6231 G1 X191.084 Y196.741 E2.36485
N6232 ; COOLING_NODE: 0
N6233 M204 S10000
N6234 G1 X191.491 Y197.208 F60000
N6235 G1 F8475
N6236 M204 S8000
N6237 G1 X158.509 Y197.208 E1.06057
N6238 G1 X158.509 Y122.792 E2.39296
N6239 G1 X191.491 Y122.792 E1.06057
N6240 G1 X191.491 Y197.148 E2.39103
N6241 ; COOLING_NODE: 0
N6242 M204 S10000
N6243 G1 X191.898 Y197.615 F60000
N6244 G1 F8475
N6245 M204 S8000
N6246 G1 X158.102 Y197.615 E1.08675
N6247 G1 X158.102 Y122.385 E2.41914
N6248 G1 X191.898 Y122.385 E1.08675
N6249 G1 X191.898 Y197.555 E2.41721
N6250 ; COOLING_NODE: 0
N6251 M204 S10000
N6252 G1 X192.29 Y198.007 F60000
N6253 ; FEATURE: Outer wall
N6254 ; LINE_WIDTH: 0.42
N6255 G1 F9149.261
N6256 M204 S5000
N6257 G1 X157.71 Y198.007 E1.03002
N6258 G1 X157.71 Y121.993 E2.26421
N6259 G1 X192.29 Y121.993 E1.03002
N6260 G1 X192.29 Y197.947 E2.26243
N6261 G1 E-.8 F1800
N6262 M204 S10000
N6263 G1 X190.736 Y193.177 Z3.2 F60000
N6264 G1 Z2.8
N6265 G1 E.8 F1800
N6266 ; FEATURE: Sparse infill
N6267 ; LINE_WIDTH: 0.45
N6268 G1 F8475
N6269 M204 S8000
N6270 G1 X190.736 Y191.549 E.05236
N6271 G1 X172.433 Y196.453 E.60931
N6272 G1 X171.612 Y196.453 E.02641
N6273 G1 X190.736 Y125.081 E2.37601
N6274 G1 X190.736 Y124.118 E.03096
N6275 M73 P56 R16
N6276 G1 X159.264 Y132.551 E1.0477
N6277 G1 X159.264 Y129.951 E.08362
N6278 G1 X190.736 Y161.422 E1.43118
N6279 G1 X190.736 Y157.833 E.11538
N6280 G1 X159.264 Y166.266 E1.0477
N6281 G1 X159.264 Y164.492 E.05704
N6282 G1 X190.736 Y195.963 E1.43118
N6283 G1 X190.736 Y196.453 E.01574
N6284 G1 X188.469 Y196.453 E.07288
N6285 G1 X190.736 Y187.994 E.28158
N6286 G1 X190.736 Y186.366 E.05236
N6287 M204 S10000
N6288 G1 X190.736 Y167.89 F60000
N6289 G1 F8475
N6290 M204 S8000
N6291 G1 X190.736 Y166.262 E.05236
N6292 G1 X159.264 Y174.695 E1.0477
N6293 G1 X159.264 Y176.006 E.04217
N6294 G1 X179.711 Y196.453 E.92982
N6295 G1 X180.04 Y196.453 E.01059
N6296 G1 X190.736 Y156.538 E1.3288
N6297 G1 X190.736 Y154.91 E.05236
N6298 M204 S10000
N6299 G1 X190.736 Y134.175 F60000
N6300 G1 F8475
N6301 M204 S8000
N6302 G1 X190.736 Y132.547 E.05236
N6303 G1 X159.264 Y140.98 E1.0477
N6304 G1 X159.264 Y141.464 E.01559
N6305 G1 X190.736 Y172.936 E1.43118
N6306 G1 X190.736 Y174.691 E.05645
N6307 G1 X159.264 Y183.124 E1.04769
N6308 G1 X159.264 Y179.619 E.11268
N6309 G1 X174.289 Y123.547 E1.86669
N6310 G1 X175.889 Y123.547 E.05145
N6311 G1 X190.736 Y138.394 E.67516
N6312 G1 X190.736 Y140.976 E.08303
N6313 G1 X159.264 Y149.408 E1.0477
N6314 G1 X159.264 Y148.163 E.04006
N6315 G1 X165.86 Y123.547 E.81947
N6316 G1 X164.375 Y123.547 E.04776
N6317 G1 X190.736 Y149.908 E1.19877
N6318 G1 X190.736 Y149.405 E.01618
N6319 G1 X159.264 Y157.837 E1.04769
N6320 G1 X159.264 Y152.978 E.15624
N6321 G1 X190.736 Y184.449 E1.43118
N6322 G1 X190.736 Y183.12 E.04276
N6323 G1 X159.264 Y191.552 E1.0477
N6324 G1 X159.264 Y187.52 E.12966
N6325 G1 X168.197 Y196.453 E.40622
N6326 G1 X163.183 Y196.453 E.16124
N6327 G1 X182.718 Y123.547 E2.42708
N6328 G1 X187.403 Y123.547 E.15066
N6329 G1 X190.736 Y126.88 E.15155
N6330 G1 X190.736 Y128.508 E.05236
N6331 M204 S10000
N6332 G1 X163.038 Y123.547 F60000
N6333 G1 F8475
N6334 M204 S8000
N6335 G1 X161.41 Y123.547 E.05236
N6336 G1 X159.264 Y124.122 E.07143
N6337 G1 X159.264 Y125.75 E.05236
N6338 ; WIPE_START
N6339 G1 X159.264 Y124.122 E-.61876
N6340 G1 X159.623 Y124.026 E-.14124
N6341 ; WIPE_END
N6342 G1 E-.04 F1800
N6343 M204 S10000
N6344 G17
N6345 G3 Z3.2 I1.217 J0 P1  F60000
N6346 ; stop printing object, unique label id: 130
N6347 M625
N6348 ; object ids of layer 14 start: 130
N6349 M624 AQAAAAAAAAA=
N6350 ;======== H2D 20250527========
N6351 ; SKIPPABLE_START
N6352 ; SKIPTYPE: timelapse
N6353 M622.1 S1 ; for prev firware, default turned on
N6354 
N6355 M1002 judge_flag timelapse_record_flag
N6356 
N6357 M622 J1
N6358 M993 A2 B2 C2
N6359 M993 A0 B0 C0
N6360 
N6361 
N6362 
N6363 
N6364     M9711 M0 E1 X260 Y137 Z3.2 S11 C10 O0 T3000
N6365 
N6366 
N6367 
N6368 M993 A3 B3 C3
N6369 
N6370 M623
N6371 ; SKIPPABLE_END
N6372 
N6373 ; object ids of this layer14 end: 130
N6374 M625
N6375 ; CHANGE_LAYER
N6376 ; Z_HEIGHT: 3
N6377 ; LAYER_HEIGHT: 0.2
N6378 ;======== H2D 20250521========
N6379 ; layer num/total_layer_count: 15/63
N6380 ; update layer progress
N6381 M73 L15
N6382 M991 S0 P14 ;notify layer change
N6383 
N6384 
N6385 ; OBJECT_ID: 130
N6386 ; COOLING_NODE: 0
N6387 ; start printing object, unique label id: 130
N6388 M624 AQAAAAAAAAA=
N6389 G1 X191.084 Y196.801 F60000
N6390 G1 Z3
N6391 G1 E.8 F1800
N6392 ; FEATURE: Inner wall
N6393 ; LINE_WIDTH: 0.45
N6394 ; LAYER_HEIGHT: 0.2
N6395 G1 F8475
N6396 M204 S8000
N6397 G1 X158.916 Y196.801 E1.03439
N6398 G1 X158.916 Y123.199 E2.36678
N6399 G1 X191.084 Y123.199 E1.03439
N6400 G1 X191.084 Y196.741 E2.36485
N6401 ; COOLING_NODE: 0
N6402 M204 S10000
N6403 G1 X191.491 Y197.208 F60000
N6404 G1 F8475
N6405 M204 S8000
N6406 G1 X158.509 Y197.208 E1.06057
N6407 G1 X158.509 Y122.792 E2.39296
N6408 G1 X191.491 Y122.792 E1.06057
N6409 G1 X191.491 Y197.148 E2.39103
N6410 ; COOLING_NODE: 0
N6411 M204 S10000
N6412 G1 X191.898 Y197.615 F60000
N6413 G1 F8475
N6414 M204 S8000
N6415 G1 X158.102 Y197.615 E1.08675
N6416 G1 X158.102 Y122.385 E2.41914
N6417 G1 X191.898 Y122.385 E1.08675
N6418 G1 X191.898 Y197.555 E2.41721
N6419 ; COOLING_NODE: 0
N6420 M204 S10000
N6421 G1 X192.29 Y198.007 F60000
N6422 ; FEATURE: Outer wall
N6423 ; LINE_WIDTH: 0.42
N6424 G1 F9149.261
N6425 M204 S5000
N6426 G1 X157.71 Y198.007 E1.03002
N6427 G1 X157.71 Y121.993 E2.26421
N6428 G1 X192.29 Y121.993 E1.03002
N6429 G1 X192.29 Y197.947 E2.26243
N6430 G1 E-.8 F1800
N6431 M204 S10000
N6432 G1 X190.736 Y193.323 Z3.4 F60000
N6433 G1 Z3
N6434 G1 E.8 F1800
N6435 ; FEATURE: Sparse infill
N6436 ; LINE_WIDTH: 0.45
N6437 G1 F8475
N6438 M204 S8000
N6439 G1 X190.736 Y191.695 E.05236
N6440 G1 X172.979 Y196.453 E.59112
N6441 G1 X171.465 Y196.453 E.04869
N6442 G1 X190.736 Y124.535 E2.39421
N6443 G1 X190.736 Y124.265 E.00868
N6444 G1 X159.264 Y132.697 E1.0477
N6445 G1 X159.264 Y129.75 E.09476
N6446 G1 X190.736 Y161.222 E1.43118
N6447 G1 X190.736 Y157.98 E.10424
N6448 G1 X159.264 Y166.412 E1.0477
N6449 G1 X159.264 Y164.292 E.06818
N6450 G1 X190.736 Y195.763 E1.43118
N6451 G1 X190.736 Y196.453 E.02217
N6452 G1 X188.323 Y196.453 E.07759
N6453 G1 X190.736 Y187.448 E.29977
N6454 G1 X190.736 Y185.82 E.05236
N6455 M204 S10000
N6456 G1 X190.736 Y168.037 F60000
N6457 G1 F8475
N6458 M204 S8000
N6459 G1 X190.736 Y166.409 E.05236
N6460 G1 X159.264 Y174.841 E1.0477
N6461 G1 X159.264 Y175.806 E.03103
N6462 G1 X179.911 Y196.453 E.93892
N6463 G1 X179.894 Y196.453 E.00055
N6464 G1 X190.736 Y155.991 E1.34699
N6465 G1 X190.736 Y154.363 E.05236
N6466 M204 S10000
N6467 G1 X190.736 Y134.322 F60000
N6468 G1 F8475
N6469 M204 S8000
N6470 G1 X190.736 Y132.693 E.05236
N6471 G1 X159.264 Y141.126 E1.04769
N6472 G1 X159.264 Y141.264 E.00445
N6473 G1 X190.736 Y172.736 E1.43118
N6474 G1 X190.736 Y174.837 E.06759
N6475 G1 X159.264 Y183.27 E1.04769
N6476 G1 X159.264 Y187.32 E.13024
N6477 G1 X168.397 Y196.453 E.41531
N6478 G1 X163.036 Y196.453 E.17238
N6479 G1 X182.571 Y123.547 E2.42708
N6480 G1 X187.603 Y123.547 E.1618
N6481 G1 X190.736 Y126.68 E.14246
N6482 G1 X190.736 Y128.308 E.05236
N6483 M204 S10000
N6484 G1 X163.585 Y123.547 F60000
N6485 G1 F8475
N6486 M204 S8000
N6487 G1 X161.956 Y123.547 E.05236
N6488 G1 X159.264 Y124.268 E.08962
N6489 G1 X159.264 Y125.897 E.05236
N6490 M204 S10000
N6491 G1 X159.264 Y180.701 F60000
N6492 G1 F8475
N6493 M204 S8000
N6494 G1 X159.264 Y179.073 E.05236
N6495 G1 X174.143 Y123.547 E1.84849
N6496 G1 X176.089 Y123.547 E.06259
N6497 G1 X190.736 Y138.194 E.66606
N6498 G1 X190.736 Y141.122 E.09417
N6499 G1 X159.264 Y149.555 E1.0477
N6500 G1 X159.264 Y147.616 E.06234
N6501 G1 X165.714 Y123.547 E.80128
N6502 G1 X164.575 Y123.547 E.03662
N6503 G1 X190.736 Y149.708 E1.18967
N6504 G1 X190.736 Y149.551 E.00504
N6505 G1 X159.264 Y157.984 E1.0477
N6506 G1 X159.264 Y152.778 E.16738
N6507 G1 X190.736 Y184.249 E1.43118
N6508 G1 X190.736 Y183.266 E.03162
N6509 G1 X159.264 Y191.699 E1.0477
N6510 G1 X159.264 Y193.327 E.05236
N6511 ; WIPE_START
N6512 G1 X159.264 Y191.699 E-.61876
N6513 G1 X159.623 Y191.603 E-.14124
N6514 ; WIPE_END
N6515 G1 E-.04 F1800
N6516 M204 S10000
N6517 G17
N6518 G3 Z3.4 I1.217 J0 P1  F60000
N6519 ; stop printing object, unique label id: 130
N6520 M625
N6521 ; object ids of layer 15 start: 130
N6522 M624 AQAAAAAAAAA=
N6523 ;======== H2D 20250527========
N6524 ; SKIPPABLE_START
N6525 ; SKIPTYPE: timelapse
N6526 M622.1 S1 ; for prev firware, default turned on
N6527 
N6528 M1002 judge_flag timelapse_record_flag
N6529 
N6530 M622 J1
N6531 M993 A2 B2 C2
N6532 M993 A0 B0 C0
N6533 
N6534 
N6535 
N6536 
N6537     M9711 M0 E1 X260 Y137 Z3.4 S11 C10 O0 T3000
N6538 
N6539 
N6540 
N6541 M993 A3 B3 C3
N6542 
N6543 M623
N6544 ; SKIPPABLE_END
N6545 
N6546 ; object ids of this layer15 end: 130
N6547 M625
N6548 ; CHANGE_LAYER
N6549 ; Z_HEIGHT: 3.2
N6550 ; LAYER_HEIGHT: 0.2
N6551 ;======== H2D 20250521========
N6552 ; layer num/total_layer_count: 16/63
N6553 ; update layer progress
N6554 M73 L16
N6555 M991 S0 P15 ;notify layer change
N6556 
N6557 
N6558 ; OBJECT_ID: 130
N6559 ; COOLING_NODE: 0
N6560 ; start printing object, unique label id: 130
N6561 M624 AQAAAAAAAAA=
N6562 G1 X191.084 Y196.801 F60000
N6563 G1 Z3.2
N6564 G1 E.8 F1800
N6565 ; FEATURE: Inner wall
N6566 ; LINE_WIDTH: 0.45
N6567 ; LAYER_HEIGHT: 0.2
N6568 G1 F8475
N6569 M204 S8000
N6570 G1 X158.916 Y196.801 E1.03439
N6571 G1 X158.916 Y123.199 E2.36678
N6572 G1 X191.084 Y123.199 E1.03439
N6573 G1 X191.084 Y196.741 E2.36485
N6574 ; COOLING_NODE: 0
N6575 M204 S10000
N6576 G1 X191.491 Y197.208 F60000
N6577 M73 P57 R16
N6578 G1 F8475
N6579 M204 S8000
N6580 G1 X158.509 Y197.208 E1.06057
N6581 G1 X158.509 Y122.792 E2.39296
N6582 G1 X191.491 Y122.792 E1.06057
N6583 G1 X191.491 Y197.148 E2.39103
N6584 ; COOLING_NODE: 0
N6585 M204 S10000
N6586 G1 X191.898 Y197.615 F60000
N6587 G1 F8475
N6588 M204 S8000
N6589 G1 X158.102 Y197.615 E1.08675
N6590 G1 X158.102 Y122.385 E2.41914
N6591 G1 X191.898 Y122.385 E1.08675
N6592 G1 X191.898 Y197.555 E2.41721
N6593 ; COOLING_NODE: 0
N6594 M204 S10000
N6595 G1 X192.29 Y198.007 F60000
N6596 ; FEATURE: Outer wall
N6597 ; LINE_WIDTH: 0.42
N6598 G1 F9149.261
N6599 M204 S5000
N6600 G1 X157.71 Y198.007 E1.03002
N6601 G1 X157.71 Y121.993 E2.26421
N6602 G1 X192.29 Y121.993 E1.03002
N6603 G1 X192.29 Y197.947 E2.26243
N6604 G1 E-.8 F1800
N6605 M204 S10000
N6606 G1 X190.736 Y193.47 Z3.6 F60000
N6607 G1 Z3.2
N6608 G1 E.8 F1800
N6609 ; FEATURE: Sparse infill
N6610 ; LINE_WIDTH: 0.45
N6611 G1 F8475
N6612 M204 S8000
N6613 G1 X190.736 Y191.841 E.05236
N6614 G1 X173.526 Y196.453 E.57293
N6615 G1 X171.319 Y196.453 E.07096
N6616 G1 X190.736 Y123.988 E2.4124
N6617 G1 X190.736 Y123.547 E.01418
N6618 G1 X187.803 Y123.547 E.0943
N6619 G1 X190.736 Y126.48 E.13336
N6620 G1 X190.736 Y132.84 E.20452
N6621 G1 X159.264 Y141.272 E1.04769
N6622 G1 X159.264 Y141.064 E.00669
N6623 G1 X190.736 Y172.536 E1.43118
N6624 G1 X190.736 Y174.984 E.07873
N6625 G1 X159.264 Y183.416 E1.0477
N6626 G1 X159.264 Y187.12 E.1191
N6627 M73 P57 R15
N6628 G1 X168.597 Y196.453 E.42441
N6629 G1 X162.89 Y196.453 E.18352
N6630 G1 X182.425 Y123.547 E2.42708
N6631 G1 X180.797 Y123.547 E.05236
N6632 M204 S10000
N6633 G1 X190.736 Y124.411 F60000
N6634 G1 F8475
N6635 M204 S8000
N6636 G1 X159.264 Y132.844 E1.0477
N6637 G1 X159.264 Y129.55 E.1059
N6638 G1 X190.736 Y161.022 E1.43118
N6639 G1 X190.736 Y158.126 E.0931
N6640 G1 X159.264 Y166.559 E1.0477
N6641 G1 X159.264 Y164.092 E.07931
N6642 G1 X190.736 Y195.563 E1.43118
N6643 G1 X190.736 Y196.453 E.0286
N6644 G1 X188.176 Y196.453 E.0823
N6645 G1 X190.736 Y186.902 E.31796
N6646 G1 X190.736 Y185.273 E.05236
N6647 M204 S10000
N6648 G1 X190.736 Y168.183 F60000
N6649 G1 F8475
N6650 M204 S8000
N6651 G1 X190.736 Y166.555 E.05236
N6652 G1 X159.264 Y174.988 E1.0477
N6653 G1 X159.264 Y175.606 E.01989
N6654 G1 X180.111 Y196.453 E.94802
N6655 G1 X179.748 Y196.453 E.01169
N6656 G1 X190.736 Y155.445 E1.36518
N6657 G1 X190.736 Y153.817 E.05236
N6658 M204 S10000
N6659 G1 X164.131 Y123.547 F60000
N6660 G1 F8475
N6661 M204 S8000
N6662 G1 X162.503 Y123.547 E.05236
N6663 G1 X159.264 Y124.415 E.10781
N6664 G1 X159.264 Y126.043 E.05236
N6665 M204 S10000
N6666 G1 X159.264 Y180.155 F60000
N6667 G1 F8475
N6668 M204 S8000
N6669 G1 X159.264 Y178.527 E.05236
N6670 G1 X173.996 Y123.547 E1.8303
N6671 G1 X176.289 Y123.547 E.07373
N6672 G1 X190.736 Y137.994 E.65697
N6673 G1 X190.736 Y141.269 E.10531
N6674 G1 X159.264 Y149.701 E1.0477
N6675 G1 X159.264 Y147.07 E.08462
N6676 G1 X165.567 Y123.547 E.78309
N6677 G1 X164.775 Y123.547 E.02548
N6678 G1 X190.736 Y149.508 E1.18058
N6679 G1 X190.736 Y149.697 E.0061
N6680 G1 X159.264 Y158.13 E1.0477
N6681 G1 X159.264 Y152.578 E.17852
N6682 G1 X190.736 Y184.049 E1.43118
N6683 G1 X190.736 Y183.413 E.02048
N6684 G1 X159.264 Y191.845 E1.0477
N6685 G1 X159.264 Y193.474 E.05236
N6686 ; WIPE_START
N6687 G1 X159.264 Y191.845 E-.61876
N6688 G1 X159.623 Y191.749 E-.14124
N6689 ; WIPE_END
N6690 G1 E-.04 F1800
N6691 M204 S10000
N6692 G17
N6693 G3 Z3.6 I1.217 J0 P1  F60000
N6694 ; stop printing object, unique label id: 130
N6695 M625
N6696 ; object ids of layer 16 start: 130
N6697 M624 AQAAAAAAAAA=
N6698 ;======== H2D 20250527========
N6699 ; SKIPPABLE_START
N6700 ; SKIPTYPE: timelapse
N6701 M622.1 S1 ; for prev firware, default turned on
N6702 
N6703 M1002 judge_flag timelapse_record_flag
N6704 
N6705 M622 J1
N6706 M993 A2 B2 C2
N6707 M993 A0 B0 C0
N6708 
N6709 
N6710 
N6711 
N6712     M9711 M0 E1 X260 Y137 Z3.6 S11 C10 O0 T3000
N6713 
N6714 
N6715 
N6716 M993 A3 B3 C3
N6717 
N6718 M623
N6719 ; SKIPPABLE_END
N6720 
N6721 ; object ids of this layer16 end: 130
N6722 M625
N6723 ; CHANGE_LAYER
N6724 ; Z_HEIGHT: 3.4
N6725 ; LAYER_HEIGHT: 0.2
N6726 ;======== H2D 20250521========
N6727 ; layer num/total_layer_count: 17/63
N6728 ; update layer progress
N6729 M73 L17
N6730 M991 S0 P16 ;notify layer change
N6731 
N6732 
N6733 ; OBJECT_ID: 130
N6734 ; COOLING_NODE: 0
N6735 ; start printing object, unique label id: 130
N6736 M624 AQAAAAAAAAA=
N6737 G1 X191.084 Y196.801 F60000
N6738 G1 Z3.4
N6739 G1 E.8 F1800
N6740 ; FEATURE: Inner wall
N6741 ; LINE_WIDTH: 0.45
N6742 ; LAYER_HEIGHT: 0.2
N6743 G1 F8475
N6744 M204 S8000
N6745 G1 X158.916 Y196.801 E1.03439
N6746 G1 X158.916 Y123.199 E2.36678
N6747 G1 X191.084 Y123.199 E1.03439
N6748 G1 X191.084 Y196.741 E2.36485
N6749 ; COOLING_NODE: 0
N6750 M204 S10000
N6751 G1 X191.491 Y197.208 F60000
N6752 G1 F8475
N6753 M204 S8000
N6754 G1 X158.509 Y197.208 E1.06057
N6755 G1 X158.509 Y122.792 E2.39296
N6756 G1 X191.491 Y122.792 E1.06057
N6757 G1 X191.491 Y197.148 E2.39103
N6758 ; COOLING_NODE: 0
N6759 M204 S10000
N6760 G1 X191.898 Y197.615 F60000
N6761 G1 F8475
N6762 M204 S8000
N6763 G1 X158.102 Y197.615 E1.08675
N6764 G1 X158.102 Y122.385 E2.41914
N6765 G1 X191.898 Y122.385 E1.08675
N6766 G1 X191.898 Y197.555 E2.41721
N6767 ; COOLING_NODE: 0
N6768 M204 S10000
N6769 G1 X192.29 Y198.007 F60000
N6770 ; FEATURE: Outer wall
N6771 ; LINE_WIDTH: 0.42
N6772 G1 F9149.261
N6773 M204 S5000
N6774 G1 X157.71 Y198.007 E1.03002
N6775 G1 X157.71 Y121.993 E2.26421
N6776 G1 X192.29 Y121.993 E1.03002
N6777 G1 X192.29 Y197.947 E2.26243
N6778 G1 E-.8 F1800
N6779 M204 S10000
N6780 G1 X186.402 Y196.453 Z3.8 F60000
N6781 G1 Z3.4
N6782 G1 E.8 F1800
N6783 ; FEATURE: Sparse infill
N6784 ; LINE_WIDTH: 0.45
N6785 G1 F8475
N6786 M204 S8000
N6787 G1 X188.03 Y196.453 E.05236
N6788 G1 X190.736 Y186.355 E.33616
N6789 G1 X190.736 Y184.727 E.05236
N6790 M204 S10000
N6791 G1 X190.736 Y165.073 F60000
N6792 G1 F8475
N6793 M204 S8000
N6794 G1 X190.736 Y166.701 E.05236
N6795 G1 X159.264 Y175.134 E1.0477
N6796 G1 X159.264 Y175.406 E.00875
N6797 G1 X180.311 Y196.453 E.95711
N6798 G1 X179.601 Y196.453 E.02283
N6799 G1 X190.736 Y154.899 E1.38337
N6800 G1 X190.736 Y153.27 E.05236
N6801 M204 S10000
N6802 G1 X164.678 Y123.547 F60000
N6803 G1 F8475
N6804 M204 S8000
N6805 G1 X163.049 Y123.547 E.05236
N6806 G1 X159.264 Y124.561 E.126
N6807 G1 X159.264 Y126.19 E.05236
N6808 M204 S10000
N6809 G1 X159.264 Y148.152 F60000
N6810 G1 F8475
N6811 M204 S8000
N6812 G1 X159.264 Y146.523 E.05236
N6813 G1 X165.421 Y123.547 E.7649
N6814 G1 X164.975 Y123.547 E.01434
N6815 G1 X190.736 Y149.308 E1.17148
N6816 G1 X190.736 Y149.844 E.01724
N6817 G1 X159.264 Y158.276 E1.0477
N6818 G1 X159.264 Y156.648 E.05236
N6819 M204 S10000
N6820 M73 P58 R15
N6821 G1 X159.264 Y179.608 F60000
N6822 G1 F8475
N6823 M204 S8000
N6824 G1 X159.264 Y177.98 E.05236
N6825 G1 X173.85 Y123.547 E1.81211
N6826 G1 X176.489 Y123.547 E.08487
N6827 G1 X190.736 Y137.794 E.64787
N6828 G1 X190.736 Y141.415 E.11645
N6829 G1 X159.264 Y149.848 E1.0477
N6830 G1 X159.264 Y152.378 E.08138
N6831 G1 X190.736 Y183.849 E1.43118
N6832 G1 X190.736 Y183.559 E.00934
N6833 G1 X159.264 Y191.992 E1.0477
N6834 G1 X159.264 Y196.453 E.14345
N6835 G1 X162.744 Y196.453 E.11187
N6836 G1 X182.279 Y123.547 E2.42708
N6837 G1 X180.65 Y123.547 E.05236
N6838 M204 S10000
N6839 G1 X190.736 Y131.358 F60000
N6840 G1 F8475
N6841 M204 S8000
N6842 G1 X190.736 Y132.986 E.05236
N6843 G1 X159.264 Y141.419 E1.0477
N6844 G1 X159.264 Y140.864 E.01783
N6845 G1 X190.736 Y172.336 E1.43118
N6846 G1 X190.736 Y175.13 E.08987
N6847 G1 X159.264 Y183.563 E1.0477
N6848 G1 X159.264 Y186.92 E.10796
N6849 G1 X168.797 Y196.453 E.4335
N6850 G1 X171.172 Y196.453 E.07638
N6851 G1 X190.707 Y123.547 E2.42708
N6852 G1 X188.003 Y123.547 E.08696
N6853 G1 X190.736 Y126.28 E.12427
N6854 G1 X190.736 Y127.908 E.05236
N6855 M204 S10000
N6856 G1 X190.736 Y124.557 F60000
N6857 G1 F8475
N6858 M204 S8000
N6859 G1 X159.264 Y132.99 E1.0477
N6860 G1 X159.264 Y129.35 E.11704
N6861 G1 X190.736 Y160.822 E1.43118
N6862 G1 X190.736 Y158.273 E.08197
N6863 G1 X159.264 Y166.705 E1.0477
N6864 G1 X159.264 Y163.892 E.09045
N6865 G1 X190.736 Y195.363 E1.43118
N6866 G1 X190.736 Y191.988 E.10855
N6867 G1 X174.072 Y196.453 E.55474
N6868 G1 X172.444 Y196.453 E.05236
N6869 ; WIPE_START
N6870 G1 X174.072 Y196.453 E-.61876
N6871 G1 X174.431 Y196.357 E-.14124
N6872 ; WIPE_END
N6873 G1 E-.04 F1800
N6874 M204 S10000
N6875 G17
N6876 G3 Z3.8 I1.217 J0 P1  F60000
N6877 ; stop printing object, unique label id: 130
N6878 M625
N6879 ; object ids of layer 17 start: 130
N6880 M624 AQAAAAAAAAA=
N6881 ;======== H2D 20250527========
N6882 ; SKIPPABLE_START
N6883 ; SKIPTYPE: timelapse
N6884 M622.1 S1 ; for prev firware, default turned on
N6885 
N6886 M1002 judge_flag timelapse_record_flag
N6887 
N6888 M622 J1
N6889 M993 A2 B2 C2
N6890 M993 A0 B0 C0
N6891 
N6892 
N6893 
N6894 
N6895     M9711 M0 E1 X260 Y137 Z3.8 S11 C10 O0 T3000
N6896 
N6897 
N6898 
N6899 M993 A3 B3 C3
N6900 
N6901 M623
N6902 ; SKIPPABLE_END
N6903 
N6904 ; object ids of this layer17 end: 130
N6905 M625
N6906 ; CHANGE_LAYER
N6907 ; Z_HEIGHT: 3.6
N6908 ; LAYER_HEIGHT: 0.2
N6909 ;======== H2D 20250521========
N6910 ; layer num/total_layer_count: 18/63
N6911 ; update layer progress
N6912 M73 L18
N6913 M991 S0 P17 ;notify layer change
N6914 
N6915 
N6916 ; OBJECT_ID: 130
N6917 ; COOLING_NODE: 0
N6918 ; start printing object, unique label id: 130
N6919 M624 AQAAAAAAAAA=
N6920 G1 X191.084 Y196.801 F60000
N6921 G1 Z3.6
N6922 G1 E.8 F1800
N6923 ; FEATURE: Inner wall
N6924 ; LINE_WIDTH: 0.45
N6925 ; LAYER_HEIGHT: 0.2
N6926 G1 F8475
N6927 M204 S8000
N6928 G1 X158.916 Y196.801 E1.03439
N6929 G1 X158.916 Y123.199 E2.36678
N6930 G1 X191.084 Y123.199 E1.03439
N6931 G1 X191.084 Y196.741 E2.36485
N6932 ; COOLING_NODE: 0
N6933 M204 S10000
N6934 G1 X191.491 Y197.208 F60000
N6935 G1 F8475
N6936 M204 S8000
N6937 G1 X158.509 Y197.208 E1.06057
N6938 G1 X158.509 Y122.792 E2.39296
N6939 G1 X191.491 Y122.792 E1.06057
N6940 G1 X191.491 Y197.148 E2.39103
N6941 ; COOLING_NODE: 0
N6942 M204 S10000
N6943 G1 X191.898 Y197.615 F60000
N6944 G1 F8475
N6945 M204 S8000
N6946 G1 X158.102 Y197.615 E1.08675
N6947 G1 X158.102 Y122.385 E2.41914
N6948 G1 X191.898 Y122.385 E1.08675
N6949 G1 X191.898 Y197.555 E2.41721
N6950 ; COOLING_NODE: 0
N6951 M204 S10000
N6952 G1 X192.29 Y198.007 F60000
N6953 ; FEATURE: Outer wall
N6954 ; LINE_WIDTH: 0.42
N6955 G1 F9149.261
N6956 M204 S5000
N6957 G1 X157.71 Y198.007 E1.03002
N6958 G1 X157.71 Y121.993 E2.26421
N6959 G1 X192.29 Y121.993 E1.03002
N6960 G1 X192.29 Y197.947 E2.26243
N6961 G1 E-.8 F1800
N6962 M204 S10000
N6963 G1 X186.255 Y196.453 Z4 F60000
N6964 G1 Z3.6
N6965 G1 E.8 F1800
N6966 ; FEATURE: Sparse infill
N6967 ; LINE_WIDTH: 0.45
N6968 G1 F8475
N6969 M204 S8000
N6970 G1 X187.884 Y196.453 E.05236
N6971 G1 X190.736 Y185.809 E.35435
N6972 G1 X190.736 Y184.181 E.05236
N6973 M204 S10000
N6974 G1 X190.736 Y165.22 F60000
N6975 G1 F8475
N6976 M204 S8000
N6977 G1 X190.736 Y166.848 E.05236
N6978 G1 X159.264 Y175.28 E1.0477
N6979 G1 X159.264 Y175.206 E.00239
N6980 G1 X180.511 Y196.453 E.96621
N6981 G1 X179.455 Y196.453 E.03397
N6982 G1 X190.736 Y154.352 E1.40156
N6983 G1 X190.736 Y152.724 E.05236
N6984 M204 S10000
N6985 G1 X164.972 Y123.547 F60000
N6986 G1 F8475
N6987 M204 S8000
N6988 G1 X163.596 Y123.547 E.04424
N6989 G1 X159.264 Y124.708 E.14419
N6990 G1 X159.264 Y126.336 E.05236
N6991 M204 S10000
N6992 G1 X159.264 Y147.605 F60000
N6993 G1 F8475
N6994 M204 S8000
N6995 G1 X159.264 Y145.977 E.05236
N6996 G1 X165.275 Y123.547 E.74671
N6997 G1 X165.175 Y123.547 E.0032
N6998 G1 X190.736 Y149.108 E1.16239
N6999 G1 X190.736 Y149.99 E.02838
N7000 G1 X159.264 Y158.423 E1.0477
N7001 G1 X159.264 Y156.795 E.05236
N7002 M204 S10000
N7003 G1 X159.264 Y179.062 F60000
N7004 G1 F8475
N7005 M204 S8000
N7006 G1 X159.264 Y177.434 E.05236
N7007 G1 X173.703 Y123.547 E1.79392
N7008 G1 X176.689 Y123.547 E.09601
N7009 G1 X190.736 Y137.594 E.63878
N7010 G1 X190.736 Y141.561 E.12759
N7011 G1 X159.264 Y149.994 E1.04769
N7012 G1 X159.264 Y152.178 E.07024
N7013 G1 X190.736 Y183.649 E1.43118
N7014 G1 X190.736 Y183.705 E.0018
N7015 G1 X159.264 Y192.138 E1.04769
N7016 G1 X159.264 Y196.453 E.13875
N7017 G1 X162.597 Y196.453 E.10717
N7018 G1 X182.132 Y123.547 E2.42708
N7019 G1 X188.203 Y123.547 E.19522
N7020 G1 X190.736 Y126.08 E.11517
N7021 G1 X190.736 Y133.133 E.2268
N7022 G1 X159.264 Y141.565 E1.0477
N7023 G1 X159.264 Y140.664 E.02897
N7024 G1 X190.736 Y172.136 E1.43118
N7025 G1 X190.736 Y175.277 E.10101
N7026 G1 X159.264 Y183.709 E1.0477
N7027 G1 X159.264 Y186.72 E.09682
N7028 G1 X168.997 Y196.453 E.4426
N7029 G1 X171.026 Y196.453 E.06524
N7030 G1 X190.561 Y123.547 E2.42708
N7031 G1 X190.736 Y123.547 E.00562
N7032 G1 X190.736 Y124.704 E.03719
N7033 G1 X159.264 Y133.137 E1.0477
N7034 G1 X159.264 Y129.15 E.12818
N7035 G1 X190.736 Y160.622 E1.43118
N7036 G1 X190.736 Y158.419 E.07083
N7037 G1 X159.264 Y166.852 E1.04769
N7038 G1 X159.264 Y163.692 E.10159
N7039 G1 X190.736 Y195.163 E1.43118
N7040 G1 X190.736 Y192.134 E.09741
N7041 G1 X174.618 Y196.453 E.53655
N7042 G1 X172.99 Y196.453 E.05236
N7043 ; WIPE_START
N7044 G1 X174.618 Y196.453 E-.61876
N7045 G1 X174.977 Y196.357 E-.14124
N7046 ; WIPE_END
N7047 G1 E-.04 F1800
N7048 M204 S10000
N7049 G17
N7050 G3 Z4 I1.217 J0 P1  F60000
N7051 ; stop printing object, unique label id: 130
N7052 M625
N7053 ; object ids of layer 18 start: 130
N7054 M624 AQAAAAAAAAA=
N7055 ;======== H2D 20250527========
N7056 ; SKIPPABLE_START
N7057 ; SKIPTYPE: timelapse
N7058 M622.1 S1 ; for prev firware, default turned on
N7059 
N7060 M1002 judge_flag timelapse_record_flag
N7061 
N7062 M622 J1
N7063 M993 A2 B2 C2
N7064 M993 A0 B0 C0
N7065 
N7066 
N7067 
N7068 
N7069     M9711 M0 E1 X260 Y137 Z4 S11 C10 O0 T3000
N7070 
N7071 
N7072 
N7073 M993 A3 B3 C3
N7074 
N7075 M623
N7076 ; SKIPPABLE_END
N7077 
N7078 ; object ids of this layer18 end: 130
N7079 M625
N7080 ; CHANGE_LAYER
N7081 ; Z_HEIGHT: 3.8
N7082 ; LAYER_HEIGHT: 0.2
N7083 ;======== H2D 20250521========
N7084 ; layer num/total_layer_count: 19/63
N7085 ; update layer progress
N7086 M73 L19
N7087 M991 S0 P18 ;notify layer change
N7088 
N7089 
N7090 ; OBJECT_ID: 130
N7091 ; COOLING_NODE: 0
N7092 ; start printing object, unique label id: 130
N7093 M624 AQAAAAAAAAA=
N7094 G1 X191.084 Y196.801 F60000
N7095 G1 Z3.8
N7096 G1 E.8 F1800
N7097 ; FEATURE: Inner wall
N7098 ; LINE_WIDTH: 0.45
N7099 ; LAYER_HEIGHT: 0.2
N7100 G1 F8475
N7101 M204 S8000
N7102 G1 X158.916 Y196.801 E1.03439
N7103 G1 X158.916 Y123.199 E2.36678
N7104 G1 X191.084 Y123.199 E1.03439
N7105 G1 X191.084 Y196.741 E2.36485
N7106 ; COOLING_NODE: 0
N7107 M204 S10000
N7108 G1 X191.491 Y197.208 F60000
N7109 G1 F8475
N7110 M204 S8000
N7111 G1 X158.509 Y197.208 E1.06057
N7112 G1 X158.509 Y122.792 E2.39296
N7113 G1 X191.491 Y122.792 E1.06057
N7114 G1 X191.491 Y197.148 E2.39103
N7115 ; COOLING_NODE: 0
N7116 M204 S10000
N7117 M73 P59 R15
N7118 G1 X191.898 Y197.615 F60000
N7119 G1 F8475
N7120 M204 S8000
N7121 G1 X158.102 Y197.615 E1.08675
N7122 G1 X158.102 Y122.385 E2.41914
N7123 G1 X191.898 Y122.385 E1.08675
N7124 G1 X191.898 Y197.555 E2.41721
N7125 ; COOLING_NODE: 0
N7126 M204 S10000
N7127 G1 X192.29 Y198.007 F60000
N7128 ; FEATURE: Outer wall
N7129 ; LINE_WIDTH: 0.42
N7130 G1 F9149.261
N7131 M204 S5000
N7132 G1 X157.71 Y198.007 E1.03002
N7133 G1 X157.71 Y121.993 E2.26421
N7134 G1 X192.29 Y121.993 E1.03002
N7135 G1 X192.29 Y197.947 E2.26243
N7136 G1 E-.8 F1800
N7137 M204 S10000
N7138 G1 X186.109 Y196.453 Z4.2 F60000
N7139 G1 Z3.8
N7140 G1 E.8 F1800
N7141 ; FEATURE: Sparse infill
N7142 ; LINE_WIDTH: 0.45
N7143 G1 F8475
N7144 M204 S8000
N7145 G1 X187.737 Y196.453 E.05236
N7146 G1 X190.736 Y185.262 E.37254
N7147 G1 X190.736 Y184.055 E.03882
N7148 M204 S10000
N7149 G1 X190.736 Y165.366 F60000
N7150 G1 F8475
N7151 M204 S8000
N7152 G1 X190.736 Y166.994 E.05236
N7153 G1 X159.264 Y175.427 E1.0477
N7154 G1 X159.264 Y175.006 E.01353
N7155 G1 X180.711 Y196.453 E.9753
N7156 G1 X179.308 Y196.453 E.0451
N7157 G1 X190.736 Y153.806 E1.41975
N7158 G1 X190.736 Y152.177 E.05236
N7159 M204 S10000
N7160 G1 X190.736 Y143.336 F60000
N7161 G1 F8475
N7162 M204 S8000
N7163 G1 X190.736 Y141.708 E.05236
N7164 G1 X159.264 Y150.141 E1.04769
N7165 G1 X159.264 Y151.978 E.0591
N7166 G1 X190.736 Y183.449 E1.43118
N7167 G1 X190.736 Y183.852 E.01294
N7168 G1 X159.264 Y192.284 E1.0477
N7169 G1 X159.264 Y196.453 E.13404
N7170 G1 X162.451 Y196.453 E.10246
N7171 G1 X181.986 Y123.547 E2.42708
N7172 G1 X183.614 Y123.547 E.05236
N7173 M204 S10000
N7174 G1 X164.925 Y123.547 F60000
N7175 G1 F8475
N7176 M204 S8000
N7177 G1 X164.142 Y123.547 E.02516
N7178 G1 X159.264 Y124.854 E.16238
N7179 G1 X159.264 Y128.951 E.13172
N7180 G1 X190.736 Y160.422 E1.43118
N7181 G1 X190.736 Y158.565 E.05969
N7182 G1 X159.264 Y166.998 E1.0477
N7183 G1 X159.264 Y163.492 E.11273
N7184 G1 X190.736 Y194.963 E1.43118
N7185 G1 X190.736 Y192.281 E.08627
N7186 G1 X175.165 Y196.453 E.51836
N7187 G1 X173.536 Y196.453 E.05236
N7188 M204 S10000
N7189 G1 X159.264 Y178.516 F60000
N7190 G1 F8475
N7191 M204 S8000
N7192 G1 X159.264 Y176.887 E.05236
N7193 G1 X173.557 Y123.547 E1.77573
N7194 G1 X176.889 Y123.547 E.10715
N7195 G1 X190.736 Y137.394 E.62968
N7196 G1 X190.736 Y133.279 E.13231
N7197 G1 X159.264 Y141.712 E1.0477
N7198 G1 X159.264 Y140.464 E.04011
N7199 G1 X190.736 Y171.936 E1.43118
N7200 G1 X190.736 Y175.423 E.11215
N7201 G1 X159.264 Y183.856 E1.0477
N7202 G1 X159.264 Y186.52 E.08568
N7203 G1 X169.197 Y196.453 E.45169
N7204 G1 X170.88 Y196.453 E.0541
N7205 G1 X190.415 Y123.547 E2.42708
N7206 G1 X188.403 Y123.547 E.06468
N7207 G1 X190.736 Y125.88 E.10608
N7208 G1 X190.736 Y124.85 E.0331
N7209 G1 X159.264 Y133.283 E1.0477
N7210 G1 X159.264 Y134.911 E.05236
N7211 M204 S10000
N7212 G1 X159.264 Y147.059 F60000
N7213 G1 F8475
N7214 M204 S8000
N7215 G1 X159.264 Y145.431 E.05236
N7216 G1 X165.128 Y123.547 E.72852
N7217 G1 X165.375 Y123.547 E.00794
N7218 G1 X190.736 Y148.908 E1.15329
N7219 G1 X190.736 Y150.137 E.03952
N7220 G1 X159.264 Y158.569 E1.0477
N7221 G1 X159.264 Y156.941 E.05236
N7222 ; WIPE_START
N7223 G1 X159.264 Y158.569 E-.61876
N7224 G1 X159.623 Y158.473 E-.14124
N7225 ; WIPE_END
N7226 G1 E-.04 F1800
N7227 M204 S10000
N7228 G17
N7229 G3 Z4.2 I1.217 J0 P1  F60000
N7230 ; stop printing object, unique label id: 130
N7231 M625
N7232 ; object ids of layer 19 start: 130
N7233 M624 AQAAAAAAAAA=
N7234 ;======== H2D 20250527========
N7235 ; SKIPPABLE_START
N7236 ; SKIPTYPE: timelapse
N7237 M622.1 S1 ; for prev firware, default turned on
N7238 
N7239 M1002 judge_flag timelapse_record_flag
N7240 
N7241 M622 J1
N7242 M993 A2 B2 C2
N7243 M993 A0 B0 C0
N7244 
N7245 
N7246 
N7247 
N7248     M9711 M0 E1 X260 Y137 Z4.2 S11 C10 O0 T3000
N7249 
N7250 
N7251 
N7252 M993 A3 B3 C3
N7253 
N7254 M623
N7255 ; SKIPPABLE_END
N7256 
N7257 ; object ids of this layer19 end: 130
N7258 M625
N7259 ; CHANGE_LAYER
N7260 ; Z_HEIGHT: 4
N7261 ; LAYER_HEIGHT: 0.2
N7262 ;======== H2D 20250521========
N7263 ; layer num/total_layer_count: 20/63
N7264 ; update layer progress
N7265 M73 L20
N7266 M991 S0 P19 ;notify layer change
N7267 
N7268 
N7269 ; OBJECT_ID: 130
N7270 ; COOLING_NODE: 0
N7271 ; start printing object, unique label id: 130
N7272 M624 AQAAAAAAAAA=
N7273 G1 X191.084 Y196.801 F60000
N7274 G1 Z4
N7275 G1 E.8 F1800
N7276 ; FEATURE: Inner wall
N7277 ; LINE_WIDTH: 0.45
N7278 ; LAYER_HEIGHT: 0.2
N7279 G1 F8475
N7280 M204 S8000
N7281 G1 X158.916 Y196.801 E1.03439
N7282 G1 X158.916 Y123.199 E2.36678
N7283 G1 X191.084 Y123.199 E1.03439
N7284 G1 X191.084 Y196.741 E2.36485
N7285 ; COOLING_NODE: 0
N7286 M204 S10000
N7287 G1 X191.491 Y197.208 F60000
N7288 G1 F8475
N7289 M204 S8000
N7290 G1 X158.509 Y197.208 E1.06057
N7291 G1 X158.509 Y122.792 E2.39296
N7292 G1 X191.491 Y122.792 E1.06057
N7293 G1 X191.491 Y197.148 E2.39103
N7294 ; COOLING_NODE: 0
N7295 M204 S10000
N7296 G1 X191.898 Y197.615 F60000
N7297 G1 F8475
N7298 M204 S8000
N7299 G1 X158.102 Y197.615 E1.08675
N7300 G1 X158.102 Y122.385 E2.41914
N7301 G1 X191.898 Y122.385 E1.08675
N7302 G1 X191.898 Y197.555 E2.41721
N7303 ; COOLING_NODE: 0
N7304 M204 S10000
N7305 G1 X192.29 Y198.007 F60000
N7306 ; FEATURE: Outer wall
N7307 ; LINE_WIDTH: 0.42
N7308 G1 F9149.261
N7309 M204 S5000
N7310 G1 X157.71 Y198.007 E1.03002
N7311 G1 X157.71 Y121.993 E2.26421
N7312 G1 X192.29 Y121.993 E1.03002
N7313 G1 X192.29 Y197.947 E2.26243
N7314 G1 E-.8 F1800
N7315 M204 S10000
N7316 G1 X185.962 Y196.453 Z4.4 F60000
N7317 G1 Z4
N7318 G1 E.8 F1800
N7319 ; FEATURE: Sparse infill
N7320 ; LINE_WIDTH: 0.45
N7321 G1 F8475
N7322 M204 S8000
N7323 G1 X187.591 Y196.453 E.05236
N7324 G1 X190.736 Y184.716 E.39073
N7325 G1 X190.736 Y183.998 E.02308
N7326 G1 X159.264 Y192.431 E1.0477
N7327 G1 X159.264 Y196.453 E.12933
N7328 G1 X162.304 Y196.453 E.09775
N7329 G1 X181.839 Y123.547 E2.42708
N7330 G1 X183.468 Y123.547 E.05236
N7331 M204 S10000
N7332 G1 X190.736 Y165.512 F60000
N7333 G1 F8475
N7334 M204 S8000
N7335 G1 X190.736 Y167.141 E.05236
N7336 G1 X159.264 Y175.573 E1.0477
N7337 M204 S10000
N7338 G1 X159.264 Y173.178 F60000
N7339 G1 F8475
N7340 M204 S8000
N7341 G1 X159.264 Y174.806 E.05236
N7342 G1 X180.911 Y196.453 E.9844
N7343 G1 X179.162 Y196.453 E.05624
N7344 G1 X190.736 Y153.259 E1.43794
N7345 G1 X190.736 Y151.631 E.05236
N7346 M204 S10000
N7347 G1 X190.736 Y143.483 F60000
N7348 G1 F8475
N7349 M204 S8000
N7350 G1 X190.736 Y141.854 E.05236
N7351 G1 X159.264 Y150.287 E1.0477
N7352 G1 X159.264 Y151.778 E.04796
N7353 G1 X190.736 Y183.249 E1.43118
N7354 G1 X190.736 Y181.621 E.05236
N7355 M204 S10000
N7356 G1 X174.083 Y196.453 F60000
N7357 G1 F8475
N7358 M204 S8000
N7359 G1 X175.711 Y196.453 E.05236
N7360 G1 X190.736 Y192.427 E.50017
N7361 G1 X190.736 Y194.763 E.07513
N7362 G1 X159.264 Y163.292 E1.43118
N7363 G1 X159.264 Y167.145 E.12387
N7364 G1 X190.736 Y158.712 E1.0477
N7365 G1 X190.736 Y160.222 E.04855
N7366 M73 P60 R14
N7367 G1 X159.264 Y128.751 E1.43118
N7368 G1 X159.264 Y125.001 E.12059
N7369 G1 X164.688 Y123.547 E.18057
N7370 G1 X164.982 Y123.547 E.00943
N7371 G1 X159.264 Y144.884 E.71033
N7372 G1 X159.264 Y146.513 E.05236
N7373 M204 S10000
N7374 G1 X159.264 Y157.087 F60000
N7375 G1 F8475
N7376 M204 S8000
N7377 G1 X159.264 Y158.716 E.05236
N7378 G1 X190.736 Y150.283 E1.0477
N7379 G1 X190.736 Y148.708 E.05066
N7380 G1 X165.575 Y123.547 E1.1442
N7381 G1 X167.203 Y123.547 E.05236
N7382 M204 S10000
N7383 G1 X159.264 Y135.058 F60000
N7384 G1 F8475
N7385 M204 S8000
N7386 G1 X159.264 Y133.429 E.05236
N7387 G1 X190.736 Y124.997 E1.0477
N7388 G1 X190.736 Y125.68 E.02197
N7389 G1 X188.603 Y123.547 E.09698
N7390 G1 X190.268 Y123.547 E.05354
N7391 G1 X170.733 Y196.453 E2.42708
N7392 G1 X169.397 Y196.453 E.04296
N7393 G1 X159.264 Y186.32 E.46079
N7394 G1 X159.264 Y184.002 E.07454
N7395 G1 X190.736 Y175.569 E1.0477
N7396 G1 X190.736 Y171.736 E.12328
N7397 G1 X159.264 Y140.264 E1.43118
N7398 G1 X159.264 Y141.858 E.05125
N7399 G1 X190.736 Y133.425 E1.0477
N7400 G1 X190.736 Y137.194 E.12117
N7401 G1 X177.089 Y123.547 E.62059
N7402 G1 X173.411 Y123.547 E.11829
N7403 G1 X159.264 Y176.341 E1.75754
N7404 G1 X159.264 Y177.969 E.05236
N7405 ; WIPE_START
N7406 G1 X159.264 Y176.341 E-.61876
N7407 G1 X159.361 Y175.982 E-.14124
N7408 ; WIPE_END
N7409 G1 E-.04 F1800
N7410 M204 S10000
N7411 G17
N7412 G3 Z4.4 I1.217 J0 P1  F60000
N7413 ; stop printing object, unique label id: 130
N7414 M625
N7415 ; object ids of layer 20 start: 130
N7416 M624 AQAAAAAAAAA=
N7417 ;======== H2D 20250527========
N7418 ; SKIPPABLE_START
N7419 ; SKIPTYPE: timelapse
N7420 M622.1 S1 ; for prev firware, default turned on
N7421 
N7422 M1002 judge_flag timelapse_record_flag
N7423 
N7424 M622 J1
N7425 M993 A2 B2 C2
N7426 M993 A0 B0 C0
N7427 
N7428 
N7429 
N7430 
N7431     M9711 M0 E1 X260 Y137 Z4.4 S11 C10 O0 T3000
N7432 
N7433 
N7434 
N7435 M993 A3 B3 C3
N7436 
N7437 M623
N7438 ; SKIPPABLE_END
N7439 
N7440 ; object ids of this layer20 end: 130
N7441 M625
N7442 ; CHANGE_LAYER
N7443 ; Z_HEIGHT: 4.2
N7444 ; LAYER_HEIGHT: 0.2
N7445 ;======== H2D 20250521========
N7446 ; layer num/total_layer_count: 21/63
N7447 ; update layer progress
N7448 M73 L21
N7449 M991 S0 P20 ;notify layer change
N7450 
N7451 
N7452 ; OBJECT_ID: 130
N7453 ; COOLING_NODE: 0
N7454 ; start printing object, unique label id: 130
N7455 M624 AQAAAAAAAAA=
N7456 G1 X191.084 Y196.801 F60000
N7457 G1 Z4.2
N7458 G1 E.8 F1800
N7459 ; FEATURE: Inner wall
N7460 ; LINE_WIDTH: 0.45
N7461 ; LAYER_HEIGHT: 0.2
N7462 G1 F8475
N7463 M204 S8000
N7464 G1 X158.916 Y196.801 E1.03439
N7465 G1 X158.916 Y123.199 E2.36678
N7466 G1 X191.084 Y123.199 E1.03439
N7467 G1 X191.084 Y196.741 E2.36485
N7468 ; COOLING_NODE: 0
N7469 M204 S10000
N7470 G1 X191.491 Y197.208 F60000
N7471 G1 F8475
N7472 M204 S8000
N7473 G1 X158.509 Y197.208 E1.06057
N7474 G1 X158.509 Y122.792 E2.39296
N7475 G1 X191.491 Y122.792 E1.06057
N7476 G1 X191.491 Y197.148 E2.39103
N7477 ; COOLING_NODE: 0
N7478 M204 S10000
N7479 G1 X191.898 Y197.615 F60000
N7480 G1 F8475
N7481 M204 S8000
N7482 G1 X158.102 Y197.615 E1.08675
N7483 G1 X158.102 Y122.385 E2.41914
N7484 G1 X191.898 Y122.385 E1.08675
N7485 G1 X191.898 Y197.555 E2.41721
N7486 ; COOLING_NODE: 0
N7487 M204 S10000
N7488 G1 X192.29 Y198.007 F60000
N7489 ; FEATURE: Outer wall
N7490 ; LINE_WIDTH: 0.42
N7491 G1 F9149.261
N7492 M204 S5000
N7493 G1 X157.71 Y198.007 E1.03002
N7494 G1 X157.71 Y121.993 E2.26421
N7495 G1 X192.29 Y121.993 E1.03002
N7496 G1 X192.29 Y197.947 E2.26243
N7497 G1 E-.8 F1800
N7498 M204 S10000
N7499 G1 X185.816 Y196.453 Z4.6 F60000
N7500 G1 Z4.2
N7501 G1 E.8 F1800
N7502 ; FEATURE: Sparse infill
N7503 ; LINE_WIDTH: 0.45
N7504 G1 F8475
N7505 M204 S8000
N7506 G1 X187.444 Y196.453 E.05236
N7507 G1 X190.736 Y184.145 E.40969
N7508 G1 X159.264 Y192.577 E1.0477
N7509 G1 X159.264 Y196.453 E.12462
N7510 G1 X162.158 Y196.453 E.09304
N7511 G1 X181.693 Y123.547 E2.42708
N7512 G1 X183.321 Y123.547 E.05236
N7513 M204 S10000
N7514 G1 X164.835 Y123.547 F60000
N7515 G1 F8475
N7516 M204 S8000
N7517 G1 X159.264 Y144.338 E.69214
N7518 G1 X159.264 Y145.966 E.05236
N7519 M204 S10000
N7520 G1 X159.264 Y135.204 F60000
N7521 G1 F8475
N7522 M204 S8000
N7523 G1 X159.264 Y133.576 E.05236
N7524 G1 X190.736 Y125.143 E1.0477
N7525 G1 X190.736 Y125.48 E.01083
N7526 G1 X188.803 Y123.547 E.08789
N7527 G1 X190.122 Y123.547 E.04241
N7528 G1 X170.587 Y196.453 E2.42708
N7529 G1 X169.597 Y196.453 E.03182
N7530 G1 X159.264 Y186.12 E.46988
N7531 G1 X159.264 Y184.149 E.0634
N7532 G1 X190.736 Y175.716 E1.0477
N7533 G1 X190.736 Y171.536 E.13442
N7534 G1 X159.264 Y140.064 E1.43118
N7535 G1 X159.264 Y142.005 E.06239
N7536 G1 X190.736 Y133.572 E1.0477
N7537 G1 X190.736 Y136.994 E.11003
N7538 G1 X177.289 Y123.547 E.61149
N7539 G1 X173.264 Y123.547 E.12943
N7540 G1 X159.264 Y175.795 E1.73935
N7541 G1 X159.264 Y175.72 E.00241
N7542 G1 X190.736 Y167.287 E1.0477
N7543 G1 X190.736 Y165.659 E.05236
N7544 M204 S10000
N7545 G1 X190.736 Y181.421 F60000
N7546 G1 F8475
N7547 M204 S8000
N7548 G1 X190.736 Y183.049 E.05236
N7549 G1 X159.264 Y151.578 E1.43118
N7550 G1 X159.264 Y150.433 E.03682
N7551 G1 X190.736 Y142.001 E1.0477
N7552 G1 X190.736 Y143.629 E.05236
N7553 M204 S10000
N7554 G1 X190.736 Y151.085 F60000
N7555 G1 F8475
N7556 M204 S8000
N7557 G1 X190.736 Y152.713 E.05236
N7558 G1 X179.015 Y196.453 E1.45613
N7559 G1 X181.111 Y196.453 E.06738
N7560 G1 X159.264 Y174.606 E.99349
N7561 M204 S10000
N7562 G1 X159.264 Y157.234 F60000
N7563 G1 F8475
N7564 M204 S8000
N7565 G1 X159.264 Y158.862 E.05236
N7566 G1 X190.736 Y150.429 E1.04769
N7567 G1 X190.736 Y148.508 E.0618
N7568 G1 X165.775 Y123.547 E1.1351
N7569 G1 X165.235 Y123.547 E.01737
N7570 G1 X159.264 Y125.147 E.19876
N7571 G1 X159.264 Y128.551 E.10945
N7572 G1 X190.736 Y160.022 E1.43118
N7573 G1 X190.736 Y158.858 E.03741
N7574 G1 X159.264 Y167.291 E1.0477
N7575 G1 X159.264 Y163.092 E.13501
N7576 G1 X190.736 Y194.563 E1.43118
N7577 G1 X190.736 Y192.573 E.06399
N7578 G1 X176.258 Y196.453 E.48198
N7579 G1 X174.629 Y196.453 E.05236
N7580 ; WIPE_START
N7581 G1 X176.258 Y196.453 E-.61876
N7582 G1 X176.617 Y196.357 E-.14124
N7583 ; WIPE_END
N7584 G1 E-.04 F1800
N7585 M204 S10000
N7586 G17
N7587 G3 Z4.6 I1.217 J0 P1  F60000
N7588 ; stop printing object, unique label id: 130
N7589 M625
N7590 ; object ids of layer 21 start: 130
N7591 M624 AQAAAAAAAAA=
N7592 ;======== H2D 20250527========
N7593 ; SKIPPABLE_START
N7594 ; SKIPTYPE: timelapse
N7595 M622.1 S1 ; for prev firware, default turned on
N7596 
N7597 M1002 judge_flag timelapse_record_flag
N7598 
N7599 M622 J1
N7600 M993 A2 B2 C2
N7601 M993 A0 B0 C0
N7602 
N7603 
N7604 
N7605 
N7606     M9711 M0 E1 X260 Y137 Z4.6 S11 C10 O0 T3000
N7607 
N7608 
N7609 
N7610 M993 A3 B3 C3
N7611 
N7612 M623
N7613 ; SKIPPABLE_END
N7614 
N7615 ; object ids of this layer21 end: 130
N7616 M625
N7617 ; CHANGE_LAYER
N7618 ; Z_HEIGHT: 4.4
N7619 ; LAYER_HEIGHT: 0.2
N7620 ;======== H2D 20250521========
N7621 ; layer num/total_layer_count: 22/63
N7622 ; update layer progress
N7623 M73 L22
N7624 M991 S0 P21 ;notify layer change
N7625 
N7626 
N7627 ; OBJECT_ID: 130
N7628 ; COOLING_NODE: 0
N7629 ; start printing object, unique label id: 130
N7630 M624 AQAAAAAAAAA=
N7631 G1 X191.084 Y196.801 F60000
N7632 G1 Z4.4
N7633 G1 E.8 F1800
N7634 ; FEATURE: Inner wall
N7635 ; LINE_WIDTH: 0.45
N7636 ; LAYER_HEIGHT: 0.2
N7637 G1 F8475
N7638 M204 S8000
N7639 G1 X158.916 Y196.801 E1.03439
N7640 G1 X158.916 Y123.199 E2.36678
N7641 G1 X191.084 Y123.199 E1.03439
N7642 G1 X191.084 Y196.741 E2.36485
N7643 ; COOLING_NODE: 0
N7644 M204 S10000
N7645 G1 X191.491 Y197.208 F60000
N7646 G1 F8475
N7647 M204 S8000
N7648 G1 X158.509 Y197.208 E1.06057
N7649 G1 X158.509 Y122.792 E2.39296
N7650 G1 X191.491 Y122.792 E1.06057
N7651 G1 X191.491 Y197.148 E2.39103
N7652 ; COOLING_NODE: 0
N7653 M204 S10000
N7654 G1 X191.898 Y197.615 F60000
N7655 G1 F8475
N7656 M204 S8000
N7657 G1 X158.102 Y197.615 E1.08675
N7658 G1 X158.102 Y122.385 E2.41914
N7659 G1 X191.898 Y122.385 E1.08675
N7660 G1 X191.898 Y197.555 E2.41721
N7661 ; COOLING_NODE: 0
N7662 M204 S10000
N7663 G1 X192.29 Y198.007 F60000
N7664 ; FEATURE: Outer wall
N7665 ; LINE_WIDTH: 0.42
N7666 M73 P61 R14
N7667 G1 F9149.261
N7668 M204 S5000
N7669 G1 X157.71 Y198.007 E1.03002
N7670 G1 X157.71 Y121.993 E2.26421
N7671 G1 X192.29 Y121.993 E1.03002
N7672 G1 X192.29 Y197.947 E2.26243
N7673 G1 E-.8 F1800
N7674 M204 S10000
N7675 G1 X185.67 Y196.453 Z4.8 F60000
N7676 G1 Z4.4
N7677 G1 E.8 F1800
N7678 ; FEATURE: Sparse infill
N7679 ; LINE_WIDTH: 0.45
N7680 G1 F8475
N7681 M204 S8000
N7682 G1 X187.298 Y196.453 E.05236
N7683 G1 X190.736 Y183.623 E.42711
N7684 G1 X190.736 Y182.849 E.02488
N7685 G1 X159.264 Y151.378 E1.43118
N7686 G1 X159.264 Y150.58 E.02568
N7687 G1 X190.736 Y142.147 E1.0477
N7688 G1 X190.736 Y148.308 E.1981
N7689 G1 X165.975 Y123.547 E1.12601
N7690 G1 X165.781 Y123.547 E.00623
N7691 G1 X159.264 Y125.293 E.21695
N7692 G1 X159.264 Y128.351 E.09831
N7693 G1 X190.736 Y159.822 E1.43118
N7694 G1 X190.736 Y159.005 E.02627
N7695 G1 X159.264 Y167.437 E1.0477
N7696 G1 X159.264 Y169.066 E.05236
N7697 M204 S10000
N7698 G1 X159.264 Y174.406 F60000
N7699 G1 F8475
N7700 M204 S8000
N7701 G1 X181.311 Y196.453 E1.00259
N7702 G1 X178.869 Y196.453 E.07852
N7703 G1 X190.736 Y152.167 E1.47432
N7704 G1 X190.736 Y150.576 E.05115
N7705 G1 X159.264 Y159.009 E1.04769
N7706 G1 X159.264 Y162.892 E.12489
N7707 G1 X190.736 Y194.363 E1.43118
N7708 G1 X190.736 Y192.72 E.05285
N7709 G1 X176.804 Y196.453 E.46379
N7710 G1 X175.176 Y196.453 E.05236
N7711 M204 S10000
N7712 G1 X159.264 Y145.42 F60000
N7713 G1 F8475
N7714 M204 S8000
N7715 G1 X159.264 Y143.791 E.05236
N7716 G1 X164.689 Y123.547 E.67395
N7717 M204 S10000
N7718 G1 X171.489 Y123.547 F60000
N7719 G1 F8475
N7720 M204 S8000
N7721 G1 X173.118 Y123.547 E.05236
N7722 G1 X159.264 Y175.248 E1.72116
N7723 G1 X159.264 Y175.866 E.01987
N7724 G1 X190.736 Y167.433 E1.0477
N7725 G1 X190.736 Y171.336 E.12548
N7726 G1 X159.264 Y139.864 E1.43118
N7727 G1 X159.264 Y142.151 E.07353
N7728 G1 X190.736 Y133.718 E1.0477
N7729 G1 X190.736 Y136.794 E.09889
N7730 G1 X177.489 Y123.547 E.6024
N7731 G1 X181.546 Y123.547 E.13047
N7732 G1 X162.011 Y196.453 E2.42708
N7733 G1 X159.264 Y196.453 E.08833
N7734 G1 X159.264 Y192.724 E.11991
N7735 G1 X190.736 Y184.291 E1.0477
N7736 M204 S10000
N7737 G1 X190.736 Y177.491 F60000
N7738 G1 F8475
N7739 M204 S8000
N7740 G1 X190.736 Y175.862 E.05236
N7741 G1 X159.264 Y184.295 E1.04769
N7742 G1 X159.264 Y185.92 E.05227
N7743 G1 X169.797 Y196.453 E.47898
N7744 G1 X170.44 Y196.453 E.02069
N7745 G1 X189.975 Y123.547 E2.42708
N7746 G1 X189.003 Y123.547 E.03127
N7747 G1 X190.736 Y125.289 E.07901
N7748 G1 X159.264 Y133.722 E1.0477
N7749 G1 X159.264 Y135.35 E.05236
N7750 ; WIPE_START
N7751 G1 X159.264 Y133.722 E-.61876
N7752 G1 X159.623 Y133.626 E-.14124
N7753 ; WIPE_END
N7754 G1 E-.04 F1800
N7755 M204 S10000
N7756 G17
N7757 G3 Z4.8 I1.217 J0 P1  F60000
N7758 ; stop printing object, unique label id: 130
N7759 M625
N7760 ; object ids of layer 22 start: 130
N7761 M624 AQAAAAAAAAA=
N7762 ;======== H2D 20250527========
N7763 ; SKIPPABLE_START
N7764 ; SKIPTYPE: timelapse
N7765 M622.1 S1 ; for prev firware, default turned on
N7766 
N7767 M1002 judge_flag timelapse_record_flag
N7768 
N7769 M622 J1
N7770 M993 A2 B2 C2
N7771 M993 A0 B0 C0
N7772 
N7773 
N7774 
N7775 
N7776     M9711 M0 E1 X260 Y137 Z4.8 S11 C10 O0 T3000
N7777 
N7778 
N7779 
N7780 M993 A3 B3 C3
N7781 
N7782 M623
N7783 ; SKIPPABLE_END
N7784 
N7785 ; object ids of this layer22 end: 130
N7786 M625
N7787 ; CHANGE_LAYER
N7788 ; Z_HEIGHT: 4.6
N7789 ; LAYER_HEIGHT: 0.2
N7790 ;======== H2D 20250521========
N7791 ; layer num/total_layer_count: 23/63
N7792 ; update layer progress
N7793 M73 L23
N7794 M991 S0 P22 ;notify layer change
N7795 
N7796 
N7797 ; OBJECT_ID: 130
N7798 ; COOLING_NODE: 0
N7799 ; start printing object, unique label id: 130
N7800 M624 AQAAAAAAAAA=
N7801 G1 X191.084 Y196.801 F60000
N7802 G1 Z4.6
N7803 G1 E.8 F1800
N7804 ; FEATURE: Inner wall
N7805 ; LINE_WIDTH: 0.45
N7806 ; LAYER_HEIGHT: 0.2
N7807 G1 F8475
N7808 M204 S8000
N7809 G1 X158.916 Y196.801 E1.03439
N7810 G1 X158.916 Y123.199 E2.36678
N7811 G1 X191.084 Y123.199 E1.03439
N7812 G1 X191.084 Y196.741 E2.36485
N7813 ; COOLING_NODE: 0
N7814 M204 S10000
N7815 G1 X191.491 Y197.208 F60000
N7816 G1 F8475
N7817 M204 S8000
N7818 G1 X158.509 Y197.208 E1.06057
N7819 G1 X158.509 Y122.792 E2.39296
N7820 G1 X191.491 Y122.792 E1.06057
N7821 G1 X191.491 Y197.148 E2.39103
N7822 ; COOLING_NODE: 0
N7823 M204 S10000
N7824 G1 X191.898 Y197.615 F60000
N7825 G1 F8475
N7826 M204 S8000
N7827 G1 X158.102 Y197.615 E1.08675
N7828 G1 X158.102 Y122.385 E2.41914
N7829 G1 X191.898 Y122.385 E1.08675
N7830 G1 X191.898 Y197.555 E2.41721
N7831 ; COOLING_NODE: 0
N7832 M204 S10000
N7833 G1 X192.29 Y198.007 F60000
N7834 ; FEATURE: Outer wall
N7835 ; LINE_WIDTH: 0.42
N7836 G1 F9149.261
N7837 M204 S5000
N7838 G1 X157.71 Y198.007 E1.03002
N7839 G1 X157.71 Y121.993 E2.26421
N7840 G1 X192.29 Y121.993 E1.03002
N7841 G1 X192.29 Y197.947 E2.26243
N7842 G1 E-.8 F1800
N7843 M204 S10000
N7844 G1 X188.78 Y196.453 Z5 F60000
N7845 G1 Z4.6
N7846 G1 E.8 F1800
N7847 ; FEATURE: Sparse infill
N7848 ; LINE_WIDTH: 0.45
N7849 G1 F8475
N7850 M204 S8000
N7851 G1 X187.151 Y196.453 E.05236
N7852 G1 X190.736 Y183.077 E.4453
N7853 G1 X190.736 Y182.649 E.01374
N7854 G1 X159.264 Y151.178 E1.43118
N7855 G1 X159.264 Y150.726 E.01454
N7856 G1 X190.736 Y142.294 E1.0477
N7857 G1 X190.736 Y148.108 E.18696
N7858 G1 X166.175 Y123.547 E1.11691
N7859 G1 X166.328 Y123.547 E.00491
N7860 G1 X159.264 Y125.44 E.23514
N7861 G1 X159.264 Y128.15 E.08717
N7862 G1 X190.736 Y159.622 E1.43118
N7863 G1 X190.736 Y159.151 E.01513
N7864 G1 X159.264 Y167.584 E1.0477
N7865 G1 X159.264 Y169.212 E.05236
N7866 M204 S10000
N7867 G1 X159.264 Y174.206 F60000
N7868 G1 F8475
N7869 M204 S8000
N7870 G1 X181.511 Y196.453 E1.01168
N7871 G1 X178.723 Y196.453 E.08966
N7872 G1 X190.736 Y151.62 E1.49251
N7873 G1 X190.736 Y150.722 E.02887
N7874 G1 X159.264 Y159.155 E1.0477
N7875 G1 X159.264 Y162.692 E.11375
N7876 G1 X190.736 Y194.163 E1.43118
N7877 G1 X190.736 Y192.866 E.04171
N7878 G1 X177.35 Y196.453 E.4456
N7879 G1 X175.722 Y196.453 E.05236
N7880 M204 S10000
N7881 G1 X171.343 Y123.547 F60000
N7882 G1 F8475
N7883 M204 S8000
N7884 G1 X172.971 Y123.547 E.05236
N7885 G1 X159.264 Y174.702 E1.70297
N7886 G1 X159.264 Y176.013 E.04215
N7887 G1 X190.736 Y167.58 E1.0477
N7888 G1 X190.736 Y171.136 E.11434
N7889 G1 X159.264 Y139.664 E1.43118
N7890 G1 X159.264 Y133.869 E.18637
N7891 G1 X190.736 Y125.436 E1.0477
N7892 G1 X190.736 Y125.08 E.01145
N7893 G1 X189.203 Y123.547 E.06969
N7894 G1 X189.829 Y123.547 E.02013
N7895 G1 X170.294 Y196.453 E2.42708
N7896 G1 X169.997 Y196.453 E.00955
N7897 G1 X159.264 Y185.72 E.48807
N7898 G1 X159.264 Y184.441 E.04112
N7899 M73 P62 R14
N7900 G1 X190.736 Y176.009 E1.0477
N7901 G1 X190.736 Y177.637 E.05236
N7902 M204 S10000
N7903 G1 X190.736 Y186.066 F60000
N7904 G1 F8475
N7905 M204 S8000
N7906 G1 X190.736 Y184.437 E.05236
N7907 G1 X159.264 Y192.87 E1.0477
N7908 G1 X159.264 Y196.453 E.11521
N7909 G1 X161.865 Y196.453 E.08363
N7910 G1 X181.4 Y123.547 E2.42708
N7911 G1 X177.689 Y123.547 E.11933
N7912 G1 X190.736 Y136.594 E.5933
N7913 G1 X190.736 Y133.865 E.08775
N7914 G1 X159.264 Y142.297 E1.04769
N7915 M204 S10000
N7916 G1 X159.264 Y144.873 F60000
N7917 G1 F8475
N7918 M204 S8000
N7919 G1 X159.264 Y143.245 E.05236
N7920 G1 X164.542 Y123.547 E.65576
N7921 G1 X162.914 Y123.547 E.05236
N7922 ; WIPE_START
N7923 G1 X164.542 Y123.547 E-.61876
N7924 G1 X164.446 Y123.906 E-.14124
N7925 ; WIPE_END
N7926 G1 E-.04 F1800
N7927 M204 S10000
N7928 G17
N7929 G3 Z5 I1.217 J0 P1  F60000
N7930 ; stop printing object, unique label id: 130
N7931 M625
N7932 ; object ids of layer 23 start: 130
N7933 M624 AQAAAAAAAAA=
N7934 ;======== H2D 20250527========
N7935 ; SKIPPABLE_START
N7936 ; SKIPTYPE: timelapse
N7937 M622.1 S1 ; for prev firware, default turned on
N7938 
N7939 M1002 judge_flag timelapse_record_flag
N7940 
N7941 M622 J1
N7942 M993 A2 B2 C2
N7943 M993 A0 B0 C0
N7944 
N7945 
N7946 
N7947 
N7948     M9711 M0 E1 X260 Y137 Z5 S11 C10 O0 T3000
N7949 
N7950 
N7951 
N7952 M993 A3 B3 C3
N7953 
N7954 M623
N7955 ; SKIPPABLE_END
N7956 
N7957 ; object ids of this layer23 end: 130
N7958 M625
N7959 ; CHANGE_LAYER
N7960 ; Z_HEIGHT: 4.8
N7961 ; LAYER_HEIGHT: 0.2
N7962 ;======== H2D 20250521========
N7963 ; layer num/total_layer_count: 24/63
N7964 ; update layer progress
N7965 M73 L24
N7966 M991 S0 P23 ;notify layer change
N7967 
N7968 
N7969 ; OBJECT_ID: 130
N7970 ; COOLING_NODE: 0
N7971 ; start printing object, unique label id: 130
N7972 M624 AQAAAAAAAAA=
N7973 G1 X191.084 Y196.801 F60000
N7974 G1 Z4.8
N7975 G1 E.8 F1800
N7976 ; FEATURE: Inner wall
N7977 ; LINE_WIDTH: 0.45
N7978 ; LAYER_HEIGHT: 0.2
N7979 G1 F8475
N7980 M204 S8000
N7981 G1 X158.916 Y196.801 E1.03439
N7982 G1 X158.916 Y123.199 E2.36678
N7983 G1 X191.084 Y123.199 E1.03439
N7984 G1 X191.084 Y196.741 E2.36485
N7985 ; COOLING_NODE: 0
N7986 M204 S10000
N7987 G1 X191.491 Y197.208 F60000
N7988 G1 F8475
N7989 M204 S8000
N7990 G1 X158.509 Y197.208 E1.06057
N7991 G1 X158.509 Y122.792 E2.39296
N7992 G1 X191.491 Y122.792 E1.06057
N7993 G1 X191.491 Y197.148 E2.39103
N7994 ; COOLING_NODE: 0
N7995 M204 S10000
N7996 G1 X191.898 Y197.615 F60000
N7997 G1 F8475
N7998 M204 S8000
N7999 G1 X158.102 Y197.615 E1.08675
N8000 G1 X158.102 Y122.385 E2.41914
N8001 G1 X191.898 Y122.385 E1.08675
N8002 G1 X191.898 Y197.555 E2.41721
N8003 ; COOLING_NODE: 0
N8004 M204 S10000
N8005 G1 X192.29 Y198.007 F60000
N8006 ; FEATURE: Outer wall
N8007 ; LINE_WIDTH: 0.42
N8008 G1 F9149.261
N8009 M204 S5000
N8010 G1 X157.71 Y198.007 E1.03002
N8011 G1 X157.71 Y121.993 E2.26421
N8012 G1 X192.29 Y121.993 E1.03002
N8013 G1 X192.29 Y197.947 E2.26243
N8014 G1 E-.8 F1800
N8015 M204 S10000
N8016 G1 X191.288 Y190.381 Z5.2 F60000
N8017 G1 X190.736 Y186.212 Z5.2
N8018 G1 Z4.8
N8019 G1 E.8 F1800
N8020 ; FEATURE: Sparse infill
N8021 ; LINE_WIDTH: 0.45
N8022 G1 F8475
N8023 M204 S8000
N8024 G1 X190.736 Y184.584 E.05236
N8025 G1 X159.264 Y193.017 E1.0477
N8026 G1 X159.264 Y196.453 E.1105
N8027 G1 X161.719 Y196.453 E.07892
N8028 G1 X181.254 Y123.547 E2.42708
N8029 G1 X177.889 Y123.547 E.10819
N8030 G1 X190.736 Y136.394 E.58421
N8031 G1 X190.736 Y134.011 E.07661
N8032 G1 X159.264 Y142.444 E1.0477
N8033 G1 X159.264 Y142.699 E.00819
N8034 G1 X164.396 Y123.547 E.63757
N8035 G1 X162.768 Y123.547 E.05236
N8036 M204 S10000
N8037 G1 X166.375 Y123.547 F60000
N8038 G1 F8475
N8039 M204 S8000
N8040 G1 X190.736 Y147.908 E1.10782
N8041 G1 X190.736 Y142.44 E.17582
N8042 G1 X159.264 Y150.873 E1.0477
N8043 G1 X159.264 Y150.978 E.0034
N8044 G1 X190.736 Y182.449 E1.43118
N8045 G1 X190.736 Y182.53 E.0026
N8046 G1 X187.005 Y196.453 E.46349
N8047 G1 X181.711 Y196.453 E.17024
N8048 G1 X159.264 Y174.006 E1.02078
N8049 G1 X159.264 Y174.155 E.00479
N8050 G1 X172.825 Y123.547 E1.68478
N8051 G1 X166.874 Y123.547 E.19135
N8052 G1 X159.264 Y125.586 E.25333
N8053 G1 X159.264 Y127.95 E.07603
N8054 G1 X190.736 Y159.422 E1.43118
N8055 G1 X190.736 Y159.298 E.00399
N8056 G1 X159.264 Y167.73 E1.0477
N8057 G1 X159.264 Y166.102 E.05236
N8058 M204 S10000
N8059 G1 X159.264 Y177.787 F60000
N8060 G1 F8475
N8061 M204 S8000
N8062 G1 X159.264 Y176.159 E.05236
N8063 G1 X190.736 Y167.726 E1.0477
N8064 G1 X190.736 Y170.936 E.1032
N8065 G1 X159.264 Y139.464 E1.43118
N8066 G1 X159.264 Y134.015 E.17524
N8067 G1 X190.736 Y125.582 E1.0477
N8068 G1 X190.736 Y124.88 E.02259
N8069 G1 X189.403 Y123.547 E.0606
N8070 G1 X189.682 Y123.547 E.00899
N8071 G1 X170.147 Y196.453 E2.42708
N8072 G1 X170.197 Y196.453 E.00159
N8073 G1 X159.264 Y185.52 E.49717
N8074 G1 X159.264 Y184.588 E.02999
N8075 G1 X190.736 Y176.155 E1.0477
N8076 G1 X190.736 Y177.783 E.05236
N8077 M204 S10000
N8078 G1 X178.576 Y196.453 F60000
N8079 G1 F8475
N8080 M204 S8000
N8081 M73 P62 R13
N8082 G1 X190.736 Y151.074 E1.5107
N8083 G1 X190.736 Y150.869 E.00659
N8084 G1 X159.264 Y159.301 E1.0477
N8085 G1 X159.264 Y162.492 E.10261
N8086 G1 X190.736 Y193.963 E1.43118
N8087 G1 X190.736 Y193.013 E.03057
N8088 G1 X177.897 Y196.453 E.42741
N8089 G1 X176.269 Y196.453 E.05236
N8090 ; WIPE_START
N8091 G1 X177.897 Y196.453 E-.61876
N8092 G1 X178.256 Y196.357 E-.14124
N8093 ; WIPE_END
N8094 G1 E-.04 F1800
N8095 M204 S10000
N8096 G17
N8097 G3 Z5.2 I1.217 J0 P1  F60000
N8098 ; stop printing object, unique label id: 130
N8099 M625
N8100 ; object ids of layer 24 start: 130
N8101 M624 AQAAAAAAAAA=
N8102 ;======== H2D 20250527========
N8103 ; SKIPPABLE_START
N8104 ; SKIPTYPE: timelapse
N8105 M622.1 S1 ; for prev firware, default turned on
N8106 
N8107 M1002 judge_flag timelapse_record_flag
N8108 
N8109 M622 J1
N8110 M993 A2 B2 C2
N8111 M993 A0 B0 C0
N8112 
N8113 
N8114 
N8115 
N8116     M9711 M0 E1 X260 Y137 Z5.2 S11 C10 O0 T3000
N8117 
N8118 
N8119 
N8120 M993 A3 B3 C3
N8121 
N8122 M623
N8123 ; SKIPPABLE_END
N8124 
N8125 ; object ids of this layer24 end: 130
N8126 M625
N8127 ; CHANGE_LAYER
N8128 ; Z_HEIGHT: 5
N8129 ; LAYER_HEIGHT: 0.2
N8130 ;======== H2D 20250521========
N8131 ; layer num/total_layer_count: 25/63
N8132 ; update layer progress
N8133 M73 L25
N8134 M991 S0 P24 ;notify layer change
N8135 
N8136 
N8137 ; OBJECT_ID: 130
N8138 ; COOLING_NODE: 0
N8139 ; start printing object, unique label id: 130
N8140 M624 AQAAAAAAAAA=
N8141 G1 X191.084 Y196.801 F60000
N8142 G1 Z5
N8143 G1 E.8 F1800
N8144 ; FEATURE: Inner wall
N8145 ; LINE_WIDTH: 0.45
N8146 ; LAYER_HEIGHT: 0.2
N8147 G1 F8475
N8148 M204 S8000
N8149 G1 X158.916 Y196.801 E1.03439
N8150 G1 X158.916 Y123.199 E2.36678
N8151 G1 X191.084 Y123.199 E1.03439
N8152 G1 X191.084 Y196.741 E2.36485
N8153 ; COOLING_NODE: 0
N8154 M204 S10000
N8155 G1 X191.491 Y197.208 F60000
N8156 G1 F8475
N8157 M204 S8000
N8158 G1 X158.509 Y197.208 E1.06057
N8159 G1 X158.509 Y122.792 E2.39296
N8160 G1 X191.491 Y122.792 E1.06057
N8161 G1 X191.491 Y197.148 E2.39103
N8162 ; COOLING_NODE: 0
N8163 M204 S10000
N8164 G1 X191.898 Y197.615 F60000
N8165 G1 F8475
N8166 M204 S8000
N8167 G1 X158.102 Y197.615 E1.08675
N8168 G1 X158.102 Y122.385 E2.41914
N8169 G1 X191.898 Y122.385 E1.08675
N8170 G1 X191.898 Y197.555 E2.41721
N8171 ; COOLING_NODE: 0
N8172 M204 S10000
N8173 G1 X192.29 Y198.007 F60000
N8174 ; FEATURE: Outer wall
N8175 ; LINE_WIDTH: 0.42
N8176 G1 F9149.261
N8177 M204 S5000
N8178 G1 X157.71 Y198.007 E1.03002
N8179 G1 X157.71 Y121.993 E2.26421
N8180 G1 X192.29 Y121.993 E1.03002
N8181 G1 X192.29 Y197.947 E2.26243
N8182 G1 E-.8 F1800
N8183 M204 S10000
N8184 G1 X191.275 Y190.383 Z5.4 F60000
N8185 M73 P63 R13
N8186 G1 X190.736 Y186.359 Z5.4
N8187 G1 Z5
N8188 G1 E.8 F1800
N8189 ; FEATURE: Sparse infill
N8190 ; LINE_WIDTH: 0.45
N8191 G1 F8475
N8192 M204 S8000
N8193 G1 X190.736 Y184.73 E.05236
N8194 G1 X159.264 Y193.163 E1.0477
N8195 G1 X159.264 Y196.453 E.10579
N8196 G1 X161.572 Y196.453 E.07421
N8197 G1 X181.107 Y123.547 E2.42708
N8198 G1 X178.089 Y123.547 E.09706
N8199 G1 X190.736 Y136.194 E.57511
N8200 G1 X190.736 Y134.158 E.06548
N8201 G1 X159.264 Y142.59 E1.0477
N8202 G1 X159.264 Y142.152 E.01408
N8203 G1 X164.25 Y123.547 E.61938
N8204 G1 X162.621 Y123.547 E.05236
N8205 M204 S10000
N8206 G1 X166.575 Y123.547 F60000
N8207 G1 F8475
N8208 M204 S8000
N8209 G1 X190.736 Y147.708 E1.09872
N8210 G1 X190.736 Y150.527 E.09067
N8211 G1 X178.43 Y196.453 E1.52889
N8212 G1 X190.736 Y193.159 E.40964
N8213 G1 X190.736 Y193.763 E.01943
N8214 G1 X159.264 Y162.292 E1.43118
N8215 G1 X159.264 Y159.448 E.09147
N8216 G1 X190.736 Y151.015 E1.0477
N8217 M204 S10000
N8218 G1 X190.736 Y140.958 F60000
N8219 G1 F8475
N8220 M204 S8000
N8221 G1 X190.736 Y142.586 E.05236
N8222 G1 X159.264 Y151.019 E1.0477
N8223 G1 X159.264 Y150.778 E.00774
N8224 G1 X190.736 Y182.249 E1.43118
N8225 G1 X190.736 Y181.984 E.00854
N8226 G1 X186.859 Y196.453 E.48168
N8227 G1 X181.911 Y196.453 E.1591
N8228 G1 X159.264 Y173.806 E1.02987
N8229 G1 X159.264 Y173.609 E.00635
N8230 G1 X172.678 Y123.547 E1.66659
N8231 G1 X167.421 Y123.547 E.16908
N8232 G1 X159.264 Y125.733 E.27152
N8233 G1 X159.264 Y127.75 E.06489
N8234 G1 X190.736 Y159.222 E1.43118
N8235 G1 X190.736 Y159.444 E.00715
N8236 G1 X159.264 Y167.877 E1.04769
N8237 G1 X159.264 Y166.248 E.05236
N8238 M204 S10000
N8239 G1 X159.264 Y177.934 F60000
N8240 G1 F8475
N8241 M204 S8000
N8242 G1 X159.264 Y176.305 E.05236
N8243 G1 X190.736 Y167.873 E1.0477
N8244 G1 X190.736 Y170.736 E.09206
N8245 G1 X159.264 Y139.264 E1.43118
N8246 G1 X159.264 Y134.161 E.1641
N8247 G1 X190.736 Y125.729 E1.0477
N8248 G1 X190.736 Y124.68 E.03373
N8249 G1 X189.603 Y123.547 E.0515
N8250 G1 X189.536 Y123.547 E.00215
N8251 G1 X170.001 Y196.453 E2.42708
N8252 G1 X170.397 Y196.453 E.01273
N8253 G1 X159.264 Y185.32 E.50626
N8254 G1 X159.264 Y184.734 E.01885
N8255 G1 X190.736 Y176.301 E1.0477
N8256 G1 X190.736 Y177.93 E.05236
N8257 ; WIPE_START
N8258 G1 X190.736 Y176.301 E-.61876
N8259 G1 X190.377 Y176.398 E-.14124
N8260 ; WIPE_END
N8261 G1 E-.04 F1800
N8262 M204 S10000
N8263 G17
N8264 G3 Z5.4 I1.217 J0 P1  F60000
N8265 ; stop printing object, unique label id: 130
N8266 M625
N8267 ; object ids of layer 25 start: 130
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
N8283     M9711 M0 E1 X260 Y137 Z5.4 S11 C10 O0 T3000
N8284 
N8285 
N8286 
N8287 M993 A3 B3 C3
N8288 
N8289 M623
N8290 ; SKIPPABLE_END
N8291 
N8292 ; object ids of this layer25 end: 130
N8293 M625
N8294 ; CHANGE_LAYER
N8295 ; Z_HEIGHT: 5.2
N8296 ; LAYER_HEIGHT: 0.2
N8297 ;======== H2D 20250521========
N8298 ; layer num/total_layer_count: 26/63
N8299 ; update layer progress
N8300 M73 L26
N8301 M991 S0 P25 ;notify layer change
N8302 
N8303 
N8304 ; OBJECT_ID: 130
N8305 ; COOLING_NODE: 0
N8306 ; start printing object, unique label id: 130
N8307 M624 AQAAAAAAAAA=
N8308 G1 X191.084 Y196.801 F60000
N8309 G1 Z5.2
N8310 G1 E.8 F1800
N8311 ; FEATURE: Inner wall
N8312 ; LINE_WIDTH: 0.45
N8313 ; LAYER_HEIGHT: 0.2
N8314 G1 F8475
N8315 M204 S8000
N8316 G1 X158.916 Y196.801 E1.03439
N8317 G1 X158.916 Y123.199 E2.36678
N8318 G1 X191.084 Y123.199 E1.03439
N8319 G1 X191.084 Y196.741 E2.36485
N8320 ; COOLING_NODE: 0
N8321 M204 S10000
N8322 G1 X191.491 Y197.208 F60000
N8323 G1 F8475
N8324 M204 S8000
N8325 G1 X158.509 Y197.208 E1.06057
N8326 G1 X158.509 Y122.792 E2.39296
N8327 G1 X191.491 Y122.792 E1.06057
N8328 G1 X191.491 Y197.148 E2.39103
N8329 ; COOLING_NODE: 0
N8330 M204 S10000
N8331 G1 X191.898 Y197.615 F60000
N8332 G1 F8475
N8333 M204 S8000
N8334 G1 X158.102 Y197.615 E1.08675
N8335 G1 X158.102 Y122.385 E2.41914
N8336 G1 X191.898 Y122.385 E1.08675
N8337 G1 X191.898 Y197.555 E2.41721
N8338 ; COOLING_NODE: 0
N8339 M204 S10000
N8340 G1 X192.29 Y198.007 F60000
N8341 ; FEATURE: Outer wall
N8342 ; LINE_WIDTH: 0.42
N8343 G1 F9149.261
N8344 M204 S5000
N8345 G1 X157.71 Y198.007 E1.03002
N8346 G1 X157.71 Y121.993 E2.26421
N8347 G1 X192.29 Y121.993 E1.03002
N8348 G1 X192.29 Y197.947 E2.26243
N8349 G1 E-.8 F1800
N8350 M204 S10000
N8351 G1 X191.263 Y190.384 Z5.6 F60000
N8352 G1 X190.736 Y186.505 Z5.6
N8353 G1 Z5.2
N8354 G1 E.8 F1800
N8355 ; FEATURE: Sparse infill
N8356 ; LINE_WIDTH: 0.45
N8357 G1 F8475
N8358 M204 S8000
N8359 G1 X190.736 Y184.877 E.05236
N8360 G1 X159.264 Y193.309 E1.04769
N8361 G1 X159.264 Y196.453 E.10108
N8362 G1 X161.426 Y196.453 E.0695
N8363 G1 X180.961 Y123.547 E2.42708
N8364 G1 X178.289 Y123.547 E.08592
N8365 G1 X190.736 Y135.994 E.56602
N8366 G1 X190.736 Y134.304 E.05434
N8367 G1 X159.264 Y142.737 E1.0477
N8368 G1 X159.264 Y141.606 E.03636
N8369 G1 X164.103 Y123.547 E.60118
N8370 G1 X162.475 Y123.547 E.05236
N8371 M204 S10000
N8372 G1 X166.775 Y123.547 F60000
N8373 G1 F8475
N8374 M204 S8000
N8375 G1 X190.736 Y147.508 E1.08963
N8376 G1 X190.736 Y149.981 E.07953
N8377 G1 X178.283 Y196.453 E1.54708
N8378 G1 X178.99 Y196.453 E.02271
N8379 G1 X190.736 Y193.305 E.39103
N8380 G1 X190.736 Y193.563 E.00829
N8381 G1 X159.264 Y162.092 E1.43118
N8382 G1 X159.264 Y159.594 E.08033
N8383 G1 X190.736 Y151.162 E1.0477
N8384 M204 S10000
N8385 G1 X190.736 Y141.104 F60000
N8386 G1 F8475
N8387 M204 S8000
N8388 G1 X190.736 Y142.733 E.05236
N8389 G1 X159.264 Y151.165 E1.04769
N8390 G1 X159.264 Y150.578 E.01888
N8391 G1 X190.736 Y182.049 E1.43118
N8392 M204 S10000
N8393 G1 X159.264 Y178.08 F60000
N8394 G1 F8475
N8395 M204 S8000
N8396 G1 X159.264 Y176.452 E.05236
N8397 G1 X190.736 Y168.019 E1.0477
N8398 G1 X190.736 Y170.536 E.08092
N8399 G1 X159.264 Y139.064 E1.43118
N8400 G1 X159.264 Y134.308 E.15296
N8401 G1 X190.736 Y125.875 E1.0477
N8402 G1 X190.736 Y124.48 E.04487
N8403 G1 X189.803 Y123.547 E.04241
N8404 G1 X189.39 Y123.547 E.01329
N8405 G1 X169.855 Y196.453 E2.42708
N8406 G1 X170.597 Y196.453 E.02387
N8407 G1 X159.264 Y185.12 E.51536
N8408 G1 X159.264 Y184.881 E.00771
N8409 G1 X190.736 Y176.448 E1.0477
N8410 G1 X190.736 Y181.438 E.16045
N8411 G1 X186.712 Y196.453 E.49987
N8412 G1 X182.111 Y196.453 E.14796
N8413 G1 X159.264 Y173.606 E1.03897
N8414 G1 X159.264 Y173.062 E.01749
N8415 G1 X172.532 Y123.547 E1.6484
N8416 G1 X167.967 Y123.547 E.1468
N8417 G1 X159.264 Y125.879 E.28971
N8418 G1 X159.264 Y127.551 E.05375
N8419 G1 X190.736 Y159.022 E1.43118
N8420 G1 X190.736 Y159.59 E.01829
N8421 G1 X159.264 Y168.023 E1.0477
N8422 G1 X159.264 Y166.395 E.05236
N8423 ; WIPE_START
N8424 G1 X159.264 Y168.023 E-.61876
N8425 G1 X159.623 Y167.927 E-.14124
N8426 ; WIPE_END
N8427 G1 E-.04 F1800
N8428 M204 S10000
N8429 G17
N8430 G3 Z5.6 I1.217 J0 P1  F60000
N8431 ; stop printing object, unique label id: 130
N8432 M625
N8433 ; object ids of layer 26 start: 130
N8434 M624 AQAAAAAAAAA=
N8435 ;======== H2D 20250527========
N8436 ; SKIPPABLE_START
N8437 ; SKIPTYPE: timelapse
N8438 M622.1 S1 ; for prev firware, default turned on
N8439 
N8440 M1002 judge_flag timelapse_record_flag
N8441 
N8442 M622 J1
N8443 M993 A2 B2 C2
N8444 M993 A0 B0 C0
N8445 
N8446 
N8447 
N8448 
N8449     M9711 M0 E1 X260 Y137 Z5.6 S11 C10 O0 T3000
N8450 
N8451 
N8452 
N8453 M993 A3 B3 C3
N8454 
N8455 M623
N8456 ; SKIPPABLE_END
N8457 
N8458 ; object ids of this layer26 end: 130
N8459 M625
N8460 ; CHANGE_LAYER
N8461 ; Z_HEIGHT: 5.4
N8462 ; LAYER_HEIGHT: 0.2
N8463 ;======== H2D 20250521========
N8464 ; layer num/total_layer_count: 27/63
N8465 ; update layer progress
N8466 M73 L27
N8467 M991 S0 P26 ;notify layer change
N8468 
N8469 
N8470 ; OBJECT_ID: 130
N8471 ; COOLING_NODE: 0
N8472 ; start printing object, unique label id: 130
N8473 M624 AQAAAAAAAAA=
N8474 G1 X191.084 Y196.801 F60000
N8475 G1 Z5.4
N8476 G1 E.8 F1800
N8477 ; FEATURE: Inner wall
N8478 ; LINE_WIDTH: 0.45
N8479 ; LAYER_HEIGHT: 0.2
N8480 G1 F8475
N8481 M204 S8000
N8482 G1 X158.916 Y196.801 E1.03439
N8483 G1 X158.916 Y123.199 E2.36678
N8484 G1 X191.084 Y123.199 E1.03439
N8485 G1 X191.084 Y196.741 E2.36485
N8486 ; COOLING_NODE: 0
N8487 M204 S10000
N8488 M73 P64 R13
N8489 G1 X191.491 Y197.208 F60000
N8490 G1 F8475
N8491 M204 S8000
N8492 G1 X158.509 Y197.208 E1.06057
N8493 G1 X158.509 Y122.792 E2.39296
N8494 G1 X191.491 Y122.792 E1.06057
N8495 G1 X191.491 Y197.148 E2.39103
N8496 ; COOLING_NODE: 0
N8497 M204 S10000
N8498 G1 X191.898 Y197.615 F60000
N8499 G1 F8475
N8500 M204 S8000
N8501 G1 X158.102 Y197.615 E1.08675
N8502 G1 X158.102 Y122.385 E2.41914
N8503 G1 X191.898 Y122.385 E1.08675
N8504 G1 X191.898 Y197.555 E2.41721
N8505 ; COOLING_NODE: 0
N8506 M204 S10000
N8507 G1 X192.29 Y198.007 F60000
N8508 ; FEATURE: Outer wall
N8509 ; LINE_WIDTH: 0.42
N8510 G1 F9149.261
N8511 M204 S5000
N8512 G1 X157.71 Y198.007 E1.03002
N8513 G1 X157.71 Y121.993 E2.26421
N8514 G1 X192.29 Y121.993 E1.03002
N8515 G1 X192.29 Y197.947 E2.26243
N8516 G1 E-.8 F1800
N8517 M204 S10000
N8518 G1 X191.249 Y190.386 Z5.8 F60000
N8519 G1 X190.736 Y186.651 Z5.8
N8520 G1 Z5.4
N8521 G1 E.8 F1800
N8522 ; FEATURE: Sparse infill
N8523 ; LINE_WIDTH: 0.45
N8524 G1 F8475
N8525 M204 S8000
N8526 G1 X190.736 Y185.023 E.05236
N8527 G1 X159.264 Y193.456 E1.0477
N8528 G1 X159.264 Y196.453 E.09637
N8529 G1 X161.279 Y196.453 E.06479
N8530 G1 X180.814 Y123.547 E2.42708
N8531 G1 X178.489 Y123.547 E.07478
N8532 G1 X190.736 Y135.794 E.55692
N8533 G1 X190.736 Y134.45 E.0432
N8534 G1 X159.264 Y142.883 E1.0477
N8535 G1 X159.264 Y141.059 E.05864
N8536 G1 X163.957 Y123.547 E.58299
N8537 G1 X166.975 Y123.547 E.09705
N8538 G1 X190.736 Y147.308 E1.08053
N8539 G1 X190.736 Y149.434 E.06839
N8540 G1 X178.137 Y196.453 E1.56527
N8541 G1 X179.536 Y196.453 E.04499
N8542 G1 X190.736 Y193.452 E.37284
N8543 G1 X190.736 Y193.363 E.00284
N8544 G1 X159.264 Y161.892 E1.43118
N8545 G1 X159.264 Y159.741 E.06919
N8546 G1 X190.736 Y151.308 E1.0477
N8547 G1 X190.736 Y152.936 E.05236
N8548 M204 S10000
N8549 G1 X190.736 Y141.251 F60000
N8550 G1 F8475
N8551 M204 S8000
N8552 G1 X190.736 Y142.879 E.05236
N8553 G1 X159.264 Y151.312 E1.0477
N8554 G1 X159.264 Y150.378 E.03001
N8555 G1 X190.736 Y181.849 E1.43118
N8556 M204 S10000
N8557 G1 X159.264 Y178.226 F60000
N8558 G1 F8475
N8559 M204 S8000
N8560 G1 X159.264 Y176.598 E.05236
N8561 G1 X190.736 Y168.166 E1.0477
N8562 G1 X190.736 Y170.336 E.06978
N8563 G1 X159.264 Y138.864 E1.43118
N8564 G1 X159.264 Y134.454 E.14182
N8565 G1 X190.736 Y126.022 E1.0477
N8566 G1 X190.736 Y124.28 E.05601
N8567 G1 X190.003 Y123.547 E.03331
N8568 G1 X189.243 Y123.547 E.02443
N8569 G1 X169.708 Y196.453 E2.42708
N8570 G1 X170.797 Y196.453 E.03501
N8571 G1 X159.264 Y184.92 E.52445
N8572 G1 X159.264 Y185.027 E.00343
N8573 G1 X190.736 Y176.594 E1.0477
N8574 G1 X190.736 Y180.891 E.13817
N8575 G1 X186.566 Y196.453 E.51806
N8576 G1 X182.311 Y196.453 E.13682
N8577 G1 X159.264 Y173.406 E1.04806
N8578 G1 X159.264 Y172.516 E.02863
N8579 G1 X172.386 Y123.547 E1.63021
N8580 G1 X168.513 Y123.547 E.12452
N8581 G1 X159.264 Y126.025 E.3079
N8582 G1 X159.264 Y127.351 E.04261
N8583 G1 X190.736 Y158.822 E1.43118
N8584 G1 X190.736 Y159.737 E.02943
N8585 G1 X159.264 Y168.169 E1.0477
N8586 G1 X159.264 Y166.541 E.05236
N8587 ; WIPE_START
N8588 G1 X159.264 Y168.169 E-.61876
N8589 G1 X159.623 Y168.073 E-.14124
N8590 ; WIPE_END
N8591 G1 E-.04 F1800
N8592 M204 S10000
N8593 G17
N8594 G3 Z5.8 I1.217 J0 P1  F60000
N8595 ; stop printing object, unique label id: 130
N8596 M625
N8597 ; object ids of layer 27 start: 130
N8598 M624 AQAAAAAAAAA=
N8599 ;======== H2D 20250527========
N8600 ; SKIPPABLE_START
N8601 ; SKIPTYPE: timelapse
N8602 M622.1 S1 ; for prev firware, default turned on
N8603 
N8604 M1002 judge_flag timelapse_record_flag
N8605 
N8606 M622 J1
N8607 M993 A2 B2 C2
N8608 M993 A0 B0 C0
N8609 
N8610 
N8611 
N8612 
N8613     M9711 M0 E1 X260 Y137 Z5.8 S11 C10 O0 T3000
N8614 
N8615 
N8616 
N8617 M993 A3 B3 C3
N8618 
N8619 M623
N8620 ; SKIPPABLE_END
N8621 
N8622 ; object ids of this layer27 end: 130
N8623 M625
N8624 ; CHANGE_LAYER
N8625 ; Z_HEIGHT: 5.6
N8626 ; LAYER_HEIGHT: 0.2
N8627 ;======== H2D 20250521========
N8628 ; layer num/total_layer_count: 28/63
N8629 ; update layer progress
N8630 M73 L28
N8631 M991 S0 P27 ;notify layer change
N8632 
N8633 
N8634 ; OBJECT_ID: 130
N8635 ; COOLING_NODE: 0
N8636 ; start printing object, unique label id: 130
N8637 M624 AQAAAAAAAAA=
N8638 G1 X191.084 Y196.801 F60000
N8639 G1 Z5.6
N8640 G1 E.8 F1800
N8641 ; FEATURE: Inner wall
N8642 ; LINE_WIDTH: 0.45
N8643 ; LAYER_HEIGHT: 0.2
N8644 G1 F8475
N8645 M204 S8000
N8646 G1 X158.916 Y196.801 E1.03439
N8647 G1 X158.916 Y123.199 E2.36678
N8648 G1 X191.084 Y123.199 E1.03439
N8649 G1 X191.084 Y196.741 E2.36485
N8650 ; COOLING_NODE: 0
N8651 M204 S10000
N8652 G1 X191.491 Y197.208 F60000
N8653 G1 F8475
N8654 M204 S8000
N8655 G1 X158.509 Y197.208 E1.06057
N8656 G1 X158.509 Y122.792 E2.39296
N8657 G1 X191.491 Y122.792 E1.06057
N8658 G1 X191.491 Y197.148 E2.39103
N8659 ; COOLING_NODE: 0
N8660 M204 S10000
N8661 G1 X191.898 Y197.615 F60000
N8662 G1 F8475
N8663 M204 S8000
N8664 G1 X158.102 Y197.615 E1.08675
N8665 G1 X158.102 Y122.385 E2.41914
N8666 G1 X191.898 Y122.385 E1.08675
N8667 G1 X191.898 Y197.555 E2.41721
N8668 ; COOLING_NODE: 0
N8669 M204 S10000
N8670 G1 X192.29 Y198.007 F60000
N8671 ; FEATURE: Outer wall
N8672 ; LINE_WIDTH: 0.42
N8673 G1 F9149.261
N8674 M204 S5000
N8675 G1 X157.71 Y198.007 E1.03002
N8676 G1 X157.71 Y121.993 E2.26421
N8677 G1 X192.29 Y121.993 E1.03002
N8678 G1 X192.29 Y197.947 E2.26243
N8679 G1 E-.8 F1800
N8680 M204 S10000
N8681 G1 X185.724 Y194.056 Z6 F60000
N8682 G1 X159.264 Y178.373 Z6
N8683 G1 Z5.6
N8684 G1 E.8 F1800
N8685 ; FEATURE: Sparse infill
N8686 ; LINE_WIDTH: 0.45
N8687 G1 F8475
N8688 M204 S8000
N8689 G1 X159.264 Y176.745 E.05236
N8690 G1 X190.736 Y168.312 E1.0477
N8691 G1 X190.736 Y170.136 E.05864
N8692 G1 X159.264 Y138.664 E1.43118
N8693 G1 X159.264 Y134.601 E.13068
N8694 G1 X190.736 Y126.168 E1.0477
N8695 G1 X190.736 Y124.08 E.06715
N8696 G1 X190.203 Y123.547 E.02422
N8697 G1 X189.097 Y123.547 E.03557
N8698 G1 X169.562 Y196.453 E2.42708
N8699 G1 X170.997 Y196.453 E.04615
N8700 G1 X159.264 Y184.72 E.53355
N8701 G1 X159.264 Y185.173 E.01457
N8702 G1 X190.736 Y176.741 E1.0477
N8703 G1 X190.736 Y180.345 E.11589
N8704 G1 X186.419 Y196.453 E.53625
N8705 M73 P65 R13
N8706 G1 X182.511 Y196.453 E.12568
N8707 G1 X159.264 Y173.206 E1.05716
N8708 G1 X159.264 Y171.97 E.03977
N8709 G1 X172.239 Y123.547 E1.61202
N8710 G1 X169.06 Y123.547 E.10224
N8711 G1 X159.264 Y126.172 E.32609
N8712 G1 X159.264 Y127.151 E.03147
N8713 G1 X190.736 Y158.622 E1.43118
N8714 G1 X190.736 Y159.883 E.04057
N8715 G1 X159.264 Y168.316 E1.0477
N8716 G1 X159.264 Y166.687 E.05236
N8717 M204 S10000
N8718 G1 X190.736 Y153.083 F60000
N8719 G1 F8475
N8720 M204 S8000
N8721 G1 X190.736 Y151.454 E.05236
N8722 G1 X159.264 Y159.887 E1.0477
N8723 G1 X159.264 Y161.692 E.05805
N8724 G1 X190.736 Y193.163 E1.43118
N8725 G1 X190.736 Y193.598 E.01398
N8726 G1 X180.082 Y196.453 E.35465
N8727 G1 X177.991 Y196.453 E.06727
N8728 G1 X190.736 Y148.888 E1.58346
N8729 G1 X190.736 Y147.108 E.05725
N8730 G1 X167.175 Y123.547 E1.07144
N8731 G1 X163.81 Y123.547 E.10819
N8732 G1 X159.264 Y140.513 E.5648
N8733 G1 X159.264 Y143.029 E.08092
N8734 G1 X190.736 Y134.597 E1.0477
N8735 G1 X190.736 Y135.594 E.03206
N8736 G1 X178.689 Y123.547 E.54783
N8737 G1 X180.668 Y123.547 E.06364
N8738 G1 X161.133 Y196.453 E2.42708
N8739 G1 X159.483 Y196.453 E.05306
N8740 G1 X159.264 Y196.234 E.00994
N8741 G1 X159.264 Y193.602 E.08464
N8742 G1 X190.736 Y185.17 E1.0477
N8743 G1 X190.736 Y181.649 E.11319
N8744 G1 X159.264 Y150.178 E1.43118
N8745 G1 X159.264 Y151.458 E.04115
N8746 G1 X190.736 Y143.026 E1.0477
N8747 G1 X190.736 Y141.397 E.05236
N8748 ; WIPE_START
N8749 G1 X190.736 Y143.026 E-.61876
N8750 G1 X190.377 Y143.122 E-.14124
N8751 ; WIPE_END
N8752 G1 E-.04 F1800
N8753 M204 S10000
N8754 G17
N8755 G3 Z6 I1.217 J0 P1  F60000
N8756 ; stop printing object, unique label id: 130
N8757 M625
N8758 ; object ids of layer 28 start: 130
N8759 M624 AQAAAAAAAAA=
N8760 ;======== H2D 20250527========
N8761 ; SKIPPABLE_START
N8762 ; SKIPTYPE: timelapse
N8763 M622.1 S1 ; for prev firware, default turned on
N8764 
N8765 M1002 judge_flag timelapse_record_flag
N8766 
N8767 M622 J1
N8768 M993 A2 B2 C2
N8769 M993 A0 B0 C0
N8770 
N8771 
N8772 
N8773 
N8774     M9711 M0 E1 X260 Y137 Z6 S11 C10 O0 T3000
N8775 
N8776 
N8777 
N8778 M993 A3 B3 C3
N8779 
N8780 M623
N8781 ; SKIPPABLE_END
N8782 
N8783 ; object ids of this layer28 end: 130
N8784 M625
N8785 ; CHANGE_LAYER
N8786 ; Z_HEIGHT: 5.8
N8787 ; LAYER_HEIGHT: 0.2
N8788 ;======== H2D 20250521========
N8789 ; layer num/total_layer_count: 29/63
N8790 ; update layer progress
N8791 M73 L29
N8792 M991 S0 P28 ;notify layer change
N8793 
N8794 
N8795 ; OBJECT_ID: 130
N8796 ; COOLING_NODE: 0
N8797 ; start printing object, unique label id: 130
N8798 M624 AQAAAAAAAAA=
N8799 G1 X191.084 Y196.801 F60000
N8800 G1 Z5.8
N8801 G1 E.8 F1800
N8802 ; FEATURE: Inner wall
N8803 ; LINE_WIDTH: 0.45
N8804 ; LAYER_HEIGHT: 0.2
N8805 G1 F8475
N8806 M204 S8000
N8807 G1 X158.916 Y196.801 E1.03439
N8808 G1 X158.916 Y123.199 E2.36678
N8809 G1 X191.084 Y123.199 E1.03439
N8810 G1 X191.084 Y196.741 E2.36485
N8811 ; COOLING_NODE: 0
N8812 M204 S10000
N8813 G1 X191.491 Y197.208 F60000
N8814 G1 F8475
N8815 M204 S8000
N8816 G1 X158.509 Y197.208 E1.06057
N8817 G1 X158.509 Y122.792 E2.39296
N8818 G1 X191.491 Y122.792 E1.06057
N8819 G1 X191.491 Y197.148 E2.39103
N8820 ; COOLING_NODE: 0
N8821 M204 S10000
N8822 M73 P65 R12
N8823 G1 X191.898 Y197.615 F60000
N8824 G1 F8475
N8825 M204 S8000
N8826 G1 X158.102 Y197.615 E1.08675
N8827 G1 X158.102 Y122.385 E2.41914
N8828 G1 X191.898 Y122.385 E1.08675
N8829 G1 X191.898 Y197.555 E2.41721
N8830 ; COOLING_NODE: 0
N8831 M204 S10000
N8832 G1 X192.29 Y198.007 F60000
N8833 ; FEATURE: Outer wall
N8834 ; LINE_WIDTH: 0.42
N8835 G1 F9149.261
N8836 M204 S5000
N8837 G1 X157.71 Y198.007 E1.03002
N8838 G1 X157.71 Y121.993 E2.26421
N8839 G1 X192.29 Y121.993 E1.03002
N8840 G1 X192.29 Y197.947 E2.26243
N8841 G1 E-.8 F1800
N8842 M204 S10000
N8843 G1 X185.711 Y194.077 Z6.2 F60000
N8844 G1 X159.264 Y178.519 Z6.2
N8845 G1 Z5.8
N8846 G1 E.8 F1800
N8847 ; FEATURE: Sparse infill
N8848 ; LINE_WIDTH: 0.45
N8849 G1 F8475
N8850 M204 S8000
N8851 G1 X159.264 Y176.891 E.05236
N8852 G1 X190.736 Y168.458 E1.04769
N8853 G1 X190.736 Y169.936 E.0475
N8854 G1 X159.264 Y138.464 E1.43118
N8855 G1 X159.264 Y134.747 E.11954
N8856 G1 X190.736 Y126.314 E1.0477
N8857 G1 X190.736 Y123.88 E.07829
N8858 G1 X190.403 Y123.547 E.01512
N8859 G1 X188.95 Y123.547 E.04671
N8860 G1 X169.415 Y196.453 E2.42708
N8861 G1 X171.197 Y196.453 E.05729
N8862 G1 X159.264 Y184.52 E.54264
N8863 G1 X159.264 Y185.32 E.02571
N8864 G1 X190.736 Y176.887 E1.0477
N8865 G1 X190.736 Y179.798 E.09361
N8866 G1 X186.273 Y196.453 E.55444
N8867 G1 X182.711 Y196.453 E.11454
N8868 G1 X159.264 Y173.006 E1.06625
N8869 G1 X159.264 Y171.423 E.0509
N8870 G1 X172.093 Y123.547 E1.59383
N8871 G1 X169.606 Y123.547 E.07996
N8872 G1 X159.264 Y126.318 E.34428
N8873 G1 X159.264 Y126.951 E.02033
N8874 G1 X190.736 Y158.422 E1.43118
N8875 G1 X190.736 Y160.03 E.05171
N8876 G1 X159.264 Y168.462 E1.0477
N8877 G1 X159.264 Y166.834 E.05236
N8878 M204 S10000
N8879 G1 X190.736 Y153.229 F60000
N8880 G1 F8475
N8881 M204 S8000
N8882 G1 X190.736 Y151.601 E.05236
N8883 G1 X159.264 Y160.033 E1.04769
N8884 G1 X159.264 Y161.492 E.04691
N8885 G1 X190.736 Y192.963 E1.43118
N8886 G1 X190.736 Y193.745 E.02512
N8887 G1 X180.629 Y196.453 E.33646
N8888 G1 X177.844 Y196.453 E.08955
N8889 G1 X190.736 Y148.342 E1.60165
N8890 G1 X190.736 Y146.908 E.04611
N8891 G1 X167.375 Y123.547 E1.06234
N8892 G1 X163.664 Y123.547 E.11933
N8893 G1 X159.264 Y139.967 E.54661
N8894 G1 X159.264 Y143.176 E.1032
N8895 G1 X190.736 Y134.743 E1.0477
N8896 G1 X190.736 Y135.394 E.02092
N8897 G1 X178.889 Y123.547 E.53873
N8898 G1 X180.522 Y123.547 E.0525
N8899 G1 X160.987 Y196.453 E2.42708
N8900 G1 X159.683 Y196.453 E.04192
N8901 G1 X159.264 Y196.034 E.01904
N8902 G1 X159.264 Y193.749 E.0735
N8903 G1 X190.736 Y185.316 E1.0477
N8904 G1 X190.736 Y181.449 E.12433
N8905 G1 X159.264 Y149.978 E1.43118
N8906 G1 X159.264 Y151.605 E.05229
N8907 G1 X190.736 Y143.172 E1.0477
N8908 G1 X190.736 Y141.544 E.05236
N8909 ; WIPE_START
N8910 G1 X190.736 Y143.172 E-.61876
N8911 G1 X190.377 Y143.268 E-.14124
N8912 ; WIPE_END
N8913 G1 E-.04 F1800
N8914 M204 S10000
N8915 G17
N8916 G3 Z6.2 I1.217 J0 P1  F60000
N8917 ; stop printing object, unique label id: 130
N8918 M625
N8919 ; object ids of layer 29 start: 130
N8920 M624 AQAAAAAAAAA=
N8921 ;======== H2D 20250527========
N8922 ; SKIPPABLE_START
N8923 ; SKIPTYPE: timelapse
N8924 M622.1 S1 ; for prev firware, default turned on
N8925 
N8926 M1002 judge_flag timelapse_record_flag
N8927 
N8928 M622 J1
N8929 M993 A2 B2 C2
N8930 M993 A0 B0 C0
N8931 
N8932 
N8933 
N8934 
N8935     M9711 M0 E1 X260 Y137 Z6.2 S11 C10 O0 T3000
N8936 
N8937 
N8938 
N8939 M993 A3 B3 C3
N8940 
N8941 M623
N8942 ; SKIPPABLE_END
N8943 
N8944 ; object ids of this layer29 end: 130
N8945 M625
N8946 ; CHANGE_LAYER
N8947 ; Z_HEIGHT: 6
N8948 ; LAYER_HEIGHT: 0.2
N8949 ;======== H2D 20250521========
N8950 ; layer num/total_layer_count: 30/63
N8951 ; update layer progress
N8952 M73 L30
N8953 M991 S0 P29 ;notify layer change
N8954 
N8955 
N8956 ; OBJECT_ID: 130
N8957 ; COOLING_NODE: 0
N8958 ; start printing object, unique label id: 130
N8959 M624 AQAAAAAAAAA=
N8960 G1 X191.084 Y196.801 F60000
N8961 G1 Z6
N8962 G1 E.8 F1800
N8963 ; FEATURE: Inner wall
N8964 ; LINE_WIDTH: 0.45
N8965 ; LAYER_HEIGHT: 0.2
N8966 G1 F8475
N8967 M204 S8000
N8968 G1 X158.916 Y196.801 E1.03439
N8969 G1 X158.916 Y123.199 E2.36678
N8970 G1 X191.084 Y123.199 E1.03439
N8971 G1 X191.084 Y196.741 E2.36485
N8972 ; COOLING_NODE: 0
N8973 M204 S10000
N8974 G1 X191.491 Y197.208 F60000
N8975 G1 F8475
N8976 M204 S8000
N8977 G1 X158.509 Y197.208 E1.06057
N8978 G1 X158.509 Y122.792 E2.39296
N8979 G1 X191.491 Y122.792 E1.06057
N8980 G1 X191.491 Y197.148 E2.39103
N8981 ; COOLING_NODE: 0
N8982 M204 S10000
N8983 G1 X191.898 Y197.615 F60000
N8984 G1 F8475
N8985 M204 S8000
N8986 M73 P66 R12
N8987 G1 X158.102 Y197.615 E1.08675
N8988 G1 X158.102 Y122.385 E2.41914
N8989 G1 X191.898 Y122.385 E1.08675
N8990 G1 X191.898 Y197.555 E2.41721
N8991 ; COOLING_NODE: 0
N8992 M204 S10000
N8993 G1 X192.29 Y198.007 F60000
N8994 ; FEATURE: Outer wall
N8995 ; LINE_WIDTH: 0.42
N8996 G1 F9149.261
N8997 M204 S5000
N8998 G1 X157.71 Y198.007 E1.03002
N8999 G1 X157.71 Y121.993 E2.26421
N9000 G1 X192.29 Y121.993 E1.03002
N9001 G1 X192.29 Y197.947 E2.26243
N9002 G1 E-.8 F1800
N9003 M204 S10000
N9004 G1 X185.699 Y194.099 Z6.4 F60000
N9005 G1 X159.264 Y178.666 Z6.4
N9006 G1 Z6
N9007 G1 E.8 F1800
N9008 ; FEATURE: Sparse infill
N9009 ; LINE_WIDTH: 0.45
N9010 G1 F8475
N9011 M204 S8000
N9012 G1 X159.264 Y177.037 E.05236
N9013 G1 X190.736 Y168.605 E1.0477
N9014 G1 X190.736 Y169.736 E.03636
N9015 G1 X159.264 Y138.264 E1.43118
N9016 M204 S10000
N9017 G1 X159.264 Y133.265 F60000
N9018 G1 F8475
N9019 M204 S8000
N9020 G1 X159.264 Y134.893 E.05236
N9021 G1 X190.736 Y126.461 E1.04769
N9022 G1 X190.736 Y123.547 E.09369
N9023 G1 X188.804 Y123.547 E.06211
N9024 G1 X169.269 Y196.453 E2.42708
N9025 G1 X171.397 Y196.453 E.06843
N9026 G1 X159.264 Y184.32 E.55174
N9027 G1 X159.264 Y185.466 E.03685
N9028 G1 X190.736 Y177.034 E1.0477
N9029 G1 X190.736 Y179.252 E.07133
N9030 G1 X186.127 Y196.453 E.57263
N9031 G1 X182.911 Y196.453 E.1034
N9032 G1 X159.264 Y172.806 E1.07535
N9033 G1 X159.264 Y170.877 E.06204
N9034 G1 X171.946 Y123.547 E1.57564
N9035 G1 X170.153 Y123.547 E.05768
N9036 G1 X159.264 Y126.465 E.36247
N9037 G1 X159.264 Y126.75 E.00919
N9038 G1 X190.736 Y158.222 E1.43118
N9039 G1 X190.736 Y160.176 E.06285
N9040 G1 X159.264 Y168.609 E1.0477
N9041 G1 X159.264 Y166.98 E.05236
N9042 M204 S10000
N9043 G1 X190.736 Y153.375 F60000
N9044 G1 F8475
N9045 M204 S8000
N9046 G1 X190.736 Y151.747 E.05236
N9047 G1 X159.264 Y160.18 E1.04769
N9048 G1 X159.264 Y161.292 E.03577
N9049 G1 X190.736 Y192.763 E1.43118
N9050 G1 X190.736 Y193.891 E.03626
N9051 G1 X181.175 Y196.453 E.31827
N9052 G1 X177.698 Y196.453 E.11183
N9053 G1 X190.736 Y147.795 E1.61985
N9054 G1 X190.736 Y146.708 E.03497
N9055 G1 X167.575 Y123.547 E1.05324
N9056 G1 X163.518 Y123.547 E.13047
N9057 G1 X159.264 Y139.42 E.52842
N9058 G1 X159.264 Y143.322 E.12548
N9059 G1 X190.736 Y134.89 E1.0477
N9060 G1 X190.736 Y135.194 E.00978
N9061 G1 X179.089 Y123.547 E.52964
N9062 G1 X180.375 Y123.547 E.04136
N9063 G1 X160.84 Y196.453 E2.42708
N9064 G1 X159.883 Y196.453 E.03078
N9065 G1 X159.264 Y195.834 E.02813
N9066 G1 X159.264 Y193.895 E.06236
N9067 G1 X190.736 Y185.462 E1.0477
N9068 G1 X190.736 Y181.249 E.13547
N9069 G1 X159.264 Y149.778 E1.43118
N9070 G1 X159.264 Y151.751 E.06343
N9071 G1 X190.736 Y143.318 E1.0477
N9072 G1 X190.736 Y141.69 E.05236
N9073 ; WIPE_START
N9074 G1 X190.736 Y143.318 E-.61876
N9075 G1 X190.377 Y143.415 E-.14124
N9076 ; WIPE_END
N9077 G1 E-.04 F1800
N9078 M204 S10000
N9079 G17
N9080 G3 Z6.4 I1.217 J0 P1  F60000
N9081 ; stop printing object, unique label id: 130
N9082 M625
N9083 ; object ids of layer 30 start: 130
N9084 M624 AQAAAAAAAAA=
N9085 ;======== H2D 20250527========
N9086 ; SKIPPABLE_START
N9087 ; SKIPTYPE: timelapse
N9088 M622.1 S1 ; for prev firware, default turned on
N9089 
N9090 M1002 judge_flag timelapse_record_flag
N9091 
N9092 M622 J1
N9093 M993 A2 B2 C2
N9094 M993 A0 B0 C0
N9095 
N9096 
N9097 
N9098 
N9099     M9711 M0 E1 X260 Y137 Z6.4 S11 C10 O0 T3000
N9100 
N9101 
N9102 
N9103 M993 A3 B3 C3
N9104 
N9105 M623
N9106 ; SKIPPABLE_END
N9107 
N9108 ; object ids of this layer30 end: 130
N9109 M625
N9110 ; CHANGE_LAYER
N9111 ; Z_HEIGHT: 6.2
N9112 ; LAYER_HEIGHT: 0.2
N9113 ;======== H2D 20250521========
N9114 ; layer num/total_layer_count: 31/63
N9115 ; update layer progress
N9116 M73 L31
N9117 M991 S0 P30 ;notify layer change
N9118 
N9119 
N9120 ; OBJECT_ID: 130
N9121 ; COOLING_NODE: 0
N9122 ; start printing object, unique label id: 130
N9123 M624 AQAAAAAAAAA=
N9124 G1 X191.084 Y196.801 F60000
N9125 G1 Z6.2
N9126 G1 E.8 F1800
N9127 ; FEATURE: Inner wall
N9128 ; LINE_WIDTH: 0.45
N9129 ; LAYER_HEIGHT: 0.2
N9130 G1 F8475
N9131 M204 S8000
N9132 G1 X158.916 Y196.801 E1.03439
N9133 G1 X158.916 Y123.199 E2.36678
N9134 G1 X191.084 Y123.199 E1.03439
N9135 G1 X191.084 Y196.741 E2.36485
N9136 ; COOLING_NODE: 0
N9137 M204 S10000
N9138 G1 X191.491 Y197.208 F60000
N9139 G1 F8475
N9140 M204 S8000
N9141 G1 X158.509 Y197.208 E1.06057
N9142 G1 X158.509 Y122.792 E2.39296
N9143 G1 X191.491 Y122.792 E1.06057
N9144 G1 X191.491 Y197.148 E2.39103
N9145 ; COOLING_NODE: 0
N9146 M204 S10000
N9147 G1 X191.898 Y197.615 F60000
N9148 G1 F8475
N9149 M204 S8000
N9150 G1 X158.102 Y197.615 E1.08675
N9151 G1 X158.102 Y122.385 E2.41914
N9152 G1 X191.898 Y122.385 E1.08675
N9153 G1 X191.898 Y197.555 E2.41721
N9154 ; COOLING_NODE: 0
N9155 M204 S10000
N9156 G1 X192.29 Y198.007 F60000
N9157 ; FEATURE: Outer wall
N9158 ; LINE_WIDTH: 0.42
N9159 G1 F9149.261
N9160 M204 S5000
N9161 G1 X157.71 Y198.007 E1.03002
N9162 G1 X157.71 Y121.993 E2.26421
N9163 G1 X192.29 Y121.993 E1.03002
N9164 G1 X192.29 Y197.947 E2.26243
N9165 G1 E-.8 F1800
N9166 M204 S10000
N9167 G1 X185.686 Y194.121 Z6.6 F60000
N9168 G1 X159.264 Y178.812 Z6.6
N9169 G1 Z6.2
N9170 G1 E.8 F1800
N9171 ; FEATURE: Sparse infill
N9172 ; LINE_WIDTH: 0.45
N9173 G1 F8475
N9174 M204 S8000
N9175 G1 X159.264 Y177.184 E.05236
N9176 G1 X190.736 Y168.751 E1.0477
N9177 G1 X190.736 Y169.536 E.02522
N9178 G1 X159.264 Y138.064 E1.43118
N9179 M204 S10000
N9180 G1 X159.264 Y133.412 F60000
N9181 G1 F8475
N9182 M204 S8000
N9183 G1 X159.264 Y135.04 E.05236
N9184 G1 X190.736 Y126.607 E1.0477
N9185 G1 X190.736 Y123.547 E.0984
N9186 G1 X188.658 Y123.547 E.06682
N9187 G1 X169.123 Y196.453 E2.42708
N9188 G1 X171.597 Y196.453 E.07957
N9189 G1 X159.264 Y184.12 E.56084
N9190 G1 X159.264 Y185.613 E.04799
N9191 G1 X190.736 Y177.18 E1.0477
N9192 G1 X190.736 Y178.705 E.04906
N9193 G1 X185.98 Y196.453 E.59082
N9194 G1 X183.111 Y196.453 E.09226
N9195 G1 X159.264 Y172.606 E1.08444
N9196 G1 X159.264 Y170.33 E.07318
N9197 G1 X171.8 Y123.547 E1.55745
N9198 G1 X170.699 Y123.547 E.0354
N9199 G1 X159.264 Y126.611 E.38066
N9200 G1 X159.264 Y126.55 E.00195
N9201 G1 X190.736 Y158.022 E1.43118
N9202 G1 X190.736 Y160.322 E.07399
N9203 G1 X159.264 Y168.755 E1.0477
N9204 G1 X159.264 Y167.127 E.05236
N9205 M204 S10000
N9206 G1 X190.736 Y153.522 F60000
N9207 G1 F8475
N9208 M204 S8000
N9209 G1 X190.736 Y151.894 E.05236
N9210 G1 X159.264 Y160.326 E1.0477
N9211 G1 X159.264 Y161.092 E.02464
N9212 G1 X190.736 Y192.563 E1.43118
N9213 G1 X190.736 Y194.038 E.0474
N9214 G1 X181.722 Y196.453 E.30008
N9215 G1 X177.551 Y196.453 E.1341
N9216 M73 P67 R12
N9217 G1 X190.736 Y147.249 E1.63804
N9218 G1 X190.736 Y146.508 E.02383
N9219 G1 X167.775 Y123.547 E1.04415
N9220 G1 X163.371 Y123.547 E.14161
N9221 G1 X159.264 Y138.874 E.51023
N9222 G1 X159.264 Y143.469 E.14776
N9223 G1 X190.736 Y135.036 E1.0477
N9224 G1 X190.736 Y134.994 E.00136
N9225 G1 X179.289 Y123.547 E.52054
N9226 G1 X180.229 Y123.547 E.03022
N9227 G1 X160.694 Y196.453 E2.42708
N9228 G1 X160.083 Y196.453 E.01964
N9229 G1 X159.264 Y195.634 E.03723
N9230 G1 X159.264 Y194.041 E.05122
N9231 G1 X190.736 Y185.609 E1.0477
N9232 G1 X190.736 Y181.049 E.14661
N9233 G1 X159.264 Y149.578 E1.43118
N9234 G1 X159.264 Y151.897 E.07457
N9235 G1 X190.736 Y143.465 E1.0477
N9236 G1 X190.736 Y141.836 E.05236
N9237 ; WIPE_START
N9238 G1 X190.736 Y143.465 E-.61876
N9239 G1 X190.377 Y143.561 E-.14124
N9240 ; WIPE_END
N9241 G1 E-.04 F1800
N9242 M204 S10000
N9243 G17
N9244 G3 Z6.6 I1.217 J0 P1  F60000
N9245 ; stop printing object, unique label id: 130
N9246 M625
N9247 ; object ids of layer 31 start: 130
N9248 M624 AQAAAAAAAAA=
N9249 ;======== H2D 20250527========
N9250 ; SKIPPABLE_START
N9251 ; SKIPTYPE: timelapse
N9252 M622.1 S1 ; for prev firware, default turned on
N9253 
N9254 M1002 judge_flag timelapse_record_flag
N9255 
N9256 M622 J1
N9257 M993 A2 B2 C2
N9258 M993 A0 B0 C0
N9259 
N9260 
N9261 
N9262 
N9263     M9711 M0 E1 X260 Y137 Z6.6 S11 C10 O0 T3000
N9264 
N9265 
N9266 
N9267 M993 A3 B3 C3
N9268 
N9269 M623
N9270 ; SKIPPABLE_END
N9271 
N9272 ; object ids of this layer31 end: 130
N9273 M625
N9274 ; CHANGE_LAYER
N9275 ; Z_HEIGHT: 6.4
N9276 ; LAYER_HEIGHT: 0.2
N9277 ;======== H2D 20250521========
N9278 ; layer num/total_layer_count: 32/63
N9279 ; update layer progress
N9280 M73 L32
N9281 M991 S0 P31 ;notify layer change
N9282 
N9283 
N9284 ; OBJECT_ID: 130
N9285 ; COOLING_NODE: 0
N9286 ; start printing object, unique label id: 130
N9287 M624 AQAAAAAAAAA=
N9288 G1 X191.084 Y196.801 F60000
N9289 G1 Z6.4
N9290 G1 E.8 F1800
N9291 ; FEATURE: Inner wall
N9292 ; LINE_WIDTH: 0.45
N9293 ; LAYER_HEIGHT: 0.2
N9294 G1 F8475
N9295 M204 S8000
N9296 G1 X158.916 Y196.801 E1.03439
N9297 G1 X158.916 Y123.199 E2.36678
N9298 G1 X191.084 Y123.199 E1.03439
N9299 G1 X191.084 Y196.741 E2.36485
N9300 ; COOLING_NODE: 0
N9301 M204 S10000
N9302 G1 X191.491 Y197.208 F60000
N9303 G1 F8475
N9304 M204 S8000
N9305 G1 X158.509 Y197.208 E1.06057
N9306 G1 X158.509 Y122.792 E2.39296
N9307 G1 X191.491 Y122.792 E1.06057
N9308 G1 X191.491 Y197.148 E2.39103
N9309 ; COOLING_NODE: 0
N9310 M204 S10000
N9311 G1 X191.898 Y197.615 F60000
N9312 G1 F8475
N9313 M204 S8000
N9314 G1 X158.102 Y197.615 E1.08675
N9315 G1 X158.102 Y122.385 E2.41914
N9316 G1 X191.898 Y122.385 E1.08675
N9317 G1 X191.898 Y197.555 E2.41721
N9318 ; COOLING_NODE: 0
N9319 M204 S10000
N9320 G1 X192.29 Y198.007 F60000
N9321 ; FEATURE: Outer wall
N9322 ; LINE_WIDTH: 0.42
N9323 G1 F9149.261
N9324 M204 S5000
N9325 G1 X157.71 Y198.007 E1.03002
N9326 G1 X157.71 Y121.993 E2.26421
N9327 G1 X192.29 Y121.993 E1.03002
N9328 G1 X192.29 Y197.947 E2.26243
N9329 G1 E-.8 F1800
N9330 M204 S10000
N9331 G1 X187.462 Y196.453 Z6.8 F60000
N9332 G1 Z6.4
N9333 G1 E.8 F1800
N9334 ; FEATURE: Sparse infill
N9335 ; LINE_WIDTH: 0.45
N9336 G1 F8475
N9337 M204 S8000
N9338 G1 X185.834 Y196.453 E.05236
N9339 G1 X190.736 Y178.159 E.60901
N9340 G1 X190.736 Y177.326 E.02678
N9341 G1 X159.264 Y185.759 E1.0477
N9342 G1 X159.264 Y183.92 E.05913
N9343 G1 X171.797 Y196.453 E.56993
N9344 G1 X168.976 Y196.453 E.09071
N9345 G1 X188.511 Y123.547 E2.42708
N9346 G1 X190.736 Y123.547 E.07153
N9347 G1 X190.736 Y126.754 E.10311
N9348 G1 X159.264 Y135.186 E1.0477
N9349 G1 X159.264 Y133.558 E.05236
N9350 M204 S10000
N9351 G1 X159.264 Y137.864 F60000
N9352 G1 F8475
N9353 M204 S8000
N9354 G1 X190.736 Y169.336 E1.43118
N9355 G1 X190.736 Y168.898 E.01408
N9356 G1 X159.264 Y177.33 E1.0477
N9357 G1 X159.264 Y178.959 E.05236
N9358 M204 S10000
N9359 G1 X159.264 Y168.901 F60000
N9360 G1 F8475
N9361 M204 S8000
N9362 G1 X190.736 Y160.469 E1.0477
N9363 G1 X190.736 Y157.822 E.08512
N9364 G1 X159.264 Y126.35 E1.43118
N9365 G1 X159.264 Y126.757 E.01309
N9366 G1 X171.245 Y123.547 E.39885
N9367 G1 X171.654 Y123.547 E.01313
N9368 G1 X159.264 Y169.784 E1.53926
N9369 G1 X159.264 Y172.406 E.08432
N9370 G1 X183.311 Y196.453 E1.09354
N9371 M204 S10000
N9372 G1 X190.736 Y153.668 F60000
N9373 G1 F8475
N9374 M204 S8000
N9375 G1 X190.736 Y152.04 E.05236
N9376 G1 X159.264 Y160.473 E1.0477
N9377 G1 X159.264 Y160.892 E.0135
N9378 G1 X190.736 Y192.363 E1.43118
N9379 G1 X190.736 Y194.184 E.05854
N9380 G1 X182.268 Y196.453 E.28189
N9381 G1 X177.405 Y196.453 E.15638
N9382 G1 X190.736 Y146.702 E1.65623
N9383 G1 X190.736 Y146.308 E.01269
N9384 G1 X167.975 Y123.547 E1.03505
N9385 G1 X163.225 Y123.547 E.15275
N9386 G1 X159.264 Y138.327 E.49204
N9387 G1 X159.264 Y143.615 E.17003
N9388 G1 X190.736 Y135.182 E1.0477
N9389 G1 X190.736 Y134.794 E.0125
N9390 G1 X179.489 Y123.547 E.51145
N9391 G1 X180.082 Y123.547 E.01908
N9392 G1 X160.547 Y196.453 E2.42708
N9393 G1 X160.283 Y196.453 E.0085
N9394 G1 X159.264 Y195.434 E.04632
N9395 G1 X159.264 Y194.188 E.04008
N9396 G1 X190.736 Y185.755 E1.0477
N9397 G1 X190.736 Y180.849 E.15775
N9398 G1 X159.264 Y149.378 E1.43118
N9399 G1 X159.264 Y152.044 E.08571
N9400 G1 X190.736 Y143.611 E1.0477
N9401 G1 X190.736 Y141.983 E.05236
N9402 ; WIPE_START
N9403 G1 X190.736 Y143.611 E-.61876
N9404 G1 X190.377 Y143.707 E-.14124
N9405 ; WIPE_END
N9406 G1 E-.04 F1800
N9407 M204 S10000
N9408 G17
N9409 G3 Z6.8 I1.217 J0 P1  F60000
N9410 ; stop printing object, unique label id: 130
N9411 M625
N9412 ; object ids of layer 32 start: 130
N9413 M624 AQAAAAAAAAA=
N9414 ;======== H2D 20250527========
N9415 ; SKIPPABLE_START
N9416 ; SKIPTYPE: timelapse
N9417 M622.1 S1 ; for prev firware, default turned on
N9418 
N9419 M1002 judge_flag timelapse_record_flag
N9420 
N9421 M622 J1
N9422 M993 A2 B2 C2
N9423 M993 A0 B0 C0
N9424 
N9425 
N9426 
N9427 
N9428     M9711 M0 E1 X260 Y137 Z6.8 S11 C10 O0 T3000
N9429 
N9430 
N9431 
N9432 M993 A3 B3 C3
N9433 
N9434 M623
N9435 ; SKIPPABLE_END
N9436 
N9437 ; object ids of this layer32 end: 130
N9438 M625
N9439 ; CHANGE_LAYER
N9440 ; Z_HEIGHT: 6.6
N9441 ; LAYER_HEIGHT: 0.2
N9442 ;======== H2D 20250521========
N9443 ; layer num/total_layer_count: 33/63
N9444 ; update layer progress
N9445 M73 L33
N9446 M991 S0 P32 ;notify layer change
N9447 
N9448 
N9449 ; OBJECT_ID: 130
N9450 ; COOLING_NODE: 0
N9451 ; start printing object, unique label id: 130
N9452 M624 AQAAAAAAAAA=
N9453 G1 X191.084 Y196.801 F60000
N9454 G1 Z6.6
N9455 G1 E.8 F1800
N9456 ; FEATURE: Inner wall
N9457 ; LINE_WIDTH: 0.45
N9458 ; LAYER_HEIGHT: 0.2
N9459 G1 F8475
N9460 M204 S8000
N9461 G1 X158.916 Y196.801 E1.03439
N9462 G1 X158.916 Y123.199 E2.36678
N9463 G1 X191.084 Y123.199 E1.03439
N9464 G1 X191.084 Y196.741 E2.36485
N9465 ; COOLING_NODE: 0
N9466 M204 S10000
N9467 G1 X191.491 Y197.208 F60000
N9468 G1 F8475
N9469 M204 S8000
N9470 G1 X158.509 Y197.208 E1.06057
N9471 G1 X158.509 Y122.792 E2.39296
N9472 G1 X191.491 Y122.792 E1.06057
N9473 G1 X191.491 Y197.148 E2.39103
N9474 ; COOLING_NODE: 0
N9475 M204 S10000
N9476 G1 X191.898 Y197.615 F60000
N9477 G1 F8475
N9478 M204 S8000
N9479 G1 X158.102 Y197.615 E1.08675
N9480 G1 X158.102 Y122.385 E2.41914
N9481 G1 X191.898 Y122.385 E1.08675
N9482 G1 X191.898 Y197.555 E2.41721
N9483 ; COOLING_NODE: 0
N9484 M204 S10000
N9485 G1 X192.29 Y198.007 F60000
N9486 ; FEATURE: Outer wall
N9487 ; LINE_WIDTH: 0.42
N9488 G1 F9149.261
N9489 M204 S5000
N9490 G1 X157.71 Y198.007 E1.03002
N9491 M73 P68 R12
N9492 G1 X157.71 Y121.993 E2.26421
N9493 G1 X192.29 Y121.993 E1.03002
N9494 G1 X192.29 Y197.947 E2.26243
N9495 M73 P68 R11
N9496 G1 E-.8 F1800
N9497 M204 S10000
N9498 G1 X187.316 Y196.453 Z7 F60000
N9499 G1 Z6.6
N9500 G1 E.8 F1800
N9501 ; FEATURE: Sparse infill
N9502 ; LINE_WIDTH: 0.45
N9503 G1 F8475
N9504 M204 S8000
N9505 G1 X185.687 Y196.453 E.05236
N9506 G1 X190.736 Y177.613 E.6272
N9507 G1 X190.736 Y177.473 E.0045
N9508 G1 X159.264 Y185.905 E1.0477
N9509 G1 X159.264 Y183.72 E.07027
N9510 G1 X171.997 Y196.453 E.57903
N9511 G1 X168.83 Y196.453 E.10185
N9512 G1 X188.365 Y123.547 E2.42708
N9513 G1 X190.736 Y123.547 E.07624
N9514 G1 X190.736 Y126.9 E.10782
N9515 G1 X159.264 Y135.333 E1.0477
N9516 G1 X159.264 Y133.704 E.05236
N9517 M204 S10000
N9518 G1 X159.264 Y142.133 F60000
N9519 G1 F8475
N9520 M204 S8000
N9521 G1 X159.264 Y143.761 E.05236
N9522 G1 X190.736 Y135.329 E1.0477
N9523 G1 X190.736 Y134.594 E.02364
N9524 G1 X179.689 Y123.547 E.50235
N9525 G1 X179.936 Y123.547 E.00794
N9526 G1 X160.401 Y196.453 E2.42708
N9527 G1 X160.483 Y196.453 E.00264
N9528 G1 X159.264 Y195.234 E.05542
N9529 G1 X159.264 Y194.334 E.02894
N9530 G1 X190.736 Y185.902 E1.04769
N9531 G1 X190.736 Y180.649 E.16889
N9532 G1 X159.264 Y149.178 E1.43118
N9533 G1 X159.264 Y152.19 E.09685
N9534 G1 X190.736 Y143.758 E1.0477
N9535 G1 X190.736 Y142.129 E.05236
N9536 M204 S10000
N9537 G1 X190.736 Y162.244 F60000
N9538 G1 F8475
N9539 M204 S8000
N9540 G1 X190.736 Y160.615 E.05236
N9541 G1 X159.264 Y169.048 E1.04769
N9542 G1 X159.264 Y169.238 E.0061
N9543 G1 X171.507 Y123.547 E1.52107
N9544 G1 X171.792 Y123.547 E.00915
N9545 G1 X159.264 Y126.904 E.41704
N9546 G1 X159.264 Y126.151 E.02423
N9547 G1 X190.736 Y157.622 E1.43118
N9548 G1 X190.736 Y152.186 E.17478
N9549 G1 X159.264 Y160.619 E1.0477
N9550 G1 X159.264 Y160.692 E.00236
N9551 G1 X190.736 Y192.163 E1.43118
N9552 G1 X190.736 Y194.33 E.06968
N9553 G1 X182.815 Y196.453 E.2637
N9554 G1 X177.259 Y196.453 E.17866
N9555 G1 X190.736 Y146.156 E1.67442
N9556 G1 X190.736 Y146.108 E.00156
N9557 G1 X168.175 Y123.547 E1.02596
N9558 G1 X163.078 Y123.547 E.16389
N9559 G1 X159.264 Y137.781 E.47385
N9560 G1 X159.264 Y137.664 E.00375
N9561 G1 X190.736 Y169.136 E1.43118
N9562 G1 X190.736 Y169.044 E.00294
N9563 G1 X159.264 Y177.477 E1.0477
N9564 G1 X159.264 Y172.206 E.16948
N9565 G1 X183.511 Y196.453 E1.10263
N9566 ; WIPE_START
N9567 G1 X182.097 Y195.039 E-.76
N9568 ; WIPE_END
N9569 G1 E-.04 F1800
N9570 M204 S10000
N9571 G17
N9572 G3 Z7 I1.217 J0 P1  F60000
N9573 ; stop printing object, unique label id: 130
N9574 M625
N9575 ; object ids of layer 33 start: 130
N9576 M624 AQAAAAAAAAA=
N9577 ;======== H2D 20250527========
N9578 ; SKIPPABLE_START
N9579 ; SKIPTYPE: timelapse
N9580 M622.1 S1 ; for prev firware, default turned on
N9581 
N9582 M1002 judge_flag timelapse_record_flag
N9583 
N9584 M622 J1
N9585 M993 A2 B2 C2
N9586 M993 A0 B0 C0
N9587 
N9588 
N9589 
N9590 
N9591     M9711 M0 E1 X260 Y137 Z7 S11 C10 O0 T3000
N9592 
N9593 
N9594 
N9595 M993 A3 B3 C3
N9596 
N9597 M623
N9598 ; SKIPPABLE_END
N9599 
N9600 ; object ids of this layer33 end: 130
N9601 M625
N9602 ; CHANGE_LAYER
N9603 ; Z_HEIGHT: 6.8
N9604 ; LAYER_HEIGHT: 0.2
N9605 ;======== H2D 20250521========
N9606 ; layer num/total_layer_count: 34/63
N9607 ; update layer progress
N9608 M73 L34
N9609 M991 S0 P33 ;notify layer change
N9610 
N9611 
N9612 ; OBJECT_ID: 130
N9613 ; COOLING_NODE: 0
N9614 ; start printing object, unique label id: 130
N9615 M624 AQAAAAAAAAA=
N9616 G1 X191.084 Y196.801 F60000
N9617 G1 Z6.8
N9618 G1 E.8 F1800
N9619 ; FEATURE: Inner wall
N9620 ; LINE_WIDTH: 0.45
N9621 ; LAYER_HEIGHT: 0.2
N9622 G1 F8475
N9623 M204 S8000
N9624 G1 X158.916 Y196.801 E1.03439
N9625 G1 X158.916 Y123.199 E2.36678
N9626 G1 X191.084 Y123.199 E1.03439
N9627 G1 X191.084 Y196.741 E2.36485
N9628 ; COOLING_NODE: 0
N9629 M204 S10000
N9630 G1 X191.491 Y197.208 F60000
N9631 G1 F8475
N9632 M204 S8000
N9633 G1 X158.509 Y197.208 E1.06057
N9634 G1 X158.509 Y122.792 E2.39296
N9635 G1 X191.491 Y122.792 E1.06057
N9636 G1 X191.491 Y197.148 E2.39103
N9637 ; COOLING_NODE: 0
N9638 M204 S10000
N9639 G1 X191.898 Y197.615 F60000
N9640 G1 F8475
N9641 M204 S8000
N9642 G1 X158.102 Y197.615 E1.08675
N9643 G1 X158.102 Y122.385 E2.41914
N9644 G1 X191.898 Y122.385 E1.08675
N9645 G1 X191.898 Y197.555 E2.41721
N9646 ; COOLING_NODE: 0
N9647 M204 S10000
N9648 G1 X192.29 Y198.007 F60000
N9649 ; FEATURE: Outer wall
N9650 ; LINE_WIDTH: 0.42
N9651 G1 F9149.261
N9652 M204 S5000
N9653 G1 X157.71 Y198.007 E1.03002
N9654 G1 X157.71 Y121.993 E2.26421
N9655 G1 X192.29 Y121.993 E1.03002
N9656 G1 X192.29 Y197.947 E2.26243
N9657 G1 E-.8 F1800
N9658 M204 S10000
N9659 G1 X187.169 Y196.453 Z7.2 F60000
N9660 G1 Z6.8
N9661 G1 E.8 F1800
N9662 ; FEATURE: Sparse infill
N9663 ; LINE_WIDTH: 0.45
N9664 G1 F8475
N9665 M204 S8000
N9666 G1 X185.541 Y196.453 E.05236
N9667 G1 X190.736 Y177.066 E.64539
N9668 G1 X190.736 Y175.438 E.05236
N9669 M204 S10000
N9670 G1 X190.736 Y177.619 F60000
N9671 G1 F8475
N9672 M204 S8000
N9673 G1 X159.264 Y186.052 E1.0477
N9674 G1 X159.264 Y183.52 E.08141
N9675 G1 X172.197 Y196.453 E.58812
N9676 G1 X168.683 Y196.453 E.11299
N9677 G1 X188.218 Y123.547 E2.42708
N9678 G1 X190.736 Y123.547 E.08094
N9679 G1 X190.736 Y127.046 E.11252
N9680 G1 X159.264 Y135.479 E1.0477
N9681 G1 X159.264 Y133.851 E.05236
N9682 M204 S10000
N9683 G1 X159.264 Y142.28 F60000
N9684 G1 F8475
N9685 M204 S8000
N9686 G1 X159.264 Y143.908 E.05236
N9687 G1 X190.736 Y135.475 E1.0477
N9688 G1 X190.736 Y134.394 E.03478
N9689 G1 X179.889 Y123.547 E.49326
N9690 G1 X179.79 Y123.547 E.0032
N9691 G1 X160.255 Y196.453 E2.42708
N9692 G1 X160.683 Y196.453 E.01378
N9693 G1 X159.264 Y195.034 E.06451
N9694 G1 X159.264 Y194.481 E.0178
N9695 G1 X190.736 Y186.048 E1.0477
N9696 G1 X190.736 Y180.449 E.18003
N9697 G1 X159.264 Y148.978 E1.43118
N9698 G1 X159.264 Y152.337 E.10799
N9699 G1 X190.736 Y143.904 E1.04769
N9700 G1 X190.736 Y142.276 E.05236
N9701 M204 S10000
N9702 G1 X190.736 Y150.704 F60000
N9703 G1 F8475
N9704 M204 S8000
N9705 G1 X190.736 Y152.333 E.05236
N9706 G1 X159.264 Y160.765 E1.0477
N9707 G1 X159.264 Y160.492 E.00878
N9708 G1 X190.736 Y191.963 E1.43118
N9709 G1 X190.736 Y194.477 E.08082
N9710 G1 X183.361 Y196.453 E.24551
N9711 G1 X183.711 Y196.453 E.01126
N9712 G1 X159.264 Y172.006 E1.11173
N9713 G1 X159.264 Y177.623 E.18061
N9714 G1 X190.736 Y169.19 E1.0477
N9715 G1 X190.736 Y168.936 E.0082
N9716 G1 X159.264 Y137.464 E1.43118
N9717 G1 X159.264 Y137.235 E.00739
N9718 G1 X162.932 Y123.547 E.45566
N9719 G1 X168.375 Y123.547 E.17503
N9720 G1 X190.736 Y145.908 E1.01686
N9721 G1 X190.736 Y145.61 E.00958
N9722 G1 X177.112 Y196.453 E1.69261
N9723 G1 X178.74 Y196.453 E.05236
N9724 M204 S10000
N9725 G1 X173.967 Y123.547 F60000
N9726 G1 F8475
N9727 M204 S8000
N9728 G1 X172.338 Y123.547 E.05236
N9729 G1 X159.264 Y127.05 E.43523
N9730 G1 X159.264 Y125.951 E.03536
N9731 G1 X190.736 Y157.422 E1.43118
N9732 G1 X190.736 Y160.762 E.1074
N9733 G1 X159.264 Y169.194 E1.0477
N9734 G1 X159.264 Y168.691 E.01618
N9735 M73 P69 R11
N9736 G1 X171.361 Y123.547 E1.50288
N9737 ; WIPE_START
N9738 G1 X170.843 Y125.479 E-.76
N9739 ; WIPE_END
N9740 G1 E-.04 F1800
N9741 M204 S10000
N9742 G17
N9743 G3 Z7.2 I1.217 J0 P1  F60000
N9744 ; stop printing object, unique label id: 130
N9745 M625
N9746 ; object ids of layer 34 start: 130
N9747 M624 AQAAAAAAAAA=
N9748 ;======== H2D 20250527========
N9749 ; SKIPPABLE_START
N9750 ; SKIPTYPE: timelapse
N9751 M622.1 S1 ; for prev firware, default turned on
N9752 
N9753 M1002 judge_flag timelapse_record_flag
N9754 
N9755 M622 J1
N9756 M993 A2 B2 C2
N9757 M993 A0 B0 C0
N9758 
N9759 
N9760 
N9761 
N9762     M9711 M0 E1 X260 Y137 Z7.2 S11 C10 O0 T3000
N9763 
N9764 
N9765 
N9766 M993 A3 B3 C3
N9767 
N9768 M623
N9769 ; SKIPPABLE_END
N9770 
N9771 ; object ids of this layer34 end: 130
N9772 M625
N9773 ; CHANGE_LAYER
N9774 ; Z_HEIGHT: 7
N9775 ; LAYER_HEIGHT: 0.2
N9776 ;======== H2D 20250521========
N9777 ; layer num/total_layer_count: 35/63
N9778 ; update layer progress
N9779 M73 L35
N9780 M991 S0 P34 ;notify layer change
N9781 
N9782 
N9783 ; OBJECT_ID: 130
N9784 ; COOLING_NODE: 0
N9785 ; start printing object, unique label id: 130
N9786 M624 AQAAAAAAAAA=
N9787 G1 X191.084 Y196.801 F60000
N9788 G1 Z7
N9789 G1 E.8 F1800
N9790 ; FEATURE: Inner wall
N9791 ; LINE_WIDTH: 0.45
N9792 ; LAYER_HEIGHT: 0.2
N9793 G1 F8475
N9794 M204 S8000
N9795 G1 X158.916 Y196.801 E1.03439
N9796 G1 X158.916 Y123.199 E2.36678
N9797 G1 X191.084 Y123.199 E1.03439
N9798 G1 X191.084 Y196.741 E2.36485
N9799 ; COOLING_NODE: 0
N9800 M204 S10000
N9801 G1 X191.491 Y197.208 F60000
N9802 G1 F8475
N9803 M204 S8000
N9804 G1 X158.509 Y197.208 E1.06057
N9805 G1 X158.509 Y122.792 E2.39296
N9806 G1 X191.491 Y122.792 E1.06057
N9807 G1 X191.491 Y197.148 E2.39103
N9808 ; COOLING_NODE: 0
N9809 M204 S10000
N9810 G1 X191.898 Y197.615 F60000
N9811 G1 F8475
N9812 M204 S8000
N9813 G1 X158.102 Y197.615 E1.08675
N9814 G1 X158.102 Y122.385 E2.41914
N9815 G1 X191.898 Y122.385 E1.08675
N9816 G1 X191.898 Y197.555 E2.41721
N9817 ; COOLING_NODE: 0
N9818 M204 S10000
N9819 G1 X192.29 Y198.007 F60000
N9820 ; FEATURE: Outer wall
N9821 ; LINE_WIDTH: 0.42
N9822 G1 F9149.261
N9823 M204 S5000
N9824 G1 X157.71 Y198.007 E1.03002
N9825 G1 X157.71 Y121.993 E2.26421
N9826 G1 X192.29 Y121.993 E1.03002
N9827 G1 X192.29 Y197.947 E2.26243
N9828 G1 E-.8 F1800
N9829 M204 S10000
N9830 G1 X187.023 Y196.453 Z7.4 F60000
N9831 G1 Z7
N9832 G1 E.8 F1800
N9833 ; FEATURE: Sparse infill
N9834 ; LINE_WIDTH: 0.45
N9835 G1 F8475
N9836 M204 S8000
N9837 G1 X185.395 Y196.453 E.05236
N9838 G1 X190.736 Y176.52 E.66358
N9839 G1 X190.736 Y174.892 E.05236
N9840 M204 S10000
N9841 G1 X190.736 Y177.766 F60000
N9842 G1 F8475
N9843 M204 S8000
N9844 G1 X159.264 Y186.198 E1.0477
N9845 G1 X159.264 Y183.32 E.09255
N9846 G1 X172.397 Y196.453 E.59722
N9847 G1 X168.537 Y196.453 E.12413
N9848 G1 X188.072 Y123.547 E2.42708
N9849 G1 X190.736 Y123.547 E.08565
N9850 G1 X190.736 Y127.193 E.11723
N9851 G1 X159.264 Y135.625 E1.0477
N9852 M204 S10000
N9853 G1 X159.264 Y142.426 F60000
N9854 G1 F8475
N9855 M204 S8000
N9856 G1 X159.264 Y144.054 E.05236
N9857 G1 X190.736 Y135.622 E1.0477
N9858 G1 X190.736 Y134.194 E.04592
N9859 G1 X180.089 Y123.547 E.48416
N9860 G1 X179.643 Y123.547 E.01434
N9861 G1 X160.108 Y196.453 E2.42708
N9862 G1 X160.883 Y196.453 E.02492
N9863 G1 X159.264 Y194.834 E.07361
N9864 G1 X159.264 Y194.627 E.00666
N9865 G1 X190.736 Y186.194 E1.0477
N9866 G1 X190.736 Y180.249 E.19117
N9867 G1 X159.264 Y148.778 E1.43118
N9868 G1 X159.264 Y152.483 E.11913
N9869 G1 X190.736 Y144.05 E1.0477
N9870 G1 X190.736 Y145.063 E.03257
N9871 G1 X176.966 Y196.453 E1.7108
N9872 G1 X178.594 Y196.453 E.05236
N9873 M204 S10000
N9874 G1 X174.513 Y123.547 F60000
N9875 G1 F8475
N9876 M204 S8000
N9877 G1 X172.885 Y123.547 E.05236
N9878 G1 X159.264 Y127.197 E.45342
N9879 G1 X159.264 Y125.751 E.0465
N9880 G1 X190.736 Y157.222 E1.43118
N9881 G1 X190.736 Y160.908 E.11854
N9882 G1 X159.264 Y169.341 E1.0477
N9883 G1 X159.264 Y168.145 E.03845
N9884 G1 X171.214 Y123.547 E1.48469
N9885 G1 X168.575 Y123.547 E.08487
N9886 G1 X190.736 Y145.708 E1.00777
N9887 M204 S10000
N9888 G1 X190.736 Y150.851 F60000
N9889 G1 F8475
N9890 M204 S8000
N9891 G1 X190.736 Y152.479 E.05236
N9892 G1 X159.264 Y160.912 E1.0477
N9893 G1 X159.264 Y160.292 E.01992
N9894 G1 X190.736 Y191.763 E1.43118
N9895 G1 X190.736 Y194.623 E.09196
N9896 G1 X183.907 Y196.453 E.22732
N9897 G1 X159.264 Y171.806 E1.12074
N9898 G1 X159.264 Y177.769 E.19175
N9899 G1 X190.736 Y169.337 E1.0477
N9900 G1 X190.736 Y168.736 E.01933
N9901 G1 X159.264 Y137.264 E1.43118
N9902 G1 X159.264 Y136.688 E.01853
N9903 G1 X162.786 Y123.547 E.43747
N9904 G1 X164.414 Y123.547 E.05236
N9905 ; WIPE_START
N9906 G1 X162.786 Y123.547 E-.61876
N9907 G1 X162.689 Y123.906 E-.14124
N9908 ; WIPE_END
N9909 G1 E-.04 F1800
N9910 M204 S10000
N9911 G17
N9912 G3 Z7.4 I1.217 J0 P1  F60000
N9913 ; stop printing object, unique label id: 130
N9914 M625
N9915 ; object ids of layer 35 start: 130
N9916 M624 AQAAAAAAAAA=
N9917 ;======== H2D 20250527========
N9918 ; SKIPPABLE_START
N9919 ; SKIPTYPE: timelapse
N9920 M622.1 S1 ; for prev firware, default turned on
N9921 
N9922 M1002 judge_flag timelapse_record_flag
N9923 
N9924 M622 J1
N9925 M993 A2 B2 C2
N9926 M993 A0 B0 C0
N9927 
N9928 
N9929 
N9930 
N9931     M9711 M0 E1 X260 Y137 Z7.4 S11 C10 O0 T3000
N9932 
N9933 
N9934 
N9935 M993 A3 B3 C3
N9936 
N9937 M623
N9938 ; SKIPPABLE_END
N9939 
N9940 ; object ids of this layer35 end: 130
N9941 M625
N9942 ; CHANGE_LAYER
N9943 ; Z_HEIGHT: 7.2
N9944 ; LAYER_HEIGHT: 0.2
N9945 ;======== H2D 20250521========
N9946 ; layer num/total_layer_count: 36/63
N9947 ; update layer progress
N9948 M73 L36
N9949 M991 S0 P35 ;notify layer change
N9950 
N9951 
N9952 ; OBJECT_ID: 130
N9953 ; COOLING_NODE: 0
N9954 ; start printing object, unique label id: 130
N9955 M624 AQAAAAAAAAA=
N9956 G1 X191.084 Y196.801 F60000
N9957 G1 Z7.2
N9958 G1 E.8 F1800
N9959 ; FEATURE: Inner wall
N9960 ; LINE_WIDTH: 0.45
N9961 ; LAYER_HEIGHT: 0.2
N9962 G1 F8475
N9963 M204 S8000
N9964 G1 X158.916 Y196.801 E1.03439
N9965 G1 X158.916 Y123.199 E2.36678
N9966 G1 X191.084 Y123.199 E1.03439
N9967 G1 X191.084 Y196.741 E2.36485
N9968 ; COOLING_NODE: 0
N9969 M204 S10000
N9970 G1 X191.491 Y197.208 F60000
N9971 G1 F8475
N9972 M204 S8000
N9973 G1 X158.509 Y197.208 E1.06057
N9974 G1 X158.509 Y122.792 E2.39296
N9975 G1 X191.491 Y122.792 E1.06057
N9976 G1 X191.491 Y197.148 E2.39103
N9977 ; COOLING_NODE: 0
N9978 M204 S10000
N9979 G1 X191.898 Y197.615 F60000
N9980 G1 F8475
N9981 M204 S8000
N9982 G1 X158.102 Y197.615 E1.08675
N9983 G1 X158.102 Y122.385 E2.41914
N9984 G1 X191.898 Y122.385 E1.08675
N9985 G1 X191.898 Y197.555 E2.41721
N9986 ; COOLING_NODE: 0
N9987 M204 S10000
N9988 G1 X192.29 Y198.007 F60000
N9989 ; FEATURE: Outer wall
N9990 ; LINE_WIDTH: 0.42
N9991 G1 F9149.261
N9992 M204 S5000
N9993 G1 X157.71 Y198.007 E1.03002
N9994 G1 X157.71 Y121.993 E2.26421
N9995 G1 X192.29 Y121.993 E1.03002
N9996 G1 X192.29 Y197.947 E2.26243
N9997 G1 E-.8 F1800
N9998 M204 S10000
N9999 G1 X185.248 Y196.453 Z7.6 F60000
N10000 G1 Z7.2
N10001 G1 E.8 F1800
N10002 ; FEATURE: Sparse infill
N10003 ; LINE_WIDTH: 0.45
N10004 G1 F8475
N10005 M204 S8000
N10006 G1 X190.736 Y175.973 E.68177
N10007 G1 X190.736 Y174.345 E.05236
N10008 M204 S10000
N10009 G1 X190.736 Y184.712 F60000
N10010 G1 F8475
N10011 M204 S8000
N10012 G1 X190.736 Y186.341 E.05236
N10013 G1 X159.264 Y194.773 E1.0477
N10014 G1 X159.264 Y194.634 E.00448
N10015 G1 X161.083 Y196.453 E.0827
N10016 G1 X159.962 Y196.453 E.03606
N10017 G1 X179.497 Y123.547 E2.42708
N10018 G1 X180.289 Y123.547 E.02548
N10019 G1 X190.736 Y133.994 E.47507
N10020 G1 X190.736 Y135.768 E.05706
N10021 M73 P70 R11
N10022 G1 X159.264 Y144.201 E1.0477
N10023 G1 X159.264 Y137.064 E.22948
N10024 G1 X190.736 Y168.536 E1.43118
N10025 G1 X190.736 Y169.483 E.03047
N10026 G1 X159.264 Y177.916 E1.04769
N10027 G1 X159.264 Y171.606 E.20289
N10028 G1 X184.111 Y196.453 E1.12992
N10029 G1 X184.454 Y196.453 E.01102
N10030 G1 X190.736 Y194.77 E.20913
N10031 G1 X190.736 Y191.563 E.1031
N10032 G1 X159.264 Y160.092 E1.43118
N10033 G1 X159.264 Y161.058 E.03106
N10034 G1 X190.736 Y152.626 E1.0477
N10035 G1 X190.736 Y150.997 E.05236
N10036 M204 S10000
N10037 G1 X190.736 Y145.508 F60000
N10038 G1 F8475
N10039 M204 S8000
N10040 G1 X168.775 Y123.547 E.99867
N10041 G1 X171.068 Y123.547 E.07373
N10042 G1 X159.264 Y167.598 E1.4665
N10043 G1 X159.264 Y169.487 E.06073
N10044 G1 X190.736 Y161.054 E1.0477
N10045 G1 X190.736 Y157.022 E.12968
N10046 G1 X159.264 Y125.551 E1.43118
N10047 G1 X159.264 Y127.343 E.05764
N10048 G1 X173.431 Y123.547 E.47162
N10049 G1 X175.059 Y123.547 E.05236
N10050 M204 S10000
N10051 G1 X164.267 Y123.547 F60000
N10052 G1 F8475
N10053 M204 S8000
N10054 G1 X162.639 Y123.547 E.05236
N10055 G1 X159.264 Y136.142 E.41928
N10056 G1 X159.264 Y135.772 E.01189
N10057 G1 X190.736 Y127.339 E1.0477
N10058 G1 X190.736 Y123.547 E.12194
N10059 G1 X187.926 Y123.547 E.09036
N10060 G1 X168.391 Y196.453 E2.42708
N10061 G1 X172.597 Y196.453 E.13527
N10062 G1 X159.264 Y183.12 E.60631
N10063 G1 X159.264 Y186.345 E.10369
N10064 G1 X190.736 Y177.912 E1.0477
N10065 G1 X190.736 Y180.049 E.06873
N10066 G1 X159.264 Y148.578 E1.43118
N10067 G1 X159.264 Y152.629 E.13027
N10068 G1 X190.736 Y144.197 E1.0477
N10069 G1 X190.736 Y144.517 E.01029
N10070 G1 X176.819 Y196.453 E1.72899
N10071 G1 X178.448 Y196.453 E.05236
N10072 ; WIPE_START
N10073 G1 X176.819 Y196.453 E-.61876
N10074 G1 X176.916 Y196.094 E-.14124
N10075 ; WIPE_END
N10076 G1 E-.04 F1800
N10077 M204 S10000
N10078 G17
N10079 G3 Z7.6 I1.217 J0 P1  F60000
N10080 ; stop printing object, unique label id: 130
N10081 M625
N10082 ; object ids of layer 36 start: 130
N10083 M624 AQAAAAAAAAA=
N10084 ;======== H2D 20250527========
N10085 ; SKIPPABLE_START
N10086 ; SKIPTYPE: timelapse
N10087 M622.1 S1 ; for prev firware, default turned on
N10088 
N10089 M1002 judge_flag timelapse_record_flag
N10090 
N10091 M622 J1
N10092 M993 A2 B2 C2
N10093 M993 A0 B0 C0
N10094 
N10095 
N10096 
N10097 
N10098     M9711 M0 E1 X260 Y137 Z7.6 S11 C10 O0 T3000
N10099 
N10100 
N10101 
N10102 M993 A3 B3 C3
N10103 
N10104 M623
N10105 ; SKIPPABLE_END
N10106 
N10107 ; object ids of this layer36 end: 130
N10108 M625
N10109 ; CHANGE_LAYER
N10110 ; Z_HEIGHT: 7.4
N10111 ; LAYER_HEIGHT: 0.2
N10112 ;======== H2D 20250521========
N10113 ; layer num/total_layer_count: 37/63
N10114 ; update layer progress
N10115 M73 L37
N10116 M991 S0 P36 ;notify layer change
N10117 
N10118 
N10119 ; OBJECT_ID: 130
N10120 ; COOLING_NODE: 0
N10121 ; start printing object, unique label id: 130
N10122 M624 AQAAAAAAAAA=
N10123 G1 X191.084 Y196.801 F60000
N10124 G1 Z7.4
N10125 G1 E.8 F1800
N10126 ; FEATURE: Inner wall
N10127 ; LINE_WIDTH: 0.45
N10128 ; LAYER_HEIGHT: 0.2
N10129 G1 F8475
N10130 M204 S8000
N10131 G1 X158.916 Y196.801 E1.03439
N10132 G1 X158.916 Y123.199 E2.36678
N10133 G1 X191.084 Y123.199 E1.03439
N10134 G1 X191.084 Y196.741 E2.36485
N10135 ; COOLING_NODE: 0
N10136 M204 S10000
N10137 G1 X191.491 Y197.208 F60000
N10138 G1 F8475
N10139 M204 S8000
N10140 G1 X158.509 Y197.208 E1.06057
N10141 G1 X158.509 Y122.792 E2.39296
N10142 G1 X191.491 Y122.792 E1.06057
N10143 G1 X191.491 Y197.148 E2.39103
N10144 ; COOLING_NODE: 0
N10145 M204 S10000
N10146 G1 X191.898 Y197.615 F60000
N10147 G1 F8475
N10148 M204 S8000
N10149 G1 X158.102 Y197.615 E1.08675
N10150 G1 X158.102 Y122.385 E2.41914
N10151 G1 X191.898 Y122.385 E1.08675
N10152 G1 X191.898 Y197.555 E2.41721
N10153 ; COOLING_NODE: 0
N10154 M204 S10000
N10155 G1 X192.29 Y198.007 F60000
N10156 ; FEATURE: Outer wall
N10157 ; LINE_WIDTH: 0.42
N10158 G1 F9149.261
N10159 M204 S5000
N10160 G1 X157.71 Y198.007 E1.03002
N10161 G1 X157.71 Y121.993 E2.26421
N10162 G1 X192.29 Y121.993 E1.03002
N10163 G1 X192.29 Y197.947 E2.26243
N10164 G1 E-.8 F1800
N10165 M204 S10000
N10166 G1 X184.748 Y196.774 Z7.8 F60000
N10167 G1 X182.683 Y196.453 Z7.8
N10168 G1 Z7.4
N10169 G1 E.8 F1800
N10170 ; FEATURE: Sparse infill
N10171 ; LINE_WIDTH: 0.45
N10172 G1 F8475
N10173 M204 S8000
N10174 G1 X184.311 Y196.453 E.05236
N10175 G1 X159.264 Y171.406 E1.13901
N10176 G1 X159.264 Y169.633 E.05701
N10177 G1 X190.736 Y161.201 E1.0477
N10178 G1 X190.736 Y162.829 E.05236
N10179 M204 S10000
N10180 G1 X190.736 Y173.799 F60000
N10181 G1 F8475
N10182 M204 S8000
N10183 G1 X190.736 Y175.427 E.05236
N10184 G1 X185.102 Y196.453 E.69996
N10185 G1 X185 Y196.453 E.00326
N10186 G1 X190.736 Y194.916 E.19093
N10187 G1 X190.736 Y191.363 E.11424
N10188 G1 X159.264 Y159.892 E1.43118
N10189 G1 X159.264 Y161.205 E.0422
N10190 G1 X190.736 Y152.772 E1.0477
N10191 G1 X190.736 Y156.822 E.13022
N10192 G1 X159.264 Y125.35 E1.43118
N10193 G1 X159.264 Y127.49 E.06878
N10194 G1 X173.977 Y123.547 E.48981
N10195 G1 X175.606 Y123.547 E.05236
N10196 M204 S10000
N10197 M73 P70 R10
N10198 G1 X164.121 Y123.547 F60000
N10199 G1 F8475
N10200 M204 S8000
N10201 G1 X162.493 Y123.547 E.05236
N10202 G1 X159.264 Y135.595 E.40109
N10203 G1 X159.264 Y135.918 E.01039
N10204 G1 X190.736 Y127.486 E1.04769
N10205 G1 X190.736 Y123.547 E.12665
N10206 G1 X187.779 Y123.547 E.09507
N10207 G1 X168.244 Y196.453 E2.42708
N10208 G1 X166.616 Y196.453 E.05236
N10209 M204 S10000
N10210 G1 X190.736 Y184.859 F60000
N10211 G1 F8475
N10212 M204 S8000
N10213 G1 X190.736 Y186.487 E.05236
N10214 G1 X159.264 Y194.92 E1.0477
N10215 G1 X159.264 Y194.434 E.01562
N10216 G1 X161.283 Y196.453 E.0918
N10217 G1 X159.815 Y196.453 E.0472
N10218 G1 X179.35 Y123.547 E2.42708
N10219 G1 X180.489 Y123.547 E.03662
N10220 G1 X190.736 Y133.794 E.46597
N10221 G1 X190.736 Y135.914 E.0682
N10222 G1 X159.264 Y144.347 E1.0477
N10223 G1 X159.264 Y148.378 E.12963
N10224 G1 X190.736 Y179.849 E1.43118
N10225 G1 X190.736 Y178.058 E.05759
N10226 G1 X159.264 Y186.491 E1.0477
N10227 G1 X159.264 Y182.92 E.11483
N10228 G1 X172.797 Y196.453 E.61541
N10229 G1 X176.673 Y196.453 E.12463
N10230 G1 X190.736 Y143.97 E1.74718
N10231 G1 X190.736 Y144.343 E.01199
N10232 G1 X159.264 Y152.776 E1.0477
N10233 G1 X159.264 Y154.404 E.05236
N10234 M204 S10000
N10235 G1 X159.264 Y138.493 F60000
N10236 G1 F8475
N10237 M204 S8000
N10238 G1 X159.264 Y136.864 E.05236
N10239 G1 X190.736 Y168.336 E1.43118
N10240 G1 X190.736 Y169.63 E.04161
N10241 G1 X159.264 Y178.062 E1.04769
N10242 G1 X159.264 Y176.434 E.05236
N10243 M204 S10000
N10244 G1 X159.264 Y168.68 F60000
N10245 G1 F8475
N10246 M204 S8000
N10247 G1 X159.264 Y167.052 E.05236
N10248 G1 X170.922 Y123.547 E1.44831
N10249 G1 X168.975 Y123.547 E.06259
N10250 G1 X190.736 Y145.308 E.98958
N10251 G1 X190.736 Y146.936 E.05236
N10252 ; WIPE_START
N10253 G1 X190.736 Y145.308 E-.61876
N10254 G1 X190.473 Y145.045 E-.14124
N10255 ; WIPE_END
N10256 G1 E-.04 F1800
N10257 M204 S10000
N10258 G17
N10259 G3 Z7.8 I1.217 J0 P1  F60000
N10260 ; stop printing object, unique label id: 130
N10261 M625
N10262 ; object ids of layer 37 start: 130
N10263 M624 AQAAAAAAAAA=
N10264 ;======== H2D 20250527========
N10265 ; SKIPPABLE_START
N10266 ; SKIPTYPE: timelapse
N10267 M622.1 S1 ; for prev firware, default turned on
N10268 
N10269 M1002 judge_flag timelapse_record_flag
N10270 
N10271 M622 J1
N10272 M993 A2 B2 C2
N10273 M993 A0 B0 C0
N10274 
N10275 
N10276 
N10277 
N10278     M9711 M0 E1 X260 Y137 Z7.8 S11 C10 O0 T3000
N10279 
N10280 
N10281 
N10282 M993 A3 B3 C3
N10283 
N10284 M623
N10285 ; SKIPPABLE_END
N10286 
N10287 ; object ids of this layer37 end: 130
N10288 M625
N10289 ; CHANGE_LAYER
N10290 ; Z_HEIGHT: 7.6
N10291 ; LAYER_HEIGHT: 0.2
N10292 ;======== H2D 20250521========
N10293 ; layer num/total_layer_count: 38/63
N10294 ; update layer progress
N10295 M73 L38
N10296 M991 S0 P37 ;notify layer change
N10297 
N10298 
N10299 ; OBJECT_ID: 130
N10300 ; COOLING_NODE: 0
N10301 ; start printing object, unique label id: 130
N10302 M624 AQAAAAAAAAA=
N10303 G1 X191.084 Y196.801 F60000
N10304 G1 Z7.6
N10305 G1 E.8 F1800
N10306 ; FEATURE: Inner wall
N10307 ; LINE_WIDTH: 0.45
N10308 ; LAYER_HEIGHT: 0.2
N10309 G1 F8475
N10310 M204 S8000
N10311 G1 X158.916 Y196.801 E1.03439
N10312 G1 X158.916 Y123.199 E2.36678
N10313 G1 X191.084 Y123.199 E1.03439
N10314 G1 X191.084 Y196.741 E2.36485
N10315 ; COOLING_NODE: 0
N10316 M204 S10000
N10317 G1 X191.491 Y197.208 F60000
N10318 G1 F8475
N10319 M204 S8000
N10320 G1 X158.509 Y197.208 E1.06057
N10321 M73 P71 R10
N10322 G1 X158.509 Y122.792 E2.39296
N10323 G1 X191.491 Y122.792 E1.06057
N10324 G1 X191.491 Y197.148 E2.39103
N10325 ; COOLING_NODE: 0
N10326 M204 S10000
N10327 G1 X191.898 Y197.615 F60000
N10328 G1 F8475
N10329 M204 S8000
N10330 G1 X158.102 Y197.615 E1.08675
N10331 G1 X158.102 Y122.385 E2.41914
N10332 G1 X191.898 Y122.385 E1.08675
N10333 G1 X191.898 Y197.555 E2.41721
N10334 ; COOLING_NODE: 0
N10335 M204 S10000
N10336 G1 X192.29 Y198.007 F60000
N10337 ; FEATURE: Outer wall
N10338 ; LINE_WIDTH: 0.42
N10339 G1 F9149.261
N10340 M204 S5000
N10341 G1 X157.71 Y198.007 E1.03002
N10342 G1 X157.71 Y121.993 E2.26421
N10343 G1 X192.29 Y121.993 E1.03002
N10344 G1 X192.29 Y197.947 E2.26243
N10345 G1 E-.8 F1800
N10346 M204 S10000
N10347 G1 X185.159 Y196.453 Z8 F60000
N10348 G1 Z7.6
N10349 G1 E.8 F1800
N10350 ; FEATURE: Sparse infill
N10351 ; LINE_WIDTH: 0.45
N10352 G1 F8475
N10353 M204 S8000
N10354 G1 X185.547 Y196.453 E.01247
N10355 G1 X190.736 Y195.062 E.17274
N10356 G1 X190.736 Y191.163 E.12538
N10357 G1 X159.264 Y159.692 E1.43118
N10358 G1 X159.264 Y161.351 E.05334
N10359 G1 X190.736 Y152.918 E1.04769
N10360 G1 X190.736 Y156.622 E.11908
N10361 G1 X159.264 Y125.15 E1.43118
N10362 G1 X159.264 Y127.636 E.07992
N10363 G1 X174.524 Y123.547 E.508
N10364 G1 X176.152 Y123.547 E.05236
N10365 M204 S10000
N10366 G1 X163.975 Y123.547 F60000
N10367 G1 F8475
N10368 M204 S8000
N10369 G1 X162.346 Y123.547 E.05236
N10370 G1 X159.264 Y135.049 E.3829
N10371 G1 X159.264 Y135.861 E.02612
N10372 M204 S10000
N10373 G1 X159.264 Y154.551 F60000
N10374 G1 F8475
N10375 M204 S8000
N10376 G1 X159.264 Y152.922 E.05236
N10377 G1 X190.736 Y144.49 E1.0477
N10378 M204 S10000
N10379 G1 X190.736 Y146.736 F60000
N10380 G1 F8475
N10381 M204 S8000
N10382 G1 X190.736 Y145.108 E.05236
N10383 G1 X169.175 Y123.547 E.98048
N10384 G1 X170.775 Y123.547 E.05145
N10385 G1 X159.264 Y166.506 E1.43012
N10386 G1 X159.264 Y168.134 E.05236
N10387 M204 S10000
N10388 G1 X159.264 Y176.58 F60000
N10389 G1 F8475
N10390 M204 S8000
N10391 G1 X159.264 Y178.209 E.05236
N10392 G1 X190.736 Y169.776 E1.0477
N10393 G1 X190.736 Y168.136 E.05275
N10394 G1 X159.264 Y136.664 E1.43118
N10395 G1 X159.264 Y136.065 E.01929
N10396 G1 X190.736 Y127.632 E1.04769
N10397 G1 X190.736 Y123.547 E.13136
N10398 G1 X187.633 Y123.547 E.09978
N10399 G1 X168.098 Y196.453 E2.42708
N10400 G1 X166.469 Y196.453 E.05236
N10401 M204 S10000
N10402 G1 X190.736 Y162.976 F60000
N10403 G1 F8475
N10404 M204 S8000
N10405 G1 X190.736 Y161.347 E.05236
N10406 G1 X159.264 Y169.78 E1.0477
N10407 G1 X159.264 Y171.206 E.04587
N10408 G1 X184.511 Y196.453 E1.14811
N10409 G1 X184.955 Y196.453 E.01429
N10410 G1 X190.736 Y174.881 E.71815
N10411 G1 X190.736 Y173.252 E.05236
N10412 M204 S10000
N10413 G1 X190.736 Y185.005 F60000
N10414 G1 F8475
N10415 M204 S8000
N10416 G1 X190.736 Y186.634 E.05236
N10417 G1 X159.264 Y195.066 E1.0477
N10418 G1 X159.264 Y194.234 E.02676
N10419 G1 X161.483 Y196.453 E.10089
N10420 G1 X159.669 Y196.453 E.05834
N10421 G1 X179.204 Y123.547 E2.42708
N10422 G1 X180.689 Y123.547 E.04776
N10423 G1 X190.736 Y133.594 E.45688
N10424 G1 X190.736 Y136.061 E.07934
N10425 G1 X159.264 Y144.494 E1.0477
N10426 G1 X159.264 Y148.178 E.11849
N10427 G1 X190.736 Y179.649 E1.43118
N10428 G1 X190.736 Y178.205 E.04645
N10429 G1 X159.264 Y186.637 E1.0477
N10430 G1 X159.264 Y182.72 E.12596
N10431 G1 X172.997 Y196.453 E.6245
N10432 G1 X176.527 Y196.453 E.1135
N10433 G1 X190.736 Y143.424 E1.76537
N10434 G1 X190.736 Y141.796 E.05236
N10435 ; WIPE_START
N10436 G1 X190.736 Y143.424 E-.61876
N10437 G1 X190.639 Y143.783 E-.14124
N10438 ; WIPE_END
N10439 G1 E-.04 F1800
N10440 M204 S10000
N10441 G17
N10442 G3 Z8 I1.217 J0 P1  F60000
N10443 ; stop printing object, unique label id: 130
N10444 M625
N10445 ; object ids of layer 38 start: 130
N10446 M624 AQAAAAAAAAA=
N10447 ;======== H2D 20250527========
N10448 ; SKIPPABLE_START
N10449 ; SKIPTYPE: timelapse
N10450 M622.1 S1 ; for prev firware, default turned on
N10451 
N10452 M1002 judge_flag timelapse_record_flag
N10453 
N10454 M622 J1
N10455 M993 A2 B2 C2
N10456 M993 A0 B0 C0
N10457 
N10458 
N10459 
N10460 
N10461     M9711 M0 E1 X260 Y137 Z8 S11 C10 O0 T3000
N10462 
N10463 
N10464 
N10465 M993 A3 B3 C3
N10466 
N10467 M623
N10468 ; SKIPPABLE_END
N10469 
N10470 ; object ids of this layer38 end: 130
N10471 M625
N10472 ; CHANGE_LAYER
N10473 ; Z_HEIGHT: 7.8
N10474 ; LAYER_HEIGHT: 0.2
N10475 ;======== H2D 20250521========
N10476 ; layer num/total_layer_count: 39/63
N10477 ; update layer progress
N10478 M73 L39
N10479 M991 S0 P38 ;notify layer change
N10480 
N10481 
N10482 ; OBJECT_ID: 130
N10483 ; COOLING_NODE: 0
N10484 ; start printing object, unique label id: 130
N10485 M624 AQAAAAAAAAA=
N10486 G1 X191.084 Y196.801 F60000
N10487 G1 Z7.8
N10488 G1 E.8 F1800
N10489 ; FEATURE: Inner wall
N10490 ; LINE_WIDTH: 0.45
N10491 ; LAYER_HEIGHT: 0.2
N10492 G1 F8475
N10493 M204 S8000
N10494 G1 X158.916 Y196.801 E1.03439
N10495 G1 X158.916 Y123.199 E2.36678
N10496 G1 X191.084 Y123.199 E1.03439
N10497 G1 X191.084 Y196.741 E2.36485
N10498 ; COOLING_NODE: 0
N10499 M204 S10000
N10500 G1 X191.491 Y197.208 F60000
N10501 G1 F8475
N10502 M204 S8000
N10503 G1 X158.509 Y197.208 E1.06057
N10504 G1 X158.509 Y122.792 E2.39296
N10505 G1 X191.491 Y122.792 E1.06057
N10506 G1 X191.491 Y197.148 E2.39103
N10507 ; COOLING_NODE: 0
N10508 M204 S10000
N10509 G1 X191.898 Y197.615 F60000
N10510 G1 F8475
N10511 M204 S8000
N10512 G1 X158.102 Y197.615 E1.08675
N10513 G1 X158.102 Y122.385 E2.41914
N10514 G1 X191.898 Y122.385 E1.08675
N10515 G1 X191.898 Y197.555 E2.41721
N10516 ; COOLING_NODE: 0
N10517 M204 S10000
N10518 G1 X192.29 Y198.007 F60000
N10519 ; FEATURE: Outer wall
N10520 ; LINE_WIDTH: 0.42
N10521 G1 F9149.261
N10522 M204 S5000
N10523 G1 X157.71 Y198.007 E1.03002
N10524 G1 X157.71 Y121.993 E2.26421
N10525 G1 X192.29 Y121.993 E1.03002
N10526 G1 X192.29 Y197.947 E2.26243
N10527 G1 E-.8 F1800
N10528 M204 S10000
N10529 G1 X190.351 Y196.453 Z8.2 F60000
N10530 G1 Z7.8
N10531 G1 E.8 F1800
N10532 ; FEATURE: Sparse infill
N10533 ; LINE_WIDTH: 0.45
N10534 G1 F8475
N10535 M204 S8000
N10536 G1 X190.736 Y196.453 E.01236
N10537 G1 X190.736 Y195.209 E.04
N10538 G1 X186.093 Y196.453 E.15455
N10539 G1 X185.012 Y196.453 E.03475
N10540 M204 S10000
N10541 G1 X190.736 Y172.706 F60000
N10542 G1 F8475
N10543 M204 S8000
N10544 G1 X190.736 Y174.334 E.05236
N10545 G1 X184.809 Y196.453 E.73634
N10546 G1 X184.711 Y196.453 E.00315
N10547 G1 X159.264 Y171.006 E1.1572
N10548 G1 X159.264 Y169.926 E.03473
N10549 G1 X190.736 Y161.494 E1.0477
N10550 G1 X190.736 Y163.122 E.05236
N10551 M204 S10000
N10552 G1 X190.736 Y141.249 F60000
N10553 G1 F8475
N10554 M204 S8000
N10555 G1 X190.736 Y142.878 E.05236
N10556 G1 X176.38 Y196.453 E1.78356
N10557 G1 X173.197 Y196.453 E.10236
N10558 G1 X159.264 Y182.52 E.6336
N10559 G1 X159.264 Y178.355 E.13394
N10560 G1 X190.736 Y169.922 E1.0477
N10561 G1 X190.736 Y167.936 E.06389
N10562 G1 X159.264 Y136.464 E1.43118
N10563 G1 X159.264 Y136.211 E.00815
N10564 G1 X190.736 Y127.778 E1.0477
N10565 G1 X190.736 Y123.547 E.13606
N10566 G1 X187.486 Y123.547 E.10448
N10567 G1 X167.951 Y196.453 E2.42708
N10568 M73 P72 R10
N10569 G1 X166.323 Y196.453 E.05236
N10570 M204 S10000
N10571 G1 X159.264 Y188.412 F60000
N10572 G1 F8475
N10573 M204 S8000
N10574 G1 X159.264 Y186.784 E.05236
N10575 G1 X190.736 Y178.351 E1.0477
N10576 G1 X190.736 Y179.449 E.03532
N10577 G1 X159.264 Y147.978 E1.43118
N10578 G1 X159.264 Y144.64 E.10735
N10579 G1 X190.736 Y136.207 E1.0477
N10580 G1 X190.736 Y133.394 E.09047
N10581 G1 X180.889 Y123.547 E.44778
N10582 G1 X179.058 Y123.547 E.0589
N10583 G1 X159.523 Y196.453 E2.42708
N10584 G1 X161.683 Y196.453 E.06948
N10585 G1 X159.264 Y194.034 E.10999
N10586 G1 X159.264 Y195.213 E.0379
N10587 G1 X190.736 Y186.78 E1.0477
N10588 G1 X190.736 Y190.963 E.13452
N10589 G1 X159.264 Y159.492 E1.43118
N10590 G1 X159.264 Y161.498 E.06448
N10591 G1 X190.736 Y153.065 E1.0477
N10592 G1 X190.736 Y156.422 E.10794
N10593 G1 X159.264 Y124.95 E1.43118
N10594 G1 X159.264 Y127.782 E.09106
N10595 G1 X175.07 Y123.547 E.52619
N10596 G1 X176.699 Y123.547 E.05236
N10597 M204 S10000
N10598 G1 X163.828 Y123.547 F60000
N10599 G1 F8475
N10600 M204 S8000
N10601 G1 X162.2 Y123.547 E.05236
N10602 G1 X159.264 Y134.502 E.36471
N10603 G1 X159.264 Y136.008 E.0484
N10604 M204 S10000
N10605 G1 X159.264 Y154.697 F60000
N10606 G1 F8475
N10607 M204 S8000
N10608 G1 X159.264 Y153.069 E.05236
N10609 G1 X190.736 Y144.636 E1.0477
N10610 G1 X190.736 Y144.908 E.00873
N10611 G1 X169.375 Y123.547 E.97139
N10612 G1 X170.629 Y123.547 E.04031
N10613 G1 X159.264 Y165.959 E1.41193
N10614 G1 X159.264 Y167.587 E.05236
N10615 ; WIPE_START
N10616 G1 X159.264 Y165.959 E-.61876
N10617 G1 X159.361 Y165.6 E-.14124
N10618 ; WIPE_END
N10619 G1 E-.04 F1800
N10620 M204 S10000
N10621 G17
N10622 G3 Z8.2 I1.217 J0 P1  F60000
N10623 ; stop printing object, unique label id: 130
N10624 M625
N10625 ; object ids of layer 39 start: 130
N10626 M624 AQAAAAAAAAA=
N10627 ;======== H2D 20250527========
N10628 ; SKIPPABLE_START
N10629 ; SKIPTYPE: timelapse
N10630 M622.1 S1 ; for prev firware, default turned on
N10631 
N10632 M1002 judge_flag timelapse_record_flag
N10633 
N10634 M622 J1
N10635 M993 A2 B2 C2
N10636 M993 A0 B0 C0
N10637 
N10638 
N10639 
N10640 
N10641     M9711 M0 E1 X260 Y137 Z8.2 S11 C10 O0 T3000
N10642 
N10643 
N10644 
N10645 M993 A3 B3 C3
N10646 
N10647 M623
N10648 ; SKIPPABLE_END
N10649 
N10650 ; object ids of this layer39 end: 130
N10651 M625
N10652 ; CHANGE_LAYER
N10653 ; Z_HEIGHT: 8
N10654 ; LAYER_HEIGHT: 0.2
N10655 ;======== H2D 20250521========
N10656 ; layer num/total_layer_count: 40/63
N10657 ; update layer progress
N10658 M73 L40
N10659 M991 S0 P39 ;notify layer change
N10660 
N10661 
N10662 ; OBJECT_ID: 130
N10663 ; COOLING_NODE: 0
N10664 ; start printing object, unique label id: 130
N10665 M624 AQAAAAAAAAA=
N10666 G1 X191.084 Y196.801 F60000
N10667 G1 Z8
N10668 G1 E.8 F1800
N10669 ; FEATURE: Inner wall
N10670 ; LINE_WIDTH: 0.45
N10671 ; LAYER_HEIGHT: 0.2
N10672 G1 F8475
N10673 M204 S8000
N10674 G1 X158.916 Y196.801 E1.03439
N10675 G1 X158.916 Y123.199 E2.36678
N10676 G1 X191.084 Y123.199 E1.03439
N10677 G1 X191.084 Y196.741 E2.36485
N10678 ; COOLING_NODE: 0
N10679 M204 S10000
N10680 G1 X191.491 Y197.208 F60000
N10681 G1 F8475
N10682 M204 S8000
N10683 G1 X158.509 Y197.208 E1.06057
N10684 G1 X158.509 Y122.792 E2.39296
N10685 G1 X191.491 Y122.792 E1.06057
N10686 G1 X191.491 Y197.148 E2.39103
N10687 ; COOLING_NODE: 0
N10688 M204 S10000
N10689 G1 X191.898 Y197.615 F60000
N10690 G1 F8475
N10691 M204 S8000
N10692 G1 X158.102 Y197.615 E1.08675
N10693 G1 X158.102 Y122.385 E2.41914
N10694 G1 X191.898 Y122.385 E1.08675
N10695 G1 X191.898 Y197.555 E2.41721
N10696 ; COOLING_NODE: 0
N10697 M204 S10000
N10698 G1 X192.29 Y198.007 F60000
N10699 ; FEATURE: Outer wall
N10700 ; LINE_WIDTH: 0.42
N10701 G1 F9149.261
N10702 M204 S5000
N10703 G1 X157.71 Y198.007 E1.03002
N10704 G1 X157.71 Y121.993 E2.26421
N10705 G1 X192.29 Y121.993 E1.03002
N10706 G1 X192.29 Y197.947 E2.26243
N10707 G1 E-.8 F1800
N10708 M204 S10000
N10709 G1 X190.736 Y193.727 Z8.4 F60000
N10710 G1 Z8
N10711 G1 E.8 F1800
N10712 ; FEATURE: Sparse infill
N10713 ; LINE_WIDTH: 0.45
N10714 G1 F8475
N10715 M204 S8000
N10716 G1 X190.736 Y195.355 E.05236
N10717 G1 X186.639 Y196.453 E.13636
N10718 G1 X185.114 Y196.453 E.04904
N10719 M204 S10000
N10720 G1 X190.736 Y172.159 F60000
N10721 G1 F8475
N10722 M204 S8000
N10723 G1 X190.736 Y173.788 E.05236
N10724 G1 X184.662 Y196.453 E.75453
N10725 G1 X184.911 Y196.453 E.00799
N10726 G1 X159.264 Y170.806 E1.1663
N10727 G1 X159.264 Y170.073 E.02359
N10728 G1 X190.736 Y161.64 E1.0477
N10729 G1 X190.736 Y163.268 E.05236
N10730 M204 S10000
N10731 G1 X190.736 Y140.703 F60000
N10732 G1 F8475
N10733 M204 S8000
N10734 G1 X190.736 Y142.331 E.05236
N10735 G1 X176.234 Y196.453 E1.80175
N10736 G1 X173.397 Y196.453 E.09122
N10737 G1 X159.264 Y182.32 E.64269
N10738 G1 X159.264 Y178.502 E.1228
N10739 G1 X190.736 Y170.069 E1.0477
N10740 G1 X190.736 Y167.736 E.07503
N10741 G1 X159.264 Y136.264 E1.43118
N10742 G1 X159.264 Y136.358 E.00299
N10743 G1 X190.736 Y127.925 E1.0477
N10744 G1 X190.736 Y123.547 E.14077
N10745 G1 X187.34 Y123.547 E.10919
N10746 G1 X167.805 Y196.453 E2.42708
N10747 G1 X166.177 Y196.453 E.05236
N10748 M204 S10000
N10749 G1 X159.264 Y188.559 F60000
N10750 G1 F8475
N10751 M204 S8000
N10752 G1 X159.264 Y186.93 E.05236
N10753 G1 X190.736 Y178.498 E1.04769
N10754 G1 X190.736 Y179.249 E.02418
N10755 G1 X159.264 Y147.778 E1.43118
N10756 G1 X159.264 Y144.786 E.09621
N10757 G1 X190.736 Y136.354 E1.0477
N10758 G1 X190.736 Y133.194 E.10161
N10759 G1 X181.089 Y123.547 E.43868
N10760 G1 X178.911 Y123.547 E.07003
N10761 G1 X159.376 Y196.453 E2.42708
N10762 G1 X161.883 Y196.453 E.08062
N10763 G1 X159.264 Y193.834 E.11908
N10764 G1 X159.264 Y195.359 E.04904
N10765 G1 X190.736 Y186.926 E1.0477
N10766 G1 X190.736 Y190.763 E.12338
N10767 G1 X159.264 Y159.292 E1.43118
N10768 G1 X159.264 Y161.644 E.07562
N10769 G1 X190.736 Y153.211 E1.0477
N10770 G1 X190.736 Y156.222 E.0968
N10771 G1 X159.264 Y124.75 E1.43118
N10772 G1 X159.264 Y127.929 E.1022
N10773 G1 X175.617 Y123.547 E.54438
N10774 G1 X177.245 Y123.547 E.05236
N10775 M204 S10000
N10776 G1 X163.682 Y123.547 F60000
N10777 G1 F8475
N10778 M204 S8000
N10779 G1 X162.054 Y123.547 E.05236
N10780 G1 X159.264 Y133.956 E.34652
N10781 G1 X159.264 Y135.584 E.05236
N10782 M204 S10000
N10783 G1 X159.264 Y154.843 F60000
N10784 G1 F8475
N10785 M204 S8000
N10786 G1 X159.264 Y153.215 E.05236
N10787 G1 X190.736 Y144.782 E1.0477
N10788 G1 X190.736 Y144.708 E.00241
N10789 G1 X169.575 Y123.547 E.96229
N10790 G1 X170.482 Y123.547 E.02917
N10791 G1 X159.264 Y165.413 E1.39374
N10792 G1 X159.264 Y167.041 E.05236
N10793 ; WIPE_START
N10794 G1 X159.264 Y165.413 E-.61876
N10795 G1 X159.361 Y165.054 E-.14124
N10796 ; WIPE_END
N10797 G1 E-.04 F1800
N10798 M204 S10000
N10799 G17
N10800 G3 Z8.4 I1.217 J0 P1  F60000
N10801 ; stop printing object, unique label id: 130
N10802 M625
N10803 ; object ids of layer 40 start: 130
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
N10819     M9711 M0 E1 X260 Y137 Z8.4 S11 C10 O0 T3000
N10820 
N10821 
N10822 
N10823 M993 A3 B3 C3
N10824 
N10825 M623
N10826 ; SKIPPABLE_END
N10827 
N10828 ; object ids of this layer40 end: 130
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
N10840 ; OBJECT_ID: 130
N10841 ; COOLING_NODE: 0
N10842 ; start printing object, unique label id: 130
N10843 M624 AQAAAAAAAAA=
N10844 G1 X191.084 Y196.801 F60000
N10845 G1 Z8.2
N10846 G1 E.8 F1800
N10847 ; FEATURE: Inner wall
N10848 ; LINE_WIDTH: 0.45
N10849 ; LAYER_HEIGHT: 0.2
N10850 G1 F8475
N10851 M204 S8000
N10852 G1 X158.916 Y196.801 E1.03439
N10853 G1 X158.916 Y123.199 E2.36678
N10854 G1 X191.084 Y123.199 E1.03439
N10855 G1 X191.084 Y196.741 E2.36485
N10856 ; COOLING_NODE: 0
N10857 M204 S10000
N10858 G1 X191.491 Y197.208 F60000
N10859 G1 F8475
N10860 M204 S8000
N10861 G1 X158.509 Y197.208 E1.06057
N10862 G1 X158.509 Y122.792 E2.39296
N10863 G1 X191.491 Y122.792 E1.06057
N10864 G1 X191.491 Y197.148 E2.39103
N10865 ; COOLING_NODE: 0
N10866 M204 S10000
N10867 G1 X191.898 Y197.615 F60000
N10868 G1 F8475
N10869 M204 S8000
N10870 M73 P73 R10
N10871 G1 X158.102 Y197.615 E1.08675
N10872 G1 X158.102 Y122.385 E2.41914
N10873 G1 X191.898 Y122.385 E1.08675
N10874 G1 X191.898 Y197.555 E2.41721
N10875 ; COOLING_NODE: 0
N10876 M204 S10000
N10877 G1 X192.29 Y198.007 F60000
N10878 ; FEATURE: Outer wall
N10879 ; LINE_WIDTH: 0.42
N10880 G1 F9149.261
N10881 M204 S5000
N10882 G1 X157.71 Y198.007 E1.03002
N10883 G1 X157.71 Y121.993 E2.26421
N10884 G1 X192.29 Y121.993 E1.03002
N10885 G1 X192.29 Y197.947 E2.26243
N10886 G1 E-.8 F1800
N10887 M204 S10000
N10888 G1 X190.736 Y193.873 Z8.6 F60000
N10889 G1 Z8.2
N10890 G1 E.8 F1800
N10891 ; FEATURE: Sparse infill
N10892 ; LINE_WIDTH: 0.45
N10893 G1 F8475
N10894 M204 S8000
N10895 G1 X190.736 Y195.502 E.05236
N10896 G1 X187.186 Y196.453 E.11817
N10897 G1 X185.557 Y196.453 E.05236
N10898 M204 S10000
N10899 G1 X190.736 Y171.613 F60000
N10900 G1 F8475
N10901 M204 S8000
N10902 G1 X190.736 Y173.241 E.05236
N10903 G1 X184.516 Y196.453 E.77272
N10904 G1 X185.111 Y196.453 E.01913
N10905 G1 X159.264 Y170.606 E1.17539
N10906 G1 X159.264 Y170.219 E.01245
N10907 G1 X190.736 Y161.786 E1.04769
N10908 G1 X190.736 Y160.158 E.05236
N10909 M204 S10000
N10910 G1 X190.736 Y140.156 F60000
N10911 G1 F8475
N10912 M204 S8000
N10913 G1 X190.736 Y141.785 E.05236
N10914 G1 X176.087 Y196.453 E1.81994
N10915 G1 X173.597 Y196.453 E.08008
N10916 G1 X159.264 Y182.12 E.65179
N10917 G1 X159.264 Y178.648 E.11166
N10918 G1 X190.736 Y170.215 E1.0477
N10919 G1 X190.736 Y167.536 E.08617
N10920 G1 X159.264 Y136.064 E1.43118
N10921 G1 X159.264 Y136.504 E.01413
N10922 G1 X190.736 Y128.071 E1.0477
N10923 G1 X190.736 Y123.547 E.14548
N10924 G1 X187.193 Y123.547 E.1139
N10925 G1 X167.658 Y196.453 E2.42708
N10926 G1 X169.287 Y196.453 E.05236
N10927 M204 S10000
N10928 G1 X159.264 Y185.448 F60000
N10929 G1 F8475
N10930 M204 S8000
N10931 G1 X159.264 Y187.077 E.05236
N10932 G1 X190.736 Y178.644 E1.0477
N10933 G1 X190.736 Y179.049 E.01304
N10934 G1 X159.264 Y147.578 E1.43118
N10935 G1 X159.264 Y144.933 E.08507
N10936 G1 X190.736 Y136.5 E1.04769
N10937 G1 X190.736 Y132.994 E.11275
N10938 M73 P73 R9
N10939 G1 X181.289 Y123.547 E.42959
N10940 G1 X178.765 Y123.547 E.08117
N10941 G1 X159.264 Y196.323 E2.42276
N10942 G1 X159.264 Y196.453 E.00417
N10943 G1 X162.083 Y196.453 E.09064
N10944 G1 X159.264 Y193.634 E.12818
N10945 G1 X159.264 Y192.006 E.05236
N10946 M204 S10000
N10947 G1 X159.264 Y195.506 F60000
N10948 G1 F8475
N10949 M204 S8000
N10950 G1 X190.736 Y187.073 E1.0477
N10951 G1 X190.736 Y190.563 E.11224
N10952 G1 X159.264 Y159.092 E1.43118
N10953 G1 X159.264 Y161.79 E.08676
N10954 G1 X190.736 Y153.358 E1.0477
N10955 G1 X190.736 Y156.022 E.08566
N10956 G1 X159.264 Y124.551 E1.43118
N10957 G1 X159.264 Y128.075 E.11334
N10958 G1 X176.163 Y123.547 E.56257
N10959 G1 X177.791 Y123.547 E.05236
N10960 M204 S10000
N10961 G1 X163.535 Y123.547 F60000
N10962 G1 F8475
N10963 M204 S8000
N10964 G1 X161.907 Y123.547 E.05236
N10965 G1 X159.264 Y133.41 E.32833
N10966 G1 X159.264 Y135.038 E.05236
N10967 M204 S10000
N10968 G1 X159.264 Y151.733 F60000
N10969 G1 F8475
N10970 M204 S8000
N10971 G1 X159.264 Y153.362 E.05236
N10972 G1 X190.736 Y144.929 E1.0477
N10973 G1 X190.736 Y144.508 E.01355
N10974 G1 X169.775 Y123.547 E.9532
N10975 G1 X170.336 Y123.547 E.01803
N10976 G1 X159.264 Y164.866 E1.37554
N10977 G1 X159.264 Y166.495 E.05236
N10978 ; WIPE_START
N10979 G1 X159.264 Y164.866 E-.61876
N10980 G1 X159.361 Y164.507 E-.14124
N10981 ; WIPE_END
N10982 G1 E-.04 F1800
N10983 M204 S10000
N10984 G17
N10985 G3 Z8.6 I1.217 J0 P1  F60000
N10986 ; stop printing object, unique label id: 130
N10987 M625
N10988 ; object ids of layer 41 start: 130
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
N11004     M9711 M0 E1 X260 Y137 Z8.6 S11 C10 O0 T3000
N11005 
N11006 
N11007 
N11008 M993 A3 B3 C3
N11009 
N11010 M623
N11011 ; SKIPPABLE_END
N11012 
N11013 ; object ids of this layer41 end: 130
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
N11025 ; OBJECT_ID: 130
N11026 ; COOLING_NODE: 0
N11027 ; start printing object, unique label id: 130
N11028 M624 AQAAAAAAAAA=
N11029 G1 X191.084 Y196.801 F60000
N11030 G1 Z8.4
N11031 G1 E.8 F1800
N11032 ; FEATURE: Inner wall
N11033 ; LINE_WIDTH: 0.45
N11034 ; LAYER_HEIGHT: 0.2
N11035 G1 F8475
N11036 M204 S8000
N11037 G1 X158.916 Y196.801 E1.03439
N11038 G1 X158.916 Y123.199 E2.36678
N11039 G1 X191.084 Y123.199 E1.03439
N11040 G1 X191.084 Y196.741 E2.36485
N11041 ; COOLING_NODE: 0
N11042 M204 S10000
N11043 G1 X191.491 Y197.208 F60000
N11044 G1 F8475
N11045 M204 S8000
N11046 G1 X158.509 Y197.208 E1.06057
N11047 G1 X158.509 Y122.792 E2.39296
N11048 G1 X191.491 Y122.792 E1.06057
N11049 G1 X191.491 Y197.148 E2.39103
N11050 ; COOLING_NODE: 0
N11051 M204 S10000
N11052 G1 X191.898 Y197.615 F60000
N11053 G1 F8475
N11054 M204 S8000
N11055 G1 X158.102 Y197.615 E1.08675
N11056 G1 X158.102 Y122.385 E2.41914
N11057 G1 X191.898 Y122.385 E1.08675
N11058 G1 X191.898 Y197.555 E2.41721
N11059 ; COOLING_NODE: 0
N11060 M204 S10000
N11061 G1 X192.29 Y198.007 F60000
N11062 ; FEATURE: Outer wall
N11063 ; LINE_WIDTH: 0.42
N11064 G1 F9149.261
N11065 M204 S5000
N11066 G1 X157.71 Y198.007 E1.03002
N11067 G1 X157.71 Y121.993 E2.26421
N11068 G1 X192.29 Y121.993 E1.03002
N11069 G1 X192.29 Y197.947 E2.26243
N11070 G1 E-.8 F1800
N11071 M204 S10000
N11072 G1 X190.736 Y194.02 Z8.8 F60000
N11073 G1 Z8.4
N11074 G1 E.8 F1800
N11075 ; FEATURE: Sparse infill
N11076 ; LINE_WIDTH: 0.45
N11077 G1 F8475
N11078 M204 S8000
N11079 G1 X190.736 Y195.648 E.05236
N11080 G1 X187.732 Y196.453 E.09998
N11081 G1 X186.104 Y196.453 E.05236
N11082 M204 S10000
N11083 G1 X159.264 Y191.806 F60000
N11084 G1 F8475
N11085 M204 S8000
N11086 G1 X159.264 Y193.434 E.05236
N11087 G1 X162.283 Y196.453 E.13727
N11088 G1 X167.512 Y196.453 E.16815
N11089 G1 X187.047 Y123.547 E2.42708
N11090 G1 X181.489 Y123.547 E.17873
N11091 G1 X190.736 Y132.794 E.42049
N11092 G1 X190.736 Y136.646 E.12389
N11093 G1 X159.264 Y145.079 E1.0477
N11094 G1 X159.264 Y147.378 E.07394
N11095 G1 X190.736 Y178.849 E1.43118
N11096 G1 X190.736 Y178.79 E.0019
N11097 G1 X159.264 Y187.223 E1.0477
N11098 G1 X159.264 Y185.595 E.05236
N11099 M204 S10000
N11100 G1 X159.264 Y165.948 F60000
N11101 G1 F8475
N11102 M204 S8000
N11103 G1 X159.264 Y164.32 E.05236
N11104 G1 X170.189 Y123.547 E1.35735
N11105 G1 X169.975 Y123.547 E.00689
N11106 G1 X190.736 Y144.308 E.9441
N11107 G1 X190.736 Y145.075 E.02468
N11108 G1 X159.264 Y153.508 E1.0477
N11109 G1 X159.264 Y151.88 E.05236
N11110 M204 S10000
N11111 G1 X159.264 Y134.492 F60000
N11112 G1 F8475
N11113 M204 S8000
N11114 G1 X159.264 Y132.863 E.05236
N11115 G1 X161.761 Y123.547 E.31014
N11116 G1 X159.264 Y123.547 E.08027
N11117 G1 X159.264 Y124.351 E.02583
N11118 G1 X190.736 Y155.822 E1.43118
N11119 G1 X190.736 Y153.504 E.07452
N11120 G1 X159.264 Y161.937 E1.0477
N11121 G1 X159.264 Y158.892 E.0979
N11122 G1 X190.736 Y190.363 E1.43118
N11123 G1 X190.736 Y187.219 E.10111
N11124 G1 X159.264 Y195.652 E1.0477
N11125 G1 X159.264 Y195.777 E.00401
N11126 M73 P74 R9
N11127 G1 X178.618 Y123.547 E2.40457
N11128 G1 X176.709 Y123.547 E.06138
N11129 G1 X159.264 Y128.222 E.58076
N11130 G1 X159.264 Y126.593 E.05236
N11131 M204 S10000
N11132 G1 X190.736 Y126.589 F60000
N11133 G1 F8475
N11134 M204 S8000
N11135 G1 X190.736 Y128.218 E.05236
N11136 G1 X159.264 Y136.65 E1.0477
N11137 G1 X159.264 Y135.864 E.02527
N11138 G1 X190.736 Y167.336 E1.43118
N11139 G1 X190.736 Y161.933 E.17373
N11140 G1 X159.264 Y170.366 E1.0477
N11141 G1 X159.264 Y170.406 E.00131
N11142 G1 X185.311 Y196.453 E1.18449
N11143 G1 X184.37 Y196.453 E.03027
N11144 G1 X190.736 Y172.695 E.79091
N11145 G1 X190.736 Y170.362 E.07503
N11146 G1 X159.264 Y178.794 E1.0477
N11147 G1 X159.264 Y181.92 E.10052
N11148 G1 X173.797 Y196.453 E.66088
N11149 G1 X175.941 Y196.453 E.06894
N11150 G1 X190.736 Y141.238 E1.83813
N11151 G1 X190.736 Y139.61 E.05236
N11152 ; WIPE_START
N11153 G1 X190.736 Y141.238 E-.61876
N11154 G1 X190.639 Y141.597 E-.14124
N11155 ; WIPE_END
N11156 G1 E-.04 F1800
N11157 M204 S10000
N11158 G17
N11159 G3 Z8.8 I1.217 J0 P1  F60000
N11160 ; stop printing object, unique label id: 130
N11161 M625
N11162 ; object ids of layer 42 start: 130
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
N11178     M9711 M0 E1 X260 Y137 Z8.8 S11 C10 O0 T3000
N11179 
N11180 
N11181 
N11182 M993 A3 B3 C3
N11183 
N11184 M623
N11185 ; SKIPPABLE_END
N11186 
N11187 ; object ids of this layer42 end: 130
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
N11199 ; OBJECT_ID: 130
N11200 ; COOLING_NODE: 0
N11201 ; start printing object, unique label id: 130
N11202 M624 AQAAAAAAAAA=
N11203 G1 X191.084 Y196.801 F60000
N11204 G1 Z8.6
N11205 G1 E.8 F1800
N11206 ; FEATURE: Inner wall
N11207 ; LINE_WIDTH: 0.45
N11208 ; LAYER_HEIGHT: 0.2
N11209 G1 F8475
N11210 M204 S8000
N11211 G1 X158.916 Y196.801 E1.03439
N11212 G1 X158.916 Y123.199 E2.36678
N11213 G1 X191.084 Y123.199 E1.03439
N11214 G1 X191.084 Y196.741 E2.36485
N11215 ; COOLING_NODE: 0
N11216 M204 S10000
N11217 G1 X191.491 Y197.208 F60000
N11218 G1 F8475
N11219 M204 S8000
N11220 G1 X158.509 Y197.208 E1.06057
N11221 G1 X158.509 Y122.792 E2.39296
N11222 G1 X191.491 Y122.792 E1.06057
N11223 G1 X191.491 Y197.148 E2.39103
N11224 ; COOLING_NODE: 0
N11225 M204 S10000
N11226 G1 X191.898 Y197.615 F60000
N11227 G1 F8475
N11228 M204 S8000
N11229 G1 X158.102 Y197.615 E1.08675
N11230 G1 X158.102 Y122.385 E2.41914
N11231 G1 X191.898 Y122.385 E1.08675
N11232 G1 X191.898 Y197.555 E2.41721
N11233 ; COOLING_NODE: 0
N11234 M204 S10000
N11235 G1 X192.29 Y198.007 F60000
N11236 ; FEATURE: Outer wall
N11237 ; LINE_WIDTH: 0.42
N11238 G1 F9149.261
N11239 M204 S5000
N11240 G1 X157.71 Y198.007 E1.03002
N11241 G1 X157.71 Y121.993 E2.26421
N11242 G1 X192.29 Y121.993 E1.03002
N11243 G1 X192.29 Y197.947 E2.26243
N11244 G1 E-.8 F1800
N11245 M204 S10000
N11246 G1 X190.736 Y194.166 Z9 F60000
N11247 G1 Z8.6
N11248 G1 E.8 F1800
N11249 ; FEATURE: Sparse infill
N11250 ; LINE_WIDTH: 0.45
N11251 G1 F8475
N11252 M204 S8000
N11253 G1 X190.736 Y195.794 E.05236
N11254 G1 X188.279 Y196.453 E.08179
N11255 G1 X186.65 Y196.453 E.05236
N11256 M204 S10000
N11257 G1 X159.264 Y191.606 F60000
N11258 G1 F8475
N11259 M204 S8000
N11260 G1 X159.264 Y193.234 E.05236
N11261 G1 X162.483 Y196.453 E.14637
N11262 G1 X167.366 Y196.453 E.15701
N11263 G1 X186.901 Y123.547 E2.42708
N11264 G1 X181.689 Y123.547 E.16759
N11265 G1 X190.736 Y132.594 E.4114
N11266 G1 X190.736 Y128.364 E.13601
N11267 G1 X159.264 Y136.797 E1.0477
N11268 G1 X159.264 Y135.664 E.03641
N11269 G1 X190.736 Y167.136 E1.43118
N11270 G1 X190.736 Y162.079 E.16259
N11271 G1 X159.264 Y170.512 E1.0477
N11272 G1 X159.264 Y170.206 E.00983
N11273 G1 X185.511 Y196.453 E1.19359
N11274 G1 X184.223 Y196.453 E.04141
N11275 G1 X190.736 Y172.149 E.8091
N11276 G1 X190.736 Y170.508 E.05275
N11277 G1 X159.264 Y178.941 E1.0477
N11278 G1 X159.264 Y181.72 E.08938
N11279 G1 X173.997 Y196.453 E.66998
N11280 G1 X175.794 Y196.453 E.0578
N11281 G1 X190.736 Y140.692 E1.85632
N11282 G1 X190.736 Y136.793 E.12538
N11283 G1 X159.264 Y145.226 E1.0477
N11284 G1 X159.264 Y147.178 E.0628
N11285 G1 X190.736 Y178.649 E1.43118
N11286 G1 X190.736 Y178.937 E.00924
N11287 G1 X159.264 Y187.37 E1.0477
N11288 G1 X159.264 Y185.741 E.05236
N11289 M204 S10000
N11290 G1 X159.264 Y165.402 F60000
N11291 G1 F8475
N11292 M204 S8000
N11293 G1 X159.264 Y163.774 E.05236
N11294 G1 X170.043 Y123.547 E1.33916
N11295 G1 X170.175 Y123.547 E.00424
N11296 G1 X190.736 Y144.108 E.93501
N11297 G1 X190.736 Y145.222 E.03582
N11298 G1 X159.264 Y153.654 E1.0477
N11299 G1 X159.264 Y152.026 E.05236
N11300 M204 S10000
N11301 G1 X159.264 Y133.945 F60000
N11302 G1 F8475
N11303 M204 S8000
N11304 G1 X159.264 Y132.317 E.05236
N11305 G1 X161.614 Y123.547 E.29195
N11306 G1 X159.264 Y123.547 E.07556
N11307 G1 X159.264 Y124.151 E.0194
N11308 G1 X190.736 Y155.622 E1.43118
N11309 G1 X190.736 Y153.65 E.06338
N11310 G1 X159.264 Y162.083 E1.0477
N11311 G1 X159.264 Y158.692 E.10904
N11312 G1 X190.736 Y190.163 E1.43118
N11313 G1 X190.736 Y187.366 E.08997
N11314 G1 X159.264 Y195.798 E1.04769
N11315 G1 X159.264 Y195.23 E.01827
N11316 G1 X178.472 Y123.547 E2.38638
N11317 G1 X177.256 Y123.547 E.0391
N11318 G1 X159.264 Y128.368 E.59895
N11319 G1 X159.264 Y126.74 E.05236
N11320 ; WIPE_START
N11321 G1 X159.264 Y128.368 E-.61876
N11322 G1 X159.623 Y128.272 E-.14124
N11323 ; WIPE_END
N11324 G1 E-.04 F1800
N11325 M204 S10000
N11326 G17
N11327 G3 Z9 I1.217 J0 P1  F60000
N11328 ; stop printing object, unique label id: 130
N11329 M625
N11330 ; object ids of layer 43 start: 130
N11331 M624 AQAAAAAAAAA=
N11332 ;======== H2D 20250527========
N11333 ; SKIPPABLE_START
N11334 ; SKIPTYPE: timelapse
N11335 M622.1 S1 ; for prev firware, default turned on
N11336 
N11337 M1002 judge_flag timelapse_record_flag
N11338 
N11339 M622 J1
N11340 M993 A2 B2 C2
N11341 M993 A0 B0 C0
N11342 
N11343 
N11344 
N11345 
N11346     M9711 M0 E1 X260 Y137 Z9 S11 C10 O0 T3000
N11347 
N11348 
N11349 
N11350 M993 A3 B3 C3
N11351 
N11352 M623
N11353 ; SKIPPABLE_END
N11354 
N11355 ; object ids of this layer43 end: 130
N11356 M625
N11357 ; CHANGE_LAYER
N11358 ; Z_HEIGHT: 8.8
N11359 ; LAYER_HEIGHT: 0.2
N11360 ;======== H2D 20250521========
N11361 ; layer num/total_layer_count: 44/63
N11362 ; update layer progress
N11363 M73 L44
N11364 M991 S0 P43 ;notify layer change
N11365 
N11366 
N11367 ; OBJECT_ID: 130
N11368 ; COOLING_NODE: 0
N11369 ; start printing object, unique label id: 130
N11370 M624 AQAAAAAAAAA=
N11371 G1 X191.084 Y196.801 F60000
N11372 G1 Z8.8
N11373 G1 E.8 F1800
N11374 ; FEATURE: Inner wall
N11375 ; LINE_WIDTH: 0.45
N11376 ; LAYER_HEIGHT: 0.2
N11377 G1 F8475
N11378 M204 S8000
N11379 G1 X158.916 Y196.801 E1.03439
N11380 G1 X158.916 Y123.199 E2.36678
N11381 G1 X191.084 Y123.199 E1.03439
N11382 G1 X191.084 Y196.741 E2.36485
N11383 ; COOLING_NODE: 0
N11384 M204 S10000
N11385 G1 X191.491 Y197.208 F60000
N11386 G1 F8475
N11387 M204 S8000
N11388 G1 X158.509 Y197.208 E1.06057
N11389 G1 X158.509 Y122.792 E2.39296
N11390 G1 X191.491 Y122.792 E1.06057
N11391 G1 X191.491 Y197.148 E2.39103
N11392 ; COOLING_NODE: 0
N11393 M204 S10000
N11394 G1 X191.898 Y197.615 F60000
N11395 G1 F8475
N11396 M204 S8000
N11397 G1 X158.102 Y197.615 E1.08675
N11398 G1 X158.102 Y122.385 E2.41914
N11399 G1 X191.898 Y122.385 E1.08675
N11400 G1 X191.898 Y197.555 E2.41721
N11401 ; COOLING_NODE: 0
N11402 M204 S10000
N11403 G1 X192.29 Y198.007 F60000
N11404 ; FEATURE: Outer wall
N11405 ; LINE_WIDTH: 0.42
N11406 G1 F9149.261
N11407 M204 S5000
N11408 G1 X157.71 Y198.007 E1.03002
N11409 M73 P75 R9
N11410 G1 X157.71 Y121.993 E2.26421
N11411 G1 X192.29 Y121.993 E1.03002
N11412 G1 X192.29 Y197.947 E2.26243
N11413 G1 E-.8 F1800
N11414 M204 S10000
N11415 G1 X190.736 Y194.313 Z9.2 F60000
N11416 G1 Z8.8
N11417 G1 E.8 F1800
N11418 ; FEATURE: Sparse infill
N11419 ; LINE_WIDTH: 0.45
N11420 G1 F8475
N11421 M204 S8000
N11422 G1 X190.736 Y195.941 E.05236
N11423 G1 X188.825 Y196.453 E.0636
N11424 G1 X187.197 Y196.453 E.05236
N11425 M204 S10000
N11426 G1 X159.264 Y191.406 F60000
N11427 G1 F8475
N11428 M204 S8000
N11429 G1 X159.264 Y193.034 E.05236
N11430 G1 X162.683 Y196.453 E.15546
N11431 G1 X167.219 Y196.453 E.14587
N11432 G1 X186.754 Y123.547 E2.42708
N11433 G1 X181.889 Y123.547 E.15645
N11434 G1 X190.736 Y132.394 E.4023
N11435 G1 X190.736 Y128.511 E.12487
N11436 G1 X159.264 Y136.943 E1.0477
N11437 G1 X159.264 Y135.464 E.04755
N11438 G1 X190.736 Y166.936 E1.43118
N11439 G1 X190.736 Y162.226 E.15145
N11440 G1 X159.264 Y170.658 E1.0477
N11441 G1 X159.264 Y170.006 E.02097
N11442 G1 X185.711 Y196.453 E1.20268
N11443 G1 X184.077 Y196.453 E.05255
N11444 G1 X190.736 Y171.602 E.82729
N11445 G1 X190.736 Y170.654 E.03047
N11446 G1 X159.264 Y179.087 E1.04769
N11447 G1 X159.264 Y181.52 E.07824
N11448 G1 X174.197 Y196.453 E.67907
N11449 G1 X175.648 Y196.453 E.04666
N11450 G1 X190.736 Y140.146 E1.87451
N11451 G1 X190.736 Y136.939 E.1031
N11452 G1 X159.264 Y145.372 E1.0477
N11453 G1 X159.264 Y146.978 E.05166
N11454 G1 X190.736 Y178.449 E1.43118
N11455 G1 X190.736 Y179.083 E.02038
N11456 G1 X159.264 Y187.516 E1.0477
N11457 G1 X159.264 Y185.888 E.05236
N11458 M204 S10000
N11459 G1 X159.264 Y133.399 F60000
N11460 G1 F8475
N11461 M204 S8000
N11462 G1 X159.264 Y131.77 E.05236
N11463 G1 X161.468 Y123.547 E.27376
N11464 G1 X159.264 Y123.547 E.07085
N11465 G1 X159.264 Y123.951 E.01297
N11466 G1 X190.736 Y155.422 E1.43118
N11467 G1 X190.736 Y153.797 E.05224
N11468 G1 X159.264 Y162.23 E1.0477
N11469 M204 S10000
N11470 G1 X159.264 Y164.855 F60000
N11471 G1 F8475
N11472 M204 S8000
N11473 G1 X159.264 Y163.227 E.05236
N11474 G1 X169.897 Y123.547 E1.32097
N11475 G1 X170.375 Y123.547 E.01538
N11476 G1 X190.736 Y143.908 E.92591
N11477 G1 X190.736 Y145.368 E.04696
N11478 G1 X159.264 Y153.801 E1.04769
N11479 G1 X159.264 Y158.492 E.15086
N11480 G1 X190.736 Y189.963 E1.43118
N11481 G1 X190.736 Y187.512 E.07883
N11482 G1 X159.264 Y195.945 E1.0477
N11483 G1 X159.264 Y194.684 E.04055
N11484 G1 X178.325 Y123.547 E2.36819
N11485 G1 X177.802 Y123.547 E.01682
N11486 G1 X159.264 Y128.514 E.61714
N11487 G1 X159.264 Y126.886 E.05236
N11488 ; WIPE_START
N11489 G1 X159.264 Y128.514 E-.61876
N11490 G1 X159.623 Y128.418 E-.14124
N11491 ; WIPE_END
N11492 G1 E-.04 F1800
N11493 M204 S10000
N11494 G17
N11495 G3 Z9.2 I1.217 J0 P1  F60000
N11496 ; stop printing object, unique label id: 130
N11497 M625
N11498 ; object ids of layer 44 start: 130
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
N11514     M9711 M0 E1 X260 Y137 Z9.2 S11 C10 O0 T3000
N11515 
N11516 
N11517 
N11518 M993 A3 B3 C3
N11519 
N11520 M623
N11521 ; SKIPPABLE_END
N11522 
N11523 ; object ids of this layer44 end: 130
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
N11535 ; OBJECT_ID: 130
N11536 ; COOLING_NODE: 0
N11537 ; start printing object, unique label id: 130
N11538 M624 AQAAAAAAAAA=
N11539 G1 X191.084 Y196.801 F60000
N11540 G1 Z9
N11541 G1 E.8 F1800
N11542 ; FEATURE: Inner wall
N11543 ; LINE_WIDTH: 0.45
N11544 ; LAYER_HEIGHT: 0.2
N11545 G1 F8475
N11546 M204 S8000
N11547 G1 X158.916 Y196.801 E1.03439
N11548 G1 X158.916 Y123.199 E2.36678
N11549 G1 X191.084 Y123.199 E1.03439
N11550 G1 X191.084 Y196.741 E2.36485
N11551 ; COOLING_NODE: 0
N11552 M204 S10000
N11553 G1 X191.491 Y197.208 F60000
N11554 G1 F8475
N11555 M204 S8000
N11556 G1 X158.509 Y197.208 E1.06057
N11557 G1 X158.509 Y122.792 E2.39296
N11558 G1 X191.491 Y122.792 E1.06057
N11559 G1 X191.491 Y197.148 E2.39103
N11560 ; COOLING_NODE: 0
N11561 M204 S10000
N11562 G1 X191.898 Y197.615 F60000
N11563 G1 F8475
N11564 M204 S8000
N11565 G1 X158.102 Y197.615 E1.08675
N11566 G1 X158.102 Y122.385 E2.41914
N11567 G1 X191.898 Y122.385 E1.08675
N11568 G1 X191.898 Y197.555 E2.41721
N11569 ; COOLING_NODE: 0
N11570 M204 S10000
N11571 G1 X192.29 Y198.007 F60000
N11572 ; FEATURE: Outer wall
N11573 ; LINE_WIDTH: 0.42
N11574 G1 F9149.261
N11575 M204 S5000
N11576 G1 X157.71 Y198.007 E1.03002
N11577 G1 X157.71 Y121.993 E2.26421
N11578 G1 X192.29 Y121.993 E1.03002
N11579 G1 X192.29 Y197.947 E2.26243
N11580 G1 E-.8 F1800
N11581 M204 S10000
N11582 G1 X190.736 Y194.459 Z9.4 F60000
N11583 G1 Z9
N11584 G1 E.8 F1800
N11585 ; FEATURE: Sparse infill
N11586 ; LINE_WIDTH: 0.45
N11587 G1 F8475
N11588 M204 S8000
N11589 G1 X190.736 Y196.087 E.05236
N11590 G1 X189.371 Y196.453 E.04541
N11591 G1 X187.743 Y196.453 E.05236
N11592 M204 S10000
N11593 G1 X159.264 Y191.206 F60000
N11594 G1 F8475
N11595 M204 S8000
N11596 G1 X159.264 Y192.834 E.05236
N11597 G1 X162.883 Y196.453 E.16456
N11598 G1 X167.073 Y196.453 E.13473
N11599 G1 X186.608 Y123.547 E2.42708
N11600 G1 X182.089 Y123.547 E.14531
N11601 G1 X190.736 Y132.194 E.39321
N11602 G1 X190.736 Y128.657 E.11373
N11603 G1 X159.264 Y137.09 E1.04769
N11604 G1 X159.264 Y135.264 E.05869
N11605 G1 X190.736 Y166.736 E1.43118
N11606 G1 X190.736 Y162.372 E.14031
N11607 G1 X159.264 Y170.805 E1.0477
N11608 G1 X159.264 Y169.806 E.03211
N11609 G1 X185.911 Y196.453 E1.21178
N11610 G1 X183.93 Y196.453 E.06369
N11611 G1 X190.736 Y171.056 E.84549
N11612 G1 X190.736 Y170.801 E.00819
N11613 G1 X159.264 Y179.234 E1.04769
N11614 G1 X159.264 Y181.32 E.0671
N11615 G1 X174.397 Y196.453 E.68817
N11616 G1 X175.502 Y196.453 E.03552
N11617 G1 X190.736 Y139.599 E1.8927
N11618 G1 X190.736 Y137.086 E.08082
N11619 G1 X159.264 Y145.518 E1.0477
N11620 G1 X159.264 Y146.778 E.04052
N11621 G1 X190.736 Y178.249 E1.43118
N11622 G1 X190.736 Y179.23 E.03152
N11623 G1 X159.264 Y187.662 E1.0477
N11624 G1 X159.264 Y186.034 E.05236
N11625 M204 S10000
N11626 G1 X159.264 Y132.852 F60000
N11627 G1 F8475
N11628 M204 S8000
N11629 G1 X159.264 Y131.224 E.05236
N11630 G1 X161.321 Y123.547 E.25557
N11631 G1 X159.264 Y123.547 E.06615
N11632 G1 X159.264 Y123.75 E.00654
N11633 G1 X190.736 Y155.222 E1.43118
N11634 G1 X190.736 Y153.943 E.0411
N11635 G1 X159.264 Y162.376 E1.0477
N11636 G1 X159.264 Y162.681 E.0098
N11637 G1 X169.75 Y123.547 E1.30278
N11638 G1 X170.575 Y123.547 E.02652
N11639 G1 X190.736 Y143.708 E.91682
N11640 G1 X190.736 Y145.515 E.0581
N11641 G1 X159.264 Y153.947 E1.0477
N11642 G1 X159.264 Y158.292 E.13972
N11643 G1 X190.736 Y189.763 E1.43118
N11644 G1 X190.736 Y187.658 E.06769
N11645 M73 P76 R9
N11646 G1 X159.264 Y196.091 E1.0477
N11647 G1 X159.264 Y194.137 E.06283
N11648 M73 P76 R8
N11649 G1 X178.179 Y123.547 E2.35
N11650 G1 X178.349 Y123.547 E.00546
N11651 G1 X159.264 Y128.661 E.63533
N11652 G1 X159.264 Y127.032 E.05236
N11653 ; WIPE_START
N11654 G1 X159.264 Y128.661 E-.61876
N11655 G1 X159.623 Y128.565 E-.14124
N11656 ; WIPE_END
N11657 G1 E-.04 F1800
N11658 M204 S10000
N11659 G17
N11660 G3 Z9.4 I1.217 J0 P1  F60000
N11661 ; stop printing object, unique label id: 130
N11662 M625
N11663 ; object ids of layer 45 start: 130
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
N11679     M9711 M0 E1 X260 Y137 Z9.4 S11 C10 O0 T3000
N11680 
N11681 
N11682 
N11683 M993 A3 B3 C3
N11684 
N11685 M623
N11686 ; SKIPPABLE_END
N11687 
N11688 ; object ids of this layer45 end: 130
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
N11700 ; OBJECT_ID: 130
N11701 ; COOLING_NODE: 0
N11702 ; start printing object, unique label id: 130
N11703 M624 AQAAAAAAAAA=
N11704 G1 X191.084 Y196.801 F60000
N11705 G1 Z9.2
N11706 G1 E.8 F1800
N11707 ; FEATURE: Inner wall
N11708 ; LINE_WIDTH: 0.45
N11709 ; LAYER_HEIGHT: 0.2
N11710 G1 F8475
N11711 M204 S8000
N11712 G1 X158.916 Y196.801 E1.03439
N11713 G1 X158.916 Y123.199 E2.36678
N11714 G1 X191.084 Y123.199 E1.03439
N11715 G1 X191.084 Y196.741 E2.36485
N11716 ; COOLING_NODE: 0
N11717 M204 S10000
N11718 G1 X191.491 Y197.208 F60000
N11719 G1 F8475
N11720 M204 S8000
N11721 G1 X158.509 Y197.208 E1.06057
N11722 G1 X158.509 Y122.792 E2.39296
N11723 G1 X191.491 Y122.792 E1.06057
N11724 G1 X191.491 Y197.148 E2.39103
N11725 ; COOLING_NODE: 0
N11726 M204 S10000
N11727 G1 X191.898 Y197.615 F60000
N11728 G1 F8475
N11729 M204 S8000
N11730 G1 X158.102 Y197.615 E1.08675
N11731 G1 X158.102 Y122.385 E2.41914
N11732 G1 X191.898 Y122.385 E1.08675
N11733 G1 X191.898 Y197.555 E2.41721
N11734 ; COOLING_NODE: 0
N11735 M204 S10000
N11736 G1 X192.29 Y198.007 F60000
N11737 ; FEATURE: Outer wall
N11738 ; LINE_WIDTH: 0.42
N11739 G1 F9149.261
N11740 M204 S5000
N11741 G1 X157.71 Y198.007 E1.03002
N11742 G1 X157.71 Y121.993 E2.26421
N11743 G1 X192.29 Y121.993 E1.03002
N11744 G1 X192.29 Y197.947 E2.26243
N11745 G1 E-.8 F1800
N11746 M204 S10000
N11747 G1 X190.736 Y194.605 Z9.6 F60000
N11748 G1 Z9.2
N11749 G1 E.8 F1800
N11750 ; FEATURE: Sparse infill
N11751 ; LINE_WIDTH: 0.45
N11752 G1 F8475
N11753 M204 S8000
N11754 G1 X190.736 Y196.234 E.05236
N11755 G1 X189.918 Y196.453 E.02722
N11756 G1 X188.29 Y196.453 E.05236
N11757 M204 S10000
N11758 G1 X190.736 Y170.947 F60000
N11759 G1 F8475
N11760 M204 S8000
N11761 G1 X159.264 Y179.38 E1.0477
N11762 G1 X159.264 Y181.12 E.05596
N11763 G1 X174.597 Y196.453 E.69726
N11764 G1 X175.355 Y196.453 E.02438
N11765 G1 X190.736 Y139.053 E1.91089
N11766 G1 X190.736 Y137.232 E.05854
N11767 G1 X159.264 Y145.665 E1.0477
N11768 G1 X159.264 Y146.578 E.02938
N11769 G1 X190.736 Y178.049 E1.43118
N11770 G1 X190.736 Y179.376 E.04266
N11771 G1 X159.264 Y187.809 E1.0477
N11772 G1 X159.264 Y186.18 E.05236
N11773 M204 S10000
N11774 G1 X159.264 Y192.634 F60000
N11775 G1 F8475
N11776 M204 S8000
N11777 G1 X163.083 Y196.453 E.17366
N11778 G1 X166.926 Y196.453 E.12359
N11779 G1 X186.461 Y123.547 E2.42708
N11780 G1 X188.09 Y123.547 E.05236
N11781 M204 S10000
N11782 G1 X178.033 Y123.547 F60000
N11783 G1 F8475
N11784 M204 S8000
N11785 G1 X159.264 Y193.591 E2.33181
N11786 G1 X159.264 Y196.238 E.08511
N11787 G1 X190.736 Y187.805 E1.0477
N11788 G1 X190.736 Y189.563 E.05655
N11789 G1 X159.264 Y158.092 E1.43118
N11790 G1 X159.264 Y154.094 E.12859
N11791 G1 X190.736 Y145.661 E1.0477
N11792 G1 X190.736 Y143.508 E.06924
N11793 G1 X170.775 Y123.547 E.90772
N11794 G1 X169.604 Y123.547 E.03766
N11795 G1 X159.264 Y162.134 E1.28459
N11796 G1 X159.264 Y162.522 E.01248
N11797 G1 X190.736 Y154.09 E1.0477
N11798 G1 X190.736 Y155.022 E.02996
N11799 G1 X159.264 Y123.55 E1.43118
N11800 G1 X161.175 Y123.547 E.06144
N11801 G1 X159.264 Y130.678 E.23738
N11802 G1 X159.264 Y132.306 E.05236
N11803 M204 S10000
N11804 G1 X159.264 Y127.179 F60000
N11805 G1 F8475
N11806 M204 S8000
N11807 G1 X159.264 Y128.807 E.05236
N11808 G1 X178.895 Y123.547 E.65352
N11809 G1 X182.289 Y123.547 E.10913
N11810 G1 X190.736 Y131.994 E.38411
N11811 G1 X190.736 Y128.803 E.10259
N11812 G1 X159.264 Y137.236 E1.04769
N11813 G1 X159.264 Y135.064 E.06983
N11814 G1 X190.736 Y166.536 E1.43118
N11815 G1 X190.736 Y170.509 E.12778
N11816 G1 X183.784 Y196.453 E.86368
N11817 G1 X186.111 Y196.453 E.07483
N11818 G1 X159.264 Y169.606 E1.22087
N11819 G1 X159.264 Y170.951 E.04325
N11820 G1 X190.736 Y162.519 E1.0477
N11821 G1 X190.736 Y160.89 E.05236
N11822 ; WIPE_START
N11823 G1 X190.736 Y162.519 E-.61876
N11824 G1 X190.377 Y162.615 E-.14124
N11825 ; WIPE_END
N11826 G1 E-.04 F1800
N11827 M204 S10000
N11828 G17
N11829 G3 Z9.6 I1.217 J0 P1  F60000
N11830 ; stop printing object, unique label id: 130
N11831 M625
N11832 ; object ids of layer 46 start: 130
N11833 M624 AQAAAAAAAAA=
N11834 ;======== H2D 20250527========
N11835 ; SKIPPABLE_START
N11836 ; SKIPTYPE: timelapse
N11837 M622.1 S1 ; for prev firware, default turned on
N11838 
N11839 M1002 judge_flag timelapse_record_flag
N11840 
N11841 M622 J1
N11842 M993 A2 B2 C2
N11843 M993 A0 B0 C0
N11844 
N11845 
N11846 
N11847 
N11848     M9711 M0 E1 X260 Y137 Z9.6 S11 C10 O0 T3000
N11849 
N11850 
N11851 
N11852 M993 A3 B3 C3
N11853 
N11854 M623
N11855 ; SKIPPABLE_END
N11856 
N11857 ; object ids of this layer46 end: 130
N11858 M625
N11859 ; CHANGE_LAYER
N11860 ; Z_HEIGHT: 9.4
N11861 ; LAYER_HEIGHT: 0.2
N11862 ;======== H2D 20250521========
N11863 ; layer num/total_layer_count: 47/63
N11864 ; update layer progress
N11865 M73 L47
N11866 M991 S0 P46 ;notify layer change
N11867 
N11868 
N11869 ; OBJECT_ID: 130
N11870 ; COOLING_NODE: 0
N11871 ; start printing object, unique label id: 130
N11872 M624 AQAAAAAAAAA=
N11873 G1 X191.084 Y196.801 F60000
N11874 G1 Z9.4
N11875 G1 E.8 F1800
N11876 ; FEATURE: Inner wall
N11877 ; LINE_WIDTH: 0.45
N11878 ; LAYER_HEIGHT: 0.2
N11879 G1 F8475
N11880 M204 S8000
N11881 G1 X158.916 Y196.801 E1.03439
N11882 G1 X158.916 Y123.199 E2.36678
N11883 G1 X191.084 Y123.199 E1.03439
N11884 G1 X191.084 Y196.741 E2.36485
N11885 ; COOLING_NODE: 0
N11886 M204 S10000
N11887 G1 X191.491 Y197.208 F60000
N11888 G1 F8475
N11889 M204 S8000
N11890 G1 X158.509 Y197.208 E1.06057
N11891 G1 X158.509 Y122.792 E2.39296
N11892 G1 X191.491 Y122.792 E1.06057
N11893 G1 X191.491 Y197.148 E2.39103
N11894 ; COOLING_NODE: 0
N11895 M204 S10000
N11896 G1 X191.898 Y197.615 F60000
N11897 G1 F8475
N11898 M204 S8000
N11899 G1 X158.102 Y197.615 E1.08675
N11900 G1 X158.102 Y122.385 E2.41914
N11901 G1 X191.898 Y122.385 E1.08675
N11902 G1 X191.898 Y197.555 E2.41721
N11903 ; COOLING_NODE: 0
N11904 M204 S10000
N11905 G1 X192.29 Y198.007 F60000
N11906 ; FEATURE: Outer wall
N11907 ; LINE_WIDTH: 0.42
N11908 G1 F9149.261
N11909 M204 S5000
N11910 G1 X157.71 Y198.007 E1.03002
N11911 G1 X157.71 Y121.993 E2.26421
N11912 G1 X192.29 Y121.993 E1.03002
N11913 G1 X192.29 Y197.947 E2.26243
N11914 G1 E-.8 F1800
N11915 M204 S10000
N11916 G1 X191.849 Y190.328 Z9.8 F60000
N11917 G1 X190.736 Y171.094 Z9.8
N11918 G1 Z9.4
N11919 G1 E.8 F1800
N11920 ; FEATURE: Sparse infill
N11921 ; LINE_WIDTH: 0.45
N11922 G1 F8475
N11923 M204 S8000
N11924 M73 P77 R8
N11925 G1 X159.264 Y179.526 E1.0477
N11926 G1 X159.264 Y180.92 E.04482
N11927 G1 X174.797 Y196.453 E.70636
N11928 G1 X175.209 Y196.453 E.01324
N11929 G1 X190.736 Y138.506 E1.92908
N11930 G1 X190.736 Y137.379 E.03626
N11931 G1 X159.264 Y145.811 E1.0477
N11932 G1 X159.264 Y146.378 E.01824
N11933 G1 X190.736 Y177.849 E1.43118
N11934 G1 X190.736 Y179.523 E.0538
N11935 G1 X159.264 Y187.955 E1.0477
N11936 G1 X159.264 Y186.327 E.05236
N11937 M204 S10000
N11938 G1 X159.264 Y192.434 F60000
N11939 G1 F8475
N11940 M204 S8000
N11941 G1 X163.283 Y196.453 E.18275
N11942 G1 X166.78 Y196.453 E.11245
N11943 G1 X186.315 Y123.547 E2.42708
N11944 G1 X187.943 Y123.547 E.05236
N11945 M204 S10000
N11946 G1 X176.258 Y123.547 F60000
N11947 G1 F8475
N11948 M204 S8000
N11949 G1 X177.886 Y123.547 E.05236
N11950 G1 X159.264 Y193.045 E2.31362
N11951 G1 X159.264 Y196.384 E.10738
N11952 G1 X190.736 Y187.951 E1.0477
N11953 G1 X190.736 Y189.363 E.04541
N11954 G1 X159.264 Y157.892 E1.43118
N11955 G1 X159.264 Y154.24 E.11745
N11956 G1 X190.736 Y145.807 E1.0477
N11957 G1 X190.736 Y143.308 E.08038
N11958 G1 X170.975 Y123.547 E.89863
N11959 G1 X169.457 Y123.547 E.0488
N11960 G1 X159.264 Y161.588 E1.2664
N11961 G1 X159.264 Y162.669 E.03476
N11962 G1 X190.736 Y154.236 E1.0477
N11963 G1 X190.736 Y154.822 E.01883
N11964 G1 X159.461 Y123.547 E1.42223
N11965 G1 X161.029 Y123.547 E.05041
N11966 G1 X159.264 Y130.131 E.21919
N11967 G1 X159.264 Y131.76 E.05236
N11968 M204 S10000
N11969 G1 X159.264 Y128.954 F60000
N11970 G1 F8475
N11971 M204 S8000
N11972 G1 X179.442 Y123.547 E.67171
N11973 G1 X182.489 Y123.547 E.098
N11974 G1 X190.736 Y131.794 E.37502
N11975 G1 X190.736 Y128.95 E.09145
N11976 G1 X159.264 Y137.382 E1.0477
N11977 G1 X159.264 Y134.864 E.08097
N11978 G1 X190.736 Y166.336 E1.43118
N11979 G1 X190.736 Y169.963 E.11664
N11980 G1 X183.638 Y196.453 E.88187
N11981 G1 X186.311 Y196.453 E.08597
N11982 G1 X159.264 Y169.406 E1.22997
N11983 G1 X159.264 Y171.098 E.05439
N11984 G1 X190.736 Y162.665 E1.0477
N11985 G1 X190.736 Y161.037 E.05236
N11986 ; WIPE_START
N11987 G1 X190.736 Y162.665 E-.61876
N11988 G1 X190.377 Y162.761 E-.14124
N11989 ; WIPE_END
N11990 G1 E-.04 F1800
N11991 M204 S10000
N11992 G17
N11993 G3 Z9.8 I1.217 J0 P1  F60000
N11994 ; stop printing object, unique label id: 130
N11995 M625
N11996 ; object ids of layer 47 start: 130
N11997 M624 AQAAAAAAAAA=
N11998 ;======== H2D 20250527========
N11999 ; SKIPPABLE_START
N12000 ; SKIPTYPE: timelapse
N12001 M622.1 S1 ; for prev firware, default turned on
N12002 
N12003 M1002 judge_flag timelapse_record_flag
N12004 
N12005 M622 J1
N12006 M993 A2 B2 C2
N12007 M993 A0 B0 C0
N12008 
N12009 
N12010 
N12011 
N12012     M9711 M0 E1 X260 Y137 Z9.8 S11 C10 O0 T3000
N12013 
N12014 
N12015 
N12016 M993 A3 B3 C3
N12017 
N12018 M623
N12019 ; SKIPPABLE_END
N12020 
N12021 ; object ids of this layer47 end: 130
N12022 M625
N12023 ; CHANGE_LAYER
N12024 ; Z_HEIGHT: 9.6
N12025 ; LAYER_HEIGHT: 0.200001
N12026 ;======== H2D 20250521========
N12027 ; layer num/total_layer_count: 48/63
N12028 ; update layer progress
N12029 M73 L48
N12030 M991 S0 P47 ;notify layer change
N12031 
N12032 
N12033 ; OBJECT_ID: 130
N12034 ; COOLING_NODE: 0
N12035 ; start printing object, unique label id: 130
N12036 M624 AQAAAAAAAAA=
N12037 G1 X191.084 Y196.801 F60000
N12038 G1 Z9.6
N12039 G1 E.8 F1800
N12040 ; FEATURE: Inner wall
N12041 ; LINE_WIDTH: 0.45
N12042 ; LAYER_HEIGHT: 0.2
N12043 G1 F8475
N12044 M204 S8000
N12045 G1 X158.916 Y196.801 E1.03439
N12046 G1 X158.916 Y123.199 E2.36678
N12047 G1 X191.084 Y123.199 E1.03439
N12048 G1 X191.084 Y196.741 E2.36485
N12049 ; COOLING_NODE: 0
N12050 M204 S10000
N12051 G1 X191.491 Y197.208 F60000
N12052 G1 F8475
N12053 M204 S8000
N12054 G1 X158.509 Y197.208 E1.06057
N12055 G1 X158.509 Y122.792 E2.39296
N12056 G1 X191.491 Y122.792 E1.06057
N12057 G1 X191.491 Y197.148 E2.39103
N12058 ; COOLING_NODE: 0
N12059 M204 S10000
N12060 G1 X191.898 Y197.615 F60000
N12061 G1 F8475
N12062 M204 S8000
N12063 G1 X158.102 Y197.615 E1.08675
N12064 G1 X158.102 Y122.385 E2.41914
N12065 G1 X191.898 Y122.385 E1.08675
N12066 G1 X191.898 Y197.555 E2.41721
N12067 ; COOLING_NODE: 0
N12068 M204 S10000
N12069 G1 X192.29 Y198.007 F60000
N12070 ; FEATURE: Outer wall
N12071 ; LINE_WIDTH: 0.42
N12072 G1 F9149.261
N12073 M204 S5000
N12074 G1 X157.71 Y198.007 E1.03002
N12075 G1 X157.71 Y121.993 E2.26421
N12076 G1 X192.29 Y121.993 E1.03002
N12077 G1 X192.29 Y197.947 E2.26243
N12078 G1 E-.8 F1800
N12079 M204 S10000
N12080 G1 X191.818 Y190.329 Z10 F60000
N12081 G1 X190.736 Y172.868 Z10
N12082 G1 Z9.6
N12083 G1 E.8 F1800
N12084 ; FEATURE: Sparse infill
N12085 ; LINE_WIDTH: 0.45
N12086 G1 F8475
N12087 M204 S8000
N12088 G1 X190.736 Y171.24 E.05236
N12089 G1 X159.264 Y179.673 E1.0477
N12090 G1 X159.264 Y180.72 E.03368
N12091 G1 X174.997 Y196.453 E.71545
N12092 G1 X175.062 Y196.453 E.0021
N12093 G1 X190.736 Y137.96 E1.94727
N12094 G1 X190.736 Y137.525 E.01398
N12095 G1 X159.264 Y145.958 E1.04769
N12096 G1 X159.264 Y146.178 E.0071
N12097 G1 X190.736 Y177.649 E1.43118
N12098 G1 X190.736 Y179.669 E.06494
N12099 G1 X159.264 Y188.102 E1.04769
N12100 G1 X159.264 Y186.473 E.05236
N12101 M204 S10000
N12102 G1 X159.264 Y195.114 F60000
N12103 G1 F8475
N12104 M204 S8000
N12105 G1 X159.264 Y196.453 E.04305
N12106 G1 X159.554 Y196.453 E.00931
N12107 G1 X190.736 Y188.098 E1.03806
N12108 G1 X190.736 Y189.163 E.03427
N12109 G1 X159.264 Y157.692 E1.43118
N12110 G1 X159.264 Y154.386 E.10631
N12111 G1 X190.736 Y145.954 E1.0477
N12112 G1 X190.736 Y143.108 E.09152
N12113 G1 X171.175 Y123.547 E.88953
N12114 G1 X169.311 Y123.547 E.05994
N12115 G1 X159.264 Y161.041 E1.24821
N12116 G1 X159.264 Y162.815 E.05704
N12117 G1 X190.736 Y154.383 E1.04769
N12118 G1 X190.736 Y154.622 E.00769
N12119 G1 X159.661 Y123.547 E1.41314
N12120 G1 X160.882 Y123.547 E.03927
N12121 G1 X159.264 Y129.585 E.201
N12122 G1 X159.264 Y131.213 E.05236
N12123 M204 S10000
N12124 G1 X159.264 Y129.1 F60000
N12125 G1 F8475
N12126 M204 S8000
N12127 G1 X179.988 Y123.547 E.6899
N12128 G1 X182.689 Y123.547 E.08686
N12129 G1 X190.736 Y131.594 E.36592
N12130 G1 X190.736 Y129.096 E.08031
N12131 G1 X159.264 Y137.529 E1.0477
N12132 G1 X159.264 Y134.664 E.09211
N12133 G1 X190.736 Y166.136 E1.43118
N12134 G1 X190.736 Y169.417 E.10551
N12135 G1 X183.491 Y196.453 E.90006
N12136 G1 X186.511 Y196.453 E.0971
N12137 G1 X159.264 Y169.206 E1.23906
N12138 G1 X159.264 Y171.244 E.06553
N12139 G1 X190.736 Y162.811 E1.0477
N12140 G1 X190.736 Y161.183 E.05236
N12141 M204 S10000
N12142 G1 X187.797 Y123.547 F60000
N12143 G1 F8475
N12144 M204 S8000
N12145 G1 X186.169 Y123.547 E.05236
N12146 G1 X166.634 Y196.453 E2.42708
N12147 G1 X163.483 Y196.453 E.10131
N12148 G1 X159.264 Y192.234 E.19185
N12149 G1 X159.264 Y192.498 E.00849
N12150 G1 X177.74 Y123.547 E2.29543
N12151 G1 X176.112 Y123.547 E.05236
N12152 ; WIPE_START
N12153 G1 X177.74 Y123.547 E-.61876
N12154 G1 X177.644 Y123.906 E-.14124
N12155 ; WIPE_END
N12156 G1 E-.04 F1800
N12157 M204 S10000
N12158 G17
N12159 G3 Z10 I1.217 J0 P1  F60000
N12160 ; stop printing object, unique label id: 130
N12161 M625
N12162 ; object ids of layer 48 start: 130
N12163 M624 AQAAAAAAAAA=
N12164 ;======== H2D 20250527========
N12165 ; SKIPPABLE_START
N12166 ; SKIPTYPE: timelapse
N12167 M622.1 S1 ; for prev firware, default turned on
N12168 
N12169 M1002 judge_flag timelapse_record_flag
N12170 
N12171 M622 J1
N12172 M993 A2 B2 C2
N12173 M993 A0 B0 C0
N12174 
N12175 
N12176 
N12177 
N12178     M9711 M0 E1 X260 Y137 Z10 S11 C10 O0 T3000
N12179 
N12180 
N12181 
N12182 M993 A3 B3 C3
N12183 
N12184 M623
N12185 ; SKIPPABLE_END
N12186 
N12187 ; object ids of this layer48 end: 130
N12188 M625
N12189 ; CHANGE_LAYER
N12190 ; Z_HEIGHT: 9.8
N12191 ; LAYER_HEIGHT: 0.2
N12192 ;======== H2D 20250521========
N12193 ; layer num/total_layer_count: 49/63
N12194 ; update layer progress
N12195 M73 L49
N12196 M991 S0 P48 ;notify layer change
N12197 
N12198 
N12199 ; OBJECT_ID: 130
N12200 ; COOLING_NODE: 0
N12201 ; start printing object, unique label id: 130
N12202 M624 AQAAAAAAAAA=
N12203 G1 X191.084 Y196.801 F60000
N12204 G1 Z9.8
N12205 G1 E.8 F1800
N12206 ; FEATURE: Inner wall
N12207 ; LINE_WIDTH: 0.45
N12208 ; LAYER_HEIGHT: 0.2
N12209 G1 F8475
N12210 M204 S8000
N12211 G1 X158.916 Y196.801 E1.03439
N12212 G1 X158.916 Y123.199 E2.36678
N12213 G1 X191.084 Y123.199 E1.03439
N12214 G1 X191.084 Y196.741 E2.36485
N12215 ; COOLING_NODE: 0
N12216 M204 S10000
N12217 G1 X191.491 Y197.208 F60000
N12218 M73 P78 R8
N12219 G1 F8475
N12220 M204 S8000
N12221 G1 X158.509 Y197.208 E1.06057
N12222 G1 X158.509 Y122.792 E2.39296
N12223 G1 X191.491 Y122.792 E1.06057
N12224 G1 X191.491 Y197.148 E2.39103
N12225 ; COOLING_NODE: 0
N12226 M204 S10000
N12227 G1 X191.898 Y197.615 F60000
N12228 G1 F8475
N12229 M204 S8000
N12230 G1 X158.102 Y197.615 E1.08675
N12231 G1 X158.102 Y122.385 E2.41914
N12232 G1 X191.898 Y122.385 E1.08675
N12233 G1 X191.898 Y197.555 E2.41721
N12234 ; COOLING_NODE: 0
N12235 M204 S10000
N12236 G1 X192.29 Y198.007 F60000
N12237 ; FEATURE: Outer wall
N12238 ; LINE_WIDTH: 0.42
N12239 G1 F9149.261
N12240 M204 S5000
N12241 G1 X157.71 Y198.007 E1.03002
N12242 G1 X157.71 Y121.993 E2.26421
N12243 G1 X192.29 Y121.993 E1.03002
N12244 G1 X192.29 Y197.947 E2.26243
N12245 G1 E-.8 F1800
N12246 M204 S10000
N12247 G1 X191.815 Y190.33 Z10.2 F60000
N12248 G1 X190.736 Y173.015 Z10.2
N12249 G1 Z9.8
N12250 G1 E.8 F1800
N12251 ; FEATURE: Sparse infill
N12252 ; LINE_WIDTH: 0.45
N12253 G1 F8475
N12254 M204 S8000
N12255 G1 X190.736 Y171.387 E.05236
N12256 G1 X159.264 Y179.819 E1.0477
N12257 G1 X159.264 Y180.52 E.02254
N12258 G1 X175.197 Y196.453 E.72455
N12259 G1 X174.916 Y196.453 E.00904
N12260 G1 X190.736 Y137.413 E1.96546
N12261 G1 X190.736 Y137.671 E.00829
N12262 G1 X159.264 Y146.104 E1.0477
N12263 G1 X159.264 Y145.978 E.00404
N12264 G1 X190.736 Y177.449 E1.43118
N12265 G1 X190.736 Y179.815 E.07608
N12266 G1 X159.264 Y188.248 E1.0477
N12267 G1 X159.264 Y186.62 E.05236
N12268 M204 S10000
N12269 G1 X159.264 Y195.66 F60000
N12270 G1 F8475
N12271 M204 S8000
N12272 G1 X159.264 Y196.453 E.02548
N12273 G1 X160.1 Y196.453 E.02688
N12274 G1 X190.736 Y188.244 E1.01987
N12275 G1 X190.736 Y188.963 E.02313
N12276 G1 X159.264 Y157.492 E1.43118
N12277 G1 X159.264 Y154.533 E.09517
N12278 G1 X190.736 Y146.1 E1.0477
N12279 G1 X190.736 Y142.908 E.10266
N12280 G1 X171.375 Y123.547 E.88044
N12281 G1 X169.165 Y123.547 E.07108
N12282 G1 X159.264 Y160.495 E1.23002
N12283 G1 X159.264 Y162.962 E.07931
N12284 G1 X190.736 Y154.529 E1.0477
N12285 G1 X190.736 Y154.422 E.00345
N12286 G1 X159.861 Y123.547 E1.40404
N12287 G1 X160.736 Y123.547 E.02813
N12288 G1 X159.264 Y129.038 E.18281
N12289 G1 X159.264 Y129.246 E.00669
N12290 G1 X180.534 Y123.547 E.70809
N12291 G1 X182.889 Y123.547 E.07572
N12292 G1 X190.736 Y131.394 E.35683
N12293 G1 X190.736 Y129.243 E.06917
N12294 G1 X159.264 Y137.675 E1.0477
N12295 G1 X159.264 Y134.464 E.10325
N12296 G1 X190.736 Y165.936 E1.43118
N12297 G1 X190.736 Y168.87 E.09437
N12298 G1 X183.345 Y196.453 E.91825
N12299 G1 X186.711 Y196.453 E.10824
N12300 G1 X159.264 Y169.006 E1.24816
N12301 G1 X159.264 Y171.39 E.07666
N12302 G1 X190.736 Y162.958 E1.0477
N12303 G1 X190.736 Y161.329 E.05236
N12304 M204 S10000
N12305 G1 X187.651 Y123.547 F60000
N12306 G1 F8475
N12307 M204 S8000
N12308 G1 X186.022 Y123.547 E.05236
N12309 G1 X166.487 Y196.453 E2.42708
N12310 G1 X163.683 Y196.453 E.09017
N12311 G1 X159.264 Y192.034 E.20094
N12312 G1 X159.264 Y191.952 E.00265
N12313 G1 X177.593 Y123.547 E2.27724
N12314 G1 X175.965 Y123.547 E.05236
N12315 ; WIPE_START
N12316 G1 X177.593 Y123.547 E-.61876
N12317 G1 X177.497 Y123.906 E-.14124
N12318 ; WIPE_END
N12319 G1 E-.04 F1800
N12320 M204 S10000
N12321 G17
N12322 G3 Z10.2 I1.217 J0 P1  F60000
N12323 ; stop printing object, unique label id: 130
N12324 M625
N12325 ; object ids of layer 49 start: 130
N12326 M624 AQAAAAAAAAA=
N12327 ;======== H2D 20250527========
N12328 ; SKIPPABLE_START
N12329 ; SKIPTYPE: timelapse
N12330 M622.1 S1 ; for prev firware, default turned on
N12331 
N12332 M1002 judge_flag timelapse_record_flag
N12333 
N12334 M622 J1
N12335 M993 A2 B2 C2
N12336 M993 A0 B0 C0
N12337 
N12338 
N12339 
N12340 
N12341     M9711 M0 E1 X260 Y137 Z10.2 S11 C10 O0 T3000
N12342 
N12343 
N12344 
N12345 M993 A3 B3 C3
N12346 
N12347 M623
N12348 ; SKIPPABLE_END
N12349 
N12350 ; object ids of this layer49 end: 130
N12351 M625
N12352 ; CHANGE_LAYER
N12353 ; Z_HEIGHT: 10
N12354 ; LAYER_HEIGHT: 0.2
N12355 ;======== H2D 20250521========
N12356 ; layer num/total_layer_count: 50/63
N12357 ; update layer progress
N12358 M73 L50
N12359 M991 S0 P49 ;notify layer change
N12360 
N12361 
N12362 ; OBJECT_ID: 130
N12363 ; COOLING_NODE: 0
N12364 ; start printing object, unique label id: 130
N12365 M624 AQAAAAAAAAA=
N12366 G1 X191.084 Y196.801 F60000
N12367 G1 Z10
N12368 G1 E.8 F1800
N12369 ; FEATURE: Inner wall
N12370 ; LINE_WIDTH: 0.45
N12371 ; LAYER_HEIGHT: 0.2
N12372 G1 F8475
N12373 M204 S8000
N12374 G1 X158.916 Y196.801 E1.03439
N12375 G1 X158.916 Y123.199 E2.36678
N12376 G1 X191.084 Y123.199 E1.03439
N12377 G1 X191.084 Y196.741 E2.36485
N12378 ; COOLING_NODE: 0
N12379 M204 S10000
N12380 G1 X191.491 Y197.208 F60000
N12381 G1 F8475
N12382 M204 S8000
N12383 G1 X158.509 Y197.208 E1.06057
N12384 G1 X158.509 Y122.792 E2.39296
N12385 G1 X191.491 Y122.792 E1.06057
N12386 G1 X191.491 Y197.148 E2.39103
N12387 ; COOLING_NODE: 0
N12388 M204 S10000
N12389 M73 P78 R7
N12390 G1 X191.898 Y197.615 F60000
N12391 G1 F8475
N12392 M204 S8000
N12393 G1 X158.102 Y197.615 E1.08675
N12394 G1 X158.102 Y122.385 E2.41914
N12395 G1 X191.898 Y122.385 E1.08675
N12396 G1 X191.898 Y197.555 E2.41721
N12397 ; COOLING_NODE: 0
N12398 M204 S10000
N12399 G1 X192.29 Y198.007 F60000
N12400 ; FEATURE: Outer wall
N12401 ; LINE_WIDTH: 0.42
N12402 G1 F9149.261
N12403 M204 S5000
N12404 G1 X157.71 Y198.007 E1.03002
N12405 G1 X157.71 Y121.993 E2.26421
N12406 G1 X192.29 Y121.993 E1.03002
N12407 G1 X192.29 Y197.947 E2.26243
N12408 G1 E-.8 F1800
N12409 M204 S10000
N12410 G1 X191.812 Y190.33 Z10.4 F60000
N12411 G1 X190.736 Y173.161 Z10.4
N12412 G1 Z10
N12413 G1 E.8 F1800
N12414 ; FEATURE: Sparse infill
N12415 ; LINE_WIDTH: 0.45
N12416 G1 F8475
N12417 M204 S8000
N12418 G1 X190.736 Y171.533 E.05236
N12419 G1 X159.264 Y179.966 E1.0477
N12420 G1 X159.264 Y180.32 E.0114
N12421 G1 X175.397 Y196.453 E.73364
N12422 G1 X174.77 Y196.453 E.02018
N12423 G1 X190.736 Y136.867 E1.98365
N12424 G1 X190.736 Y135.239 E.05236
N12425 M204 S10000
N12426 G1 X190.736 Y137.818 F60000
N12427 G1 F8475
N12428 M204 S8000
N12429 G1 X159.264 Y146.25 E1.0477
N12430 G1 X159.264 Y145.778 E.01518
N12431 G1 X190.736 Y177.249 E1.43118
N12432 G1 X190.736 Y179.962 E.08722
N12433 G1 X159.264 Y188.394 E1.0477
N12434 G1 X159.264 Y186.766 E.05236
N12435 M204 S10000
N12436 G1 X159.264 Y196.207 F60000
N12437 G1 F8475
N12438 M204 S8000
N12439 G1 X159.264 Y196.453 E.00791
N12440 G1 X160.647 Y196.453 E.04445
N12441 G1 X190.736 Y188.391 E1.00168
N12442 G1 X190.736 Y188.763 E.01199
N12443 G1 X159.264 Y157.292 E1.43118
N12444 G1 X159.264 Y154.679 E.08403
N12445 G1 X190.736 Y146.247 E1.0477
N12446 G1 X190.736 Y142.708 E.1138
N12447 M73 P79 R7
N12448 G1 X171.575 Y123.547 E.87134
N12449 G1 X169.018 Y123.547 E.08222
N12450 G1 X159.264 Y159.949 E1.21183
N12451 G1 X159.264 Y163.108 E.10159
N12452 G1 X190.736 Y154.675 E1.0477
N12453 G1 X190.736 Y154.222 E.01459
N12454 G1 X160.061 Y123.547 E1.39495
N12455 G1 X160.589 Y123.547 E.01699
N12456 G1 X159.264 Y128.492 E.16462
N12457 G1 X159.264 Y129.393 E.02897
N12458 G1 X181.081 Y123.547 E.72628
N12459 G1 X183.089 Y123.547 E.06458
N12460 G1 X190.736 Y131.194 E.34773
N12461 G1 X190.736 Y129.389 E.05803
N12462 G1 X159.264 Y137.822 E1.0477
N12463 G1 X159.264 Y134.264 E.11439
N12464 G1 X190.736 Y165.736 E1.43118
N12465 G1 X190.736 Y168.324 E.08323
N12466 G1 X183.198 Y196.453 E.93644
N12467 G1 X186.911 Y196.453 E.11938
N12468 G1 X159.264 Y168.806 E1.25725
N12469 G1 X159.264 Y171.537 E.0878
N12470 G1 X190.736 Y163.104 E1.0477
N12471 G1 X190.736 Y161.476 E.05236
N12472 M204 S10000
N12473 G1 X187.504 Y123.547 F60000
N12474 G1 F8475
N12475 M204 S8000
N12476 G1 X185.876 Y123.547 E.05236
N12477 G1 X166.341 Y196.453 E2.42708
N12478 G1 X163.883 Y196.453 E.07903
N12479 G1 X159.264 Y191.834 E.21004
N12480 G1 X159.264 Y191.405 E.01379
N12481 G1 X177.447 Y123.547 E2.25905
N12482 G1 X175.819 Y123.547 E.05236
N12483 ; WIPE_START
N12484 G1 X177.447 Y123.547 E-.61876
N12485 G1 X177.351 Y123.906 E-.14124
N12486 ; WIPE_END
N12487 G1 E-.04 F1800
N12488 M204 S10000
N12489 G17
N12490 G3 Z10.4 I1.217 J0 P1  F60000
N12491 ; stop printing object, unique label id: 130
N12492 M625
N12493 ; object ids of layer 50 start: 130
N12494 M624 AQAAAAAAAAA=
N12495 ;======== H2D 20250527========
N12496 ; SKIPPABLE_START
N12497 ; SKIPTYPE: timelapse
N12498 M622.1 S1 ; for prev firware, default turned on
N12499 
N12500 M1002 judge_flag timelapse_record_flag
N12501 
N12502 M622 J1
N12503 M993 A2 B2 C2
N12504 M993 A0 B0 C0
N12505 
N12506 
N12507 
N12508 
N12509     M9711 M0 E1 X260 Y137 Z10.4 S11 C10 O0 T3000
N12510 
N12511 
N12512 
N12513 M993 A3 B3 C3
N12514 
N12515 M623
N12516 ; SKIPPABLE_END
N12517 
N12518 ; object ids of this layer50 end: 130
N12519 M625
N12520 ; CHANGE_LAYER
N12521 ; Z_HEIGHT: 10.2
N12522 ; LAYER_HEIGHT: 0.2
N12523 ;======== H2D 20250521========
N12524 ; layer num/total_layer_count: 51/63
N12525 ; update layer progress
N12526 M73 L51
N12527 M991 S0 P50 ;notify layer change
N12528 
N12529 
N12530 ; OBJECT_ID: 130
N12531 ; COOLING_NODE: 0
N12532 ; start printing object, unique label id: 130
N12533 M624 AQAAAAAAAAA=
N12534 G1 X191.084 Y196.801 F60000
N12535 G1 Z10.2
N12536 G1 E.8 F1800
N12537 ; FEATURE: Inner wall
N12538 ; LINE_WIDTH: 0.45
N12539 ; LAYER_HEIGHT: 0.2
N12540 G1 F8475
N12541 M204 S8000
N12542 G1 X158.916 Y196.801 E1.03439
N12543 G1 X158.916 Y123.199 E2.36678
N12544 G1 X191.084 Y123.199 E1.03439
N12545 G1 X191.084 Y196.741 E2.36485
N12546 ; COOLING_NODE: 0
N12547 M204 S10000
N12548 G1 X191.491 Y197.208 F60000
N12549 G1 F8475
N12550 M204 S8000
N12551 G1 X158.509 Y197.208 E1.06057
N12552 G1 X158.509 Y122.792 E2.39296
N12553 G1 X191.491 Y122.792 E1.06057
N12554 G1 X191.491 Y197.148 E2.39103
N12555 ; COOLING_NODE: 0
N12556 M204 S10000
N12557 G1 X191.898 Y197.615 F60000
N12558 G1 F8475
N12559 M204 S8000
N12560 G1 X158.102 Y197.615 E1.08675
N12561 G1 X158.102 Y122.385 E2.41914
N12562 G1 X191.898 Y122.385 E1.08675
N12563 G1 X191.898 Y197.555 E2.41721
N12564 ; COOLING_NODE: 0
N12565 M204 S10000
N12566 G1 X192.29 Y198.007 F60000
N12567 ; FEATURE: Outer wall
N12568 ; LINE_WIDTH: 0.42
N12569 G1 F9149.261
N12570 M204 S5000
N12571 G1 X157.71 Y198.007 E1.03002
N12572 G1 X157.71 Y121.993 E2.26421
N12573 G1 X192.29 Y121.993 E1.03002
N12574 G1 X192.29 Y197.947 E2.26243
N12575 G1 E-.8 F1800
N12576 M204 S10000
N12577 G1 X191.809 Y190.33 Z10.6 F60000
N12578 G1 X190.736 Y173.308 Z10.6
N12579 G1 Z10.2
N12580 G1 E.8 F1800
N12581 ; FEATURE: Sparse infill
N12582 ; LINE_WIDTH: 0.45
N12583 G1 F8475
N12584 M204 S8000
N12585 G1 X190.736 Y171.679 E.05236
N12586 G1 X159.264 Y180.12 E1.04776
N12587 G1 X175.597 Y196.453 E.74274
N12588 G1 X174.623 Y196.453 E.03131
N12589 G1 X190.736 Y136.321 E2.00184
N12590 G1 X190.736 Y134.692 E.05236
N12591 M204 S10000
N12592 G1 X190.736 Y139.593 F60000
N12593 G1 F8475
N12594 M204 S8000
N12595 G1 X190.736 Y137.964 E.05236
N12596 G1 X159.264 Y146.397 E1.0477
N12597 G1 X159.264 Y145.578 E.02632
N12598 G1 X190.736 Y177.049 E1.43118
N12599 G1 X190.736 Y180.108 E.09836
N12600 G1 X159.264 Y188.541 E1.0477
N12601 G1 X159.264 Y186.912 E.05236
N12602 M204 S10000
N12603 G1 X159.565 Y196.453 F60000
N12604 G1 F8475
N12605 M204 S8000
N12606 G1 X161.193 Y196.453 E.05236
N12607 G1 X190.736 Y188.537 E.98349
N12608 G1 X190.736 Y188.563 E.00085
N12609 G1 X159.264 Y157.092 E1.43118
N12610 G1 X159.264 Y154.826 E.07289
N12611 G1 X190.736 Y146.393 E1.0477
N12612 G1 X190.736 Y142.508 E.12494
N12613 G1 X171.775 Y123.547 E.86225
N12614 G1 X168.872 Y123.547 E.09336
N12615 G1 X159.264 Y159.402 E1.19364
N12616 G1 X159.264 Y163.254 E.12387
N12617 G1 X190.736 Y154.822 E1.0477
N12618 G1 X190.736 Y154.022 E.02573
N12619 G1 X160.261 Y123.547 E1.38585
N12620 G1 X160.443 Y123.547 E.00585
N12621 G1 X159.264 Y127.946 E.14643
N12622 G1 X159.264 Y129.539 E.05125
N12623 G1 X181.627 Y123.547 E.74447
N12624 G1 X183.289 Y123.547 E.05344
N12625 G1 X190.736 Y130.994 E.33864
N12626 G1 X190.736 Y129.535 E.04689
N12627 G1 X159.264 Y137.968 E1.0477
N12628 G1 X159.264 Y134.064 E.12553
N12629 G1 X190.736 Y165.536 E1.43118
N12630 G1 X190.736 Y167.777 E.07209
N12631 G1 X183.052 Y196.453 E.95463
N12632 G1 X187.111 Y196.453 E.13052
N12633 G1 X159.264 Y168.606 E1.26635
N12634 G1 X159.264 Y171.683 E.09894
N12635 G1 X190.736 Y163.251 E1.0477
N12636 G1 X190.736 Y161.622 E.05236
N12637 M204 S10000
N12638 G1 X187.358 Y123.547 F60000
N12639 G1 F8475
N12640 M204 S8000
N12641 G1 X185.729 Y123.547 E.05236
N12642 G1 X166.194 Y196.453 E2.42708
N12643 G1 X164.083 Y196.453 E.06789
N12644 G1 X159.264 Y191.634 E.21913
N12645 G1 X159.264 Y190.859 E.02493
N12646 G1 X177.301 Y123.547 E2.24086
N12647 G1 X175.672 Y123.547 E.05236
N12648 ; WIPE_START
N12649 G1 X177.301 Y123.547 E-.61876
N12650 G1 X177.204 Y123.906 E-.14124
N12651 ; WIPE_END
N12652 G1 E-.04 F1800
N12653 M204 S10000
N12654 G17
N12655 G3 Z10.6 I1.217 J0 P1  F60000
N12656 ; stop printing object, unique label id: 130
N12657 M625
N12658 ; object ids of layer 51 start: 130
N12659 M624 AQAAAAAAAAA=
N12660 ;======== H2D 20250527========
N12661 ; SKIPPABLE_START
N12662 ; SKIPTYPE: timelapse
N12663 M622.1 S1 ; for prev firware, default turned on
N12664 
N12665 M1002 judge_flag timelapse_record_flag
N12666 
N12667 M622 J1
N12668 M993 A2 B2 C2
N12669 M993 A0 B0 C0
N12670 
N12671 
N12672 
N12673 
N12674     M9711 M0 E1 X260 Y137 Z10.6 S11 C10 O0 T3000
N12675 
N12676 
N12677 
N12678 M993 A3 B3 C3
N12679 
N12680 M623
N12681 ; SKIPPABLE_END
N12682 
N12683 ; object ids of this layer51 end: 130
N12684 M625
N12685 ; CHANGE_LAYER
N12686 ; Z_HEIGHT: 10.4
N12687 ; LAYER_HEIGHT: 0.2
N12688 ;======== H2D 20250521========
N12689 ; layer num/total_layer_count: 52/63
N12690 ; update layer progress
N12691 M73 L52
N12692 M991 S0 P51 ;notify layer change
N12693 
N12694 
N12695 ; OBJECT_ID: 130
N12696 ; COOLING_NODE: 0
N12697 ; start printing object, unique label id: 130
N12698 M624 AQAAAAAAAAA=
N12699 G1 X191.084 Y196.801 F60000
N12700 G1 Z10.4
N12701 G1 E.8 F1800
N12702 ; FEATURE: Inner wall
N12703 ; LINE_WIDTH: 0.45
N12704 ; LAYER_HEIGHT: 0.2
N12705 G1 F8475
N12706 M204 S8000
N12707 G1 X158.916 Y196.801 E1.03439
N12708 G1 X158.916 Y123.199 E2.36678
N12709 G1 X191.084 Y123.199 E1.03439
N12710 G1 X191.084 Y196.741 E2.36485
N12711 ; COOLING_NODE: 0
N12712 M204 S10000
N12713 G1 X191.491 Y197.208 F60000
N12714 G1 F8475
N12715 M204 S8000
N12716 G1 X158.509 Y197.208 E1.06057
N12717 G1 X158.509 Y122.792 E2.39296
N12718 G1 X191.491 Y122.792 E1.06057
N12719 G1 X191.491 Y197.148 E2.39103
N12720 ; COOLING_NODE: 0
N12721 M204 S10000
N12722 G1 X191.898 Y197.615 F60000
N12723 G1 F8475
N12724 M204 S8000
N12725 G1 X158.102 Y197.615 E1.08675
N12726 M73 P80 R7
N12727 G1 X158.102 Y122.385 E2.41914
N12728 G1 X191.898 Y122.385 E1.08675
N12729 G1 X191.898 Y197.555 E2.41721
N12730 ; COOLING_NODE: 0
N12731 M204 S10000
N12732 G1 X192.29 Y198.007 F60000
N12733 ; FEATURE: Outer wall
N12734 ; LINE_WIDTH: 0.42
N12735 G1 F9149.261
N12736 M204 S5000
N12737 G1 X157.71 Y198.007 E1.03002
N12738 G1 X157.71 Y121.993 E2.26421
N12739 G1 X192.29 Y121.993 E1.03002
N12740 G1 X192.29 Y197.947 E2.26243
N12741 G1 E-.8 F1800
N12742 M204 S10000
N12743 G1 X191.807 Y190.33 Z10.8 F60000
N12744 G1 X190.736 Y173.454 Z10.8
N12745 G1 Z10.4
N12746 G1 E.8 F1800
N12747 ; FEATURE: Sparse infill
N12748 ; LINE_WIDTH: 0.45
N12749 G1 F8475
N12750 M204 S8000
N12751 G1 X190.736 Y171.826 E.05236
N12752 G1 X159.264 Y180.258 E1.0477
N12753 G1 X159.264 Y179.92 E.01088
N12754 G1 X175.797 Y196.453 E.75183
N12755 G1 X174.477 Y196.453 E.04245
N12756 G1 X190.736 Y135.774 E2.02003
N12757 G1 X190.736 Y134.146 E.05236
N12758 M204 S10000
N12759 G1 X187.211 Y123.547 F60000
N12760 G1 F8475
N12761 M204 S8000
N12762 G1 X185.583 Y123.547 E.05236
N12763 G1 X166.048 Y196.453 E2.42708
N12764 G1 X164.283 Y196.453 E.05675
N12765 G1 X159.264 Y191.434 E.22823
N12766 G1 X159.264 Y190.312 E.03607
N12767 G1 X177.154 Y123.547 E2.22267
N12768 G1 X175.526 Y123.547 E.05236
N12769 M204 S10000
N12770 G1 X190.736 Y148.168 F60000
N12771 G1 F8475
N12772 M204 S8000
N12773 G1 X190.736 Y146.539 E.05236
N12774 G1 X159.264 Y154.972 E1.04769
N12775 G1 X159.264 Y156.892 E.06175
N12776 G1 X190.736 Y188.363 E1.43118
N12777 G1 X190.736 Y188.683 E.01029
N12778 G1 X161.74 Y196.453 E.96529
N12779 G1 X160.111 Y196.453 E.05236
N12780 M204 S10000
N12781 G1 X159.264 Y187.059 F60000
N12782 G1 F8475
N12783 M204 S8000
N12784 G1 X159.264 Y188.687 E.05236
N12785 G1 X190.736 Y180.255 E1.0477
N12786 G1 X190.736 Y176.849 E.1095
N12787 G1 X159.264 Y145.378 E1.43118
N12788 G1 X159.264 Y146.543 E.03746
N12789 G1 X190.736 Y138.111 E1.0477
N12790 G1 X190.736 Y142.308 E.13496
N12791 G1 X171.975 Y123.547 E.85315
N12792 G1 X168.725 Y123.547 E.1045
N12793 G1 X159.264 Y158.856 E1.17545
N12794 G1 X159.264 Y163.401 E.14615
N12795 G1 X190.736 Y154.968 E1.0477
N12796 G1 X190.736 Y153.822 E.03687
N12797 G1 X160.461 Y123.547 E1.37676
N12798 G1 X160.297 Y123.547 E.00529
N12799 G1 X159.264 Y127.399 E.12823
N12800 G1 X159.264 Y129.686 E.07353
N12801 G1 X182.174 Y123.547 E.76266
N12802 G1 X183.489 Y123.547 E.0423
N12803 G1 X190.736 Y130.794 E.32954
N12804 G1 X190.736 Y129.682 E.03575
N12805 G1 X159.264 Y138.114 E1.0477
N12806 G1 X159.264 Y133.864 E.13667
N12807 G1 X190.736 Y165.336 E1.43118
N12808 G1 X190.736 Y167.231 E.06095
N12809 G1 X182.906 Y196.453 E.97282
N12810 G1 X187.311 Y196.453 E.14166
N12811 G1 X159.264 Y168.406 E1.27544
N12812 G1 X159.264 Y171.83 E.11008
N12813 G1 X190.736 Y163.397 E1.0477
N12814 G1 X190.736 Y161.769 E.05236
N12815 ; WIPE_START
N12816 G1 X190.736 Y163.397 E-.61876
N12817 G1 X190.377 Y163.493 E-.14124
N12818 ; WIPE_END
N12819 G1 E-.04 F1800
N12820 M204 S10000
N12821 G17
N12822 G3 Z10.8 I1.217 J0 P1  F60000
N12823 ; stop printing object, unique label id: 130
N12824 M625
N12825 ; object ids of layer 52 start: 130
N12826 M624 AQAAAAAAAAA=
N12827 ;======== H2D 20250527========
N12828 ; SKIPPABLE_START
N12829 ; SKIPTYPE: timelapse
N12830 M622.1 S1 ; for prev firware, default turned on
N12831 
N12832 M1002 judge_flag timelapse_record_flag
N12833 
N12834 M622 J1
N12835 M993 A2 B2 C2
N12836 M993 A0 B0 C0
N12837 
N12838 
N12839 
N12840 
N12841     M9711 M0 E1 X260 Y137 Z10.8 S11 C10 O0 T3000
N12842 
N12843 
N12844 
N12845 M993 A3 B3 C3
N12846 
N12847 M623
N12848 ; SKIPPABLE_END
N12849 
N12850 ; object ids of this layer52 end: 130
N12851 M625
N12852 ; CHANGE_LAYER
N12853 ; Z_HEIGHT: 10.6
N12854 ; LAYER_HEIGHT: 0.200001
N12855 ;======== H2D 20250521========
N12856 ; layer num/total_layer_count: 53/63
N12857 ; update layer progress
N12858 M73 L53
N12859 M991 S0 P52 ;notify layer change
N12860 
N12861 
N12862 ; OBJECT_ID: 130
N12863 ; COOLING_NODE: 0
N12864 ; start printing object, unique label id: 130
N12865 M624 AQAAAAAAAAA=
N12866 G1 X191.084 Y196.801 F60000
N12867 G1 Z10.6
N12868 G1 E.8 F1800
N12869 ; FEATURE: Inner wall
N12870 ; LINE_WIDTH: 0.45
N12871 ; LAYER_HEIGHT: 0.2
N12872 G1 F8475
N12873 M204 S8000
N12874 G1 X158.916 Y196.801 E1.03439
N12875 G1 X158.916 Y123.199 E2.36678
N12876 G1 X191.084 Y123.199 E1.03439
N12877 G1 X191.084 Y196.741 E2.36485
N12878 ; COOLING_NODE: 0
N12879 M204 S10000
N12880 G1 X191.491 Y197.208 F60000
N12881 G1 F8475
N12882 M204 S8000
N12883 G1 X158.509 Y197.208 E1.06057
N12884 G1 X158.509 Y122.792 E2.39296
N12885 G1 X191.491 Y122.792 E1.06057
N12886 G1 X191.491 Y197.148 E2.39103
N12887 ; COOLING_NODE: 0
N12888 M204 S10000
N12889 G1 X191.898 Y197.615 F60000
N12890 G1 F8475
N12891 M204 S8000
N12892 G1 X158.102 Y197.615 E1.08675
N12893 G1 X158.102 Y122.385 E2.41914
N12894 G1 X191.898 Y122.385 E1.08675
N12895 G1 X191.898 Y197.555 E2.41721
N12896 ; COOLING_NODE: 0
N12897 M204 S10000
N12898 G1 X192.29 Y198.007 F60000
N12899 ; FEATURE: Outer wall
N12900 ; LINE_WIDTH: 0.42
N12901 G1 F9149.261
N12902 M204 S5000
N12903 G1 X157.71 Y198.007 E1.03002
N12904 G1 X157.71 Y121.993 E2.26421
N12905 G1 X192.29 Y121.993 E1.03002
N12906 G1 X192.29 Y197.947 E2.26243
N12907 G1 E-.8 F1800
N12908 M204 S10000
N12909 G1 X191.804 Y190.33 Z11 F60000
N12910 G1 X190.736 Y173.601 Z11
N12911 G1 Z10.6
N12912 G1 E.8 F1800
N12913 ; FEATURE: Sparse infill
N12914 ; LINE_WIDTH: 0.45
N12915 G1 F8475
N12916 M204 S8000
N12917 G1 X190.736 Y171.972 E.05236
N12918 G1 X159.264 Y180.405 E1.0477
N12919 G1 X159.264 Y179.72 E.02201
N12920 G1 X175.997 Y196.453 E.76093
N12921 G1 X174.33 Y196.453 E.05359
N12922 G1 X190.736 Y135.228 E2.03822
N12923 G1 X190.736 Y133.599 E.05236
N12924 M204 S10000
N12925 G1 X187.065 Y123.547 F60000
N12926 G1 F8475
N12927 M204 S8000
N12928 G1 X185.437 Y123.547 E.05236
N12929 G1 X165.902 Y196.453 E2.42708
N12930 G1 X164.483 Y196.453 E.04561
N12931 G1 X159.264 Y191.234 E.23732
N12932 G1 X159.264 Y189.766 E.04721
N12933 G1 X177.008 Y123.547 E2.20448
N12934 G1 X175.379 Y123.547 E.05236
N12935 M204 S10000
N12936 G1 X190.736 Y148.314 F60000
N12937 G1 F8475
N12938 M204 S8000
N12939 G1 X190.736 Y146.686 E.05236
N12940 G1 X159.264 Y155.118 E1.0477
N12941 G1 X159.264 Y156.692 E.05061
N12942 G1 X190.736 Y188.163 E1.43118
N12943 G1 X190.736 Y188.83 E.02143
N12944 G1 X162.286 Y196.453 E.9471
N12945 G1 X160.658 Y196.453 E.05236
N12946 M204 S10000
N12947 G1 X159.264 Y188.834 F60000
N12948 G1 F8475
N12949 M204 S8000
N12950 G1 X190.736 Y180.401 E1.0477
N12951 G1 X190.736 Y176.649 E.12063
N12952 G1 X159.264 Y145.178 E1.43118
N12953 G1 X159.264 Y146.69 E.0486
N12954 G1 X190.736 Y138.257 E1.0477
N12955 G1 X190.736 Y142.108 E.12382
N12956 G1 X172.175 Y123.547 E.84405
N12957 G1 X168.579 Y123.547 E.11564
N12958 G1 X159.264 Y158.309 E1.15726
N12959 G1 X159.264 Y163.547 E.16843
N12960 G1 X190.736 Y155.115 E1.0477
N12961 G1 X190.736 Y153.622 E.04801
N12962 M73 P81 R7
N12963 G1 X160.661 Y123.547 E1.36766
N12964 G1 X160.15 Y123.547 E.01643
N12965 G1 X159.264 Y126.853 E.11004
N12966 G1 X159.264 Y129.832 E.0958
N12967 G1 X182.72 Y123.547 E.78085
N12968 G1 X183.689 Y123.547 E.03116
N12969 G1 X190.736 Y130.594 E.32045
N12970 G1 X190.736 Y129.828 E.02461
N12971 G1 X159.264 Y138.261 E1.04769
N12972 G1 X159.264 Y133.664 E.1478
N12973 G1 X190.736 Y165.136 E1.43118
N12974 G1 X190.736 Y166.684 E.04981
N12975 G1 X182.759 Y196.453 E.99101
N12976 G1 X187.511 Y196.453 E.1528
N12977 G1 X159.264 Y168.206 E1.28454
N12978 G1 X159.264 Y171.976 E.12122
N12979 G1 X190.736 Y163.543 E1.0477
N12980 G1 X190.736 Y161.915 E.05236
N12981 ; WIPE_START
N12982 G1 X190.736 Y163.543 E-.61876
N12983 G1 X190.377 Y163.64 E-.14124
N12984 ; WIPE_END
N12985 G1 E-.04 F1800
N12986 M204 S10000
N12987 G17
N12988 G3 Z11 I1.217 J0 P1  F60000
N12989 ; stop printing object, unique label id: 130
N12990 M625
N12991 ; object ids of layer 53 start: 130
N12992 M624 AQAAAAAAAAA=
N12993 ;======== H2D 20250527========
N12994 ; SKIPPABLE_START
N12995 ; SKIPTYPE: timelapse
N12996 M622.1 S1 ; for prev firware, default turned on
N12997 
N12998 M1002 judge_flag timelapse_record_flag
N12999 
N13000 M622 J1
N13001 M993 A2 B2 C2
N13002 M993 A0 B0 C0
N13003 
N13004 
N13005 
N13006 
N13007     M9711 M0 E1 X260 Y137 Z11 S11 C10 O0 T3000
N13008 
N13009 
N13010 
N13011 M993 A3 B3 C3
N13012 
N13013 M623
N13014 ; SKIPPABLE_END
N13015 
N13016 ; object ids of this layer53 end: 130
N13017 M625
N13018 ; CHANGE_LAYER
N13019 ; Z_HEIGHT: 10.8
N13020 ; LAYER_HEIGHT: 0.2
N13021 ;======== H2D 20250521========
N13022 ; layer num/total_layer_count: 54/63
N13023 ; update layer progress
N13024 M73 L54
N13025 M991 S0 P53 ;notify layer change
N13026 
N13027 
N13028 ; OBJECT_ID: 130
N13029 ; COOLING_NODE: 0
N13030 ; start printing object, unique label id: 130
N13031 M624 AQAAAAAAAAA=
N13032 G1 X191.084 Y196.801 F60000
N13033 G1 Z10.8
N13034 G1 E.8 F1800
N13035 ; FEATURE: Inner wall
N13036 ; LINE_WIDTH: 0.45
N13037 ; LAYER_HEIGHT: 0.2
N13038 G1 F8475
N13039 M204 S8000
N13040 G1 X158.916 Y196.801 E1.03439
N13041 G1 X158.916 Y123.199 E2.36678
N13042 G1 X191.084 Y123.199 E1.03439
N13043 G1 X191.084 Y196.741 E2.36485
N13044 ; COOLING_NODE: 0
N13045 M204 S10000
N13046 G1 X191.491 Y197.208 F60000
N13047 G1 F8475
N13048 M204 S8000
N13049 G1 X158.509 Y197.208 E1.06057
N13050 G1 X158.509 Y122.792 E2.39296
N13051 G1 X191.491 Y122.792 E1.06057
N13052 G1 X191.491 Y197.148 E2.39103
N13053 ; COOLING_NODE: 0
N13054 M204 S10000
N13055 G1 X191.898 Y197.615 F60000
N13056 G1 F8475
N13057 M204 S8000
N13058 G1 X158.102 Y197.615 E1.08675
N13059 G1 X158.102 Y122.385 E2.41914
N13060 G1 X191.898 Y122.385 E1.08675
N13061 G1 X191.898 Y197.555 E2.41721
N13062 ; COOLING_NODE: 0
N13063 M204 S10000
N13064 G1 X192.29 Y198.007 F60000
N13065 ; FEATURE: Outer wall
N13066 ; LINE_WIDTH: 0.42
N13067 G1 F9149.261
N13068 M204 S5000
N13069 G1 X157.71 Y198.007 E1.03002
N13070 G1 X157.71 Y121.993 E2.26421
N13071 G1 X192.29 Y121.993 E1.03002
N13072 G1 X192.29 Y197.947 E2.26243
N13073 M73 P81 R6
N13074 G1 E-.8 F1800
N13075 M204 S10000
N13076 G1 X191.859 Y190.327 Z11.2 F60000
N13077 G1 X190.736 Y170.49 Z11.2
N13078 G1 Z10.8
N13079 G1 E.8 F1800
N13080 ; FEATURE: Sparse infill
N13081 ; LINE_WIDTH: 0.45
N13082 G1 F8475
N13083 M204 S8000
N13084 G1 X190.736 Y172.119 E.05236
N13085 G1 X159.264 Y180.551 E1.0477
N13086 G1 X159.264 Y179.52 E.03315
N13087 G1 X176.197 Y196.453 E.77002
N13088 G1 X174.184 Y196.453 E.06473
N13089 G1 X190.736 Y134.681 E2.05641
N13090 G1 X190.736 Y133.053 E.05236
N13091 M204 S10000
N13092 G1 X190.736 Y148.461 F60000
N13093 G1 F8475
N13094 M204 S8000
N13095 G1 X190.736 Y146.832 E.05236
N13096 G1 X159.264 Y155.265 E1.0477
N13097 G1 X159.264 Y156.492 E.03947
N13098 G1 X190.736 Y187.963 E1.43118
N13099 G1 X190.736 Y188.976 E.03257
N13100 G1 X162.832 Y196.453 E.92891
N13101 G1 X159.264 Y196.453 E.11473
N13102 G1 X159.264 Y191.034 E.17424
N13103 G1 X164.683 Y196.453 E.24642
N13104 G1 X165.755 Y196.453 E.03447
N13105 G1 X185.29 Y123.547 E2.42708
N13106 G1 X186.918 Y123.547 E.05236
N13107 M204 S10000
N13108 G1 X178.49 Y123.547 F60000
N13109 G1 F8475
N13110 M204 S8000
N13111 G1 X176.861 Y123.547 E.05236
N13112 G1 X159.264 Y189.22 E2.18629
N13113 G1 X159.264 Y188.98 E.00771
N13114 G1 X190.736 Y180.547 E1.0477
N13115 G1 X190.736 Y176.449 E.13177
N13116 G1 X159.264 Y144.978 E1.43118
N13117 G1 X159.264 Y146.836 E.05974
N13118 G1 X190.736 Y138.403 E1.0477
N13119 G1 X190.736 Y141.908 E.11268
N13120 G1 X172.375 Y123.547 E.83496
N13121 G1 X168.433 Y123.547 E.12678
N13122 G1 X159.264 Y157.763 E1.13907
N13123 G1 X159.264 Y163.694 E.19071
N13124 G1 X190.736 Y155.261 E1.0477
N13125 G1 X190.736 Y153.422 E.05915
N13126 G1 X160.861 Y123.547 E1.35857
N13127 G1 X160.004 Y123.547 E.02757
N13128 G1 X159.264 Y126.306 E.09185
N13129 G1 X159.264 Y127.935 E.05236
N13130 M204 S10000
N13131 G1 X159.264 Y140.036 F60000
N13132 G1 F8475
N13133 M204 S8000
N13134 G1 X159.264 Y138.407 E.05236
N13135 G1 X190.736 Y129.975 E1.0477
N13136 G1 X190.736 Y130.394 E.01348
N13137 G1 X183.889 Y123.547 E.31135
N13138 G1 X183.266 Y123.547 E.02002
N13139 G1 X159.264 Y129.978 E.79904
N13140 G1 X159.264 Y133.464 E.1121
N13141 G1 X190.736 Y164.936 E1.43118
N13142 G1 X190.736 Y166.138 E.03867
N13143 G1 X182.613 Y196.453 E1.0092
N13144 G1 X187.711 Y196.453 E.16394
N13145 G1 X159.264 Y168.006 E1.29363
N13146 G1 X159.264 Y172.122 E.13236
N13147 G1 X190.736 Y163.69 E1.0477
N13148 G1 X190.736 Y162.061 E.05236
N13149 ; WIPE_START
N13150 G1 X190.736 Y163.69 E-.61876
N13151 G1 X190.377 Y163.786 E-.14124
N13152 ; WIPE_END
N13153 G1 E-.04 F1800
N13154 M204 S10000
N13155 G17
N13156 G3 Z11.2 I1.217 J0 P1  F60000
N13157 ; stop printing object, unique label id: 130
N13158 M625
N13159 ; object ids of layer 54 start: 130
N13160 M624 AQAAAAAAAAA=
N13161 ;======== H2D 20250527========
N13162 ; SKIPPABLE_START
N13163 ; SKIPTYPE: timelapse
N13164 M622.1 S1 ; for prev firware, default turned on
N13165 
N13166 M1002 judge_flag timelapse_record_flag
N13167 
N13168 M622 J1
N13169 M993 A2 B2 C2
N13170 M993 A0 B0 C0
N13171 
N13172 
N13173 
N13174 
N13175     M9711 M0 E1 X260 Y137 Z11.2 S11 C10 O0 T3000
N13176 
N13177 
N13178 
N13179 M993 A3 B3 C3
N13180 
N13181 M623
N13182 ; SKIPPABLE_END
N13183 
N13184 ; object ids of this layer54 end: 130
N13185 M625
N13186 ; CHANGE_LAYER
N13187 ; Z_HEIGHT: 11
N13188 ; LAYER_HEIGHT: 0.2
N13189 ;======== H2D 20250521========
N13190 ; layer num/total_layer_count: 55/63
N13191 ; update layer progress
N13192 M73 L55
N13193 M991 S0 P54 ;notify layer change
N13194 
N13195 
N13196 ; OBJECT_ID: 130
N13197 ; COOLING_NODE: 0
N13198 ; start printing object, unique label id: 130
N13199 M624 AQAAAAAAAAA=
N13200 G1 X191.084 Y196.801 F60000
N13201 G1 Z11
N13202 G1 E.8 F1800
N13203 ; FEATURE: Inner wall
N13204 ; LINE_WIDTH: 0.45
N13205 ; LAYER_HEIGHT: 0.2
N13206 G1 F8475
N13207 M204 S8000
N13208 G1 X158.916 Y196.801 E1.03439
N13209 G1 X158.916 Y123.199 E2.36678
N13210 G1 X191.084 Y123.199 E1.03439
N13211 G1 X191.084 Y196.741 E2.36485
N13212 ; COOLING_NODE: 0
N13213 M204 S10000
N13214 G1 X191.491 Y197.208 F60000
N13215 G1 F8475
N13216 M204 S8000
N13217 G1 X158.509 Y197.208 E1.06057
N13218 G1 X158.509 Y122.792 E2.39296
N13219 G1 X191.491 Y122.792 E1.06057
N13220 G1 X191.491 Y197.148 E2.39103
N13221 ; COOLING_NODE: 0
N13222 M204 S10000
N13223 G1 X191.898 Y197.615 F60000
N13224 G1 F8475
N13225 M204 S8000
N13226 G1 X158.102 Y197.615 E1.08675
N13227 G1 X158.102 Y122.385 E2.41914
N13228 G1 X191.898 Y122.385 E1.08675
N13229 G1 X191.898 Y197.555 E2.41721
N13230 ; COOLING_NODE: 0
N13231 M204 S10000
N13232 G1 X192.29 Y198.007 F60000
N13233 ; FEATURE: Outer wall
N13234 ; LINE_WIDTH: 0.42
N13235 G1 F9149.261
N13236 M204 S5000
N13237 G1 X157.71 Y198.007 E1.03002
N13238 G1 X157.71 Y121.993 E2.26421
N13239 G1 X192.29 Y121.993 E1.03002
N13240 G1 X192.29 Y197.947 E2.26243
N13241 G1 E-.8 F1800
N13242 M204 S10000
N13243 M73 P82 R6
N13244 G1 X191.534 Y190.352 Z11.4 F60000
N13245 G1 X190.736 Y182.322 Z11.4
N13246 G1 Z11
N13247 G1 E.8 F1800
N13248 ; FEATURE: Sparse infill
N13249 ; LINE_WIDTH: 0.45
N13250 G1 F8475
N13251 M204 S8000
N13252 G1 X190.736 Y180.694 E.05236
N13253 G1 X159.264 Y189.126 E1.0477
N13254 G1 X159.264 Y188.673 E.01457
N13255 G1 X176.715 Y123.547 E2.1681
N13256 G1 X172.575 Y123.547 E.13312
N13257 G1 X190.736 Y141.708 E.82586
N13258 G1 X190.736 Y138.55 E.10154
N13259 G1 X159.264 Y146.982 E1.0477
N13260 G1 X159.264 Y144.778 E.07088
N13261 G1 X190.736 Y176.249 E1.43118
N13262 G1 X190.736 Y172.265 E.12813
N13263 G1 X159.264 Y180.698 E1.0477
N13264 G1 X159.264 Y179.32 E.04429
N13265 G1 X176.397 Y196.453 E.77912
N13266 G1 X174.038 Y196.453 E.07587
N13267 G1 X190.736 Y134.135 E2.0746
N13268 G1 X190.736 Y132.507 E.05236
N13269 M204 S10000
N13270 G1 X186.772 Y123.547 F60000
N13271 G1 F8475
N13272 M204 S8000
N13273 G1 X185.144 Y123.547 E.05236
N13274 G1 X165.609 Y196.453 E2.42708
N13275 G1 X164.883 Y196.453 E.02333
N13276 G1 X159.264 Y190.834 E.25551
N13277 G1 X159.264 Y196.453 E.18067
N13278 G1 X163.379 Y196.453 E.1323
N13279 G1 X190.736 Y189.123 E.91072
N13280 G1 X190.736 Y187.763 E.04371
N13281 G1 X159.264 Y156.292 E1.43118
N13282 M204 S10000
N13283 G1 X159.264 Y153.783 F60000
N13284 G1 F8475
N13285 M204 S8000
N13286 G1 X159.264 Y155.411 E.05236
N13287 G1 X190.736 Y146.979 E1.0477
N13288 G1 X190.736 Y148.607 E.05236
N13289 M204 S10000
N13290 G1 X190.736 Y162.208 F60000
N13291 G1 F8475
N13292 M204 S8000
N13293 G1 X190.736 Y163.836 E.05236
N13294 G1 X159.264 Y172.269 E1.0477
N13295 G1 X159.264 Y173.897 E.05236
N13296 M204 S10000
N13297 G1 X159.264 Y158.845 F60000
N13298 G1 F8475
N13299 M204 S8000
N13300 G1 X159.264 Y157.217 E.05236
N13301 G1 X168.286 Y123.547 E1.12088
N13302 G1 X166.658 Y123.547 E.05236
N13303 M204 S10000
N13304 G1 X159.264 Y127.388 F60000
N13305 G1 F8475
N13306 M204 S8000
N13307 G1 X159.264 Y125.76 E.05236
N13308 G1 X159.857 Y123.547 E.07366
N13309 G1 X161.061 Y123.547 E.03871
N13310 G1 X190.736 Y153.222 E1.34947
N13311 G1 X190.736 Y155.407 E.07029
N13312 G1 X159.264 Y163.84 E1.04769
N13313 G1 X159.264 Y167.806 E.12754
N13314 G1 X187.911 Y196.453 E1.30273
N13315 G1 X182.466 Y196.453 E.17508
N13316 G1 X190.736 Y165.592 E1.02739
N13317 G1 X190.736 Y164.736 E.02753
N13318 G1 X159.264 Y133.264 E1.43118
N13319 G1 X159.264 Y130.125 E.10096
N13320 G1 X183.813 Y123.547 E.81723
N13321 G1 X184.089 Y123.547 E.00888
N13322 G1 X190.736 Y130.194 E.30226
N13323 G1 X190.736 Y130.121 E.00234
N13324 G1 X159.264 Y138.554 E1.0477
N13325 G1 X159.264 Y140.182 E.05236
N13326 ; WIPE_START
N13327 G1 X159.264 Y138.554 E-.61876
N13328 G1 X159.623 Y138.457 E-.14124
N13329 ; WIPE_END
N13330 G1 E-.04 F1800
N13331 M204 S10000
N13332 G17
N13333 G3 Z11.4 I1.217 J0 P1  F60000
N13334 ; stop printing object, unique label id: 130
N13335 M625
N13336 ; object ids of layer 55 start: 130
N13337 M624 AQAAAAAAAAA=
N13338 ;======== H2D 20250527========
N13339 ; SKIPPABLE_START
N13340 ; SKIPTYPE: timelapse
N13341 M622.1 S1 ; for prev firware, default turned on
N13342 
N13343 M1002 judge_flag timelapse_record_flag
N13344 
N13345 M622 J1
N13346 M993 A2 B2 C2
N13347 M993 A0 B0 C0
N13348 
N13349 
N13350 
N13351 
N13352     M9711 M0 E1 X260 Y137 Z11.4 S11 C10 O0 T3000
N13353 
N13354 
N13355 
N13356 M993 A3 B3 C3
N13357 
N13358 M623
N13359 ; SKIPPABLE_END
N13360 
N13361 ; object ids of this layer55 end: 130
N13362 M625
N13363 ; CHANGE_LAYER
N13364 ; Z_HEIGHT: 11.2
N13365 ; LAYER_HEIGHT: 0.2
N13366 ;======== H2D 20250521========
N13367 ; layer num/total_layer_count: 56/63
N13368 ; update layer progress
N13369 M73 L56
N13370 M991 S0 P55 ;notify layer change
N13371 
N13372 
N13373 ; OBJECT_ID: 130
N13374 ; COOLING_NODE: 0
N13375 ; start printing object, unique label id: 130
N13376 M624 AQAAAAAAAAA=
N13377 G1 X191.084 Y196.801 F60000
N13378 G1 Z11.2
N13379 G1 E.8 F1800
N13380 ; FEATURE: Inner wall
N13381 ; LINE_WIDTH: 0.45
N13382 ; LAYER_HEIGHT: 0.2
N13383 G1 F8475
N13384 M204 S8000
N13385 G1 X158.916 Y196.801 E1.03439
N13386 G1 X158.916 Y123.199 E2.36678
N13387 G1 X191.084 Y123.199 E1.03439
N13388 G1 X191.084 Y196.741 E2.36485
N13389 ; COOLING_NODE: 0
N13390 M204 S10000
N13391 G1 X191.491 Y197.208 F60000
N13392 G1 F8475
N13393 M204 S8000
N13394 G1 X158.509 Y197.208 E1.06057
N13395 G1 X158.509 Y122.792 E2.39296
N13396 G1 X191.491 Y122.792 E1.06057
N13397 G1 X191.491 Y197.148 E2.39103
N13398 ; COOLING_NODE: 0
N13399 M204 S10000
N13400 G1 X191.898 Y197.615 F60000
N13401 G1 F8475
N13402 M204 S8000
N13403 G1 X158.102 Y197.615 E1.08675
N13404 G1 X158.102 Y122.385 E2.41914
N13405 G1 X191.898 Y122.385 E1.08675
N13406 G1 X191.898 Y197.555 E2.41721
N13407 ; COOLING_NODE: 0
N13408 M204 S10000
N13409 G1 X192.29 Y198.007 F60000
N13410 ; FEATURE: Outer wall
N13411 ; LINE_WIDTH: 0.42
N13412 G1 F9149.261
N13413 M204 S5000
N13414 G1 X157.71 Y198.007 E1.03002
N13415 G1 X157.71 Y121.993 E2.26421
N13416 G1 X192.29 Y121.993 E1.03002
N13417 G1 X192.29 Y197.947 E2.26243
N13418 G1 E-.8 F1800
N13419 M204 S10000
N13420 G1 X191.527 Y190.353 Z11.6 F60000
N13421 G1 X190.736 Y182.469 Z11.6
N13422 G1 Z11.2
N13423 G1 E.8 F1800
N13424 ; FEATURE: Sparse infill
N13425 ; LINE_WIDTH: 0.45
N13426 G1 F8475
N13427 M204 S8000
N13428 G1 X190.736 Y180.84 E.05236
N13429 G1 X159.264 Y189.273 E1.04769
N13430 G1 X159.264 Y188.127 E.03685
N13431 G1 X176.569 Y123.547 E2.1499
N13432 G1 X172.775 Y123.547 E.12198
N13433 G1 X190.736 Y141.508 E.81677
N13434 G1 X190.736 Y138.696 E.0904
N13435 G1 X159.264 Y147.129 E1.04769
N13436 G1 X159.264 Y144.578 E.08201
N13437 G1 X190.736 Y176.049 E1.43118
N13438 G1 X190.736 Y172.411 E.11699
N13439 G1 X159.264 Y180.844 E1.0477
N13440 G1 X159.264 Y179.12 E.05543
N13441 G1 X176.597 Y196.453 E.78821
N13442 G1 X173.891 Y196.453 E.08701
N13443 G1 X190.736 Y133.589 E2.0928
N13444 G1 X190.736 Y131.96 E.05236
N13445 M204 S10000
N13446 G1 X186.626 Y123.547 F60000
N13447 G1 F8475
N13448 M204 S8000
N13449 G1 X184.997 Y123.547 E.05236
N13450 G1 X165.462 Y196.453 E2.42708
N13451 G1 X167.091 Y196.453 E.05236
N13452 M204 S10000
N13453 G1 X165.083 Y196.453 F60000
N13454 G1 F8475
N13455 M204 S8000
N13456 G1 X159.264 Y190.634 E.26461
N13457 G1 X159.264 Y196.453 E.18711
N13458 G1 X163.925 Y196.453 E.14988
N13459 G1 X190.736 Y189.269 E.89253
N13460 G1 X190.736 Y187.563 E.05484
N13461 G1 X159.264 Y156.092 E1.43118
N13462 M204 S10000
N13463 G1 X159.264 Y155.558 F60000
N13464 G1 F8475
N13465 M204 S8000
N13466 G1 X190.736 Y147.125 E1.0477
N13467 G1 X190.736 Y148.753 E.05236
N13468 M204 S10000
N13469 G1 X190.736 Y162.354 F60000
N13470 G1 F8475
N13471 M204 S8000
N13472 G1 X190.736 Y163.983 E.05236
N13473 G1 X159.264 Y172.415 E1.0477
N13474 G1 X159.264 Y174.044 E.05236
N13475 M204 S10000
N13476 G1 X159.264 Y158.299 F60000
N13477 G1 F8475
N13478 M204 S8000
N13479 G1 X159.264 Y156.67 E.05236
N13480 G1 X168.14 Y123.547 E1.10269
N13481 G1 X166.511 Y123.547 E.05236
N13482 M204 S10000
N13483 G1 X159.264 Y126.842 F60000
N13484 G1 F8475
N13485 M204 S8000
N13486 G1 X159.264 Y125.214 E.05236
N13487 G1 X159.711 Y123.547 E.05547
N13488 G1 X161.261 Y123.547 E.04985
N13489 G1 X190.736 Y153.022 E1.34038
N13490 G1 X190.736 Y155.554 E.08143
N13491 G1 X159.264 Y163.986 E1.0477
N13492 G1 X159.264 Y167.606 E.1164
N13493 G1 X188.111 Y196.453 E1.31182
N13494 G1 X182.32 Y196.453 E.18622
N13495 G1 X190.736 Y165.045 E1.04558
N13496 G1 X190.736 Y164.536 E.01639
N13497 G1 X159.264 Y133.064 E1.43118
N13498 G1 X159.264 Y130.271 E.08982
N13499 G1 X184.359 Y123.547 E.83542
N13500 G1 X184.289 Y123.547 E.00226
N13501 M73 P83 R6
N13502 G1 X190.736 Y129.994 E.29316
N13503 G1 X190.736 Y130.267 E.0088
N13504 G1 X159.264 Y138.7 E1.0477
N13505 G1 X159.264 Y140.328 E.05236
N13506 ; WIPE_START
N13507 G1 X159.264 Y138.7 E-.61876
N13508 G1 X159.623 Y138.604 E-.14124
N13509 ; WIPE_END
N13510 G1 E-.04 F1800
N13511 M204 S10000
N13512 G17
N13513 G3 Z11.6 I1.217 J0 P1  F60000
N13514 ; stop printing object, unique label id: 130
N13515 M625
N13516 ; object ids of layer 56 start: 130
N13517 M624 AQAAAAAAAAA=
N13518 ;======== H2D 20250527========
N13519 ; SKIPPABLE_START
N13520 ; SKIPTYPE: timelapse
N13521 M622.1 S1 ; for prev firware, default turned on
N13522 
N13523 M1002 judge_flag timelapse_record_flag
N13524 
N13525 M622 J1
N13526 M993 A2 B2 C2
N13527 M993 A0 B0 C0
N13528 
N13529 
N13530 
N13531 
N13532     M9711 M0 E1 X260 Y137 Z11.6 S11 C10 O0 T3000
N13533 
N13534 
N13535 
N13536 M993 A3 B3 C3
N13537 
N13538 M623
N13539 ; SKIPPABLE_END
N13540 
N13541 ; object ids of this layer56 end: 130
N13542 M625
N13543 ; CHANGE_LAYER
N13544 ; Z_HEIGHT: 11.4
N13545 ; LAYER_HEIGHT: 0.2
N13546 ;======== H2D 20250521========
N13547 ; layer num/total_layer_count: 57/63
N13548 ; update layer progress
N13549 M73 L57
N13550 M991 S0 P56 ;notify layer change
N13551 
N13552 
N13553 ; OBJECT_ID: 130
N13554 ; COOLING_NODE: 0
N13555 ; start printing object, unique label id: 130
N13556 M624 AQAAAAAAAAA=
N13557 G1 X191.084 Y196.801 F60000
N13558 G1 Z11.4
N13559 G1 E.8 F1800
N13560 ; FEATURE: Inner wall
N13561 ; LINE_WIDTH: 0.45
N13562 ; LAYER_HEIGHT: 0.2
N13563 G1 F8475
N13564 M204 S8000
N13565 G1 X158.916 Y196.801 E1.03439
N13566 G1 X158.916 Y123.199 E2.36678
N13567 G1 X191.084 Y123.199 E1.03439
N13568 G1 X191.084 Y196.741 E2.36485
N13569 ; COOLING_NODE: 0
N13570 M204 S10000
N13571 G1 X191.491 Y197.208 F60000
N13572 G1 F8475
N13573 M204 S8000
N13574 G1 X158.509 Y197.208 E1.06057
N13575 G1 X158.509 Y122.792 E2.39296
N13576 G1 X191.491 Y122.792 E1.06057
N13577 G1 X191.491 Y197.148 E2.39103
N13578 ; COOLING_NODE: 0
N13579 M204 S10000
N13580 G1 X191.898 Y197.615 F60000
N13581 G1 F8475
N13582 M204 S8000
N13583 G1 X158.102 Y197.615 E1.08675
N13584 G1 X158.102 Y122.385 E2.41914
N13585 G1 X191.898 Y122.385 E1.08675
N13586 G1 X191.898 Y197.555 E2.41721
N13587 ; COOLING_NODE: 0
N13588 M204 S10000
N13589 G1 X192.29 Y198.007 F60000
N13590 ; FEATURE: Outer wall
N13591 ; LINE_WIDTH: 0.42
N13592 G1 F9149.261
N13593 M204 S5000
N13594 G1 X157.71 Y198.007 E1.03002
N13595 G1 X157.71 Y121.993 E2.26421
N13596 G1 X192.29 Y121.993 E1.03002
N13597 G1 X192.29 Y197.947 E2.26243
N13598 G1 E-.8 F1800
N13599 M204 S10000
N13600 G1 X191.52 Y190.354 Z11.8 F60000
N13601 G1 X190.736 Y182.615 Z11.8
N13602 G1 Z11.4
N13603 G1 E.8 F1800
N13604 ; FEATURE: Sparse infill
N13605 ; LINE_WIDTH: 0.45
N13606 G1 F8475
N13607 M204 S8000
N13608 G1 X190.736 Y180.987 E.05236
N13609 G1 X159.264 Y189.419 E1.0477
N13610 G1 X159.264 Y190.434 E.03264
N13611 G1 X165.283 Y196.453 E.2737
N13612 M204 S10000
N13613 G1 X165.316 Y196.453 F60000
N13614 G1 F8475
N13615 M204 S8000
N13616 G1 X184.851 Y123.547 E2.42708
N13617 G1 X184.906 Y123.547 E.00176
N13618 G1 X159.264 Y130.418 E.85361
N13619 G1 X159.264 Y132.864 E.07868
N13620 G1 X190.736 Y164.336 E1.43118
N13621 G1 X190.736 Y164.499 E.00525
N13622 G1 X182.174 Y196.453 E1.06377
N13623 G1 X188.311 Y196.453 E.19736
N13624 G1 X159.264 Y167.406 E1.32092
N13625 G1 X159.264 Y164.133 E.10526
N13626 G1 X190.736 Y155.7 E1.0477
N13627 G1 X190.736 Y152.822 E.09257
N13628 G1 X161.461 Y123.547 E1.33128
N13629 G1 X159.565 Y123.547 E.06099
N13630 G1 X159.264 Y124.667 E.03728
N13631 G1 X159.264 Y126.295 E.05236
N13632 M204 S10000
N13633 G1 X166.365 Y123.547 F60000
N13634 G1 F8475
N13635 M204 S8000
N13636 G1 X167.993 Y123.547 E.05236
N13637 G1 X159.264 Y156.124 E1.0845
N13638 G1 X159.264 Y155.892 E.00744
N13639 G1 X190.736 Y187.363 E1.43118
N13640 G1 X190.736 Y189.415 E.06598
N13641 G1 X164.472 Y196.453 E.87434
N13642 G1 X162.843 Y196.453 E.05236
N13643 M204 S10000
N13644 G1 X159.264 Y189.209 F60000
N13645 G1 F8475
N13646 M204 S8000
N13647 G1 X159.264 Y187.58 E.05236
N13648 G1 X176.422 Y123.547 E2.13171
N13649 G1 X172.975 Y123.547 E.11084
N13650 G1 X190.736 Y141.308 E.80767
N13651 G1 X190.736 Y138.843 E.07927
N13652 G1 X159.264 Y147.275 E1.0477
N13653 G1 X159.264 Y144.378 E.09315
N13654 G1 X190.736 Y175.849 E1.43118
N13655 G1 X190.736 Y172.558 E.10585
N13656 G1 X159.264 Y180.99 E1.0477
N13657 G1 X159.264 Y178.92 E.06657
N13658 G1 X176.797 Y196.453 E.79731
N13659 G1 X173.745 Y196.453 E.09815
N13660 G1 X190.736 Y133.042 E2.11099
N13661 G1 X190.736 Y131.414 E.05236
N13662 M204 S10000
N13663 G1 X184.489 Y123.547 F60000
N13664 G1 F8475
N13665 M204 S8000
N13666 G1 X190.736 Y129.794 E.28407
N13667 G1 X190.736 Y130.414 E.01994
N13668 G1 X159.264 Y138.847 E1.0477
N13669 G1 X159.264 Y137.218 E.05236
N13670 M204 S10000
N13671 G1 X159.264 Y155.704 F60000
N13672 G1 F8475
N13673 M204 S8000
N13674 G1 X190.736 Y147.271 E1.0477
N13675 G1 X190.736 Y145.643 E.05236
N13676 M204 S10000
N13677 G1 X190.736 Y162.501 F60000
N13678 G1 F8475
N13679 M204 S8000
N13680 G1 X190.736 Y164.129 E.05236
N13681 G1 X159.264 Y172.562 E1.0477
N13682 G1 X159.264 Y174.19 E.05236
N13683 ; WIPE_START
N13684 G1 X159.264 Y172.562 E-.61876
N13685 G1 X159.623 Y172.465 E-.14124
N13686 ; WIPE_END
N13687 G1 E-.04 F1800
N13688 M204 S10000
N13689 G17
N13690 G3 Z11.8 I1.217 J0 P1  F60000
N13691 ; stop printing object, unique label id: 130
N13692 M625
N13693 ; object ids of layer 57 start: 130
N13694 M624 AQAAAAAAAAA=
N13695 ;======== H2D 20250527========
N13696 ; SKIPPABLE_START
N13697 ; SKIPTYPE: timelapse
N13698 M622.1 S1 ; for prev firware, default turned on
N13699 
N13700 M1002 judge_flag timelapse_record_flag
N13701 
N13702 M622 J1
N13703 M993 A2 B2 C2
N13704 M993 A0 B0 C0
N13705 
N13706 
N13707 
N13708 
N13709     M9711 M0 E1 X260 Y137 Z11.8 S11 C10 O0 T3000
N13710 
N13711 
N13712 
N13713 M993 A3 B3 C3
N13714 
N13715 M623
N13716 ; SKIPPABLE_END
N13717 
N13718 ; object ids of this layer57 end: 130
N13719 M625
N13720 ; CHANGE_LAYER
N13721 ; Z_HEIGHT: 11.6
N13722 ; LAYER_HEIGHT: 0.200001
N13723 ;======== H2D 20250521========
N13724 ; layer num/total_layer_count: 58/63
N13725 ; update layer progress
N13726 M73 L58
N13727 M991 S0 P57 ;notify layer change
N13728 
N13729 
N13730 M106 S71.4
N13731 ; OBJECT_ID: 130
N13732 ; COOLING_NODE: 0
N13733 ; start printing object, unique label id: 130
N13734 M624 AQAAAAAAAAA=
N13735 G1 X191.084 Y196.801 F60000
N13736 G1 Z11.6
N13737 G1 E.8 F1800
N13738 ; FEATURE: Inner wall
N13739 ; LINE_WIDTH: 0.45
N13740 ; LAYER_HEIGHT: 0.2
N13741 G1 F8475
N13742 M204 S8000
N13743 G1 X158.916 Y196.801 E1.03439
N13744 G1 X158.916 Y123.199 E2.36678
N13745 G1 X191.084 Y123.199 E1.03439
N13746 G1 X191.084 Y196.741 E2.36485
N13747 ; COOLING_NODE: 0
N13748 M204 S10000
N13749 G1 X191.491 Y197.208 F60000
N13750 G1 F8475
N13751 M204 S8000
N13752 G1 X158.509 Y197.208 E1.06057
N13753 G1 X158.509 Y122.792 E2.39296
N13754 G1 X191.491 Y122.792 E1.06057
N13755 G1 X191.491 Y197.148 E2.39103
N13756 ; COOLING_NODE: 0
N13757 M204 S10000
N13758 G1 X191.898 Y197.615 F60000
N13759 G1 F8475
N13760 M204 S8000
N13761 G1 X158.102 Y197.615 E1.08675
N13762 G1 X158.102 Y122.385 E2.41914
N13763 G1 X191.898 Y122.385 E1.08675
N13764 G1 X191.898 Y197.555 E2.41721
N13765 ; COOLING_NODE: 0
N13766 M204 S10000
N13767 G1 X192.29 Y198.007 F60000
N13768 ; FEATURE: Outer wall
N13769 ; LINE_WIDTH: 0.42
N13770 G1 F9149.261
N13771 M204 S5000
N13772 G1 X157.71 Y198.007 E1.03002
N13773 G1 X157.71 Y121.993 E2.26421
N13774 G1 X192.29 Y121.993 E1.03002
N13775 G1 X192.29 Y197.947 E2.26243
N13776 G1 E-.8 F1800
N13777 M204 S10000
N13778 G1 X191.491 Y190.357 Z12 F60000
N13779 G1 X190.358 Y179.606 Z12
N13780 G1 Z11.6
N13781 G1 E.8 F1800
N13782 ; FEATURE: Sparse infill
N13783 ; LINE_WIDTH: 0.45
N13784 G1 F8475
N13785 M204 S8000
N13786 G1 X190.358 Y181.234 E.05236
N13787 G1 X159.642 Y189.465 E1.02258
N13788 G1 X159.642 Y190.611 E.03687
N13789 G1 X165.106 Y196.076 E.24849
N13790 G1 X165.271 Y196.076 E.0053
N13791 G1 X184.603 Y123.924 E2.40197
N13792 G1 X185.066 Y123.924 E.01488
N13793 G1 X190.358 Y129.217 E.24067
N13794 G1 X190.358 Y130.661 E.04646
N13795 M73 P84 R6
N13796 G1 X159.642 Y138.892 E1.02258
N13797 G1 X159.642 Y137.264 E.05236
N13798 M204 S10000
N13799 M73 P84 R5
N13800 G1 X159.642 Y155.546 F60000
N13801 G1 F8475
N13802 M204 S8000
N13803 G1 X159.642 Y154.17 E.04425
N13804 G1 X167.746 Y123.924 E1.00689
N13805 G1 X162.038 Y123.924 E.18353
N13806 G1 X190.358 Y152.244 E1.28788
N13807 G1 X190.358 Y155.948 E.11908
N13808 G1 X159.642 Y164.178 E1.02258
N13809 G1 X159.642 Y167.583 E.1095
N13810 G1 X188.134 Y196.076 E1.29571
N13811 G1 X182.128 Y196.076 E.19312
N13812 G1 X190.358 Y165.36 E1.02254
N13813 G1 X190.358 Y164.58 E.02508
N13814 M204 S10000
N13815 G1 X190.358 Y145.891 F60000
N13816 G1 F8475
N13817 M204 S8000
N13818 G1 X190.358 Y147.519 E.05236
N13819 G1 X159.642 Y155.749 E1.02258
N13820 G1 X159.642 Y156.07 E.01029
N13821 G1 X190.358 Y186.786 E1.39687
N13822 G1 X190.358 Y189.663 E.0925
N13823 G1 X166.426 Y196.076 E.79674
N13824 G1 X165.474 Y196.076 E.0306
N13825 M204 S10000
N13826 G1 X159.642 Y187.255 F60000
N13827 G1 F8475
N13828 M204 S8000
N13829 G1 X159.642 Y185.626 E.05236
N13830 G1 X176.175 Y123.924 E2.05411
N13831 G1 X173.552 Y123.924 E.08433
N13832 G1 X190.358 Y140.73 E.76428
N13833 G1 X190.358 Y139.09 E.05275
N13834 G1 X159.642 Y147.321 E1.02258
N13835 G1 X159.642 Y144.556 E.08891
N13836 G1 X190.358 Y175.272 E1.39687
N13837 G1 X190.358 Y172.805 E.07933
N13838 G1 X159.642 Y181.036 E1.02258
N13839 G1 X159.642 Y179.097 E.06233
N13840 G1 X176.62 Y196.076 E.7721
N13841 G1 X173.699 Y196.076 E.09391
N13842 G1 X190.358 Y133.903 E2.06976
N13843 G1 X190.358 Y132.275 E.05236
N13844 M204 S10000
N13845 G1 X190.562 Y123.562 F60000
N13846 ; FEATURE: Floating vertical shell
N13847 ; LINE_WIDTH: 0.383001
N13848 G1 F10144.655
N13849 M204 S8000
N13850 G1 X159.438 Y123.562 E.83611
N13851 G1 X159.306 Y123.589 E.00362
N13852 G1 X159.279 Y123.721 E.00362
N13853 G1 X159.279 Y196.279 E1.9492
N13854 G1 X159.306 Y196.411 E.00362
N13855 G1 X159.438 Y196.438 E.00362
N13856 G1 X190.562 Y196.438 E.83611
N13857 G1 X190.694 Y196.411 E.00362
N13858 G1 X190.721 Y196.279 E.00362
N13859 G1 X190.721 Y123.721 E1.9492
N13860 G1 X190.694 Y123.589 E.00362
N13861 G1 X190.621 Y123.574 E.00201
N13862 M204 S10000
N13863 G1 X184.4 Y123.924 F60000
N13864 ; FEATURE: Sparse infill
N13865 ; LINE_WIDTH: 0.45
N13866 G1 F8475
N13867 M204 S8000
N13868 G1 X184.044 Y123.924 E.01143
N13869 G1 X159.642 Y130.463 E.81239
N13870 G1 X159.642 Y133.042 E.08292
N13871 G1 X190.358 Y163.758 E1.39687
N13872 G1 X190.358 Y164.377 E.01988
N13873 G1 X159.642 Y172.607 E1.02258
N13874 G1 X159.642 Y174.235 E.05236
N13875 ; WIPE_START
N13876 G1 X159.642 Y172.607 E-.61876
N13877 G1 X160.001 Y172.511 E-.14124
N13878 ; WIPE_END
N13879 G1 E-.04 F1800
N13880 M204 S10000
N13881 G17
N13882 G3 Z12 I1.217 J0 P1  F60000
N13883 ; stop printing object, unique label id: 130
N13884 M625
N13885 ; object ids of layer 58 start: 130
N13886 M624 AQAAAAAAAAA=
N13887 ;======== H2D 20250527========
N13888 ; SKIPPABLE_START
N13889 ; SKIPTYPE: timelapse
N13890 M622.1 S1 ; for prev firware, default turned on
N13891 
N13892 M1002 judge_flag timelapse_record_flag
N13893 
N13894 M622 J1
N13895 M993 A2 B2 C2
N13896 M993 A0 B0 C0
N13897 
N13898 
N13899 
N13900 
N13901     M9711 M0 E1 X260 Y137 Z12 S11 C10 O0 T3000
N13902 
N13903 
N13904 
N13905 M993 A3 B3 C3
N13906 
N13907 M623
N13908 ; SKIPPABLE_END
N13909 
N13910 ; object ids of this layer58 end: 130
N13911 M625
N13912 ; CHANGE_LAYER
N13913 ; Z_HEIGHT: 11.8
N13914 ; LAYER_HEIGHT: 0.2
N13915 ;======== H2D 20250521========
N13916 ; layer num/total_layer_count: 59/63
N13917 ; update layer progress
N13918 M73 L59
N13919 M991 S0 P58 ;notify layer change
N13920 
N13921 
N13922 M106 S12.75
N13923 ; OBJECT_ID: 130
N13924 ; COOLING_NODE: 0
N13925 ; start printing object, unique label id: 130
N13926 M624 AQAAAAAAAAA=
N13927 G1 X191.084 Y196.801 F60000
N13928 G1 Z11.8
N13929 G1 E.8 F1800
N13930 ; FEATURE: Inner wall
N13931 ; LINE_WIDTH: 0.45
N13932 ; LAYER_HEIGHT: 0.2
N13933 G1 F8475
N13934 M204 S8000
N13935 G1 X158.916 Y196.801 E1.03439
N13936 G1 X158.916 Y123.199 E2.36678
N13937 G1 X191.084 Y123.199 E1.03439
N13938 G1 X191.084 Y196.741 E2.36485
N13939 ; COOLING_NODE: 0
N13940 M204 S10000
N13941 G1 X191.491 Y197.208 F60000
N13942 G1 F8475
N13943 M204 S8000
N13944 G1 X158.509 Y197.208 E1.06057
N13945 G1 X158.509 Y122.792 E2.39296
N13946 G1 X191.491 Y122.792 E1.06057
N13947 G1 X191.491 Y197.148 E2.39103
N13948 ; COOLING_NODE: 0
N13949 M204 S10000
N13950 G1 X191.898 Y197.615 F60000
N13951 G1 F8475
N13952 M204 S8000
N13953 G1 X158.102 Y197.615 E1.08675
N13954 G1 X158.102 Y122.385 E2.41914
N13955 G1 X191.898 Y122.385 E1.08675
N13956 G1 X191.898 Y197.555 E2.41721
N13957 ; COOLING_NODE: 0
N13958 M204 S10000
N13959 G1 X192.29 Y198.007 F60000
N13960 ; FEATURE: Outer wall
N13961 ; LINE_WIDTH: 0.42
N13962 G1 F9149.261
N13963 M204 S5000
N13964 G1 X157.71 Y198.007 E1.03002
N13965 G1 X157.71 Y121.993 E2.26421
N13966 G1 X192.29 Y121.993 E1.03002
N13967 G1 X192.29 Y197.947 E2.26243
N13968 G1 E-.8 F1800
N13969 M204 S10000
N13970 G1 X190.005 Y196.634 Z12.2 F60000
N13971 G1 Z11.8
N13972 G1 E.8 F1800
N13973 ; FEATURE: Bridge
N13974 ; LINE_WIDTH: 0.40079
N13975 ; LAYER_HEIGHT: 0.4
N13976 M106 S255
N13977 G1 F3000
N13978 M204 S8000
N13979 G1 X190.714 Y195.925 E.04995
N13980 G1 X190.714 Y195.287 E.03177
N13981 G1 X189.57 Y196.431 E.08061
N13982 G1 X188.933 Y196.431 E.03177
N13983 G1 X190.714 Y194.65 E.12553
N13984 G1 X190.714 Y194.012 E.03177
N13985 G1 X188.295 Y196.431 E.17045
N13986 G1 X187.658 Y196.431 E.03177
N13987 G1 X190.714 Y193.375 E.21538
N13988 G1 X190.714 Y192.737 E.03177
N13989 G1 X187.02 Y196.431 E.2603
N13990 G1 X186.383 Y196.431 E.03177
N13991 G1 X190.714 Y192.1 E.30523
N13992 G1 X190.714 Y191.462 E.03177
N13993 G1 X185.745 Y196.431 E.35015
N13994 G1 X185.108 Y196.431 E.03177
N13995 G1 X190.714 Y190.825 E.39508
N13996 G1 X190.714 Y190.187 E.03177
N13997 G1 X184.47 Y196.431 E.44
N13998 G1 X183.833 Y196.431 E.03177
N13999 G1 X190.714 Y189.55 E.48493
N14000 G1 X190.714 Y188.912 E.03177
N14001 G1 X183.195 Y196.431 E.52985
N14002 G1 X182.558 Y196.431 E.03177
N14003 G1 X190.714 Y188.275 E.57478
N14004 G1 X190.714 Y187.637 E.03177
N14005 G1 X181.92 Y196.431 E.6197
N14006 G1 X181.283 Y196.431 E.03177
N14007 G1 X190.714 Y187 E.66463
N14008 G1 X190.714 Y186.362 E.03177
N14009 G1 X180.645 Y196.431 E.70955
N14010 G1 X180.008 Y196.431 E.03177
N14011 G1 X190.714 Y185.725 E.75448
N14012 G1 X190.714 Y185.087 E.03177
N14013 G1 X179.37 Y196.431 E.7994
N14014 G1 X178.732 Y196.431 E.03177
N14015 G1 X190.714 Y184.45 E.84433
N14016 G1 X190.714 Y183.812 E.03177
N14017 G1 X178.095 Y196.431 E.88925
N14018 G1 X177.457 Y196.431 E.03177
N14019 G1 X190.714 Y183.175 E.93418
N14020 G1 X190.714 Y182.537 E.03177
N14021 G1 X176.82 Y196.431 E.9791
N14022 G1 X176.182 Y196.431 E.03177
N14023 G1 X190.714 Y181.9 E1.02403
N14024 G1 X190.714 Y181.262 E.03177
N14025 G1 X175.545 Y196.431 E1.06895
N14026 G1 X174.907 Y196.431 E.03177
N14027 G1 X190.714 Y180.625 E1.11387
N14028 G1 X190.714 Y179.987 E.03177
N14029 G1 X174.27 Y196.431 E1.1588
N14030 G1 X173.632 Y196.431 E.03177
N14031 G1 X190.714 Y179.35 E1.20372
N14032 G1 X190.714 Y178.712 E.03177
N14033 G1 X172.995 Y196.431 E1.24865
N14034 G1 X172.357 Y196.431 E.03177
N14035 G1 X190.714 Y178.075 E1.29357
N14036 G1 X190.714 Y177.437 E.03177
N14037 G1 X171.72 Y196.431 E1.3385
N14038 G1 X171.082 Y196.431 E.03177
N14039 M73 P85 R5
N14040 G1 X190.714 Y176.8 E1.38342
N14041 G1 X190.714 Y176.162 E.03177
N14042 G1 X170.445 Y196.431 E1.42835
N14043 G1 X169.807 Y196.431 E.03177
N14044 G1 X190.714 Y175.525 E1.47327
N14045 G1 X190.714 Y174.887 E.03177
N14046 G1 X169.17 Y196.431 E1.5182
N14047 G1 X168.532 Y196.431 E.03177
N14048 G1 X190.714 Y174.25 E1.56312
N14049 G1 X190.714 Y173.612 E.03177
N14050 G1 X167.895 Y196.431 E1.60805
N14051 G1 X167.257 Y196.431 E.03177
N14052 G1 X190.714 Y172.975 E1.65297
N14053 G1 X190.714 Y172.337 E.03177
N14054 G1 X166.62 Y196.431 E1.6979
N14055 G1 X165.982 Y196.431 E.03177
N14056 G1 X190.714 Y171.699 E1.74282
N14057 G1 X190.714 Y171.062 E.03177
N14058 G1 X165.345 Y196.431 E1.78775
N14059 G1 X164.707 Y196.431 E.03177
N14060 G1 X190.714 Y170.424 E1.83267
N14061 G1 X190.714 Y169.787 E.03177
N14062 G1 X164.07 Y196.431 E1.8776
N14063 G1 X163.432 Y196.431 E.03177
N14064 G1 X190.714 Y169.149 E1.92252
N14065 G1 X190.714 Y168.512 E.03177
N14066 G1 X162.795 Y196.431 E1.96744
N14067 G1 X162.157 Y196.431 E.03177
N14068 G1 X190.714 Y167.874 E2.01237
N14069 G1 X190.714 Y167.237 E.03177
N14070 G1 X161.52 Y196.431 E2.05729
N14071 G1 X160.882 Y196.431 E.03177
N14072 G1 X190.714 Y166.599 E2.10222
N14073 G1 X190.714 Y165.962 E.03177
N14074 G1 X160.245 Y196.431 E2.14714
N14075 G1 X159.607 Y196.431 E.03177
N14076 G1 X190.714 Y165.324 E2.19207
N14077 G1 X190.714 Y164.687 E.03177
N14078 G1 X159.286 Y196.115 E2.2147
N14079 G1 X159.286 Y195.477 E.03177
N14080 G1 X190.714 Y164.049 E2.2147
N14081 G1 X190.714 Y163.412 E.03177
N14082 G1 X159.286 Y194.84 E2.2147
N14083 G1 X159.286 Y194.202 E.03177
N14084 G1 X190.714 Y162.774 E2.2147
N14085 G1 X190.714 Y162.137 E.03177
N14086 G1 X159.286 Y193.565 E2.2147
N14087 G1 X159.286 Y192.927 E.03177
N14088 G1 X190.714 Y161.499 E2.2147
N14089 G1 X190.714 Y160.862 E.03177
N14090 G1 X159.286 Y192.29 E2.2147
N14091 G1 X159.286 Y191.652 E.03177
N14092 G1 X190.714 Y160.224 E2.2147
N14093 G1 X190.714 Y159.587 E.03177
N14094 G1 X159.286 Y191.015 E2.2147
N14095 G1 X159.286 Y190.377 E.03177
N14096 G1 X190.714 Y158.949 E2.2147
N14097 G1 X190.714 Y158.312 E.03177
N14098 M73 P86 R5
N14099 G1 X159.286 Y189.74 E2.2147
N14100 G1 X159.286 Y189.102 E.03177
N14101 G1 X190.714 Y157.674 E2.2147
N14102 G1 X190.714 Y157.037 E.03177
N14103 G1 X159.286 Y188.465 E2.2147
N14104 G1 X159.286 Y187.827 E.03177
N14105 G1 X190.714 Y156.399 E2.2147
N14106 G1 X190.714 Y155.762 E.03177
N14107 G1 X159.286 Y187.19 E2.2147
N14108 G1 X159.286 Y186.552 E.03177
N14109 G1 X190.714 Y155.124 E2.2147
N14110 G1 X190.714 Y154.487 E.03177
N14111 G1 X159.286 Y185.915 E2.2147
N14112 G1 X159.286 Y185.277 E.03177
N14113 G1 X190.714 Y153.849 E2.2147
N14114 G1 X190.714 Y153.212 E.03177
N14115 G1 X159.286 Y184.64 E2.2147
N14116 G1 X159.286 Y184.002 E.03177
N14117 G1 X190.714 Y152.574 E2.2147
N14118 G1 X190.714 Y151.937 E.03177
N14119 G1 X159.286 Y183.365 E2.2147
N14120 G1 X159.286 Y182.727 E.03177
N14121 G1 X190.714 Y151.299 E2.2147
N14122 G1 X190.714 Y150.662 E.03177
N14123 G1 X159.286 Y182.09 E2.2147
N14124 G1 X159.286 Y181.452 E.03177
N14125 G1 X190.714 Y150.024 E2.2147
N14126 G1 X190.714 Y149.387 E.03177
N14127 G1 X159.286 Y180.815 E2.2147
N14128 G1 X159.286 Y180.177 E.03177
N14129 G1 X190.714 Y148.749 E2.2147
N14130 G1 X190.714 Y148.112 E.03177
N14131 G1 X159.286 Y179.54 E2.2147
N14132 G1 X159.286 Y178.902 E.03177
N14133 M73 P86 R4
N14134 G1 X190.714 Y147.474 E2.2147
N14135 G1 X190.714 Y146.836 E.03177
N14136 G1 X159.286 Y178.265 E2.2147
N14137 G1 X159.286 Y177.627 E.03177
N14138 G1 X190.714 Y146.199 E2.2147
N14139 G1 X190.714 Y145.561 E.03177
N14140 G1 X159.286 Y176.99 E2.2147
N14141 G1 X159.286 Y176.352 E.03177
N14142 G1 X190.714 Y144.924 E2.2147
N14143 G1 X190.714 Y144.286 E.03177
N14144 G1 X159.286 Y175.715 E2.2147
N14145 G1 X159.286 Y175.077 E.03177
N14146 G1 X190.714 Y143.649 E2.2147
N14147 G1 X190.714 Y143.011 E.03177
N14148 M73 P87 R4
N14149 G1 X159.286 Y174.44 E2.2147
N14150 G1 X159.286 Y173.802 E.03177
N14151 G1 X190.714 Y142.374 E2.2147
N14152 G1 X190.714 Y141.736 E.03177
N14153 G1 X159.286 Y173.164 E2.2147
N14154 G1 X159.286 Y172.527 E.03177
N14155 G1 X190.714 Y141.099 E2.2147
N14156 G1 X190.714 Y140.461 E.03177
N14157 G1 X159.286 Y171.889 E2.2147
N14158 G1 X159.286 Y171.252 E.03177
N14159 G1 X190.714 Y139.824 E2.2147
N14160 G1 X190.714 Y139.186 E.03177
N14161 G1 X159.286 Y170.614 E2.2147
N14162 G1 X159.286 Y169.977 E.03177
N14163 G1 X190.714 Y138.549 E2.2147
N14164 G1 X190.714 Y137.911 E.03177
N14165 G1 X159.286 Y169.339 E2.2147
N14166 G1 X159.286 Y168.702 E.03177
N14167 G1 X190.714 Y137.274 E2.2147
N14168 G1 X190.714 Y136.636 E.03177
N14169 G1 X159.286 Y168.064 E2.2147
N14170 G1 X159.286 Y167.427 E.03177
N14171 G1 X190.714 Y135.999 E2.2147
N14172 G1 X190.714 Y135.361 E.03177
N14173 G1 X159.286 Y166.789 E2.2147
N14174 G1 X159.286 Y166.152 E.03177
N14175 G1 X190.714 Y134.724 E2.2147
N14176 G1 X190.714 Y134.086 E.03177
N14177 G1 X159.286 Y165.514 E2.2147
N14178 G1 X159.286 Y164.877 E.03177
N14179 G1 X190.714 Y133.449 E2.2147
N14180 G1 X190.714 Y132.811 E.03177
N14181 G1 X159.286 Y164.239 E2.2147
N14182 G1 X159.286 Y163.602 E.03177
N14183 G1 X190.714 Y132.174 E2.2147
N14184 G1 X190.714 Y131.536 E.03177
N14185 G1 X159.286 Y162.964 E2.2147
N14186 G1 X159.286 Y162.327 E.03177
N14187 G1 X190.714 Y130.899 E2.2147
N14188 G1 X190.714 Y130.261 E.03177
N14189 G1 X159.286 Y161.689 E2.2147
N14190 G1 X159.286 Y161.052 E.03177
N14191 G1 X190.714 Y129.624 E2.2147
N14192 G1 X190.714 Y128.986 E.03177
N14193 G1 X159.286 Y160.414 E2.2147
N14194 G1 X159.286 Y159.777 E.03177
N14195 G1 X190.714 Y128.349 E2.2147
N14196 G1 X190.714 Y127.711 E.03177
N14197 G1 X159.286 Y159.139 E2.2147
N14198 G1 X159.286 Y158.502 E.03177
N14199 M73 P88 R4
N14200 G1 X190.714 Y127.074 E2.2147
N14201 G1 X190.714 Y126.436 E.03177
N14202 G1 X159.286 Y157.864 E2.2147
N14203 G1 X159.286 Y157.227 E.03177
N14204 G1 X190.714 Y125.799 E2.2147
N14205 G1 X190.714 Y125.161 E.03177
N14206 G1 X159.286 Y156.589 E2.2147
N14207 G1 X159.286 Y155.952 E.03177
N14208 G1 X190.714 Y124.524 E2.2147
N14209 G1 X190.714 Y123.886 E.03177
N14210 G1 X159.286 Y155.314 E2.2147
N14211 G1 X159.286 Y154.677 E.03177
N14212 G1 X190.394 Y123.569 E2.19214
N14213 G1 X189.756 Y123.569 E.03177
N14214 G1 X159.286 Y154.039 E2.14721
N14215 G1 X159.286 Y153.402 E.03177
N14216 G1 X189.119 Y123.569 E2.10229
N14217 G1 X188.481 Y123.569 E.03177
N14218 G1 X159.286 Y152.764 E2.05736
N14219 G1 X159.286 Y152.127 E.03177
N14220 G1 X187.844 Y123.569 E2.01244
N14221 G1 X187.206 Y123.569 E.03177
N14222 G1 X159.286 Y151.489 E1.96751
N14223 G1 X159.286 Y150.852 E.03177
N14224 G1 X186.569 Y123.569 E1.92259
N14225 G1 X185.931 Y123.569 E.03177
N14226 G1 X159.286 Y150.214 E1.87766
N14227 G1 X159.286 Y149.577 E.03177
N14228 G1 X185.294 Y123.569 E1.83274
N14229 G1 X184.656 Y123.569 E.03177
N14230 G1 X159.286 Y148.939 E1.78782
N14231 G1 X159.286 Y148.301 E.03177
N14232 G1 X184.019 Y123.569 E1.74289
N14233 G1 X183.381 Y123.569 E.03177
N14234 G1 X159.286 Y147.664 E1.69797
N14235 G1 X159.286 Y147.026 E.03177
N14236 G1 X182.744 Y123.569 E1.65304
N14237 G1 X182.106 Y123.569 E.03177
N14238 G1 X159.286 Y146.389 E1.60812
N14239 G1 X159.286 Y145.751 E.03177
N14240 G1 X181.469 Y123.569 E1.56319
N14241 G1 X180.831 Y123.569 E.03177
N14242 G1 X159.286 Y145.114 E1.51827
N14243 G1 X159.286 Y144.476 E.03177
N14244 G1 X180.194 Y123.569 E1.47334
N14245 G1 X179.556 Y123.569 E.03177
N14246 G1 X159.286 Y143.839 E1.42842
N14247 G1 X159.286 Y143.201 E.03177
N14248 G1 X178.919 Y123.569 E1.38349
N14249 G1 X178.281 Y123.569 E.03177
N14250 G1 X159.286 Y142.564 E1.33857
N14251 G1 X159.286 Y141.926 E.03177
N14252 G1 X177.644 Y123.569 E1.29364
N14253 G1 X177.006 Y123.569 E.03177
N14254 G1 X159.286 Y141.289 E1.24872
N14255 G1 X159.286 Y140.651 E.03177
N14256 G1 X176.369 Y123.569 E1.20379
N14257 G1 X175.731 Y123.569 E.03177
N14258 G1 X159.286 Y140.014 E1.15887
N14259 G1 X159.286 Y139.376 E.03177
N14260 M73 P89 R4
N14261 G1 X175.094 Y123.569 E1.11394
N14262 G1 X174.456 Y123.569 E.03177
N14263 G1 X159.286 Y138.739 E1.06902
N14264 G1 X159.286 Y138.101 E.03177
N14265 G1 X173.819 Y123.569 E1.02409
N14266 G1 X173.181 Y123.569 E.03177
N14267 G1 X159.286 Y137.464 E.97917
N14268 G1 X159.286 Y136.826 E.03177
N14269 G1 X172.544 Y123.569 E.93425
N14270 G1 X171.906 Y123.569 E.03177
N14271 G1 X159.286 Y136.189 E.88932
N14272 G1 X159.286 Y135.551 E.03177
N14273 G1 X171.269 Y123.569 E.8444
N14274 G1 X170.631 Y123.569 E.03177
N14275 G1 X159.286 Y134.914 E.79947
N14276 G1 X159.286 Y134.276 E.03177
N14277 G1 X169.993 Y123.569 E.75455
N14278 G1 X169.356 Y123.569 E.03177
N14279 G1 X159.286 Y133.639 E.70962
N14280 G1 X159.286 Y133.001 E.03177
N14281 G1 X168.718 Y123.569 E.6647
N14282 G1 X168.081 Y123.569 E.03177
N14283 G1 X159.286 Y132.364 E.61977
N14284 G1 X159.286 Y131.726 E.03177
N14285 G1 X167.443 Y123.569 E.57485
N14286 G1 X166.806 Y123.569 E.03177
N14287 G1 X159.286 Y131.089 E.52992
N14288 G1 X159.286 Y130.451 E.03177
N14289 G1 X166.168 Y123.569 E.485
N14290 G1 X165.531 Y123.569 E.03177
N14291 G1 X159.286 Y129.814 E.44007
N14292 G1 X159.286 Y129.176 E.03177
N14293 G1 X164.893 Y123.569 E.39515
N14294 G1 X164.256 Y123.569 E.03177
N14295 G1 X159.286 Y128.539 E.35022
N14296 G1 X159.286 Y127.901 E.03177
N14297 G1 X163.618 Y123.569 E.3053
N14298 G1 X162.981 Y123.569 E.03177
N14299 G1 X159.286 Y127.264 E.26037
N14300 G1 X159.286 Y126.626 E.03177
N14301 G1 X162.343 Y123.569 E.21545
N14302 G1 X161.706 Y123.569 E.03177
N14303 G1 X159.286 Y125.989 E.17052
N14304 G1 X159.286 Y125.351 E.03177
N14305 G1 X161.068 Y123.569 E.1256
N14306 G1 X160.431 Y123.569 E.03177
N14307 G1 X159.286 Y124.713 E.08068
N14308 G1 X159.286 Y124.076 E.03177
N14309 G1 X159.996 Y123.366 E.05002
N14310 M106 S12.75
N14311 ; WIPE_START
N14312 G1 X159.286 Y124.076 E-.38146
N14313 G1 X159.286 Y124.713 E-.24226
N14314 G1 X159.54 Y124.46 E-.13628
N14315 ; WIPE_END
N14316 G1 E-.04 F1800
N14317 M204 S10000
N14318 G17
N14319 G3 Z12.2 I1.217 J0 P1  F60000
N14320 ; stop printing object, unique label id: 130
N14321 M625
N14322 ; object ids of layer 59 start: 130
N14323 M624 AQAAAAAAAAA=
N14324 ;======== H2D 20250527========
N14325 ; SKIPPABLE_START
N14326 ; SKIPTYPE: timelapse
N14327 M622.1 S1 ; for prev firware, default turned on
N14328 
N14329 M1002 judge_flag timelapse_record_flag
N14330 
N14331 M622 J1
N14332 M993 A2 B2 C2
N14333 M993 A0 B0 C0
N14334 
N14335 
N14336 
N14337 
N14338     M9711 M0 E1 X260 Y137 Z12.2 S11 C10 O0 T3000
N14339 
N14340 
N14341 
N14342 M993 A3 B3 C3
N14343 
N14344 M623
N14345 ; SKIPPABLE_END
N14346 
N14347 ; object ids of this layer59 end: 130
N14348 M625
N14349 ; CHANGE_LAYER
N14350 ; Z_HEIGHT: 12
N14351 ; LAYER_HEIGHT: 0.2
N14352 ;======== H2D 20250521========
N14353 ; layer num/total_layer_count: 60/63
N14354 ; update layer progress
N14355 M73 L60
N14356 M991 S0 P59 ;notify layer change
N14357 
N14358 
N14359 ; OBJECT_ID: 130
N14360 ; COOLING_NODE: 0
N14361 ; start printing object, unique label id: 130
N14362 M624 AQAAAAAAAAA=
N14363 G1 X191.084 Y196.801 F60000
N14364 G1 Z12
N14365 G1 E.8 F1800
N14366 ; FEATURE: Inner wall
N14367 ; LINE_WIDTH: 0.45
N14368 ; LAYER_HEIGHT: 0.2
N14369 G1 F8475
N14370 M204 S8000
N14371 G1 X158.916 Y196.801 E1.03439
N14372 G1 X158.916 Y123.199 E2.36678
N14373 G1 X191.084 Y123.199 E1.03439
N14374 G1 X191.084 Y196.741 E2.36485
N14375 ; COOLING_NODE: 0
N14376 M204 S10000
N14377 G1 X191.491 Y197.208 F60000
N14378 M73 P89 R3
N14379 G1 F8475
N14380 M204 S8000
N14381 G1 X158.509 Y197.208 E1.06057
N14382 G1 X158.509 Y122.792 E2.39296
N14383 G1 X191.491 Y122.792 E1.06057
N14384 G1 X191.491 Y197.148 E2.39103
N14385 ; COOLING_NODE: 0
N14386 M204 S10000
N14387 G1 X191.898 Y197.615 F60000
N14388 G1 F8475
N14389 M204 S8000
N14390 G1 X158.102 Y197.615 E1.08675
N14391 G1 X158.102 Y122.385 E2.41914
N14392 G1 X191.898 Y122.385 E1.08675
N14393 G1 X191.898 Y197.555 E2.41721
N14394 ; COOLING_NODE: 0
N14395 M204 S10000
N14396 G1 X192.29 Y198.007 F60000
N14397 ; FEATURE: Outer wall
N14398 ; LINE_WIDTH: 0.42
N14399 G1 F9149.261
N14400 M204 S5000
N14401 G1 X157.71 Y198.007 E1.03002
N14402 G1 X157.71 Y121.993 E2.26421
N14403 G1 X192.29 Y121.993 E1.03002
N14404 G1 X192.29 Y197.947 E2.26243
N14405 G1 E-.8 F1800
N14406 M204 S10000
N14407 G1 X190.157 Y196.637 Z12.4 F60000
N14408 G1 Z12
N14409 G1 E.8 F1800
N14410 ; FEATURE: Internal solid infill
N14411 ; LINE_WIDTH: 0.42048
N14412 G1 F9137.621
N14413 M204 S8000
N14414 G1 X190.751 Y196.044 E.02504
N14415 G1 X190.751 Y195.51 E.01592
N14416 G1 X189.793 Y196.468 E.0404
N14417 G1 X189.259 Y196.468 E.01592
N14418 G1 X190.751 Y194.976 E.06292
N14419 G1 X190.751 Y194.442 E.01592
N14420 G1 X188.725 Y196.468 E.08544
N14421 G1 X188.191 Y196.468 E.01592
N14422 G1 X190.751 Y193.908 E.10797
N14423 G1 X190.751 Y193.374 E.01592
N14424 G1 X187.657 Y196.468 E.13049
N14425 G1 X187.123 Y196.468 E.01592
N14426 G1 X190.751 Y192.84 E.15301
N14427 G1 X190.751 Y192.306 E.01592
N14428 G1 X186.589 Y196.468 E.17553
N14429 G1 X186.055 Y196.468 E.01592
N14430 G1 X190.751 Y191.772 E.19805
N14431 G1 X190.751 Y191.238 E.01592
N14432 G1 X185.521 Y196.468 E.22057
N14433 G1 X184.987 Y196.468 E.01592
N14434 G1 X190.751 Y190.704 E.24309
N14435 G1 X190.751 Y190.17 E.01592
N14436 G1 X184.453 Y196.468 E.26561
N14437 G1 X183.919 Y196.468 E.01592
N14438 G1 X190.751 Y189.636 E.28813
N14439 G1 X190.751 Y189.103 E.01592
N14440 G1 X183.385 Y196.468 E.31066
N14441 G1 X182.851 Y196.468 E.01592
N14442 G1 X190.751 Y188.569 E.33318
N14443 G1 X190.751 Y188.035 E.01592
N14444 G1 X182.317 Y196.468 E.3557
N14445 G1 X181.783 Y196.468 E.01592
N14446 G1 X190.751 Y187.501 E.37822
N14447 G1 X190.751 Y186.967 E.01593
N14448 G1 X181.249 Y196.468 E.40074
N14449 G1 X180.715 Y196.468 E.01592
N14450 G1 X190.751 Y186.433 E.42326
N14451 G1 X190.751 Y185.899 E.01592
N14452 G1 X180.182 Y196.468 E.44578
N14453 G1 X179.648 Y196.468 E.01592
N14454 G1 X190.751 Y185.365 E.4683
N14455 G1 X190.751 Y184.831 E.01592
N14456 G1 X179.114 Y196.468 E.49082
N14457 G1 X178.58 Y196.468 E.01592
N14458 G1 X190.751 Y184.297 E.51335
N14459 G1 X190.751 Y183.763 E.01592
N14460 G1 X178.046 Y196.468 E.53587
N14461 G1 X177.512 Y196.468 E.01592
N14462 G1 X190.751 Y183.229 E.55839
N14463 G1 X190.751 Y182.695 E.01592
N14464 G1 X176.978 Y196.468 E.58091
N14465 G1 X176.444 Y196.468 E.01593
N14466 G1 X190.751 Y182.161 E.60343
N14467 G1 X190.751 Y181.627 E.01592
N14468 G1 X175.91 Y196.468 E.62595
N14469 G1 X175.376 Y196.468 E.01592
N14470 G1 X190.751 Y181.093 E.64847
N14471 G1 X190.751 Y180.559 E.01592
N14472 G1 X174.842 Y196.468 E.67099
N14473 G1 X174.308 Y196.468 E.01592
N14474 G1 X190.751 Y180.025 E.69351
N14475 G1 X190.751 Y179.491 E.01592
N14476 G1 X173.774 Y196.468 E.71604
N14477 G1 X173.24 Y196.468 E.01593
N14478 G1 X190.751 Y178.957 E.73856
N14479 G1 X190.751 Y178.423 E.01592
N14480 G1 X172.706 Y196.468 E.76108
N14481 G1 X172.172 Y196.468 E.01592
N14482 G1 X190.751 Y177.89 E.7836
N14483 G1 X190.751 Y177.356 E.01592
N14484 G1 X171.638 Y196.468 E.80612
N14485 G1 X171.104 Y196.468 E.01592
N14486 G1 X190.751 Y176.822 E.82864
N14487 G1 X190.751 Y176.288 E.01592
N14488 G1 X170.57 Y196.468 E.85116
N14489 G1 X170.036 Y196.468 E.01592
N14490 G1 X190.751 Y175.754 E.87368
N14491 G1 X190.751 Y175.22 E.01592
N14492 G1 X169.503 Y196.468 E.8962
N14493 G1 X168.969 Y196.468 E.01592
N14494 G1 X190.751 Y174.686 E.91873
N14495 G1 X190.751 Y174.152 E.01592
N14496 G1 X168.435 Y196.468 E.94125
N14497 G1 X167.901 Y196.468 E.01592
N14498 G1 X190.751 Y173.618 E.96377
N14499 G1 X190.751 Y173.084 E.01592
N14500 G1 X167.367 Y196.468 E.98629
N14501 G1 X166.833 Y196.468 E.01592
N14502 G1 X190.751 Y172.55 E1.00881
N14503 G1 X190.751 Y172.016 E.01592
N14504 G1 X166.299 Y196.468 E1.03133
N14505 G1 X165.765 Y196.468 E.01592
N14506 G1 X190.751 Y171.482 E1.05385
N14507 G1 X190.751 Y170.948 E.01592
N14508 G1 X165.231 Y196.468 E1.07637
N14509 G1 X164.697 Y196.468 E.01592
N14510 G1 X190.751 Y170.414 E1.09889
N14511 G1 X190.751 Y169.88 E.01592
N14512 G1 X164.163 Y196.468 E1.12141
N14513 G1 X163.629 Y196.468 E.01592
N14514 G1 X190.751 Y169.346 E1.14394
N14515 G1 X190.751 Y168.812 E.01592
N14516 G1 X163.095 Y196.468 E1.16646
N14517 G1 X162.561 Y196.468 E.01592
N14518 G1 X190.751 Y168.278 E1.18898
N14519 G1 X190.751 Y167.744 E.01592
N14520 G1 X162.027 Y196.468 E1.2115
N14521 G1 X161.493 Y196.468 E.01592
N14522 M73 P90 R3
N14523 G1 X190.751 Y167.211 E1.23402
N14524 G1 X190.751 Y166.677 E.01592
N14525 G1 X160.959 Y196.468 E1.25654
N14526 G1 X160.425 Y196.468 E.01592
N14527 G1 X190.751 Y166.143 E1.27906
N14528 G1 X190.751 Y165.609 E.01592
N14529 G1 X159.891 Y196.468 E1.30158
N14530 G1 X159.357 Y196.468 E.01592
N14531 G1 X190.751 Y165.075 E1.3241
N14532 G1 X190.751 Y164.541 E.01593
N14533 G1 X159.249 Y196.042 E1.32866
N14534 G1 X159.249 Y195.508 E.01592
N14535 G1 X190.751 Y164.007 E1.32866
N14536 G1 X190.751 Y163.473 E.01592
N14537 G1 X159.249 Y194.974 E1.32866
N14538 G1 X159.249 Y194.44 E.01593
N14539 G1 X190.751 Y162.939 E1.32866
N14540 G1 X190.751 Y162.405 E.01592
N14541 G1 X159.249 Y193.906 E1.32866
N14542 G1 X159.249 Y193.372 E.01592
N14543 G1 X190.751 Y161.871 E1.32866
N14544 G1 X190.751 Y161.337 E.01592
N14545 G1 X159.249 Y192.838 E1.32866
N14546 G1 X159.249 Y192.304 E.01592
N14547 G1 X190.751 Y160.803 E1.32866
N14548 G1 X190.751 Y160.269 E.01592
N14549 G1 X159.249 Y191.77 E1.32866
N14550 G1 X159.249 Y191.236 E.01592
N14551 G1 X190.751 Y159.735 E1.32866
N14552 G1 X190.751 Y159.201 E.01592
N14553 G1 X159.249 Y190.702 E1.32866
N14554 G1 X159.249 Y190.168 E.01592
N14555 G1 X190.751 Y158.667 E1.32866
N14556 G1 X190.751 Y158.133 E.01592
N14557 G1 X159.249 Y189.634 E1.32866
N14558 G1 X159.249 Y189.1 E.01592
N14559 G1 X190.751 Y157.599 E1.32866
N14560 G1 X190.751 Y157.065 E.01592
N14561 G1 X159.249 Y188.567 E1.32866
N14562 G1 X159.249 Y188.033 E.01592
N14563 G1 X190.751 Y156.532 E1.32866
N14564 G1 X190.751 Y155.998 E.01592
N14565 G1 X159.249 Y187.499 E1.32866
N14566 G1 X159.249 Y186.965 E.01592
N14567 G1 X190.751 Y155.464 E1.32866
N14568 G1 X190.751 Y154.93 E.01592
N14569 G1 X159.249 Y186.431 E1.32866
N14570 G1 X159.249 Y185.897 E.01592
N14571 G1 X190.751 Y154.396 E1.32866
N14572 G1 X190.751 Y153.862 E.01592
N14573 G1 X159.249 Y185.363 E1.32866
N14574 G1 X159.249 Y184.829 E.01592
N14575 G1 X190.751 Y153.328 E1.32866
N14576 G1 X190.751 Y152.794 E.01592
N14577 G1 X159.249 Y184.295 E1.32866
N14578 G1 X159.249 Y183.761 E.01592
N14579 G1 X190.751 Y152.26 E1.32866
N14580 G1 X190.751 Y151.726 E.01592
N14581 G1 X159.249 Y183.227 E1.32866
N14582 G1 X159.249 Y182.693 E.01593
N14583 G1 X190.751 Y151.192 E1.32866
N14584 G1 X190.751 Y150.658 E.01592
N14585 G1 X159.249 Y182.159 E1.32866
N14586 G1 X159.249 Y181.625 E.01592
N14587 G1 X190.751 Y150.124 E1.32866
N14588 G1 X190.751 Y149.59 E.01592
N14589 G1 X159.249 Y181.091 E1.32866
N14590 G1 X159.249 Y180.557 E.01592
N14591 G1 X190.751 Y149.056 E1.32866
N14592 G1 X190.751 Y148.522 E.01592
N14593 G1 X159.249 Y180.023 E1.32866
N14594 G1 X159.249 Y179.489 E.01592
N14595 G1 X190.751 Y147.988 E1.32866
N14596 G1 X190.751 Y147.454 E.01592
N14597 G1 X159.249 Y178.955 E1.32866
N14598 G1 X159.249 Y178.421 E.01592
N14599 G1 X190.751 Y146.92 E1.32866
N14600 G1 X190.751 Y146.386 E.01592
N14601 G1 X159.249 Y177.888 E1.32866
N14602 G1 X159.249 Y177.354 E.01592
N14603 G1 X190.751 Y145.853 E1.32866
N14604 G1 X190.751 Y145.319 E.01593
N14605 G1 X159.249 Y176.82 E1.32866
N14606 G1 X159.249 Y176.286 E.01592
N14607 G1 X190.751 Y144.785 E1.32866
N14608 G1 X190.751 Y144.251 E.01592
N14609 G1 X159.249 Y175.752 E1.32866
N14610 G1 X159.249 Y175.218 E.01592
N14611 G1 X190.751 Y143.717 E1.32866
N14612 G1 X190.751 Y143.183 E.01592
N14613 G1 X159.249 Y174.684 E1.32866
N14614 G1 X159.249 Y174.15 E.01592
N14615 G1 X190.751 Y142.649 E1.32866
N14616 G1 X190.751 Y142.115 E.01592
N14617 G1 X159.249 Y173.616 E1.32866
N14618 G1 X159.249 Y173.082 E.01592
N14619 G1 X190.751 Y141.581 E1.32866
N14620 G1 X190.751 Y141.047 E.01592
N14621 G1 X159.249 Y172.548 E1.32866
N14622 G1 X159.249 Y172.014 E.01592
N14623 G1 X190.751 Y140.513 E1.32866
N14624 G1 X190.751 Y139.979 E.01592
N14625 G1 X159.249 Y171.48 E1.32866
N14626 G1 X159.249 Y170.946 E.01592
N14627 G1 X190.751 Y139.445 E1.32866
N14628 G1 X190.751 Y138.911 E.01592
N14629 G1 X159.249 Y170.412 E1.32866
N14630 G1 X159.249 Y169.878 E.01592
N14631 G1 X190.751 Y138.377 E1.32866
N14632 G1 X190.751 Y137.843 E.01592
N14633 G1 X159.249 Y169.344 E1.32866
N14634 G1 X159.249 Y168.81 E.01592
N14635 G1 X190.751 Y137.309 E1.32866
N14636 G1 X190.751 Y136.775 E.01592
N14637 G1 X159.249 Y168.276 E1.32866
N14638 G1 X159.249 Y167.742 E.01592
N14639 G1 X190.751 Y136.241 E1.32866
N14640 G1 X190.751 Y135.707 E.01592
N14641 G1 X159.249 Y167.209 E1.32866
N14642 G1 X159.249 Y166.675 E.01592
N14643 G1 X190.751 Y135.174 E1.32866
N14644 G1 X190.751 Y134.64 E.01592
N14645 G1 X159.249 Y166.141 E1.32866
N14646 G1 X159.249 Y165.607 E.01592
N14647 G1 X190.751 Y134.106 E1.32866
N14648 G1 X190.751 Y133.572 E.01593
N14649 G1 X159.249 Y165.073 E1.32866
N14650 G1 X159.249 Y164.539 E.01592
N14651 G1 X190.751 Y133.038 E1.32866
N14652 G1 X190.751 Y132.504 E.01592
N14653 G1 X159.249 Y164.005 E1.32866
N14654 G1 X159.249 Y163.471 E.01592
N14655 G1 X190.751 Y131.97 E1.32866
N14656 G1 X190.751 Y131.436 E.01592
N14657 G1 X159.249 Y162.937 E1.32866
N14658 G1 X159.249 Y162.403 E.01592
N14659 G1 X190.751 Y130.902 E1.32866
N14660 G1 X190.751 Y130.368 E.01592
N14661 G1 X159.249 Y161.869 E1.32866
N14662 G1 X159.249 Y161.335 E.01592
N14663 M73 P91 R3
N14664 G1 X190.751 Y129.834 E1.32866
N14665 G1 X190.751 Y129.3 E.01592
N14666 G1 X159.249 Y160.801 E1.32866
N14667 G1 X159.249 Y160.267 E.01593
N14668 G1 X190.751 Y128.766 E1.32866
N14669 G1 X190.751 Y128.232 E.01592
N14670 G1 X159.249 Y159.733 E1.32866
N14671 G1 X159.249 Y159.199 E.01592
N14672 G1 X190.751 Y127.698 E1.32866
N14673 G1 X190.751 Y127.164 E.01592
N14674 G1 X159.249 Y158.665 E1.32866
N14675 G1 X159.249 Y158.131 E.01592
N14676 G1 X190.751 Y126.63 E1.32866
N14677 G1 X190.751 Y126.096 E.01592
N14678 G1 X159.249 Y157.597 E1.32866
N14679 G1 X159.249 Y157.063 E.01592
N14680 G1 X190.751 Y125.562 E1.32866
N14681 G1 X190.751 Y125.028 E.01592
N14682 G1 X159.249 Y156.53 E1.32866
N14683 G1 X159.249 Y155.996 E.01592
N14684 G1 X190.751 Y124.495 E1.32866
N14685 G1 X190.751 Y123.961 E.01592
N14686 G1 X159.249 Y155.462 E1.32866
N14687 G1 X159.249 Y154.928 E.01592
N14688 G1 X190.645 Y123.532 E1.32421
N14689 G1 X190.111 Y123.532 E.01592
N14690 G1 X159.249 Y154.394 E1.30169
N14691 G1 X159.249 Y153.86 E.01592
N14692 G1 X189.577 Y123.532 E1.27917
N14693 G1 X189.043 Y123.532 E.01592
N14694 G1 X159.249 Y153.326 E1.25664
N14695 G1 X159.249 Y152.792 E.01592
N14696 G1 X188.509 Y123.532 E1.23412
N14697 G1 X187.975 Y123.532 E.01592
N14698 G1 X159.249 Y152.258 E1.2116
N14699 G1 X159.249 Y151.724 E.01592
N14700 G1 X187.441 Y123.532 E1.18908
N14701 G1 X186.907 Y123.532 E.01592
N14702 G1 X159.249 Y151.19 E1.16656
N14703 G1 X159.249 Y150.656 E.01592
N14704 G1 X186.373 Y123.532 E1.14404
N14705 G1 X185.839 Y123.532 E.01592
N14706 G1 X159.249 Y150.122 E1.12152
N14707 G1 X159.249 Y149.588 E.01592
N14708 G1 X185.305 Y123.532 E1.099
N14709 G1 X184.772 Y123.532 E.01593
N14710 G1 X159.249 Y149.054 E1.07648
N14711 G1 X159.249 Y148.52 E.01592
N14712 G1 X184.238 Y123.532 E1.05395
N14713 G1 X183.704 Y123.532 E.01592
N14714 G1 X159.249 Y147.986 E1.03143
N14715 G1 X159.249 Y147.452 E.01592
N14716 G1 X183.17 Y123.532 E1.00891
N14717 G1 X182.636 Y123.532 E.01592
N14718 G1 X159.249 Y146.918 E.98639
N14719 G1 X159.249 Y146.384 E.01592
N14720 G1 X182.102 Y123.532 E.96387
N14721 G1 X181.568 Y123.532 E.01592
N14722 G1 X159.249 Y145.851 E.94135
N14723 G1 X159.249 Y145.317 E.01592
N14724 G1 X181.034 Y123.532 E.91883
N14725 G1 X180.5 Y123.532 E.01592
N14726 G1 X159.249 Y144.783 E.89631
N14727 G1 X159.249 Y144.249 E.01592
N14728 G1 X179.966 Y123.532 E.87379
N14729 G1 X179.432 Y123.532 E.01592
N14730 G1 X159.249 Y143.715 E.85126
N14731 G1 X159.249 Y143.181 E.01592
N14732 G1 X178.898 Y123.532 E.82874
N14733 G1 X178.364 Y123.532 E.01592
N14734 G1 X159.249 Y142.647 E.80622
N14735 G1 X159.249 Y142.113 E.01592
N14736 G1 X177.83 Y123.532 E.7837
N14737 G1 X177.296 Y123.532 E.01592
N14738 G1 X159.249 Y141.579 E.76118
N14739 G1 X159.249 Y141.045 E.01593
N14740 G1 X176.762 Y123.532 E.73866
N14741 G1 X176.228 Y123.532 E.01592
N14742 G1 X159.249 Y140.511 E.71614
N14743 G1 X159.249 Y139.977 E.01592
N14744 G1 X175.694 Y123.532 E.69362
N14745 G1 X175.16 Y123.532 E.01592
N14746 G1 X159.249 Y139.443 E.6711
N14747 G1 X159.249 Y138.909 E.01592
N14748 G1 X174.626 Y123.532 E.64857
N14749 G1 X174.093 Y123.532 E.01592
N14750 G1 X159.249 Y138.375 E.62605
N14751 G1 X159.249 Y137.841 E.01592
N14752 G1 X173.559 Y123.532 E.60353
N14753 G1 X173.025 Y123.532 E.01592
N14754 G1 X159.249 Y137.307 E.58101
N14755 G1 X159.249 Y136.773 E.01592
N14756 G1 X172.491 Y123.532 E.55849
N14757 G1 X171.957 Y123.532 E.01592
N14758 G1 X159.249 Y136.239 E.53597
N14759 G1 X159.249 Y135.705 E.01592
N14760 G1 X171.423 Y123.532 E.51345
N14761 G1 X170.889 Y123.532 E.01592
N14762 G1 X159.249 Y135.172 E.49093
N14763 G1 X159.249 Y134.638 E.01592
N14764 G1 X170.355 Y123.532 E.46841
N14765 G1 X169.821 Y123.532 E.01592
N14766 G1 X159.249 Y134.104 E.44588
N14767 G1 X159.249 Y133.57 E.01592
N14768 G1 X169.287 Y123.532 E.42336
N14769 G1 X168.753 Y123.532 E.01592
N14770 G1 X159.249 Y133.036 E.40084
N14771 G1 X159.249 Y132.502 E.01592
N14772 G1 X168.219 Y123.532 E.37832
N14773 G1 X167.685 Y123.532 E.01592
N14774 G1 X159.249 Y131.968 E.3558
N14775 G1 X159.249 Y131.434 E.01592
N14776 G1 X167.151 Y123.532 E.33328
N14777 G1 X166.617 Y123.532 E.01592
N14778 G1 X159.249 Y130.9 E.31076
N14779 G1 X159.249 Y130.366 E.01592
N14780 G1 X166.083 Y123.532 E.28824
N14781 G1 X165.549 Y123.532 E.01592
N14782 G1 X159.249 Y129.832 E.26572
N14783 G1 X159.249 Y129.298 E.01592
N14784 G1 X165.015 Y123.532 E.24319
N14785 G1 X164.481 Y123.532 E.01592
N14786 G1 X159.249 Y128.764 E.22067
N14787 G1 X159.249 Y128.23 E.01592
N14788 G1 X163.947 Y123.532 E.19815
N14789 G1 X163.413 Y123.532 E.01592
N14790 G1 X159.249 Y127.696 E.17563
N14791 G1 X159.249 Y127.162 E.01592
N14792 G1 X162.88 Y123.532 E.15311
N14793 G1 X162.346 Y123.532 E.01592
N14794 G1 X159.249 Y126.628 E.13059
N14795 G1 X159.249 Y126.094 E.01592
N14796 G1 X161.812 Y123.532 E.10807
N14797 G1 X161.278 Y123.532 E.01592
N14798 G1 X159.249 Y125.56 E.08555
N14799 G1 X159.249 Y125.026 E.01592
N14800 G1 X160.744 Y123.532 E.06303
N14801 G1 X160.21 Y123.532 E.01592
N14802 G1 X159.249 Y124.492 E.0405
N14803 G1 X159.249 Y123.959 E.01592
N14804 G1 X159.846 Y123.362 E.02514
N14805 ; WIPE_START
N14806 G1 X159.249 Y123.959 E-.32032
N14807 G1 X159.249 Y124.492 E-.2029
N14808 G1 X159.69 Y124.052 E-.23678
N14809 ; WIPE_END
N14810 G1 E-.04 F1800
N14811 M204 S10000
N14812 G17
N14813 G3 Z12.4 I1.217 J0 P1  F60000
N14814 ; stop printing object, unique label id: 130
N14815 M625
N14816 ; object ids of layer 60 start: 130
N14817 M624 AQAAAAAAAAA=
N14818 ;======== H2D 20250527========
N14819 ; SKIPPABLE_START
N14820 ; SKIPTYPE: timelapse
N14821 M622.1 S1 ; for prev firware, default turned on
N14822 
N14823 M1002 judge_flag timelapse_record_flag
N14824 
N14825 M622 J1
N14826 M993 A2 B2 C2
N14827 M993 A0 B0 C0
N14828 
N14829 
N14830 
N14831 
N14832     M9711 M0 E1 X260 Y137 Z12.4 S11 C10 O0 T3000
N14833 
N14834 
N14835 
N14836 M993 A3 B3 C3
N14837 
N14838 M623
N14839 ; SKIPPABLE_END
N14840 
N14841 ; object ids of this layer60 end: 130
N14842 M625
N14843 ; CHANGE_LAYER
N14844 ; Z_HEIGHT: 12.2
N14845 ; LAYER_HEIGHT: 0.2
N14846 ;======== H2D 20250521========
N14847 ; layer num/total_layer_count: 61/63
N14848 ; update layer progress
N14849 M73 L61
N14850 M991 S0 P60 ;notify layer change
N14851 
N14852 
N14853 ; OBJECT_ID: 130
N14854 ; COOLING_NODE: 0
N14855 ; start printing object, unique label id: 130
N14856 M624 AQAAAAAAAAA=
N14857 G1 X191.084 Y196.801 F60000
N14858 G1 Z12.2
N14859 G1 E.8 F1800
N14860 ; FEATURE: Inner wall
N14861 ; LINE_WIDTH: 0.45
N14862 ; LAYER_HEIGHT: 0.2
N14863 G1 F8475
N14864 M204 S8000
N14865 G1 X158.916 Y196.801 E1.03439
N14866 G1 X158.916 Y123.199 E2.36678
N14867 G1 X191.084 Y123.199 E1.03439
N14868 G1 X191.084 Y196.741 E2.36485
N14869 ; COOLING_NODE: 0
N14870 M204 S10000
N14871 G1 X191.491 Y197.208 F60000
N14872 G1 F8475
N14873 M204 S8000
N14874 G1 X158.509 Y197.208 E1.06057
N14875 G1 X158.509 Y122.792 E2.39296
N14876 G1 X191.491 Y122.792 E1.06057
N14877 G1 X191.491 Y197.148 E2.39103
N14878 ; COOLING_NODE: 0
N14879 M204 S10000
N14880 G1 X191.898 Y197.615 F60000
N14881 G1 F8475
N14882 M204 S8000
N14883 G1 X158.102 Y197.615 E1.08675
N14884 G1 X158.102 Y122.385 E2.41914
N14885 G1 X191.898 Y122.385 E1.08675
N14886 G1 X191.898 Y197.555 E2.41721
N14887 ; COOLING_NODE: 0
N14888 M204 S10000
N14889 G1 X192.29 Y198.007 F60000
N14890 ; FEATURE: Outer wall
N14891 ; LINE_WIDTH: 0.42
N14892 G1 F9149.261
N14893 M204 S5000
N14894 G1 X157.71 Y198.007 E1.03002
N14895 G1 X157.71 Y121.993 E2.26421
N14896 G1 X192.29 Y121.993 E1.03002
N14897 G1 X192.29 Y197.947 E2.26243
N14898 G1 E-.8 F1800
N14899 M204 S10000
N14900 G1 X184.672 Y197.471 Z12.6 F60000
N14901 G1 X159.08 Y195.872 Z12.6
N14902 G1 Z12.2
N14903 G1 E.8 F1800
N14904 ; FEATURE: Internal solid infill
N14905 ; LINE_WIDTH: 0.42048
N14906 G1 F9137.621
N14907 M204 S8000
N14908 G1 X159.676 Y196.468 E.02514
N14909 G1 X160.21 Y196.468 E.01592
N14910 G1 X159.249 Y195.507 E.0405
N14911 G1 X159.249 Y194.974 E.01592
N14912 G1 X160.744 Y196.468 E.06303
N14913 G1 X161.278 Y196.468 E.01592
N14914 G1 X159.249 Y194.44 E.08555
N14915 G1 X159.249 Y193.906 E.01592
N14916 G1 X161.812 Y196.468 E.10807
N14917 G1 X162.346 Y196.468 E.01592
N14918 G1 X159.249 Y193.372 E.13059
N14919 G1 X159.249 Y192.838 E.01593
N14920 G1 X162.88 Y196.468 E.15311
N14921 G1 X163.413 Y196.468 E.01592
N14922 G1 X159.249 Y192.304 E.17563
N14923 G1 X159.249 Y191.77 E.01592
N14924 G1 X163.947 Y196.468 E.19815
N14925 G1 X164.481 Y196.468 E.01592
N14926 G1 X159.249 Y191.236 E.22067
N14927 G1 X159.249 Y190.702 E.01592
N14928 M73 P92 R3
N14929 G1 X165.015 Y196.468 E.24319
N14930 G1 X165.549 Y196.468 E.01592
N14931 G1 X159.249 Y190.168 E.26572
N14932 G1 X159.249 Y189.634 E.01592
N14933 G1 X166.083 Y196.468 E.28824
N14934 G1 X166.617 Y196.468 E.01593
N14935 G1 X159.249 Y189.1 E.31076
N14936 G1 X159.249 Y188.566 E.01592
N14937 G1 X167.151 Y196.468 E.33328
N14938 G1 X167.685 Y196.468 E.01592
N14939 M73 P92 R2
N14940 G1 X159.249 Y188.032 E.3558
N14941 G1 X159.249 Y187.498 E.01592
N14942 G1 X168.219 Y196.468 E.37832
N14943 G1 X168.753 Y196.468 E.01592
N14944 G1 X159.249 Y186.964 E.40084
N14945 G1 X159.249 Y186.43 E.01592
N14946 G1 X169.287 Y196.468 E.42336
N14947 G1 X169.821 Y196.468 E.01592
N14948 G1 X159.249 Y185.896 E.44588
N14949 G1 X159.249 Y185.362 E.01592
N14950 G1 X170.355 Y196.468 E.46841
N14951 G1 X170.889 Y196.468 E.01592
N14952 G1 X159.249 Y184.828 E.49093
N14953 G1 X159.249 Y184.295 E.01592
N14954 G1 X171.423 Y196.468 E.51345
N14955 G1 X171.957 Y196.468 E.01592
N14956 G1 X159.249 Y183.761 E.53597
N14957 G1 X159.249 Y183.227 E.01592
N14958 G1 X172.491 Y196.468 E.55849
N14959 G1 X173.025 Y196.468 E.01592
N14960 G1 X159.249 Y182.693 E.58101
N14961 G1 X159.249 Y182.159 E.01592
N14962 G1 X173.559 Y196.468 E.60353
N14963 G1 X174.092 Y196.468 E.01592
N14964 G1 X159.249 Y181.625 E.62605
N14965 G1 X159.249 Y181.091 E.01592
N14966 G1 X174.626 Y196.468 E.64857
N14967 G1 X175.16 Y196.468 E.01592
N14968 G1 X159.249 Y180.557 E.6711
N14969 G1 X159.249 Y180.023 E.01592
N14970 G1 X175.694 Y196.468 E.69362
N14971 G1 X176.228 Y196.468 E.01592
N14972 G1 X159.249 Y179.489 E.71614
N14973 G1 X159.249 Y178.955 E.01592
N14974 G1 X176.762 Y196.468 E.73866
N14975 G1 X177.296 Y196.468 E.01592
N14976 G1 X159.249 Y178.421 E.76118
N14977 G1 X159.249 Y177.887 E.01592
N14978 G1 X177.83 Y196.468 E.7837
N14979 G1 X178.364 Y196.468 E.01592
N14980 G1 X159.249 Y177.353 E.80622
N14981 G1 X159.249 Y176.819 E.01592
N14982 G1 X178.898 Y196.468 E.82874
N14983 G1 X179.432 Y196.468 E.01592
N14984 G1 X159.249 Y176.285 E.85126
N14985 G1 X159.249 Y175.751 E.01592
N14986 G1 X179.966 Y196.468 E.87379
N14987 G1 X180.5 Y196.468 E.01592
N14988 G1 X159.249 Y175.217 E.89631
N14989 G1 X159.249 Y174.683 E.01592
N14990 G1 X181.034 Y196.468 E.91883
N14991 G1 X181.568 Y196.468 E.01592
N14992 G1 X159.249 Y174.149 E.94135
N14993 G1 X159.249 Y173.616 E.01592
N14994 G1 X182.102 Y196.468 E.96387
N14995 G1 X182.636 Y196.468 E.01592
N14996 G1 X159.249 Y173.082 E.98639
N14997 G1 X159.249 Y172.548 E.01592
N14998 G1 X183.17 Y196.468 E1.00891
N14999 G1 X183.704 Y196.468 E.01592
N15000 G1 X159.249 Y172.014 E1.03143
N15001 G1 X159.249 Y171.48 E.01592
N15002 G1 X184.238 Y196.468 E1.05395
N15003 G1 X184.772 Y196.468 E.01592
N15004 G1 X159.249 Y170.946 E1.07648
N15005 G1 X159.249 Y170.412 E.01593
N15006 G1 X185.305 Y196.468 E1.099
N15007 G1 X185.839 Y196.468 E.01592
N15008 G1 X159.249 Y169.878 E1.12152
N15009 G1 X159.249 Y169.344 E.01592
N15010 G1 X186.373 Y196.468 E1.14404
N15011 G1 X186.907 Y196.468 E.01592
N15012 G1 X159.249 Y168.81 E1.16656
N15013 G1 X159.249 Y168.276 E.01592
N15014 G1 X187.441 Y196.468 E1.18908
N15015 G1 X187.975 Y196.468 E.01592
N15016 G1 X159.249 Y167.742 E1.2116
N15017 G1 X159.249 Y167.208 E.01592
N15018 G1 X188.509 Y196.468 E1.23412
N15019 G1 X189.043 Y196.468 E.01593
N15020 G1 X159.249 Y166.674 E1.25664
N15021 G1 X159.249 Y166.14 E.01592
N15022 G1 X189.577 Y196.468 E1.27917
N15023 G1 X190.111 Y196.468 E.01592
N15024 G1 X159.249 Y165.606 E1.30169
N15025 G1 X159.249 Y165.072 E.01592
N15026 G1 X190.645 Y196.468 E1.32421
N15027 G1 X190.751 Y196.468 E.00315
N15028 G1 X190.751 Y196.039 E.01278
N15029 G1 X159.249 Y164.538 E1.32866
N15030 G1 X159.249 Y164.004 E.01592
N15031 G1 X190.751 Y195.505 E1.32866
N15032 G1 X190.751 Y194.972 E.01592
N15033 G1 X159.249 Y163.47 E1.32866
N15034 G1 X159.249 Y162.936 E.01592
N15035 G1 X190.751 Y194.438 E1.32866
N15036 G1 X190.751 Y193.904 E.01592
N15037 G1 X159.249 Y162.403 E1.32866
N15038 G1 X159.249 Y161.869 E.01592
N15039 G1 X190.751 Y193.37 E1.32866
N15040 G1 X190.751 Y192.836 E.01592
N15041 G1 X159.249 Y161.335 E1.32866
N15042 G1 X159.249 Y160.801 E.01592
N15043 G1 X190.751 Y192.302 E1.32866
N15044 G1 X190.751 Y191.768 E.01592
N15045 G1 X159.249 Y160.267 E1.32866
N15046 G1 X159.249 Y159.733 E.01592
N15047 G1 X190.751 Y191.234 E1.32866
N15048 G1 X190.751 Y190.7 E.01592
N15049 G1 X159.249 Y159.199 E1.32866
N15050 G1 X159.249 Y158.665 E.01592
N15051 G1 X190.751 Y190.166 E1.32866
N15052 G1 X190.751 Y189.632 E.01592
N15053 G1 X159.249 Y158.131 E1.32866
N15054 G1 X159.249 Y157.597 E.01592
N15055 G1 X190.751 Y189.098 E1.32866
N15056 G1 X190.751 Y188.564 E.01592
N15057 G1 X159.249 Y157.063 E1.32866
N15058 G1 X159.249 Y156.529 E.01592
N15059 G1 X190.751 Y188.03 E1.32866
N15060 G1 X190.751 Y187.496 E.01592
N15061 G1 X159.249 Y155.995 E1.32866
N15062 G1 X159.249 Y155.461 E.01592
N15063 G1 X190.751 Y186.962 E1.32866
N15064 G1 X190.751 Y186.428 E.01592
N15065 G1 X159.249 Y154.927 E1.32866
N15066 G1 X159.249 Y154.393 E.01592
N15067 G1 X190.751 Y185.894 E1.32866
N15068 G1 X190.751 Y185.36 E.01592
N15069 G1 X159.249 Y153.859 E1.32866
N15070 G1 X159.249 Y153.325 E.01592
N15071 G1 X190.751 Y184.826 E1.32866
N15072 G1 X190.751 Y184.293 E.01592
N15073 G1 X159.249 Y152.791 E1.32866
N15074 G1 X159.249 Y152.257 E.01592
N15075 G1 X190.751 Y183.759 E1.32866
N15076 G1 X190.751 Y183.225 E.01592
N15077 G1 X159.249 Y151.724 E1.32866
N15078 G1 X159.249 Y151.19 E.01592
N15079 G1 X190.751 Y182.691 E1.32866
N15080 G1 X190.751 Y182.157 E.01592
N15081 G1 X159.249 Y150.656 E1.32866
N15082 G1 X159.249 Y150.122 E.01592
N15083 G1 X190.751 Y181.623 E1.32866
N15084 G1 X190.751 Y181.089 E.01592
N15085 G1 X159.249 Y149.588 E1.32866
N15086 G1 X159.249 Y149.054 E.01592
N15087 G1 X190.751 Y180.555 E1.32866
N15088 G1 X190.751 Y180.021 E.01592
N15089 G1 X159.249 Y148.52 E1.32866
N15090 G1 X159.249 Y147.986 E.01592
N15091 G1 X190.751 Y179.487 E1.32866
N15092 G1 X190.751 Y178.953 E.01592
N15093 G1 X159.249 Y147.452 E1.32866
N15094 G1 X159.249 Y146.918 E.01592
N15095 G1 X190.751 Y178.419 E1.32866
N15096 G1 X190.751 Y177.885 E.01592
N15097 G1 X159.249 Y146.384 E1.32866
N15098 G1 X159.249 Y145.85 E.01592
N15099 G1 X190.751 Y177.351 E1.32866
N15100 G1 X190.751 Y176.817 E.01592
N15101 G1 X159.249 Y145.316 E1.32866
N15102 G1 X159.249 Y144.782 E.01592
N15103 G1 X190.751 Y176.283 E1.32866
N15104 G1 X190.751 Y175.749 E.01592
N15105 G1 X159.249 Y144.248 E1.32866
N15106 G1 X159.249 Y143.714 E.01592
N15107 G1 X190.751 Y175.215 E1.32866
N15108 G1 X190.751 Y174.681 E.01593
N15109 M73 P93 R2
N15110 G1 X159.249 Y143.18 E1.32866
N15111 G1 X159.249 Y142.646 E.01592
N15112 G1 X190.751 Y174.147 E1.32866
N15113 G1 X190.751 Y173.614 E.01592
N15114 G1 X159.249 Y142.112 E1.32866
N15115 G1 X159.249 Y141.578 E.01592
N15116 G1 X190.751 Y173.08 E1.32866
N15117 G1 X190.751 Y172.546 E.01592
N15118 G1 X159.249 Y141.045 E1.32866
N15119 G1 X159.249 Y140.511 E.01592
N15120 G1 X190.751 Y172.012 E1.32866
N15121 G1 X190.751 Y171.478 E.01592
N15122 G1 X159.249 Y139.977 E1.32866
N15123 G1 X159.249 Y139.443 E.01592
N15124 G1 X190.751 Y170.944 E1.32866
N15125 G1 X190.751 Y170.41 E.01592
N15126 G1 X159.249 Y138.909 E1.32866
N15127 G1 X159.249 Y138.375 E.01592
N15128 G1 X190.751 Y169.876 E1.32866
N15129 G1 X190.751 Y169.342 E.01592
N15130 G1 X159.249 Y137.841 E1.32866
N15131 G1 X159.249 Y137.307 E.01592
N15132 G1 X190.751 Y168.808 E1.32866
N15133 G1 X190.751 Y168.274 E.01592
N15134 G1 X159.249 Y136.773 E1.32866
N15135 G1 X159.249 Y136.239 E.01593
N15136 G1 X190.751 Y167.74 E1.32866
N15137 G1 X190.751 Y167.206 E.01592
N15138 G1 X159.249 Y135.705 E1.32866
N15139 G1 X159.249 Y135.171 E.01592
N15140 G1 X190.751 Y166.672 E1.32866
N15141 G1 X190.751 Y166.138 E.01592
N15142 G1 X159.249 Y134.637 E1.32866
N15143 G1 X159.249 Y134.103 E.01592
N15144 G1 X190.751 Y165.604 E1.32866
N15145 G1 X190.751 Y165.07 E.01592
N15146 G1 X159.249 Y133.569 E1.32866
N15147 G1 X159.249 Y133.035 E.01592
N15148 G1 X190.751 Y164.536 E1.32866
N15149 G1 X190.751 Y164.002 E.01592
N15150 G1 X159.249 Y132.501 E1.32866
N15151 G1 X159.249 Y131.967 E.01592
N15152 G1 X190.751 Y163.468 E1.32866
N15153 G1 X190.751 Y162.934 E.01592
N15154 G1 X159.249 Y131.433 E1.32866
N15155 G1 X159.249 Y130.899 E.01592
N15156 G1 X190.751 Y162.401 E1.32866
N15157 G1 X190.751 Y161.867 E.01592
N15158 G1 X159.249 Y130.366 E1.32866
N15159 G1 X159.249 Y129.832 E.01592
N15160 G1 X190.751 Y161.333 E1.32866
N15161 G1 X190.751 Y160.799 E.01592
N15162 G1 X159.249 Y129.298 E1.32866
N15163 G1 X159.249 Y128.764 E.01592
N15164 G1 X190.751 Y160.265 E1.32866
N15165 G1 X190.751 Y159.731 E.01592
N15166 G1 X159.249 Y128.23 E1.32866
N15167 G1 X159.249 Y127.696 E.01592
N15168 G1 X190.751 Y159.197 E1.32866
N15169 G1 X190.751 Y158.663 E.01592
N15170 G1 X159.249 Y127.162 E1.32866
N15171 G1 X159.249 Y126.628 E.01592
N15172 G1 X190.751 Y158.129 E1.32866
N15173 G1 X190.751 Y157.595 E.01592
N15174 G1 X159.249 Y126.094 E1.32866
N15175 G1 X159.249 Y125.56 E.01592
N15176 G1 X190.751 Y157.061 E1.32866
N15177 G1 X190.751 Y156.527 E.01592
N15178 G1 X159.249 Y125.026 E1.32866
N15179 G1 X159.249 Y124.492 E.01592
N15180 G1 X190.751 Y155.993 E1.32866
N15181 G1 X190.751 Y155.459 E.01592
N15182 G1 X159.249 Y123.958 E1.32866
N15183 G1 X159.249 Y123.532 E.0127
N15184 G1 X159.357 Y123.532 E.00322
N15185 G1 X190.751 Y154.925 E1.3241
N15186 G1 X190.751 Y154.391 E.01592
N15187 G1 X159.891 Y123.532 E1.30158
N15188 G1 X160.425 Y123.532 E.01592
N15189 G1 X190.751 Y153.857 E1.27906
N15190 G1 X190.751 Y153.323 E.01592
N15191 G1 X160.959 Y123.532 E1.25654
N15192 G1 X161.493 Y123.532 E.01592
N15193 G1 X190.751 Y152.789 E1.23402
N15194 G1 X190.751 Y152.255 E.01593
N15195 G1 X162.027 Y123.532 E1.2115
N15196 G1 X162.561 Y123.532 E.01592
N15197 G1 X190.751 Y151.722 E1.18898
N15198 G1 X190.751 Y151.188 E.01592
N15199 G1 X163.095 Y123.532 E1.16646
N15200 G1 X163.629 Y123.532 E.01592
N15201 G1 X190.751 Y150.654 E1.14394
N15202 G1 X190.751 Y150.12 E.01592
N15203 G1 X164.163 Y123.532 E1.12141
N15204 G1 X164.697 Y123.532 E.01592
N15205 G1 X190.751 Y149.586 E1.09889
N15206 G1 X190.751 Y149.052 E.01592
N15207 G1 X165.231 Y123.532 E1.07637
N15208 G1 X165.765 Y123.532 E.01592
N15209 G1 X190.751 Y148.518 E1.05385
N15210 G1 X190.751 Y147.984 E.01592
N15211 G1 X166.299 Y123.532 E1.03133
N15212 G1 X166.833 Y123.532 E.01592
N15213 G1 X190.751 Y147.45 E1.00881
N15214 G1 X190.751 Y146.916 E.01592
N15215 G1 X167.367 Y123.532 E.98629
N15216 G1 X167.901 Y123.532 E.01592
N15217 G1 X190.751 Y146.382 E.96377
N15218 G1 X190.751 Y145.848 E.01592
N15219 G1 X168.435 Y123.532 E.94125
N15220 G1 X168.969 Y123.532 E.01592
N15221 G1 X190.751 Y145.314 E.91873
N15222 G1 X190.751 Y144.78 E.01592
N15223 G1 X169.503 Y123.532 E.8962
N15224 G1 X170.036 Y123.532 E.01593
N15225 G1 X190.751 Y144.246 E.87368
N15226 G1 X190.751 Y143.712 E.01592
N15227 G1 X170.57 Y123.532 E.85116
N15228 G1 X171.104 Y123.532 E.01592
N15229 G1 X190.751 Y143.178 E.82864
N15230 G1 X190.751 Y142.644 E.01592
N15231 G1 X171.638 Y123.532 E.80612
N15232 G1 X172.172 Y123.532 E.01592
N15233 G1 X190.751 Y142.11 E.7836
N15234 G1 X190.751 Y141.576 E.01592
N15235 G1 X172.706 Y123.532 E.76108
N15236 G1 X173.24 Y123.532 E.01592
N15237 G1 X190.751 Y141.043 E.73856
N15238 G1 X190.751 Y140.509 E.01593
N15239 G1 X173.774 Y123.532 E.71603
N15240 G1 X174.308 Y123.532 E.01592
N15241 G1 X190.751 Y139.975 E.69351
N15242 G1 X190.751 Y139.441 E.01592
N15243 G1 X174.842 Y123.532 E.67099
N15244 G1 X175.376 Y123.532 E.01592
N15245 G1 X190.751 Y138.907 E.64847
N15246 G1 X190.751 Y138.373 E.01592
N15247 G1 X175.91 Y123.532 E.62595
N15248 G1 X176.444 Y123.532 E.01592
N15249 G1 X190.751 Y137.839 E.60343
N15250 G1 X190.751 Y137.305 E.01592
N15251 G1 X176.978 Y123.532 E.58091
N15252 G1 X177.512 Y123.532 E.01592
N15253 G1 X190.751 Y136.771 E.55839
N15254 G1 X190.751 Y136.237 E.01592
N15255 G1 X178.046 Y123.532 E.53587
N15256 G1 X178.58 Y123.532 E.01592
N15257 G1 X190.751 Y135.703 E.51335
N15258 G1 X190.751 Y135.169 E.01592
N15259 G1 X179.114 Y123.532 E.49082
N15260 G1 X179.648 Y123.532 E.01592
N15261 G1 X190.751 Y134.635 E.4683
N15262 G1 X190.751 Y134.101 E.01592
N15263 G1 X180.182 Y123.532 E.44578
N15264 G1 X180.715 Y123.532 E.01592
N15265 G1 X190.751 Y133.567 E.42326
N15266 G1 X190.751 Y133.033 E.01592
N15267 G1 X181.249 Y123.532 E.40074
N15268 G1 X181.783 Y123.532 E.01592
N15269 G1 X190.751 Y132.499 E.37822
N15270 G1 X190.751 Y131.965 E.01592
N15271 G1 X182.317 Y123.532 E.3557
N15272 G1 X182.851 Y123.532 E.01592
N15273 G1 X190.751 Y131.431 E.33318
N15274 G1 X190.751 Y130.897 E.01592
N15275 G1 X183.385 Y123.532 E.31066
N15276 G1 X183.919 Y123.532 E.01592
N15277 G1 X190.751 Y130.364 E.28813
N15278 G1 X190.751 Y129.83 E.01592
N15279 G1 X184.453 Y123.532 E.26561
N15280 G1 X184.987 Y123.532 E.01592
N15281 G1 X190.751 Y129.296 E.24309
N15282 G1 X190.751 Y128.762 E.01592
N15283 G1 X185.521 Y123.532 E.22057
N15284 G1 X186.055 Y123.532 E.01592
N15285 G1 X190.751 Y128.228 E.19805
N15286 M73 P94 R2
N15287 G1 X190.751 Y127.694 E.01592
N15288 G1 X186.589 Y123.532 E.17553
N15289 G1 X187.123 Y123.532 E.01592
N15290 G1 X190.751 Y127.16 E.15301
N15291 G1 X190.751 Y126.626 E.01592
N15292 G1 X187.657 Y123.532 E.13049
N15293 G1 X188.191 Y123.532 E.01592
N15294 G1 X190.751 Y126.092 E.10797
N15295 G1 X190.751 Y125.558 E.01592
N15296 G1 X188.725 Y123.532 E.08544
N15297 G1 X189.259 Y123.532 E.01592
N15298 G1 X190.751 Y125.024 E.06292
N15299 G1 X190.751 Y124.49 E.01592
N15300 G1 X189.793 Y123.532 E.0404
N15301 G1 X190.327 Y123.532 E.01592
N15302 G1 X190.92 Y124.126 E.02504
N15303 ; WIPE_START
N15304 G1 X190.327 Y123.532 E-.31901
N15305 G1 X189.793 Y123.532 E-.2029
N15306 G1 X190.236 Y123.975 E-.23809
N15307 ; WIPE_END
N15308 G1 E-.04 F1800
N15309 M204 S10000
N15310 G17
N15311 G3 Z12.6 I1.217 J0 P1  F60000
N15312 ; stop printing object, unique label id: 130
N15313 M625
N15314 ; object ids of layer 61 start: 130
N15315 M624 AQAAAAAAAAA=
N15316 ;======== H2D 20250527========
N15317 ; SKIPPABLE_START
N15318 ; SKIPTYPE: timelapse
N15319 M622.1 S1 ; for prev firware, default turned on
N15320 
N15321 M1002 judge_flag timelapse_record_flag
N15322 
N15323 M622 J1
N15324 M993 A2 B2 C2
N15325 M993 A0 B0 C0
N15326 
N15327 
N15328 
N15329 
N15330     M9711 M0 E1 X260 Y137 Z12.6 S11 C10 O0 T3000
N15331 
N15332 
N15333 
N15334 M993 A3 B3 C3
N15335 
N15336 M623
N15337 ; SKIPPABLE_END
N15338 
N15339 ; object ids of this layer61 end: 130
N15340 M625
N15341 ; CHANGE_LAYER
N15342 ; Z_HEIGHT: 12.4
N15343 ; LAYER_HEIGHT: 0.2
N15344 ;======== H2D 20250521========
N15345 ; layer num/total_layer_count: 62/63
N15346 ; update layer progress
N15347 M73 L62
N15348 M991 S0 P61 ;notify layer change
N15349 
N15350 
N15351 ; OBJECT_ID: 130
N15352 ; COOLING_NODE: 0
N15353 ; start printing object, unique label id: 130
N15354 M624 AQAAAAAAAAA=
N15355 G1 X191.084 Y196.801 F60000
N15356 G1 Z12.4
N15357 G1 E.8 F1800
N15358 ; FEATURE: Inner wall
N15359 ; LINE_WIDTH: 0.45
N15360 ; LAYER_HEIGHT: 0.2
N15361 G1 F8475
N15362 M204 S8000
N15363 G1 X158.916 Y196.801 E1.03439
N15364 G1 X158.916 Y123.199 E2.36678
N15365 G1 X191.084 Y123.199 E1.03439
N15366 G1 X191.084 Y196.741 E2.36485
N15367 ; COOLING_NODE: 0
N15368 M204 S10000
N15369 G1 X191.491 Y197.208 F60000
N15370 G1 F8475
N15371 M204 S8000
N15372 G1 X158.509 Y197.208 E1.06057
N15373 G1 X158.509 Y122.792 E2.39296
N15374 G1 X191.491 Y122.792 E1.06057
N15375 G1 X191.491 Y197.148 E2.39103
N15376 ; COOLING_NODE: 0
N15377 M204 S10000
N15378 G1 X191.898 Y197.615 F60000
N15379 G1 F8475
N15380 M204 S8000
N15381 G1 X158.102 Y197.615 E1.08675
N15382 G1 X158.102 Y122.385 E2.41914
N15383 G1 X191.898 Y122.385 E1.08675
N15384 G1 X191.898 Y197.555 E2.41721
N15385 ; COOLING_NODE: 0
N15386 M204 S10000
N15387 G1 X192.29 Y198.007 F60000
N15388 ; FEATURE: Outer wall
N15389 ; LINE_WIDTH: 0.42
N15390 G1 F9149.261
N15391 M204 S5000
N15392 G1 X157.71 Y198.007 E1.03002
N15393 G1 X157.71 Y121.993 E2.26421
N15394 G1 X192.29 Y121.993 E1.03002
N15395 G1 X192.29 Y197.947 E2.26243
N15396 G1 E-.8 F1800
N15397 M204 S10000
N15398 G1 X190.157 Y196.637 Z12.8 F60000
N15399 G1 Z12.4
N15400 G1 E.8 F1800
N15401 ; FEATURE: Internal solid infill
N15402 ; LINE_WIDTH: 0.42048
N15403 G1 F9137.621
N15404 M204 S8000
N15405 G1 X190.751 Y196.044 E.02504
N15406 G1 X190.751 Y195.51 E.01592
N15407 G1 X189.793 Y196.468 E.0404
N15408 G1 X189.259 Y196.468 E.01592
N15409 G1 X190.751 Y194.976 E.06292
N15410 G1 X190.751 Y194.442 E.01592
N15411 G1 X188.725 Y196.468 E.08544
N15412 G1 X188.191 Y196.468 E.01592
N15413 G1 X190.751 Y193.908 E.10797
N15414 G1 X190.751 Y193.374 E.01592
N15415 G1 X187.657 Y196.468 E.13049
N15416 G1 X187.123 Y196.468 E.01592
N15417 G1 X190.751 Y192.84 E.15301
N15418 G1 X190.751 Y192.306 E.01592
N15419 G1 X186.589 Y196.468 E.17553
N15420 G1 X186.055 Y196.468 E.01592
N15421 G1 X190.751 Y191.772 E.19805
N15422 G1 X190.751 Y191.238 E.01592
N15423 G1 X185.521 Y196.468 E.22057
N15424 G1 X184.987 Y196.468 E.01592
N15425 G1 X190.751 Y190.704 E.24309
N15426 G1 X190.751 Y190.17 E.01592
N15427 G1 X184.453 Y196.468 E.26561
N15428 G1 X183.919 Y196.468 E.01592
N15429 G1 X190.751 Y189.636 E.28813
N15430 G1 X190.751 Y189.103 E.01592
N15431 G1 X183.385 Y196.468 E.31066
N15432 G1 X182.851 Y196.468 E.01592
N15433 G1 X190.751 Y188.569 E.33318
N15434 G1 X190.751 Y188.035 E.01592
N15435 G1 X182.317 Y196.468 E.3557
N15436 G1 X181.783 Y196.468 E.01592
N15437 G1 X190.751 Y187.501 E.37822
N15438 G1 X190.751 Y186.967 E.01593
N15439 G1 X181.249 Y196.468 E.40074
N15440 G1 X180.715 Y196.468 E.01592
N15441 G1 X190.751 Y186.433 E.42326
N15442 G1 X190.751 Y185.899 E.01592
N15443 G1 X180.182 Y196.468 E.44578
N15444 G1 X179.648 Y196.468 E.01592
N15445 G1 X190.751 Y185.365 E.4683
N15446 G1 X190.751 Y184.831 E.01592
N15447 G1 X179.114 Y196.468 E.49082
N15448 G1 X178.58 Y196.468 E.01592
N15449 G1 X190.751 Y184.297 E.51335
N15450 G1 X190.751 Y183.763 E.01592
N15451 G1 X178.046 Y196.468 E.53587
N15452 G1 X177.512 Y196.468 E.01592
N15453 G1 X190.751 Y183.229 E.55839
N15454 G1 X190.751 Y182.695 E.01592
N15455 G1 X176.978 Y196.468 E.58091
N15456 G1 X176.444 Y196.468 E.01593
N15457 G1 X190.751 Y182.161 E.60343
N15458 G1 X190.751 Y181.627 E.01592
N15459 G1 X175.91 Y196.468 E.62595
N15460 G1 X175.376 Y196.468 E.01592
N15461 G1 X190.751 Y181.093 E.64847
N15462 G1 X190.751 Y180.559 E.01592
N15463 G1 X174.842 Y196.468 E.67099
N15464 G1 X174.308 Y196.468 E.01592
N15465 G1 X190.751 Y180.025 E.69351
N15466 G1 X190.751 Y179.491 E.01592
N15467 G1 X173.774 Y196.468 E.71604
N15468 G1 X173.24 Y196.468 E.01593
N15469 G1 X190.751 Y178.957 E.73856
N15470 G1 X190.751 Y178.423 E.01592
N15471 G1 X172.706 Y196.468 E.76108
N15472 G1 X172.172 Y196.468 E.01592
N15473 G1 X190.751 Y177.89 E.7836
N15474 G1 X190.751 Y177.356 E.01592
N15475 G1 X171.638 Y196.468 E.80612
N15476 G1 X171.104 Y196.468 E.01592
N15477 G1 X190.751 Y176.822 E.82864
N15478 G1 X190.751 Y176.288 E.01592
N15479 G1 X170.57 Y196.468 E.85116
N15480 G1 X170.036 Y196.468 E.01592
N15481 G1 X190.751 Y175.754 E.87368
N15482 G1 X190.751 Y175.22 E.01592
N15483 G1 X169.503 Y196.468 E.8962
N15484 G1 X168.969 Y196.468 E.01592
N15485 G1 X190.751 Y174.686 E.91873
N15486 G1 X190.751 Y174.152 E.01592
N15487 G1 X168.435 Y196.468 E.94125
N15488 G1 X167.901 Y196.468 E.01592
N15489 G1 X190.751 Y173.618 E.96377
N15490 G1 X190.751 Y173.084 E.01592
N15491 G1 X167.367 Y196.468 E.98629
N15492 G1 X166.833 Y196.468 E.01592
N15493 G1 X190.751 Y172.55 E1.00881
N15494 G1 X190.751 Y172.016 E.01592
N15495 G1 X166.299 Y196.468 E1.03133
N15496 G1 X165.765 Y196.468 E.01592
N15497 G1 X190.751 Y171.482 E1.05385
N15498 G1 X190.751 Y170.948 E.01592
N15499 G1 X165.231 Y196.468 E1.07637
N15500 G1 X164.697 Y196.468 E.01592
N15501 G1 X190.751 Y170.414 E1.09889
N15502 G1 X190.751 Y169.88 E.01592
N15503 G1 X164.163 Y196.468 E1.12141
N15504 G1 X163.629 Y196.468 E.01592
N15505 G1 X190.751 Y169.346 E1.14394
N15506 G1 X190.751 Y168.812 E.01592
N15507 G1 X163.095 Y196.468 E1.16646
N15508 G1 X162.561 Y196.468 E.01592
N15509 M73 P94 R1
N15510 G1 X190.751 Y168.278 E1.18898
N15511 G1 X190.751 Y167.744 E.01592
N15512 G1 X162.027 Y196.468 E1.2115
N15513 G1 X161.493 Y196.468 E.01592
N15514 G1 X190.751 Y167.211 E1.23402
N15515 G1 X190.751 Y166.677 E.01592
N15516 G1 X160.959 Y196.468 E1.25654
N15517 G1 X160.425 Y196.468 E.01592
N15518 G1 X190.751 Y166.143 E1.27906
N15519 G1 X190.751 Y165.609 E.01592
N15520 G1 X159.891 Y196.468 E1.30158
N15521 G1 X159.357 Y196.468 E.01592
N15522 G1 X190.751 Y165.075 E1.3241
N15523 G1 X190.751 Y164.541 E.01593
N15524 G1 X159.249 Y196.042 E1.32866
N15525 G1 X159.249 Y195.508 E.01592
N15526 G1 X190.751 Y164.007 E1.32866
N15527 G1 X190.751 Y163.473 E.01592
N15528 G1 X159.249 Y194.974 E1.32866
N15529 G1 X159.249 Y194.44 E.01593
N15530 G1 X190.751 Y162.939 E1.32866
N15531 G1 X190.751 Y162.405 E.01592
N15532 G1 X159.249 Y193.906 E1.32866
N15533 G1 X159.249 Y193.372 E.01592
N15534 G1 X190.751 Y161.871 E1.32866
N15535 G1 X190.751 Y161.337 E.01592
N15536 G1 X159.249 Y192.838 E1.32866
N15537 G1 X159.249 Y192.304 E.01592
N15538 G1 X190.751 Y160.803 E1.32866
N15539 G1 X190.751 Y160.269 E.01592
N15540 G1 X159.249 Y191.77 E1.32866
N15541 G1 X159.249 Y191.236 E.01592
N15542 G1 X190.751 Y159.735 E1.32866
N15543 G1 X190.751 Y159.201 E.01592
N15544 G1 X159.249 Y190.702 E1.32866
N15545 G1 X159.249 Y190.168 E.01592
N15546 G1 X190.751 Y158.667 E1.32866
N15547 G1 X190.751 Y158.133 E.01592
N15548 G1 X159.249 Y189.634 E1.32866
N15549 G1 X159.249 Y189.1 E.01592
N15550 G1 X190.751 Y157.599 E1.32866
N15551 G1 X190.751 Y157.065 E.01592
N15552 G1 X159.249 Y188.567 E1.32866
N15553 G1 X159.249 Y188.033 E.01592
N15554 M73 P95 R1
N15555 G1 X190.751 Y156.532 E1.32866
N15556 G1 X190.751 Y155.998 E.01592
N15557 G1 X159.249 Y187.499 E1.32866
N15558 G1 X159.249 Y186.965 E.01592
N15559 G1 X190.751 Y155.464 E1.32866
N15560 G1 X190.751 Y154.93 E.01592
N15561 G1 X159.249 Y186.431 E1.32866
N15562 G1 X159.249 Y185.897 E.01592
N15563 G1 X190.751 Y154.396 E1.32866
N15564 G1 X190.751 Y153.862 E.01592
N15565 G1 X159.249 Y185.363 E1.32866
N15566 G1 X159.249 Y184.829 E.01592
N15567 G1 X190.751 Y153.328 E1.32866
N15568 G1 X190.751 Y152.794 E.01592
N15569 G1 X159.249 Y184.295 E1.32866
N15570 G1 X159.249 Y183.761 E.01592
N15571 G1 X190.751 Y152.26 E1.32866
N15572 G1 X190.751 Y151.726 E.01592
N15573 G1 X159.249 Y183.227 E1.32866
N15574 G1 X159.249 Y182.693 E.01593
N15575 G1 X190.751 Y151.192 E1.32866
N15576 G1 X190.751 Y150.658 E.01592
N15577 G1 X159.249 Y182.159 E1.32866
N15578 G1 X159.249 Y181.625 E.01592
N15579 G1 X190.751 Y150.124 E1.32866
N15580 G1 X190.751 Y149.59 E.01592
N15581 G1 X159.249 Y181.091 E1.32866
N15582 G1 X159.249 Y180.557 E.01592
N15583 G1 X190.751 Y149.056 E1.32866
N15584 G1 X190.751 Y148.522 E.01592
N15585 G1 X159.249 Y180.023 E1.32866
N15586 G1 X159.249 Y179.489 E.01592
N15587 G1 X190.751 Y147.988 E1.32866
N15588 G1 X190.751 Y147.454 E.01592
N15589 G1 X159.249 Y178.955 E1.32866
N15590 G1 X159.249 Y178.421 E.01592
N15591 G1 X190.751 Y146.92 E1.32866
N15592 G1 X190.751 Y146.386 E.01592
N15593 G1 X159.249 Y177.888 E1.32866
N15594 G1 X159.249 Y177.354 E.01592
N15595 G1 X190.751 Y145.853 E1.32866
N15596 G1 X190.751 Y145.319 E.01593
N15597 G1 X159.249 Y176.82 E1.32866
N15598 G1 X159.249 Y176.286 E.01592
N15599 G1 X190.751 Y144.785 E1.32866
N15600 G1 X190.751 Y144.251 E.01592
N15601 G1 X159.249 Y175.752 E1.32866
N15602 G1 X159.249 Y175.218 E.01592
N15603 G1 X190.751 Y143.717 E1.32866
N15604 G1 X190.751 Y143.183 E.01592
N15605 G1 X159.249 Y174.684 E1.32866
N15606 G1 X159.249 Y174.15 E.01592
N15607 G1 X190.751 Y142.649 E1.32866
N15608 G1 X190.751 Y142.115 E.01592
N15609 G1 X159.249 Y173.616 E1.32866
N15610 G1 X159.249 Y173.082 E.01592
N15611 G1 X190.751 Y141.581 E1.32866
N15612 G1 X190.751 Y141.047 E.01592
N15613 G1 X159.249 Y172.548 E1.32866
N15614 G1 X159.249 Y172.014 E.01592
N15615 G1 X190.751 Y140.513 E1.32866
N15616 G1 X190.751 Y139.979 E.01592
N15617 G1 X159.249 Y171.48 E1.32866
N15618 G1 X159.249 Y170.946 E.01592
N15619 G1 X190.751 Y139.445 E1.32866
N15620 G1 X190.751 Y138.911 E.01592
N15621 G1 X159.249 Y170.412 E1.32866
N15622 G1 X159.249 Y169.878 E.01592
N15623 G1 X190.751 Y138.377 E1.32866
N15624 G1 X190.751 Y137.843 E.01592
N15625 G1 X159.249 Y169.344 E1.32866
N15626 G1 X159.249 Y168.81 E.01592
N15627 G1 X190.751 Y137.309 E1.32866
N15628 G1 X190.751 Y136.775 E.01592
N15629 G1 X159.249 Y168.276 E1.32866
N15630 G1 X159.249 Y167.742 E.01592
N15631 G1 X190.751 Y136.241 E1.32866
N15632 G1 X190.751 Y135.707 E.01592
N15633 G1 X159.249 Y167.209 E1.32866
N15634 G1 X159.249 Y166.675 E.01592
N15635 G1 X190.751 Y135.174 E1.32866
N15636 G1 X190.751 Y134.64 E.01592
N15637 G1 X159.249 Y166.141 E1.32866
N15638 G1 X159.249 Y165.607 E.01592
N15639 G1 X190.751 Y134.106 E1.32866
N15640 G1 X190.751 Y133.572 E.01593
N15641 G1 X159.249 Y165.073 E1.32866
N15642 G1 X159.249 Y164.539 E.01592
N15643 G1 X190.751 Y133.038 E1.32866
N15644 G1 X190.751 Y132.504 E.01592
N15645 G1 X159.249 Y164.005 E1.32866
N15646 G1 X159.249 Y163.471 E.01592
N15647 G1 X190.751 Y131.97 E1.32866
N15648 G1 X190.751 Y131.436 E.01592
N15649 G1 X159.249 Y162.937 E1.32866
N15650 G1 X159.249 Y162.403 E.01592
N15651 G1 X190.751 Y130.902 E1.32866
N15652 G1 X190.751 Y130.368 E.01592
N15653 G1 X159.249 Y161.869 E1.32866
N15654 G1 X159.249 Y161.335 E.01592
N15655 G1 X190.751 Y129.834 E1.32866
N15656 G1 X190.751 Y129.3 E.01592
N15657 G1 X159.249 Y160.801 E1.32866
N15658 G1 X159.249 Y160.267 E.01593
N15659 G1 X190.751 Y128.766 E1.32866
N15660 G1 X190.751 Y128.232 E.01592
N15661 G1 X159.249 Y159.733 E1.32866
N15662 G1 X159.249 Y159.199 E.01592
N15663 G1 X190.751 Y127.698 E1.32866
N15664 G1 X190.751 Y127.164 E.01592
N15665 G1 X159.249 Y158.665 E1.32866
N15666 G1 X159.249 Y158.131 E.01592
N15667 G1 X190.751 Y126.63 E1.32866
N15668 G1 X190.751 Y126.096 E.01592
N15669 G1 X159.249 Y157.597 E1.32866
N15670 G1 X159.249 Y157.063 E.01592
N15671 G1 X190.751 Y125.562 E1.32866
N15672 G1 X190.751 Y125.028 E.01592
N15673 G1 X159.249 Y156.53 E1.32866
N15674 G1 X159.249 Y155.996 E.01592
N15675 G1 X190.751 Y124.495 E1.32866
N15676 G1 X190.751 Y123.961 E.01592
N15677 G1 X159.249 Y155.462 E1.32866
N15678 G1 X159.249 Y154.928 E.01592
N15679 G1 X190.645 Y123.532 E1.32421
N15680 G1 X190.111 Y123.532 E.01592
N15681 G1 X159.249 Y154.394 E1.30169
N15682 G1 X159.249 Y153.86 E.01592
N15683 G1 X189.577 Y123.532 E1.27917
N15684 G1 X189.043 Y123.532 E.01592
N15685 G1 X159.249 Y153.326 E1.25664
N15686 G1 X159.249 Y152.792 E.01592
N15687 G1 X188.509 Y123.532 E1.23412
N15688 G1 X187.975 Y123.532 E.01592
N15689 G1 X159.249 Y152.258 E1.2116
N15690 G1 X159.249 Y151.724 E.01592
N15691 G1 X187.441 Y123.532 E1.18908
N15692 G1 X186.907 Y123.532 E.01592
N15693 G1 X159.249 Y151.19 E1.16656
N15694 G1 X159.249 Y150.656 E.01592
N15695 M73 P96 R1
N15696 G1 X186.373 Y123.532 E1.14404
N15697 G1 X185.839 Y123.532 E.01592
N15698 G1 X159.249 Y150.122 E1.12152
N15699 G1 X159.249 Y149.588 E.01592
N15700 G1 X185.305 Y123.532 E1.099
N15701 G1 X184.772 Y123.532 E.01593
N15702 G1 X159.249 Y149.054 E1.07648
N15703 G1 X159.249 Y148.52 E.01592
N15704 G1 X184.238 Y123.532 E1.05395
N15705 G1 X183.704 Y123.532 E.01592
N15706 G1 X159.249 Y147.986 E1.03143
N15707 G1 X159.249 Y147.452 E.01592
N15708 G1 X183.17 Y123.532 E1.00891
N15709 G1 X182.636 Y123.532 E.01592
N15710 G1 X159.249 Y146.918 E.98639
N15711 G1 X159.249 Y146.384 E.01592
N15712 G1 X182.102 Y123.532 E.96387
N15713 G1 X181.568 Y123.532 E.01592
N15714 G1 X159.249 Y145.851 E.94135
N15715 G1 X159.249 Y145.317 E.01592
N15716 G1 X181.034 Y123.532 E.91883
N15717 G1 X180.5 Y123.532 E.01592
N15718 G1 X159.249 Y144.783 E.89631
N15719 G1 X159.249 Y144.249 E.01592
N15720 G1 X179.966 Y123.532 E.87379
N15721 G1 X179.432 Y123.532 E.01592
N15722 G1 X159.249 Y143.715 E.85126
N15723 G1 X159.249 Y143.181 E.01592
N15724 G1 X178.898 Y123.532 E.82874
N15725 G1 X178.364 Y123.532 E.01592
N15726 G1 X159.249 Y142.647 E.80622
N15727 G1 X159.249 Y142.113 E.01592
N15728 G1 X177.83 Y123.532 E.7837
N15729 G1 X177.296 Y123.532 E.01592
N15730 G1 X159.249 Y141.579 E.76118
N15731 G1 X159.249 Y141.045 E.01593
N15732 G1 X176.762 Y123.532 E.73866
N15733 G1 X176.228 Y123.532 E.01592
N15734 G1 X159.249 Y140.511 E.71614
N15735 G1 X159.249 Y139.977 E.01592
N15736 G1 X175.694 Y123.532 E.69362
N15737 G1 X175.16 Y123.532 E.01592
N15738 G1 X159.249 Y139.443 E.6711
N15739 G1 X159.249 Y138.909 E.01592
N15740 G1 X174.626 Y123.532 E.64857
N15741 G1 X174.093 Y123.532 E.01592
N15742 G1 X159.249 Y138.375 E.62605
N15743 G1 X159.249 Y137.841 E.01592
N15744 G1 X173.559 Y123.532 E.60353
N15745 G1 X173.025 Y123.532 E.01592
N15746 G1 X159.249 Y137.307 E.58101
N15747 G1 X159.249 Y136.773 E.01592
N15748 G1 X172.491 Y123.532 E.55849
N15749 G1 X171.957 Y123.532 E.01592
N15750 G1 X159.249 Y136.239 E.53597
N15751 G1 X159.249 Y135.705 E.01592
N15752 G1 X171.423 Y123.532 E.51345
N15753 G1 X170.889 Y123.532 E.01592
N15754 G1 X159.249 Y135.172 E.49093
N15755 G1 X159.249 Y134.638 E.01592
N15756 G1 X170.355 Y123.532 E.46841
N15757 G1 X169.821 Y123.532 E.01592
N15758 G1 X159.249 Y134.104 E.44588
N15759 G1 X159.249 Y133.57 E.01592
N15760 G1 X169.287 Y123.532 E.42336
N15761 G1 X168.753 Y123.532 E.01592
N15762 G1 X159.249 Y133.036 E.40084
N15763 G1 X159.249 Y132.502 E.01592
N15764 G1 X168.219 Y123.532 E.37832
N15765 G1 X167.685 Y123.532 E.01592
N15766 G1 X159.249 Y131.968 E.3558
N15767 G1 X159.249 Y131.434 E.01592
N15768 G1 X167.151 Y123.532 E.33328
N15769 G1 X166.617 Y123.532 E.01592
N15770 G1 X159.249 Y130.9 E.31076
N15771 G1 X159.249 Y130.366 E.01592
N15772 G1 X166.083 Y123.532 E.28824
N15773 G1 X165.549 Y123.532 E.01592
N15774 G1 X159.249 Y129.832 E.26572
N15775 G1 X159.249 Y129.298 E.01592
N15776 G1 X165.015 Y123.532 E.24319
N15777 G1 X164.481 Y123.532 E.01592
N15778 G1 X159.249 Y128.764 E.22067
N15779 G1 X159.249 Y128.23 E.01592
N15780 G1 X163.947 Y123.532 E.19815
N15781 G1 X163.413 Y123.532 E.01592
N15782 G1 X159.249 Y127.696 E.17563
N15783 G1 X159.249 Y127.162 E.01592
N15784 G1 X162.88 Y123.532 E.15311
N15785 G1 X162.346 Y123.532 E.01592
N15786 G1 X159.249 Y126.628 E.13059
N15787 G1 X159.249 Y126.094 E.01592
N15788 G1 X161.812 Y123.532 E.10807
N15789 G1 X161.278 Y123.532 E.01592
N15790 G1 X159.249 Y125.56 E.08555
N15791 G1 X159.249 Y125.026 E.01592
N15792 G1 X160.744 Y123.532 E.06303
N15793 G1 X160.21 Y123.532 E.01592
N15794 G1 X159.249 Y124.492 E.0405
N15795 G1 X159.249 Y123.959 E.01592
N15796 G1 X159.846 Y123.362 E.02514
N15797 ; WIPE_START
N15798 G1 X159.249 Y123.959 E-.32032
N15799 G1 X159.249 Y124.492 E-.2029
N15800 G1 X159.69 Y124.052 E-.23678
N15801 ; WIPE_END
N15802 G1 E-.04 F1800
N15803 M204 S10000
N15804 G17
N15805 G3 Z12.8 I1.217 J0 P1  F60000
N15806 ; stop printing object, unique label id: 130
N15807 M625
N15808 ; object ids of layer 62 start: 130
N15809 M624 AQAAAAAAAAA=
N15810 ;======== H2D 20250527========
N15811 ; SKIPPABLE_START
N15812 ; SKIPTYPE: timelapse
N15813 M622.1 S1 ; for prev firware, default turned on
N15814 
N15815 M1002 judge_flag timelapse_record_flag
N15816 
N15817 M622 J1
N15818 M993 A2 B2 C2
N15819 M993 A0 B0 C0
N15820 
N15821 
N15822 
N15823 
N15824     M9711 M0 E1 X260 Y137 Z12.8 S11 C10 O0 T3000
N15825 
N15826 
N15827 
N15828 M993 A3 B3 C3
N15829 
N15830 M623
N15831 ; SKIPPABLE_END
N15832 
N15833 ; object ids of this layer62 end: 130
N15834 M625
N15835 ; CHANGE_LAYER
N15836 ; Z_HEIGHT: 12.6
N15837 ; LAYER_HEIGHT: 0.200001
N15838 ;======== H2D 20250521========
N15839 ; layer num/total_layer_count: 63/63
N15840 ; update layer progress
N15841 M73 L63
N15842 M991 S0 P62 ;notify layer change
N15843 
N15844 
N15845 ; OBJECT_ID: 130
N15846 ; COOLING_NODE: 0
N15847 ; start printing object, unique label id: 130
N15848 M624 AQAAAAAAAAA=
N15849 G1 X192.29 Y198.007 F60000
N15850 G1 Z12.6
N15851 G1 E.8 F1800
N15852 ; FEATURE: Outer wall
N15853 ; LINE_WIDTH: 0.42
N15854 G1 F9149.261
N15855 M204 S5000
N15856 G1 X157.71 Y198.007 E1.03002
N15857 G1 X157.71 Y121.993 E2.26421
N15858 G1 X192.29 Y121.993 E1.03002
N15859 G1 X192.29 Y197.947 E2.26243
N15860 G1 E-.8 F1800
N15861 M204 S10000
N15862 G1 X192.269 Y190.315 Z13 F60000
N15863 G1 X192.083 Y122.957 Z13
N15864 G1 Z12.6
N15865 G1 E.8 F1800
N15866 ; FEATURE: Top surface
N15867 G1 F9149.261
N15868 M204 S2000
N15869 G1 X191.326 Y122.2 E.03189
N15870 G1 X190.792 Y122.2 E.01588
N15871 G1 X192.083 Y123.49 E.05435
N15872 G1 X192.083 Y124.024 E.01588
N15873 G1 X190.259 Y122.2 E.07681
N15874 G1 X189.726 Y122.2 E.01588
N15875 G1 X192.083 Y124.557 E.09928
N15876 G1 X192.083 Y125.09 E.01588
N15877 G1 X189.193 Y122.2 E.12174
N15878 G1 X188.659 Y122.2 E.01588
N15879 G1 X192.083 Y125.623 E.1442
N15880 G1 X192.083 Y126.157 E.01588
N15881 G1 X188.126 Y122.2 E.16667
N15882 G1 X187.593 Y122.2 E.01588
N15883 G1 X192.083 Y126.69 E.18913
N15884 G1 X192.083 Y127.223 E.01588
N15885 G1 X187.06 Y122.2 E.21159
N15886 G1 X186.526 Y122.2 E.01588
N15887 G1 X192.083 Y127.756 E.23406
N15888 G1 X192.083 Y128.29 E.01588
N15889 G1 X185.993 Y122.2 E.25652
N15890 G1 X185.46 Y122.2 E.01588
N15891 G1 X192.083 Y128.823 E.27898
N15892 G1 X192.083 Y129.356 E.01588
N15893 G1 X184.927 Y122.2 E.30145
N15894 G1 X184.393 Y122.2 E.01588
N15895 G1 X192.083 Y129.889 E.32391
N15896 G1 X192.083 Y130.423 E.01588
N15897 G1 X183.86 Y122.2 E.34637
N15898 G1 X183.327 Y122.2 E.01588
N15899 G1 X192.083 Y130.956 E.36884
N15900 G1 X192.083 Y131.489 E.01588
N15901 G1 X182.794 Y122.2 E.3913
N15902 G1 X182.26 Y122.2 E.01588
N15903 G1 X192.083 Y132.022 E.41376
N15904 G1 X192.083 Y132.556 E.01588
N15905 G1 X181.727 Y122.2 E.43622
N15906 G1 X181.194 Y122.2 E.01588
N15907 G1 X192.083 Y133.089 E.45869
N15908 G1 X192.083 Y133.622 E.01588
N15909 G1 X180.661 Y122.2 E.48115
N15910 G1 X180.127 Y122.2 E.01588
N15911 G1 X192.083 Y134.155 E.50361
N15912 G1 X192.083 Y134.689 E.01588
N15913 G1 X179.594 Y122.2 E.52608
N15914 G1 X179.061 Y122.2 E.01588
N15915 G1 X192.083 Y135.222 E.54854
N15916 G1 X192.083 Y135.755 E.01588
N15917 G1 X178.527 Y122.2 E.571
N15918 G1 X177.994 Y122.2 E.01588
N15919 G1 X192.083 Y136.288 E.59347
N15920 G1 X192.083 Y136.822 E.01588
N15921 G1 X177.461 Y122.2 E.61593
N15922 G1 X176.928 Y122.2 E.01588
N15923 G1 X192.083 Y137.355 E.63839
N15924 G1 X192.083 Y137.888 E.01588
N15925 G1 X176.394 Y122.2 E.66086
N15926 G1 X175.861 Y122.2 E.01588
N15927 G1 X192.083 Y138.422 E.68332
N15928 G1 X192.083 Y138.955 E.01588
N15929 G1 X175.328 Y122.2 E.70578
N15930 G1 X174.795 Y122.2 E.01588
N15931 G1 X192.083 Y139.488 E.72825
N15932 G1 X192.083 Y140.021 E.01588
N15933 G1 X174.261 Y122.2 E.75071
N15934 G1 X173.728 Y122.2 E.01588
N15935 G1 X192.083 Y140.555 E.77317
N15936 G1 X192.083 Y141.088 E.01588
N15937 G1 X173.195 Y122.2 E.79564
N15938 G1 X172.662 Y122.2 E.01588
N15939 G1 X192.083 Y141.621 E.8181
N15940 G1 X192.083 Y142.154 E.01588
N15941 G1 X172.128 Y122.2 E.84056
N15942 G1 X171.595 Y122.2 E.01588
N15943 G1 X192.083 Y142.688 E.86303
N15944 G1 X192.083 Y143.221 E.01588
N15945 G1 X171.062 Y122.2 E.88549
N15946 G1 X170.529 Y122.2 E.01588
N15947 G1 X192.083 Y143.754 E.90795
N15948 G1 X192.083 Y144.287 E.01588
N15949 G1 X169.995 Y122.2 E.93042
N15950 G1 X169.462 Y122.2 E.01588
N15951 G1 X192.083 Y144.821 E.95288
N15952 G1 X192.083 Y145.354 E.01588
N15953 G1 X168.929 Y122.2 E.97534
N15954 G1 X168.396 Y122.2 E.01588
N15955 G1 X192.083 Y145.887 E.99781
N15956 G1 X192.083 Y146.42 E.01588
N15957 G1 X167.862 Y122.2 E1.02027
N15958 G1 X167.329 Y122.2 E.01588
N15959 G1 X192.083 Y146.954 E1.04273
N15960 G1 X192.083 Y147.487 E.01588
N15961 G1 X166.796 Y122.2 E1.0652
N15962 G1 X166.263 Y122.2 E.01588
N15963 G1 X192.083 Y148.02 E1.08766
N15964 G1 X192.083 Y148.553 E.01588
N15965 G1 X165.729 Y122.2 E1.11012
N15966 G1 X165.196 Y122.2 E.01588
N15967 G1 X192.083 Y149.087 E1.13259
N15968 G1 X192.083 Y149.62 E.01588
N15969 G1 X164.663 Y122.2 E1.15505
N15970 G1 X164.13 Y122.2 E.01588
N15971 G1 X192.083 Y150.153 E1.17751
N15972 G1 X192.083 Y150.686 E.01588
N15973 G1 X163.596 Y122.2 E1.19998
N15974 G1 X163.063 Y122.2 E.01588
N15975 G1 X192.083 Y151.22 E1.22244
N15976 G1 X192.083 Y151.753 E.01588
N15977 M73 P97 R1
N15978 G1 X162.53 Y122.2 E1.2449
N15979 G1 X161.997 Y122.2 E.01588
N15980 G1 X192.083 Y152.286 E1.26737
N15981 G1 X192.083 Y152.819 E.01588
N15982 G1 X161.463 Y122.2 E1.28983
N15983 G1 X160.93 Y122.2 E.01588
N15984 G1 X192.083 Y153.353 E1.31229
N15985 G1 X192.083 Y153.886 E.01588
N15986 G1 X160.397 Y122.2 E1.33476
N15987 G1 X159.863 Y122.2 E.01588
N15988 G1 X192.083 Y154.419 E1.35722
N15989 G1 X192.083 Y154.952 E.01588
N15990 G1 X159.33 Y122.2 E1.37968
N15991 G1 X158.797 Y122.2 E.01588
N15992 G1 X192.083 Y155.486 E1.40214
N15993 G1 X192.083 Y156.019 E.01588
N15994 G1 X158.264 Y122.2 E1.42461
N15995 G1 X157.917 Y122.387 E.01172
N15996 G1 X192.083 Y156.552 E1.4392
N15997 G1 X192.083 Y157.086 E.01588
N15998 G1 X157.917 Y122.92 E1.4392
N15999 G1 X157.917 Y123.454 E.01588
N16000 G1 X192.083 Y157.619 E1.4392
N16001 G1 X192.083 Y158.152 E.01588
N16002 G1 X157.917 Y123.987 E1.4392
N16003 G1 X157.917 Y124.52 E.01588
N16004 G1 X192.083 Y158.685 E1.4392
N16005 G1 X192.083 Y159.219 E.01588
N16006 G1 X157.917 Y125.053 E1.4392
N16007 G1 X157.917 Y125.587 E.01588
N16008 G1 X192.083 Y159.752 E1.4392
N16009 G1 X192.083 Y160.285 E.01588
N16010 G1 X157.917 Y126.12 E1.4392
N16011 G1 X157.917 Y126.653 E.01588
N16012 G1 X192.083 Y160.818 E1.4392
N16013 G1 X192.083 Y161.352 E.01588
N16014 G1 X157.917 Y127.186 E1.4392
N16015 G1 X157.917 Y127.72 E.01588
N16016 G1 X192.083 Y161.885 E1.4392
N16017 G1 X192.083 Y162.418 E.01588
N16018 M73 P97 R0
N16019 G1 X157.917 Y128.253 E1.4392
N16020 G1 X157.917 Y128.786 E.01588
N16021 G1 X192.083 Y162.951 E1.4392
N16022 G1 X192.083 Y163.485 E.01588
N16023 G1 X157.917 Y129.319 E1.4392
N16024 G1 X157.917 Y129.853 E.01588
N16025 G1 X192.083 Y164.018 E1.4392
N16026 G1 X192.083 Y164.551 E.01588
N16027 G1 X157.917 Y130.386 E1.4392
N16028 G1 X157.917 Y130.919 E.01588
N16029 G1 X192.083 Y165.084 E1.4392
N16030 G1 X192.083 Y165.618 E.01588
N16031 G1 X157.917 Y131.452 E1.4392
N16032 G1 X157.917 Y131.986 E.01588
N16033 G1 X192.083 Y166.151 E1.4392
N16034 G1 X192.083 Y166.684 E.01588
N16035 G1 X157.917 Y132.519 E1.4392
N16036 G1 X157.917 Y133.052 E.01588
N16037 G1 X192.083 Y167.217 E1.4392
N16038 G1 X192.083 Y167.751 E.01588
N16039 G1 X157.917 Y133.585 E1.4392
N16040 G1 X157.917 Y134.119 E.01588
N16041 G1 X192.083 Y168.284 E1.4392
N16042 G1 X192.083 Y168.817 E.01588
N16043 G1 X157.917 Y134.652 E1.4392
N16044 G1 X157.917 Y135.185 E.01588
N16045 G1 X192.083 Y169.35 E1.4392
N16046 G1 X192.083 Y169.884 E.01588
N16047 G1 X157.917 Y135.718 E1.4392
N16048 G1 X157.917 Y136.252 E.01588
N16049 G1 X192.083 Y170.417 E1.4392
N16050 G1 X192.083 Y170.95 E.01588
N16051 G1 X157.917 Y136.785 E1.4392
N16052 G1 X157.917 Y137.318 E.01588
N16053 G1 X192.083 Y171.483 E1.4392
N16054 G1 X192.083 Y172.017 E.01588
N16055 G1 X157.917 Y137.851 E1.4392
N16056 G1 X157.917 Y138.385 E.01588
N16057 G1 X192.083 Y172.55 E1.4392
N16058 G1 X192.083 Y173.083 E.01588
N16059 G1 X157.917 Y138.918 E1.4392
N16060 G1 X157.917 Y139.451 E.01588
N16061 G1 X192.083 Y173.617 E1.4392
N16062 G1 X192.083 Y174.15 E.01588
N16063 G1 X157.917 Y139.985 E1.4392
N16064 G1 X157.917 Y140.518 E.01588
N16065 G1 X192.083 Y174.683 E1.4392
N16066 G1 X192.083 Y175.216 E.01588
N16067 G1 X157.917 Y141.051 E1.4392
N16068 G1 X157.917 Y141.584 E.01588
N16069 G1 X192.083 Y175.75 E1.4392
N16070 G1 X192.083 Y176.283 E.01588
N16071 G1 X157.917 Y142.118 E1.4392
N16072 G1 X157.917 Y142.651 E.01588
N16073 G1 X192.083 Y176.816 E1.4392
N16074 G1 X192.083 Y177.349 E.01588
N16075 G1 X157.917 Y143.184 E1.4392
N16076 G1 X157.917 Y143.717 E.01588
N16077 G1 X192.083 Y177.883 E1.4392
N16078 G1 X192.083 Y178.416 E.01588
N16079 G1 X157.917 Y144.251 E1.4392
N16080 G1 X157.917 Y144.784 E.01588
N16081 G1 X192.083 Y178.949 E1.4392
N16082 G1 X192.083 Y179.482 E.01588
N16083 G1 X157.917 Y145.317 E1.4392
N16084 G1 X157.917 Y145.85 E.01588
N16085 G1 X192.083 Y180.016 E1.4392
N16086 G1 X192.083 Y180.549 E.01588
N16087 G1 X157.917 Y146.384 E1.4392
N16088 G1 X157.917 Y146.917 E.01588
N16089 G1 X192.083 Y181.082 E1.4392
N16090 G1 X192.083 Y181.615 E.01588
N16091 M73 P98 R0
N16092 G1 X157.917 Y147.45 E1.4392
N16093 G1 X157.917 Y147.983 E.01588
N16094 G1 X192.083 Y182.149 E1.4392
N16095 G1 X192.083 Y182.682 E.01588
N16096 G1 X157.917 Y148.517 E1.4392
N16097 G1 X157.917 Y149.05 E.01588
N16098 G1 X192.083 Y183.215 E1.4392
N16099 G1 X192.083 Y183.748 E.01588
N16100 G1 X157.917 Y149.583 E1.4392
N16101 G1 X157.917 Y150.116 E.01588
N16102 G1 X192.083 Y184.282 E1.4392
N16103 G1 X192.083 Y184.815 E.01588
N16104 G1 X157.917 Y150.65 E1.4392
N16105 G1 X157.917 Y151.183 E.01588
N16106 G1 X192.083 Y185.348 E1.4392
N16107 G1 X192.083 Y185.881 E.01588
N16108 G1 X157.917 Y151.716 E1.4392
N16109 G1 X157.917 Y152.249 E.01588
N16110 G1 X192.083 Y186.415 E1.4392
N16111 G1 X192.083 Y186.948 E.01588
N16112 G1 X157.917 Y152.783 E1.4392
N16113 G1 X157.917 Y153.316 E.01588
N16114 G1 X192.083 Y187.481 E1.4392
N16115 G1 X192.083 Y188.014 E.01588
N16116 G1 X157.917 Y153.849 E1.4392
N16117 G1 X157.917 Y154.382 E.01588
N16118 G1 X192.083 Y188.548 E1.4392
N16119 G1 X192.083 Y189.081 E.01588
N16120 G1 X157.917 Y154.916 E1.4392
N16121 G1 X157.917 Y155.449 E.01588
N16122 G1 X192.083 Y189.614 E1.4392
N16123 G1 X192.083 Y190.147 E.01588
N16124 G1 X157.917 Y155.982 E1.4392
N16125 G1 X157.917 Y156.515 E.01588
N16126 G1 X192.083 Y190.681 E1.4392
N16127 G1 X192.083 Y191.214 E.01588
N16128 G1 X157.917 Y157.049 E1.4392
N16129 G1 X157.917 Y157.582 E.01588
N16130 G1 X192.083 Y191.747 E1.4392
N16131 G1 X192.083 Y192.281 E.01588
N16132 G1 X157.917 Y158.115 E1.4392
N16133 G1 X157.917 Y158.649 E.01588
N16134 G1 X192.083 Y192.814 E1.4392
N16135 G1 X192.083 Y193.347 E.01588
N16136 G1 X157.917 Y159.182 E1.4392
N16137 G1 X157.917 Y159.715 E.01588
N16138 G1 X192.083 Y193.88 E1.4392
N16139 G1 X192.083 Y194.414 E.01588
N16140 G1 X157.917 Y160.248 E1.4392
N16141 G1 X157.917 Y160.782 E.01588
N16142 G1 X192.083 Y194.947 E1.4392
N16143 G1 X192.083 Y195.48 E.01588
N16144 G1 X157.917 Y161.315 E1.4392
N16145 G1 X157.917 Y161.848 E.01588
N16146 G1 X192.083 Y196.013 E1.4392
N16147 G1 X192.083 Y196.547 E.01588
N16148 G1 X157.917 Y162.381 E1.4392
N16149 G1 X157.917 Y162.915 E.01588
N16150 G1 X192.083 Y197.08 E1.4392
N16151 G1 X192.083 Y197.613 E.01588
N16152 G1 X157.917 Y163.448 E1.4392
N16153 G1 X157.917 Y163.981 E.01588
N16154 G1 X191.736 Y197.8 E1.4246
N16155 G1 X191.203 Y197.8 E.01588
N16156 G1 X157.917 Y164.514 E1.40214
N16157 G1 X157.917 Y165.048 E.01588
N16158 G1 X190.67 Y197.8 E1.37968
N16159 G1 X190.136 Y197.8 E.01588
N16160 G1 X157.917 Y165.581 E1.35721
N16161 G1 X157.917 Y166.114 E.01588
N16162 G1 X189.603 Y197.8 E1.33475
N16163 G1 X189.07 Y197.8 E.01588
N16164 G1 X157.917 Y166.647 E1.31229
N16165 G1 X157.917 Y167.181 E.01588
N16166 G1 X188.537 Y197.8 E1.28982
N16167 G1 X188.003 Y197.8 E.01588
N16168 G1 X157.917 Y167.714 E1.26736
N16169 G1 X157.917 Y168.247 E.01588
N16170 G1 X187.47 Y197.8 E1.2449
N16171 G1 X186.937 Y197.8 E.01588
N16172 G1 X157.917 Y168.78 E1.22243
N16173 G1 X157.917 Y169.314 E.01588
N16174 G1 X186.404 Y197.8 E1.19997
N16175 G1 X185.87 Y197.8 E.01588
N16176 G1 X157.917 Y169.847 E1.17751
N16177 G1 X157.917 Y170.38 E.01588
N16178 M73 P99 R0
N16179 G1 X185.337 Y197.8 E1.15504
N16180 G1 X184.804 Y197.8 E.01588
N16181 G1 X157.917 Y170.913 E1.13258
N16182 G1 X157.917 Y171.447 E.01588
N16183 G1 X184.271 Y197.8 E1.11012
N16184 G1 X183.737 Y197.8 E.01588
N16185 G1 X157.917 Y171.98 E1.08765
N16186 G1 X157.917 Y172.513 E.01588
N16187 G1 X183.204 Y197.8 E1.06519
N16188 G1 X182.671 Y197.8 E.01588
N16189 G1 X157.917 Y173.046 E1.04273
N16190 G1 X157.917 Y173.58 E.01588
N16191 G1 X182.138 Y197.8 E1.02026
N16192 G1 X181.604 Y197.8 E.01588
N16193 G1 X157.917 Y174.113 E.9978
N16194 G1 X157.917 Y174.646 E.01588
N16195 G1 X181.071 Y197.8 E.97534
N16196 G1 X180.538 Y197.8 E.01588
N16197 G1 X157.917 Y175.179 E.95287
N16198 G1 X157.917 Y175.713 E.01588
N16199 G1 X180.005 Y197.8 E.93041
N16200 G1 X179.471 Y197.8 E.01588
N16201 G1 X157.917 Y176.246 E.90795
N16202 G1 X157.917 Y176.779 E.01588
N16203 G1 X178.938 Y197.8 E.88548
N16204 G1 X178.405 Y197.8 E.01588
N16205 G1 X157.917 Y177.313 E.86302
N16206 G1 X157.917 Y177.846 E.01588
N16207 G1 X177.871 Y197.8 E.84056
N16208 G1 X177.338 Y197.8 E.01588
N16209 G1 X157.917 Y178.379 E.81809
N16210 G1 X157.917 Y178.912 E.01588
N16211 G1 X176.805 Y197.8 E.79563
N16212 G1 X176.272 Y197.8 E.01588
N16213 G1 X157.917 Y179.446 E.77317
N16214 G1 X157.917 Y179.979 E.01588
N16215 G1 X175.738 Y197.8 E.75071
N16216 G1 X175.205 Y197.8 E.01588
N16217 G1 X157.917 Y180.512 E.72824
N16218 G1 X157.917 Y181.045 E.01588
N16219 G1 X174.672 Y197.8 E.70578
N16220 G1 X174.139 Y197.8 E.01588
N16221 G1 X157.917 Y181.579 E.68332
N16222 G1 X157.917 Y182.112 E.01588
N16223 G1 X173.605 Y197.8 E.66085
N16224 G1 X173.072 Y197.8 E.01588
N16225 G1 X157.917 Y182.645 E.63839
N16226 G1 X157.917 Y183.178 E.01588
N16227 G1 X172.539 Y197.8 E.61593
N16228 G1 X172.006 Y197.8 E.01588
N16229 G1 X157.917 Y183.712 E.59346
N16230 G1 X157.917 Y184.245 E.01588
N16231 G1 X171.472 Y197.8 E.571
N16232 G1 X170.939 Y197.8 E.01588
N16233 G1 X157.917 Y184.778 E.54854
N16234 G1 X157.917 Y185.311 E.01588
N16235 G1 X170.406 Y197.8 E.52607
N16236 G1 X169.873 Y197.8 E.01588
N16237 G1 X157.917 Y185.845 E.50361
N16238 G1 X157.917 Y186.378 E.01588
N16239 G1 X169.339 Y197.8 E.48115
N16240 G1 X168.806 Y197.8 E.01588
N16241 G1 X157.917 Y186.911 E.45868
N16242 G1 X157.917 Y187.444 E.01588
N16243 G1 X168.273 Y197.8 E.43622
N16244 G1 X167.74 Y197.8 E.01588
N16245 G1 X157.917 Y187.978 E.41376
N16246 G1 X157.917 Y188.511 E.01588
N16247 G1 X167.206 Y197.8 E.39129
N16248 G1 X166.673 Y197.8 E.01588
N16249 G1 X157.917 Y189.044 E.36883
N16250 G1 X157.917 Y189.577 E.01588
N16251 G1 X166.14 Y197.8 E.34637
N16252 G1 X165.607 Y197.8 E.01588
N16253 G1 X157.917 Y190.111 E.3239
N16254 G1 X157.917 Y190.644 E.01588
N16255 G1 X165.073 Y197.8 E.30144
N16256 G1 X164.54 Y197.8 E.01588
N16257 G1 X157.917 Y191.177 E.27898
N16258 G1 X157.917 Y191.71 E.01588
N16259 G1 X164.007 Y197.8 E.25651
N16260 G1 X163.474 Y197.8 E.01588
N16261 G1 X157.917 Y192.244 E.23405
N16262 G1 X157.917 Y192.777 E.01588
N16263 G1 X162.94 Y197.8 E.21159
N16264 G1 X162.407 Y197.8 E.01588
N16265 G1 X157.917 Y193.31 E.18912
N16266 G1 X157.917 Y193.844 E.01588
N16267 G1 X161.874 Y197.8 E.16666
N16268 G1 X161.34 Y197.8 E.01588
N16269 G1 X157.917 Y194.377 E.1442
N16270 G1 X157.917 Y194.91 E.01588
N16271 G1 X160.807 Y197.8 E.12173
N16272 G1 X160.274 Y197.8 E.01588
N16273 G1 X157.917 Y195.443 E.09927
N16274 G1 X157.917 Y195.977 E.01588
N16275 G1 X159.741 Y197.8 E.07681
N16276 G1 X159.207 Y197.8 E.01588
N16277 G1 X157.917 Y196.51 E.05434
N16278 G1 X157.917 Y197.043 E.01588
N16279 G1 X158.674 Y197.8 E.03188
N16280 G1 E-.8 F1800
N16281 M204 S10000
N16282 G1 X166.307 Y197.795 Z13 F60000
N16283 G1 X192.101 Y197.776 Z13
N16284 G1 Z12.6
N16285 G1 E.8 F1800
N16286 ; FEATURE: Gap infill
N16287 ; LINE_WIDTH: 0.127568
N16288 G1 F15000
N16289 M204 S8000
N16290 G1 X191.76 Y197.776 E.00229
N16291 ; WIPE_START
N16292 G1 X192.101 Y197.776 E-.76
N16293 ; WIPE_END
N16294 G1 E-.04 F1800
N16295 M204 S10000
N16296 G17
N16297 G3 Z13 I1.217 J0 P1  F60000
N16298 ; stop printing object, unique label id: 130
N16299 M625
N16300 ; object ids of layer 63 start: 130
N16301 M624 AQAAAAAAAAA=
N16302 ;======== H2D 20250527========
N16303 ; SKIPPABLE_START
N16304 ; SKIPTYPE: timelapse
N16305 M622.1 S1 ; for prev firware, default turned on
N16306 
N16307 M1002 judge_flag timelapse_record_flag
N16308 
N16309 M622 J1
N16310 M993 A2 B2 C2
N16311 M993 A0 B0 C0
N16312 
N16313 
N16314 
N16315 
N16316     M9711 M0 E1 X260 Y137 Z13 S11 C10 O0 T3000
N16317 
N16318 
N16319 
N16320 M993 A3 B3 C3
N16321 
N16322 M623
N16323 ; SKIPPABLE_END
N16324 
N16325 ; object ids of this layer63 end: 130
N16326 M625
N16327 ; close powerlost recovery
N16328 M1003 S0
N16329 M106 S0
N16330 M106 P2 S0
N16331 M981 S0 P20000 ; close spaghetti detector
N16332 ; FEATURE: Custom
N16333 ; MACHINE_END_GCODE_START
N16334 ; filament end gcode 
N16335 ;===== date: 2025/05/16 =====================
N16336 ;===== H2D =====================
N16337 G392 S0 ;turn off nozzle clog detect
N16338 M993 A0 B0 C0 ; nozzle cam detection not allowed.
N16339 
N16340 M400 ; wait for buffer to clear
N16341 G92 E0 ; zero the extruder
N16342 G1 E-0.8 F1800 ; retract
N16343 G1 Z13.1 F900 ; lower z a little
N16344 
N16345 G90
N16346 M141 S0 ; turn off chamber heating
N16347 M140 S0 ; turn off bed
N16348 M106 S0 ; turn off fan
N16349 M106 P2 S0 ; turn off remote part cooling fan
N16350 M106 P3 S0 ; turn off chamber cooling fan
N16351 
N16352 ; pull back filament to AMS
N16353 M620 S65535
N16354 T65535
N16355 G150.2
N16356 M621 S65535
N16357 
N16358 M620 S65279
N16359 T65279
N16360 G150.2
N16361 M621 S65279
N16362 
N16363 G150.3
N16364 
N16365 M1002 judge_flag timelapse_record_flag
N16366 M622 J1
N16367     M400 ; wait all motion done
N16368     M991 S0 P-1 ;end smooth timelapse at safe pos
N16369     M400 S5 ;wait for last picture to be taken
N16370 M623  ;end of "timelapse_record_flag"
N16371 
N16372 M104 S0 T0; turn off hotend
N16373 M104 S0 T1; turn off hotend
N16374 
N16375 M400 ; wait all motion done
N16376 M17 S
N16377 M17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom
N16378 
N16379     G1 Z112.6 F600
N16380     G1 Z110.6
N16381 
N16382 M400 P100
N16383 M17 R ; restore z current
N16384 
N16385 M220 S100  ; Reset feedrate magnitude
N16386 M201.2 K1.0 ; Reset acc magnitude
N16387 M73.2   R1.0 ;Reset left time magnitude
N16388 M1002 set_gcode_claim_speed_level : 0
N16389 
N16390 M1015.4 S0 K0 ;disable air printing detect
N16391 ;=====printer finish  sound=========
N16392 M17
N16393 M400 S1
N16394 M1006 S1
N16395 M1006 A53 B10 L99 C53 D10 M99 E53 F10 N99 
N16396 M1006 A57 B10 L99 C57 D10 M99 E57 F10 N99 
N16397 M1006 A0 B15 L0 C0 D15 M0 E0 F15 N0 
N16398 M1006 A53 B10 L99 C53 D10 M99 E53 F10 N99 
N16399 M1006 A57 B10 L99 C57 D10 M99 E57 F10 N99 
N16400 M1006 A0 B15 L0 C0 D15 M0 E0 F15 N0 
N16401 M1006 A48 B10 L99 C48 D10 M99 E48 F10 N99 
N16402 M1006 A0 B15 L0 C0 D15 M0 E0 F15 N0 
N16403 M1006 A60 B10 L99 C60 D10 M99 E60 F10 N99 
N16404 M1006 W
N16405 ;=====printer finish  sound=========
N16406 M400
N16407 M18
N16408 
N16409 M73 P100 R0
N16410 ; EXECUTABLE_BLOCK_END
N16411 
