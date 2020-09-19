import 'package:flutter/foundation.dart';
import 'package:googleapis/gmail/v1.dart';

class UserProfile extends ChangeNotifier {
  bool _showNotifs;
  final Profile _profile;
  Profile get profile => _profile;
  UserProfile({@required Profile profile}) : _profile = profile;
  bool get showNotifs => _showNotifs;
  set showNotifs(bool showNotifs) {
    _showNotifs = showNotifs;
    notifyListeners();
  }

  Duration _syncFreq = Duration(days: 30);
  get syncFreq => _syncFreq;
}
