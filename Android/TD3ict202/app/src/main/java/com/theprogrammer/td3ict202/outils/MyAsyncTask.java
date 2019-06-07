package com.theprogrammer.td3ict202.outils;

import android.os.AsyncTask;
import android.util.Log;

public class MyAsyncTask  extends AsyncTask {
    @Override
    protected Object doInBackground(Object[] objects) {

        Log.d("Tache Asynchrone"," Je suis exécuté ");
        return null;
    }
}
