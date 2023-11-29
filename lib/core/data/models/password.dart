import 'package:hive/hive.dart';
part 'password.g.dart';

@HiveType(typeId: 0)
class Password {
  Password(
      {required this.id,
      required this.name,
      required this.username,
      required this.password,
      required this.notes,
      required this.image,
      required this.lastUpdatedAt,
      required this.encryptionKey});
  @HiveField(0)
  late final String id;
  @HiveField(1)
  late final String name;
  @HiveField(2)
  late final String username;
  @HiveField(3)
  late final String password;
  @HiveField(4)
  late final String notes;
  @HiveField(5)
  late final String image;
  @HiveField(6)
  late final DateTime lastUpdatedAt;
  @HiveField(7)
  late final String encryptionKey;

  Password.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    password = json['password'];
    notes = json['notes'];
    image = json['image'];
    lastUpdatedAt = json['lastUpdatedAt'];
    encryptionKey = json['encryptionKey'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['password'] = password;
    data['notes'] = notes;
    data['image'] = image;
    data['lastUpdatedAt'] = lastUpdatedAt;
    data['encryptionKey'] = encryptionKey;
    return data;
  }
}
