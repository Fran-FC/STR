with Ada.Calendar;  use Ada.Calendar;
with Ada.Real_Time; use Ada.Real_Time;
with Ada.Text_IO;   use Ada.Text_IO;

procedure Main is


      Init, Next : Ada.Real_Time.Time;
      Interval : Time_Span;
   begin
      New_Line(2);
      Put_Line("Relative vs absolute delay (wait 5 sec for each test)");
      Put("With relative delay: ");
      Init := Ada.Real_Time.Clock;
      for I in 1..5_000 loop
         delay 0.001;
      end loop;
      Interval := Ada.Real_Time.Clock - Init;
      Put_Line("Time elapsed: " & To_Duration (Interval)'Image & " sec");

      Put("With absolute delay: ");
      Init := Ada.Real_Time.Clock;
      Next := Init;
      for I in 1..5_000 loop
         Next := Next + Milliseconds(1);
         delay until Next;
      end loop;
      Interval := Ada.Real_Time.Clock - Init;
      Put_Line("Time elapsed: " & To_Duration(Interval)'Image & " sec");
      New_Line(2);

end Main;
