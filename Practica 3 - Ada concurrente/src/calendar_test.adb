with Ada.Calendar;  use Ada.Calendar;
with Ada.Text_IO;   use Ada.Text_IO;
with System;

procedure Calendar_Test is
   T_Cal      : Ada.Calendar.Time;
   Yr, Mh, Dy : Integer;
   Ss         : Duration;
   Hr, Mn, Sd : Integer;
begin
   Put_Line("Resolution (Duration'Small) =" & Duration'Image(Duration'Small)); -- 1 nanosegundo
   Put_Line("Granularity (System.Tick) =" & Float'Image(System.Tick)); -- 1 microsegundo 
   Put_Line("Relative delay test (observe the time drift in seconds)");
   for I in 1 .. 30 loop                  -- Half a minute loop (approx)
      T_Cal := Ada.Calendar.Clock;                      -- Calendar time
      Split (T_Cal, Yr, Mh, Dy, Ss); -- Obtain year, month, day and secs
      Hr := Integer(Ss)/3600;                   -- Calculate hour of day
      Mn := (Integer(Ss) mod 3600) / 60;     -- Calculate minute of hour
      Sd := Integer(Ss) mod 60; -- Calculate (integer) seconds of minute
      Ss := Ss - 3600.0*Hr - 60.0*Mn; -- Calculate (fixed point) seconds
      
      --Se produce una deriva en el orden de microsegundos para cada intervalo de tiempo, debido al coste temporal de las operaciones para convertir los segundos a coma fija
      
      -- Print "dd/mm/yyyy hh:mm:ss (ss.sssssssss)" 
      Put_Line(Dy'Image & " /" & Mh'Image & " /" & Yr'Image & "  " &
               Hr'Image & " :" & Mn'Image & " :" & Sd'Image & 
               "  (" & Ss'Image & ")"); 
      delay 1.0;
   end loop;
end Calendar_Test;
