library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity memory is
    port (
        clock     : in std_logic;
        reset     : in std_logic;
		  writen    : in std_logic;
        address   : in std_logic_vector(7 downto 0);      
        data_in   : in std_logic_vector(7 downto 0);
        port_in_00, port_in_01, port_in_02, port_in_03, port_in_04, port_in_05, port_in_06, port_in_07, port_in_08, port_in_09, port_in_10, port_in_11, port_in_12, port_in_13, port_in_14, port_in_15 : in std_logic_vector(7 downto 0);

        data_out, port_out_00, port_out_01  : out std_logic_vector(7 downto 0)
    );
end memory;

architecture arch_memory of memory is

    component rom_12x8_sync is
        port (
            clock      : in std_logic;
            address    : in std_logic_vector(7 downto 0);
            data_out   : out std_logic_vector(7 downto 0)
        );
    end component;

    component rw_96x8_sync is
        port (
            address    : in std_logic_vector(7 downto 0);
            clock      : in std_logic;
            writen     : in std_logic;
            data_in    : in std_logic_vector(7 downto 0);
            data_out   : out std_logic_vector(7 downto 0)
        );
    end component;
	 
	 component output_ports
	 port(
	 address, data_in : in std_logic_vector(7 downto 0);
	 writen, clock, reset : in std_logic;
	 port_out_00, port_out_01 : out std_logic_vector(7 downto 0)
							);
	end component;
	 
	 
	 component Input_Ports 
		port(
			address, rom_data_out, rw_data_out : in std_logic_vector(7 downto 0);
							port_in_00, port_in_01, port_in_02, port_in_03,
                     port_in_04, port_in_05, port_in_06, port_in_07,
                     port_in_08, port_in_09, port_in_10, port_in_11,
                     port_in_12, port_in_13, port_in_14, port_in_15 : in std_logic_vector(7 downto 0);
							
							data_out : out std_logic_vector(7 downto 0)

			);
			end component;
			
signal data_out_rom, data_out_rw : std_logic_vector(7 downto 0);

begin 
U0 : rom_12x8_sync port map (clock, address, data_out_rom);
U1 : rw_96x8_sync port map (address, writen, clock, data_in, data_out_rw);
U2 : output_ports port map (address, data_in, writen, clock, reset, port_out_00, port_out_01);
U3 : Input_Ports port map (address, data_out_rom, data_out_rw,   port_in_00, port_in_01, port_in_02, port_in_03,
															port_in_04, port_in_05, port_in_06, port_in_07,
															port_in_08, port_in_09, port_in_10, port_in_11,
															port_in_12, port_in_13, port_in_14, port_in_15, data_out);

							
 
end arch_memory;

