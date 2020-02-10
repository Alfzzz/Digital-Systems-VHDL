library IEEE;
	use IEEE.STD_LOGIC_1164.all;
--comentarios
entity main is
	port(
	SW: in std_logic_vector(7 downto 0);
	LEDR: out std_logic_vector(7 downto 0)
	);
end main;

architecture BeH of main is	
	--Signals, Constants,Components, Signal Types
		signal c1,c11,c2,c22,c3,c33,c333,c3333,c33333,c222,c2222,c4,c444,c44,c4444,c5,c55,c555,c6: STD_LOGIC;
		signal a3b0,a2b0,a1b0,a0b0,a3b1,a2b1,a1b1,a0b1,a3b2,a2b2,a1b2,a0b2,a3b3,a2b3,a1b3,a0b3:std_logic;

	component fullAdder is
		port(
		i1,i2, cin: in std_logic;
		s,cout: out std_logic
		);
		end component fullAdder;
		
	begin
	--Behavioral
	LEDR(0)<=sw(0) and sw(4);
	

	a1b0<=sw(1) and sw(4);
	a0b1<=sw(0) and sw(5);
	a2b0<=sw(2) and sw(4);
	a1b1<=sw(1) and sw(5);
	a0b2<=sw(0) and sw(6);
	a3b0<=sw(3) and sw(4);
	a2b1<=sw(2) and sw(5);
	a1b2<=sw(1) and sw(6);
	a0b3<=sw(0) and sw(7);
	a3b1<=sw(3) and sw(5);
	a2b2<=sw(2) and sw(6);
	a1b3<=sw(1) and sw(7);
	a3b2<=sw(3) and sw(6);
	a2b3<=sw(2) and sw(7);
	a3b3<=sw(3) and sw(7);
	
	u1: fullAdder port map(a1b0,a0b1,'0',LEDR(1),c1);
	u2: fullAdder port map(a2b0,a1b1,a0b2,c11,c2);
	u22: fullAdder port map(c1,c11,'0',LEDR(2),c22);
	u3: fullAdder port map(a3b0,a2b1,a1b2,c222,c3);
	u33: fullAdder port map(a0b3,c22,c2,c2222,c33);
	u333: fullAdder port map('0',c2222,c222,LEDR(3),c333);
	u4: fullAdder port map(a3b1,a2b2,a1b3,c3333,c4);
	u44: fullAdder port map(c3,c33,c333,c33333,c44);
	u444: fullAdder port map(c33333,c3333,'0',LEDR(4),c444);
	u5: fullAdder port map(a3b2,a2b3,c4,c4444,c5);
	u55: fullAdder port map(c44,c444,c4444,LEDR(5),c55);
	u6: fullAdder port map(a3b3,c5,c55,LEDR(6),c6);
	LEDR(7)<=c6;
	

	
	
	end BeH;