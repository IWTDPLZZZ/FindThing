import 'package:flutter/material.dart';
import 'package:find_thing/theme/app_theme.dart';
import 'package:find_thing/widgets/profile_tab_content.dart';
import 'package:find_thing/widgets/custom_appbar.dart';
import 'package:find_thing/widgets/main_bottom_navigation_bar.dart'
    show MainBottomAppBar, MainCameraFab;
import 'package:find_thing/widgets/main_home_tab_content.dart';

/// Shell with bottom navigation; each tab keeps state via [IndexedStack].
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  /// Lazily built children so off-stage tabs preserve state without rebuilding roots.
  late final List<Widget> _tabBodies = <Widget>[
    const MainHomeTabContent(),
    _PlaceholderTab(
      title: 'Поиск',
      message: 'Расширенный поиск скоро появится здесь.',
    ),
    _PlaceholderTab(
      title: 'Хранилище',
      message: 'Управление хранилищем в разработке.',
    ),
    const ProfileTabContent(),
  ];

  void _onNavItemTapped(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: const CustomBarForMainPage(),
      floatingActionButton: const MainCameraFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: MainBottomAppBar(
        currentIndex: _currentIndex,
        onItemSelected: _onNavItemTapped,
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _tabBodies,
      ),
    );
  }
}

class _PlaceholderTab extends StatelessWidget {
  final String title;
  final String message;

  const _PlaceholderTab({
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final AppSpacingTheme spacing = context.appSpacing;
    final ColorScheme colors = Theme.of(context).colorScheme;

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: spacing.gapXL),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: spacing.gapM),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
