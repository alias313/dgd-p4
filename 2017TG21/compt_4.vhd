library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity compt_4 is port(
	clk, rst, ena, up : in std_logic;
	tc : out std_logic;
	q : out std_logic_vector(3 downto 0) );
end compt_4;

architecture a of compt_4 is
signal qq : std_logic_vector(3 downto 0) := x"0";
begin
	process(clk, rst)
	begin
		if rst = '1' then qq <= x"0"; tc <= '0';
		elsif clk'event and clk = '1' then
			if ena = '1' then
				if up = '1' then
					if qq = x"F" then
						qq <= x"0";
					else
						if qq = x"E" then
							tc <= '1';
						end if;
						qq <= qq+1;
					end if;
				else
					if qq = x"0" then
						qq <= x"F";
					else
						if qq = x"1" then
							tc <= '1';
						end if;
						qq <= qq-1;
					end if;
				end if;
			end if;
		end if;
	end process;
	q <= qq;
end a;