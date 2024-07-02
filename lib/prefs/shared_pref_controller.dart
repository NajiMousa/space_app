

import 'package:shared_preferences/shared_preferences.dart';

enum PrefKey{
  loggedIn , email , language , langGetX ,verificationId , phone  ,firstTime ,userIdRegistration, password, singUp,userDataId,martyrRequestDataId,initiativeId,coverImageUrl,profileImageUrl,groupId
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

  Future<bool> checkIsFirstTime({required bool firstTime}) async{
    return await _sharedPreferences.setBool(PrefKey.firstTime.toString(), firstTime);
  }
  bool get firstTime => _sharedPreferences.getBool(PrefKey.firstTime.toString()) ?? true;

  Future<bool> checkIsSingUpScreen({required bool singUp}) async{
    return await _sharedPreferences.setBool(PrefKey.singUp.toString(), singUp);
  }
  bool get singUp => _sharedPreferences.getBool(PrefKey.singUp.toString()) ?? false;

  Future<void> saveEmail({required String email}) async{
    await _sharedPreferences.setBool(PrefKey.loggedIn.toString(), true);
    await _sharedPreferences.setString(PrefKey.email.toString(), email);
  }

  String get email => _sharedPreferences.getString(PrefKey.email.toString()) ?? '';

  Future<void> savePhone({required String phone}) async{
    await _sharedPreferences.setBool(PrefKey.loggedIn.toString(), true);
    await _sharedPreferences.setString(PrefKey.phone.toString(), phone);
  }

  String get phone => _sharedPreferences.getString(PrefKey.phone.toString()) ?? '';

  //// todo : saves Ids Users
  Future<void> saveUserIdRegistration({required String userIdRegistration}) async{
    await _sharedPreferences.setString(PrefKey.userIdRegistration.toString(), userIdRegistration);
  }

  String get userIdRegistration => _sharedPreferences.getString(PrefKey.userIdRegistration.toString()) ?? '';

  Future<void> saveUserDataId({required String userDataId}) async{
    await _sharedPreferences.setString(PrefKey.userDataId.toString(), userDataId);
  }

  String get userDataId => _sharedPreferences.getString(PrefKey.userDataId.toString()) ?? '';

  Future<void> saveGroupId({required String groupId}) async{
    await _sharedPreferences.setString(PrefKey.groupId.toString(), groupId);
  }

  String get groupId => _sharedPreferences.getString(PrefKey.groupId.toString()) ?? '';

  Future<void> saveMartyrRequestDataId({required String martyrRequestDataId}) async{
    await _sharedPreferences.setString(PrefKey.martyrRequestDataId.toString(), martyrRequestDataId);
  }

  String get martyrRequestDataId => _sharedPreferences.getString(PrefKey.martyrRequestDataId.toString()) ?? '';

  Future<void> saveInitiativeId({required String initiativeId}) async{
    await _sharedPreferences.setString(PrefKey.initiativeId.toString(), initiativeId);
  }

  String get initiativeId => _sharedPreferences.getString(PrefKey.initiativeId.toString()) ?? '';

  Future<void> saveCoverImageUrl({required String coverImageUrl}) async{
    await _sharedPreferences.setString(PrefKey.coverImageUrl.toString(), coverImageUrl);
  }

  String get coverImageUrl => _sharedPreferences.getString(PrefKey.coverImageUrl.toString()) ?? '';

  Future<void> saveProfileImageUrl({required String profileImageUrl}) async{
    await _sharedPreferences.setString(PrefKey.profileImageUrl.toString(), profileImageUrl);
  }

  String get profileImageUrl => _sharedPreferences.getString(PrefKey.profileImageUrl.toString()) ?? '';


  Future<void> savePassword({required String password}) async{
    await _sharedPreferences.setString(PrefKey.password.toString(), password);
  }

  String get password => _sharedPreferences.getString(PrefKey.password.toString()) ?? '';

  bool get loggedIn => _sharedPreferences.getBool(PrefKey.loggedIn.toString()) ?? false;

  // Future<void> removeKey(String key) async{
  //   await _sharedPreferences.remove(key);
  // }
  // //OR
  // Future<bool> logout() async{
  //   await _sharedPreferences.remove(PrefKey.email.toString());
  //   await _sharedPreferences.remove(PrefKey.phone.toString());
  //   await _sharedPreferences.remove(PrefKey.password.toString());
  //   return await _sharedPreferences.setBool(PrefKey.loggedIn.toString(), false);
  // }
  // //OR
  Future<bool> clear() async{
    print('01');
    print(SharedPrefController().email);
    print(SharedPrefController().password);
    print(SharedPrefController().phone);
     return await _sharedPreferences.clear();

  }

  Future<bool> changeLanguage({required String language}) async{
    return await _sharedPreferences.setString(PrefKey.language.toString(), language);
  }
  String get language => _sharedPreferences.getString(PrefKey.language.toString()) ?? 'en';

  Future<void> saveVerificationId ({required String verificationId }) async{
    await _sharedPreferences.setString(PrefKey.verificationId.toString(), verificationId);
  }

  String get verificationId => _sharedPreferences.getString(PrefKey.verificationId.toString()) ?? '';

  // Future<void> setLanguage({required String lang}) async{
  //    await _sharedPreferences.setString(PrefKey.langGetX.toString(), lang);
  // }
  // String get langGetX => _sharedPreferences.getString(PrefKey.langGetX.toString()) ?? 'en';
}