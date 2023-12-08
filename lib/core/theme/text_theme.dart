import 'package:crypto_app/core/constants/constants.dart';
import 'package:flutter/material.dart';

import 'palette.dart';

class AppTextTheme extends ThemeExtension<AppTextTheme> {
  final TextStyle? large;
  final TextStyle? big;
  final TextStyle? medium;
  final TextStyle? extraSmall;
  final TextStyle? small;

  AppTextTheme({
    this.large,
    this.big,
    this.medium,
    this.extraSmall,
    this.small,
  });

  AppTextTheme.dark()
      : this(
          large: const TextStyle(
            fontSize: 32,
            color: Palette.white,
            height: 1.3,
            fontFamily: FontFamily.sfProMedium,
          ),
          big: const TextStyle(
            fontSize: 24,
            color: Palette.white,
            height: 1.3,
            fontFamily: FontFamily.sfProMedium,
          ),
          medium: const TextStyle(
            fontSize: 18,
            color: Palette.white,
            height: 1.3,
            fontFamily: FontFamily.sfProRegular,
          ),
          small: const TextStyle(
            fontSize: 14,
            color: Palette.grey1,
            height: 1.3,
            fontFamily: FontFamily.sfProRegular,
          ),
          extraSmall: const TextStyle(
            fontSize: 10,
            color: Palette.grey1,
            height: 1.3,
            fontFamily: FontFamily.sfProRegular,
          ),
        );

  AppTextTheme.light() : this();
  @override
  ThemeExtension<AppTextTheme> copyWith({
    final TextStyle? large,
    final TextStyle? big,
    final TextStyle? medium,
    final TextStyle? extraSmall,
    final TextStyle? small,
  }) {
    return AppTextTheme(
      large: large ?? this.large,
      big: big ?? this.big,
      medium: medium ?? this.medium,
      extraSmall: extraSmall ?? this.extraSmall,
      small: small ?? this.small,
    );
  }

  @override
  AppTextTheme lerp(covariant ThemeExtension<AppTextTheme>? other, double t) {
    if (other is! AppTextTheme) return this;
    return AppTextTheme(
      large: TextStyle.lerp(large, other.large, t),
      big: TextStyle.lerp(big, other.big, t),
      medium: TextStyle.lerp(medium, other.medium, t),
      small: TextStyle.lerp(small, other.small, t),
      extraSmall: TextStyle.lerp(extraSmall, other.extraSmall, t),
    );
  }
}
