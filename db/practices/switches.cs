using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

// Ejercicio 26 Switch
namespace CondicionesSwitch
{
class Program
    {
        static void Main(string[] args)
        {
            // Se declaran las variables a utilizar
            int numeroPalo;
            int numeroCarta;
            string nombreCarta = "";
            bool error = false;

            // Se piden los datos
            Console.Write("Ingresa el primer numero entero (Palo): ");
            numeroPalo = Convert.ToInt32(Console.ReadLine());
            Console.Write("Ingresa el segundo numero entero (Nro de Carta): ");
            numeroCarta = Convert.ToInt32(Console.ReadLine());

            // Switch para validar el numero de palo
            switch(numeroPalo)
            {
                case 1:
                    nombreCarta = "Diamantes";
                    break;
                case 2:
                    nombreCarta = "Treboles";
                    break;
                case 3:
                    nombreCarta = "Corazones";
                    break;
                case 4:
                    nombreCarta = "Espadas";
                    break;
                default:
                    error = true;
                    break;
            }
            // If para validar el numero
            if(!error) // Si no hay error
            {
                if(numeroCarta < 1 || numeroCarta > 13) // Si no esta dentro del rango permitido
                {
                    error = true;
                }
                else
                {
                    // Switch para asignar el nombre de la carta
                    switch(numeroCarta)
                    {
                        case 1:
                            nombreCarta = "As de " + nombreCarta;
                            break;
                        case 11:
                            nombreCarta = "J de " + nombreCarta;
                            break;
                        case 12:
                            nombreCarta = "Q de " + nombreCarta;
                            break;
                        case 13:
                            nombreCarta = "K de " + nombreCarta;
                            break;
                        default:
                            nombreCarta = numeroCarta.ToString() + " de " + nombreCarta;
                            break;

                    }
                }
            }

            if(error) // Si hay un error
            {
                // Se debe de imprimir que la carta no existe
                Console.WriteLine("La carta no existe");
            }
            else
            {
                Console.WriteLine(nombreCarta);
            }
        }
    }
}
