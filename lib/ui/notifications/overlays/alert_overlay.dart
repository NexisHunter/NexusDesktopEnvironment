import 'package:flutter/material.dart';
import 'package:nexusos_sdk/nexusos_sdk.dart' as system;

import '../alert.dart';

/// This is the overlay for the [NotificationAlert].
///
/// This manages where the notification will be displayed on the desktop based
/// on the user's preference.
class NotificationAlertOverlay extends StatefulWidget {
  @override
  _NotificationAlertOverlayState createState() =>
      _NotificationAlertOverlayState();
}

class _NotificationAlertOverlayState extends State<NotificationAlertOverlay> {
  @override
  Widget build(BuildContext context) {
    final manager = system.NotificationManager();
    // TODO: Handle based on user preference.
    return Positioned.directional(
      textDirection: TextDirection.ltr,
      height: 50,
      end: 1,
      top: 1,
      width: 250,
      child: StreamBuilder<system.Notification>(
        stream: manager.alertStream,
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            final notification = snapshot.data;
            // TODO: Handle time out here/Within notification alert.
            //  it doesn't affect the currently pending notifications, only
            //  the alert is hidden.
            //  A simple transparent empty alert may be a solution.
            return NotificationAlert(notification: notification);
          }
          return Container(
            color: Colors.transparent,
          );
        },
      ),
    );
  }
}
