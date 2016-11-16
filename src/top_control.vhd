----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:21:29 12/17/2014 
-- Design Name: 
-- Module Name:    top_control - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_control is
    Port ( clk : in  STD_LOGIC;
				reset: in std_logic;
				en_v, en_d, en_c, en_p, en_pi, en_i, en_j:  out std_logic;
				
				piso_data_en: out std_logic_vector(1 downto 0);				
				sel_v: out std_logic_vector(2 downto 0);
				sel_p: out std_logic;
				sel_d: out std_logic;

				iv_ready: in std_logic;
				addr_pad: out std_logic_vector(3 downto 0);
				
				addr_C_constants: out std_logic_vector(3 downto 0);
				sel_lps: out std_logic;
				piso_data: out std_logic_vector(511 downto 0)
							
	 
	 );

end top_control;





architecture Behavioral of top_control is

		type t_state is (S_RESET, S_WAIT, S_INIT, S_ENCODE, S_ENC, S_PUT_K, S_PUT_N, S_PUT_A, S_GET, S_DEC, S_PERM);
		signal state       : t_state;


begin
	process(clk)
			begin
			
			if rising_edge(clk) then
				if (reset='1') then
					state <= (S_RESET);
					
			else
				if (state = S_RESET) then
				piso_data<=(others=>'0');
				
				state <= (S_WAIT);
				
				
				elsif (state = S_WAIT) then
					if iv_ready	<=	'1' then
					state <= (S_ENCODE);

				elsif (state = S_ENCODE) then
					en_c <= '1';
					en_v <= '1';
					en_p <= '1';
					sel_v <= "010";
					state <= (S_PUT_K);
					
					
				elsif (state = S_INIT) then
					sel_v <= "111";
					state <= (S_ENCODE);
				
				
				elsif (state = S_PUT_K) then
					sel_v <= "001";
					en_v <= '1';
					en_d <= '1';
					state <= (S_PERM);
					state <= (S_PUT_N);
					
				elsif (state = S_PUT_N) then
					sel_v <= "001";
					en_v <= '1';
					en_d <= '1';
					state <= (S_PERM);
					state <= (S_PUT_A);	
				
				
				elsif (state = S_PUT_A) then
					sel_v <= "001";
					en_v <= '1';
					en_d <= '1';
					state <= (S_PERM);
					state <= (S_ENC);
				

				elsif (state = S_ENC) then
					en_c <= '1';
					en_v <= '1';
					sel_v <= "011";
					state <= (S_GET);
			
					
				elsif (state = S_GET) then
					en_d <= '1';
					sel_d <= '1';
					piso_data_en <= "11";
				
				
				elsif (state = S_PERM) then
					sel_v <= "100";
					en_pi <= '1';
					sel_lps <= '0';
					addr_C_constants <= "0000";
				end if;
end if;				
		end if;
		end if;
end process;

end Behavioral;
