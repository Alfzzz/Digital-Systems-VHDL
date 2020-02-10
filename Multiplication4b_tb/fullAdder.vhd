library ieee;
use IEEE.STD_LOGIC_1164.all;

entity fullAdder is
port(
 i1,i2, cin: in std_logic;
 s,cout: out std_logic
);
end fullAdder;

architecture Beh of fullAdder is
begin

s<=i1 xor i2 xor cin;
cout<=(i1 and i2)or (cin and i1) or (cin and i2);

end Beh;