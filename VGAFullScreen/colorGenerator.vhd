LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY colorGenerator IS
  PORT(
    dis_EN :  IN   STD_LOGIC;  
    red      :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);  
    green    :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0) ; 
    blue     :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
	 SW_Red:in std_LOGIC_VECTOR(7 downto 0);
	 SW_Blue:in std_LOGIC_VECTOR(7 downto 0)
	 --SW_Green:in std_LOGIC_VECTOR(7 downto 0);
	 );
END colorGenerator;

ARCHITECTURE behavior OF colorGenerator IS
BEGIN

red<=
	SW_Red(7 downto 0)when dis_EN='1'else
	"00000000";
	
blue<=
	SW_Blue(7 downto 0)when dis_EN='1'else
	"00000000";

--green<=
--SW_Green(17 downto 10)when dis_EN='1'else
--"00000000";

green<=
	"00000000"when dis_EN='1'else
	"00000000";
END behavior;