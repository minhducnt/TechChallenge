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

  /// `You have not bookmarked anyone yet`
  String get noBookmarks {
    return Intl.message(
      'You have not bookmarked anyone yet',
      name: 'noBookmarks',
      desc: '',
      args: [],
    );
  }

  /// `View List`
  String get viewList {
    return Intl.message('View List', name: 'viewList', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Favorite`
  String get favorite {
    return Intl.message('Favorite', name: 'favorite', desc: '', args: []);
  }

  /// `Reputation History`
  String get reputationHistory {
    return Intl.message(
      'Reputation History',
      name: 'reputationHistory',
      desc: '',
      args: [],
    );
  }

  /// `Reputation`
  String get reputation {
    return Intl.message('Reputation', name: 'reputation', desc: '', args: []);
  }

  /// `Chart`
  String get chart {
    return Intl.message('Chart', name: 'chart', desc: '', args: []);
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
}

class AppLocalizationDelegate extends LocalizationsDelegate<I10n> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
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
