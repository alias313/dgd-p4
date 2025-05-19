library ieee;
use ieee.std_logic_1164.all;

entity fsm_desp6 is port(
	clk, nrst : in std_logic;
	ld, sh : out std_logic );
end fsm_desp6;

architecture arq of fsm_desp6 is
type estats is (sa, s0, s1, s2, s3, s4, s5);
signal fsm : estats;
begin
	process(clk, nrst)
	begin
		if nrst = '0' then fsm <= sa;
		elsif clk'event and clk = '1' then
			case fsm is
				when sa => fsm <= s0;
				when s0 => fsm <= s1;
				when s1 => fsm <= s2;
				when s2 => fsm <= s3;
				when s3 => fsm <= s4;
				when s4 => fsm <= s5;
				when s5 => fsm <= sa;
			end case;
		end if;
	end process;
	ld <= '1' when fsm = sa else '0';
	sh <= '0' when fsm = sa else '1';
end arq;
	