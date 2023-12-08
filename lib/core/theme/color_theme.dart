import 'package:flutter/material.dart';

class AppColorTheme extends ThemeExtension<AppColorTheme> {
  final Color? appBg;
  final Color? foregroundColor;
  final Color? buttonColor;
  AppColorTheme({this.appBg, this.foregroundColor, this.buttonColor});

  AppColorTheme.light() : this();

  AppColorTheme.dark() : this();

  @override
  ThemeExtension<AppColorTheme> copyWith() {
    return AppColorTheme();
  }

  @override
  AppColorTheme lerp(covariant ThemeExtension<AppColorTheme>? other, double t) {
    if (other is! AppColorTheme) return this;
    return AppColorTheme(
      appBg: Color.lerp(appBg, other.appBg, t),
      foregroundColor: Color.lerp(foregroundColor, other.foregroundColor, t),
    );
  }
}
