import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:password_manager/core/constants/app/constants.dart';
import 'package:password_manager/core/data/models/password.dart';

import 'core/routes/routes.dart';
import 'core/routes/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

init() async {
  const secureStorage = FlutterSecureStorage();
  dynamic encryptionKey =
      await secureStorage.read(key: Constants.HIVE_ENCRYPTION_KEY);
  if (encryptionKey == null) {
    final key = Hive.generateSecureKey();
    await secureStorage.write(
      key: Constants.HIVE_ENCRYPTION_KEY,
      value: base64UrlEncode(key),
    );
  }
  final key = await secureStorage.read(key: Constants.HIVE_ENCRYPTION_KEY);
  encryptionKey = base64Url.decode(key!);
  await Hive.initFlutter();
  Hive.registerAdapter(PasswordAdapter());
  await Hive.openBox<Password>(Constants.DB_NAME,
      encryptionCipher: HiveAesCipher(encryptionKey));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        builder: (context, child) {
          return PlatformApp(
            debugShowCheckedModeBanner: false,
            title: 'Password Manager',
            material: (context, platform) {
              return MaterialAppData(
                  theme: ThemeData(primarySwatch: Colors.deepOrange));
            },
            cupertino: (context, platform) {
              return CupertinoAppData(
                  theme: MaterialBasedCupertinoThemeData(
                      materialTheme:
                          ThemeData(primarySwatch: Colors.deepOrange)));
            },
            initialRoute: Routes.HOME,
            onGenerateRoute: onGenerateRoute,
          );
        });
  }
}
