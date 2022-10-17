
with Ada.Text_IO, Ada.Integer_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO;

package body Buffers is

   function Full(B: in Circular_Buffer) return Boolean is
   Res:Boolean := B.Counter < N;
   begin
      return not Res;
   end Full;

   function Empty(B: in Circular_Buffer) return Boolean is
      Res:Boolean := B.Counter > 0;
   begin
      return not Res;
   end Empty;

   procedure Initialise (B: in out Circular_Buffer) is
   begin
      B.Add_Index := 0;
      B.Rem_Index := 0;
      B.Counter := 0;
   end Initialise;

   procedure Add (B: in out Circular_Buffer; I : in Integer)  is
   begin
      if Full(B) then
         raise Buffer_Full;
      else
         B.Queue(B.Add_Index) := I;
         B.Add_Index := B.Add_Index + 1;
         B.Counter := B.Counter + 1;
      end if;

   end Add;

   procedure Remove (B: in out Circular_Buffer; I : out Integer ) is
   begin
      if not Empty(B) then--Si el buffer no esta vacio
         I:= B.Queue(B.Rem_Index);
         B.Rem_Index := B.Rem_Index + 1;
         B.Counter := B.Counter - 1;
      else
         raise Buffer_Empty;
      end if;
   end Remove;

   procedure List (B: in Circular_Buffer) is
      Var : Index := B.Rem_Index;
   begin

      if Empty(B) then
         raise Buffer_Empty;
      else
         for I in 1 .. B.Counter loop
            Put("Index : "); Put(Integer(Var));
            Put(" With value "); Put(B.Queue(Var)); New_Line;

            Var := Var + 1;
         end loop;

      end if;
   end List;
end Buffers;
