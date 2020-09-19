import 'dart:io';

import 'package:flutter/widgets.dart';

class ApplicationIcon extends StatefulWidget {
  final String iconPath;
  ApplicationIcon(this.iconPath);
  _ApplicationIconState createState() => _ApplicationIconState();
}

class _ApplicationIconState extends State<ApplicationIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.file(
        File(
          widget.iconPath,
        ),
      ),
    );
  }
}
