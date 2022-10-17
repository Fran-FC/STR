with Ada.Real_Time;      use Ada.Real_Time;
with HAL;                use HAL;
with STM32.Board;        use STM32.Board;
with LIS3DSH;            use LIS3DSH;
with STM32.Device; use STM32.Device;
with STM32.GPIO; use STM32.GPIO;
with Ada.Interrupts; use Ada.Interrupts;
with Ada.Interrupts.Names; use Ada.Interrupts.Names;

package pendulum_io is

   type Byte is mod 2**8;
   type Bit_Pos is mod 8;
   
   procedure Clear_All_LEDs with Inline;
   
   procedure Set_LEDs (Pattern : in Byte) with Inline;
   
   procedure Set_LED (Pos : in Bit_Pos) with Inline;
   
   procedure Clear_LED (Pos : in Bit_Pos) with Inline;
   
private

   LED_Points : GPIO_Points (1 .. 8) := (PC4, PB0, PA2, PC2, PA1, PC1, PA3, PC5);
   
   Barrier_Point : GPIO_Point renames PB8;
   
   Barrier_Interrupt : constant Ada.Interrupts.Interrupt_ID := Ada.Interrupts.Names.EXTI9_5_Interrupt;
   

end pendulum_io;
