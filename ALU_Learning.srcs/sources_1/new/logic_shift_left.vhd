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
       input_a : in STD_LOGIC_VECTOR(7 downto 0);
       
       data_o : out STD_LOGIC_VECTOR(7 downto 0)
);
end logic_shift_left;

architecture Behavioral of logic_shift_left is

begin

process(clk) begin
if rising_edge(clk) then
    if enable = '1' then
        
        data_o(0) <= '0';
        for i in 0 to 6 loop
            data_o(i+1) <= input_a(i);
        end loop;
    
    end if;
end if;
end process;

end Behavioral;
