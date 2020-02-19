	library ieee;
	use IEEE.std_logic_1164.All;
	use IEEE.std_logic_unsigned.All;
	USE ieee.numeric_std.ALL;

entity Fourteen2BCD is
	Port(
		input: in std_logic_vector(13 downto 0);
		seg3:out std_logic_vector(6 downto 0);
		seg2: out std_logic_vector(6 downto 0);
		seg1: out std_logic_vector(6 downto 0);
		seg0: out std_logic_vector(6 downto 0)
	);
	end entity Fourteen2BCD;
	
	architecture BeH of Fourteen2BCD is
		signal input_int4: integer;
		signal input_int3: integer;
		signal input_int2: integer;
		signal input_int1: integer;
		
	begin
		input_int4<=to_integer(unsigned(input));
		--Fourth digit BCD
		process(input_int4)
		begin
			if input_int4>8999  then
				seg3(6 downto 0)<="0011000";
				input_int3<=input_int4-9000;
			elsif input_int4>7999  then
				seg3(6 downto 0)<="0000000";
				input_int3<=input_int4-8000;
			elsif input_int4>6999  then
				seg3(6 downto 0)<="1111000";
				input_int3<=input_int4-7000;
			elsif input_int4>5999  then
				seg3(6 downto 0)<="0000010";
				input_int3<=input_int4-6000;
			elsif input_int4>4999  then
				seg3(6 downto 0)<="0010010";
				input_int3<=input_int4-5000;
			elsif input_int4>3999  then
				seg3(6 downto 0)<="0011001";
				input_int3<=input_int4-4000;
			elsif input_int4>2999  then
				seg3(6 downto 0)<="0110000";
				input_int3<=input_int4-3000;
			elsif input_int4>1999  then
				seg3(6 downto 0)<="0100100";
				input_int3<=input_int4-2000;
			elsif input_int4>999  then
				seg3(6 downto 0)<="1111001";
				input_int3<=input_int4-1000;
			else
				seg3(6 downto 0)<="1000000";
				input_int3<=input_int4;
			end if;
		end process;
		
		--Third digit BCD
		process(input_int3)
		begin
			if input_int3>899  then
				seg2(6 downto 0)<="0011000";
				input_int2<=input_int3-900;
			elsif input_int3>799  then
				seg2(6 downto 0)<="0000000";
				input_int2<=input_int3-800;
			elsif input_int3>699  then
				seg2(6 downto 0)<="1111000";
				input_int2<=input_int3-700;
			elsif input_int3>599  then
				seg2(6 downto 0)<="0000010";
				input_int2<=input_int3-600;
			elsif input_int3>499  then
				seg2(6 downto 0)<="0010010";
				input_int2<=input_int3-500;
			elsif input_int3>399  then
				seg2(6 downto 0)<="0011001";
				input_int2<=input_int3-400;
			elsif input_int3>299  then
				seg2(6 downto 0)<="0110000";
				input_int2<=input_int3-300;
			elsif input_int3>199  then
				seg2(6 downto 0)<="0100100";
				input_int2<=input_int3-200;
			elsif input_int3>99  then
				seg2(6 downto 0)<="1111001";
				input_int2<=input_int3-100;
			else
				seg2(6 downto 0)<="1000000";
				input_int2<=input_int3;
			end if;
		end process;
		
		--Second digit BCD
		process(input_int2)
		begin
			if input_int2>89  then
				seg1(6 downto 0)<="0011000";
				input_int1<=input_int2-90;
			elsif input_int2>79  then
				seg1(6 downto 0)<="0000000";
				input_int1<=input_int2-80;
			elsif input_int2>69  then
				seg1(6 downto 0)<="1111000";
				input_int1<=input_int2-70;
			elsif input_int2>59  then
				seg1(6 downto 0)<="0000010";
				input_int1<=input_int2-60;
			elsif input_int2>49  then
				seg1(6 downto 0)<="0010010";
				input_int1<=input_int2-50;
			elsif input_int2>39  then
				seg1(6 downto 0)<="0011001";
				input_int1<=input_int2-40;
			elsif input_int2>29  then
				seg1(6 downto 0)<="0110000";
				input_int1<=input_int2-30;
			elsif input_int2>19  then
				seg1(6 downto 0)<="0100100";
				input_int1<=input_int2-20;
			elsif input_int2>9  then
				seg1(6 downto 0)<="1111001";
				input_int1<=input_int2-10;
			else
				seg1(6 downto 0)<="1000000";
				input_int1<=input_int2;
			end if;
		end process;
		
		--First digit BCD
		process(input_int1)
		begin
			if input_int1>8  then
				seg0(6 downto 0)<="0011000";
			elsif input_int1>7  then
				seg0(6 downto 0)<="0000000";
			elsif input_int1>6  then
				seg0(6 downto 0)<="1111000";
			elsif input_int1>5  then
				seg0(6 downto 0)<="0000010";
			elsif input_int1>4  then
				seg0(6 downto 0)<="0010010";
			elsif input_int1>3  then
				seg0(6 downto 0)<="0011001";
			elsif input_int1>2  then
				seg0(6 downto 0)<="0110000";
			elsif input_int1>1  then
				seg0(6 downto 0)<="0100100";
			elsif input_int1>0  then
				seg0(6 downto 0)<="1111001";
			else
				seg0(6 downto 0)<="1000000";
			end if;
		end process;
		
	end BeH;	
	