----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Joash Naidoo
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity logic_shift_left is
Port ( clk : in STD_LOGIC;
       enable : in STD_LOGIC;
       
       shift : in STD_LOGIC;
       input_a : in STD_LOGIC;
       input_b : in STD_LOGIC;
       
       output_a : out STD_LOGIC;
       output_b : out STD_LOGIC );
end logic_shift_left;

architecture Behavioral of logic_shift_left is

begin

process(clk) begin
if rising_edge(clk) then
if enable = '1' then
    if shift = '1' then output_a <= input_b; output_b <= '0';
    else output_a <= input_a; output_b <= input_b; end if;
end if;
end if;
end process;

end Behavioral;
