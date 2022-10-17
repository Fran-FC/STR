with Ada.Calendar;  use Ada.Calendar;
with Ada.Real_Time; use Ada.Real_Time;
with Ada.Text_IO;   use Ada.Text_IO;

procedure Periodic_task is

   I : Integer := 0;

   task type Timer;
   task body Timer is
      T_Cal       : Ada.Calendar.Time;
      Yr, Mh, Dy  : Integer;
      Ss          : Duration;
      Hr, Mn, Sd  : Integer;
      Next : Ada.Real_Time.Time := Clock;
      Period      : Time_Span := Seconds(1);
   begin
      loop
         T_Cal := Ada.Calendar.Clock;    --  Read Calendar clock
         Split (T_Cal, Yr, Mh, Dy, Ss);
         Hr := Integer(Ss)/3600;
         Mn := (Integer(Ss) mod 3600) / 60;
         Sd := Integer(Ss) mod 60;
         Ss := Ss - 3600.0*Hr - 60.0*Mn;
         -- Print "dd/mm/yyyy hh:mm:ss (ss.sssssssss)  Loop: s.sssssssss"
         Put_Line (Dy'Image & " /" & Mh'Image & " /" & Yr'Image & "  " &
                     Hr'Image & " :" & Mn'Image & " :" & Sd'Image &
                     "  (" & Ss'Image & ") Value of I = " & I'Image);

         Next := Next + Period;
         delay until Next;
      end loop;

   end Timer;

   task type Incrementer;
   task body Incrementer is
      Next : Ada.Real_Time.Time := Clock;
      Period      : Time_Span := Seconds(1);
   begin
      loop
         I := (I + 1) mod 16;

         Next := Next + Period / 2;
         delay until Next;
      end loop;
   end Incrementer;

   T : Timer;
   Inc : Incrementer;

begin
   Put_Line("Program starts...");
end Periodic_task;
