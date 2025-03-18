import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:sof_tracker/app/data/di.dart';
import 'package:sof_tracker/app/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    init();
    super.onReady();
  }

  Future<void> init() async {
    await SystemChannels.textInput.invokeMethod('TextInput.hide');
    await Future.delayed($r.times.oneSeconds);
    await Get.offNamed(Routes.HOMEPAGE);
  }
}
