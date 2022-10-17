pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__lab_0.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__lab_0.adb");
pragma Suppress (Overflow_Check);

with System.Restrictions;

package body ada_main is

   E098 : Short_Integer; pragma Import (Ada, E098, "ada__tags_E");
   E045 : Short_Integer; pragma Import (Ada, E045, "system__soft_links_E");
   E043 : Short_Integer; pragma Import (Ada, E043, "system__exception_table_E");
   E112 : Short_Integer; pragma Import (Ada, E112, "system__bb__timing_events_E");
   E125 : Short_Integer; pragma Import (Ada, E125, "ada__streams_E");
   E133 : Short_Integer; pragma Import (Ada, E133, "system__finalization_root_E");
   E131 : Short_Integer; pragma Import (Ada, E131, "ada__finalization_E");
   E135 : Short_Integer; pragma Import (Ada, E135, "system__storage_pools_E");
   E128 : Short_Integer; pragma Import (Ada, E128, "system__finalization_masters_E");
   E006 : Short_Integer; pragma Import (Ada, E006, "ada__real_time_E");
   E137 : Short_Integer; pragma Import (Ada, E137, "system__pool_global_E");
   E188 : Short_Integer; pragma Import (Ada, E188, "system__tasking__protected_objects_E");
   E194 : Short_Integer; pragma Import (Ada, E194, "system__tasking__protected_objects__multiprocessors_E");
   E207 : Short_Integer; pragma Import (Ada, E207, "system__tasking__restricted__stages_E");
   E226 : Short_Integer; pragma Import (Ada, E226, "cortex_m__cache_E");
   E212 : Short_Integer; pragma Import (Ada, E212, "hal__audio_E");
   E235 : Short_Integer; pragma Import (Ada, E235, "hal__block_drivers_E");
   E176 : Short_Integer; pragma Import (Ada, E176, "hal__gpio_E");
   E184 : Short_Integer; pragma Import (Ada, E184, "hal__i2c_E");
   E216 : Short_Integer; pragma Import (Ada, E216, "hal__real_time_clock_E");
   E230 : Short_Integer; pragma Import (Ada, E230, "hal__sdmmc_E");
   E123 : Short_Integer; pragma Import (Ada, E123, "hal__spi_E");
   E144 : Short_Integer; pragma Import (Ada, E144, "hal__time_E");
   E249 : Short_Integer; pragma Import (Ada, E249, "cs43l22_E");
   E246 : Short_Integer; pragma Import (Ada, E246, "hal__uart_E");
   E141 : Short_Integer; pragma Import (Ada, E141, "lis3dsh_E");
   E251 : Short_Integer; pragma Import (Ada, E251, "lis3dsh__spi_E");
   E143 : Short_Integer; pragma Import (Ada, E143, "ravenscar_time_E");
   E228 : Short_Integer; pragma Import (Ada, E228, "sdmmc_init_E");
   E153 : Short_Integer; pragma Import (Ada, E153, "stm32__adc_E");
   E159 : Short_Integer; pragma Import (Ada, E159, "stm32__dac_E");
   E200 : Short_Integer; pragma Import (Ada, E200, "stm32__dma__interrupts_E");
   E172 : Short_Integer; pragma Import (Ada, E172, "stm32__exti_E");
   E218 : Short_Integer; pragma Import (Ada, E218, "stm32__power_control_E");
   E215 : Short_Integer; pragma Import (Ada, E215, "stm32__rtc_E");
   E238 : Short_Integer; pragma Import (Ada, E238, "stm32__spi_E");
   E240 : Short_Integer; pragma Import (Ada, E240, "stm32__spi__dma_E");
   E180 : Short_Integer; pragma Import (Ada, E180, "stm32__i2c_E");
   E244 : Short_Integer; pragma Import (Ada, E244, "stm32__usarts_E");
   E234 : Short_Integer; pragma Import (Ada, E234, "stm32__sdmmc_interrupt_E");
   E211 : Short_Integer; pragma Import (Ada, E211, "stm32__i2s_E");
   E186 : Short_Integer; pragma Import (Ada, E186, "stm32__i2c__dma_E");
   E165 : Short_Integer; pragma Import (Ada, E165, "stm32__gpio_E");
   E223 : Short_Integer; pragma Import (Ada, E223, "stm32__sdmmc_E");
   E170 : Short_Integer; pragma Import (Ada, E170, "stm32__syscfg_E");
   E148 : Short_Integer; pragma Import (Ada, E148, "stm32__device_E");
   E146 : Short_Integer; pragma Import (Ada, E146, "stm32__setup_E");
   E122 : Short_Integer; pragma Import (Ada, E122, "stm32__board_E");

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
      E125 := E125 + 1;
      System.Finalization_Root'Elab_Spec;
      E133 := E133 + 1;
      Ada.Finalization'Elab_Spec;
      E131 := E131 + 1;
      System.Storage_Pools'Elab_Spec;
      E135 := E135 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E128 := E128 + 1;
      Ada.Real_Time'Elab_Body;
      E006 := E006 + 1;
      System.Pool_Global'Elab_Spec;
      E137 := E137 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E188 := E188 + 1;
      System.Tasking.Protected_Objects.Multiprocessors'Elab_Body;
      E194 := E194 + 1;
      System.Tasking.Restricted.Stages'Elab_Body;
      E207 := E207 + 1;
      E226 := E226 + 1;
      HAL.AUDIO'ELAB_SPEC;
      E212 := E212 + 1;
      HAL.BLOCK_DRIVERS'ELAB_SPEC;
      E235 := E235 + 1;
      HAL.GPIO'ELAB_SPEC;
      E176 := E176 + 1;
      HAL.I2C'ELAB_SPEC;
      E184 := E184 + 1;
      HAL.REAL_TIME_CLOCK'ELAB_SPEC;
      E216 := E216 + 1;
      HAL.SDMMC'ELAB_SPEC;
      E230 := E230 + 1;
      HAL.SPI'ELAB_SPEC;
      E123 := E123 + 1;
      HAL.TIME'ELAB_SPEC;
      E144 := E144 + 1;
      CS43L22'ELAB_SPEC;
      E249 := E249 + 1;
      HAL.UART'ELAB_SPEC;
      E246 := E246 + 1;
      LIS3DSH'ELAB_SPEC;
      E141 := E141 + 1;
      LIS3DSH.SPI'ELAB_SPEC;
      E251 := E251 + 1;
      Ravenscar_Time'Elab_Spec;
      Ravenscar_Time'Elab_Body;
      E143 := E143 + 1;
      E228 := E228 + 1;
      STM32.ADC'ELAB_SPEC;
      E153 := E153 + 1;
      E159 := E159 + 1;
      E200 := E200 + 1;
      E172 := E172 + 1;
      E218 := E218 + 1;
      STM32.RTC'ELAB_SPEC;
      E215 := E215 + 1;
      STM32.SPI'ELAB_SPEC;
      E238 := E238 + 1;
      STM32.SPI.DMA'ELAB_SPEC;
      E240 := E240 + 1;
      STM32.I2C'ELAB_SPEC;
      STM32.USARTS'ELAB_SPEC;
      STM32.I2S'ELAB_SPEC;
      STM32.I2C.DMA'ELAB_SPEC;
      STM32.GPIO'ELAB_SPEC;
      STM32.SDMMC'ELAB_SPEC;
      E234 := E234 + 1;
      E165 := E165 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E148 := E148 + 1;
      E244 := E244 + 1;
      E223 := E223 + 1;
      E211 := E211 + 1;
      E186 := E186 + 1;
      E180 := E180 + 1;
      E170 := E170 + 1;
      E146 := E146 + 1;
      STM32.BOARD'ELAB_SPEC;
      E122 := E122 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_lab_0");

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
   --   /home/ALUMNO/frafolco/STR/STR_Labs/obj/lab_0.o
   --   -L/home/ALUMNO/frafolco/STR/STR_Labs/obj/
   --   -L/home/ALUMNO/frafolco/STR/STR_Labs/obj/
   --   -L/home/ALUMNO/frafolco/STR/ADL-2018/boards/stm32f407_discovery/obj/full_lib_Production/
   --   -L/opt/GNAT/2018-arm-elf/arm-eabi/lib/gnat/ravenscar-full-stm32f4/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
