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
    apiKey: 'AIzaSyBryroiaIwYJoii9c2T7lCQBtDy2XVESZM',
    appId: '1:978961219181:web:05ad77f64282ccaeb28964',
    messagingSenderId: '978961219181',
    projectId: 'app-chat-firebase-bd2d6',
    authDomain: 'app-chat-firebase-bd2d6.firebaseapp.com',
    databaseURL: 'https://app-chat-firebase-bd2d6-default-rtdb.firebaseio.com',
    storageBucket: 'app-chat-firebase-bd2d6.appspot.com',
    measurementId: 'G-TWTN31M28F',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD0gT6eXik9bXmRTCbhl0j1tjAiRNs1lOA',
    appId: '1:978961219181:android:ef934f3d7f47c400b28964',
    messagingSenderId: '978961219181',
    projectId: 'app-chat-firebase-bd2d6',
    databaseURL: 'https://app-chat-firebase-bd2d6-default-rtdb.firebaseio.com',
    storageBucket: 'app-chat-firebase-bd2d6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDqVOjbTb-UbVPK2V0MVSPOt4nNyJ4Fspc',
    appId: '1:978961219181:ios:8e42bf5b7539c57fb28964',
    messagingSenderId: '978961219181',
    projectId: 'app-chat-firebase-bd2d6',
    databaseURL: 'https://app-chat-firebase-bd2d6-default-rtdb.firebaseio.com',
    storageBucket: 'app-chat-firebase-bd2d6.appspot.com',
    androidClientId: '978961219181-m2p7fo95io6hpmes07r41lqil6cuk23c.apps.googleusercontent.com',
    iosClientId: '978961219181-686j293strab2jnvjg7pho7379q6dpe7.apps.googleusercontent.com',
    iosBundleId: 'com.cooperation.appDev',
  );
}
