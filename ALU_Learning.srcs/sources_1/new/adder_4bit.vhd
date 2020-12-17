----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Joash Naidoo
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder_8bit is
Port ( clk : in STD_LOGIC;
       enable : in STD_LOGIC;
       sel : in STD_LOGIC; -- Select addition = 0 or subtraction = 1 
       input_a : in STD_LOGIC_VECTOR(7 downto 0);
       input_b : in STD_LOGIC_VECTOR(7 downto 0);
       
       output : out STD_LOGIC_VECTOR(7 downto 0);
       carry_out : out STD_LOGIC );
end adder_8bit;

architecture Behavioral of adder_8bit is

    signal c0, c1, c2, c3, c4, c5, c6 : STD_LOGIC;
    
    signal input_b_inv : STD_LOGIC_VECTOR(7 downto 0);
    signal carry_out_buf : STD_LOGIC;
    signal output_buf : STD_LOGIC_VECTOR(7 downto 0);

begin
    
    -- Invert input_b is wanting to subtract
    for_gen_i : for i in 0 to 7 generate
        input_b_inv(i) <= input_b(i) xor sel;
    end generate;
    
 -- Ripple adder; look into carry look ahead adder
 
 adder_inst_0 : entity work.full_adder PORT MAP(
    clk => clk,
    enable => enable,
    input_a => input_a(0),
    input_b => input_b_inv(0),
    carry_in => sel, -- addition = '0'; subtraction = A+~B+1 
    
    sum => output_buf(0),
    carry_out => c0
);
 
adder_inst_1 : entity work.full_adder PORT MAP(
    clk => clk,
    enable => enable,
    input_a => input_a(1),
    input_b => input_b_inv(1),
    carry_in => c0,
    
    sum => output_buf(1),
    carry_out => c1
);
 
adder_inst_2 : entity work.full_adder PORT MAP(
    clk => clk,
    enable => enable,
    input_a => input_a(2),
    input_b => input_b_inv(2),
    carry_in => c1,
    
    sum => output_buf(2),
    carry_out => c2
);
 
adder_inst_3 : entity work.full_adder PORT MAP(
    clk => clk,
    enable => enable,
    input_a => input_a(3),
    input_b => input_b_inv(3),
    carry_in => c2,
    
    sum => output_buf(3),
    carry_out => c3
);

 adder_inst_4 : entity work.full_adder PORT MAP(
    clk => clk,
    enable => enable,
    input_a => input_a(4),
    input_b => input_b_inv(4),
    carry_in => c3,
    
    sum => output_buf(4),
    carry_out => c4
);
 
adder_inst_5 : entity work.full_adder PORT MAP(
    clk => clk,
    enable => enable,
    input_a => input_a(5),
    input_b => input_b_inv(5),
    carry_in => c4,
    
    sum => output_buf(5),
    carry_out => c5
);
 
adder_inst_6 : entity work.full_adder PORT MAP(
    clk => clk,
    enable => enable,
    input_a => input_a(6),
    input_b => input_b_inv(6),
    carry_in => c5,
    
    sum => output_buf(6),
    carry_out => c6
);
 
adder_inst_7 : entity work.full_adder PORT MAP(
    clk => clk,
    enable => enable,
    input_a => input_a(7),
    input_b => input_b_inv(7),
    carry_in => c6,
    
    sum => output_buf(7),
    carry_out => carry_out_buf
);

process(clk) begin
if rising_edge(clk) then
if enable = '1' then
    output <= output_buf;
    carry_out <= carry_out_buf;
end if;
end if;
end process;
 
end Behavioral;
