import 'dart:async';
import 'package:difaf_al_wafa_app/helpers/helper.dart';
import 'package:difaf_al_wafa_app/prefs/shared_pref_controller.dart';
import 'package:difaf_al_wafa_app/screens/auth_screens/main_auth_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../models/user_models/users_registeration_model.dart';
import 'fb_firestore_controller.dart';

typedef FbAuthStateListener = void Function(
    {required bool state});

class FbAuthController with Helper {

  var uuid = Uuid();

  SharedPrefController sharedPrefController = SharedPrefController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool firstTime = true;

  FbFireStoreController fbFireStoreController = FbFireStoreController();

  // String? _verificationId;

  Future<bool> createAndLoginPhoneNumber({required BuildContext context, required String phone, required String password,}) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _firebaseAuth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          print('Phone verification failed: $e');
        },
        codeSent: (String verificationId, int? resendToken) {
          SharedPrefController()
              .saveVerificationId(verificationId: verificationId);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MainAuthScreen(selectedIndex: 4),
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
      return true;
    } catch (e) {
      print('Error verifying phone number: $e');
      showSmackBar(context: context, message: 'Registration Failed');
    }
    return false;
  }

  Future<bool> checkVerificationCodeWithPhoneRegister({required BuildContext context, required String verificationCode}) async {
    print(SharedPrefController().verificationId);
    try {
      print(SharedPrefController().verificationId);
      AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: SharedPrefController().verificationId!,
        smsCode: verificationCode,
      );
      UserCredential userCredential = await _firebaseAuth.signInWithCredential(credential);
      print('011');
      User? user = userCredential.user;
      if (user != null) {
        UsersRegisterationModel usersRegisterationModel = UsersRegisterationModel(
          userAuthId: user.uid,
          email: sharedPrefController.email,
          password: sharedPrefController.password,
          phone: sharedPrefController.phone,
          usersRegisterationId: uuid.v4(),
        );

        sharedPrefController.singUp ? await FbFireStoreController().addUser(userRegisterationModel: usersRegisterationModel):null;

        print(firstTime);
        // print(users);
        // await fbFireStoreController.addUser(user.uid, users);
        // await fbFireStoreController.addUser(user.uid);
        print('13');
        return true;
      }
    } catch (e) {
      print('Error registering user with verification code: $e');
    }
    return false;
  }


  Future<bool> logInByEmail({required BuildContext context, required String email, required String password}) async {
    try {
      // نظرا لانه يسبب throw Exception استخدمنا Try
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        if (userCredential.user!.emailVerified) {
          // اذا الايميل متحقق منه يرجع صح
          return true;
        } else {
          await userCredential.user!
              .sendEmailVerification(); // ارسال بريد تححقق من الايميل
          ///showSnackBar(context : context , message : e.message ?? 'your Email not verified check And Try again', error : true);
        }
      }
    } on FirebaseAuthException catch (e) {
      _controlAuthException(context: context, e: e);
    } catch (e) {
      print(e);
    }
    return false;
  }

  Future<bool> createAccountByEmail({required BuildContext context, required String email, required String password,}) async {
    try {
      // نظرا لانه يسبب throw Exception استخدمنا Try
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      await userCredential.user!
          .sendEmailVerification(); // ارسال بريد تححقق من الايميل
      await signOut(); // عشان احنا طالبين يحقق الايميل اولا و ما بدنا او ما يسجل يفوت ع التطبيق
      ///showSnackBar(context : context , message : 'Account Created , check your Email', error : true);

      User? user = userCredential.user;
      if (user != null) {
        print('012');
        print(user.uid);
        UsersRegisterationModel usersRegisterationModel =
        UsersRegisterationModel(
          userAuthId: user.uid,
            email: sharedPrefController.email,
            password: sharedPrefController.password,
            phone: sharedPrefController.phone,
          usersRegisterationId: uuid.v4(),
        );
        await FbFireStoreController()
            .addUser(userRegisterationModel: usersRegisterationModel);
        // print(users);
        // await fbFireStoreController.addUser(user.uid, users);
        // await fbFireStoreController.addUser(user.uid);
        print('13');
        return true;
      }
    } on FirebaseAuthException catch (e) {
      _controlAuthException(context: context, e: e);
    } catch (e) {
      print(e);
    }
    return false;
  }

  Future<bool> forgetPasswordByEmail({required BuildContext context, required String email}) async {
    try {
      // نظرا لانه يسبب throw Exception استخدمنا Try
      await _firebaseAuth.sendPasswordResetEmail(email: email);

      ///showSnackBar(context : context , message : 'password reset email sent , check your Email ', error : true);
      return true;
    } on FirebaseAuthException catch (e) {
      _controlAuthException(context: context, e: e);
    } catch (e) {
      print(e);
    }
    return false;
  }

  // bool get loggedIn => _firebaseAuth.currentUser != null ;                    // الطريقة السابقة لمعرفة هل المستخدم مسجل دخول

  StreamSubscription checkUserState({required FbAuthStateListener listener}) {
    // الطريقة المدثة يوجد تعريف بالاعلى
    return _firebaseAuth.authStateChanges().listen((User? user) {
      listener(state: user != null);
    });
  }

  Future<void> signOut() async {
    print('01');
    await _firebaseAuth.signOut();
    print('02');
  }

  void _controlAuthException({required BuildContext context, required FirebaseAuthException e,}) {
    ///showSnackBar(context : context , message : e.message ?? 'Error occurred!', error : true);

    if (e.code == 'invalid-email') {
      ///showSnackBar(context : context , message : e.message ?? 'Error occurred!', error : true);
    } else if (e.code == 'user-disabled') {
      ///showSnackBar(context : context , message : e.message ?? 'Error occurred!', error : true);
    } else if (e.code == 'user-not-found') {
      ///showSnackBar(context : context , message : e.message ?? 'Error occurred!', error : true);
    } else if (e.code == 'wrong-password') {
      ///showSnackBar(context : context , message : e.message ?? 'Error occurred!', error : true);
    } else if (e.code == 'email-already-in-use') {
      ///showSnackBar(context : context , message : e.message ?? 'Error occurred!', error : true);
    } else if (e.code == 'operation-not-allowed') {
      ///showSnackBar(context : context , message : e.message ?? 'Error occurred!', error : true);
    } else if (e.code == 'weak-password') {
      ///showSnackBar(context : context , message : e.message ?? 'Error occurred!', error : true);
    }
  }

  // static Future<UserCredential> signInWithGoogle() async {
  //   print('02');
  //   // Trigger the authentication flow
  //   print('03');
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //   print('04');
  //   // Obtain the auth details from the request
  //   final GoogleSignInAuthentication googleAuth =
  //       await googleUser!.authentication;
  //   print('05');
  //   // Create a new credential
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth.accessToken,
  //     idToken: googleAuth.idToken,
  //   );
  //   print('06');
  //   // Once signed in, return the UserCredential
  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }

// Future<void> updateUserData(Map<String, dynamic> data) async {
//   User? user = FirebaseAuth.instance.currentUser;
//   if (user != null) {
//     await FirebaseFirestore.instance.collection('users').doc(user.uid).update(data);
//   }
// }

// Future<Map<String, dynamic>?> getUserData() async {
//   User? user = FirebaseAuth.instance.currentUser;
//   if (user != null) {
//     DocumentSnapshot doc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
//     if (doc.exists) {
//       return doc.data() as Map<String, dynamic>;
//     }
//   }
//   return null;
// }

// Users get users {
//
//     users.fullName = sharedPrefController.fullName;
//     users.phone = sharedPrefController.phone;
//     users.password = sharedPrefController.password;
//     users.email = sharedPrefController.email;
//     return users;
// }
}

// await _firebaseAuth.verifyPhoneNumber(
//   phoneNumber: phone,
//   verificationCompleted: (PhoneAuthCredential credential) async {
//     // Sign in automatically when verification is completed
//     await _firebaseAuth.signInWithCredential(credential);
//     print('03');
//   },
//   verificationFailed: (FirebaseAuthException e) {
//     print('Phone number verification failed: ${e.message}');
//     print('04');
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Verification failed. Please try again.')),
//     );
//   },
//   codeSent: (String verificationId, int? resendToken) async {
//     SharedPrefController().saveVerificationId(verificationId: verificationId);
//       print('05');
//       print(verificationId);
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => MainAuthScreen(selectedIndex: 4),
//       ),
//     );
//   },
//   codeAutoRetrievalTimeout: (String verificationId) {
//     SharedPrefController().saveVerificationId(verificationId: verificationId);
//       print('06');
//   },
//   timeout: Duration(seconds: 60),
//
// );

// print('02');
// try {
//   print('03');
//   PhoneAuthCredential credential = PhoneAuthProvider.credential(
//     verificationId: SharedPrefController().verificationId,
//     smsCode: verificationCode.trim(),
//   );
//   print('04');
//   UserCredential userCredential = await _firebaseAuth.signInWithCredential(credential);
//   print('05');
//   return userCredential.user != null;
// } catch (e) {
//   print('07');
//   print('Failed to sign in: $e');
//   return false;
// }
