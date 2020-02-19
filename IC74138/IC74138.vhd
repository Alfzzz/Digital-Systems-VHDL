	library IEEE;
	use IEEE.STD_LOGIC_1164.all;
--comentarios
entity ic74138 is
	port(
	e: in std_logic_vector(2 downto 0);
	i: in std_logic_vector(2 downto 0);
	o0,o1,o2,o3,o4,o5,o6,o7:out std_logic
	);
end ic74138;

architecture BeH of ic74138 is	

	begin
	o0<='0' when i="000" and e="001" else
	'1';	
	o1<='0' when i="001" and e="001" else
	'1';
	o2<='0' when i="010" and e="001" else
	'1';
	o3<='0' when i="011" and e="001" else
	'1';
	o4<='0' when i="100" and e="001" else
	'1';
	o5<='0' when i="101" and e="001" else
	'1';
	o6<='0' when i="110" and e="001" else
	'1';
	o7<='0' when i="111" and e="001" else
	'1';	
	end BeH;
	
	