package app;
import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.layout.BorderPane;
import javafx.stage.Stage;

public class MainApp extends Application {

    /*
     * public static void main(String[] args) throws IOException,
     * ClassNotFoundException, SQLException, InstantiationException,
     * IllegalAccessException {
     * 
     * 
     * }
     */

    @Override
    public void start(Stage primary) throws Exception {
	// TODO Auto-generated method stub

	primary.setTitle("Informatisation d'une marie");

	BorderPane root = new BorderPane();

	GenerateForm form = new GenerateForm(primary);

	root.setCenter(form);

	Scene scene = new Scene(root, 1000, 800);
	root.getStyleClass().add("rootPane");
	scene.getStylesheets().add(getClass().getResource("/resource/css/style.css").toString());

	primary.setScene(scene);
	primary.show();

    }

}
