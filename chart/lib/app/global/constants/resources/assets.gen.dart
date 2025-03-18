/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:lottie/lottie.dart' as _lottie;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/profile_pic.png
  AssetGenImage get profilePic =>
      const AssetGenImage('assets/images/profile_pic.png');

  /// File path: assets/images/sof_login_bg.png
  AssetGenImage get sofLoginBg =>
      const AssetGenImage('assets/images/sof_login_bg.png');

  /// File path: assets/images/sof_logo.png
  AssetGenImage get sofLogo =>
      const AssetGenImage('assets/images/sof_logo.png');

  /// File path: assets/images/sof_logo_fake.png
  AssetGenImage get sofLogoFake =>
      const AssetGenImage('assets/images/sof_logo_fake.png');

  /// File path: assets/images/sof_splash_bg_1.png
  AssetGenImage get sofSplashBg1 =>
      const AssetGenImage('assets/images/sof_splash_bg_1.png');

  /// File path: assets/images/sof_splash_bg_2.png
  AssetGenImage get sofSplashBg2 =>
      const AssetGenImage('assets/images/sof_splash_bg_2.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        profilePic,
        sofLoginBg,
        sofLogo,
        sofLogoFake,
        sofSplashBg1,
        sofSplashBg2
      ];
}

class $AssetsLottiesGen {
  const $AssetsLottiesGen();

  /// File path: assets/lotties/alert.json
  LottieGenImage get alert => const LottieGenImage('assets/lotties/alert.json');

  /// File path: assets/lotties/confirm.json
  LottieGenImage get confirm =>
      const LottieGenImage('assets/lotties/confirm.json');

  /// File path: assets/lotties/error.json
  LottieGenImage get error => const LottieGenImage('assets/lotties/error.json');

  /// File path: assets/lotties/no_data_found.json
  LottieGenImage get noDataFound =>
      const LottieGenImage('assets/lotties/no_data_found.json');

  /// List of all assets
  List<LottieGenImage> get values => [alert, confirm, error, noDataFound];
}

class $AssetsSvgsGen {
  const $AssetsSvgsGen();

  /// File path: assets/svgs/background_pattern.svg
  SvgGenImage get backgroundPattern =>
      const SvgGenImage('assets/svgs/background_pattern.svg');

  /// File path: assets/svgs/bronze_medal.svg
  SvgGenImage get bronzeMedal =>
      const SvgGenImage('assets/svgs/bronze_medal.svg');

  /// File path: assets/svgs/gold_medal.svg
  SvgGenImage get goldMedal => const SvgGenImage('assets/svgs/gold_medal.svg');

  /// File path: assets/svgs/sliver_medal.svg
  SvgGenImage get sliverMedal =>
      const SvgGenImage('assets/svgs/sliver_medal.svg');

  /// File path: assets/svgs/sof_logo.svg
  SvgGenImage get sofLogo => const SvgGenImage('assets/svgs/sof_logo.svg');

  /// File path: assets/svgs/vectorCurved1.svg
  SvgGenImage get vectorCurved1 =>
      const SvgGenImage('assets/svgs/vectorCurved1.svg');

  /// File path: assets/svgs/vectorCurved2.svg
  SvgGenImage get vectorCurved2 =>
      const SvgGenImage('assets/svgs/vectorCurved2.svg');

  /// File path: assets/svgs/vectorCurved3.svg
  SvgGenImage get vectorCurved3 =>
      const SvgGenImage('assets/svgs/vectorCurved3.svg');

  /// File path: assets/svgs/vectorCurved4.svg
  SvgGenImage get vectorCurved4 =>
      const SvgGenImage('assets/svgs/vectorCurved4.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        backgroundPattern,
        bronzeMedal,
        goldMedal,
        sliverMedal,
        sofLogo,
        vectorCurved1,
        vectorCurved2,
        vectorCurved3,
        vectorCurved4
      ];
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  /// File path: assets/translations/intl_en.arb
  String get intlEn => 'assets/translations/intl_en.arb';

  /// File path: assets/translations/intl_vi.arb
  String get intlVi => 'assets/translations/intl_vi.arb';

  /// List of all assets
  List<String> get values => [intlEn, intlVi];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLottiesGen lotties = $AssetsLottiesGen();
  static const $AssetsSvgsGen svgs = $AssetsSvgsGen();
  static const $AssetsTranslationsGen translations = $AssetsTranslationsGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class LottieGenImage {
  const LottieGenImage(
    this._assetName, {
    this.flavors = const {},
  });

  final String _assetName;
  final Set<String> flavors;

  _lottie.LottieBuilder lottie({
    Animation<double>? controller,
    bool? animate,
    _lottie.FrameRate? frameRate,
    bool? repeat,
    bool? reverse,
    _lottie.LottieDelegates? delegates,
    _lottie.LottieOptions? options,
    void Function(_lottie.LottieComposition)? onLoaded,
    _lottie.LottieImageProviderFactory? imageProviderFactory,
    Key? key,
    AssetBundle? bundle,
    Widget Function(
      BuildContext,
      Widget,
      _lottie.LottieComposition?,
    )? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    double? width,
    double? height,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    String? package,
    bool? addRepaintBoundary,
    FilterQuality? filterQuality,
    void Function(String)? onWarning,
    _lottie.LottieDecoder? decoder,
    _lottie.RenderCache? renderCache,
    bool? backgroundLoading,
  }) {
    return _lottie.Lottie.asset(
      _assetName,
      controller: controller,
      animate: animate,
      frameRate: frameRate,
      repeat: repeat,
      reverse: reverse,
      delegates: delegates,
      options: options,
      onLoaded: onLoaded,
      imageProviderFactory: imageProviderFactory,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      package: package,
      addRepaintBoundary: addRepaintBoundary,
      filterQuality: filterQuality,
      onWarning: onWarning,
      decoder: decoder,
      renderCache: renderCache,
      backgroundLoading: backgroundLoading,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
