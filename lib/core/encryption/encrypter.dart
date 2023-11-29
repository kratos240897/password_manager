import 'dart:convert';
import 'dart:math';
import 'package:encrypt/encrypt.dart';

class EncryptData {
//for AES Algorithms

  Map<String, String> encryptAES(plainText) {
    final encryptionKey = createCryptoRandomString();
    final key = Key.fromUtf8(encryptionKey);
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    return {
      'encryption_key': encryptionKey,
      'encrypted_text': encrypted.base64
    };
  }

  String decryptAES(
      {required String encryptionKey, required String plainText}) {
    final key = Key.fromUtf8(encryptionKey);
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    final encrypted = Encrypted.fromBase64(plainText);
    final decrypted = encrypter.decrypt(encrypted, iv: iv);
    return decrypted;
  }

  String createCryptoRandomString([int length = 16]) {
    var values = List<int>.generate(length, (i) => Random().nextInt(256));
    return base64Url.encode(values);
  }
}
