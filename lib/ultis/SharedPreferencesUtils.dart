import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtils {
  static SharedPreferences sharedPreferences;
  static saveData(key, value) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(key, json.encode(value));
  }

  static get(key, callBack) {
    return callBack(json.decode(sharedPreferences.get(key)));
  }
//
//  static setData(key, data) async {
//    final prefs = await SharedPreferences.getInstance();
//    prefs.setString(key, json.encode(data));
//  }
//
//  static getData(key, callBack) async {
//    final prefs = await SharedPreferences.getInstance();
//    final value = prefs.getString(key);
//    callBack(value != null ? json.decode(value) : null);
//  }
}
