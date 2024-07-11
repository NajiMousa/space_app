import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:difaf_al_wafa_app/models/strory_models/story_data_model.dart';
import 'package:difaf_al_wafa_app/models/user_models/user_profile_data_model.dart';
import 'package:difaf_al_wafa_app/screens/widgets/story_widgets/add_story_widget.dart';
import 'package:difaf_al_wafa_app/screens/widgets/post_widgets/post_type_widgets/add_text_post_widget.dart';
import 'package:difaf_al_wafa_app/screens/widgets/post_widgets/post_type_widgets/add_repost_widgets.dart';
import 'package:difaf_al_wafa_app/screens/widgets/post_widgets/post_type_widgets/add_video_post_widgets.dart';
import 'package:difaf_al_wafa_app/screens/widgets/story_widgets/users_storys_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../../controllers/firebase_controllers/fb_firestore_controller.dart';
import '../../../models/post_models/posts_model.dart';
import '../../widgets/app_widgets/loader_widgets/shimmer_placeholder.dart';
import '../../widgets/post_widgets/post_type_widgets/add_audio_post_widgets.dart';
import '../../widgets/post_widgets/post_type_widgets/add_instagram_post_widget.dart';
import '../../widgets/post_widgets/post_type_widgets/add_text_option_qesition_post_widgets.dart';
import '../../widgets/post_widgets/post_type_widgets/add_text_photo_post_widgets.dart';
import '../../widgets/post_widgets/post_type_widgets/add_text_subtext_post_widgets.dart';
import '../../widgets/post_widgets/post_type_widgets/add_videos_reels_widgets.dart';

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
  }


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          // Users Stories
          StreamBuilder<QuerySnapshot>(
            stream: FbFireStoreController().readUserDataStream(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return ShimmerPlaceholder();
              } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                List<QueryDocumentSnapshot> document =
                    snapshot.data!.docs; // عشان اقدر اجيب طولها
                return ConstrainedBox(
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
                    itemCount: document.length+1,
                    padding: EdgeInsets.only(top: 18.h, left: 24.w, right: 24.w),
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return AddStoryWidget(hasAddedStory: hasAddedStory);
                      } else {
                        return UsersStorysWidget(
                          initialIndex: index - 1,
                          users: document.map((doc) => mapUserProfileDataModel(doc)).toList(),
                          userProfileDataModel: mapUserProfileDataModel(document[index-1]),
                          isActive: isActive,
                        );
                      }
                    },
                  ),
                );
              } else {
                return Center(
                  child:
                  AddStoryWidget(hasAddedStory: hasAddedStory),
                  // Column(
                  //   children: const [
                  //     Icon(
                  //       Icons.signal_cellular_nodata,
                  //       size: 85,
                  //     ),
                  //     Text('No Data'),
                  //   ],
                  // ),
                );
              }
            },
          ),

          SizedBox(height: 12.h),
          StreamBuilder<QuerySnapshot>(
            stream: FbFireStoreController().readPosts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    enabled: true,
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.sp)),)
                );
              } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {

                List<QueryDocumentSnapshot> document =
                    snapshot.data!.docs; // عشان اقدر اجيب طولها
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: document.length,
                  itemBuilder: (context, index) {
                    // DateTime.parse(document[index].get('timestamp'));
                    // document.sort((a, b) => b.compareTo(a.timestamp));
                    switch (document[index].get('type')) {
                    // switch ('textImage') {
                      case 'text':
                      return AddTextPostWidget(postsModel: mapPostsModel(document[index]),);
                      case 'textImage':
                      case 'testFile':
                        return AddTextPhotoPostWidgets(
                          postsModel: mapPostsModel(document[index]),
                        );

                      /// Photo And Text Post Like X
                      case 'image':
                        return AddInstagramPostWidget(postsModel: mapPostsModel(document[index]),);

                      /// Photo Post Like Instagram
                      case 'file':
                        return AddVideoPostWidgets(postsModel: mapPostsModel(document[index]),);

                      /// Single Video Post
                      case 'audio':
                        return AddAudioPostWidgets(postsModel: mapPostsModel(document[index]),);

                    /// Single Video Post
                      case 'subQuestion':
                        return AddTextOptionQesitionPostWidgets(postsModel: mapPostsModel(document[index]),);

                    /// Single Video Post
                      case 'subText':
                        return AddTextSubTextPostWidgets(postsModel: mapPostsModel(document[index]),);

                      case 'repost':
                        return AddRepostWidgets(postsModel: mapPostsModel(document[index]),);

                      /// Audio Post
                      // default:
                      //   return AddRepostWidgets(postsModel: mapPostsModel(document[index]),);

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
    // postsModel.mentions = documentSnapshot.get('mentions');
    // postsModel.audioUrl = documentSnapshot.get('audioUrl');
    postsModel.commentCount = documentSnapshot.get('commentCount');
    postsModel.content = documentSnapshot.get('content');
    postsModel.imageUrl = documentSnapshot.get('imageUrl');
    postsModel.likeCount = documentSnapshot.get('likeCount');
    postsModel.repostCount = documentSnapshot.get('repostCount');
    postsModel.timestamp = documentSnapshot.get('timestamp');
    postsModel.type = documentSnapshot.get('type');
    postsModel.userId = documentSnapshot.get('userId');
    postsModel.fileUrl = documentSnapshot.get('fileUrl');
    postsModel.subPost = documentSnapshot.get('subPost');
    postsModel.optionQesition = documentSnapshot.get('optionQesition');

    return postsModel;
  }

  StoryDataModel mapStoryDataModel(QueryDocumentSnapshot documentSnapshot) {

    StoryDataModel storyDataModel = StoryDataModel();

    storyDataModel.storyId = documentSnapshot.get('storyId');
    storyDataModel.mentionedFriendsId = documentSnapshot.get('mentionedFriendsId');
    storyDataModel.withFollower = documentSnapshot.get('withFollower');
    storyDataModel.text = documentSnapshot.get('text');
    storyDataModel.martyrIds = documentSnapshot.get('martyrIds');
    storyDataModel.likes = documentSnapshot.get('likes');
    storyDataModel.timestamp = documentSnapshot.get('timestamp');
    storyDataModel.userDataId = documentSnapshot.get('userDataId');
    storyDataModel.image = documentSnapshot.get('image');
    storyDataModel.video = documentSnapshot.get('video');

    return storyDataModel;
  }

  UserProfileDataModel mapUserProfileDataModel(QueryDocumentSnapshot documentSnapshot) {

    UserProfileDataModel userProfileDataModel = UserProfileDataModel();

    userProfileDataModel.userDataId = documentSnapshot.get('userDataId');
    userProfileDataModel.firstName = documentSnapshot.get('firstName');
    userProfileDataModel.lastName = documentSnapshot.get('lastName');
    userProfileDataModel.profileImageUrl = documentSnapshot.get('profileImageUrl');
    // userProfileDataModel.backgroundImage = documentSnapshot.get('backgroundImage');
    userProfileDataModel.dateOfBirth = documentSnapshot.get('dateOfBirth');
    userProfileDataModel.bio = documentSnapshot.get('bio');
    userProfileDataModel.userIdRegistration = documentSnapshot.get('userIdRegistration');

    return userProfileDataModel;
  }
}
