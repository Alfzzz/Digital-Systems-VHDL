library IEEE;
	use IEEE.STD_LOGIC_1164.all;
--comentarios
entity ic74151 is
	port(
	e: in std_logic;
	s: in std_logic_vector(2 downto 0);
	i:in std_logic_vector(7 downto 0);
	o2,o1:out std_logic
	);
end ic74151;

architecture BeH of ic74151 is	

	begin
	o2<=i(0) when e='0' and s="000" else
		i(1) when e='0' and s="001" else
		i(2) when e='0' and s="010" else
		i(3) when e='0' and s="011" else
		i(4) when e='0' and s="100" else
		i(5) when e='0' and s="101" else
		i(6) when e='0' and s="110" else
		i(7) when e='0' and s="111" else
	'1';
	o1<=not i(0) when e='0' and s="000" else
		not i(1) when e='0' and s="001" else
		not i(2) when e='0' and s="010" else
		not i(3) when e='0' and s="011" else
		not i(4) when e='0' and s="100" else
		not i(5) when e='0' and s="101" else
		not i(6) when e='0' and s="110" else
		not i(7) when e='0' and s="111" else
	'0';
	end BeH;
	