--------------------------------------------------------------------------------
-- Filename     : car_counter.vhd
-- Author(s)    : Kyle Bielby, Chris Lloyd (Team 1)
-- Class        : EE365 (Project 3)
-- Due Date     : 2020-09-25
-- Date Created : 2020-09-20
-- Target Board : Altera DE2
-- Entity       : car_counter (Main Entity)
-- Description  : Design file that describes behavior of parking lot car 
--                counter system with multiple detectors (sensors) A and B.
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
entity car_counter is
port
(
  I_CLK_50MHZ         : in Std_logic;
  I_RESET_N           : in Std_logic;
  I_SENSOR_A_ACTIVE_N : in Std_logic;
  I_SENSOR_B_ACTIVE_N : in Std_logic;
  O_LED_COUNT         : out Std_logic_Vector(7 downto 0);
  O_HEX0_N            : out Std_logic_Vector(6 downto 0);
  O_HEX1_N            : out Std_logic_Vector(6 downto 0)
);
end;

--------------------------------
--  Architecture Declaration  --
--------------------------------
architecture behavioral of car_counter is
  ----------------
  -- Components --
  ----------------
  component hex_decoder is
    port
    (
      I_CLK_50MHZ : in Std_logic;
      I_RESET_N   : in Std_logic;
      I_COUNT     : in Std_logic_Vector(3 downto 0);
      O_HEX_N     : out Std_logic_Vector(6 downto 0)
    );
  end component;  

  -------------
  -- SIGNALS --
  -------------

  -- Define FSM variables for car counter system
  type T_STATE is (A_ACTIVE_STATE, 
                   B_ACTIVE_STATE, 
                   BOTH_ACTIVE_STATE, 
                   BOTH_INACTIVE_STATE);
  signal s_current_state  : T_STATE;
  signal s_previous_state : T_STATE;

  -- Define local count
  signal s_local_count : Unsigned(7 downto 0);

  -- Split local count into nibbles for displaying to seven segment display
  signal s_local_count_upper_nibble : Std_logic_Vector(3 downto 0);
  signal s_local_count_lower_nibble : Std_logic_Vector(3 downto 0);

  begin

  s_local_count_upper_nibble <= Std_logic_vector(s_local_count)(7 downto 4);
  s_local_count_lower_nibble <= Std_logic_vector(s_local_count)(3 downto 0);

  -- Control active low seven segment digit 0
  HEX0: hex_decoder port map
  (
    I_CLK_50MHZ         => I_CLK_50MHZ,
    I_RESET_N           => I_RESET_N,
    I_COUNT             => s_local_count_lower_nibble,
    O_HEX_N             => O_HEX0_N
  );
  
  -- Control active low seven segment digit 1
  HEX1: hex_decoder port map
  (
    I_CLK_50MHZ         => I_CLK_50MHZ,
    I_RESET_N           => I_RESET_N,
    I_COUNT             => s_local_count_upper_nibble,
    O_HEX_N             => O_HEX1_N
  );  

  -- Set local count to external count
  O_LED_COUNT <= Std_logic_vector(s_local_count);

  ---------------
  -- Processes --
  ---------------

  ------------------------------------------------------------------------------
  -- Process Name     : SENSOR_STATE_MACHINE
  -- Sensitivity List : I_CLK_50MHZ      : Global clock
  --                    I_RESET_N        : Global reset line
  -- Useful Outputs   : s_current_state  : The current state of the system
  --                    s_previous_state : The previous state of the system
  -- Description      : State machine logic to control state of sensor system
  ------------------------------------------------------------------------------      
  SENSOR_STATE_MACHINE: process(I_CLK_50MHZ, I_RESET_N) begin

    -- Reset state to Idle
    if I_RESET_N = '0' then
      s_current_state   <= BOTH_INACTIVE_STATE;
      s_previous_state  <= BOTH_INACTIVE_STATE;

    -- Check for a change of states when clock changes
    -- (Input combination differs from current state)
    elsif rising_edge(I_CLK_50MHZ) then
      if I_SENSOR_A_ACTIVE_N = '0' and I_SENSOR_B_ACTIVE_N = '0'    then -- BOTH
        s_current_state <= BOTH_ACTIVE_STATE;
      elsif I_SENSOR_A_ACTIVE_N = '0' and I_SENSOR_B_ACTIVE_N = '1' then -- A
        s_current_state <= A_ACTIVE_STATE;
      elsif I_SENSOR_A_ACTIVE_N = '1' and I_SENSOR_B_ACTIVE_N = '0' then -- B
        s_current_state <= B_ACTIVE_STATE;
      else                                                               -- NONE
        s_current_state <= BOTH_INACTIVE_STATE;
      end if;
      s_previous_state  <= s_current_state;
    end if;
  end process SENSOR_STATE_MACHINE;
  ------------------------------------------------------------------------------

  ------------------------------------------------------------------------------
  -- Process Name     : CAR_COUNTER
  -- Sensitivity List : I_CLK_50MHZ   : Global clock
  --                    I_RESET_N     : Global reset line
  -- Useful Outputs   : s_local_count : Count of cars in lot
  -- Description      : Counter to count cars in parking lot based on state 
  ------------------------------------------------------------------------------      
  CAR_COUNTER: process(I_CLK_50MHZ, I_RESET_N) begin
    
    -- Reset count to 0
    if I_RESET_N = '0' then
        s_local_count       <= (others => '0');

    -- Check for transition from A and NONE when clock changes
    -- (A to NONE: Decrement Count, NONE to A: Increment Count)
    elsif rising_edge(I_CLK_50MHZ) then
      case s_current_state is
        when A_ACTIVE_STATE      =>  -- A -> NONE
          if s_previous_state = BOTH_INACTIVE_STATE then
            if not (s_local_count = 255) then -- Ensure no rollover
              s_local_count <= s_local_count + 1;
            else
              s_local_count <= s_local_count;
            end if;
          end if;
        when BOTH_INACTIVE_STATE =>  -- NONE -> A
          if s_previous_state = A_ACTIVE_STATE then
            if not (s_local_count = 0) then   -- Ensure no rollover
              s_local_count <= s_local_count - 1;
            else
              s_local_count <= s_local_count;              
            end if;
          end if;
        when others              =>
          s_local_count     <= s_local_count;
      end case;
    end if;
  end process CAR_COUNTER;
  ------------------------------------------------------------------------------
end architecture behavioral;
