import 'package:difaf_al_wafa_app/prefs/shared_pref_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import '../auth_screens/main_auth_screen.dart';

class ThirdOnBoardingScreen extends StatelessWidget {
   ThirdOnBoardingScreen({Key? key}) : super(key: key);

   SharedPrefController sharedPrefController = SharedPrefController();
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
                  AppLocalizations.of(context)!.mahmoudDarwish,
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.white,
                      fontFamily: 'BreeSerif',
                  fontWeight: sharedPrefController.language == 'ar' ? FontWeight.bold : null),
                ),
                Text(
                  AppLocalizations.of(context)!.whatIsWorthLiving,
                  style: TextStyle(
                      fontSize: sharedPrefController.language == 'en' ? 21.sp : 40.sp,
                      color: Colors.white,
                      fontFamily: 'BreeSerif',
                      fontWeight: sharedPrefController.language == 'ar' ? FontWeight.bold : null),
                ),
                Text(
                  AppLocalizations.of(context)!.placePalestine,
                  style: TextStyle(
                      fontSize: sharedPrefController.language == 'en' ? 27.sp : 32.sp,
                      color: HexColor("#FBC35D"),
                      fontFamily: 'BreeSerif',
                      fontWeight: sharedPrefController.language == 'ar' ? FontWeight.bold : null),
                ),
                Text(
                  AppLocalizations.of(context)!.onThis,
                  style: TextStyle(
                      fontSize:  40.sp,
                      color: Colors.red,
                      fontFamily: 'BreeSerif',
                      fontWeight: sharedPrefController.language == 'ar' ? FontWeight.bold : null),
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
                          Navigator.pushReplacement(
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
                              AppLocalizations.of(context)!.letsGo,
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
