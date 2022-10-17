with STM32.Board;   use STM32.Board;
with STM32.User_Button; use STM32.User_Button;
with Ada.Real_Time; use Ada.Real_Time;

procedure lab_3 is
   Initial_Delay : constant Time_Span := Milliseconds(2500);
   
   Indication_Delay : constant Time_Span := Seconds(2);
   
   Threshold : constant Time_Span := Milliseconds(500);
   Trash : Boolean;
   Indication_Led : User_LED;
begin
   Initialize_LEDs;
   Initialize;
   
   loop
      delay until Clock + Initial_Delay;
      Trash := Has_Been_Pressed;
      Toggle_LEDs(All_LEDs);
      delay until Clock + Threshold;
      Toggle_LEDs(All_LEDs);
      if Has_Been_Pressed then
         Indication_Led := Green_LED;
      else
         Indication_Led := Red_LED;
      end if;
      
      Turn_On(Indication_Led);
      delay until Clock + Indication_Delay;
      Turn_Off(Indication_Led);
   end loop;
end lab_3;
