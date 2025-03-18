import 'package:flutter/material.dart';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ndialog/ndialog.dart';

import 'package:sof_tracker/app/data/di.dart';
import 'package:sof_tracker/app/global/utils/ui_utils.dart';
import 'package:sof_tracker/app/global/widgets/buttons/small_button_container.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? buttonText;
  final Color? titleColor;
  final Color? titleIconColor;
  final Color? buttonColor;
  final void Function()? onTap;
  final bool? hasCancelButton;
  final bool? isLoading;
  final bool? isButtonBold;
  final bool? isDismissible;
  final Function? onDismiss;

  const CustomDialog({
    required this.title,
    required this.subtitle,
    super.key,
    this.buttonColor,
    this.buttonText,
    this.hasCancelButton = true,
    this.isButtonBold = false,
    this.isDismissible = true,
    this.isLoading = false,
    this.onDismiss,
    this.onTap,
    this.titleColor,
    this.titleIconColor,
  });

  @override
  Widget build(BuildContext context) {
    return DialogBackground(
      dismissable: isDismissible,
      onDismiss: onDismiss,
      dialog: NDialog(
        dialogStyle: DialogStyle(
          titleDivider: true,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
          titlePadding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
        ),
        title: Padding(
          padding: EdgeInsets.only(bottom: 6.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (titleIconColor != null)
                Row(
                  children: [
                    Icon(
                      FluentIcons.info_20_regular,
                      color: titleIconColor ?? Theme.of(context).colorScheme.primary,
                      size: 18.sp,
                    ),
                    const Gap(8),
                  ],
                ),
              Flexible(
                child: Text(
                  title,
                  style: text16.bold.copyWith(
                    color: titleColor ?? Theme.of(context).colorScheme.primary,
                    overflow: TextOverflow.ellipsis,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        content: Padding(
          padding: EdgeInsetsDirectional.only(
            start: width / 40,
            top: height / 120,
            end: width / 40,
            bottom: height / 120,
          ),
          child: Text(subtitle, textAlign: TextAlign.center, maxLines: 2, style: text14),
        ),
        actions: [
          if (hasCancelButton != false)
            SmallButtonContainer(
              marginLeft: 20.w,
              marginRight: 10.w,
              color: $r.theme.transparent,
              text: localeLang.cancel,
              radius: 8.r,
              borderColor: Theme.of(context).colorScheme.primary,
              textColor: Theme.of(context).colorScheme.primary,
              onTap: () => Navigator.of(context, rootNavigator: true).pop(true),
            ),
          SmallButtonContainer(
            marginRight: 20.w,
            marginLeft: hasCancelButton != true ? 20.w : 10.w,
            color: buttonColor ?? Theme.of(context).colorScheme.primary,
            text: buttonText ?? localeLang.ok,
            radius: 8.r,
            status: isLoading,
            isTextBold: isButtonBold,
            borderColor: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
            textColor: Theme.of(context).colorScheme.onPrimary,
            onTap: () {
              onTap?.call();
              Navigator.of(context, rootNavigator: true).pop(true);
            },
          ),
        ],
      ),
    );
  }
}
