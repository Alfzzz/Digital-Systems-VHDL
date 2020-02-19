library IEEE;
	use IEEE.STD_LOGIC_1164.all;
--comentarios
entity main is
	port(
	SW: in std_logic_vector(8 downto 0);
	LEDR: out std_logic_vector(4 downto 0)
	);
end main;

architecture BeH of main is	
	--Signals, Constants,Components, Signal Types
		signal sn1,sn2,sn3,snxor1,snxor2,snxor3,snxor4 :std_logic;	
	--HalfAdder
	--component halfAdder is
		--port(
	--	a: in std_logic;		
		--b: in std_logic;
	--	led1 : out std_logic;
	--	led2: out std_logic
	--	);
	--end component halfAdder;
	
	component fullAdder is
		port(
		a,b, cin: in std_logic;
		s, cout : out std_logic
		);
		end component fullAdder;
		
	begin
	--Behavioral
	--u1: halfAdder port map(SW(0),SW(1),LEDR(0),LEDR(1));
	--u2: fullAdder port map(SW(0),SW(1),SW(2),LEDR(0),LEDR(1));
	snxor1<=sw(0) xor sw(1);
	snxor2<=sw(0) xor sw(2);
	snxor3<=sw(0) xor sw(3);
	snxor4<=sw(0) xor sw(4);
	
	u3: fullAdder port map(SW(5),snxor1,SW(0),LEDR(0),sn1);
	u4: fullAdder port map(SW(6),snxor2,sn1,LEDR(1),sn2);
	u5: fullAdder port map(SW(7),snxor3,sn2,LEDR(2),sn3);
	u6: fullAdder port map(SW(8),snxor4,sn3,LEDR(3),LEDR(4));
	
	
	end BeH;