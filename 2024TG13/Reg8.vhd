library ieee;
use ieee.std_logic_1164.all;

entity Reg8 is port(
	clk, rst, ld : in std_logic;
	ent : in std_logic_vector(7 downto 0);
	sor : out std_logic_vector(7 downto 0) );
end Reg8;

architecture arq of Reg8 is
begin
	process(clk, rst) begin
		if rst = '1' then sor <= (others => '0');
		elsif clk'event and clk = '1' then
			if ld='1' then
				sor <= ent;
			end if;
		end if;
	end process;
end arq;