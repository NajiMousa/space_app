import 'package:cached_network_image/cached_network_image.dart';
import 'package:difaf_al_wafa_app/screens/profile_screens/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../controllers/firebase_controllers/fb_firestore_controller.dart';
import '../../../../models/post_models/posts_model.dart';
import '../../../../models/user_models/user_profile_data_model.dart';

class PostHeaderWidget extends StatefulWidget {
  PostHeaderWidget({super.key, required this.postsModel});

  PostsModel postsModel;

  @override
  State<PostHeaderWidget> createState() => _PostHeaderWidgetState();
}

class _PostHeaderWidgetState extends State<PostHeaderWidget> {
  UserProfileDataModel? _userProfileData;

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
      print('widget.postsModel.userId');
      print(widget.postsModel.userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _userProfileData == null ? Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        enabled: true,
        child: Container(
          width: 50.w,
          height: 50.w,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.sp)),)
    ) : Padding(
      padding: EdgeInsets.only(top: 12.h, right: 24.w, left: 24.w, bottom: 9.h),
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
              Container(
                width: 30.w,
                height: 30.w,
                clipBehavior: Clip.antiAlias,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(50.sp)),
                child: CachedNetworkImage(
                  imageUrl: _userProfileData!.profileImageUrl,
                  width: 30.w,
                  height: 30.w,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          enabled: true,
                          child: Container(
                            width: 30.w,
                            height: 30.w,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.sp)),
                          )),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              // Image.asset(
              //   'images/userIcon.png',
              //   width: 30.w,
              //   height: 30.w,
              // ),
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
                  InkWell(
                    onTap: () => Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return UserProfileScreen(
                          userProfileData: _userProfileData!,
                        );
                      },
                    )),
                    child: Text(
                      _userProfileData!.firstName +
                          ' ' +
                          _userProfileData!.lastName,
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: HexColor('#474747'),
                          fontFamily: 'BreeSerif'),
                    ),
                  ),
                  SizedBox(
                    width: 6.w,
                  ),
                  widget.postsModel.type == 'repost'
                      ? SizedBox()
                      : Text(
                          AppLocalizations.of(context)!.withFriends,
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: HexColor('#333333'),
                              fontFamily: 'BreeSerif'),
                        ),
                  widget.postsModel.type == 'repost'
                      ? SizedBox()
                      : SizedBox(
                          width: 6.w,
                        ),
                  widget.postsModel.type == 'repost'
                      ? SizedBox()
                      : InkWell(
                          onTap: () =>
                              Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return UserProfileScreen(
                                userProfileData: _userProfileData!,
                              );
                            },
                          )),
                          child: Text(
                            'Mj Silva',
                            // mentionedName.first,
                            style: TextStyle(
                                fontSize: 10.sp,
                                color: HexColor('#474747'),
                                fontFamily: 'BreeSerif'),
                          ),
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
    );
  }
}
