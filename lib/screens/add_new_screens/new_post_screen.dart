import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:difaf_al_wafa_app/prefs/shared_pref_controller.dart';
import 'package:difaf_al_wafa_app/screens/post_screens/tag_people_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:uuid/uuid.dart';
import 'package:video_player/video_player.dart';
import '../../controllers/firebase_controllers/fb_firestore_controller.dart';
import '../../controllers/firebase_controllers/fb_storage_controller.dart';
import '../../models/post_models/posts_model.dart';
import '../../models/user_models/user_profile_data_model.dart';
import '../primary_screens/main_screen.dart';
import '../widgets/app_widgets/app_text_field_widget.dart';
import '../widgets/post_widgets/post_type_widgets/add_audio_post_widgets.dart';
import '../widgets/post_widgets/post_type_widgets/add_instagram_post_widget.dart';
import '../widgets/post_widgets/post_type_widgets/add_text_option_qesition_post_widgets.dart';
import '../widgets/post_widgets/post_type_widgets/add_text_photo_post_widgets.dart';
import '../widgets/post_widgets/post_type_widgets/add_text_post_widget.dart';
import '../widgets/post_widgets/post_type_widgets/add_text_subtext_post_widgets.dart';
import '../widgets/post_widgets/post_type_widgets/add_video_post_widgets.dart';

class NewPostScreen extends StatefulWidget {
  NewPostScreen({Key? key, this.postsModel}) : super(key: key);

  PostsModel? postsModel;
  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  Uuid uuid = Uuid();
  SharedPrefController sharedPrefController = SharedPrefController();
  int _selectedTypePost = 0;
  UserProfileDataModel? _userProfileData;
  bool _isLoading = false;
  List<AssetEntity> _images = [];
  String postType='';
  bool _isRepost = false;

  late TextEditingController _contentTextEditorController;
  String? _textFileContent;

  final ImagePicker _picker = ImagePicker();
  List<PlatformFile> _pickedFiles = [];

  List<XFile> _selectedImages = [];

  List<String> imageUrls = [];
  List<String> fileUrls = [];
  List<String> subTexts = [];
  List<String> optionQesitions = [];


  final AudioPlayer _audioPlayer = AudioPlayer();
  Map<int, VideoPlayerController> _videoControllers = {};

  bool isAddFeeling = false;
  String? selectedFeeling;
  List<String> feelings = ['Happy', 'Sad', 'Excited', 'Angry'];

  List<TextEditingController> _subPublicationControllers = [];

  List<String> _taggedPeopleIds = [];

  bool isAddPoll = false;
  int numberOptions = 2;
  final List<TextEditingController> _optionControllers = [TextEditingController(), TextEditingController()];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('object01');
    _loadUserData();
    _requestPermission();
    print('object');

    _contentTextEditorController = TextEditingController();
  }

  Future<void> _loadUserData() async {
    List<UserProfileDataModel> userData =
    await FbFireStoreController().getAllUserData();
    setState(() {
      _userProfileData = userData
          .firstWhere((user) => user.userDataId == SharedPrefController().userDataId);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _contentTextEditorController.dispose();
    _audioPlayer.dispose();
    _videoControllers.forEach((index, controller) {
      controller.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#333333"),
      bottomNavigationBar: Container(
        height: 72.0, // Set the height here
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          scrollDirection: Axis.horizontal,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  _selectedTypePost = 0;
                });
              },
              child: Padding(
                padding: EdgeInsets.only(left: 33.w),
                child: Column(
                  children: [
                    _selectedTypePost == 0
                        ? Container(
                            decoration: BoxDecoration(
                              color: HexColor('#6699CC'),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(5.sp),
                                bottomLeft: Radius.circular(5.sp),
                              ),
                            ),
                            width: 29.w,
                            height: 5.h,
                          )
                        : SizedBox(
                            height: 5.h,
                          ),
                    SizedBox(height: 20.h),
                    Text(
                      AppLocalizations.of(context)!.all,
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: _selectedTypePost == 0
                              ? HexColor('#6699CC')
                              : HexColor('#8C9EA0'),
                          fontFamily: 'BreeSerif'),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _selectedTypePost = 1;
                });
              },
              child: Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: Column(
                  children: [
                    _selectedTypePost == 1
                        ? Container(
                            decoration: BoxDecoration(
                              color: HexColor('#6699CC'),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(5.sp),
                                bottomLeft: Radius.circular(5.sp),
                              ),
                            ),
                            width: 52.w,
                            height: 5.h,
                          )
                        : SizedBox(
                            height: 5.h,
                          ),
                    SizedBox(height: 20.h),
                    Text(
                      AppLocalizations.of(context)!.text,
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: _selectedTypePost == 1
                              ? HexColor('#6699CC')
                              : HexColor('#8C9EA0'),
                          fontFamily: 'BreeSerif'),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _selectedTypePost = 2;
                });
              },
              child: Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: Column(
                  children: [
                    _selectedTypePost == 2
                        ? Container(
                            decoration: BoxDecoration(
                              color: HexColor('#6699CC'),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(5.sp),
                                bottomLeft: Radius.circular(5.sp),
                              ),
                            ),
                            width: 55.w,
                            height: 5.h,
                          )
                        : SizedBox(
                            height: 5.h,
                          ),
                    SizedBox(height: 20.h),
                    Text(
                      AppLocalizations.of(context)!.photos,
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: _selectedTypePost == 2
                              ? HexColor('#6699CC')
                              : HexColor('#8C9EA0'),
                          fontFamily: 'BreeSerif'),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _selectedTypePost = 3;
                });
              },
              child: Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _selectedTypePost == 3
                        ? Container(
                            decoration: BoxDecoration(
                              color: HexColor('#6699CC'),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(5.sp),
                                bottomLeft: Radius.circular(5.sp),
                              ),
                            ),
                            width: 43.w,
                            height: 5.h,
                          )
                        : SizedBox(
                            height: 5.h,
                          ),
                    SizedBox(height: 20.h),
                    Text(
                      AppLocalizations.of(context)!.videos,
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: _selectedTypePost == 3
                              ? HexColor('#6699CC')
                              : HexColor('#8C9EA0'),
                          fontFamily: 'BreeSerif'),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _selectedTypePost = 4;
                });
              },
              child: Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _selectedTypePost == 4
                        ? Container(
                            decoration: BoxDecoration(
                              color: HexColor('#6699CC'),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(5.sp),
                                bottomLeft: Radius.circular(5.sp),
                              ),
                            ),
                            width: 44.w,
                            height: 5.h,
                          )
                        : SizedBox(
                            height: 5.h,
                          ),
                    SizedBox(height: 20.h),
                    Text(
                      AppLocalizations.of(context)!.audio,
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: _selectedTypePost == 4
                              ? HexColor('#6699CC')
                              : HexColor('#8C9EA0'),
                          fontFamily: 'BreeSerif'),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _selectedTypePost = 5;
                });
              },
              child: Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _selectedTypePost == 5
                        ? Container(
                      decoration: BoxDecoration(
                        color: HexColor('#6699CC'),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(5.sp),
                          bottomLeft: Radius.circular(5.sp),
                        ),
                      ),
                      width: 44.w,
                      height: 5.h,
                    )
                        : SizedBox(
                      height: 5.h,
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'Question',
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: _selectedTypePost == 5
                              ? HexColor('#6699CC')
                              : HexColor('#8C9EA0'),
                          fontFamily: 'BreeSerif'),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {

                setState(() {
                  isAddPoll ? _addOption() : _addSubPublication();
                  // isAddPoll
                  //     ? increasNum(numberOptions++)
                  //     : increasNum(numberOptions);
                  // _selectedIndex = 0;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                margin: sharedPrefController.language == 'en'
                    ? EdgeInsets.only(left: 24.w)
                    : EdgeInsets.only(right: 0.w),
                decoration: BoxDecoration(
                  color: Colors.white, // Background color
                  shape: BoxShape.circle, // Make it a circle if desired
                ),
                child: Icon(
                  Icons.add,
                  size: 24.sp,
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: HexColor('#FFFFFF'),
            flexibleSpace: Center(
              child: Padding(
                padding: EdgeInsets.only(right: 24.w, left: 24.w, top: 40.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // SvgPicture.asset('images/icons/icons.png'),
                    Container(
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              setState(() {
                                _isLoading = true;
                              });
                            },
                            child: SvgPicture.asset(
                              sharedPrefController.language == 'en'
                                  ? 'images/arrow_back.svg'
                                  : 'images/arrowForword.svg',
                              width: 10.w,
                              height: 16.h,
                              color: HexColor('#333333'),
                            ),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          Text(
                            AppLocalizations.of(context)!.newPost,
                            style: TextStyle(
                                fontSize: 20.sp,
                                color: HexColor('#333333'),
                                fontFamily: 'BreeSerif'),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(width: 60.w),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.w),
                      child: ElevatedButton(
                        onPressed: () async {
                          performProcess();
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: 4.h, horizontal: 18.w),
                          backgroundColor: HexColor('#333333'),
                          minimumSize: Size(57.w, 32.h),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadiusDirectional.circular(50.sp)),
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.postAll,
                          style: TextStyle(
                            color: HexColor('#FFFFFF'),
                            fontSize: 12.sp,
                            fontFamily: 'BreeSerif',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
      body: _isLoading ?SizedBox() : Stack(
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
              children: [
                SizedBox(height: 18.h),
                Expanded(
                  child: ListView(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 24.w, left: 20.w),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: HexColor('#333333'),
                              width: 1.sp,
                            ),
                            borderRadius: BorderRadius.circular(15.sp),),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 18.w),
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(50.sp)),
                                clipBehavior: Clip.antiAlias,
                                width: 32.w,
                                height: 32.w,
                                child: CachedNetworkImage(
                                  imageUrl:
                                  _userProfileData!.profileImageUrl,
                                  width: 32.w,
                                  height: 32.w,
                                  fit: BoxFit.cover,
                                  progressIndicatorBuilder: (context,
                                      url, downloadProgress) =>
                                      CircularProgressIndicator(
                                          value: downloadProgress
                                              .progress),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: sharedPrefController.language == 'en'
                                      ? EdgeInsets.only(left: 12.w)
                                      : EdgeInsets.only(right: 12.w),
                                  alignment: AlignmentDirectional.center,
                                  child: TextField(
                                    controller: _contentTextEditorController,
                                    style: TextStyle(
                                      fontFamily: 'BreeSerif',
                                      fontSize: 13.sp,
                                      color: HexColor('#8C9EA0'),
                                    ),
                                    maxLines: null,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: isAddPoll
                                          ? 'Write your Question'
                                          : AppLocalizations.of(context)!
                                          .writeYourMassage,
                                      enabledBorder: getBorder(),
                                      focusedBorder: getBorder(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      widget.postsModel != null ? _performSwitch(postsModel: widget.postsModel!):SizedBox(),
                      SizedBox(height: 12.h),
                      widget.postsModel != null ? SizedBox() :ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: _subPublicationControllers.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                              margin: EdgeInsets.only(left: 56.w, top: 6.h, bottom: 6.h , right: 24.w),
                              decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                              color: HexColor('#333333'),
                              width: 1.sp,
                          ),
                          borderRadius: BorderRadius.circular(15.sp), // Adjust the radius as needed
                              ),
                            child: Expanded(
                              child: Container(
                                margin: sharedPrefController.language == 'en'
                                    ? EdgeInsets.only(left: 0.w)
                                    : EdgeInsets.only(right: 12.w),
                                alignment: AlignmentDirectional.center,
                                child: Row(
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () => _removeSubPublication(index),
                                      child: Container(
                                        // margin: EdgeInsets.only(
                                        //     left: 24.w, bottom: 18.h),
                                        padding: EdgeInsets.all(5.sp),
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(20.sp),
                                          color: HexColor('#333333'),
                                        ),
                                        height: 20.h,
                                        width: 20.w,
                                        child: SvgPicture.asset(
                                          'images/close_round_icon.svg',
                                          width: 12.w,
                                          height: 12.h,
                                          color: HexColor('#FFFFFF'),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 15.w),
                                    Expanded(
                                      child: TextField(
                                        controller: _subPublicationControllers[index],
                                        style: TextStyle(
                                          fontFamily: 'BreeSerif',
                                          fontSize: 12.sp,
                                          color: HexColor('#8C9EA0'),
                                        ),
                                        maxLines: null,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          hintText: 'Sub Publication ${index + 1}',
                                          enabledBorder: getBorder(),
                                          focusedBorder: getBorder(),
                                        ),
                                      ),
                                    ),
                                  ]
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 12.h),
                      widget.postsModel != null ? SizedBox() :isAddFeeling
                          ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                            child: DropdownButton<String>(
                                hint: Text('Select your feeling'),
                                value: selectedFeeling,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedFeeling = newValue;
                                  });
                                },
                                items: feelings.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                          )
                          : SizedBox(),
                      SizedBox(height: 12.h),
                      widget.postsModel != null ? SizedBox() :isAddPoll
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isAddPoll = false;
                                    });
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 24.w, bottom: 18.h),
                                        padding: EdgeInsets.all(5.sp),
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.sp),
                                          color: HexColor('#333333'),
                                        ),
                                        height: 20.h,
                                        width: 20.w,
                                        child: SvgPicture.asset(
                                          'images/close_round_icon.svg',
                                          width: 12.w,
                                          height: 12.h,
                                          color: HexColor('#FFFFFF'),
                                        ),
                                      ),
                                      SizedBox(width: 12.w),
                                      Text(
                                        'Close the Poll',
                                        style: TextStyle(
                                            fontSize: 13.sp,
                                            color: HexColor('#333333'),
                                            fontFamily: 'BreeSerif'),
                                      ),
                                    ],
                                  ),
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: _optionControllers.length,
                                  itemBuilder: (context, index) {
                                    return Row(
                                      children: [
                                        Expanded(
                                          child: AppTextFieldWidget(
                                            textEditingController:
                                                _optionControllers[index],
                                            // prefixIcon: Icons.lock,
                                            hintText: 'Option ${index + 1}',
                                            obsecure: false,
                                            textInputType:
                                                TextInputType.emailAddress,
                                            errorText: '',
                                            // suffixIcon: Icon(Icons.hide_source),
                                          ),
                                        ),
                                        if (_optionControllers.length > 2)
                                          IconButton(
                                            icon: Icon(Icons.remove_circle),
                                            onPressed: () =>
                                                _removeOption(index),
                                          ),
                                      ],
                                    );
                                  },
                                ),
                              ],
                            )
                          : SizedBox(),
                      SizedBox(height: 12.h),
                      widget.postsModel != null ? SizedBox() :_selectedImages!.isNotEmpty ?
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: double.infinity,
                            maxHeight: 160.h,
                          ),
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1, // Number of columns
                                    crossAxisSpacing: 12.w,
                                    mainAxisSpacing: 12.h,
                                    childAspectRatio: 52 / 48),
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.only(left: 24.w, right: 24.w),
                            itemCount: _selectedImages!.length,
                            itemBuilder: (context, index) {
                              return Stack(
                                fit: StackFit.expand,
                                children: [
                                  Container(
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(10.sp),
                                      color: HexColor('#FFFFFF'),
                                    ),
                                    // height: 12.h,
                                    child: Image.file(
                                      File(_selectedImages![index].path),
                                      // _images[index] as File,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      print(index);
                                      _selectedImages!
                                          .remove(_selectedImages![index]);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          top: 15.h,
                                          left: 15.w,
                                          right: 112.w,
                                          bottom: 124.h),
                                      padding: EdgeInsets.all(5.sp),
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.sp),
                                        color: HexColor('#FFFFFF'),
                                      ),
                                      height: 20.h,
                                      width: 20.w,
                                      child: SvgPicture.asset(
                                        'images/close_round_icon.svg',
                                        width: 12.w,
                                        height: 12.h,
                                        color: HexColor('#45BD62'),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ) : SizedBox(),
                      SizedBox(height: 12.h),
                      widget.postsModel != null ? SizedBox() :_taggedPeopleIds.isNotEmpty?
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: Wrap(
                            spacing: 8.0,
                            children: _taggedPeopleIds
                                .map((id) => Chip(label: Text(id)))
                                .toList(),
                          ),
                        ): SizedBox(),
                      SizedBox(height: 12.h),
                      widget.postsModel != null ? SizedBox() :ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: _pickedFiles.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(_pickedFiles[index].name),
                            subtitle: Text(
                                _pickedFiles[index].extension ?? 'Unknown'),
                          );
                        },
                      ),
                      SizedBox(height: 24.h),
                      widget.postsModel != null ? SizedBox() :Padding(
                        padding: EdgeInsets.only(right: 24.w, left: 24.w),
                        child: Row(
                          children: [
                            Text(
                              AppLocalizations.of(context)!.otherAction,
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: HexColor('#D9D9D9'),
                                  fontFamily: 'BreeSerif'),
                            ),
                            Divider(
                              height: 0.5.h,
                              color: HexColor('#D9D9D9'),
                              thickness: 5.h,
                              indent: 95.w,
                              endIndent: 24.w,
                            ),
                          ],
                        ),
                      ),
                      widget.postsModel != null ? SizedBox() :InkWell(
                          onTap: () => _selectPeopleToTag(),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 38.w, top: 18.h, right: 24.w),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'images/tagFriends.svg',
                                  width: 20.w,
                                  height: 20.h,
                                  color: HexColor('#45BD62'),
                                ),
                                SizedBox(width: 12.w),
                                Text(
                                  AppLocalizations.of(context)!.tagFriends,
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      color: HexColor('#333333'),
                                      fontFamily: 'BreeSerif'),
                                ),
                              ],
                            ),
                          )),
                      widget.postsModel != null ? SizedBox() :InkWell(
                          onTap: () {
                            setState(() {
                              isAddFeeling = true;
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 38.w, top: 18.h, right: 24.w),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'images/face_smile_wink_icon.svg',
                                  width: 20.w,
                                  height: 20.h,
                                  color: HexColor('#F7B928'),
                                ),
                                SizedBox(width: 12.w),
                                Text(
                                  AppLocalizations.of(context)!.addFeeling,
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      color: HexColor('#333333'),
                                      fontFamily: 'BreeSerif'),
                                ),
                              ],
                            ),
                          )),
                      widget.postsModel != null ? SizedBox() :InkWell(
                          onTap: () {
                            setState(() {
                              isAddPoll = true;
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 38.w, top: 18.h, right: 24.w),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'images/poll_filled_icon.svg',
                                  width: 20.w,
                                  height: 20.h,
                                  color: HexColor('#2AB8A4'),
                                ),
                                SizedBox(width: 12.w),
                                Text(
                                  AppLocalizations.of(context)!.addQuestion,
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      color: HexColor('#333333'),
                                      fontFamily: 'BreeSerif'),
                                ),
                              ],
                            ),
                          )),
                      widget.postsModel == null || _selectedTypePost == 0 || _selectedTypePost == 4 ? InkWell(
                          onTap: () => _pickFiles(),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 38.w, top: 18.h, right: 24.w),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'images/attachment_icon.svg',
                                  width: 20.w,
                                  height: 20.h,
                                  color: HexColor('#00A5F4'),
                                ),
                                SizedBox(width: 12.w),
                                Text(
                                  AppLocalizations.of(context)!.addFile,
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      color: HexColor('#333333'),
                                      fontFamily: 'BreeSerif'),
                                ),
                              ],
                            ),
                          )) : SizedBox(),
                      // InkWell(
                      //     child: Padding(
                      //   padding:
                      //       EdgeInsets.only(left: 38.w, top: 18.h, right: 24.w),
                      //   child: Row(
                      //     children: [
                      //       SvgPicture.asset(
                      //         'images/location_country_icon.svg',
                      //         width: 20.w,
                      //         height: 20.h,
                      //         color: HexColor('#F5533D'),
                      //       ),
                      //       SizedBox(width: 12.w),
                      //       Text(
                      //         AppLocalizations.of(context)!.addEvent,
                      //         style: TextStyle(
                      //             fontSize: 13.sp,
                      //             color: HexColor('#333333'),
                      //             fontFamily: 'BreeSerif'),
                      //       ),
                      //     ],
                      //   ),
                      // )),
                      // InkWell(
                      //     child: Padding(
                      //   padding: EdgeInsets.only(
                      //       left: 38.w, top: 18.h, bottom: 24.h, right: 24.w),
                      //   child: Row(
                      //     children: [
                      //       SvgPicture.asset(
                      //         'images/gps_location_icon.svg',
                      //         width: 20.w,
                      //         height: 20.h,
                      //         color: HexColor('#F02849'),
                      //       ),
                      //       SizedBox(width: 12.w),
                      //       Text(
                      //         AppLocalizations.of(context)!.addLocation,
                      //         style: TextStyle(
                      //             fontSize: 13.sp,
                      //             color: HexColor('#333333'),
                      //             fontFamily: 'BreeSerif'),
                      //       ),
                      //     ],
                      //   ),
                      // )),
                      SizedBox(height: 24.h),
                      widget.postsModel != null ? SizedBox() : Padding(
                        padding: EdgeInsets.only(right: 24.w, left: 24.w),
                        child: Row(
                          children: [
                            Text(
                              AppLocalizations.of(context)!.cameraAndYourPhotos,
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: HexColor('#D9D9D9'),
                                  fontFamily: 'BreeSerif'),
                            ),
                            // Spacer(),
                            // InkWell(
                            //   onTap: () => _pickImage(ImageSource.gallery),
                            //   child: Container(
                            //     child: Row(
                            //       children: [
                            //         Text(
                            //           AppLocalizations.of(context)!.seeMore,
                            //           style: TextStyle(
                            //               fontSize: 11.sp,
                            //               color: HexColor('#6699CC'),
                            //               fontFamily: 'BreeSerif'),
                            //         ),
                            //         SizedBox(width: 2.w),
                            //         SvgPicture.asset(
                            //           sharedPrefController.language == 'en'
                            //               ? 'images/arrowForword.svg'
                            //               : 'images/arrow_back.svg',
                            //           height: 10.h,
                            //           width: 10.w,
                            //           color: HexColor('#6699CC'),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ) ,
                      SizedBox(height: 12.h),
                      widget.postsModel != null ? SizedBox() :  Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () => _takePhoto(),
                              child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 24.w, vertical: 15.h),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.sp),
                                    color: HexColor('#D6E0E6'),
                                  ),
                                  // height: 12.h,
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(
                                        'images/camera_icon.svg',
                                        width: 20.w,
                                        height: 20.h,
                                        color: HexColor('#333333'),
                                      ),
                                      SizedBox(height: 10.h),
                                      Text(
                                        'Open Camera',
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: HexColor('#333333'),
                                            fontFamily: 'BreeSerif'),
                                      ),
                                    ],
                                  )),
                            ),
                            SizedBox(width: 12.w),
                            widget.postsModel != null ? SizedBox() :InkWell(
                              onTap: () => _pickImages(),
                              child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 24.w, vertical: 15.h),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.sp),
                                    color: HexColor('#D6E0E6'),
                                  ),
                                  // height: 12.h,
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.browse_gallery,
                                        color: HexColor('#333333'),
                                      ),
                                      SizedBox(height: 10.h),
                                      Text(
                                        'Open Gallery',
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: HexColor('#333333'),
                                            fontFamily: 'BreeSerif'),
                                      ),
                                    ],
                                  )),
                            )
                          ],
                        ),
                      ) ,
                      SizedBox(height: 24.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
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

  Future<void> performProcess() async {
    // if (checkData()) {
      await process(
      );
    // }
  }

  // bool checkData() {
  //   if (_contentTextEditorController.text.isNotEmpty) {
  //     ///showSnackBar(context : context , message : 'Enter required Data', error : true);
  //     return true;
  //   }
  //   return false;
  // }

  Future<void> process(
  ) async {
    print('01');
    print('02');
    print(SharedPrefController().userDataId);
    print('SharedPrefController().userDataId');


    List<String> imageListPaths = _selectedImages.map((file) => file.path).toList();
    print('23');
    for (String imagePath in imageListPaths) {
      print('24');
      String? imageUrl = await FbStorageController.uploadFiles(imagePath, uuid.v4());
      print('25');
      if (imageUrl.isNotEmpty) imageUrls.add(imageUrl);
    }

    print('33');
    // Upload files
    List<String> fileListPaths = _pickedFiles.map((file) => file.path!).toList();
    print('34');
    for (String filePath in fileListPaths)  {
      print('35');
      String? videoUrl = await FbStorageController.uploadFiles(filePath, uuid.v4());
      print('36');
      if (videoUrl.isNotEmpty) fileUrls.add(videoUrl);
    }

    subTexts = extractTextsFromControllers(_subPublicationControllers);
    optionQesitions = extractTextsFromControllers(_optionControllers);
    // Future<void> saveTextListToFirestore(List<String> texts) async {
    //   CollectionReference collectionRef = FirebaseFirestore.instance.collection('your_collection');
    //   DocumentReference docRef = collectionRef.doc('your_document_id');
    //
    //   await docRef.set({'texts': texts}, SetOptions(merge: true));
    // }

    isAddPoll == true ? optionQesitions = optionQesitions : optionQesitions = [];

    if(_contentTextEditorController != null && imageUrls.isEmpty && subTexts.isEmpty && fileUrls.isEmpty && optionQesitions.isEmpty){postType = 'text';}

    else if(subTexts.isNotEmpty && _contentTextEditorController != null && imageUrls.isEmpty && fileUrls.isEmpty && optionQesitions.isEmpty){postType = 'subText';}

    else if(optionQesitions.isNotEmpty && _contentTextEditorController != null && imageUrls.isEmpty && fileUrls.isEmpty && subTexts.isEmpty){postType = 'subQuestion';}

    else if(imageUrls.isNotEmpty && _contentTextEditorController.text.isEmpty && fileUrls.isEmpty && subTexts.isEmpty && optionQesitions.isEmpty){postType = 'image';}

    else if(imageUrls.isNotEmpty && _contentTextEditorController.text.isNotEmpty && subTexts.isEmpty && fileUrls.isEmpty && optionQesitions.isEmpty){postType = 'textImage';}

    else if(fileUrls.isNotEmpty  && _contentTextEditorController.text.isNotEmpty && imageUrls.isEmpty && subTexts.isEmpty && optionQesitions.isEmpty){postType = 'textFile';}

    else if(fileUrls.isNotEmpty  && _contentTextEditorController.text.isEmpty && imageUrls.isEmpty && subTexts.isEmpty && optionQesitions.isEmpty){postType = 'file';}

    else {_isRepost = true; postType = 'repost';}

    bool status =
    // widget.groupDataModel == null
    //     ?
    await FbFireStoreController().createPost(postsModel: postsModel);
        // : await FbFireStoreController().updateGroup(groupDataModel: groupDataModel); // jp]de
    if (status) {
      // if (widget.groupDataModel != null) {
      //   Navigator.pop(context);
      // }
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return MainScreen(selectedIndex: 0);
        },
      ));
    }

    print('Post created successfully');

    ///showSnackBar(context : context , message : status ? 'Process Success' : 'Process Failed', error : true);
  }

  PostsModel get postsModel {
    PostsModel postsModel = PostsModel();
    postsModel.postId = uuid.v4();
    // postsModel.mentions = _taggedPeopleIds;
    // postsModel.audioUrl = '';
    postsModel.commentCount = 0;
    postsModel.content = _contentTextEditorController.text;
    postsModel.fileUrl = fileUrls;
    postsModel.imageUrl = imageUrls;
    postsModel.likeCount = 0;
    postsModel.repostCount = 0;
    postsModel.timestamp = DateTime.now().toString();
    postsModel.type = postType;
    postsModel.subPost = subTexts;
    postsModel.userId = SharedPrefController().userDataId;
    postsModel.mentionedFriendsId= _taggedPeopleIds;
    postsModel.feeling= selectedFeeling;
    postsModel.optionQesition= optionQesitions;
    postsModel.mainPostId= _isRepost ? widget.postsModel!.postId : null;
    // postsModel.savedId = '';
    // postsModel.repostId = '';
    // postsModel.likeId = '';
    // postsModel.commentId = '';

    return postsModel;
  }

  Future<void> _requestPermission() async {
    print('00001');
    final PermissionState ps = await PhotoManager.requestPermissionExtend();
    // if (ps.isAuth) {
    _loadImages();
    // } else {
    //   PhotoManager.openSetting();
    // }
  }
  Future<void> _loadImages() async {
    print('04');
    List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
      hasAll: true,
      // onlyAll: true,
      // type: RequestType.common,
    );
    print('05');
    if (albums.isNotEmpty) {
      print('07');
      List<AssetEntity> photos = await albums[0].getAssetListRange(
        start: 0,
        end: 6, // Load the first 100 images
      );

      print('06');
      setState(() {
        _images = photos;
      });
    }
  }

  Future<void> _pickImages() async {
    final List<XFile>? photos = await _picker.pickMultiImage();
    if (photos != null && photos.isNotEmpty) {
      setState(() {
        _selectedImages!.addAll(photos);
      });
    }
  }
  Future<void> _takePhoto() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      setState(() {
        _selectedImages!.add(photo);
      });
    }
  }

  void _addSubPublication() {
    setState(() {
      _subPublicationControllers.add(TextEditingController());
    });
  }
  void _removeSubPublication(int index) {
    setState(() {
      _subPublicationControllers.removeAt(index);
    });
  }
  List<String> extractTextsFromControllers(List<TextEditingController> controllers) {
    return controllers.map((controller) => controller.text).toList();
  }
  Future<void> _savePublication() async {
    // Add tagged people references to Firestore
    // for (String personId in _taggedPeopleIds) {
    //   await FirebaseFirestore.instance.collection('publicationReferences').add({
    //     'publication_id': uuid.va(),
    //     'person_id': personId,
    //   });
    // }
  }

  Future<void> _selectPeopleToTag() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TagPeopleScreen(),
      ),
    );

    if (result != null && result is List<String>) {
      setState(() {
        _taggedPeopleIds = result;
      });
    }
  }

  Future<void> _saveQuestion() async {
    // String questionText = _questionController.text;
    // List<String> options = _optionControllers.map((controller) => controller.text).toList();
    //
    // await FirebaseFirestore.instance.collection('questions').add({
    //   'questionText': questionText,
    //   'options': options,
    // });
    //
    // Navigator.pop(context);
  }
  void _addOption() {
    setState(() {
      _optionControllers.add(TextEditingController());
    });
  }
  void _removeOption(int index) {
    if (_optionControllers.length > 2) {
      setState(() {
        _optionControllers.removeAt(index);
      });
    }
  }

  Future<void> _pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['mp4', 'mp3', 'txt'],
    );

    if (result != null) {
      setState(() {
        _pickedFiles = result.files;
      });

      for (var file in _pickedFiles) {
        if (file.extension == 'txt') {
          _loadTextFileContent(file.path!);
        } else if (file.extension == 'mp4') {
          _initializeVideoPlayer(file.path!, _pickedFiles.indexOf(file));
        }
      }
    }
  }
  Future<void> _loadTextFileContent(String filePath) async {
    File file = File(filePath);
    String content = await file.readAsString();
    setState(() {
      _textFileContent = content;
    });
  }
  Future<void> _initializeVideoPlayer(String filePath, int index) async {
    VideoPlayerController controller =
    VideoPlayerController.file(File(filePath));
    await controller.initialize();
    setState(() {
      _videoControllers[index] = controller;
    });
  }
  Future<void> _uploadFiles() async {
    // if (_pickedFiles.isEmpty) return;
    //
    // setState(() {
    //   _isLoading = true;
    // });
    //
    // List<Map<String, dynamic>> uploadedFiles = [];
    //
    // for (var file in _pickedFiles) {
    //   String fileName = file.name;
    //   String filePath = file.path!;
    //
    //   Reference storageRef = FirebaseStorage.instance.ref().child('uploads/$fileName');
    //   UploadTask uploadTask = storageRef.putFile(File(filePath));
    //
    //   TaskSnapshot snapshot = await uploadTask;
    //   String downloadUrl = await snapshot.ref.getDownloadURL();
    //
    //   uploadedFiles.add({
    //     'fileName': fileName,
    //     'url': downloadUrl,
    //     'type': file.extension,
    //   });
  }
  Widget _buildFilePreview(PlatformFile file, int index) {
    if (file.extension == 'mp4') {
      return _videoControllers.containsKey(index)
          ? Chewie(
              controller: ChewieController(
                videoPlayerController: _videoControllers[index]!,
                aspectRatio: 16 / 9,
                autoPlay: false,
                looping: false,
              ),
            )
          : Center(child: CircularProgressIndicator());
    } else if (file.extension == 'mp3') {
      return Column(
        children: [
          Text(file.name),
          // IconButton(
          //   icon: Icon(Icons.play_arrow),
          //   onPressed: () {
          //     audio.Source audioSource = audio.Source(setOnPlayer, isLocal: true);
          //     _audioPlayer.play(audioSource);
          //   },
          // ),
        ],
      );
    } else if (file.extension == 'txt') {
      return Container(
        padding: EdgeInsets.all(8.0),
        child: _textFileContent != null
            ? Text(_textFileContent!
                .split('\n')
                .take(10)
                .join('\n')) // Display first 10 lines
            : Text('Loading text content...'),
      );
    } else {
      return Text('Unsupported file type');
    }
  }

  // Widget _performSwitch({required PostsModel postsModel}) {
  //   switch (postsModel.type) {
  //   // switch ('textImage') {
  //     case 'text':
  //       return AddTextPostWidget(postsModel: postsModel);
  //     case 'textImage':
  //     case 'testFile':
  //       return AddTextPhotoPostWidgets(
  //         postsModel: postsModel);
  //
  //   /// Photo And Text Post Like X
  //     case 'image':
  //       return AddInstagramPostWidget(postsModel: postsModel);
  //
  //   /// Photo Post Like Instagram
  //     case 'file':
  //       return AddVideoPostWidgets(postsModel: postsModel);
  //
  //   /// Single Video Post
  //     case 'audio':
  //       return AddAudioPostWidgets(postsModel: postsModel);
  //
  //   /// Single Video Post
  //     case 'subQuestion':
  //       return AddTextOptionQesitionPostWidgets(postsModel: postsModel);
  //
  //   /// Single Video Post
  //     case 'subText':
  //       return AddTextSubTextPostWidgets(postsModel: postsModel);
  //
  //   /// Audio Post
  //   default:
  //     SizedBox();
  //   //   return AddRepostWidgets(postsModel: mapPostsModel(document[index]),);
  //
  //   /// Repost Post Like X
  //   }
  // }

  Widget _performSwitch({required PostsModel postsModel}) {
    switch (postsModel.type) {
      case 'text':
        return AddTextPostWidget(postsModel: postsModel);
      case 'textImage':
      case 'testFile':
        return AddTextPhotoPostWidgets(postsModel: postsModel);
      case 'image':
        return AddInstagramPostWidget(postsModel: postsModel);
      case 'file':
        return AddVideoPostWidgets(postsModel: postsModel);
      case 'audio':
        return AddAudioPostWidgets(postsModel: postsModel);
      case 'subQuestion':
        return AddTextOptionQesitionPostWidgets(postsModel: postsModel);
      case 'subText':
        return AddTextSubTextPostWidgets(postsModel: postsModel);
      default:
        return SizedBox(); // Ensure that a widget is returned
    }
  }
// Future<void> _pickImage() async {
//   final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
//   if (pickedFile != null) {
//     setState(() {
//       _imageFile = File(pickedFile.path);
//     });
//   }
// }

// Future<void> _pickVideo() async {
//   final pickedFile = await ImagePicker().pickVideo(source: ImageSource.gallery);
//   if (pickedFile != null) {
//     setState(() {
//       _videoFile = File(pickedFile.path);
//     });
//   }
// }

// Future<void> _pickAudio() async {
//   final result = await FilePicker.platform.pickFiles(type: FileType.audio);
//   if (result != null) {
//     setState(() {
//       _audioFile = File(result.files.single.path!);
//     });
//   }
// }

// Future<String> _uploadFile(File file, String path) async {
//   final storageRef = FirebaseStorage.instance.ref().child(path);
//   final uploadTask = storageRef.putFile(file);
//   final snapshot = await uploadTask;
//   return await snapshot.ref.getDownloadURL();
// }
}

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'dart:io';
//
// class NewPostScreen extends StatefulWidget {
//   @override
//   _NewPostScreenState createState() => _NewPostScreenState();
// }
//
// class _NewPostScreenState extends State<NewPostScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _contentController = TextEditingController();
//   final _mentionsController = TextEditingController();
//   File? _imageFile;
//   File? _videoFile;
//   File? _audioFile;
//   bool _isLoading = false;
//
//   // Future<void> _pickImage() async {
//   //   final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
//   //   if (pickedFile != null) {
//   //     setState(() {
//   //       _imageFile = File(pickedFile.path);
//   //     });
//   //   }
//   // }
//
//   // Future<void> _pickVideo() async {
//   //   final pickedFile = await ImagePicker().pickVideo(source: ImageSource.gallery);
//   //   if (pickedFile != null) {
//   //     setState(() {
//   //       _videoFile = File(pickedFile.path);
//   //     });
//   //   }
//   // }
//
//   // Future<void> _pickAudio() async {
//   //   final result = await FilePicker.platform.pickFiles(type: FileType.audio);
//   //   if (result != null) {
//   //     setState(() {
//   //       _audioFile = File(result.files.single.path!);
//   //     });
//   //   }
//   // }
//
//   Future<String> _uploadFile(File file, String path) async {
//     final storageRef = FirebaseStorage.instance.ref().child(path);
//     final uploadTask = storageRef.putFile(file);
//     final snapshot = await uploadTask;
//     return await snapshot.ref.getDownloadURL();
//   }
//
//   Future<void> _submitPost() async {
//     if (_formKey.currentState!.validate()) {
//       setState(() {
//         _isLoading = true;
//       });
//
//       String? imageUrl;
//       String? videoUrl;
//       String? audioUrl;
//
//       if (_imageFile != null) {
//         imageUrl = await _uploadFile(_imageFile!, 'posts/images/${DateTime.now().millisecondsSinceEpoch}.jpg');
//       }
//
//       if (_videoFile != null) {
//         videoUrl = await _uploadFile(_videoFile!, 'posts/videos/${DateTime.now().millisecondsSinceEpoch}.mp4');
//       }
//
//       if (_audioFile != null) {
//         audioUrl = await _uploadFile(_audioFile!, 'posts/audios/${DateTime.now().millisecondsSinceEpoch}.mp3');
//       }
//
//       final postData = {
//         'type': 'text', // Modify based on the content type
//         'content': _contentController.text,
//         'imageUrl': imageUrl,
//         'videoUrl': videoUrl,
//         'audioUrl': audioUrl,
//         'mentions': _mentionsController.text.split(','), // Assuming mentions are comma-separated
//         'likeCount': 0,
//         'commentCount': 0,
//         'repostCount': 0,
//         'saveCount': 0,
//         'timestamp': FieldValue.serverTimestamp(),
//       };
//
//       await FirebaseFirestore.instance.collection('posts').add(postData);
//
//       setState(() {
//         _isLoading = false;
//       });
//
//       Navigator.pop(context);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Create Post'),
//       ),
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           : Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: [
//               TextFormField(
//                 controller: _contentController,
//                 decoration: InputDecoration(labelText: 'Content'),
//                 maxLines: 5,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter some content';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16.0),
//               TextFormField(
//                 controller: _mentionsController,
//                 decoration: InputDecoration(labelText: 'Mentions (comma-separated)'),
//               ),
//               SizedBox(height: 16.0),
//               _imageFile != null
//                   ? Image.file(_imageFile!)
//                   : ElevatedButton(
//                 onPressed: (){},
//                 // _pickImage,
//                 child: Text('Pick Image'),
//               ),
//               _videoFile != null
//                   ? Text('Video selected: ${_videoFile!.path.split('/').last}')
//                   : ElevatedButton(
//                 onPressed: (){},
//                 // _pickVideo,
//                 child: Text('Pick Video'),
//               ),
//               _audioFile != null
//                   ? Text('Audio selected: ${_audioFile!.path.split('/').last}')
//                   : ElevatedButton(
//                 onPressed: (){},
//                 // _pickAudio,
//                 child: Text('Pick Audio'),
//               ),
//               SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: _submitPost,
//                 child: Text('Submit Post'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class AnswerQuestionScreen extends StatefulWidget {
//   final Question question;
//
//   AnswerQuestionScreen({required this.question});
//
//   @override
//   _AnswerQuestionScreenState createState() => _AnswerQuestionScreenState();
// }
//
// class _AnswerQuestionScreenState extends State<AnswerQuestionScreen> {
//   String? _selectedOption;
//
//   Future<void> _submitAnswer() async {
//     if (_selectedOption == null) return;
//
//     await FirebaseFirestore.instance.collection('answers').add({
//       'questionId': widget.question.id,
//       'userId': 'currentUserId', // Replace with actual user ID
//       'selectedOption': _selectedOption,
//     });
//
//     Navigator.pop(context);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Answer Question')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Text(widget.question.questionText, style: TextStyle(fontSize: 18.0)),
//             ...widget.question.options.map((option) => RadioListTile<String>(
//               title: Text(option),
//               value: option,
//               groupValue: _selectedOption,
//               onChanged: (value) {
//                 setState(() {
//                   _selectedOption = value;
//                 });
//               },
//             )),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: _submitAnswer,
//               child: Text('Submit Answer'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class QuestionsListScreen extends StatefulWidget {
//   @override
//   _QuestionsListScreenState createState() => _QuestionsListScreenState();
// }
//
// class _QuestionsListScreenState extends State<QuestionsListScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Questions')),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection('questions').snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//             return Center(child: Text('No questions available.'));
//           } else {
//             List<Question> questions = snapshot.data!.docs.map((doc) {
//               Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
//               return Question(
//                 id: doc.id,
//                 questionText: data['questionText'],
//                 options: List<String>.from(data['options']),
//               );
//             }).toList();
//
//             return ListView.builder(
//               itemCount: questions.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(questions[index].questionText),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => AnswerQuestionScreen(question: questions[index]),
//                       ),
//                     );
//                   },
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
