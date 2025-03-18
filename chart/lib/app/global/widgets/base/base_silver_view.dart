import 'package:flutter/material.dart';

import 'package:sof_tracker/app/global/widgets/base/base_controller.dart';
import 'package:sof_tracker/app/global/widgets/base/base_view.dart';

abstract class BaseSilverView<Controller extends BaseController>
    extends BaseView<Controller> {
  const BaseSilverView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) => null;
}
