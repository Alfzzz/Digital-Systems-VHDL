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
	
	process(i,e)begin
	if i="000" and e="001" then
		o0<='0';
	else
		o0<='1';
	end if;
	if i="001" and e="001" then
		o1<='0';
	else
		o1<='1';
	end if;
	if i="010" and e="001" then
		o2<='0';
	else
		o2<='1';
	end if;
	if i="011" and e="001" then
		o3<='0';
	else
		o3<='1';
	end if;
	if i="100" and e="001" then
		o4<='0';
	else
		o4<='1';
	end if;
	if i="101" and e="001" then
		o5<='0';
	else
		o5<='1';
	end if;
	if i="110" and e="001" then
		o6<='0';
	else
		o6<='1';
	end if;
	if i="111" and e="001" then
		o7<='0';
	else
		o7<='1';
	end if;
	end process;	
	end BeH;
	
	