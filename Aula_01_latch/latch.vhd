library ieee;
use ieee.std_logic_1164.all;

entity latche is
port(r, s: in std_logic;
	  q, qb: buffer std_logic);
end latche;

architecture combinacional of latche is
begin

q <= (not s) nand qb;
qb <= (not r) nand q;

end combinacional;
	 