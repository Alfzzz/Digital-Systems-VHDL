LIBRARY ieee;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE ieee.std_logic_1164.all;
 
entity UART_RX is
  generic (
    clks_p_bit : integer :=2604      --25MHz/9600
    );
  port (
    clk       : in  std_logic;
    rx : in  std_logic;
    byte  : out std_logic_vector(7 downto 0);
	 reset:in std_logic;
	 position:out std_logic_vector(3 downto 0)
    );
end UART_RX;
 
 
architecture rtl of UART_RX is
 
  type FSM is (idle, start, data,Stop);
  signal current_state,next_state : FSM;
   
  signal clock_counter : integer range 0 to clks_p_bit-1 := 0;
  signal index_counter : integer range 0 to 7 := 0;  
  signal signal_byte   : std_logic_vector(7 downto 0) := (others => '0');
  signal signal_position: std_logic_vector(3 downto 0):= (others => '0');
begin

	process(clk,current_state,next_state, reset)
	begin
	if rising_edge(clk) then
		if reset='1' then
			current_state<=idle;
		else
			current_state<=next_state;
		end if;
	else 
		current_state<=current_state;
	end if;
	end process;

	process (current_state,clk)
	begin  
	if rising_edge(clk) then
	case current_state is 
		--IDLE
		when idle =>
			clock_counter <= 0;
         index_counter <= 0;
			signal_position<=signal_position;
			if rx = '0' then --if rx is low, start to read data    
            next_state <= start;
         else
            next_state <= idle;
         end if;
		--Start
      when start =>
			signal_position<=signal_position;
			if clock_counter = (clks_p_bit-1)/2 then   --check if it is still low at the midle of the pulse, return to idle if it isn't
				if rx = '0' then
              clock_counter <= 0; 
              next_state<= data;
				else
              next_state<= idle;
            end if;
         else
				clock_counter <= clock_counter + 1;
            next_state<= start;
         end if;
		 --Data
       when data =>
		 signal_position<=signal_position;
			if clock_counter < clks_p_bit-1 then
            clock_counter <= clock_counter + 1;
            next_state   <= data;
         else
				clock_counter<= 0;
            signal_byte(index_counter) <= rx; --Set byte of index to value
            if index_counter < 7 then
					index_counter <= index_counter + 1;
					next_state   <= data;
            else
              index_counter <= 0;
              next_state   <= Stop;
            end if;
          end if;
		  --Stop
        when Stop =>
          if clock_counter < clks_p_bit-1 then   --Wait for time to finsh
            clock_counter <= clock_counter + 1;
            next_state   <= Stop;
          else
            clock_counter <= 0;
				if signal_position = "1001" then
					signal_position<="0000" ;
				else
					signal_position<=signal_position+1;
				end if;
            next_state   <= idle;
          end if;
      end case;
		end if;
  end process;
  byte(7 downto 0)<=signal_byte;
  position<=signal_position;
end rtl;
