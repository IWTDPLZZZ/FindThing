import 'package:flutter/material.dart';
import 'package:find_thing/design/design.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

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
            fontSize: fontSizeAppBarTitle,
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
          padding: const EdgeInsets.only(right: paddingAppBarRight),
          child: GestureDetector(
            onTap: () {},
            child: CircleAvatar(
              radius: avatarRadius,
              backgroundColor: gray,
              child: SvgPicture.asset(
                'assets/images/iconOfAccount.svg',
                width: accountIconSize,
                height: accountIconSize,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(appBarDividerHeight),
        child: SvgPicture.asset('assets/images/grayLine.svg'),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + appBarDividerHeight);
}
