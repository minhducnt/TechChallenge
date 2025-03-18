import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:sof_tracker/app/data/di.dart';

/// All the design related constants
class AppDesign extends GetXState {
  static Divider dividerSolid({double? height, double? thickness}) {
    return Divider(
      color: $r.theme.neutral2,
      height: height ?? 0.2,
      thickness: thickness ?? 0.2,
    );
  }
}
