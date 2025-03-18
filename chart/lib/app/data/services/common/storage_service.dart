import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:sof_tracker/app/data/di.dart';
import 'package:sof_tracker/app/data/models/responses/badge/sof.badge.model.dart';
import 'package:sof_tracker/app/data/models/responses/user/sof.user.model.dart';
import 'package:sof_tracker/app/data/sources/soft.user.source.dart';

/// Storage
class StorageService {
  StorageService() {
    initHive();
  }

  bool initialized = false;

  Future<void> initHive() async {
    await Hive.initFlutter();

    //* Register adapters
    if (!initialized) {
      Hive
        ..registerAdapter(SofUserAdapter())
        ..registerAdapter(SofBadgeAdapter());

      initialized = true;
    }

    //* Open boxes
    await Hive.openBox($r.box.sofUserBox);
  }

  //* Boxes
  late final user = Get.put(SofUserSource());

  Future<void> clearAll() async {
    await Hive.box($r.box.sofUserBox).clear();
  }
}
