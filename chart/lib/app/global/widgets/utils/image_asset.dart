import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class SvgAsset extends StatelessWidget {
  final String? assetName;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final Color? color;

  const SvgAsset(
    this.assetName, {
    super.key,
    this.height,
    this.width,
    this.fit,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName ?? '',
      fit: fit ?? BoxFit.cover,
      height: height,
      width: width,
      colorFilter: color == null
          ? null
          : ColorFilter.mode(
              color!,
              BlendMode.srcIn,
            ),
    );
  }
}

class LottieAsset extends StatelessWidget {
  final String? assetName;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final Color? color;

  const LottieAsset({
    super.key,
    this.assetName,
    this.height,
    this.width,
    this.fit,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        color ?? Theme.of(context).colorScheme.onPrimary,
        BlendMode.srcIn,
      ),
      child: Lottie.asset(
        assetName ?? '',
        height: height,
        width: width,
        fit: fit,
      ),
    );
  }
}
