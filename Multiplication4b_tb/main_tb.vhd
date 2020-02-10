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
			SW: in std_logic_vector(7 downto 0);
			LEDR: out std_logic_vector(7 downto 0)
			);
		end component main;
	
	signal clk 	: std_logic;
	signal stop_clk	: boolean;
	
	signal SW:std_logic_vector(7 downto 0):="00000000";
	signal LEDR:std_logic_vector(7 downto 0):="00000000";
	
	begin
	
	qqq: main port map(SW,LEDR);

	stimulus: process
	
	begin
	
	
	stop_clk<= false;
	SW<="00000000";
	wait for 100ns;
	SW<="01110110";
	wait for 100ns;
	SW<="10010101";
	wait for 60ns;
	SW<="10011001";
	wait for 100ns;
	SW<="11111111";
	wait for 100ns;
	SW<="01101101";
	wait for 100ns;
	SW<="11011100";
	wait for 100ns;
	
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