----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/30/2023 06:54:52 PM
-- Design Name: 
-- Module Name: func_tb - Behavioral
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

entity func_tb is
--  Port ( );
end func_tb;

architecture Behavioral of func_tb is
component func is
 Port ( 
 clock: in std_logic;
 x: in std_logic_vector(31 downto 0);
 y: in std_logic_vector(31 downto 0);
 f: out std_logic_vector(31 downto 0)
 );
end component;

signal clock: std_logic;
 signal x:  std_logic_vector(31 downto 0);
 signal y:  std_logic_vector(31 downto 0);
 signal f:  std_logic_vector(31 downto 0);

constant clock_period : time := 10 ns;

begin
uut: func port map (
clock => clock,
x => x,
y => y,
f => f
);



clk: process
begin

clock <= '0';
wait for clock_period/2;
  clock <= '1';
wait for clock_period/2;
   end process;

proc: process 
begin
x <= x"40000000";
y <= x"3F800000";
wait for clock_period;
end process;


end Behavioral;
