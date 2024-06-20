import 'package:difaf_al_wafa_app/screens/primary_screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

import '../widgets/app_text_field_widget.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {

  late TextEditingController _oldPasswordTextEditingController;
  late TextEditingController _newPasswordTextEditingController;
  late TextEditingController _confimNewPasswordTextEditingController;
  String? _emailErrorText;
  String? _passwordErrorText;

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
          errorText: _emailErrorText,
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
          errorText: _emailErrorText,
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
          errorText: _emailErrorText,
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 32.h),
          child: ElevatedButton(
            onPressed: () {
              // Navigator.pushReplacementNamed(context, '/main_screen');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return MainScreen(selectedIndex: 0,);
                  },
                ),
              );
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
}
