import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCCn_d3VAKhcnbQa9dUn2NeFwYKhFapTdE',
    appId: '1:858841789135:android:df325f30c43ca57a163dba',
    messagingSenderId: '858841789135',
    projectId: 'find-thing-main',
    storageBucket: 'find-thing-main.firebasestorage.app',
  );

 
  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBNTplJHPF_bgwhNa3_OcJpfbHEADaZB8c',
    appId: '1:858841789135:ios:ce72d0180dde4c4f163dba',
    messagingSenderId: '858841789135',
    projectId: 'find-thing-main',
    storageBucket: 'find-thing-main.firebasestorage.app',
    iosBundleId: 'com.example.findThing',
    iosClientId: 'YOUR_IOS_CLIENT_ID.apps.googleusercontent.com',
  );
}
