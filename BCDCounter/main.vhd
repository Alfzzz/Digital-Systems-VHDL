library ieee;
use IEEE.std_logic_1164.All;
use IEEE.std_logic_unsigned.All;

entity main is
	Port(
		KEY:in std_logic_vector	(0 downto 0);
		SW:in std_logic_vector(6 downto 0);
		LEDR: out std_logic_vector(3 downto 0)
	);
end entity main;

architecture BeH of main is
	component BCDCounter
	Generic(
		tem:integer
	);
	port(
		clk: in std_logic;
		reset:in std_logic;
		load: in std_logic;
		data:in std_logic_vector(tem downto 0);
		counter: out std_logic_vector(tem downto 0)	
	);
	end component BCDCounter;
	begin
	
	o1: BCDCounter generic map(3) port map(KEY(0),SW(1),SW(2),SW(6 downto 3),LEDR(3 DOWNto 0));
end BeH;