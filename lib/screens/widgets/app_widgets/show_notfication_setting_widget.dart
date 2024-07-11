import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';


class ShowNotficationSettingWidget extends StatelessWidget {
   ShowNotficationSettingWidget({Key? key}) : super(key: key);

  bool? _isNotificationEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.bottomCenter,
      // margin: EdgeInsets.only(top: 200.h),
      width: 360.w,
      height: 180.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.sp),
            topRight: Radius.circular(24.sp),
          ),
          color: Colors.white),
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        children: [
          SizedBox(height: 18.h),
          Row(
            children: [
              Text(
              AppLocalizations.of(context)!.notificationsSettings,
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
          Row(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Radio<bool>(
                    value: true,
                    groupValue: _isNotificationEnabled,
                    onChanged: (bool? value) {
                      _isNotificationEnabled = value;
                    },
                  ),
                  Text('On'),
                ],
              ),

              Row(
                children: [
                  Radio<bool>(
                    value: false,
                    groupValue: _isNotificationEnabled,
                    onChanged: (bool? value) {
                      _isNotificationEnabled = value;
                    },
                  ),
                  Text(AppLocalizations.of(context)!.off),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
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
                AppLocalizations.of(context)!.ok,
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
}
