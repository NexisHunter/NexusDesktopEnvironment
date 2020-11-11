import 'package:flutter/material.dart';
import 'package:nexusos_sdk/nexusos_sdk.dart' as system;
import 'package:provider/provider.dart';

import 'entry.dart';

/// This represents the [system.Notification] drawer's list.
///
class NotificationOverlay extends StatefulWidget {
  final system.User user;
  NotificationOverlay(this.user);
  @override
  _NotificationOverlayState createState() => _NotificationOverlayState();
}

class _NotificationOverlayState extends State<NotificationOverlay> {
  @override
  Widget build(BuildContext context) {
    return Consumer<system.NotificationManager>(
      builder: (context, manager, child) => Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: manager.pending.length,
              itemBuilder: (_, index) => NotificationEntry(
                manager.pending[index],
              ),
            ),
          )
        ],
      ),
    );
  }
}
