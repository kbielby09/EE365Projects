--------------------------------------------------------------------------------
-- Filename     : tb_LFSR.vhd
-- Author(s)    : Kyle Bielby, Chris Lloyd (Team 1)
-- Class        : EE365 (Project 4)
-- Due Date     : 2020-10-09
-- Date Created : 2020-10-03
-- Target Board : Cora Z7 10 (Dual Core)
-- Entity       : LFSR (Main Entity)
-- Description  : Testbench code to test Linear Shift Register (LFSR) Entity.  
--------------------------------------------------------------------------------

-----------------
--  Libraries  --
-----------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.Numeric_std.all;

--------------
--  Entity  --
--------------
entity tb_LFSR is
end tb_LFSR;

--------------------------------
--  Architecture Declaration  --
--------------------------------
architecture Behavioral of tb_LFSR is
  
  ----------------
  -- Components --
  ----------------
  component LFSR is 
    port(
      I_CLK_125MHZ : in Std_logic;
      O_RNG        : out std_logic
    );
  end component;

  ---------------
  -- CONSTANTS --
  ---------------
  constant clock_period : time := 8 ns;   -- 125 MHz

  -------------
  -- SIGNALS --
  -------------
  signal clock   : std_logic := '0';
  signal rng_out : std_logic;

  begin

  -- Entity under test
  DUT: LFSR port map( 
         I_CLK_125MHZ => clock,
         O_RNG        => rng_out
       );

  ---------------
  -- Processes --
  ---------------

  ------------------------------------------------------------------------------
  -- Process Name     : LFSR_CLOCK
  -- Sensitivity List : None
  -- Useful Outputs   : clock : Testing clock at rate of 125 MHZ
  -- Description      : Simple process to generate clock for testing LFSR.
  ------------------------------------------------------------------------------        
  LFSR_CLOCK: process begin
    -- Generate clock cycle
    clock <= '0';
    wait for clock_period / 2;  -- for 4 ns signal is '0'.
    clock <= '1';
    wait for clock_period / 2;  -- for next 4 ns signal is '1'.
  end process LFSR_CLOCK;
  ------------------------------------------------------------------------------
end Behavioral;
