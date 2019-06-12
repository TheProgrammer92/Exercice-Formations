package com.theprogrammer.romeoapp.outils;

import android.os.AsyncTask;
import android.util.Log;

public class MyAsyncTask  extends AsyncTask {
    @Override
    protected Object doInBackground(Object[] objects) {

        Log.d("******************"," Tache asynchrone Je suis exécuté ");
        return null;
    }
}
