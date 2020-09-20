import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:nexus_desktop_environment/utils/encrypted_string.dart';

import 'user.dart';

class UserManager {
  File _usersFile = File('/home/.users');
  List<User> _users = [];
  final _logger = Logger("UserManager");
  User current;

  static final UserManager _instance = UserManager._();
  factory UserManager() => _instance;

  UserManager._() {
    if (!_usersFile.existsSync()) {
      // DURING TESTING ENSURE THAT /home can be written by the user until this
      // service is started by root (Which only happens during deploy and
      // dog-fooding)
      _usersFile.createSync();
    }
    _parseUsersFile();
  }

  _parseUsersFile() {
    String f = _usersFile.readAsStringSync();
    if (f.isEmpty || f.length == 1) {
      // If the file is empty, assume that it is a fresh install.
      return;
    }
    String usersString = utf8.decode(base64Decode(f));
    _logger.warning(usersString);
    Map userList = json.decode(usersString);
    _logger.warning(userList);
//    userList = userList.cast<Map<String, dynamic>>();

//    userList.forEach((userMap) {
//      _users.add(User.fromMap(userMap));
//    });
  }

  checkValidUser(String username) {
    for (final user in _users) {
      if (user.username == username) {
        return true;
      }
    }
    return false;
  }

  /// Attempts to [login] to the system.
  ///
  /// If the attempt is authorized the system will proceed, otherwise
  /// a non-descriptive error will be thrown.
  login(String username, EncryptedString password) {
    final validUser = checkValidUser(username);
    if (!validUser) {
      return null;
    }

    final user = _users.singleWhere((user) => user.username == username);
    if (user.password != password.toString()) {
      return null;
    }

    return user;
  }

  /// [createUser] creates a new user for the system.
  ///
  /// The [password] should be of type [EncryptedString] when sent through the system.
  /// This allows for the rest of the application to not need to know how to
  /// encrypt and decrypt the user information.
  createUser({
    @required String username,
    @required EncryptedString password,
  }) {
    // TODO: Fix name in creation of user
    final user = User(username: username, password: password, name: username);
    _users.add(user);
    // TODO: Create home file if not available
    _updateUsersFile();
  }

  /// [_updateUsersFile] ensures that the listing of all users.
  ///
  /// Updates, and encodes the current users available to the system.
  _updateUsersFile() async {
    String users = '{"users":[';
    for (final user in _users) {
      users += '${jsonEncode(user.toMap())},';
    }
    users = users.substring(0, users.lastIndexOf(','));
    users += ']}';

    _usersFile.writeAsString(
        base64Encode(
          utf8.encode(users),
        ),
        mode: FileMode.writeOnly);
  }
}
