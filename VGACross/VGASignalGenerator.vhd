LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY VGASignalGenerator IS
		PORT(
		clk	:	IN		STD_LOGIC;	
		HS		:	OUT	STD_LOGIC;	
		VS		:	OUT	STD_LOGIC;	
		dis_EN		:	OUT	STD_LOGIC;
		x:out integer;
		y:out integer
	);	
END VGASignalGenerator;

ARCHITECTURE behavior OF VGASignalGenerator IS 
	signal countH	:	INTEGER RANGE 0 TO 800;  --number of clocks
	signal countV	:	INTEGER RANGE 0 TO 521;  --lines
	signal xCoor:integer range 0 to 640;
	signal yCoor: integer range 0 to 480;
	
BEGIN
	PROCESS(clk,countH,countV)
	BEGIN
	
		IF rising_edge(clk) THEN

			--horizontal count
			IF(countH < 800) THEN --800 clocks
				countH<=countH + 1;
			ELSE
				countH<=0;
				--vertical count
				IF(countV < 521) THEN	--521 lines 
					countV<= countV + 1;
				ELSE
					countV<=0;
				END IF;
			END IF;

			--horizontal sync
			--starts with display time
			IF(countH < 640 + 16 OR countH >= 752) THEN
				HS <= '1';		
			ELSE
				HS <= '0';		
			END IF;
			
			--vertical sync
			IF(countV < 490 OR countV >= 492) THEN
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
			
			--set coordinates
			IF(countH < 640) THEN  	
				x<=countH;										
			END IF;	
			IF(countV < 480) THEN  	
				y<=countV;										
			END IF;			

		END IF;
	END PROCESS;

END behavior;