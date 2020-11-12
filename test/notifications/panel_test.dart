import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nexus_desktop_environment/ui/notifications/entry.dart';
import 'package:nexus_desktop_environment/ui/notifications/overlay.dart';
import 'package:nexus_desktop_environment/ui/notifications/panel.dart';
import 'package:nexusos_sdk/nexusos_sdk.dart' as system;
import 'package:provider/provider.dart';

void main() {
  group('Notification Panel', () {
    system.User user;
    Widget app;
    system.Notification notif;
    system.NotificationManager notifManager;

    setUpAll(() {
      user = system.User(
          username: 'test-user',
          password: system.EncryptedString(toEncrypt: 'test-pw'));

      notif = system.Notification(
          title: 'Test', message: 'Test notification', user: user);
      notifManager = system.NotificationManager();

      app = _buildApp(
        notifManager,
        NotificationPanel(
          user: user,
        ),
      );
    });

    testWidgets('Has Notification List', (tester) async {
      await tester.pumpWidget(app);
      expect(find.byType(NotificationOverlay), findsOneWidget);
    });

    testWidgets(
      'Has Options Menu',
      (tester) async {
        await tester.pumpWidget(app);
        expect(find.byType(OptionsPanel), findsOneWidget);
      },
    );

    // TODO: Move to test/notifications/overlay_test.dart
    testWidgets(
      'Receives a Notification',
      (tester) async {
        await tester.pumpWidget(app);
        expect(find.byType(NotificationEntry), findsNothing);
        notifManager.push(notif, user: user);
        // TODO: Determine why the Entry is not being picked up
        // Future.delayed(Duration(milliseconds: 500)).then((value) {
        expect(find.byType(NotificationEntry), findsOneWidget);
        // });
      },
      skip: true,
    );
  });
}

MultiProvider _buildApp(system.NotificationManager manager, Widget widget) {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => manager,
      ),
    ],
    child: MaterialApp(
      home: widget,
    ),
  );
}
