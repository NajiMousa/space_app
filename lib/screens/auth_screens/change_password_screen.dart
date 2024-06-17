import 'package:difaf_al_wafa_app/screens/primary_screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../widgets/app_text_field_widget.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFieldWidget(labelText: 'Old Password',sectionTitle: 'Old Password'),
        AppTextFieldWidget(labelText: 'New Password',sectionTitle: 'New Password'),
        AppTextFieldWidget(labelText: 'Confirm New Password',sectionTitle: 'Confirm New Password'),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 32.h),
          child: ElevatedButton(
            onPressed: () {
              // Navigator.pushReplacementNamed(context, '/main_screen');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return MainScreen(selectedIndex: 0,);
                  },
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              // padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
              minimumSize: Size(double.infinity, 56.h),
              backgroundColor: HexColor('#333333'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.sp),
              ),
            ),
            child: Text(
              'Save Password',
              style: TextStyle(
                color: HexColor('#FFFFFF'),
                fontSize: 16.sp,
                fontFamily: 'BreeSerif',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
