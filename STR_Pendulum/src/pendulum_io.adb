pragma Ada_2012;
package body pendulum_io is

  
   
   
   procedure Initialise_Pendulum is
   begin
      --  Enable GPIO ports used for the pendulum's LED_Points
      Enable_Clock (LED_Points & Solenoid_Point);

      --  Configure LED_Points
      Configure_IO (Points => LED_Points & Solenoid_Point,
                    Config => (Mode        => Mode_Out,
                               Resistors   => Floating,
                               Output_Type => Push_Pull,
                               Speed       => Speed_100MHz));

      --  Configuration of additional pendulum pins
      --  ...
      Configure_IO (This => Barrier_Point,
                    Config => (Mode        => Mode_In,
                               Resistors   => Pull_Up));
      Configure_Trigger(This => Barrier_Point,
                        Trigger => Interrupt_Rising_Falling_Edge);
     
   end Initialise_Pendulum;
   
   --------------------
   -- Clear_All_LEDs --
   --------------------

   
   procedure Clear_All_LEDs
   is
   begin
      STM32.GPIO.Set(LED_Points);
      
   end Clear_All_LEDs;

   --------------
   -- Set_LEDs --
   --------------

   procedure Set_LEDs (Pattern : in Byte)
   is
      V : Byte := Pattern; -- Make local copy
      S : Byte;
   begin
      for I in 1 .. 8 loop
         S := V mod 2;
         if S = 1 then
            STM32.GPIO.Clear(LED_Points(I));
         else
            STM32.GPIO.Set(LED_Points(I));
         end if;
         V := V / 2;
      end loop;
   end Set_LEDs;

   -------------
   -- Set_LED --
   -------------

   procedure Set_LED (Pos : in Bit_Pos) is
      I : Integer := 1 + Integer(Pos);
   begin
      STM32.GPIO.Clear(LED_Points(I));
   end Set_LED;

   ---------------
   -- Clear_LED --
   ---------------

   procedure Clear_LED (Pos : in Bit_Pos) is
      I : Integer := 1 + Integer(Pos);
   begin
      STM32.GPIO.Set(LED_Points(I));
   end Clear_LED;
   
   
   
   ---------------   
   ---------------
   -- P_TRACKER --
   ---------------
   ---------------   
   type FSM_State is (S0, S1, S2, S3, S4);

   protected P_Tracker is
      entry Wait_For_Next_Cycle (Init_Time      : out Time;
                                 Cycle_Duration : out Time_Span);
      function Next_Cycle_Duration return Time_Span;
      function Next_Cycle_Start return Time;
      pragma Interrupt_Priority;
   private
      P_State            : FSM_State := S0;
      Next_Start         : Time;
      Pendulum_Period    : Time_Span;
      T1, T2, T3, T4, T5 : Time;
      Ending_Cycle       : Boolean := False;
      
      Now : Time;
      procedure Barrier_Interrupt_Handler;
      
      pragma Attach_Handler (Barrier_Interrupt_Handler, Barrier_Interrupt);
   end P_Tracker;
   
   protected body P_Tracker is
      procedure Barrier_Interrupt_Handler is
         --Taux1, Taux2, Taux3 : Time;
      begin
         Clear_External_Interrupt(Barrier_Point.Pin);
         
         case P_State is
            when S0 =>
               if Set(Barrier_Point) then
                  T1 := Clock;
                  P_State := S1;
               end if;
            when S1 =>
               if not Set(Barrier_Point) then
                  T2 := Clock;
                  P_State :=  S2;
               end if;
            when S2 =>
               if Set(Barrier_Point) then
                  T3 := Clock;
                  P_State := S3;
               end if;
            when S3 =>
               if not Set(Barrier_Point) then
                  T4 := Clock;
                  P_State := S4;
               end if;
            when S4 =>
               if Set(Barrier_Point) then
                  T5 := Clock;
                  if (T3 - T1) > (T5 - T3) then
                     T1 := T3;
                     T2 := T4;
                     T3 := T5;
                     
                     P_State := S3;
                  else
                     Next_Start := T5 + (T4 -T1) / 2;
                     Pendulum_Period := T5 -T1;
                     
                     Ending_Cycle := True;
                     Set_True(Release_P_Controler);
                     
                     T1 := T5;
                     P_State := S1;
                  end if;
               end if;   
            when others => null;
         end case;     
      end Barrier_Interrupt_Handler;
      
      entry Wait_For_Next_Cycle (Init_Time      : out Time;
                                 Cycle_Duration : out Time_Span) when Ending_Cycle is
      begin
         Cycle_Duration := Pendulum_Period;
         Init_Time := Next_Start;
         Ending_Cycle := False;
      end Wait_For_Next_Cycle;
      
      function Next_Cycle_Start return Time is
      begin
         return Next_Start;
      end Next_Cycle_Start;
      
      function Next_Cycle_Duration return Time_Span is
      begin
         return Pendulum_Period;
      end Next_Cycle_Duration;
      
   end P_Tracker;
   
   --Synchronization point with start of new cycle
   procedure Wait_For_Next_Cycle (Init_Time      : out Time; 
                                  Cycle_Duration : out Time_Span) is
   begin
      P_Tracker.Wait_For_Next_Cycle (Init_Time, Cycle_Duration);
   end Wait_For_Next_Cycle;
   
   
   --------------   
   --------------
   -- SOLENOID --
   --------------
   --------------   
   protected Solenoid
     with Priority => System.Interrupt_Priority'Last is
      procedure Set_Off;
      procedure Set_During (Pulse_Width : Time_Span); 
      procedure Set_Periodic (Pulse_Width, Period : Time_Span);
   private
      Pulse_TE : Timing_Event; 
      Periodic_Pulse_TE : Timing_Event; 
      procedure Pulse_Handler (TE : in out Timing_Event); 
      procedure Periodic_Pulse_Handler (TE : in out Timing_Event);
   
      --  State variables for periodic pulse trains
      Periodic_Pulse_Width : Time_Span; --  Duration of per. pulse "high"
      Period : Time_Span;               --  Period of periodic pulse
   end Solenoid;
   
   protected body Solenoid is
      procedure Set_During (Pulse_Width : Time_Span) is 
         Now  : constant Time := Clock;       
         Test : Boolean; 
      begin
         Cancel_Handler (Periodic_Pulse_TE, Test);
         Set (Solenoid_Point); 
         Set_Handler (Event => Pulse_TE, At_Time => Now + Pulse_Width,
                      Handler => Pulse_Handler'Access);
      end Set_During;
      
      procedure Pulse_Handler (TE : in out Timing_Event) is
         pragma Unreferenced (TE); 
      begin 
         Clear (Solenoid_Point); 
      end Pulse_Handler;
      
      
      procedure Set_Periodic (Pulse_Width, Period : Time_Span) is
         Now : constant Time := Clock; 
         Test : Boolean;
      begin
         Cancel_Handler (Pulse_TE, Test);
         Periodic_Pulse_Width := Pulse_Width;
         Solenoid.Period := Period;   
         Set (Solenoid_Point);
         Set_Handler (Event   => Periodic_Pulse_TE, At_Time => Now + Pulse_Width, 
                      Handler => Periodic_Pulse_Handler'Access);
      end Set_Periodic;
      
      
      procedure Periodic_Pulse_Handler (TE : in out Timing_Event) is
         Now : constant Time := Clock;
      begin
         if Set (Solenoid_Point) then
            Clear (Solenoid_Point); 
            Set_Handler (Event => Periodic_Pulse_TE,
                        At_Time => Now - Periodic_Pulse_Width + Period,
                         Handler => Periodic_Pulse_Handler'Access); 
         else
            Set (Solenoid_Point);
            Set_Handler (Event => Periodic_Pulse_TE, 
                         At_Time => Now + Periodic_Pulse_Width, 
                         Handler => Periodic_Pulse_Handler'Access);
         end if;
      end Periodic_Pulse_Handler;
      
      
      procedure Set_Off is
         Test : Boolean;
      begin
         Cancel_Handler (Periodic_Pulse_TE, Test); 
         Cancel_Handler (Pulse_TE, Test);   
         Clear (Solenoid_Point); 
      end Set_Off;
      
   end Solenoid;
   
   
   ------------------   
   ------------------
   -- P_CONTROLLER --
   ------------------
   ------------------   
   task P_Controller;
     
   task body P_Controller is
      Cycle_Duration : Time_Span;
      Cycle_Start : Time;
      Period : Time_Span := Milliseconds(114);
      Pulse_Width : Time_Span := Milliseconds(57);
      Duration_Impulse : Time_Span := Seconds(4);
      
      --  Period           => Periodo para aplicar el pulso al pendulo
      --  Pulse_Width      => Duracion del pulso en cada periodo
      --  Duration_Impulse => Duracion del tren de pulsos (hasta que el solenoide consigue hacer el recorrido entero)
      procedure Initial_Sequence (Period, Pulse_Width, Duration_Impulse : Time_Span) is
         Now : Time := Clock;
      begin
         Solenoid.Set_Periodic(Pulse_Width, Period);
         delay until Now + Duration_Impulse;
         Solenoid.Set_Off;
      end Initial_Sequence;
      
   begin
      
      Initial_Sequence(Period, Pulse_Width, Duration_Impulse);
      
      loop
         Suspend_Until_True(Release_P_Controler);   -- Se suspende hasta que los valores de Next_Cycle y Cycle_Duration estén disponibles
         
         Cycle_Duration := P_Tracker.Next_Cycle_Duration;
         Cycle_Start := P_Tracker.Next_Cycle_Start;
         
         delay until Cycle_Start + Cycle_Duration/6;
         
         Solenoid.Set_During(Milliseconds(40));
      end loop;
   end P_Controller;
   
begin 
   Initialise_Pendulum;
   Clear_All_LEDs;
end pendulum_io;
