import 'package:difaf_al_wafa_app/screens/drawer_menu_Screens/messanger_screens/single_messanger_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../widgets/add_story_widget.dart';
import '../../widgets/users_storys_widget.dart';

class MessangerScreen extends StatefulWidget {
  const MessangerScreen({Key? key}) : super(key: key);

  @override
  State<MessangerScreen> createState() => _MessangerScreenState();
}

class _MessangerScreenState extends State<MessangerScreen> {
  int _selectedTypeMessanger = 0;
  bool hasAddedStory = false;
  bool isActive = true;
  bool isClickOnMoreIcon = false;

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
                                    width: 52.w,
                                    height: 5.h,
                                  )
                                : SizedBox(height: 4.h),
                            SizedBox(height: 20.h),
                            Text(
                              'unread',
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
                                : SizedBox(height: 4.h),
                            SizedBox(height: 20.h),
                            Text(
                              'Archive',
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
                                    width: 126.w,
                                    height: 5.h,
                                  )
                                : SizedBox(height: 4.h),
                            SizedBox(height: 20.h),
                            Text(
                              'Message Requests',
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
                              'Messanger',
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
                  child: ListView(
                    // shrinkWrap: true,
                    // physics: NeverScrollableScrollPhysics(),
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          // maxWidth: double.infinity,
                          maxHeight: 110.h,
                        ),
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1, // Number of columns
                                  crossAxisSpacing: 12.w,
                                  // mainAxisSpacing: 12.h,
                                  childAspectRatio: 76 / 56),
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          padding: EdgeInsets.only(
                              top: 18.h, left: 24.w, right: 24.w),
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return AddStoryWidget(
                                  hasAddedStory: hasAddedStory);
                            } else {
                              return UsersStorysWidget(
                                index: index,
                                isActive: isActive,
                              );
                            }
                          },
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: 15,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ListTile(
                              onTap: () {
                                print('object');
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return SingleMessangerScreen();
                                  },
                                ));
                              },
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 24.w),
                              leading: Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: HexColor('#21CED9'),
                                      borderRadius:
                                          BorderRadius.circular(56.sp),
                                    ),
                                    width: 50.w,
                                    height: 50.h,
                                  ),
                                  Image.asset(
                                    'images/userIcon.png',
                                    width: 46.w,
                                    height: 46.w,
                                  ),
                                ],
                              ),
                              title: Text(
                                'Mohammed Yusef',
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    color: HexColor('#333333'),
                                    fontFamily: 'BreeSerif'),
                              ),
                              subtitle: Row(
                                children: [
                                  Text(
                                    'Hello Yasser .How are you?',
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        color: HexColor('#6699CC'),
                                        fontFamily: 'BreeSerif'),
                                  ),
                                  SizedBox(width: 6.w),
                                  Text(
                                    '09:23 PM',
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        color: HexColor('#FF555F'),
                                        fontFamily: 'BreeSerif'),
                                  ),
                                ],
                              ),
                              trailing: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 6.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.sp),
                                  color: HexColor('#333333'),
                                ),
                                child: Text(
                                  '2',
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      color: HexColor('#FFFFFF'),
                                      fontFamily: 'BreeSerif'),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 18.h),
                    ],
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
