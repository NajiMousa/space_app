import 'package:difaf_al_wafa_app/screens/widgets/post_widgets/post_part_widgets/post_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';


class AddVideosReelsWidgets extends StatelessWidget {
  const AddVideosReelsWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        // Padding(
        //   padding: EdgeInsets.only(
        //       top: 18.h, right: 24.w, left: 24.w, bottom: 9.h),
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
        //       SizedBox(width: 46.w),
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
        // PostHeaderWidget(postsModel: postsModel,),
        // todo: Reels And Videos
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: double.infinity,
            maxHeight: 250.h,
          ),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, // Number of columns
                crossAxisSpacing: 12.w,
                mainAxisSpacing: 12.h,
                childAspectRatio: 176 / 120),
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            padding: EdgeInsets.only(bottom: 18.h, left: 24.w),
            itemBuilder: (context, index) {
              return Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.sp),
                  color: HexColor('#FFFFFF'),
                ),
                // height: 12.h,
                child: Image.asset(
                  'images/backgroundPost.png',
                  fit: BoxFit.fill,
                ),
              );
            },
          ),
        ),
        // SizedBox(height: 8.h,),
        Divider(
          height: 0.5.h,
          color: HexColor('#D9D9D9'),
          thickness: 1.h,
        ),
        SizedBox(
          height: 18.h,
        ),
      ],
    );
  }
}
