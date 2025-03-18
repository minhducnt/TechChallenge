import 'package:flutter/material.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sof_tracker/app/global/utils/ui_utils.dart';

class CustomLoading extends StatelessWidget {
  final Color? color;
  final double? size;

  const CustomLoading({
    super.key,
    this.color,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.fourRotatingDots(
      color: color ?? Theme.of(gContext).colorScheme.primary,
      size: size ?? 50,
    );
  }
}
