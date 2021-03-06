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

entity ALU is
Port (  clk : in STD_LOGIC;
        opcode : in STD_LOGIC_VECTOR(2 downto 0);
        input_a : in STD_LOGIC_VECTOR(7 downto 0); -- 8 bit ALU
        input_b : in STD_LOGIC_VECTOR(7 downto 0);
        
        result : out STD_LOGIC_VECTOR(7 downto 0);
        status_flag : out STD_LOGIC
);
end ALU;

architecture Behavioral of ALU is

    signal add_en, sub_en, equal_en, mag_en, shift_l_en : STD_LOGIC := '0'; -- Module enable signals
    signal status_add, status_equ, status_mag : STD_LOGIC; -- Module flag signals
    signal result_add, result_shift_l : STD_LOGIC_VECTOR(7 downto 0); -- Module result signals

begin

adder_8bit_inst : entity work.adder_8bit PORT MAP (
    clk => clk,
    enable => add_en,
    sel => sub_en,
    input_a => input_a,
    input_b => input_b,
    
    output => result_add,
    carry_out => status_add
);

equal_comparator_inst : entity work.equality_comparator PORT MAP(
    clk => clk,
    enable => equal_en,
    data_a_i => input_a,
    data_b_i => input_b,
    data_o => status_equ
);

magnitude_comparator_isnt : entity work.magnitude_comparator PORT MAP(
    clk => clk,
    enable => mag_en,    
    data_a_i => input_a,
    data_b_i => input_b,
    data_o => status_mag
);

logic_shift_left_inst : entity work.logic_shift_left PORT MAP(
    clk => clk,
    enable => shift_l_en,
    input_a => input_a,
    data_o => result_shift_l
);

process(clk) begin 
if rising_edge(clk) then
    case(opcode) is
        -- There's probably a better way to do this
        when B"000" => add_en <= '1'; sub_en <= '0'; equal_en <= '0'; mag_en <= '0'; shift_l_en <= '0';
        when B"001" => add_en <= '1'; sub_en <= '1'; equal_en <= '0'; mag_en <= '0'; shift_l_en <= '0';-- Use adder and subtractor
        when B"010" => equal_en <= '1'; add_en <= '0'; sub_en <= '0'; mag_en <= '0'; shift_l_en <= '0';
        when B"011" => mag_en <= '1'; add_en <= '0'; sub_en <= '0'; equal_en <= '0'; shift_l_en <= '0';
        when B"100" => shift_l_en <= '1'; mag_en <= '0'; add_en <= '0'; sub_en <= '0'; equal_en <= '0';
        when others => 
    end case;
    
    -- Choose data for status flag
    if add_en = '1' then status_flag <= status_add;
    elsif sub_en = '1' then status_flag <= not status_add; -- Reusing adder for subtracting; Flag is inverted to represent borrow bit
    elsif equal_en = '1' then status_flag <= status_equ; 
    elsif mag_en = '1' then status_flag <= status_mag; 
    else status_flag <= '0'; end if;
    
    -- Choose data for result
    if add_en = '1' then result <= result_add;
    elsif sub_en = '1' then result <= result_add;
    elsif shift_l_en = '1' then result <= result_shift_l;
    else result <= (others => '0'); end if;
    
end if;
end process; 

end Behavioral;
