import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:sof_tracker/app/data/di.dart';

class TabItem extends StatelessWidget {
  final String itemName;
  final String value;
  final String? unit;
  final bool isSelected;

  const TabItem({super.key, required this.itemName, required this.isSelected, required this.value, this.unit});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: isSelected ? $r.theme.black : $r.theme.transparent,
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Flexible(child: Text(itemName)), Gap(4.w), Flexible(child: Text("($unit$value)"))],
            ),
          ),
        ],
      ),
    );
  }
}
