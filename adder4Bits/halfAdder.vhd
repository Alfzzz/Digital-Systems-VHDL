library ieee;
use IEEE.STD_LOGIC_1164.all;

entity halfAdder is
port(
 a,b: in std_logic;
 led1,led2: out std_logic
);
end halfAdder;

architecture Beh of halfAdder is
begin
led1 <= (a XOR b) ;
led2 <= (a AND b) ;



-- LEDR (0) <= SW(0);
-- LEDR (1) <= SW(1);



end Beh;