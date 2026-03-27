import 'dart:math' as math;

import 'package:find_thing/design/design.dart';
import 'package:flutter/material.dart';
import 'package:find_thing/widgets/custom_appbar.dart';
import 'package:find_thing/theme/app_theme.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppSpacingTheme spacing = context.appSpacing;
    final double hPad = spacing.screenHorizontalPadding;

    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double maxW = constraints.maxWidth;
            final double imgW = math.min(imageWidth, maxW - 2 * hPad);
            final double imgH = math.min(
              imageHeight,
              constraints.maxHeight * 0.4,
            );

            return SingleChildScrollView(
              padding: EdgeInsets.only(bottom: spacing.gapL),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight - spacing.gapM,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: hPad),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: spacing.gapM),
                      SizedBox(
                        width: imgW,
                        height: imgH,
                        child: Image.asset(
                          'assets/images/imprPage.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: spacing.gapXL),
                      Text(
                        'Хватит искать',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Text(
                        'Пора находить!',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      SizedBox(height: spacing.gapL),
                      Text(
                        'Инвентаризация личных вещей на базе ИИ.\n'
                        'Забудьте о потерянных вещах!',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      SizedBox(height: spacing.gapXL),
                      _OnboardingPrimaryButton(
                        label: 'Начать',
                        onPressed: () {
                          Navigator.pushNamed(context, '/auth');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _OnboardingPrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const _OnboardingPrimaryButton({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final BorderRadius radius =
        BorderRadius.circular(radiusOnboardingButton);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: radius,
        gradient: AppTheme.onboardingPrimaryGradient,
        boxShadow: AppTheme.onboardingButtonShadow,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: radius,
          child: SizedBox(
            height: onboardingButtonHeight,
            child: Center(
              child: Text(
                label,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
