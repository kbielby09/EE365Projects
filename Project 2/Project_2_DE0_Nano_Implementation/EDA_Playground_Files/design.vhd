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
	port(clk, reset, forward, backward: in Std_logic;
    	output: out Std_logic;
        carCount: out Std_logic_Vector(7 downto 0)) 
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
    process(clk, reset, forward, backward) begin
    	
        --reset car counter to 0 
    	if reset = '1' then 
        	--reset binary count to 0
        	carCount <= "00000000";
            count <= "00000000";
            
        --check for a change of states when clock changes
        elsif rising_edge(clk) then 
        	case state is
            	when A=>
                	if forward = '1' then
                    	--update previous state
                        previousState <= state;
                    	--car moves forward to state BOTH
                        state <= B;                        
                    elsif backward = '1' then
                    	--update previous state
                        previousState <= state;
                        state <= IDLE;                    
                    end if;
                    
                when B=>
                	if forward = '1' then
                    	previousState <= state;
                        state <= IDLE;
                    elsif backward = '1' then
                    	previousState <= state;
                        state <= BOTH;
                    end if;
                    
                when BOTH=>
                	if forward = '1' then
                    	previousState <= state;
                        state <= B;
                    elsif backward = '1' then
                    	previousState <= state;
                        state <= A;
                    end if;
                    
                when IDLE=>
                	if forward = '1' then
                    	previousState <= state;
                        state <= A;
                    elsif backward = '1' then
                    	previousState <= state;
                        state <= B;
                    end if;
			end case;
        end if;
        
    end process;
    
    process(state)
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
        
    end process;
end;