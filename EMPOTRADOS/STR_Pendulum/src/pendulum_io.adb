pragma Ada_2012;
package body pendulum_io is

   
   procedure Initialise_Pendulum is
   begin
      --  Enable GPIO ports used for the pendulum's LED_Points
      Enable_Clock (LED_Points);

      --  Configure LED_Points
      Configure_IO (Points => LED_Points,
                    Config => (Mode        => Mode_Out,
                               Resistors   => Floating,
                               Output_Type => Push_Pull,
                               Speed       => Speed_100MHz));

      --  Configuration of additional pendulum pins
      --  ...

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

end pendulum_io;
