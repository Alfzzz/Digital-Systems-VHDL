	library ieee;
	use IEEE.std_logic_1164.All;
	use IEEE.std_logic_unsigned.All;
	USE ieee.numeric_std.ALL;

entity DisplayRegister is
	Port(
		store: in std_logic;
		BCD0_in: in std_logic_vector(3 downto 0);
		BCD1_in: in std_logic_vector(3 downto 0);
		BCD2_in: in std_logic_vector(3 downto 0);
		BCD3_in: in std_logic_vector(3 downto 0);
		BCD0_out: out std_logic_vector(3 downto 0);
		BCD1_out: out std_logic_vector(3 downto 0);
		BCD2_out: out std_logic_vector(3 downto 0);
		BCD3_out: out std_logic_vector(3 downto 0)
		
	);
	end entity DisplayRegister;
	architecture BeH of DisplayRegister is
	signal BCD0:std_logic_vector(3 downto 0);
	signal BCD1:std_logic_vector(3 downto 0);
	signal BCD2:std_logic_vector(3 downto 0);
	signal BCD3:std_logic_vector(3 downto 0);
	signal B1:std_logic_vector(3 downto 0);
	signal B2:std_logic_vector(3 downto 0);
	signal B0:std_logic_vector(3 downto 0);
	signal B3:std_logic_vector(3 downto 0);
	
	begin
	B0<=BCD0_in;
	B1<=BCD1_in;
	B2<=BCD2_in;
	B3<=BCD3_in;
	
	process(store,BCD0,BCD1,BCD2,BCD3,B1,B2,B3,B0)
	begin
		if rising_edge(store) then
			BCD0<=B0;
			BCD1<=B1;
			BCD2<=B2;
			BCD3<=B3;
		else
			--BCD0<="0000";
			--BCD1<="0000";
			--BCD2<="0000";
			--BCD3<="0000";
			BCD0<=BCD0;
			BCD1<=BCD1;
			BCD2<=BCD2;
			BCD3<=BCD3;
		end if;
		end process;
		
			BCD0_out<=BCD0;
			BCD1_out<=BCD1;
			BCD2_out<=BCD2;
			BCD3_out<=BCD3;	
	end BeH;	