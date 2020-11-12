import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:nexusos_sdk/nexusos_sdk.dart' as system;
import 'package:provider/provider.dart';

import 'nexus_desktop_environment.dart';

void main() {
  // TODO: Set up LOGGER in SDK?
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((event) {
    print(
        '${event.loggerName}-${event.level}: ${event.time} | ${event.message}');
  });
  final _logger = Logger("Main");

  // Start Up Initial services
  system.ApplicationManager();
  system.UserManager();
  system.NotificationManager();

  // Now that all the required services are started up begin the desktop
  // environment.
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => system.NotificationManager()),
      ],
      child: NexusDesktopEnvironment(),
    ),
  );
}
