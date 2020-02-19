library ieee;
	use IEEE.std_logic_1164.All;
	use IEEE.std_logic_unsigned.All;

entity TimingAndControl is
	Port(
		clk_in: in std_logic;
		rangeSelect: in std_logic_vector(2 downto 0);
		controlSignalGenerator: out std_logic_vector(2 downto 0);
		nRst: in std_logic;
		prueba: out std_logic_vector(5 downto 0)
	);
	end entity TimingAndControl;
	
	architecture BeH of TimingAndControl is
	--Signals
	signal frequencies: std_logic_vector(5 downto 0);
	signal controlClk: std_logic;
	signal signal_controlSignalGenerator: std_logic_vector(2 DOWNTO 0);
	type fsm is (S0,S1,S2,S3,S4,S5);
	signal current_state: fsm;
	
	component FrequencyDiv
		GENERIC(
			freq:INTEGER
		);
		port(
		clk: in std_logic;
		LEDR:out std_logic
		);
		end component FrequencyDiv;
		
		--Dividir frecuencias
		begin
		controlClk<=
			frequencies(5)when rangeSelect="000"else
			frequencies(4)when rangeSelect="001"else
			frequencies(3)when rangeSelect="010"else
			frequencies(2)when rangeSelect="011"else
			frequencies(1)when rangeSelect="100"else
			frequencies(0)when rangeSelect="101"else
			frequencies(5);
		
		--Maquina de estados paa el control del generador de señales
		process(nRst,controlClk,current_state,signal_controlSignalGenerator)
		begin
		if nRst = '0' then
			current_state <= S0;
			--ABC----->A de clear,B de enable,C de store 
			signal_controlSignalGenerator <= "100";
		elsif rising_edge(controlClk) then
			case current_state is
				when S0 =>
					signal_controlSignalGenerator <= "100";
					current_state <= s1;
				when S1 =>
					signal_controlSignalGenerator <= "000";
					current_state <= s2;
				when S2 =>
					signal_controlSignalGenerator<= "010";
					current_state <= s3;
				when S3 =>
					signal_controlSignalGenerator <= "000";
					current_state <= s4;
				when S4 =>
					signal_controlSignalGenerator <= "001";
					current_state <= s5;
				when S5 =>
					signal_controlSignalGenerator <= "000";
					current_state <= s0;					
			end case;
		else
			current_state <= current_state;
			signal_controlSignalGenerator <= signal_controlSignalGenerator;
		end if;
	end process;
	
		controlSignalGenerator<=signal_controlSignalGenerator;
		prueba(0)<=frequencies(5);
		prueba(1)<=frequencies(4);
		prueba(2)<=frequencies(3);
		prueba(3)<=frequencies(2);
		prueba(4)<=frequencies(1);
		prueba(5)<=frequencies(0);
			
		--u1 es para sacar 100k Hz 000
		u1:FrequencyDiv generic map(249) port map(clk_IN,frequencies(5)) ;
		--u2 10k Hz	001
		u2 :FrequencyDiv generic map(2499) port map(clk_IN,frequencies(4));
		--u3 1k Hz	010
		u3 :FrequencyDiv generic map(24999) port map(clk_IN,frequencies(3));
		--u4 100 Hz	011
		u4 :FrequencyDiv generic map(249999) port map(clk_IN,frequencies(2));
		--u5 10 Hz	100
		u5 :FrequencyDiv generic map(2499999) port map(clk_IN,frequencies(1));
		--u2 1 Hz	101
		u6 :FrequencyDiv generic map(24999999) port map(clk_IN,frequencies(0));
	end BeH;	