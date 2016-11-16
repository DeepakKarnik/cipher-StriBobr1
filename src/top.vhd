----------------------------------------------------------------------------------
-- Create Date:    	23:22:23 11/12/2014 
-- Module Name:    	top_1 - Behavioral 
-- Project Name:	Design & Evaluation of a cryptographic cipher 
-- Language:		VHDL
-- Target Devices: 	Xilinx Virtex 6
-- Tool versions: 	Xilinx ISE 
-- Description: 	Top-level datapath module for key generator of StriBob.
-- Comments:		Stribob is an algorithm for Authenticated Encryption with Associated Data (AEAD).
--			StriBob is created by Markku-Juhani O. Saarinen as a first round entry
--			in the CAESAR contest by NIST.
--			It uses a 512x512 bit permutation PI as its cryptographic foundation.
--			PI is built from twelve iterations of LPS transformation, interleaved with
--			EX-OR operation with round constants.
--			LPS itself stands for Linear, Permutation, Substitution.
--			All design credits for the algorithm reside with Markku-Juhani O. Saarinen.
--			This is a VHDL implementation of his algorithm as understood by me.
--					
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.stribob_pkg.all;
use IEEE.NUMERIC_STD.ALL;
-----------------------------------------------------------------------------------
entity top_1 is
	
	port( 	key: 		in std_logic_vector(511 downto 0);
			bdi: 		in std_logic_vector(511 downto 0);
			iv: 		in std_logic_vector(511 downto 0);
			len_a: 		in std_logic_vector(511 downto 0);
			clk: 		in std_logic;
			bdo:		out std_logic_vector(511 downto 0);

			
			en_v, en_d, en_c, en_p, en_pi, en_i, en_j: in std_logic;
			piso_data_en : in std_logic_vector(1 downto 0);
			
			sel_v: in std_logic_vector(2 downto 0);
			sel_p: in std_logic;
			sel_d: in std_logic;

			addr_pad: in std_logic_vector(3 downto 0);
			
			addr_C_constants: in std_logic_vector(3 downto 0);
			sel_lps: in std_logic);
			
end top_1;


----------------------------------------------------------------------
--declaring components of each type of device used
----------------------------------------------------------------------

architecture Behavioral of top_1 is

			signal vin, vout, v1, v2, p2, pi_input, pi_out, pi_v : std_logic_vector(511 downto 0);
			signal din, dout : std_logic_vector(511 downto 0);
			signal pin, pout : std_logic_vector(511 downto 0);
			signal cin, cout : std_logic_vector(511 downto 0);
			signal iin, iout : std_logic_vector(255 downto 0);
			signal jin, jout : std_logic_vector(127 downto 0);
			
			
			signal perm: t_stribob_state;
			signal pad: std_logic_vector (7 downto 0);
			signal dout_C_constants: std_logic_vector(511 downto 0);
			signal lps: std_logic_vector(511 downto 0);

begin

--------------------------------------------------------------------------
--ROM to store the pad values
--------------------------------------------------------------------------

	ROM_pad: entity work.ROM (Behavioral) port map(addr=>addr_pad, dout=>pad);


------------------------------------------------------------------------------
-- state vector
------------------------------------------------------------------------------
	
	v: entity work.reg_top (Behavioral) generic map(n=>512) 
		port map(enable=>en_v, clk=>clk, d=>vin, q=>vout);

	vin<= iv when sel_v<="000"		else
			v1 when sel_v<="001"		else
			v2 when sel_v<="010"		else
			cout when sel_v<="011"	else
			pi_v when sel_v<="100"	else
			(others=>'0');
			
-------------------------------------------------------------------------------
-- associated data block
-------------------------------------------------------------------------------
	d: entity work.reg_top (Behavioral) generic map(n=>512)
	port map(enable=>en_d, clk=>clk, d=>din, q=>dout);
	din<=iv when sel_d = '0' else
			vout;
			
	bdo <= dout when piso_data_en <= "11" else
			 cout when piso_data_en <= "01" else
			(others=>'0') when piso_data_en<="00";

-----------------------------------------------------------------------------
-- plaintext input
-----------------------------------------------------------------------------
	p: entity work.reg_top (Behavioral) generic map(n=>512)
	port map(enable=>en_p, clk=>clk, d=>pin, q=>pout); --done

	pin<= iv when sel_p='0' else
			p2;
	
-----------------------------------------------------------------------------------
-- ciphertext register
-----------------------------------------------------------------------------------
	c: entity work.reg_top (Behavioral) generic map(n=>512)
	port map(enable=>en_c, clk=>clk, d=>cin, q=>cout); --done

------------------------------------------------------------------------------
-- pi permutation register
------------------------------------------------------------------------------
lps<= pi_v when sel_lps='0' else
			vout;	

	pi_input<=lps xor dout_C_constants;

	pi: entity work.reg_top (Behavioral) generic map(n=>512) 
		port map(enable=>en_pi, clk=>clk, d=>pi_input, q=>pi_out);

-----------------------------------------------------------------------------
-- C constants
--------------------------------------------------------------------------------

	C_constants: entity work.C_round_const (distributed_rom)
					port map(input=>addr_C_constants, output=>dout_C_constants);


-----------------------------------------------------------------------
-- counters
---------------------------------------------------------------------
	i: entity work.reg_top (Behavioral) generic map(n=>256)
		port map(enable=>en_i, clk=>clk, d=>iin, q=>iout);
	
	j: entity work.reg_top (Behavioral) generic map(n=>128)
		port map(enable=>en_j, clk=>clk, d=>jin, q=>jout);


------------------------------------------------------------------
--LPS block
-----------------------------------------------------------------
	pi_perm: entity work.lps_block (Behavioral)
				port map(ip=>pi_out, op=>pi_v);


v1	<=	vout xor dout;
p2	<=	cout xor vout;
cin	<= 	pout xor vout;
v2	<=	vout xor pad;
	
end Behavioral;

