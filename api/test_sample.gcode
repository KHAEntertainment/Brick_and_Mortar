; BambuStudio 1.9.0
; Test G-code for brick & mortar processing
G28 ; home all axes
G1 Z0.2 F600
;LAYER_CHANGE
M991 S0 P1 ; notify layer change 1
G1 X10 Y10 E0.1 F1800
G1 X20 Y10 E0.2 F1800
G1 X20 Y20 E0.3 F1800
G1 Z0.4 F600
M991 S0 P2 ; notify layer change 2
G1 X10 Y20 E0.4 F1800
G1 X10 Y10 E0.5 F1800
G1 Z0.6 F600
M991 S0 P3 ; notify layer change 3
G1 X30 Y30 E0.6 F1800
G1 X40 Y30 E0.7 F1800