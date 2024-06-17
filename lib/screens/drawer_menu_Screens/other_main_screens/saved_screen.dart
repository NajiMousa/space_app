import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';


class SavedScreen extends StatefulWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
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
                                    width: 103.w,
                                    height: 5.h,
                                  )
                                : SizedBox(height: 4.h),
                            SizedBox(height: 20.h),
                            Text(
                              'Martyrs Stories',
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
                                    width: 60.w,
                                    height: 5.h,
                                  )
                                : SizedBox(height: 4.h),
                            SizedBox(height: 20.h),
                            Text(
                              'Articles',
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
                                    width: 45.w,
                                    height: 5.h,
                                  )
                                : SizedBox(height: 4.h),
                            SizedBox(height: 20.h),
                            Text(
                              'Posts',
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
                              'Saved',
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
                        EdgeInsets.symmetric(horizontal: 24.w),
                    child: ListView(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 18.h),
                        Text(
                          'Most Recent',
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: HexColor('#333333').withOpacity(0.7),
                              fontFamily: 'BreeSerif'),
                        ),
                        SizedBox(height: 4.h),
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Container(
                                  width: 64.w,
                                  height: 64.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.sp),
                                      color: Colors.red),
                                  clipBehavior: Clip.antiAlias,
                                  child: Image.asset(
                                    'images/backgroundPost.png',
                                    // width: 64.w,
                                    // height: 72.h,
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
                                        'Help Baby Alma, Little Hamood and \n family survive!',
                                        style: TextStyle(
                                            fontSize: 13.sp,
                                            color: HexColor('#333333'),
                                            fontFamily: 'BreeSerif'),
                                      ),
                                      Text(
                                        'Martyrs Stories Post',
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            color: HexColor('#819192'),
                                            fontFamily: 'BreeSerif'),
                                      ),
                                      Text(
                                        'Saved 3w ago',
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            color: HexColor('#819192'),
                                            fontFamily: 'BreeSerif'),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  child: Transform.rotate(
                                    angle: 3.15,
                                    child: SvgPicture.asset(
                                      'images/icons.svg',
                                      width: 20.w,
                                      height: 16.h,
                                      color: HexColor('#8C9EA0'),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        SizedBox(height: 6.h),
                        Container(
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
                                  'See more',
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
                        SizedBox(height: 18.h),
                        Text(
                          'Your Collection',
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: HexColor('#333333').withOpacity(0.7),
                              fontFamily: 'BreeSerif'),
                        ),
                        SizedBox(height: 12.h),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: double.infinity,
                            maxHeight: 245,
                          ),
                          child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3, // Number of columns
                                    crossAxisSpacing: 12.w,
                                    mainAxisSpacing: 12.h,
                                    childAspectRatio: 1),
                            // scrollDirection: Axis.horizontal,
                            itemCount: 6,
                            itemBuilder: (context, index) {
                              if (index == 0) {
                                return Container(
                                  width: 106.w,
                                  height: 106.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.sp),
                                    color: HexColor('#333333'),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        'images/addPost.svg',
                                        height: 24.h,
                                        width: 24.w,
                                        color: Colors.white,
                                      ),
                                      SizedBox(height: 6.h),
                                      Text(
                                        'Add Collection',
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: HexColor('#FFFFFF').withOpacity(0.7),
                                            fontFamily: 'BreeSerif'),
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                return Stack(
                                  alignment: AlignmentDirectional.bottomStart,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15.sp),
                                          color: Colors.red),
                                      child: Image.asset(
                                        'images/coverImage.png',
                                        fit: BoxFit.fill,
                                        height: double.infinity,
                                      ),
                                      clipBehavior: Clip.antiAlias,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(12.sp),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(15.sp),
                                            bottomRight:
                                                Radius.circular(15.sp)),
                                        color: HexColor('#333333')
                                            .withOpacity(0.7),

                                      ),
                                      width: double.infinity,
                                      child: Text(
                                        'Articles',
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            color: HexColor('#FFFFFF'),
                                            fontFamily: 'BreeSerif'),
                                      ),
                                    ),
                                  ],
                                );
                              }
                            },
                          ),
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
