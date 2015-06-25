--Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:24:04 MST 2014
--Date        : Sat Feb 21 09:53:18 2015
--Host        : dodo-PC running 64-bit Service Pack 1  (build 7601)
--Command     : generate_target miniarm_wrapper.bd
--Design      : miniarm_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all; 
use ieee.std_logic_arith.all;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity led_top is
  port (
    ------------------- global clock input
    SYS_CLK : IN STD_LOGIC ; 
    --------------------------------------
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_cas_n : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    ------------------- GE interface
    GMII_TX_EN							: out std_logic;
    GMII_TX_ER 							: out std_logic;
    GMII_TXD							: out std_logic_vector(7 downto 0);
    GMII_TXCLK							: in STD_LOGIC ;
    GMII_GTXCLK							: out STD_LOGIC ;
    GMII_RXD 							: in std_logic_vector(7 downto 0);
    GMII_RX_ER 							: in std_logic;
    GMII_RX_DV 							: in std_logic;
    GMII_RXCLK							: in std_logic;	
    GMII_MDIO							: inout std_logic;
    GMII_MDIO_MDC						: out std_logic;
    GMII_GE_IND							: in std_logic;	
    ------------------- test interface
    TEST_LED							: out std_logic_vector(3 downto 0)  );
end led_top;

architecture top of led_top is
  
  component miniarm_wrapper is
    port (
    BRAM_PORTA_addr : out STD_LOGIC_VECTOR ( 17 downto 0 );
    BRAM_PORTA_clk : out STD_LOGIC;
    BRAM_PORTA_din : out STD_LOGIC_VECTOR ( 31 downto 0 );
    BRAM_PORTA_dout : in STD_LOGIC_VECTOR ( 31 downto 0 );
    BRAM_PORTA_en : out STD_LOGIC;
    BRAM_PORTA_rst : out STD_LOGIC;
    BRAM_PORTA_we : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_cas_n : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    ENET0_GMII_RXD : in STD_LOGIC_VECTOR ( 7 downto 0 );
    ENET0_GMII_RX_CLK : in STD_LOGIC;
    ENET0_GMII_RX_DV : in STD_LOGIC;
    ENET0_GMII_RX_ER : in STD_LOGIC;
    ENET0_GMII_TXD : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ENET0_GMII_TX_CLK : in STD_LOGIC;
    ENET0_GMII_TX_EN : out STD_LOGIC_VECTOR ( 0 to 0 );
    ENET0_GMII_TX_ER : out STD_LOGIC_VECTOR ( 0 to 0 );
    ENET0_MDIO_I : in STD_LOGIC;
    ENET0_MDIO_MDC : out STD_LOGIC;
    ENET0_MDIO_O : out STD_LOGIC;
    ENET0_MDIO_T : out STD_LOGIC;
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    test_led_tri_o : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  end component miniarm_wrapper;
  
  component IOBUF is
    port(
    I : in STD_LOGIC;
    O : out STD_LOGIC;
    T : in STD_LOGIC;
    IO : inout STD_LOGIC
  );
  end component;
  component clk_wiz_0 is
  port (
    clk_in1 : in STD_LOGIC;
    clk_out1 : out STD_LOGIC;
    locked : out STD_LOGIC;
    reset : in STD_LOGIC
  );
  end component clk_wiz_0;
signal clk_125M		: std_logic					:= '0';
signal pll_reset	: std_logic					:= '0';
signal pll_locked	: std_logic					:= '0';
signal ENET0_MDIO_O 	: std_logic					:= '0';
signal ENET0_MDIO_T 	: std_logic					:= '0';
signal ENET0_MDIO_I 	: std_logic					:= '0';
signal BRAM_PORTA_addr : STD_LOGIC_VECTOR ( 17 downto 0 );
signal BRAM_PORTA_clk : STD_LOGIC;
signal BRAM_PORTA_din : STD_LOGIC_VECTOR ( 31 downto 0 );
signal BRAM_PORTA_dout : STD_LOGIC_VECTOR ( 31 downto 0 );
signal BRAM_PORTA_en : STD_LOGIC;
signal BRAM_PORTA_rst : STD_LOGIC;
signal BRAM_PORTA_we : STD_LOGIC_VECTOR ( 3 downto 0 );

signal ENET0_GMII_TX_CLK : STD_LOGIC;
signal GMII_GE_IND_reg	: std_logic := '0';
signal GMII_GE_TIMER : std_logic_vector( 27 downto 0 );

begin

miniarm: component miniarm_wrapper
    port map (
      BRAM_PORTA_addr(17 downto 0) => BRAM_PORTA_addr(17 downto 0),
    BRAM_PORTA_clk => BRAM_PORTA_clk,
    BRAM_PORTA_din(31 downto 0) => BRAM_PORTA_din(31 downto 0),
    BRAM_PORTA_dout(31 downto 0) => BRAM_PORTA_dout(31 downto 0),
    BRAM_PORTA_en => BRAM_PORTA_en,
    BRAM_PORTA_rst => BRAM_PORTA_rst,
    BRAM_PORTA_we(3 downto 0) => BRAM_PORTA_we(3 downto 0),
      DDR_addr(14 downto 0) => DDR_addr(14 downto 0),
      DDR_ba(2 downto 0) => DDR_ba(2 downto 0),
      DDR_cas_n => DDR_cas_n,
      DDR_ck_n => DDR_ck_n,
      DDR_ck_p => DDR_ck_p,
      DDR_cke => DDR_cke,
      DDR_cs_n => DDR_cs_n,
      DDR_dm(3 downto 0) => DDR_dm(3 downto 0),
      DDR_dq(31 downto 0) => DDR_dq(31 downto 0),
      DDR_dqs_n(3 downto 0) => DDR_dqs_n(3 downto 0),
      DDR_dqs_p(3 downto 0) => DDR_dqs_p(3 downto 0),
      DDR_odt => DDR_odt,
      DDR_ras_n => DDR_ras_n,
      DDR_reset_n => DDR_reset_n,
      DDR_we_n => DDR_we_n,
      FIXED_IO_ddr_vrn => FIXED_IO_ddr_vrn,
      FIXED_IO_ddr_vrp => FIXED_IO_ddr_vrp,
      FIXED_IO_mio(53 downto 0) => FIXED_IO_mio(53 downto 0),
      FIXED_IO_ps_clk => FIXED_IO_ps_clk,
      FIXED_IO_ps_porb => FIXED_IO_ps_porb,
      FIXED_IO_ps_srstb => FIXED_IO_ps_srstb,
      ENET0_GMII_RXD(7 downto 0) => GMII_RXD(7 downto 0),
      ENET0_GMII_RX_CLK => GMII_RXCLK,
      ENET0_GMII_RX_DV => GMII_RX_DV,
      ENET0_GMII_RX_ER => GMII_RX_ER,
      ENET0_GMII_TXD(7 downto 0) => GMII_TXD(7 downto 0),
      ENET0_GMII_TX_CLK => ENET0_GMII_TX_CLK,
      ENET0_GMII_TX_EN(0) => GMII_TX_EN,
      ENET0_GMII_TX_ER(0) => GMII_TX_ER,
      ENET0_MDIO_I => ENET0_MDIO_I,
      ENET0_MDIO_MDC => GMII_MDIO_MDC,
      ENET0_MDIO_O => ENET0_MDIO_O,
      ENET0_MDIO_T => ENET0_MDIO_T,
      TEST_LED_tri_o(3 downto 0) => TEST_LED(3 downto 0)
   );
      
    -- GMII_MDIOµÄÈýÌ¬¼Ä´æÆ÷Íø¿Ú-----
GMII_MDIO_iobuf : IOBUF
    port map (
    I => ENET0_MDIO_O,
    IO => GMII_MDIO,
    O => ENET0_MDIO_I,
    T => ENET0_MDIO_T
  );


clk_125M_i: component clk_wiz_0
    port map (
      clk_out1 => clk_125M,
      clk_in1 => SYS_CLK,
      locked => pll_locked,
      reset => pll_reset
    );

Reg_GMII_GE_IND	: process(clk_125M)
begin
      if rising_edge(clk_125M) then
        if GMII_GE_IND = '1' then
            GMII_GE_IND_reg <= '1';
            GMII_GE_TIMER <= X"0000000";
        else
            if GMII_GE_TIMER = X"fffffff" then
                GMII_GE_IND_reg <= '0';
            else
                GMII_GE_TIMER <= GMII_GE_TIMER+1;
            end if;
        end if;
      end if;
end process;

GMII_GTXCLK <= clk_125M;	
ENET0_GMII_TX_CLK <= clk_125M when GMII_GE_IND_reg = '1' else GMII_TXCLK;

end top;
