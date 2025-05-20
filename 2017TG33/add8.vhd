library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity add8 is port(
	a, b : in std_logic_vector(7 downto 0);
	s : out std_logic_vector(7 downto 0) );
end add8;

architecture a of add8 is
begin
	s <= a + b;
end a;