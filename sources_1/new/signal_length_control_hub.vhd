-- This outsourced parts controls the length of the signals which go into the multiplicity meassurement and therefore the coincidence window


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity signal_length_control_hub is
    generic (
        COINCIDENCE_LENGTH : integer := 1
    );
    Port ( 
        CLK : in std_logic ;
        -- incoming signals
        SIG1 : in std_logic ;
        SIG2 : in std_logic ;
        SIG3 : in std_logic ;
        SIG4 : in std_logic ;
        SIG5 : in std_logic ;
        SIG6 : in std_logic ;
        SIG7 : in std_logic ;
        SIG8 : in std_logic ;
        SIG9 : in std_logic ;
        SIG10 : in std_logic ;
        SIG11 : in std_logic ;
        SIG12 : in std_logic ;
        SIG13 : in std_logic ;
        SIG14 : in std_logic ;
        SIG15 : in std_logic ;
        SIG16 : in std_logic ;
        -- outgoing cut signals
        SIG1CUT : out std_logic;
        SIG2CUT : out std_logic;
        SIG3CUT : out std_logic;
        SIG4CUT : out std_logic;
        SIG5CUT : out std_logic;
        SIG6CUT : out std_logic;
        SIG7CUT : out std_logic;
        SIG8CUT : out std_logic;
        SIG9CUT : out std_logic;
        SIG10CUT : out std_logic;
        SIG11CUT : out std_logic;
        SIG12CUT : out std_logic;
        SIG13CUT : out std_logic;
        SIG14CUT : out std_logic;
        SIG15CUT : out std_logic;
        SIG16CUT : out std_logic
        
    );
end signal_length_control_hub;


architecture Behavioral of signal_length_control_hub is
begin

    signal_length_1: entity work.signal_length_control
    --signal_length_1: entity work.signal_cutter
    generic map (
        -- CLK Speed is 100 MHz, for example 2^29/100MHz = 5.37 seconds LED uptime.
        -- 2^20/100MHz = 10.5 ms
        WIDTH => COINCIDENCE_LENGTH
    )
    port map (
        SIG_IN => SIG1,
        CLK => CLK,
        SIG_OUT => SIG1CUT
    );
    
    signal_length_2: entity work.signal_length_control
    --signal_length_1: entity work.signal_cutter
    generic map (
        -- CLK Speed is 100 MHz, for example 2^29/100MHz = 5.37 seconds LED uptime.
        -- 2^20/100MHz = 10.5 ms
        WIDTH => COINCIDENCE_LENGTH
    )
    port map (
        SIG_IN => SIG2,
        CLK => CLK,
        SIG_OUT => SIG2CUT
    );
    
    signal_length_3: entity work.signal_length_control
    --signal_length_1: entity work.signal_cutter
    generic map (
        -- CLK Speed is 100 MHz, for example 2^29/100MHz = 5.37 seconds LED uptime.
        -- 2^20/100MHz = 10.5 ms
        WIDTH => COINCIDENCE_LENGTH
    )
    port map (
        SIG_IN => SIG3,
        CLK => CLK,
        SIG_OUT => SIG3CUT
    );
    
    signal_length_4: entity work.signal_length_control
    --signal_length_1: entity work.signal_cutter
    generic map (
        -- CLK Speed is 100 MHz, for example 2^29/100MHz = 5.37 seconds LED uptime.
        -- 2^20/100MHz = 10.5 ms
        WIDTH => COINCIDENCE_LENGTH
    )
    port map (
        SIG_IN => SIG4,
        CLK => CLK,
        SIG_OUT => SIG4CUT
    );
    
    signal_length_5: entity work.signal_length_control
    --signal_length_1: entity work.signal_cutter
    generic map (
        -- CLK Speed is 100 MHz, for example 2^29/100MHz = 5.37 seconds LED uptime.
        -- 2^20/100MHz = 10.5 ms
        WIDTH => COINCIDENCE_LENGTH
    )
    port map (
        SIG_IN => SIG5,
        CLK => CLK,
        SIG_OUT => SIG5CUT
    );

    signal_length_6: entity work.signal_length_control
    --signal_length_1: entity work.signal_cutter
    generic map (
        -- CLK Speed is 100 MHz, for example 2^29/100MHz = 5.37 seconds LED uptime.
        -- 2^20/100MHz = 10.5 ms
        WIDTH => COINCIDENCE_LENGTH
    )
    port map (
        SIG_IN => SIG6,
        CLK => CLK,
        SIG_OUT => SIG6CUT
    );
    
    signal_length_7: entity work.signal_length_control
    --signal_length_1: entity work.signal_cutter
    generic map (
        -- CLK Speed is 100 MHz, for example 2^29/100MHz = 5.37 seconds LED uptime.
        -- 2^20/100MHz = 10.5 ms
        WIDTH => COINCIDENCE_LENGTH
    )
    port map (
        SIG_IN => SIG7,
        CLK => CLK,
        SIG_OUT => SIG7CUT
    );
    
    signal_length_8: entity work.signal_length_control
    --signal_length_1: entity work.signal_cutter
    generic map (
        -- CLK Speed is 100 MHz, for example 2^29/100MHz = 5.37 seconds LED uptime.
        -- 2^20/100MHz = 10.5 ms
        WIDTH => COINCIDENCE_LENGTH
    )
    port map (
        SIG_IN => SIG8,
        CLK => CLK,
        SIG_OUT => SIG8CUT
    );
    
    signal_length_9: entity work.signal_length_control
    --signal_length_1: entity work.signal_cutter
    generic map (
        -- CLK Speed is 100 MHz, for example 2^29/100MHz = 5.37 seconds LED uptime.
        -- 2^20/100MHz = 10.5 ms
        WIDTH => COINCIDENCE_LENGTH
    )
    port map (
        SIG_IN => SIG9,
        CLK => CLK,
        SIG_OUT => SIG9CUT
    );
    
    signal_length_10: entity work.signal_length_control
    --signal_length_1: entity work.signal_cutter
    generic map (
        -- CLK Speed is 100 MHz, for example 2^29/100MHz = 5.37 seconds LED uptime.
        -- 2^20/100MHz = 10.5 ms
        WIDTH => COINCIDENCE_LENGTH
    )
    port map (
        SIG_IN => SIG10,
        CLK => CLK,
        SIG_OUT => SIG10CUT
    );
    
    signal_length_11: entity work.signal_length_control
    --signal_length_1: entity work.signal_cutter
    generic map (
        -- CLK Speed is 100 MHz, for example 2^29/100MHz = 5.37 seconds LED uptime.
        -- 2^20/100MHz = 10.5 ms
        WIDTH => COINCIDENCE_LENGTH
    )
    port map (
        SIG_IN => SIG11,
        CLK => CLK,
        SIG_OUT => SIG11CUT
    );
    
    signal_length_12: entity work.signal_length_control
    --signal_length_1: entity work.signal_cutter
    generic map (
        -- CLK Speed is 100 MHz, for example 2^29/100MHz = 5.37 seconds LED uptime.
        -- 2^20/100MHz = 10.5 ms
        WIDTH => COINCIDENCE_LENGTH
    )
    port map (
        SIG_IN => SIG12,
        CLK => CLK,
        SIG_OUT => SIG12CUT
    );
    
    signal_length_13: entity work.signal_length_control
    --signal_length_1: entity work.signal_cutter
    generic map (
        -- CLK Speed is 100 MHz, for example 2^29/100MHz = 5.37 seconds LED uptime.
        -- 2^20/100MHz = 10.5 ms
        WIDTH => COINCIDENCE_LENGTH
    )
    port map (
        SIG_IN => SIG13,
        CLK => CLK,
        SIG_OUT => SIG13CUT
    );
    
    signal_length_14: entity work.signal_length_control
    --signal_length_1: entity work.signal_cutter
    generic map (
        -- CLK Speed is 100 MHz, for example 2^29/100MHz = 5.37 seconds LED uptime.
        -- 2^20/100MHz = 10.5 ms
        WIDTH => COINCIDENCE_LENGTH
    )
    port map (
        SIG_IN => SIG14,
        CLK => CLK,
        SIG_OUT => SIG14CUT
    );
    
    signal_length_15: entity work.signal_length_control
    --signal_length_1: entity work.signal_cutter
    generic map (
        -- CLK Speed is 100 MHz, for example 2^29/100MHz = 5.37 seconds LED uptime.
        -- 2^20/100MHz = 10.5 ms
        WIDTH => COINCIDENCE_LENGTH
    )
    port map (
        SIG_IN => SIG15,
        CLK => CLK,
        SIG_OUT => SIG15CUT
    );
    
    signal_length_16: entity work.signal_length_control
    --signal_length_1: entity work.signal_cutter
    generic map (
        -- CLK Speed is 100 MHz, for example 2^29/100MHz = 5.37 seconds LED uptime.
        -- 2^20/100MHz = 10.5 ms
        WIDTH => COINCIDENCE_LENGTH
    )
    port map (
        SIG_IN => SIG16,
        CLK => CLK,
        SIG_OUT => SIG16CUT
    );
    
end Behavioral;
