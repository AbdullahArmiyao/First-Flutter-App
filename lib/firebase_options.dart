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
    apiKey: 'AIzaSyBETaveYAtiT4J385K5p5A3JO1QwbsZpRQ',
    appId: '1:223902603506:web:daccf97abfedef5207586b',
    messagingSenderId: '223902603506',
    projectId: 'try-app-c2231',
    authDomain: 'try-app-c2231.firebaseapp.com',
    storageBucket: 'try-app-c2231.firebasestorage.app',
    measurementId: 'G-TYSLTTW6R4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAGZFF3KBdWNEOqX96ff9oouDCZc1lYOwM',
    appId: '1:223902603506:android:ec24c428d773c82807586b',
    messagingSenderId: '223902603506',
    projectId: 'try-app-c2231',
    storageBucket: 'try-app-c2231.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC-ZNuBmqgbqSDgYq3eP2i8ifaV3dyihLE',
    appId: '1:223902603506:ios:b660ab865032a6de07586b',
    messagingSenderId: '223902603506',
    projectId: 'try-app-c2231',
    storageBucket: 'try-app-c2231.firebasestorage.app',
    iosBundleId: 'com.example.newApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC-ZNuBmqgbqSDgYq3eP2i8ifaV3dyihLE',
    appId: '1:223902603506:ios:b660ab865032a6de07586b',
    messagingSenderId: '223902603506',
    projectId: 'try-app-c2231',
    storageBucket: 'try-app-c2231.firebasestorage.app',
    iosBundleId: 'com.example.newApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBETaveYAtiT4J385K5p5A3JO1QwbsZpRQ',
    appId: '1:223902603506:web:6faccf4c2c21522b07586b',
    messagingSenderId: '223902603506',
    projectId: 'try-app-c2231',
    authDomain: 'try-app-c2231.firebaseapp.com',
    storageBucket: 'try-app-c2231.firebasestorage.app',
    measurementId: 'G-SZJY9VLV3J',
  );
}
