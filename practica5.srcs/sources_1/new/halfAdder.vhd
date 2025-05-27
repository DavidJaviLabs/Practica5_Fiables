----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.05.2025 12:41:38
-- Design Name: 
-- Module Name: halfAdder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity halfAdder is
	port ( 	A		: in 	std_logic;
			B		: in    std_logic;
			S		: out   std_logic;
			C_out	: out	std_logic
	);
end halfAdder; 

architecture Behavioural of halfAdder is
begin
	S <= A xor B;
	C_out <= A and B;
end Behavioural;
