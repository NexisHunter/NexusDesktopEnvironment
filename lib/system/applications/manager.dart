// TODO: Refactor into external application and provide API using IPC

import 'dart:io';

import 'package:nexus_desktop_environment/system/applications/application.dart';
import 'package:nexus_desktop_environment/utils/string_extensions.dart';

/// [ApplicationManager] manages all applications.
///
/// Manages all of the current running application started within the
/// Nexus Desktop Environment.
class ApplicationManager {
  // Create a singleton instance of the manager
  static final _instance = ApplicationManager._();
  ApplicationManager._() {
    _getInstalledApplications();
  }
  factory ApplicationManager() => _instance;

  // The currently running [_applications]
  List<Application> _applications = [];
  get runningApps => _applications;
  List<Application> _installed = [];
  get installedApps => _installed;
  _getInstalledApplications() {
    // TODO: Use isolates???
    // Look through bin
    Directory bin = Directory('/usr/bin');
    Directory sbin = Directory('/usr/sbin');
    _getAppsFromDir(bin);
    _getAppsFromDir(sbin);
  }

  _getAppsFromDir(Directory dir) async {
    if (!dir.existsSync()) {
      return;
    }
    final dirApps = dir.list(followLinks: true);
    dirApps.forEach((dirApp) {
      // A file is the executable file
      if (dirApp is File) {
        String path = dirApp.path;
        String name = path.parseName();

        final app = Application(name: name, path: path);
        _installed.add(app);
      }
    });
  }

  // Start
  @override
  start(String appName) async {
    final app = _installed.firstWhere(
      (app) => app.name.toLowerCase() == appName.toLowerCase(),
    );
    app.process = Process.run(app.path, []);
    _applications.add(app);
  }

  // Stop
  stop(String appName) async {
    final app = _applications.firstWhere(
      (app) => app.name.toLowerCase() == appName.toLowerCase(),
    );
    var process = await app.process;
    Process.killPid(process.pid);
    _applications.removeWhere((killed) => killed == app);
  }

  watchUserApps(Directory userDir) {
    // If the path is not in the user's home directory ignore the files.
    if (RegExp(r'^/home/').hasMatch(userDir.path)) {
      // Check if the current directory directory is the user application directory.
      if (_isUserAppDir(userDir.path)) {
        _getAppsFromDir(userDir);
        return;
      } else {
        final userHome = _parseHome(userDir.path);
        _getAppsFromDir(Directory(userHome));
        _getAppsFromDir(userDir);
      }
    }
  }

  _isUserAppDir(String path) =>
      RegExp(r'^\/home\/.*\/Applications\/*').hasMatch(path);

  _parseHome(String path) => RegExp(r'^\/home\/.*\/').stringMatch(path);
}
