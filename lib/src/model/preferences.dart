import 'package:david_portfolio_app/src/model/enums/preference_value.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class Preferences {

  late final SharedPreferences prefs;


  Preferences({SharedPreferences? preference}) {
    if (preference != null) prefs = preference;
  }

  Future<void>? init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<String?> get(PreferenceValue key) async {
    if (!prefs.containsKey(key.value)) return null;

    String? value = prefs.getString(key.value);

    return value;
  }

  Future<bool> set(PreferenceValue key, String value) async {
    return prefs.setString(key.value, value);
  }

  Future<bool> clear(PreferenceValue key) {
    return prefs.remove(key.value);
  }
}

final preferences = Preferences();