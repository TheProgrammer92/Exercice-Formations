package app;

public class HabitationProfessionnelle extends Habitation {

    private int NbEmployes;

    public HabitationProfessionnelle(String nom_proprietaire, String addresse_habitation, double surface_habitation) {
	super(nom_proprietaire, addresse_habitation, surface_habitation);
	// TODO Auto-generated constructor stub
    }

    protected double Impot() {
	// determination, de la somme a payer, a parti du nombre d'employ�, la regle de
	// 3

	double sommeApayer = (this.NbEmployes * 1000) / 10;

	// dermination de la somme a facturer 200f par m carr�
	double sommeAfacturer = super.getSurface_habitation() * 2000;

	double Impot = sommeAfacturer - sommeApayer;

	return Impot;

    }

    protected void Affiche() {

	System.out.println("Affichage habitation Professionnel");
	System.out.println();
	System.out.println();

	System.out.println("nombre employe = " + this.NbEmployes);

	System.out.println("Addresse  = " + super.getAddresse_habitation());
	System.out.println("Surface = " + super.getSurface_habitation());

    }
}
