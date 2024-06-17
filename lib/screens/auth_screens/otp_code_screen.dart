import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class OtpCodeScreen extends StatefulWidget {
  const OtpCodeScreen({Key? key}) : super(key: key);

  @override
  State<OtpCodeScreen> createState() => _OtpCodeScreenState();
}

class _OtpCodeScreenState extends State<OtpCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 24.h),
        Padding(
          padding: EdgeInsets.only(right: 22.w, left: 32.w, bottom: 22.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                width: 46.w,
                  height: 46.h,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: '0',
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
                    // hintText: '0',
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
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                width: 46.w,
                height: 46.h,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: '0',
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
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
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                width: 46.w,
                height: 46.h,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: '0',
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
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
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                width: 46.w,
                height: 46.h,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: '0',
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
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
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                width: 46.w,
                height: 46.h,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: '0',
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
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
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                width: 46.w,
                height: 46.h,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: '0',
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
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
              )
            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'OTP code had been sent to your \n phone number',
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
                'Haven’t received the code?',
                style: TextStyle(
                  color: HexColor('#333333'),
                  fontSize: 14.sp,
                  fontFamily: 'BreeSerif',
                ),
              ),
              SizedBox(width: 10.w,),
              Text(
                'Resent ( 59 secs )',
                style: TextStyle(
                  color: HexColor('#6699CC'),
                  fontSize: 14.sp,
                  fontFamily: 'BreeSerif',
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 24.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
          child: ElevatedButton(
            onPressed: () {},
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
                  'Save',
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
    );
  }
}
