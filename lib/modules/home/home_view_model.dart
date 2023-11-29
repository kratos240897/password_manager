import 'package:flutter/material.dart';
import 'package:password_manager/core/data/models/password.dart';
import 'package:password_manager/core/local_storage/boxes.dart';
import 'package:password_manager/core/routes/routes.dart';

class HomeViewModel with ChangeNotifier {
  List<Password> passwords = [];
  getPasswords() async {
    passwords = Boxes.getPasswords.values.toList();
    notifyListeners();
  }

  addPassword(BuildContext context) async {
    final password =
        await Navigator.of(context).pushNamed(Routes.ADD) as Password;
    passwords.add(password);
    notifyListeners();
  }
}
