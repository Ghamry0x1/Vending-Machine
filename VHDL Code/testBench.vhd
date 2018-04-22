-- Entity declaration for your testbench. Don't declare any ports here
ENTITY vendingMachine_testbench IS
END ENTITY vendingMachine_testbench;

ARCHITECTURE testbench OF vendingMachine_testbench IS

-- Component Declaration for the Device Under Test (DUT)
COMPONENT vendingMachine IS
port(
		vdd: in bit;
		vss: in bit;
		clk: in bit;
		input: in bit_vector(2 downto 0);
		rst: in bit;
		output: out bit_vector(1 downto 0);
		change: out bit_vector(1 downto 0)
	);
END COMPONENT vendingMachine;

FOR dut: vendingMachine USE ENTITY WORK.vendingMachine (beh);

-- Inputs
SIGNAL clk   	: bit := '0';
SIGNAL rst 	: bit := '1';
SIGNAL vdd   	: bit := '1';
SIGNAL vss   	: bit := '0';
SIGNAL input 	: bit_vector(2 Downto 0) := "101";

-- Outputs
SIGNAL change 	: bit_vector(1 Downto 0);
SIGNAL output 	: bit_vector(1 Downto 0);

-- Constants and Clock period definitions
constant clk_period : time := 1000 ns;
BEGIN
	dut: vendingMachine PORT MAP (vdd, vss, clk, input, rst, output, change);
	clk_process :process
   begin
        clk <= '0';
        wait for clk_period/2;  
        clk <= '1';
        wait for clk_period/2;  
   end process;
   stim_proc: PROCESS IS
BEGIN
	WAIT FOR clk_period; --For the output to be stable
	ASSERT change = "00" and output = "00"
	REPORT "Reset error"
	SEVERITY error;
	
	rst <= '0';

	input <= "000";
	WAIT FOR clk_period;
	ASSERT change = "00" and output = "00"
	REPORT "Outputs error"
	SEVERITY error;

	input <= "000";
	WAIT FOR clk_period;
	ASSERT change = "00" and output = "00"
	REPORT "Outputs error"
	SEVERITY error;
	
	input <= "000";
	WAIT FOR clk_period;
	ASSERT change = "00" and output = "00"
	REPORT "Outputs error"
	SEVERITY error;

	input <= "000";
	WAIT FOR clk_period;
	ASSERT change = "00" and output = "00"
	REPORT "Outputs error"
	SEVERITY error;

	input <= "000";
	WAIT FOR clk_period;
	ASSERT change = "00" and output = "00"
	REPORT "Outputs error"
	SEVERITY error;

	input <= "011";
	WAIT FOR clk_period;
	ASSERT change = "00" and output = "01"
	REPORT "Outputs error"
	SEVERITY error;

	input <= "001";
	WAIT FOR clk_period;
	ASSERT change = "00" and output = "00"
	REPORT "Outputs error"
	SEVERITY error;

	input <= "010";
	WAIT FOR clk_period;
	ASSERT change = "00" and output = "00"
	REPORT "Outputs error"
	SEVERITY error;

	input <= "100";
	WAIT FOR clk_period;
	ASSERT change = "01" and output = "10"
	REPORT "Outputs error"
	SEVERITY error;
end process;
end;