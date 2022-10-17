with Ada.Calendar;  use Ada.Calendar;
with Ada.Real_Time; use Ada.Real_Time;
with Ada.Text_IO;   use Ada.Text_IO;

procedure RT_Test is
   T_Cal       : Ada.Calendar.Time;
   Next, T_Ini : Ada.Real_Time.Time;
   Period      : Time_Span := Seconds(1);
   Yr, Mh, Dy  : Integer;
   Ss          : Duration;
   Hr, Mn, Sd  : Integer;

begin
   Put_Line("Resolution (Real_Time.Time_Unit) =" & Float'Image(Time_Unit)); --'Image);
   Put_Line("Granularity (Real_Time.Tick) =" & To_Duration(Tick)'Image);
   Put_Line("Absolute delay and RT Clock test");
   Next := Ada.Real_Time.Clock + Period; -- Start time of next iteration
   for I in 1 .. 30 loop -- Half minute loop (almost exact)
      T_Ini := Ada.Real_Time.Clock;    --  Read RT clock
      T_Cal := Ada.Calendar.Clock;    --  Read Calendar clock
      Split (T_Cal, Yr, Mh, Dy, Ss);
      Hr := Integer(Ss)/3600;
      Mn := (Integer(Ss) mod 3600) / 60;
      Sd := Integer(Ss) mod 60;
      Ss := Ss - 3600.0*Hr - 60.0*Mn;
      -- Print "dd/mm/yyyy hh:mm:ss (ss.sssssssss)  Loop: s.sssssssss" 
      Put_Line (Dy'Image & " /" & Mh'Image & " /" & Yr'Image & "  " &
                  Hr'Image & " :" & Mn'Image & " :" & Sd'Image &
                  "  (" & Ss'Image & ")" &
                  "  Loop: " & To_Duration (Clock - T_Ini)'Image);
      delay until Next;
      Next := Next + Period;
   end loop;
end RT_Test;
