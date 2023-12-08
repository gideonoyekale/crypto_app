import 'package:flutter/cupertino.dart';

import '../cores.dart';

extension ContextExtension on BuildContext {
  AppTextTheme get textTheme => AppThemeData.of(this).textTheme!;
  AppColorTheme get colorTheme => AppThemeData.of(this).colorTheme!;
  double width(double scale) => MediaQuery.of(this).size.width * scale;
  double height(double scale) => MediaQuery.of(this).size.height * scale;

  void showError(String message) {
    SnackbarService().error(message: message);
  }

  void showSuccess(String message) {
    SnackbarService().success(message: message);
  }
}
