import 'package:difaf_al_wafa_app/prefs/shared_pref_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class SupportGroupsScreen extends StatefulWidget {
  const SupportGroupsScreen({Key? key}) : super(key: key);

  @override
  State<SupportGroupsScreen> createState() => _SupportGroupsScreenState();
}

class _SupportGroupsScreenState extends State<SupportGroupsScreen> {
  SharedPrefController sharedPrefController = SharedPrefController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.only(top: 18.h, bottom: 12.h, right: 24.w, left: 24.w),
          child: Text(
            AppLocalizations.of(context)!.forYou,
            style: TextStyle(
                fontSize: 14.sp,
                color: HexColor('#333333').withOpacity(0.7),
                fontFamily: 'BreeSerif'),
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: double.infinity,
            maxHeight: 120.h,
          ),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, // Number of columns
                crossAxisSpacing: 12.w,
                mainAxisSpacing: 12.h,
                childAspectRatio: 1),
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            padding: EdgeInsets.only(bottom: 18.h, left: 24.w, right: 24.w),
            itemBuilder: (context, index) {
              return Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.sp),
                        color: Colors.red),
                    child: Image.asset(
                      'images/coverImage.png',
                      fit: BoxFit.fill,
                      height: double.infinity,
                    ),
                    clipBehavior: Clip.antiAlias,
                  ),
                  Container(
                    padding: EdgeInsets.all(8.sp),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15.sp),
                          bottomRight: Radius.circular(15.sp)),
                      color: HexColor('#333333').withOpacity(0.4),
                    ),
                    child: Text(
                      'Grief Counseling Circle',
                      style: TextStyle(
                          fontSize: 10.sp,
                          color: HexColor('#FFFFFF'),
                          fontFamily: 'BreeSerif'),
                    ),
                  ),
                ],
              );
              //   Stack(
              //   children: [
              //     Container(
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(15.sp),
              //         color: HexColor('#E0EBF2'),
              //       ),
              //       child: Container(
              //         clipBehavior: Clip.antiAlias,
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(15.sp),
              //           color: HexColor('#E0EBF2'),
              //         ),
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Image.asset(
              //               'images/coverImage.png',
              //               width: double.infinity,
              //               height: 80.h,
              //               fit: BoxFit.fill,
              //             ),
              //             SizedBox(height: 34.h),
              //             Padding(
              //               padding: EdgeInsets.symmetric(horizontal: 16.w),
              //               child: Text(
              //                 'Grief Counseling Circle',
              //                 style: TextStyle(
              //                     fontSize: 13.sp,
              //                     color: HexColor('#6699CC'),
              //                     fontFamily: 'BreeSerif'),
              //               ),
              //             ),
              //             SizedBox(height: 6.h),
              //             Padding(
              //               padding: EdgeInsets.symmetric(horizontal: 16.w),
              //               child: Text(
              //                 'provides a safe space for individ to share their experiences ....',
              //                 style: TextStyle(
              //                     fontSize: 11.sp,
              //                     color: HexColor('#474747'),
              //                     fontFamily: 'BreeSerif'),
              //               ),
              //             ),
              //             SizedBox(height: 6.h),
              //             Padding(
              //               padding: EdgeInsets.symmetric(horizontal: 16.w),
              //               child: Divider(
              //                 height: 0.5.h,
              //                 color: HexColor('#D9D9D9'),
              //                 thickness: 1.h,
              //               ),
              //             ),
              //             SizedBox(height: 6.h),
              //             Padding(
              //               padding: EdgeInsets.symmetric(horizontal: 16.w),
              //               child: Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                 children: [
              //                   Stack(
              //                     children: [
              //                       Container(
              //                         decoration: BoxDecoration(
              //                           borderRadius:
              //                           BorderRadius.circular(50.sp),
              //                         ),
              //                         child: Image.asset(
              //                           'images/userIcon.png',
              //                           width: double.infinity,
              //                           fit: BoxFit.fill,
              //                         ),
              //                         width: 12.w,
              //                         height: 12.h,
              //                         margin: EdgeInsets.only(
              //                           left: 5.h,
              //                         ),
              //                       ),
              //                       Container(
              //                         decoration: BoxDecoration(
              //                           borderRadius:
              //                           BorderRadius.circular(50.sp),
              //                         ),
              //                         child: Image.asset(
              //                           'images/userIcon.png',
              //                           width: double.infinity,
              //                           fit: BoxFit.fill,
              //                         ),
              //                         width: 16.w,
              //                         height: 16.h,
              //                         margin: EdgeInsets.only(
              //                           left: 10.h,
              //                         ),
              //                       ),
              //                       Container(
              //                         decoration: BoxDecoration(
              //                           borderRadius:
              //                           BorderRadius.circular(50.sp),
              //                         ),
              //                         child: Image.asset(
              //                           'images/userIcon.png',
              //                           width: double.infinity,
              //                           fit: BoxFit.fill,
              //                         ),
              //                         width: 16.w,
              //                         height: 16.h,
              //                         margin: EdgeInsets.only(
              //                           left: 5.h,
              //                         ),
              //                       ),
              //                       Container(
              //                         decoration: BoxDecoration(
              //                           borderRadius:
              //                           BorderRadius.circular(50.sp),
              //                         ),
              //                         child: Image.asset(
              //                           'images/userIcon.png',
              //                           width: double.infinity,
              //                           fit: BoxFit.fill,
              //                         ),
              //                         width: 16.w,
              //                         height: 16.h,
              //                         margin: EdgeInsets.only(
              //                           left: 20.h,
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                   Text(
              //                     '3.1K member',
              //                     style: TextStyle(
              //                         fontSize: 10.sp,
              //                         color: HexColor('#3396F9'),
              //                         fontFamily: 'BreeSerif'),
              //                   ),
              //                 ],
              //               ),
              //             )
              //           ],
              //         ),
              //       ),
              //     ),
              //     Padding(
              //       padding:
              //       EdgeInsets.only(top: 56.h, left: 18.w, right: 16.w),
              //       child: Row(
              //         crossAxisAlignment: CrossAxisAlignment.end,
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Container(
              //             decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(50.sp),
              //             ),
              //             child: Image.asset(
              //               'images/userIcon.png',
              //               width: double.infinity,
              //               fit: BoxFit.fill,
              //             ),
              //             width: 48.w,
              //             height: 48.h,
              //             // margin: EdgeInsets.only(top: 35.h, left: 18.w),
              //           ),
              //           Container(
              //             child: Row(
              //               children: [
              //                 ElevatedButton(
              //                   onPressed: () {},
              //                   style: ElevatedButton.styleFrom(
              //                     padding: EdgeInsets.symmetric(
              //                         vertical: 8.h, horizontal: 12.w),
              //                     backgroundColor: HexColor('#333333'),
              //                     minimumSize: Size(100.w, 24.h),
              //                     shape: RoundedRectangleBorder(
              //                         borderRadius:
              //                         BorderRadiusDirectional.circular(
              //                             50.sp)),
              //                   ),
              //                   child: Row(
              //                     mainAxisAlignment: MainAxisAlignment.center,
              //                     children: [
              //                       SvgPicture.asset(
              //                         'images/addPost.svg',
              //                         height: 12.h,
              //                         width: 12.w,
              //                         color: Colors.white,
              //                       ),
              //                       SizedBox(width: 5.w),
              //                       Text(
              //                         'Join Now',
              //                         style: TextStyle(
              //                           color: Colors.white,
              //                           fontSize: 10.sp,
              //                           fontFamily: 'BreeSerif',
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ],
              //       ),
              //     )
              //   ],
              // );
            },
          ),
          // GridView.builder(
          //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 1, // Number of columns
          //       crossAxisSpacing: 12.w,
          //       mainAxisSpacing: 12.h,
          //       childAspectRatio: 193 / 200),
          //   scrollDirection: Axis.horizontal,
          //   itemCount: 5,
          //   padding: EdgeInsets.only(bottom: 18.h, left: 24.w, right: 24.w),
          //   itemBuilder: (context, index) {
          //     return Stack(
          //       children: [
          //         Container(
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(15.sp),
          //             color: HexColor('#E0EBF2'),
          //           ),
          //           child: Container(
          //             clipBehavior: Clip.antiAlias,
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(15.sp),
          //               color: HexColor('#E0EBF2'),
          //             ),
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Image.asset(
          //                   'images/coverImage.png',
          //                   width: double.infinity,
          //                   height: 80.h,
          //                   fit: BoxFit.fill,
          //                 ),
          //                 SizedBox(height: 34.h),
          //                 Padding(
          //                   padding: EdgeInsets.symmetric(horizontal: 16.w),
          //                   child: Text(
          //                     'Grief Counseling Circle',
          //                     style: TextStyle(
          //                         fontSize: 13.sp,
          //                         color: HexColor('#6699CC'),
          //                         fontFamily: 'BreeSerif'),
          //                   ),
          //                 ),
          //                 SizedBox(height: 6.h),
          //                 Padding(
          //                   padding: EdgeInsets.symmetric(horizontal: 16.w),
          //                   child: Text(
          //                     'provides a safe space for individ to share their experiences ....',
          //                     style: TextStyle(
          //                         fontSize: 11.sp,
          //                         color: HexColor('#474747'),
          //                         fontFamily: 'BreeSerif'),
          //                   ),
          //                 ),
          //                 SizedBox(height: 6.h),
          //                 Padding(
          //                   padding: EdgeInsets.symmetric(horizontal: 16.w),
          //                   child: Divider(
          //                     height: 0.5.h,
          //                     color: HexColor('#D9D9D9'),
          //                     thickness: 1.h,
          //                   ),
          //                 ),
          //                 SizedBox(height: 6.h),
          //                 Padding(
          //                   padding: EdgeInsets.symmetric(horizontal: 16.w),
          //                   child: Row(
          //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                     children: [
          //                       Stack(
          //                         children: [
          //                           Container(
          //                             decoration: BoxDecoration(
          //                               borderRadius:
          //                                   BorderRadius.circular(50.sp),
          //                             ),
          //                             child: Image.asset(
          //                               'images/userIcon.png',
          //                               width: double.infinity,
          //                               fit: BoxFit.fill,
          //                             ),
          //                             width: 12.w,
          //                             height: 12.h,
          //                             margin: EdgeInsets.only(
          //                               left: 5.h,
          //                             ),
          //                           ),
          //                           Container(
          //                             decoration: BoxDecoration(
          //                               borderRadius:
          //                                   BorderRadius.circular(50.sp),
          //                             ),
          //                             child: Image.asset(
          //                               'images/userIcon.png',
          //                               width: double.infinity,
          //                               fit: BoxFit.fill,
          //                             ),
          //                             width: 16.w,
          //                             height: 16.h,
          //                             margin: EdgeInsets.only(
          //                               left: 10.h,
          //                             ),
          //                           ),
          //                           Container(
          //                             decoration: BoxDecoration(
          //                               borderRadius:
          //                                   BorderRadius.circular(50.sp),
          //                             ),
          //                             child: Image.asset(
          //                               'images/userIcon.png',
          //                               width: double.infinity,
          //                               fit: BoxFit.fill,
          //                             ),
          //                             width: 16.w,
          //                             height: 16.h,
          //                             margin: EdgeInsets.only(
          //                               left: 5.h,
          //                             ),
          //                           ),
          //                           Container(
          //                             decoration: BoxDecoration(
          //                               borderRadius:
          //                                   BorderRadius.circular(50.sp),
          //                             ),
          //                             child: Image.asset(
          //                               'images/userIcon.png',
          //                               width: double.infinity,
          //                               fit: BoxFit.fill,
          //                             ),
          //                             width: 16.w,
          //                             height: 16.h,
          //                             margin: EdgeInsets.only(
          //                               left: 20.h,
          //                             ),
          //                           ),
          //                         ],
          //                       ),
          //                       Text(
          //                         '3.1K member',
          //                         style: TextStyle(
          //                             fontSize: 10.sp,
          //                             color: HexColor('#3396F9'),
          //                             fontFamily: 'BreeSerif'),
          //                       ),
          //                     ],
          //                   ),
          //                 )
          //               ],
          //             ),
          //           ),
          //         ),
          //         Padding(
          //           padding:
          //               EdgeInsets.only(top: 56.h, left: 18.w, right: 16.w),
          //           child: Row(
          //             crossAxisAlignment: CrossAxisAlignment.end,
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Container(
          //                 decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(50.sp),
          //                 ),
          //                 child: Image.asset(
          //                   'images/userIcon.png',
          //                   width: double.infinity,
          //                   fit: BoxFit.fill,
          //                 ),
          //                 width: 48.w,
          //                 height: 48.h,
          //                 // margin: EdgeInsets.only(top: 35.h, left: 18.w),
          //               ),
          //               Container(
          //                 child: Row(
          //                   children: [
          //                     ElevatedButton(
          //                       onPressed: () {},
          //                       style: ElevatedButton.styleFrom(
          //                         padding: EdgeInsets.symmetric(
          //                             vertical: 8.h, horizontal: 12.w),
          //                         backgroundColor: HexColor('#333333'),
          //                         minimumSize: Size(100.w, 24.h),
          //                         shape: RoundedRectangleBorder(
          //                             borderRadius:
          //                                 BorderRadiusDirectional.circular(
          //                                     50.sp)),
          //                       ),
          //                       child: Row(
          //                         mainAxisAlignment: MainAxisAlignment.center,
          //                         children: [
          //                           SvgPicture.asset(
          //                             'images/addPost.svg',
          //                             height: 12.h,
          //                             width: 12.w,
          //                             color: Colors.white,
          //                           ),
          //                           SizedBox(width: 5.w),
          //                           Text(
          //                             'Join Now',
          //                             style: TextStyle(
          //                               color: Colors.white,
          //                               fontSize: 10.sp,
          //                               fontFamily: 'BreeSerif',
          //                             ),
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             ],
          //           ),
          //         )
          //       ],
          //     );
          //   },
          // ),
        ),
        Padding(
          padding:
              EdgeInsets.only(right: 24.w, left: 24.w, top: 6.h, bottom: 6.h),
          child: Text(
            AppLocalizations.of(context)!.suggestionForYou,
            style: TextStyle(
                fontSize: 14.sp,
                color: HexColor('#333333').withOpacity(0.7),
                fontFamily: 'BreeSerif'),
          ),
        ),
        ListView.builder(
          padding: EdgeInsets.only(bottom: 90.h),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 6.h),
              child: Row(
                children: [
                  Container(
                    margin: sharedPrefController.language == 'en' ? EdgeInsets.only(right: 12.w) : EdgeInsets.only(left: 24.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    clipBehavior: Clip.antiAlias,
                    width: 64.w,
                    height: 64.h,
                    child: Image.asset(
                      'images/backgroundPost.png',
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(height: 10.h,),
                      Text(
                        'Grief Counseling Circle',
                        style: TextStyle(
                            fontSize: 13.sp,
                            color: HexColor('#333333'),
                            fontFamily: 'BreeSerif'),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        '3.1K member - 3+ posts a day',
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: HexColor('#3396F9'),
                            fontFamily: 'BreeSerif'),
                      ),
                      SizedBox(height: 5.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.sp),
                                ),
                                child: Image.asset(
                                  'images/userIcon.png',
                                  width: double.infinity,
                                  fit: BoxFit.fill,
                                ),
                                width: 12.w,
                                height: 12.h,
                                margin: EdgeInsets.only(
                                  left: 5.h,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.sp),
                                ),
                                child: Image.asset(
                                  'images/userIcon.png',
                                  width: double.infinity,
                                  fit: BoxFit.fill,
                                ),
                                width: 12.w,
                                height: 12.h,
                                margin: EdgeInsets.only(
                                  left: 10.h,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.sp),
                                ),
                                child: Image.asset(
                                  'images/userIcon.png',
                                  width: double.infinity,
                                  fit: BoxFit.fill,
                                ),
                                width: 16.w,
                                height: 16.h,
                                margin: EdgeInsets.only(
                                  left: 5.h,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.sp),
                                ),
                                child: Image.asset(
                                  'images/userIcon.png',
                                  width: double.infinity,
                                  fit: BoxFit.fill,
                                ),
                                width: 16.w,
                                height: 16.h,
                                margin: EdgeInsets.only(
                                  left: 20.h,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // Divider(thickness: 7,height: 4,color: Colors.black,)
                    ],
                  ),
                  Spacer(),
                  Container(
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.h, horizontal: 12.w),
                            backgroundColor: HexColor('#333333'),
                            minimumSize: Size(72.w, 24.h),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadiusDirectional.circular(50.sp)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'images/addPost.svg',
                                height: 12.h,
                                width: 12.w,
                                color: Colors.white,
                              ),
                              SizedBox(width: 5.w),
                              Text(
                                AppLocalizations.of(context)!.join,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10.sp,
                                  fontFamily: 'BreeSerif',
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
            //   Padding(
            //   padding:
            //   EdgeInsets.only(top: 6.h, bottom: 12.h, right: 24.w, left: 24.w),
            //   child: Stack(
            //     children: [
            //       Container(
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(15.sp),
            //           color: HexColor('#E0EBF2'),
            //         ),
            //         child: Container(
            //           clipBehavior: Clip.antiAlias,
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(15.sp),
            //             color: HexColor('#E0EBF2'),
            //           ),
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Image.asset(
            //                 'images/coverImage.png',
            //                 width: double.infinity,
            //                 height: 80.h,
            //                 fit: BoxFit.fill,
            //               ),
            //               SizedBox(height: 30.h),
            //               Padding(
            //                 padding: EdgeInsets.symmetric(horizontal: 16.w),
            //                 child: Text(
            //                   'Grief Counseling Circle',
            //                   style: TextStyle(
            //                       fontSize: 13.sp,
            //                       color: HexColor('#6699CC'),
            //                       fontFamily: 'BreeSerif'),
            //                 ),
            //               ),
            //               SizedBox(height: 6.h),
            //               Padding(
            //                 padding: EdgeInsets.symmetric(horizontal: 16.w),
            //                 child: Text(
            //                   'provides a safe space for individuals to share their experiences and feelings about their loss. Professional counselors lead sessions to help ...',
            //                   style: TextStyle(
            //                       fontSize: 11.sp,
            //                       color: HexColor('#474747'),
            //                       fontFamily: 'BreeSerif'),
            //                 ),
            //               ),
            //               SizedBox(height: 6.h),
            //               Padding(
            //                 padding: EdgeInsets.symmetric(horizontal: 16.w),
            //                 child: Divider(
            //                   height: 0.5.h,
            //                   color: HexColor('#D9D9D9'),
            //                   thickness: 1.h,
            //                 ),
            //               ),
            //               SizedBox(height: 6.h),
            //               Padding(
            //                 padding: EdgeInsets.only(right: 16.w, left: 16.w, bottom: 12.h),
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                   children: [
            //                     Stack(
            //                       children: [
            //                         Container(
            //                           decoration: BoxDecoration(
            //                             borderRadius: BorderRadius.circular(50.sp),
            //                           ),
            //                           child: Image.asset(
            //                             'images/userIcon.png',
            //                             width: double.infinity,
            //                             fit: BoxFit.fill,
            //                           ),
            //                           width: 12.w,
            //                           height: 12.h,
            //                           margin: EdgeInsets.only(left: 5.h,),
            //                         ),
            //                         Container(
            //                           decoration: BoxDecoration(
            //                             borderRadius: BorderRadius.circular(50.sp),
            //                           ),
            //                           child: Image.asset(
            //                             'images/userIcon.png',
            //                             width: double.infinity,
            //                             fit: BoxFit.fill,
            //                           ),
            //                           width: 12.w,
            //                           height: 12.h,
            //                           margin: EdgeInsets.only(left: 10.h,),
            //                         ),
            //                         Container(
            //                           decoration: BoxDecoration(
            //                             borderRadius: BorderRadius.circular(50.sp),
            //                           ),
            //                           child: Image.asset(
            //                             'images/userIcon.png',
            //                             width: double.infinity,
            //                             fit: BoxFit.fill,
            //                           ),
            //                           width: 16.w,
            //                           height: 16.h,
            //                           margin: EdgeInsets.only(left: 5.h,),
            //                         ),
            //                         Container(
            //                           decoration: BoxDecoration(
            //                             borderRadius: BorderRadius.circular(50.sp),
            //                           ),
            //                           child: Image.asset(
            //                             'images/userIcon.png',
            //                             width: double.infinity,
            //                             fit: BoxFit.fill,
            //                           ),
            //                           width: 16.w,
            //                           height: 16.h,
            //                           margin: EdgeInsets.only(left: 20.h,),
            //                         ),
            //
            //                       ],
            //                     ),
            //                     Text(
            //                       '3.1K member',
            //                       style: TextStyle(
            //                           fontSize: 10.sp,
            //                           color: HexColor('#3396F9'),
            //                           fontFamily: 'BreeSerif'),
            //                     ),
            //                   ],
            //                 ),
            //               )
            //             ],
            //           ),
            //         ),
            //       ),
            //       Padding(
            //         padding: EdgeInsets.only(top: 56.h, left: 18.w, right: 16.w),
            //         child: Row(
            //           crossAxisAlignment: CrossAxisAlignment.end,
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             Container(
            //               decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(50.sp),
            //               ),
            //               child: Image.asset(
            //                 'images/userIcon.png',
            //                 width: double.infinity,
            //                 fit: BoxFit.fill,
            //               ),
            //               width: 48.w,
            //               height: 48.h,
            //               // margin: EdgeInsets.only(top: 35.h, left: 18.w),
            //             ),
            //             Container(
            //               child: Row(
            //                 children: [
            //                   ElevatedButton(
            //                     onPressed: () {},
            //                     style: ElevatedButton.styleFrom(
            //                       padding: EdgeInsets.symmetric(
            //                           vertical: 8.h, horizontal: 12.w),
            //                       backgroundColor: HexColor('#333333'),
            //                       minimumSize: Size(100.w, 24.h),
            //                       shape: RoundedRectangleBorder(
            //                           borderRadius:
            //                           BorderRadiusDirectional.circular(50.sp)),
            //                     ),
            //                     child: Row(
            //                       mainAxisAlignment: MainAxisAlignment.center,
            //                       children: [
            //                         SvgPicture.asset(
            //                           'images/addPost.svg',
            //                           height: 12.h,
            //                           width: 12.w,
            //                           color: Colors.white,
            //                         ),
            //                         SizedBox(width: 5.w),
            //                         Text(
            //                           'Join Now',
            //                           style: TextStyle(
            //                             color: Colors.white,
            //                             fontSize: 10.sp,
            //                             fontFamily: 'BreeSerif',
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ],
            //         ),
            //       )
            //     ],
            //   ),
            // );
          },
        )
      ],
    );
  }
}
