import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sof_tracker/app/global/utils/ui_utils.dart';

class SmallButtonContainer extends StatelessWidget {
  final double? radius;
  final double? marginLeft;
  final double? marginRight;
  final String? text;
  final VoidCallback? onTap;
  final Color? color;
  final Color? borderColor;
  final Color? textColor;
  final bool? status;
  final bool? isTextBold;
  final bool? showLoading;
  final double? cusHeight;
  final double? cusWidth;

  const SmallButtonContainer({
    super.key,
    this.text,
    this.onTap,
    this.color,
    this.marginLeft,
    this.marginRight,
    this.borderColor,
    this.textColor,
    this.radius,
    this.showLoading = true,
    this.status = false,
    this.isTextBold = false,
    this.cusHeight,
    this.cusWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: marginLeft ?? 16.w,
        right: marginRight ?? 16.w,
      ),
      height: cusHeight ?? height / 20,
      width: cusWidth ?? width / 4,
      child: TextButton(
        style: ButtonStyle(
          overlayColor: WidgetStateProperty.all(textColor!.withOpacity(0.10)),
          backgroundColor: WidgetStateProperty.resolveWith(
            (states) => states.contains(WidgetState.disabled)
                ? Colors.grey.shade400
                : color!,
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 8.r),
              side: BorderSide(
                color: status == true ? Colors.grey.shade400 : borderColor!,
              ),
            ),
          ),
        ),
        onPressed: status == true ? null : onTap,
        child: status == true && showLoading == true
            ? SizedBox(
                height: 24.h,
                width: 24.w,
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              )
            : Text(
                text!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textColor,
                  fontSize: 12.sp,
                  fontWeight: isTextBold! ? FontWeight.bold : FontWeight.w600,
                ),
              ),
      ),
    );
  }
}
