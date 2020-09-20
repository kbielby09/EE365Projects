--------------------------------------------------------------------------------
-- Filename     : hex_decoder.vhd
-- Author(s)    : Kyle Bielby, Chris Lloyd (Team 1)
-- Class        : EE365 (Project 3)
-- Due Date     : 2020-09-25
-- Date Created : 2020-09-20
-- Target Board : Altera DE2
-- Entity       : hex_decoder
-- Description  : Code to display a nibble of binary data to an active low 
--                seven segment display.
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
entity hex_decoder is
port
(
  I_CLK_50MHZ         : in Std_logic;
  I_RESET_N           : in Std_logic;
  I_COUNT             : in Std_logic_Vector(3 downto 0);
  O_HEX_N             : out Std_logic_Vector(6 downto 0)
);
end;

--------------------------------
--  Architecture Declaration  --
--------------------------------
architecture behavioral of hex_decoder is
  begin

  ---------------
  -- Processes --
  ---------------

  ------------------------------------------------------------------------------
  -- Process Name     : HEX_DECODER
  -- Sensitivity List : I_CLK_50MHZ      : Global clock
  --                    I_RESET_N        : Global reset line
  -- Useful Outputs   : O_HEX_N          : Seven segment display digit data.
  -- Description      : Logic to convert a binary nibble (0-F) to an active low 
  --                    seven segment display.
  ------------------------------------------------------------------------------      
  HEX_DECODER: process(I_CLK_50MHZ, I_RESET_N) begin

    -- Reset state to Idle
    if I_RESET_N = '0' then
      O_HEX_N <= "1111111";

    elsif rising_edge(I_CLK_50MHZ) then
      case(I_COUNT) is
        when "0000"             => -- '0'
          O_HEX_N <= "1000000";
        when "0001"             => -- '1'
          O_HEX_N <= "1111001";
        when "0010"             => -- '2'
          O_HEX_N <= "0100100";
        when "0011"             => -- '3'
          O_HEX_N <= "0110000";
        when "0100"             => -- '4'
          O_HEX_N <= "0011001";
        when "0101"             => -- '5'
          O_HEX_N <= "0010010";
        when "0110"             => -- '6'
          O_HEX_N <= "0000010";
        when "0111"             => -- '7'
          O_HEX_N <= "1111000";
        when "1000"             => -- '8'
          O_HEX_N <= "0000000";
        when "1001"             => -- '9'
          O_HEX_N <= "0010000";
        when "1010"             => -- 'A'
          O_HEX_N <= "0001000";
        when "1011"             => -- 'b'
          O_HEX_N <= "0000011";
        when "1100"             => -- 'C'
          O_HEX_N <= "1000110";
        when "1101"             => -- 'd'
          O_HEX_N <= "0100001";
        when "1110"             => -- 'E'
          O_HEX_N <= "0000110";
        when "1111"             => -- 'F'
          O_HEX_N <= "0001110";
        when others             => -- ' '
          O_HEX_N <= "1111111";
      end case; 
    end if;
  end process HEX_DECODER;
  ------------------------------------------------------------------------------
end architecture behavioral;
