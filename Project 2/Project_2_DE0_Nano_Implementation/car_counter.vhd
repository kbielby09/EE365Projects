--------------------------------------------------------------------------------
-- Filename: 		car_counter.vhd (Altera DEO nano implementation)
-- Author(s): 		Kyle Bielby, Chris Lloyd (Team 1)
-- Class: 			EE365 (Project 2)
-- Due Date: 		2020-09-14
-- Date Created:	2020-09-07
-- Last Revised:	2020-09-07
-- Target Board:	Altera DE0 Nano
-- Project:			car_counter (Main Entity)
-- Description:		design file that describes behavior of parking lot car 							counter system.
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.Numeric_std.all;

-- Parking lot counter
entity car_counter is
	port(clk, reset, sensorA, sensorB: in Std_logic;
        carCount: out Std_logic_Vector(7 downto 0));
end;

-- Define Behavior of Testbench
architecture behavior of car_counter is
	-- define states for carCounter FSM
   type States is (A, B, BOTH, IDLE);
	signal state : States;
   signal previousState : States;
   signal count : Unsigned(7 downto 0) := "00000000";
	signal flag : std_logic := '1';

	begin

	carCount <= std_logic_Vector(count);
    --sequential behavior of car counter
--    process(clk, reset, sensorA, sensorB) begin
--	 process(sensorA, sensorB) begin

        --reset car counter to 0
    	--if  reset = '1' then
        	--reset binary count to 0
        	--carCount <= "00000000";
         --count <= (others => '0');
			--cout <= "00000000";

        --check for a change of states when clock changes
--       if rising_edge(clk) then
--			previousState <= state;
--        	if sensorA = '0' then
--            	--update previous state
----                previousState <= state;
--                if sensorB = '0' then
----                	state <= BOTH;
--                else
----                	state <= A;
--                end if;
--			end if;
--
--            --check for state transition to B
--            if sensorB = '0' then
----            	previousState <= state;
--            	if sensorA = '1' then
--                	state <= B;
--                end if;
--            end if;
--
--            --state transition to IDLE
--            if sensorA = '1' then
--            	if sensorB ='1' then
--                	state <= IDLE;
--                end if;
--            end if;
--
--        end if;
--
--    end process;

    process(clk, state, sensorA, sensorB)
    	begin
		if rising_edge(clk) then
			 -- update count when in propper states
			
        case state is
			when A=>
				if sensorA = not('0') and sensorB = not('0') then 
					
					state <= IDLE;
				elsif sensorA = not('1') and sensorB = not('1') then
					
					state <= BOTH;
				elsif sensorA = not('0') and sensorB = not('1') then
					
					state <= B;
				else 
					flag <= '0';
					state <= A;
				end if;
				
			when BOTH=>
				if sensorA = not('0') and sensorB = not('0') then 
					
					state <= IDLE;
				elsif sensorA = not('1') and sensorB = not('0') then
					
					state <= A;
				elsif sensorA = not('0') and sensorB = not('1') then
					
					state <= B;
				else 
					flag <= '0';
					state <= BOTH;
				end if;
				
        	when B=>
            if sensorA = not('0') and sensorB = not('0') then
					
					state <= IDLE;
--					if flag = '1' then 
						count <= count + 1;
--					end if;					
				elsif sensorA = not('1') and sensorB = not('0') then
					
					state <= A;
				elsif sensorA = not('1') and sensorB = not('1') then
					
					state <= BOTH;
				else 
					flag <= '0';
					state <= B;
				end if;
				
			when IDLE=>
				if sensorA = not('0') and sensorB = not('1') then 
					
					state <= B;
--					if flag = '1' then
						count <= count - 1;
--					end if;					
				elsif sensorA = not('1') and sensorB = not('0') then
					
					state <= A;
				elsif sensorA = not('1') and sensorB = not('1') then
					
					state <= BOTH;
				else 
					flag <= '0';
					state <= IDLE;
				end if;
        end case;
		end if;
        
    end process;
	 
end architecture;
