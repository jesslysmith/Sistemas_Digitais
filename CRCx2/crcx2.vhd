library ieee;
use ieee.std_logic_1164.all;

entity crcx2 is
port(ser_in, clk : in std_logic;
	  reset : in std_logic;
	  crc_out : out std_logic_vector(1 downto 0));
end crcx2;

architecture crcx2 of crcx2 is

signal crc : std_logic_vector(1 downto 0) := "00";

begin

crc_out <= crc;

process(clk,reset)
begin

if(reset = '1') then
	crc <= "00";
elsif(clk'event and clk = '0') then
	crc(0) <= ser_in xor crc(1);
	crc(1) <= crc(0);
end if;

end process;

end crcx2;