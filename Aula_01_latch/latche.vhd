library ieee;
use ieee.std_logic_1164.all;

entity latche is
port(r, s: in std_logic;
	  q, qb: out std_logic);
end latche;

architecture combinacional of latche is
signal state: std_logic;
begin

q <= state;
qb <= not state;

process(r,s)
begin
	if(r = '1') then
		state <= '0';
	elsif(s = '1') then
		state <= '1';
	end if;
end process;

end combinacional;
	 