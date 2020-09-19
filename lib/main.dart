import 'package:flutter/material.dart';
import 'package:nexus_desktop_environment/system/applications/manager.dart';
import 'package:nexus_desktop_environment/system/user/manager.dart';

import 'nexus_desktop_environment.dart';

void main() {
  // Start Up Initial services
  ApplicationManager();
  UserManager();

  // Now that all the required services are started up begin the desktop
  // environment.
  runApp(
    NexusDesktopEnvironment(),
  );
}
