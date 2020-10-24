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
        // If the password is not present build an empty string password.
        _password = password ?? EncryptedString();

  factory User.fromMap(Map<String, dynamic> userMap) => User(
        username: userMap['username'] as String,
        name: userMap['name'] as String,
        password: EncryptedString.fromEncrypted(userMap['pw'] as String),
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

  operator ==(Object other) => (other is User)
      ? other.username == _username && other.name == _name
      : false;

  @override
  int get hashCode => super.hashCode;
}
