library ieee;
	use IEEE.std_logic_1164.All;
	use IEEE.std_logic_unsigned.All;

entity main is
	Port(
		clk: in std_logic;
		LEDR:out std_logic_vector(1 downto 0)
	);
	end entity main;
	
	architecture BeH of main is
	component FrequencyDiv
		GENERIC(
			freq:INTEGER
		);
		port(
		clk: in std_logic;
		LEDR:out std_logic
		);
		end component FrequencyDiv;
		begin
		u1:FrequencyDiv generic map(3124999) port map(clk,LEDR(1)) ;
		u2 :FrequencyDiv generic map(24999999) port map(clk,LEDR(0));
	end BeH;	