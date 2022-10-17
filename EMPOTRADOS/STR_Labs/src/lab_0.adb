with STM32.Board;   use STM32.Board;
with Ada.Real_Time; use Ada.Real_Time;

procedure Lab_0 is
   Next : Time;
   Period : constant Time_Span := Milliseconds (50);
begin
   Initialize_LEDs;
   Next := Clock;
   loop
      Toggle_LEDs (All_LEDs);
      Next := Next + Period;
      delay until Next;
   end loop;
end Lab_0;
