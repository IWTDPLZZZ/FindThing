import 'package:flutter/material.dart';
import 'dart:io';
import 'package:find_thing/widgets/custom_appbar.dart';
import 'package:find_thing/design/design.dart';
import 'package:provider/provider.dart';
import 'package:find_thing/providers/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomBarForMainPage(),
      bottomNavigationBar: MainBottomNavigationBar(
        currentIndex: 0,
        onItemSelected: (index) {},
      ),

      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: gapL),
            SizedBox(
              width: searchFieldWidth,
              child: TextField(
                // controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Название вещи или коробки...',
                  hintStyle: TextStyle(
                    fontSize: fontSizeBody,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Inter',
                    color: gray,
                    letterSpacing: letterSpacingWide,
                  ),
                  filled: true,
                  fillColor: grayField,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: grayFieldText),
                    borderRadius: BorderRadius.circular(searchFieldRadiusMain),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: grayFieldText,
                    size: 24,
                  ),
                ),
              ),
            ),
            SizedBox(height: gapM),
            Text(
              'Привет, @username!',
              style: TextStyle(
                fontSize: fontSizeBody,
                fontWeight: FontWeight.bold,
                fontFamily: 'Inter',
                color: blackName,
                letterSpacing: letterSpacingWide,
              ),
            ),
            SizedBox(height: gapM),
            const ScrollListView(),
          ],
        ),
      ),
    );
  }
}

class ScrollListView extends StatelessWidget {
  const ScrollListView({super.key});

  @override
  Widget build(BuildContext context) {
    final providerFilter = Provider.of<ProviderItem>(context);
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        itemCount: providerFilter.location.length,
        itemBuilder: (context, index) {
          final String name = providerFilter.location[index];
          final bool isSelected = providerFilter.indexLocation == index;
          return GestureDetector(
            onTap: () => providerFilter.setIndexLocation(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                color: isSelected ? blueName : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected ? blueName : grayFieldText,
                  width: 1,
                ),
              ),
              child: Text(
                name,
                style: TextStyle(
                  fontSize: fontSizeBody,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Inter',
                  color: isSelected ? Colors.white : gray,
                  letterSpacing: letterSpacingWide,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

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

class ItemCard extends StatelessWidget {
  final StorageItemMain item;
  const ItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: grayFieldText),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.file(
              File(item.pathImage),
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
           const SizedBox(width: 16),
           Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.name, style: TextStyle(fontSize: fontSizeBody, fontWeight: FontWeight.bold, fontFamily: 'Inter', color: blackName, letterSpacing: letterSpacingWide),),
              const SizedBox(height: 8),
              Text(
                'Место: ${item.place}',
                style: TextStyle(fontSize: fontSizeBody, fontWeight: FontWeight.normal, fontFamily: 'Inter', color: gray, letterSpacing: letterSpacingWide),
              )
            ],
           ))
        ],
      )
      
    );
  }
}