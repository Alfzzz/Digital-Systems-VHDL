library ieee;
use IEEE.std_logic_1164.All;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
USE IEEE.MATH_REAL.ALL;

entity main is
	Port(
		CLOCK_50:in std_logic;
		LEDR:out std_logic_vector(2 downto 0);
		SW: in std_logic_vector(3 downto 0)
	);
end entity main;

architecture BeH of main is
	component TrafficLights is
	port(
		clk: in std_logic;
		lights: out std_logic_vector(2 downto 0);
		reset:in std_logic
	);
	end component TrafficLights;
	begin
	u1: TrafficLights port map(CLOCK_50,ledr(2 downto 0),sw(0));
end BeH;