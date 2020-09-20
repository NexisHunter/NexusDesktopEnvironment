import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:nexus_desktop_environment/system/applications/manager.dart';
import 'package:nexus_desktop_environment/system/notifications/manager.dart';
import 'package:nexus_desktop_environment/system/user/manager.dart';
import 'package:provider/provider.dart';

import 'nexus_desktop_environment.dart';

void main() {
  Logger.root.level = Level.ALL;
  // Start Up Initial services
  ApplicationManager();
  UserManager();

  // Now that all the required services are started up begin the desktop
  // environment.
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NotificationManager()),
        // TODO: Manage UserManger Here??
      ],
      child: NexusDesktopEnvironment(),
    ),
  );
}
