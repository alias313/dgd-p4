library ieee;
use ieee.std_logic_1164.all;

entity Comp8 is port
	( a : in std_logic_vector(7 downto 0);
	  b : in std_logic_vector(7 downto 0);
	maj : out std_logic );
end Comp8;

architecture arq of Comp8 is
begin
	maj <= '1' when (a>b) else '0';
end arq;