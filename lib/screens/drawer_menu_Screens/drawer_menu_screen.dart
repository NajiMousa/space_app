import 'package:difaf_al_wafa_app/prefs/shared_pref_controller.dart';
import 'package:difaf_al_wafa_app/screens/primary_screens/main_screen.dart';
import 'package:difaf_al_wafa_app/screens/widgets/contact_us_widget.dart';
import 'package:difaf_al_wafa_app/screens/widgets/show_log_out_messages_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import '../widgets/show_link_page_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class DrawerMenuScreen extends StatefulWidget {
  DrawerMenuScreen({Key? key}) : super(key: key);

  @override
  State<DrawerMenuScreen> createState() => _DrawerMenuScreenState();
}

class _DrawerMenuScreenState extends State<DrawerMenuScreen> {
  bool _showLinkPage = false;
  bool _showLogOutMessage = false;
  bool _showContactUsMessage = false;

  SharedPrefController sharedPrefController =SharedPrefController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: sharedPrefController.language == 'en' ? EdgeInsets.only(right: 100.w) : EdgeInsets.only(left: 100.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: sharedPrefController.language == 'en' ? Radius.circular(50.sp) : Radius.circular(0.sp),
                  bottomRight: sharedPrefController.language == 'en' ? Radius.circular(50.sp) : Radius.circular(0.sp),
              topLeft: sharedPrefController.language == 'en' ? Radius.circular(0.sp) : Radius.circular(50.sp),
              bottomLeft: sharedPrefController.language == 'en' ? Radius.circular(0.sp) : Radius.circular(50.sp),
              ),
              color: HexColor('#333333')),
          child: Padding(
            padding: EdgeInsets.only(
              top: 90.h,
              left: 24.w,
              right: 24.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainScreen(selectedIndex: 0),
                    ),
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.space,
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontFamily: 'BreeSerif'),
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainScreen(selectedIndex: 0),
                    ),
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.commemorateTheMartyrsApp,
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: HexColor('#8C9EA0'),
                        fontFamily: 'BreeSerif'),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Divider(
                  endIndent: 50,
                  thickness: 1,
                  color: Colors.white,
                ),
                SizedBox(height: 12.h),
                InkWell(
                  onTap: () =>
                      Navigator.pushNamed(context, '/user_profile_screen'),
                  child: Row(
                    children: [
                      Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: HexColor('#21CED9'),
                                borderRadius: BorderRadius.circular(56.sp),
                              ),
                              width: 48.w,
                              height: 48.h,
                            ),
                            Image.asset(
                              'images/userIcon.png',
                              width: 44.w,
                              height: 44.w,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mohamed Al-Sayed',
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.white,
                                fontFamily: 'BreeSerif'),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            'Mohamed2003@gmail.com',
                            style: TextStyle(
                                fontSize: 9.sp,
                                color: HexColor('#8C9EA0'),
                                fontFamily: 'BreeSerif'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _showLinkPage = true;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 40.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'images/attachment_icon.svg',
                                width: 16.w,
                                height: 16.h,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              Text(
                                AppLocalizations.of(context)!.linkPages,
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    color: Colors.white,
                                    fontFamily: 'BreeSerif'),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '3 Pages',
                          style: TextStyle(
                              fontSize: 11.sp,
                              color: HexColor('#6699CC'),
                              fontFamily: 'BreeSerif'),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.pushNamed(context, '/saved_screen'),
                  child: Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'images/savedIcon.svg',
                                width: 16.w,
                                height: 16.h,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              Text(
                                AppLocalizations.of(context)!.saved,
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    color: Colors.white,
                                    fontFamily: 'BreeSerif'),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '1025 Item',
                          style: TextStyle(
                              fontSize: 11.sp,
                              color: HexColor('#6699CC'),
                              fontFamily: 'BreeSerif'),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () =>
                      Navigator.pushNamed(context, '/messanger_screen'),
                  child: Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'images/messengerIcon.svg',
                                width: 16.w,
                                height: 16.h,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              Text(
                                AppLocalizations.of(context)!.messanger,
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    color: Colors.white,
                                    fontFamily: 'BreeSerif'),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '5 Unread',
                          style: TextStyle(
                              fontSize: 11.sp,
                              color: HexColor('#6699CC'),
                              fontFamily: 'BreeSerif'),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainScreen(selectedIndex: 6),
                      )),
                  child: Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'images/communityIcon.svg',
                                width: 16.w,
                                height: 16.h,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              Text(
                                AppLocalizations.of(context)!.groups,
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    color: Colors.white,
                                    fontFamily: 'BreeSerif'),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '12 Group Joined',
                          style: TextStyle(
                              fontSize: 11.sp,
                              color: HexColor('#6699CC'),
                              fontFamily: 'BreeSerif'),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainScreen(selectedIndex: 2),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'images/donation_icon.svg',
                                width: 16.w,
                                height: 16.h,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              Text(
                                AppLocalizations.of(context)!.initiatives,
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    color: Colors.white,
                                    fontFamily: 'BreeSerif'),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '3 shared',
                          style: TextStyle(
                              fontSize: 11.sp,
                              color: HexColor('#6699CC'),
                              fontFamily: 'BreeSerif'),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () =>
                      Navigator.pushNamed(context, '/activities_log_screen'),
                  child: Padding(
                    padding: EdgeInsets.only(top: 20.h, bottom: 24.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'images/1608929_history_icon.svg',
                                width: 16.w,
                                height: 16.h,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              Text(
                                AppLocalizations.of(context)!.activitiesHistory,
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    color: Colors.white,
                                    fontFamily: 'BreeSerif'),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '6 New',
                          style: TextStyle(
                              fontSize: 11.sp,
                              color: HexColor('#6699CC'),
                              fontFamily: 'BreeSerif'),
                        ),
                      ],
                    ),
                  ),
                ),
                // Divider(
                //   endIndent: 50,
                //   thickness: 1,
                //   color: Colors.white,
                // ),
                // Padding(
                //   padding: EdgeInsets.only(top: 24.h),
                //   child: Row(
                //     children: [
                //       SvgPicture.asset(
                //         'images/Home.svg',
                //         width: 16.w,
                //         height: 16.h,
                //         color: Colors.white,
                //       ),
                //       SizedBox(width: 12.w,),
                //       Text(
                //         'Home',
                //         style: TextStyle(
                //             fontSize: 13.sp,
                //             color: Colors.white,
                //             fontFamily: 'BreeSerif'),
                //       ),
                //     ],
                //
                //   ),
                // ),
                // Padding(
                //   padding: EdgeInsets.only(top: 20.h),
                //   child: Row(
                //     children: [
                //       SvgPicture.asset(
                //         'images/martyrsIcon.svg',
                //         width: 16.w,
                //         height: 16.h,
                //         color: Colors.white,
                //       ),
                //       SizedBox(width: 12.w,),
                //       Text(
                //         'Martyrs',
                //         style: TextStyle(
                //             fontSize: 13.sp,
                //             color: Colors.white,
                //             fontFamily: 'BreeSerif'),
                //       ),
                //     ],
                //
                //   ),
                // ),
                // Padding(
                //   padding: EdgeInsets.only(top: 24.h),
                //   child: Row(
                //     children: [
                //       SvgPicture.asset(
                //         'images/communityIcon.svg',
                //         width: 16.w,
                //         height: 16.h,
                //         color: Colors.white,
                //       ),
                //       SizedBox(width: 12.w,),
                //       Text(
                //         'Community',
                //         style: TextStyle(
                //             fontSize: 13.sp,
                //             color: Colors.white,
                //             fontFamily: 'BreeSerif'),
                //       ),
                //     ],
                //
                //   ),
                // ),
                // Padding(
                //   padding: EdgeInsets.only(top: 20.h),
                //   child: Row(
                //     children: [
                //       SvgPicture.asset(
                //         'images/resource.svg',
                //         width: 16.w,
                //         height: 16.h,
                //         color: Colors.white,
                //       ),
                //       SizedBox(width: 12.w,),
                //       Text(
                //         'Resources',
                //         style: TextStyle(
                //             fontSize: 13.sp,
                //             color: Colors.white,
                //             fontFamily: 'BreeSerif'),
                //       ),
                //     ],
                //
                //   ),
                // ),
                // Padding(
                //   padding: EdgeInsets.only(top: 24.h, bottom: 24.h),
                //   child: Row(
                //     children: [
                //       SvgPicture.asset(
                //         'images/settingsIcons.svg',
                //         width: 16.w,
                //         height: 16.h,
                //         color: Colors.white,
                //       ),
                //       SizedBox(width: 12.w,),
                //       Text(
                //         'Settings',
                //         style: TextStyle(
                //             fontSize: 13.sp,
                //             color: Colors.white,
                //             fontFamily: 'BreeSerif'),
                //       ),
                //     ],
                //
                //   ),
                // ),
                Divider(
                  endIndent: 50,
                  thickness: 1,
                  color: Colors.white,
                ),
                InkWell(
                  onTap: () {
                    print('object');
                    setState(() {
                      _showContactUsMessage = true;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 24.h),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'images/ContactUs.svg',
                          width: 16.w,
                          height: 16.h,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Text(
                          AppLocalizations.of(context)!.contactUs,
                          style: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.white,
                              fontFamily: 'BreeSerif'),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _showLogOutMessage = true;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'images/logout.svg',
                          width: 16.w,
                          height: 16.h,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Text(
                          AppLocalizations.of(context)!.logOut,
                          style: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.white,
                              fontFamily: 'BreeSerif'),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 168.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        child: SvgPicture.asset(
                          'images/whatsapp_icon.svg',
                          width: 24.w,
                          height: 24.h,
                          color: Colors.white,
                        ),
                      ),
                      InkWell(
                        child: SvgPicture.asset(
                          'images/twitter_bird_icon.svg',
                          width: 24.w,
                          height: 24.h,
                          color: Colors.white,
                        ),
                      ),
                     InkWell(
                       child:  SvgPicture.asset(
                         'images/facebook_icon.svg',
                         width: 24.w,
                         height: 24.h,
                         color: Colors.white,
                       ),
                     )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MainScreen(selectedIndex: 0),
            ),
          ),
          child: Container(
            clipBehavior: Clip.antiAlias,
            margin: sharedPrefController.language == 'en' ? EdgeInsets.only(left: 240.w, top: 110.h) : EdgeInsets.only(right: 240.w, top: 110.h),
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 24.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.sp),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.8),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            width: 92.w,
            height: 92.h,
            child: Image.asset(
              'images/GIU254-20.jpg',
              // width: 60.w,
              // height: 50.h,
              fit: BoxFit.fill,
            ),
          ),
        ),
        _showLinkPage || _showLogOutMessage
            ? InkWell(
                onTap: () {
                  setState(() {
                    _showLinkPage = false;
                    _showLogOutMessage = false;
                  });
                },
                child: Container(
                  width: double.infinity,
                  color: HexColor('#333333').withOpacity(0.5),
                ),
              )
            : SizedBox(),
        _showLinkPage ? ShowLinkPageWidget() : SizedBox(),
        _showLogOutMessage
            ? AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                content: ShowLogOutMessagesWidget())
            : SizedBox(),
        _showContactUsMessage
            ? AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                content: ContactUsWidget())
            : SizedBox(),
      ],
    );
  }
}
