with Ada.Real_Time;      use Ada.Real_Time;
with HAL;                use HAL;
with STM32.Board;        use STM32.Board;
with LIS3DSH;            use LIS3DSH;
with STM32.Device; use STM32.Device;
with STM32.GPIO; use STM32.GPIO;
with Ada.Interrupts; use Ada.Interrupts;
with Ada.Interrupts.Names; use Ada.Interrupts.Names;
with STM32.EXTI;      use STM32.EXTI;
with STM32.SYSCFG;    use STM32.SYSCFG;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;
with System;
with Ada.Real_Time.Timing_Events;  use Ada.Real_Time.Timing_Events;



package pendulum_io is

   type Byte is mod 2**8;
   type Bit_Pos is mod 8;
   procedure Initialise_Pendulum with Inline;
   
   procedure Clear_All_LEDs with Inline;
   
   procedure Set_LEDs (Pattern : in Byte) with Inline;
   
   procedure Set_LED (Pos : in Bit_Pos) with Inline;
   
   procedure Clear_LED (Pos : in Bit_Pos) with Inline;
   
   --Synchronization point with start of new cycle
   procedure Wait_For_Next_Cycle (Init_Time      : out Time;
                                  Cycle_Duration : out Time_Span) with Inline; 
private

   LED_Points : GPIO_Points (1 .. 8) := (PC4, PB0, PA2, PC2, PA1, PC1, PA3, PC5);
   
   Barrier_Point : GPIO_Point renames PB8;
   
   Solenoid_Point : GPIO_Point renames PB13;
   
   Barrier_Interrupt : constant Ada.Interrupts.Interrupt_ID := Ada.Interrupts.Names.EXTI9_5_Interrupt;
   
   Release_P_Controler : Suspension_Object;
   
end pendulum_io;
