library ieee;
use ieee.std_logic_1164.all;

entity bcd2seg is
port(
	E: in std_logic_vector(3 downto 0);
	S: out std_logic_vector(6 downto 0)
);
end bcd2seg;

architecture BeH of bcd2seg is 

begin

S<= 
"1000000"when e="0000"else
"1111001"when e="0001"else
"0100100"when e="0010"else
"0110000"when e="0011"else
"0011001"when e="0100"else
"0010010"when e="0101"else
"0000010"when e="0110"else
"1111000"when e="0111"else
"0000000"when e="1000"else
"0011000"when e="1001"else
"0001000"when e="1010"else
"0000011"when e="1011"else
"1000110"when e="1100"else
"0100001"when e="1101"else
"0000110"when e="1110"else
"0001110";


end BeH;