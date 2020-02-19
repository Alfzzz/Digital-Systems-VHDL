LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY CrossGenerator IS
  PORT(
    dis_EN :  IN   STD_LOGIC;  
    red      :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);  
    green    :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0) ; 
    blue     :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
	 SW_Red:in std_LOGIC_VECTOR(7 downto 0);
	 SW_Blue:in std_LOGIC_VECTOR(7 downto 0);
	 x:in integer;
	 y:in integer;
	 bttn: in std_LOGIC_VECTOR(3 downto 0)
	 --SW_Green:in std_LOGIC_VECTOR(7 downto 0);
	 );
END crossGenerator;

ARCHITECTURE behavior OF CrossGenerator IS
BEGIN
process(x,y,bttn,sw_RED,SW_Blue)
begin
	if(bttn(3)='1' and bttn(2)='1' and (y=240 or y=241 or y=237 or y=239 or y=238))then
		red<=sw_RED;
		green<=sw_Blue;
		blue<="11111111";
	elsif(bttn(3)='0'and (y=120 or y=121 or y=117 or y=119 or y=118))then
		red<=sw_RED;
		green<=sw_Blue;
		blue<="11111111";
	elsif(bttn(2)='0'and (y=360 or y=361 or y=357 or y=359 or y=358))then
		red<=sw_RED;
		green<=sw_Blue;
		blue<="11111111";
	elsif(bttn(1)='1' and bttn(0)='1' and (x=320 or x=321 or x=317 or x=319 or x=318))then
		red<=sw_RED;
		green<=sw_Blue;
		blue<="11111111";
	elsif(bttn(1)='0'and (x=160 or x=161 or x=157 or x=159 or x=158))then
		red<=sw_RED;
		green<=sw_Blue;
		blue<="11111111";
	elsif(bttn(0)='0'and (x=480 or x=481 or x=477 or x=479 or x=478))then
		red<=sw_RED;
		green<=sw_Blue;
		blue<="11111111";
	else
		red<="00000000";
		green<="00000000";
		blue<="00000000";
	end if;
end process;

END behavior;