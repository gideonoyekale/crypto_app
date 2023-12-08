import 'package:flutter/material.dart';

import 'widgets.dart';

class GradientDivider extends StatelessWidget {
  final double opacity;
  const GradientDivider({
    super.key,
    this.opacity = 0.5,
  });

  @override
  Widget build(BuildContext context) {
    return AppRectangle(
      height: 1,
      width: double.infinity,
      gradient: LinearGradient(
        colors: [
          Colors.transparent,
          Colors.white.withOpacity(opacity),
          Colors.transparent
        ],
      ),
    );
  }
}
