use IEEE.STD_LOGIC_UNSIGNED.ALL;
LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity main is
	Port(
		UART_RXD:in std_logic;
		CLOCK_50: in std_logic;
		LEDR: out std_logic_vector(7 downto 0);
		VGA_R: OUT std_logic_vector(7 downto 0);
		VGA_G: out std_logic_vector(7 downto 0);
		VGA_B: out std_logic_vector(7 downto 0);
		VGA_HS: out std_logic;
		VGA_VS: out std_logic;
		VGA_BLANK_N: out std_logic;
		VGA_SYNC_N: out std_logic;
		VGA_CLK: out std_logic;
		SW:in std_logic_vector(17 downto 0);
		--Para HEX
		LEDG:out std_LOGIC_VECTOR(3 downto 0);
		HEX0: out std_logic_VECTOR(6 downto 0);
		--Para LCD
		KEY:in std_logic_vector	(0 downto 0);
		LCD_EN:out STD_logic;
		LCD_RS:out STD_logic;
		LCD_RW:out STD_logic;
		LCD_DATA:inout STD_logic_vector(7 downto 0);
		LCD_ON:out std_logic;
		LCD_BLON:out std_logic
		
		
	);
end entity main;

architecture BeH of main is
	component UART_RX is
  generic (
    clks_p_bit: integer :=2604      -- 50MHz/9600 Clocks per each bit
    );
  port (
    clk      : in  std_logic;
    rx : in  std_logic;
    byte   : out std_logic_vector(7 downto 0);
	 reset:in std_logic;
	 position:out std_logic_vector(3 downto 0)
    );	
	end component;

	component VGASignalGenerator IS
		PORT(
		clk	:	IN		STD_LOGIC;	
		HS		:	OUT	STD_LOGIC;	
		VS		:	OUT	STD_LOGIC;	
		dis_EN		:	OUT	STD_LOGIC;
		x:out integer;
		y:out integer
	);	
 end component VGASignalGenerator;
 
	component ImgGenerator IS
  PORT(
    dis_EN :  IN   STD_LOGIC;  
    red      :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);  
    green    :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0) ; 
    blue     :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
	 SW_Red:in std_LOGIC_VECTOR(7 downto 0);
	 SW_Blue:in std_LOGIC_VECTOR(7 downto 0);
	 x:in integer;
	 y:in integer;
	 --SW_Green:in std_LOGIC_VECTOR(7 downto 0);
	 byte: in std_LOGIC_VECTOR(7 downto 0);
	 position:in std_logic_vector(3 downto 0)
	 );
	end component ImgGenerator;
 
	
	component FrequencyDiv is
	Generic(
		freq:INTEGER
	);
	Port(
		clk: in std_logic;
		clk_out:out std_logic
	);
	end component FrequencyDiv;
	
	component bcd2seg is port(
e: in std_logic_vector(3 downto 0);
s: out std_logic_vector(6 downto 0)
);
end component bcd2seg;
	
	component LCD_Color is
	Port(
		clk: in std_logic;
		data: out std_logic_vector(7 downto 0);
		enable: out std_logic;
		rs: out std_logic;
		rw: out std_logic;
		reset:in std_logic;
		position: in std_logic_vector(3 downto 0)
		);
	end component LCD_Color;
	
	signal signal_clk,signal_EN: std_logic;
	signal signal_x,signal_y:integer;
	signal sigByte: std_LOGIC_VECTOR(7 downto 0);
	signal signal_position: std_logic_vector(3 downto 0);
	signal num_bin: std_LOGIC_VECTOR(8 downto 0);
	--señales para LCD
	signal sig_clk_1k:std_logic;
	signal sig_EN_Wri:std_logic;
	signal sig_RW_Wri:std_logic;
	signal sig_RS_Wri:std_logic;
	signal sig_data:std_logic_vector(7downto 0);
	begin
	
	
	--Configuración para LCD
	LCD_DATA(7 downto 0)<=sig_data;
	LCD_EN<=sig_EN_Wri;
	LCD_RS<=sig_RS_Wri;
	LCD_RW<=sig_RW_Wri;
	LCD_ON<='1';
	LCD_BLON<='0';
	
	
	--Confguración para VGA
	VGA_BLANK_N<='1';
	VGA_SYNC_N<='0';
	VGA_CLK<=signal_clk;

	LEDG<=signal_position;
		
	u0 :FrequencyDiv generic map(0) port map(CLOCK_50,signal_clk);--25MHz
	u1: UART_RX generic map(2604)port map(signal_clk,UART_RXD,sigByte,SW(0),signal_position);
	u2 :VGAsignalGenerator port map(signal_clk,VGA_HS,VGA_VS,signal_EN,signal_x,signal_y);
	u3: ImgGenerator port map(signal_EN,VGA_R,VGA_G,VGA_B,SW(17 downto 10),SW(9 downto 2),signal_x,signal_y,sigByte,signal_position);
	--Port map para 7 seg
	u4: bcd2seg port map(SIGnal_position,HEX0);
	--Port map para LCD
	u5: FrequencyDiv generic map(24999) port map(CLOCK_50,sig_clk_1k);
	u6: LCD_Color port map(sig_clk_1k,sig_data,sig_EN_Wri,sig_RS_Wri,sig_RW_Wri,SW(0),signal_position);
	LEDR<=sigByte;
end BeH;