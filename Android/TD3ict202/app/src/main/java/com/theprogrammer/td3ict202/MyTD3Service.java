package com.theprogrammer.td3ict202;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;

public class MyTD3Service extends Service {
    public MyTD3Service() {
    }

    @Override
    public IBinder onBind(Intent intent) {
        // TODO: Return the communication channel to the service.
        throw new UnsupportedOperationException("Not yet implemented");
    }
}
