pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__pendulum_3.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__pendulum_3.adb");
pragma Suppress (Overflow_Check);

with System.Restrictions;

package body ada_main is

   E098 : Short_Integer; pragma Import (Ada, E098, "ada__tags_E");
   E045 : Short_Integer; pragma Import (Ada, E045, "system__soft_links_E");
   E043 : Short_Integer; pragma Import (Ada, E043, "system__exception_table_E");
   E112 : Short_Integer; pragma Import (Ada, E112, "system__bb__timing_events_E");
   E164 : Short_Integer; pragma Import (Ada, E164, "ada__streams_E");
   E173 : Short_Integer; pragma Import (Ada, E173, "system__finalization_root_E");
   E171 : Short_Integer; pragma Import (Ada, E171, "ada__finalization_E");
   E175 : Short_Integer; pragma Import (Ada, E175, "system__storage_pools_E");
   E168 : Short_Integer; pragma Import (Ada, E168, "system__finalization_masters_E");
   E006 : Short_Integer; pragma Import (Ada, E006, "ada__real_time_E");
   E177 : Short_Integer; pragma Import (Ada, E177, "system__pool_global_E");
   E191 : Short_Integer; pragma Import (Ada, E191, "system__tasking__protected_objects_E");
   E197 : Short_Integer; pragma Import (Ada, E197, "system__tasking__protected_objects__multiprocessors_E");
   E127 : Short_Integer; pragma Import (Ada, E127, "system__tasking__restricted__stages_E");
   E220 : Short_Integer; pragma Import (Ada, E220, "cortex_m__cache_E");
   E206 : Short_Integer; pragma Import (Ada, E206, "hal__audio_E");
   E229 : Short_Integer; pragma Import (Ada, E229, "hal__block_drivers_E");
   E166 : Short_Integer; pragma Import (Ada, E166, "hal__gpio_E");
   E187 : Short_Integer; pragma Import (Ada, E187, "hal__i2c_E");
   E210 : Short_Integer; pragma Import (Ada, E210, "hal__real_time_clock_E");
   E224 : Short_Integer; pragma Import (Ada, E224, "hal__sdmmc_E");
   E233 : Short_Integer; pragma Import (Ada, E233, "hal__spi_E");
   E249 : Short_Integer; pragma Import (Ada, E249, "hal__time_E");
   E253 : Short_Integer; pragma Import (Ada, E253, "cs43l22_E");
   E241 : Short_Integer; pragma Import (Ada, E241, "hal__uart_E");
   E244 : Short_Integer; pragma Import (Ada, E244, "lis3dsh_E");
   E255 : Short_Integer; pragma Import (Ada, E255, "lis3dsh__spi_E");
   E248 : Short_Integer; pragma Import (Ada, E248, "ravenscar_time_E");
   E222 : Short_Integer; pragma Import (Ada, E222, "sdmmc_init_E");
   E140 : Short_Integer; pragma Import (Ada, E140, "stm32__adc_E");
   E146 : Short_Integer; pragma Import (Ada, E146, "stm32__dac_E");
   E203 : Short_Integer; pragma Import (Ada, E203, "stm32__dma__interrupts_E");
   E159 : Short_Integer; pragma Import (Ada, E159, "stm32__exti_E");
   E212 : Short_Integer; pragma Import (Ada, E212, "stm32__power_control_E");
   E209 : Short_Integer; pragma Import (Ada, E209, "stm32__rtc_E");
   E232 : Short_Integer; pragma Import (Ada, E232, "stm32__spi_E");
   E235 : Short_Integer; pragma Import (Ada, E235, "stm32__spi__dma_E");
   E183 : Short_Integer; pragma Import (Ada, E183, "stm32__i2c_E");
   E239 : Short_Integer; pragma Import (Ada, E239, "stm32__usarts_E");
   E228 : Short_Integer; pragma Import (Ada, E228, "stm32__sdmmc_interrupt_E");
   E205 : Short_Integer; pragma Import (Ada, E205, "stm32__i2s_E");
   E189 : Short_Integer; pragma Import (Ada, E189, "stm32__i2c__dma_E");
   E152 : Short_Integer; pragma Import (Ada, E152, "stm32__gpio_E");
   E217 : Short_Integer; pragma Import (Ada, E217, "stm32__sdmmc_E");
   E157 : Short_Integer; pragma Import (Ada, E157, "stm32__syscfg_E");
   E131 : Short_Integer; pragma Import (Ada, E131, "stm32__device_E");
   E251 : Short_Integer; pragma Import (Ada, E251, "stm32__setup_E");
   E246 : Short_Integer; pragma Import (Ada, E246, "stm32__board_E");
   E120 : Short_Integer; pragma Import (Ada, E120, "pendulum_io_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (C, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Leap_Seconds_Support : Integer;
      pragma Import (C, Leap_Seconds_Support, "__gl_leap_seconds_support");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := 0;
      WC_Encoding := 'b';
      Locking_Policy := 'C';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := 'F';
      System.Restrictions.Run_Time_Restrictions :=
        (Set =>
          (False, True, True, False, False, False, False, True, 
           False, False, False, False, False, False, False, True, 
           True, False, False, False, False, False, True, False, 
           False, False, False, False, False, False, False, False, 
           True, True, False, False, True, True, False, False, 
           False, True, False, False, False, False, True, False, 
           True, True, False, False, False, False, True, True, 
           True, True, True, False, True, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, True, False, False, 
           False, False, False, False, False, False, True, True, 
           False, True, False, False),
         Value => (0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         Violated =>
          (False, False, False, False, True, True, False, False, 
           False, False, False, True, True, True, True, False, 
           False, False, False, False, True, True, False, True, 
           True, False, True, True, False, True, False, False, 
           False, False, False, True, False, False, True, False, 
           False, False, True, True, False, False, False, True, 
           False, False, False, True, False, False, False, False, 
           False, False, False, False, False, True, True, True, 
           False, False, True, False, True, True, True, False, 
           True, True, False, False, True, True, True, False, 
           False, True, False, False, False, True, False, False, 
           False, False, True, False),
         Count => (0, 0, 0, 1, 0, 0, 0, 0, 3, 0),
         Unknown => (False, False, False, False, False, False, False, False, True, False));
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 1;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 1;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;

      Runtime_Initialize (1);

      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E043 := E043 + 1;
      Ada.Tags'Elab_Body;
      E098 := E098 + 1;
      System.Bb.Timing_Events'Elab_Spec;
      E112 := E112 + 1;
      E045 := E045 + 1;
      Ada.Streams'Elab_Spec;
      E164 := E164 + 1;
      System.Finalization_Root'Elab_Spec;
      E173 := E173 + 1;
      Ada.Finalization'Elab_Spec;
      E171 := E171 + 1;
      System.Storage_Pools'Elab_Spec;
      E175 := E175 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E168 := E168 + 1;
      Ada.Real_Time'Elab_Body;
      E006 := E006 + 1;
      System.Pool_Global'Elab_Spec;
      E177 := E177 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E191 := E191 + 1;
      System.Tasking.Protected_Objects.Multiprocessors'Elab_Body;
      E197 := E197 + 1;
      System.Tasking.Restricted.Stages'Elab_Body;
      E127 := E127 + 1;
      E220 := E220 + 1;
      HAL.AUDIO'ELAB_SPEC;
      E206 := E206 + 1;
      HAL.BLOCK_DRIVERS'ELAB_SPEC;
      E229 := E229 + 1;
      HAL.GPIO'ELAB_SPEC;
      E166 := E166 + 1;
      HAL.I2C'ELAB_SPEC;
      E187 := E187 + 1;
      HAL.REAL_TIME_CLOCK'ELAB_SPEC;
      E210 := E210 + 1;
      HAL.SDMMC'ELAB_SPEC;
      E224 := E224 + 1;
      HAL.SPI'ELAB_SPEC;
      E233 := E233 + 1;
      HAL.TIME'ELAB_SPEC;
      E249 := E249 + 1;
      CS43L22'ELAB_SPEC;
      CS43L22'ELAB_BODY;
      E253 := E253 + 1;
      HAL.UART'ELAB_SPEC;
      E241 := E241 + 1;
      LIS3DSH'ELAB_SPEC;
      LIS3DSH'ELAB_BODY;
      E244 := E244 + 1;
      LIS3DSH.SPI'ELAB_SPEC;
      LIS3DSH.SPI'ELAB_BODY;
      E255 := E255 + 1;
      Ravenscar_Time'Elab_Spec;
      Ravenscar_Time'Elab_Body;
      E248 := E248 + 1;
      E222 := E222 + 1;
      STM32.ADC'ELAB_SPEC;
      E140 := E140 + 1;
      E146 := E146 + 1;
      E203 := E203 + 1;
      E159 := E159 + 1;
      E212 := E212 + 1;
      STM32.RTC'ELAB_SPEC;
      STM32.RTC'ELAB_BODY;
      E209 := E209 + 1;
      STM32.SPI'ELAB_SPEC;
      STM32.SPI'ELAB_BODY;
      E232 := E232 + 1;
      STM32.SPI.DMA'ELAB_SPEC;
      STM32.SPI.DMA'ELAB_BODY;
      E235 := E235 + 1;
      STM32.I2C'ELAB_SPEC;
      STM32.USARTS'ELAB_SPEC;
      STM32.I2S'ELAB_SPEC;
      STM32.I2C.DMA'ELAB_SPEC;
      STM32.GPIO'ELAB_SPEC;
      STM32.SDMMC'ELAB_SPEC;
      E228 := E228 + 1;
      STM32.GPIO'ELAB_BODY;
      E152 := E152 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E131 := E131 + 1;
      STM32.SDMMC'ELAB_BODY;
      E217 := E217 + 1;
      STM32.I2S'ELAB_BODY;
      E205 := E205 + 1;
      STM32.I2C.DMA'ELAB_BODY;
      E189 := E189 + 1;
      STM32.I2C'ELAB_BODY;
      E183 := E183 + 1;
      E157 := E157 + 1;
      STM32.USARTS'ELAB_BODY;
      E239 := E239 + 1;
      E251 := E251 + 1;
      STM32.BOARD'ELAB_SPEC;
      E246 := E246 + 1;
      pendulum_io'elab_spec;
      pendulum_io'elab_body;
      E120 := E120 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_pendulum_3");

   procedure main is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
   end;

--  BEGIN Object file/option list
   --   /home/ALUMNO/frafolco/STR/STR_Pendulum/obj/pendulum_io.o
   --   /home/ALUMNO/frafolco/STR/STR_Pendulum/obj/pendulum_3.o
   --   -L/home/ALUMNO/frafolco/STR/STR_Pendulum/obj/
   --   -L/home/ALUMNO/frafolco/STR/STR_Pendulum/obj/
   --   -L/home/ALUMNO/frafolco/STR/ADL-2018/boards/stm32f407_discovery/obj/full_lib_Debug/
   --   -L/opt/GNAT/2018-arm-elf/arm-eabi/lib/gnat/ravenscar-full-stm32f4/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
