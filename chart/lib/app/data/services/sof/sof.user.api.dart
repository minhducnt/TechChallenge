import 'dart:async';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:sof_tracker/app/data/models/common/paginate.model.dart';
import 'package:sof_tracker/app/data/models/responses/reputation/sof.reputation.model.dart';
import 'package:sof_tracker/app/data/models/responses/user/sof.user.model.dart';

part 'sof.user.api.g.dart';

@RestApi()
abstract class SofUserApi {
  factory SofUserApi(Dio dio) = _SofUserApi;

  static const sofUserPrefix = 'users';
  static const sofUserByIdPrefix = 'users/{userId}';
  static const sofUserReputationHistoryPrefix = '$sofUserByIdPrefix/reputation-history';

  @GET(sofUserPrefix)
  Future<HttpResponse<Paginate<SofUserModel>>> getSofUsers({
    @Queries() Map<String, dynamic>? queries,
  });

  @GET(sofUserReputationHistoryPrefix)
  Future<HttpResponse<Paginate<SofReputationModel>>> getSofUserReputationHistory({
    @Path('userId') required int userId,
    @Queries() Map<String, dynamic>? queries,
  });
}
