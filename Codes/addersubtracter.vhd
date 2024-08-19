library IEEE;
use IEEE.STD_LOGIC_1164.all;
 
entity addersubtracter is
 port(
	sel : in STD_LOGIC;
	a,b : in std_logic_VECTOR(3 downto 0);
    res: out std_logic_VECTOR(3 downto 0);
	overflow, cout : OUT std_logic
	
 );
end addersubtracter;
 
architecture bhv of addersubtracter is
 -- Component Declaration for the Unit Under Test (UUT)
 
 COMPONENT myAnd
 PORT(
 a, b : IN STD_LOGIC;
 o : OUT STD_LOGIC
 );
 END COMPONENT;
 
 COMPONENT myOr
 PORT(
 a, b : IN STD_LOGIC;
 o : OUT STD_LOGIC
 );
 END COMPONENT;
 
 COMPONENT myNot
 PORT(
 a : IN STD_LOGIC;
 o : OUT STD_LOGIC
 );
 END COMPONENT;
 
 COMPONENT myXor
 PORT(
 a, b : IN STD_LOGIC;
 o : OUT STD_LOGIC
 );
 END COMPONENT; 
 
 COMPONENT fulladder
 PORT(
	a,b,cin : in std_logic;
    o, cout: out std_logic
 );
 END COMPONENT;
 
 --Inputs
 signal b_xor_sel, res_signal : STD_LOGIC_VECTOR(3 downto 0);
 signal c1, c2, c3, c4, overflow_res : STD_LOGIC;
 
begin
	-- Instantiating
	b_xor_sel_instance0: myXor PORT MAP (
		a => b(0),
		b => sel,
		o => b_xor_sel(0)
	);
	b_xor_sel_instance1: myXor PORT MAP (
		a => b(1),
		b => sel,
		o => b_xor_sel(1)
	);
	b_xor_sel_instanc2: myXor PORT MAP (
		a => b(2),
		b => sel,
		o => b_xor_sel(2)
	);
	b_xor_sel_instance3: myXor PORT MAP (
		a => b(3),
		b => sel,
		o => b_xor_sel(3)
	);
	
	full_adder_instance0: fulladder PORT MAP(
		a => a(0),
		b => b_xor_sel(0),
		cin => sel,
		o => res_signal(0), 
		cout => c1
	);
	full_adder_instance1: fulladder PORT MAP(
		a => a(1),
		b => b_xor_sel(1),
		cin => c1,
		o => res_signal(1), 
		cout => c2
	);
	full_adder_instance2: fulladder PORT MAP(
		a => a(2),
		b => b_xor_sel(2),
		cin => c2,
		o => res_signal(2), 
		cout => c3
	);
	full_adder_instance3: fulladder PORT MAP(
		a => a(3),
		b => b_xor_sel(3),
		cin => c3,
		o => res_signal(3), 
		cout => c4
	);
	
	overflow_instance: myXor PORT MAP(
		a => c3,
		b => c4,
		o => overflow_res
	);
	
	overflow <= overflow_res;
	res <= res_signal;
	cout <= c4;
 
end bhv;