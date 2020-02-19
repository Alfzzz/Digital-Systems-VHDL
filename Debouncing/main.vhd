library ieee;
use IEEE.std_logic_1164.All;
use IEEE.std_logic_unsigned.All;

entity main is
	Port(
		KEY:in std_logic_vector	(0 downto 0);
		CLOCK_50: in std_logic;
		LEDR: out std_logic_vector(0 downto 0);
		sw: in std_logic_vector(5 downto 0);
		LEDG: out std_logic_vector(3 downto 0)
		
	);
end entity main;

architecture BeH of main is
	signal aux:std_logic;
	signal aux2:std_logic;
	component Debouncing is
	port(
		clk: in std_logic;
		bttn_in: in std_logic;
		bttn_out: out std_logic;
		reset: in std_logic;
		bttn_BCD: out std_logic
	);
	end component Debouncing;
	
	
	component BCDCounter is
	Generic(
		tem:INTEGER
	);
	Port(
		clk_bcd: in std_logic;
		reset_bcd:in std_logic;
		load: in std_logic;
		data:in std_logic_vector(tem downto 0);
		counter: out std_logic_vector(tem downto 0)
	);
	end component BCDCounter;	
	begin
	aux2<=
		'1'when aux='1' and KEY(0)='0'else
		'0';
	
	u1: Debouncing port map(CLOCK_50,KEY(0),lEDR(0),sw(0),aux);
	u2: BCDCounter generic map(3) port map(aux2,sw(0),sw(1),sw(5 downto 2),LEDG(3 downto 0));
end BeH;