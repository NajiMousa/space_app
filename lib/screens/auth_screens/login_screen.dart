import 'package:difaf_al_wafa_app/screens/widgets/app_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 24.h),
        AppTextFieldWidget(labelText: 'phone'),
        AppTextFieldWidget(labelText: 'password'),
        SizedBox(height: 6.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Text(
            'Did you forget your password?',
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
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              // padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
              minimumSize: Size(double.infinity, 56.h),
              primary: HexColor('#333333'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.sp),
              ),
            ),
            child: Text(
              'Log in',
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
            Divider(thickness: 5,indent: 30.w, endIndent: 30.w),
            Text(
              'OR',
              style: TextStyle(
                color: HexColor('#559FEA'),
                fontSize: 11.sp,
                fontFamily: 'BreeSerif',
              ),
            ),
            Divider(thickness: 2,indent: 30.w, endIndent: 30.w),
          ],
        ),
        SizedBox(height: 18.h),
        Padding(
          padding: EdgeInsets.only(right: 100.w,left: 100.w, bottom: 30.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                'images/google_g_icon.svg',
                width: 24.w,
                height: 24.h,
                color: HexColor('#333333'),
              ),
              SvgPicture.asset(
                'images/twitter_bird_icon.svg',
                width: 24.w,
                height: 24.h,
                color: HexColor('#333333'),
              ),
              SvgPicture.asset(
                'images/facebook_logo_icon.svg',
                width: 24.w,
                height: 24.h,
                color: HexColor('#333333'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
