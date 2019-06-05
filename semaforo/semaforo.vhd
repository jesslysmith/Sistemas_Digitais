library ieee;
use ieee.std_logic_1164.all;

entity semaforo is
generic(max: integer := 12);
port(red_ticks: in integer range 0 to max;
	  green_ticks: in integer range 0 to max;
	  yellow_ticks: in integer range 0 to max;
	  reset: in std_logic;
	  clk: in std_logic;
	  red_leds: out std_logic;
	  green_leds: out std_logic;
	  yellow_leds: out std_logic);
end semaforo;

architecture farol of semaforo is
type state is (amarelo, verde, vermelho);
signal currente_state: state := amarelo; 
begin

process(clk, reset) -- Para definir as transiçoes
variable tick_count: integer range 0 to max := 0;
begin

	if(reset = '1') then
		tick_count := 0;
		currente_state <= amarelo;
	elsif(clk'event and clk = '0') then
		tick_count := tick_count + 1;
		if(currente_state = amarelo and tick_count = yellow_ticks) then
		currente_state <= vermelho;
		tick_count := 0;
		elsif(currente_state = vermelho and tick_count = red_ticks) then
		currente_state <= verde;
		tick_count := 0;
		elsif(currente_state = verde and tick_count = green_ticks) then
		currente_state <= amarelo;
		tick_count := 0;
		end if;
	end if;

end process;

process(currente_state) -- Para definir cada estado
begin

if(currente_state = amarelo) then
	yellow_leds <= '1';
	red_leds <= '0';
	green_leds <= '0';
elsif(currente_state = vermelho) then
	   yellow_leds <= '0';
	   red_leds <= '1';
	   green_leds <= '0';
elsif(currente_state = verde) then
	   yellow_leds <= '0';
	   red_leds <= '0';
	   green_leds <= '1';
end if;
	
end process;


end farol;