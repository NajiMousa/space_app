import 'package:difaf_al_wafa_app/screens/auth_screens/change_password_screen.dart';
import 'package:difaf_al_wafa_app/screens/auth_screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../model/auth_page_model.dart';
import 'otp_code_screen.dart';
import 'sing_up_screen.dart';
import 'terms_conditions_screen.dart';

class MainAuthScreen extends StatefulWidget {
   MainAuthScreen({Key? key, required this.selectedIndex}) : super(key: key);

   int selectedIndex = 0;

  @override
  State<MainAuthScreen> createState() => _MainAuthScreenState();
}

class _MainAuthScreenState extends State<MainAuthScreen> {

  final List<AuthPageModel> _authPageModel = <AuthPageModel>[
    AuthPageModel(
        title: 'Sign up',
        widget: SingUpScreen(),
        Pik: 'images/login-amico.svg'), //00
    AuthPageModel(
        title: 'Log in',
        widget: LoginScreen(),
        Pik: 'images/AAlogin.svg'), //01
    AuthPageModel(
        title: 'Terms and Conditions',
        widget: TermsConditionsScreen(),
        Pik: 'images/login-amico.svg'), //02
    AuthPageModel(
        title: 'Change Your Password',
        widget: ChangePasswordScreen(),
        Pik: 'images/Authentication.svg'), //03
    AuthPageModel(
        title: 'Enter OTP code',
        widget: OtpCodeScreen(),
        Pik: 'images/Enter_OTP-pana.svg'), //04
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            flexibleSpace: Center(
              child: Padding(
                padding: EdgeInsets.only(right: 24.w, left: 24.w, top: 40.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // TODO: Menu Button
                    InkWell(
                      child: Container(
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'images/arrow_back.svg',
                              width: 10.w,
                              height: 16.h,
                              color: HexColor('#333333'),
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            // Screen Name
                            Text(
                              _authPageModel[widget.selectedIndex].title,
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  color: HexColor('#333333'),
                                  fontFamily: 'BreeSerif'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
      backgroundColor: HexColor("#333333"),
      bottomNavigationBar: Container(
        height: 72.0, // Set the height here
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            // todo: SingUp Page
            InkWell(
              onTap: () {
                setState(() {
                  widget.selectedIndex = 0;
                });
              },
              child: Padding(
                padding: EdgeInsets.only(left: 33.w),
                child: Column(
                  children: [
                    widget.selectedIndex == 0
                        ? Container(
                            decoration: BoxDecoration(
                              color: HexColor('#6699CC'),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(5.sp),
                                bottomLeft: Radius.circular(5.sp),
                              ),
                            ),
                            width: 54.w,
                            height: 5.h,
                          )
                        : SizedBox(
                            height: 5.h,
                          ),
                    SizedBox(height: 20.h),
                    Text(
                      'Sing Up',
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: widget.selectedIndex == 0
                              ? HexColor('#6699CC')
                              : HexColor('#8C9EA0'),
                          fontFamily: 'BreeSerif'),
                    ),
                  ],
                ),
              ),
            ),
            // todo: Login Page
            InkWell(
              onTap: () {
                setState(() {
                  widget.selectedIndex = 1;
                });
              },
              child: Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: Column(
                  children: [
                    widget.selectedIndex == 1
                        ? Container(
                            decoration: BoxDecoration(
                              color: HexColor('#6699CC'),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(5.sp),
                                bottomLeft: Radius.circular(5.sp),
                              ),
                            ),
                            width: 48.w,
                            height: 5.h,
                          )
                        : SizedBox(
                            height: 5.h,
                          ),
                    SizedBox(height: 20.h),
                    Text(
                      'Log in',
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: widget.selectedIndex == 1
                              ? HexColor('#6699CC')
                              : HexColor('#8C9EA0'),
                          fontFamily: 'BreeSerif'),
                    ),
                  ],
                ),
              ),
            ),
            // todo: Terms and Conditions Page
            InkWell(
              onTap: () {
                setState(() {
                  widget.selectedIndex = 2;
                });
              },
              child: Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: Column(
                  children: [
                    widget.selectedIndex == 2
                        ? Container(
                            decoration: BoxDecoration(
                              color: HexColor('#6699CC'),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(5.sp),
                                bottomLeft: Radius.circular(5.sp),
                              ),
                            ),
                            width: 133.w,
                            height: 5.h,
                          )
                        : SizedBox(
                            height: 5.h,
                          ),
                    SizedBox(height: 20.h),
                    Text(
                      'Terms and Conditions',
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: widget.selectedIndex == 2
                              ? HexColor('#6699CC')
                              : HexColor('#8C9EA0'),
                          fontFamily: 'BreeSerif'),
                    ),
                  ],
                ),
              ),
            ),
            // todo: Change Password Page
            InkWell(
              onTap: () {
                setState(() {
                  widget.selectedIndex = 3;
                });
              },
              child: Padding(
                padding: EdgeInsets.only(left: 24.w, right: 32.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    widget.selectedIndex == 3
                        ? Container(
                            decoration: BoxDecoration(
                              color: HexColor('#6699CC'),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(5.sp),
                                bottomLeft: Radius.circular(5.sp),
                              ),
                            ),
                            width: 104.w,
                            height: 5.h,
                          )
                        : SizedBox(
                            height: 5.h,
                          ),
                    SizedBox(height: 20.h),
                    Text(
                      'Change Password',
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: widget.selectedIndex == 3
                              ? HexColor('#6699CC')
                              : HexColor('#8C9EA0'),
                          fontFamily: 'BreeSerif'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        // alignment: Alignment.topLeft,
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
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 12.h),
                    child: widget.selectedIndex == 2
                        ? SizedBox()
                        : SvgPicture.asset(
                            height: widget.selectedIndex == 0 ? 230.h : 270.h,
                            _authPageModel[widget.selectedIndex].Pik,
                          ),
                  ),
                ),
                widget.selectedIndex == 0 || widget.selectedIndex == 1
                    ? SizedBox(height: 15.h)
                    : SizedBox(height: 30.h,),
                _authPageModel[widget.selectedIndex].widget,
              ],
            ),
          ),
        ],
      ),
    );
  }
}