package com.theprogrammer.romeoapp;

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


import com.theprogrammer.romeoapp.outils.MyAsyncTask;

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
        rdG = findViewById(R.id.rdG);


        rdG.setOnCheckedChangeListener(onCheckedChangeListeners);


    }

    private void init() {

        txtStatus = findViewById(R.id.txtStatus);
        txtAlert = findViewById(R.id.txtAlert);
        txtResult  = findViewById(R.id.txtResult);
    }


   RadioGroup.OnCheckedChangeListener onCheckedChangeListeners = new RadioGroup.OnCheckedChangeListener() {
        @Override
        public void onCheckedChanged(RadioGroup group, int checkedId) {

            if((R.id.btnOff) == checkedId) {

                txtStatus.setText("Arreté");
                Toast.makeText(MainActivity.this,"Service stopped", Toast.LENGTH_SHORT).show();

                stopService(intent);
            }
            else {
                txtStatus.setText("En Cours");
                Toast.makeText(MainActivity.this, "Service start", Toast.LENGTH_SHORT).show();

                startService(intent);
            }
        }
    };



    @Override
    protected void onDestroy() {
        super.onDestroy();



    }
}
