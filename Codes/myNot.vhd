library IEEE;
use IEEE.STD_LOGIC_1164.all;
 
entity myNot is
 port(
	a,b : in std_logic;
    o: out std_logic
 );
end myNot;
 
architecture bhv of myNot is
begin
 
	o <= not a after 2 ns;
end bhv;