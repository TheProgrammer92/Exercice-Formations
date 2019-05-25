

typedef struct Element Element;

struct Element
{

    int nombre;

    Element *suivant;

};

typedef struct Pile Pile;
struct Pile
{
    Element *premier;
};


void empiler(Pile *pile,int nvNombre){

    Element *nouveau=malloc(sizeof(*nouveau));

    if(nouveau==NULL){



        exit(EXIT_FAILURE);
    }

    nouveau->nombre=nvNombre;
    nouveau->suivant=pile->premier;

    pile->premier=nouveau;




}

int depiler(Pile *pile)

{

    if (pile == NULL)

    {

        exit(EXIT_FAILURE);

    }


    int nombreDepile = 0;

    Element *elementDepile = pile->premier;


    if (pile != NULL && pile->premier != NULL)

    {

        nombreDepile = elementDepile->nombre;

        pile->premier = elementDepile->suivant;

        free(elementDepile);

    }


    return nombreDepile;

}

void afficherPile(Pile *pile)
{
    if (pile == NULL)
    {
        exit(EXIT_FAILURE);
    }
    Element *actuel = pile->premier;

    while (actuel != NULL)
    {
        printf("%d\n", actuel->nombre);
        actuel = actuel->suivant;
    }

    printf("\n");
}
Pile *initialisation(){

  Pile *liste=malloc(sizeof(*liste));
  Element *element=malloc(sizeof(*element));


  if(element==NULL || liste==NULL){

    exit(EXIT_FAILURE);
  }

  element->nombre=0;
  element->suivant=NULL;
  liste->premier=element;

  }
