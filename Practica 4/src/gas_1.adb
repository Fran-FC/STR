-------------------------------------------
-- SETR P4 Ejercicio 1: Selective accept --
-------------------------------------------

-- Utiliza este archivo inicialmente y modifícalo para resolver los 4 ejercicios.
-- Guarda las distintas versiones como gas_1.adb, gas_2.adb, gas_3.adb y gas_4.adb


with Consola_Compartida, Ada.Real_Time;
use  Consola_Compartida, Ada.Real_Time;

procedure Gas_1 is

   -- Especificación de tareas y tipos tarea

   task Reparto is -- Rellena los depósitos de la gasolinera
      entry Start;
   end Reparto;

   task Consumidor_Gasolina is -- Consume Gasolina
      entry Start;
   end Consumidor_Gasolina;

   task Consumidor_Gasoil is -- Consume Gasoil
      entry Start;
   end Consumidor_Gasoil;

   task Gasolinera is  -- Atiende las peticiones de servicio y rellenado
      entry Start;
      entry Rellenar (Gasolina, Gasoil : in Integer);
      entry Servir_Gasolina (Pedido : in Integer);
      entry Servir_Gasoil (Pedido : in Integer);
   end Gasolinera;

   -- Cuerpo de las tareas

   task body Reparto is
      Next   : Time;
      Period : Time_Span := Seconds (12);
   begin
      accept Start do
         Next := Clock;
      end Start;
      loop
         Gasolinera.Rellenar (Gasolina => 150, Gasoil => 150);
         Next := Next + Period;
         delay until Next;
      end loop;
   end Reparto;

   task body Gasolinera is
      Cantidad_Super  : Integer := 0;  -- Deposito inicial de gasolina
      Cantidad_Gasoil : Integer := 0;  -- Deposito inicial de gasoil
   begin
      accept Start;
      loop         ----------------------------------------------------------         --                       COMPLETAR                      --         -- Atender las peticiones de servicio y la de rellenado --         -- mediante una sentencia de aceptacion selectiva       --         ----------------------------------------------------------      end loop;   end Gasolinera;
         select
            accept Rellenar (Gasolina, Gasoil : in Integer) do
               Cantidad_Super := Cantidad_Super + Gasolina;
               Cantidad_Gasoil := Cantidad_Gasoil + Gasoil;

               Consola.Put_Line("### RELLENADO: ", Gasolina , " litros de GASOLINA y ",Gasoil ," litros de GASOIL");
            end Rellenar;
         or
            accept Servir_Gasolina (Pedido : in Integer) do

               if Pedido > Cantidad_Super then
                  Consola.Put_Line("-_-DEPOSITO GASOLINA VACIO.  Servidos " ,Cantidad_Super ," litros.");
                  Cantidad_Super := 0;
               elsif Cantidad_Super = 0 then
                  Consola.Put_Line("-_-DEPOSITO GASOLINA VACIO.  Servidos " ,Cantidad_Super , " litros.");
               else
                  Cantidad_Super := Cantidad_Super - Pedido;
                  Consola.Put_Line("--> SERVICIO GASOLINA: " ,Pedido , "; Quedan ", Cantidad_Super , " litros de GASOLINA.");
               end if;
            end Servir_Gasolina;
         or
            accept Servir_Gasoil (Pedido : in Integer) do
               if Pedido > Cantidad_Gasoil then
                  Consola.Put_Line("-_-DEPOSITO GASOIL VACIO.  Servidos " , Cantidad_Gasoil , " litros.");
                  Cantidad_Gasoil := 0;
               elsif Cantidad_Gasoil = 0 then
                  Consola.Put_Line("-_-DEPOSITO GASOIL VACIO.  Servidos ", Cantidad_Gasoil ," litros.");
               else
                  Cantidad_Gasoil := Cantidad_Gasoil - Pedido;
                  Consola.Put_Line("--> SERVICIO GASOIL: " ,Pedido , "; Quedan " , Cantidad_Gasoil , " litros de GASOIL.");
               end if;
            end Servir_Gasoil;
         end select;
      end loop;

   end Gasolinera;

   task body Consumidor_Gasolina is
   begin
      accept Start;
      loop
         Gasolinera.Servir_Gasolina (25);
         delay 1.5;
      end loop;
   end Consumidor_Gasolina;

   task body Consumidor_Gasoil is
   begin
      accept Start;
      loop
         Gasolinera.Servir_Gasoil (40);
         delay 3.0;
      end loop;
   end Consumidor_Gasoil;
begin
   Gasolinera.Start;
   Reparto.Start;
   Consumidor_Gasolina.Start;
   Consumidor_Gasoil.Start;
end Gas_1;
