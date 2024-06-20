import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';


class AddStoryWidget extends StatelessWidget {
  AddStoryWidget({Key? key, required this.hasAddedStory }) : super(key: key);

  final bool hasAddedStory;

  @override
  Widget build(BuildContext context) {
    return
    GestureDetector(
      onTap: () {
        // Handle add story or view story action
      },
      child: hasAddedStory
          ? Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: HexColor('#21CED9'),
                  borderRadius:
                  BorderRadius.circular(56.sp),
                ),
                width: 56.w,
                height: 56.h,
              ),
              Image.asset(
                'images/userIcon.png',
                width: 50.w,
                height: 50.w,
              ),
            ],
          ),
          SizedBox(height: 6.h),
          Text(
            'Mohamed',
            style: TextStyle(
                fontSize: 11.sp,
                color: HexColor('#474747'),
                fontFamily: 'BreeSerif'),
          ),
        ],
      )
          : Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Image.asset(
                'images/userIcon.png',
                width: 56.w,
                height: 56.w,
              ),
              Container(
                margin: EdgeInsets.only(
                    left: 45.w,
                    // right: 4.w,
                    top: 36.h,
                    bottom: 4.h),
                padding: EdgeInsets.symmetric(
                    horizontal: 5.w, vertical: 5.h),
                // margin: EdgeInsets.only(left: 24.w),
                width: 20.w,
                height: 20.h,
                decoration: BoxDecoration(
                  color: HexColor(
                      '#21CED9'), // Background color
                  shape: BoxShape
                      .circle, // Make it a circle if desired
                ),
                child: InkWell(
                  onTap: () {
                    // Navigator.pop(context);
                  },
                  child: SvgPicture.asset(
                    'images/addPost.svg',
                    width: 15.w,
                    height: 15.h,
                    color: HexColor('#FFFFFF'),
                  ),
                ),
              ),
            ],
          ),
          Text(
            AppLocalizations.of(context)!.addStory,
            style: TextStyle(
                fontSize: 11.sp,
                color: HexColor('#21CED9'),
                fontFamily: 'BreeSerif'),
          ),
        ],
      ),
    );
  }
}
