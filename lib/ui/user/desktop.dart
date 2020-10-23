import 'package:flutter/material.dart';
import 'package:nexus_desktop_environment/system/notifications/manager.dart';
import 'package:nexus_desktop_environment/system/user/user.dart';
import 'package:nexus_desktop_environment/ui/notifications/overlays/alert_overlay.dart';
import 'package:nexus_desktop_environment/ui/notifications/panel.dart';
import 'package:nexus_desktop_environment/ui/system/menus.dart';
import 'package:provider/provider.dart';

class Desktop extends StatefulWidget {
  final User user;
  Desktop({this.user});
  _DesktopState createState() => _DesktopState();
}

class _DesktopState extends State<Desktop> {
  bool _hideNotifs, _showMenu = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _hideNotifs = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: _buildDesktop(context),
          ),
          _buildTaskBar(context),
        ],
      ),
    );
  }

  Widget _buildDesktop(BuildContext context) {
    return Container(
      child: Consumer<NotificationManager>(
        builder: (ctx, manager, child) => Stack(
          children: [
            Container(
              color: Colors.black45,
            ),
            // Notification alert box position
            //  Transparent
            //  height: 25
            //  width:  60
            if (_hideNotifs) NotificationAlertOverlay(),
            if (!_hideNotifs)
              Positioned.directional(
                textDirection: TextDirection.ltr,
                bottom: 1,
                end: 1,
                width: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.height * 0.4,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(6),
                      topRight: const Radius.circular(6),
                    ),
                  ),
                  child: NotificationPanel(user: widget.user),
                ),
              ),
            if (_showMenu) KickerMenu(),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskBar(BuildContext context) {
    return Container(
      height: 35,
      color: Colors.green,
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.crop_square_rounded),
            onPressed: () => _showKickerMenu(),
          ),
          Spacer(),
          IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () => _showNotifs(context)),
        ],
      ),
    );
  }

  void _showKickerMenu() {
    setState(() {
      _showMenu = !_showMenu;
    });
  }

  void _showNotifs(BuildContext context) {
    setState(() {
      _hideNotifs = !_hideNotifs;
    });
  }
}
