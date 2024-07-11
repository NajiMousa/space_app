import 'package:difaf_al_wafa_app/screens/widgets/post_widgets/post_part_widgets/post_action_widget.dart';
import 'package:difaf_al_wafa_app/screens/widgets/post_widgets/post_part_widgets/post_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../models/post_models/posts_model.dart';
import 'add_audio_post_widgets.dart';
import 'add_instagram_post_widget.dart';
import 'add_text_option_qesition_post_widgets.dart';
import 'add_text_photo_post_widgets.dart';
import 'add_text_post_widget.dart';
import 'add_text_subtext_post_widgets.dart';
import 'add_video_post_widgets.dart';

class AddRepostWidgets extends StatefulWidget {
  AddRepostWidgets({Key? key, required this.postsModel}) : super(key: key);

  PostsModel postsModel;

  @override
  State<AddRepostWidgets> createState() => _AddRepostWidgetsState();
}

class _AddRepostWidgetsState extends State<AddRepostWidgets> {

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
        //           Image.asset(
        //             'images/userIcon.png',
        //             width: 30.w,
        //             height: 30.w,
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
        //                 'Yasser Mansoor',
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
          child: Column(
            children: [
              Text(
                '“"In their time among us, they radiated kindness and grace, leaving behind memories that will forever embrace." Her laughter, a melody that brightened every room, now echoes only in our hearts.  Her absence, a vast silence we\'ll forever strive to fill with cherished memories.',
                style: TextStyle(
                    fontSize: 10.sp,
                    color: HexColor('#333333'),
                    fontFamily: 'BreeSerif'),
              ),
              SizedBox(
                height: 6.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.sp),
                  color: HexColor('#D6E0E6').withOpacity(0.5),
                ),
                child: _performSwitch(postsModel: widget.postsModel),
                // Column(
                //   children: [
                //     Row(
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       children: [
                //         Stack(
                //           alignment: AlignmentDirectional.center,
                //           children: [
                //             Container(
                //               decoration: BoxDecoration(
                //                 color: HexColor('#21CED9'),
                //                 borderRadius: BorderRadius.circular(56.sp),
                //               ),
                //               width: 34.w,
                //               height: 34.h,
                //             ),
                //             Container(
                //               width: 30.w,
                //               height: 30.h,
                //               clipBehavior: Clip.antiAlias,
                //               decoration: BoxDecoration(
                //                   borderRadius: BorderRadius.circular(0.sp)),
                //               child: CachedNetworkImage(
                //                 imageUrl: '_userProfileData!.profileImageUrl',
                //                 width: 30.w,
                //                 height: 30.w,
                //                 fit: BoxFit.cover,
                //                 progressIndicatorBuilder:
                //                     (context, url, downloadProgress) =>
                //                         CircularProgressIndicator(
                //                             value: downloadProgress.progress),
                //                 errorWidget: (context, url, error) =>
                //                     Icon(Icons.error),
                //               ),
                //             ),
                //             // Image.asset(
                //             //   'images/userIcon.png',
                //             //   width: 30.w,
                //             //   height: 30.w,
                //             // ),
                //           ],
                //         ),
                //         SizedBox(
                //           width: 6.w,
                //         ),
                //         Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Row(
                //               children: [
                //                 Text(
                //                   '_userProfileData!.firstName + ' ' + _userProfileData!.lastName',
                //                   style: TextStyle(
                //                       fontSize: 12.sp,
                //                       color: HexColor('#474747'),
                //                       fontFamily: 'BreeSerif'),
                //                 ),
                //                 SizedBox(
                //                   width: 6.w,
                //                 ),
                //                 Text(
                //                   'With',
                //                   style: TextStyle(
                //                       fontSize: 12.sp,
                //                       color: HexColor('#333333'),
                //                       fontFamily: 'BreeSerif'),
                //                 ),
                //                 SizedBox(
                //                   width: 6.w,
                //                 ),
                //                 Text(
                //                   'Mj Silva',
                //                   style: TextStyle(
                //                       fontSize: 10.sp,
                //                       color: HexColor('#474747'),
                //                       fontFamily: 'BreeSerif'),
                //                 ),
                //               ],
                //             ),
                //             Text(
                //               '3.1K follwer',
                //               style: TextStyle(
                //                   fontSize: 10.sp,
                //                   color: HexColor('#6699CC'),
                //                   fontFamily: 'BreeSerif'),
                //             ),
                //           ],
                //         ),
                //       ],
                //     ),
                //     SizedBox(
                //       height: 8.h,
                //     ),
                //     Text(
                //       widget.postsModel.content,
                //       style: TextStyle(
                //           fontSize: 10.sp,
                //           color: HexColor('#333333'),
                //           fontFamily: 'BreeSerif'),
                //     ),
                //     SizedBox(
                //       height: 8.h,
                //     ),
                //     Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Column(
                //           children: [
                //             Container(
                //               clipBehavior: Clip.antiAlias,
                //               decoration: BoxDecoration(
                //                   borderRadius: BorderRadius.circular(10.sp)),
                //               child: Image.asset(
                //                 'images/backgroundPost.png',
                //                 width: 120.w,
                //                 height: 90.h,
                //                 fit: BoxFit.fill,
                //               ),
                //             ),
                //             SizedBox(
                //               height: 8.h,
                //             ),
                //             Container(
                //               clipBehavior: Clip.antiAlias,
                //               decoration: BoxDecoration(
                //                   borderRadius: BorderRadius.circular(10.sp)),
                //               child: Image.asset(
                //                 'images/backgroundPost.png',
                //                 width: 120.w,
                //                 height: 90.h,
                //                 fit: BoxFit.fill,
                //               ),
                //             ),
                //           ],
                //         ),
                //         SizedBox(
                //           width: 8.w,
                //         ),
                //         Container(
                //           clipBehavior: Clip.antiAlias,
                //           decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(10.sp)),
                //           child: Image.asset(
                //             'images/backgroundPost.png',
                //             width: 154.w,
                //             height: 190.h,
                //             fit: BoxFit.fill,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ],
                // ),
              ),
            ],
          ),
        ),
        PostActionWidget(postsModel: widget.postsModel),
      ],
    );
  }
  Widget _performSwitch({required PostsModel postsModel}) {
    switch (postsModel.type) {
      case 'text':
        return AddTextPostWidget(postsModel: postsModel);
      case 'textImage':
      case 'testFile':
        return AddTextPhotoPostWidgets(postsModel: postsModel);
      case 'image':
        return AddInstagramPostWidget(postsModel: postsModel);
      case 'file':
        return AddVideoPostWidgets(postsModel: postsModel);
      case 'audio':
        return AddAudioPostWidgets(postsModel: postsModel);
      case 'subQuestion':
        return AddTextOptionQesitionPostWidgets(postsModel: postsModel);
      case 'subText':
        return AddTextSubTextPostWidgets(postsModel: postsModel);
      default:
        return SizedBox(); // Ensure that a widget is returned
    }
  }
}
