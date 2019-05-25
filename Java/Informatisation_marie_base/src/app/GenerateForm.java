package app;
import java.sql.SQLException;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXTextField;
import com.jfoenix.validation.RequiredFieldValidator;

import controller.DataBaseOperation;
import controller.ShowHabitation;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Pos;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.image.ImageView;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.VBox;
import javafx.scene.shape.Circle;
import javafx.stage.Stage;

public class GenerateForm extends Parent {

    public GenerateForm(Stage primary) {

	this.getStylesheets().add(getClass().getResource("/resource/css/style.css").toString());

	VBox containsForm = new VBox();
	containsForm.setMinWidth(400);
	containsForm.setMaxWidth(400);
	containsForm.setSpacing(30);

	Circle circle = new Circle(33, 25, 50);
	circle.getStyleClass().add("circle");

	ImageView image = new ImageView("profil.jpg");

	image.setFitWidth(100);
	image.setFitHeight(100);

	Label title = new Label("Informatisation d'une marie");
	title.getStyleClass().add("label-title");
	JFXTextField type_habitation = generateField("Type d'habitation");
	JFXTextField nom_proprietaire = generateField("nom proprietaire");
	JFXTextField addresse_habitation = generateField("addresse de l'habitation");
	JFXTextField surface_habitation = generateField("surface habitation");

	// button

	JFXButton buttonSubmit = new JFXButton("Valider");

	buttonSubmit.getStyleClass().add("button-raised");
	buttonSubmit.getStyleClass().add("buttonSubmit");
	buttonSubmit.minWidthProperty().bind(containsForm.minWidthProperty());

	buttonSubmit.setOnAction(new EventHandler<ActionEvent>() {

	    @Override
	    public void handle(ActionEvent event) {

		DataBaseOperation dataBase = new DataBaseOperation(type_habitation, nom_proprietaire,
			addresse_habitation, surface_habitation);

		dataBase.Operate();

		// changement de scene

		BorderPane root = new BorderPane();

		Label label = new Label("TheProgrammer");

		ShowHabitation show = null;
		try {
		    show = new ShowHabitation(primary);
		} catch (SQLException e) {
		    // TODO Auto-generated catch block
		    e.printStackTrace();
		}
		root.setCenter(show);
		Scene scene2 = new Scene(root, 1000, 800);

		primary.setScene(scene2);

	    }

	});

	containsForm.getChildren().addAll(title, image, type_habitation, nom_proprietaire, addresse_habitation,
		surface_habitation, buttonSubmit);
	containsForm.setAlignment(Pos.CENTER);

	this.getChildren().add(containsForm);

    }

    public JFXTextField generateField(String namePlaceHolder) {

	JFXTextField editTextHabitation = new JFXTextField();
	editTextHabitation.setPromptText(namePlaceHolder);
	RequiredFieldValidator validator4 = new RequiredFieldValidator();
	validator4.setMessage("Input Required");

	editTextHabitation.getValidators().add(validator4);
	editTextHabitation.focusedProperty().addListener((o, oldVal, newVal) -> {
	    if (!newVal)
		editTextHabitation.validate();
	});

	editTextHabitation.getStyleClass().add("editText");

	return editTextHabitation;
    }

}
