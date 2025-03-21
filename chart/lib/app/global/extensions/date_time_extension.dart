import 'package:intl/intl.dart';
import 'package:sof_tracker/app/global/utils/ui_utils.dart';

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

  String get dayOfWeek {
    if (isEmpty) return '';

    final dayOfWeek = int.parse(this);
    switch (dayOfWeek) {
      case 1:
        return localeLang.monday;
      case 2:
        return localeLang.tuesday;
      case 3:
        return localeLang.wednesday;
      case 4:
        return localeLang.thursday;
      case 5:
        return localeLang.friday;
      case 6:
        return localeLang.saturday;
      case 0:
        return localeLang.sunday;
      default:
        return '';
    }
  }
}
