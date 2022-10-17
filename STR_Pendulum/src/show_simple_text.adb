with Simple_Pendulum_Text; use Simple_Pendulum_Text;
with Ada.Real_Time;        use Ada.Real_Time;

procedure Show_Simple_Text is
   --  Message of exactly Simple_Pendulum_Text.Line_Size characters
   Message_1 : constant String := "01234567890123";
   Message_2 : constant String := "ABCDEFGHIJKLMN";
   Message_3 : constant String := "!$%&/()=?+-:;.";
   Message_4 : constant String := "abcdefghijklmn";
begin
   loop
      Display_String (Message_1);

      delay until Clock + Seconds (3);
      Display_String (Message_2);
      delay until Clock + Seconds (3);
      Display_String (Message_3);
      delay until Clock + Seconds (3);
      Display_String (Message_4);
      delay until Clock + Seconds (3);

   end loop;
end Show_Simple_Text;
