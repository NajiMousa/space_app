
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
import '../../models/initiative_models/initiative_data_model.dart';
import '../../prefs/shared_pref_controller.dart';
import '../primary_screens/main_screen.dart';
import '../widgets/app_text_field_widget.dart';

class AddInitiativeScreen extends StatefulWidget {
  const AddInitiativeScreen({Key? key, this.initiativeDataModel}) : super(key: key);
  final InitiativeDataModel? initiativeDataModel;

  @override
  State<AddInitiativeScreen> createState() => _AddInitiativeScreenState();
}

class _AddInitiativeScreenState extends State<AddInitiativeScreen> {

  final ImagePicker _picker = ImagePicker();
  double _linerProgress = 0;
  bool hasAddedStory = false;
  bool isActive = true;
  bool isClickOnMoreIcon = false;
  var uuid = Uuid();
  final _formKey = GlobalKey<FormState>();
  File? _coverImage;
  bool _isUploading = false;

  String? _initiativeNameErrorText;
  String? _classificationErrorText;
  String? _descriptionErrorText;
  String? _targetAmountErrorText;
  String? _mechanismOfWorkErrorText;
  String? _responsiblePersonErrorText;


  late TextEditingController _initiativeNameTextEditingController;
  late TextEditingController _classificationTextEditingController;
  late TextEditingController _descriptionTextEditingController;
  late TextEditingController _targetAmountTextEditingController;
  late TextEditingController _mechanismOfWorkTextEditingController;
  late TextEditingController _responsiblePersonTextEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initiativeNameTextEditingController = TextEditingController(text: widget.initiativeDataModel?.initiativeName ?? '');
    _classificationTextEditingController = TextEditingController(text: widget.initiativeDataModel?.classification ?? '');
    _descriptionTextEditingController = TextEditingController(text: widget.initiativeDataModel?.description ?? '');
    _targetAmountTextEditingController = TextEditingController(text: widget.initiativeDataModel?.targetAmount ?? '');
    _mechanismOfWorkTextEditingController = TextEditingController(text: widget.initiativeDataModel?.mechanismOfWork ?? '');
    _responsiblePersonTextEditingController = TextEditingController(text: widget.initiativeDataModel?.responsiblePerson ?? '');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _initiativeNameTextEditingController.dispose();
    _classificationTextEditingController.dispose();
    _descriptionTextEditingController.dispose();
    _targetAmountTextEditingController.dispose();
    _mechanismOfWorkTextEditingController.dispose();
    _responsiblePersonTextEditingController.dispose();
    super.dispose();
  }

  // List<File> _documentationFiles = [];

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
                //     SnackBar(
                //         content: Text('Initiative Created')),
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
                'Create Initiative',
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
                              'Create New Initiative',
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
                    padding: EdgeInsets.all(16.0),
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
                                      : CachedNetworkImage(
                                    imageUrl: '',
                                    // widget
                                    //     .initiativeDataModel!
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
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.w, vertical: 6.h),
                            child: Text(
                              'Initiative Name',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: HexColor('#333333'),
                                  fontFamily: 'BreeSerif'),
                            ),
                          ),
                          AppTextFieldWidget(
                            textEditingController: _initiativeNameTextEditingController,
                            prefixIcon: Icons.person,
                            hintText: 'Naji atwa hammad abu mousa',
                            obsecure: false,
                            textInputType: TextInputType.emailAddress,
                            errorText: _initiativeNameErrorText,
                          ),
                          // AppTextFieldWidget(labelText: 'Ihsan',sectionTitle: 'Initiative Name'),
                          // TextFormField(
                          //   decoration: InputDecoration(labelText: 'Initiative Name'),
                          //   validator: (value) {
                          //     if (value == null || value.isEmpty) {
                          //       return 'Please enter the initiative name';
                          //     }
                          //     return null;
                          //   },
                          //   onSaved: (value) {
                          //     _initiativeName = value!;
                          //   },
                          // ),

                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.w, vertical: 6.h),
                            child: Text(
                              'Classification',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: HexColor('#333333'),
                                  fontFamily: 'BreeSerif'),
                            ),
                          ),
                          AppTextFieldWidget(
                            textEditingController: _classificationTextEditingController,
                            prefixIcon: Icons.person,
                            hintText: 'Health',
                            obsecure: false,
                            textInputType: TextInputType.emailAddress,
                            errorText: _classificationErrorText,
                          ),
                          // AppTextFieldWidget(labelText: 'Health',sectionTitle:'Classification' ),
                          // DropdownButtonFormField<String>(
                          //   value: _classification,
                          //   decoration: InputDecoration(labelText: 'Classification'),
                          //   items: ['Health', 'Other'].map((String classification) {
                          //     return DropdownMenuItem<String>(
                          //       value: classification,
                          //       child: Text(classification),
                          //     );
                          //   }).toList(),
                          //   onChanged: (String? newValue) {
                          //     setState(() {
                          //       _classification = newValue!;
                          //     });
                          //   },
                          // ),

                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.w, vertical: 6.h),
                            child: Text(
                              'Description',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: HexColor('#333333'),
                                  fontFamily: 'BreeSerif'),
                            ),
                          ),
                          AppTextFieldWidget(
                            textEditingController: _descriptionTextEditingController,
                            prefixIcon: Icons.person,
                            hintText: 'your initiative Bio',
                            obsecure: false,
                            textInputType: TextInputType.emailAddress,
                            errorText: _descriptionErrorText,
                          ),
                          // AppTextFieldWidget(labelText: 'your initiative Bio',sectionTitle: 'Description'),
                          // TextFormField(
                          //   decoration: InputDecoration(labelText: 'Description'),
                          //   maxLines: 3,
                          //   validator: (value) {
                          //     if (value == null || value.isEmpty) {
                          //       return 'Please enter a description';
                          //     }
                          //     return null;
                          //   },
                          //   onSaved: (value) {
                          //     _description = value!;
                          //   },
                          // ),

                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.w, vertical: 6.h),
                            child: Text(
                              'Target Amount (USD)',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: HexColor('#333333'),
                                  fontFamily: 'BreeSerif'),
                            ),
                          ),
                          AppTextFieldWidget(
                            textEditingController: _targetAmountTextEditingController,
                            prefixIcon: Icons.person,
                            hintText: 'Naji atwa hammad abu mousa',
                            obsecure: false,
                            textInputType: TextInputType.emailAddress,
                            errorText: _targetAmountErrorText,
                          ),
                          // AppTextFieldWidget(labelText: '1000 Dollar',sectionTitle: 'Target Amount (USD)'),
                          // TextFormField(
                          //   decoration: InputDecoration(labelText: 'Target Amount (USD)'),
                          //   keyboardType: TextInputType.number,
                          //   validator: (value) {
                          //     if (value == null || value.isEmpty) {
                          //       return 'Please enter the target amount';
                          //     }
                          //     if (double.tryParse(value) == null) {
                          //       return 'Please enter a valid amount';
                          //     }
                          //     return null;
                          //   },
                          //   onSaved: (value) {
                          //     _targetAmount = double.parse(value!);
                          //   },
                          // ),

                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.w, vertical: 6.h),
                            child: Text(
                              'Mechanism of Work',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: HexColor('#333333'),
                                  fontFamily: 'BreeSerif'),
                            ),
                          ),
                          AppTextFieldWidget(
                            textEditingController: _mechanismOfWorkTextEditingController,
                            prefixIcon: Icons.person,
                            hintText: 'Naji atwa hammad abu mousa',
                            obsecure: false,
                            textInputType: TextInputType.emailAddress,
                            errorText: _mechanismOfWorkErrorText,
                          ),
                          // AppTextFieldWidget(labelText: 'Mechanism of Work', sectionTitle: 'Mechanism of Work'),
                          // TextFormField(
                          //   decoration: InputDecoration(labelText: 'Mechanism of Work'),
                          //   maxLines: 3,
                          //   validator: (value) {
                          //     if (value == null || value.isEmpty) {
                          //       return 'Please enter the mechanism of work';
                          //     }
                          //     return null;
                          //   },
                          //   onSaved: (value) {
                          //     _mechanism = value!;
                          //   },
                          // ),

                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.w, vertical: 6.h),
                            child: Text(
                              'Responsible Person',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: HexColor('#333333'),
                                  fontFamily: 'BreeSerif'),
                            ),
                          ),
                          AppTextFieldWidget(
                            textEditingController: _responsiblePersonTextEditingController,
                            prefixIcon: Icons.person,
                            hintText: 'Naji atwa hammad abu mousa',
                            obsecure: false,
                            textInputType: TextInputType.emailAddress,
                            errorText: _responsiblePersonErrorText,
                          ),
                          // AppTextFieldWidget(labelText: 'Responsible Person', sectionTitle: 'Responsible Person'),
                          // TextFormField(
                          //   decoration: InputDecoration(labelText: 'Responsible Person'),
                          //   validator: (value) {
                          //     if (value == null || value.isEmpty) {
                          //       return 'Please enter the responsible person\'s name';
                          //     }
                          //     return null;
                          //   },
                          //   onSaved: (value) {
                          //     _responsiblePerson = value!;
                          //   },
                          // ),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            child: Text(
                              'Documentation Files',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: HexColor('#333333'),
                                  fontFamily: 'BreeSerif'),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                            child: Wrap(
                              spacing: 10,
                              children: [
                                // ..._documentationFiles.map((file) => Image.file(file, width: 100, height: 100)),
                                GestureDetector(
                                  // onTap: _pickDocument,
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    color: Colors.grey[300],
                                    child: Icon(Icons.add),
                                  ),
                                ),
                              ],
                            ),
                          ),
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
    if (_initiativeNameTextEditingController.text.isNotEmpty &&
        _classificationTextEditingController.text.isNotEmpty &&
        _descriptionTextEditingController.text.isNotEmpty &&
        _targetAmountTextEditingController.text.isNotEmpty &&
        _mechanismOfWorkTextEditingController.text.isNotEmpty &&
        _responsiblePersonTextEditingController.text.isNotEmpty ) {
      ///showSnackBar(context : context , message : 'Enter required Data', error : true);
      return true;
    }
    return false;
  }

  Future<void> process() async {
    print('01');
    // CollectionReference users = FirebaseFirestore.instance.collection('users');
    // QuerySnapshot querySnapshot = SharedPrefController().phone != null
    //     ? await users.where('phone', isEqualTo: SharedPrefController().phone).get()
    //     : await users.where('email', isEqualTo: SharedPrefController().email).get();
    // if (querySnapshot.docs.isNotEmpty) {
    //   SharedPrefController().saveUserIdRegistration(userIdRegistration: querySnapshot.docs.first.id);
    // }

    bool status = widget.initiativeDataModel == null
        ? await FbFireStoreController().createInitiativePage(initiativeDataModel: initiativeDataModel) //انشاء
        : await FbFireStoreController().updateInitiativePage(initiativeDataModel: initiativeDataModel); // jp]de
    if (status) {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return MainScreen(selectedIndex: 0);
        },
      ));
      if (widget.initiativeDataModel != null) {
        Navigator.pop(context);
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return MainScreen(selectedIndex: 0);
          },
        ));
      }
    }
    // print('02');
    // bool status = await FbFireStoreController().createInitiativePage(initiativeDataModel: initiativeDataModel);
    // if(status){
    //   Navigator.pop(context);
    // }

    ///showSnackBar(context : context , message : status ? 'Process Success' : 'Process Failed', error : true);
  }

  InitiativeDataModel get initiativeDataModel {
    InitiativeDataModel initiativeDataModel =
    widget.initiativeDataModel == null ? InitiativeDataModel() : widget.initiativeDataModel!;
    // InitiativeDataModel initiativeDataModel =  InitiativeDataModel();
    initiativeDataModel.initiativeId =  initiativeDataModel.initiativeId == null ? uuid.v4(): SharedPrefController().initiativeId;
    initiativeDataModel.initiativeName = _initiativeNameTextEditingController.text;
    initiativeDataModel.classification = _classificationTextEditingController.text;
    initiativeDataModel.description = _descriptionTextEditingController.text;
    initiativeDataModel.mechanismOfWork = _mechanismOfWorkTextEditingController.text;
    initiativeDataModel.responsiblePerson = _responsiblePersonTextEditingController.text;
    initiativeDataModel.targetAmount = _targetAmountTextEditingController.text;
    initiativeDataModel.backgroundImage = SharedPrefController().coverImageUrl;
    initiativeDataModel.userDataId = SharedPrefController().userDataId;

    return initiativeDataModel;
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

}

