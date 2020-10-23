import 'package:flutter/material.dart';
import 'package:nexus_desktop_environment/system/user/user.dart';
import 'package:nexus_desktop_environment/ui/system/pages/lock_screen.dart';
import 'package:nexus_desktop_environment/ui/system/pages/sign_in_page.dart';
import 'package:nexus_desktop_environment/ui/user/desktop.dart';

/// [NexusDesktopEnvironment] is the main driver behind the DE.
///
/// Provides the basic routes that a user may access.
class NexusDesktopEnvironment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: 'login',
      onGenerateInitialRoutes: (String name) => <Route<dynamic>>[
        _router(SignIn()),
      ],
      onGenerateRoute: _generateRoutes,
    );
  }

  /// [_generateRoutes] builds the possible navigation paths.
  ///
  /// [requestedRoute] is the route requesting to be displayed. It contains the
  /// possible parameters needed to route.
  Route<dynamic> _generateRoutes(RouteSettings requestedRoute) {
    User user;
    if (requestedRoute.arguments is User) {
      user = requestedRoute.arguments;
    }
    switch (requestedRoute.name) {
      case 'desktop':
        return _router(Desktop(user: user));
      case 'lockscreen':
        return _router(LockScreen());
      case 'tty':
      // TODO: Handle tty path??
      default:
        // TODO: Handle better
        return _router(SignIn());
    }
  }

  /// [_router] is a small wrapper to build routes easily.
  _router(Widget child) => MaterialPageRoute(builder: (_) => child);
}
