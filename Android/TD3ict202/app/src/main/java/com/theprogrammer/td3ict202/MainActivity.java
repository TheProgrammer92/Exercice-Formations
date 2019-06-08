package com.theprogrammer.td3ict202;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.widget.CheckBox;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;
import android.widget.Toast;

import com.theprogrammer.td3ict202.outils.MyAsyncTask;

import java.util.Timer;
import java.util.TimerTask;

public class MainActivity extends AppCompatActivity {

    Intent intent;
    MyAsyncTask myTask  = new MyAsyncTask();


    RadioGroup rdG;
    int countBtnPressed;
    TextView txtStatus ;
    TextView txtAlert;
    TextView txtResult;


// schedule timer


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        intent = new Intent(MainActivity.this, MainService.class);
        Log.d("MainActivity", "Création de l'activité");
        //initialize componnents
        init();
        myTask.execute();

        rdG = findViewById(R.id.rdG);
        rdG.setOnCheckedChangeListener(onCheckListener);


    }

    private void init() {

        txtStatus = findViewById(R.id.txtStatus);
        txtAlert = findViewById(R.id.txtAlert);
        txtResult  = findViewById(R.id.txtResult);
    }

    RadioGroup.OnCheckedChangeListener onCheckListener;

    {
        onCheckListener = new RadioGroup.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(RadioGroup group, int checkedId) {
                RadioButton rb = (RadioButton) findViewById(checkedId);

                if (rb == (RadioButton) findViewById(R.id.rdOn)) {
                    txtStatus.setText("En Cours");
                    startService(intent);

                } else if (rb == (RadioButton) findViewById(R.id.rdOff)) {
                    txtStatus.setText("Arrété");
                    stopService(intent);

                }
            }

        };
    }


    @Override
    protected void onDestroy() {
        super.onDestroy();



    }
}
