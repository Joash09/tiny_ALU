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

entity half_adder_tb is
end half_adder_tb;

architecture Behavioral of half_adder_tb is

    constant CLK_PERIOD : time := 10ns;
    signal clk : STD_LOGIC := '0';
    
    signal enable, input_a, input_b : STD_LOGIC := '0';
    signal sum, carry_out : STD_LOGIC;
     
begin

    uut : entity work.half_adder PORT MAP(
        clk => clk,
        enable => enable,
        input_a => input_a,
        input_b => input_b,
        
        sum => sum,
        carry_out => carry_out
    );
    
    clk_proc : process begin
    wait for CLK_PERIOD/2;
    clk <= '1';
    wait for CLK_PERIOD/2;
    clk <= '0';
    end process;
    
    stim : process begin
    report "Begin stimulation test";
    enable <= '1';
    -- wait for 5 ns; -- Wait initial conditions
    input_a <= '0';
    input_b <= '0';
    wait for 5ns;
    assert not(sum = '0' and carry_out = '0') report "Incorrect output" severity failure;
    wait for 100ns;
    
    input_a <= '1';
    input_b <= '0';
    wait for 5ns;
    assert not(sum = '1' and carry_out = '0') report "Incorect output" severity failure;
    wait for 100ns;
    
    input_a <= '0';
    input_b <= '1';
    wait for 5ns;
    assert not(sum = '1' and carry_out='0') report "Incorrect output" severity failure;
    wait for 100ns;
    
    input_a <= '1';
    input_b <= '1';
    wait for 5ns;
    assert not(sum = '0' and carry_out='1') report "Incorrect output" severity failure;
    wait for 100ns;
    
    wait;
    end process;

end Behavioral;
