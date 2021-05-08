import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class CustomSharedPrefs{
  static setObject(key, object) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(key, jsonEncode(object));
  }

  static getObject(key) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final object = jsonDecode(prefs.getString(key));
    return object;
  }

  static removeObject(key) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove(key);
  }
}