library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity tot_bin is
	port( clk, nrst : in std_logic;
		add : in std_logic;
		sync : out std_logic;
		res : out std_logic_vector(3 downto 0) );
end tot_bin;

architecture arq of tot_bin is
signal time_cnt : integer range 0 to 13;
signal add_cnt : integer range 0 to 13;
begin
	process (clk,nrst) begin
		if nrst='0' then 
			time_cnt <= 0;
			add_cnt <= 0;
			sync <= '0';
			res <= x"0";
		elsif clk'event and clk='1' then
			if add = '1' then
				add_cnt <= add_cnt+1;
			end if;

			if time_cnt = 13 then 
				res <= std_logic_vector(to_unsigned(add_cnt, res'length));
				sync <= '1';
				
				time_cnt <= 1;
				add_cnt <= 0;
			else 
				time_cnt <= time_cnt+1;
				sync <= '0';
				res <= x"0";
			end if;
		end if;
	end process;
end arq;