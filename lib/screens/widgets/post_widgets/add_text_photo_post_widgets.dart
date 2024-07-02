
import 'package:difaf_al_wafa_app/models/posta_models/posts_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

import '../../../controllers/firebase_controllers/fb_firestore_controller.dart';


class AddTextPhotoPostWidgets extends StatelessWidget {
  AddTextPhotoPostWidgets({Key? key, required this.postsModel}) : super(key: key);

  PostsModel postsModel;
  bool clickLike = false;
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 24.w, left: 24.w, bottom: 9.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: HexColor('#21CED9'),
                      borderRadius: BorderRadius.circular(56.sp),
                    ),
                    width: 34.w,
                    height: 34.h,
                  ),
                  Image.asset(
                    'images/userIcon.png',
                    width: 30.w,
                    height: 30.w,
                  ),
                ],
              ),
              SizedBox(
                width: 6.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Yasser Mansoor',
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: HexColor('#474747'),
                            fontFamily: 'BreeSerif'),
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                      Text(
                        AppLocalizations.of(context)!.withFriends,
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: HexColor('#333333'),
                            fontFamily: 'BreeSerif'),
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                      Text(
                        'Mj Silva',
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: HexColor('#474747'),
                            fontFamily: 'BreeSerif'),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '3.1K',
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: HexColor('#6699CC'),
                            fontFamily: 'BreeSerif'),
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        AppLocalizations.of(context)!.follower,
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: HexColor('#6699CC'),
                            fontFamily: 'BreeSerif'),
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  Text(
                    '5',
                    style: TextStyle(
                        fontSize: 10.sp,
                        color: HexColor('#8C9EA0'),
                        fontFamily: 'BreeSerif'),
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    AppLocalizations.of(context)!.hourAgo,
                    style: TextStyle(
                        fontSize: 10.sp,
                        color: HexColor('#8C9EA0'),
                        fontFamily: 'BreeSerif'),
                  ),
                ],
              ),
              SizedBox(width: 6.w),
              SvgPicture.asset(
                'images/more.svg',
                height: 16.h,
                width: 16.w,
                color: HexColor('#8C9EA0'),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 54.w, right: 24.w),
          child:
          Text(
            postsModel.content,
            style: TextStyle(
                fontSize: 10.sp,
                color: HexColor('#333333'),
                fontFamily: 'BreeSerif'),
          ),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Text(
          //       postsModel.content,
          //       style: TextStyle(
          //           fontSize: 10.sp,
          //           color: HexColor('#333333'),
          //           fontFamily: 'BreeSerif'),
          //     ),
          //     SizedBox(
          //       height: 6.h,
          //     ),
          //     Container(
          //       clipBehavior: Clip.antiAlias,
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(10.sp)),
          //       child: Image.asset(
          //         'images/backgroundPost.png',
          //         width: double.infinity,
          //         height: 390.h,
          //         fit: BoxFit.fill,
          //       ),
          //     ),
          //   ],
          // ),
        ),
        Column(
          children: [
            Padding(
              padding:
              EdgeInsets.symmetric(horizontal: 24.w, vertical: 6.h),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      if(clickLike) clickLike = false;
                      // if(!clickLike) clickLike = true;
                      FbFireStoreController().updatePost(postsModel: newPostsModel);
                      // clickLike ? clickLike = true : clickLike = false;
                    },
                    child: SvgPicture.asset(
                      'images/likePost.svg',
                      height: 20.h,
                      width: 20.w,
                      color: clickLike ? Colors.red: HexColor('#333333'),
                    ),
                  ),
                  SizedBox(width: 5.w),
                  InkWell(
                    onTap: () {
                      // FbFireStoreController().updatePost(postsModel: newPostsModel);
                      clickLike = true;
                    },
                    child: Text(
                      postsModel.likeCount.toString(),
                      style: TextStyle(
                          fontSize: 9.sp,
                          color: HexColor('#333333'),
                          fontFamily: 'BreeSerif'),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  SvgPicture.asset(
                    'images/commentIcon.svg',
                    height: 20.h,
                    width: 20.w,
                    color: HexColor('#333333'),
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    postsModel.commentCount.toString(),
                    style: TextStyle(
                        fontSize: 9.sp,
                        color: HexColor('#333333'),
                        fontFamily: 'BreeSerif'),
                  ),

                  SvgPicture.asset(
                    'images/repostIcon.svg',
                    height: 40.h,
                    width: 40.w,
                    color: HexColor('#333333'),
                  ),
                  // SizedBox(width: 5.w),
                  Text(
                    postsModel.repostCount,
                    style: TextStyle(
                        fontSize: 9.sp,
                        color: HexColor('#333333'),
                        fontFamily: 'BreeSerif'),
                  ),
                  // SizedBox(
                  //   width: 90.w,
                  // ),
                  Spacer(),
                  SvgPicture.asset(
                    'images/savedIcon.svg',
                    height: 20.h,
                    width: 20.w,
                    color: HexColor('#8C9EA0'),
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
            ),
            SizedBox(
              height: 20.h,
            )
          ],
        ),
      ],
    );
  }

  PostsModel get newPostsModel {
    PostsModel postsModelA =  PostsModel();
    postsModelA.postId = postsModel.postId;
    postsModelA.mentions = postsModel.mentions;
    postsModelA.audioUrl = 'postsModel.audioUrl';
    postsModelA.commentCount = postsModel.commentCount;
    postsModelA.content = postsModel.content;
    postsModelA.imageUrl = postsModel.imageUrl;
    postsModelA.likeCount = clickLike ? postsModel.likeCount+1 : postsModel.likeCount-1;
    postsModelA.repostCount = postsModel.repostCount;
    postsModelA.timestamp = postsModel.timestamp;
    postsModelA.type = postsModel.type;
    postsModelA.userId = postsModel.userId;
    postsModelA.videoUrl = postsModel.videoUrl;
    // postsModelA.commentId = postsModel.commentId;
    // postsModelA.likeId = postsModel.likeId;
    // postsModelA.mentionedFriendsId = postsModel.mentionedFriendsId;
    // postsModelA.repostId = postsModel.repostId;
    // postsModelA.savedId = postsModel.savedId;

    return postsModelA;
  }

  // void _likePost() {
  //   print('object');
    // FirebaseFirestore.instance.collection('posts').doc(postsModel.postId).update({
    //   'likeCount': FieldValue.increment(1),
    // });
  // }

  // void _likePost(String? postId) async {
  //   final postRef = FirebaseFirestore.instance.collection('posts').doc(postId);
  //   print('object');
  //
  //   try {
  //     // Check if the document exists
  //     final docSnapshot = await postRef.get();
  //     if (docSnapshot.exists) {
  //       // Document exists, proceed with update
  //       await postRef.update({
  //         'likeCount': FieldValue.increment(1),
  //       });
  //       print('Post liked successfully.');
  //     } else {
  //       // Document does not exist
  //       print('No document found with ID: $postId');
  //     }
  //   } catch (e) {
  //     // Handle errors
  //     print('Error liking post: $e');
  //   }
  // }

  // void updateExamplePost() {
  //   String postId = 'I2GZvP6WWL53kUMtbU4S';
  //   Map<String, dynamic> newData = {
  //     // 'postId': 'Updated content',
  //     'userId': SharedPrefController().userIdRegistration,
  //     'type': 'acceptable',
  //     'content': 'acceptable',
  //     'imageUrl': '',
  //     'videoUrl': '',
  //     'audioUrl': '',
  //     'mentions': '',
  //     'likeCount': 100,
  //     'commentCount': 20,
  //     'repostCount': '',
  //     'timestamp': '',
  //     // Add any other fields you need to update
  //   };

    // updatePostIfAcceptable(postId, newData);


  // Future<void> updatePostsByAuthor(String userId, Map<String, dynamic> newData) async {
  //   final postsCollection = FirebaseFirestore.instance.collection('posts');
  //
  //   try {
  //     // Perform the query
  //     QuerySnapshot querySnapshot = await postsCollection.where('postId', isEqualTo: userId).get();
  //
  //     // Iterate through the documents and update each one
  //     print(userId);
  //     print('userId');
  //     for (QueryDocumentSnapshot doc in querySnapshot.docs) {
  //       await postsCollection.doc(doc.id).update(newData);
  //       print('Post ${doc.id} updated successfully.');
  //     }
  //     print('All posts updated successfully.');
  //   } catch (e) {
  //     print('Error updating posts: $e');
  //   }}
  //   void updateExamplePosts() {
  //     String userId = postsModel.postId;
  //     Map<String, dynamic> newData = {
  //       'likeCount': FieldValue.increment(1),
  //       // Add any other fields you need to update
  //     };
  //
  //     updatePostsByAuthor(userId, newData);
  //   }

}
