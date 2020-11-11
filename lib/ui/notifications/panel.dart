import 'package:flutter/material.dart';
import 'package:nexusos_sdk/nexusos_sdk.dart' as system;

import 'overlay.dart';

/// This is the provides all of the [system.User]'s [system.Notification]s.
///
class NotificationPanel extends StatefulWidget {
  final system.User user;
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
          OptionsPanel(),
        ],
      ),
    );
  }
}

class OptionsPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.blue,
      height: 25,
    );
  }
}
