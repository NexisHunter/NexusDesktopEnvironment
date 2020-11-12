import 'package:flutter/material.dart';

/// [ColoredIconButton] provides a simple wrapper for buttons decorations.
///
/// [ColoredIconButton] provides a simple color wrapper for Icon buttons
/// across the environment.
class ColoredIconButton extends FlatButton {
  /// This button's [color] to be applied as a layering on the button.
  final Color color;

  /// This button's actual [icon] that has not being changed.
  final IconData icon;

  ColoredIconButton({
    @required this.color,
    @required this.icon,
    @required void Function() onPressed,
  }) : super(
            onPressed: onPressed,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Icon(
                icon,
                color: color,
              ),
            ));
}
