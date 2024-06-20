import 'package:difaf_al_wafa_app/prefs/shared_pref_controller.dart';
import 'package:difaf_al_wafa_app/providers/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';


class ChooseLanguageWidget extends StatelessWidget {
  ChooseLanguageWidget({Key? key}) : super(key: key);
  // final SharedPrefController sharedPrefController = SharedPrefController();

  String _selectedLanguage = 'English'; // Default selected language
  List<String> _languages = ['English', 'Arabic'];


  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    return Container(
      // margin: EdgeInsets.only(top: 550.h),
      width: 360.w,
      height: 180.h,
      // decoration: BoxDecoration(
      //     borderRadius: BorderRadius.only(
      //       topLeft: Radius.circular(24.sp),
      //       topRight: Radius.circular(24.sp),
      //     ),
      //     color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // padding: EdgeInsets.symmetric(horizontal: 32.w),
        children: [
          SizedBox(height: 12.h),
          Row(
            children: [
              Text(
                AppLocalizations.of(context)!.chooseTheLanguageYouWant,
                style: TextStyle(
                    fontSize: 13.sp,
                    color: HexColor('#333333').withOpacity(0.7),
                    fontFamily: 'BreeSerif'),
              ),
              Spacer(),
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  margin: EdgeInsets.only(right: 4.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.sp),
                    color: HexColor('#D6E0E6'),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
                  width: 24.w,
                  height: 24.h,
                  child: SvgPicture.asset(
                    'images/close_round_icon.svg',
                    width: 12.w,
                    height: 12.h,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: HexColor('#333333'), width: 1.w),
              // Outer border color and width
              borderRadius: BorderRadius.circular(
                  10.sp), // Optional: border radius to make it rounded
            ),
            padding: EdgeInsets.only(left: 15.w, right: 15.w),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _selectedLanguage,
                onChanged: (String? newValue) {
                  _selectedLanguage = newValue!;

                },
                items: _languages.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Container(
            // margin: EdgeInsets.symmetric(horizontal: 24.w),
            child: ElevatedButton(
              onPressed: () {
                Provider.of<LanguageProvider>(context, listen: false).changeLanguage();
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                    vertical: 8.h, horizontal: 12.w),
                backgroundColor: HexColor('#333333'),
                minimumSize: Size(double.infinity, 40.h),
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadiusDirectional.circular(50.sp)),
              ),
              child: Text(
                AppLocalizations.of(context)!.save,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10.sp,
                  fontFamily: 'BreeSerif',
                ),
              ),
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
      borderRadius: BorderRadius.circular(15.sp),
    );
  }
}
