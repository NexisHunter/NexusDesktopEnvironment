import 'package:flutter/material.dart';

/// An [ApplicationViewport] is the area in which the program running can display
/// any visual output.
///
/// The [ApplicationViewport] will be the area in the tree to contain the necessary
/// visual output of a given process; either by handling stdout, for terminal
/// based applications, or by accepting the visual output through a rendering
/// pipeline so the dart vm does not have to run the processing directly.
class ApplicationViewport extends StatelessWidget {
  /// The maximum [_size] the viewport will be.
  final Size _size;

  ApplicationViewport({
    // Set up a basic viewport for the running application.
    Size size = const Size(640, 480),
  }) : _size = size;

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: _size,
      // TODO: Handle visual output from running process
      /// TODO: Processes will potentially be handled in an isolate.
      ///  ProcessRunner has yet to be planned out
      child: Placeholder(),
    );
  }
}
