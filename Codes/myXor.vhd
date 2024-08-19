library IEEE;
use IEEE.STD_LOGIC_1164.all;
 
entity myXor is
 port(
	a,b : in std_logic;
    o: out std_logic
 );
end myXor;
 
architecture bhv of myXor is
begin
 
	o <= a xor b after 15 ns;
end bhv;