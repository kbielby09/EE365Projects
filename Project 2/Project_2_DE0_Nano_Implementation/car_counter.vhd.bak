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
entity carCounter is
	port(clk, reset, sensorA, sensorB: in Std_logic;
        carCount: out Std_logic_Vector(7 downto 0));
end;

-- Define Behavior of Testbench
architecture behavior of carCounter is
	-- define states for carCounter FSM
    type States is (A, B, BOTH, IDLE);
	signal state : States;
    signal previousState : States;
    signal count : unsigned(7 downto 0) := "00000000";

	begin

    --sequential behavior of car counter
    process(clk, reset, sensorA, sensorB) begin

        --reset car counter to 0
    	if reset = '1' then
        	--reset binary count to 0
        	carCount <= "00000000";
            count <= "00000000";

        --check for a change of states when clock changes
        elsif rising_edge(clk) then
        	if sensorA = '1' then
            	--update previous state
                previousState <= state;
                --check if both inputs are on
                if sensorB = '1' then
                	state <= BOTH;
                else
                	state <= A;
                end if;
			end if;

            --check for state transition to B
            if sensorB = '1' then
            	previousState <= state;
            	if sensorA = '0' then
                	state <= B;
                end if;
            end if;

            --state transition to IDLE
            if sensorA = '0' then
            	if sensorB ='0' then
                	state <= IDLE;
                end if;
            end if;

        end if;

    end process;

    process(state, previousState)
    	begin
        -- update count when in propper states
        case state is
        	when B=>
            	if previousState = IDLE then
                	--decrement count
                    count <= count + 1;
                end if;
			when IDLE=>
            	if previousState = B then
                	--increment count
                    count <= count + 1;
                end if;
        end case;

        --Send vehicle count to output
        carCount <= Std_logic_vector(count);
    end process;
end;
