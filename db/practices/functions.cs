// Ejercicio 18 Funciones o Metodos
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Funciones
{
    class Programa
    {
        double CalculaArea (double A, double B, double C)
        {
            double area;
            double s; // semiperimetro

            s = (A + B + C)/2.0;

            area = Math.Sqrt(s * (s - A) * (s - B) * (s - C) );

            return area;
        }
        static void Main(string[] args) // aqui tambien le ponen public static...
        {
            double area;
            double costo;
            double A, B, C;
            const double precioRollo = 40.0;
            Programa p = new Programa(); // Para poder utilizar el metodo Calcula

            // Se piden los lados
            Console.Write("Lado A: ");
            A = Convert.ToDouble(Console.ReadLine());
            Console.Write("Lado B: ");
            B = Convert.ToDouble(Console.ReadLine());
            Console.Write("Lado C: ");
            C = Convert.ToDouble(Console.ReadLine());

            // Se mandan los lados a la funcion/metodo y el resultado se guarda en area
            area = p.CalculaArea(A, B, C);
            // Se calcula el costo
            costo = precioRollo * area;

            // Se limitan los decimales, en este caso 2 decimales para darle formato
            area = Math.Round(area, 2);
            costo = Math.Round(costo, 2);

            //Se imprime el resultado
            Console.WriteLine("El area del parque es: " + area + " metros cuadrados, a $" + precioRollo + " el pasto en rollo, son $" + costo + " pesos." );
        }

    }
}
