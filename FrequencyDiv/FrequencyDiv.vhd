library ieee;
	use IEEE.std_logic_1164.All;
	use IEEE.std_logic_unsigned.All;

entity FrequencyDiv is
	Generic(
		--Frequency of 8
		freq:INTEGER
	);
	Port(
		clk: in std_logic;
		LEDR:out std_logic
	);
	end entity FrequencyDiv;
	
	architecture BeH of FrequencyDiv is
		signal counter: integer;
		signal clk_reg:std_logic;
	begin
		process(counter,clk_reg)
		begin
			if rising_edge(clk) then
				if counter=freq then
					clk_reg<=not clk_reg;
					counter<=0;
				else 
					counter<=counter+1;
					clk_reg<=clk_reg;
				end if;
			else	
				counter<=counter;
				clk_reg<=clk_reg;
			end if;
			end process;
		
		LEDR<=clk_reg;
	end BeH;	