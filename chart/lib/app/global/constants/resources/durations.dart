import 'package:flutter/material.dart';

/// Define durations
@immutable
class AppTimes {
  final fast = const Duration(milliseconds: 300);
  final med = const Duration(milliseconds: 600);
  final slow = const Duration(milliseconds: 900);

  final pageTransition = const Duration(milliseconds: 200);
  final timeOut = const Duration(seconds: 30);

  final oneSeconds = const Duration(seconds: 1);
  final twoSeconds = const Duration(seconds: 2);
}
