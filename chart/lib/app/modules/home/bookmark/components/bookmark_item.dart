import 'package:flutter/material.dart';

import 'package:badges/badges.dart' as badges;
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sof_tracker/app/data/di.dart';
import 'package:sof_tracker/app/data/models/responses/user/sof.user.model.dart';
import 'package:sof_tracker/app/global/constants/enums/sof_user_types.dart';
import 'package:sof_tracker/app/global/constants/resources/assets.gen.dart';
import 'package:sof_tracker/app/global/extensions/string_extension.dart';
import 'package:sof_tracker/app/global/styles/app_text_styles.dart';
import 'package:sof_tracker/app/global/utils/helpers/misc.dart';
import 'package:sof_tracker/app/global/widgets/utils/image_asset.dart';
import 'package:sof_tracker/app/global/widgets/utils/profile_image_widget.dart';
import 'package:sof_tracker/app/global/widgets/utils/tap_splash.dart';

import '../controllers/bookmark_controller.dart';

class BookmarkItem extends GetView<BookmarkController> {
  final int? index;
  final SofUserModel? data;

  const BookmarkItem({
    super.key,
    this.index,
    this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 174.h,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onInverseSurface,
        borderRadius: BorderRadius.circular(22.r),
        boxShadow: [
          BoxShadow(
            color: $r.theme.shadow,
            offset: Offset(0, 4.w),
            blurRadius: 16,
          ),
        ],
        border: Border(
          left: BorderSide(
            width: 6.w,
            color: $theme.colorScheme.primary.withOpacity(0.5),
          ),
        ),
      ),
      child: TapSplash(
        radius: 14.r,
        onTap: data == null ? () {} : () => controller.getDetail(data ?? const SofUserModel()),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22.r),
          child: Stack(
            children: [
              //* Favorite
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  icon: Icon(
                    data == null
                        ? FluentIcons.heart_24_regular
                        : controller.isFavorite(data?.accountId ?? 0)
                            ? FluentIcons.heart_24_filled
                            : FluentIcons.heart_24_regular,
                    color: data == null
                        ? $r.theme.neutral
                        : controller.isFavorite(data?.accountId ?? 0)
                            ? $theme.colorScheme.primary
                            : $r.theme.neutral,
                    size: 20.sp,
                  ),
                  onPressed: () => controller.removeBookmark(
                    index ?? 0,
                    data ?? const SofUserModel(),
                  ),
                ),
              ),

              //* Content
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 12.h,
                ),
                child: Column(
                  children: [
                    //* Header
                    Expanded(
                      flex: 2,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          badges.Badge(
                            showBadge: SofUserTypesHelper.isRegistered(data?.userType ?? ''),
                            position: badges.BadgePosition.topEnd(top: -4.h, end: -4.w),
                            badgeAnimation: const badges.BadgeAnimation.fade(toAnimate: false),
                            badgeContent: Icon(
                              FluentIcons.checkmark_16_regular,
                              color: Colors.white,
                              size: 10.sp,
                            ),
                            badgeStyle: badges.BadgeStyle(
                              shape: badges.BadgeShape.twitter,
                              badgeColor: $theme.colorScheme.primary,
                            ),
                            child: ProfileImageWidget(
                              data?.profileImage ?? '',
                            ),
                          ),
                          Gap(16.w),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  isStringEmpty(data?.displayName ?? ''),
                                  overflow: TextOverflow.visible,
                                  style: text14.semiBold,
                                ),
                                Gap(8.h),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      FluentIcons.star_20_filled,
                                      color: $theme.colorScheme.primary,
                                      size: 16.sp,
                                    ),
                                    Gap(4.w),
                                    Text(
                                      "${data?.reputation?.formatted ?? 0}",
                                      style: text10.medium.copyWith(
                                        fontStyle: FontStyle.italic,
                                        color: $r.theme.neutral,
                                      ),
                                    ),
                                  ],
                                ),
                                Gap(4.h),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      FluentIcons.location_20_filled,
                                      color: $theme.colorScheme.primary,
                                      size: 16.sp,
                                    ),
                                    Gap(4.w),
                                    Text(
                                      isStringEmpty(data?.location ?? ''),
                                      style: text10.medium.copyWith(
                                        fontStyle: FontStyle.italic,
                                        color: $r.theme.neutral,
                                      ),
                                    ),
                                  ],
                                ),
                                Gap(4.h),
                                Row(
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
                                      getUTCDateTime(data?.creationDate ?? 0),
                                      style: text10.medium.copyWith(
                                        fontStyle: FontStyle.italic,
                                        color: $r.theme.neutral,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    //* Badges
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: 0.5.sw,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: SvgAsset(
                                      Assets.svgs.bronzeMedal.path,
                                      width: 24.w,
                                      height: 24.h,
                                    ),
                                  ),
                                  Gap(4.h),
                                  Expanded(
                                    child: Text(
                                      "${data?.badgeCounts?.bronze?.formatted ?? 0}",
                                      style: text14.medium,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              width: 0.5.sw,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: SvgAsset(
                                      Assets.svgs.sliverMedal.path,
                                      width: 24.w,
                                      height: 24.h,
                                    ),
                                  ),
                                  Gap(4.h),
                                  Expanded(
                                    child: Text(
                                      "${data?.badgeCounts?.silver?.formatted ?? 0}",
                                      style: text14.medium,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              width: 0.5.sw,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: SvgAsset(
                                      Assets.svgs.goldMedal.path,
                                      width: 24.w,
                                      height: 24.h,
                                    ),
                                  ),
                                  Gap(4.h),
                                  Expanded(
                                    child: Text(
                                      "${data?.badgeCounts?.gold?.formatted ?? 0}",
                                      style: text14.medium,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
