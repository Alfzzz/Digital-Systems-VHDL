library ieee;
	use IEEE.std_logic_1164.All;
	use IEEE.std_logic_unsigned.All;

entity FreqDiv is
	Generic(
		--Frequency of 50MHz/(2000)-1=24999
		freq:INTEGER
	);
	Port(
		clk: in std_logic;
		clk_out:out std_logic
	);
	end entity FreqDiv;
	
	architecture BeH of FreqDiv is
		signal counter: integer;
		signal clk_reg:std_logic;
	begin
		process(counter,clk_reg,clk)
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
		
		clk_out<=clk_reg;
	end BeH;	