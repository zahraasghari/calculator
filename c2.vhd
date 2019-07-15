library ieee;
use ieee.std_logic_1164.all;
entity c2 is
port ( a: in std_logic_vector(7 downto 0);
b: in std_logic_vector(7 downto 0);

f: out std_logic_vector(7 downto 0) 
);
end c2;
architecture c2_estr of c2 is 
begin
f <= a or b;
end c2_estr;
 