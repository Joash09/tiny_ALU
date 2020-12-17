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

entity magnitude_comparator is
Port ( clk : in STD_LOGIC;
       enable : in STD_LOGIC;
       data_a_i : in STD_LOGIC_VECTOR(7 downto 0);
       data_b_i : in STD_LOGIC_VECTOR(7 downto 0);
       
       data_o : out STD_LOGIC);
end magnitude_comparator;

architecture Behavioral of magnitude_comparator is

    signal result : STD_LOGIC_VECTOR(7 downto 0);
    
    signal flag : STD_LOGIC;

begin

-- Minus the two numbers A-B 
-- If borrow_out is 1 A<B
-- If borrow_out is 0 and diff is 0 A=B
-- Else A>B

subtractor_inst : entity work.adder_8bit PORT MAP(
    clk => clk,
    enable => enable,
    sel => '1', -- Hard coded subtraction
    input_a => data_a_i,
    input_b => data_b_i,
    
    output => result,
    carry_out => flag -- Misuse 
);

process(clk) begin
if rising_edge(clk) then
if enable = '1' then
    data_o <= flag; 
end if;
end if;
end process;

end Behavioral;
