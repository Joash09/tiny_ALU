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

entity full_adder_tb is
end full_adder_tb;

architecture Behavioral of full_adder_tb is

    constant CLK_PERIOD : time := 10ns;
    signal clk : STD_LOGIC := '0';
    
    signal enable, input_a, input_b, carry_in : STD_LOGIC := '0';
    signal sum, carry_out : STD_LOGIC := '0';

begin

    uut : entity work.full_adder PORT MAP(
        clk => clk,
        enable => enable,
        
        input_a => input_a,
        input_b => input_b,
        carry_in => carry_in,
        
        sum => sum,
        carry_out => carry_out
    );
    
    clk_proc : process begin
    wait for CLK_PERIOD/2;
    clk <= '1';
    wait for CLK_PERIOD/2;
    clk <= '0';
    end process;
    
    stim_proc : process begin
    report "Begin Test Procedure";
    enable <= '1';
    
    input_a <= '0';
    input_b <= '0';
    carry_in <= '0';
    assert (sum /= '0' and carry_out/='0') report "Incorrect Result";
    wait for 100ns;
    
    input_a <= '1';
    input_b <= '0';
    carry_in <= '0';
    assert (sum /= '1' and carry_out/='0') report "Incorrect Result";
    wait for 100ns;
    
    input_a <= '0';
    input_b <= '1';
    carry_in <= '0';
    assert (sum /= '1' and carry_out/='0') report "Incorrect Result";
    wait for 100ns;
    
    input_a <= '1';
    input_b <= '1';
    carry_in <= '0';
    assert (sum /= '0' and carry_out/='1') report "Incorrect Result";
    wait for 100ns;
    
    --======================================================
    
    input_a <= '0';
    input_b <= '0';
    carry_in <= '1';
    assert (sum /= '0' and carry_out/='0') report "Incorrect Result";
    wait for 100ns;
    
    input_a <= '1';
    input_b <= '0';
    carry_in <= '1';
    assert (sum /= '1' and carry_out/='0') report "Incorrect Result";
    wait for 100ns;
    
    input_a <= '0';
    input_b <= '1';
    carry_in <= '1';
    assert (sum /= '1' and carry_out/='0') report "Incorrect Result";
    wait for 100ns;
    
    input_a <= '1';
    input_b <= '1';
    carry_in <= '1';
    assert (sum /= '0' and carry_out/='1') report "Incorrect Result";
    wait for 100ns;
    
    wait;
    end process;

end Behavioral;
