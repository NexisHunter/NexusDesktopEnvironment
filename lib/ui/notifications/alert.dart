import 'package:flutter/material.dart';
import 'package:nexusos_sdk/nexusos_sdk.dart' as system;

import 'entry.dart';

/// This alerts the current [system.User] about a notification.
///
/// This alert appears on the desktop of the current user.
class NotificationAlert extends StatelessWidget {
  final system.Notification _notification;
  NotificationAlert({@required system.Notification notification})
      : _notification = notification;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.all(
          const Radius.circular(4),
        ),
      ),
      child: NotificationEntry(_notification),
    );
  }
}
