import 'package:flutter/material.dart';
import 'package:password_manager/core/encryption/encrypter.dart';
import 'package:password_manager/core/local_storage/boxes.dart';
import 'package:password_manager/core/routes/routes.dart';
import 'package:uuid/uuid.dart';

import '../../core/data/models/password.dart';

class AddViewModel with ChangeNotifier {
  String pickedImage = '';

  Future<void> pickImage(BuildContext context, String query) async {
    final result = await Navigator.of(context)
        .pushNamed(Routes.PICK_IMAGE, arguments: query);
    pickedImage = result as String;
    notifyListeners();
  }

  Future<Password?> addPassword(
      {required String name,
      required String username,
      required String passwordText,
      required String notes}) async {
    if (pickedImage.isEmpty) {
      return null;
    }
    final uuid = const Uuid().v1();
    final encyptionResult = EncryptData().encryptAES(passwordText);
    final encryptedPassword = encyptionResult['encrypted_text'];
    final encryptionKey = encyptionResult['encryption_key'];
    final password = Password(
        id: uuid,
        name: name,
        username: username,
        password: encryptedPassword!,
        notes: notes,
        image: pickedImage,
        lastUpdatedAt: DateTime.now(),
        encryptionKey: encryptionKey!
        );
    try {
      await Boxes.getPasswords.add(password);
      return password;
    } catch (e) {
      return null;
    }
  }
}
