import 'package:flutter/material.dart';
import 'package:find_thing/widgets/custom_appbar.dart';
import 'package:find_thing/widgets/scroll_list_view.dart';
import 'package:find_thing/widgets/main_bottom_navigation_bar.dart';
import 'package:find_thing/design/design.dart';

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
                decoration: searchInputDecoration,
              ),
            ),
            SizedBox(height: gapM),
            Text(
              'Привет, @username!',
              style: textStyleBodyBold,
            ),
            SizedBox(height: gapM),
            const ScrollListView(),
          ],
        ),
      ),
    );
  }
}
