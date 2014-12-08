// Ejercicio 52: Arreglos
using System;

namespace Arreglos1Dimension
{
  class MainClass
  {
    void LeeArreglo (int [] arreglo)
    {
      Console.WriteLine ("Dime los elementos del arreglo");
      for(int i = 0; i < arreglo.Length; i++)
      {
        // Se llena el arreglo con los valores ingresados
        Console.Write ("Elemento " + i + ": ");
        arreglo [i] = Convert.ToInt32 (Console.ReadLine());
      }
    }
    void DespliegaAsteriscos(int [] arreglo)
    {
      // For para poder leer todos los elementos del arreglo
      for (int i = 0; i < arreglo.Length; i++) {
        // For para leer el numero del arreglo e imprimir los asteriscos
        for (int k = 0; k < arreglo [i]; k++) {
          Console.Write ("*");
        }
        Console.WriteLine ();
      }
    }
    public static void Main (string[] args)
    {
      MainClass p = new MainClass ();
      int[] arreglo; // Arreglo de numeros
      int tamanoArreglo; // Variable donde se almacena el tamano del arreglo

      Console.WriteLine ("Dime el numero de elementos del arreglo");
      tamanoArreglo = Convert.ToInt32(Console.ReadLine ());

      // Se le asigna el tamano al arreglo
      arreglo = new int[tamanoArreglo];
      // Se mandan el arreglo y el su tamano para llenarlo
      p.LeeArreglo (arreglo);
      // Se manda el arreglo para desplegar los asteriscos
      p.DespliegaAsteriscos (arreglo);

    }
  }
}
