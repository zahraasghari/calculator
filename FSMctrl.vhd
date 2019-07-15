library ieee;
use ieee.std_logic_1164.all;
entity FSMctrl is
  port(clk,rst,enter: in std_logic;
       operation: in std_logic_vector (1 downto 0);
		 selection: out std_logic_vector (1 downto 0);
		 enable_1 , enable_2 :out std_logic
		 );
end FSMctrl;
architecture fsm_bhv of FSMctrl is
   type states is (s0,s1,s2,s3,s4,s5,s6,s7);
	signal cs,ns : states;
	signal clock, reset : std_logic;
begin
   clock<=clk; reset<=rst;
process(clock, reset )
begin
   if reset='0' then
	  cs<= s0;
	elsif rising_edge (clock) then
	   cs<=ns;
		end if;
end process;
process(cs , enter)
begin
   case cs is
	   when s0=>
		   if enter='1' then ns<= s0; else ns<=s1;
			end if;
			enable_1<= '0'; enable_2<= '0';
      when s1=>
		   if enter='0' then ns<= s1; else ns<=s2;
			end if;
			enable_1<= '1'; enable_2<= '0';
		when s2=>
			enable_1<= '0'; enable_2<= '0';
			if operation="00" then
			   ns<=s3; --add
			elsif operation="01" then
				   ns<=s4; --or
			elsif operation="10" then
				   ns<=s5; --xor
			elsif operation="11" then
				   ns<=s6; --not
			end if;
		when s3 =>
	      selection<="00";
		   if enter='1' then ns<=s3;
		   else ns<=s7;
			end if;
		when s4=> 
         selection<="01";
		   if enter='1' then ns<=s4;
		   else ns<=s7;
			end if;
		when s5=>
		   selection<="10";
		   if enter='1' then ns<=s5;
		   else ns<=s7;
			end if;
	   when s6=>
		   selection<="11"; enable_1<= '0'; enable_2<= '1';
		   ns<=s0;
		when s7=>
		   enable_1<= '0'; enable_2<= '1';
			ns<=s0;
	 end case;
end process;
end fsm_bhv;
	
	