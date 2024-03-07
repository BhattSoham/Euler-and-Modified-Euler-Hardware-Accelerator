----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/28/2023 12:35:49 AM
-- Design Name: 
-- Module Name: Main_func - Behavioral
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

entity Main_func is
 Port (
 x: in std_logic_vector(31 downto 0);
 y: in std_logic_Vector(31 downto 0);
 h : in std_logic_vector(31 downto 0);
 --p : in std_logic_vector(31 downto 0);
 mainfcn: out std_logic_Vector(31 downto 0) 
 
  );
end Main_func;

architecture Behavioral of Main_func is
component func is
 Port ( 
 x: in std_logic_vector(31 downto 0);
 y: in std_logic_vector(31 downto 0);
 f: out std_logic_vector(31 downto 0)
 );
end component;

COMPONENT FPU_MUL
  PORT (
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

COMPONENT FPU_ADD
  PORT (
    s_axis_a_tvalid : IN STD_LOGIC;
    s_axis_a_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axis_b_tvalid : IN STD_LOGIC;
    s_axis_b_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_result_tvalid : OUT STD_LOGIC;
    m_axis_result_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) 
  );
END COMPONENT;

COMPONENT FPU_SUB
  PORT (
    s_axis_a_tvalid : IN STD_LOGIC;
    s_axis_a_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axis_b_tvalid : IN STD_LOGIC;
    s_axis_b_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_result_tvalid : OUT STD_LOGIC;
    m_axis_result_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) 
  );
END COMPONENT;

COMPONENT FPU_MUL_2
  PORT (
    s_axis_a_tvalid : IN STD_LOGIC;
    s_axis_a_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axis_b_tvalid : IN STD_LOGIC;
    s_axis_b_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_result_tvalid : OUT STD_LOGIC;
    m_axis_result_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) 
  );
END COMPONENT;

COMPONENT FPU_MUL_3
  PORT (
    s_axis_a_tvalid : IN STD_LOGIC;
    s_axis_a_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axis_b_tvalid : IN STD_LOGIC;
    s_axis_b_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_result_tvalid : OUT STD_LOGIC;
    m_axis_result_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) 
  );
END COMPONENT;

COMPONENT FPU_DIV
  PORT (
    s_axis_a_tvalid : IN STD_LOGIC;
    s_axis_a_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axis_b_tvalid : IN STD_LOGIC;
    s_axis_b_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_result_tvalid : OUT STD_LOGIC;
    m_axis_result_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) 
  );
END COMPONENT;

signal f: std_logic_vector(31 downto 0);
signal e: std_logic_vector(31 downto 0);
signal r: std_logic_vector(31 downto 0);
signal a: std_logic_vector(31 downto 0);
signal p: std_logic_vector(31 downto 0) := x"3F000000";
signal s_axis_a_tvalid: std_logic := '0';
signal s_axis_b_tvalid: std_logic := '0';
signal s_axis_c_tvalid: std_logic := '0';
signal m_axis_result_tvalid1: std_logic := '0';  
signal m_axis_result_tvalid2: std_logic := '0';  
signal m_axis_result_tvalid3: std_logic := '0';  

begin
uut1: func port map (
x => x,
y => y,
f => f
);

uut2: FPU_MUL port map (
s_axis_a_tvalid => s_axis_a_tvalid,
    s_axis_a_tdata => h,
    s_axis_b_tvalid => s_axis_b_tvalid,
    s_axis_b_tdata => p,
    m_axis_result_tvalid => m_axis_result_tvalid1,
    m_axis_result_tdata => e
  );
  
uut3: MAC port map (
 s_axis_a_tvalid => s_axis_a_tvalid,
    s_axis_a_tdata => f,
    s_axis_b_tvalid => s_axis_b_tvalid,
    s_axis_b_tdata => e,
    s_axis_c_tvalid => s_axis_c_tvalid,
    s_axis_c_tdata => y,
    m_axis_result_tvalid => m_axis_result_tvalid2,
    m_axis_result_tdata => r
);

uut4: FPU_ADD port map (
s_axis_a_tvalid => s_axis_a_tvalid,
    s_axis_a_tdata => x,
    s_axis_b_tvalid => s_axis_b_tvalid,
    s_axis_b_tdata => e,
    m_axis_result_tvalid => m_axis_result_tvalid3,
    m_axis_result_tdata => a
  );

uut5: func port map (
x => a,
y => r,
f => mainfcn

);

end Behavioral;
