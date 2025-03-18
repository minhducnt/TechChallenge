import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:sof_tracker/app/data/di.dart';
import 'package:sof_tracker/app/data/models/responses/user/sof.user.model.dart';
import 'package:sof_tracker/app/global/extensions/iterable_extension.dart';
import 'package:sof_tracker/app/global/utils/ui_utils.dart';
import 'package:sof_tracker/app/global/widgets/base/base_controller.dart';
import 'package:sof_tracker/app/modules/home/reputation/controllers/reputation_controller.dart';
import 'package:sof_tracker/app/modules/home/reputation/views/reputation_view.dart';
import 'package:sof_tracker/app/routes/app_pages.dart';

import '../../dashboard/controllers/dashboard_controller.dart';
import '../../homepage/controllers/homepage_controller.dart';

class BookmarkController extends BaseController {
  //* Dependencies
  final homeCtrl = Get.find<HomepageController>();
  final dashboardCtrl = Get.find<DashboardController>();

  //* Variables
  final pagingController = PagingController(firstPageKey: 0);

  //* Lifecycle
  @override
  void onInit() {
    super.onInit();
    pagingController.addPageRequestListener((pageKey) => _fetchData(pageKey));
  }

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }

  //* Functions
  Future<void> _fetchData(int pageKey, {int pageSize = 30}) async {
    try {
      final bookmarks = await $storage.user.getBookmarks();
      final pages = bookmarks.chunked(pageSize).toList();

      final isLastPage = pageKey + 1 >= pages.length;
      isLastPage
          ? pagingController.appendLastPage(pages[pageKey])
          : pagingController.appendPage(pages[pageKey], pageKey + 1);
    } catch (e) {
      pagingController.error = e;
    }
  }

  Future<void> retry() async {
    pagingController.refresh();
  }

  Future<void> getDetail(SofUserModel sofUser) async {
    await Get.bottomSheet(
      backgroundColor: $theme.colorScheme.primary,
      GetBuilder(
        init: ReputationController(),
        builder: (controller) => SizedBox(
          height: height * 0.8,
          child: const ReputationView(),
        ),
      ),
      settings: RouteSettings(
        name: Routes.REPUTATION,
        arguments: {
          'sofUser': sofUser,
        },
      ),
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.r),
          topRight: Radius.circular(32.r),
        ),
      ),
    );
  }

  bool isFavorite(int? accountId) {
    return $storage.user.isFavorite(accountId!);
  }

  void removeBookmark(int index, SofUserModel user) {
    $storage.user.toggleFavorite(user);
    pagingController.refresh();
  }

  Future<void> viewList() async {
    await homeCtrl.onItemTapped(0);
  }
}
