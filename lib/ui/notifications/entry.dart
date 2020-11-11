import 'package:flutter/material.dart';
import 'package:nexusos_sdk/nexusos_sdk.dart' as system;

/// This entry represents a [Notification] as a card style component.
///
class NotificationEntry extends StatelessWidget {
  final system.Notification notification;
  NotificationEntry(this.notification);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width * 0.9;
    final height = size.height * 0.1;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.elliptical(4, 8),
        ),
      ),
      child: Column(
        children: [
          Text('${notification.title}'),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    width: width * 0.5,
                    height: height * 0.5,
                    // child: _notification.icon,
                    child: Placeholder(
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(
                    child: Text.rich(
                      TextSpan(text: notification.message),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
