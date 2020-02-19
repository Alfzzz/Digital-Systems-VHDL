library IEEE;
	use IEEE.STD_LOGIC_1164.all;
--comentarios
entity main is
	port(
	SW: in std_logic_vector(7 downto 0);
	LEDR: out std_logic_vector(4 downto 0)
	);
end main;

architecture BeH of main is	
	--Signals, Constants,Components, Signal Types
		signal C0,C1,C2,C3 :std_logic;	

	component fullAdder is
		port(
		a,b, cin: in std_logic;
		s: out std_logic
		);
		end component fullAdder;
		
	begin
	--Behavioral
	C0<=(sw(4)and sw(0));
	C1<=(sw(5)and sw(1)) or ((sw(5)xor sw(1))and (sw(4)and sw(0)));
	C2<=(sw(6)and sw(2)) or ((sw(6)xor sw(2))and ((sw(5)and sw(1)) or ((sw(5)xor sw(1))and (sw(4)and sw(0))))	);
	C3<=(sw(7)and sw(3)) or ((sw(7)xor sw(3))and ((sw(6)and sw(2)) or ((sw(6)xor sw(2))and ((sw(5)and sw(1)) or ((sw(5)xor sw(1))and (sw(4)and sw(0))))	)));
	LEDR(4)<=c3;
	u0: fullAdder port map(SW(4),sw(0),'0',LEDR(0));
	u1: fullAdder port map(SW(5),sw(1),C0,LEDR(1));
	u2: fullAdder port map(SW(6),sw(2),C1,LEDR(2));
	u3: fullAdder port map(SW(7),sw(3),C2,LEDR(3));
	
	
	end BeH;