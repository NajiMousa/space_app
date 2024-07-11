
import 'package:difaf_al_wafa_app/screens/widgets/post_widgets/post_part_widgets/post_action_widget.dart';
import 'package:difaf_al_wafa_app/screens/widgets/post_widgets/post_part_widgets/post_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../models/post_models/posts_model.dart';

class AddTextPostWidget extends StatefulWidget {
  AddTextPostWidget({Key? key, required this.postsModel})
      : super(key: key);

  PostsModel postsModel;

  @override
  State<AddTextPostWidget> createState() =>
      _AddTextPostWidgetState();
}

class _AddTextPostWidgetState extends State<AddTextPostWidget> {

  bool clickLike = false;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Padding(
        //   padding: EdgeInsets.only(right: 24.w, left: 24.w, bottom: 9.h),
        //   child: Row(
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        //       Stack(
        //         alignment: AlignmentDirectional.center,
        //         children: [
        //           Container(
        //             decoration: BoxDecoration(
        //               color: HexColor('#21CED9'),
        //               borderRadius: BorderRadius.circular(56.sp),
        //             ),
        //             width: 34.w,
        //             height: 34.h,
        //           ),
        //           Container(
        //             width: 30.w,
        //             height: 30.w,
        //             clipBehavior: Clip.antiAlias,
        //             decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.sp)),
        //             child: CachedNetworkImage(
        //               imageUrl: _userProfileData!.profileImageUrl,
        //               width: 30.w,
        //               height: 30.w,
        //               fit: BoxFit.cover,
        //               progressIndicatorBuilder:
        //                   (context, url, downloadProgress) =>
        //                   CircularProgressIndicator(
        //                       value: downloadProgress.progress),
        //               errorWidget: (context, url, error) => Icon(Icons.error),
        //             ),
        //           ),
        //           // Image.asset(
        //           //   'images/userIcon.png',
        //           //   width: 30.w,
        //           //   height: 30.w,
        //           // ),
        //         ],
        //       ),
        //       SizedBox(
        //         width: 6.w,
        //       ),
        //       Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Row(
        //             children: [
        //               Text(
        //                 _userProfileData!.firstName +
        //                     ' ' +
        //                     _userProfileData!.lastName,
        //                 // 'Yasser Mansoor',
        //                 style: TextStyle(
        //                     fontSize: 12.sp,
        //                     color: HexColor('#474747'),
        //                     fontFamily: 'BreeSerif'),
        //               ),
        //               SizedBox(
        //                 width: 6.w,
        //               ),
        //               Text(
        //                 AppLocalizations.of(context)!.withFriends,
        //                 style: TextStyle(
        //                     fontSize: 12.sp,
        //                     color: HexColor('#333333'),
        //                     fontFamily: 'BreeSerif'),
        //               ),
        //               SizedBox(
        //                 width: 6.w,
        //               ),
        //               Text(
        //                 'Mj Silva',
        //                 style: TextStyle(
        //                     fontSize: 10.sp,
        //                     color: HexColor('#474747'),
        //                     fontFamily: 'BreeSerif'),
        //               ),
        //             ],
        //           ),
        //           Row(
        //             children: [
        //               Text(
        //                 '3.1K',
        //                 style: TextStyle(
        //                     fontSize: 10.sp,
        //                     color: HexColor('#6699CC'),
        //                     fontFamily: 'BreeSerif'),
        //               ),
        //               SizedBox(width: 4.w),
        //               Text(
        //                 AppLocalizations.of(context)!.follower,
        //                 style: TextStyle(
        //                     fontSize: 10.sp,
        //                     color: HexColor('#6699CC'),
        //                     fontFamily: 'BreeSerif'),
        //               ),
        //             ],
        //           ),
        //         ],
        //       ),
        //       Spacer(),
        //       Row(
        //         children: [
        //           Text(
        //             '5',
        //             style: TextStyle(
        //                 fontSize: 10.sp,
        //                 color: HexColor('#8C9EA0'),
        //                 fontFamily: 'BreeSerif'),
        //           ),
        //           SizedBox(width: 4.w),
        //           Text(
        //             AppLocalizations.of(context)!.hourAgo,
        //             style: TextStyle(
        //                 fontSize: 10.sp,
        //                 color: HexColor('#8C9EA0'),
        //                 fontFamily: 'BreeSerif'),
        //           ),
        //         ],
        //       ),
        //       SizedBox(width: 6.w),
        //       SvgPicture.asset(
        //         'images/more.svg',
        //         height: 16.h,
        //         width: 16.w,
        //         color: HexColor('#8C9EA0'),
        //       ),
        //     ],
        //   ),
        // ),
        PostHeaderWidget(postsModel: widget.postsModel,),
        Padding(
          padding: EdgeInsets.only(left: 54.w, right: 24.w),
          child:
          // Text(
          //   widget.postsModel.content,
          //   style: TextStyle(
          //       fontSize: 10.sp,
          //       color: HexColor('#333333'),
          //       fontFamily: 'BreeSerif'),
          // ),
          Text(
            widget.postsModel.content,
            style: TextStyle(
                fontSize: 10.sp,
                color: HexColor('#333333'),
                fontFamily: 'BreeSerif'),
          ),
        ),
        PostActionWidget(postsModel: widget.postsModel),
      ],
    );
  }

  PostsModel get newPostsModel {
    PostsModel postsModelA = PostsModel();
    postsModelA.postId = widget.postsModel.postId;
    // postsModelA.mentions = postsModel.mentions;
    // postsModelA.audioUrl = 'postsModel.audioUrl';
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
    // postsModelA.commentId = postsModel.commentId;
    // postsModelA.likeId = postsModel.likeId;
    // postsModelA.mentionedFriendsId = postsModel.mentionedFriendsId;
    // postsModelA.repostId = postsModel.repostId;
    // postsModelA.savedId = postsModel.savedId;

    return postsModelA;
  }
}
