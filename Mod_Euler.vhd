----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/29/2023 02:28:34 PM
-- Design Name: 
-- Module Name: Mod_Euler - Behavioral
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

entity Mod_Euler is
  Port (
   x: in std_logic_vector(31 downto 0);
 y: in std_logic_Vector(31 downto 0);
 h : in std_logic_vector(31 downto 0);
 x_out: out std_logic_vector(31 downto 0);
 y_out: out std_logic_vector(31 downto 0)
  
   );
end Mod_Euler;

architecture Behavioral of Mod_Euler is
component Main_func is
 Port (
 x: in std_logic_vector(31 downto 0);
 y: in std_logic_Vector(31 downto 0);
 h : in std_logic_vector(31 downto 0);
-- p : in std_logic_vector(31 downto 0);
 mainfcn: out std_logic_Vector(31 downto 0) 
 );
end component;

COMPONENT MAC_2
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

COMPONENT FPU_ADD_2
  PORT (
    s_axis_a_tvalid : IN STD_LOGIC;
    s_axis_a_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axis_b_tvalid : IN STD_LOGIC;
    s_axis_b_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_result_tvalid : OUT STD_LOGIC;
    m_axis_result_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) 
  );
END COMPONENT;

--signal p: std_logic_Vector(31 downto 0) := x"3F000000";
signal fcn: std_logic_Vector(31 downto 0);
signal x_output: std_logic_Vector(31 downto 0);
signal y_output: std_logic_Vector(31 downto 0);
signal s_axis_a_tvalid: std_logic := '0';
signal s_axis_b_tvalid: std_logic := '0';
signal s_axis_c_tvalid: std_logic := '0';
signal m_axis_result_tvalid1: std_logic := '0';  
signal m_axis_result_tvalid2: std_logic := '0';  

begin
uut10: Main_func port map (
x => x,
y => y,
h => h,
mainfcn => fcn

);

uut11: MAC_2 port map (
 s_axis_a_tvalid => s_axis_a_tvalid,
    s_axis_a_tdata => fcn,
    s_axis_b_tvalid => s_axis_b_tvalid,
    s_axis_b_tdata => h,
    s_axis_c_tvalid => s_axis_c_tvalid,
    s_axis_c_tdata => y,
    m_axis_result_tvalid => m_axis_result_tvalid1,
    m_axis_result_tdata => y_output
);

uut4: FPU_ADD_2 port map (
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
