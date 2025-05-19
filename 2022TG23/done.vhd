library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity done is port(
	k : in std_logic_vector(5 downto 0);
	ca2k : in std_logic_vector(5 downto 0);
	done : out std_logic );
end done;

architecture a of done is
begin
	done <= '1' when (not k + 1) = ca2k else '0';
end a;