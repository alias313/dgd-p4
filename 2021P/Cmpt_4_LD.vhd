library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Cmpt_4_LD is
	port ( rst, clk, ld, ce : in std_logic;
			d : in std_logic_vector(3 downto 0);
			q : out std_logic_vector(3 downto 0) );
end Cmpt_4_LD;

architecture a of Cmpt_4_LD is
signal qq : std_logic_vector(3 downto 0);
begin
	process(clk, rst) begin
		if rst='1' then qq <= x"0";
		elsif clk'event and clk='1' then
			if ld='1' then qq <= d;
			elsif (ce='1') then qq <= qq+1;
			end if;
		end if;
	end process;
	q <= qq;
end a;