import 'package:flutter/material.dart';
import 'package:nexus_desktop_environment/system/user/user.dart';

/// A [Notification] is  the alert an application wants the user to see.
class Notification {
  final String message;
  final String title;
  final String applicationName;
  final Image icon;

  /// The [user] that the application belongs to.
  final User user;
  bool _read = false;

  final DateTime _ts;
  DateTime get timestamp => _ts;

  Notification({
    this.title,
    this.message,
    this.applicationName,
    this.icon,
    this.user,
  }) : _ts = DateTime.now();

  markAsRead() => _read = true;
  bool get isRead => _read;

  @override
  String toString() {
    return toMap().toString();
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'msg': message,
      // 'appName': applicationName,
      // 'iconPath': icon.image.toString(),
      // 'user': user.toString(),
    };
  }
}
