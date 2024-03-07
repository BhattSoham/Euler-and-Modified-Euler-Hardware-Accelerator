----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/29/2023 02:49:41 PM
-- Design Name: 
-- Module Name: Mod_Euler_tb - Behavioral
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

entity Mod_Euler_tb is
--  Port ( );
end Mod_Euler_tb;

architecture Behavioral of Mod_Euler_tb is
component Mod_Euler is
  Port (
   x: in std_logic_vector(31 downto 0);
 y: in std_logic_Vector(31 downto 0);
 h : in std_logic_vector(31 downto 0);
 x_out: out std_logic_vector(31 downto 0);
 y_out: out std_logic_vector(31 downto 0)
  
   );
end component;

 signal x:  std_logic_vector(31 downto 0);
 signal y:  std_logic_Vector(31 downto 0);
 signal h :  std_logic_vector(31 downto 0);
 signal x_out:  std_logic_vector(31 downto 0);
 signal y_out:  std_logic_vector(31 downto 0);

begin
uut: Mod_Euler port map (
x => x,
y => y,
h => h,
x_out => x_out,
y_out => y_out
);

proc: process
begin
x <= x"40000000";
y <= x"3F800000";
h <= x"3DCCCCCD";
wait for 100 ns;
wait;
end process;


end Behavioral;
