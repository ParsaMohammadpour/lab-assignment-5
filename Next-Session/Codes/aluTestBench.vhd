library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
 
ENTITY tb_alu IS
END tb_alu;
 
ARCHITECTURE behavior OF tb_alu IS
 
 -- Component Declaration for the Unit Under Test (UUT)
 
 COMPONENT alu
 PORT(
	op : in STD_LOGIC_VECTOR(2 downto 0);
	a,b : in SIGNED(7 downto 0);
    z: out SIGNED(7 downto 0);
	OV, Cout, Sign : OUT std_logic
 );
 END COMPONENT;
 
 --Inputs & Outputs
 signal a, b, z : SIGNED(7 downto 0);
 signal op : STD_LOGIC_VECTOR(2 downto 0);
 signal OV, Cout, Sign : STD_LOGIC;
 -- appropriate port name
 
BEGIN
 
 -- Instantiate the Unit Under Test (UUT)
 uut: alu PORT MAP (
 op => op,
 a => a,
 b => b,
 z => z,
 OV => OV,
 Cout => Cout,
 Sign => Sign
 );
 
 -- Stimulus process
 stim_proc: process
 begin
 
 -- + Operation
 a <= to_signed(40, 8);
 b <= to_signed(57, 8);
 op <= "000";
 wait for 50 ns;
 a <= to_signed(60, 8);
 b <= to_signed(90, 8);
 op <= "000";
 wait for 50 ns;
 a <= to_signed(60, 8);
 b <= to_signed(-50, 8);
 op <= "000";
 wait for 50 ns;
 a <= to_signed(-90, 8);
 b <= to_signed(30, 8);
 op <= "000";
 wait for 50 ns;
 
 -- - Operation
 a <= to_signed(40, 8);
 b <= to_signed(50, 8);
 op <= "001";
 wait for 50 ns;
 a <= to_signed(60, 8);
 b <= to_signed(-50, 8);
 op <= "001";
 wait for 50 ns;
 a <= to_signed(-90, 8);
 b <= to_signed(30, 8);
 op <= "001";
 wait for 50 ns; 
 a <= to_signed(-90, 8);
 b <= to_signed(50, 8);
 op <= "001";
 wait for 50 ns; 
 
 
 -- & operation
 a <= to_signed(25, 8);
 b <= to_signed(67, 8);
 op <= "010";
 
 -- | operation
 op <= "011";
 
 -- XOR operaion
 op <= "100";
 
 -- ~ operation
 op <= "101";
 
 -- >> operation
 op <= "110";
 
 -- << operation
 op <= "111";
 
 wait;
 end process;
 
END;
