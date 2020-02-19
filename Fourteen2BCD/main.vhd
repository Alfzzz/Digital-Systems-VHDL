library ieee;
use IEEE.std_logic_1164.All;
use IEEE.std_logic_unsigned.All;

entity main is
	Port(
		SW:in std_logic_vector	(13 downto 0);
		HEX3: out std_logic_vector(6 downto 0);
		HEX2:out std_logic_vector(6 downto 0);
		HEX1:out std_logic_vector(6 downto 0);
		HEX0:out std_logic_vector(6 downto 0)
	);
end entity main;

architecture BeH of main is
	component Fourteen2BCD is
	port(
		input: in std_logic_vector(13 downto 0);
		seg3:out std_logic_vector(6 downto 0);
		seg2:out std_logic_vector(6 downto 0);
		seg1: out std_logic_vector(6 downto 0);
		seg0: out std_logic_vector(6 downto 0)
	);
	end component Fourteen2BCD;
	begin
	u1: Fourteen2BCD port map(SW(13 downto 0),HEX3,HEX2,HEX1,HEX0);
end BeH;