using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

// Ejercicio 23 Condiciones if
namespace CondicionesIf
{
    class Programa
    {
        double evaluaFuncion (double x)
        {
            double resultado;
            if(x < -2.0)
            {
                resultado = 2 * Math.Pow(x, 2.0) + 4 * x + 2; // o bien:  2 * x * x + 4 * x + 2;

            }
            else if(x >= 0)
            {
                resultado = 3 * x + 1;
            }
            else
            {
                // Por omision, la evaluacion de la funcion debe ser 2
                resultado = 2;
            }

            return resultado;
        }

        static void Main(string[] args)
        {
            double x; // Variable donde se almacenara el valor para hacer la evaluacion
            double funcionEvaluada; // Variable donde se almacenara el resultado de la evaluacion
            Programa p = new Programa();

            // Se lee el valor de 'x' para evalular la funcion
            Console.WriteLine("Ingresa el valor de x para evaluar la funcion:");
            x = Convert.ToDouble(Console.ReadLine());

            // Se manda el valor 'x' al metodo evaluaFuncion
            funcionEvaluada = p.evaluaFuncion(x);

            // Se imprime el resultado
            Console.WriteLine("El resultado de la funcion evaluada es: " + funcionEvaluada);

            Console.ReadKey();

        }
    }
}
