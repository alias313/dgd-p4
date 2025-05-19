library ieee;
use ieee.std_logic_1164.all;

entity regdesp6 is port( 
	e : in std_logic_vector(5 downto 0);
	nrst, clk, ld, sh, es : in std_logic;
	q : out std_logic_vector (5 downto 0) );
end regdesp6;

architecture arq of regdesp6 is
signal qq :std_logic_vector (5 downto 0);
begin
	process(clk, nrst)
	begin
		if nrst='0' then qq <= (others => '0');
		elsif (clk'event and clk='1') then
			if ld = '1' then qq <= e;
			-- Desplaza a la izquierda (divide entre 2) y `es` decide si va a la primera mitad ('0') o a la segunda mitat ('1') del vector
			elsif sh = '1' then qq <= es & qq(5 downto 1);
			end if;
		end if;
	end process;
	q <= qq;
end arq;