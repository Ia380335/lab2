library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CSUN_Parking_Pay_Station_tb is
end CSUN_Parking_Pay_Station_tb;

architecture Behavioral of CSUN_Parking_Pay_Station_tb is

    component CSUN_Parking_Pay_Station
    port (
        clock : in STD_LOGIC;
        reset : in STD_LOGIC;
        KEYPAD : in character;
        X : in character;
        Pay_amt : out INTEGER;
        Pay_sts : out BOOLEAN
    );
    end component;

    signal clock : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';
    signal KEYPAD : character;
    signal X : character;
    signal Pay_amt : INTEGER := 0;
    signal Pay_sts : BOOLEAN;

begin

    uut : CSUN_Parking_Pay_Station
    port map (
        clock => clock,
        reset => reset,
        KEYPAD => KEYPAD,
        X => X,
        Pay_amt => Pay_amt,
        Pay_sts => Pay_sts
    );

    clk_process : process
    begin
        clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
    end process;

    reset_process : process
    begin
        reset <= '1';
        wait for 20 ns;
        reset <= '0';
        wait;
    end process;

    stimulus_process : process
    begin
--        --- First Attempt 8->0->6->2->A->1->A->A
--        --- Licence Input = 8062
--        KEYPAD <= '8';
--        wait for 10 ns;
--        KEYPAD <= '0';
--        wait for 10 ns;
--        KEYPAD <= '6';
--        wait for 10 ns;
--        KEYPAD <= '2';
        
--        --- Proceed to Duration Selection
--        wait for 10 ns;
--        X <= 'A';
        
--        --- Option Selection
--        wait for 10 ns;
--        KEYPAD <= '1';
        
--        --- Proceed the Option Seclection
--        wait for 10 ns;
--        X <= 'A';
        
--        --- Accept the Payment
--        wait for 10 ns;
--        X <= 'A';               
        
        
--        --- Second Attempt 4->2->4->D->7->6->A->2->A->A
--        --- Licence Input = 4276
--        wait for 20ns;
--        KEYPAD <= '4';
--        wait for 10 ns;
--        KEYPAD <= '2';
--        wait for 10 ns;
--        KEYPAD <= '4';
--        wait for 10 ns;
--        X <= 'D';
--        wait for 10 ns;
--        KEYPAD <= '7';
--        wait for 10 ns;
--        KEYPAD <= '6';
        
--        --- Proceed to Duration Selection
--        wait for 10 ns;
--        X <= 'A';
             
--        --- Option Selection
--        wait for 10 ns;
--        KEYPAD <= '2';
        
--        --- Proceed the Option Seclection
--        wait for 10 ns;
--        X <= 'A';
        
--        --- Accept the Payment
--        wait for 10 ns;
--        X <= 'A';
        
--        --- Third Attempt 4->2->7->6->A->2->A->C
--        --- Licence Input = 4276
--        wait for 20ns;
--        KEYPAD <= '4';
--        wait for 10 ns;
--        KEYPAD <= '2';
--        wait for 10 ns;
--        KEYPAD <= '7';
--        wait for 10 ns;
--        KEYPAD <= '6';
        
--        --- Proceed to Duration Selection
--        wait for 10 ns;
--        X <= 'A';
             
--        --- Option Selection
--        wait for 10 ns;
--        KEYPAD <= '2';
        
--        --- Proceed the Option Seclection
--        wait for 10 ns;
--        X <= 'A';
        
--        --- Cancel the Payment
--        wait for 10 ns;
--        X <= 'C';
        
        --- Fourth Attempt 5->6->3->7->A->3->A->A
        --- Licence Input = 5637
        wait for 20ns;
        KEYPAD <= '5';
        wait for 10 ns;
        KEYPAD <= '6';
        wait for 10 ns;
        KEYPAD <= '3';
        wait for 10 ns;
        KEYPAD <= '7';
        
        --- Proceed to Duration Selection
        wait for 10 ns;
        X <= 'A';        
        
        --- Option Selection
        wait for 30 ns;
        KEYPAD <= '3';
                
        --- Proceed the option Selction
        wait for 10 ns;
        X <= 'A';
        
        --- Accept the Payment
        wait for 10 ns;
        X <= 'A';
        
        wait;
    end process;

--    X_process : process
--    begin
--        --- First Attempt 8->0->6->2->A->1->A->C
--        --- Proceed to Duration Selection
--        wait for 40 ns;
--        X <= 'A';
--        --- Total Time = 40ns
        
--        --- Proceed the Option Seclection
--        wait for 20 ns;
--        X <= 'A';
--        --- Total time = 60ns
        
--        --- Cancel the Payment
--        wait for 10 ns;
--        X <= 'C';
--        --- Total time = 70ns
        
--        --- Second Attempt 4->2->7->6->A->2->A->A
--        --- Proceed to Duration Selection
--        wait for 35 ns;
--        X <= 'A';
--        --- Total Time = 135ns
        
--        --- Proceed the Option Seclection
--        wait for 10 ns;
--        X <= 'A';
--        --- Total time = 145ns
        
--        --- Accept the Payment
--        wait for 10 ns;
--        X <= 'A';
--        --- Total time = 155ns
        
--        --- Third Attempt 5->6->3->7->A->4->A->5->A->A
--        --- Proceed to Duration Selection
--        wait for 35 ns;
--        X <= 'A';
--        --- Total time = 235ns
        
--        --- Proceed the Option Seclection
--        wait for 10 ns;
--        X <= 'A';
--        --- Total time = 245ns
        
--         --- Acess Day Selector Prompt
--        wait for 10 ns;
--        X <= 'A';
--        --- Total time = 245ns

         
--        --- Total time = 155ns
        
--        --- Total Time = 135ns
----        wait for 10 ns;
----        X <= 'A';
----        wait for 10 ns;
----        X <= 'A';
----        wait for 10 ns;
----        X <= 'A';
----        wait for 10 ns;
----        X <= 'A';
----        wait for 10 ns;
----        X <= 'A';
--        wait;
--    end process;
    
end;