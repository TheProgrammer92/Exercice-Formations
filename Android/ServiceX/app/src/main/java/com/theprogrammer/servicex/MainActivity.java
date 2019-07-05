package com.theprogrammer.servicex;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class MainActivity extends AppCompatActivity {


    Button btn_login;
    Intent intent_goToService;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);


        btn_login = findViewById(R.id.btn_login);
        btn_login.setOnClickListener(click_btn_login_listener);

    }

    View.OnClickListener click_btn_login_listener = new View.OnClickListener() {
        @Override
        public void onClick(View v) {

            intent_goToService = new Intent(MainActivity.this,ServiceActivity.class);
            startActivity(intent_goToService);
        }
    };
}
