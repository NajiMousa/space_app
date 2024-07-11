import 'package:country_code_picker/country_code_picker.dart';
import 'package:difaf_al_wafa_app/helpers/helper.dart';
import 'package:difaf_al_wafa_app/prefs/shared_pref_controller.dart';
import 'package:difaf_al_wafa_app/screens/widgets/app_widgets/app_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import '../../controllers/firebase_controllers/fb_auth_controller.dart';
import '../../controllers/firebase_controllers/fb_firestore_controller.dart';
import '../../models/user_models/users_registeration_model.dart';
import 'main_auth_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Helper {
  SharedPrefController sharedPrefController = SharedPrefController();
  String _message = "";
  bool loading = false;
  late String countryCodeG;
  late TextEditingController _phoneTextEditingController;
  late TextEditingController _emailTextEditingController;
  late TextEditingController _passwordTextEditingController;
  String? _emailErrorText;
  String? _passwordErrorText;
  String? _phoneErrorText;
  bool useEmail = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();
    _phoneTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    _phoneTextEditingController.dispose();
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
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                                '123 456 789',
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
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
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
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
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
            SizedBox(height: 6.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Text(
                AppLocalizations.of(context)!.didYouForgetYourPassword,
                style: TextStyle(
                  color: HexColor('#559FEA'),
                  fontSize: 11.sp,
                  fontFamily: 'BreeSerif',
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
              child: ElevatedButton(
                onPressed: () {
                  performLogInWithPhone();
                },
                style: ElevatedButton.styleFrom(
                  // padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
                  minimumSize: Size(double.infinity, 56.h),
                  backgroundColor: HexColor('#333333'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.sp),
                  ),
                ),
                child: Text(
                  AppLocalizations.of(context)!.logIn,
                  style: TextStyle(
                    color: HexColor('#FFFFFF'),
                    fontSize: 16.sp,
                    fontFamily: 'BreeSerif',
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
      ],
    );
  }

  void _onCountryChange(CountryCode countryCode) {
    setState(() {
      countryCodeG = countryCode.toString();
    });
    print("New country selected: " + countryCode.toString());
  }

// Solid - Single Responsibility

  void performLogInWithPhone() async {
    if (checkData()) {
      await LoginWithPhone();
    }
  }

  void performSignUpWithEmail() async {
    if (checkData()) {
      await signUpWithEmail();
    }
  }

  bool checkData() {
    if (_emailTextEditingController.text.isNotEmpty ||
        _phoneTextEditingController.text.isNotEmpty &&
            _passwordTextEditingController.text.isNotEmpty) {
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

  Future<void> LoginWithPhone() async {
    _checkPassword();
  }

  Future<void> _checkPassword() async {
    try {
      List<UsersRegisterationModel> userList =
          await FbFireStoreController().getUser();
      for (int i = 0; i < userList.length; i++) {
        if (countryCodeG.toString() + _phoneTextEditingController.text ==
            userList[i].phone) {
          if (_passwordTextEditingController.text == userList[i].password) {
            print(loading);
            setState(() {
              loading = true;
            });
            print(loading);
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
                  phone: countryCodeG.toString() +_phoneTextEditingController.text);
              // Navigator.push(context, route)
            }
          } else {
            setState(() {
              showSmackBar(
                  context: context,
                  message: 'Password is incorrect.',
                  error: true);
              _message = "Password is incorrect.";
            });
          }
        } else {
          setState(() {
            showSmackBar(
                context: context,
                message: 'User with this phone number does not exist.',
                error: true);
            _message = "";
          });
        }
      }
    } catch (e) {
      // Handle errors (Firestore query failure, etc.)
      setState(() {
        _message = "Error: ${e.toString()}";
      });
    }
  }

  Future<void> signUpWithEmail() async {
    try {
      List<UsersRegisterationModel> userList =
          await FbFireStoreController().getUser();
      for (int i = 0; i < userList.length; i++) {
        if (_emailTextEditingController == userList[i].email) {
          if (_passwordTextEditingController.text == userList[i].password) {
            print(loading);
            setState(() {
              loading = true;
            });
            print(loading);
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
              sharedPrefController.saveEmail(
                  email: _emailTextEditingController.text);
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) {
                  return MainAuthScreen(selectedIndex: 1);
                },
              ));
            }
          } else {
            setState(() {
              showSmackBar(
                  context: context,
                  message: 'Password is incorrect.',
                  error: true);
              _message = "Password is incorrect.";
            });
          }
        } else {
          setState(() {
            showSmackBar(
                context: context,
                message: 'User with this phone number does not exist.',
                error: true);
            _message = "";
          });
        }
      }
    } catch (e) {
      // Handle errors (Firestore query failure, etc.)
      setState(() {
        _message = "Error: ${e.toString()}";
      });
    }
  }
}

