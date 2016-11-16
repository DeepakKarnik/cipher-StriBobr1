----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:05:36 11/13/2014 
-- Design Name: 
-- Module Name:    lps_block - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.stribob_pkg.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity lps_block is
    Port ( ip : in  STD_LOGIC_VECTOR (511 downto 0);
				--clk: in std_logic;
           op : out  STD_LOGIC_VECTOR (511 downto 0));
end lps_block;

architecture Behavioral of lps_block is

signal sb : std_logic_vector(511 downto 0);
signal perm: t_stribob_state;
begin
			
			
		sbox1:	entity work.sbox_rom (distributed_rom)
						port map(input=>ip(7 downto 0), output=>sb(7 downto 0));
			
		sbox2:	entity work.sbox_rom (distributed_rom)
						port map(input=>ip(15 downto 8), output=>sb(15 downto 8));	
			
			
		sbox3:	entity work.sbox_rom (distributed_rom)
						port map(input=>ip(23 downto 16), output=>sb(23 downto 16));	
			
		
		sbox4:	entity work.sbox_rom (distributed_rom)
						port map(input=>ip(31 downto 24), output=>sb(31 downto 24));	
			
		sbox5:	entity work.sbox_rom (distributed_rom)
						port map(input=>ip(39 downto 32), output=>sb(39 downto 32));
			
		sbox6:	entity work.sbox_rom (distributed_rom)
						port map(input=>ip(47 downto 40), output=>sb(47 downto 40));	
			
			
		sbox7:	entity work.sbox_rom (distributed_rom)
						port map(input=>ip(55 downto 48), output=>sb(55 downto 48));	
			
		
		sbox8:	entity work.sbox_rom (distributed_rom)
						port map(input=>ip(63 downto 56), output=>sb(63 downto 56));	
			
		sbox9:	entity work.sbox_rom (distributed_rom)
						port map(input=>ip(71 downto 64), output=>sb(71 downto 64));
			
		sbox10:	entity work.sbox_rom (distributed_rom)
						port map(input=>ip(79 downto 72), output=>sb(79 downto 72));	
			
			
		sbox11:	entity work.sbox_rom (distributed_rom)
						port map(input=>ip(87 downto 80), output=>sb(87 downto 80));	
			
		
		sbox12:	entity work.sbox_rom (distributed_rom)
						port map(input=>ip(95 downto 88), output=>sb(95 downto 88));	
			
			
		sbox13:	entity work.sbox_rom (distributed_rom)
						port map(input=>ip(103 downto 96), output=>sb(103 downto 96));
		
		
		sbox14:	entity work.sbox_rom (distributed_rom)
						port map(input=>ip(111 downto 104), output=>sb(111 downto 104));	
			
			
		sbox15:	entity work.sbox_rom (distributed_rom)
						port map(input=>ip(119 downto 112), output=>sb(119 downto 112));	
			
		
		sbox16:	entity work.sbox_rom (distributed_rom)
						port map(input=>ip(127 downto 120), output=>sb(127 downto 120));	
					
						
		sbox17:	entity work.sbox_rom (distributed_rom)
						port map(input=>ip(135 downto 128), output=>sb(135 downto 128));
			
		sbox18:	entity work.sbox_rom (distributed_rom)
						port map(input=>ip(143 downto 136), output=>sb(143 downto 136));	
			
			
		sbox19:	entity work.sbox_rom (distributed_rom)
						port map(input=>ip(151 downto 144), output=>sb(151 downto 144));	
			
		
		sbox20:	entity work.sbox_rom (distributed_rom)
						port map(input=>ip(159 downto 152), output=>sb(159 downto 152));	
			
		sbox21:	entity work.sbox_rom (distributed_rom)
						port map(input=>ip(167 downto 160), output=>sb(167 downto 160));
			
		sbox22:	entity work.sbox_rom (distributed_rom)
						port map(input=>ip(175 downto 168), output=>sb(175 downto 168));	
			
			
		sbox23:	entity work.sbox_rom (distributed_rom)
						port map(input=>ip(183 downto 176), output=>sb(183 downto 176));	
	
	
		sbox24: entity work.sbox_rom (distributed_rom)                                   
		port map(input=>ip(191 downto 184), output=>sb(191 downto 184));                 
																													
		sbox25: entity work.sbox_rom (distributed_rom)                                   
		port map(input=>ip(199 downto 192), output=>sb(199 downto 192));                 
																													
		sbox26: entity work.sbox_rom (distributed_rom)                                   
		port map(input=>ip(207 downto 200), output=>sb(207 downto 200));                 
																													
		sbox27: entity work.sbox_rom (distributed_rom)                                   
		port map(input=>ip(215 downto 208), output=>sb(215 downto 208));                 
																													
		sbox28: entity work.sbox_rom (distributed_rom)                                   
		port map(input=>ip(223 downto 216), output=>sb(223 downto 216));                 
																													
		sbox29: entity work.sbox_rom (distributed_rom)                                   
		port map(input=>ip(231 downto 224), output=>sb(231 downto 224));

		sbox30: entity work.sbox_rom (distributed_rom)                                   
		port map(input=>ip(239 downto 232), output=>sb(239 downto 232));                 
																													
		sbox31: entity work.sbox_rom (distributed_rom)                                   
		port map(input=>ip(247 downto 240), output=>sb(247 downto 240));                 
																													
		sbox32: entity work.sbox_rom (distributed_rom)                                   
		port map(input=>ip(255 downto 248), output=>sb(255 downto 248));                 
																													
		sbox33: entity work.sbox_rom (distributed_rom)                                   
		port map(input=>ip(263 downto 256), output=>sb(263 downto 256));                 
																													
		sbox34: entity work.sbox_rom (distributed_rom)                                   
		port map(input=>ip(271 downto 264), output=>sb(271 downto 264));                 
																													
		sbox35: entity work.sbox_rom (distributed_rom)                                   
		port map(input=>ip(279 downto 272), output=>sb(279 downto 272));                 
																													
		sbox36: entity work.sbox_rom (distributed_rom)                                   
		port map(input=>ip(287 downto 280), output=>sb(287 downto 280));                 
																													
		sbox37: entity work.sbox_rom (distributed_rom)                                   
		port map(input=>ip(295 downto 288), output=>sb(295 downto 288));                 
																													
		sbox38: entity work.sbox_rom (distributed_rom)                                   
		port map(input=>ip(303 downto 296), output=>sb(303 downto 296));                 
																													
		sbox39: entity work.sbox_rom (distributed_rom)                                   
		port map(input=>ip(311 downto 304), output=>sb(311 downto 304));                 
																													
		sbox40: entity work.sbox_rom (distributed_rom)                                   
		port map(input=>ip(319 downto 312), output=>sb(319 downto 312));                 
																													
		sbox41: entity work.sbox_rom (distributed_rom)                                   
		port map(input=>ip(327 downto 320), output=>sb(327 downto 320));  

		sbox42: entity work.sbox_rom (distributed_rom)                                   
		port map(input=>ip(335 downto 328), output=>sb(335 downto 328));                 
																													
		sbox43: entity work.sbox_rom (distributed_rom)                                   
		port map(input=>ip(343 downto 336), output=>sb(343 downto 336));                 
																													
		sbox44: entity work.sbox_rom (distributed_rom)                                   
		port map(input=>ip(351 downto 344), output=>sb(351 downto 344));                 
																													
		sbox45: entity work.sbox_rom (distributed_rom)                                   
		port map(input=>ip(359 downto 352), output=>sb(359 downto 352));                 
																													
		sbox46: entity work.sbox_rom (distributed_rom)                                   
		port map(input=>ip(367 downto 360), output=>sb(367 downto 360));                 
																													
		sbox47: entity work.sbox_rom (distributed_rom)                                   
		port map(input=>ip(375 downto 368), output=>sb(375 downto 368));                 
																													
		sbox48: entity work.sbox_rom (distributed_rom)                                   
		port map(input=>ip(383 downto 376), output=>sb(383 downto 376));                 
																													
		sbox49: entity work.sbox_rom (distributed_rom)                                   
		port map(input=>ip(391 downto 384), output=>sb(391 downto 384));                 
																													
		sbox50: entity work.sbox_rom (distributed_rom)                                   
		port map(input=>ip(399 downto 392), output=>sb(399 downto 392));                 
																													
		sbox51: entity work.sbox_rom (distributed_rom)                                   
		port map(input=>ip(407 downto 400), output=>sb(407 downto 400));                 
																													
		sbox52: entity work.sbox_rom (distributed_rom)                                   
		port map(input=>ip(415 downto 408), output=>sb(415 downto 408));                 
																							  
		sbox53: entity work.sbox_rom (distributed_rom)                                   
		port map(input=>ip(423 downto 416), output=>sb(423 downto 416));                 
																													
		sbox54: entity work.sbox_rom (distributed_rom)                                   
		port map(input=>ip(431 downto 424), output=>sb(431 downto 424));                 
																													
		sbox55: entity work.sbox_rom (distributed_rom)                                   
		port map(input=>ip(439 downto 432), output=>sb(439 downto 432));                 
																													
		sbox56: entity work.sbox_rom (distributed_rom)                                   
		port map(input=>ip(447 downto 440), output=>sb(447 downto 440));                 
																													
		sbox57: entity work.sbox_rom (distributed_rom)                                   
		port map(input=>ip(455 downto 448), output=>sb(455 downto 448));                 
																													
		sbox58: entity work.sbox_rom (distributed_rom)                                   
		port map(input=>ip(463 downto 456), output=>sb(463 downto 456));                 
																													
		sbox59: entity work.sbox_rom (distributed_rom)                                   
		port map(input=>ip(471 downto 464), output=>sb(471 downto 464));                 
																													
		sbox60: entity work.sbox_rom (distributed_rom)                                   
		port map(input=>ip(479 downto 472), output=>sb(479 downto 472));                 
																													
		sbox61: entity work.sbox_rom (distributed_rom)                                   
		port map(input=>ip(487 downto 480), output=>sb(487 downto 480));                 
																													
		sbox62: entity work.sbox_rom (distributed_rom)                                   
		port map(input=>ip(495 downto 488), output=>sb(495 downto 488));                 
																													
		sbox63: entity work.sbox_rom (distributed_rom)                                   
		port map(input=>ip(503 downto 496), output=>sb(503 downto 496));                 
																													
		sbox64: entity work.sbox_rom (distributed_rom)                                   
		port map(input=>ip(511 downto 504), output=>sb(511 downto 504));                 
                                                                
						
			
			
			
	--op<=sb;			
				pi_p: entity work.stribob_map (Behavioral)
				port map(ii=>sb,oo=>perm);
				
			--	pi_invp: entity work.stribob_invmap (Behavioral)
			--	port map(ii=>perm, oo=>op);
				
				
end Behavioral;
