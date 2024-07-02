//
// import 'dart:io';
//
// import 'package:difaf_al_wafa_app/controllers/firebase_controllers/fb_storage_controller.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:image_picker/image_picker.dart';
//
// import '../prefs/shared_pref_controller.dart';
//
// class LanguageProvider extends ChangeNotifier{
//
//   void pickVideo({required XFile pickedFile, required String folderName}) {
//     FbStorageController().pickVideo(pickedFile: pickedFile, folderName: folderName);
//     notifyListeners();
//   }
//
//   void pickAudio({required File pickedFile, required String folderName}) {
//     FbStorageController().pickAudio(pickedFile: pickedFile, folderName: folderName);
//     notifyListeners();
//   }
//
//   void pickImage({required XFile pickedFile, required String folderName}) {
//     FbStorageController().pickImage(pickedFile: pickedFile, folderName: folderName);
//     notifyListeners();
//   }
//
// }
