
import 'package:flutter/material.dart';
import 'package:find_thing/design/design.dart';
import 'package:find_thing/services/auth_service.dart';


class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final AuthService _authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: contentWidth,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Регистрация в системе',
                  textAlign: TextAlign.center,
                  style: textStyleTitle,
                ),
                const SizedBox(height: gapXXL),
                SizedBox(
                  width: fieldWidth,
                  child: TextField(
                    controller: _emailController,
                    decoration: authInputDecoration(hintText: 'Email'),
                  ),
                ),
                const SizedBox(height: gapM),
                SizedBox(
                  width: fieldWidth,
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: authInputDecoration(hintText: 'Пароль'),
                  ),
                ),
                const SizedBox(height: gapS),
                OutlinedButton(
                  onPressed: () async {
                    final email = _emailController.text.trim();
                    final password = _passwordController.text.trim();
                    if (email.isEmpty || password.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Пожалуйста, заполните все поля'),
                        ),
                      );
                      return;
                    }
                    final user = await _authService.registerWithEmail(email, password);
                    if (!context.mounted) return;
                    if (user != null) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/',
                        (_) => false,
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Не удалось зарегистрироваться')),
                      );
                    }
                  },
                  style: outlinedButtonPrimaryStyle,
                  child: const Text(
                    'Зарегистрироваться',
                    style: textStyleButtonLabel,
                  ),
                ),
                ],
              ),
            ),
          ),
        ),
    );
  
  }
}