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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDFhe1nX9fJQUAuHpGLsBGvxQuVWxdiwKU',
    appId: '1:378580326804:web:b3e6956699f90490335781',
    messagingSenderId: '378580326804',
    projectId: 'fir-app-9aa1f',
    authDomain: 'fir-app-9aa1f.firebaseapp.com',
    databaseURL: 'https://fir-app-9aa1f-default-rtdb.firebaseio.com',
    storageBucket: 'fir-app-9aa1f.appspot.com',
    measurementId: 'G-1EF6WNLL4S',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDW0jjy7yl05nV9UZ7bZ-si73YIPq94Xic',
    appId: '1:378580326804:android:b4e86acc6ae247d3335781',
    messagingSenderId: '378580326804',
    projectId: 'fir-app-9aa1f',
    databaseURL: 'https://fir-app-9aa1f-default-rtdb.firebaseio.com',
    storageBucket: 'fir-app-9aa1f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCsqufHBDx-2WXWKgtDy3c7BS9cqszBOac',
    appId: '1:378580326804:ios:ec6ce849b80d6097335781',
    messagingSenderId: '378580326804',
    projectId: 'fir-app-9aa1f',
    databaseURL: 'https://fir-app-9aa1f-default-rtdb.firebaseio.com',
    storageBucket: 'fir-app-9aa1f.appspot.com',
    iosClientId: '378580326804-i5gpu96rv1s4qdiu74ogotgvavesn3cr.apps.googleusercontent.com',
    iosBundleId: 'com.example.carMobileCourse',
  );
}
