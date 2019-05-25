package com.theprogrammer.megagame;

import android.content.DialogInterface;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ProgressBar;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    private EditText txtNumber;
    private Button  btnCompare;
    private TextView lblResult;
    private ProgressBar pgbScore;
    private TextView lblHistory;


    private int searchedValue;
    private int score;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        txtNumber = findViewById(R.id.txtNumber);
        btnCompare = findViewById(R.id.btnCompare);
        lblResult = findViewById(R.id.lblResult);
        lblHistory = findViewById(R.id.lblHistory);
        pgbScore = findViewById(R.id.pgbScore);

        btnCompare.setOnClickListener(btnCompareListener);
        init();
    }

    private void init() {

        score =0;
        searchedValue = 1 + (int) (Math.random() * 100);
        Log.i("DEBUG","Valeur cherchée: " + searchedValue);

        txtNumber.setText("");
        pgbScore.setProgress(score);
        lblResult.setText("");
        lblHistory.setText("");


        txtNumber.requestFocus();

    }



    private View.OnClickListener btnCompareListener;

    {
        btnCompareListener = new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Log.i("Debug", "Boutton cliqué");

                String textNumber = txtNumber.getText().toString();


                if (textNumber.equals("")) {
                    return;
                }

                lblHistory.append(txtNumber + "\r\n");
                pgbScore.incrementProgressBy(1);
                score++;


                int enteredValue = Integer.parseInt(textNumber);

                if (enteredValue == searchedValue) {
                    congratulation();
                } else if (enteredValue < searchedValue) {
                    lblResult.setText(getString(R.string.strSuperieur));
                } else {
                    lblResult.setText(getString(R.string.strInferieur));
                }
            }

            private void congratulation() {

              /*  lblResult.setText("Feliciation");

                AlertDialog retryAlert = new AlertDialog.Builder(this).create();
                retryAlert.setTitle(R.string.app_name);
                retryAlert.setMessage(getString(score, getString(R.string.strResult)));
                retryAlert.setButton(AlertDialog.BUTTON_POSITIVE,"Ok", new AlertDialog.OnClickListener() {


                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        init();

                    }
                });

                retryAlert.setButton(AlertDialog.BUTTON_NEGATIVE,"NON",new AlertDialog.OnClickListener() {


                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        finish();

                    }
                });

                retryAlert.show();
            }
        };
    }
}
