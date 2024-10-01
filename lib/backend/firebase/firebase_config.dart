import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyB_bmmhcx-SC-llSBuvZ5xlxrvoxovyMDA",
            authDomain: "cloud-function-8b9cc.firebaseapp.com",
            projectId: "cloud-function-8b9cc",
            storageBucket: "cloud-function-8b9cc.appspot.com",
            messagingSenderId: "471375048323",
            appId: "1:471375048323:web:4f30389b93eaa4e9a675b6",
            measurementId: "G-4PD498RJHH"));
  } else {
    await Firebase.initializeApp();
  }
}
