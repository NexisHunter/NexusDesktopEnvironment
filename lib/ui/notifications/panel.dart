import 'package:flutter/material.dart';
import 'package:nexus_desktop_environment/system/user/user.dart';
import 'package:nexus_desktop_environment/ui/notifications/overlay.dart';

class NotificationPanel extends StatefulWidget {
  final User user;
  NotificationPanel({this.user});
  @override
  _NotificationPanelState createState() => _NotificationPanelState();
}

class _NotificationPanelState extends State<NotificationPanel> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: NotificationOverlay(widget.user),
          ),
          Container(
            color: Colors.blue,
            height: 25,
          ),
        ],
      ),
    );
  }
}
