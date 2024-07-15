
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;



entity multiplicity_counter is
  Port ( 
    
    -- Ingoing Signals (the length-controlled signals comming from signal_length_control funcion)
    SIG1 : in std_logic;
    SIG2 : in std_logic;
    SIG3 : in std_logic;
    SIG4 : in std_logic;
    SIG5 : in std_logic;
    SIG6 : in std_logic;
    SIG7 : in std_logic;
    SIG8 : in std_logic;
    SIG9 : in std_logic;
    SIG10 : in std_logic;
    SIG11 : in std_logic;
    SIG12 : in std_logic;
    SIG13 : in std_logic;
    SIG14 : in std_logic;
    SIG15 : in std_logic;
    SIG16 : in std_logic;
    
    -- Outgoing Signals for LEDs or to count extern
    MULTI1 : out std_logic := '0' ; -- MULTI1 is a single signal and no coincidence
    MULTI2 : out std_logic := '0' ;
    MULTI3 : out std_logic := '0' ;
    MULTI4 : out std_logic := '0' ;
    MULTI5 : out std_logic := '0' ;
    MULTI6 : out std_logic := '0' ;
    MULTI7 : out std_logic := '0' ;
    MULTI8 : out std_logic := '0' ;
    MULTI9 : out std_logic := '0' ;
    MULTI10 : out std_logic := '0' ;
    MULTI11 : out std_logic := '0' ;
    MULTI12 : out std_logic := '0' ;
    MULTI13 : out std_logic := '0' ;
    MULTI14 : out std_logic := '0' ;
    MULTI15 : out std_logic := '0' ;
    MULTI16 : out std_logic := '0' ;

    COUNTERMULTI1 : out unsigned(31 downto 0) := "00000000000000000000000000000000";
    COUNTERMULTI2 : out unsigned(31 downto 0) := "00000000000000000000000000000000";
    COUNTERMULTI3 : out unsigned(31 downto 0) := "00000000000000000000000000000000";

    CLK : in std_logic 
  );
    
end multiplicity_counter;

architecture Behavioral of multiplicity_counter is

    -- used to keep track of the amount of synchronous occuring signals at the moment
    -- size needs to be changed depending on amount of used detectors (this case: 16 detectors)
    signal signal_sum_current : unsigned(4 downto 0) := "00000";
    -- used to keep track of the maximum multiplicity in a meassurrement interval
    -- same size as above value
    signal signal_sum_max : unsigned(4 downto 0) := "00000";
    -- This is the OR of all incoming signal to start the interval and end it again
    signal incoming_signal_or :  std_logic := '0';
    -- This recognizes if the interval is running or not
    signal is_running : std_logic := '0';
    
    -- signals converted to unsigned for arithmetics
    signal num1 : unsigned(4 downto 0) := "00000";
    signal num2 : unsigned(4 downto 0) := "00000";
    signal num3 : unsigned(4 downto 0) := "00000";
    signal num4 : unsigned(4 downto 0) := "00000";
    signal num5 : unsigned(4 downto 0) := "00000";
    signal num6 : unsigned(4 downto 0) := "00000";
    signal num7 : unsigned(4 downto 0) := "00000";
    signal num8 : unsigned(4 downto 0) := "00000";
    signal num9 : unsigned(4 downto 0) := "00000";
    signal num10 : unsigned(4 downto 0) := "00000";
    signal num11 : unsigned(4 downto 0) := "00000";
    signal num12 : unsigned(4 downto 0) := "00000";
    signal num13 : unsigned(4 downto 0) := "00000";
    signal num14 : unsigned(4 downto 0) := "00000";
    signal num15 : unsigned(4 downto 0) := "00000";
    signal num16 : unsigned(4 downto 0) := "00000";
    
    --counters
    signal counter_1 : unsigned(31 downto 0) := "00000000000000000000000000000000";
    signal counter_2 : unsigned(31 downto 0) := "00000000000000000000000000000000";
    signal counter_3 : unsigned(31 downto 0) := "00000000000000000000000000000000";
    
begin
    
    -- detects any incomming signal to start interval of meassurement
    incoming_signal_or <= SIG1 or SIG2 or SIG3 or SIG4 or SIG5 or SIG6 or SIG7 or SIG8 or SIG9 or SIG10 or SIG11 or SIG12 or SIG13 or SIG14 or SIG15 or SIG16;

    --connects counter output to their matching signals
    COUNTERMULTI1 <= counter_1;
    COUNTERMULTI2 <= counter_2;
    COUNTERMULTI3 <= counter_3;
    

    process (CLK) is
    begin
    
        -- BEGIN COMPLICATED
        -- search for better alternative
        -- sums up all incomming signals (between zero and sixteen)
        if SIG1 = '0' then
            num1 <= "00000";
        else
            num1 <= "00001";
        end if;
        
        if SIG2 = '0' then
            num2 <= "00000";
        else
            num2 <= "00001";
        end if;
        
        if SIG3 = '0' then
            num3 <= "00000";
        else
            num3 <= "00001";
        end if;
        
        if SIG4 = '0' then
            num4 <= "00000";
        else
            num4 <= "00001";
        end if;
        
        if SIG5 = '0' then
            num5 <= "00000";
        else
            num5 <= "00001";
        end if;
        
        if SIG6 = '0' then
            num6 <= "00000";
        else
            num6 <= "00001";
        end if;
        
        if SIG7 = '0' then
            num7 <= "00000";
        else
            num7 <= "00001";
        end if;
        
        if SIG8 = '0' then
            num8 <= "00000";
        else
            num8 <= "00001";
        end if;
        
        if SIG9 = '0' then
            num9 <= "00000";
        else
            num9 <= "00001";
        end if;
        
        if SIG10 = '0' then
            num10 <= "00000";
        else
            num10 <= "00001";
        end if;
        
        if SIG11 = '0' then
            num11 <= "00000";
        else
            num11 <= "00001";
        end if;
        
        if SIG12 = '0' then
            num12 <= "00000";
        else
            num12 <= "00001";
        end if;
        
        if SIG13 = '0' then
            num13 <= "00000";
        else
            num13 <= "00001";
        end if;
        
        if SIG14 = '0' then
            num14 <= "00000";
        else
            num14 <= "00001";
        end if;
        
        if SIG15 = '0' then
            num15 <= "00000";
        else
            num15 <= "00001";
        end if;
        
        if SIG16 = '0' then
            num16 <= "00000";
        else
            num16 <= "00001";
        end if;
        
        --creates the current signal sum to determine multiplicity
        signal_sum_current <= num1 + num2 + num3 + num4 + num5 + num6 + num7 + num8 + num9 + num10 + num11 + num12 + num13 + num14 + num15 + num16 ;
        -- END COMPLICATED
        
        
        if rising_edge (CLK) then
  
            -- Case: Wait for incomming signal (reset things)
            if incoming_signal_or = '0' and is_running = '0' then
                
                
                signal_sum_max <= "00000";
                is_running <= '0';
                -- reset output signals
                MULTI1 <= '0';
                MULTI2 <= '0';
                MULTI3 <= '0';
                MULTI4 <= '0';
                MULTI5 <= '0';
                MULTI6 <= '0';
                MULTI7 <= '0';
                MULTI8 <= '0';
                MULTI9 <= '0';
                MULTI10 <= '0';
                MULTI11 <= '0';
                MULTI12 <= '0';
                MULTI13 <= '0';
                MULTI14 <= '0';
                MULTI15 <= '0';
                MULTI16 <= '0';
                
            
            -- Case: Signal is rising, start interval
            elsif incoming_signal_or = '1' and is_running = '0' then
            
                is_running <= '1';
                -- initialisiere die counter mit aktuellem Wert
                signal_sum_max <= signal_sum_current;
                --signal_sum_current <= "00000";
           
            
            -- Case: Interval is running
            elsif incoming_signal_or = '1' and is_running = '1' then
                
                -- overwrite the maximum found multiplicity if the new one is bigger
                if signal_sum_current > signal_sum_max then
                    signal_sum_max <= signal_sum_current;
                end if;
                
            
            -- Case: Signal is falling, write/output meassured (reset everything maybe in next cycle only?)
            elsif incoming_signal_or = '0' and is_running = '1' then
            
                is_running <= '0';
                
                -- gives the matching multiplicity output signal for 1 cycle
                if signal_sum_max = "00001" then
                    MULTI1 <= '1';
                    counter_1 <= counter_1 + 1;
                elsif signal_sum_max = "00010" then
                    MULTI2 <= '1';
                    counter_2 <= counter_2 + 1;
                elsif signal_sum_max = "00011" then
                    MULTI3 <= '1';
                    counter_3 <= counter_3 + 1;
                elsif signal_sum_max = "00100" then
                    MULTI4 <= '1';    
                elsif signal_sum_max = "00101" then
                    MULTI5 <= '1';
                elsif signal_sum_max = "00110" then
                    MULTI6 <= '1';
                elsif signal_sum_max = "00111" then
                    MULTI7 <= '1';
                elsif signal_sum_max = "01000" then
                    MULTI8 <= '1';
                    
                elsif signal_sum_max = "01001" then
                    MULTI9 <= '1';
                elsif signal_sum_max = "01010" then
                    MULTI10 <= '1';
                elsif signal_sum_max = "01011" then
                    MULTI11 <= '1';
                elsif signal_sum_max = "01100" then
                    MULTI12 <= '1';    
                elsif signal_sum_max = "01101" then
                    MULTI13 <= '1';
                elsif signal_sum_max = "01110" then
                    MULTI14 <= '1';
                elsif signal_sum_max = "01111" then
                    MULTI15 <= '1';
                elsif signal_sum_max = "10000" then
                    MULTI16 <= '1';       
                else
                    
                        
                end if;
            
            end if;
        
        end if;
  
    end process;

end Behavioral;