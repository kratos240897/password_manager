import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:password_manager/core/constants/app/styles.dart';
import 'package:password_manager/modules/add/add_view_model.dart';
import 'package:provider/provider.dart';

class Add extends HookWidget {
  const Add({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AddViewModel>();
    final nameController = useTextEditingController();
    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();
    final notesController = useTextEditingController();

    final formInputs = [
      {'label': 'Name', 'controller': nameController, 'icon': Icons.person},
      {
        'label': 'Username',
        'controller': usernameController,
        'icon': Icons.verified_user
      },
      {
        'label': 'Password',
        'controller': passwordController,
        'icon': Icons.password
      },
      {'label': 'Notes', 'controller': notesController, 'icon': Icons.notes}
    ];

    return PlatformScaffold(
      material: (context, platform) =>
          MaterialScaffoldData(resizeToAvoidBottomInset: false),
      cupertino: (context, platform) =>
          CupertinoPageScaffoldData(resizeToAvoidBottomInset: false),
      backgroundColor: Colors.grey.shade100,
      appBar: PlatformAppBar(
        leading: PlatformWidget(
          material: (context, platform) => IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.arrow_back)),
          cupertino: (context, platform) => TextButton(
            style: const ButtonStyle(splashFactory: NoSplash.splashFactory),
            onPressed: () => Navigator.of(context).pop(),
            child: PlatformText('Cancel',
                style: Styles.textStyles
                    .f16Regular(color: Styles.colors.kPrimaryColor)),
          ),
        ),
        trailingActions: [
          PlatformWidget(
            cupertino: (context, platform) => TextButton(
              style: const ButtonStyle(splashFactory: NoSplash.splashFactory),
              onPressed: () {
                viewModel
                    .addPassword(
                        name: nameController.text.trim(),
                        username: usernameController.text.trim(),
                        passwordText: passwordController.text.trim(),
                        notes: notesController.text.trim())
                    .then((value) {
                  if (value != null) {
                    Navigator.of(context).pop(value);
                  } else {
                    print('failed');
                  }
                });
              },
              child: PlatformText('Done',
                  style: Styles.textStyles
                      .f16Regular(color: Styles.colors.kPrimaryColor)),
            ),
            material: (context, platform) => IconButton(
                onPressed: () {
                  viewModel
                      .addPassword(
                          name: nameController.text.trim(),
                          username: usernameController.text.trim(),
                          passwordText: passwordController.text.trim(),
                          notes: notesController.text.trim())
                      .then((value) {
                    if (value != null) {
                      Navigator.of(context).pop(value);
                    } else {
                      print('failed');
                    }
                  });
                },
                icon: const Icon(Icons.done)),
          )
        ],
        title: PlatformText(
          'Create',
          style: Styles.textStyles
              .f16Regular(fontFamily: GoogleFonts.notoSans().fontFamily),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 8.h),
          child: Column(
            children: [
              CustomForm(
                inputs: formInputs,
              ),
              16.verticalSpace,
              viewModel.pickedImage.isEmpty
                  ? Icon(
                      FontAwesomeIcons.image,
                      size: 80.spMin,
                      color: Colors.grey,
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: Image.network(
                        viewModel.pickedImage,
                        height: 0.2.sh,
                        fit: BoxFit.fill,
                      ),
                    ),
              8.verticalSpace,
              TextButton.icon(
                  style: TextButton.styleFrom(
                      splashFactory: NoSplash.splashFactory),
                  onPressed: () {
                    if (nameController.text.isNotEmpty) {
                      viewModel.pickImage(context, nameController.text.trim());
                    }
                  },
                  icon: Icon(
                    PlatformIcons(context).photoLibrary,
                    color: Styles.colors.kPrimaryColor,
                  ),
                  label: PlatformText(
                    'Pick image',
                    style: Styles.textStyles
                        .f16Regular(color: Styles.colors.kPrimaryColor),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class CustomForm extends StatelessWidget {
  final List<Map<String, dynamic>> inputs;
  const CustomForm({
    super.key,
    required this.inputs,
  });

  @override
  Widget build(BuildContext context) {
    final isAndroid = Platform.isAndroid;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: isAndroid ? 6.w : 10.w, vertical: 8.h),
      decoration: BoxDecoration(
          color: isAndroid ? Colors.transparent : Colors.white,
          borderRadius: BorderRadius.circular(12.r)),
      child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: inputs.length,
          separatorBuilder: (context, index) => Divider(
                color: isAndroid ? Colors.transparent : Colors.grey,
              ),
          itemBuilder: (context, index) {
            final input = inputs[index];
            return PlatformSpecificTextField(
              label: input['label'],
              controller: input['controller'],
              icon: input['icon'],
            );
          }),
    );
  }
}

class PlatformSpecificTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final IconData icon;
  const PlatformSpecificTextField(
      {super.key,
      required this.label,
      required this.controller,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      cupertino: (context, platform) => Row(
        children: [
          PlatformText(
            label,
            style: Styles.textStyles
                .f16SemiBold()
                .copyWith(color: Colors.grey.shade600),
          ),
          8.horizontalSpace,
          Expanded(
              child: CupertinoTextField.borderless(
            controller: controller,
            style: Styles.textStyles.f16Regular(),
          )),
        ],
      ),
      material: (context, platform) => TextFormField(
        controller: controller,
        decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: Theme.of(context).primaryColor,
            ),
            label: Text(label),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(12.r))),
      ),
    );
  }
}
