import 'package:flutter/material.dart';

import '../../core/cores.dart';
import 'widgets.dart';

class AppBarAction extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double size;
  final Function()? onPressed;

  const AppBarAction({
    super.key,
    required this.icon,
    this.color = Palette.primary2,
    this.size = 42,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onPressed: onPressed,
      height: size,
      width: size,
      child: AppRectangle(
        color: color,
        height: size,
        width: size,
        radius: 10,
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Icon(
          icon,
          size: size / 2,
          color: Palette.grey1,
        ),
      ),
    );
  }
}
