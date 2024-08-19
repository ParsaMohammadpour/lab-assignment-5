library IEEE;
use IEEE.STD_LOGIC_1164.all;
 
entity myOr is
 port(
	a,b : in std_logic;
    o: out std_logic
 );
end myOr;
 
architecture bhv of myOr is
begin
 
	o <= a or b after 5 ns;
end bhv;