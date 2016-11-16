----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:19:37 11/08/2014 
-- Design Name: 
-- Module Name:    reg_top - Behavioral 
-- Project Name: 	 stribob_cipher
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

--CURRENTLY A 512-BIT REGISTER WITH ENABLE AND RESET

entity reg_top is
	generic (n:integer :=512);
	port(enable,clk: IN STD_LOGIC;
			d : IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			q : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0));
end reg_top;

architecture Behavioral of reg_top is

begin
	process (clk)
	begin
	
		if rising_edge(clk) then
			if enable = '1' then 
				q <= d;
			end if;
		end if;
	end process;

end Behavioral;

