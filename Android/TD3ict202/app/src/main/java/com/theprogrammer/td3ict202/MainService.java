package com.theprogrammer.td3ict202;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import android.util.Log;

import java.util.Timer;
import java.util.TimerTask;

public class MainService extends Service {



    Timer timer = new Timer();

    TimerTask myTimerTask = new TimerTask() {

        @Override
        public void run() {
            // ...

            Log.d("TimeTask Log","Salut, TheProgrammer My Time est lancé");
        }

        };


    public MainService() {
    }

    @Override
    public void onCreate() {

        timer.schedule(myTimerTask, 3000);
    }

    @Override
    public IBinder onBind(Intent intent) {
        // TODO: Return the communication channel to the service.
        throw new UnsupportedOperationException("Not yet implemented");
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        return START_STICKY;
    }

    @Override
    public void onDestroy() {
        myTimerTask.cancel();

        super.onDestroy();

    }
}
