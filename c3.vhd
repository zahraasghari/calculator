library ieee;
use ieee.std_logic_1164.all;
entity c3 is
port ( a: in std_logic_vector(7 downto 0);
b: in std_logic_vector(7 downto 0);

f: out std_logic_vector(7 downto 0) 
);
end c3;
architecture c3_estr of c3 is 
begin

f <= a xor b ;
end c3_estr;
 