import 'package:flutter/material.dart';

class Palette {
  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xff000000);
  static const Color primary = Color(0xff131316);
  static const Color transparent = Colors.transparent;
  static const Color primary2 = Color(0xff212126);
  static const Color primary3 = Color(0xff212227);
  static const Color primary4 = Color(0xff18181C);
  static const Color grey1 = Color(0xffB9C1D9);
  static const Color grey2 = Color(0xff575B66);
  static const Color grey3 = Color(0xff585866);
  static const Color grey4 = Color(0xff26272E);
  static const Color grey5 = Color(0xff2C2C33);
  static const Color infraRed = Color(0xffDF2040);
  static const Color leaf = Color(0xff40BF6A);
  static const Color orange = Color(0xFFFF971A);
  static const Color orangeLight = Color(0x26FF971A);
  static const LinearGradient addButtonGradient = LinearGradient(
    colors: [Color(0xFF26734E), Color(0xFF0E58BE)],
    stops: [0.4, 1],
    transform: GradientRotation(-0.4),
  );
  static const LinearGradient portfolioGradient = LinearGradient(
    colors: [
      Color(0x80003300),
      Color(0x80000033),
    ],
    stops: [0, 0.9],
    transform: GradientRotation(-0.9),
  );
}
