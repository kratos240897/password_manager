import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:password_manager/core/constants/app/styles.dart';

class AppImages {
  static SvgPicture touchId(BuildContext context,
      {double? height, double? width}) {
    return SvgPicture.asset(
      'lib/assets/touch_id.svg',
      height: height ?? 30.h,
      width: width ?? 30.w,
      colorFilter:
          ColorFilter.mode(Styles.colors.kPrimaryColor, BlendMode.srcIn),
    );
  }

  static SvgPicture faceId(BuildContext context,
      {double? height, double? width}) {
    return SvgPicture.asset(
      'lib/assets/face_id.svg',
      height: height ?? 30.h,
      width: width ?? 30.w,
      colorFilter:
          ColorFilter.mode(Styles.colors.kPrimaryColor, BlendMode.srcIn),
    );
  }
}
