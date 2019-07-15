Library ieee;
Use ieee.std_logic_1164.all;

Entity eightbit_register is
	port ( en,clk,rst: in std_logic;
	d: 	In	Std_logic_vector (7 downto 0);
		q		:	Out	Std_logic_vector (7 downto 0) 
	);
end eightbit_register;

Architecture dff_bhv of eightbit_register is
begin
process(clk,d,rst,en)
begin
if (rst='0') then
q <= (others => '0');
elsif clk' event and clk='1' then
if en ='1' then
q <= d;
end if;
end if;
end process;
end Architecture;