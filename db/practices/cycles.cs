// Ejercicio 33: CuantosDigitos
using System;

namespace CuantosDigitos
{
  class MainClass
  {
    int cantDigitos(int numero)
    {
      int contador; // Servira para almacenar la cantidad de digitos
      // Se hace un ciclo que inicia con un contador igual a cero.
      for(contador = 0; numero > 0; contador++)
      {
        // Se divide el numero recibido entre 10 para ir quitandole los digitos ya contabilizados
        numero /= 10;
      }
      return contador;
    }
    public static void Main (string[] args)
    {
      MainClass p = new MainClass();
      int numero; // Variable donde se recibira el numero para contabilizar sus digitos
      int digitos; // Variable donde se guardara la cantidad de digitos de la variable 'numero'

      Console.WriteLine ("Dame un numero:");
      numero = Convert.ToInt32(Console.ReadLine ());

      digitos = p.cantDigitos (numero);

      Console.WriteLine ("La cantidad de digitos es: " + digitos);
    }
  }
}
