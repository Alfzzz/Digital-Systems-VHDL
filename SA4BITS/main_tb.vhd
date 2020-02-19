library IEEE;
	use IEEE.STD_LOGIC_1164.all;
	use ieee.numeric_std.all;
	use ieee.math_real.all;
--comentarios
entity main_tb is
end entity;

architecture tb of main_tb is	
	component main is
		port(
		SW: in std_logic_vector(8 downto 0);
		LEDR: out std_logic_vector(4 downto 0)
		);
		end component main;
	
	signal clk 	: std_logic;
	signal stop_clk	: boolean;
	
	signal SW:std_logic_vector(8 downto 0);
	signal LEDR:std_logic_vector(4 downto 0);
	
	begin
	
	u3: main port map(SW,ledr);
	
	stimulus: process
	
	begin
	
	stop_clk<= false;
	SW<="011011000";
	wait for 160ns;
	SW<="000110101";
	wait for 240ns;
	SW<="100000111";
	wait for 60ns;
	
	stop_clk<=true;
	wait;
	end process;
	
	clocking: process
  begin
    while NOT stop_clk loop
      clk <= '1', '0' after 20 ns / 2;
      wait for 20 ns;
    end loop;
    wait;
  end process; --clocking
	
	end tb;