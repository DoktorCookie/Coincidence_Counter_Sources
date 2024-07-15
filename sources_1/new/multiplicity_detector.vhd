

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
Library UNISIM;
use UNISIM.vcomponents.all;



entity multiplicity_detector is
    generic(
        COINCIDENCE_LENGTH : integer := 3;
        LED_UPTIME : integer := 20
    );  
    port (
    
        --Clock
        CLK : in std_logic ;
        --Signal Inputs
        Sig1 : in std_logic ;
        Sig2 : in std_logic ;
        Sig3 : in std_logic ;
        Sig4 : in std_logic ;
        Sig5 : in std_logic ;
        Sig6 : in std_logic ;
        Sig7 : in std_logic ;
        Sig8 : in std_logic ;
        Sig9 : in std_logic ;
        Sig10 : in std_logic ;
        Sig11 : in std_logic ;
        Sig12 : in std_logic ;
        Sig13 : in std_logic ;
        Sig14 : in std_logic ;
        Sig15 : in std_logic ;
        Sig16 : in std_logic ;        
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
        LED16 : out std_logic := '0';
        --VGA SIGNALS
        vgaRed0 : out std_logic := '0';
        vgaRed1 : out std_logic := '0';
        vgaRed2 : out std_logic := '0';
        vgaRed3 : out std_logic := '0';
        vgaBlue0 : out std_logic := '0';
        vgaBlue1 : out std_logic := '0';
        vgaBlue2 : out std_logic := '0';
        vgaBlue3 : out std_logic := '0';
        vgaGreen0 : out std_logic := '0';
        vgaGreen1 : out std_logic := '0';
        vgaGreen2 : out std_logic := '0';
        vgaGreen3 : out std_logic := '0';
        
        Hsync : out std_logic := '0';
        Vsync : out std_logic := '0'

    ) ;
end multiplicity_detector;

    --DONE #1 Signalverl�ngerer in Clipper --> implemented and tested
    --DONE #1a Copy and Paste Signal Length Control for all Signals
    
    --DONE #2 Einfache Koinzidenzlogik (max counter und wegschreiben wenn wieder auf 0)
    --DONE #3a LED-Blink und Signal Length (up to 16 times...) in one more sub-routine each
    --DONE#3 For 16 signals, no switches
    --#4 variables for coincidences to count
    --#5 Output of counts? Display?
    --#6 Cyclecount Catch on rising edge/ timestemping
    --#7 Rate Calc

architecture Behavioral of multiplicity_detector is
    --signals for different multiplicities, mainly used for blinking LEDs
    signal multi_1 :  std_logic ;
    signal multi_2 : std_logic ;
    signal multi_3 : std_logic ;
    signal multi_4 : std_logic ;
    signal multi_5 : std_logic ;
    signal multi_6 : std_logic ;
    signal multi_7 : std_logic ;
    signal multi_8 : std_logic ;
    signal multi_9 : std_logic ;
    signal multi_10 : std_logic ;
    signal multi_11 : std_logic ;
    signal multi_12 : std_logic ;
    signal multi_13 : std_logic ;
    signal multi_14 : std_logic ;
    signal multi_15 : std_logic ;
    signal multi_16: std_logic ;
    --Signal cut to one clock cycle
    signal sig1_cut :  std_logic ;
    signal sig2_cut :  std_logic ;
    signal sig3_cut :  std_logic ;
    signal sig4_cut :  std_logic ;
    signal sig5_cut :  std_logic ;
    signal sig6_cut :  std_logic ;
    signal sig7_cut :  std_logic ;
    signal sig8_cut :  std_logic ;
    signal sig9_cut :  std_logic ;
    signal sig10_cut :  std_logic ;
    signal sig11_cut :  std_logic ;
    signal sig12_cut :  std_logic ;
    signal sig13_cut :  std_logic ;
    signal sig14_cut :  std_logic ;
    signal sig15_cut :  std_logic ;
    signal sig16_cut :  std_logic ;

    -- counters for multiplicities
    signal counter_multi_1 : unsigned(31 downto 0) := "00000000000000000000000000000000";
    signal counter_multi_2 : unsigned(31 downto 0) := "00000000000000000000000000000000";
    signal counter_multi_3 : unsigned(31 downto 0) := "00000000000000000000000000000000";
    
    -- halfed clock for vga
    signal clock_50MHz : std_logic;
    
    -- uniform color signals
    signal red :std_logic;
    signal blue :std_logic;
    signal green :std_logic;
    
begin   
    
    
    
    -- This 50 MHz clock is actually a clock-halfer, so changing the CLK-clock will make changes to this part necessary
    clock_50MHz_vga : entity work.clk_50_MHz
    port map (
        CLK => CLK,
        CLK_HALF => clock_50MHz
    );
    
    
    -- Uses the YAVGA VGA Controller
    vga_display_output: entity work.s3e_starter_1600k
    port map (
        CLK => CLK,
        CNT1 => std_logic_vector(counter_multi_1),
        CNT2 => std_logic_vector(counter_multi_2),
        CNT3 => std_logic_vector(counter_multi_3),
        i_clk => clock_50MHz,        --i_clk   : in  std_logic;     --Needs 50 MHz
        o_hsync => Hsync,     --o_hsync : out std_logic;
        o_vsync => Vsync,        --o_vsync : out std_logic;
        o_r => red,        --o_r     : out std_logic;
        o_g => green,        --o_g     : out std_logic;
        o_b => blue        --o_b     : out std_logic
    );
    
    -- routes RGB color outputs from one per channel to four per channel. 
    -- The current configuration also forces the display color to purple because why not
    vgaRed0 <= green;
    vgaRed1 <= green;
    vgaRed2 <= green;
    vgaRed3 <= green;
    
    vgaBlue0 <= green;
    vgaBlue1 <= green;
    vgaBlue2 <= green;
    vgaBlue3 <= green;
    
    vgaGreen0 <= red;
    vgaGreen1 <= red;
    vgaGreen2 <= red;
    vgaGreen3 <= red;
  
  
  
  
    -- This manually configures signal length for coincidence logic.
    -- For signal length if one cicle use signal_cutter (ignores any WIDTH), change in sub-routine.
    -- for 2 or more use signal length control (dt = 2^WIDTH/100MHz).
    -- The outgoing signal doesn't look very well, but even the 1 cycle signal which looks like a spike without
    -- a plateau still triggers the LED, so it should be fine.
    -- The outgoing signal is delayed by ~3 cycles or so. This is the same for both functions.
    -- Signal Length is controlled with COINCIDENCE_LENGTH parameter
    
    
    signal_length_control_sub: entity work.signal_length_control_hub
    generic map (
        COINCIDENCE_LENGTH => COINCIDENCE_LENGTH        
    )
    port map (
        CLK => CLK ,
        
        SIG1 => Sig1 ,
        SIG2 => Sig2 ,
        SIG3 => Sig3 ,
        SIG4 => Sig4 ,
        SIG5 => Sig5 ,
        SIG6 => Sig6 ,
        SIG7 => Sig7 ,
        SIG8 => Sig8 ,
        SIG9 => Sig9 ,
        SIG10 => Sig10 ,
        SIG11 => Sig11 ,
        SIG12 => Sig12 ,
        SIG13 => Sig13 ,
        SIG14 => Sig14 ,
        SIG15 => Sig15 ,
        SIG16 => Sig16 ,
        
        SIG1CUT => sig1_cut ,
        SIG2CUT => sig2_cut ,
        SIG3CUT => sig3_cut ,
        SIG4CUT => sig4_cut ,
        SIG5CUT => sig5_cut ,
        SIG6CUT => sig6_cut ,
        SIG7CUT => sig7_cut ,
        SIG8CUT => sig8_cut ,
        SIG9CUT => sig9_cut ,
        SIG10CUT => sig10_cut ,
        SIG11CUT => sig11_cut ,
        SIG12CUT => sig12_cut ,
        SIG13CUT => sig13_cut ,
        SIG14CUT => sig14_cut ,
        SIG15CUT => sig15_cut ,
        SIG16CUT => sig16_cut 
    );
   
    
    --This is the part which detects coincidences/multiplicity of signals
    count_multiplicity_sub: entity work.multiplicity_counter
    port map(
        
        SIG1 => sig1_cut,
        SIG2 => sig2_cut,
        SIG3 => sig3_cut,
        SIG4 => sig4_cut,
        SIG5 => sig5_cut,
        SIG6 => sig6_cut,
        SIG7 => sig7_cut,
        SIG8 => sig8_cut,
        SIG9 => sig9_cut,
        SIG10 => sig10_cut,
        SIG11 => sig11_cut,
        SIG12 => sig12_cut,
        SIG13 => sig13_cut,
        SIG14 => sig14_cut,
        SIG15 => sig15_cut,
        SIG16 => sig16_cut,
        

        MULTI1 => multi_1,
        MULTI2 => multi_2,
        MULTI3 => multi_3,
        MULTI4 => multi_4,
        MULTI5 => multi_5,
        MULTI6 => multi_6,
        MULTI7 => multi_7,
        MULTI8 => multi_8,
        MULTI9 => multi_9,
        MULTI10 => multi_10,
        MULTI11 => multi_11,
        MULTI12 => multi_12,
        MULTI13 => multi_13,
        MULTI14 => multi_14,
        MULTI15 => multi_15,
        MULTI16 => multi_16,
        
        COUNTERMULTI1 => counter_multi_1,
        COUNTERMULTI2 => counter_multi_2,
        COUNTERMULTI3 => counter_multi_3,
        
        CLK => CLK
    );
    
    
    -- causes the corresponding LED to blink for (2^LED_UPTIME / 100MHz) if a multiplicity signal is incoming
    led_blink_control_sub: entity work.led_blink_control
    generic map(
        LED_UPTIME => LED_UPTIME
    )
    port map (
        CLK => CLK,
        --Incoming Multiplicity Signals
        MULTI1 => multi_1,
        MULTI2 => multi_2,
        MULTI3 => multi_3,
        MULTI4 => multi_4,
        MULTI5 => multi_5,
        MULTI6 => multi_6,
        MULTI7 => multi_7,
        MULTI8 => multi_8,
        MULTI9 => multi_9,
        MULTI10 => multi_10,
        MULTI11 => multi_11,
        MULTI12 => multi_12,
        MULTI13 => multi_13,
        MULTI14 => multi_14,
        MULTI15 => multi_15,
        MULTI16 => multi_16,
        
        --Single Event Output for testing
        LED1 => LED1,
        LED2 => LED2,
        LED3 => LED3,
        LED4 => LED4,
        LED5 => LED5,
        LED6 => LED6,
        LED7 => LED7,
        LED8 => LED8,
        LED9 => LED9,
        LED10 => LED10,
        LED11 => LED11,
        LED12 => LED12,
        LED13 => LED13,
        LED14 => LED14,
        LED15 => LED15,
        LED16 => LED16
    );



    --Sig1out <= sig1_cut;

    process (CLK) is
    begin
    
        if rising_edge (CLK) then
        
            --The switches can overwrite the input to set them permanent high for testing stuff
            --Wenn nicht verbunden sind die Pin Inputs anscheinend auf high
            --sig1_a_or <= A or ( sig1_cut);
            --sig1_a_or <= A or (  Sig1);
            --sig2_b_or <= B or (  Sig2);
            --sig3_c_or <= C or (not Sig3);
            
            
            --multiplicities signal for LEDs
            --now generated through entity multiplicity_counter
            --multi_1 <= sig1_cut or sig2_cut or sig3_cut;
            --multi_2 <= (sig1_cut and sig2_cut) or (sig2_cut and sig3_cut) or (sig1_cut and sig3_cut);
            --multi_3 <= sig1_cut and sig2_cut and sig3_cut;
            
        end if;

    
    end process;

    
    
    
    
    
   
end Behavioral;
