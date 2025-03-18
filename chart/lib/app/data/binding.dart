import 'package:get/get.dart';

import 'package:sof_tracker/app/data/apis/rest_client.dart';
import 'package:sof_tracker/app/data/repos/sof.user.repo.dart';
import 'package:sof_tracker/app/data/services/sof/sof.user.api.dart';

/// API Bindings
class AppBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    late final client = RestClient();

    // Bindings for services
    Get
      //* Services
      // Provider: use lazy singleton
      ..put(SofUserApi(client.dioInstance), permanent: true)

      //* Repositories
      // Service: use singleton
      ..lazyPut(SofUserRepository.new);
  }
}
