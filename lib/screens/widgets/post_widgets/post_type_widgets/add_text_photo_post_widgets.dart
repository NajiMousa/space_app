import 'package:cached_network_image/cached_network_image.dart';
import 'package:difaf_al_wafa_app/screens/widgets/post_widgets/post_part_widgets/post_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../controllers/firebase_controllers/fb_firestore_controller.dart';
import '../../../../models/post_models/posts_model.dart';
import '../../../post_screens/full_comment_screen.dart';
import '../../../post_screens/full_image_gallery.dart';

class AddTextPhotoPostWidgets extends StatefulWidget {
  AddTextPhotoPostWidgets({Key? key, required this.postsModel})
      : super(key: key);

  PostsModel postsModel;

  @override
  State<AddTextPhotoPostWidgets> createState() =>
      _AddTextPhotoPostWidgetsState();
}

class _AddTextPhotoPostWidgetsState extends State<AddTextPhotoPostWidgets> {

  bool clickLike = false;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
              Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.postsModel.content,
                style: TextStyle(
                    fontSize: 10.sp,
                    color: HexColor('#333333'),
                    fontFamily: 'BreeSerif'),
              ),
              SizedBox(
                height: 6.h,
              ),
              widget.postsModel.imageUrl.length == 1
                  ? InkWell(
                      onTap: () {
                        print('object');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FullImageGallery(
                                imageUrls: widget.postsModel.imageUrl),
                          ),
                        );
                        print('object001');
                      },
                      child: Container(
                        width: double.infinity,
                        height: 400.h,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.sp)),
                        child: CachedNetworkImage(
                          imageUrl: widget.postsModel.imageUrl[0],
                          width: double.infinity,
                          height: 300.w,
                          fit: BoxFit.cover,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  CircularProgressIndicator(
                                      value: downloadProgress.progress),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                    )
                  : GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: widget.postsModel.imageUrl.length < 3 ? 3 :2,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0,
                      ),
                      itemCount: widget.postsModel.imageUrl.length > 4
                          ? 4
                          : widget.postsModel.imageUrl.length,
                      itemBuilder: (context, index) {
                        if (index == 2 &&
                            widget.postsModel.imageUrl.length < 3){
                          Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(15.sp)),
                            child: CachedNetworkImage(
                              imageUrl:
                              widget.postsModel.imageUrl[index],
                              fit: BoxFit.cover,
                              progressIndicatorBuilder: (context, url,
                                  downloadProgress) =>
                                  CircularProgressIndicator(
                                      value: downloadProgress.progress),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          );
                        }
                        else if (index == 3 &&
                            widget.postsModel.imageUrl.length > 4) {
                          return InkWell(
                            onTap: () {
                              print('object');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FullImageGallery(
                                      imageUrls: widget.postsModel.imageUrl),
                                ),
                              );
                              print('object001');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.sp)),
                              clipBehavior: Clip.antiAlias,
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Container(
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.sp)),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          widget.postsModel.imageUrl[index],
                                      fit: BoxFit.cover,
                                      progressIndicatorBuilder: (context, url,
                                              downloadProgress) =>
                                          CircularProgressIndicator(
                                              value: downloadProgress.progress),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                  ),
                                  // Image.network(
                                  //   widget.postsModel.imageUrl[index],
                                  //   fit: BoxFit.cover,
                                  // ),
                                  Container(
                                    color: Colors.black54,
                                    child: Center(
                                      child: Text(
                                        '+${widget.postsModel.imageUrl.length - 3}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else {
                          return InkWell(
                            onTap: () {
                              print('object');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FullImageGallery(
                                      imageUrls: widget.postsModel.imageUrl),
                                ),
                              );
                              print('object001');
                            },
                            child: Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.sp)),
                              child: CachedNetworkImage(
                                imageUrl: widget.postsModel.imageUrl[index],
                                fit: BoxFit.cover,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        CircularProgressIndicator(
                                            value: downloadProgress.progress),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          );
                          // Image.network(
                          //   widget.postsModel.imageUrl[index],
                          //   fit: BoxFit.cover,
                          // );
                        }
                      },
                    ),

              // ListView.builder(
              //   // scrollDirection: Axis.horizontal,
              //   shrinkWrap: true,
              //   physics: NeverScrollableScrollPhysics(),
              //   itemCount: widget.postsModel.imageUrl.length,
              //   itemBuilder: (context, index) {
              //     return Container(
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(15.sp)
              //       ),
              //       clipBehavior: Clip.antiAlias,
              //       // margin: EdgeInsets.symmetric(vertical: 5.0),
              //       child: Image.network(
              //         widget.postsModel.imageUrl[index],
              //         fit: BoxFit.cover,
              //         width: double.infinity,
              //         height: 300.0, // You can adjust the height as needed
              //       ),
              //     );
              //   },
              // ),

              // Container(
              //   clipBehavior: Clip.antiAlias,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10.sp)),
              //   child: Image.network(
              //     'images/backgroundPost.png',
              //     width: double.infinity,
              //     height: 390.h,
              //     fit: BoxFit.fill,
              //   ),
              // ),
            ],
          ),
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 6.h),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      if (clickLike) clickLike = false;
                      // if(!clickLike) clickLike = true;
                      FbFireStoreController()
                          .updatePost(postsModel: newPostsModel);
                      // clickLike ? clickLike = true : clickLike = false;
                    },
                    child: SvgPicture.asset(
                      'images/likePost.svg',
                      height: 20.h,
                      width: 20.w,
                      color: clickLike ? Colors.red : HexColor('#333333'),
                    ),
                  ),
                  SizedBox(width: 5.w),
                  InkWell(
                    onTap: () {
                      // FbFireStoreController().updatePost(postsModel: newPostsModel);
                      clickLike = true;
                    },
                    child: Text(
                      widget.postsModel.likeCount.toString(),
                      style: TextStyle(
                          fontSize: 9.sp,
                          color: HexColor('#333333'),
                          fontFamily: 'BreeSerif'),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  InkWell(
                    onTap: () => Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return FullCommentScreen(postsModel: widget.postsModel);
                      },
                    )),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 16.w),
                        SvgPicture.asset(
                          'images/commentIcon.svg',
                          height: 20.h,
                          width: 20.w,
                          color: HexColor('#333333'),
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          widget.postsModel.commentCount.toString(),
                          style: TextStyle(
                              fontSize: 9.sp,
                              color: HexColor('#333333'),
                              fontFamily: 'BreeSerif'),
                        ),
                      ],
                    ),
                  ),

                  SvgPicture.asset(
                    'images/repostIcon.svg',
                    height: 40.h,
                    width: 40.w,
                    color: HexColor('#333333'),
                  ),
                  // SizedBox(width: 5.w),
                  Text(
                    widget.postsModel.repostCount.toString(),
                    style: TextStyle(
                        fontSize: 9.sp,
                        color: HexColor('#333333'),
                        fontFamily: 'BreeSerif'),
                  ),
                  // SizedBox(
                  //   width: 90.w,
                  // ),
                  Spacer(),
                  SvgPicture.asset(
                    'images/savedIcon.svg',
                    height: 20.h,
                    width: 20.w,
                    color: HexColor('#8C9EA0'),
                  ),
                  SizedBox(width: 20.w),
                  SvgPicture.asset(
                    'images/messengerIcon.svg',
                    height: 20.h,
                    width: 20.w,
                    color: HexColor('#8C9EA0'),
                  ),
                ],
              ),
            ),
            Divider(
              height: 0.5.h,
              color: HexColor('#D9D9D9'),
              thickness: 1.h,
            ),
            SizedBox(
              height: 20.h,
            )
          ],
        ),
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
