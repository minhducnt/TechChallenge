import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sof_tracker/app/global/utils/ui_utils.dart';
import 'package:sof_tracker/app/global/widgets/base/base_controller.dart';
import 'package:sof_tracker/app/global/widgets/utils/loading_widget.dart';

abstract class BaseView<Controller extends BaseController> extends GetView<Controller> {
  const BaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return _renderView(context);
  }

  Widget _renderView(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      appBar: appBar(context),
      body: Stack(
        children: [
          Obx(() => controller.isLoading.value ? _renderLoading() : body(context)),
          Obx(() => controller.isOverlayLoading.value ? _renderLoadingOverlay() : const SizedBox.shrink()),
        ],
      ),
    );
  }

  PreferredSizeWidget? appBar(BuildContext context);
  Widget body(BuildContext context);

  Widget _renderLoading() {
    return Scaffold(
      backgroundColor: Theme.of(gContext).colorScheme.onInverseSurface,
      body: const Center(child: CustomLoading()),
    );
  }

  Widget _renderLoadingOverlay() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black.withOpacity(0.7),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomLoading(color: Theme.of(gContext).colorScheme.onInverseSurface),
            Gap(16.h),
            Obx(
              () => Text(
                controller.loadingText.value,
                style: text15.semiBold.copyWith(color: Theme.of(gContext).colorScheme.onInverseSurface),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
