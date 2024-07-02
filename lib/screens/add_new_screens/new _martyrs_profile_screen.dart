
import 'package:difaf_al_wafa_app/models/martyr_models/martyr_request_data_model.dart';
import 'package:difaf_al_wafa_app/prefs/shared_pref_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:uuid/uuid.dart';

import '../../controllers/firebase_controllers/fb_firestore_controller.dart';
import '../widgets/app_text_field_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class NewMartyrsProfileScreen extends StatefulWidget {
  const NewMartyrsProfileScreen({Key? key}) : super(key: key);

  @override
  State<NewMartyrsProfileScreen> createState() =>
      _NewMartyrsProfileScreenState();
}

class _NewMartyrsProfileScreenState extends State<NewMartyrsProfileScreen> {
  var uuid = Uuid();
  int _selectedStepReqeust = 0;
  DateTime _dateOfBirth = DateTime(2000, 1, 1);
  String? _firstIdentifiersPhoneNumberErrorText;
  String? _firstIdentifiersIDNumberErrorText;
  String? _dateOfBirthMartyrErrorText;
  String? _martyrIdNumberErrorText;
  String? _fullMartyrNameErrorText;
  String? _deathCertificateErrorText;
  String? _placeOfMartyrdomErrorText;
  String? _dateOfMartyrdomErrorText;
  String? _userPhoneNumberErrorText;
  String? _userIDNumberErrorText;
  String? _fullUserNameErrorText;
  String? _fullFirstIdentifiersNameErrorText;
  String? _userIDCertificateErrorText;

  late TextEditingController _deathCertificateTextEditingController;
  late TextEditingController _placeOfMartyrdomTextEditingController;
  late TextEditingController _dateOfMartyrdomTextEditingController;
  late TextEditingController _userPhoneNumberTextEditingController;
  late TextEditingController _userIDNumberTextEditingController;
  late TextEditingController _fullUserNameTextEditingController;
  late TextEditingController _firstIdentifiersPhoneNumberTextEditingController;
  late TextEditingController _firstIdentifiersIDNumberTextEditingController;
  late TextEditingController _dateOfBirthMartyrTextEditingController;
  late TextEditingController _martyrIdNumberTextEditingController;
  late TextEditingController _fullMartyrNameTextEditingController;
  late TextEditingController _fullFirstIdentifiersNameTextEditingController;
  late TextEditingController _userIDCertificateTextEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _deathCertificateTextEditingController = TextEditingController();
    _placeOfMartyrdomTextEditingController = TextEditingController();
    _dateOfMartyrdomTextEditingController = TextEditingController();
    _userPhoneNumberTextEditingController = TextEditingController();
    _userIDNumberTextEditingController = TextEditingController();
    _fullUserNameTextEditingController = TextEditingController();
    _firstIdentifiersPhoneNumberTextEditingController = TextEditingController();
    _firstIdentifiersIDNumberTextEditingController = TextEditingController();
    _dateOfBirthMartyrTextEditingController = TextEditingController();
    _martyrIdNumberTextEditingController = TextEditingController();
    _fullMartyrNameTextEditingController = TextEditingController();
    _fullFirstIdentifiersNameTextEditingController = TextEditingController();
    _userIDCertificateTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _deathCertificateTextEditingController.dispose();
    _placeOfMartyrdomTextEditingController.dispose();
    _dateOfMartyrdomTextEditingController.dispose();
    _userPhoneNumberTextEditingController.dispose();
    _userIDNumberTextEditingController.dispose();
    _fullUserNameTextEditingController.dispose();
    _firstIdentifiersPhoneNumberTextEditingController.dispose();
    _firstIdentifiersIDNumberTextEditingController.dispose();
    _dateOfBirthMartyrTextEditingController.dispose();
    _martyrIdNumberTextEditingController.dispose();
    _fullMartyrNameTextEditingController.dispose();
    _fullFirstIdentifiersNameTextEditingController.dispose();
    _userIDCertificateTextEditingController.dispose();
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
          child: Stack(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: double.infinity,
                  maxHeight: 80.h,
                ),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          _selectedStepReqeust = 0;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 33.w),
                        child: Column(
                          children: [
                            _selectedStepReqeust == 0
                                ? Container(
                                    decoration: BoxDecoration(
                                      color: HexColor('#6699CC'),
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(5.sp),
                                        bottomLeft: Radius.circular(5.sp),
                                      ),
                                    ),
                                    width: 124.w,
                                    height: 5.h,
                                  )
                                : SizedBox(
                                    height: 4.h,
                                  ),
                            SizedBox(height: 20.h),
                            Text(
                              'Martyr information',
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: _selectedStepReqeust == 0
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
                          _selectedStepReqeust = 1;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 24.w),
                        child: Column(
                          children: [
                            _selectedStepReqeust == 1
                                ? Container(
                                    decoration: BoxDecoration(
                                      color: HexColor('#6699CC'),
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(5.sp),
                                        bottomLeft: Radius.circular(5.sp),
                                      ),
                                    ),
                                    width: 109.w,
                                    height: 5.h,
                                  )
                                : SizedBox(height: 4.h),
                            SizedBox(height: 20.h),
                            Text(
                              'Your information',
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: _selectedStepReqeust == 1
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
                          _selectedStepReqeust = 2;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 24.w),
                        child: Column(
                          children: [
                            _selectedStepReqeust == 2
                                ? Container(
                                    decoration: BoxDecoration(
                                      color: HexColor('#6699CC'),
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(5.sp),
                                        bottomLeft: Radius.circular(5.sp),
                                      ),
                                    ),
                                    width: 150.w,
                                    height: 5.h,
                                  )
                                : SizedBox(height: 4.h),
                            SizedBox(height: 20.h),
                            Text(
                              'Identifiers information',
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: _selectedStepReqeust == 2
                                      ? HexColor('#6699CC')
                                      : HexColor('#8C9EA0'),
                                  fontFamily: 'BreeSerif'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      // padding: EdgeInsets.only(left: 24.w),
                      margin: EdgeInsets.symmetric(
                          horizontal: 24.w, vertical: 16.h),
                      child: ElevatedButton(
                        onPressed: () async{
                          performProcess();
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.h, horizontal: 12.w),
                          backgroundColor: HexColor('#FFFFFF'),
                          minimumSize: Size(75.w, 24.h),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadiusDirectional.circular(50.sp)),
                        ),
                        child: Text(
                          _selectedStepReqeust == 2 ? 'Submit' : 'Continue',
                          style: TextStyle(
                            color: HexColor('#333333'),
                            fontSize: 10.sp,
                            fontFamily: 'BreeSerif',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
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
                              'Create New Martyrs Profile',
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  color: HexColor('#333333'),
                                  fontFamily: 'BreeSerif'),
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(width: 60.w),
                      // Container(
                      //   child: Row(
                      //     children: [
                      //       InkWell(
                      //         onTap: () {
                      //           Navigator.pushNamed(
                      //               context, '/new_post_screen');
                      //         },
                      //         child: SvgPicture.asset(
                      //           'images/addPost.svg',
                      //           width: 16.w,
                      //           height: 16.h,
                      //           color: HexColor('#333333'),
                      //         ),
                      //       ),
                      //       SizedBox(width: 24.w),
                      //       SvgPicture.asset(
                      //         'images/notificationIcon.svg',
                      //         width: 20.w,
                      //         height: 20.h,
                      //         color: HexColor('#333333'),
                      //       ),
                      //       SizedBox(width: 24.w),
                      //       InkWell(
                      //         onTap: () {
                      //           setState(() {
                      //             Navigator.pushNamed(
                      //                 context, '/messanger_screen');
                      //           });
                      //         },
                      //         child: SvgPicture.asset(
                      //           'images/messengerIcon.svg',
                      //           width: 20.w,
                      //           height: 20.h,
                      //           color: HexColor('#333333'),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
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
                  child: _selectedStepReqeust == 0
                      ? Container(
                          margin: EdgeInsets.only(bottom: 24.h),
                          child: ListView(
                            // shrinkWrap: true,
                            // physics: NeverScrollableScrollPhysics(),
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 24.w, vertical: 18.h),
                                child: Text(
                                  'Requests submitted through the application remain pending until they are reviewed and verified. Please be careful when adding data and submit documents proving this.',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      color:
                                          HexColor('#333333').withOpacity(0.7),
                                      fontFamily: 'BreeSerif'),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 24.w, vertical: 6.h),
                                child: Text(
                                  'Full Martyr Name',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      color: HexColor('#333333'),
                                      fontFamily: 'BreeSerif'),
                                ),
                              ),
                              AppTextFieldWidget(
                                textEditingController: _fullMartyrNameTextEditingController,
                                prefixIcon: Icons.person,
                                hintText: 'Naji atwa hammad abu mousa',
                                obsecure: false,
                                textInputType: TextInputType.emailAddress,
                                errorText: _fullMartyrNameErrorText,
                              ),

                              // AppTextFieldWidget(
                              //     labelText: 'Naji atwa hammad abu mousa',sectionTitle:'Full Martyr Name' ),

                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 24.w, vertical: 6.h),
                                child: Text(
                                  'Martyr ID Number',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      color: HexColor('#333333'),
                                      fontFamily: 'BreeSerif'),
                                ),
                              ),
                              AppTextFieldWidget(
                                textEditingController: _martyrIdNumberTextEditingController,
                                prefixIcon: Icons.person,
                                hintText: '123 456 789',
                                obsecure: false,
                                textInputType: TextInputType.emailAddress,
                                errorText: _martyrIdNumberErrorText,
                              ),

                              // AppTextFieldWidget(labelText: '*** *** ***',sectionTitle: 'Martyr ID Number'),
                              //

                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 24.w, vertical: 6.h),
                                child: Text(
                                  'Date of Birth',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      color: HexColor('#333333'),
                                      fontFamily: 'BreeSerif'),
                                ),
                              ),
                              AppTextFieldWidget(
                                textEditingController: _dateOfBirthMartyrTextEditingController,
                                prefixIcon: Icons.date_range,
                                hintText: 'Date of Birth: ${_dateOfBirth.toLocal()}'
                                    .split(' ')[0],
                                obsecure: false,
                                textInputType: TextInputType.emailAddress,
                                errorText: _dateOfBirthMartyrErrorText,
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
                                    if (picked != null &&
                                        picked != _dateOfBirth)
                                      setState(() {
                                        _dateOfBirth = picked;
                                      });
                                  },
                                ),
                              ),

                              // AppTextFieldWidget(labelText:'Martyr Date of Birth',sectionTitle: '09/12/1996'),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 24.w, vertical: 6.h),
                                child: Text(
                                  'Gender the martyr',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      color: HexColor('#333333'),
                                      fontFamily: 'BreeSerif'),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24.w),
                                child: Row(
                                  children: [
                                    Container(
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 8.h, horizontal: 12.w),
                                          backgroundColor: HexColor('#333333'),
                                          minimumSize: Size(165.w, 45.h),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadiusDirectional
                                                      .circular(10.sp)),
                                        ),
                                        child: Text(
                                          'Male',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10.sp,
                                            fontFamily: 'BreeSerif',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      // margin: EdgeInsets.symmetric(horizontal: 24.w),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 8.h, horizontal: 12.w),
                                          backgroundColor: HexColor('#FFFFFF'),
                                          minimumSize: Size(165.w, 45.h),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadiusDirectional
                                                      .circular(10.sp)),
                                        ),
                                        child: Text(
                                          'Female',
                                          style: TextStyle(
                                            color: HexColor('#333333'),
                                            fontSize: 10.sp,
                                            fontFamily: 'BreeSerif',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10.h),

                              // AppTextFieldWidget(labelText: 'Date of martyrdom/loss',sectionTitle: '22/05/2024'),
                              //

                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 24.w, vertical: 6.h),
                                child: Text(
                                  'Date of martyrdom/loss',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      color: HexColor('#333333'),
                                      fontFamily: 'BreeSerif'),
                                ),
                              ),
                              AppTextFieldWidget(
                                textEditingController: _dateOfMartyrdomTextEditingController,
                                prefixIcon: Icons.date_range,
                                hintText: 'Date of Birth: ${_dateOfBirth.toLocal()}'
                                    .split(' ')[0],
                                obsecure: false,
                                textInputType: TextInputType.emailAddress,
                                errorText: _dateOfMartyrdomErrorText,
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
                                    if (picked != null &&
                                        picked != _dateOfBirth)
                                      setState(() {
                                        _dateOfBirth = picked;
                                      });
                                  },
                                ),
                              ),

                              // AppTextFieldWidget(labelText: 'dier al balah',sectionTitle:'Place of martyrdom/loss' ),
                              //
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 24.w, vertical: 6.h),
                                child: Text(
                                  'Place of martyrdom/loss',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      color: HexColor('#333333'),
                                      fontFamily: 'BreeSerif'),
                                ),
                              ),
                              AppTextFieldWidget(
                                textEditingController: _placeOfMartyrdomTextEditingController,
                                prefixIcon: Icons.location_on_rounded,
                                hintText: 'dier al balah',
                                obsecure: false,
                                textInputType: TextInputType.emailAddress,
                                errorText: _placeOfMartyrdomErrorText,
                              ),

                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 24.w, vertical: 6.h),
                                child: Text(
                                  'Death Certificate',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      color: HexColor('#333333'),
                                      fontFamily: 'BreeSerif'),
                                ),
                              ),
                              AppTextFieldWidget(
                                textEditingController: _deathCertificateTextEditingController,
                                prefixIcon: Icons.person,
                                hintText: 'Upload File',
                                obsecure: false,
                                textInputType: TextInputType.emailAddress,
                                errorText: _deathCertificateErrorText,
                              ),
                              // AppTextFieldWidget(labelText: 'Upload File',sectionTitle: 'Death Certificate',)
                            ],
                          ),
                        )
                      : _selectedStepReqeust == 1
                          ? Container(
                              margin: EdgeInsets.only(bottom: 24.h),
                              child: ListView(
                                // shrinkWrap: true,
                                // physics: NeverScrollableScrollPhysics(),
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 24.w, vertical: 18.h),
                                    child: Text(
                                      'We request some of your information to verify your relationship with the martyr, which will enable us to grant you the authority to manage the martyss page',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: HexColor('#333333')
                                              .withOpacity(0.7),
                                          fontFamily: 'BreeSerif'),
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 24.w, vertical: 6.h),
                                    child: Text(
                                      'Full Your Name',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: HexColor('#333333'),
                                          fontFamily: 'BreeSerif'),
                                    ),
                                  ),
                                  AppTextFieldWidget(
                                    textEditingController: _fullUserNameTextEditingController,
                                    prefixIcon: Icons.person,
                                    hintText: 'Naji atwa hammad abu mousa',
                                    obsecure: false,
                                    textInputType: TextInputType.emailAddress,
                                    errorText: _fullUserNameErrorText,
                                  ),
                                  // AppTextFieldWidget(
                                  //     labelText: 'Naji atwa hammad abu mousa',sectionTitle: 'Full Your Name'),
                                  //
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 24.w, vertical: 6.h),
                                    child: Text(
                                      'Your ID Number',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: HexColor('#333333'),
                                          fontFamily: 'BreeSerif'),
                                    ),
                                  ),
                                  AppTextFieldWidget(
                                    textEditingController: _userIDNumberTextEditingController,
                                    prefixIcon: Icons.person,
                                    hintText: '123 456 789',
                                    obsecure: false,
                                    textInputType: TextInputType.emailAddress,
                                    errorText: _userIDNumberErrorText,
                                  ),
                                  // AppTextFieldWidget(labelText: '*** *** ***',sectionTitle: 'Your ID Number'),
                                  //
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 24.w, vertical: 6.h),
                                    child: Text(
                                      'Your Phone Number',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: HexColor('#333333'),
                                          fontFamily: 'BreeSerif'),
                                    ),
                                  ),
                                  AppTextFieldWidget(
                                    textEditingController: _userPhoneNumberTextEditingController,
                                    prefixIcon: Icons.person,
                                    hintText: '059 5192 140',
                                    obsecure: false,
                                    textInputType: TextInputType.emailAddress,
                                    errorText: _userPhoneNumberErrorText,
                                  ),
                                  // AppTextFieldWidget(labelText: '09/12/1996', sectionTitle:'Your Phone Number' ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 24.w, vertical: 6.h),
                                    child: Text(
                                      'Relative Relation',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: HexColor('#333333'),
                                          fontFamily: 'BreeSerif'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 24.w),
                                    child: Row(
                                      children: [
                                        Container(
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 8.h,
                                                  horizontal: 12.w),
                                              backgroundColor:
                                                  HexColor('#333333'),
                                              minimumSize: Size(165.w, 45.h),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadiusDirectional
                                                          .circular(10.sp)),
                                            ),
                                            child: Text(
                                              'Male',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10.sp,
                                                fontFamily: 'BreeSerif',
                                              ),
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        Container(
                                          // margin: EdgeInsets.symmetric(horizontal: 24.w),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            style: ElevatedButton.styleFrom(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 8.h,
                                                  horizontal: 12.w),
                                              backgroundColor:
                                                  HexColor('#FFFFFF'),
                                              minimumSize: Size(165.w, 45.h),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadiusDirectional
                                                          .circular(10.sp)),
                                            ),
                                            child: Text(
                                              'Female',
                                              style: TextStyle(
                                                color: HexColor('#333333'),
                                                fontSize: 10.sp,
                                                fontFamily: 'BreeSerif',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 24.w, vertical: 6.h),
                                    child: Text(
                                      'Your ID Certificate',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: HexColor('#333333'),
                                          fontFamily: 'BreeSerif'),
                                    ),
                                  ),
                                  AppTextFieldWidget(
                                    textEditingController: _userIDCertificateTextEditingController,
                                    prefixIcon: Icons.person,
                                    hintText: 'Upload File',
                                    obsecure: false,
                                    textInputType: TextInputType.emailAddress,
                                    errorText: _userIDCertificateErrorText,
                                  ),
                                  // AppTextFieldWidget(labelText: 'Upload File',sectionTitle: 'ID Certificate',)
                                ],
                              ),
                            )
                          : Container(
                              margin: EdgeInsets.only(bottom: 24.h),
                              child: ListView(
                                // shrinkWrap: true,
                                // physics: NeverScrollableScrollPhysics(),
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 24.w, vertical: 18.h),
                                    child: Text(
                                      'To ensure the authenticity of the martyrs death and the prevent fraud or the creation of fake pages, we require the information of these identifiers. This data will help us verify the truth of the death and maybe used to contact them as witnesses if legal claims arise.',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: HexColor('#333333')
                                              .withOpacity(0.7),
                                          fontFamily: 'BreeSerif'),
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 24.w, vertical: 6.h),
                                    child: Text(
                                      'Full First Identifiers Name',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: HexColor('#333333'),
                                          fontFamily: 'BreeSerif'),
                                    ),
                                  ),
                                  AppTextFieldWidget(
                                    textEditingController: _fullFirstIdentifiersNameTextEditingController,
                                    prefixIcon: Icons.person,
                                    hintText: 'Naji atwa hammad abu mousa',
                                    obsecure: false,
                                    textInputType: TextInputType.emailAddress,
                                    errorText: _fullFirstIdentifiersNameErrorText,
                                  ),

                                  // AppTextFieldWidget(
                                  //     labelText: 'Naji atwa hammad abu mousa',sectionTitle: 'Full First Identifiers Name'),
                                  //

                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 24.w, vertical: 6.h),
                                    child: Text(
                                      'First Identifiers ID Number',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: HexColor('#333333'),
                                          fontFamily: 'BreeSerif'),
                                    ),
                                  ),
                                  AppTextFieldWidget(
                                    textEditingController: _firstIdentifiersIDNumberTextEditingController,
                                    prefixIcon: Icons.person,
                                    hintText: '123 456 789',
                                    obsecure: false,
                                    textInputType: TextInputType.emailAddress,
                                    errorText: _firstIdentifiersIDNumberErrorText,
                                  ),
                                  // AppTextFieldWidget(labelText: '*** *** ***',sectionTitle:  'First Identifiers ID Number'),
                                  //

                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 24.w, vertical: 6.h),
                                    child: Text(
                                      'First Identifiers Phone Number',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: HexColor('#333333'),
                                          fontFamily: 'BreeSerif'),
                                    ),
                                  ),
                                  AppTextFieldWidget(
                                    textEditingController: _firstIdentifiersPhoneNumberTextEditingController,
                                    prefixIcon: Icons.person,
                                    hintText: '05* *** *** ***',
                                    obsecure: false,
                                    textInputType: TextInputType.emailAddress,
                                    errorText: _firstIdentifiersPhoneNumberErrorText,
                                  ),
                                  // AppTextFieldWidget(labelText: '05* *** *** ***',sectionTitle: 'First Identifiers Phone Number'),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 24.w, vertical: 6.h),
                                    child: Text(
                                      'Gender the First Identifiers',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: HexColor('#333333'),
                                          fontFamily: 'BreeSerif'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 24.w),
                                    child: Row(
                                      children: [
                                        Container(
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 8.h,
                                                  horizontal: 12.w),
                                              backgroundColor:
                                                  HexColor('#333333'),
                                              minimumSize: Size(165.w, 45.h),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadiusDirectional
                                                          .circular(10.sp)),
                                            ),
                                            child: Text(
                                              'Male',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10.sp,
                                                fontFamily: 'BreeSerif',
                                              ),
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        Container(
                                          // margin: EdgeInsets.symmetric(horizontal: 24.w),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            style: ElevatedButton.styleFrom(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 8.h,
                                                  horizontal: 12.w),
                                              backgroundColor:
                                                  HexColor('#FFFFFF'),
                                              minimumSize: Size(165.w, 45.h),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadiusDirectional
                                                          .circular(10.sp)),
                                            ),
                                            child: Text(
                                              'Female',
                                              style: TextStyle(
                                                color: HexColor('#333333'),
                                                fontSize: 10.sp,
                                                fontFamily: 'BreeSerif',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10.h),

                                  // AppTextFieldWidget(labelText: 'Upload File',sectionTitle: 'First Identifiers ID Certificate'),
                                  //
                                  // AppTextFieldWidget(
                                  //     labelText: 'Naji atwa hammad abu mousa',sectionTitle: 'Full Second Identifiers Name'),
                                  //
                                  // AppTextFieldWidget(labelText: '*** *** ***',sectionTitle: 'Second Identifiers ID Number'),
                                  //
                                  // AppTextFieldWidget(labelText: '05* *** *** ***',sectionTitle: 'Second Identifiers Phone Number'),
                                  // Padding(
                                  //   padding: EdgeInsets.symmetric(
                                  //       horizontal: 24.w, vertical: 6.h),
                                  //   child: Text(
                                  //     'Gender the Second Identifiers',
                                  //     style: TextStyle(
                                  //         fontSize: 12.sp,
                                  //         color: HexColor('#333333'),
                                  //         fontFamily: 'BreeSerif'),
                                  //   ),
                                  // ),
                                  // Padding(
                                  //   padding:
                                  //   EdgeInsets.symmetric(horizontal: 24.w),
                                  //   child: Row(
                                  //     children: [
                                  //       Container(
                                  //         child: ElevatedButton(
                                  //           onPressed: () {},
                                  //           style: ElevatedButton.styleFrom(
                                  //             padding: EdgeInsets.symmetric(
                                  //                 vertical: 8.h,
                                  //                 horizontal: 12.w),
                                  //             backgroundColor:
                                  //             HexColor('#333333'),
                                  //             minimumSize: Size(165.w, 45.h),
                                  //             shape: RoundedRectangleBorder(
                                  //                 borderRadius:
                                  //                 BorderRadiusDirectional
                                  //                     .circular(10.sp)),
                                  //           ),
                                  //           child: Text(
                                  //             'Male',
                                  //             style: TextStyle(
                                  //               color: Colors.white,
                                  //               fontSize: 10.sp,
                                  //               fontFamily: 'BreeSerif',
                                  //             ),
                                  //           ),
                                  //         ),
                                  //       ),
                                  //       Spacer(),
                                  //       Container(
                                  //         // margin: EdgeInsets.symmetric(horizontal: 24.w),
                                  //         child: ElevatedButton(
                                  //           onPressed: () {
                                  //             Navigator.pop(context);
                                  //           },
                                  //           style: ElevatedButton.styleFrom(
                                  //             padding: EdgeInsets.symmetric(
                                  //                 vertical: 8.h,
                                  //                 horizontal: 12.w),
                                  //             backgroundColor:
                                  //             HexColor('#FFFFFF'),
                                  //             minimumSize: Size(165.w, 45.h),
                                  //             shape: RoundedRectangleBorder(
                                  //                 borderRadius:
                                  //                 BorderRadiusDirectional
                                  //                     .circular(10.sp)),
                                  //           ),
                                  //           child: Text(
                                  //             'Female',
                                  //             style: TextStyle(
                                  //               color: HexColor('#333333'),
                                  //               fontSize: 10.sp,
                                  //               fontFamily: 'BreeSerif',
                                  //             ),
                                  //           ),
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                  // SizedBox(height: 10.h),

                                  // AppTextFieldWidget(labelText: 'Upload File',sectionTitle: 'Second Identifiers ID Certificate',)
                                ],
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
    if (_deathCertificateTextEditingController.text.isNotEmpty &&
        _placeOfMartyrdomTextEditingController.text.isNotEmpty &&
        _dateOfMartyrdomTextEditingController.text.isNotEmpty &&
        _userPhoneNumberTextEditingController.text.isNotEmpty &&
        _userIDNumberTextEditingController.text.isNotEmpty &&
        _fullUserNameTextEditingController.text.isNotEmpty &&
        _firstIdentifiersPhoneNumberTextEditingController.text.isNotEmpty &&
        _firstIdentifiersIDNumberTextEditingController.text.isNotEmpty &&
        _dateOfBirthMartyrTextEditingController.text.isNotEmpty &&
        _martyrIdNumberTextEditingController.text.isNotEmpty &&
        _fullMartyrNameTextEditingController.text.isNotEmpty &&
        _fullFirstIdentifiersNameTextEditingController.text.isNotEmpty &&
        _userIDCertificateTextEditingController.text.isNotEmpty) {
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
    print('02');
    bool status = await FbFireStoreController().createMartyrRequest(martyrRequestDataModel: martyrReuestDataModel );
    if(status){
        Navigator.pop(context);
    }

    ///showSnackBar(context : context , message : status ? 'Process Success' : 'Process Failed', error : true);
  }

  MartyrRequestDataModel get martyrReuestDataModel {
    MartyrRequestDataModel martyrRequestDataModel =  MartyrRequestDataModel();
    // martyrRequestDataModel.martyrRequestId = uuid.v4();
    martyrRequestDataModel.firstIdentifiersPhoneNumber = _firstIdentifiersPhoneNumberTextEditingController.text;
    martyrRequestDataModel.firstIdentifiersIDNumber = _firstIdentifiersIDNumberTextEditingController.text;
    martyrRequestDataModel.dateOfBirthMartyr = _dateOfBirthMartyrTextEditingController.text;
    martyrRequestDataModel.martyrIdNumber = _martyrIdNumberTextEditingController.text;
    martyrRequestDataModel.fullMartyrName = _fullMartyrNameTextEditingController.text;
    martyrRequestDataModel.deathCertificate = _deathCertificateTextEditingController.text;
    martyrRequestDataModel.placeOfMartyrdom = _placeOfMartyrdomTextEditingController.text;
    martyrRequestDataModel.dateOfMartyrdom = _dateOfMartyrdomTextEditingController.text;
    martyrRequestDataModel.userPhoneNumber = _userPhoneNumberTextEditingController.text;
    martyrRequestDataModel.userIDNumber = _userIDNumberTextEditingController.text;
    martyrRequestDataModel.fullUserName = _fullUserNameTextEditingController.text;
    martyrRequestDataModel.fullFirstIdentifiersName = _fullFirstIdentifiersNameTextEditingController.text;
    martyrRequestDataModel.userIDCertificate = _userIDNumberTextEditingController.text;
    martyrRequestDataModel.status = 'pending';
    martyrRequestDataModel.userDataId = SharedPrefController().userDataId;
    martyrRequestDataModel.martyrRequestId = uuid.v4();

    return martyrRequestDataModel;
  }
}
