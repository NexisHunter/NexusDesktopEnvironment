import 'package:flutter/material.dart';

import './viewport/viewport.dart';
import 'titlebar.dart';

/// A [FloatingWindow] represents the system window around a running process
/// and handles the positioning of the viewport within the desktop.
class FloatingWindow extends StatefulWidget {
  static const _DEFAULT_DECORATION = const BoxDecoration(
    borderRadius: BorderRadius.only(
      topLeft: const Radius.circular(4.0),
      topRight: const Radius.circular(4.0),
    ),
    color: Colors.black87,
  );
  final BoxDecoration _windowStyle;

  /// The windows dimensions.
  final Size _size;

  /// Whether or not to display the border around the window.
  final bool _showBorder;

  /// The application to run

  FloatingWindow({
    bool showBorder = false,
    Size size = const Size(600, 480),
    BoxDecoration windowStyle = _DEFAULT_DECORATION,
  })  : _size = size,
        _showBorder = showBorder,
        _windowStyle = windowStyle;
  _FloatingWindowState createState() =>
      _FloatingWindowState(_showBorder, _size, _windowStyle);
}

class _FloatingWindowState extends State<FloatingWindow> {
  Size _size;
  bool _showBorder;
  BoxDecoration _windowStyle;
  _FloatingWindowState(this._showBorder, this._size, this._windowStyle);

  /// Resizes a window to the new dimensions without losing previous settings.
  _resizeWindow(double height, double width) {
    setState(() {
      _size = Size(width, height);
      _showBorder = _showBorder;
    });
  }

  onDispose() {
    // TODO: Handle the Closing of the window.
    //   Close application
    //   Save state
  }

  @override
  Widget build(BuildContext context) {
    // Design the window's border.
    return Container(
      // Ensure the window fits the applications dimensions
      // TODO: Look into expanding the width and height based on a constant scale
      height: _size.height,
      width: _size.width,
      // TODO: Tie into application theming
      decoration: _windowStyle,
      child: Column(
        children: [
          TitleBar(onClose: onDispose),
          // The running process within the window.
          Expanded(
            flex: 1,
            // Application Viewport
            child: _showBorder
                ? ApplicationViewport(
                    size: _size * 0.9,
                  )
                : ApplicationViewport(
                    size: _size,
                  ),
          )
        ],
      ),
    );
  }
}
