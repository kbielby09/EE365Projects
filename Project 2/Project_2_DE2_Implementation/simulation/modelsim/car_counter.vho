-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.0 Build 156 04/24/2013 SJ Full Version"

-- DATE "09/14/2020 20:15:45"

-- 
-- Device: Altera EP4CGX15BF14C6 Package FBGA169
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIV.CYCLONEIV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	car_counter IS
    PORT (
	I_CLK_50MHZ : IN std_logic;
	I_RESET_N : IN std_logic;
	I_SENSOR_A_ACTIVE_N : IN std_logic;
	I_SENSOR_B_ACTIVE_N : IN std_logic;
	O_LED_COUNT : OUT std_logic_vector(7 DOWNTO 0)
	);
END car_counter;

-- Design Ports Information
-- O_LED_COUNT[0]	=>  Location: PIN_H10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- O_LED_COUNT[1]	=>  Location: PIN_L12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- O_LED_COUNT[2]	=>  Location: PIN_G9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- O_LED_COUNT[3]	=>  Location: PIN_F10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- O_LED_COUNT[4]	=>  Location: PIN_K13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- O_LED_COUNT[5]	=>  Location: PIN_H12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- O_LED_COUNT[6]	=>  Location: PIN_L13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- O_LED_COUNT[7]	=>  Location: PIN_G10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- I_CLK_50MHZ	=>  Location: PIN_J7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- I_RESET_N	=>  Location: PIN_J6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- I_SENSOR_B_ACTIVE_N	=>  Location: PIN_J13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- I_SENSOR_A_ACTIVE_N	=>  Location: PIN_G13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF car_counter IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_I_CLK_50MHZ : std_logic;
SIGNAL ww_I_RESET_N : std_logic;
SIGNAL ww_I_SENSOR_A_ACTIVE_N : std_logic;
SIGNAL ww_I_SENSOR_B_ACTIVE_N : std_logic;
SIGNAL ww_O_LED_COUNT : std_logic_vector(7 DOWNTO 0);
SIGNAL \I_RESET_N~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \I_CLK_50MHZ~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \s_local_count[0]~14_combout\ : std_logic;
SIGNAL \O_LED_COUNT[0]~output_o\ : std_logic;
SIGNAL \O_LED_COUNT[1]~output_o\ : std_logic;
SIGNAL \O_LED_COUNT[2]~output_o\ : std_logic;
SIGNAL \O_LED_COUNT[3]~output_o\ : std_logic;
SIGNAL \O_LED_COUNT[4]~output_o\ : std_logic;
SIGNAL \O_LED_COUNT[5]~output_o\ : std_logic;
SIGNAL \O_LED_COUNT[6]~output_o\ : std_logic;
SIGNAL \O_LED_COUNT[7]~output_o\ : std_logic;
SIGNAL \I_CLK_50MHZ~input_o\ : std_logic;
SIGNAL \I_CLK_50MHZ~inputclkctrl_outclk\ : std_logic;
SIGNAL \s_local_count[0]~10_combout\ : std_logic;
SIGNAL \I_RESET_N~input_o\ : std_logic;
SIGNAL \I_RESET_N~inputclkctrl_outclk\ : std_logic;
SIGNAL \I_SENSOR_B_ACTIVE_N~input_o\ : std_logic;
SIGNAL \I_SENSOR_A_ACTIVE_N~input_o\ : std_logic;
SIGNAL \SENSOR_STATE_MACHINE~0_combout\ : std_logic;
SIGNAL \s_current_state.A_ACTIVE_STATE~q\ : std_logic;
SIGNAL \s_previous_state.A_ACTIVE_STATE~q\ : std_logic;
SIGNAL \s_current_state~8_combout\ : std_logic;
SIGNAL \s_current_state.BOTH_INACTIVE_STATE~q\ : std_logic;
SIGNAL \s_local_count[0]~13_combout\ : std_logic;
SIGNAL \s_local_count[0]~11\ : std_logic;
SIGNAL \s_local_count[1]~17_combout\ : std_logic;
SIGNAL \s_local_count[1]~18\ : std_logic;
SIGNAL \s_local_count[2]~19_combout\ : std_logic;
SIGNAL \s_local_count[2]~20\ : std_logic;
SIGNAL \s_local_count[3]~21_combout\ : std_logic;
SIGNAL \s_local_count[3]~22\ : std_logic;
SIGNAL \s_local_count[4]~23_combout\ : std_logic;
SIGNAL \s_local_count[4]~24\ : std_logic;
SIGNAL \s_local_count[5]~25_combout\ : std_logic;
SIGNAL \s_local_count[5]~26\ : std_logic;
SIGNAL \s_local_count[6]~27_combout\ : std_logic;
SIGNAL \s_local_count[0]~15_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \s_previous_state.BOTH_INACTIVE_STATE~q\ : std_logic;
SIGNAL \s_local_count[6]~28\ : std_logic;
SIGNAL \s_local_count[7]~29_combout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \s_local_count[0]~12_combout\ : std_logic;
SIGNAL \s_local_count[0]~16_combout\ : std_logic;
SIGNAL s_local_count : std_logic_vector(7 DOWNTO 0);

BEGIN

ww_I_CLK_50MHZ <= I_CLK_50MHZ;
ww_I_RESET_N <= I_RESET_N;
ww_I_SENSOR_A_ACTIVE_N <= I_SENSOR_A_ACTIVE_N;
ww_I_SENSOR_B_ACTIVE_N <= I_SENSOR_B_ACTIVE_N;
O_LED_COUNT <= ww_O_LED_COUNT;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\I_RESET_N~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \I_RESET_N~input_o\);

\I_CLK_50MHZ~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \I_CLK_50MHZ~input_o\);

-- Location: LCCOMB_X32_Y16_N30
\s_local_count[0]~14\ : cycloneiv_lcell_comb
-- Equation(s):
-- \s_local_count[0]~14_combout\ = (!s_local_count(0) & (!s_local_count(3) & (!s_local_count(1) & !s_local_count(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_local_count(0),
	datab => s_local_count(3),
	datac => s_local_count(1),
	datad => s_local_count(2),
	combout => \s_local_count[0]~14_combout\);

-- Location: IOOBUF_X33_Y14_N2
\O_LED_COUNT[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => s_local_count(0),
	devoe => ww_devoe,
	o => \O_LED_COUNT[0]~output_o\);

-- Location: IOOBUF_X33_Y12_N2
\O_LED_COUNT[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => s_local_count(1),
	devoe => ww_devoe,
	o => \O_LED_COUNT[1]~output_o\);

-- Location: IOOBUF_X33_Y22_N2
\O_LED_COUNT[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => s_local_count(2),
	devoe => ww_devoe,
	o => \O_LED_COUNT[2]~output_o\);

-- Location: IOOBUF_X33_Y24_N2
\O_LED_COUNT[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => s_local_count(3),
	devoe => ww_devoe,
	o => \O_LED_COUNT[3]~output_o\);

-- Location: IOOBUF_X33_Y15_N2
\O_LED_COUNT[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => s_local_count(4),
	devoe => ww_devoe,
	o => \O_LED_COUNT[4]~output_o\);

-- Location: IOOBUF_X33_Y14_N9
\O_LED_COUNT[5]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => s_local_count(5),
	devoe => ww_devoe,
	o => \O_LED_COUNT[5]~output_o\);

-- Location: IOOBUF_X33_Y12_N9
\O_LED_COUNT[6]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => s_local_count(6),
	devoe => ww_devoe,
	o => \O_LED_COUNT[6]~output_o\);

-- Location: IOOBUF_X33_Y22_N9
\O_LED_COUNT[7]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => s_local_count(7),
	devoe => ww_devoe,
	o => \O_LED_COUNT[7]~output_o\);

-- Location: IOIBUF_X16_Y0_N15
\I_CLK_50MHZ~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_I_CLK_50MHZ,
	o => \I_CLK_50MHZ~input_o\);

-- Location: CLKCTRL_G17
\I_CLK_50MHZ~inputclkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \I_CLK_50MHZ~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \I_CLK_50MHZ~inputclkctrl_outclk\);

-- Location: LCCOMB_X32_Y16_N12
\s_local_count[0]~10\ : cycloneiv_lcell_comb
-- Equation(s):
-- \s_local_count[0]~10_combout\ = s_local_count(0) $ (VCC)
-- \s_local_count[0]~11\ = CARRY(s_local_count(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_local_count(0),
	datad => VCC,
	combout => \s_local_count[0]~10_combout\,
	cout => \s_local_count[0]~11\);

-- Location: IOIBUF_X16_Y0_N22
\I_RESET_N~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_I_RESET_N,
	o => \I_RESET_N~input_o\);

-- Location: CLKCTRL_G19
\I_RESET_N~inputclkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \I_RESET_N~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \I_RESET_N~inputclkctrl_outclk\);

-- Location: IOIBUF_X33_Y15_N8
\I_SENSOR_B_ACTIVE_N~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_I_SENSOR_B_ACTIVE_N,
	o => \I_SENSOR_B_ACTIVE_N~input_o\);

-- Location: IOIBUF_X33_Y16_N22
\I_SENSOR_A_ACTIVE_N~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_I_SENSOR_A_ACTIVE_N,
	o => \I_SENSOR_A_ACTIVE_N~input_o\);

-- Location: LCCOMB_X31_Y16_N12
\SENSOR_STATE_MACHINE~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \SENSOR_STATE_MACHINE~0_combout\ = (\I_SENSOR_B_ACTIVE_N~input_o\ & !\I_SENSOR_A_ACTIVE_N~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \I_SENSOR_B_ACTIVE_N~input_o\,
	datad => \I_SENSOR_A_ACTIVE_N~input_o\,
	combout => \SENSOR_STATE_MACHINE~0_combout\);

-- Location: FF_X31_Y16_N13
\s_current_state.A_ACTIVE_STATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I_CLK_50MHZ~inputclkctrl_outclk\,
	d => \SENSOR_STATE_MACHINE~0_combout\,
	clrn => \I_RESET_N~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \s_current_state.A_ACTIVE_STATE~q\);

-- Location: FF_X32_Y16_N9
\s_previous_state.A_ACTIVE_STATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I_CLK_50MHZ~inputclkctrl_outclk\,
	asdata => \s_current_state.A_ACTIVE_STATE~q\,
	clrn => \I_RESET_N~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \s_previous_state.A_ACTIVE_STATE~q\);

-- Location: LCCOMB_X32_Y16_N6
\s_current_state~8\ : cycloneiv_lcell_comb
-- Equation(s):
-- \s_current_state~8_combout\ = (!\I_SENSOR_A_ACTIVE_N~input_o\) # (!\I_SENSOR_B_ACTIVE_N~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \I_SENSOR_B_ACTIVE_N~input_o\,
	datad => \I_SENSOR_A_ACTIVE_N~input_o\,
	combout => \s_current_state~8_combout\);

-- Location: FF_X32_Y16_N7
\s_current_state.BOTH_INACTIVE_STATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I_CLK_50MHZ~inputclkctrl_outclk\,
	d => \s_current_state~8_combout\,
	clrn => \I_RESET_N~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \s_current_state.BOTH_INACTIVE_STATE~q\);

-- Location: LCCOMB_X32_Y16_N8
\s_local_count[0]~13\ : cycloneiv_lcell_comb
-- Equation(s):
-- \s_local_count[0]~13_combout\ = (\s_current_state.BOTH_INACTIVE_STATE~q\) # (!\s_previous_state.A_ACTIVE_STATE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \s_previous_state.A_ACTIVE_STATE~q\,
	datad => \s_current_state.BOTH_INACTIVE_STATE~q\,
	combout => \s_local_count[0]~13_combout\);

-- Location: LCCOMB_X32_Y16_N14
\s_local_count[1]~17\ : cycloneiv_lcell_comb
-- Equation(s):
-- \s_local_count[1]~17_combout\ = (\s_current_state.BOTH_INACTIVE_STATE~q\ & ((s_local_count(1) & (!\s_local_count[0]~11\)) # (!s_local_count(1) & ((\s_local_count[0]~11\) # (GND))))) # (!\s_current_state.BOTH_INACTIVE_STATE~q\ & ((s_local_count(1) & 
-- (\s_local_count[0]~11\ & VCC)) # (!s_local_count(1) & (!\s_local_count[0]~11\))))
-- \s_local_count[1]~18\ = CARRY((\s_current_state.BOTH_INACTIVE_STATE~q\ & ((!\s_local_count[0]~11\) # (!s_local_count(1)))) # (!\s_current_state.BOTH_INACTIVE_STATE~q\ & (!s_local_count(1) & !\s_local_count[0]~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \s_current_state.BOTH_INACTIVE_STATE~q\,
	datab => s_local_count(1),
	datad => VCC,
	cin => \s_local_count[0]~11\,
	combout => \s_local_count[1]~17_combout\,
	cout => \s_local_count[1]~18\);

-- Location: FF_X32_Y16_N15
\s_local_count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I_CLK_50MHZ~inputclkctrl_outclk\,
	d => \s_local_count[1]~17_combout\,
	clrn => \I_RESET_N~inputclkctrl_outclk\,
	ena => \s_local_count[0]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_local_count(1));

-- Location: LCCOMB_X32_Y16_N16
\s_local_count[2]~19\ : cycloneiv_lcell_comb
-- Equation(s):
-- \s_local_count[2]~19_combout\ = ((\s_current_state.BOTH_INACTIVE_STATE~q\ $ (s_local_count(2) $ (\s_local_count[1]~18\)))) # (GND)
-- \s_local_count[2]~20\ = CARRY((\s_current_state.BOTH_INACTIVE_STATE~q\ & (s_local_count(2) & !\s_local_count[1]~18\)) # (!\s_current_state.BOTH_INACTIVE_STATE~q\ & ((s_local_count(2)) # (!\s_local_count[1]~18\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \s_current_state.BOTH_INACTIVE_STATE~q\,
	datab => s_local_count(2),
	datad => VCC,
	cin => \s_local_count[1]~18\,
	combout => \s_local_count[2]~19_combout\,
	cout => \s_local_count[2]~20\);

-- Location: FF_X32_Y16_N17
\s_local_count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I_CLK_50MHZ~inputclkctrl_outclk\,
	d => \s_local_count[2]~19_combout\,
	clrn => \I_RESET_N~inputclkctrl_outclk\,
	ena => \s_local_count[0]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_local_count(2));

-- Location: LCCOMB_X32_Y16_N18
\s_local_count[3]~21\ : cycloneiv_lcell_comb
-- Equation(s):
-- \s_local_count[3]~21_combout\ = (\s_current_state.BOTH_INACTIVE_STATE~q\ & ((s_local_count(3) & (!\s_local_count[2]~20\)) # (!s_local_count(3) & ((\s_local_count[2]~20\) # (GND))))) # (!\s_current_state.BOTH_INACTIVE_STATE~q\ & ((s_local_count(3) & 
-- (\s_local_count[2]~20\ & VCC)) # (!s_local_count(3) & (!\s_local_count[2]~20\))))
-- \s_local_count[3]~22\ = CARRY((\s_current_state.BOTH_INACTIVE_STATE~q\ & ((!\s_local_count[2]~20\) # (!s_local_count(3)))) # (!\s_current_state.BOTH_INACTIVE_STATE~q\ & (!s_local_count(3) & !\s_local_count[2]~20\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \s_current_state.BOTH_INACTIVE_STATE~q\,
	datab => s_local_count(3),
	datad => VCC,
	cin => \s_local_count[2]~20\,
	combout => \s_local_count[3]~21_combout\,
	cout => \s_local_count[3]~22\);

-- Location: FF_X32_Y16_N19
\s_local_count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I_CLK_50MHZ~inputclkctrl_outclk\,
	d => \s_local_count[3]~21_combout\,
	clrn => \I_RESET_N~inputclkctrl_outclk\,
	ena => \s_local_count[0]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_local_count(3));

-- Location: LCCOMB_X32_Y16_N20
\s_local_count[4]~23\ : cycloneiv_lcell_comb
-- Equation(s):
-- \s_local_count[4]~23_combout\ = ((\s_current_state.BOTH_INACTIVE_STATE~q\ $ (s_local_count(4) $ (\s_local_count[3]~22\)))) # (GND)
-- \s_local_count[4]~24\ = CARRY((\s_current_state.BOTH_INACTIVE_STATE~q\ & (s_local_count(4) & !\s_local_count[3]~22\)) # (!\s_current_state.BOTH_INACTIVE_STATE~q\ & ((s_local_count(4)) # (!\s_local_count[3]~22\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \s_current_state.BOTH_INACTIVE_STATE~q\,
	datab => s_local_count(4),
	datad => VCC,
	cin => \s_local_count[3]~22\,
	combout => \s_local_count[4]~23_combout\,
	cout => \s_local_count[4]~24\);

-- Location: FF_X32_Y16_N21
\s_local_count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I_CLK_50MHZ~inputclkctrl_outclk\,
	d => \s_local_count[4]~23_combout\,
	clrn => \I_RESET_N~inputclkctrl_outclk\,
	ena => \s_local_count[0]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_local_count(4));

-- Location: LCCOMB_X32_Y16_N22
\s_local_count[5]~25\ : cycloneiv_lcell_comb
-- Equation(s):
-- \s_local_count[5]~25_combout\ = (\s_current_state.BOTH_INACTIVE_STATE~q\ & ((s_local_count(5) & (!\s_local_count[4]~24\)) # (!s_local_count(5) & ((\s_local_count[4]~24\) # (GND))))) # (!\s_current_state.BOTH_INACTIVE_STATE~q\ & ((s_local_count(5) & 
-- (\s_local_count[4]~24\ & VCC)) # (!s_local_count(5) & (!\s_local_count[4]~24\))))
-- \s_local_count[5]~26\ = CARRY((\s_current_state.BOTH_INACTIVE_STATE~q\ & ((!\s_local_count[4]~24\) # (!s_local_count(5)))) # (!\s_current_state.BOTH_INACTIVE_STATE~q\ & (!s_local_count(5) & !\s_local_count[4]~24\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \s_current_state.BOTH_INACTIVE_STATE~q\,
	datab => s_local_count(5),
	datad => VCC,
	cin => \s_local_count[4]~24\,
	combout => \s_local_count[5]~25_combout\,
	cout => \s_local_count[5]~26\);

-- Location: FF_X32_Y16_N23
\s_local_count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I_CLK_50MHZ~inputclkctrl_outclk\,
	d => \s_local_count[5]~25_combout\,
	clrn => \I_RESET_N~inputclkctrl_outclk\,
	ena => \s_local_count[0]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_local_count(5));

-- Location: LCCOMB_X32_Y16_N24
\s_local_count[6]~27\ : cycloneiv_lcell_comb
-- Equation(s):
-- \s_local_count[6]~27_combout\ = ((\s_current_state.BOTH_INACTIVE_STATE~q\ $ (s_local_count(6) $ (\s_local_count[5]~26\)))) # (GND)
-- \s_local_count[6]~28\ = CARRY((\s_current_state.BOTH_INACTIVE_STATE~q\ & (s_local_count(6) & !\s_local_count[5]~26\)) # (!\s_current_state.BOTH_INACTIVE_STATE~q\ & ((s_local_count(6)) # (!\s_local_count[5]~26\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \s_current_state.BOTH_INACTIVE_STATE~q\,
	datab => s_local_count(6),
	datad => VCC,
	cin => \s_local_count[5]~26\,
	combout => \s_local_count[6]~27_combout\,
	cout => \s_local_count[6]~28\);

-- Location: FF_X32_Y16_N25
\s_local_count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I_CLK_50MHZ~inputclkctrl_outclk\,
	d => \s_local_count[6]~27_combout\,
	clrn => \I_RESET_N~inputclkctrl_outclk\,
	ena => \s_local_count[0]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_local_count(6));

-- Location: LCCOMB_X32_Y16_N4
\s_local_count[0]~15\ : cycloneiv_lcell_comb
-- Equation(s):
-- \s_local_count[0]~15_combout\ = (!s_local_count(7) & (!s_local_count(6) & (!s_local_count(5) & !s_local_count(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_local_count(7),
	datab => s_local_count(6),
	datac => s_local_count(5),
	datad => s_local_count(4),
	combout => \s_local_count[0]~15_combout\);

-- Location: LCCOMB_X32_Y16_N0
\Equal0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (s_local_count(0) & (s_local_count(3) & (s_local_count(1) & s_local_count(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_local_count(0),
	datab => s_local_count(3),
	datac => s_local_count(1),
	datad => s_local_count(2),
	combout => \Equal0~0_combout\);

-- Location: FF_X32_Y16_N3
\s_previous_state.BOTH_INACTIVE_STATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I_CLK_50MHZ~inputclkctrl_outclk\,
	asdata => \s_current_state.BOTH_INACTIVE_STATE~q\,
	clrn => \I_RESET_N~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \s_previous_state.BOTH_INACTIVE_STATE~q\);

-- Location: LCCOMB_X32_Y16_N26
\s_local_count[7]~29\ : cycloneiv_lcell_comb
-- Equation(s):
-- \s_local_count[7]~29_combout\ = s_local_count(7) $ (\s_local_count[6]~28\ $ (!\s_current_state.BOTH_INACTIVE_STATE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => s_local_count(7),
	datad => \s_current_state.BOTH_INACTIVE_STATE~q\,
	cin => \s_local_count[6]~28\,
	combout => \s_local_count[7]~29_combout\);

-- Location: FF_X32_Y16_N27
\s_local_count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I_CLK_50MHZ~inputclkctrl_outclk\,
	d => \s_local_count[7]~29_combout\,
	clrn => \I_RESET_N~inputclkctrl_outclk\,
	ena => \s_local_count[0]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_local_count(7));

-- Location: LCCOMB_X32_Y16_N10
\Equal0~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = (s_local_count(5) & (s_local_count(4) & (s_local_count(7) & s_local_count(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_local_count(5),
	datab => s_local_count(4),
	datac => s_local_count(7),
	datad => s_local_count(6),
	combout => \Equal0~1_combout\);

-- Location: LCCOMB_X32_Y16_N2
\s_local_count[0]~12\ : cycloneiv_lcell_comb
-- Equation(s):
-- \s_local_count[0]~12_combout\ = ((\s_previous_state.BOTH_INACTIVE_STATE~q\) # ((\Equal0~0_combout\ & \Equal0~1_combout\))) # (!\s_current_state.A_ACTIVE_STATE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_current_state.A_ACTIVE_STATE~q\,
	datab => \Equal0~0_combout\,
	datac => \s_previous_state.BOTH_INACTIVE_STATE~q\,
	datad => \Equal0~1_combout\,
	combout => \s_local_count[0]~12_combout\);

-- Location: LCCOMB_X32_Y16_N28
\s_local_count[0]~16\ : cycloneiv_lcell_comb
-- Equation(s):
-- \s_local_count[0]~16_combout\ = ((!\s_local_count[0]~13_combout\ & ((!\s_local_count[0]~15_combout\) # (!\s_local_count[0]~14_combout\)))) # (!\s_local_count[0]~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_local_count[0]~14_combout\,
	datab => \s_local_count[0]~13_combout\,
	datac => \s_local_count[0]~15_combout\,
	datad => \s_local_count[0]~12_combout\,
	combout => \s_local_count[0]~16_combout\);

-- Location: FF_X32_Y16_N13
\s_local_count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I_CLK_50MHZ~inputclkctrl_outclk\,
	d => \s_local_count[0]~10_combout\,
	clrn => \I_RESET_N~inputclkctrl_outclk\,
	ena => \s_local_count[0]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_local_count(0));

ww_O_LED_COUNT(0) <= \O_LED_COUNT[0]~output_o\;

ww_O_LED_COUNT(1) <= \O_LED_COUNT[1]~output_o\;

ww_O_LED_COUNT(2) <= \O_LED_COUNT[2]~output_o\;

ww_O_LED_COUNT(3) <= \O_LED_COUNT[3]~output_o\;

ww_O_LED_COUNT(4) <= \O_LED_COUNT[4]~output_o\;

ww_O_LED_COUNT(5) <= \O_LED_COUNT[5]~output_o\;

ww_O_LED_COUNT(6) <= \O_LED_COUNT[6]~output_o\;

ww_O_LED_COUNT(7) <= \O_LED_COUNT[7]~output_o\;
END structure;


