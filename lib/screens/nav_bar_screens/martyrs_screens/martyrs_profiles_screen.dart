import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:difaf_al_wafa_app/models/martyr_models/martyr_request_data_model.dart';
import 'package:difaf_al_wafa_app/screens/widgets/add_martyrs_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import '../../../controllers/firebase_controllers/fb_firestore_controller.dart';
import '../../profile_screens/martyr_profile_screen.dart';
import '../../widgets/martyrs_profile_widget.dart';

class MartyrsProfilesScreen extends StatefulWidget {
  MartyrsProfilesScreen({Key? key, })
      : super(key: key);



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
          // بناء حسب القتناة لرؤية كل تحديث يحصل
          stream: FbFireStoreController().readMartyrRequest(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
              List<QueryDocumentSnapshot> document =
                  snapshot.data!.docs;
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
                          martyrRequestDataModel:
                          mapMartyrReuestDataModel(document[index])),
                      onTap: () {
                        print(mapMartyrReuestDataModel(document[index]));
                        print(mapMartyrReuestDataModel(document[index]).martyrRequestId);
                        print(mapMartyrReuestDataModel(document[index]).fullMartyrName);
                        print('mapMartyrReuestDataModel(document[index])');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return MartyrProfileScreen(
                                martyrRequestDataModel:
                                mapMartyrReuestDataModel(document[index]),
                              );
                            },
                          ),
                        );
                      }
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
        // Recent Additions Content

        // Padding(
        //   padding:
        //   EdgeInsets.only(top: 6.h, bottom: 12.h, right: 24.w, left: 24.w),
        //   child: Stack(
        //     children: [
        //       Container(
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(15.sp),
        //           color: HexColor('#E0EBF2'),
        //         ),
        //         child: Container(
        //           clipBehavior: Clip.antiAlias,
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(15.sp),
        //             color: HexColor('#E0EBF2'),
        //           ),
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.center,
        //             children: [
        //               Image.asset(
        //                 'images/coverImage.png',
        //                 width: double.infinity,
        //                 height: 105.h,
        //                 fit: BoxFit.fill,
        //               ),
        //               SizedBox(height: 18.h),
        //               Padding(
        //                 padding: EdgeInsets.symmetric(horizontal: 16.w),
        //                 child: Row(
        //                   children: [
        //                     Text(
        //                       'Yasser Mansoor',
        //                       style: TextStyle(
        //                           fontSize: 13.sp,
        //                           color: HexColor('#333333'),
        //                           fontFamily: 'BreeSerif'),
        //                     ),
        //                     SizedBox(width: 6.w),
        //                     Text(
        //                       '3.1K Candle || 1.2K follower',
        //                       style: TextStyle(
        //                           fontSize: 10.sp,
        //                           color: HexColor('#3396F9'),
        //                           fontFamily: 'BreeSerif'),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //               Padding(
        //                 padding: EdgeInsets.only(
        //                     right: 18.w, left: 18.w, top: 5.h, bottom: 10.h),
        //                 child: Text(
        //                   'An adventurer at heart and storyteller by trade, Maya Thompson thrives on exploring the unknown and sharing her experiences with the world.',
        //                   style: TextStyle(
        //                       fontSize: 10.sp,
        //                       color: HexColor('#474747'),
        //                       fontFamily: 'BreeSerif'),
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //       Padding(
        //         padding: EdgeInsets.only(top: 50.h, left: 18.w, right: 16.w),
        //         child: Row(
        //           crossAxisAlignment: CrossAxisAlignment.end,
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             Container(
        //               decoration: BoxDecoration(
        //                 borderRadius: BorderRadius.circular(50.sp),
        //               ),
        //               child: Image.asset(
        //                 'images/userIcon.png',
        //                 width: double.infinity,
        //                 fit: BoxFit.fill,
        //               ),
        //               width: 72.w,
        //               height: 72.h,
        //               // margin: EdgeInsets.only(top: 35.h, left: 18.w),
        //             ),
        //             Container(
        //               child: Row(
        //                 children: [
        //                   ElevatedButton(
        //                     onPressed: () {},
        //                     style: ElevatedButton.styleFrom(
        //                       padding: EdgeInsets.symmetric(
        //                           vertical: 8.h, horizontal: 12.w),
        //                       backgroundColor: HexColor('#333333'),
        //                       minimumSize: Size(100.w, 24.h),
        //                       shape: RoundedRectangleBorder(
        //                           borderRadius:
        //                           BorderRadiusDirectional.circular(50.sp)),
        //                     ),
        //                     child: Row(
        //                       mainAxisAlignment: MainAxisAlignment.center,
        //                       children: [
        //                         SvgPicture.asset(
        //                           'images/addFollow.svg',
        //                           height: 16.h,
        //                           width: 16.w,
        //                           color: Colors.white,
        //                         ),
        //                         SizedBox(width: 5.w),
        //                         Text(
        //                           'Light a Candle',
        //                           style: TextStyle(
        //                             color: Colors.white,
        //                             fontSize: 10.sp,
        //                             fontFamily: 'BreeSerif',
        //                           ),
        //                         ),
        //                       ],
        //                     ),
        //                   ),
        //                   ElevatedButton(
        //                     onPressed: () {},
        //                     style: ElevatedButton.styleFrom(
        //                       padding: EdgeInsets.symmetric(
        //                           vertical: 8.h, horizontal: 8.w),
        //                       backgroundColor: HexColor('#333333'),
        //                       minimumSize: Size(24.w, 24.h),
        //                       shape: RoundedRectangleBorder(
        //                           borderRadius:
        //                           BorderRadiusDirectional.circular(50.sp)),
        //                     ),
        //                     child: SvgPicture.asset(
        //                       'images/addFollow.svg',
        //                       height: 16.h,
        //                       width: 16.w,
        //                       color: Colors.white,
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           ],
        //         ),
        //       )
        //     ],
        //   ),
        // )
        StreamBuilder<QuerySnapshot>(
          // بناء حسب القتناة لرؤية كل تحديث يحصل
          stream: FbFireStoreController().readMartyrRequest(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
              List<QueryDocumentSnapshot> document =
                  snapshot.data!.docs;
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(bottom: 90.h),
                itemCount: document.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () =>
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return MartyrProfileScreen(
                                martyrRequestDataModel:
                                mapMartyrReuestDataModel(document[index]),
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'images/coverImage.png',
                                    width: double.infinity,
                                    height: 105.h,
                                    fit: BoxFit.fill,
                                  ),
                                  SizedBox(height: 18.h),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16.w, vertical: 6.h),
                                    child: Row(
                                      children: [
                                        Text(
                                          document[index].get('fullMartyrName'),
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
                                        top: 5.h,
                                        bottom: 15.h),
                                    child: Text(
                                      document[index].get('martyrIdNumber'),
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
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50.sp),
                                  ),
                                  child: Image.asset(
                                    'images/userIcon.png',
                                    width: double.infinity,
                                    fit: BoxFit.fill,
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

  MartyrRequestDataModel mapMartyrReuestDataModel(
      QueryDocumentSnapshot documentSnapshot) {
    MartyrRequestDataModel martyrRequestDataModel = MartyrRequestDataModel();
    // martyrRequestDataModel.martyrRequestId = documentSnapshot.get('martyrRequestId');
    martyrRequestDataModel.dateOfBirthMartyr = documentSnapshot.get('dateOfBirthMartyr');
    martyrRequestDataModel.dateOfMartyrdom = documentSnapshot.get('dateOfMartyrdom');
    martyrRequestDataModel.deathCertificate = documentSnapshot.get('deathCertificate');
    martyrRequestDataModel.firstIdentifiersIDNumber = documentSnapshot.get('firstIdentifiersIDNumber');
    martyrRequestDataModel.firstIdentifiersPhoneNumber = documentSnapshot.get('firstIdentifiersPhoneNumber');
    martyrRequestDataModel.fullFirstIdentifiersName = documentSnapshot.get('fullFirstIdentifiersName');
    martyrRequestDataModel.fullMartyrName = documentSnapshot.get('fullMartyrName');
    martyrRequestDataModel.fullUserName = documentSnapshot.get('fullUserName');
    martyrRequestDataModel.martyrIdNumber = documentSnapshot.get('martyrIdNumber');
    martyrRequestDataModel.placeOfMartyrdom = documentSnapshot.get('placeOfMartyrdom');
    martyrRequestDataModel.status = documentSnapshot.get('status');
    martyrRequestDataModel.userIDCertificate = documentSnapshot.get('userIDCertificate');
    martyrRequestDataModel.userIDNumber = documentSnapshot.get('userIDNumber');
    martyrRequestDataModel.userPhoneNumber = documentSnapshot.get('userPhoneNumber');
    martyrRequestDataModel.userDataId = documentSnapshot.get('userDataId');
    martyrRequestDataModel.martyrRequestId = documentSnapshot.get('martyrRequestId');

    return martyrRequestDataModel;
  }
}
