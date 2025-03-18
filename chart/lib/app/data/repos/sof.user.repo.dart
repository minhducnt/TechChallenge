import 'package:data_channel/data_channel.dart';
import 'package:get/get.dart';
import 'package:retrofit/retrofit.dart';

import 'package:sof_tracker/app/data/apis/exception_handler.dart';
import 'package:sof_tracker/app/data/models/common/alert.model.dart';
import 'package:sof_tracker/app/data/models/common/paginate.model.dart';
import 'package:sof_tracker/app/data/models/responses/reputation/sof.reputation.model.dart';
import 'package:sof_tracker/app/data/models/responses/user/sof.user.model.dart';

import '../services/sof/sof.user.api.dart';

class SofUserRepository extends GetxService {
  final SofUserApi _sofUserApi = Get.find<SofUserApi>();

  Future<DC<AlertModel, HttpResponse<Paginate<SofUserModel>>>> getSofUsers({
    Map<String, dynamic>? queries,
  }) async {
    return exceptionHandler(() async {
      final response = await _sofUserApi.getSofUsers(queries: queries);
      return DC.data(response);
    });
  }

  Future<DC<AlertModel, HttpResponse<Paginate<SofReputationModel>>>> getSofUserReputationHistory({
    required int userId,
    Map<String, dynamic>? queries,
  }) async {
    return exceptionHandler(() async {
      final response = await _sofUserApi.getSofUserReputationHistory(userId: userId, queries: queries);
      return DC.data(response);
    });
  }
}
