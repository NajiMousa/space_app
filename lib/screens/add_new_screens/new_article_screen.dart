import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:camera/camera.dart';
import 'package:difaf_al_wafa_app/prefs/shared_pref_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import '../../controllers/firebase_controllers/fb_firestore_controller.dart';
import '../../controllers/firebase_controllers/fb_storage_controller.dart';
import '../../models/article_models/article_data_model.dart';
import '../primary_screens/main_screen.dart';
import '../widgets/app_widgets/app_text_field_widget.dart';
import '../widgets/app_widgets/loader_widgets/shimmer_placeholder.dart';

class NewArticleScreen extends StatefulWidget {
  NewArticleScreen({Key? key,  this.articleDataModel}) : super(key: key,);

  ArticleDataModel? articleDataModel;

  @override
  State<NewArticleScreen> createState() => _NewArticleScreenState();
}

class _NewArticleScreenState extends State<NewArticleScreen> {
  int _selectedTypeMessanger = 0;
  SharedPrefController sharedPrefController = SharedPrefController();

  bool _isLoading = false;
  bool _isFollow = false;
  var uuid = Uuid();
  File? _coverImage;

  final ImagePicker _picker = ImagePicker();
  double _linerProgress = 0;

  late TextEditingController _articleTitleTextEditingController;
  late TextEditingController _articleDetailsTextEditingController;
  late TextEditingController _articlePublisherTextEditingController;
  late TextEditingController _yearOfPublicationTextEditingController;
  late TextEditingController _placeOfPublicationTextEditingController;

  String? _articleTitleErrorText;
  String? _articleDetailsErrorText;
  String? _articlePublisherErrorText;
  String? _yearOfPublicationTErrorText;
  String? _placeOfPublicationErrorText;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _articleTitleTextEditingController = TextEditingController();
    _articleDetailsTextEditingController = TextEditingController();
    _articlePublisherTextEditingController = TextEditingController();
    _yearOfPublicationTextEditingController = TextEditingController();
    _placeOfPublicationTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _articleTitleTextEditingController.dispose();
    _articleDetailsTextEditingController.dispose();
    _articlePublisherTextEditingController.dispose();
    _yearOfPublicationTextEditingController.dispose();
    _placeOfPublicationTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#333333"),
      bottomNavigationBar: InkWell(
        onTap: () => performProcess(),
        child: Container(
            height: 72.0, // Set the height here
            child: Container(
              alignment: AlignmentDirectional.center,
              margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 15.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.sp),
                color: Colors.white,
              ),
              width: double.infinity,
              height: 32.h,
              child: Text(
                'Publish',
                style: TextStyle(
                    fontSize: 14.sp,
                    color: HexColor('#333333'),
                    fontFamily: 'BreeSerif'),
              ),
            )),
      ),
      body: _isLoading
          ? ShimmerPlaceholder()
          : Stack(
              alignment: sharedPrefController.language == 'en'
                  ? Alignment.topLeft
                  : Alignment.topRight,
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
                    padding: EdgeInsets.zero,
                    // crossAxisAlignment: CrossAxisAlignment.start,
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
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 240.h),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(42.sp),
                              color: Colors.white,
                            ),
                            child: ListView(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 24.w, vertical: 6.h),
                                  child: Text(
                                    'Article Title',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: HexColor('#333333'),
                                        fontFamily: 'BreeSerif'),
                                  ),
                                ),
                                AppTextFieldWidget(
                                  textEditingController:
                                      _articleTitleTextEditingController,
                                  // prefixIcon: Icons.person,
                                  hintText: 'Naji atwa hammad abu mousa',
                                  obsecure: false,
                                  textInputType: TextInputType.emailAddress,
                                  errorText: _articleTitleErrorText,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 24.w, vertical: 6.h),
                                  child: Text(
                                    'Article Details',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: HexColor('#333333'),
                                        fontFamily: 'BreeSerif'),
                                  ),
                                ),
                                AppTextFieldWidget(
                                  textEditingController:
                                      _articleDetailsTextEditingController,
                                  // prefixIcon: Icons.person,
                                  hintText: 'your Details',
                                  obsecure: false,
                                  textInputType: TextInputType.emailAddress,
                                  errorText: _articleDetailsErrorText,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 24.w, vertical: 6.h),
                                  child: Text(
                                    'Article Publisher',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: HexColor('#333333'),
                                        fontFamily: 'BreeSerif'),
                                  ),
                                ),
                                AppTextFieldWidget(
                                  textEditingController:
                                      _articlePublisherTextEditingController,
                                  // prefixIcon: Icons.person,
                                  hintText: 'Naji mousa',
                                  obsecure: false,
                                  textInputType: TextInputType.emailAddress,
                                  errorText: _articlePublisherErrorText,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 24.w, vertical: 6.h),
                                  child: Text(
                                    'Year of Publication',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: HexColor('#333333'),
                                        fontFamily: 'BreeSerif'),
                                  ),
                                ),
                                AppTextFieldWidget(
                                  textEditingController:
                                      _yearOfPublicationTextEditingController,
                                  // prefixIcon: Icons.person,
                                  hintText: '1996',
                                  obsecure: false,
                                  textInputType: TextInputType.emailAddress,
                                  errorText: _yearOfPublicationTErrorText,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 24.w, vertical: 6.h),
                                  child: Text(
                                    'Place of Publication',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: HexColor('#333333'),
                                        fontFamily: 'BreeSerif'),
                                  ),
                                ),
                                AppTextFieldWidget(
                                  textEditingController:
                                      _placeOfPublicationTextEditingController,
                                  // prefixIcon: Icons.person,
                                  hintText: 'New York',
                                  obsecure: false,
                                  textInputType: TextInputType.emailAddress,
                                  errorText: _placeOfPublicationErrorText,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  Future<void> _pickCoverImage() async {
    final XFile? pickedFile =
    await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      print('01');
      setState(() {
        // _isUploading = true;
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
        // _isUploading = false;
      });
    }
  }

  Future<void> performProcess() async {
    if (checkData()) {
      await process();
    }
  }

  bool checkData() {
    if (_articleTitleTextEditingController.text.isNotEmpty &&
        _articleDetailsTextEditingController.text.isNotEmpty &&
        _articlePublisherTextEditingController.text.isNotEmpty &&
        _yearOfPublicationTextEditingController.text.isNotEmpty &&
        _placeOfPublicationTextEditingController.text.isNotEmpty) {
      ///showSnackBar(context : context , message : 'Enter required Data', error : true);
      return true;
    }
    return false;
  }

  Future<void> process() async {

    bool status = widget.articleDataModel == null
        ? await FbFireStoreController()
        .createArticle(articleDataModel: articleDataModel) //انشاء
        : await FbFireStoreController().updateArticle(
        articleDataModel: articleDataModel); // jp]de
    if (status) {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return MainScreen(selectedIndex: 0);
        },
      ));
      clear();
    }
    clear();
    ///showSnackBar(context : context , message : status ? 'Process Success' : 'Process Failed', error : true);
  }


  ArticleDataModel get articleDataModel {
    ArticleDataModel articleDataModel = widget. articleDataModel == null ? ArticleDataModel() : widget.articleDataModel!;
    articleDataModel.articleId = widget.articleDataModel == null ? uuid.v4() : widget.articleDataModel!.articleId;
    articleDataModel.articleDetails = _articleDetailsTextEditingController.text;
    articleDataModel.backgroundImage = SharedPrefController().coverImageUrl;
    articleDataModel.articlePublisher = _articlePublisherTextEditingController.text;
    articleDataModel.articleTitle = _articleTitleTextEditingController.text;
    articleDataModel.placeOfPublication = _placeOfPublicationTextEditingController.text;
    articleDataModel.yearOfPublication = _yearOfPublicationTextEditingController.text;
    articleDataModel.yearOfPublication = _yearOfPublicationTextEditingController.text;
    articleDataModel.timeStamp = DateTime.now().toString();

    return articleDataModel;
  }

  void clear() {
    _articleTitleTextEditingController.text  = '';
    _articleDetailsTextEditingController.text = '';
    _articlePublisherTextEditingController.text = '';
    _yearOfPublicationTextEditingController.text = '';
    _placeOfPublicationTextEditingController.text = '';
  }
}
