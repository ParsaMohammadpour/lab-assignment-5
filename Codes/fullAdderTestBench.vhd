LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_fulladder IS
END tb_fulladder;
 
ARCHITECTURE behavior OF tb_fulladder IS
 
 -- Component Declaration for the Unit Under Test (UUT)
 
 COMPONENT fulladder
 PORT(
 a,b,cin : in std_logic;
 o, cout: out std_logic
 );
 END COMPONENT;
 
 --Inputs
 signal a, b, cin : std_logic;
 
 --Outputs
 signal o, cout : std_logic;
 -- appropriate port name
 
BEGIN
 
 -- Instantiate the Unit Under Test (UUT)
 uut: fulladder PORT MAP (
 a => a,
 b => b,
 cin => cin,
 o => o,
 cout => cout
 );
 
 -- Stimulus process
 stim_proc: process
 begin
 
 a <= '0';
 b <= '0';
 cin <='0';
 wait for 50 ns;
 a <= '1';
 b <= '0';
 cin <='0';
 wait for 50 ns;
 a <= '0';
 b <= '1';
 cin <='0';
 wait for 50 ns;
 a <= '1';
 b <= '1';
 cin <='0';
 wait for 50 ns;
 a <= '0';
 b <= '0';
 cin <='1';
 wait for 50 ns;
 a <= '1';
 b <= '0';
 cin <='1';
 wait for 50 ns;
 a <= '0';
 b <= '1';
 cin <='1';
 wait for 50 ns;
 a <= '1';
 b <= '1';
 cin <='1';
 wait for 50 ns;
 
 wait;
 end process;
 
END;
