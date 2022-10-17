package body Simple_Pendulum_Text is
   --Binary pattern of whole text to display
   Pattern : array(1 .. Line_Size * Bars_Per_Char) of Byte:= (others=> 0);
   
   procedure Display_String (Text : in String) is
      Words : String := Text;
      Index_Pattern : Integer := 1;
      
   begin
      while Words'Length < Line_Size loop -- Completamos el texto con espacios extra hasta que sea de tamaño Line_Size
         Words := Words & ' ';
      end loop;
      
      for I in Integer range 1 .. Line_Size loop
         for C in Integer range 0 .. Bars_Per_Char - 1 loop
            if C /= Bars_Per_Char-1 then
               Pattern(Index_Pattern) := Char_Map(Text(I), C); 
            else
               Pattern(Index_Pattern) := 16#00#; -- Añadimos el espacio extra ' ' para la separacion entre carácteres
            end if;
            Index_Pattern := Index_Pattern + 1;
         end loop;
      end loop;
      
   end Display_String;
   
   task Displayer with Priority => System.Priority'Last;
   
   task body Displayer is
      Cycle_Init_Time : Time;      --Start time of next pendulum cycle
      Cycle_Period : Time_Span;    --Pendulum period
      Inter_Bar_Delay : Time_Span; --Delay between consecutive bars
      Semicycle_Start : Time;      --Time to start switching LEDs
      Flashing_Time   : constant Time_Span := Microseconds (200);
      --LEDsflashing time
      
      Next : Time;
      J : Integer := Line_Size*Bars_Per_Char;
   begin
      loop
         Wait_For_Next_Cycle(Init_Time => Cycle_Init_Time,
                             Cycle_Duration => Cycle_Period);
         Inter_Bar_Delay := (Cycle_Period/(Line_Size*Bars_Per_Char*2 + 2*Margin))/2;
         Semicycle_Start := Cycle_Init_Time + 25* Inter_Bar_Delay;
         
         Next := Semicycle_Start;
         delay until Next; -- Empieza a encender LEDs al inicio del periodo mas el margen
         
         for I in Integer range 1 .. Line_Size*Bars_Per_Char loop
            Set_LEDs(Pattern(I));
            
            Next := Next + Flashing_Time; 
            delay until Next;
            
            Clear_All_LEDs;
            
            Next := Next + Inter_Bar_Delay;
            delay until Next;
         end loop;
         
         -- Recalculamos el inicio del semiciclo para que se enciendan los leds en sentido contrario
         Semicycle_Start := Cycle_Init_Time + Cycle_Period/2 + Margin*Inter_Bar_Delay;   
         Next := Semicycle_Start;
         delay until Next;
         
         while J > 0 loop 
            Set_LEDs(Pattern(J));
            
            Next := Next + Flashing_Time;
            delay until Next;
            
            Clear_All_LEDs;
            
            Next := Next + Inter_Bar_Delay;
            delay until Next;
            
            J := J - 1;
         end loop;
      end loop;
      end Displayer;
end Simple_Pendulum_Text;
