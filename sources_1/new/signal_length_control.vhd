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

entity signal_length_control is
  generic(
    WIDTH : integer := 8
  );  
  Port ( 
    SIG_IN : in std_logic ;
    CLK : in std_logic ;
    --SIG_OUT_LONGER: out std_logic ;
    SIG_OUT : out std_logic := '0'
    
  );
end signal_length_control;




architecture Behavioral of signal_length_control is
    --Flag for remebering if a signal was found
    signal found_flag : std_logic := '0';
    
    --Timer for Signal length control
    --Signal to start the timer, starts disabled
    signal timer_enable : std_logic := '0';
    --Signal to get the moment when the used timer overflows
    signal timer_overflow : std_logic := '0';
begin
    
    
    --uses a counter for time prolongation
    counter_1: entity work.counter
    generic map (
        -- CLK Speed is 100 MHz, for example 2^29/100MHz = 5.37 seconds LED uptime.
        WIDTH => WIDTH
    )
    port map(
        CLK => CLK,
        INC => timer_enable,
        OVERFLOW => timer_overflow
    );
    
    -- !!!IMPORTANT!!!
    -- The found flag is important to not count a signal muplitple times
    
    process (CLK) is
    begin
    
        if rising_edge (CLK) then
        
            -- cases with timer overflow

            -- case: timer overflow, disables timer advancement. Disables outgoing signal in this cycle. Independent from incoming signal. preserves found flag
            if (SIG_IN = '0' or SIG_IN = '1') and timer_enable = '1' and found_flag = '0' and timer_overflow = '1' then
            
                SIG_OUT <= '0';
                timer_enable <= '0';
                found_flag <= '0';
                
            -- case: same as above with found_flag high
            elsif (SIG_IN = '0' or SIG_IN = '1') and timer_enable = '1' and found_flag = '1' and timer_overflow = '1' then
            
                SIG_OUT <= '0';
                timer_enable <= '0';
                found_flag <= '1';
                
            -- case: timer overflows without running timer: strange case; do a emergency reset of all signals
            elsif (SIG_IN = '0' or SIG_IN = '1') and timer_enable = '0' and (found_flag = '1' or found_flag = '0')  and timer_overflow = '1' then
            
                SIG_OUT <= '0';
                timer_enable <= '0';
                found_flag <= '0';
                


            -- cases without timer overflow

            -- case: no signal and no runnging timer. Common found flag reset case
            elsif SIG_IN = '0' and timer_enable = '0' and (found_flag = '0' or found_flag = '1') and timer_overflow = '0' then 
        
                SIG_OUT <= '0';
                timer_enable <= '0';
                found_flag <= '0';
        
            -- case: newly incoming signal (first cycle) and no signal found before (timer is off and the signal is low)
            elsif SIG_IN = '1' and timer_enable = '0' and found_flag = '0' and timer_overflow = '0' then 
            
                SIG_OUT <= '1';
                timer_enable <= '1';
                found_flag <= '1';
                
            --case: timer turned off while signal still high, preserves found flag
            elsif SIG_IN = '1' and timer_enable = '0' and found_flag = '1' and timer_overflow = '0' then 
            
                SIG_OUT <= '0';
                timer_enable <= '0';
                found_flag <= '1';
                
            -- case: timer is allready running while signal is still high. 
            elsif SIG_IN = '1' and timer_enable = '1' and (found_flag = '0' or found_flag = '1') and timer_overflow = '0' then
            
                SIG_OUT <= '1';
                timer_enable <= '1';
                found_flag <= '1';
            
            --case: timer is running and signal is gone. Resets the found flag
            elsif SIG_IN = '0' and timer_enable = '1' and (found_flag = '0' or found_flag = '1') and timer_overflow = '0' then
            
                SIG_OUT <= '1';
                timer_enable <= '1';
                found_flag <= '0';
                
            end if;
       

            
            
            
--            --while Signal Input is low, just output low. Also resets flag (reset timer controlled in future)
--            if SIG_IN = '0' then
                
--                --maybe flag needs to be removed here after timer implementation 
--                --(only if t_cut_Signal > t_signal is needed, otherwise this will be earlier then the timer
--                --effectively limiting max Signal length to original signal length)
--                found_flag <= '0';
--                SIG_OUT <= '0';
            
--            --On rising Signal, output high and set the flag
--            elsif SIG_IN = '1' and found_flag = '0' then
            
--                found_flag <= '1';
--                SIG_OUT <= '1';
--                --start timer
--                --timer_enable <= '1';
            
--            --while the flag ist set, the output is low
--            elsif SIG_IN = '1' and found_flag = '1' then
                
--                found_flag <= '1';
--                SIG_OUT <= '0';
            
--            end if;
            
        end if;
    
    end process;

end Behavioral;
