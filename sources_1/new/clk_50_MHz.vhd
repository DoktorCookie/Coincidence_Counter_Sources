

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clk_50_MHz is
    Port ( 
    
        CLK : in std_logic ;
        CLK_HALF : out std_logic := '0'
    
    );
end clk_50_MHz;


architecture Behavioral of clk_50_MHz is

    signal do_output : std_logic := '0';

begin

    process (CLK) is
    begin

        if rising_edge (CLK) then
  
            if do_output = '0' then
                CLK_HALF <= '0';
                do_output <= '1'; 
            elsif do_output = '1' then
                CLK_HALF <= '1';
                do_output <= '0';
            end if;
            
        end if;
  
    end process;

end Behavioral;
