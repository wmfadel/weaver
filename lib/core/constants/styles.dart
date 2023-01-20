import 'package:flutter/material.dart';

import 'colors.dart';

class TextStyles {
  static const lightTheme = TextTheme(
    displayLarge: TextStyle(
        fontSize: 96,
        fontWeight: FontWeight.w300,
        height: 0.85,
        color: AppColors.red900),
    displayMedium: TextStyle(
        fontSize: 60,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5,
        color: AppColors.red900),
    displaySmall: TextStyle(
        fontSize: 48, fontWeight: FontWeight.w400, color: AppColors.red900),
    headlineMedium: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: AppColors.red900),
    headlineSmall: TextStyle(
        fontSize: 24, fontWeight: FontWeight.w400, color: AppColors.red900),
    titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
        color: AppColors.red900),
    titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        color: AppColors.red900),
    titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        color: AppColors.red900),
    bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        color: AppColors.red900),
    bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: AppColors.red900),
    labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.25,
        color: AppColors.red900),
    bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        color: AppColors.red900),
    labelSmall: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5,
        color: AppColors.red900),
  );
}

extension TextStyleHelpers on TextStyle {
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);

  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);

  TextStyle letterSpace(double value) => copyWith(letterSpacing: value);
}

extension XTextStyle on BuildContext {
  TextStyle get displayLarge => Theme.of(this).textTheme.displayLarge!;

  TextStyle get displayMedium => Theme.of(this).textTheme.displayMedium!;

  TextStyle get displaySmall => Theme.of(this).textTheme.displaySmall!;

  TextStyle get headlineMedium => Theme.of(this).textTheme.headlineMedium!;

  TextStyle get headlineSmall => Theme.of(this).textTheme.headlineSmall!;

  TextStyle get titleLarge => Theme.of(this).textTheme.titleLarge!;

  TextStyle get titleMedium => Theme.of(this).textTheme.titleMedium!;

  TextStyle get titleSmall => Theme.of(this).textTheme.titleSmall!;

  TextStyle get bodyLarge => Theme.of(this).textTheme.bodyLarge!;

  TextStyle get bodyMedium => Theme.of(this).textTheme.bodyMedium!;

  TextStyle get labelLarge => Theme.of(this).textTheme.labelLarge!;

  TextStyle get bodySmall => Theme.of(this).textTheme.bodySmall!;

  TextStyle get labelSmall => Theme.of(this).textTheme.labelSmall!;
}
