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

entity full_adder is
    Port ( clk : in STD_LOGIC;
           enable : in STD_LOGIC;
           input_a : in STD_LOGIC;
           input_b : in STD_LOGIC;
           carry_in : in STD_LOGIC;
           
           sum : out STD_LOGIC;
           carry_out : out STD_LOGIC);
end full_adder;

architecture Behavioral of full_adder is

    signal sum_buf_1, carry_buf_1, carry_buf_2: STD_LOGIC;
    
begin

half_adder_1 : entity work.half_adder PORT MAP(
    clk => clk,
    enable => enable,
    input_a => input_a,
    input_b => input_b,
    
    sum => sum_buf_1,
    carry_out => carry_buf_1
);

half_adder_2 : entity work.half_adder PORT MAP(
    clk => clk,
    enable => enable,
    input_a => sum_buf_1,
    input_b => carry_in,
    
    sum => sum,
    carry_out => carry_buf_2
);

carry_out <= carry_buf_1 or carry_buf_2;

--process (clk) begin
--if rising_edge(clk) then
--    if enable = '1' then
--        carry_out <= carry_buf_1 or carry_buf_2;
--    end if;
--end if;
--end process;

end Behavioral;
