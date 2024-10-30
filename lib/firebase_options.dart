// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyDC_s3Z5LJmMqZsEx_LUS-xjNseM35k_bc',
    appId: '1:46664717586:web:b23c93bf1ca42073914fcb',
    messagingSenderId: '46664717586',
    projectId: 'parkpal-37248',
    authDomain: 'parkpal-37248.firebaseapp.com',
    storageBucket: 'parkpal-37248.appspot.com',
    measurementId: 'G-WT0SW5252P',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC47KtQIsMt_wSw1KsrVq2Ip65taFLvyP4',
    appId: '1:46664717586:android:96d9a801fb634d95914fcb',
    messagingSenderId: '46664717586',
    projectId: 'parkpal-37248',
    storageBucket: 'parkpal-37248.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBE9p0pPgryvXcG5yuczef0QD79ocL8QrE',
    appId: '1:46664717586:ios:e26136ba4259a1ca914fcb',
    messagingSenderId: '46664717586',
    projectId: 'parkpal-37248',
    storageBucket: 'parkpal-37248.appspot.com',
    iosBundleId: 'com.example.parkpal',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBE9p0pPgryvXcG5yuczef0QD79ocL8QrE',
    appId: '1:46664717586:ios:e26136ba4259a1ca914fcb',
    messagingSenderId: '46664717586',
    projectId: 'parkpal-37248',
    storageBucket: 'parkpal-37248.appspot.com',
    iosBundleId: 'com.example.parkpal',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDC_s3Z5LJmMqZsEx_LUS-xjNseM35k_bc',
    appId: '1:46664717586:web:9052f66436cf5143914fcb',
    messagingSenderId: '46664717586',
    projectId: 'parkpal-37248',
    authDomain: 'parkpal-37248.firebaseapp.com',
    storageBucket: 'parkpal-37248.appspot.com',
    measurementId: 'G-S788MMY34C',
  );
}