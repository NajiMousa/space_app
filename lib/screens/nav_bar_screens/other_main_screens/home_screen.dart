import 'package:difaf_al_wafa_app/screens/widgets/add_story_widget.dart';
import 'package:difaf_al_wafa_app/screens/widgets/post_widgets/add_repost_widgets.dart';
import 'package:difaf_al_wafa_app/screens/widgets/post_widgets/add_video_post_widgets.dart';
import 'package:difaf_al_wafa_app/screens/widgets/users_storys_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../widgets/post_widgets/add_audio_post_widgets.dart';
import '../../widgets/post_widgets/add_instagram_post_widget.dart';
import '../../widgets/post_widgets/add_text_photo_post_widgets.dart';
import '../../widgets/post_widgets/add_videos_reels_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bool hasAddedStory = true;
  final bool isActive = true;
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
                  return UsersStorysWidget(index: index, isActive: isActive,);
                }
              },
            ),
          ),
          // Photo Post Like Instagram
          AddInstagramPostWidget(),
          // Photo And Text Post Like X
          AddTextPhotoPostWidgets(),
          //Repost Post Like X
          AddRepostWidgets(),
          // Audio Post
          AddAudioPostWidgets(),
          // Videos Show
          AddVideosReelsWidgets(),
          //Single Video Post
         AddVideoPostWidgets(),
        ],
      ),
    );
  }
}
