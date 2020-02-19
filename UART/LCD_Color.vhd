	library ieee;
	use IEEE.std_logic_1164.All;
	use IEEE.std_logic_unsigned.All;
	USE ieee.numeric_std.ALL;
	USE IEEE.MATH_REAL.ALL;

entity LCD_Color is
	Port(
		clk: in std_logic;
		data: out std_logic_vector(7 downto 0);
		enable: out std_logic;
		rs: out std_logic;
		rw: out std_logic;
		reset:in std_logic;
		position: in std_logic_vector(3 downto 0)
	);
	end entity LCD_Color;
	
	architecture BeH of LCD_Color is
	
	type FSM is (set1,set2,disClear1,disclear2,disControl1,disControl2,r1,r2,g1,g2,b1,b2,y1,y2,c1,c2,p1,p2);

	signal current_state, next_state: FSM;
	signal sig_data: std_logic_vector(7 downto 0);
	signal sig_enable: std_logic;
	signal sig_rs: std_logic;
	signal sig_rw: std_logic;
	begin
	
	process(clk,current_state,next_state, reset)
	begin
		if reset='0' then
			if rising_edge(clk) then
				current_state<=next_state;
			else
				current_state<=current_state;
			end if;
		else
			current_state<=set1;
		end if;
	end process;
	
	process(current_state,position)
	begin
		case(current_state) is		
		
			when set1=>
				sig_enable<='1';
				sig_rs<='0';
				sig_rw<='0';
				sig_data<="00111000";
				next_state<=set2;
			--set2
			when set2=>
				sig_enable<='0';
				sig_rs<='0';
				sig_rw<='0';
				sig_data<="00111000";
				next_state<=disControl1;
			--disControl1
			when disControl1=>
				sig_enable<='1';
				sig_rs<='0';
				sig_rw<='0';
				sig_data<="00001111";
				next_state<=disControl2;
			--disControl2
			when disControl2=>
				sig_enable<='0';
				sig_rs<='0';
				sig_rw<='0';
				sig_data<="00001111";
				next_state<=disClear1;
			--disclear1
			when disClear1=>
				sig_enable<='1';
				sig_rs<='0';
				sig_rw<='0';
				sig_data<="00000001";
				next_state<=disClear2;
			--disClear2
			when disClear2=>
				sig_enable<='0';
				sig_rs<='0';
				sig_rw<='0';
				sig_data<="00000001";
				if position="0000"or position="1001"then
					next_state<=r1; 
				elsif position="0001" or position="1000" then
					next_state<=g1;
				elsif position="0010" then
					next_state<=b1;
				elsif position="0011" or position="0110" then
					next_state<=y1;
				elsif position="0100" or position="0101" then
					next_state<=c1;
				elsif position="0111" then
					next_state<=p1;
				else
					next_state<=disClear2;
				end if;

			--show r1
			when r1=>
				sig_enable<='1';
				sig_rs<='1';
				sig_rw<='0';
				sig_data<="01010010";
				next_state<=r2;
			--show r2
			when r2=>
				sig_enable<='0';
				sig_rs<='1';
				sig_rw<='0';
				sig_data<="01010010";
				if position="0000" or position="1001" then
				next_state<=r2;
				else
				next_state<=disClear1;
				end if;
			--show g1
			when g1=>
				sig_enable<='1';
				sig_rs<='1';
				sig_rw<='0';
				sig_data<="01000111";
				next_state<=g2;
			--show g2
			when g2=>
				sig_enable<='0';
				sig_rs<='1';
				sig_rw<='0';
				sig_data<="01000111";
				if position="0001" or position="1000" then
				next_state<=g2;
				else
				next_state<=disClear1;
				end if;
			--b1
			when b1=>
				sig_enable<='1';
				sig_rs<='1';
				sig_rw<='0';
				sig_data<="01000010";
				next_state<=b2;
			--show b2
			when b2=>
				sig_enable<='0';
				sig_rs<='1';
				sig_rw<='0';
				sig_data<="01000010";
				if position="0010" then
				next_state<=b2;
				else
				next_state<=disClear1;
				end if;
				--show y1
				when y1=>
				sig_enable<='1';
				sig_rs<='1';
				sig_rw<='0';
				sig_data<="01011001";
				next_state<=y2;
			--show y2
			when y2=>
				sig_enable<='0';
				sig_rs<='1';
				sig_rw<='0';
				sig_data<="01011001";
				if position="0011" or position="0110" then
				next_state<=y2;
				else
				next_state<=disClear1;
				end if;
			--show c1	
			when c1=>
				sig_enable<='1';
				sig_rs<='1';
				sig_rw<='0';
				sig_data<="01000011";
				next_state<=c2;
			--show c2
			when c2=>
				sig_enable<='0';
				sig_rs<='1';
				sig_rw<='0';
				sig_data<="01000011";
				if position="0100" or position="0101" then
				next_state<=c2;
				else
				next_state<=disClear1;
				end if;
			--show c1	
			when p1=>
				sig_enable<='1';
				sig_rs<='1';
				sig_rw<='0';
				sig_data<="01010000";
				next_state<=p2;
			--show p2
			when p2=>
				sig_enable<='0';
				sig_rs<='1';
				sig_rw<='0';
				sig_data<="01010000";
				if position="0111" then
				next_state<=p2;
				else
				next_state<=disClear1;
				end if;

			end case;
	end process;	
	enable<=sig_enable;
	rs<=sig_rs;
	rw<=sig_rw;
	data<=sig_data;
	
	
	end BeH;