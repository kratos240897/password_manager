import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:password_manager/core/constants/app/styles.dart';
import 'package:password_manager/modules/pick_image/pick_image_viewmodel.dart';
import 'package:provider/provider.dart';

class PickImage extends HookWidget {
  final String query;
  const PickImage({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PickImageVieMmodel>();
    useEffect(() {
      Future.microtask(() => viewModel.getImages(query));
      return null;
    }, []);
    return PlatformScaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: PlatformAppBar(
          title: PlatformText(
            'Pick Image',
            style: Styles.textStyles.f16Regular(),
          ),
        ),
        body: Consumer<PickImageVieMmodel>(
          builder: (context, value, child) {
            return SafeArea(
                child: viewModel.images.isNotEmpty
                    ? GridView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        itemCount: viewModel.images.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 0.12.sh,
                            mainAxisSpacing: 4.h,
                            crossAxisSpacing: 4.w,
                            crossAxisCount: 4),
                        itemBuilder: (context, index) {
                          final image = viewModel.images[index];
                          return GestureDetector(
                            onTap: () => viewModel.pickImage(context, index),
                            child: Image.network(
                              image,
                              fit: BoxFit.fill,
                            ),
                          );
                        })
                    : Center(
                        child: PlatformCircularProgressIndicator(
                        cupertino: (context, platform) =>
                            CupertinoProgressIndicatorData(radius: 10.r),
                      )));
          },
        ));
  }
}
