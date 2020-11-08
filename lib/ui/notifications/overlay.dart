import 'package:flutter/material.dart';
import 'package:nexusos_sdk/nexusos_sdk.dart' as system;
import 'package:provider/provider.dart';

import 'entry.dart';

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
      builder: (ctx, manager, child) => Container(
        padding: const EdgeInsets.only(
          top: 4,
        ),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: manager.pending.length,
          itemBuilder: (ctx, index) => NotificationEntry(
            notification: manager.pending[index],
          ),
          separatorBuilder: (ctx, index) => Divider(
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
// return Container(
// color: Colors.yellow,
// width: MediaQuery.of(context).size.width * 0.4,
// // child: FutureBuilder(
// //   initialData: _pending,
// //   // future: _manager.pending,
// //   builder: (ctx, snapshot) {
// //     if (snapshot.hasData && snapshot.data.length >= 1) {
// //       final data = snapshot.data;
// //       return ListView.builder(
// //         itemCount: data.length,
// //         itemBuilder: (ctx, index) => NotificationEntry(
// //           notification: data[index],
// //         ),
// //       );
// //     }
// //     return CircularProgressIndicator();
// //   },
// // ),
// // child: ListView.separated(
// //   itemCount: (_pending == null) ? 0 : _pending.length,
// //   itemBuilder: (BuildContext context, int index) =>
// //       NotificationEntry(notification: _pending[index]),
// //   separatorBuilder: (BuildContext context, int index) => Divider(),
// // ),
// // child: StreamBuilder<List<Notif.Notification>>(
// //   initialData: <Notif.Notification>[],
// //   stream: _manager.stream,
// //   // stream: NotificationManager().filteredStream(widget.user),
// //   builder: (BuildContext context,
// //       AsyncSnapshot<List<Notif.Notification>> snapshot) {
// //     if (snapshot.hasData) {
// //       final notifs = snapshot.data;
// //       if (notifs.length < 1) {
// //         return Container(
// //           height: MediaQuery.of(context).size.height * 0.6,
// //           width: MediaQuery.of(context).size.width * 0.6,
// //           color: Colors.deepOrangeAccent,
// //         );
// //       }
// //       // TODO: Look into why it is not displaying.
// //       // return ListView.builder(
// //       //   itemCount: notifs.length,
// //       //   itemBuilder: (BuildContext ctx, int index) =>
// //       return NotificationEntry(
// //         notification: notifs[0],
// //       ); //,
// //       // );
// //     }
// //     return CircularProgressIndicator();
// //   },
// // ),
// );
// return Container(
//   child: StreamBuilder<NotificationEntry>(
//     stream: NotificationManager().filteredStream(widget.user),
//     builder:
//
//       if (snapshot.hasData) {
//         _pending.add(snapshot.data);
//       }
//       // TODO: Should this be shown.
//       return CircularProgressIndicator();
//     },
//   ),
// );
