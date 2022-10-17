with Ada.Real_Time;      use Ada.Real_Time;
with HAL;                use HAL;
with STM32.Board;        use STM32.Board;
with LIS3DSH;            use LIS3DSH;
with STM32.Device; use STM32.Device;
with STM32.GPIO; use STM32.GPIO;

procedure Pendulum_2 is

   --  GPIO_Points of Pendulum LEDs (outputs, top to bottom)
   LED_Points : GPIO_Points (1 .. 8) := (PC4, PB0, PA2, PC2, PA1, PC1, PA3, PC5);

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

   --  Byte type to represent LED patterns
   type Byte is mod 2**8;

   --  Position of bit in byte
   type Bit_Pos is mod 8;

   --  Turn LEDs on/off using byte pattern (1 => On, 0 => Off)
   procedure Set_LEDs (Pattern : in Byte)
     with Inline
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

   --  Turn all pendulum LEDs off
   procedure Clear_All_LEDs
     with Inline
   is
   begin
      STM32.GPIO.Set(LED_Points);
   end Clear_All_LEDs;


   --  Turn on individual LED indicated by Pos
   procedure Set_LED (Pos : in Bit_Pos)
     with Inline
   is
      I : Integer := 1 + Integer(Pos);
   begin
      STM32.GPIO.Clear(LED_Points(I));
   end Set_LED;


   --  Turn off individual LED indicated by Pos
   procedure Clear_LED (Pos : in Bit_Pos)
     with Inline
   is
      I : Integer := 1 + Integer(Pos);
   begin
      STM32.GPIO.Set(LED_Points(I));
   end Clear_LED;


   Pos   : Bit_Pos;
   Value : Byte := 0;

begin

   Initialise_Pendulum;

   ------------------------------
   --  Test for Clear_All_LEDs --
   ------------------------------
   Clear_All_LEDs;

   ------------------------
   --  Test for Set_LED  --
   ------------------------
   Pos := 0;
   for I in 1 .. 8 loop
      delay until Clock + Milliseconds (250);
      Set_LED (Pos);
      Pos := Pos + 1;
   end loop;

   --------------------------
   --  Test for Clear_LED  --
   --------------------------
   Pos := 7;
   for I in 1 .. 8 loop
      delay until Clock + Milliseconds (250);
      Clear_LED (Pos);
      Pos := Pos - 1;
   end loop;

   -------------------------
   --  Test for Set_LEDs  --
   -------------------------
   loop
      Set_LEDs (Value);
      delay until Clock + Milliseconds (250);
      Value := Value + 1;
   end loop;

   --delay until Time_Last;

end Pendulum_2;
