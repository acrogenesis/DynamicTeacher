using System;

namespace Arreglos2Dimension
{
  class MainClass
  {
    // Imprime en formato de matrices
    void ImprimeMatrices(int [,] matriz)
    {
      for (int i = 0; i < matriz.GetLength (0); i++)
      {
        for (int j = 0; j < matriz.GetLength (1); j++)
        {
          Console.Write(matriz[i, j] + " ");
        }

        Console.WriteLine();
      }
    }

    // Lee los elementos de la matriz
    void LeeMatriz(int [,] matriz)
    {
      for (int i = 0; i < matriz.GetLength (0); i++)
      {
        for (int k = 0; k < matriz.GetLength (1); k++)
        {
          matriz [i, k] = Convert.ToInt32 (Console.ReadLine ());
        }
      }

    }
    // Suma dos matrices de igual tamano
    void SumaMatrices (int[,] matriz1, int[,] matriz2, int [,] resultado)
    {
      for (int i = 0; i < resultado.GetLength (0); i++)
      {
        for (int j = 0; j < resultado.GetLength (1); j++)
        {
          resultado [i, j] = matriz1[i,j] + matriz2[i,j];
        }
      }
    }
    public static void Main (string[] args)
    {
      int filas;
      int columnas;
      int[,] matriz1;
      int[,] matriz2;
      int[,] resultado;

      MainClass p = new MainClass();
      Console.WriteLine ("Numero de filas: ");
      filas = Convert.ToInt32 (Console.ReadLine());
      Console.WriteLine ("Numero de columnas: ");
      columnas = Convert.ToInt32 (Console.ReadLine());

      // Se crea la matriz 1
      matriz1 = new int[filas,columnas];
      // Se crea la matriz 2
      matriz2 = new int[filas,columnas];
      // Se crea el arreglo para el resultado
      resultado = new int[filas,columnas];

      // Se manda a leer la matriz 1
      Console.WriteLine ("Ingresa los valores de la primer matriz");
      p.LeeMatriz (matriz1);

      // Se manda a leer la matriz 2
      Console.WriteLine ("Ingresa los valores de la segunda matriz");
      p.LeeMatriz (matriz2);

      // Se mandan a sumar las matrices
      p.SumaMatrices (matriz1, matriz2, resultado);

      // Se despliega el resultado
      Console.WriteLine ("La operacion y resultado es: ");
      p.ImprimeMatrices (matriz1);
      Console.WriteLine (" + ");
      p.ImprimeMatrices (matriz2);
      Console.WriteLine (" = ");
      p.ImprimeMatrices (resultado);
    }
  }
}
