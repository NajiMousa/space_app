import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';


class ContactUsWidget extends StatelessWidget {
   ContactUsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(top: 550.h),
      width: 360.w,
      height: 360.h,
      // decoration: BoxDecoration(
      //     borderRadius: BorderRadius.only(
      //       topLeft: Radius.circular(24.sp),
      //       topRight: Radius.circular(24.sp),
      //     ),
      //     color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // padding: EdgeInsets.symmetric(horizontal: 32.w),
        children: [

          SizedBox(height: 12.h),
          Row(
            children: [
              Text(
                AppLocalizations.of(context)!.contactUs,
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
          SizedBox(height: 24.h),
          Row(
            children: [
              SvgPicture.asset(
                'images/Home.svg',
                width: 20.w,
                height: 20.h,
                color: HexColor('#333333'),
              ),
              SizedBox(width: 12.w),
              Text(
                'Palestine / Gaza /Dire Al-Balah',
                style: TextStyle(
                    fontSize: 12.sp,
                    color: HexColor('#333333'),
                    fontFamily: 'BreeSerif'),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              SvgPicture.asset(
                'images/callPhone.svg',
                width: 20.w,
                height: 20.h,
                color: HexColor('#333333'),
              ),
              SizedBox(width: 12.w),
              Text(
                '+970595192140',
                style: TextStyle(
                    fontSize: 12.sp,
                    color: HexColor('#333333'),
                    fontFamily: 'BreeSerif'),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              SvgPicture.asset(
                'images/email.svg',
                width: 20.w,
                height: 20.h,
                color: HexColor('#333333'),
              ),
              SizedBox(width: 12.w),
              Text(
                'difaf_al-wafa@info.com',
                style: TextStyle(
                    fontSize: 12.sp,
                    color: HexColor('#333333'),
                    fontFamily: 'BreeSerif'),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              SvgPicture.asset(
                'images/world_website.svg',
                width: 20.w,
                height: 20.h,
                color: HexColor('#333333'),
              ),
              SizedBox(width: 12.w),
              Text(
                'Space.com',
                style: TextStyle(
                    fontSize: 12.sp,
                    color: HexColor('#333333'),
                    fontFamily: 'BreeSerif'),
              ),
            ],
          ),
          SizedBox(height: 18.h),
          Text(
            'Or Write Message',
            style: TextStyle(
                fontSize: 12.sp,
                color: HexColor('#333333').withOpacity(0.7),
                fontFamily: 'BreeSerif'),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.w),
            alignment: AlignmentDirectional.center,
            child: TextField(
              style: TextStyle(
                fontFamily: 'BreeSerif',
                fontSize: 13.sp,
                color: HexColor('#8C9EA0'),
              ),
              maxLines: 2,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'write your massage',
                enabledBorder: getBorder(borderColor: HexColor('#333333')),
                focusedBorder: getBorder(borderColor: HexColor('#333333')),
              ),
            ),
          ),
          SizedBox(height: 15.h),
          Container(
            // margin: EdgeInsets.symmetric(horizontal: 24.w),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                    vertical: 8.h, horizontal: 12.w),
                backgroundColor: HexColor('#333333'),
                minimumSize: Size(double.infinity, 40.h),
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadiusDirectional.circular(50.sp)),
              ),
              child: Text(
                AppLocalizations.of(context)!.sendMessage,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10.sp,
                  fontFamily: 'BreeSerif',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  OutlineInputBorder getBorder({Color borderColor = Colors.white}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: borderColor,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(15.sp),
    );
  }
}
