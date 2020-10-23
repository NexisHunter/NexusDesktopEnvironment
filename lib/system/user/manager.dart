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
      _logger.warning('Creating users file.');
      // DURING TESTING ENSURE THAT /home can be written by the user until this
      // service is started by root (Which only happens during deploy and
      // dog-fooding)
      _usersFile.createSync();
    } else {
      _logger.info('Found User file');
    }

    _parseUsersFile();
  }

  _parseUsersFile() {
    String f = _usersFile.readAsStringSync();
    if (f.trim().isNotEmpty) {
      // Decode the users
      String usersString = utf8.decode(base64Decode(f));
      Map<String, dynamic> userListMap = json.decode(usersString);
      List<dynamic> users = userListMap['users'];
      _logger.fine('Userlist: $users');
      // Parse each user and add them to the list of users available for use.
      users.forEach((userString) {
        Map<String, dynamic> userMap = jsonDecode(userString as String);
        final user = User.fromMap(userMap);
        _users.add(user);
      });
    }
    _logger.info('Loaded Users');
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

    current = user;
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
    _logger.fine('Creating User: $username');
    _users.add(user);
    // TODO: Create home file if not available
    _updateUsersFile();
  }

  /// [_updateUsersFile] ensures that the listing of all users.
  ///
  /// Updates, and encodes the current users available to the system.
  void _updateUsersFile() async {
    _logger.info('Updating users');
    String users = '{"users":[';
    // Ensure the current set of users is kept as the file is overwritten each time.
    for (final user in _users) {
      users += '${jsonEncode("{$user}")},';
    }
    users = users.substring(0, users.lastIndexOf(','));
    users += ']}';

    _usersFile.writeAsString(
        base64Encode(
          utf8.encode(users),
        ),
        mode: FileMode.writeOnly);
    _logger.info('Users updated.');
  }
}
