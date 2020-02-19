library ieee;
use IEEE.std_logic_1164.All;
use IEEE.std_logic_unsigned.All;

entity main is
	Port(
		CLOCK_50: in std_logic;
		SW:in std_logic_vector	(3 downto 0);
		HEX3: out std_logic_vector(6 downto 0);
		HEX2:out std_logic_vector(6 downto 0);
		HEX1:out std_logic_vector(6 downto 0);
		HEX0:out std_logic_vector(6 downto 0);
		GPIO:in std_logic_vector(0 downto 0);
		LEDR: out std_logic_vector(17 downto 0);
		LEDG: out std_logic_vector(6 downto 0);
		KEY: in std_logic_vector(1 downto 0)
	);
end entity main;

architecture BeH of main is
	signal signal_controlSignalGenerator:std_logic_vector(2 downto 0);
	signal signal_BCD0:std_logic_vector(3 downto 0);
	signal signal_BCD1:std_logic_vector(3 downto 0);
	signal signal_BCD2:std_logic_vector(3 downto 0);
	signal signal_BCD3:std_logic_vector(3 downto 0);
	signal signal_BCD0_out:std_logic_vector(3 downto 0);
	signal signal_BCD1_out:std_logic_vector(3 downto 0);
	signal signal_BCD2_out:std_logic_vector(3 downto 0);
	signal signal_BCD3_out:std_logic_vector(3 downto 0);
	
	
	component TimingAndControl  is
	port(
		clk_in: in std_logic;
		rangeSelect: in std_logic_vector(2 downto 0);
		controlSignalGenerator: out std_logic_vector(2 downto 0);
		nRst: in std_logic;
		prueba: out std_logic_vector(5 downto 0)
	);
	end component TimingAndControl;
	
	component CascadeBCDCounter is
	port(
		digitalPulses: in std_logic;
		BCD0: out std_logic_vector(3 downto 0);
		BCD1: out std_logic_vector(3 downto 0);
		BCD2: out std_logic_vector(3 downto 0);
		BCD3: out std_logic_vector(3 downto 0);
		clear: in std_logic;
		enable: in std_logic
	);
	end component CascadeBCDCounter;

	component DisplayRegister is
	port(
		store: in std_logic;
		BCD0_in: in std_logic_vector(3 downto 0);
		BCD1_in: in std_logic_vector(3 downto 0);
		BCD2_in: in std_logic_vector(3 downto 0);
		BCD3_in: in std_logic_vector(3 downto 0);
		BCD0_out: out std_logic_vector(3 downto 0);
		BCD1_out: out std_logic_vector(3 downto 0);
		BCD2_out: out std_logic_vector(3 downto 0);
		BCD3_out: out std_logic_vector(3 downto 0)
	);
	end component DisplayRegister;
	
	component DecoderAndDisplay is
	Port(
		BCD: in std_logic_vector(3 downto 0);
		seg:out std_logic_vector(6 downto 0)
	);
	end component DecoderAndDisplay;
	
		component FrequencyDiv is
	Generic(
		freq:INTEGER
	);
	Port(
		clk: in std_logic;
		LEDR:out std_logic
	);
	end component FrequencyDiv;
	
	begin
	
	LEDR(0)<=GPIO(0);
	LEDR(1)<=signal_controlSignalGenerator(0);
	ledR(2)<=signal_controlSignalGenerator(1);
	LEDR(3)<=signal_controlSignalGenerator(2);
	LEDR(17)<=KEY(0);
		--LEDR(17 downto 14)<=singal
	
	
	
	
	
	u7: TimingAndControl port map(CLOCK_50,sw(2 downto 0),signal_controlSignalGenerator(2 downto 0),sw(3),LEDG(5 DOWNto 0));
	u8: CascadeBCDCounter port map(GPIO(0),signal_BCD0,signal_BCD1,signal_BCD2,signal_BCD3,signal_controlSignalGenerator(2),signal_controlSignalGenerator(1));
	u9: DisplayRegister port map(signal_controlSignalGenerator(0),signal_BCD0,signal_BCD1,signal_BCD2,signal_BCD3,signal_BCD0_out,signal_BCD1_out,signal_BCD2_out,signal_BCD3_out);
	u10: DecoderAndDisplay port map(signal_BCD0_out,HEX0);
	u11: DecoderAndDisplay port map(signal_BCD1_out,HEX1);
	u12: DecoderAndDisplay port map(signal_BCD2_out,HEX2);
	u13: DecoderAndDisplay port map(signal_BCD3_out,HEX3);
	
	
	
	
end BeH;