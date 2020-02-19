library ieee;
use ieee.std_logic_1164.all;

entity main is
port(
	SW: in std_logic_vector(3 downto 0);
	HEX0: out std_logic_vector(6 downto 0)
);
end main;

architecture BeH of main is 

component bcd2seg is port(
e: in std_logic_vector(3 downto 0);
s: out std_logic_vector(6 downto 0)
);
end component bcd2seg;

begin

u: bcd2seg port map(sw,hex0);

end BeH;