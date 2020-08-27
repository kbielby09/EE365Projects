--Team 1 Kyle Bielby Christopher Lloyd
--D flip flop circuit
--version 1: 8/26/2020
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.Numeric_std.all;

--defined entity for D flip flop
entity DFlipFlop is
	port (clk, input: in Std_logic;
    		Q, QPrime: out Std_logic);
end;

--defined behavior of D flip flop
architecture Test of DFlipFlop is

begin 
	
	--define sequential behavior of D Flip Flop
    process (clk, input) begin
    
      --on rising edge of the clock output becomes the previous input
      if Rising_edge(clk) then 
          Q <= input; 
          QPrime <= not(input);
      end if;
    
    end process;
end;