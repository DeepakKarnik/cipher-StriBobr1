----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:10:26 11/13/2014 
-- Design Name: 
-- Module Name:    cip_const_rom - Behavioral 
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
use IEEE.numeric_std.all;
use IEEE.numeric_bit.all;
use IEEE.std_logic_unsigned.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.all

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


-------------------------------------------------------------------



entity cip_const_rom is
    Port ( 	en, rd, rst : in STD_LOGIC;
				clk: in STD_LOGIC;
				addr_ip : in  STD_LOGIC_VECTOR (3 downto 0);
				d_op : out  STD_LOGIC_VECTOR (511 downto 0));
end cip_const_rom;

architecture Behavioral of cip_const_rom is
		
		type cip_const_rom_array is array (0 to 15) 
		of std_logic_vector(511 downto 0);

    constant Content: cip_const_rom_array := 
					(		0 => (OTHERS=>'0'),		-- Suppose ROM has 
						  1 => (OTHERS=>'0'),		-- prestored value
						  2 => (OTHERS=>'0'),		-- like this table
						  3 => (OTHERS=>'0'),    
						  4 => (OTHERS=>'0'),		
						  5 => (OTHERS=>'0'),    
						  6 => (OTHERS=>'0'),		
						  7 => (OTHERS=>'0'),       
						  8 => (OTHERS=>'0'),       
						  9 => (OTHERS=>'0'),       
						  10 => (OTHERS=>'0'),		
							11 => (OTHERS=>'0'),     
							12 => (OTHERS=>'0'),     
							13 => (OTHERS=>'0'),		
							14 => (OTHERS=>'0'),
							15 => (OTHERS=>'0')
					);
begin
		process(clk, rst, rd, addr_ip)
    begin
			if(rst = '0' ) then
				d_op <= (OTHERS=>'0');
			elsif( clk'event and clk = '1' ) then
				if en = '1' then
					if( rd = '1' ) then
						d_op<= Content(conv_integer(addr_ip));
            	else
                    d_op <= (OTHERS=>'0');
            	end if;
				end if;
			end if;
    end process;


end Behavioral;

