--------------------------------------------------------------------------------
-- Filename     : LFSR.vhd
-- Author(s)    : Kyle Bielby, Chris Lloyd (Team 1)
-- Class        : EE365 (Project 4)
-- Due Date     : 2020-10-09
-- Date Created : 2020-10-03
-- Target Board : Cora Z7 10 (Dual Core)
-- Entity       : LFSR (Main Entity)
-- Description  : Design file that describes the behavior of a 128 bit Linear  
--                Shift Register (LFSR). 
--
--                To start out with, the LFSR uses a default "random" set of 
--                values stored in the constant (C_REG_DEFAULT_VALUE).
--
--                For every clock cycle, each bit gets shifted forwards by 1. 
--
--                shift_reg(i+1) = shift_reg(i) 
--
--                At the same time, the first bit position gets a feedback bit 
--                inserted which has a formula based on previous taps from the 
--                register at different positions (48, 93, 108, 114) which all 
--                get xor'd together creating a single feedback bit.
--
--                shift_reg(0) <= shift_reg(48) xor 
--                                shift_reg(93) xor
--                                shift_reg(108) xor 
--                                shift_reg(114);
--
--                The final output (O_RNG) is the value in the first position.
--
--                O_RNG <= shift_reg(0);  
--  
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
entity LFSR is
port
(
  I_CLK_125MHZ : in Std_logic;
  I_RESET_N    : in Std_logic;
  O_RNG        : out std_logic
);
end;

--------------------------------
--  Architecture Declaration  --
--------------------------------
architecture Behavioral of LFSR is
  
  ---------------
  -- CONSTANTS --
  ---------------
  constant C_REG_DEFAULT_VALUE: Std_Logic_Vector(127 downto 0) := "11101010101000011010111001010001010001011110001010111101100100011100100101011010110001101010111010010011001010001010101101010001";

  -------------
  -- SIGNALS --
  -------------
  signal shift_reg : std_logic_vector(127 downto 0) := C_REG_DEFAULT_VALUE;

  begin

  -- Output first bit of LFSR
  O_RNG <= shift_reg(0);

  ---------------
  -- Processes --
  ---------------

  ------------------------------------------------------------------------------
  -- Process Name     : FEEDBACK_SHIFT_REG
  -- Sensitivity List : I_CLK_125MHZ  : Global clock
  --                    I_RESET_N     : Global reset line
  -- Useful Outputs   : shift_reg     : Feedback Shift Register
  -- Description      : Shifts register and inserts feedback bit based on 
  --                    current register taps (values). 
  ------------------------------------------------------------------------------      
  FEEDBACK_SHIFT_REG: process(I_CLK_125MHZ, I_RESET_N) begin
    
    if I_RESET_N = '1' then  -- CDL=> Active low?
        shift_reg <= C_REG_DEFAULT_VALUE;

    elsif rising_edge(I_CLK_125MHZ) then
      -- Shift register
      shift_reg(127 downto 1) <= shift_reg(126 downto 0);

      -- Add feedback bit based on register taps
      shift_reg(0) <= shift_reg(48) xor 
                      shift_reg(93) xor 
                      shift_reg(108) xor 
                      shift_reg(114);
    end if;
  end process FEEDBACK_SHIFT_REG;
  ------------------------------------------------------------------------------
end architecture Behavioral;