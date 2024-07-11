import 'package:difaf_al_wafa_app/models/martyr_models/martyr_profile_data_model.dart';
import 'package:difaf_al_wafa_app/models/martyr_models/martyr_stories_data_model.dart';
import 'package:flutter/material.dart';
import '../controllers/firebase_controllers/fb_firestore_controller.dart';
import '../models/user_models/user_profile_data_model.dart';
import '../prefs/shared_pref_controller.dart';

class DataProvider with ChangeNotifier {
  UserProfileDataModel? _userProfileData;

  UserProfileDataModel? get userProfileData => _userProfileData;

  Future<void> loadUserData() async {
    List<UserProfileDataModel> userData =
    await FbFireStoreController().getAllUserData();

    final userId = SharedPrefController().userDataId;
    _userProfileData = userData.firstWhere((user) => user.userDataId == userId);

    notifyListeners();
  }

  MartyrProfileDataModel? martyrProfileDataModel;

  MartyrProfileDataModel? get martyrProfileData => martyrProfileDataModel;

  Future<void> loadMartyrProfileDataModel({required String martyrDataId }) async {
    List<MartyrProfileDataModel> martyrProfileData =
    await FbFireStoreController().getAllMartyrData();

    martyrProfileDataModel = martyrProfileData.firstWhere((martyr) => martyr.martyrDataId == martyrDataId);

    notifyListeners();
  }
}