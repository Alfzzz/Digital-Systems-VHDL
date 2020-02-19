library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	use ieee.math_real.all;

entity main_tb is
end entity;

architecture tb of main_tb is
	component main is
		port(
		SW:in std_logic_vector(8 downto 0);
		HEX0:out std_logic_vector(6 downto 0);
		HEX1:out std_logic_vector(6 downto 0)
		);
		end component main;
		
	signal clk: std_logic;
	signal stop_clk: boolean;
	
	signal sw:std_logic_vector(8 downto 0);
	signal HEX0: std_logic_vector(6 downto 0);
	signal HEX1: std_logic_vector(6 downto 0);
	
	begin
		
		u5:main port map(sw,HEX0,HEX1);
	
		stimulus: process
		
		begin
			
		stop_clk<=false;
		sw<="001101000";
		wait for 100 ns;
		sw<="100110010";
		wait for 100 ns;
		sw<="100010010";
		wait for 100 ns;
		stop_clk<=true;
		wait;
		end process;
		
		clocking: process
		begin
			while not stop_clk loop
				clk<= '1','0' after 20 ns /2;
				wait for 20 ns;
			end loop;
			wait;
		end process;
		end tb;