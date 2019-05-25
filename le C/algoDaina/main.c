#include <stdio.h>
#include <stdlib.h>

int main()
{
    int N,i,tab[100]={0,0};

    printf("Entrer un entier");
    scanf("%d",&N);



    for(i=N;i>=1;i--){


        if((i%2)!=0){

             printf("%d  ",i);

        }


    }



}
