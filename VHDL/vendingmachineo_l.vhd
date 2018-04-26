LIBRARY sxlib_ModelSim;
entity vendingmachineo_l is
   port (
      vdd    : in      bit;
      vss    : in      bit;
      clk    : in      bit;
      input  : in      bit_vector(2 downto 0);
      rst    : in      bit;
      output : out     bit_vector(1 downto 0);
      change : out     bit_vector(1 downto 0)
 );
end vendingmachineo_l;

architecture structural of vendingmachineo_l is
Component a4_x2
   port (
      i0  : in      bit;
      i1  : in      bit;
      i2  : in      bit;
      i3  : in      bit;
      q   : out     bit;
      vdd : in      bit;
      vss : in      bit
 );
end component;

Component inv_x4
   port (
      i   : in      bit;
      nq  : out     bit;
      vdd : in      bit;
      vss : in      bit
 );
end component;

Component ao2o22_x2
   port (
      i0  : in      bit;
      i1  : in      bit;
      i2  : in      bit;
      i3  : in      bit;
      q   : out     bit;
      vdd : in      bit;
      vss : in      bit
 );
end component;

Component noa22_x1
   port (
      i0  : in      bit;
      i1  : in      bit;
      i2  : in      bit;
      nq  : out     bit;
      vdd : in      bit;
      vss : in      bit
 );
end component;

Component oa2a2a23_x2
   port (
      i0  : in      bit;
      i1  : in      bit;
      i2  : in      bit;
      i3  : in      bit;
      i4  : in      bit;
      i5  : in      bit;
      q   : out     bit;
      vdd : in      bit;
      vss : in      bit
 );
end component;

Component oa2ao222_x2
   port (
      i0  : in      bit;
      i1  : in      bit;
      i2  : in      bit;
      i3  : in      bit;
      i4  : in      bit;
      q   : out     bit;
      vdd : in      bit;
      vss : in      bit
 );
end component;

Component no4_x1
   port (
      i0  : in      bit;
      i1  : in      bit;
      i2  : in      bit;
      i3  : in      bit;
      nq  : out     bit;
      vdd : in      bit;
      vss : in      bit
 );
end component;

Component oa22_x2
   port (
      i0  : in      bit;
      i1  : in      bit;
      i2  : in      bit;
      q   : out     bit;
      vdd : in      bit;
      vss : in      bit
 );
end component;

Component oa2a22_x2
   port (
      i0  : in      bit;
      i1  : in      bit;
      i2  : in      bit;
      i3  : in      bit;
      q   : out     bit;
      vdd : in      bit;
      vss : in      bit
 );
end component;

Component na2_x1
   port (
      i0  : in      bit;
      i1  : in      bit;
      nq  : out     bit;
      vdd : in      bit;
      vss : in      bit
 );
end component;

Component a3_x2
   port (
      i0  : in      bit;
      i1  : in      bit;
      i2  : in      bit;
      q   : out     bit;
      vdd : in      bit;
      vss : in      bit
 );
end component;

Component na3_x1
   port (
      i0  : in      bit;
      i1  : in      bit;
      i2  : in      bit;
      nq  : out     bit;
      vdd : in      bit;
      vss : in      bit
 );
end component;

Component sff1_x4
   port (
      ck  : in      bit;
      i   : in      bit;
      q   : out     bit;
      vdd : in      bit;
      vss : in      bit
 );
end component;

Component o3_x2
   port (
      i0  : in      bit;
      i1  : in      bit;
      i2  : in      bit;
      q   : out     bit;
      vdd : in      bit;
      vss : in      bit
 );
end component;

Component o2_x2
   port (
      i0  : in      bit;
      i1  : in      bit;
      q   : out     bit;
      vdd : in      bit;
      vss : in      bit
 );
end component;

Component a2_x2
   port (
      i0  : in      bit;
      i1  : in      bit;
      q   : out     bit;
      vdd : in      bit;
      vss : in      bit
 );
end component;

Component nao22_x1
   port (
      i0  : in      bit;
      i1  : in      bit;
      i2  : in      bit;
      nq  : out     bit;
      vdd : in      bit;
      vss : in      bit
 );
end component;

Component no2_x1
   port (
      i0  : in      bit;
      i1  : in      bit;
      nq  : out     bit;
      vdd : in      bit;
      vss : in      bit
 );
end component;

Component ao22_x2
   port (
      i0  : in      bit;
      i1  : in      bit;
      i2  : in      bit;
      q   : out     bit;
      vdd : in      bit;
      vss : in      bit
 );
end component;

Component inv_x2
   port (
      i   : in      bit;
      nq  : out     bit;
      vdd : in      bit;
      vss : in      bit
 );
end component;

Component no3_x1
   port (
      i0  : in      bit;
      i1  : in      bit;
      i2  : in      bit;
      nq  : out     bit;
      vdd : in      bit;
      vss : in      bit
 );
end component;

Component buf_x2
   port (
      i   : in      bit;
      q   : out     bit;
      vdd : in      bit;
      vss : in      bit
 );
end component;

signal mbk_buf_statmachine_current_s : bit_vector( 4 downto 4);
signal not_input                     : bit_vector( 2 downto 0);
signal not_statmachine_current_s     : bit_vector( 8 downto 0);
signal statmachine_current_s         : bit_vector( 8 downto 0);
signal oa2ao222_x2_sig               : bit;
signal oa2a2a23_x2_sig               : bit;
signal oa2a22_x2_sig                 : bit;
signal oa22_x2_sig                   : bit;
signal oa22_x2_9_sig                 : bit;
signal oa22_x2_8_sig                 : bit;
signal oa22_x2_7_sig                 : bit;
signal oa22_x2_6_sig                 : bit;
signal oa22_x2_5_sig                 : bit;
signal oa22_x2_4_sig                 : bit;
signal oa22_x2_3_sig                 : bit;
signal oa22_x2_2_sig                 : bit;
signal oa22_x2_10_sig                : bit;
signal o3_x2_sig                     : bit;
signal o2_x2_sig                     : bit;
signal o2_x2_2_sig                   : bit;
signal not_aux9                      : bit;
signal not_aux8                      : bit;
signal not_aux7                      : bit;
signal not_aux6                      : bit;
signal not_aux4                      : bit;
signal not_aux15                     : bit;
signal not_aux14                     : bit;
signal not_aux13                     : bit;
signal not_aux12                     : bit;
signal not_aux11                     : bit;
signal not_aux10                     : bit;
signal not_aux1                      : bit;
signal not_aux0                      : bit;
signal noa22_x1_sig                  : bit;
signal no4_x1_sig                    : bit;
signal no4_x1_2_sig                  : bit;
signal no3_x1_sig                    : bit;
signal no3_x1_4_sig                  : bit;
signal no3_x1_3_sig                  : bit;
signal no3_x1_2_sig                  : bit;
signal no2_x1_sig                    : bit;
signal no2_x1_5_sig                  : bit;
signal no2_x1_4_sig                  : bit;
signal no2_x1_3_sig                  : bit;
signal no2_x1_2_sig                  : bit;
signal nao22_x1_sig                  : bit;
signal nao22_x1_2_sig                : bit;
signal na3_x1_sig                    : bit;
signal na3_x1_2_sig                  : bit;
signal na2_x1_sig                    : bit;
signal na2_x1_4_sig                  : bit;
signal na2_x1_3_sig                  : bit;
signal na2_x1_2_sig                  : bit;
signal mbk_buf_not_aux7              : bit;
signal inv_x2_sig                    : bit;
signal inv_x2_3_sig                  : bit;
signal inv_x2_2_sig                  : bit;
signal aux5                          : bit;
signal aux16                         : bit;
signal aux14                         : bit;
signal aux13                         : bit;
signal aux1                          : bit;
signal ao22_x2_sig                   : bit;
signal ao22_x2_4_sig                 : bit;
signal ao22_x2_3_sig                 : bit;
signal ao22_x2_2_sig                 : bit;
signal a3_x2_sig                     : bit;
signal a3_x2_3_sig                   : bit;
signal a3_x2_2_sig                   : bit;
signal a2_x2_sig                     : bit;
signal a2_x2_8_sig                   : bit;
signal a2_x2_7_sig                   : bit;
signal a2_x2_6_sig                   : bit;
signal a2_x2_5_sig                   : bit;
signal a2_x2_4_sig                   : bit;
signal a2_x2_3_sig                   : bit;
signal a2_x2_2_sig                   : bit;

begin

not_aux4_ins : a4_x2
   port map (
      i0  => not_statmachine_current_s(1),
      i1  => not_statmachine_current_s(3),
      i2  => not_statmachine_current_s(2),
      i3  => not_statmachine_current_s(0),
      q   => not_aux4,
      vdd => vdd,
      vss => vss
   );

not_aux15_ins : o2_x2
   port map (
      i0  => not_aux14,
      i1  => not_input(1),
      q   => not_aux15,
      vdd => vdd,
      vss => vss
   );

not_aux12_ins : a2_x2
   port map (
      i0  => not_input(2),
      i1  => not_statmachine_current_s(8),
      q   => not_aux12,
      vdd => vdd,
      vss => vss
   );

not_aux11_ins : a2_x2
   port map (
      i0  => input(2),
      i1  => not_statmachine_current_s(6),
      q   => not_aux11,
      vdd => vdd,
      vss => vss
   );

not_aux10_ins : a2_x2
   port map (
      i0  => not_input(2),
      i1  => not_statmachine_current_s(7),
      q   => not_aux10,
      vdd => vdd,
      vss => vss
   );

not_aux9_ins : a2_x2
   port map (
      i0  => input(2),
      i1  => not_statmachine_current_s(5),
      q   => not_aux9,
      vdd => vdd,
      vss => vss
   );

not_statmachine_current_s_8_ins : inv_x2
   port map (
      i   => statmachine_current_s(8),
      nq  => not_statmachine_current_s(8),
      vdd => vdd,
      vss => vss
   );

not_aux8_ins : a2_x2
   port map (
      i0  => not_input(2),
      i1  => not_statmachine_current_s(6),
      q   => not_aux8,
      vdd => vdd,
      vss => vss
   );

not_aux7_ins : a2_x2
   port map (
      i0  => input(2),
      i1  => not_statmachine_current_s(4),
      q   => not_aux7,
      vdd => vdd,
      vss => vss
   );

not_statmachine_current_s_3_ins : inv_x2
   port map (
      i   => statmachine_current_s(3),
      nq  => not_statmachine_current_s(3),
      vdd => vdd,
      vss => vss
   );

not_statmachine_current_s_7_ins : inv_x2
   port map (
      i   => statmachine_current_s(7),
      nq  => not_statmachine_current_s(7),
      vdd => vdd,
      vss => vss
   );

not_statmachine_current_s_6_ins : inv_x2
   port map (
      i   => statmachine_current_s(6),
      nq  => not_statmachine_current_s(6),
      vdd => vdd,
      vss => vss
   );

not_statmachine_current_s_2_ins : inv_x2
   port map (
      i   => statmachine_current_s(2),
      nq  => not_statmachine_current_s(2),
      vdd => vdd,
      vss => vss
   );

not_aux6_ins : o2_x2
   port map (
      i0  => input(2),
      i1  => not_statmachine_current_s(5),
      q   => not_aux6,
      vdd => vdd,
      vss => vss
   );

not_statmachine_current_s_5_ins : inv_x2
   port map (
      i   => statmachine_current_s(5),
      nq  => not_statmachine_current_s(5),
      vdd => vdd,
      vss => vss
   );

not_statmachine_current_s_1_ins : inv_x2
   port map (
      i   => statmachine_current_s(1),
      nq  => not_statmachine_current_s(1),
      vdd => vdd,
      vss => vss
   );

not_aux14_ins : inv_x2
   port map (
      i   => aux14,
      nq  => not_aux14,
      vdd => vdd,
      vss => vss
   );

not_aux0_ins : o2_x2
   port map (
      i0  => input(2),
      i1  => not_statmachine_current_s(4),
      q   => not_aux0,
      vdd => vdd,
      vss => vss
   );

not_statmachine_current_s_4_ins : inv_x4
   port map (
      i   => statmachine_current_s(4),
      nq  => not_statmachine_current_s(4),
      vdd => vdd,
      vss => vss
   );

not_aux13_ins : inv_x2
   port map (
      i   => aux13,
      nq  => not_aux13,
      vdd => vdd,
      vss => vss
   );

not_statmachine_current_s_0_ins : inv_x2
   port map (
      i   => statmachine_current_s(0),
      nq  => not_statmachine_current_s(0),
      vdd => vdd,
      vss => vss
   );

not_aux1_ins : inv_x2
   port map (
      i   => aux1,
      nq  => not_aux1,
      vdd => vdd,
      vss => vss
   );

not_input_2_ins : inv_x2
   port map (
      i   => input(2),
      nq  => not_input(2),
      vdd => vdd,
      vss => vss
   );

not_input_1_ins : inv_x2
   port map (
      i   => input(1),
      nq  => not_input(1),
      vdd => vdd,
      vss => vss
   );

not_input_0_ins : inv_x2
   port map (
      i   => input(0),
      nq  => not_input(0),
      vdd => vdd,
      vss => vss
   );

aux16_ins : ao2o22_x2
   port map (
      i0  => not_aux13,
      i1  => not_aux1,
      i2  => not_aux14,
      i3  => aux5,
      q   => aux16,
      vdd => vdd,
      vss => vss
   );

aux14_ins : no2_x1
   port map (
      i0  => input(0),
      i1  => rst,
      nq  => aux14,
      vdd => vdd,
      vss => vss
   );

aux13_ins : no2_x1
   port map (
      i0  => rst,
      i1  => not_input(0),
      nq  => aux13,
      vdd => vdd,
      vss => vss
   );

aux5_ins : no2_x1
   port map (
      i0  => input(1),
      i1  => not_input(2),
      nq  => aux5,
      vdd => vdd,
      vss => vss
   );

aux1_ins : na2_x1
   port map (
      i0  => input(1),
      i1  => not_input(2),
      nq  => aux1,
      vdd => vdd,
      vss => vss
   );

oa22_x2_2_ins : oa22_x2
   port map (
      i0  => statmachine_current_s(0),
      i1  => not_input(2),
      i2  => input(1),
      q   => oa22_x2_2_sig,
      vdd => vdd,
      vss => vss
   );

na2_x1_ins : na2_x1
   port map (
      i0  => not_aux0,
      i1  => not_statmachine_current_s(0),
      nq  => na2_x1_sig,
      vdd => vdd,
      vss => vss
   );

a3_x2_ins : a3_x2
   port map (
      i0  => aux14,
      i1  => na2_x1_sig,
      i2  => oa22_x2_2_sig,
      q   => a3_x2_sig,
      vdd => vdd,
      vss => vss
   );

no2_x1_ins : no2_x1
   port map (
      i0  => not_aux13,
      i1  => not_aux1,
      nq  => no2_x1_sig,
      vdd => vdd,
      vss => vss
   );

oa22_x2_ins : oa22_x2
   port map (
      i0  => statmachine_current_s(0),
      i1  => no2_x1_sig,
      i2  => a3_x2_sig,
      q   => oa22_x2_sig,
      vdd => vdd,
      vss => vss
   );

statmachine_current_s_0_ins : sff1_x4
   port map (
      ck  => clk,
      i   => oa22_x2_sig,
      q   => statmachine_current_s(0),
      vdd => vdd,
      vss => vss
   );

oa22_x2_4_ins : oa22_x2
   port map (
      i0  => statmachine_current_s(1),
      i1  => not_input(2),
      i2  => input(1),
      q   => oa22_x2_4_sig,
      vdd => vdd,
      vss => vss
   );

na2_x1_2_ins : na2_x1
   port map (
      i0  => not_aux6,
      i1  => not_statmachine_current_s(1),
      nq  => na2_x1_2_sig,
      vdd => vdd,
      vss => vss
   );

a3_x2_2_ins : a3_x2
   port map (
      i0  => aux14,
      i1  => na2_x1_2_sig,
      i2  => oa22_x2_4_sig,
      q   => a3_x2_2_sig,
      vdd => vdd,
      vss => vss
   );

no2_x1_2_ins : no2_x1
   port map (
      i0  => not_aux13,
      i1  => not_aux1,
      nq  => no2_x1_2_sig,
      vdd => vdd,
      vss => vss
   );

oa22_x2_3_ins : oa22_x2
   port map (
      i0  => statmachine_current_s(1),
      i1  => no2_x1_2_sig,
      i2  => a3_x2_2_sig,
      q   => oa22_x2_3_sig,
      vdd => vdd,
      vss => vss
   );

statmachine_current_s_1_ins : sff1_x4
   port map (
      ck  => clk,
      i   => oa22_x2_3_sig,
      q   => statmachine_current_s(1),
      vdd => vdd,
      vss => vss
   );

oa22_x2_5_ins : oa22_x2
   port map (
      i0  => statmachine_current_s(2),
      i1  => not_input(2),
      i2  => input(1),
      q   => oa22_x2_5_sig,
      vdd => vdd,
      vss => vss
   );

oa22_x2_6_ins : oa22_x2
   port map (
      i0  => statmachine_current_s(6),
      i1  => not_input(2),
      i2  => statmachine_current_s(2),
      q   => oa22_x2_6_sig,
      vdd => vdd,
      vss => vss
   );

na3_x1_ins : na3_x1
   port map (
      i0  => oa22_x2_6_sig,
      i1  => aux14,
      i2  => oa22_x2_5_sig,
      nq  => na3_x1_sig,
      vdd => vdd,
      vss => vss
   );

o2_x2_ins : o2_x2
   port map (
      i0  => not_aux13,
      i1  => not_aux1,
      q   => o2_x2_sig,
      vdd => vdd,
      vss => vss
   );

a2_x2_ins : a2_x2
   port map (
      i0  => not_aux0,
      i1  => not_statmachine_current_s(2),
      q   => a2_x2_sig,
      vdd => vdd,
      vss => vss
   );

nao22_x1_ins : nao22_x1
   port map (
      i0  => a2_x2_sig,
      i1  => o2_x2_sig,
      i2  => na3_x1_sig,
      nq  => nao22_x1_sig,
      vdd => vdd,
      vss => vss
   );

statmachine_current_s_2_ins : sff1_x4
   port map (
      ck  => clk,
      i   => nao22_x1_sig,
      q   => statmachine_current_s(2),
      vdd => vdd,
      vss => vss
   );

ao22_x2_ins : ao22_x2
   port map (
      i0  => not_aux6,
      i1  => not_input(0),
      i2  => not_statmachine_current_s(3),
      q   => ao22_x2_sig,
      vdd => vdd,
      vss => vss
   );

a2_x2_2_ins : a2_x2
   port map (
      i0  => not_input(1),
      i1  => mbk_buf_statmachine_current_s(4),
      q   => a2_x2_2_sig,
      vdd => vdd,
      vss => vss
   );

no2_x1_3_ins : no2_x1
   port map (
      i0  => input(2),
      i1  => not_input(1),
      nq  => no2_x1_3_sig,
      vdd => vdd,
      vss => vss
   );

a2_x2_3_ins : a2_x2
   port map (
      i0  => no2_x1_3_sig,
      i1  => statmachine_current_s(7),
      q   => a2_x2_3_sig,
      vdd => vdd,
      vss => vss
   );

nao22_x1_2_ins : nao22_x1
   port map (
      i0  => a2_x2_3_sig,
      i1  => a2_x2_2_sig,
      i2  => not_input(0),
      nq  => nao22_x1_2_sig,
      vdd => vdd,
      vss => vss
   );

noa22_x1_ins : noa22_x1
   port map (
      i0  => nao22_x1_2_sig,
      i1  => ao22_x2_sig,
      i2  => aux16,
      nq  => noa22_x1_sig,
      vdd => vdd,
      vss => vss
   );

statmachine_current_s_3_ins : sff1_x4
   port map (
      ck  => clk,
      i   => noa22_x1_sig,
      q   => statmachine_current_s(3),
      vdd => vdd,
      vss => vss
   );

no3_x1_ins : no3_x1
   port map (
      i0  => not_aux8,
      i1  => mbk_buf_not_aux7,
      i2  => input(1),
      nq  => no3_x1_sig,
      vdd => vdd,
      vss => vss
   );

a2_x2_4_ins : a2_x2
   port map (
      i0  => input(1),
      i1  => mbk_buf_statmachine_current_s(4),
      q   => a2_x2_4_sig,
      vdd => vdd,
      vss => vss
   );

no2_x1_4_ins : no2_x1
   port map (
      i1  => not_aux7,
      i0  => not_input(1),
      nq  => no2_x1_4_sig,
      vdd => vdd,
      vss => vss
   );

inv_x2_ins : inv_x2
   port map (
      i   => not_aux6,
      nq  => inv_x2_sig,
      vdd => vdd,
      vss => vss
   );

oa2a2a23_x2_ins : oa2a2a23_x2
   port map (
      i0  => inv_x2_sig,
      i1  => not_input(1),
      i2  => no2_x1_4_sig,
      i3  => statmachine_current_s(8),
      i4  => mbk_buf_statmachine_current_s(4),
      i5  => input(2),
      q   => oa2a2a23_x2_sig,
      vdd => vdd,
      vss => vss
   );

oa2ao222_x2_ins : oa2ao222_x2
   port map (
      i0  => oa2a2a23_x2_sig,
      i1  => aux14,
      i2  => a2_x2_4_sig,
      i3  => no3_x1_sig,
      i4  => aux13,
      q   => oa2ao222_x2_sig,
      vdd => vdd,
      vss => vss
   );

statmachine_current_s_4_ins : sff1_x4
   port map (
      ck  => clk,
      i   => oa2ao222_x2_sig,
      q   => statmachine_current_s(4),
      vdd => vdd,
      vss => vss
   );

no4_x1_ins : no4_x1
   port map (
      i0  => not_aux9,
      i1  => not_aux1,
      i2  => not_aux8,
      i3  => not_aux14,
      nq  => no4_x1_sig,
      vdd => vdd,
      vss => vss
   );

no3_x1_2_ins : no3_x1
   port map (
      i0  => not_aux9,
      i1  => not_aux10,
      i2  => input(1),
      nq  => no3_x1_2_sig,
      vdd => vdd,
      vss => vss
   );

oa22_x2_8_ins : oa22_x2
   port map (
      i0  => statmachine_current_s(5),
      i1  => input(1),
      i2  => no3_x1_2_sig,
      q   => oa22_x2_8_sig,
      vdd => vdd,
      vss => vss
   );

oa22_x2_7_ins : oa22_x2
   port map (
      i0  => oa22_x2_8_sig,
      i1  => aux13,
      i2  => no4_x1_sig,
      q   => oa22_x2_7_sig,
      vdd => vdd,
      vss => vss
   );

statmachine_current_s_5_ins : sff1_x4
   port map (
      ck  => clk,
      i   => oa22_x2_7_sig,
      q   => statmachine_current_s(5),
      vdd => vdd,
      vss => vss
   );

no4_x1_2_ins : no4_x1
   port map (
      i0  => not_aux10,
      i1  => not_aux1,
      i2  => not_aux11,
      i3  => not_aux14,
      nq  => no4_x1_2_sig,
      vdd => vdd,
      vss => vss
   );

no3_x1_3_ins : no3_x1
   port map (
      i0  => not_aux12,
      i1  => not_aux11,
      i2  => input(1),
      nq  => no3_x1_3_sig,
      vdd => vdd,
      vss => vss
   );

oa22_x2_10_ins : oa22_x2
   port map (
      i0  => statmachine_current_s(6),
      i1  => input(1),
      i2  => no3_x1_3_sig,
      q   => oa22_x2_10_sig,
      vdd => vdd,
      vss => vss
   );

oa22_x2_9_ins : oa22_x2
   port map (
      i0  => oa22_x2_10_sig,
      i1  => aux13,
      i2  => no4_x1_2_sig,
      q   => oa22_x2_9_sig,
      vdd => vdd,
      vss => vss
   );

statmachine_current_s_6_ins : sff1_x4
   port map (
      ck  => clk,
      i   => oa22_x2_9_sig,
      q   => statmachine_current_s(6),
      vdd => vdd,
      vss => vss
   );

no3_x1_4_ins : no3_x1
   port map (
      i0  => not_aux1,
      i1  => not_aux12,
      i2  => not_aux14,
      nq  => no3_x1_4_sig,
      vdd => vdd,
      vss => vss
   );

na2_x1_3_ins : na2_x1
   port map (
      i0  => input(2),
      i1  => not_statmachine_current_s(7),
      nq  => na2_x1_3_sig,
      vdd => vdd,
      vss => vss
   );

ao22_x2_2_ins : ao22_x2
   port map (
      i0  => input(2),
      i1  => input(1),
      i2  => aux13,
      q   => ao22_x2_2_sig,
      vdd => vdd,
      vss => vss
   );

oa2a22_x2_ins : oa2a22_x2
   port map (
      i0  => ao22_x2_2_sig,
      i1  => statmachine_current_s(7),
      i2  => na2_x1_3_sig,
      i3  => no3_x1_4_sig,
      q   => oa2a22_x2_sig,
      vdd => vdd,
      vss => vss
   );

statmachine_current_s_7_ins : sff1_x4
   port map (
      ck  => clk,
      i   => oa2a22_x2_sig,
      q   => statmachine_current_s(7),
      vdd => vdd,
      vss => vss
   );

inv_x2_2_ins : inv_x2
   port map (
      i   => rst,
      nq  => inv_x2_2_sig,
      vdd => vdd,
      vss => vss
   );

ao22_x2_4_ins : ao22_x2
   port map (
      i0  => not_input(1),
      i1  => input(0),
      i2  => inv_x2_2_sig,
      q   => ao22_x2_4_sig,
      vdd => vdd,
      vss => vss
   );

na2_x1_4_ins : na2_x1
   port map (
      i0  => input(0),
      i1  => not_input(1),
      nq  => na2_x1_4_sig,
      vdd => vdd,
      vss => vss
   );

a3_x2_3_ins : a3_x2
   port map (
      i0  => na2_x1_4_sig,
      i1  => not_statmachine_current_s(3),
      i2  => ao22_x2_4_sig,
      q   => a3_x2_3_sig,
      vdd => vdd,
      vss => vss
   );

a2_x2_5_ins : a2_x2
   port map (
      i0  => not_statmachine_current_s(1),
      i1  => not_statmachine_current_s(0),
      q   => a2_x2_5_sig,
      vdd => vdd,
      vss => vss
   );

a2_x2_6_ins : a2_x2
   port map (
      i0  => not_statmachine_current_s(8),
      i1  => not_statmachine_current_s(2),
      q   => a2_x2_6_sig,
      vdd => vdd,
      vss => vss
   );

na3_x1_2_ins : na3_x1
   port map (
      i0  => a2_x2_6_sig,
      i1  => a2_x2_5_sig,
      i2  => a3_x2_3_sig,
      nq  => na3_x1_2_sig,
      vdd => vdd,
      vss => vss
   );

a2_x2_7_ins : a2_x2
   port map (
      i0  => input(2),
      i1  => statmachine_current_s(8),
      q   => a2_x2_7_sig,
      vdd => vdd,
      vss => vss
   );

ao22_x2_3_ins : ao22_x2
   port map (
      i0  => a2_x2_7_sig,
      i1  => aux16,
      i2  => na3_x1_2_sig,
      q   => ao22_x2_3_sig,
      vdd => vdd,
      vss => vss
   );

statmachine_current_s_8_ins : sff1_x4
   port map (
      ck  => clk,
      i   => ao22_x2_3_sig,
      q   => statmachine_current_s(8),
      vdd => vdd,
      vss => vss
   );

o3_x2_ins : o3_x2
   port map (
      i0  => not_aux13,
      i1  => input(1),
      i2  => not_aux0,
      q   => o3_x2_sig,
      vdd => vdd,
      vss => vss
   );

o2_x2_2_ins : o2_x2
   port map (
      i0  => input(2),
      i1  => not_aux15,
      q   => o2_x2_2_sig,
      vdd => vdd,
      vss => vss
   );

a2_x2_8_ins : a2_x2
   port map (
      i0  => not_statmachine_current_s(6),
      i1  => not_statmachine_current_s(4),
      q   => a2_x2_8_sig,
      vdd => vdd,
      vss => vss
   );

change_0_ins : nao22_x1
   port map (
      i0  => a2_x2_8_sig,
      i1  => o2_x2_2_sig,
      i2  => o3_x2_sig,
      nq  => change(0),
      vdd => vdd,
      vss => vss
   );

no2_x1_5_ins : no2_x1
   port map (
      i0  => input(2),
      i1  => not_aux15,
      nq  => no2_x1_5_sig,
      vdd => vdd,
      vss => vss
   );

change_1_ins : ao22_x2
   port map (
      i0  => mbk_buf_statmachine_current_s(4),
      i1  => statmachine_current_s(5),
      i2  => no2_x1_5_sig,
      q   => change(1),
      vdd => vdd,
      vss => vss
   );

output_0_ins : no3_x1
   port map (
      i0  => aux1,
      i1  => not_aux4,
      i2  => not_aux13,
      nq  => output(0),
      vdd => vdd,
      vss => vss
   );

inv_x2_3_ins : inv_x2
   port map (
      i   => aux5,
      nq  => inv_x2_3_sig,
      vdd => vdd,
      vss => vss
   );

output_1_ins : no3_x1
   port map (
      i0  => inv_x2_3_sig,
      i1  => not_aux14,
      i2  => not_aux4,
      nq  => output(1),
      vdd => vdd,
      vss => vss
   );

mbk_buf_statmachine_current_s_4 : buf_x2
   port map (
      i   => statmachine_current_s(4),
      q   => mbk_buf_statmachine_current_s(4),
      vdd => vdd,
      vss => vss
   );

mbk_buf_not_auxx7 : buf_x2
   port map (
      i   => not_aux7,
      q   => mbk_buf_not_aux7,
      vdd => vdd,
      vss => vss
   );


end structural;
