----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:53:56 12/17/2014 
-- Design Name: 
-- Module Name:    stribob_invmap - Behavioral 
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


entity stribob_invmap is  
    port (
        ii :   in  t_stribob_state;
        oo :   out std_logic_vector(stribob_BLOCK_SIZE-1 downto 0)
    );
end stribob_invmap;

architecture Behavioral of stribob_invmap is

begin
    gRow: for i in 0 to 7 generate
        gCol: for j in 0 to 7 generate
            oo(stribob_BLOCK_SIZE-(j*8+i*stribob_WORD_SIZE)-1 downto stribob_BLOCK_SIZE-(j*8+i*stribob_WORD_SIZE)-8)  <=  ii(i,j);
        end generate;
    end generate;



end Behavioral;

