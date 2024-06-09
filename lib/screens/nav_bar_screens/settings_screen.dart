import 'package:difaf_al_wafa_app/screens/auth_screens/main_auth_screen.dart';
import 'package:difaf_al_wafa_app/screens/widgets/choose_language_widget.dart';
import 'package:difaf_al_wafa_app/screens/widgets/contact_us_widget.dart';
import 'package:difaf_al_wafa_app/screens/widgets/show_more_action_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isClickOnCantactUs = false;

  @override
  Widget build(BuildContext context) {
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
                        top: 36.h, bottom: 25.h, left: 24.w, right: 24.w),
                    padding: EdgeInsets.only(
                        left: 130.w, right: 24.w, top: 24.h, bottom: 18.h),
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
                                  'Mohamed Al-Sayed',
                                  style: TextStyle(
                                    fontFamily: 'BreeSerif',
                                    fontSize: 14.sp,
                                    color: HexColor('#FFFFFF'),
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                Text(
                                  'Mohamed2003@gmail.com',
                                  style: TextStyle(
                                    fontFamily: 'BreeSerif',
                                    fontSize: 9.sp,
                                    color: HexColor('#8C9EA0'),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                SvgPicture.asset(
                                  'images/editProfile.svg',
                                  width: 20.w,
                                  height: 20.h,
                                  color: HexColor('#3396F9'),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  'Edit',
                                  style: TextStyle(
                                    fontFamily: 'BreeSerif',
                                    fontSize: 9.sp,
                                    color: HexColor('#3396F9'),
                                  ),
                                ),
                              ],
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
                    margin: EdgeInsets.only(left: 36.w, top: 20.h),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    width: 100.w,
                    height: 120.h,
                    child: Image.asset(
                      'images/AA.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 24.w, left: 24.w),
              child: Text(
                'General',
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
                              'Dark Mode',
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
                        value: true,
                        onChanged: (value) {},
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
                    onTap: () => Navigator.pushNamed(context, '/notifications_screen'),
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
                                'Notifications',
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
                          'On',
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
                                'Change Language',
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
                          'English',
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
                  top: 12.h, bottom: 16.h, right: 24.w, left: 24.w),
              child: Text(
                'Account Setting',
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
                            return MainAuthScreen(selectedIndex: 3,);
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
                                'Change Password',
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
                  top: 12.h, bottom: 16.h, right: 24.w, left: 24.w),
              child: Text(
                'Support',
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
                                'Contact Us',
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
                            return MainAuthScreen(selectedIndex: 2,);
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
                                'images/AboutUs.svg',
                                width: 24.w,
                                height: 24.h,
                                color: HexColor('#333333'),
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                'About Us',
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
                            return MainAuthScreen(selectedIndex: 3,);
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
                                'Terms and Conditions',
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
                  top: 12.h, bottom: 16.h, right: 24.w, left: 24.w),
              child: Text(
                'Other',
                style: TextStyle(
                    fontSize: 14.sp,
                    color: HexColor('#333333').withOpacity(0.5),
                    fontFamily: 'BreeSerif'),
              ),
            ),
            InkWell(
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
                                'Log out',
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
}
