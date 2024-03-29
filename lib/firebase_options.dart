// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAJdR3vSz9V8ot5A84YKvw1_M9AHCAxBsE',
    appId: '1:476776498617:web:cff406d6f22a17e163a268',
    messagingSenderId: '476776498617',
    projectId: 'frist-app-in-flutter',
    authDomain: 'frist-app-in-flutter.firebaseapp.com',
    storageBucket: 'frist-app-in-flutter.appspot.com',
    measurementId: 'G-QHHCW8DPSQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDHucwLAjwV_K83-CUpqaFig0gMZCWtus4',
    appId: '1:476776498617:android:d570d1c1e8e2f6b063a268',
    messagingSenderId: '476776498617',
    projectId: 'frist-app-in-flutter',
    storageBucket: 'frist-app-in-flutter.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBIdzBLrfzGapoJSxsDq7jphWQczgOGs4E',
    appId: '1:476776498617:ios:9ef05d8c6f8a786e63a268',
    messagingSenderId: '476776498617',
    projectId: 'frist-app-in-flutter',
    storageBucket: 'frist-app-in-flutter.appspot.com',
    iosBundleId: 'com.example.fristApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBIdzBLrfzGapoJSxsDq7jphWQczgOGs4E',
    appId: '1:476776498617:ios:49fbff906672450363a268',
    messagingSenderId: '476776498617',
    projectId: 'frist-app-in-flutter',
    storageBucket: 'frist-app-in-flutter.appspot.com',
    iosBundleId: 'com.example.fristApp.RunnerTests',
  );
}
