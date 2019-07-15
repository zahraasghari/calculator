library ieee;
use ieee.std_logic_1164.all;

entity top is
port ( sw: in std_logic_vector(17 downto 0);
enter,rst,clk: in std_logic;
hex0,hex1: out std_logic_vector(7 downto 0);
ledr : out std_logic_vector( 7 downto 0)
);
end top;
architecture top_map of top is 
signal f,f1,f2,f3,f4,z:std_logic_vector (7 downto  0);
signal g1,g2:std_logic_vector (3 downto  0);
signal sel:std_logic_vector (1 downto  0);
signal en1,en2: std_logic;

component c1
port ( a: in std_logic_vector(7 downto 0);
b: in std_logic_vector(7 downto 0);

f: out std_logic_vector(7 downto 0) 
);
end component;

component c2
port ( a: in std_logic_vector(7 downto 0);
b: in std_logic_vector(7 downto 0);

f: out std_logic_vector(7 downto 0) 
);
end component;

component c3
port ( a: in std_logic_vector(7 downto 0);
b: in std_logic_vector(7 downto 0);

f: out std_logic_vector(7 downto 0) 
);
end component;

component c4
port ( a: in std_logic_vector(7 downto 0);

f: out std_logic_vector(7 downto 0) 
);
end component;
component mux
port (a,b,c,d : in std_logic_vector ( 7 downto 0);
    s: in std_logic_vector (1 downto 0);
	pout: out std_logic_vector ( 7 downto 0)
	);

end component;

component decoder
port(
c: in std_logic_vector(3 downto 0);
f: out std_logic_vector (7 downto 0));

end component;
component fourbit_register
port ( 
	d: 	In	Std_logic_vector (3 downto 0);
	en,clk,rst: in std_logic;
		q		:	Out	Std_logic_vector (3 downto 0) 
	);
	end component;
	component eightbit_register
	port ( 
	d: 	In	Std_logic_vector (7 downto 0);
	clk,rst,en: in std_logic;
		q		:	Out	Std_logic_vector (7 downto 0) 
	);
	end component;
   	component FSMctrl
	port ( clk,rst,enter: in std_logic;
       operation: in std_logic_vector (1 downto 0);
		 selection: out std_logic_vector (1 downto 0);
		 enable_1 , enable_2 :out std_logic 
	);
	end component;

begin
l1: c1 port map (sw (7 downto 0),z,f1);
l2: c2 port map (sw (7 downto 0),z,f2);
l3: c3 port map (sw (7 downto 0),z,f3);
l4: c4 port map (sw (7 downto 0),f4);
l5: mux port map (f1,f2,f3,f4,sel(1 downto 0),f);
l6:fourbit_register port map (f(7 downto 4),en2,clk,rst,g1(3 downto 0)); 
l7:fourbit_register port map (f(3 downto 0),en2,clk,rst,g2(3 downto 0));
l8:eightbit_register port map (f(7 downto 0),clk,rst,en2,ledr);
l9:decoder port map (g1(3 downto 0),hex0);
l10:decoder port map (g2(3 downto 0),hex1);
l11:eightbit_register port map (sw(7 downto 0),clk,rst,en1,z);
l12:FSMctrl port map (clk,rst,enter,sw(17 downto 16),sel(1 downto 0),en1,en2);


end top_map ;

 