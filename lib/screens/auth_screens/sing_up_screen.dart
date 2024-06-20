import 'package:difaf_al_wafa_app/prefs/shared_pref_controller.dart';
import 'package:difaf_al_wafa_app/screens/auth_screens/main_auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../widgets/app_text_field_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({Key? key}) : super(key: key);

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  SharedPrefController sharedPrefController = SharedPrefController();

  late TextEditingController _emailTextEditingController;
  late TextEditingController _passwordTextEditingController;
  late TextEditingController _confimPasswordTextEditingController;
  String? _emailErrorText;
  String? _passwordErrorText;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();
    _confimPasswordTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    _confimPasswordTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: 6.h,horizontal: 24.w),
          child: Text(
            AppLocalizations.of(context)!.email,
            style: TextStyle(
                fontSize: 12.sp,
                color: HexColor('#333333'),
                fontFamily: 'BreeSerif'),
          ),
        ),

        AppTextFieldWidget(
          textEditingController: _emailTextEditingController,
          prefixIcon: Icons.email,
          hintText: 'naji@gmail.com',
          obsecure: false,
          textInputType: TextInputType.emailAddress,
          errorText: _emailErrorText,
        ),

        Padding(
          padding: EdgeInsets.symmetric(
              vertical: 6.h,horizontal: 24.w),
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
          textInputType: TextInputType.phone,
          errorText: _passwordErrorText,
          suffixIcon: Icons.hide_source,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: 6.h,horizontal: 24.w),
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
          textInputType: TextInputType.phone,
          errorText: _passwordErrorText,
          suffixIcon: Icons.hide_source,
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
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return MainAuthScreen(selectedIndex: 4);
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
                    sharedPrefController.language == 'en' ? 'images/arrowForword.svg' : 'images/arrow_back.svg',
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
    );
  }
}
