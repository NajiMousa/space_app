import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class AddAudioPostWidgets extends StatelessWidget {
  const AddAudioPostWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 24.w, left: 24.w, bottom: 9.h),
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
              SizedBox(width: 46.w),
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
        Container(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
          margin: EdgeInsets.only(left: 54.w, right: 24.w),
          width: double.infinity,
          decoration: BoxDecoration(
            color: HexColor('#D6E0E6'),
            borderRadius: BorderRadius.circular(15.sp),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                'images/audioWave.svg',
                height: 24.h,
                width: 90.w,
                color: HexColor('#8C9EA0'),
              ),
              SvgPicture.asset(
                'images/audioWave.svg',
                height: 24.h,
                width: 90.w,
                color: HexColor('#8C9EA0'),
              ),
              SvgPicture.asset(
                'images/layer1.svg',
                height: 24.h,
                width: 45.w,
                color: HexColor('#8C9EA0'),
              ),
              Divider(thickness: 2, height: 34.h),
              SizedBox(
                width: 20.w,
              ),
              SvgPicture.asset(
                'images/playAudio.svg',
                height: 24.h,
                width: 24.w,
                color: HexColor('#333333'),
              ),
            ],
          ),
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
          ],
        ),
      ],
    );
  }
}
