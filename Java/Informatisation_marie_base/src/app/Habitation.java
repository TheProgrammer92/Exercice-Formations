package app;

public class Habitation {

    private String nom_proprietaire;
    private String addresse_habitation;
    private double surface_habitation;

    public Habitation(String nom_proprietaire, String addresse_habitation, double surface_habitation) {
	super();
	this.nom_proprietaire = nom_proprietaire;
	this.addresse_habitation = addresse_habitation;
	this.surface_habitation = surface_habitation;
    }

    protected double Impot() {

	return surface_habitation;

    }

    protected void Affiche() {

	System.out.println("nom  propietaire = " + getNom_proprietaire());
	System.out.println("addresse habitation = " + getAddresse_habitation());
	System.out.println("surface habitation = " + getSurface_habitation());

    }

    public String getNom_proprietaire() {
	return nom_proprietaire;
    }

    public void setNom_proprietaire(String nom_proprietaire) {
	this.nom_proprietaire = nom_proprietaire;
    }

    public String getAddresse_habitation() {
	return addresse_habitation;
    }

    public void setAddresse_habitation(String addresse_habitation) {
	this.addresse_habitation = addresse_habitation;
    }

    public double getSurface_habitation() {
	return surface_habitation;
    }

    public void setSurface_habitation(double surface_habitation) {
	this.surface_habitation = surface_habitation;
    }

}
