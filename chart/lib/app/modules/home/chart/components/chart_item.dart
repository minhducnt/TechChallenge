import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChartItemWidget extends StatelessWidget {
  final double itemWidth;
  final double verticalMultiplier;
  final Widget child;
  final Color backgroundColor;
  final Color selectedColor;
  final double topMargin;
  final bool animate;

  const ChartItemWidget({
    super.key,
    required this.itemWidth,
    required this.verticalMultiplier,
    required this.child,
    required this.backgroundColor,
    required this.selectedColor,
    required this.topMargin,
    this.animate = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: animate ? 300 : 0),
      curve: Curves.easeInOut,
      width: itemWidth,
      height: verticalMultiplier,
      margin: EdgeInsets.only(top: topMargin),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: child,
    );
  }
}
