onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group LEDs -label {Clock light} {/DE1_SoC_testbench/LEDR[9]}
add wave -noupdate -expand -group LEDs -label {Right LED} {/DE1_SoC_testbench/LEDR[0]}
add wave -noupdate -expand -group LEDs -label {Middle LED} {/DE1_SoC_testbench/LEDR[1]}
add wave -noupdate -expand -group LEDs -label {Left LED} {/DE1_SoC_testbench/LEDR[2]}
add wave -noupdate -expand -group Reset {/DE1_SoC_testbench/KEY[0]}
add wave -noupdate -expand -group Reset -label {Reset LED Signal} {/DE1_SoC_testbench/LEDR[8]}
add wave -noupdate -expand -group Switches {/DE1_SoC_testbench/SW[0]}
add wave -noupdate -expand -group Switches {/DE1_SoC_testbench/SW[1]}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {250 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {975 ps} {1475 ps}
