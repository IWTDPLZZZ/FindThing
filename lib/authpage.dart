import 'package:flutter/material.dart';
import 'package:find_thing/appbar.dart';
import 'package:find_thing/desigh/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarCustom(),
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 350,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Вход в систему', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'Inter', color: blackName, letterSpacing: 0)),
                const SizedBox(height: 42),
                SizedBox(
                  width: 320,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, fontFamily: 'Inter', color: gray, letterSpacing: 2.5),
                      filled: true,
                      fillColor: grayField,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: grayFieldText),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 22),
                SizedBox(
                  width: 320,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Пароль',
                      hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, fontFamily: 'Inter', color: gray, letterSpacing: 2.5),
                      filled: true,
                      fillColor: grayField,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: grayFieldText),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, fontFamily: 'Inter', color: memory, letterSpacing: 2.5),
                  ),
                  
                  child: Text('Забыли пароль?'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(350, 50),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    backgroundColor: lightBlue,
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Войти'),
                ),
                const SizedBox(height: 40),
                Row(
                  children: [
                    Expanded(
                      child: SvgPicture.asset('assets/images/LeftGrayLine.svg'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Или войдите через',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, fontFamily: 'Inter', color: gray, letterSpacing: 2.5),
                      ),
                    ),
                    Expanded(
                      child: SvgPicture.asset('assets/images/RightGrayLine.svg'),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _socialButton(context, 'assets/images/appleOfIcon.svg'),
                    const SizedBox(width: 60),
                    _socialButton(context, 'assets/images/gmailOfIcon.svg'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _socialButton(BuildContext context, String assetPath) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: grayFieldText),
        ),
        padding: const EdgeInsets.all(10),
        child: SvgPicture.asset(assetPath),
      ),
    );
  }
}