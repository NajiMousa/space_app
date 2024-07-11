import 'package:cached_network_image/cached_network_image.dart';
import 'package:difaf_al_wafa_app/screens/widgets/post_widgets/post_part_widgets/post_action_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

import '../../../../controllers/firebase_controllers/fb_firestore_controller.dart';
import '../../../../models/post_models/posts_model.dart';
import '../../../../models/user_models/user_profile_data_model.dart';
import '../../../post_screens/full_comment_screen.dart';
import '../../app_widgets/loader_widgets/shimmer_placeholder.dart';

class AddVideoPostWidgets extends StatefulWidget {
  AddVideoPostWidgets({Key? key, required this.postsModel}) : super(key: key);

  PostsModel postsModel;

  @override
  State<AddVideoPostWidgets> createState() => _AddVideoPostWidgetsState();
}

class _AddVideoPostWidgetsState extends State<AddVideoPostWidgets> {
  UserProfileDataModel? _userProfileData;

  bool clickLike = false;

  @override
  void initState() {
    // TODO: implement initState
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            // Image.asset(
            //   'images/backgroundPost.png',
            //   width: double.infinity,
            //   height: 390.h,
            //   fit: BoxFit.fill,
            // ),
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
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.sp)),
                    child: CachedNetworkImage(
                      imageUrl: _userProfileData!.profileImageUrl,
                      fit: BoxFit.cover,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              ShimmerPlaceholder(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 24.h, right: 24.w, left: 24.w, bottom: 9.h),
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
                      // Image.asset(
                      //   'images/userIcon.png',
                      //   width: 30.w,
                      //   height: 30.w,
                      // ),
                      Container(
                        width: 30.w,
                        height: 30.w,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.sp)),
                        child: CachedNetworkImage(
                          imageUrl: _userProfileData!.profileImageUrl,
                          width: 30.w,
                          height: 30.w,
                          fit: BoxFit.cover,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  ShimmerPlaceholder(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
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
                            _userProfileData!.firstName +
                                ' ' +
                                _userProfileData!.lastName,
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
          ],
        ),
        PostActionWidget(postsModel: widget.postsModel),
      ],
    );
  }
}
