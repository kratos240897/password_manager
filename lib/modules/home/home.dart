import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:password_manager/core/constants/app/styles.dart';
import 'package:password_manager/core/encryption/encrypter.dart';
import 'package:password_manager/modules/home/home_view_model.dart';
import 'package:provider/provider.dart';

import '../../core/data/models/password.dart';

class Home extends HookWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    useEffect(() {
      Future.microtask(() => viewModel.getPasswords());
      return null;
    }, []);
    return PlatformScaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: PlatformAppBar(
        leading: GestureDetector(
          onTap: () {},
          child: Material(
            color: Colors.transparent,
            child: IconButton(
                onPressed: () {},
                icon: PlatformWidget(
                  material: (context, platform) => Icon(
                    Icons.settings,
                    size: 28.spMin,
                  ),
                  cupertino: (context, platform) => Icon(
                    CupertinoIcons.settings_solid,
                    size: 28.spMin,
                  ),
                )),
          ),
        ),
        trailingActions: [
          Material(
            color: Colors.transparent,
            child: IconButton(
                onPressed: () => viewModel.addPassword(context),
                icon: PlatformWidget(
                  material: (context, platform) => Icon(
                    Icons.add,
                    size: 28.spMin,
                  ),
                  cupertino: (context, platform) => Icon(
                    CupertinoIcons.add,
                    size: 28.spMin,
                  ),
                )),
          )
        ],
        title: PlatformText(
          'Hashed',
          style: Styles.textStyles
              .f16Regular(fontFamily: GoogleFonts.notoSans().fontFamily)
              .copyWith(letterSpacing: 1.2),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: PasswordList(viewModel: viewModel),
      ),
    );
  }
}

class PasswordList extends StatelessWidget {
  final HomeViewModel viewModel;
  const PasswordList({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.fromLTRB(16.w, 6.h, 16.w, 8.h),
        itemCount: viewModel.passwords.length,
        itemBuilder: (context, index) {
          final password = viewModel.passwords[index];
          return PasswordListItem(
            password: password,
          );
        });
  }
}

class PasswordListItem extends StatelessWidget {
  final Password password;

  const PasswordListItem({
    super.key,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showPasswordDialog(context, password),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 6.h),
        child: Row(
          children: [
            ClipOval(
              child: Image.network(
                password.image,
                width: 50.w,
                height: 50.w,
                fit: BoxFit.fill,
              ),
            ),
            12.horizontalSpace,
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PlatformText(
                            password.name,
                            style: Styles.textStyles
                                .f16SemiBold()
                                .copyWith(letterSpacing: 1.2),
                          ),
                          PlatformText(
                            '@ ${password.username}',
                            style: Styles.textStyles.f16Regular(),
                          ),
                        ],
                      ),
                      const Spacer(),
                      PlatformText(
                        formatDate(password.lastUpdatedAt),
                        style: Styles.textStyles.f12Regular(),
                      ),
                      4.horizontalSpace,
                      Icon(
                        PlatformIcons(context).rightChevron,
                        color: Colors.grey,
                        size: 20.spMin,
                      )
                    ],
                  ),
                  const Divider(
                    color: Colors.grey,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  String formatDate(DateTime dateTime) {
    return DateFormat('d MMM h:mm a').format(dateTime);
  }

  _showPasswordDialog(BuildContext context, Password password) {
    final isAndroid = Platform.isAndroid;
    final decryptedPassword = EncryptData().decryptAES(
        encryptionKey: password.encryptionKey, plainText: password.password);
    if (isAndroid) {
      showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: PlatformText(
                  'Password',
                  style: Styles.textStyles.f16Bold(),
                ),
                content: PlatformText(decryptedPassword,
                    style: Styles.textStyles.f16Regular()),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: PlatformText('OK',
                        style: Styles.textStyles.f16Regular()),
                  ),
                ],
              ));
    } else {
      showCupertinoModalPopup<String>(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: PlatformText(
            'Password',
            style: Styles.textStyles.f16Bold(),
          ),
          content: PlatformText(decryptedPassword,
              style: Styles.textStyles.f16Regular()),
          actions: <CupertinoDialogAction>[
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () {
                Navigator.pop(context);
              },
              child: PlatformText('OK', style: Styles.textStyles.f16Regular()),
            ),
          ],
        ),
      );
    }
  }
}
