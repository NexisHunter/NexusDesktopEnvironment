import 'package:flutter/material.dart';
import 'package:nexus_desktop_environment/system/notifications/manager.dart';
import 'package:nexus_desktop_environment/system/notifications/notification.dart'
    as Notif;
import 'package:nexus_desktop_environment/system/user/user.dart';
import 'package:nexus_desktop_environment/ui/notifications/entry.dart';

class NotificationOverlay extends StatefulWidget {
  final User user;
  NotificationOverlay(this.user);
  @override
  _NotificationOverlayState createState() => _NotificationOverlayState();
}

class _NotificationOverlayState extends State<NotificationOverlay> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<Notif.Notification>(
        stream: NotificationManager().filteredStream(widget.user),
        builder:
            (BuildContext context, AsyncSnapshot<Notif.Notification> snapshot) {
          if (snapshot.hasData) {
            return NotificationEntry(notification: snapshot.data);
          }
          // TODO: Should this be shown.
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
