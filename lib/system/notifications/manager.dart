import 'dart:async';

import 'package:nexus_desktop_environment/system/notifications/notification.dart';
import 'package:nexus_desktop_environment/system/user/user.dart';

// TODO: Handle multi user set up.
class NotificationManager {
  static final _instance = NotificationManager._();
  NotificationManager._()
      : _stream = StreamController<Notification>.broadcast();
  factory NotificationManager() => _instance;

  final StreamController<Notification> _stream;

  /// Push a [notification] to the system
  pushNotification(Notification notification) {
    _stream.add(notification);
  }

  /// Provides a stream of filtered for the specific [user].
  Stream<Notification> filteredStream(User user) => _stream.stream
      .where((Notification notification) => notification.user == user)
      .asBroadcastStream();
}
