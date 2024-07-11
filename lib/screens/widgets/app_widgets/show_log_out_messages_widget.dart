import 'package:difaf_al_wafa_app/controllers/firebase_controllers/fb_auth_controller.dart';
import 'package:difaf_al_wafa_app/screens/auth_screens/main_auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

import '../../../prefs/shared_pref_controller.dart';

class ShowLogOutMessagesWidget extends StatelessWidget {
  ShowLogOutMessagesWidget({Key? key}) : super(key: key);
  FbAuthController fbAuthController = FbAuthController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 0.h),
      width: double.infinity,
      height: 160.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.sp),
            topRight: Radius.circular(24.sp),
          ),
          color: Colors.white),
      child: Column(
        // padding: EdgeInsets.symmetric(horizontal: 32.w),
        children: [
          SizedBox(height: 6.h),
          Row(
            children: [
              Text(
                AppLocalizations.of(context)!.logOutMessage,
                style: TextStyle(
                    fontSize: 13.sp,
                    color: HexColor('#333333').withOpacity(0.7),
                    fontFamily: 'BreeSerif'),
              ),
              Spacer(),
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  margin: EdgeInsets.only(right: 4.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.sp),
                    color: HexColor('#D6E0E6'),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
                  width: 24.w,
                  height: 24.h,
                  child: SvgPicture.asset(
                    'images/close_round_icon.svg',
                    width: 12.w,
                    height: 12.h,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 18.h),
          Text(
            AppLocalizations.of(context)!
                .areYouSureYouWantToLogOutOfYourAccount,
            style: TextStyle(
                fontSize: 16.sp,
                color: HexColor('#333333').withOpacity(0.7),
                fontFamily: 'BreeSerif'),
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            children: [
              Container(
                // margin: EdgeInsets.symmetric(horizontal: 24.w),
                child: ElevatedButton(
                  onPressed: () async{
                    print('object');
                    await SharedPrefController().clear();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                      return MainAuthScreen(selectedIndex: 1);
                    },));
                    print('object01');
                    print(SharedPrefController().email);
                    print(SharedPrefController().password);
                    print(SharedPrefController().phone);
                  },
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                    backgroundColor: HexColor('#333333'),
                    minimumSize: Size(128.w, 40.h),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(50.sp)),
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.logOut,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.sp,
                      fontFamily: 'BreeSerif',
                    ),
                  ),
                ),
              ),
              Spacer(),
              Container(
                // margin: EdgeInsets.symmetric(horizontal: 24.w),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                    backgroundColor: HexColor('#D6E0E6'),
                    minimumSize: Size(128.w, 40.h),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(50.sp)),
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.cancel,
                    style: TextStyle(
                      color: HexColor('#333333'),
                      fontSize: 10.sp,
                      fontFamily: 'BreeSerif',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
