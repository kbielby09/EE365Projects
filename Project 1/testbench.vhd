--Team 1 Kyle Bielby Christopher Lloyd
--D Flip Flop Circuit
--version 1: 8/26/2020
library IEEE;
use IEEE.std_logic_1164.all;

--make top entity
entity testbench is
--empty
end testbench;

--define architecture for testbench
architecture tb of testbench is 

--add DFlipFlop component to be tested
component DFlipFlop is 
	port(clk, input: in Std_logic;
    		Q, QPrime: out Std_logic);
end component;

--define signals 
signal clock: Std_logic:= '0';
signal input: Std_logic:= '0';

begin

	--Connect DUT DFlipFlop
	DUT: DFlipFlop port map();
    
    --create test process
    process
    begin
    	--test code here
    end process;

end tb;