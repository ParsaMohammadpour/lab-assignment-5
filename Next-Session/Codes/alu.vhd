library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
 
entity alu is
 port(
	op : in STD_LOGIC_VECTOR(2 downto 0);
	a,b : in SIGNED(7 downto 0);
    z: out SIGNED(7 downto 0);
	OV, Cout, Sign : OUT std_logic
 );
end alu;
 
architecture bhv of alu is
 -- Component Declaration for the Unit Under Test (UUT)
 
 signal a_plus_b, a_minus_b, a_and_b, a_or_b, a_xor_b, a_not, a_one_shift_right, b_one_shift_left, z_res : SIGNED(7 downto 0);
 
begin
	a_plus_b <= a + b;
	a_minus_b <= a - b;
	a_or_b <= a or b;
	a_xor_b <= a xor b;
	a_and_b <= a and b;
	a_not <= not a;
	a_one_shift_right <= a srl 1;
	b_one_shift_left <= b sll 1;
	
	z_res <= a_plus_b when op = "000" else 
		a_minus_b when op = "001" else 
		a_and_b when op = "010" else 
		a_or_b when op = "011" else 
		a_xor_b when op = "100" else 
		a_not when op = "101" else
		a_one_shift_right when op = "110" else
		b_one_shift_left when op = "111";
		
	Cout <=  ((a(7) and b(7) and (not z_res(7))) or ((not a(7)) and (not b(7)) and z_res(7))) when op = "000" else 
		  ((a(7) and (not b(7)) and z_res(7)) or ((not a(7)) and b(7) and (not z_res(7))))when op = "001" else '0';
	z <= z_res(7 downto 0);
	OV <= ((a(7) and b(7) and (not z_res(7))) or ((not a(7)) and (not b(7)) and z_res(7))) when op = "000" else 
		  ((a(7) and (not b(7)) and z_res(7)) or ((not a(7)) and b(7) and (not z_res(7))))when op = "001" else '0';
		  
	Sign <= z_res(7);
 
end bhv;