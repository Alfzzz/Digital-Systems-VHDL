library ieee;
	use ieee.std_logic_1164.all;
entity main is
	port(
	SW: in std_logic_vector(5 downto 0);
	LEDR:out std_logic_VECTOR(7 downto 0)
	);
	end main;
architecture BeHMain of main is

	component ic74138 is
		port(
		e: in std_logic_vector(2 downto 0);
		i: in std_logic_vector(2 downto 0);
		o0,o1,o2,o3,o4,o5,o6,o7:out std_logic
		);
		end component ic74138;
	
	begin
	
		
		u: ic74138 port map (e(0)=>SW(0),e(1)=>SW(1),e(2)=>SW(2),i(0)=>SW(3),i(1)=>SW(4),i(2)=>SW(5),o0=>LEDR(0),o1=>LEDR(1),o2=>LEDR(2),o3=>LEDR(3),o4=>LEDR(4),o5=>LEDR(5),o6=>LEDR(6),o7=>LEDR(7));

	
	end BeHMain;