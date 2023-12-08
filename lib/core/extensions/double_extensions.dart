import 'package:intl/intl.dart';

extension DoubleExtension on double? {
  String get currencyFormat {
    if (this == null) return '0.0';
    final format = NumberFormat("#,##0.00", "en_US");
    return format.format(this!);
  }

  String get currencyFormat2 {
    if (this == null) return '0.0';
    final format = NumberFormat("#,##0", "en_US");
    return format.format(this!);
  }

  String get appendNaira {
    if (this == null) return '0.0';
    return '\u{20A6}$currencyFormat';
  }

  String get appendDollar {
    if (this == null) return '0.0';
    return '\$$currencyFormat';
  }

  String get currencyMFormat {
    if (this == null) return '';

    final format = NumberFormat("#,##0.00", "en_US");
    if (this! < 1000000) {
      return format.format(this!);
    } else {
      double newVal = this! / 1000000;
      return '${newVal.toStringAsFixed(2)}M';
    }
  }
}
