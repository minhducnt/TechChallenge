import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:sof_tracker/app/data/di.dart';
import 'package:sof_tracker/app/global/constants/resources/assets.gen.dart';
import 'package:sof_tracker/app/global/utils/ui_utils.dart';
import 'package:sof_tracker/app/global/widgets/base/base_exception.dart';
import 'package:sof_tracker/app/global/widgets/base/base_silver_view.dart';
import 'package:sof_tracker/app/global/widgets/utils/image_asset.dart';
import 'package:sof_tracker/app/modules/home/dashboard/components/dashboard_item.dart';
import 'package:sof_tracker/app/modules/home/dashboard/components/dashboard_loader.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends BaseSilverView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            //* Background Curved
            SizedBox(
              width: width,
              height: height / 7,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Stack(
                    children: [
                      SvgAsset(height: double.infinity, Assets.svgs.vectorCurved1.path, fit: BoxFit.fitWidth),
                      SvgAsset(height: double.infinity, Assets.svgs.vectorCurved2.path, fit: BoxFit.fitWidth),
                    ],
                  );
                },
              ),
            ),

            //* Body
            Column(
              children: [
                const Spacer(),
                Expanded(
                  flex: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface),
                    child: RefreshIndicator(
                      onRefresh: () => controller.retry(),
                      child: SizedBox(
                        height: height,
                        child: PagedListView.separated(
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          pagingController: controller.pagingController,
                          separatorBuilder: (context, index) => Gap(16.h),
                          padding: EdgeInsets.symmetric(vertical: height / 24),
                          builderDelegate: PagedChildBuilderDelegate(
                            animateTransitions: true,
                            transitionDuration: $r.times.fast,

                            //* Progress
                            firstPageProgressIndicatorBuilder: (_) {
                              return const DashboardLoader();
                            },
                            newPageProgressIndicatorBuilder: (_) {
                              return const DashboardLoader(isFirstPage: false);
                            },

                            //* Error
                            noItemsFoundIndicatorBuilder: (_) {
                              return BaseException(
                                onPressed: () {
                                  controller.retry();
                                },
                              );
                            },
                            firstPageErrorIndicatorBuilder: (_) {
                              return BaseException(
                                isError: true,
                                onPressed: () {
                                  controller.retry();
                                },
                              );
                            },

                            //* Item
                            itemBuilder: (_, item, index) {
                              return DashboardItem(
                                key: ValueKey(index),
                                index: index,
                                data: controller.pagingController.itemList?.elementAt(index),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
