import 'package:flutter/material.dart';
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
