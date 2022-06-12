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
    apiKey: 'AIzaSyAxC5m3YDJCDhuVNeitELUjNcwAdOzF650',
    appId: '1:821898867199:web:59f7f9503c224c8fdfb7ca',
    messagingSenderId: '821898867199',
    projectId: 'projectmenu-e45c4',
    authDomain: 'projectmenu-e45c4.firebaseapp.com',
    storageBucket: 'projectmenu-e45c4.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCt5ApG0k8Vyxkj5aX9x08hlcNtfI6VuC0',
    appId: '1:821898867199:android:71c26b81da80db83dfb7ca',
    messagingSenderId: '821898867199',
    projectId: 'projectmenu-e45c4',
    storageBucket: 'projectmenu-e45c4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA6jqhYypIjpXK34qnAt6RrH6tb5zrSbZw',
    appId: '1:821898867199:ios:18fb8885e5298ceadfb7ca',
    messagingSenderId: '821898867199',
    projectId: 'projectmenu-e45c4',
    storageBucket: 'projectmenu-e45c4.appspot.com',
    iosClientId:
        '821898867199-28n4qpnvvhe2l764diq5luvit7rm8i38.apps.googleusercontent.com',
    iosBundleId: 'com.example.ambwproyek',
  );
}