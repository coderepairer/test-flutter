import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAYrUNrsJ0Y0WxWJ4P9LUMFnL_UifXRxEw",
            authDomain: "test-d79ee.firebaseapp.com",
            projectId: "test-d79ee",
            storageBucket: "test-d79ee.appspot.com",
            messagingSenderId: "288407022866",
            appId: "1:288407022866:web:2d593aae1ba98f9b8217cb"));
  } else {
    await Firebase.initializeApp();
  }
}
