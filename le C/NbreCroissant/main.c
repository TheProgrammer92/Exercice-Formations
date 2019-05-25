#include <stdio.h>
#include <stdlib.h>

int decoupeMinute(int *heure,int *minute);

int main(){

 int *memoire=NULL;

 memoire=malloc(sizeof(int));

 if(memoire==NULL){

        exit(0);

    }

 printf("Entrer votre age svp");
 scanf("%d",memoire);

 printf("vous avez entrer %d",memoire);

 free(memoire);



}
