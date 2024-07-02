import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:difaf_al_wafa_app/models/posta_models/posts_model.dart';
import 'package:difaf_al_wafa_app/screens/widgets/add_story_widget.dart';
import 'package:difaf_al_wafa_app/screens/widgets/post_widgets/add_repost_widgets.dart';
import 'package:difaf_al_wafa_app/screens/widgets/post_widgets/add_video_post_widgets.dart';
import 'package:difaf_al_wafa_app/screens/widgets/users_storys_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../controllers/firebase_controllers/fb_firestore_controller.dart';
import '../../widgets/post_widgets/add_audio_post_widgets.dart';
import '../../widgets/post_widgets/add_instagram_post_widget.dart';
import '../../widgets/post_widgets/add_text_photo_post_widgets.dart';
import '../../widgets/post_widgets/add_videos_reels_widgets.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bool hasAddedStory = false;
  final bool isActive = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadPostsData();
  }

  Future<void> _loadPostsData() async {
    List<PostsModel> userData = await FbFireStoreController().getAllPostsData();
    // setState(() {
    //   _postsData = userData.firstWhere((user) => user. == SharedPrefController().userIdRegistration);
    //   _isLoading = false;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          // Users Stories
          ConstrainedBox(
            constraints: BoxConstraints(
              // maxWidth: double.infinity,
              maxHeight: 110.h,
            ),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, // Number of columns
                  crossAxisSpacing: 12.w,
                  // mainAxisSpacing: 12.h,
                  childAspectRatio: 76 / 56),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              padding: EdgeInsets.only(top: 18.h, left: 24.w, right: 24.w),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return AddStoryWidget(hasAddedStory: hasAddedStory);
                } else {
                  return UsersStorysWidget(
                    index: index,
                    isActive: isActive,
                  );
                }
              },
            ),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: FbFireStoreController().readPosts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                List<QueryDocumentSnapshot> document =
                    snapshot.data!.docs; // عشان اقدر اجيب طولها
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: document.length,
                  itemBuilder: (context, index) {
                    // switch (document[index].get('type')) {
                    switch ('textImage') {
                      // case 'text':
                      // return AddTextPostWidget();
                      case 'textImage':
                        return AddTextPhotoPostWidgets(
                          postsModel: mapPostsModel(document[index]),
                        );

                      /// Photo And Text Post Like X
                      case 'image':
                        return AddInstagramPostWidget();

                      /// Photo Post Like Instagram
                      case 'video':
                        return AddVideoPostWidgets();

                      /// Single Video Post
                      case 'audio':
                        return AddAudioPostWidgets();

                      /// Audio Post
                      default:
                        return AddRepostWidgets();

                      /// Repost Post Like X
                    }
                  },

                  /// Videos Show
                  // AddVideosReelsWidgets(),
                );
              } else {
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
    );
  }

  PostsModel mapPostsModel(QueryDocumentSnapshot documentSnapshot) {
    PostsModel postsModel = PostsModel();

    postsModel.postId = documentSnapshot.get('postId');
    postsModel.mentions = documentSnapshot.get('mentions');
    postsModel.audioUrl = documentSnapshot.get('audioUrl');
    postsModel.commentCount = documentSnapshot.get('commentCount');
    postsModel.content = documentSnapshot.get('content');
    postsModel.imageUrl = documentSnapshot.get('imageUrl');
    postsModel.likeCount = documentSnapshot.get('likeCount');
    postsModel.repostCount = documentSnapshot.get('repostCount');
    postsModel.timestamp = documentSnapshot.get('timestamp');
    postsModel.type = documentSnapshot.get('type');
    postsModel.userId = documentSnapshot.get('userId');
    postsModel.videoUrl = documentSnapshot.get('videoUrl');

    return postsModel;
  }
}
