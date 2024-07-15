--------------------------------------------------------------------------------
----                                                                        ----
---- This file is part of the yaVGA project                                 ----
---- http://www.opencores.org/?do=project&who=yavga                         ----
----                                                                        ----
---- Description                                                            ----
---- Implementation of yaVGA IP core                                        ----
----                                                                        ----
---- To Do:                                                                 ----
----                                                                        ----
----                                                                        ----
---- Author(s):                                                             ----
---- Sandro Amato, sdroamt@netscape.net                                     ----
----                                                                        ----
--------------------------------------------------------------------------------
----                                                                        ----
---- Copyright (c) 2009, Sandro Amato                                       ----
---- All rights reserved.                                                   ----
----                                                                        ----
---- Redistribution  and  use in  source  and binary forms, with or without ----
---- modification,  are  permitted  provided that  the following conditions ----
---- are met:                                                               ----
----                                                                        ----
----     * Redistributions  of  source  code  must  retain the above        ----
----       copyright   notice,  this  list  of  conditions  and  the        ----
----       following disclaimer.                                            ----
----     * Redistributions  in  binary form must reproduce the above        ----
----       copyright   notice,  this  list  of  conditions  and  the        ----
----       following  disclaimer in  the documentation and/or  other        ----
----       materials provided with the distribution.                        ----
----     * Neither  the  name  of  SANDRO AMATO nor the names of its        ----
----       contributors may be used to  endorse or  promote products        ----
----       derived from this software without specific prior written        ----
----       permission.                                                      ----
----                                                                        ----
---- THIS SOFTWARE IS PROVIDED  BY THE COPYRIGHT  HOLDERS AND  CONTRIBUTORS ----
---- "AS IS"  AND  ANY EXPRESS OR  IMPLIED  WARRANTIES, INCLUDING,  BUT NOT ----
---- LIMITED  TO, THE  IMPLIED  WARRANTIES  OF MERCHANTABILITY  AND FITNESS ----
---- FOR  A PARTICULAR  PURPOSE  ARE  DISCLAIMED. IN  NO  EVENT  SHALL  THE ----
---- COPYRIGHT  OWNER  OR CONTRIBUTORS  BE LIABLE FOR ANY DIRECT, INDIRECT, ----
---- INCIDENTAL,  SPECIAL,  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, ----
---- BUT  NOT LIMITED  TO,  PROCUREMENT OF  SUBSTITUTE  GOODS  OR SERVICES; ----
---- LOSS  OF  USE,  DATA,  OR PROFITS;  OR  BUSINESS INTERRUPTION) HOWEVER ----
---- CAUSED  AND  ON  ANY THEORY  OF LIABILITY, WHETHER IN CONTRACT, STRICT ----
---- LIABILITY,  OR  TORT  (INCLUDING  NEGLIGENCE  OR OTHERWISE) ARISING IN ----
---- ANY  WAY OUT  OF THE  USE  OF  THIS  SOFTWARE,  EVEN IF ADVISED OF THE ----
---- POSSIBILITY OF SUCH DAMAGE.                                            ----
--------------------------------------------------------------------------------
 
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
 
use work.yavga_pkg.all;
 
--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;
 
entity waveform_RAM is
  port (
    i_DIA    : in  std_logic_vector(c_WAVFRM_DATA_BUS_W - 1 downto 0);  -- 16-bit Data Input
    -- i_DIPA   : in std_logic;                       -- 2-bit parity Input
    -- i_ENA    : in std_logic;                       -- RAM Enable Input
    i_WEA    : in  std_logic;           -- Write Enable Input
    -- i_SSRA   : in std_logic;                       -- Synchronous Set/Reset Input
    i_clockA : in  std_logic;           -- Clock
    i_ADDRA  : in  std_logic_vector(c_WAVFRM_ADDR_BUS_W - 1 downto 0);  -- 10-bit Address Input
    --o_DOA     : out std_logic_vector(c_WAVFRM_DATA_BUS_W - 1 downto 0);  -- 16-bit Data Output
    -- o_DOPA   : out std_logic                       -- 2-bit parity Output
    --
    i_DIB    : in  std_logic_vector(c_WAVFRM_DATA_BUS_W - 1 downto 0);  -- 16-bit Data Input
    -- i_DIPB   : in std_logic;                       -- 2-bit parity Input
    -- i_ENB    : in std_logic;                       -- RAM Enable Input
    i_WEB    : in  std_logic;           -- Write Enable Input
    -- i_SSRB   : in std_logic;                       -- Synchronous Set/Reset Input
    i_clockB : in  std_logic;           -- Clock
    i_ADDRB  : in  std_logic_vector(c_WAVFRM_ADDR_BUS_W - 1 downto 0);  -- 10-bit Address Input
    o_DOB    : out std_logic_vector(c_WAVFRM_DATA_BUS_W - 1 downto 0)  -- 16-bit Data Output
    -- o_DOPB   : out std_logic                       -- 2-bit parity Output
    );
end waveform_RAM;
 
architecture Behavioral of waveform_RAM is
 
  constant c_ram_size : natural := 2**(c_WAVFRM_ADDR_BUS_W);
 
  type t_ram is array (c_ram_size-1 downto 0) of
    std_logic_vector (c_WAVFRM_DATA_BUS_W - 1 downto 0);
 
  shared variable v_ram : t_ram := (
    0      => X"1000" or X"0000", 
    others => X"1000" or X"0000"
    );
 
begin
  -- wave form or video-line memory
  -- |------| |-------------------------------------------|
  -- | P  P | |  D  D  D |  D  D  D | D D D D D D D D D D |
  -- |======| |===========================================|
  -- |17 16 | | 15 14 13 | 12 11 10 | 9 8 7 6 5 4 3 2 1 0 |
  -- |======| |===========================================|
  -- | Free | |  Reserv. |  R  G  B |      vert. pos.     |
  -- |------| |-------------------------------------------|
  --
 
 
  p_rw0_port : process (i_clockA)
  begin
    if rising_edge(i_clockA) then
      if (true) then
        if (i_WEA = '1') then
          v_ram(conv_integer(i_ADDRA)) := i_DIA;
        end if;
        --o_DOA <= v_ram(conv_integer(i_ADDRA));
      end if;
    end if;
  end process;
 
  p_rw1_port : process (i_clockB)
  begin
    if rising_edge(i_clockB) then
      if (true) then
        o_DOB <= v_ram(conv_integer(i_ADDRB));
        if (i_WEB = '1') then
          v_ram(conv_integer(i_ADDRB)) := i_DIB;
        end if;
      end if;
    end if;
  end process;
 
end Behavioral;