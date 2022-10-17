with Ada.Calendar;  use Ada.Calendar;
with Ada.Real_Time; use Ada.Real_Time;
with Ada.Text_IO;   use Ada.Text_IO;

procedure Periodic_task_2 is

   I : Integer := 0;

   task Timer is
      entry Start;
      entry Stop;
   end Timer;
   task body Timer is
      T_Cal       : Ada.Calendar.Time;
      Yr, Mh, Dy  : Integer;
      Ss          : Duration;
      Hr, Mn, Sd  : Integer;
      Next : Ada.Real_Time.Time := Clock;
      Period      : Time_Span := Seconds(1);
   begin
      accept Start;
      Put_Line("Timer started!");
Time: loop
         select
            accept Stop;
            Put_Line("Timer finished");
            exit Time;
         else
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
         end select;
      end loop Time;

   end Timer;

   task Incrementer is
      entry Start;
      entry Stop;
   end Incrementer;

   task body Incrementer is
      Next : Ada.Real_Time.Time := Clock;
      Period      : Time_Span := Seconds(1);
   begin
      accept Start;
      Put_Line("Incrementer started!");
Inc : loop
         select
            accept Stop;
            Put_Line("Incrementer finished");
            exit Inc;
         else
            I := (I + 1) mod 16;

            Next := Next + Period / 2;
            delay until Next;
         end select;
      end loop Inc;
   end Incrementer;

begin
   Put_Line("Program starts... will stop in some 10s");
   Timer.Start;
   Incrementer.Start;
   delay 10.0;
   Timer.Stop;
   Incrementer.Stop;
   Put_Line("End of program.");

end Periodic_task_2;
