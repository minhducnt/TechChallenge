import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'package:sof_tracker/app/global/widgets/utils/skeleton_shimmer.dart';
import 'package:sof_tracker/app/modules/home/bookmark/components/bookmark_item.dart';

import '../controllers/bookmark_controller.dart';

class BookmarkLoader extends GetView<BookmarkController> {
  final bool isFirstPage;

  const BookmarkLoader({this.isFirstPage = true, super.key});

  @override
  Widget build(BuildContext context) {
    return SkeletonLoader(
      child: isFirstPage
          ? ListView.separated(
              shrinkWrap: true,
              itemCount: controller.pagingController.itemList?.length ?? 10,
              separatorBuilder: (_, __) => Gap(16.h),
              itemBuilder: (_, index) => BookmarkItem(
                key: ValueKey(index),
                index: index,
                data: controller.pagingController.itemList?[index],
              ),
            )
          : const BookmarkItem(),
    );
  }
}
