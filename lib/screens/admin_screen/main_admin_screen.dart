import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:difaf_al_wafa_app/screens/admin_screen/request_details_screen.dart';
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
import '../../controllers/firebase_controllers/fb_firestore_controller.dart';
import '../../models/martyr_models/martyr_profile_data_model.dart';
import '../../models/martyr_models/martyr_request_data_model.dart';
import '../../models/screen_models/primary_page_model.dart';
import '../nav_bar_screens/other_main_screens/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class MainRequestScreen extends StatefulWidget {
  MainRequestScreen({Key? key, required this.selectedIndex}) : super(key: key);
  int selectedIndex;

  @override
  State<MainRequestScreen> createState() => _MainRequestScreenState();
}

class _MainRequestScreenState extends State<MainRequestScreen> {
  late TextEditingController _newPostTextEditingController;
  late TextEditingController _searchTextEditingController;
  String? _emailErrorText;
  String? _passwordErrorText;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _newPostTextEditingController = TextEditingController();
    _searchTextEditingController = TextEditingController();
  }

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
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                  // shrinkWrap: true,
                  children: [
                    Text(
                      'New Request',
                      style: TextStyle(
                        fontFamily: 'BreeSerif',
                        fontSize: 14.sp,
                        color: HexColor('#333333').withOpacity(0.7),
                      ),
                    ),
                    StreamBuilder<QuerySnapshot>(
                      stream: FbFireStoreController().readMartyrRequest(),
                      // stream: FbFireStoreController().readMartyrRequest().where(Function(QuerySnapshot<String?>) test),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                          List<QueryDocumentSnapshot> document =
                              snapshot.data!.docs; // عشان اقدر اجيب طولها
                          return ListView.builder(
                            itemCount: document.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                            return ListTile(
                              onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) {
                              return RequestDetailsScreen(martyrRequestDataModel: mapMartyrRequestDataModel(document[index]));
                            },)),
                              contentPadding: EdgeInsets.zero,
                              leading: Container(
                                width: 50.w,
                                height: 50.w,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50.sp)),
                                child: CachedNetworkImage(
                                  imageUrl:  document[index].get('userDataId'),
                                  width: 50.w,
                                  height: 50.w,
                                  fit: BoxFit.cover,
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                      CircularProgressIndicator(
                                          value: downloadProgress.progress),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ),
                              title: Text(
                                  document[index].get('fullUserName'),
                                style: TextStyle(
                                  fontFamily: 'BreeSerif',
                                  fontSize: 13.sp,
                                  color: HexColor('#333333'),
                                ),
                              ),
                              subtitle: Text(
                                'Add a new account of the martyr ${ document[index].get('fullMartyrName')}',
                                style: TextStyle(
                                  fontFamily: 'BreeSerif',
                                  fontSize: 10.sp,
                                  color: HexColor('#333333').withOpacity(0.5),
                                ),
                              ),
                              // trailing: Container(
                              //   decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(50.sp),
                              //       color: HexColor('#333333')),
                              //   child: Row(
                              //     children: [
                              //       SvgPicture.asset(
                              //         'images/addPost.svg',
                              //         width: 20.w,
                              //         height: 20.h,
                              //         color: HexColor('#FFFFFF'),
                              //       ),
                              //       SizedBox(width: 6.w),
                              //       Text(
                              //         'Accept',
                              //         style: TextStyle(
                              //           fontFamily: 'BreeSerif',
                              //           fontSize: 9.sp,
                              //           color: HexColor('#FFFFFF'),
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                            );
                          },);
                        } else {
                          return Center(
                            child: Column(
                              children: const [
                                Icon(
                                  Icons.signal_cellular_nodata,
                                  size: 85,
                                ),
                                Text('No Data'),
                              ],
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
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

  MartyrRequestDataModel mapMartyrRequestDataModel(QueryDocumentSnapshot documentSnapshot) {

    MartyrRequestDataModel martyrRequestDataModel = MartyrRequestDataModel();

    martyrRequestDataModel.firstIdentifiersPhoneNumber = documentSnapshot.get('firstIdentifiersPhoneNumber');
    martyrRequestDataModel.firstIdentifiersIDNumber = documentSnapshot.get('firstIdentifiersIDNumber');
    martyrRequestDataModel.dateOfBirthMartyr = documentSnapshot.get('dateOfBirthMartyr');
    martyrRequestDataModel.martyrIdNumber = documentSnapshot.get('martyrIdNumber');
    martyrRequestDataModel.fullMartyrName = documentSnapshot.get('fullMartyrName');
    martyrRequestDataModel.deathCertificate = documentSnapshot.get('deathCertificate');
    martyrRequestDataModel.placeOfMartyrdom = documentSnapshot.get('placeOfMartyrdom');
    martyrRequestDataModel.dateOfMartyrdom = documentSnapshot.get('dateOfMartyrdom');
    martyrRequestDataModel.userPhoneNumber = documentSnapshot.get('userPhoneNumber');
    martyrRequestDataModel.userIDNumber = documentSnapshot.get('userIDNumber');
    martyrRequestDataModel.fullUserName = documentSnapshot.get('fullUserName');
    martyrRequestDataModel.fullFirstIdentifiersName = documentSnapshot.get('fullFirstIdentifiersName');
    martyrRequestDataModel.userIDCertificate = documentSnapshot.get('userIDCertificate');
    martyrRequestDataModel.status = documentSnapshot.get('status');
    martyrRequestDataModel.userDataId = documentSnapshot.get('userDataId');
    martyrRequestDataModel.martyrRequestId = documentSnapshot.get('martyrRequestId');

    return martyrRequestDataModel;
  }

}
