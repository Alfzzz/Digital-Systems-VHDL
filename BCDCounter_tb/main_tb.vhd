library ieee;
use IEEE.std_logic_1164.All;
use IEEE.std_logic_unsigned.All;

entity main_tb is
end entity main_tb;

architecture BeH of main_tb is
	component main
	port(
	  key:in std_logic_vector(0 downto 0);
		SW:in std_logic_vector(6 downto 0);
		LEDR: out std_logic_vector(3 downto 0)	
	);
	end component main;
	
	signal clk:std_logic;
	signal stop_clk:boolean;
	
	signal key:std_logic_vector(0 downto 0);
	signal sw: std_logic_vector(6 downto 0);
	signal LEDR: std_logic_vector(3 downto 0);
	
	begin
	
		u2: main port map(KEY,SW,LEDR);
		stimulus:process
		begin
			
		stop_clk<=false;
		
		--Reset
		KEY(0)<='0';
		sw<="1011110";
		wait for 100 ns;
		
		KEY(0)<='1';
		sw<="1011110";
		wait for 100 ns;
		
		KEY(0)<='0';
		sw<="0000100";
		wait for 100 ns;
		
		KEY(0)<='1';
		sw<="0000100";
		wait for 100 ns;
		
		KEY(0)<='0';
		sw<="0000100";
		wait for 100 ns;
		
		KEY(0)<='1';
		sw<="0000100";
		wait for 100 ns;
		
		KEY(0)<='0';
		sw<="0000100";
		wait for 100 ns;
		
		
		KEY(0)<='1';
		sw<="0000100";
		wait for 100 ns;
		
		
		KEY(0)<='0';
		sw<="0000100";
		wait for 100 ns;
		
		
		KEY(0)<='1';
		sw<="0000100";
		wait for 100 ns;
		
		--try load
		KEY(0)<='0';
		sw<="0101000";
		wait for 100 ns;
		
		
		KEY(0)<='1';
		sw<="1011000";
		wait for 100 ns;
		
		
		--try reset
		KEY(0)<='0';
		sw<="1011110";

    
		KEY(0)<='1';
		sw<="1011110";
    		
		stop_clk<=true;
		end process;
		
		cloking :process
		begin 
			while not stop_clk loop
				clk<='1','0' after 20 ns/2;
				wait for 20 ns;
			end loop;
			wait;
		end process;
end BeH;