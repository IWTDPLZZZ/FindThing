import 'package:find_thing/desigh/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        title: RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
              fontFamily: 'CupertinoSystemDisplay',
            ),
            children: [
              TextSpan(
                text: 'Find',
                style: TextStyle(color: blueName),
              ),
              TextSpan(
                text: 'Thing',
                style: TextStyle(color: blackName),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                print('Нажата кнопка профиля');
              },
              child: CircleAvatar(
                radius: 18,
                backgroundColor: gray,
                child: SvgPicture.asset(
                  'assets/images/iconOfAccount.svg',
                  width: 36,
                  height: 36,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: SvgPicture.asset('assets/images/grayLine.svg'),
        ),
      ),

      body: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/images/imprPage.png',
              width: 350,
              height: 400,
              fit: BoxFit.contain,
            ),
            Transform.translate(
              offset: const Offset(0, -50),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Хватит искать',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      color: blackName,
                      fontFamily: 'Inter',
                      letterSpacing: 0,
                    ),
                  ),
                  // const SizedBox(height: 4),
                  const Text(
                    'Пора находить!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                      color: blackName,
                      letterSpacing: 0,
                    ),
                    
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Инвентаризация личных вещей на базе ИИ.\n'
                    'Забудьте о потерянных вещах!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Inter',
                      color: gray,
                      letterSpacing: 0,
                    ),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/auth');
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: lightBlue,
                      foregroundColor: Colors.white,
                      textStyle: TextStyle(
                        height: 1.5,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter',
                        color: Colors.white,
                        
                      ),
                    ),
                    child: Text('Начать'),
                  )
                ],
              ),
            ),
            ),
          ],
          
        ),
        
      ),
    );
    
  }
}



