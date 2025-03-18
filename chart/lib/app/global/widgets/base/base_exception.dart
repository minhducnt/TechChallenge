import 'package:flutter/material.dart';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import 'package:sof_tracker/app/data/di.dart';
import 'package:sof_tracker/app/global/constants/resources/assets.gen.dart';
import 'package:sof_tracker/app/global/utils/ui_utils.dart';
import 'package:sof_tracker/app/global/widgets/buttons/button_container.dart';

class BaseException extends StatelessWidget {
  final String? exceptionTitle;
  final String? exceptionMessage;
  final IconData? btnIcon;
  final bool isError;
  final void Function()? onPressed;

  const BaseException({
    super.key,
    this.onPressed,
    this.isError = false,
    this.exceptionTitle,
    this.exceptionMessage,
    this.btnIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: height / 1.5,
          width: width,
          padding: const EdgeInsets.all(24),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                top: height / 12,
                left: 0,
                right: 0,
                child: Text(
                  exceptionTitle == null
                      ? isError
                          ? localeLang.somethingWentWrong
                          : localeLang.noData
                      : exceptionTitle!,
                  textAlign: TextAlign.center,
                  style: text16.semiBold.copyWith(
                    color: $r.theme.neutral2,
                  ),
                ),
              ),
              Lottie.asset(
                isError ? Assets.lotties.error.path : Assets.lotties.noDataFound.path,
                height: height / 0.8,
                width: height / 0.8,
                fit: BoxFit.contain,
              ),
              if (onPressed != null)
                ButtonContainer(
                  isTextBold: false,
                  prefixIcon: btnIcon ?? FluentIcons.arrow_counterclockwise_20_regular,
                  text: exceptionMessage ?? localeLang.tryAgain,
                  bottom: height / 20,
                  start: 38.w,
                  end: 38.w,
                  top: height / 60,
                  color: Theme.of(context).colorScheme.primary,
                  textColor: Theme.of(context).colorScheme.onPrimary,
                  borderColor: Theme.of(context).colorScheme.primary,
                  onPressed: () => onPressed?.call(),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
