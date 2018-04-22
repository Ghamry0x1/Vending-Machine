entity vendingMachine is
	port(
		vdd: in bit;
		vss: in bit;
		clk: in bit;
		input: in bit_vector(2 downto 0);
		rst: in bit;
		output: out bit_vector(1 downto 0);
		change: out bit_vector(1 downto 0)
	);
end vendingMachine;

architecture beh of vendingMachine is
	type state_type is (s0, s1, s2, s3, s4, s5, s6, s7, s8);
	signal current_s, next_s: state_type;

	--Synthesis directives:
	--pragma current_state current_s
	--pragma next_state next_s
	--pragma clock clk

	begin
	process(clk, rst)
		begin
			if (rising_edge(clk) and rst = '1') then
				current_s <= s0;
			elsif(rising_edge(clk)) then
				current_s <= next_s;
			end if;
	end process;

	process (current_s, input)
		begin
			case current_s is
				when s0 =>
					output <= "00";
					change <= "00";
					if(input = "000") then
						next_s <= s1;
					elsif(input = "001") then
						next_s <= s2;
					elsif(input = "010") then
						next_s <= s4;
					end if;

				when s1 =>
					output <= "00";
					change <= "00";
					if(input = "000") then
						next_s <= s2;
					elsif(input = "001") then
						next_s <= s3;
					elsif(input = "010") then
						next_s <= s5;
					end if;
	
				when s2 =>
					output <= "00";
					if(input = "000") then
						next_s <= s3;
						change <= "00";
					elsif(input = "001") then
						next_s <= s4;
						change <= "00";
					elsif(input = "010") then
						next_s <= s6;
						change <= "01";
					end if;

				when s3 =>
					output <= "00";
					if(input = "000") then
						next_s <= s4;
						change <= "00";
					elsif(input = "001") then
						next_s <= s5;
						change <= "00";
					elsif(input = "010") then
						next_s <= s7;
						change <= "10";
					end if;
	
				when s4 =>
					output <= "00";
					if(input = "000") then
						next_s <= s5;
						change <= "00";
					elsif(input = "001") then
						next_s <= s6;
						change <= "01";
					elsif(input = "010") then
						next_s <= s8;
						change <= "11";
					end if;

				when s5 =>
					change <= "00";
					if(input = "011") then
						next_s <= s0;
						output <= "01";
					elsif(input = "100") then
						next_s <= s0;
						output <= "10";
					end if;

				when s6 =>
					change <= "00";
					if(input = "011") then
						next_s <= s0;
						output <= "01";
					elsif(input = "100") then
						next_s <= s0;
						output <= "10";
					end if;

				when s7 =>
					change <= "00";
					if(input = "011") then
						next_s <= s0;
						output <= "01";
					elsif(input = "100") then
						next_s <= s0;
						output <= "10";
					end if;

				when s8 =>
					change <= "00";
					if(input = "011") then
						next_s <= s0;
						output <= "01";
					elsif(input = "100") then
						next_s <= s0;
						output <= "10";
					end if;
  			end case;
	end process;
end beh;