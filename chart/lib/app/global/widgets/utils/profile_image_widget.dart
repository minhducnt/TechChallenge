import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sof_tracker/app/global/constants/resources/assets.gen.dart';
import 'package:sof_tracker/app/global/utils/helpers/misc.dart';

class ProfileImageWidget extends StatelessWidget {
  final String? img;
  final double? height;
  final double? width;
  final bool imgSet;
  final Color? backgroundColor;

  const ProfileImageWidget(
    this.img, {
    super.key,
    this.height = 120,
    this.width = 120,
    this.imgSet = false,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final onPrimaryColor = Theme.of(context).colorScheme.onPrimary.withOpacity(0.8);

    final defaultImage = Image.asset(
      Assets.images.profilePic.path,
      height: height,
      width: width,
      fit: BoxFit.contain,
      color: backgroundColor ?? onPrimaryColor,
    );

    return ClipOval(
      child: CircleAvatar(
        maxRadius: 35,
        backgroundColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
        child: !isNullOrEmpty(img) && img != ''
            ? CachedNetworkImage(
                imageUrl: img ?? '',
                imageBuilder: (context, imageProvider) {
                  return Container(
                    height: height!.h,
                    width: width!.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: imageProvider,
                        fit: imgSet ? BoxFit.contain : BoxFit.cover,
                      ),
                    ),
                  );
                },
                placeholder: (context, url) {
                  return defaultImage;
                },
                errorWidget: (context, url, error) {
                  return defaultImage;
                },
              )
            : defaultImage,
      ),
    );
  }
}
