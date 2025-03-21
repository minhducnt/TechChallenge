import 'package:intl/intl.dart';

extension NumberExtension on num {
  String get formatted {
    return NumberFormat.decimalPattern().format(this);
  }

  String get formattedAsCurrency {
    return NumberFormat.currency(
      symbol: '\$',
      decimalDigits: 0,
    ).format(this);
  }

  String get formattedCompact {
    if (this >= 1000000) {
      return '\$${(this / 1000000).toStringAsFixed(1)}M';
    } else if (this >= 1000) {
      return '\$${(this / 1000).toStringAsFixed(0)}K';
    } else {
      return '\$${toStringAsFixed(0)}';
    }
  }

  double? get formattedCompactDouble {
    if (this >= 1000000) {
      return this / 1000000;
    } else if (this >= 1000) {
      return this / 1000;
    }
    return toDouble();
  }

  int get formattedMaxValue {
    if (this >= 1000000) {
      return (this / 100000).ceil() * 100000;
    } else if (this >= 10000) {
      return (this / 10000).ceil() * 10000;
    } else if (this >= 1000) {
      return (this / 1000).ceil() * 1000;
    } else if (this >= 100) {
      return (this / 100).ceil() * 100;
    } else {
      return (this / 10).ceil() * 10;
    }
  }
}
