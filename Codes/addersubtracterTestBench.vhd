LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_addersubtracter IS
END tb_addersubtracter;
 
ARCHITECTURE behavior OF tb_addersubtracter IS
 
 -- Component Declaration for the Unit Under Test (UUT)
 
 COMPONENT addersubtracter
 PORT(
	sel : in STD_LOGIC;
	a,b : in std_logic_VECTOR(3 downto 0);
    res: out std_logic_VECTOR(3 downto 0);
	overflow, cout : OUT std_logic
 );
 END COMPONENT;
 
 --Inputs
 signal a, b, res : std_logic_VECTOR(3 downto 0);
 signal sel : std_logic;
 
 --Outputs
 signal overflow, cout : std_logic;
 -- appropriate port name
 
BEGIN
 
 -- Instantiate the Unit Under Test (UUT)
 uut: addersubtracter PORT MAP (
 sel => sel,
 a => a,
 b => b,
 res => res,
 overflow => overflow,
 cout => cout
 );
 
 -- Stimulus process
 stim_proc: process
 begin
 
 a <= "0000";
 b <= "0001";
 sel <= '0'; -- 0 is plus and 1 is subtract
 wait for 500 ns;
 a <= "0100";
 b <= "1001";
 sel <= '0'; -- 0 is plus and 1 is subtract
 wait for 500 ns;
 a <= "0110";
 b <= "1101";
 sel <= '0'; -- 0 is plus and 1 is subtract
 wait for 500 ns;
 a <= "0100";
 b <= "0001";
 sel <= '1'; -- 0 is plus and 1 is subtract
 wait for 500 ns;
 a <= "0010";
 b <= "1101";
 sel <= '1'; -- 0 is plus and 1 is subtract
 wait for 500 ns;
 
 wait;
 end process;
 
END;
