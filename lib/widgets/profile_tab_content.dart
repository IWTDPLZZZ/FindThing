import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:find_thing/services/auth_service.dart';
import 'package:find_thing/theme/app_theme.dart';

/// Profile body without [Scaffold] — for embedding under [MainPage] shell.
class ProfileTabContent extends StatelessWidget {
  const ProfileTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    final ColorScheme colors = Theme.of(context).colorScheme;
    final AppSpacingTheme spacing = context.appSpacing;

    if (user == null) {
      return Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: spacing.gapL),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Войдите, чтобы управлять аккаунтом',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: colors.onSurfaceVariant,
                    ),
              ),
              SizedBox(height: spacing.gapM),
              ElevatedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, '/auth'),
                child: const Text('Войти'),
              ),
            ],
          ),
        ),
      );
    }

    final double bottomInset =
        MediaQuery.paddingOf(context).bottom +
            spacing.bottomNavBarHeight +
            spacing.bottomNavFabSize * 0.45 +
            8;

    return ListView(
      padding: EdgeInsets.fromLTRB(
        spacing.gapM,
        spacing.gapM,
        spacing.gapM,
        spacing.gapM + bottomInset,
      ),
      children: [
        ListTile(
          title: Text(
            'Имя',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          subtitle: Text(
            user.displayName ?? '—',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        ListTile(
          title: Text(
            'Email',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          subtitle: Text(
            user.email ?? '—',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        SizedBox(height: spacing.gapXL),
        FilledButton.tonal(
          onPressed: () async {
            await AuthService().signOut();
            if (!context.mounted) return;
            Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
          },
          child: const Text('Выйти'),
        ),
      ],
    );
  }
}
