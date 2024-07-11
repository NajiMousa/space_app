import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:difaf_al_wafa_app/models/group_models/group_data_model.dart';
import 'package:difaf_al_wafa_app/prefs/shared_pref_controller.dart';
import 'package:difaf_al_wafa_app/screens/widgets/post_widgets/post_type_widgets/add_text_option_qesition_post_widgets.dart';
import 'package:difaf_al_wafa_app/screens/widgets/post_widgets/post_type_widgets/add_video_post_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shimmer/shimmer.dart';
import 'package:uuid/uuid.dart';
import '../../controllers/firebase_controllers/fb_firestore_controller.dart';
import '../../controllers/firebase_controllers/fb_storage_controller.dart';
import '../../models/article_models/article_data_model.dart';
import '../../models/post_models/posts_model.dart';
import '../primary_screens/main_screen.dart';
import '../widgets/app_widgets/app_text_field_widget.dart';
import '../widgets/app_widgets/loader_widgets/shimmer_placeholder.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

import '../widgets/post_widgets/post_type_widgets/add_audio_post_widgets.dart';
import '../widgets/post_widgets/post_type_widgets/add_instagram_post_widget.dart';
import '../widgets/post_widgets/post_type_widgets/add_repost_widgets.dart';
import '../widgets/post_widgets/post_type_widgets/add_text_photo_post_widgets.dart';
import '../widgets/post_widgets/post_type_widgets/add_text_post_widget.dart';
import '../widgets/post_widgets/post_type_widgets/add_text_subtext_post_widgets.dart';

class GroupDetailsScreen extends StatefulWidget {
  GroupDetailsScreen({Key? key, this.groupDataModel}) : super(key: key);

  GroupDataModel? groupDataModel;

  @override
  State<GroupDetailsScreen> createState() => _GroupDetailsScreenState();
}

class _GroupDetailsScreenState extends State<GroupDetailsScreen> {
  SharedPrefController sharedPrefController = SharedPrefController();

  bool _isLoading = false;
  int _selectedTypeMessanger = 0;

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
      body: _isLoading
          ? ShimmerPlaceholder()
          : Stack(
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
                      Stack(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 300.h,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  // color: Colors.red,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 10,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: widget.groupDataModel!.backgroundImage,
                                  width: double.infinity,
                                  height: 400.h,
                                  fit: BoxFit.cover,
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          CircularProgressIndicator(
                                              value: downloadProgress.progress),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 240.h),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(42.sp),
                              color: Colors.white,
                            ),
                            child: ListView(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            widget.groupDataModel!.groupName,
                                            style: TextStyle(
                                                fontSize: 22.sp,
                                                color: HexColor('#333333'),
                                                fontFamily: 'BreeSerif'),
                                          ),
                                          SizedBox(height: 6.h),
                                          Text(
                                            widget.groupDataModel!.groupMembersCount.toString(),
                                            style: TextStyle(
                                                fontSize: 13.sp,
                                                color: HexColor('#333333')
                                                    .withOpacity(0.5),
                                                fontFamily: 'BreeSerif'),
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Container(
                                        alignment: AlignmentDirectional.center,
                                        // padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.h),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50.sp),
                                          color: HexColor('#6699CC'),
                                        ),
                                        width: 32.w,
                                        height: 32.h,
                                        child: SvgPicture.asset(
                                          'images/more.svg',
                                          height: 13.h,
                                          width: 13.w,
                                          color: HexColor('#FFFFFF'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 15.h),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                                  child: Text(
                                    widget.groupDataModel!.groupBio,
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: HexColor('#333333'),
                                        fontFamily: 'BreeSerif'),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 15.h),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // performLogInWithPhone();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      // padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
                                      minimumSize: Size(double.infinity, 45.h),
                                      backgroundColor: HexColor('#333333'),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.sp),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          'images/addPost.svg',
                                          height: 15.h,
                                          width: 15.w,
                                          color: HexColor('#FFFFFF'),
                                        ),
                                        SizedBox(width: 12.w),
                                        Text(
                                          'Join Group',
                                          style: TextStyle(
                                            color: HexColor('#FFFFFF'),
                                            fontSize: 13.sp,
                                            fontFamily: 'BreeSerif',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                StreamBuilder<QuerySnapshot>(
                                  stream: FbFireStoreController().readPosts(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState == ConnectionState.waiting) {
                                      return ShimmerPlaceholder();
                                    } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {

                                      List<QueryDocumentSnapshot> document =
                                          snapshot.data!.docs; // عشان اقدر اجيب طولها
                                      return ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: document.length,
                                        itemBuilder: (context, index) {
                                          // DateTime.parse(document[index].get('timestamp'));
                                          // document.sort((a, b) => b.compareTo(a.timestamp));
                                          switch (document[index].get('type')) {
                                          // switch ('textImage') {
                                            case 'text':
                                              return AddTextPostWidget(postsModel: mapPostsModel(document[index]),);
                                            case 'textImage':
                                            case 'testFile':
                                              return AddTextPhotoPostWidgets(
                                                postsModel: mapPostsModel(document[index]),
                                              );

                                          /// Photo And Text Post Like X
                                            case 'image':
                                              return AddInstagramPostWidget(postsModel: mapPostsModel(document[index]),);

                                          /// Photo Post Like Instagram
                                            case 'file':
                                              return AddVideoPostWidgets(postsModel: mapPostsModel(document[index]),);

                                          /// Single Video Post
                                            case 'audio':
                                              return AddAudioPostWidgets(postsModel: mapPostsModel(document[index]),);

                                          /// Single Video Post
                                            case 'subQuestion':
                                              return AddTextOptionQesitionPostWidgets(postsModel: mapPostsModel(document[index]),);

                                          /// Single Video Post
                                            case 'subText':
                                              return AddTextSubTextPostWidgets(postsModel: mapPostsModel(document[index]),);

                                            case 'repost':
                                              return AddRepostWidgets(postsModel: mapPostsModel(document[index]),);

                                          /// Audio Post
                                          // default:
                                          //   return AddRepostWidgets(postsModel: mapPostsModel(document[index]),);

                                          /// Repost Post Like X
                                          }
                                        },

                                        /// Videos Show
                                        // AddVideosReelsWidgets(),
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
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
  PostsModel mapPostsModel(QueryDocumentSnapshot documentSnapshot) {
    PostsModel postsModel = PostsModel();

    postsModel.postId = documentSnapshot.get('postId');
    // postsModel.mentions = documentSnapshot.get('mentions');
    // postsModel.audioUrl = documentSnapshot.get('audioUrl');
    postsModel.commentCount = documentSnapshot.get('commentCount');
    postsModel.content = documentSnapshot.get('content');
    postsModel.imageUrl = documentSnapshot.get('imageUrl');
    postsModel.likeCount = documentSnapshot.get('likeCount');
    postsModel.repostCount = documentSnapshot.get('repostCount');
    postsModel.timestamp = documentSnapshot.get('timestamp');
    postsModel.type = documentSnapshot.get('type');
    postsModel.userId = documentSnapshot.get('userId');
    postsModel.fileUrl = documentSnapshot.get('fileUrl');
    postsModel.subPost = documentSnapshot.get('subPost');
    postsModel.optionQesition = documentSnapshot.get('optionQesition');

    return postsModel;
  }
}
