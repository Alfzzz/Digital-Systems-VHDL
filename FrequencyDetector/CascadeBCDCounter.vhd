	library ieee;
	use IEEE.std_logic_1164.All;
	use IEEE.std_logic_unsigned.All;
	USE ieee.numeric_std.ALL;

entity CascadeBCDCounter is
	Port(
		digitalPulses: in std_logic;
		BCD0: out std_logic_vector(3 downto 0);
		BCD1: out std_logic_vector(3 downto 0);
		BCD2: out std_logic_vector(3 downto 0);
		BCD3: out std_logic_vector(3 downto 0);
		clear: in std_logic;
		enable: in std_logic
	);
	end entity CascadeBCDCounter;
	
	architecture BeH of CascadeBCDCounter is
		signal input_int4: integer;
		signal input_int3: integer;
		signal input_int2: integer;
		signal input_int1: integer;
		signal counter: std_logic_vector(13 downto 0);

	begin
		process(digitalPulses,clear,enable,counter)
		begin
			if	clear='1' then
				counter<="00000000000000";
			elsif rising_edge(digitalPulses) and enable='1' then
			--if rising_edge(digitalPulses)then
				counter<=counter+1;
			else
				counter<=counter;
			end if;
			end process;
	
		input_int4<=to_integer(unsigned(counter));
		--Fourth digit BCD
		process(input_int4)
		begin
			if input_int4>8999  then
				BCD3(3 downto 0)<="1001";
				input_int3<=input_int4-9000;
			elsif input_int4>7999  then
				BCD3(3 downto 0)<="1000";
				input_int3<=input_int4-8000;
			elsif input_int4>6999  then
				BCD3(3 downto 0)<="0111";
				input_int3<=input_int4-7000;
			elsif input_int4>5999  then
				BCD3(3 downto 0)<="0110";
				input_int3<=input_int4-6000;
			elsif input_int4>4999  then
				BCD3(3 downto 0)<="0101";
				input_int3<=input_int4-5000;
			elsif input_int4>3999  then
				BCD3(3 downto 0)<="0100";
				input_int3<=input_int4-4000;
			elsif input_int4>2999  then
				BCD3(3 downto 0)<="0011";
				input_int3<=input_int4-3000;
			elsif input_int4>1999  then
				BCD3(3 downto 0)<="0010";
				input_int3<=input_int4-2000;
			elsif input_int4>999  then
				BCD3(3 downto 0)<="0001";
				input_int3<=input_int4-1000;
			else
				BCD3(3 downto 0)<="0000";
				input_int3<=input_int4;
			end if;
		end process;
		
		--Third digit BCD
		process(input_int3)
		begin
			if input_int3>899  then
				BCD2(3 downto 0)<="1001";
				input_int2<=input_int3-900;
			elsif input_int3>799  then
				BCD2(3 downto 0)<="1000";
				input_int2<=input_int3-800;
			elsif input_int3>699  then
				BCD2(3 downto 0)<="0111";
				input_int2<=input_int3-700;
			elsif input_int3>599  then
				BCD2(3 downto 0)<="0110";
				input_int2<=input_int3-600;
			elsif input_int3>499  then
				BCD2(3 downto 0)<="0101";
				input_int2<=input_int3-500;
			elsif input_int3>399  then
				BCD2(3 downto 0)<="0100";
				input_int2<=input_int3-400;
			elsif input_int3>299  then
				BCD2(3 downto 0)<="0011";
				input_int2<=input_int3-300;
			elsif input_int3>199  then
				BCD2(3 downto 0)<="0010";
				input_int2<=input_int3-200;
			elsif input_int3>99  then
				BCD2(3 downto 0)<="0001";
				input_int2<=input_int3-100;
			else
				BCD2(3 downto 0)<="0000";
				input_int2<=input_int3;
			end if;
		end process;
		
		--Second digit BCD
		process(input_int2)
		begin
			if input_int2>89  then
			BCD1(3 downto 0)<="1001";
				input_int1<=input_int2-90;
			elsif input_int2>79  then
				BCD1(3 downto 0)<="1000";
				input_int1<=input_int2-80;
			elsif input_int2>69  then
				BCD1(3 downto 0)<="0111";
				input_int1<=input_int2-70;
			elsif input_int2>59  then
				BCD1(3 downto 0)<="0110";
				input_int1<=input_int2-60;
			elsif input_int2>49  then
				BCD1(3 downto 0)<="0101";
				input_int1<=input_int2-50;
			elsif input_int2>39  then
				BCD1(3 downto 0)<="0100";
				input_int1<=input_int2-40;
			elsif input_int2>29  then
				BCD1(3 downto 0)<="0011";
				input_int1<=input_int2-30;
			elsif input_int2>19  then
			BCD1(3 downto 0)<="0010";
				input_int1<=input_int2-20;
			elsif input_int2>9  then
				BCD1(3 downto 0)<="0001";
				input_int1<=input_int2-10;
			else
				BCD1(3 downto 0)<="0000";
				input_int1<=input_int2;
			end if;
		end process;
		
		--First digit BCD
		process(input_int1)
		begin
			if input_int1>8  then
				BCD0(3 downto 0)<="1001";
			elsif input_int1>7  then
				BCD0(3 downto 0)<="1000";
			elsif input_int1>6  then
				BCD0(3 downto 0)<="0111";
			elsif input_int1>5  then
				BCD0(3 downto 0)<="0110";
			elsif input_int1>4  then
				BCD0(3 downto 0)<="0101";
			elsif input_int1>3  then
				BCD0(3 downto 0)<="0100";
			elsif input_int1>2  then
				BCD0(3 downto 0)<="0011";
			elsif input_int1>1  then
				BCD0(3 downto 0)<="0010";
			elsif input_int1>0  then
		     BCD0(3 downto 0)<="0001";
			else
				BCD0(3 downto 0)<="0000";
			end if;
		end process;
		
	end BeH;	
	