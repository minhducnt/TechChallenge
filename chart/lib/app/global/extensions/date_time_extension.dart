import 'package:intl/intl.dart';

extension DateTimeExtension on String {
  String get formattedDate {
    if (isEmpty) {
      return '';
    }
    DateTime dateTime = DateTime.parse(this).toLocal();
    String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
    return formattedDate;
  }

  String get formattedDateTime {
    if (isEmpty) {
      return '';
    }
    DateTime dateTime = DateTime.parse(this).toLocal();
    String formattedDate = DateFormat('dd/MM/yyyy HH:mm').format(dateTime);
    return formattedDate;
  }

  String get formattedYear {
    if (isEmpty) {
      return '';
    }
    DateTime dateTime = DateTime.parse(this).toLocal();
    String formattedDate = DateFormat('yyyy').format(dateTime);
    return formattedDate;
  }

  String get utcDateTime {
    if (isEmpty) {
      return '';
    }
    final date = DateTime.parse(this).toLocal();
    final utcDate = date.toUtc();
    return DateFormat.yMMMMd().format(utcDate);
  }
}
