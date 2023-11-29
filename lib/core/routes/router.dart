import 'package:flutter/material.dart';
import 'package:password_manager/modules/add/add_view_model.dart';
import 'package:password_manager/modules/home/home_view_model.dart';
import 'package:password_manager/modules/lock_screen/lock_screen.dart';
import 'package:password_manager/modules/lock_screen/lock_screen_view_model.dart';
import 'package:password_manager/modules/pick_image/pick_image_viewmodel.dart';
import 'package:provider/provider.dart';
import '../../modules/add/add.dart';
import '../../modules/edit/edit.dart';
import '../../modules/home/home.dart';
import '../../modules/pick_image/pick_image.dart';
import '../../modules/settings/settings.dart';
import 'routes.dart';

Route? onGenerateRoute(RouteSettings settings) {
  final route = settings.name;
  final args = settings.arguments;

  switch (route) {
    case Routes.LOCK_SCREEN:
      return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
                create: (context) => LockScreenViewModel(),
                child: const LockScreen(),
              ));
    case Routes.HOME:
      return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
              create: (context) => HomeViewModel(), child: const Home()));
    case Routes.ADD:
      return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
              create: (context) => AddViewModel(), child: const Add()));
    case Routes.EDIT:
      return MaterialPageRoute(builder: (context) => const Edit());
    case Routes.SETTINGS:
      return MaterialPageRoute(builder: (context) => const Settings());
    case Routes.PICK_IMAGE:
      return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
                create: (context) => PickImageVieMmodel(),
                child: PickImage(
                  query: args as String,
                ),
              ));
  }
  return null;
}
