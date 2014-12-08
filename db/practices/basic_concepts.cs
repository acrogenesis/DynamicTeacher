// Ejercicio 1 Conceptos Basicos

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConceptosBasicos
{
    class Programa
    {
        static void Main(string[] args)
        {
            int pesos;
            double dolares;
            double tipoDeCambio;

            tipoDeCambio = 13.618783;

            Console.Write("Dame la cantidad en pesos: ");
            pesos = Convert.ToInt32(Console.ReadLine());
            dolares = pesos / tipoDeCambio;

            Console.WriteLine("La cantidad de " + pesos + " pesos son: " + dolares + " dolares.");
           // Console.ReadKey();
        }
    }
}
