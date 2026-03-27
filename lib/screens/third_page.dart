import 'package:flutter/material.dart';
import 'package:find_thing/design/design.dart';
import 'package:find_thing/theme/app_theme.dart';

class FinalPage extends StatelessWidget {
  const FinalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: contentWidth,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 96,
                  height: 96,
                  decoration: context.appDecoration.successIconDecoration,
                  child: const Icon(
                    Icons.check_rounded,
                    size: 52,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: gapXL),
                Text(
                  'Регистрация\nзавершена!',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: gapM),
                Text(
                  'Добро пожаловать в FindThing!\nТеперь вы можете начать пользоваться приложением.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: gapXXL),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/main_page',
                      (_) => false,
                    );
                  },
                  child: const Text('Продолжить'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
