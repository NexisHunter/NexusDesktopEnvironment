import 'dart:io';

class Application {
  /// The [path] to where it is installed in the file system.
  String path;

  /// The [name] of the application running.
  String name;

  /// The path to the icon of the application.
  String iconPath;

  Application({
    this.name,
    this.path,
    this.iconPath,
  });

  Future<ProcessResult> _process;
  Future<ProcessResult> get process => _process;
  set process(Future<ProcessResult> _process) {
    _process = _process;
  }
}
