import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class DocumentedEventScreen extends StatefulWidget {
  const DocumentedEventScreen({Key? key}) : super(key: key);

  @override
  State<DocumentedEventScreen> createState() => _DocumentedEventScreenState();
}

class _DocumentedEventScreenState extends State<DocumentedEventScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          padding: EdgeInsets.only(bottom: 90.h),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 10.h, bottom: 12.h, right: 24.w, left: 24.w),
                  child: Text(
                    '28 Aug / 1996 - 2024',
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: HexColor('#333333').withOpacity(0.7),
                        fontFamily: 'BreeSerif'),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Container(
                          alignment: AlignmentDirectional.center,
                          padding: EdgeInsets.symmetric(horizontal: 13.sp),
                          decoration: BoxDecoration(
                              color: HexColor('#8C9EA0'),
                              borderRadius: index == 0
                                  ? BorderRadius.only(
                                      topLeft: Radius.circular(24.sp),
                                    )
                                  : null),
                          // width: 45.w,
                          height: 98.h,
                          child: RotatedBox(
                            quarterTurns: 3, // Rotate 90 degrees
                            child: Text('2024',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: HexColor('#333333'),
                                    fontFamily: 'BreeSerif')),
                          ),
                        ),
                        Container(
                          alignment: AlignmentDirectional.center,
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.sp, vertical: 12.h),
                          decoration: BoxDecoration(
                              color: HexColor('#D6E0E6'),
                              borderRadius: index == 0
                                  ? BorderRadius.only(
                                      topRight: Radius.circular(24.sp),
                                    )
                                  : null),
                          width: 340.w,
                          child: Column(
                            children: [
                              Text(
                                'Honoring the Lives and Sacrifices of Our Martyrs',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: HexColor('#6699CC'),
                                    fontFamily: 'BreeSerif'),
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              Text(
                                'In the face of adversity, the resilience and courage of our community shine through the most. Today....',
                                style: TextStyle(
                                    fontSize: 9.sp,
                                    color: HexColor('#474747'),
                                    fontFamily: 'BreeSerif'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
