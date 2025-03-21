// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class I10n {
  I10n();

  static I10n? _current;

  static I10n get current {
    assert(
      _current != null,
      'No instance of I10n was loaded. Try to initialize the I10n delegate before accessing I10n.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<I10n> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = I10n();
      I10n._current = instance;

      return instance;
    });
  }

  static I10n of(BuildContext context) {
    final instance = I10n.maybeOf(context);
    assert(
      instance != null,
      'No instance of I10n present in the widget tree. Did you add I10n.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static I10n? maybeOf(BuildContext context) {
    return Localizations.of<I10n>(context, I10n);
  }

  /// `No internet connection. Please try again later.`
  String get noInternetConnection {
    return Intl.message(
      'No internet connection. Please try again later.',
      name: 'noInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong!! Please try again.`
  String get somethingWentWrongAgain {
    return Intl.message(
      'Something went wrong!! Please try again.',
      name: 'somethingWentWrongAgain',
      desc: '',
      args: [],
    );
  }

  /// `Server failure encountered.`
  String get server_failure {
    return Intl.message(
      'Server failure encountered.',
      name: 'server_failure',
      desc: '',
      args: [],
    );
  }

  /// `There was an error with our communication with the servers.`
  String get communication_error {
    return Intl.message(
      'There was an error with our communication with the servers.',
      name: 'communication_error',
      desc: '',
      args: [],
    );
  }

  /// `Unauthenticated error`
  String get unauthenticated_error {
    return Intl.message(
      'Unauthenticated error',
      name: 'unauthenticated_error',
      desc: '',
      args: [],
    );
  }

  /// `Đã xảy ra lỗi. Vui lòng thử lại`
  String get somethingWentWrongTryAgain {
    return Intl.message(
      'Đã xảy ra lỗi. Vui lòng thử lại',
      name: 'somethingWentWrongTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message('OK', name: 'ok', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Loading...`
  String get loadingText {
    return Intl.message('Loading...', name: 'loadingText', desc: '', args: []);
  }

  /// `Press back again to exit`
  String get doubleTabToExit {
    return Intl.message(
      'Press back again to exit',
      name: 'doubleTabToExit',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get tryAgain {
    return Intl.message('Try again', name: 'tryAgain', desc: '', args: []);
  }

  /// `Please try again`
  String get pleaseTryAgain {
    return Intl.message(
      'Please try again',
      name: 'pleaseTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Currently no data available`
  String get noData {
    return Intl.message(
      'Currently no data available',
      name: 'noData',
      desc: '',
      args: [],
    );
  }

  /// `Line Chart`
  String get lineChart {
    return Intl.message('Line Chart', name: 'lineChart', desc: '', args: []);
  }

  /// `January`
  String get january {
    return Intl.message('January', name: 'january', desc: '', args: []);
  }

  /// `February`
  String get february {
    return Intl.message('February', name: 'february', desc: '', args: []);
  }

  /// `March`
  String get march {
    return Intl.message('March', name: 'march', desc: '', args: []);
  }

  /// `April`
  String get april {
    return Intl.message('April', name: 'april', desc: '', args: []);
  }

  /// `May`
  String get may {
    return Intl.message('May', name: 'may', desc: '', args: []);
  }

  /// `June`
  String get june {
    return Intl.message('June', name: 'june', desc: '', args: []);
  }

  /// `July`
  String get july {
    return Intl.message('July', name: 'july', desc: '', args: []);
  }

  /// `August`
  String get august {
    return Intl.message('August', name: 'august', desc: '', args: []);
  }

  /// `September`
  String get september {
    return Intl.message('September', name: 'september', desc: '', args: []);
  }

  /// `October`
  String get october {
    return Intl.message('October', name: 'october', desc: '', args: []);
  }

  /// `November`
  String get november {
    return Intl.message('November', name: 'november', desc: '', args: []);
  }

  /// `December`
  String get december {
    return Intl.message('December', name: 'december', desc: '', args: []);
  }

  /// `Current Month`
  String get currentMonth {
    return Intl.message(
      'Current Month',
      name: 'currentMonth',
      desc: '',
      args: [],
    );
  }

  /// `Bar Chart`
  String get barChart {
    return Intl.message('Bar Chart', name: 'barChart', desc: '', args: []);
  }

  /// `MON`
  String get monday {
    return Intl.message('MON', name: 'monday', desc: '', args: []);
  }

  /// `TUE`
  String get tuesday {
    return Intl.message('TUE', name: 'tuesday', desc: '', args: []);
  }

  /// `WED`
  String get wednesday {
    return Intl.message('WED', name: 'wednesday', desc: '', args: []);
  }

  /// `THU`
  String get thursday {
    return Intl.message('THU', name: 'thursday', desc: '', args: []);
  }

  /// `FRI`
  String get friday {
    return Intl.message('FRI', name: 'friday', desc: '', args: []);
  }

  /// `SAT`
  String get saturday {
    return Intl.message('SAT', name: 'saturday', desc: '', args: []);
  }

  /// `SUN`
  String get sunday {
    return Intl.message('SUN', name: 'sunday', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<I10n> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<I10n> load(Locale locale) => I10n.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
