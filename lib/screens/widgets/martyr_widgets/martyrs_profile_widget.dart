import 'package:cached_network_image/cached_network_image.dart';
import 'package:difaf_al_wafa_app/models/martyr_models/martyr_request_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:shimmer/shimmer.dart';

import '../../../models/martyr_models/martyr_profile_data_model.dart';

class MartyrsProfileWidget extends StatelessWidget {
  MartyrsProfileWidget({Key? key, required this.martyrProfileDataModel})
      : super(key: key);

  final MartyrProfileDataModel martyrProfileDataModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.sp),
            color: HexColor('#FFFFFF'),
          ),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.sp),
              color: HexColor('#FFFFFF'),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 90.h,
                  child: CachedNetworkImage(
                    imageUrl: martyrProfileDataModel.backgroundImage,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Shimmer.fromColors(
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
                //   'images/coverImage.png',
                //   width: double.infinity,
                //   fit: BoxFit.fill,
                // ),
                SizedBox(height: 18.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    martyrProfileDataModel.firstName +
                        ' ' +
                        martyrProfileDataModel.lastName,
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: HexColor('#474747'),
                        fontFamily: 'BreeSerif'),
                  ),
                ),
                SizedBox(height: 4.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    martyrProfileDataModel.bio,
                    style: TextStyle(
                        fontSize: 11.sp,
                        color: HexColor('#474747').withOpacity(0.7),
                        fontFamily: 'BreeSerif'),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 4.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    '3.1K Candle || 1.2K follower',
                    style: TextStyle(
                        fontSize: 10.sp,
                        color: HexColor('#3396F9'),
                        fontFamily: 'BreeSerif'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 24),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: HexColor('#333333'),
                        ),
                        borderRadius: BorderRadius.circular(
                            15.sp), // Set your desired radius here
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 6.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'images/addFollow.svg',
                            height: 16.h,
                            width: 16.w,
                            color: HexColor('#333333'),
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            AppLocalizations.of(context)!.follow,
                            style: TextStyle(
                              color: HexColor('#333333'),
                              fontSize: 10.sp,
                              fontFamily: 'BreeSerif',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.sp),
          ),
          child: CachedNetworkImage(
            imageUrl: martyrProfileDataModel.profileImage,
            width: double.infinity,
            fit: BoxFit.cover,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
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
          // Image.asset(
          //   'images/userIcon.png',
          //   width: double.infinity,
          //   fit: BoxFit.fill,
          // ),
          width: 40.w,
          height: 40.h,
          margin: EdgeInsets.only(top: 65.h, left: 15.w),
        )
      ],
    );
  }
}