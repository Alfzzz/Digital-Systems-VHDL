library IEEE;
	use IEEE.STD_LOGIC_1164.all;
--comentarios
entity fourAdder is
	port(
	i: in std_logic_vector(8 downto 0);
	O: out std_logic_vector(4 downto 0)
	);
end fouradder; 

architecture BeH of fourAdder is	
	--Signals, Constants,Components, Signal Types
		signal sn1,sn2,sn3:std_logic;	
	component fullAdder is
		port(
		a,b, cin: in std_logic;
		s, cout : out std_logic
		);
		end component fullAdder;
		
	begin

	u1: fullAdder port map(i(1),i(5),'0',O(0),sn1);
	u2: fullAdder port map(i(2),i(6),sn1,O(1),sn2);
	u3: fullAdder port map(i(3),i(7),sn2,o(2),sn3);
	u4: fullAdder port map(i(4),i(8),sn3,o(3),o(4));
	
	
	end BeH;