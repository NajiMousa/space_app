import 'package:difaf_al_wafa_app/screens/widgets/app_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late TextEditingController _emailTextEditingController;
  late TextEditingController _passwordTextEditingController;
  String? _emailErrorText;
  String? _passwordErrorText;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: 6.h,horizontal: 24.w),
          child: Text(
            AppLocalizations.of(context)!.email,
            style: TextStyle(
                fontSize: 12.sp,
                color: HexColor('#333333'),
                fontFamily: 'BreeSerif'),
          ),
        ),
        AppTextFieldWidget(
          textEditingController: _emailTextEditingController,
          prefixIcon: Icons.email,
          hintText: 'naji@gmail.com',
          obsecure: false,
          textInputType: TextInputType.emailAddress,
          errorText: _emailErrorText,
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: 6.h,horizontal: 24.w),
          child: Text(
            AppLocalizations.of(context)!.password,
            style: TextStyle(
                fontSize: 12.sp,
                color: HexColor('#333333'),
                fontFamily: 'BreeSerif'),
          ),
        ),
        AppTextFieldWidget(
          textEditingController: _passwordTextEditingController,
          prefixIcon: Icons.lock,
          hintText: '**** **** *****',
          obsecure: true,
          textInputType: TextInputType.phone,
          errorText: _passwordErrorText,
          suffixIcon: Icons.hide_source,
        ),
        SizedBox(height: 6.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Text(
            AppLocalizations.of(context)!.didYouForgetYourPassword,
            style: TextStyle(
              color: HexColor('#559FEA'),
              fontSize: 11.sp,
              fontFamily: 'BreeSerif',
            ),
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              // padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
              minimumSize: Size(double.infinity, 56.h),
              backgroundColor: HexColor('#333333'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.sp),
              ),
            ),
            child: Text(
              AppLocalizations.of(context)!.logIn,
              style: TextStyle(
                color: HexColor('#FFFFFF'),
                fontSize: 16.sp,
                fontFamily: 'BreeSerif',
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Divider(thickness: 5, indent: 30.w, endIndent: 30.w),
            Text(
              AppLocalizations.of(context)!.or,
              style: TextStyle(
                color: HexColor('#559FEA'),
                fontSize: 11.sp,
                fontFamily: 'BreeSerif',
              ),
            ),
            Divider(thickness: 2, indent: 30.w, endIndent: 30.w),
          ],
        ),
        SizedBox(height: 18.h),
        Padding(
          padding: EdgeInsets.only(right: 100.w, left: 100.w, bottom: 30.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                child: SvgPicture.asset(
                  'images/google_g_icon.svg',
                  width: 24.w,
                  height: 24.h,
                  color: HexColor('#333333'),
                ),
              ),
              InkWell(
                child: SvgPicture.asset(
                  'images/twitter_bird_icon.svg',
                  width: 24.w,
                  height: 24.h,
                  color: HexColor('#333333'),
                ),
              ),
              InkWell(
                child: SvgPicture.asset(
                  'images/facebook_logo_icon.svg',
                  width: 24.w,
                  height: 24.h,
                  color: HexColor('#333333'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

// Solid - Single Responsibility
//   void performLogin() {
//     if (checkData()) {
//       login();
//     }
//   }
//
//   bool checkData() {
//     if (_emailTextEditingController.text.isNotEmpty &&
//         _passwordTextEditingController.text.isNotEmpty) {
//       checkErrors();
//       return true;
//     }
//     checkErrors();
//     showMessage(message: 'Enter require Field', error: true);
//     return false;
//   }
//
//   void checkErrors() {
//     setState(() {
//       _emailErrorText = _emailTextEditingController.text.isEmpty
//           ? 'Enter Email Address'
//           : null;
//       _passwordErrorText =
//       _passwordTextEditingController.text.isEmpty ? 'Enter Password' : null;
//     });
//   }
//
//   void login() {
//     showMessage(message: 'Login successfully');
//     Future.delayed(
//       Duration(seconds: 3),
//           () {
//         Navigator.pushReplacementNamed(context, '/mainScreen');
//       },
//     );
//   }
//
//   void showMessage({required String message, bool error = false}) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         backgroundColor: error ? Colors.red : Colors.green,
//         duration: Duration(seconds: 1),
//         behavior: SnackBarBehavior.floating,
//         margin: EdgeInsetsDirectional.only(end: 30, start: 30, bottom: 20),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//         action: SnackBarAction(
//             onPressed: () {}, label: 'Done', textColor: Colors.red),
//         onVisible: () => print('onVisible'),
//         elevation: 0,
//       ),
//     );
//   }
// }
//
}
