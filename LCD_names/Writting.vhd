	library ieee;
	use IEEE.std_logic_1164.All;
	use IEEE.std_logic_unsigned.All;
	USE ieee.numeric_std.ALL;
	USE IEEE.MATH_REAL.ALL;

entity Writting is
	Port(
		clk: in std_logic;
		bttn: in std_logic;
		data: out std_logic_vector(7 downto 0);
		enable: out std_logic;
		rs: out std_logic;
		rw: out std_logic;
		reset:in std_logic
	);
	end entity Writting;
	
	architecture BeH of Writting is
	
	type FSM is (set1,set2,disClear1,disclear2,disControl1,disControl2,address11,address22,s1,s2,d1,d2,a1,a2,address1,address2, alf11,alf12,alf21,alf22,alf31,alf32,dan11,dan12,dan21,dan22,dan31,dan32,chris11,chris12,chris21,chris22,chris31,chris32);
	--type FSM is (s1,s2,d1,d2,a1,a2, alf11,alf12,alf21,alf22,alf31,alf32,dan11,dan12,dan21,dan22,dan31,dan32,chris11,chris12,chris21,chris22,chris31,chris32);
	
	signal current_state, next_state: FSM;
	signal sig_data: std_logic_vector(7 downto 0);
	signal sig_enable: std_logic;
	signal sig_rs: std_logic;
	signal sig_rw: std_logic;
	begin
	
	process(clk,current_state,next_state, reset,bttn)
	begin
		if reset='0' then
			if rising_edge(clk) and bttn='1' then
				current_state<=next_state;
			else
				current_state<=current_state;
			end if;
		else
			current_state<=set1;
		end if;
	end process;
	
	process(current_state)
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
				next_state<=address11;
		
			--address11
			when address11=>
				sig_enable<='1';
				sig_rs<='0';
				sig_rw<='0';
				sig_data<="10000000";
				next_state<=address22;
			--address22
			when address22=>
				sig_enable<='0';
				sig_rs<='0';
				sig_rw<='0';
				sig_data<="10000000";
				next_state<=s1;
			--s1
			when s1=>
				sig_enable<='1';
				sig_rs<='1';
				sig_rw<='0';
				sig_data<="01010011";
				next_state<=s2;
			--s2
			when s2=>
				sig_enable<='0';
				sig_rs<='1';
				sig_rw<='0';
				sig_data<="01010011";
				next_state<=d1;
			--d1
			when d1=>
				sig_enable<='1';
				sig_rs<='1';
				sig_rw<='0';
				sig_data<="01000100";
				next_state<=d2;
			--d2
			when d2=>
				sig_enable<='0';
				sig_rs<='1';
				sig_rw<='0';
				sig_data<="01000100";
				next_state<=a1;
			--a1
			when a1=>
				sig_enable<='1';
				sig_rs<='1';
				sig_rw<='0';
				sig_data<="01000001";
				next_state<=a2;
			--a2
			when a2=>
				sig_enable<='0';
				sig_rs<='1';
				sig_rw<='0';
				sig_data<="01000001";
				next_state<=address1;
			--address1
			when address1=>
				sig_enable<='1';
				sig_rs<='0';
				sig_rw<='0';
				sig_data<="11000000";
				next_state<=address2;
			--address2
			when address2=>
				sig_enable<='0';
				sig_rs<='0';
				sig_rw<='0';
				sig_data<="11000000";
				next_state<=alf11;
			--alf11
			when alf11=>
				sig_enable<='1';
				sig_rs<='1';
				sig_rw<='0';
				sig_data<="01000001";
				next_state<=alf12;
			--alf12
			when alf12=>
				sig_enable<='0';
				sig_rs<='1';
				sig_rw<='0';
				sig_data<="01000001";
				next_state<=alf21;
			
			--alf21
			when alf21=>
				sig_enable<='1';
				sig_rs<='1';
				sig_rw<='0';
				sig_data<="01101100";
				next_state<=alf22;
			--alf22
			when alf22=>
				sig_enable<='0';
				sig_rs<='1';
				sig_rw<='0';
				sig_data<="01101100";
				next_state<=alf31;
			
			--alf31
			when alf31=>
				sig_enable<='1';
				sig_rs<='1';
				sig_rw<='0';
				sig_data<="01100110";
				next_state<=alf32;
			--alf32
			when alf32=>
				sig_enable<='0';
				sig_rs<='1';
				sig_rw<='0';
				sig_data<="01100110";
				next_state<=dan11;
				
			--dan11
			when dan11=>
				sig_enable<='1';
				sig_rs<='1';
				sig_rw<='0';
				sig_data<="01000100";
				next_state<=dan12;
			--dan12
			when dan12=>
				sig_enable<='0';
				sig_rs<='1';
				sig_rw<='0';
				sig_data<="01000100";
				next_state<=dan21;
			
			--dan21
			when dan21=>
				sig_enable<='1';
				sig_rs<='1';
				sig_rw<='0';
				sig_data<="01100001";
				next_state<=dan22;
			--dan22
			when dan22=>
				sig_enable<='0';
				sig_rs<='1';
				sig_rw<='0';
				sig_data<="01100001";
				next_state<=dan31;
				
			--dan31
			when dan31=>
				sig_enable<='1';
				sig_rs<='1';
				sig_rw<='0';
				sig_data<="01101110";
				next_state<=dan32;
			--dan32
			when dan32=>
				sig_enable<='0';
				sig_rs<='1';
				sig_rw<='0';
				sig_data<="01101110";
				next_state<=chris11;
				
			--chris11
			when chris11=>
				sig_enable<='1';
				sig_rs<='1';
				sig_rw<='0';
				sig_data<="01000011";
				next_state<=chris12;
			--chris12
			when chris12=>
				sig_enable<='0';
				sig_rs<='1';
				sig_rw<='0';
				sig_data<="01000011";
				next_state<=chris21;
			
			--chris21
			when chris21=>
				sig_enable<='1';
				sig_rs<='1';
				sig_rw<='0';
				sig_data<="01101000";
				next_state<=chris22;
			--chris22
			when chris22=>
				sig_enable<='0';
				sig_rs<='1';
				sig_rw<='0';
				sig_data<="01101000";
				next_state<=chris31;
			
			--chris31
			when chris31=>
				sig_enable<='1';
				sig_rs<='1';
				sig_rw<='0';
				sig_data<="01110010";
				next_state<=chris32;
			--chris32
			when chris32=>
				sig_enable<='0';
				sig_rs<='1';
				sig_rw<='0';
				sig_data<="01110010";
				next_state<=chris32;
			end case;
	end process;	
	enable<=sig_enable;
	rs<=sig_rs;
	rw<=sig_rw;
	data<=sig_data;
	
	
	end BeH;