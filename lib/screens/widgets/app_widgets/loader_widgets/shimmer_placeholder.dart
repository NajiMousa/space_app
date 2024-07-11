import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        enabled: true,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                // decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.sp),),
                // margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.w),
                width: double.infinity,
                height: 800.h,
                color: Colors.white,
              ),

            ],
          ),
          // physics: NeverScrollableScrollPhysics(),
          // child: ListView.builder(
          //   shrinkWrap: true,
          //   physics: NeverScrollableScrollPhysics(),
          //   itemCount: 10,
          //   itemBuilder: (context, index) {
          //   return
          // },)
        )
    );
    //   Shimmer.fromColors(
    //   baseColor: Colors.grey[300]!,
    //   highlightColor: Colors.grey[100]!,
    //   child: Container(
    //     width: double.infinity,
    //     height: 200.0,
    //     color: Colors.white,
    //   ),
    // );
  }
}