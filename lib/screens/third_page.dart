import 'package:flutter/material.dart';
import 'package:find_thing/design/design.dart';

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
                  decoration: successIconDecoration,
                  child: const Icon(
                    Icons.check_rounded,
                    size: 52,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: gapXL),
                const Text(
                  'Регистрация\nзавершена!',
                  textAlign: TextAlign.center,
                  style: textStyleTitle,
                ),
                const SizedBox(height: gapM),
                const Text(
                  'Добро пожаловать в FindThing!\nТеперь вы можете начать пользоваться приложением.',
                  textAlign: TextAlign.center,
                  style: textStyleBodyTight,
                ),
                const SizedBox(height: gapXXL),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      // '/second_page',
                      '/main_page',
                      (_) => false,
                    );
                  },
                  style: elevatedButtonPrimaryStyle,
                  child: const Text(
                    'Продолжить',
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
