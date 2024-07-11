import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:difaf_al_wafa_app/models/martyr_models/martyr_request_data_model.dart';
import 'package:difaf_al_wafa_app/screens/widgets/martyr_widgets/add_martyrs_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:shimmer/shimmer.dart';
import '../../../controllers/firebase_controllers/fb_firestore_controller.dart';
import '../../../models/martyr_models/martyr_profile_data_model.dart';
import '../../profile_screens/martyr_profile_screen.dart';
import '../../widgets/martyr_widgets/martyrs_profile_widget.dart';

class MartyrsProfilesScreen extends StatefulWidget {
  MartyrsProfilesScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MartyrsProfilesScreen> createState() => _MartyrsProfilesScreenState();
}

class _MartyrsProfilesScreenState extends State<MartyrsProfilesScreen> {
  bool hasAddedStory = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Featured Martyrs
        Padding(
          padding:
              EdgeInsets.only(top: 10.h, bottom: 6.h, right: 24.w, left: 24.w),
          child: Text(
            AppLocalizations.of(context)!.featuredMartyrs,
            style: TextStyle(
                fontSize: 14.sp,
                color: HexColor('#333333').withOpacity(0.7),
                fontFamily: 'BreeSerif'),
          ),
        ),
        // Featured Martyrs Content
        StreamBuilder<QuerySnapshot>(
          stream: FbFireStoreController().readMartyrData(),
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
            } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
              List<QueryDocumentSnapshot> document = snapshot.data!.docs;
              return ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: double.infinity,
                  maxHeight: 242.h,
                ),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1, // Number of columns
                      crossAxisSpacing: 12.w,
                      mainAxisSpacing: 12.h,
                      childAspectRatio: 150 / 120),
                  scrollDirection: Axis.horizontal,
                  itemCount: document.length,
                  padding: EdgeInsets.only(
                      top: 8.h, left: 24.w, bottom: 12.h, right: 24.w),
                  itemBuilder: (context, index) {
                    // if (index == 0) {
                    //   return AddMartyrsWidget(hasAddedStory: hasAddedStory,);
                    // } else {
                    //   return MartyrsProfileWidget(index: index,);
                    // }
                    return InkWell(
                      child: MartyrsProfileWidget(
                          martyrProfileDataModel:
                              mapMartyrProfileDataModel(document[index])),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return MartyrProfileScreen(
                              martyrProfileDataModel:
                                  mapMartyrProfileDataModel(document[index]),
                            );
                          },
                        ),
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

        // Header Recent Additions
        Padding(
          padding:
              EdgeInsets.only(top: 10.h, bottom: 6.h, right: 24.w, left: 24.w),
          child: Text(
            AppLocalizations.of(context)!.recentAddition,
            style: TextStyle(
                fontSize: 14.sp,
                color: HexColor('#333333').withOpacity(0.7),
                fontFamily: 'BreeSerif'),
          ),
        ),
        StreamBuilder<QuerySnapshot>(
          stream: FbFireStoreController().readMartyrData(),
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
            } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
              List<QueryDocumentSnapshot> document = snapshot.data!.docs;
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(bottom: 90.h),
                itemCount: document.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return MartyrProfileScreen(
                            martyrProfileDataModel:
                                mapMartyrProfileDataModel(document[index]),
                          );
                        },
                      ),
                    ),
                    child: Padding(
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
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: Offset(
                                        0, 1), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CachedNetworkImage(
                                    imageUrl:
                                        document[index].get('backgroundImage'),
                                    width: double.infinity,
                                    height: 102.h,
                                    fit: BoxFit.cover,
                                    progressIndicatorBuilder:
                                        (context, url, downloadProgress) =>
                                            Shimmer.fromColors(
                                                baseColor: Colors.grey.shade300,
                                                highlightColor:
                                                    Colors.grey.shade100,
                                                enabled: true,
                                                child: Container(
                                                  width: 53.w,
                                                  height: 53.w,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50.sp)),
                                                )),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                  // Image.asset(
                                  //   'images/coverImage.png',
                                  //   width: double.infinity,
                                  //   height: 105.h,
                                  //   fit: BoxFit.fill,
                                  // ),
                                  SizedBox(height: 18.h),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16.w, vertical: 6.h),
                                    child: Row(
                                      children: [
                                        Text(
                                          document[index].get('firstName') +
                                              ' ' +
                                              document[index].get('lastName'),
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              color: HexColor('#333333'),
                                              fontFamily: 'BreeSerif'),
                                        ),
                                        SizedBox(width: 6.w),
                                        Text(
                                          '3.1K Candle || 1.2K follower',
                                          style: TextStyle(
                                              fontSize: 9.sp,
                                              color: HexColor('#3396F9'),
                                              fontFamily: 'BreeSerif'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        right: 18.w,
                                        left: 18.w,
                                        // top: 5.h,
                                        bottom: 15.h),
                                    child: Text(
                                      document[index].get('bio'),
                                      style: TextStyle(
                                          fontSize: 9.sp,
                                          color: HexColor('#819395')
                                              .withOpacity(0.8),
                                          fontFamily: 'BreeSerif'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 50.h, left: 18.w, right: 16.w),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50.sp),
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        document[index].get('profileImage'),
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    progressIndicatorBuilder:
                                        (context, url, downloadProgress) =>
                                            Shimmer.fromColors(
                                                baseColor: Colors.grey.shade300,
                                                highlightColor:
                                                    Colors.grey.shade100,
                                                enabled: true,
                                                child: Container(
                                                  width: 53.w,
                                                  height: 53.w,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50.sp)),
                                                )),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                  width: 72.w,
                                  height: 72.h,
                                  // margin: EdgeInsets.only(top: 35.h, left: 18.w),
                                ),
                                Container(
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
                                                  BorderRadiusDirectional
                                                      .circular(50.sp)),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              'images/candle.svg',
                                              height: 16.h,
                                              width: 16.w,
                                              color: Colors.white,
                                            ),
                                            SizedBox(width: 5.w),
                                            Text(
                                              AppLocalizations.of(context)!
                                                  .lightACandle,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10.sp,
                                                fontFamily: 'BreeSerif',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 8.h, horizontal: 8.w),
                                          backgroundColor: HexColor('#333333'),
                                          minimumSize: Size(24.w, 24.h),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadiusDirectional
                                                      .circular(50.sp)),
                                        ),
                                        child: SvgPicture.asset(
                                          'images/addFollow.svg',
                                          height: 16.h,
                                          width: 16.w,
                                          color: Colors.white,
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
    );
  }

  MartyrProfileDataModel mapMartyrProfileDataModel(
      QueryDocumentSnapshot documentSnapshot) {
    MartyrProfileDataModel martyrProfileDataModel = MartyrProfileDataModel();

    martyrProfileDataModel.martyrDataId = documentSnapshot.get('martyrDataId');
    martyrProfileDataModel.firstName = documentSnapshot.get('firstName');
    martyrProfileDataModel.lastName = documentSnapshot.get('lastName');
    martyrProfileDataModel.bio = documentSnapshot.get('bio');
    martyrProfileDataModel.dateOfBirth = documentSnapshot.get('dateOfBirth');
    martyrProfileDataModel.userDataId = documentSnapshot.get('userDataId');
    martyrProfileDataModel.martyrRequestDataId =
        documentSnapshot.get('martyrRequestDataId');
    martyrProfileDataModel.backgroundImage =
        documentSnapshot.get('backgroundImage');
    martyrProfileDataModel.profileImage = documentSnapshot.get('profileImage');
    martyrProfileDataModel.writeStory = documentSnapshot.get('writeStory');
    martyrProfileDataModel.dateOfBirthMartyr = documentSnapshot.get('dateOfBirthMartyr');
    martyrProfileDataModel.dateOfMartyrdom = documentSnapshot.get('dateOfMartyrdom');

    return martyrProfileDataModel;
  }
}
