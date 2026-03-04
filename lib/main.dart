import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:find_thing/config/firebase_options.dart';
import 'package:find_thing/screens/auth_page.dart';
import 'package:find_thing/screens/second_page.dart';
import 'package:find_thing/services/wapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    StreamProvider<User?>.value(
      value: FirebaseAuth.instance.authStateChanges(),
      initialData: FirebaseAuth.instance.currentUser,
      child: const FindThingApp(),
    ),
  );
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
        appBarTheme: AppBarTheme(
          
        ),
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
        '/': (context) => const Wapper(),
        '/auth': (context) => const AuthPage(),
        '/second_page': (context) => const SecondPage(),
      },
      initialRoute: '/',
    );
  }
}
