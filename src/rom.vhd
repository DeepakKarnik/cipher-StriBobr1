----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:18:54 12/17/2014 
-- Design Name: 
-- Module Name:    ROM - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ROM is
    Port ( addr : in  STD_LOGIC_VECTOR (3 downto 0);
           dout : out  STD_LOGIC_VECTOR (7 downto 0));
end ROM;

architecture Behavioral of ROM is
	 type rom_type is array (0 to 7) of std_logic_vector (7 downto 0);
				
	  constant ROM_array : rom_type :=
		(0 => x"01",  1 => x"02",  2 => x"10",  3 => x"20",
		 4 => x"30",  5 => x"40",  6 => x"50",  7 => x"60");
				
	  begin
			dout <= ROM_array(to_integer(unsigned(addr)));

end Behavioral;

