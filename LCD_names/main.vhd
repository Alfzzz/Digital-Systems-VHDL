library ieee;
use IEEE.std_logic_1164.All;
use IEEE.std_logic_unsigned.All;

entity main is
	Port(
		KEY:in std_logic_vector	(0 downto 0);
		CLOCK_50: in std_logic;
		LCD_EN:out STD_logic;
		LCD_RS:out STD_logic;
		LCD_RW:out STD_logic;
		LCD_DATA:inout STD_logic_vector(7 downto 0);
		LCD_ON:out std_logic;
		LCD_BLON:out std_logic;
		SW:in std_logic_vector(1 downto 0);
		LEDG:out std_logic_vector(2 downto 0)
		)
		;
end entity main;

architecture BeH of main is
	signal sig_clk:std_logic;
	signal sig_EN_Wri:std_logic;
	signal sig_RW_Wri:std_logic;
	signal sig_RS_Wri:std_logic;
	signal sig_data:std_logic_vector(7downto 0);
	
	component FreqDiv is
	Generic(
		--Frequency of 1k -------->50MHz/(2000)-1=24999
		freq:INTEGER
	);
	Port(
		clk: in std_logic;
		clk_out:out std_logic
	);
	end component FreqDiv;
	
	component Writting is
	Port(
		clk: in std_logic;
		bttn: in std_logic;
		data: out std_logic_vector(7 downto 0);
		enable: out std_logic;
		rs: out std_logic;
		rw: out std_logic;
		reset:in std_logic	
		);
	end component Writting;
	
	begin
	LCD_DATA(7 downto 0)<=sig_data;
		
	LCD_EN<=sig_EN_Wri;
	
	LCD_RS<=sig_RS_Wri;
	
	LCD_RW<=sig_RW_Wri;
		
	LCD_ON<='1';
	LCD_BLON<='0';
	
	LEDG(2 downto 0)<=sig_EN_Wri&sig_RS_Wri&sig_RW_Wri;
	
	
	u1: FreqDiv generic map(24999) port map(CLOCK_50,sig_clk);
	u3: Writting port map(sig_clk,NOT KEY(0),sig_data,sig_EN_Wri,sig_RS_Wri,sig_RW_Wri,SW(0));
end BeH;