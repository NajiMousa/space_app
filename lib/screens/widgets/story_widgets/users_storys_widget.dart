import 'package:cached_network_image/cached_network_image.dart';
import 'package:difaf_al_wafa_app/models/strory_models/story_data_model.dart';
import 'package:difaf_al_wafa_app/screens/profile_screens/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:shimmer/shimmer.dart';

import '../../../controllers/firebase_controllers/fb_firestore_controller.dart';
import '../../../models/user_models/user_profile_data_model.dart';
import '../../display_screens/user_story_screen.dart';
import '../app_widgets/loader_widgets/shimmer_placeholder.dart';


class UsersStorysWidget extends StatefulWidget {
  UsersStorysWidget({Key? key, required this.userProfileDataModel, required this.isActive, required this.users, required this.initialIndex}) : super(key: key);

  UserProfileDataModel userProfileDataModel;
  // final int index;
  final bool isActive;
  final List<UserProfileDataModel> users;
  final int initialIndex;

  @override
  State<UsersStorysWidget> createState() => _UsersStorysWidgetState();
}

class _UsersStorysWidgetState extends State<UsersStorysWidget> {

  @override
  Widget build(BuildContext context) {
    return
    GestureDetector(
      // onTap: () {
      //   Navigator.push(context, MaterialPageRoute(builder: (context) {
      //     return UserStoryScreen(userProfileDataModel: widget.userProfileDataModel,);
      //   },));
      // },

        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return UserStoryScreen(
              userProfileDataModel: widget.userProfileDataModel,
              users: widget.users,
              initialIndex: widget.initialIndex,
            );
          }));
        },
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: HexColor('#21CED9'),
                  borderRadius: BorderRadius.circular(56.sp),
                ),
                width: 56.w,
                height: 56.h,
              ),
              Container(
                width: 50.w,
                height: 50.w,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.sp)),
                child: CachedNetworkImage(
                  imageUrl: widget.userProfileDataModel.profileImageUrl,
                  width: 50.w,
                  height: 50.w,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder:
                      (context, url, downloadProgress) => Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          enabled: true,
                          child: Container(
                            width: 50.w,
                            height: 50.w,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.sp)),)
                      ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              // Image.asset(
              //   'images/userIcon.png',
              //   width: 50.w,
              //   height: 50.w,
              // ),

              widget.isActive ? Container(
                margin: EdgeInsets.only(
                    left: 42.w,
                    // right: 4.w,
                    top: 35.h,
                    bottom: 4.h),
                padding: EdgeInsets.symmetric(
                    horizontal: 2.w, vertical: 2.h),
                // margin: EdgeInsets.only(left: 24.w),
                width: 15.w,
                height: 15.h,
                decoration: BoxDecoration(
                  color: HexColor(
                      '#FFFFFF'), // Background color
                  shape: BoxShape
                      .circle, // Make it a circle if desired
                ),

                child: Container(
                  width: 19.w,
                  height: 19.h,
                  decoration: BoxDecoration(
                    color: HexColor(
                        '#333333'), // Background color
                    shape: BoxShape
                        .circle, // Make it a circle if desired
                  ),
                ),
              ): SizedBox()
            ],
          ),
          SizedBox(height: 6.h),
          Text(
            widget.userProfileDataModel.firstName,
            style: TextStyle(
                fontSize: 11.sp,
                color: HexColor('#474747'),
                fontFamily: 'BreeSerif'),
          ),
        ],
      )
    );
  }
}
