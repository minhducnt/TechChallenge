import 'package:intl/intl.dart';

extension NumberExtension on num{
  String get formatted {
    return NumberFormat.decimalPattern().format(this);
  }
}
