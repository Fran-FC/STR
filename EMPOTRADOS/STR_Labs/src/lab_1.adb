with STM32.Board;   use STM32.Board;
with Ada.Real_Time; use Ada.Real_Time;

procedure Lab_1 is
   Next : Time;
   Period : constant Time_Span := Milliseconds (50);
   type Index is mod 4;
   PatternClockWise : array (Index) of User_LED := (Green_LED, Orange_LED, Red_LED, Blue_LED);
   Patte: array (Index) of User_LED := (Green_LED, Orange_LED, Red_LED, Blue_LED);
   I : Index := 0;
begin
   Initialize_LEDs;
   Next := Clock;
   loop 
      Toggle(Pattern(I));
      Next := Next + Period;
      delay until Next;
      I := I + 1;
   end loop;
end Lab_1;
