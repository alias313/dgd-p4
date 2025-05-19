library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity sum8 is port(a, b : in std_logic_vector(7 downto 0);
                    ci : in std_logic;
                    s : out std_logic_vector(7 downto 0);
                    co : out std_logic);
end sum8;

architecture arq of sum8 is
signal suma : std_logic_vector(8 downto 0);
begin
    suma <= '0' & a + b + ci;
    s <= suma(7 downto 0);
    co <= suma(8);
end arq;