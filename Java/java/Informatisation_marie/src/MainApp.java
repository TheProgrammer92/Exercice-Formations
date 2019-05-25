import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Random;
import java.util.Scanner;

public class MainApp {

	public static void main(String[] args) throws IOException {
		

		Path path = Paths.get("files/fichier");
		File file = new File("files/fichier");
		Scanner in = new Scanner(file);
		String texte;
		
	    double impotTotal = 0.0;
		double sommeImpot = 0.0;
		ArrayList<Habitation> tabTotal = new ArrayList<Habitation>();
		
		Random al = new Random(100000);
		for (int i = 0; i <10; i++) {
			
			
			
			if (i%2==0) {
				
			 
			  tabTotal.add(new HabitationProfessionnelle("TheProgrammer"+i+1, "bafoussam"+i+1, al.nextDouble()));
			}
			
			else {
			
			

			tabTotal.add(new HabitationIndividuelle("TheProgrammer"+i+1, "bafoussam"+i+1, al.nextDouble()));

				
			}
		}
		
		
		for (Habitation habitation : tabTotal) {
			
			impotTotal += habitation.Impot();
		}
		
		
		System.out.println("impot total = " + impotTotal);
		
	
		
		
		
		
	}

}
