library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CSUN_Parking_Pay_Station is
    Port ( 
           clock: in std_logic; --- clock signal
           reset: in std_logic; ---reset input
           KEYPAD: in  character; ---KEYPAD input (0-9) Numbers
           X: in character; --- Button A(Acknowledgement), Button D(Delete), Button C(Cancel) 
           Pay_amt: out integer; ---Full Payment Amount
           Pay_sts: out Boolean ---Payment Status
           );
end CSUN_Parking_Pay_Station;

architecture Behavioral of CSUN_Parking_Pay_Station is
    type states is (Welcome, 
                    License_Input,
                    S00,
                    S01,
                    S02,
                    S03,
                    Duration_Selection,
                    S10,
                    S11,
                    S12,
                    S13,
                    S1311,
                    S1312,
                    S132,
                    Time_Days_Input, 
                    Payment_Info
                    );
    signal current_state, next_state: states;
    signal license_number: Integer;
    signal selected_option: Integer;
    signal num_days: Integer;
  ---  Pay_amt <= 0;
   --- signal pay_amount: Integer;
   --- signal Payment_status: boolean;

begin
    --- Sequentail memory of the CSUN_Parking_pay_Station
    process (clock, reset)
    begin
        if (reset = '1') then
            current_state <= Welcome;
        elsif (rising_edge(clock)) then
            current_state <= next_state;
        end if;
    end process;

    --- Combinational Logic
    process (KEYPAD, X, current_state)
    begin
        case (current_state) is
            when Welcome =>
                Pay_amt <= 0;
                Pay_sts <= false;
                next_state <= License_Input;
                
            when License_Input =>
                if (KEYPAD = '0' or KEYPAD = '1' or KEYPAD = '2' or KEYPAD = '3' or KEYPAD = '4' or KEYPAD = '5' or KEYPAD = '6' or KEYPAD = '7' or KEYPAD = '8' or KEYPAD = '9') then
                    next_state <= S00;
                else
                    next_state <= License_Input;
                end if;
                
             When S00 =>
                if (KEYPAD = '0' or KEYPAD = '1' or KEYPAD = '2' or KEYPAD = '3' or KEYPAD = '4' or KEYPAD = '5' or KEYPAD = '6' or KEYPAD = '7' or KEYPAD = '8' or KEYPAD = '9') then
                    next_state <= S01;
                elsif (X = 'D') then
                    next_state <= License_Input;
                elsif (X = 'A') then
                    next_state <= Duration_Selection;                
                elsif (X = 'C') then
                    next_state <= Welcome;
                else
                    next_state <= S00;
                end if;
                
                When S01 =>
                    if (KEYPAD = '0' or KEYPAD = '1' or KEYPAD = '2' or KEYPAD = '3' or KEYPAD = '4' or KEYPAD = '5' or KEYPAD = '6' or KEYPAD = '7' or KEYPAD = '8' or KEYPAD = '9') then
                        next_state <= S02;
                    elsif (X = 'D') then
                        next_state <= S00;
                    elsif (X = 'A') then
                        next_state <= Duration_Selection;                
                    elsif (X = 'C') then
                        next_state <= Welcome;
                    else
                        next_state <= S02;
                    end if;
                    
                When S02 =>
                    if (KEYPAD = '0' or KEYPAD = '1' or KEYPAD = '2' or KEYPAD = '3' or KEYPAD = '4' or KEYPAD = '5' or KEYPAD = '6' or KEYPAD = '7' or KEYPAD = '8' or KEYPAD = '9') then
                        next_state <= S03;
                    elsif (X = 'D') then
                        next_state <= S01;
                    elsif (X = 'A') then
                        next_state <= Duration_Selection;                
                    elsif (X = 'C') then
                        next_state <= Welcome;
                    else
                        next_state <= S02;
                    end if;
                    
                 When S03 =>
                    if (X = 'D') then
                        next_state <= S00;
                    elsif (X = 'A') then
                        next_state <= Duration_Selection;                
                    elsif (X = 'C') then
                        next_state <= Welcome;
                    else
                        next_state <= S03;
                    end if;
                    
                When Duration_Selection =>
                    if (KEYPAD = '1') then
                        next_state <= S10;
                    elsif (KEYPAD = '2') then
                        next_state <= S11;
                    elsif (KEYPAD = '3') then
                        next_state <= S12;
                    elsif (KEYPAD = '4') then
                        next_state <= S13;
                    elsif (X = 'A') then
                        next_state <= Duration_Selection;                
                    elsif (X = 'C') then
                        next_state <= Welcome;
                    else
                        next_state <= Duration_Selection;
                    end if;
                             
              When S10 =>
                    if (X = 'D') then
                        selected_option <= 0;
                        next_state <= Duration_Selection;
                    elsif (X = 'A') then
                        selected_option <= 1;
                        Pay_amt <= 5;
                        next_state <= Payment_Info;                
                    elsif (X = 'C') then
                        next_state <= Welcome;
                    else
                        next_state <= S10;
                    end if;
                    
               When S11 =>
                    if (X = 'D') then
                        selected_option <= 0;
                        next_state <= Duration_Selection;
                    elsif (X = 'A') then
                        selected_option <= 2;
                        Pay_amt <= 6;
                        next_state <= Payment_Info;                
                    elsif (X = 'C') then
                        next_state <= Welcome;
                    else
                        next_state <= S11;
                    end if;
               
               When S12 =>
                    if (X = 'D') then
                        selected_option <= 0;
                        next_state <= Duration_Selection;
                    elsif (X = 'A') then
                        selected_option <= 3;
                        Pay_amt <= 7;
                        next_state <= Payment_Info;                
                    elsif (X = 'C') then
                        next_state <= Welcome;
                    else
                        next_state <= S12;
                    end if;
                    
                When S13 =>
                    if (X = 'D') then
                        selected_option <= 0;
                        next_state <= Duration_Selection;
                    elsif (X = 'A') then
                        selected_option <= 4;
                        next_state <= S1311;                
                    elsif (X = 'C') then
                        next_state <= Welcome;
                    else
                        next_state <= S13;
                    end if;
                    
                When S1311 =>
                    if (KEYPAD = '1') then
                        next_state <= S1312;
                    elsif (KEYPAD = '2') then
                        num_days <= 2;
                        next_state <= S132;
                    elsif (KEYPAD = '3') then
                        num_days <= 3;
                        next_state <= S132;
                    elsif (KEYPAD = '4') then
                        num_days <= 4;
                        next_state <= S132;
                    elsif (KEYPAD = '5') then
                        num_days <= 5;
                        next_state <= S132;
                    elsif (KEYPAD = '6') then
                        num_days <= 6;
                        next_state <= S132;
                    elsif (KEYPAD = '7') then
                        num_days <= 7;
                        next_state <= S132;
                    elsif (KEYPAD = '8') then
                        num_days <= 8;
                        next_state <= S132;
                    elsif (KEYPAD = '9') then
                        num_days <= 9;
                        next_state <= S132;
                    elsif (X = 'A') then
                        next_state <= S1311;                
                    elsif (X = 'C') then
                        next_state <= Welcome;
                    else
                        next_state <= S1311;
                    end if;
                    
                 When S1312 =>
                    if (KEYPAD = '0') then
                        num_days <= 10;
                        next_state <= S132;                
                    elsif (X = 'C') then
                        next_state <= Welcome;
                    elsif (X = 'D') then
                        next_state <= S1311;
                    else
                        next_state <= S1312;
                    end if;
                    
                 When S132 =>
                    if (X = 'A') then
                        Pay_amt <= num_days*10;
                        next_state <= Payment_Info;                
                    elsif (X = 'C') then
                        next_state <= Welcome;
                    elsif (X = 'D') then
                        next_state <= S1311;
                    else
                        next_state <= S132;
                    end if;
                    
                 When Payment_Info =>
                    if (X = 'A') then
                        Pay_sts <= true;
                        next_state <= Welcome;                   
                    elsif (X = 'C') then
                        Pay_sts <= false; 
                        next_state <= Welcome;
                    else
                        next_state <= Payment_Info;
                    end if;
                    
                 when others =>
                    next_state <= Welcome;
        
        end case;   
    end process;
   
end Behavioral;