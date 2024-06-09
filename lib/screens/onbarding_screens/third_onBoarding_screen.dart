import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../auth_screens/main_auth_screen.dart';

class ThirdOnBoardingScreen extends StatelessWidget {
  const ThirdOnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'images/background03.png',
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
                Text(
                  'MAHMOUD DARWISH',
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.white,
                      fontFamily: 'BreeSerif'),
                ),
                Text(
                  'WHAT IS WORTH LIVING”',
                  style: TextStyle(
                      fontSize: 21.sp,
                      color: Colors.white,
                      fontFamily: 'BreeSerif'),
                ),
                Text(
                  'PLACE (PALESTINE)',
                  style: TextStyle(
                      fontSize: 27.sp,
                      color: HexColor("#FBC35D"),
                      fontFamily: 'BreeSerif'),
                ),
                Text(
                  '“ON THIS',
                  style: TextStyle(
                      fontSize: 40.sp,
                      color: Colors.red,
                      fontFamily: 'BreeSerif'),
                ),
                SizedBox(
                  height: 32.h,
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
                          Navigator.pushReplacementNamed(context, '/second_onBoarding_screen');
                        },
                        icon: Icon(Icons.arrow_back_ios,size: 15.sp),
                      ),
                    ),
                    Container(
                      height: 56.h,
                      padding:
                          EdgeInsets.symmetric( horizontal: 32.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.sp),
                        color: HexColor("#333333"),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return MainAuthScreen(selectedIndex: 0,);
                              },
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Text(
                              'Let’s go',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.white,
                                  fontFamily: 'BreeSerif'),
                            ),
                            SizedBox(width: 6.w,),
                            Icon(Icons.arrow_forward_ios,color: Colors.white,size: 15.sp),
                          ],
                        ),
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
