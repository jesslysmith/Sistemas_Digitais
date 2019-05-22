library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end testbench;

architecture test of testbench is

component crcx2 is
port(ser_in, clk : in std_logic;
	  reset : in std_logic;
	  crc_out : out std_logic_vector(1 downto 0));
end component;

signal ser_in : std_logic := '0'; 
signal clk : std_logic := '1';  
signal reset : std_logic := '0'; 
signal crc_out : std_logic_vector(1 downto 0) := "00";

signal data_in : std_logic_vector(7 downto 0) := "11010111";

begin

crc2: crcx2 port map (ser_in, clk, reset, crc_out);

process
begin

reset <= '1';
wait for 10 ns;
reset <= '0';
for  i in 7 downto 0 loop
	clk <= '1';
	ser_in <= data_in(i);
	wait for 20 ns;
	clk <= '0';
	wait for 20 ns;
end loop;
wait;
end process;

end test;