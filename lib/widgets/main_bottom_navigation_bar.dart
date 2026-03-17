import 'package:flutter/material.dart';
import 'package:find_thing/design/design.dart';

class MainBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onItemSelected;

  const MainBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final double barHeight = 72;
    final double fabSize = 64;

    return SizedBox(
      height: barHeight + fabSize / 2,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: barHeight,
              decoration: BoxDecoration(
                color: navigationBarColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 20,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _BottomNavItem(
                    icon: homeOfIcon,
                    label: 'Главная',
                    isActive: currentIndex == 0,
                    onTap: () => onItemSelected(0),
                  ),
                  _BottomNavItem(
                    icon: loopOfIcon,
                    label: 'Поиск',
                    isActive: currentIndex == 1,
                    onTap: () => onItemSelected(1),
                  ),
                  const SizedBox(width: 20),
                  _BottomNavItem(
                    icon: boxOfIcon,
                    label: 'Хранилище',
                    isActive: currentIndex == 2,
                    onTap: () => onItemSelected(2),
                  ),
                  _BottomNavItem(
                    icon: iconOfAccount,
                    label: 'Профиль',
                    isActive: currentIndex == 3,
                    onTap: () => onItemSelected(3),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 150,
            child: Container(
              width: fabSize,
              height: fabSize,
              decoration: BoxDecoration(
                color: blueName,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.16),
                    blurRadius: 20,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Center(
                child: SizedBox(
                  width: 28,
                  height: 28,
                  child: cameraOfIcon,
                ),
              ),
            ),
          ),
        ],
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
    final Color activeColor = blackName;
    final Color inactiveColor = Colors.black.withOpacity(0.6);

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter',
              color: isActive ? activeColor : inactiveColor,
              letterSpacing: 0.2,
            ),
          ),
        ],
      ),
    );
  }
}
