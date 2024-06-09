import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class UsersStorysWidget extends StatelessWidget {
  UsersStorysWidget({Key? key, required this.index, required this.isActive }) : super(key: key);

  final int index;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return
    GestureDetector(
      onTap: () {
        // Handle add story or view story action
      },
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: HexColor('#21CED9'),
                  borderRadius: BorderRadius.circular(56.sp),
                ),
                width: 56.w,
                height: 56.h,
              ),
              Image.asset(
                'images/userIcon.png',
                width: 50.w,
                height: 50.w,
              ),

              isActive ? Container(
                margin: EdgeInsets.only(
                    left: 42.w,
                    // right: 4.w,
                    top: 35.h,
                    bottom: 4.h),
                padding: EdgeInsets.symmetric(
                    horizontal: 2.w, vertical: 2.h),
                // margin: EdgeInsets.only(left: 24.w),
                width: 15.w,
                height: 15.h,
                decoration: BoxDecoration(
                  color: HexColor(
                      '#FFFFFF'), // Background color
                  shape: BoxShape
                      .circle, // Make it a circle if desired
                ),

                child: Container(
                  width: 19.w,
                  height: 19.h,
                  decoration: BoxDecoration(
                    color: HexColor(
                        '#333333'), // Background color
                    shape: BoxShape
                        .circle, // Make it a circle if desired
                  ),
                ),
              ): SizedBox()
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
    );
  }
}
