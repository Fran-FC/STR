with STM32.Board;   use STM32.Board;
with STM32.User_Button; use STM32.User_Button;
with Ada.Real_Time; use Ada.Real_Time;

procedure lab_2 is

   Next : Time;
   Period : constant Time_Span := Milliseconds (500);
   type Index is mod 4;
   Pattern : array (Index) of User_LED := (Green_LED, Orange_LED, Red_LED, Blue_LED);
   ClockWise : Boolean := True;
   I : Index := 0;
begin
   Initialize_LEDs;
   Initialize;
   Next := Clock;
   loop 
      Turn_On(Pattern(I));
      Next := Next + Period;
      delay until Next;
      Turn_Off(Pattern(I));
      if Has_Been_Pressed then
         ClockWise := not ClockWise;
         if Has_Been_Pressed then null; end if;
      end if;
      if ClockWise then 
         I := I + 1;
      else
         I := I - 1;
      end if;
   end loop;
end lab_2;
