import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:nexusos_sdk/nexusos_sdk.dart' as system;

/// This represents the Icon of a [system.Application].
///
/// This is the icon that is stored on disk, generally the one provided during
/// installation.
class ApplicationIcon extends StatelessWidget {
  final String iconPath;
  ApplicationIcon(this.iconPath);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.file(
        File(
          iconPath,
        ),
      ),
    );
  }
}
