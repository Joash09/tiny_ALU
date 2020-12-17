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

entity full_subtractor is
Port ( clk : in STD_LOGIC;
       enable : in STD_LOGIC;
       input_a : in STD_LOGIC;
       input_b : in STD_LOGIC;
       borrow_i : in STD_LOGIC;
       
       diff_o : out STD_LOGIC;
       borrow_o : out STD_LOGIC);
end full_subtractor;

architecture Behavioral of full_subtractor is

    signal diff_1 : STD_LOGIC;
    signal borrow_1, borrow_2 : STD_LOGIC;

begin

    half_subtractor_1 : entity work.half_subtractor PORT MAP(
        clk => clk,
        enable => enable,
        input_a => input_a,
        input_b => input_b,
        
        diff_o => diff_1,
        borrow_o => borrow_1
    );
    
    half_subtractor_2 : entity work.half_subtractor PORT MAP(
        clk => clk,
        enable => enable,
        input_a => diff_1,
        input_b => borrow_i,
        
        diff_o => diff_o,
        borrow_o => borrow_2
    );
    
    process(clk) begin
    if rising_edge(clk) then
        if enable = '1' then
            borrow_o <= borrow_1 or borrow_2;
        end if; 
    end if;
    end process;
    
end Behavioral;
