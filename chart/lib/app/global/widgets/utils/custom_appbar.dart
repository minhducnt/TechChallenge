import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sof_tracker/app/data/di.dart';
import 'package:sof_tracker/app/global/utils/ui_utils.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? titleColor;
  final Icon? leadingIcon;
  final List<Widget>? actions;
  final String? title;
  final SystemUiOverlayStyle? customSystemOverlayUI;
  final Widget? bottomTabBar;
  final bool? backToFirst;
  final bool? showBtmShadow;
  final bool? showLeadingBtn;
  final bool? showSystemOverlay;
  final bool? showTitle;
  final bool? showTitleCenter;
  final double? preferSize;
  final Widget? flexibleSpace;
  final EdgeInsetsGeometry? flexibleSpacePadding;

  const CustomAppBar({
    super.key,
    this.actions,
    this.backToFirst = false,
    this.backgroundColor,
    this.bottomTabBar,
    this.customSystemOverlayUI,
    this.iconColor,
    this.leadingIcon,
    this.preferSize = kToolbarHeight,
    this.showBtmShadow = false,
    this.showLeadingBtn = false,
    this.showSystemOverlay = false,
    this.showTitle = true,
    this.showTitleCenter = false,
    this.title,
    this.titleColor,
    this.flexibleSpace,
    this.flexibleSpacePadding,
  });

  @override
  Size get preferredSize {
    var height = showTitle == false ? 16.0 : preferSize!;

    if (bottomTabBar != null) {
      height += 56;
    }

    return Size.fromHeight(height);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DecoratedBox(
      decoration:
          showBtmShadow == true
              ? BoxDecoration(
                boxShadow: [BoxShadow(color: theme.colorScheme.shadow, offset: const Offset(0, 4), blurRadius: 16)],
              )
              : const BoxDecoration(),
      child: AppBar(
        //* Options
        systemOverlayStyle:
            showSystemOverlay == true
                ? SystemUiOverlayStyle(
                  statusBarColor: Theme.of(context).colorScheme.primary,
                  systemNavigationBarColor: Theme.of(context).colorScheme.onInverseSurface,
                )
                : customSystemOverlayUI,
        automaticallyImplyLeading: showLeadingBtn!,
        leadingWidth: width / 11,
        backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.primary,
        shadowColor: $r.theme.black,
        centerTitle: showTitleCenter,
        elevation: 0,

        //* Content
        leading:
            showLeadingBtn == false
                ? null
                : CupertinoButton(
                  padding: EdgeInsets.only(left: width / 40),
                  onPressed:
                      () =>
                          backToFirst == false
                              ? Navigator.pop(context)
                              : Navigator.of(context).popUntil((route) => route.isFirst),
                  child: Padding(
                    padding: flexibleSpacePadding ?? EdgeInsets.only(left: 4.w),
                    child:
                        leadingIcon ??
                        Icon(
                          FluentIcons.arrow_left_24_regular,
                          size: 18.sp,
                          color: iconColor ?? Theme.of(context).colorScheme.surface,
                        ),
                  ),
                ),
        title:
            showTitle == false
                ? null
                : Container(
                  padding: flexibleSpacePadding,
                  child: Text(
                    title!,
                    style: text16.semiBold.copyWith(color: titleColor ?? Theme.of(context).colorScheme.onPrimary),
                  ),
                ),
        actions: actions ?? [],
        flexibleSpace: flexibleSpace,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Column(children: [bottomTabBar ?? const SizedBox.shrink()]),
        ),
      ),
    );
  }
}
