library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity compt4 is port(
	clk, nrst, ce : in std_logic;
	q : out std_logic_vector(3 downto 0) );
end compt4;

architecture a of compt4 is
signal qq : std_logic_vector(3 downto 0);
begin
	process(clk, nrst)
	begin
		if nrst = '0' then qq <= x"0";
		elsif clk'event and clk = '1' and ce = '1' and qq < x"F" then
			qq <= qq + 1;
		end if;
	end process;
	q <= qq;
end a;