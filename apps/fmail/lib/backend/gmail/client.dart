import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:googleapis/gmail/v1.dart';
import 'package:http/http.dart' as http;

import 'user_profile.dart';

class GmailClient extends ChangeNotifier {
  final GmailApi _client;
  Timer _watch;
  GmailClient._() : _client = GmailApi(http.Client());
  static final _instance = GmailClient._();
  factory GmailClient() => _instance;

  UserProfile _profile;
  get profile => _profile;
  set profile(UserProfile profile) {
    _profile = profile;
    if (_profile.showNotifs) {
      _watch = Timer.periodic(_profile.syncFreq, _renewWatcher);
    }
    notifyListeners();
  }

  void _renewWatcher(Timer t) {
//    _profile.profile.
  }

  static const _scopes = const [];

  // Notifications should be a stream

}
