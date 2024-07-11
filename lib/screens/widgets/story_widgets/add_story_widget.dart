import 'package:cached_network_image/cached_network_image.dart';
import 'package:difaf_al_wafa_app/prefs/shared_pref_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../controllers/firebase_controllers/fb_firestore_controller.dart';
import '../../../models/user_models/user_profile_data_model.dart';
import '../../../providers/data_provider.dart';
import '../app_widgets/loader_widgets/shimmer_placeholder.dart';

class AddStoryWidget extends StatefulWidget {
  AddStoryWidget({Key? key, required this.hasAddedStory}) : super(key: key);

  final bool hasAddedStory;

  @override
  State<AddStoryWidget> createState() => _AddStoryWidgetState();
}

class _AddStoryWidgetState extends State<AddStoryWidget> {
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
      _userProfileData =  userData.firstWhere(
          (user) => user.userDataId == SharedPrefController().userDataId);
    });
  }

  @override
  Widget build(BuildContext context) {
    // final userProfileData = Provider.of<DataProvider>(context).userProfileData;
    return GestureDetector(
      onTap: () {
        // Handle add story or view story action
      },
      child:
      _userProfileData == null ? Container(
        width: 56.w,
          height: 56.h,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.sp)),
          child: ShimmerPlaceholder()) :
      widget.hasAddedStory
          ? Column(
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
                    // Container(
                    //   decoration: BoxDecoration(
                    //     color: HexColor('#FFFFFF'),
                    //     borderRadius:
                    //     BorderRadius.circular(53.sp),
                    //   ),
                    //   width: 53.w,
                    //   height: 53.h,
                    // ),
                    Container(
                      width: 53.w,
                      height: 53.h,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.sp)),
                      child: CachedNetworkImage(
                        imageUrl: _userProfileData!.profileImageUrl,
                        fit: BoxFit.cover,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                Shimmer.fromColors(
                                    baseColor: Colors.grey.shade300,
                                    highlightColor: Colors.grey.shade100,
                                    enabled: true,
                                    child: Container(
                                      width: 53.w,
                                      height: 53.w,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50.sp)),
                                    )),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    // Image.asset(
                    //   'images/userIcon.png',
                    //   width: 50.w,
                    //   height: 50.w,
                    // ),
                  ],
                ),
                SizedBox(height: 6.h),
                Text(
                  'Mohamed',
                  style: TextStyle(
                      fontSize: 11.sp,
                      color: HexColor('#474747'),
                      fontFamily: 'BreeSerif'),
                ),
              ],
            )
          : InkWell(
              onTap: () => Navigator.pushNamed(context, '/add_story_screen'),
              child: Column(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      // CachedNetworkImage(
                      //   imageUrl: userProfileDataModel!.backgroundImage,
                      //   width: 56.w,
                      //   height: 56.w,
                      //   fit: BoxFit.cover,
                      //   progressIndicatorBuilder: (context, url, downloadProgress) =>
                      //       CircularProgressIndicator(value: downloadProgress.progress),
                      //   errorWidget: (context, url, error) => Icon(Icons.error),
                      // ),
                      _userProfileData == null ? Container(
                        width: 53.w,
                        height: 53.h,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.sp)),
                        child: CachedNetworkImage(
                          imageUrl: _userProfileData!.profileImageUrl,
                          fit: BoxFit.cover,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                              Shimmer.fromColors(
                                  baseColor: Colors.grey.shade300,
                                  highlightColor: Colors.grey.shade100,
                                  enabled: true,
                                  child: Container(
                                    width: 53.w,
                                    height: 53.w,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50.sp)),
                                  )),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      ) : Container(
                        width: 53.w,
                        height: 53.h,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.sp)),
                        child: CachedNetworkImage(
                          imageUrl: _userProfileData!.profileImageUrl,
                          fit: BoxFit.cover,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                              Shimmer.fromColors(
                                  baseColor: Colors.grey.shade300,
                                  highlightColor: Colors.grey.shade100,
                                  enabled: true,
                                  child: Container(
                                    width: 53.w,
                                    height: 53.w,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50.sp)),
                                  )),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: 45.w,
                            // right: 4.w,
                            top: 36.h,
                            bottom: 4.h),
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 5.h),
                        // margin: EdgeInsets.only(left: 24.w),
                        width: 20.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                          color: HexColor('#21CED9'), // Background color
                          shape: BoxShape.circle, // Make it a circle if desired
                        ),
                        child: InkWell(
                          onTap: () {
                            // Navigator.pop(context);
                          },
                          child: SvgPicture.asset(
                            'images/addPost.svg',
                            width: 15.w,
                            height: 15.h,
                            color: HexColor('#FFFFFF'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    AppLocalizations.of(context)!.addStory,
                    style: TextStyle(
                        fontSize: 11.sp,
                        color: HexColor('#21CED9'),
                        fontFamily: 'BreeSerif'),
                  ),
                ],
              ),
            ),
    );
  }
}
