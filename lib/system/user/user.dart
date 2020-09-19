import 'package:flutter/foundation.dart';
import 'package:nexus_desktop_environment/utils/encrypted_string.dart';

class User {
  String _name;
  String _username;
  EncryptedString _password;
  String get name => _name;
  String get username => _username;
  String get password => _password.toString();
  String get home => '/home/$_username/';

  User({@required String username, String name, EncryptedString password})
      : _username = username,
        _name = name,
        _password = password;

  factory User.fromMap(Map<String, dynamic> userMap) => User(
        username: userMap['username'],
        name: userMap['name'],
        password: EncryptedString.fromEncrypted(userMap['pw']),
      );

  Map toMap() {
    return <String, dynamic>{
      "name": name,
      "pw": password,
      "username": username,
    };
  }

  @override
  String toString() {
    return '"name":"$name","username":"$username","pw":"$password"';
  }

  @override
  bool operator ==(Object other) {
    if (!other is User) {
      return false;
    } else {
      User otherUser = other;
      return otherUser.username == _username && otherUser.name == _name;
    }
  }

  @override
  int get hashCode => super.hashCode;
}
