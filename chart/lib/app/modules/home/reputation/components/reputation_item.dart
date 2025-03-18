import 'package:flutter/material.dart';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sof_tracker/app/data/di.dart';
import 'package:sof_tracker/app/data/models/responses/reputation/sof.reputation.model.dart';
import 'package:sof_tracker/app/global/constants/enums/sof_reputation_history.dart';
import 'package:sof_tracker/app/global/utils/helpers/misc.dart';
import 'package:sof_tracker/app/global/utils/ui_utils.dart';

import '../controllers/reputation_controller.dart';

class ReputationItem extends GetView<ReputationController> {
  final int? index;
  final SofReputationModel? data;

  const ReputationItem({
    super.key,
    this.index,
    this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onInverseSurface,
        borderRadius: BorderRadius.circular(16.r),
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
            right: BorderSide(
              width: 6.w,
              color: $theme.colorScheme.primary.withOpacity(0.5),
            )),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data == null ? '' : SofReputationHistoryHelper.toSentenceCase(data!.reputationHistoryType!),
                      overflow: TextOverflow.visible,
                      style: text12.semiBold,
                    ),
                    Gap(4.h),
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
                          '${localeLang.reputation}:',
                          style: text12.medium.copyWith(
                            color: $r.theme.neutral,
                          ),
                        ),
                        Gap(4.w),
                        Text(
                          data?.reputationChange?.toString() ?? '0',
                          style: text12.bold.copyWith(
                            color: (data?.reputationChange ?? 0) >= 0 ? $r.theme.success : $r.theme.error,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Post Id: ${data?.postId ?? 0}',
                    style: text10.medium.copyWith(
                      fontStyle: FontStyle.italic,
                      color: $r.theme.neutral,
                    ),
                  ),
                  Text(
                    getUTCDateTime(data?.creationDate ?? 0),
                    textAlign: TextAlign.end,
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
      ),
    );
  }
}
