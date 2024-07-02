import 'package:difaf_al_wafa_app/models/posta_models/posts_model.dart';
import 'package:difaf_al_wafa_app/prefs/shared_pref_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

import '../../controllers/firebase_controllers/fb_firestore_controller.dart';


class NewPostScreen extends StatefulWidget {
  const NewPostScreen({Key? key}) : super(key: key);

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  int _selectedTypeMessanger = 0;
  SharedPrefController sharedPrefController = SharedPrefController();
  // File? _imageFile;
  // File? _videoFile;
  // File? _audioFile;

  bool _imageFile = false;
  bool _videoFile = false;
  bool _audioFile = false;

  bool _isLoading = false;
  late TextEditingController _contentTextEditorController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _contentTextEditorController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _contentTextEditorController.dispose();
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
                  _selectedTypeMessanger = 0;
                });
              },
              child: Padding(
                padding: EdgeInsets.only(left: 33.w),
                child: Column(
                  children: [
                    _selectedTypeMessanger == 0
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
                          color: _selectedTypeMessanger == 0
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
                  _selectedTypeMessanger = 1;
                });
              },
              child: Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: Column(
                  children: [
                    _selectedTypeMessanger == 1
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
                          color: _selectedTypeMessanger == 1
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
                  _selectedTypeMessanger = 2;
                });
              },
              child: Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: Column(
                  children: [
                    _selectedTypeMessanger == 2
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
                          color: _selectedTypeMessanger == 2
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
                  _selectedTypeMessanger = 3;
                });
              },
              child: Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _selectedTypeMessanger == 3
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
                          color: _selectedTypeMessanger == 3
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
                  _selectedTypeMessanger = 4;
                });
              },
              child: Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _selectedTypeMessanger == 4
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
                          color: _selectedTypeMessanger == 4
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
                  // _selectedIndex = 0;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                margin: sharedPrefController.language =='en' ? EdgeInsets.only(left: 24.w) : EdgeInsets.only(right: 0.w),
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
                            },
                            child: SvgPicture.asset(
                              sharedPrefController.language == 'en' ? 'images/arrow_back.svg' : 'images/arrowForword.svg',
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
                        onPressed: () async{
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
              children: [
                SizedBox(height: 18.h),
                Expanded(
                  child: ListView(
                    // reverse: true,
                    // padding:
                    //     EdgeInsets.only(bottom: 30.h, right: 24.w, left: 24.w),
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 24.w, left: 24.w),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: sharedPrefController.language == 'en' ? EdgeInsets.only(left: 12.w) : EdgeInsets.only(right: 12.w),
                                alignment: AlignmentDirectional.center,
                                child: TextField(
                                  controller: _contentTextEditorController,
                                  style: TextStyle(
                                    fontFamily: 'BreeSerif',
                                    fontSize: 13.sp,
                                    color: HexColor('#8C9EA0'),
                                  ),
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: AppLocalizations.of(context)!.writeYourMassage,
                                    enabledBorder: getBorder(),
                                    focusedBorder: getBorder(),
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.only(
                                          bottom: 70.h, right: 12.w),
                                      child: Image.asset(
                                        'images/userIcon.png',
                                        width: 40.w,
                                        height: 40.w,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.0),
                      // _imageFile != null
                      // _imageFile
                      //     ? Image.file('_imageFile!')
                      //     : SizedBox(),
                      // _videoFile != null
                      _videoFile
                          ? Text('Video selected: '
                          // '${_videoFile!.path.split('/').last}'
                      )
                          : SizedBox(),
                      // _audioFile != null
                      _audioFile
                          ? Text('Audio selected: '
                          // '${_audioFile!.path.split('/').last}'
                      )
                          : SizedBox(),

                      SizedBox(height: 24.h),
                      Padding(
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
                      InkWell(
                          child: Padding(
                        padding: EdgeInsets.only(left: 38.w, top: 18.h,right: 24.w),
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
                      InkWell(
                          child: Padding(
                        padding: EdgeInsets.only(left: 38.w, top: 18.h,right: 24.w),
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
                      InkWell(
                          child: Padding(
                        padding: EdgeInsets.only(left: 38.w, top: 18.h,right: 24.w),
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
                      InkWell(
                          child: Padding(
                        padding: EdgeInsets.only(left: 38.w, top: 18.h,right: 24.w),
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
                      )),
                      InkWell(
                          child: Padding(
                        padding: EdgeInsets.only(left: 38.w, top: 18.h,right: 24.w),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'images/location_country_icon.svg',
                              width: 20.w,
                              height: 20.h,
                              color: HexColor('#F5533D'),
                            ),
                            SizedBox(width: 12.w),
                            Text(
                              AppLocalizations.of(context)!.addEvent,
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: HexColor('#333333'),
                                  fontFamily: 'BreeSerif'),
                            ),
                          ],
                        ),
                      )),
                      InkWell(
                          child: Padding(
                        padding: EdgeInsets.only(
                            left: 38.w, top: 18.h, bottom: 24.h,right: 24.w),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'images/gps_location_icon.svg',
                              width: 20.w,
                              height: 20.h,
                              color: HexColor('#F02849'),
                            ),
                            SizedBox(width: 12.w),
                            Text(
                              AppLocalizations.of(context)!.addLocation,
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: HexColor('#333333'),
                                  fontFamily: 'BreeSerif'),
                            ),
                          ],
                        ),
                      )),
                      Padding(
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
                            Spacer(),
                            Container(
                              child: Row(
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.seeMore,
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        color: HexColor('#6699CC'),
                                        fontFamily: 'BreeSerif'),
                                  ),
                                  SizedBox(width: 2.w),
                                  SvgPicture.asset(
                                    sharedPrefController.language == 'en' ? 'images/arrowForword.svg' : 'images/arrow_back.svg',
                                    height: 10.h,
                                    width: 10.w,
                                    color: HexColor('#6699CC'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 12.h),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: double.infinity,
                          maxHeight: 80.h,
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
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return Container(
                                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.sp),
                                  color: HexColor('#D6E0E6'),
                                ),
                                // height: 12.h,
                                child: SvgPicture.asset(
                                  'images/camera_icon.svg',
                                  width: 24.w,
                                  height: 24.h,
                                  color: HexColor('#333333'),
                                ),
                              );
                            } else {
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
                            }
                          },
                        ),
                      ),
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
    if (checkData()) {
      await process();
    }
  }

  bool checkData() {
    if (_contentTextEditorController.text.isNotEmpty ) {
      ///showSnackBar(context : context , message : 'Enter required Data', error : true);
      return true;
    }
    return false;
  }

  Future<void> process() async {
    print('01');
    print('02');

    String? imageUrl;
    String? videoUrl;
    String? audioUrl;

    // if (_imageFile != null) {
    //   imageUrl = await _uploadFile(_imageFile!, 'posts/images/${DateTime.now().millisecondsSinceEpoch}.jpg');
    // }
    //
    // if (_videoFile != null) {
    //   videoUrl = await _uploadFile(_videoFile!, 'posts/videos/${DateTime.now().millisecondsSinceEpoch}.mp4');
    // }
    //
    // if (_audioFile != null) {
    //   audioUrl = await _uploadFile(_audioFile!, 'posts/audios/${DateTime.now().millisecondsSinceEpoch}.mp3');
    // }
    bool status = await FbFireStoreController().createPost(postsModel:postsModel);
    if(status){
      Navigator.pop(context);
    }

    ///showSnackBar(context : context , message : status ? 'Process Success' : 'Process Failed', error : true);
  }

  PostsModel get postsModel {
    PostsModel postsModel =  PostsModel();
    postsModel.postId = SharedPrefController().userIdRegistration;
    postsModel.mentions = '';
    postsModel.audioUrl = '';
    postsModel.commentCount = 0;
    postsModel.content = _contentTextEditorController.text;
    postsModel.imageUrl = '';
    postsModel.likeCount = 0;
    postsModel.repostCount = '';
    postsModel.timestamp = '';
    postsModel.type = '';
    postsModel.userId = '';
    postsModel.videoUrl = '';
    // postsModel.mentionedFriendsId= '';
    // postsModel.savedId = '';
    // postsModel.repostId = '';
    // postsModel.likeId = '';
    // postsModel.commentId = '';

    return postsModel;
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