library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity final is

	port(
	     port_in_00, port_in_01, port_in_02, port_in_03, port_in_04, port_in_05, port_in_06, port_in_07, port_in_08, port_in_09, port_in_10,
		  port_in_11, port_in_12, port_in_13, port_in_14, port_in_15 : in std_logic_vector(7 downto 0);
	     address, data_in : in std_logic_vector (7 downto 0);  
		  clock, reset, writen : in std_logic;
		  port_out_00, port_out_01 : out std_logic_vector(7 downto 0);
		  HEX3, HEX2, HEX1, HEX0 : out std_logic_vector(6 downto 0)
		  );
end final;


architecture arch_final of final is

component memory
	port(
	address   : in std_logic_vector(7 downto 0);      
        data_in   : in std_logic_vector(7 downto 0);
	
	
        
        port_in_00 : in std_logic_vector(7 downto 0);
        port_in_01 : in std_logic_vector(7 downto 0);
        port_in_02 : in std_logic_vector(7 downto 0);
        port_in_03 : in std_logic_vector(7 downto 0);
        port_in_04 : in std_logic_vector(7 downto 0);
        port_in_05 : in std_logic_vector(7 downto 0);
        port_in_06 : in std_logic_vector(7 downto 0);
        port_in_07 : in std_logic_vector(7 downto 0);
        port_in_08 : in std_logic_vector(7 downto 0);
        port_in_09 : in std_logic_vector(7 downto 0);
        port_in_10 : in std_logic_vector(7 downto 0);
        port_in_11 : in std_logic_vector(7 downto 0);
        port_in_12 : in std_logic_vector(7 downto 0);
        port_in_13 : in std_logic_vector(7 downto 0);
        port_in_14 : in std_logic_vector(7 downto 0);
        port_in_15 : in std_logic_vector(7 downto 0);
		  clock     : in std_logic;
        reset     : in std_logic;
		  writen    : in std_logic;
        data_out, port_out_00, port_out_01  : out std_logic_vector(7 downto 0)
	);
	end component;
	
   component DECOBCD 
	port
	(A, B, C, D : in  std_logic;
	HEX0	: out std_logic_vector (6 downto 0)	);
   end component;
	

signal data_outs: std_logic_vector(7 downto 0);

begin 
UO: memory port map (address, data_in, port_in_00, port_in_01, port_in_02, port_in_03,
												  port_in_04, port_in_05, port_in_06, port_in_07,
										  		  port_in_08, port_in_09, port_in_10, port_in_11,
												  port_in_12, port_in_13, port_in_14, port_in_15, clock, reset, writen,
												  data_outs, port_out_00, port_out_01);
												  
U1 : DECOBCD PORT MAP (data_outs(7), data_outs(6), data_outs(5), data_outs(4), HEX0);
U2 : DECOBCD PORT MAP (data_outs(3), data_outs(2), data_outs(1), data_outs(0), HEX1);
U3 : DECOBCD PORT MAP (address(7), address(6), address(5), address(4), HEX2);
U4 : DECOBCD PORT MAP (address(3), address(2), address(1), address(0), HEX3);

end arch_final;

