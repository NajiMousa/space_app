import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:difaf_al_wafa_app/models/initiative_models/initiative_data_model.dart';
import 'package:difaf_al_wafa_app/models/message_models/conversation_model.dart';
import 'package:difaf_al_wafa_app/prefs/shared_pref_controller.dart';
import 'package:difaf_al_wafa_app/screens/drawer_menu_Screens/messanger_screens/single_messanger_screen.dart';
import 'package:difaf_al_wafa_app/screens/edit_screens/edit_user_profile_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:shimmer/shimmer.dart';
import 'package:uuid/uuid.dart';
import '../../controllers/firebase_controllers/fb_firestore_controller.dart';
import '../../models/user_models/user_profile_data_model.dart';
import '../widgets/app_widgets/loader_widgets/shimmer_placeholder.dart';

class InitiativeDetailsScreen extends StatefulWidget {
  InitiativeDetailsScreen({Key? key, required this.initiativeDataModel})
      : super(key: key);

  InitiativeDataModel initiativeDataModel;

  @override
  State<InitiativeDetailsScreen> createState() =>
      _InitiativeDetailsScreenState();
}

class _InitiativeDetailsScreenState extends State<InitiativeDetailsScreen> {
  int _selectedTypeMessanger = 0;
  SharedPrefController sharedPrefController = SharedPrefController();
  UserProfileDataModel? _userProfileData;
  bool _isLoading = true;
  var uuid = Uuid();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    List<UserProfileDataModel> userData =
        await FbFireStoreController().getAllUserData();
    print(SharedPrefController().userIdRegistration);
    print('SharedPrefController().userIdRegistration');
    setState(() {
      _userProfileData = userData.firstWhere((user) =>
          user.userIdRegistration == SharedPrefController().userIdRegistration);
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#333333"),
      bottomNavigationBar: Container(
        height: 72.0, // Set the height here
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
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
                            width: sharedPrefController.language == 'en'
                                ? 29.w
                                : 40.w,
                            height: 5.h,
                          )
                        : SizedBox(
                            height: 5.h,
                          ),
                    SizedBox(height: 20.h),
                    Text(
                      AppLocalizations.of(context)!.all,
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
                            width: sharedPrefController.language == 'en'
                                ? 52.w
                                : 60.w,
                            height: 5.h,
                          )
                        : SizedBox(
                            height: 5.h,
                          ),
                    SizedBox(height: 20.h),
                    Text(
                      AppLocalizations.of(context)!.follower,
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
                            width: sharedPrefController.language == 'en'
                                ? 104.w
                                : 60.w,
                            height: 5.h,
                          )
                        : SizedBox(
                            height: 5.h,
                          ),
                    SizedBox(height: 20.h),
                    Text(
                      AppLocalizations.of(context)!.following,
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
                            width: sharedPrefController.language == 'en'
                                ? 104.w
                                : 70.w,
                            height: 5.h,
                          )
                        : SizedBox(
                            height: 5.h,
                          ),
                    SizedBox(height: 20.h),
                    Text(
                      AppLocalizations.of(context)!.friends,
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
                            width: sharedPrefController.language == 'en'
                                ? 52.w
                                : 60.w,
                            height: 5.h,
                          )
                        : SizedBox(
                            height: 5.h,
                          ),
                    SizedBox(height: 20.h),
                    Text(
                      AppLocalizations.of(context)!.post,
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
                            width: sharedPrefController.language == 'en'
                                ? 55.w
                                : 55.w,
                            height: 5.h,
                          )
                        : SizedBox(
                            height: 5.h,
                          ),
                    SizedBox(height: 20.h),
                    Text(
                      AppLocalizations.of(context)!.photos,
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
                            width: sharedPrefController.language == 'en'
                                ? 43.w
                                : 53.w,
                            height: 5.h,
                          )
                        : SizedBox(
                            height: 5.h,
                          ),
                    SizedBox(height: 20.h),
                    Text(
                      AppLocalizations.of(context)!.videos,
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
                  _selectedTypeMessanger = 7;
                });
              },
              child: Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _selectedTypeMessanger == 7
                        ? Container(
                            decoration: BoxDecoration(
                              color: HexColor('#6699CC'),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(5.sp),
                                bottomLeft: Radius.circular(5.sp),
                              ),
                            ),
                            width: sharedPrefController.language == 'en'
                                ? 73.w
                                : 83.w,
                            height: 5.h,
                          )
                        : SizedBox(
                            height: 5.h,
                          ),
                    SizedBox(height: 20.h),
                    Text(
                      AppLocalizations.of(context)!.highLights,
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: _selectedTypeMessanger == 7
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
                  _selectedTypeMessanger = 8;
                });
              },
              child: Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _selectedTypeMessanger == 8
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
                      AppLocalizations.of(context)!.articles,
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: _selectedTypeMessanger == 8
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
                  _selectedTypeMessanger = 9;
                });
              },
              child: Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _selectedTypeMessanger == 9
                        ? Container(
                            decoration: BoxDecoration(
                              color: HexColor('#6699CC'),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(5.sp),
                                bottomLeft: Radius.circular(5.sp),
                              ),
                            ),
                            width: sharedPrefController.language == 'en'
                                ? 45.w
                                : 55.w,
                            height: 5.h,
                          )
                        : SizedBox(
                            height: 5.h,
                          ),
                    SizedBox(height: 20.h),
                    Text(
                      AppLocalizations.of(context)!.links,
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: _selectedTypeMessanger == 9
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
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                margin: sharedPrefController.language == 'en'
                    ? EdgeInsets.only(left: 24.w)
                    : EdgeInsets.only(right: 0.w),
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
        alignment: sharedPrefController.language == 'en'
            ? Alignment.topLeft
            : Alignment.topRight,
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
                Container(
                  width: double.infinity,
                  height: 260.h,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(42.sp),
                      bottomRight: Radius.circular(42.sp),
                    ),
                    // color: Colors.red,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: CachedNetworkImage(
                    imageUrl: widget.initiativeDataModel.backgroundImage,
                    width: double.infinity,
                    height: 370.h,
                    fit: BoxFit.cover,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => ShimmerPlaceholder(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                SizedBox(height: 18.h),
                Padding(
                  padding:
                      EdgeInsets.only(left: 32.w, bottom: 12.h, right: 32.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.initiativeDataModel.initiativeName,
                        style: TextStyle(
                          fontFamily: 'BreeSerif',
                          fontSize: 16.sp,
                          color: HexColor('#333333'),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        widget.initiativeDataModel.responsiblePerson,
                        style: TextStyle(
                          fontFamily: 'BreeSerif',
                          fontSize: 11.sp,
                          color: HexColor('#333333'),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      LinearProgressIndicator(
                        value: 0.8,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(HexColor('#333333')),
                        backgroundColor: HexColor('#D9D9D9'),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        widget.initiativeDataModel.targetAmount,
                        style: TextStyle(
                          fontFamily: 'BreeSerif',
                          fontSize: 11.sp,
                          color: HexColor('#6699CC'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 9.h),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            // padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
                            minimumSize: Size(double.infinity, 45.h),
                            backgroundColor: HexColor('#6699CC'),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.sp),
                            ),
                          ),
                          child: Text(
                            // AppLocalizations.of(context)!.logIn,
                            'Share',
                            style: TextStyle(
                              color: HexColor('#FFFFFF'),
                              fontSize: 16.sp,
                              fontFamily: 'BreeSerif',
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 3.h),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            // padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
                            minimumSize: Size(double.infinity, 45.h),
                            backgroundColor: HexColor('#333333'),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.sp),
                            ),
                          ),
                          child: Text(
                            // AppLocalizations.of(context)!.logIn,
                            'Donate now',
                            style: TextStyle(
                              color: HexColor('#FFFFFF'),
                              fontSize: 16.sp,
                              fontFamily: 'BreeSerif',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.sp)),
                        clipBehavior: Clip.antiAlias,
                        width: 40.w,
                        height: 40.w,
                        child: CachedNetworkImage(
                          imageUrl: '_userProfileData!.profileImageUrl',
                          width: 40.w,
                          height: 40.w,
                          fit: BoxFit.cover,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  ShimmerPlaceholder(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                      Text(
                        widget.initiativeDataModel.responsiblePerson,
                        style: TextStyle(
                          color: HexColor('#333333'),
                          fontSize: 11.sp,
                          fontFamily: 'BreeSerif',
                        ),
                      ),
                      Text(
                        ' is organizing this fundraiser.',
                        style: TextStyle(
                          color: HexColor('#559FEA'),
                          fontSize: 11.sp,
                          fontFamily: 'BreeSerif',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 6.h),
                Divider(
                  thickness: 1,
                  indent: 32.w,
                  endIndent: 32.w,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.w, vertical: 12.h),
                  child: Text(
                    widget.initiativeDataModel.description,
                    style: TextStyle(
                      color: HexColor('#333333'),
                      fontSize: 11.sp,
                      fontFamily: 'BreeSerif',
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                  indent: 32.w,
                  endIndent: 32.w,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.w, vertical: 6.h),
                  child: Text(
                    'Donations (10.8K)',
                    style: TextStyle(
                      color: HexColor('#333333'),
                      fontSize: 11.sp,
                      fontFamily: 'BreeSerif',
                    ),
                  ),
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: FbFireStoreController().readInitiativePage(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          enabled: true,
                          child: Container(
                            width: 53.w,
                            height: 53.w,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.sp)),
                          ));
                    } else if (snapshot.hasData &&
                        snapshot.data!.docs.isNotEmpty) {
                      List<QueryDocumentSnapshot> document =
                          snapshot.data!.docs; // عشان اقدر اجيب طولها
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: document.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.sp)),
                              clipBehavior: Clip.antiAlias,
                              width: 40.w,
                              height: 40.w,
                              child: CachedNetworkImage(
                                imageUrl: '_userProfileData!.profileImageUrl',
                                width: 40.w,
                                height: 40.w,
                                fit: BoxFit.cover,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        ShimmerPlaceholder(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                            title: Text(
                              widget.initiativeDataModel.responsiblePerson,
                              style: TextStyle(
                                color: HexColor('#8C9EA0'),
                                fontSize: 11.sp,
                                fontFamily: 'BreeSerif',
                              ),
                            ),
                            subtitle: Text(
                              '\$3.068',
                              style: TextStyle(
                                color: HexColor('#333333'),
                                fontSize: 11.sp,
                                fontFamily: 'BreeSerif',
                              ),
                            ),
                            trailing: Text(
                              '1day',
                              style: TextStyle(
                                color: HexColor('#8C9EA0'),
                                fontSize: 11.sp,
                                fontFamily: 'BreeSerif',
                              ),
                            ),
                          );
                          // Stack(
                          //   children: [
                          //     Container(
                          //       decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(15.sp),
                          //         color: HexColor('#E0EBF2'),
                          //       ),
                          //       child: Container(
                          //         clipBehavior: Clip.antiAlias,
                          //         decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(15.sp),
                          //           color: HexColor('#FFFFFF'),
                          //           boxShadow: [
                          //             BoxShadow(
                          //               color: Colors.black.withOpacity(0.2),
                          //               spreadRadius: 1,
                          //               blurRadius: 2,
                          //               offset: Offset(0, 1), // changes position of shadow
                          //             ),
                          //           ],
                          //         ),
                          //         child: Column(
                          //           crossAxisAlignment: CrossAxisAlignment.center,
                          //           children: [
                          //             CachedNetworkImage(
                          //               imageUrl: document[index].get('backgroundImage'),
                          //               height: 110.h,
                          //               width: double.infinity,
                          //               fit: BoxFit.cover,
                          //               progressIndicatorBuilder: (context, url, downloadProgress) =>
                          //                   CircularProgressIndicator(value: downloadProgress.progress),
                          //               errorWidget: (context, url, error) => Icon(Icons.error),
                          //             ),
                          //             SizedBox(height: 18.h),
                          //             Padding(
                          //               padding: EdgeInsets.symmetric(horizontal: 16.w),
                          //               child: Text(
                          //                 document[index].get('initiativeName'),
                          //                 style: TextStyle(
                          //                     fontSize: 12.sp,
                          //                     color: HexColor('#333333'),
                          //                     fontFamily: 'BreeSerif'),
                          //               ),
                          //             ),
                          //             SizedBox(height: 6.h),
                          //             // Center(
                          //             //   child: LinearProgressIndicator(),
                          //             // ),
                          //             Padding(
                          //               padding: EdgeInsets.symmetric(horizontal: 16.w),
                          //               child: Divider(
                          //                 height: 0.5.h,
                          //                 color: HexColor('#D9D9D9'),
                          //                 thickness: 1.h,
                          //               ),
                          //             ),
                          //             SizedBox(height: 6.h),
                          //             Padding(
                          //               padding: EdgeInsets.symmetric(horizontal: 16.w),
                          //               child: Row(
                          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //                 children: [
                          //                   Text(
                          //                     document[index].get('targetAmount'),
                          //                     style: TextStyle(
                          //                         fontSize: 10.sp,
                          //                         color: HexColor('#3396F9'),
                          //                         fontFamily: 'BreeSerif'),
                          //                   ),
                          //                   Container(
                          //                     child: Row(
                          //                       children: [
                          //                         SvgPicture.asset(
                          //                           'images/healthcare.svg',
                          //                           height: 20.h,
                          //                           width: 20.w,
                          //                           color: HexColor('#333333'),
                          //                         ),
                          //                         SizedBox(width: 6.w,),
                          //                         Text(
                          //                           document[index].get('classification'),
                          //                           style: TextStyle(
                          //                               fontSize: 8.sp,
                          //                               color: HexColor('#333333'),
                          //                               fontFamily: 'BreeSerif'),
                          //                         ),
                          //                       ],
                          //                     ),
                          //                   ),
                          //                 ],
                          //               ),
                          //             )
                          //           ],
                          //         ),
                          //       ),
                          //     ),
                          //     Container(
                          //       decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(50.sp),
                          //         color: Colors.white,
                          //       ),
                          //       margin: EdgeInsets.only(top: 72.h, left: 15.w),
                          //       padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                          //       child: Text(
                          //         '11.2K donayions',
                          //         style: TextStyle(
                          //             fontSize: 9.sp,
                          //             color: HexColor('#333333'),
                          //             fontFamily: 'BreeSerif'),
                          //       ),
                          //     )
                          //   ],
                          // );
                        },
                      );
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
          Container(
            margin: sharedPrefController.language == 'en'
                ? EdgeInsets.only(left: 40.w, top: 50.h)
                : EdgeInsets.only(right: 40.w, top: 50.h),
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
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
                sharedPrefController.language == 'en'
                    ? 'images/arrow_back.svg'
                    : 'images/arrowForword.svg',
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

  ConversationModel get conversationModel {
    ConversationModel conversationModel = ConversationModel();
    conversationModel.conversationId = uuid.v4();
    conversationModel.userDataId = SharedPrefController().userDataId;
    conversationModel.receiveID = SharedPrefController().userDataId;

    return conversationModel;
  }
}
