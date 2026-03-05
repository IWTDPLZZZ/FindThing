import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:find_thing/screens/first_page.dart';

class Wapper extends StatefulWidget {
  const Wapper({super.key});

  @override
  State<Wapper> createState() => _WapperState();
}

class _WapperState extends State<Wapper> {
  bool _hasNavigated = false;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);

    if (user != null && !_hasNavigated) {
      _hasNavigated = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushNamedAndRemoveUntil(context, '/final_page', (_) => false);
      });
    }

    return const FirstPage();
  }
}