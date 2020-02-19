library IEEE;
	use IEEE.STD_LOGIC_1164.all;
--comentarios
entity main is
	port(
	SW: in std_logic_vector(8 downto 0);
	HEX0: out std_logic_vector(6 downto 0);
	HEX1: out std_logic_vector(6 downto 0)
	);
end main;

architecture BeH of main is	
	--Signals, Constants,Components, Signal Types
		signal sn:std_logic_vector(4 downto 0);
		signal C: std_logic;

	component fourAdder is
		port(
		i: in std_logic_vector(8 downto 0);
		O: out std_logic_vector(4 downto 0)
		);
		end component fourAdder;
		
	begin
	--Behavioral
	C<=((sn(3)and sn(2)) or (sn(3) and sn(1)))or sn(4);
	
HEX0<=
"1000000"when sn(3 downto 0)="0000" and C='0'else
"1111001"when sn(3 downto 0)="0001" and C='0'else
"0100100"when sn(3 downto 0)="0010" and C='0'else
"0110000"when sn(3 downto 0)="0011"else
"0011001"when sn(3 downto 0)="0100"else
"0010010"when sn(3 downto 0)="0101"else
"0000010"when sn(3 downto 0)="0110"else
"1111000"when sn(3 downto 0)="0111"else
"0000000"when sn(3 downto 0)="1000"else
"0011000"when sn(3 downto 0)="1001"else
"1000000"when sn(3 downto 0)="1010"else
"1111001"when sn(3 downto 0)="1011"else
"0100100"when sn(3 downto 0)="1100"else
"0110000"when sn(3 downto 0)="1101"else
"0011001"when sn(3 downto 0)="1110"else
"0010010"when sn(3 downto 0)="1111"else
"0000010"when sn(3 downto 0)="0000" and C='1'else
"1111000"when sn(3 downto 0)="0001" and C='1'else
"0000000"when sn(3 downto 0)="0010" and C='1'else
"0000000";

HEX1<=
"1111001"when (C='1')else
"1000000";
	u5: fourAdder port map(SW,sn);	
	end BeH;