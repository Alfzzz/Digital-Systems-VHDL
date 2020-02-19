	library ieee;
	use IEEE.std_logic_1164.All;
	use IEEE.std_logic_unsigned.All;

entity BCDCounter is
	Generic(
		tem:INTEGER:=3
	);
	Port(
		clk: in std_logic;
		reset:in std_logic;
		load: in std_logic;
		data:in std_logic_vector(tem downto 0);
		counter: out std_logic_vector(tem downto 0)
	);
	end entity BCDCounter;
	
	architecture BeH of BCDCounter is
		signal cnt_temp: std_logic_vector(tem downto 0);
	begin
		process(load,reset,clk)
		begin
			if reset='1' or cnt_temp="1010" then
				cnt_temp<=(others=>'0');
			elsif load='0'then
				cnt_temp<=data;
			elsif rising_edge(clk)then
				cnt_temp<=cnt_temp+1;
			end if;
			end process;
		
		counter<=cnt_temp;
	end BeH;	
	