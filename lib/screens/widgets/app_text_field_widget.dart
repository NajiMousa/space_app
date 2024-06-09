import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class AppTextFieldWidget extends StatelessWidget {
  AppTextFieldWidget({Key? key, required this.labelText}) : super(key: key);

  String labelText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.symmetric(horizontal: 30.w, vertical: 6.h),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
          filled: true,
          fillColor: Colors.white,
          labelText: labelText,
          labelStyle: TextStyle(
            fontFamily: 'BreeSerif',
            fontSize: 12.sp,
            color: HexColor('#999999'),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.sp),
            borderSide: BorderSide(
                color: HexColor('#333333')
            ),
          ),
        ),
      ),
    );
  }
}
