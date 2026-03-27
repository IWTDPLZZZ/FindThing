import 'dart:math' as math;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:find_thing/design/design.dart';
import 'package:find_thing/theme/app_theme.dart';
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
  bool _isLogin = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Пожалуйста, заполните все поля')),
      );
      return;
    }

    final User? user;
    if (_isLogin) {
      user = await _authService.authWithEmail(email, password);
    } else {
      user = await _authService.registerWithEmail(email, password);
    }

    if (!context.mounted) return;

    if (user != null) {
      Navigator.pushNamedAndRemoveUntil(context, '/final_page', (_) => false);
    } else {
      final errorMsg = _authService.lastError ??
          (_isLogin ? 'Не удалось войти' : 'Не удалось зарегистрироваться');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMsg)),
      );
    }
  }

  void _toggleLoginRegister() {
    setState(() => _isLogin = !_isLogin);
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final AppSpacingTheme spacing = context.appSpacing;

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double maxContent = math.min(
              contentWidth,
              constraints.maxWidth - 2 * spacing.screenHorizontalPadding,
            );

            return Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: spacing.screenHorizontalPadding,
                  vertical: spacing.gapM,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: maxContent),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        _isLogin ? 'Вход в систему' : 'Регистрация',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      SizedBox(height: spacing.gapXXL),
                      TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: AppTheme.authInputDecoration(
                          context,
                          hintText: 'Email',
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: scheme.onSurfaceVariant
                                .withValues(alpha: 0.65),
                          ),
                        ),
                      ),
                      SizedBox(height: spacing.gapM),
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        textInputAction: TextInputAction.done,
                        onSubmitted: (_) => _submit(),
                        decoration: AppTheme.authInputDecoration(
                          context,
                          hintText: 'Пароль',
                          prefixIcon: Icon(
                            Icons.lock_outlined,
                            color: scheme.onSurfaceVariant
                                .withValues(alpha: 0.65),
                          ),
                        ),
                      ),
                      if (_isLogin)
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () async {
                              final email = _emailController.text.trim();
                              if (email.isEmpty) {
                                if (!context.mounted) return;
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Введите email для сброса пароля',
                                    ),
                                  ),
                                );
                                return;
                              }
                              try {
                                await _authService.resetPasswordEmail(email);
                                if (!context.mounted) return;
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Письмо для сброса пароля отправлено',
                                    ),
                                  ),
                                );
                              } catch (_) {
                                if (!context.mounted) return;
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Не удалось отправить письмо',
                                    ),
                                  ),
                                );
                              }
                            },
                            style: AppTheme.textButtonMemoryStyleWide,
                            child: const Text('Забыли пароль?'),
                          ),
                        ),
                      SizedBox(height: spacing.gapS),
                      Center(
                        child: GestureDetector(
                          onTap: _toggleLoginRegister,
                          behavior: HitTestBehavior.opaque,
                          child: Text.rich(
                            TextSpan(
                              style: Theme.of(context).textTheme.bodyMedium,
                              children: [
                                TextSpan(
                                  text: _isLogin
                                      ? 'Нет аккаунта? '
                                      : 'Уже есть аккаунт? ',
                                ),
                                TextSpan(
                                  text: _isLogin
                                      ? 'Зарегистрироваться'
                                      : 'Войти',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(
                                        decoration: TextDecoration.underline,
                                        decorationColor: lightBlue,
                                      ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(height: spacing.gapS),
                      ElevatedButton(
                        onPressed: _submit,
                        child: Text(
                          _isLogin ? 'Войти' : 'Зарегистрироваться',
                        ),
                      ),
                      SizedBox(height: spacing.gapXL),
                      Row(
                        children: [
                          Expanded(
                            child: SvgPicture.asset(
                              'assets/images/LeftGrayLine.svg',
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: spacing.gapS * 0.5,
                            ),
                            child: Text(
                              _isLogin
                                  ? 'Или войдите через'
                                  : 'Или зарегистрируйтесь через',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          Expanded(
                            child: SvgPicture.asset(
                              'assets/images/RightGrayLine.svg',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: spacing.gapXL),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _socialButton(
                            context,
                            _authService.authWithApple,
                            'assets/images/appleOfIcon.svg',
                          ),
                          SizedBox(width: spacing.gapL),
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
            );
          },
        ),
      ),
    );
  }

  Widget _socialButton(
    BuildContext context,
    Future<User?> Function() onTap,
    String assetPath,
  ) {
    return SizedBox(
      width: socialButtonSize,
      height: socialButtonSize,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () async {
            final user = await onTap();
            if (!context.mounted) return;
            if (user != null) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/final_page',
                (_) => false,
              );
            }
          },
          borderRadius: BorderRadius.circular(radiusSocialButton),
          child: Ink(
            decoration: context.appDecoration.socialButtonDecoration,
            child: Padding(
              padding: const EdgeInsets.all(socialButtonIconPadding),
              child: SvgPicture.asset(assetPath),
            ),
          ),
        ),
      ),
    );
  }
}
