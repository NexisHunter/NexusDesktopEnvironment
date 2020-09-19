import 'package:flutter/material.dart';

import '../../system/notifications/notification.dart' as notif;

class NotificationEntry extends StatelessWidget {
  final notif.Notification _notification;
  NotificationEntry({@required notif.Notification notification})
      : _notification = notification;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('${_notification.title}'),
          Expanded(
            child: Row(
              children: [
                _notification.icon,
                Container(
                  child: Text.rich(
                    TextSpan(text: _notification.message),
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
