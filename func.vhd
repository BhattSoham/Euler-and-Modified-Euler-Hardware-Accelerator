----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/26/2023 02:24:44 PM
-- Design Name: 
-- Module Name: func - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
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

entity func is
 Port ( 
 x: in std_logic_vector(31 downto 0);
 y: in std_logic_vector(31 downto 0);
 f: out std_logic_vector(31 downto 0)
 );
end func;

architecture Behavioral of func is
Component MUL is
  Port ( 
    s_axis_a_tvalid : in STD_LOGIC;
    s_axis_a_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_b_tvalid : in STD_LOGIC;
    s_axis_b_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_result_tvalid : out STD_LOGIC;
    m_axis_result_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
end Component;
  
Component SUB is 
Port ( 
    s_axis_a_tvalid : in STD_LOGIC;
    s_axis_a_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_b_tvalid : in STD_LOGIC;
    s_axis_b_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_result_tvalid : out STD_LOGIC;
    m_axis_result_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end Component;

Component MUL_2 is
  Port ( 
    s_axis_a_tvalid : in STD_LOGIC;
    s_axis_a_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_b_tvalid : in STD_LOGIC;
    s_axis_b_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_result_tvalid : out STD_LOGIC;
    m_axis_result_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
end Component;

Component DIV is
Port ( 
    s_axis_a_tvalid : in STD_LOGIC;
    s_axis_a_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_b_tvalid : in STD_LOGIC;
    s_axis_b_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_result_tvalid : out STD_LOGIC;
    m_axis_result_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end Component;

signal s_axis_a_tvalid: std_logic := '0';
signal s_axis_b_tvalid: std_logic := '0';
signal m_axis_result_tvalid1: std_logic := '0';
signal m_axis_result_tvalid2: std_logic := '0';
signal m_axis_result_tvalid3: std_logic := '0';
signal m_axis_result_tvalid4: std_logic := '0';
signal mul1: STD_LOGIC_VECTOR(31 downto 0)  := (others => '0');
signal sub1: STD_LOGIC_VECTOR(31 downto 0)  := (others => '0');
signal mul2: STD_LOGIC_VECTOR(31 downto 0)  := (others => '0');
signal q: STD_LOGIC_VECTOR(31 downto 0)  := x"40000000";
signal func: STD_LOGIC_VECTOR(31 downto 0);
begin

uut1: MUL
Port Map (
  s_axis_a_tvalid => s_axis_a_tvalid,
    s_axis_a_tdata => x,
    s_axis_b_tvalid => s_axis_b_tvalid,
    s_axis_b_tdata => y,
    m_axis_result_tvalid => m_axis_result_tvalid1,
    m_axis_result_tdata => mul1
     );
    
uut2: SUB
Port Map (
s_axis_a_tvalid => s_axis_a_tvalid,
    s_axis_a_tdata => x,
    s_axis_b_tvalid => s_axis_b_tvalid,
    s_axis_b_tdata => y,
   m_axis_result_tvalid => m_axis_result_tvalid2,
    m_axis_result_tdata => sub1
  );

uut3: MUL_2
Port Map (
  s_axis_a_tvalid => s_axis_a_tvalid,
    s_axis_a_tdata => mul1,
    s_axis_b_tvalid => s_axis_b_tvalid,
    s_axis_b_tdata => sub1,
    m_axis_result_tvalid => m_axis_result_tvalid3,
    m_axis_result_tdata => mul2
     );


uut4: DIV
Port Map (
  s_axis_a_tvalid => s_axis_a_tvalid,
    s_axis_a_tdata => mul2,
    s_axis_b_tvalid => s_axis_b_tvalid,
    s_axis_b_tdata => q,
    m_axis_result_tvalid => m_axis_result_tvalid4,
    m_axis_result_tdata => func 
    );



f <= func;



end Behavioral;
 