library ieee;
use ieee.std_logic_1164.all;

entity Reg8b_0 is port(
	clk, rst, ld : in std_logic;
	ent : in std_logic_vector(7 downto 0);
	sor : out std_logic_vector(7 downto 0) );
end Reg8b_0;

architecture a of Reg8b_0 is
begin
	process(clk, rst) begin
		if clk'event and clk='1' then
			if rst = '1' then sor <= (others => '0');
			elsif ld = '1' then sor <= ent;
			end if;
		end if;
	end process;
end a;