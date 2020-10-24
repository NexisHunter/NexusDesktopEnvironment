import 'package:flutter/material.dart' hide Notification;
import 'package:flutter_test/flutter_test.dart';
import 'package:nexus_desktop_environment/system/notifications.dart';
import 'package:nexus_desktop_environment/system/user.dart';

void main() {
  User user = User(username: "test user", name: 'test user');
  final iconUrl =
      'https://www.jpl.nasa.gov/spaceimages/images/largesize/PIA23689_hires.jpg';
  Image testIcon = Image.network(iconUrl);
  group("Notifications", () {
    group("Type", () {
      // TODO: Change to something more descriptive
      test("Initial Setup", () {
        final notification = Notification(
          title: "Testing Suite",
          message: "this is some sample text",
          applicationName: "Flutter Test",
          icon: testIcon,
        );
        expect(notification.timestamp, isNotNull);
        expect(notification.isRead, isFalse);
        expect(notification.user, isNull);
      });
      test("Marked as Read", () {
        final notification = Notification(
          title: "Testing Suite",
          message: "this is some sample text",
          applicationName: "Flutter Test",
          icon: testIcon,
        );
        expect(notification.isRead, isFalse);
        notification.markAsRead();
        expect(notification.isRead, isTrue);
      });
      test("Mark as Unread", () {});
    });
    group("Manager", () {
      NotificationManager initialManager;
      setUpAll(() {
        initialManager = NotificationManager();
      });
      tearDownAll(() {
        initialManager.reset();
      });
      test("Manger is singleton", () {
        final manager = NotificationManager();
        expect(initialManager == manager, isTrue);
      });
      test("Initial Values", () {
        expect(initialManager.currentUser, isNull);
        expect(initialManager.pending, isEmpty);
        expect(initialManager.allNotifications, isEmpty);
      });
    });
  });
}
