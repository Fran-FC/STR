with pendulum_io, Ada.Real_Time;
use pendulum_io,  Ada.Real_Time;

procedure pendulum_4 is
   Init_Time : Time;
   Cycle_Duration : Time_Span;
begin
   loop
      Wait_For_Next_Cycle(Init_Time => Init_Time,
                          Cycle_Duration => Cycle_Duration);
      -- To light the leds at half of the pendulum's path, (Now + Cycle_Duration/2) == Init_Time

      delay until Init_Time + Cycle_Duration/4;
      pendulum_io.Set_LEDs(16#FF#);
      delay until (Init_Time + Cycle_Duration/4) + Microseconds(200);
      Clear_All_LEDs;
   end loop;

end pendulum_4;
