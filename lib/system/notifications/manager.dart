import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:nexus_desktop_environment/system/notifications/notification.dart';
import 'package:nexus_desktop_environment/system/user/user.dart';

class NotificationManager extends ChangeNotifier {
  static final _instance = NotificationManager._();
  NotificationManager._() : _logger = Logger("NotificationManager");
  factory NotificationManager() => _instance;
  final Logger _logger;
  User _current;

  set currentUser(User user) {
    if (_current != null && _current != user) {
      // if (_current != user && _current != null) {
      _logger.fine("Storing ${_current.username}'s notifications");
      // }
      // Write the state of the original user's notifications
      final userEntries = <String, List<Notification>>{
        '${_current.username}': _pending,
      };
      _userPending.addAll(userEntries);
    }
    // Load the new user
    _current = user;
    // Load pending with user notifications
    // Notify dependants
    pending = _userPending[_current.username] ?? [];
  }

  List<Notification> _pending = [];
  List<Notification> get pending => _pending;
  set pending(List<Notification> pending) {
    _pending = pending;
    notifyListeners();
  }

  /// Tap into the most recently received [Notification].
  Stream<Notification> get alertStream {
    return Stream.fromIterable(
      _pending.getRange(
        0,
        (_pending.length >= 1)
            ? 1
            : 0, // In the event that there are no entries return []
      ),
    );
  }

  Map<String, List<Notification>> _userPending = {};

  /// Push a [notification] to the system
  pushNotification(Notification notification, {User user}) {
    // _logger.info("Adding $notification");
    print("Adding $notification");
    if (user != null || user != _current) {
      _userPending['${user.username}'].add(notification);
    } else {
      pending = [notification, ..._pending];
    }
  }
}
