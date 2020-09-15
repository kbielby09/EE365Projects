onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench/clk
add wave -noupdate /testbench/reset_N
add wave -noupdate /testbench/sensorA_N
add wave -noupdate /testbench/sensorB_N
add wave -noupdate /testbench/output
add wave -noupdate /testbench/DUT/I_CLK_50MHZ
add wave -noupdate /testbench/DUT/I_RESET_N
add wave -noupdate /testbench/DUT/I_SENSOR_A_ACTIVE_N
add wave -noupdate /testbench/DUT/I_SENSOR_B_ACTIVE_N
add wave -noupdate /testbench/DUT/O_LED_COUNT
add wave -noupdate /testbench/DUT/s_current_state
add wave -noupdate /testbench/DUT/s_previous_state
add wave -noupdate /testbench/DUT/s_local_count
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {7682670 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 20000
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {7680800 ps} {8016800 ps}
