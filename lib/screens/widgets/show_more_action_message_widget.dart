import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';


import '../profile_screens/martyr_profile_screen.dart';

class ShowMoreActionMessageWidget extends StatelessWidget {
  ShowMoreActionMessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 550.h),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.sp),
            topRight: Radius.circular(24.sp),
          ),
          color: Colors.white),
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        children: [
          SizedBox(height: 6.h),
          Center(
            child: Container(
              width: 46.w,
              height: 6.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sp),
                color: HexColor('#949493'),
              ),
            ),
          ),
          SizedBox(height: 18.h),
          Row(
            children: [
              Text(
                AppLocalizations.of(context)!.moreAction,
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
          // ListTile(
          //   onTap: () {
          //     Navigator.push(context, MaterialPageRoute(
          //       builder: (context) {
          //         return MartyrProfileScreen();
          //       },
          //     ));
          //   },
          //   contentPadding: EdgeInsets.zero,
          //   leading: Container(
          //     width: 50.w,
          //     height: 50.w,
          //     alignment: AlignmentDirectional.center,
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(50.sp),
          //         color: HexColor('#21CED9')),
          //     child: Image.asset(
          //       'images/userIcon.png',
          //       width: 44.w,
          //       height: 44.w,
          //     ),
          //   ),
          //   title: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text(
          //         'Mohamed Al-Sayed',
          //         style: TextStyle(
          //             fontSize: 14.sp,
          //             color: HexColor('#333333'),
          //             fontFamily: 'BreeSerif'),
          //       ),
          //       SizedBox(height: 4.h),
          //       Text(
          //         'Mohamed Sayed2003@gmail.com',
          //         style: TextStyle(
          //             fontSize: 10.sp,
          //             color: HexColor('#8C9EA0'),
          //             fontFamily: 'BreeSerif'),
          //       ),
          //     ],
          //   ),
          //   trailing: SvgPicture.asset(
          //     'images/arrowForword.svg',
          //     width: 9.w,
          //     height: 15.h,
          //     color: HexColor('#333333'),
          //   ),
          // ),
          SizedBox(height: 24.h),
          InkWell(
            child: Row(
              children: [
                SvgPicture.asset(
                  'images/image_icon.svg',
                  width: 20.w,
                  height: 20.h,
                  color: HexColor('#333333'),
                ),
                SizedBox(width: 12.w),
                Text(
                  AppLocalizations.of(context)!.viewMediaOrFilesAndLinks,
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: HexColor('#333333'),
                      fontFamily: 'BreeSerif'),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          InkWell(
            child: Row(
              children: [
                SvgPicture.asset(
                  'images/searchIcon.svg',
                  width: 20.w,
                  height: 20.h,
                  color: HexColor('#333333'),
                ),
                SizedBox(width: 12.w),
                Text(
                  AppLocalizations.of(context)!.searchInConversation,
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: HexColor('#333333'),
                      fontFamily: 'BreeSerif'),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          InkWell(
            child: Row(
              children: [
                SvgPicture.asset(
                  'images/notificationIcon.svg',
                  width: 20.w,
                  height: 20.h,
                  color: HexColor('#333333'),
                ),
                SizedBox(width: 12.w),
                Text(
                  AppLocalizations.of(context)!.notifications,
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: HexColor('#333333'),
                      fontFamily: 'BreeSerif'),
                ),
                Spacer(),
                Text(
                  'On',
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: HexColor('#6699CC'),
                      fontFamily: 'BreeSerif'),
                ),
                SizedBox(width: 4.w),
                SvgPicture.asset(
                  'images/arrowForword.svg',
                  width: 9.w,
                  height: 15.h,
                  color: HexColor('#333333'),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          InkWell(
            child: Row(
              children: [
                SvgPicture.asset(
                  'images/share_social_icon.svg',
                  width: 20.w,
                  height: 20.h,
                  color: HexColor('#333333'),
                ),
                SizedBox(width: 12.w),
                Text(
                  AppLocalizations.of(context)!.shareProfile,
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: HexColor('#333333'),
                      fontFamily: 'BreeSerif'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
