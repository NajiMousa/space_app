import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:difaf_al_wafa_app/models/initiative_models/initiative_data_model.dart';
import 'package:difaf_al_wafa_app/models/message_models/conversation_model.dart';
import 'package:difaf_al_wafa_app/prefs/shared_pref_controller.dart';
import 'package:difaf_al_wafa_app/screens/drawer_menu_Screens/messanger_screens/single_messanger_screen.dart';
import 'package:difaf_al_wafa_app/screens/edit_screens/edit_user_profile_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:uuid/uuid.dart';
import '../../controllers/firebase_controllers/fb_firestore_controller.dart';
import '../../models/martyr_models/martyr_profile_data_model.dart';
import '../../models/martyr_models/martyr_request_data_model.dart';
import '../../models/user_models/user_profile_data_model.dart';
import 'main_admin_screen.dart';

class RequestDetailsScreen extends StatefulWidget {
  RequestDetailsScreen({Key? key, required this.martyrRequestDataModel})
      : super(key: key);

  MartyrRequestDataModel martyrRequestDataModel;

  @override
  State<RequestDetailsScreen> createState() => _RequestDetailsScreenState();
}

class _RequestDetailsScreenState extends State<RequestDetailsScreen> {
  int _selectedTypeMessanger = 0;
  SharedPrefController sharedPrefController = SharedPrefController();
  UserProfileDataModel? _userProfileData;
  bool _isLoading = true;
  var uuid = Uuid();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    List<UserProfileDataModel> userData =
        await FbFireStoreController().getAllUserData();
    print(SharedPrefController().userIdRegistration);
    print('SharedPrefController().userIdRegistration');
    setState(() {
      _userProfileData = userData.firstWhere((user) =>
          user.userIdRegistration == SharedPrefController().userIdRegistration);
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#333333"),
      bottomNavigationBar: Container(
        height: 80.0, // Set the height here
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 6.h),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  performProcess();
                },
                child: Container(
                  width: 164.w,
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.sp),
                      color: HexColor('#FFFFFF')),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'images/addPost.svg',
                        width: 16.w,
                        height: 16.h,
                        color: HexColor('#333333'),
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        'Accept',
                        style: TextStyle(
                          fontFamily: 'BreeSerif',
                          fontSize: 12.sp,
                          color: HexColor('#333333'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              InkWell(
                onTap: () {
                  performProcess();
                },
                child: Container(
                  width: 164.w,
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.sp),
                      color: Colors.red),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'images/addPost.svg',
                        width: 16.w,
                        height: 16.h,
                        color: HexColor('#FFFFFF'),
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        'Reject',
                        style: TextStyle(
                          fontFamily: 'BreeSerif',
                          fontSize: 12.sp,
                          color: HexColor('#FFFFFF'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Request Details',
          style: TextStyle(
              fontSize: 20.sp,
              color: HexColor('#333333'),
              fontFamily: 'BreeSerif'),
        ),
      ),
      body: Stack(
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
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 18.h),
                Text(
                  'Full Martyr Name',
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: HexColor('#333333'),
                      fontFamily: 'BreeSerif'),
                ),
                Text(
                  widget.martyrRequestDataModel.fullMartyrName,
                  style: TextStyle(
                    fontFamily: 'BreeSerif',
                    fontSize: 16.sp,
                    color: HexColor('#333333'),
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Martyr ID Number',
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: HexColor('#333333'),
                      fontFamily: 'BreeSerif'),
                ),
                Text(
                  widget.martyrRequestDataModel.martyrIdNumber,
                  style: TextStyle(
                    fontFamily: 'BreeSerif',
                    fontSize: 16.sp,
                    color: HexColor('#333333'),
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Date of Birth',
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: HexColor('#333333'),
                      fontFamily: 'BreeSerif'),
                ),
                Text(
                  widget.martyrRequestDataModel.dateOfBirthMartyr,
                  style: TextStyle(
                    fontFamily: 'BreeSerif',
                    fontSize: 16.sp,
                    color: HexColor('#333333'),
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Gender the martyr',
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: HexColor('#333333'),
                      fontFamily: 'BreeSerif'),
                ),
                Text(
                  'male',
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: HexColor('#333333'),
                      fontFamily: 'BreeSerif'),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Date of martyrdom/loss',
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: HexColor('#333333'),
                      fontFamily: 'BreeSerif'),
                ),
                Text(
                  widget.martyrRequestDataModel.dateOfMartyrdom,
                  style: TextStyle(
                    fontFamily: 'BreeSerif',
                    fontSize: 16.sp,
                    color: HexColor('#333333'),
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Place of martyrdom/loss',
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: HexColor('#333333'),
                      fontFamily: 'BreeSerif'),
                ),
                Text(
                  widget.martyrRequestDataModel.placeOfMartyrdom,
                  style: TextStyle(
                    fontFamily: 'BreeSerif',
                    fontSize: 16.sp,
                    color: HexColor('#333333'),
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Death Certificate',
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: HexColor('#333333'),
                      fontFamily: 'BreeSerif'),
                ),
                Text(
                  widget.martyrRequestDataModel.deathCertificate,
                  style: TextStyle(
                    fontFamily: 'BreeSerif',
                    fontSize: 16.sp,
                    color: HexColor('#333333'),
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Full Your Name',
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: HexColor('#333333'),
                      fontFamily: 'BreeSerif'),
                ),
                Text(
                  widget.martyrRequestDataModel.fullUserName,
                  style: TextStyle(
                    fontFamily: 'BreeSerif',
                    fontSize: 16.sp,
                    color: HexColor('#333333'),
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Your ID Number',
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: HexColor('#333333'),
                      fontFamily: 'BreeSerif'),
                ),
                Text(
                  widget.martyrRequestDataModel.userIDNumber,
                  style: TextStyle(
                    fontFamily: 'BreeSerif',
                    fontSize: 16.sp,
                    color: HexColor('#333333'),
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Your Phone Number',
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: HexColor('#333333'),
                      fontFamily: 'BreeSerif'),
                ),
                Text(
                  widget.martyrRequestDataModel.userPhoneNumber,
                  style: TextStyle(
                    fontFamily: 'BreeSerif',
                    fontSize: 16.sp,
                    color: HexColor('#333333'),
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Relative Relation',
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: HexColor('#333333'),
                      fontFamily: 'BreeSerif'),
                ),
                Text(
                  'male',
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: HexColor('#333333'),
                      fontFamily: 'BreeSerif'),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Your ID Certificate',
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: HexColor('#333333'),
                      fontFamily: 'BreeSerif'),
                ),
                Text(
                  widget.martyrRequestDataModel.userIDCertificate,
                  style: TextStyle(
                    fontFamily: 'BreeSerif',
                    fontSize: 16.sp,
                    color: HexColor('#333333'),
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Full First Identifiers Name',
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: HexColor('#333333'),
                      fontFamily: 'BreeSerif'),
                ),
                Text(
                  widget.martyrRequestDataModel.fullFirstIdentifiersName,
                  style: TextStyle(
                    fontFamily: 'BreeSerif',
                    fontSize: 16.sp,
                    color: HexColor('#333333'),
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  'First Identifiers ID Number',
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: HexColor('#333333'),
                      fontFamily: 'BreeSerif'),
                ),
                Text(
                  widget.martyrRequestDataModel.firstIdentifiersIDNumber,
                  style: TextStyle(
                    fontFamily: 'BreeSerif',
                    fontSize: 16.sp,
                    color: HexColor('#333333'),
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  'First Identifiers Phone Number',
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: HexColor('#333333'),
                      fontFamily: 'BreeSerif'),
                ),
                Text(
                  widget.martyrRequestDataModel.firstIdentifiersPhoneNumber,
                  style: TextStyle(
                    fontFamily: 'BreeSerif',
                    fontSize: 16.sp,
                    color: HexColor('#333333'),
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Gender the First Identifiers',
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: HexColor('#333333'),
                      fontFamily: 'BreeSerif'),
                ),
                Text(
                  'male',
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: HexColor('#333333'),
                      fontFamily: 'BreeSerif'),
                ),
                SizedBox(height: 24.w)
              ],
            ),
          ),
        ],
      ),
    );
  }

  MartyrProfileDataModel get martyrProfileDataModel {
    MartyrProfileDataModel martyrProfileDataModel = MartyrProfileDataModel();

    martyrProfileDataModel.martyrDataId = uuid.v4();
    martyrProfileDataModel.firstName =
        widget.martyrRequestDataModel.fullMartyrName;
    martyrProfileDataModel.lastName =
        widget.martyrRequestDataModel.fullMartyrName;
    martyrProfileDataModel.bio = widget.martyrRequestDataModel.placeOfMartyrdom;
    martyrProfileDataModel.dateOfBirth =
        widget.martyrRequestDataModel.dateOfBirthMartyr;
    martyrProfileDataModel.userDataId =
        widget.martyrRequestDataModel.userDataId;
    martyrProfileDataModel.martyrRequestDataId =
        widget.martyrRequestDataModel.martyrRequestId;
    martyrProfileDataModel.backgroundImage = '';
    martyrProfileDataModel.profileImage = '';

    return martyrProfileDataModel;
  }

  MartyrRequestDataModel get martyrRequestDataModel {
    MartyrRequestDataModel martyrRequestDataModel = MartyrRequestDataModel();

    martyrRequestDataModel.firstIdentifiersPhoneNumber =
        widget.martyrRequestDataModel.firstIdentifiersPhoneNumber;
    martyrRequestDataModel.firstIdentifiersIDNumber =
        widget.martyrRequestDataModel.firstIdentifiersIDNumber;
    martyrRequestDataModel.dateOfBirthMartyr =
        widget.martyrRequestDataModel.dateOfBirthMartyr;
    martyrRequestDataModel.martyrIdNumber =
        widget.martyrRequestDataModel.martyrIdNumber;
    martyrRequestDataModel.fullMartyrName =
        widget.martyrRequestDataModel.fullMartyrName;
    martyrRequestDataModel.deathCertificate =
        widget.martyrRequestDataModel.deathCertificate;
    martyrRequestDataModel.placeOfMartyrdom =
        widget.martyrRequestDataModel.placeOfMartyrdom;
    martyrRequestDataModel.dateOfMartyrdom =
        widget.martyrRequestDataModel.dateOfMartyrdom;
    martyrRequestDataModel.userPhoneNumber =
        widget.martyrRequestDataModel.userPhoneNumber;
    martyrRequestDataModel.userIDNumber =
        widget.martyrRequestDataModel.userIDNumber;
    martyrRequestDataModel.fullUserName =
        widget.martyrRequestDataModel.fullUserName;
    martyrRequestDataModel.fullFirstIdentifiersName =
        widget.martyrRequestDataModel.fullFirstIdentifiersName;
    martyrRequestDataModel.userIDCertificate =
        widget.martyrRequestDataModel.userIDCertificate;
    martyrRequestDataModel.status = 'accept';
    martyrRequestDataModel.userDataId =
        widget.martyrRequestDataModel.userDataId;
    martyrRequestDataModel.martyrRequestId =
        widget.martyrRequestDataModel.martyrRequestId;

    return martyrRequestDataModel;
  }

  Future<void> performProcess() async {
    await process();
  }

  Future<void> process() async {
    print('01');

    bool status = await FbFireStoreController()
        .createMartyrData(martyrProfileDataModel: martyrProfileDataModel);
    if (status) {
      bool status = await FbFireStoreController()
          .updateMartyrRequest(martyrRequestDataModel: martyrRequestDataModel);
      if (status) {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return MainRequestScreen(selectedIndex: 0);
          },
        ));
      }
    }

    ///showSnackBar(context : context , message : status ? 'Process Success' : 'Process Failed', error : true);
  }
}
