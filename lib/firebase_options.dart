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
    apiKey: 'AIzaSyBsM0eJmJydDgExy2D7bNouK1KKxij3PT8',
    appId: '1:745116786641:web:304b76421696161c214af0',
    messagingSenderId: '745116786641',
    projectId: 'tareas-bd-147d8',
    authDomain: 'tareas-bd-147d8.firebaseapp.com',
    storageBucket: 'tareas-bd-147d8.appspot.com',
    measurementId: 'G-DSP1HXDJH3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyACPn2cMty5A6Zlxr0FntTIOWHx0mo-0Nw',
    appId: '1:745116786641:android:a0d51ea667f2fea4214af0',
    messagingSenderId: '745116786641',
    projectId: 'tareas-bd-147d8',
    storageBucket: 'tareas-bd-147d8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDBciiW_F8pLk4MhcBw6pfAsByGhvP2G8Y',
    appId: '1:745116786641:ios:c95082bd932d2248214af0',
    messagingSenderId: '745116786641',
    projectId: 'tareas-bd-147d8',
    storageBucket: 'tareas-bd-147d8.appspot.com',
    iosBundleId: 'com.example.streamsTareas',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDBciiW_F8pLk4MhcBw6pfAsByGhvP2G8Y',
    appId: '1:745116786641:ios:868d400379eec733214af0',
    messagingSenderId: '745116786641',
    projectId: 'tareas-bd-147d8',
    storageBucket: 'tareas-bd-147d8.appspot.com',
    iosBundleId: 'com.example.streamsTareas.RunnerTests',
  );
}
