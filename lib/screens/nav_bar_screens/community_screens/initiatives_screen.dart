import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:difaf_al_wafa_app/prefs/shared_pref_controller.dart';
import 'package:difaf_al_wafa_app/screens/display_screens/initiative_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import '../../../controllers/firebase_controllers/fb_firestore_controller.dart';
import '../../../models/initiative_models/initiative_data_model.dart';
import '../../../models/user_models/user_profile_data_model.dart';

class InitiativesScreen extends StatefulWidget {
   InitiativesScreen({Key? key,}) : super(key: key);


  @override
  State<InitiativesScreen> createState() => _InitiativesScreenState();
}

class _InitiativesScreenState extends State<InitiativesScreen> {
  SharedPrefController sharedPrefController = SharedPrefController();

  UserProfileDataModel? _userProfileData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadUserData();
  }
  Future<void> _loadUserData() async {
    List<UserProfileDataModel> userData = await FbFireStoreController().getAllUserData();
    List<InitiativeDataModel> initiativeData = await FbFireStoreController().getAllInitiative();
    setState(() {
      _userProfileData = userData.firstWhere((user) => user.userDataId == initiativeData.first.userDataId);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.only(top: 12.h, bottom: 6.h, right: 24.w, left: 24.w),
          child: Text(
            AppLocalizations.of(context)!.recentAddition,
            style: TextStyle(
                fontSize: 14.sp,
                color: HexColor('#333333'),
                fontFamily: 'BreeSerif'),
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: double.infinity,
            maxHeight: 95.h,
          ),
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, // Number of columns
                crossAxisSpacing: 12.w,
                mainAxisSpacing: 12.h,
                childAspectRatio: 1),
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(bottom: 18.h, left: 24.w,right: 24.w),
            children: [
              Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.sp),
                    color: HexColor('#1877F2').withOpacity(0.2),
                    border: Border.all(
                      color: HexColor('#1877F2'), // border color
                      width: 2.0, // border width
                    ),

                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'images/category_icon.svg',
                        height: 24.h,
                        width: 24.w,
                        color: HexColor('#333333'),
                      ),
                      SizedBox(height: 4.h,),
                      Text(
                        AppLocalizations.of(context)!.all,
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: HexColor('#333333'),
                            fontFamily: 'BreeSerif',
                            fontWeight:  sharedPrefController.language == 'en' ? null : FontWeight.bold
                        ),
                      ),
                    ],
                  )
              ),
              Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.sp),
                    color: HexColor('#45BD62'),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'images/education_icon.svg',
                        height: 24.h,
                        width: 24.w,
                        color: HexColor('#333333'),
                      ),
                      SizedBox(height: 4.h,),
                      Text(
                        AppLocalizations.of(context)!.education,
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: HexColor('#333333'),
                            fontFamily: 'BreeSerif',
                            fontWeight:  sharedPrefController.language == 'en' ? null : FontWeight.bold),
                      ),
                    ],
                  )
              ),
              Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.sp),
                    color: HexColor('#F7B928'),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  // height: 56.h,
                  // width: 56.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'images/donation_icon.svg',
                        height: 24.h,
                        width: 24.w,
                        color: HexColor('#333333'),
                      ),
                      SizedBox(height: 4.h,),
                      Text(
                        AppLocalizations.of(context)!.charity,
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: HexColor('#333333'),
                            fontFamily: 'BreeSerif',
                            fontWeight:  sharedPrefController.language == 'en' ? null : FontWeight.bold),
                      ),
                    ],
                  )
              ),
              Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.sp),
                    color: HexColor('#2ABBA7'),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'images/events_icon.svg',
                        height: 24.h,
                        width: 24.w,
                        color: HexColor('#333333'),
                      ),
                      SizedBox(height: 4.h,),
                      Text(
                        AppLocalizations.of(context)!.events,
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: HexColor('#333333'),
                            fontFamily: 'BreeSerif',
                            fontWeight:  sharedPrefController.language == 'en' ? null : FontWeight.bold),
                      ),
                    ],
                  )
              ),
              Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.sp),
                    color: HexColor('#00A5F4'),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'images/healthcare_icon.svg',
                        height: 24.h,
                        width: 24.w,
                        color: HexColor('#333333'),
                      ),
                      SizedBox(height: 4.h,),
                      Text(
                        AppLocalizations.of(context)!.health,
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: HexColor('#333333'),
                            fontFamily: 'BreeSerif',
                            fontWeight:  sharedPrefController.language == 'en' ? null : FontWeight.bold),
                      ),
                    ],
                  )
              ),
              Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.sp),
                    color: HexColor('#F5533D'),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'images/environmental_con.svg',
                        height: 24.h,
                        width: 24.w,
                        color: HexColor('#333333'),
                      ),
                      SizedBox(height: 4.h,),
                      Text(
                        AppLocalizations.of(context)!.ecological,
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: HexColor('#333333'),
                            fontFamily: 'BreeSerif',
                            fontWeight:  sharedPrefController.language == 'en' ? null : FontWeight.bold),
                      ),
                    ],
                  )
              ),
            ],
          ),
        ),
        Padding(
          padding:
          EdgeInsets.only(bottom: 6.h, right: 24.w, left: 24.w),
          child: Text(
            AppLocalizations.of(context)!.bestInitiative,
            style: TextStyle(
                fontSize: 14.sp,
                color: HexColor('#333333'),
                fontFamily: 'BreeSerif'),
          ),
        ),
        StreamBuilder<QuerySnapshot>(
          // بناء حسب القتناة لرؤية كل تحديث يحصل
          stream: FbFireStoreController().readInitiativePage(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
              List<QueryDocumentSnapshot> document =
                  snapshot.data!.docs; // عشان اقدر اجيب طولها
              return ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: double.infinity,
                  maxHeight: 226.h,
                ),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1, // Number of columns
                      crossAxisSpacing: 12.w,
                      mainAxisSpacing: 12.h,
                      childAspectRatio: 193/200),
                  scrollDirection: Axis.horizontal,
                  itemCount: document.length,
                  padding: EdgeInsets.only(bottom: 18.h, left: 24.w, right: 24.w),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) {
                      return InitiativeDetailsScreen(initiativeDataModel: mapInitiativeDataModel(document[index]));
                    },)),
                      child: Stack(
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
                                color: HexColor('#FFFFFF'),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: Offset(0, 1), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: document[index].get('backgroundImage'),
                                    height: 110.h,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                                        CircularProgressIndicator(value: downloadProgress.progress),
                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                  ),
                                  SizedBox(height: 18.h),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                                    child: Text(
                                      document[index].get('initiativeName'),
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: HexColor('#333333'),
                                          fontFamily: 'BreeSerif'),
                                    ),
                                  ),
                                  SizedBox(height: 6.h),
                                  // Center(
                                  //   child: LinearProgressIndicator(),
                                  // ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                                    child: Divider(
                                      height: 0.5.h,
                                      color: HexColor('#D9D9D9'),
                                      thickness: 1.h,
                                    ),
                                  ),
                                  SizedBox(height: 6.h),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          document[index].get('targetAmount'),
                                          style: TextStyle(
                                              fontSize: 10.sp,
                                              color: HexColor('#3396F9'),
                                              fontFamily: 'BreeSerif'),
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                'images/healthcare.svg',
                                                height: 20.h,
                                                width: 20.w,
                                                color: HexColor('#333333'),
                                              ),
                                              SizedBox(width: 6.w,),
                                              Text(
                                                document[index].get('classification'),
                                                style: TextStyle(
                                                    fontSize: 8.sp,
                                                    color: HexColor('#333333'),
                                                    fontFamily: 'BreeSerif'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.sp),
                              color: Colors.white,
                            ),
                            margin: EdgeInsets.only(top: 72.h, left: 15.w),
                            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                            child: Text(
                              '11.2K donayions',
                              style: TextStyle(
                                  fontSize: 9.sp,
                                  color: HexColor('#333333'),
                                  fontFamily: 'BreeSerif'),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
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
        Padding(
          padding:
          EdgeInsets.only( bottom: 6.h, right: 24.w, left: 24.w),
          child: Text(
            AppLocalizations.of(context)!.recentAddition,
            style: TextStyle(
                fontSize: 14.sp,
                color: HexColor('#333333'),
                fontFamily: 'BreeSerif'),
          ),
        ),
        StreamBuilder<QuerySnapshot>(
          // بناء حسب القتناة لرؤية كل تحديث يحصل
          stream: FbFireStoreController().readInitiativePage(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
              List<QueryDocumentSnapshot> document =
                  snapshot.data!.docs; // عشان اقدر اجيب طولها
              return ListView.builder(
                padding: EdgeInsets.only(bottom: 90.h),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: document.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) {
                      return InitiativeDetailsScreen(initiativeDataModel: mapInitiativeDataModel(document[index]));
                    },)),
                    child: Padding(
                      padding:
                      EdgeInsets.only(top: 6.h, bottom: 12.h, right: 24.w, left: 24.w),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.sp),
                              color: HexColor('#FFFFFF'),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                            child: Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.sp),
                                color: HexColor('#FFFFFF'),
                              ),

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: document[index].get('backgroundImage'),
                                    height: 76.h,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                                        CircularProgressIndicator(value: downloadProgress.progress),
                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                  ),
                                                                    SizedBox(height: 18.h),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        right: 18.w, left: 18.w, top: 24.h, bottom: 10.h),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          document[index].get('initiativeName'),
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              color: HexColor('#333333'),
                                              fontFamily: 'BreeSerif'),
                                        ),
                                        SizedBox(height: 6.h,),
                                        Text(
                                          document[index].get('description'),
                                          style: TextStyle(
                                              fontSize: 10.sp,
                                              color: HexColor('#474747').withOpacity(0.8),
                                              fontFamily: 'BreeSerif'),
                                        ),
                                        SizedBox(height: 6.h),
                                        Divider(
                                          height: 0.5.h,
                                          color: HexColor('#D9D9D9'),
                                          thickness: 1.h,
                                        ),
                                        SizedBox(height: 6.h),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              document[index].get('targetAmount'),
                                              style: TextStyle(
                                                  fontSize: 10.sp,
                                                  color: HexColor('#3396F9'),
                                                  fontFamily: 'BreeSerif'),
                                            ),
                                            Container(
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    'images/category_icon.svg',
                                                    height: 20.h,
                                                    width: 20.w,
                                                    color: HexColor('#333333'),
                                                  ),
                                                  SizedBox(width: 4.w,),
                                                  Text(
                                                    document[index].get('classification'),
                                                    style: TextStyle(
                                                        fontSize: 8.sp,
                                                        color: HexColor('#333333'),
                                                        fontFamily: 'BreeSerif'),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 30.h, left: 18.w, right: 24.w),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50.sp),
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  // Image.asset(
                                  //   'images/userIcon.png',
                                  //   width: double.infinity,
                                  //   fit: BoxFit.fill,
                                  // ),
                                  width: 72.w,
                                  height: 72.h,
                                  child: CachedNetworkImage(
                                    imageUrl: _userProfileData!.profileImageUrl,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                                        CircularProgressIndicator(value: downloadProgress.progress),
                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                  ),
                                  // margin: EdgeInsets.only(top: 35.h, left: 18.w),
                                ),
                                Text(
                                  _userProfileData!.firstName + ' ' + _userProfileData!.lastName,
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      color: HexColor('#6699CC'),
                                      fontFamily: 'BreeSerif'),
                                ),
                                Container(
                                  padding: EdgeInsets.only(bottom: 8.h),
                                  child: Row(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 8.h, horizontal: 12.w),
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
                                              'images/donation_icon.svg',
                                              height: 16.h,
                                              width: 16.w,
                                              color: Colors.white,
                                            ),
                                            SizedBox(width: 5.w),
                                            Text(
                                              'Donate Now',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10.sp,
                                                fontFamily: 'BreeSerif',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
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
    );
  }

  InitiativeDataModel mapInitiativeDataModel(QueryDocumentSnapshot documentSnapshot) {

    InitiativeDataModel initiativeDataModel = InitiativeDataModel();

    // initiativeDataModel.iD = documentSnapshot.get('iD');
    initiativeDataModel.initiativeName = documentSnapshot.get('initiativeName');
    initiativeDataModel.classification = documentSnapshot.get('classification');
    initiativeDataModel.description = documentSnapshot.get('description');
    initiativeDataModel.targetAmount = documentSnapshot.get('targetAmount');
    initiativeDataModel.mechanismOfWork = documentSnapshot.get('mechanismOfWork');
    initiativeDataModel.responsiblePerson = documentSnapshot.get('responsiblePerson');

    return initiativeDataModel;
  }

}
