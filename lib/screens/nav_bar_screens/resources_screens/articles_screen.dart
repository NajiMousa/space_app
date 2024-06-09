import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({Key? key}) : super(key: key);

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.only(top: 12.h, bottom: 6.h, right: 24.w, left: 24.w),
          child: Text(
            'Recent Additions',
            style: TextStyle(
                fontSize: 14.sp,
                color: HexColor('#333333'),
                fontFamily: 'BreeSerif'),
          ),
        ),
        ListView.builder(
          padding: EdgeInsets.only(bottom: 90.h),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                  top: 6.h, bottom: 12.h, right: 24.w, left: 24.w),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.sp),
                      color: HexColor('#FFFFFF'),
                    ),
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.sp),
                        color: HexColor('#FFFFFF'),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 0.1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'images/coverImage.png',
                            width: double.infinity,
                            height: 120.h,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(height: 24.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Text(
                              'title: In the face of adversity, the resilience and courage of our community .',
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: HexColor('#333333'),
                                  fontFamily: 'BreeSerif'),
                            ),
                          ),
                          // SizedBox(height: 6.h),
                          // Padding(
                          //   padding: EdgeInsets.symmetric(horizontal: 16.w),
                          //   child: Text(
                          //     'Author: In the face of adversity, the resilience and courage of our commun ,In the face of adversity, the resilience and courage of our community ,In the face of adversity, the resilience and courage of our community, In the face of adversity, the resilience and ....',
                          //     style: TextStyle(
                          //         fontSize: 11.sp,
                          //         color: HexColor('#474747'),
                          //         fontFamily: 'BreeSerif'),
                          //   ),
                          // ),
                          SizedBox(height: 6.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Divider(
                              height: 0.5.h,
                              color: HexColor('#8C9EA0'),
                              thickness: 1.h,
                                endIndent: 280.w,
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Padding(
                            padding: EdgeInsets.only(
                                right: 16.w, left: 16.w, bottom: 12.h),
                            child: Text(
                              'Naji A Mousa',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: HexColor('#8C9EA0'),
                                  fontFamily: 'BreeSerif'),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 96.h, left: 241.w, right: 16.w),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.h, horizontal: 12.w),
                        backgroundColor: HexColor('#333333'),
                        minimumSize: Size(20.w, 24.h),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadiusDirectional.circular(50.sp)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'images/savedIcon.svg',
                            height: 12.h,
                            width: 12.w,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            'Save',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.sp,
                              fontFamily: 'BreeSerif',
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
