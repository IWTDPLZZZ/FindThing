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
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: lightBlue,
                  ),
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
                  style: TextStyle(
                    fontSize: fontSizeTitle,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter',
                    color: blackName,
                    letterSpacing: 0,
                  ),
                ),
                const SizedBox(height: gapM),
                const Text(
                  'Добро пожаловать в FindThing!\nТеперь вы можете начать пользоваться приложением.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: fontSizeBody,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Inter',
                    color: gray,
                    letterSpacing: 0,
                  ),
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
                  child: const Text(
                    'Продолжить',
                    style: TextStyle(
                      fontSize: fontSizeBody,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                      letterSpacing: letterSpacingWide,
                    ),
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
