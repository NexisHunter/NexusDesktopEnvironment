import 'package:flutter/material.dart';
import 'package:nexus_desktop_environment/system/notifications/manager.dart';
import 'package:nexus_desktop_environment/system/notifications/notification.dart'
    as notif;
import 'package:nexus_desktop_environment/system/user/user.dart';
import 'package:nexus_desktop_environment/ui/notifications/overlay.dart';

class Desktop extends StatefulWidget {
  final User user;
  Desktop({this.user});
  _DesktopState createState() => _DesktopState();
}

class _DesktopState extends State<Desktop> {
  @override
  Widget build(BuildContext context) {
    final notification = notif.Notification(
      title: 'Test Notification',
      message: 'Testing notification',
    );

    Future.delayed(
      Duration(minutes: 5),
      () => NotificationManager().pushNotification(notification),
    );

    return NotificationOverlay(widget.user);
  }
}
