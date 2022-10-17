with Chars_8x5;          use Chars_8x5;
with pendulum_io;        use pendulum_io;
with System;
with Ada.Real_Time;      use Ada.Real_Time;

package Simple_Pendulum_Text is   
   --Size in characters of text to be displayed
   Line_Size : constant:= 14;
   
   --Left and right margins, in number of Bars
   Margin : constant:= 20;
   
   --Tenemos en cuenta el espacio entre caracteres
   Bars_Per_Char : constant := 6;    
     
   --Display_String
   --Displays a string of Line_Size Characters
   --The Text string is trimmed to Line_Size chars
   procedure Display_String  (Text : in String);
end Simple_Pendulum_Text;
