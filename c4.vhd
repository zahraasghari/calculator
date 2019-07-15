library ieee;
use ieee.std_logic_1164.all;
entity c4 is
port ( a: in std_logic_vector(7 downto 0);


f: out std_logic_vector(7 downto 0) 
);
end c4;
architecture c4_estr of c4 is 
begin

f <= not a ;
end c4_estr;
 