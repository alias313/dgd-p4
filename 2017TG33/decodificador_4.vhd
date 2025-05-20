library ieee;
use ieee.std_logic_1164.all;

entity decodificador_4 is
    port( x : in std_logic_vector(1 downto 0);
          e : in std_logic;
          y : out std_logic_vector (3 downto 0));
end decodificador_4;

architecture arq of decodificador_4 is
begin
    y(0) <= '1' when (e='1' and x(1)='0' and x(0)='0') else '0';
    y(1) <= '1' when (e='1' and x(1)='0' and x(0)='1') else '0';
    y(2) <= '1' when (e='1' and x(1)='1' and x(0)='0') else '0';
    y(3) <= '1' when (e='1' and x(1)='1' and x(0)='1') else '0';
end arq;