import 'package:flutter/material.dart';

import 'color_theme.dart';
import 'text_theme.dart';

class AppThemeData extends ThemeExtension<AppThemeData> {
  final AppTextTheme? textTheme;
  final AppColorTheme? colorTheme;

  static AppThemeData of(BuildContext context) =>
      Theme.of(context).extension<AppThemeData>()!;

  AppThemeData({this.textTheme, this.colorTheme});

  AppThemeData.light() : this();

  AppThemeData.dark()
      : this(
          textTheme: AppTextTheme.dark(),
          colorTheme: AppColorTheme.dark(),
        );

  @override
  ThemeExtension<AppThemeData> copyWith({
    final AppTextTheme? textTheme,
    final AppColorTheme? colorTheme,
  }) {
    return AppThemeData(
      textTheme: textTheme ?? this.textTheme,
      colorTheme: colorTheme ?? this.colorTheme,
    );
  }

  @override
  ThemeExtension<AppThemeData> lerp(
      covariant ThemeExtension<AppThemeData>? other, double t) {
    if (other is! AppThemeData) return this;
    return AppThemeData(
      textTheme: textTheme?.lerp(other.textTheme, t),
      colorTheme: colorTheme?.lerp(other.colorTheme, t),
    );
  }
}
