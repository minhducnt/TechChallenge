import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sof_tracker/app/data/di.dart';
import 'package:sof_tracker/app/global/utils/ui_utils.dart';

class ButtonContainer extends StatefulWidget {
  final Color? borderColor;
  final Color? color;
  final Color? disabledColor;
  final Color? loadingColor;
  final Color? splashColor;
  final Color? textColor;
  final IconData? prefixIcon;
  final String? text;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;
  final bool? isDisabled;
  final bool? isTextBold;
  final bool? status;
  final double? bottom;
  final double? end;
  final double? iconSize;
  final double? start;
  final double? top;

  const ButtonContainer({
    super.key,
    this.borderColor = Colors.transparent,
    this.bottom = 0,
    this.color = Colors.transparent,
    this.disabledColor,
    this.end = 0,
    this.iconSize,
    this.isDisabled = false,
    this.isTextBold = true,
    this.loadingColor = Colors.white,
    this.onPressed,
    this.prefixIcon,
    this.splashColor,
    this.start = 0,
    this.status = false,
    this.text = '',
    this.textColor = Colors.black,
    this.textStyle,
    this.top = 0,
  });

  @override
  State<ButtonContainer> createState() => _ButtonContainerState();
}

class _ButtonContainerState extends State<ButtonContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: widget.start!,
        end: widget.end!,
        top: widget.top!,
        bottom: widget.bottom!,
      ),
      child: TextButton(
        style: ButtonStyle(
          overlayColor: WidgetStateProperty.resolveWith(
            (states) => widget.splashColor ?? widget.textColor!.withOpacity(0.1),
          ),
          padding: WidgetStatePropertyAll(
            EdgeInsetsDirectional.only(
              top: height / 55,
              bottom: height / 55,
            ),
          ),
          backgroundColor: WidgetStateColor.resolveWith(
            (states) =>
                states.contains(WidgetState.disabled) ? widget.disabledColor ?? $r.theme.neutral3 : widget.color!,
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
              side: BorderSide(
                color: widget.isDisabled == true ? $r.theme.neutral2 : widget.borderColor!,
              ),
            ),
          ),
        ),
        onPressed: widget.isDisabled == true ? null : widget.onPressed,
        child: widget.status == true
            ? SizedBox(
                height: 22.h,
                width: 22.w,
                child: LoadingAnimationWidget.threeRotatingDots(
                  size: 22.sp,
                  color: widget.loadingColor ?? Theme.of(context).colorScheme.onPrimary,
                ),
              )
            : widget.prefixIcon != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        widget.prefixIcon,
                        color: widget.textColor,
                        size: widget.iconSize ?? 18.sp,
                      ),
                      Gap(8.h),
                      Text(
                        widget.text!,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: widget.textStyle ??
                            (widget.isTextBold == true
                                ? text13.semiBold.copyWith(color: widget.textColor)
                                : text13.copyWith(color: widget.textColor)),
                      ),
                    ],
                  )
                : Text(
                    widget.text!,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: widget.textStyle ??
                        (widget.isTextBold == true
                            ? text13.semiBold.copyWith(color: widget.textColor)
                            : text13.copyWith(color: widget.textColor)),
                  ),
      ),
    );
  }
}
