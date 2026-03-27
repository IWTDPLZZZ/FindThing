import 'package:flutter/material.dart';
import 'package:find_thing/widgets/profile_tab_content.dart';

/// Standalone profile route (own [AppBar]) when opened from the global app bar.
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Профиль',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: const ProfileTabContent(),
    );
  }
}
