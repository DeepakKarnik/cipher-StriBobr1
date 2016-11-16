----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:46:54 12/17/2014 
-- Design Name: 
-- Module Name:    stribob_map - Behavioral 
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

entity stribob_map is

port (
        ii :   in  std_logic_vector(stribob_b-1 downto 0);
        oo :   out t_stribob_state
		  
    );

end stribob_map;

architecture Behavioral of stribob_map is



begin
    gRow: for i in 0 to 7 generate
        gCol: for j in 0 to 7 generate
            oo(i,j)  <=  ii(stribob_b-(8*i+j)*stribob_WORD_SIZE-1 downto stribob_b-(8*i+j)*stribob_WORD_SIZE-stribob_WORD_SIZE);
        end generate;
    end generate;

end Behavioral;
