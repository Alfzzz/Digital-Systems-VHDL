library ieee;
use IEEE.STD_LOGIC_1164.all;

entity fullAdder is
port(
 a,b, cin: in std_logic;
 s,cout: out std_logic
);
end fullAdder;

architecture Beh of fullAdder is
signal sn1,sn2,sn3: std_logic;
begin

sn1<=a xor b;
sn2<=cin and sn1;
sn3<=a and b;
s<=cin xor sn1;
cout<=sn2 or sn3;



end Beh;