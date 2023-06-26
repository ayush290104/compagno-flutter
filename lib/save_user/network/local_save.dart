
import 'package:shared_preferences/shared_preferences.dart';

class SaveId{
  static late SharedPreferences sharedPref;
  static saveInitialization() async{
    sharedPref = await SharedPreferences.getInstance();
  }

//  set - get -delete -clear (key, value)
static Future<bool> insertToSave({required String key, required String value}) async{
    return await sharedPref.setString(key, value);
}

static String getSaveData({required String key}){
    return sharedPref.getString(key)?? "";

}

static Future<bool> deleteSaveItem({required String key}) async{
    return await sharedPref.remove(key);
}




}