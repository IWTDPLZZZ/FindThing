import 'package:flutter/material.dart';
import 'package:find_thing/desigh/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
class AppbarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppbarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
         backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        title: RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
              fontFamily: 'CupertinoSystemDisplay',
            ),
            children: [
              TextSpan(
                text: 'Find',
                style: TextStyle(color: blueName),
              ),
              TextSpan(
                text: 'Thing',
                style: TextStyle(color: blackName),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                print('Нажата кнопка профиля');
              },
              child: CircleAvatar(
                radius: 18,
                backgroundColor: gray,
                child: SvgPicture.asset(
                  'assets/images/iconOfAccount.svg',
                  width: 36,
                  height: 36,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: SvgPicture.asset('assets/images/grayLine.svg'),
        ),
      );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1);
}