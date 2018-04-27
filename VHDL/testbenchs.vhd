-- Entity declaration for your testbench. Don't declare any ports here
ENTITY vendingmachineos IS
END ENTITY vendingmachineos;

ARCHITECTURE testbench OF vendingmachineos IS

-- Component Declaration for the Device Under Test (DUT)
COMPONENT vendingmachineo_s IS
port (
      vdd     : in      bit;
      vss     : in      bit;
      clk     : in      bit;
      input   : in      bit_vector(2 downto 0);
      rst     : in      bit;
      output  : out     bit_vector(1 downto 0);
      change  : out     bit_vector(1 downto 0);
      scanin  : in      bit;
      test    : in      bit;
      scanout : out     bit
 );
END COMPONENT vendingmachineo_s;

FOR dut: vendingmachineo_s USE ENTITY WORK.vendingmachineo_s (structural);

-- Inputs
SIGNAL clk   	: bit := '0';
SIGNAL rst 	: bit := '1';
SIGNAL vdd   	: bit := '1';
SIGNAL vss   	: bit := '0';
SIGNAL input 	: bit_vector(2 Downto 0) := "101";
SIGNAL scanin 	: bit := '0';
SIGNAL test   	: bit := '0';
SIGNAL scanout  : bit := '0';

-- Outputs
SIGNAL change 	: bit_vector(1 Downto 0);
SIGNAL output 	: bit_vector(1 Downto 0);

-- Constants and Clock period definitions
constant clk_period : time := 1000 ns;
constant sequence: bit_vector := "0011111011011100100111100";

BEGIN
	dut: vendingmachineo_s PORT MAP (vdd, vss, clk, input, rst, output, change, scanin, test, scanout);
	clk_process :process
   begin
        clk <= '0';
        wait for clk_period/2;  
        clk <= '1';
        wait for clk_period/2;  
   end process;
   stim_proc: PROCESS IS
BEGIN
	test <= '1';
	for i In 0 to sequence'length-1 loop
	wait for clk_period; -- Leave time for the output to stabilize
	if i>=4 then -- Assert condition
	Assert scanout=sequence(i-4)
	Report "scanout does not follow scan in"
	Severity error;
	end if;
	scanin <= sequence(i); -- scanin changes on the next wait
	end loop;
	test <= '0';

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