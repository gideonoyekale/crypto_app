import 'package:flutter/material.dart';

import 'widgets.dart';

class TextIconButton extends StatelessWidget {
  const TextIconButton({
    super.key,
    this.title,
    this.prefix,
    this.suffix,
    this.onTap,
    this.textStyle,
    this.spacing,
    this.radius,
    this.color,
    this.padding,
  });
  final String? title;
  final Widget? prefix, suffix;
  final Function()? onTap;
  final TextStyle? textStyle;
  final double? spacing, radius;
  final Color? color;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AppRectangle(
        padding: padding,
        color: color,
        radius: radius,
        alignment: Alignment.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (prefix != null) ...[
              prefix!,
              Spacing.width(spacing ?? 0),
            ],
            if (title != null)
              AppText(
                title ?? '',
                style: textStyle,
                height: 1,
              ),
            if (suffix != null) ...[
              Spacing.width(spacing ?? 0),
              suffix!,
            ]
          ],
        ),
      ),
    );
  }
}
