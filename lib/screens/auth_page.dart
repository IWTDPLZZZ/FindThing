import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:find_thing/design/design.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:find_thing/services/auth_service.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
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
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: contentWidth,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Вход в систему',
                  style: TextStyle(
                    fontSize: fontSizeTitle,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter',
                    color: blackName,
                    letterSpacing: 0,
                  ),
                ),
                const SizedBox(height: gapXXL),
                SizedBox(
                  width: fieldWidth,
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: const TextStyle(
                        fontSize: fontSizeBody,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Inter',
                        color: gray,
                        letterSpacing: letterSpacingWide,
                      ),
                      filled: true,
                      fillColor: grayField,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: grayFieldText),
                        borderRadius: BorderRadius.circular(radiusField),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: gapM),
                SizedBox(
                  width: fieldWidth,
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Пароль',
                      hintStyle: const TextStyle(
                        fontSize: fontSizeBody,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Inter',
                        color: gray,
                        letterSpacing: letterSpacingWide,
                      ),
                      filled: true,
                      fillColor: grayField,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: grayFieldText),
                        borderRadius: BorderRadius.circular(radiusField),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: paddingButtonHorizontal,
                      vertical: paddingButtonVertical,
                    ),
                    textStyle: const TextStyle(
                      fontSize: fontSizeBody,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Inter',
                      color: memory,
                      letterSpacing: letterSpacingWide,
                    ),
                  ),
                  child: const Text('Забыли пароль?'),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: paddingTextButtonHorizontal,
                      vertical: paddingTextButtonVertical,
                    ),
                    textStyle: const TextStyle(
                      fontSize: fontSizeBody,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Inter',
                      color: memory,
                      letterSpacing: letterSpacingWide,
                    ),
                  ),
                  child: const Text('Зарегистрироваться'),
                ),
                const SizedBox(height: gapS),
                ElevatedButton(
                  onPressed: () async {
                    final email = _emailController.text;
                    final password = _passwordController.text;
                    if (email.isEmpty || password.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Пожалуйста, заполните все поля'),
                        ),
                      );
                      return;
                    }
                    final user = await _authService.authWithEmail(email, password);
                    if (!context.mounted) return;
                    if (user != null) {
                      Navigator.pushNamed(context, '/main');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Не удалось войти')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(contentWidth, loginButtonHeight),
                    padding: const EdgeInsets.symmetric(
                      horizontal: paddingButtonHorizontal,
                      vertical: paddingButtonVertical,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(radiusLoginButton),
                    ),
                    backgroundColor: lightBlue,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Войти'),
                ),
                const SizedBox(height: gapXL),
                Row(
                  children: [
                    Expanded(
                      child: SvgPicture.asset('assets/images/LeftGrayLine.svg'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: paddingContentHorizontal,
                      ),
                      child: const Text(
                        'Или войдите через',
                        style: TextStyle(
                          fontSize: fontSizeBody,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Inter',
                          color: gray,
                          letterSpacing: letterSpacingWide,
                        ),
                      ),
                    ),
                    Expanded(
                      child: SvgPicture.asset('assets/images/RightGrayLine.svg'),
                    ),
                  ],
                ),
                const SizedBox(height: gapXL),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _socialButton(
                      context,
                      _authService.authWithApple,
                      'assets/images/appleOfIcon.svg',
                    ),
                    const SizedBox(width: gapSocialButtons),
                    _socialButton(
                      context,
                      _authService.authWithGoogle,
                      'assets/images/gmailOfIcon.svg',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _socialButton(
    BuildContext context,
    Future<User?> Function() onTap,
    String assetPath,
  ) {
    return InkWell(
      onTap: () => onTap(),
      borderRadius: BorderRadius.circular(radiusSocialButton),
      child: Container(
        width: socialButtonSize,
        height: socialButtonSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: grayFieldText),
        ),
        padding: const EdgeInsets.all(socialButtonIconPadding),
        child: SvgPicture.asset(assetPath),
      ),
    );
  }
}
