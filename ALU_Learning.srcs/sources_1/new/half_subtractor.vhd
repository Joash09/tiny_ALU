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

entity half_subtractor is
Port ( clk : in STD_LOGIC;
       enable : in STD_LOGIC;
       input_a : in STD_LOGIC;
       input_b : in STD_LOGIC;
       
       diff_o : out STD_LOGIC;
       borrow_o : out STD_LOGIC);
end half_subtractor;

architecture Behavioral of half_subtractor is

begin

process(clk) begin
if rising_edge(clk) then
    if enable = '1' then
        diff_o <= input_a xor input_b;
        borrow_o <= input_b;
    end if;
end if;
end process;

end Behavioral;
