	library ieee;
	use IEEE.std_logic_1164.All;
	use IEEE.std_logic_unsigned.All;
	USE ieee.numeric_std.ALL;
	USE IEEE.MATH_REAL.ALL;

entity TrafficLights is
	Port(
		clk: in std_logic;
		lights: out std_logic_vector(2 downto 0);
		reset:in std_logic
	);
	end entity TrafficLights;
	
	architecture BeH of TrafficLights is
	
	type FSM is (S0,S1,S2);
	signal current_state, next_state: FSM;
	signal counter:integer;
	signal counter_clk: integer;
	signal clk_reg:std_logic;
	begin

      process(counter_clk,clk_reg)
		begin
			if rising_edge(clk) then
				if counter_clk=49999999 then
					clk_reg<=not clk_reg;
					counter_clk<=0;
				else 
					counter_clk<=counter_clk+1;
					clk_reg<=clk_reg;
				end if;
			else	
				counter_clk<=counter_clk;
				clk_reg<=clk_reg;
			end if;
			end process;
	
		process(counter_clk,clk_reg,clk,current_state,counter)
		begin
			if reset='1' then
				current_state<=s0;
				counter<=0;
			elsif rising_edge(clk_reg) then
					current_state<=next_state;
		case(current_state) is
			when s0=>
				if(counter<15)then
					lights<="001";
					next_state<=s0;
				else 
					next_state<=s1;
				end if;
			when s1=>
				if(counter>14 and counter<20)then
					lights<="010";
					next_state<=s1;
				else
					next_state<=s2;
				end if;
			when s2=>
				if(counter>19 and counter<30)then
					lights<="100";
					next_state<=s2;
				else 
					next_state<=s0;
				end if;		
			end case;
					if counter=29 then
						counter<=0;
					else 
						counter<=counter+1;
					end if;
			else
				current_state<=current_state;
				counter<=counter;
			end if;
			end process;


	
			
	--process(current_state,counter)
	--begin
		--case(current_state) is
			--when s0=>
				--if(counter<15)then
					--lights<="001";
					--next_state<=s0;
				--else 
					--next_state<=s1;
				--end if;
			--when s1=>
				--if(counter>14 and counter<20)then
					--lights<="010";
					--next_state<=s1;
				--else
					--next_state<=s2;
				--end if;
			--when s2=>
				--if(counter>19 and counter<30)then
					--lights<="100";
					--next_state<=s2;
				--else 
					--next_state<=s0;
				--end if;		
			--end case;
	--end process;	
	end BeH;