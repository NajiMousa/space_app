// import 'package:difaf_al_wafa_app/helpers/helper.dart';
// import 'package:difaf_al_wafa_app/screens/widgets/app_text_field_widget.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:flutter_gen/gen_l10n/app_localization.dart';
//
// import '../../controllers/firebase_controllers/fb_auth_controller.dart';
//
// class OtpCodeScreen extends StatefulWidget {
//   OtpCodeScreen(
//       {Key? key})
//       : super(key: key);
//
//   @override
//   State<OtpCodeScreen> createState() => _OtpCodeScreenState();
// }
//
// class _OtpCodeScreenState extends State<OtpCodeScreen> with Helper {
//   late TextEditingController _firstTextEditingController;
//   late TextEditingController _secondTextEditingController;
//   late TextEditingController _thirdTextEditingController;
//   late TextEditingController _fourthTextEditingController;
//   late TextEditingController _fifthTextEditingController;
//   late TextEditingController _sixthTextEditingController;
//   String? _firstErrorText;
//   String? _secondErrorText;
//   String? _thirdErrorText;
//   String? _fourthErrorText;
//   String? _fifthErrorText;
//   String? _sixthErrorText;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _firstTextEditingController = TextEditingController();
//     _secondTextEditingController = TextEditingController();
//     _thirdTextEditingController = TextEditingController();
//     _fourthTextEditingController = TextEditingController();
//     _fifthTextEditingController = TextEditingController();
//     _sixthTextEditingController = TextEditingController();
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     _firstTextEditingController.dispose();
//     _secondTextEditingController.dispose();
//     _thirdTextEditingController.dispose();
//     _fourthTextEditingController.dispose();
//     _fifthTextEditingController.dispose();
//     _sixthTextEditingController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         SizedBox(height: 24.h),
//         Padding(
//           padding: EdgeInsets.only(right: 22.w, left: 32.w, bottom: 22.h),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Expanded(
//                 child: AppTextFieldWidget(
//                   textEditingController: _firstTextEditingController,
//                   hintText: '0',
//                   errorText: _firstErrorText,
//                   obsecure: false,
//                 ),
//               ),
//               // Container(
//               //     margin: EdgeInsets.symmetric(horizontal: 5.w),
//               //     width: 46.w,
//               //     height: 46.h,
//               //     child:
//               //     // TextField(
//               //     //   decoration: InputDecoration(
//               //     //     filled: true,
//               //     //     fillColor: Colors.white,
//               //     //     labelText: '0',
//               //     //     contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
//               //     //     // hintText: '0',
//               //     //     labelStyle: TextStyle(
//               //     //       fontFamily: 'BreeSerif',
//               //     //       fontSize: 12.sp,
//               //     //       color: HexColor('#2A2927'),
//               //     //     ),
//               //     //     border: OutlineInputBorder(
//               //     //       borderRadius: BorderRadius.circular(15.sp),
//               //     //       borderSide: BorderSide(
//               //     //           color: HexColor('#333333')
//               //     //       ),
//               //     //     ),
//               //     //   ),
//               //     // ),
//               //     ),
//               Expanded(
//                 child: AppTextFieldWidget(
//                   textEditingController: _secondTextEditingController,
//                   hintText: '0',
//                   errorText: _secondErrorText,
//                   obsecure: false,
//                 ),
//               ),
//               // Container(
//               //     margin: EdgeInsets.symmetric(horizontal: 5.w),
//               //     width: 46.w,
//               //     height: 46.h,
//               //     child:
//               //     // TextField(
//               //     //   decoration: InputDecoration(
//               //     //     filled: true,
//               //     //     fillColor: Colors.white,
//               //     //     labelText: '0',
//               //     //     contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
//               //     //     labelStyle: TextStyle(
//               //     //       fontFamily: 'BreeSerif',
//               //     //       fontSize: 12.sp,
//               //     //       color: HexColor('#2A2927'),
//               //     //     ),
//               //     //     border: OutlineInputBorder(
//               //     //       borderRadius: BorderRadius.circular(15.sp),
//               //     //       borderSide: BorderSide(
//               //     //           color: HexColor('#333333')
//               //     //       ),
//               //     //     ),
//               //     //   ),
//               //     // ),
//               //     ),
//               // Container(
//               //     margin: EdgeInsets.symmetric(horizontal: 5.w),
//               //     width: 46.w,
//               //     height: 46.h,
//               //     child:
//               //     // TextField(
//               //     //   decoration: InputDecoration(
//               //     //     filled: true,
//               //     //     fillColor: Colors.white,
//               //     //     labelText: '0',
//               //     //     contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
//               //     //     labelStyle: TextStyle(
//               //     //       fontFamily: 'BreeSerif',
//               //     //       fontSize: 12.sp,
//               //     //       color: HexColor('#2A2927'),
//               //     //     ),
//               //     //     border: OutlineInputBorder(
//               //     //       borderRadius: BorderRadius.circular(15.sp),
//               //     //       borderSide: BorderSide(
//               //     //           color: HexColor('#333333')
//               //     //       ),
//               //     //     ),
//               //     //   ),
//               //     // ),
//               //     ),
//               Expanded(
//                 child: AppTextFieldWidget(
//                   textEditingController: _thirdTextEditingController,
//                   hintText: '0',
//                   errorText: _thirdErrorText,
//                   obsecure: false,
//                 ),
//               ),
//               // Container(
//               //     margin: EdgeInsets.symmetric(horizontal: 5.w),
//               //     width: 46.w,
//               //     height: 46.h,
//               //     child:
//               //     // TextField(
//               //     //   decoration: InputDecoration(
//               //     //     filled: true,
//               //     //     fillColor: Colors.white,
//               //     //     labelText: '0',
//               //     //     contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
//               //     //     labelStyle: TextStyle(
//               //     //       fontFamily: 'BreeSerif',
//               //     //       fontSize: 12.sp,
//               //     //       color: HexColor('#2A2927'),
//               //     //     ),
//               //     //     border: OutlineInputBorder(
//               //     //       borderRadius: BorderRadius.circular(15.sp),
//               //     //       borderSide: BorderSide(
//               //     //           color: HexColor('#333333')
//               //     //       ),
//               //     //     ),
//               //     //   ),
//               //     // ),
//               //     ),
//               Expanded(
//                 child: AppTextFieldWidget(
//                   textEditingController: _fourthTextEditingController,
//                   hintText: '0',
//                   errorText: _fourthErrorText,
//                   obsecure: false,
//                 ),
//               ),
//               // Container(
//               //     margin: EdgeInsets.symmetric(horizontal: 5.w),
//               //     width: 46.w,
//               //     height: 46.h,
//               //     child:
//               //     // TextField(
//               //     //   decoration: InputDecoration(
//               //     //     filled: true,
//               //     //     fillColor: Colors.white,
//               //     //     labelText: '0',
//               //     //     contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
//               //     //     labelStyle: TextStyle(
//               //     //       fontFamily: 'BreeSerif',
//               //     //       fontSize: 12.sp,
//               //     //       color: HexColor('#2A2927'),
//               //     //     ),
//               //     //     border: OutlineInputBorder(
//               //     //       borderRadius: BorderRadius.circular(15.sp),
//               //     //       borderSide: BorderSide(
//               //     //           color: HexColor('#333333')
//               //     //       ),
//               //     //     ),
//               //     //   ),
//               //     // ),
//               //     ),
//               Expanded(
//                 child: AppTextFieldWidget(
//                   textEditingController: _fifthTextEditingController,
//                   hintText: '0',
//                   errorText: _fifthErrorText,
//                   obsecure: false,
//                 ),
//               ),
//               Expanded(
//                 child: AppTextFieldWidget(
//                   textEditingController: _sixthTextEditingController,
//                   hintText: '0',
//                   errorText: _sixthErrorText,
//                   obsecure: false,
//                 ),
//               )
//               // Container(
//               //     margin: EdgeInsets.symmetric(horizontal: 5.w),
//               //     width: 46.w,
//               //     height: 46.h,
//               //     child:
//               //     // TextField(
//               //     //   decoration: InputDecoration(
//               //     //     filled: true,
//               //     //     fillColor: Colors.white,
//               //     //     labelText: '0',
//               //     //     contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
//               //     //     labelStyle: TextStyle(
//               //     //       fontFamily: 'BreeSerif',
//               //     //       fontSize: 12.sp,
//               //     //       color: HexColor('#2A2927'),
//               //     //     ),
//               //     //     border: OutlineInputBorder(
//               //     //       borderRadius: BorderRadius.circular(15.sp),
//               //     //       borderSide: BorderSide(
//               //     //           color: HexColor('#333333')
//               //     //       ),
//               //     //     ),
//               //     //   ),
//               //     // ),
//               //     )
//             ],
//           ),
//         ),
//
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 30.w),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 AppLocalizations.of(context)!
//                     .otpCodeHadBeenSentToYourPhoneNumber,
//                 style: TextStyle(
//                   color: HexColor('#333333'),
//                   fontSize: 16.sp,
//                   fontFamily: 'BreeSerif',
//                 ),
//               ),
//               Text(
//                 '0724**** ',
//                 style: TextStyle(
//                   color: HexColor('#6699CC'),
//                   fontSize: 16.sp,
//                   fontFamily: 'BreeSerif',
//                 ),
//               ),
//             ],
//           ),
//         ),
//         // Padding(
//         //   padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 24.h),
//         //   child: Row(
//         //     children: [
//         //       Text(
//         //         AppLocalizations.of(context)!.havenTReceivedTheCode,
//         //         style: TextStyle(
//         //           color: HexColor('#333333'),
//         //           fontSize: 14.sp,
//         //           fontFamily: 'BreeSerif',
//         //         ),
//         //       ),
//         //       SizedBox(width: 10.w,),
//         //       Text(
//         //         'Resent ( 59 secs )',
//         //         style: TextStyle(
//         //           color: HexColor('#6699CC'),
//         //           fontSize: 14.sp,
//         //           fontFamily: 'BreeSerif',
//         //         ),
//         //       ),
//         //     ],
//         //   ),
//         // ),
//         SizedBox(
//           height: 24.h,
//         ),
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
//           child: ElevatedButton(
//             onPressed: () {
//               regicter();
//             },
//             style: ElevatedButton.styleFrom(
//               // padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
//               minimumSize: Size(double.infinity, 56.h),
//               backgroundColor: HexColor('#333333'),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(30.sp),
//               ),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   AppLocalizations.of(context)!.save,
//                   style: TextStyle(
//                     color: HexColor('#FFFFFF'),
//                     fontSize: 16.sp,
//                     fontFamily: 'BreeSerif',
//                   ),
//                 ),
//                 SizedBox(width: 18.w),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   void performRegicter() {
//     if (checkData()) {
//     //   _registerVerificationCode(
//     //     _firstTextEditingController.text +
//     //       _secondTextEditingController.text +
//     //       _thirdTextEditingController.text +
//     //       _fourthTextEditingController.text +
//     //       _fifthTextEditingController.text +
//     //       _sixthTextEditingController.text);
//       regicter();
//     }
//
//   }
//
//   bool checkData() {
//     if (_firstTextEditingController.text.isNotEmpty &&
//         _secondTextEditingController.text.isNotEmpty &&
//         _thirdTextEditingController.text.isNotEmpty &&
//         _fourthTextEditingController.text.isNotEmpty &&
//         _fifthTextEditingController.text.isNotEmpty &&
//         _sixthTextEditingController.text.isNotEmpty) {
//       checkErrors();
//       return true;
//     }
//     checkErrors();
//     showSmackBar(message: 'Enter require Field', context: context);
//     return false;
//   }
//
//   void checkErrors() {
//     setState(() {
//       _firstErrorText = _firstTextEditingController.text.isEmpty
//           ? 'Enter first Number'
//           : null;
//       _secondErrorText = _secondTextEditingController.text.isEmpty
//           ? 'Enter second Number'
//           : null;
//       _thirdErrorText = _thirdTextEditingController.text.isEmpty
//           ? 'Enter third Number'
//           : null;
//       _fourthErrorText = _fourthTextEditingController.text.isEmpty
//           ? 'Enter fourth Number'
//           : null;
//       _fifthErrorText = _fifthTextEditingController.text.isEmpty
//           ? 'Enter fifth Number'
//           : null;
//       _sixthErrorText = _sixthTextEditingController.text.isEmpty
//           ? 'Enter sixth Number'
//           : null;
//     });
//   }
//
//   Future<void> regicter() async {
//
//     bool status = await FbAuthController().registerWithVerificationCode(
//         context: context,
//         verificationCode: _firstTextEditingController.text +
//             _secondTextEditingController.text +
//             _thirdTextEditingController.text +
//             _fourthTextEditingController.text +
//             _fifthTextEditingController.text +
//             _sixthTextEditingController.text
//     );
//     print(_firstTextEditingController.text +
//         _secondTextEditingController.text +
//         _thirdTextEditingController.text +
//         _fourthTextEditingController.text +
//         _fifthTextEditingController.text +
//         _sixthTextEditingController.text);
//     if (status) {
//       print('DDDDDDD');
//       Navigator.pushReplacementNamed(context, '/main_screen');
//     }
//   }
// }

import 'package:difaf_al_wafa_app/helpers/helper.dart';
import 'package:difaf_al_wafa_app/prefs/shared_pref_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../controllers/firebase_controllers/fb_auth_controller.dart';
import '../primary_screens/main_screen.dart';

class OtpCodeScreen extends StatefulWidget {
  OtpCodeScreen({super.key});

  @override
  State<OtpCodeScreen> createState() => _OtpCodeScreenState();
}

class _OtpCodeScreenState extends State<OtpCodeScreen> with Helper {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  bool loading = false;
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());

  // String? _verificationId;
  String? _verificationCode;

  // bool _autoVerification = false;

  @override
  void initState() {
    super.initState();
    // _verifyPhoneNumber();
  }

  // void _verifyPhoneNumber() async {
  //   await _auth.verifyPhoneNumber(
  //     phoneNumber: '+972595192140', // Replace with the phone number you want to verify
  //     verificationCompleted: (PhoneAuthCredential credential) async {
  //       // Auto-retrieval or instant verification code
  //       await _auth.signInWithCredential(credential);
  //
  //         setState(() {
  //           _autoVerification = true;
  //         });
  //     },
  //     verificationFailed: (FirebaseAuthException e) {
  //       if (e.code == 'invalid-phone-number') {
  //         print('The provided phone number is not valid.');
  //       }
  //       // Handle other errors
  //     },
  //     codeSent: (String verificationId, int? resendToken) {
  //
  //         setState(() {
  //           _verificationId = verificationId;
  //         });
  //
  //     },
  //     codeAutoRetrievalTimeout: (String verificationId) {
  //
  //         setState(() {
  //           _verificationId = verificationId;
  //         });
  //
  //     },
  //   );
  // }

  // void _onCodeChanged(String code) {
  //   if (code.length == 6 && _verificationId != null) {
  //     _verificationCode == code;
  //     _verifyCode(code);
  //   }
  // }
  //
  // void _verifyCode(String code) async {
  //   final PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //     verificationId: _verificationId!,
  //     smsCode: code,
  //   );
  //
  //   await _auth.signInWithCredential(credential);
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          // shrinkWrap: true,
          // physics: NeverScrollableScrollPhysics(),
          children: [
            Text('Enter the code sent to your phone'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(6, (index) {
                return Container(
                  margin: EdgeInsets.all(4.0),
                  width: 40,
                  height: 40,
                  child: TextField(
                    controller: _controllers[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: _controllers[index].text.isEmpty
                              ? Colors.red
                              : Colors.blue,
                          width: 2.0,
                        ),
                      ),
                      counterText: '',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        if (index < 5) {
                          FocusScope.of(context).nextFocus();
                        } else {
                          String code = _controllers.map((e) => e.text).join();
                          _verificationCode = code;
                          print(code);
                        }
                      } else {
                        FocusScope.of(context).previousFocus();
                      }
                    },
                  ),
                );
              }, growable: false),
            ),
            // if (_autoVerification)
            //   Text('Auto verification completed'),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!
                        .otpCodeHadBeenSentToYourPhoneNumber,
                    style: TextStyle(
                      color: HexColor('#333333'),
                      fontSize: 16.sp,
                      fontFamily: 'BreeSerif',
                    ),
                  ),
                  Text(
                    '0724**** ',
                    style: TextStyle(
                      color: HexColor('#6699CC'),
                      fontSize: 16.sp,
                      fontFamily: 'BreeSerif',
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 24.h),
              child: Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.havenTReceivedTheCode,
                    style: TextStyle(
                      color: HexColor('#333333'),
                      fontSize: 14.sp,
                      fontFamily: 'BreeSerif',
                    ),
                  ),
                  SizedBox(width: 10.w,),

                ],
              ),

            ),
            Text(
              'Resent ( 59 secs )',
              style: TextStyle(
                color: HexColor('#6699CC'),
                fontSize: 14.sp,
                fontFamily: 'BreeSerif',
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
              child: ElevatedButton(
                onPressed: () async {
                  print('010');
                  performCheckCode();
                  // print('01');
                  // bool isSuccess = await FbAuthController()
                  //     .checkVerificationCodeWithPhoneRegister(
                  //         context: context, verificationCode: _verificationCode!);
                  // if (isSuccess) {
                  //   print('08');
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     SnackBar(content: Text('Registration successful!')),
                  //   );
                  //   print('09');
                  //   Navigator.of(context).pushReplacement(
                  //     MaterialPageRoute(
                  //         builder: (context) => MainScreen(selectedIndex: 0)),
                  //   );
                  // } else {
                  //   print('10');
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     SnackBar(
                  //         content: Text('Registration failed. Please try again.')),
                  //   );
                  // }
                },
                style: ElevatedButton.styleFrom(
                  // padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
                  minimumSize: Size(double.infinity, 56.h),
                  backgroundColor: HexColor('#333333'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.sp),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.save,
                      style: TextStyle(
                        color: HexColor('#FFFFFF'),
                        fontSize: 16.sp,
                        fontFamily: 'BreeSerif',
                      ),
                    ),
                    SizedBox(width: 18.w),
                  ],
                ),
              ),
            ),
          ],
        ),
        loading
            ? Center(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.sp)),
                    color: Colors.black.withOpacity(0.5),
                  ),
                  padding:
                  EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
                  width: 70.w,
                  height: 70.h,
                  child: CircularProgressIndicator(),
                ),
              ],
            ))
            : SizedBox(),

      ],
    );
  }

  void performCheckCode() async {
    // if (checkData()) {
    print('01');
    await checkCode();
    // }
  }

  bool checkData() {
    print(_controllers.length);
    if (_controllers.length < 6) {
      print('02');
      // checkErrors();
      return true;
    }
    // checkErrors();
    showSmackBar(message: 'Enter require Field', context: context);
    return false;
  }

  void checkErrors() {
    print('03');
    setState(() {
      _controllers.length == 6 ? 'check your code again' : null;
    });
  }

  Future<void> checkCode() async {
    setState(() {
      loading = true;
    });
    bool status = await FbAuthController()
        .checkVerificationCodeWithPhoneRegister(
            context: context, verificationCode: _verificationCode!);
    if (status) {
      print(SharedPrefController().firstTime);
      print(SharedPrefController().singUp);
      SharedPrefController().firstTime == false && SharedPrefController().singUp ? Navigator.pushReplacementNamed(context, '/edit_user_profile_page_screen'):
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return MainScreen(selectedIndex: 0);
        },
      ));
    }
  }
  // Users get users {                                                      // عشان نرجع قيمة النوت
  //   // Users users =  widget.note == null ? Note() : widget.note!;
  //   users.firstName = _titleTextController.text;
  //   note.details = _detalisTextController.text;
  //   return note;
  // }
}
