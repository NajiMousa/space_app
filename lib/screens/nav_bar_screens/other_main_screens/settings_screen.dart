import 'package:cached_network_image/cached_network_image.dart';
import 'package:difaf_al_wafa_app/prefs/shared_pref_controller.dart';
import 'package:difaf_al_wafa_app/screens/auth_screens/main_auth_screen.dart';
import 'package:difaf_al_wafa_app/screens/widgets/contact_us_widget.dart';
import 'package:difaf_al_wafa_app/screens/widgets/show_log_out_messages_widget.dart';
import 'package:difaf_al_wafa_app/screens/widgets/show_more_action_message_widget.dart';
import 'package:difaf_al_wafa_app/screens/widgets/show_notfication_setting_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import '../../../controllers/firebase_controllers/fb_firestore_controller.dart';
import '../../../models/user_models/user_profile_data_model.dart';
import '../../../providers/theme_provider.dart';
import '../../edit_screens/edit_user_profile_page_screen.dart';
import '../../widgets/choose_language_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}
@override


class _SettingsScreenState extends State<SettingsScreen> {
  bool isClickOnCantactUs = false;
  SharedPrefController sharedPrefController = SharedPrefController();

  UserProfileDataModel _userProfileData = UserProfileDataModel();
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    List<UserProfileDataModel> userData = await FbFireStoreController().getAllUserData();
    print(SharedPrefController().userIdRegistration);
    print('SharedPrefController().userIdRegistration');
    setState(() {
      _userProfileData = userData.firstWhere((user) => user.userIdRegistration == SharedPrefController().userIdRegistration);
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => Navigator.pushNamed(context, '/user_profile_screen'),
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                            top: 30.h, bottom: 25.h, left: 24.w, right: 24.w),
                    padding: sharedPrefController.language == 'en'
                        ? EdgeInsets.only(
                            left: 130.w, right: 24.w, top: 24.h, bottom: 24.h)
                        : EdgeInsets.only(
                            left: 24.w, right: 130.w, top: 24.h, bottom: 24.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.sp),
                        color: HexColor('#333333')),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _userProfileData!.firstName + ' ' + _userProfileData!.lastName,
                                  style: TextStyle(
                                    fontFamily: 'BreeSerif',
                                    fontSize: 14.sp,
                                    // color: HexColor('#FFFFFF'),
                                    color: Colors.white,
                                  ),
                                ),
                                // Text(
                                //   'Mohamed Al-Sayed',
                                //   style: theme.textTheme.bodyText1
                                // ),
                                SizedBox(height: 6.h),
                                Text(
                                  _userProfileData.dateOfBirth,
                                  style: TextStyle(
                                    fontFamily: 'BreeSerif',
                                    fontSize: 9.sp,
                                    color: HexColor('#8C9EA0'),
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (context) {
                                  return EditUserProfilePageScreen(userProfileDataModel: _userProfileData);
                                },));
                              },
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                    'images/editProfile.svg',
                                    width: 20.w,
                                    height: 20.h,
                                    color: HexColor('#3396F9'),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    AppLocalizations.of(context)!.edit,
                                    style: TextStyle(
                                      fontFamily: 'BreeSerif',
                                      fontSize: 9.sp,
                                      color: HexColor('#3396F9'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: sharedPrefController.language == 'en'
                        ? EdgeInsets.only(left: 36.w, top: 20.h)
                        : EdgeInsets.only(right: 36.w, top: 25.h),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    width: 100.w,
                    height: 120.h,
                    child: CachedNetworkImage(
                      imageUrl: _userProfileData.profileImageUrl,
                      width: double.infinity,
                      // height: 370.h,
                      fit: BoxFit.cover,
                      progressIndicatorBuilder: (context, url, downloadProgress) =>
                          CircularProgressIndicator(value: downloadProgress.progress),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 24.w, left: 24.w),
              child: Text(
                AppLocalizations.of(context)!.general,
                style: TextStyle(
                    fontSize: 14.sp,
                    color: HexColor('#333333').withOpacity(0.5),
                    fontFamily: 'BreeSerif'),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'images/darkMode.svg',
                              width: 24.w,
                              height: 24.h,
                              color: HexColor('#333333'),
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              AppLocalizations.of(context)!.darkMode,
                              style: TextStyle(
                                fontFamily: 'BreeSerif',
                                fontSize: 12.sp,
                                color: HexColor('#333333'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Switch(
                        value: themeProvider.themeMode == ThemeMode.dark,
                        onChanged: (value) {
                          themeProvider.toggleTheme(value);
                        },
                        // value: true,
                        // onChanged: (value) {},
                      ),
                    ],
                  ),
                  // SizedBox(height: 9.h),
                  Divider(
                    height: 0.5.h,
                    color: HexColor('#D9D9D9'),
                    thickness: 1.h,
                  ),
                  SizedBox(height: 10.h),
                  InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, '/notifications_screen'),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'images/notificationIcon.svg',
                                width: 24.w,
                                height: 24.h,
                                color: HexColor('#333333'),
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                AppLocalizations.of(context)!.notifications,
                                style: TextStyle(
                                  fontFamily: 'BreeSerif',
                                  fontSize: 12.sp,
                                  color: HexColor('#333333'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _showNotificationDialog();
                          },
                          child: Text(
                            AppLocalizations.of(context)!.on,
                            style: TextStyle(
                              fontFamily: 'BreeSerif',
                              fontSize: 10.sp,
                              color: HexColor('#6699CC'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 9.h),
                  Divider(
                    height: 0.5.h,
                    color: HexColor('#D9D9D9'),
                    thickness: 1.h,
                  ),
                  SizedBox(height: 10.h),
                  InkWell(
                    onTap: () {
                      setState(() {
                        // isClickOnCantactUs = true;
                        _showChangeLangugeDialog();
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'images/language.svg',
                                width: 24.w,
                                height: 24.h,
                                color: HexColor('#333333'),
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                AppLocalizations.of(context)!.changeLanguage,
                                style: TextStyle(
                                  fontFamily: 'BreeSerif',
                                  fontSize: 12.sp,
                                  color: HexColor('#333333'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          AppLocalizations.of(context)!.english,
                          style: TextStyle(
                            fontFamily: 'BreeSerif',
                            fontSize: 10.sp,
                            color: HexColor('#6699CC'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 9.h),
                  Divider(
                    height: 0.5.h,
                    color: HexColor('#D9D9D9'),
                    thickness: 1.h,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 18.h, bottom: 16.h, right: 24.w, left: 24.w),
              child: Text(
                AppLocalizations.of(context)!.accountSetting,
                style: TextStyle(
                    fontSize: 14.sp,
                    color: HexColor('#333333').withOpacity(0.5),
                    fontFamily: 'BreeSerif'),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  // InkWell(
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Container(
                  //         child: Row(
                  //           children: [
                  //             SvgPicture.asset(
                  //               'images/callPhone.svg',
                  //               width: 24.w,
                  //               height: 24.h,
                  //               color: HexColor('#333333'),
                  //             ),
                  //             SizedBox(width: 10.w),
                  //             Text(
                  //               'Change Phone Number',
                  //               style: TextStyle(
                  //                 fontFamily: 'BreeSerif',
                  //                 fontSize: 12.sp,
                  //                 color: HexColor('#333333'),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       SvgPicture.asset(
                  //         'images/arrowForword.svg',
                  //         width: 8.w,
                  //         height: 14.h,
                  //         color: HexColor('#333333'),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(height: 9.h),
                  // Divider(
                  //   height: 0.5.h,
                  //   color: HexColor('#D9D9D9'),
                  //   thickness: 1.h,
                  // ),
                  // SizedBox(height: 10.h),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return MainAuthScreen(
                              selectedIndex: 3,
                            );
                          },
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'images/Password.svg',
                                width: 24.w,
                                height: 24.h,
                                color: HexColor('#333333'),
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                AppLocalizations.of(context)!.changePassword,
                                style: TextStyle(
                                  fontFamily: 'BreeSerif',
                                  fontSize: 12.sp,
                                  color: HexColor('#333333'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SvgPicture.asset(
                          'images/arrowForword.svg',
                          width: 8.w,
                          height: 14.h,
                          color: HexColor('#333333'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 9.h),
                  Divider(
                    height: 0.5.h,
                    color: HexColor('#D9D9D9'),
                    thickness: 1.h,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 18.h, bottom: 16.h, right: 24.w, left: 24.w),
              child: Text(
                AppLocalizations.of(context)!.support,
                style: TextStyle(
                    fontSize: 14.sp,
                    color: HexColor('#333333').withOpacity(0.5),
                    fontFamily: 'BreeSerif'),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _showContactUsDialog();
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'images/ContactUs.svg',
                                width: 24.w,
                                height: 24.h,
                                color: HexColor('#333333'),
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                AppLocalizations.of(context)!.contactUs,
                                style: TextStyle(
                                  fontFamily: 'BreeSerif',
                                  fontSize: 12.sp,
                                  color: HexColor('#333333'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SvgPicture.asset(
                          'images/arrowForword.svg',
                          width: 8.w,
                          height: 14.h,
                          color: HexColor('#333333'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 9.h),
                  Divider(
                    height: 0.5.h,
                    color: HexColor('#D9D9D9'),
                    thickness: 1.h,
                  ),
                  SizedBox(height: 10.h),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/about_us_screen');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'images/AboutUs.svg',
                                width: 24.w,
                                height: 24.h,
                                color: HexColor('#333333'),
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                AppLocalizations.of(context)!.aboutUs,
                                style: TextStyle(
                                  fontFamily: 'BreeSerif',
                                  fontSize: 12.sp,
                                  color: HexColor('#333333'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SvgPicture.asset(
                          'images/arrowForword.svg',
                          width: 8.w,
                          height: 14.h,
                          color: HexColor('#333333'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 9.h),
                  Divider(
                    height: 0.5.h,
                    color: HexColor('#D9D9D9'),
                    thickness: 1.h,
                  ),
                  SizedBox(height: 10.h),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return MainAuthScreen(
                              selectedIndex: 3,
                            );
                          },
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'images/TermsAndConditions.svg',
                                width: 24.w,
                                height: 24.h,
                                color: HexColor('#333333'),
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                AppLocalizations.of(context)!
                                    .termsAndConditions,
                                style: TextStyle(
                                  fontFamily: 'BreeSerif',
                                  fontSize: 12.sp,
                                  color: HexColor('#333333'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SvgPicture.asset(
                          'images/arrowForword.svg',
                          width: 8.w,
                          height: 14.h,
                          color: HexColor('#333333'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 9.h),
                  Divider(
                    height: 0.5.h,
                    color: HexColor('#D9D9D9'),
                    thickness: 1.h,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 18.h, bottom: 16.h, right: 24.w, left: 24.w),
              child: Text(
                AppLocalizations.of(context)!.other,
                style: TextStyle(
                    fontSize: 14.sp,
                    color: HexColor('#333333').withOpacity(0.5),
                    fontFamily: 'BreeSerif'),
              ),
            ),
            InkWell(
              onTap: () {
                _confirmLogOutDialog();
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'images/logout.svg',
                                width: 24.w,
                                height: 24.h,
                                color: HexColor('#333333'),
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                AppLocalizations.of(context)!.logOut,
                                style: TextStyle(
                                  fontFamily: 'BreeSerif',
                                  fontSize: 12.sp,
                                  color: HexColor('#333333'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SvgPicture.asset(
                          'images/arrowForword.svg',
                          width: 8.w,
                          height: 14.h,
                          color: HexColor('#333333'),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          ],
        ),
        //   isClickOnChangeLanguge ? InkWell(
        //     onTap: () {
        //       setState(() {
        //         isClickOnChangeLanguge = false;
        //       });
        //     },
        //     child: Container(
        //       width: double.infinity,
        //       color: HexColor('#333333').withOpacity(0.7),
        //     ),
        //   ): SizedBox(),
        //   isClickOnChangeLanguge ? ShowMoreActionMessageWidget(): SizedBox(),
      ],
    );
  }

  void _showContactUsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          content: ContactUsWidget(),
        );
      },
    );
  }

  void _showChangeLangugeDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          content: ChooseLanguageWidget(),
        );
      },
    );
  }

  void _showNotificationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            content: ShowNotficationSettingWidget());
      },
    );
  }

  void _confirmLogOutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            content: ShowLogOutMessagesWidget());
      },
    );
  }
}
