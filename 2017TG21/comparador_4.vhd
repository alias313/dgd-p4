library ieee;
use ieee.std_logic_1164.all;

entity comparador_4 is
    port( a, b : in integer range 0 to 15;
          maj, igu, men : out std_logic );
end comparador_4;

architecture arq of comparador_4 is
begin
    maj <= '1' when (a > b) else '0';
    igu <= '1' when (a = b) else '0';
    men <= '1' when (a < b) else '0';
end arq;