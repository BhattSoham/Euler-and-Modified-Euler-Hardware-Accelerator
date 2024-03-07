library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Euler is
  Port (
    x: in std_logic_vector(31 downto 0);
 y: in std_logic_vector(31 downto 0);
 h: in std_logic_vector(31 downto 0);
 x_out: out std_logic_vector(31 downto 0);
 y_out: out std_logic_vector(31 downto 0)
  
   );
end Euler;

architecture Behavioral of Euler is
component func is
    Port ( x_in : in STD_LOGIC_VECTOR(31 downto 0);
           y_in : in STD_LOGIC_VECTOR(31 downto 0);
           f : out STD_LOGIC_VECTOR(31 downto 0)
                 );
end component;

COMPONENT ADD
  PORT (
   --aclk : IN STD_LOGIC;
    s_axis_a_tvalid : IN STD_LOGIC;
    s_axis_a_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axis_b_tvalid : IN STD_LOGIC;
    s_axis_b_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_result_tvalid : OUT STD_LOGIC;
    m_axis_result_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)  
  );
END COMPONENT;

COMPONENT MAC
  PORT (
    s_axis_a_tvalid : IN STD_LOGIC;
    s_axis_a_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axis_b_tvalid : IN STD_LOGIC;
    s_axis_b_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axis_c_tvalid : IN STD_LOGIC;
    s_axis_c_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_result_tvalid : OUT STD_LOGIC;
    m_axis_result_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) 
  );
END COMPONENT;

signal s_axis_a_tvalid: std_logic := '0';
signal s_axis_b_tvalid: std_logic := '0';
signal s_axis_c_tvalid: std_logic := '0';
signal m_axis_result_tvalid1: std_logic := '0';
signal m_axis_result_tvalid2: std_logic := '0';
signal fcn: std_logic_vector(31 downto 0);
signal  x_output :  STD_LOGIC_VECTOR(31 downto 0);
signal y_output :  STD_LOGIC_VECTOR(31 downto 0) ;

begin
uut1: func port map (
x_in => x,
y_in => y,
f => fcn
);

uut2: MAC   PORT MAP (
       s_axis_a_tvalid => s_axis_a_tvalid,
    s_axis_a_tdata => h,
    s_axis_b_tvalid => s_axis_b_tvalid,
    s_axis_b_tdata => fcn,
    s_axis_c_tvalid => s_axis_c_tvalid,
    s_axis_c_tdata => y,
    m_axis_result_tvalid => m_axis_result_tvalid1,
    m_axis_result_tdata => y_output
  );

uut3: ADD
  PORT MAP (
   -- aclk => clk,
    s_axis_a_tvalid => s_axis_a_tvalid,
    s_axis_a_tdata => x,
    s_axis_b_tvalid => s_axis_b_tvalid,
    s_axis_b_tdata => h,
    m_axis_result_tvalid => m_axis_result_tvalid2,
    m_axis_result_tdata => x_output
  );

x_out <= x_output;
y_out <= y_output;

end Behavioral;
