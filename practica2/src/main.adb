with Buffers; use Buffers;
with Ada.Text_IO, Ada.Integer_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO;
with Ada.Exceptions; use Ada.Exceptions;

procedure Main is
   -- Space for the declarations of type Buffer
   My_Buffer: Circular_Buffer;
   Command, Elem: Integer;
   Terminate_Program : Boolean := False;
begin
   Put_Line("BUFFER MANAGER");
   loop
      begin
         Put_Line("1. Add element to buffer");
         Put_Line("2. Remove element from buffer");
         Put_Line("3. Initialise buffer");
         Put_Line("4. List elements of the buffer");
         Put_Line("0. Quit");

         Get(Command);
         case Command is
         when 1 =>

            Put("Element to add:");
            Get(Elem);
            Add(My_Buffer,Elem);
         when 2 =>
            Remove(My_Buffer,Elem);
            Put("Element removed:");
            Put(Elem);

            New_Line;
         when 3 =>
            Initialise(My_Buffer);
         when 4 =>
            List(My_Buffer);
         when 0 =>
            --Terminate_Program := True;
            exit;
         when  others =>
            Put ("Please enter a valid option number");
         end case;

      exception
         when E1 : Buffer_Empty =>
            Put("Buffer is empty");
            New_Line;
            Put_Line("Exception " & Exception_Name(E1) & " in " & Exception_Message(E1));
         when E2 : Buffer_Full =>
            Put("Buffer is full");
            New_Line;
            Put_Line("Exception " & Exception_Name(E2) & " in " & Exception_Message(E2));
      end;


   end loop;
end Main;
