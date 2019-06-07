package com.theprogrammer.td3ict202;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;

import com.theprogrammer.td3ict202.outils.MyAsyncTask;

import java.util.Timer;
import java.util.TimerTask;

public class MainActivity extends AppCompatActivity {

    Intent intent = new Intent(MainActivity.this, MainService.class);
    MyAsyncTask myTask  = new MyAsyncTask();


// schedule timer


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Log.d("MainActivity", "Création de l'activité");

        myTask.execute();

        startService(intent);

    }




    @Override
    protected void onDestroy() {
        super.onDestroy();



    }
}
