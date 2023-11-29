import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:password_manager/core/constants/app/app_images.dart';
import 'package:password_manager/core/constants/app/styles.dart';

class LockScreen extends HookWidget {
  const LockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            0.05.sh.verticalSpace,
            Icon(
              PlatformIcons(context).padlockSolid,
              size: 40.spMin,
            ),
            8.verticalSpace,
            PlatformText(
              'Please enroll biometrics',
              style: Styles.textStyles.f16Regular(),
            ),
            16.verticalSpace,
            Expanded(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AppImages.touchId(context),
                    PlatformText(
                      'or',
                      style: Styles.textStyles.f18Regular(),
                    ),
                    AppImages.faceId(context),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
