-- Practicas de Sistemas Empotrados y de Tiempo Real
-- ETS de Ingenieria Informatica, Universidad Politecnica de Valencia
-- Practica 1
-- Ejercicios 3, 4, 5 y 6


with Ada.Text_IO, Ada.Integer_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO;


procedure Prac_1 is
   N : constant Integer := 5; -- Tamaño del Buffer (constante)
   type Index is mod N; -- COMPLETAR (usar tipo modular)
   type Buffer is array (Index) of Integer ;-- COMPLETAR

   type Circular_Buffer is --Definicion completa del Buffer
      record
                            -- circular, incluyendo los indices
         Queue : Buffer;
         -- para añadir y sacar elementos
         Add_Index,
         -- y el contador de elementos.
         Rem_Index : Index := 0;
         Counter : Integer := 0;
      end record;
  -- Space for the declarations of type Buffer  -- and procedures Add, Remove and Initialise
   My_Buffer: Circular_Buffer;
   Command, Elem: Integer;

   procedure Initialise (B: in out Circular_Buffer) is
   begin
      B.Add_Index := 0;
      B.Rem_Index := 0;
      B.Counter := 0;
   end Initialise;

   function Add (B: in out Circular_Buffer; I : in Integer) return Boolean is
      Res : Boolean;
   begin
      if B.Counter < N then --Si el buffer no esta lleno
         B.Queue(B.Add_Index) := I;
         B.Add_Index := B.Add_Index + 1;
         B.Counter := B.Counter + 1;

         Res := True;
      else
         Put_Line("Buffer is full.");

         Res:=False;
      end if;

      return Res;
   end Add;

   function Remove (B: in out Circular_Buffer; I : out Integer ) return Boolean is
      Res : Boolean;
   begin
      if B.Counter > 0 then--Si el buffer no esta vacio
         I:= B.Queue(B.Rem_Index);
         B.Rem_Index := B.Rem_Index + 1;
         B.Counter := B.Counter - 1;

         Res := True;
      else
         Put_Line("Cannot remove elements because the buffer is empty.");

         Res := False;
      end if;

      return Res;
   end Remove;

   procedure List (B: in Circular_Buffer) is
      Var : Index := B.Rem_Index;
   begin

      if B.Counter = 0 then
         Put_Line("Buffer is empty.");
      else
         for I in 1 .. B.Counter loop
            Put("Index : "); Put(Integer(Var));
            Put(" With value "); Put(B.Queue(Var)); New_Line;

            Var := Var + 1;
         end loop;

      end if;

   end List;


begin
  Put_Line("BUFFER MANAGER");
  loop
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
         if Add(My_Buffer,Elem) then
            Put_Line("Added element");
         end if;
      when 2 =>
        if Remove(My_Buffer,Elem) then
            Put("Element removed:");
            Put(Elem);
        else
            Put("Element not removed.");
         end if;
        New_Line;
      when 3 =>
         Initialise(My_Buffer);
      when 4 =>
         List(My_Buffer);
      when 0 =>
        exit;
      when  others =>
        Put ("Please enter a valid option number");
    end case;
  end loop;
end Prac_1;
