import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import 'package:sof_tracker/app/data/services/common/logger_service.dart';
import 'package:sof_tracker/app/data/services/common/storage_service.dart';
import 'package:sof_tracker/app/global/utils/config.dart';

/// Global instances
final $r = Get.put(AppConfig());
final $log = Get.put(LoggerService());
final $storage = Get.put(StorageService());
final $network = Get.put(InternetConnection());
final $theme = Theme.of(Get.context!);
