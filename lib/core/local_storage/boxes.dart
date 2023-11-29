import 'package:hive/hive.dart';
import 'package:password_manager/core/constants/app/constants.dart';
import 'package:password_manager/core/data/models/password.dart';

class Boxes {
  static Box<Password> getPasswords = Hive.box(Constants.DB_NAME);
}
