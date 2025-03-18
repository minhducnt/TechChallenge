import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:sof_tracker/app/data/models/responses/user/sof.user.model.dart';

import 'package:sof_tracker/app/data/repos/sof.user.repo.dart';
import 'package:sof_tracker/app/global/constants/enums/systems.dart';
import 'package:sof_tracker/app/global/utils/helpers/misc.dart';
import 'package:sof_tracker/app/global/utils/utils.dart';

class ReputationController extends GetxController {
  //* Dependencies
  final sofUserService = Get.find<SofUserRepository>();

  //* Variables
  final users = [].obs;
  final pagingController = PagingController(firstPageKey: 1);
  SofUserModel? user;
  late final dynamic args = Get.arguments;

  //* Lifecycle
  @override
  void onInit() {
    super.onInit();
    initData();
    pagingController.addPageRequestListener((pageKey) => _fetchData(pageKey));
  }

  @override
  void dispose() {
    pagingController.dispose();
    users.clear();
    super.dispose();
  }

  //* Functions
  void initData() {
    pagingController.refresh();
    user = args['sofUser'];
  }

  Future<void> _fetchData(int pageKey, {int pageSize = 30}) async {
    try {
      final res = await sofUserService.getSofUserReputationHistory(userId: user!.accountId!, queries: {
        'page': pageKey,
        'pagesize': pageSize,
        'site': 'stackoverflow',
      });

      if (res.hasError) {
        pagingController.error = res.error;
        return;
      }

      final nonEmptyItems = res.data!.data.items!.where((e) => !isNullOrEmpty(e)).toList();

      users
        ..clear()
        ..addAll(nonEmptyItems);

      res.data!.data.hasMore == false
          ? pagingController.appendLastPage(nonEmptyItems)
          : pagingController.appendPage(nonEmptyItems, pageKey + 1);
    } catch (e) {
      await AppUtils.showSnackBar(
        message: e.toString(),
        type: SnackBarType.error,
      );
    }
  }

  Future<void> retry() async {
    pagingController.refresh();
  }
}
