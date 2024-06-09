import 'package:difaf_al_wafa_app/screens/nav_bar_screens/community_screens/initiatives_screen.dart';
import 'package:difaf_al_wafa_app/screens/nav_bar_screens/community_screens/support_groups_screen.dart';
import 'package:difaf_al_wafa_app/screens/nav_bar_screens/martyrs_screens/martyrs_profiles_screen.dart';
import 'package:difaf_al_wafa_app/screens/nav_bar_screens/martyrs_screens/martyrs_stories_screen.dart';
import 'package:difaf_al_wafa_app/screens/nav_bar_screens/resources_screens/articles_screen.dart';
import 'package:difaf_al_wafa_app/screens/nav_bar_screens/resources_screens/documented_event_screen.dart';
import 'package:difaf_al_wafa_app/screens/nav_bar_screens/settings_screen.dart';
import 'package:difaf_al_wafa_app/screens/drawer_menu_Screens/drawer_menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../model/primary_page_model.dart';
import '../nav_bar_screens/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  bool isDrawableVisible = false;

  // todo: List of Screens
  final List<PrimaryPageModel> _primaryPageModel = <PrimaryPageModel>[
    PrimaryPageModel(title: 'Difaf Al-wafa', widget: HomeScreen()),
    PrimaryPageModel(
        title: 'Martyrs Profiles', widget: MartyrsProfilesScreen()),
    PrimaryPageModel(title: 'Initiatives', widget: InitiativesScreen()),
    PrimaryPageModel(title: 'Document Event', widget: DocumentedEventScreen()),
    PrimaryPageModel(title: 'Settings', widget: SettingsScreen()),
    PrimaryPageModel(title: 'Martyrs Stories', widget: MartyrsStoriesScreen()),
    PrimaryPageModel(title: 'Support Groups', widget: SupportGroupsScreen()),
    PrimaryPageModel(title: 'Articles', widget: ArticlesScreen()),
    // PrimaryPageModel(title: 'DrawerMenuScreen', widget: DrawerMenuScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#333333"),
      // Bottom Navigation Bar
      bottomNavigationBar: isDrawableVisible
          ? null
          : Container(
              height: 72.0, // Set the height here
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Home Button
                      InkWell(
                        onTap: () {
                          setState(() {
                            _selectedIndex = 0;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _selectedIndex == 0
                                ? Container(
                                    margin: EdgeInsets.only(bottom: 7.h),
                                    width: 46.w,
                                    height: 5.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(5.sp),
                                        bottomRight: Radius.circular(5.sp),
                                      ),
                                      color: HexColor('#6699CC'),
                                    ),
                                  )
                                : SizedBox(height: 10.h),
                            SizedBox(
                              height: 15.h,
                            ),
                            SvgPicture.asset(
                              'images/Home.svg',
                              height: 24.h,
                              width: 24.w,
                              color: _selectedIndex == 0
                                  ? HexColor('#6699CC')
                                  : Colors.white,
                            ),
                          ],
                        ),
                      ),
                      // Martyrs Button
                      InkWell(
                        onTap: () {
                          setState(() {
                            print('Home Page01');
                            _selectedIndex = 1;
                            print('ggggggg');
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _selectedIndex == 1 || _selectedIndex == 5
                                ? Container(
                                    margin: EdgeInsets.only(bottom: 7.h),
                                    width: 46.w,
                                    height: 5.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(5.sp),
                                        bottomRight: Radius.circular(5.sp),
                                      ),
                                      color: HexColor('#6699CC'),
                                    ),
                                  )
                                : SizedBox(height: 10.h),
                            SizedBox(
                              height: 15.h,
                            ),
                            SvgPicture.asset(
                              'images/martyrsIcon.svg',
                              height: 24.h,
                              width: 24.w,
                              color: _selectedIndex == 1 || _selectedIndex == 5
                                  ? HexColor('#6699CC')
                                  : Colors.white,
                            ),
                          ],
                        ),
                      ),
                      // Community Button
                      InkWell(
                        onTap: () {
                          setState(() {
                            _selectedIndex = 2;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _selectedIndex == 2 || _selectedIndex == 6
                                ? Container(
                                    margin: EdgeInsets.only(bottom: 7.h),
                                    width: 46.w,
                                    height: 5.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(5.sp),
                                        bottomRight: Radius.circular(5.sp),
                                      ),
                                      color: HexColor('#6699CC'),
                                    ),
                                  )
                                : SizedBox(height: 10.h),
                            SizedBox(
                              height: 15.h,
                            ),
                            SvgPicture.asset(
                              'images/communityIcon.svg',
                              height: 24.h,
                              width: 24.w,
                              color: _selectedIndex == 2 || _selectedIndex == 6
                                  ? HexColor('#6699CC')
                                  : Colors.white,
                            ),
                          ],
                        ),
                      ),
                      // Resource Button
                      InkWell(
                        onTap: () {
                          setState(() {
                            _selectedIndex = 3;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _selectedIndex == 3 || _selectedIndex == 7
                                ? Container(
                                    margin: EdgeInsets.only(bottom: 7.h),
                                    width: 46.w,
                                    height: 5.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(5.sp),
                                        bottomRight: Radius.circular(5.sp),
                                      ),
                                      color: HexColor('#6699CC'),
                                    ),
                                  )
                                : SizedBox(height: 10.h),
                            SizedBox(
                              height: 15.h,
                            ),
                            SvgPicture.asset(
                              'images/resource.svg',
                              height: 24.h,
                              width: 24.w,
                              color: _selectedIndex == 3 || _selectedIndex == 7
                                  ? HexColor('#6699CC')
                                  : Colors.white,
                            ),
                          ],
                        ),
                      ),
                      // Settings Button
                      InkWell(
                        onTap: () {
                          setState(() {
                            _selectedIndex = 4;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _selectedIndex == 4
                                ? Container(
                                    margin: EdgeInsets.only(bottom: 7.h),
                                    width: 46.w,
                                    height: 5.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(5.sp),
                                        bottomRight: Radius.circular(5.sp),
                                      ),
                                      color: HexColor('#6699CC'),
                                    ),
                                  )
                                : SizedBox(height: 10.h),
                            SizedBox(
                              height: 15.h,
                            ),
                            SvgPicture.asset(
                              'images/settingsIcons.svg',
                              height: 24.h,
                              width: 24.w,
                              color: _selectedIndex == 4
                                  ? HexColor('#6699CC')
                                  : Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
      // App Bar Widget
      appBar: isDrawableVisible
          ? null
          : PreferredSize(
              preferredSize: Size.fromHeight(70.h),
              child: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  flexibleSpace: Center(
                    child: Padding(
                      padding:
                          EdgeInsets.only(right: 24.w, left: 24.w, top: 40.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // TODO: Menu Button
                          InkWell(
                            onTap: () => toggleDrawableVisibility(),
                            child: Container(
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    'images/icons.svg',
                                    width: 20.w,
                                    height: 20.h,
                                    color: HexColor('#333333'),
                                  ),
                                  SizedBox(
                                    width: 16.w,
                                  ),
                                  // Screen Name
                                  Text(
                                    _primaryPageModel[_selectedIndex].title,
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        color: HexColor('#333333'),
                                        fontFamily: 'BreeSerif'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // TODO: Action Button
                          Container(
                            child: Row(
                              children: [
                                _selectedIndex == 0
                                    ? InkWell(
                                        onTap: () => Navigator.pushNamed(
                                            context, '/search_screen'),
                                        child: SvgPicture.asset(
                                          'images/searchIcon.svg',
                                          width: 20.w,
                                          height: 20.h,
                                          color: HexColor('#333333'),
                                        ),
                                      )
                                    : InkWell(
                                        onTap: () {
                                          // Navigator.pushNamed(
                                          //     context, '/new_post_screen');
                                          _selectedIndex == 1 ||
                                                  _selectedIndex == 2 ||
                                                  _selectedIndex == 5 ||
                                                  _selectedIndex == 6
                                              ? _showChooseAddWhatDialog()
                                              : Navigator.pushNamed(
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
                                InkWell(
                                  onTap: () => Navigator.pushNamed(
                                      context, '/notifications_screen'),
                                  child: SvgPicture.asset(
                                    'images/notificationIcon.svg',
                                    width: 20.w,
                                    height: 20.h,
                                    color: HexColor('#333333'),
                                  ),
                                ),
                                SizedBox(width: 24.w),
                                InkWell(
                                  onTap: () => Navigator.pushNamed(
                                      context, '/messanger_screen'),
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
                  children: [
                    _selectedIndex == 0
                        // todo: Create new Post in HomeScreen
                        ? InkWell(
                            onTap: () => Navigator.pushNamed(
                                context, '/new_post_screen'),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 15.h, right: 24.w, left: 24.w),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    // color: HexColor('#D6E0E6'),
                                    borderRadius: BorderRadius.circular(15.sp),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'images/userIcon.png',
                                        width: 32.w,
                                        height: 32.h,
                                      ),
                                      SizedBox(width: 15.w),
                                      Text(
                                        'What is on yor mind?',
                                        style: TextStyle(
                                          fontFamily: 'BreeSerif',
                                          fontSize: 14.sp,
                                          color: HexColor('#999999'),
                                        ),
                                      ),
                                      Spacer(),
                                      SvgPicture.asset(
                                        'images/audioIcon.svg',
                                        width: 24.w,
                                        height: 24.h,
                                        color: HexColor('#333333'),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Divider(
                                  thickness: 1,
                                  endIndent: 24.w,
                                  indent: 24.w,
                                )
                              ],
                            ),
                          )
                        : _selectedIndex == 4
                            ? SizedBox()
                            // todo: add Search container in other Screens
                            : InkWell(
                                onTap: () => Navigator.pushNamed(
                                    context, 'search_screen'),
                                child: Container(
                                  margin: EdgeInsets.only(
                                      top: 24.h, right: 24.w, left: 24.w),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.w, vertical: 6.h),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: HexColor('#D6E0E6'),
                                    borderRadius: BorderRadius.circular(15.sp),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(
                                        'images/searchIcon.svg',
                                        width: 24.w,
                                        height: 24.h,
                                        color: HexColor('#333333'),
                                      ),
                                      SizedBox(width: 6.w),
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Find what\'s on your mind',
                                          style: TextStyle(
                                            fontFamily: 'BreeSerif',
                                            fontSize: 13.sp,
                                            color: HexColor('#474747'),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 65.w),
                                      SvgPicture.asset(
                                        'images/filterIcon.svg',
                                        width: 24.w,
                                        height: 24.h,
                                        color: HexColor('#333333'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                    // todo: Show content Screen
                    _primaryPageModel[_selectedIndex].widget,
                  ],
                ),
                // _primaryPageModel[_selectedIndex].widget,
              ),
              // todo: Show one of the double pages Martyrs Screens
              _selectedIndex == 1 || _selectedIndex == 5
                  ? Container(
                      margin: EdgeInsets.only(
                          bottom: 24.h, right: 30.w, left: 30.w),
                      padding: EdgeInsets.symmetric(
                          horizontal: 32.w, vertical: 16.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.sp),
                        color: HexColor('#333333'),
                      ),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            child: Text(
                              'Martyrs Profiles',
                              style: TextStyle(
                                fontFamily: 'BreeSerif',
                                fontSize: 14.sp,
                                color: _selectedIndex == 1
                                    ? HexColor('#FFFFFF')
                                    : HexColor('#8C9EA0'),
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                _selectedIndex = 1;
                              });
                            },
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 20.w,
                                right: _selectedIndex == 7 ? 39.w : 20.w),
                            alignment: AlignmentDirectional.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.h),
                            ),
                            width: 4.w,
                            height: 24.h,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _selectedIndex = 5;
                              });
                            },
                            child: Text(
                              'Martyrs Stories',
                              style: TextStyle(
                                fontFamily: 'BreeSerif',
                                fontSize: 14.sp,
                                color: _selectedIndex == 5
                                    ? HexColor('#FFFFFF')
                                    : HexColor('#8C9EA0'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : SizedBox(),
              // todo: Show one of the double pages Community Screens
              _selectedIndex == 2 || _selectedIndex == 6
                  ? Container(
                      margin: EdgeInsets.only(
                          bottom: 24.h, right: 30.w, left: 30.w),
                      padding: EdgeInsets.symmetric(
                          horizontal: 32.w, vertical: 16.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.sp),
                        color: HexColor('#333333'),
                      ),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 20.w,
                          ),
                          InkWell(
                            child: Text(
                              'Initiatives',
                              style: TextStyle(
                                fontFamily: 'BreeSerif',
                                fontSize: 14.sp,
                                color: _selectedIndex == 2
                                    ? HexColor('#FFFFFF')
                                    : HexColor('#8C9EA0'),
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                _selectedIndex = 2;
                              });
                            },
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 38.w, right: 24.w),
                            alignment: AlignmentDirectional.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.h),
                            ),
                            width: 4.w,
                            height: 24.h,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _selectedIndex = 6;
                              });
                            },
                            child: Text(
                              'Support Groups',
                              style: TextStyle(
                                fontFamily: 'BreeSerif',
                                fontSize: 14.sp,
                                color: _selectedIndex == 6
                                    ? HexColor('#FFFFFF')
                                    : HexColor('#8C9EA0'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : SizedBox(),
              // todo: Show one of the double pages Resources Screens
              _selectedIndex == 3 || _selectedIndex == 7
                  ? Container(
                      margin: EdgeInsets.only(
                          bottom: 24.h, right: 30.w, left: 30.w),
                      padding: EdgeInsets.symmetric(
                          horizontal: 18.w, vertical: 16.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.sp),
                        color: HexColor('#333333'),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                _selectedIndex = 3;
                              });
                            },
                            child: Text(
                              'Document Events',
                              style: TextStyle(
                                fontFamily: 'BreeSerif',
                                fontSize: 14.sp,
                                color: _selectedIndex == 3
                                    ? HexColor('#FFFFFF')
                                    : HexColor('#8C9EA0'),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 39.w, left: 20.w),
                            alignment: AlignmentDirectional.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.h),
                            ),
                            width: 4.w,
                            height: 24.h,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _selectedIndex = 7;
                              });
                            },
                            child: Text(
                              'Articles',
                              style: TextStyle(
                                fontFamily: 'BreeSerif',
                                fontSize: 14.sp,
                                color: _selectedIndex == 7
                                    ? HexColor('#FFFFFF')
                                    : HexColor('#8C9EA0'),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20.w,
                          )
                        ],
                      ),
                    )
                  : SizedBox()
            ],
          ),
          Visibility(
              visible: isDrawableVisible,
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      print('object');
                      toggleDrawableVisibility();
                    },
                    child: Container(
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  DrawerMenuScreen(),
                ],
              )),
        ],
      ),
    );
  }

  void toggleDrawableVisibility() {
    setState(() {
      isDrawableVisible = !isDrawableVisible;
    });
  }

  void _showChooseAddWhatDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          alignment: AlignmentDirectional.bottomCenter,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          content: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            width: 360.w,
            height: 85.h,
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/new_post_screen');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Create Post',
                        style: TextStyle(
                          fontFamily: 'BreeSerif',
                          fontSize: 13.sp,
                          color: HexColor('#333333'),
                        ),
                      ),
                      SvgPicture.asset(
                        'images/arrowForword.svg',
                        width: 8.w,
                        height: 14.h,
                        color: HexColor('#333333'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.h),
                Divider(
                  height: 1,
                  thickness: 1,
                  color: HexColor('#333333').withOpacity(0.3),
                ),
                SizedBox(height: 10.h),
                InkWell(
                  onTap: () {
                    _selectedIndex == 1
                        ? Navigator.pushNamed(
                            context, 'Add New Martyrs Profile')
                        : _selectedIndex == 2
                            ? Navigator.pushNamed(context, 'Add New Initiative')
                            : _selectedIndex == 5
                                ? Navigator.pushNamed(
                                    context, 'Add new Martyrs Story')
                                : _selectedIndex == 5
                                    ? Navigator.pushNamed(
                                        context, 'Add New Group')
                                    : Navigator.pushNamed(
                                        context, '/new_post_screen');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _selectedIndex == 1
                            ? 'Create New Martyrs Profile'
                            : _selectedIndex == 2
                                ? 'Create New Initiative'
                                : _selectedIndex == 5
                                    ? 'Create new Martyrs Story'
                                    : 'Create New Group',
                        style: TextStyle(
                          fontFamily: 'BreeSerif',
                          fontSize: 13.sp,
                          color: HexColor('#333333'),
                        ),
                      ),
                      SvgPicture.asset(
                        'images/arrowForword.svg',
                        width: 8.w,
                        height: 14.h,
                        color: HexColor('#333333'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
