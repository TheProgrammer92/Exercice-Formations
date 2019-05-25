
public class HabitationIndividuelle extends Habitation {
		
	public HabitationIndividuelle(String nom_proprietaire, String addresse_habitation, double surface_habitation) {
		super(nom_proprietaire, addresse_habitation, surface_habitation);
		// TODO Auto-generated constructor stub
	}

	private int NBPieces;
	private boolean Piscine;
	
	
	
	
	protected double Impot() {
		
		int sommeApayer= this.Piscine ? (this.NBPieces *100)+500 : (this.NBPieces*100);
		
		 double sommeAfacturer = super.getSurface_habitation() *2000;
		
		 
		 double impot = sommeAfacturer - sommeApayer;
		
		return impot;
	}
	
	protected void Affiche() {
		System.out.println("Affichage Individuelle");
		System.out.println();
		System.out.println();
		System.out.println("nom proprietaire = " + this.getNom_proprietaire());
		System.out.println("addresse = " + this.getAddresse_habitation());
		System.out.println("Surface = " + this.getSurface_habitation());
		System.out.println("Nombre de piece = " + this.NBPieces);
	} 
}



