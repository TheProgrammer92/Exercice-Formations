import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class MainApp {

	@SuppressWarnings("deprecation")
	public static void main(String[] args) throws IOException, ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException {
		
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		String url = "jdbc:mysql://localhost/informatisation_marie?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
		//localhost/db?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC
		try( Connection connexion = DriverManager.getConnection(url,"root","")) {
			
			
			String strSql = "INSERT INTO theprogrammer VALUES (5,'theprogrammer','addresse_habitaition',1358.5)";
			
//			try(Statement statement = connexion.createStatement()) {
//				
//				statement.executeUpdate(strSql);
//			}
			
			String querySql = "SELECT * from theprogrammer";
			
			try(Statement statement = connexion.createStatement()) {
				
				try( ResultSet resultSet = statement.executeQuery(querySql)) {
					
					while(resultSet.next()) {
						
						int id = resultSet.getInt("id");
						String nom_proprietaire = resultSet.getString("nom_proprietaire");
						String addresse_habitation = resultSet.getString("addresse_habitation");
						float surface_habitation = resultSet.getFloat("surface_habitation");
						
						
						
						System.out.printf("%d : %s %s - %f \n",id,nom_proprietaire,addresse_habitation,surface_habitation);
;						
					}
				}
				
				
				
				
			}
		}
		
		
		
		
		
		
		
		
		
		
		/*Path path = Paths.get("files/fichier");
		File file = new File("files/fichier");
		Scanner in = new Scanner(file);
	
		String texte="";
		
		double impot = 0;
	
		   Files.write(path, texte.getBytes());

		for (int i = 0; i <10; i++) {
			
			
			
			if (i%2==0) {
				Random al = new Random();

			   texte= "professionnel \t"+ "TheProgrammer" +i+ "\t"+ " bafoussam"+(i+1)+" \t" + al.nextInt(55555) +"\n";
			   Files.write(path, texte.getBytes(),StandardOpenOption.CREATE,StandardOpenOption.WRITE,StandardOpenOption.APPEND);
			}
			
			else {
				Random al = new Random(10000);

				  texte= "professionnel \t"+ "TheProgrammer" +i+ "\t"+ " bafoussam"+(i+1)+" \t" + al.nextInt(55555) +"\n";
			   Files.write(path, texte.getBytes(),StandardOpenOption.CREATE,StandardOpenOption.WRITE,StandardOpenOption.APPEND);


				
			}
		}
		
		
		while(in.hasNextLine()) {
			
			String line = in.nextLine();
			
			String[] l=line.split(" ");
			impot += Double.parseDouble(l[3]);
			System.out.println(line);
			
			
		}
		
		System.out.println("l 'impot total = " + impot);*/
	
		
		
		
		
	}

}
