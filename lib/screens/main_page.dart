import 'package:flutter/material.dart';
import 'package:find_thing/widgets/custom_appbar.dart';
import 'package:find_thing/design/design.dart';
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: const CustomBarForMainPage(), body: 
    Center(child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      
      SizedBox(height: gapL),
      SizedBox(
        width: searchFieldWidth,
        child: TextField(
          // controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Название вещи или коробки...',
            hintStyle: TextStyle(fontSize: fontSizeBody, fontWeight: FontWeight.normal, fontFamily: 'Inter', color: gray, letterSpacing: letterSpacingWide),
            filled: true,
            fillColor: grayField,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15), 
            border: OutlineInputBorder(
              borderSide: BorderSide(color: grayFieldText),
              borderRadius: BorderRadius.circular(searchFieldRadiusMain),
            ),
            prefixIcon: Icon(Icons.search, color: grayFieldText, size: 24),
          ),
        ),
      ),
      
    
      Text('Привет, @username!', style: TextStyle(fontSize: fontSizeBody, fontWeight: FontWeight.bold, fontFamily: 'Inter', color: blackName, letterSpacing: letterSpacingWide),),

      
      SizedBox(height: gapL),
      SizedBox(
        width: radiusSearchFieldAllThings,child: 
      Align(
        alignment: Alignment.centerLeft,
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Все вещи и коробки',
            hintStyle: TextStyle(fontSize: fontSizeBody, fontWeight: FontWeight.normal, fontFamily: 'Inter', color: gray, letterSpacing: letterSpacingWide),
            filled: true,
            fillColor: grayField,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15), 
            border: OutlineInputBorder(
              borderSide: BorderSide(color: grayFieldText),
              borderRadius: BorderRadius.circular(radiusSearchFieldAllThings),
            ),
          ),
        ),
      ),
      ),
    ],),),);
  }
}
