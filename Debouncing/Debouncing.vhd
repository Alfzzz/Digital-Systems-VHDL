	library ieee;
	use IEEE.std_logic_1164.All;
	use IEEE.std_logic_unsigned.All;
	USE ieee.numeric_std.ALL;
	USE IEEE.MATH_REAL.ALL;

entity Debouncing is
	Port(
		clk: in std_logic;
		bttn_in: in std_logic;
		bttn_out: out std_logic;
		reset: in std_logic;
		bttn_BCD: out std_logic
	);
	end entity Debouncing;
	
	architecture BeH of Debouncing is
	
	type FSM is (IDLE,CHECK_IN,pulse, check_out);
	signal current_state, next_state: FSM;
	signal counter:Integer;
	signal sn_bcd: std_logic;
	begin
	
		process(clk,current_state,next_state,counter, reset)
		begin
			if rising_edge(clk) then
				if reset='1' then
					current_state<=idle;
					counter<=0;
				else
					current_state<=next_state;
					if (current_state=IDLe or current_state=pulse) then
						counter<=0;
					else
						counter<=counter+1;
					end if;
				end if;
			else 
				current_state<=current_state;
			end if;
		end process;
	
	--Bttn active_n
	process(current_state,bttn_in,counter)
	begin
		case(current_state) is
			--IDLE
			when IDLE=>
				bttn_out<='0';
				sn_bcd<='0';
				if(bttn_in='0')then
					next_state<=IDLE;
				else 
					next_state<=check_in;
				end if;
			--Check in
			when check_in=>
				bttn_out<='0';
				sn_bcd<='0';
				if counter>50000000 then
					if bttn_in='0' then
						next_state<=pulse;
					else
						next_state<=idle;
					end if;
				else
					next_state<=check_in;
				end if;
			--Pulse
			when Pulse=>
				bttn_out<='1';
				sn_bcd<='1';
				if(bttn_in='0')then
					next_state<=Pulse;
				else 
					next_state<=check_out;
				end if;
			--Check out
			when check_out=>
				bttn_out<='1';
				sn_bcd<='1';
				if counter>50000000 then
					if bttn_in='0' then
						next_state<=pulse;
					else
						next_state<=idle;
					end if;
				else
					next_state<=check_out;
				end if;
			end case;
	end process;	
	bttn_BCD<=sn_bcd;
	
	
	end BeH;