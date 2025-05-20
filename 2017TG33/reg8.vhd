library ieee;
use ieee.std_logic_1164.all;

entity reg8 is port(
	clk, ld : in std_logic;
	d : in std_logic_vector(7 downto 0);
	q : out std_logic_vector(7 downto 0) );
end reg8;

architecture a of reg8 is
signal qq : std_logic_vector(7 downto 0) := x"00";
begin
	process(clk)
	begin
		if clk'event and clk = '1' and ld = '1' then
			qq <= d;
		end if;
	end process;
	q <= qq;
end a;