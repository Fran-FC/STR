
with Ada.Text_IO, Ada.Integer_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO;

package Buffers is

   type Circular_Buffer is private;

   procedure Initialise (B: in out Circular_Buffer);

   procedure Add (B: in out Circular_Buffer; I : in Integer);

   procedure Remove (B: in out Circular_Buffer; I : out Integer );

   procedure List (B: in Circular_Buffer);



   Buffer_Full, Buffer_Empty : exception;

private
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

end Buffers;

