import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// A class that encapsulates the Material Design theme for the application.
class MaterialTheme {
  /// The text theme for the application.
  final TextTheme textTheme;

  /// Creates a [MaterialTheme] instance with the given text theme.
  const MaterialTheme(this.textTheme);

  /// Creates and returns a light color scheme.
  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff4c662b),
      surfaceTint: Color(0xff4c662b),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffcdeda3),
      onPrimaryContainer: Color(0xff102000),
      secondary: Color(0xff586249),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffdce7c8),
      onSecondaryContainer: Color(0xff151e0b),
      tertiary: Color(0xff386663),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffbcece7),
      onTertiaryContainer: Color(0xff00201e),
      error: Color(0xffba1a1a),
      onError: Color(0xffeab6b6),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfff9faef),
      onSurface: Color(0xff1a1c16),
      onSurfaceVariant: Color(0xff44483d),
      outline: Color(0xff75796c),
      outlineVariant: Color(0xffc5c8ba),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2f312a),
      inversePrimary: Color(0xffb1d18a),
      primaryFixed: Color(0xffcdeda3),
      onPrimaryFixed: Color(0xff102000),
      primaryFixedDim: Color(0xffb1d18a),
      onPrimaryFixedVariant: Color(0xff354e16),
      secondaryFixed: Color(0xffdce7c8),
      onSecondaryFixed: Color(0xff151e0b),
      secondaryFixedDim: Color(0xffbfcbad),
      onSecondaryFixedVariant: Color(0xff404a33),
      tertiaryFixed: Color(0xffbcece7),
      onTertiaryFixed: Color(0xff00201e),
      tertiaryFixedDim: Color(0xffa0d0cb),
      onTertiaryFixedVariant: Color(0xff1f4e4b),
      surfaceDim: Color(0xffdadbd0),
      surfaceBright: Color(0xfff9faef),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff3f4e9),
      surfaceContainer: Color(0xffeeefe3),
      surfaceContainerHigh: Color(0xffe8e9de),
      surfaceContainerHighest: Color(0xffe2e3d8),
    );
  }


  ///Customs colors for light theme
  ThemeData light() {
    return theme(lightScheme(), [
      CustomStatusColors(
        requestedColor: Colors.amber.shade600.withOpacity(0.4),
        rejectedColor: Colors.red.shade600.withOpacity(0.4),
        confirmedColor: Colors.green.shade600.withOpacity(0.4),
        vacationColor: Colors.blue.shade400.withOpacity(0.4),
        sicknessColor: Colors.purple.shade400.withOpacity(0.4),
      ),
    ] );
  }


  /// Creates and returns a dark color scheme.
  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffb1d18a),
      surfaceTint: Color(0xffb1d18a),
      onPrimary: Color(0xff1f3701),
      primaryContainer: Color(0xff354e16),
      onPrimaryContainer: Color(0xffcdeda3),
      secondary: Color(0xffbfcbad),
      onSecondary: Color(0xff2a331e),
      secondaryContainer: Color(0xff404a33),
      onSecondaryContainer: Color(0xffdce7c8),
      tertiary: Color(0xffa0d0cb),
      onTertiary: Color(0xff003735),
      tertiaryContainer: Color(0xff1f4e4b),
      onTertiaryContainer: Color(0xffbcece7),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff12140e),
      onSurface: Color(0xffe2e3d8),
      onSurfaceVariant: Color(0xffc5c8ba),
      outline: Color(0xff8f9285),
      outlineVariant: Color(0xff44483d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe2e3d8),
      inversePrimary: Color(0xff4c662b),
      primaryFixed: Color(0xffcdeda3),
      onPrimaryFixed: Color(0xff102000),
      primaryFixedDim: Color(0xffb1d18a),
      onPrimaryFixedVariant: Color(0xff354e16),
      secondaryFixed: Color(0xffdce7c8),
      onSecondaryFixed: Color(0xff151e0b),
      secondaryFixedDim: Color(0xffbfcbad),
      onSecondaryFixedVariant: Color(0xff404a33),
      tertiaryFixed: Color(0xffbcece7),
      onTertiaryFixed: Color(0xff00201e),
      tertiaryFixedDim: Color(0xffa0d0cb),
      onTertiaryFixedVariant: Color(0xff1f4e4b),
      surfaceDim: Color(0xff12140e),
      surfaceBright: Color(0xff383a32),
      surfaceContainerLowest: Color(0xff0c0f09),
      surfaceContainerLow: Color(0xff1a1c16),
      surfaceContainer: Color(0xff1e201a),
      surfaceContainerHigh: Color(0xff282b24),
      surfaceContainerHighest: Color(0xff33362e),
    );
  }


  ///Customs colors for dark theme
  ThemeData dark() {
    return theme(darkScheme(), [
      CustomStatusColors(
        requestedColor: Colors.amber.shade200.withOpacity(0.4),
        rejectedColor: Colors.red.shade200.withOpacity(0.4),
        confirmedColor: Colors.green.shade200.withOpacity(0.4),
        vacationColor: Colors.blue.shade200.withOpacity(0.4),
        sicknessColor: Colors.purple.shade200.withOpacity(0.4),
      ),
    ]);
  }

  ///Create the theme
  ThemeData theme(final ColorScheme colorScheme, final List<ThemeExtension> list,  ) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.surface,
    canvasColor: colorScheme.surface,
    extensions: list,
  );
}

/// Define CustomStatusColors ThemeExtension
class CustomStatusColors extends ThemeExtension<CustomStatusColors> {

  /// The color for requested absence status.
  final Color requestedColor;

  /// The color for rejected absence status.
  final Color rejectedColor;

  /// The color for confirmed absence status.
  final Color confirmedColor;

  /// The color for vacation type absence.
  final Color vacationColor;

  /// The color for sickness type absence.
  final Color sicknessColor;

  ///Creates the instance
  CustomStatusColors({
    required this.requestedColor,
    required this.rejectedColor,
    required this.confirmedColor,
    required this.vacationColor,
    required this.sicknessColor,
  });

  @override
  CustomStatusColors copyWith({
    final Color? requestedColor,
    final Color? rejectedColor,
    final Color? confirmedColor,
    final Color? vacationColor,  // New
    final Color? sicknessColor,  // New
  }) {
    return CustomStatusColors(
      requestedColor: requestedColor ?? this.requestedColor,
      rejectedColor: rejectedColor ?? this.rejectedColor,
      confirmedColor: confirmedColor ?? this.confirmedColor,
      vacationColor: vacationColor ?? this.vacationColor,  // New
      sicknessColor: sicknessColor ?? this.sicknessColor,  // New
    );
  }

  @override
  CustomStatusColors lerp(
      final ThemeExtension<CustomStatusColors>? other, final double t,) {
    if (other is! CustomStatusColors) return this;
    return CustomStatusColors(
      requestedColor: requestedColor,
      rejectedColor: rejectedColor,
      confirmedColor: confirmedColor,
      vacationColor: vacationColor,  // New
      sicknessColor: sicknessColor,  // New
    );
  }
}

///Theme for text
TextTheme createTextTheme(
    final BuildContext context, final String bodyFontString, final String displayFontString,) {
  final TextTheme baseTextTheme = Theme.of(context).textTheme;
  final TextTheme bodyTextTheme = GoogleFonts.getTextTheme(bodyFontString, baseTextTheme);
  final TextTheme displayTextTheme =
  GoogleFonts.getTextTheme(displayFontString, baseTextTheme);
  final TextTheme textTheme = displayTextTheme.copyWith(
    bodyLarge: bodyTextTheme.bodyLarge,
    bodyMedium: bodyTextTheme.bodyMedium,
    bodySmall: bodyTextTheme.bodySmall,
    labelLarge: bodyTextTheme.labelLarge,
    labelMedium: bodyTextTheme.labelMedium,
    labelSmall: bodyTextTheme.labelSmall,
  );
  return textTheme;
}