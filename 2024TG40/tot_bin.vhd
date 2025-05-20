library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity tot_bin is
	port( clk, nrst : in std_logic;
		add : in std_logic;
		sync : out std_logic;
		res : out std_logic_vector(3 downto 0); 
		cycles : out std_logic_vector(3 downto 0) );
end tot_bin;

architecture arq of tot_bin is
	signal time_cnt : integer range 0 to 13;
begin
	process (clk,nrst) 
		variable add_cnt : integer range 0 to 13;
	begin
		if nrst='0' then 
			time_cnt <= 0;
			add_cnt := 0;
			sync <= '0';
			res <= x"0";
		elsif clk'event and clk='1' then
			if add = '1' then
				add_cnt := add_cnt+1;
			end if;
			
			time_cnt <= time_cnt+1;

			if time_cnt = 12 then 
				for i in 0 to 3 loop
					if ((add_cnt / (2**i)) mod 2) = 1 then
						res(i) <= '1';
					else
						res(i) <= '0';
					end if;
				end loop;
				sync <= '1';
				
				time_cnt <= 0;
				add_cnt := 0;
			else
				res <= x"0";
				sync <= '0';
			end if;
		end if;
	end process;
	cycles(0) <= '1' when (time_cnt mod 2) = 1 else '0';
	cycles(1) <= '1' when (time_cnt/2 mod 2) = 1 else '0';
	cycles(2) <= '1' when (time_cnt/4 mod 2) = 1 else '0';
	cycles(3) <= '1' when (time_cnt/8 mod 2) = 1 else '0';

end arq;