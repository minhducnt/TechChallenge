import 'package:flutter/material.dart';

import 'package:badges/badges.dart' as badges;
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:sof_tracker/app/data/di.dart';
import 'package:sof_tracker/app/global/constants/enums/sof_user_types.dart';
import 'package:sof_tracker/app/global/extensions/date_time_extension.dart';
import 'package:sof_tracker/app/global/extensions/string_extension.dart';
import 'package:sof_tracker/app/global/styles/app_design.dart';
import 'package:sof_tracker/app/global/utils/helpers/misc.dart';
import 'package:sof_tracker/app/global/utils/ui_utils.dart';
import 'package:sof_tracker/app/global/widgets/base/base_exception.dart';
import 'package:sof_tracker/app/global/widgets/utils/profile_image_widget.dart';
import 'package:sof_tracker/app/modules/home/reputation/components/reputation_item.dart';
import 'package:sof_tracker/app/modules/home/reputation/components/reputation_loader.dart';

import '../controllers/reputation_controller.dart';

class ReputationView extends GetView<ReputationController> {
  const ReputationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: $theme.colorScheme.onInverseSurface,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(24.w), topRight: Radius.circular(24.w)),
      ),
      child: Column(
        children: [
          //* App Bar
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: Text(localeLang.reputationHistory, style: text16.bold.copyWith(color: $theme.colorScheme.primary)),
            ),
          ),

          //* User Profile
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80.h,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      badges.Badge(
                        showBadge: SofUserTypesHelper.isRegistered(controller.user?.userType ?? ''),
                        position: badges.BadgePosition.topEnd(top: -4.h, end: -4.w),
                        badgeAnimation: const badges.BadgeAnimation.fade(toAnimate: false),
                        badgeContent: Icon(FluentIcons.checkmark_16_regular, color: Colors.white, size: 10.sp),
                        badgeStyle: badges.BadgeStyle(
                          shape: badges.BadgeShape.twitter,
                          badgeColor: $theme.colorScheme.primary,
                        ),
                        child: ProfileImageWidget(controller.user?.profileImage ?? ''),
                      ),
                      Gap(18.w),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              isStringEmpty(controller.user?.displayName ?? ''),
                              overflow: TextOverflow.visible,
                              style: text14.semiBold,
                            ),
                            Gap(8.h),
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(FluentIcons.star_20_filled, color: $theme.colorScheme.primary, size: 16.sp),
                                  Gap(4.w),
                                  Text(
                                    "${controller.user?.reputation?.formatted ?? 0}",
                                    style: text10.medium.copyWith(fontStyle: FontStyle.italic, color: $r.theme.neutral),
                                  ),
                                ],
                              ),
                            ),
                            Gap(4.h),
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(FluentIcons.location_20_filled, color: $theme.colorScheme.primary, size: 16.sp),
                                  Gap(4.w),
                                  Text(
                                    isStringEmpty(controller.user?.location ?? ''),
                                    style: text10.medium.copyWith(fontStyle: FontStyle.italic, color: $r.theme.neutral),
                                  ),
                                ],
                              ),
                            ),
                            Gap(4.h),
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    FluentIcons.calendar_person_20_filled,
                                    color: $theme.colorScheme.primary,
                                    size: 16.sp,
                                  ),
                                  Gap(4.w),
                                  Text(
                                    isStringEmpty(controller.user?.creationDate.toString().utcDateTime),
                                    style: text10.medium.copyWith(fontStyle: FontStyle.italic, color: $r.theme.neutral),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(14.h),
                AppDesign.dividerSolid(height: 2.h, thickness: 1),
              ],
            ),
          ),

          //* Reputation History
          Expanded(
            child: RefreshIndicator(
              onRefresh: () => controller.retry(),
              child: Container(
                height: height,
                padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 0),
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
                      return const ReputationLoader();
                    },
                    newPageProgressIndicatorBuilder: (_) {
                      return const ReputationLoader(isFirstPage: false);
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
                        onPressed: () {
                          controller.retry();
                        },
                      );
                    },

                    //* Item
                    itemBuilder: (_, item, index) {
                      return ReputationItem(
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
        ],
      ),
    );
  }
}
