import 'package:difaf_al_wafa_app/models/martyr_models/martyr_profile_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:uuid/uuid.dart';
import '../../../../controllers/firebase_controllers/fb_firestore_controller.dart';
import '../../../../models/post_models/likes_model.dart';
import '../../../../models/post_models/posts_model.dart';
import '../../../../models/post_models/reposts_model.dart';
import '../../../../models/post_models/saved_model.dart';
import '../../../../prefs/shared_pref_controller.dart';
import '../../../add_new_screens/new_post_screen.dart';
import '../../../post_screens/full_comment_screen.dart';

class PostActionWidget extends StatefulWidget {
  PostActionWidget({super.key , this.postsModel, this.martyrProfileDataModel});

  PostsModel? postsModel;
  MartyrProfileDataModel? martyrProfileDataModel;
  @override
  State<PostActionWidget> createState() => _PostActionWidgetState();
}

class _PostActionWidgetState extends State<PostActionWidget> {

  bool clickLike = false;
  bool clickSaved = false;
  bool? clickRepostChoice;
  Uuid uuid = Uuid();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 6.h),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    // clickLike = true;
                    print(clickLike);
                    clickLike = clickLike == false ? true : false;
                    print(clickLike);
                  });
                  _performLikePost();
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'images/likePost.svg',
                      height: 20.h,
                      width: 20.w,
                      // color: clickLike != true ? HexColor('#FF0000') : HexColor('#8C9EA0'),
                      color: clickLike ? HexColor('#FF0000'):  HexColor('#333333'),
                    ),
                    SizedBox(width: 8.w),
                  ],
                ),
              ),
              InkWell(
                onTap: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return FullCommentScreen(postsModel: widget.postsModel!);
                  },
                )),
                child: Text(
                  widget.postsModel!.likeCount.toString(),
                  style: TextStyle(
                      fontSize: 9.sp,
                      color: HexColor('#333333'),
                      fontFamily: 'BreeSerif'),
                ),
              ),
              InkWell(
                onTap: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return FullCommentScreen(postsModel: widget.postsModel!);
                  },
                )),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 16.w),
                    SvgPicture.asset(
                      'images/commentIcon.svg',
                      height: 20.h,
                      width: 20.w,
                      color: HexColor('#333333'),
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      widget.postsModel!.commentCount.toString(),
                      style: TextStyle(
                          fontSize: 9.sp,
                          color: HexColor('#333333'),
                          fontFamily: 'BreeSerif'),
                    ),
                  ],
                ),
              ),

              InkWell(
                onTap: () => _showChooseAddWhatDialog(),
                child: SvgPicture.asset(
                  'images/repostIcon.svg',
                  height: 40.h,
                  width: 40.w,
                  color: HexColor('#333333'),
                ),
              ),
              // SizedBox(width: 5.w),
              Text(
                widget.postsModel!.repostCount.toString(),
                style: TextStyle(
                    fontSize: 9.sp,
                    color: HexColor('#333333'),
                    fontFamily: 'BreeSerif'),
              ),
              // SizedBox(
              //   width: 90.w,
              // ),
              Spacer(),
              InkWell(
                onTap: () {
                  setState(() {
                    // clickLike = true;
                    print(clickSaved);
                    clickSaved = clickSaved == false ? true : false;
                    print(clickSaved);
                  });
                  _performSavePost();
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'images/savedIcon.svg',
                      height: 20.h,
                      width: 20.w,
                      color: clickSaved ? HexColor('#333333') : HexColor('#8C9EA0'),
                    ),
                    SizedBox(width: 8.w),
                  ],
                ),
              ),
              SizedBox(width: 20.w),
              SvgPicture.asset(
                'images/messengerIcon.svg',
                height: 20.h,
                width: 20.w,
                color: HexColor('#8C9EA0'),
              ),
            ],
          ),
        ),
        Divider(
          height: 0.5.h,
          color: HexColor('#D9D9D9'),
          thickness: 1.h,
          indent: 24.w,
          endIndent: 24.w,
        ),
        SizedBox(
          height: 20.h,
        )
      ],
    );
  }

  void _performLikePost() async {
    if (clickLike) {
      bool status =
      await FbFireStoreController().addLike(likesModel: likeModel);
      if (status) {
        await FbFireStoreController().updatePost(postsModel: postModel);
      }
    } else {
      bool status = await FbFireStoreController()
          .deleteLike(userId: likeModel.userId, postId: likeModel.postId);
      if (status) {
        await FbFireStoreController().updatePost(postsModel: postModel);
      }
    }
  }

  void _performSavePost() async {
    clickSaved
        ? await FbFireStoreController().addSaved(savedModel: savedModel)
        : await FbFireStoreController().deleteSaved(userId: likeModel.userId, postId: likeModel.postId);
  }

  LikesModel get likeModel {
    LikesModel likesModel = LikesModel();
    likesModel.userId = SharedPrefController().userDataId;
    likesModel.timestamp = DateTime.now().toString();
    likesModel.postId = widget.postsModel!.postId;
    likesModel.likeId = uuid.v4();
    return likesModel;
  }

  SavedModel get savedModel {
    SavedModel savedModel = SavedModel();
    savedModel.userId = SharedPrefController().userDataId;
    savedModel.timestamp = DateTime.now().toString();
    savedModel.postId = widget.postsModel!.postId;
    savedModel.savedId = uuid.v4();
    savedModel.martyrDataId = '';
    return savedModel;
  }

  PostsModel get postModel {
    PostsModel postModel = PostsModel();
    print('10');
    postModel.postId = widget.postsModel!.postId;
    postModel.timestamp = widget.postsModel!.timestamp;
    postModel.userId = widget.postsModel!.userId;
    postModel.mentionedFriendsId = widget.postsModel!.mentionedFriendsId;
    postModel.optionQesition = widget.postsModel!.optionQesition;
    postModel.subPost = widget.postsModel!.subPost;
    postModel.imageUrl = widget.postsModel!.imageUrl;
    postModel.feeling = widget.postsModel!.feeling;
    postModel.fileUrl = widget.postsModel!.fileUrl;
    postModel.content = widget.postsModel!.content;
    postModel.likeCount = clickLike
        ? widget.postsModel!.likeCount++
        : widget.postsModel!.likeCount--;
    postModel.type = widget.postsModel!.type;
    postModel.repostCount = widget.postsModel!.repostCount;
    postModel.commentCount = widget.postsModel!.commentCount;
    postModel.mainPostId = widget.postsModel!.mainPostId;

    return postModel;
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
                    setState(() {
                      clickRepostChoice = true;
                    });
                    _performRePost();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Quote',
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
                    setState(() {
                      clickRepostChoice = false;
                    });
                    _performRePost();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Repost',
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

  void _performRePost() async {
    print('01');
    if (clickRepostChoice!) {
      print('02');
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return NewPostScreen(
            postsModel: postModel,
          );
        },
      ));
      print('03');
    } else {
      print('04');
      bool status =
      await FbFireStoreController().doRepost(repostModel: repostModel);
      print('05');
      print(status);
      if (status) {
        print('06');
        await FbFireStoreController().updatePost(postsModel: postModelRePost);
      }
    }
  }

  RepostModel get repostModel {
    RepostModel repostModel = RepostModel();
    print('10');
    repostModel.postId = widget.postsModel!.postId;
    repostModel.timestamp = widget.postsModel!.timestamp;
    repostModel.userId = widget.postsModel!.userId;
    repostModel.repostContent = '';
    repostModel.repostId = uuid.v4();
    return repostModel;
  }

  PostsModel get postModelRePost {
    PostsModel postModel = PostsModel();
    print('10');
    postModel.postId = widget.postsModel!.postId;
    postModel.timestamp = widget.postsModel!.timestamp;
    postModel.userId = widget.postsModel!.userId;
    postModel.mentionedFriendsId = widget.postsModel!.mentionedFriendsId;
    postModel.optionQesition = widget.postsModel!.optionQesition;
    postModel.subPost = widget.postsModel!.subPost;
    postModel.imageUrl = widget.postsModel!.imageUrl;
    postModel.feeling = widget.postsModel!.feeling;
    postModel.fileUrl = widget.postsModel!.fileUrl;
    postModel.content = widget.postsModel!.content;
    postModel.likeCount = widget.postsModel!.likeCount;
    postModel.type = widget.postsModel!.type;
    postModel.repostCount = clickRepostChoice!
        ? widget.postsModel!.repostCount++
        : widget.postsModel!.repostCount--;
    postModel.commentCount = widget.postsModel!.commentCount;

    return postModel;
  }
}
