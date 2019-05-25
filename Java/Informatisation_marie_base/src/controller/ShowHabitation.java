package controller;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXTextField;
import com.jfoenix.controls.JFXTreeTableColumn;
import com.jfoenix.controls.JFXTreeTableView;
import com.jfoenix.controls.RecursiveTreeItem;
import com.jfoenix.controls.datamodels.treetable.RecursiveTreeObject;

import app.GenerateForm;
import javafx.beans.binding.Bindings;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.StringProperty;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Pos;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.control.TreeItem;
import javafx.scene.control.TreeTableColumn;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

public class ShowHabitation extends Parent {
    
    @SuppressWarnings("unchecked")
    public ShowHabitation(Stage primary) throws SQLException {
	JFXTreeTableColumn<User, String> idColumn = new JFXTreeTableColumn<>("id");
	idColumn.setPrefWidth(150);
	idColumn.setCellValueFactory((TreeTableColumn.CellDataFeatures<User, String> param) ->{
	    if(idColumn.validateValue(param)) return param.getValue().getValue().id;
	    else return idColumn.getComputedValue(param);
	});
	
	JFXTreeTableColumn<User, String> typeColumn = new JFXTreeTableColumn<>("type");
	typeColumn.setPrefWidth(150);
	typeColumn.setCellValueFactory((TreeTableColumn.CellDataFeatures<User, String> param) ->{
	    if(typeColumn.validateValue(param)) return param.getValue().getValue().type;
	    else return typeColumn.getComputedValue(param);
	});
	
	 
	JFXTreeTableColumn<User, String> nomColumn = new JFXTreeTableColumn<>("nom proprietaire");
	nomColumn.setPrefWidth(150);
	nomColumn.setCellValueFactory((TreeTableColumn.CellDataFeatures<User, String> param) ->{
	    if(nomColumn.validateValue(param)) return param.getValue().getValue().nom_proprietaire;
	    else return nomColumn.getComputedValue(param);
	});
	
	
	JFXTreeTableColumn<User, String> addressColumn = new JFXTreeTableColumn<>("nom proprietaire");
	addressColumn.setPrefWidth(150);
	addressColumn.setCellValueFactory((TreeTableColumn.CellDataFeatures<User, String> param) ->{
	    if(addressColumn.validateValue(param)) return param.getValue().getValue().addresse_habitation;
	    else return addressColumn.getComputedValue(param);
	});
	
	
	
	
	JFXTreeTableColumn<User, String> surfaceColumn = new JFXTreeTableColumn<>("addresse");
	surfaceColumn.setPrefWidth(150);
	
	surfaceColumn.setCellValueFactory((TreeTableColumn.CellDataFeatures<User, String> param) ->{
	    if(surfaceColumn.validateValue(param)) {
		return param.getValue().getValue().surface_habitation;
	    }
	    else return surfaceColumn.getComputedValue(param);
	});
	
	
	
	// data
	ObservableList<User> users = FXCollections.observableArrayList();
	String strShow = "SELECT *  FROM theprogrammer";
	
	Double impotTotal=1.0;

	String url = "jdbc:mysql://localhost/informatisation_marie?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	try( Connection connexion = DriverManager.getConnection(url,"root","")) {

		
	try(Statement statement = connexion.createStatement()) {
	    
	     
	    try( ResultSet resultSet = statement.executeQuery(strShow)) {
		
		
		
		while(resultSet.next()) {
		    
		     int id = resultSet.getInt("id");
		     String _type= resultSet.getString("type_habitation");
		     String _proprietaire = resultSet.getString("nom_proprietaire");
		     String _addresse = resultSet.getString("addresse_habitation");
		     Double _surface = resultSet.getDouble("surface_habitation");
		     
		     
		     System.out.println("affichage" + id+ " " + _type +" " + _proprietaire +" " + _addresse + " " + _surface);
		     
		     
		     
		
		     
		     users.add(new User(" " + id,_type,_proprietaire,_addresse,"" + _surface));
		     
		     impotTotal += _surface;
		   
		     
		     
		     
		     System.out.printf("%d  %s  %s  %s  %f \n",id,_type,_proprietaire,_addresse,_surface);
		   
		     
		}
		
		
		System.out.println();
		
		System.out.println("l'impot total = " + impotTotal);
	    }
	     
	    
	    
	 // build tree
		final TreeItem<User> root = new RecursiveTreeItem<User>(users, RecursiveTreeObject::getChildren);
		 
		JFXTreeTableView<User> treeView = new JFXTreeTableView<User>(root);
		treeView.setShowRoot(false);
		treeView.setEditable(true);
		treeView.getColumns().setAll(idColumn, typeColumn, nomColumn,addressColumn,surfaceColumn);
		 
		treeView.setMinWidth(700);
		treeView.setMinHeight(650);
		Label size = new Label("Information marie");
		size.textProperty().bind(Bindings.createStringBinding(()->treeView.getCurrentItemsCount()+"",
		                treeView.currentItemsCountProperty()));
		
		
		JFXTextField filterField = new JFXTextField();
		filterField.textProperty().addListener((o,oldVal,newVal)->{
		    treeView.setPredicate(user -> user.getValue().id.get().contains(newVal)
			    || user.getValue().type.get().contains(newVal)
			    || user.getValue().nom_proprietaire.get().contains(newVal)
		            || user.getValue().addresse_habitation.get().contains(newVal)
		            || user.getValue().surface_habitation.get().contains(newVal));
		});
		 
		VBox vbox = new VBox();
		HBox hbox = new HBox();
		JFXButton btnRetour = new JFXButton("Retour");
		
		btnRetour.setOnAction(new EventHandler<ActionEvent>() {
		    
		    @Override
		    public void handle(ActionEvent event) {
			
			
			    BorderPane root = new BorderPane();
			    
			    
			    GenerateForm form = new GenerateForm(primary);

			    
			    
			    
			      root.setCenter(form);

			      
			      
			      
			      Scene scene= new Scene(root,1000,800);
			      root.getStyleClass().add("rootPane");
			      scene.getStylesheets().add(getClass().getResource("/resource/css/style.css").toString());

			      
			      primary.setScene(scene);
			     
			
		    }
		});
		Label title = new Label("Affiche des information");
		title.setAlignment(Pos.CENTER);
		title.setStyle("-fx-font-size:15px");
		vbox.setSpacing(10);
		hbox.setSpacing(20);
		hbox.getChildren().addAll(size,filterField);
		vbox.getChildren().addAll(title ,hbox,treeView,btnRetour);
		
		
		
		this.getChildren().addAll(vbox);
	    
	    
        	} catch (SQLException e) {
        	    // TODO Auto-generated catch block
        	    e.printStackTrace();
        	}
	 
	}
	 
	
    }
    
   class User extends RecursiveTreeObject<User>{
       	    StringProperty id;
	    StringProperty type;
	    StringProperty nom_proprietaire;
	    StringProperty addresse_habitation;
	    StringProperty surface_habitation;
	 
	    public User(String id,String type,String nom_proprietaire, String addresse_habitation,String surface_habitation ) {
	        this.id = new SimpleStringProperty(id);
		this.type = new SimpleStringProperty(type) ;
	        this.nom_proprietaire = new SimpleStringProperty(nom_proprietaire);
	        this.addresse_habitation = new SimpleStringProperty(addresse_habitation);
	        this.surface_habitation = new SimpleStringProperty(surface_habitation);
	    }
	}

}
