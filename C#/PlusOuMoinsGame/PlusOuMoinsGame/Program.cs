using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PlusOuMoinsGame
{
    class Program
    {
        static void Main(string[] args)
        {
             int aleatoire = 0;
             string userNumber;
             bool convetUsernUmber;
             int integer = -5;
            System.Random rand = new System.Random();

            aleatoire =rand.Next(101);
            Console.WriteLine("heee le jeu comment, entrez un nombre");
     
                do
                {

                    Console.WriteLine("Entrez un nombre");
                    userNumber = Console.ReadLine();
                    convetUsernUmber = int.TryParse(userNumber, out integer);


                    if(integer>=0 && integer<=100)
                    {
                        if(integer == aleatoire)
                        {

                            Console.WriteLine("Vous avez gagné, il es le meme");
                        Console.ReadLine();

                        }
                        else
                    {
                    
                        if(aleatoire > integer)
                        {
                            Console.WriteLine("vous ete proche, il es superieur");
                        }

                        else
                        {
                            Console.WriteLine("Vous n'etes pas proche il es inferieur");
                        }

                    }

                    }   
                    else
                    {

                        Console.WriteLine("Vous devez entrez un nombre entre 0 et 100");
                        continue;
                    }

                } while (integer != aleatoire);
       


          
        }
    }
}
