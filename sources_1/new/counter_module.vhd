
--Counter as found in the "Programmierbare Elektronik" Praktikum

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is 

    generic(
        WIDTH : integer := 28
    );
    port(
        CLK : in std_logic ;
        INC : in std_logic ;
        --COUNT : out std_logic_vector (WIDTH - 1 downto 0);
        OVERFLOW : out std_logic 
    );

end entity counter;

architecture behavioral of counter is
    signal count_i : unsigned(WIDTH - 1 downto 0);
begin
    process (CLK) is
    begin
        if rising_edge(CLK) then
        
            OVERFLOW <= '0';
            if INC = '1' then
                count_i <= count_i + 1;
                if count_i = 2**WIDTH -1 then
                    OVERFLOW <= '1';
                end if;
                
            
            end if;
        
        end if;
    
    end process ;
    
    --COUNT <= std_logic_vector(count_i);
    
end architecture behavioral;