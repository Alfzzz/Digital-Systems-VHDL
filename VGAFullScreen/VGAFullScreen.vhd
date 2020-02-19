LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY VGAFullScreen IS
		PORT(
		clk	:	IN		STD_LOGIC;	
		HS		:	OUT	STD_LOGIC;	
		VS		:	OUT	STD_LOGIC;	
		dis_EN		:	OUT	STD_LOGIC
	);	
END VGAFullScreen;

ARCHITECTURE behavior OF VGAFullScreen IS 
	signal countH	:	INTEGER RANGE 0 TO 800;  --number of clocks
	signal countV	:	INTEGER RANGE 0 TO 521;  --lines
	
BEGIN
	PROCESS(clk)
	BEGIN
	
		IF rising_edge(clk) THEN

			--horizontal count
			IF(countH < 799) THEN --800 clocks
				countH<=countH + 1;
			ELSE
				countH<=0;
				--vertical count
				IF(countV < 520) THEN	--521 lines 
					countV<= countV + 1;
				ELSE
					countV<=0;
				END IF;
			END IF;

			--horizontal sync
			--starts with display time
			IF(countH < 640 + 16 OR countH >= 640 + 16 + 96) THEN
				HS <= NOT '0';		
			ELSE
				HS <= '0';		
			END IF;
			
			--vertical sync
			IF(countV < 480 + 10 OR countV >= 480 + 10 + 2) THEN
				VS <= '0';		
			ELSE
				VS <= '1';			
			END IF;

			--set display enable output
			IF(countH < 640 AND countV < 480) THEN  	
				dis_EN <= '1';											 	
			ELSE																	
				dis_EN <= '0';												
			END IF;

		END IF;
	END PROCESS;

END behavior;