package com.example.frontend

import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
    override fun onCreate() {
    super.onCreate()
        MapKitFactory.setApiKey("aeb98243-65a8-4375-a955-759e653b7f8c")
  }
}
