import 'package:flutter/material.dart';
import 'package:find_thing/firstPage.dart';
import 'package:find_thing/authpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const FindThingApp());
}

class FindThingApp extends StatelessWidget {
  const FindThingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Find Thing',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 255, 255, 255),
        scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      routes: {
        '/': (context) => const FirstPage(),
        '/auth': (context) => const AuthPage(),
      },
      // home: const FirstPage(),
    );
  }
}
