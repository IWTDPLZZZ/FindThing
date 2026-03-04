import 'package:flutter/material.dart';
import 'package:find_thing/widgets/custom_appbar.dart';
class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(),
     body: Center(
      child: Text('Second Page')

      )
      
      
      );

    
  }
} 