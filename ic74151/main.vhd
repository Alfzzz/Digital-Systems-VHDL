library IEEE;
	use IEEE.STD_LOGIC_1164.all;
--comentarios
entity main is
	port(
	SW: in std_logic_vector(11 downto 0);
	LEDR:out std_logic_vector(1 downto 0)
	);
end main;

architecture BeH of main is	

	component ic74151 is port(
	e: in std_logic;
	s: in std_logic_vector(2 downto 0);
	i:in std_logic_vector(7 downto 0);
	o2,o1:out std_logic
	);
	end component ic74151;
	
	begin
	
	u:ic74151 port map(e=>SW(0),S(0)=>SW(1),S(1)=>SW(2),S(2)=>SW(3),i(0)=>SW(4),i(1)=>SW(5),i(2)=>SW(6),i(3)=>SW(7),i(4)=>SW(8),i(5)=>SW(9),i(6)=>SW(10),i(7)=>SW(11),o2=>LEDR(0),o1=>LEDR(1));
	
	end BeH;