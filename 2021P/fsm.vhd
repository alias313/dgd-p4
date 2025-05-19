library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity fsm is
	port ( clk, rst : in std_logic;
			s, i : in std_logic;
			ct, ld : out std_logic );
end fsm;

architecture a of fsm is
type estats is (s1, s2, s3);
signal s_fsm : estats;
begin
	process(clk, rst) begin
		if rst='1' then s_fsm <= s1;
		elsif clk'event and clk='1' then
			case s_fsm is
				when s1 => if i='1' then s_fsm <= s2; end if;
				when s2 => s_fsm <= s3;
				when s3 => if s='0' then s_fsm <= s1; end if;
			end case;
		end if;
	end process;
end a;