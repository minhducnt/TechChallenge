import 'package:flutter/material.dart';

import 'package:sof_tracker/app/global/constants/resources/colors.dart';
import 'package:sof_tracker/app/global/constants/resources/durations.dart';
import 'package:sof_tracker/app/global/constants/secure/stores.dart';

/// Configuration
@immutable
class AppConfig {
  //* App
  final appName = 'Sof Tracker';

  //* Language
  static const defaultLanguageCode = 'en';
  static const defaultIsoCountryCode = 'US';
  static const alternativeLanguageCode = 'vi';
  static const alternativeIsoCountryCode = 'VN';

  final defaultLocale = const Locale(
    defaultLanguageCode,
    defaultIsoCountryCode,
  );
  final alternativeLocale = const Locale(
    alternativeLanguageCode,
    alternativeIsoCountryCode,
  );

  //* Immutable
  late final box = AppStoreKeys();
  late final theme = AppColorStyles();
  late final times = AppTimes();
}
