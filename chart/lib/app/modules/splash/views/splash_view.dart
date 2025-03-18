import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sof_tracker/app/data/di.dart';
import 'package:sof_tracker/app/global/constants/resources/assets.gen.dart';
import 'package:sof_tracker/app/global/widgets/utils/image_asset.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Theme.of(context).colorScheme.onInverseSurface,
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          FlutterSplashScreen.fadeIn(
            duration: $r.times.twoSeconds,
            animationDuration: $r.times.med,
            backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
            childWidget: SvgAsset(
              Assets.svgs.sofLogo.path,
              height: 48.h,
              width: 48.w,
            ),
          ),
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: LayoutBuilder(
              builder: (_, constraints) {
                return Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    // Slide left
                    Assets.images.sofSplashBg1.image(width: constraints.maxWidth).animate().slide(
                          begin: const Offset(0.5, 0.5),
                          end: const Offset(0, 0),
                          curve: Curves.easeIn,
                          duration: $r.times.med,
                        ),
                    // Slide right
                    Assets.images.sofSplashBg2.image(width: constraints.maxWidth).animate().slide(
                          begin: const Offset(-0.5, 0.5),
                          end: const Offset(0, 0),
                          curve: Curves.easeIn,
                          duration: $r.times.med,
                        ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
