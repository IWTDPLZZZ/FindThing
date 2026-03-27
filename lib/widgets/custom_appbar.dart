import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:find_thing/design/design.dart';
import 'package:find_thing/theme/app_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  void _onAccountTap(BuildContext context) {
    final bool signedIn = FirebaseAuth.instance.currentUser != null;
    if (signedIn) {
      Navigator.pushNamed(context, '/profile');
    } else {
      Navigator.pushNamed(context, '/auth');
    }
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return AppBar(
      backgroundColor: colors.surface,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      title: RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.titleLarge,
          children: [
            TextSpan(
              text: 'Find',
              style: AppTheme.appBarTitleFind(context),
            ),
            TextSpan(
              text: 'Thing',
              style: AppTheme.appBarTitleThing(context),
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: context.appSpacing.appBarActionPaddingRight),
          child: GestureDetector(
            onTap: () => _onAccountTap(context),
            child: CircleAvatar(
              radius: avatarRadius,
              backgroundColor: colors.surfaceContainerHighest,
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
class CustomBarForMainPage extends StatelessWidget implements PreferredSizeWidget {
  const CustomBarForMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return AppBar(
      backgroundColor: colors.surface,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      title: RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.titleLarge,
          children: [
            TextSpan(text: 'Find', style: AppTheme.appBarTitleFind(context)),
            TextSpan(text: 'Thing', style: AppTheme.appBarTitleThing(context)),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + appBarDividerHeight);
}