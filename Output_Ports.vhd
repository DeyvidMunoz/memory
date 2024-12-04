library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

-- Declaración de la entidad para los puertos de salida
entity output_ports is
    port (
        clock     : in std_logic;
        reset     : in std_logic;
		  writen    : in std_logic;
        address   : in std_logic_vector(7 downto 0);
        data_in   : in std_logic_vector(7 downto 0);
        -- Puertos de salida
        port_out_00 : out std_logic_vector(7 downto 0);
        port_out_01 : out std_logic_vector(7 downto 0)
        
    );
end output_ports;

-- Arquitectura que implementa los puertos de salida
architecture arch_output_ports of output_ports is
begin
    -- Proceso para el puerto de salida 00 (dirección x"E0")
    U3 : process (clock, reset)
    begin
        if (reset = '0') then
            port_out_00 <= x"00";
        elsif (clock'event and clock = '1') then
            if (address = x"E0" and writen = '1') then
                port_out_00 <= data_in;
            end if;
        end if;
    end process;

    -- Proceso para el puerto de salida 01 (dirección x"E1")
    U4 : process (clock, reset)
    begin
        if (reset = '0') then
            port_out_01 <= x"00";
        elsif (clock'event and clock = '1') then
            if (address = x"E1" and writen = '1') then
                port_out_01 <= data_in;
            end if;
        end if;
    end process;
end arch_output_ports;
