library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity t_cnt is
	port( clk, nrst : in std_logic;
		ara : out std_logic;
		res : out std_logic_vector(3 downto 0) );
end t_cnt;

architecture arq of t_cnt is
signal time_cnt : integer range 0 to 10;
begin
	process (clk,nrst) begin
		if nrst='0' then time_cnt <= 0;
		elsif clk'event and clk='1' then
			if time_cnt = 11 then time_cnt <= 1;
			else time_cnt <= time_cnt+1;
			end if;
		end if;
	end process;
	ara <= '1' when time_cnt = 11 else '0';
	res(0) <= '1' when (time_cnt mod 2) = 1 else '0';
	res(1) <= '1' when ((time_cnt/2) mod 2) = 1 else '0';
	res(2) <= '1' when ((time_cnt/4) mod 2) = 1 else '0';
	res(3) <= '1' when ((time_cnt/8) mod 2) = 1 else '0';
end arq;