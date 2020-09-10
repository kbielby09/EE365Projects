--------------------------------------------------------------------------------
-- Filename     : car_counter.vhd
-- Author(s)    : Kyle Bielby, Chris Lloyd (Team 1)
-- Class        : EE365 (Project 2)
-- Due Date     : 2020-09-14
-- Date Created : 2020-09-07
-- Last Revised : 2020-09-07
-- Target Board : Altera DE2/DE0 Nano
-- Project      : car_counter (Main Entity)
-- Description  : Entity to emulate a parking lot car counter system.
--------------------------------------------------------------------------------
-- Todos:
-- 1. Solve all CDL=>
-- 2. Add process descriptions
-- 3. Ensure indentation and spacing is clean and consistent.
--
-- Done:
--
--------------------------------------------------------------------------------

-----------------
--  Libraries  --
-----------------
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

--------------
--  Entity  --
--------------
entity car_counter is
port
(
  -- CDL=> Fill out later
  -- Clocks & Resets
  -- CLK
  -- Reset Pin

  -- Switch Inputs
  -- Forward
  -- Reverse

  -- LED Outputs (counter)
  -- 5-bit Binary for 5 LEDs
end entity car_counter;


--------------------------------
--  Architecture Declaration  --
--------------------------------
architecture behavioral of car_counter is

  -------------
  -- SIGNALS --
  -------------

  -- State related signals
  type t_STATE is (IDLE_STATE, DETECTOR_A_ACTIVE_STATE, DETECTOR_B_ACTIVE_STATE, DETECTOR_AB_ACTIVE_STATE);
  signal s_current_detector_state       : t_STATE;
  signal s_previous_detector_state      : t_STATE;

  -- CDL=> Create signals for pushbuttons and LEDS to abstract from actual inputs and outputs

begin
  ------------------------------------------------------------------------------
  -- Process Name     : CAR_COUNTER_STATE_MACHINE
  -- Sensitivity List : CLK    : Global clock
  --                    RST    : Global Reset line
  -- Useful Outputs   : s_current_detector_state,
  --                    s_previous_detector_state: 
  -- Description      : State machine to control different states for CDL=> Here
  ------------------------------------------------------------------------------
  CAR_COUNTER_STATE_MACHINE: process () -- CDL=> Add clk and reset to sensitivity list
  begin
    if (I_SYSTEM_RST = '1') then  -- Upon reset, set the state to IDLE_STATE
      s_current_detector_state <= IDLE_STATE;

    elsif (rising_edge()) then  -- CDL=> Add clk
      case s_current_detector_state is
        when IDLE_STATE => -- CDL=> Use format for other signals
            if () then -- CDL=> Left signal
              
            elsif () then -- CDL=> Right signal
            
            else
              s_current_detector_state <= s_current_detector_state;
            end if;
    
        -- Error condition, should never occur
        when others =>
          s_current_detector_state <= IDLE_STATE;
      end case;
    end if;
  end process CAR_COUNTER_STATE_MACHINE;
  ------------------------------------------------------------------------------

  ------------------------------------------------------------------------------
  -- Process Name     : CAR_COUNTER_STATE_MACHINE
  -- Sensitivity List : CLK    : Global clock
  --                    RST    : Global Reset line
  -- Useful Outputs   : LED 
  -- Description      : CDL=> Here
  ------------------------------------------------------------------------------
  CAR_COUNTER: process () -- CDL=> Add clk and reset to sensitivity list
  begin
    if (I_SYSTEM_RST = '1') then
      -- CDL=> Reset condition

    elsif ((rising_edge(I_CLK_100MHZ))) then
      -- If previous was IDLE and current is B, subtract one from counter
      -- If previous was A and current is IDLE, add one to counter
      -- Else, LED counter = current value
    end if;

  end process KEYPAD_TO_BINARY;
  ------------------------------------------------------------------------------
end architecture behavioral;
