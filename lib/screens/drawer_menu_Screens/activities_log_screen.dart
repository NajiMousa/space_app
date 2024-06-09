import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../widgets/add_story_widget.dart';
import '../widgets/users_storys_widget.dart';

class ActivitiesLogScreen extends StatefulWidget {
  const ActivitiesLogScreen({Key? key}) : super(key: key);

  @override
  State<ActivitiesLogScreen> createState() => _ActivitiesLogScreenState();
}

class _ActivitiesLogScreenState extends State<ActivitiesLogScreen> {
  int _selectedTypeMessanger = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: HexColor('#333333'),
        bottomNavigationBar: Container(
          height: 72.0, // Set the height here
          child: Stack(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: double.infinity,
                  maxHeight: 80.h,
                ),
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
                                    height: 4.h,
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
                                    width: 73.w,
                                    height: 5.h,
                                  )
                                : SizedBox(height: 4.h),
                            SizedBox(height: 20.h),
                            Text(
                              'Comments',
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
                                    width: 57.w,
                                    height: 5.h,
                                  )
                                : SizedBox(height: 4.h),
                            SizedBox(height: 20.h),
                            Text(
                              'Friends',
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
                                    width: 68.w,
                                    height: 5.h,
                                  )
                                : SizedBox(height: 4.h),
                            SizedBox(height: 20.h),
                            Text(
                              'Followers',
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
                              width: 68.w,
                              height: 5.h,
                            )
                                : SizedBox(height: 4.h),
                            SizedBox(height: 20.h),
                            Text(
                              'Login/out',
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
                              width: 46.w,
                              height: 5.h,
                            )
                                : SizedBox(height: 4.h),
                            SizedBox(height: 20.h),
                            Text(
                              'Block',
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
                          Navigator.pop(context);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 2.w, vertical: 2.h),
                        margin: EdgeInsets.only(left: 24.w, right: 32.w),
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
              )
            ],
          ),
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.h),
          child: AppBar(
              elevation: 0,
              backgroundColor: HexColor('#FFFFFF'),
              flexibleSpace: Center(
                child: Padding(
                  padding: EdgeInsets.only(right: 24.w, left: 24.w, top: 40.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // SvgPicture.asset('images/icons/icons.png'),
                      Container(
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: SvgPicture.asset(
                                'images/arrow_back.svg',
                                width: 10.w,
                                height: 16.h,
                                color: HexColor('#333333'),
                              ),
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            Text(
                              'Activities Log',
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  color: HexColor('#333333'),
                                  fontFamily: 'BreeSerif'),
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(width: 60.w),
                      Container(
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, '/new_post_screen');
                              },
                              child: SvgPicture.asset(
                                'images/addPost.svg',
                                width: 16.w,
                                height: 16.h,
                                color: HexColor('#333333'),
                              ),
                            ),
                            SizedBox(width: 24.w),
                            SvgPicture.asset(
                              'images/notificationIcon.svg',
                              width: 20.w,
                              height: 20.h,
                              color: HexColor('#333333'),
                            ),
                            SizedBox(width: 24.w),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  Navigator.pushNamed(
                                      context, '/messanger_screen');
                                });
                              },
                              child: SvgPicture.asset(
                                'images/messengerIcon.svg',
                                width: 20.w,
                                height: 20.h,
                                color: HexColor('#333333'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ),
        body: Stack(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
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
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                    child: ListView(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Aug, 28,2024',
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      color: HexColor('#333333').withOpacity(0.7),
                                      fontFamily: 'BreeSerif'),
                                ),
                                ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: 3,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(top: 12.h),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 46.w,
                                            height: 46.h,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(50.sp),
                                                color: Colors.red),
                                            clipBehavior: Clip.antiAlias,
                                            child: Image.asset(
                                              'images/userIcon.png',
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 12.w, vertical: 6.h),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'You visited on Difaf Al- wafa',
                                                  style: TextStyle(
                                                      fontSize: 13.sp,
                                                      color: HexColor('#333333'),
                                                      fontFamily: 'BreeSerif'),
                                                ),
                                                Text(
                                                  '“Yasser Al-Sayed”',
                                                  style: TextStyle(
                                                      fontSize: 10.sp,
                                                      color: HexColor('#819192'),
                                                      fontFamily: 'BreeSerif'),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Spacer(),
                                          SvgPicture.asset(
                                            'images/delete__icon.svg',
                                            width: 16.w,
                                            height: 20.h,
                                            color: HexColor('#F12323'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(height: 18.h),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  // _primaryPageModel[_selectedIndex].widget,
                ),
              ],
            ),
            // _selectedDrawer == 8 ? _primaryPageModel[_selectedDrawer].widget : SizedBox()
          ],
        ),
      ),
    );
  }
}
