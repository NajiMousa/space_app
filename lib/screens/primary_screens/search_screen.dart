import 'package:difaf_al_wafa_app/prefs/shared_pref_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  int _selectedTypeResults = 0;
  bool isEmpty = false;
  SharedPrefController sharedPrefController = SharedPrefController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                scrollDirection: Axis.horizontal,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _selectedTypeResults = 0;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 33.w),
                      child: Column(
                        children: [
                          _selectedTypeResults == 0
                              ? Container(
                            decoration: BoxDecoration(
                              color: HexColor('#6699CC'),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(5.sp),
                                bottomLeft: Radius.circular(5.sp),
                              ),
                            ),
                            width: sharedPrefController.language =='en' ? 53.w : 83.w,
                            height: 5.h,
                          )
                              : SizedBox(height: 4.h,),
                          SizedBox(height: 20.h),
                          Text(
                            AppLocalizations.of(context)!.recent,
                            style: TextStyle(
                                fontSize: 13.sp,
                                color: _selectedTypeResults == 0
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
                        _selectedTypeResults = 1;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 24.w),
                      child: Column(
                        children: [
                          _selectedTypeResults == 1
                              ? Container(
                            decoration: BoxDecoration(
                              color: HexColor('#6699CC'),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(5.sp),
                                bottomLeft: Radius.circular(5.sp),
                              ),
                            ),
                            width: sharedPrefController.language =='en' ? 53.w : 63.w,
                            height: 5.h,
                          )
                              : SizedBox(height: 4.h),
                          SizedBox(height: 20.h),
                          Text(
                            AppLocalizations.of(context)!.people,
                            style: TextStyle(
                                fontSize: 13.sp,
                                color: _selectedTypeResults == 1
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
                        _selectedTypeResults = 2;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 24.w),
                      child: Column(
                        children: [
                          _selectedTypeResults == 2
                              ? Container(
                            decoration: BoxDecoration(
                              color: HexColor('#6699CC'),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(5.sp),
                                bottomLeft: Radius.circular(5.sp),
                              ),
                            ),
                            width: sharedPrefController.language =='en' ? 61.w : 62.w,
                            height: 5.h,
                          )
                              : SizedBox(height: 4.h),
                          SizedBox(height: 20.h),
                          Text(
                            AppLocalizations.of(context)!.martyr,
                            style: TextStyle(
                                fontSize: 13.sp,
                                color: _selectedTypeResults == 2
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
                        _selectedTypeResults = 3;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 24.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _selectedTypeResults == 3
                              ? Container(
                            decoration: BoxDecoration(
                              color: HexColor('#6699CC'),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(5.sp),
                                bottomLeft: Radius.circular(5.sp),
                              ),
                            ),
                            width: 71.w,
                            height: 5.h,
                          )
                              : SizedBox(height: 4.h),
                          SizedBox(height: 20.h),
                          Text(
                            AppLocalizations.of(context)!.initiatives,
                            style: TextStyle(
                                fontSize: 13.sp,
                                color: _selectedTypeResults == 3
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
                        _selectedTypeResults = 4;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 24.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _selectedTypeResults == 4
                              ? Container(
                            decoration: BoxDecoration(
                              color: HexColor('#6699CC'),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(5.sp),
                                bottomLeft: Radius.circular(5.sp),
                              ),
                            ),
                            width: sharedPrefController.language =='en' ? 55.w : 73.w,
                            height: 5.h,
                          )
                              : SizedBox(height: 4.h),
                          SizedBox(height: 20.h),
                          Text(
                            AppLocalizations.of(context)!.groups,
                            style: TextStyle(
                                fontSize: 13.sp,
                                color: _selectedTypeResults == 4
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
                        _selectedTypeResults = 5;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 24.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _selectedTypeResults == 5
                              ? Container(
                            decoration: BoxDecoration(
                              color: HexColor('#6699CC'),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(5.sp),
                                bottomLeft: Radius.circular(5.sp),
                              ),
                            ),
                            width: sharedPrefController.language =='en' ? 104.w : 80.w,
                            height: 5.h,
                          )
                              : SizedBox(height: 4.h),
                          SizedBox(height: 20.h),
                          Text(
                            AppLocalizations.of(context)!.documentEvent,
                            style: TextStyle(
                                fontSize: 13.sp,
                                color: _selectedTypeResults == 5
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
                        Navigator.pop(context);
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 2.w, vertical: 2.h),
                      margin: sharedPrefController.language =='en' ? EdgeInsets.only(left: 24.w) : EdgeInsets.only(right: 0.w),
                      decoration: BoxDecoration(
                        color: Colors.white, // Background color
                        shape: BoxShape.circle, // Make it a circle if desired
                      ),
                      child: Icon(
                        Icons.close,
                        size: 18.sp,
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
            automaticallyImplyLeading: false,
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
                              sharedPrefController.language =='en' ? 'images/arrow_back.svg' : 'images/arrowForword.svg',
                              width: 10.w,
                              height: 16.h,
                              color: HexColor('#333333'),
                            ),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          Text(
                            AppLocalizations.of(context)!.search,
                            style: TextStyle(
                                fontSize: 20.sp,
                                color: HexColor('#333333'),
                                fontFamily: 'BreeSerif'),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(width: 60.w),
                    Container(
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '/new_post_screen');
                            },
                            child: SvgPicture.asset(
                              'images/addPost.svg',
                              width: 16.w,
                              height: 16.h,
                              color: HexColor('#333333'),
                            ),
                          ),
                          SizedBox(width: 24.w),
                          SvgPicture.asset(
                            'images/notificationIcon.svg',
                            width: 20.w,
                            height: 20.h,
                            color: HexColor('#333333'),
                          ),
                          SizedBox(width: 24.w),
                          InkWell(
                            onTap: () {
                              setState(() {
                                Navigator.pushNamed(
                                    context, '/messanger_screen');
                              });
                            },
                            child: SvgPicture.asset(
                              'images/messengerIcon.svg',
                              width: 20.w,
                              height: 20.h,
                              color: HexColor('#333333'),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                  padding: isEmpty ? EdgeInsets.symmetric(horizontal: 56.w): null,
                  children: [
                    isEmpty ? Column(
                      children: [
                        SizedBox(height: 154.h),
                        SvgPicture.asset(
                          'images/Empty-amico.svg',
                          width: 250.w,
                          height: 250.h,
                        ),
                        SizedBox(height: 28.h),
                        Text(
                          // 'There are no possible results for what you are searching for.'
                          AppLocalizations.of(context)!.noPossibleResults,
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: HexColor('#333333'),
                              fontFamily: 'BreeSerif'),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          AppLocalizations.of(context)!.tryTypingOtherWords,
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: HexColor('#333333'),
                              fontFamily: 'BreeSerif'),
                        ),
                        SizedBox(height: 24.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 15.h),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/main_screen');
                            },
                            style: ElevatedButton.styleFrom(
                              // padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
                              minimumSize: Size(double.infinity, 56.h),
                              backgroundColor: HexColor('#333333'),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.sp),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 12.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    'images/Home.svg',
                                    width: 20.w,
                                    height: 20.h,
                                    color: HexColor('#FFFFFF'),
                                  ),
                                  SizedBox(width:12.w),
                                  Text(
                                    AppLocalizations.of(context)!.goToHome,
                                    style: TextStyle(
                                      color: HexColor('#FFFFFF'),
                                      fontSize: 16.sp,
                                      fontFamily: 'BreeSerif',
                                    ),
                                  ),
                                  SizedBox(width: 18.w),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ):
                    Expanded(
                      child: ListView.builder(
                        itemCount: 2,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {},
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: 24.w),
                            leading: Stack(
                              alignment: AlignmentDirectional.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: HexColor('#21CED9'),
                                    borderRadius:
                                    BorderRadius.circular(56.sp),
                                  ),
                                  width: 50.w,
                                  height: 50.h,
                                ),
                                Image.asset(
                                  'images/userIcon.png',
                                  width: 46.w,
                                  height: 46.w,
                                ),
                              ],
                            ),
                            title: Text(
                              'Mohammed Yusef Liked you Photo\'s post.',
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: HexColor('#333333'),
                                  fontFamily: 'BreeSerif'),
                            ),
                            subtitle: Text(
                              '1 day ago',
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  color: HexColor('#8C9EA0'),
                                  fontFamily: 'BreeSerif'),
                            ),
                            trailing: Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.sp),
                                color: HexColor('#333333'),

                              ),
                              width: 40.w,
                              height: 40.h,
                              child: Image.asset(
                                'images/0.png',
                                width: double.infinity,
                                height: 370.h,
                                fit: BoxFit.fill,
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                  ],
                ),
                // _primaryPageModel[_selectedIndex].widget,
              ),
            ],
          ),
          // _selectedDrawer == 8 ? _primaryPageModel[_selectedDrawer].widget : SizedBox()
        ],
      ),
    );
  }
}
