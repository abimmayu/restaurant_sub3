import 'package:flutter/material.dart';
import 'package:restaurant_app/data/database/preference_helper.dart';

class PreferencesProvider extends ChangeNotifier {
  PreferencesHelper preferencesHelper;

  PreferencesProvider({required this.preferencesHelper}) {
    _getDailyNewsPreferences();
  }

  bool _isDailyNewsActive = false;
  bool get isDailyNewsActive => _isDailyNewsActive;

  void _getDailyNewsPreferences() async {
    _isDailyNewsActive = await preferencesHelper.isDailyNotifActive;
    notifyListeners();
  }

  void enableDailyNews(bool value) {
    preferencesHelper.setDailyNotif(value);
    _getDailyNewsPreferences();
  }
}
