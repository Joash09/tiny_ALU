----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Joash Naidoo
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU_tb is
end ALU_tb;

architecture Behavioral of ALU_tb is

    constant CLK_PERIOD : time := 10ns;
    signal clk : STD_LOGIC := '0';
    
    signal cmd_received : STD_LOGIC := '0';
    signal input_a, input_b, result : STD_LOGIC_VECTOR(7 downto 0);
    signal status_flag : STD_LOGIC;
    signal opcode : STD_LOGIC_VECTOR(2 downto 0);

begin

uut : entity work.ALU PORT MAP(
    clk => clk,
    opcode => opcode,
    input_a => input_a,
    input_b => input_b,
    
    result => result,
    status_flag => status_flag
);

clk_proc : process begin
    wait for CLK_PERIOD/2;
    clk <= '1';
    wait for CLK_PERIOD/2;
    clk <= '0';
end process;

stim_proc : process begin

wait for 50ns;
report "Begin Testing";

report "Test Addition";
input_a <= X"13";
input_b <= X"67";
opcode <= "000";
wait for 100 ns;

report "Test Subtractor"; 
input_a <= X"67";
input_b <= X"19";
opcode <= "001";
wait for 100 ns;

report "Test Equal Comparator";
input_a <= X"67";
input_b <= X"67";
opcode <= "010";
wait for 100 ns;

report "Test Magnitude Comparator";
input_a <= X"67";
input_b <= X"58";
opcode <= "011";


wait;

end process;

end Behavioral;
