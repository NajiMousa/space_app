import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';


class AddMartyrsWidget extends StatelessWidget {
  AddMartyrsWidget({Key? key, required this.hasAddedStory}) : super(key: key);

  final bool hasAddedStory;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle add story or view story action
      },
      child: hasAddedStory
          ? Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.sp),
                    color: HexColor('#E0EBF2'),
                  ),
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.sp),
                      color: HexColor('#E0EBF2'),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'images/coverImage.png',
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(height: 18.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Text(
                            'Yasser Mansoor',
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: HexColor('#474747'),
                                fontFamily: 'BreeSerif'),
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Text(
                            'An adventurer at heart Storyteller by trade',
                            style: TextStyle(
                                fontSize: 11.sp,
                                color: HexColor('#474747'),
                                fontFamily: 'BreeSerif'),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Text(
                            '3.1K Candle || 1.2K follower',
                            style: TextStyle(
                                fontSize: 10.sp,
                                color: HexColor('#3396F9'),
                                fontFamily: 'BreeSerif'),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              minimumSize: const Size(double.infinity, 24),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: HexColor('#333333'),
                                ),
                                borderRadius: BorderRadius.circular(
                                    15.sp), // Set your desired radius here
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 6.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'images/addFollow.svg',
                                    height: 16.h,
                                    width: 16.w,
                                    color: HexColor('#333333'),
                                  ),
                                  SizedBox(width: 5.w),
                                  Text(
                                    AppLocalizations.of(context)!.follow,
                                    style: TextStyle(
                                      color: HexColor('#333333'),
                                      fontSize: 10.sp,
                                      fontFamily: 'BreeSerif',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.sp),
                  ),
                  child: Image.asset(
                    'images/userIcon.png',
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  width: 40.w,
                  height: 40.h,
                  margin: EdgeInsets.only(top: 45.h, left: 15.w),
                )
              ],
            )
          : InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.sp),
                  color: HexColor('#333333'),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 42.w, vertical: 22.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.sp),
                        color: HexColor('#333333'),
                        border: Border.all(
                          color: Colors.white, // Border color
                          width: 1, // Border width
                        ),
                      ),
                      child: SvgPicture.asset(
                        'images/addMartyr.svg',
                        height: 40.h,
                        width: 40.w,
                        color: HexColor('#FFFFFF'),
                      ),
                    ),
                    SizedBox(height: 7.h),
                    Text(
                      'Create a martyr page',
                      style: TextStyle(
                        color: HexColor('#FFFFFF'),
                        fontSize: 11.sp,
                        fontFamily: 'BreeSerif',
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'A request can be submitted to create a page for the martyr',
                      style: TextStyle(
                        color: HexColor('#FFFFFF'),
                        fontSize: 10.sp,
                        fontFamily: 'BreeSerif',
                        decorationStyle: TextDecorationStyle.dotted
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
