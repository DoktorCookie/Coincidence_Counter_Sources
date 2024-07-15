----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/29/2024 02:57:18 PM
-- Design Name: 
-- Module Name: signal_cutter - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity signal_cutter is
  generic(
    WIDTH : integer := 8
  );  
  Port ( 
    SIG_IN : in std_logic ;
    CLK : in std_logic ;
    --SIG_OUT_LONGER: out std_logic ;
    SIG_OUT : out std_logic := '0'
    
  );
end signal_cutter;




architecture Behavioral of signal_cutter is
    --Flag for remebering if a signal was found
    signal found_flag : std_logic := '0';
    
    --Timer for Signal length control
    --Signal to start the timer, starts disabled
    --signal timer_enable : std_logic := '0';
    --Signal to get the moment when the used timer overflows
    --signal timer_overflow : std_logic := '0';
begin
    
    
    --uses a counter for time prolongation
    --counter_1: entity work.counter
    --generic map (
    --    -- CLK Speed is 100 MHz, for example 2^29/100MHz = 5.37 seconds LED uptime.
    --    WIDTH => WIDTH
    --)
    --port map(
    --    CLK => CLK,
    --    INC => timer_enable,
    --    OVERFLOW => timer_overflow
    --);
    
    
    
    process (CLK) is
    begin
    
        if rising_edge (CLK) then
        
            --while Signal Input is low, just output low. Also resets flag (reset timer controlled in future)
            if SIG_IN = '0' then
                
                --maybe flag needs to be removed here after timer implementation 
                --(only if t_cut_Signal > t_signal is needed, otherwise this will be earlier then the timer
                --effectively limiting max Signal length to original signal length)
                found_flag <= '0';
                SIG_OUT <= '0';
            
            --On rising Signal, output high and set the flag
            elsif SIG_IN = '1' and found_flag = '0' then
            
                found_flag <= '1';
                SIG_OUT <= '1';
                --start timer
                --timer_enable <= '1';
            
            --while the flag ist set, the output is low
            elsif SIG_IN = '1' and found_flag = '1' then
                
                found_flag <= '1';
                SIG_OUT <= '0';
            
            end if;
            
        end if;
    
    end process;

end Behavioral;
