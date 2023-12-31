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
    apiKey: 'AIzaSyCJExD4T4wLE8IMsC72nXFkz0woWJIxgTk',
    appId: '1:262476446230:web:16903bc0c51a1968735337',
    messagingSenderId: '262476446230',
    projectId: 'rental-easy-51aa1',
    authDomain: 'rental-easy-51aa1.firebaseapp.com',
    storageBucket: 'rental-easy-51aa1.appspot.com',
    measurementId: 'G-K1KJN2WD63',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCJpu88mDauGrrfXaXzCSFpmYumtGlfo-8',
    appId: '1:262476446230:android:e8a74d038a437012735337',
    messagingSenderId: '262476446230',
    projectId: 'rental-easy-51aa1',
    storageBucket: 'rental-easy-51aa1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC6dpGm0aaNobcWABeSbpGQbg1s44X3s_g',
    appId: '1:262476446230:ios:570534879d910ae1735337',
    messagingSenderId: '262476446230',
    projectId: 'rental-easy-51aa1',
    storageBucket: 'rental-easy-51aa1.appspot.com',
    iosClientId: '262476446230-mpongaj4lsokcu0s30bihs2jjmpbmnqb.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC6dpGm0aaNobcWABeSbpGQbg1s44X3s_g',
    appId: '1:262476446230:ios:12e7f404663fda77735337',
    messagingSenderId: '262476446230',
    projectId: 'rental-easy-51aa1',
    storageBucket: 'rental-easy-51aa1.appspot.com',
    iosClientId: '262476446230-ikanjpu1icbr7b83953uf6jrrvtfgv42.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication1.RunnerTests',
  );
}
