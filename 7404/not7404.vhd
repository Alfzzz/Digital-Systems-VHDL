library ieee;
use IEEE.STD_LOGIC_1164.all;

entity not7404 is
port(a1,a2,a3,a4,a5,a6: in std_logic;
S1, S2, S3, S4,S5,S6 : out std_logic);

end not7404;

architecture christian of not7404 is
begin
S1 <= not a1;
S2 <= not a2;
S3 <= not a3;
S4 <= not a4;
s5<=not a5;
s6<=not a1;

-- LEDR (0) <= SW(0);
-- LEDR (1) <= SW(1);
end christian;