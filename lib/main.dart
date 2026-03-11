import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:find_thing/config/firebase_options.dart';
import 'package:find_thing/screens/auth_page.dart';
import 'package:find_thing/screens/first_page.dart';
import 'package:find_thing/screens/third_page.dart';
import 'package:find_thing/screens/main_page.dart';
import 'package:find_thing/providers/provider.dart';
import 'package:provider/provider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(create: (context) => ProviderItem(), child: const FindThingApp()),
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
        // appBarTheme: const AppBarTheme(),
        // textTheme: const TextTheme(),
        // inputDecorationTheme: const InputDecorationTheme(),
        // elevatedButtonTheme: const ElevatedButtonThemeData(),
        // textButtonTheme: const TextButtonThemeData(),
        // outlinedButtonTheme: const OutlinedButtonThemeData(),
        // iconTheme: const IconThemeData(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        fontFamily: 'Inter',
      ),
      routes: {
        '/': (context) => const MainPage(),

        '/auth': (context) => const AuthPage(),
        '/final_page': (context) => const FinalPage(),
      },
    );
  }
}
