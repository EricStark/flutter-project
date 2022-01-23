package com.example.first_flutter;

import android.os.Bundle;

import androidx.annotation.Nullable;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

import org.devio.flutter.splashscreen.SplashScreen;

public class MainActivity extends FlutterActivity {

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        SplashScreen.show(this, true);// here
        super.onCreate(savedInstanceState);
    }
}
