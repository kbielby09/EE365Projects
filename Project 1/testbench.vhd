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

	--Connect DUT DFlipFlop component
	DUT: DFlipFlop port map(clk=>clk, input=>input, Q=>Q, QPrime=>QPrime);
    
    --specify clock frequency
    clk <= not clk after 10 ns;
    
    --create test process
    process
    begin
    	--display the initial state of the D flip flop for two clock cycles
    	wait for 40ns;
        
        --change the input signal value for 2 clock cycles
        input <= '1';
        wait for 40ns;
        
        --cycle input again
        input <= '0';
        wait for 40ns;
        
        wait;
    end process;

end tb;