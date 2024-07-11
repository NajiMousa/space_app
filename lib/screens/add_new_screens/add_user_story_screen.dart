import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:difaf_al_wafa_app/models/strory_models/story_data_model.dart';
import 'package:difaf_al_wafa_app/prefs/shared_pref_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';
import 'package:video_player/video_player.dart';
import '../../controllers/firebase_controllers/fb_firestore_controller.dart';
import '../../controllers/firebase_controllers/fb_storage_controller.dart';
import '../primary_screens/main_screen.dart';

class AddStoryScreen extends StatefulWidget {
  @override
  _AddStoryScreenState createState() => _AddStoryScreenState();
}

class _AddStoryScreenState extends State<AddStoryScreen>
    with SingleTickerProviderStateMixin {
  late CameraController _cameraController;
  late List<CameraDescription> cameras;
  bool _isRearCameraSelected = false;
  XFile? _pickedFile;
  final ImagePicker _picker = ImagePicker();
  bool _isRecording = false;
  bool _isWritingText = false;
  VideoPlayerController? _videoController;
  late Timer _videoRecordingTimer;
  bool _isVideoRecording = false;
  late AnimationController _animationController;
  bool _isMediaSelected = false; // State to track if media is selected

  Uuid uuid = Uuid();
  bool? withFollower;

  List<String> imageUrls = [];
  List<String> fileUrls = [];
  List<XFile> _selectedImages = [];
  List<PlatformFile> _pickedFiles = [];

  Future<void> requestCameraPermission() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      await Permission.camera.request();
    }
  }

  @override
  void initState() {
    super.initState();
    requestCameraPermission();
    initializeCamera();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
          ..repeat();
  }

  Future<void> initializeCamera() async {
    cameras = await availableCameras();
    _cameraController = CameraController(cameras[1], ResolutionPreset.high);
    await _cameraController.initialize();
    setState(() {
      _cameraController = _cameraController;
    });
  }

  @override
  void dispose() {
    _cameraController.dispose();
    _videoController?.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    // final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
    // setState(() {
    //   _pickedFile = photo;
    //   _isMediaSelected = true;
    // });
    final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
    if (photo != null) {
      setState(() {
        _selectedImages!.add(photo);
        _pickedFile = photo;
        _isMediaSelected = true;
      });
    }
  }

  Future<void> _pickVideo() async {
    final XFile? pickedFile =
        await _picker.pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      _pickedFile = pickedFile;
      _videoController = VideoPlayerController.file(File(_pickedFile!.path))
        ..initialize().then((_) {
          setState(() {
            _selectedImages!.add(pickedFile);
            _isMediaSelected = true;
          });
          _videoController!.play();
        });
    }
  }

  Future<void> _initializeVideoPlayer(XFile videoFile) async {
    _videoController = VideoPlayerController.file(File(videoFile.path))
      ..initialize().then((_) {
        setState(() {});
        _videoController!.play();
      });
  }

  void _switchCamera() {
    _isRearCameraSelected = !_isRearCameraSelected;
    _cameraController = CameraController(
        _isRearCameraSelected ? cameras[0] : cameras[1], ResolutionPreset.high);
    _cameraController.initialize().then((_) {
      setState(() {});
    });
  }

  void _toggleFlash() {
    setState(() {
      _cameraController.setFlashMode(
          _cameraController.value.flashMode == FlashMode.off
              ? FlashMode.torch
              : FlashMode.off);
    });
  }

  void _takePicture() async {
    if (_cameraController.value.isInitialized && !_isRecording) {
      try {
        XFile photo = await _cameraController.takePicture();
        setState(() {
          _pickedFile = photo;
          _selectedImages!.add(photo);
          _isMediaSelected = true;
        });
      } catch (e) {
        print(e);
      }
    }
  }

  void _startRecording() async {
    if (_cameraController.value.isInitialized && !_isRecording) {
      try {
        await _cameraController.startVideoRecording();
        setState(() {
          _isRecording = true;
          _isVideoRecording = true;
        });
      } catch (e) {
        print(e);
      }
    }
  }

  void _stopRecording() async {
    if (_cameraController.value.isRecordingVideo) {
      try {
        XFile videoFile = await _cameraController.stopVideoRecording();
        setState(() {
          _isRecording = false;
          _isVideoRecording = false;
          _pickedFile = videoFile;
          _selectedImages!.add(videoFile);
          _isMediaSelected = true;
        });
        _initializeVideoPlayer(videoFile);
      } catch (e) {
        print(e);
      }
    }
  }

  void _handleCaptureButtonTapDown(TapDownDetails details) {
    _videoRecordingTimer = Timer(Duration(milliseconds: 500), () {
      if (!_isRecording) {
        _startRecording();
      }
    });
  }

  void _handleCaptureButtonTapUp(TapUpDetails details) {
    if (_isVideoRecording) {
      _stopRecording();
    } else {
      _takePicture();
    }
    _videoRecordingTimer.cancel();
  }

  void _handleCaptureButtonTapCancel() {
    if (_isVideoRecording) {
      _stopRecording();
    }
    _videoRecordingTimer.cancel();
  }

  void _addText() {
    setState(() {
      _isWritingText = !_isWritingText;
    });
  }

  void _goBack() {
    setState(() {
      _pickedFile = null;
      _isMediaSelected = false;
      _videoController?.dispose();
      _videoController = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_cameraController.value.isInitialized) {
      return Container();
    }

    return Scaffold(
      backgroundColor: HexColor('#333333'),
      bottomNavigationBar: _isMediaSelected
          ? Positioned(
              bottom: 0.h,
              right: 0.w,
              child: Container(
                margin: EdgeInsets.only(bottom: 18.h),
                height: 120.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Text(
                        'For You',
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: HexColor('#FFFFFF'),
                            fontFamily: 'BreeSerif'),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Container(
                      height: 35.h,
                      child: ListView.builder(
                        padding: EdgeInsets.only(left: 24.w),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(right: 8.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.sp),
                                color: Colors.white),
                            width: 120.w,
                            height: 32.h,
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                withFollower = true;
                              });
                              performProcess();
                            },
                            child: Container(
                              alignment: AlignmentDirectional.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.sp),
                                  color: Colors.white),
                              height: 40.h,
                              width: 165.w,
                              child: Text(
                                'With Follower',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: HexColor('#333333'),
                                    fontFamily: 'BreeSerif'),
                              ),
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              setState(() {
                                withFollower = false;
                              });
                              performProcess();
                            },
                            child: Container(
                              alignment: AlignmentDirectional.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.sp),
                                  color: Colors.white),
                              height: 40.h,
                              width: 165.w,
                              child: Text(
                                'Share With All',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: HexColor('#333333'),
                                    fontFamily: 'BreeSerif'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Container(
              height: 125.h,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 50.h,
                    left: 0.w,
                    right: 0.w,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.w, horizontal: 32.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 15.h),
                            child: IconButton(
                              icon: Icon(Icons.photo,
                                  color: Colors.white, size: 28.sp),
                              onPressed: _pickImage,
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTapDown: _handleCaptureButtonTapDown,
                            onTapUp: _handleCaptureButtonTapUp,
                            onTapCancel: _handleCaptureButtonTapCancel,
                            child: Stack(
                              children: [
                                if (_isRecording)
                                  CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.red),
                                    value: _animationController.value,
                                    strokeWidth: 50,
                                  ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50.sp),
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  child: FloatingActionButton(
                                    backgroundColor: Colors.white,
                                    onPressed: null,
                                    child: Icon(
                                      _isRecording
                                          ? Icons.stop
                                          : Icons.radio_button_checked,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.only(top: 15.h),
                            child: IconButton(
                              icon: Icon(
                                _isRearCameraSelected
                                    ? Icons.camera_front
                                    : Icons.camera_rear,
                                color: Colors.white,
                                size: 28.sp,
                              ),
                              onPressed: _switchCamera,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: 24.h, right: 24.w, left: 24.w, top: 85.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () => _pickImage(),
                          child: Text(
                            'Photos',
                            style: TextStyle(
                                fontSize: 11.sp,
                                color: HexColor('#FFFFFF'),
                                fontFamily: 'BreeSerif'),
                          ),
                        ),
                        SizedBox(width: 24.w),
                        InkWell(
                          onTap: () => _pickVideo(),
                          child: Text(
                            'Videos',
                            style: TextStyle(
                                fontSize: 11.sp,
                                color: HexColor('#FFFFFF'),
                                fontFamily: 'BreeSerif'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
      body: Stack(
        children: [
          Positioned(
            child: _pickedFile == null
                ? CameraPreview(_cameraController)
                : _pickedFile!.path.endsWith('.mp4')
                    ? AspectRatio(
                        aspectRatio: _videoController!.value.aspectRatio,
                        child: VideoPlayer(_videoController!),
                      )
                    : Image.file(File(_pickedFile!.path), fit: BoxFit.cover),
          ),
          if (!_isMediaSelected)
            Positioned(
              bottom: 50.h,
              right: 20.w,
              child: Container(
                decoration: BoxDecoration(
                  color: HexColor('#333333').withOpacity(0.3),
                  borderRadius: BorderRadius.circular(50.sp),
                ),
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 12.h),
                child: Column(
                  children: [
                    IconButton(
                      icon: Icon(
                        _cameraController.value.flashMode == FlashMode.off
                            ? Icons.flash_off
                            : Icons.flash_on,
                        color: Colors.white,
                      ),
                      onPressed: _toggleFlash,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.music_note,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        // Handle adding music
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.filter,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        // Handle adding filters
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.text_fields,
                        color: Colors.white,
                      ),
                      onPressed: _addText,
                    ),
                  ],
                ),
              ),
            ),
          if (_isWritingText)
            Positioned.fill(
              child: GestureDetector(
                onTap: _addText,
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  child: Center(
                    child: Text(
                      'Add your text here',
                      style: TextStyle(color: Colors.white, fontSize: 24.sp),
                    ),
                  ),
                ),
              ),
            ),
          if (_isMediaSelected)
            Positioned(
              top: 40.h,
              left: 24.w,
              child: IconButton(
                icon: Icon(Icons.close, color: Colors.white),
                onPressed: _goBack,
              ),
            ),
          if (_isMediaSelected)
            Positioned(
              bottom: 50.h,
              right: 20.w,
              child: Container(
                decoration: BoxDecoration(
                  color: HexColor('#333333').withOpacity(0.3),
                  borderRadius: BorderRadius.circular(50.sp),
                ),
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 12.h),
                child: Column(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.music_note,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        // Handle adding music
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.filter,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        // Handle adding filters
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.text_fields,
                        color: Colors.white,
                      ),
                      onPressed: _addText,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
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

  Future<void> process() async {

    List<String> imageListPaths = _selectedImages.map((file) => file.path).toList();
    print('23');
    for (String imagePath in imageListPaths) {
      print('24');
      String? imageUrl = await FbStorageController.uploadFiles(imagePath, uuid.v4());
      print('25');
      if (imageUrl.isNotEmpty) imageUrls.add(imageUrl);
    }

    // print('33');
    // // Upload files
    // List<String> fileListPaths = _pickedFiles.map((file) => file.path!).toList();
    // print('34');
    // for (String filePath in fileListPaths)  {
    //   print('35');
    //   String? videoUrl = await FbStorageController.uploadFiles(filePath, uuid.v4());
    //   print('36');
    //   if (videoUrl.isNotEmpty) fileUrls.add(videoUrl);
    // }

    bool status =await FbFireStoreController().createUserStory(storyDataModel: storyDataModel);
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

  StoryDataModel get storyDataModel {
    StoryDataModel storyDataModel = StoryDataModel();
    print('01');
    storyDataModel.storyId = uuid.v4();
    print('02');
    storyDataModel.userDataId = SharedPrefController().userDataId;
    print('03');
    storyDataModel.text = '';
    print('04');
    storyDataModel.timestamp = DateTime.now().toString();
    print('05');
    storyDataModel.image = imageUrls;
    print('06');
    storyDataModel.video = [];
    print('07');
    storyDataModel.likes = 0;
    print('08');
    storyDataModel.martyrIds = [];
    print('09');
    storyDataModel.withFollower = withFollower!;
    print('10');
    storyDataModel.mentionedFriendsId = [];
    print('11');

    return storyDataModel;
  }
}
