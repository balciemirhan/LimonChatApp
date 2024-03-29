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
    apiKey: 'AIzaSyDUALJWRslQmw4YT5OKdVbl_SlJwn4vWQk',
    appId: '1:86339380337:web:e6a5c8aa4ce484d6eda7d0',
    messagingSenderId: '86339380337',
    projectId: 'lemonchatapp-b6ddc',
    authDomain: 'lemonchatapp-b6ddc.firebaseapp.com',
    storageBucket: 'lemonchatapp-b6ddc.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCkm9Joj-Ae_WynHBIknVFBIPzO0P5ozIs',
    appId: '1:86339380337:android:b1ab86f5e264ba97eda7d0',
    messagingSenderId: '86339380337',
    projectId: 'lemonchatapp-b6ddc',
    storageBucket: 'lemonchatapp-b6ddc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB-jxO3zfNAhNwr32qQw44wc_rLEyn-i9Y',
    appId: '1:86339380337:ios:30f49ae40ed054b6eda7d0',
    messagingSenderId: '86339380337',
    projectId: 'lemonchatapp-b6ddc',
    storageBucket: 'lemonchatapp-b6ddc.appspot.com',
    iosBundleId: 'com.example.limonChatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB-jxO3zfNAhNwr32qQw44wc_rLEyn-i9Y',
    appId: '1:86339380337:ios:366590510691b967eda7d0',
    messagingSenderId: '86339380337',
    projectId: 'lemonchatapp-b6ddc',
    storageBucket: 'lemonchatapp-b6ddc.appspot.com',
    iosBundleId: 'com.example.limonChatApp.RunnerTests',
  );
}
