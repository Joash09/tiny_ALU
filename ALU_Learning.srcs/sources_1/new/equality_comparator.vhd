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

entity equality_comparator is
Port (  clk : in STD_LOGIC;
        enable : in STD_LOGIC;
        data_a_i : in STD_LOGIC_VECTOR(7 downto 0);
        data_b_i : in STD_LOGIC_VECTOR(7 downto 0);
        data_o : out STD_LOGIC
);
end equality_comparator;

architecture Behavioral of equality_comparator is

    signal data_buf_1 : STD_LOGIC_VECTOR(7 downto 0);
    
    signal data_buf_2 : STD_LOGIC_VECTOR(3 downto 0);    

    signal data_buf_3 : STD_LOGIC_VECTOR(1 downto 0);
    
    signal data_buf_4 : STD_LOGIC;
    
begin

for_gen_i : for i in 0 to 7 generate
    data_buf_1(i) <= data_a_i(i) xnor data_b_i(i);
end generate;

for_gen_j : for j in 0 to 3 generate
    data_buf_2(j) <= data_buf_1(2*j+1) and data_buf_1(2*j);
end generate;

for_gen_k : for k in 0 to 1 generate
    data_buf_3(k) <= data_buf_2(2*k+1) and data_buf_2(2*k);
end generate;

data_buf_4 <= data_buf_3(1) and data_buf_3(0);

process(clk) begin
if rising_edge(clk) then
    if enable = '1' then
        data_o <= data_buf_4;
    end if;
end if;
end process;

end Behavioral;
