library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity mitj is port(
	a, b : in std_logic_vector(7 downto 0);
	mitj : out std_logic_vector(7 downto 0) );
end mitj;

architecture a of mitj is
signal sum : std_logic_vector(7 downto 0);
begin
	sum <= a + b;
	mitj <= '0' & sum(7 downto 1);
end a;