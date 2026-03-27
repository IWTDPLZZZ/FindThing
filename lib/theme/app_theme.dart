import 'package:flutter/material.dart';
import 'package:find_thing/design/colors.dart';
import 'package:find_thing/design/dimensions.dart';

/// Builds spacing tokens from [dimensions.dart] (top-level to avoid name clash with [AppSpacingTheme] fields).
AppSpacingTheme createAppSpacingTheme() {
  return AppSpacingTheme(
    gapS: gapS,
    gapM: gapM,
    gapL: gapL,
    gapXL: gapXL,
    gapXXL: gapXXL,
    screenHorizontalPadding: paddingContentHorizontal,
    cardHorizontalMargin: cardHorizontalMargin,
    cardVerticalMargin: cardVerticalMargin,
    cardInnerPadding: cardInnerPadding,
    chipListHorizontalPadding: cardHorizontalMargin,
    chipListVerticalPadding: chipListVerticalPadding,
    chipItemSpacing: chipItemSpacing,
    chipHorizontalPadding: chipHorizontalPadding,
    chipVerticalPadding: chipVerticalPadding,
    bottomNavBarHeight: bottomNavBarHeight,
    bottomNavFabSize: bottomNavFabSize,
    bottomNavRowHorizontalPadding: bottomNavRowHorizontalPadding,
    appBarActionPaddingRight: paddingAppBarRight,
    imageThumbSize: imageThumbSizeItemCard,
  );
}

/// Spacing and layout tokens exposed through [ThemeData] for consistent UI.
class AppSpacingTheme extends ThemeExtension<AppSpacingTheme> {
  final double gapS;
  final double gapM;
  final double gapL;
  final double gapXL;
  final double gapXXL;
  final double screenHorizontalPadding;
  final double cardHorizontalMargin;
  final double cardVerticalMargin;
  final double cardInnerPadding;
  final double chipListHorizontalPadding;
  final double chipListVerticalPadding;
  final double chipItemSpacing;
  final double chipHorizontalPadding;
  final double chipVerticalPadding;
  final double bottomNavBarHeight;
  final double bottomNavFabSize;
  final double bottomNavRowHorizontalPadding;
  final double appBarActionPaddingRight;
  final double imageThumbSize;

  const AppSpacingTheme({
    required this.gapS,
    required this.gapM,
    required this.gapL,
    required this.gapXL,
    required this.gapXXL,
    required this.screenHorizontalPadding,
    required this.cardHorizontalMargin,
    required this.cardVerticalMargin,
    required this.cardInnerPadding,
    required this.chipListHorizontalPadding,
    required this.chipListVerticalPadding,
    required this.chipItemSpacing,
    required this.chipHorizontalPadding,
    required this.chipVerticalPadding,
    required this.bottomNavBarHeight,
    required this.bottomNavFabSize,
    required this.bottomNavRowHorizontalPadding,
    required this.appBarActionPaddingRight,
    required this.imageThumbSize,
  });

  @override
  AppSpacingTheme copyWith({
    double? gapS,
    double? gapM,
    double? gapL,
    double? gapXL,
    double? gapXXL,
    double? screenHorizontalPadding,
    double? cardHorizontalMargin,
    double? cardVerticalMargin,
    double? cardInnerPadding,
    double? chipListHorizontalPadding,
    double? chipListVerticalPadding,
    double? chipItemSpacing,
    double? chipHorizontalPadding,
    double? chipVerticalPadding,
    double? bottomNavBarHeight,
    double? bottomNavFabSize,
    double? bottomNavRowHorizontalPadding,
    double? appBarActionPaddingRight,
    double? imageThumbSize,
  }) {
    return AppSpacingTheme(
      gapS: gapS ?? this.gapS,
      gapM: gapM ?? this.gapM,
      gapL: gapL ?? this.gapL,
      gapXL: gapXL ?? this.gapXL,
      gapXXL: gapXXL ?? this.gapXXL,
      screenHorizontalPadding:
          screenHorizontalPadding ?? this.screenHorizontalPadding,
      cardHorizontalMargin: cardHorizontalMargin ?? this.cardHorizontalMargin,
      cardVerticalMargin: cardVerticalMargin ?? this.cardVerticalMargin,
      cardInnerPadding: cardInnerPadding ?? this.cardInnerPadding,
      chipListHorizontalPadding:
          chipListHorizontalPadding ?? this.chipListHorizontalPadding,
      chipListVerticalPadding:
          chipListVerticalPadding ?? this.chipListVerticalPadding,
      chipItemSpacing: chipItemSpacing ?? this.chipItemSpacing,
      chipHorizontalPadding:
          chipHorizontalPadding ?? this.chipHorizontalPadding,
      chipVerticalPadding: chipVerticalPadding ?? this.chipVerticalPadding,
      bottomNavBarHeight: bottomNavBarHeight ?? this.bottomNavBarHeight,
      bottomNavFabSize: bottomNavFabSize ?? this.bottomNavFabSize,
      bottomNavRowHorizontalPadding:
          bottomNavRowHorizontalPadding ?? this.bottomNavRowHorizontalPadding,
      appBarActionPaddingRight:
          appBarActionPaddingRight ?? this.appBarActionPaddingRight,
      imageThumbSize: imageThumbSize ?? this.imageThumbSize,
    );
  }

  @override
  AppSpacingTheme lerp(ThemeExtension<AppSpacingTheme>? other, double t) {
    if (other is! AppSpacingTheme) return this;
    double lerpD(double a, double b) => a + (b - a) * t;
    return AppSpacingTheme(
      gapS: lerpD(gapS, other.gapS),
      gapM: lerpD(gapM, other.gapM),
      gapL: lerpD(gapL, other.gapL),
      gapXL: lerpD(gapXL, other.gapXL),
      gapXXL: lerpD(gapXXL, other.gapXXL),
      screenHorizontalPadding:
          lerpD(screenHorizontalPadding, other.screenHorizontalPadding),
      cardHorizontalMargin:
          lerpD(cardHorizontalMargin, other.cardHorizontalMargin),
      cardVerticalMargin:
          lerpD(cardVerticalMargin, other.cardVerticalMargin),
      cardInnerPadding: lerpD(cardInnerPadding, other.cardInnerPadding),
      chipListHorizontalPadding:
          lerpD(chipListHorizontalPadding, other.chipListHorizontalPadding),
      chipListVerticalPadding:
          lerpD(chipListVerticalPadding, other.chipListVerticalPadding),
      chipItemSpacing: lerpD(chipItemSpacing, other.chipItemSpacing),
      chipHorizontalPadding:
          lerpD(chipHorizontalPadding, other.chipHorizontalPadding),
      chipVerticalPadding:
          lerpD(chipVerticalPadding, other.chipVerticalPadding),
      bottomNavBarHeight:
          lerpD(bottomNavBarHeight, other.bottomNavBarHeight),
      bottomNavFabSize: lerpD(bottomNavFabSize, other.bottomNavFabSize),
      bottomNavRowHorizontalPadding: lerpD(
          bottomNavRowHorizontalPadding, other.bottomNavRowHorizontalPadding),
      appBarActionPaddingRight:
          lerpD(appBarActionPaddingRight, other.appBarActionPaddingRight),
      imageThumbSize: lerpD(imageThumbSize, other.imageThumbSize),
    );
  }
}

class AppDecorationTheme extends ThemeExtension<AppDecorationTheme> {
  final BoxDecoration socialButtonDecoration;
  final BoxDecoration successIconDecoration;
  final BoxDecoration bottomNavBarDecoration;
  final BoxDecoration bottomNavFabDecoration;

  const AppDecorationTheme({
    required this.socialButtonDecoration,
    required this.successIconDecoration,
    required this.bottomNavBarDecoration,
    required this.bottomNavFabDecoration,
  });

  BoxDecoration cardDecoration({Color? borderColor}) => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radiusCard),
        border: Border.all(
          color: borderColor ?? outlineSubtle,
          width: 1,
        ),
        boxShadow: AppTheme.cardElevationShadow,
      );

  BoxDecoration scrollListChipDecoration({required bool isSelected}) =>
      BoxDecoration(
        color: isSelected ? accentBlueDeep : Colors.transparent,
        borderRadius: BorderRadius.circular(radiusChip),
        border: Border.all(
          color: isSelected ? accentBlueDeep : outlineSubtle,
          width: 1,
        ),
        boxShadow: isSelected ? AppTheme.chipSelectedShadow : null,
      );

  @override
  AppDecorationTheme copyWith({
    BoxDecoration? socialButtonDecoration,
    BoxDecoration? successIconDecoration,
    BoxDecoration? bottomNavBarDecoration,
    BoxDecoration? bottomNavFabDecoration,
  }) {
    return AppDecorationTheme(
      socialButtonDecoration:
          socialButtonDecoration ?? this.socialButtonDecoration,
      successIconDecoration:
          successIconDecoration ?? this.successIconDecoration,
      bottomNavBarDecoration:
          bottomNavBarDecoration ?? this.bottomNavBarDecoration,
      bottomNavFabDecoration:
          bottomNavFabDecoration ?? this.bottomNavFabDecoration,
    );
  }

  @override
  AppDecorationTheme lerp(
      ThemeExtension<AppDecorationTheme>? other, double t) {
    if (other is! AppDecorationTheme) return this;
    return AppDecorationTheme(
      socialButtonDecoration:
          BoxDecoration.lerp(socialButtonDecoration, other.socialButtonDecoration, t)!,
      successIconDecoration:
          BoxDecoration.lerp(successIconDecoration, other.successIconDecoration, t)!,
      bottomNavBarDecoration:
          BoxDecoration.lerp(bottomNavBarDecoration, other.bottomNavBarDecoration, t)!,
      bottomNavFabDecoration:
          BoxDecoration.lerp(bottomNavFabDecoration, other.bottomNavFabDecoration, t)!,
    );
  }
}

class AppTheme {
  AppTheme._();

  static List<BoxShadow> get cardElevationShadow => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.06),
          blurRadius: 16,
          offset: const Offset(0, 4),
        ),
      ];

  static List<BoxShadow> get chipSelectedShadow => [
        BoxShadow(
          color: accentBlueDeep.withValues(alpha: 0.28),
          blurRadius: 10,
          offset: const Offset(0, 3),
        ),
      ];

  static const LinearGradient onboardingPrimaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF33A6FF),
      lightBlue,
      accentBlueDeep,
    ],
  );

  static List<BoxShadow> get onboardingButtonShadow => [
        BoxShadow(
          color: lightBlue.withValues(alpha: 0.38),
          blurRadius: 18,
          offset: const Offset(0, 8),
        ),
      ];

  static ThemeData get light {
    final ColorScheme scheme = ColorScheme.fromSeed(
      seedColor: lightBlue,
      brightness: Brightness.light,
      primary: lightBlue,
      onPrimary: Colors.white,
      primaryContainer: const Color(0xFFD4E9FF),
      onPrimaryContainer: accentBlueDeep,
      surface: Colors.white,
      onSurface: blackName,
      onSurfaceVariant: gray,
      outline: outlineSubtle,
      surfaceContainerHighest: grayField,
    );
    return ThemeData(
      useMaterial3: true,
      primaryColor: lightBlue,
      scaffoldBackgroundColor: surfaceCanvas,
      fontFamily: 'Inter',
      colorScheme: scheme,
      textTheme: _textTheme,
      inputDecorationTheme: _inputDecorationTheme,
      appBarTheme: _appBarTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      outlinedButtonTheme: _outlinedButtonTheme,
      textButtonTheme: _textButtonTheme,
      extensions: [_appDecorationTheme, createAppSpacingTheme()],
    );
  }

  static const TextTheme _textTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: fontSizeHeadline,
      fontWeight: FontWeight.bold,
      fontFamily: 'Inter',
      color: blackName,
      letterSpacing: -0.5,
      height: 1.2,
    ),
    headlineLarge: TextStyle(
      fontSize: fontSizeOnboardingHero,
      fontWeight: FontWeight.bold,
      fontFamily: 'Inter',
      color: blackName,
      height: 1.22,
      letterSpacing: -0.6,
    ),
    headlineMedium: TextStyle(
      fontSize: fontSizeTitle,
      fontWeight: FontWeight.bold,
      fontFamily: 'Inter',
      color: blackName,
      letterSpacing: -0.3,
      height: 1.25,
    ),
    titleLarge: TextStyle(
      fontSize: fontSizeAppBarTitle,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
      fontFamily: 'CupertinoSystemDisplay',
      color: blackName,
    ),
    titleMedium: TextStyle(
      fontSize: fontSizeBody,
      fontWeight: FontWeight.w600,
      fontFamily: 'Inter',
      color: blackName,
      letterSpacing: 0.15,
    ),
    bodyLarge: TextStyle(
      fontSize: fontSizeBody,
      fontWeight: FontWeight.normal,
      fontFamily: 'Inter',
      color: gray,
      height: 1.45,
      letterSpacing: 0.2,
    ),
    bodyMedium: TextStyle(
      fontSize: fontSizeBody,
      fontWeight: FontWeight.normal,
      fontFamily: 'Inter',
      color: gray,
      height: 1.45,
      letterSpacing: 0,
    ),
    labelLarge: TextStyle(
      fontSize: fontSizeButtonLabel,
      fontWeight: FontWeight.w500,
      fontFamily: 'Inter',
      letterSpacing: 0.4,
      height: lineHeightButton,
    ),
    labelMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      fontFamily: 'Inter',
      color: lightBlue,
      letterSpacing: 0.1,
    ),
    bodySmall: TextStyle(
      fontSize: fontSizeBody,
      fontWeight: FontWeight.normal,
      fontFamily: 'Inter',
      color: memory,
      letterSpacing: letterSpacingWide,
    ),
  );

  static InputDecorationTheme get _inputDecorationTheme {
    const borderSide = BorderSide(color: outlineSubtle, width: 1);
    return InputDecorationTheme(
      hintStyle: _textTheme.bodyLarge,
      filled: true,
      fillColor: grayField,
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      border: OutlineInputBorder(
        borderSide: borderSide,
        borderRadius: BorderRadius.circular(radiusField),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: borderSide,
        borderRadius: BorderRadius.circular(radiusField),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: lightBlue, width: 1.5),
        borderRadius: BorderRadius.circular(radiusField),
      ),
    );
  }

  static const AppBarTheme _appBarTheme = AppBarTheme(
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle: false,
    titleTextStyle: TextStyle(
      fontSize: fontSizeAppBarTitle,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
      fontFamily: 'CupertinoSystemDisplay',
      color: blackName,
    ),
    iconTheme: IconThemeData(color: blackName),
  );

  static ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, loginButtonHeight),
        padding: const EdgeInsets.symmetric(
          horizontal: paddingButtonHorizontal,
          vertical: 14,
        ),
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusLoginButton),
        ),
        backgroundColor: lightBlue,
        foregroundColor: Colors.white,
        textStyle: _textTheme.labelLarge!.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  static OutlinedButtonThemeData get _outlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, loginButtonHeight),
        padding: const EdgeInsets.symmetric(
          horizontal: paddingButtonHorizontal,
          vertical: 14,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusLoginButton),
        ),
        side: const BorderSide(color: lightBlue, width: 1.5),
        foregroundColor: lightBlue,
        textStyle: _textTheme.labelLarge,
      ),
    );
  }

  static TextButtonThemeData get _textButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: paddingTextButtonHorizontal,
          vertical: paddingTextButtonVertical,
        ),
        foregroundColor: memory,
        textStyle: _textTheme.bodySmall,
      ),
    );
  }

  /// Auth field decoration (email, password).
  static InputDecoration authInputDecoration(
    BuildContext context, {
    required String hintText,
    Widget? prefixIcon,
  }) {
    final InputDecorationThemeData base =
        Theme.of(context).inputDecorationTheme;
    return InputDecoration(
      hintText: hintText,
      hintStyle: base.hintStyle,
      filled: base.filled,
      fillColor: base.fillColor,
      contentPadding: base.contentPadding,
      prefixIcon: prefixIcon,
      prefixIconConstraints: const BoxConstraints(minWidth: 48, minHeight: 48),
      border: base.border,
      enabledBorder: base.enabledBorder,
      focusedBorder: base.focusedBorder,
    );
  }

  /// Search field on main page (soft filled bar, minimal border).
  static InputDecoration searchInputDecoration(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    return InputDecoration(
      hintText: 'Название вещи или коробки...',
      hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: scheme.onSurfaceVariant.withValues(alpha: 0.65),
          ),
      filled: true,
      fillColor: scheme.surfaceContainerHighest,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      isDense: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(searchFieldRadiusMain),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(searchFieldRadiusMain),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(searchFieldRadiusMain),
        borderSide: const BorderSide(color: lightBlue, width: 1.5),
      ),
      prefixIcon: Icon(
        Icons.search_rounded,
        color: scheme.onSurfaceVariant.withValues(alpha: 0.55),
        size: 22,
      ),
    );
  }

  /// Fallback Elevated style for wide onboarding CTA (prefer gradient widget).
  static ButtonStyle get elevatedButtonOnboardingStyle =>
      ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, onboardingButtonHeight),
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusOnboardingButton),
        ),
        backgroundColor: lightBlue,
        foregroundColor: Colors.white,
        textStyle: _textTheme.labelLarge!.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 17,
        ),
      );

  /// Body text for scroll list chip (color depends on selection).
  static TextStyle bodyChip(BuildContext context, {required bool isSelected}) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final TextStyle base = Theme.of(context).textTheme.bodyLarge!;
    return base.copyWith(
      fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
      color: isSelected ? Colors.white : scheme.onSurfaceVariant,
      letterSpacing: 0.1,
    );
  }

  /// App bar title style with brand colors (Find=blue, Thing=black).
  static TextStyle appBarTitleFind(BuildContext context) =>
      Theme.of(context).textTheme.titleLarge!.copyWith(color: blueName);

  static TextStyle appBarTitleThing(BuildContext context) =>
      Theme.of(context).textTheme.titleLarge!.copyWith(color: blackName);

  /// Text button with wider padding (e.g. "Забыли пароль?").
  static ButtonStyle get textButtonMemoryStyleWide => TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: paddingButtonHorizontal,
          vertical: paddingButtonVertical,
        ),
        foregroundColor: memory,
        textStyle: _textTheme.bodySmall,
      );

  /// Bottom nav item label style.
  static TextStyle bottomNavItemLabel(BuildContext context,
      {required bool isActive}) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    return Theme.of(context).textTheme.labelLarge!.copyWith(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
          height: 1.1,
          color: isActive
              ? scheme.onSurface
              : scheme.onSurface.withValues(alpha: 0.52),
        );
  }

  /// Muted copy for empty states and hints.
  static TextStyle emptyStateBody(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    return Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: scheme.onSurfaceVariant.withValues(alpha: 0.55),
          height: 1.4,
        );
  }

  static final AppDecorationTheme _appDecorationTheme = AppDecorationTheme(
    socialButtonDecoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(radiusSocialButton),
      border: Border.all(color: outlineSubtle, width: 1),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.05),
          blurRadius: 10,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    successIconDecoration: BoxDecoration(
      shape: BoxShape.circle,
      color: lightBlue,
    ),
    bottomNavBarDecoration: BoxDecoration(
      color: Colors.white.withValues(alpha: 0.78),
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
      border: Border(
        top: BorderSide(color: outlineSubtle.withValues(alpha: 0.85)),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.06),
          blurRadius: 24,
          offset: const Offset(0, -6),
        ),
      ],
    ),
    bottomNavFabDecoration: BoxDecoration(
      color: accentBlueDeep,
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
          color: accentBlueDeep.withValues(alpha: 0.45),
          blurRadius: 16,
          offset: const Offset(0, 6),
        ),
      ],
    ),
  );
}

/// Extension to easily access AppDecorationTheme from context.
extension AppDecorationThemeExtension on BuildContext {
  AppDecorationTheme get appDecoration =>
      Theme.of(this).extension<AppDecorationTheme>()!;
}

/// Spacing tokens from the active theme.
extension AppSpacingThemeExtension on BuildContext {
  AppSpacingTheme get appSpacing =>
      Theme.of(this).extension<AppSpacingTheme>()!;
}
