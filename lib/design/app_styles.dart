import 'package:flutter/material.dart';
import 'package:find_thing/design/design.dart';

// --- TextStyles ---

/// Body text, normal weight, gray color.
const TextStyle textStyleBody = TextStyle(
  fontSize: fontSizeBody,
  fontWeight: FontWeight.normal,
  fontFamily: 'Inter',
  color: gray,
  letterSpacing: letterSpacingWide,
);

/// Body text for scroll list chip (color depends on selection).
TextStyle textStyleBodyChip({required bool isSelected}) => TextStyle(
      fontSize: fontSizeBody,
      fontWeight: FontWeight.normal,
      fontFamily: 'Inter',
      color: isSelected ? Colors.white : gray,
      letterSpacing: letterSpacingWide,
    );

/// Body text, normal weight, gray color, no letter spacing.
const TextStyle textStyleBodyTight = TextStyle(
  fontSize: fontSizeBody,
  fontWeight: FontWeight.normal,
  fontFamily: 'Inter',
  color: gray,
  letterSpacing: 0,
);

/// Body text, bold, black color.
const TextStyle textStyleBodyBold = TextStyle(
  fontSize: fontSizeBody,
  fontWeight: FontWeight.bold,
  fontFamily: 'Inter',
  color: blackName,
  letterSpacing: letterSpacingWide,
);

/// Title text, bold, black color.
const TextStyle textStyleTitle = TextStyle(
  fontSize: fontSizeTitle,
  fontWeight: FontWeight.bold,
  fontFamily: 'Inter',
  color: blackName,
  letterSpacing: 0,
);

/// Headline text, bold, black color.
const TextStyle textStyleHeadline = TextStyle(
  fontSize: fontSizeHeadline,
  fontWeight: FontWeight.bold,
  fontFamily: 'Inter',
  color: blackName,
  letterSpacing: 0,
);

/// Button label, semibold.
const TextStyle textStyleButtonLabel = TextStyle(
  fontSize: fontSizeBody,
  fontWeight: FontWeight.w600,
  fontFamily: 'Inter',
  letterSpacing: letterSpacingWide,
);

/// Text button / link style, memory color.
const TextStyle textStyleBodyMemory = TextStyle(
  fontSize: fontSizeBody,
  fontWeight: FontWeight.normal,
  fontFamily: 'Inter',
  color: memory,
  letterSpacing: letterSpacingWide,
);

/// Onboarding button text.
const TextStyle textStyleButtonOnboarding = TextStyle(
  height: lineHeightButton,
  fontSize: fontSizeButtonLabel,
  fontWeight: FontWeight.bold,
  fontFamily: 'Inter',
  color: Colors.white,
);

// --- InputDecoration ---

/// Standard auth field (email, password).
InputDecoration authInputDecoration({
  required String hintText,
}) =>
    InputDecoration(
      hintText: hintText,
      hintStyle: textStyleBody,
      filled: true,
      fillColor: grayField,
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: grayFieldText),
        borderRadius: BorderRadius.circular(radiusField),
      ),
    );

/// Search field on main page.
InputDecoration get searchInputDecoration => InputDecoration(
      hintText: 'Название вещи или коробки...',
      hintStyle: textStyleBody,
      filled: true,
      fillColor: grayField,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: grayFieldText),
        borderRadius: BorderRadius.circular(searchFieldRadiusMain),
      ),
      prefixIcon: const Icon(Icons.search, color: grayFieldText, size: 24),
    );

// --- BoxDecoration ---

/// Social login button (circle with border).
final BoxDecoration socialButtonDecoration = BoxDecoration(
  shape: BoxShape.circle,
  border: Border.all(color: grayFieldText),
);

/// Item card (white with border).
BoxDecoration cardDecoration({Color borderColor = grayFieldText}) =>
    BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: borderColor),
    );

/// Success icon circle (lightBlue).
const BoxDecoration successIconDecoration = BoxDecoration(
  shape: BoxShape.circle,
  color: lightBlue,
);

/// Scroll list chip - selected state.
BoxDecoration scrollListChipDecoration({required bool isSelected}) =>
    BoxDecoration(
      color: isSelected ? blueName : Colors.transparent,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: isSelected ? blueName : grayFieldText,
        width: 1,
      ),
    );

// --- Button Styles ---

/// Primary elevated button (login, continue).
ButtonStyle elevatedButtonPrimaryStyle = ElevatedButton.styleFrom(
  minimumSize: const Size(contentWidth, loginButtonHeight),
  padding: const EdgeInsets.symmetric(
    horizontal: paddingButtonHorizontal,
    vertical: paddingButtonVertical,
  ),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(radiusLoginButton),
  ),
  backgroundColor: lightBlue,
  foregroundColor: Colors.white,
);

/// Onboarding button style.
ButtonStyle elevatedButtonOnboardingStyle = ElevatedButton.styleFrom(
  minimumSize: const Size(double.infinity, onboardingButtonHeight),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(radiusOnboardingButton),
  ),
  backgroundColor: lightBlue,
  foregroundColor: Colors.white,
  textStyle: textStyleButtonOnboarding,
);

/// Outlined button (secondary actions).
ButtonStyle outlinedButtonPrimaryStyle = OutlinedButton.styleFrom(
  minimumSize: const Size(contentWidth, loginButtonHeight),
  padding: const EdgeInsets.symmetric(
    horizontal: paddingButtonHorizontal,
    vertical: paddingButtonVertical,
  ),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(radiusLoginButton),
  ),
  side: const BorderSide(color: lightBlue, width: 2),
  foregroundColor: lightBlue,
);

/// Text button for links (e.g. "Нет аккаунта?").
ButtonStyle textButtonMemoryStyle = TextButton.styleFrom(
  padding: const EdgeInsets.symmetric(
    horizontal: paddingTextButtonHorizontal,
    vertical: paddingTextButtonVertical,
  ),
  textStyle: textStyleBodyMemory,
);

/// Text button for links with wider padding (e.g. "Забыли пароль?").
ButtonStyle textButtonMemoryStyleWide = TextButton.styleFrom(
  padding: const EdgeInsets.symmetric(
    horizontal: paddingButtonHorizontal,
    vertical: paddingButtonVertical,
  ),
  textStyle: textStyleBodyMemory,
);
