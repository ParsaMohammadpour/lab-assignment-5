library IEEE;
use IEEE.STD_LOGIC_1164.all;
 
entity fulladder is
 port(
	a,b,cin : in std_logic;
    o, cout: out std_logic
 );
end fulladder;
 
architecture bhv of fulladder is
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
 
 --Inputs
 signal a_xor_b : STD_LOGIC;
 signal a_and_b : STD_LOGIC;
 signal a_or_b : std_logic;
 signal cin_and_a_or_b : STD_LOGIC;
 signal o_res : STD_LOGIC;
 signal cout_res : STD_LOGIC;
 
begin
	-- Instantiating
	a_xor_b_instance: myXor PORT MAP (
		a => a,
		b => b,
		o => a_xor_b
	);
	a_and_b_instance: myAnd PORT MAP(
		a => a,
		b => b,
		o => a_and_b
	);
	a_or_b_instance: myOr port MAP(
		a => a,
		b => b,
		o => a_or_b
	);
	cin_and_a_or_b_instance: myAnd PORT MAP(
		a => cin,
		b => a_or_b,
		o => cin_and_a_or_b
	);
	o_res_instance: myXor port MAP(
		a => a_xor_b,
		b => cin,
		o => o_res
	);
	cout_res_instance: myOr port MAP(
		a => a_and_b,
		b => cin_and_a_or_b,
		o => cout_res
	);
	
	o <= o_res;
    cout <= cout_res;
 
end bhv;