import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:difaf_al_wafa_app/helpers/helper.dart';
import 'package:difaf_al_wafa_app/screens/primary_screens/main_screen.dart';
import 'package:difaf_al_wafa_app/screens/widgets/app_text_field_widget.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import '../../controllers/firebase_controllers/fb_firestore_controller.dart';
import '../../controllers/firebase_controllers/fb_storage_controller.dart';
import '../../models/user_models/user_profile_data_model.dart';
import '../../prefs/shared_pref_controller.dart';

class EditUserProfilePageScreen extends StatefulWidget {
  EditUserProfilePageScreen(
      {Key? key, this.title = 'Create', this.userProfileDataModel})
      : super(key: key);

  final String title;
  String coverImageUrl = '';
  String profileImageUrl = '';
  final UserProfileDataModel? userProfileDataModel;

  @override
  State<EditUserProfilePageScreen> createState() =>
      _EditUserProfilePageScreenState();
}

class _EditUserProfilePageScreenState extends State<EditUserProfilePageScreen>
    with Helper {
  final ImagePicker _picker = ImagePicker();
  double _linerProgress = 0;
  double _progress = 0;
  bool _isUploading = false;

  var uuid = const Uuid();
  bool hasAddedStory = false;
  bool isActive = true;
  bool isClickOnMoreIcon = false;

  final _formKey = GlobalKey<FormState>();
  DateTime _dateOfBirth = DateTime(2000, 1, 1);
  late String countryCodeG;
  bool loading = false;
  late TextEditingController _firstNameTextEditingController;
  late TextEditingController _lastNameTextEditingController;
  late TextEditingController _bioTextEditingController;
  late TextEditingController _dateOfBirthTextEditingController;

  String? _firstNameErrorText;
  String? _lastNameErrorText;
  String? _bioErrorText;
  String? coverImageUrl;
  String? profileImageUrl;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _firstNameTextEditingController = TextEditingController(
        text: widget.userProfileDataModel?.firstName ?? '');
    _lastNameTextEditingController = TextEditingController(
        text: widget.userProfileDataModel?.lastName ?? '');
    _bioTextEditingController =
        TextEditingController(text: widget.userProfileDataModel?.bio ?? '');
    _dateOfBirthTextEditingController = TextEditingController(
        text: widget.userProfileDataModel?.dateOfBirth ?? '');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _firstNameTextEditingController.dispose();
    _lastNameTextEditingController.dispose();
    _bioTextEditingController.dispose();
    _dateOfBirthTextEditingController.dispose();
    super.dispose();
  }

  File? _profileImage;
  File? _coverImage;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: HexColor('#333333'),
        bottomNavigationBar: Container(
          height: 72.0, // Set the height here
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 16.h),
            child: ElevatedButton(
              onPressed: () async {
                print('object');
                performProcess();
                // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                //   return MainScreen(selectedIndex: 0);
                // },));
              },
              // {
              //   if (_formKey.currentState!.validate()) {
              //     _formKey.currentState!.save();
              //     // Handle save logic here
              //     ScaffoldMessenger.of(context).showSnackBar(
              //       SnackBar(
              //           content: Text('Profile Updated')),
              //     );
              //   }
              // },
              style: ElevatedButton.styleFrom(
                // padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
                minimumSize: Size(double.infinity, 56.h),
                backgroundColor: HexColor('#FFFFFF'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.sp),
                ),
              ),
              child: Text(
                AppLocalizations.of(context)!.save,
                style: TextStyle(
                  color: HexColor('#333333'),
                  fontSize: 16.sp,
                  fontFamily: 'BreeSerif',
                ),
              ),
            ),
          ),
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.h),
          child: AppBar(
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
                                'images/arrow_back.svg',
                                width: 10.w,
                                height: 16.h,
                                color: HexColor('#333333'),
                              ),
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            Text(
                              AppLocalizations.of(context)!.editProfile,
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  color: HexColor('#333333'),
                                  fontFamily: 'BreeSerif'),
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(width: 60.w),
                    ],
                  ),
                ),
              )),
        ),
        body: Stack(
          children: [
            Stack(
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
                  child: ListView(
                    // padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 260.h,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft:
                                              SharedPrefController().language ==
                                                      'en'
                                                  ? Radius.circular(42.sp)
                                                  : Radius.circular(0.sp),
                                          bottomRight:
                                              SharedPrefController().language ==
                                                      'en'
                                                  ? Radius.circular(0.sp)
                                                  : Radius.circular(42.sp),
                                        ),
                                        // color: Colors.red,
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.2),
                                            spreadRadius: 1,
                                            blurRadius: 10,
                                            offset: Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: InkWell(
                                        onTap: () => _pickCoverImage(),
                                        child: _coverImage != null
                                            ? Image.file(
                                                _coverImage!,
                                                width: double.infinity,
                                                height: 370.h,
                                                fit: BoxFit.cover,
                                              )
                                            : CachedNetworkImage(
                                                imageUrl: widget
                                                    .userProfileDataModel!
                                                    .backgroundImage,
                                                width: double.infinity,
                                                height: 370.h,
                                                fit: BoxFit.cover,
                                                progressIndicatorBuilder:
                                                    (context, url,
                                                            downloadProgress) =>
                                                        CircularProgressIndicator(
                                                            value:
                                                                downloadProgress
                                                                    .progress),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Icon(Icons.error),
                                              ),
                                      ),
                                    ),
                                    LinearProgressIndicator(
                                      value: _linerProgress,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.blue),
                                      backgroundColor: Colors.grey[300],
                                    ),
                                    InkWell(
                                      onTap: () => _pickCoverImage(),
                                      child: Align(
                                        alignment: AlignmentDirectional.bottomEnd,
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              right: 35.w,
                                              top: 200.h,
                                              bottom: 4.h),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8.w, vertical: 8.h),
                                          // margin: EdgeInsets.only(left: 24.w),
                                          width: 32.w,
                                          height: 32.h,
                                          decoration: BoxDecoration(
                                            color: HexColor('#E0EBF2'),
                                            // Background color
                                            shape: BoxShape
                                                .circle, // Make it a circle if desired
                                          ),
                                          child: SvgPicture.asset(
                                            'images/camera_icon.svg',
                                            width: 6.w,
                                            height: 10.h,
                                            color: HexColor('#333333'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // if (_profileImage != null) Image.file(_profileImage!, width: 100, height: 100),
                                Padding(
                                  padding: SharedPrefController().language ==
                                          'en'
                                      ? EdgeInsets.only(left: 24.w, top: 215.h)
                                      : EdgeInsets.only(
                                          right: 24.w, top: 215.h),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Stack(
                                        alignment: AlignmentDirectional.center,
                                        children: [
                                          // Container(
                                          //   decoration: BoxDecoration(
                                          //     color: HexColor('#21CED9'),
                                          //     borderRadius: BorderRadius.circular(56.sp),
                                          //   ),
                                          //   width: 90.w,
                                          //   height: 90.h,
                                          // ),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(250.sp),
                                            ),
                                            width: 84.w,
                                            height: 84.w,
                                            clipBehavior: Clip.antiAlias,
                                            child: _profileImage != null
                                                ? Image.file(
                                                    _profileImage!,
                                                    width: 84.w,
                                                    height: 84.h,
                                                    fit: BoxFit.cover,
                                                  )
                                                : CachedNetworkImage(
                                                    imageUrl: widget
                                                        .userProfileDataModel!
                                                        .profileImageUrl,
                                                    width: 84.w,
                                                    height: 84.w,
                                                    fit: BoxFit.cover,
                                                    progressIndicatorBuilder: (context,
                                                            url,
                                                            downloadProgress) =>
                                                        CircularProgressIndicator(
                                                            value:
                                                                downloadProgress
                                                                    .progress),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            Icon(Icons.error),
                                                  ),
                                          ),
                                          CircularProgressIndicator(
                                            value: _progress,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Colors.blue),
                                          ),
                                          InkWell(
                                            onTap: () => _pickProfileImage(),
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  left: 70.w,
                                                  right: 4.w,
                                                  top: 62.h,
                                                  bottom: 4.h),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8.w,
                                                  vertical: 8.h),
                                              // margin: EdgeInsets.only(left: 24.w),
                                              width: 32.w,
                                              height: 32.h,
                                              decoration: BoxDecoration(
                                                color: HexColor('#E0EBF2'),
                                                // Background color
                                                shape: BoxShape
                                                    .circle, // Make it a circle if desired
                                              ),
                                              child: SvgPicture.asset(
                                                'images/camera_icon.svg',
                                                width: 6.w,
                                                height: 10.h,
                                                color: HexColor('#333333'),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            // Center(
                            //   child: GestureDetector(
                            //     // onTap: _pickImage,
                            //     child: CircleAvatar(
                            //       radius: 50,
                            //       // backgroundImage: _profileImage == null
                            //       // ? AssetImage('assets/profile_placeholder.png')
                            //       //     : FileImage(File(_profileImage!.path)),
                            //       // child: _profileImage == null
                            //       // ? Icon(Icons.camera_alt, size: 50)
                            //       //     : Container(),
                            //     ),
                            //   ),
                            // ),
                            SizedBox(height: 20),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 6.h,
                                          ),
                                          child: Text(
                                            'First Name',
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                color: HexColor('#333333'),
                                                fontFamily: 'BreeSerif'),
                                          ),
                                        ),
                                        AppTextFieldWidget(
                                          textEditingController:
                                              _firstNameTextEditingController,
                                          // prefixIcon: Icons.person,
                                          hintText: 'naji',
                                          obsecure: false,
                                          textInputType:
                                              TextInputType.emailAddress,
                                          errorText: _firstNameErrorText,
                                          half: true,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 12.w),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 6.h),
                                          child: Text(
                                            'Last Name',
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                color: HexColor('#333333'),
                                                fontFamily: 'BreeSerif'),
                                          ),
                                        ),
                                        AppTextFieldWidget(
                                          textEditingController:
                                              _lastNameTextEditingController,
                                          // prefixIcon: Icons.person,
                                          hintText: 'mousa',
                                          obsecure: false,
                                          textInputType:
                                              TextInputType.emailAddress,
                                          errorText: _lastNameErrorText,
                                          half: true,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 6.h, horizontal: 24.w),
                              child: Text(
                                AppLocalizations.of(context)!.bio,
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: HexColor('#333333'),
                                    fontFamily: 'BreeSerif'),
                              ),
                            ),
                            AppTextFieldWidget(
                              textEditingController: _bioTextEditingController,
                              // prefixIcon: Icons.lock,
                              hintText: 'your bio',
                              obsecure: false,
                              textInputType: TextInputType.emailAddress,
                              errorText: _bioErrorText,
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 24.w, vertical: 6.h),
                              child: Text(
                                AppLocalizations.of(context)!.dateOfBirth,
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: HexColor('#333333'),
                                    fontFamily: 'BreeSerif'),
                              ),
                            ),
                            AppTextFieldWidget(
                              textEditingController:
                                  _dateOfBirthTextEditingController,
                              // prefixIcon: Icons.lock,
                              hintText:
                                  'Date of Birth: ${_dateOfBirth.toLocal()}'
                                      .split(' ')[0],
                              obsecure: false,
                              textInputType: TextInputType.emailAddress,
                              errorText: _bioErrorText,
                              suffixIcon: TextButton(
                                child: Text(
                                  AppLocalizations.of(context)!.selectDate,
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.blue,
                                      fontFamily: 'BreeSerif'),
                                ),
                                onPressed: () async {
                                  print(_dateOfBirth);
                                  DateTime? picked = await showDatePicker(
                                    context: context,
                                    initialDate: _dateOfBirth,
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime.now(),
                                  );
                                  if (picked != null && picked != _dateOfBirth)
                                    setState(() {
                                      _dateOfBirth = picked;
                                    });
                                },
                              ),
                            ),
                            SizedBox(height: 20),
                            // Padding(
                            //   padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 15.h),
                            //   child: ElevatedButton(
                            //     onPressed: () async {
                            //       print('object');
                            //       performProcess();
                            //     },
                            //     style: ElevatedButton.styleFrom(
                            //       // padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
                            //       minimumSize: Size(double.infinity, 56.h),
                            //       backgroundColor: HexColor('#333333'),
                            //       shape: RoundedRectangleBorder(
                            //         borderRadius: BorderRadius.circular(30.sp),
                            //       ),
                            //     ),
                            //     child: Padding(
                            //       padding: EdgeInsets.symmetric(horizontal: 12.w),
                            //       child: Text(
                            //         AppLocalizations.of(context)!.save,
                            //         style: TextStyle(
                            //           color: HexColor('#FFFFFF'),
                            //           fontSize: 16.sp,
                            //           fontFamily: 'BreeSerif',
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      )
                    ],
                  ),
                  // _primaryPageModel[_selectedIndex].widget,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> performProcess() async {
    if (checkData()) {
      await process();
    }
  }

  bool checkData() {
    if (_firstNameTextEditingController.text.isNotEmpty &&
        _lastNameTextEditingController.text.isNotEmpty &&
        _bioTextEditingController.text.isNotEmpty) {
      ///showSnackBar(context : context , message : 'Enter required Data', error : true);
      return true;
    }
    return false;
  }

  Future<void> process() async {

    bool status = widget.userProfileDataModel == null
        ? await FbFireStoreController()
            .createUserData(userProfileDataModel: userProfileDataModel) //انشاء
        : await FbFireStoreController().updateUserData(
            userProfileDataModel: userProfileDataModel); // jp]de
    if (status) {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return MainScreen(selectedIndex: 0);
        },
      ));
      if (widget.userProfileDataModel != null) {
        Navigator.pop(context);
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return MainScreen(selectedIndex: 0);
          },
        ));
        clear();
      }
    }

    ///showSnackBar(context : context , message : status ? 'Process Success' : 'Process Failed', error : true);
  }

  Future<void> _pickCoverImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      print('01');
      setState(() {
        _isUploading = true;
        _linerProgress = 0;
      });
      print('02');
      String? fileURL = await FbStorageController.uploadFile(
          File(pickedFile.path), (progress) {
        setState(() {
          _linerProgress = progress;
        });
      });

      if (fileURL != null) {
        _coverImage = File(pickedFile.path);
        SharedPrefController().saveCoverImageUrl(coverImageUrl: fileURL);
      }

      setState(() {
        _isUploading = false;
      });
    }
  }

  Future<void> _pickProfileImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      print('01');
      setState(() {
        _isUploading = true;
        _progress = 0;
      });
      print('02');
      String? fileURL = await FbStorageController.uploadFile(
          File(pickedFile.path), (progress) {
        setState(() {
          _progress = progress;
        });
      });

      if (fileURL != null) {
        _profileImage = File(pickedFile.path);
        SharedPrefController().saveProfileImageUrl(profileImageUrl: fileURL);
      }

      setState(() {
        _isUploading = false;
      });
    }
  }

  // Future<void> _uploadFile(File file) async {
  //   setState(() {
  //     _isUploading = true;
  //     _progress = 0;
  //   });
  //
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference storageReference = FirebaseStorage.instance.ref().child('uploads/$fileName');
  //
  //   UploadTask uploadTask = storageReference.putFile(file);
  //
  //   uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
  //     setState(() {
  //       _progress = (snapshot.bytesTransferred / snapshot.totalBytes);
  //     });
  //   });
  //
  //   try {
  //     await uploadTask.whenComplete(() async {
  //       String fileURL = await storageReference.getDownloadURL();
  //       print('File Uploaded: $fileURL');
  //       setState(() {
  //         _isUploading = false;
  //       });
  //     });
  //   } catch (e) {
  //     setState(() {
  //       _isUploading = false;
  //     });
  //     print('Error: $e');
  //   }
  // }

  // Future<void> _pickProfileImage() async {
  //   print('101');
  //   final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
  //   print('102');
  //   if (pickedFile != null) {
  //     setState(() {
  //       print('103');
  //       _profileImage = File(pickedFile.path);
  //     });
  //     print('104');
  //     SharedPrefController().saveProfileImageUrl(profileImageUrl: await FbStorageController().pickImage(pickedFile: pickedFile, folderName: 'image'));
  //     print('105');
  //     profileImageUrl = FbStorageController().imageUrl;
  //     print('106');
  //   }
  // }
  //
  // Future<void> _pickCoverImage() async {
  //   print('firstPickCoverImage');
  //   final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     print('01');
  //     setState(() {
  //       print('02');
  //       _coverImage = File(pickedFile.path);
  //     });
  //     print('03');
  //     // bool status =
  //     SharedPrefController().saveCoverImageUrl(coverImageUrl: await FbStorageController().pickImage(pickedFile: pickedFile, folderName: 'image'));
  //     // if(status){
  //     //   showSmackBar(context : context , message : status ? 'Process Success' : 'Process Failed', error : true);
  //     // }
  //     print('04');
  //     coverImageUrl = FbStorageController().imageUrl;
  //     print('05');
  //   }
  // }

  UserProfileDataModel get userProfileDataModel {
    print('widget.userProfileDataModel!.id');
    UserProfileDataModel userProfileDataModel =
        widget.userProfileDataModel == null
            ? UserProfileDataModel()
            : widget.userProfileDataModel!;
    userProfileDataModel.userDataId = widget.userProfileDataModel == null
        ? uuid.v4()
        : SharedPrefController().userDataId;
    userProfileDataModel.firstName = _firstNameTextEditingController.text;
    userProfileDataModel.lastName = _lastNameTextEditingController.text;
    userProfileDataModel.bio = _bioTextEditingController.text;
    userProfileDataModel.dateOfBirth = _dateOfBirth.toString();
    userProfileDataModel.backgroundImage = SharedPrefController().coverImageUrl;
    userProfileDataModel.profileImageUrl = SharedPrefController().profileImageUrl;
    userProfileDataModel.userIdRegistration =
        SharedPrefController().userIdRegistration;
    return userProfileDataModel;
  }

  void clear() {
    _firstNameTextEditingController.text = '';
    _lastNameTextEditingController.text = '';
    _bioTextEditingController.text = '';
  }
}
