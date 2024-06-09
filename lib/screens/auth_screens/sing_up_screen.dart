import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../widgets/app_text_field_widget.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({Key? key}) : super(key: key);

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFieldWidget(labelText: 'Phone',),
        AppTextFieldWidget(labelText: 'Password',),
        AppTextFieldWidget(labelText: 'Confirm Password',),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Row(
            children: [
              Checkbox(value: false, onChanged: (value) {},),
              Text(
                'Did you forget your password?',
                style: TextStyle(
                  color: HexColor('#559FEA'),
                  fontSize: 11.sp,
                  fontFamily: 'BreeSerif',
                ),
              ),
            ],
          ),
        ),
        // SizedBox(
        //   height: 16.h,
        // ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/otp_code_screen');
            },
            style: ElevatedButton.styleFrom(
              // padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
              minimumSize: Size(double.infinity, 56.h),
              primary: HexColor('#333333'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.sp),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 24.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Sing Up',
                    style: TextStyle(
                      color: HexColor('#FFFFFF'),
                      fontSize: 16.sp,
                      fontFamily: 'BreeSerif',
                    ),
                  ),
                  Spacer(),
                  SvgPicture.asset(
                    'images/arrowForword.svg',
                    width: 9.w,
                    height: 15.h,
                    color: HexColor('#FFFFFF'),
                  ),
                  SizedBox(width: 18.w),
                ],
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
