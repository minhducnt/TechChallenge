import 'dart:async';

import 'package:flutter/material.dart';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sof_tracker/app/data/di.dart';
import 'package:sof_tracker/app/global/constants/enums/systems.dart';
import 'package:sof_tracker/app/global/utils/ui_utils.dart';

/// Global scroll behavior
class GlobalScrollBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics();
  }
}

/// Utilities
class AppUtils {
  //* Snackbars
  static Future<void> showSnackBar({
    required String message,
    SnackBarType type = SnackBarType.success,
  }) async {
    final snackBar = _createSnackBar(message, type: type);
    Get.showSnackbar(snackBar);
  }

  //* Methods
  static GetSnackBar _createSnackBar(
    String message, {
    SnackBarType type = SnackBarType.success,
  }) {
    return GetSnackBar(
      snackPosition: SnackPosition.BOTTOM,
      messageText: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            type == SnackBarType.error
                ? FluentIcons.error_circle_20_filled
                : type == SnackBarType.warning
                    ? FluentIcons.warning_20_filled
                    : type == SnackBarType.info
                        ? FluentIcons.info_20_filled
                        : FluentIcons.checkmark_circle_24_filled,
            color: Theme.of(gContext).colorScheme.onPrimary,
            size: 18.sp,
          ),
          Gap(12.w),
          Expanded(
            child: Text(
              message,
              overflow: TextOverflow.ellipsis,
              style: text11.copyWith(fontSize: 11.sp, color: Theme.of(gContext).colorScheme.onPrimary),
            ),
          ),
        ],
      ),
      margin: EdgeInsets.only(bottom: height * 0.03, right: 24.w, left: 24.w),
      backgroundColor: type == SnackBarType.error
          ? Theme.of(gContext).colorScheme.error
          : type == SnackBarType.warning
              ? $r.theme.warning
              : type == SnackBarType.info
                  ? $r.theme.black
                  : $r.theme.success,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      borderRadius: 8.r,
      duration: $r.times.slow,
    );
  }
}
