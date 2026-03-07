import 'package:find_thing/design/design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:find_thing/widgets/custom_appbar.dart';
class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   scrolledUnderElevation: 0,
      //   centerTitle: false,
      //   title: RichText(
      //     text: TextSpan(
      //       style: const TextStyle(
      //         fontSize: fontSizeAppBarTitle,
      //         fontWeight: FontWeight.bold,
      //         fontStyle: FontStyle.normal,
      //         fontFamily: 'CupertinoSystemDisplay',
      //       ),
      //       children: const [
      //         TextSpan(
      //           text: 'Find',
      //           style: TextStyle(color: blueName),
      //         ),
      //         TextSpan(
      //           text: 'Thing',
      //           style: TextStyle(color: blackName),
      //         ),
      //       ],
      //     ),
      //   ),
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.only(right: paddingAppBarRight),
      //       child: GestureDetector(
      //         onTap: () {},
      //         child: CircleAvatar(
      //           radius: avatarRadius,
      //           backgroundColor: gray,
      //           child: SvgPicture.asset(
      //             'assets/images/iconOfAccount.svg',
      //             width: accountIconSize,
      //             height: accountIconSize,
      //             fit: BoxFit.cover,
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      //   bottom: PreferredSize(
      //     preferredSize: const Size.fromHeight(appBarDividerHeight),
      //     child: SvgPicture.asset('assets/images/grayLine.svg'),
      //   ),
      // ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/images/imprPage.png',
              width: imageWidth,
              height: imageHeight,
              fit: BoxFit.contain,
            ),
            Transform.translate(
              offset: const Offset(0, onboardingImageOffsetY),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: paddingContentHorizontal,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Хватит искать',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: fontSizeHeadline,
                        fontWeight: FontWeight.bold,
                        color: blackName,
                        fontFamily: 'Inter',
                        letterSpacing: 0,
                      ),
                    ),
                    const Text(
                      'Пора находить!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: fontSizeHeadline,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter',
                        color: blackName,
                        letterSpacing: 0,
                      ),
                    ),
                    const SizedBox(height: gapL),
                    const Text(
                      'Инвентаризация личных вещей на базе ИИ.\n'
                      'Забудьте о потерянных вещах!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: fontSizeBody,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Inter',
                        color: gray,
                        letterSpacing: 0,
                      ),
                    ),
                    const SizedBox(height: gapXL),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/auth');
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, onboardingButtonHeight),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(radiusOnboardingButton),
                        ),
                        backgroundColor: lightBlue,
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(
                          height: lineHeightButton,
                          fontSize: fontSizeButtonLabel,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter',
                          color: Colors.white,
                        ),
                      ),
                      child: const Text('Начать'),
                    ),
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
