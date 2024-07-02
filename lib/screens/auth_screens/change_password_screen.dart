import 'package:difaf_al_wafa_app/helpers/helper.dart';
import 'package:difaf_al_wafa_app/prefs/shared_pref_controller.dart';
import 'package:difaf_al_wafa_app/screens/primary_screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import '../../controllers/firebase_controllers/fb_auth_controller.dart';
import '../../controllers/firebase_controllers/fb_firestore_controller.dart';
import '../../models/user_models/users_registeration_model.dart';
import '../widgets/app_text_field_widget.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> with Helper{

  late TextEditingController _oldPasswordTextEditingController;
  late TextEditingController _newPasswordTextEditingController;
  late TextEditingController _confimNewPasswordTextEditingController;
  String? _oldPasswordErrorText;
  String? _newPasswordErrorText;
  String? _ConfimNewpasswordErrorText;
  SharedPrefController sharedPrefController = SharedPrefController();
  UsersRegisterationModel? userRegisterationModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _oldPasswordTextEditingController = TextEditingController();
    _newPasswordTextEditingController = TextEditingController();
    _confimNewPasswordTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _oldPasswordTextEditingController.dispose();
    _newPasswordTextEditingController.dispose();
    _confimNewPasswordTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: 6.h,horizontal: 24.w),
          child: Text(
            AppLocalizations.of(context)!.oldPassword,
            style: TextStyle(
                fontSize: 12.sp,
                color: HexColor('#333333'),
                fontFamily: 'BreeSerif'),
          ),
        ),

        AppTextFieldWidget(
          textEditingController: _oldPasswordTextEditingController,
          prefixIcon: Icons.lock,
          hintText: '**** **** ****',
          obsecure: true,
          textInputType: TextInputType.emailAddress,
          errorText: _oldPasswordErrorText,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: 6.h,horizontal: 24.w),
          child: Text(
            AppLocalizations.of(context)!.newPassword,
            style: TextStyle(
                fontSize: 12.sp,
                color: HexColor('#333333'),
                fontFamily: 'BreeSerif'),
          ),
        ),

        AppTextFieldWidget(
          textEditingController: _newPasswordTextEditingController,
          prefixIcon: Icons.lock,
          hintText: '**** **** ****',
          obsecure: true,
          textInputType: TextInputType.emailAddress,
          errorText: _newPasswordErrorText,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: 6.h,horizontal: 24.w),
          child: Text(
            AppLocalizations.of(context)!.confirmNewPassword,
            style: TextStyle(
                fontSize: 12.sp,
                color: HexColor('#333333'),
                fontFamily: 'BreeSerif'),
          ),
        ),

        AppTextFieldWidget(
          textEditingController: _confimNewPasswordTextEditingController,
          prefixIcon: Icons.lock,
          hintText: '**** **** ****',
          obsecure: true,
          textInputType: TextInputType.emailAddress,
          errorText: _ConfimNewpasswordErrorText,
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 32.h),
          child: ElevatedButton(
            onPressed: () {
              // Navigator.pushReplacementNamed(context, '/main_screen');
              performSaveNewPassword();
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) {
              //       return MainScreen(selectedIndex: 0,);
              //     },
              //   ),
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
            child: Text(
              AppLocalizations.of(context)!.savePassword,
              style: TextStyle(
                color: HexColor('#FFFFFF'),
                fontSize: 16.sp,
                fontFamily: 'BreeSerif',
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Solid - Single Responsibility



  void performSaveNewPassword() async {
    if (checkData()) {
      await saveNewPassword();
    }
  }

  bool checkData() {
    if (_oldPasswordTextEditingController.text.isNotEmpty ||
        _newPasswordTextEditingController.text.isNotEmpty &&
            _confimNewPasswordTextEditingController.text.isNotEmpty  ) {
      checkErrors();
      return true;
    }
    checkErrors();
    showSmackBar(message: 'Enter require Field', context: context);
    return false;
  }

  void checkErrors() {
    setState(() {
      _oldPasswordErrorText = _oldPasswordTextEditingController.text.isEmpty
          ? 'Enter Phone Number'
          : null;
      _newPasswordErrorText = _newPasswordTextEditingController.text.isEmpty
          ? 'Enter Email Address'
          : null;
      _ConfimNewpasswordErrorText =
      _confimNewPasswordTextEditingController.text.isEmpty ? 'Enter Password' : null;
    });
  }

  Future<void> saveNewPassword() async {
    if (_newPasswordTextEditingController.text !=
        _confimNewPasswordTextEditingController.text) {
      showSmackBar(context: context, message: 'the New Passwords do not match');
      throw 'the New Passwords do not match';

    }
    try {
      if (sharedPrefController.phone != null) {
        print(sharedPrefController.phone);
        print('01');
        await FbFireStoreController().findPhoneUserAndUpdate(sharedPrefController.phone,_newPasswordTextEditingController.text);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return MainScreen(selectedIndex: 0);
        },));
        print('09');
      } else if (sharedPrefController.email != null) {
          /// save new password
        await FbFireStoreController().findPhoneUserAndUpdate(sharedPrefController.email,_newPasswordTextEditingController.text);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return MainScreen(selectedIndex: 0);
        },));
        FbAuthController().forgetPasswordByEmail(context: context, email: SharedPrefController().email);
      }
      else{
        showSmackBar(
            context: context,
            message: 'you do not login',
            error: true);
      }
    } catch (e) {
    }
  }

  // UsersRegisterationModel get usersRegisterationModel {
  //   // requestDataModel.id =
  //   print('001');
  //   UsersRegisterationModel usersRegisterationModel = UsersRegisterationModel();
  //   usersRegisterationModel.phone = SharedPrefController().phone;
  //   usersRegisterationModel.email = SharedPrefController().email;
  //   usersRegisterationModel.password = _newPasswordTextEditingController.text;
  //   print('002');
  //   print(usersRegisterationModel.password);
  //   print(usersRegisterationModel.phone);
  //   print(usersRegisterationModel.email);
  //   print(usersRegisterationModel);
  //   return usersRegisterationModel;
  // }
}
