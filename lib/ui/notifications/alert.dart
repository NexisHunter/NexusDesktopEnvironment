import 'package:flutter/material.dart';
import 'package:nexus_desktop_environment/system/notifications/notification.dart'
    as notif;
import 'package:nexus_desktop_environment/ui/notifications/entry.dart';

class NotificationAlert extends StatelessWidget {
  final notif.Notification _notification;
  NotificationAlert({@required notif.Notification notification})
      : _notification = notification;
  @override
  Widget build(BuildContext context) {
    // TODO: Use Positioned.directional
    return Positioned.directional(
      textDirection: TextDirection.ltr,
      height: 150,
      width: 200,
      // TODO: Get Position from User prefs
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.all(
            const Radius.circular(4),
          ),
        ),
        child: NotificationEntry(
          notification: _notification,
        ),
      ),
    );
  }
}
