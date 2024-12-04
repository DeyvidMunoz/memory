library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

entity rw_96x8_sync is
	port(
	reset : in std_logic;
	address : in std_logic_vector(7 downto 0);
	clock, writen : in std_logic;
	port_out_00, port_out_01 : out std_logic_vector(7 downto 0);
	data_in : in std_logic_vector(7 downto 0);
	data_out: out std_logic_vector(7 downto 0));
end rw_96x8_sync;


architecture arch_rw_96x8_sync of rw_96x8_sync is
   type rw_type is array (128 to 223) of std_logic_vector(7 downto 0);
   signal RW : rw_type;
	signal EN: STD_logic;
begin    
   
   enable : process (address)
     begin
      if ( (to_integer(unsigned(address)) >= 128) and
       (to_integer(unsigned(address)) <= 223)) then
      EN <= '1';
     else
     EN <= '0';
     end if;
     end process;
	  
	  
memory : process (clock)
     begin
     if (clock'event and clock='1') then
     if (EN='1' and writen='1') then
     RW(to_integer(unsigned(address))) <= data_in;
     elsif (EN='1' and writen='0') then
     data_out <= RW(to_integer(unsigned(address)));
     end if;
     end if;
     end process;
	  
U3 : process (clock, reset)
begin
if (reset='0') then
port_out_00 <= x"00";
elsif (clock'event and clock='1') then
if (address = x"E0" and writen = '1')then
port_out_00 <= data_in;
end if;
end if;
end process;


--port_out_01 description ; ADRESS X"E1"

U4 : process (clock, reset)
begin
if (reset ='0') then
port_out_01 <=x"00";
elsif (clock'event and clock='1') then
if (address = x"E1" and writen = '1')then
port_out_01 <= data_in;
end if;
end if;
end process;

end arch_rw_96x8_sync;




