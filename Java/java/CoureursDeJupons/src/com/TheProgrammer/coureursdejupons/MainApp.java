package com.TheProgrammer.coureursdejupons;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.stage.Stage;

public class MainApp extends Application {


	

	public void start(Stage primaryStage) throws Exception {
		
		// TODO Auto-generated method stub
	    
	    Parent root = FXMLLoader.load(getClass().getResource("/resources/xml/Main.fxml"));
	    
	    primaryStage.setTitle("The womanize Best Friend");
	    
	    Scene scene = new Scene(root);
	    
	    primaryStage.setScene(scene);
	    primaryStage.setResizable(false);
	    primaryStage.show();
	}
	
	public static void main(String[] args) {
		
		launch(args);
	}

}
