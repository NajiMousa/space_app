

import 'package:shared_preferences/shared_preferences.dart';

enum PrefKey{
  loggedIn , email , language , langGetX
}
class SharedPrefController{
  static final SharedPrefController _instance = SharedPrefController._internal();
  SharedPrefController._internal();
  factory SharedPrefController() {
    return _instance;
  }

  late SharedPreferences _sharedPreferences;
  Future<void> initSharedPref() async{
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  // Future<void> save({required String email}) async{
  //   await _sharedPreferences.setBool(PrefKey.loggedIn.toString(), true);
  //   await _sharedPreferences.setString(PrefKey.loggedIn.toString(), email);
  // }
  // bool get loggedIn => _sharedPreferences.getBool(PrefKey.loggedIn.toString()) ?? false;
  // String get email => _sharedPreferences.getString(PrefKey.email.toString()) ?? '';
  //
  // Future<void> removeKey(String key) async{
  //   await _sharedPreferences.remove(key);
  // }
  // //OR
  // Future<bool> logout() async{
  //   await _sharedPreferences.remove(PrefKey.email.toString());
  //   return await _sharedPreferences.setBool(PrefKey.loggedIn.toString(), false);
  // }
  // //OR
  // Future<bool> clear() async{
  //    return await _sharedPreferences.clear();
  // }

  Future<bool> changeLanguage({required String language}) async{
    return await _sharedPreferences.setString(PrefKey.language.toString(), language);
  }
  String get language => _sharedPreferences.getString(PrefKey.language.toString()) ?? 'en';

  // Future<void> setLanguage({required String lang}) async{
  //    await _sharedPreferences.setString(PrefKey.langGetX.toString(), lang);
  // }
  // String get langGetX => _sharedPreferences.getString(PrefKey.langGetX.toString()) ?? 'en';
}