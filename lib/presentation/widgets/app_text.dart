import 'package:crypto_app/core/cores.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  final String text;
  final double? fontSize, letterSpacing, height;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final String? fontFamily;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? alignment;
  final TextDecoration? textDecoration;
  final TextStyle? style;
  const AppText(this.text,
      {super.key,
      this.fontSize,
      this.fontStyle,
      this.fontWeight,
      this.color,
      this.maxLines,
      this.overflow,
      this.alignment,
      this.fontFamily,
      this.letterSpacing,
      this.textDecoration,
      this.height,
      this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: style?.copyWith(
            fontFamilyFallback: [GoogleFonts.roboto().fontFamily!],
          ) ??
          context.textTheme.small?.copyWith(
            color: color,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            fontSize: fontSize,
            overflow: overflow,
            letterSpacing: letterSpacing,
            decoration: textDecoration,
            height: height,
            fontFamilyFallback: [
              GoogleFonts.roboto().fontFamily!,
            ],
          ),
      textAlign: alignment,
    );
    // return Text(text, maxLines: maxLine, style: TextStyle(color: color, fontWeight: fontWeight, fontStyle: fontStyle, fontSize: size, overflow: overflow), textAlign: alignment);
  }
}

class NairaSign extends StatelessWidget {
  const NairaSign({super.key});

  @override
  Widget build(BuildContext context) {
    return AppText('₦', style: GoogleFonts.roboto());
  }
}
