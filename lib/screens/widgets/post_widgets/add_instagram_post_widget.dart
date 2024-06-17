import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class AddInstagramPostWidget extends StatelessWidget {
  const AddInstagramPostWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: 12.h, right: 24.w, left: 24.w, bottom: 9.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: HexColor('#21CED9'),
                      borderRadius: BorderRadius.circular(56.sp),
                    ),
                    width: 34.w,
                    height: 34.h,
                  ),
                  Image.asset(
                    'images/userIcon.png',
                    width: 30.w,
                    height: 30.w,
                  ),
                ],
              ),
              SizedBox(
                width: 6.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Yasser Mansoor',
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: HexColor('#474747'),
                            fontFamily: 'BreeSerif'),
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                      Text(
                        'With',
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: HexColor('#333333'),
                            fontFamily: 'BreeSerif'),
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                      Text(
                        'Mj Silva',
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: HexColor('#474747'),
                            fontFamily: 'BreeSerif'),
                      ),
                    ],
                  ),
                  Text(
                    '3.1K follwer',
                    style: TextStyle(
                        fontSize: 10.sp,
                        color: HexColor('#6699CC'),
                        fontFamily: 'BreeSerif'),
                  ),
                ],
              ),
              Spacer(),
              Text(
                '5 hour ago',
                style: TextStyle(
                    fontSize: 10.sp,
                    color: HexColor('#8C9EA0'),
                    fontFamily: 'BreeSerif'),
              ),
              SizedBox(width: 6.w),
              SvgPicture.asset(
                'images/more.svg',
                height: 16.h,
                width: 16.w,
                color: HexColor('#8C9EA0'),
              ),
            ],
          ),
        ),
        Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Image.asset(
              'images/backgroundPost.png',
              width: double.infinity,
              height: 390.h,
              fit: BoxFit.fill,
            ),
            Padding(
              padding:
              EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 5.w, vertical: 2.h),
                    margin: EdgeInsets.only(bottom: 123.h),
                    // height: 12.h,
                    child: Text(
                      '1/5',
                      style: TextStyle(
                          fontSize: 8.sp,
                          color: HexColor('#333333'),
                          fontFamily: 'BreeSerif'),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.sp),
                      color: HexColor('#FFFFFF'),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.center,
                    child: SvgPicture.asset(
                      'images/likePost.svg',
                      height: 75.h,
                      width: 75.w,
                      color: HexColor('#FF0000'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Column(
          children: [
            Padding(
              padding:
              EdgeInsets.symmetric(horizontal: 24.w, vertical: 6.h),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'images/likePost.svg',
                    height: 20.h,
                    width: 20.w,
                    color: HexColor('#FF0000'),
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    '15.9K',
                    style: TextStyle(
                        fontSize: 9.sp,
                        color: HexColor('#333333'),
                        fontFamily: 'BreeSerif'),
                  ),
                  SizedBox(width: 16.w),
                  SvgPicture.asset(
                    'images/commentIcon.svg',
                    height: 20.h,
                    width: 20.w,
                    color: HexColor('#333333'),
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    '10.1K',
                    style: TextStyle(
                        fontSize: 9.sp,
                        color: HexColor('#333333'),
                        fontFamily: 'BreeSerif'),
                  ),

                  SvgPicture.asset(
                    'images/repostIcon.svg',
                    height: 40.h,
                    width: 40.w,
                    color: HexColor('#333333'),
                  ),
                  // SizedBox(width: 5.w),
                  Text(
                    '3.6K',
                    style: TextStyle(
                        fontSize: 9.sp,
                        color: HexColor('#333333'),
                        fontFamily: 'BreeSerif'),
                  ),
                  // SizedBox(
                  //   width: 90.w,
                  // ),
                  Spacer(),
                  SvgPicture.asset(
                    'images/savedIcon.svg',
                    height: 20.h,
                    width: 20.w,
                    color: HexColor('#8C9EA0'),
                  ),
                  SizedBox(width: 20.w),
                  SvgPicture.asset(
                    'images/messengerIcon.svg',
                    height: 20.h,
                    width: 20.w,
                    color: HexColor('#8C9EA0'),
                  ),
                ],
              ),
            ),
            Divider(
              height: 0.5.h,
              color: HexColor('#D9D9D9'),
              thickness: 1.h,
            ),
            SizedBox(
              height: 20.h,
            )
          ],
        ),
      ],
    );
  }
}
