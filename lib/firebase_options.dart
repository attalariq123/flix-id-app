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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAV2k5cRlKdH8Aw_vy5GfWObcNsoS0cDeE',
    appId: '1:139899370854:web:900e20d321848b57b59ca7',
    messagingSenderId: '139899370854',
    projectId: 'flix-id-cour',
    authDomain: 'flix-id-cour.firebaseapp.com',
    storageBucket: 'flix-id-cour.appspot.com',
    measurementId: 'G-H9VEL6DPJS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBRjIUYlFpNGGRYopv0jgTCkZQH0yfaw1g',
    appId: '1:139899370854:android:98927634b74be63eb59ca7',
    messagingSenderId: '139899370854',
    projectId: 'flix-id-cour',
    storageBucket: 'flix-id-cour.appspot.com',
  );
}
