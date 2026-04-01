import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';
import 'package:find_thing/design/design.dart';
import 'package:find_thing/theme/app_theme.dart';

/// Notched bottom bar with glass-style blur; pair with [MainCameraFab] and
/// [FloatingActionButtonLocation.centerDocked] on [Scaffold].
class MainBottomAppBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onItemSelected;

  const MainBottomAppBar({
    super.key,
    required this.currentIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final AppSpacingTheme spacing = context.appSpacing;
    final double barHeight = spacing.bottomNavBarHeight;
    final double fabReserve = spacing.bottomNavFabSize + 12;

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: bottomNavBlurSigma,
          sigmaY: bottomNavBlurSigma,
        ),
        child: BottomAppBar(
          height: barHeight,
          padding: EdgeInsets.zero,
          elevation: 0,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          color: Colors.white.withValues(alpha: 0.62),
          shape: const CircularNotchedRectangle(),
          notchMargin: 8,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: spacing.bottomNavRowHorizontalPadding * 0.5,
            ),
            child: Row(
              children: [
                Expanded(
                  child: _BottomNavItem(
                    icon: homeOfIcon,
                    label: 'Главная',
                    isActive: currentIndex == 0,
                    onTap: () => onItemSelected(0),
                  ),
                ),
                Expanded(
                  child: _BottomNavItem(
                    icon: loopOfIcon,
                    label: 'Поиск',
                    isActive: currentIndex == 1,
                    onTap: () => onItemSelected(1),
                  ),
                ),
                SizedBox(width: fabReserve),
                Expanded(
                  child: _BottomNavItem(
                    icon: boxOfIcon,
                    label: 'Хранилище',
                    isActive: currentIndex == 2,
                    onTap: () => onItemSelected(2),
                  ),
                ),
                Expanded(
                  child: _BottomNavItem(
                    icon: iconOfAccount,
                    label: 'Профиль',
                    isActive: currentIndex == 3,
                    onTap: () => onItemSelected(3),
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

/// Center-docked camera control; size matches spacing token [bottomNavFabSize].
class MainCameraFab extends StatelessWidget {
  final VoidCallback? onTap;
  const MainCameraFab({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    final AppSpacingTheme spacing = context.appSpacing;
    final double size = spacing.bottomNavFabSize;

    return SizedBox(
      width: size,
      height: size,
      child: Material(
        shape: const CircleBorder(),
        color: accentBlueDeep,
        elevation: 5,
        shadowColor: accentBlueDeep.withValues(alpha: 0.4),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onTap,
          child: Center(
            child: SizedBox(
              width: bottomNavFabInnerIconSize,
              height: bottomNavFabInnerIconSize,
              child: cameraOfIcon,
            ),
          ),
        ),
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  final Widget icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _BottomNavItem({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final Color activeColor = scheme.onSurface;
    final Color inactiveColor = scheme.onSurface.withValues(alpha: 0.55);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: IconTheme(
                data: IconThemeData(
                  color: isActive ? activeColor : inactiveColor,
                ),
                child: icon,
              ),
            ),
            SizedBox(height: context.appSpacing.gapS * 0.15),
            Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTheme.bottomNavItemLabel(context, isActive: isActive),
            ),
          ],
        ),
      ),
    );
  }
}
