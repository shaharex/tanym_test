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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAi6hFqspIp1MoClmmBDUSwNLQmBu7atJQ',
    appId: '1:465608974236:android:a772f3642f0eba42ac7259',
    messagingSenderId: '465608974236',
    projectId: 'tanymtest-app',
    storageBucket: 'tanymtest-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAK2d8SV4EIrKBDNOMeVHg-IAq4v2x1QVs',
    appId: '1:465608974236:ios:c10510aa7d5f4e57ac7259',
    messagingSenderId: '465608974236',
    projectId: 'tanymtest-app',
    storageBucket: 'tanymtest-app.appspot.com',
    iosBundleId: 'com.example.tanymtestApp',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBlHlVJCR9CuXwsD4li8FOm4N2kExjdPuU',
    appId: '1:465608974236:web:f8a75e7ebf483696ac7259',
    messagingSenderId: '465608974236',
    projectId: 'tanymtest-app',
    authDomain: 'tanymtest-app.firebaseapp.com',
    storageBucket: 'tanymtest-app.appspot.com',
  );

}