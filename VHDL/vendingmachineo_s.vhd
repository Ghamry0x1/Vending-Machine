LIBRARY sxlib_ModelSim;
entity vendingmachineo_s is
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
end vendingmachineo_s;

architecture structural of vendingmachineo_s is
Component a2_x2
   port (
      i0  : in      bit;
      i1  : in      bit;
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

Component noa2ao222_x1
   port (
      i0  : in      bit;
      i1  : in      bit;
      i2  : in      bit;
      i3  : in      bit;
      i4  : in      bit;
      nq  : out     bit;
      vdd : in      bit;
      vss : in      bit
 );
end component;

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

Component noa2a22_x1
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

Component nao2o22_x1
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

Component xr2_x1
   port (
      i0  : in      bit;
      i1  : in      bit;
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

Component o2_x2
   port (
      i0  : in      bit;
      i1  : in      bit;
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

Component na2_x1
   port (
      i0  : in      bit;
      i1  : in      bit;
      nq  : out     bit;
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

Component no4_x4
   port (
      i1  : in      bit;
      i0  : in      bit;
      i2  : in      bit;
      i3  : in      bit;
      nq  : out     bit;
      vdd : in      bit;
      vss : in      bit
 );
end component;

Component buf_x4
   port (
      i   : in      bit;
      q   : out     bit;
      vdd : in      bit;
      vss : in      bit
 );
end component;

Component sff2_x4
   port (
      ck  : in      bit;
      cmd : in      bit;
      i0  : in      bit;
      i1  : in      bit;
      q   : out     bit;
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

signal mbk_buf_not_statmachine_current_s : bit_vector( 2 downto 0);
signal not_input                         : bit_vector( 2 downto 0);
signal not_statmachine_current_s         : bit_vector( 8 downto 0);
signal statmachine_current_s             : bit_vector( 8 downto 0);
signal xr2_x1_sig                        : bit;
signal oa2a22_x2_sig                     : bit;
signal oa2a22_x2_2_sig                   : bit;
signal oa22_x2_sig                       : bit;
signal oa22_x2_8_sig                     : bit;
signal oa22_x2_7_sig                     : bit;
signal oa22_x2_6_sig                     : bit;
signal oa22_x2_5_sig                     : bit;
signal oa22_x2_4_sig                     : bit;
signal oa22_x2_3_sig                     : bit;
signal oa22_x2_2_sig                     : bit;
signal o2_x2_sig                         : bit;
signal o2_x2_7_sig                       : bit;
signal o2_x2_6_sig                       : bit;
signal o2_x2_5_sig                       : bit;
signal o2_x2_4_sig                       : bit;
signal o2_x2_3_sig                       : bit;
signal o2_x2_2_sig                       : bit;
signal not_rst                           : bit;
signal not_aux9                          : bit;
signal not_aux8                          : bit;
signal not_aux7                          : bit;
signal not_aux6                          : bit;
signal not_aux5                          : bit;
signal not_aux4                          : bit;
signal not_aux2                          : bit;
signal not_aux10                         : bit;
signal not_aux1                          : bit;
signal not_aux0                          : bit;
signal noa2ao222_x1_sig                  : bit;
signal noa2a22_x1_sig                    : bit;
signal noa22_x1_sig                      : bit;
signal no4_x1_sig                        : bit;
signal no3_x1_sig                        : bit;
signal no2_x1_sig                        : bit;
signal no2_x1_9_sig                      : bit;
signal no2_x1_8_sig                      : bit;
signal no2_x1_7_sig                      : bit;
signal no2_x1_6_sig                      : bit;
signal no2_x1_5_sig                      : bit;
signal no2_x1_4_sig                      : bit;
signal no2_x1_3_sig                      : bit;
signal no2_x1_2_sig                      : bit;
signal no2_x1_13_sig                     : bit;
signal no2_x1_12_sig                     : bit;
signal no2_x1_11_sig                     : bit;
signal no2_x1_10_sig                     : bit;
signal nao2o22_x1_sig                    : bit;
signal na3_x1_sig                        : bit;
signal na3_x1_7_sig                      : bit;
signal na3_x1_6_sig                      : bit;
signal na3_x1_5_sig                      : bit;
signal na3_x1_4_sig                      : bit;
signal na3_x1_3_sig                      : bit;
signal na3_x1_2_sig                      : bit;
signal na2_x1_sig                        : bit;
signal na2_x1_9_sig                      : bit;
signal na2_x1_8_sig                      : bit;
signal na2_x1_7_sig                      : bit;
signal na2_x1_6_sig                      : bit;
signal na2_x1_5_sig                      : bit;
signal na2_x1_4_sig                      : bit;
signal na2_x1_3_sig                      : bit;
signal na2_x1_2_sig                      : bit;
signal na2_x1_21_sig                     : bit;
signal na2_x1_20_sig                     : bit;
signal na2_x1_19_sig                     : bit;
signal na2_x1_18_sig                     : bit;
signal na2_x1_17_sig                     : bit;
signal na2_x1_16_sig                     : bit;
signal na2_x1_15_sig                     : bit;
signal na2_x1_14_sig                     : bit;
signal na2_x1_13_sig                     : bit;
signal na2_x1_12_sig                     : bit;
signal na2_x1_11_sig                     : bit;
signal na2_x1_10_sig                     : bit;
signal inv_x2_sig                        : bit;
signal inv_x2_2_sig                      : bit;
signal aux12                             : bit;
signal aux11                             : bit;
signal ao2o22_x2_sig                     : bit;
signal a4_x2_sig                         : bit;
signal a4_x2_3_sig                       : bit;
signal a4_x2_2_sig                       : bit;
signal a3_x2_sig                         : bit;

begin

inv_x2_ins : inv_x2
   port map (
      i   => statmachine_current_s(1),
      nq  => inv_x2_sig,
      vdd => vdd,
      vss => vss
   );

not_aux4_ins : a3_x2
   port map (
      i0  => inv_x2_sig,
      i1  => not_statmachine_current_s(3),
      i2  => not_aux2,
      q   => not_aux4,
      vdd => vdd,
      vss => vss
   );

not_aux2_ins : a2_x2
   port map (
      i0  => not_statmachine_current_s(0),
      i1  => not_statmachine_current_s(2),
      q   => not_aux2,
      vdd => vdd,
      vss => vss
   );

not_aux7_ins : o2_x2
   port map (
      i0  => rst,
      i1  => not_statmachine_current_s(7),
      q   => not_aux7,
      vdd => vdd,
      vss => vss
   );

not_aux9_ins : o2_x2
   port map (
      i0  => input(0),
      i1  => input(2),
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

not_aux8_ins : o2_x2
   port map (
      i0  => input(2),
      i1  => not_input(0),
      q   => not_aux8,
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

not_statmachine_current_s_3_ins : inv_x2
   port map (
      i   => statmachine_current_s(3),
      nq  => not_statmachine_current_s(3),
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

not_aux1_ins : o2_x2
   port map (
      i0  => input(1),
      i1  => rst,
      q   => not_aux1,
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
      i0  => input(1),
      i1  => not_input(2),
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

not_aux0_ins : o2_x2
   port map (
      i0  => rst,
      i1  => not_input(1),
      q   => not_aux0,
      vdd => vdd,
      vss => vss
   );

not_statmachine_current_s_4_ins : inv_x2
   port map (
      i   => statmachine_current_s(4),
      nq  => not_statmachine_current_s(4),
      vdd => vdd,
      vss => vss
   );

not_aux10_ins : o2_x2
   port map (
      i0  => rst,
      i1  => not_input(0),
      q   => not_aux10,
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

not_aux5_ins : a2_x2
   port map (
      i0  => input(1),
      i1  => not_input(2),
      q   => not_aux5,
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

not_rst_ins : inv_x2
   port map (
      i   => rst,
      nq  => not_rst,
      vdd => vdd,
      vss => vss
   );

aux12_ins : no2_x1
   port map (
      i0  => rst,
      i1  => not_aux8,
      nq  => aux12,
      vdd => vdd,
      vss => vss
   );

aux11_ins : no2_x1
   port map (
      i0  => input(0),
      i1  => rst,
      nq  => aux11,
      vdd => vdd,
      vss => vss
   );

na2_x1_ins : na2_x1
   port map (
      i0  => mbk_buf_not_statmachine_current_s(0),
      i1  => not_statmachine_current_s(4),
      nq  => na2_x1_sig,
      vdd => vdd,
      vss => vss
   );

na2_x1_2_ins : na2_x1
   port map (
      i0  => not_input(1),
      i1  => mbk_buf_not_statmachine_current_s(0),
      nq  => na2_x1_2_sig,
      vdd => vdd,
      vss => vss
   );

oa22_x2_2_ins : oa22_x2
   port map (
      i0  => statmachine_current_s(0),
      i1  => input(1),
      i2  => not_input(2),
      q   => oa22_x2_2_sig,
      vdd => vdd,
      vss => vss
   );

a4_x2_ins : a4_x2
   port map (
      i0  => oa22_x2_2_sig,
      i1  => aux11,
      i2  => na2_x1_2_sig,
      i3  => na2_x1_sig,
      q   => a4_x2_sig,
      vdd => vdd,
      vss => vss
   );

no2_x1_ins : no2_x1
   port map (
      i0  => not_aux10,
      i1  => not_aux5,
      nq  => no2_x1_sig,
      vdd => vdd,
      vss => vss
   );

oa22_x2_ins : oa22_x2
   port map (
      i0  => statmachine_current_s(0),
      i1  => no2_x1_sig,
      i2  => a4_x2_sig,
      q   => oa22_x2_sig,
      vdd => vdd,
      vss => vss
   );

inv_x2_2_ins : inv_x2
   port map (
      i   => statmachine_current_s(1),
      nq  => inv_x2_2_sig,
      vdd => vdd,
      vss => vss
   );

o2_x2_ins : o2_x2
   port map (
      i0  => input(2),
      i1  => not_aux0,
      q   => o2_x2_sig,
      vdd => vdd,
      vss => vss
   );

o2_x2_2_ins : o2_x2
   port map (
      i0  => not_aux10,
      i1  => not_aux5,
      q   => o2_x2_2_sig,
      vdd => vdd,
      vss => vss
   );

na2_x1_3_ins : na2_x1
   port map (
      i0  => not_aux6,
      i1  => aux11,
      nq  => na2_x1_3_sig,
      vdd => vdd,
      vss => vss
   );

noa2ao222_x1_ins : noa2ao222_x1
   port map (
      i0  => na2_x1_3_sig,
      i1  => o2_x2_2_sig,
      i2  => not_statmachine_current_s(5),
      i3  => o2_x2_sig,
      i4  => inv_x2_2_sig,
      nq  => noa2ao222_x1_sig,
      vdd => vdd,
      vss => vss
   );

na2_x1_4_ins : na2_x1
   port map (
      i0  => mbk_buf_not_statmachine_current_s(2),
      i1  => not_statmachine_current_s(6),
      nq  => na2_x1_4_sig,
      vdd => vdd,
      vss => vss
   );

na2_x1_5_ins : na2_x1
   port map (
      i0  => not_input(1),
      i1  => mbk_buf_not_statmachine_current_s(2),
      nq  => na2_x1_5_sig,
      vdd => vdd,
      vss => vss
   );

oa22_x2_4_ins : oa22_x2
   port map (
      i0  => statmachine_current_s(2),
      i1  => input(1),
      i2  => not_input(2),
      q   => oa22_x2_4_sig,
      vdd => vdd,
      vss => vss
   );

a4_x2_2_ins : a4_x2
   port map (
      i0  => oa22_x2_4_sig,
      i1  => aux11,
      i2  => na2_x1_5_sig,
      i3  => na2_x1_4_sig,
      q   => a4_x2_2_sig,
      vdd => vdd,
      vss => vss
   );

no2_x1_2_ins : no2_x1
   port map (
      i0  => rst,
      i1  => not_input(2),
      nq  => no2_x1_2_sig,
      vdd => vdd,
      vss => vss
   );

na2_x1_6_ins : na2_x1
   port map (
      i0  => mbk_buf_not_statmachine_current_s(2),
      i1  => not_statmachine_current_s(4),
      nq  => na2_x1_6_sig,
      vdd => vdd,
      vss => vss
   );

no2_x1_3_ins : no2_x1
   port map (
      i0  => input(2),
      i1  => not_aux1,
      nq  => no2_x1_3_sig,
      vdd => vdd,
      vss => vss
   );

oa2a22_x2_ins : oa2a22_x2
   port map (
      i0  => no2_x1_3_sig,
      i1  => na2_x1_6_sig,
      i2  => statmachine_current_s(2),
      i3  => no2_x1_2_sig,
      q   => oa2a22_x2_sig,
      vdd => vdd,
      vss => vss
   );

oa22_x2_3_ins : oa22_x2
   port map (
      i0  => oa2a22_x2_sig,
      i1  => input(0),
      i2  => a4_x2_2_sig,
      q   => oa22_x2_3_sig,
      vdd => vdd,
      vss => vss
   );

oa22_x2_6_ins : oa22_x2
   port map (
      i0  => statmachine_current_s(3),
      i1  => input(1),
      i2  => not_input(2),
      q   => oa22_x2_6_sig,
      vdd => vdd,
      vss => vss
   );

na3_x1_ins : na3_x1
   port map (
      i0  => not_input(1),
      i1  => not_statmachine_current_s(3),
      i2  => not_statmachine_current_s(4),
      nq  => na3_x1_sig,
      vdd => vdd,
      vss => vss
   );

o2_x2_3_ins : o2_x2
   port map (
      i0  => statmachine_current_s(7),
      i1  => statmachine_current_s(3),
      q   => o2_x2_3_sig,
      vdd => vdd,
      vss => vss
   );

oa22_x2_7_ins : oa22_x2
   port map (
      i0  => statmachine_current_s(4),
      i1  => not_input(1),
      i2  => o2_x2_3_sig,
      q   => oa22_x2_7_sig,
      vdd => vdd,
      vss => vss
   );

a4_x2_3_ins : a4_x2
   port map (
      i0  => oa22_x2_7_sig,
      i1  => aux11,
      i2  => na3_x1_sig,
      i3  => oa22_x2_6_sig,
      q   => a4_x2_3_sig,
      vdd => vdd,
      vss => vss
   );

no2_x1_4_ins : no2_x1
   port map (
      i0  => rst,
      i1  => not_input(2),
      nq  => no2_x1_4_sig,
      vdd => vdd,
      vss => vss
   );

na2_x1_7_ins : na2_x1
   port map (
      i0  => not_statmachine_current_s(5),
      i1  => not_statmachine_current_s(3),
      nq  => na2_x1_7_sig,
      vdd => vdd,
      vss => vss
   );

no2_x1_5_ins : no2_x1
   port map (
      i0  => input(2),
      i1  => not_aux1,
      nq  => no2_x1_5_sig,
      vdd => vdd,
      vss => vss
   );

oa2a22_x2_2_ins : oa2a22_x2
   port map (
      i0  => no2_x1_5_sig,
      i1  => na2_x1_7_sig,
      i2  => statmachine_current_s(3),
      i3  => no2_x1_4_sig,
      q   => oa2a22_x2_2_sig,
      vdd => vdd,
      vss => vss
   );

oa22_x2_5_ins : oa22_x2
   port map (
      i0  => oa2a22_x2_2_sig,
      i1  => input(0),
      i2  => a4_x2_3_sig,
      q   => oa22_x2_5_sig,
      vdd => vdd,
      vss => vss
   );

na2_x1_8_ins : na2_x1
   port map (
      i0  => input(1),
      i1  => not_statmachine_current_s(4),
      nq  => na2_x1_8_sig,
      vdd => vdd,
      vss => vss
   );

na2_x1_9_ins : na2_x1
   port map (
      i0  => not_aux0,
      i1  => not_statmachine_current_s(6),
      nq  => na2_x1_9_sig,
      vdd => vdd,
      vss => vss
   );

na3_x1_3_ins : na3_x1
   port map (
      i0  => aux12,
      i1  => na2_x1_9_sig,
      i2  => na2_x1_8_sig,
      nq  => na3_x1_3_sig,
      vdd => vdd,
      vss => vss
   );

na2_x1_10_ins : na2_x1
   port map (
      i0  => not_input(1),
      i1  => not_statmachine_current_s(5),
      nq  => na2_x1_10_sig,
      vdd => vdd,
      vss => vss
   );

na2_x1_11_ins : na2_x1
   port map (
      i0  => not_aux1,
      i1  => not_statmachine_current_s(8),
      nq  => na2_x1_11_sig,
      vdd => vdd,
      vss => vss
   );

no2_x1_6_ins : no2_x1
   port map (
      i0  => rst,
      i1  => not_aux9,
      nq  => no2_x1_6_sig,
      vdd => vdd,
      vss => vss
   );

na3_x1_4_ins : na3_x1
   port map (
      i0  => no2_x1_6_sig,
      i1  => na2_x1_11_sig,
      i2  => na2_x1_10_sig,
      nq  => na3_x1_4_sig,
      vdd => vdd,
      vss => vss
   );

no2_x1_7_ins : no2_x1
   port map (
      i0  => rst,
      i1  => not_input(2),
      nq  => no2_x1_7_sig,
      vdd => vdd,
      vss => vss
   );

na2_x1_12_ins : na2_x1
   port map (
      i0  => no2_x1_7_sig,
      i1  => statmachine_current_s(4),
      nq  => na2_x1_12_sig,
      vdd => vdd,
      vss => vss
   );

na3_x1_2_ins : na3_x1
   port map (
      i0  => na2_x1_12_sig,
      i1  => na3_x1_4_sig,
      i2  => na3_x1_3_sig,
      nq  => na3_x1_2_sig,
      vdd => vdd,
      vss => vss
   );

na2_x1_14_ins : na2_x1
   port map (
      i0  => input(1),
      i1  => not_statmachine_current_s(5),
      nq  => na2_x1_14_sig,
      vdd => vdd,
      vss => vss
   );

na2_x1_15_ins : na2_x1
   port map (
      i0  => not_aux0,
      i1  => not_statmachine_current_s(7),
      nq  => na2_x1_15_sig,
      vdd => vdd,
      vss => vss
   );

na3_x1_5_ins : na3_x1
   port map (
      i0  => aux12,
      i1  => na2_x1_15_sig,
      i2  => na2_x1_14_sig,
      nq  => na3_x1_5_sig,
      vdd => vdd,
      vss => vss
   );

no2_x1_8_ins : no2_x1
   port map (
      i0  => rst,
      i1  => not_input(2),
      nq  => no2_x1_8_sig,
      vdd => vdd,
      vss => vss
   );

no2_x1_9_ins : no2_x1
   port map (
      i0  => not_aux9,
      i1  => not_aux1,
      nq  => no2_x1_9_sig,
      vdd => vdd,
      vss => vss
   );

noa2a22_x1_ins : noa2a22_x1
   port map (
      i0  => statmachine_current_s(6),
      i1  => no2_x1_9_sig,
      i2  => statmachine_current_s(5),
      i3  => no2_x1_8_sig,
      nq  => noa2a22_x1_sig,
      vdd => vdd,
      vss => vss
   );

na2_x1_13_ins : na2_x1
   port map (
      i0  => noa2a22_x1_sig,
      i1  => na3_x1_5_sig,
      nq  => na2_x1_13_sig,
      vdd => vdd,
      vss => vss
   );

na2_x1_17_ins : na2_x1
   port map (
      i0  => input(1),
      i1  => not_statmachine_current_s(6),
      nq  => na2_x1_17_sig,
      vdd => vdd,
      vss => vss
   );

na2_x1_18_ins : na2_x1
   port map (
      i0  => not_aux0,
      i1  => not_statmachine_current_s(8),
      nq  => na2_x1_18_sig,
      vdd => vdd,
      vss => vss
   );

na3_x1_6_ins : na3_x1
   port map (
      i0  => aux12,
      i1  => na2_x1_18_sig,
      i2  => na2_x1_17_sig,
      nq  => na3_x1_6_sig,
      vdd => vdd,
      vss => vss
   );

o2_x2_4_ins : o2_x2
   port map (
      i0  => not_aux9,
      i1  => not_aux1,
      q   => o2_x2_4_sig,
      vdd => vdd,
      vss => vss
   );

na2_x1_19_ins : na2_x1
   port map (
      i0  => input(2),
      i1  => not_rst,
      nq  => na2_x1_19_sig,
      vdd => vdd,
      vss => vss
   );

ao2o22_x2_ins : ao2o22_x2
   port map (
      i0  => na2_x1_19_sig,
      i1  => not_statmachine_current_s(6),
      i2  => not_statmachine_current_s(7),
      i3  => o2_x2_4_sig,
      q   => ao2o22_x2_sig,
      vdd => vdd,
      vss => vss
   );

na2_x1_16_ins : na2_x1
   port map (
      i0  => ao2o22_x2_sig,
      i1  => na3_x1_6_sig,
      nq  => na2_x1_16_sig,
      vdd => vdd,
      vss => vss
   );

no2_x1_10_ins : no2_x1
   port map (
      i0  => input(1),
      i1  => input(2),
      nq  => no2_x1_10_sig,
      vdd => vdd,
      vss => vss
   );

no3_x1_ins : no3_x1
   port map (
      i0  => no2_x1_10_sig,
      i1  => not_aux7,
      i2  => not_input(0),
      nq  => no3_x1_sig,
      vdd => vdd,
      vss => vss
   );

o2_x2_5_ins : o2_x2
   port map (
      i0  => input(2),
      i1  => not_aux1,
      q   => o2_x2_5_sig,
      vdd => vdd,
      vss => vss
   );

nao2o22_x1_ins : nao2o22_x1
   port map (
      i0  => o2_x2_5_sig,
      i1  => not_statmachine_current_s(8),
      i2  => not_aux7,
      i3  => not_input(2),
      nq  => nao2o22_x1_sig,
      vdd => vdd,
      vss => vss
   );

oa22_x2_8_ins : oa22_x2
   port map (
      i0  => nao2o22_x1_sig,
      i1  => not_input(0),
      i2  => no3_x1_sig,
      q   => oa22_x2_8_sig,
      vdd => vdd,
      vss => vss
   );

xr2_x1_ins : xr2_x1
   port map (
      i0  => input(0),
      i1  => input(2),
      q   => xr2_x1_sig,
      vdd => vdd,
      vss => vss
   );

na3_x1_7_ins : na3_x1
   port map (
      i0  => not_rst,
      i1  => not_aux2,
      i2  => xr2_x1_sig,
      nq  => na3_x1_7_sig,
      vdd => vdd,
      vss => vss
   );

no4_x1_ins : no4_x1
   port map (
      i0  => statmachine_current_s(8),
      i1  => statmachine_current_s(1),
      i2  => na3_x1_7_sig,
      i3  => statmachine_current_s(3),
      nq  => no4_x1_sig,
      vdd => vdd,
      vss => vss
   );

o2_x2_6_ins : o2_x2
   port map (
      i0  => input(0),
      i1  => not_aux6,
      q   => o2_x2_6_sig,
      vdd => vdd,
      vss => vss
   );

na2_x1_20_ins : na2_x1
   port map (
      i0  => input(0),
      i1  => not_aux5,
      nq  => na2_x1_20_sig,
      vdd => vdd,
      vss => vss
   );

a3_x2_ins : a3_x2
   port map (
      i0  => not_rst,
      i1  => na2_x1_20_sig,
      i2  => o2_x2_6_sig,
      q   => a3_x2_sig,
      vdd => vdd,
      vss => vss
   );

o2_x2_7_ins : o2_x2
   port map (
      i0  => not_input(2),
      i1  => not_statmachine_current_s(8),
      q   => o2_x2_7_sig,
      vdd => vdd,
      vss => vss
   );

noa22_x1_ins : noa22_x1
   port map (
      i0  => o2_x2_7_sig,
      i1  => a3_x2_sig,
      i2  => no4_x1_sig,
      nq  => noa22_x1_sig,
      vdd => vdd,
      vss => vss
   );

no2_x1_11_ins : no2_x1
   port map (
      i0  => not_aux8,
      i1  => not_aux1,
      nq  => no2_x1_11_sig,
      vdd => vdd,
      vss => vss
   );

na2_x1_21_ins : na2_x1
   port map (
      i0  => not_statmachine_current_s(6),
      i1  => not_statmachine_current_s(4),
      nq  => na2_x1_21_sig,
      vdd => vdd,
      vss => vss
   );

no2_x1_12_ins : no2_x1
   port map (
      i0  => not_aux9,
      i1  => not_aux0,
      nq  => no2_x1_12_sig,
      vdd => vdd,
      vss => vss
   );

change_0_ins : oa2a22_x2
   port map (
      i0  => no2_x1_12_sig,
      i1  => na2_x1_21_sig,
      i2  => statmachine_current_s(4),
      i3  => no2_x1_11_sig,
      q   => change(0),
      vdd => vdd,
      vss => vss
   );

no2_x1_13_ins : no2_x1
   port map (
      i0  => not_aux9,
      i1  => not_aux0,
      nq  => no2_x1_13_sig,
      vdd => vdd,
      vss => vss
   );

change_1_ins : ao22_x2
   port map (
      i0  => statmachine_current_s(4),
      i1  => statmachine_current_s(5),
      i2  => no2_x1_13_sig,
      q   => change(1),
      vdd => vdd,
      vss => vss
   );

output_0_ins : no3_x1
   port map (
      i0  => not_aux0,
      i1  => not_aux8,
      i2  => not_aux4,
      nq  => output(0),
      vdd => vdd,
      vss => vss
   );

output_1_ins : no4_x4
   port map (
      i1  => not_aux1,
      i0  => not_input(2),
      i2  => not_aux4,
      i3  => input(0),
      nq  => output(1),
      vdd => vdd,
      vss => vss
   );

dmbk_buf_not_statmachine_current_s_2 : buf_x4
   port map (
      i   => not_statmachine_current_s(2),
      q   => mbk_buf_not_statmachine_current_s(2),
      vdd => vdd,
      vss => vss
   );

mbk_buf_not_statmachine_current_s_0 : buf_x2
   port map (
      i   => not_statmachine_current_s(0),
      q   => mbk_buf_not_statmachine_current_s(0),
      vdd => vdd,
      vss => vss
   );

statmachine_current_s_0_ins_scan_0 : sff2_x4
   port map (
      ck  => clk,
      cmd => test,
      i0  => oa22_x2_sig,
      i1  => scanin,
      q   => statmachine_current_s(0),
      vdd => vdd,
      vss => vss
   );

statmachine_current_s_1_ins_scan_1 : sff2_x4
   port map (
      ck  => clk,
      cmd => test,
      i0  => noa2ao222_x1_sig,
      i1  => statmachine_current_s(0),
      q   => statmachine_current_s(1),
      vdd => vdd,
      vss => vss
   );

statmachine_current_s_2_ins_scan_2 : sff2_x4
   port map (
      ck  => clk,
      cmd => test,
      i0  => oa22_x2_3_sig,
      i1  => statmachine_current_s(1),
      q   => statmachine_current_s(2),
      vdd => vdd,
      vss => vss
   );

statmachine_current_s_3_ins_scan_3 : sff2_x4
   port map (
      ck  => clk,
      cmd => test,
      i0  => oa22_x2_5_sig,
      i1  => statmachine_current_s(2),
      q   => statmachine_current_s(3),
      vdd => vdd,
      vss => vss
   );

statmachine_current_s_4_ins_scan_4 : sff2_x4
   port map (
      ck  => clk,
      cmd => test,
      i0  => na3_x1_2_sig,
      i1  => statmachine_current_s(3),
      q   => statmachine_current_s(4),
      vdd => vdd,
      vss => vss
   );

statmachine_current_s_5_ins_scan_5 : sff2_x4
   port map (
      ck  => clk,
      cmd => test,
      i0  => na2_x1_13_sig,
      i1  => statmachine_current_s(4),
      q   => statmachine_current_s(5),
      vdd => vdd,
      vss => vss
   );

statmachine_current_s_6_ins_scan_6 : sff2_x4
   port map (
      ck  => clk,
      cmd => test,
      i0  => na2_x1_16_sig,
      i1  => statmachine_current_s(5),
      q   => statmachine_current_s(6),
      vdd => vdd,
      vss => vss
   );

statmachine_current_s_7_ins_scan_7 : sff2_x4
   port map (
      ck  => clk,
      cmd => test,
      i0  => oa22_x2_8_sig,
      i1  => statmachine_current_s(6),
      q   => statmachine_current_s(7),
      vdd => vdd,
      vss => vss
   );

statmachine_current_s_8_ins_scan_8 : sff2_x4
   port map (
      ck  => clk,
      cmd => test,
      i0  => noa22_x1_sig,
      i1  => statmachine_current_s(7),
      q   => statmachine_current_s(8),
      vdd => vdd,
      vss => vss
   );

buf_scan_9 : buf_x2
   port map (
      i   => statmachine_current_s(8),
      q   => scanout,
      vdd => vdd,
      vss => vss
   );


end structural;
