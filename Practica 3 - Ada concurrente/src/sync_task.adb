with Ada.Calendar;  use Ada.Calendar;
with Ada.Real_Time; use Ada.Real_Time;
with Ada.Text_IO;   use Ada.Text_IO;

procedure Sync_Task is

   Task T is
      entry E1;
      entry E2;
   end T;

   Task body T is
   begin
      accept E1;
      Put_Line("Entry E1 called!");
      loop
         delay 2.0;
         accept E2;
         Put_Line("Entry E2 called!");
      end loop;
   end T;

begin
   Put_Line("Program started...");
   delay 3.0;
   T.E1;
   delay 3.0;
   for I in 1..10 loop
      T.E2;
   end loop;
   delay 5.0;
   T.E2;
   Put_Line("Program finished");
end Sync_Task;

-- Expected:
-- start
-- entry E1 called
-- entry E2 called (x11)
-- entry E2 called (after 5 sec)
-- finish
