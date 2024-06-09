import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class SecondOnBoardingScreen extends StatelessWidget {
  const SecondOnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'images/background02.png',
            width: double.infinity,
            // height: 370.h,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 45.h, horizontal: 32.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 132.h),
                    width: 70.w,
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.sp),
                      color: HexColor("#333333"),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/third_onBoarding_screen');
                      },
                      child: Text(
                        'SKIP',
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.white,
                            fontFamily: 'BreeSerif'),
                      ),
                    ),
                  ),
                ),
                Text(
                  'STOP',
                  style: TextStyle(
                      fontSize: 45.sp,
                      color: Colors.red,
                      fontFamily: 'BreeSerif'),
                ),
                Text(
                  'BOMBING',
                  style: TextStyle(
                      fontSize: 30.sp,
                      color: HexColor("#FBC35D"),
                      fontFamily: 'BreeSerif'),
                ),
                Text(
                  'GAZA',
                  style: TextStyle(
                      fontSize: 52.sp,
                      color: Colors.white,
                      fontFamily: 'BreeSerif'),
                ),
                SizedBox(
                  height: 320.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 56.h,
                      width: 56.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.sp),
                        color: HexColor("#333333"),
                      ),
                      child: IconButton(
                        color: Colors.white,
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/first_onBoarding_screen');
                        },
                        icon: Icon(Icons.arrow_back_ios, size: 15.sp),
                      ),
                    ),
                    Container(
                      height: 56.h,
                      width: 56.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.sp),
                        color: HexColor("#333333"),
                      ),
                      child: IconButton(
                        color: Colors.white,
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, '/third_onBoarding_screen');
                        },
                        icon: Icon(Icons.arrow_forward_ios, size: 15.sp),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
