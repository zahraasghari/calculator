Library ieee;
Use ieee.std_logic_1164.all;

Entity fourbit_register is
	port ( clk,rst,en: in std_logic;
	d: 	In	Std_logic_vector (3 downto 0);
		q		:	Out	Std_logic_vector (3 downto 0) 
	);
end fourbit_register;

Architecture dff_bhv of fourbit_register is
begin
process(clk,d,rst,en)
begin
if (rst='0') then
q <= "0000";
elsif clk' event and clk='1' then
if en ='1' then
q <= d;
end if;
end if;
end process;
end Architecture;