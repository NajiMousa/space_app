import 'package:country_code_picker/country_code_picker.dart';
import 'package:difaf_al_wafa_app/prefs/shared_pref_controller.dart';
import 'package:difaf_al_wafa_app/screens/auth_screens/main_auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../controllers/firebase_controllers/fb_auth_controller.dart';
import '../../controllers/firebase_controllers/fb_firestore_controller.dart';
import '../../helpers/helper.dart';
import '../../models/user_models/users_registeration_model.dart';
import '../widgets/app_widgets/app_text_field_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

import 'otp_code_screen.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({Key? key}) : super(key: key);

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> with Helper {
  late String countryCodeG;
  bool loading = false;
  SharedPrefController sharedPrefController = SharedPrefController();
  late TextEditingController _phoneTextEditingController;
  late TextEditingController _emailTextEditingController;
  late TextEditingController _passwordTextEditingController;
  late TextEditingController _confimPasswordTextEditingController;
  String? _phoneErrorText;
  String? _emailErrorText;
  String? _passwordErrorText;
  bool useEmail = false;
  bool showPassword = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _phoneTextEditingController = TextEditingController();
    _emailTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();
    _confimPasswordTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _phoneTextEditingController.dispose();
    _emailTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    _confimPasswordTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
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
        ListView(
          // padding: EdgeInsets.symmetric(horizontal: 24.w),
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 24.w),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Expanded(
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Padding(
            //               padding: EdgeInsets.symmetric(
            //                 vertical: 6.h,
            //               ),
            //               child: Text(
            //                 'First Name',
            //                 style: TextStyle(
            //                     fontSize: 12.sp,
            //                     color: HexColor('#333333'),
            //                     fontFamily: 'BreeSerif'),
            //               ),
            //             ),
            //             AppTextFieldWidget(
            //               textEditingController:
            //                   _firstNameTextEditingController,
            //               prefixIcon: Icons.person,
            //               hintText: 'naji',
            //               obsecure: false,
            //               textInputType: TextInputType.emailAddress,
            //               errorText: _firstNameErrorText,
            //               half: true,
            //             ),
            //           ],
            //         ),
            //       ),
            //       SizedBox(width: 12.w),
            //       Expanded(
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Padding(
            //               padding: EdgeInsets.symmetric(vertical: 6.h),
            //               child: Text(
            //                 'Last Name',
            //                 style: TextStyle(
            //                     fontSize: 12.sp,
            //                     color: HexColor('#333333'),
            //                     fontFamily: 'BreeSerif'),
            //               ),
            //             ),
            //             AppTextFieldWidget(
            //               textEditingController: _lastNameTextEditingController,
            //               prefixIcon: Icons.person,
            //               hintText: 'mousa',
            //               obsecure: false,
            //               textInputType: TextInputType.emailAddress,
            //               errorText: _lastNameErrorText,
            //               half: true,
            //             ),
            //           ],
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            useEmail
                ? Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 6.h, horizontal: 24.w),
                    child: Text(
                      AppLocalizations.of(context)!.email,
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: HexColor('#333333'),
                          fontFamily: 'BreeSerif'),
                    ),
                  )
                : Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 6.h, horizontal: 24.w),
                    child: Text(
                      AppLocalizations.of(context)!.phone,
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: HexColor('#333333'),
                          fontFamily: 'BreeSerif'),
                    ),
                  ),
            useEmail
                ? AppTextFieldWidget(
                    textEditingController: _emailTextEditingController,
                    prefixIcon: Icons.email,
                    hintText: 'naji@gmail.com',
                    obsecure: false,
                    textInputType: TextInputType.emailAddress,
                    errorText: _emailErrorText,
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Row(
                      children: [
                        Container(
                          height: 52.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            border: Border.all(
                              color: HexColor('#333333'),
                            ),
                          ),
                          child: CountryCodePicker(
                            onChanged: _onCountryChange,
                            textStyle: TextStyle(
                              color: HexColor('#333333'),
                              fontSize: 14.sp,
                            ),
                            searchDecoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: HexColor('#3333333'),
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            controller: _phoneTextEditingController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.call,
                                color: HexColor('#333333'),
                              ),
                              label: Text(
                                '591 255 233',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: HexColor('#333333'),
                                ),
                              ),
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: HexColor('#333333'),
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: HexColor('#333333'),
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
            useEmail
                ? InkWell(
                    onTap: () {
                      setState(() {
                        useEmail = false;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 24.w, right: 24.w , top: 10.h),
                      child: Align(
                        child: Text(
                          'I want use Phone Number',
                          style: TextStyle(
                            color: HexColor('#559FEA'),
                            fontSize: 11.sp,
                            fontFamily: 'BreeSerif',
                          ),
                        ),
                      ),
                    ),
                  )
                : InkWell(
                    onTap: () {
                      setState(() {
                        useEmail = true;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 24.w, right: 24.w , top: 10.h),
                      child: Text(
                        'I want use Email ',
                        style: TextStyle(
                          color: HexColor('#559FEA'),
                          fontSize: 11.sp,
                          fontFamily: 'BreeSerif',
                        ),
                      ),
                    ),
                  ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 24.w),
              child: Text(
                AppLocalizations.of(context)!.password,
                style: TextStyle(
                    fontSize: 12.sp,
                    color: HexColor('#333333'),
                    fontFamily: 'BreeSerif'),
              ),
            ),
            AppTextFieldWidget(
              textEditingController: _passwordTextEditingController,
              prefixIcon: Icons.lock,
              hintText: '**** **** *****',
              obsecure: true,
              textInputType: TextInputType.emailAddress,
              errorText: _passwordErrorText,
              suffixIcon: Icon(Icons.hide_source),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 24.w),
              child: Text(
                AppLocalizations.of(context)!.confirmPassword,
                style: TextStyle(
                    fontSize: 12.sp,
                    color: HexColor('#333333'),
                    fontFamily: 'BreeSerif'),
              ),
            ),
            AppTextFieldWidget(
              textEditingController: _confimPasswordTextEditingController,
              prefixIcon: Icons.lock,
              hintText: '**** **** *****',
              obsecure: true,
              textInputType: TextInputType.emailAddress,
              errorText: _passwordErrorText,
              suffixIcon: Icon(Icons.hide_source),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                  ),
                  Text(
                    AppLocalizations.of(context)!.agreeCondition,
                    style: TextStyle(
                      color: HexColor('#333333'),
                      fontSize: 11.sp,
                      fontFamily: 'BreeSerif',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 15.h),
              child: ElevatedButton(
                onPressed: () async {
                  print('object');
                  print(useEmail);
                  useEmail
                      ? performSignUpWithEmail()
                      : performSignUpWithPhone();
                  // print('01');
                  // await FbAuthController().createAccountByPhoneNumber(
                  //   context: context,
                  //   phone: _phoneTextEditingController.text,
                  //   password: _passwordTextEditingController.text,
                  // );
                },
                style: ElevatedButton.styleFrom(
                  // padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
                  minimumSize: Size(double.infinity, 56.h),
                  backgroundColor: HexColor('#333333'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.sp),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.signUp,
                        style: TextStyle(
                          color: HexColor('#FFFFFF'),
                          fontSize: 16.sp,
                          fontFamily: 'BreeSerif',
                        ),
                      ),
                      Spacer(),
                      SvgPicture.asset(
                        sharedPrefController.language == 'en'
                            ? 'images/arrowForword.svg'
                            : 'images/arrow_back.svg',
                        width: 9.w,
                        height: 15.h,
                        color: HexColor('#FFFFFF'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Divider(thickness: 5, indent: 30.w, endIndent: 30.w),
                Text(
                  AppLocalizations.of(context)!.or,
                  style: TextStyle(
                    color: HexColor('#559FEA'),
                    fontSize: 11.sp,
                    fontFamily: 'BreeSerif',
                  ),
                ),
                Divider(thickness: 2, indent: 30.w, endIndent: 30.w),
              ],
            ),
            SizedBox(height: 18.h),
            Padding(
              padding: EdgeInsets.only(right: 100.w, left: 100.w, bottom: 30.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () async {
                      try {
                        print('01');
                        // await FbAuthController.signInWithGoogle();
                        print('07');
                        print('Signed in with Google');
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: SvgPicture.asset(
                      'images/google_g_icon.svg',
                      width: 24.w,
                      height: 24.h,
                      color: HexColor('#333333'),
                    ),
                  ),
                  InkWell(
                    child: SvgPicture.asset(
                      'images/twitter_bird_icon.svg',
                      width: 24.w,
                      height: 24.h,
                      color: HexColor('#333333'),
                    ),
                  ),
                  InkWell(
                    child: SvgPicture.asset(
                      'images/facebook_logo_icon.svg',
                      width: 24.w,
                      height: 24.h,
                      color: HexColor('#333333'),
                    ),
                  ),
                ],
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

// Solid - Single Responsibility

  void performSignUpWithPhone() async {
    if (checkData()) {
      await signUpWithPhone();
    }
  }

  void performSignUpWithEmail() async {
    if (checkData()) {
      await signUpWithEmail();
    }
  }

  bool checkData() {
    if ((_emailTextEditingController.text.isNotEmpty ||
        _phoneTextEditingController.text.isNotEmpty) &&
            _passwordTextEditingController.text.isNotEmpty &&
            _confimPasswordTextEditingController.text.isNotEmpty ) {
      checkErrors();
      return true;
    }
    checkErrors();
    showSmackBar(message: 'Enter require Field', context: context);
    return false;
  }

  void checkErrors() {
    setState(() {
      _phoneErrorText = _phoneTextEditingController.text.isEmpty
          ? 'Enter Phone Number'
          : null;
      _emailErrorText = _emailTextEditingController.text.isEmpty
          ? 'Enter Email Address'
          : null;
      _passwordErrorText =
          _passwordTextEditingController.text.isEmpty ? 'Enter Password' : null;
    });
  }

  Future<void> signUpWithPhone() async {
    print('01');
    if (_passwordTextEditingController.text !=
        _confimPasswordTextEditingController.text) {
      throw 'Passwords do not match';
    }
    print('02');
    try {
      List<UsersRegisterationModel> userList =
      await FbFireStoreController().getUser();
      print('03');
      for (int i = 0; i < userList.length; i++) {
        if (countryCodeG.toString() + _phoneTextEditingController.text == userList[i].phone) {
          setState(() {
            showSmackBar(
                context: context,
                message: 'You have account go to Login page',
                error: true);
          });
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
            return MainAuthScreen(selectedIndex: 1);
          },));
        }
      }
      setState(() {
        loading = true;
      });
      bool status = await FbAuthController().createAndLoginPhoneNumber(
        context: context,
        phone: countryCodeG.toString() + _phoneTextEditingController.text,
        password: _passwordTextEditingController.text,
      );
      print('registerRegister');
      if (status) {
        print('DDDDDDD');
        sharedPrefController.savePassword(
            password: _passwordTextEditingController.text);
        sharedPrefController.savePhone(
            phone: countryCodeG.toString() + _phoneTextEditingController.text);
        sharedPrefController.checkIsSingUpScreen(singUp: true);
        // Navigator.push(context, route)
      }
    } catch (e) {
    }
  }

  Future<void> signUpWithEmail() async {
    if (_passwordTextEditingController.text !=
        _confimPasswordTextEditingController.text) {
      throw 'Passwords do not match';
    }
    try {
      List<UsersRegisterationModel> userList =
      await FbFireStoreController().getUser();
      for (int i = 0; i < userList.length; i++) {
        if (_emailTextEditingController == userList[i].email) {
          setState(() {
            showSmackBar(
                context: context,
                message: 'You have account go to Login page',
                error: true);
          });
        } else {
        }
      }
      setState(() {
        loading = true;
      });
      bool status = await FbAuthController().createAccountByEmail(
        context: context,
        email: _emailTextEditingController.text,
        password: _passwordTextEditingController.text,
      );
      print('registerRegister');
      if (status) {
        print('DDDDDDD');
        sharedPrefController.savePassword(
            password: _passwordTextEditingController.text);
        sharedPrefController.saveEmail(email: _emailTextEditingController.text);
        sharedPrefController.checkIsSingUpScreen(singUp: true);
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return MainAuthScreen(selectedIndex: 1);
          },
        ));
      }
    } catch (e) {
    }
  }

  void _onCountryChange(CountryCode countryCode) {
    setState(() {
      countryCodeG = countryCode.toString();
    });
    print("New country selected: " + countryCode.toString());
  }
}
