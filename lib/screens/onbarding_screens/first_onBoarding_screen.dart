import 'package:difaf_al_wafa_app/prefs/shared_pref_controller.dart';
import 'package:difaf_al_wafa_app/screens/auth_screens/main_auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class FirstOnBoardingScreen extends StatelessWidget {
   FirstOnBoardingScreen({Key? key}) : super(key: key);

  SharedPrefController sharedPrefController = SharedPrefController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'images/background.png',
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
                    margin: EdgeInsets.only(bottom: 420.h),
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.sp),
                      color: HexColor("#333333"),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, '/third_onBoarding_screen');
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
                  AppLocalizations.of(context)!.free,
                  style: TextStyle(
                      fontSize: 50.sp,
                      color: Colors.red,
                      fontFamily: 'BreeSerif',
                      fontWeight: sharedPrefController.language == 'ar' ? FontWeight.bold : null),
                ),
                // SizedBox(height: 10.h),
                Text(
                  AppLocalizations.of(context)!.palestine,
                  style: TextStyle(
                      fontSize: 50.sp,
                      color: Colors.white,
                      fontFamily: 'BreeSerif',
                  fontWeight: sharedPrefController.language == 'ar' ? FontWeight.bold : null),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return MainAuthScreen(selectedIndex: 2);
                            },
                          ),
                        );
                      },
                      child: Text(
                        AppLocalizations.of(context)!.termsAndConditions,
                        style:
                        TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                            fontFamily: 'BreeSerif',
                        fontWeight: sharedPrefController.language == 'ar' ? FontWeight.bold : null),
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
                              context, '/second_onBoarding_screen');
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
