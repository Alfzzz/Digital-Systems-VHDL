library ieee;
use IEEE.STD_LOGIC_1164.all;

entity fullAdder is
port(
 a,b, cin: in std_logic;
 s: out std_logic
);
end fullAdder;

architecture Beh of fullAdder is
begin

s<=a xor b xor cin;

end Beh;