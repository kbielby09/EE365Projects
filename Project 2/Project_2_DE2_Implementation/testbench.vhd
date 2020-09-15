-----------------------------------------------------------------------------------------
-- Filename:    testbench.vhd (Altera DEO nano implementation)
-- Author(s):     Kyle Bielby, Chris Lloyd (Team 1)
-- Class:       EE365 (Project 2)
-- Due Date:    2020-09-14
-- Date Created:  2020-09-07
-- Last Revised:  2020-09-07
-- Target Board:  Altera DE0 Nano
-- Project:     car_counter (Main Entity)
-- Description:   testbench file to test output of car_counter.vhd for DE0 nano board
----------------------------------------------------------------------------------------

-----------------
--  Libraries  --
-----------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


--------------
--  Entity  --
--------------
entity testbench is
end testbench;

--------------------------------
--  Architecture Declaration  --
--------------------------------
architecture test of testbench is
  ----------------
  -- Components --
  ----------------
  component car_counter is
    port(
      I_CLK_50MHZ         : in Std_logic;
      I_RESET_N           : in Std_logic;
      I_SENSOR_A_ACTIVE_N : in Std_logic;
      I_SENSOR_B_ACTIVE_N : in Std_logic;
      O_LED_COUNT         : out Std_logic_Vector(7 downto 0)
    );
  end component;
    
  -------------
  -- SIGNALS --
  -------------
  signal clk                : std_logic := '0';
  signal reset, reset_n     : std_logic;
  signal sensorA, sensorA_n : std_logic;
  signal sensorB, sensorB_n : std_logic;
  signal out_count          : std_logic_vector(7 downto 0);

begin
   
  -- connect signals to component inputs
  DUT: car_counter port map(
                    I_CLK_50MHZ         => clk,
                    I_RESET_N           => reset_n,
                    I_SENSOR_A_ACTIVE_N => sensorA_n,
                    I_SENSOR_B_ACTIVE_N => sensorB_n,
                    O_LED_COUNT         => out_count
                    );
                      
  -- Generate dummy clk with frequency of 50MHz = 1/T -> T = 20ns
  clk <= not clk after 10 ns; -- invert clk signal at half period

  -- Set active low signals for use with DUT
  reset_n <= not reset;
  sensorA_n <= not sensorA;
  sensorB_n <= not sensorB;

  ---------------
  -- Processes --
  ---------------

  ------------------------------------------------------------------------------
  -- Process Name     : CAR_COUNTER_TESTBENCH
  -- Sensitivity List : None
  -- Useful Outputs   : None
  -- Description      : Testing code to verify car counter design.
  ------------------------------------------------------------------------------      
  CAR_COUNTER_TESTBENCH: process begin
      
    -- Reset the system before testing and initialize values
    sensorB <= '0';
    sensorA <= '0';
    reset   <= '1';
    wait for 20 ns;
    reset   <= '0';
    wait for 20 ns;
    
    ----------------------------------------------------------------------------
    ------------------------------- Test Cases ---------------------------------
    ----------------------------------------------------------------------------
    
    -- Test 1: Car enters but backs up and is not counted
    sensorA <= '1';
    wait for 20 ns;
    sensorB <= '1';
    wait for 20 ns;
    sensorB <= '0';
    wait for 20 ns;
    sensorA <= '0';
    wait for 20 ns;

    -- Test 2: Car enters and counter is incremented
    sensorA <= '1';
    wait for 20 ns;
    sensorB <= '1';
    wait for 20 ns;
    sensorA <= '0';
    wait for 20 ns;
    sensorB <= '0';
    wait for 20 ns;

    -- Test 3: Car exits but backs up and is not counted
    sensorB <= '1';
    wait for 20 ns;
    sensorA <= '1';
    wait for 20 ns;
    sensorA <= '0';
    wait for 20 ns;
    sensorB <= '0';
    wait for 20 ns;

    -- Test 4: Car exits and counter is decremented
    sensorB <= '1';
    wait for 20 ns;
    sensorA <= '1';
    wait for 20 ns;
    sensorB <= '0';
    wait for 20 ns;
    sensorA <= '0';
    wait for 20 ns;

    -- Test 5: System is reset after two cars enter
    -- Add two cars to parking lot (counter = 2)
    for i in 0 to 1 loop
      sensorA <= '1';
      wait for 20 ns;
      sensorB <= '1';
      wait for 20 ns;
      sensorA <= '0';
      wait for 20 ns;
      sensorB <= '0';
      wait for 20 ns;
    end loop;
    
    -- Test reset
    reset <= '1';
    wait for 20 ns;  
    reset <= '0'; 
    wait for 20 ns;

    -- Test 6: Car exits when no cars are in parking lot (counter stays at 0)
    sensorB <= '1';
    wait for 20 ns;
    sensorA <= '1';
    wait for 20 ns;
    sensorB <= '0';
    wait for 20 ns;
    sensorA <= '0';
    wait for 20 ns;

    -- Test 7: Car enters when parking lot is full (counter stays at max count)
    -- Add 255 cars to parking lot (counter = max count)
    for i in 0 to 255 loop
      sensorA <= '1';
      wait for 20 ns;
      sensorB <= '1';
      wait for 20 ns;
      sensorA <= '0';
      wait for 20 ns;
      sensorB <= '0';
      wait for 20 ns;
    end loop;

    -- Add one more car (counter should remain unchanged)
    sensorA <= '1';
    wait for 20 ns;
    sensorB <= '1';
    wait for 20 ns;
    sensorA <= '0';
    wait for 20 ns;
    sensorB <= '0';
    wait for 20 ns;
  
  end process CAR_COUNTER_TESTBENCH;
  ------------------------------------------------------------------------------
end architecture test;