import 'dart:async';

import 'package:nexus_desktop_environment/system/notifications/notification.dart';

class NotificationStream extends Stream<Notification> {
  @override
  StreamSubscription<Notification> listen(
    void Function(Notification event) onData, {
    Function onError,
    void Function() onDone,
    bool cancelOnError,
  }) {
    //
  }
}
