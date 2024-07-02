import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:difaf_al_wafa_app/prefs/shared_pref_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';


class FbStorageController {
  static var uuid = Uuid();
  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final FirebaseFirestore _firebaseFireStore = FirebaseFirestore.instance;
  String imageUrl = '';
  String videoUrl = '';
  String audioUrl = '';

  double _progress = 0;

  static Future<String?> uploadFile(File file, Function(double) onProgress) async {
    print('03');
    String fileName = uuid.v4();
    print('04');
    Reference storageReference = FirebaseStorage.instance.ref().child('uploads/$fileName');
    print('05');
    UploadTask uploadTask = storageReference.putFile(file);
    print('06');
    uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
      double progress = (snapshot.bytesTransferred / snapshot.totalBytes);
      onProgress(progress);
    });
    print('07');

    try {
      print('08');
      await uploadTask.whenComplete(() async {});
      return await storageReference.getDownloadURL();
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
  // Future<String> pickImage(
  //     {required XFile pickedFile, required String folderName}) async {
  //   try {
  //     print('firstPickCoverImage');
  //     print('1105');
  //     String fileName = uuid.v4();
  //     print('1106');
  //     Reference referenceRoot = _firebaseStorage.ref();
  //     print('1107');
  //     Reference referenceDirectory = referenceRoot.child(folderName);
  //     print('1108');
  //     Reference referenceImages = referenceDirectory.child(fileName);
  //     print('1109');
  //     print('11010');
  //     await referenceImages.putFile(File(pickedFile.path));
  //     print('11011');
  //     imageUrl = await referenceImages.getDownloadURL();
  //     print(imageUrl);
  //     SharedPrefController().saveCoverImageUrl(coverImageUrl: imageUrl);
  //     print('11012');
  //     return imageUrl;
  //   } catch (error) {
  //
  //   }
  //   return '';
  // }

  Future<String?> pickVideo(
      {required XFile pickedFile, required String folderName}) async {
    print('firstPickVideo');
    print('01');
    String fileName = uuid.v4();
    print('02');
    Reference referenceRoot = _firebaseStorage.ref();
    print('03');
    Reference referenceDirectory = referenceRoot.child(folderName);
    print('04');
    Reference referenceImages = referenceDirectory.child(fileName);
    print('05');
    try {
      print('06');
      await referenceImages.putFile(File(pickedFile.path));
      print('07');
      videoUrl = await referenceImages.getDownloadURL();
      print('08');
      return videoUrl;
    } catch (error) {
      return null;
    }

  }

  Future<String?> pickAudio({required File pickedFile, required String folderName}) async {
    print('firstPickFile');
      final result = await FilePicker.platform.pickFiles(type: FileType.audio);
      pickedFile = (result != null ? File(result.files.single.path!) : null)!;

      print('01');
      String fileName = uuid.v4();
      print('02');
      Reference referenceRoot = FirebaseStorage.instance.ref();
      print('03');
      Reference referenceDirectory = referenceRoot.child(folderName);
      print('04');
      Reference referenceFile = referenceDirectory.child(fileName);
      print('05');
      try {
        print('06');
        print(pickedFile.path);
        await referenceFile.putFile(pickedFile);
        print('07');
        audioUrl = await referenceFile.getDownloadURL();
        print('08');
        return audioUrl;
      } catch (error) {
        print('Upload Error: $error');
      }
    }
  }




// Stream<TaskSnapshot> uploadImage(
//     {required String path,
//       /*required FbUploadListener fbUploadListener*/}) async*{
//   //  نعطيه اسم الصورة اللي بدنا نرفعها و نختار لها اسم لا يتكرر من خلال وضع التاريخ فيه ثم نعطيه المسار
//   UploadTask uploadTask = _firebaseStorage
//       .ref('images/' + uuid.v4())
//       .putFile(File(path));
//   yield* uploadTask.snapshotEvents;

// void uploadImage(
//     {required String path,
//     required FbUploadListener fbUploadListener}) {
//   //  نعطيه اسم الصورة اللي بدنا نرفعها و نختار لها اسم لا يتكرر من خلال وضع التاريخ فيه ثم نعطيه المسار
//   UploadTask uploadTask = _firebaseStorage
//       .ref('images/' + DateTime.now().toString() + 'image')
//       .putFile(File(path));
// // استريم من اجل الاستماع لحالة الرفع باستمرار هل انتهى او لا لسه برفه فشل او نجح
// uploadTask.snapshotEvents.listen((event) {
//   if (event.state == TaskState.running) {
//     // لسه برفع
//     fbUploadListener(status: false, taskState: event.state);
//   } else if (event.state == TaskState.success) {
//     fbUploadListener(
//         status: true,
//         taskState: event.state,
//         reference: event.ref,            // فقط نرجعه في حالة النجاح
//         message: 'Image is uploaded Successfully');
//   } else if (event.state == TaskState.error) {
//     fbUploadListener(
//         status: false,
//         taskState: event.state,
//         message: 'Failed Upload Image, try again');
//   }
// });
// }

// Future<List<Reference>> read() async {
//   ListResult listResult = await _firebaseStorage.ref('images').listAll(); // يعيد كل الصور اللي في ملف الايميج و يرجع مصفوفة
//   if (listResult.items.isNotEmpty) {
//     return listResult.items;
//   }
//   return [];
// }

// Future<bool> delete({required String path}) {
//   return _firebaseStorage
//       .ref(path)
//       .delete()
//       .then((value) => true)
//       .catchError((error) => false);
// }

// final FirebaseStorage _storage = FirebaseStorage.instance;

// Future<String> uploadFile(File file, String folder) async {
//   final ref = _storage.ref().child('$folder/${file.uri.pathSegments.last}');
//   await ref.putFile(file);
//   return await ref.getDownloadURL();
// }
//
// Future<void> updateUserProfile({File? profileImage, File? coverImage}) async {
//   final user = _auth.currentUser;
//   if (user == null) return;
//
//   String? profileImageUrl;
//   String? coverImageUrl;
//
//   if (profileImage != null) {
//     profileImageUrl = await uploadFile(profileImage, 'profileImages');
//   }
//
//   if (coverImage != null) {
//     coverImageUrl = await uploadFile(coverImage, 'coverImages');
//   }
//
//   final data = {
//     if (profileImageUrl != null) 'profileImageUrl': profileImageUrl,
//     if (coverImageUrl != null) 'backgroundImageUrl': coverImageUrl,
//   };
//
//   await _firestore.collection('users').doc(user.uid).update(data);
//   notifyListeners();
// }

// Future<Map<String, dynamic>?> getUserData() async {
//   final user = _auth.currentUser;
//   if (user == null) return null;
//
//   final doc = await _firestore.collection('users').doc(user.uid).get();
//   return doc.data();
// }
