--------------------------------------------------------------------------------
-- Filename: 		testbench.vhd (Altera DEO nano implementation)
-- Author(s): 		Kyle Bielby, Chris Lloyd (Team 1)
-- Class: 			EE365 (Project 2)
-- Due Date: 		2020-09-14
-- Date Created:	2020-09-07
-- Last Revised:	2020-09-07
-- Target Board:	Altera DE0 Nano
-- Project:			car_counter (Main Entity)
-- Description:		testbench file to test output of car_counter.vhd for DE0 nano					 board
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

-- create empty entity for testbench
entity testbench is
end testbench;

-- create test for car counter circuit
architecture test of testbench 
	
    -- add car_counter component to test  
	component car_counter is
    	port(
        	I_CLK_50MHZ				: in Std_logic;
  			I_RESET_N				: in Std_logic;
  			I_SENSOR_A_ACTIVE_N 	: in Std_logic;
  			I_SENSOR_B_ACTIVE_N 	: in Std_logic;
  			O_LED_COUNT         	: out Std_logic_Vector(7 downto 0)
		); -- end port
	end component; -- end component
    
    -- define signals in testbench
    signal clock 		: std_logic := '0';
    signal reset 		: std_logic := '0';
    signal sensorA 	: std_logic := '0';
    signal sensorB 	: std_logic := '0';
	 
	 begin
	 
		-- connect signals to component inputs
		DUT : car_counter port map(
											clock 	=> I_CLK_50MHZ,
											reset 	=> I_RESET_N,
											sensorA 	=> I_SENSOR_A_ACTIVE_N,
											sensorB	=> I_SENSOR_B_ACTIVE_N
											); -- end connect signals
											
		-- specify clock frequency (50MHz)
		clock <= not clock after 10ns; -- invert clock signal at half period
		
		process
		begin
			-- display count of 0 for 2 clock cycles
			wait for 40ns;
			
			-- test cases
			-- from idle to A
			-- from A to idle
			-- from idle to B
			-- from B to idle
			
			-- cases that should not happen
			-- from A to B
			-- from B to A
			
			-- additional checks
			-- hold max value of counter
			-- don't decrement counter from 0

end test; -- end architecture