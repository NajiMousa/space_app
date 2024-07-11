
import 'package:cached_network_image/cached_network_image.dart';
import 'package:difaf_al_wafa_app/prefs/shared_pref_controller.dart';
import 'package:difaf_al_wafa_app/screens/widgets/post_widgets/post_part_widgets/post_action_widget.dart';
import 'package:difaf_al_wafa_app/screens/widgets/post_widgets/post_part_widgets/post_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uuid/uuid.dart';
import '../../../../controllers/firebase_controllers/fb_firestore_controller.dart';
import '../../../../models/post_models/likes_model.dart';
import '../../../../models/post_models/posts_model.dart';
import '../../app_widgets/loader_widgets/shimmer_placeholder.dart';

class AddAudioPostWidgets extends StatefulWidget {
  AddAudioPostWidgets({Key? key, required this.postsModel}) : super(key: key);

  PostsModel postsModel;

  @override
  State<AddAudioPostWidgets> createState() => _AddAudioPostWidgetsState();
}

class _AddAudioPostWidgetsState extends State<AddAudioPostWidgets> {

  bool clickLike = false;
  Uuid uuid = Uuid();


  @override
  Widget build(BuildContext context) {
    return Column(
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
        //           // Image.asset(
        //           //   'images/userIcon.png',
        //           //   width: 30.w,
        //           //   height: 30.w,
        //           // ),
        //
        //           Container(
        //             width: 30.w,
        //             height: 30.w,
        //             clipBehavior: Clip.antiAlias,
        //             decoration: BoxDecoration(
        //                 borderRadius: BorderRadius.circular(50.sp)),
        //             child: CachedNetworkImage(
        //               imageUrl: _userProfileData!.profileImageUrl,
        //               width: 30.w,
        //               height: 30.w,
        //               fit: BoxFit.cover,
        //               progressIndicatorBuilder:
        //                   (context, url, downloadProgress) =>
        //                       CircularProgressIndicator(
        //                           value: downloadProgress.progress),
        //               errorWidget: (context, url, error) => Icon(Icons.error),
        //             ),
        //           ),
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
        ListView.builder(
          // scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: widget.postsModel.imageUrl.length,
          itemBuilder: (context, index) {
            return Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15.sp)),
              clipBehavior: Clip.antiAlias,
              // margin: EdgeInsets.symmetric(vertical: 5.0),
              child: Container(
                width: 53.w,
                height: 53.h,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.sp)),
                child: CachedNetworkImage(
                  imageUrl: widget.postsModel.imageUrl[index],
                  fit: BoxFit.cover,
                  progressIndicatorBuilder:
                      (context, url, downloadProgress) =>ShimmerPlaceholder(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              // Image.network(
              //   widget.postsModel.imageUrl[index],
              //   fit: BoxFit.cover,
              //   width: double.infinity,
              //   height: 300.0, // You can adjust the height as needed
              // ),
            );
          },
        ),
        // Container(
        //   padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
        //   margin: EdgeInsets.only(left: 54.w, right: 24.w),
        //   width: double.infinity,
        //   decoration: BoxDecoration(
        //     color: HexColor('#D6E0E6'),
        //     borderRadius: BorderRadius.circular(15.sp),
        //   ),
        //   child: Row(
        //     children: [
        //       SvgPicture.asset(
        //         'images/audioWave.svg',
        //         height: 24.h,
        //         width: 90.w,
        //         color: HexColor('#8C9EA0'),
        //       ),
        //       SvgPicture.asset(
        //         'images/audioWave.svg',
        //         height: 24.h,
        //         width: 90.w,
        //         color: HexColor('#8C9EA0'),
        //       ),
        //       SvgPicture.asset(
        //         'images/layer1.svg',
        //         height: 24.h,
        //         width: 45.w,
        //         color: HexColor('#8C9EA0'),
        //       ),
        //       Divider(thickness: 2, height: 34.h),
        //       SizedBox(
        //         width: 20.w,
        //       ),
        //       SvgPicture.asset(
        //         'images/playAudio.svg',
        //         height: 24.h,
        //         width: 24.w,
        //         color: HexColor('#333333'),
        //       ),
        //     ],
        //   ),
        // ),
        PostActionWidget(postsModel: widget.postsModel),
      ],
    );
  }

  void _performLikePost() {
    clickLike ?
      FbFireStoreController().addLike(likesModel: likeModel) :
      FbFireStoreController().deleteLike(postId: likeModel.postId, userId: likeModel.userId );
  }

  LikesModel get likeModel {
    LikesModel likesModel = LikesModel();
    likesModel.userId = SharedPrefController().userDataId;
    likesModel.timestamp = DateTime.now().toString();
    likesModel.postId = widget.postsModel.postId;
    likesModel.likeId = uuid.v4();
    return likesModel;
  }
}
