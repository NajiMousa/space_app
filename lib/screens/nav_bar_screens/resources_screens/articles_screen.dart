import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:difaf_al_wafa_app/models/article_models/article_data_model.dart';
import 'package:difaf_al_wafa_app/prefs/shared_pref_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

import '../../../controllers/firebase_controllers/fb_firestore_controller.dart';
import '../../display_screens/artile_details_screen.dart';
import '../../widgets/app_widgets/loader_widgets/shimmer_placeholder.dart';

class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({Key? key}) : super(key: key);

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  SharedPrefController sharedPrefController = SharedPrefController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.only(top: 10.h, bottom: 8.h, right: 24.w, left: 24.w),
          child: Text(
            AppLocalizations.of(context)!.recentAddition,
            style: TextStyle(
                fontSize: 14.sp,
                color: HexColor('#333333').withOpacity(0.7),
                fontFamily: 'BreeSerif'),
          ),
        ),
        StreamBuilder<QuerySnapshot>(
          stream: FbFireStoreController().readArticles(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return ShimmerPlaceholder();
            } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
              List<QueryDocumentSnapshot> document =
                  snapshot.data!.docs;
              return ListView.builder(
                padding: EdgeInsets.only(bottom: 90.h),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: document.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) {
                      return ArticleDetailsScreen(articleDataModel: mapArticleDataModel(document[index]));
                    },)),
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
                                    offset: Offset(0, 0.1), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CachedNetworkImage(
                                    imageUrl:
                                    document[index].get('backgroundImage'),
                                    height: 120.h,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    progressIndicatorBuilder: (context, url,
                                        downloadProgress) =>ShimmerPlaceholder(),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                  SizedBox(height: 24.h),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                                    child: Text(
                                      document[index].get('articleTitle'),
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          color: HexColor('#333333'),
                                          fontFamily: 'BreeSerif'),
                                    ),
                                  ),
                                  // SizedBox(height: 6.h),
                                  // Padding(
                                  //   padding: EdgeInsets.symmetric(horizontal: 16.w),
                                  //   child: Text(
                                  //     'Author: In the face of adversity, the resilience and courage of our commun ,In the face of adversity, the resilience and courage of our community ,In the face of adversity, the resilience and courage of our community, In the face of adversity, the resilience and ....',
                                  //     style: TextStyle(
                                  //         fontSize: 11.sp,
                                  //         color: HexColor('#474747'),
                                  //         fontFamily: 'BreeSerif'),
                                  //   ),
                                  // ),
                                  SizedBox(height: 6.h),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                                    child: Divider(
                                      height: 0.5.h,
                                      color: HexColor('#8C9EA0'),
                                      thickness: 1.h,
                                      endIndent: 280.w,
                                    ),
                                  ),
                                  SizedBox(height: 6.h),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        right: 16.w, left: 16.w, bottom: 12.h),
                                    child: Text(
                                      document[index].get('articlePublisher'),
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: HexColor('#8C9EA0'),
                                          fontFamily: 'BreeSerif'),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                            sharedPrefController.language == 'en' ? EdgeInsets.only(top: 96.h, left: 241.w, right: 16.w) : EdgeInsets.only(top: 96.h, left: 16.w, right: 241.w),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8.h, horizontal: 12.w),
                                backgroundColor: HexColor('#333333'),
                                minimumSize: Size(20.w, 24.h),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadiusDirectional.circular(50.sp)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'images/savedIcon.svg',
                                    height: 12.h,
                                    width: 12.w,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 10.w),
                                  Text(
                                    AppLocalizations.of(context)!.save,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.sp,
                                      fontFamily: 'BreeSerif',
                                    ),
                                  ),
                                ],
                              ),
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
  ArticleDataModel mapArticleDataModel(QueryDocumentSnapshot documentSnapshot) {
    ArticleDataModel articleDataModel = ArticleDataModel();

    articleDataModel.articleDetails = documentSnapshot.get('articleDetails');
    articleDataModel.placeOfPublication = documentSnapshot.get('placeOfPublication');
    articleDataModel.yearOfPublication = documentSnapshot.get('yearOfPublication');
    articleDataModel.backgroundImage = documentSnapshot.get('backgroundImage');
    articleDataModel.articlePublisher = documentSnapshot.get('articlePublisher');
    articleDataModel.timeStamp = documentSnapshot.get('timeStamp');
    articleDataModel.articleTitle = documentSnapshot.get('articleTitle');
    articleDataModel.articleId = documentSnapshot.get('articleId');

    return articleDataModel;
  }
}
