import 'package:flutter/material.dart';

class AppFonts {
  static const fontFamily = 'Inter';

  static TextStyle largeTitle({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize ?? 32,
      height: 1.1875,
      fontWeight: fontWeight ?? FontWeight.w700,
      color: _toColor(color),
    );
  }

  static TextStyle title1({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize ?? 28,
      fontWeight: fontWeight ?? FontWeight.w700,
      color: _toColor(color),
      height: 1.14,
    );
  }

  static TextStyle title2({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize ?? 24,
      fontWeight: fontWeight ?? FontWeight.w700,
      color: _toColor(color),
      height: 1.17,
    );
  }

  static TextStyle title3({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize ?? 20,
      fontWeight: fontWeight ?? FontWeight.w700,
      color: _toColor(color),
      height: 1.2,
    );
  }

  static TextStyle title4({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize ?? 18,
      fontWeight: fontWeight ?? FontWeight.w700,
      color: _toColor(color),
      height: 1.22,
    );
  }

  /// fontWeight 600, *500*, 400
  static TextStyle textLarge({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize ?? 17,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: _toColor(color),
      height: 1.4,
    );
  }

  /// fontWeight 600, *500*, 400
  static TextStyle textMedium16({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize ?? 16,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: _toColor(color),
      height: 1.5,
    );
  }

  /// fontWeight 600, *500*, 400
  static TextStyle textMedium({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize ?? 15,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: _toColor(color),
      height: 1.47,
    );
  }

  /// fontWeight 600, *500*, 400
  static TextStyle textSmall14({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize ?? 14,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: _toColor(color),
      height: 1.43,
    );
  }

  /// fontWeight 600, *500*, 400
  static TextStyle textSmall({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize ?? 13,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: _toColor(color),
      height: 1.38,
    );
  }

  static Color? _toColor(Color? color) => color ?? Colors.grey[900];
}
