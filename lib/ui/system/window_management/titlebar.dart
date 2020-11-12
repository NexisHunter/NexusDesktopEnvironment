import 'package:flutter/material.dart';
import 'package:nexusos_sdk/nexusos_sdk.dart';

import '../buttons/colored_icon_button.dart';

/// The [TitleBar] provides the top bar for every [ApplicationViewport].
///
/// The [TitleBar] provides common functionality for applications through the
/// use of an optional customisable menu. It is required that the [TitleBar] be
/// passed an [onClose] function to trigger the onDispose, since the [TitleBar]
/// does not need to be made aware of what process is running.
class TitleBar extends StatefulWidget {
  final CallbackFunction onClose;
  final CallbackFunction onMinimise;
  final CallbackFunction onMaximize;

  TitleBar(
      {@required this.onClose,
      @required this.onMinimise,
      @required this.onMaximize});
  @override
  _TitleBarState createState() => _TitleBarState();
}

class _TitleBarState extends State<TitleBar> {
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple,
      height: 50,
      //  |--------------------------------------------------------------
      //  | Icon                                                | - + x |
      //  | HBG Menu                                             ------ |
      //  |-------------------------------------------------------------|
      child: Container(
        child: Row(
          // Force everything to the top of the container
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              // TODO: Set max limits
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.grey,
                      child: Text('Icon'),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.grey,
                      child: Text('HBG Menu'),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(
              flex: 8,
            ),
            _buildWindowControls(),
          ],
        ),
      ),
    );
  }

  /// Builds this window's controls.
  ///
  /// Builds this window's controls based on the chosen
  Widget _buildWindowControls() {
    // TODO: Handle based on system theme.
    return Container(
      color: Colors.grey,
      // height: 20,
      width: 200 / 2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: ColoredIconButton(
                color: Colors.lightGreenAccent[400],
                icon: Icons.minimize,
                onPressed: widget.onMinimise),
          ),
          Flexible(
            child: ColoredIconButton(
              icon: Icons.maximize,
              color: Colors.yellowAccent,
              onPressed: widget.onMaximize,
            ),
          ),
          Flexible(
            child: ColoredIconButton(
              icon: Icons.close,
              color: Colors.redAccent,
              onPressed: widget.onClose,
            ),
          ),
        ],
      ),
    );
  }
}
