
import 'package:flutter/cupertino.dart';

import '../prefs/shared_pref_controller.dart';

class LanguageProvider extends ChangeNotifier{

  String language = SharedPrefController().language;

  void changeLanguage(){
    language = language == 'en' ? 'ar' : 'en';
    SharedPrefController().changeLanguage(language: language);
    // this.language = language;
    notifyListeners();
  }
}
