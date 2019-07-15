library ieee;
use ieee.std_logic_1164.all ;
entity decoder is
port(
c: in std_logic_vector(3 downto 0);
f: out std_logic_vector (7 downto 0));
end decoder;
architecture decoder_bhv of decoder is
begin
f<= "01000000" when c="0000" else
    "01111001" when c="0001" else
	 "00100100" when c="0010" else
	 "00110000" when c="0011" else
	 "00011001" when c="0100" else
	 "00010010" when c="0101" else
	 "00000010" when c="0110" else
	 "01111000" when c="0111" else
	 "00000000" when c="1000" else
	 "00010000" when c="1001" else
	 "00001000" when c="1010" else
	 "00000011" when c="1011" else
	 "01000110" when c="1100" else
	 "00100001" when c="1101" else
	 "00000110" when c="1110" else
	 "00001110";
	 end decoder_bhv;
	 
