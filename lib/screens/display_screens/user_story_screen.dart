import 'package:cached_network_image/cached_network_image.dart';
import 'package:difaf_al_wafa_app/models/strory_models/story_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:video_player/video_player.dart';

import '../../controllers/firebase_controllers/fb_firestore_controller.dart';
import '../../models/user_models/user_profile_data_model.dart';
import '../drawer_menu_Screens/messanger_screens/single_messanger_screen.dart';

class UserStoryScreen extends StatefulWidget {
  UserStoryScreen({super.key, required this.userProfileDataModel, required this.users, required this.initialIndex});

  UserProfileDataModel userProfileDataModel;
  final List<UserProfileDataModel> users;
  final int initialIndex;

  @override
  State<UserStoryScreen> createState() => _UserStoryScreenState();
}

class _UserStoryScreenState extends State<UserStoryScreen> {
  StoryDataModel? storyDataModel;
  List<StoryDataModel> _storyData = [];
  PageController _pageController = PageController();
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = widget.initialIndex;
    _loadStoryData();
  }

  Future<void> _loadStoryData() async {
    List<StoryDataModel> storyData =
        await FbFireStoreController().getAllUserStory();
    setState(() {
      _storyData = storyData;
      // _isLoading = false;
    });
  }

  void _onStoryComplete() {
    if (currentIndex < widget.users.length - 1) {
      setState(() {
        currentIndex++;
        _loadStoryData();
      });
    } else {
      Navigator.pop(context);
    }
  }

  void _onTapStory(bool isNext) {
    if (_pageController.hasClients) {
      final nextPage = isNext ? _pageController.page! + 1 : _pageController.page! - 1;
      if (nextPage >= 0 && nextPage < _storyData.length) {
        _pageController.animateToPage(
          nextPage.toInt(),
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#333333'),
      bottomNavigationBar: SingleChildScrollView(
        child: Container(
          height: 72.0, // Set the height here
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  child: SvgPicture.asset(
                    'images/likePost.svg',
                    height: 24.h,
                    width: 24.w,
                    color: HexColor('#FFFFFF'),
                  ),
                ),
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
                        // controller: _messageTextEditingController,
                        style: TextStyle(
                          fontFamily: 'BreeSerif',
                          fontSize: 11.sp,
                          color: HexColor('#8C9EA0'),
                        ),
                        maxLines: 1,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Write your Message',
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
                  // onTap: () async => await performProcess(),
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
      body: Container(
        width: double.infinity,
        child: _storyData.isEmpty
            ? Center(child: CircularProgressIndicator())
            : Stack(
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
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: _storyData.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTapUp: (details) {
                            final screenWidth = MediaQuery.of(context).size.width;
                            if (details.localPosition.dx > screenWidth / 2) {
                              _onTapStory(true); // Move to the next story
                            } else {
                              _onTapStory(false); // Move to the previous story
                            }
                          },
                          child:
                          StoryItemWidget(
                            storyDataModel: _storyData[index],
                            userProfileDataModel: widget.users[currentIndex],
                            onNextStory: _onStoryComplete,
                          )
                          // StoryItemWidget(
                          //   storyDataModel: _storyData[index],
                          //   userProfileDataModel: widget.userProfileDataModel,
                          //   onNextStory: () => _onTapStory(true),
                          // ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      children: [
                        SizedBox(height: 32.h),
                        Positioned(
                          top: 10,
                          left: 10,
                          right: 10,
                          child: LinearProgressIndicator(
                            // value: _animationController.value,
                            backgroundColor: Colors.black26,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              height: 40.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.sp)),
                              clipBehavior: Clip.antiAlias,
                              child: CachedNetworkImage(
                                imageUrl:
                                widget.users.first.profileImageUrl,
                                fit: BoxFit.cover,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        CircularProgressIndicator(
                                            value: downloadProgress.progress),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Column(
                              children: [
                                Text(
                                  widget.userProfileDataModel.firstName +
                                      ' ' +
                                      widget.userProfileDataModel.lastName,
                                  style: TextStyle(
                                      fontSize: 11.sp,
                                      color: HexColor('#333333'),
                                      fontFamily: 'BreeSerif'),
                                ),
                                Text(
                                  widget.userProfileDataModel.firstName +
                                      ' ' +
                                      widget.userProfileDataModel.lastName,
                                  style: TextStyle(
                                      fontSize: 11.sp,
                                      color: HexColor('#333333'),
                                      fontFamily: 'BreeSerif'),
                                ),
                              ],
                            ),
                            Spacer(),
                            Text(
                              _storyData.first.timestamp,
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  color: HexColor('#333333'),
                                  fontFamily: 'BreeSerif'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class StoryItemWidget extends StatelessWidget {
  final StoryDataModel storyDataModel;
  final UserProfileDataModel userProfileDataModel;
  final VoidCallback onNextStory;

  StoryItemWidget(
      {required this.storyDataModel, required this.userProfileDataModel, required this.onNextStory});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      width: double.infinity,
      child: Stack(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: storyDataModel.image.length,
            itemBuilder: (context, picIndex) {
              return StoryMediaWidget(
                mediaUrl: storyDataModel.image[picIndex],
                onNextStory: onNextStory, setAnimationController: (AnimationController ) {  },
              );
              //   CachedNetworkImage(
              //   imageUrl: storyDataModel.image[picIndex],
              //   fit: BoxFit.cover,
              //   progressIndicatorBuilder: (context, url, downloadProgress) =>
              //       CircularProgressIndicator(value: downloadProgress.progress),
              //   errorWidget: (context, url, error) => Icon(Icons.error),
              // );
            },
          ),
        ],
      ),
    );
  }
}

class StoryMediaWidget extends StatefulWidget {
  final String mediaUrl;
  final VoidCallback onNextStory;
  final Function(AnimationController) setAnimationController;

  StoryMediaWidget({required this.mediaUrl, required this.onNextStory, required this.setAnimationController});

  @override
  _StoryMediaWidgetState createState() => _StoryMediaWidgetState();
}

class _StoryMediaWidgetState extends State<StoryMediaWidget>  with SingleTickerProviderStateMixin{

  late Duration _mediaDuration;
  late AnimationController _animationController;
  VideoPlayerController? _videoController;
  bool isVideo = false;

  @override
  void initState() {
    super.initState();
    if (widget.mediaUrl.endsWith('.mp4')) {
      isVideo = true;
      _videoController = VideoPlayerController.network(widget.mediaUrl)
        ..initialize().then((_) {
          setState(() {
            _mediaDuration = _videoController!.value.duration;
            _videoController!.play();
            _animationController = AnimationController(
              vsync: this,
              duration: _mediaDuration,
            );
            widget.setAnimationController(_animationController);
            _animationController.forward();
          });
          _videoController!.addListener(() {
            if (_videoController!.value.position == _videoController!.value.duration) {
              widget.onNextStory();
            }
          });
        });
    } else {
      isVideo = false;
      _mediaDuration = Duration(seconds: 5); // Fixed duration for images
      _animationController = AnimationController(
        vsync: this,
        duration: _mediaDuration,
      );
      widget.setAnimationController(_animationController);
      _animationController.forward();
      _animationController.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          widget.onNextStory();
        }
      });
    }
  }
  // @override
  // void initState() {
  //   super.initState();
  //   if (widget.mediaUrl.endsWith('.mp4')) {
  //     isVideo = true;
  //     _videoController = VideoPlayerController.network(widget.mediaUrl)
  //       ..initialize().then((_) {
  //         setState(() {
  //           _mediaDuration = _videoController!.value.duration;
  //           _videoController!.play();
  //           _animationController.duration = _mediaDuration;
  //           _animationController.forward();
  //         });
  //         _videoController!.addListener(() {
  //           if (_videoController!.value.position == _videoController!.value.duration) {
  //             widget.onNextStory();
  //           }
  //         });
  //       });
  //   } else {
  //     isVideo = false;
  //     _mediaDuration = Duration(seconds: 5); // Fixed duration for images
  //     _animationController = AnimationController(
  //       vsync: this,
  //       duration: _mediaDuration,
  //     )..forward();
  //     _animationController.addStatusListener((status) {
  //       if (status == AnimationStatus.completed) {
  //         widget.onNextStory();
  //       }
  //     });
  //   }
  // }

  @override
  void dispose() {
    _videoController?.dispose();
    _animationController.dispose();
    super.dispose();
  }

   get animationControllerM {
    return _animationController;
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        isVideo
            ? _videoController!.value.isInitialized
            ? AspectRatio(
          aspectRatio: _videoController!.value.aspectRatio,
          child: VideoPlayer(_videoController!),
        )
            : Center(child: CircularProgressIndicator())
            : CachedNetworkImage(
          imageUrl: widget.mediaUrl,
          fit: BoxFit.cover,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              CircularProgressIndicator(value: downloadProgress.progress),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),

      ],
    );
  }
}
