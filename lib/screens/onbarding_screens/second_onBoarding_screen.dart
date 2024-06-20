import 'package:difaf_al_wafa_app/prefs/shared_pref_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';


class SecondOnBoardingScreen extends StatelessWidget {
   SecondOnBoardingScreen({Key? key}) : super(key: key);

  SharedPrefController sharedPrefController = SharedPrefController();
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
                          AppLocalizations.of(context)!.skip,
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.white,
                            fontFamily: 'BreeSerif'),
                      ),
                    ),
                  ),
                ),
                Text(
                    AppLocalizations.of(context)!.stop,
                  style: TextStyle(
                      fontSize: sharedPrefController.language == 'en' ? 45.sp : 60.sp,
                      color: Colors.red,
                      fontFamily: 'BreeSerif',
                      fontWeight: sharedPrefController.language == 'ar' ? FontWeight.bold : null),
                ),
                Text(
                  AppLocalizations.of(context)!.bombing,
                  style: TextStyle(
                      fontSize: sharedPrefController.language == 'en' ? 30.sp : 55.sp,
                      color: HexColor("#FBC35D"),
                      fontFamily: 'BreeSerif',
                      fontWeight: sharedPrefController.language == 'ar' ? FontWeight.bold : null),
                ),
                Text(
                  AppLocalizations.of(context)!.gaza,
                  style: TextStyle(
                      fontSize: sharedPrefController.language == 'en' ? 52.sp : 55.sp,
                      color: Colors.white,
                      fontFamily: 'BreeSerif',
                      fontWeight:sharedPrefController.language == 'ar' ? FontWeight.bold : null),
                ),
                Spacer(),
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
