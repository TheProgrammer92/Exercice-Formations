package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.jfoenix.controls.JFXTextField;

public class DataBaseOperation {
 
    
    private String type;
    private String _nom_proprietaire;
    private String _addresse_habitation;
    private String _surface_habitation;
    
    public DataBaseOperation(JFXTextField type_habitation, JFXTextField nom_proprietaire, JFXTextField addresse_habitation, JFXTextField surface_habitation) {
	
	       type = type_habitation.getText();
	       _nom_proprietaire = nom_proprietaire.getText();
	       _addresse_habitation = addresse_habitation.getText();
	       _surface_habitation = surface_habitation.getText();
	
    }
    
    
    public void Operate() {
	

		try {
		    Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
		    // TODO Auto-generated catch block
		    e1.printStackTrace();
		}
		
		String url = "jdbc:mysql://localhost/informatisation_marie?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
		try( Connection connexion = DriverManager.getConnection(url,"root","")) {
	
			
		
			String texte="";
			
			
			
			
		       Float surface=Float.parseFloat(_surface_habitation);
	              generateQuery(type,_nom_proprietaire,_addresse_habitation,surface,connexion);
				      
				
	
			
			
			
			//affichage des information
			
			
			
		
		} catch (SQLException e) {
		    // TODO Auto-generated catch block
		    e.printStackTrace();
		}
		
    }
    
        public void generateQuery(String type,String nom_proprietaire, String addresse_habitation,Float surface_habitation,Connection connexion) throws SQLException {
    	
	    

	  
	
		String strSql ="INSERT INTO theprogrammer (type_habitation,nom_proprietaire,addresse_habitation,surface_habitation)"+ 
			"VALUES ('"+type.toString()+"','"+nom_proprietaire.toString()+"', '"+addresse_habitation.toString()+"' ,"+surface_habitation+")";
		
		try(Statement statement = connexion.createStatement()) {
		    
		    statement.executeUpdate(strSql);
		    
		    
		}
		
		
    }
}
