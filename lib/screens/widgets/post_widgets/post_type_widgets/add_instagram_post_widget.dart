import 'package:cached_network_image/cached_network_image.dart';
import 'package:difaf_al_wafa_app/screens/widgets/post_widgets/post_part_widgets/post_action_widget.dart';
import 'package:difaf_al_wafa_app/screens/widgets/post_widgets/post_part_widgets/post_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shimmer/shimmer.dart';
import 'package:uuid/uuid.dart';
import '../../../../models/post_models/posts_model.dart';
import '../../app_widgets/loader_widgets/shimmer_placeholder.dart';

class AddInstagramPostWidget extends StatefulWidget {
  AddInstagramPostWidget({Key? key, required this.postsModel})
      : super(key: key);

  PostsModel postsModel;

  @override
  State<AddInstagramPostWidget> createState() => _AddInstagramPostWidgetState();
}

class _AddInstagramPostWidgetState extends State<AddInstagramPostWidget> {

  List<String> mentionedName = [];
  bool clickLike = false;
  bool clickSaved = false;
  bool? clickRepostChoice;
  Uuid uuid = Uuid();
  int imageNumber = 1;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PostHeaderWidget(postsModel: widget.postsModel,),
        Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            // Image.asset(
            //   'images/backgroundPost.png',
            //   width: double.infinity,
            //   height: 390.h,
            //   fit: BoxFit.fill,
            // ),
            Container(
              width: double.infinity,
              height: 500.h,
              child: PageView.builder(
                itemCount: widget.postsModel.imageUrl.length,
                itemBuilder: (context, index) {
                  imageNumber = index + 1;
                  return Container(
                    width: double.infinity,
                    height: 400.h,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0.sp)),
                    child: CachedNetworkImage(
                      imageUrl: widget.postsModel.imageUrl[index],
                      width: double.infinity,
                      height: 400.w,
                      fit: BoxFit.cover,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>ShimmerPlaceholder(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                    margin: EdgeInsets.only(bottom: 123.h),
                    // height: 12.h,
                    child: Text(
                      imageNumber.toString() +
                          '/' +
                          widget.postsModel.imageUrl.length.toString(),
                      style: TextStyle(
                          fontSize: 8.sp,
                          color: HexColor('#333333'),
                          fontFamily: 'BreeSerif'),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.sp),
                      color: HexColor('#FFFFFF'),
                    ),
                  ),
                  // Align(
                  //   alignment: AlignmentDirectional.center,
                  //   child: SvgPicture.asset(
                  //     'images/likePost.svg',
                  //     height: 75.h,
                  //     width: 75.w,
                  //     color: HexColor('#FF0000'),
                  //   ),
                  // ),
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
