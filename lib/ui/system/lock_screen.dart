import 'package:flutter/material.dart';
import 'package:nexusos_sdk/nexusos_sdk.dart' as system;

import 'sign_in_page.dart';

/// This [LockScreen] is what the [system.User] will see when locked out.
///
/// This is the screen that the [system.User] will interact with anytime their
/// system is locked or on wake. The main difference between the lockscreen and
/// the [SignIn] is that the lock screen only supports 1 [system.User].
class LockScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = system.UserManager().current;
    // TODO: Use something else.
    return SignIn();
  }
}
