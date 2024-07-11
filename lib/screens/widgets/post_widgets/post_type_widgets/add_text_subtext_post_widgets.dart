import 'package:cached_network_image/cached_network_image.dart';
import 'package:difaf_al_wafa_app/models/user_models/user_profile_data_model.dart';
import 'package:difaf_al_wafa_app/screens/widgets/post_widgets/post_part_widgets/post_action_widget.dart';
import 'package:difaf_al_wafa_app/screens/widgets/post_widgets/post_part_widgets/post_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../controllers/firebase_controllers/fb_firestore_controller.dart';
import '../../../../models/post_models/posts_model.dart';

class AddTextSubTextPostWidgets extends StatefulWidget {
  AddTextSubTextPostWidgets({Key? key, required this.postsModel})
      : super(key: key);

  PostsModel postsModel;

  @override
  State<AddTextSubTextPostWidgets> createState() =>
      _AddTextSubTextPostWidgetsState();
}

class _AddTextSubTextPostWidgetsState extends State<AddTextSubTextPostWidgets> {
  UserProfileDataModel? _userProfileData;
  bool clickLike = false;
  int _currentSubPostIndex = -1; // -1 indicates the main post is being displayed

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    List<UserProfileDataModel> userData =
    await FbFireStoreController().getAllUserData();
    setState(() {
      _userProfileData = userData
          .firstWhere((user) => user.userDataId == widget.postsModel.userId);
    });
  }

  void _showNextSubPost() {
    if (_currentSubPostIndex < widget.postsModel.subPost.length - 1) {
      setState(() {
        _currentSubPostIndex++;
      });
    }
  }

  void _returnToMainPost() {
    setState(() {
      _currentSubPostIndex = -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PostHeaderWidget(postsModel: widget.postsModel),
        Padding(
          padding: EdgeInsets.only(left: 54.w, right: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (_currentSubPostIndex == -1) ...[
                Text(
                  widget.postsModel.content,
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: HexColor('#333333'),
                    fontFamily: 'BreeSerif',
                  ),
                ),
                SizedBox(height: 12.h),
                if (widget.postsModel.subPost.isNotEmpty)
                  GestureDetector(
                    onTap: _showNextSubPost,
                    child: _buildShowSubPost(0),
                  ),
              ] else if (_currentSubPostIndex < widget.postsModel.subPost.length) ...[
                GestureDetector(
                  onTap: _showNextSubPost,
                  child: _buildShowSubPost(_currentSubPostIndex),
                ),
                if (_currentSubPostIndex + 1 < widget.postsModel.subPost.length)
                  GestureDetector(
                    onTap: _showNextSubPost,
                    child: _buildSubPost(_currentSubPostIndex + 1),
                  ),
                SizedBox(height: 6.h),
                InkWell(onTap: () => _returnToMainPost(),
                  child: Text('Return to Main Post',style: TextStyle(
                      fontSize: 10.sp,
                      color: HexColor('#474747'),
                      fontFamily: 'BreeSerif'),),
                ),
              ],
            ],
          ),
        ),
        PostActionWidget(postsModel: widget.postsModel),
      ],
    );
  }

  Widget _buildShowSubPost(int index) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: _currentSubPostIndex != -1 ? null : EdgeInsets.symmetric(vertical: 12.h, horizontal: 18.w),
      decoration: _currentSubPostIndex != -1 ? null: BoxDecoration(
        borderRadius: BorderRadius.circular(15.sp),
        border: Border.all(
          color: HexColor('#333333'),
          width: 1.sp,
        ),
      ),
      clipBehavior: _currentSubPostIndex != -1 ?Clip.none: Clip.antiAlias,
      child: Column(
        children: [
          _currentSubPostIndex != -1 ? SizedBox():Row(
            children: [
              Container(
                width: 20.w,
                height: 20.w,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.sp)),
                child: CachedNetworkImage(
                  imageUrl: _userProfileData!.profileImageUrl,
                  width: 20.w,
                  height: 20.w,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder:
                      (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              SizedBox(width: 6.w),
              Text(
                _userProfileData!.firstName + ' ' + _userProfileData!.lastName,
                style: TextStyle(
                    fontSize: 10.sp,
                    color: HexColor('#474747'),
                    fontFamily: 'BreeSerif'),
              ),
              Spacer(),
              Text(
                '4 days',
                style: TextStyle(
                    fontSize: 10.sp,
                    color: HexColor('#474747'),
                    fontFamily: 'BreeSerif'),
              ),
            ],
          ),
          _currentSubPostIndex != -1 ? SizedBox() :SizedBox(height: 8.h),
          _currentSubPostIndex != -1 ? SizedBox() : Divider(
            color: Colors.black,
            height: 2,
            indent: 24.w,
            endIndent: 24.w,
            thickness: 1,
          ),
          _currentSubPostIndex != -1 ? SizedBox() :SizedBox(height: 8.h),
          Text(
            widget.postsModel.subPost[index],
            style: TextStyle(
                fontSize: 10.sp,
                color: HexColor('#333333'),
                fontFamily: 'BreeSerif'),
          ),
        ],
      ),
    );
  }
  Widget _buildSubPost(int index) {
    return Container(
      margin: EdgeInsets.only(bottom: 6.h),
      padding:  EdgeInsets.symmetric(vertical: 12.h, horizontal: 18.w),
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(15.sp),
        border: Border.all(
          color: HexColor('#333333'),
          width: 1.sp,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 20.w,
                height: 20.w,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.sp)),
                child: CachedNetworkImage(
                  imageUrl: _userProfileData!.profileImageUrl,
                  width: 20.w,
                  height: 20.w,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder:
                      (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              SizedBox(width: 6.w),
              Text(
                _userProfileData!.firstName + ' ' + _userProfileData!.lastName,
                style: TextStyle(
                    fontSize: 10.sp,
                    color: HexColor('#474747'),
                    fontFamily: 'BreeSerif'),
              ),
              Spacer(),
              Text(
                '4 days',
                style: TextStyle(
                    fontSize: 10.sp,
                    color: HexColor('#474747'),
                    fontFamily: 'BreeSerif'),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Divider(
            color: Colors.black,
            height: 2,
            indent: 24.w,
            endIndent: 24.w,
            thickness: 1,
          ),
          SizedBox(height: 8.h),
          Text(
            widget.postsModel.subPost[index],
            style: TextStyle(
                fontSize: 10.sp,
                color: HexColor('#333333'),
                fontFamily: 'BreeSerif'),
          ),
        ],
      ),
    );
  }

  PostsModel get newPostsModel {
    PostsModel postsModelA = PostsModel();
    postsModelA.postId = widget.postsModel.postId;
    postsModelA.commentCount = widget.postsModel.commentCount;
    postsModelA.content = widget.postsModel.content;
    postsModelA.imageUrl = widget.postsModel.imageUrl;
    postsModelA.likeCount = clickLike
        ? widget.postsModel.likeCount + 1
        : widget.postsModel.likeCount - 1;
    postsModelA.repostCount = widget.postsModel.repostCount;
    postsModelA.timestamp = widget.postsModel.timestamp;
    postsModelA.type = widget.postsModel.type;
    postsModelA.userId = widget.postsModel.userId;
    postsModelA.fileUrl = widget.postsModel.fileUrl;
    return postsModelA;
  }
}

// class _AddTextSubTextPostWidgetsState extends State<AddTextSubTextPostWidgets> {
//   UserProfileDataModel? _userProfileData;
//   bool clickLike = false;
//   int _currentSubPostIndex = -1; // -1 indicates the main post is being displayed
//
//   @override
//   void initState() {
//     super.initState();
//     _loadUserData();
//   }
//
//   Future<void> _loadUserData() async {
//     List<UserProfileDataModel> userData =
//     await FbFireStoreController().getAllUserData();
//     setState(() {
//       _userProfileData = userData
//           .firstWhere((user) => user.userDataId == widget.postsModel.userId);
//     });
//   }
//
//   void _showNextSubPost() {
//     if (_currentSubPostIndex < widget.postsModel.subPost.length - 1) {
//       setState(() {
//         _currentSubPostIndex++;
//       });
//     }
//   }
//
//   void _returnToMainPost() {
//     setState(() {
//       _currentSubPostIndex = -1;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         PostHeaderWidget(postsModel: widget.postsModel),
//         Padding(
//           padding: EdgeInsets.only(left: 54.w, right: 24.w),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               if (_currentSubPostIndex == -1) ...[
//                 Text(
//                   widget.postsModel.content,
//                   style: TextStyle(
//                     fontSize: 10.sp,
//                     color: HexColor('#333333'),
//                     fontFamily: 'BreeSerif',
//                   ),
//                 ),
//                 SizedBox(height: 6.h),
//                 if (widget.postsModel.subPost.isNotEmpty)
//                   GestureDetector(
//                     onTap: _showNextSubPost,
//                     child: _buildSubPost(0),
//                   ),
//               ] else if (_currentSubPostIndex < widget.postsModel.subPost.length) ...[
//                 GestureDetector(
//                   onTap: _showNextSubPost,
//                   child: _buildSubPost(_currentSubPostIndex),
//                 ),
//                 if (_currentSubPostIndex + 1 < widget.postsModel.subPost.length)
//                   GestureDetector(
//                     onTap: _showNextSubPost,
//                     child: _buildSubPost(_currentSubPostIndex + 1),
//                   ),
//                 SizedBox(height: 6.h),
//                 TextButton(
//                   onPressed: _returnToMainPost,
//                   child: Text('Return to Main Post'),
//                 ),
//               ],
//             ],
//           ),
//         ),
//         PostActionWidget(postsModel: widget.postsModel),
//       ],
//     );
//   }
//
//   Widget _buildSubPost(int index) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 6.h),
//       padding: _currentSubPostIndex != -1 ? null : EdgeInsets.symmetric(vertical: 12.h, horizontal: 18.w),
//       decoration: _currentSubPostIndex != -1 ? null: BoxDecoration(
//         borderRadius: BorderRadius.circular(15.sp),
//         border: Border.all(
//           color: HexColor('#333333'),
//           width: 1.sp,
//         ),
//       ),
//       clipBehavior: _currentSubPostIndex != -1 ?Clip.none: Clip.antiAlias,
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Container(
//                 width: 20.w,
//                 height: 20.w,
//                 clipBehavior: Clip.antiAlias,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(50.sp)),
//                 child: CachedNetworkImage(
//                   imageUrl: _userProfileData!.profileImageUrl,
//                   width: 20.w,
//                   height: 20.w,
//                   fit: BoxFit.cover,
//                   progressIndicatorBuilder:
//                       (context, url, downloadProgress) =>
//                       CircularProgressIndicator(
//                           value: downloadProgress.progress),
//                   errorWidget: (context, url, error) => Icon(Icons.error),
//                 ),
//               ),
//               SizedBox(width: 6.w),
//               Text(
//                 _userProfileData!.firstName + ' ' + _userProfileData!.lastName,
//                 style: TextStyle(
//                     fontSize: 10.sp,
//                     color: HexColor('#474747'),
//                     fontFamily: 'BreeSerif'),
//               ),
//               Spacer(),
//               Text(
//                 '4 days',
//                 style: TextStyle(
//                     fontSize: 10.sp,
//                     color: HexColor('#474747'),
//                     fontFamily: 'BreeSerif'),
//               ),
//             ],
//           ),
//           SizedBox(height: 8.h),
//           Divider(
//             color: Colors.black,
//             height: 2,
//             indent: 24.w,
//             endIndent: 24.w,
//             thickness: 1,
//           ),
//           SizedBox(height: 8.h),
//           Text(
//             widget.postsModel.subPost[index],
//             style: TextStyle(
//                 fontSize: 9.sp,
//                 color: HexColor('#333333'),
//                 fontFamily: 'BreeSerif'),
//           ),
//         ],
//       ),
//     );
//   }
//
//   PostsModel get newPostsModel {
//     PostsModel postsModelA = PostsModel();
//     postsModelA.postId = widget.postsModel.postId;
//     postsModelA.commentCount = widget.postsModel.commentCount;
//     postsModelA.content = widget.postsModel.content;
//     postsModelA.imageUrl = widget.postsModel.imageUrl;
//     postsModelA.likeCount = clickLike
//         ? widget.postsModel.likeCount + 1
//         : widget.postsModel.likeCount - 1;
//     postsModelA.repostCount = widget.postsModel.repostCount;
//     postsModelA.timestamp = widget.postsModel.timestamp;
//     postsModelA.type = widget.postsModel.type;
//     postsModelA.userId = widget.postsModel.userId;
//     postsModelA.fileUrl = widget.postsModel.fileUrl;
//     return postsModelA;
//   }
// }
