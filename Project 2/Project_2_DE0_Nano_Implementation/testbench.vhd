-----------------------------------------------------------------------------------------
-- Filename: 		testbench.vhd (Altera DEO nano implementation)
-- Author(s): 		Kyle Bielby, Chris Lloyd (Team 1)
-- Class: 			EE365 (Project 2)
-- Due Date: 		2020-09-14
-- Date Created:	2020-09-07
-- Last Revised:	2020-09-07
-- Target Board:	Altera DE0 Nano
-- Project:			car_counter (Main Entity)
-- Description:		testbench file to test output of car_counter.vhd for DE0 nano board
----------------------------------------------------------------------------------------

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
				sensorA <= '1';
				wait for 40ns;
			
				-- from A to idle
				sensorA <= '0';
				wait for 40ns;
			
				-- from idle to B
				sensorB <= '1';
				wait for 40ns;
			
				-- from B to idle
				sensorB <= '0';
				wait for 40ns;
				
				-- car trips Both and reverses (enters then exits)
				sensorA <= '1';
				wait for 20ns;
				sensorB <= '1';
				wait for 20ns;
				sensor B <= '0';
				wait for 20ns;
				sensorA <= '0';
				wait for 20ns;
				
				-- car trips A and reverses (enters then exits)
				sensorA <= '1';
				wait for 20ns;
				sensorA <= '0';
				wait for 20ns;
			
			-- cases that should not happen
				-- from A to B
				sensorA <= '1';
				wait 30ns;
				sensorA <= '0';
				wait for 30ns;
				sensorB <= '1';
				wait for 30ns;
				sensorB <= '0';
			
				-- from B to A
				sensorB <= '1';
				wait for 30ns;
				sensorB <= '0';
				wait for 30ns;
				sensorA <= '1';
				wait for 30ns;
				sensorA <= '0';
				wait for 20ns;
			
				-- from both to idle
				sensorA <= '1';
				sensorB <= '1';
				wait for 30ns;
				sensorA <= '0';
				sensorB <= '0';
				wait for 30ns;
				
				-- from idle to both
				sensorA <= '0';
				sensorB <= '0';
				wait for 30ns;
				sensorA <= '1';
				sensorB <= '1';
				wait for 30ns;
				
			-- additional checks
				-- reset states
				sensorA <= '0';
				sensorB <= '0';
				wait for 20ns;
				
				-- count to max value of counter	
				maxCountloop : for i in 0 to "11111111" loop
					sensorA <= '1';
					wait for 20ns;
					sensorB <= '1';
					wait for 20ns;
					sensorA <= '0';
					wait for 20ns;
					sensorB <= '0';
					wait for 20ns;
				end loop maxCountloop;
				
				-- add 1 more count to see if overflow occurs
				sensorA <=  '1';
				wait for 20ns;
				sensorB <= '1';
				wait for 20ns;
				sensorA <= '0';
				wait for 20ns;
				sensorB <= '0';
				wait for 20ns;
				
				-- test reset
				reset <= '1';
				wait for 20ns;
				
				-- test decrementing counter from 0
				sensorB <= '1';
				wait for 20ns;
				sensorA <= '1';
				wait for 20ns;
				sensorB <= '0';
				wait for 20ns;
				sensorA <= '0';
				wait for 20ns;
				

end test; -- end architecture