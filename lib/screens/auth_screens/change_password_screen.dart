import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Padding(
          padding:
          EdgeInsets.symmetric(horizontal: 30.w, vertical: 12.h),
          child: TextField(
            decoration: InputDecoration(
              // contentPadding: EdgeInsets.only(left: 18.w),
              filled: true,
              fillColor: Colors.white,
              labelText: 'Old Password',
              labelStyle: TextStyle(
                fontFamily: 'BreeSerif',
                fontSize: 12.sp,
                color: HexColor('#2A2927'),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.sp),
                borderSide: BorderSide(
                    color: HexColor('#333333')
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding:
          EdgeInsets.symmetric(horizontal: 30.w, ),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              labelText: 'New Password',
              labelStyle: TextStyle(
                fontFamily: 'BreeSerif',
                fontSize: 12.sp,
                color: HexColor('#2A2927'),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.sp),
                borderSide: BorderSide(
                    color: HexColor('#333333')
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding:
          EdgeInsets.only(left: 30.w , right: 30.w, top: 12.h),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              labelText: 'Confirm New Password',
              labelStyle: TextStyle(
                fontFamily: 'BreeSerif',
                fontSize: 12.sp,
                color: HexColor('#2A2927'),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.sp),
                borderSide: BorderSide(
                    color: HexColor('#333333')
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 32.h),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/main_screen');
            },
            style: ElevatedButton.styleFrom(
              // padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
              minimumSize: Size(double.infinity, 56.h),
              primary: HexColor('#333333'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.sp),
              ),
            ),
            child: Text(
              'Save Password',
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
