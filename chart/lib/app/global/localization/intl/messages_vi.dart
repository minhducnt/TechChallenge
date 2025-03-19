// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a vi locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'vi';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "cancel": MessageLookupByLibrary.simpleMessage("Hủy"),
        "chart": MessageLookupByLibrary.simpleMessage("Thống kê"),
        "communication_error": MessageLookupByLibrary.simpleMessage(
            "Đã xảy ra lỗi trong quá trình giao tiếp với các máy chủ"),
        "doubleTabToExit":
            MessageLookupByLibrary.simpleMessage("Nhấp lần nữa để thoát"),
        "favorite": MessageLookupByLibrary.simpleMessage("Yêu thích"),
        "home": MessageLookupByLibrary.simpleMessage("Trang chủ"),
        "loadingText": MessageLookupByLibrary.simpleMessage("Đang tải..."),
        "noBookmarks": MessageLookupByLibrary.simpleMessage(
            "Hiện tại bạn chưa đánh dấu ai cả"),
        "noData":
            MessageLookupByLibrary.simpleMessage("Hiện tại không có dữ liệu"),
        "noInternetConnection": MessageLookupByLibrary.simpleMessage(
            "Không có kết nối Internet. Vui lòng thử lại sau"),
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "pleaseTryAgain":
            MessageLookupByLibrary.simpleMessage("Vui lòng thử lại"),
        "reputation": MessageLookupByLibrary.simpleMessage("Uy tín"),
        "reputationHistory":
            MessageLookupByLibrary.simpleMessage("Lịch sử uy tín"),
        "server_failure":
            MessageLookupByLibrary.simpleMessage("Đã gặp sự cố máy chủ"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("Đã xảy ra lỗi"),
        "somethingWentWrongAgain": MessageLookupByLibrary.simpleMessage(
            "Đã xảy ra lỗi!! Vui lòng thử lại"),
        "somethingWentWrongTryAgain": MessageLookupByLibrary.simpleMessage(
            "Đã xảy ra lỗi. Vui lòng thử lại"),
        "tryAgain": MessageLookupByLibrary.simpleMessage("Thử lại"),
        "unauthenticated_error":
            MessageLookupByLibrary.simpleMessage("Không xác thực được"),
        "viewList": MessageLookupByLibrary.simpleMessage("Xem danh sách")
      };
}
