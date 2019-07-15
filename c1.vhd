library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity c1 is
port ( a: in std_logic_vector(7 downto 0);
b: in std_logic_vector(7 downto 0);

f: out std_logic_vector(7 downto 0) 
);
end c1;
architecture c1_estr of c1 is 
begin
f <= a + b;
end c1_estr;
 