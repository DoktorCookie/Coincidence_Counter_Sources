

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;


-- Uses the current counter and creates ASCII Codes for every decimal digit so it can be displayed as a decimal number.

entity rate_ascii_code_converter is
    GENERIC(
        bits   : INTEGER := 32;  --size of the binary input numbers in bits
        digits : INTEGER := 10);  --number of BCD digits to convert to
    Port (
        CLK : in std_logic;
        --takes a counter as input
        COUNT : in std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
        --controlled start of conversion
        CONV_STRT : in std_logic;
        -- vector output containing all ascii codes as one block
        VEC_OUT : out std_logic_vector(digits*8-1 DOWNTO 0) := "00000000000000000000000000000000000000000000000000000000000000000000000000000000"
        );
        
        
end rate_ascii_code_converter;


architecture Behavioral of rate_ascii_code_converter is

    -- signals for the sub-routine binary to BCD conversion. 
    -- bcd_reset_n and bcd_is_busy are not really used but need to be mapped non-the-less
    -- bcd_vector is the desired output of a vector containing the BCD stuff
    signal bcd_reset_n : std_logic := '1';
    signal bcd_is_busy : std_logic;
    signal bcd_vector : STD_LOGIC_VECTOR(digits*4-1 DOWNTO 0);
    -- just the zero in ASCII code used for calculations of the other ASCII codes
    signal zero_ascii : unsigned(7 downto 0) := "00110000" ;
    -- output vector containing the ASCII codes for all 10 digits in one block
    signal output_vector : std_logic_vector(digits*8-1 DOWNTO 0);
    
begin

    -- calls a binary to bcd converter based on a starting signal supplied thorugh CONV_STRT
    -- changing CONV_STRT also enable control of the output interval of the counter
    -- https://forum.digikey.com/t/binary-to-bcd-converter-vhdl/12530
    bcd_conv : entity work.binary_to_bcd
    generic map (
        bits => bits,
        digits => digits       
    )
    port map (
        clk     => CLK    ,                         --system clock
        reset_n =>  bcd_reset_n,                    --active low asynchronus reset
        ena     => CONV_STRT,                       --latches in new binary number and starts conversion
        binary  => COUNT,                           --binary number to convert
        
        busy    => bcd_is_busy,                     -- OUT indicates conversion in progress. Not in use
                                                    -- could be used as an additional fail-safe for to early conversion start attempt
        bcd     => bcd_vector                       -- OUT STD_LOGIC_VECTOR(digits*4-1 DOWNTO 0)); --resulting BCD number
    );
    
    -- maps the ten decimal degits to the respective output port. Replace with a vector containing all in the future.
    output_vector(7 downto 0) <= std_logic_vector( zero_ascii +  unsigned(bcd_vector(3 downto 0)));
    output_vector(15 downto 8) <= std_logic_vector( zero_ascii +  unsigned(bcd_vector(7 downto 4)));
    output_vector(23 downto 16) <= std_logic_vector( zero_ascii +  unsigned(bcd_vector(11 downto 8)));
    output_vector(31 downto 24) <= std_logic_vector( zero_ascii +  unsigned(bcd_vector(15 downto 12)));
    output_vector(39 downto 32) <= std_logic_vector( zero_ascii +  unsigned(bcd_vector(19 downto 16)));
    output_vector(47 downto 40) <= std_logic_vector( zero_ascii +  unsigned(bcd_vector(23 downto 20)));
    output_vector(55 downto 48) <= std_logic_vector( zero_ascii +  unsigned(bcd_vector(27 downto 24)));
    output_vector(63 downto 56) <= std_logic_vector( zero_ascii +  unsigned(bcd_vector(31 downto 28)));
    output_vector(71 downto 64) <= std_logic_vector( zero_ascii +  unsigned(bcd_vector(35 downto 32)));
    output_vector(79 downto 72) <= std_logic_vector( zero_ascii +  unsigned(bcd_vector(39 downto 36)));

    VEC_OUT <= output_vector;

end Behavioral;
