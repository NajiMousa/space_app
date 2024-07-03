import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import '../../controllers/firebase_controllers/fb_firestore_controller.dart';
import '../../controllers/firebase_controllers/fb_storage_controller.dart';
import '../../models/group_models/group_data_model.dart';
import '../../prefs/shared_pref_controller.dart';
import '../primary_screens/main_screen.dart';
import '../widgets/app_text_field_widget.dart';

class AddGroupScreen extends StatefulWidget {
  AddGroupScreen({Key? key ,this.groupDataModel}) : super(key: key);

  final GroupDataModel? groupDataModel;
  @override
  State<AddGroupScreen> createState() => _AddGroupScreenState();
}

class _AddGroupScreenState extends State<AddGroupScreen> {
  bool hasAddedStory = false;
  bool isActive = true;
  bool isClickOnMoreIcon = false;
  var uuid = Uuid();

  File? _coverImage;
  bool _isUploading = false;
  final ImagePicker _picker = ImagePicker();
  double _linerProgress = 0;
  final _formKey = GlobalKey<FormState>();

  String? _groupNameErrorText;
  String? _groupBioErrorText;
  String? _groupTypeErrorText;

  late TextEditingController _groupNameTextEditingController;
  late TextEditingController _groupBioTextEditingController;
  late TextEditingController _groupTypeTextEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _groupNameTextEditingController = TextEditingController(text: widget.groupDataModel?.groupName ?? '');
    _groupBioTextEditingController = TextEditingController(text: widget.groupDataModel?.groupBio ?? '');
    _groupTypeTextEditingController = TextEditingController(text: widget.groupDataModel?.groupType ?? '');

  }

  @override
  void dispose() {
    // TODO: implement dispose
    _groupNameTextEditingController.dispose();
    _groupBioTextEditingController.dispose();
    _groupTypeTextEditingController.dispose();

    super.dispose();
  }

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
              onPressed: () async{
                performProcess();
                // if (_formKey.currentState!.validate()) {
                //   _formKey.currentState!.save();
                //   // Handle save logic here
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     SnackBar(content: Text('Initiative Created')),
                //   );
                // }
              },
              style: ElevatedButton.styleFrom(
                // padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
                minimumSize: Size(double.infinity, 56.h),
                backgroundColor: HexColor('#FFFFFF'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.sp),
                ),
              ),
              child: Text(
                'Create Group',
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
                              'Create New Group',
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
                  child: SingleChildScrollView(
                    // padding: EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                        : groupDataModel == null ? Image.asset(
                                      'images/AA.png',
                                      width: double.infinity,
                                      height: 370.h,
                                      fit: BoxFit.cover,
                                    ):CachedNetworkImage(
                                      imageUrl:'',
                                      // widget
                                      //     .groupDataModel!
                                      //     .backgroundImage,
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

                      SizedBox(height: 18.h),

                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 24.w, vertical: 6.h),
                              child: Text(
                                'Group Name',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: HexColor('#333333'),
                                    fontFamily: 'BreeSerif'),
                              ),
                            ),
                            AppTextFieldWidget(
                              textEditingController: _groupNameTextEditingController,
                              prefixIcon: Icons.person,
                              hintText: 'Naji atwa hammad abu mousa',
                              obsecure: false,
                              textInputType: TextInputType.emailAddress,
                              errorText: _groupNameErrorText,
                            ),

                      // AppTextFieldWidget(
                      //     labelText: 'Flutter', sectionTitle: 'Group Name'),
                      // TextFormField(
                      //   decoration: InputDecoration(labelText: 'Group Name'),
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'Please enter the group name';
                      //     }
                      //     return null;
                      //   },
                      //   onSaved: (value) {
                      //     _groupName = value!;
                      //   },
                      // ),
                      //

                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 24.w, vertical: 6.h),
                              child: Text(
                                'Group Bio',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: HexColor('#333333'),
                                    fontFamily: 'BreeSerif'),
                              ),
                            ),
                            AppTextFieldWidget(
                              textEditingController: _groupBioTextEditingController,
                              prefixIcon: Icons.person,
                              hintText: 'Naji atwa hammad abu mousa',
                              obsecure: false,
                              textInputType: TextInputType.emailAddress,
                              errorText: _groupBioErrorText,
                            ),
                      // AppTextFieldWidget(
                      //     labelText: 'Group Bio',
                      //     sectionTitle: 'Description'),
                      // AppTextFieldWidget(labelText: 'Description'),

                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 24.w, vertical: 6.h),
                              child: Text(
                                'Group Type',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: HexColor('#333333'),
                                    fontFamily: 'BreeSerif'),
                              ),
                            ),
                            AppTextFieldWidget(
                              textEditingController: _groupTypeTextEditingController,
                              prefixIcon: Icons.person,
                              hintText: 'Naji atwa hammad abu mousa',
                              obsecure: false,
                              textInputType: TextInputType.emailAddress,
                              errorText: _groupTypeErrorText,
                            ),
                      // AppTextFieldWidget(
                      //     labelText: 'Group Type',
                      //     sectionTitle: 'Group Type'),
                      // DropdownButtonFormField<String>(
                      //   value: _groupType,
                      //   decoration: InputDecoration(labelText: 'Group Type'),
                      //   items: ['Public', 'Private'].map((String type) {
                      //     return DropdownMenuItem<String>(
                      //       value: type,
                      //       child: Text(type),
                      //     );
                      //   }).toList(),
                      //   onChanged: (String? newValue) {
                      //     setState(() {
                      //       _groupType = newValue!;
                      //     });
                      //   },
                      // ),
                      SizedBox(height: 50),

                        ],
                      ),
                    ),
                  ),
                  // _primaryPageModel[_selectedIndex].widget,
                ),
              ],
            ),
            // _selectedDrawer == 8 ? _primaryPageModel[_selectedDrawer].widget : SizedBox()
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
    if (_groupNameTextEditingController.text.isNotEmpty &&
        _groupBioTextEditingController.text.isNotEmpty &&
        _groupTypeTextEditingController.text.isNotEmpty ) {
      ///showSnackBar(context : context , message : 'Enter required Data', error : true);
      return true;
    }
    return false;
  }

  Future<void> process() async {

    bool status = widget.groupDataModel == null
        ? await FbFireStoreController().createGroup(groupDataModel: groupDataModel)
        : await FbFireStoreController().updateGroup(groupDataModel: groupDataModel); // jp]de
    if (status) {
      if (widget.groupDataModel != null) {
        Navigator.pop(context);
      }
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return MainScreen(selectedIndex: 6);
        },
      ));
    }

    ///showSnackBar(context : context , message : status ? 'Process Success' : 'Process Failed', error : true);
    // print('01');
    // print('02');
    // bool status = await FbFireStoreController().createGroup(groupDataModel: groupDataModel);
    // if(status){
    //   Navigator.pop(context);
    // }
    // ///showSnackBar(context : context , message : status ? 'Process Success' : 'Process Failed', error : true);
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

  GroupDataModel get groupDataModel {
    GroupDataModel groupDataModel =
    widget.groupDataModel == null ? GroupDataModel() : widget.groupDataModel!;
    groupDataModel.groupId = widget.groupDataModel == null ? uuid.v4() : SharedPrefController().groupId;
    groupDataModel.groupName = _groupNameTextEditingController.text;
    groupDataModel.groupBio = _groupBioTextEditingController.text;
    groupDataModel.groupType = _groupTypeTextEditingController.text;
    groupDataModel.userDataId = SharedPrefController().userDataId;
    groupDataModel.groupMembersCount = 20;
    groupDataModel.backgroundImage = SharedPrefController().coverImageUrl;

    return groupDataModel;
  }

}






