
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../widgets/app_text_field_widget.dart';
class NewMartyrsProfileScreen extends StatefulWidget {
  const NewMartyrsProfileScreen({Key? key}) : super(key: key);

  @override
  State<NewMartyrsProfileScreen> createState() =>
      _NewMartyrsProfileScreenState();
}

class _NewMartyrsProfileScreenState extends State<NewMartyrsProfileScreen> {
  int _selectedStepReqeust = 0;

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
                        onPressed: () {},
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
                              AppTextFieldWidget(
                                  labelText: 'Naji atwa hammad abu mousa',sectionTitle:'Full Martyr Name' ),
                              AppTextFieldWidget(labelText: '*** *** ***',sectionTitle: 'Martyr ID Number'),

                              AppTextFieldWidget(labelText:'Martyr Date of Birth',sectionTitle: '09/12/1996'),
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

                              AppTextFieldWidget(labelText: 'Date of martyrdom/loss',sectionTitle: '22/05/2024'),

                              AppTextFieldWidget(labelText: 'dier al balah',sectionTitle:'Place of martyrdom/loss' ),

                              AppTextFieldWidget(labelText: 'Upload File',sectionTitle: 'Death Certificate',)
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

                                  AppTextFieldWidget(
                                      labelText: 'Naji atwa hammad abu mousa',sectionTitle: 'Full Your Name'),

                                  AppTextFieldWidget(labelText: '*** *** ***',sectionTitle: 'Your ID Number'),

                                  AppTextFieldWidget(labelText: '09/12/1996', sectionTitle:'Your Phone Number' ),
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

                                  AppTextFieldWidget(labelText: 'Upload File',sectionTitle: 'ID Certificate',)
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


                                  AppTextFieldWidget(
                                      labelText: 'Naji atwa hammad abu mousa',sectionTitle: 'Full First Identifiers Name'),

                                  AppTextFieldWidget(labelText: '*** *** ***',sectionTitle:  'First Identifiers ID Number'),

                                  AppTextFieldWidget(labelText: '05* *** *** ***',sectionTitle: 'First Identifiers Phone Number'),
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

                                  AppTextFieldWidget(labelText: 'Upload File',sectionTitle: 'First Identifiers ID Certificate'),

                                  AppTextFieldWidget(
                                      labelText: 'Naji atwa hammad abu mousa',sectionTitle: 'Full Second Identifiers Name'),

                                  AppTextFieldWidget(labelText: '*** *** ***',sectionTitle: 'Second Identifiers ID Number'),

                                  AppTextFieldWidget(labelText: '05* *** *** ***',sectionTitle: 'Second Identifiers Phone Number'),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 24.w, vertical: 6.h),
                                    child: Text(
                                      'Gender the Second Identifiers',
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

                                  AppTextFieldWidget(labelText: 'Upload File',sectionTitle: 'Second Identifiers ID Certificate',)
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
}
