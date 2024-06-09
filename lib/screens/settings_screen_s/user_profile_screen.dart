
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';


class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  int _selectedTypeMessanger = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#333333"),
      bottomNavigationBar: Container(
        height: 72.0, // Set the height here
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  _selectedTypeMessanger = 0;
                });
              },
              child: Padding(
                padding: EdgeInsets.only(left: 33.w),
                child: Column(
                  children: [
                    _selectedTypeMessanger == 0
                        ? Container(
                            decoration: BoxDecoration(
                              color: HexColor('#6699CC'),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(5.sp),
                                bottomLeft: Radius.circular(5.sp),
                              ),
                            ),
                            width: 29.w,
                            height: 5.h,
                          )
                        : SizedBox(
                            height: 5.h,
                          ),
                    SizedBox(height: 20.h),
                    Text(
                      'All',
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: _selectedTypeMessanger == 0
                              ? HexColor('#6699CC')
                              : HexColor('#8C9EA0'),
                          fontFamily: 'BreeSerif'),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _selectedTypeMessanger = 1;
                });
              },
              child: Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: Column(
                  children: [
                    _selectedTypeMessanger == 1
                        ? Container(
                            decoration: BoxDecoration(
                              color: HexColor('#6699CC'),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(5.sp),
                                bottomLeft: Radius.circular(5.sp),
                              ),
                            ),
                            width: 52.w,
                            height: 5.h,
                          )
                        : SizedBox(
                            height: 5.h,
                          ),
                    SizedBox(height: 20.h),
                    Text(
                      'Posts',
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: _selectedTypeMessanger == 1
                              ? HexColor('#6699CC')
                              : HexColor('#8C9EA0'),
                          fontFamily: 'BreeSerif'),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _selectedTypeMessanger = 2;
                });
              },
              child: Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: Column(
                  children: [
                    _selectedTypeMessanger == 2
                        ? Container(
                            decoration: BoxDecoration(
                              color: HexColor('#6699CC'),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(5.sp),
                                bottomLeft: Radius.circular(5.sp),
                              ),
                            ),
                            width: 55.w,
                            height: 5.h,
                          )
                        : SizedBox(
                            height: 5.h,
                          ),
                    SizedBox(height: 20.h),
                    Text(
                      'Photos',
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: _selectedTypeMessanger == 2
                              ? HexColor('#6699CC')
                              : HexColor('#8C9EA0'),
                          fontFamily: 'BreeSerif'),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _selectedTypeMessanger = 3;
                });
              },
              child: Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _selectedTypeMessanger == 3
                        ? Container(
                            decoration: BoxDecoration(
                              color: HexColor('#6699CC'),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(5.sp),
                                bottomLeft: Radius.circular(5.sp),
                              ),
                            ),
                            width: 43.w,
                            height: 5.h,
                          )
                        : SizedBox(
                            height: 5.h,
                          ),
                    SizedBox(height: 20.h),
                    Text(
                      'Video',
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: _selectedTypeMessanger == 3
                              ? HexColor('#6699CC')
                              : HexColor('#8C9EA0'),
                          fontFamily: 'BreeSerif'),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _selectedTypeMessanger = 4;
                });
              },
              child: Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _selectedTypeMessanger == 4
                        ? Container(
                            decoration: BoxDecoration(
                              color: HexColor('#6699CC'),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(5.sp),
                                bottomLeft: Radius.circular(5.sp),
                              ),
                            ),
                            width: 73.w,
                            height: 5.h,
                          )
                        : SizedBox(
                            height: 5.h,
                          ),
                    SizedBox(height: 20.h),
                    Text(
                      'Highlights',
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: _selectedTypeMessanger == 4
                              ? HexColor('#6699CC')
                              : HexColor('#8C9EA0'),
                          fontFamily: 'BreeSerif'),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _selectedTypeMessanger = 5;
                });
              },
              child: Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _selectedTypeMessanger == 5
                        ? Container(
                            decoration: BoxDecoration(
                              color: HexColor('#6699CC'),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(5.sp),
                                bottomLeft: Radius.circular(5.sp),
                              ),
                            ),
                            width: 60.w,
                            height: 5.h,
                          )
                        : SizedBox(
                            height: 5.h,
                          ),
                    SizedBox(height: 20.h),
                    Text(
                      'Articles',
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: _selectedTypeMessanger == 5
                              ? HexColor('#6699CC')
                              : HexColor('#8C9EA0'),
                          fontFamily: 'BreeSerif'),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _selectedTypeMessanger = 6;
                });
              },
              child: Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _selectedTypeMessanger == 6
                        ? Container(
                            decoration: BoxDecoration(
                              color: HexColor('#6699CC'),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(5.sp),
                                bottomLeft: Radius.circular(5.sp),
                              ),
                            ),
                            width: 45.w,
                            height: 5.h,
                          )
                        : SizedBox(
                            height: 5.h,
                          ),
                    SizedBox(height: 20.h),
                    Text(
                      'Links',
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: _selectedTypeMessanger == 6
                              ? HexColor('#6699CC')
                              : HexColor('#8C9EA0'),
                          fontFamily: 'BreeSerif'),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  Navigator.pop(context);
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 2.w, vertical: 2.h),
                margin: EdgeInsets.only(left: 24.w,right: 32.w),
                decoration: BoxDecoration(
                  color: Colors.white, // Background color
                  shape: BoxShape.circle, // Make it a circle if desired
                ),
                child: Icon(
                  Icons.close,
                  size: 18.sp,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(42.sp),
                bottomRight: Radius.circular(42.sp),
              ),
              color: Colors.white,
            ),
            child: ListView(
              padding: EdgeInsets.zero,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 260.h,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(75.sp)),
                        // color: Colors.red,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Image.asset(
                        'images/AA.png',
                        width: double.infinity,
                        height: 370.h,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 24.w, top: 215.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: HexColor('#21CED9'),
                                  borderRadius: BorderRadius.circular(56.sp),
                                ),
                                width: 90.w,
                                height: 90.h,
                              ),
                              Image.asset(
                                'images/userIcon.png',
                                width: 84.w,
                                height: 84.w,
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 70.w, right: 4.w, top: 62.h, bottom: 4.h),
                                padding:
                                EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                                // margin: EdgeInsets.only(left: 24.w),
                                width: 32.w,
                                height: 32.h,
                                decoration: BoxDecoration(
                                  color: HexColor('#E0EBF2'), // Background color
                                  shape: BoxShape.circle, // Make it a circle if desired
                                ),
                                child: InkWell(
                                  onTap: () {
                                    // Navigator.pop(context);
                                  },
                                  child: SvgPicture.asset(
                                    'images/camera_icon.svg',
                                    width: 6.w,
                                    height: 10.h,
                                    color: HexColor('#333333'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 16.w, top: 18.h, right: 24.w, ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      '20.3K',
                                      style: TextStyle(
                                        fontFamily: 'BreeSerif',
                                        fontSize: 13.sp,
                                        color: HexColor('#333333'),
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      'Post',
                                      style: TextStyle(
                                        fontFamily: 'BreeSerif',
                                        fontSize: 10.sp,
                                        color: HexColor('#8C9EA0'),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 12.w),
                                Column(
                                  children: [
                                    Text(
                                      '205.6K',
                                      style: TextStyle(
                                        fontFamily: 'BreeSerif',
                                        fontSize: 13.sp,
                                        color: HexColor('#333333'),
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      'Follower',
                                      style: TextStyle(
                                        fontFamily: 'BreeSerif',
                                        fontSize: 10.sp,
                                        color: HexColor('#8C9EA0'),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 12.w),
                                Column(
                                  children: [
                                    Text(
                                      '10.6K',
                                      style: TextStyle(
                                        fontFamily: 'BreeSerif',
                                        fontSize: 13.sp,
                                        color: HexColor('#333333'),
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      'Following',
                                      style: TextStyle(
                                        fontFamily: 'BreeSerif',
                                        fontSize: 10.sp,
                                        color: HexColor('#8C9EA0'),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 12.w),
                                Column(
                                  children: [
                                    Text(
                                      '03',
                                      style: TextStyle(
                                        fontFamily: 'BreeSerif',
                                        fontSize: 13.sp,
                                        color: HexColor('#333333'),
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      'Link Page',
                                      style: TextStyle(
                                        fontFamily: 'BreeSerif',
                                        fontSize: 10.sp,
                                        color: HexColor('#8C9EA0'),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),

                  ],
                ),
                SizedBox(height: 18.h),
                Padding(
                  padding: EdgeInsets.only(left: 32.w, bottom: 12.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mohamed Ahmed Al-Sayed',
                        style: TextStyle(
                          fontFamily: 'BreeSerif',
                          fontSize: 16.sp,
                          color: HexColor('#333333'),
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Mohamed Sayed2003@gmail.com',
                        style: TextStyle(
                          fontFamily: 'BreeSerif',
                          fontSize: 11.sp,
                          color: HexColor('#8C9EA0'),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'I am the star of my own world.... \n Palestinian Man Software Engineer Ux Ui Designers \n Flutter Developer',
                        style: TextStyle(
                          fontFamily: 'BreeSerif',
                          fontSize: 11.sp,
                          color: HexColor('#333333'),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.h, horizontal: 18.w),
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
                              'images/addPost.svg',
                              height: 12.h,
                              width: 12.w,
                              color: Colors.white,
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              'Add Story',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11.sp,
                                fontFamily: 'BreeSerif',
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.h, horizontal: 26.w),
                            backgroundColor: HexColor('#6699CC'),
                            minimumSize: Size(double.infinity, 24.h),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadiusDirectional.circular(50.sp)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'images/addPost.svg',
                                height: 12.h,
                                width: 12.w,
                                color: Colors.white,
                              ),
                              SizedBox(width: 5.w),
                              Text(
                                'Edit Profile',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11.sp,
                                  fontFamily: 'BreeSerif',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 5.w),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.h, horizontal: 8.w),
                          backgroundColor: HexColor('#333333'),
                          minimumSize: Size(24.w, 24.h),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadiusDirectional.circular(50.sp)),
                        ),
                        child: SvgPicture.asset(
                          'images/icons.svg',
                          height: 12.h,
                          width: 12.w,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(thickness: 2,indent: 32.w,endIndent: 32.w,),
                SizedBox(height: 12.h),
              ],
            ),

          ),
          Container(
            margin: EdgeInsets.only(
                left: 32.w, right: 24.w, top: 63.h, bottom: 0.h),
            padding:
            EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            // margin: EdgeInsets.only(left: 24.w),
            width: 32.w,
            height: 32.h,
            decoration: BoxDecoration(
              color: HexColor('#333333'), // Background color
              shape: BoxShape.circle, // Make it a circle if desired
            ),
            child: InkWell(
              onTap: () {
                // Navigator.pop(context);
              },
              child: SvgPicture.asset(
                'images/arrow_back.svg',
                width: 6.w,
                height: 10.h,
                color: HexColor('#FFFFFF'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
