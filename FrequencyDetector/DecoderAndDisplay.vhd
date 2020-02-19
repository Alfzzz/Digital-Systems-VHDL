	library ieee;
	use IEEE.std_logic_1164.All;
	use IEEE.std_logic_unsigned.All;
	USE ieee.numeric_std.ALL;

entity DecoderAndDisplay is
	Port(
		BCD: in std_logic_vector(3 downto 0);
		seg:out std_logic_vector(6 downto 0)
	);
	end entity DecoderAndDisplay;
	
	architecture BeH of DecoderAndDisplay is
		signal signal_seg: std_logic_vector(6 downto 0);
		
	begin
		--input_int4<=to_integer(unsigned(input));
		--Fourth digit BCD
		process(BCD)
		begin
			if BCD="1001"  then
				signal_seg(6 downto 0)<="0011000";
			elsif BCD="1000"  then
				signal_seg(6 downto 0)<="0000000";
			elsif BCD="0111"  then
				signal_seg(6 downto 0)<="1111000";
			elsif BCD="0110"  then
				signal_seg(6 downto 0)<="0000010";
			elsif BCD="0101"  then
				signal_seg(6 downto 0)<="0010010";
			elsif BCD="0100"  then
				signal_seg(6 downto 0)<="0011001";
			elsif BCD="0011"  then
				signal_seg(6 downto 0)<="0110000";
			elsif BCD="0010"  then
				signal_seg(6 downto 0)<="0100100";
			elsif BCD="0001"  then
				signal_seg(6 downto 0)<="1111001";
			else
				signal_seg(6 downto 0)<="1000000";
			end if;
		end process;
		seg(6 downto 0)<=signal_seg(6 downto 0);
	end BeH;	
	