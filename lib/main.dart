import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:find_thing/config/firebase_options.dart';
import 'package:find_thing/screens/auth_page.dart';
import 'package:find_thing/screens/first_page.dart';
import 'package:find_thing/screens/third_page.dart';
import 'package:find_thing/screens/main_page.dart';
import 'package:find_thing/screens/profile_page.dart';
import 'package:find_thing/providers/provider.dart';
import 'package:find_thing/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ProviderItem>(create: (_) => ProviderItem()),
        ChangeNotifierProvider<ItemsAddProvider>(
          create: (_) => ItemsAddProvider(),
        ),
      ],
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
      theme: AppTheme.light,
      routes: {
        '/': (context) => const FirstPage(),
        '/main_page': (context) => const MainPage(),
        '/auth': (context) => const AuthPage(),
        '/profile': (context) => const ProfilePage(),
        '/final_page': (context) => const FinalPage(),
      },
    );
  }
}
