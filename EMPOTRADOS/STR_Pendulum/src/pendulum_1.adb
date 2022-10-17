with Ada.Real_Time;      use Ada.Real_Time;
with HAL;                use HAL;
with STM32.Board;        use STM32.Board;
with LIS3DSH;            use LIS3DSH;
with STM32.Device; use STM32.Device;
with STM32.GPIO; use STM32.GPIO;

procedure Pendulum_1 is

   --  GPIO_Points of Pendulum LEDs (outputs, top to bottom of bar)
   LED_Points : GPIO_Points (1 .. 8) :=
     (PC4, PB0, PA2, PC2, PA1, PC1, PA3, PC5);

   procedure Initialise_Pendulum is
   begin
      --  Enable GPIO ports of LED_Points
      Enable_Clock (LED_Points);

      --  Configure GPIOs of LED_Points
      Configure_IO (Points => LED_Points,
                    Config => (Mode        => Mode_Out,
                               Resistors   => Floating,
                               Output_Type => Push_Pull,
                               Speed       => Speed_100MHz));

      --  Configuration of additional pendulum pins
      --  ...
   end Initialise_Pendulum;

   Period : constant Time_Span := Milliseconds (1000);
begin
   --  Exercise 1
   Initialise_Pendulum;
   Set(LED_Points);
   loop
      for I in 1 .. 8 loop
         STM32.GPIO.Toggle(LED_Points(I));
         delay until Clock + Period;
      end loop;
   end loop;
end Pendulum_1;
