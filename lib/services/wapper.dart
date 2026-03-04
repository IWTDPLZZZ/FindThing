import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:find_thing/screens/auth_page.dart';
import 'package:find_thing/screens/second_page.dart';

class Wapper extends StatelessWidget {
  const Wapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    if (user == null) {
      return const AuthPage();
    }
    return const SecondPage();
  }
}