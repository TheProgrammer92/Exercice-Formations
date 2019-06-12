package com.theprogrammer.td3ict202;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.ToggleButton;

import com.theprogrammer.td3ict202.outils.MyAsyncTask;

import java.util.Timer;
import java.util.TimerTask;

public class MainActivity extends AppCompatActivity {

    Intent intent;
    MyAsyncTask myTask;


    RadioGroup rdG;
    int countBtnPressed;
    TextView txtStatus ;
    TextView txtAlert;
    TextView txtResult;

    ToggleButton toggleBtn;

  // schedule timer

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView(R.layout.activity_main);
    intent = new Intent(MainActivity.this, MainService.class);
    Log.d("MainActivity", "Création de l'activité");
    // initialize componnents
    init();
    MyAsyncTask myTask = new MyAsyncTask();
    myTask.execute();

    toggleBtn = findViewById(R.id.toggleButton);

    toggleBtn.setOnCheckedChangeListener(onCheckListener);


        }

    private void init() {

        txtStatus = findViewById(R.id.txtStatus);
        txtAlert = findViewById(R.id.txtAlert);
        txtResult  = findViewById(R.id.txtResult);
    }


    ToggleButton.OnCheckedChangeListener onCheckListener = new CompoundButton.OnCheckedChangeListener() {
        @Override
        public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
            if (isChecked) {
                txtStatus.setText("En Cours");
                startService(intent);

            }
             else {
                txtStatus.setText("Arreté");
                stopService(intent);
            }
        }
    };


    @Override
    protected void onDestroy() {
        super.onDestroy();



    }
}
