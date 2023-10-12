import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveId {
  static late SharedPreferences sharedPref;
  static saveInitialization() async {
    sharedPref = await SharedPreferences.getInstance();
  }

//  set - get -delete -clear (key, value)
  static Future<bool> insertToSave(
      {required String key, required String value}) async {

    return await sharedPref.setString(key, value);


  }

  static String getSaveData({required String key}) {
    debugPrint("sharedPref.getString(key) : ${sharedPref.getString(key)}");
    return sharedPref.getString(key) ?? "";

   // return "125|C24j3J5QLNy13HgP4DlHtN8o8bGagTlnMC0nbi8z";
  }

  static Future<bool> deleteSaveItem({required String key}) async {
    return await sharedPref.remove(key);
  }
}
