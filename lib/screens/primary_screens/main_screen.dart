import 'package:cached_network_image/cached_network_image.dart';
import 'package:difaf_al_wafa_app/screens/nav_bar_screens/community_screens/initiatives_screen.dart';
import 'package:difaf_al_wafa_app/screens/nav_bar_screens/community_screens/support_groups_screen.dart';
import 'package:difaf_al_wafa_app/screens/nav_bar_screens/martyrs_screens/martyrs_profiles_screen.dart';
import 'package:difaf_al_wafa_app/screens/nav_bar_screens/martyrs_screens/martyrs_stories_screen.dart';
import 'package:difaf_al_wafa_app/screens/nav_bar_screens/resources_screens/articles_screen.dart';
import 'package:difaf_al_wafa_app/screens/nav_bar_screens/resources_screens/documented_event_screen.dart';
import 'package:difaf_al_wafa_app/screens/nav_bar_screens/other_main_screens/settings_screen.dart';
import 'package:difaf_al_wafa_app/screens/drawer_menu_Screens/drawer_menu_screen.dart';
import 'package:difaf_al_wafa_app/screens/widgets/app_widgets/app_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../../controllers/firebase_controllers/fb_firestore_controller.dart';
import '../../models/screen_models/primary_page_model.dart';
import '../../models/user_models/user_profile_data_model.dart';
import '../../prefs/shared_pref_controller.dart';
import '../../providers/data_provider.dart';
import '../nav_bar_screens/other_main_screens/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

import '../widgets/app_widgets/loader_widgets/shimmer_placeholder.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key, required this.selectedIndex}) : super(key: key);
  int selectedIndex;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late TextEditingController _newPostTextEditingController;
  late TextEditingController _searchTextEditingController;
  String? _emailErrorText;
  String? _passwordErrorText;
  UserProfileDataModel? _userProfileData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // SharedPrefController().saveUserIdRegistration(userIdRegistration: '2cb4b32c-81c0-4b2d-bc78-c471d7f8ca1e');
    // SharedPrefController().saveUserDataId(userDataId: '3abd8c17-1983-4423-bdb0-8c79f436ea4f');
    // _loadUserData();
    _newPostTextEditingController = TextEditingController();
    _searchTextEditingController = TextEditingController();
  }

  // Future<void> _loadUserData() async {
  //   List<UserProfileDataModel> userData =
  //   await FbFireStoreController().getAllUserData();
  //   print(SharedPrefController().userDataId);
  //   print('SharedPrefController().userDataId');
  //   setState(() {
  //     _userProfileData = userData
  //         .firstWhere((user) => user.userDataId == SharedPrefController().userDataId);
  //   });
  // }
  @override
  void dispose() {
    // TODO: implement dispose
    _newPostTextEditingController.dispose();
    _searchTextEditingController.dispose();
    super.dispose();
  }

  bool isDrawableVisible = false;

  // todo: List of Screens
  final List<PrimaryPageModel> _primaryPageModel = <PrimaryPageModel>[
    PrimaryPageModel(title: 'Space', widget: HomeScreen()),
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
    final userProfileData = Provider.of<DataProvider>(context).userProfileData;
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
                            widget.selectedIndex = 0;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            widget.selectedIndex == 0
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
                              color: widget.selectedIndex == 0
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
                            widget.selectedIndex = 1;
                            print('ggggggg');
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            widget.selectedIndex == 1 ||
                                    widget.selectedIndex == 5
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
                              color: widget.selectedIndex == 1 ||
                                      widget.selectedIndex == 5
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
                            widget.selectedIndex = 2;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            widget.selectedIndex == 2 ||
                                    widget.selectedIndex == 6
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
                              color: widget.selectedIndex == 2 ||
                                      widget.selectedIndex == 6
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
                            widget.selectedIndex = 3;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            widget.selectedIndex == 3 ||
                                    widget.selectedIndex == 7
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
                              color: widget.selectedIndex == 3 ||
                                      widget.selectedIndex == 7
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
                            widget.selectedIndex = 4;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            widget.selectedIndex == 4
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
                              color: widget.selectedIndex == 4
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
                  automaticallyImplyLeading: false,
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
                                    widget.selectedIndex == 0
                                        ? AppLocalizations.of(context)!.space
                                        : widget.selectedIndex == 1
                                            ? AppLocalizations.of(context)!
                                                .martyrsProfile
                                            : widget.selectedIndex == 2
                                                ? AppLocalizations.of(context)!
                                                    .initiatives
                                                : widget.selectedIndex == 3
                                                    ? AppLocalizations.of(
                                                            context)!
                                                        .documentEvents
                                                    : widget.selectedIndex == 4
                                                        ? AppLocalizations
                                                                .of(context)!
                                                            .settings
                                                        : widget.selectedIndex ==
                                                                5
                                                            ? AppLocalizations
                                                                    .of(
                                                                        context)!
                                                                .martyrsStories
                                                            : widget.selectedIndex ==
                                                                    6
                                                                ? AppLocalizations.of(
                                                                        context)!
                                                                    .supportGroups
                                                                : AppLocalizations.of(
                                                                        context)!
                                                                    .articles,
                                    // _primaryPageModel[widget.selectedIndex]
                                    //     .title,
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
                                widget.selectedIndex == 0
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
                                          widget.selectedIndex == 1 ||
                                                  widget.selectedIndex == 2 ||
                                                  widget.selectedIndex == 5 ||
                                                  widget.selectedIndex == 6
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
                child:
                // _userProfileData == null ? ShimmerPlaceholder() :
                ListView(
                  // shrinkWrap: true,
                  children: [
                    // SizedBox(height: 10.h),
                    widget.selectedIndex == 0
                        // todo: Create new Post in HomeScreen
                        ? InkWell(
                                onTap: () => Navigator.pushNamed(
                                    context, '/new_post_screen'),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 15.h, right: 24.w, left: 24.w),
                                      padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 18.w),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: HexColor('#333333'),
                                          width: 1.sp,
                                        ),
                                        // color: HexColor('#D6E0E6'),
                                        borderRadius: BorderRadius.circular(15.sp),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            // margin: EdgeInsets.only(left: 18.w),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(50.sp)),
                                            clipBehavior: Clip.antiAlias,
                                            width: 32.w,
                                            height: 32.w,
                                            child: CachedNetworkImage(
                                              imageUrl:
                                              userProfileData!.profileImageUrl,
                                              width: 32.w,
                                              height: 32.w,
                                              fit: BoxFit.cover,
                                              progressIndicatorBuilder: (context,
                                                  url, downloadProgress) =>Shimmer.fromColors(
                                                  baseColor: Colors.grey.shade300,
                                                  highlightColor: Colors.grey.shade100,
                                                  enabled: true,
                                                  child: Container(
                                                    width: 50.w,
                                                    height: 50.w,
                                                    clipBehavior: Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(50.sp)),)
                                              ),
                                              errorWidget: (context, url, error) =>
                                                  Icon(Icons.error),
                                            ),
                                          ),
                                          // Image.asset(
                                          //   'images/userIcon.png',
                                          //   width: 32.w,
                                          //   height: 32.h,
                                          // ),
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
                                    // SizedBox(
                                    //   height: 8.h,
                                    // ),
                                    // Divider(
                                    //   thickness: 1,
                                    //   endIndent: 24.w,
                                    //   indent: 24.w,
                                    // )
                                  ],
                                ),
                              )
                        : widget.selectedIndex == 4
                        ? SizedBox()
                        // todo: add Search container in other Screens
                        :
                    InkWell(
                      onTap: () => Navigator.pushNamed(
                          context, '/search_screen'),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                top: 15.h, right: 24.w, left: 24.w),
                            padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 18.w),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: HexColor('#333333'),
                                width: 1.sp,
                              ),
                              // color: HexColor('#D6E0E6'),
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
                                            'images/filterIcon.svg',
                                            width: 24.w,
                                            height: 24.h,
                                            color: HexColor('#333333'),
                                          ),
                                        ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // InkWell(
                    //             onTap: () => Navigator.pushNamed(
                    //                 context, 'search_screen'),
                    //             child: Container(
                    //               margin: EdgeInsets.only(
                    //                   top: 15.h, right: 24.w, left: 24.w),
                    //               padding: EdgeInsets.symmetric(
                    //                   horizontal: 20.w, vertical: 6.h),
                    //               width: double.infinity,
                    //               decoration: BoxDecoration(
                    //                 color: HexColor('#D6E0E6'),
                    //                 borderRadius: BorderRadius.circular(15.sp),
                    //               ),
                    //               child: Row(
                    //                 mainAxisAlignment: MainAxisAlignment.start,
                    //                 children: [
                    //                   SvgPicture.asset(
                    //                     'images/searchIcon.svg',
                    //                     width: 24.w,
                    //                     height: 24.h,
                    //                     color: HexColor('#333333'),
                    //                   ),
                    //                   SizedBox(width: 6.w),
                    //                   TextButton(
                    //                     onPressed: () {},
                    //                     child: Text(
                    //                       'Find what\'s on your mind',
                    //                       style: TextStyle(
                    //                         fontFamily: 'BreeSerif',
                    //                         fontSize: 13.sp,
                    //                         color: HexColor('#474747'),
                    //                       ),
                    //                     ),
                    //                   ),
                    //                   SizedBox(width: 65.w),
                    //                   SvgPicture.asset(
                    //                     'images/filterIcon.svg',
                    //                     width: 24.w,
                    //                     height: 24.h,
                    //                     color: HexColor('#333333'),
                    //                   ),
                    //                 ],
                    //               ),
                    //             ),
                    //           ),
                    Divider(
                      endIndent: 50,
                      indent: 50,
                      thickness: 1,
                      color: Colors.white,
                    ),

                    // todo: Show content Screen
                    _primaryPageModel[widget.selectedIndex].widget,
                  ],
                ),
                // _primaryPageModel[_selectedIndex].widget,
              ),
              // todo: Show one of the double pages Martyrs Screens
              widget.selectedIndex == 1 || widget.selectedIndex == 5
                  ? Container(
                      margin: EdgeInsets.only(
                          bottom: 24.h, right: 25.w, left: 25.w),
                      padding: EdgeInsets.symmetric(
                          horizontal: 32.w, vertical: 16.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.sp),
                        color: HexColor('#333333'),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            child: Text(
                              AppLocalizations.of(context)!.martyrsProfile,
                              style: TextStyle(
                                fontFamily: 'BreeSerif',
                                fontSize: 14.sp,
                                color: widget.selectedIndex == 1
                                    ? HexColor('#FFFFFF')
                                    : HexColor('#8C9EA0'),
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                widget.selectedIndex = 1;
                              });
                            },
                          ),
                          Container(
                            // margin: EdgeInsets.only(
                            //     left: 20.w,
                            //     right: widget.selectedIndex == 7 ? 39.w : 20.w),
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
                                widget.selectedIndex = 5;
                              });
                            },
                            child: Text(
                              AppLocalizations.of(context)!.martyrsStories,
                              style: TextStyle(
                                fontFamily: 'BreeSerif',
                                fontSize: 14.sp,
                                color: widget.selectedIndex == 5
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
              widget.selectedIndex == 2 || widget.selectedIndex == 6
                  ? Container(
                      margin: EdgeInsets.only(
                          bottom: 24.h, right: 25.w, left: 25.w),
                      padding: EdgeInsets.symmetric(
                          horizontal: 32.w, vertical: 16.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.sp),
                        color: HexColor('#333333'),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // SizedBox(
                          //   width: 20.w,
                          // ),
                          InkWell(
                            child: Text(
                              AppLocalizations.of(context)!.initiatives,
                              style: TextStyle(
                                fontFamily: 'BreeSerif',
                                fontSize: 14.sp,
                                color: widget.selectedIndex == 2
                                    ? HexColor('#FFFFFF')
                                    : HexColor('#8C9EA0'),
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                widget.selectedIndex = 2;
                              });
                            },
                          ),
                          Container(
                            // margin: EdgeInsets.only(left: 38.w, right: 24.w),
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
                                widget.selectedIndex = 6;
                              });
                            },
                            child: Text(
                              AppLocalizations.of(context)!.supportGroups,
                              style: TextStyle(
                                fontFamily: 'BreeSerif',
                                fontSize: 14.sp,
                                color: widget.selectedIndex == 6
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
              widget.selectedIndex == 3 || widget.selectedIndex == 7
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                widget.selectedIndex = 3;
                              });
                            },
                            child: Text(
                              AppLocalizations.of(context)!.documentEvents,
                              style: TextStyle(
                                fontFamily: 'BreeSerif',
                                fontSize: 14.sp,
                                color: widget.selectedIndex == 3
                                    ? HexColor('#FFFFFF')
                                    : HexColor('#8C9EA0'),
                              ),
                            ),
                          ),
                          Container(
                            // margin: EdgeInsets.only(right: 20.w, left: 20.w),
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
                                widget.selectedIndex = 7;
                              });
                            },
                            child: Text(
                              AppLocalizations.of(context)!.articles,
                              style: TextStyle(
                                fontFamily: 'BreeSerif',
                                fontSize: 14.sp,
                                color: widget.selectedIndex == 7
                                    ? HexColor('#FFFFFF')
                                    : HexColor('#8C9EA0'),
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   width: 20.w,
                          // )
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
            // padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            padding: EdgeInsets.only(top: 5.h),
            width: 360.w,
            height: 70.h,
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
                        AppLocalizations.of(context)!.createNewPost,
                        style: TextStyle(
                          fontFamily: 'BreeSerif',
                          fontSize: 13.sp,
                          color: HexColor('#45BD62'),
                        ),
                      ),
                      SvgPicture.asset(
                        'images/arrowForword.svg',
                        width: 8.w,
                        height: 14.h,
                        color: HexColor('#45BD62'),
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
                    widget.selectedIndex == 1
                        ? Navigator.pushNamed(
                            context, '/new _martyrs_profile_screen')
                        : widget.selectedIndex == 2
                            ? Navigator.pushNamed(
                                context, '/add_initiative_screen')
                            : widget.selectedIndex == 5
                                ? Navigator.pushNamed(
                                    context, '/new _martyrs_profile_screen')
                                : widget.selectedIndex == 6
                                    ? Navigator.pushNamed(
                                        context, '/add_group_screen')
                                    : Navigator.pushNamed(
                                        context, '/new_post_screen');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.selectedIndex == 1
                            ? AppLocalizations.of(context)!
                                .createNewMartyrsProfile
                            : widget.selectedIndex == 2
                                ? AppLocalizations.of(context)!
                                    .createNewInitiative
                                : widget.selectedIndex == 5
                                    ? AppLocalizations.of(context)!
                                        .createNewMartyrsProfile
                                    : AppLocalizations.of(context)!
                                        .createNewGroup,
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





