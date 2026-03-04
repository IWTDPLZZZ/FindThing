import 'package:flutter/material.dart';
import 'package:find_thing/screens/first_page.dart';
import 'package:find_thing/screens/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:find_thing/config/firebase_options.dart';

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
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(),
        textTheme: TextTheme(),
        inputDecorationTheme: InputDecorationTheme(),
        elevatedButtonTheme: ElevatedButtonThemeData(),
        textButtonTheme: TextButtonThemeData(),
        outlinedButtonTheme: OutlinedButtonThemeData(),
        iconTheme: IconThemeData(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        fontFamily: 'Inter',
      ),
      routes: {
        '/': (context) => const FirstPage(),
        '/auth': (context) => const AuthPage(),
      },
      // home: const FirstPage(),
    );
  }
}
