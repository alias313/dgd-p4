library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tot_bcd is
	port( clk, nrst : in std_logic;
		add : in std_logic;
		sync : out std_logic;
		res : out std_logic_vector(7 downto 0) ); -- Widened res to 8 bits
end tot_bcd;

architecture arq of tot_bcd is
	-- Signal declarations go here (architecture declarative part)
	signal time_cnt : integer range 0 to 13;
	signal add_cnt : integer range 0 to 13;
begin
	process (clk,nrst) 
		-- *** Variable declarations go here (process declarative part) ***
		variable units_int : integer;
		variable tens_int : integer;
		variable units_bcd : unsigned(3 downto 0);
		variable tens_bcd : unsigned(3 downto 0);
	begin -- *** Start of process sequential statements ***
		
		if nrst = '0' then 
			time_cnt <= 0;
			add_cnt <= 0;
			sync <= '0';     -- Initialize sync on reset
			res <= (others => '0'); -- Initialize all bits of res to '0' on reset
		elsif rising_edge(clk) then -- Use rising_edge for clarity
			
			-- This part happens every clock cycle based on the 'add' input
            -- Check if add_cnt is already at its maximum before incrementing
            if add = '1' and add_cnt < 13 then 
				add_cnt <= add_cnt + 1;
			end if;

			-- Now handle the time_cnt cycle logic and outputs
			if time_cnt = 13 then
				-- This is the end of the time cycle
				
				-- *** BCD Conversion and Assignment ***
				-- Calculate BCD digits from the accumulated add_cnt (integer)
				units_int := add_cnt mod 10; -- Units digit (0-9)
				tens_int  := add_cnt / 10;  -- Tens digit (0-1, since max is 13)
				
				-- Convert integer digits to 4-bit unsigned values
				units_bcd := to_unsigned(units_int, 4);
				tens_bcd  := to_unsigned(tens_int, 4);
				
				-- Concatenate the two 4-bit BCD values into the 8-bit res output
				res <= std_logic_vector(tens_bcd) & std_logic_vector(units_bcd);
				-- *** End BCD Conversion ***

				sync <= '1'; -- Signal the end of the cycle
				
				-- Reset counters for the next cycle
				time_cnt <= 1;   -- Reset time_cnt to 1 as per original logic
				add_cnt <= 0;    -- Reset add_cnt

			else
				-- This is during the counting phase (time_cnt is 0 to 12)
				time_cnt <= time_cnt + 1;
				sync <= '0'; -- Sync is low during counting
				res <= (others => '0'); -- Res is 0s during counting
			end if;
		end if;
	end process;
end arq;