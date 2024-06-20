import 'package:difaf_al_wafa_app/prefs/shared_pref_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class MartyrsStoriesScreen extends StatefulWidget {
  const MartyrsStoriesScreen({Key? key}) : super(key: key);

  @override
  State<MartyrsStoriesScreen> createState() => _MartyrsStoriesScreenState();
}

class _MartyrsStoriesScreenState extends State<MartyrsStoriesScreen> {
  SharedPrefController sharedPrefController = SharedPrefController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Featured Stories
        Padding(
          padding:
              EdgeInsets.only(top: 10.h, bottom: 12.h, right: 24.w, left: 24.w),
          child: Text(
            AppLocalizations.of(context)!.featuredStories,
            style: TextStyle(
                fontSize: 14.sp,
                color: HexColor('#333333').withOpacity(0.7),
                fontFamily: 'BreeSerif'),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 2,
          itemBuilder: (context, index) {
          return Stack(
            children: [
              InkWell(
                onTap: () => Navigator.pushNamed(context, '/martyr_profile_screen'),
                child: Container(
                  margin: sharedPrefController.language == 'en' ? EdgeInsets.only(top: 30.h, bottom: 12.h, left: 40.w, right: 24.w) : EdgeInsets.only(top: 30.h, bottom: 12.h, left: 24.w, right: 40.w),
                  padding: EdgeInsets.only(top: 12.h, right: 18.w, left: 18.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.sp),
                    color: HexColor('#FFFFFF'),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 0.2), // changes position of shadow
                      ),
                    ],
                  ),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 28.w, right: 35.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Yasser Mansoor',
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: HexColor('#6699CC'),
                                  fontFamily: 'BreeSerif'),
                            ),
                            Text(
                              'An adventurer at heart & Storyteller by trade',
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  color: HexColor('#474747').withOpacity(0.5),
                                  fontFamily: 'BreeSerif'),
                            ),
                            SizedBox(height: 5.h,),
                            Divider(
                              height: 0.5.h,
                              color: HexColor('#D9D9D9'),
                              thickness: 1.h,
                            ),
                            SizedBox(height: 5.h,),
                          ],
                        ),
                      ),
                      Text(
                        'Born with an unwavering sense of duty, Yasser Mansoor dedicated their life to protecting and serving their country. With a heart full of courage, they faced every challenge with resilience and honor. Yasser Mansoor made the ultimate sacrifice in the line of duty, leaving behind ....',
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: HexColor('#474747'),
                            fontFamily: 'BreeSerif'),
                      ),
                      SizedBox(height: 10.h,),
                      Divider(
                        height: 0.5.h,
                        color: HexColor('#D9D9D9'),
                        thickness: 1.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'images/likePost.svg',
                                  height: 24.h,
                                  width: 24.w,
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
                                  height: 24.h,
                                  width: 24.w,
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
                                  height: 45.h,
                                  width: 45.w,
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
                              ],
                            ),
                          ),
                          // SizedBox(
                          //   width: 90.w,
                          // ),
                          Container(
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'images/savedIcon.svg',
                                  height: 18.h,
                                  width: 18.w,
                                  color: HexColor('#8C9EA0'),
                                ),
                                SizedBox(width: 15.w),
                                SvgPicture.asset(
                                  'images/messengerIcon.svg',
                                  height: 20.h,
                                  width: 20.w,
                                  color: HexColor('#8C9EA0'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: sharedPrefController.language == 'en' ? EdgeInsets.only(left: 24.w) : EdgeInsets.only(right: 24.w),
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
                          width: 54.w,
                          height: 54.h,
                        ),
                        Image.asset(
                          'images/userIcon.png',
                          width: 48.w,
                          height: 48.w,
                        ),
                      ],
                    ),
                    SizedBox(width: 10.w,),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: Text(
                        '28April 1996 - 09Dec 2024',
                        style: TextStyle(
                            fontSize: 9.sp,
                            color: HexColor('#6699CC'),
                            fontFamily: 'BreeSerif'),
                      ),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.h, horizontal: 12.w),
                        backgroundColor: HexColor('#333333'),
                        minimumSize: Size(100.w, 24.h),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadiusDirectional.circular(50.sp)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'images/candle.svg',
                            height: 16.h,
                            width: 16.w,
                            color: Colors.white,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            AppLocalizations.of(context)!.lightACandle,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.sp,
                              fontFamily: 'BreeSerif',
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 40.w,)
                  ],
                ),
              ),
            ],
          );
        },),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24.w),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                  vertical: 8.h, horizontal: 12.w),
              backgroundColor: HexColor('#333333'),
              minimumSize: Size(double.infinity, 40.h),
              shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadiusDirectional.circular(10.sp)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.seeMore,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.sp,
                    fontFamily: 'BreeSerif',
                  ),
                ),
                SizedBox(width: 5.w),
                SvgPicture.asset(
                  'images/arrowForword.svg',
                  height: 16.h,
                  width: 16.w,
                  color: Colors.white,
                ),


              ],
            ),
          ),
        ),
        Padding(
          padding:
          EdgeInsets.only(top: 18.h, bottom: 12.h, right: 24.w, left: 24.w),
          child: Text(
            AppLocalizations.of(context)!.recentAddition,
            style: TextStyle(
                fontSize: 14.sp,
                color: HexColor('#333333').withOpacity(0.7),
                fontFamily: 'BreeSerif'),
          ),
        ),
        ListView.builder(
          padding: EdgeInsets.only(bottom: 90.h),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 2,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30.h, bottom: 12.h, left: 40.w, right: 24.w),
                  padding: EdgeInsets.only(top: 12.h, right: 18.w, left: 18.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.sp),
                    color: HexColor('#E0EBF2'),
                  ),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 28.w, right: 35.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Yasser Mansoor',
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: HexColor('#6699CC'),
                                  fontFamily: 'BreeSerif'),
                            ),
                            Text(
                              'An adventurer at heart & Storyteller by trade',
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  color: HexColor('#474747'),
                                  fontFamily: 'BreeSerif'),
                            ),
                            SizedBox(height: 5.h,),
                            Divider(
                              height: 0.5.h,
                              color: HexColor('#D9D9D9'),
                              thickness: 1.h,
                            ),
                            SizedBox(height: 5.h,),
                          ],
                        ),
                      ),
                      Text(
                        'Born with an unwavering sense of duty, Yasser Mansoor dedicated their life to protecting and serving their country. With a heart full of courage, they faced every challenge with resilience and honor. Yasser Mansoor made the ultimate sacrifice in the line of duty, leaving behind ....',
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: HexColor('#474747'),
                            fontFamily: 'BreeSerif'),
                      ),
                      SizedBox(height: 10.h,),
                      Divider(
                        height: 0.5.h,
                        color: HexColor('#D9D9D9'),
                        thickness: 1.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'images/likePost.svg',
                                  height: 24.h,
                                  width: 24.w,
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
                                  height: 24.h,
                                  width: 24.w,
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
                                  height: 45.h,
                                  width: 45.w,
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
                              ],
                            ),
                          ),
                          // SizedBox(
                          //   width: 90.w,
                          // ),
                          Container(
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'images/savedIcon.svg',
                                  height: 20.h,
                                  width: 20.w,
                                  color: HexColor('#8C9EA0'),
                                ),
                                SizedBox(width: 15.w),
                                SvgPicture.asset(
                                  'images/messengerIcon.svg',
                                  height: 20.h,
                                  width: 20.w,
                                  color: HexColor('#8C9EA0'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 24.w),
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
                            width: 54.w,
                            height: 54.h,
                          ),
                          Image.asset(
                            'images/userIcon.png',
                            width: 48.w,
                            height: 48.w,
                          ),
                        ],
                      ),
                      SizedBox(width: 10.w,),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20.h),
                        child: Text(
                          '28April 1996 - 09Dec 2024',
                          style: TextStyle(
                              fontSize: 9.sp,
                              color: HexColor('#6699CC'),
                              fontFamily: 'BreeSerif'),
                        ),
                      ),
                      SizedBox(width: 30.w,),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.h, horizontal: 12.w),
                          backgroundColor: HexColor('#333333'),
                          minimumSize: Size(100.w, 24.h),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadiusDirectional.circular(50.sp)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'images/addFollow.svg',
                              height: 16.h,
                              width: 16.w,
                              color: Colors.white,
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              AppLocalizations.of(context)!.lightACandle,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10.sp,
                                fontFamily: 'BreeSerif',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },),
      ],
    );
  }
}
