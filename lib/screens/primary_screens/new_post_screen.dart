import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class NewPostScreen extends StatefulWidget {
  const NewPostScreen({Key? key}) : super(key: key);

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  int _selectedTypeMessanger = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#333333"),
      bottomNavigationBar: Container(
        height: 72.0, // Set the height here
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  _selectedTypeMessanger = 0;
                });
              },
              child: Padding(
                padding: EdgeInsets.only(left: 33.w),
                child: Column(
                  children: [
                    _selectedTypeMessanger == 0
                        ? Container(
                            decoration: BoxDecoration(
                              color: HexColor('#6699CC'),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(5.sp),
                                bottomLeft: Radius.circular(5.sp),
                              ),
                            ),
                            width: 29.w,
                            height: 5.h,
                          )
                        : SizedBox(
                            height: 5.h,
                          ),
                    SizedBox(height: 20.h),
                    Text(
                      'All',
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: _selectedTypeMessanger == 0
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
                  _selectedTypeMessanger = 1;
                });
              },
              child: Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: Column(
                  children: [
                    _selectedTypeMessanger == 1
                        ? Container(
                            decoration: BoxDecoration(
                              color: HexColor('#6699CC'),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(5.sp),
                                bottomLeft: Radius.circular(5.sp),
                              ),
                            ),
                            width: 52.w,
                            height: 5.h,
                          )
                        : SizedBox(
                            height: 5.h,
                          ),
                    SizedBox(height: 20.h),
                    Text(
                      'Text',
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: _selectedTypeMessanger == 1
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
                  _selectedTypeMessanger = 2;
                });
              },
              child: Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: Column(
                  children: [
                    _selectedTypeMessanger == 2
                        ? Container(
                            decoration: BoxDecoration(
                              color: HexColor('#6699CC'),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(5.sp),
                                bottomLeft: Radius.circular(5.sp),
                              ),
                            ),
                            width: 55.w,
                            height: 5.h,
                          )
                        : SizedBox(
                            height: 5.h,
                          ),
                    SizedBox(height: 20.h),
                    Text(
                      'Photos',
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: _selectedTypeMessanger == 2
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
                  _selectedTypeMessanger = 3;
                });
              },
              child: Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _selectedTypeMessanger == 3
                        ? Container(
                            decoration: BoxDecoration(
                              color: HexColor('#6699CC'),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(5.sp),
                                bottomLeft: Radius.circular(5.sp),
                              ),
                            ),
                            width: 43.w,
                            height: 5.h,
                          )
                        : SizedBox(
                            height: 5.h,
                          ),
                    SizedBox(height: 20.h),
                    Text(
                      'Video',
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: _selectedTypeMessanger == 3
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
                  _selectedTypeMessanger = 4;
                });
              },
              child: Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _selectedTypeMessanger == 4
                        ? Container(
                            decoration: BoxDecoration(
                              color: HexColor('#6699CC'),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(5.sp),
                                bottomLeft: Radius.circular(5.sp),
                              ),
                            ),
                            width: 44.w,
                            height: 5.h,
                          )
                        : SizedBox(
                            height: 5.h,
                          ),
                    SizedBox(height: 20.h),
                    Text(
                      'Audio',
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: _selectedTypeMessanger == 4
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
                  // _selectedIndex = 0;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                margin: EdgeInsets.only(left: 24.w),
                decoration: BoxDecoration(
                  color: Colors.white, // Background color
                  shape: BoxShape.circle, // Make it a circle if desired
                ),
                child: Icon(
                  Icons.add,
                  size: 24.sp,
                ),
              ),
            ),
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
                            'New Post',
                            style: TextStyle(
                                fontSize: 20.sp,
                                color: HexColor('#333333'),
                                fontFamily: 'BreeSerif'),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(width: 60.w),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.w),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: 4.h, horizontal: 18.w),
                          backgroundColor: HexColor('#333333'),
                          minimumSize: Size(57.w, 32.h),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadiusDirectional.circular(50.sp)),
                        ),
                        child: Text(
                          'Post/all',
                          style: TextStyle(
                            color: HexColor('#FFFFFF'),
                            fontSize: 12.sp,
                            fontFamily: 'BreeSerif',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
      body: Stack(
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
            child: Column(
              children: [
                SizedBox(height: 18.h),
                Expanded(
                  child: ListView(
                    // reverse: true,
                    // padding:
                    //     EdgeInsets.only(bottom: 30.h, right: 24.w, left: 24.w),
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 24.w, left: 24.w),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left: 12.w),
                                alignment: AlignmentDirectional.center,
                                child: TextField(
                                  style: TextStyle(
                                    fontFamily: 'BreeSerif',
                                    fontSize: 13.sp,
                                    color: HexColor('#8C9EA0'),
                                  ),
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'write your massage',
                                    enabledBorder: getBorder(),
                                    focusedBorder: getBorder(),
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.only(
                                          bottom: 70.h, right: 12.w),
                                      child: Image.asset(
                                        'images/userIcon.png',
                                        width: 40.w,
                                        height: 40.w,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 120.h),
                      Padding(
                        padding: EdgeInsets.only(right: 24.w, left: 24.w),
                        child: Row(
                          children: [
                            Text(
                              'Other Action',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: HexColor('#D9D9D9'),
                                  fontFamily: 'BreeSerif'),
                            ),
                            Divider(
                              height: 0.5.h,
                              color: HexColor('#D9D9D9'),
                              thickness: 5.h,
                              indent: 95.w,
                              endIndent: 24.w,
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                          child: Padding(
                        padding: EdgeInsets.only(left: 38.w, top: 18.h,right: 24.w),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'images/tagFriends.svg',
                              width: 20.w,
                              height: 20.h,
                              color: HexColor('#45BD62'),
                            ),
                            SizedBox(width: 12.w),
                            Text(
                              'Tag friends',
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: HexColor('#45BD62'),
                                  fontFamily: 'BreeSerif'),
                            ),
                          ],
                        ),
                      )),
                      InkWell(
                          child: Padding(
                        padding: EdgeInsets.only(left: 38.w, top: 18.h,right: 24.w),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'images/face_smile_wink_icon.svg',
                              width: 20.w,
                              height: 20.h,
                              color: HexColor('#F7B928'),
                            ),
                            SizedBox(width: 12.w),
                            Text(
                              'Add Feeling',
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: HexColor('#F7B928'),
                                  fontFamily: 'BreeSerif'),
                            ),
                          ],
                        ),
                      )),
                      InkWell(
                          child: Padding(
                        padding: EdgeInsets.only(left: 38.w, top: 18.h,right: 24.w),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'images/poll_filled_icon.svg',
                              width: 20.w,
                              height: 20.h,
                              color: HexColor('#2AB8A4'),
                            ),
                            SizedBox(width: 12.w),
                            Text(
                              'Add Questions',
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: HexColor('#2AB8A4'),
                                  fontFamily: 'BreeSerif'),
                            ),
                          ],
                        ),
                      )),
                      InkWell(
                          child: Padding(
                        padding: EdgeInsets.only(left: 38.w, top: 18.h,right: 24.w),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'images/attachment_icon.svg',
                              width: 20.w,
                              height: 20.h,
                              color: HexColor('#00A5F4'),
                            ),
                            SizedBox(width: 12.w),
                            Text(
                              'Add File',
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: HexColor('#00A5F4'),
                                  fontFamily: 'BreeSerif'),
                            ),
                          ],
                        ),
                      )),
                      InkWell(
                          child: Padding(
                        padding: EdgeInsets.only(left: 38.w, top: 18.h,right: 24.w),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'images/location_country_icon.svg',
                              width: 20.w,
                              height: 20.h,
                              color: HexColor('#F5533D'),
                            ),
                            SizedBox(width: 12.w),
                            Text(
                              'Add Event',
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: HexColor('#F5533D'),
                                  fontFamily: 'BreeSerif'),
                            ),
                          ],
                        ),
                      )),
                      InkWell(
                          child: Padding(
                        padding: EdgeInsets.only(
                            left: 38.w, top: 18.h, bottom: 24.h,right: 24.w),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'images/gps_location_icon.svg',
                              width: 20.w,
                              height: 20.h,
                              color: HexColor('#F02849'),
                            ),
                            SizedBox(width: 12.w),
                            Text(
                              'Add Location',
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: HexColor('#F02849'),
                                  fontFamily: 'BreeSerif'),
                            ),
                          ],
                        ),
                      )),
                      Padding(
                        padding: EdgeInsets.only(right: 24.w, left: 24.w),
                        child: Row(
                          children: [
                            Text(
                              'Camera& Your Photos',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: HexColor('#D9D9D9'),
                                  fontFamily: 'BreeSerif'),
                            ),
                            Spacer(),
                            Container(
                              child: Row(
                                children: [
                                  Text(
                                    'see All',
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        color: HexColor('#6699CC'),
                                        fontFamily: 'BreeSerif'),
                                  ),
                                  SizedBox(width: 2.w),
                                  SvgPicture.asset(
                                    'images/arrowForword.svg',
                                    height: 10.h,
                                    width: 10.w,
                                    color: HexColor('#6699CC'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 12.h),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: double.infinity,
                          maxHeight: 80.h,
                        ),
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1, // Number of columns
                                  crossAxisSpacing: 12.w,
                                  mainAxisSpacing: 12.h,
                                  childAspectRatio: 52 / 48),
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.only(left: 24.w, right: 24.w),
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return Container(
                                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.sp),
                                  color: HexColor('#D6E0E6'),
                                ),
                                // height: 12.h,
                                child: SvgPicture.asset(
                                  'images/camera_icon.svg',
                                  width: 24.w,
                                  height: 24.h,
                                  color: HexColor('#333333'),
                                ),
                              );
                            } else {
                              return Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.sp),
                                  color: HexColor('#FFFFFF'),
                                ),
                                // height: 12.h,
                                child: Image.asset(
                                  'images/backgroundPost.png',
                                  fit: BoxFit.fill,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder getBorder({Color borderColor = Colors.white}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: borderColor,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(50),
    );
  }
}
