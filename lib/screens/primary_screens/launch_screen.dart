import 'dart:async';

import 'package:difaf_al_wafa_app/prefs/shared_pref_controller.dart';
import 'package:difaf_al_wafa_app/screens/primary_screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

import '../../controllers/firebase_controllers/fb_auth_controller.dart';
import '../auth_screens/main_auth_screen.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  late StreamSubscription
      _streamSubscription; // فتح قناة لمعرفة حالة المسخدم .1
  SharedPrefController sharedPrefController = SharedPrefController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      _streamSubscription = FbAuthController().checkUserState(
        listener: ({required bool state}) {
          state
              ? Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return MainScreen(selectedIndex: 0);
                  },
                ))
              : sharedPrefController.firstTime
                  ? Navigator.pushReplacementNamed(
                      context, '/first_onBoarding_screen')
                  : Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return MainAuthScreen(selectedIndex: 1);
                      },
                    ));
        },
      );
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _streamSubscription.cancel(); // اغلاق القناة .3
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#333333"),
      body: Container(
        clipBehavior: Clip.antiAlias,
        padding: EdgeInsets.only(top: 126.h),
        margin: EdgeInsets.only(bottom: 80.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(200.sp),
            bottomRight: Radius.circular(200.sp),
          ),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: AlignmentDirectional.center,
              height: 65.h,
              padding: EdgeInsets.only(left: 45.w, right: 45.w, bottom: 6.h),
              margin: sharedPrefController.language == 'en'
                  ? EdgeInsets.only(right: 65.w)
                  : EdgeInsets.only(left: 65.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: sharedPrefController.language == 'en'
                        ? Radius.circular(50.sp)
                        : Radius.circular(0.sp),
                    topRight: sharedPrefController.language == 'en'
                        ? Radius.circular(50.sp)
                        : Radius.circular(0.sp),
                    bottomLeft: sharedPrefController.language == 'en'
                        ? Radius.circular(0.sp)
                        : Radius.circular(50.sp),
                    topLeft: sharedPrefController.language == 'en'
                        ? Radius.circular(0.sp)
                        : Radius.circular(50.sp)),
                color: HexColor("#FF3333"),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '+35647',
                    style: TextStyle(
                        fontSize: 40.sp,
                        color: Colors.white,
                        fontFamily: 'BreeSerif'),
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Text(
                    AppLocalizations.of(context)!.martyr,
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.white,
                        fontFamily: 'BreeSerif',
                        fontWeight: sharedPrefController.language == 'ar'
                            ? FontWeight.bold
                            : null),
                  ),
                ],
              ),
            ),
            Container(
              height: 65.h,
              padding: EdgeInsets.only(left: 45.w, right: 45.w, bottom: 6.h),
              margin: sharedPrefController.language == 'en'
                  ? EdgeInsets.only(right: 95.w)
                  : EdgeInsets.only(left: 95.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: sharedPrefController.language == 'en'
                        ? Radius.circular(50.sp)
                        : Radius.circular(0.sp),
                    topRight: sharedPrefController.language == 'en'
                        ? Radius.circular(50.sp)
                        : Radius.circular(0.sp),
                    bottomLeft: sharedPrefController.language == 'en'
                        ? Radius.circular(0.sp)
                        : Radius.circular(50.sp),
                    topLeft: sharedPrefController.language == 'en'
                        ? Radius.circular(0.sp)
                        : Radius.circular(50.sp)),
                color: HexColor("#FBC35D"),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '+79852',
                    style: TextStyle(
                        fontSize: 40.sp,
                        color: Colors.white,
                        fontFamily: 'BreeSerif',
                        fontWeight: sharedPrefController.language == 'ar'
                            ? FontWeight.bold
                            : null),
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Text(
                    AppLocalizations.of(context)!.injured,
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.white,
                        fontFamily: 'BreeSerif'),
                  ),
                ],
              ),
            ),
            Container(
              height: 65.h,
              padding: EdgeInsets.only(left: 45.w, right: 45.w, bottom: 12.h),
              margin: sharedPrefController.language == 'en'
                  ? EdgeInsets.only(right: 130.w)
                  : EdgeInsets.only(left: 130.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: sharedPrefController.language == 'en'
                        ? Radius.circular(50.sp)
                        : Radius.circular(0.sp),
                    topRight: sharedPrefController.language == 'en'
                        ? Radius.circular(50.sp)
                        : Radius.circular(0.sp),
                    bottomLeft: sharedPrefController.language == 'en'
                        ? Radius.circular(0.sp)
                        : Radius.circular(50.sp),
                    topLeft: sharedPrefController.language == 'en'
                        ? Radius.circular(0.sp)
                        : Radius.circular(50.sp)),
                color: HexColor("#333333"),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '+11000',
                    style: TextStyle(
                        fontSize: 30.sp,
                        color: Colors.white,
                        fontFamily: 'BreeSerif',
                        fontWeight: sharedPrefController.language == 'ar'
                            ? FontWeight.bold
                            : null),
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Text(
                    AppLocalizations.of(context)!.missing,
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.white,
                        fontFamily: 'BreeSerif'),
                  ),
                ],
              ),
            ),
            Container(
              height: 65.h,
              padding: EdgeInsets.only(left: 45.w, right: 45.w, bottom: 12.h),
              margin: sharedPrefController.language == 'en'
                  ? EdgeInsets.only(right: 190.w)
                  : EdgeInsets.only(left: 190.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: sharedPrefController.language == 'en'
                        ? Radius.circular(50.sp)
                        : Radius.circular(0.sp),
                    topRight: sharedPrefController.language == 'en'
                        ? Radius.circular(50.sp)
                        : Radius.circular(0.sp),
                    bottomLeft: sharedPrefController.language == 'en'
                        ? Radius.circular(0.sp)
                        : Radius.circular(50.sp),
                    topLeft: sharedPrefController.language == 'en'
                        ? Radius.circular(0.sp)
                        : Radius.circular(50.sp)),
                color: HexColor("#08BE25"),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '+228',
                    style: TextStyle(
                        fontSize: 27.sp,
                        color: Colors.white,
                        fontFamily: 'BreeSerif'),
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Text(
                    AppLocalizations.of(context)!.days,
                    style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.white,
                        fontFamily: 'BreeSerif',
                        fontWeight: sharedPrefController.language == 'ar'
                            ? FontWeight.bold
                            : null),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 110.h,
            ),
            Transform.rotate(
              angle: 0.4,
              child: Image.asset(
                'images/GIU254-20.jpg',
                width: 250.w,
                height: 200.h,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
