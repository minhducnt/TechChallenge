// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "chart": MessageLookupByLibrary.simpleMessage("Chart"),
        "communication_error": MessageLookupByLibrary.simpleMessage(
            "There was an error with our communication with the servers."),
        "doubleTabToExit":
            MessageLookupByLibrary.simpleMessage("Press back again to exit"),
        "favorite": MessageLookupByLibrary.simpleMessage("Favorite"),
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "loadingText": MessageLookupByLibrary.simpleMessage("Loading..."),
        "noBookmarks": MessageLookupByLibrary.simpleMessage(
            "You have not bookmarked anyone yet"),
        "noData":
            MessageLookupByLibrary.simpleMessage("Currently no data available"),
        "noInternetConnection": MessageLookupByLibrary.simpleMessage(
            "No internet connection. Please try again later."),
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "pleaseTryAgain":
            MessageLookupByLibrary.simpleMessage("Please try again"),
        "reputation": MessageLookupByLibrary.simpleMessage("Reputation"),
        "reputationHistory":
            MessageLookupByLibrary.simpleMessage("Reputation History"),
        "server_failure":
            MessageLookupByLibrary.simpleMessage("Server failure encountered."),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("Something went wrong"),
        "somethingWentWrongAgain": MessageLookupByLibrary.simpleMessage(
            "Something went wrong!! Please try again."),
        "somethingWentWrongTryAgain": MessageLookupByLibrary.simpleMessage(
            "Đã xảy ra lỗi. Vui lòng thử lại"),
        "tryAgain": MessageLookupByLibrary.simpleMessage("Try again"),
        "unauthenticated_error":
            MessageLookupByLibrary.simpleMessage("Unauthenticated error"),
        "viewList": MessageLookupByLibrary.simpleMessage("View List")
      };
}
