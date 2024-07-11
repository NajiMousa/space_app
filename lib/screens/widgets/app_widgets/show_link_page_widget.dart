import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';


class ShowLinkPageWidget extends StatelessWidget {
  const ShowLinkPageWidget({Key? key}) : super(key: key);

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
                AppLocalizations.of(context)!.yourLinkPage,
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
          ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
              return ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Image.asset(
                  'images/userIcon.png',
                  width: 44.w,
                  height: 44.w,
                ),
                title: Text(
                  'Mohamed Al-Sayed',
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: HexColor('#333333'),
                      fontFamily: 'BreeSerif'),
                ),
                trailing: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.sp),
                    color: HexColor('#333333'),
                  ),
                  child: Text(
                    '2',
                    style: TextStyle(
                        fontSize: 10.sp,
                        color: HexColor('#FFFFFF'),
                        fontFamily: 'BreeSerif'),
                  ),
                ),
              );
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Container(
              padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 13.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(503.sp),
                color: HexColor('#D6E0E6'),
              ),
              width: 46.w,
              height: 46.h,
              child: SvgPicture.asset(
                'images/addPost.svg',
                width: 12.w,
                height: 12.h,
                color: HexColor('#333333'),
              ),
            ),
            title: Text(
              'Create New Martyrs Page',
              style: TextStyle(
                  fontSize: 14.sp,
                  color: HexColor('#333333').withOpacity(0.7),
                  fontFamily: 'BreeSerif'),
            ),
          ),
        ],
      ),
    );
  }
}
