import 'package:flutter/material.dart';

import '../../core/cores.dart';
import 'widgets.dart';

class AppMessageDialog extends StatelessWidget {
  final String? title;
  final String? message;
  final String? actionTitle;
  const AppMessageDialog({
    super.key,
    this.title,
    this.message,
    this.actionTitle,
  });

  @override
  Widget build(BuildContext context) {
    return AppRectangle(
      // color: context.colorTheme.appBg,
      padding: EdgeInsets.all(32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppText(
            title ?? 'Successful',
            style: context.textTheme.big,
            alignment: TextAlign.center,
          ),
          const Spacing.mediumHeight(),
          AppText(
            message ?? 'Kindly click the continue button to proceed',
            alignment: TextAlign.center,
            color: Palette.grey2,
          ),
          Spacing.mediumHeight(),
          AppButton(
            title: actionTitle ?? 'Continue',
            onPressed: () {
              Navigator.pop(context, true);
            },
            height: 40,
          )
        ],
      ),
    );
  }
}
