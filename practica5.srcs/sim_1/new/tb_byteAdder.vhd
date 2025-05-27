----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.05.2025 12:42:14
-- Design Name: 
-- Module Name: tb_byteAdder - Behavioral
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

entity tb_byteAdder is
end tb_byteAdder;

architecture Testbench of tb_byteAdder is
    -- Entradas
    signal A      : std_logic_vector(7 downto 0) := (others => '0');
    signal B      : std_logic_vector(7 downto 0) := (others => '0');
    -- Salidas
    signal S      : std_logic_vector(7 downto 0);
    signal C_out  : std_logic;
    -- Constante de retardo
    constant delay : time := 10 ns;
    component byteAdder is
        port(
            A     : in  std_logic_vector(7 downto 0);
            B     : in  std_logic_vector(7 downto 0);
            S     : out std_logic_vector(7 downto 0);
            C_out : out std_logic
        );
    end component;
begin
    -- Instanciación de la UUT
    UUT: byteAdder
        port map(
            A     => A,
            B     => B,
            S     => S,
            C_out => C_out
        );

    -- Proceso de estímulos
    stimulus: process
    begin
        -- Primer caso: 0 + 0
        A <= std_logic_vector(to_unsigned(0, A'length));
        B <= std_logic_vector(to_unsigned(0, B'length));
        wait for delay;
        assert (S = std_logic_vector(to_unsigned(0, S'length))) 
            report "Sum not 0 for A = 0 B = 0" severity error;
        assert (C_out = '0') 
            report "Carry Out not 0 for A = 0 B = 0" severity error;

        -- Segundo caso: 10 + 12
        A <= std_logic_vector(to_unsigned(10, A'length));
        B <= std_logic_vector(to_unsigned(12, B'length));
        wait for delay;
        assert (S = std_logic_vector(to_unsigned(22, S'length))) 
            report "Sum not 0 for A = 10 B = 12" severity error;
        assert (C_out = '0') 
            report "Carry Out not 0 for A = 10 B = 12" severity error;

        -- Tercer caso: 244 + 180
        A <= std_logic_vector(to_unsigned(244, A'length));
        B <= std_logic_vector(to_unsigned(180, B'length));
        wait for delay;
        assert (S = std_logic_vector(to_unsigned(168, S'length))) 
            report "Sum not 0 for A = 244 B = 180" severity error;
        assert (C_out = '1') 
            report "C_out not 1 for A = 244 B = 180" severity error;    

        -- Cuarto caso: 1 + 1
        A <= std_logic_vector(to_unsigned(1, A'length));
        B <= std_logic_vector(to_unsigned(1, B'length));
        wait for delay;
        assert (S = std_logic_vector(to_unsigned(2, S'length))) 
            report "Sum not 0 for A = 1 B = 1" severity error;
        assert (C_out = '0') 
            report "Carry Out not 0 for A = 1 B = 1" severity error;

        -- Quinto caso: 0 + 0 para acabar la simulación.
        A <= std_logic_vector(to_unsigned(0, A'length));
        B <= std_logic_vector(to_unsigned(0, B'length));
        wait for delay;
        assert (S = std_logic_vector(to_unsigned(0, S'length))) 
            report "Sum not 0 for A = 0 B = 0" severity failure;
        assert (C_out = '0') 
            report "Carry Out not 0 for A = 0 B = 0" severity error;
            
        assert false report "Fin de la simulación" severity failure;
    end process;
end Testbench;