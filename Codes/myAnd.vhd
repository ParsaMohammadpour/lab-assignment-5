library IEEE;
use IEEE.STD_LOGIC_1164.all;
 
entity myAnd is
 port(
	a,b : in std_logic;
    o: out std_logic
 );
end myAnd;
 
architecture bhv of myAnd is
begin
 
	o <= a and b after 5 ns;
end bhv;