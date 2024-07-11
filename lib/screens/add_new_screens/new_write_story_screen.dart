import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:difaf_al_wafa_app/prefs/shared_pref_controller.dart';
import 'package:difaf_al_wafa_app/screens/nav_bar_screens/martyrs_screens/martyrs_stories_screen.dart';
import 'package:difaf_al_wafa_app/screens/post_screens/tag_people_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:uuid/uuid.dart';
import 'package:video_player/video_player.dart';
import '../../controllers/firebase_controllers/fb_firestore_controller.dart';
import '../../controllers/firebase_controllers/fb_storage_controller.dart';
import '../../models/martyr_models/martyr_profile_data_model.dart';
import '../../models/martyr_models/martyr_stories_data_model.dart';
import '../../models/post_models/posts_model.dart';
import '../../models/user_models/user_profile_data_model.dart';
import '../primary_screens/main_screen.dart';
import '../widgets/app_widgets/app_text_field_widget.dart';
import '../widgets/post_widgets/post_type_widgets/add_audio_post_widgets.dart';
import '../widgets/post_widgets/post_type_widgets/add_instagram_post_widget.dart';
import '../widgets/post_widgets/post_type_widgets/add_text_option_qesition_post_widgets.dart';
import '../widgets/post_widgets/post_type_widgets/add_text_photo_post_widgets.dart';
import '../widgets/post_widgets/post_type_widgets/add_text_post_widget.dart';
import '../widgets/post_widgets/post_type_widgets/add_text_subtext_post_widgets.dart';
import '../widgets/post_widgets/post_type_widgets/add_video_post_widgets.dart';

class NewWriteStoryScreen extends StatefulWidget {
  NewWriteStoryScreen({Key? key, required this.martyrProfileDataModel}) : super(key: key);

  MartyrProfileDataModel martyrProfileDataModel;
  @override
  State<NewWriteStoryScreen> createState() => _NewWriteStoryScreenState();
}

class _NewWriteStoryScreenState extends State<NewWriteStoryScreen> {
  Uuid uuid = Uuid();
  late TextEditingController _contentTextEditorController;
  int _selectedTypePost = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _contentTextEditorController = TextEditingController();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    _contentTextEditorController.dispose();
    super.dispose();
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
                  _selectedTypePost = 0;
                });
              },
              child: Padding(
                padding: EdgeInsets.only(left: 33.w),
                child: Column(
                  children: [
                    _selectedTypePost == 0
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
                      height: 5.h,
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      AppLocalizations.of(context)!.all,
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: _selectedTypePost == 0
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
                  _selectedTypePost = 1;
                });
              },
              child: Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: Column(
                  children: [
                    _selectedTypePost == 1
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
                        : SizedBox(
                      height: 5.h,
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      AppLocalizations.of(context)!.text,
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: _selectedTypePost == 1
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
                  _selectedTypePost = 2;
                });
              },
              child: Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: Column(
                  children: [
                    _selectedTypePost == 2
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
                        : SizedBox(
                      height: 5.h,
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      AppLocalizations.of(context)!.photos,
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: _selectedTypePost == 2
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
                  _selectedTypePost = 3;
                });
              },
              child: Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _selectedTypePost == 3
                        ? Container(
                      decoration: BoxDecoration(
                        color: HexColor('#6699CC'),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(5.sp),
                          bottomLeft: Radius.circular(5.sp),
                        ),
                      ),
                      width: 43.w,
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
                          color: _selectedTypePost == 3
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
                  _selectedTypePost = 4;
                });
              },
              child: Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _selectedTypePost == 4
                        ? Container(
                      decoration: BoxDecoration(
                        color: HexColor('#6699CC'),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(5.sp),
                          bottomLeft: Radius.circular(5.sp),
                        ),
                      ),
                      width: 44.w,
                      height: 5.h,
                    )
                        : SizedBox(
                      height: 5.h,
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      AppLocalizations.of(context)!.audio,
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: _selectedTypePost == 4
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
                  _selectedTypePost = 5;
                });
              },
              child: Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _selectedTypePost == 5
                        ? Container(
                      decoration: BoxDecoration(
                        color: HexColor('#6699CC'),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(5.sp),
                          bottomLeft: Radius.circular(5.sp),
                        ),
                      ),
                      width: 44.w,
                      height: 5.h,
                    )
                        : SizedBox(
                      height: 5.h,
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'Question',
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: _selectedTypePost == 5
                              ? HexColor('#6699CC')
                              : HexColor('#8C9EA0'),
                          fontFamily: 'BreeSerif'),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                margin: SharedPrefController().language == 'en'
                    ? EdgeInsets.only(left: 24.w)
                    : EdgeInsets.only(right: 0.w),
                decoration: BoxDecoration(
                  color: Colors.white, // Background color
                  shape: BoxShape.circle, // Make it a circle if desired
                ),
                child: Icon(
                  Icons.add,
                  size: 24.sp,
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: AppBar(
            automaticallyImplyLeading: false,
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
                              setState(() {
                                // _isLoading = true;
                              });
                            },
                            child: SvgPicture.asset(
                              SharedPrefController().language == 'en'
                                  ? 'images/arrow_back.svg'
                                  : 'images/arrowForword.svg',
                              width: 10.w,
                              height: 16.h,
                              color: HexColor('#333333'),
                            ),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          Text(
                            'New Write Story',
                            style: TextStyle(
                                fontSize: 20.sp,
                                color: HexColor('#333333'),
                                fontFamily: 'BreeSerif'),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(width: 60.w),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.w),
                      child: ElevatedButton(
                        onPressed: () async {
                          performProcess();
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: 4.h, horizontal: 18.w),
                          backgroundColor: HexColor('#333333'),
                          minimumSize: Size(57.w, 32.h),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadiusDirectional.circular(50.sp)),
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.postAll,
                          style: TextStyle(
                            color: HexColor('#FFFFFF'),
                            fontSize: 12.sp,
                            fontFamily: 'BreeSerif',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
      body: Stack(
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
            child: Column(
              children: [
                SizedBox(height: 18.h),
                Expanded(
                  child: ListView(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 24.w, left: 20.w),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: HexColor('#333333'),
                              width: 1.sp,
                            ),
                            borderRadius: BorderRadius.circular(15.sp),),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 18.w),
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(50.sp)),
                                clipBehavior: Clip.antiAlias,
                                width: 32.w,
                                height: 32.w,
                                child: CachedNetworkImage(
                                  imageUrl:
                                  // _userProfileData!.profileImageUrl,
                                  '',
                                  width: 32.w,
                                  height: 32.w,
                                  fit: BoxFit.cover,
                                  progressIndicatorBuilder: (context,
                                      url, downloadProgress) =>
                                      CircularProgressIndicator(
                                          value: downloadProgress
                                              .progress),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: SharedPrefController().language ==
                                      'en'
                                      ? EdgeInsets.only(left: 12.w)
                                      : EdgeInsets.only(right: 12.w),
                                  alignment: AlignmentDirectional.center,
                                  child: TextField(
                                    controller: _contentTextEditorController,
                                    style: TextStyle(
                                      fontFamily: 'BreeSerif',
                                      fontSize: 13.sp,
                                      color: HexColor('#8C9EA0'),
                                    ),
                                    maxLines: null,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: AppLocalizations.of(context)!
                                          .writeYourMassage,
                                      enabledBorder: getBorder(),
                                      focusedBorder: getBorder(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
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
    );
  }

  OutlineInputBorder getBorder({Color borderColor = Colors.white}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: borderColor,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(50),
    );
  }

  Future<void> performProcess() async {
    if (checkData()) {
      await process(
      );
    }
  }

  bool checkData() {
    if (_contentTextEditorController.text.isNotEmpty) {
      ///showSnackBar(context : context , message : 'Enter required Data', error : true);
      return true;
    }
    return false;
  }

  Future<void> process() async {
    bool status = await FbFireStoreController().updateMartyrData(martyrProfileDataModel: martyrProfileDataModel); // jp]de
    if (status) {
      bool status = await FbFireStoreController().createPost(postsModel: postsModel);
      if (status) {
        Navigator.pop(context);
      }
    }

    print('Post created successfully');
    ///showSnackBar(context : context , message : status ? 'Process Success' : 'Process Failed', error : true);
  }

  // MartyrStoriesDataModel get martyrStoriesDataModel {
  //   MartyrStoriesDataModel martyrStoriesDataModel = MartyrStoriesDataModel();
  //   martyrStoriesDataModel.martyrStoryId = uuid.v4();
  //   martyrStoriesDataModel.timeStamp = DateTime.now().toString();
  //   martyrStoriesDataModel.content = _contentTextEditorController.text;
  //   martyrStoriesDataModel.userDataId = SharedPrefController().userDataId;
  //   martyrStoriesDataModel.martyrDataId = widget.martyrProfileDataModel.martyrDataId;
  //
  //   return martyrStoriesDataModel;
  // }

  MartyrProfileDataModel get martyrProfileDataModel {
    MartyrProfileDataModel martyrProfileDataModel = MartyrProfileDataModel();
    martyrProfileDataModel.martyrDataId = widget.martyrProfileDataModel!.martyrDataId;
    martyrProfileDataModel.firstName = widget.martyrProfileDataModel!.firstName;
    martyrProfileDataModel.lastName = widget.martyrProfileDataModel!.lastName;
    martyrProfileDataModel.bio = widget.martyrProfileDataModel!.bio;
    martyrProfileDataModel.dateOfBirth = widget.martyrProfileDataModel!.dateOfBirth;
    martyrProfileDataModel.userDataId = widget.martyrProfileDataModel!.userDataId;
    martyrProfileDataModel.martyrRequestDataId = widget.martyrProfileDataModel!.martyrRequestDataId;
    martyrProfileDataModel.backgroundImage = widget.martyrProfileDataModel!.backgroundImage;
    martyrProfileDataModel.profileImage = widget.martyrProfileDataModel!.profileImage;
    martyrProfileDataModel.writeStory = _contentTextEditorController.text;
    martyrProfileDataModel.dateOfMartyrdom = widget.martyrProfileDataModel!.dateOfMartyrdom;
    martyrProfileDataModel.dateOfBirthMartyr = widget.martyrProfileDataModel!.dateOfBirthMartyr;
    return martyrProfileDataModel;
  }

  PostsModel get postsModel {
    PostsModel postsModel = PostsModel();
    postsModel.postId = uuid.v4();
    // postsModel.mentions = _taggedPeopleIds;
    // postsModel.audioUrl = '';
    postsModel.commentCount = 0;
    postsModel.content = _contentTextEditorController.text;
    postsModel.fileUrl = [];
    postsModel.imageUrl = [];
    postsModel.likeCount = 0;
    postsModel.repostCount = 0;
    postsModel.timestamp = DateTime.now().toString();
    postsModel.type = 'story';
    postsModel.subPost = [];
    postsModel.userId = SharedPrefController().userDataId;
    postsModel.mentionedFriendsId= [];
    postsModel.feeling= '';
    postsModel.optionQesition= [];
    postsModel.mainPostId= null;
    // postsModel.savedId = '';
    // postsModel.repostId = '';
    // postsModel.likeId = '';
    // postsModel.commentId = '';

    return postsModel;
  }
}