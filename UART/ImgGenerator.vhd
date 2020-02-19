LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY ImgGenerator IS
  PORT(
    dis_EN :  IN   STD_LOGIC;  
	 clk :  IN   STD_LOGIC;  
    red      :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);  
    green    :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0) ; 
    blue     :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
	 SW_Red:in std_LOGIC_VECTOR(7 downto 0);
	 SW_Blue:in std_LOGIC_VECTOR(7 downto 0);
	 x:in integer;--640
	 y:in integer;--480
	 byte: in std_LOGIC_VECTOR(7 downto 0);
	 position:in std_logic_vector(3 downto 0)
	 --SW_Green:in std_LOGIC_VECTOR(7 downto 0);
	 );
END ImgGenerator;

ARCHITECTURE behavior OF ImgGenerator IS

signal figura:std_LOGIC_VECTOR(7 downto 0);
signal shift_x:integer;
signal shift_y:integer;

BEGIN

shift_x<=
	0 when position="0000" else
	127 when position="0001" else
	255 when position="0010" else
	383 when position="0011" else
	511 when position="0100" else
	0 when position="0101" else
	127 when position="0110" else
	255 when position="0111" else
	383 when position="1000" else
	511;
	
shift_y<=
	0 when position<"0101" else
	239; 
	
figura<="00110000" when   -- cruz
		(((x=63+shift_x or x=64+shift_x or x=62+shift_x)and y>(shift_y) and y<(239+shift_y))  or ((y=121+shift_y or y=120+shift_y or y=119+shift_y)and x<(120+shift_x)and ((y=121+shift_y or y=120+shift_y or y=119+shift_y)and x>(0+shift_x)))) and byte = "00110000" else
"00110001" when --linea
		((x=63 + shift_x) and (y>(shift_y) and y<(239+shift_y))) and byte = "00110001" else
"00110010"when --cuadrado
    (((x=89 + shift_x or x=29 + shift_x) and (y<160+shift_y and y<161+shift_y  and y>71+shift_y  and y>70+shift_y ))or((x=89 + shift_x or x=29 + shift_x) and (y=160+shift_y  or y=70+shift_y )) or ((y= 160+shift_y or y= 70+shift_y) and (x>29+shift_x and x<89+shift_x))) and byte = "00110010"else
		--(x<345 and x>285 and y<160 and y>70) else
"00110011" when --triangulo
	((((x=y+shift_x-shift_y) and (y<160+shift_y and y>55+shift_y))and((x<115+shift_x and x>65+shift_x))) or
		(((x=(128+shift_x-(y)+shift_y)) and (y<160+shift_y and y>55+shift_y))and((x<65+shift_x and x>15+shift_x))) or   
		   (y=115+shift_y and x>15+shift_x and x<115+shift_x))and byte = "00110011" else
"00110100" when --rombo
		(((((x=y-100+shift_x-shift_y) and (y<166+shift_y and y>55+shift_y))and((x<115+shift_x and x>15+shift_x))) or--3
		(((x=(128+shift_x-(y)+shift_y)) and (y<160+shift_y and y>55+shift_y))and((x<65+shift_x and x>15+shift_x))) or--1   
		   (y=115+shift_y and x>15+shift_x and x<115+shift_x))or--horizontal
			((((x=y-shift_y+shift_x) and (y<160+shift_y and y>55+shift_y))and((x<115+shift_x and x>65+shift_x))))or--2 
			((((x=(128+shift_x-(y-100)+shift_y)) and (y<165+shift_y and y>55+shift_y))and((x<115+shift_x and x>55+shift_x))))) and byte = "00110100" else--4
			
	"00000000";


process(x,y,sw_RED,SW_Blue,figura)
begin
	if(x<127 and y<239)then --primer cuadro
		if(figura="00110000")then
			red<="11111111";
			green<="11111111";
			blue<="11111111";
			elsif (figura="00110001")then
			red<="11111111";
			green<="11111111";
			blue<="11111111";
			elsif (figura="00110010")then
			red<="11111111";
			green<="11111111";
			blue<="11111111";
			elsif (figura="00110011")then
			red<="11111111";
			green<="11111111";
			blue<="11111111";
			elsif (figura="00110100")then
			red<="11111111";
			green<="11111111";
			blue<="11111111";
		else
			red<="11111111";
			green<="00000000";
			blue<="00000000";
		end if;
		
		
	elsif(x<255 and y<239)then  --segundo cuadro
		if(figura="00110000")then
			red<="11111111";
			green<="11111111";
			blue<="11111111";
			elsif (figura="00110001")then
			red<="11111111";
			green<="11111111";
			blue<="11111111";
			elsif (figura="00110010")then
			red<="11111111";
			green<="11111111";
			blue<="11111111";
			elsif (figura="00110011")then
			red<="11111111";
			green<="11111111";
			blue<="11111111";
			elsif (figura="00110100")then
			red<="11111111";
			green<="11111111";
			blue<="11111111";
		else
		red<="00000000";
		green<="11111111";
		blue<="00000000";
		end if;
	elsif(x<383 and y< 239)then  --tercer cuadro
		if(figura="00110000")then
			red<="11111111";
			green<="11111111";
			blue<="11111111";
			elsif (figura="00110001")then
			red<="11111111";
			green<="11111111";
			blue<="11111111";
			elsif (figura="00110010")then
			red<="11111111";
			green<="11111111";
			blue<="11111111";
			elsif (figura="00110011")then
			red<="11111111";
			green<="11111111";
			blue<="11111111";
			elsif (figura="00110100")then
			red<="11111111";
			green<="11111111";
			blue<="11111111";
		else	
		red<="00000000";
		green<="00000000";
		blue<="11111111";
		end if; 
	elsif(x<511 and y<239)then   --cuarto cuadro
	if(figura="00110000")then
			red<="11111111";
			green<="11111111";
			blue<="11111111";
			elsif (figura="00110001")then
			red<="11111111";
			green<="11111111";
			blue<="11111111";
			elsif (figura="00110010")then
			red<="11111111";
			green<="11111111";
			blue<="11111111";
			elsif (figura="00110011")then
			red<="11111111";
			green<="11111111";
			blue<="11111111";
			elsif (figura="00110100")then
			red<="11111111";
			green<="11111111";
			blue<="11111111";
			else 
		red<="11111111";
		green<="11111111";
		blue<="00000000";
		end if; 
	elsif(x<639 and y<239)then     --quinto cuadro
	if(figura="00110000")then
	      	red<="11111111";
			green<="11111111";
			blue<="11111111";
			elsif (figura="00110001")then
			red<="11111111";
			green<="11111111";
			blue<="11111111";
			elsif (figura="00110010")then
			red<="11111111";
			green<="11111111";
			blue<="11111111";
			elsif (figura="00110011")then
			red<="11111111";
			green<="11111111";
			blue<="11111111";
			elsif (figura="00110100")then
			red<="11111111";
			green<="11111111";
			blue<="11111111";
		else
		red<="00000000";
		green<="11111111";
		blue<="11111111";
		end if; 
	elsif(x<127 and y>239)then        --sexto cuadro
		if(figura="00110000")then
			red<="11111111";
			green<="11111111";
			blue<="11111111";
			elsif (figura="00110001")then
			red<="11111111";
			green<="11111111";
			blue<="11111111";
			elsif (figura="00110010")then
			red<="11111111";
			green<="11111111";
			blue<="11111111";
			elsif (figura="00110011")then
			red<="11111111";
			green<="11111111";
			blue<="11111111";
			elsif (figura="00110100")then
			red<="11111111";
			green<="11111111";
			blue<="11111111";
			else
		red<="00000000";
		green<="11111111";
		blue<="11111111";
		end if; 
	elsif(x<255 and y>239)then       --septimo cuadro
		if(figura="00110000")then
			red<="11111111";
			green<="11111111";
			blue<="11111111";
			elsif (figura="00110001")then
			red<="11111111";
			green<="11111111";
			blue<="11111111";
			elsif (figura="00110010")then
			red<="11111111";
			green<="11111111";
			blue<="11111111";
			elsif (figura="00110011")then
			red<="11111111";
			green<="11111111";
			blue<="11111111";
			elsif (figura="00110100")then
			red<="11111111";
			green<="11111111";
			blue<="11111111";
			else 
		red<="11111111";
		green<="11111111";
		blue<="00000000";
		end if; 
	elsif(x<383 and y> 239)then        --octavo cuadro
		if(figura="00110000")then
			red<="11111111";
			green<="11111111";
			blue<="11111111";
			elsif (figura="00110001")then
			red<="11111111";
			green<="11111111";
			blue<="11111111";
			elsif (figura="00110010")then
			red<="11111111";
			green<="11111111";
			blue<="11111111";
			elsif (figura="00110011")then
			red<="11111111";
			green<="11111111";
			blue<="11111111";
			elsif (figura="00110100")then
			red<="11111111";
			green<="11111111";
			blue<="11111111";
			else 
		red<="11111111";
		green<="00000000";
		blue<="11111111";
		end if; 
	elsif(x<511 and y>239)then       --noveno cuadro
		if(figura="00110000")then
			red<="11111111";
			green<="11111111";
			blue<="11111111";
			elsif (figura="00110001")then
			red<="11111111";
			green<="11111111";
			blue<="11111111";
			elsif (figura="00110010")then
			red<="11111111";
			green<="11111111";
			blue<="11111111";
			elsif (figura="00110011")then
			red<="11111111";
			green<="11111111";
			blue<="11111111";
			elsif (figura="00110100")then
			red<="11111111";
			green<="11111111";
			blue<="11111111";
			else 
		red<="00000000";
		green<="11111111";
		blue<="00000000";
end if; 
	elsif(x<639 and y>239)then  --decimo cuadro
		if(figura="00110000")then
			red<="11111111";
			green<="11111111";
			blue<="11111111";
			elsif (figura="00110001")then
			red<="11111111";
			green<="11111111";
			blue<="11111111";
			elsif (figura="00110010")then
			red<="11111111";
			green<="11111111";
			blue<="11111111";
			elsif (figura="00110011")then
			red<="11111111";
			green<="11111111";
			blue<="11111111";
			elsif (figura="00110100")then
			red<="11111111";
			green<="11111111";
			blue<="11111111";
			else 
		red<="11111111";
		green<="00000000";
		blue<="00000000";
		end if; 
	else
		red<="00000000";
		green<="00000000";
		blue<="00000000";
	end if;
end process;

END behavior;