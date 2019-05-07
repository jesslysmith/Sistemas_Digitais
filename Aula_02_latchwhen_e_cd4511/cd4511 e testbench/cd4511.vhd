library ieee;
use ieee.std_logic_1164.all;

entity cd4511 is

port(abcd : in std_logic_vector(3 downto 0);
	  n_LE, n_BL, n_LT : in std_logic;
	  disp : out std_logic_vector(6 downto 0));

end cd4511;

architecture cd4511 of cd4511 is

signal latches : std_logic_vector(3 downto 0) := "0000";
signal decoder : std_logic_vector(6 downto 0);
signal driver : std_logic_vector(6 downto 0); 
signal mode : std_logic := '1'; -- 0 -> catodo comum 
										  -- 1 -> anodo comum

begin

latches <= abcd when n_LE = '0' else
			  latches;
			  
			 --abcdefg--
decoder <= "0000000" when n_BL = '0' else
			  "1111110" when latches = "0000" else
			  "0110000" when latches = "0001" else
			  "1101101" when latches = "0010" else
			  "1111001" when latches = "0011" else
			  "0110011" when latches = "0100" else
			  "1011011" when latches = "0101" else
			  "1011111" when latches = "0110" else
			  "1110000" when latches = "0111" else
			  "1111111" when latches = "1000" else
			  "1111011" when latches = "1001" else
			  "0000000";
			  
driver <=  "1111111" when n_LT = '0' else
			  decoder;
			  
laco : for i in 0 to 6 generate			 
	disp(i) <= driver(i) xor mode;
end generate;

end cd4511; 