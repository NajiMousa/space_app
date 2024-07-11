
import 'package:difaf_al_wafa_app/screens/widgets/post_widgets/post_part_widgets/post_action_widget.dart';
import 'package:difaf_al_wafa_app/screens/widgets/post_widgets/post_part_widgets/post_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../models/post_models/posts_model.dart';

class AddTextOptionQesitionPostWidgets extends StatefulWidget {
  AddTextOptionQesitionPostWidgets({Key? key, required this.postsModel})
      : super(key: key);

  PostsModel postsModel;

  @override
  State<AddTextOptionQesitionPostWidgets> createState() =>
      _AddTextOptionQesitionPostWidgetsState();
}

class _AddTextOptionQesitionPostWidgetsState
    extends State<AddTextOptionQesitionPostWidgets> {

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
              ListView.builder(
                // scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.postsModel.optionQesition.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 6.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.sp),
                      border: Border.all(
                        color: HexColor('#333333'),
                        width: 1.sp,
                      ),
                    ),
                    clipBehavior: Clip.antiAlias,
                    // margin: EdgeInsets.symmetric(vertical: 5.0),
                    child: RadioListTile<String>(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        widget.postsModel.optionQesition[index],
                        style: TextStyle(
                            fontSize: 9.sp,
                            color: HexColor('#333333'),
                            fontFamily: 'BreeSerif'),
                      ),
                      // value: 'M',
                      value: '',
                      // groupValue: _gender,
                      groupValue: '',
                      onChanged: (String? value) {},
                      // onChanged: (String? value) {
                      //   if (_gender != null) {
                      //     setState(() {
                      //       _gender = value!;
                      //     });
                      //   }
                      // },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        PostActionWidget(postsModel: widget.postsModel),
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
