library ieee;
	use IEEE.std_logic_1164.All;
	use IEEE.std_logic_unsigned.All;

entity main is
	Port(
		VGA_R: OUT std_logic_vector(7 downto 0);
		VGA_G: out std_logic_vector(7 downto 0);
		VGA_B: out std_logic_vector(7 downto 0);
		VGA_HS: out std_logic;
		VGA_VS: out std_logic;
		VGA_BLANK_N: out std_logic;
		VGA_SYNC_N: out std_logic;
		VGA_CLK: out std_logic;
		CLOCK_50: in std_logic;
		SW:in std_logic_vector(17 downto 0);
		KEY:in std_LOGIC_VECTOR(3 downto 0)
	);
	end entity main;
	
	architecture BeH of main is
	signal signal_clock:std_logic; 
	SIGNAL signal_EN:std_LOGIC;
	signal signal_x:intEGER;
	signal signal_y:integer;
	component FrequencyDiv
		GENERIC(
			freq:INTEGER
		);
		port(
		clk: in std_logic;
		LEDR:out std_logic
		);
		end component FrequencyDiv;
    
		
	component VGASignalGenerator
		Port(
		clk	:	IN		STD_LOGIC; 
		HS		:	OUT	STD_LOGIC;
		VS		:	OUT	STD_LOGIC;
		dis_EN		:	OUT	STD_LOGIC;
		x:out integer;
		y:out integer
	);
	end component VGASignalGenerator;	

	 
	 
	 
	     component CrossGenerator is
        PORT(
            dis_EN :  IN   STD_LOGIC;  
            red      :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0); 
            green    :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0); 
            blue     :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0); 
				SW_Red:in std_LOGIC_VECTOR(7 downto 0);
				SW_Blue:in std_LOGIC_VECTOR(7 downto 0);
				x:in integer;
				y:in integer;
				bttn: in std_LOGIC_VECTOR(3 downto 0)
				--SW_Green:in std_LOGIC_VECTOR(7 downto 0);
				);
    end component;
		
				begin
		VGA_BLANK_N<='1';
		VGA_SYNC_N<='0';
		VGA_CLK<=signal_clock;
		
		u1 :FrequencyDiv generic map(0) port map(CLOCK_50,signal_clock);--25MHz
		u2 :VGAsignalGenerator port map(signal_clock,VGA_HS,VGA_VS,signal_EN,signal_x,signal_y);
		u3: CrossGenerator port map(signal_EN,VGA_R,VGA_G,VGA_B,SW(17 downto 10),SW(9 downto 2),signal_x,signal_y,KEY);
	end BeH;	