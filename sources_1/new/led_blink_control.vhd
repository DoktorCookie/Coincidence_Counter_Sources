-- This is a outsourced part containing all LED-Signal-Uptime-Control Subs instead of putting all 16 in the toplevel

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity led_blink_control is
    generic(
        LED_UPTIME : integer := 20
    );  
    port (
        CLK : in std_logic ;
        --Incoming Multiplicity Signals
        MULTI1 : in std_logic;
        MULTI2 : in std_logic;
        MULTI3 : in std_logic;
        MULTI4 : in std_logic;
        MULTI5 : in std_logic;
        MULTI6 : in std_logic;
        MULTI7 : in std_logic;
        MULTI8 : in std_logic;
        MULTI9 : in std_logic;
        MULTI10 : in std_logic;
        MULTI11 : in std_logic;
        MULTI12 : in std_logic;
        MULTI13 : in std_logic;
        MULTI14 : in std_logic;
        MULTI15 : in std_logic;
        MULTI16 : in std_logic;
        --Single Event Output for testing
        LED1 : out std_logic := '0';
        LED2 : out std_logic := '0';
        LED3 : out std_logic := '0';
        LED4 : out std_logic := '0';
        LED5 : out std_logic := '0';
        LED6 : out std_logic := '0';
        LED7 : out std_logic := '0';
        LED8 : out std_logic := '0';
        LED9 : out std_logic := '0';
        LED10 : out std_logic := '0';
        LED11 : out std_logic := '0';
        LED12 : out std_logic := '0';
        LED13 : out std_logic := '0';
        LED14 : out std_logic := '0';
        LED15 : out std_logic := '0';
        LED16 : out std_logic := '0'
    );  
end led_blink_control;


architecture Behavioral of led_blink_control is
begin

    multi_1_blink: entity work.LED_prolongation
    generic map (
        -- CLK Speed is 100 MHz, for example 2^29/100MHz = 5.37 seconds LED uptime.
        -- 2^20/100MHz = 10.5 ms
        WIDTH => LED_UPTIME
    )
    port map(
        CLK => CLK,
        SIG => MULTI1,
        LED => LED1
    );
    
    multi_2_blink: entity work.LED_prolongation
    generic map (
        -- CLK Speed is 100 MHz, for example 2^29/100MHz = 5.37 seconds LED uptime.
        -- 2^20/100MHz = 10.5 ms
        WIDTH => LED_UPTIME
    )
    port map(
        CLK => CLK,
        SIG => MULTI2,
        LED => LED2
    );
    
    multi_3_blink: entity work.LED_prolongation
    generic map (
        -- CLK Speed is 100 MHz, for example 2^29/100MHz = 5.37 seconds LED uptime.
        -- 2^20/100MHz = 10.5 ms
        WIDTH => LED_UPTIME
    )
    port map(
        CLK => CLK,
        SIG => MULTI3,
        LED => LED3
    );

    multi_4_blink: entity work.LED_prolongation
    generic map (
        -- CLK Speed is 100 MHz, for example 2^29/100MHz = 5.37 seconds LED uptime.
        -- 2^20/100MHz = 10.5 ms
        WIDTH => LED_UPTIME
    )
    port map(
        CLK => CLK,
        SIG => MULTI4,
        LED => LED4
    );
    
    multi_5_blink: entity work.LED_prolongation
    generic map (
        -- CLK Speed is 100 MHz, for example 2^29/100MHz = 5.37 seconds LED uptime.
        -- 2^20/100MHz = 10.5 ms
        WIDTH => LED_UPTIME
    )
    port map(
        CLK => CLK,
        SIG => MULTI5,
        LED => LED5
    );
    
    multi_6_blink: entity work.LED_prolongation
    generic map (
        -- CLK Speed is 100 MHz, for example 2^29/100MHz = 5.37 seconds LED uptime.
        -- 2^20/100MHz = 10.5 ms
        WIDTH => LED_UPTIME
    )
    port map(
        CLK => CLK,
        SIG => MULTI6,
        LED => LED6
    );
    
    multi_7_blink: entity work.LED_prolongation
    generic map (
        -- CLK Speed is 100 MHz, for example 2^29/100MHz = 5.37 seconds LED uptime.
        -- 2^20/100MHz = 10.5 ms
        WIDTH => LED_UPTIME
    )
    port map(
        CLK => CLK,
        SIG => MULTI7,
        LED => LED7
    );
    
    multi_8_blink: entity work.LED_prolongation
    generic map (
        -- CLK Speed is 100 MHz, for example 2^29/100MHz = 5.37 seconds LED uptime.
        -- 2^20/100MHz = 10.5 ms
        WIDTH => LED_UPTIME
    )
    port map(
        CLK => CLK,
        SIG => MULTI8,
        LED => LED8
    );
    
    multi_9_blink: entity work.LED_prolongation
    generic map (
        -- CLK Speed is 100 MHz, for example 2^29/100MHz = 5.37 seconds LED uptime.
        -- 2^20/100MHz = 10.5 ms
        WIDTH => LED_UPTIME
    )
    port map(
        CLK => CLK,
        SIG => MULTI9,
        LED => LED9
    );
    
    multi_10_blink: entity work.LED_prolongation
    generic map (
        -- CLK Speed is 100 MHz, for example 2^29/100MHz = 5.37 seconds LED uptime.
        -- 2^20/100MHz = 10.5 ms
        WIDTH => LED_UPTIME
    )
    port map(
        CLK => CLK,
        SIG => MULTI10,
        LED => LED10
    );
    
    multi_11_blink: entity work.LED_prolongation
    generic map (
        -- CLK Speed is 100 MHz, for example 2^29/100MHz = 5.37 seconds LED uptime.
        -- 2^20/100MHz = 10.5 ms
        WIDTH => LED_UPTIME
    )
    port map(
        CLK => CLK,
        SIG => MULTI11,
        LED => LED11
    );
    
    multi_12_blink: entity work.LED_prolongation
    generic map (
        -- CLK Speed is 100 MHz, for example 2^29/100MHz = 5.37 seconds LED uptime.
        -- 2^20/100MHz = 10.5 ms
        WIDTH => LED_UPTIME
    )
    port map(
        CLK => CLK,
        SIG => MULTI12,
        LED => LED12
    );
    
    multi_13_blink: entity work.LED_prolongation
    generic map (
        -- CLK Speed is 100 MHz, for example 2^29/100MHz = 5.37 seconds LED uptime.
        -- 2^20/100MHz = 10.5 ms
        WIDTH => LED_UPTIME
    )
    port map(
        CLK => CLK,
        SIG => MULTI13,
        LED => LED13
    );
    
    multi_14_blink: entity work.LED_prolongation
    generic map (
        -- CLK Speed is 100 MHz, for example 2^29/100MHz = 5.37 seconds LED uptime.
        -- 2^20/100MHz = 10.5 ms
        WIDTH => LED_UPTIME
    )
    port map(
        CLK => CLK,
        SIG => MULTI14,
        LED => LED14
    );
    
    multi_15_blink: entity work.LED_prolongation
    generic map (
        -- CLK Speed is 100 MHz, for example 2^29/100MHz = 5.37 seconds LED uptime.
        -- 2^20/100MHz = 10.5 ms
        WIDTH => LED_UPTIME
    )
    port map(
        CLK => CLK,
        SIG => MULTI15,
        LED => LED15
    );
    
    multi_16_blink: entity work.LED_prolongation
    generic map (
        -- CLK Speed is 100 MHz, for example 2^29/100MHz = 5.37 seconds LED uptime.
        -- 2^20/100MHz = 10.5 ms
        WIDTH => LED_UPTIME
    )
    port map(
        CLK => CLK,
        SIG => MULTI16,
        LED => LED16
    );
end Behavioral;
