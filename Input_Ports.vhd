library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity Input_Ports is
    port (
        address    : in  std_logic_vector(7 downto 0);
		  rom_data_out   : in std_logic_vector(7 downto 0);
        rw_data_out    : in  std_logic_vector(7 downto 0);
        port_in_00, port_in_01, port_in_02, port_in_03,
        port_in_04, port_in_05, port_in_06, port_in_07,
        port_in_08, port_in_09, port_in_10, port_in_11,
        port_in_12, port_in_13, port_in_14, port_in_15 : std_logic_vector(7 downto 0);

      
     	  data_out   : out std_logic_vector(7 downto 0)
    );
end Input_Ports;


architecture arch_Input_Ports of Input_Ports is
  
begin

    MUX1: process (address, rom_data_out, rw_data_out,
                    port_in_00, port_in_01, port_in_02, port_in_03,
                    port_in_04, port_in_05, port_in_06, port_in_07,
                    port_in_08, port_in_09, port_in_10, port_in_11,
                    port_in_12, port_in_13, port_in_14, port_in_15)
    begin
        
        if (to_integer(unsigned(address)) >= 0 and 
		  to_integer(unsigned(address)) <= 127) then
                data_out <= rom_data_out;
            
        -- Si la dirección está en el rango de 128 a 223 (x"80" a x"DF"), selecciona la salida de la memoria de datos
        elsif (to_integer(unsigned(address)) >= 128 and 
					to_integer(unsigned(address)) <= 223) then
                data_out <= rw_data_out;
 
        -- Si la dirección está en el rango de 240 a 255 (x"F0" a x"FF"), selecciona el puerto de entrada correspondiente
        elsif (address = x"F0") then
            data_out <= port_in_00;
        elsif (address = x"F1") then
            data_out <= port_in_01;
        elsif (address = x"F2") then
            data_out <= port_in_02;
        elsif (address = x"F3") then
            data_out <= port_in_03;
        elsif (address = x"F4") then
            data_out <= port_in_04;
        elsif (address = x"F5") then
            data_out <= port_in_05;
        elsif (address = x"F6") then
            data_out <= port_in_06;
        elsif (address = x"F7") then
            data_out <= port_in_07;
        elsif (address = x"F8") then
            data_out <= port_in_08;
        elsif (address = x"F9") then
            data_out <= port_in_09;
        elsif (address = x"FA") then
            data_out <= port_in_10;
        elsif (address = x"FB") then
            data_out <= port_in_11;
        elsif (address = x"FC") then
            data_out <= port_in_12;
        elsif (address = x"FD") then
            data_out <= port_in_13;
        elsif (address = x"FE") then
            data_out <= port_in_14;
        elsif (address = x"FF") then
            data_out <= port_in_15;
        else
            data_out <= x"00";
        end if;
    end process;

end arch_Input_Ports;
