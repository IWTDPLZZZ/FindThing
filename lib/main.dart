import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:find_thing/config/firebase_options.dart';
import 'package:find_thing/screens/auth_page.dart';
import 'package:find_thing/screens/first_page.dart';
import 'package:find_thing/screens/setup_name_screen.dart';
import 'package:find_thing/screens/main_page.dart';
import 'package:find_thing/screens/profile_page.dart';
import 'package:find_thing/providers/provider.dart';
import 'package:find_thing/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: 'lib/api.env');
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
      home: const AuthGate(),
      routes: {
        '/auth': (context) => const AuthPage(),
        '/profile': (context) => const ProfilePage(),
        '/main_page': (context) => const MainPage(),
        '/setup_name': (context) => const SetupNameScreen(),
      },
    );
  }
}

/// Listens to [FirebaseAuth.userChanges] and routes the user to the
/// appropriate screen: onboarding, name setup, or main page.
class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final User? user = snapshot.data;

        if (user == null) return const FirstPage();

        if (user.displayName == null || user.displayName!.trim().isEmpty) {
          return const SetupNameScreen();
        }

        return const MainPage();
      },
    );
  }
}
