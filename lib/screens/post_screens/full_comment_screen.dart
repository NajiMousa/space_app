import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:difaf_al_wafa_app/prefs/shared_pref_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:uuid/uuid.dart';
import '../../../controllers/firebase_controllers/fb_firestore_controller.dart';
import '../../models/post_models/comments_model.dart';
import '../../models/post_models/posts_model.dart';

class FullCommentScreen extends StatefulWidget {
  FullCommentScreen({Key? key,required this.postsModel}) : super(key: key);

  final PostsModel postsModel;
  @override
  State<FullCommentScreen> createState() => _FullCommentScreenState();
}

class _FullCommentScreenState extends State<FullCommentScreen> {

  late TextEditingController _commentTextEditingController;
  CommentsModel? commentsData;
  List<CommentsModel>? commentDataList;
  Uuid uuid = Uuid();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _commentTextEditingController = TextEditingController();
    _loadPostsData();
  }

  Future<void> _loadPostsData() async {
    // commentDataList = await FbFireStoreController().getAllComments();
    setState(() {
      commentsData = commentDataList!.firstWhere((comment) => comment.postId == widget.postsModel.postId);
      // _isLoading = false;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _commentTextEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#333333"),
      bottomNavigationBar: SingleChildScrollView(
        child: Container(
          height: 72.0, // Set the height here
          child: Padding(
            padding:
            EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                      margin: EdgeInsets.only(left: 12.w),
                      alignment: AlignmentDirectional.center,
                      width: 180.w,
                      height: 45.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50.sp),
                      ),
                      child: TextField(
                        controller: _commentTextEditingController,
                        style: TextStyle(
                          fontFamily: 'BreeSerif',
                          fontSize: 11.sp,
                          color: HexColor('#8C9EA0'),
                        ),
                        maxLines: 1,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'write your comment',
                          labelStyle: TextStyle(
                            fontFamily: 'BreeSerif',
                            fontSize: 11.sp,
                            color: HexColor('#8C9EA0'),
                          ),
                          enabledBorder: getBorder(),
                          focusedBorder: getBorder(),
                        ),
                      )),
                ),
                InkWell(
                  onTap: () async => await performProcess(),
                  child: Padding(
                    padding: EdgeInsets.only(left: 12.w, right: 6.w),
                    child: SvgPicture.asset(
                      'images/messengerIcon.svg',
                      height: 20.h,
                      width: 20.w,
                      color: HexColor('#FFFFFF'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(42.sp),
                bottomRight: Radius.circular(42.sp),
              ),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: 32.w, right: 24.w, top: 63.h, bottom: 18.h),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(
                          'images/arrow_back.svg',
                          width: 10.w,
                          height: 16.h,
                          color: HexColor('#333333'),
                        ),
                      ),
                      SizedBox(
                        width: 18.w,
                      ),
                      Text(
                        'Comments',
                        style: TextStyle(
                            fontSize: 15.sp,
                            color: HexColor('#333333'),
                            fontFamily: 'BreeSerif'),
                      ),
                    ],
                  ),
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: FbFireStoreController().readComment(widget.postsModel.postId),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                      List<QueryDocumentSnapshot> document =
                          snapshot.data!.docs;
                      return Expanded(
                        child: ListView.builder(
                          reverse: true,
                          padding: EdgeInsets.all(8.0),
                          itemCount: document.length,
                          itemBuilder: (context, index) {
                            // final message = _messages[index];
                            return Padding(
                              padding: EdgeInsets.only(right: 24.w, left: 24.w, bottom: 12.h),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 3.h),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15.sp),
                                        color: HexColor('#333333').withOpacity(0.1)
                                    ),
                                    child: ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      title: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            document[index].get('comment'),
                                            style: TextStyle(
                                                fontSize: 9.sp,
                                                color: HexColor('#333333'),
                                                fontFamily: 'BreeSerif'),
                                          ),
                                          // SizedBox(height:12.h,),
                                          // Divider(height: 1,thickness: 1,endIndent: 160.w,indent: 0.w,color: Colors.black,),
                                          // SizedBox(height:6.h,),

                                        ],
                                      ),
                                      trailing: Icon(Icons.delete,color: Colors.red,),
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.only(right: 12.w, left: 12.w, top: 6.h),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Like',
                                          style: TextStyle(
                                              fontSize: 9.sp,
                                              color: HexColor('#333333'),
                                              fontFamily: 'BreeSerif'),
                                        ),
                                        SizedBox(width: 15.w),
                                        Text(
                                          'Reply',
                                          style: TextStyle(
                                              fontSize: 9.sp,
                                              color: HexColor('#333333'),
                                              fontFamily: 'BreeSerif'),
                                        ),
                                        SizedBox(width: 15.w),
                                        Text(
                                          'Edit',
                                          style: TextStyle(
                                              fontSize: 9.sp,
                                              color: HexColor('#333333'),
                                              fontFamily: 'BreeSerif'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      // setState(() {
                      // noData = true;
                      // });
                      return Center(
                        child: Column(
                          children: const [
                            Icon(
                              Icons.signal_cellular_nodata,
                              size: 85,
                            ),
                            Text('No Data'),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Future<void> performProcess() async {
    if (checkData()) {
      await process();
    }
  }

  bool checkData() {
    if (_commentTextEditingController.text.isNotEmpty ) {
      ///showSnackBar(context : context , message : 'Enter required Data', error : true);
      return true;
    }
    return false;
  }

  Future<void> process() async {

    bool status =  await FbFireStoreController().createComment(commentsModel: commentModel);
    if (status) {
      print('01');
      await FbFireStoreController().updatePost(postsModel: postModel);
      print('02');
      clear();
    }
      else{
        clear();
      }

    ///showSnackBar(context : context , message : status ? 'Process Success' : 'Process Failed', error : true);
  }

  CommentsModel get commentModel {
    CommentsModel commentModel = CommentsModel();
    commentModel.commentId = uuid.v4();
    commentModel.comment = _commentTextEditingController.text;
    commentModel.postId = widget.postsModel.postId;
    commentModel.userId = SharedPrefController().userDataId;
    commentModel.timestamp = DateTime.now().toString();

    return commentModel;
  }

  PostsModel get postModel {
    PostsModel postModel = PostsModel();
    print('10');
    postModel.postId = widget.postsModel.postId;
    postModel.timestamp = widget.postsModel.timestamp;
    postModel.userId = widget.postsModel.userId;
    postModel.mentionedFriendsId = widget.postsModel.mentionedFriendsId;
    postModel.optionQesition = widget.postsModel.optionQesition;
    postModel.subPost = widget.postsModel.subPost;
    postModel.imageUrl = widget.postsModel.imageUrl;
    // postModel.feeling = widget.postsModel.feeling;
    postModel.fileUrl = widget.postsModel.fileUrl;
    postModel.content = widget.postsModel.content;
    postModel.likeCount = widget.postsModel.likeCount;
    postModel.type = widget.postsModel.type;
    postModel.repostCount = widget.postsModel.repostCount;
    postModel.commentCount = widget.postsModel.commentCount+1;

    return postModel;
  }

  void clear(){
    _commentTextEditingController.text = '';
  }
}

OutlineInputBorder getBorder({Color borderColor = Colors.white}) {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: borderColor,
      width: 1,
    ),
    borderRadius: BorderRadius.circular(50),
  );
}
