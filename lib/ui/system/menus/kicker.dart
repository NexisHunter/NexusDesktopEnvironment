import 'package:flutter/material.dart';

class KickerMenu extends StatefulWidget {
  @override
  _KickerMenuState createState() => _KickerMenuState();
}

class _KickerMenuState extends State<KickerMenu> {
  @override
  Widget build(BuildContext context) {
    return Positioned.directional(
      textDirection: TextDirection.ltr,
      // TODO: Get Position From button location
      //  Add decoration on box for floating menus. Think of a triangle
      //  at the bottom left corner for a bottom corner button placement
      // TODO: Go to material.io for design standards of material for
      //  decoration design.
      // Deals with screen position.
      bottom: 0.7,
      start: 1,
      // Deals with actual dimensions , Subtractive when used with ^^
      // TODO: Look into using ^^ to handle a floating menu in a dock
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width * 0.2,
      // child: Expanded(
      child: Container(
        color: Colors.yellow,
        child: Row(
          children: [
            Expanded(
              child: Placeholder(
                color: Colors.purple,
              ),
            ),
            Expanded(
              /// Create the user menu
              ///
              /// Windows 7 Style
              ///   Favourites
              ///   System Options
              ///   Power options
              ///   Directory Shortcuts
              ///
              /// Dock
              ///   Applications
              ///
              ///
              child: Placeholder(
                color: Colors.lightBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
