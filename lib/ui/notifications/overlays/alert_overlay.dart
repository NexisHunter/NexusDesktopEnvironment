// TODO: Refactor
import 'package:flutter/material.dart';
import 'package:nexus_desktop_environment/system/notifications/manager.dart';
import 'package:nexus_desktop_environment/system/notifications/notification.dart'
    as notif;
import 'package:provider/provider.dart';

import '../entry.dart';

class NotificationAlertOverlay extends StatefulWidget {
  @override
  _NotificationAlertOverlayState createState() =>
      _NotificationAlertOverlayState();
}

class _NotificationAlertOverlayState extends State<NotificationAlertOverlay> {
  @override
  Widget build(BuildContext context) {
    // TODO: Handle Consumer2 For User Manager as well
    return Positioned.directional(
      textDirection: TextDirection.ltr,
      height: 50,
      end: 1,
      top: 1,
      width: 250,
      // child: (manager.liste),
      child: Consumer<NotificationManager>(
        builder: (context, manager, child) => StreamBuilder<notif.Notification>(
          stream: manager.alertStream,
          builder: (ctx, snapshot) {
            if (snapshot.hasData) {
              final _notification = snapshot.data;
              return Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.all(
                    const Radius.circular(4),
                  ),
                ),
                child: NotificationEntry(
                  notification: _notification,
                ),
              );
              // return NotificationAlert(notification: snapshot.data);
            }
            return Container(
              color: Colors.lightBlue,
            );
          },
        ),
      ),
    );
  }
}
