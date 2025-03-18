import 'package:flutter/material.dart';

/// Define app colors
@immutable
class AppColorStyles {
  //* Primary colors
  final transparent = Colors.transparent;
  final black = Colors.black;
  final white = Colors.white;
  final red = Colors.red;
  final blue = Colors.blue;

  //* Alert colors
  final warning = Colors.amber.shade600;
  final success = const Color(0xff28854a);
  final error = Colors.red.shade600;

  //* Shadow
  final shadow = const Color(0x0f000000);

  //* Grey colors
  final neutral = const Color(0xff4f4f4f);
  final neutral1 = const Color(0xff949494);
  final neutral2 = const Color(0xffB5B5B5);
  final neutral3 = const Color(0xffD7D7D7);
  final neutral4 = const Color(0xffF8F8F8);
}
