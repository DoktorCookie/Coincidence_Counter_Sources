
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
Library UNISIM;
use UNISIM.vcomponents.all;


--This part has the clock and a single incomming signal as input and controls a LED as output
--The use is to extend the uptime of a single LED to desired time
--Maybe expanded with other functionalities in upcomming steps
entity LED_prolongation is
    generic(
        --for controlling LED uptime
        WIDTH : integer := 28
    );
    port (
        --Clock
        CLK : in std_logic ;
        --Incomming signal, for higher orders already a logical connection of multiple signals in top-level vhd, not here
        SIG : in std_logic ;
        --Connected LED Output
        LED : out std_logic := '0'
    ) ;
end LED_prolongation;


architecture Behavioral of LED_prolongation is

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
    

    process (CLK) is
    begin
    
        if rising_edge (CLK) then

            --starts the timer if the signal channel becomes high
            if SIG = '1' then
                --enables timer increase
                timer_enable <= '1';
                --turns on LED
                LED <= '1';
            end if;
            
            --deactivates again after one timer overflow
            if timer_overflow = '1' then
                --disables timer increase
                timer_enable <= '0';
                --turns LED of
                LED <= '0';           
            end if;
            
        end if;
    
    end process;
     
end Behavioral;
